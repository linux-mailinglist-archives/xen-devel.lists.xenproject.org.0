Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAAB366E91
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114783.218798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEGt-0007rH-6w; Wed, 21 Apr 2021 14:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114783.218798; Wed, 21 Apr 2021 14:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEGs-0007qh-WA; Wed, 21 Apr 2021 14:56:06 +0000
Received: by outflank-mailman (input) for mailman id 114783;
 Wed, 21 Apr 2021 14:56:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZEGr-0007qX-K6
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:56:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8511cc5-5931-4b24-a74b-bace21e8a439;
 Wed, 21 Apr 2021 14:56:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB6ACB4D6;
 Wed, 21 Apr 2021 14:56:03 +0000 (UTC)
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
X-Inumbo-ID: a8511cc5-5931-4b24-a74b-bace21e8a439
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619016964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dn8xizhAj6dt285tHoUKq6uKJm2JGhL8Ej0gFCwHguo=;
	b=MFnylNO45EvnvRMzxksM5Fj45ojdxak99ir226m0Ju+/3yvh6yz0UsCVdKEE6fcy3yRZ76
	/rJNBrC4FS+iqh2KstFVCIJ4jY8H4wsTijEUAp9XmnKJujciIV6ZeZxvWxzzGYAF/xdxqt
	HbhqV09TBt5LgFr+8NrCfib/zBiaePw=
Subject: [PATCH v2 1/8] x86/MCE: avoid effectively open-coding xmalloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Message-ID: <631d4b11-cfc5-c609-6169-28ba08aa978c@suse.com>
Date: Wed, 21 Apr 2021 16:56:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xmalloc_bytes() forces
SMP_CACHE_BYTES alignment. But if code really cared about such higher
than default alignment, it should request so explicitly rather than
using a type-unsafe interface. And if e.g. cache line sharing was a
concern, the allocator itself should arrange to avoid such.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mctelem.c
+++ b/xen/arch/x86/cpu/mcheck/mctelem.c
@@ -345,7 +345,7 @@ void __init mctelem_init(unsigned int da
 
 	if ((mctctl.mctc_elems = xmalloc_array(struct mctelem_ent,
 	    MC_NENT)) == NULL ||
-	    (datarr = xmalloc_bytes(MC_NENT * datasz)) == NULL) {
+	    (datarr = xmalloc_array(char, MC_NENT * datasz)) == NULL) {
 		xfree(mctctl.mctc_elems);
 		printk("Allocations for MCA telemetry failed\n");
 		return;


