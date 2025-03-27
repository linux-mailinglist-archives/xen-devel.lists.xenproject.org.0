Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B4AA73709
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929780.1332541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqGg-00026K-H8; Thu, 27 Mar 2025 16:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929780.1332541; Thu, 27 Mar 2025 16:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqGg-00023o-Do; Thu, 27 Mar 2025 16:39:46 +0000
Received: by outflank-mailman (input) for mailman id 929780;
 Thu, 27 Mar 2025 16:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txqGe-0001ZW-L1
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:39:44 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 165b3893-0b2a-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 17:39:44 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so999719f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:39:44 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a4351sm1609f8f.98.2025.03.27.09.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:39:43 -0700 (PDT)
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
X-Inumbo-ID: 165b3893-0b2a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743093583; x=1743698383; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oxMPPXkAvI+gvmLy1xLY8OfmQWWRZLx6EA/Lj/Py4QA=;
        b=sTU1c4iGUol2WFpml6QNgacKjjFRgK1utWznnWORJGwAQUSayPgEa3nrH3vaUnU/rK
         qi7HWYRxYuwyHQ497StaGRtuaN5YlKd1yOokvhCRungSyOGqmP8L+aN4C+u2QIaDSz9X
         5F9zq8TxSSOLRtWZPn/tyc8OXi/M7IXjHTIbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093583; x=1743698383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxMPPXkAvI+gvmLy1xLY8OfmQWWRZLx6EA/Lj/Py4QA=;
        b=LRlH7reHprZPRUeyegEpIeqSi/eNV0wjVGu7fT6VBSwyP/ZGPBdvj44fJEyhTKHrDg
         61gB5NJuYoJ3Em/uTjdRWSqlOFt/XIIH/1bn6YAYlkyYD/OXdSL/kemVHfGXztd59xMG
         L5Buanvi+Y760DQj6KNKhO0pBU1+RB0Ecx6l8WyPAUkYqAdgxhWnvy8/1rqBXtaieoB4
         sgArN/0VVWq3HnItBmQF+zhoHxS+jIiuBMVZqKpz3ZwiI16pvkMGBgaILuZufG4VJmr5
         R/ERbPyIjYB+iWV/Bg9Qb14jxiwCHrduUIrWKldumNYQLTgofncj+UJ0siEZu2QEvWYY
         A/8g==
X-Forwarded-Encrypted: i=1; AJvYcCUbAIG9dMOpL9ziE85sDZ4oINEgj75b0rluWS6SlDy2vQuibfCRuMcCyiD+1uTGTE3nNKEcVsSV+GY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygcMB6AcgqvHPXa8WacS3f5xDYjppIkjGsWmGzmPG6f0OhS6Ax
	dIGOugajEESz1SuKaGKp1iAEj6E2b4LMwOuFCJF3nZMe8xKzSZshvdt1+U/RLBw=
X-Gm-Gg: ASbGncvEiyU6EgucSKtonNXwxE/eLqQ43I1LVOeYe+vQiK/0O2pVp2P6jT0i0bQ66qm
	45vqwcbQP0bOdWOO/Ml1jBsrHmjL6YC3DFdUuPwv0v0evyXuipVhJ/F2DipWCnyNiT4vlkJv9Ts
	9AK+2H+uWV1s3i43pndM/8iTDG4BeKweLLWOu/J/ibse6FvkaoUFUpsTD7n2BFRge/IPRX2Q6Dv
	7DkO7Ibt0QTxU0DzlaoDAfvMgT1WLrOCiobB+FnrFNA6R7iJe5/xBjxsGT1xMN2lm5gM4A7Ez+c
	1KSYptQ/yFaDEfEc66+1V6Y2JRP5VXYK97vMjefXP4QUUQzqzCL9MpbfcJysemn6qhQXCnQaEh2
	n4US0QNCCuIQFRqPc43AL
X-Google-Smtp-Source: AGHT+IFo3ToomADe0Ae0GGHPu0thqmg6LomJNG/QQmhwF8/Riw4q6qCoy0UZEr/YgX6LKhp4tC+miQ==
X-Received: by 2002:a5d:6da1:0:b0:38d:d0ea:b04c with SMTP id ffacd0b85a97d-39ad175c0c4mr3788084f8f.38.1743093583538;
        Thu, 27 Mar 2025 09:39:43 -0700 (PDT)
Message-ID: <95aa0a68-d833-4161-b1f4-fb5333f78d91@citrix.com>
Date: Thu, 27 Mar 2025 16:39:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Xen: Update compiler checks
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250327163114.405824-1-andrew.cooper3@citrix.com>
 <5dcde3f5-efcb-42a3-9281-886ce4d80fc4@gmail.com>
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
In-Reply-To: <5dcde3f5-efcb-42a3-9281-886ce4d80fc4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2025 4:37 pm, Oleksii Kurochko wrote:
>
>
> On 3/27/25 5:31 PM, Andrew Cooper wrote:
>> We have checks in both xen/compiler.h, and Config.mk.  Both are incomplete.
>> Remove the one from compiler.h, as it's pointless to perform in addition to
>> the xen.git-wide one as well.
>>
>> Expand the checks to cover RISCV wanting GCC 11.1, and to cover Clang on x86.
> Why GCC 11.1 for RISC-V? We declared in ./README that 12.2.

Sorry, that's me not paying enough attention.  I'll fix.

~Andrew

