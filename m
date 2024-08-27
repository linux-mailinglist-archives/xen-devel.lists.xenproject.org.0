Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89918960B30
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 14:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783969.1193308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivn9-0000sh-4O; Tue, 27 Aug 2024 12:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783969.1193308; Tue, 27 Aug 2024 12:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivn9-0000r8-1V; Tue, 27 Aug 2024 12:59:23 +0000
Received: by outflank-mailman (input) for mailman id 783969;
 Tue, 27 Aug 2024 12:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sivn7-0000r2-VY
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 12:59:21 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d3f3c88-6474-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 14:59:21 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so82887666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 05:59:21 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54850b6sm107345366b.23.2024.08.27.05.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 05:59:19 -0700 (PDT)
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
X-Inumbo-ID: 2d3f3c88-6474-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724763560; x=1725368360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cvlNN94vkzG+IFoTEbK6gQ9Z93hiR62VCIYzk9adO40=;
        b=dq2CRjzNErtjpIvJ4BZYojQSEURXydScbCVkmne53CMfbn2nSltxuQtN4nh9SCPHKG
         TN0HaMK4ynqxyd4TQwuIeA/hDlZcXkIgT0ey3rl9TVgEfwLZjNOx01AR+hNZU/8xs34x
         EdLi97wVN2TPniILjbHqrjuunmLL2GhIy1Wpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724763560; x=1725368360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvlNN94vkzG+IFoTEbK6gQ9Z93hiR62VCIYzk9adO40=;
        b=uynP4wI7MCOpIFqHjbP3o34lFjN36zpaeeyQS+C/fFmYf0/O/rb4KP934iUAPMQ8Vs
         NBVKl9OKT0PODdCTxHCBYGJo0YxzY83fgqxcOsTZoRLBrAkWZ35R8oscEnZI51tnz5Zq
         N/yXVlmmJAqnf5XLuuzUmS+5VCsQPvVeM2NAGY9vGfddNzvzPj98cuyViTKa8mK3eQg4
         g2LtiPAEsdlS1I9M6jlHc/3u4uFLIuFWw1DusZhom2LGOzTNT61HIAuURIT1gv9lU3UX
         6mc6R/8Aiiat2uLe1pCjsNe1O95L6BTd/rsD6aaBEDnaW1WYH604GwtzqTPFjy3U7cTH
         Xf9A==
X-Forwarded-Encrypted: i=1; AJvYcCVWkK3moHefb/plERUDDdfOOVMEgIQXK42l9ksV1C1o95QvaKyocvVHaGbibiqmHnPDsGU5XQtXPwM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAx/RZA+qkZtgDj0Hy1aRo8QLGr++PDfA64GpjW3g0UZUjkttw
	yyQ1LIkI+tGfFrIxvSFcdsWl5ATNxE7hugrCbt/48D8GPDBkksNvKLBsmHrJH7AZwVDa57LNEl8
	k
X-Google-Smtp-Source: AGHT+IGWnf6l4KL7/z27eYW3x79xkdm3+VGwPA04thGtScErWKh+ztnuYcEHD9M/VcDF5eFIHvVXtw==
X-Received: by 2002:a17:907:7246:b0:a77:c6c4:2bb7 with SMTP id a640c23a62f3a-a86a5165450mr1064711966b.1.1724763560062;
        Tue, 27 Aug 2024 05:59:20 -0700 (PDT)
Message-ID: <734d41c3-709c-4286-8353-f5483b0987cb@citrix.com>
Date: Tue, 27 Aug 2024 13:59:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/dom0: disable SMAP for PV domain building only
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20240827123949.24400-1-roger.pau@citrix.com>
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
In-Reply-To: <20240827123949.24400-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2024 1:39 pm, Roger Pau Monne wrote:
> Move the logic that disables SMAP so it's only performed when building a PV
> dom0, PVH dom0 builder doesn't require disabling SMAP.
>
> The fixes tag is to account for the wrong usage of cpu_has_smap in
> create_dom0(), it should instead have used
> boot_cpu_has(X86_FEATURE_XEN_SMAP).  Fix while moving the logic to apply to PV
> only.
>
> While there also make cr4_pv32_mask __ro_after_init.
>
> Fixes: 493ab190e5b1 ('xen/sm{e, a}p: allow disabling sm{e, a}p for Xen itself')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v4:
>  - New approach, move the current logic so it's only applied when creating a PV
>    dom0.
> ---
>  xen/arch/x86/dom0_build.c        | 17 +++++++++++++++++
>  xen/arch/x86/include/asm/setup.h |  2 ++
>  xen/arch/x86/setup.c             | 19 +------------------
>  3 files changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 8d56705a0861..31c94b14bb06 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -612,7 +612,24 @@ int __init construct_dom0(struct domain *d, const module_t *image,
>      if ( is_hvm_domain(d) )
>          rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
>      else if ( is_pv_domain(d) )
> +    {
> +        /*
> +         * Temporarily clear SMAP in CR4 to allow user-accesses in
> +         * construct_dom0().  This saves a large number of corner cases
> +         * interactions with copy_from_user().
> +         */
> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> +        {
> +            cr4_pv32_mask &= ~X86_CR4_SMAP;
> +            write_cr4(read_cr4() & ~X86_CR4_SMAP);
> +        }
>          rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> +        {
> +            write_cr4(read_cr4() | X86_CR4_SMAP);
> +            cr4_pv32_mask |= X86_CR4_SMAP;
> +        }
> +    }

I hate to drag this on further still, but can this logic be move it into
dom0_construct_pv() itself, rather than here?

That way, it won't need moving again to make cr4_pv32_mask exist only in
PV32 builds.  (This step is somewhat tricky, so I'm not suggesting doing
it in this patch.)

~Andrew

