Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1093AEF8C5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 14:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029720.1403459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWaF6-0007FU-Eu; Tue, 01 Jul 2025 12:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029720.1403459; Tue, 01 Jul 2025 12:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWaF6-0007CZ-Bc; Tue, 01 Jul 2025 12:37:44 +0000
Received: by outflank-mailman (input) for mailman id 1029720;
 Tue, 01 Jul 2025 12:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qecy=ZO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uWaF4-0007CT-Mx
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 12:37:42 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2da1522a-5678-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 14:37:41 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso27429245e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 05:37:41 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5963csm13162698f8f.79.2025.07.01.05.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 05:37:40 -0700 (PDT)
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
X-Inumbo-ID: 2da1522a-5678-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751373460; x=1751978260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pxhkpn+yeK8A2hSQo0Yh1kMYwspVjQvVP43k7arwwww=;
        b=SvnuMbVXZ+lkoKePiF3xA9F/YTkxOY7YjjzzvekhQQjSjQ7FZbw8HpbAC2n5PiPWma
         JlMLqN3tXIdmR06WwxJuHSZ3gunZ0/pSzg9iZY+yUzx7JleDG0O0Pfqx+pIJlF0NeSzS
         YIkWfMOAN8cDnpGOQGcu7e5oIbU10lwN9O0ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373460; x=1751978260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxhkpn+yeK8A2hSQo0Yh1kMYwspVjQvVP43k7arwwww=;
        b=KGO82ssao3aczPYOjbsjbmVXmGiKgSppcn5zZDH8WLLxoTq5JK1uTJ+evtu724qD6v
         TLxiKJb8CmxCI71KbtzGGezp9AAhXkVTJJ5Qz+Ypk5ukuvTiVSE3elF0/pRoihafEzaH
         zzpoPmyEeNJzy0bguVcEgavVRQrWF+HXuK5of63Y8pJmsv7Xwi539QT6TamMF+AWrYFs
         7YIEuj8WZ3i5ppILMBEpZkaQ6hCWLaTPmMtIZ7Z9gGlVLMaBIZs/nTWIXih/YbSyYGor
         wCkwSMkfvWpoeWni0REbW/XPXOBz+LeS9z3JnbGluW9vqG06oMO9BGHF4yhNNL+ePz7r
         EWIg==
X-Forwarded-Encrypted: i=1; AJvYcCW8TczFFWinK9epBaX1iTufXbHzIEJtRmNgK2L+EhkYzFrhGeuMP1neypO/w4jUX/Obpl8vMwnfq68=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLHFGG0BH+nBsbwI/gVn66moVJE8Ubtsss9EqfSHd6LUeb8aX9
	sIkbSPPGF3rzjWGLWZhdJ/bIK6ITJFAHIoSRROVxRRTOP9w3zoXt8UH0bNmUT2G1lw4eW9yuJzi
	MKasar5hVrA==
X-Gm-Gg: ASbGnctD/SMkv20n3Dyikfp6DJIJ41X9SJYno98ot/5xGQs/jTg5eC1osR80qKlOyXK
	mY+ndUXS/eWfKwGFiMEh75sl3kRj+3CzpIui84MOWJeEQmMmiS4GitHG3xAsbK12PCFfduBQIUb
	bBiq2dAwdTmM1DCEL9tagU0CRt+z2BDEcFEYmM4ZGiRsYvParW3kToOi/svcB6cWgMXJW/Du4Hl
	TaNpao6qw3jPW9M5DIg2zzzYLZ4LmMNplL+NWNDoivjacUoQu9rT7Ofg3fEdOflqGhFRAMXNK22
	4CH65SaFKkk4s2XdPgI2A/iW7T2eNpXDfXyL1QP/LlyfFKIZm2hkqLQKYZ4kPiLvtS1TnkGG9jf
	/9qSQr+BEAQwx1qLWPQRZgrO4iTo=
X-Google-Smtp-Source: AGHT+IGBIxirJUznbk7HiGS+V7SVWhkrtvwtA0t99MItvTlD7mByjTcjIsJS9cQ6AiXEeG0Lwuhfmg==
X-Received: by 2002:a05:600c:8712:b0:453:86cc:739c with SMTP id 5b1f17b1804b1-4539188f383mr148796085e9.1.1751373460416;
        Tue, 01 Jul 2025 05:37:40 -0700 (PDT)
Message-ID: <9a744438-f2d3-4181-9b0b-903cdfb0773e@citrix.com>
Date: Tue, 1 Jul 2025 13:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix handling of leaf 0x80000021
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250701105307.705964-1-andrew.cooper3@citrix.com>
 <d88b5a27-0bdf-48b2-b55b-ca66add9f78a@suse.com>
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
In-Reply-To: <d88b5a27-0bdf-48b2-b55b-ca66add9f78a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/07/2025 1:11 pm, Jan Beulich wrote:
> On 01.07.2025 12:53, Andrew Cooper wrote:
>> When support was originally introduced, ebx, ecx and edx were reserved and
>> should have been zeroed in recalculate_misc() to avoid leaking into guests.
>>
>> Since then, fields have been added into ebx.  Guests can't load microcode, so
>> shouldn't see ucode_size, and while in principle we do want to support larger
>> RAP sizes in guests, virtualising this for guests depends on AMD procuding any
>> official documentation for ERAPS, which is long overdue and with no ETA.
>>
>> This patch will cause a difference in guests on Zen5 CPUs, but as the main
>> ERAPS feature is hidden, guests should be ignoring the rap_size field too.
>>
>> Fixes: e9b4fe263649 ("x86/cpuid: support LFENCE always serialising CPUID bit")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> I notice I have similar omissions in the respective AVX10.2 and KL patches.

The handling is clearly fragile.  I reviewed e9b4fe263649 and failed to
spot it.

I think it will be better when we're not having Xen fix up behind the
back of an unwitting toolstack.  At least then we'll have all the logic
in libx86 and can unit test it properly with real policies.

Until then, I think we'll just have to stay vigilant.

~Andrew

