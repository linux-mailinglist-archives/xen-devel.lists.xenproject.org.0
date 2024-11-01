Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC669B8FF4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 12:06:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829035.1244116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6pTc-0001sM-0l; Fri, 01 Nov 2024 11:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829035.1244116; Fri, 01 Nov 2024 11:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6pTb-0001pd-Tw; Fri, 01 Nov 2024 11:05:59 +0000
Received: by outflank-mailman (input) for mailman id 829035;
 Fri, 01 Nov 2024 11:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=76Nm=R4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6pTZ-0001p3-S2
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 11:05:57 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 420e1f2e-9841-11ef-99a3-01e77a169b0f;
 Fri, 01 Nov 2024 12:05:52 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a2cdc6f0cso251909266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 04:05:52 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e56493f15sm168350666b.44.2024.11.01.04.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 04:05:51 -0700 (PDT)
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
X-Inumbo-ID: 420e1f2e-9841-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQyMGUxZjJlLTk4NDEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDU5MTUyLjE5MzI2MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730459151; x=1731063951; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eQjPaE1mTfWP+OjpRP6bHQcoFDkWnpjhgBhuEvN2NXc=;
        b=o1VIx9PoyY+dr5qVaedLytfGFgytzTkJvdSzcM7DGXYODm5zitlKiBAT106pzqPyWP
         c8jLmX8G8uZEopSOw9R2kyEBD+0zf0n6x2dmIjYH81I6AaA9J+Lw/9w+/InK2NcqZWLS
         FbwcXJOGOEWqQk7kmIf07Fd3zJy0a01EEiE98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730459151; x=1731063951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQjPaE1mTfWP+OjpRP6bHQcoFDkWnpjhgBhuEvN2NXc=;
        b=J2nVdyyDHmBR/yORIOS6sdR4KoalY41qiGj/nQ1ysztSDkJNJ6yUdzUGIq8t6UlGs9
         orTGn54UiMT4gyb1DXODWB6muR9L1vS3UMhSvtDpbvn9J2Ag9hRD8S4f7Wc4YlM61xB1
         MIFcIIZvhJ5dczz5cClGraRS++rGid2Mxc193JPIAm/aY+1nafQ4u0/lxp5eEnPdgxJm
         4QFxusT1fJkzjtjJpg6SyU68ecwBw7X7L2UPfHmL/+vYp4QLPXAyUBf5u6w/THkKOHqo
         tmVBLy7r7C2OfS6RcxRziDhcsTBLZ/AAHD58lATIulrIbfipUKg1wi7jEomDnuUzRQER
         RD+g==
X-Forwarded-Encrypted: i=1; AJvYcCWenv7EGXHK6MgEn3GmRgaqmSRL9baD6VqJvPXgTS/b5KuuW9vY0qpdnSCcRTkWh6UpAbl/OQa55nY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaKbgscwcmgk48XJwXxK17AJH6KH1nBfCBh9u/he6EDfV2Zw/v
	n9GMBrw02k+KRNe+x6OEftfkjzIIgaHjydqIlfe11sy+apugM90yXeDf0FMIQOM=
X-Google-Smtp-Source: AGHT+IEo30U6mCw4rhMQMZSt2+5xgdex8tUlvm2rqoAK+kscbA6Wi57FUCrbJ4bpBLV67o5p/QPHhA==
X-Received: by 2002:a17:907:a088:b0:a99:499f:4cb7 with SMTP id a640c23a62f3a-a9e508e002dmr548658166b.23.1730459151532;
        Fri, 01 Nov 2024 04:05:51 -0700 (PDT)
Message-ID: <93715b7e-d968-4526-96c5-497a7a1f9dfa@citrix.com>
Date: Fri, 1 Nov 2024 11:05:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] xen/arm: ffa: Introduce VM to VM support
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
References: <cover.1729069025.git.bertrand.marquis@arm.com>
 <0475e48ace0acd862224e7ff628d11db94392871.1729069025.git.bertrand.marquis@arm.com>
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
In-Reply-To: <0475e48ace0acd862224e7ff628d11db94392871.1729069025.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/10/2024 10:21 am, Bertrand Marquis wrote:
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
> index fde187dba4e5..d699a267cc76 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -77,7 +77,21 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
>      };
>      uint32_t src_size, dst_size;
>      void *dst_buf;
> -    uint32_t ffa_sp_count = 0;
> +    uint32_t ffa_vm_count = 0, ffa_sp_count = 0;
> +#ifdef CONFIG_FFA_VM_TO_VM
> +    struct domain *dom;
> +
> +    /* Count the number of VM with FF-A support */
> +    rcu_read_lock(&domlist_read_lock);
> +    for_each_domain( dom )
> +    {
> +        struct ffa_ctx *vm = dom->arch.tee;
> +
> +        if (dom != d && vm != NULL && vm->guest_vers != 0)
> +            ffa_vm_count++;
> +    }
> +    rcu_read_unlock(&domlist_read_lock);
> +#endif

...
struct domain *dom;

if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
{
    /* Count the number of VM with FF-A support */
    rcu_read_lock(&domlist_read_lock);
    ...
    rcu_read_unlock(&domlist_read_lock);
}

drops the explicit ifdef.  Hiding function-level variable declarations
behind an ifdef like that works exactly once, and it doesn't make
pleasant code.

~Andrew

