Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B01B219AA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 02:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078187.1439189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulcXP-00015t-QE; Tue, 12 Aug 2025 00:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078187.1439189; Tue, 12 Aug 2025 00:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulcXP-00013I-N6; Tue, 12 Aug 2025 00:06:47 +0000
Received: by outflank-mailman (input) for mailman id 1078187;
 Tue, 12 Aug 2025 00:06:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Th/E=2Y=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ulcXN-00013C-9r
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 00:06:45 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39f754d5-7710-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 02:06:42 +0200 (CEST)
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
X-Inumbo-ID: 39f754d5-7710-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=lzdxe6wvcvbbfbkqrf5oj2gzmy.protonmail; t=1754957201; x=1755216401;
	bh=JCEmoGLxJ3yy+By49BmEjJL26xgPRjqmbgtB900C9Mc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bFvT4wQTsQohbX4QncscLqCRGrHJkpDTslMaDvupLHmWHXEA++k/Fgit142O8oJWV
	 7l0lTpmWWj+4UvEYxGUYX5d2jrqB4r2HinVX3JaLU3rSZAGwr9LuJ1X0ZeXHkkTgXE
	 nu7BbryS1Wg/hsSOQRR2HBN6OJmmdRy7mUha1s1ODk5t863j9x05eb6ATprQxcuJLE
	 2C68QNU7b1mLlrIU2RtI5K+zIfXE/SoB1RcF/YI6jx+JD8eNK990mCojfeCKwiTFkr
	 YkyTZpcVUXBmTOOKKbHvJzMbphd1G4x5amLsWUdW7rg5Lt4nkYxKgmVojNefimgTpc
	 H8kIyTSAqd5yw==
Date: Tue, 12 Aug 2025 00:06:36 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 5/8] emul/vuart-ns16550: introduce NS16550-compatible UART emulator (x86)
Message-ID: <aJqFiFj3KLeouvWc@kraken>
In-Reply-To: <32cd30fb-190c-44f0-824f-1c4583635250@suse.com>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-6-dmukhin@ford.com> <5c0589a2-91fe-484d-bded-5a68a1626355@suse.com> <aJeVTIG2nU3bqGwO@starscream> <32cd30fb-190c-44f0-824f-1c4583635250@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c19a692f5a379f8cd8f58d13175eff5488536dc7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 09:39:42AM +0200, Jan Beulich wrote:
> On 09.08.2025 20:37, dmkhn@proton.me wrote:
> > On Mon, Aug 04, 2025 at 12:53:36PM +0200, Jan Beulich wrote:
> >> On 31.07.2025 21:22, dmkhn@proton.me wrote:
> >>> --- a/xen/common/emul/vuart/Makefile
> >>> +++ b/xen/common/emul/vuart/Makefile
> >>> @@ -1 +1,2 @@
> >>>  obj-$(CONFIG_HAS_VUART) +=3D vuart.o
> >>> +obj-$(CONFIG_VUART_NS16550) +=3D vuart-ns16550.o
> >>
> >> I don't think files in this directory need a vuart- name prefix.
> >
> > Ack.
> >
> > Hmm, there's already ns16550.c which is UART driver, so it may be confu=
sing to
> > have two ns16550s (although in different directories).
> >
> > I do not have a strong preference on the naming here.
>=20
> We have several examples of files with the same name in distinct director=
ies.
> As an aside - is it really only 16550-s that you emulate? Otherwise the n=
ame
> may want to be e.g. ns16x50.c or ns8250.c.

I'll use ns16x50.c.

>=20
> Jan


