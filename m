Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C3C96A03D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789265.1198840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUPH-0000Ql-BM; Tue, 03 Sep 2024 14:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789265.1198840; Tue, 03 Sep 2024 14:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUPH-0000Nt-8g; Tue, 03 Sep 2024 14:21:19 +0000
Received: by outflank-mailman (input) for mailman id 789265;
 Tue, 03 Sep 2024 14:21:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slUPG-0000Nm-2V
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:21:18 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c84da681-69ff-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 16:21:17 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-533488ffaebso6471030e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 07:21:17 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989009096sm684390666b.48.2024.09.03.07.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 07:21:15 -0700 (PDT)
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
X-Inumbo-ID: c84da681-69ff-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725373277; x=1725978077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m0vrGzVLJwiGTsQ+AVtumfycMAV1Vfth8x/3UA8syLs=;
        b=sVvLKYjxLWwA8ZTwPeDgf95RyolYNFl3g2dwpRgw7ROtb3E8m8aLILZfCGSNXqoIFz
         LQ1OvJuJQAnwNVeI4hbZhyUMcZ2zAyo2CG3lVoVm/ElmV/RUXMGe2ijLwW3xXM6vqglB
         KoqhjQZEeOn5NI9hAnGX3qFCGo9Gz9nYJSD0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373277; x=1725978077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0vrGzVLJwiGTsQ+AVtumfycMAV1Vfth8x/3UA8syLs=;
        b=AZPoFxtQf2vWOclypbtnLVYnOi8dOX5HEOQcubptLLnHhcgnDO20f3+bxBn/A7KlgX
         o75hP+cccyRsPQfy5iHAMnPH1UECCStw3uJo/E0dQqaWpgyNKU36QzjKTgYL8U9CpSO1
         2CaHUzHge9S88UKsMq1MYv4e3yi7KZeSDJ2p8FrR9L7Etbq9qWgSpdzNJdqbMrALYAB0
         +5DHGath305DymgiuwhHlPiR8jp0nLg40Sll7h/rcXQF4Ea+h4FIciQcLtQ77mZ8ToMg
         t2MNg1Q4z09Ig+oSTQigeZfy3VyCJTAvIxKYQjXTbAtGkOYB++lki3/rVjnHxpxdIDCC
         Dkmw==
X-Forwarded-Encrypted: i=1; AJvYcCW3JEbeZZREgeQS4RmdpLTXpNkIOxAilK+p9iem4nsS8VJaaRRiGuAWTDn1oVLHZDIo0RbDjpj/xEE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+s8fDMVIb4xN1P65DdKNYZz9Q6NlxsIMI7+0Q+6s7yJ5VlOG8
	o7ooOOJPEt5GzEzx+z1AjUoW7yvLxSH6w/2twflQzHGP2NMdQ/fqyyrX6DAzkPNB4YZt+aU+ZZq
	o
X-Google-Smtp-Source: AGHT+IHubw77Sw1F2bmtkfZB9Qwd1+liTdIh7dbrlW348JgN7P1t0HheLncLIvr6cDgyxb+Sck+xEw==
X-Received: by 2002:a05:6512:12c7:b0:533:4689:973c with SMTP id 2adb3069b0e04-53546b28914mr8717320e87.23.1725373276118;
        Tue, 03 Sep 2024 07:21:16 -0700 (PDT)
Message-ID: <577dea81-06a7-4ca3-9a22-e76c966b5dcf@citrix.com>
Date: Tue, 3 Sep 2024 15:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] xen/riscv: use {read,write}{b,w,l,q}_cpu() to
 define {read,write}_atomic()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <4b62d7e3faa24f6070430607262a3aed1bbf1861.1725295716.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4b62d7e3faa24f6070430607262a3aed1bbf1861.1725295716.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2024 6:01 pm, Oleksii Kurochko wrote:
> diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
> index 31b91a79c8..3c6bd86406 100644
> --- a/xen/arch/riscv/include/asm/atomic.h
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -31,21 +31,17 @@
>  
>  void __bad_atomic_size(void);
>  
> -/*
> - * Legacy from Linux kernel. For some reason they wanted to have ordered
> - * read/write access. Thereby read* is used instead of read*_cpu()
> - */
>  static always_inline void read_atomic_size(const volatile void *p,
>                                             void *res,
>                                             unsigned int size)
>  {
>      switch ( size )
>      {
> -    case 1: *(uint8_t *)res = readb(p); break;
> -    case 2: *(uint16_t *)res = readw(p); break;
> -    case 4: *(uint32_t *)res = readl(p); break;
> +    case 1: *(uint8_t *)res = readb_cpu(p); break;
> +    case 2: *(uint16_t *)res = readw_cpu(p); break;
> +    case 4: *(uint32_t *)res = readl_cpu(p); break;
>  #ifndef CONFIG_RISCV_32
> -    case 8: *(uint32_t *)res = readq(p); break;
> +    case 8: *(uint32_t *)res = readq_cpu(p); break;

This cast looks suspiciously like it's wrong already in staging...

~Andrew

