Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC2AA8B6F
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 06:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975832.1363139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBnOR-0007v5-Gs; Mon, 05 May 2025 04:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975832.1363139; Mon, 05 May 2025 04:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBnOR-0007tJ-EE; Mon, 05 May 2025 04:25:27 +0000
Received: by outflank-mailman (input) for mailman id 975832;
 Mon, 05 May 2025 04:25:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7S6=XV=daimlertruck.com=john_preetham.l@srs-se1.protection.inumbo.net>)
 id 1uBnOQ-0007tD-VA
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 04:25:27 +0000
Received: from FR5P281CU006.outbound.protection.outlook.com
 (mail-germanywestcentralazlp170120004.outbound.protection.outlook.com
 [2a01:111:f403:c20c::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f73891b2-2968-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 06:25:25 +0200 (CEST)
Received: from FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::5d)
 by FR5P281MB4888.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 04:25:23 +0000
Received: from FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4e19:b0d5:6db3:dc90]) by FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4e19:b0d5:6db3:dc90%3]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 04:25:23 +0000
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
X-Inumbo-ID: f73891b2-2968-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rubcwpDE08Mfgz7L1c2mh5nQGpYd3rWVIUrwThZOkf08+VV9YBtb6HYI+iZni3uRC57eq7gwbErh//ItUUEY8N66BpZ3OzCsS8D0j3/mI0ERNj+a/1eY2ZGxzMCqYS21zw9C+pSOAW6X1kCM5VlGsJykgU9ASghqRczX9XdbLJUTCc1KgmTpDuRZCSEYQ/7egGhvpaGO/cksOB/G9efqUg1insX6ZCumwPQdl8guM+NH8B9AXTRzFkIuJ8UhUM1Nn2Fk8PTqYjG2x730/SKeihWnbo1riE+bG4A0cswAst5hEMraApabfMjOPjRa3SphzhHWjm0VFYcvY9aDAYyuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCPLpFcuvpNGpG9Zlh+5o7uKYUi9HXdB2CHO+LqZ9RQ=;
 b=R2kyZK4t49ZgFQCq6wFPVzpZnmWLqSJKG33iAGIq6pzdNMLqbx17eoaEKSxkDTeEv6aHhyPqjDPagnSDTbqi+di2ZFoXNmGSJHm2DROAf8t8G4cAHFNsn24riqROipr7wpKwCyTu9L4MVcHu2IS0wa86vu3kLfMjGKpCoFwr9NoYtQOaxlcSQ8U03emUlH54vMdZUxR7XJ0I2pd+3sXeSzQLFbYVR23TiybwG1LQW7x0ZDK8lIbI1gE7PM+anm8O6WhBOOGL6hRBbZRxInmbDvEx2v1C/C5DKRihI6fEJKzl/oUyDc8jPFkMrBb9RjaF64akxnXW7TFk/6HvfG2J6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=daimlertruck.com; dmarc=pass action=none
 header.from=daimlertruck.com; dkim=pass header.d=daimlertruck.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daimlertruck.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCPLpFcuvpNGpG9Zlh+5o7uKYUi9HXdB2CHO+LqZ9RQ=;
 b=QGus/aLz+rhbUs3vkQoU98bzYCNIJnVXMla69lokupJa2FOLuwE8SbYJZBGOkgZzzcVwmkHgPJ11ai6rzIc3udAZ+KNqSJtZYPMp2ytewcdVvvU7wveapRhlDNfS03u/ZAsloRrHSQJNq3IWaxrWUYpyF8Y7QhPaXTlgFFb3Cdj4hmzoTVCpLlL2q/b2SVziBAp/cvRqocrMC0TlSaP+FHW92e47CzPcc9kISR2bpdITJRMfazhGnVxoQs9GU9Rv5/H7K05Lv7qfAIP1j758lV/H6jG0+yhLn5mUsYUFqeHbvzVitC/dPuooYDnS5xCZUaVtW07fPZozOHtFOVxtkQ==
From: "L, John Preetham (893)" <john_preetham.l@daimlertruck.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ruslan
 Shymkevych <Ruslan_Shymkevych@epam.com>
Subject: RE: Request for Documentation on Bringing Up Xen on R-Car H3e
 (H3ULCB)
Thread-Topic: Request for Documentation on Bringing Up Xen on R-Car H3e
 (H3ULCB)
Thread-Index: AdtsrjaU74AF3fZpR/+NK9h56D1xZhQx2++A
Date: Mon, 5 May 2025 04:25:23 +0000
Message-ID:
 <FR2PPF86245AF1B97AC233A5D738AD088B4B88E2@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
References:
 <FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
	<8734ha2evr.fsf@epam.com>
	<FR2PPF86245AF1B0938F55DAF4FF4E63A31B8E02@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
 <87ldv0248u.fsf@epam.com>
In-Reply-To: <87ldv0248u.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_ActionId=cb9711b7-4f14-4229-8820-b10613a1c346;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_ContentBits=0;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_Enabled=true;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_Method=Standard;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_Name=DT_Standard;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_SetDate=2025-05-05T04:24:53Z;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_SiteId=505cca53-5750-4134-9501-8d52d5df3cd1;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=daimlertruck.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2PPF86245AF1B:EE_|FR5P281MB4888:EE_
x-ms-office365-filtering-correlation-id: a2f51af6-9152-43c0-a082-08dd8b8cda70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?szM+4id2fQPyQr4FxxQXr6nTENY1wJQ8xfLZDgWbw4y2tRW0Ms/Ed2ZPqdY2?=
 =?us-ascii?Q?/M6E8zcTo1mgRXAdM11LbNI83li7LOUE8rs/K3bfphodbPp/2AzpCk36a7MT?=
 =?us-ascii?Q?mHoS9VUn1oE70T78NDn2VZNZApHvrpnVI1HUQbxUB6X46eqFNaBkGhjNFFsh?=
 =?us-ascii?Q?0oDdFsYoiWW36MXNo6eIbPT8E4a2rhTbcnSyC/iG3IPihyLsMs4/k33CUElT?=
 =?us-ascii?Q?65lLEGtyslmzYWdPunSUSoCSNQsKqBuiH8/Habzink+PqGQvNakRhRFgsVTn?=
 =?us-ascii?Q?WNgLD34cioZrOUyNNqVkQrcCfJoOppse9wxKPLn4zuyB6Y0wzSgMxgFiTp1m?=
 =?us-ascii?Q?plzMowELFhPyCvBP3xuZuOWzuRTpwEmtdUMSs+at2QRWitTxNuAcPubiD1Bc?=
 =?us-ascii?Q?dkVToOw27unJsyAzuI4GRDUtwHq02QUaKF0nSFdVw1wgF4SZoJv6Dq/NNpCi?=
 =?us-ascii?Q?ja/woXPxikttk5hmWrNTU7nIk6hCPiasX+VhQfQXR40xjWaxmvrbgeVtaq1i?=
 =?us-ascii?Q?3wFniu7DX+i6KVCOrNWbiQt8+5xXdp/GqfjqlZY/H2AnJBZvIbjfUSDhf/nR?=
 =?us-ascii?Q?6QSVMCQ9GxD3N7QhMXJlmpbqffBnyIVuWgv58k01dDWozHCgSyq5hcp6lqza?=
 =?us-ascii?Q?ICJ+U3b/1ZnVCW/WkfWVmOMdtgQ3fZctfV2/+G1oKPwNAzIB0TroTyUYdti3?=
 =?us-ascii?Q?wiqTQuSjE1C8ZLGu8jTB/B+06uO0szPx3Wi4pydqDw2l6bJzdN+Sc10oBKeo?=
 =?us-ascii?Q?w6bhZddLkiueV0sMaBtCNDKnuXs5mzOlEDGwCWTIQMGh1U9KEWGR1qOOrH5p?=
 =?us-ascii?Q?cq67POwhwYNGcBFMxphESbcYOb9Z1CCNvJ8bhaLQ/5rAqCUGlnLn87d8tXs/?=
 =?us-ascii?Q?2LBiinLtfJLEiNyN4WESivjoWPj8Gno1v1sqe4N7kSdDzjyDCxK1WgJSWnKv?=
 =?us-ascii?Q?AzKyZGUGvyaIU9geVvlnqL35TdpBKCkAM+UODHpEdbebNeEbXIhH1MwyKtbU?=
 =?us-ascii?Q?E04UOIevybcOdHYID3UshhJVj7I23tsCNjrxOsDaczR7HX1JHmZFsZm7IjJo?=
 =?us-ascii?Q?ZTvBRkxYJfEo0X2e2bxK92eYtAW3XGROUKd57aTx2eI473fTBaPj7jc2IfY9?=
 =?us-ascii?Q?CtAQQP8bEEjA+LRU/cGrhG878ablVkf2V3pYl8d39eXZ137DG1eBISSNEmQZ?=
 =?us-ascii?Q?8L5qaPlX/0vUt1WAmAkZ61V5oPSTZN0v5rAuOyzdCu0z44337K0hU+ZQiC35?=
 =?us-ascii?Q?Rs6eXRlUNQodeK25ox1L/7NpQ7EdTcAvRQZavcQGsWdRpwz9nUKSY/OskJKe?=
 =?us-ascii?Q?MCIqR8h273rUBwiCboVksLchyPEo6BOeddsICdEue4krXWKgCnCERuT+fSmo?=
 =?us-ascii?Q?JJH/YsRCFwhG6vJ+CBKXLGGczkhrat3PVDReWeGPn538STCUZ7AR/PVPeH9x?=
 =?us-ascii?Q?58LmVZiSgfg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9NDDybl1bK+yvMIVZ139kqZnoFVxMnl6lOLPCGiOHYZIXb8Z7B38RspXQtXB?=
 =?us-ascii?Q?q0mTezDD169zdhsI0bBDKFb35T0cfmH6nkDIIwznuBSW1vGG9AXzNK7dS4V2?=
 =?us-ascii?Q?swPwwEdK5L9DClX+kKG90eZ3Ute0/GsH6jA17IffWTUtGk6DJMM7hUwKCLdD?=
 =?us-ascii?Q?UPbFQYbnfp+SGxHeEFgmkLlDN5uxVzpC0oN08JL5SMkDrFkEU/oWBWjg+iyn?=
 =?us-ascii?Q?SQVUg5aVbZ0zWQ7VImC33pbYFmlKcJISJH6c5w5YytVFUt+YMLBYVKtuesc8?=
 =?us-ascii?Q?xmw1gpeB/whPpDhEdSX6gJyVOS8OTstcxSIslwBzySDArDJOfpG0vRSSbYJW?=
 =?us-ascii?Q?CMeciLCkr7GTCjjYkJA7FTNJlk8o83hMpr9DdyhA49QmQ7+FwhTuu677JQhs?=
 =?us-ascii?Q?V3GIKtFit7SKM/8UKA0yqDMbTVuDGhW0ygzeEgmIOJq21ja2vCd9gbx/fTwk?=
 =?us-ascii?Q?dUrxcojB+/d3wk/YSHh0SZTXJ505maFq+Uiu0V+QTIHL9QM/DFvkLbIky8un?=
 =?us-ascii?Q?BD1XGIz3avqvFes67482/hdQNmrMe0U6p+l7pQ38R90B0njvjm4rUZgiTeTj?=
 =?us-ascii?Q?P6yLjmuOXXggAvGb3s3acGRXp5Cr2ZtpSe0283ZzYm2gzXifxR6Hu1xpx1Ec?=
 =?us-ascii?Q?uvKxWfY/ZwfXI5T3wVxrO4nqeiO9mrHeyBB+aaSfF/ow+qhnATDLusHzeOoi?=
 =?us-ascii?Q?74NTfs3rnCs3p9GDzPjSELxif6iYRPsmSCnMjAj9VSUJPA3VyPCwH6irb+7G?=
 =?us-ascii?Q?iUp+Fh1+vlA5Tc9XzhVR/CbVwzzRXFDBlTxYb+yRcLNZ3uA4xsg+ykzZZynL?=
 =?us-ascii?Q?Ma+xqQTuY5BCyx6e6wMrn9NgvIkaceit7A29qB61/PE1BhY0VCCvnKhfWMwL?=
 =?us-ascii?Q?LGdcjw/DK2nj6IFEcGmLRrhlpNbc/Ppt9//Oy/yf05Tn3TtX5eiffAX1Q5oW?=
 =?us-ascii?Q?so2cMhX4p8S0p4/GdGgXby39kpxD8H04yJ1vAWK9DwvkGCgTK9GjdK5mwDBT?=
 =?us-ascii?Q?2Fhgqqd/+RHvr7OpK1riNgSU51EJ3VnNpwKkCl+rwFa+R4w1Sw7HXQC2KK4s?=
 =?us-ascii?Q?m7+iWsRxAC6qd9iAFkA9ft3OaaMfIFGKKvliZHWJ8qCkklB/Umhb+aT+cgi1?=
 =?us-ascii?Q?+cQpD0P0XgC7cjIN49A2ewnooo3eUTfTpqcb9A0Fa2AChvyfdXUsDmNgoTqQ?=
 =?us-ascii?Q?ez6RBx7pZfhg1def+2bzS5rVEFpYq4J2BCpqxU3ulfJCZqg8UC81qvMD5QIV?=
 =?us-ascii?Q?/MB/dHyr6KYzKJSnfbJdy2zCU4vqvdL9yvMqRfpmSoPhsthRp/794Kosbh4S?=
 =?us-ascii?Q?eu+v2bg3sqqSVDSddVlQWqvLBVbR9h1s3l6AOOVIOvQUdtJy64Qtbm+CvKQX?=
 =?us-ascii?Q?muJUHgKLjLG3caxOBkKl31JjXaPkHJdEUbLE1XVFHF1hpIDpyYhJ13UXGPo7?=
 =?us-ascii?Q?GA3maZRQPOKJrwlH3jMxvgAH828KRvYy/C4ypnM37S3o9PiiV6KapDqVkzft?=
 =?us-ascii?Q?DbBJ5ghv6w990psQYBfNivRLQ7Fvm5VfOLS9S6DzHmQZNDdCPf5wQHqk2v+e?=
 =?us-ascii?Q?1qqvYsSxGt/JSk1bWXw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: daimlertruck.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f51af6-9152-43c0-a082-08dd8b8cda70
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 04:25:23.2824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 505cca53-5750-4134-9501-8d52d5df3cd1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BqeWnmOdbxEa74/E8UoujiHAXg3da9fqxY0HE0W9IcrJ8RY/WD9NXop4Ud6bP0x8sRDx3JJgCT1TSawVP9tvLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB4888

Hi Volodymyr,

Thank you once again for the detailed explanation and the helpful resources=
.

With your guidance, I was able to bring up the XEN hypervisor on the R-Car =
H3e board successfully. I really appreciate your support.

Now, I'm looking to move forward with bringing up a QNX guest on the XEN hy=
pervisor. Could you please share the procedure or steps you recommend for t=
his? It would also be very helpful if you could provide an example Device T=
ree Source (DTS) and XEN domain configuration (CFG) file for the QNX guest,=
 if available.

Looking forward to your input.

Best regards,
John Preetham L

-----Original Message-----
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Sent: 24 January 2025 10:33
To: L, John Preetham (893) <john_preetham.l@daimlertruck.com>
Cc: xen-devel@lists.xenproject.org; Ruslan Shymkevych <Ruslan_Shymkevych@ep=
am.com>
Subject: Re: Request for Documentation on Bringing Up Xen on R-Car H3e (H3U=
LCB)

[You don't often get email from volodymyr_babchuk@epam.com. Learn why this =
is important at https://aka.ms/LearnAboutSenderIdentification ]

"L, John Preetham (893)" <john_preetham.l@daimlertruck.com> writes:

Hi John,

> Hi Volodymyr,
>
> Thank you for the detailed suggestions.
> Since I'm new to XEN hypervisor.
>
> I will approach the recommended method.

Yeah, I think this is the best approach if you want get something working A=
SAP.

> Could you please let me know which Yocto version is stable and tested fro=
m your end?

As of now we are using Kirkstone. I believe, this is the latest Yocto versi=
on supported by Renesas BSP. And we of course can't jump over their head. A=
nyways, if you'll follow instruction in README.md, moulin tool will fetch a=
ll required meta-layers and configure Yocto for you.

If you are interested in exact commit ids, you can check the YAML file used=
 by moulin tool:

https://github.com/xen-troops/meta-xt-prod-devel-rcar/blob/master/prod-deve=
l-rcar.yaml#L32

--
WBR, Volodymyr

If you are not the addressee, please inform us immediately that you have re=
ceived this e-mail by mistake, and delete it. We thank you for your support=
.


