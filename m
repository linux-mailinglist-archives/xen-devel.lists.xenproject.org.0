Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADF6AC67DD
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 12:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999320.1379998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKERv-0007wo-NI; Wed, 28 May 2025 10:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999320.1379998; Wed, 28 May 2025 10:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKERv-0007ub-Ki; Wed, 28 May 2025 10:55:55 +0000
Received: by outflank-mailman (input) for mailman id 999320;
 Wed, 28 May 2025 10:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isSc=YM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uKERu-0007uV-Cd
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 10:55:54 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5272bc62-3bb2-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 12:55:52 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad8a6cda6a4so48417666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 03:55:52 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8a1b5ac15sm86980166b.163.2025.05.28.03.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 03:55:51 -0700 (PDT)
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
X-Inumbo-ID: 5272bc62-3bb2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748429752; x=1749034552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi9t1orpgh2KSjxX3Nz+ieDaTQtV+mi94T2C3dVSgKc=;
        b=FCctOy7YJLr69JpVNeKXSjI0UxPEotfjBX0PiXtlufCDqdFM+9nolG68pOX94V8S4/
         mO/bEs7ntC3uypmDrpp13VGyD0em571RCIFbdTMMI3gyCEeE/z0H6v2/bWG/cJaDEQgd
         INNPvYcWOkRHFANI6j1kABNdNUrfm2KoH7SN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748429752; x=1749034552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fi9t1orpgh2KSjxX3Nz+ieDaTQtV+mi94T2C3dVSgKc=;
        b=GXzK6oF4lxiaQC4pRS9CRjeL4e9LnwvnwIsUrTj42+6HMqYQFWfbvPDADzqEzetT/u
         wyF4aHSgkSqvSgnO9Z48W5Jl68zv4fHL8eNSQBP7ADV+Q92sYTuJRTQnQYqwK9BqW6X1
         JvzHiHtciTaI0eNpbjov/S1q2hQ6nC9d8v9iG5c9fR/B14PsBvtWI8vqXJ6jFaPFbIb/
         zkRLzcgy2UFa9XoH84BIox2MSNMsAzHv/tTIHwtKhBIpBC2JXxXbT3kqkd8jh6aiZubr
         tp3JpGhpgjFhNw55BTgAFl9x4bQ9/vOmDN9WWFLZWVJK3w/pKO5196wvwD9Kgi8IWp9k
         gJFw==
X-Forwarded-Encrypted: i=1; AJvYcCWK7+pNpYTknHgakd1QsWRBz3uqhivY5bloWAL7iV/rdRgRdZauSibjdCbIPDKheKd+Guul/0837QE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1azsJYfE7MxXTbXIAHN0BYJAh0OMcsFg/2QKTRq39dzjt7EXH
	vbYPz/hF9HFerMdhDCnWPsA+CiintR37W8WTIcrz4Xho94NGg6QgZyFgIWMDfclSMKg=
X-Gm-Gg: ASbGncv8BvBzmrPmYUOqj/PCIyBRnBAet2AUuiSKcwSe2nEPQUk0nZwo7WaWbE5Sf5+
	g6MYX2dlrDoQjkYMW/fVVkSRjz4mpejzYTFFGnKrnS4BgNHOYJEPPPU0Z2RRar1T1CPRuVrGnTi
	KuF0iqk38YfrR8ytKT0AP4a0qZW8CgOzHE7Rjjj3CLzZxGPsCNtqt1SbYHCinamFzz1M8wbUguy
	8RsPWUw9Bpow35k0h5EfDrSxCvDH2OXY0WhlD/NhOruSc4XkJM1lgXFwOu5yPngqGJz2GIlxWsQ
	4meUELQBiQ2rr7Zty+maVW/F+Vf6i24Woav2TtavnH9XR+FWCavoZtU8FPkhYOXxC1KSJbKurCS
	E3V+FAoWDRz9eBNiv
X-Google-Smtp-Source: AGHT+IHVxFMaM/0qWNyOTRwCfUg3yzD4Yi0+BSa0Gks2boxk7fR8Nj8dOcMduGYSqZhkxY+aTmdj4g==
X-Received: by 2002:a17:906:794c:b0:ad5:a122:c020 with SMTP id a640c23a62f3a-ad8988b2e36mr386499166b.16.1748429751624;
        Wed, 28 May 2025 03:55:51 -0700 (PDT)
Message-ID: <598650c5-386c-4384-9642-1cb77fb1d32c@citrix.com>
Date: Wed, 28 May 2025 11:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ACPI: move scheduler enable/disable calls out of
 freeze/thaw_domains
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <974033e9ff0df3ce8a74efaa33f1cee1dcbdb030.1748340071.git.mykola_kvach@epam.com>
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
In-Reply-To: <974033e9ff0df3ce8a74efaa33f1cee1dcbdb030.1748340071.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2025 11:04 am, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> The scheduler_disable and scheduler_enable calls have been removed
> from freeze_domains and thaw_domains, respectively, and relocated
> to their usage context in enter_state. This change addresses
> the concern about misleading function semantics, as the scheduler
> operations are not directly related to the domain pausing/resuming
> implied by the freeze/thaw naming.
>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

