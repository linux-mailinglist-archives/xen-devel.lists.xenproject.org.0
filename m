Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93DCCC67F1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 09:13:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188639.1509760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVmeb-0000wc-J1; Wed, 17 Dec 2025 08:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188639.1509760; Wed, 17 Dec 2025 08:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVmeb-0000uS-FR; Wed, 17 Dec 2025 08:13:01 +0000
Received: by outflank-mailman (input) for mailman id 1188639;
 Wed, 17 Dec 2025 08:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YwQE=6X=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vVmeZ-0000uM-PR
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 08:12:59 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 311d9515-db20-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 09:12:56 +0100 (CET)
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by DU0PR03MB8503.eurprd03.prod.outlook.com
 (2603:10a6:10:3cb::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 08:12:48 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 08:12:48 +0000
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
X-Inumbo-ID: 311d9515-db20-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPcbSsc4/zja9pDiJ2RsgrhG+/VMPnCohkRUEcPgUtY3tswbhRfIN3cEDTqRnxPbdrfvqEwXB5WoUHSammqZcOSsSUNgY4F84qqXn1ZJuH1xvbO4zOS53Kxa2z65kfOQ1GM1mkK7vGqx2OnmIU4sJS71slynpK5U5itO9NKwx8PT/wrTlcZcpp88UmiyqxI9lsRg85qKN5A41pVJ112n/baAjAudwEZ0peYI/0VoKqPeiBydzRRMTwaYGUQV8o0GtroWL7xkdufDoHc5ZbQ04pkPUAyGfJlMM43r6C0eneREx++VskLMdm1d05rPz/5+fgMpcUau5Jg1AYPpfFB6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMVinWg5r3AnR6+dx2+ZekcLG5meFNv7AMM1z0Ws95Q=;
 b=Rs4PLsq9SOw+TH92CxUqh6WggKGBvPKLEQTAYZxhYtP8omAdu55cUIZ0kMGXGyHh3HkzDP7fkGEGsRkBDDenF+nAhdWvOMg++yqjUISpcR4smaWIeuXdbEmXQ3XZYKjdtKMRfm/C9+prDQXbayzT3PlOMG/KN6BLZ/c8+SIuYQQ1cAT6H00WUvzSc1UIqk1A5XgYY2W0PuxNyxrArJ7pMKnitZHYYcY6w6BghBp/jpKt8pb4mfNTHQ7nNkIWwBVU4o0S+OSbjjn2Pl/jbmPrtzjzp9oXcGUP/lNpXRDe/vgUI0TAFtdk8Un0v7JKxqOc+7yp52+vpZ7/BF3CTDg7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMVinWg5r3AnR6+dx2+ZekcLG5meFNv7AMM1z0Ws95Q=;
 b=Kc4b0Q3yE8quhYV0EM00kL+IdZldRR+0hZEYQZsSsD+Sv2JGvyo895cCQm9LcWcKxCiNLetnLhTmDxeTjd3bgDK5Lh3QjKEGpELkfuJux5+7EeKq8mm7qGycSBrvjLKtPaicGY4JAjY2BU1VGwy2I09nnjiU7wZA4GEMx0HpPBz87gJy3lW1pBO4B/ZoUSxfKYZzXXH/NR4ljDBYm4ATzvnVeI6H/mLf3R0mwLuIUGpFOtFUARkhWxeSDF8+Bs0LUvT5Eb3xxC0thyFmo83KDJCKqOkkXpu5u315yNTBmGjIgFLmNbFaQCSEZLOiv/CHpyfNFXyGqNWAug1as+dQAQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Grygorii Strashko <grygorii_strashko@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Harry Ramsey
	<harry.ramsey@arm.com>
Subject: [PATCH V3] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Topic: [PATCH V3] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Index: AQHcbyzuH15G1NdORkmDpo6kbgtlKw==
Date: Wed, 17 Dec 2025 08:12:48 +0000
Message-ID: <20251217081248.2807849-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|DU0PR03MB8503:EE_
x-ms-office365-filtering-correlation-id: eb679db8-65fb-43c4-47ca-08de3d441139
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?DksKO9QCjvFvtEZtIm2MVxwGi4bmwIbBsKOpDIYiKuUQMUXUlkAyl51Cj0?=
 =?iso-8859-1?Q?DVUapuIVlZNqxJKEmeIRkwFDLh5fjNQTeaV4bJZry3J2Q/+tkQ2s7/F49Y?=
 =?iso-8859-1?Q?1tYAL48aM2u350flzdbKlujwXbaIHkEeyfl+N3NVDuNK93VMg0kKM8hm8G?=
 =?iso-8859-1?Q?by0dwKkU1JSvjcq+nqK/Dkq6xriRrO4y3+FB08uOwpvq19QUfCpbkIsOem?=
 =?iso-8859-1?Q?hq3Zn5rAs5pGUKJbJ/WBnhMH0WiCtzWm1VX/1xfVujc1pKLyav8ZrUmWMK?=
 =?iso-8859-1?Q?itxWtHYFjPwUYHHRuTt9UMlSVXrDg6e0W6HPoYd7SBryFY3eVB1zL1w9g7?=
 =?iso-8859-1?Q?6t47B1wBtIx07ZBJ/NFcBcfT8WdkIak1cZccgKKxhchjktpw2b1K+90rVj?=
 =?iso-8859-1?Q?FCOCP6FXVO9GRmVvWyTmMcTFzILAWLIi1Oi7JOo3hBXhZSjrvMa6W+rbGn?=
 =?iso-8859-1?Q?pGiG/AzT5yT6e+7GgKWoaj9MrFFID3f+zk/Y90YPyAxZNbRP3ZILpGwa5n?=
 =?iso-8859-1?Q?gI0A/CfK4B+DR8InGxp0urgkEEOlvJAcV/5pVYR5IntUMHWkoe5IMITLMw?=
 =?iso-8859-1?Q?mJEwj3wkLragf7o6wa4oIrBkcBBc5CjtWqDWmYZo0M6ddLR8ogqKcZD1mf?=
 =?iso-8859-1?Q?zJUPSVb+fSoyLqNjFLxZ4/UYGRvCdi1Q4knEoYfRIxOCqlIcb4u1eZgorm?=
 =?iso-8859-1?Q?Agddda56y4uO2c/Zc67Qm2JcsE5AdldCA/AfF/R5JGDzucoS20TwBN8Y3C?=
 =?iso-8859-1?Q?dTDkXAXryGccbdSxUe0VEt1FVY7L1oLMwm0ayzGXQ2WNYRuTb7UeOuoqki?=
 =?iso-8859-1?Q?MYqg7RTlmeQtGT3C6cggm9cus0YCwBnHPgd34bSfH526qIpB/DUy0fI7vz?=
 =?iso-8859-1?Q?+210guEVpyxbLiNZYGS1LipA/PVDd9p9OF3MIggP3a/JAarukdykDjompN?=
 =?iso-8859-1?Q?jzsDM0xQVsd0sRS7LmekBIz8HGG+BsTVgLTgb+U6SolqG0S6ShjDoo9We3?=
 =?iso-8859-1?Q?OiS3RjybnQeznoW4PtGiwc7Cwwy7i145K/Z5O5s75kSKSNRvO9JfH5pWvb?=
 =?iso-8859-1?Q?YLDHKRLpV+wJoPn0HJLQmqsj+jErNaWNpOVBYxjCeLLJ0hZkUJT9A/9gb5?=
 =?iso-8859-1?Q?IZRBAEuZ5V6oH0P/AwRlx3GLNNBlDjjQuZFINrTDeSJg7KvVSCw3vs+xvc?=
 =?iso-8859-1?Q?1h1lkhM78lObCc6n+cVI+4rtMM6UGrK7KKRr/6WPfVbi5pTd/v0MKKjok7?=
 =?iso-8859-1?Q?hHXrw32HpMjvwWn3oJvKXMbdKupuEoW7yONV/aIi+IEWkox/Dbu8dCdJJ7?=
 =?iso-8859-1?Q?24DdPyk4z8Ov0HUGqDk9UMdoalWLVTnivgLWrDFnaIfo1m/3/ZZYpxX/Sk?=
 =?iso-8859-1?Q?nvn+EJwgxoyP9TZQDlUz+xnW9GvBprJzhqjcb/l6Pxhy2ua3ickA1kUTll?=
 =?iso-8859-1?Q?DHJjPLTcQtY5E44e9US02a7vHhG5DFBp7/v4bERTIwPariSGowgi1P1cPZ?=
 =?iso-8859-1?Q?QZZu6xRNPiXv5Ywf/OUtUQP0OGOk//7KRHWMqFqewaBA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0pYRjhkH1YbjQICDT7MQfK8dLuIU9T5unyox40Q7yDQgN2UzoNq5HLpDao?=
 =?iso-8859-1?Q?ZcjLBZrwcoCypZly82PjboE3zHrFrKjvtQzJ8UyDr18RrC6NHTDRAxubkB?=
 =?iso-8859-1?Q?ynrkg6z6GLZqDJ2u4IjgXJUPk8LtuO+y4ZR8Oya0v0fA5X3SaLhIkweE6Y?=
 =?iso-8859-1?Q?S9tyZxCz4hJrrp0xltpjCyMMASWdjQM1AsyTkf3umYU/cmGQRVSbmoH2eI?=
 =?iso-8859-1?Q?Clt4npXOyZ3qVc9Tujths12RJh7Nw7LZzn4p21jQvxT1w67xgHc0tHoBMY?=
 =?iso-8859-1?Q?3jc/dszTy+EwV8jAcA5r9HmddBpEXfslYYGZvCid2tLMyS1oksOQbVbIbn?=
 =?iso-8859-1?Q?x7t78i50gEXFL+v6ok5vGSJJSUBuca6v7I3w0Xmshj8MMTh7d1rFHF1vC6?=
 =?iso-8859-1?Q?bn/WaUt6rm93ikqed/45VYP69GBz/5uIYR2UonPjMXoWwRglPka4wucvlq?=
 =?iso-8859-1?Q?NXonyn1TdKOinsOyeJQBp8QR3IFpBPaaqoSf4gR2OXdpdZztQDcKlOHGK5?=
 =?iso-8859-1?Q?L1DPnfbIID8HUG8kCi7uVFbMLEh6NdaFkPR0J6EN4Sw9rkLcer5fr9l4oD?=
 =?iso-8859-1?Q?+qSadl8JcjY5IHWdx/o55vGWmNjCWUVufZX9wsC71fGwwyBjgpIxWS1K+j?=
 =?iso-8859-1?Q?oCxYOkKEMstAl7R/NO56lWfPV8522/7g/vE6rnkA2ASjFTUC0LSoIuoX6H?=
 =?iso-8859-1?Q?F/9io+kZld8gclP0P5Ve2/T/u89z+t90w8Qg+b9pfigAQhi7PRXECa3qKx?=
 =?iso-8859-1?Q?8otgK7OBjEGmgp9FInJUB1woOfAV03SITxT6YgpUmBqb03sAk/vis2kdJl?=
 =?iso-8859-1?Q?rR4jypJzJkLF4ju0RGOAg3T5DzFQqIN4vUB2Vjegk7KYpnFJYrnfbkpIwB?=
 =?iso-8859-1?Q?T5DctXeOQKCnEiZ9VqgpcwiuwauJrsB8I8sIyFbOp+YEZmoiuMGvxe7mak?=
 =?iso-8859-1?Q?TqXXPCjMfCnjxlBVxNIUegYnscMFPT/tbPVD2/2K0Ce01ARaKHSHMpK6Kn?=
 =?iso-8859-1?Q?nHcLFmfPj3xuqrinP2mGjdT2GIzMyjXOgydI36aYJXjDjvYeoIAnecfptV?=
 =?iso-8859-1?Q?byuAiLOqmyL4L+OMpxrtY5Mk2c7P9IOJWA131xehNOuOEpkSGhaV6mGxdu?=
 =?iso-8859-1?Q?uvjBHmAzxcY40MBtkUsqLHsmZu5FRCG2SqEH2eyECK5xTxrj4FerN8Yolt?=
 =?iso-8859-1?Q?+atKPRHmhUHFzm7O7CXTuNEAn9buLKBCVTLfOwBTqhTrzsGDlqR68q0oBe?=
 =?iso-8859-1?Q?08PC+k9KjeWymY1guL40Q1TtV+mjwq/iP8LmUzjwfyHC+OlBwUNYGxiFVq?=
 =?iso-8859-1?Q?yLXO/LO3ZnS3Ac3OO32jyP2wsL+t7hiwDRCEjBS/gQ/JbjyNL0bjEk7/Bb?=
 =?iso-8859-1?Q?FkyN5FIOLtykyPnbYicYHtUM8N2Bun4NsbzX2sfwnvg/GNCqv6iWC7Q6Dg?=
 =?iso-8859-1?Q?X0OJ0tX3Ek395Jz6ZQ+EUREx0pwRWYhiRKf0HpmIFDQshQQ4ZzdMKDLEYL?=
 =?iso-8859-1?Q?JBVyM7HS+99gIgZfFU32fcKMFfoHgbEgODJBGs5s3UPNYu2FaIe2pI0Nhj?=
 =?iso-8859-1?Q?ejpS0q9LQTskfeQMhaBlAFWnqDOCfwq67U+l7U2sLKGm87x73x+P/R4xBd?=
 =?iso-8859-1?Q?DhWZggpHK3DLP+21xQbnSvPBMVGq9brEq67D6GAa+6JaEc/VvmR6G96rPz?=
 =?iso-8859-1?Q?qATkpOGoL7GqScLXqEs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb679db8-65fb-43c4-47ca-08de3d441139
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 08:12:48.9169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pu5u8cXxGBUT/y5Kt3JwhDD3XnhUbu4/oEmfbsE4pkySNdH1fqyP91iyunXpBj8I6ERVupKDty4TjnyelhRsCyM0ttomI1Kk3bHfFKh2Xeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8503

Creating a dom0less guest with a high vCPU count (e.g., >32) fails
because the fixed 4KiB device tree buffer (DOMU_DTB_SIZE) overflows
during creation.

The FDT nodes for each vCPU are the primary consumer of space,
and the previous fixed-size buffer was insufficient.

This patch replaces the fixed size with a formula that calculates
the required buffer size based on a fixed baseline plus a scalable
portion for each potential vCPU up to the MAX_VIRT_CPUS limit.

Please note, the change to DOMU_DTB_SIZE formula would result in
a smaller buffer size of 3072 bytes compared to the original 4096 bytes
on Arm32 platforms where MAX_VIRT_CPUS is 8.

***

The following tests were done to confirm that the proposed formula
fits:

1. Arm64 testing with varying vCPU counts (MAX_VIRT_CPUS=3D128),
   final compacted FDT size:

   - 1 vCPU: 1586 bytes (with 18432 byte buffer)
   - 2 vCPUs: 1698 bytes
   - 32 vCPUs: 5058 bytes
   - 128 vCPUs: 15810 bytes

2. Arm64 testing with simulated Arm32 conditions (MAX_VIRT_CPUS=3D8),
   final compacted FDT size:

   - 1 vCPU: 1586 bytes (with 3072 byte buffer)
   - 8 vCPUs: 2370 bytes

3. Arm32 testing (MAX_VIRT_CPUS=3D8),
   final compacted FDT size:

   - 8 vCPUs: 1127 bytes (with 3072 byte buffer)

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Tested-by: Harry Ramsey <harry.ramsey@arm.com>
---
V1: https://patchew.org/Xen/20251202193246.3357821-1-oleksandr._5Ftyshchenk=
o@epam.com/
V2: https://patchew.org/Xen/20251203185817.3722903-1-oleksandr._5Ftyshchenk=
o@epam.com/

  V2:
   - update commit subj/desc
   - use a formula that accounts MAX_VIRT_CPUS
   - add BUILD_BUG_ON

  V3:
   - add R-b and T-b
   - add more info to commmit desc
---
---
 xen/common/device-tree/dom0less-build.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 2600350a3c..0c271d4ca3 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -439,15 +439,25 @@ static int __init domain_handle_dtb_boot_module(struc=
t domain *d,
=20
 /*
  * The max size for DT is 2MB. However, the generated DT is small (not inc=
luding
- * domU passthrough DT nodes whose size we account separately), 4KB are en=
ough
- * for now, but we might have to increase it in the future.
+ * domU passthrough DT nodes whose size we account separately). The size i=
s
+ * calculated from a fixed baseline plus a scalable portion for each poten=
tial
+ * vCPU node up to the system limit (MAX_VIRT_CPUS), as the vCPU nodes are
+ * the primary consumer of space.
+ *
+ * The baseline of 2KiB is a safe buffer for all non-vCPU FDT content.
+ * Empirical testing with the maximum number of other device tree nodes sh=
ows
+ * a final compacted base size of ~1.5KiB. The 128 bytes per vCPU is deriv=
ed
+ * from a worst-case analysis of the FDT construction-time size for a sing=
le
+ * vCPU node.
  */
-#define DOMU_DTB_SIZE 4096
+#define DOMU_DTB_SIZE (2048 + (MAX_VIRT_CPUS * 128))
 static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *k=
info)
 {
     int addrcells, sizecells;
     int ret, fdt_size =3D DOMU_DTB_SIZE;
=20
+    BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
+
     kinfo->phandle_intc =3D GUEST_PHANDLE_GIC;
=20
 #ifdef CONFIG_GRANT_TABLE
--=20
2.34.1

