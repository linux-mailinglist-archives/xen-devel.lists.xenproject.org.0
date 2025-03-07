Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD6A57095
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 19:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905304.1313177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqcSx-0006L3-Vv; Fri, 07 Mar 2025 18:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905304.1313177; Fri, 07 Mar 2025 18:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqcSx-0006JS-Sk; Fri, 07 Mar 2025 18:30:35 +0000
Received: by outflank-mailman (input) for mailman id 905304;
 Fri, 07 Mar 2025 18:30:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqcSw-0006JM-Fd
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 18:30:34 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41564870-fb82-11ef-9ab7-95dc52dad729;
 Fri, 07 Mar 2025 19:30:33 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso2275537f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 10:30:33 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd947544sm58169745e9.35.2025.03.07.10.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 10:30:31 -0800 (PST)
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
X-Inumbo-ID: 41564870-fb82-11ef-9ab7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741372233; x=1741977033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgM6E48Rp8uSANZFV+oWiH5GSE6BZDIqr4f0J7ZKj+4=;
        b=YjBor4rahmF7eBlqFRszWcpbwsq9cB3iLXdVQ4fqLSzthJ8OkFYXDeLeV0jInVAgn/
         FT7Oelot25RUxCK4yy0Jq4r0HQ60uoXTQTLpPqaVCkmb1NVEV98eaLIrm+dVQgtLaIFS
         nf4swhEFYASizlVJpg/zTxCb6lIw2FCYsAeV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741372233; x=1741977033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgM6E48Rp8uSANZFV+oWiH5GSE6BZDIqr4f0J7ZKj+4=;
        b=bcVVSEZ8/VSBxEOWlxPqtaVALhKP5ruMNhuQGV04uILJr9Ahj7ZDdOGEltUho7XaWh
         BkWhjbW3hpa5flUbZpM9MYhMFNrN8QMyijocCrVFGlQr36vfzPrEtHFakttGezFtqilG
         G43ilC7z1ryHEAkyKGf/N6rfOqky9CMsxwLMNK8kK7TyF3LELOG8njL76P88Zk4NCSLs
         azwEwJIWcn0xzirXanPHm4kTLQ2rj1VwMdfb8pBgNe9ndDd2YdplmPe5QGBNM5SL7BmO
         b3WKSoHjgOBWtv+nHg1epAdWOSrF4VJNA9qQGdkAImUsvgil9A3TibnGQp2lIozr2wKS
         DvKQ==
X-Gm-Message-State: AOJu0YxaeqJvHDQdLb3PxqiKEusK0wf743PDwADqofeYZvVqUxC32qS4
	oy9ersVQwaZ0ubcIvzF+FJpUKqdjQkjN6XoBGZuUJhSAzeuXnYuOmSWO1QEqnZg=
X-Gm-Gg: ASbGncsR9ygwZn/Ae+yg15f+/3cZvvLnSgb0P/hJ0kzBucZEoebF6m1AqAm7Lpnnu7e
	KJBO7v5d9wnkZlphHJzwP7ev1Og2ZMBALlePpF7hg5eUYf28r3v4QMwQBJOjQMvPGBZULJ70F2O
	rbWlPVlLRQ8Dm2s22UnmDQdF3FZ8iMuAVnNTvBHFDMKsa6zLui4KVPPJaLM1zGZOMhC7wS8mGdW
	BPQRbwS0KY2G5B5/qXLF2sSBk1or21NHxwlomikeqbPiraIeQHGU1heK9AeVYEtX3IIMW+VTpmq
	woAah7wK0n9y3ccO9AFraukBSd1uPWWOXERRCHqvq+hn3ZYFKqAKNa2gvb7WerDh+bv1cHZJbOu
	6h/UlJ6dJ
X-Google-Smtp-Source: AGHT+IGm9Jse6osgnBI8ZEo56+3E+IM7PSQY7Me/nA3pltTYnJG3o4x3o0CTdg6870eHR4u9akEhgg==
X-Received: by 2002:a5d:47cb:0:b0:390:df83:1f22 with SMTP id ffacd0b85a97d-3913af390a9mr536004f8f.25.1741372232744;
        Fri, 07 Mar 2025 10:30:32 -0800 (PST)
Message-ID: <307ce623-9cb1-4dc1-beb9-abd78fc1f61d@citrix.com>
Date: Fri, 7 Mar 2025 18:30:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Update minimum toolchain requirements
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20250307175435.3089686-1-andrew.cooper3@citrix.com>
 <2aaa6042ec9f6220e6229878a13a714b@bugseng.com>
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
In-Reply-To: <2aaa6042ec9f6220e6229878a13a714b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/03/2025 6:22 pm, Nicola Vetrini wrote:
> On 2025-03-07 18:54, Andrew Cooper wrote:
>> and these too, but will require MISRA adjustments:
>>
>>  * _Generic() to make properly const-preserving wrappers
>
> Perhaps stating something that is already well-known, but this
> effectively means moving from MISRA C:2012 Amendment 2 as a target to,
> at least, MISRA C:2012 Amendment 3, as that version contains rules in
> series 23 for _Generic.

Yes, I was expecting something along these lines.  It's also why I don't
suggest we start using it immediately.  (There's *loads* of non-MISRA
related work to do when these changes get accepted.)


Part of the justification for doing the MISRA work upstream was so it
could stay "clean" on an ongoing basis.  The corollary to this is that
our choice of MISRA standard needs to adapt as upstream Xen changes.


Do you have any insight on how disruptive this would be?  I presume it's
not as simple as running sed over our docs and Eclair config, but I also
don't imagine it's a giant task either.

~Andrew

