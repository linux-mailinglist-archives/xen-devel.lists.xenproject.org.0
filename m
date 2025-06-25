Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA3FAE8682
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 16:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025000.1400748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUR9T-0007Kl-C8; Wed, 25 Jun 2025 14:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025000.1400748; Wed, 25 Jun 2025 14:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUR9T-0007J6-9L; Wed, 25 Jun 2025 14:31:03 +0000
Received: by outflank-mailman (input) for mailman id 1025000;
 Wed, 25 Jun 2025 14:31:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8rF=ZI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uUR9S-0007Hj-3B
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 14:31:02 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01b25bb1-51d1-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 16:30:56 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so619373f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 07:30:56 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e8114795sm4867080f8f.92.2025.06.25.07.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 07:30:55 -0700 (PDT)
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
X-Inumbo-ID: 01b25bb1-51d1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750861856; x=1751466656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AfoV0ok+azQOUk9Jz8s1HVQ7+dgn6nR8KSlRZrz/LRc=;
        b=aoFuBjML/fSt4tR1hqGXHLl2w/3ud7hzvP5yFWH6ct+NOQPKJIiOwMokw6b53hzeht
         eISgTA9QiTTzuEMC6pwUPYWlLG9f00bDG1AAnuucTlwVouJXgs9eOjAOMkSvfSnMR5WN
         IEM30mEpLF5U245ShybQpIgSRTASUEMFPxm9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861856; x=1751466656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfoV0ok+azQOUk9Jz8s1HVQ7+dgn6nR8KSlRZrz/LRc=;
        b=fOFoC/uWKKnCZk2gMS52zMIGvxilKPyLNMHGsB8pof37nQbFKwZAV8JjbnkfCWJcGT
         2S7gWcmozK/PS4RTYkMZEevW/puwAB4Mn6igKvo+Ey4JewOxWUYE2YR8awu5h58HfFlU
         KLb/et40yvfRCIFnkNt5N06uUK91/FLPE+l1pnN9Lh34zpgDPoUIkx2zrBInr19o1WVa
         +nyolMTWFJQM5LLIA/iIDBDZQLYNoCLzU5l0ZDS3OozMUISxi7o1vK6iAwnZG8yL/M3n
         Umwm3hqNGubtQtamCME+duDUDGj5ZmwBIUPwMU5ZdxJ97NLbacypa/hwlBq2Cs/8LPjr
         M7vA==
X-Forwarded-Encrypted: i=1; AJvYcCUmWKoydCmUrTBCNYn7GbViU0TpV9LousoxVOU5/mXbBkt9Mxi24AlVG6lmZT7clEF2om2WKmO9FDc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyazkJnh/IhokV5SqUSasy32ccVvTE2cu7RL4ZfsF2wffyTb0Fn
	L15AidkHUhge1wlGcd775sDVmOtucUqOiApPrXc1HBRrltFDwgUpHwMieXrcLqyO1IUlgVD6S/c
	+52HCAJFjbw==
X-Gm-Gg: ASbGncv9UoRxCb+JONtZEp2cfEOAg6MSsnGX1GJoGNWYhUNspKvYbfCHC2Hl9cVpWlG
	/fHvUgPxqJC0QSG+3h2tq3yMBUw0gg+7c58gVb9c+3mdXoYCDoGM8zA7PvYmxh5AVyTBXw+0psB
	0xYl3ZuBGWpZ/KhD4UU2n3wfOplyckcRkVrMVYWoEtuDM3Y44I0/1gbMA5FaFnMCg478QbI+4er
	8eXPpFJCI5zFqjZrnL4qx7tz609dPaKjgXXRr2GxjEk3TQ8rnYELOZhTtJH+SyAkNePhpP1MY0R
	gGLFwcQsfbclvnrDZknS2kwCkUKXJC1cOgyMeUgwoQY6l9XEw7NaIB3sQiWQFibL6u5ppypE7Wq
	YBxWC9oBFWDAAqbuLEUGe3j9NVMk=
X-Google-Smtp-Source: AGHT+IG0Kr73omSq5ZOcD9l0skpoHlI828vWdcJ5jZ596WJZxDcKTuUVAfysoPI+0MqI/YyCzv6pYQ==
X-Received: by 2002:a5d:5846:0:b0:3a4:c71a:8119 with SMTP id ffacd0b85a97d-3a6ecf5d361mr3211910f8f.25.1750861856133;
        Wed, 25 Jun 2025 07:30:56 -0700 (PDT)
Message-ID: <e3b5921c-bda5-4a8a-94e4-c65100216b08@citrix.com>
Date: Wed, 25 Jun 2025 15:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stubdom/grub: avoid relying on start_info definition
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20250625110843.24840-1-jgross@suse.com>
 <b6fb9ba0-7d37-41be-ac21-70604739202c@suse.com>
 <d18ab226-183c-4c3b-b0e8-6d2aaae953c8@suse.com>
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
In-Reply-To: <d18ab226-183c-4c3b-b0e8-6d2aaae953c8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/06/2025 3:28 pm, Jürgen Groß wrote:
> On 25.06.25 16:20, Jan Beulich wrote:
>> On 25.06.2025 13:08, Juergen Gross wrote:
>>> @@ -432,3 +431,10 @@ out:
>>>       allocated = 0;
>>>       xc_interface_close(xc_handle );
>>>   }
>>> +
>>> +static void call_start_info_hook(struct xc_dom_image *dom)
>>> +{
>>> +#undef start_info
>>> +    if ( dom->arch_hooks->start_info )
>>> +        dom->arch_hooks->start_info(dom);
>>> +}
>>
>> Maybe add a comment ahead of the function clarifying that it ought to
>> remain
>> last?
>
> Good idea.
>
> I'll add:
>
> /* No references to start_info of Mini-OS after this function. */

Given how few uses of start_info there actually are, can't you just drop
that piece of extreme obfuscation and make this work like regular C?

~Andrew

