Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330C5805B16
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 18:25:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648157.1012222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAZAX-0001s9-Iv; Tue, 05 Dec 2023 17:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648157.1012222; Tue, 05 Dec 2023 17:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAZAX-0001pz-GI; Tue, 05 Dec 2023 17:25:13 +0000
Received: by outflank-mailman (input) for mailman id 648157;
 Tue, 05 Dec 2023 17:25:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rbgk=HQ=proton.me=renewin@srs-se1.protection.inumbo.net>)
 id 1rAZAV-0001pt-5C
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 17:25:12 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c4d51e4-9393-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 18:25:07 +0100 (CET)
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
X-Inumbo-ID: 3c4d51e4-9393-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1701797107; x=1702056307;
	bh=CEcQRcIn7plPS46ALOZW3CbBXq4NhHTbqsZujfE13+8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OeOcdfRJUOu0xctixHkV0f1Idkv5Bh2P29CY7di5Ak0HHdBXW3iKbGEeidPa6NoCE
	 ECM8jNrc7DdDJNvKYhe2Ue+Ega2oH1V+qhkBCM4qUedHXZo4Xuyd8had3dKnh5+Hvj
	 JA6wcR6lVoGt5H7MMu5bGgZf1MUHhh4IzKhA+JYq57km+1IM4Tb+y1A4o0aNZssFPA
	 28GY1BDtNyOwDoACkdR0B6sG9Nn0JoNbkSY6ODCS2t7DqbspGgloeuAVZuxF0HuElV
	 BFllJPnLjFlWiB/T4FlecY1FbOUI9VrmI1WoDt7G8DkwpTaIYjYLMpWqgWQjEfunu2
	 QoZ0Cf7AsmojA==
Date: Tue, 05 Dec 2023 17:24:44 +0000
To: Juergen Gross <jgross@suse.com>
From: =?utf-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Cc: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
Message-ID: <RWTcalGTi6AWz6y3kGdVeeviN3FSE96OVVCyH-DL9qySYjv0jImv0avp2uCDGGTtUm830cGTQeffygUZXECli4JChABgzUyUjsv2zFJiTVU=@proton.me>
In-Reply-To: <4f6445b2-f871-415a-aa72-7c08a2c357e0@suse.com>
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me> <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com> <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com> <44bbbc6f-607e-4c8c-b4a4-de220345b2b5@suse.com> <1fc21e82-f9f3-4929-a138-2b3de98c06dc@suse.com> <dec807bc-8450-48b0-be99-70bf17e62bca@suse.com> <eoYHHXdHJzBIPmppjwYPoxVy_LbXN8PCF5FawlOBYMIpqAUeOiPNsW9ZVL3u_iCpzCy7xB0muzDKIfCIDdiFkR-bumO3TgxZkksrOZE7_oE=@proton.me> <4f6445b2-f871-415a-aa72-7c08a2c357e0@suse.com>
Feedback-ID: 45853758:user:proton
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------5169c2fae1025291f41601eaf70825899bcddb48543b224f07981b9084c5108d"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------5169c2fae1025291f41601eaf70825899bcddb48543b224f07981b9084c5108d
Content-Type: multipart/mixed;boundary=---------------------d7db68ad1a997730490d21f776c8386f

-----------------------d7db68ad1a997730490d21f776c8386f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

You are right about sched-gran=3Dcore being the issue.

I don't know if this is relevant, but my CPU shouldn't be able to use sche=
d-gran=3Dcore it's asymmetric.

smt=3Don with sched-gran=3Dcore gives me a warning that it's falling back =
to sched-gran=3Dcpu, I tested smt=3Doff with sched-gran=3Dcpu and it works=
.

This warning is missing with sched-gran=3Dcore and smt=3Doff =


(XEN) ***************************************************
(XEN) Asymmetric cpu configuration.
(XEN) Falling back to sched-gran=3Dcpu.
(XEN) ***************************************************


/rene


On Tuesday, December 5th, 2023 at 07:21, Juergen Gross <jgross@suse.com> w=
rote:


> On 04.12.23 18:40, Ren=C3=A9 Winther H=C3=B8jgaard wrote:
> =


> > Hi Juergen,
> > =


> > Sorry for the late reply.
> > =


> > Here are the commands I execute, it is 'xl cpupool-cpu-add pcores 4-15=
' that crash the system.
> > =


> > xl cpupool-cpu-remove Pool-0 4-31
> > xl cpupool-create name=3D\"ecores\" sched=3D\"credit\"
> > xl cpupool-cpu-add ecores 16-31
> > =


> > xl cpupool-create name=3D\"pcores\" sched=3D\"credit\"
> > xl cpupool-cpu-add pcores 4-15
> > =


> > Here is the other information you asked for.
> > =


> > xl cpupool-list:
> > Name CPUs Sched Active Domain count
> > Pool-0 24 credit y 5
> > =


> > xl cpupool-list -c:
> > Name CPU list
> > Pool-0 0,2,4,6,8,10,12,14,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30=
,31
> > =


> > xl info:
> > host : dom0
> > release : 6.1.62-1.qubes.fc37.x86_64
> > version : #1 SMP PREEMPT_DYNAMIC Tue Nov 14 06:16:38 GMT 2023
> > machine : x86_64
> > nr_cpus : 24
> > max_cpu_id : 31
> > nr_nodes : 1
> > cores_per_socket : 24
> > threads_per_core : 1
> > cpu_mhz : 2995.196
> > hw_caps : bfebfbff:77faf3ff:2c100800:00000121:0000000f:239c27eb:184007=
8c:00000100
> > virt_caps : pv hvm hvm_directio pv_directio hap iommu_hap_pt_share vmt=
race gnttab-v1
> > total_memory : 65373
> > free_memory : 56505
> > sharing_freed_memory : 0
> > sharing_used_memory : 0
> > outstanding_claims : 0
> > free_cpus : 0
> > xen_major : 4
> > xen_minor : 17
> > xen_extra : .2
> > xen_version : 4.17.2
> > xen_caps : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_6=
4
> > =


> > xen_scheduler : credit
> > xen_pagesize : 4096
> > platform_params : virt_start=3D0xffff800000000000
> > xen_changeset :
> > =


> > xen_commandline : placeholder dom0_mem=3Dmin:2048M dom0_mem=3Dmax:4096=
M ucode=3Dscan gnttab_max_frames=3D2048 gnttab_max_maptrack_frames=3D4096 =
smt=3Doff dom0_max_vcpus=3D4 dom0_vcpus_pin sched-gran=3Dcore sched=3Dcred=
it no-real-mode edd=3Doff
> =


> =


> Please drop the "sched-gran=3Dcore" from the Xen boot parameters. It doe=
sn't make
> any sense with smt=3Doff and is adding additional complexity.
> =


> It shouldn't crash, but core scheduling is still "Experimental". I'll lo=
ok into
> the issue later.
> =


> =


> Juergen
-----------------------d7db68ad1a997730490d21f776c8386f
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
-----------------------d7db68ad1a997730490d21f776c8386f--

--------5169c2fae1025291f41601eaf70825899bcddb48543b224f07981b9084c5108d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmVvXMkJkAtqJ+3YxuKXFiEEQ8MuVHx3fDFFrvjHC2on7djG
4pcAACORAQCReT16oCU3/ubwLU5uW0YDmar9uG9bd6J8BRscdb/r4gEA80sy
ApPzs47BJz9FPaTmcDxgmYOvsTdoq2Rl+5a1mAA=
=mkNj
-----END PGP SIGNATURE-----


--------5169c2fae1025291f41601eaf70825899bcddb48543b224f07981b9084c5108d--


