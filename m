Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BD2A83F02
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945126.1343386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oMK-0003Yj-JE; Thu, 10 Apr 2025 09:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945126.1343386; Thu, 10 Apr 2025 09:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oMK-0003Va-Ep; Thu, 10 Apr 2025 09:38:08 +0000
Received: by outflank-mailman (input) for mailman id 945126;
 Thu, 10 Apr 2025 09:38:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2oMI-0003VU-RF
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:38:06 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80fc8fad-15ef-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 11:38:05 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so6743335e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 02:38:05 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d89389f72sm4137248f8f.42.2025.04.10.02.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 02:38:04 -0700 (PDT)
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
X-Inumbo-ID: 80fc8fad-15ef-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744277885; x=1744882685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ehf6MDnNuOD0ctLpObTA1Oi+jvFLRouboCnaqmlEZuw=;
        b=ApZjQjoO23Frp9HknV7MNKaEMsCt9VP0rKN5Whh2Vga7wBnywnnHvca+OETZnFLFdG
         xt3nDTcfX31Nlcqs9yHUh5QjTa0uE1WA86u8vw8BFTiooCZekpvckYci5I4bF9LUxpvX
         ZxYpEyVfQFrR/ITeAcbf1MrlCk8+/kQ0+ynkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277885; x=1744882685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ehf6MDnNuOD0ctLpObTA1Oi+jvFLRouboCnaqmlEZuw=;
        b=mmyR9aYdIMC9V9Ujcad8DemysDQ/ecUUmE7RX9eVcd6INR3xqyJqmxS78lBgqUYuix
         3LUXazneLXymstn6CTjG5vAPKR51XkHvt0WvyuX5qp3/U4bwsLj716UKxMPXaHazjIc3
         7tJxF/3n7Lz0hgJx3hOmQkYPskImb1+1Cs5Fy1k99c0GHr4VRI9OE8RP5Z43fiFFqhMx
         jLnE8qn+H04/tBTfVzjTifELrhYqxt0HNEoB2ACYI12xeJgJBxA4wNPIUTyl89PhulEF
         +IM06P35eRUCs2zA/NPKJX/tssW5O0JsR1mie4bUJ1dn1LWWn1fw47O3yFzc6TDx+YD1
         PxiQ==
X-Gm-Message-State: AOJu0YyGHa+HuDr1aro0IDwkAtsWQD1s4qE56rLtJkTpFZ8ir/TwN696
	JBrJd2eAL8jilKJxGeKfgyzE7I7MU0satuYoOSwoHqgmLiU/1DmxXfWhB1nQtaM=
X-Gm-Gg: ASbGncueikMDX2fNEITMvmalip6FlWy+mw2nRyuNMAPp93gGm01aOrHT7gg+skib+16
	/p6Ti3hdtbm3Ol7Jq0yo7vDhhJKsSVurAy8yR53D0bgqCVQIh9e6lObskZ64VilMRTT0hAOoOy7
	b9/dPOQOFTLje4S1KIjhfHDbE/U3LkpoRYKgz93q/2KlYzFGdd3kpQyFAkZ4UlSDpeEu2jzs/Qq
	BODa3Pn8xx+ReYYGjQuxz38WMA77Sz9wvDGXJ4nxNVdv0OKtea0ry5SWPrlAkeudClQ1b7MM9rg
	Q+94fNBiQzfSSm6iToy2u4kQpcvcD2w7bmajHoAUHk7AqlF5xc/A+yFRiD4131mxxUTRTi6mzzC
	ymQX9yQ==
X-Google-Smtp-Source: AGHT+IEXbs8xYmJ8tQGevFdbb4W/6yjlxQVQ0VtS11ykeXmVH2iLMq7lcy0iU/7rhFX5MOYH9jZdMw==
X-Received: by 2002:adf:9dc1:0:b0:39a:d20b:5c14 with SMTP id ffacd0b85a97d-39d8fd8a268mr1210053f8f.36.1744277884938;
        Thu, 10 Apr 2025 02:38:04 -0700 (PDT)
Message-ID: <fa1875a7-3267-447f-b96e-ce92e31887e8@citrix.com>
Date: Thu, 10 Apr 2025 10:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] Clean up Gitlab yaml
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-5-andrew.cooper3@citrix.com>
 <Z_arM5JqPuyt7dFm@mail-itl>
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
In-Reply-To: <Z_arM5JqPuyt7dFm@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/04/2025 6:15 pm, Marek Marczykowski-Górecki wrote:
> On Wed, Apr 09, 2025 at 05:36:58PM +0100, Andrew Cooper wrote:
>> Factor out the registry into a common location.  Fix the worflow name.  List
>> all the stages.  Set a default expiry of 1 month.
> This is okay, since last artifacts for a branch are preserved even if
> expired.
>
>> Note all the current jobs as legacy.  Their naming scheme needs changing, and
>> we'll use this opportunity to switch formats too.  However, the artefacts need
>> to stay using the old name until the final staging-* branch using them is
>> phased out.
> This could use a comment what should the new naming be.

Same as we use in Xen.  linux-$VER-$ARCH, as shown later in the series,
and alpine-$VER-$ARCH-rootfs (currently there's no $VER, and this is
going to break horribly when moving off 3.18).

~Andrew

