Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016559ACEFA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 17:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824758.1238935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3dQ5-0002nh-GF; Wed, 23 Oct 2024 15:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824758.1238935; Wed, 23 Oct 2024 15:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3dQ5-0002l4-D6; Wed, 23 Oct 2024 15:37:09 +0000
Received: by outflank-mailman (input) for mailman id 824758;
 Wed, 23 Oct 2024 15:37:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJ8W=RT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3dQ4-0002kx-5n
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 15:37:08 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8a3a1d0-9154-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 17:37:06 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a0472306cso935783766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 08:37:06 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a9155a1c9sm491160966b.129.2024.10.23.08.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 08:37:05 -0700 (PDT)
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
X-Inumbo-ID: a8a3a1d0-9154-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729697826; x=1730302626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/LLGF7zfAQ7nHYxoXky2IwZp9CiOwRFLNQ/OJ6fgNcE=;
        b=JF1vo3PMqUaJJwzpxODfyG+2lPAmoy1pBM0Sx9SrgRXrYbPOj7VAstmWImtkqQ8XxA
         uabubgNNH/qDaNMF3NeRpVsCw2I4nVOuk2ZIMEc943IlHjyzRe5ymdcXwGzVvPRehamK
         7D5TQYLE5ovNT9sdFtJXj94QVFfs/uCBuD51Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697826; x=1730302626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LLGF7zfAQ7nHYxoXky2IwZp9CiOwRFLNQ/OJ6fgNcE=;
        b=cUp7bIcjyLaehcvQHaAg80JY1k0hDI7kUNu5cbNnuZGwiu71iTma9Nge9YLwaibemb
         owVuFwoSCl2Jb98zW435bzOawRAqeQ8Ue4WEkNekKKXzKxnb+IHyFXGIoHpzcym1fCOC
         3PM0BZBM2PweczgYB0y7neKOfwLdCk2vtvETg2K383stMrd+hl1z79/Qnlavyk2zrfF7
         R56aYUrqoGe31dHfjP36f2R1ty846ha/08E3t0kA6jK9ZIdKIdg4x46BOiaqIhAecpzB
         f53W53wnSd9/lQGzMvFt2SQUarVaYOOFbgWAPT8GqkUkdxbVS6PDTyyFKMp1RcJKqPxt
         Mtpw==
X-Forwarded-Encrypted: i=1; AJvYcCUwSy/BfCpOMDgkjVXYalKow32OhxCVKbBOjnxLXV2GfcLlc37LDWYoawJVIHZHaP0vONw1AcO0r0w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyyf/+7gMWNhrdxPILKNS2GoF54F2jXvc1XqK3yTJQ8L7yhU3Ei
	A6n4vhvaOC56rlBOZwMHusbCoE0Q765PvXHGvRUMOjqc3b4gbGdQvh9Io1VfFQw=
X-Google-Smtp-Source: AGHT+IHav3rBzqupp9YxgctInmEKUthWRSihOlGG1vNMRluZY6IO6TE8vJt2bZkUV5LNBRMJJK7CuQ==
X-Received: by 2002:a17:907:72cf:b0:a99:cedd:4612 with SMTP id a640c23a62f3a-a9abf8938ffmr255687966b.22.1729697825969;
        Wed, 23 Oct 2024 08:37:05 -0700 (PDT)
Message-ID: <e604a851-b5a1-4288-8f6e-3f4216bd132f@citrix.com>
Date: Wed, 23 Oct 2024 16:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/3] x86/boot: Remove the mbi_p parameter from
 __start_xen()
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
 <20241023144448.731688-1-andrew.cooper3@citrix.com>
 <21218409-5506-4321-be8c-d044ba758b7c@apertussolutions.com>
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
In-Reply-To: <21218409-5506-4321-be8c-d044ba758b7c@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/10/2024 3:58 pm, Daniel P. Smith wrote:
> On 10/23/24 10:44, Andrew Cooper wrote:
>> The use of physical addresses in __start_xen() has proved to be
>> fertile soure
>> of bugs.
>>
>> The MB1/2 path stashes the MBI pointer in multiboot_ptr (a setup.c
>> variable
>> even), then re-loads it immediately before calling __start_xen(). 
>> For this,
>> we can just drop the function parameter and read multiboot_ptr in the
>> one
>> place it's used.
>>
>> The EFI path also passes this parameter into __start_xen().  Have the
>> EFI path
>> set up multiboot_ptr too, and move the explanation of phyiscal-mode
>> pointers.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>
> For EFI:
> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>
> For remainder:
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Thanks.  That's usually just R-by then.

In Xen, we take A-by to mean "sure, whatever", and R-by to mean "I've
looked at this in detail and think it's good".

R-by implies A-by, and either are fine from a maintainership point of view.

~Andrew

