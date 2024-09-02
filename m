Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3D968507
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 12:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787785.1197246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl4Vg-0001tU-0o; Mon, 02 Sep 2024 10:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787785.1197246; Mon, 02 Sep 2024 10:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl4Vf-0001rx-UL; Mon, 02 Sep 2024 10:42:11 +0000
Received: by outflank-mailman (input) for mailman id 787785;
 Mon, 02 Sep 2024 10:42:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl4Ve-0001rr-Ep
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 10:42:10 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00827b8a-6918-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 12:42:08 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so1600842a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 03:42:08 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c7358dsm5374140a12.38.2024.09.02.03.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 03:42:06 -0700 (PDT)
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
X-Inumbo-ID: 00827b8a-6918-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725273728; x=1725878528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GQUS8dySU+jj9uW6A0PDfl97YL5BI5Sv2mxyU+OK9xM=;
        b=ROEHiaU2AU4PP7KDFqldalfHObWqav5od59hdAS+ALKRNEfOopeJkXfQann0MI+WU9
         adXfJW9jO+w4Rox17/rqkNFPWzAUpghARTgVBZV7tdadob0+sISATEa7fXeybzZEajI2
         jkxKaUmLWT5e0JVMcTYW4gbYTzMmnuxLxPEr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273728; x=1725878528;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQUS8dySU+jj9uW6A0PDfl97YL5BI5Sv2mxyU+OK9xM=;
        b=rke9uSpBc+6xxfcNAs5Y/MFN2QcKVFK/JnSzMY2zxIiBvoKaA+tVeD7m2b6uWxmdyA
         8M7M26FrOZaFJRdjmjfADBfN5+xLmFgt0K9rtBs7uotrp+UCKjelanl2e7lsHABzDB0R
         hicJBuXVMnxEm/skplkVFznFpPTI0kEAfksZ4CapWOIjZ8n44o+brQRBaoHwYQq0cnhO
         cgFBD73/63QwrlyXIv7JtHwWoObAEzQPKHqq5oqzGCzWPSNWr/1RxOCXgjCZov24raL3
         ySwTGz7k+TlLPAtoepsw22w8ibJYsmupD1QBK8jAVQ/qhqervgv0ZQ0/8568psqkPDJv
         oJ9A==
X-Gm-Message-State: AOJu0YyCQ+DrXKEgXoUBUqlhuOiVs9KXAh8VhGHMOf1p7oFakGSgY037
	eWz73wR+Kln7zCpMTAdEgob4FuCS0wmW9lTuMbetd0Hrf2wSFJO3KUVJEXT8Yio=
X-Google-Smtp-Source: AGHT+IHNEhpw/R0ln3nWUMHLmzxWsTSekv6jT+K6054HFWD55qI+IwB/oSNulYNakMbhQ2tBI78FnQ==
X-Received: by 2002:a05:6402:90c:b0:5c2:43a0:47e3 with SMTP id 4fb4d7f45d1cf-5c243a04904mr3685610a12.36.1725273727058;
        Mon, 02 Sep 2024 03:42:07 -0700 (PDT)
Message-ID: <eaa1c7d1-c1ae-4e42-b9ee-3c0e9fc50d88@citrix.com>
Date: Mon, 2 Sep 2024 11:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Use C99 types for integers
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240829115247.168608-1-frediano.ziglio@cloud.com>
 <594b5ad4-0b86-4397-a261-0e98515e3abe@citrix.com>
 <CACHz=Zj3Mw+7EbbB3vdndu5bzhXEN3p1JV4Dzm12Xt2EE1AV+Q@mail.gmail.com>
 <b8652274-e65e-452e-8b2e-d0b0a93d0be1@citrix.com>
Content-Language: en-GB
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
In-Reply-To: <b8652274-e65e-452e-8b2e-d0b0a93d0be1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2024 11:16 am, Andrew Cooper wrote:
> On 29/08/2024 2:42 pm, Frediano Ziglio wrote:
>> On Thu, Aug 29, 2024 at 1:07 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>> On 29/08/2024 12:52 pm, Frediano Ziglio wrote:
>>>> diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
>>>> index 239b9f8716..ee1a4da6af 100644
>>>> --- a/xen/arch/x86/boot/defs.h
>>>> +++ b/xen/arch/x86/boot/defs.h
>>>> @@ -57,7 +57,7 @@ typedef u16 uint16_t;
>>>>  typedef u32 uint32_t;
>>>>  typedef u64 uint64_t;
>>>>
>>>> -#define U16_MAX              ((u16)(~0U))
>>>> +#define UINT16_MAX   ((uint16_t)(~0U))
>>>>  #define UINT_MAX     (~0U)
>>>>
>>>>  #endif /* __BOOT_DEFS_H__ */
>>> I'm happy with the change in principle, but could we see about dropping
>>> defs.h entirely?  For example, we've already got both of these UINT
>>> constants in types.h
>>>
>>> Since this was written, we've got rather better about cleaning up
>>> xen/types.h, and extracting macros into xen/macros.h
>>>
>>> I think there's a good chance that the regular headers can now be used
>>> directly, or with minor tweaking.
>>>
>> I tried, it gave a huge bunch of errors.
>> I think it can be done in a later follow-up.
> Ok fine.
>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> However, doesn't this mean we can drop the block of typedefs in the
> context above?  Happy to fold that in on commit.

Nope, that breaks differently.

I'll put the patch in as-is and cleanup can come later.

~Andrew

