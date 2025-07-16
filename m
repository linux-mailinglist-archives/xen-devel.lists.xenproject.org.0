Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6DEB0770F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 15:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045216.1415325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2FN-0003BT-QK; Wed, 16 Jul 2025 13:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045216.1415325; Wed, 16 Jul 2025 13:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2FN-000395-NX; Wed, 16 Jul 2025 13:32:33 +0000
Received: by outflank-mailman (input) for mailman id 1045216;
 Wed, 16 Jul 2025 13:32:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc2FL-00038z-VU
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 13:32:31 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52c461cd-6249-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 15:32:31 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4561607166aso27032455e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 06:32:31 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e14e82sm18024192f8f.71.2025.07.16.06.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 06:32:29 -0700 (PDT)
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
X-Inumbo-ID: 52c461cd-6249-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752672750; x=1753277550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IXfdBEDFSsGmPtuilC2YdUWfbJwi+s9kf9x2RD/6AyQ=;
        b=LGrxxe+irhJBa6Mx5QOHEroe4E635t31r5aJ3o7okv/+h7DBC0J9kqglkZbipYeq/m
         QoSq1uG1x57BUpQiilysJVrWc/3xMBf4uirhxR82vtxbYSSu0Dvp2WSVuM6nvDQWr0Rv
         xH9HwN3ODUyY+o9tgtzYLtDV8pmMhXFvd09rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672750; x=1753277550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXfdBEDFSsGmPtuilC2YdUWfbJwi+s9kf9x2RD/6AyQ=;
        b=mQx03he98oAqAzbqsqEBY9Na0o74bZkvAUTspIX8llPjK9liiT5OAbEUTnaoXuuwTL
         f2WpidwYwvhqgZf2IqWe/Kb8sDi5YS33/deuzqkSO6AUjy1naz9Af0nWJmXA1k9oNHp3
         DwVb89fGfVEI5tSnP/6D0sdG9q4bqgu8EFmQvhel8dLb59sCC4JztzyqPn+Hh49god97
         1Fq1AiKoULQhPhK2nkSwj8nvizUPWCPZbBAiuQTB5CNwVgPoPFYcj6L11afSoVxuCDYf
         pysnL5oT6bfDltMOUBYRIPNODYd2LmqAS3noSRDBcUNvkSVfhvzjwRtWbCD4i39WKnob
         RdHQ==
X-Gm-Message-State: AOJu0Yw+KW2REM+bQoowgANRih4V5ieCKrdXej5SmXsyRsMeqzgD7KbR
	vPHibjnicQG/k6uKJYWt76f44FIq5LwVvkbPFSa+/ZRpD7ti2Myj8uSvjMCo9rbcXqj56xJhhCk
	WdASu/epWlQ==
X-Gm-Gg: ASbGncvxCXTwm4t5ax5dwxKjDHg5UVzQJOpelC/ztNxuHa+t8wNBIaPPDu4TnWUXDRq
	RKCDeP7ANtHcBVi/PCGv62D7w4y/wI/BuYwqQVr/tH+zYrUuOlvM6zIlOA9T7Z4xpGW5e/v9y7g
	CnfiXmN+zy3p9oXRjw4la+h6zqQAzZByPytmeiRNwg9zjnMV9MDJr1diVlClFnCHvX6b6y7o3F9
	y21rx8g0K3L0kNNEGd1OzMpJ4Pp3v+xBKxcFV08zB8m8K6tb2zdjabUv2bNDnPiBuFAEpaQklbH
	AgHXKQiVHecRo94uJRcyJ+C5XdHpsWmXzqlnoE2gPIU3+qgk7zLgMH5gyh/zHktw7/fFexjaGK4
	TawxY3fB/rFzYXw+GcZrUFeaSvO6lkmcA5riCPdKXQdsrK67rigQitveY7TyPY6xWVpBq
X-Google-Smtp-Source: AGHT+IEWdNLkbmH7ymEw6X+6ZHbH+oBXYtdQEM3mQas/sMLwGIdW9Hd3vA/fbtMPVuOpNnHleUrOGg==
X-Received: by 2002:a05:6000:4206:b0:3a5:8a68:b82d with SMTP id ffacd0b85a97d-3b60dd9968cmr2326943f8f.43.1752672750073;
        Wed, 16 Jul 2025 06:32:30 -0700 (PDT)
Message-ID: <5d99e194-22a6-45a6-a338-a80d3321ad6f@citrix.com>
Date: Wed, 16 Jul 2025 14:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/vtd: Switch model check to VFM
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
 <20250716132843.2086965-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250716132843.2086965-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/07/2025 2:28 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
> index ba2c1c1c7416..f8b85c0f9520 100644
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -28,7 +28,7 @@
>  
>  #define VFM_MAKE(v, f, m) (MASK_INSR(v, VFM_VENDOR_MASK) | \
>                             MASK_INSR(f, VFM_FAMILY_MASK) | \
> -                           MASK_INSR(f, VFM_MODEL_MASK))
> +                           MASK_INSR(m, VFM_MODEL_MASK))
>  

This hunk should be in the prior patch.  Fixed up locally.

~Andrew

