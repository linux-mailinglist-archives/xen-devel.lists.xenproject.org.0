Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56E0AE459C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022478.1398316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThfj-0005XM-2n; Mon, 23 Jun 2025 13:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022478.1398316; Mon, 23 Jun 2025 13:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThfi-0005VQ-WA; Mon, 23 Jun 2025 13:57:18 +0000
Received: by outflank-mailman (input) for mailman id 1022478;
 Mon, 23 Jun 2025 13:57:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KmUX=ZG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uThfi-0005JB-Bb
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:57:18 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f700ba07-5039-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:57:13 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so27743835e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 06:57:13 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e97adf3sm143994475e9.8.2025.06.23.06.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 06:57:12 -0700 (PDT)
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
X-Inumbo-ID: f700ba07-5039-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750687033; x=1751291833; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AwvKD5lXHtHsqlwOmCf5TSohJch8GLLCJydovtcct8o=;
        b=b3GVB9VoZFWH5+AE7/2pY/NE+Y264DWB2jNEqXNWLFUZ83GToKY6c4P69EPJ9w3nie
         VKZAxYb7Bso/lz3970VKTxWJNVS2tRln+ZvzEQJiehFeDgNVhutP5cSBedK+vrk1HDs2
         bboc+QEdfgUQXoCrv7VIhp0flGDZZJYwv/wIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687033; x=1751291833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwvKD5lXHtHsqlwOmCf5TSohJch8GLLCJydovtcct8o=;
        b=bYHh9r9DG6ldmYLhuXDeo5qzbrzp2HsAC+HZwflUZt3JFzCFa0+Ya9x17znbIPA8K9
         AvBCQjaQPuzW9DCd9ymYYBZVvpzOAdNeWQEHdJbVXmOhq8FYx9OQ5LUI0laB05dRuOi7
         FQrRCDhFcuzPnfWkkV4PcBeEUQh57tsoRMrQhP6HVEpPj2yI4hDJvoWTt4kzDS+hEb/O
         WxYCbsmBuPmFwWxwJz7dJRN+wLxLQ5VjixC+KVV6fzO2Nlb1Epsl63KVeNDJ+2MUZnAf
         eGL28bg1mtqnds3zQv5v8CDF3Y+7Uo9yZB4OdEN2o19VGDpn6cdQAx5TdlFlhMGPJz8h
         d3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUEqfocUpZDt43kdfLfFL/sTQGDFA1b8oVTTh1SsvWkg3cE2nhDuo+DvC/qwkM2MbxdjjZflAr5mbA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxUQFD3f+uQ31nwHBh6FnvWvrq5Fh86xiX2qLR3NgJnJOl7J0l
	BD6lVW08ReWbHxW4sKxC2L+4mLNDhKqunh2/dSHKg+IK7C5oWJvCeK6Tw049ujPB00I=
X-Gm-Gg: ASbGncvxHAqK264AYdA1Vb00GhWscX7NDs1xmGS2uyvBC/OVRgCTBo/9FfhZzwpDQYq
	tGX61TxTAwGD0/RLE9XD/bMzykPxcAraUmhxftfy4XlE5yL/MqqxLLxFuMxpyotnneH0wafJYWM
	Wkml8yk+1wisHFAlLnGEfH/NImDrDj2lYl8GxN6Es2MIEQTcFWR5aKh6Q5ErRPzyOfqlSls7LBW
	wxE0Zc8YNwMQQZUOMW6xrVsCmbtNwpmn9SC65E4XjEtljd2+VSJOWoMLcBROgXym494M4sHYHrc
	n+//M3gXGbMb4+u7o30HsohMJoX3BawG4asZ1GO7yGuVevIi9TaoFlPe0xMOVQBsNejnzrnOwQx
	DPExqUjFZXf5pvN0btb3esOI/9yg=
X-Google-Smtp-Source: AGHT+IHD28wzuZDbqCwZjnVoP3b0lLWv5woZjBHNk75iaWgswuMay7oAp8/DhNCOnihQT6LpAZsQBg==
X-Received: by 2002:a05:600c:a20a:b0:43d:174:2668 with SMTP id 5b1f17b1804b1-45365dd57d3mr61245965e9.0.1750687033122;
        Mon, 23 Jun 2025 06:57:13 -0700 (PDT)
Message-ID: <9cf513c5-7a16-48e7-8560-4ff0214e7836@citrix.com>
Date: Mon, 23 Jun 2025 14:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH test-artifacts v1 2/5] Enable CONFIG_USB_RTL8152 in kernel
 for hw12 runner
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
 <8c97ac17c41e53c15e769f28d537faa01a0b2e6a.1750684376.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <8c97ac17c41e53c15e769f28d537faa01a0b2e6a.1750684376.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/06/2025 2:46 pm, Marek Marczykowski-Górecki wrote:
> It uses this USB network interface.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

