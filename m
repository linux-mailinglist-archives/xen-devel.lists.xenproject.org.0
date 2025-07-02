Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA5AF0C3A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030260.1403911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbh-0000zG-Hb; Wed, 02 Jul 2025 07:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030260.1403911; Wed, 02 Jul 2025 07:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbh-0000xK-DY; Wed, 02 Jul 2025 07:10:13 +0000
Received: by outflank-mailman (input) for mailman id 1030260;
 Wed, 02 Jul 2025 07:10:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hFQ=ZP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uWrbf-0000Dm-S6
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:10:11 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97929abc-5713-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 09:10:10 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by PR3PR03MB6651.eurprd03.prod.outlook.com
 (2603:10a6:102:78::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 07:10:01 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:10:01 +0000
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
X-Inumbo-ID: 97929abc-5713-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCLYZ5T//NQNavUWByYWzd4qFw3ldqlRjHkcvnNE+GBRdbxZZtedx0fI07ga2nljX3nDraP/azPalsNKv7VqUj9m1t9eCkSrDuxu98MpcuUSE6aWuWZpdM7FZ3r6/64yursIET328dKjnj4xjS9OoAnIFYIyUYssdivBAJPscyBBYdJ0IOyLJiGbIWcWVz2RZ+7NsKk3Pmn1UOMbGLwboQol8XVtwPHvNFAQYTxbHnxsLbXDHTqxTVMxpaVXEkln8aIyusmtlErH0YwLjOn2z5gvAJ9A5MyX5uCRG2TT/3Z3P6ZYIDbWmFieMsnqJ3jSyp/p0b0OWHNWfapJzh+a1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFMrwvdI90/S2XJkDYMV5NxiGLa7/5GzkUvafo1B5c4=;
 b=k7wSL0oT5vFJbuR3A4a7mee4g+1N+HIgAMoSq0PphNw4ls4CcWfNSszAjxf0Ikn2I+UpIbtN8R1QCIEI3KSRMRTEKoOmdlPnHRKhZRnA54q5WOzrEl+jneMAv1BKQQaU+hf+VKlXauD1NewRBc7B3U7xUj0zdFGotYiUOo0R6LMQa1e/HVkEV9haprIFI9rRPYpbKoCno6yGvpM2YLB6Lx6KaCp2H4TX1gTWuiVzgDsZKX1/rjcYZypfgg7yVXi5WahcgaUUXheE8R2XdenTMu07D0mHF/9jZeNE2ltnITuqQRUjF39N5WtH1TgxNfJQlPWktv5+DX9Ny7dWpES6lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFMrwvdI90/S2XJkDYMV5NxiGLa7/5GzkUvafo1B5c4=;
 b=ce0VOR2Q969XOThPYbp6aWCf5ehfWgcPO09tFUS78iWQEO20i4pEgmHX6AKjibn1asxRqY/dGtUqqj+gXxKRZR+LN61Q6JXORVrnqqSfGE3LU6LIKusKyjqru7evv5C7u2QBiSW6P7pcJiVVkblAEzwBhfZSND5u6N+2shi3H8DoCJ0411wubYip2gLKcZDmUR/h9x/Xa/vLWKk8xpIokXl6CiEXsp6/zXwo9W522yA4UnWV2OIcs0fBogaw9sQs/mbI2Vorf1FJA4cWY+7UFAGXiMIhl0Z0Q/n+/pb2SZMFx1OENGGbE6wPQVog4iViJm0GdNKU4fFbkkG1fWHelw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v12 2/7] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Topic: [PATCH v12 2/7] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Index: AQHb6yBTwqyznQ97DkWM9WPRfJRL1g==
Date: Wed, 2 Jul 2025 07:10:01 +0000
Message-ID:
 <1728f90377977cbc15e1e70d8946abc53dbdbe43.1751439885.git.mykyta_poturai@epam.com>
References: <cover.1751439885.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1751439885.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|PR3PR03MB6651:EE_
x-ms-office365-filtering-correlation-id: 1d99bfbe-6231-4749-7070-08ddb9377617
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?cdj7nB5NIFhCNHybt8E+PvwPN0g9f8+HUQDFs11L9hN3714UwYds9xQ+e1?=
 =?iso-8859-1?Q?vJ7tlxrOEIgKR/F85PWiPVM47t3KclyXQvH/xN9EDwofQFQEcHe7YEc2ij?=
 =?iso-8859-1?Q?bzwWPi8kjGxyLlCM3OpAKQCJuzCXtLvwnSWJCCqIW8pfdXqWBFG/qYtwnw?=
 =?iso-8859-1?Q?vgYJl4I0fhAh2wVQD5qPY+hQqzK605OUrBznrIw7+PS6mmDFAzKICOzDs8?=
 =?iso-8859-1?Q?OVpWzr3J13bvFfqPUrXJ63XYeG3qkzXKTfgvYcZHZzOcUsMu5zn+gXKXNx?=
 =?iso-8859-1?Q?90PxBHfSgqxiK2Tba8v+vxJYejq629HIeeIADOS24Lm3ywlcd0uQk/nosO?=
 =?iso-8859-1?Q?IN1S/gruQPtBn+Jd2GWvAcAUGEK1QE4O1P271FbxTDvmdTt18TVnXr3KXR?=
 =?iso-8859-1?Q?rTPMPAD9chKgJgXNeSyUDzp1vfgSAf9I/htXQToyw84/SIKzK+BhyFDkmc?=
 =?iso-8859-1?Q?gLfvHA7Tj8hFRjysk6jODG2PyKc4QE9MX6t45NwuWNQ0gVBAayiY9UJL1H?=
 =?iso-8859-1?Q?dertpkY2NgL5qYEcNstf+VUxuMe5pBJSlGvBNRBPG6b1dEZmb1vvPQN7Ro?=
 =?iso-8859-1?Q?prQqPC97jQuGrU4PNE96Tccu5C1EePJZXV8QmGXKvQYZ7Z3KcS9bS1Jje7?=
 =?iso-8859-1?Q?kjioncg5KrSe9W4Q3RRVOrfS5riYZlvvNzFHpSaNjOzwskU7ARrTp2cxgG?=
 =?iso-8859-1?Q?V+U0EWcq4+bxgoCGGHuzNq6j/JA7UnsfnSpgTw3UJnmkNt6OQphkq8f/H9?=
 =?iso-8859-1?Q?npq4XYu2EiKy7uiUaVyd3bbtv6UlbYcbRrVTgsUE3sKGjfR1dIR4Cmdypy?=
 =?iso-8859-1?Q?Fy2ttzlQ6diij1u4B3DclLVm/TQ9KM/UkOQ8Q6VibrPyrP0tek3XPnIR30?=
 =?iso-8859-1?Q?Fs2QuzXKCdTWP2fGtO/bbH0KmFnMO8IYkimB6ONuC6cMFBUc2nUAYS7Xf4?=
 =?iso-8859-1?Q?jt+JylCYY2MJ0BkpSw7zqzxE2nQEl98I9rKq3JbIkT9pGw9XbAru2vKmbs?=
 =?iso-8859-1?Q?m1PrFR+pPUqxwpdP/ySfVFRE8gsjjLX7ILFX1BDgHSREFg76NGHK5W9m6J?=
 =?iso-8859-1?Q?D8jpE+pUi2GzxkV1RgkmFHNbTFQgR9a6oLYp//BLe69amJVyQDwQGdBNpO?=
 =?iso-8859-1?Q?9jvvl2KmTWlBvHxiP2yth1asDvYEUBcSnTkga4+lnWAAZNPxbtToKbtYu1?=
 =?iso-8859-1?Q?t4WKvU4gIup1T7cnp6iUeGAWFYmPfDZTJHNyjEZhqRNcnubdblpQk02/6s?=
 =?iso-8859-1?Q?Cxl7GImH+eWEwCaeMEsFkxNq0MVomHbz3BtWKonlaZNwNetVFg/Vo7YvxB?=
 =?iso-8859-1?Q?1czYEgUcW+oiYk8QU0DQp6ek41dq29rLLnX6QsopxJSTjY4Yjc0wXkXCKL?=
 =?iso-8859-1?Q?QKW/r+OC0C6HotGFFTD5kbeoNaOqDGlyIMROSLV3tAcn/soF2slh04aoQp?=
 =?iso-8859-1?Q?1pNd5Dit+wWsBrQCqtZ2/6dl9xL8XHmp00l91J0SvW43/r8wE9hbIEqdD0?=
 =?iso-8859-1?Q?/SkPhnj4uFE6Gx26LTMnDmPVXYtZMbKQUBoEGmVu/y6B1Fva7cJb9OArue?=
 =?iso-8859-1?Q?r1LtKgA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UF1uB4kHKve0iA731HI+JcHGeQGrMRVD0feu2lyp9y3xL/C0ifie4BhI+S?=
 =?iso-8859-1?Q?fPleS7Ax2m5kpmPmnN2NGf/2q5AgjV16j7OrayR42FbZEXU7AkVAlEAvP9?=
 =?iso-8859-1?Q?xVsZ5+Wbwbh+2AbDQS9pOK2Kq2y8tdKhRQeiWN6aftxmrBqhMvFOUO+G7f?=
 =?iso-8859-1?Q?iA4w9tpWCRXFwsBjtChQcNjByos/FxC2DfhI6Oo26p9yr+8wcTdd8g4jyt?=
 =?iso-8859-1?Q?tgFIxX8VXHSrpLOC7nnBlV4f8bvrXuYj3wtg10L+wrxayJytSYVFF/oI8R?=
 =?iso-8859-1?Q?VUPtlWchi/jEliwgL3XV1ugZztVCQbjRkskeeIIGx3/wv0o/0jIeBfDpWx?=
 =?iso-8859-1?Q?FUTy04bwwE5I6MzamcF3UT5Wqjn4SPZq9gFXOJOSsbGHFHXsZtkafiGm0y?=
 =?iso-8859-1?Q?J9PLrGA34lguCYvtxKXSpzYEEiwndCKzurJk3Mj7ULTpWQ/WBv8aFgKeIz?=
 =?iso-8859-1?Q?yp/whplARvmR+fi5zHHp25s6ZBJ1BwMf+TcjgHR+bptgv6iHZGvdFvOU9Y?=
 =?iso-8859-1?Q?JVvY6aV81Ckeec6TNiEam9y7AHvo/iW3rtpJzZ0Es9ipBVbzXnDjdfPXzK?=
 =?iso-8859-1?Q?z67uuyAvTRh0JDSvA4LLMs5+MtFoCkC/1F7UGkRGVhNr3MIBZ6N5LuXd6i?=
 =?iso-8859-1?Q?r+s90I1jG6RMubkW7KyirCh/4mmUH70Lqd+WicNEhnjWhbPPcqk1TnQSsd?=
 =?iso-8859-1?Q?XJXJ6lf2zQjpmS02FyR2Hd4dZSVw22TR1n72nW0yxsEzf8oNzjgqDNdb5x?=
 =?iso-8859-1?Q?LE3RXXef31KJIHKTQqsMhpvhIQXqlL0lAvjzWfZF4KQbh371gbyO/Uek25?=
 =?iso-8859-1?Q?Lmv5f4ayF7W/M+cBkuPaxBOh0Kj3qfq4jrRFz/O9E4gm8OoBUEAPIcS9Dq?=
 =?iso-8859-1?Q?7ILjqBruW/+7oThZCXyNhVYSrx82hLZ5bIrfbb76/JSgSUrum1j1nFUn7c?=
 =?iso-8859-1?Q?gccKO7v7WFj8i4u3y8yd01EffelWWsHRDvFQddoiA+mCXVifXkWp09n/Q/?=
 =?iso-8859-1?Q?vlc/rKFSf5g8ESq3+vSkcJMVLOg4YAEj9g3hupfDXlN1U3Pxuzw+CTs3YB?=
 =?iso-8859-1?Q?DkVb+kPe78qoVxGNS5svPECiyLKEQG/gVYhFbYgHO3Fi7ouJQgANZdgjUB?=
 =?iso-8859-1?Q?WaUV/NCd+ZblBoSs/MjxwZ7qwJq/t3EQj5a9JF4dwsMfnp/35gatx0pXvI?=
 =?iso-8859-1?Q?8grotwVp6zQf1XBteYZZHEwRt8y3ZOT+NtxjFQjNnJED/KYIofh6/Nv9MX?=
 =?iso-8859-1?Q?wVGLyXBpW/nY6c71KQCjen1BFXFr669JfE/KulLfcyle27SRBvAbfaF3V4?=
 =?iso-8859-1?Q?p/tOQw46OwrNu/fK6BLjfHERo1gzquS9uGLmTUdg7y7ym+Gq6n/IoC5b5O?=
 =?iso-8859-1?Q?OVaiaibFropci5/gNmfrp7CLi68lOBz/ssLcrA4yJUvLIV+2+sswR3jaBY?=
 =?iso-8859-1?Q?Yu0dwySudZUIIEb7WG2PY8Hp3WsWAewUTSKodWccT2gpCQTvEspHk1kPS8?=
 =?iso-8859-1?Q?4BRYY9MRnyDmK9lwcizoNR83FJgra3ytbseGocUcPZB45bRn4wRi24RwQE?=
 =?iso-8859-1?Q?LcvKlgOwNAao9cTxbdaQkIaCjbRnUp7nAgevhD8KM51DyLBpbfI081VA3i?=
 =?iso-8859-1?Q?TIDjCLxgKhmZXFdIosIkulHge58MZZcbsbYA5sxFcsP+6rXfRVIx/XKA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d99bfbe-6231-4749-7070-08ddb9377617
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 07:10:01.1883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fSTXCT2cr3bT8EF8KwqapGItBCPgN+uiuLq9fpokaBW/aImmsdVaqeyQqoZgFLhq+3q9ylhOXkOuXst/CNOl5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6651

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Handle phantom functions in iommu_add_dt_pci_sideband_ids(). Each phantom
function will have a unique requestor ID (RID)/BDF. On ARM, we need to
map/translate the RID/BDF to an AXI stream ID for each phantom function
according to the pci-iommu device tree mapping [1]. The RID/BDF -> AXI stre=
am ID
mapping in DT could allow phantom devices (i.e. devices with phantom functi=
ons)
to use different AXI stream IDs based on the (phantom) function.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-io=
mmu.txt

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v11->v12:
* no changes

v10->v11:
* no changes

v9->v10:
* Add Stefano's RB

v8->v9:
* replace DT_NO_IOMMU with 1

v7->v8:
* no change

v6->v7:
* no change

v5->v6:
* no change

v4->v5:
* no change

v3->v4:
* s/iommu_dt_pci_map_id/dt_map_id/

v2->v3:
* new patch title (was: iommu/arm: iommu_add_dt_pci_device phantom handling=
)
* rework loop to reduce duplication
* s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/

v1->v2:
* new patch

---
TODO: investigate Jan's comment [2]
[2] https://lore.kernel.org/xen-devel/806a2978-19fb-4d31-ab6a-35ea7317c8de@=
suse.com/
---
 xen/drivers/passthrough/device_tree.c | 33 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index 37e1437b65..f5850a2607 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -169,6 +169,7 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
     struct device *dev =3D pci_to_dev(pdev);
     const struct dt_device_node *np;
     int rc;
+    unsigned int devfn =3D pdev->devfn;
=20
     if ( !iommu_enabled )
         return 1;
@@ -183,21 +184,27 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pde=
v)
     if ( !np )
         return -ENODEV;
=20
-    /*
-     * According to the Documentation/devicetree/bindings/pci/pci-iommu.tx=
t
-     * from Linux.
-     */
-    rc =3D dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
-                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
-    if ( rc )
-        return (rc =3D=3D -ENODEV) ? 1 : rc;
+    do {
+        /*
+         * According to the Documentation/devicetree/bindings/pci/pci-iomm=
u.txt
+         * from Linux.
+         */
+        rc =3D dt_map_id(np, PCI_BDF(pdev->bus, devfn), "iommu-map",
+                       "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+        if ( rc )
+            return (rc =3D=3D -ENODEV) ? 1 : rc;
=20
-    rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
-    if ( rc < 0 )
-    {
-        iommu_fwspec_free(dev);
-        return -EINVAL;
+        rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
+        if ( rc < 0 )
+        {
+            iommu_fwspec_free(dev);
+            return -EINVAL;
+        }
+
+        devfn +=3D pdev->phantom_stride;
     }
+    while ( (devfn !=3D pdev->devfn) &&
+            (PCI_SLOT(devfn) =3D=3D PCI_SLOT(pdev->devfn)) );
=20
     return rc;
 }
--=20
2.34.1

