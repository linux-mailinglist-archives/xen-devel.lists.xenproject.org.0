Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193F47F38F6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 23:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638292.994706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Yv7-0004hx-QE; Tue, 21 Nov 2023 22:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638292.994706; Tue, 21 Nov 2023 22:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Yv7-0004fZ-NX; Tue, 21 Nov 2023 22:08:37 +0000
Received: by outflank-mailman (input) for mailman id 638292;
 Tue, 21 Nov 2023 22:08:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qy+O=HC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5Yv6-0004fT-GX
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 22:08:36 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 838bccdf-88ba-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 23:08:34 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32f7abbb8b4so4099619f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 14:08:34 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a5d61c1000000b00332cb8fd5b7sm5215018wrv.67.2023.11.21.14.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 14:08:33 -0800 (PST)
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
X-Inumbo-ID: 838bccdf-88ba-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700604514; x=1701209314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wDL9htsDHeynmoWH0epGZfnNAXUKOakCP+zQcrx4kyA=;
        b=tX0FFuZ1v1TRwp8tqntdEnoZqyfRqpFIEnROFzvjvjmiRiN2IMTvA+bK1fEs7Sqe+s
         WyKMPe38uJ2/QMosUZAd53ZRN6vLLvMzFtv8TZZzalv/tJ0+s65F/7Vs/9XSu/C6kmHL
         tIdK7HLKhzXDPrjgFs4xCVy2Yf8DKkX4cwgeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700604514; x=1701209314;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDL9htsDHeynmoWH0epGZfnNAXUKOakCP+zQcrx4kyA=;
        b=sVmoLaG363F+OIejMiM2sRXB94YNO24+8AXHzgqO9ijBX9U0+CFmaNJbEO7IhCMMG0
         um7FxzshlOj3cdYcsTM0+wPiVDvsLIqZJL9GH05aiMONO06iOL3aVn0sE0wCLcyOr+Px
         88CP/1O0wDxpFZLZUNTpJcKprnXrG/+0jtFGNzNzSYot+EWQiehQ8vHfnhN8a40qSmH/
         FiJuqSNGD+chNb4VD8BEO82nGvxhIzg+Iri6vRZcGJs/125HphHyV1yOsVbFyF+P+hqD
         fe/mzDnkHgTUqWaDigJH3uZhMFOWjMDh78jRPxtT1v2oWtm3qRu6/4qsEouqHTkOcOV1
         FZiw==
X-Gm-Message-State: AOJu0Yy5x2m+s0xGcIX8KMGlnREN/EjgqqE7HhiXmArlCs7roUl6VkjX
	vkjImWkyqrpvddYKUBYpVaFreg==
X-Google-Smtp-Source: AGHT+IEEq4HfYuNmsRLPlylf3BgAgNV5aBNs3ckXNmiPm2jfd4JoMRIeBmA9qRtjIiM3mFAMPFPjKA==
X-Received: by 2002:adf:f70f:0:b0:331:6c7a:73f with SMTP id r15-20020adff70f000000b003316c7a073fmr123441wrp.17.1700604514345;
        Tue, 21 Nov 2023 14:08:34 -0800 (PST)
Message-ID: <62939263-5492-491b-8077-984ab3707800@citrix.com>
Date: Tue, 21 Nov 2023 22:08:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/HVM: split restore state checking from state
 loading
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
 <822a6328-36d3-43e9-9fc4-36d01a6b9ef2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <822a6328-36d3-43e9-9fc4-36d01a6b9ef2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/11/2023 1:46 pm, Jan Beulich wrote:
> ..., at least as reasonably feasible without making a check hook
> mandatory (in particular strict vs relaxed/zero-extend length checking
> can't be done early this way).
>
> Note that only one of the two uses of hvm_load() is accompanied with
> hvm_check(). The other directly consumes hvm_save() output, which ought
> to be well-formed. This means that while input data related checks don't
> need repeating in the "load" function when already done by the "check"
> one (albeit assertions to this effect may be desirable), domain state
> related checks (e.g. has_xyz(d)) will be required in both places.
>
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Do we really need all the copying involved in use of _hvm_read_entry()
> (backing hvm_load_entry()? Zero-extending loads are likely easier to
> handle that way, but for strict loads all we gain is a reduced risk of
> unaligned accesses (compared to simply pointing into h->data[]).

Pointless copying is best avoided, but it would mean that we either need
to enforce proper alignment within the buffer (hard, but at least it's
page aligned to start with), or __pack all of the structures so they get
an alignment of 1.

Not that I expect things to break in practice, but UB is UB and in some
copious free time it might be nice to re-activate the unaligned checking
in UBSAN on x86.

> Would the hvm_sr_handlers[] better use array_access_nospec()?

It's control plane only, and we have speculative protections for domU
entering domctls much earlier.  I wouldn't worry.

> --- a/xen/arch/x86/hvm/save.c
> +++ b/xen/arch/x86/hvm/save.c
> @@ -291,9 +369,8 @@ int hvm_load(struct domain *d, hvm_domai
>      if ( !hdr )
>          return -ENODATA;
>  
> -    rc = arch_hvm_load(d, hdr);
> -    if ( rc )
> -        return rc;
> +    ASSERT(!arch_hvm_check(d, hdr));

You're normally the proponent of not having side effects in ASSERT()s
like this.

But our caller did this anyway, so why re-assert it here?

~Andrew

