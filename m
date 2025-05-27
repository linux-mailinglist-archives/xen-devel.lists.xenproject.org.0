Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6774FAC5271
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998626.1379351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwgJ-0000aN-Jx; Tue, 27 May 2025 15:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998626.1379351; Tue, 27 May 2025 15:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwgJ-0000Xi-H9; Tue, 27 May 2025 15:57:35 +0000
Received: by outflank-mailman (input) for mailman id 998626;
 Tue, 27 May 2025 15:57:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJwgH-0000Xb-PL
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:57:33 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c4c2457-3b13-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 17:57:32 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a37a243388so3606109f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:57:32 -0700 (PDT)
Received: from [10.81.43.171] ([46.149.103.11])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4d0884cabsm9372270f8f.82.2025.05.27.08.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 08:57:30 -0700 (PDT)
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
X-Inumbo-ID: 4c4c2457-3b13-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748361451; x=1748966251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bXDP4i8pkv+pNGyPRXUxcPNPE68glxEtXFUBdwlcmnE=;
        b=fJQpPYcKwb6U0D5jfnYYk2S1lAkSzHipC8gvdLsaZRebcl5+2iki5/ouBWmx7Lhnn1
         BAZBAeOP5u2Dju8s458oX/livfcyxpsMO5AvZT3Q139yBVRJKlYCGB+b0AVk3adpcjcU
         hFcCzo1KRdz1f21MNia3xgzAD+zRKusJJtg+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748361451; x=1748966251;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXDP4i8pkv+pNGyPRXUxcPNPE68glxEtXFUBdwlcmnE=;
        b=iLqRtbaR2HwETA0w5ge8PvwwDeQ3/4KxlPIAwJcvJw+NjC6j/K8Ij0Tdvrb7hrdNZe
         1rjzDXW9vKR8X1Rv6wFZwiOXpCM64gCOYGZwP3zMzd80PjrsX/w0UKmAtVc6Tu9sYncS
         7dAhkcbzQT2fviEES8U1PZh0Ay1z5x5SFluG2nJSNj65MEaUTabEPdDdZ0Ovv4FEW/0u
         nPhzukdQZvAsnTZnKZ2XWkW6LMju3ECbR0mtWVvrYUEb4M4mdNtrFNv7AuDS7RY6tKBX
         SrhI8m2Q9fix0LzoDqzBG2ZHdTVyA5BtaR+H4ozgHTOitXZqbeWD5PsSx0Nu5T50pAA/
         /Etg==
X-Gm-Message-State: AOJu0YxJGTFJ/wHnvgLX1OCb07v5QCWLa3SIYkW1UcJ5YjQmUhD11zid
	stIk9WL6ekVqVD+xL6gYnHmaz6I0vNm5cRvYr3c72inNY+XEKggzpXcOtGUo4wmAvKM=
X-Gm-Gg: ASbGnctOZkraW252BK46djj1EaEg6FtEUvxSnzIDrWvphR3rq9zjTywDKs1xxNLYxhi
	nvjuQyX3+VR3u+lPNzDmhGq4WIZCRyW2sdqCCKpeFVpWmVCTWiypeLfcuQEO63nxyYuDJcrnO3G
	/xS3R6UM8lNNvatlnX90CcSCl7A19XaCschwGYXPxr817Zdozc3yQCRz1Lb5IdXLeOuS3Ki5BzJ
	maWDLEsDE44+8kR7Bc/ZYEQPTHyIyDjqXdWCiecJv1E8gtmXOBYB5WQlKXNLKhCs1+BfG8k5D+5
	anly6jaxALO7DH14bLQnT9Gv6YLBLxR8/lFP0Qdj0JnaDniLg7EMvOi2lQh7A2VCPdvZInXj
X-Google-Smtp-Source: AGHT+IHMtADaUNtBOe1sCbFGeVjRbe48Y/vGv2bj7uE8BRtuXxt0+5t2xiRgk5tR5PkYrZH/2EC0bQ==
X-Received: by 2002:a05:6000:e4d:b0:3a3:75d7:5864 with SMTP id ffacd0b85a97d-3a4cb4834cdmr9322585f8f.47.1748361451484;
        Tue, 27 May 2025 08:57:31 -0700 (PDT)
Message-ID: <a5bb80a9-ae12-4019-bab4-feb825e54a30@citrix.com>
Date: Tue, 27 May 2025 16:57:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] CI: Adjust how domU is packaged in dom0
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
 <20250522173640.575452-4-andrew.cooper3@citrix.com>
 <aDXERF8V2DQcyJoy@mail-itl>
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
In-Reply-To: <aDXERF8V2DQcyJoy@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2025 2:55 pm, Marek Marczykowski-Górecki wrote:
> On Thu, May 22, 2025 at 06:36:40PM +0100, Andrew Cooper wrote:
>> Package domU in /root for dom0 and insert into the uncompressed part of dom0's
>> rootfs, rather than recompressing it as part of the overlay.
> It doesn't really need moving to /root to achieve this, no? The
> domU-in-dom0.cpio can very well contain boot/* files.

Yes, but is /boot really an appropriate place to be putting test artefacts?

~Andrew

