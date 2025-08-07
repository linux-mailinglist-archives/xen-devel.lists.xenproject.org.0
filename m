Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AD0B1DD18
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073342.1436355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P0-0001ke-Su; Thu, 07 Aug 2025 18:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073342.1436355; Thu, 07 Aug 2025 18:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P0-0001Yq-KD; Thu, 07 Aug 2025 18:31:46 +0000
Received: by outflank-mailman (input) for mailman id 1073342;
 Thu, 07 Aug 2025 16:59:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xg-000773-H3
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:28 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0470f5a-73af-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 18:59:26 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:23 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:23 +0000
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
X-Inumbo-ID: e0470f5a-73af-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HegMn5UxB9avag8CESU/JBSzUqFD5jWR9kmHaQ838gml4QFw8V8II3KTytleznv03HXMlH6E6xbRevFa24ColGOrD/97j8Mry5bnre8eFM0dWiliU64x8jcqgfFm+kqaKW/vaJ1GUNlh9/OsSp6GunGfpMoZuTGhV/cXuKRhDdrJUbu3AqkTPlu056g/SG8LCJ+r7TJ5Kg/lC/CC77EkDa3WtLwVPUkYVQj2GaY3QxD36eGfG9Bbh3uf5DjF+Ut1ECNePNuW9buNBN9mNcPvFMRwuC5qR8Hzy5eBLHJY+54I9/SBthBiRFQOkqpp7AnpvLe7DuVqzQ+GfEEDhOo96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFJxt6SY/lulT4RXtLz5WMyN2ImvVsxM6Td1tl5EU9M=;
 b=r56W/WOg6LjntziWV6hnCXX2ERpavIIKcu+pxZ667/1glEPiJGMwbhj3ZsK7aMXfo2ag4xnKSqO4TTuXXu8P4LbTkbQ2o8L0KhSZsOs1eYOIi3NhBXGvPyETfbY2+lnksnvXgsrl++EoqCOGLunRg6wx5crmvcKSUOMdc/ChscgnCCmWksV0THV+K5cUrxtgKdncF7KY6WfkSUarreffTgpsQKnTGSCwTcyGOlsMF9YFK14u2N65eEiiA9LXZndkLEu7WR1eG4mHLZIcVFGHYcXhWAte6/wo0L1OvFz/nC6P/AG5qerwOq4xmHNI7t+sQpXlg2k1+qSVDb2f18GCcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFJxt6SY/lulT4RXtLz5WMyN2ImvVsxM6Td1tl5EU9M=;
 b=gQLMcGOKZi4zGjeBrn2UnI+qVxUteWklDUIBL3PM8lFxHjBf39X43pWtMcUR58e40LKj8TpJa+TquKZCDe8qaffF4tWpd5tvt2A2LVYKYEGTvNQOqqMwPkb3kNxMeQDwx/zz1HGn7HxJ1TmKWpeVaqc7ZtUJEisE7gAujRNu2a4aoFMA50Ce5H7gB9PsS9uGnkonQQrhBPl24vJn6uZh8lPkpyQw8pGo6tBZ4GaCWD9frKWW2SHIqoiu7L7q+759IRxtssEctDuPeODF4dBM+d09NgR9+y61FXmUYc3xQHPecKirU92+SibQVTPNNtBwLfWzKqPfFpTmRALhKpQFVw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH 08/20] xen/arm: vsmmuv3: Add support for registers emulation
Thread-Topic: [PATCH 08/20] xen/arm: vsmmuv3: Add support for registers
 emulation
Thread-Index: AQHcB7yf5fp8wcYRf0iby3/TDRcqpw==
Date: Thu, 7 Aug 2025 16:59:23 +0000
Message-ID:
 <77d962e8a344f3fd3f7afcd71ad35c12a604b372.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS8PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: 58253980-885a-4dfe-4ded-08ddd5d3c27a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?orrmLF7YZj3dJVyTpWC4Bxc/OAdjDTG6VJ9KQ25sYXX31Nr2jnyLqrHxM6?=
 =?iso-8859-1?Q?R+cZH0qkjLIPH81NrYKKZFhLPgRcjVat0q3/WuapbOQckIQOi2s76m2luu?=
 =?iso-8859-1?Q?PzTlxpPxbC4YGMBCccxftUCYOA9Cz7/btwMFHM8f0tA95axVyKsCukEtDz?=
 =?iso-8859-1?Q?pGDAwSFsmunVSKGFfXRGMTKktIGY+PSTum1ONO1edaaXgLEifgsTj6j0+x?=
 =?iso-8859-1?Q?UDbsg3ADrJaQXIi6aJMphiP5QFGseRlabAlcPWLXfIdfx0rX4BjDvd6uSt?=
 =?iso-8859-1?Q?ek235GdgzX9zF92cp0AhfEo75cDsrkCDalJLYbYEmwDBO0b/CAtzVCqZw3?=
 =?iso-8859-1?Q?Y0Z1aG4yoEniopeG/T/bsU6OD8aUgJCloe5nEbP9vFsa0lWx0vJt8ay0iI?=
 =?iso-8859-1?Q?MOutL787cvRjxlhBnfh1F1HyZLWrIohDIay4Tglc71LA900IDLRT6dDTjL?=
 =?iso-8859-1?Q?FFKD39lQmEErhFsDlnk1ED/heev1j1gOjqnI8Ah/xQtU7gx+c0KqmYRISl?=
 =?iso-8859-1?Q?3ITtCkC3/L7MIM+ZjZWAuwXNbM8E1YQvb6iS9Y2a7yW8GpTDDYGTbQx8PD?=
 =?iso-8859-1?Q?fYhkQ/JCfDxbeMXgSm6ZQ2hn4PllOPiNwW09tbdg2+LAWly86oLF0McY0P?=
 =?iso-8859-1?Q?HmV1hFfdroJLLTdfL5OsixCk1DhS0ax9+VJ4IlzPmCCjXOu+vEZaOVN7Wg?=
 =?iso-8859-1?Q?5LmNo9/j2Du2GsItyJBOH2c59BvNgSymCTKueiUhllUpAGEtF9zOvRukfy?=
 =?iso-8859-1?Q?eT1v+9q8lDXBSiDPO4GfjpVhHduWXJ1utx9rMwTZNooWJGrWGgYIyIdCyu?=
 =?iso-8859-1?Q?JRe6O2Qs5ZyCnJqMhW0806FtVA421OSu7zjXyKNRDA7zpkM/uHMisEHxA+?=
 =?iso-8859-1?Q?IV984l/8xCpObxA03Asg8RTvsJGFCVHTCl9/70Gf0hDzpYI0MgoxJIeQtA?=
 =?iso-8859-1?Q?WoUqf4mTrZ7P7/iCGwAwdKYq4H6Q8GUX6gKVHouRU5h0sldfmDvMs3qQcU?=
 =?iso-8859-1?Q?T+Wq7gBeMUyNdvq8RqTW06Lr+eBApQGEhi7pkiQfKuQwVxwc7k6uE6OK/1?=
 =?iso-8859-1?Q?k66hfnE7Xqig3h9WKeX5zkmYoykHizZVMM1mZavYgOU9+9sKMWMcyxwwS0?=
 =?iso-8859-1?Q?uYv6m4/1sFBjtrSjKXUY59a6Rf7JN/0nP9k1owLE38VVxXQuEpHyNitUne?=
 =?iso-8859-1?Q?wd7YvxP0kjAOqHRYHKH8KQ+9uXK+ojyue3TgU5Cl+f6V9X8GW7RKwSEEsM?=
 =?iso-8859-1?Q?x1KDG1XmTtLmwsSfI9KTRwv/AsG1egae8qfGCz8JfCwLgyMiPrkVPgXapm?=
 =?iso-8859-1?Q?JF+Ln7HmsoqY1zC9tm5aW5AQGTaIg4KWdpv/eDGjfU7ReWXgBLsu8RDezE?=
 =?iso-8859-1?Q?nC1pkUzzAfAoChESNOAIQDKYWcbGZ1oJegq1rAO/p4matZSRQoNVprJ4Z1?=
 =?iso-8859-1?Q?kBZ7+CLLcJBykvDx8bbAXjlSVq+DaaeBT6Zdke/7HpGSm29rFd8fzRhrT9?=
 =?iso-8859-1?Q?T4nU9tq073RizAIw08tjvpHjFmlFoXUa7jZlTk65Xv4Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Uas1dOLSav4hkuhpZ4Tap2fPSUa1h//LQ6niR3xbbd9M9WcR8XX66bY7+h?=
 =?iso-8859-1?Q?VGh2N9TF4DpL6KOG4fCv6ByNJKh/VA1YGlNc+PvVi8dWhK+Kz6Ie5K0a4E?=
 =?iso-8859-1?Q?96GintZiJb6cxG8KPo5LG6EKZrXAyJvN0LnPF0bkqenMh9DwJCjOZCo3xO?=
 =?iso-8859-1?Q?YOikdW/ReuAgy6mqcEfQ3LLO89HadcqeCjNtkUH6bicVXE4oKPH/9pL2C0?=
 =?iso-8859-1?Q?Reh32Yq4J0PeLJZBIU3lXjalCHaw7qqsdk3Uctb5xfvmQbZT0H6TPaZ+Ez?=
 =?iso-8859-1?Q?S8yjBQrRrVQEWpE26nPJklOBkX9CRTJQUQMe7rpEkrKwFrN+22snr3alJL?=
 =?iso-8859-1?Q?2EWrd19TTaZ7/v7mF23Mdy0WWA5bb9WRhzIPdKRcng4W6An5PHkQDn08+f?=
 =?iso-8859-1?Q?cB15THrOkZSSdfn/NV12zZ3jdIo7KBCW5BqJB6irAVYu90t7Vwn2YxyQkA?=
 =?iso-8859-1?Q?5969fnzo11QAjN5d4NgEGGwSHxyPXnq4BzjNHLsVcBhXpWb0KVaDZ0mfZ9?=
 =?iso-8859-1?Q?IEspGag5tMFq0qG4xGy6BzvS1hUN25PdXm96Thndr7RmQzeDUs0ifATsRc?=
 =?iso-8859-1?Q?XlvnYBB0YXQQqNDrSAJSVR2Ccs48ZhuZxCxc+aNBz3Xk6lTa3kQncwU5pK?=
 =?iso-8859-1?Q?K1AHkUira++MSZpbhJCarlHD9LT7bMDzwikekhDezgFrvamqc2bJeR/z9a?=
 =?iso-8859-1?Q?T/MsAV57QgxSCZKgVv4AhDe4unk0nTLR4aD4FvkXJ0+vQpQJeKdYtzXhrl?=
 =?iso-8859-1?Q?2DyHwkArBTfwUvlJuKkGuRX6X7Zqpa0z/l0skAIqs8/+CSU4GpGwkiQd4O?=
 =?iso-8859-1?Q?+hnCKlEGtNxlrwL0sSaMgL72e4p6aff0Za0HN9lGQVc6zVTvvylmMYWQiv?=
 =?iso-8859-1?Q?INvbLoUSKZD6MUN8LVQr1nGVBW52GQ+lTgXt5rmhFk43+15hQyocZrQ5e5?=
 =?iso-8859-1?Q?SOEbKZBK5k+9qHJIdE1AsolcxouCrzxgEV0FUq1lwuvtDlWlhr0hnzkyb6?=
 =?iso-8859-1?Q?lphUfriotUpVEcbQ+DTWCNLC23BRnWXq5j2sgiYzVBxdTSi6UjqrWMP2K8?=
 =?iso-8859-1?Q?FN8bd+/2Ru5ewd+JelbVhO+PpaH1WF8KmMnURlQujn6owal3+t1Psg7jzq?=
 =?iso-8859-1?Q?WACL2Qw7ZDNojgX558nPl7vGs/UE5QFyOaehtsd+AFMwvedXRcpQtVx2Xn?=
 =?iso-8859-1?Q?36cf6ho93BCvABncn7Ws/l4SkUROA+SM7w3jurk6KV2Yh/dOfVDyWBoeKg?=
 =?iso-8859-1?Q?x4sjdxmJ91A4eicOvPaLmppztqvywyoOpQa+0mTl62TrPcuP1lNqgP1SOc?=
 =?iso-8859-1?Q?FzhtJWl6wST6deakfL2qecyAza9w4d/G+Owjj1k5UCrQmiA7euOpzzQ5Kn?=
 =?iso-8859-1?Q?qS1TzeA4U5ktBh82th1gWBfKcEARiTXeRQoBSV5uTqn/OfHqYGPVZlrnnv?=
 =?iso-8859-1?Q?h2r750sPIrAyPGNwrXa0lyAwZEDxZcr2jOtKc++JQlqYCY6HaLp/WbBBgz?=
 =?iso-8859-1?Q?SG/4uI3rdo0GvgV/rm33tup3HW4OmwOfVj+KmPDdjdoee6mex9OChDMDLd?=
 =?iso-8859-1?Q?u4S8rLpfRZ+0vBd/06ZmSi87NKWkhS3zUlNbnk04G2iOBqSknqLttbnHZj?=
 =?iso-8859-1?Q?zaD8kv7gk8jUstgMu6jHF7iqavaji35XC9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58253980-885a-4dfe-4ded-08ddd5d3c27a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:23.3825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xfm5eUfEld51REa5ck+nePTSnH/06BvUh4yJqIsdvIZp30SeK7FAwn2Bi/4P5CMoDu4mGzZVvaa1pKjRU4aNUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

Add initial support for various emulated registers for virtual SMMUv3
for guests and also add support for virtual cmdq and eventq.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.h  |   6 +
 xen/drivers/passthrough/arm/vsmmu-v3.c | 286 +++++++++++++++++++++++++
 2 files changed, 292 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index 3411edc47f..d54f0a79f2 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -60,6 +60,12 @@
 #define IDR5_VAX			GENMASK(11, 10)
 #define IDR5_VAX_52_BIT			1
=20
+#define ARM_SMMU_IIDR			0x18
+#define IIDR_PRODUCTID			GENMASK(31, 20)
+#define IIDR_VARIANT			GENMASK(19, 16)
+#define IIDR_REVISION			GENMASK(15, 12)
+#define IIDR_IMPLEMENTER		GENMASK(11, 0)
+
 #define ARM_SMMU_CR0			0x20
 #define CR0_ATSCHK			(1 << 4)
 #define CR0_CMDQEN			(1 << 3)
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index e36f200ba5..3ae1e62a50 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -3,25 +3,307 @@
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <asm/mmio.h>
+#include <asm/vgic-emul.h>
 #include <asm/viommu.h>
+#include <asm/vreg.h>
+
+#include "smmu-v3.h"
+
+/* Register Definition */
+#define ARM_SMMU_IDR2       0x8
+#define ARM_SMMU_IDR3       0xc
+#define ARM_SMMU_IDR4       0x10
+#define IDR0_TERM_MODEL     (1 << 26)
+#define IDR3_RIL            (1 << 10)
+#define CR0_RESERVED        0xFFFFFC20
+#define SMMU_IDR1_SIDSIZE   16
+#define SMMU_CMDQS          19
+#define SMMU_EVTQS          19
+#define DWORDS_BYTES        8
+#define ARM_SMMU_IIDR_VAL   0x12
=20
 /* Struct to hold the vIOMMU ops and vIOMMU type */
 extern const struct viommu_desc __read_mostly *cur_viommu;
=20
+/* virtual smmu queue */
+struct arm_vsmmu_queue {
+    uint64_t    q_base; /* base register */
+    uint32_t    prod;
+    uint32_t    cons;
+    uint8_t     ent_size;
+    uint8_t     max_n_shift;
+};
+
 struct virt_smmu {
     struct      domain *d;
     struct      list_head viommu_list;
+    uint8_t     sid_split;
+    uint32_t    features;
+    uint32_t    cr[3];
+    uint32_t    cr0ack;
+    uint32_t    gerror;
+    uint32_t    gerrorn;
+    uint32_t    strtab_base_cfg;
+    uint64_t    strtab_base;
+    uint32_t    irq_ctrl;
+    uint64_t    gerror_irq_cfg0;
+    uint64_t    evtq_irq_cfg0;
+    struct      arm_vsmmu_queue evtq, cmdq;
 };
=20
 static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
                               register_t r, void *priv)
 {
+    struct virt_smmu *smmu =3D priv;
+    uint64_t reg;
+    uint32_t reg32;
+
+    switch ( info->gpa & 0xffff )
+    {
+    case VREG32(ARM_SMMU_CR0):
+        reg32 =3D smmu->cr[0];
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cr[0] =3D reg32;
+        smmu->cr0ack =3D reg32 & ~CR0_RESERVED;
+        break;
+
+    case VREG32(ARM_SMMU_CR1):
+        reg32 =3D smmu->cr[1];
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cr[1] =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_CR2):
+        reg32 =3D smmu->cr[2];
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cr[2] =3D reg32;
+        break;
+
+    case VREG64(ARM_SMMU_STRTAB_BASE):
+        reg =3D smmu->strtab_base;
+        vreg_reg64_update(&reg, r, info);
+        smmu->strtab_base =3D reg;
+        break;
+
+    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
+        reg32 =3D smmu->strtab_base_cfg;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->strtab_base_cfg =3D reg32;
+
+        smmu->sid_split =3D FIELD_GET(STRTAB_BASE_CFG_SPLIT, reg32);
+        smmu->features |=3D STRTAB_BASE_CFG_FMT_2LVL;
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_BASE):
+        reg =3D smmu->cmdq.q_base;
+        vreg_reg64_update(&reg, r, info);
+        smmu->cmdq.q_base =3D reg;
+        smmu->cmdq.max_n_shift =3D FIELD_GET(Q_BASE_LOG2SIZE, smmu->cmdq.q=
_base);
+        if ( smmu->cmdq.max_n_shift > SMMU_CMDQS )
+            smmu->cmdq.max_n_shift =3D SMMU_CMDQS;
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_PROD):
+        reg32 =3D smmu->cmdq.prod;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cmdq.prod =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_CONS):
+        reg32 =3D smmu->cmdq.cons;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cmdq.cons =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_BASE):
+        reg =3D smmu->evtq.q_base;
+        vreg_reg64_update(&reg, r, info);
+        smmu->evtq.q_base =3D reg;
+        smmu->evtq.max_n_shift =3D FIELD_GET(Q_BASE_LOG2SIZE, smmu->evtq.q=
_base);
+        if ( smmu->cmdq.max_n_shift > SMMU_EVTQS )
+            smmu->cmdq.max_n_shift =3D SMMU_EVTQS;
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_PROD):
+        reg32 =3D smmu->evtq.prod;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->evtq.prod =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_CONS):
+        reg32 =3D smmu->evtq.cons;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->evtq.cons =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_IRQ_CTRL):
+        reg32 =3D smmu->irq_ctrl;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->irq_ctrl =3D reg32;
+        break;
+
+    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
+        reg =3D smmu->gerror_irq_cfg0;
+        vreg_reg64_update(&reg, r, info);
+        smmu->gerror_irq_cfg0 =3D reg;
+        break;
+
+    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
+        reg =3D smmu->evtq_irq_cfg0;
+        vreg_reg64_update(&reg, r, info);
+        smmu->evtq_irq_cfg0 =3D reg;
+        break;
+
+    case VREG32(ARM_SMMU_GERRORN):
+        reg =3D smmu->gerrorn;
+        vreg_reg64_update(&reg, r, info);
+        smmu->gerrorn =3D reg;
+        break;
+
+    default:
+        printk(XENLOG_G_ERR
+               "%pv: vSMMUv3: unhandled write r%d offset %"PRIpaddr"\n",
+               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
+        return IO_ABORT;
+    }
+
     return IO_HANDLED;
 }
=20
 static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
                              register_t *r, void *priv)
 {
+    struct virt_smmu *smmu =3D priv;
+    uint64_t reg;
+
+    switch ( info->gpa & 0xffff )
+    {
+    case VREG32(ARM_SMMU_IDR0):
+        reg  =3D FIELD_PREP(IDR0_S1P, 1) | FIELD_PREP(IDR0_TTF, 2) |
+            FIELD_PREP(IDR0_COHACC, 0) | FIELD_PREP(IDR0_ASID16, 1) |
+            FIELD_PREP(IDR0_TTENDIAN, 0) | FIELD_PREP(IDR0_STALL_MODEL, 1)=
 |
+            FIELD_PREP(IDR0_ST_LVL, 1) | FIELD_PREP(IDR0_TERM_MODEL, 1);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IDR1):
+        reg  =3D FIELD_PREP(IDR1_SIDSIZE, SMMU_IDR1_SIDSIZE) |
+            FIELD_PREP(IDR1_CMDQS, SMMU_CMDQS) |
+            FIELD_PREP(IDR1_EVTQS, SMMU_EVTQS);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IDR2):
+        goto read_reserved;
+
+    case VREG32(ARM_SMMU_IDR3):
+        reg  =3D FIELD_PREP(IDR3_RIL, 0);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IDR4):
+        goto read_impl_defined;
+
+    case VREG32(ARM_SMMU_IDR5):
+        reg  =3D FIELD_PREP(IDR5_GRAN4K, 1) | FIELD_PREP(IDR5_GRAN16K, 1) =
|
+            FIELD_PREP(IDR5_GRAN64K, 1) | FIELD_PREP(IDR5_OAS, IDR5_OAS_48=
_BIT);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IIDR):
+        *r =3D vreg_reg32_extract(ARM_SMMU_IIDR_VAL, info);
+        break;
+
+    case VREG32(ARM_SMMU_CR0):
+        *r =3D vreg_reg32_extract(smmu->cr[0], info);
+        break;
+
+    case VREG32(ARM_SMMU_CR0ACK):
+        *r =3D vreg_reg32_extract(smmu->cr0ack, info);
+        break;
+
+    case VREG32(ARM_SMMU_CR1):
+        *r =3D vreg_reg32_extract(smmu->cr[1], info);
+        break;
+
+    case VREG32(ARM_SMMU_CR2):
+        *r =3D vreg_reg32_extract(smmu->cr[2], info);
+        break;
+
+    case VREG32(ARM_SMMU_STRTAB_BASE):
+        *r =3D vreg_reg64_extract(smmu->strtab_base, info);
+        break;
+
+    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
+        *r =3D vreg_reg32_extract(smmu->strtab_base_cfg, info);
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_BASE):
+        *r =3D vreg_reg64_extract(smmu->cmdq.q_base, info);
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_PROD):
+        *r =3D vreg_reg32_extract(smmu->cmdq.prod, info);
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_CONS):
+        *r =3D vreg_reg32_extract(smmu->cmdq.cons, info);
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_BASE):
+        *r =3D vreg_reg64_extract(smmu->evtq.q_base, info);
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_PROD):
+        *r =3D vreg_reg32_extract(smmu->evtq.prod, info);
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_CONS):
+        *r =3D vreg_reg32_extract(smmu->evtq.cons, info);
+        break;
+
+    case VREG32(ARM_SMMU_IRQ_CTRL):
+    case VREG32(ARM_SMMU_IRQ_CTRLACK):
+        *r =3D vreg_reg32_extract(smmu->irq_ctrl, info);
+        break;
+
+    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
+        *r =3D vreg_reg64_extract(smmu->gerror_irq_cfg0, info);
+        break;
+
+    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
+        *r =3D vreg_reg64_extract(smmu->evtq_irq_cfg0, info);
+        break;
+
+    case VREG32(ARM_SMMU_GERROR):
+        *r =3D vreg_reg64_extract(smmu->gerror, info);
+        break;
+
+    case VREG32(ARM_SMMU_GERRORN):
+        *r =3D vreg_reg64_extract(smmu->gerrorn, info);
+        break;
+
+    default:
+        printk(XENLOG_G_ERR
+               "%pv: vSMMUv3: unhandled read r%d offset %"PRIpaddr"\n",
+               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
+        return IO_ABORT;
+    }
+
+    return IO_HANDLED;
+
+ read_impl_defined:
+    printk(XENLOG_G_DEBUG
+           "%pv: vSMMUv3: RAZ on implementation defined register offset %"=
PRIpaddr"\n",
+           v, info->gpa & 0xffff);
+    *r =3D 0;
+    return IO_HANDLED;
+
+ read_reserved:
+    printk(XENLOG_G_DEBUG
+           "%pv: vSMMUv3: RAZ on reserved register offset %"PRIpaddr"\n",
+           v, info->gpa & 0xffff);
+    *r =3D 0;
     return IO_HANDLED;
 }
=20
@@ -39,6 +321,10 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr, paddr_t size)
         return -ENOMEM;
=20
     smmu->d =3D d;
+    smmu->cmdq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
+    smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
+    smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
+    smmu->evtq.ent_size =3D EVTQ_ENT_DWORDS * DWORDS_BYTES;
=20
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
=20
--=20
2.43.0

