Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38623AC6555
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999020.1379739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpq-0006bM-Cc; Wed, 28 May 2025 09:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999020.1379739; Wed, 28 May 2025 09:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpq-0006YY-7S; Wed, 28 May 2025 09:12:30 +0000
Received: by outflank-mailman (input) for mailman id 999020;
 Wed, 28 May 2025 09:12:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sgde=YM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uKCpn-00059a-Rr
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:12:27 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deda430f-3ba3-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:12:25 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB9PR03MB9709.eurprd03.prod.outlook.com
 (2603:10a6:10:459::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 09:12:19 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 09:12:19 +0000
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
X-Inumbo-ID: deda430f-3ba3-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgK/+VqvlYCfjK55LP+uQ8zI9t0bUsDllbCaz57/Qci8k50nRALfhEsfQ6VrJyQ7PlENk0krnwHT3zx427CqGK93r6FLJhoa484PZ9pR61nPNSeWE5y9B8SwopULdOI1bXc8VUnfoywqjEivSK6/zL+1SAN/wp2sineCnqwxozgXFrkhUSzmLXJI9I9x+yiuhSCkd76qAdXqf26shuDSrm9CjDjVNwdZJu+DB9nmF1gwN+RZGPZUvdhe+US395/+T9Beh0SJ2mLWLJz6Atch/ts+QhAG1Q7rXddLs7yP+SFWY7jmNkX5mfAYn/AxE8LCwWrx/qozNTlKobbozz+xcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEZ/g1/L7lCVbGr++G8wPspm9uPCGKIkFud3rE9aj+M=;
 b=xpe+1dEviCP2DiTAtqYJrqzAa6w/aEff41DKlMAxkBkzMnmaniDjKNPI7F5a6vkm9S3BzGO/uGiysavWxEvXg0Rd/a+rDNJDO5bAVE4NrclC2mdLk0jmbrHyY2OUpx2cNEC/2z9Gyikn+mpF3u1tPONqKfxCAKen/tOzTczF/8J6xwjIX2t3nF6g+RZcrIy4pMM9P1NnXJBiZ86JFvD995fbqaOxi/augJt/6kU/Nqdd9eq08F0CWKcXTdrXZ8jW+YAEIvhhpfHFLmOocf5f9ekFkf3BpqIKyUo+99WNAIKtprmSyJt4s0ROCvWn+qNBN2paF5EWRZqC5rDo98gT7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEZ/g1/L7lCVbGr++G8wPspm9uPCGKIkFud3rE9aj+M=;
 b=GKlqze/D2ZjyWfQMaXAmU0a3ySuk9jrVXmSRy/dDFXzelXoGkOkZ9YzIZFgAYsQMtYyeGoTqLvVxNGeRCsLD3H71m6BLMRk3u876UnlCHrh8RhPYgBRcHIp7Q9esnfB9f+AcwCjJDt7sMoVUyTviX0XT+h2Kh8JS7veo+QDmAb/PjsV/4fGu5bcPoO0ty4IB4zZLuVA77Nf9yYc8JR8HKt4gsobr84/IJvbCoHQ8VFqQKDkQiIUiOy3r4/810iKZuM97SDatv93rGFJEl7IzsSmsNZv3dpmMN1DSJ8zwBKaYj1BJIdlA0qYBrWfSCXTl1zXQw3ZPuHMVtmRFJ0rf8A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v11 7/7] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Topic: [PATCH v11 7/7] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Index: AQHbz7Ccn/ACVQMjDkycMZ0+lkfrtg==
Date: Wed, 28 May 2025 09:12:18 +0000
Message-ID:
 <893a21afbf4238ae3eedd2e32246937c7ece59b5.1748422217.git.mykyta_poturai@epam.com>
References: <cover.1748422217.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1748422217.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB9PR03MB9709:EE_
x-ms-office365-filtering-correlation-id: d9456772-05d7-4c5d-5298-08dd9dc7bf71
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WGEwzkST5jK5NmtMnyHP2RjwHgLRx+fI75WaDY1eTEl4VMyfixS1eZxTy6?=
 =?iso-8859-1?Q?jEQuTROSvu84zVzabelCzuO7U0bP7RqVhDyHiKuWa154kYPp2L+l/6LwBg?=
 =?iso-8859-1?Q?BOXVlKxCmK4OwES/Zfd6q66oq+tpms/0llaNeb8437I3bmP2eWeaPEPtqv?=
 =?iso-8859-1?Q?I9uUSCVw4Joq1fKBXwD12CqAWiq9JGdJS7SqloAOeIyG5BjavE/rVbgklE?=
 =?iso-8859-1?Q?psWnQUKSTnsLBdzyRHfFhodhm0UXBE6IahLQNcQ7jKrxUPCJggq/W9fHxZ?=
 =?iso-8859-1?Q?FXi9yrGyJkjGgxWOQcpCFpA0l5hMvAb0xFqzY3dDWQioxX9TY/w7i9SO9I?=
 =?iso-8859-1?Q?sdvHXs6Q6caVZOIAGekdOisea+GxOL6s0bZqQ2o5L8/HgMgfRRsM6NxhOz?=
 =?iso-8859-1?Q?pyLGCFA1seUtzSjpxDFrmzs7JOL9Zr9NyfyxPfJFbvi+Tk6zsz4PE5imIg?=
 =?iso-8859-1?Q?R2XKl9w90no/1PhHO2SalQARIY3GKN3IDagr76n3ZBjuDyHzxpP0WaVGWI?=
 =?iso-8859-1?Q?/U2nu+2KCg3bhsrgTG10sOSvaTGPLnMWLJI1WBTYH08pzWtDkiKw7W1rGp?=
 =?iso-8859-1?Q?lIpKQxaFM44I1xew6vzh0PZu25Ah8mI/k8h7vmT7mzETOtr2RWcv3XL3R8?=
 =?iso-8859-1?Q?W5CSyEEG3Hton0AUzxdyTdjKdnbpnnq9jJE7YLr7X5sWkVIL3UDeyKBxDF?=
 =?iso-8859-1?Q?mv3ThE/+JRr77o02wcvu0EkzYhb7E5ry3Q/WdPjdVBqk724eMUCRAPJKiG?=
 =?iso-8859-1?Q?SDI8kpTlEHMlffloa8oS4JSQ6ZFZbR6/rnKm96qF7dk1paMsMuWzX1pULL?=
 =?iso-8859-1?Q?r+v88JULUIZb5xxGEumu6Hu8DMhxrjT91n59iJKolpwsWrihQs+saf9Qj4?=
 =?iso-8859-1?Q?pM2nbaxO9iZXjemknJFJu7NbaQ0dgVRHRU/CvEoxQ2Pw/5pHOOqf6PlYEk?=
 =?iso-8859-1?Q?rO3ap/vLc26Rd7ClaHAz6v37Kkv6TbZ6WLsqxNPgbH87EsWJChcR43Dc4e?=
 =?iso-8859-1?Q?w4SszXlm+gDvb266wWX9rayorRt9m85WCukkIU9Uolw7sBTH043ffxkoIk?=
 =?iso-8859-1?Q?yy1yb7kox3NiyiElFoprxF/jyGIkoYDChEhD9qxCWEQEEoNYnqpLUwA4Uk?=
 =?iso-8859-1?Q?QsPwz4ECPmfjOlcg8bIgDiz3rwm7Mqr1Zzmr0Xc2Qs39Ly56ro1Fc3sgGa?=
 =?iso-8859-1?Q?QDfXqPqGKqieEnIuYQUEND4ibFcn48G8F8zLaXbZ4WMbjzjj12qHal1JdJ?=
 =?iso-8859-1?Q?DqSW0DGm9GbRhGO84zoYHqlifXM2J13V0CLF2kH//2VVYrEVbuADZfikmm?=
 =?iso-8859-1?Q?IDTIChBLfXslHhWatMNFVubkjsKoXL0sa7YtkAt1PZRjEw+em8ZrEFlBQA?=
 =?iso-8859-1?Q?uobLpz/93wFb65okUKsP2OzAlkFHy4NBc77xWtmpaGrgeaB+CEGJx+33fI?=
 =?iso-8859-1?Q?xpAN9Xk6TAzg0yTs7fRCImSKUgrf7OCYPggRtYkYNY6wg4EHxJlMYb1cmI?=
 =?iso-8859-1?Q?o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tiefqtjWfc+Xu/T9pOIRh3dDY9xrp4fcJHepI6NKM47yMm1UQGBfBsIBG0?=
 =?iso-8859-1?Q?TJc1BUAc8VBRvgoyycF1EprtuIsS6jVCA5uT70fjw+354HwcXnidw5DE9L?=
 =?iso-8859-1?Q?HjBa3nGSWnfkMHcKbTXeADA7dRAHcuzkROaIbIXoxLEgrt2VtGZfD4Gxds?=
 =?iso-8859-1?Q?6DnKxRRqLiULS3u48XQ54ECgu0zqBUJQ5Hsedq8BBo3IPyeyrgUa2y4fRX?=
 =?iso-8859-1?Q?ztBI6idKaHrRfPIJhHKfnl/SFxZXYPxcozxAd4t9s0Rj1dLsIq8gxRmUN6?=
 =?iso-8859-1?Q?UreXamOccrXKODoPU+4lTUO2KUIeLGLYhVlmDTGHAZLUymKdrINuLFRYZF?=
 =?iso-8859-1?Q?nQVbiuUi91CWMfojNftvVlalff8C06NEqStXb2WEY781iSR+d+FCsUU8vY?=
 =?iso-8859-1?Q?LyGGr9DQc8d5BkBBGn+rK9nuPBzJ6xhVOQJwlEo/Ddazoxu8gxTrKHUb6D?=
 =?iso-8859-1?Q?E1tucwm3iSamWuZuXku5oY5EDik3KnTAcEZNz1fh46ZBNNvK1OjNAmanGv?=
 =?iso-8859-1?Q?dYZPfH8EP6+Xzead/IdzKLI9Ai6cP2DbdsngSbKt7Pi0Vn7t0S+VCOo8cd?=
 =?iso-8859-1?Q?nUn4F2xkK+844vpeBgsDe9fz1ct22kMF8/P04b/UumtWNMMexGjcKdUHCb?=
 =?iso-8859-1?Q?BklcutL7Cqq+IhSjvo385B/U2fSr4qck5YBm9YtL/3aGCVxyvuxZPAAVfW?=
 =?iso-8859-1?Q?gBSFsrp6Jd65rJLPoyrogzt9TanapHQs0X0eVGbhlGUAbMEOZ5hmiZr+2+?=
 =?iso-8859-1?Q?PI+hzxyfIKgdD04ldTbDP8UzgfKIHbKypbHTU3hd542ErvHMP+EzaUGp6b?=
 =?iso-8859-1?Q?8W6CfjPdP/cl7QGuZod72D+I73JiCTts0VksWSMNPlUONsPyDrcVzx7Bim?=
 =?iso-8859-1?Q?HlpMrjiPrZd0GZ6SMyBl7bNhUF2AuNcXTJAGKoVynDU8GwrpIGbqLp/KVW?=
 =?iso-8859-1?Q?F87mbWwdvjAcTUYmZXmqpUdutlco8fwCQmw1X1XWdKvjI1uOxnhyM7G7lE?=
 =?iso-8859-1?Q?PZjmpe+51PaDLoiXjY4o9kNl/o7aaazUYxYWSrGJ3itst6ZvVVRKWAVAgz?=
 =?iso-8859-1?Q?olBqzQE6hi2ZxDoiL34oHCmN0AB6AbzkewwvIzWcuHbhR/D71KlQxvjjKM?=
 =?iso-8859-1?Q?qXKwF59YF/O904jAJ8Ia0OUdkAHrQ3oMu9GX4QJmV1dtnXUylXI7Ek7/Zn?=
 =?iso-8859-1?Q?6zARrP6/ydQc0sS/sz5/c0is7VrNqyLmigR4ZD3nuPiAT/TMtFQ/FM8bTS?=
 =?iso-8859-1?Q?HRRJRicUV9e6Xf61OARQ5bwvy6kjfu8KI4B4iHx0mnrLmfpSmH3D4xojl6?=
 =?iso-8859-1?Q?u4SJAfk/eG5mk/iVIawg/kUCls9t5QuLZXmiO15bte76/f7G+vNA+WWDRj?=
 =?iso-8859-1?Q?waQLPELpvESGq4YhfqeI6fW2vnqHnbn7bh4JE+yVCPkmHANJw7vNN4QybN?=
 =?iso-8859-1?Q?EExRL8saYuyjXmNip37Kopqo634wlyk5/fiHlo1/pFJfYxyPGBK6kcUotc?=
 =?iso-8859-1?Q?ODjGqaZmzUxg7NwqrCY6R6Z7oXMLgsy6N4iSgS+qECOeSkMj2UCo6DkvQa?=
 =?iso-8859-1?Q?PeCM7ifeC9zCdARAgTb/NlW7jw4vWAPcfEfJxnwTAhfePeoyL+aVzkztea?=
 =?iso-8859-1?Q?+EIVOPeu0o2F/KkQQ1xSDdILRM9WBwf1V6juV8epodKGFkipioCq9Z1w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9456772-05d7-4c5d-5298-08dd9dc7bf71
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 09:12:18.5745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RfMMT7lZq3C466D0jWbiMqrybygFd81evx/wfuppOMSlqFghAPecR5eZDPzG6I1xndS21yY9z9GtDmS/f0yhpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709

From: Rahul Singh <rahul.singh@arm.com>

When ITS is enabled and PCI devices that are behind an SMMU generate an
MSI interrupt, SMMU fault will be observed as there is currently no
mapping in p2m table for the ITS translation register (GITS_TRANSLATER).

A mapping is required in the iommu page tables so that the device can
generate the MSI interrupt writing to the GITS_TRANSLATER register.

The GITS_TRANSLATER register is a 32-bit register, and there is nothing
else in a page containing it, so map that page.

Add new host_addr parameter to vgic_v3_its_init_virtual to prepare the
foundation for DomU MSI support where guest doorbell address can differ
for the host's. Note that the 1:1 check in arm_iommu_map_page remains
for now, as virtual ITSes are currently only created for hwdom where the
doorbell mapping is always 1:1.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
This patch was originally picked up from [1], and commit description
loosely borrowed from [2].

Example SMMUv3 fault (qemu-system-aarch64 virt model), ITS base 0x8080000:

(XEN) SMMUv3: /smmuv3@9050000: event 0x10 received:
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000800000010
(XEN) SMMUv3: /smmuv3@9050000:  0x0000008000000000
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000008090040
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000000000000

Example SMMUv2 fault (AMD/Xilinx Versal), ITS base 0xf9020000:

(XEN) smmu: /axi/smmu@fd800000: Unhandled context fault: fsr=3D0x402, iova=
=3D0xf9030040, fsynr=3D0x12, cb=3D0

v10->v11:
* add Stefano's RB

v9->v10:
* map vITS doorbell to host ITS doorbell instead of always 1:1
* use simpler addr to dfn conversion

v8->v9:
* no changes

v7->v8:
* no changes

v6->v7:
* add tlb flush after mapping
* style: update formatting
* revert back to printk with XENLOG_G_ERR

v5->v6:
* switch to iommu_map() interface
* fix page_count argument
* style fixup
* use gprintk instead of printk
* add my Signed-off-by
* move to vgic_v3_its_init_virtual()

v4->v5:
* new patch

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.h=
tml
[2] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/623=
2a0d53377009bb7fbc3c3ab81d0153734be6b
---
 xen/arch/arm/vgic-v3-its.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index c65c1dbf52..bc738614bb 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1445,11 +1445,13 @@ static const struct mmio_handler_ops vgic_its_mmio_=
handler =3D {
 };
=20
 static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
+                                    paddr_t host_addr,
                                     unsigned int devid_bits,
                                     unsigned int evid_bits)
 {
     struct virt_its *its;
     uint64_t base_attr;
+    paddr_t host_doorbell_addr =3D host_addr + ITS_DOORBELL_OFFSET;
=20
     its =3D xzalloc(struct virt_its);
     if ( !its )
@@ -1478,6 +1480,26 @@ static int vgic_v3_its_init_virtual(struct domain *d=
, paddr_t guest_addr,
=20
     register_mmio_handler(d, &vgic_its_mmio_handler, guest_addr, SZ_64K, i=
ts);
=20
+    if ( is_iommu_enabled(its->d) )
+    {
+        mfn_t mfn =3D maddr_to_mfn(host_doorbell_addr);
+        unsigned int flush_flags =3D 0;
+        int ret =3D iommu_map(its->d, _dfn(PFN_DOWN(its->doorbell_address)=
),
+                            mfn, 1, IOMMUF_writable, &flush_flags);
+
+        if ( ret < 0 )
+        {
+            printk(XENLOG_G_ERR
+                    "GICv3: Map ITS translation register for %pd failed.\n=
",
+                    its->d);
+            return ret;
+        }
+
+        ret =3D iommu_iotlb_flush(its->d, _dfn(PFN_DOWN(its->doorbell_addr=
ess)), 1, flush_flags);
+        if ( ret < 0 )
+            return ret;
+    }
+
     /* Register the virtual ITS to be able to clean it up later. */
     list_add_tail(&its->vits_list, &d->arch.vgic.vits_list);
=20
@@ -1522,7 +1544,7 @@ int vgic_v3_its_init_domain(struct domain *d)
              * base and thus doorbell address.
              * Use the same number of device ID and event ID bits as the h=
ost.
              */
-            ret =3D vgic_v3_its_init_virtual(d, hw_its->addr,
+            ret =3D vgic_v3_its_init_virtual(d, hw_its->addr, hw_its->addr=
,
                                            hw_its->devid_bits,
                                            hw_its->evid_bits);
             if ( ret )
--=20
2.34.1

