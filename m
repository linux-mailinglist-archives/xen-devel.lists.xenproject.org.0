Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AB37EF492
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 15:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635246.991122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zvi-0008KH-Ec; Fri, 17 Nov 2023 14:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635246.991122; Fri, 17 Nov 2023 14:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zvi-0008Hq-B7; Fri, 17 Nov 2023 14:34:46 +0000
Received: by outflank-mailman (input) for mailman id 635246;
 Fri, 17 Nov 2023 14:34:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tr9K=G6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r3zvg-0008HX-Ej
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 14:34:44 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 713299be-8556-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 15:34:40 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c72e275d96so26077631fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 06:34:40 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m10-20020a7bca4a000000b00407b93d8085sm7139249wml.27.2023.11.17.06.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 06:34:40 -0800 (PST)
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
X-Inumbo-ID: 713299be-8556-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700231680; x=1700836480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CY/pi3Djg8if4RZwtBEw4XhNitJSV6v1GBF0zQaOehk=;
        b=H46ctutqFVKqkvUQ73knDDqJX2inHHWKbRjvMUvZ7xRPrRkq+/Q+yrebH0ZviFi9b3
         wnA1zxviL6VsSTsRdfnz3LimYOyVwQ8Kd8Y6O/E/GZQ1eH1IKtg2zzY18eylbBBLwV8U
         vZfRSYZQgqD+x6KNQE0eFhEedKXZEHjS33Cak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700231680; x=1700836480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CY/pi3Djg8if4RZwtBEw4XhNitJSV6v1GBF0zQaOehk=;
        b=ST1KMLjchXvanYBDq7wDdZLCbpDgMUgYV2Q+6yGLpTLDwwuCAbhmJPd5+whnldTZ7x
         QhxDox9p6n5G9jcpGkn5qQbwp6V98VwgKNEslsZpnGcjkEr97dSbUPffJsA500+1TXPX
         Te8L9gfv+z/1W66N/xuXgNxaLEyh8MW+Lw9VcsEfFlcGT/tHFRAx5KS3SkQzP9lNADjs
         iAB3IwtvU4+dPnmLNjdSZNYWsaH2rVJNwdPjRefHuv/0DDXMuXIEvn4tuyU/0Q+AqPpf
         JsR+wa4ez6depTC90QyD79Jh9jNWnaEU87A1AVsuMxvCtO3RsXxFq1xeCzVL8xiV/Ey0
         GBzA==
X-Gm-Message-State: AOJu0YwHAyH9qBONlCV5zIUPhjJK3jZSEQqvQXblo5Q4LpeJQDhYuxtl
	vVxI3kJGMYjIGWquUNsqp7+Hmw==
X-Google-Smtp-Source: AGHT+IFUgtL4k7MIyP/a3iPIRsWjBw3vpq09970aW+K4XuHW2xrpbDsEjBWCH+BQJyIwah5NWqyrDg==
X-Received: by 2002:a2e:9bcb:0:b0:2c8:323b:9207 with SMTP id w11-20020a2e9bcb000000b002c8323b9207mr8651950ljj.11.1700231680377;
        Fri, 17 Nov 2023 06:34:40 -0800 (PST)
Message-ID: <9279ccae-bb40-4835-87a2-6aadd7ae4495@citrix.com>
Date: Fri, 17 Nov 2023 14:34:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/iommu: use a rangeset for hwdom setup
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-4-roger.pau@citrix.com>
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
In-Reply-To: <20231117094749.81091-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/11/2023 9:47 am, Roger Pau Monne wrote:
> The current loop that iterates from 0 to the maximum RAM address in order to
> setup the IOMMU mappings is highly inefficient, and it will get worse as the
> amount of RAM increases.  It's also not accounting for any reserved regions
> past the last RAM address.
>
> Instead of iterating over memory addresses, iterate over the memory map regions
> and use a rangeset in order to keep track of which ranges need to be identity
> mapped in the hardware domain physical address space.
>
> On an AMD EPYC 7452 with 512GiB of RAM, the time to execute
> arch_iommu_hwdom_init() in nanoseconds is:
>
> x old
> + new
>     N           Min           Max        Median           Avg        Stddev
> x   5 2.2364154e+10  2.338244e+10 2.2474685e+10 2.2622409e+10 4.2949869e+08
> +   5       1025012       1033036       1026188     1028276.2     3623.1194
> Difference at 95.0% confidence
> 	-2.26214e+10 +/- 4.42931e+08
> 	-99.9955% +/- 9.05152e-05%
> 	(Student's t, pooled s = 3.03701e+08)
>
> Execution time of arch_iommu_hwdom_init() goes down from ~22s to ~0.001s.
>
> Note there's a change for HVM domains (ie: PVH dom0) that get switched to
> create the p2m mappings using map_mmio_regions() instead of
> p2m_add_identity_entry(), so that ranges can be mapped with a single function
> call if possible.  Note that the interface of map_mmio_regions() doesn't
> allow creating read-only mappings, but so far there are no such mappings
> created for PVH dom0 in arch_iommu_hwdom_init().
>
> No change intended in the resulting mappings that a hardware domain gets.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Very nice numbers.  And yes - straight line performance like this (good
or bad) is all about the innermost loop.

Sadly, the patch diff is horrible to read.  Patch 2 remaining in common
code will improve this a little, but probably not very much.

If there are no better ideas, it's probably best to split into 3
patches, being:

1) Introduce new rangeset forms of existing operations
2) Rewrite arch_iommu_hwdom_init() to use rangesets
3) Delete old mfn forms

That at least means that the new and the old forms aren't expressed as a
delta against each-other.

~Andrew

