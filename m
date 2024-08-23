Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6435E95C806
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 10:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782203.1191687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shPbr-0003Y4-Pn; Fri, 23 Aug 2024 08:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782203.1191687; Fri, 23 Aug 2024 08:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shPbr-0003WK-N5; Fri, 23 Aug 2024 08:25:27 +0000
Received: by outflank-mailman (input) for mailman id 782203;
 Fri, 23 Aug 2024 08:25:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shPbq-0003SX-9A
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 08:25:26 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3efb4d17-6129-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 10:25:25 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7a1da7cafccso98683285a.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 01:25:25 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f3bb329sm153564185a.78.2024.08.23.01.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 01:25:23 -0700 (PDT)
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
X-Inumbo-ID: 3efb4d17-6129-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724401524; x=1725006324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q/p5UbZumGq1JrXX8ufF1SopGMx3J1faHSWKhX5WLoQ=;
        b=odIZ8TBXcoZplr8hLsmtrXLKNCqPVXzBB49Pznq4TH9w0G3VWVgK1aHD89npIHfzAi
         5kc83aZkutwZRbHvSaTOXcpUfdzUakk0A5/KRCHICojVKXzkmGRYpP/CrhOUUg0Oclom
         gNaWgZVuYsAeeg2zkTu9LUeqeqPpmy8KyW/s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724401524; x=1725006324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/p5UbZumGq1JrXX8ufF1SopGMx3J1faHSWKhX5WLoQ=;
        b=pCA7HXWTOW/RNY5nWSgo6FWenc6yL2lsvXwZCG6VoiXv1OUvw6DUzhepvO0sECFy+d
         2MYi3eu2LnYE912aEwtoUAA0cnl002J+1SLdplZVmlGncMhpeYw5gDSIchf9Z2XZm2db
         NMrsmhfwKf3yvgE4JHB+awcG4pBcIeJUC+UtK1znY6n0daTGwBMqBy5+A0xTszGxGlf6
         Rre9+4GO+qQ88w3vzj+F0EgNm8CEEKgABNBxNhqwKHVLCiiXrPD+k+sfth3Qf5GzX80/
         uq68sGyz1zFOrley63FMQZvw0SdCnJ9fDh/bGos3Kd9MjAjaldGm8OjMVH/ZoasRxlCY
         91/g==
X-Forwarded-Encrypted: i=1; AJvYcCWUOFMpP/rZZiFnlV1uGpH40JW9DagWfMPZrJCVlD8uiXIVbgyEWMX22A0xG0R3kuoIlkPOIEP5NF8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1Uph8LgNE1jb9FObb8ouDTDdbFLPQ1C0pvNJFqdeR0RajS+Q3
	lZm3EL7wez5V+a4vFlo7EdmIOEMBU0DQ34LmqAC+6O0n4tJqZi4ptVklNH1QLDE=
X-Google-Smtp-Source: AGHT+IFioTQgmgdZRFJiz3WPx86yO2T9XVwcXz2LivYSqjm6/F3tu/PCEASkDVnskCxy+SDb1BeRhg==
X-Received: by 2002:a05:620a:3181:b0:7a1:e20c:186e with SMTP id af79cd13be357-7a689700b1emr161906285a.15.1724401524142;
        Fri, 23 Aug 2024 01:25:24 -0700 (PDT)
Message-ID: <668800f2-409a-43fb-9bdc-23ce693cedcd@citrix.com>
Date: Fri, 23 Aug 2024 09:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: drop and avoid use of BUG()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <d14e4ffc-d07b-4a60-8949-ecdcea86cd77@suse.com>
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
In-Reply-To: <d14e4ffc-d07b-4a60-8949-ecdcea86cd77@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/08/2024 8:16 am, Jan Beulich wrote:
> Generally it is not a good idea to use BUG() in emulator code. Even for
> internal flaws we're better off returning errors to callers, rather than
> crashing the system. Replace the sole remaining use and remove the
> test / fuzzing harness surrogate. Put in place a declaration pleasing
> the compiler when finding uses in Xen headers, while at the same time
> breaking the build (at linking time) in case an active reference would
> newly appear.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

