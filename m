Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13C598A9FD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 18:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807585.1219145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svJRY-0000QQ-GR; Mon, 30 Sep 2024 16:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807585.1219145; Mon, 30 Sep 2024 16:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svJRY-0000Ov-DR; Mon, 30 Sep 2024 16:40:16 +0000
Received: by outflank-mailman (input) for mailman id 807585;
 Mon, 30 Sep 2024 16:40:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Bw3=Q4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svJRW-0007vF-QW
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 16:40:14 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa1baafb-7f4a-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 18:40:13 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso799176066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 09:40:13 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2997445sm550291666b.202.2024.09.30.09.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 09:40:12 -0700 (PDT)
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
X-Inumbo-ID: aa1baafb-7f4a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727714412; x=1728319212; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yNtVTjbAfjf74NeCfHJPK2dgdfDw2U5anVBnwYCBSSQ=;
        b=C92Qbrh4Bd16T4RHOXGDWMi5n0z+lM1GA/UHScTqldm/JJjXoKtufsG6mbLmCs2r0l
         4K6g/hZN3CWuQTjPup0TpzK1uRF1DAzmNV85hhHivWIY6PwjVZx65U3PHo4XvUNaLq3T
         mZyAchQ8cOQzuXRqVJ7k3UC4LJg92v/Rb/e80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727714412; x=1728319212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNtVTjbAfjf74NeCfHJPK2dgdfDw2U5anVBnwYCBSSQ=;
        b=Q35rqJHQniLWp10d+ePzkQJtbgX69jBiK0lAD1LPTfOEAGKEGxxi3tKqAhIdox8tGT
         OROK98PnUNRzffCj2YnnAFlP+n2uNGgMabepHIlN3mIrNW/JsjAvckk3Rnz6U5map9VB
         Hcc0CqpQl7dZjfB1qd9dk18WWAxol1tpCafpCDVQXOJa6yQ59PgZ4ih7IwfjxP2s0mgH
         tRpnZOP4oCsWgE+VIPQkhbiYa4gMLO/JCiFITuxbhf3QSIe66aeoyr4cZIKHDKCc+0GU
         +MC9AnukjnS75iUvahzKgrcHMA1dYaL910zen1pw4XMH9hIJYNtwm2Bk70JD6TQsA/3V
         rjxw==
X-Forwarded-Encrypted: i=1; AJvYcCXqVhlqMgLAAMTiLjREAqKiiJqAB+rjv9LwI6+CLUkV+NiBMc82GmlBsReilOGsGWLdJ1zQuf2mA6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWO36Msyy+nn6EwL12b3KJ8bCLtRZCXjWrrxVqQArxhh8Uqtzz
	109uea/caDuUebOl4cw5ESJyzCosAIywexUyiRc0wRGKMUNXnNBl6FtWz9HFWTtihnswsyozRDA
	L1xE=
X-Google-Smtp-Source: AGHT+IFUzC9UAuAu6hd7ZYvjdDBvvWrxmYAnnp1dLemLBBDsthu4xjVMTooZ4HHwbQ28CP0NvwFIxA==
X-Received: by 2002:a17:907:3e99:b0:a7a:a46e:dc3f with SMTP id a640c23a62f3a-a93c4a68ae8mr1623805966b.45.1727714412551;
        Mon, 30 Sep 2024 09:40:12 -0700 (PDT)
Message-ID: <14ab2f50-e58c-4cb4-b976-4cb5ec14d908@citrix.com>
Date: Mon, 30 Sep 2024 17:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: prefer RDTSCP in rdtsc_ordered()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cae006a7-c1be-4608-a011-dda1fb4a0312@suse.com>
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
In-Reply-To: <cae006a7-c1be-4608-a011-dda1fb4a0312@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/09/2024 4:08 pm, Jan Beulich wrote:
> If available, its use is supposed to be cheaper than LFENCE+RDTSC, and
> is virtually guaranteed to be cheaper than MFENCE+RDTSC.
>
> Unlike in rdtsc() use 64-bit local variables, eliminating the need for

I'd drop this reference to rdtsc() seeing as you adjust it in a parallel
patch.

> the compiler to emit a zero-extension insn for %eax (that's a cheap MOV,
> yet still pointless to have).
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -108,18 +108,30 @@ static inline uint64_t rdtsc(void)
>  
>  static inline uint64_t rdtsc_ordered(void)
>  {
> -	/*
> -	 * The RDTSC instruction is not ordered relative to memory access.
> -	 * The Intel SDM and the AMD APM are both vague on this point, but
> -	 * empirically an RDTSC instruction can be speculatively executed
> -	 * before prior loads.  An RDTSC immediately after an appropriate
> -	 * barrier appears to be ordered as a normal load, that is, it
> -	 * provides the same ordering guarantees as reading from a global
> -	 * memory location that some other imaginary CPU is updating
> -	 * continuously with a time stamp.
> -	 */
> -	alternative("lfence", "mfence", X86_FEATURE_MFENCE_RDTSC);
> -	return rdtsc();
> +    uint64_t low, high, aux;
> +
> +    /*
> +     * The RDTSC instruction is not ordered relative to memory access.
> +     * The Intel SDM and the AMD APM are both vague on this point, but
> +     * empirically an RDTSC instruction can be speculatively executed
> +     * before prior loads.

This part of the comment is stale now.  For RDTSC, AMD state:

"This instruction is not serializing. Therefore, there is no guarantee
that all instructions have completed at the time the time-stamp counter
is read."

and for RDTSCP:

"Unlike the RDTSC instruction, RDTSCP forces all older instructions to
retire before reading the time-stamp counter."

i.e. it's dispatch serialising, given our new post-Spectre terminology.


Intel OTOH have much more extensive information.  For RDTSC:

The RDTSC instruction is not a serializing instruction. It does not
necessarily wait until all previous instructions have been executed
before reading the counter. Similarly, subsequent instructions may begin
execution before the read operation is performed. The following items
may guide software seeking to order executions of RDTSC:

•If software requires RDTSC to be executed only after all previous
instructions have executed and all previous loads are globally visible,1
it can execute LFENCE immediately before RDTSC.

•If software requires RDTSC to be executed only after all previous
instructions have executed and all previous loads and stores are
globally visible, it can execute the sequence MFENCE;LFENCE immediately
before RDTSC.

•If software requires RDTSC to be executed prior to execution of any
subsequent instruction (including any memory accesses), it can execute
the sequence LFENCE immediately after RDTSC.

Similarly, for RDTSCP:

The RDTSCP instruction is not a serializing instruction, but it does
wait until all previous instructions have executed and all previous
loads are globally visible.  But it does not wait for previous stores to
be globally visible, and subsequent instructions may begin execution
before the read operation is performed. The following items may guide
software seeking to order executions of RDTSCP:

•If software requires RDTSCP to be executed only after all previous
stores are globally visible, it can execute MFENCE immediately before
RDTSCP.

•If software requires RDTSCP to be executed prior to execution of any
subsequent instruction (including any memory accesses), it can execute
LFENCE immediately after RDTSCP.



I'd delete most of the paragraph, and just state the recommendation to
use LFENCE.

In truth, X86_FEATURE_MFENCE_RDTSC is useless now that we unilaterally
activate LFENCE_DISPATCH on CPUs where it's optional.  Linux went as far
as removing the case entirely, because if you're running under a
hypervisor which hasn't set LFENCE_DISPATCH, then the misbehaviour of
lfence;rdtsc is the least of your problems.

~Andrew

