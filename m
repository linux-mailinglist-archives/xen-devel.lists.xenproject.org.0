Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D493F4BA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 14:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766680.1177192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYP31-0008Dm-R4; Mon, 29 Jul 2024 12:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766680.1177192; Mon, 29 Jul 2024 12:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYP31-0008BQ-O1; Mon, 29 Jul 2024 12:00:15 +0000
Received: by outflank-mailman (input) for mailman id 766680;
 Mon, 29 Jul 2024 12:00:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfTU=O5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYP30-0008AI-K3
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 12:00:14 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b945fd1-4da2-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 14:00:11 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4281c164408so8233245e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 05:00:11 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4281c79ea02sm41849815e9.46.2024.07.29.05.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 05:00:10 -0700 (PDT)
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
X-Inumbo-ID: 1b945fd1-4da2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722254411; x=1722859211; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vc8De1Wn97aOPhSXX0N+rg6wDyHwYKOiv8MIWGdQTgs=;
        b=KuLZ6ARmOf9/gfa5RQWApQt8HBX/KvCoUe6aCKSA/vXURKd6UD62dHqU4IWxC2xU4X
         BultCCEGTwFibRbTa033vUzLNvx6EnrhGDW372Iq1mM+Z16KDuJIMJjgTluE/APuOuon
         zbR7Wotl+ejvmutzD22iYgVa+DlX1JwV8iQGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722254411; x=1722859211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vc8De1Wn97aOPhSXX0N+rg6wDyHwYKOiv8MIWGdQTgs=;
        b=t/StmDWganuVGMydlnhCGQZwtnhNbRfCVSi7a7Fvagecdg7Fpeobxej1IoDTqvKRk8
         et0YyxsST982TOLm0Whl5Fbu6ChydXxV6ib4Xcbv1p8EwIu8RONcDY14wqRjgTNelXEd
         vama3yK3Qz2YfDHQ3slSNJC4ra40ZbTsNSgetZk4qXtrwFqGnumYitHvjqKf1yRmmfwa
         3uBca3CWyr/jkbKOFNu8idaATj/5YGujWwk7U+duQnVpNvZAL0QGJnG+QHmJGIaBEIrq
         MsKSG1baVbrMxGIwPuBxe6td2Iwaz3ESflx2v1W8h7jucNrv4Z7VTB3bH/hO0LNPClnY
         7hBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr0fSd3a+8YBm7RxEHmY9/zCq93XmaYxlenu0cIFbF3hsVOEZYljGtiE2HCnIocMNpQRo5RCDGnbpUve+c6jG+x0prMs8lhLX3m8rPZzs=
X-Gm-Message-State: AOJu0YzkmMIwEAeDfg+5YGs0O21ar9QM0h3adSASx3XYLD4/4t2d8gC0
	fL4q3G0wGDCqJX1hQiozHTm3ikQYYOg9Aq5nQ0ojszTr6qcW6K5WXujNGoi4zBg=
X-Google-Smtp-Source: AGHT+IFV4i3/uAS5g+Kj1HE69JyXc6oqhrrqByBehsi06Lt0X1+KfdlM0teFg00B0OLwB1m9c41NDw==
X-Received: by 2002:a05:600c:3541:b0:428:f41:d467 with SMTP id 5b1f17b1804b1-42811d96e7emr49300455e9.10.1722254410486;
        Mon, 29 Jul 2024 05:00:10 -0700 (PDT)
Date: Mon, 29 Jul 2024 14:00:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/altcall: further refine clang workaround
Message-ID: <ZqeESDfcw85yJv2e@macbook>
References: <20240729103050.38401-1-roger.pau@citrix.com>
 <5f31e485-f103-4fe8-bcd5-7e5d1312e449@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f31e485-f103-4fe8-bcd5-7e5d1312e449@suse.com>

On Mon, Jul 29, 2024 at 12:47:09PM +0200, Jan Beulich wrote:
> On 29.07.2024 12:30, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/alternative.h
> > +++ b/xen/arch/x86/include/asm/alternative.h
> > @@ -183,13 +183,13 @@ extern void alternative_branches(void);
> >   * https://github.com/llvm/llvm-project/issues/12579
> >   * https://github.com/llvm/llvm-project/issues/82598
> >   */
> > -#define ALT_CALL_ARG(arg, n)                                            \
> > -    register union {                                                    \
> > -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> > -        unsigned long r;                                                \
> > -    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
> > -        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> > -    }
> > +#define ALT_CALL_ARG(arg, n)                                             \
> > +     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
> > +         unsigned long tmp = 0;                                          \
> > +         *(typeof(arg) *)&tmp = (arg);                                   \
> > +         BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                     \
> 
> With this, even more so than before, I think the type of tmp would better
> be void * (or the BUILD_BUG_ON() be made use unsigned long, yet I consider
> that less desirable).

Won't using void * be uglier, as we then need to cast the last tmp
statement to unsigned long?

> As a nit, I also don't think the backslashes need
> moving out by one position. Finally I'm afraid you're leaving stale the
> comment ahead of this construct.

Yes, thanks for noticing.  Will attempt to adjust the comment.

Roger.

