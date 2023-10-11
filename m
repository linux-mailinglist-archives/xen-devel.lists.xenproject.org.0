Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F337C598A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 18:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615559.956873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqcNq-00065K-BQ; Wed, 11 Oct 2023 16:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615559.956873; Wed, 11 Oct 2023 16:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqcNq-00063e-8Y; Wed, 11 Oct 2023 16:48:30 +0000
Received: by outflank-mailman (input) for mailman id 615559;
 Wed, 11 Oct 2023 16:48:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH0+=FZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qqcNo-000638-Jl
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 16:48:28 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffed2a68-6855-11ee-98d4-6d05b1d4d9a1;
 Wed, 11 Oct 2023 18:48:27 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c296e6543fso88176711fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Oct 2023 09:48:27 -0700 (PDT)
Received: from [0.0.0.0] ([2001:41d0:8:52b7::])
 by smtp.gmail.com with ESMTPSA id
 q27-20020a05620a039b00b007757eb88172sm5370815qkm.21.2023.10.11.09.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 09:48:26 -0700 (PDT)
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
X-Inumbo-ID: ffed2a68-6855-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697042906; x=1697647706; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ceoI1sTR3pRmfE/RaxQckdQ+apnIEv8XYOouIIgthgc=;
        b=vWqfU06BRYRhDdOQtc1rfa5/aR0fMkCM/vR8FHFXzkrLa9AFZyN6GKnRxPDHWKT9nb
         nX2UH+6ovJHPkEhumc7iC3mjtZAerqIw0JaGBRnIHlhr1OScxKkJ+fphJPYMdzY2/I+K
         trwMnAf3YWPafD69SJ1FsPspXD4Zipfczdb1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697042906; x=1697647706;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ceoI1sTR3pRmfE/RaxQckdQ+apnIEv8XYOouIIgthgc=;
        b=M2BpJo5Icj12d/o25c5VJDD2T5W7GdQmuiPObjQ08MzTOG5ow54446WX1fO6MgS1Em
         K2W5RzazrBKdNhkpQFZGgKI/oA3+K0gBuj3g9RNnBj6sLMjbav/7iqzAMx/W4gblhNqa
         TDySQH/Do+iriaoJyke1NgTkblppVIrqLJWm//+S3l3mN8dBLHtZtei57W6+npwToalk
         G9FdZGyhI1cwley0bcBYGUlBIre8s5n5VYb4VtRAKvWeYzweBaHf/b4R/3+78WxzpoVR
         IphOGiHu1UETzF8YEkHb2ghbeLkQB7FYlC27RQKMHklWJkjqQptu1iq46Ezoj2pYSPE5
         ifvw==
X-Gm-Message-State: AOJu0YycCNQ3CUL3zWzxRjNrDx2gc7wB5/oJ598P8cRkQJtBdZeq6Ta3
	oXqEPB0UjtZM1WajOoaMJmpEHA==
X-Google-Smtp-Source: AGHT+IGMeO2feXd8rf0Uwq9x5awP9rouVSen+EhPnchbalo3fTBUUKkYvwtP7EXpGRLjruS0/EcD4Q==
X-Received: by 2002:a2e:830c:0:b0:2c0:33be:3530 with SMTP id a12-20020a2e830c000000b002c033be3530mr16452496ljh.45.1697042906519;
        Wed, 11 Oct 2023 09:48:26 -0700 (PDT)
Message-ID: <75e8aca0-1e2f-4c19-9fee-20bb4e4ae00f@citrix.com>
Date: Thu, 12 Oct 2023 00:48:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pvh: fix identity mapping of low 1MB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20231011153756.16714-1-roger.pau@citrix.com>
Content-Language: en-GB
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
In-Reply-To: <20231011153756.16714-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/2023 11:37 pm, Roger Pau Monne wrote:
> The mapping of memory regions below the 1MB mark was all done by the PVH dom0
> builder code, thus completely avoiding that region in the arch-specific IOMMU
> hardware domain initialization code.

This took a while to parse.  I think it would be clearer to say "builder
code, causing the region to be avoided by the arch ..."

>   That lead to the IOMMU being enabled
> without reserved regions in the low 1MB identity mapped in the p2m for PVH
> hardware domains.  Firmware with missing RMRR/IVMD ranges that would otherwise
> be located in the low 1MB would transiently trigger IOMMU faults until the p2m
> is populated by the PVH dom0 builder:

"Firmware which happens to be missing RMRR/IVMD ranges describing E820
reserved regions in the low 1MB would ..." ?

> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0
>
> Mostly remove the special handling of the low 1MB done by the PVH dom0 builder,
> leaving just the data copy between RAM regions.  Otherwise rely on the IOMMU
> arch init code to create any identity mappings for reserved regions in such
> range (like it already does for all reserved regions).

"in such ranges", or in this case "in that range" would be better.  Also
"for reserved regions elsewhere" IMO.

Just to confirm, we're saying our default treatment of identity mapping
e820 reserved regions into the IOMMU is masking (or not) a missing
RMRR/IVMD entry?

>
> Note there's a small difference in behavior, as holes in the low 1MB will no
> longer be identity mapped to the p2m.
>
> Fixes: 6b4f6a31ace1 ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I suppose you intended to mark this for 4.18 as you CC'd Henry, and also
send it for x86 (CC added)?

I'm tempted to commit it based on the diffstat alone.  How do we still
have so much junk code like this lying around breaking things...

Anyway - it's a clear improvement.

But a question first.  Is this from debugging the XSA-442 fallout?  If
so, it's probably worth mentioning the hardware we saw this on (which
IIRC was fairly old AMD), and that XSA-442 unmasked a pre-existing bug. 
And we think it's USB/PS2 emulation?

Thanks,

~Andrew

