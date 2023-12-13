Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6896481148B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 15:25:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654019.1020669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDQ9z-0003zd-OD; Wed, 13 Dec 2023 14:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654019.1020669; Wed, 13 Dec 2023 14:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDQ9z-0003wH-Kc; Wed, 13 Dec 2023 14:24:27 +0000
Received: by outflank-mailman (input) for mailman id 654019;
 Wed, 13 Dec 2023 14:24:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ca38=HY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rDQ9x-0003wB-BZ
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 14:24:25 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e652f9f-99c3-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 15:24:22 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 351DE5C04FC;
 Wed, 13 Dec 2023 09:24:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 13 Dec 2023 09:24:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Dec 2023 09:24:18 -0500 (EST)
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
X-Inumbo-ID: 4e652f9f-99c3-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1702477460;
	 x=1702563860; bh=+XVNl6EQXZ04NF9e23mZvbfkUunjJ5i82874zXn0jF4=; b=
	wb7/7ziVQu9BNYqy72TNeHwL/tO1va8B+ISiKsBD3/o5NgZ0wUiaYJdiVqbhjpUK
	He44WEKwrT0UUjhfdVEcgtvxhPcUNlH03xd/5COD49GL7UufvwAT0WeIHsuFwNk5
	oF5dDAh2b9rV8N6Us5CswBBA7kqiaZFJEWoaSxbjfq5rVtNmxwiI76Gd+HH0zwgV
	bwVLJucXKYJ+E/6U2j16uyRibCvXuHg8eX445lMojpboaEwGmlPy3gvnUh2mBsI8
	15Ih25KuedLyCeqMUs1taAIg4wLyxl+FTh20PCE8L0HIE/RVRaE2lLQQmiZi/lPA
	m+fr3G5ghN8mM/t7mEB99A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702477460; x=1702563860; bh=+XVNl6EQXZ04NF9e23mZvbfkUunj
	J5i82874zXn0jF4=; b=fxXd9vhi2NxczXLJ5H2nLVVnqg45aqfIqR5UNidajMDK
	x0VMrUQZo7fu5guvJOhyLKAZujofASpgNRNt9rqR8A7wWGQZDMLaAB+oApGfISPK
	6bN+q4cXI32+TZu6XEDzyWwUkOLpUMgaQHgfcnkRbY+SXtQjmVZJLrDpRsllFa7S
	2hpmo4kKWggmIKKMU3NU5oQEmAwA/vQsmOijgA0WrYoKGqnToWwssV+28CNQWLG8
	nm7nrvMxwonir8odw6Bz57z9o1fVFsBGsZ0Z1UIAE/mDmXCcqQQ99widFpK1FpjP
	ao2LDNUmzxtnAiPiyehnf+NsF1/cf9GoQsHnV02TtQ==
X-ME-Sender: <xms:k755ZbhsiKSvMRm4f3ZNlmjQu4TKGZvUdu2hY6DCtIrgC2dRL6EVpQ>
    <xme:k755ZYC2WbGsp1PKqf9_N1m1ORqRajlB_UclRwdLzyB_Ppjvb6Y_c3EWt5uEvffuh
    J9y8QlXA4ao7A>
X-ME-Received: <xmr:k755ZbEMilL50vcCEDKVSqeI8kG4jbBD4frzboQk4i_AZRXnvjpLtvkWk9MolBr3q4qDrv0Lo6-dj5-OSgsAznNtZ7QEtoiP2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptefh
    gefgueegveevgeethfekueejgeeitdekhfffgfehgeeludetvddttdfhkeffnecuffhomh
    grihhnpehfohhllhhofihinhhgshhpvggtihhfihgtrghtihhonhhsrdhmugenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkh
    esihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:k755ZYTZPaKpitNCrQkUFuN02lsqEMANI48P4BrFBGrHCGuXbofOPA>
    <xmx:k755ZYz5td9fiAqw2bIv_PpEjbZCJ7rTJr1013KTTMm6rYlIg2f5EA>
    <xmx:k755Ze6kpbQ0THnZLFJPVDJbVdYvkwAT6_eux6W6N4rVbDAFPxKuaA>
    <xmx:lL55ZXpTCb3GNgL54-JhY6ju5NXtGF4RhEbgmUy63UzWJST-ncIpFA>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 13 Dec 2023 15:24:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs: Document a policy for when to deviate from
 specifications
Message-ID: <ZXm+jxn4hr9Y68eD@mail-itl>
References: <20230918122817.6577-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eXnc3naPWXNrddmm"
Content-Disposition: inline
In-Reply-To: <20230918122817.6577-1-george.dunlap@cloud.com>


--eXnc3naPWXNrddmm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Dec 2023 15:24:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs: Document a policy for when to deviate from
 specifications

On Mon, Sep 18, 2023 at 01:28:16PM +0100, George Dunlap wrote:
> There is an ongoing disagreement among maintainers for how Xen should
> handle deviations to specifications such as ACPI or EFI.
>=20
> Write up an explicit policy, and include two worked-out examples from
> recent discussions.

Looks very reasonable to me. While it would be nice for every hardware
(or thing in general) to follow specifications, sadly it isn't reality
and Xen doesn't have enough market share to influence vendors in a
meaningful way. So, yes, the policy described below sounds like a
reasonable approach to make things working for end users.

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

PS As a downstream distributions, we do ship several workarounds that were
rejected upstream on the grounds that "specification says otherwise"
before...

>=20
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
> NB that the technical descriptions of the costs of the accommodations
> or lack thereof I've just gathered from reading the discussions; I'm
> not familiar enough with the details to assert things about them.  So
> please correct any technical issues.
> ---
>  docs/policy/FollowingSpecifications.md | 219 +++++++++++++++++++++++++
>  1 file changed, 219 insertions(+)
>  create mode 100644 docs/policy/FollowingSpecifications.md
>=20
> diff --git a/docs/policy/FollowingSpecifications.md b/docs/policy/Followi=
ngSpecifications.md
> new file mode 100644
> index 0000000000..a197f01f65
> --- /dev/null
> +++ b/docs/policy/FollowingSpecifications.md
> @@ -0,0 +1,219 @@
> +# Guidelines for following specifications
> +
> +## In general, follow specifications
> +
> +In general, specifications such as ACPI and EFI should be followed.
> +
> +## Accommodate non-compliant systems if it doesn't affect compliant syst=
ems
> +
> +Sometimes, however, there occur situations where real systems "in the
> +wild" violate these specifications, or at least our interpretation of
> +them (henceforth called "non-compliant").  If we can accommodate
> +non-compliant systems without affecting any compliant systems, then we
> +should do so.
> +
> +## If accommodation would affect theoretical compliant systems that are
> +   not known to exist, and Linux and/or Windows takes the
> +   accommodation, take the accommodation unless there's a
> +   reason not to.
> +
> +Sometimes, however, there occur situations where real, non-compliant
> +systems "in the wild" cannot be accommodated without affecting
> +theoretical compliant systems; but there are no known theoretical
> +compliant systems which exist.  If Linux and/or Windows take the
> +accommodation, then from a cost/benefits perspective it's probably best
> +for us to take the accommodation as well.
> +
> +This is really a generalization of the next principle; the "reason not
> +to" would be in the form of a cost-benefits analysis as described in
> +the next section showing why the "special case" doesn't apply to the
> +accommodation in question.
> +
> +## If things aren't clear, do a cost-benefits analysis
> +
> +Sometimes, however, things are more complicated or less clear.  In
> +that case, we should do a cost-benefits analysis for a particular
> +accommodation.  Things which should be factored into the analysis:
> +
> +N-1: The number of non-compliant systems that require the accommodation
> + N-1a: The number of known current systems
> + N-1b: The probable number of unknown current systems
> + N-1c: The probable number of unknown future systems
> +
> +N-2 The severity of the effect of non-accommodation on these systems
> +
> +C-1: The number of compliant systems that would be affected by the accom=
modation
> + C-1a: The number of known current systems
> + C-1b: The probable number of unknown current systems
> + C-1c: The probable number of unknown future systems
> +
> +C-2 The severity of the effect of accommodation on these systems
> +
> +Intuitively, N-1 * N-2 gives us N, the cost of not making the
> +accommodation, and C-1 * C-2 gives us C, the cost of taking the
> +accommodation.  If N > C, then we should take the accommodation; if C >
> +N, then we shouldn't.
> +
> +The idea isn't to come up with actual numbers to plug in here
> +(although that's certainly an option if someone wants to), but to
> +explain the general idea we're trying to get at.
> +
> +A couple of other principles to factor in:
> +
> +Vendors tend to copy themselves and other vendors.  If one or two
> +major vendors are known to create compliant or non-compliant systems
> +in a particular way, then there are likely to be more unknown and
> +future systems which will be affected by / need a similar accommodation
> +respectively; that is, we should raise our estimates of N-1{b,c} and
> +C-1{b,c}.
> +
> +Some downstreams already implement accommodations, and test on a
> +variety of hardware.  If downstreams such as QubesOS or XenServer /
> +XCP-ng implement the accommodations, then N-1 * N-2 is likely to be
> +non-negligible, and C-1 * C-2 is likely to be negligible.
> +
> +Windows and Linux are widely tested.  If Windows and/or Linux make a
> +particular accommodation, and that accommodation has remained stable
> +without being reverted, then it's likely that the number of unknown
> +current systems that are affected by the accommodation is negligible;
> +that is, we should lower the C-1b estimate.
> +
> +Vendors tend to test server hardware on Windows and Linux.  If Windows
> +and/or Linux make a particular accommodation, then it's unlikely that
> +future systems will be affected by the accommodation; that is, we
> +should lower the C-1c estimate.
> +
> +# Example applications
> +
> +Here are some examples of how these principles can be applied.
> +
> +## ACPI MADT tables containing ~0
> +
> +Xen disables certain kinds of features on CPU hotplug systems; for
> +example, it will avoid using TSC, which is faster and more power
> +efficient (since on a hot-pluggable system it won't be reliable), and
> +instead fall back to other timer sources which are slower and less
> +power efficient.
> +
> +Some hardware vendors have (it seems) begun making a single ACPI table
> +image for a range of similar systems, with MADT entries for the number
> +of CPUs based on the system with the most CPUs, and then for the
> +systems with fewer CPUs, replacing the APIC IDs in the MADT table with
> +~0, to indicate that those entries aren't valid.  These systems are
> +not hotplug capable.  Sometimes the invalid slots are on a separate
> +socket.
> +
> +One interpretation of the spec is that a system with such MADT entries
> +could actually have an extra socket, and that later the system could
> +update the MADT table, populating the APIC IDs with real values.
> +
> +If Xen finds an MADT where all slots are either populated or filled
> +with APICID ~0, , should it consider it a multi-socket hotplug system,
> +disable features available on single-socket systems?  Or should it
> +accommodate the systems above, treating the system as systems
> +incapable of hotplug?
> +
> +N-1a: People have clearly found a number of systems in the wild, from
> +different vendors, that exhibit this property; it's a non-negligible
> +number of systems.
> +
> +N-1b,c: Since these systems are from different vendors, and there seem to
> +be a fair number of them, there are likely to be many more that we
> +don't know about; and likely to be many more produced in the future.
> +
> +N-2: Xen will use more expensive (both time and power-wise) clock
> +sources unless the user manually modifies the Xen command-line.
> +
> +C-1a,b: There are no known systems that implement phyical CPU hotplug
> +whatsoever, much less a system that uses ~0 for APICIDs.
> +
> +There are hypervisors that implement *virtual* CPU hotplug; but they
> +don't use ~0 for APICIDs.
> +
> +C-1c: It seems that physical CPU hotplug is an unsolved problem: it was
> +worked on for quite a while and then abandoned.  So it seems fairly
> +unlikely that any physical CPU hotplug systems will come to exist any
> +time in the near future.
> +
> +If any hotplug systems were created, they would only be affected if
> +they happened to use ~0 the APIC ID of the empty slots in the MADT
> +table.  This by itself seems unlikely, given the number of vendors who
> +are now using that to mean "invalid slot", and the fact that virtual
> +hotplug systems don't do this.
> +
> +Furthermore, Linux has been treating such entries as permanently
> +invalid since 2016.  If any system were to implement physical CPU
> +hotplug in the future, and use ~0 as a placeholder APIC ID, it's very
> +likely they would test it on Linux, discover that it doesn't work, and
> +modify the system to enable it to work (perhaps copying QEMU's
> +behavior).  It seems likely that Windows will do the same thing,
> +further reducing the probability that any system like this will make
> +it into production.
> +
> +So the potential number of future systems affected by this before we
> +can implement a fix seems very small indeed.
> +
> +C-2: If such a system did exist, everything would work fine at boot;
> +the only issue would be that when an extra CPU was plugged in, nothing
> +would happen.  This could be overridden by a command-line argument.
> +
> +Adding these all together, there's a widespread, moderate cost to not
> +accommodating these systems, and an uncertain and small cost to
> +accommodating them.  So it makes sense to apply the accommodation.
> +
> +## Calling EFI Reboot method
> +
> +One interpretation of the EFI spec is that operating systems should
> +call the EFI ResetSystem method in preference to the ACPI reboot
> +method.
> +
> +However, although the ResetSystem method is required by the EFI spec,
> +a large number of different systems doesn't actully work, at least
> +when called by Xen: a large number of systems don't cleanly reboot
> +after calling the EFI REBOOT method, but rather crash or fail in some
> +other random way.
> +
> +(One reason for this is that the Windows EFI test doesn't call the EFI
> +ResetSystem method, but calls the ACPI reboot method.  One possibile
> +explanation for the repeated pattern is that vendors smoke-test the
> +ResetSystem method from the EFI shell, which has its own memory map;
> +but fail to test it when running on the OS memory map.)
> +
> +Should Xen follow our interpretation of the EFI spec, and call the
> +ResetSystem method in preference to the ACPI reboot method?  Or should
> +Xen accommodate systems with broken ResetSystem methods, and call the
> +ACPI reboot method by default?
> +
> +N-1a: There are clearly a large number of systems which exhibit this
> +property.
> +
> +N-1b,c: Given the large number of diverse vendors who make this
> +mistake, it seems likely that there are even more that we don't know
> +about, and this will continue into the future.
> +
> +N-2: Systems are incapable of rebooting cleanly unless the right runes
> +are put into the Xen command line to make it prefer using the ACPI
> +reboot method.
> +
> +C-1a: A system would only be negatively affected if 1) an ACPI reboot
> +method exists, 2) an EFI method exists, and 3) calling the ACPI method
> +in preference to the EFI method causes some sort of issue.  So far
> +nobody has run into such a system.
> +
> +C-1b,c: The Windows EFI test explicitly tests the ACPI reboot method
> +on EFI systems.  Linux also prefers calling the ACPI reboot method
> +even when an EFI method is available.  The chance of someone shipping
> +a system that had a problem while that was the case is very tiny: it
> +basically wouldn't run either of the two most important operating
> +systems.
> +
> +C-2: It seems likely that the worst that could happen is what's
> +happening now when calling the EFI method: that the ACPI method would
> +cause a weird crash, which then would reboot or hang.
> +
> +XenServer has shipped this accommodation for several years now.
> +
> +Adding these altogether, the cost of non-accommodation is widespread
> +and moderate; that is to say, non-negligible; and the cost of
> +accommodation is theoretical and tiny.  So it makes sense to apply the
> +accommodation.
> \ No newline at end of file
> --=20
> 2.42.0
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--eXnc3naPWXNrddmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmV5vo8ACgkQ24/THMrX
1yyF0wf/ezDeU0nztR8z4tFn4ngmeIL6HrKGavH6h8n9KKc1HVBb7d+ItkWdafva
CVi1AmeO+OtaG+z4vt/fTIjiMc0pziwJq7mPeJBXhxJLGcyoyUNwEd81q+UtOMrh
ie/c0+7iPQCAaxvEpgiO9NpS8AgcIAYBRmxjOJTOm7mzJJppCJGEHXzywRRjyOPY
kGckmjCdhHFgjvBtGk3SA06eZyTQ7zgVYc1mSUa9EV34q6ekvje00fS+2WHTEM6c
maCuAEH3q/2J3gORi2vDHgXJSGLGgYnoh4lJueGj5huq3LmavUsB8z865apj4vDH
w644+zAUVCiHZA9XkzWPcc2GkIASag==
=Vlsv
-----END PGP SIGNATURE-----

--eXnc3naPWXNrddmm--

