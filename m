Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1560A98920
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 14:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964532.1355299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Yq1-0001eQ-OW; Wed, 23 Apr 2025 12:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964532.1355299; Wed, 23 Apr 2025 12:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Yq1-0001bI-Lj; Wed, 23 Apr 2025 12:04:25 +0000
Received: by outflank-mailman (input) for mailman id 964532;
 Wed, 23 Apr 2025 12:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7Yq0-0001bB-7s
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 12:04:24 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 178e94c7-203b-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 14:04:22 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c1ee0fd43so5733014f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 05:04:22 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4206fasm18273260f8f.2.2025.04.23.05.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 05:04:20 -0700 (PDT)
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
X-Inumbo-ID: 178e94c7-203b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745409861; x=1746014661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nzu8CMGibcAh7yGgVKWP1XO+FLkGJclgWOAxgFpTVTM=;
        b=KHjW4F8AXJm6cwbaFvFip/YSgZiwBkhhepSd8XWXhwMNyvhCodRoCE573dvI5Kq6Qc
         6vEG730PdsR/azdfP58qPH3XZH5K3IlAPrbFBrkf22jwkVpHkmSU2vc4A6P8ICEplEmT
         glLqWeqecVvb1dks9Zodwd8c+hC5tiK1JuEF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745409861; x=1746014661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzu8CMGibcAh7yGgVKWP1XO+FLkGJclgWOAxgFpTVTM=;
        b=t5JKIcGUy6TnwRFt6XkXVdcuZ/QnqBOrhaDEnBuWu5W2/uWxpPxcS+Tw3AXSBo4ZV0
         l9OfAxRK6DTdwXzxAhZ1Fv1NZnDNDMvMWkh2L8UQdTFjZ92LDi9uZMFgQbJHs343Ue6i
         h1kD690RriANtD7tac+eA16QMlqbssVQknEMSTerVeQxpzFHapRwn3T5agou44xF7L4j
         QutGvwRwIVklIEuzR3fvWvIEea8F2XsFJ0T045on+YhxirEVNQfhvHKMhIfizqcdcJcC
         BuYEkdAgrI2I4/Sp0iF/KWPz5qJrThz8jzjGKMedn9VnuLC5F+RihAm0i7AYa9+/cGXR
         EpMw==
X-Gm-Message-State: AOJu0YyTJzwBOxWT18YKlv85Myrq1Y6/LYpunTRdFpvdzzEz+07ft4F7
	jcrOUkCT+iJW0MjJr7/IPM1lTOrsBy9MQEZbOoQKwxKip+QyHfqKPakHKJ+NXNA=
X-Gm-Gg: ASbGncumezNOv/M1+nrzJhY0Z6IF8hQd1+tc0l6eiKhNpR8z+nVwKv5LS453L4DPkdW
	PZ/YSURbBWu0O4RSObALwEtckW4/AHNe/34jvbg+NfArUl+xt49pI1WuY/D4VBXaBUbYP4IMOA2
	TOw6ybk44guoJ2w0NzVyVOK1YP0Ra8iuM7YSdAleMD13iwg1y0kaA5z/MNZai2F94Ox8mg57NzU
	WvqPtXYgR5BvoHIGS+/jo66vIP1vKSvt8V5HDPnH1CKgQtoOThEYb+xWz1e/Z8uF8u/WIFlTWzw
	v/6wQZe/WBpMt/juYM4NYt5MvA5v1FQXM1P4InEylZTcHfg5t8zE1A==
X-Google-Smtp-Source: AGHT+IEfcFSyOyp9p79d+udocNw/QHPyhRp7UQFsveG0nxUpd/ikoIOM1YSmDaBm6thmZhqr+6bgMA==
X-Received: by 2002:a05:6000:184c:b0:39e:cbcf:9dad with SMTP id ffacd0b85a97d-39efba50f42mr14177658f8f.20.1745409861261;
        Wed, 23 Apr 2025 05:04:21 -0700 (PDT)
Message-ID: <0921b0ae-7c9e-4f04-aaba-4b0bfcb81348@citrix.com>
Date: Wed, 23 Apr 2025 13:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] xen/livepatch: Support new altcall scheme
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
 <20250423010237.1528582-7-andrew.cooper3@citrix.com>
 <aAjMIeYaPzxlsV8_@macbook.lan>
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
In-Reply-To: <aAjMIeYaPzxlsV8_@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2025 12:16 pm, Roger Pau Monné wrote:
> On Wed, Apr 23, 2025 at 02:02:35AM +0100, Andrew Cooper wrote:
>> The new altcall scheme uses an .alt_call_sites section.  Wire this up in very
>> much the same way as the .altinstructions section, although there is less
>> sanity checking necessary.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
> One nit/comment below.
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>  xen/arch/x86/alternative.c         |  6 ++++
>>  xen/common/livepatch.c             | 58 ++++++++++++++++++++++++++++++
>>  xen/include/xen/alternative-call.h |  8 +++--
>>  3 files changed, 70 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
>> index f6594e21a14c..22af224f08f7 100644
>> --- a/xen/arch/x86/alternative.c
>> +++ b/xen/arch/x86/alternative.c
>> @@ -479,6 +479,12 @@ int apply_alternatives(struct alt_instr *start, struct alt_instr *end)
>>  {
>>      return _apply_alternatives(start, end, true);
>>  }
>> +
>> +int livepatch_apply_alt_calls(const struct alt_call *start,
>> +                              const struct alt_call *end)
>> +{
>> +    return apply_alt_calls(start, end);
>> +}
>>  #endif
>>  
>>  #define ALT_INSNS (1U << 0)
>> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
>> index 6ce77bf021b7..be9b7e367553 100644
>> --- a/xen/common/livepatch.c
>> +++ b/xen/common/livepatch.c
>> @@ -905,6 +905,64 @@ static int prepare_payload(struct payload *payload,
>>  #endif
>>      }
>>  
>> +    sec = livepatch_elf_sec_by_name(elf, ".alt_call_sites");
>> +    if ( sec )
>> +    {
>> +#ifdef CONFIG_ALTERNATIVE_CALL
>> +        const struct alt_call *a, *start, *end;
>> +
>> +        if ( !section_ok(elf, sec, sizeof(*a)) )
>> +            return -EINVAL;
>> +
>> +        /* Tolerate an empty .alt_call_sites section... */
>> +        if ( sec->sec->sh_size == 0 )
> You could possibly move this check to the outer `if` condition, and
> avoid the alt_call_done label?
>
> As even in the !CONFIG_ALTERNATIVE_CALL case skipping an empty section
> would be OK.

.altinstructions is like this.  It was put in as part of e74360e4ba4a, I
believe because it was decided that an empty section wasn't wanted.

We can revisit the decision, but the logic should be consistent.

~Andrew

