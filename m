Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FB61836D3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 18:05:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCRDk-0007Jd-PK; Thu, 12 Mar 2020 17:02:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yTGL=45=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jCRDj-0007JX-Av
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 17:02:07 +0000
X-Inumbo-ID: 33b4da8c-6483-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33b4da8c-6483-11ea-92cf-bc764e2007e4;
 Thu, 12 Mar 2020 17:02:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 58956ADF1;
 Thu, 12 Mar 2020 17:02:05 +0000 (UTC)
Message-ID: <be999c842f3a47cffd14fe0709568fdd4580316a.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Thu, 12 Mar 2020 18:02:03 +0100
In-Reply-To: <20200312150852.GK24458@Air-de-Roger.citrite.net>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <20200312150852.GK24458@Air-de-Roger.citrite.net>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 0/2] xen: credit2: fix vcpu starvation due
 to too few credits
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Glen <glenbarney@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Sarah Newman <srn@prgmr.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============8734943196174556005=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8734943196174556005==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZWI0ASacHDTfwcINeJKI"


--=-ZWI0ASacHDTfwcINeJKI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-12 at 16:08 +0100, Roger Pau Monn=C3=A9 wrote:
> Thanks for looking into this, seems like a specially tricky issue to
> tackle!
>=20
It was tricky indeed! :-)

> On Thu, Mar 12, 2020 at 02:44:07PM +0100, Dario Faggioli wrote:
> [...]
> > For example, I have a trace showing that csched2_schedule() is
> > invoked at
> > t=3D57970746155ns. At t=3D57970747658ns (+1503ns) the s_timer is set to
> > fire at t=3D57979485083ns, i.e., 8738928ns in future. That's because
> > credit
> > of snext is exactly that 8738928ns. Then, what I see is that the
> > next
> > call to burn_credits(), coming from csched2_schedule() for the same
> > vCPU
> > happens at t=3D60083283617ns. That is *a lot* (2103798534ns) later
> > than
> > when we expected and asked. Of course, that also means that delta
> > is
> > 2112537462ns, and therefore credits will sink to -2103798534!
>=20
> Which timer does this hardware use? DYK if there's some relation
> between the timer hardware used and the issue?
>=20
Timers came to mind but I haven't checked yet.

FWIW, one thing I saw is that, without patches, my machine times out
around...

[    2.364819] NET: Registered protocol family 16
[    2.368018] xen:grant_table: Grant tables using version 1 layout
[    2.372033] Grant table initialized
[    2.377115] ACPI: bus type PCI registered
[    2.380011] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    2.384660] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0x80000000=
-0x8fffffff] (base 0x80000000)
[    2.388033] PCI: MMCONFIG at [mem 0x80000000-0x8fffffff] reserved in E82=
0
[    2.499080] PCI: Using configuration type 1 for base access
[    2.516768] ACPI: Added _OSI(Module Device)
[    2.524006] ACPI: Added _OSI(Processor Device)
[    2.536004] ACPI: Added _OSI(3.0 _SCP Extensions)
[    2.544003] ACPI: Added _OSI(Processor Aggregator Device)
[    2.816022] ACPI: 4 ACPI AML tables successfully acquired and loaded
[    2.852011] xen: registering gsi 9 triggering 0 polarity 0
[    2.856021] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored

... here, during dom0 boot.

[    2.871615] ACPI: Dynamic OEM Table Load:
[    2.941945] ACPI: Interpreter enabled
[    2.952021] ACPI: (supports S0 S3 S4 S5)
[    2.960004] ACPI: Using IOAPIC for interrupt routing
[    2.972031] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    2.993032] ACPI: Enabled 6 GPEs in block 00 to 3F
[    3.042478] ACPI: PCI Root Bridge [UNC1] (domain 0000 [bus ff])
[    3.056010] acpi PNP0A03:02: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    3.079707] acpi PNP0A03:02: _OSC: platform does not support [SHPCHotplu=
g LTR]
[    3.098999] acpi PNP0A03:02: _OSC: OS now controls [PCIeHotplug PME AER =
PCIeCapability]

What do you mean with "Which timer does this hardware use" ?

It's a Intel(R) Xeon(R) CPU E5-2697 and, when booted bare metal, this
is what I see:

# dmesg |grep -i time
[    0.000000] ACPI: PM-Timer IO Port: 0x408
[    0.004000] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 5188.26 BogoMIPS (lpj=3D10376536)
[    0.022602] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.062298] TSC deadline timer enabled
[    0.436174] RTC time: 16:56:42, date: 03/12/20
[    2.117580] RAPL PMU: API unit is 2^-32 Joules, 4 fixed counters, 655360=
 ms ovfl timer
[    2.123351] workingset: timestamp_bits=3D36 max_order=3D23 bucket_order=
=3D0
[    2.288144] intel_idle: lapic_timer_reliable_states 0xffffffff

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-ZWI0ASacHDTfwcINeJKI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5qawwACgkQFkJ4iaW4
c+5gcg/9EQZPeN0bAV4uxjCBx0QGd+8dv1fooy0M5L2JuLbignwG5rwQ2Ceqpn4y
HD+PMOJJVVRFdtDSrBvm7QUjcV2SmVKS3613wgT94d7Bcd+NkR0sy+FlW9qlqeZZ
ZnJeo2LcOgQKdJuRQetq7aVCMVbV6vacM5/hAp+ycxGeQ2yXIj+s4V8kmSuyKulA
zKcnTZFLvQGic7rZhRLxfWzpsPQp4NsIGuitsTY3BjRdr36NSyqSz+8zUnO5ZDvi
1nt2efjevbDQZXz3e+IKkAK///lGwGlK45j6Ix4gOWZxiCfqETsKO19XdlS2AwUq
Q9T1mCIXTyRo9StL6c7MUHD1FohwdDPpk5/y2Hr7ZoTa8tfvRszgFBArnYSOrJVc
IkR3ffFPHHIG9DDHek3TmZTqzyhatEWaXDJX4P0XCl8JcZ5Xs159N0LWhCvf910s
tNLDmfpVcdRQsbLrCxy9SsjfsaDy069O4bWwmU6rIKe0HaFG5WbCN9WGCxH+0jSm
bDAawI5tBFHifBKpMydlC45aH9OQdiTtmrp9Y1AYhq0yGGXcbIo4O5ejw40iJymU
tl7TBpMikDRfRP52DxJa0xJEyLkZZkE69U8Z5BBjRLysMYJpA3YoqYgwIDYhY6QV
PE2VfzNhgTXnXU0AYyKNJOjPMDmy3MTrWyxssNFH4Znu1CAZGMo=
=+PpD
-----END PGP SIGNATURE-----

--=-ZWI0ASacHDTfwcINeJKI--



--===============8734943196174556005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8734943196174556005==--


