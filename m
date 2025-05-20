Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1E6ABE638
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 23:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991183.1375088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHUgP-00060k-Rv; Tue, 20 May 2025 21:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991183.1375088; Tue, 20 May 2025 21:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHUgP-0005y5-P4; Tue, 20 May 2025 21:39:33 +0000
Received: by outflank-mailman (input) for mailman id 991183;
 Tue, 20 May 2025 21:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQuu=YE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHUgM-0005xz-Vg
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 21:39:32 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e82e493b-35c2-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 23:39:28 +0200 (CEST)
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
X-Inumbo-ID: e82e493b-35c2-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747777166; x=1748036366;
	bh=9tmznKEy/lBSTc5WBcDJRk9WJnX1M0ut/Vj9hgMu1wc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Ckd5u33CnRsaKJm8QtNZXuv2xOscFGJjIMBNFF7gYc8SGWbRTwL/t7UVua6a0U/pt
	 kVSPdezlwOzfFTts1hvj5U65P2DSZ155bd3+p43ZFGH0zAxNRF9sd5oAhNxRHjRwH1
	 uBJmetpBLS3CghPXo9pIPxmjZdkkf84z31SS9qTNOFK+o12RCjFOInKIlpIBtxuNKn
	 HFfCOscznysfph+vPIxOs6UEogv8Bkxf39f6cw7ggR+GZMqS2pNRR3HQnOjvT9IPPW
	 DfW3gbi70BCn+vkfVmUEyrt/Rt4hUfKmMabESytHXcfUNfhjLQ1HgZKYcVvzbYGBzy
	 OBIIzkI88y7sA==
Date: Tue, 20 May 2025 21:39:20 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] xen/domain: introduce non-x86 hardware emulation flags
Message-ID: <aCz2giS9E7FEmhxK@kraken>
In-Reply-To: <effb68bc-003c-4db2-b05e-5138142e5ec5@suse.com>
References: <20250516022855.1146121-1-dmukhin@ford.com> <20250516022855.1146121-2-dmukhin@ford.com> <effb68bc-003c-4db2-b05e-5138142e5ec5@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 87fceb50b9587fc00eb35a932d3c0b8dd7ae2399
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 05:21:06PM +0200, Jan Beulich wrote:
> On 16.05.2025 04:29, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Define per-architecture emulation_flags for configuring domain emulatio=
n
> > features.
> >
> > Print d->arch.emulation_flags from 'q' keyhandler for better traceabili=
ty
> > while debugging.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v1:
> > - dropped comments
> > ---
> >  xen/arch/arm/include/asm/domain.h   | 1 +
> >  xen/arch/ppc/include/asm/domain.h   | 1 +
> >  xen/arch/riscv/include/asm/domain.h | 1 +
> >  xen/common/keyhandler.c             | 1 +
> >  4 files changed, 4 insertions(+)
>=20
> If every arch gains identical fields, accessed from common code, why woul=
d
> those need to live in struct arch_domain?

I did it this way to keep the diff smaller, but I agree such property
makes sense to put in common domain struct. Will update in v3.

Thanks!

>=20
> Jan


