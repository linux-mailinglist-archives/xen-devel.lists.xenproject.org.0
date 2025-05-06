Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D248AACC1F
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 19:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977902.1364816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLzI-00079G-Fy; Tue, 06 May 2025 17:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977902.1364816; Tue, 06 May 2025 17:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLzI-00076e-Cr; Tue, 06 May 2025 17:21:48 +0000
Received: by outflank-mailman (input) for mailman id 977902;
 Tue, 06 May 2025 17:21:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cniF=XW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uCLuv-0003pq-IX
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 17:17:17 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5d6c0fa-2a9d-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 19:17:17 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac25520a289so1006010666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 10:17:17 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae0d3csm14060072f8f.3.2025.05.06.10.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 10:17:05 -0700 (PDT)
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
X-Inumbo-ID: f5d6c0fa-2a9d-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746551837; x=1747156637; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/K2DAiP61AzFJhh5IKtXeQcwcXvB3Mgch3kqY1N5EYA=;
        b=b0IW4MP8vCmEQb8qb2WM344gJh6Ihu2Hfvn8XXEAoK8Ujce8KyCdaNdVjlCKWLKifZ
         uTOeCXuI1oppVUP0LopAv3PvjmPFjgH1Q48rl4JvJdMYANXNbr+RQbh16GX2Umwa2Pac
         vxRmrOn4Y6L2xq5wF5szwE1D6WhINvgYTitDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551837; x=1747156637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/K2DAiP61AzFJhh5IKtXeQcwcXvB3Mgch3kqY1N5EYA=;
        b=YBcAlSgq72fWyEUPO3U61v2DEZhpnse8Fm194K5q39p4r/TKhDPnEJO+rHx4Ntn++7
         RdhQjeQQuNPwDMwciLul68QNt7ezgCOwRtuiT2q74GvC/N2mjCr0+fxY9TyMwcMV4BdK
         20HBZ1X8w7aa7Q5aK0EyNa9T1FmCSi9SmO76I5KgmkTN5dqUkaB7qxdWX4G9WqgyH1S6
         4tKYYsh1ixAMNyNSpJ+9+g5tMh8dXciVxG9HfS2nr7E8ysxpxvaRWHLjl1dWm0R1OMgv
         dIi1gl7eFLbBNX93P76NyL9sKce38m9fhZGdB57tYukmFhEocId0VltinvbnYcVh6CGl
         8eSA==
X-Forwarded-Encrypted: i=1; AJvYcCU+7U/D/QHq8YuefFpfJtwxZc6uugFz3BIrMsw6FtYKdNeZf8JRQ1h/xmODt5uXQ8SUf/aLzM37WSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf+H+E93w+wBV44ImomAcX8RLK7S7cLNgSC21l2b9lIQWtnABu
	U/FBhSQ2jfRiTq/C+Li1pHpxFjVLoB2ogkkJm/PUhKogUzZloE/CPPFr+WB1+ovDHOy+cHEtXlp
	3
X-Gm-Gg: ASbGncu8GLKjL5wX/pumImh+OEXml0LhTLy6gVRtbIPhHVGiiPsQpKw+gz9PCgrDf8v
	Q97HmJWANNacreiEsa0TsZKR9jlXlX4rVHVyavrvQwZfzbtUUidWmx8iNSxUJ8rijsiRlaHQrrr
	6qSRmH4y98bwVMecTZUdKnnMEjV/ZpFZ/Io469AWgOMzbIll6npjXRt6M6x/NKZwaLu3/YVCLqJ
	I9Guw4AvbsEOBuhegPDx0cTlPKahfjXnsLaEkw76hvS1DLtGMDjE3KDCFkqrKBf/ROiVFbhY5Dc
	J5lJF3mGc0S9Y7oe3lHWPfHewLQM4NatJi4rNHkAbG8mmCC30QVBJZ/mnvHQ4dcBz/tKtEBGfnY
	nBNenNg==
X-Google-Smtp-Source: AGHT+IE7WvgW137d9MbIxSGvM3QzFwdjuJR34rRXmb+ey1pdkoGyEw8Azw3cGXJuFkjGHKBcOXB2sQ==
X-Received: by 2002:a05:600d:1a:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-441c4a6741amr95750765e9.19.1746551825773;
        Tue, 06 May 2025 10:17:05 -0700 (PDT)
Message-ID: <16cc1b4b-a817-436e-b1fc-09c3a535db08@citrix.com>
Date: Tue, 6 May 2025 18:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] LivePatch signing support
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
 <aBpDxXKVHdt8IQX5@mail-itl>
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
In-Reply-To: <aBpDxXKVHdt8IQX5@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/05/2025 6:15 pm, Marek Marczykowski-Górecki wrote:
> On Tue, May 06, 2025 at 03:32:12PM +0100, Ross Lagerwall wrote:
>> Live patch signing support was mentioned as future work in the design
>> document several years ago. This series finally implements support for
>> it since it is a requirement of Secure Boot to prevent loading unsigned
>> code into Xen.
>>
>> Note that this series depends on another patch that has not yet been
>> merged:
>> xen/lib: Export additional sha256 functions
>> https://lists.xenproject.org/archives/html/xen-devel/2025-05/msg00222.html
>>
>> Jennifer Herbert (1):
>>   livepatch: Verify livepatch signatures
>>
>> Kevin Lampis (1):
>>   livepatch: Embed public key in Xen
>>
>> Ross Lagerwall (2):
>>   docs: Introduce live patch signing
>>   crypto: Add RSA support
> Patches 1 and 4 seems to be lost...

Yes, we're working on that.  (Corporate email fun)

~Andrew

