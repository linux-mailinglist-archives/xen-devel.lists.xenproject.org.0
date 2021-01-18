Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0EA2FA5CB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 17:15:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69860.125194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1XBZ-0000tv-5E; Mon, 18 Jan 2021 16:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69860.125194; Mon, 18 Jan 2021 16:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1XBZ-0000ta-2F; Mon, 18 Jan 2021 16:15:21 +0000
Received: by outflank-mailman (input) for mailman id 69860;
 Mon, 18 Jan 2021 16:15:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1XBY-0000tV-2a
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:15:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89d9ff22-8d69-424a-b253-84974a1ffd9f;
 Mon, 18 Jan 2021 16:15:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D903ABDA;
 Mon, 18 Jan 2021 16:15:18 +0000 (UTC)
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
X-Inumbo-ID: 89d9ff22-8d69-424a-b253-84974a1ffd9f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610986518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXMMFzytqUczQylCg6//eashCcJ0+p/Z+abzMQ9glP0=;
	b=g5FeQS1erYcrUZ6xbWwviuoLwlvosunxWB750YAJU1nXTOoyNEFH6LK8t7H+T47JkdoI2X
	aGSCVwuqx/Qtc2FRtvoP+WyJ6j2loCF9en2NyvBhPol5bV7hVYT+z9KTspvbiQgPbQxZBX
	5Bz+xv8oCC+jAc0j3Ganbgwmg5/B2nI=
Subject: Re: [PATCH] xen/decompress: make helper symbols static
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
 <24581.45760.653861.613333@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9d77a189-de10-b4e2-c118-580121d797a9@suse.com>
Date: Mon, 18 Jan 2021 17:15:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24581.45760.653861.613333@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.01.2021 17:09, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH] xen/decompress: make helper symbols static"):
>> The individual decompression CUs need to only surface their top level
>> functions to other code. Arrange for everything else to be static, to
>> make sure no undue uses of that code exist or will appear without
>> explicitly noticing. (In some cases this also results in code size
>> reduction, but since this is all init-only code this probably doesn't
>> matter very much.)
>>
>> In the LZO case also take the opportunity and convert u8 where lines
>> get touched anyway.
> 
> AFAICT, this patch
> 
> * was first posted after the last posting date for Xen 4.15.
> * is not a bugfix.
> 
> In which case it has missed 4.15.
> 
> Please correct me if you think I am wrong.

You aren't, and I don't view this as a big problem - its more of
an aid to be sure no bad (unintended) references exist (Arm's
unhelpful re-use of xz's CRC32 function triggered the change). I
can surely hold this back until 4.16 opens, hoping it won't
collide with the zstd decompression work I'm now doing on the
DomU side (lack which, if you agree with Andrew's assessment, is
more a bug fix than a feature addition).

But yes - I will need to remind myself to filter what is eligible
for committing, from now on until the branch point.

Jan

