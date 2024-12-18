Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43999F69E3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 16:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860556.1272568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvqE-0007IJ-Nw; Wed, 18 Dec 2024 15:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860556.1272568; Wed, 18 Dec 2024 15:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvqE-0007EY-Kp; Wed, 18 Dec 2024 15:20:02 +0000
Received: by outflank-mailman (input) for mailman id 860556;
 Wed, 18 Dec 2024 15:20:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNvqC-0006zz-Me
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 15:20:00 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8be80132-bd53-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 16:20:00 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38637614567so3086237f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 07:19:59 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8046ca6sm14535710f8f.83.2024.12.18.07.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 07:19:58 -0800 (PST)
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
X-Inumbo-ID: 8be80132-bd53-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734535199; x=1735139999; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=If0d0ZTvsDsHdpOWQjvwSqEk84/R6f2ktCgvtQ4+QmA=;
        b=prjbC4ompzs1fDyOtWcNy59T3ZK6CEwMPjl1gHyHgbalgWStezpq/jozs5pkBMoFAP
         WQU3DQUuIKko+HV4ywcHKn8Dcr/WNfm5V7lfC6t5fT9IAZyM3KVXrwTUXaHiawpsW4op
         ItQC1uXMTSGZyKzGKCXljjPP9M9YT4QzAUamM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734535199; x=1735139999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=If0d0ZTvsDsHdpOWQjvwSqEk84/R6f2ktCgvtQ4+QmA=;
        b=qc6azL6tWbnI458N+iDjafRA8Y7hUQel7jEmMZ6xO2kTeJonamsl6Kl/0/Xy2y1D2v
         XIkNwXsyNXSZngqoD4PRvnCOFWW/tSy7HjzMlsa05vLOiwxkDfKLkXbLQTv2sPTCHu6z
         YEChJv7IbRfkFpged6WI0RvC/2lxOvJKhEVtfrLmhStd3Ti1Ru5HLyTC7b2BqD1Rknln
         VxkZCPnWYip2JEwQXb/vyNndfIe1OYbzXF9dNwxd7DO9juH/HxUehRFVkYg6np72WWZS
         8YH096M4MfDwJasw10/0OUR2klxo55+pGMdLtXi03g9b+nqNptKiQQ7dg6wHBSGCP4IP
         Z/jw==
X-Forwarded-Encrypted: i=1; AJvYcCWVivI8Bm/a8wuQmFK81slSu5QomIXr739jUJev8nBs0tu6zsxugp7P8a785JGBLYsNRgBXUrPLUM8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDfUpDIpfUhsDuba5CVCbtCUEKVerdksWwgGlSF8isgjj/1TI7
	ZCuoIzHZmWc1wdU9Pz8KnMRaVBZKzFTKNrUKH4qAmg1SKmSZjgv1qDi8hquorS0=
X-Gm-Gg: ASbGncvttFftheXsHLNYdExqUMif/G++zjWMI/VJhuobakDSWvI1biq8yex4jOyQF3H
	zm6J/BZ+Yz1cyDBw0ySYXJLlR/88vLey0gPpM69baeRGIJKiQ9LeGapmhGf5tGCcurYp486PtmU
	zrNkfjO2HJBU1m7ZIX+OQd6o85IS/daIp+CMIQ87gHsb658GaGAx4lZ5WCeS9EzUmgkifpQNiu8
	OXDYKIZU5qYwiV9dosEkBI+Xi52MVrQ5Hx43BqGc13x0rcmdL63gRPIb7/rh5d/yaDhNH66cKxG
	cXgKo7TmN3bFe/+k1zAy
X-Google-Smtp-Source: AGHT+IEMhMYUZNHcFSQJC4Q3OY5VOzk77Flnp60W6TsMV0R9ca17hwpmYCysQuSO2UXX1GjYfMIesQ==
X-Received: by 2002:a05:6000:18a5:b0:386:373f:47c4 with SMTP id ffacd0b85a97d-388e4d96cc2mr2900731f8f.49.1734535199373;
        Wed, 18 Dec 2024 07:19:59 -0800 (PST)
Message-ID: <8f1c342f-61d3-48f5-8311-a1162a20cb24@citrix.com>
Date: Wed, 18 Dec 2024 15:19:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] xen/arm: platforms: Add NXP S32G3 Processors
 config
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-4-andrei.cherechesu@oss.nxp.com>
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
In-Reply-To: <20241218101142.1552618-4-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/12/2024 10:11 am, Andrei Cherechesu (OSS) wrote:
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index 02322c259c..6dbf6ec87b 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -37,6 +37,14 @@ config MPSOC
>  	help
>  	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
>  
> +config S32G3
> +	bool "NXP S32G3 Processors support"
> +	depends on ARM_64
> +	select HAS_LINFLEX
> +	select SCMI_SMC
> +	help
> +	Enable all the required drivers for NXP S32G3 Processors Family

Minor point.  Help text should be intended by 1 tab and 2 spaces.  The
surrounding examples are wrong.

This can probably be fixed on commit if the series doesn't need a resend.

~Andrew

