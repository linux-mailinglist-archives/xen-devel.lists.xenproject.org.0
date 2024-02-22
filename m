Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350D8601C4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 19:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684522.1064426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdE24-0000i4-BC; Thu, 22 Feb 2024 18:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684522.1064426; Thu, 22 Feb 2024 18:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdE24-0000fY-72; Thu, 22 Feb 2024 18:42:56 +0000
Received: by outflank-mailman (input) for mailman id 684522;
 Thu, 22 Feb 2024 18:42:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gl4T=J7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rdE22-0000fQ-Rt
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 18:42:54 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f692a6b-d1b2-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 19:42:52 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a3e7ce7dac9so6392266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 10:42:52 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r16-20020a1709067fd000b00a3e88f99cf1sm4543829ejs.149.2024.02.22.10.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 10:42:51 -0800 (PST)
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
X-Inumbo-ID: 2f692a6b-d1b2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708627372; x=1709232172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5Cgx/f/+pUbHdT1JWXdvp//wDZx48ETdBnkDTXsdq0=;
        b=JjsaDPkfsHI0+ERgsZa5vNTFluDQAMf4/0x39HTDxCJ+YIrgsViMmnJh8NiHkTqHaU
         xDXXhmtzoC/sMoAnW42+LyY2EwIFBiLwEQUnYjwCR56cHDSM4xg7ue4nI5OiE7DJ4GK5
         3lzyJp/SAHifveqZsQRoCotLChsdJo+EXdFs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708627372; x=1709232172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5Cgx/f/+pUbHdT1JWXdvp//wDZx48ETdBnkDTXsdq0=;
        b=OLlhG4yST9f664VnR6h+vNZDNkaZ+HqdzIzZ+rRL9LzAYsX/WE3up2VJVIq+z3Z90G
         dH8MK8WdxnKARGCn1KK9raaonVS7tmDJdiRtKeWw1AofalaU5ltI6S93244q9AyAl5CX
         rpuxYM5FYn1hdbB+xIDgo5POgikmskpjA3wdbjt4bw5E2XdTik/E0BR6RcJhjn+0opZb
         8hYs+ObXJQDKRmjUS6/Ib+KubSjY9rWnT8vljaGq3gV1H+sCcWjXSTxTTFsfiUpCdYiP
         +wssbsCvv/aQ2NqnJQaj5Wh8prGMa2Su+JgRJTifDPeKBNtxdqwuMUOzY5sDdVnzSRl/
         pUtA==
X-Forwarded-Encrypted: i=1; AJvYcCVyTxMg6/P7z2F7tq0Fu9NE7nThclb3rPZjbLQXalwdls2meo5v1ltWCJOe5lJhzjQuIDvKXfc6QM0lNDpk5hbILp4aN3teCTKf1LENGyg=
X-Gm-Message-State: AOJu0Yx/kpAnr7tTriHrgm9Lzxkw7W2tbN/Kxlp8glOpEUXCuj5hBLJ2
	JoCnhTzRKYeqrwxCeqGPY/SnikJhYLli8sQKjjNgP5XVX6C2TubIQSq+4PNWDpU=
X-Google-Smtp-Source: AGHT+IHgUigpyW/1rngs2gZGSzdDDPpLnRBIrRtPYyw0t2kYl0KgQiAAQvPSte/H7lECfO7NVz4vZg==
X-Received: by 2002:a17:906:1148:b0:a3f:986c:3c3 with SMTP id i8-20020a170906114800b00a3f986c03c3mr1500669eja.40.1708627372175;
        Thu, 22 Feb 2024 10:42:52 -0800 (PST)
Message-ID: <06fba67f-17d0-41f5-bcf0-d31a42acfc3f@citrix.com>
Date: Thu, 22 Feb 2024 18:42:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/altcall: use an union as register type for
 function parameters
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Matthew Grooms <mgrooms@shrew.net>,
 xen-devel@lists.xenproject.org
References: <20240222164455.67248-1-roger.pau@citrix.com>
 <b1c96b93-fd75-4077-b622-4781b7811ee8@suse.com>
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
In-Reply-To: <b1c96b93-fd75-4077-b622-4781b7811ee8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/02/2024 4:55 pm, Jan Beulich wrote:
> On 22.02.2024 17:44, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/include/asm/alternative.h
>> +++ b/xen/arch/x86/include/asm/alternative.h
>> @@ -167,9 +167,25 @@ extern void alternative_branches(void);
>>  #define ALT_CALL_arg5 "r8"
>>  #define ALT_CALL_arg6 "r9"
>>  
>> +#ifdef CONFIG_CC_IS_CLANG
>> +/*
>> + * Use an union with an unsigned long in order to prevent clang from skipping a
>> + * possible truncation of the value.  By using the union any truncation is
>> + * carried before the call instruction.
>> + * https://github.com/llvm/llvm-project/issues/82598
>> + */
> I think it needs saying that this is relying on compiler behavior not
> mandated by the standard, thus explaining why it's restricted to
> Clang (down the road we may even want to restrict to old versions,
> assuming they fix the issue at some point). Plus also giving future
> readers a clear understanding that if something breaks with this, it's
> not really a surprise.
>
> Aiui this bug is only a special case of the other, much older one, so
> referencing that one here too would seem advisable.
>
> As a nit: I think it is "a union" (spelling according to pronunciation),
> and I guess the title could now do with saying "optionally" or
> mentioning Clang or some such.

Yes.  "a union" is the right form here.

~Andrew

P.S. Spoken, "an union" would come across as "an onion", which is
something very different.

P.P.S.  As I noted to Matthew concerning
https://mjg59.dreamwidth.org/66907.html

"There's an interesting sidechannel in your blog post.  You seem to call
it an S-O-C and not a soc(k), based on the "an""

