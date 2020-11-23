Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79532C0D80
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:31:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34475.65571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCrk-000055-50; Mon, 23 Nov 2020 14:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34475.65571; Mon, 23 Nov 2020 14:30:52 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCrk-0008WH-1l; Mon, 23 Nov 2020 14:30:52 +0000
Received: by outflank-mailman (input) for mailman id 34475;
 Mon, 23 Nov 2020 14:30:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCrh-0008Vw-MU
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:30:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 895ee0fe-0416-4462-8814-7929f6e73c74;
 Mon, 23 Nov 2020 14:30:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D3ADACD5;
 Mon, 23 Nov 2020 14:30:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCrh-0008Vw-MU
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:30:49 +0000
X-Inumbo-ID: 895ee0fe-0416-4462-8814-7929f6e73c74
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 895ee0fe-0416-4462-8814-7929f6e73c74;
	Mon, 23 Nov 2020 14:30:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606141848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x6t5Vob9tcf8+2MIVaNLOirct/IJx1acn361i7fk3Us=;
	b=Lc2vFDkXPjVOUok7Qeipvlor9wheCJ+8XYn2vpwjBGTFlMY45vzTswNzZuz2KC12cbVDQL
	gp5vkxqIWNA5nPhun32M3l7/lHFOSpAmWcZavIoQIsrkXcTyYYEm4+4n2uzaWlDwrYPAnv
	PygbW5FTcotpqDzpo7sHnHPiPAgok/I=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4D3ADACD5;
	Mon, 23 Nov 2020 14:30:48 +0000 (UTC)
Subject: [PATCH v2 08/17] x86/xstate: avoid accounting for unsupported
 components
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <8794fa5b-a584-44af-9cba-a2641779a427@suse.com>
Date: Mon, 23 Nov 2020 15:30:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no point in including unsupported components in the size
calculations of xstate_{alloc,update}_save_area().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -501,8 +501,12 @@ int xstate_alloc_save_area(struct vcpu *
         unsigned int i;
 
         for ( size = 0, i = 2; i < xstate_features; ++i )
+        {
+            if ( !(xfeature_mask & (1ul << i)) )
+                continue;
             if ( size < xstate_size(i) )
                 size = xstate_size(i);
+        }
         size += XSTATE_AREA_MIN_SIZE;
     }
 
@@ -544,6 +548,8 @@ int xstate_update_save_area(struct vcpu
 
     for ( size = old = XSTATE_AREA_MIN_SIZE, i = 2; i < xstate_features; ++i )
     {
+        if ( !(xfeature_mask & (1ul << i)) )
+            continue;
         if ( xcr0_max & (1ul << i) )
             size = max(size, xstate_offset(i) + xstate_size(i));
         if ( v->arch.xcr0_accum & (1ul << i) )


