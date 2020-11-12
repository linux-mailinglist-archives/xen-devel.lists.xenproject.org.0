Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69E2B0152
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 09:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25552.53379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd8En-0000yu-G6; Thu, 12 Nov 2020 08:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25552.53379; Thu, 12 Nov 2020 08:45:49 +0000
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
	id 1kd8En-0000yV-CD; Thu, 12 Nov 2020 08:45:49 +0000
Received: by outflank-mailman (input) for mailman id 25552;
 Thu, 12 Nov 2020 08:45:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kd8El-0000yQ-Ta
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:45:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b0b4d1e-b984-4dbb-8d56-0307d0361a0c;
 Thu, 12 Nov 2020 08:45:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33C99ABCC;
 Thu, 12 Nov 2020 08:45:46 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kd8El-0000yQ-Ta
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:45:47 +0000
X-Inumbo-ID: 3b0b4d1e-b984-4dbb-8d56-0307d0361a0c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3b0b4d1e-b984-4dbb-8d56-0307d0361a0c;
	Thu, 12 Nov 2020 08:45:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605170746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QRCwYyPANFATSzVlviCvRFHicDrIgqCXcxGzuGrNEu8=;
	b=NfExwE9PLMPcmwWLUNnuNCK3INVfxk6jN63n4M/TRT4CrfcnW2J6zMtLFyOxNIFqW6rYuf
	qI88UtHuXIqo1fgfydi9dcp8mvBrDOAtntRPVwjSKIzctrqQy5vaIsDyksSvIVXBPuRHB8
	lgKCSXVRshYlJpW0dgmlffaNf40Q35U=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 33C99ABCC;
	Thu, 12 Nov 2020 08:45:46 +0000 (UTC)
Subject: Re: [PATCH 03/10] viridian: introduce a per-cpu hypercall_vpmask and
 accessor functions...
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-4-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <01c7747e-70d0-e32b-45a6-afc1688c1741@suse.com>
Date: Thu, 12 Nov 2020 09:45:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201111200721.30551-4-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.11.2020 21:07, Paul Durrant wrote:
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -507,15 +507,41 @@ void viridian_domain_deinit(struct domain *d)
>      XFREE(d->arch.hvm.viridian);
>  }
>  
> +struct hypercall_vpmask {
> +    DECLARE_BITMAP(mask, HVM_MAX_VCPUS);
> +};
> +
> +static DEFINE_PER_CPU(struct hypercall_vpmask, hypercall_vpmask);
> +
> +static void vpmask_empty(struct hypercall_vpmask *vpmask)

const?

> +{
> +    bitmap_zero(vpmask->mask, HVM_MAX_VCPUS);
> +}
> +
> +static void vpmask_set(struct hypercall_vpmask *vpmask, unsigned int vp)
> +{
> +    __set_bit(vp, vpmask->mask);

Perhaps assert vp in range here and ...

> +}
> +
> +static void vpmask_fill(struct hypercall_vpmask *vpmask)
> +{
> +    bitmap_fill(vpmask->mask, HVM_MAX_VCPUS);
> +}
> +
> +static bool vpmask_test(struct hypercall_vpmask *vpmask, unsigned int vp)
> +{
> +    return test_bit(vp, vpmask->mask);

... here?

This also wants const again.

> @@ -567,13 +594,29 @@ static int hvcall_flush(union hypercall_input *input,
>       * so err on the safe side.
>       */
>      if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS )
> -        input_params.vcpu_mask = ~0ul;
> +        vpmask_fill(vpmask);
> +    else
> +    {
> +        unsigned int vp;
> +
> +        vpmask_empty(vpmask);
> +        for (vp = 0; vp < 64; vp++)

Nit: Missing blanks.

> +        {
> +            if ( !input_params.vcpu_mask )
> +                break;
> +
> +            if ( input_params.vcpu_mask & 1 )
> +                vpmask_set(vpmask, vp);
> +
> +            input_params.vcpu_mask >>= 1;
> +        }

Wouldn't bitmap_zero() + bitmap_copy() (in a suitable wrapper)
be quite a bit cheaper a way to achieve the same effect?

Jan

