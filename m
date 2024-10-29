Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED19B45F6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 10:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827175.1241702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ipy-0006Ip-0S; Tue, 29 Oct 2024 09:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827175.1241702; Tue, 29 Oct 2024 09:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ipx-0006GR-Ti; Tue, 29 Oct 2024 09:48:29 +0000
Received: by outflank-mailman (input) for mailman id 827175;
 Tue, 29 Oct 2024 09:48:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGhd=RZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5ipw-0006GL-Pd
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 09:48:28 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2b1e3aa-95da-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 10:48:27 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so44841761fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 02:48:27 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b5797c3sm169064675e9.40.2024.10.29.02.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 02:48:26 -0700 (PDT)
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
X-Inumbo-ID: f2b1e3aa-95da-11ef-a0c3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730195307; x=1730800107; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aFBVhf3Ydfe5S+z1pZ6ubHFPTBV9komyUYJo07Q/2W0=;
        b=hQjY0x6tIDscpUDpBReaJGjnKFszFQ/xn00y4UTSPon81eXVXyj//gpVn4qaoPbSbx
         LyNO//Sdp1B3NYXHPJskgeXCEWJVThoySCTfOOYZhWazI7q6oiAZ0SCgJx4Zm2m/mPEj
         yJlFaWWkU4DBc2irQqhyY4Ybb0PWxBs+xNmHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730195307; x=1730800107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFBVhf3Ydfe5S+z1pZ6ubHFPTBV9komyUYJo07Q/2W0=;
        b=rJdwWch+cpcDjKjkojjNhNPwRuq2bTdb5t5DqaeTnIgpGqXF72Qmy38fiQ2OXjLbrU
         3K7hDEtOnUBBTF5jpIK/w+Xoxtd17usQHmeh8NvyNtkJ0fpRQGugJeydUWGJ2tOe7m1a
         l0UDMuEOMz97lZybkd5u/tAkjljokRkmfqWxDERpmELRJ7pShiMNinz7LBIXM868ki1B
         vrkMTib+ml53vMUOm/DM8Q+o2FYKqwteKv0XUKcO51qNulZbt5YsyYzk/9jHJoYuoMk+
         gFE5vhGp8E6uG8O8uo0O6A/cXc5a4lt0ip18GWrFDz3IiERdzKE+2AJIIfLOzNHzSyOf
         xDuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTsyuVW/hh1wfllmYOEgF5x7APVBZF/MySIGFVnPC9aIWg73/x5E8EXrHJaZHv2LvjlBj7h6L3iNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkHsT41Imm8ZCdHpskZvZAKVti6UO7qaimDYGkO4WPMdAf3tSA
	Go1eJioLlTzRbHlNWSf0QMDXQ3AciKo7L1IeUtxvKX1oGofxHRMDrYMY5ffAv18=
X-Google-Smtp-Source: AGHT+IFJhPMv2vSSMQCot6OwES5zK1i5MOpQ0wcx65LT8lk29cSMoxjo23aCRDPoVU0txn8lmm/SDg==
X-Received: by 2002:a2e:a99e:0:b0:2fb:5a7e:504c with SMTP id 38308e7fff4ca-2fcbdfae76bmr49952301fa.13.1730195307354;
        Tue, 29 Oct 2024 02:48:27 -0700 (PDT)
Message-ID: <36f09f1a-4a0d-4dbf-a529-c4923349628f@citrix.com>
Date: Tue, 29 Oct 2024 09:48:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: gate setting per-domain slot to XPTI being active
 for the domain
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20241029094254.38659-1-roger.pau@citrix.com>
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
In-Reply-To: <20241029094254.38659-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/10/2024 9:42 am, Roger Pau Monne wrote:
> It's possible to have XPTI not active for all PV domains (active for domUs,
> inactive for dom0), hence don't gate setting the per-domain slot on the
> presence of the per-pCPU shadow root page-table.  Instead set the slot based on
> whether XPTI is active for the domain.  This avoid pointlessly setting the
> per-domain slot if the shadow root page-table won't be used by the domain.
>
> Fixes: 0d3e7f0b6bf0 ('xen/x86: support per-domain flag for xpti')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/domain.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 78a13e6812c9..fd6bb3663027 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1902,12 +1902,11 @@ void cf_check paravirt_ctxt_switch_from(struct vcpu *v)
>  
>  void cf_check paravirt_ctxt_switch_to(struct vcpu *v)
>  {
> -    root_pgentry_t *root_pgt = this_cpu(root_pgt);
> +    const struct domain *d = v->domain;
>  
> -    if ( root_pgt )
> -        root_pgt[root_table_offset(PERDOMAIN_VIRT_START)] =
> -            l4e_from_page(v->domain->arch.perdomain_l3_pg,
> -                          __PAGE_HYPERVISOR_RW);
> +    if ( d->arch.pv.xpti )
> +        this_cpu(root_pgt)[root_table_offset(PERDOMAIN_VIRT_START)] =
> +            l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);

I'm not sure this is a wise change.

You're only optimising away a single PTE calculation/write, at the cost
of retaining a mapping to the wrong domain's perdom area; whichever the
last domain to schedule on this pCPU was.

~Andrew

