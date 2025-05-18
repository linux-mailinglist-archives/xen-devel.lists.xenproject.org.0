Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58A5ABB015
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 13:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988994.1373342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcFb-00082o-Ks; Sun, 18 May 2025 11:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988994.1373342; Sun, 18 May 2025 11:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcFb-00080c-HW; Sun, 18 May 2025 11:32:15 +0000
Received: by outflank-mailman (input) for mailman id 988994;
 Sun, 18 May 2025 11:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=247E=YC=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uGcFa-00080S-4h
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 11:32:14 +0000
Received: from 20.mo550.mail-out.ovh.net (20.mo550.mail-out.ovh.net
 [188.165.45.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbc2369b-33db-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 13:32:09 +0200 (CEST)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.176.14])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4b0dvX5QlNz1V68
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 11:32:08 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-wr8zr (unknown [10.110.188.199])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 900C21FDB2;
 Sun, 18 May 2025 11:32:07 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-wr8zr with ESMTPSA
 id UpEeGTfFKWiFMAUAM6NgiA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 18 May 2025 11:32:07 +0000
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
X-Inumbo-ID: bbc2369b-33db-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-113S007347eb199-d7a0-4959-83eb-6c62728e0a82,
                    6FCDE7FC3973969C7D59E240015AF9737BA2D6B5) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sun, 18 May 2025 14:32:04 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 09/22] xen/lib: add implementation of SHA-1
Message-ID: <aCnFNOO8TtlthqnU@MjU3Nj>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <7fcab16c3efbc0eb28e0f8ec0d9c9d3188881ad4.1747155790.git.sergii.dmytruk@3mdeb.com>
 <fdc5b712-4c93-42b4-a1b7-d992c720c387@citrix.com>
 <aCjSz6QXHiFtAjFP@MjU3Nj>
 <1e5f21df-2108-47f1-a59c-7869c6edc447@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e5f21df-2108-47f1-a59c-7869c6edc447@suse.com>
X-Ovh-Tracer-Id: 14211108627590460561
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepueeiudeuveffkeetveelgeehhffgheehgfegjeekleffgeelffetjeefieetleeknecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=A3QBxkKpVCVjgwuef/9wAIZTtHsvjnR1T9c1lYRISTI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747567928; v=1;
 b=cgZGxeFjxUY5PPbRa4TfP61GFw3RDfeu7l5drnUWaql8XauzkCPQEZx607CjAW3rLfK9Y5Cb
 b0ODfbM/ae7RtAApKZhLC/NHlES7eTQgWHwRgeeAxEMdHfj87grecNiYTSygqHx3UkJCdPxn2zp
 qPnV0Wq7Hcyq7CVNYVPRtr9h8Rm8n1ZPyMzcj4Z8Nb4SnTyWYODzARleW1FZburvky3B8/uHS26
 UL/0FsTFA++k78yp4ww3gsbr6q4YlMIcCarF9jACqR9/UQ8C0ueYQl6bVXtptKDbidloVhtNaZC
 kSEMrQ+6P/4peP4i2mvOHkM2riyXcqLA/Jp2tk8hp1tqQ==

On Sun, May 18, 2025 at 10:34:07AM +0200, Jan Beulich wrote:
> On 17.05.2025 20:17, Sergii Dmytruk wrote:
> > On Wed, May 14, 2025 at 05:58:59PM +0100, Andrew Cooper wrote:
> >> Please crib from sha2.h as much as you can.  Use xen/types.h, drop the
> >> double underscore in the guard, and provide a link to the spec.
> >
> > Until yesterday CODING_STYLE instructed to have 2 underscores, so I
> > thought sha2.h is outdated.  I'll switch to <xen/types.h>, although it's
> > overkill there and only grows header dependency tree (it also brings
> > extra symbols thus hiding missing includes elsewhere).
>
> If xen/stdint.h is sifficient here, I'm pretty sure Andrew would be okay
> with its use instead of xen/types.h.
>
> Jan

Oh, there is size_t, so <xen/types.h> is actually appropriate.

Thanks

