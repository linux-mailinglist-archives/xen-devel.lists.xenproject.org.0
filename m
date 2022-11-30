Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1E763DA55
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 17:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449981.707061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Piy-00024C-C7; Wed, 30 Nov 2022 16:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449981.707061; Wed, 30 Nov 2022 16:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Piy-00021n-9J; Wed, 30 Nov 2022 16:14:16 +0000
Received: by outflank-mailman (input) for mailman id 449981;
 Wed, 30 Nov 2022 16:14:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jz7r=36=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1p0Pix-00021h-AN
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 16:14:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe02::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 072478e7-70ca-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 17:14:13 +0100 (CET)
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB9975.eurprd08.prod.outlook.com (2603:10a6:20b:62c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 16:14:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 16:14:10 +0000
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
X-Inumbo-ID: 072478e7-70ca-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR78n9GxYOr+AYVpn461UIDQb/Bo5buCVXSUg2ak1AlZqQVWNtbXVBmrscqw+8Ff1mmuz6xeMYMMBYjm8rQ8cLoq8qyG1b12yxfW/+LC2dZ9pUn2U5puFee591KR+zsLU90jy/bpp06W4xQ2xLv+FZCZs5W09nD/LdsE9LDMBvn6wKIKIYIwv8K1B0P3FpCLSehOjltI3MaJyBW1XXzejHaeTv3IsAJdfmFIkIraHwO9Zih38ZLP4x910EGOw5of5i3zos2AvRPxZXrf3vLc15uspx5Dp92elU7rFyjruekGiZnxpbESO2I2262I3U2X3NoGDpDemuCDTUzZ3bGh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdLrt8oGwGedd9qds9SmzNqss5hiRtG6YsnpTrVKvSY=;
 b=C+Y19OWOnZHZcMC4bROIBrkMnAj4f+psYJZwjvgUwW9z+4Z8wReokKsKY5RhnL4rv6w1fJruPvKaN60R2uDFAe0A0jgCc/8YP6sy3VlWtaBCa0BTloBACnN3Nh/JPersIFFBm49nelef5AByRkGKD7IuSOCT0o1MhVX49gjHPwheaRix+ZSCY8/joCLiT4rk3V6s+X/6d9ugp208VfGCWmXL9W1rYEt7qFQVE/p70l+/6I7exB6cCmRgy3vId4kLMPyaBpWINgoqfqLmWl1t0VWyxFiH5h8SGCfWWExMBKJLaYkGAlmYwufZtM6px4xw800ofwAYg8qt0bM3FV8HjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdLrt8oGwGedd9qds9SmzNqss5hiRtG6YsnpTrVKvSY=;
 b=koO745ndzlXYf1wCA79WKBE01yNE3XOmcTZXfyNnnHOV2WygPvm9anfjAoaERlRAqMd1ZirVlaNTUJtUbs5I3ykiqjnkQL5XKdYj+h/GCyMSRfaIraYEgEnghPzVMMQMkWpkSm4ORFA86cYITNZ654iLFr3mL/fZF1wMoE349KY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 2/3] automation: Add a clean rule for containers
Thread-Topic: [PATCH v5 2/3] automation: Add a clean rule for containers
Thread-Index: AQHZBLWCwuaJdzRhgku5EuukHQuC4a5XnPoAgAAHJwA=
Date: Wed, 30 Nov 2022 16:14:09 +0000
Message-ID: <81A8B56D-B3EA-420A-9A40-8D98407ACAEA@arm.com>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <f793cc70fdb6802b66156a8756bf676fbac0d809.1669810269.git.bertrand.marquis@arm.com>
 <Y4d7UA9PXZ01FOCa@perard.uk.xensource.com>
In-Reply-To: <Y4d7UA9PXZ01FOCa@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3784:EE_|AS2PR08MB9975:EE_
x-ms-office365-filtering-correlation-id: 8e945f28-1acd-49fc-1d83-08dad2ede998
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jWzI30MyvC6dZ5/V2FxzUBT297UTTPtMraFvRDn1ZATAfxESrpek1sGqcFOK/eCofWZRGgOxGw1MyZ5Km4V3eHepzYrR6gkNdhVl2UND8FRy4hbwrHsOXrnXc2BytehUT7dJdXAfdPSoVJm49mUHgaOzVLkewGed7l6deHj909bW+Dc9AN6JmaY9lGHrfqmhToVJFRG/4PTmu29pCCZZcpCuHvuCGWN3gzFMPluAqRCQVU+ihyZ3IIuX7US9cEGAOPiF1FpWIBXVRCuQLgiv0CNwpwpylrMPOQKjM4lOKyTHJC7uICXO15jLRVzZpmuEnWj76+aV8mgtaKZg6Z/HbAbGKZ6lFoDAlZfBewEurwYOUSBE6sVZtU4HxRNq/NBhF9JJvrhfBa68Qd1Juu2+3Ylubt4DB6eYIeM7UnmIHreRVAM2goi6Rb3d7tf1p3gyocZk4N9uvN7mOiaScQDtST7M4x6NXxV6PBFFpkqdZBwmTzO2tFnSdY6uH9+4VKD8Q/yc8+MwXKvAhnYu3QmpDbm0KFRJf1xGkbyLhWKomKYPftNOFwycx1H7+fFDMRu+oAAKizJ2nWq11i/gZWsiymKgOTznKL4hw74b03obljr+x/a+QxUt/h3CRu9ONcutkKISiJpeRenCMC5cFr3MGLSpFdYCwqDobAO3MXb0Vt4SFfrjIs+KkLfggdJz+BIa12YV1BrykOiQz2PIluEl05neJ6jV8z16a1H00VbvtiE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199015)(122000001)(36756003)(33656002)(41300700001)(478600001)(2906002)(38070700005)(4744005)(38100700002)(86362001)(66556008)(76116006)(91956017)(316002)(54906003)(8676002)(71200400001)(6486002)(6916009)(66446008)(64756008)(66946007)(2616005)(8936002)(5660300002)(66476007)(26005)(186003)(53546011)(6512007)(6506007)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aH525uwNyhVkar9iARUTazElK85g+N6SDJg5EB0nB+nz66vA7YKjErVzw22x?=
 =?us-ascii?Q?mugzqeCgPFqVMhOcMM3kJcYzFwMzBlvqAOfv1Uk17euAC3ibjBKMVxZ5Exl3?=
 =?us-ascii?Q?o804Uce2jtItDGSJka+qsNtT0ExGUCtr96SnbEMaajZtfjQyr5WtRf7C8/Vh?=
 =?us-ascii?Q?2cF9Wm7u0fAMzIKa9efwIrwO4Ec1bf+ewaJLwvP0OMpTZnkwJG+XqwzG2cEI?=
 =?us-ascii?Q?5jOzOovaOJIIjW7YCp99vpvm/cJwZlyejlPIuPtahJASvyVm2dBIIHUsZAKu?=
 =?us-ascii?Q?sKLys0rI4XC8+qrezCRp8xTy9HAOsdJu0/8dzlynC/nwen/ZS2M7uvqmwR1j?=
 =?us-ascii?Q?eDOBPM2ci3L9B0/Ilz3rwwKLIaHchv+CwOADNZP1GRdnDrzaEPMmiWPrLEHw?=
 =?us-ascii?Q?P5Htj4uPa1fPUBbYXyj9/mrhM+z9aq0FkYDgijyG5b6txDYsK6Ymb2BQ+18d?=
 =?us-ascii?Q?nrDxpf8klElqF98y4bnXt0x2MxcXwEwZm8L8KGMTZFOschkE1WbJYtPx4SFm?=
 =?us-ascii?Q?naf6s4ApnGtvNNsjAvfsPnGXMaM9rgYWw3geV1OHJKwq1PV7egYdcGEwLdv/?=
 =?us-ascii?Q?uyqNWSbvUI0JiEanzSWjARe160gdp/+LNAYyZ7C/Rtan9Iceh9dby+AAEnL6?=
 =?us-ascii?Q?6k/+NQmsZc6Bw27PW7xryHE4uirJIPBNNUv1sd/DCva+ZImPPYDJxWzgBbmv?=
 =?us-ascii?Q?LQpzvlDfgaM4x/tknAhZrsVA16YFbHIRQg7OSHPQ+fZq8V0TT5obnBVaE0xV?=
 =?us-ascii?Q?yEgETX1YbVdsgZvBcEBilg6QUl801W4MosoWrPzbFPYYxj+EshTiZMAR3tYJ?=
 =?us-ascii?Q?KhhBYva50uJaFV5SvATHuCk67aeDOJtsZBrKZzF1+JJfrSx3IR6HdT+gtEz0?=
 =?us-ascii?Q?iXF6Avl7v9xaHileiiq9qcT+g6GKZgswIPLC1xU8uSe8b3o9ksf+qnnghaTj?=
 =?us-ascii?Q?T9yHJV96u74fceKnH8fH9M4PzFuJ0QTEiT47/q/nCVI5Sgm/tU5j0FMg8Xp+?=
 =?us-ascii?Q?DFk1xc/kEgfa4JK+RNLZ0i9btBn+Q1jeLe6I38ymrcvH37knA4xq9bZJukvA?=
 =?us-ascii?Q?HDZ3G0FfTobXGDa/ZgI4zmParHsm74PF8igKiP+Uky6P3spXMbf0UFHdw/Ed?=
 =?us-ascii?Q?R2QKgJVs3OaCWk3IiGzPT7mUegAv4B7ZX1ALAiWmi+YgrFA8wtrNi4PD0kSb?=
 =?us-ascii?Q?P0HmmHowZH5HdGabakGlcTyTeVWV1lbLXnABdx/ldBSGOw1FeNNQ4V1MuZF3?=
 =?us-ascii?Q?SYMoLPeMftaqcoWjwJU0umGRQOXutEuADn7wVL8VpdDmc9EfTBtSBTABw5B1?=
 =?us-ascii?Q?6bi1SP8p1pNXu8DmFsKVMSXNN7LnzzRs9hid36UGaIo170cCAjZ2MewSzbUZ?=
 =?us-ascii?Q?6vkAQLtoXwHurAJ55uzEZ4D7wG7hTKFsQuezSX6rYUkFosqvOOJFufnF7RRy?=
 =?us-ascii?Q?0Qv0qHL2dMWJg+mEoQXm/+tdE/6He6vCpcGexPjBU4MAzD7jH+Hi0+mRpvD0?=
 =?us-ascii?Q?6+trl6jtD8p92H7PlvKHGn4nlTGAA0c4MLpEZFLp5KnlclzSrDBq5fLqMoZp?=
 =?us-ascii?Q?3jGLoWh+Rc9lOud83ab70lztg+OwnsH4/MS0FZYxLLAO66KeHo20fNHD3tqJ?=
 =?us-ascii?Q?mg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <15773CBC3587614E876EF6142C65D15C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3784.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e945f28-1acd-49fc-1d83-08dad2ede998
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 16:14:09.4176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTlThql1YBI/xe4ydphD79yItsdT2iGVuC4sean2d7m+khi11TpVY54V03BgCyBU+1Nra+OWD3k3q228n5whSVW3Mc7iK7ZTg0zICb/9018=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9975

Hi Anthony,

> On 30 Nov 2022, at 15:48, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> On Wed, Nov 30, 2022 at 12:15:08PM +0000, Bertrand Marquis wrote:
>> --- a/automation/build/Makefile
>> +++ b/automation/build/Makefile
>> @@ -28,3 +28,13 @@ all: $(CONTAINERS)
>> clean:
>> 	rm -f yocto/*.dockerfiles
>>=20
>> +define CLEAN_RULE
>> +.PHONY: clean-$(1)
>> +clean-$(1):
>> +ifneq ($$(shell docker image ls -q $(REGISTRY)/$(subst /,:,$(1))),)
>=20
> Please, don't use "ifneq" in a rule's recipe, especially when running a
> shell command. That shell command is evaluated every time make parse the
> makefile, so we are going to run `docker image ls` 23 times!
>=20
> Just write the call to `docker image ls` and evaluate the result in
> shell. I guess something like:
>    [ "$(docker image ls -q ...)" ] && docker image rm ...

Very good point, I will fix that in v6.

Cheers
Bertrand

>=20
>=20
> Cheers,
>=20
> --=20
> Anthony PERARD


