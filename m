Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD32899593B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 23:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813627.1226626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHeN-0003ZL-0a; Tue, 08 Oct 2024 21:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813627.1226626; Tue, 08 Oct 2024 21:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHeM-0003XE-U6; Tue, 08 Oct 2024 21:21:46 +0000
Received: by outflank-mailman (input) for mailman id 813627;
 Tue, 08 Oct 2024 21:21:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJPt=RE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1syHeM-0003X8-Aw
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 21:21:46 +0000
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50d8a4b3-85bb-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 23:21:43 +0200 (CEST)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-5c5cf26b95aso7909843a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 14:21:43 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e049ee6asm4753694a12.0.2024.10.08.14.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 14:21:42 -0700 (PDT)
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
X-Inumbo-ID: 50d8a4b3-85bb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728422503; x=1729027303; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yd9WEwnsnJKheWOILYBzZ54uW/JbW+1jjW4WUdGAmIo=;
        b=nibKVaHif34mODO3YmGQZ8unpZul12HW/ut0M49yZryHrlMKdbsb7gxuvyGWfkqGME
         YNQKpbZDQyha2kNjWzaUUa9BDpIlumr86msYl0O5YTEfmf2Y2jMfLBpZIBm4qHSBL9Zk
         IO/Q9h7XnxqKVhxbHzgpbxQpr8+fPjOpLJk/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728422503; x=1729027303;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd9WEwnsnJKheWOILYBzZ54uW/JbW+1jjW4WUdGAmIo=;
        b=k7TJhKE7k8SmHcSIWudhhcu/6OGMKkLcpJV3KaCuWtq+BmBh4fEP7Qbk8RoSQKgXK2
         E5+ui7Pre6u6MeopRLVtzRd9jHDRhQY3CBMecQmdqmaUZkgIbQXdHchXoMrLo7ASs23z
         MFJf2RfzpMvXuVKmFLsGb9t4ivlLuJreyv9wNSp/VldEfP6+s6NeYs9GKyizbv4AvteS
         mmvVLT10cs8z1DOgZebC0vlsivIwaT+a7g4waF5R0i2h1xYWxEZJKjXBXfHqIir215OD
         LX+lTMpO/4Mp12X18lOW3tlM5jqshpUTr16dH+4aW4esS1ud/QbfjvCIjYU1iWAxkeO1
         ss1A==
X-Forwarded-Encrypted: i=1; AJvYcCVh+dyhxscn8c4OEyI7ri7jqFFkj81WeUHGSdmBLKmIIVb3fWr8R7Z7HZcHxHsddqD1VS9/MehAwd8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFC5L9LgGmbqLYv9BjG8gSRSHa+LDe7yZBe66WawJsJlUUvZBl
	ZHf4sbsZqu1vDd0ueJfN9qAMGI38Kbg5MkgNB9A5eaWTdlu9dWszT2eR3SUellE=
X-Google-Smtp-Source: AGHT+IGNpB1fRI1wsOM2nHNm39qQSFZ3UB0dvS9vwTVjLNoj2f1rOZZV6AckbpBrTvMgnGUZ9SYf2g==
X-Received: by 2002:a05:6402:3512:b0:5c7:229a:b49d with SMTP id 4fb4d7f45d1cf-5c91d6988f4mr186771a12.30.1728422502781;
        Tue, 08 Oct 2024 14:21:42 -0700 (PDT)
Message-ID: <539a4947-9f2b-497b-a553-ff6ccb3adfae@citrix.com>
Date: Tue, 8 Oct 2024 22:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/44] Boot modules for Hyperlaunch
To: Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <11c20a80-65a6-4b77-b890-775ac2d72af1@amd.com>
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
In-Reply-To: <11c20a80-65a6-4b77-b890-775ac2d72af1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2024 9:07 pm, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> The Boot Modules for Hyperlaunch series is an effort to split out
>> preliminary
>> changes necessary for the introduction of the Hyperlaunch domain builder
>> logic. These preliminary changes revolve around introducing the struct
>> boot_module and struct boot_domain structures. This includes
>> converting the
>> dom0 construction path to use these structures. These abstractions
>> lay the
>> groundwork to transform and extend the dom0 construction logic into a
>> limited,
>> but general domain builder.
>>
>> The splitting of Hyperlaunch into a set of series are twofold, to
>> reduce the
>> effort in reviewing a much larger series, and to reduce the effort in
>> handling
>> the knock-on effects to the construction logic from requested review
>> changes.
>>
>> Much thanks to AMD for supporting this work.
>>
>> Documentation on Hyperlaunch:
>> https://wiki.xenproject.org/wiki/Hyperlaunch
>>
>> Original Hyperlaunch v1 patch series:
>> https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg00345.html
>>
>
> There is a lot of re-formatting of function arguments like:
>
> -static int __init pvh_load_kernel(struct domain *d, const module_t
> *image,
> -                                  unsigned long image_headroom,
> -                                  module_t *initrd, void *image_base,
> -                                  const char *cmdline, paddr_t *entry,
> -                                  paddr_t *start_info_addr)
> +static int __init pvh_load_kernel(
> +    struct domain *d, const struct boot_module *image,
> +    struct boot_module *initrd, void *image_base,
> +    const char *cmdline, paddr_t *entry, paddr_t *start_info_addr)
>
> I feel like the old style is more common and I prefer it.  But I also
> don't see it specified in CODING_STYLE.  As I am not a maintainer, I'd
> like them to weigh in.

I already did.  :)

This isn't a terribly bad example, but there are others which are much
worse.  Given a choice between an intractable mess of parameters
squeezed onto the RHS, and the same mess spread out across the whole
width, prefer the latter.

~Andrew

