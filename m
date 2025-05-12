Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5BFAB47E4
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 01:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982237.1368782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEcZ0-0005VS-Uw; Mon, 12 May 2025 23:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982237.1368782; Mon, 12 May 2025 23:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEcZ0-0005TR-Rp; Mon, 12 May 2025 23:28:02 +0000
Received: by outflank-mailman (input) for mailman id 982237;
 Mon, 12 May 2025 23:28:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vKQa=X4=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1uEcYz-0005TL-SX
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 23:28:01 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdc12f4e-2f88-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 01:28:00 +0200 (CEST)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-6ff4faf858cso34681947b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 16:27:59 -0700 (PDT)
Received: from [10.138.7.94] ([45.134.140.51])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-70a3d895d7bsm21737407b3.7.2025.05.12.16.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 16:27:58 -0700 (PDT)
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
X-Inumbo-ID: bdc12f4e-2f88-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747092479; x=1747697279; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WK+Ch9yZX8O9anWQ/8+vUlB5aBAmSTwuvmPKn85OuMs=;
        b=Kgyvl4mSc/lVLMFB7ieBUfezoFil2zrdtCxrjwHmL9KMmysKM7SGOo8/XpqAMDCjIH
         Q2SwwH+gVA2DoG7EEuiYsJ8Dqis+fwm1X8hS5gEgbdFbCN96iv98vI+ASyzIJ90z9F9A
         X5JYi1JtSZbmfFeTmwK2qd1escwcakPlWhpqHiEClUl+QGRUdt4LzRdzDC1jTaSivAkW
         rRb8JOqv46SccMtuIomS2zz62ZssKLtAVddsN6QGTgQVQ0rbANdznrKcZV/nIrxdrNS8
         wiIeY3WCgnHV88/51tQMjtVKuoY6mSVQYSjRIyRXWoxbhGmqhO6kpcM8Mz9Au/GWap92
         HYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747092479; x=1747697279;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WK+Ch9yZX8O9anWQ/8+vUlB5aBAmSTwuvmPKn85OuMs=;
        b=dCRvh5GVMbM0tajQ85DR0PE02vwBz2wRzXvoKodjcwFnlq4FTeDz0wZu7855SpMewH
         ojBHL+4YeUajJO1VLeHEEmCdbRwRWWH4zVgm0nOqmOAo4b/DjocJQP3DH51tARcDYZIZ
         B5exIzKBF9CxVZvDWHSeo+YN+6RvLY6z77ycbsJEzBiSEUWIRS16xVoHzKsKrNtfyqVj
         IzwGdA7Qt6e54gEhPzsJ7H1UWZrrH5GsLQO+QKLTIRE6NmPV2//Gd4mWJfg+7Xpxgs6x
         ySdfAW5/YQWN8verGeJzsa/+pydbOCyGa8kfNGOQ9kew7QRv0pepeQBUI5w0kAr4IrKy
         TWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTuPQ/Y+cXu/F2CFdTa5CUXr/GK2W1lMOgAprWF17402zDKJofnUvF22jS4MVC3x+A05b/X/3IljA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUS1y33dA7/227UEKTK4PBULe6CrhqYkNmWAsjH3MJfiIG35v4
	Vwg5KH2CTS6Yiwvo2eFG9orqD9ryUNrabJWpsRTYphn35p8yLctT
X-Gm-Gg: ASbGncvzPApYKgEKbJsYRT52fOcSr439r2Q13qQHY0vcfbtem64WrU3BDRzP6/fF/S8
	WBm20lnlsibsAojw8BLdF3XTBCOSvFapBM3yLo8TFvYyIxzeXWlDyx81nBcz9KD9797q7dk0LCE
	kIEcWmT+/i7IV6VBF/tsUZRjO3kUgd/FVYu8PustAVSqKjkLL0+NacX+m/1f2/9V2LSffAVBiKp
	y/1ZyiG7OPBY9QfTogg/kMnTCZNX1jKmT+zbB+dviw9ZNlcfDVKMqZUZBJNTB9cX4GU7/SFTe6k
	zf4nZ3xb6+CTXRrGdthkS/rq7hhFN+lsUjKWyZnAiT1taQrCx4ZUa2Y=
X-Google-Smtp-Source: AGHT+IE5qx4TlHX7eBDRUyQ5bsaJUy/dapKIzUrZjvp0OZNRWSOJLE5SZUbDisgv3XayxX/3zKOGLg==
X-Received: by 2002:a05:690c:2506:b0:6f9:8605:ec98 with SMTP id 00721157ae682-70a3fb0dde7mr189342887b3.28.1747092478756;
        Mon, 12 May 2025 16:27:58 -0700 (PDT)
Message-ID: <c1e0e37a-7af7-4d88-a9b7-34faa2644e4c@gmail.com>
Date: Mon, 12 May 2025 19:28:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/Kconfig: Improve help test for speculative options
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250508160336.2232152-1-andrew.cooper3@citrix.com>
 <18f73078-c512-416b-9406-c76f8db178eb@suse.com>
 <63652356-4b82-401f-a6ba-8eb53b2f8317@citrix.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49yB+l2nipd
 aq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYfbWpr/si88QKgyGSV
 Z7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/UorR+FaSuVwT7rqzGrTlscnT
 DlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7MMPCJwI8JpPlBedRpe9tfVyfu3euTPLPx
 wcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9Hzx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR
 6h3nBc3eyuZ+q62HS1pJ5EvUT1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl
 5FMWo8TCniHynNXsBtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2
 Bkg1b//r6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
 9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nSm9BBff0N
 m0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQABzTxEZW1pIE1hcmll
 IE9iZW5vdXIgKGxvdmVyIG9mIGNvZGluZykgPGRlbWlvYmVub3VyQGdtYWlsLmNvbT7CwXgE
 EwECACIFAlp+A0oCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJELKItV//nCLBhr8Q
 AK/xrb4wyi71xII2hkFBpT59ObLN+32FQT7R3lbZRjVFjc6yMUjOb1H/hJVxx+yo5gsSj5LS
 9AwggioUSrcUKldfA/PKKai2mzTlUDxTcF3vKx6iMXKA6AqwAw4B57ZEJoMM6egm57TV19kz
 PMc879NV2nc6+elaKl+/kbVeD3qvBuEwsTe2Do3HAAdrfUG/j9erwIk6gha/Hp9yZlCnPTX+
 VK+xifQqt8RtMqS5R/S8z0msJMI/ajNU03kFjOpqrYziv6OZLJ5cuKb3bZU5aoaRQRDzkFIR
 6aqtFLTohTo20QywXwRa39uFaOT/0YMpNyel0kdOszFOykTEGI2u+kja35g9TkH90kkBTG+a
 EWttIht0Hy6YFmwjcAxisSakBuHnHuMSOiyRQLu43ej2+mDWgItLZ48Mu0C3IG1seeQDjEYP
 tqvyZ6bGkf2Vj+L6wLoLLIhRZxQOedqArIk/Sb2SzQYuxN44IDRt+3ZcDqsPppoKcxSyd1Ny
 2tpvjYJXlfKmOYLhTWs8nwlAlSHX/c/jz/ywwf7eSvGknToo1Y0VpRtoxMaKW1nvH0OeCSVJ
 itfRP7YbiRVc2aNqWPCSgtqHAuVraBRbAFLKh9d2rKFB3BmynTUpc1BQLJP8+D5oNyb8Ts4x
 Xd3iV/uD8JLGJfYZIR7oGWFLP4uZ3tkneDfYzsFNBFp+A0oBEAC9ynZI9LU+uJkMeEJeJyQ/
 8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd8xD57ue0eB47bcJv
 VqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPpI4gfUbVEIEQuqdqQyO4GAe+M
 kD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalql1/iSyv1WYeC1OAs+2BLOAT2NEggSiVO
 txEfgewsQtCWi8H1SoirakIfo45Hz0tk/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJ
 riwoaRIS8N2C8/nEM53jb1sH0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcN
 fRAIUrNlatj9TxwivQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6
 dCxN0GNAORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
 rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog2LNtcyCj
 kTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZAgrrnNz0iZG2DVx46
 x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJELKItV//nCLBwNIP/AiIHE8b
 oIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwjjVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGj
 gn0TPtsGzelyQHipaUzEyrsceUGWYoKXYyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8fr
 RHnJdBcjf112PzQSdKC6kqU0Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2
 E0rW4tBtDAn2HkT9uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHM
 OBvy3EhzfAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
 Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVssZ/rYZ9+5
 1yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aWemLLszcYz/u3XnbO
 vUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPthZlDnTnOT+C+OTsh8+m5tos8
 HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <63652356-4b82-401f-a6ba-8eb53b2f8317@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/12/25 10:58 AM, Andrew Cooper wrote:
> On 12/05/2025 11:58 am, Jan Beulich wrote:
>> On 08.05.2025 18:03, Andrew Cooper wrote:
>>> The text for CONFIG_INDIRECT_THUNK isn't really correct, and was already stale
>>> by the time speculative vulnerabilities hit the headlines in 2018.  It is
>>> specifically an out-of-line-ing mechansim, and repoline is one of several
>>> safety sequences used.

Nit: retpoline, not repoline.

>>> Some of this boilerplate has been copied into all other options, and isn't
>>> interesting for the target audience given that they're all in a "Speculative
>>> Hardning" menu.
>>>
>>> Reword it to be more concise.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>
>>> CONFIG_SPECULATIVE_HARDEN_BRANCH really ought to be named
>>> CONFIG_SPECULATIVE_HARDEN_CONDITIONAL, but this would be a (minor) functional
>>> change.
>> Hmm, so you're suggesting all the straight-line speculation changes then ought
>> to be conditional upon a separate, new Kconfig control? So far I've keyed them
>> all to this one.
> 
> Straight line speculation is complicated in multiple ways, and our
> understanding has evolved over time.
> 
> I'd forgotten that we grouped it with HARDEN_BRANCH, and it is not an
> ideal grouping.  What we have in the way of SLS protections are token at
> best.
> 
> First, in light of Branch Type Confusion on Fam17h processors, where any
> instruction can manifest as a speculative branch, there's nothing that
> can be done.  (This was demonstrated rather more thoroughly with SRSO
> than BTC.)
> 
> There is straight line decode (at least) through any branch the
> predictor doesn't know about.  Only "taken branches" get tracked, but
> also you get a higher rate of SLS immediately after leaving userspace
> for a long time (such that the branch predictor fully lost supervisor
> state).  Again, this is inherent and we cannot control it.
> 
> Intel say that a branch type mismatch (for a direct branch) will halt at
> decode.  Indirect branches are documented to potentially suffer SLS. 
> AMD Fam19h say that any branch type mismatch will halt at decode.  Also,
> with AMD IBRS, indirect branches stall dispatch until they execute.

What about Intel IBRS with an INT3 after the branch?

> Therefore, it's indirect branches which are of most concern.
> 
> Putting an INT3 after any unconditional JMP *ind is easy.  Compilers
> even support doing this.  CALL *ind on the other hand has architectural
> execution beyond it, so if protection is needed, LFENCE is the only option.

Does adding an LFENCE after every indirect call make sense?
What about RET?

As an aside, this seems like the beginning of the end for object-oriented
programming in kernels and other software that needs to be concerned with
speculative execution security vulnerabilities.  If every indirect jump
completely stalls the pipeline, it’s almost certainly much faster to use
switch/case or (if the language has it) pattern-matching.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)

