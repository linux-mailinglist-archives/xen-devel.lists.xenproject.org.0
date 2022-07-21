Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B65357CB82
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 15:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372738.604656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVvl-00073F-9I; Thu, 21 Jul 2022 13:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372738.604656; Thu, 21 Jul 2022 13:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVvl-00070k-6J; Thu, 21 Jul 2022 13:09:29 +0000
Received: by outflank-mailman (input) for mailman id 372738;
 Thu, 21 Jul 2022 13:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6kJ=X2=citrix.com=prvs=194f9e755=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oEVvj-00070e-SC
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 13:09:27 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57f8658d-08f6-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 15:09:26 +0200 (CEST)
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
X-Inumbo-ID: 57f8658d-08f6-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658408966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oXq6zd/w4sGh12m3GGzjD+D2JLu8gxVMm/AoFlWNGf4=;
  b=PkltjImXZL+642yt4q8gK3OU79CWHDQkGAsqk7h/f41zs0evVz7N+0fz
   nVDovqfGVog3x5o9mEsAGDgndjgwj5D2jdBT8iiwEBjyMrSPO9OuFt+eZ
   kfag7ZbbPhJiehf6IkyrQk4DlpcW2VH/TVLTehynJh+HBkjskvcHtpZiT
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76320119
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AVV2qsaC15xs2QxVWkefolJIiHB/EJm4KOzbN4?=
 =?us-ascii?q?r1jHsv3zxNZIRWMlPgJTUqlPK6odUonXKPw3BDec0aghIdagL1VTmEpcvcGM?=
 =?us-ascii?q?j6/TpzQ4+x2/W5DM9dqxtC276BFUzAnYK3M/naWupi34Ayk4AGhNaaY8O8O6?=
 =?us-ascii?q?s3b0vJO4Jw+oQgR91xanjE3FQnpKVGxwszmzgXFyt2sR0oTgdqs0GRKNYaAl?=
 =?us-ascii?q?1jTY1Bo5ooOzBZaIIX/iakPw3C1FeluhquW3wlHOvJK3kwO7cBmSPXimZhsV?=
 =?us-ascii?q?yFka4+yEVn1+HvGI/6Obr0e+6fn+0/seAfFQC5fHIbICtdWETkNnlqkzvZFz?=
 =?us-ascii?q?fQbwWVg+/hkLAB29KMN4tBnMKrY3ZkQLnyCVe5fYeD5pO5HVIzMvcjMxVans?=
 =?us-ascii?q?LAOt7UxDk4rxdNCGFw6qVKHGK9m2ThNk/uuYiDD03/QAsUeUQxwdMpRJNmDv?=
 =?us-ascii?q?oYYHLKJnu5eLbSebvkp7Noz1WI73Ridmh8gL91TRWfohFBwOis67KXm7Iesp?=
 =?us-ascii?q?hBbOLx+zQc/UCJnzd/2jFx5OcO5WJjdW4QDxPsrrIfcFENI4rDCwcP9ZAKKw?=
 =?us-ascii?q?uYLmBnFodFY3QueP1vuM671KQhW/1z8XIcUAYH+1Q5nFYs692pRuvuhPCpDL?=
 =?us-ascii?q?o4KARdP9V/CE0diWbhuq6wWH6nR2ZL+ideYWRTpRtnCLZn+lukdOp+fFhoWq?=
 =?us-ascii?q?ontUGwlT6I0gNip4blDd4FJCUNyx6w/G65zgGre8DqT1bSffNsfFof0WQWgy?=
 =?us-ascii?q?eL59WruuxQc+fVAqtClhWHCyav1QByv2xoZGnN3u4bLXrZn0vQP/CQDx+9YD?=
 =?us-ascii?q?QVbv6emXDkX/Vgn8EVEH9aJJ5dIBOWN4Td2MXShMsnSVGByuzwuaZu9f850p?=
 =?us-ascii?q?FlMnM9zKh+Fdanm74lCcVO1s6P9tdT2Kw63bTRcgMxCEk4ILhDB9gNOZi0K0?=
 =?us-ascii?q?V9nG232+4THSqv8ekR1PjqNscJghdnLf6GWE4gPOCemH9HyFdY4/gwU4R+56?=
 =?us-ascii?q?8GC2AKYF6vwhhs856K9QuCByuxx6ZKNAIlNBQd9+7qvE6ZYoUCT0SzwyzNBB?=
 =?us-ascii?q?nKCNEmIUXDYAoH3bzlwf70hTfc2LdkGELEAehPHhzYPJKLfZBv20ZuQv1ZjS?=
 =?us-ascii?q?HDM8Ve1vY7it287RBE+S9LWZrUzxxuGbFkSag51IIVbOAhCkj8mGdcRp69F4?=
 =?us-ascii?q?o3zWHsXIKgW7joIUEz2lwm2pkBRYRDK4bkKe1gYkklfF+ITtin0JdUUrOoDO?=
 =?us-ascii?q?k1NUoul9J4804UbKJw6vpu4TUSyl3yBfj2Oe5AmwqpDgTb2A0eeeWGLmY+1U?=
 =?us-ascii?q?dGSp2SbRzocAVf49AQO2TvEVlFJW64nqBdkh8Otnikr3pbmeQBu+Njg8izXG?=
 =?us-ascii?q?VJlhjk1mk+xiN61CydyW6qbnY7wji2xwhvw8Ms0W+TuMqrBuCkCL/MkR7aEe?=
 =?us-ascii?q?ixCmtQDZtyGKnL3G3AH8C3S1FDonCADR6xoLlTIy4ADkPs8XikWvikf2Gz8n?=
 =?us-ascii?q?9Hsq58G8T9qb4hqMFVMPPPMLG9rWPAspw42KiJTQIgVFS48zNRGtGTUx9FHf?=
 =?us-ascii?q?4QGO3/wyFoWs3UVtXJunK+L01aIbg5uSevPRA29GwNFIVVhf2T2M4LIOH8Hw?=
 =?us-ascii?q?BBr8AvJeQWW/4RGF0Lw/yNipZahfO4f5as7nzu8O86kU9fMZxrU1HhUCk1YV?=
 =?us-ascii?q?mJeKHcqHSohPokjwz2UHCf+jsJ5vUMjOWxKOpqp9bI61qIjSMXK/RXzkcNrE?=
 =?us-ascii?q?zoQC8DrdY0VuP7YgAXOg7Yp62o0nNHQTB5LvPs46wNd3N6pRy0ZM1CHpVJPy?=
 =?us-ascii?q?h+fBwrMPP4gxV9tw5XVk3i46n1yGHvvGBmYBUf1aQX+OMKvOA35hSwtlLICR?=
 =?us-ascii?q?nM+Yk340SSiDdt8ix7sh2SRkRphmrEXU7JNAd8fURIUX0iD1Mler2OZnz2c4?=
 =?us-ascii?q?nSCqeZRxx8t+DZsONW9kTJ2RgA7mFjvqdPoBJOrgsltwOdQ4H6VlYT2CGOKx?=
 =?us-ascii?q?cLdDiT6KOnfBFhgLyEVF11zbHnp5ug5RVJIpFjt/WwO6uYW4ftfJIRSp/fVL?=
 =?us-ascii?q?Z7ysDmN5QMG5VooSlTiepTAS0KFY0s6cjDpVR2Z8xFJ1JLIlsLSys4M0Pmhm?=
 =?us-ascii?q?JOVdjHmygxdAMe1nJNRu6blB8emzZ9vKcxZkkIYGg1WxD1ZtqgowoPimsU0c?=
 =?us-ascii?q?YGKIUjc4Jzv2yWigTe9l0dB0fnGF3Inj7z6uGtncL4rzO1jf/X82rVLjupvi?=
 =?us-ascii?q?lbObIo9B7daAbKzp5lSiz6IIiJJrgbxtpfWHk/Rm5pxGDmcfbm5ZW+EJB09V?=
 =?us-ascii?q?i2O9msP7RoH+XQeY4fAsVBYrwqZkl/01DjSeTtsLPeJNxlUiwzbATyW+3k3c?=
 =?us-ascii?q?8jvsR8Iub2tN0M9O5uUxktkh1ye0c0tQczd9t9yjLDupI3nbj1SN0e9q1ZDC?=
 =?us-ascii?q?G5WjMB7bTq55cKWEVeZirFTm5hpkkbtoEdgm5kiqxfc/UtWQNKGNWoFBbn6A?=
 =?us-ascii?q?qfTdhly4LkpOrU65eaog9fNJe+DXr5KJkhg2rdrhB1SRTziMwmNEvtz1jkgN?=
 =?us-ascii?q?o5r5/bPThgYSOnwj+QIrSIOOqfCq81F8kJFUB+RHI3g0P9JlrTE18iqj+To+?=
 =?us-ascii?q?ko8hnrafXw0K25CUUB2INWNJsmTM3FBFdtXziEKqBfEZokO5ahLCYhXV239R?=
 =?us-ascii?q?XpSY4MC0PdkXSEmWw4ydKCZR4C/0l2ZDmDkKOGvHdBGhlFRlPKOds+3eis8A?=
 =?us-ascii?q?aNlUsIW9csj1sR6UF8gEbgFJZ4gSVEqV3eOO7gAk0AwGiWnPeGml13R1DcFI?=
 =?us-ascii?q?jGfUBtldN60NQdrjhUN5x+X3sSghh29d64k00XpMK1XNb8D+Kl+KPJXXgDKm?=
 =?us-ascii?q?7i+I1LnV/p8W5Fzzg=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.92,289,1650945600"; 
   d="scan'208";a="76320119"
Date: Thu, 21 Jul 2022 14:09:20 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"wl@xen.org" <wl@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 0/4] Some improvement for gitlab CI jobs
Message-ID: <YtlQABtrS1yk1AZY@perard.uk.xensource.com>
References: <20220721124602.9910-1-anthony.perard@citrix.com>
 <b7aaa9c3-bd06-4d76-36f5-381333247697@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7aaa9c3-bd06-4d76-36f5-381333247697@citrix.com>

On Thu, Jul 21, 2022 at 01:03:41PM +0000, Andrew Cooper wrote:
> On 21/07/2022 13:45, Anthony Perard wrote:
> > Patch series available in this git branch:
> > https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-ci-improvement-v2
> >
> > v2:
> > - rebased
> >
> > Allow build and test jobs to run concurently.
> >
> > Avoid running "test artifact" jobs on branch "master" and other, when test jobs
> > aren't runned.
> >
> > Anthony PERARD (4):
> >   automation: fix typo in .gcc-tmpl
> >   automation: add a templates for test jobs
> >   automation: only run test artifact jobs when needed
> >   automation: use "needs" instead of "dependencies" for test jobs
> 
> LGTM.  Got a CI run of these?

Yes,

patchew's commit is in progress:
https://gitlab.com/xen-project/patchew/xen/-/pipelines/593479157

A run in my private repo:
https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/593340820
(no failure due to this change)

Running on one of my branch called "stable-wip" doesn't create any
pipeline, as expected.

-- 
Anthony PERARD

