Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFB7A001F0
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2025 01:20:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864517.1275746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTVP1-0001a1-AT; Fri, 03 Jan 2025 00:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864517.1275746; Fri, 03 Jan 2025 00:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTVP1-0001XD-6i; Fri, 03 Jan 2025 00:18:59 +0000
Received: by outflank-mailman (input) for mailman id 864517;
 Fri, 03 Jan 2025 00:18:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LdeY=T3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tTVOz-0001X6-2f
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 00:18:57 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 504f3cbc-c968-11ef-a0dc-8be0dac302b0;
 Fri, 03 Jan 2025 01:18:54 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id A96B92540127;
 Thu,  2 Jan 2025 19:18:52 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 02 Jan 2025 19:18:52 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jan 2025 19:18:51 -0500 (EST)
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
X-Inumbo-ID: 504f3cbc-c968-11ef-a0dc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1735863532;
	 x=1735949932; bh=jQ+2lcS+cegYt/fHnf05rCvZ1YXLp0Bl8E1QQdiIZ9o=; b=
	Rnai7dOclW8cWynmVnRgXRoqIBSswvBOSLwdASZBiexWuNUjMpWmGR4vMCp53ow4
	nN9fuXu9w7F4PKdvlIqKsP9HSknx2m6H+ushUWbqroE1bUhEA6ST9Wi0KXsVMPok
	fk2yhuJQr0b3UWP7qTE4M285fXbygs7BP0HBkbfNyEdtljobFWmeHoFakK8E4SvZ
	bSAqKyijP7O8HCEHcTzY8PSH4LDpRg/oqtSakkvJJ+fIbr2KmXg+q1hdE7DqziLC
	V3biEOYcgjK5jk7bmyBlQMRQmgY587ah1vwnPjEXhSj/5JAdRhVeH7mEvVN9IKtZ
	J2NMN9hNRX93SgnKgJ6pWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735863532; x=1735949932; bh=jQ+2lcS+cegYt/fHnf05rCvZ1YXLp0Bl8E1
	QQdiIZ9o=; b=kpvaoR4jWTfoVwxPU2Ct9sPMa+h7omRBq9gbFSuReoXx3VHqKUa
	03FzY+WzkYZvcI3ORos80M0vF8pJU76jWcBufeC2C0lMqol4eQ6zO611ajq4Ih8S
	oYkSdqoILo1im5ECvndz+1w2nHc4CuhS78or0ZYxcpgWyVMqH7T9Cn/0XDlhM/pf
	4iGc3LN1CC1q5yP2hhT4T+XIRGJJntdMM7sd4VWOhyRM8UntnWuViR3A0qY2t1Jg
	ZIIusC0t5QMpPvkqOCjF1GGGuzp+RXkLv7++L/qj4qUjUEndlhCPS/HStxVn+Kx7
	TKW3JFJwGoZKvF7QKEub3YFRBAaau6hE5xQ==
X-ME-Sender: <xms:7Cx3Z6gAmSHYimSKMj3mCdOdC4yNg5nP1YS1SH_kXJF2nHgmQa-FkA>
    <xme:7Cx3Z7BTklc6tv3KhWXf7_hjijIX5b5RLK-3xtcpnlUe3egq7bTQ1Onj1qD1Q8qFT
    ehjzpccfE_YAg>
X-ME-Received: <xmr:7Cx3ZyEaHn7ZtGoFo8wtl2EJCAeXabQlLj7z2OWGr0yaWvROENlxy_c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeffedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepjeejgfekudegheeivdeiffdvffegteektdfhudeljeeikefhteefke
    efgffgieegnecuffhomhgrihhnpehquhgsvghsqdhoshdrohhrghdpghhithhhuhgsrdgt
    ohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghr
    tghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhgrhhoshhsse
    hsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghn
    phhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestg
    hithhrihigrdgtohhm
X-ME-Proxy: <xmx:7Cx3ZzQymrci3Er0owFL0EMt6A95NHUF6GJtVDw3JEtIW-JhsxBd4w>
    <xmx:7Cx3Z3zc9VHzuNBawe94Xpy2TouycD1lrz1BOpWTIeEpQPn9c-_TFA>
    <xmx:7Cx3Zx7l_BQBH-H67LYUepsV7poIdK8UWoBHAwV6Dlt7HNrqnN0ngA>
    <xmx:7Cx3Z0wTzNNiRdmhRBOARbTQaaRUOkeNg2Nt7AA69XP5QGa1AkjDLQ>
    <xmx:7Cx3Z3-Q5WsBusL4ZjUL-cYgyhkY80YadhRySJVHKOnp9pcuMlXLpYEv>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 3 Jan 2025 01:18:31 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
Message-ID: <Z3cs1-wG5WJ9FrAR@mail-itl>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
 <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
 <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com>
 <Z3aFdrygLF9yK2EK@mail-itl>
 <Z3bg-gvaBEdSIuRW@mail-itl>
 <08f9604b-df23-4766-a290-ef9daa506f8d@suse.com>
 <Z3brZQmYhx-QTnga@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ohVQ3jw0K38kRcl+"
Content-Disposition: inline
In-Reply-To: <Z3brZQmYhx-QTnga@mail-itl>


--ohVQ3jw0K38kRcl+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 3 Jan 2025 01:18:31 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0

On Thu, Jan 02, 2025 at 08:39:16PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Jan 02, 2025 at 08:17:00PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> > On 02.01.25 19:54, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Thu, Jan 02, 2025 at 01:24:21PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Thu, Jan 02, 2025 at 12:30:10PM +0100, Juergen Gross wrote:
> > > > > On 02.01.25 11:20, J=C3=BCrgen Gro=C3=9F wrote:
> > > > > > On 19.12.24 17:14, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > It crashes on boot like below, most of the times. But sometim=
es (rarely)
> > > > > > > it manages to stay alive. Below I'm pasting few of the crashe=
s that look
> > > > > > > distinctly different, if you follow the links, you can find m=
ore of
> > > > > > > them. IMHO it looks like some memory corruption bug somewhere=
=2E I tested
> > > > > > > also Linux 6.13-rc2 before, and it had very similar issue.
> > > > > >=20
> > > > > > ...
> > > > > >=20
> > > > > > >=20
> > > > > > > Full log:
> > > > > > > https://openqa.qubes-os.org/tests/122879/logfile?filename=3Ds=
erial0.txt
> > > > > >=20
> > > > > > I can reproduce a crash with 6.13-rc5 PV dom0.
> > > > > >=20
> > > > > > What is really interesting in the logs: most crashes seem to ha=
ppen right
> > > > > > after a module being loaded (in my reproducer it was right afte=
r loading
> > > > > > the first module).
> > > > > >=20
> > > > > > I need to go through the 6.13 commits, but I think I remember h=
aving seen
> > > > > > a patch optimizing module loading by using large pages for addr=
essing the
> > > > > > loaded modules. Maybe the case of no large pages being availabl=
e isn't
> > > > > > handled properly.
> > > > >=20
> > > > > Seems I was right.
> > > > >=20
> > > > > For me the following diff fixes the issue. Marek, can you please =
confirm
> > > > > it fixes your crashes, too?
> > > >=20
> > > > Thanks for looking into it!
> > > > Will do, I've pushed it to
> > > > https://github.com/QubesOS/qubes-linux-kernel/pull/662, CI will bui=
ld it
> > > > and then I'll post it to openQA.
> > >=20
> > > It is much better!
> > >=20
> > > Tests are still running, but I already see that many are green.
> >=20
> > So are you fine with me adding your "Tested-by:"?
>=20
> Yes.
>=20
> > > There is
> > > one issue (likely unrelated to this change) - sys-usb (HVM domU with =
USB
> > > controllers passed through) crashes on a system with Raptor Lake CPU
> > > (only, others, including ADL and MTL look fine):

Correction, it does happen on some others too, just got the crash on the ADL
system, although looks a bit different ("Corrupted page table at ..."):

sys-usb login: [2025-01-02 23:44:58] [    7.295556] Bluetooth: hci0: Waitin=
g for firmware download to complete
[    7.296996] Bluetooth: hci0: Firmware loaded in 2882606 usecs
[    7.297276] Bluetooth: hci0: Waiting for device to boot
[    7.313074] Bluetooth: hci0: Device booted in 15473 usecs
[    7.318447] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-1040-=
0041.ddc
[    7.321060] Bluetooth: hci0: Applying Intel DDC parameters completed
[    7.322057] Bluetooth: hci0: No support for BT device in ACPI firmware
[    7.324037] Bluetooth: hci0: Firmware timestamp 2024.33 buildtype 1 buil=
d 81755
[    7.324085] Bluetooth: hci0: Firmware SHA1: 0xd028ffe4
[    7.327995] Bluetooth: hci0: Fseq status: Success (0x00)
[    7.328017] Bluetooth: hci0: Fseq executed: 00.00.02.41
[    7.328032] Bluetooth: hci0: Fseq BT Top: 00.00.02.41
[    7.396950] Bluetooth: MGMT ver 1.23
[    9.352650] kauditd_printk_skb: 82 callbacks suppressed
[    9.352655] audit: type=3D1131 audit(1735861500.506:81): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-rfkill comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   15.808157] audit: type=3D1100 audit(1735861506.961:82): pid=3D867 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:xdm_t:s0-s=
0:c0.c1023 msg=3D'op=3DPAM:authentication grantors=3Dpam_rootok acct=3D"use=
r" exe=3D"/usr/bin/qubes-gui-runuser" hostname=3Dsys-usb addr=3D? terminal=
=3D/dev/tty7 res=3Dsuccess'
[   15.808860] audit: type=3D1100 audit(1735861506.962:83): pid=3D866 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:local_logi=
n_t:s0-s0:c0.c1023 msg=3D'op=3DPAM:authentication grantors=3Dpam_rootok acc=
t=3D"user" exe=3D"/usr/lib/qubes/qrexec-agent" hostname=3D? addr=3D? termin=
al=3D? res=3Dsuccess'
[   15.814137] audit: type=3D1103 audit(1735861506.967:84): pid=3D867 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:xdm_t:s0-s=
0:c0.c1023 msg=3D'op=3DPAM:setcred grantors=3Dpam_rootok acct=3D"user" exe=
=3D"/usr/bin/qubes-gui-runuser" hostname=3Dsys-usb addr=3D? terminal=3D/dev=
/tty7 res=3Dsuccess'
[   15.814816] audit: type=3D1006 audit(1735861506.968:85): pid=3D867 uid=
=3D0 subj=3Dsystem_u:system_r:xdm_t:s0-s0:c0.c1023 old-auid=3D4294967295 au=
id=3D1000 tty=3Dtty7 old-ses=3D4294967295 ses=3D1 res=3D1
[   15.815078] audit: type=3D1300 audit(1735861506.968:85): arch=3Dc000003e=
 syscall=3D1 success=3Dyes exit=3D4 a0=3D3 a1=3D7ffe29c03a70 a2=3D4 a3=3D0 =
items=3D0 ppid=3D712 pid=3D867 auid=3D1000 uid=3D0 gid=3D0 euid=3D0 suid=3D=
0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dtty7 ses=3D1 comm=3D"qubes-gu=
i-runus" exe=3D"/usr/bin/qubes-gui-runuser" subj=3Dsystem_u:system_r:xdm_t:=
s0-s0:c0.c1023 key=3D(null)
[   15.815164] audit: type=3D1327 audit(1735861506.968:85): proctitle=3D2F7=
573722F62696E2F71756265732D6775692D72756E757365720075736572002F62696E2F7368=
002D6C002D630065786563202F7573722F62696E2F78696E6974202F6574632F5831312F786=
96E69742F78696E69747263202D2D202F7573722F6C69622F71756265732F71756265732D78=
6F72672D77726170706572203A30
[   15.815420] audit: type=3D1103 audit(1735861506.969:86): pid=3D866 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:local_logi=
n_t:s0-s0:c0.c1023 msg=3D'op=3DPAM:setcred grantors=3Dpam_rootok acct=3D"us=
er" exe=3D"/usr/lib/qubes/qrexec-agent" hostname=3D? addr=3D? terminal=3D? =
res=3Dsuccess'
[   15.816039] audit: type=3D1006 audit(1735861506.969:87): pid=3D866 uid=
=3D0 subj=3Dsystem_u:system_r:local_login_t:s0-s0:c0.c1023 old-auid=3D42949=
67295 auid=3D1000 tty=3D(none) old-ses=3D4294967295 ses=3D2 res=3D1
[   15.817029] audit: type=3D1300 audit(1735861506.969:87): arch=3Dc000003e=
 syscall=3D1 success=3Dyes exit=3D4 a0=3D3 a1=3D7ffe550c1c30 a2=3D4 a3=3D0 =
items=3D0 ppid=3D864 pid=3D866 auid=3D1000 uid=3D0 gid=3D0 euid=3D0 suid=3D=
0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D2 comm=3D"qrexec=
-agent" exe=3D"/usr/lib/qubes/qrexec-agent" subj=3Dsystem_u:system_r:local_=
login_t:s0-s0:c0.c1023 key=3D(null)
[   15.817160] audit: type=3D1327 audit(1735861506.969:87): proctitle=3D"/u=
sr/lib/qubes/qrexec-agent"
[   16.111133] systemd-journald[366]: Time jumped backwards, rotating.
th: RFCOMM TTY layer initialized
[   18.286026] Bluetooth: RFCOMM socket layer initialized
[   18.286035] Bluetooth: RFCOMM ver 1.11
[   18.469074] abrt-dump-journ: Corrupted page table at address 78c64b600010
[   18.469096] PGD 14980067 P4D 14980067 PUD 14981067 PMD 38c8047 PTE 243c8=
b48ffffff57
[   18.469117] Oops: Bad pagetable: 000d [#1] PREEMPT SMP NOPTI
[   18.469132] CPU: 1 UID: 0 PID: 657 Comm: abrt-dump-journ Not tainted 6.1=
3.0-0.rc5.2.qubes.1.fc41.x86_64 #1
[   18.469152] Hardware name: Xen HVM domU, BIOS 4.19.0 01/02/2025
[   18.469165] RIP: 0033:0x78c64e1bc9a0
[   18.469177] Code: 86 f5 01 00 00 49 8b 7c 24 38 48 85 ff 0f 84 08 03 00 =
00 48 8d 0d 40 e6 ff ff ba 18 00 00 00 e8 46 c7 fa ff e9 d1 01 00 00 90 <0f=
> b6 50 10 38 96 c8 01 00 00 0f 85 63 fd ff ff 80 fa 02 0f 84 4c
[   18.469211] RSP: 002b:00007ffcdc67a8b0 EFLAGS: 00010246
[   18.469223] RAX: 000078c64b600000 RBX: 00006045c444c890 RCX: 00000000000=
00048
[   18.469238] RDX: 0000000000000000 RSI: 00006045c444c890 RDI: 00006045c44=
4f040
[   18.469253] RBP: 00007ffcdc67a930 R08: 00006045c43a1010 R09: 00000000000=
00001
[   18.469268] R10: 00006045c44098b0 R11: 0000000000000246 R12: 00006045c44=
4f040
[   18.469284] R13: 00006045c4409890 R14: 00006045c444c890 R15: 00000000000=
00000
[   18.469299] FS:  000078c64d675400 GS:  0000000000000000
[   18.469310] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq=
_device snd_timer snd soundcore rfcomm bnep btusb btrtl btintel btbcm btmtk=
 bluetooth rfkill nft_reject_ipv6 nf_reject_ipv6 nft_reject_ipv4 nf_reject_=
ipv4 nft_reject nft_ct nft_masq nft_chain_nat nf_nat nf_conntrack nf_defrag=
_ipv6 nf_defrag_ipv4 joydev nf_tables intel_rapl_msr intel_rapl_common inte=
l_uncore_frequency_common intel_pmc_core intel_vsec pmt_telemetry pmt_class=
 crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic=
 ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 xhci_pci ehci_pci=
 xhci_hcd ehci_hcd pcspkr i2c_piix4 i2c_smbus ata_generic pata_acpi serio_r=
aw xen_scsiback target_core_mod xen_netback xen_privcmd xen_gntdev xen_gnta=
lloc xen_blkback xen_evtchn loop fuse nfnetlink overlay xen_blkfront
[   18.469484] ---[ end trace 0000000000000000 ]---
[   18.469495] RIP: 0033:0x78c64e1bc9a0
[   18.469504] RSP: 002b:00007ffcdc67a8b0 EFLAGS: 00010246
[   18.469516] RAX: 000078c64b600000 RBX: 00006045c444c890 RCX: 00000000000=
00048
[   18.469531] RDX: 0000000000000000 RSI: 00006045c444c890 RDI: 00006045c44=
4f040
[   18.469547] RBP: 00007ffcdc67a930 R08: 00006045c43a1010 R09: 00000000000=
00001
[   18.469562] R10: 00006045c44098b0 R11: 0000000000000246 R12: 00006045c44=
4f040
[   18.469577] R13: 00006045c4409890 R14: 00006045c444c890 R15: 00000000000=
00000
[   18.469593] FS:  000078c64d675400(0000) GS:ffff9de397100000(0000) knlGS:=
0000000000000000
[   18.469609] CS:  0033 DS: 0000 ES: 0000 CR0: 0000000080050033
[   18.469623] CR2: 000078c64b600010 CR3: 0000000000164004 CR4: 00000000007=
70ef0
[   18.469640] PKRU: 55555554
[   18.469646] Kernel panic - not syncing: Fatal exception
[   18.469706] Kernel Offset: 0x2ec00000 from 0xffffffff80200000 (relocatio=
n range: 0xffffffff80000000-0xffffffffbfffffff)


> > > [   75.770849] Bluetooth: Core ver 2.22
> > > [   75.770866] Oops: general protection fault, probably for non-canon=
ical address 0xc9d2315bc82c3bbd: 0000 [#1] PREEMPT SMP NOPTI
> > > [   75.770880] CPU: 0 UID: 0 PID: 923 Comm: (udev-worker) Not tainted=
 6.13.0-0.rc5.2.qubes.1.fc41.x86_64 #1
> > > [   75.770890] Hardware name: Xen HVM domU, BIOS 4.19.0 01/02/2025
> > > [   75.770897] RIP: 0010:msft_monitor_device_del+0x93/0x170 [bluetoot=
h]
> > > [   75.770924] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 d0 65 =
21 <26> 2b 8b ad 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >=20
> > This code is looking suspicious. Large areas of binary 0 in a normal fu=
nction?
> > And the code itself is nonsense, as it is using a memory access via ES:=
, which
> > doesn't make any sense in 64-bit kernel.
>=20
> Could it be still something related to modules layout in memory?
> It seems it's not 100% reliable crash, I see in at least one instance
> sys-usb remained running (unfortunately I don't have collected full
> sys-usb console log from successful test...).
>=20
> I just checked again that this crash didn't happen with any 6.12 or 6.11
> kernels.
>=20
> --=20
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ohVQ3jw0K38kRcl+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd3LNcACgkQ24/THMrX
1yxjcwf/fRzQ8G7wDeafC62DK1dxDy7fqJnQQSDHrcAHfLamZlKhRiLHIHKUa5Qb
O5RbtFPEYe+ePqJerBZo1G68QzLr0VZ0P+o5MLD+bD8dkSdDHGc1g83YLG4P8qqF
ph710nW54m4GBoqYDId+BlJ2deoH6BYM1P5IxfHHFJk3UT4eHeS6HwJMJrW8YAlD
GRsFFsKpbhgwFQBQQYQiUes+Ah0+pDcdtB2LeqzxeWnNwbbq8VX8wh3zLJolz6Ra
kphj9HPmnSzRJDKtU/73QJ9g67JKSzl7b/i3spNmfD3PKwD7Vvw+dPtXCAge1aQK
PTLkVQLgh2o1kOP8x/qmxhSyxSNU/w==
=SVp+
-----END PGP SIGNATURE-----

--ohVQ3jw0K38kRcl+--

