Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE03B7C6F8C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 15:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615788.957210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqvyR-0006Uc-Cz; Thu, 12 Oct 2023 13:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615788.957210; Thu, 12 Oct 2023 13:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqvyR-0006Sw-AB; Thu, 12 Oct 2023 13:43:35 +0000
Received: by outflank-mailman (input) for mailman id 615788;
 Thu, 12 Oct 2023 13:43:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Y9O=F2=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qqvyQ-0006Sk-Eq
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 13:43:34 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55cb38e5-6905-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 15:43:33 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53da72739c3so1712926a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 06:43:33 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 r15-20020aa7c14f000000b0053448f23b33sm10107895edp.93.2023.10.12.06.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 06:43:32 -0700 (PDT)
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
X-Inumbo-ID: 55cb38e5-6905-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697118212; x=1697723012; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=71q/hEK3izRxQ+ggRh4p9lQ6o4Aa135thdYxQxhrZYU=;
        b=c+/UIJHyKOXHTVRzWfHUj+n/aye7NGfB0XA45XkOaXXBT6lQBCUBLve4zNhK2aa/8U
         DIHDaKKffKTHFrT59mJF5ymyeCf1uoznh/jG82PgPLcOxDFNDtMm1Z+J+kMdW8Rn1TJN
         uc+B0hK+RapsY/FP5TQWIEBvH91rkIkef0tKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697118212; x=1697723012;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71q/hEK3izRxQ+ggRh4p9lQ6o4Aa135thdYxQxhrZYU=;
        b=xAdcVjWC5F5d9CFTPYBR7W52f4qya5FOtoNEJWqyrQnshW1RP7KHCxdS0JE5Ouc7Vo
         Y33ItUpIzJn2FBqvLGI1KoKgmUoPq7RwZb9xMqMolwMUwp4QTlCTR0tWXK3c1yMrhzco
         vERs//1e0BOw7m52bFO/PTs13FvK12fqkLTj4Xens1EBZ/7Dxo4FJioyZbiYaKQbrdSw
         /jy0y/EK5laHDMgkKQJKuYa9gG57790jCQbpF/ljBdycgboYraHRsJRfmfl92HETpAIh
         9cjshFspGKQep4hgam09is/jfeaClzHUiwapQQL/fh5OOIcLLJW1G1xAeBDhT0M7p3Cq
         QDfg==
X-Gm-Message-State: AOJu0YziINYlWj+2wY1shHqcRpFl/t81wD/IUov7cxFOU56ULkHlx8oU
	rZ6WKCb7CPmRH5tYXnNZ+wG6pw==
X-Google-Smtp-Source: AGHT+IFsgSDNVbTcaKb9H+efkZ6eKL74+8pvpEOUbdcyruOs7//orClJABpLLD2O9xcu7d1rZpc8GQ==
X-Received: by 2002:aa7:cd74:0:b0:52a:6497:d02b with SMTP id ca20-20020aa7cd74000000b0052a6497d02bmr22477521edb.16.1697118212649;
        Thu, 12 Oct 2023 06:43:32 -0700 (PDT)
Date: Thu, 12 Oct 2023 13:54:29 +0100
From: Javi Merino <javi.merino@cloud.com>
To: 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v1] tools/python: Add python3 compatibility
Message-ID: <2c3hczqthfsg3lvv3sbrz7cdq4umgzxby4esiwoo6axgqvxciz@xdacvkdip4vv>
References: <efb10e537e37df1995dd8f87c28a8eb64ec9b61e.1696947009.git.javi.merino@cloud.com>
 <ZSVtR1ct4Hik4XM8@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZSVtR1ct4Hik4XM8@mail-itl>

On Tue, Oct 10, 2023 at 05:27:03PM +0200, Marek Marczykowski-Górecki wrote:
> On Tue, Oct 10, 2023 at 03:18:45PM +0100, Javi Merino wrote:
> > Most of the work for python3 compatibility was done in
> > 1430c5a8cad4 (tools/python: Python 3 compatibility, 2019-12-18).  This
> > just adds a few builtins needed for python3.
> > 
> > Resolves: xen-project/xen#156
> > 
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> > ---
> > 
> > I haven't tested it.
> > 
> >  README                                     | 1 +
> >  tools/python/scripts/convert-legacy-stream | 3 +++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/README b/README
> > index 855db01d36..44ed88c392 100644
> > --- a/README
> > +++ b/README
> > @@ -51,6 +51,7 @@ provided by your OS distributor:
> >      * POSIX compatible awk
> >      * Development install of zlib (e.g., zlib-dev)
> >      * Development install of Python 2.7 or later (e.g., python-dev)
> > +      - If using Python 2.7, you also need the future module.  This is not needed for Python 3.
> >      * Development install of curses (e.g., libncurses-dev)
> >      * Development install of openssl (e.g., openssl-dev)
> >      * Development install of x11 (e.g. xorg-x11-dev)
> > diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
> > index 7fe375a668..26a66c50fc 100755
> > --- a/tools/python/scripts/convert-legacy-stream
> > +++ b/tools/python/scripts/convert-legacy-stream
> > @@ -8,6 +8,9 @@ Convert a legacy migration stream to a v2 stream.
> >  from __future__ import print_function
> >  from __future__ import division
> >  
> > +from builtins import zip
> > +from builtins import range
> > +from builtins import object
> 
> In which python version it's needed? The thing about builtins is they
> are available without explicit import.

In python3, this change is a noop.  In python2, this change makes zip,
range and object be consistent with its python3 counterparts:

- zip: with the change, zip returns an iterator in python2,
  like it does in python3.  It's equivalent to izip from itertools or
  `from future_builtins import zip`[0]

- range: with the change, in python2 range behaves like xrange() used
  to. It returns an object instead of returning the list.[1]

- object: with the change, in python2 the string representation of
  VM() is in unicode, as it is for python3.

[0] https://stackless.readthedocs.io/en/2.7-slp/library/future_builtins.html#future_builtins.zip
[1] https://docs.python.org/3/library/stdtypes.html#ranges

Cheers,
Javi

