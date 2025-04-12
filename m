Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA0EA86E38
	for <lists+xen-devel@lfdr.de>; Sat, 12 Apr 2025 18:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.948365.1345654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3e8p-0007QB-H9; Sat, 12 Apr 2025 16:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 948365.1345654; Sat, 12 Apr 2025 16:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3e8p-0007Nr-Ds; Sat, 12 Apr 2025 16:55:39 +0000
Received: by outflank-mailman (input) for mailman id 948365;
 Sat, 12 Apr 2025 16:55:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsqC=W6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3e8o-0007Ni-C0
 for xen-devel@lists.xenproject.org; Sat, 12 Apr 2025 16:55:38 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3b060ac-17be-11f0-9ffb-bf95429c2676;
 Sat, 12 Apr 2025 18:55:35 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso22858485e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Apr 2025 09:55:34 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c102sm5602186f8f.35.2025.04.12.09.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Apr 2025 09:55:33 -0700 (PDT)
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
X-Inumbo-ID: f3b060ac-17be-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744476934; x=1745081734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5Bk2fbldaX7E4BLzR3sE8/W+ib7ivsITT5HFQsc7Aoo=;
        b=G5Q7sS625SEkgxQyKJ3JFnPMJ0bikp7J+l4onl79mzGg3SAVW29nV8yU8zitwlP1Gq
         yjj1s+X90H6yW8RcDqloRMONAVoenZQN41Gy41uIgSBL9aC5FJrB1a+XzOCk07Ycx5+Y
         9AxSnTsFppP0Wsi7N6ulJbiI3821an6GO5TXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744476934; x=1745081734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Bk2fbldaX7E4BLzR3sE8/W+ib7ivsITT5HFQsc7Aoo=;
        b=Ic9HL35IHcysxXjHDE6bHafFqhuR3CbPmKqwORwOsCfDUgYrdlddCpMbVcXZetDMb1
         dx801qU0tYv2jv51G7oka+xOfIvdhidGgVoAsuWSXCoXPmOLEuECceYRvk7Dm2Pfx/lh
         kD+Bsb7WPaf+kP7CkzrSl0hoMn6ZU8fQeenFCHZmyKTVQ7eYBMYr6m/ab/GlHgcfTQ7H
         BZ+yqftil9Rfu3z3KOisPsIbdsTSbj9W8Sa3ZQ5Kt0lPm2JJditsphocPY0NyxNQzFfd
         9259y952lR8NKZVmfT8HeJJWwmo+W/osLzrjJHKLWF+3Rn0BI34/vbDkJmwRqiwobLxN
         sKKA==
X-Forwarded-Encrypted: i=1; AJvYcCUmsdY61ncx3TgfhjaH1gWaV2sW2H3qekbOOpNjcc7qYj/9pSypQxeyKNggE1PaH6uiNbc2dbQbfLQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyC97w1yqS8ZcMS33corHItr0+G0KsOgrx8o5dFEWwbesx+0Q8t
	S+oHH9ZQB6+oSta7bm4Z4Z4tQhfjXljGFGMH1412jDJEqrY0eb/d1Itng24MCxU=
X-Gm-Gg: ASbGncsFuZSLiayzC9u4SJGFks6Eeem2xxl2JNXJWpiXhf9YCsueUBApJfKJaolklwE
	j15kWWKYQz5TxWdiV44AgBUk1ykkFRIKWaMHFZRAFMfudmo0Uz0oB1j6KqI4l/ypEqGaZ8fvIOL
	wSPc59pm31wdgd/c8mtkdg7gf5Gg08rGo36qWrEyL/cusqnK/HfgwTZ6ksBUFPn0SUaqXJz5tzB
	WwIb458+spCZgAguznImQYk6mlpimRtG0KqvcPy8QNH4FNZ+GqiDDBGaYgMbX41SrOIaFCHZdWH
	VEp0i1mzfnmaNOp6+QJcERbG8C/+cnA6b+e/micVqINSxCwOpLGYbljpx/n2Q/DkCMLV1OAJ5yS
	wgVglng==
X-Google-Smtp-Source: AGHT+IFgnOx6WsAvvWWEwYf7tId+hL0DXnnUVFFifqm8c+3hhf9EwwHjfyTwtA8xD45Dwr6wgqIl4A==
X-Received: by 2002:a05:600c:4704:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-43f3a9af837mr69696555e9.30.1744476934272;
        Sat, 12 Apr 2025 09:55:34 -0700 (PDT)
Message-ID: <187ce1a1-37bc-408b-af99-75c0c495a660@citrix.com>
Date: Sat, 12 Apr 2025 17:55:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] CI: remove now unused alpine-3.18-arm64-rootfs job
 and its container
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
 <733860a00926d1d2d50e5914a783e5d777828442.1744403499.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <733860a00926d1d2d50e5914a783e5d777828442.1744403499.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 9:32 pm, Marek Marczykowski-Górecki wrote:
> This got moved to test-artifacts.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

