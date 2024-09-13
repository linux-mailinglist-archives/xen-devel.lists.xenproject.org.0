Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C79977910
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 09:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797993.1208114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0KC-0002bq-Oe; Fri, 13 Sep 2024 07:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797993.1208114; Fri, 13 Sep 2024 07:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0KC-0002a4-Lr; Fri, 13 Sep 2024 07:02:36 +0000
Received: by outflank-mailman (input) for mailman id 797993;
 Fri, 13 Sep 2024 07:02:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sp0KB-0002Zy-TI
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 07:02:35 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 267a6993-719e-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 09:02:34 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42cb806623eso15982915e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 00:02:34 -0700 (PDT)
Received: from ?IPV6:2003:ca:b721:c843:dc22:72c7:d9fc:4a1f?
 (p200300cab721c843dc2272c7d9fc4a1f.dip0.t-ipconnect.de.
 [2003:ca:b721:c843:dc22:72c7:d9fc:4a1f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de3f0sm15868824f8f.113.2024.09.13.00.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 00:02:32 -0700 (PDT)
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
X-Inumbo-ID: 267a6993-719e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726210953; x=1726815753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgbAHSQUp8LuUJjgkBSjH2mlBGtOVPaxg9w1pab7ikI=;
        b=aCuIQwWM4qRB7sUE9N77T2Z8t5siCD3WgnlETPjHJ+v42HjCvNdBQ82+AuHkz0J+A/
         AzLeZtz6gj23tS8h6yiyxiJQ7zkjY2O9LOXrBD18IbPOqtUZ/0CwzoTfPwv/bGdbbXEG
         uCb43+Ru8Ye9tluyYsYt+TGrGcNBMzsAz/jLyaZ4WfuY4sJWLCaXJfaHM/zL644fWJgq
         tHnTowZRn3ikvc9sIjI455eECrgYu468HzfI159OKKfO02V0mEMxnALOd7JwJIXXZ0Vu
         +UnZ5yBESratJkwcHBnZQn2aebV2JihAijjK2Uk2nGDgSFrSmcaLtO89zYguyQjW1Fuv
         5Y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726210953; x=1726815753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JgbAHSQUp8LuUJjgkBSjH2mlBGtOVPaxg9w1pab7ikI=;
        b=LGUcTTpZmK/a9gLwyoZjaUJxPPeoAYBFSa1xUHTI+vQ9sv7rXaWxuBesfDvj48G6CY
         HvG/6Pl0nw6/zsPmX3Q+bsTwZeDEefmD+ct1bLp2CLItM1yAYjPeHTyNuSOMIoZ7tVRP
         EdnIt99bKiH/oTxYExzX4sWOOETc0kTHX/DmJmYfe3aE1n//pn3C/AuDLysNF7uAHqrr
         khJKfnfdA6cgjdiYhXFfoZeuWLL564A39IdfUadR/UiuK25tJersPbwFDPkyTeG1oCtt
         d9ApmDIOyCDYF27r4zSHhKRXNyPVkconlOmc96dOg7ShAi/Sa2JrCCmnELXUd0SsWoet
         99qA==
X-Forwarded-Encrypted: i=1; AJvYcCWe0MHfULgSYKGSKlSnwtz2SLhd78RqCWoDptW7R9EpCEJMubE4bIgL9w/gcwV0s5j1dFhfLFLVrHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJhCUr3JLs5pn79xHRjZaEF0U88EOYSB1n6upq6E9mwYvhcTmE
	0Nj29Teoi87oZt2FXO1tuzaLDPNLq27uISRKPc2vcH7jQ+kRy7j/1Zjt9MoPFQ==
X-Google-Smtp-Source: AGHT+IGmTzS6O+/aRZhumksuiEWRE3+arXD9woZ/uD5CG1wrQjdFqJw7H9IHktOCJ1hcd6bHitsWPQ==
X-Received: by 2002:a05:6000:1042:b0:374:ca4f:bd78 with SMTP id ffacd0b85a97d-378c2cfeb64mr3185531f8f.10.1726210952970;
        Fri, 13 Sep 2024 00:02:32 -0700 (PDT)
Message-ID: <09d720e0-3807-484f-ab4d-228bd08779e5@suse.com>
Date: Fri, 13 Sep 2024 09:02:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Fix two problems in the microcode parsers
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <06edbbb7831620bc04c6453b95aad80eaebb20a1.1726162000.git.demi@invisiblethingslab.com>
 <a7dcfa4c8d4ca16fc734d729b34dbd693ec56f45.1726174797.git.demi@invisiblethingslab.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a7dcfa4c8d4ca16fc734d729b34dbd693ec56f45.1726174797.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2024 23:11, Demi Marie Obenour wrote:
> The microcode might come from a questionable source, so it is necessary
> for the parsers to treat it as untrusted.  The CPU will validate the
> microcode before applying it, so loading microcode from unofficial
> sources is actually a legitimate thing to do in some cases.

Okay, this explains the background. But nothing is said about what's
actually wrong with the code that's being changed.

As to the subject: Please have it have a proper prefix.

> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -338,8 +338,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>          if ( size < sizeof(*et) ||
>               (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
>               size - sizeof(*et) < et->len ||
> -             et->len % sizeof(et->eq[0]) ||
> -             et->eq[(et->len / sizeof(et->eq[0])) - 1].installed_cpu )
> +             et->len % sizeof(et->eq[0]) )
>          {
>              printk(XENLOG_ERR "microcode: Bad equivalent cpu table\n");
>              error = -EINVAL;
> @@ -365,7 +364,8 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>              if ( size < sizeof(*mc) ||
>                   (mc = buf)->type != UCODE_UCODE_TYPE ||
>                   size - sizeof(*mc) < mc->len ||
> -                 mc->len < sizeof(struct microcode_patch) )
> +                 mc->len < sizeof(struct microcode_patch) ||
> +                 mc->len % 4 != 0 )

What's this literal 4? Wants to be some alignof(), sizeof(), or alike
imo.

> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -149,8 +149,8 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
>  {
>      const struct extended_sigtable *ext;
>      const uint32_t *ptr;
> -    unsigned int total_size = get_totalsize(patch);
> -    unsigned int data_size = get_datasize(patch);
> +    uint32_t total_size = get_totalsize(patch);
> +    uint32_t data_size = get_datasize(patch);

I see no reason for moving in the wrong direction here, as far as
./CODING_STYLE goes. If this is truly needed,it needs justifying in
the description.

> @@ -159,7 +159,8 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
>       * must fit within it.
>       */
>      if ( (total_size & 1023) ||
> -         data_size > (total_size - MC_HEADER_SIZE) )
> +         data_size > (total_size - MC_HEADER_SIZE) ||
> +         (data_size % 4) != 0 )

See above as to the use of literal numbers.

Jan

