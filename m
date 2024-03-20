Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669FB881418
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695978.1086399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxVd-0003vx-F7; Wed, 20 Mar 2024 15:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695978.1086399; Wed, 20 Mar 2024 15:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxVd-0003tz-Cc; Wed, 20 Mar 2024 15:05:41 +0000
Received: by outflank-mailman (input) for mailman id 695978;
 Wed, 20 Mar 2024 15:05:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmxVb-0003tt-Tw
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:05:39 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f72e27d-e6cb-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 16:05:39 +0100 (CET)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-222b6a05bb1so2798092fac.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:05:39 -0700 (PDT)
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
X-Inumbo-ID: 4f72e27d-e6cb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710947137; x=1711551937; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJxegO5jY0m50eRvyJ6Rn52tnRBA4pRISA0GV0hamew=;
        b=aYB9Eoh4vxFHp5dkSEJZYW8RJUnM7bq6/dZCliWsMelgUvAd3wkJa5/2Z6FBflrCdb
         pMdPku2aLXeTV3yPXP3d+coD+J2huBBOH4OaGFmGjm2V3rnZffwQ5PeO3AzD4kT6CEr8
         QCb3CR8457nWowhQHC5V1/3C9eeBrowzCFO+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710947137; x=1711551937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJxegO5jY0m50eRvyJ6Rn52tnRBA4pRISA0GV0hamew=;
        b=NmU7FC+Wo3KL8/YyO41BsPCiAfj+rhvqcdaSZ1q+HhcuGFJS3+IPIsUMFtJGXRBVou
         wDeJ4c6bjlSeelzuW1cmHDWe2Trkt3WtJmzOrMfwt1efNem30ZumNIeJm+5aqJDhvAlG
         j5zxFsJKDezac2+Y6qnnDoBGOlqESeA+5j3TGp5uL11S66LW9DniQJbeGh5G6uyIoyL6
         1pCxmQrcmysQIb4igl6gX+5EYwx48e0cPaRskVqKSJUCsy1wFpCXJW+o5eItRV5SmUpA
         Mx4npY3b2uW90nNAvQpns8FKbfeMZIZva0uk9BXfgMryxEDfy6e47lKBDUfZ+xsulx+8
         lzEg==
X-Gm-Message-State: AOJu0YzrgRwFwciB3Eg7/7JJI8x4+AmdLAZr36Zb+6BH96Q35917GgZs
	SuPqisezPXCvfpJTrV6JQzp3TqlmNI0le6kVrUb1PcM4tq+pMe9Xt7+wa3/lNbc/4cGZkMnN6pG
	+tBYunMCOgXJfv+gKp0z1pIB0gWDcO6QeGI+byQ==
X-Google-Smtp-Source: AGHT+IEjJLHsK1QNPng+l2IFJvjPqlg89PHWi6Wfe2pgMdmMaaTx47H0J5Cl6qrIavYl2WwQ1nwdjO+fDH3J2hgXiKo=
X-Received: by 2002:a05:6871:3a22:b0:220:f92f:5bf7 with SMTP id
 pu34-20020a0568713a2200b00220f92f5bf7mr19845707oac.50.1710947137569; Wed, 20
 Mar 2024 08:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <20240318163552.3808695-3-andrew.cooper3@citrix.com> <CA+zSX=b7X91bZZQcm=PvLbxeEofq12yNn2h+-Rb7WZESYmxPeA@mail.gmail.com>
In-Reply-To: <CA+zSX=b7X91bZZQcm=PvLbxeEofq12yNn2h+-Rb7WZESYmxPeA@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 15:05:26 +0000
Message-ID: <CA+zSX=by8bfdtOxEUDdfzBceOcZrft7si7pt=xh17Vu23JBVxQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] xen/credit2: Clean up trace handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 12:16=E2=80=AFPM George Dunlap <george.dunlap@cloud=
.com> wrote:
>
> On Mon, Mar 18, 2024 at 4:36=E2=80=AFPM Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
> >
> > There is no need for bitfields anywhere - use more sensible types.  The=
re is
> > also no need to cast 'd' to (unsigned char *) before passing it to a fu=
nction
> > taking void *.  Switch to new trace_time() API.
> >
> > No functional change.
>
> Hey Andrew -- overall changes look great, thanks for doing this very
> detailed work.

For my own posterity later:

I've done a close review of the rest of the patch and didn't see any
issues other than the loss of sign in a handful of cases.

 -George

