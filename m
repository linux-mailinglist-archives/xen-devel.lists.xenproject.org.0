Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720CD8815B6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 17:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696052.1086602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmytN-00089T-6A; Wed, 20 Mar 2024 16:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696052.1086602; Wed, 20 Mar 2024 16:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmytN-00087w-3Q; Wed, 20 Mar 2024 16:34:17 +0000
Received: by outflank-mailman (input) for mailman id 696052;
 Wed, 20 Mar 2024 16:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ljj4=K2=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmytM-00087q-8t
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 16:34:16 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0c19259-e6d7-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 17:34:15 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d2509c66daso595551fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 09:34:15 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ay18-20020a05600c1e1200b004146d785508sm2129380wmb.0.2024.03.20.09.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 09:34:14 -0700 (PDT)
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
X-Inumbo-ID: b0c19259-e6d7-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710952455; x=1711557255; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uvMEuNr6O04CiFhFcy0dXvBSyQpFdx0edVtZKpJyXnE=;
        b=N2P8s/PBDaRU2pMhlNmwp1Aq9+6zUXcevgCh4bQVw3g6Xv0iPhr88Ie7hMtEHZHned
         BapIDNtQdZPunIHjb43woqaRFcleBUWbWcmPPH4W8aVNeuJ18jte1MjMfmffQ/Yycx3R
         BA5yJSEAsWM9ZWt5TJkYk2B4VZdMhya0dZtkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710952455; x=1711557255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvMEuNr6O04CiFhFcy0dXvBSyQpFdx0edVtZKpJyXnE=;
        b=mY5Z4w+OjLX1u9poE5FThCRBu8vS0acE9qhdtLfMQMW9+BmdcXm5PARGaiKdf67W4p
         5Q+NUiLvvcu5HAaH8WhaiJ4B6s3eEoL+zxJCGGkT9XXwVo4WFTZX/Au9GGYFfJRU1z9o
         OwdIdXCGYW7HE/pEzxLatk9zPp5Sr6bHjRzUelalajRTo2y2VaO8TJvSI3XT6KRopCT0
         P0Tr6k7Uus5Q8nNxX5/Lwf8dhoNA0Tp5VTT5E6/n8a/UdfDh91YKCgzz398B/gNmnhpn
         EezQ4TqSv9MFHK0DKaigBw2ftGktoBKc3WJBXdq1GIslgVd2xtdRyMqdAPj2mEU/PYwa
         GjLA==
X-Gm-Message-State: AOJu0Yz41WrGjK5QZAk4oiZrMeltV+yrqUf0U9EFQ5B6JJ3zzWdqMb6w
	ZcV3HRnYUnYrSj7dtFh66aMVsqWfWmM5LPqvouKYXzxvGCP7sqCQQ6cjowyeEsBnzb6vBTRMw5i
	c
X-Google-Smtp-Source: AGHT+IEzCkO5Fyo9QWXXnKguYupKnS636o1SmCj6ETK13Qm/YvMUOiTsECGL232xZOJ3/S7taL+WDw==
X-Received: by 2002:a2e:98c2:0:b0:2d3:d9fd:568d with SMTP id s2-20020a2e98c2000000b002d3d9fd568dmr12544051ljj.8.1710952454789;
        Wed, 20 Mar 2024 09:34:14 -0700 (PDT)
Date: Wed, 20 Mar 2024 16:34:13 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 02/36] ts-xen-build-prep: Only force git protocol
 v2 on buster
Message-ID: <7a96afa1-8a91-4a2d-ac85-94950ae1f9e6@perard>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <20240318165545.3898-3-anthony.perard@citrix.com>
 <Zfr-oCQrJmetJPQG@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zfr-oCQrJmetJPQG@macbook>

On Wed, Mar 20, 2024 at 04:20:00PM +0100, Roger Pau Monné wrote:
> On Mon, Mar 18, 2024 at 04:55:11PM +0000, Anthony PERARD wrote:
> > Newer version of Debian and thus git would use this automatically, no
> > need to force it.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >  Osstest/TestSupport.pm | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
> > index f0e087aa..0dded9b2 100644
> > --- a/Osstest/TestSupport.pm
> > +++ b/Osstest/TestSupport.pm
> > @@ -3257,7 +3257,7 @@ END
> >  
> >      # Adding mandadory use of Git protocol v2
> >      # necessary on buster when building QEMU v8.1
> > -    $gitcfg .= <<END;
> > +    $gitcfg .= <<END if $ho->{Suite} =~ m/buster/;
> >  [protocol]
> >  	version = 2
> 
> Do we need to limit ourselves to version 2 for the git cache stuff, or
> that doesn't matter?

It's not a limitation, this settings forces `git` to use an experimental
feature. In buster, git still default to version 1, which was an issue
for a single git repo, one of QEMU's meson wrap dependency.

In bookworm, git default to version 2, so I don't think there's need to
deviate from default beyond buster.

Once git-cache-proxy knows how to handle this version=2, and pass it on
to `git-upload-pack`, it will know how to handle v3 and beyond.

> I'm wondering whether it case version 3 of the protocol appears we
> would be in trouble by not having version = 2 in the config file.

No, git should be able to negotiate with itself. Even today, if a git
server only have protocol v1, it will just ignore that a client ask for
v2.

Thanks,

-- 
Anthony PERARD

