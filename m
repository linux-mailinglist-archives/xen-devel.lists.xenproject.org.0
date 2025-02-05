Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB27A28988
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 12:41:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882190.1292377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfdma-0007Fo-Pn; Wed, 05 Feb 2025 11:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882190.1292377; Wed, 05 Feb 2025 11:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfdma-0007EL-My; Wed, 05 Feb 2025 11:41:28 +0000
Received: by outflank-mailman (input) for mailman id 882190;
 Wed, 05 Feb 2025 11:41:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ANbf=U4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tfdmY-0007EA-FZ
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 11:41:26 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 214265da-e3b6-11ef-a0e7-8be0dac302b0;
 Wed, 05 Feb 2025 12:41:25 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab6ed8a5a04so1115079866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 03:41:25 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.9])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7de5sm1089335066b.35.2025.02.05.03.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 03:41:24 -0800 (PST)
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
X-Inumbo-ID: 214265da-e3b6-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738755685; x=1739360485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xlF4W3XoYrWSf/kRCkmDrRhe1mWxG7hqTuWID8pFR4o=;
        b=k3VrgjDUOl1GjfmYcRrcT/0Fivn4DSat8M//qYwUTZGJCmdOFMglm+xpYi+RikT5r+
         9QYjo9INhJawyxoeaU98dQvTfb4GswaohRIrCTxAgO+4+2Om1V3yXw4WYh77Niosskir
         +Yf0JthctESrKe0gu5ELfihaf7ZOF12QXvzfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738755685; x=1739360485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlF4W3XoYrWSf/kRCkmDrRhe1mWxG7hqTuWID8pFR4o=;
        b=kQZ02tMxw8fhgnNCcwB5OzgpDRuUNXsAOlHtfuooR8V8YcXK2oeeCuUPpQUaIbHXX5
         vkNzaUOitDitDeJOMV5l3bebLJP3Ch5A3YAbwIUaoWzbjt9g0E97QYKxzQzKDg1U5f0I
         cUawuC415vZ4GEZt5J//MRQk5mVCshwZRJ2Gqafo5NyhEgcXIiNfRyHof5PZNTTl9+4l
         58ZfTwkGGlHqhWE5hTijkqnYq+3t4aleASuNccOiy319U5p+fP33UYJZRTVHXLDlQ21U
         SpjjR8Azg+vdJBIjGvfK3HqZGcYoyaKhmLJSn9v0f1h2CBcmdAvsUmvYDxmtcHw8y3VN
         bnwA==
X-Forwarded-Encrypted: i=1; AJvYcCWMdEe7IovuqVz/HMmdneZPZPdwnHo6VQe/XCZcetfb/iX+BUP6H7/hQUZJbpVuPLO3khnJNjUQ0as=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjdQ/XcRxx8a3pXV2FWw5OxQ1mBxbAVI/7P0zZtLvSOnWV79aB
	bd1t1jF87sqI3tjuDNvxVtzuWo8S1Vx7e691tNJpECnk08toC2vIarB6tVpIWuQ=
X-Gm-Gg: ASbGncvTKBVdxeCp396zGHZXTJu4CpzZmPmLehXbje40IvU3yOc+2kqcjJ8LJeZY1d7
	/G8qWXJR9BiU5nzSWDyoKxO++UVjvkJgu2pxFpIxxFcoPZE3uftipGIdEZGfwZYIW2NiPUc5BrT
	oMv2g5sAs+z4zpRb0xKauZ/KyzO/Mdx1J+ihr66wYW1KLdH6bkvHdAGPq6IyIEZQwpBNTJ9smvx
	QOOXx5tLVbDN6FfZyPExyBacnPOKBIPsoRn6th+uSTFtyeWp+g/MY2when1sEYhnfMZq8Y73t9U
	U/sbId5mWjE3MN9YkW3BLRi/
X-Google-Smtp-Source: AGHT+IGyyeAqC49T09GxEsM+42n43RJ5s2fwXDPrHCHuZikSNgPzcQw+33wDdB5u+t1Yz+id5DU2lA==
X-Received: by 2002:a17:907:94d5:b0:ab6:dd6c:e30c with SMTP id a640c23a62f3a-ab75e310520mr257819966b.45.1738755684920;
        Wed, 05 Feb 2025 03:41:24 -0800 (PST)
Message-ID: <5c6d80bf-f090-4812-9620-5051e8ebb671@citrix.com>
Date: Wed, 5 Feb 2025 11:41:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] x86/xen: some xen_hypercall_hvm() fixes
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20250205110651.26280-1-jgross@suse.com>
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
In-Reply-To: <20250205110651.26280-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2025 11:06 am, Juergen Gross wrote:
> 3 fixes of the xen_hypercall_hvm() function, with the last one being
> probably more a cleanup.
>
> Juergen Gross (3):
>   x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
>   x86/xen: add FRAME_END to xen_hypercall_hvm()
>   x86/xen: remove unneeded dummy push from xen_hypercall_hvm()
>
>  arch/x86/xen/xen-head.S | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

