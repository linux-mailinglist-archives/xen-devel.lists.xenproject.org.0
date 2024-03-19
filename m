Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECCF88061C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 21:37:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695603.1085463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgBl-0003az-58; Tue, 19 Mar 2024 20:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695603.1085463; Tue, 19 Mar 2024 20:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgBl-0003ZF-1q; Tue, 19 Mar 2024 20:36:01 +0000
Received: by outflank-mailman (input) for mailman id 695603;
 Tue, 19 Mar 2024 20:36:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQvM=KZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmgBj-0003Z9-V6
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 20:35:59 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a5fc92f-e630-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 21:35:57 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so68116241fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 13:35:57 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0041409fa57c4sm10813404wmq.34.2024.03.19.13.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 13:35:56 -0700 (PDT)
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
X-Inumbo-ID: 4a5fc92f-e630-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710880557; x=1711485357; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7McJ6S66+ecWQRpPnVmoi5TAzuw97Xo7wL7THoklmQ=;
        b=pdTnQqbTsvHVF4GBp6brMmg9zFCLBxdyqDjWAWMRJcvxF9o3EUTt9J1FwIIjqf8UoF
         f8cgYm2J8I83xBGWPM7SvfxPLLkxjznxaDJ7RTcNQ/u2i0B5BTRLD5C0qG3HOl+NXu2D
         p9YoUD8m9tTarK4MGZyD8djWcqu3lJbUQbA4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710880557; x=1711485357;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7McJ6S66+ecWQRpPnVmoi5TAzuw97Xo7wL7THoklmQ=;
        b=NdB8ignnLyvLAXKWxbFLH1HQUWe1mIJcEZ/yJuvuN+7k9f6zXNegXz2baeSkAPW9fT
         USNV5gt52xwtYFWxnoAzuvPvQQWdohk4UoXdjBsomjN+6lWWbOepzfdBZbdudz0m1dPR
         SmYln+ugEPDtCy+uo4YuVqhhXhPRu3MOEgFEG1J5ZeeejqhU9ejKVDcHITWjdMcWiarI
         0dC5tQNrkKCp099XxSxoIxMKgWJHay+0NWSoyRqb9VZH0UJb5bglGcXKRG8XtWQ50l8E
         BINUA3oxvzqZHm58hO2aBiv4/LCp5wCWmuXtnv2kCezcU0vFeNlK8ME284KNAp+oVDVz
         Vmrg==
X-Forwarded-Encrypted: i=1; AJvYcCXri5DesEP6yWy/dPckUrfRUmr3eOr58Ir7cCIDuDgZ7WpsmFoGfOO2/0u+c7LwQrovJCsOL5MQccKHkHEfEvcxd7b/+RQSuJ0orJ7tlRs=
X-Gm-Message-State: AOJu0YyapgYg5/3KfodOvSGsOyfog82FV/6ZDSi14J8nPs62BpWPkbxn
	l6ilfggz4RTBM2OWrrV7qAfwF/dxquVQlDnzTtVpUVsrA/yjNHrmAobIeBbbcgU=
X-Google-Smtp-Source: AGHT+IGWusMg3EYh+yHBDa5ijJ5T0vjRiptIo66FZX2EiBxTXHLbtLOMtEYejZd4ytjp/m+wIVIoZg==
X-Received: by 2002:a2e:9019:0:b0:2d4:6e71:59ef with SMTP id h25-20020a2e9019000000b002d46e7159efmr10204905ljg.5.1710880557030;
        Tue, 19 Mar 2024 13:35:57 -0700 (PDT)
Message-ID: <1c3d790d-bdac-495a-868b-36e12d45c457@citrix.com>
Date: Tue, 19 Mar 2024 20:35:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: adjust initial setting of watchdog kind
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <fe289ca1-aa3a-49af-b7d7-70949237464b@suse.com>
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
In-Reply-To: <fe289ca1-aa3a-49af-b7d7-70949237464b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/01/2024 2:12 pm, Jan Beulich wrote:
> "watchdog_timeout=0" is documented to disable the watchdog. Make sure
> this also is true when there's a subsequent "watchdog" command line
> option (and no further "watchdog_timeout=" one).

We also document that latest takes precedence, at which point "watchdog"
would re-activate.

>
> While there also switch watchdog_setup() to returning void, bringing it
> in line with the !CONFIG_WATCHDOG case. Further amend command line
> documentation to also mention the implicit effect of specifying a non-
> zero timeout.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Alternatively "watchdog" following "watchdog_timeout=0" could be taken
> to mean to use the default timeout again.

I realise that watchdog_timeout is my fault, but in fairness it was an
early change of mine in Xen and didn't exactly get the kind of review it
would get these days.  It also wasn't used by XenServer in the end - we
just stayed at a default 5s.

I'm very tempted to suggest deleting watchdog_timeout, and extending
watchdog= to have `force | <bool> | <int>s` so you could specify e.g.
`watchdog=10s`.

The watchdog is off by default so I don't expect this will impact
people.  It is also more convenient for the end user, and means that we
don't have have the current split approach of two separate options
fighting for control over each other.

It also means we we can in principle support non-integer-second units of
time in a theoretical future when the NMI handler can count time properly.

> Really I think the comment in watchdog_setup() is wrong, and the
> function would hence better go away.

That comment dates from 2006.  I highly suspect it's not true any more,
and it certainly is odd to be running over all CPUs like that.

~Andrew

