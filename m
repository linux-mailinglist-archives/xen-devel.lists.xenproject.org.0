Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C75984A51
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 19:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803278.1213792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st9Ol-0008Kh-Iu; Tue, 24 Sep 2024 17:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803278.1213792; Tue, 24 Sep 2024 17:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st9Ol-0008IM-Eg; Tue, 24 Sep 2024 17:32:27 +0000
Received: by outflank-mailman (input) for mailman id 803278;
 Tue, 24 Sep 2024 17:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1st9Oj-0008IG-Ai
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 17:32:25 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f564b65f-7a9a-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 19:32:23 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5365d3f9d34so5967844e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 10:32:23 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393134bc5sm108032766b.208.2024.09.24.10.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 10:32:22 -0700 (PDT)
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
X-Inumbo-ID: f564b65f-7a9a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727199143; x=1727803943; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZBzYcZ4Mh6BTIIyGTttOLVwGRQNlS1mpBLi2ZJFdoQ=;
        b=CtcGNFfdDyaUAmKwQmLDsEQPd0mjfaud7o6QViBlV1YT5y01Ia/S6Y2qJeevnqIV2G
         fmTnDNMBfwsqa/C56Zh3UtsQzSomeCqL5FDzZDzULp22IpXrmDmnzRxUhSRAsW5FmelP
         5SnNVIppHXL7oyz7Ru73jdn8OB31vx4oMJ2rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727199143; x=1727803943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZBzYcZ4Mh6BTIIyGTttOLVwGRQNlS1mpBLi2ZJFdoQ=;
        b=u+il9giOEZu6mh/aHyiIOx/7UiEN+5kCssYE0yfhOMkE4AqhJ2YKGpFsiNkppixtmz
         h3F3lOepqhuq6knUWtLUrV4Z5AmiUzi4mZ/93m5wI4pAa/QtQdZgJGelY8KW4+TRBew0
         IpnSYcV1aa3A/OZQlaV641KQHmECzgjdAFQa2RHrhdiR5TNWcJwXoYgdduqzKe6Yjkk0
         X0KHpUotLUjEUjF0MjIKSIvCUS9MGqli8fDemljVQPNb77UZ3XLVaxJGmC0+85IddQpV
         91weqm7iqtu4kYQbf5bHMFTBwQuFqj3o49eIsEBfVeo1pNn4syprGPBdRAQSXPa5vRvz
         PANA==
X-Forwarded-Encrypted: i=1; AJvYcCXLGVIs6kyDIo6yaiyFLhJByRmE7tLt5k8jM9KyyGgAny1NjttLT84a97WIOL3t+SPrbAiN79oBoSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyRabNZVK4bBwOGuwqv0248Mzy7Oo5Y6ObJC8IB07nSid7Ul60
	uGKHUTk5Ua8/ozTQInUsJ3a7iNzqtfWMe1NohCt+2YMe6oMwzmtg1Q1iMi1WOuo=
X-Google-Smtp-Source: AGHT+IES6pG6ycF2j3PO0E9CRWfuFEXkxz5CYADeWnWi4IywxR1jSMHYvYOiQfDodjuVtqL+6FeUsg==
X-Received: by 2002:a05:6512:a93:b0:535:d4e9:28bf with SMTP id 2adb3069b0e04-536ac32f325mr8403973e87.46.1727199142688;
        Tue, 24 Sep 2024 10:32:22 -0700 (PDT)
Message-ID: <bb86595d-20ff-4039-a8e6-c41fde4deaee@citrix.com>
Date: Tue, 24 Sep 2024 18:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/ucode: Improve commentary for parsing AMD containers
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240913123954.1907305-1-andrew.cooper3@citrix.com>
 <8e3d28e4-1789-4fa9-8d9d-f2912cc28868@suse.com>
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
In-Reply-To: <8e3d28e4-1789-4fa9-8d9d-f2912cc28868@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/09/2024 6:56 pm, Jan Beulich wrote:
> On 13.09.2024 14:39, Andrew Cooper wrote:
>> Despite writing this code, it's not the easiest logic to follow.
>>
>> Shorten the UCODE_EQUIV_TYPE name, and provide more of an explanation of
>> what's going on.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I'm okay with this as is, so
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> yet ...
>
>> @@ -335,10 +335,10 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>>          buf  += 4;
>>          size -= 4;
>>  
>> -        if ( size < sizeof(*et) ||
>> -             (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
>> -             size - sizeof(*et) < et->len ||
>> -             et->len % sizeof(et->eq[0]) )
>> +        if ( size < sizeof(*et) ||                   /* Insufficient space for header? */
>> +             (et = buf)->type != UCODE_EQUIV_TYPE || /* Not an Equivalence Table? */
>> +             size - sizeof(*et) < et->len ||         /* Insufficient space for table? */
>> +             et->len % sizeof(et->eq[0]) )           /* Not a multiple of equiv_cpu_entry? */
> ... this of course goes quite a bit beyond 80 cols (yet worse for the
> other block further down). How about
>
>
>         if ( /* Insufficient space for header? */
>              size < sizeof(*et) ||
>              /* Not an Equivalence Table? */
>              (et = buf)->type != UCODE_EQUIV_TYPE ||
>              /* Insufficient space for table? */
>              size - sizeof(*et) < et->len ||
>              /* Not a multiple of equiv_cpu_entry? */
>              et->len % sizeof(et->eq[0]) )
>
> ?

That really interferes with legibility.  We explicitly tolerate longer
printk lines for legibility and grepability, and this is the same.

I've managed to reduce the line length a bit with some rewording, but
I'm going put it in with this basic form.

~Andrew

