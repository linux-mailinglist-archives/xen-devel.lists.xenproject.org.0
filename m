Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80774971651
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794316.1203126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncHR-0001gr-6w; Mon, 09 Sep 2024 11:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794316.1203126; Mon, 09 Sep 2024 11:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncHR-0001f3-4L; Mon, 09 Sep 2024 11:10:01 +0000
Received: by outflank-mailman (input) for mailman id 794316;
 Mon, 09 Sep 2024 11:09:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tbp=QH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sncHP-0001ex-QY
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:09:59 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d3b3c35-6e9c-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 13:09:58 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c3d2f9f896so4266582a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:09:58 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8cc1dsm2884660a12.94.2024.09.09.04.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:09:57 -0700 (PDT)
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
X-Inumbo-ID: 0d3b3c35-6e9c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725880198; x=1726484998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p0lperrIWOvTAUblyxi92KEOUKnFIzScyWTDoRsTfi0=;
        b=aV/7ZPDw9/8ZYM3cyc8T76Jl1mTD37n360VCScULr2UYpQ63oTNhBV6oVWVLiQOD2h
         /hhNSGgUs/Z8NoYjdbGB1YfRkxRPwh4uxcmLstts2s+PRavOVFpDJ5xZ7JT/uXr/Prhe
         jTDbEeh5dZ77NVsM0VqpScycehjpFzMVoO/6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880198; x=1726484998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0lperrIWOvTAUblyxi92KEOUKnFIzScyWTDoRsTfi0=;
        b=TLBZ6OUkgcWmMJqftIJT3gKsfjliXUwGr5adoqspzB5bxINnN+UDAcDYBXWtLoJ5Jb
         wDnKmyaPwUa0X95edHm17PkZRCFcP1aKKRVhv/6UouotWdj5Pldl+maMmLqNrgD03iiV
         25eqjgavieDXrN/YQriKs+TOL+YU2iVKxV8tAi+OlZ3VlvK/1og7fc84sDqg4PFciW48
         R1dloF0DNfo/OmdpgABVQk9p745yWueqDAmjeMtRM8k2F0prTHmvmWMM7cD7WkxfLTaV
         Ky4O3xQHRJqB33PGI6GuSOYIqfHhytBsQ4FSRuweQwXgnvRP1yeNo/8mNwheovs8y06h
         UbeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7RTOzEsuMqOr4M4f/ENhN1VzD5w5WhFnXBmMMp5WFh7jcW4+sHzcRuxCIPty4MIPGm7AsMIbXNSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywdjq3zvyeF/EuGDupHKZ9/240Orvq9I0Y+h/azJ/DnwMLIqKBm
	yF7s3Z8jp/rk4ncEFTWl9718BIjj5nu31szYyedCSmxZGDYoV4Du61Sw4CIwPno=
X-Google-Smtp-Source: AGHT+IFBOIeHsM8FNeYbzO+er45Ap2j7hv+JcvP3qLwCP4t241XysV/O1K2cOGphPjdyWSQsbzuDhw==
X-Received: by 2002:a05:6402:4015:b0:5c3:cd88:a0a with SMTP id 4fb4d7f45d1cf-5c3e963621dmr5471964a12.18.1725880198170;
        Mon, 09 Sep 2024 04:09:58 -0700 (PDT)
Message-ID: <d905a9fa-faba-4f10-8851-a532847433d6@citrix.com>
Date: Mon, 9 Sep 2024 12:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Define and use UINT64_C and INT64_C
To: Jan Beulich <jbeulich@suse.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240909100806.47280-1-frediano.ziglio@cloud.com>
 <abe1c3a2-2838-4756-a06f-f347e4fcd78e@suse.com>
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
In-Reply-To: <abe1c3a2-2838-4756-a06f-f347e4fcd78e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2024 11:38 am, Jan Beulich wrote:
> On 09.09.2024 12:08, Frediano Ziglio wrote:
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1384,9 +1384,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>          }
>>  
>>          if ( e > min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
>> -                     1UL << (PAGE_SHIFT + 32)) )
>> +                     UINT64_C(1) << (PAGE_SHIFT + 32)) )
>>              e = min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
>> -                    1UL << (PAGE_SHIFT + 32));
>> +                    UINT64_C(1) << (PAGE_SHIFT + 32));
> I disagree - we're dealing with virtual addresses here, which better
> wouldn't use fixed-width quantities.
>
> While not always virtual addresses, I similarly disagree for most or all
> I've left in context further up: If the underlying type to deal with is
> unsigned long, constants should match.

This is the same problem I ran into with fixmap mappings.

GB() and friends used in config.h are ULL constants, and promote the
underlying variables from UL.

64bit mostly copes (give or take some printk formatting), but 32bit
fails to compile.

~Andrew

