Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1F29BD3A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 17:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12971.33471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXS7i-0002aT-Ks; Tue, 27 Oct 2020 16:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12971.33471; Tue, 27 Oct 2020 16:47:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXS7i-0002a7-HR; Tue, 27 Oct 2020 16:47:02 +0000
Received: by outflank-mailman (input) for mailman id 12971;
 Tue, 27 Oct 2020 16:47:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOid=EC=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kXS7g-0002a2-Vb
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 16:47:01 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75b9b1a1-092d-46c7-898a-64f76140e3e7;
 Tue, 27 Oct 2020 16:46:59 +0000 (UTC)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1603817213048288.2248765640369;
 Tue, 27 Oct 2020 09:46:53 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zOid=EC=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kXS7g-0002a2-Vb
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 16:47:01 +0000
X-Inumbo-ID: 75b9b1a1-092d-46c7-898a-64f76140e3e7
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 75b9b1a1-092d-46c7-898a-64f76140e3e7;
	Tue, 27 Oct 2020 16:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1603817215; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U5cjdclwu0P5TdEv3W4TBPGw3FeqHJchlqnyY+A+LPJD86cHb6oFETDKoejn6ynuiBb5kqwGXkkj49EKWEE/6cjV4XCaL3/TFoKUn/9bP+AnzMeTFmxXVRQCA1nGpnywkU829K5kUZ1wyPE2UZ4BF3b3owJah2VNE1bzYDZOouo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1603817215; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ZGnuTaMNeroUiaMV+En9CbWZ/kq0ioLsTMCpdOf8/js=; 
	b=KfXCpxn/pZuSVUyFOhnRw/7RLGT7UZG+vFEcxVJnaUuj2yEbpsDCRdxG3YYq+OddGR1vGOgmDu9EF4MHJL5lzkOW3YNzs4qpPCu/tNTDR97BU84muqFRbDzWpswZLJd/D4IAqAKuozR54/U97srIlUVxpJnV1E1zcayQZsBiuFs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1603817215;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Subject:MIME-Version:Content-Type;
	bh=ZGnuTaMNeroUiaMV+En9CbWZ/kq0ioLsTMCpdOf8/js=;
	b=EdmoyNjUo4ovsCEfdbAhmKF8B5S31OztI7DgcsIkVBV/7QcEsJrFxCx+8Pskz2Q1
	+cU7rnhFbvjDp+NeYf3pjToaDocF7yf3CunrCy12KHbfTuMgQStqmxfo4hjPOVSH+xk
	vUaSIDaWpxl50kD64V3AJgoP0t4IoUcocprvdXus=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1603817213048288.2248765640369; Tue, 27 Oct 2020 09:46:53 -0700 (PDT)
Date: Tue, 27 Oct 2020 17:46:53 +0100
From: =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Pierret?= <frederic.pierret@qubes-os.org>
To: "Dario Faggioli" <dfaggioli@suse.com>
Cc: =?UTF-8?Q?=22J=C3=BCrgen_Gro=C3=9F=22?= <jgross@suse.com>,
	"George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Message-Id: <1756af48c73.12516f93769803.5250908833716445433@qubes-os.org>
In-Reply-To: <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
	 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
	 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
	 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
	 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com> <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_224604_740662196.1603817213043"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

------=_Part_224604_740662196.1603817213043
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---- On Tue, 27 Oct 2020 10:22:42 +0100 Dario Faggioli <dfaggioli@suse.com>=
 wrote ----



On Tue, 2020-10-27 at 06:58 +0100, J=C3=BCrgen Gro=C3=9F wrote:=20
> On 26.10.20 17:31, Dario Faggioli wrote:=20
> >=20
> > Or did you have something completely different in mind, and I'm=20
> > missing=20
> > it?=20
>=20
> No, I think you are right. I mixed that up with __context_switch()=20
> not=20
> being called.=20
>=20
Right.=20
=20
> Sorry for the noise,=20
>=20
Sure, no problem.=20
=20
In fact, this issue is apparently scheduler independent. It indeed=20
seemd to be related to the other report we have "BUG: credit=3Dsched2=20
machine hang when using DRAKVUF", but there it looks like it is=20
scheduler-dependant.=20
=20
Might it be something that lies somewhere else, but Credit2 is=20
triggering it faster/easier? (Just thinking out loud...)=20
=20
For Frederic, what happens is that dom0 hangs, right? So you're able to=20
poke at Xen with some debugkeys (like 'r' for the scheduler's status,=20
and the ones for the domain's vCPUs)?=20
=20
If yes, it may be useful to see the output.=20
=20
Regards=20
--=20
Dario Faggioli, Ph.D=20
http://about.me/dario.faggioli=20
Virtualization Software Engineer=20
SUSE Labs, SUSE https://www.suse.com/=20
-------------------------------------------------------------------=20
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)=20






First=C2=A0of=C2=A0all,=C2=A0sorry=C2=A0for=C2=A0the=C2=A0possible=C2=A0dup=
licates.=C2=A0I=C2=A0had=C2=A0network=C2=A0issue=C2=A0due=C2=A0to=C2=A0subs=
equent=C2=A0freezes=C2=A0(...)=C2=A0while=C2=A0writing=C2=A0to=C2=A0you=C2=
=A0and=C2=A0Marek=C2=A0has=C2=A0not=C2=A0received=C2=A0my=C2=A0previous=C2=
=A0mails=C2=A0so=C2=A0here=C2=A0the=C2=A0info.=20

=20

=20

To=C2=A0answer=C2=A0your=C2=A0question=C2=A0Dario,=C2=A0yes=C2=A0dom0=C2=A0=
hangs=C2=A0totally=C2=A0and=C2=A0VMs=C2=A0too.=C2=A0In=C2=A0the=C2=A0case=
=C2=A0of=C2=A0`sched=3Dcredit`,=C2=A0I've=C2=A0succeeded=C2=A0to=C2=A0obtai=
n=C2=A0the=C2=A0output=C2=A0of=C2=A0'r'=C2=A0debug-keys=C2=A0in=C2=A0serial=
=C2=A0console:=20

```=20

(XEN)=C2=A0sched_smt_power_savings:=C2=A0disabled=20

(XEN)=C2=A0NOW=3D72810702614697=20

(XEN)=C2=A0Online=C2=A0Cpus:=C2=A00-15=20

(XEN)=C2=A0Cpupool=C2=A00:=20

(XEN)=C2=A0Cpus:=C2=A00-15=20

(XEN)=C2=A0Scheduling=C2=A0granularity:=C2=A0cpu,=C2=A01=C2=A0CPU=C2=A0per=
=C2=A0sched-resource=20

(XEN)=C2=A0Scheduler:=C2=A0SMP=C2=A0Credit=C2=A0Scheduler=C2=A0(credit)=20

(XEN)=C2=A0info:=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ncpus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D=C2=A016=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0master=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D=C2=A00=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0credit=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D=C2=A04800=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0credit=C2=A0balance=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=3D=C2=A0608=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0weight=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D=C2=A012256=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0runq_sort=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D=C2=A0996335=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default-weight=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=3D=C2=A0256=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tslice=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D=C2=A030ms=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ratelimit=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D=C2=A01000us=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0credits=C2=A0per=C2=A0msec=C2=A0=C2=A0=
=C2=A0=3D=C2=A010=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ticks=C2=A0per=C2=A0tslice=C2=A0=C2=A0=
=C2=A0=3D=C2=A03=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0migration=C2=A0delay=C2=A0=C2=A0=C2=A0=
=C2=A0=3D=C2=A00us=20

(XEN)=C2=A0idlers:=C2=A000000000,00003c99=20

(XEN)=C2=A0active=C2=A0units:=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01:=C2=A0[0.1]=C2=A0pri=3D-1=
=C2=A0flags=3D0=C2=A0cpu=3D6=C2=A0credit=3D214=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02:=C2=A0[0.4]=C2=A0pri=3D-1=
=C2=A0flags=3D0=C2=A0cpu=3D8=C2=A0credit=3D115=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03:=C2=A0[0.5]=C2=A0pri=3D-1=
=C2=A0flags=3D0=C2=A0cpu=3D5=C2=A0credit=3D239=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04:=C2=A0[0.11]=C2=A0pri=3D-1=
=C2=A0flags=3D0=C2=A0cpu=3D1=C2=A0credit=3D-55=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A05:=C2=A0[0.6]=C2=A0pri=3D-2=
=C2=A0flags=3D0=C2=A0cpu=3D15=C2=A0credit=3D-177=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A06:=C2=A0[0.7]=C2=A0pri=3D-1=
=C2=A0flags=3D0=C2=A0cpu=3D2=C2=A0credit=3D50=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A07:=C2=A0[19.1]=C2=A0pri=3D-2=
=C2=A0flags=3D0=C2=A0cpu=3D9=C2=A0credit=3D-241=C2=A0[w=3D256,cap=3D0]=20

(XEN)=C2=A0CPUs=C2=A0info:=20

(XEN)=C2=A0CPU[00]=C2=A0current=3Dd[IDLE]v0,=C2=A0curr=3Dd[IDLE]v0,=C2=A0pr=
ev=3DNULL=20

(XEN)=C2=A0CPU[00]=C2=A0nr_run=3D0,=C2=A0sort=3D996334,=C2=A0sibling=3D{0},=
=C2=A0core=3D{0-7}=20

(XEN)=C2=A0CPU[01]=C2=A0current=3Dd0v11,=C2=A0curr=3Dd0v11,=C2=A0prev=3DNUL=
L=20

(XEN)=C2=A0CPU[01]=C2=A0nr_run=3D1,=C2=A0sort=3D996335,=C2=A0sibling=3D{1},=
=C2=A0core=3D{0-7}=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0run:=C2=A0[0.11]=C2=A0pri=3D-1=C2=A0flag=
s=3D0=C2=A0cpu=3D1=C2=A0credit=3D-55=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01:=C2=A0[32767.1]=C2=A0pri=
=3D-64=C2=A0flags=3D0=C2=A0cpu=3D1=20

(XEN)=C2=A0CPU[02]=C2=A0current=3Dd0v7,=C2=A0curr=3Dd0v7,=C2=A0prev=3DNULL=
=20

(XEN)=C2=A0CPU[02]=C2=A0nr_run=3D1,=C2=A0sort=3D996335,=C2=A0sibling=3D{2},=
=C2=A0core=3D{0-7}=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0run:=C2=A0[0.7]=C2=A0pri=3D-1=C2=A0flags=
=3D0=C2=A0cpu=3D2=C2=A0credit=3D50=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01:=C2=A0[32767.2]=C2=A0pri=
=3D-64=C2=A0flags=3D0=C2=A0cpu=3D2=20

(XEN)=C2=A0CPU[03]=C2=A0current=3Dd[IDLE]v3,=C2=A0curr=3Dd[IDLE]v3,=C2=A0pr=
ev=3DNULL=20

(XEN)=C2=A0CPU[03]=C2=A0nr_run=3D0,=C2=A0sort=3D996329,=C2=A0sibling=3D{3},=
=C2=A0core=3D{0-7}=20

(XEN)=C2=A0CPU[04]=C2=A0current=3Dd[IDLE]v4,=C2=A0curr=3Dd[IDLE]v4,=C2=A0pr=
ev=3DNULL=20

(XEN)=C2=A0CPU[04]=C2=A0nr_run=3D0,=C2=A0sort=3D996325,=C2=A0sibling=3D{4},=
=C2=A0core=3D{0-7}=20

(XEN)=C2=A0CPU[05]=C2=A0current=3Dd0v5,=C2=A0curr=3Dd0v5,=C2=A0prev=3DNULL=
=20

(XEN)=C2=A0CPU[05]=C2=A0nr_run=3D1,=C2=A0sort=3D996334,=C2=A0sibling=3D{5},=
=C2=A0core=3D{0-7}=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0run:=C2=A0[0.5]=C2=A0pri=3D-1=C2=A0flags=
=3D0=C2=A0cpu=3D5=C2=A0credit=3D239=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01:=C2=A0[32767.5]=C2=A0pri=
=3D-64=C2=A0flags=3D0=C2=A0cpu=3D5=20

(XEN)=C2=A0CPU[06]=C2=A0current=3Dd0v1,=C2=A0curr=3Dd0v1,=C2=A0prev=3DNULL=
=20

(XEN)=C2=A0CPU[06]=C2=A0nr_run=3D1,=C2=A0sort=3D996334,=C2=A0sibling=3D{6},=
=C2=A0core=3D{0-7}=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0run:=C2=A0[0.1]=C2=A0pri=3D-1=C2=A0flags=
=3D0=C2=A0cpu=3D6=C2=A0credit=3D214=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01:=C2=A0[32767.6]=C2=A0pri=
=3D-64=C2=A0flags=3D0=C2=A0cpu=3D6=20

(XEN)=C2=A0CPU[07]=C2=A0current=3Dd[IDLE]v7,=C2=A0curr=3Dd[IDLE]v7,=C2=A0pr=
ev=3DNULL=20

(XEN)=C2=A0CPU[07]=C2=A0nr_run=3D0,=C2=A0sort=3D996303,=C2=A0sibling=3D{7},=
=C2=A0core=3D{0-7}=20

(XEN)=C2=A0CPU[08]=C2=A0current=3Dd[IDLE]v8,=C2=A0curr=3Dd[IDLE]v8,=C2=A0pr=
ev=3DNULL=20

(XEN)=C2=A0CPU[08]=C2=A0nr_run=3D2,=C2=A0sort=3D996335,=C2=A0sibling=3D{8},=
=C2=A0core=3D{8-15}=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01:=C2=A0[0.4]=C2=A0pri=3D-1=
=C2=A0flags=3D0=C2=A0cpu=3D8=C2=A0credit=3D115=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0CPU[09]=C2=A0current=3Dd19v1,=C2=A0curr=3Dd19v1,=C2=A0prev=3DNUL=
L=20

(XEN)=C2=A0CPU[09]=C2=A0nr_run=3D1,=C2=A0sort=3D996335,=C2=A0sibling=3D{9},=
=C2=A0core=3D{8-15}=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0run:=C2=A0[19.1]=C2=A0pri=3D-2=C2=A0flag=
s=3D0=C2=A0cpu=3D9=C2=A0credit=3D-241=C2=A0[w=3D256,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01:=C2=A0[32767.9]=C2=A0pri=
=3D-64=C2=A0flags=3D0=C2=A0cpu=3D9=20

(XEN)=C2=A0CPU[10]=C2=A0current=3Dd[IDLE]v10,=C2=A0curr=3Dd[IDLE]v10,=C2=A0=
prev=3DNULL=20

(XEN)=C2=A0CPU[10]=C2=A0nr_run=3D0,=C2=A0sort=3D996334,=C2=A0sibling=3D{10}=
,=C2=A0core=3D{8-15}=20

(XEN)=C2=A0CPU[11]=C2=A0current=3Dd[IDLE]v11,=C2=A0curr=3Dd[IDLE]v11,=C2=A0=
prev=3DNULL=20

(XEN)=C2=A0CPU[11]=C2=A0nr_run=3D0,=C2=A0sort=3D996331,=C2=A0sibling=3D{11}=
,=C2=A0core=3D{8-15}=20

(XEN)=C2=A0CPU[12]=C2=A0current=3Dd[IDLE]v12,=C2=A0curr=3Dd[IDLE]v12,=C2=A0=
prev=3DNULL=20

(XEN)=C2=A0CPU[12]=C2=A0nr_run=3D0,=C2=A0sort=3D996333,=C2=A0sibling=3D{12}=
,=C2=A0core=3D{8-15}=20

(XEN)=C2=A0CPU[13]=C2=A0current=3Dd[IDLE]v13,=C2=A0curr=3Dd[IDLE]v13,=C2=A0=
prev=3DNULL=20

(XEN)=C2=A0CPU[13]=C2=A0nr_run=3D0,=C2=A0sort=3D996334,=C2=A0sibling=3D{13}=
,=C2=A0core=3D{8-15}=20

(XEN)=C2=A0CPU[14]=C2=A0current=3Dd0v14,=C2=A0curr=3Dd0v14,=C2=A0prev=3DNUL=
L=20

(XEN)=C2=A0CPU[14]=C2=A0nr_run=3D1,=C2=A0sort=3D990383,=C2=A0sibling=3D{14}=
,=C2=A0core=3D{8-15}=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0run:=C2=A0[0.14]=C2=A0pri=3D0=C2=A0flags=
=3D0=C2=A0cpu=3D14=C2=A0credit=3D-514=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01:=C2=A0[32767.14]=C2=A0pri=
=3D-64=C2=A0flags=3D0=C2=A0cpu=3D14=20

(XEN)=C2=A0CPU[15]=C2=A0current=3Dd0v6,=C2=A0curr=3Dd0v6,=C2=A0prev=3DNULL=
=20

(XEN)=C2=A0CPU[15]=C2=A0nr_run=3D1,=C2=A0sort=3D996335,=C2=A0sibling=3D{15}=
,=C2=A0core=3D{8-15}=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0run:=C2=A0[0.6]=C2=A0pri=3D-2=C2=A0flags=
=3D0=C2=A0cpu=3D15=C2=A0credit=3D-177=C2=A0[w=3D2000,cap=3D0]=20

(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01:=C2=A0[32767.15]=C2=A0pri=
=3D-64=C2=A0flags=3D0=C2=A0cpu=3D15=20

```=20

=20

I=C2=A0attempt=C2=A0to=C2=A0get=C2=A0'*'=C2=A0but=C2=A0that=C2=A0blocked=C2=
=A0my=C2=A0serial=C2=A0console,=C2=A0at=C2=A0least=C2=A0I=C2=A0was=C2=A0not=
=C2=A0able=C2=A0to=C2=A0interact=C2=A0with=C2=A0it=C2=A0few=C2=A0minutes=C2=
=A0later.=C2=A0I'll=C2=A0try=C2=A0to=C2=A0get=C2=A0other=C2=A0info=C2=A0too=
.=C2=A0I've=C2=A0also=C2=A0uploaded=C2=A0the=C2=A0piece=C2=A0of=C2=A0this=
=C2=A0huge=C2=A0'*'=C2=A0dump=C2=A0here:=C2=A0https://gist.github.com/fepit=
re/36923fbc08cc2fd8bdb59b81e73a6c2e=20

=20

Right=C2=A0after,=C2=A0I've=C2=A0restarted=C2=A0with=C2=A0the=C2=A0default=
=C2=A0value=C2=A0of=C2=A0'sched'=C2=A0(credit2)=C2=A0and=C2=A0just=C2=A0few=
=C2=A0minutes=C2=A0later=C2=A0I=C2=A0obtained:=20

'r':=C2=A0https://gist.github.com/fepitre/78541f555902275d906d627de2420571=
=20

'q':=C2=A0https://gist.github.com/fepitre/0ddf6b5e8fdb3152d24337d83fdc345e=
=20

'I':=C2=A0https://gist.github.com/fepitre/50c68233d08ad1e495edf7e0e146838b=
=20

=20

Tell=C2=A0me=C2=A0if=C2=A0I=C2=A0can=C2=A0provide=C2=A0any=C2=A0other=C2=A0=
info=C2=A0from=C2=A0serial=C2=A0console.=20

=20

Regards,=20

Fr=C3=A9d=C3=A9ric
------=_Part_224604_740662196.1603817213043
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>---- On Tue, 27 Oct 2020 10:22:42 +0100 <b>Dario F=
aggioli &lt;dfaggioli@suse.com&gt;</b> wrote ----<br></div><div style=3D"" =
data-zbluepencil-ignore=3D"true" class=3D"zmail_extra"><div><br></div><bloc=
kquote style=3D"border-left: 1px solid rgb(204, 204, 204); padding-left: 6p=
x; margin: 0px 0px 0px 5px;"><div>On Tue, 2020-10-27 at 06:58 +0100, J=C3=
=BCrgen Gro=C3=9F wrote: <br>&gt; On 26.10.20 17:31, Dario Faggioli wrote: =
<br>&gt; &gt; <br>&gt; &gt; Or did you have something completely different =
in mind, and I'm <br>&gt; &gt; missing <br>&gt; &gt; it? <br>&gt; <br>&gt; =
No, I think you are right. I mixed that up with __context_switch() <br>&gt;=
 not <br>&gt; being called. <br>&gt; <br>Right. <br> <br>&gt; Sorry for the=
 noise, <br>&gt; <br>Sure, no problem. <br> <br>In fact, this issue is appa=
rently scheduler independent. It indeed <br>seemd to be related to the othe=
r report we have "BUG: credit=3Dsched2 <br>machine hang when using DRAKVUF"=
, but there it looks like it is <br>scheduler-dependant. <br> <br>Might it =
be something that lies somewhere else, but Credit2 is <br>triggering it fas=
ter/easier? (Just thinking out loud...) <br> <br>For Frederic, what happens=
 is that dom0 hangs, right? So you're able to <br>poke at Xen with some deb=
ugkeys (like 'r' for the scheduler's status, <br>and the ones for the domai=
n's vCPUs)? <br> <br>If yes, it may be useful to see the output. <br> <br>R=
egards <br>-- <br>Dario Faggioli, Ph.D <br><a href=3D"http://about.me/dario=
.faggioli" target=3D"_blank">http://about.me/dario.faggioli</a> <br>Virtual=
ization Software Engineer <br>SUSE Labs, SUSE <a href=3D"https://www.suse.c=
om/" target=3D"_blank">https://www.suse.com/</a> <br>----------------------=
--------------------------------------------- <br>&lt;&lt;This happens beca=
use _I_ choose it to happen!&gt;&gt; (Raistlin Majere) </div></blockquote><=
/div><div><br></div><div><br></div><div>First&nbsp;of&nbsp;all,&nbsp;sorry&=
nbsp;for&nbsp;the&nbsp;possible&nbsp;duplicates.&nbsp;I&nbsp;had&nbsp;netwo=
rk&nbsp;issue&nbsp;due&nbsp;to&nbsp;subsequent&nbsp;freezes&nbsp;(...)&nbsp=
;while&nbsp;writing&nbsp;to&nbsp;you&nbsp;and&nbsp;Marek&nbsp;has&nbsp;not&=
nbsp;received&nbsp;my&nbsp;previous&nbsp;mails&nbsp;so&nbsp;here&nbsp;the&n=
bsp;info. <br></div><div> <br></div><div> <br></div><div>To&nbsp;answer&nbs=
p;your&nbsp;question&nbsp;Dario,&nbsp;yes&nbsp;dom0&nbsp;hangs&nbsp;totally=
&nbsp;and&nbsp;VMs&nbsp;too.&nbsp;In&nbsp;the&nbsp;case&nbsp;of&nbsp;`sched=
=3Dcredit`,&nbsp;I've&nbsp;succeeded&nbsp;to&nbsp;obtain&nbsp;the&nbsp;outp=
ut&nbsp;of&nbsp;'r'&nbsp;debug-keys&nbsp;in&nbsp;serial&nbsp;console: <br><=
/div><div>``` <br></div><div>(XEN)&nbsp;sched_smt_power_savings:&nbsp;disab=
led <br></div><div>(XEN)&nbsp;NOW=3D72810702614697 <br></div><div>(XEN)&nbs=
p;Online&nbsp;Cpus:&nbsp;0-15 <br></div><div>(XEN)&nbsp;Cpupool&nbsp;0: <br=
></div><div>(XEN)&nbsp;Cpus:&nbsp;0-15 <br></div><div>(XEN)&nbsp;Scheduling=
&nbsp;granularity:&nbsp;cpu,&nbsp;1&nbsp;CPU&nbsp;per&nbsp;sched-resource <=
br></div><div>(XEN)&nbsp;Scheduler:&nbsp;SMP&nbsp;Credit&nbsp;Scheduler&nbs=
p;(credit) <br></div><div>(XEN)&nbsp;info: <br></div><div>(XEN)&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;ncpus&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;16 <br></div><div>(XEN)&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;master&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;0 <br></div><div>(XEN)&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;credit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;4800 <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;credit&nbsp;balance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;608 <=
br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;weight&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;12256 <b=
r></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;runq_sort&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;996335 <br></div><div>(X=
EN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;default-weight&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=3D&nbsp;256 <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tslice&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=3D&nbsp;30ms <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ratelimit&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;1000us <=
br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;credits&nbsp;per&nbsp;msec=
&nbsp;&nbsp;&nbsp;=3D&nbsp;10 <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;ticks&nbsp;per&nbsp;tslice&nbsp;&nbsp;&nbsp;=3D&nbsp;3 <br></div><div>=
(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;migration&nbsp;delay&nbsp;&nbsp;&nbsp;&n=
bsp;=3D&nbsp;0us <br></div><div>(XEN)&nbsp;idlers:&nbsp;00000000,00003c99 <=
br></div><div>(XEN)&nbsp;active&nbsp;units: <br></div><div>(XEN)&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1:&nbsp;[0.1]&nbsp;pri=3D-1&nbsp;flags=3D0&n=
bsp;cpu=3D6&nbsp;credit=3D214&nbsp;[w=3D2000,cap=3D0] <br></div><div>(XEN)&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2:&nbsp;[0.4]&nbsp;pri=3D-1&nbsp;f=
lags=3D0&nbsp;cpu=3D8&nbsp;credit=3D115&nbsp;[w=3D2000,cap=3D0] <br></div><=
div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3:&nbsp;[0.5]&nbsp;pri=
=3D-1&nbsp;flags=3D0&nbsp;cpu=3D5&nbsp;credit=3D239&nbsp;[w=3D2000,cap=3D0]=
 <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4:&nbsp;[0.1=
1]&nbsp;pri=3D-1&nbsp;flags=3D0&nbsp;cpu=3D1&nbsp;credit=3D-55&nbsp;[w=3D20=
00,cap=3D0] <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5=
:&nbsp;[0.6]&nbsp;pri=3D-2&nbsp;flags=3D0&nbsp;cpu=3D15&nbsp;credit=3D-177&=
nbsp;[w=3D2000,cap=3D0] <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;6:&nbsp;[0.7]&nbsp;pri=3D-1&nbsp;flags=3D0&nbsp;cpu=3D2&nbsp;cre=
dit=3D50&nbsp;[w=3D2000,cap=3D0] <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;7:&nbsp;[19.1]&nbsp;pri=3D-2&nbsp;flags=3D0&nbsp;cpu=3D=
9&nbsp;credit=3D-241&nbsp;[w=3D256,cap=3D0] <br></div><div>(XEN)&nbsp;CPUs&=
nbsp;info: <br></div><div>(XEN)&nbsp;CPU[00]&nbsp;current=3Dd[IDLE]v0,&nbsp=
;curr=3Dd[IDLE]v0,&nbsp;prev=3DNULL <br></div><div>(XEN)&nbsp;CPU[00]&nbsp;=
nr_run=3D0,&nbsp;sort=3D996334,&nbsp;sibling=3D{0},&nbsp;core=3D{0-7} <br><=
/div><div>(XEN)&nbsp;CPU[01]&nbsp;current=3Dd0v11,&nbsp;curr=3Dd0v11,&nbsp;=
prev=3DNULL <br></div><div>(XEN)&nbsp;CPU[01]&nbsp;nr_run=3D1,&nbsp;sort=3D=
996335,&nbsp;sibling=3D{1},&nbsp;core=3D{0-7} <br></div><div>(XEN)&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;run:&nbsp;[0.11]&nbsp;pri=3D-1&nbsp;flags=3D0&nbsp;cpu=
=3D1&nbsp;credit=3D-55&nbsp;[w=3D2000,cap=3D0] <br></div><div>(XEN)&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1:&nbsp;[32767.1]&nbsp;pri=3D-64&nbsp;fla=
gs=3D0&nbsp;cpu=3D1 <br></div><div>(XEN)&nbsp;CPU[02]&nbsp;current=3Dd0v7,&=
nbsp;curr=3Dd0v7,&nbsp;prev=3DNULL <br></div><div>(XEN)&nbsp;CPU[02]&nbsp;n=
r_run=3D1,&nbsp;sort=3D996335,&nbsp;sibling=3D{2},&nbsp;core=3D{0-7} <br></=
div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;run:&nbsp;[0.7]&nbsp;pri=3D-1&n=
bsp;flags=3D0&nbsp;cpu=3D2&nbsp;credit=3D50&nbsp;[w=3D2000,cap=3D0] <br></d=
iv><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1:&nbsp;[32767.2]&nb=
sp;pri=3D-64&nbsp;flags=3D0&nbsp;cpu=3D2 <br></div><div>(XEN)&nbsp;CPU[03]&=
nbsp;current=3Dd[IDLE]v3,&nbsp;curr=3Dd[IDLE]v3,&nbsp;prev=3DNULL <br></div=
><div>(XEN)&nbsp;CPU[03]&nbsp;nr_run=3D0,&nbsp;sort=3D996329,&nbsp;sibling=
=3D{3},&nbsp;core=3D{0-7} <br></div><div>(XEN)&nbsp;CPU[04]&nbsp;current=3D=
d[IDLE]v4,&nbsp;curr=3Dd[IDLE]v4,&nbsp;prev=3DNULL <br></div><div>(XEN)&nbs=
p;CPU[04]&nbsp;nr_run=3D0,&nbsp;sort=3D996325,&nbsp;sibling=3D{4},&nbsp;cor=
e=3D{0-7} <br></div><div>(XEN)&nbsp;CPU[05]&nbsp;current=3Dd0v5,&nbsp;curr=
=3Dd0v5,&nbsp;prev=3DNULL <br></div><div>(XEN)&nbsp;CPU[05]&nbsp;nr_run=3D1=
,&nbsp;sort=3D996334,&nbsp;sibling=3D{5},&nbsp;core=3D{0-7} <br></div><div>=
(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;run:&nbsp;[0.5]&nbsp;pri=3D-1&nbsp;flags=
=3D0&nbsp;cpu=3D5&nbsp;credit=3D239&nbsp;[w=3D2000,cap=3D0] <br></div><div>=
(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1:&nbsp;[32767.5]&nbsp;pri=
=3D-64&nbsp;flags=3D0&nbsp;cpu=3D5 <br></div><div>(XEN)&nbsp;CPU[06]&nbsp;c=
urrent=3Dd0v1,&nbsp;curr=3Dd0v1,&nbsp;prev=3DNULL <br></div><div>(XEN)&nbsp=
;CPU[06]&nbsp;nr_run=3D1,&nbsp;sort=3D996334,&nbsp;sibling=3D{6},&nbsp;core=
=3D{0-7} <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;run:&nbsp;[0.1]&=
nbsp;pri=3D-1&nbsp;flags=3D0&nbsp;cpu=3D6&nbsp;credit=3D214&nbsp;[w=3D2000,=
cap=3D0] <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1:&n=
bsp;[32767.6]&nbsp;pri=3D-64&nbsp;flags=3D0&nbsp;cpu=3D6 <br></div><div>(XE=
N)&nbsp;CPU[07]&nbsp;current=3Dd[IDLE]v7,&nbsp;curr=3Dd[IDLE]v7,&nbsp;prev=
=3DNULL <br></div><div>(XEN)&nbsp;CPU[07]&nbsp;nr_run=3D0,&nbsp;sort=3D9963=
03,&nbsp;sibling=3D{7},&nbsp;core=3D{0-7} <br></div><div>(XEN)&nbsp;CPU[08]=
&nbsp;current=3Dd[IDLE]v8,&nbsp;curr=3Dd[IDLE]v8,&nbsp;prev=3DNULL <br></di=
v><div>(XEN)&nbsp;CPU[08]&nbsp;nr_run=3D2,&nbsp;sort=3D996335,&nbsp;sibling=
=3D{8},&nbsp;core=3D{8-15} <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;1:&nbsp;[0.4]&nbsp;pri=3D-1&nbsp;flags=3D0&nbsp;cpu=3D8&nbsp;=
credit=3D115&nbsp;[w=3D2000,cap=3D0] <br></div><div>(XEN)&nbsp;CPU[09]&nbsp=
;current=3Dd19v1,&nbsp;curr=3Dd19v1,&nbsp;prev=3DNULL <br></div><div>(XEN)&=
nbsp;CPU[09]&nbsp;nr_run=3D1,&nbsp;sort=3D996335,&nbsp;sibling=3D{9},&nbsp;=
core=3D{8-15} <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;run:&nbsp;[=
19.1]&nbsp;pri=3D-2&nbsp;flags=3D0&nbsp;cpu=3D9&nbsp;credit=3D-241&nbsp;[w=
=3D256,cap=3D0] <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;1:&nbsp;[32767.9]&nbsp;pri=3D-64&nbsp;flags=3D0&nbsp;cpu=3D9 <br></div><=
div>(XEN)&nbsp;CPU[10]&nbsp;current=3Dd[IDLE]v10,&nbsp;curr=3Dd[IDLE]v10,&n=
bsp;prev=3DNULL <br></div><div>(XEN)&nbsp;CPU[10]&nbsp;nr_run=3D0,&nbsp;sor=
t=3D996334,&nbsp;sibling=3D{10},&nbsp;core=3D{8-15} <br></div><div>(XEN)&nb=
sp;CPU[11]&nbsp;current=3Dd[IDLE]v11,&nbsp;curr=3Dd[IDLE]v11,&nbsp;prev=3DN=
ULL <br></div><div>(XEN)&nbsp;CPU[11]&nbsp;nr_run=3D0,&nbsp;sort=3D996331,&=
nbsp;sibling=3D{11},&nbsp;core=3D{8-15} <br></div><div>(XEN)&nbsp;CPU[12]&n=
bsp;current=3Dd[IDLE]v12,&nbsp;curr=3Dd[IDLE]v12,&nbsp;prev=3DNULL <br></di=
v><div>(XEN)&nbsp;CPU[12]&nbsp;nr_run=3D0,&nbsp;sort=3D996333,&nbsp;sibling=
=3D{12},&nbsp;core=3D{8-15} <br></div><div>(XEN)&nbsp;CPU[13]&nbsp;current=
=3Dd[IDLE]v13,&nbsp;curr=3Dd[IDLE]v13,&nbsp;prev=3DNULL <br></div><div>(XEN=
)&nbsp;CPU[13]&nbsp;nr_run=3D0,&nbsp;sort=3D996334,&nbsp;sibling=3D{13},&nb=
sp;core=3D{8-15} <br></div><div>(XEN)&nbsp;CPU[14]&nbsp;current=3Dd0v14,&nb=
sp;curr=3Dd0v14,&nbsp;prev=3DNULL <br></div><div>(XEN)&nbsp;CPU[14]&nbsp;nr=
_run=3D1,&nbsp;sort=3D990383,&nbsp;sibling=3D{14},&nbsp;core=3D{8-15} <br><=
/div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;run:&nbsp;[0.14]&nbsp;pri=3D0&=
nbsp;flags=3D0&nbsp;cpu=3D14&nbsp;credit=3D-514&nbsp;[w=3D2000,cap=3D0] <br=
></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1:&nbsp;[32767.1=
4]&nbsp;pri=3D-64&nbsp;flags=3D0&nbsp;cpu=3D14 <br></div><div>(XEN)&nbsp;CP=
U[15]&nbsp;current=3Dd0v6,&nbsp;curr=3Dd0v6,&nbsp;prev=3DNULL <br></div><di=
v>(XEN)&nbsp;CPU[15]&nbsp;nr_run=3D1,&nbsp;sort=3D996335,&nbsp;sibling=3D{1=
5},&nbsp;core=3D{8-15} <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ru=
n:&nbsp;[0.6]&nbsp;pri=3D-2&nbsp;flags=3D0&nbsp;cpu=3D15&nbsp;credit=3D-177=
&nbsp;[w=3D2000,cap=3D0] <br></div><div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;1:&nbsp;[32767.15]&nbsp;pri=3D-64&nbsp;flags=3D0&nbsp;cpu=3D15 =
<br></div><div>``` <br></div><div> <br></div><div>I&nbsp;attempt&nbsp;to&nb=
sp;get&nbsp;'*'&nbsp;but&nbsp;that&nbsp;blocked&nbsp;my&nbsp;serial&nbsp;co=
nsole,&nbsp;at&nbsp;least&nbsp;I&nbsp;was&nbsp;not&nbsp;able&nbsp;to&nbsp;i=
nteract&nbsp;with&nbsp;it&nbsp;few&nbsp;minutes&nbsp;later.&nbsp;I'll&nbsp;=
try&nbsp;to&nbsp;get&nbsp;other&nbsp;info&nbsp;too.&nbsp;I've&nbsp;also&nbs=
p;uploaded&nbsp;the&nbsp;piece&nbsp;of&nbsp;this&nbsp;huge&nbsp;'*'&nbsp;du=
mp&nbsp;here:&nbsp;<a class=3D"moz-txt-link-freetext" href=3D"https://gist.=
github.com/fepitre/36923fbc08cc2fd8bdb59b81e73a6c2e" target=3D"_blank">http=
s://gist.github.com/fepitre/36923fbc08cc2fd8bdb59b81e73a6c2e</a> <br></div>=
<div> <br></div><div>Right&nbsp;after,&nbsp;I've&nbsp;restarted&nbsp;with&n=
bsp;the&nbsp;default&nbsp;value&nbsp;of&nbsp;'sched'&nbsp;(credit2)&nbsp;an=
d&nbsp;just&nbsp;few&nbsp;minutes&nbsp;later&nbsp;I&nbsp;obtained: <br></di=
v><div>'r':&nbsp;<a class=3D"moz-txt-link-freetext" href=3D"https://gist.gi=
thub.com/fepitre/78541f555902275d906d627de2420571" target=3D"_blank">https:=
//gist.github.com/fepitre/78541f555902275d906d627de2420571</a> <br></div><d=
iv>'q':&nbsp;<a class=3D"moz-txt-link-freetext" href=3D"https://gist.github=
.com/fepitre/0ddf6b5e8fdb3152d24337d83fdc345e" target=3D"_blank">https://gi=
st.github.com/fepitre/0ddf6b5e8fdb3152d24337d83fdc345e</a> <br></div><div>'=
I':&nbsp;<a class=3D"moz-txt-link-freetext" href=3D"https://gist.github.com=
/fepitre/50c68233d08ad1e495edf7e0e146838b" target=3D"_blank">https://gist.g=
ithub.com/fepitre/50c68233d08ad1e495edf7e0e146838b</a> <br></div><div> <br>=
</div><div>Tell&nbsp;me&nbsp;if&nbsp;I&nbsp;can&nbsp;provide&nbsp;any&nbsp;=
other&nbsp;info&nbsp;from&nbsp;serial&nbsp;console. <br></div><div> <br></d=
iv><div>Regards, <br></div><div>Fr=C3=A9d=C3=A9ric<br></div></div><br></bod=
y></html>
------=_Part_224604_740662196.1603817213043--


