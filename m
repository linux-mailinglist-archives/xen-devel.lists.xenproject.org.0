Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8684EB17775
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 22:56:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066425.1431649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhaJa-00037f-2j; Thu, 31 Jul 2025 20:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066425.1431649; Thu, 31 Jul 2025 20:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhaJZ-00035I-Vl; Thu, 31 Jul 2025 20:55:49 +0000
Received: by outflank-mailman (input) for mailman id 1066425;
 Thu, 31 Jul 2025 20:55:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhaJZ-00035C-0B
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 20:55:49 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbcf2cc1-6e50-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 22:55:48 +0200 (CEST)
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
X-Inumbo-ID: bbcf2cc1-6e50-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753995346; x=1754254546;
	bh=7Jd/sTom8gNTJYF7u4CfXPKz+Ry3XHdbEEkv+i8dQAY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jXq2oF0m9dud4snEBzsxIoKpK4kdrpQwUKuxbpvpqXcttA43VVXB/IRm7YNFoy8qd
	 5n5+x7D41hNpjrycKPcIpnZ3SeXhBnqB4Smu1VJurHTHJckJNE5hNwZSY161ZOBQ+S
	 5MHfqFPqk6aNJXKnLntGniExrHCxOjVUd5tTGCD891K0iUtbjouN8FXRYJtxA62VIO
	 5xRt+bjUIgco1FCizeitoIUyOhphUPDxbmTvRKGJAzsnnJDNsqeGc1VnQtE/lnM+8p
	 96/nZ64ThlyZLtzGDhWAXZ7kzGdd5fy4Cik+B4tpPrs09NJIOKdatcpwGGCEpmROw8
	 0200Wpbw7xCBg==
Date: Thu, 31 Jul 2025 20:55:43 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 12/16] xen/domain: introduce domain-emu.h
Message-ID: <aIvYSn2ZwyWTwIzm@kraken>
In-Reply-To: <33f98fe5-9b29-43e4-a87d-19eafb30f281@suse.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-13-dmukhin@ford.com> <33f98fe5-9b29-43e4-a87d-19eafb30f281@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e92db16b3077e71aaa7b81096b1b0f3964c251bf
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Wed, Jul 09, 2025 at 04:57:44PM +0200, Jan Beulich wrote:
> On 24.06.2025 05:56, dmkhn@proton.me wrote:
> > @@ -458,16 +459,16 @@ struct arch_domain
> >  } __cacheline_aligned;
> >
> >  #ifdef CONFIG_HVM
> > -#define X86_EMU_LAPIC    XEN_X86_EMU_LAPIC
> > -#define X86_EMU_HPET     XEN_X86_EMU_HPET
> > -#define X86_EMU_PM       XEN_X86_EMU_PM
> > -#define X86_EMU_RTC      XEN_X86_EMU_RTC
> > -#define X86_EMU_IOAPIC   XEN_X86_EMU_IOAPIC
> > -#define X86_EMU_PIC      XEN_X86_EMU_PIC
> > -#define X86_EMU_VGA      XEN_X86_EMU_VGA
> > -#define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
> > -#define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
> > -#define X86_EMU_VPCI     XEN_X86_EMU_VPCI
>=20
> The old code deliberately used values from the public interface.

In next version I am building, I moved all of XEN_X86_EMU_XXX definitions a=
s
is to a new public header under include/public/xen-emu.h:

  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/9b0bc5ffa57101=
14df8523ae2aa7680b7c6f0942

That looks less invasive.

Will that work?

There should be a common header with emulation flags somewhere, since
there will be SBSA and hwdom vUART definitions there.

--
Denis


