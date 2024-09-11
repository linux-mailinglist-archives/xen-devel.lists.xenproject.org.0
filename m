Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FEF97553D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 16:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796695.1206447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOJN-0005Hf-E4; Wed, 11 Sep 2024 14:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796695.1206447; Wed, 11 Sep 2024 14:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOJN-0005GA-BI; Wed, 11 Sep 2024 14:27:13 +0000
Received: by outflank-mailman (input) for mailman id 796695;
 Wed, 11 Sep 2024 14:27:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RHL=QJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1soOJM-0005G4-BV
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 14:27:12 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edf89cec-7049-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 16:27:10 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso232307866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 07:27:10 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c73bc1sm621897366b.136.2024.09.11.07.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 07:27:08 -0700 (PDT)
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
X-Inumbo-ID: edf89cec-7049-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726064829; x=1726669629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NdHX2HfwoDIX33ptgj0ww9voyKMhU5yu+cYJJgxhROw=;
        b=eqOIZYmcTbiqYVT3tOd3vOH6np6pc1UdfFuOU/swHxQADicxNB9IBmPtP9O7La+nJl
         DfjqGT8PesAARJe1zi1bhQ0bKQ6IaCddfv4tiU8EIi3hMajDDLFDt2/FryPzRBDjjnNL
         6wHHW6oW2Tcy4Nz2ugcnkpRxkv2rskkm3Wldc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726064829; x=1726669629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdHX2HfwoDIX33ptgj0ww9voyKMhU5yu+cYJJgxhROw=;
        b=tHUCKk8R2+q1VEqcGdkUWOiquRa2moLrBYfPqtgMw0mcWyMr9Wn7TXc3cOUOl07vyp
         kVE+E7Xa/XTO7r+D3JuW8yJ8qSaFrLlIMEkmXD7C6kw5gTvw9F3+Pq3jVfmilWlUXubo
         bo9kFfj2r1LIjzpDCRpyx9GIUtW8t/m/7IRGq17k3f3jSzXzX29nZE414Tp8J2tze/HQ
         QFnygOANXy3UZ9qQIVdfEXLM9oNgaYZr8Po6Ocfv1pL5TFJe4XnkQ9v/46sXKpcwGxmN
         /B806QhkPbpM45qlIH4GJDb7zG1X1mL9gQjpTlOOl8N7kGEocTCo7mzDQ3CG9hr4F55c
         1ZPA==
X-Forwarded-Encrypted: i=1; AJvYcCWxvEG2B51zTCBXsaR1Ra6IAhQhwmISLchyZB5wwpsHBK6w82iGRI9KxlFyiGKWVtCDSbIK7PLq1zY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiOzgXdlzX6gX3DXpxK1+5JTP0aVfGHHJaz+J9xmx005Ab7TXK
	YJWxpXn09LDwyl4tkv0Rn7URH1CnZKBz0hRCsWH3sA5/QCgaQQmdAgWiqmEzqvHFdiq1AWnAUg/
	F
X-Google-Smtp-Source: AGHT+IE7NcCQMQLGlkSvRHqo28JPewjIr6VP/cYJT36CFE57iva/xLiWKRe+wZ/fQDDUz+d5vF/WaQ==
X-Received: by 2002:a17:907:f1c9:b0:a8d:7210:e28c with SMTP id a640c23a62f3a-a900483386dmr355672866b.20.1726064828815;
        Wed, 11 Sep 2024 07:27:08 -0700 (PDT)
Message-ID: <68ee6110-af2c-425c-872a-baf84948c051@citrix.com>
Date: Wed, 11 Sep 2024 15:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] EFI: address violations of MISRA C Rule 13.6
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725994633.git.federico.serafini@bugseng.com>
 <2e893e6e83fdfb24c5f9c4d2da59114cba9a1df8.1725994633.git.federico.serafini@bugseng.com>
 <c068874b-a4bd-4ccc-a9bf-08a996797543@suse.com> <ZuGYOldX55_ZfJCv@mail-itl>
 <0a36284e-4b99-413c-bc12-0328b12da0d2@suse.com>
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
In-Reply-To: <0a36284e-4b99-413c-bc12-0328b12da0d2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2024 3:10 pm, Jan Beulich wrote:
> On 11.09.2024 15:16, Marek Marczykowski-Górecki wrote:
>> On Wed, Sep 11, 2024 at 02:50:03PM +0200, Jan Beulich wrote:
>>> On 10.09.2024 21:06, Federico Serafini wrote:
>>>> Refactor the code to improve readability
>>> I question this aspect. I'm not the maintainer of this code anymore, so
>>> my view probably doesn't matter much here.
>>>
>>>> and address violations of
>>>> MISRA C:2012 Rule 13.6 ("The operand of the `sizeof' operator shall
>>>> not contain any expression which has potential side effect").
>>> Where's the potential side effect? Since you move ...
>>>
>>>> --- a/xen/common/efi/runtime.c
>>>> +++ b/xen/common/efi/runtime.c
>>>> @@ -250,14 +250,20 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
>>>>          info->cfg.addr = __pa(efi_ct);
>>>>          info->cfg.nent = efi_num_ct;
>>>>          break;
>>>> +
>>>>      case XEN_FW_EFI_VENDOR:
>>>> +    {
>>>> +        XEN_GUEST_HANDLE_PARAM(CHAR16) vendor_name =
>>>> +            guest_handle_cast(info->vendor.name, CHAR16);
>>> .. this out, it must be the one. I've looked at it, yet I can't spot
>>> anything:
>>>
>>> #define guest_handle_cast(hnd, type) ({         \
>>>     type *_x = (hnd).p;                         \
>>>     (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
>>> })
>>>
>>> As a rule of thumb, when things aren't obvious, please call out the
>>> specific aspect / property in descriptions of such patches.
>> I guess it's because guest_handle_cast() is a macro, yet it's lowercase
>> so looks like a function?
> If Eclair didn't look at the macro-expanded code, it wouldn't even see
> the sizeof(). Hence I don't expect the thing to be mistaken for a function
> call.

The complaint is a sizeof in guest_handle_okay() being given ({ ... })
to interpret.

({}) can have arbitrary side effects in it, hence the violation.

~Andrew

