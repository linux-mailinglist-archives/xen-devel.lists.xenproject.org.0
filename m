Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAEC19A8FB
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 11:56:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJa4s-0006Zl-Rw; Wed, 01 Apr 2020 09:54:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uymO=5R=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jJa4q-0006Zb-NL
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 09:54:28 +0000
X-Inumbo-ID: c58c95e6-73fe-11ea-b58d-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c58c95e6-73fe-11ea-b58d-bc764e2007e4;
 Wed, 01 Apr 2020 09:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j24FPQXR4F2jm4JCTgokRThyryEAd36tC+6O6UQdFzs=;
 b=0sHBPf1zPYM9ZMAaH1u94ZtcqeC9RnCU1WK7DL+Z2gd1aWp17uA19j66WagtRCsCD/qbRaiJ+hz4CpORad9VJjBmdGzbqFgXim737PMKGpl/a3gLwDD3twYVfchTXNoshLW1b3NSnq6kpIijpCAp7XA3wtr8z/RRo76YIZ53lMI=
Received: from AM5PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:206:2::27)
 by VI1PR08MB4381.eurprd08.prod.outlook.com (2603:10a6:803:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Wed, 1 Apr
 2020 09:54:24 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::55) by AM5PR06CA0014.outlook.office365.com
 (2603:10a6:206:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Wed, 1 Apr 2020 09:54:24 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Wed, 1 Apr 2020 09:54:23 +0000
Received: ("Tessian outbound af37c2b81632:v50");
 Wed, 01 Apr 2020 09:54:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 96f851ec2abb08c7
X-CR-MTA-TID: 64aa7808
Received: from 185bbbe95441.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9222CF38-2DAB-4E77-853D-A4A1E8CF6FBE.1; 
 Wed, 01 Apr 2020 09:54:18 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 185bbbe95441.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Apr 2020 09:54:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSUs+xzulwYVgFHe8bGlH9Hj3CHCcdoK+6IFJjqspm6O/muWGWZQDtiusbGyx/wVxRNUQJ2v5HPDGobSye81dqKMF3DZRfODH2SfDaE+7toyBJpkiZXV+8oWJg9MSQWwlv2ad3melS+OVqPBAlgxZWzVUcmygZwdBLEz4Sr7ptesJr8UU5AWruQuoPfmttpdoA3Q+QIntVFVsbk++ENsQr3bxmf27YDMsSLdKktKAAm8tBqOBSozB2ULaTojUUHuicZ3Ak7uTXV/r5D/dgYmHs/52aljPNKqK1EFj1UHdJeohphpWXuXq8fDtqe+gu6k1FmqKfUA1ZXJRS6lB48ChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j24FPQXR4F2jm4JCTgokRThyryEAd36tC+6O6UQdFzs=;
 b=F3COL1FB5Jcm7bnbcN3MboCrAtPSWjDK5S1U7GzjyDYLGN9UZ+j5wtZiBnd1w6krh3TCEcls3MQEKLdH090OEwqhg+dy9AjNcYHNAlBap4J/3pic3G1hkjNwsX6Sr6RiCLQ6KgWSUK/cRJgADTrZGyVMH26fvlxE7fl1n7gIb23DOC99YjqRKqBlWDkw3PdTbPOxMGo/TCnzFfK+RQ/H45zoJjpBirvrVAPfTzDI9arxdHRoJ97OZtqpw/huCXePt4ufKG+Rl3oW8tITp5PFroWyea3u5wIz+ZuPhld7yNhwYxFqe4vjx/Lpfgwk+WmW9+0EIBtaKGb8Wuog3MEfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j24FPQXR4F2jm4JCTgokRThyryEAd36tC+6O6UQdFzs=;
 b=0sHBPf1zPYM9ZMAaH1u94ZtcqeC9RnCU1WK7DL+Z2gd1aWp17uA19j66WagtRCsCD/qbRaiJ+hz4CpORad9VJjBmdGzbqFgXim737PMKGpl/a3gLwDD3twYVfchTXNoshLW1b3NSnq6kpIijpCAp7XA3wtr8z/RRo76YIZ53lMI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3562.eurprd08.prod.outlook.com (20.177.120.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Wed, 1 Apr 2020 09:54:16 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 09:54:16 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Topic: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Index: AQHWB8CUPtV45V7pfkaBDuUahGESj6hj8BaAgAAXawA=
Date: Wed, 1 Apr 2020 09:54:16 +0000
Message-ID: <A33FEB65-F844-4CA6-BAE0-F0C881CFD381@arm.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
In-Reply-To: <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea31819b-1467-4af5-50d0-08d7d622a870
x-ms-traffictypediagnostic: DB7PR08MB3562:|VI1PR08MB4381:
X-Microsoft-Antispam-PRVS: <VI1PR08MB43813BFE95CF1E63FCB52EFB9DC90@VI1PR08MB4381.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 03607C04F0
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(2906002)(186003)(6512007)(8676002)(6506007)(54906003)(2616005)(81156014)(4326008)(36756003)(86362001)(478600001)(316002)(81166006)(53546011)(91956017)(6916009)(64756008)(33656002)(66476007)(66946007)(8936002)(26005)(6486002)(71200400001)(66556008)(66446008)(5660300002)(76116006);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: cIEymwj0fiLqhUon0iYjs61Biyp5htDQCUQWDnVF4bsB1yaVzOxkdaxYVOdoiP6YltbLtE7tw1tTz9iwAn95ljmJTX7mOuJsDJ+ssyN2E67pVv7CYgicakEC8xiacS2QhUoxXDgSLSFMmgtp/GYEPaODvERgnkVVJ6Jk3KbLbNuay9TIq+vjwFpK5Vh4xmuFmGhVX5Q6q/IoqZk6Weukpzn1ydexxkTMskCaZ1ExLpOMOAzdumdRf3HMwwWpZurPi5c+7DRDVh4p6Ye+mn9Q7mpBItzXLwlRHzMJPxOOGUM0YvvoHL5y9+RRi38AmRlXtPocDVFQiBnP+rMumKkPyIB93fF8hIEOty/D3rJ9PB1b0VdcAgUBcAydI9KXz1INTgyiYhJYGQ92RQutb7Gbb4NA5TJsMZP1iTT9znd0r3frEns5R4C6axxDJfTnlteq
x-ms-exchange-antispam-messagedata: cwDf4YP0b8g1qjLIcn9xYdG/qZL5vetr9NkHrAPwcc06rEf9lKLOJZUXaAtQlDoAGtcMnmu1I9tdM6rsNlIQkghibN0EXmxdRfxphTfI8ljcm7skjCkuIPEu/CxpdiUp1MIrkuto3rBd903v9aL5dQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_A33FEB65F8444CA6BAE0F0C881CFD381armcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3562
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966005)(36906005)(81156014)(336012)(54906003)(47076004)(26826003)(186003)(316002)(2616005)(53546011)(6862004)(6506007)(81166006)(82740400003)(26005)(6486002)(478600001)(36756003)(45080400002)(86362001)(5660300002)(2906002)(6512007)(33656002)(70206006)(70586007)(8676002)(8936002)(356004)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b08cec5e-8eba-4728-74dc-08d7d622a404
X-Forefront-PRVS: 03607C04F0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C8hQToYeU+YzsqvU6wr5sEdCl7IA51yWkSNeB+MAQE3iW4jhoSfMAmcW9ynfni9uOdKaWNh1BlNxy6UKMwjh/KkN7l7aXl0xp9Mptx/hmMLHanHzfJjUnGOI7roF8WwvnANzSPsnRrtFAlUd0tLdbpeBV+nWJJOhCLNUzHtT5feGruMlZGh6XjJe5d1N4dKE/xkBPFdoFjhTGlSlbmcr5HftEmQ/OwihAZOGDgML/5DQ7StaA7aCuwq7cVXKxURhrYH7gVJCgBQvqO4MqmR2Kna8rR3kqu4Tkp7ao3gyz82qXZ2ThhixOoMh3zfSp64VZnXBoWXcRcNVp0f19LbNognibiwuzBhfnkLbhXggCy+ndjXBc9OXMn22ALwptuaWGfKh3ioWqQcNsS5WWjjvwJJRLJLcey1u9Wyt108mGkkwNzzf0mq2it42uRh5B7RS5WfjWEAx5V3CZ38OmmwCbALOnO5W7vlAc7pO/hYQf6YSM2kINygpCHXKlH5QTYG4xRhQfVFmmDaSTO9/5Po2vQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 09:54:23.8508 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea31819b-1467-4af5-50d0-08d7d622a870
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4381
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
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_000_A33FEB65F8444CA6BAE0F0C881CFD381armcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 1 Apr 2020, at 09:30, Julien Grall <julien@xen.org<mailto:julien@xen.org=
>> wrote:



On 01/04/2020 01:57, Stefano Stabellini wrote:
On Mon, 30 Mar 2020, Julien Grall wrote:
Hi Stefano,

On 30/03/2020 17:35, Stefano Stabellini wrote:
On Sat, 28 Mar 2020, Julien Grall wrote:
qHi Stefano,

On 27/03/2020 02:34, Stefano Stabellini wrote:
This is a simple implementation of GICD_ICACTIVER / GICD_ISACTIVER
reads. It doesn't take into account the latest state of interrupts on
other vCPUs. Only the current vCPU is up-to-date. A full solution is
not possible because it would require synchronization among all vCPUs,
which would be very expensive in terms or latency.

Your sentence suggests you have number showing that correctly emulating
the
registers would be too slow. Mind sharing them?

No, I don't have any numbers. Would you prefer a different wording or a
better explanation? I also realized there is a typo in there (or/of).
Let me start with I think correctness is more important than speed.
So I would have expected your commit message to contain some fact why
synchronization is going to be slow and why this is a problem.

To give you a concrete example, the implementation of set/way instructions =
are
really slow (it could take a few seconds depending on the setup). However,
this was fine because not implementing them correctly would have a greater
impact on the guest (corruption) and they are not used often.

I don't think the performance in our case will be in same order magnitude. =
It
is most likely to be in the range of milliseconds (if not less) which I thi=
nk
is acceptable for emulation (particularly for the vGIC) and the current use=
s.
Writing on the mailing list some of our discussions today.
Correctness is not just in terms of compliance to a specification but it
is also about not breaking guests. Introducing latency in the range of
milliseconds, or hundreds of microseconds, would break any latency
sensitive workloads. We don't have numbers so we don't know for certain
the effect that your suggestion would have.

You missed part of the discussion. I don't disagree that latency is importa=
nt. However, if an implementation is only 95% reliable, then it means 5% of=
 the time your guest may break (corruption, crash, deadlock...). At which p=
oint the latency is the last of your concern.

It would be interesting to have those numbers, and I'll add to my TODO
list to run the experiments you suggested, but I'll put it on the
back-burner (from a Xilinx perspective it is low priority as no
customers are affected.)

How about we get a correct implementation merge first and then discuss abou=
t optimization? This would allow the community to check whether there are a=
ctually noticeable latency in their workload.

Hi,

I am not sure that pushing something with a performance impact to later fix=
 it is the right approach here.

The patch is an improvement compared to the current code and it can be furt=
her improved later to handle more cases (other cores).

If we really have to sync all vCPUs here, this will cost a lot and the resu=
lt will still be the status in the past in fact because nothing will make s=
ure that at the point the guest gets back the value it is still valid.

Cheers

--
Bertrand


--_000_A33FEB65F8444CA6BAE0F0C881CFD381armcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <B244860F5AA4814EAFA57755EAB55673@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 1 Apr 2020, at 09:30, Julien Grall &lt;<a href=3D"mailto=
:julien@xen.org" class=3D"">julien@xen.org</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">On
 01/04/2020 01:57, Stefano Stabellini wrote:</span><br style=3D"caret-color=
: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal=
; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
On Mon, 30 Mar 2020, Julien Grall wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">Hi Stefano,<br class=3D"">
<br class=3D"">
On 30/03/2020 17:35, Stefano Stabellini wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">On Sat, 28 Mar 2020, Julien Grall wrot=
e:<br class=3D"">
<blockquote type=3D"cite" class=3D"">qHi Stefano,<br class=3D"">
<br class=3D"">
On 27/03/2020 02:34, Stefano Stabellini wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">This is a simple implementation of GIC=
D_ICACTIVER / GICD_ISACTIVER<br class=3D"">
reads. It doesn't take into account the latest state of interrupts on<br cl=
ass=3D"">
other vCPUs. Only the current vCPU is up-to-date. A full solution is<br cla=
ss=3D"">
not possible because it would require synchronization among all vCPUs,<br c=
lass=3D"">
which would be very expensive in terms or latency.<br class=3D"">
</blockquote>
<br class=3D"">
Your sentence suggests you have number showing that correctly emulating<br =
class=3D"">
the<br class=3D"">
registers would be too slow. Mind sharing them?<br class=3D"">
</blockquote>
<br class=3D"">
No, I don't have any numbers. Would you prefer a different wording or a<br =
class=3D"">
better explanation? I also realized there is a typo in there (or/of).<br cl=
ass=3D"">
</blockquote>
Let me start with I think correctness is more important than speed.<br clas=
s=3D"">
So I would have expected your commit message to contain some fact why<br cl=
ass=3D"">
synchronization is going to be slow and why this is a problem.<br class=3D"=
">
<br class=3D"">
To give you a concrete example, the implementation of set/way instructions =
are<br class=3D"">
really slow (it could take a few seconds depending on the setup). However,<=
br class=3D"">
this was fine because not implementing them correctly would have a greater<=
br class=3D"">
impact on the guest (corruption) and they are not used often.<br class=3D""=
>
<br class=3D"">
I don't think the performance in our case will be in same order magnitude. =
It<br class=3D"">
is most likely to be in the range of milliseconds (if not less) which I thi=
nk<br class=3D"">
is acceptable for emulation (particularly for the vGIC) and the current use=
s.<br class=3D"">
</blockquote>
Writing on the mailing list some of our discussions today.<br class=3D"">
Correctness is not just in terms of compliance to a specification but it<br=
 class=3D"">
is also about not breaking guests. Introducing latency in the range of<br c=
lass=3D"">
milliseconds, or hundreds of microseconds, would break any latency<br class=
=3D"">
sensitive workloads. We don't have numbers so we don't know for certain<br =
class=3D"">
the effect that your suggestion would have.<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">You
 missed part of the discussion. I don't disagree that latency is important.=
 However, if an implementation is only 95% reliable, then it means 5% of th=
e time your guest may break (corruption, crash, deadlock...). At which poin=
t the latency is the last of your
 concern.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
It would be interesting to have those numbers, and I'll add to my TODO<br c=
lass=3D"">
list to run the experiments you suggested, but I'll put it on the<br class=
=3D"">
back-burner (from a Xilinx perspective it is low priority as no<br class=3D=
"">
customers are affected.)<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">How
 about we get a correct implementation merge first and then discuss about o=
ptimization? This would allow the community to check whether there are actu=
ally noticeable latency in their workload.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
" class=3D"">
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Hi,</div>
<div><br class=3D"">
</div>
<div>I am not sure that pushing something with a performance impact to late=
r fix it is the right approach here.</div>
<div><br class=3D"">
</div>
<div>The patch is an improvement compared to the current code and it can be=
 further improved later to handle more cases (other cores).</div>
<div><br class=3D"">
</div>
<div>If we really have to sync all vCPUs here, this will cost a lot and the=
 result will still be the status in the past in fact because nothing will m=
ake sure that at the point the guest gets back the value it is still valid.=
</div>
<div><br class=3D"">
</div>
<div>Cheers</div>
<div><br class=3D"">
</div>
<div>--</div>
<div>Bertrand</div>
<div><br class=3D"">
</div>
</div>
</body>
</html>

--_000_A33FEB65F8444CA6BAE0F0C881CFD381armcom_--

