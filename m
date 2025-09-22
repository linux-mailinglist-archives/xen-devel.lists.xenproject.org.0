Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F84B93625
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 23:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128046.1468536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0oCN-0001bm-W0; Mon, 22 Sep 2025 21:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128046.1468536; Mon, 22 Sep 2025 21:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0oCN-0001aI-SS; Mon, 22 Sep 2025 21:35:51 +0000
Received: by outflank-mailman (input) for mailman id 1128046;
 Mon, 22 Sep 2025 21:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VlJ1=4B=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1v0oCL-0001aC-Gg
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 21:35:50 +0000
Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net
 [87.98.172.75]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 199c4069-97fc-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 23:35:46 +0200 (CEST)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.231.96])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4cVxHQ2MTFzBQYg
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 21:35:46 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-qvgpv (unknown [10.110.113.47])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 60203C28BC;
 Mon, 22 Sep 2025 21:35:45 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.104])
 by ghost-submission-5b5ff79f4f-qvgpv with ESMTPSA
 id 0zxfCjHB0WiyvBoA7uDI/g
 (envelope-from <sergii.dmytruk@3mdeb.com>); Mon, 22 Sep 2025 21:35:45 +0000
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
X-Inumbo-ID: 199c4069-97fc-11f0-9809-7dc792cee155
Authentication-Results:garm.ovh; auth=pass (GARM-104R005f2fac25f-e7ae-4f46-a376-a5805aa9834a,
                    4B26FE2FE36F17FB9A3A38C231369D4D6C4B196D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Tue, 23 Sep 2025 00:35:30 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 06/22] xen/arch/x86: reserve TXT memory during Slaunch
Message-ID: <aNHBIkJt2HvxlcMe@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <8d5ba2e7a0a8bd05bb9cdb89db3f15b831f7f4f7.1748611041.git.sergii.dmytruk@3mdeb.com>
 <45ed8b90-ce0c-419e-9c7d-2ab58ee539a2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45ed8b90-ce0c-419e-9c7d-2ab58ee539a2@suse.com>
X-Ovh-Tracer-Id: 13921189398624187481
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTERb8Oxo8S/0Wa2nJbd9TjVIDg8LDD37hmyuj6GLjx15DRn6mxqxgBNx7HotMB8TL/+r3YBEgHX1gCu7kaAmGu2jq+or1m/Uw5O95CmvMLvIXkMJwBERTHs3ErCcPL1mSvkmNdvEZCUxdu3zWVv+309zPtm4RN5knzR0ENGVtwdVe5NbFLlda/dvE8eM2lS8q3B6phSwdyCP35OhY2+JxWbt2Xvu6JDIeVoY10rQch0au4SHFVExHZFoE1NSbkQ/eHEj/cMhQHf4ApQb2FQ54tCwTkUgAP2m/Q1zUVYgA0qc56Uhlf4luGTQTkeZK/H2Y+d7lPtq79yC0OiAk3SEYwcX1mNggXzSwtU9Uf1UF1NoWH+MZRd5LNKeUEyZQT/mbvGTq9xbVRdysVo+VsdZMQnkDQBbHjXyEQGEUofkJwP0gendHoygBUz53gI+Rwxz9a1q4f7KxWHS+3nfFE4Pp6zZEmgSK/F/eS1wBc5HBPPqKanNwu8Ip01v0ZUO3jwiJL4hJusBhlRDlQKFuhoRHzlkWCZegPitIcEdRvUMbWF+TGjk4QPdeStdDknNgnWDjWVculJteiYLxJFXH86iWNoUfou0aEON7U1bmGr/NZ7wR3y0ayKXBrtEqT06LJt6le2HGdmn9Adv8/WmHm3Jwos7q3RJnih9aY5SRmTSIk64Q
DKIM-Signature: a=rsa-sha256; bh=OHyhAsh96i6iRRchQGxJi+NXgMkVdO+Sskp5R016YII=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1758576946; v=1;
 b=msPS1QfvoNk+FFXYmX4uKj2cQmwXd6PaMpvtq7RO1AkFhHg4Zo9nKGvqNePeJA61m61KD0xU
 jJxJn8YTTZo/2OGnPww8P3l/2qxZh5ou6YlAil+o+xWYWgjkIIVlxBxjuBL+YBQnCkvAWhlAJCm
 /+/TmaCLCJLNtBOi1hDZ+pThcTQw/JM1fK84n5nQUDTEkGEYx5XJzj1XnOqWNGH/s5LqsmwQ2r/
 H7bI0TTZkD/gL6UeAsXxtkATbgiZc3ld3j/xiyrYZA8LjfLu2MgnLKlz5M/nm/eMavNCMJJwnVR
 /Pd0E7yXV7QAAlyWsZuL6HYI6mdFDJm3x6FB+WIYYu1lg==

On Thu, Jul 10, 2025 at 03:00:07PM +0200, Jan Beulich wrote:
> On 30.05.2025 15:17, Sergii Dmytruk wrote:
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -106,6 +106,9 @@
> >  #define _PGC_need_scrub   _PGC_allocated
> >  #define PGC_need_scrub    PGC_allocated
> >
> > +/* How much of the directmap is prebuilt at compile time. */
> > +#define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
>
> Better 1U or even 1UL?

Will change to 1UL.  L2_PAGETABLE_SHIFT is 21, so all variants are
essentially the same.

From another email:
> Oh, also - I don't think mm.h is a good place for this. Please
> consider putting into setup.h.

Sure, mm.h just had a more suggestive name.

> > +/*
> > + * evt_log is assigned a physical address and the caller must map it to
> > + * virtual, if needed.
>
> In which case you want to use paddr_t, not void *.

Will change.

> > + */
> > +static inline void find_evt_log(const struct slr_table *slrt, void **evt_log,
> > +                                uint32_t *evt_log_size)
> > +{
> > +    const struct slr_entry_log_info *log_info;
> > +
> > +    log_info = (const struct slr_entry_log_info *)
> > +        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_LOG_INFO);
>
> In situations like this please use the less type-unsafe container_of().
> (Apparently applies also to at least one earlier patch.)

Will update all places.

> > +int slaunch_map_l2(unsigned long paddr, unsigned long size);
>
> While largely benign on x86-64, maybe better paddr_t and size_t. And then ...

OK.

> > +static uint64_t __initdata txt_heap_base, txt_heap_size;
>
> ... why suddenly uint64_t here (and then elsewhere below)?

These have 64 bits allocated for them in TXT register space.
The spec only talks about bits 31:0 (unless its a typo), so I'll add a
comment about that and use `uint32_t`.

> > +/* Mark RAM region as RESERVED if it isn't marked that way already. */
> > +static int __init mark_ram_as(struct e820map *map, uint64_t start,
> > +                              uint64_t end, uint32_t type)
> > +{
> > ...
> > +
> > +    /* E820_ACPI or E820_NVS are really unexpected, but others are fine. */
> > +    if ( map->map[i].type == E820_RESERVED ||
> > +         map->map[i].type == E820_UNUSABLE )
>
> Are you sure about permitting UNUSABLE here?

Not really, I'll drop it.

> > +        from_type = map->map[i].type;
> > +
> > +    return e820_change_range_type(map, start, end, from_type, type);
>
> Even if this function, for historic reasons, also returns int/0/1, please make
> new code with boolean results return bool/false/true.

OK.

> > +void __init txt_reserve_mem_regions(void)
> > +{
> > +    int rc;
> > +    uint64_t sinit_base, sinit_size;
> > +
> > +    /* TXT Heap */
> > +    BUG_ON(txt_heap_base == 0);
> > +    printk("SLAUNCH: reserving TXT heap (%#lx - %#lx)\n", txt_heap_base,
> > +           txt_heap_base + txt_heap_size);
>
> Please log ranges in a way that makes it unambiguous whether they're exclusive
> or inclusive (especially at the upper end).

I'll use start:end notation which I think suggests inclusive bounds.

> > +    /* TXT Private Space */
> > +    rc = mark_ram_as(&e820_raw, TXT_PRIV_CONFIG_REGS_BASE,
> > +                     TXT_PRIV_CONFIG_REGS_BASE + TXT_CONFIG_SPACE_SIZE,
> > +                     E820_UNUSABLE);
>
> Why UNUSABLE? Then, if all callers used RESERVED, this wouldn't need to be
> a function arguments anymore, and you also wouldn't need to change RESERVED
> ranges.

I think it was suggested during some review as a way to prevent an OS
from using a range (reserved ones can still get used), but I'm not sure
it even works, so will revert to always reserve memory.

> > - * Launch boot.
> > + * Launch boot at any point.
>
> This comment adjustment should probably move to where the comment is being
> introduced.

Thanks, I probably forgot to do it.

> > +struct slr_table *__init slaunch_get_slrt(void)
> > +{
> > +    static struct slr_table *slrt;
>
> __initdata?

Right, will add.

> > +    if (slrt == NULL) {
>
> Nit: Style.

Will fix.

> > +            panic("SLRT has invalid magic value: %#08x!\n", slrt->magic);
>
> While %#x is indeed the prefered form to use, in particular when padding that's
> not normally helpful, as the 0x prefix is included in the character count. And
> the value zero also ends up odd in that case, I think.

I constantly forget about prefix being included.  Won't specify width
here, it's not particularly useful in these cases.

> > +int __init slaunch_map_l2(unsigned long paddr, unsigned long size)
> > +{
> > +    unsigned long aligned_paddr = paddr & ~((1ULL << L2_PAGETABLE_SHIFT) - 1);
> > +    unsigned long pages = ((paddr + size) - aligned_paddr);
> > +    pages = ROUNDUP(pages, 1ULL << L2_PAGETABLE_SHIFT) >> PAGE_SHIFT;
>
> Nit: Blank line please between declaration(s) and statement(s).

OK.

> > +    if ( aligned_paddr + pages * PAGE_SIZE <= PREBUILT_MAP_LIMIT )
> > +        return 0;
> > +
> > +    if ( aligned_paddr < PREBUILT_MAP_LIMIT )
> > +    {
> > +        pages -= (PREBUILT_MAP_LIMIT - aligned_paddr) >> PAGE_SHIFT;
> > +        aligned_paddr = PREBUILT_MAP_LIMIT;
> > +    }
> > +
> > +    return map_pages_to_xen((uintptr_t)__va(aligned_paddr),
> > +                            maddr_to_mfn(aligned_paddr),
> > +                            pages, PAGE_HYPERVISOR);
> > +}
>
> What is being mapped here is (silently?) assumed to be below 4Gb? The
> function could anyway do with a brief comment saying what it's intended
> to do, and what assumptions it makes.
>
> It further looks as if you may be doing the same mapping multiple times,
> as you don't record what was already mapped.
>
> Jan

There is a large comment in slaunch.h which explains that we don't care
about unmapping because memory pages are being rebuilt after this
function is used.  No need to track what's being mapped for the same
reason.

DRTM data is below 4 GiB, will add BUG_ON() calls and update a comment
to state that.

Regards

