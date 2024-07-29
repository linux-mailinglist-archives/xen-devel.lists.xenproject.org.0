Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7361A93F5D9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 14:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766706.1177213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYPnL-00083X-AO; Mon, 29 Jul 2024 12:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766706.1177213; Mon, 29 Jul 2024 12:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYPnL-000823-7l; Mon, 29 Jul 2024 12:48:07 +0000
Received: by outflank-mailman (input) for mailman id 766706;
 Mon, 29 Jul 2024 12:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfTU=O5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYPnJ-00081t-GE
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 12:48:05 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb15602c-4da8-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 14:48:03 +0200 (CEST)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5d5cbad01c5so1737245eaf.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 05:48:03 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d7445a75sm519752785a.110.2024.07.29.05.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 05:48:01 -0700 (PDT)
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
X-Inumbo-ID: cb15602c-4da8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722257282; x=1722862082; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2wY/Q2VXNQ5jHRqEuqMqd//zjVUD+j62ZPd7anCoeos=;
        b=CsUy+/Ck+Lq9xp99f6nudkD+Y2WTd/grtqJuAUjbeAYYsoWQbxxoWnzHdxDXXwczba
         wJ3ikn0ZNeCCbYAZcKCmatE+blcqSf+YCa9uzzhqH1f4PuI1/4jphwmQWtPXy0yoGjsd
         9M4ar34dRCF6voIGUw4DoZFjSdB1ujhxJHpC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722257282; x=1722862082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wY/Q2VXNQ5jHRqEuqMqd//zjVUD+j62ZPd7anCoeos=;
        b=UcB/F2jSxPcEnlOLJwmdK9SLqF/tCzXK44YVoLKvC5brY4reXCdPfj+XPSIieRjkfj
         crL82DGuXYapD3LckCDlfEk6qj/YO9Rlh1PkXCg3guFQmr0Owh21cmuBt2qPy1gvspHt
         tHIwiMkh71E5IfmvjZrwosLMCX/RvFqgQTxGq5nj0O41wOoMSXbN4y+f+PQr3pVMDi31
         fb6EYNfDiuGdVVGbzDXApYiX0ttIn8Jg1kWrz4tg9v1BbViO7kHvBa4giW6XWnj+2eh0
         R1+xTjFLXMKewysuL+V20l1mEYa3W60PLE7jr9t0X6dhYO9joaKHdFwRpBnuR5b1QKXP
         9Gtg==
X-Forwarded-Encrypted: i=1; AJvYcCXlRe92SPGD+iWBxJf3efPRdf2QYfETyqdksc6OXfAS7PRfl8XXuMFiGN1tQsNBa/4rHNNu2tvhprSUasX1VpyBkAfXaxWl7Fg3AXWXBN0=
X-Gm-Message-State: AOJu0Yx3f45O38uRt++fF5iDgLUocBPSAi77DiBXy1qWkqD698Jz3/Xs
	SEHvCj92OTWD+5hRfVj6UHpMpsD0/yKsEk34j7WQNYJYtzBZlKcky4tOjIq4bWk=
X-Google-Smtp-Source: AGHT+IFx0KLoJyYpaptlfPexjSSzv9eSCv1tOb6xuezXnAMXCdd4ZnYVAyX1cOZijFelJvQ8YHr4EQ==
X-Received: by 2002:a05:6358:720e:b0:1ad:282:ab1f with SMTP id e5c5f4694b2df-1adc06602d1mr1045147555d.7.1722257282109;
        Mon, 29 Jul 2024 05:48:02 -0700 (PDT)
Date: Mon, 29 Jul 2024 14:47:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/altcall: further refine clang workaround
Message-ID: <ZqePfxLIrTjqdxWp@macbook>
References: <20240729103050.38401-1-roger.pau@citrix.com>
 <5f31e485-f103-4fe8-bcd5-7e5d1312e449@suse.com>
 <ZqeESDfcw85yJv2e@macbook>
 <2a6efb82-bde4-490b-9c72-413009e756bd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a6efb82-bde4-490b-9c72-413009e756bd@suse.com>

On Mon, Jul 29, 2024 at 02:41:23PM +0200, Jan Beulich wrote:
> On 29.07.2024 14:00, Roger Pau Monné wrote:
> > On Mon, Jul 29, 2024 at 12:47:09PM +0200, Jan Beulich wrote:
> >> On 29.07.2024 12:30, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/include/asm/alternative.h
> >>> +++ b/xen/arch/x86/include/asm/alternative.h
> >>> @@ -183,13 +183,13 @@ extern void alternative_branches(void);
> >>>   * https://github.com/llvm/llvm-project/issues/12579
> >>>   * https://github.com/llvm/llvm-project/issues/82598
> >>>   */
> >>> -#define ALT_CALL_ARG(arg, n)                                            \
> >>> -    register union {                                                    \
> >>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> >>> -        unsigned long r;                                                \
> >>> -    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
> >>> -        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> >>> -    }
> >>> +#define ALT_CALL_ARG(arg, n)                                             \
> >>> +     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
> >>> +         unsigned long tmp = 0;                                          \
> >>> +         *(typeof(arg) *)&tmp = (arg);                                   \
> >>> +         BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                     \
> >>
> >> With this, even more so than before, I think the type of tmp would better
> >> be void * (or the BUILD_BUG_ON() be made use unsigned long, yet I consider
> >> that less desirable).
> > 
> > Won't using void * be uglier, as we then need to cast the last tmp
> > statement to unsigned long?
> 
> Only if we stick to using unsigned long for a ## n ## _. Afaics there's
> nothing wrong with making that void *, too.

Right, but then for consistency I would also like to make r{10,11}_
void *, and ALT_CALL_NO_ARG(), which might be too much.

My preference is likely to keep it at unsigned long, and adjust the
BUILD_BUG_ON(), unless you have a strong opinion to change it to void
* (and possibly the rest of the register variables).

Thanks, Roger.

