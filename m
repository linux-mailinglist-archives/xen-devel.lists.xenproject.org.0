Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CB3BB390E
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 12:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135653.1472691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4GH0-0006xF-PD; Thu, 02 Oct 2025 10:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135653.1472691; Thu, 02 Oct 2025 10:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4GH0-0006vC-LI; Thu, 02 Oct 2025 10:10:54 +0000
Received: by outflank-mailman (input) for mailman id 1135653;
 Thu, 02 Oct 2025 10:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wm6k=4L=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4GGy-0006v6-Ky
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 10:10:52 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d961562-9f78-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 12:10:42 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso6126125e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 03:10:42 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e693c33adsm27780835e9.18.2025.10.02.03.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 03:10:41 -0700 (PDT)
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
X-Inumbo-ID: 0d961562-9f78-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759399842; x=1760004642; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SX70MRXuot5pEgYKSHwDFbwx/giw9TvoTe4PSOyB/Vo=;
        b=TvLSRbMCBd9kPm88XEADkYpSo+/xMDxP/hucm0tbXOKFav8V03JoJbB/PBzlq5MM2C
         UJj5mMf2x8FR6VoL0EBtytmQkix/uBWWewtxt1aWigUf5qu+KgTZOMuCqs5hovQoIDmn
         ZnJ4zwL0DxIXSk/ZJcw16Bmw8ZrOlCH9aqDMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399842; x=1760004642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SX70MRXuot5pEgYKSHwDFbwx/giw9TvoTe4PSOyB/Vo=;
        b=u4/uUWHl2QzElTZxkzB4+AcCCA96jatBnPyRgaotSYYr2Wp6yHtaTv66aSxSRLmHy8
         xtXBUTC8zW751C3xzoA1Q/jXK+5G4r/cygMPG/tuwYrtTCUtBBo/9jytwY1S/eKh0t49
         9x1t7lJyWuGqrX3t6Qgf2/hri/N/z5NLLdnQu5LtWwdQDXqm6e2BrDnVt3U+AJOTL9T6
         Kqs/nzf6QDyQFlmT3D5sAyLwDslbhGFGKwIcSB8a6ZSJZm3LPbyBImOamxGokB0ifxDr
         rrrl+3TPtAbXFyM+6LFZnM0VXnPqdjMWi2Jm28sUgm07dtj4lSqMZty+sb7r8NX6yGUV
         Lpvw==
X-Forwarded-Encrypted: i=1; AJvYcCWuu0+LFUiBru7xfmT+xEtJJWufiYw0ZRRDu6xNW5dx4aHPSFFpHqoG4ATcZAAmlz7L2lhXQ9ajL7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyxQnEkHTIktv+nqqfb6gtIrQgigsZhACY09dEhgZpBjM5LRco
	cCIaqUwJPO8NHVpLV+4BaNQ9/0ZXGmeVBM+S1iw4SAg6fHTHnKFxLpSRjUMv7lOBp6U=
X-Gm-Gg: ASbGnct89rD6+nHDNt3C4Yl0zEa8mXqR/6KS0FyrugA0IGuBK5jAw35wpKHFKk2zRum
	PCFybgv/V7fSYunsaLpXi+qYUj5bOMwWKc2gndj8SmZryDv2+g/cnKk0gvnhYwjwuVfYwv6iqXB
	M6jOWYdi9P0qTjgU5o5Ywy1imWxYoo7DA6P2X04/S9PMHO3wGPrJJzzZbIbDrqzIIQaQvazUfEg
	RjrkJnj93tWMoPekuHtkgBOMqbZ6eum33EL6419c1BDrLuFEWbtVovUI3VLy38JYlC46rI1tLVt
	+VO9D0hU2bhyDtM9eJjI3hvWyGbkXnPAcNosIuUt7+K92KZyhmGBWCm17IQG0mv0naIQdFTLBVD
	foce/agFwMrE6NY46WiwRVYj6w+XxfDFj0Qt9JpymhrFzleOa0Fm1KqDNcqfyHn71/DE2QCCcze
	//FgICaZla+FU2qzDNKHYeVSc=
X-Google-Smtp-Source: AGHT+IG5mN/ECU94sXxpbFy5HlmiJ6tsLxAw1zjNVLXaMBi7PfdsdgA9F+Opr29hT+JwDtihlyMBsA==
X-Received: by 2002:a05:600c:4511:b0:46e:394b:49b7 with SMTP id 5b1f17b1804b1-46e612e5d92mr53899655e9.37.1759399841616;
        Thu, 02 Oct 2025 03:10:41 -0700 (PDT)
Message-ID: <bf042eea-ed2d-431e-b1f0-7be0c09194ef@citrix.com>
Date: Thu, 2 Oct 2025 11:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: XEN_DOMCTL_get_address_size hypercall support
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <39511522aae7dab5766ef2ebfed1d13abec8610e.1759324344.git.milan_djokic@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <39511522aae7dab5766ef2ebfed1d13abec8610e.1759324344.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2025 9:01 pm, Milan Djokic wrote:
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>
> ---
> XEN_DOMCTL_get_address_size hypercall is not implemented for arm (only for x86)
> It would be useful to have this hypercall supported for arm64, in order to get
> current guest addressing mode and also to verify that XEN_DOMCTL_set_address_size
> performs switch to target addressing mode (instead of relying on its returned error code only).

Please don't copy this misfeature of x86 PV guests into ARM.

Letting domains be of variable bitness after domain create leads to a
whole lot of bugs, many security relevant.

32bit vs 64bit should be an input to domain_create(), not something that
is edited after the domain has been constructed.

> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
> index 8720d126c9..f227309e06 100644
> --- a/xen/arch/arm/arm64/domctl.c
> +++ b/xen/arch/arm/arm64/domctl.c
> @@ -33,6 +34,37 @@ static long switch_mode(struct domain *d, enum domain_type type)
>      return 0;
>  }
>  
> +static long get_address_size(struct domain *d, uint32_t *address_size)
> +{
> +    long rc = 0;
> +    struct vcpu *v;
> +    /* Check invalid arguments */
> +    if ( d == NULL || address_size == NULL) {
> +        rc = -EINVAL;
> +    }
> +    /* Domain structure type field and actual vcpu mode must be aligned */
> +    if(rc == 0) {
> +        for_each_vcpu(d, v) {
> +            if(vcpu_get_mode(v) != d->arch.type) {
> +                rc = -EFAULT;
> +            }
> +        }

This is deeply suspicious.

Under what circumstances can the vCPU setting be different from the
domain setting?

~Andrew

