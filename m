Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB264803BD1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 18:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647262.1010203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACvm-0000jE-D8; Mon, 04 Dec 2023 17:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647262.1010203; Mon, 04 Dec 2023 17:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACvm-0000gf-9m; Mon, 04 Dec 2023 17:40:30 +0000
Received: by outflank-mailman (input) for mailman id 647262;
 Mon, 04 Dec 2023 17:40:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r4Wa=HP=proton.me=renewin@srs-se1.protection.inumbo.net>)
 id 1rACvj-0000gZ-Nf
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 17:40:28 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3490474b-92cc-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 18:40:25 +0100 (CET)
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
X-Inumbo-ID: 3490474b-92cc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1701711623; x=1701970823;
	bh=Prd9yO0AI5mvo/Hqtmdc6j47eDUY+OS3gy3qYZJET9A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BCG8+UDJw2AFid2hisbL/T4z0VsvlWqEYz6flmKTTAdRYNqwofhHXIPHwQKEw/4sS
	 IO272BBmF5S5JsS+7+zYYUxS0TrGDKBfnDJFWSiu8amvV08/2v74PVPEoHnQDHA2Kg
	 +0WDXjmpQXoDKaqYmH+vPFK3s8vgH5o8OaVca6fNpUo+JXszXI5wIDNCJm6/ndHsdY
	 xKNppGwqKeRw08gkHd33VjkbC+CGjHPmly8HA70d+UY1mmP75EQo1OJJQuSsQY/Vxx
	 1tFuctfv5eM1N+al7x5OOXqxNqdGazEaePSPNgDvaCk8qIDGhxvadnWPcevwFJ4Ish
	 OwFP/FlNwIErQ==
Date: Mon, 04 Dec 2023 17:40:07 +0000
To: Juergen Gross <jgross@suse.com>
From: =?utf-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Cc: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
Message-ID: <eoYHHXdHJzBIPmppjwYPoxVy_LbXN8PCF5FawlOBYMIpqAUeOiPNsW9ZVL3u_iCpzCy7xB0muzDKIfCIDdiFkR-bumO3TgxZkksrOZE7_oE=@proton.me>
In-Reply-To: <dec807bc-8450-48b0-be99-70bf17e62bca@suse.com>
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me> <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com> <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com> <44bbbc6f-607e-4c8c-b4a4-de220345b2b5@suse.com> <1fc21e82-f9f3-4929-a138-2b3de98c06dc@suse.com> <dec807bc-8450-48b0-be99-70bf17e62bca@suse.com>
Feedback-ID: 45853758:user:proton
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------421f8b95fe0fbd45dd94a5daaf07c5f81dc893bddac33491d512ccb044bbed43"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------421f8b95fe0fbd45dd94a5daaf07c5f81dc893bddac33491d512ccb044bbed43
Content-Type: multipart/mixed;boundary=---------------------d45fa8f498a911e229a632c0d0a073a7

-----------------------d45fa8f498a911e229a632c0d0a073a7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi Juergen,

Sorry for the late reply.

Here are the commands I execute, it is 'xl cpupool-cpu-add pcores 4-15' th=
at crash the system.

xl cpupool-cpu-remove Pool-0 4-31
xl cpupool-create name=3D\"ecores\" sched=3D\"credit\"
xl cpupool-cpu-add ecores 16-31

xl cpupool-create name=3D\"pcores\" sched=3D\"credit\"
xl cpupool-cpu-add pcores 4-15


Here is the other information you asked for.

xl cpupool-list:
Name               CPUs   Sched     Active   Domain count
Pool-0              24    credit       y          5

xl cpupool-list -c:
Name               CPU list
Pool-0             0,2,4,6,8,10,12,14,16,17,18,19,20,21,22,23,24,25,26,27,=
28,29,30,31

xl info:
host                   : dom0
release                : 6.1.62-1.qubes.fc37.x86_64
version                : #1 SMP PREEMPT_DYNAMIC Tue Nov 14 06:16:38 GMT 20=
23
machine                : x86_64
nr_cpus                : 24
max_cpu_id             : 31
nr_nodes               : 1
cores_per_socket       : 24
threads_per_core       : 1
cpu_mhz                : 2995.196
hw_caps                : bfebfbff:77faf3ff:2c100800:00000121:0000000f:239c=
27eb:1840078c:00000100
virt_caps              : pv hvm hvm_directio pv_directio hap iommu_hap_pt_=
share vmtrace gnttab-v1
total_memory           : 65373
free_memory            : 56505
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 17
xen_extra              : .2
xen_version            : 4.17.2
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm=
-3.0-x86_64 =


xen_scheduler          : credit
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          : =


xen_commandline        : placeholder dom0_mem=3Dmin:2048M dom0_mem=3Dmax:4=
096M ucode=3Dscan gnttab_max_frames=3D2048 gnttab_max_maptrack_frames=3D40=
96 smt=3Doff dom0_max_vcpus=3D4 dom0_vcpus_pin sched-gran=3Dcore sched=3Dc=
redit no-real-mode edd=3Doff
cc_compiler            : gcc (GCC) 12.3.1 20230508 (Red Hat 12.3.1-1)
cc_compile_by          : mockbuild
cc_compile_domain      : [unknown]
cc_compile_date        : Tue Nov 14 00:00:00 UTC 2023
build_id               : a426597e4f24a9487bed72dafc63d4eb523be22b
xend_config_format     : 4


I'm not sure which file is the cpupool config file, this is the content fr=
om /etc/xen/cpupool
# the name of the new cpupool
name =3D "Example-Cpupool"

# the scheduler to use: valid are e.g. credit, credit2 and rtds
sched =3D "credit"

# list of cpus to use
cpus =3D ["2", "3"]

/rene


On Monday, December 4th, 2023 at 13:07, Juergen Gross <jgross@suse.com> wr=
ote:


> On 04.12.23 11:13, Jan Beulich wrote:
> =


> > On 04.12.2023 11:02, Juergen Gross wrote:
> > =


> > > On 04.12.23 10:15, Jan Beulich wrote:
> > > =


> > > > On 01.12.2023 21:12, Andrew Cooper wrote:
> > > > =


> > > > > On 01/12/2023 7:59 pm, Ren=C3=A9 Winther H=C3=B8jgaard wrote:
> > > > > =


> > > > > > If I set smt=3Doff and try to configure cpupools with credit(1=
) as if
> > > > > > all cores are available, I get the following crash.
> > > > > > =


> > > > > > The crash happens when I try to use xl cpupool-add-cpu on the =
disabled
> > > > > > HT sibling cores.
> > > > > > =


> > > > > > Hyper-threading is enabled in the firmware, and only disabled =
with
> > > > > > smt=3Doff.
> > > > > =


> > > > > CC'ing some maintainers.
> > > > > =


> > > > > I expect this will also explode when a CPU is runtime offlined w=
ith
> > > > > `xen-hptool cpu-offline` and then added to a cpupool.
> > > > > =


> > > > > Interestingly, the crash is mov (%rdx,%rax,1),%r13, and I think =
that's
> > > > > the percpu posion value in %rdx.
> > > > > =


> > > > > I expect cpupools want to reject parked/offline CPUs.
> > > > =


> > > > While the only explicit check there is
> > > > =


> > > > if ( cpu >=3D nr_cpu_ids )
> > > > goto addcpu_out;
> > > > =


> > > > I would have expected this
> > > > =


> > > > if ( !cpumask_subset(cpus, &cpupool_free_cpus) ||
> > > > cpumask_intersects(cpus, &cpupool_locked_cpus) )
> > > > goto addcpu_out;
> > > > =


> > > > to deal with the situation, as parked/offline CPUs shouldn't be "f=
ree".
> > > > J=C3=BCrgen?
> > > =


> > > The problem is the call of sched_get_opt_cpumask() to need the percp=
u area
> > > of the cpu in question.
> > =


> > That was my first thought, too, but then I saw cpupool_assign_cpu_lock=
ed() on
> > the call trace, which is called only afterwards. Plus sched_get_opt_cp=
umask()
> > needs the per-CPU area only when granularity was switched from its def=
ault of
> > SCHED_GRAN_cpu afaics.
> =


> =


> Oh right you are.
> =


> My patch is needed for larger granularities, though.
> =


> I've tried to hit the same problem as Ren=C3=A9, but everything works as=
 intended (no
> crash, but adding an offline cpu is being rejected).
> =


> Ren=C3=A9, could you please tell us what exactly you've been doing? This=
 would be:
> =


> - Xen command line parameters
> - Output of "xl info"
> - Output of "xl cpupool-list" before starting to manipulate cpupools
> - Output of "xl cpupool-list -c" before starting to manipulate cpupools
> - Cpupool config file used to create new cpupool
> - xl commands you've used to setup the cpupool and adding the cpu(s) to =
it
> =


> Thanks,
> =


> =


> Juergen
-----------------------d45fa8f498a911e229a632c0d0a073a7
Content-Type: application/pgp-keys; filename="publickey - renewin@proton.me - 0x43C32E54.asc"; name="publickey - renewin@proton.me - 0x43C32E54.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - renewin@proton.me - 0x43C32E54.asc"; name="publickey - renewin@proton.me - 0x43C32E54.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FWWxmZy9oWUpLd1lCQkFI
YVJ3OEJBUWRBOWhrZnlRblEzVlVETWZsT3FPZU1sc1o0N252eml1cmoKbXJnZTFCd040d3pOSlhK
bGJtVjNhVzVBY0hKdmRHOXVMbTFsSUR4eVpXNWxkMmx1UUhCeWIzUnZiaTV0ClpUN0Nqd1FRRmdv
QUlBVUNZbGZnL2dZTENRY0lBd0lFRlFnS0FnUVdBZ0VBQWhrQkFoc0RBaDRCQUNFSgpFQXRxSisz
WXh1S1hGaUVFUThNdVZIeDNmREZGcnZqSEMyb243ZGpHNHBkYUtBRC9WMnNlNk5lTGJ0VkkKVzVB
ck1XRHdJN21xZ0dNSDgrQ3ZCelh1RUE5Y2xrOEEvUkNLbjdzRE1HZVJzWVNENWNFRXdidVRLK01B
CkZ4T2owaEZGOS9PNHRxQUd6amdFWWxmZy9oSUtLd1lCQkFHWFZRRUZBUUVIUUlmc3ozdGNhVElk
MWp2YQpZVG12NURmdUVRVGY4V2s3RmtGVG5LNHltMjRJQXdFSUI4SjRCQmdXQ0FBSkJRSmlWK0Qr
QWhzTUFDRUoKRUF0cUorM1l4dUtYRmlFRVE4TXVWSHgzZkRGRnJ2akhDMm9uN2RqRzRwZDZpUUQr
TzVrR0w2ZjhndktJCmlpSStidS94NkFacytvNGZERmVlc052bS9TWkFRZUVBLzBxbEw1RHR2ckJD
TjY5b2xZMERlRjQ1d0R0bQpEbDlIZ2dtc09sdXRTYzRCCj1xUFNVCi0tLS0tRU5EIFBHUCBQVUJM
SUMgS0VZIEJMT0NLLS0tLS0K
-----------------------d45fa8f498a911e229a632c0d0a073a7--

--------421f8b95fe0fbd45dd94a5daaf07c5f81dc893bddac33491d512ccb044bbed43
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmVuDtoJkAtqJ+3YxuKXFiEEQ8MuVHx3fDFFrvjHC2on7djG
4pcAAJywAP9doH5ldQrU5Lc+C8yuJkUm/SWJnPqSvTo+APaCtDspWgD9G7P+
fe2G/pav0druKMzhG8LiaOwDnC3UHhtt5czlzgU=
=GkUX
-----END PGP SIGNATURE-----


--------421f8b95fe0fbd45dd94a5daaf07c5f81dc893bddac33491d512ccb044bbed43--


