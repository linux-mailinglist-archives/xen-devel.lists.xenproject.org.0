Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9684A67469
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 13:57:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919074.1323616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWVs-0001QJ-Vz; Tue, 18 Mar 2025 12:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919074.1323616; Tue, 18 Mar 2025 12:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWVs-0001O0-Sm; Tue, 18 Mar 2025 12:57:44 +0000
Received: by outflank-mailman (input) for mailman id 919074;
 Tue, 18 Mar 2025 12:57:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuWVr-0001Nu-5g
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 12:57:43 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9432591a-03f8-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 13:57:42 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so15674295e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 05:57:42 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdda2dbsm134894375e9.2.2025.03.18.05.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 05:57:41 -0700 (PDT)
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
X-Inumbo-ID: 9432591a-03f8-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742302662; x=1742907462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EF7urUkj3Lh7LIvDdeXv24STz2K8TurF3cbRfAhb/g4=;
        b=NlZ4TOWRPmr6nISTLpfEXKkxD8+xPakRMC5pJ9MpBqoVv7dx9isTnmj3/S1YLP4oPj
         AqQS0enlWLJz59iVmpiIFwwhvL77aKHdm6qogLk0EAIJlRA09nVSB8I5Y8gjBg56A6/6
         +xT/U55LZr3+AjqlgR+Nhi0Ee5HXpaoAqBgPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742302662; x=1742907462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF7urUkj3Lh7LIvDdeXv24STz2K8TurF3cbRfAhb/g4=;
        b=v3k7yHTZgkYri3AKsv/Ya1Fxg0Z0RNPT09UDeAoZBx1WaxSsXYKxGkigM/VsLBN+sf
         fMhc9zQSqAfnOko72cFknVBl61DVcjziwrLzi2WeiJbBnJwk9bBHZzBxaaaJmeL9rPa4
         ud/pdNnfjJN3cDVr050SpkMbTaVC+uPQ4V3Wr67zBDZYLy7vwph5H2i/TqUp0e6/4HX/
         HXwpKItdUTCLwLPG1ZOj6ZPCd3n9dJWiH+JGwK/pmkSoZAnlEoz3RX1C+MMBnKtE4Apf
         8qErcpeTyemUcyat1L1DgtiWySPM2+w12qn9Tm1Hro7Gt7RKvo4Pw3TBMcfabHJo1Tfu
         z1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCV/D1Td92RUlRaFmOVEhE7vAI1NTYS5sIIsLXQd03R9zkP7/LA1I9wgfQfs8SRk5wn3FrGp8YwiCa0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxY9wT4MKCIVylfn/ctoIgDO7zD1bAUkZbjP5azE55aCi/0s6cj
	hJkdhzddrID4KEkHPWg99i9gGTeU/Plui6ZkBiRpXGTtI0z9tXfTRqbJtUJwiw8=
X-Gm-Gg: ASbGnctXAyD4K+wob5NANXXRCOPWHExO+xyRNxps3Z7vuGSC/4rXEy83dYuV7kof4m0
	sueuktdd782lKS2MusNtcdsYgpn6P7r5ndsALyS0WVaf+GgUqE3H2ceZ3FazGq2TPy9DZ0g5YVS
	uBKe0zY6JmSSxwP0XMhcc5ImwdUr72qg8wUA58c0O7flQgVIdAC8rPntYqBjbNMDgjn/BAackXv
	WvIAVHwEVPO2mSRJuc+snQhwO+0rD3rfViaDN+4ZU4KKvpYOFxKeIGAOUlBfaoLRIioXLsZMjVB
	YzpZ6SXcCmXqDS99scU8BRsZc17xYVwwG4vZtuK7C68B6GbrSiC0eLvXVbGZMNCdaF6oH/o2V3a
	2f2NINaM5
X-Google-Smtp-Source: AGHT+IFw3FuHxPbfrcTYHFsYJSVHUXR3nkVyZlmvKgPeKfbCgmKn8fwEhAMfZUqI6wU6/mVm2uJKGA==
X-Received: by 2002:a05:600c:c8f:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-43d3b9ce6d9mr17185195e9.27.1742302661517;
        Tue, 18 Mar 2025 05:57:41 -0700 (PDT)
Message-ID: <dc655670-8999-4f9d-9e58-cec2849bff24@citrix.com>
Date: Tue, 18 Mar 2025 12:57:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] kconfig/randconfig: enable UBSAN for randconfig
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-6-roger.pau@citrix.com>
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
In-Reply-To: <20250318091904.52903-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 9:19 am, Roger Pau Monne wrote:
> Introduce an additional Kconfig check to only offer the option if the
> compiler supports -fsanitize=undefined.
>
> We no longer use Travis CI, so the original motivation for not enabling
> UBSAN might no longer present.  Regardless, the option won't be present in
> the first place if the compiler doesn't support -fsanitize=undefined.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I can't remember quite what it was, but it was very early days and I
recall the toolchain cared about libubsan which wasn't in the Travis
environment, even though the end build didn't need it.

Either way, it's long obsolete now.

