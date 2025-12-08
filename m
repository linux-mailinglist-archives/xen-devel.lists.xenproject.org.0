Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98724CAC960
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 10:05:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180236.1503455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXBA-0006XR-IU; Mon, 08 Dec 2025 09:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180236.1503455; Mon, 08 Dec 2025 09:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXBA-0006Vb-En; Mon, 08 Dec 2025 09:05:12 +0000
Received: by outflank-mailman (input) for mailman id 1180236;
 Mon, 08 Dec 2025 09:05:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSXB8-0006VP-P5
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 09:05:10 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff61dcfb-d414-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 10:05:09 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779a637712so31140135e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 01:05:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4793092c32asm225987085e9.6.2025.12.08.01.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 01:05:08 -0800 (PST)
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
X-Inumbo-ID: ff61dcfb-d414-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765184709; x=1765789509; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uALucioVe2pYF4HUEnoEJKNTIWQ/OMYVWzf5bmpYIn0=;
        b=TOhMnmAI8NetqVsapnjQkvRwr1bFssBR7pe2xjE3eCdGot+mVnz+PMn4FAKSaxq2tN
         Nm4s6gymG8YO/OA+sjzoLLJ19CfXMCtRS22f/sg3bS4BFNhakTrFV3fEAGjUtBqTd1r3
         c9lF8pM865aPW42qucotCGHs8hglE06EnJSlzKjFiAiX6UjUfkrRFD011WHwgdu/Aeqb
         JEIWG4U5ovcReLDFvfmJiKoQ0dtDtVKFpfTxClXkevDPTMnCajLCXqqXMfwyrIOjVz/6
         iS0xitpvMaAGGdtyfyekOxYzm1DhBQaOaDtN2YvaGu6XNiSaka3JagT2M14NbPtonD5p
         X7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765184709; x=1765789509;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uALucioVe2pYF4HUEnoEJKNTIWQ/OMYVWzf5bmpYIn0=;
        b=G197+lHYi4WIVwNVfWcNOKmvH+6f1bkeztnggIb+pAl5WLlGNQbdMHAu+6kqeCwjPA
         Uwm9gWJ+GU+ZBe8HQiK3I0TMtGJvAI4MEAZmYH+iVG4m3LYbC2UVqh5FA2EXRP85jyZA
         K/9qLfgA4bpHA4sH69h5dB+sGvOXjF7weGwyYm7ZqOi8g2HvHMHCrkgCr0EElCa/S9uC
         DUfKkm6v3gWPSc5Ce8hhA5g1Y4Dbkvxc/PfStr3DlSW5rsR8g2Vh/ZoT3zz9vNBVOdSB
         JeN4Y1/1dpQf1erkBPphNQP7WgWM2abzjjDu6mW28vv0MeRqz4Yczw5At/gsyEmd5kEG
         agiw==
X-Forwarded-Encrypted: i=1; AJvYcCX6VbWwfHgDu9PxtsNKqmXNcALuOMxqMyAjVTgtwxhiwd7SOd4fRf7fyTM01pRaN3K7uQlHIIn0YEA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6BbEg1tkNkaOZQ7r2F2T/qiXUBvKZo3vYxLl7qZauWLvAAoOQ
	Ko8Ix3CK01GoPKjbQB+aP0p0923CnUOugqEgGWxTvY8L9CIIPSq4djsqTSUd3n0TSg==
X-Gm-Gg: ASbGncu1ELyWj+xpvQH/fkEvhzCsjtXH6IQJDii1f/3W5Ufzz9zm+2Rw7W2bw0SPDPb
	lV2rBSw6Cv4yri4qDpwOkR0DiIAsh453LKGCQWzzVpdMUD+UPKnSCVuNp2jXateFjJq0Y84qoXr
	vO+UGwRxQFb9oB14hJZbaVh8vPE3QVDxtr38rUQ3huyXlnMImuiBX9rAAGmnyLpJt/PnbsMvpdw
	7qnvG8Uaiv8ClIKn7atS/DMYkI+TgiU1OZSpaLdEF78TYIgSk7rhhQPgVOay5RZnhurkw6d7sZU
	ofkQ3Jgmhb6MAlc9bTEoRxM2egMTrmZjirY1fAvrcN3BdcnxWNfnmzNACEGW9qtjXXJ4Fsk8gFm
	ej8thaf8CUNRcN31S6u1iqHcHn9V7wot2/lxPGH9XtVLg0Gyb6TbLDnnITBXyphpS4XmVujPohF
	yOrhm6ksFz88yphELBunEslyE1nwSNsljQAkBnfTEvFfofV6CA3QNvgJouJEAhi8z06ruZPPDNP
	Uk=
X-Google-Smtp-Source: AGHT+IGFTu6CUh2piz511A90vVDTdIxlOm/BS10JgH1LM7pt5oo+/u9mTWdCvyrkKzS3FVwToqV05g==
X-Received: by 2002:a05:600c:c4ac:b0:471:9da:5252 with SMTP id 5b1f17b1804b1-47939e3992cmr63056115e9.29.1765184709272;
        Mon, 08 Dec 2025 01:05:09 -0800 (PST)
Message-ID: <373f19eb-39fc-4a76-95fe-4acb95ba71d8@suse.com>
Date: Mon, 8 Dec 2025 10:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/svm: Make vmcb_struct private to svm/
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
 <20251128201937.1294742-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20251128201937.1294742-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.11.2025 21:19, Andrew Cooper wrote:
> The rest of Xen has no buisness knowing this structure, and it is currently
> included via xen/sched.h into most code.  Create a new private svm/vmcb.h.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/asid.c             |   1 +
>  xen/arch/x86/hvm/svm/emulate.c          |   1 +
>  xen/arch/x86/hvm/svm/intr.c             |   1 +
>  xen/arch/x86/hvm/svm/nestedsvm.c        |   1 +
>  xen/arch/x86/hvm/svm/svm.c              |   1 +
>  xen/arch/x86/hvm/svm/svmdebug.c         |   2 +
>  xen/arch/x86/hvm/svm/vmcb.c             |   2 +
>  xen/arch/x86/hvm/svm/vmcb.h             | 617 ++++++++++++++++++++++++
>  xen/arch/x86/include/asm/hvm/svm/vmcb.h | 606 -----------------------
>  9 files changed, 626 insertions(+), 606 deletions(-)
>  create mode 100644 xen/arch/x86/hvm/svm/vmcb.h

I was actually hoping for the file to be moved. I notice that a few things are
left in the original file, and I wonder if they couldn't be moved elsewhere up
front. Yet I wouldn't insist; we can certainly do it this way round, accepting
that the file name then is pretty much wrong considering what remains there.

> --- a/xen/arch/x86/hvm/svm/asid.c
> +++ b/xen/arch/x86/hvm/svm/asid.c
> @@ -9,6 +9,7 @@
>  #include <asm/hvm/svm/svm.h>
>  
>  #include "svm.h"
> +#include "vmcb.h"

Instead of repeating this in every .c file, couldn't svm.h include the new file?
Or are you foreseeing some of the .c files requiring svm.h to (later) not need
this include anymore?

Jan

