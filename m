Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D14D85F4FF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 10:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684283.1064023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd5hq-0006l9-9u; Thu, 22 Feb 2024 09:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684283.1064023; Thu, 22 Feb 2024 09:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd5hq-0006jD-6r; Thu, 22 Feb 2024 09:49:30 +0000
Received: by outflank-mailman (input) for mailman id 684283;
 Thu, 22 Feb 2024 09:49:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gCR=J7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rd5hn-0006gW-UX
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 09:49:27 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9b028b0-d167-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 10:49:25 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so4200846f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 01:49:25 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 i3-20020a05600011c300b0033cf453f2bbsm19735292wrx.35.2024.02.22.01.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 01:49:24 -0800 (PST)
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
X-Inumbo-ID: a9b028b0-d167-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708595365; x=1709200165; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eH/louA0em6mnyS2A46pkXSaK/sHzRF1mM8GXmk5/nQ=;
        b=iqe8He3WEZNZ6TaLVUVY1Fp5WGjqXlBeVPpseA6WGY/Sw/E7naRIFK9gOp7o6vFpAf
         1T8F/PWPC4ZeCUKH+TdQRiPKjfXEru5zNd1UQZ9ytqjZnOmt2Q6NZEY/jWNLRmKOO7SG
         ToYhKiZAK2wjdnUAT9iL3DTL033yfyRRu52Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708595365; x=1709200165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eH/louA0em6mnyS2A46pkXSaK/sHzRF1mM8GXmk5/nQ=;
        b=ufacysC/cUS50gOcUpN6OduO3MEFmuIob0AIcL4nKfxJjLa0CjgcFPKbtBQGON6aBh
         KEgneNRsoiPZOAsYvFIYYDlw/RSBPh0cnVTuDN3N+ldk6E1rBMGnKN6nEyThwIWeupJN
         Y4Q41DqGDtamo82qbclsPdoEG3HxIeTJQb7znMVune2jNyEN5ue1v+ONJkl3jYJOegyZ
         Bqjt1C8lT+5f/q/qQR3k3HcNveEUX4oARo9QYBE1bvD23Cc4NZvshCnq+azJmFr6OT27
         ssA33nMHU0zjsWIAh5pQ4md2rfR+KG6NhuHOzqRCwhEZWe29L7Y4b86W2Yf+U2U/cfkO
         2+pA==
X-Forwarded-Encrypted: i=1; AJvYcCUeEeh1r8Rk6jeOL9F1Qa/2x6CbtHv/6lU/pEsib9x71TYou7Ug3qxwwoTe/F2TClBia/zMFC1TO/x3rHTn581H/snebzcMA/dM+M4/Zyk=
X-Gm-Message-State: AOJu0YyYIHiaOqHNcInuRpu4LMwMVKzaFpDkRaDy8V52sVy+E11NiRBS
	XJ783WX0YEtNQi4Cw93RpH0HUkVj3r8fRVlcLc3P+uqnRWkFO6qjv4D/71IQzP4=
X-Google-Smtp-Source: AGHT+IH7yDrRgNTIQqNr563gE6DXDJt+4EmmOyyu4t1w6EF4Q9Ah/RDyPD1RVHBC2W1cTeeWbtQK1g==
X-Received: by 2002:a05:6000:1543:b0:33d:6ede:249a with SMTP id 3-20020a056000154300b0033d6ede249amr5816964wry.69.1708595365100;
        Thu, 22 Feb 2024 01:49:25 -0800 (PST)
Date: Thu, 22 Feb 2024 10:49:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	committers@xenproject.org, Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Stats on Xen tarball downloads
Message-ID: <ZdcYo3sGHVYaP6kM@macbook>
References: <CA+zSX=aEdcF-D3PUQN=1V2puz0AEMiLn4-uQFGrLWf7EYSZ7WA@mail.gmail.com>
 <ZdMt88BSNMYtq39n@macbook>
 <36229344-e2e2-46e1-839b-b7b3b0843f23@suse.com>
 <CA+zSX=YvTgEMC0S5OqSFvxfVDeruiO=FphyVx5fv75oT-QW01A@mail.gmail.com>
 <0936a6c5-bac2-4de2-9155-1722d3bb28ca@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0936a6c5-bac2-4de2-9155-1722d3bb28ca@xen.org>

On Wed, Feb 21, 2024 at 10:53:49PM +0000, Julien Grall wrote:
> Hi George,
> 
> On 21/02/2024 02:55, George Dunlap wrote:
> > On Mon, Feb 19, 2024 at 6:38 PM Jan Beulich <jbeulich@suse.com> wrote:
> > > 
> > > On 19.02.2024 11:31, Roger Pau Monné wrote:
> > > > On Mon, Feb 19, 2024 at 06:01:54PM +0800, George Dunlap wrote:
> > > > > One of the questions we had with respect to changing our release
> > > > > practice (for instance, making the process more light-weight so that
> > > > > we could do a point release after every XSA) was, "How many people are
> > > > > actually using the tarballs?"
> > > > 
> > > > What would this more lightweight process involve from a downstream
> > > > PoV?  IOW: in what would the contents of the tarball change compared
> > > > to the current releases?
> > > 
> > >  From all prior discussion my conclusion was "no tarball at all".
> > 
> > Or at very least, the tarball would be a simple `git archive` of a
> > release tag.   Right now the tarball creation has a number of
> > annoyingly manual parts about it.
> At the moment we have the following steps:
> 
> 1) Checkout tag
> 2) Create the tarball
> 3) Check the source tarball can build
> 4) Sign the tarball
> 5) Upload it
> 
> I managed to script it so I have only two commands to execute (mostly
> because I build and sign on a different host).
> 
> AFAIU, your command 'git archive' will only replace 2. Am I correct? If so,
> it is not entirely clear how your proposal is going to make it better.

IMO building for release tarballs is easier than from a git checkout
(or archive).  It's a bit annoying to have to pre-download the
external project sources, now even more as QEMU is using git
submodules.

Most distro binary builders have infrastructure to deal with all this,
but requires a bit more logic in the recipe than a plain just fetch a
tarball and build from it.

Thanks, Roger.

