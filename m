Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D23CA4F353
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 02:15:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901683.1309649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpdLP-0007Hz-K4; Wed, 05 Mar 2025 01:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901683.1309649; Wed, 05 Mar 2025 01:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpdLP-0007G5-Gp; Wed, 05 Mar 2025 01:14:43 +0000
Received: by outflank-mailman (input) for mailman id 901683;
 Wed, 05 Mar 2025 01:14:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vvpY=VY=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tpdLN-00070N-QQ
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 01:14:41 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36530883-f95f-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 02:14:40 +0100 (CET)
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
X-Inumbo-ID: 36530883-f95f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741137279; x=1741396479;
	bh=Zj/Wfs1y796j3B9En1bf0u84ujkqWp23WVN2EOza3PU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OglGLukatHPAgmbvba+1s/CcdOIr0lXFrksGgYcx6R6zi7TVS5NFNuzeVlo4QMzKe
	 ChEh7/OwdU+TKaagjzlY/601hu8wuymKYQqt+PFO8xBL2iRoR1wEnXPSl21/Fo4nJ+
	 txZekNa4LQGGJoyC5gRUfej1IowuiSXtVeDgEu8MCwfYdI6hfX9JBOzdWdO3edqIyH
	 FhbOzhFI2vu5ZrerQD2KUt8V45O0tPpaFd3p5EuXEbs3GwPydKS3XfmaJlizebc+06
	 2WSEFLR/WQ9uexXvOCx4m5vvh9pkTh+noUaXQMTVhDLjdpujOsY7vBCOi51ymO0WbN
	 tFYhGvwiGmzzw==
Date: Wed, 05 Mar 2025 01:14:37 +0000
To: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: make console buffer size configurable
Message-ID: <uX-PSQNjVPY0K3cUMC7SlyuBhvLovD0N2JzkKuUyE8IRCwZYIN6wQ633h8sYbqwnsYAVhe094U5OaP-1e3Z0f18mQgHTuTva9A1ZgIyhuLY=@proton.me>
In-Reply-To: <Z7j6fCtdGwDkFpB8@mail-itl>
References: <20250212222157.2974150-1-dmukhin@ford.com> <4203576f-0b93-4647-9983-e36c15fa1d0c@suse.com> <o_C90Tb8fjLMkG-pSNmxycIsYytdAxHSTU7yrudH07-h6L9e4XGirmyyKKSRQsLuOyYwA6b-9jd8kOOnM21yC8I-6q5EzcX2lsLHcbgGqec=@proton.me> <Z7j6fCtdGwDkFpB8@mail-itl>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 82da9405313785d7cada149c9f46e0fe283ed61f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, February 21st, 2025 at 2:13 PM, Marek Marczykowski-G=C3=B3recki =
<marmarek@invisiblethingslab.com> wrote:

>=20
>=20
> On Fri, Feb 21, 2025 at 08:52:47PM +0000, Denis Mukhin wrote:
>=20
> > Also, since there's a build-time configuration parameter along with the=
 boot-time
> > configuration, perhaps it makes sense to retire boot-time setting in fa=
vor of
> > build-time setting?
>=20
>=20
> IMO boot time setting is still useful to have, to not require rebuilding
> just if you want bigger buffer in some specific case.

Ack.

>=20
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab

