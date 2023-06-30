Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4197444D2
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 00:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557645.871181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFMbh-0000tW-4e; Fri, 30 Jun 2023 22:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557645.871181; Fri, 30 Jun 2023 22:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFMbh-0000qH-0r; Fri, 30 Jun 2023 22:28:49 +0000
Received: by outflank-mailman (input) for mailman id 557645;
 Fri, 30 Jun 2023 22:28:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hAh9=CS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qFMbf-0000qB-0N
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 22:28:47 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77af673a-1795-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 00:28:43 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7758A5C1A7F;
 Fri, 30 Jun 2023 18:28:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 30 Jun 2023 18:28:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jun 2023 18:28:39 -0400 (EDT)
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
X-Inumbo-ID: 77af673a-1795-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1688164121; x=1688250521; bh=6YaatSmBCUiL1gGEXqd7AIO0V9nDJG1EhRM
	aovFJeg0=; b=fAxYdIefYw98uiAaOaofql5M6+W0zYc72d2rvAxUP2bG6bXBFvP
	jnQKrctAJ86rzU6rjoMsMHVeEB4Jp3qkKySzTL0mEumpZWc7Pd1yGulfERq6yzg8
	NKa3PB9iNH0WXxMDoHEzzt6J2h10tVIpB7vmdfFduzbUb3LAVydjUVsCe/eR95Ml
	8p2T9vQ5IUuNLxJ7mh9SehLnQI7vJEBktSvPp5y6+xIU0ayXrTo8ktiA5bGYfbTP
	brqkLEg0qr4ykUCWAQk3qanOAVj72IkpyFIRuom/AJ5UrcHSSy+fnCxnIr6pZHdV
	riTerMUq2OvulV4iPwwduprWhBIY0yUA5/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688164121; x=1688250521; bh=6YaatSmBCUiL1
	gGEXqd7AIO0V9nDJG1EhRMaovFJeg0=; b=kVddUiUqZDZ0tAgfIhzyuqHIXdQlf
	3IjgjPzmTm2iNnVtk152wV+3ITX+obTdqgQKZEecvRD//LB7UpjHaX97jngm2Sdt
	AvLssyx0djLQ/oCxSqhK3gEy2ak37X5qNN521/nzMDBxxpFOW26WAuFGhFQ1dCqB
	qhipy8c+Yoybs47WI9B3I4SmFdsb2BKyoE+2V+1lJ1Gc8CztSSLBIwC0KXwvs5nv
	H24ty/eOA+2Qa6/zHQn/9JeC5oOIGZHED+v4Jsvmwjmm7ZFhiKBxB3FM+3wqSo3A
	pYk5bqPqyVJpPod7VXSaWTF9uMaE1s1iggDwGimmvV7+w3dIFngqVCFrA==
X-ME-Sender: <xms:GFefZBzzSfZ1fYNy0SzrB7QIanaQjF6BvSCYEVmQTi2FkWKgwxW1nA>
    <xme:GFefZBTHrfvz2OEfMTuBYpc1Gd_zjsmaJtjSyJDbwUccr7d6-ieOmAGTcc7s5vDzn
    Kyacv56LFuQUQ>
X-ME-Received: <xmr:GFefZLUTqh867HViE-1OvvTx1Wg6ub6kSZQXuWz4s6ZFaqxB6fuGTCfhR6684vvI8VqpT9R7xA3oOzymAtQLaDjwsmtskBL0jSc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdejgddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:GFefZDhu3q4uMF5UGp6YyVjefM27uKTa-fxVAQWV4K0V_MRmaqJVoQ>
    <xmx:GFefZDACn7Pzoi1k_xOINI29lpCs71y11j_QE6Oz0zu7uMOmSrjlow>
    <xmx:GFefZMKq0Xviji6SUs9y82vYPX9XWxQTzLNlul-u6N5p3j0W4LlrpA>
    <xmx:GVefZKPmx0CkUTjk9Sfypr1oc4QXJdXguMm4Xdvy3Y7EOw5Y5_uPvg>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 1 Jul 2023 00:28:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <ZJ9XFdGhxyKLY3fm@mail-itl>
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <def382a6481a9d1bcc106200b971cd5b0f3d19c1.1683321183.git-series.marmarek@invisiblethingslab.com>
 <f3531050-fb31-2d9e-f3dd-2d310dc7c5ec@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A6Nppku0Kd1gyEHN"
Content-Disposition: inline
In-Reply-To: <f3531050-fb31-2d9e-f3dd-2d310dc7c5ec@suse.com>


--A6Nppku0Kd1gyEHN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 1 Jul 2023 00:28:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] x86/mm: add API for marking only part of a MMIO
 page read only

On Tue, May 30, 2023 at 01:56:34PM +0200, Jan Beulich wrote:
> On 05.05.2023 23:25, Marek Marczykowski-G=C3=B3recki wrote:
> > In some cases, only few registers on a page needs to be write-protected.
> > Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> > PBA table (which doesn't need to span the whole table either), although
> > in the latter case the spec forbids placing other registers on the same
> > page. Current API allows only marking whole pages pages read-only,
> > which sometimes may cover other registers that guest may need to
> > write into.
> >=20
> > Currently, when a guest tries to write to an MMIO page on the
> > mmio_ro_ranges, it's either immediately crashed on EPT violation - if
> > that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
> > from userspace (like, /dev/mem), it will try to fixup by updating page
> > tables (that Xen again will force to read-only) and will hit that #PF
> > again (looping endlessly). Both behaviors are undesirable if guest could
> > actually be allowed the write.
> >=20
> > Introduce an API that allows marking part of a page read-only. Since
> > sub-page permissions are not a thing in page tables (they are in EPT,
> > but not granular enough), do this via emulation (or simply page fault
> > handler for PV) that handles writes that are supposed to be allowed.
> > The new subpage_mmio_ro_add() takes a start physical address and the
> > region size in bytes. Both start address and the size need to be 8-byte
>=20
> 8-byte (aka qword) here, but ...
>=20
> > aligned, as a practical simplification (allows using smaller bitmask,
> > and a smaller granularity isn't really necessary right now).
> > It will internally add relevant pages to mmio_ro_ranges, but if either
> > start or end address is not page-aligned, it additionally adds that page
> > to a list for sub-page R/O handling. The list holds a bitmask which
> > dwords are supposed to be read-only and an address where page is mapped
>=20
> ... dwords here?
>=20
> > for write emulation - this mapping is done only on the first access. A
> > plain list is used instead of more efficient structure, because there
> > isn't supposed to be many pages needing this precise r/o control.
> >=20
> > The mechanism this API is plugged in is slightly different for PV and
> > HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
> > it's already called for #PF on read-only MMIO page. For HVM however, EPT
> > violation on p2m_mmio_direct page results in a direct domain_crash().
> > To reach mmio_ro_emulated_write(), change how write violations for
> > p2m_mmio_direct are handled - specifically, check if they relate to such
> > partially protected page via subpage_mmio_write_accept() and if so, call
> > hvm_emulate_one_mmio() for them too. This decodes what guest is trying
> > write and finally calls mmio_ro_emulated_write(). Note that hitting EPT
> > write violation for p2m_mmio_direct page can only happen if the page was
> > on mmio_ro_ranges (see ept_p2m_type_to_flags()), so there is no need for
> > checking that again.
>=20
> Yet that's then putting us on a certain risk wrt potential errata.
>=20
> You also specifically talk about "guests", i.e. more than just hwdom.
> Adding another easy access to the emulator (for HVM) comes with a
> certain risk of future XSAs, too.

There are a lot of ways where a guest with a PCI device can exercise the
emulator already, no? And even without PCI passthrough, more or less any
device backed by the device model allows that too. So, while emulator is
a complex piece of code, I don't think this patch makes it easier
accessible in any significant way.

Anyway, for the use in this series, it applies only if the USB
controller used for XHCI console is passed through a guest. I'd say
that's far from common setup (outside of debugging), since it requires a
special cable to be plugged in for the system to boot at all.

> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -1990,6 +1990,14 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsig=
ned long gla,
> >          goto out_put_gfn;
> >      }
> > =20
> > +    if ( (p2mt =3D=3D p2m_mmio_direct) && npfec.write_access && npfec.=
present &&
> > +         subpage_mmio_write_accept(mfn, gla) &&
> > +         (hvm_emulate_one_mmio(mfn_x(mfn), gla) =3D=3D X86EMUL_OKAY) )
> > +    {
> > +        rc =3D 1;
> > +        goto out_put_gfn;
> > +    }
>=20
> But npfec.write_access set doesn't mean it was a write permission
> violation, does it?=20

Doesn't it? IIUC it means it was a write attempt, to a mapped page
(npfec.present), and since we've got EPT violation, it got denied.=20

> May I ask that this be accompanied by a comment
> discussing the correctness/safety?
>=20
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -522,9 +522,24 @@ extern struct rangeset *mmio_ro_ranges;
> >  void memguard_guard_stack(void *p);
> >  void memguard_unguard_stack(void *p);
> > =20
> > +/*
> > + * Add more precise r/o marking for a MMIO page. Bytes range specified=
 here
> > + * will still be R/O, but the rest of the page (nor marked as R/O via =
another
> > + * call) will have writes passed through.
> > + * The start address and the size must be aligned to SUBPAGE_MMIO_RO_A=
LIGN.
>=20
> With this alignment constraint, the earlier sentence can be read as
> controdictory. How about "Byte-granular ranges ..." or "Ranges (using
> byte granularity) ..."? I admit even that doesn't resolve the issue
> fully, though.

I don't see where the issue is, alignment requirement doesn't change
anything regarding the parameter units. Anyway, I can change to one of
the suggested versions.

> > @@ -4882,6 +4895,243 @@ long arch_memory_op(unsigned long cmd, XEN_GUES=
T_HANDLE_PARAM(void) arg)
> >      return 0;
> >  }
> > =20
> > +/* This needs subpage_ro_lock already taken */
> > +static int __init subpage_mmio_ro_add_page(
> > +    mfn_t mfn, unsigned int offset_s, unsigned int offset_e)
> > +{
> > +    struct subpage_ro_range *entry =3D NULL, *iter;
> > +    int i;
>=20
> unsigned int please (as almost always for induction variables).
>=20
> > +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> > +    {
> > +        if ( mfn_eq(iter->mfn, mfn) )
> > +        {
> > +            entry =3D iter;
> > +            break;
> > +        }
> > +    }
> > +    if ( !entry )
> > +    {
> > +        /* iter=3D=3DNULL marks it was a newly allocated entry */
>=20
> Nit: Even in a comment I think it would be nice if style rules were
> followed, and hence =3D=3D was surrounded by blanks.
>=20
> > +        iter =3D NULL;
> > +        entry =3D xzalloc(struct subpage_ro_range);
> > +        if ( !entry )
> > +            return -ENOMEM;
> > +        entry->mfn =3D mfn;
> > +    }
> > +
> > +    for ( i =3D offset_s; i <=3D offset_e; i +=3D SUBPAGE_MMIO_RO_ALIG=
N )
> > +        set_bit(i / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords);
>=20
> You're holding a spin lock, so won't __set_bit() suffice here? And
> then __clear_bit() below?

Right.

> > +    if ( !iter )
> > +        list_add_rcu(&entry->list, &subpage_ro_ranges);
> > +
> > +    return 0;
> > +}
>=20
> Since you mark the qwords which are to be protected, how is one to set
> up safely two discontiguous ranges on the same page? I think I had
> asked for v1 already why you don't do things the other way around:
> Initially the entire page is protected, and then writable regions are
> carved out.

Because that's not how the API is used. This API is for those how want
to write-protect some specific ranges (to be written exclusively by
Xen). They don't need to even know what is else is on the same page.
Take XHCI case as an example: it gets the range to write-protect by
enumerating XHCI extended capabilities, which is a linked list. The
driver gets info where XHCI console registers are.  Things before/after
them on that page may not even be XHCI extended caps at all.
This in fact is very similar approach to already existing
mmio_ro_ranges.

> I guess I shouldn't further ask about overlapping r/o ranges and their
> cleaning up. But at least a comment towards the restriction would be
> nice. Perhaps even check upon registration that no part of the range
> is already marked r/o.

Yes, this is a good suggestion, I'll add that.

> > +static void __init subpage_mmio_ro_free(struct rcu_head *rcu)
> > +{
> > +    struct subpage_ro_range *entry =3D container_of(
> > +        rcu, struct subpage_ro_range, rcu);
> > +
> > +    ASSERT(bitmap_empty(entry->ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_=
ALIGN));
> > +
> > +    if ( entry->mapped )
> > +        iounmap(entry->mapped);
> > +    xfree(entry);
> > +}
> > +
> > +/* This needs subpage_ro_lock already taken */
> > +static int __init subpage_mmio_ro_remove_page(
> > +    mfn_t mfn,
> > +    int offset_s,
> > +    int offset_e)
> > +{
> > +    struct subpage_ro_range *entry =3D NULL, *iter;
> > +    int rc, i;
> > +
> > +    list_for_each_entry_rcu(iter, &subpage_ro_ranges, list)
> > +    {
> > +        if ( mfn_eq(iter->mfn, mfn) )
> > +        {
> > +            entry =3D iter;
> > +            break;
> > +        }
> > +    }
> > +    if ( !entry )
> > +        return -ENOENT;
>=20
> Yet the sole caller doesn't care at all, not even by an assertion.

Indeed, right now it's called under the same spinlock that the page was
added. Would you prefer to drop return value (not relevant until another
use is added, beyond cleanup on failure), or add assertion?

> > +    for ( i =3D offset_s; i <=3D offset_e; i +=3D SUBPAGE_MMIO_RO_ALIG=
N )
> > +        clear_bit(i / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords);
> > +
> > +    if ( !bitmap_empty(entry->ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_A=
LIGN) )
> > +        return 0;
> > +
> > +    list_del_rcu(&entry->list);
> > +    call_rcu(&entry->rcu, subpage_mmio_ro_free);
>=20
> This being an __init function, what is the RCU-ness intended to guard
> against?

Indeed, as long as it's __init only, it probably can be dropped.
Originally I prepared this API to be useful also when some ranges are
added/removed beyond just boot time, but currently the sole use is just
adding ranges and only during boot.

> > +    return rc;
>=20
> DYM "return 0" here, or maybe even invert the if()'s condition to have
> just a single return? "rc" was never written afaics, and the compiler
> not spotting it is likely because the caller doesn't inspect the return
> value.

Indeed.

> > +}
> > +
> > +
>=20
> Nit: No double blanks lines please.
>=20
> > +int __init subpage_mmio_ro_add(
> > +    paddr_t start,
> > +    size_t size)
> > +{
> > +    mfn_t mfn_start =3D maddr_to_mfn(start);
> > +    paddr_t end =3D start + size - 1;
> > +    mfn_t mfn_end =3D maddr_to_mfn(end);
> > +    int offset_end =3D 0;
>=20
> unsigned int again, afaics. Also this can be declared in the more narrow
> scope it's used in.
>=20
> > +    int rc;
> > +
> > +    ASSERT(IS_ALIGNED(start, SUBPAGE_MMIO_RO_ALIGN));
> > +    ASSERT(IS_ALIGNED(size, SUBPAGE_MMIO_RO_ALIGN));
>=20
> Not meeting the first assertion's condition (thinking of a release build)
> is kind of okay, as too large a range will be protected. But for the 2nd
> too small a range would be covered aiui, so this may want dealing with in
> a release-build-safe way.

Ok.

> > +    if ( !size )
> > +        return 0;
> > +
> > +    rc =3D rangeset_add_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(=
mfn_end));
> > +    if ( rc )
> > +        return rc;
> > +
> > +    spin_lock(&subpage_ro_lock);
> > +
> > +    if ( PAGE_OFFSET(start) ||
> > +         (mfn_eq(mfn_start, mfn_end) && PAGE_OFFSET(end) !=3D PAGE_SIZ=
E - 1) )
> > +    {
> > +        offset_end =3D mfn_eq(mfn_start, mfn_end) ?
> > +                     PAGE_OFFSET(end) :
> > +                     (PAGE_SIZE - 1);
> > +        rc =3D subpage_mmio_ro_add_page(mfn_start,
> > +                                      PAGE_OFFSET(start),
> > +                                      offset_end);
> > +        if ( rc )
> > +            goto err_unlock;
> > +    }
> > +
> > +    if ( !mfn_eq(mfn_start, mfn_end) && PAGE_OFFSET(end) !=3D PAGE_SIZ=
E - 1 )
> > +    {
> > +        rc =3D subpage_mmio_ro_add_page(mfn_end, 0, PAGE_OFFSET(end));
> > +        if ( rc )
> > +            goto err_unlock_remove;
> > +    }
> > +
> > +    spin_unlock(&subpage_ro_lock);
> > +
> > +    return 0;
> > +
> > + err_unlock_remove:
> > +    if ( offset_end )
> > +        subpage_mmio_ro_remove_page(mfn_start, PAGE_OFFSET(start), off=
set_end);
> > +
> > + err_unlock:
> > +    spin_unlock(&subpage_ro_lock);
> > +    if ( rangeset_remove_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x=
(mfn_end)) )
> > +        printk(XENLOG_ERR "Failed to cleanup on failed subpage_mmio_ro=
_add()\n");
> > +    return rc;
> > +}
>=20
> None of the failures here is particularly likely, so perhaps all is fine =
as
> you have it. But there would be an alternative of retaining the
> mmio_ro_ranges entry/entries, allowing the caller to "ignore" the error.

That is an option here too, but note one of the potential failures is
about rangeset_add_range() itself, so one needs to be careful about
completely ignoring the error.

> > +static void __iomem *subpage_mmio_get_page(struct subpage_ro_range *en=
try)
> > +{
> > +    if ( entry->mapped )
> > +        return entry->mapped;
> > +
> > +    spin_lock(&subpage_ro_lock);
> > +    /* Re-check under the lock */
> > +    if ( entry->mapped )
> > +        goto out_unlock;
> > +
> > +    entry->mapped =3D ioremap(mfn_x(entry->mfn) << PAGE_SHIFT, PAGE_SI=
ZE);
> > +
> > + out_unlock:
> > +    spin_unlock(&subpage_ro_lock);
> > +    return entry->mapped;
> > +}
>=20
> This is easy to deal with without any "goto".
>=20
> I'm further inclined to request that the ioremap() occur without the lock
> held, followed by an iounmap() (after dropping the lock) if in fact the
> mapping wasn't needed (anymore).

Is it to limit time the lock is held?

> > +static void subpage_mmio_write_emulate(
> > +    mfn_t mfn,
> > +    unsigned int offset,
> > +    const void *data,
> > +    unsigned int len)
> > +{
> > +    struct subpage_ro_range *entry;
> > +    void __iomem *addr;
> > +
> > +    rcu_read_lock(&subpage_ro_rcu);
> > +
> > +    list_for_each_entry_rcu(entry, &subpage_ro_ranges, list)
> > +    {
> > +        if ( mfn_eq(entry->mfn, mfn) )
> > +        {
> > +            if ( test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qw=
ords) )
> > +                goto write_ignored;
>=20
> I think you can get away with just a single "goto" by putting the gprintk=
()
> (and its label) here.

write_ignored label is used also below in "default" case (which should
be unreachable, but still). Do you suggest jumping from default case
into here?

> > +            addr =3D subpage_mmio_get_page(entry);
> > +            if ( !addr )
> > +            {
> > +                gprintk(XENLOG_ERR,
> > +                        "Failed to map page for MMIO write at 0x%"PRI_=
mfn"%03x\n",
> > +                        mfn_x(mfn), offset);
> > +                goto out_unlock;
> > +            }
> > +
> > +            switch ( len )
> > +            {
> > +            case 1:
> > +                writeb(*(uint8_t*)data, addr);
> > +                break;
> > +            case 2:
> > +                writew(*(uint16_t*)data, addr);
> > +                break;
> > +            case 4:
> > +                writel(*(uint32_t*)data, addr);
> > +                break;
> > +            case 8:
> > +                writeq(*(uint64_t*)data, addr);
> > +                break;
>=20
> Please avoid casting away const-ness.
>=20
> > +            default:
> > +                /* mmio_ro_emulated_write() already validated the size=
 */
> > +                ASSERT_UNREACHABLE();
> > +                goto write_ignored;
> > +            }
> > +            goto out_unlock;
> > +        }
> > +    }
> > +    /* Do not print message for pages without any writable parts. */
> > +    goto out_unlock;
> > +
> > + write_ignored:
> > +    gprintk(XENLOG_WARNING,
> > +             "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
> > +             mfn_x(mfn), offset, len);
>=20
> Nit: Indentation.
>=20
> > + out_unlock:
> > +    rcu_read_unlock(&subpage_ro_rcu);
> > +}
> > +
> > +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
> > +{
> > +    unsigned int offset =3D PAGE_OFFSET(gla);
> > +    const struct subpage_ro_range *entry;
> > +
> > +    rcu_read_lock(&subpage_ro_rcu);
> > +
> > +    list_for_each_entry_rcu(entry, &subpage_ro_ranges, list)
> > +        if ( mfn_eq(entry->mfn, mfn) &&
> > +             !test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qword=
s) )
> > +        {
> > +            /*
> > +             * We don't know the write seize at this point yet, so it =
could be
>=20
> Nit: "size" I assume.
>=20
> > +             * an unalligned write, but accept it here anyway and deal=
 with it
> > +             * later.
> > +             */
>=20
> Have I overlooked where unaligned writes are dealt with?

mmio_ro_emulated_write() handles that already.

> Also nit: "unaligned".
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--A6Nppku0Kd1gyEHN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmSfVxQACgkQ24/THMrX
1yzJPAf9HyjoXqc+bt02yVZqB1Kj6P+nC34bUWOUPAnEcZ6gyT0+n+Ujln2rhScy
rp1T3FrpSdsI4hrcw0Y7Odc7jSAUT4WD9sEtDdJ+P4Uz6XEa2bgIWqLFHEYheDzq
IJceDpr3XFuz1urlNw9fBpE5JlvgLp6wWbt16yeOb+eO8EWPJCZ6zOi2UgcUbAtI
JFcjxEq9tGu6gUiogovpx8jGPYemSVoQqKIhjVc0hQbGc5BYWYKMGE7xqiuSV+KY
EjFQhrbb7SajEAINMJPrwup9OHAKekBgp4IdM24zjt1kI3YPDuC3wxthuMYVWDla
grY2/XzuzymeNW7BbSseJOdCzXGJkA==
=zqjE
-----END PGP SIGNATURE-----

--A6Nppku0Kd1gyEHN--

