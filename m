Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD36AD6EC3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 13:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012878.1391397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfvB-0003YX-8p; Thu, 12 Jun 2025 11:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012878.1391397; Thu, 12 Jun 2025 11:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfvB-0003Wj-5c; Thu, 12 Jun 2025 11:16:37 +0000
Received: by outflank-mailman (input) for mailman id 1012878;
 Thu, 12 Jun 2025 11:16:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGhi=Y3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uPfv9-0003Ie-Kg
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 11:16:35 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2d16bd5-477e-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 13:16:34 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10784.eurprd03.prod.outlook.com
 (2603:10a6:800:262::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Thu, 12 Jun
 2025 11:16:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 11:16:21 +0000
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
X-Inumbo-ID: b2d16bd5-477e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADAuQgNA5rxQJyf6nz96YsB7UH2GLqcCiYOM/0PaXWsE3xoKe5otAbeynLz548HCVximD0dUKkiA5pdsq74bcNtF+vtCb2UUYwmM5W2QehEjGqUmJWpYTzV8052bEQ3ed59mRF4q9is+MGxns17w/dICS/UFbxogj9JaiGbXTMV0PKSaZVaewYvZAsxF6RD5WMtj+DhSBt+6RAuQNutb9x9q11uUvL8mnPAj2h3RYyu3FP4agUaO71YWwfnMXyGyBn991WzKUlbipeB9IEGtGWBR+YKBZ+VbTCQs9PRkiW5RRvneFDjWBRobNw57zbHB/hjc8dkLsZy+YepAdLhMGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzXvj2JuD24fqznd8IDEh0oZUbY/zpRj9p3MFbrJ02s=;
 b=SHHxg3E8WDfmtPOVbwwRU4D5mXsFRuad6d/lCNVNQkd7yZOfRsfTy6dGgNfHeOqzN+q3kcTW753Fdf1IZevwmJsAqmgNG929C9X3kzagtpfsTWs/62TIgoxzWCqZ1jmw99I2S1GkfJ1rwjc4bFS7+TEZfo0HPCVrVg7kJXoLyepu+Ng1yjZ1Xw7HVwJH6s6gUbYF76YHqqD5lIWT6WP5aSnY6dYatwgKbIFMF6H+H4TUXMoo3sgi2G6avAacXIOQQN5hULfGlBHw0I2M/gDjdtlLYVkpDIPmIDJKvuLb4QdaAXrmB7+aI8MWQWiypigda352OR+ooBQBNuJp0VpIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzXvj2JuD24fqznd8IDEh0oZUbY/zpRj9p3MFbrJ02s=;
 b=gKZmoa1NRv/rolPJpUE7iUji+2fiHSXw6e2ac/TorY5yVSjDCIuOS49dI4PvwcgzhTDQcMr83b8HUDpLIsP4+qqEPf/I92r6Yfu4W0A+gvWZzArF0GxNoIhTas7v49DNLxhQz5K55PbhLs3gH/l/xC40f6H+eHJ02Py08M0XOgHW9JQIOdVNn1Kc026l5Uxlc1mlnz6UNdmSU/aXDqhaDkgFBHfdTvF7zYaSUlT/buvUP4v7+I8LJOkBs5eNgu8kCJWUSxBzf+brgYcOhDbcKzzGl6/EmSbT+vHOmbfC2Yw/NaP5AAGKSUzuqOlIpRsg7xTvEV1gIuO0UATqFvE5hA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v6 1/4] xen/arm: allow PCI host bridge to have private data
Thread-Topic: [PATCH v6 1/4] xen/arm: allow PCI host bridge to have private
 data
Thread-Index: AQHb24ts9Pkj/p3l80mPyHDDabUuhA==
Date: Thu, 12 Jun 2025 11:16:20 +0000
Message-ID:
 <5c499d459f8d426a395e973f429d542040e16db3.1749720912.git.mykyta_poturai@epam.com>
References: <cover.1749720912.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1749720912.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10784:EE_
x-ms-office365-filtering-correlation-id: 9353f9d0-a90f-423c-c47b-08dda9a28f48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?x/HZeJlaisJo8rpQH1XKqdnZ33bHS2ukRDBMlinyVeM7l1naSUiHXH/GGD?=
 =?iso-8859-1?Q?2heb6JQiYuYuAcT1DmHKCLwcFJKvGx0drM2WN5gaFAYW9SSFFjj2cWWl3w?=
 =?iso-8859-1?Q?9MPN1m0Se5EtRdxkmLdjRArqMOn22Nw0ZmDVziB8iXazhZHsRAMxRtodSw?=
 =?iso-8859-1?Q?7Xwrh2Uluhngelz7d67+qaJ5v36tbzZ4lNtpNhEiGrB9LsxP85x211ZYe6?=
 =?iso-8859-1?Q?QFqQPB1i7BYo4d5yQCRjJhSHSqtCb4il7Hp8FQd6oBAEXzjKXcrmii68Lf?=
 =?iso-8859-1?Q?/I0KA0a7Bjf6R4vOcko5OqR1PlxkAJy7OwiV9VA/5lFOLBoi0M1PDxqZNF?=
 =?iso-8859-1?Q?MC9anjiH8WHKI5DgyszOQX0Vh8Kq87Qwdt8qMU1LRS6iTQ7slafKJLg/oM?=
 =?iso-8859-1?Q?nYKL7SSXCZnE2X4LlelcEAgoadDfNUL2h9OGv6i+H+Bkx2rMgR7NjRephw?=
 =?iso-8859-1?Q?YLxpxH08fh89TUb2oU11qMIRhMFTmJ4knmVXpU8t/KNhfxV9NF8iTI9d8A?=
 =?iso-8859-1?Q?CTV1Eeq2A3OZmi3ma8PxX0GP+zhU3y2VrO+B0ZlMC2Ml8s2ID2QIK/aiI7?=
 =?iso-8859-1?Q?wKY/zza8/ryqwmlQfwOdCMfnNC0Psz7L7f2ibNobvJENVnYRQU6zIAt+cI?=
 =?iso-8859-1?Q?0PHDl5pWa2Amdgulbn6pYpY94cOtLWg8vKX3b3fg+dNZWDye4TtahsDwnp?=
 =?iso-8859-1?Q?QBq2eyjDAvYx/nEwxI0Euf1pqW9ifSVksO6OwIyFRItbRzD+8V7QtQxLjd?=
 =?iso-8859-1?Q?OM9B11/vCjinOlybUE3C3M4NU3ugUUV/4/akf7cxtwBIO64cUCvKzdL8um?=
 =?iso-8859-1?Q?C32gO2ksFho+zIkUKwsxvNxmlBWOiAc8TNlQ6snOy5IA174gATC9pE2RLt?=
 =?iso-8859-1?Q?aOFmjp7YqBFYSHW3zD1QuOYbY8PmAbnAKii3T9QvNJXmRcoTlVjmz/lpHa?=
 =?iso-8859-1?Q?6xa4xrGgsta/BJS3qBzKB/14KzrmzV/hITLghzSilwOl1BOi6Jh/QVIIU3?=
 =?iso-8859-1?Q?Nl1t2E9mkA81hvG36SYAAVVaZWuSPPNBL+g68IsGOUNCe203SHRWnOnuFm?=
 =?iso-8859-1?Q?4mDVCCham5r/H0YgLQcO1rhUrmJyzKSR69WEHlepXWcB7mq7cAuoxKGCr/?=
 =?iso-8859-1?Q?tSf0oG/YvgoUM6RwK4siCOHQmwyDoofF15eZ+xwtWaPBJiCrtA78RPEImQ?=
 =?iso-8859-1?Q?DpzSCJFcOMcBeUXkQ3Wnz8ByT34nhz0VGoiD+OxJJosmxLwPgMLS+xlk9x?=
 =?iso-8859-1?Q?GKlmrbmMoPvHll5XB37+uoJfcr/8EAA4ZwTHPu4/JCcghqJf5r0438kjQ7?=
 =?iso-8859-1?Q?2cUXAgY5QJ8xMpX6fk7CljdTvEJdNTjIwR/BujyDYvt0DQPllDewhbY5DT?=
 =?iso-8859-1?Q?avBEklEOg2GlAvBSHbfxlGIqXsIoym049eX2D//lalpVBNu6EyzIUxXePM?=
 =?iso-8859-1?Q?pQtOpM345YT2yeoKfU6pZjYOlD4FGgja27LRbaI494AD4YS0ykPfIYZTok?=
 =?iso-8859-1?Q?sq6DfeLrWOtXeAnUsFJE4Y8k++sqtSIWCaapw/XieEDu4NbvYlrWGZ4POD?=
 =?iso-8859-1?Q?tB8KDhU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mKlQjHtIEkpIr5lxWek5ROHRNTwC+JlydlCFCFEu+8vxi2H0DwfD9/zobx?=
 =?iso-8859-1?Q?dKXrwFTdDBUIqgSwi9dhT7/4so7nrK8fXWnXg+X0oxOfWG2UwuM91VvmKp?=
 =?iso-8859-1?Q?Rp53sxaXteMPBPOPcUAUdY3RFY0M9DFdNPgkuXAC7yG6d8Zg6hP1lbro/g?=
 =?iso-8859-1?Q?WrLX/aHlMjQ+lCRep4pQ1xZ/b2BpmcDdPB3UOtbLMBpvNGS3ALSAwn6WPu?=
 =?iso-8859-1?Q?1jX7rGj9Dss1XsWJ/sKKqH8gucCTySHNEn5JXFB/xpIJn+GBosve5bLmT/?=
 =?iso-8859-1?Q?JVauAgY2x0FXndkTzRrUyTCM0v67DPvykO1dbBRfPYDWmtoFAdokdIFT4f?=
 =?iso-8859-1?Q?El8O6CoQIuvflS6GpXnIuxKacndbZduqShY/h9zhEa8TCJKs+P/+1ih+Xh?=
 =?iso-8859-1?Q?w1Xqq2ud+fEPBdFbOx1h/5tHA4UWCXL77ROI6SI6aNiWd5R31WX5KcDI6n?=
 =?iso-8859-1?Q?iwdybw9W/HU9vR19BGq7ewHJRF9ZYrt74zrIy1NBs5zhE9989KQ8ky+iW4?=
 =?iso-8859-1?Q?UAk9CO+8oi1UIXGMpZB2lg5CMpcf7KjnFxGBDag4mPBVnKlFLoAqp/OvoB?=
 =?iso-8859-1?Q?QOukpg2lQKUUonSWM0Vok3i6HUfz1YoXd471QSZdRQrbdRaMidGL6GRgoE?=
 =?iso-8859-1?Q?+lQuyAD31Mb6tsGD6mM//ZUVZC5AV8B+nFa/WyITibAKu4THHRu36MCU+W?=
 =?iso-8859-1?Q?fma8NP4pyg8ZSO2pP/H9w59XGm0kjQdMZE5XpNwxiXA/Kn7Q6LEBR23ymU?=
 =?iso-8859-1?Q?vmUhOdkfKjIZ/QsJTQCtDkeGjXEYq09M5hyh8O7AABf7kzBlhCudDdjwlC?=
 =?iso-8859-1?Q?vHSVgBm44dNZdYkSH9S0SpM2Gy8iqBN96hB+47tLlAyVj2r9qsv6VswqzP?=
 =?iso-8859-1?Q?8++pdVNVtjn5Lp6jR9uSNA057R3baQArJQUMq5FcGc55jVjCE9SeiBKMh+?=
 =?iso-8859-1?Q?FNLW+pZiFS36XK//dxfOKzdOa6EcQ3TCcIGphNfm2QKTbhby4uzrDDBlpa?=
 =?iso-8859-1?Q?6psMpkbT24t8uytyOkmG8c262hS0HUTQfvDq6UeFij+I4M7zqaBsW21Wtg?=
 =?iso-8859-1?Q?JdogRpIKZzrvNUxkuB+iFiHKSkuvH+Ou5ZGNWYYVMk4f9wdrFvQkM6CXWs?=
 =?iso-8859-1?Q?w4dTgyAMMDB6etjpRW6t+ajxVBqsdbmA/H5+e4YmvkjHZnoOog1rg9KB+2?=
 =?iso-8859-1?Q?y8SuXFTEVzfQTTU/ua+8Hq/BmqtP57lfNm4uoBCbaOc9S4Mxa0U9TvP55v?=
 =?iso-8859-1?Q?5yIbL7cyE7rLLvm3ZG4Yi28Cvw38cVN3SjR+EORAleSCkd9zBIfNlMv8uJ?=
 =?iso-8859-1?Q?/3xiW2sy9KUKfnuGHL6P73aq5L42Q3FQAAtdlqVewIF+R/Y/wzwqxkkbkC?=
 =?iso-8859-1?Q?hRVq+AQ0gZP9/6XPBmC73Y2mR87LJ1cNGcMkuNWyTDqY7G7wb+Gw2ToBqD?=
 =?iso-8859-1?Q?uHwpTuPeHeRXfpk2t+P2NXQqP54YH5nhnjREsSAxCGwmd/8G1uEtoUVAn3?=
 =?iso-8859-1?Q?7M8b2z/m1acLYYvAF/l4hXj7v4enAl8H69qvHgPJlRRyZiALlB5KIawE0H?=
 =?iso-8859-1?Q?ycR+5KPnVDwdW16+cQpi5/P1/M1HAcHV6qRluR2pfUbAHMgrLxNHH684ru?=
 =?iso-8859-1?Q?K7mF26Q4NyaS9c6MASteOqbSPMHBPHfNKUs+hoZkyWGbfZDUS/p9YzIA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9353f9d0-a90f-423c-c47b-08dda9a28f48
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 11:16:20.7140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: njgq4xkq5ytRcNXSdbAgxOlt2XssmzTeL0PQblTcBhGOuoFhUJOka+1P9Gsq4gJnqcnIg3yYPUepuDcrfjZgHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10784

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require private data. Add priv field
to struct pci_host_bridge, so such bridges may populate it with
their private data.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v5->v6:
* no change

v4->v5:
* no change

v3->v4:
* Added Stefano's RB

v2->v3:
* removed priv allocation from common code

v1->v2:
* no change
---
 xen/arch/arm/include/asm/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 1605ec660d..b7b2dc7832 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -66,6 +66,7 @@ struct pci_host_bridge {
     uint16_t segment;                /* Segment number */
     struct pci_config_window* cfg;   /* Pointer to the bridge config windo=
w */
     const struct pci_ops *ops;
+    void *priv;                      /* Private data of the bridge. */
 };
=20
 struct pci_ops {
--=20
2.34.1

