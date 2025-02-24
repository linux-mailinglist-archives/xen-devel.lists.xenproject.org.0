Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CD9A41899
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 10:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894981.1303628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbh-0004tH-G0; Mon, 24 Feb 2025 09:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894981.1303628; Mon, 24 Feb 2025 09:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbh-0004om-6d; Mon, 24 Feb 2025 09:18:33 +0000
Received: by outflank-mailman (input) for mailman id 894981;
 Mon, 24 Feb 2025 09:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vb1z=VP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tmUbg-0003pb-0Q
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 09:18:32 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f403:260d::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5017b7d3-f290-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 10:18:30 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8859.eurprd03.prod.outlook.com
 (2603:10a6:20b:56f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 09:18:25 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:18:25 +0000
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
X-Inumbo-ID: 5017b7d3-f290-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuAm1FnkGJi9HVUGRz1IuuczifKg4vr9FwyuZ943OqovmzaGCEdEUOEbDG5xj9oCUhVZjBiLfTIKwko8beCZgOQR3VT94+pBD3wQPHpIHSS9MOrzXVcLR+y3SrQdtcdTcpGgzAJII9Zt6tDtslOA2nUExB9o7kys9I9doNtlKiQnm/ExetOpsycMx7iKtqW/+9QlrMcOW4tO4ABuptJovs/KGMw0wJ/xBpEj7p0aLH1h5aMrJrDHTTFMOViPimY3ukg/sxFBNTdav4dFAHw9xerUT/uov5qsyUt/SsA3Hj6nTGYzjbuc1Xf+2/oPmk37YO4lE1je+2QpM23M9Rf+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAMV7D+1eDnHsag6KRUbwF9Dqhd0IxQ+BlQYpLBU+aA=;
 b=oib6hlG8TS3xvNKf7tTbC1AN/cigpsvbPEkpDkT2BEXv4QpQZ8b+w6c42U6XAAUuwUdvXAlQUeOJSr+rGL0+OOTQiT2pjgwqcDlK7iqnrfCqbEYzK3YDAKWZ7Uk+gBH6shtn/s4pRbMqabb+3Z5afdCf3IYUAFfBenOlnXsyJlMqMZ9X+BYQXHsWBdL66O67HuZV0F0mX1p+9wg6AVW9O1G3q/+l2TEmQYfcE9fPQiCWQ5CavU9QybWqUYX/vu2H3INHoHoPcTLM5w6c4XhZA55dRx20lPMmx1OwCLU1LWxTDZqbCKtH8e9mCFF3Ns09E/Tk8UAYQFpuYPKyjTwWRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAMV7D+1eDnHsag6KRUbwF9Dqhd0IxQ+BlQYpLBU+aA=;
 b=R/aTZHzifB7Y9xFvwv0uAO5+yslD7PXhwSiq4ojz1Faavtp8wUT/GIaBwOrhz+6cd5Bp1mTOCr0HZvpLu7FvWY5frFazLQVCVc63Ymes6PBaruNd/Hu6aO6xDLqkpXa+Fm3V0gWWEmMY6QZptrgTtO59DJ25LUu8wN1BSfsaAaUaKFpKz/ABwbPPerp9wAQenY6lNyxXPuYDGXHqvX47XqyVuxsGd/qxkQhPKKFvhaJtRx9bTJerLFckH2HcmtzyZxpgRtI1Xi6IBRgp8C3ix2LUq0Rmi+0IVzN9Gm5V1+Mvluw9f41wWzW41lYvdodDkU9oBgB9D91455/6/BBw1A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH 5/7] xen/arm: rcar4: add delay after programming ATU
Thread-Topic: [PATCH 5/7] xen/arm: rcar4: add delay after programming ATU
Thread-Index: AQHbhp0PUAmh9clLH0yLO3Eb3ISwIw==
Date: Mon, 24 Feb 2025 09:18:25 +0000
Message-ID:
 <5837e6b60b413a3ea137fed1a59003bf2e2fb336.1740382735.git.mykyta_poturai@epam.com>
References: <cover.1740382735.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1740382735.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8859:EE_
x-ms-office365-filtering-correlation-id: 4adbbd0d-8034-4d45-903c-08dd54b43191
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pzv8vOut8s+A4h0rwuOZCZtiByS+U0zcLYqcDUA3P0dqf0/1s7n0RweYcO?=
 =?iso-8859-1?Q?OqhF4ddCuDwnrw069aK4OFecvzdYsQGjwavV0bsdt8Pclt7735xarr0HNN?=
 =?iso-8859-1?Q?Md0Rblrs1ar3780u16sgYecDp+qF8CJiYpnKBKzo0pC83OIjeUJeDBl/wS?=
 =?iso-8859-1?Q?iOc7X4cLHdqCM+8Gy2YH9Lsg5XtD0cSOagXI5CSrtNb3qSbg4zJHlKw9xj?=
 =?iso-8859-1?Q?xg83aOJNVlB0MRnsNc4bgPp2S7i7+exRhysAQGszvK+FVhp+GI0idUEThJ?=
 =?iso-8859-1?Q?1AlDilKJyuvy4OM3ZWYEZ3LChMof0XCyTreUZheXZWGjlJG2Hbv2ut2ruP?=
 =?iso-8859-1?Q?SisLhwHR9qdQdoXfnVyYd2NdvEWNA8ZtoT6cH+Cc+2f4vNZIOWfDGgqWGs?=
 =?iso-8859-1?Q?aihtk1Avt1T2JGmF7WPEsiqbKhmPNKmvwSgTMVAuSLIo9Fi54S7bdI8MZb?=
 =?iso-8859-1?Q?Akb1VO5s1tN8+a/lf/0WyMwxp45+ECPxmxe2zrQRgaj3hLeejEGLSG3a8w?=
 =?iso-8859-1?Q?reQ6OsdEBK3uREhtRKbTfNuXoi7aIW5aZrVxaLzONJ/B0TavH0hNJl8nXn?=
 =?iso-8859-1?Q?MJpxfx8RA1cvDAI4Yr/uAV+PylV7jBrwFdQaq8j+mNanh2sJzWtiVQXBm1?=
 =?iso-8859-1?Q?811URtjO56eOv0W3KqFMUxpCpf9gmLgi7bd/6DKqFtBeo5IjE8CVZ3EZoB?=
 =?iso-8859-1?Q?IExRV3E+DQMXucGe2kxMuNoC4JXn9/6x7W2JxqAhtwyqgro9B4JU59iNHv?=
 =?iso-8859-1?Q?1KZB99uqnuPHReP0hxBXCOcuualh0Tgx+4HL765FFJxM2Dh7t1u9Ls68VJ?=
 =?iso-8859-1?Q?jo7NBLycAAG5zSDHTAjYGp45mAJqqJxQmy08S0kjoiTKf08D6hoI3DBype?=
 =?iso-8859-1?Q?ZZEVV81W2Y/C28oUvKf0PwyGkkCIu8Cr+wZIYLJW2Es2jiatuObEj9nxYj?=
 =?iso-8859-1?Q?bOxLIG+ZeDg4XW9hUMO2nydvehXX5pvOoAYu7WEs9lt/xw7Uy9jyv0ek/l?=
 =?iso-8859-1?Q?CKlrj6P3dwxDHmgQx/GeSnHxqy61OAZ3m3pUl1ofB3+0tIaah/tZDn0DHB?=
 =?iso-8859-1?Q?kjpT3KHh2+imqrKDTe48M5hIOnd5yeUgGBpkX51BFS4Glcw33dHzpp6cXr?=
 =?iso-8859-1?Q?KDA3qCeNjejJvwnlbDavhBzlb5gVOZoj15VXpO49DUrC/sR3Q4a5Xmki/y?=
 =?iso-8859-1?Q?Ms/B+8XgLJaGP6/DK8AIjP1vD5Qke7yxB1W4dYAhmfxAOXiiiLxq5GHM36?=
 =?iso-8859-1?Q?vTc0FfhJiaP11Bl/2EGyFggal4asr+4xLW218DGtDqBAP0bP1lNX/FHdgl?=
 =?iso-8859-1?Q?wBPbCf456Ng2uIMM24H+dyaImoPNTqLkO+WMwEQsUGby30a687+IpCrvLp?=
 =?iso-8859-1?Q?MxWPBHpRN+UOmf9hKGwknlSpd8Z4BbwQLkM6m7VXVtwpip3iEZ8fIVQ7Ki?=
 =?iso-8859-1?Q?d8wNzEm1iY+9jCbx03/Hqas1Qk+LqScPafRVLQJcmIGHxy5SXnVEYpsDEi?=
 =?iso-8859-1?Q?Sww0sSSi1YSY+n1dmFKSzu?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?13vgp4AU4MtA0DMWOLZZx6lDm+X9z5wsYpvrc0XvsNG1jKQyxH9m/cxezv?=
 =?iso-8859-1?Q?LhPoDzXmGroJOzh6HAI2qXf5+7+TQIST7A42d/G/E7bL3XLyrtnxDH2DI7?=
 =?iso-8859-1?Q?N9VrIw5CyDqNcQDR148B2pXvLlCWx7hhsPQoJV6sUSl/1D0JdjcDnaNSQW?=
 =?iso-8859-1?Q?SoxHkVnz2KpC+CxAUT9CFbRXmHGz95UzWVoTb3C0IIMI2eZq9zHSG+Pg/m?=
 =?iso-8859-1?Q?lA35H2DLG8U7gPPVuuaWHUWhiZo/LqjZ4gjrO2iUxJXr97DIJtZ7noV5mJ?=
 =?iso-8859-1?Q?JFc8/F4NX8L4Rpy1olXgB2uvmuI5gBxwzJa4VKEIynDj0kqBPPWJr6sH37?=
 =?iso-8859-1?Q?oCrzTAx/+pxqRnn24gi/IZNLUz+2PgjI5PH7X90xevSW9aF6hA711TxR6V?=
 =?iso-8859-1?Q?o2FrqnmVICxS0BGCRfNo7OImsPhyYv9skJ7ostus55LhXKGCSA4rYvmGy9?=
 =?iso-8859-1?Q?QLCDQKN481LtkjHAQJ0U9irot0EVs336hnn4t4Jk9+LkQP8XVRGfvAWihb?=
 =?iso-8859-1?Q?XqNYKqA72l2rYQYfXxCSNFUc13zwHCAePjDOHM+36Gm4xQWKVGDI0G+zwW?=
 =?iso-8859-1?Q?fbQvQ6K96LNwcvW4qo5acB7CRCytW6MbWzl3lsqNJUu8hRukxoKNrQg5db?=
 =?iso-8859-1?Q?O/xyvgBxXcu2XQgLT8EuFQGuSHOuZah8sy+/kpfx+xDNNTFKldcjfzlJN4?=
 =?iso-8859-1?Q?uO8YzH92IXiyW2XI+4Fb/KaJGJuryfM/EYKNiyHcp6QeyZ4VGwKuyErGAo?=
 =?iso-8859-1?Q?05K2eZ6jd0Yx2sutmCIBnnNdD7FNM6lIw3klStKZcuvxlXzG6W4xWY9p8X?=
 =?iso-8859-1?Q?JWXnx/oTGLfgkNtFm28bxEkpzCNooS5kU3pb5IPFcVfKUMn3aO+IQ4QpTr?=
 =?iso-8859-1?Q?j7ikqRRyQhsWOxY3ZBW3L8+mKPpZmRD2BWubu1zlrMXDMy4n0fAmz66tFM?=
 =?iso-8859-1?Q?yCq5f4UbKbrpNf+9/WafHSnhnbXvZ/eriWs8NTpkZb9WnI05Ag1ftKMzWE?=
 =?iso-8859-1?Q?q++7CLgjvoDo1+5ZQaIOfSTwqQ40SkjjpEw66iFVjw7d/9v5PRfOXNZUj9?=
 =?iso-8859-1?Q?VILDX63+KVeva2WbsZkBaMlzfO9mHMGJWixjTeGlarVYX4q1JY0OkvfcJX?=
 =?iso-8859-1?Q?6XoHTWEf90NFR5teYCxSNqPAzzbnw7e3RIcVPAIfrM3/ulqv0UQh/ZfV8x?=
 =?iso-8859-1?Q?aZ79wBFqVuXAvRlw2xg1ZWATPBmLJZHP2o2COsz4zwgCudJoLDSo/+QbEI?=
 =?iso-8859-1?Q?xFardvsjaIxxEACGECyUeKiMVGcc1JrS5YiA1Rr1YC9DWZQJ5AaMB3Grbn?=
 =?iso-8859-1?Q?2xDy20rwGE4XZYm9c6LAi4yWImSx5TRgTpjhy9fifzA6tzJVQl7Dfk0Q+9?=
 =?iso-8859-1?Q?ZpzPhthme7FNFBkc30HGAg50v+2mOUxaZQwSnoWr0XGRwersV1oGhlOtca?=
 =?iso-8859-1?Q?yJQ/wBWY/k9U6CA3qylcToxJPdhCglBwVG0aH7Kxn+2nxIIG2HpO98c7xk?=
 =?iso-8859-1?Q?3cdPt9dZV4HzXAjPDTe9LF6toe0vT8Wi2rTDu0zzxAKl260TycgVGvSzUe?=
 =?iso-8859-1?Q?KjZv/pQPRewpuvgO4sYhFcm0T1YVv1J4XLaDELZNyaR8/g6FfLXjBJ/5hP?=
 =?iso-8859-1?Q?HRcjgScJbrKC1D8ujSQLDloDDa9JobdOtFbqkCheQDBnQDC/mmaLijtQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adbbd0d-8034-4d45-903c-08dd54b43191
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 09:18:25.8517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rw9UYxUuV5dQRsoastiS2e8muIw+UGvzmpNexXmLMLQhZgs2eKy0lXViaDzXydDPE0KEXMp5NzNLyIVo/cvTfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8859

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

For some reason, we need a delay before accessing ATU region after
we programmed it. Otherwise, we'll get erroneous TLP.

There is a code below, which should do this in proper way, by polling
CTRL2 register, but according to documentation, hardware does not
change this ATU_ENABLE bit at all.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/pci/pci-host-rcar4.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
index df337e3159..3b97bf138a 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.c
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -289,6 +289,11 @@ static void dw_pcie_prog_outbound_atu_unroll(struct pc=
i_host_bridge *pci,
     dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
                              PCIE_ATU_ENABLE);
=20
+    /*
+     * HACK: We need to delay there, because the next code does not
+     * work as expected on S4
+     */
+    mdelay(1);
     /*
      * Make sure ATU enable takes effect before any subsequent config
      * and I/O accesses.
--=20
2.34.1

