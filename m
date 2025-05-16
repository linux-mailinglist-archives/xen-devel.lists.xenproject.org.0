Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94675AB9DEE
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 15:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987207.1372632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvRq-0003OZ-VG; Fri, 16 May 2025 13:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987207.1372632; Fri, 16 May 2025 13:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvRq-0003Kw-R4; Fri, 16 May 2025 13:50:02 +0000
Received: by outflank-mailman (input) for mailman id 987207;
 Fri, 16 May 2025 13:50:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFvRq-00038z-0J
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 13:50:02 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a70d0ba2-325c-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 15:49:57 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so16218255e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 06:49:57 -0700 (PDT)
Received: from [10.81.43.161] ([46.149.103.11])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd59708esm33712385e9.37.2025.05.16.06.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 06:49:55 -0700 (PDT)
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
X-Inumbo-ID: a70d0ba2-325c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747403396; x=1748008196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+MX+fzdjUs9D4/4/T9ARROXh13vPdVxGuccJn5w560E=;
        b=Z5qtA+TxhO/ynYgUNtsYTarMPNXvfLb0TlVlRL5CkdUpAb7icanr5P31fGOKtOZ5n+
         9WhuSXIx8ZGL4dcByIKIEBZSKlC8Zhi1g3eKQxLdMcbUou58VqguYOpLoa+LHMFL82AI
         4uwe8amDvGunEya8kUtO3KampULwqnEh4kkW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403396; x=1748008196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MX+fzdjUs9D4/4/T9ARROXh13vPdVxGuccJn5w560E=;
        b=f30Eqn3vb5bM3kRS1vu82DPqZlWD1h/s9hQ1lTlCtYtsdesqaGKK1GHjipJDlypQOw
         hoy0zl18XSWRdvEMwUazR0ZvD3vaLwFKmD/SS7nMbyKuN03MAy7F/j+2qJn/GFP9yyNX
         ysHzshKPwFTVFjppQwe7RReCa0pYiVAcwaIWXO//eYt6qKntQiF6gP8X/n1JKQiRda05
         eqRcK0YuG0+kyh1/VhBQQCAqsRXB8rC0sv1nYi36q1TOW8HUkbU+mUllHcSlqIr6jzWl
         8YCJ0K/ROx8XGs3MQ6g6Q/lRZsAJu3/WNgb7tCjyoQgwzBcz9gUMo60VA4bJzlNdTqoQ
         Q9KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMV6seBXD6YIrd8cqDYYFW8vOnz+yD5/rMMhqzXmY4UH144BvZgR6f6yDP1BzWKot6s2OzPqlzoKQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzwW2oUxuEayrTXhJJJnrRKa7XSCkWpoy4tLrA4K0oCkLsCj9H
	vJ5a7pVFZ7P29kh3c0oDeSIEufD0458tTI+YEmvnCrlQFr6vwsSuLzqbplEvCsQ0vnV15PsfQyE
	mrrav
X-Gm-Gg: ASbGncs2vET1ryBiWdF1tnxbSIYagtERC1IafA1OM+FykvfsBNkZWV6Z7yuespKc4Ez
	uRdqaP8pF0FlgYNnboZMCarBsr0v5VWcCoXt1uI0twkrrymZQN1FQ1GZg1bz5uH/Kc+Ysx2WKbA
	d6dcuRdgUnjLnKSGMywv5ScBJrmECL1mKbreUmVyNSkzR2aTm3D4Ae2wpYjuc7u6tZiFFH3vzRg
	rnlOS5xjchyzcsZF0F5gFEk+PDqKB0Ova+mM8IHQXgYiSUo4NMnLmBbwMxvu1tK2HdGSC0e13CG
	/PT9wmB4yOpyMS/gbQjnFEvYA7sXpDlCKMMaxYSdHtX84A1fwH2v3ZbNdXPl8w==
X-Google-Smtp-Source: AGHT+IG6HnffnaRlG9GJ0XVVSuHFndYGEOJL5hD82sgcTvrsyzn5v0YWU9F1hbk2mCo1lt/wET5yQw==
X-Received: by 2002:a05:600c:1c03:b0:442:c98e:79ab with SMTP id 5b1f17b1804b1-442fd626edcmr32932385e9.9.1747403396381;
        Fri, 16 May 2025 06:49:56 -0700 (PDT)
Message-ID: <87a0546d-d2e4-4042-b34a-e35e2605123b@citrix.com>
Date: Fri, 16 May 2025 14:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/stubs: Consolidate the stubs infrastructure in
 asm/stubs.h
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250516133326.49587-1-andrew.cooper3@citrix.com>
 <4a1a8582-7503-49ca-8d34-bce3e101734a@suse.com>
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
In-Reply-To: <4a1a8582-7503-49ca-8d34-bce3e101734a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/05/2025 2:41 pm, Jan Beulich wrote:
> On 16.05.2025 15:33, Andrew Cooper wrote:
>> Very few files need the stubs.  Move the infrastructure out of
>> processor.h and config.h into a new stubs.h, and adjust the includes
>> accordingly.
>>
>> Make the per-cpu struct stubs be read mostly; they're unmodified
>> during the uptime of the CPU, and move them into smpboot.c seeing as
>> that's where they're allocated and freed.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one possible suggestion:
>
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/stubs.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef X86_ASM_STUBS_H
>> +#define X86_ASM_STUBS_H
>> +
>> +/*
>> + * Xen has several per-cpu executable stubs which are written dynamically.
> This puts it pretty well. Yet in principle there may be further, perhaps
> entirely different stubs in the future. Hence stubs.h feels a little
> generic. What about exec-stubs.h?

stubs is quite generic; in fact, that was my feedback for struct stubs.

There is something to be said for the header file to be the same as the
struct you want from it.

What did you have in mind for "different stubs"?  The only thing that
makes these special (i.e. not regular per-cpu data) is that we need an
executable mapping of them.  So, while I think it's reasonably likely
that we'll gain other uses (although, we're losing LSTAR/CSTAR when FRED
is enabled), I'm less certain what non-executable stubs would look like.

~Andrew

