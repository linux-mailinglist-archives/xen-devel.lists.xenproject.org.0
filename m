Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E621220921
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 11:47:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jve0V-0003Om-FR; Wed, 15 Jul 2020 09:47:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jve0T-0003Oh-ST
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 09:47:17 +0000
X-Inumbo-ID: 2b154376-c680-11ea-93a9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b154376-c680-11ea-93a9-12813bfff9fa;
 Wed, 15 Jul 2020 09:47:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEBEDAF0B;
 Wed, 15 Jul 2020 09:47:19 +0000 (UTC)
Subject: [PATCH v2 1/2] x86: restore pv_rtc_handler() invocation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <416ac9b1-93d1-81a2-be19-d58d509fdfec@suse.com>
Message-ID: <59f26856-d23d-bb69-0403-39e77acbf85c@suse.com>
Date: Wed, 15 Jul 2020 11:47:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <416ac9b1-93d1-81a2-be19-d58d509fdfec@suse.com>
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

Fixes: 835d8d69d96a ("x86/rtc: provide mediated access to RTC for PVH dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1160,6 +1160,10 @@ void rtc_guest_write(unsigned int port,
     case RTC_PORT(1):
         if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
             break;
+
+        if ( pv_rtc_handler )
+            pv_rtc_handler(currd->arch.cmos_idx & 0x7f, data);
+
         spin_lock_irqsave(&rtc_lock, flags);
         outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
         outb(data, RTC_PORT(1));


