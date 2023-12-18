Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF94817E3D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 00:44:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656412.1024526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFNGp-000609-47; Mon, 18 Dec 2023 23:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656412.1024526; Mon, 18 Dec 2023 23:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFNGp-0005yD-0z; Mon, 18 Dec 2023 23:43:35 +0000
Received: by outflank-mailman (input) for mailman id 656412;
 Mon, 18 Dec 2023 23:43:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=De97=H5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFNGn-0005y6-IX
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 23:43:33 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40968e02-9dff-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 00:43:32 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-336668a5a8dso2255862f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 15:43:32 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-110-223.as13285.net. [92.26.110.223])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a5d5385000000b0033662cf5e51sm5889553wrv.93.2023.12.18.15.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 15:43:31 -0800 (PST)
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
X-Inumbo-ID: 40968e02-9dff-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702943011; x=1703547811; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tl6o6e62opWh0JJ9gYs898h/HxcAzmGplKT6yA9erew=;
        b=kPG5vsfR1Hw+jIZrBsDDaDw5vN5V3LvuqJ2lwYuWWpjW37HrGi56V+l3re69R8G67P
         CTH8RU8vE+iVgBqbmeZvVWH2+D7zK9F0vCBxGXjEsqCNg46QmfBldIuMwQK8Z2gGoODy
         NT/nN9zOwNIKJid7Mhlxmpq+CWdr9ZFaidCAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702943011; x=1703547811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tl6o6e62opWh0JJ9gYs898h/HxcAzmGplKT6yA9erew=;
        b=G9Ffhlm/6hC+kmh6VnLI05V8YonzMMJnAXpED77Qd2KfIwOeu2RdlE1ngl/67AFJUo
         k7kHNxGVEqEOY1yhYz3uQfj9v6MAESc2nFMJPI7/3oiU89tiY/PdymEBS3b1JLkRsf4r
         WGkBbn1B3rwnfba9XGk5fD9i7eRy5mxc67+c1B5qA/1oPdAiE2UQ4tu45OQt0AmtJwVE
         kMAFtBJRNyM6vWdtjqYjg/4qj967ban7ZQ4aUQEtFZYpF9CJah/2UfPd0U7qZlUqGryW
         1schscjxDGA1f5av56td8+xQPIKgOohDzz4y+5Q2KJryc7u3dRruu5U8yghvXM6R+9Zb
         RRBQ==
X-Gm-Message-State: AOJu0YwW2Ct+sAGVpAGCUihd7coGNvCGmZDrGZIOtrm+to5zk5xzxV3o
	Rd4mw+13I6NEGV/f6nXTUftxRg==
X-Google-Smtp-Source: AGHT+IESlvbXd3aAb8Cm7D4l+YqsB+/dwnYaCtsm9DA3WuA8Ja/Jf8De/IEe45hjoQrOmlwIWXMtDA==
X-Received: by 2002:adf:e282:0:b0:333:2fd2:5d1f with SMTP id v2-20020adfe282000000b003332fd25d1fmr8782575wri.81.1702943011510;
        Mon, 18 Dec 2023 15:43:31 -0800 (PST)
Message-ID: <cd153225-5cef-4ff5-97e3-44e485c12305@citrix.com>
Date: Mon, 18 Dec 2023 23:43:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Possible bug in Xen
Content-Language: en-GB
To: Joe Tretter <j.tretter@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <de8b87e2-a4a2-4e49-80f5-97c745f46500@gmail.com>
 <9cc86706-5791-4967-802c-3e665bc97804@citrix.com>
 <a0aa0326-398f-44a1-a5df-fde3e7fea138@gmail.com>
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
In-Reply-To: <a0aa0326-398f-44a1-a5df-fde3e7fea138@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/12/2023 11:36 pm, Joe Tretter wrote:
> Hi Andrew,
>
> I have tried it with your suggested command line, and it "feels" like
> it makes the issue occur less often (but one never knows with sparse
> intermittent issues).
> The first time I ran my test, it took 23 minutes before the error
> occurred.
> However, I picked that when running two processes simultaneously, the
> issue occurs reasonably fast.

Do you mean running the unit tests twice simultaneously?  Or something else.

>
> I have, however, not been able to verify during runtime that the
> parameter really arrived in Xen because /proc/cmdline didn't show the
> Xen parameters. But I have taken a screen shot of what I have done to
> submit the parameter.
>
> If you tell me how I can view the boot options in a running system to
> be certain the option has is effective, I'm happy to run the test again.
>
> Side remark: To make reasonably sure the issue really only happens
> with Xen, I have re-verified that without Xen the issue does not
> exist, even with two instances for more than 1.5 hours.

Running `xl info` in dom0 will tell you various things, one of which is
xen_cmdline.  This is the command line that Xen is currently booted with.

~Andrew

