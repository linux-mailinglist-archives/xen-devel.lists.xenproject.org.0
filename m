Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B36B1DC98
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 19:44:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073402.1436236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4f0-00077O-KJ; Thu, 07 Aug 2025 17:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073402.1436236; Thu, 07 Aug 2025 17:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4f0-00074w-GU; Thu, 07 Aug 2025 17:44:14 +0000
Received: by outflank-mailman (input) for mailman id 1073402;
 Thu, 07 Aug 2025 17:44:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uk4ey-00074q-2O
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 17:44:13 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f722560-73b6-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 19:44:10 +0200 (CEST)
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
X-Inumbo-ID: 1f722560-73b6-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754588648; x=1754847848;
	bh=2khjs0/R2PTjMMCgr7LhMH+/mw4Wh5LX/qMb+fkAQuc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FkUuF4cAHb7qhkqWQ8mwCTwpjAu8+0fbJVSWUQQGD8IHNKLdKqaDZvrFuRrsIcv7c
	 aOB//yRHzsUs60Ck1Onjj+9Na642ac3h5sD1gnwb+mc4uWZ33Xf+bv4npQTK6KgzFB
	 dC54MoA3SbqfnLTkHNErPSqUxlAGHFFukS02gWTzVrWOOZHdXBh30m7pVxFHFHETgR
	 tjsyPWNYG932sv34SCvBC5MnfD18oVlEsbqWIALANYes/Dt6COLRwEDQS7+1xWeMP5
	 vLq9n+SxJqWeoVQoVyyhJaliDch3yQvDM9wHmYUUkuMEHVHMnIODFHm4LjrmFEEZHx
	 b+ftc2W5n+zmw==
Date: Thu, 07 Aug 2025 17:43:57 +0000
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/8] xen/domain: introduce common emulation flags
Message-ID: <aJTl1oZazXwq1KUo@kraken>
In-Reply-To: <5b604ac0-c832-496f-85b4-6261cbe06fcd@gmail.com>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-2-dmukhin@ford.com> <f2be5a00-63e6-489d-a26a-7d48d6ae41ad@suse.com> <aJFWQByvktADgYKu@kraken> <5b604ac0-c832-496f-85b4-6261cbe06fcd@gmail.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4268cb77ce6929ce8dfa6cb2b97cfe43d4d6e9a1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 04:28:20PM +0200, Oleksii Kurochko wrote:
[..]
> Hi Arm/RISC-V maintainers,
>=20
> Do you foresee any need in bubbling up emulation_flags to the common `str=
uct
> domain`?
> </pre>
>     </blockquote>
>     <pre>At the moment, in RISC-V's downstream branches emulation_flags i=
sn't used. And,
> for now, I am not really sure that it's going to be used in the nearest f=
uture.

Thank you, I'll drop that patch.


