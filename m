Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441FA11C19
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 09:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872234.1283194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXyr8-0003WE-5p; Wed, 15 Jan 2025 08:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872234.1283194; Wed, 15 Jan 2025 08:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXyr8-0003Sw-2a; Wed, 15 Jan 2025 08:34:30 +0000
Received: by outflank-mailman (input) for mailman id 872234;
 Wed, 15 Jan 2025 08:34:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmQ5=UH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tXyr6-0002zL-6r
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 08:34:28 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87cc6902-d31b-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 09:34:26 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aae81f4fdc4so1217576066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 00:34:26 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90d7432sm723493266b.49.2025.01.15.00.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 00:34:25 -0800 (PST)
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
X-Inumbo-ID: 87cc6902-d31b-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736930066; x=1737534866; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z2ysLbEI7X584EpDVqE9nJ0x3U18niFArgjG0UQN44k=;
        b=YcYtC5gkayrXsOF5sA+Gl6WDoMJXYfXzD6wrYUMgqOuO37e5rKpprcg4gpedanFrVU
         7DHKR2qNdqDl0n1SLX2VeZw86HU1x5qCLYDgKNJ2tMcN+vJcC9UyGK+1inmsJhGHxBq7
         B6Mz5SFQrOI8unREeLVac9TqM1sWJz5bz7Pu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736930066; x=1737534866;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2ysLbEI7X584EpDVqE9nJ0x3U18niFArgjG0UQN44k=;
        b=r1VLHgWQxLmfj3/1Wb937LoWmXwko8aBPlxuOJ9xGumO19f6mzZ9dOJ3XrSlqyUiB7
         a44aRfFDNl+aQ11dem4Bo5ZneGbExbtEvUYWyBPthH6Jhenxlo8E10dzGfYC/U1j0liC
         k4eOrPQzDJUhFkCr5lg8a8tH6AZCt2UCEftiLojZ3SQiqrBgmdcndbB+cQCu9hSYsVR8
         zL53QV8K5kQsGEaThLN9gg4JbqQi8vZcpS13AsX3+9VUWpplM6kD7bv6P9nBc3XG1lMP
         WIqBrmUleH0EDzcsKDDMY6ohbnhT9hS4pztGo5HPWCzkLI85JGANxUicmoAeOFqSCZGC
         632Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDzUWYIUwPsfD+PfcCfdkP269hnN0uPXhuN1VgdWEgxy2tCzW4792bUzJ4136Zy0/qc2snhfUUhsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVy2kwh6xjB1sM7Kd4SF/oU+0V1kOv+NtOIaJupHv85NiAHwH9
	2dw7xXPZr00XQyTZO6eA4YfeB/IsldjwJbe4xsfAk6lbzwpwPVKlgELYNATZzmI=
X-Gm-Gg: ASbGncvugW96PlpXZX55fiae5yuYqucrYbGc1sTKm/WlSQZgHfrHGKmfIlZnY/08TVK
	2EIpv9JB27b0cs33K2A7pBX5wbxyzW/01zIjEhpvShi/kj5jE7fKSKEuov9+xD3H2oJ9DrVYGlE
	lEVoheT+30LGtAtf5xD8LF1OyE+fpXDN2ZjUbzZzgMWmZOAZNEKigVietkuL385NPQOLVRJoufH
	WV5D5mrFuOaotwVzJHrvxzl5a8oRZLHcwp0l8yPFA8/So9dM0y4k8fcmqmRiwRmmOv1EKW4e93N
	QRiS311o9KyHHrpIm3Xn
X-Google-Smtp-Source: AGHT+IHY6Q8LOH1M4ArROFPA/UvB6WVYMaL32D/K5ffZv/60IPmdh99R/ZS0u5UWpp7XWb2lI0mITQ==
X-Received: by 2002:a17:907:3da3:b0:aa6:33cf:b389 with SMTP id a640c23a62f3a-ab2ab748baamr2413942766b.34.1736930066215;
        Wed, 15 Jan 2025 00:34:26 -0800 (PST)
Message-ID: <f9e56fb4-0ed7-46ad-b0cc-55c95cebaaad@citrix.com>
Date: Wed, 15 Jan 2025 08:34:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] automation/gitlab: disable coverage from clang
 randconfig
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20250114174345.60887-1-roger.pau@citrix.com>
 <e55b8b77-e97d-4952-a995-b566e7974da6@suse.com>
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
In-Reply-To: <e55b8b77-e97d-4952-a995-b566e7974da6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2025 8:19 am, Jan Beulich wrote:
> On 14.01.2025 18:43, Roger Pau Monne wrote:
>> If randconfig enables coverage support the build times out due to GNU LD
>> taking too long.  For the time being prevent coverage from being enabled in
>> clang randconfig job.
> Just curious: How long is "too long" in this case?

Timeout is currently at 1h, for what is a single build of the hypervisor.

~Andrew

