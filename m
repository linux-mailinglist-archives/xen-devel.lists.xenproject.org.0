Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABMFENwngmnPPgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:52:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C6CDC4E5
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:52:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219440.1528326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJdh-0007GM-Jc; Tue, 03 Feb 2026 16:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219440.1528326; Tue, 03 Feb 2026 16:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJdh-0007DW-GO; Tue, 03 Feb 2026 16:52:33 +0000
Received: by outflank-mailman (input) for mailman id 1219440;
 Tue, 03 Feb 2026 16:52:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vnJdg-0007DJ-0x
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 16:52:32 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b97dfb68-0120-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 17:52:29 +0100 (CET)
Received: from DUZPR01CA0177.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::26) by AS8PR08MB7943.eurprd08.prod.outlook.com
 (2603:10a6:20b:53b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:52:23 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::43) by DUZPR01CA0177.outlook.office365.com
 (2603:10a6:10:4b3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 16:52:21 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Tue, 3 Feb 2026 16:52:22 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DBAPR08MB5701.eurprd08.prod.outlook.com (2603:10a6:10:1a6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Tue, 3 Feb
 2026 16:51:20 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:51:20 +0000
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
X-Inumbo-ID: b97dfb68-0120-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xZaaUP7bJ0/o9Za0ckp1zOfIwBUe0WmGVsuCkbmnQScCeVzoCiJb4wynPlbLd/LDCba4yeiPQkNA3Vl/Lh9m+UYFTHG+TfyvH/KY/TgPRrDpm/Yg9aKA/gkUEfxZKySrfnpThDnik2fAod+mKSzjd9GitKRTzsENJlApt4NN+7Aj82QYmeegqi7UpR6NaUu5hPRHnP9oaci6iLYCXB4Iad3c5H9EACt+VTtEwo/qOPoWhWBn1rHvAKLNkMogqLpXDHsMcEsDThVnNHU0Hmu9+cM2YIBjooUF7FOUCMhcPGMUSjy8kehC+a+Y83V4Q7SqB/8zssIV1zw9Q7khxkPR4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQSgEvacbHfKts83KLF59lkFx/eE1Mv6ANV0KpIOsEY=;
 b=WI/rmebtFdU+Cn+cOzB8yATgeo75UTeYVHLUDYsfr4lX/b2ADjuOTAO2duRi2lIbJDEBndZfVC2ssFxzJRXILqsxgiMY3NvIRqMWHrR5GPp6juCMOFQYNMH+znM7cqVHg0VouPC5NbMVlXI7PV6229CXiUJiFRxj7FR/OuOvFrsa9hbZqR727guKZ06IrZY5hWw9m1re4GyU9Zv1NKyAheuHkyw3CWAKr4SKFqqQVfpw3Dbx2Boc3bBMdpRjcOrFUeymAIQIqk8SGdWb9xNU83kr3MRda13uiOJph6n/XbemWDYKESSgXfmZAOiIJUCbNsk1dpgJAo/y4pMPwbDgtg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQSgEvacbHfKts83KLF59lkFx/eE1Mv6ANV0KpIOsEY=;
 b=f2ZKkTdJwj/FqmuADFgDvBhn5KpGS7h72NbMRVRRZUr5NU1CLvw2oF0s8cbGX/XZQipo96+peJs173YwpBoi5OSl4E06NtsI0q/romt7mOA9MjFTIJi9CEi+kwOd579b4j7bbuWB7VP9tEOYOWNG+/FVUC/PzPcumG/0I97ik8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWv6nNRxYlWVNZ1Lc+z8te0hEQVKO45A0REpV5ZNcx+6zxfLEpwePb6O0GB14kOldaAuK8r48wT3p3nWn7gTGvkWfgyx8qkmRMpKJmQUcB7N+5XqUjNN5EOkYkpVc4yFGVeO0FNGZWuRT3I2xS28cPmPB67dbZ/yzoc9bb2qSbW07psA73B5ITNtFeXx6ZzJV/Qzm9k+3N4IpitdKozB3imfHEr2509KMMIXl4VkrllUAzK/Q5oNl4qxVX2NwUU32TKO2OoJCntM8fpa06EULPStFZKEbWOA4p5IOo62ooIuwS/NTiGakz7DDOr82T0EjG8zfWkixTHe7/LoeCuMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQSgEvacbHfKts83KLF59lkFx/eE1Mv6ANV0KpIOsEY=;
 b=s79W60m2j09oYbb4yM9Qcw/REE8ooco+A8jo3I3rtL2AC02Wes6AIY9iqEkQla+tGeG0qfRehXe9msO7s+TgmMfUoMebBrKtUV/L1pfIzcxw8bRbMeJfFh7v4Wc70vGu6wSkr67YhYfp4QblHsaOe9+qLXbSxu4QYq5au5pAqENB3je9nZuP041i8dxUhbCq/qs8Wmg5bCKAqTS4beCT5jUOoH+0mmYZl0Mlly98AaRSbss9/VctLVVUj2ouiI/XMZsLnnfa/TUHuTjGRSVeXuiu16RuVgOg1IOonJQe5ZxQQYY6HEpRJ995EsJqqmuHzrjqyVJIYL1BUu8OUchHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQSgEvacbHfKts83KLF59lkFx/eE1Mv6ANV0KpIOsEY=;
 b=f2ZKkTdJwj/FqmuADFgDvBhn5KpGS7h72NbMRVRRZUr5NU1CLvw2oF0s8cbGX/XZQipo96+peJs173YwpBoi5OSl4E06NtsI0q/romt7mOA9MjFTIJi9CEi+kwOd579b4j7bbuWB7VP9tEOYOWNG+/FVUC/PzPcumG/0I97ik8k=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 1/5] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v5 1/5] arm/irq: Keep track of irq affinities
Thread-Index: AQHchGj7DB4SczePiEuTZHuufPnk+7VxUcYA
Date: Tue, 3 Feb 2026 16:51:20 +0000
Message-ID: <4ED49C13-2913-49CE-9ED8-A785A0069E25@arm.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
 <2991ec1845868940488c912c5dd34798a58bbf87.1768293759.git.mykyta_poturai@epam.com>
In-Reply-To:
 <2991ec1845868940488c912c5dd34798a58bbf87.1768293759.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DBAPR08MB5701:EE_|DB1PEPF0003922F:EE_|AS8PR08MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a12eddd-675c-4e9a-f2ab-08de63449a43
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?24Gs674SeOL2DXAPp+/ywp6zTgt6rFDgPmo28vWxUm6e4YM9iq2dodQo2gnm?=
 =?us-ascii?Q?nD/oNNe4r3VNIhgra+L9OW2wBqmotqOot4UojIPvRjNsDL4KX47/Ef7WtFve?=
 =?us-ascii?Q?eFajszLaD5Dz9wHwA84oyLgUP2VTb7eknJmJqK3A8ZbMvITpU7STfFPqbK1V?=
 =?us-ascii?Q?K/kyp6isxBqmHuPMU+zdzu4VXT/XJnOFqjiOjWY7xrkLaP7uG6IVyWCEmUG/?=
 =?us-ascii?Q?6MQbJWOMZRUPWluvtWgr2G1Av9L2Mz9mvYheim4tT7rlbxSkVMrk+PpYddgb?=
 =?us-ascii?Q?NDxgl8ZNya+dfK7mmIcLS9PNiyaQ4GzhLcxKIHRiXw8rrP7jq2KSEVTON7rm?=
 =?us-ascii?Q?HvJ1OJApC4eAS5xSh/eDNZLCua0pK+LV9hA2GpuyaxQKTFEcXVJ5U++/6iTD?=
 =?us-ascii?Q?DwsZTBl3rEhjlpMV42DM6a1WeYTqQozEVuPts6WLDU357sJjYYsaGvhvPKr3?=
 =?us-ascii?Q?OU5DD8l+VCsgpDzalzvItJOcWDSS8PECJL2LHyYy6C1u2nxPS7i9jCOMm0lb?=
 =?us-ascii?Q?Agv++ziR2SfqP+sN+HFPg6KfHw7c9SVH8BLvYHA607zN/YcOTyZIgU4JSnKT?=
 =?us-ascii?Q?C57sdl8bMfuw0ZRRlaaXdeKTQCzl5kGe9IXZqjwUboPHhpYAj5uV2sK3dulZ?=
 =?us-ascii?Q?u3H+Dvjv7NdqGPTU+pTzkQjlWfcxL9h/HxRlkiDzp75UmyHaIeCqq/Quvt8u?=
 =?us-ascii?Q?zTaoUhk7tT8Ep9b/cM5njAh4GJ0mMqjNG6Cz19v8Dgn+rDS1QSvwSgeMJl5s?=
 =?us-ascii?Q?YMwR1KzJ/SyfitB+JqTse+l1A5ZWMPT/cZAXlEldgIErorWwWF/91ML6En5D?=
 =?us-ascii?Q?6fHF26gieROtddTzL670hP24ukfIu4pVTGbDR1jToff82gfeX3+K1mlGAIEK?=
 =?us-ascii?Q?r6LO1SpW6CvHvkPopMbzCKx6iXh2ZBL4Y/OrmmDV+HOI40aEtT24M6jZ37HM?=
 =?us-ascii?Q?tUSBYAM9UbDbDLcLszLZ1jT3dEqgnHnDi7BNVPaI+pvfjU2r2IDWsm+mwtV/?=
 =?us-ascii?Q?ByW6u7ZM/GGltm5U08D93SzGD7/sh/rpUGNcF0uotwr06DbhtN3ulIHSFPT/?=
 =?us-ascii?Q?IQqqSMGno2g5Mv8ovi1Lh9BArrJBxGeriEkXiBRO7kzabp4jqbt243NHe2eZ?=
 =?us-ascii?Q?TVNwFd1lUFtKVD9uLaiPv7GND82zE9wFVRr+tvZ/6O61YXIRE6TyWcM/EDNV?=
 =?us-ascii?Q?/dtKXdx3gJCN+F6EAvL/f8/M/+UUs0o2h79J6XqYN+AO9GanTRTodHRQ2EYb?=
 =?us-ascii?Q?YANEBZM1MImWTfS+zZKRPfKAF7GlCSR814GCxZ32yozZNiCWOANIOwJQP8xX?=
 =?us-ascii?Q?31xu9sLnhDdlyV3dGgRrQnhgY4kobVD6rENor/AbVqcax/0SW+ggCNkoiPKc?=
 =?us-ascii?Q?N2SVM6YnkWns+KX2+BW4icyWOfJbON/vSFszXE4XwtRXNR0i5+IREjlwGMlP?=
 =?us-ascii?Q?pRccYzxLClY7r9f4p/rZTsEs2d3aaihKyssn2Ur0dCyqijuQ8ohP6XUDr5k/?=
 =?us-ascii?Q?MK61mItSrY6pfa0Su1ijF4fx22imJVikeEOobGrcdfyYVlB/BsoxmQVk1KpG?=
 =?us-ascii?Q?cgfMS7seZIr/KddACLfANgR3BK9AtbM5JNBlx5cygKWt1Ikh6tng+RBn9N56?=
 =?us-ascii?Q?zebeuSMSd7bLSHMohoGXOuQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BBD94D3EC2156641BC0B88D55BD0F358@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5701
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5e763a84-6fbd-49e2-c285-08de63447524
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PFB6YseY/2R9/lGakhPEvWp+4VQYIt5YxTtIHd+Bjao7to4iUjMxDBOOEGrL?=
 =?us-ascii?Q?9vSQa9Jq6dRaVxtBrUOCtwjN7Qk4V+vY7e268fywwD+4Bn/5QBfo06BkcwBd?=
 =?us-ascii?Q?HnjDFCEQ0hjkpENl7bUrpCdgDh9EfZ88r/FZP0LQS+sFTTkYF72ahYUcZnwA?=
 =?us-ascii?Q?zuNevCQFXo+kULT61yVSes6fSDRcGCmN15grdoDE1Gt6WmBJiEMJucKfH2xJ?=
 =?us-ascii?Q?wv/4a8CnmuDclB748sG4ryMl62BuRuCqIVNdEqC5HqfbTEkdVZ5+3xp2PI6M?=
 =?us-ascii?Q?wxwXbvvUkxaYzF0TibU4OGkVgVic4KDKg80Y+f8sdgADKGIF8Ysz0BbcSh/G?=
 =?us-ascii?Q?movUnd6gh9RnchxAkb0Fpo/4hzRLj5IN84FELNIAxonQFgNb5EdPDsdBQNDr?=
 =?us-ascii?Q?LuZdm18aP8GSK3lKW/1KZGJZXoMpYXrxbGRALPML9Ke121kPgpaXdp6id7Uj?=
 =?us-ascii?Q?QpuegfNwa0aTiDnq/imuPgvQcLrDirRye6XkEoq0NaTySzIcPumEgnC0X7df?=
 =?us-ascii?Q?Ye3tzbzYlF0/8/Jps2DWv1s92oV663BIYtnUNgVJ9C1ZWBYXU2mtTjYoGPEk?=
 =?us-ascii?Q?ySiXR2Qt/n/yGtyDeZbGtc/g3fA+zDTghLFstQ4ZSDnJIuLLYYjZrkOj56k+?=
 =?us-ascii?Q?w1+86K1HdwttZvGY0G/01oh4KWkmpkUeVmSPn1c/UAAaqg+kB5nJgREc5sP5?=
 =?us-ascii?Q?xXHAibic52imMLvk2tZhhBivVpC4HtgwR9dM5BnEj1B8zTBQb1C0KQZQvEk8?=
 =?us-ascii?Q?u79awIZ3PYfUepcD7dp8K5+6r/LQHb0vP8nSzkl6zZNzPoLY+yC5AxIfgpLK?=
 =?us-ascii?Q?cwmbYMGacBvxoCab+5gZgyEvmBzwy+Hu9MzO3q/hXDeyfP0RA0JgZvKYxbt9?=
 =?us-ascii?Q?v7s6dtNsZfjnnNg/vBxBheoubO4AueOPwQJbyAekHKUrTUiTbhNb6MK6FwKA?=
 =?us-ascii?Q?up26WV8z/XFmWG23jISmSiU0hBzMG4K5NAsW+C6Su2Se9UjCkQjxbviJ3sZ1?=
 =?us-ascii?Q?MySoVx34MXK4qZN0h73tGzSyPhlYUPmZxTIDvch6AfDuQp9oNtUZxYL6xp3d?=
 =?us-ascii?Q?InS877EFat4nC6iEJKrBtSoTdvwdRTpSkh0lDpcEfZshMWqgQbgB9deUOoEC?=
 =?us-ascii?Q?sz89Vr+ztoi3e+jcy6lxUEIRok3olpwEiCOU/Htlqy8n1a6qyigu8NxMhw0W?=
 =?us-ascii?Q?ZB0dBRQ9pvvgcSHVz6aRigKBPYNm5i+8Ysx1Q174O0QVK44OHS1XOAyTKItH?=
 =?us-ascii?Q?yOtM2kIAoR4rSzkwb/bVvmszm88MCPO8vBs7UcbzTayTXqzBLAKG1shUJSL4?=
 =?us-ascii?Q?psTwDhDnwpGvsSH01YdQCRcPeAeedIweVORX0mHVngzeQICISMTWz6Xmovqi?=
 =?us-ascii?Q?kaiuVfFjvo2BJ7fv1qJEzPdGAWOcBA4uu7tWI1oclWriWTBeytbv71auIHXt?=
 =?us-ascii?Q?nTF8RlgnSyM9dBzaXEDsd3eFo9kbPDYf5R//FHvT2+YjneDQ0ykmbhuOCx37?=
 =?us-ascii?Q?IMx2h+V4Dw+uV2S7/rFDN2Up2YcvOSu9yPleFNCyWTbmFDlLxNykJ0R3rmG7?=
 =?us-ascii?Q?oiYZNQJB45PgmL737twmg+5QoizmEI35IUbHdS6vNMvxho5wQgCHE3dJvR7h?=
 =?us-ascii?Q?mXlXOBAHth52HWeoOHl0jUqgNwPxr6TenIU+5ei8rpqrjusGGU4XVXywh+dh?=
 =?us-ascii?Q?svGHjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	myBumqaQDmyr5P/gC7xJs59bJybqEsIHRNn33uQdTzMqGkJUfIqsDcCi55LM7e3KgTmsL0u7jhucF3uZUz/3zYFtFwrIzmYyNx1bPlX9wSjqJgMckFbYyIAKDuW7gV3fpXXRf7Xx0vmqk4t6k8ntkbDX79Lk1h79vMn97iGkvbtm8X4FVTqa0DoRosO3lj66pr5woYDMAD6+kvH/+WRyf266b3wMlhp+t5+qnSQspaxHzxXdcEEYPg7l/IdhSbN10Aquniyy1g6AgY5rs/PbBf4gSWiDtMFA7hAWEmLbwl6kJrQ9waOXTjZxemhfPs7iXR7pl8rnk3kga12hfu9plg7JRrl4VuqjGzAVzus7nGbieF8S3JAN2wuROlaWI94f+m/4pCXjfzlMQSoTfLJ3Bo+vUxQCND8UceHtUxx1GemQ/aUgtKJdoUQdg5bZ44ly
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:52:22.9208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a12eddd-675c-4e9a-f2ab-08de63449a43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7943
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[94.247.172.50:received,4.158.2.129:received,2a01:111:f403:c200::3:received,2603:10a6:10:4b3:cafe::43:received];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 69C6CDC4E5
X-Rspamd-Action: no action

Hi Mykyta,

> On 13 Jan 2026, at 09:45, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
>=20
> Currently on Arm the desc->affinity mask of an irq is never updated,
> which makes it hard to know the actual affinity of an interrupt.
>=20
> Fix this by updating the field in irq_set_affinity.

You are changing the generic irq_set_affinity which now requires
the irq descriptor to be locked.

This is good because it puts arm at an equivalent state than x86
one.

By doing a quick check there might be places where you
forgot to add the lock/unlock:

vgic/vgic.c line 826 (arch_move_irqs)
vgic/vgic-mmio-v2.c line 173 (vgic_mmio_write_target)

both of them take the irq lock but not the desc lock as far as i can see.

Cheers
Bertrand

>=20
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>=20
> ---
> v4->v5:
> * add locking
>=20
> v3->v4:
> * patch introduced
> ---
> xen/arch/arm/gic-vgic.c |  2 ++
> xen/arch/arm/irq.c      |  9 +++++++--
> xen/arch/arm/vgic.c     | 14 ++++++++++++--
> 3 files changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> index ea48c5375a..5253caf002 100644
> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -232,7 +232,9 @@ static void gic_update_one_lr(struct vcpu *v, int i)
>             if ( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
>             {
>                 struct vcpu *v_target =3D vgic_get_target_vcpu(v, irq);
> +                spin_lock(&p->desc->lock);
>                 irq_set_affinity(p->desc, cpumask_of(v_target->processor)=
);
> +                spin_unlock(&p->desc->lock);
>                 clear_bit(GIC_IRQ_GUEST_MIGRATING, &p->status);
>             }
>         }
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 73e58a5108..7204bc2b68 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -216,10 +216,15 @@ static inline struct domain *irq_get_domain(struct =
irq_desc *desc)
>     return irq_get_guest_info(desc)->d;
> }
>=20
> +/* Must be called with desc->lock held */
> void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
> {
> -    if ( desc !=3D NULL )
> -        desc->handler->set_affinity(desc, mask);
> +    if ( desc =3D=3D NULL )
> +        return;
> +
> +    ASSERT(spin_is_locked(&desc->lock));
> +    cpumask_copy(desc->affinity, mask);
> +    desc->handler->set_affinity(desc, mask);
> }
>=20
> int request_irq(unsigned int irq, unsigned int irqflags,
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 6647071ad4..c59f6873db 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -445,7 +445,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *=
new, unsigned int irq)
>=20
>     if ( list_empty(&p->inflight) )
>     {
> +        spin_lock(&p->desc->lock);
>         irq_set_affinity(p->desc, cpumask_of(new->processor));
> +        spin_unlock(&p->desc->lock);
>         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
>         return true;
>     }
> @@ -453,7 +455,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *=
new, unsigned int irq)
>     if ( !list_empty(&p->lr_queue) )
>     {
>         vgic_remove_irq_from_queues(old, p);
> +        spin_lock(&p->desc->lock);
>         irq_set_affinity(p->desc, cpumask_of(new->processor));
> +        spin_unlock(&p->desc->lock);
>         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
>         vgic_inject_irq(new->domain, new, irq, true);
>         return true;
> @@ -473,6 +477,7 @@ void arch_move_irqs(struct vcpu *v)
>     struct domain *d =3D v->domain;
>     struct pending_irq *p;
>     struct vcpu *v_target;
> +    unsigned long flags;
>     int i;
>=20
>     /*
> @@ -494,7 +499,13 @@ void arch_move_irqs(struct vcpu *v)
>         p =3D irq_to_pending(v_target, virq);
>=20
>         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->=
status) )
> +        {
> +            if ( !p->desc )
> +                continue;
> +            spin_lock_irqsave(&p->desc->lock, flags);
>             irq_set_affinity(p->desc, cpu_mask);
> +            spin_unlock_irqrestore(&p->desc->lock, flags);
> +        }
>     }
> }
>=20
> @@ -574,8 +585,8 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, uns=
igned int n)
>         spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
>         if ( p->desc !=3D NULL )
>         {
> -            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
>             spin_lock_irqsave(&p->desc->lock, flags);
> +            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
>             /*
>              * The irq cannot be a PPI, we only support delivery of SPIs
>              * to guests.
> @@ -944,4 +955,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v,=
 unsigned int rank, uint32_
>  * indent-tabs-mode: nil
>  * End:
>  */
> -
> --=20
> 2.51.2


