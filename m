Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF062AE71AE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 23:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024145.1400160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUBT8-0001eF-Fk; Tue, 24 Jun 2025 21:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024145.1400160; Tue, 24 Jun 2025 21:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUBT8-0001cL-Co; Tue, 24 Jun 2025 21:46:18 +0000
Received: by outflank-mailman (input) for mailman id 1024145;
 Tue, 24 Jun 2025 21:46:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uUBT5-0001bx-IM
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 21:46:16 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a53bb04b-5144-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 23:46:12 +0200 (CEST)
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
X-Inumbo-ID: a53bb04b-5144-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=f7aaecxqerdwfoifvdrhwmc7iy.protonmail; t=1750801570; x=1751060770;
	bh=uUoXBx+WkAQjOqVzqs8bXZJ2hdmdHJy6BYnbKje2GKg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Vj2VYCHaCOJ3Xp1siAwm/pnRPcU3Fo/XKsLC9VbEM7zDaTQO0v2rbyBAqTeJlt9w5
	 9IY0exJ/4DmbDEPOf/14ckUQrac76+VmxeNERMX2aNQIMFR+fcoiO4ESOFY0lKTt1b
	 0njj4WwMd6+KCL6dobTXfGVQ0xtpVLQ0lrU5tvjRFaYPReAKRgxdHGlbf+0CZXhlYB
	 M2QOzhGcKZX2BlCibG1XxwpkxcA6cGrk/pnxyfX40ENhIapTPR8/Q7Krb68r2+s25e
	 4dByCYgxW7NJKjpKulywA3GFT/Ffpaqgk+rzZ2Bic9pP8smzIKPvDMQ3AjzvMq+haE
	 wJ+5H+zyFMOEA==
Date: Tue, 24 Jun 2025 21:46:07 +0000
To: "Orzel, Michal" <michal.orzel@amd.com>
From: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 04/16] arm/vpl011: use raw spin_lock_{irqrestore,irqsave}
Message-ID: <aFscml2vxO1sLzoR@kraken>
In-Reply-To: <0cfc9465-90d5-46db-88a7-ed47d0809b60@amd.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-5-dmukhin@ford.com> <08cb7878-fad7-47f4-9c91-5f866c54b1df@suse.com> <0cfc9465-90d5-46db-88a7-ed47d0809b60@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ce6b5dcc0e2aef4cb8e481eb4a9d954992306d8e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 09:50:54AM +0200, Orzel, Michal wrote:
>=20
>=20
> On 24/06/2025 07:46, Jan Beulich wrote:
> > On 24.06.2025 05:55, dmkhn@proton.me wrote:
> >> From: Denis Mukhin <dmukhin@ford.com>
> >>
> >> Replace VPL011_{LOCK,UNLOCK} macros with raw spinlock calls to improve
> >> readability.
> >
> > I'm not an Arm maintainer, so I have limited say here, but: How is this
> > improving readability? It better utilizes available local variables, ye=
s,
> > so this may be a little bit of an optimization, but otherwise to me thi=
s
> > looks to rather hamper readability.
> I agree with Jan here. I don't think it improves readability, therefore I=
 don't
> think such change is needed.

I think exdanding macros helps to understand the code since is explicitly
shows what kind of locking *really* used, so this aspect is actually gettin=
g
more readable; yes, that's a bit of more text.

But, MMIO-based flavor does not define such helpers for example, so now vUA=
RTs
follow similar coding pattern which is easy to read/follow.

>=20
> ~Michal
>=20


