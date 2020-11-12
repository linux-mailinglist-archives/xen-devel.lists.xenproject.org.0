Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089A2B01E2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 10:20:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25579.53429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd8l7-0004NY-5T; Thu, 12 Nov 2020 09:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25579.53429; Thu, 12 Nov 2020 09:19:13 +0000
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
	id 1kd8l7-0004NC-2L; Thu, 12 Nov 2020 09:19:13 +0000
Received: by outflank-mailman (input) for mailman id 25579;
 Thu, 12 Nov 2020 09:19:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kd8l5-0004N7-Vw
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:19:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0ce09ef-d003-417e-a37d-68226d539bb3;
 Thu, 12 Nov 2020 09:19:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61A75AE63;
 Thu, 12 Nov 2020 09:19:09 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kd8l5-0004N7-Vw
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:19:12 +0000
X-Inumbo-ID: e0ce09ef-d003-417e-a37d-68226d539bb3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e0ce09ef-d003-417e-a37d-68226d539bb3;
	Thu, 12 Nov 2020 09:19:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605172749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=THVK7YJvyekPziTrS0KK+/aNAHFbZzt2KVExjj9El6E=;
	b=CHexR3QHU2gVtD/oRNcF4EQl3K2PeFEdLzxVwMrmjtlIBMmzkyWCtchBvEWf8C9lbmk5UM
	QcfU9PBk+l5NUXyZeuiiGmRDxGM2SvASvBxJnRv7gefWKVQYwPfxoYdHJmW8s0/dYefWUn
	CzVoCOFWEpbk9QfMP1FGx7DXjM79lTU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 61A75AE63;
	Thu, 12 Nov 2020 09:19:09 +0000 (UTC)
Subject: Re: [PATCH 06/10] viridian: add ExProcessorMasks variants of the
 flush hypercalls
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-7-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dd6c4a0d-f611-7b81-8c95-72786891f311@suse.com>
Date: Thu, 12 Nov 2020 10:19:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201111200721.30551-7-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.11.2020 21:07, Paul Durrant wrote:
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -553,6 +553,83 @@ static unsigned int vpmask_next(struct hypercall_vpmask *vpmask, unsigned int vp
>  	     (vp) < HVM_MAX_VCPUS; \
>  	     (vp) = vpmask_next(vpmask, vp))
>  
> +struct hypercall_vpset {
> +        struct hv_vpset set;
> +        uint64_t __bank_contents[64];

gcc documents this to be supported as an extension; did you check
clang supports this, too? (I'd also prefer if the leading
underscores could be dropped, but as you know I'm not the maintainer
of this code.)

> +static unsigned int hv_vpset_nr_banks(struct hv_vpset *vpset)
> +{
> +    uint64_t bank_mask;
> +    unsigned int nr = 0;
> +
> +    for ( bank_mask = vpset->valid_bank_mask; bank_mask; bank_mask >>= 1 )
> +        if ( bank_mask & 1 )
> +            nr++;
> +
> +    return nr;
> +}

Simply use hweight64()?

> +static uint16_t hv_vpset_to_vpmask(struct hv_vpset *set, size_t size,
> +                                   struct hypercall_vpmask *vpmask)
> +{
> +    switch ( set->format )
> +    {
> +    case HV_GENERIC_SET_ALL:
> +        vpmask_fill(vpmask);
> +        return 0;
> +
> +    case HV_GENERIC_SET_SPARSE_4K:
> +    {
> +        uint64_t bank_mask;
> +        unsigned int bank = 0, vp = 0;
> +
> +        vpmask_empty(vpmask);
> +        for ( bank_mask = set->valid_bank_mask; bank_mask; bank_mask >>= 1 )
> +        {
> +            /* Make sure we won't dereference past the end of the array */
> +            if ( (void *)(set->bank_contents + bank) >=
> +                 (void *)set + size )
> +            {
> +                ASSERT_UNREACHABLE();
> +                return -EINVAL;
> +            }

Doesn't this come too late? I.e. don't you want to check instead
(or also) that you won't overrun the space when copying in from
the guest? And for the specific purpose here, doesn't it come too
early, as you won't access any memory when the low bit of bank_mask
isn't set?

Jan

