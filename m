Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4EBAB8998
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 16:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985692.1371600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFZk1-0000qe-Cv; Thu, 15 May 2025 14:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985692.1371600; Thu, 15 May 2025 14:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFZk1-0000oO-9L; Thu, 15 May 2025 14:39:21 +0000
Received: by outflank-mailman (input) for mailman id 985692;
 Thu, 15 May 2025 14:39:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZW7U=X7=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uFZjz-0000nA-1X
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 14:39:20 +0000
Received: from 13.mo584.mail-out.ovh.net (13.mo584.mail-out.ovh.net
 [178.33.251.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f55a715-319a-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 16:39:14 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.17.183])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4ZytBp0Cffz1XWN
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 14:39:13 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-qbmbj (unknown [10.111.182.20])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9C1F81FEBD;
 Thu, 15 May 2025 14:39:11 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-5b5ff79f4f-qbmbj with ESMTPSA
 id lBGEFI/8JWh3AwEA6WhilQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Thu, 15 May 2025 14:39:11 +0000
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
X-Inumbo-ID: 5f55a715-319a-11f0-9eb6-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-101G0046098e410-b8c9-4abb-8407-df55a892e50a,
                    387E45D97A4461B8A9D628297587A76108926964) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Thu, 15 May 2025 17:39:05 +0300
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
Message-ID: <aCX8ibm3qbZo-C_x@MjU3Nj>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <cc6da1456dfc87ed12d78f2e47e35987ec628711.1747155790.git.sergii.dmytruk@3mdeb.com>
 <68e5f8bb-42b2-4da8-86ba-231cb5657106@gmail.com>
 <aCSnskt6S2rHfUmC@MjU3Nj>
 <1ba433ce-44b6-4d70-a232-f5f83f1fbaf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ba433ce-44b6-4d70-a232-f5f83f1fbaf8@gmail.com>
X-Ovh-Tracer-Id: 18199327573151233180
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddtudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedttdeufffggfeuheevfeehieeijeekkeehheefjeejvdetjedvvdegkeevgedtffenucffohhmrghinhepthhrvghntghhsghoohhtrdhorhhgnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekgegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=mALPy3UReUIH7bnvPUR5x/ZByWKTIsJbX7SfOPJTfdY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747319954; v=1;
 b=duAciFfM5lzWmfq7+AS7of3ED1XIV3DFWBvbJ/z6jz0TNaUBmge5Uqw+ynw5ld93usbpo+G3
 AMmG2d/hqZJoyKhq+Yo36t1YubcOQDehI79Z6UrE5htULqY4iBo8JFPHIJNS1tZQ4oHIHwCWd6U
 RVF0q4zm7NA4LG8hf3cEceJabKFY0kUm3z9/cZixtwOgWSmPT17JCL/NFQUXW1+G3GGm1I5/uzj
 e+FsIeeDNasoISXO46Sv8TTlObOWtjTVfL0tOQSyy89kGuMtloX3BeSNjrILjEjRfmMRnDDApKI
 RrK0lWtE92lzwEhwuIWCB5YFnvr6qSauqbdLvNAPBmiXA==

On Wed, May 14, 2025 at 11:58:49AM -0400, Demi Marie Obenour wrote:
> On 5/14/25 10:24 AM, Sergii Dmytruk wrote:
> > On Tue, May 13, 2025 at 09:25:44PM -0400, Demi Marie Obenour wrote:
> >> On 5/13/25 1:05 PM, Sergii Dmytruk wrote:
> > That sentence in the commit message is worth rewording.  GRUB isn't a
> > requirement, any TrenchBoot-enabled bootloader (or anything that wants
> > to act as a bootloader) can be used.  systemd-boot could implement
> > Secure Launch specification [0] and start Xen/Linux/something else via
> > DRTM.  Usage without a real bootloader could be implemented similarly
> > via some EFI stub that has binaries embedded into it or that can load
> > them from a drive.
> >
> > Mind that at least Intel and AMD DRTM implementations require a DCE [1]
> > binary that depends on a vendor, firmware version or a CPU generation.
> > So even embedding all code into every kernel-like software won't produce
> > self-contained DRTM-capable images.
> >
> > [0]: https://trenchboot.org/specifications/Secure_Launch/
> > [1]: https://trenchboot.org/theory/Glossary/#dynamic-configuration-environment-dce
>
> Why is it better for Xen to rely on the bootloader to implement the
> specification, instead of xen.efi itself implementing secure launch?
> That would make secure launch significantly more usable.  For an
> initial implementation it makes sense to rely on the bootloader, but
> in the future it would be better for xen.efi to have its own
> implementation.

That specification is not exactly about DRTM, which is specified by CPU
vendors.  It's about an interface between what starts DRTM (a bootloader
in a broad sense) and what uses on it (kernels, hypervisors, etc.).  If
the whole process is performed by a single entity, there is no need
for the specification.

What starts DRTM needs to ensure the system supports DRTM and should
then put it in a state suitable for DRTM start.  What uses DRTM
needs to know much less and can heavily rely on the information from a
bootloader.  Ideally, Xen/Linux would be able to handle DRTM uniformly
on different hardware, but the reality is that abstracting away some
differences is nearly impossible.

> Is the code being added to GRUB for secure launch under a license
> that would allow it to be used in Xen as well?

GRUB's changes are GPL3-or-later, but that shouldn't be a problem,
authors will likely agree to relicense it as GPL2-or-later for Xen.

Regards

