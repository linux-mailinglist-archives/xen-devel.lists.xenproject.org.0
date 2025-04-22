Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF0DA96F22
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 16:42:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962696.1353851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Ep4-00032l-2q; Tue, 22 Apr 2025 14:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962696.1353851; Tue, 22 Apr 2025 14:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Ep4-00031L-0A; Tue, 22 Apr 2025 14:42:06 +0000
Received: by outflank-mailman (input) for mailman id 962696;
 Tue, 22 Apr 2025 14:42:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7Ep2-00031F-VK
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 14:42:04 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3c96dc0-1f87-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 16:42:02 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c14016868so5259818f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 07:42:01 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43319csm15748505f8f.38.2025.04.22.07.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 07:42:00 -0700 (PDT)
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
X-Inumbo-ID: f3c96dc0-1f87-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745332921; x=1745937721; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tOvLbPYmB9xOTdupQOQPZNZXhySugORIJllVBlp09fs=;
        b=nobM/bdyGULOi2zUqiQyvcmES3fiv08Gq7+cVJjcUR0RtDpDcX1ldPXYsf2F3SwTv1
         JdceIlzusG9bwRTIExHpcUD3pYeVn0WAEf7RlNo86/kkXf/Nlmbl3MZE3Woz6KnAMmXW
         rJYvPSh6BH6iNLWA9joEjHc0+9TWWleuECjH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332921; x=1745937721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOvLbPYmB9xOTdupQOQPZNZXhySugORIJllVBlp09fs=;
        b=wuqoLuR6jGahQiyc0dmeu1zPEu207dV4xcNau9XSuIgYT6Mlxoz43z7Rm9oY4gUd8h
         i2RtLqAb74uYyOMp6TjCXsfD8UP35pmzmbo1nozxJOmRJM0BS7wmJZoyEQI+XYJhjtgD
         RL2xJgwRuDiFQjT1oXfkCxhvOlm0VV1D1zxWvXGWGiZO9ZHFkcdxnvpDuMhF5j5ybPnQ
         iqKbbsQigVhDw8qfORtSKCWula75pDHP3m8BHrpBQrbxl1kiIaYL9rDfL3hvMTCzJpF+
         CugbfSG1jZc0TqJt2j12OfWGrhGEH0r1WOlYG/7KqfQWIPyNNeaZGKtagwuFBNbdZCj/
         34ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUTjw3a4HlejKgRrRN4JelhTmsJSTvM8Q64QV2yVRVrAGevH754pHCHCUCim2jhwCc+O+fhOqLzOiA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKbHSmjgmgaxg8NhtT49ZjovnKANKsMCKcB1yTMhJWUWWs+TET
	l1mYNxndugcwzVLZCed4VZVVdN1It9M/N6XzAaEllY1XMJX2jtYkvtBzOlSG994=
X-Gm-Gg: ASbGnctgz/6SkLxruCUQfnXNRM1/wlFrTdin6taN65Tjklv4V28DO8lwcFDyOSgBXmc
	/Dsiq3jttjwUlI7VBQMM9yGoDoMZxW41ibG2Lzm1dYklyI+iKly+0nWUrf68EzkuR7N56NUHqUM
	4ZchLjzUmHI41IVpzE3DS3CWDJNBLGzO45K7JjzoSihr2mvQ3BFUjWuoGmm9HY7je3jC9bMBTMX
	QETz8T5zNKEJDbtztG8IplrUq3JSKGy20gBhFU+Sa333QgbULaZpYJMv4sIn/x4eyBuFedB28gK
	vJqWVGAyIWR/tug4lURDl4Stj8mCvh0NItfQb5SNeMfNSAM4XuF71w==
X-Google-Smtp-Source: AGHT+IGyo/Fsvc+itcIG3nFG5wmArJrUINANGwSuqf2GNGQ3PvEa9YV3c2GnVcM0G1cdE+13D4fklw==
X-Received: by 2002:a5d:5f4c:0:b0:39c:12ce:6a0 with SMTP id ffacd0b85a97d-39efba4398amr14148277f8f.21.1745332921339;
        Tue, 22 Apr 2025 07:42:01 -0700 (PDT)
Message-ID: <53964eef-bfad-4d3e-93e5-8a18ba2f3cc3@citrix.com>
Date: Tue, 22 Apr 2025 15:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Include .debug_str_offsets in
 DWARF2_DEBUG_SECTIONS
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250422113247.1285339-1-andrew.cooper3@citrix.com>
 <82a02afa-c1b7-4656-8f34-bd4886c9fb9f@suse.com>
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
In-Reply-To: <82a02afa-c1b7-4656-8f34-bd4886c9fb9f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/04/2025 1:13 pm, Jan Beulich wrote:
> On 22.04.2025 13:32, Andrew Cooper wrote:
>> --- a/xen/include/xen/xen.lds.h
>> +++ b/xen/include/xen/xen.lds.h
>> @@ -56,6 +56,7 @@
>>    DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
>>    DECL_DEBUG(.debug_types, 1)                     \
>>    DECL_DEBUG(.debug_str, 1)                       \
>> +  DECL_DEBUG(.debug_str_offsets, 1)               \
> The alignment wants to be at least 4.

I checked before making this patch, and Clang uses alignment 1 on the
section:

> [8134] .debug_str_offsets PROGBITS        0000000000000000 16fe11d
> 21c868 00      0   0  1
> [8135] .rela.debug_str_offsets RELA       0000000000000000 2089e08
> ca6b60 18   I 8136 8134  8

Is there an official spec on the matter?

~Andrew

