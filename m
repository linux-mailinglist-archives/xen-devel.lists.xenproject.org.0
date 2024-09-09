Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2F9714FB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:11:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794170.1202914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbMh-0003bh-43; Mon, 09 Sep 2024 10:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794170.1202914; Mon, 09 Sep 2024 10:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbMh-0003YX-0k; Mon, 09 Sep 2024 10:11:23 +0000
Received: by outflank-mailman (input) for mailman id 794170;
 Mon, 09 Sep 2024 10:11:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tbp=QH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1snbMg-0003WU-Iu
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:11:22 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd0dfeba-6e93-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 12:11:22 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c3c34e3c39so5960366a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:11:22 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76fcfsm2833861a12.65.2024.09.09.03.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 03:11:20 -0700 (PDT)
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
X-Inumbo-ID: dd0dfeba-6e93-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725876681; x=1726481481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XdG2goq3CitGk2L0O9yovOhmwebl+mOq4vUYUPSWTYg=;
        b=XY6DFlArgf4oXU7YvhOHvUKSB2XZn0T9MmgS5fmu2VEiizbV6YPmvUcM35kh55bHPv
         88vTccppUR5L4tmlB0Eswy1NRdoF8stRrXsOnUoe8CvWp8w0kVAPcYC/vlzzb0W5zfC7
         PhVR199TN+FVxcGJh7pBMBbnPVlkiVQGBDeeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725876681; x=1726481481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdG2goq3CitGk2L0O9yovOhmwebl+mOq4vUYUPSWTYg=;
        b=bIp18pVcWX1g63/KL9Dl5hRweX3jLA1XFDUqWEAXaFOSgM7zgS6OKgIRfyCn1ccqb4
         GJhzfhtbhCvYC3uGh0VTgRXz9G6dHQ+5Tas3nz/7MRS51JO07LNWOo5NLfNKOPFzJ6k2
         53B9oBNTdjtGXBgBg88DPpMg5TKkqExfPBtDnYgD8i8WrMkTpaPn8ii1u+vwye9+19Kg
         /WaFczMhyWGHRG5Y9fuGEdnc7K11rjgi8tdi9ZPYTKFgnLoBbozjUOm0e2i87YZn25cX
         uDPYRBqNd9ImsSh4fc+3bKhwnCdJeiZbYAlLz5SAdHyZpvbXS5hjXzVrfOB2xPf5kqNO
         w1+g==
X-Forwarded-Encrypted: i=1; AJvYcCWo2pdXivEORAmbDUXYaORJ+sREEYRGmX5oS6SI969NhWrTjVrPMo1Kh/OtFxkN0LHz9BWCUMZEwgI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAK3SaHhCiNEL32+HhaWSWKfLEJowOKtrtTvj1jLKVJgNk8KiZ
	OgxRiDRRhBv1QcO+BEtIWeUBvqW0EPTNlr90zrWFHEfY6iJK/Eo1D8HrqD2mPg8=
X-Google-Smtp-Source: AGHT+IG5Y/JYSDJdhelet2pXXENR6Jhw+D9RX6SIde9U12cCljOJB3a7UPCiiMU0Ys1hIGTnWnGUYg==
X-Received: by 2002:a05:6402:1e93:b0:5c0:9fca:3ab4 with SMTP id 4fb4d7f45d1cf-5c3dc61ca23mr7106554a12.0.1725876680683;
        Mon, 09 Sep 2024 03:11:20 -0700 (PDT)
Message-ID: <53bc5d1a-b328-422b-b726-a09893727005@citrix.com>
Date: Mon, 9 Sep 2024 11:11:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair_analysis: fix MISRA Rule 20.7
 regression in self-tests.h
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>
References: <4e59a8b7d97f34a824922013ffe5e44f70e6abaf.1725801931.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <4e59a8b7d97f34a824922013ffe5e44f70e6abaf.1725801931.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/09/2024 2:27 pm, Nicola Vetrini wrote:
> Prior to bd1664db7b7d ("xen/bitops: Introduce a multiple_bits_set() helper")
> the definition of {COMPILE,RUNTIME}_CHECK was fully compliant with respect
> to MISRA C Rule 20.7:
>
> "Expressions resulting from the expansion of macro parameters shall be
> enclosed in parentheses."
>
> However, to allow testing function-like macros, parentheses on the "fn"
> parameter were removed and thus new violations of the rule have been
> introduced. Given the usefulness of this functionality,
> it is deemed ok to deviate these two macros for this rule, because
> their scope of (direct) usage is limited to just the file where they
> are defined, and the possibility of misuses is unlikely.
>
> No functional change.
>
> Fixes: bd1664db7b7d ("xen/bitops: Introduce a multiple_bits_set() helper")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Sorry for breaking this.  I did check that Eclair was green with the
patch in place, assuming that this rule was already clean.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll try to keep this in mind when extending self-tests further.

