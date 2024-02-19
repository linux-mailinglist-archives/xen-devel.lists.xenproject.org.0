Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5C985A10B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 11:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682754.1061894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc0vg-0002Bn-M6; Mon, 19 Feb 2024 10:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682754.1061894; Mon, 19 Feb 2024 10:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc0vg-00029S-JQ; Mon, 19 Feb 2024 10:31:20 +0000
Received: by outflank-mailman (input) for mailman id 682754;
 Mon, 19 Feb 2024 10:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+22N=J4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rc0vf-00029M-B1
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 10:31:19 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03cdf62b-cf12-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 11:31:17 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41262eaa95aso7646515e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 02:31:17 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 21-20020a05600c229500b0041228b2e179sm10826452wmf.39.2024.02.19.02.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 02:31:16 -0800 (PST)
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
X-Inumbo-ID: 03cdf62b-cf12-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708338677; x=1708943477; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sp973qMCq2uetmFzE4PjtzN4lSg6l5YHUW3n6wOIGwE=;
        b=mnxj4OXbkxmgyGb0s6v++spEGZPu4lPICOHSd2G0uySqRVUzTmI2050WWV3xSmcNuH
         acweViPcFl4VTEb11Qn6s61oQVbcGCk2M418S6YKzC0UfPeW0sWmLnkSqro7V7oBZB5y
         U23XpBGNHPVeQ5H/sr5CkNPerHDlVQWwEgJiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708338677; x=1708943477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sp973qMCq2uetmFzE4PjtzN4lSg6l5YHUW3n6wOIGwE=;
        b=sbL3Pta3DnNO3O/mLGSrhJr7jdhpg++Kt3YkiWk7CvewqF4jVrEJw6ndwRvUSaVAt3
         rXz1zBBoLe6Mxp228WulKmC4VDkh3XbdiuHltRUZw/TpeIkAyX/uatWJrgJktq5M9jZS
         TwxmlBlMfhK/OuNkOcPvGii1k3e6u5dHaoRWaW7/iOOOv9q+hNZrrW2JFTgtHabNkd2U
         L6qXMn8DzcGZSFcig6Qpqb9wB3u1jOofwyZXtgBbkK19RLr4xfd29WdPwpKSQR7dwiKP
         Md7kNMTezPa0eX4fArotmresDTkEtVd0+CRerrdp/KXJK3YWDt5NEf2Eos9Dczl1bNvl
         10AQ==
X-Gm-Message-State: AOJu0Yy76ds1nMfG6PPDSG+uXP5AgI6WIzT/eIk6GIEqzQIkCnDTDQP3
	kk2gidkDmKkwaEAOCnp2NqhWy7S+w15XZGDVbSXhFRJ8NoUvdo8tyL4ekQrGP9w=
X-Google-Smtp-Source: AGHT+IHWXp6GXytviRSlUZcOaYRs8YmDzGesYjIR+AvEKqGEeDzJzYGcJdtWwsKO+pnSnJySynZHtg==
X-Received: by 2002:a05:600c:1f8b:b0:412:4a57:388f with SMTP id je11-20020a05600c1f8b00b004124a57388fmr5755383wmb.15.1708338677068;
        Mon, 19 Feb 2024 02:31:17 -0800 (PST)
Date: Mon, 19 Feb 2024 11:31:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
	Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Stats on Xen tarball downloads
Message-ID: <ZdMt88BSNMYtq39n@macbook>
References: <CA+zSX=aEdcF-D3PUQN=1V2puz0AEMiLn4-uQFGrLWf7EYSZ7WA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+zSX=aEdcF-D3PUQN=1V2puz0AEMiLn4-uQFGrLWf7EYSZ7WA@mail.gmail.com>

On Mon, Feb 19, 2024 at 06:01:54PM +0800, George Dunlap wrote:
> Hey all,
> 
> One of the questions we had with respect to changing our release
> practice (for instance, making the process more light-weight so that
> we could do a point release after every XSA) was, "How many people are
> actually using the tarballs?"

What would this more lightweight process involve from a downstream
PoV?  IOW: in what would the contents of the tarball change compared
to the current releases?

> I finally got access (again) to
> downloads.xenproject.org, and took a look at the logs.  It appears
> that we only keep about 2 weeks of logs there.
> 
> Short answer: It's pretty clear from looking at the logs that there
> are large numbers of automated build systems building various versions
> of Xen from tarballs.  It *looks* like there are over 300 people a
> week downloading 4.18.0 specifically from various web browsers.

As someone who packages Xen for FreeBSD, I've recently switched the
build to use the git sources directly, as otherwise keeping up with
XSA tends to be a pain, specially when XSAs happen to depend on the
context of some of the backports that happened between the point
release and the XSA disclosure.

Overall as a consumer of Xen it would be helpful if we could make a
release for each (batch) or XSAs, as that would possibly make me
switch to build from the release tarballs instead of git.

I don't think it would be much of a disruption if such change to
generate more lightweight tarball is done starting from a major
release (ie: 4.19) and minor releases of previous versions (4.18.x)
are kept using the non-lightweight process.

Thanks, Roger.

