Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD7C2B0158
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 09:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25558.53391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd8IT-0001AX-0E; Thu, 12 Nov 2020 08:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25558.53391; Thu, 12 Nov 2020 08:49:36 +0000
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
	id 1kd8IS-0001A8-T5; Thu, 12 Nov 2020 08:49:36 +0000
Received: by outflank-mailman (input) for mailman id 25558;
 Thu, 12 Nov 2020 08:49:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kd8IR-0001A3-Tr
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:49:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e39b27df-e42f-449c-8ba9-fcd5ac637c51;
 Thu, 12 Nov 2020 08:49:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B0CEABCC;
 Thu, 12 Nov 2020 08:49:34 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kd8IR-0001A3-Tr
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:49:35 +0000
X-Inumbo-ID: e39b27df-e42f-449c-8ba9-fcd5ac637c51
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e39b27df-e42f-449c-8ba9-fcd5ac637c51;
	Thu, 12 Nov 2020 08:49:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605170974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SE7Ym9UkD6rPteXr8NUdV8uDoT5CG6+FuC5A7lvBV6M=;
	b=DmgoFPl2xsXU1re2PBv0URmrx5Mgz3W03SMmM7zngWMGjPowU1AAUheH6N84ClsEn8hjtT
	moLPzf6GKFUvC3GKFlDp56u+wzoavdBAI+Zn2vgO7N/kPX/GBEfAyWY+Ug4zAfoMJ4wAac
	W8RvPICtDgUoIGzdQPPGLoMQSMURLek=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1B0CEABCC;
	Thu, 12 Nov 2020 08:49:34 +0000 (UTC)
Subject: Re: [PATCH 04/10] viridian: use hypercall_vpmask in hvcall_ipi()
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-5-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e05cc16-c7b9-34a1-8862-a4e7d581189f@suse.com>
Date: Thu, 12 Nov 2020 09:49:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201111200721.30551-5-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.11.2020 21:07, Paul Durrant wrote:
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -533,6 +533,21 @@ static bool vpmask_test(struct hypercall_vpmask *vpmask, unsigned int vp)
>      return test_bit(vp, vpmask->mask);
>  }
>  
> +static unsigned int vpmask_first(struct hypercall_vpmask *vpmask)
> +{
> +    return find_first_bit(vpmask->mask, HVM_MAX_VCPUS);
> +}
> +
> +static unsigned int vpmask_next(struct hypercall_vpmask *vpmask, unsigned int vp)
> +{
> +    return find_next_bit(vpmask->mask, HVM_MAX_VCPUS, vp + 1);

Perhaps again assert on vp's range?

> +}
> +
> +#define for_each_vp(vpmask, vp) \
> +	for ((vp) = vpmask_first(vpmask); \
> +	     (vp) < HVM_MAX_VCPUS; \
> +	     (vp) = vpmask_next(vpmask, vp))

Nit again: Missing blanks here and ...

> @@ -669,17 +693,20 @@ static int hvcall_ipi(union hypercall_input *input,
>      if ( vector < 0x10 || vector > 0xff )
>          return -EINVAL;
>  
> -    for_each_vcpu ( currd, v )
> +    vpmask_empty(vpmask);
> +    for (vp = 0; vp < 64; vp++)

... here. I also wonder if the literal 64 couldn't be expressed in
some suitable way.

Jan

