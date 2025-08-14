Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0479B26481
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 13:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081545.1441616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umWLU-0000OT-Pc; Thu, 14 Aug 2025 11:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081545.1441616; Thu, 14 Aug 2025 11:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umWLU-0000Lq-Md; Thu, 14 Aug 2025 11:42:12 +0000
Received: by outflank-mailman (input) for mailman id 1081545;
 Thu, 14 Aug 2025 11:42:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umWLS-0000Kc-JJ
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 11:42:10 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5ca7beb-7903-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 13:42:09 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b9dc55d84bso595301f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 04:42:09 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8f5d7deaasm29868346f8f.65.2025.08.14.04.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 04:42:08 -0700 (PDT)
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
X-Inumbo-ID: b5ca7beb-7903-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755171728; x=1755776528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6mfN40EV8vHDy+a4aXhDtcf6NNcD0Hn/rA0LwcdFQdg=;
        b=c69CKlkowbelXiyA1nVno6MYz2LDSHjN+J8S/f5T9YPw4S2vmAJNB7AYs13fHqxRcK
         nZRjA/2c5cqMeVvzDjWmOIXMeAxyf91oJFY6EpBIVPMEaAvog6DyplPcKzZI89nXOzZq
         wXSeBrjcw0mBR7Oz1bWYa21JntwBosqDXoT38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755171728; x=1755776528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mfN40EV8vHDy+a4aXhDtcf6NNcD0Hn/rA0LwcdFQdg=;
        b=PPS2MeSvoAt6cCkRdxvcm2rCJHIekHKrgsccpJeH1YHL0G/d9qLSEiuidxXuwpBcsH
         uL9tDkb1nI2akUEIh3/joBgMzGyA2Kr5Q5nggspktCFXbCAwy8SO8yRlS2viqzBtXyD5
         a2UsHnDF2djYVLEBVgFh8OCmNFK9LldQWWOpbpWiH+Gw93t6ejJ1NEEzg217h2HWer3u
         EhxC63eNLrez62k2ETeVNF/CzgnfU3Jt4J2d6iiybbmrMyN7mmsXkqG2dVkyg6U3zH4n
         O6WsY0i5pI1xlwWA0zZW18+dO5SFSw1R9WmoDN2YhQzbhxfaSwyV+gK89vEtWzGvFMhr
         hIRg==
X-Forwarded-Encrypted: i=1; AJvYcCUMg2ThPPEkPLYqFyycdxkHTz0X+pufes85iBhzYR+hzV6bscnKOwFErc/v3M/R29KJJhNaLbE8h30=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWb6uyMZdlna5fYRK1g1keNIuph7oB80rA9gmBk5IIGYSIExf1
	TbpBMn9e2CxeVHc7WSnekEa/7YJd7X/rkKI3kCfnIEbbSTyrdP5pGxyyTvzpHrHCcuo=
X-Gm-Gg: ASbGnctwRqd6Upweo2UMd8Ln2Okh9jVVCcg1SjLZFZ33xcZXf/42kji+3fGD9OGYQQF
	hT6+xCmgralM9TgULYLGYrYGqN1xBCSK4X1grjdHCw7ormdbsByzxhCmRz9JPpQ+qUKB+HKk8c2
	pKiVLb4ea7Qf/I4HbLb4ca/POEVWIsGT4d9fvYN4BdKmfg6TlijpWod2bqD8dc5SHQtYsJ/8kIX
	z8+GSwxlB2743ZreuKqdqJ+1RtmfawOlmY6ASJwuHkp/cjMdqejaksMluPZeexCG9hKgyfSouAe
	u+lpBNzF9BR97KoocSAW9Dx/zLQynUesHsEv8wwX2zRj1WEYG5Bd+C5iij94nVTGlE0Gkxjh4e0
	QcXYxQEgTZ6IgJwBMKOCTKsmjivyUhVLTa+Mz3FWVqSPR+fnuUKNbZ6Xb2Gb01DxpSSbx
X-Google-Smtp-Source: AGHT+IFwKB9DDpe139fQr/il9j0mCTPiBugojF+LKS2Z2HHO4hoP3sXfFc55Fxds2NeYeHZePYuSHQ==
X-Received: by 2002:a05:6000:420a:b0:3b9:1d32:cf4a with SMTP id ffacd0b85a97d-3b9edf65310mr2563367f8f.44.1755171728485;
        Thu, 14 Aug 2025 04:42:08 -0700 (PDT)
Message-ID: <9cc46920-b1a6-4085-8481-abf0f1cd0aab@citrix.com>
Date: Thu, 14 Aug 2025 12:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86: FRED enumerations
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
 <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
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
In-Reply-To: <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2025 12:20 pm, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> Of note, CR4.FRED is bit 32 and cannot enabled outside of 64bit mode.
>>
>> Most supported toolchains don't understand the FRED instructions yet.  ERETU
>> and ERETS are easy to wrap (they encoded as REPZ/REPNE CLAC), while LKGS is
>> more complicated and deferred for now.
>>
>> I have intentionally named the FRED MSRs differently to the spec.  In the
>> spec, the stack pointer names alias the TSS fields of the same name, despite
>> very different semantics.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>> --- a/xen/arch/x86/include/asm/x86-defns.h
>> +++ b/xen/arch/x86/include/asm/x86-defns.h
>> @@ -75,6 +75,7 @@
>>  #define X86_CR4_PKE        0x00400000 /* enable PKE */
>>  #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
>>  #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
>> +#define X86_CR4_FRED      0x100000000 /* Fast Return and Event Delivery */
> ... a UL suffix added here for Misra.

I was surprised, but Eclair is entirely fine with this.

~Andrew

