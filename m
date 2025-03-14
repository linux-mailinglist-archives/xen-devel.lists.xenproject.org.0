Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3534CA612CD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 14:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914593.1320363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bm-00055U-4e; Fri, 14 Mar 2025 13:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914593.1320363; Fri, 14 Mar 2025 13:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bl-0004vu-VB; Fri, 14 Mar 2025 13:35:01 +0000
Received: by outflank-mailman (input) for mailman id 914593;
 Fri, 14 Mar 2025 13:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/juS=WB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tt5Bj-0003qF-In
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 13:34:59 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1edd2130-00d9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 14:34:57 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7950.eurprd03.prod.outlook.com
 (2603:10a6:102:219::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 13:34:52 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 13:34:52 +0000
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
X-Inumbo-ID: 1edd2130-00d9-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H17FcS0p92UXBV10OqnDNtTgPDr2ST/w9wjWjMGsXZkm28n3aIsWQlfIc3Viq4Jhm0gdZlcBb+VRfTYvwFxd/7lOHtmk95yrRCN2tvtncFxpnLMesj46quc+Z31LzmprqSg4n1kqHDAY6OWHT6mATSNcS7cZ4kUhm6TBvM79Wx5zQe36uKDHcQ9DafNkAfcy2Fh7vGzo9BE9wEgZXnkmd1RWrsHIO33YHh7X3uANlOJRngee/vnBR9jA6eDdSRf3Yx5ha7kdAoThoBw2khDQPzrgnZKzzeUNZAhsLCu3utfFcl0mc/t1k3hIoEYtWcS3H10FO5UP4zxQtN+8CNIPZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaRGqv75WxAf8THVDvfxaEKJIBwr3hKe+EXX/PX1zC4=;
 b=yJipVeqWxemi5sczUOZUJ+dqoDZNELkOtb3A5h7lthZ6qB0qAtob25X+BsQZDpRazabXi+u/AU6rlTzobTGwKkFoplUii5XsUVs/CDewgb/qcnLzQRYr7yAWpEyZyApY5+eDM/bI0czIpwD420fG/qquhDfFBYh031OuhBR55NjBruIdRgC2FcUhmSIJFTmnjN94F89iajlzbjorLATU4twhaC72AS/fiWs9uk7gv3DuZPQoTROyC2+8Nxgb5zyG+VzQHdlx7tpiO19KP7l00fAgF3wUYThkmCXiZMOtXoh8IFk1o/4NbLsnmLsGadQiUBbxkMqYzYmonnSW7DJpyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaRGqv75WxAf8THVDvfxaEKJIBwr3hKe+EXX/PX1zC4=;
 b=iTdSeSVHjsulmiOTZyT8Vz6fnS2wWi1JswO4ElWc8Ou5T8khlqtYoam0ByQS8mPI7/F9bsgsET91hfwENwieORXVSkXtWlA3vqPJR6tmReSdRuGoaUpeFCaMN4lr8/uO7aQjUCyGTeXcdbxelsMHdLSWblqrdLlNP/t91+blWpcoJsywskruiGY9gypKbyCrV0ggfVkDPx9sCCZ+1WuDyFl1vkqut7BssfRR8KqprvopUIMm82bsu/StSgV0ijYw870mXhQwX2oZWrqwCrk7u2xPt7GN5OelqJTYAMfLbq9gmaH/3a2oNZTDNesq/M5U2Lc10jntWgRgwxzKSL+79w==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHblOXdxbIbbkNtn0WSg/9tW2OJ4w==
Date: Fri, 14 Mar 2025 13:34:52 +0000
Message-ID:
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1741958647.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7950:EE_
x-ms-office365-filtering-correlation-id: 3e689cb4-be74-4205-7ca0-08dd62fd0051
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?623gYspX7xb2vep0uxzy/w6XEvNd3qnZq96K7y0pF0goF/3YT7DI9gLGpW?=
 =?iso-8859-1?Q?OQbTIWJHdw3Dgp3ZriNJGc+CaYATU5h7d3unWOQbEdkZLWZr3ddjfkNen/?=
 =?iso-8859-1?Q?ALXYXAl6nXL82fs9XgcRictEGi7S0ufznJJD6+BLEaR7ifeebhT76KMQ6G?=
 =?iso-8859-1?Q?Ec70bIKmg5tjg2BGei/yu53kAmqg0ME4GyH/aPDY47gDPvIyf/ChsxEWAA?=
 =?iso-8859-1?Q?u+5deSKMEMw5A9Ym6sEFmDnAntltblIQ96hnkzdDOE3DZpzRTkEhzys6R1?=
 =?iso-8859-1?Q?G9lq0dYqhlWgSnUPrVexqjafPgQG+eew4axlEEtrSXi8yCLiMj5oRfvCwh?=
 =?iso-8859-1?Q?YYj8LjQ9yUWlda/EgBsl3UO3U71+VgjupPsOOKoJ6FHh0Y80Qx/q7MV7tO?=
 =?iso-8859-1?Q?fFWPfl+IOFFFxVxbDwYuhTTv/6wZb02PQ8Zx2nm8nGXBjq8Lk77sgg58lg?=
 =?iso-8859-1?Q?XZieBmIqXO8fNmB/BGddnbPvNMMV7uVpg1kggA5HoqPn8Lw21b9YbJidEl?=
 =?iso-8859-1?Q?v5uek85kd2Cmp8OERrHcR4ftnC2J9ThAotmns1eFkexWJ7Ze1LBtQpAysl?=
 =?iso-8859-1?Q?Bp8g/yrl5kUW997gcKUudZNDRgxyLIyyfzMC3paW4JWLRiddYxCRRB5V9Y?=
 =?iso-8859-1?Q?HrQHU6M8pYEDA/sDvuoYg7oEAyQ96hUjpgKjmHQ5WuVFsNNNAlvkna5VBn?=
 =?iso-8859-1?Q?vQHdg6L2GznzWguZZXM5wKT80qYe45L2iGKhdem7oOVwI724VCLiLvlS0F?=
 =?iso-8859-1?Q?gYGQbys5Q7uRqzxlUl9d/vuE4K1iMR49SJet5AXalvC/Ftqtwkgyy0azny?=
 =?iso-8859-1?Q?1i6Vd+jasOZjSpZYtJ1O6tUjxnE+Z2f90OXNsaCpAZRVkGVMyE0nqogrDe?=
 =?iso-8859-1?Q?29pcQd76+Upgcc8PodPONhosoFSapVi9OrNg/OjbSrrnq4rzDoThsHKEpg?=
 =?iso-8859-1?Q?geAC6hvg0A2EKf3f4ggEXXergEyCMS53LkxWxkqYTbl9D4sgIPee76xyga?=
 =?iso-8859-1?Q?C9O9Thcyk/ig2ZiYGPCmkQTUoTWc5dMwYiSgP9iYWv7FZ3Uwrps8G71GPX?=
 =?iso-8859-1?Q?H+KuW2dl/s5mp+oAPdK0WAT4ALKaEAyqItL9QN8annHvaDXROs+RS783CA?=
 =?iso-8859-1?Q?7sBwUkrr+2J2deVLpWrLOA2ZhDdkaaW3TVEj81G+zCBGIMKEvgfOehtdCX?=
 =?iso-8859-1?Q?IZs9c6pS3ogeObHhe/bT/rB9wjuZdG0fVFfkvb+WOKFZ2xeI8IwjrkCDYV?=
 =?iso-8859-1?Q?KGN3g/54HrNZD5cQNM1zK8nGwDbmGEA/gQC8JQsxRhoTR7U4/1RwOMiCvo?=
 =?iso-8859-1?Q?Fqm5Zd8VreN2h/4oY6cnFxiHgsgubER/Fok3nmK2A2BnfozB8rvd/XYc7f?=
 =?iso-8859-1?Q?o9ORps8eN2Wrv7+dFUKlfJOHcTvakM6aFFsz9rGqlK42LcbZkv69l5Pdn+?=
 =?iso-8859-1?Q?9xlrh8GPMoJLCXK3VQpdMIj4GArdI+BqqBQ07CMSDTb0dTlY/O1lu2MpH0?=
 =?iso-8859-1?Q?nYbTjaTHi0/8N3EqH3cEXK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Lplortc0chmLAfVv/vDeG5DkcR+5jWx4NVCPgy4mPiaUnHAhGF5WUngI5I?=
 =?iso-8859-1?Q?waMe3oqugDYZIrDI2ZwIYOLWCZV3/UxbPlYLxpfcmoutg7CFkPXziGaHi9?=
 =?iso-8859-1?Q?pZORQdsv97L2R1umS9vUtCt4ugaizy1KAUl1KWIGluDzijv6G7GuPwdipz?=
 =?iso-8859-1?Q?eSiwenszco86+x3L3QYrwhbsXpn3uOh71qOhLlg+TUVxona5dGovdSQqqa?=
 =?iso-8859-1?Q?vNrYgarapaZ3xv2KlMPUTViabp8+5Zvo2wvOL2AWMLp6GOdG61jZAZhJbC?=
 =?iso-8859-1?Q?GOFfPAtNua1tRHjMfpHqABxVAeoEo1/1QIXq0lAJboPAlFlCNJMnoUty+g?=
 =?iso-8859-1?Q?0/EkJfNJa6KBjBcWNED1HKliwZEhOsn399oo6i1WwF2+rQ19bcVUDfQtFz?=
 =?iso-8859-1?Q?qScEw6/ws5hKgwmUZnMfMaYT0z+UohEK3rMqLZref/8TLG+bKGv15s5t9A?=
 =?iso-8859-1?Q?ASqdm7h1EFuHi7d1+difutFnIcVBMZU8QLI8TKZacWbn/NYI0ilKijNiwK?=
 =?iso-8859-1?Q?xLe4fFZ21bOwtz99fiduWdeZisjpJcoLaW4QeFlkorX2ipbBhwLn2QSHk8?=
 =?iso-8859-1?Q?TqDw8kB+Ft4GGjnpumPJEkxMPJ4h1dhhQaBX6NVbg8APyTh7xCNTZ0n5zO?=
 =?iso-8859-1?Q?YFq/JYcbWwU1L1A+K48+fi7fcUhzYmhDWZ1cAxyzxWd3BxFNEyas1Rk4fP?=
 =?iso-8859-1?Q?b8hzlf9UBgnehWFpm1rxqAY1JU42IH+Eieskgae2AhjJxSxt9rFtVPHcbS?=
 =?iso-8859-1?Q?miUBh9zF9zjfpuypAv2oFYu1awWsVCQJS62OoLJaku84QMvHBsXFzWjtZx?=
 =?iso-8859-1?Q?QsdTF+JDVqAEjnY80WzOdT+DXs6dxB2AY2zwT3HI2PReaLEy1HvrpEaZpp?=
 =?iso-8859-1?Q?Hzd1CgHWHKdVKZxYYgJWHcFsIL+Gc3IKrsDaFA1twhMZU7/ZA6DNPZjjFn?=
 =?iso-8859-1?Q?NBjDoXeIB31+kuLDJDs2ZnexLdAGmC5oNAzks5ZAOQDMmEAex4Yvf+cOu5?=
 =?iso-8859-1?Q?CiJYVv3XzSR5EunDNBML/ilgpRd/3Qv75/BSQt7vatjriil8DTRFtBV0zc?=
 =?iso-8859-1?Q?Vlp7IW0C8uH4HBMQCSW6i2bhYeJMRRgURWTUQiJVI0PMzAiAwpMIwLAn+4?=
 =?iso-8859-1?Q?5Klb3+nYDsh3DYHAmvFv/PwyIM1P/xSvs7iGVLVzocXXwGD3O+TS+gYX02?=
 =?iso-8859-1?Q?dKwfSSHiWFzHwVrD9thOzn+UtDG404nt10+byDZxk7+q8VFJMk7m+Jql/F?=
 =?iso-8859-1?Q?t3WmICyf5Vxk/DwUnDt9mRgGBLEMPP/G23s4mh3HoKEqA2EJnOCHYVxU9h?=
 =?iso-8859-1?Q?eBHQ9wrK2bpIRerOIITanZN9x/6nCxWONzddfwztkNwV/kwcJUN8BCUt8T?=
 =?iso-8859-1?Q?NOgVdBaBxkTKzUAh0ivpnu2/TcDg29YugrgYsrMEuhhs/lldmBDIVbTWbr?=
 =?iso-8859-1?Q?Z50fDDf6H2au+lnwV0GQjRv4os20pmVnX5o1JKiHc19ryH5+pHdy2ZO7X/?=
 =?iso-8859-1?Q?WUERj8miOFr6R9jiNOvW8aWeOmMmZHS1Yyt+h61tOeWD9buahLrbOUivvm?=
 =?iso-8859-1?Q?YRzZWkijgVhEOTok0SvqeyvlTAV72qf3JWDKi9FSOxSEopKfl/jXdi5ibp?=
 =?iso-8859-1?Q?vj48Ewm56zKvWZTwibaX16TRerMdp33g0JIGUwNy21cHIB5VstN2TrKA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e689cb4-be74-4205-7ca0-08dd62fd0051
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 13:34:52.7943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1sGrimxQX2RPkBZg7yYF8RXmuEKGmeHmK58SGOHE3AOK+ZwUbXjXDe0iu/Vi/NfR6xffKbRba7R6LqA/DiI9hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7950

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Enable the use of IOMMU + PCI in dom0 without having to specify
"pci-passthrough=3Dyes". We rely on dom0 to initialize the PCI controller
and perform a PHYSDEVOP_pci_device_add call to add each device to SMMU.

Enable pci_init() for initializing Xen's internal PCI subsystem, and
allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
hmm. Since
  dec9e02f3190 ("xen: avoid generation of stub <asm/pci.h> header")
Should we also move is_pci_passthrough_enabled() back to xen/arch/arm/inclu=
de/asm/pci.h ?
Not sure if PPC/RISC-V will plan on using this check.

v8-v9:
* move iommu_enabled check inside is_pci_passthrough_enabled()

v7->v8:
* bring back x86 definition of is_pci_passthrough_enabled()

v6->v7:
* remove x86 definition of is_pci_passthrough_enabled()
* update comments
* make pci_physdev_op checks stricter

v5->v6:
* new patch - this effectively replaces
  ("Revert "xen/arm: Add cmdline boot option "pci-passthrough =3D <boolean>=
""")
---
 xen/arch/arm/domain_build.c    |  2 +-
 xen/arch/arm/include/asm/pci.h |  5 +----
 xen/arch/arm/pci/pci.c         | 11 ++++++++++-
 xen/arch/x86/include/asm/pci.h |  2 +-
 xen/drivers/pci/physdev.c      |  4 ++--
 xen/include/xen/pci.h          |  2 +-
 6 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7b47abade1..fbd6db9438 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -526,7 +526,7 @@ static int __init handle_linux_pci_domain(struct kernel=
_info *kinfo,
     uint16_t segment;
     int res;
=20
-    if ( !is_pci_passthrough_enabled() )
+    if ( !is_pci_passthrough_enabled(false) )
         return 0;
=20
     if ( !dt_device_type_is_equal(node, "pci") )
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 7f77226c9b..3ae85b4666 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -111,10 +111,7 @@ pci_find_host_bridge_node(const struct pci_dev *pdev);
 int pci_get_host_bridge_segment(const struct dt_device_node *node,
                                 uint16_t *segment);
=20
-static always_inline bool is_pci_passthrough_enabled(void)
-{
-    return pci_passthrough_enabled;
-}
+bool is_pci_passthrough_enabled(bool dom0);
=20
 void arch_pci_init_pdev(struct pci_dev *pdev);
=20
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 78b97beaef..79bb8728a4 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -16,9 +16,18 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/iommu.h>
 #include <xen/param.h>
 #include <xen/pci.h>
=20
+bool is_pci_passthrough_enabled(bool dom0)
+{
+    if ( dom0 )
+        return pci_passthrough_enabled || iommu_enabled;
+
+    return pci_passthrough_enabled;
+}
+
 /*
  * PIRQ event channels are not supported on Arm, so nothing to do.
  */
@@ -85,7 +94,7 @@ static int __init pci_init(void)
      * Enable PCI passthrough when has been enabled explicitly
      * (pci-passthrough=3Don).
      */
-    if ( !pci_passthrough_enabled )
+    if ( !is_pci_passthrough_enabled(true) )
         return 0;
=20
     pci_segments_init();
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.=
h
index fd5480d67d..bffeaa507d 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -50,7 +50,7 @@ extern int pci_mmcfg_config_num;
 extern struct acpi_mcfg_allocation *pci_mmcfg_config;
=20
 /* Unlike ARM, PCI passthrough is always enabled for x86. */
-static always_inline bool is_pci_passthrough_enabled(void)
+static always_inline bool is_pci_passthrough_enabled(__maybe_unused bool d=
om0)
 {
     return true;
 }
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 0161a85e1e..18448b94b3 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         struct pci_dev_info pdev_info;
         nodeid_t node =3D NUMA_NO_NODE;
=20
-        if ( !is_pci_passthrough_enabled() )
+        if ( !is_pci_passthrough_enabled(true) )
             return -EOPNOTSUPP;
=20
         ret =3D -EFAULT;
@@ -57,7 +57,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
     case PHYSDEVOP_pci_device_remove: {
         struct physdev_pci_device dev;
=20
-        if ( !is_pci_passthrough_enabled() )
+        if ( !is_pci_passthrough_enabled(true) )
             return -EOPNOTSUPP;
=20
         ret =3D -EFAULT;
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index f784e91160..c4a49cf584 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -74,7 +74,7 @@ typedef union {
=20
 struct arch_pci_dev { };
=20
-static inline bool is_pci_passthrough_enabled(void)
+static inline bool is_pci_passthrough_enabled(__maybe_unused bool dom0)
 {
     return false;
 }
--=20
2.34.1

