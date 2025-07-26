Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A46B12C7C
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 22:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1059599.1426389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uflwc-0001bh-ET; Sat, 26 Jul 2025 20:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1059599.1426389; Sat, 26 Jul 2025 20:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uflwc-0001Zf-Bp; Sat, 26 Jul 2025 20:56:38 +0000
Received: by outflank-mailman (input) for mailman id 1059599;
 Sat, 26 Jul 2025 20:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+vUE=2H=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uflwZ-0001ZZ-Mg
 for xen-devel@lists.xenproject.org; Sat, 26 Jul 2025 20:56:36 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01308b47-6a63-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 22:56:30 +0200 (CEST)
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
X-Inumbo-ID: 01308b47-6a63-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753563388; x=1753822588;
	bh=7leM1+6Up69PzZurIBAtjIl8O0/TSlNZXhWZcqOyIaM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=awjpVqkV9YNMTAVtrDu0Ir/GFKUKdtbOa88LlP9JRR50nO4sFPUgKx6MiamTemHp+
	 6qxM+Iigho2uMzha16fJqX84PBI2onZHkN/oac00UWYtoY/VaeZ9O0aHdL2SBlP5hs
	 +I93hXEFvDPQghmhnuseGx+RT3D7KlWvasmoTHtExIeLfwpkWcgLn2d+yy8BgpvgmC
	 +92urlxmi9dlKdF74GEoyvjlSYyoafiFa0NPT9moy+YNRYtB+n7KMwgo0L0d8A+j2s
	 WLTnHYt24FHW1dIaA9T46OgDdINnB5NyxKRofJlRKNgkUMU0GkSrD+0y9x+AN10d8Z
	 FS7RoTuwzAItg==
Date: Sat, 26 Jul 2025 20:56:23 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1] xen/console: remove __printk_ratelimit()
Message-ID: <aIVA8nkV7XKWxyb5@kraken>
In-Reply-To: <290ae958-4fba-42d8-a64b-d44845b85491@xen.org>
References: <20250725212235.753363-1-dmukhin@ford.com> <290ae958-4fba-42d8-a64b-d44845b85491@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5cbc814a6a824045b9d4877b796aed5a861358aa
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 10:20:58AM +0100, Julien Grall wrote:

Hi Julien,

Thanks for your feedback!

I imagined that kind of a change may raise a question about importance of
doing it.

> Hi Denis,
>=20
> On 25/07/2025 22:24, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > __printk_ratelimit() is never used outside of the console driver.
> > Remove it from the lib.h and merge with the public printk_ratelimit().
>=20
> Is this solving any sort of violation? Asking because even if the
> function is only used by one caller, I could see a benefit to be able to
> use different value for the ratelimit. So I leaning towards keep the
> code as-is.

The change is not solving any sort of violation, but simplifies a code path
slightly since fine-grain rate-limit controls are not exported/used anywher=
e
outside of the console driver. At this time, the purpose is a tiny cleanup.

TL;DR

I stepped over that code during addressing feedback for another change for
domain prefixes, where I'm experimenting with re-using printk-facilities fr=
om
guest_console_write(). This code showed up wrt rate-limiting for dom0's
messages. Just in case, experimental branch is here:
   https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/console-fixes

I cannot anticipate not exposing rate-limiting timing controls in embedded
certifiable setup, perhaps there will be a legit use case in production
deployment.

But currently rate-limiting configuration happens at boot time only. The fa=
ct
that rate-limiting has not been touched since its introduction in 2006
    26cf03554a75 ("[XEN] Implement rate-limited logging.")
made me think that there's no intent to plumb any rate-limiting controls at
the run-time e.g. via keyhandler or a even hypercall.

Which resulted in this submission.

>=20
> Cheers,
>=20
> --
> Julien Grall
>=20

Thanks,
Denis


