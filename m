Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE6A35214
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 00:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888199.1297595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiiTz-0001iA-SB; Thu, 13 Feb 2025 23:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888199.1297595; Thu, 13 Feb 2025 23:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiiTz-0001fQ-O2; Thu, 13 Feb 2025 23:18:59 +0000
Received: by outflank-mailman (input) for mailman id 888199;
 Thu, 13 Feb 2025 23:18:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiiTx-0001fK-Pv
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 23:18:57 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5b5361f-ea60-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 00:18:56 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso10424385e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 15:18:56 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258f8c4bsm3050659f8f.46.2025.02.13.15.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 15:18:55 -0800 (PST)
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
X-Inumbo-ID: e5b5361f-ea60-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739488736; x=1740093536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ykZz4t76gjX2dYmO/as1eQxAKR5cdSW5m7e0trS0Jwk=;
        b=QcxT0Cp5IWt6YXWz2Mkgpz9YZHjhECKfZ4GC+1PtD3lZXsse84aYgs+2/oSefqoEhU
         nF7W728CdvohY8dSceEMWzU6tvanWeJE2Dsxan0cP/WKGl/0pBERBEUS1XUFyIGABu7C
         +CjneSqUTkqLguafmK//rMZEgxvgeS2SABkTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739488736; x=1740093536;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykZz4t76gjX2dYmO/as1eQxAKR5cdSW5m7e0trS0Jwk=;
        b=rnOur0VjcW35W4g/XTznVgmQBIVJAs3HiHKRPE0e0n3qjajczVl2SAqs5F/DT1eTk/
         1OTQhZTZpQPOVGtfAWtxsMPtAQVdkp5SHRqwnCLHyMLftWsenFSlHemrodqemoam8Pj1
         X71hwvxTqeDhoowFSSwh7uCOF25aXhuCpnS4nRUngEW6s1BObxPWHNRpB/vHC/er6BFF
         QVjsiNdyIHSv5dW0Wx9x5hn0nhc0Cop4NiUQV4fJiDsW/Dc6lK0+yVmZMZ4wc+yq5EX0
         Gwt9/fX2oAF20dh/+CZ+hzdoNxR3wKOqyVvXxrf6fOeFZRCAyV7wY50M3C6Ss47wd4OL
         bx3g==
X-Forwarded-Encrypted: i=1; AJvYcCXd2Xqha1qMA56K1rALtD5/giu+shEacR7ePTF/LExmcEZkgwjnnk0hCXmHsvu0e/236Z27oqkPWUk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwavPH5+CVHZ8mk1emsEYvU0f/b1BS2KVppXTR9jXMruPQ1tVSb
	wACCrVqStWoyae9rx8FaiIjHl/+9TuYXTVKePEh468SF3Po/KzpjZZqJuqHuPYw=
X-Gm-Gg: ASbGncvjsE9S+bDIE+KiGtilwujeaxSh0CXIsmAa0CwmSz2Xd3xVHB3XXcOcHgSta0G
	di0x/eIVHrpKy0QLQ1D1YMFzJ5Hq4bq7iNztp4bWvE7tfNqot0KxjQ0SOYwx0dSiy1fqs5kf7Pu
	3U+WUSfp79VlumjN81M72kj6LxLmMM8clIDv6WdrrnaUcDM+08Hka2KyxPj5A7K2PzpYeJHexIH
	p/fPS0JdMrX0xSEbWSDUPb0rslUA9fwidFsXHdZAp79WyO/lF9awRf9MnuhYoXWT8wk2gHERUCa
	vbUvCQg+wbC0ph5qoHQb1NsMsEdTJ4cNFD7wb1Z7RzRvnPEXjVJYMOc=
X-Google-Smtp-Source: AGHT+IFSUpL7sQZBeo4WH87oTnUbr9CBcpNBShjdDYc5CZl/+Ew852ggrseF0njXn2X7AHhzNVlq1A==
X-Received: by 2002:a05:6000:381:b0:38f:230d:4c77 with SMTP id ffacd0b85a97d-38f230d4e90mr5018981f8f.46.1739488735874;
        Thu, 13 Feb 2025 15:18:55 -0800 (PST)
Message-ID: <2af57b53-5b01-4435-a134-a3dc00a3d3a4@citrix.com>
Date: Thu, 13 Feb 2025 23:18:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 for-4.20(?) 0/4] Add/enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/02/2025 10:00 pm, Volodymyr Babchuk wrote:
> Volodymyr Babchuk (4):
>   common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>   xen: common: add ability to enable stack protector
>   xen: arm: enable stack protector feature
>   CHANGELOG.md: Mention stack-protector feature

Given the last minute observation on v4, I ran this through GitlabCI
with STACK_PROTECTOR forced on.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1670468808
is the full run.

https://gitlab.com/xen-project/people/andyhhp/xen/-/commit/b07b024f51907bc0f93d581287d36cf5bbfa98e2
is the patch to force things on, including some extra UBSAN because that
got missed.

This is relevant because the only 3 failures present are ARM32 UBSAN
failures in credit2.

Second, in all 3 failures, we've got an `ERROR-EOF!` interrupting the
backtrace, which I presume is something coming out of Expect.  Stefano,
any ideas?

My main observation is that there's no exterior way of telling whether
stack protector is actually active or not.  i.e. nothing printed during
setup.  However, all 4 builds did build common/stack-protector.o so I'm
assuming it was properly active.

If it was going to explode, it would have done before the UBSAN
failures, which are reasonably late on boot.

~Andrew

