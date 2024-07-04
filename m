Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BA5927463
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 12:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753694.1161884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPK3U-00083n-GL; Thu, 04 Jul 2024 10:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753694.1161884; Thu, 04 Jul 2024 10:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPK3U-00081R-D4; Thu, 04 Jul 2024 10:51:12 +0000
Received: by outflank-mailman (input) for mailman id 753694;
 Thu, 04 Jul 2024 10:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQU9=OE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPK3S-00081L-Uq
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 10:51:10 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51975052-39f3-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 12:51:08 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a77c25beae1so21396766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 03:51:08 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77b8eb56c1sm39521066b.176.2024.07.04.03.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 03:51:06 -0700 (PDT)
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
X-Inumbo-ID: 51975052-39f3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720090268; x=1720695068; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8YO8d+O47nLClzJkj9111ZbQq3ZINAf4CxKyeXR+WqI=;
        b=ukGIAR+1QCcyulW+K4upYI+t1/yVmBqyRXhYzHclz2PJPGqmQtB3wmFQu8hetzr9oK
         Ksks3Ik8Xnb8yFZ0Tem244h3sFehQSuiiHlcZGDHzCuNvppDiPglmrwUKNcVgb4nOJKW
         3IjW0wJzw2FQfk/ywZn1FCr+x6eZpkLr8Qizg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720090268; x=1720695068;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YO8d+O47nLClzJkj9111ZbQq3ZINAf4CxKyeXR+WqI=;
        b=GCsg6xRQZxOXfUUoBYflw7EvKZHgba36i7t2lsjLrdBw/YnaTu+OMJOsulYLCuIC/0
         MFcpCEExZ7fS/+ahnvzhgsnZ9sZa5aqginY6tiasjsDuYdwCSvmGWgkR1JiZAl0wbeh8
         AXCI4PvdvxGVG2+AZ2wsj5rDoj6U5Wjt3k5e3/z+TXAnOEtZLESj2C/gDgh7JyxCcPJg
         lxi75LGzXuDQz18qiRHJmy8y/WxmDTGkwOu1BsrUYSWM+RIzdNaqtQyc1gJpH0o78Ffm
         UZnYBH9ic5T7CpSpEAcoAuegtub4UdGVk06Rm1SXboQ0+7uZ+Pw06cikpm/CHXQQ6xCL
         6zRg==
X-Forwarded-Encrypted: i=1; AJvYcCUbLmXH3onxt1+1yQf93SyMWgd6sRmjYyc4bVjg4dQUCQuMomxAIgEVUkVMzONtgyCpTE2bb2fm3MgpZ//qHj/O8izfRs3k06cxGLXNtbM=
X-Gm-Message-State: AOJu0Ywmm3vOBMR9JGkf+Y6CoNZMWtpB5v4dey9v5lkVFKAzvkLwXOdw
	3lez4gk9PXJ7D4lzufVN3y5QgCOyOCTbvqKKLjGW6/hc8x8d3+g8lauh0cAnJ5w=
X-Google-Smtp-Source: AGHT+IFrblraUrX3HxE46USSR5jrzbDsa51YL5vqSXLdEnnpEP5rTqMP4qwenK1MVNIE2mw3CZnTMw==
X-Received: by 2002:a17:907:7e89:b0:a72:5d75:6337 with SMTP id a640c23a62f3a-a77ba706ad2mr97963266b.53.1720090267619;
        Thu, 04 Jul 2024 03:51:07 -0700 (PDT)
Message-ID: <627365c7-83b8-4b33-aefc-a8c0e4301c7a@citrix.com>
Date: Thu, 4 Jul 2024 11:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 0/4] CI: Fixes, part 1
To: Oleksii <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
 <2a6a3697a9896107a8f317686fb2e2572d0ba332.camel@gmail.com>
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
In-Reply-To: <2a6a3697a9896107a8f317686fb2e2572d0ba332.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/07/2024 11:37 am, Oleksii wrote:
> On Wed, 2024-07-03 at 15:19 +0100, Andrew Cooper wrote:
>> Minimum fixes to rebuild the containers, following the HEREDOC
>> problems.
>>
>> Unrelated to the HEREDOC problems, Archlinux and CentOS 7 need
>> aditional
>> chagnes to rebuild.
>>
>> There will be subsequent work to make some improvements to CI for
>> 4.19, so in
>> particular we're testing with up-to-date LTS distros.
> If we really want to test with up-to-date LTS distros in 4.19 then it
> probably make sense to postpone release date to July 29 to be sure that
> everything is okay. July 29 is still fit in our 2 times release cycle
> per year.

Testing with up-to-date distros is trivial, when I can rebuild the
containers.

I've already got "CI: Fixes, part 2" and "part 3" in progress, hoping to
post today, all for 4.19.

What matters, specifically for 4.19 at this point, is that we put in
place testing such that {staging,stable}-4.19 branches are tested
suitably after release.

It would be really embarrassing for the Xen 4.19 release if it didn't
work with e.g. Ubuntu Noble.

~Andrew

