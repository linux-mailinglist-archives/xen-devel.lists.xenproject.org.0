Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2440A9A05F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 07:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965783.1356205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7osP-00027J-FO; Thu, 24 Apr 2025 05:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965783.1356205; Thu, 24 Apr 2025 05:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7osP-00025B-CC; Thu, 24 Apr 2025 05:11:57 +0000
Received: by outflank-mailman (input) for mailman id 965783;
 Thu, 24 Apr 2025 05:11:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zow=XK=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7osM-000255-9I
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 05:11:55 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9faf1985-20ca-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 07:11:48 +0200 (CEST)
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
X-Inumbo-ID: 9faf1985-20ca-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745471506; x=1745730706;
	bh=rWWtHvNVY1LG4DRwU/05iAowOTcIQPz03VIwuRFxkV0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=lEtPpZkcCwWzi7ADFCPSsJjgJlXl2QWyQa9K6bj5nJCNU8Lu/p2VKSXKEuch6oZrA
	 6btInHKRncIYYRruwvB79nDqhmGcH/+xuI8TsQ8DBJXSfwvKQYXT1wVQMouMF3JIcg
	 vTM4zLjyldTupY6i038J8YM3zEOWFpe/pjpagK6Oj3K6f+bDySeOWT4E3HxRVnliXL
	 0NcHP/LfHXTIexXENGOCfZmCdRgyhmNAdZ4+9XXmyeDJeXl3xL4nEkAKsxMcUWW+Re
	 sJ0mEpvvQF8E68mqUkSSmebBHTzo4fyCvpiJVlAZtVsQZs0KSVRqx6to/BwnzHqKV4
	 b+Ubs880gsaCw==
Date: Thu, 24 Apr 2025 05:11:40 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 07/13] x86/hyperlaunch: obtain cmdline from device tree
Message-ID: <aAnICErJs5m0StLh@starscream>
In-Reply-To: <4813aeb3-72c6-4705-8591-1af63ec05ae8@suse.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-8-agarciav@amd.com> <aALX/NgsSi5sTyz3@kraken> <D9E1DIGCGP1O.QQ1KK0P3NX0K@amd.com> <4813aeb3-72c6-4705-8591-1af63ec05ae8@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 662deea00ef6b1c44f744e7c8238a5e4f712a082
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 03:08:18PM +0200, Jan Beulich wrote:
> On 23.04.2025 15:01, Alejandro Vallejo wrote:
> > On Fri Apr 18, 2025 at 11:53 PM BST, dmkhn wrote:
> >> On Thu, Apr 17, 2025 at 01:48:29PM +0100, Alejandro Vallejo wrote:
> >>> --- a/xen/common/domain-builder/fdt.h
> >>> +++ b/xen/common/domain-builder/fdt.h
> >>> @@ -9,6 +9,30 @@ struct boot_info;
> >>>  /* hyperlaunch fdt is required to be module 0 */
> >>>  #define HYPERLAUNCH_MODULE_IDX 0
> >>>
> >>> +static inline int __init fdt_cmdline_prop_size(const void *fdt, int =
offset)
> >>> +{
> >>> +    int ret;
> >>> +
> >>> +    fdt_get_property_by_offset(fdt, offset, &ret);
> >>
> >> Perhaps something like
> >>
> >>        (void)fdt_get_property_by_offset...
> >>
> >> since there's no need to check the return value?
> >
> > I vaguely seem to remember doing something like that a few years ago
> > (because it does show intent and many linters require it) and being tol=
d
> > not to. But maybe I misremember. I'm definitely happy to use that
> > convention here and later unless someone pushes back for some reason.
>=20
> Unless we settle on the need for such for Misra's sake, I'd like to ask
> to avoid them. We generally try to avoid casts as much as possible. We
> then also shouldn't add ones like suggested here.

Ack.

>=20
> Jan


