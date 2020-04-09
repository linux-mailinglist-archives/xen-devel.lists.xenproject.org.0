Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864A51A2D53
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 03:27:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMLy5-0003Lv-AT; Thu, 09 Apr 2020 01:26:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NCxt=5Z=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1jMLy3-0003Lo-Kv
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 01:26:55 +0000
X-Inumbo-ID: 30d3970e-7a01-11ea-827d-12813bfff9fa
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.94.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30d3970e-7a01-11ea-827d-12813bfff9fa;
 Thu, 09 Apr 2020 01:26:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVZeVgyqvAilg/f19R5YfwCEva8xBltPtxQaXx9pzZvuvgqoPHwXsKGqKarQSj6RPwzU4loZbOiZ5UVPnLwO5MHsgsTFe9RSPtihP2SmsdVRxJL145S4RJ5Mnoiv7git+x94uUqa7n7luruxZuRouB7Vh1oiboaEY1++bEr30XQu7aQVWUoOQ8UbgwN9TJ1CN0l5WmoHhwlKt342U5qP2bps/lhGGRG/7QEDVbVqXsJIVbukuAFkywl8RfNAFPHFU3ljvbVQy6gHIfUNr1QSyj+sIkzl/yjnt0utcrg7KNNqCexR4EZWPJl77kJVLv+S7uJhpQopnix27uGNoSoyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZKETr1xPfw30uvqxW0Zvzg/Y16m7mj44aDv41twrLM=;
 b=eL7v8uk3lRynKT5uk9jdsj4PZ2F5RLeqI2mL4D5NqSEGlwvByrO8AnYWF3peEYyL/s7y2C76S4fBVsSCOVzHDw7fEws56JiJFp7WLUt5AwBYvrWG++ATfiF8+yumrVCY3v4q0MCMUt47ylJk+YjNC6hVTuMqT3ciHAa2FUpErsH+be01N81c6yQPf0f9webjHbyDTRjMs75KzmXfvg4sGZyleIvZ+9wYoTrhZRqiiiIFV+yiJwo+TEQ7n3ONATcrbzAp7X6uTl9IvVfiIJErRjtGQuAKbUFgas3gdzn+Z5qmuwbPeNTPPwM2OGaMc5YgVE+TqzAxZv+wAnoR/yd5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZKETr1xPfw30uvqxW0Zvzg/Y16m7mj44aDv41twrLM=;
 b=gySa33Lpzgwdb1bhfq8PCrjPTvqJLy55tNF3CCiRb8HG9epQcCOfVHZrHVbD+yyOI9ilXkJkAEO+oRW91m7jfrRg+BrZ/U1UvlsTSf8DdScUDCfaDEXm8CX+DkBuXDPrzF9/wLIpPjwB9KBbrcRD3Dt3S1F/6eZNie/QLCor0T0=
Received: from CY1PR07CA0010.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::20) by MWHPR02MB2335.namprd02.prod.outlook.com
 (2603:10b6:300:5b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Thu, 9 Apr
 2020 01:26:52 +0000
Received: from CY1NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2a01:111:e400:c60a:cafe::8c) by CY1PR07CA0010.outlook.office365.com
 (2a01:111:e400:c60a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Thu, 9 Apr 2020 01:26:51 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT061.mail.protection.outlook.com (10.152.75.30) with Microsoft SMTP
 Server id 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 01:26:51
 +0000
Received: from [149.199.38.66] (port=45750 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jMLxa-0008LI-Ru; Wed, 08 Apr 2020 18:26:26 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jMLxz-0003Nc-5U; Wed, 08 Apr 2020 18:26:51 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 0391QfTC023870; 
 Wed, 8 Apr 2020 18:26:41 -0700
Received: from [172.19.2.220] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <stefanos@xilinx.com>)
 id 1jMLxp-0003MZ-83; Wed, 08 Apr 2020 18:26:41 -0700
Date: Wed, 8 Apr 2020 18:26:40 -0700 (PDT)
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
In-Reply-To: <057f48b7-84be-0bc5-773d-d01a79181b20@xen.org>
Message-ID: <alpine.DEB.2.21.2004081642070.28673@sstabellini-ThinkPad-T480s>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2LdC-nSMUEjLhGp_4PAkcRkp4wJKXiAy0ftt34T8LAVg@mail.gmail.com>
 <D048CA76-8C9F-4F44-B05C-D834A6D0D37D@citrix.com>
 <9de763c9-19f2-2163-d5db-95176dbce3cc@xen.org>
 <082584BF-3837-48A7-A0C2-9582BA3379C0@citrix.com>
 <a29cb044-7e78-a47b-f842-327373e0ec9f@xen.org>
 <4FBF62BA-5844-4506-8C01-FE1A6F4A7ED2@citrix.com>
 <057f48b7-84be-0bc5-773d-d01a79181b20@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-153681251-1586392437=:28673"
Content-ID: <alpine.DEB.2.21.2004081734160.28673@sstabellini-ThinkPad-T480s>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(7916004)(136003)(396003)(39850400004)(346002)(376002)(46966005)(478600001)(336012)(44832011)(426003)(8936002)(5660300002)(316002)(9686003)(8676002)(6916009)(186003)(33964004)(9786002)(33716001)(47076004)(82740400003)(2906002)(356004)(70586007)(81166007)(70206006)(26005)(54906003)(4326008)(81156014);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e30524be-d0f8-435c-ecca-08d7dc2514a8
X-MS-TrafficTypeDiagnostic: MWHPR02MB2335:
X-Microsoft-Antispam-PRVS: <MWHPR02MB23350A2EE89CEE9B50E360FBA0C10@MWHPR02MB2335.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0368E78B5B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OkBVunBpazyWDq/xqEzj0J5crpzutK7+86jUAppV1aXGGwZULaWEJc2D0H+ZJnt0eqGvVjChrsCCXun6rp76z2RvjjQrrXGptc62NEe35vMotOW6LELBAJ314EnitV4sAaVEGirboagO5BR93B4pU9o7Z/eQpfqlmWGBn0tsd+gAaBSuDLQcZP3ySooMCNd7UQ05TC7sqcKOzdqDWuUk2JjJvjk+BnyB4nYdBjgMJXzITcwtjLgGxfpMILTkt6hDZfrf269NSzHZBo+C9AEoCqDTkzcJeG2d7OewehT8a0IqK/aMGwDivmvwPRXS9moXSA6xjsx1ygVotBTYxjtvb8+Hh7eZRgoNmGqyj1Vvt7v05e8INZrNcWNmLbwiTyYHDDC5UFVKT22hYUDNqDKKnsJOz0jRl6Y+KLiCZZrnfGE51Mj0WOxgGW7YygeSXeyBBSj6XexuFzaFLS9zwIkzYKNt0GAoLQK7BDvM9eejgJT9ftGAlriQJbvNC9gXeRtlhYzkZSlQZr2asMLvrtKTPA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 01:26:51.4590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e30524be-d0f8-435c-ecca-08d7dc2514a8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2335
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "maz@kernel.org" <maz@kernel.org>, George Dunlap <George.Dunlap@citrix.com>,
 Wei Xu <xuwei5@hisilicon.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-153681251-1586392437=:28673
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.DEB.2.21.2004081734161.28673@sstabellini-ThinkPad-T480s>

On Tue, 7 Apr 2020, Julien Grall wrote:
> > > > I don=E2=80=99t know what maintenance IRQs are, but if they only ha=
ppen
> > > > intermittently, it=E2=80=99s possible that you=E2=80=99d never get =
more than a single
> > > > one in a latency-critical IRQ routine; and as such, the variatibili=
ty in
> > > > execution time (jitter) wouldn=E2=80=99t be an issue in practice.  =
But every
> > > > time you add a new unblockable IPI, you increase this jitter;
> > > > particularly if this unblockable IPI might be repeated an arbitrary
> > > > number of times.
> > > > (Stefano, let me know if I=E2=80=99ve misunderstood something.)
> > > > So stepping back a moment, here=E2=80=99s all the possible ideas th=
at I think
> > > > have been discussed (or are there implicitly) so far.
> > > > 1. [Default] Do nothing; guests using this register continue crashi=
ng
> > > > 2. Make the I?ACTIVER registers RZWI.
> > > > 3. Make I?ACTIVER return the most recent known value; i.e. KVM=E2=
=80=99s current
> > > > behavior (as far as we understand it)
> > > > 4. Use a simple IPI with do_noop to update I?ACTIVER
> > > > 4a.  Use an IPI, but come up with clever tricks to avoid interrupti=
ng
> > > > guests handling IRQs.
> > > > 5. Trap to Xen on guest EOI, so that we know when the
> > > > 6. Some clever paravirtualized option
> > >=20
> > > 7. Use an IPI if we are confident the interrupts may be active.
> >=20
> > I don=E2=80=99t understand this one.  How is it different than 4 or 4a?=
  And in
> > particular, how does it evaluate on the =E2=80=9Chow much additional de=
sign work
> > would it take=E2=80=9D criteria?
>=20
> Let me start with, if we want to have a vGIC to rule them all, then I am
> afraid you are going to have to compromise. We can discuss about tailorin=
g the
> vGIC but I think before that we need a vGIC that is faithfull with the sp=
ec
> (e.g differentiating level vs edge interrupts, handling activer...). Note=
 that
> Arm spent some effort to get a new vGIC merged but this was never made a =
first
> class citizen.
>=20
> However, even if you tailor the vGIC, you are not going to be able to avo=
id
> IPI in some occasions. This would happen when using event channels, in-gu=
est
> IPI... Another example is when enabling an interrupt, although I realize =
that
> our vGIC does not do it today meaning that a pending interrupt while disa=
bled
> will not be forwarded until the vCPU exit.
>=20
> Furthermore, implementing a write to I{C,S}ACTIVER (to activate/de-activa=
te)
> is going to be very difficult (to not say impossible) to do without IPI.
>=20
> If you are worry about a vCPU been interrupted in critical section, then =
I
> think you should tailor your guest to avoid using those registers.

Let's call it option 8 "tell the user that she needs to modify her
kernel."


> An alternative would be to use spinlock/mutex within the code to prevent =
a
> VCPU to access the vGIC registers while another vCPU don't want to be
> interrupted.
>=20
> Regarding, 4a. The only way I could think of would be to trap the instruc=
tions
> that mask/unmask interrupts. If I read correctly the Armv8 spec, it is no=
t
> possible to do it.
>=20
> 7. is basically 4.a the goal would be to avoid interrupts the vCPU has mu=
ch as
> possible but you may be wrong sometimes. Obviously we want to be correct =
most
> of the times.
>
> I understand this may not be the ideal solution, but this is probably the=
 best
> we could come with and does not involve a lot of work because we have alr=
eady
> all the information in place (we know when an interrupt was injected to a
> vCPU).
>=20
> The next best solution is to prevent in your guest to modify some registe=
rs of
> the vGIC at the same time as another vCPU is in a critical section.

Let's call this option 9.


I am just thinking out loud here :)


- 2 "Make the I?ACTIVER registers RZWI"

  As far as I can tell it should prevent the livelock because it would
  never return an ACTIVE state. It could be improved by returning the
  latest ACTIVE information for local interrupts and returning zero for
  interrupts routed to other pcpus. Not perfect but an option.


- 5 "maintenance interrupt"

  This is good for jitter sensitive guests but not the best for the
  others. We could enable it conditionally: enable maintenance
  interrupts only for certain vcpus/pcpus but it is not great to have to
  make this kind of difference in the implementation. However, it is
  possible. Let's see if we can come up with something better.


- 7 "optimized IPI"
=20
  A tiny chance of causing issues. Let's see if we can come up with
  anything better.


- 8 "tell the user to fix modify the kernel"

  We could do it in addition to 7. The issue is really how we do it.
  A warning message if DEBUG && if sched=3D=3Dnull? That doesn't sound
  right. We could introduce a new nojitter=3Dtrue command line option for
  Xen? It wouldn't really change the behavior of Xen, but it would
  enable this warning. Or, it could enable the warning and also switch
  the implementation of I?ACTIVER to option 2.


- 9 "prevent I?ACTIVER during critical sections"

  This could be good but I have a difficult time thinking of how we
  could implement it. How do we tell that the other vcpu is in or out of
  the critical section?

  (I was brainstorming a way to re-enable trapping the idling
  instruction WFI temporarily so that the other vcpu would definitely
  trap into Xen again when it is out of the critical section. But it
  doesn't seem possible from the spec.)
--8323329-153681251-1586392437=:28673--

