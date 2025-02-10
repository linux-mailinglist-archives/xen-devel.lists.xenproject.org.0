Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A999A2FD7E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 23:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885035.1294798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thcTV-0000Hg-Ty; Mon, 10 Feb 2025 22:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885035.1294798; Mon, 10 Feb 2025 22:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thcTV-0000FW-Ql; Mon, 10 Feb 2025 22:41:57 +0000
Received: by outflank-mailman (input) for mailman id 885035;
 Mon, 10 Feb 2025 22:41:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHzs=VB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1thcTU-0000FQ-Jy
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 22:41:56 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39d0eed7-e800-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 23:41:54 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so12257505e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 14:41:54 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dca34a8sm157233275e9.16.2025.02.10.14.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:41:53 -0800 (PST)
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
X-Inumbo-ID: 39d0eed7-e800-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739227313; x=1739832113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4glV2Rm6cGlhlx6BtOqQAjQsbuarG29ZF+17TuXXOLE=;
        b=C7NLj0TFQTls3EUObfvV/TOn57Oyr1YM6j7JVZhuAOH0hg5E8IUGYp+3Ry28EPymMX
         ciKnY73AyGwHn4BJ3EXh7PtslbZKGa285ArG3e1+RPthqNuwHferDjMAtwCJKYBE7PEb
         x+WkA5PQgJm2g3kWE0Me6Q2ntTNC01zDyfOAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227313; x=1739832113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4glV2Rm6cGlhlx6BtOqQAjQsbuarG29ZF+17TuXXOLE=;
        b=oMdCDzwRlf+R6Y4JDOZIkYBqVQz+Pnzw4mUFxiEpiSyJPmKC8DlExZbx3LVJDCUDKi
         U3fNpT60xkdlVDywF13LDmcKYrZWzh6hlIwepqKpZ90PLpMsPLB0AiBVhXVAlp7N0OBe
         9+vbpV/PtyuDA3fB+LVXR0DffRxvXXwsGHA1wtiMngQrgC7wub4tdWJfGGXJSRuToJk4
         goIfb9t18TGQQKqvBtc6PhPnbqPwEPKKfZzzcBTliWdzxZ5gQEjq72trcfL6rgIm4eV4
         3e7OArCJ2a88TPvJEJKYdmDcb9ro+DZWVLCVVXfy75pNKv1aq2TYVk2qUhfp/KEtNr5+
         egdw==
X-Forwarded-Encrypted: i=1; AJvYcCUcpJjiJs0Qtd5GHyjYaZu5+/kLJrmZfozlS8lY9l0GDlwMjutYGcyJYU/5t5fDAzfW9ZQ+tZmTaEU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+xb8GbhGiZsCt/zpctChZMjQQ2y74zvRv+raxodKDoAoikMMc
	z9GMgDkIdzdDbS6m+ldv7cb2x0PPiqQKEX71v5TUbHYOFznfOmB3oMbBo/MYqEM=
X-Gm-Gg: ASbGncvC+Owt7jVbRb2Rak7JOFwC/ciBQfIK1Jf3wXCMZu2DxM8WYQq037AJtWdSyFL
	0zkQdvaaRFeLuLJIFZrI+tw769kHQ+wT5Ge3gNhIjKy880gXPAudcUih1iQNlKNEobXtXQdNks0
	Q6/wecLwRw39+eSKHY7eWPJQDPQSYVaOvEft4gnj/FsK3WLnhjm4eGlT0/emKEuQPNdMVZrcav7
	rQetTH7iCqwAar4xKnyTtd+uTrcRQJ5FyOD3M8Jb8qIh0e9C8770jCT7CN0KHl5ay0ezzUsuk+5
	uTw6ui9xWxcvqP+inZOFckSJyvfgf5Kwrgpe/rlKf01GyuA4nHuqv+M=
X-Google-Smtp-Source: AGHT+IFmgy8sOw1LuvrmtEMTMNxXq6ie2Y6m6Aw9bsghMfBKjhIwwrqbqL01NX9ixaVRoP/njKs+Vw==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id 5b1f17b1804b1-4394c853a2dmr14408775e9.29.1739227313548;
        Mon, 10 Feb 2025 14:41:53 -0800 (PST)
Message-ID: <ea51509b-034b-4fa8-8a3f-8304a2bc48f3@citrix.com>
Date: Mon, 10 Feb 2025 22:41:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: Fix register constraints in
 run_in_exception_handler()
To: Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-3-andrew.cooper3@citrix.com>
 <59a3a09b-d05f-4ad7-867a-bb41bf6e6c54@gmail.com>
 <c93ad2d7-6ac2-4a5b-b6d8-07459a2884b6@xen.org>
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
In-Reply-To: <c93ad2d7-6ac2-4a5b-b6d8-07459a2884b6@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/02/2025 9:31 pm, Julien Grall wrote:
>
>
> On 10/02/2025 09:21, Oleksii Kurochko wrote:
>>
>> On 2/8/25 1:02 AM, Andrew Cooper wrote:
>>> Right now, run_in_exception_handler() takes an input in an arbitrary
>>> register,
>>> and clobbers BUG_FN_REG.  This causes the compiler to calculate fn
>>> in the
>>> wrong regsiter.
>>
>> Probably, we should give a chance for the patch which suggests to use
>> GENERIC_BUG_FRAME:
>>    https://lore.kernel.org/xen-
>> devel/8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com/
>
> That would be the ideal if someone has time for it. Otherwise, patch
> #3 needs to be modified (see my answer on patch #2).
>
> But I would also be ok with this as a stop-gap for the time being.

Getting ARM onto GENERIC_BUG_FRAME would definitely be best all around,
but that is an almost-2-year-old patch with an open "it doesn't compile
on ARM32" issue.

I presume that all which is wanted is *a* solution that compiles (and
works) everywhere we support?

~Andrew

