Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750B1ACC778
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004431.1384150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRUj-0002Xf-2B; Tue, 03 Jun 2025 13:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004431.1384150; Tue, 03 Jun 2025 13:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRUi-0002Vc-Us; Tue, 03 Jun 2025 13:15:56 +0000
Received: by outflank-mailman (input) for mailman id 1004431;
 Tue, 03 Jun 2025 13:15:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMRUg-0002VW-RP
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:15:54 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0b3fb4d-407c-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 15:15:54 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-32a9e5b625eso30634031fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 06:15:54 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00a0146sm18454351f8f.93.2025.06.03.06.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 06:09:27 -0700 (PDT)
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
X-Inumbo-ID: e0b3fb4d-407c-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748956553; x=1749561353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=10to7aF3fhkNOnipBiy0p/JG11LLChGUHF/lp/2h1v4=;
        b=PRMukr70FdE73w+h+76qPxCAFu19m4QKoMiOf1FMspvaF+lUPcutC+2A/G6bz7+sfh
         imjlCQ/Ajl8BMRDzd2isTbg8UxFvJE3Bq3elKbtbqYEYm8nIYg/Z/DayDkNabAI02n5U
         Cu8Nwg1wH37Tz9dmrLIsUeaGM/SNii6s/MNDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956553; x=1749561353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10to7aF3fhkNOnipBiy0p/JG11LLChGUHF/lp/2h1v4=;
        b=EnxbarHPbGOUGl0kd6Ld9jqG4xYTMotdvC9got0CwYbSZU6EWBKSqC8iGUxiseaWF0
         hm+lnnPwHrP3IzJUCDbHbxJg5EVkvuWpJCtLPXSmaEsSk0o02G4dtMyLdIYePqqK73PK
         0zjgPvjfK1ADdlwcxhOCEe+QmtFdC5ZU22NtQD+Aog9R4Z7EoeedetOO3S1FxggedSjB
         uArKWfxuvwNClw5SzttDdqlwCx6cqkbL6b26/U0WJDxsh+BFEByhJwPud8RdiAwH/1lQ
         VCnr1VWhfmgsC0PH6Mv85GyVyzWg3jSX/hGdk7KiOFn5wQTP+S3HGvoZ5J+++KThPCcN
         A39Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6K61+uYQPl40YyC0cLFRRk/kNSrIUUz1zmFDHlnEaNk/2IcgztDFRgTrVc3QgJu2Jkej8O07dUA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvTOVrC2McMpuIF0U8W9hoawOEgq718SjDADxA1yih1kq4wze9
	LrASTTCJ7iAHKHfnG9/y2q1CDq0plfz5mCao2KZKFwmV+fRQb4xOMy6MxU7WPhLQOH7LaelyMpv
	ud9z0
X-Gm-Gg: ASbGncuaLR+s9Epnd3wtBqsJVNPgGU5QaaxKjqhSpMr/Bbgmvs8MQX8Zsv2jmUbm8Of
	fzvzs5A5/nJdY7ZkeHcBpGUtcFjMN+ybWTCud2xCpC+/jUqGKGPqCwV7PwxzeD0ukqdikDGxAt6
	+6ICAjRyoel/4a9eBBD/Al8d/XLlrd5cBpyySk+Zh27ZhYF+gKdM/yujrIdGw2ohM9VilUWyFZU
	7XC2tfEkAyI1oJhdSjjUgj9/5Ekltq8mTeHh2Tgk1ufDL33sPKHkH90ScVPiS6lX5RU6h2Vr8gC
	FVIyNelP6P7tYfxEk5z7rwJWGIdypCVRaUth9Ss7C0t1v+aDFuxcM/tCKxAPjL7loZC9fuMAra+
	rfsefKvdRzrck69mPiIeWpTvarfM=
X-Google-Smtp-Source: AGHT+IGp/I7mOZHk1Ju2O1hjlffErtRVx2XBJlZBooV2MMraIIkdgRZcfqt5NOcfKa4XCepS8eTMCg==
X-Received: by 2002:a05:6000:2409:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3a4f89dab8amr12643773f8f.46.1748956168062;
        Tue, 03 Jun 2025 06:09:28 -0700 (PDT)
Message-ID: <66c1a541-c6b2-4bf5-b1a7-9fb9ae19b4a0@citrix.com>
Date: Tue, 3 Jun 2025 14:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/9] CI: Add SELECTED_JOBS_ONLY to analyze.yaml
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-2-anthony@xenproject.org>
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
In-Reply-To: <20250603124222.52057-2-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

