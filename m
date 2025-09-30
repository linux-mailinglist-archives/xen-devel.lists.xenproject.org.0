Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A04ABAC675
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 12:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134160.1472156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3XDV-0003PM-FA; Tue, 30 Sep 2025 10:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134160.1472156; Tue, 30 Sep 2025 10:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3XDV-0003Nu-Bs; Tue, 30 Sep 2025 10:04:17 +0000
Received: by outflank-mailman (input) for mailman id 1134160;
 Tue, 30 Sep 2025 10:04:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY3K=4J=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1v3XDT-0003Nn-3x
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 10:04:16 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d094ff83-9de4-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 12:04:13 +0200 (CEST)
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v3XDI-00000009k3g-2ECK; Tue, 30 Sep 2025 10:04:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3AE8B300220; Tue, 30 Sep 2025 12:04:04 +0200 (CEST)
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
X-Inumbo-ID: d094ff83-9de4-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MWKfGHqfQoXIoK2fr1DCRttNg7EHyA3c10MmVnFnCAg=; b=MTCvNJVWJBWdqU/OOjC3FdgGUj
	S9PS2pOsDZGrhIS/9a+YND5J88eADzGtxSWVvcA6Wsn0e/5M4jhPP+6I6+2BcS/+uMP5xpzMUydhJ
	ytAGsrd3YGFfj1dDkK8Z6PFftkOzZFsZ4Jrak8NkDKTv8XNT4hrKbb9HDEFZrU7gv0l5uBlb7Ce/H
	uQ02gzpHBuasGSJLVXmsifPugnt/bFZUGE6QtKMe4YI28R22olde3vgZ/l+PpGTjvjjof7m/5s35q
	Nuu8pY44EpRfS8UcSLYvEETcuGS7fVJlfAY8jbjRtrqiw5cNX1s5ZMO/MWmTNQ37r82UtV6U02nBi
	XA97nfbg==;
Date: Tue, 30 Sep 2025 12:04:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev, xin@zytor.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 11/12] x86/paravirt: Don't use pv_ops vector for MSR
 access functions
Message-ID: <20250930100404.GK4067720@noisy.programming.kicks-ass.net>
References: <20250930070356.30695-1-jgross@suse.com>
 <20250930070356.30695-12-jgross@suse.com>
 <20250930083827.GI3245006@noisy.programming.kicks-ass.net>
 <1541b670-8b29-42a5-a58d-34d85197751d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OKKMZZxPhdskK4Hh"
Content-Disposition: inline
In-Reply-To: <1541b670-8b29-42a5-a58d-34d85197751d@suse.com>


--OKKMZZxPhdskK4Hh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 11:02:52AM +0200, J=FCrgen Gro=DF wrote:
> On 30.09.25 10:38, Peter Zijlstra wrote:
> > On Tue, Sep 30, 2025 at 09:03:55AM +0200, Juergen Gross wrote:
> >=20
> > > +static __always_inline u64 read_msr(u32 msr)
> > > +{
> > > +	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> > > +		return xen_read_msr(msr);
> > > +
> > > +	return native_rdmsrq(msr);
> > > +}
> > > +
> > > +static __always_inline int read_msr_safe(u32 msr, u64 *p)
> > > +{
> > > +	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> > > +		return xen_read_msr_safe(msr, p);
> > > +
> > > +	return native_read_msr_safe(msr, p);
> > > +}
> > > +
> > > +static __always_inline void write_msr(u32 msr, u64 val)
> > > +{
> > > +	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> > > +		xen_write_msr(msr, val);
> > > +	else
> > > +		native_wrmsrq(msr, val);
> > > +}
> > > +
> > > +static __always_inline int write_msr_safe(u32 msr, u64 val)
> > > +{
> > > +	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> > > +		return xen_write_msr_safe(msr, val);
> > > +
> > > +	return native_write_msr_safe(msr, val);
> > > +}
> > > +
> > > +static __always_inline u64 rdpmc(int counter)
> > > +{
> > > +	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> > > +		return xen_read_pmc(counter);
> > > +
> > > +	return native_read_pmc(counter);
> > > +}
> >=20
> > Egads, didn't we just construct giant ALTERNATIVE()s for the native_
> > things? Why wrap that in a cpu_feature_enabled() instead of just adding
> > one more case to the ALTERNATIVE() ?
>=20
> The problem I encountered with using pv_ops was to implement the *_safe()
> variants. There is no simple way to do that using ALTERNATIVE_<n>(), as
> in the Xen PV case the call will remain, and I didn't find a way to
> specify a sane interface between the call-site and the called Xen function
> to return the error indicator. Remember that at the call site the main
> interface is the one of the RDMSR/WRMSR instructions. They lack an error
> indicator.

Would've been useful Changelog material that I suppose.

> In Xin's series there was a patch written initially by you to solve such
> a problem by adding the _ASM_EXTABLE_FUNC_REWIND() exception table method.
> I think this is a dead end, as it will break when using a shadow stack.

No memories, let me go search. I found this:

  https://patchwork.ozlabs.org/project/linux-ide/patch/20250331082251.31712=
76-12-xin@zytor.com/

That's the other Peter :-)

Anyway, with shadowstack you should be able to frob SSP along with SP in
the exception context. IIRC the SSP 'return' value is on the SS itself,
so a WRSS to that field can easily make the whole CALL go away.

> Additionally I found a rather ugly hack only to avoid re-iterating most of
> the bare metal ALTERNATIVE() for the paravirt case. It is possible, but t=
he
> bare metal case is gaining one additional ALTERNATIVE level, resulting in
> patching the original instruction with an identical copy first.

OTOH the above generates atrocious crap code :/

You get that _static_cpu_has() crud, which is basically a really fat
jump_label (because it needs to include the runtime test) and then the
code for both your xen thing and the alternative.

/me ponders things a bit..

> Remember that at the call site the main interface is the one of the
> RDMSR/WRMSR instructions. They lack an error indicator.

This, that isn't true.

Note how ex_handler_msr() takes a reg argument and how that sets that
reg to -EIO. See how the current native_read_msr_safe() uses that:

  _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %[err])

(also note how using _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_*_SAFE) like you
do, will result in reg being 0 or ax. Scribbling your 0 return value)

It very explicitly uses @err as error return value. So your call would
return eax:edx and take ecx to be the msr, but there is nothing stopping
us from then using say ebx for error return, like:

	int err =3D 0;

	asm_inline(
		"1:\n"
		ALTERNATIVE("ds rdmsr",
			    "call xen_rdmsr", XENPV)
		"2:\n"

		_ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %%ebx)

		: "a" (ax), "d" (dx), "+b" (err)
		: "c" (msr));

	return err;

Hmm?

--OKKMZZxPhdskK4Hh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmjbqxQACgkQdkfhpEvA
5LrlWxAAqulZs4pOHvRqUmLabha0Md6Falt3RnNmeNOe0ALy2IX0BKsPFMKwZYVd
RepAgPRzqFQT/TXPVN1Xl1b0Untty0TDZraoLeUUEKdPnc6yqXlSSZIqO+ObLM/9
h9SikaadckG2IhydaxD61jeW4ZWSUjR7zcFz+NcYVDtegIrz/WoO04k9EwFEUrB1
eLqiXc2m9OwMxbLPlSp0ux881Pwyvu5qmcfbuvh0bZcQq+3LADuNGcofbJe0V5Ug
0eWvoe+35N+ntv/2vgaObV/ksZhg0bLvQDjO86e/Wka4wGwSCiOrAQFj2mMfKe+w
Ax/dZd4LpysGV/tlk3PwbkLED06yfQzIwoOKc51kmJ7IonSYeaS/nTcQaPdjbaJZ
N9FMdJ6zCZx64QZXW6ytZCpsVaiHleFBOug6SGRYkf8IdDzRZB0O4yrp1WVLs6w5
qLzmrFQkGvNGURUqvy1T9pCX+vzZg4tSGxsFTlGObeLclvhQCr1SCignk8HYpcc8
LGR2C1AbBXZQVzBwF9qhqPFPKANp5baq5BkyFZVOUIqkZfMZaW0fAVsidwC60Df2
Tz/891/zvYOMZZqi672Ci1Qz2MwSu2twj9MdWoMs1z+pvVHAhi4MDRXqKf3yrdW3
bIsP9gLuPAb9JjkMtUQ+0BmBPNc+o67KwijHXDiaoGkXtpU698I=
=NBbB
-----END PGP SIGNATURE-----

--OKKMZZxPhdskK4Hh--

