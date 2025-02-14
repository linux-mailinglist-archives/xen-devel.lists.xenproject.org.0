Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B5A36206
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 16:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888925.1298192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tixq6-0006Cf-GN; Fri, 14 Feb 2025 15:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888925.1298192; Fri, 14 Feb 2025 15:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tixq6-0006Ay-DT; Fri, 14 Feb 2025 15:42:50 +0000
Received: by outflank-mailman (input) for mailman id 888925;
 Fri, 14 Feb 2025 15:42:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vTB=VF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tixq4-0006Ar-BW
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 15:42:48 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56df30c3-eaea-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 16:42:47 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so23409985e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 07:42:47 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439618a9970sm47264215e9.33.2025.02.14.07.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 07:42:45 -0800 (PST)
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
X-Inumbo-ID: 56df30c3-eaea-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739547767; x=1740152567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nwQlDzJ3dFbHgTvWxvyjKoFzJ2Qr6hXd9xtRvxXk5L8=;
        b=R5xNJBUbI1kbHqwGwaSFQeW8d/dl5/K5TF6AE6AlGqm6LjW5uEJUxPCDmkybQt+d5V
         4zRU8pjL1j3S6s5LpxEnjEeZroVAHi6xMDKVF+Om14aSyzdUtwlmhz7LzCIzlbkkOE2Y
         FZSqcJaPDDLzl1mbkQeNbV8Gp758aY5gqTBGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739547767; x=1740152567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwQlDzJ3dFbHgTvWxvyjKoFzJ2Qr6hXd9xtRvxXk5L8=;
        b=Vk3uWNdLLIG2/OLKG8EKzxF8EYqHzZUY/JjmWOgMBU2A6hpe+QH1NVzjYZlLuwaDlG
         mlIx6AUhc58OJylCgASg1Z+3hF4WEqkRyXm9N0w6cLCU+TMUOa6oyXPdcEsoOQYEx1G6
         RUOwRqe6jnNj5JnL2E1WXTnKtXVKalYxPlCombe/jtWLxE5nkP0Xtb2+ZxW3ugRm5wLc
         2tvuxBWoJu5BXEkUKikszC97Jej0KaJLQuMev5d0Ct+JMfDZ0/n1neQc711Iu3JQvvyv
         Tbk0/xQu2FN7SBkTz5IHyB4bqhLlSaJQqz/a3n0gtJeLj0KUQYUQ9TgAgANYqZTCDY5Y
         sswQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo4rB7gNBdD8Qpwd5IxOJBW0Sq24F2CM2TIPtLMr3RLYVDgInfG1iJaf8taJQnMWTMEFC6M2XZaTg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDgnnQgkZa3ndIOBVM7/cQirbiG66CY4K0+W/LQi32hBHQ1goA
	XvDgyZP58ge1iHjfxshblkINsAXLQ644rxlz9h5KqWbONTA+rhXMUcb+2F0XlBg=
X-Gm-Gg: ASbGncsIMBYV5uFkyVZfhgjVC8PJsEGVhxmKfANDGd9KgsL5sQ/2vt/9ioiSuLIKM8L
	oeJua32pZTxlx4qcSv8bfjbHl0rOR/U2f39jA8CBL/OwlESdonBKfRbZcSl17Lbl/+cbyHg7wKG
	6Je30M9uzDIp82TszzOc7MTkhzKYQOQ+UfZI+gOUTHKdbVRrN3LRANXeHbmr4jedIF5eoelA8JQ
	2aya9xVjuotW0kdu+V60sOnoA3AN3I2TNpvElzdTHKh/Z5c9wyBWNYniK3irb2EgAqlFw7dB2dZ
	Syiie0mCrlVm1EcXLE49Mxh3fA==
X-Google-Smtp-Source: AGHT+IGINvGpJzn64Kfsohnx1u41JJIedkrrVteE4lN2N9xZ71a1PVuwf8OXY2Sb18rqr7tEG4PXQQ==
X-Received: by 2002:a05:600c:1c06:b0:439:6a40:4860 with SMTP id 5b1f17b1804b1-4396a404d25mr24828685e9.28.1739547766749;
        Fri, 14 Feb 2025 07:42:46 -0800 (PST)
Message-ID: <850c2854-17ee-42d7-856a-44604f755941@citrix.com>
Date: Fri, 14 Feb 2025 15:42:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] tools/ocaml: Fix oxenstored build warning
To: Andrii Sultanov <andrii.sultanov@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Christian Lindig <christian.lindig@cloud.com>
References: <cover.1739546412.git.andrii.sultanov@cloud.com>
 <0545259ba8f7c54b6fd6c82b185bdee475694747.1739546412.git.andrii.sultanov@cloud.com>
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
In-Reply-To: <0545259ba8f7c54b6fd6c82b185bdee475694747.1739546412.git.andrii.sultanov@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2025 3:24 pm, Andrii Sultanov wrote:
> OCaml, in preparation for a renaming of the error string associated with
> conversion failure in 'int_of_string' functions, started to issue this
> warning:
> ```
> File "process.ml", line 440, characters 13-28:
> 440 |   | (Failure "int_of_string")    -> reply_error "EINVAL"
>                    ^^^^^^^^^^^^^^^
> Warning 52 [fragile-literal-pattern]: Code should not depend on the actual values of
> this constructor's arguments. They are only for information
> and may change in future versions. (See manual section 11.5)
> ```
>
> Deal with this at the source, and instead create our own stable
> ConversionFailure exception that's raised on the None case in
> 'int_of_string_opt'.
>
> 'c_int_of_string' is safe and does not raise such exceptions.
>
> Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
> Acked-by: Christian Lindig <christian.lindig@cloud.com>
> ---
> Changes since v1:
> * Revert logging added to error handling in process.ml, return just "EINVAL"

Thanks.  This looks better.  One quick question.

> ---
>  tools/ocaml/xenstored/Makefile     |  1 +
>  tools/ocaml/xenstored/perms.ml     |  2 +-
>  tools/ocaml/xenstored/poll.ml      |  2 +-
>  tools/ocaml/xenstored/process.ml   | 18 +++++++++---------
>  tools/ocaml/xenstored/utils.ml     | 10 ++++++++--
>  tools/ocaml/xenstored/xenstored.ml | 16 ++++++++--------
>  6 files changed, 28 insertions(+), 21 deletions(-)
>
> diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
> index 5e8210a906..c333394a34 100644
> --- a/tools/ocaml/xenstored/Makefile
> +++ b/tools/ocaml/xenstored/Makefile
> @@ -54,6 +54,7 @@ OBJS = paths \
>  	history \
>  	parse_arg \
>  	process \
> +	poll \
>  	xenstored
>  

What's this hunk for?  There's a change in poll.ml, but I don't see why
it would need to change this list.

~Andrew

