Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D068754D8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 18:08:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689973.1075536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHEI-0008PZ-6W; Thu, 07 Mar 2024 17:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689973.1075536; Thu, 07 Mar 2024 17:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHEI-0008NS-2p; Thu, 07 Mar 2024 17:08:26 +0000
Received: by outflank-mailman (input) for mailman id 689973;
 Thu, 07 Mar 2024 17:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqh0=KN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riHEG-0008N4-0V
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 17:08:24 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ce65270-dca5-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 18:08:22 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5131c0691feso1526403e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 09:08:21 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05651201cc00b00513360ebd22sm2551021lfp.118.2024.03.07.09.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 09:08:20 -0800 (PST)
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
X-Inumbo-ID: 4ce65270-dca5-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709831301; x=1710436101; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ViU2v0qBRASJJ7QWLeqYy0/HQnnBlvBlJiZL/b+CMsc=;
        b=Tq39TXViKArPXWw2oMepVBssBTWXTlvzj5/4VkL17uc6gthW+DT9ZaxD5TNRYENLqd
         ZAXNaphy1unK14Sv8km3d9w/4sM/0ALR6hOqJz9zpIZzA9didBHHcdK/6w2l8ajUxpqn
         2OXo1Y2ytR7wCDvSud2CbEuU/1TyGJFh7fB9xbcIH3WRWPM3ljDqxqyHw+vTZ5PBq7EM
         RPv/gWLL4cirANLtn+LehzboaSU51FXR3xBE350vfc02z6oTVgTAdPPbEPim4y/nb0bT
         7fPL1NODz/LpDFexN/lakNSArqRWMDDzAm3jT4UeutgxZRljTIthzVpoPOBfqAu5+P4n
         gYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709831301; x=1710436101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViU2v0qBRASJJ7QWLeqYy0/HQnnBlvBlJiZL/b+CMsc=;
        b=t2y1Rv5lbxw7Qzs07pB7jhbgw3boi7sp8blah6fD0Z9mqt/fUCN86eANxutoh7JbLX
         1sUe/FY25eI3iwzVpe9298rYvXpzlBW4F4fRez1PcO9BG1vdmrkt7Cs4nIOIOKhF5imx
         0L0t4GVW2fz6j7/YdnBbpZ1qWywSDkc3aPkeukgKKsvqS8ea+5mKTSF+w5EpXFvbOQpN
         ob8ATfwCK9XbWuVW7WstQXLMz58hStf0lSd3yEyj8x2PJG+XjyDWZ6CH66Stftc0lyxL
         nJiSNfvXofHSixeC55NwtMz0Q8/0vyC4oA7BjvcOUfcatKrzraCvGplaKPn7qTkKclqX
         zp4g==
X-Forwarded-Encrypted: i=1; AJvYcCVnmrBz63zVvcKjpVqsQvJCIa7j5WTbPxYsDBhz37RM4zujOFnqyYFhi+MeE39BNbEKoiUFYIKl3JX/yHSP8FF/FHkJ9lOy56+A2cyH1E8=
X-Gm-Message-State: AOJu0YwOGIsVqiBS38foYAOYQJamfericXerUQg8MUsh/zbF4GicuTi7
	c52ls7Hv+RavG6U6VsKl/sgK4PnoJUAQKC4rt342e6/QbWMM55eW
X-Google-Smtp-Source: AGHT+IFCy+1qkHbSXi3+x5WAqAVxxB/7wcM6pQ+w8nIVeD8daUd7709MAmi0ugx5OaIEiBU1w6+x1Q==
X-Received: by 2002:ac2:514a:0:b0:513:6ac7:138c with SMTP id q10-20020ac2514a000000b005136ac7138cmr1725104lfd.40.1709831300561;
        Thu, 07 Mar 2024 09:08:20 -0800 (PST)
Message-ID: <a64b84d6759cb7daa48af5c6680e0011ed6bb113.camel@gmail.com>
Subject: Re: [PATCH] move __read_mostly to xen/cache.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
  Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger
 Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>,  Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Date: Thu, 07 Mar 2024 18:08:19 +0100
In-Reply-To: <64466285-35b8-497c-a12b-60fe0c998ba6@suse.com>
References: <f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com>
	 <b49777c7-c677-826f-01da-c6b5b67f5b85@citrix.com>
	 <893a5ebf-54e2-f2b2-1365-2a6d36ed3a39@suse.com>
	 <fb627eae0deb85569d3c3044154f1588e9202ec9.camel@gmail.com>
	 <64466285-35b8-497c-a12b-60fe0c998ba6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2023-12-22 at 12:09 +0100, Jan Beulich wrote:
> On 22.12.2023 10:39, Oleksii wrote:
> > On Tue, 2023-08-08 at 12:32 +0200, Jan Beulich wrote:
> > > On 08.08.2023 12:18, Andrew Cooper wrote:
> > > > On 08/08/2023 10:46 am, Jan Beulich wrote:
> > > > > There's no need for every arch to define its own identical
> > > > > copy.
> > > > > If down
> > > > > the road an arch needs to customize it, we can add #ifndef
> > > > > around
> > > > > the
> > > > > common #define.
> > > > >=20
> > > > > To be on the safe side build-breakage-wise, change a couple
> > > > > of
> > > > > #include
> > > > > <asm/cache.h> to the xen/ equivalent.
> > > > >=20
> > > > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > >=20
> > > > Could we find a better place to put this?
> > > >=20
> > > > __read_mostly is just a section.=C2=A0 It's relationship to the
> > > > cache is
> > > > only
> > > > microarchitectural, and is not the same kind of information as
> > > > the
> > > > rest
> > > > of cache.h
> > > >=20
> > > > __ro_after_init is only here because __read_mostly is here, but
> > > > has
> > > > absolutely nothing to do with caches whatsoever.
> > > >=20
> > > > If we're cleaning them up, they ought to live elsewhere.
> > >=20
> > > I would be considering init.h (for having most other __section()
> > > uses,
> > > and for also needing __read_mostly), but that's not a great place
> > > to
> > > put these either. In fact I see less connection there than for
> > > cache.h.
> > > So the primary need is a good suggestion (I'm hesitant to suggest
> > > to
> > > introduce section.h just for this).
> > Andrew sent some suggestions here:
> > https://lore.kernel.org/xen-devel/3df1dad8-3476-458f-9022-160e0af57d39@=
citrix.com/
> >=20
> > Will that work for you?
>=20
> I still need to properly look at the suggested options.
Have you had a chance to review the suggested options?

~ Oleksii

