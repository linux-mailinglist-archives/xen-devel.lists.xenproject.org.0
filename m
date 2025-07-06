Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DDEAFA805
	for <lists+xen-devel@lfdr.de>; Sun,  6 Jul 2025 23:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034962.1407261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYXL6-0002DM-U8; Sun, 06 Jul 2025 21:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034962.1407261; Sun, 06 Jul 2025 21:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYXL6-0002BR-RE; Sun, 06 Jul 2025 21:56:00 +0000
Received: by outflank-mailman (input) for mailman id 1034962;
 Sun, 06 Jul 2025 21:56:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHaa=ZT=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uYXL4-0002BL-S5
 for xen-devel@lists.xenproject.org; Sun, 06 Jul 2025 21:56:00 +0000
Received: from 3.mo576.mail-out.ovh.net (3.mo576.mail-out.ovh.net
 [188.165.52.203]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc0fdb6c-5ab3-11f0-b894-0df219b8e170;
 Sun, 06 Jul 2025 23:55:52 +0200 (CEST)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.37.133])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4bb1Qb6gclz60yF
 for <xen-devel@lists.xenproject.org>; Sun,  6 Jul 2025 21:55:51 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-ngxnr (unknown [10.111.182.85])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 979A6C28C9;
 Sun,  6 Jul 2025 21:55:50 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-5b5ff79f4f-ngxnr with ESMTPSA
 id 98ehFObwamjoRwEAG4uBqg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 06 Jul 2025 21:55:50 +0000
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
X-Inumbo-ID: fc0fdb6c-5ab3-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-103G00529bc5881-b1b7-4d53-9f03-bea3109fd8b7,
                    FF3279A5BAD606DDEEDDFD371ACA0117F5CC5AB0) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Mon, 7 Jul 2025 00:55:40 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 08/22] x86/slaunch: restore boot MTRRs after Intel TXT
 DRTM
Message-ID: <aGrw3G1Y8wztcrMW@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5b6b9bf165a4fd9444dc53848fb8faa2cea30781.1748611041.git.sergii.dmytruk@3mdeb.com>
 <d18fd33e-da42-4f05-a6f1-c03e5f2f34de@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d18fd33e-da42-4f05-a6f1-c03e5f2f34de@suse.com>
X-Ovh-Tracer-Id: 17358843292015113305
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeftddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=jDAsRjT3us64LPQ1XZlJg5V2Pnzln+WaZEdQb57WVWw=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1751838952; v=1;
 b=Kcr7fuL8ipOyeiX+ZaRlzOjqY5QJd3WLZ3dBqwWt5nW1bJMavvnnFL4gK+juqQ9WLiMpzJUF
 ZnhPrUqyyBUFcOeTKFj0ApMg6gHK0gSmQMhPbAf/POqSRE2gkUdq9f4hyOiVLLzWH12leOvUk2v
 t2dj1UuP7ESjIZ3D+N3vSjGx6WYaGyRCuTh2iZQoS0T/zavbqIiIN2F/xor3Kfw+eT5v4Q5kfcP
 HrmLCMjKYnoxp12Q8kyLUgMAueH5X6fqJ3PG0d9+RBgIaIgwiq+LbwWkDroY+OdXdoK+6zZO0k1
 XT4FjviEurz6Ys/WwvaeM1Xw7H4z70CCRuxeXmRRj5d0w==

On Wed, Jul 02, 2025 at 05:11:26PM +0200, Jan Beulich wrote:
> On 30.05.2025 15:17, Sergii Dmytruk wrote:
> > @@ -442,6 +444,9 @@ static uint64_t __init mtrr_top_of_ram(void)
> >      ASSERT(paddr_bits);
> >      addr_mask = ((1ULL << paddr_bits) - 1) & PAGE_MASK;
> >
> > +    if ( slaunch_active )
> > +        txt_restore_mtrrs(e820_verbose);
>
> How did you pick this call site? Besides it being unrelated to the purpose of
> the function, we may not even make it here (e.g. when "e820-mtrr-clip=no" on
> the command line). Imo this wants to go in the caller of this function,
> machine_specific_memory_setup(). Or you want to reason about this placement in
> the description.

I think the motivation behind using this location was related to
printing debug information in a fitting place.  The possible early exit
definitely ruins everything here, thanks.  Will move at least to the
caller.

> > --- a/xen/arch/x86/include/asm/intel-txt.h
> > +++ b/xen/arch/x86/include/asm/intel-txt.h
> > @@ -426,6 +426,9 @@ void txt_map_mem_regions(void);
> >  /* Marks TXT-specific memory as used to avoid its corruption. */
> >  void txt_reserve_mem_regions(void);
> >
> > +/* Restores original MTRR values saved by a bootloader before starting DRTM. */
> > +void txt_restore_mtrrs(bool e820_verbose);
>
> This parameter name is, when the header is used from e820.c, going to shadow the
> static variable of the same name there. Misra objects to such. But the parameter
> doesn't really have a need for having the e820_ prefix, does it?

I don't think it's possible for a parameter in a declaration to shadow
anything, but the prefix is indeed unnecessary.

> > +        for ( i = 0; i < (uint8_t)mtrr_cap; i++ )
> ...
> > +    if ( (mtrr_cap & 0xFF) != intel_info->saved_bsp_mtrrs.mtrr_vcnt )
>
> Seeing this and ...
>
> > +    {
> > +        printk("Bootloader saved %ld MTRR values, but there should be %ld\n",
> > +               intel_info->saved_bsp_mtrrs.mtrr_vcnt, mtrr_cap & 0xFF);
> > +        /* Choose the smaller one to be on the safe side. */
> > +        mtrr_cap = (mtrr_cap & 0xFF) > intel_info->saved_bsp_mtrrs.mtrr_vcnt ?
>
> ... this vs ...
>
> > +                   intel_info->saved_bsp_mtrrs.mtrr_vcnt : mtrr_cap;
> > +    }
> > +
> > +    def_type = intel_info->saved_bsp_mtrrs.default_mem_type;
> > +    pausing_state = mtrr_pause_caching();
> > +
> > +    for ( i = 0; i < (uint8_t)mtrr_cap; i++ )
>
> ... this (and others): Please be consistent in how you access the same piece
> of data.

Will make it consistent.

> > +    {
> > +        base = intel_info->saved_bsp_mtrrs.mtrr_pair[i].mtrr_physbase;
> > +        mask = intel_info->saved_bsp_mtrrs.mtrr_pair[i].mtrr_physmask;
> > +        wrmsrl(MSR_IA32_MTRR_PHYSBASE(i), base);
> > +        wrmsrl(MSR_IA32_MTRR_PHYSMASK(i), mask);
> > +    }
> > +
> > +    pausing_state.def_type = def_type;
> > +    mtrr_resume_caching(pausing_state);
> > +
> > +    if ( e820_verbose )
> > +    {
> > +        printk("Restored MTRRs:\n"); /* Printed by caller, mtrr_top_of_ram(). */
>
> What's the comment supposed to be telling the reader? Perhaps this is related to ...
>
> > +        /* If MTRRs are not enabled or WB is not a default type, MTRRs won't be printed */
>
> ... what this comment says, but then the earlier comment is still confusing (to me
> at least). This latter comment says all that's needed, I would say.
>
> Jan

That comment is why I think output was meant to nest into existing debug
output, not sure about its intended meaning though.  Will drop.

Regards

