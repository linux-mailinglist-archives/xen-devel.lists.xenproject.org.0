Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8708958F0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 17:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700212.1092990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrgSt-00086T-Py; Tue, 02 Apr 2024 15:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700212.1092990; Tue, 02 Apr 2024 15:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrgSt-00084e-MI; Tue, 02 Apr 2024 15:54:23 +0000
Received: by outflank-mailman (input) for mailman id 700212;
 Tue, 02 Apr 2024 15:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy/k=LH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rrgSr-00084Y-Uw
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 15:54:21 +0000
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [2607:f8b0:4864:20::b34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 447981e9-f109-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 17:54:20 +0200 (CEST)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dcbd1d4904dso4946632276.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 08:54:20 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 da32-20020a05620a362000b0078a43996ab7sm4396437qkb.1.2024.04.02.08.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 08:54:18 -0700 (PDT)
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
X-Inumbo-ID: 447981e9-f109-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712073259; x=1712678059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KDcS5/fhP5ZG/Br80l2ESLKbK8tcCtHsP4AfRpY+YXw=;
        b=i8YD2T2XTzsV2SPYl7/4F2+RoSNN3jvLp4cnXv6zhWqaUyNVha0gq0nIxWjX/6lavI
         S9CmuFvve2CvJIWRDKcFlmRndRMwsdyxeEWCT/Qo3JYA4T9AssBvVrRjaPi1BuV+s5Hm
         jtOJLpxOoAEvQRu0cbbrVMHdWvmvaJuki+oYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712073259; x=1712678059;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDcS5/fhP5ZG/Br80l2ESLKbK8tcCtHsP4AfRpY+YXw=;
        b=XbdHOhJ4LIc23FJH37B6rbnQrppFgo5tOFJUK/ykpLxUTzUA5ONSSL4jz4oyW2XdA4
         jGPmH+e5gBuzOxBNFVvd4NU6ERbDNuFALE0n6R2eVA5lhq2gtUA6InHS5r8EI2x1oFH2
         IR56QF25RqS9DpXLh92vqiuIz3utWSupcz8ohrLVCev1sroFkSvtgO9EgPCMawGCSS/f
         9SBQ0U3M+WGxSBhG/wfiLmSF3i9vpHMJNCLst2zHBAsthlEYdIzlnbVuRoc4+1lgUFAi
         BsFmURTlmOAEXvfSViOY34kGYoBhOfYLVZJWj/nrS1pXlfjugHrjsNiGICotb/AmBLfX
         eUcg==
X-Forwarded-Encrypted: i=1; AJvYcCWE+vsN40ZMFjLq3Htce6WGOK3qqFo2q0Lyh7X5/1k4q90m7rgTgQeUSzarpe/1mwojIKbhLHWIWb7luK4gz3vJddq10YYYnOp81+CxP48=
X-Gm-Message-State: AOJu0YxIiO+2GpUuh4srfUd9dHxPIsXr3w64zzcCPDWqEYKBLai9njrY
	jQTiiuRKY3l4MOluYf32GY5iz0PMV6YfDJIicFxyW7pchlIeYt0kscz+q5IegjGGpppAzL0ryLn
	TNhQ=
X-Google-Smtp-Source: AGHT+IHMVdk3egEu79UPx7yDlFP8q0ZMlggWJcQTnSUJa+S2JPVL364qFy4yv/AYtkVinRY77MFS6w==
X-Received: by 2002:a25:2fc9:0:b0:dcf:3ef2:6182 with SMTP id v192-20020a252fc9000000b00dcf3ef26182mr11096583ybv.0.1712073259493;
        Tue, 02 Apr 2024 08:54:19 -0700 (PDT)
Message-ID: <6ac9cb14-2e68-41d6-b061-c7caa74fde5b@citrix.com>
Date: Tue, 2 Apr 2024 16:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Address MISRA Rule 13.6
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240402154339.2448435-1-andrew.cooper3@citrix.com>
 <35fc596e-8134-4471-83d4-40b01f5821bf@suse.com>
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
In-Reply-To: <35fc596e-8134-4471-83d4-40b01f5821bf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2024 4:46 pm, Jan Beulich wrote:
> On 02.04.2024 17:43, Andrew Cooper wrote:
>> MISRA Rule 13.6 doesn't like having an expression in a sizeof() which
>> potentially has side effects.
>>
>> Address several violations by pulling the expression out into a local
>> variable.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one caveat:
>
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -1150,8 +1150,9 @@ static void cf_check irq_guest_eoi_timer_fn(void *data)
>>      {
>>          struct domain *d = action->guest[i];
>>          unsigned int pirq = domain_irq_to_pirq(d, irq);
>> +        struct pirq *pirq_info = pirq_info(d, pirq);
> Misra won't like the var's name matching the macro's. Can we go with just
> "info"?

Ah - missed that.

I can name it to just info, but I considered "struct pirq *info" to be a
little odd.

~Andrew

