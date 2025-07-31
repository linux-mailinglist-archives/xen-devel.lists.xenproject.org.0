Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C80B17799
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 23:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066436.1431669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhaQP-0005Lv-U2; Thu, 31 Jul 2025 21:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066436.1431669; Thu, 31 Jul 2025 21:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhaQP-0005JV-R2; Thu, 31 Jul 2025 21:02:53 +0000
Received: by outflank-mailman (input) for mailman id 1066436;
 Thu, 31 Jul 2025 21:02:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhaQO-0005H7-Hz
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 21:02:52 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6e94179-6e51-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 23:02:49 +0200 (CEST)
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
X-Inumbo-ID: b6e94179-6e51-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753995768; x=1754254968;
	bh=Pyt+yjTjZvwmVwUcfrsF7Lr2ji6VhDTaT8smtailbYc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GZPpUgnsRMEUL21bO+0HywzhDnFqVAax45s/Y9GIyO80x3C+N7QFMNZ2jCn24Z3Vc
	 To5DzRRHIxadcD+yfIgA4VQS3ujaTrioQeLlWTFeib1nb+lUScF4RgvatFeYBT/aNQ
	 y3N3QF4USK5Xi4tRJbKsEPNo0FRIlBhtsmZqGCj8F+DUvhK2g70X2/XB4znthf7ERh
	 JbTF4KZytBHQOvSgrpjwwlPV6D7CCXIPRyaMxBg1OlcUPQqUL3wMKmP1RqD/cGyLU1
	 WBg/NUYZ03uyqVsKYhcmvnwSMnTeNfE1KCl5XtCT+HYRnwLXXVEF5mCX74rZktBcns
	 oDEib0jbTrycA==
Date: Thu, 31 Jul 2025 21:02:44 +0000
To: "Orzel, Michal" <michal.orzel@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1 02/16] arm/vpl011: move DT node parsing to PL011 emulator code
Message-ID: <aIvZ8P+Jwe/tzOY9@kraken>
In-Reply-To: <c88b9817-3976-4fb2-9f7b-d69092ce181d@amd.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-3-dmukhin@ford.com> <c0b76bb4-9330-4f54-8314-fa2c2efa8ee8@amd.com> <aFsfCuh9Xrkgxmml@kraken> <c88b9817-3976-4fb2-9f7b-d69092ce181d@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e1a258683af1e2e39463a236631c69a5ecd74d4e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 08:57:27AM +0200, Orzel, Michal wrote:
>=20
>=20
> On 24/06/2025 23:56, dmkhn@proton.me wrote:
> > On Tue, Jun 24, 2025 at 09:49:39AM +0200, Orzel, Michal wrote:
> >>
> >>
> >> On 24/06/2025 05:55, dmkhn@proton.me wrote:
> >>> From: Denis Mukhin <dmukhin@ford.com>
> >>>
> >>> Move vpl011 DT node parsing from common Arm code to PL011 emulator co=
de.
> >> It's not parsing, it's DT node generation.
> >
> > Oh, that's right, overlooked.
> > Thanks, will update.
> >
> >>
> >> We usually keep all the DT node generation functions in one place. I'm=
 not sure
> >> if we want to move them to respective drivers (i.e. vpl011 to vpl011.c=
, gicv3 to
> >> gicv3.c, etc.). Not sure what other maintainers think.
> >>
> >>>
> >>> While doing it pick the generic name vuart_add_fwnode() for DT parser=
 function
> >> What 'fw' stands for? Firmware? This function creates DT node for domU=
, so it
> >> should better be sth like vuart_add_dt_node().
> >
> > 'fw' stands for 'firmware'.
> >
> > It should be some generic name because the function will be used on x86=
 to
> > generate to generate the guest ACPI tables.
> I see but maybe vuart_add_node() would be a better choice here.

Ack.

>=20
> ~Michal
>=20


