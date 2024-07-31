Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7866942863
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 09:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768264.1179039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ478-0006gi-N7; Wed, 31 Jul 2024 07:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768264.1179039; Wed, 31 Jul 2024 07:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ478-0006db-J8; Wed, 31 Jul 2024 07:51:14 +0000
Received: by outflank-mailman (input) for mailman id 768264;
 Wed, 31 Jul 2024 07:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZ477-0006aj-AT
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 07:51:13 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7483903-4f11-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 09:51:11 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7a1d81dc0beso358083685a.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 00:51:11 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d73ed3bcsm715182085a.66.2024.07.31.00.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 00:51:10 -0700 (PDT)
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
X-Inumbo-ID: a7483903-4f11-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722412270; x=1723017070; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W41FKG0eJpfBp07OcAZAH7z7XQnNYMVmuK2H2q8/PV8=;
        b=ibSRyyErIPhBgAuYIAegv4xnzZDGKEm6yv+E8Rru1xWbgbyEtXTeaGJRj6b8x7dkx7
         zrupykDQRyje0jUP3+bhiEiL+Nq1o1c2XQ0iKTPkQvwgAjBKq/uq91MujEV95vhcDUvc
         g5AuscSE/DJlax5fOvzGa48s4QtuHsMAekrOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412270; x=1723017070;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W41FKG0eJpfBp07OcAZAH7z7XQnNYMVmuK2H2q8/PV8=;
        b=eHlBxqhfX+rdFU1NJHtfyZMysM2yOqn3C9k3Qv6Ugtonfs2ZDtwdFB6oyzYvCAMmFc
         ZGxL/tteL0Ch8v4qF6QQsIh4TpZ62EntkgorBz4pX535/B2mYt4bFmRLrUvAJkIUi8cX
         J4AUsabBPMAdFd7eHcdpvHdGZ/6+/PW53HgPVUxcu4/0bdTo7C0+7aqRZ5SQosrzs51B
         US+U5qj5ZOh7W7K6lPiSQpxGAkhETNYH2U424fFQFdKDclcjJ85+Z/CiQ/p8hOMNvEwi
         lmyJ4cE/h0ehFb5Xfm0fEuRLspUMZ+C54Q+lf4eo0n+IYQlmHf5mUBPQrDUqAajuBI7c
         AvEw==
X-Forwarded-Encrypted: i=1; AJvYcCUIynWAWxrURT+D2tcHoHCYXxq087xhBZnlS92CFUNGSKdofAO+WQCdauBP9RqYVo1GdLS3bOkpdrNLVgzSEHXyJ/o1KARPtakouY9Lhq0=
X-Gm-Message-State: AOJu0YyiBPMUCj6m2om2MyiCxfgXYylHQ4+EyYSsN2Gq1y2PaI1NanDR
	WSiib7RUzjiU3SIA5gIf7KqToZ72IYhRiU2m7XBEr2keugIVBVxYMPmin1ztxL0=
X-Google-Smtp-Source: AGHT+IHpNd2Soql1f+iSAU7znMFM3w69VfT0DeUQ/M+GLLn3ifJV1tXylV9lLzltZ0T5XQfOAB5X5Q==
X-Received: by 2002:a05:620a:4093:b0:7a1:e0ed:dd1b with SMTP id af79cd13be357-7a1e524732cmr1747552085a.19.1722412270407;
        Wed, 31 Jul 2024 00:51:10 -0700 (PDT)
Date: Wed, 31 Jul 2024 09:51:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] x86/altcall: further refine clang workaround
Message-ID: <Zqns7Pf3uCikjScZ@macbook>
References: <20240730155305.49172-1-roger.pau@citrix.com>
 <8701cfdf-a44c-4bec-8190-7d38e8267a78@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8701cfdf-a44c-4bec-8190-7d38e8267a78@suse.com>

On Wed, Jul 31, 2024 at 08:26:02AM +0200, Jan Beulich wrote:
> On 30.07.2024 17:53, Roger Pau Monne wrote:
> > The current code in ALT_CALL_ARG() won't successfully workaround the clang
> > code-generation issue if the arg parameter has a size that's not a power of 2.
> > While there are no such sized parameters at the moment, improve the workaround
> > to also be effective when such sizes are used.
> > 
> > Instead of using a union with a long use an unsigned long that's first
> > initialized to 0 and afterwards set to the argument value.
> > 
> > Reported-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > Suggested-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Albeit if you don't mind ...
> 
> > --- a/xen/arch/x86/include/asm/alternative.h
> > +++ b/xen/arch/x86/include/asm/alternative.h
> > @@ -169,27 +169,25 @@ extern void alternative_branches(void);
> >  
> >  #ifdef CONFIG_CC_IS_CLANG
> >  /*
> > - * Use a union with an unsigned long in order to prevent clang from
> > - * skipping a possible truncation of the value.  By using the union any
> > - * truncation is carried before the call instruction, in turn covering
> > - * for ABI-non-compliance in that the necessary clipping / extension of
> > - * the value is supposed to be carried out in the callee.
> > + * Clang doesn't follow the psABI and doesn't truncate parameter values at the
> > + * callee.  This can lead to bad code being generated when using alternative
> > + * calls.
> >   *
> > - * Note this behavior is not mandated by the standard, and hence could
> > - * stop being a viable workaround, or worse, could cause a different set
> > - * of code-generation issues in future clang versions.
> > + * Workaround it by using a temporary intermediate variable that's zeroed
> > + * before being assigned the parameter value, as that forces clang to zero the
> > + * register at the caller.
> >   *
> >   * This has been reported upstream:
> >   * https://github.com/llvm/llvm-project/issues/12579
> >   * https://github.com/llvm/llvm-project/issues/82598
> >   */
> >  #define ALT_CALL_ARG(arg, n)                                            \
> > -    register union {                                                    \
> > -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> > -        unsigned long r;                                                \
> > -    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
> > -        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> > -    }
> > +    register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
> > +        unsigned long tmp = 0;                                          \
> > +        *(typeof(arg) *)&tmp = (arg);                                   \
> > +        BUILD_BUG_ON(sizeof(arg) > sizeof(unsigned long));              \
> 
> ... I'd like to switch around these two lines while committing.

Sure, feel free to swap them.

Thanks, Roger.

