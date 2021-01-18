Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09C2FA440
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:13:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69715.124934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WDa-0000fu-LD; Mon, 18 Jan 2021 15:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69715.124934; Mon, 18 Jan 2021 15:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WDa-0000fV-HZ; Mon, 18 Jan 2021 15:13:22 +0000
Received: by outflank-mailman (input) for mailman id 69715;
 Mon, 18 Jan 2021 15:13:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1WDZ-0000fP-QR
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:13:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1afc66f8-64cc-465a-b473-ab29be218baa;
 Mon, 18 Jan 2021 15:13:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C19ADB956;
 Mon, 18 Jan 2021 15:13:19 +0000 (UTC)
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
X-Inumbo-ID: 1afc66f8-64cc-465a-b473-ab29be218baa
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610982799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHsWxvDnjDchMTeV/uloXHqmKLwuDuaKUDMz1s/rKOY=;
	b=E3ZJPS+6rKeZJa1LdzK57u39mYSVWf1KiCy/StmEJpDUPAxoTj8seUC/V63H+DcW2u4w+x
	ERUUd0Ek1K0MyZ3XDrInNX/ce8tXe+QLWfmmTHbVThU8hd2ubB2pn0f6eTi7FvHDKH0lET
	tpBSk/VUuX+LwPg0VHFxB2PG+dN35IA=
Subject: Re: [PATCH] xen/decompress: make helper symbols static
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
 <b073d60c-9eb1-a161-8419-a0dfa11b4c91@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b9f6447d-2677-030c-31c3-ed741be62dcc@suse.com>
Date: Mon, 18 Jan 2021 16:13:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <b073d60c-9eb1-a161-8419-a0dfa11b4c91@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.01.2021 12:58, Andrew Cooper wrote:
> On 18/01/2021 11:19, Jan Beulich wrote:
>> The individual decompression CUs need to only surface their top level
>> functions to other code. Arrange for everything else to be static, to
>> make sure no undue uses of that code exist or will appear without
>> explicitly noticing. (In some cases this also results in code size
>> reduction, but since this is all init-only code this probably doesn't
>> matter very much.)
>>
>> In the LZO case also take the opportunity and convert u8 where lines
>> get touched anyway.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The downside is that the top level functions will now be non-static
>> in stubdom builds of libxenguest, but I think that's acceptable.
> 
> Yeah - not something to lose sleep over.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, but this actually breaks the stubdom build, which now sees
non-static function definitions without prior declaration, which
with -Werror results in the build to fail. There's this extra hunk
now which addresses this:

--- unstable.orig/tools/libs/guest/xg_dom_decompress_unsafe.h
+++ unstable/tools/libs/guest/xg_dom_decompress_unsafe.h
@@ -1,8 +1,12 @@
+#ifdef __MINIOS__
+# include "../../xen/include/xen/decompress.h"
+#else
 typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
                           int (*fill)(void*, unsigned int),
                           int (*flush)(void*, unsigned int),
                           unsigned char *outbuf, unsigned int *posp,
                           void (*error)(const char *x));
+#endif
 
 int xc_dom_decompress_unsafe(
     decompress_fn fn, struct xc_dom_image *dom, void **blob, size_t *size)

i.e. strictly speaking I may then also need a tools side ack.

> but I really would
> like to see the STATIC and INIT defines disappear eventually.

I too would like to, but I don't see this happen in particular
for INIT and INITDATA, when we have two distinct environments
where this code gets built. Unless you envision the tool stack /
stubdom side of the build to gain

#define __init
#define __initdata

? As far as STATIC goes, being in the middle of the DomU side
work of this, I've found a need to sprinkle around quite a
few of them in zstd/decompress.c, again to silence similar
compiler diagnostics.

Jan

