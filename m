Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D1FA80D23
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 16:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942216.1341472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29VB-0000Ui-J5; Tue, 08 Apr 2025 14:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942216.1341472; Tue, 08 Apr 2025 14:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29VB-0000Sh-Ds; Tue, 08 Apr 2025 14:00:33 +0000
Received: by outflank-mailman (input) for mailman id 942216;
 Tue, 08 Apr 2025 14:00:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Iqs=W2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u29VA-0000Cz-KU
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 14:00:32 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5d23d72-1481-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 16:00:32 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso36414375e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 07:00:32 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm165572205e9.26.2025.04.08.07.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 07:00:29 -0700 (PDT)
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
X-Inumbo-ID: d5d23d72-1481-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744120831; x=1744725631; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YAOIzRWwLxvqNlDKa5BpgqiF6ziLZrF9ZJOL7ZbPezo=;
        b=nhMkPxGAFsiRbcNefnGGVaL+0FNDhy83dWgPUlnG8tULP0oft6a4aV9IP00+WM2bN9
         ucenXUOJFT3YeVurLw1/777zPKAmsHs3EFR4XaydxARrX8j7ElYvgQ4t07g0oWEmnpvw
         kgsjx+NWotN65KDDH0y94vN1ViYo7FKA8Q02U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120831; x=1744725631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAOIzRWwLxvqNlDKa5BpgqiF6ziLZrF9ZJOL7ZbPezo=;
        b=Z4moksrsTPuivXjwzNKP0gpQuAEDB2iYlB2DPaKOck+MJmDkwBydB/PoNtLWwY15Gz
         2Wf4o6SDiMXC2JKvjOuIE6K59IiVSxJ7RwAFVbDN9SJhn3OCDykG9+ouXNT25mysVmw3
         XWymyUu066QiSe4K9fPjJyFWDWisEUKDQ2M/bXKtY9B+ROPJN8jYw8SfGn873J+aX0+U
         Df0kOfjDxPvViv3aAHkqmP7f8bAcN0YuEL/wAH2yqpgbbnKKeAEqXKsFmGin/F2j80ME
         AIGjtpzuTd0WuhKzXa+QVQs0Mb1h7pMa51UsEYtmPsoOqtYYo6mTBwQZEWNxkYuUR59u
         j3pA==
X-Forwarded-Encrypted: i=1; AJvYcCVvHGCBvt8hi83hWHW7H0h8C7r772FAjDO0j5Oxj/dGx3RMVS8DFuroydmq3XCiuel2pFlxYStZo+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxT8HYGP2eLCPjCm3bMcdROQVYh016z/l/THPhGDkeedNH9puun
	ify85hINYDaGdEBVlCIB+H3EHVg6pWHAr6bnO2n6aOGNaMHZLYU3G6q3Ydn+XOQ=
X-Gm-Gg: ASbGnctv3jrFWs+KBV40lvnFmPEHoZthTOrrZl09HdGk/7BkJAN67WeNzsJ+fykRHFf
	3vnbe+QId4H3LPqS2Ww7GDF15IxyET6t2e7yV4f5/y5CRjKjr11WCKxULPK4hHPeR/z39wODpOS
	nT2gLsXf62Q2LCkOO6hZXTNOm/SW/LFAD5WosMWXeFxlFzom2uoRzXOZpGDV/LHZXwhfui7kyBw
	b41Wi2MGO9fddVg1M3PCNBzPJ8FVWuW9SPLsikkZJtArzs83QBhikRe+HDsMEAsz8D8ox8YXCee
	vZI9ceFRdm05AztIcydDtZl5F1waLgVo2N+GDzD+WFZgOmc1J4R1feIOngoF3TQxBB1IbEkz4R/
	g7AvcXweAcA==
X-Google-Smtp-Source: AGHT+IHPg5hlqfghRtfiHNeoaQjs0a11wEh14Py8zQx95ZQx+g7ONR6y632jPXwQCKfLyg8kV41yqQ==
X-Received: by 2002:a05:600c:1d28:b0:43d:7de:16e3 with SMTP id 5b1f17b1804b1-43ed0d9d18emr137494485e9.24.1744120829908;
        Tue, 08 Apr 2025 07:00:29 -0700 (PDT)
Message-ID: <13127adf-4feb-4039-b859-27d68bef751d@citrix.com>
Date: Tue, 8 Apr 2025 15:00:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250408093156.83277-1-roger.pau@citrix.com>
 <20250408093156.83277-3-roger.pau@citrix.com>
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
In-Reply-To: <20250408093156.83277-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/04/2025 10:31 am, Roger Pau Monne wrote:
> When running on AMD hardware in HVM mode the guest linear address (GLA)
> will not be provided to hvm_emulate_one_mmio(), and instead is
> unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
> always report an error, as the fault GLA generated by the emulation of the
> access won't be ~0.
>
> Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
> when the guest is PV.
>
> Fixes: 33c19df9a5a0 ('x86/PCI: intercept accesses to RO MMIO from dom0s in HVM containers')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I think there are several bugs here.

We do get %cr2 reliably for PV and Shadow guests.

Intel EPT may or may not give us GLA.  e.g. writes for pagetable A/D
updates don't get GLA.

Defaulting to ~0 isn't ok.  We need some kind of GLA-valid signal,
except for HAP guests, it isn't even the GLA we care about, it's the GPA
which identifies the MMIO region.

We shouldn't terminate the emulation if there's no GLA to check.  In the
case that we don't have a GLA, we should translate the memory operand
and cross-check the GPA.  We'll definitely have one of the two to hand.

~Andrew

