Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE0C699E7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164701.1491618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsw-0004tI-0e; Tue, 18 Nov 2025 13:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164701.1491618; Tue, 18 Nov 2025 13:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsv-0004qy-Sn; Tue, 18 Nov 2025 13:36:41 +0000
Received: by outflank-mailman (input) for mailman id 1164701;
 Tue, 18 Nov 2025 13:36:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ey2=52=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vLLst-0004PV-Vn
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:36:39 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99ed07c6-c483-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 14:36:35 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM9PR03MB7217.eurprd03.prod.outlook.com
 (2603:10a6:20b:26d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 13:36:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 13:36:33 +0000
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
X-Inumbo-ID: 99ed07c6-c483-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kENiPLSTa3E9uqrp1UWAOoBLPwGrXyQsmWNqHiccGolIxUp+byS3II0XMzaGuD4Dj8ifPN3+L5dAye4Z8hyQe2FkxjYTebdgg9khOQCZJ6Km8PH2pN9FTRO3vKSdim0cn9SG5BiFqc3mhT19341ar4k8opa/e/OPDcHzChcEY6Zf1SACEaOcpott2uf8nla07VSW3faun3mKAUfKgLBRJKLo3m1z1AAL/kj6mPW+YdCgGgH5hxTZnJQChA2w8kvIzlgVv8jMzEo2jGlcPq7lA4hcDodx/LHhY4MGpqQYbw0SyXwQq4eKZookWrbfZo2qmiYgLV2ZYhrSDCwy281B9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vRvEsWL7V7SfwuRrWI4RoI5phHznft2v1SB3Ac0yZo=;
 b=KW+4LQL+q1j+/OjdHWEwVFaDvsoblvgkPkztW9lHUgQWzkEEHDhK00fGS74KhdmkooYHKssKUUVAES+aDpYw4CZPOOQ/y1dcUR0Mef8b3sTNFdaVKQ8HA7ugUqq6pKhwOESnLhv0Yp3dMpoMEfemYiSdTa8xPe/JM87KmXoOMU9jPGMLRW7BX+ZnH5oeo+c9HhE7sN2EAlOq0LCgn0e39ZwjD5gnlC+jzcN+kyDIvoiKiX/xz+Egb1eZZIpD0WPulT2DvOo5n62RzTLN8S7aF1bqcPeXqqsCVK7n0xwFWYZt8es8aym/Nu6IC1XClJNiNykNN8nBOUyWJUmqbcEE6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vRvEsWL7V7SfwuRrWI4RoI5phHznft2v1SB3Ac0yZo=;
 b=Qrx4I5fjhHs6dQM5Gf+cOCFzrvJNX8P2gwmmA6bIwrBhvS6s729+0MX/0pwsszUggmbawuEBsxhdz+6IwW20gaRWbAKMoFpfXoYhp73sH7pv8eaaZGsXgsVMBdIGgNLXHNTZmOR9w19DVcVHXmS2jN1bfVGaMnceEUxUhaYKmISjryJlQ1wi0DhKCqtNkD1biCh4dKIXpLzrBzoPVktXbzimpNQANKqqdeD0icXu/CBgehINHg6IZ+2FZmbiU1MTc6hB/PUpOuW0EEFjXHYY3sNfLUgISGBohj5g6A3wKfj9SQWqKCTjQkLgr4lgIp0CUpeYG+UwhWCIC1yxDewADA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Edward Pickup <Edward.Pickup@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v3 1/8] arm/pci: Add pci-scan boot argument
Thread-Topic: [PATCH v3 1/8] arm/pci: Add pci-scan boot argument
Thread-Index: AQHcWJBa0sfFMet/uEihbNa8Xr70/w==
Date: Tue, 18 Nov 2025 13:36:32 +0000
Message-ID:
 <a48e23aabba4a0a718be5046218e52f6c69f8c4a.1763462211.git.mykyta_poturai@epam.com>
References: <cover.1763462211.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1763462211.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM9PR03MB7217:EE_
x-ms-office365-filtering-correlation-id: 95ad61a9-7623-49f2-a451-08de26a77cee
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4PspFay2F7E93wGxuc2TfA6ZsyhSEgl3LKOeZOuqdKwyDUYoc4XOG+4KLw?=
 =?iso-8859-1?Q?SqpbLFbcva9+dJLiihLs/AMB3HSYzTqtI2kcFfUZK5LM/3104CO/RPYbKe?=
 =?iso-8859-1?Q?YDkYQ/+oTm2JcdVRCC0+YnbXXO1ygohFKiFdbv3mhQfsQ7YN6d9BQIqsmL?=
 =?iso-8859-1?Q?HUIXcEAKp87JPBsCabV4jZKGYffUQHBKwUrHcSvGD9BKAIzC3G1WyuMZVO?=
 =?iso-8859-1?Q?1K0rskbBBJvDPTtein3QXDeUxsTjppGo+FN6VxZskNYlR5Sz9MKmun+knP?=
 =?iso-8859-1?Q?BDqd4XylBh98ikZx9F99XG4lKsuvFE2jKPNOj92+7LxOtNEw62u2aB2Q/8?=
 =?iso-8859-1?Q?qZWnCy0XVGEaQpuZerUbfXDgRHf3/9XEtqJewgXWfn9j1qtzO9OkMFIt07?=
 =?iso-8859-1?Q?J14dGSDYZ7WZeeOM/eK9GKzra2ZW50OKWu9M6C7ag4Unv9cpvXnqmBoSpb?=
 =?iso-8859-1?Q?VnzcZ7perd336CW1XLwJYr4ss43LEH+MvdW3tofvQ4fdBeHKk4v1af989+?=
 =?iso-8859-1?Q?cqei3vnruEsZ1rYT0qV18rrWjHHZRlWu3S0EZ8soVJ0uBpgDq93j+H5tGT?=
 =?iso-8859-1?Q?LkBJ5BjQV/qB845UR/ATjCmd2I4Io+K1T8wdeLbbnE80vkm6eDXWXI2FBS?=
 =?iso-8859-1?Q?ghf8fkCk6+CHaO6Dzll5IJOIHM+oJqjbpvTIPSfGKhrlzue328obkhKnJX?=
 =?iso-8859-1?Q?sWHPDswKgPKMrKbzfRpC09SsMf4CyBG+eVUw8KQuz7o2LZNh7HpDPjzvzD?=
 =?iso-8859-1?Q?Fg0emtBK/Y8if4HULSIAdcKsxtZLGmi9nO0zyMLEDef+n6URSSXYhgn7c6?=
 =?iso-8859-1?Q?YRXUz/2iwt06p2Ta3RY/7Rx64T4ACnn6IOlPJZ7azwdzCbfWVd9cl+t/Y4?=
 =?iso-8859-1?Q?tXvSv+J1mDwKFqFMlCQcqTZgkJRf61poZ4wNBlGE8w7S+hVamILDEihYbp?=
 =?iso-8859-1?Q?IY5PCDK7cxvfp1vwhSYEuyQ5eRBj+jGu5B9oZzRWM4dbi6kiYEVOgPWknP?=
 =?iso-8859-1?Q?T9U86lZTIjR+JxTmrK1yr5nLB8sLVarT2EH+nDcO8YHjlgAZsv6sPKZCXx?=
 =?iso-8859-1?Q?Auf3gsmWpPV3hy4sYY4fOPJO319rSNFCg6DpkJ3l+OPXlZdp/MuciHPCov?=
 =?iso-8859-1?Q?loihqICwlSK/f1JKyRJzVhNuLcCBNP04WGINDaXQJ4mNISk5r/nPJy3YPg?=
 =?iso-8859-1?Q?nfy7TNlQf/KtnHX9PhPIkIQSg1RvVW3OpBmMn6K0p+2TyIhwzg2fbQQ0NC?=
 =?iso-8859-1?Q?qVjNybC8OMf5h8SD0Gdre7DErS87CdqHSc0r5FNgHzVzB9hnX5uqrhtth8?=
 =?iso-8859-1?Q?n9yqm8Udqnc2sgy9ilkWIRjzFbichQrzdv1N94KSJJoU8bx39Wv4QDW5ln?=
 =?iso-8859-1?Q?hPilMUSetRuOs2opWGKqLZHOWMZeUgKelm09xaPXHa51872/tVBHxhqfp7?=
 =?iso-8859-1?Q?rdIyCalS+Q1HNXNcWQZmQNNvgtgbU/Ov0JE0tkHhejxPo0jWiNLvsk/fRW?=
 =?iso-8859-1?Q?tIdfMFbiGGwCHjfzR82Xc/5Ur2H553e2qRxmeofFUL0CLI6qIm0nC4ZPsU?=
 =?iso-8859-1?Q?jj5RklbVR72WUMfGBENduHs8kY6c?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?29/JFNnYcdYuRFwiJWbTgWD2WpS3Z+8HTNRgk7rBgEsNEfzeLqOPOTOSZW?=
 =?iso-8859-1?Q?fip8MjdoPlB3d4gLZmMGpgmXBm30te/TKVzwymu7IfIFGNFU7jRxUurWLK?=
 =?iso-8859-1?Q?3GnOrlIbq7GSl2AoBnTs7znjVcnsmkyJpaUdk05gtrMir1ap3GLVdTrLV2?=
 =?iso-8859-1?Q?r9xM5pCneSqh+KakY+P73BvSQ7c6k9H7CguuM5uGnJOSN8TbHdiz8nLS4c?=
 =?iso-8859-1?Q?I6Uq0+FCS+tmVr+tellL74slqVloz4YPWQKvLOLPkOhnRgz3yo+iu40E8d?=
 =?iso-8859-1?Q?7pgGkBLL2cRSGU2CNrjdvetmVBeBGLu1bzKiDPk2mQueJ34X7E5hzt+sbm?=
 =?iso-8859-1?Q?spfsqNfi4ds41+mcPv3e0tFHfKYTx8bXrUAS6Q8mwGX8Zc/yIYND5RW5p8?=
 =?iso-8859-1?Q?O/BOQ+H5qccWHi6bpass9C1XOBXRCMRUK8lyPsegK2b9KHQEnDclpt/JdW?=
 =?iso-8859-1?Q?vJHF6fvqGqoXw3QiY0dp9tJh3hNO3gc/A4GB/PDF71TJf7F8OdVn9QUf0a?=
 =?iso-8859-1?Q?m8+Xc1i9OCVZI2jGzlEdk1GodOuB1cMmdXdJ7YOXf2tiXQy/jeWRSJ7PtQ?=
 =?iso-8859-1?Q?ikseZDdg613ogJqUHM2RHikYMYfLc9F9XC9IBVyf27hSHUrAv9TDFuWo8J?=
 =?iso-8859-1?Q?rxbjdMNpvAe90rVaZ15oVhZesvFj04yZ3bULDx7HybdTzKXCR3J1bEeC7u?=
 =?iso-8859-1?Q?J4+kHk/2WuggEvu72JLf0SPMI6Ydg7cEsLdj2UUsimYbmsEleHt2+QgsuE?=
 =?iso-8859-1?Q?PFqgxA3fPq6/7NqCknVVaJ95sw3Ef11r31MKwl5MAxXxkSX1QXrXrnnkk/?=
 =?iso-8859-1?Q?gTKAdlTT+09VbnsYtvb/iw8aNSyA8kovz8z/ttbOCuSBsBQAPmYcAbwGUJ?=
 =?iso-8859-1?Q?KUThmd+u8xC3eQxf9a7pa5/Yt2GEpBY5KWFFaAuLxID9vFsX2iWw4dCQ0q?=
 =?iso-8859-1?Q?hdQlEzrSLOoF99bMdgHSdq28nrgYP+ZHiZUyapW3wWWGGS1Hrem+pfIKWR?=
 =?iso-8859-1?Q?yrySpClRfejQ+NqQDuVxSPkVuT2lu8UwrRVwlsaUSqu1Q4WHGh7KiQWCNv?=
 =?iso-8859-1?Q?GFB8XSFAKDw+wIsTKMGwLhLwbUdYXtgV3bfO7P0GbK5FOxzzEVy+FcfoEW?=
 =?iso-8859-1?Q?Y3eecqp430/mnhx7E2k5NC54RWxEzonK3YAdl/Yy013QE+0ycD2QCQ62LO?=
 =?iso-8859-1?Q?2erycQ5VBaZU0fVESpyqFgh3zHNGrqDJY11eMNwv867A5dy08SrlrTOjcB?=
 =?iso-8859-1?Q?apMHeRjzFnTr0EA6VjcwnJNGdKUvoGVfl02ebRtTc7HtBx/nbjwqFZeJOq?=
 =?iso-8859-1?Q?6B50rMnvOM4wZK/Czr6bylKulVuUnms9XQv3FW6RmGD7AJN5G3kFnFsgS0?=
 =?iso-8859-1?Q?FAfigcICwkqO+milYcl+eCxPfg7yPDdg8qlreII5SLxVRzLUCDhXlGAW3j?=
 =?iso-8859-1?Q?5F57gKz15dnBtd7iEbePf90TmF9OAKz/gTnCpXUaQk9Pb6a5WjMqy2oOZ4?=
 =?iso-8859-1?Q?uZ8sC10X2S9TYWHoF3eGBzP5OUhjBn800j8JMiigx0t6l9gfc9IVVzevmd?=
 =?iso-8859-1?Q?oWUaLAg6zUGTSo2ggaMsDqd7AvX7lpQpma9Z5qShuKPnnKvPiEYVIEsAof?=
 =?iso-8859-1?Q?wQEY1G8k0Hgoe8LWhsOFqV2hNY4TN0Dqw+YxDPHLGiwHjMZqdlFUguCA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ad61a9-7623-49f2-a451-08de26a77cee
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 13:36:32.9951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G0CYuTMz9kNj0CYwMf7Fm4CXCRvx0pRSlA6rGmMO5l02PVO92NNXBRSfvHSGs5Hl4sADPYBGGaB2SwgcICvg6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7217

From: Edward Pickup <Edward.Pickup@arm.com>

This patch adds a Xen boot arguments that, if enabled, causes a call to
existing code to scan pci devices enumerated by the firmware.

This will be needed ahead of dom0less support for pci passthrough on
arm.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---

v2->v3:
* add define for cases when HAS_PCI is not set

v1->v2:
* remove dead code
* don't return errors from pci_init, but report them

changes from previous series:
* remove is_pci_scan_enabled wrapper
* make pci_scan_enabled ro_after_init
* drop debug prints
* drop Edward's SOB
---
 docs/misc/xen-command-line.pandoc  |  7 +++++++
 xen/arch/arm/include/asm/pci.h     |  2 ++
 xen/arch/arm/pci/pci-host-common.c |  1 +
 xen/arch/arm/pci/pci.c             | 29 +++++++++++++++++++++++++++--
 4 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 34004ce282..e5f7275bdc 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2079,6 +2079,13 @@ This option can be specified more than once (up to 8=
 times at present).
=20
 Flag to enable or disable support for PCI passthrough
=20
+### pci-scan (arm)
+> `=3D <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable Xen PCI scan at boot.
+
 ### pcid (x86)
 > `=3D <boolean> | xpti=3D<bool>`
=20
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 08ffcd4438..0680b2f50c 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -155,6 +155,8 @@ bool arch_pci_device_physdevop(void);
=20
 #else   /*!CONFIG_HAS_PCI*/
=20
+#define pci_scan_enabled false
+
 struct pci_dev;
=20
 static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 487c545f3a..d3481b05eb 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -284,6 +284,7 @@ pci_host_common_probe(struct dt_device_node *dev,
     }
=20
     pci_add_host_bridge(bridge);
+    pci_add_segment(bridge->segment);
=20
     return bridge;
=20
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index beb1f971fa..49ee003c5e 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -91,8 +91,14 @@ bool arch_pci_device_physdevop(void)
 bool __read_mostly pci_passthrough_enabled;
 boolean_param("pci-passthrough", pci_passthrough_enabled);
=20
+/* By default pci scan is disabled. */
+static __ro_after_init bool pci_scan_enabled;
+boolean_param("pci-scan", pci_scan_enabled);
+
 static int __init pci_init(void)
 {
+    int ret;
+
     /*
      * Enable PCI passthrough when has been enabled explicitly
      * (pci-passthrough=3Don).
@@ -104,9 +110,28 @@ static int __init pci_init(void)
         panic("Could not initialize PCI segment 0\n");
=20
     if ( acpi_disabled )
-        return dt_pci_init();
+        ret =3D dt_pci_init();
     else
-        return acpi_pci_init();
+        ret =3D acpi_pci_init();
+
+    if ( ret < 0 )
+    {
+        printk(XENLOG_ERR "PCI: Failed to initialize PCI host bridges (rc=
=3D%d)\n", ret);
+        return 0;
+    }
+
+    if ( pci_scan_enabled )
+    {
+        ret =3D scan_pci_devices();
+
+        if ( ret < 0 )
+        {
+            printk(XENLOG_ERR "PCI: Failed to scan PCI devices (rc=3D%d)\n=
", ret);
+            return 0;
+        }
+    }
+
+    return 0;
 }
 __initcall(pci_init);
=20
--=20
2.51.2

