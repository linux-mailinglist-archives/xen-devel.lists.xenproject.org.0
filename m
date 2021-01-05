Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC102EAA4C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 13:00:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61841.108993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwl0x-0000Te-GR; Tue, 05 Jan 2021 12:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61841.108993; Tue, 05 Jan 2021 12:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwl0x-0000TF-DL; Tue, 05 Jan 2021 12:00:39 +0000
Received: by outflank-mailman (input) for mailman id 61841;
 Tue, 05 Jan 2021 12:00:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=apNQ=GI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kwl0w-0000TA-1q
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 12:00:38 +0000
Received: from mail-wr1-f42.google.com (unknown [209.85.221.42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e9a3a3d-4638-43de-b634-d835e6b8646a;
 Tue, 05 Jan 2021 12:00:37 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t16so35922685wra.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 04:00:37 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u83sm4141045wmu.12.2021.01.05.04.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 04:00:35 -0800 (PST)
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
X-Inumbo-ID: 4e9a3a3d-4638-43de-b634-d835e6b8646a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=nGVl4q3zFlg0T/7+0dPYviBevhXkcuh4vphIfhIi1Ww=;
        b=k6t2TTQU8JI1LNc3Uo0QiMX5zjN9z5WkN+Ds4mIBBFET7dQKA79NxtDBWjBzcg/GiL
         hZVkOY3yZdh7rQzdNdeQiQWHEVXWEvdIkENX6aWnEbTPnf9bg8MUb3rn0wThsJeH9e+T
         O0h90LRrlg4Y22vQrC0Yq9si3sgTrH0E6GmuMq51tI0ZwrhsCTKFfxKTT4xI6Br9gKOD
         o6ZZF8sQw1Lort4MsZMTJzMkiLTTZhyF+BzSrdQpjy1wKDOfs3BtCnE28jckmXsx0uLb
         t83qTCKrWT1s9sQ/GdcDCvgBHT9l8IOfOlphIW0BMwW1wamkTMLEsAeGkT2Ps3M1Y2+Z
         xPeQ==
X-Gm-Message-State: AOAM5306XixNCmrnKmznI2535Cpr8vEZWE+pnUIZCQTr0v2Z+bObDW1h
	sLUuIpPXLxqbyiLpfHzSLPs=
X-Google-Smtp-Source: ABdhPJxXNnxfdgmwTpdhWgXQLXLTTbdUIPWABPhwahqc5XdFVpzCgZ6N3ppNdF1znWeTtkrJBsT9LA==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr84395001wrv.37.1609848036370;
        Tue, 05 Jan 2021 04:00:36 -0800 (PST)
Date: Tue, 5 Jan 2021 12:00:34 +0000
From: Wei Liu <wl@xen.org>
To: Hans van Kranenburg <hans@knorrie.org>
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v2] docs: set date to SOURCE_DATE_EPOCH if available
Message-ID: <20210105120034.qzjlitwd3lxe5kyl@liuwe-devbox-debian-v2>
References: <8b4564696cae00041848af8c5793172b80edadd5.1608742171.git.maxi@daemonizer.de>
 <f602c6d8-2e3d-806f-0584-ddb478b151b0@knorrie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f602c6d8-2e3d-806f-0584-ddb478b151b0@knorrie.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 24, 2020 at 08:02:37PM +0100, Hans van Kranenburg wrote:
> Hi,
> 
> On 12/23/20 5:56 PM, Maximilian Engelhardt wrote:
> > check if a GNU date that supports the '-u -d @...' options and syntax or
> > a BSD date are available. If so, use the appropriate options for the
> > date command to produce a custom date if SOURCE_DATE_EPOCH is defined.
> > If SOURCE_DATE_EPOCH is not defined or no suitable date command was
> > found, use the current date. This enables reproducible builds.
> > 
> > Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
> > 
> > Changes in v2:
> > - add capability detection for the 'date' command using ax_prog_date.m4
> > - add information about detected date command to config/Docs.mk
> > - only call a supported date command in docs/Makefile
> > ---
> > Please note the ax_prog_date.m4 macro is taken from the autoconf-archive
> > repository [1] and it's license is GPL v3 or later with an exception for
> > the generated configure script.
> > 
> > [1] https://www.gnu.org/software/autoconf-archive/
> > ---
> >  config/Docs.mk.in  |   3 +
> >  docs/Makefile      |  16 +++-
> >  docs/configure     | 213 +++++++++++++++++++++++++++++++++++++++++++++
> >  docs/configure.ac  |   9 ++
> >  m4/ax_prog_date.m4 | 139 +++++++++++++++++++++++++++++
> >  5 files changed, 379 insertions(+), 1 deletion(-)
> >  create mode 100644 m4/ax_prog_date.m4
> 
> Wait, what. The comment about the -d option already existing since 2005
> (in the previous thread) is relevant here...
> 
> I guess there would be other reasons why the whole current Xen master
> branch would not compile on e.g. Debian Sarge 3.1 from 2005... Like,
> amd64 did not even exist as release architecture yet, back then...
> 
> I'd prefer
> 
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> over
> 
>   5 files changed, 379 insertions(+), 1 deletion(-)
> 
> in this case.
> 

I have not read the previous thread. I would rather prefer a smaller
patch than a larger one. I agree with Hans here.

Maximilian, what do you think?

Wei.

