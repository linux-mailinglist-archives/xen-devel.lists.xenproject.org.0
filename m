Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD3AC6550
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999015.1379689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpk-0005P7-JM; Wed, 28 May 2025 09:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999015.1379689; Wed, 28 May 2025 09:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpk-0005NI-FS; Wed, 28 May 2025 09:12:24 +0000
Received: by outflank-mailman (input) for mailman id 999015;
 Wed, 28 May 2025 09:12:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sgde=YM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uKCpi-00059a-Qq
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:12:22 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc5baeb4-3ba3-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:12:21 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB9PR03MB9709.eurprd03.prod.outlook.com
 (2603:10a6:10:459::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 09:12:17 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 09:12:17 +0000
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
X-Inumbo-ID: dc5baeb4-3ba3-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEtRd6Gj4QlKRM7jyTX9sNrXe4sLnRQpDqL1BUX1nhGohEXVyZdkIA+f6/eam2Kbq4yStI7vUZ85+KVTsu7giP9Xy8hXF6Yc9vfRIbG6gyJELIjzI4yZVz8yPo4JoejerUOU3kalZ2zpFOVgSdkWPHWy0cEsfSyHVXb8LOPRvFTNApwSIxg9fHPwL0HZBbZYTqwVCJ5rWg748A+VEgbBOXjVkvlTwQ9Tmdz7SYMYikS2ECkw/6pDWxclmK7XTfpm3k+B4u1jwTFMh5cytghF33T6GZaJ0mkXPgdh39VlPfqWTOdljze8bYkTsw5paXvbuNqHYV6hsHKR55oez5g8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW09ij8yDtDHNbRk6iUPyTmNx4K+9cPqlktw8aDZDTE=;
 b=OwXBnl3L4BBRNpbpwKa9aONlmR0VTaYBAFHcXtZql9VMM1rzp3BL2zZuyeQNfhU+O/U6VVINnMKmkVnFQ+Ki2yFesy91+F0IS7xaAHC55sQ5yWlMHln7FcQmzKk54PeMTtcmdUcE42pkp6kAghT6ElYeV1lV1xHAgvbtFXtsPFjAv64P7yml4XVbzjfgG8XS8nYopwyl5Nf728bGztAVff9DHbjyUc+B6LOtbaka5ufHY1k2TACVZbU8uqc2S2rcBMFBdNX4HodJcUzC+yql/5wjUkgn7rubz0qnvf1LB2lSipXRBs3hr/gng0d2KdELxMPRvygBvsGJ8apcYSRpwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bW09ij8yDtDHNbRk6iUPyTmNx4K+9cPqlktw8aDZDTE=;
 b=X9Xp23zn9nxyQtIHTY+oDZWRE7GrqCRH/kXqYHjlpviLp6gsi52xqySC7aj1szpWeyRsD+0Nbdy4L0bCT3MbwIEMwzzYzUDpf5MLdOk2nTSQqGWGtzGGc6N1e81xfIkTtBTOfUnoQK4suva5vZ++/azWwXn1JNoZIet0tu8SvCbRHMexOuJSm/hEysIqU6yPptOaJZzBHZOSAysk23VWLLSh17vSgMgWg3CkBwLFlEygaEJr+UbPhCMmOzZyuvAmFXU0oBLP3etTRselTXplnmpncggtETo773RfQ7PiWR9xgO+WMjdc67Drf+ng6HQTkyDa2GENR+3XUXuoxZpFUA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v11 2/7] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Topic: [PATCH v11 2/7] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Index: AQHbz7CbWtgUmPL5TUS+FvDNVVe4iw==
Date: Wed, 28 May 2025 09:12:16 +0000
Message-ID:
 <a46664a0a5b69bdd7bc52029eafe1a64b3601ba5.1748422217.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: c98dc491-a5aa-47af-41e4-08dd9dc7be86
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?B4nvQOnWMgxK75Aaa7rXHtyjt7VyfQrXQfbFCbD3hdgBXrMkcC2QF38CbB?=
 =?iso-8859-1?Q?zvG1YCae9/1PR06dIaS+qZ9pgK03+IFb4nLSAi9AznYE8kw444EQTcSj87?=
 =?iso-8859-1?Q?NNjz1R77hamS8Kpo3Kwf1cze105p7SNrWARX8l6O/CImL+CbrCuLLOTdue?=
 =?iso-8859-1?Q?faE0Tso5rcJDIEBsTw1lg9zXabp+Jiv7vwHhRE415GcRlSO9ONbaVaTXS1?=
 =?iso-8859-1?Q?wsSf6zg0MbfyMS/kQA6kPTV/KFfUK1RYnX8CNJdFmxLdmtJttq6ae0Ic1f?=
 =?iso-8859-1?Q?fQc3uWuk0fpcNtrqkHR0+KUYVOn1l9i8GHacVF4oEBwvKNrEQeGTGjJ6t8?=
 =?iso-8859-1?Q?uqtKsDlvO3ycLzTzrLWKTX6PhFfHU/EwfnCJBX5YpXxGsA/RRknbk8y2Ur?=
 =?iso-8859-1?Q?ca1cApv4nlJUBWh7vGeov11F/7QjN5KU656vdIl5Cgg8OG+UDApazHdThH?=
 =?iso-8859-1?Q?pI6epXRX3p7Gpm2AJ3Byy/rRa/yvS16brzoy287/QqNlNNE5uWIS4j6MPF?=
 =?iso-8859-1?Q?OSej46rL9XgNNMFg9cSn7uK9S3qiV1VL6eSp7440D57OIKSNqmDKc8xeci?=
 =?iso-8859-1?Q?vNutf9yIpyq9+asBsxLS128iD4RbPhLTJzAKxkptnuLC0WMWOUyvm+p5AQ?=
 =?iso-8859-1?Q?Gxd1Saje1Ai37vWCH/hwqK5suRcGuI2BatsyVhvAI9jb+AsKTfYYGj0dwj?=
 =?iso-8859-1?Q?aF6vl6I3rER2ZM+TjVkat0KVm2VT+3g9oBOYkt0gwYym7vrx46qcAoV87o?=
 =?iso-8859-1?Q?amqT5lWjahY+LmyVAnJFbfvwEytyk8e+DQxIXewV7Al1D+zGfBNpgjnvVZ?=
 =?iso-8859-1?Q?WpsVOMjYXpAKMM/F6caAA367XBtct56nWDlh1w0iD47WVSIrbtRoUkLlaE?=
 =?iso-8859-1?Q?3HcQjW6/LxuZ6zOotu2M4IQDnOC9HWznuUZ99WhroXUAdYDEVdgyM1o80B?=
 =?iso-8859-1?Q?sfFJh2wWVYbDsnjOwf8frYR+Y0JE4iZYfiLZi8526S5dHb2IulnLP6B4z0?=
 =?iso-8859-1?Q?MPoojXpzbsA/l03wWVd9STjAtQiWQ+dM1CEVxjwzEw0iRjHJmV1Y//w9Bp?=
 =?iso-8859-1?Q?9EvEcvN5whFelES5DX2k9srcD2woSELJNZaLnF5LsyeIOodgsaYUnsXVpG?=
 =?iso-8859-1?Q?xCCayncvZmKMFBxbIkr1lODMs/RuDHHmuWHlmHXGimDxBf9MK7gAv0Bb72?=
 =?iso-8859-1?Q?tmZndy+fJmbfbrFxck9+vcvwRwmZYpvGZ/09oTMZHLpzLEcq85n3SNYmjy?=
 =?iso-8859-1?Q?odoaDL40CB6/He29XaZV6dk3Kqg5DxinszX4Bc87MrQigoIqLl9Cc1VBwS?=
 =?iso-8859-1?Q?Fwl2Y/ZjyZ4Poh15wAiMahLlNC03+/Z6454KTC4aWDri+SnjUk+SP4UlFv?=
 =?iso-8859-1?Q?xGUuW3jPbRf3uxFpoi3QJpp1dRQNTHdNrGpnmzr7T47fp6dL0c8hwf32aM?=
 =?iso-8859-1?Q?vUleHKMzohGrYaBKA+7hJzlOSETni5/oSdyU2dTmXIkLXqwZiObD+H3KXW?=
 =?iso-8859-1?Q?Ay/xn5DOfPpXJGWWdbJ3Be+s6wjZkLbp1/LZV6vXqxy7Kz87vPnZjF5Yml?=
 =?iso-8859-1?Q?6CBlC5M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Xnavr1p3tSJOB42AElEeJIgtGAlvPrB6Ou5uI6QWJxfNwjhjQmgkl2F2jc?=
 =?iso-8859-1?Q?Vij4oOT/MY0TVCJ3FzUkaT56KusVYl6PrvQNmbvf6CD03PuGr5PyJcIRFB?=
 =?iso-8859-1?Q?9PECtgKC9QZEkKPfNg76QzY2yvv710/rOVL9olSCTHOAbNzMJEsfjyf+TT?=
 =?iso-8859-1?Q?aCtHbPCNC+778LgFR2HScktN6/06F1O2kk/tWM64xp3kZiVgghQvU8/HZ5?=
 =?iso-8859-1?Q?liDnVTYXwYcOopQtiKiYYbgl4LDy45F8hIGYP3I8f1hwgAnyDgXCyR3YTA?=
 =?iso-8859-1?Q?hYgA7j1XG9QpwL4Y+kpEqnZUB8jOSMLFzhbLFEqGM4ygEGCmrFD2PL3/b+?=
 =?iso-8859-1?Q?yUnKIPUHTSsvS6eUjoA9NGQOWYQq4ttAtWvME665ocLmYCNcA0jbe+bMZ4?=
 =?iso-8859-1?Q?6khVqLEhs1h2X3iaWIdkL7p9t3JDDwIvPxww1U7tTbxuEND0ceRB/p00Gi?=
 =?iso-8859-1?Q?zTY8LxfLMoE7Mlwu64b1b48XN/eK2ITXBgO1xzCvqPmJrAVX6tL9BLMRA7?=
 =?iso-8859-1?Q?XCwL/2edRpqCdMR3hJH8REp6r+VUEao3bT8xXB+uQZRNIoIsParO34Kgkp?=
 =?iso-8859-1?Q?W1iDf0hXkebcXf+PzHLaUbJ+45C+KQCei7iAAToreknM7gItuppIjThRHe?=
 =?iso-8859-1?Q?9J1eXjX/K0Bh/QWc61q15sPuU/3NcePE13sBotzh4f8hSigTicEWZG6WB3?=
 =?iso-8859-1?Q?p3KVoQLxq0pSeEwRugM/IACB5rHltKWvtN5i9ys0T4+RYW3V+v4S+gG2QM?=
 =?iso-8859-1?Q?G+x8PD47xLH8VzLIRByJi9aun9wJYWMCu9TyH3p6cTyfFdo8RqBQkHlRWx?=
 =?iso-8859-1?Q?KrB6PgnhGYsH7juebNTD2NgAGCxH/fuyMXr9EXoZynwUnH/FOXTN395fZN?=
 =?iso-8859-1?Q?KSYlWhRJRFpv6ft4wBQQd8jYAC/L3jQ4uTSUvFNsVnywiQrhXFVt0FrYBn?=
 =?iso-8859-1?Q?jkpMd/YzubTRIOKK9TgQsLAA6e/5AYdCUDuqHgbn9itRzsWmTPKa89Z3e8?=
 =?iso-8859-1?Q?UwSiJqbnvLkhmBDOUoijKpEDhnbx0vypGwJSfRUK/FWBah0T3BFgeRT3tk?=
 =?iso-8859-1?Q?bij97n1+RfFmz/8LxPnLqeLCtM8dZt4CLsS6qZJwiEG2UTpknhTvKU66zY?=
 =?iso-8859-1?Q?JPq9eiAldzHNjbT6OAGpOZ/QupvfcrnX31D9pZy1My07XqqGz+KKjtyS37?=
 =?iso-8859-1?Q?w5OaSRcWqH9WTchF3yGROePGZYb19Y/5hfADecPTFJHVBL4HWyXkLswcbZ?=
 =?iso-8859-1?Q?Otc3h1KwEjV1zK1stoX73RywgJYu4oBTpX+pXFz3R+X47M4DurnQ4p8icE?=
 =?iso-8859-1?Q?LhZuHM5tbVoPY3wDcCG+VbXTSYdyhm5dYJOsbVzks+0lfMVVoyBYrxE7gV?=
 =?iso-8859-1?Q?+hboMfsYknQ9wrqEZ8x+uhj/cgrC5Hs9ZrDG+1iJDXpCRMdbuizsuakJ13?=
 =?iso-8859-1?Q?+rbLJx8Eupdicsc+s7iqWVvfBf6cBPlxuFg1i04VFkRoX2NC3bJmQZ3RiB?=
 =?iso-8859-1?Q?CIefKvBiJNwqWa7fPHmb1TPHHW2aF20JZsrDOQrBxAhvnlkfbvPbYJz+3B?=
 =?iso-8859-1?Q?9rx8gsUB+Z1LQfWxPfswwqKl+onDBJnPEgJbDl1K/ZHzx/q8NaC6yee4Qe?=
 =?iso-8859-1?Q?n5M4d87zkzHydwsmXPGst6rKoR3znn48wQkVLW+muihG3yCuZcKV8JLw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98dc491-a5aa-47af-41e4-08dd9dc7be86
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 09:12:16.8151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XqZNdbhDpwnYXllg2pi7t85ojxA395oDVTEGX1RMfssUS2Ls4kOzUgSO5jgtn4OdE0KZ6/feVzIfRmU6ttp/TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709

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

