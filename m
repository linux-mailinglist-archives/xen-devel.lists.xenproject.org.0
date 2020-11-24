Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49FC2C2D81
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 17:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36592.68554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khbbe-00048R-Aj; Tue, 24 Nov 2020 16:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36592.68554; Tue, 24 Nov 2020 16:55:54 +0000
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
	id 1khbbe-000482-7G; Tue, 24 Nov 2020 16:55:54 +0000
Received: by outflank-mailman (input) for mailman id 36592;
 Tue, 24 Nov 2020 16:55:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khbbc-00047x-Dg
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 16:55:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7fe34b5-944a-4837-b013-ae874e18f264;
 Tue, 24 Nov 2020 16:55:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A94EAC77;
 Tue, 24 Nov 2020 16:55:50 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khbbc-00047x-Dg
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 16:55:52 +0000
X-Inumbo-ID: c7fe34b5-944a-4837-b013-ae874e18f264
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c7fe34b5-944a-4837-b013-ae874e18f264;
	Tue, 24 Nov 2020 16:55:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606236950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ufwAhUrq/oOi8AfhpClhMYTGxOOsopGr05vHJJZQ93o=;
	b=lnjdMv0GXFoaIdP5g911w7kldh0cp6BlW+1aWwErtxGT35dJwpyDptFHoLiF4nH7HiqpEI
	flDkw9akTG6LoVIY57WC9tT0Mr4zRcSk1fftSI25PdQH4Lq0ckSHURA80jFrU4Tw4hfXk+
	fs+PAlLyqFo3HNKosUEbJyipwaS8Nrg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4A94EAC77;
	Tue, 24 Nov 2020 16:55:50 +0000 (UTC)
Subject: Re: [PATCH v2 08/12] viridian: add ExProcessorMasks variants of the
 flush hypercalls
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201120094900.1489-1-paul@xen.org>
 <20201120094900.1489-9-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b8d71bc-5f6d-b458-e0fc-2a2f0d29ddd8@suse.com>
Date: Tue, 24 Nov 2020 17:55:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120094900.1489-9-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 10:48, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The Microsoft Hypervisor TLFS specifies variants of the already implemented
> HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST hypercalls that take a 'Virtual
> Processor Set' as an argument rather than a simple 64-bit mask.
> 
> This patch adds a new hvcall_flush_ex() function to implement these
> (HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST_EX) hypercalls. This makes use of
> new helper functions, hv_vpset_nr_banks() and hv_vpset_to_vpmask(), to
> determine the size of the Virtual Processor Set (so it can be copied from
> guest memory) and parse it into hypercall_vpmask (respectively).
> 
> NOTE: A guest should not yet issue these hypercalls as 'ExProcessorMasks'
>       support needs to be advertised via CPUID. This will be done in a
>       subsequent patch.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Just a couple of cosmetic remarks, apart from them this looks
good to me, albeit some of the size calculations are quite,
well, involved. I guess like with most parts if this series,
in the end Wei will need to give his ack.

> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -576,6 +576,70 @@ static unsigned int vpmask_nr(const struct hypercall_vpmask *vpmask)
>      return bitmap_weight(vpmask->mask, HVM_MAX_VCPUS);
>  }
>  
> +#define HV_VPSET_BANK_SIZE \
> +    sizeof_field(struct hv_vpset, bank_contents[0])
> +
> +#define HV_VPSET_SIZE(banks)   \
> +    (sizeof(struct hv_vpset) + (banks * HV_VPSET_BANK_SIZE))

Personally I think this would be better done using
offsetof(struct hv_vpset, bank_contents), but you're the maintainer.
However, "banks" wants parenthesizing, just in case.

> +#define HV_VPSET_MAX_BANKS \
> +    (sizeof_field(struct hv_vpset, valid_bank_mask) * 8)
> +
> +struct hypercall_vpset {
> +    union {
> +        struct hv_vpset set;
> +        uint8_t pad[HV_VPSET_SIZE(HV_VPSET_MAX_BANKS)];
> +    };
> +};

A struct with just a union as member could be expressed as a simple
union - any reason you prefer the slightly more involved variant?

> +static DEFINE_PER_CPU(struct hypercall_vpset, hypercall_vpset);
> +
> +static unsigned int hv_vpset_nr_banks(struct hv_vpset *vpset)
> +{
> +    return hweight64(vpset->valid_bank_mask);
> +}
> +
> +static uint16_t hv_vpset_to_vpmask(struct hv_vpset *set,

const?

> @@ -656,6 +720,78 @@ static int hvcall_flush(union hypercall_input *input,
>      return 0;
>  }
>  
> +static int hvcall_flush_ex(union hypercall_input *input,

const again?

> +                           union hypercall_output *output,
> +                           unsigned long input_params_gpa,
> +                           unsigned long output_params_gpa)

Mainly for cosmetic reasons and to be in sync with
hvm_copy_from_guest_phys()'s respective parameter, perhaps both
would better be paddr_t?

Jan

