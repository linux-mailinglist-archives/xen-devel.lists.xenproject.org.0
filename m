Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C09BB871C
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 02:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137190.1473554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4pua-0002P8-Gk; Sat, 04 Oct 2025 00:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137190.1473554; Sat, 04 Oct 2025 00:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4pua-0002NH-E7; Sat, 04 Oct 2025 00:14:08 +0000
Received: by outflank-mailman (input) for mailman id 1137190;
 Sat, 04 Oct 2025 00:14:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMDu=4N=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4puZ-0002Az-H8
 for xen-devel@lists.xenproject.org; Sat, 04 Oct 2025 00:14:07 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0aa52da6-a0b7-11f0-9d14-b5c5bf9af7f9;
 Sat, 04 Oct 2025 02:14:06 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3ee13baf2e1so1846620f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 17:14:06 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8abf0bsm9767363f8f.17.2025.10.03.17.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 17:14:05 -0700 (PDT)
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
X-Inumbo-ID: 0aa52da6-a0b7-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759536846; x=1760141646; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+szExrSazi5rx3Z4qSH5w6eplcDuAouOOMxCHFN5cnQ=;
        b=Nbv+pMPornJkbAnSgCpKaCgHxH+W+64ANIY60dQlh+I0BIufH12HSGx0/mVMrmmkkI
         xbTAmN+Hvb+V0yaQm0HU+zefNkcC8rmjnTeitv8IJtrzf7/h+Mga/UvfLItwVT3ny5Iv
         KZ8e2+jV1pbi2JLu7RgmtwKvoXc9kJNup3hXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759536846; x=1760141646;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+szExrSazi5rx3Z4qSH5w6eplcDuAouOOMxCHFN5cnQ=;
        b=nRqjkwL6VZiVia/vuAPT3DN5qLP9Xl7ssu+9cQT/pyrs6Sz3L45cq5XRMUNEr0/qWh
         dHEhA+h3R2nHMRryPdOTvHj/GNUSywxiNtSbiab/2DYjsCYUQQvjlX4BT2RYlsMBxJ57
         jFya7yFyGyIJGliGG/AHS5y8m4KWwodUS0dJuAlO0Dt0asC7MFjbCgenLx5FM/lc1f20
         nvzDyu9+TBDul9Hqcc+ixBYeEkkxnJdUn2qyX2oDFNvlkzBrJeUl4SaMWDHqLpdwm/HQ
         GpFbR4THvIWWfTkAZ97eKYL6pgNyWCPGp2wUhPb3nK8MRLcXaLXdlO97Ymo0ru5L0iHD
         NesA==
X-Forwarded-Encrypted: i=1; AJvYcCVIZnqP91Bx7Owv3+3lPY5Nc8weTDDDbt3+mAyk/dMsOdAODo6Pg5bzL89g+6HigtBGPEv7gUb+bFc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxtge4rWUvQyJicN4n10DNJxQVUsp8b7p5eHqY4v9uW4Dyi2/UK
	/5vhF2VVlhy1PNrFAJynkxfuJeovOXkyVI4pGR1za1popg27XqugIY9L8R+fHh8rj6I=
X-Gm-Gg: ASbGncuM994h5v3/95/C+QABJztnTiqrFHI2iDvMyAvcqvwSVya0ml8Veaw+fnHw+GG
	PDWa4nNhXuG9CwnjytJV023y1btHgWQjkKJYGnCns1BVJXJ7mYQS3u04aDGJ9vOFZYN3+l+xYyw
	lAKwn1KHRPLHdeuOagLrv9hkEax8UoKmvPaxkMh/Wdq0m2MPUZU/yUisyaxl+ks8B6j6dnRIupz
	tkRaBDA9NWT3VYiv8dJJzKxJwSrmm3Vzys1pK+389G1q47u9Nu9h03MGGquHVaUgnXg9hKbIG13
	AaciYkegk+1aZrdgio04d9WO8deau7IZmi5Gg+zw/MbNXDR/oDy521Oh4RK/u7NeMOzsj//0f6l
	OB96s2OOqkgKyexvR3/f9OOfirU6piTGqcr29x4P+/aW6tI3f42yPi27lBeq1cfA346FW3p+wI/
	nsQ5y80nNom1hVfKtEV9djA1L2RIIkSNOVNA==
X-Google-Smtp-Source: AGHT+IE9xM+DjmIPHAHhwjDxoOTE12Qcr/H7INdQdE1eX1rc6ADmtIlZHiolNRZhrYsTdmmzcaYSrg==
X-Received: by 2002:a05:6000:2dc5:b0:3e7:6418:247b with SMTP id ffacd0b85a97d-4256713a13fmr3093697f8f.10.1759536846194;
        Fri, 03 Oct 2025 17:14:06 -0700 (PDT)
Message-ID: <deedfb23-496f-41aa-818f-f8d648b50648@citrix.com>
Date: Sat, 4 Oct 2025 01:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/22] x86/msr: Change wrmsr() to take a single
 parameter
To: Demi Marie Obenour <demiobenour@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-3-andrew.cooper3@citrix.com>
 <753f726e-baa8-44ab-92ed-df3cf8e89db1@gmail.com>
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
In-Reply-To: <753f726e-baa8-44ab-92ed-df3cf8e89db1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/10/2025 1:11 am, Demi Marie Obenour wrote:
> On 10/3/25 18:53, Andrew Cooper wrote:
>> Mirroring the cleanup to rdmsr(), do the same to wrmsr().  It now has the same
>> API as wrmsrl(), but we'll want to drop that wrapper in due course.
>>
>> It's telling that almost all remaining users pass in 0.  Most are converted
>> directly to WRMSRNS, but a few are not.
>>
>> MSR_VIRT_SPEC_CTRL is unconditionally intercepted is orders of magnitude more
> "is unconditionally intercepted is" is this a typo?

There should be an 'and' in there.  Fixed locally.

~Andrew

>> expensive than just serialising.  In disable_lapic_nmi_watchdog(), the P4 case
>> won't run on hardware which has anything more than plain WRMSR.
>>


