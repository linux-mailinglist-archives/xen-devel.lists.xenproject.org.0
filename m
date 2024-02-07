Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C46884CCC9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:32:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677703.1054475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXixc-00081a-RT; Wed, 07 Feb 2024 14:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677703.1054475; Wed, 07 Feb 2024 14:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXixc-0007z5-OY; Wed, 07 Feb 2024 14:31:36 +0000
Received: by outflank-mailman (input) for mailman id 677703;
 Wed, 07 Feb 2024 14:31:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7Cu=JQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rXixb-0007yz-EI
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:31:35 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 976a1e89-c5c5-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 15:31:33 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so100059466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:31:33 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q25-20020a17090622d900b00a37579fa8f1sm813196eja.71.2024.02.07.06.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 06:31:32 -0800 (PST)
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
X-Inumbo-ID: 976a1e89-c5c5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707316293; x=1707921093; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jig2Fn74+PW1WgMpn+wHyKCUQJuRi09dFaicsCJwpJo=;
        b=cQABvtaz+nywmHfgjQ+XbO5j0TC6Tzu0Bpy/8E/Gsp/3bD5kjzr60F65FaNOyY7WBC
         aazGfmcaC4po2u3Zvx41PjLyMOxuDyNd0V+mxPX6CEMRyAoJ/GVPW87Of7Ey9aTNun/V
         kCFv1suqfABtckCg8j2h+6ldSM10pKSWicWnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707316293; x=1707921093;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jig2Fn74+PW1WgMpn+wHyKCUQJuRi09dFaicsCJwpJo=;
        b=vNKHcFrvrfD5W+m+DrYYM5shJtBsME41M//PEx1FbeZ8p66WBTFhw12mKlBiWHi4Ir
         3nxRszQtrirZ5ajsLQ27WIjLsFMEvsOcqIlsO2c/jIJbkmY4C0Lzd8A5h9rvszNtevMZ
         qgzEkS5WUSvTIRDjI4Jbcosb79Us9zhCdNRZRfuJ5WG322Rb4oQPcPGueD1cdLksIeLv
         AWzcJGhO1dKlmTlvAyIdcsHA9RdiPC2T8ZXgEzDL8DLLvpzvQvc06hxqhbC1uCbs0c7d
         Z6fZctpFBarOKyDVHQfmFMasnzkSQWKcKfG68pevry2og+a/F1DHQtDuDj2GpIcVSeG5
         +Gwg==
X-Gm-Message-State: AOJu0YzJDrM8pKw6t9XfYp0AVvhrdmAh9sedtBJZauz0klprT03YXv04
	X2wULyWFMOe+QR9m2GtHN41oiffVpKWeb5WOsUXnNgRySRB33Kv2tGqUIck0Sm8=
X-Google-Smtp-Source: AGHT+IFJ7aoT4k5YGU1mtNWa08vNQDUPSwxjk2AWaCsfcTGUe0ClC0rPBxUb4i40lZ0l7TE4yIpK8g==
X-Received: by 2002:a17:906:2551:b0:a38:40d0:24db with SMTP id j17-20020a170906255100b00a3840d024dbmr2962652ejb.13.1707316293085;
        Wed, 07 Feb 2024 06:31:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJP9c14Pb/gZxpaMaADoDEFwSD9RT/EsypWUqOFfhFhpnXgABsjnPA7Lt3U7aZG7QGSQK1aMzipiFjk5mjsZDk3FY5HClS8j+1f+c0eJFczykG9IzNs59VwpGeIHZKYmso18MW
Message-ID: <59b77f3b-53d8-481b-925c-b7f0dc64e2c3@citrix.com>
Date: Wed, 7 Feb 2024 14:31:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader: suppress GNU ld 2.39 warning about RWX load
 segments
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <90070a25-445f-4b82-be19-d87b25fc9b8c@suse.com>
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
In-Reply-To: <90070a25-445f-4b82-be19-d87b25fc9b8c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2024 2:03 pm, Jan Beulich wrote:
> This aspect is simply meaningless for this component.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

In principle Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but

>
> --- a/tools/firmware/hvmloader/Makefile
> +++ b/tools/firmware/hvmloader/Makefile
> @@ -20,6 +20,8 @@
>  XEN_ROOT = $(CURDIR)/../../..
>  include $(XEN_ROOT)/tools/firmware/Rules.mk
>  
> +ld-option = $(shell if $(LD) -v $(1) >/dev/null 2>&1; then echo y; else echo n; fi)

The root config.mk has cc-option, and one opencoded ld-option for
handling build-id's.

This ought to live there, and ideally clean up the opencoded use while
at at.

~Andrew

