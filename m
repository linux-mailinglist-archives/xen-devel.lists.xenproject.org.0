Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB85F86F1F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 03:09:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvtMY-0002L2-Nq; Fri, 09 Aug 2019 01:06:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wPrW=WF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hvtMX-0002Kx-Fb
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 01:06:33 +0000
X-Inumbo-ID: eafc4ea6-ba41-11e9-ab08-53c3155e5242
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eafc4ea6-ba41-11e9-ab08-53c3155e5242;
 Fri, 09 Aug 2019 01:06:29 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C0E2521C28;
 Thu,  8 Aug 2019 21:06:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 08 Aug 2019 21:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CQewkW
 2xti1O3VHNiIGZRd/+WwpzrjzGHT6pB43vnQU=; b=g68xZY8D0Y129aX8WZFsNF
 JZMtxOK+eesSiYNjAWTIY3WRIAX/VyuUWW+3yLTt18uZtW2mbZVZCiIj11jKw6rK
 Kq5gqSpUNhBLMUW82JwbzlLlHoHCIA9BoytzRi6HFs4EjDcfzYDA0S4CSoK1s4pF
 RZM7tSpNtLZ9GjpTENcnl/NWoupb0zjvzkyWT40KoM61JX5gnHLFvfiiYomoJ6pp
 XJ1zERBGED+fjinUfotcNG4yP1AsfW6MZAGt13PlJTcIdfF7nZKkcJWJn3uq7KXM
 i7G5AU+jTuDH8SQoxyaquVdP45TeFQcFgipJxdyihnOMvCKoWv0hawm9b/xvPOZQ
 ==
X-ME-Sender: <xms:E8dMXfzP7IEoyrRAj1UKAXvfIzTXHaYoBVckJuBzaa-RTI8vU9i6SA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduiedggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepgigvnhhprhho
 jhgvtghtrdhorhhgpdhgihhthhhusgdrtghomhdphihouhhtuhgsvgdrtghomhenucfkph
 epledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
 vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghruf
 hiiigvpedt
X-ME-Proxy: <xmx:E8dMXYh32vRZEloSIX5dONj2vJ8Pd45h3gf19GglYFHOYMpKBSwD-Q>
 <xmx:E8dMXerPaPdKlzFU74NT9yfmwOeUHXSl3tGa8sTFbkBfETLCbt9GAQ>
 <xmx:E8dMXXdUXenbinaYvx3iC3yZp2e4kdsIwLQDe4xfzSwXhu6JE8krYA>
 <xmx:FMdMXQHrDfq51ZsrLvH0HDjLclkCvuyHfa7dv8cwOHq7IFc-YHbrJQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id ED282380087;
 Thu,  8 Aug 2019 21:06:25 -0400 (EDT)
Date: Fri, 9 Aug 2019 03:06:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Rich Persaud <persaur@gmail.com>
Message-ID: <20190809010622.GA11137@mail-itl>
References: <BD42FE78-987C-4D52-A7C4-3A3786BC93CF@gmail.com>
MIME-Version: 1.0
In-Reply-To: <BD42FE78-987C-4D52-A7C4-3A3786BC93CF@gmail.com>
Subject: Re: [Xen-devel] Xen Summit 2019 Design Session - Nested
 Virtualization
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, lars.kurth@xenproject.org,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, james@bromium.com,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: multipart/mixed; boundary="===============3741322364086880424=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3741322364086880424==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Xen Summit 2019 Design Session - Nested Virtualization

On Thu, Aug 08, 2019 at 08:53:36PM -0400, Rich Persaud wrote:
> Session notes attached in markdown and PDF format, please revise as neede=
d.
>=20
> Rich
>=20
>=20
>=20
> # Nested Virtualization Design Session
> Xen Design and Developer Summit, [11 July 2019](https://design-sessions.x=
enproject.org/uid/discussion/disc_1NVcnOZyDZM1LpQbIsJm/view)
>=20
> **Related Presentations**
>=20
> - (2019) J=C3=BCrgen Gro=C3=9F, [Support of PV devices in nested Xen](htt=
ps://youtube.com/watch?v=3DHA_teA6hV7c)
> - (2019) Christopher Clark and Kelli Little, [The Xen-Blanket](https://yo=
utube.com/watch?v=3Di5w9sF9VerE)
> - (2018) Ian Pratt, [Hypervisor Security: Lessons Learned](https://youtub=
e.com/watch?v=3DbNVe2y34dnM) (uXen)
> - (2018) David Weston, [Windows: Hardening with Hardware](https://youtube=
=2Ecom/watch?v=3D8V0wcqS22vc) (Credential Guard)
>=20
> **Use Cases**
>=20
> - Xen on Xen, some work was done for the Shim (Meltdown mitigation).
> - Xen on another hypervisor, involves teaching Xen how to use enlightenme=
nts from other hypervisors. =20
> - Qubes runs Xen on AWS bare-metal instances that use Nitro+KVM, mostly w=
orks.

It isn't AWS, it's standard KVM (with qemu etc). Use case is testing. Mostl=
y works.

> - Windows Credential Guard (Hyper-V on Xen)
> - Bromium Type-2 uXen in Windows and Linux guests on Xen
>=20
> **Issues**
>=20
> 1.  Need to be careful with features, eg. Ballooning down memory.
> 2. Dom0 is exposed to things that it should not see.
> 3. Nested virtualization works when both L0 and L1 agree, e.g Xen on Xen.=
  When replacing Xen with another hypervisor, all falls apart.

In my experience, running Xen on another hypervisor (KVM, VirtualBox)
mostly works. What is broken, is running non-Xen within Xen.

> 4. Need more audit checks for what the VM can read or write, i.e. guest r=
equirements.
> 5. Virtual vmentry and vmexit emulation "leaking", doesn't cope well.
> 6. Context switching bug fixed a while ago: doesn't understand AFR(?) loa=
ding or whether it should do it or leave alone.
> 7. Missing instructions to virtualize vmexit.
> 8. Enlightened EPT shootdown is easy on top of the other features working.
>=20
> **Dependent on CPUID and MSR work**
>=20
> 1. Auditing of changes.  Can then fix virtual vmentry and vmexit, one bit=
 at a time.  Once all features are covered, it should work fine.
> 2. hwcaps: needed to tell the guest about the security state of the hardw=
are.
> 3. Reporting CPU topology representation to guests, which is blocking cor=
e-scheduling work (presented by Juergen at Xen Summit)
> 4. Andrew is working on the prerequisites for the policy.
>=20
> **Validation of Nested Virtualization**
>=20
> 1.  First priority is correctness.=20
> 2. Second priority is performance.
> 3. There is a unit testing prototype which exercises vmxon, vmxoff instru=
ctions.
> 4. Depends on regression testing, which depends upon (a) formal security =
support, (b) approval of the Xen security team.
> 5. Other hypervisors must be tested with Xen.
>=20
> **Guest State**
>=20
> Nesting requires merge of L1 and L0 state.
>=20
> 1.  AMD interface is much easier: it has "clean bits": if any bit is clea=
r, must resync.  Guest state is kept separately.
> 2. Intel guest state is kept in an opaque blob in memory, with special in=
structions to access it.  Memory layout in RAM is unknown, behavior changes=
 with microcode updates and there are 150 pages of relevant Intel manuals.
> 4. Bromium does some fun stuff to track guest state in software, poisonin=
g RAM and then inspecting it, which is still faster than Intel's hardware-b=
ased VMCS shadowing. L1 hypervisor (Type-2 uXen): https://github.com/openxt=
/uxen
> 5. Viridian emulates the AMD way, i.e. Microsoft has Intel bits formatted=
 in an AMD-like structure, then L0 translates the AMD structure into Intel'=
s opaque blob.
>=20
> **Secure Variable Storage**
>=20
> 1. Need an agreed sane way for multiple hypervisors to handle it, eg. a p=
air of ioports, translation from VMX, guest handles the interrupts via a st=
andard ioport interception to secondary emulator: tiny.
> 2. Easy case:  ioports + memory page for data.
> 3. Citrix XenServer has a closed-source implementation (varstored?)
>=20
> **Interface for nested PV devices**
>=20
> PV driver support currently involves grants and interrupts.
>=20
> Requirements:
>=20
> 1. Should Xen's ABI include hypercall nesting level?
> 2. Each layer of nesting must apply access control decisions to the opera=
tion invoked by its guest.
> 3. Brownfield: if Xen and other L1 hypervisors must be compatible with ex=
isting Xen bare-metal deployments, the L0 hypervisor must continue to suppo=
rt grants, events and xenstore.
> 4. Greenfield: if the L0 hypervisor can be optimized for nesting, then PV=
 driver mechanisms other than grants, events and xenstore could be consider=
ed.
>=20
> Live migration with PCI graphics (has been implemented on AWS):
>=20
> - need to make it look the same, regardless of nesting level
> - 1 or more interrupts
> - 1 or shared pages of RAM
> - share xenstore
> - virtio guest physical address space DMA: done right
> - _*need to get rid of domid*_ as the endpoint identifier
>=20
> Access Control:
>=20
> Marek: use virtio?
> David: do whatever you like in L1
> Juergen: new "nested hypercall", to pass downwards an opaque payload
> David: how does access control work with that approach?
>=20
> Christopher: xenblanket RFC series implements support for one level of ne=
sting. Its implementation below the hypercall interface demonstrates access=
 control logic that is required at each nesting level.
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1Mxw4ACgkQ24/THMrX
1ywJWAf/TaSjstMgbdnR0FQRgYt87/dUdYgfLUf6OywuOWDM0F5Od4FcmIk/tNaD
jTj8D3wOGBQaPKAi+SvZDe2ayxXQLin0Q4oQt0MYvbfVwnGbpkZt3FNLWU0EM2HP
kf60CdKGyPdAa+cKunKklAM53aDUYLUBsLHxpbUOCtZp6zU8x4nOIpWE7piLWnGI
1/mkmh2URT2582T9IEbOWSEzTpRdn+36ZX+wJi3JORkBvfQ1Ra43UczW/qWD6Qr+
5VzxIyhwGED4hogigHIgTLHzzt17O+Npkt9qg1vewsCd0M2wbdX1qA2D7QyugAd8
cGRiOqV+z53dkqKZ3boFs+MjNZ1HkQ==
=eNV3
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--


--===============3741322364086880424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3741322364086880424==--

