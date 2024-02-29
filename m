Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3C886C95E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687026.1069749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffiT-0002Cy-0X; Thu, 29 Feb 2024 12:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687026.1069749; Thu, 29 Feb 2024 12:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffiS-0002A4-T3; Thu, 29 Feb 2024 12:40:48 +0000
Received: by outflank-mailman (input) for mailman id 687026;
 Thu, 29 Feb 2024 12:40:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xh/y=KG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rffiQ-0001yM-Rm
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:40:46 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c22036aa-d6ff-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 13:40:46 +0100 (CET)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-787be5d999aso50871485a.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 04:40:46 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 h12-20020a37c44c000000b00787d46d606csm622722qkm.128.2024.02.29.04.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 04:40:44 -0800 (PST)
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
X-Inumbo-ID: c22036aa-d6ff-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709210445; x=1709815245; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8O5dFQWIYfvrKnM0mHF87nY6TM28+0Hl6PaX6zmGOw=;
        b=kk/fpJs97f51bvYqqYguv4Og1m1KsCG0NtLs4IAix/nm4VxROL2aNdoqxUZOEsA+QS
         PuqB+IlACf661sPB9SchKg+4hWx3xfPzXGtgLaoD8B7Sm2j53rx6bffKPUJUA2+U4gf5
         CmwAX1Q++/XeFa5fNPSWEl61U41hya7R17Uu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709210445; x=1709815245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8O5dFQWIYfvrKnM0mHF87nY6TM28+0Hl6PaX6zmGOw=;
        b=hsLNmAsAstLK/emsh1DZ5u6tH3o7Wvsfz3nZcvFz8oU9M7JUXOczztk0MTRy1St4ng
         l6v8CfMdH7+9c7A9e1FRn1nARg9iCo/L6m7uLac4hnXc0JHZc0ro8WjpRZ2N8EZH2Ulm
         pDSua1PHzsf/W0i8cEEiWHuctiafUIMoo0uRINiN7T6ZXPVwZ2abE2K5NcS85hoEeklm
         FtHO5NF2xvmPe+PDl7aOPyoV1V/1toKfdwjeW5PImbrSwarGvKSb7OPmBAJj1IL3HnsA
         7RoFnMCFV9EjKVcR0r5Y43xVGmNppImT5xI8BOsHaxwaqArwXRUVlZDGMA4+Jcaqu+IA
         VJlg==
X-Forwarded-Encrypted: i=1; AJvYcCW6ZHXBVKSQPdNEp89A6SiBxPOlm6ivd9XpWZ1lm+o+L3b2V/dnwkBo9bc2uu+CHCkFQ4SNb39OOjErPhP64/QVOYhOqPHkbVy1czstg7o=
X-Gm-Message-State: AOJu0YwbU5J/6f3zoqH7C8vhiR7m8m+GsN5z3PdZ0D+uP6zooNrrYwS0
	PKYzr7KkHsjEOHVF7+n2v63Ik9Hk/PMdFyNgkeXtLUI9DoOAp2sEKPmsXpcMKMU=
X-Google-Smtp-Source: AGHT+IELKHvvM+bwREt9wRpL0aZI6wZFfoHOHxe2+gqO/dLkIkGock/P+FkCwoG2sHRIrHNqiDD3Qg==
X-Received: by 2002:a05:620a:16b3:b0:787:8eca:dd13 with SMTP id s19-20020a05620a16b300b007878ecadd13mr1885971qkj.69.1709210445217;
        Thu, 29 Feb 2024 04:40:45 -0800 (PST)
Date: Thu, 29 Feb 2024 13:40:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] README: bump minimum required clang/llvm version
Message-ID: <ZeB7S6i7pIwzkUNE@macbook>
References: <20240229095529.17723-1-roger.pau@citrix.com>
 <20240229095529.17723-2-roger.pau@citrix.com>
 <780ec3ab-08e3-4fd8-a85f-0e89ea75dcc8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <780ec3ab-08e3-4fd8-a85f-0e89ea75dcc8@suse.com>

On Thu, Feb 29, 2024 at 01:11:55PM +0100, Jan Beulich wrote:
> On 29.02.2024 10:55, Roger Pau Monne wrote:
> > --- a/README
> > +++ b/README
> > @@ -41,7 +41,7 @@ provided by your OS distributor:
> >          - GCC 4.1.2_20070115 or later
> >          - GNU Binutils 2.16.91.0.5 or later
> >          or
> > -        - Clang/LLVM 3.5 or later
> > +        - Clang/LLVM 14.0.0 or later
> 
> Wow, that's a big step. I'm build-testing with Clang7 on one system and
> with Clang5 on another (and the latter more frequently than the former).
> If any real dependency on this new a version (about 3 years old?) was
> introduced, I would then no longer be able to locally test any Clang
> builds (and hence the risk would again increase that I introduce issues
> that affect just Clang builds).

Would it be possible for you to update to a newer version?  I see both
the OpenSUSE containers in Gitlab have newer versions of Clang.

The reasoning for selecting such versions is in the commit message, I
simply see no point in maintaining support for older Clang versions if
there's no-one that actually runs such builds.  Just listing them as
supported for being able to output a binary that's never run tested is
not helpful.

Thanks, Roger.

