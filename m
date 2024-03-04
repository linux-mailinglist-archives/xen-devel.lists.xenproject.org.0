Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670DD870776
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 17:46:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688462.1072594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBSN-0007eW-Q3; Mon, 04 Mar 2024 16:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688462.1072594; Mon, 04 Mar 2024 16:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBSN-0007d0-NI; Mon, 04 Mar 2024 16:46:27 +0000
Received: by outflank-mailman (input) for mailman id 688462;
 Mon, 04 Mar 2024 16:46:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bpxf=KK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhBSL-0007cV-RE
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 16:46:25 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc15f146-da46-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 17:46:24 +0100 (CET)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5a143047a4aso275133eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 08:46:24 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ev7-20020a056820310700b005a11b24176csm1033441oob.15.2024.03.04.08.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 08:46:21 -0800 (PST)
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
X-Inumbo-ID: bc15f146-da46-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709570783; x=1710175583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NO+YwGKxThnsKTJTVLQlONaHwyR9rPJPpqFRPNO5j2A=;
        b=QFoy1euldGOHMUpRglolV2xeJkJbk9TKMZ7jzqGIbdDXqgDfLpiDR/7hPB7V8A2Gow
         2Rk1/ZuXi6FiL/eychyd7QJBuGpagBMfqd2YQ8+4LCauxdkPYVvJ8bnifUk9NCpkw6th
         UHopUv1y7fpuSXWwAi9rDXxM55QxCfX04yb04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709570783; x=1710175583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NO+YwGKxThnsKTJTVLQlONaHwyR9rPJPpqFRPNO5j2A=;
        b=xBecu4/czHd9LjcUIqATdcnFl4ZqCbFwONjMuuCHX0M/8iDtmzA4kMtBZR+nyhBva3
         SkfKvE7uLDeFGkF6eNPtqqIx5WrMAfW0d/Nurw6NKYlhbHugCtNfx6CDiakExev0uJkI
         oWlbIVIAC8gV7NWFWZsFkxU/ICkh2A6BRdnaGtpYlt/ZAavlp9tB7dndZVevqk2x6tFh
         c5uW4ivR+GxIWaKOAw0+BvyvW4n5w8d1YP4oB5TOQjVEm6IwnPsLv5Z5A4A4NiW7CRXs
         BaL4MFuzq7PjsBgLEHEPA90Hzp3Qx+RSQucbERvBFGZFY2qyawy4WJgina3YTlEkQZf9
         vgdA==
X-Forwarded-Encrypted: i=1; AJvYcCWKRVopd7KZe9kBs3r1RxoK7462fw0t9e+f66PBz7f5ao5Gz3sJUabAusd4GLhtdTnxk7mylj6PSVLPdI/UPzEGEmY4zm2MEFpXOAmQLTs=
X-Gm-Message-State: AOJu0YwBrhqPU8wDv6h2XjP4OKvUzPz/VxQf+LnbSR8jNdwinbgcsprO
	H+4brfICpXwo3ZKJC5I3O801OtSYBNxjI+nbSx2Ty5g0MOC36Gt0CskGad+mX1c=
X-Google-Smtp-Source: AGHT+IFhDPVjsigLJw8QtOGFk0xeiTZR1csgd03uKYDTTvM65zuEaSZh0hvn7jH7+Gp5nbFXTMYY6Q==
X-Received: by 2002:a4a:55cb:0:b0:5a1:34cf:400c with SMTP id e194-20020a4a55cb000000b005a134cf400cmr3201440oob.9.1709570782841;
        Mon, 04 Mar 2024 08:46:22 -0800 (PST)
Message-ID: <0c8cfbcf-d69b-499d-a915-df44713093ef@citrix.com>
Date: Mon, 4 Mar 2024 16:46:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
 <5220c8cf-bbc2-4f18-94ca-f1f30dd828c9@suse.com>
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
In-Reply-To: <5220c8cf-bbc2-4f18-94ca-f1f30dd828c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/03/2024 4:45 pm, Jan Beulich wrote:
> On 04.03.2024 17:10, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/nospec.h
>> +++ b/xen/arch/x86/include/asm/nospec.h
>> @@ -23,20 +23,20 @@ static always_inline bool barrier_nospec_false(void)
>>      return false;
>>  }
>>  
>> -/* Allow to protect evaluation of conditionals with respect to speculation */
>> -static always_inline bool evaluate_nospec(bool condition)
>> +static always_inline bool arch_evaluate_nospec(bool condition)
>>  {
>>      if ( condition )
>>          return barrier_nospec_true();
>>      else
>>          return barrier_nospec_false();
>>  }
>> +#define arch_evaluate_nospec arch_evaluate_nospec
>>  
>> -/* Allow to block speculative execution in generic code */
>> -static always_inline void block_speculation(void)
>> +static always_inline void arch_block_speculation(void)
>>  {
>>      barrier_nospec_true();
>>  }
>> +#define arch_block_speculation arch_block_speculation
> I'm having some difficulty seeing the need for the renaming (adding
> or the arch_ prefixes): Why can't the original names be kept, and
> ...
>
>> --- a/xen/include/xen/nospec.h
>> +++ b/xen/include/xen/nospec.h
>> @@ -9,6 +9,29 @@
>>  
>>  #include <asm/nospec.h>
>>  
>> +/*
>> + * Protect a conditional branch from bad speculation.  Architectures *must*
>> + * provide arch_evaluate_nospec() for this to be effective.
>> + */
>> +static always_inline bool evaluate_nospec(bool cond)
>> +{
>> +#ifndef arch_evaluate_nospec
>> +#define arch_evaluate_nospec(cond) cond
>> +#endif
>> +    return arch_evaluate_nospec(cond);
>> +}
>> +
>> +/*
>> + * Halt speculation unconditonally.  Architectures *must* provide
>> + * arch_block_speculation() for this to be effective.
>> + */
>> +static always_inline void block_speculation(void)
>> +{
>> +#ifdef arch_block_speculation
>> +    arch_block_speculation();
>> +#endif
>> +}
> ... stubs be introduced here if the original names aren't #define-d?
> IOW what does the extra layer gain us?

See the next patch.

~Andrew

