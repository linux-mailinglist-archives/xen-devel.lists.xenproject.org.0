Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35CAB6E1C
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 16:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984339.1370482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFD2g-0000eG-JA; Wed, 14 May 2025 14:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984339.1370482; Wed, 14 May 2025 14:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFD2g-0000bu-Fu; Wed, 14 May 2025 14:25:06 +0000
Received: by outflank-mailman (input) for mailman id 984339;
 Wed, 14 May 2025 14:25:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G8RE=X6=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uFD2d-0000bo-Vr
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 14:25:04 +0000
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net
 [178.33.251.173]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3899cca8-30cf-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 16:25:01 +0200 (CEST)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.17.160])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4ZyFws0LHXz29rc
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 14:25:00 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-skcxt (unknown [10.108.42.32])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 52D871FEE2;
 Wed, 14 May 2025 14:24:58 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-skcxt with ESMTPSA
 id 9crYArqnJGhoSgAA5d7/iw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 14 May 2025 14:24:58 +0000
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
X-Inumbo-ID: 3899cca8-30cf-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-113S00752e3d6b3-b61f-45c4-985f-1d64059a3d14,
                    1A2B554256F610091AB5939E0627E839E0136BDA) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Wed, 14 May 2025 17:24:50 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v2 20/22] x86/slaunch: support EFI boot
Message-ID: <aCSnskt6S2rHfUmC@MjU3Nj>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <cc6da1456dfc87ed12d78f2e47e35987ec628711.1747155790.git.sergii.dmytruk@3mdeb.com>
 <68e5f8bb-42b2-4da8-86ba-231cb5657106@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68e5f8bb-42b2-4da8-86ba-231cb5657106@gmail.com>
X-Ovh-Tracer-Id: 12086535502388966556
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdejvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedttdeufffggfeuheevfeehieeijeekkeehheefjeejvdetjedvvdegkeevgedtffenucffohhmrghinhepthhrvghntghhsghoohhtrdhorhhgnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=yh1mOuB14GzOR//G2ZQJD8Cg8dSYcEr4wknQDgmfohw=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747232701; v=1;
 b=Qf2fP+vqL7ZGsqLI1AbSlpDShDoZCTHVkuhpv0vwHLFNtXftKT/lYQQYa8wtFwEWu/MeAMuj
 zGgBZlyuoMv0y4+WhO5LYCY2dgXZ//2Ku9nCCRrySD8ih8uph2LJZLRGaM+N7IyLdBZ5BhFQ+cx
 /d4AgXl8QL9zhMTUbHbU0WtnTZvWpqNbU3rERppbLFsoY/Pnsq6/lfQOEUcI8HpFCcHq+ACXHZw
 0KBeb456ij7ZDRbE9DfSPgV4tgPgxVPL34gWWqiTKEf/WmyDE4mNbmJwT9XZ7ftHlasgUwfDBVo
 JiCw8d30f9083qW9SamkIiUVPlFKiIUVu0+3rylV2/pow==

On Tue, May 13, 2025 at 09:25:44PM -0400, Demi Marie Obenour wrote:
> On 5/13/25 1:05 PM, Sergii Dmytruk wrote:
> > When running on an EFI-enabled system, Xen needs to have access to Boot
> > Services in order to initialize itself properly and reach a state in
> > which a dom0 kernel can operate without issues.
> >
> > This means that DRTM must be started in the middle of Xen's
> > initialization process.  This effect is achieved via a callback into
> > bootloader (GRUB) which is responsible for initiating DRTM and
> > continuing Xen's initialization process.  The latter is done by
> > branching in Slaunch entry point on a flag to switch back into long mode
> > before calling the same function which Xen would execute as the next
> > step without DRTM.
>
> Depending on the bootloader for this unnecessarily ties DRTM to GRUB.
> Instead, it would be much better for Xen to be able to perform DRTM
> itself, which would allow DRTM to work without GRUB.  Pop! OS already
> uses systemd-boot and the trend seems to be from GRUB to systemd-boot.
> Furthermore, this would allow DRTM with Xen launched directly from
> the UEFI firmware.
> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)

That sentence in the commit message is worth rewording.  GRUB isn't a
requirement, any TrenchBoot-enabled bootloader (or anything that wants
to act as a bootloader) can be used.  systemd-boot could implement
Secure Launch specification [0] and start Xen/Linux/something else via
DRTM.  Usage without a real bootloader could be implemented similarly
via some EFI stub that has binaries embedded into it or that can load
them from a drive.

Mind that at least Intel and AMD DRTM implementations require a DCE [1]
binary that depends on a vendor, firmware version or a CPU generation.
So even embedding all code into every kernel-like software won't produce
self-contained DRTM-capable images.

[0]: https://trenchboot.org/specifications/Secure_Launch/
[1]: https://trenchboot.org/theory/Glossary/#dynamic-configuration-environment-dce

Regards

