Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE3B0328A
	for <lists+xen-devel@lfdr.de>; Sun, 13 Jul 2025 19:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042370.1412521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ub0re-000233-5Y; Sun, 13 Jul 2025 17:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042370.1412521; Sun, 13 Jul 2025 17:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ub0re-00020Z-2U; Sun, 13 Jul 2025 17:51:50 +0000
Received: by outflank-mailman (input) for mailman id 1042370;
 Sun, 13 Jul 2025 17:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OXgA=Z2=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1ub0rc-00020T-0r
 for xen-devel@lists.xenproject.org; Sun, 13 Jul 2025 17:51:48 +0000
Received: from 13.mo581.mail-out.ovh.net (13.mo581.mail-out.ovh.net
 [87.98.150.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08ac2249-6012-11f0-b894-0df219b8e170;
 Sun, 13 Jul 2025 19:51:42 +0200 (CEST)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.254.36])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4bgCgd4Qhhz5xy4
 for <xen-devel@lists.xenproject.org>; Sun, 13 Jul 2025 17:51:41 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-p8m2d (unknown [10.110.164.244])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3D881C28AD;
 Sun, 13 Jul 2025 17:51:40 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.104])
 by ghost-submission-5b5ff79f4f-p8m2d with ESMTPSA
 id Vlb2Aizyc2htMyoAlauI+Q
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 13 Jul 2025 17:51:40 +0000
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
X-Inumbo-ID: 08ac2249-6012-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-104R005a3d20f4c-b3bb-42a3-a720-12c6be1af1a9,
                    2DE9640A253108A2126106CA1255C693440FBD44) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sun, 13 Jul 2025 20:51:30 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 03/22] x86/boot: add MLE header and Secure Launch
 entry point
Message-ID: <aHPyIqo7vnZo6gnc@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <916c87847457552583f1defb1aced37ea3ff58df.1748611041.git.sergii.dmytruk@3mdeb.com>
 <d9ab3803-c7e0-4a67-93e2-4f32bf9b3ad5@suse.com>
 <aGxCFFEU9BzLx96O@MjU3Nj>
 <01fe310f-a19a-4392-9215-8942c2bb9b86@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01fe310f-a19a-4392-9215-8942c2bb9b86@suse.com>
X-Ovh-Tracer-Id: 17450604132301190233
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegleejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=Ez2nQnWMNj+qRgSHD8dP/HnjZ5oq8kxPlOaOFa7lSWo=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1752429101; v=1;
 b=Y8iLF7AskaSbeMc8Z5PVHQqAz5FoOsstLrYfseSAHH0Oyuvh6oKWEtBXawT9wtE33jpAnKsl
 z2UHTiWA/IEgYrBoSPcoGrcyy0S65jhYp+enak0imxm5KoFahWsVJNdzdYqFtrwDAPLuLfzRkRd
 +ARjs/+qV862DSmcr+7frkvXajXtUixu1COx8HsPChoCwjuLY1sSKvYJXnkpq1JIDWeIhAIU2LG
 G+K+QoPc7EL75ogNGQ38nNZvxSpSYQhaYtO4hPz6N6aDUOYL5bPzI0cYEIeTdnr9oIrfwkyNYn7
 s5duOTHtdiBj6KAMqWBoDpXvhPyiX8CUXyMj3pV6CGibQ==

On Tue, Jul 08, 2025 at 09:02:55AM +0200, Jan Beulich wrote:
> >>> +        .long   0x00020002  /* MLE version 2.2 */
> >>> +        .long   (slaunch_stub_entry - start)  /* Linear entry point of MLE (SINIT virt. address) */
> >>> +        .long   0x00000000  /* First valid page of MLE */
> >>> +        .long   0x00000000  /* Offset within binary of first byte of MLE */
> >>> +        .long   (_end - start)  /* Offset within binary of last byte + 1 of MLE */
> >>
> >> Is the data here describing xen.gz or (rather) xen.efi? In the latter case,
> >> does data past _end (in particular the .reloc section) not matter here?
> >
> > Eventually, both.  EFI case deals with loaded image which, I believe,
> > should have all relocations applied at the time of measurement.
>
> But you're aware of the need to apply relocations a 2nd time? See
> efi_arch_relocate_image(), which reads .reloc contents. Hence I assume
> that section needs to be included in any measurements.

Checked map files and you're right, `__base_relocs_end` goes after
`_end`.  Will update, thanks.

> >>> +         * - DS, ES, SS, FS and GS are undefined according to TXT SDG, but this
> >>> +         *   would make it impossible to initialize GDTR, because GDT base must
> >>> +         *   be relocated in the descriptor, which requires write access that
> >>> +         *   CS doesn't provide. Instead we have to assume that DS is set by
> >>> +         *   SINIT ACM as flat 4GB data segment.
> >>
> >> Do you really _have to_? At least as plausibly SS might be properly set up,
> >> while DS might not be.
> >
> > "have to" is referring to the fact that making this assumption is forced
> > on the implementation.
>
> But that's not really true. The Xen bits could be changed if needed, e.g. ...
>
> >  LGDT instruction uses DS in the code below, hence it's DS.
>
> ... these could be made use SS or even CS.

SS can be used, but is it really any better than DS?  CS can be used for
LGDT but it won't work for modifying base address because code segments
are read-only.  Or do you mean that the comment should be made more
precise?

> >>> +         * Additional restrictions:
> >>> +         * - some MSRs are partially cleared, among them IA32_MISC_ENABLE, so
> >>> +         *   some capabilities might be reported as disabled even if they are
> >>> +         *   supported by CPU
> >>> +         * - interrupts (including NMIs and SMIs) are disabled and must be
> >>> +         *   enabled later
> >>> +         * - trying to enter real mode results in reset
> >>> +         * - APs must be brought up by MONITOR or GETSEC[WAKEUP], depending on
> >>> +         *   which is supported by a given SINIT ACM
> >>
> >> I'm curious: How would MONITOR allow to bring up an AP? That's not even a
> >> memory access.
> >
> > See patch #15.  BSP sets up TXT.MLE.JOIN and writes to an address
> > monitored by APs, this causes APs to become part of dynamic launch by
> > continuing execution at TXT-specific entry point.  It's more of a
> > redirection rather than waking up, just another case of bad terminology.
>
> Okay, (just ftaod) then my more general request: Please try to be as accurate
> as possible in comments (and similarly patch descriptions). "must be brought
> up by" is wording that I interpret to describe the action the "active" party
> (i.e. the BSP) needs to take. Whereas MONITOR, as you now clarify, is the
> action the AP needs to take (and then apparently is further required to
> check for false wakeups).
>
> Jan

I'll try and in particular will correct this comment, but I might still
miss things due to being used to them.  In general when code is
developed over the years by several people doing other projects in
between, things just end up looking weird, so please bear with me.

Regards

