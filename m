Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A14B1DD23
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073348.1436388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P3-0002SI-Bj; Thu, 07 Aug 2025 18:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073348.1436388; Thu, 07 Aug 2025 18:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P2-00028W-Oy; Thu, 07 Aug 2025 18:31:48 +0000
Received: by outflank-mailman (input) for mailman id 1073348;
 Thu, 07 Aug 2025 16:59:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xl-000773-3q
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:33 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e314394a-73af-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 18:59:31 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:26 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:26 +0000
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
X-Inumbo-ID: e314394a-73af-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4tYEYPxtx/fZPdXSMimyN5V0vlsMpgzYOAFPRmqKWCm0+Q1Z8TGw8u2a1QWGGLvMkQyAZ+OORje9TISg/Z+7tJHsxIyturjRxBfb39gN7xObRylTUtnyR2XAgEmISR3YTKvtuLOBx4zAtrScibqBtDeE2Dd9KYqL/yjpuplLzR9ALhvKopQPQufHfV0dOSsg5LFzg12h3uXmv6yHpGkMymifdJeiL8fYqP6nlod2yDpFKH80QFaqaouX7cQ6FnTivia3565SJPQlG7UvyRqv2NenULO94vV+VgIrs1mVfViDjmRUBSqsramhNRbGN7J4UNvvZ2xvDJK8gUc7pqQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEniSrR57nVltdVydlhahhmJzE8muwus3yOrLndbPSk=;
 b=LXmHZb+EuI22YeJzJB/JXW1YvLapkgOzfsjkUJdY0fJ91K684dxmxXEZudD+zSY2F5veJ3Yf1VFf2WbWwHWtV/YlO90GihThSGa+oOJC1jbjsfNCFIavqhYIIYyHJvefH6PLqhRmfB7n35i5rWVpj9ILeO3HmfBclu0CHkcL3ZGTTtDZgj0jmEpwa3wsXHbb3ZA5kHTg/UDpumomzItoqbG3zdmmAADcOerOU6ZmaiRsk1r10xkFyu683oTy9k+vZ85nvL3+IZCxaMQHwnXXqPKppQa62stWkgPB6MqxuegktjnJC0QAeZTeST7NWonx1rYVxviGyJaZu3/gTGZx/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEniSrR57nVltdVydlhahhmJzE8muwus3yOrLndbPSk=;
 b=pwXeznodns5JI/uPeh0dNuTdj5aq+MHZNeiffpaXT+kdlB/YiWQff+w50WgWyL61vwNR51Bi5ALGGcEf578/GgLlmefpy8XFrY0cXegYkbxWdlv4auTrIC+Tod906prLwijkbrH0xyEPy4BzgGVPKbT0JUj1jhkYohwlS1hnCU9Ao9T+oKn9xGtylXjuC8Ar5tkO0lqgFdLanjpJKPcXdiUOypdsbRnTEfHnU8th7Ig5naKcaqXkEC+B4yKLKNI+6Y3CV2tzOm2M9wjl7SA+72qwBEMJQcbMlRSYOf/S1SerJk8Ojm11I05hVsMcopEuhAkrIRqrBhbjDy+MQ2wlQQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH 11/20] xen/arm: vsmmuv3: Attach Stage-1 configuration to
 SMMUv3 hardware
Thread-Topic: [PATCH 11/20] xen/arm: vsmmuv3: Attach Stage-1 configuration to
 SMMUv3 hardware
Thread-Index: AQHcB7yha1klxs18OESsoLM4R9ywNQ==
Date: Thu, 7 Aug 2025 16:59:26 +0000
Message-ID:
 <f90c81d800e040db7574906fdf2ee4d57e30f2e6.1754580688.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: fc830f38-dc7f-48a2-56e0-08ddd5d3c42b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ancMAoT834YTNMxj9FQ2SRD9bCUlncsGFB/XjbJWIjboiRiGphuhywj8yo?=
 =?iso-8859-1?Q?EefAsg0Q923rzZJChspyLlYH4t+TR61278RJ/oTx6hgF74dLXp7sUZNLiX?=
 =?iso-8859-1?Q?8cSsIL7pKOOQ0Ppghy6o9WOdoVLvVN6jy2NezpEBc/ZGfYJvfckmqtUI+i?=
 =?iso-8859-1?Q?Qm6z+fNGnBe91rx4m6HHlROsLs3yXuo9kZ5q5hd2bj3eI+tQoE1o+uWWPj?=
 =?iso-8859-1?Q?41uf1aMcE7NCDIvgcRjcwxiidbkmsboIe6SoPm5dsLZnXoHVePe3d7XF54?=
 =?iso-8859-1?Q?1XWba6hKBhOSEoD/2eq6XEb9vs6/Jdt1cWK5JfdmAkS4QxU9lv7J2BK71p?=
 =?iso-8859-1?Q?Ejxz1vtTiGQbNoJpl6IBGOWnvg3XQ7qDa+cPZiF8IDwrwilenUk1O/n2W8?=
 =?iso-8859-1?Q?7q1fMHXNsXaJwhnwKZt3+GEgKLU+bE0H1Pz2Uf0ZIa/vHnh3uGyRFQ5P4+?=
 =?iso-8859-1?Q?AdGooG/NBJ7NnyUJnb7gs9HKq/kK6CliRuDNVty8unrmCz7mH75JcIt8AX?=
 =?iso-8859-1?Q?mbTgwBAa/wUPzc46B5oy0qLqUnPQ4Nftr5ro6Gfk6Q4IwqKZb8Xjd67OLA?=
 =?iso-8859-1?Q?VPSgEGnUpuxQ759znjqgPQAHdC7WM+yqLjkI0GaL0Isp1JSRWUkWh0VnPK?=
 =?iso-8859-1?Q?J169VqeT6g7n0lwWOxPdcEp/Lt0ONxYTt6o42O6VqoONX7SR2gTiXn6MD/?=
 =?iso-8859-1?Q?1xwhbhadloW+Tef0246E4kF9YzzSs/aoeepbzZnBV614XdMCSx+KW7VjpW?=
 =?iso-8859-1?Q?VCE+CQ9WRrDOOxI0C8x32sNdYXb4lhry5quGg2R9mDsBRe0MjSPu+2g0Sl?=
 =?iso-8859-1?Q?04sS4WTB6UWQilQmvKERgrsi6ujVDy2LkJ5HkFHAKbULbhx5lsVIBdG3Cy?=
 =?iso-8859-1?Q?HtccGzC2XLsE8sTqyU3UQyNNvJMyz+p8W1YVC3YhcYgYwXgl1IqV95Xzme?=
 =?iso-8859-1?Q?Qnoa2/rTs5TYEdSzGcpdGOIdKWsDJ3iisSQ66d/AjNjOxC9d9UG8pXOZbT?=
 =?iso-8859-1?Q?n0ChN1QxC/CSUwCvvNfe+YZdwQ5JDGVtXG6vvW8YyH1+AMlBA6YIcP9tO0?=
 =?iso-8859-1?Q?dvfCZIvroNI9XoIZ1nEtSBdfoR72+If2GMu+P8O5P+bq8qs9FxJT8eKEmO?=
 =?iso-8859-1?Q?/270hx94It/yFw9LrpP2fhM0u0tDFNhtejHxOMwRpAhRtTDNMefel1KF3a?=
 =?iso-8859-1?Q?QCAv6m3LjtJbytPmc33SqdfYc6+3HmCnU+eCfS1MWsCSA6w518V+hqS4Nj?=
 =?iso-8859-1?Q?x50ylOFOQefkJaEjFd6w805cLbX/xX+2SMzb9H5C22UpTXBYax9a4qwZFS?=
 =?iso-8859-1?Q?/RfbUvm6NtSrrqj3aHFk2W3VQ9L+8xIyxFh+FY/XMozp9w31VgB8bb7hw/?=
 =?iso-8859-1?Q?9asvlp2opu9f78qMhjbSc54qgl1C+i68nKsx9UkAcbKGImxDuvx8R7T09g?=
 =?iso-8859-1?Q?X4AS+EY1XrTEX0zemUiG2ha3g80XAg57947B0QpdqbFNQRhL4tkS7reAHl?=
 =?iso-8859-1?Q?JWVZgVWbXOoV1Gw8RpieeTBqk2s3ExkRDFYpMbAeXLPg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PdGhDwHVSTbTdywmDD77KACEMujCPRVnmB79XzTKfMKXSicIqgOf193QiA?=
 =?iso-8859-1?Q?EiNsPU6kMGTwujRFZBFgWZ/XrF6gMK/63WbyKp8i2IQNkZ3olTxDh4xS2w?=
 =?iso-8859-1?Q?DniZgaH1HFO7iYrRRKWfEoELHfBZeeNmn6s7hGebGWCQeHs3Uf4f9O3ut9?=
 =?iso-8859-1?Q?qskGXXbAf7kg9/zy5PbjcXNSZKFCumwwNuggG1p1JY3ysQXxFYFlnmgJ1k?=
 =?iso-8859-1?Q?3ZTCo+RMSD5GYHWkW7aetOEpT8Fe7OdtKfILfCpSDK1+s4PwsDuboGgkrg?=
 =?iso-8859-1?Q?OOzjLFloGs1IN3p/Qb++58k8/bwr7FeTv167Tt8B5KHR4FXk/p+T48FLYe?=
 =?iso-8859-1?Q?FE1r6LqKMyP3pMzB1Uhd0jz1nDWZqtDBnRYjKR3MMrSsdsLGnC/cMB1wHL?=
 =?iso-8859-1?Q?q1c7Vs7BJBj3Jp8gcV6JOcrLDgFGFRb/jl5FmojdTQbJbnw/UkxMVFOVmm?=
 =?iso-8859-1?Q?38xt69bCVZzs8rrHvjK5H5kfK2jvAgHnWcABL6kC5/NVP+ZQCwcGtAEKoQ?=
 =?iso-8859-1?Q?L4hSw5Bt5PVMUBa3PgnV9wtu1LhKshQHMyb13AQ1sPFbHiZCDalydZHMgC?=
 =?iso-8859-1?Q?4Jt3SYQFbJeLc0nKvXbm/r/uaGt+23vjsxTGmV9ZtCFJPWWFgdcRBAy8nK?=
 =?iso-8859-1?Q?g/T8imvr7oBivF2vFkTyUabun9qlLgzYAcQYqC6L+wYMWaMv72zG5H738g?=
 =?iso-8859-1?Q?A00KdUN8EG3CMGoKoDVJpvyQMHiCA77xuHUOsIj5ajJWCgzcQM80nOZgw5?=
 =?iso-8859-1?Q?t9ZoaGwxXKVEEC/9lQz2pBLyijNelHLEYNovvqWcl57CXWlXdWzZMoMmnH?=
 =?iso-8859-1?Q?Y2RC1Zom6tojZSnEGOryccgplj570PlaVa/m8gaE50qYqWuuS1lEPTxPsK?=
 =?iso-8859-1?Q?NdDlcJR6zk4HCfCJedpwLlyqcjPhhsNPI6c7crkHRmmScLexsvOG7QgtOq?=
 =?iso-8859-1?Q?6v0ATaLOKDa1VecgurMO4ZBEWf9KZAvCJ6geQ2FfBIG9YiVsFum8/ql1Cy?=
 =?iso-8859-1?Q?oxYhjmvR1k6ymArh4vmMhts3Qop/UiorZUgfTaZ2ykR3xdqM0cu4h8dDUb?=
 =?iso-8859-1?Q?5IXgj6UZ9X6pxBtBDhwCF0+Ag7B0Kk9ChnyExTJd4j9hSZXo9MwGY4IpDM?=
 =?iso-8859-1?Q?hm8kTvwahna8Nyo8AwmDXf+duZWLE3xc83zZCkAidjqGgFUFa/tDfazbp+?=
 =?iso-8859-1?Q?EmY0jbd2NBeMh5OTYgGsyg4mdUuIbBU4qgVtTwblcle9vt2dllRh552tTa?=
 =?iso-8859-1?Q?zt6Vgnu72yM+ZY1gl4nKWpyS08mOMBIgRdWo+DoYxQNUXxKrGn9MdCLSK5?=
 =?iso-8859-1?Q?okbFZuuxQb78z482KdkQ0jpFKkvUKc74RzzSffohQpH051LJwffxUHgryJ?=
 =?iso-8859-1?Q?9zfX952sKnf5DymDxCZY5KQd6gSIzl5kPZeM4WHwn/vHrjrd9fNnvhfv/v?=
 =?iso-8859-1?Q?5Hng4ENaKdwosleHduO7MipqbIcKgpveCxLokmpjSH0D1RUw1jdFbdZXRY?=
 =?iso-8859-1?Q?Oo8RkBPZc73kd/ywnJ9NFs89oUYGRoyvYY6tr+8A7Mlg04CWQrK0frVszT?=
 =?iso-8859-1?Q?rr70HjXL1DF4TZlgUM2SjmlO+GKCMOGyjNLaTwDTd+oPGmmBLusQ2kSrKg?=
 =?iso-8859-1?Q?nQop0r+nZ4jEov42HhgfXJkV0tNWTIvPBkiuqneA6r8zfpACpHuP1ADQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc830f38-dc7f-48a2-56e0-08ddd5d3c42b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:26.2087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: he4hEiepS5BgPBKkBCSnrQJzFrzMdzqX6gXiMURZ2JCZJs07ATbu0mMCkIPXZuIo52m3XgK11YTcqIVxf4Jluw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

Attach the Stage-1 configuration to device STE to support nested
translation for the guests.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c  | 79 ++++++++++++++++++++++++++
 xen/drivers/passthrough/arm/smmu-v3.h  |  1 +
 xen/drivers/passthrough/arm/vsmmu-v3.c | 18 ++++++
 xen/include/xen/iommu.h                | 14 +++++
 4 files changed, 112 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 193c892fcd..91bf72d420 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2791,6 +2791,37 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(c=
onst struct device *dev)
 	return NULL;
 }
=20
+static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
+				u32 sid)
+{
+	int i;
+	unsigned long flags;
+	struct iommu_domain *io_domain;
+	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_master *master;
+	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
+
+	/*
+	 * Loop through the &xen_domain->contexts to locate a context
+	 * assigned to this SMMU
+	 */
+	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
+		smmu_domain =3D to_smmu_domain(io_domain);
+
+		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
+			for (i =3D 0; i < master->num_streams; i++) {
+				if (sid !=3D master->streams[i].id)
+					continue;
+				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+				return io_domain;
+			}
+		}
+		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+	}
+	return NULL;
+}
+
 static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 				struct device *dev)
 {
@@ -3003,6 +3034,53 @@ static void arm_smmu_iommu_xen_domain_teardown(struc=
t domain *d)
 	xfree(xen_domain);
 }
=20
+static int arm_smmu_attach_guest_config(struct domain *d, u32 sid,
+		struct iommu_guest_config *cfg)
+{
+	int ret =3D -EINVAL;
+	unsigned long flags;
+	struct arm_smmu_master *master;
+	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
+	struct iommu_domain *io_domain =3D arm_smmu_get_domain_by_sid(d, sid);
+
+	if (!io_domain)
+		return -ENODEV;
+
+	smmu_domain =3D to_smmu_domain(io_domain);
+
+	spin_lock(&xen_domain->lock);
+
+	switch (cfg->config) {
+	case ARM_SMMU_DOMAIN_ABORT:
+		smmu_domain->abort =3D true;
+		break;
+	case ARM_SMMU_DOMAIN_BYPASS:
+		smmu_domain->abort =3D false;
+		break;
+	case ARM_SMMU_DOMAIN_NESTED:
+		/* Enable Nested stage translation. */
+		smmu_domain->stage =3D ARM_SMMU_DOMAIN_NESTED;
+		smmu_domain->s1_cfg.s1ctxptr =3D cfg->s1ctxptr;
+		smmu_domain->s1_cfg.s1fmt =3D cfg->s1fmt;
+		smmu_domain->s1_cfg.s1cdmax =3D cfg->s1cdmax;
+		smmu_domain->abort =3D false;
+		break;
+	default:
+		goto out;
+	}
+
+	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+	list_for_each_entry(master, &smmu_domain->devices, domain_head)
+		arm_smmu_install_ste_for_dev(master);
+	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+
+	ret =3D 0;
+out:
+	spin_unlock(&xen_domain->lock);
+	return ret;
+}
+
 static const struct iommu_ops arm_smmu_iommu_ops =3D {
 	.page_sizes		=3D PAGE_SIZE_4K,
 	.init			=3D arm_smmu_iommu_xen_domain_init,
@@ -3015,6 +3093,7 @@ static const struct iommu_ops arm_smmu_iommu_ops =3D =
{
 	.unmap_page		=3D arm_iommu_unmap_page,
 	.dt_xlate		=3D arm_smmu_dt_xlate,
 	.add_device		=3D arm_smmu_add_device,
+	.attach_guest_config =3D arm_smmu_attach_guest_config
 };
=20
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index d54f0a79f2..3e3a6cd080 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -398,6 +398,7 @@ enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_S2,
 	ARM_SMMU_DOMAIN_NESTED,
 	ARM_SMMU_DOMAIN_BYPASS,
+	ARM_SMMU_DOMAIN_ABORT,
 };
=20
 /* Xen specific code. */
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 3ecbe4861b..3b073b9dac 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -224,8 +224,11 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu =
*smmu, uint64_t *cmdptr)
 {
     int ret;
     uint64_t ste[STRTAB_STE_DWORDS];
+    struct domain *d =3D smmu->d;
+    struct domain_iommu *hd =3D dom_iommu(d);
     struct arm_vsmmu_s1_trans_cfg s1_cfg =3D {0};
     uint32_t sid =3D smmu_cmd_get_sid(cmdptr[0]);
+    struct iommu_guest_config guest_cfg =3D {0};
=20
     ret =3D arm_vsmmu_find_ste(smmu, sid, ste);
     if ( ret )
@@ -235,6 +238,21 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu =
*smmu, uint64_t *cmdptr)
     if ( ret )
         return (ret =3D=3D -EAGAIN ) ? 0 : ret;
=20
+    guest_cfg.s1ctxptr =3D s1_cfg.s1ctxptr;
+    guest_cfg.s1fmt =3D s1_cfg.s1fmt;
+    guest_cfg.s1cdmax =3D s1_cfg.s1cdmax;
+
+    if ( s1_cfg.bypassed )
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_BYPASS;
+    else if ( s1_cfg.aborted )
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_ABORT;
+    else
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_NESTED;
+
+    ret =3D hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
+    if ( ret )
+        return ret;
+
     return 0;
 }
=20
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 37c4a1dc82..21f905d44f 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -311,6 +311,15 @@ static inline int iommu_add_dt_pci_sideband_ids(struct=
 pci_dev *pdev)
=20
 #endif /* HAS_DEVICE_TREE_DISCOVERY */
=20
+#ifdef CONFIG_ARM
+struct iommu_guest_config {
+    paddr_t     s1ctxptr;
+    uint8_t     config;
+    uint8_t     s1fmt;
+    uint8_t     s1cdmax;
+};
+#endif /* CONFIG_ARM */
+
 struct page_info;
=20
 /*
@@ -387,6 +396,11 @@ struct iommu_ops {
 #endif
     /* Inhibit all interrupt generation, to be used at shutdown. */
     void (*quiesce)(void);
+
+#ifdef CONFIG_ARM
+    int (*attach_guest_config)(struct domain *d, u32 sid,
+                               struct iommu_guest_config *cfg);
+#endif
 };
=20
 /*
--=20
2.43.0

