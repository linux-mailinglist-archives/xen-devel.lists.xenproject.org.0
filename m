Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95ACA2BF42
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 10:28:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883507.1293476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgKeK-0007Ke-Rn; Fri, 07 Feb 2025 09:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883507.1293476; Fri, 07 Feb 2025 09:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgKeK-0007IN-P0; Fri, 07 Feb 2025 09:27:48 +0000
Received: by outflank-mailman (input) for mailman id 883507;
 Fri, 07 Feb 2025 09:27:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVmI=U6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tgKeJ-0007IH-Dr
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 09:27:47 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9697ee2-e535-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 10:27:44 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso11894815e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 01:27:45 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dfc8881sm47390385e9.28.2025.02.07.01.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 01:27:44 -0800 (PST)
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
X-Inumbo-ID: c9697ee2-e535-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738920464; x=1739525264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vko9yb8Bu8JvoGu62RUMUmr8/oSv71LSaF7CSkJKVvY=;
        b=Ty14ouaDlGKbHmsy+ky/UyITgoyaMheQxK7H/T3QWuY7IGlYYk9vqvzR5M4LxboWj5
         YXgOe7+AehxeBcBhF0E2Y7WSREhyeLpoDKIIUtDeCw+lkEii+ur3pKgc92d2iuxlSzH5
         fQb/JFr78/wcqfrSi3paB8t981P+5IcAW1d3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920464; x=1739525264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vko9yb8Bu8JvoGu62RUMUmr8/oSv71LSaF7CSkJKVvY=;
        b=ZUuiCCm7ztpMBiDl5JNm66oc7TT5tUSe84IzyGBbkzYpXJTR4EVORO4YS2x+nHWdn7
         X5j5WbByf0NwK5aOSr2yEJdm3Vc5nY6/NuSPzqwmCRADBG8vofsmAYXCH62PMkFX82Qf
         ooRJqqZGUcSabG/zCw/3283MA2wt/tuqajnFifW8GEiwFxb28rXooIFkQFvBI2DVBrXM
         UsGWwbM9OYhuPmrRKqKG2c6TOeDCzID3h9l7GzmhdGwiofqWuwT51dIUReg90zcOHNyX
         tkTqfAB/EiXHogD1prXrluB10nPNq65i+AUpBdWGsOnTCHpifOIdTcKUCkXcJnNmjsjc
         yUYA==
X-Forwarded-Encrypted: i=1; AJvYcCU9RZFmndQw4S0Quf7yhUzXzTfKBI3QL5z6c/6g/86xWN2VeVmFKF6e20dEASsZ2fKWAXvHLJq8lV0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+CigK31wo2H10aqffNwurT/NkRQ+zeASRXKCFe6nNyMupV+Gc
	VhU+mIU1oBWw3dZewDgvg+d9+Y1pZ3yU+aYWaOdF5NFHj0Mo0a1fcJ2QvDdNXHs=
X-Gm-Gg: ASbGncs7GPFIhnk19iC6Hdh48C69Hg4y93wS8eIXUuNrIoxGjYWirSGz7/KnkoVEVFp
	4XR4ApfC5nKJU7TyktOniUGQrr3iXVRmT5qNBysVHvzZFNwBNPpDwDI6p9cPVG0DKH3Vfw2WS8X
	C9oL44Ec8DGnITRUX47CsiQ4QZK0IgTk+PlwzJfUfr55by5WBJlKsNP98yBUzomzNLT8/QztEgN
	D66JH8Imhq1eL9NF1tLL84kR5BixfmzOwyXZccj4nWKEhFp/fzKRl+wnG8XcOCjBRNtNgAzFIO8
	OsJQ5ZBtzUmf7uamprcolvGDUmR4RTe3L5fiqjPyVa8ej/1l/X9XuPM=
X-Google-Smtp-Source: AGHT+IFKj1YK3aBdrpxMZJTN5Ymjp1FwrubRF4k5Bgbq6nw2W+Qb5hDAUElXY8PpGbo7qYXr1cJc3Q==
X-Received: by 2002:a05:600c:3485:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-43924994529mr19548345e9.17.1738920464373;
        Fri, 07 Feb 2025 01:27:44 -0800 (PST)
Message-ID: <3bb8a7dd-3b3c-43a4-9f50-37c4134eb204@citrix.com>
Date: Fri, 7 Feb 2025 09:27:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: enable UBSAN for debug tests
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: cardoe@cardoe.com, alejandro.vallejo@cloud.com,
 anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com,
 julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com
References: <alpine.DEB.2.22.394.2502051756210.619090@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502051756210.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/02/2025 2:37 am, Stefano Stabellini wrote:
> automation: enable UBSAN for debug tests
>
> Enable CONFIG_UBSAN and CONFIG_UBSAN_FATAL for the ARM64 and x86_64
> build jobs, with debug enabled, which are later used for Xen tests on
> QEMU and/or real hardware.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, but aren't you
missing two builds?

