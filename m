Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067898D405
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 15:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808786.1220797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svz5Y-0004bs-MH; Wed, 02 Oct 2024 13:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808786.1220797; Wed, 02 Oct 2024 13:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svz5Y-0004aB-IU; Wed, 02 Oct 2024 13:08:20 +0000
Received: by outflank-mailman (input) for mailman id 808786;
 Wed, 02 Oct 2024 13:08:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svz5X-0004a5-G7
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 13:08:19 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63ecb6cf-80bf-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 15:08:17 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53959a88668so6371709e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 06:08:17 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88570261bsm6934734a12.89.2024.10.02.06.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 06:08:15 -0700 (PDT)
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
X-Inumbo-ID: 63ecb6cf-80bf-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727874497; x=1728479297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ij3bX1ryoi5r5bo3NWs8NNPzHhMdxDOp9tqLc+uQiME=;
        b=VF8GTQGDHnWGP30i+32+0CV+Rv1m2oYmXJO6oifPwqoDER2WAftI0W+31g43YnVo23
         9C8OpZpoVsDGA+neSGbPmXO2kBf3lyrfFhaTQkuQ1gDMqRwV6tj+rcszQblsosgoCLgt
         BXbRGeDRtAV7FUfccd9UnBTKF/l5Nk2UP+dJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874497; x=1728479297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ij3bX1ryoi5r5bo3NWs8NNPzHhMdxDOp9tqLc+uQiME=;
        b=xS3Vwyn9GKkNsEBy4EAfnn8/Gkj6LphmpTydhe2iEddK+yCf1pNurVeuPUnaZ1kAoI
         dBoV6xVp9m3Ubaoq6Y2GaGJ/CUb8pTfYvR/KcF2BqsnmGrVMvkiO+tUwiUa+jyVfeMIm
         twYW3lK9d+JgHcXW5G6g2y6dq2TrXU8976KSdgXFF48KdezQGPjcdU+fmij4exeYbANZ
         ylQWxgr+jU6RsxdMPkmAYh/gcV8iHS9fdXp4siJP3n+H4rIlLOl+J6pOKBtF/nrSngOV
         PZZcIbB9AqDeBdOkgaZtG88XJLHawnT3N7RUSdHUV5DUtnC89pbvKf7tHiPfs+JtrYdG
         sHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNtTSesiHYACUCv3ekuhg899LWS00pX9BB4k9Mz4UVS0VgkSgMQNkBoTG5X95OKcYmhmzy+BjtYoU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLcJyAmB+BUh8seXeBGaQtL9pVSOvYHIYE54JuA3UZalRlT81z
	Hl4pFJosG+BKQPRh1i3jeQNbUOyS9KnNoeJE5AspNg9AoemYhTdQo4LQ1znW+jw=
X-Google-Smtp-Source: AGHT+IHTMhGMSjFqN+ZdRPD1aUJICMRam0JsvzbB/sLN0DfDWqzETOHhgQ2U9U92xGtTsuxEdxtYHg==
X-Received: by 2002:a2e:4619:0:b0:2fa:c014:4b6b with SMTP id 38308e7fff4ca-2fae10a90c5mr13897491fa.41.1727874496867;
        Wed, 02 Oct 2024 06:08:16 -0700 (PDT)
Message-ID: <de6809f6-de70-457d-a430-774d6b2b94b6@citrix.com>
Date: Wed, 2 Oct 2024 14:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kexec: Separate code and data by at least 1 cacheline
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241002103052.1797237-1-andrew.cooper3@citrix.com>
 <b917b21a-6d2b-46b2-a30d-7bab5ebff631@suse.com>
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
In-Reply-To: <b917b21a-6d2b-46b2-a30d-7bab5ebff631@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/10/2024 1:08 pm, Jan Beulich wrote:
> On 02.10.2024 12:30, Andrew Cooper wrote:
>> No functional change, but it performs a bit better.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> A question nevertheless:
>
>> --- a/xen/arch/x86/x86_64/kexec_reloc.S
>> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
>> @@ -19,6 +19,7 @@
>>  #include <xen/kimage.h>
>>  
>>  #include <asm/asm_defns.h>
>> +#include <asm/cache.h>
>>  #include <asm/msr-index.h>
>>  #include <asm/page.h>
>>  #include <asm/machine_kexec.h>
>> @@ -174,6 +175,9 @@ FUNC_LOCAL(compatibility_mode)
>>          ud2
>>  END(compatibility_mode)
>>  
>> +        /* Separate code and data into into different cache lines */
>> +        .balign L1_CACHE_BYTES
>> +
>>  DATA_LOCAL(compat_mode_gdt_desc, 4)
>>          .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
>>          .quad 0x0000000000000000     /* set in call_32_bit above */
> Because of L1_CACHE_BYTES being 128, you indeed put at least 1 cache line in
> between. Is that necessary, though? Just starting data on the next cache line
> ought to be enough?

Correct.  Specifically, we want the write into compat_mode_gdt_desc not
hitting a line in L1i.

> IOW if and when we adjust L1_CACHE_BYTES, we won't need
> to touch this again, just that the title here then would end up slightly
> misleading.

Oh - I'll just copy the comment and say "different".  That is slightly
poor grammar.

~Andrew

