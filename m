Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2AA3C361
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 16:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893150.1302074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklpL-0006E2-EU; Wed, 19 Feb 2025 15:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893150.1302074; Wed, 19 Feb 2025 15:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklpL-0006CN-Bs; Wed, 19 Feb 2025 15:17:31 +0000
Received: by outflank-mailman (input) for mailman id 893150;
 Wed, 19 Feb 2025 15:17:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKsl=VK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tklpK-0006CH-Fp
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 15:17:30 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fc3fa09-eed4-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 16:17:25 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce2f3so4557267f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 07:17:25 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8217sm18370515f8f.90.2025.02.19.07.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 07:17:24 -0800 (PST)
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
X-Inumbo-ID: 9fc3fa09-eed4-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739978245; x=1740583045; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a2DjL1RHaZZfTDzhdv67S3OWeIG+QluMf3VbOCB2Mao=;
        b=cfFXS+cYafNDtXfzRYhF+ZP6ZPuVzyBtbKtJ/qMmkQA+QbLgWxNJmz8faORcnWlj+e
         5u9x27do0JcfwvGi6fwtTE+7i0D+bMRlemPDCvvFDQDH8HP5ERnCwIPezvs/dvXrRRZI
         AAmI9BsLKNlhm9lgfYvixe7Fh+TcotT1FjV1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739978245; x=1740583045;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2DjL1RHaZZfTDzhdv67S3OWeIG+QluMf3VbOCB2Mao=;
        b=rQxI3gxMIz54Wu2flQ3poVPJ16OZVW+4oNEqBFDk8p56K3bgM9qjXjDueiy/4+fEsD
         2xyNxKTyjBTy+mpzJkjwuhepoQlw9fMRdqcsC8pS0uBu4A70nV1mxtxHUY930EHzt0bo
         90YP1lJyyTWMB63FCt92yXBaZfRxl0lXNAQD2RO7RcFQmveBZqARfQUvpFD7HpdXjtKZ
         qFgehyaZoGjZGx0A2IcxEYqTQzEhoOWiFBBleT5dUpucZ361kZjpHrsZwexorGErFfkP
         KtWFBa1Nkl6pujbs0nPl8SSEyw6Jyk7KGiZv62wCCppZ9U7SccyAMrK8eBQ2U88h9r4B
         Xhig==
X-Forwarded-Encrypted: i=1; AJvYcCUelSBPFlyAn+paWWbZPDngDdklxsQz53TgN+s6DkDStPMNWmmetd9CCWUg6wt5bs2sseGaYFjRDHQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNLABxim1xrX67vfaa7X5pITm1Dsl8hUt4ow20EcXsh6zp5N5M
	4Ic7wAwlADFLr++EnSDF1+L6hr5JtEROAiNdKnXxynzgGm/4C8EL7IimFd3hEvw=
X-Gm-Gg: ASbGncsLJJja1wA1f55YDc6wg5vq8qLf1XoyqTO6o2gPA1OEV8tiTW1cszSpjBde+iq
	7f4iBzRtr33QuofMrbM55K6NWMSBlJfvxJCvlfKguU/RHal2CZYavyeChHKpJ0ZF82rVEjnnBk9
	/lZdJbw8Li+k/KfDDlQlJtd+b/QPVFzfS/1dd2VsL+4P0TK29ZMcYsVxbJ77fNiyKk5j+JNzA/8
	cYCIwIMvcrjfiLn5YM/GXtocV2GXb9/tPmT6CX6HNN0Jl0Hd8t/Qi1ejdGvyla0Pv69BwQ1EC9n
	sN3xGCuxbwJEKYg4l6IU6sz07xi6RBGNVSd3TgC5acZ3TG4WxLlD9NU=
X-Google-Smtp-Source: AGHT+IESWF/uZKczvzRY32mTELJfSGO5EwUTf5MQe3CUtJvDYN2fQFDLmCJtbHNN89Rdnih3SxI2kA==
X-Received: by 2002:a5d:5262:0:b0:38f:20bc:7df0 with SMTP id ffacd0b85a97d-38f33f45412mr12738867f8f.26.1739978244792;
        Wed, 19 Feb 2025 07:17:24 -0800 (PST)
Message-ID: <ec9c4937-f39f-47cb-a436-ca2250bc7679@citrix.com>
Date: Wed, 19 Feb 2025 15:17:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/list: avoid UB in list iterators
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250219141818.8789-1-jgross@suse.com>
 <20250219141818.8789-2-jgross@suse.com>
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
In-Reply-To: <20250219141818.8789-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/02/2025 2:18 pm, Juergen Gross wrote:
> The list_for_each_entry*() iterators are testing for having reached the
> end of the list in a way which relies on undefined behavior: the
> iterator (being a pointer to the struct of a list element) is advanced
> and only then tested to have reached not the next element, but the list
> head. This results in the list head being addressed via a list element
> pointer, which is undefined, in case the list elements have a higher
> alignment than the list head.
>
> Avoid that by testing for the end of the list before advancing the
> iterator. In case of having reached the end of the list, set the
> iterator to NULL and use that for stopping the loop. This has the
> additional advantage of not leaking the iterator pointing to something
> which isn't a list element past the loop.
>
> There is one case in the Xen code where the iterator is used after
> the loop: it is tested to be non-NULL to indicate the loop has run
> until reaching the end of the list. This case is modified to use the
> iterator being NULL for indicating the end of the list has been
> reached.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I agree there's an issue here, but as said before, I do not agree with
this patch.

For starters, bloat-o-meter on a random top-of-tree build says

    add/remove: 8/1 grow/shrink: 112/68 up/down: 4314/-2855 (1459)

which is a horrible overhead for a case where the sequence of
instructions are correct (only the C level types are a problem) and ...

> ---
> No proper Fixes: tag, as this bug predates Xen's git and mercurial
> history.
> V2:
> - fix one use case (Jan Beulich)
> - let list_is_first() return bool, rename parameter (Jan Beulich)
> - paranthesize iterator when used as non-NULL test (Jan Beulich)
> - avoid dereferencing NULL in the safe iterators (Jan Beulich)
> ---
>  xen/drivers/passthrough/x86/hvm.c |   3 +-

... the need for this adjustment being discovered after-the-fact means
it's a very risky change at this juncture in the release.

~Andrew

