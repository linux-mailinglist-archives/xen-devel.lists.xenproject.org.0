Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804F8EA34C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 19:27:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPse3-0005im-4G; Wed, 30 Oct 2019 18:24:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7DP6=YX=wustl.edu=oren.bell@srs-us1.protection.inumbo.net>)
 id 1iPse1-0005ih-Ia
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 18:24:33 +0000
X-Inumbo-ID: 84514bf6-fb42-11e9-beca-bc764e2007e4
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e46::209])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84514bf6-fb42-11e9-beca-bc764e2007e4;
 Wed, 30 Oct 2019 18:24:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4dvffN7cNh/TETeTYWPudjf800sQpGkuO5rdKXJPzLRonnufKofvh2EztyFbND9loHhGJpzgRQi3hAodjhPGuvroNdCHcXRAcdl2o4LVlheWDiWyNE/kozRYe+UCkoY+5avkbPhzsc8I73HNhXI1HV/suTAOAuMtjCsTUm/DSsBowIJOaAMkQd6DQHl6N+kLIJF0NVqsejgvmobwhd8upMI0aSPjK/SkQiRJWVHx+BLnet4DrhJBmr6mbS07R1hIaH7Klb3W9MUJnUAXRTVRQyTAcgWCMvOXVuAkEIe7Diz+5p/d66zK5I2MZAytFeVbwZ+DB3QpFHTJ6IXor+CRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mvW5yiQFQtGEJp1oa3kQjeGJOwOhiElrf4CTGKOb/o=;
 b=FbwPWEIshRAWT9v+dA1TkfjnQ6seJ7U0284bdRdO3rRjxHcbeqv6uH8qddK8bRIxaA3tDFFUUei87zn3SQ4JySrOJ++NNQoqqZkcj+PVDn0b1hzCQwdxSbMGFI+yaMkthykiCQcy00ZHOmLunh8jeTnDrDULurNhhuvP0YSW/5YH1l287ZTOKu2AfcQg4JjbivTc9bsKh8VlyIByC0MiZFNoKXph02s2iq2ROmj4xTPGx1Wb5dMSc7wHX2Wz5aq0rJUTCG+bE4shemNyirvitFMRJIpGSNuGQ+omUYVEzisjvn5wY1a0b1re5A5F68ts+W7iiXAtXSemeJm+AdeiXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wustl.edu; dmarc=pass action=none header.from=wustl.edu;
 dkim=pass header.d=wustl.edu; arc=none
Received: from SN6PR02MB4719.namprd02.prod.outlook.com (52.135.113.216) by
 SN6PR02MB4685.namprd02.prod.outlook.com (52.135.113.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Wed, 30 Oct 2019 18:24:31 +0000
Received: from SN6PR02MB4719.namprd02.prod.outlook.com
 ([fe80::b96f:40be:9447:4dba]) by SN6PR02MB4719.namprd02.prod.outlook.com
 ([fe80::b96f:40be:9447:4dba%3]) with mapi id 15.20.2387.028; Wed, 30 Oct 2019
 18:24:30 +0000
From: "Bell, Oren" <oren.bell@wustl.edu>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] Xen >4.10 bricks onboard NIC of Dell Optiplex 7060
Thread-Index: AQHVjN9Jz8ZYVdlqdkGT46MhTzcVOqdvw34AgAO/fwk=
Date: Wed, 30 Oct 2019 18:24:30 +0000
Message-ID: <SN6PR02MB4719855FA1DA7CE9AC457497F6600@SN6PR02MB4719.namprd02.prod.outlook.com>
References: <SN6PR02MB47196DB277CAFEA9B4D5FD51F6670@SN6PR02MB4719.namprd02.prod.outlook.com>,
 <813aaa3e-1c79-24ac-256e-4e74aafad46c@suse.com>
In-Reply-To: <813aaa3e-1c79-24ac-256e-4e74aafad46c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oren.bell@wustl.edu; 
x-originating-ip: [128.252.174.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 565c9592-853d-477e-0636-08d75d666809
x-ms-traffictypediagnostic: SN6PR02MB4685:
x-microsoft-antispam-prvs: <SN6PR02MB46852DDF15FD8DCBEBF8ECE3F6600@SN6PR02MB4685.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02065A9E77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(346002)(39860400002)(376002)(199004)(189003)(66946007)(5660300002)(7696005)(71200400001)(66476007)(66556008)(71190400001)(8676002)(99286004)(6506007)(76176011)(66446008)(64756008)(53546011)(81156014)(33656002)(81166006)(8936002)(256004)(91956017)(76116006)(14454004)(186003)(26005)(2906002)(88552002)(11346002)(6116002)(52536014)(105004)(478600001)(446003)(3846002)(4326008)(25786009)(6246003)(86362001)(476003)(6436002)(75432002)(486006)(7736002)(6916009)(55016002)(74316002)(66066001)(54896002)(19627405001)(229853002)(102836004)(9686003)(786003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4685;
 H:SN6PR02MB4719.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wustl.edu does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DN3AaLYfnZdWwHypUSnqLmyqB7zoW2XgrPdH7xIyXiaDWpzJq8IsZmxiaHSrF8x1HSA2drpJL1qBpFd+xlE6PExXwR974rO2BGgMH9fjhIH4Jtpgjjjl0olmvznjv1fyrVx3VboY7CwaPWc0HEQw4u7Vz7M+xfaq/Oe5lxrlMVpe2xCfvn/Ph5KWdijS+fu27ZWTvzkO7htZpBZVa0zj1XKdsahr9KE/tEq7wMq1CNl6KcntN7mJKELmtgDKKMYQLfl/ujiM/P7f5wL6qAcxkxevgn/vtD3xg7oDknwOQFO35gk1LwqLTvnx3CnXDswr6jm8XWAObOky8HMlc5XlHk4QFJRGVl9Ymwd/MQ1NCXgOYcOr0JAZUql7/jAf0HFwFt500SL7lukl5Kgc2RSdpUvZUD+1K47ubdkjEvg90YfDGSoRXvlJyuVri8Ln7kLp
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wustl.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 565c9592-853d-477e-0636-08d75d666809
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2019 18:24:30.9134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ccca3b5-71cd-4e6d-974b-4d9beb96c6d6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O92A7Zvx5kHBiag1dtt/xbyIP925uJprKP4MpNa1bp51hdrvZPGQKnmI96ObAGqJWSgw8W+kS6K0w1yzO1f7iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4685
Subject: Re: [Xen-devel] Xen >4.10 bricks onboard NIC of Dell Optiplex 7060
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3006824889878392313=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3006824889878392313==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR02MB4719855FA1DA7CE9AC457497F6600SN6PR02MB4719namp_"

--_000_SN6PR02MB4719855FA1DA7CE9AC457497F6600SN6PR02MB4719namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Running Xen Dom0-less leaves the NIC intact, so you're correct in assessing=
 that Xen by itself is not the cause.
As for running without the driver, I'm not sure that's possible (at least f=
or my competency). It uses the Intel Base Gigabit driver that's built into =
the kernel.
And running the machine without using the NIC will still break it.

As for the IOMMU suggestion: we still got basic pinging to work, assuming a=
n IP address was statically allocated, so I don't think IOMMU is a valid ro=
ute for investigation, as any aberrations there should leave the NIC totall=
y non-functional.
________________________________
From: Jan Beulich <jbeulich@suse.com>
Sent: Monday, October 28, 2019 4:03 AM
To: Bell, Oren <oren.bell@wustl.edu>
Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen >4.10 bricks onboard NIC of Dell Optiplex 7060

On 27.10.2019 17:09,  Bell, Oren  wrote:
> I've encountered an issue where installing Xen >4.10 on a Dell Optiplex w=
ill break the onboard NIC. This issue persists if the computer is booted wi=
thout Xen, after OS reinstall, and even if removing the SSD and HDD complet=
ely to boot from a LiveUSB. The only way to fix the issue is to install Win=
dows 10 on the machine. This appears to "fix" the firmware of the NIC. Afte=
r reinstalling Ubuntu, the NIC continues to work (until Xen is installed ag=
ain).
>
> This bug was confirmed with both Xen 4.10 and 4.12 installed on Ubuntu 18=
.04.
>
> If this is a known issue, is there some "in-work patch" I can be pointed =
to?

This is a rather strange problem you're facing - Xen itself doesn't
do anything to NICs. Therefore I'm afraid some more experimenting
may be needed to somehow narrow where things go wrong. In particular
I'd be curious to understand whether it's indeed Xen that breaks
things, or whether e.g. other software misbehaves if run on top of
Xen. As a first step, could you boot
- Xen without a Dom0 kernel,
- Xen with a Dom0 kernel, but without a driver for the NIC,
- Xen with a Dom0 kernel and with a driver for the NIC, but without
  actually configuring/using the NIC?
Could you further check whether Xen using the presumably present
IOMMU matters? (Providing maximum verbosity hypervisor and kernel
logs would of course also help, in particular e.g. to know whether
there is an IOMMU in the system, and also to see whether any
anomalies get logged.)

Jan

--_000_SN6PR02MB4719855FA1DA7CE9AC457497F6600SN6PR02MB4719namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Running Xen Dom0-less leaves the NIC intact, so you're correct in assessing=
 that Xen by itself is not the cause.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
As for running without the driver, I'm not sure that's possible (at least f=
or my competency). It uses the Intel Base Gigabit driver that's built into =
the kernel.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
And running the machine without using the NIC will still break it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
As for the IOMMU suggestion: we still got basic pinging to work, assuming a=
n IP address was statically allocated, so I don't think IOMMU is a valid ro=
ute for investigation, as any aberrations there should leave the NIC totall=
y non-functional.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jan Beulich &lt;jbeul=
ich@suse.com&gt;<br>
<b>Sent:</b> Monday, October 28, 2019 4:03 AM<br>
<b>To:</b> Bell, Oren &lt;oren.bell@wustl.edu&gt;<br>
<b>Cc:</b> xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.or=
g&gt;<br>
<b>Subject:</b> Re: [Xen-devel] Xen &gt;4.10 bricks onboard NIC of Dell Opt=
iplex 7060</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 27.10.2019 17:09,&nbsp; Bell, Oren&nbsp; wrote:=
<br>
&gt; I've encountered an issue where installing Xen &gt;4.10 on a Dell Opti=
plex will break the onboard NIC. This issue persists if the computer is boo=
ted without Xen, after OS reinstall, and even if removing the SSD and HDD c=
ompletely to boot from a LiveUSB. The
 only way to fix the issue is to install Windows 10 on the machine. This ap=
pears to &quot;fix&quot; the firmware of the NIC. After reinstalling Ubuntu=
, the NIC continues to work (until Xen is installed again).<br>
&gt; <br>
&gt; This bug was confirmed with both Xen 4.10 and 4.12 installed on Ubuntu=
 18.04.<br>
&gt; <br>
&gt; If this is a known issue, is there some &quot;in-work patch&quot; I ca=
n be pointed to?<br>
<br>
This is a rather strange problem you're facing - Xen itself doesn't<br>
do anything to NICs. Therefore I'm afraid some more experimenting<br>
may be needed to somehow narrow where things go wrong. In particular<br>
I'd be curious to understand whether it's indeed Xen that breaks<br>
things, or whether e.g. other software misbehaves if run on top of<br>
Xen. As a first step, could you boot<br>
- Xen without a Dom0 kernel,<br>
- Xen with a Dom0 kernel, but without a driver for the NIC,<br>
- Xen with a Dom0 kernel and with a driver for the NIC, but without<br>
&nbsp; actually configuring/using the NIC?<br>
Could you further check whether Xen using the presumably present<br>
IOMMU matters? (Providing maximum verbosity hypervisor and kernel<br>
logs would of course also help, in particular e.g. to know whether<br>
there is an IOMMU in the system, and also to see whether any<br>
anomalies get logged.)<br>
<br>
Jan<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR02MB4719855FA1DA7CE9AC457497F6600SN6PR02MB4719namp_--


--===============3006824889878392313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3006824889878392313==--

