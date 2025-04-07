Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0EA7E928
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 19:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940761.1340418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1qhc-00014R-4A; Mon, 07 Apr 2025 17:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940761.1340418; Mon, 07 Apr 2025 17:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1qhc-00011M-10; Mon, 07 Apr 2025 17:56:08 +0000
Received: by outflank-mailman (input) for mailman id 940761;
 Mon, 07 Apr 2025 17:56:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1qhb-00011G-7K
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 17:56:07 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93475f01-13d9-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 19:56:05 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so2551991f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 10:56:05 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1660bcesm139223385e9.10.2025.04.07.10.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 10:56:03 -0700 (PDT)
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
X-Inumbo-ID: 93475f01-13d9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744048564; x=1744653364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sccB/u/DRvlsrKjAXwvtw6qRfXGtz85CHFzhqnsOEAA=;
        b=TUxdF88rFZLEJ8AYvRASAxkTddqGJA7U4TNe28OtbcjQpaYY3FC1J7lkiAm++S5uQE
         ZWT0sF3QYM2fhVlz7D+zVSR41Q7cqW2jHdwo7JePJ62s9X/v8REPk0urtczotT2mtNvc
         E9hiOHA3NolDh/f9dd+51lvZTeuDr2UNa+8YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744048564; x=1744653364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sccB/u/DRvlsrKjAXwvtw6qRfXGtz85CHFzhqnsOEAA=;
        b=mDvZb0D2WMG6Zs42EwFpAx/BRePY9gTw3OZTHwIEmXSxi2U6Dp1zHWTtkGJVAfGhAB
         G8VA1TMMsJvwmPoNKRKvLxBy5KfIrA26hEZ9TEOj25BXma1niBFA2RoSOFTXltbn4nM1
         HXxqZkUPRN4JPCVAONvPWGP9Jz7R+facdqnK9cQIhvTbwzHWFW4nH/IoEKOLeYqNVtAi
         80XYfgo62EPE/VWY7G9GSb2CdxS0A+u4WcmTOgQXr5VJGbqa0kbC94/vckIbHrxdm0KE
         iB7QBVDcwIND3U1g/+5L6c9S8cmrf6NV53JRhJJK/dWTsltrIho/B/2vNo0QqYuTC72n
         G+kg==
X-Forwarded-Encrypted: i=1; AJvYcCXAgASPJLMP5LmbEDPmM94SSS85VWlXxgHBX+rTAdDIDPevsKlSbgtYYyQlfHnu1G4cDYJ9PXlddfo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywa6rKIneOTrJVClRkzXBua9uwDIYhl14eAacgw89BiVgxJo7ML
	dZfjK12IPBKBn3M5e7kc2AanYMTDKK0e78d/hHXd06HjmeIpkA+15k2y02ri8A4=
X-Gm-Gg: ASbGncvmgJNbedHcPD50by3Z7wuTm7joi36Q97KyMYwxDR6G5aM2loAErz5eKPH+1fi
	yzQ/f2UhVRkmNzWv+L2RbiYBPN0FdolTmp/Y44iDJYbeQX5Y3B34vkkmD9uQXWYEBardUKEjcJC
	70gd8v4lWDePxl5IKndc4NOeHtYkskuxttev4avHQu7aqjdO1OMQhdVCM0pCnRpoGqkFFkvU3gY
	goGkwajKY/vaLwCdqQLl/AgnbSTs/w15zFjZeC69irk8Jra4Dx9CjMOp+/6sY/J60dsIR1QDMjy
	+r+40nyj1TPye2btCRl6k0Pf51BMhYbASlsV19nqnQfumny4/BdxM/8/XUji4oUWwJ9RHYcY6E0
	4q6IJydUpiw==
X-Google-Smtp-Source: AGHT+IHF4aeeG/3FO4TS03v3o41m4GXhZP3Hmm4fw0jPsAWSldpRYhI2cRtTU1hNmMHXaPJdyQEa7w==
X-Received: by 2002:a05:6000:4284:b0:39c:1f11:ead with SMTP id ffacd0b85a97d-39cb35a8860mr12648944f8f.26.1744048564422;
        Mon, 07 Apr 2025 10:56:04 -0700 (PDT)
Message-ID: <a10a7c12-90de-4f1b-9ee0-d5b85055a368@citrix.com>
Date: Mon, 7 Apr 2025 18:56:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] CI: switch test kernel from 6.1.19 to 6.12.21
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
 <eda734d64c0b73e5de6ca0d70fe3de02d40cf00d.1744028549.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <eda734d64c0b73e5de6ca0d70fe3de02d40cf00d.1744028549.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 1:31 pm, Marek Marczykowski-Górecki wrote:
> The jump is pretty big, but should be enough for a longer time. The
> change right now is motivated adding new runner with AMD Zen4.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  automation/gitlab-ci/build.yaml                      |  4 +-
>  automation/gitlab-ci/test.yaml                       |  2 +-
>  automation/tests-artifacts/kernel/6.1.19.dockerfile  | 41 +-------------
>  automation/tests-artifacts/kernel/6.12.21.dockerfile | 41 +++++++++++++-
>  4 files changed, 44 insertions(+), 44 deletions(-)
>  delete mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile
>  create mode 100644 automation/tests-artifacts/kernel/6.12.21.dockerfile

I'd really prefer not to continue extending the *-export mess, but that
in turn needs fixes in the test-artefacts repo first.  It should
simplify later parts of this series.

~Andrew

