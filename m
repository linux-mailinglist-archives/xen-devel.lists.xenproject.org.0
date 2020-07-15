Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13291220C7D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 13:56:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvg1p-0000cm-Ly; Wed, 15 Jul 2020 11:56:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvg1o-0000ce-97
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 11:56:48 +0000
X-Inumbo-ID: 428134fe-c692-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 428134fe-c692-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 11:56:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CEE4AC7D;
 Wed, 15 Jul 2020 11:56:50 +0000 (UTC)
Subject: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
Message-ID: <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
Date: Wed, 15 Jul 2020 13:56:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This was lost when making the logic accessible to PVH Dom0.

While doing so make the access to the global function pointer safe
against races (as noticed by Roger): The only current user wants to be
invoked just once (but can tolerate to be invoked multiple times),
zapping the pointer at that point.

Fixes: 835d8d69d96a ("x86/rtc: provide mediated access to RTC for PVH dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Latch pointer under lock.
v2: New.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1148,6 +1148,8 @@ void rtc_guest_write(unsigned int port,
 
     switch ( port )
     {
+        typeof(pv_rtc_handler) hook;
+
     case RTC_PORT(0):
         /*
          * All PV domains (and PVH dom0) are allowed to write to the latched
@@ -1160,6 +1162,14 @@ void rtc_guest_write(unsigned int port,
     case RTC_PORT(1):
         if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
             break;
+
+        spin_lock_irqsave(&rtc_lock, flags);
+        hook = pv_rtc_handler;
+        spin_unlock_irqrestore(&rtc_lock, flags);
+
+        if ( hook )
+            hook(currd->arch.cmos_idx & 0x7f, data);
+
         spin_lock_irqsave(&rtc_lock, flags);
         outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
         outb(data, RTC_PORT(1));


