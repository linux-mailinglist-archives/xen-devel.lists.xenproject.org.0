Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E2B12543
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 22:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058474.1426034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufOyw-0003JR-1U; Fri, 25 Jul 2025 20:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058474.1426034; Fri, 25 Jul 2025 20:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufOyv-0003HN-V5; Fri, 25 Jul 2025 20:25:29 +0000
Received: by outflank-mailman (input) for mailman id 1058474;
 Fri, 25 Jul 2025 20:25:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PByu=2G=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ufOyv-0003HH-3G
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 20:25:29 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b3b4c65-6995-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 22:25:18 +0200 (CEST)
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
X-Inumbo-ID: 7b3b4c65-6995-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753475117; x=1753734317;
	bh=3h+U2v9pXCWbMlFI6/Gro1AgPy7z+cSiltEdtaLqAP0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DstpRAOpw/MMqqgGdv8kSdpxSTuJ/S7UwjK3RlL1IdAoI3B5cQ7bqi5YUGIW61Y0L
	 Eg4hLpL9v0sVjn81vfTCleCsOGyFMNmxd2ytn9v4TqW4No78DkuiASx+igFVK5Cwsk
	 1nUnmA5qrQmh/avrpr4md9G7nMkrYC7s2uU3NwlIPzRxNvITfb+n9ywYIw4RY5RgnE
	 69ObEGYTwVtTuyN65J0zwcXyy2JuHi3mZRG3hD4I7uMMDUT3JOO6WMlDNG3Tz6RGsz
	 kOJQCjZRlFd+h7HctssHecDUVYGhi8b1lR6D5WaSEnFRpRDkfYSY+sggERU9MavY8a
	 FwmFsUFNyN51A==
Date: Fri, 25 Jul 2025 20:25:12 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] vpci: allow queueing of mapping operations
Message-ID: <aIPoIwHgjTDfF6c5@kraken>
In-Reply-To: <ffebedf9-c987-4f99-8ab1-de84df67d8bc@suse.com>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com> <20250723163744.13095-2-stewart.hildebrand@amd.com> <aIGh2i5+Z2CW0mPr@kraken> <aIGrin7bHQr5KvtJ@kraken> <ffebedf9-c987-4f99-8ab1-de84df67d8bc@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1f2d2b7ab52bc0fe514eb85549abf6d1cb57e7e7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 09:47:24AM +0200, Jan Beulich wrote:
> On 24.07.2025 05:42, dmkhn@proton.me wrote:
> > On Thu, Jul 24, 2025 at 03:00:46AM +0000, dmkhn@proton.me wrote:
> >> On Wed, Jul 23, 2025 at 12:37:41PM -0400, Stewart Hildebrand wrote:
> >>> Introduce vPCI BAR mapping task queue. Decouple map operation state f=
rom
> >>> general vPCI state: in particular, move the per-BAR rangeset out of
> >>> struct vpci and into the map task struct.
> >>>
> >>> This is preparatory work for further changes that need to perform
> >>> multiple unmap/map operations before returning to guest.
> >>>
> >>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>> ---
> >>> v1->v2:
> >>> * new patch
> >>>
> >>> Related: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
> >>> ---
> >>>  xen/common/domain.c       |   4 +
> >>>  xen/drivers/vpci/header.c | 197 +++++++++++++++++++++++-------------=
--
> >>>  xen/drivers/vpci/vpci.c   |   3 -
> >>>  xen/include/xen/vpci.h    |  16 +++-
> >>>  4 files changed, 139 insertions(+), 81 deletions(-)
>=20
> Why did I (and many others) end up on the To: list of this reply? (Breaks=
 my

Apologies for that, I might missed something when sending the email out.

> rules of sorting incoming mail into appropriate folders, for context.) Al=
so,
> please trim reply context suitably. Without you doing so, every single re=
ader
> will need to scroll through the entirety of a long mail just to find (in =
this
> case) a single line of reply (somewhere in the middle). Of course you
> shouldn't be too agressive with trimming, to retain proper context for yo=
ur
> reply.

Ack.

>=20
> Jan


