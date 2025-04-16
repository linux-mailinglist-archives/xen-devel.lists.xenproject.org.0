Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B11A9095B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 18:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956464.1349874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u55xu-0006Hh-JC; Wed, 16 Apr 2025 16:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956464.1349874; Wed, 16 Apr 2025 16:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u55xu-0006EX-Fa; Wed, 16 Apr 2025 16:50:22 +0000
Received: by outflank-mailman (input) for mailman id 956464;
 Wed, 16 Apr 2025 16:50:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsD+=XC=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1u55xs-0006ER-Pt
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 16:50:20 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2606::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e14d7b52-1ae2-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 18:50:19 +0200 (CEST)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AS8PR03MB9416.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 16:50:16 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 16:50:15 +0000
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
X-Inumbo-ID: e14d7b52-1ae2-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0tPZThCZewHh7QVTp20jpOonR54yN/EtdSqWwQxYKeHcnRWUOkBjzFkMTEyoHEcNKS0cH7K9k7wLhaZd1TQXTKvnVjjxIRQwB/p7KJYCJA+edI/xnFUZZQpSPaKsVAIhqIGVkF/ZY9we4wOqKRoukAs52lrfrLNINinZDotnFqp6ACRsD6LohFm1X2xrJEjXdvsGCml1k86r4Ls1kT2Z84+SdWytey34jz+zqms2kfs/wmX1H4xBLScBtloS/U9vU/U/bSxMzdW9bl5qGfu4RV++Uqvh0yhNMW3A14aMLI2r0Yn8KOCbXt3Jzvt+H1ZeLVcZLYoib/2cgseqjg9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQiuKA+zddsVl/h5lOfnW7qtl1lldnQeW9ZSeD8NWFg=;
 b=hgvkaRN2SAsLAHmQdBSrrf5nUMhP3JOy5EhC43/nbDRQZI5JEtaPfKioGzG7DbNPD3HC3MLChyoBMT0YF61yu0lhuMxbsla93P6zh6aM0hPaCUhsOOS5dfRCvDCoE/2uRZUpFA8BiQS/Ve61smYe0KrjyOxJHxyQGWuy7tnCkja5wa8mwCYEkFxhU+jh7TQ93/8Ez3wSapUrxQkKFw3VMsNf21bLxbg51ltiJGhB9Zazssf5JH1M5HsEphiRC1ivQm+ajWhM2tVi+fK67ahDjSuSshCylruYCbWFQh6V53fJ8KbeFMe8zyKNd4nHhiL/QvFamK/VGfQPSBrx8ggOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQiuKA+zddsVl/h5lOfnW7qtl1lldnQeW9ZSeD8NWFg=;
 b=qH3uWC6nNskHfMUh0aug2mVn8Hpi9Y+Lu+abfI0wLlDAaeWiTKp7j9FOhM7iqG4ydF7x2Qn5JHFSH6ponrYrlsXQdtVQKS3jbS/NUEPSZOvFzfHPcEVjJEg0kQ6ExYNlCEc2eA79zkRmKqSb0oEFNdWAqdiCzE7McrKhL+79QiqRriBV51Yt44yJ+OXsRI9Pm5JUSAuiKkk/zqkGa2+ba0GJTxxuOhx6MQ552ssGsDgfuf/Wcej8bj1VDtuOwRz0orDD5m3ey2vsaBIdQbnVpspI1VsaOG1fFfcFMoSYNclV/EqajTSGnYiou/BulQnjoik+z7i4qsiOqBQnJ8wW/A==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Alejandro Vallejo
	<agarciav@amd.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [ImageBuilder v2] uboot-script-gen: fix arm64 xen u-boot image
 generation
Thread-Topic: [ImageBuilder v2] uboot-script-gen: fix arm64 xen u-boot image
 generation
Thread-Index: AQHbru+gjQsTQ/HM4kWWIbbQtHW9Sg==
Date: Wed, 16 Apr 2025 16:50:15 +0000
Message-ID: <20250416165014.2263305-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AS8PR03MB9416:EE_
x-ms-office365-filtering-correlation-id: 9f5433e2-760c-420e-d939-08dd7d06c367
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CUrqIjYwh1q8GR4DtepAA0gBhKsJmN6O2WuEluvNQ/hSI8YTm/D7fPY8be?=
 =?iso-8859-1?Q?D5g7KvJVxkeTNbVwr25rOlEWg8+VumLvj36rY7Xz4jcbJXjquO2wGQkw+P?=
 =?iso-8859-1?Q?1yjlJz70q0dX7l+vowUzx7NeALuNSRSHBLIBZITx0+FRwNk74VXfKarpKH?=
 =?iso-8859-1?Q?FwSn6DyBR+WVgBezzUkS2LTsBry78A0n3f/bAqn85IYhe04o5RNCkEx82m?=
 =?iso-8859-1?Q?1EKtLUyuRnKn05vDa9dpk8P0ei5NvFuiGtATtyvvWJaHA5a6TkLKYkOnpN?=
 =?iso-8859-1?Q?42pTkPF1p2a0qDDV+oxmzEDt2DhZIMZjPwUAJo0mNJRo8CoB57uEUxlWJR?=
 =?iso-8859-1?Q?2WQtJLLZilc0JdQ0Ff9AHN7tPn1Vbao0awKVLMEoh0X9sz94lHVT0x+V3J?=
 =?iso-8859-1?Q?GtslbidXbFh9ip18VqgG//1XEnX//ol7RSlrRZssSCTmZPyQHdVS40SiaZ?=
 =?iso-8859-1?Q?/VF1v9wF/ZPuy6tf0Isz7BQgq3/dg1rkJR8Fz35NAWX/8dDuiwQmMaaeR4?=
 =?iso-8859-1?Q?W3i1Vs62hFYmKoB0kyJxa/Zeib+b7tcTmPcof+GqFNFqZEBTCXSkWF+dOQ?=
 =?iso-8859-1?Q?1sSQyW50oKrYYiCN3VpgGak+uPl3j/hu5nzwAQB9a9F4AfAobcHYBjNbhZ?=
 =?iso-8859-1?Q?VA3/LB+Col9nmYG5rBnZyi9zumDSFa0YpgwZIrY11sUMvxgjilp47W3IZc?=
 =?iso-8859-1?Q?54xHAR8V7FlkprkceJb0hqpiXdHp4pRDANIdeGjPDvAFUygdXGhumcMgC8?=
 =?iso-8859-1?Q?fw4xWOUddIxcPFZKBiKP56VZInJt+BZcnW9bf1r4mutXywfTqRhQQsAbhD?=
 =?iso-8859-1?Q?kaBKi38EGzV/78j2CGMY4NNta7Ra7e4pkVy3BlDej4jrBtJRqE+n2Joxn3?=
 =?iso-8859-1?Q?H2NG+qdAdBawrK7LrBo6C10sR9Koxe9orQVBV9ybikZYKvbWFQxEFCcm4S?=
 =?iso-8859-1?Q?8dKAponpAMC7rc2PPUM7DebzUfWsZvWYAZ+koeuxU2JCrBm4dRioXV66Vd?=
 =?iso-8859-1?Q?PC9TU30jXVvJM4uXnQ6H9P/Y+q2VXBPxypaNR9bQS7iBU/0kMGJn9cMRLP?=
 =?iso-8859-1?Q?eQUcfyc43jYMq2a667UiXcbj1jQ2ORAT4XjnpjMoqjj5ExlRoKJZxtlpJr?=
 =?iso-8859-1?Q?+15GrO4ATcRRnPuovUWPJstHN2Wq+ZwLn3Sca9JkW5Y7Pt0/726/EE9cQb?=
 =?iso-8859-1?Q?RO7ZPt9JB0nKYOIIBqbg7GaJ1n+jg87Rln35eN1sC+0cK+Cs+KAlwZMwls?=
 =?iso-8859-1?Q?8d925ze0Fz9yd4XV0s+i5kyZs/pPSDtWft7jAh9MUj113zLYxggzkpqHoP?=
 =?iso-8859-1?Q?AMvHnlJgdE8Y5ZLBZyr3te2aILC8qAbKeTnaRcOotDuwBlbE4W19OFfWsC?=
 =?iso-8859-1?Q?wRA1MI9YH5bbUU4YQPYWpfKOTb7TtXg8dGJMaQxEfG8u/WPNVn0a2KUbXW?=
 =?iso-8859-1?Q?w0lTb+ajfgf5CwMMo+g4c/WenhyK66pylMMarKwakEyH7VX1s+UeiwWaBo?=
 =?iso-8859-1?Q?5kViZ1uVLcHHx/6bbU4c6tM+s9HwSo/ckZ0RV+K4GFtA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IFPs26AnGmMKv5+k3u4C0jsRRjNi6dDH9MovHcUIQeGgO5M3oSvm0iCddd?=
 =?iso-8859-1?Q?Ia4CKT5+Z7O/fkOlf+rIac5puLafmTPfz2deHM689K+BMWWukh0WJiTF1M?=
 =?iso-8859-1?Q?4P9OoG/bAgx42sPDGjnryIxDenkPIxOshQ1gfKFlBTJUG4Ihd7k4FRKl1l?=
 =?iso-8859-1?Q?8DC8XZlxHqtG1RH/AAVeCPMnjSJst2JqqmT/zNNA8JyqCrvPa8AijwmVsW?=
 =?iso-8859-1?Q?ghU5Eg2lAa3oAper9CnQM2ZS1hwQurz29AUlVUSJnCZd0SeUHDkVVdK+t6?=
 =?iso-8859-1?Q?9FIsZXjRr0Jk0NJNnOobIV9breX1+Yh/nKCQJoii4NY56IxirwPtvcpNxc?=
 =?iso-8859-1?Q?vO03nFeEkX3NAA7TnNVkoAk/PYYGrEcT96JptLtsPE55JkpFs5ITEcOVng?=
 =?iso-8859-1?Q?TbGTHYWXHsI4DPCTuson4t7sOBA6FapPGsb0sv5DynvcIasAKfDEqp4hcf?=
 =?iso-8859-1?Q?AdW4PF2MXIKEgfuS3i3pBIpG4Tf+4QVGCBRcS6MqK0xSmix4OnphtaUAIe?=
 =?iso-8859-1?Q?LpgOOD0gXZwchMwDoDsOdIcZz6UvW6ASVvKpSHm0sWLYh+Pgee5H2k0KLs?=
 =?iso-8859-1?Q?DShNiIPfleZfvsYI/vd2BY4ge+6vN+cO4f5N2YsiIwQQKJ0t5YFA3b2oC5?=
 =?iso-8859-1?Q?cVZ+qVYVcXpA/qsKwg9FGyQT6J5T//ZIIL0P9hlmHtPhs+AuzEnjbyWmDR?=
 =?iso-8859-1?Q?yThoedKykN0T+dbQtEb6lOGMa/7dL3FupM1WSDHeT9CEP2CoMEvDEKpav3?=
 =?iso-8859-1?Q?V43LH6gKpuHM4btx+JasncAFChb/JWUw+JObinNPbYe1Nzq7TXlnWY3s/c?=
 =?iso-8859-1?Q?KJMQGXDe/OCbGoEAy+cI33rVJ1wvt+uiM4pOlIpiKvJkFFdr8+vbWUICwG?=
 =?iso-8859-1?Q?vQS8qcOovTJuWL+61Knff3+gyTk+zCFbuCxuu/w4vq/TmD0SNjPdZpgt0L?=
 =?iso-8859-1?Q?90LV0900rIEu9dE2pZ8lWerR9RrQHRibm71+Cz+yBoRbv8mpFrTPz5Srpq?=
 =?iso-8859-1?Q?qchKuiK+N2tvCoDFfdu1eBGODqO+8RLBsmSG9q/UaVKB/pEGUQM301z/yw?=
 =?iso-8859-1?Q?Oh3Fbsv19ZZsCqHOpuWmuHMp09PekOyZ2PM0EFqwUKsAM5FYEfXAghP+l9?=
 =?iso-8859-1?Q?+Q9bmXWsvixP+QtPAHvN7CfE+AtFbILvaI3Q4I6iV7syztT1hHARl0eiWL?=
 =?iso-8859-1?Q?WEtXZl1Gg2pSXxOOj9AJpDRdzB2spMZooIaVIyfjJW1AJXxZtKFE7/zjlJ?=
 =?iso-8859-1?Q?q9zdBL04Ji2ZWKZU1G1AM5oAhGkrred4h0FlzoZ78VpHFQrbCGAeCJ3CED?=
 =?iso-8859-1?Q?b2cM/K8sE46MUcTxeiTKe5f4eA5yI60Jty5bd2BLpRRMTiUzNWaMqsjuJp?=
 =?iso-8859-1?Q?ajjKh/fdVUODnXUdU8NeywLL0LKc1ognBNStzJ3NI7iMzA+/OGsAPeyNeH?=
 =?iso-8859-1?Q?bJ2TXaKv8onzgEU12rjuESaL0+dNE+AGfj/2PzY3f4ImhnT5KRSQCUsSsb?=
 =?iso-8859-1?Q?G/tHu8RhMzQMnyKUTjFyQNfiO1IhzPPRMLTPYBkKnvNeJjTZX26Aph9QPO?=
 =?iso-8859-1?Q?Qvr+z701DI/7492lCDGqRteY6FJDPdTT0bjmEgabPpsecBMfWRi4vYGT5T?=
 =?iso-8859-1?Q?O6DMx7JwM6uUj8vMMVUW/KEkEr7MRqsCKL9Xw672lRPfFmAXqebRTPtg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5433e2-760c-420e-d939-08dd7d06c367
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 16:50:15.7516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Hr3yn2dEYRU1e0YBQMU0fb2xYnNt1dv9i8R5eZeBSz9xxGOKWAKtOL3S7YNb9ObmOZCrvB7pPJQ4HoGz9um6UrRmuJMGDiX4ODpHFhRsIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9416

From: Grygorii Strashko <grygorii_strashko@epam.com>

The current code in generate_uboot_images() does not detect arm64 properly
and always generates ARM u-boot image, because below command
 file -L $XEN
returns string which may contain "Aarch64" or "ARM64", and, in the later
case, the current code will mistakenly identify Xen binary as "ARM".
This causes Xen boot issues.

Fix it by searching for "ARM64|Aarch64" for AArch64 binary detection.

- mkimage -l xen.ub
Before:
 Image Type:   ARM Linux Kernel Image (uncompressed)

After:
 Image Type:   AArch64 Linux Kernel Image (uncompressed)

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- check for "Aarch64" in addition to "ARM64"

 scripts/uboot-script-gen | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 527b70dfdc4b..f3ca787e557f 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -824,13 +824,13 @@ function linux_config()
=20
 generate_uboot_images()
 {
-    local arch=3D$(file -L $XEN | grep "ARM")
+    local arch=3D$(file -L $XEN | grep -E 'ARM64|Aarch64')
=20
     if test "$arch"
     then
-        arch=3Darm
-    else
         arch=3Darm64
+    else
+        arch=3Darm
     fi
=20
     mkimage -A $arch -T kernel -C none -a $memaddr -e $memaddr -d $XEN "$X=
EN".ub
--=20
2.34.1

