Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D07431647E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83525.155638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nEo-0006Zz-8q; Wed, 10 Feb 2021 11:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83525.155638; Wed, 10 Feb 2021 11:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nEo-0006Za-5w; Wed, 10 Feb 2021 11:00:50 +0000
Received: by outflank-mailman (input) for mailman id 83525;
 Wed, 10 Feb 2021 11:00:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9nEm-0006ZS-QQ
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 11:00:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 000ce99c-82a2-49f7-890d-80d140094453;
 Wed, 10 Feb 2021 11:00:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37D0AAD6A;
 Wed, 10 Feb 2021 11:00:47 +0000 (UTC)
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
X-Inumbo-ID: 000ce99c-82a2-49f7-890d-80d140094453
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612954847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9TCsROEfoQjUpUcb/1udpcRlDuCQCbqIGHT1zT0HiI=;
	b=bKxh1EnSSHPsF2I5f8UVdb/BM/cXEjcEraLatdQnofV91E/tJp1XejcWCprcvjwJIWHFRn
	6cx+JeDfoN7E5pCttJzkkSatLMgihoyl4F5yEv4dIN33vneidI2Y9U/W4CDExTub09j12Q
	eIETTGN/DrhcWOvHe0veAQm64x0xwkA=
Subject: Re: [PATCH for-4.15] x86/ucode/amd: Fix OoB read in
 cpu_request_microcode()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210209234019.3827-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0cb0e48b-68d9-3de1-42e1-9a75ac2795d7@suse.com>
Date: Wed, 10 Feb 2021 12:00:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209234019.3827-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.02.2021 00:40, Andrew Cooper wrote:
> verify_patch_size() is a maximum size check, and doesn't have a minimum bound.
> 
> If the microcode container encodes a blob with a length less than 64 bytes,
> the subsequent calls to microcode_fits()/compare_header() may read off the end
> of the buffer.
> 
> Fixes: 4de936a38a ("x86/ucode/amd: Rework parsing logic in cpu_request_microcode()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -349,6 +349,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
>              if ( size < sizeof(*mc) ||
>                   (mc = buf)->type != UCODE_UCODE_TYPE ||
>                   size - sizeof(*mc) < mc->len ||
> +                 mc->len < sizeof(struct microcode_patch) ||

I was inclined to suggest to use <= here, but I guess a blob
with 1 byte of data is as bogus as one with 0 bytes of data.

Jan

