Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E4FA612CE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 14:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914590.1320335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bj-0004GL-JK; Fri, 14 Mar 2025 13:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914590.1320335; Fri, 14 Mar 2025 13:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bj-00049S-9I; Fri, 14 Mar 2025 13:34:59 +0000
Received: by outflank-mailman (input) for mailman id 914590;
 Fri, 14 Mar 2025 13:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/juS=WB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tt5Bh-0003qF-Ig
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 13:34:57 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e39445a-00d9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 14:34:56 +0100 (CET)
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
X-Inumbo-ID: 1e39445a-00d9-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpmVCBylXIbjNVuIP9r1xrRHGGV43UN1sYS5+EPjJyg9wwM/pego8F60D3cRVFZDE5QgAjxAaIm62HnzLA1BZCvif3JtXVmjTGqUO1u1BJHCavxYD6/54Uuo+NW7q+Sc8rCwhjJ+KprPWnC8TjTffao9NjTYokgAfyy/kv6l3X6tvNL4yfcXUksHoYR7R6hsBbhnkVfprgU+bxTe671KefEgRfwi71BSuS/u1Fcia6ImnWnk0hWajSABKL2X89v7g/gUEKJOPfQRGX7GXuL2jVG3DG8/SWJxv9/sOBmmGNoxp83Bzg/iwA8TekbvRlhsiX9qhGAB5qY/vcCWi5iXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOnvZtlfUne5TYRjtHh0jVzbDwrE6SdxYlOQRFmecDo=;
 b=d0d1UseHvepfHyBdFHgWuRLs6Zgz4poBVdQNR3jQ/PsypGrvFf+CL+E5fMLApC7jHU+ws/aZrSNfTlcXXtg6aOj78e26vIYYhnTXgErpVY5BVt4R6u8Jm/PLj0bW6roa/s30C/fH+Y32p4MkYh/UEq2yfELZowtwV/4Nk0NOf+mTy3hqlNTnAbuoufUvE7cjFcYbtLRGOzlLN546TDvgkIzYHBPUzjY6wcZ6CbYq/KsL/9+MkSx2vpt709R7a7y8psVDVmFRIcyGs/9jFmrY6zJ0XNclmvJxUlv11hj+gCDRkqub1HHk+KugaWJ4d77WOWAWd0KzTAIoUYZZMPxW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOnvZtlfUne5TYRjtHh0jVzbDwrE6SdxYlOQRFmecDo=;
 b=aYLO/3YNz1941Se8wKmk0+Dd45dZuiHLBv1wY4zJqErTQHG53CD1wTFtqB2G+yTO4UuZQkBwL6TaJGNq1pvxJbYPKgFHbJki40Ddth59Qazg4/aHskTQX/b+/pXMWI15RBYRTZ2pY7AU/jeRMXmBFkofTTvld0/81DWQro5uM2c3ecTDp3AFtNEqpzsIBD1d8CTHFQ4slsufEqeK5OZguSxkQzbN8O1ob/Izc8S3AdqMEqeQNDbRj2QES5un3Ddljh3Bg4RMMLur96xUxVuArK8IjndUVZ34Q3PeNnsrK7uLGsVYSqtk+xz7ehDCXyErBnFNtcWXyKODGXRZ0AzZgA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v9 5/8] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Thread-Topic: [PATCH v9 5/8] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Thread-Index: AQHblOXdhWilNcJfUUy0RIyqDgHtMQ==
Date: Fri, 14 Mar 2025 13:34:52 +0000
Message-ID:
 <96dd4cb828377a5a09881ddb5ee5ded1df3dde1e.1741958647.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: f99afaf8-76f7-4f3b-c300-08dd62fcffe8
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?LxS6X98BoXN8icnEmLF/CdX2rWeahP3yZrMgDGWp1KOzKyio/FDtfrzSuI?=
 =?iso-8859-1?Q?vZ40CI4+QUiLoS78c803Av1r4gyTSu1u1v54c+/84BBcEyT9M75uK38U1i?=
 =?iso-8859-1?Q?V83f3unt892/ewbCPlO8PjvC2PcbT6iH+FJSJ4aL0VliiWoXYMPlNzhIOS?=
 =?iso-8859-1?Q?Gyd9hNlG23esVeftl4ZFQ1GMZgttwEnZUlOsocyVt6rdwCJVOXweTQ859n?=
 =?iso-8859-1?Q?2CXix0+4y5jTlLQBu6CwGGX01loK96d3AvzvVB7wp6J5qSrSiHj6FTNg2Q?=
 =?iso-8859-1?Q?ijqgRWN2MetkmlPpHCH9Oa0lCgYgby+fe50r87xA4hZUTuPX0YWMmMRQLq?=
 =?iso-8859-1?Q?8kuuvw7Xo9XO4adEMx09nKNaHFXMyklU4PL7oE6Jhyu4VLKxtjPW9zoqrQ?=
 =?iso-8859-1?Q?RKeFo4Ca8+dzVbyE7tYIwfSh5dMQZ5WEpZjHtenogX0ojhNfAXejbourwg?=
 =?iso-8859-1?Q?ruVr23Gh/7HSFxFObRyihdqO68Qg7kztOVw9ABVjnBfk131h/4GaniIXfl?=
 =?iso-8859-1?Q?sAXp+cQ86sMenXdM1zl2DlSX/bt2Oq2NLbKetxy2lFCPcs3juaE4/yK5mV?=
 =?iso-8859-1?Q?6eQmoVn92Mp+kWgzpniADNEB4hBboSx/Jmc80wZiLrnfe2eyVFqVra/zfH?=
 =?iso-8859-1?Q?h4g+QoQrjMkA5cC25kuQv7sWpKEgSQsrkpUMMZQk3XSdHxHbrOIYW0kv/7?=
 =?iso-8859-1?Q?kvpI/RfRau5wqlKF9XLdRxiSKDHJ/NaaIalmvQ72wNQxg7n8dv1vB9g4Rs?=
 =?iso-8859-1?Q?FkhH7D1sI+1a+ksQ0QYKOgpWwW4yeQAiVCIQUlOKPdFOqt83mWGaxEOaZ5?=
 =?iso-8859-1?Q?4AYa76+fZ62UMVaHmwxWbsAQoH59IfAxdcOE6V6LhZidd5EvZ+t08ofUqo?=
 =?iso-8859-1?Q?/ljl2hwvwIme4i3m2bbgRn7ZR2gsAkzTmZna4RLIN+CtA6d/5OlZ+Px4Uv?=
 =?iso-8859-1?Q?tOZQnNNBOSKuckSHu2mqPk+R4vnIyPP64myM/mgD2Fmw/g1nrsncIJVyS4?=
 =?iso-8859-1?Q?v5uk3MKfXjzfrhU9P2hZx8hpPIWQ1KkHPqbr+rjP6l4B5rgX/cdi9BbfRn?=
 =?iso-8859-1?Q?QFInZgrqQD5Wv1DwzCCEQGPZGSK6QVzmG9M/EoiZpFvVL3QZ/Su2zcq39C?=
 =?iso-8859-1?Q?4K4DzIwdqPyW7YTRsVpk8m0p7yEcDyAmGfz2qUAUSdbCtjaTtQbfRUfyPr?=
 =?iso-8859-1?Q?dy2ra85dnqJgAWubgjSnW+0pqiMQ7HsHtS3Pp51DWhK69j2FZhJJljnLFR?=
 =?iso-8859-1?Q?lZPndgilKXNZ/epa+dCTwvj023f45j/iPtMWKcagoDEeeeoUy8VOqPWbD+?=
 =?iso-8859-1?Q?iexlQqCkrx/x65zVEX1UOEIMojNWWQszpvVGpeAiDgFduPdlE3vNPg0rWg?=
 =?iso-8859-1?Q?olC6SXTNH9sPkhqaFnCEE1lo6cd/wOJ/C9srtfDJGtJIRoeFS4ogwsMwOZ?=
 =?iso-8859-1?Q?sO+ncefMPD5jsnQ7NFp78E5lcdmNYDmAPySYnmAHEVm5n8RWqnrM6xMEje?=
 =?iso-8859-1?Q?BwXfzBoiBM8BVrr6ilFoAE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ImtTEcvWP5ASd/gkv2MP7SlyUYJLyOlgogdVLjb8U8zmq53L/6B/4mztjh?=
 =?iso-8859-1?Q?7GVqubkFw8gDRYkaTtr1FdW61K04qmtRdq0VeXXhq44mkFpRn2s1WDT7tm?=
 =?iso-8859-1?Q?g2eDO5qjeKXRdS1YyfffoO4b8w7BRnZj4sF8LZiBQ4XFa6IKDs2HJLy70+?=
 =?iso-8859-1?Q?60SfFIYy76tuy8eq/mprFQcjaKvjridfTcpCaUNmSXmrc2DCrPo3eI9La1?=
 =?iso-8859-1?Q?5OjMAzFgVmUo2Ah0WAxGYmPxPoE2EqtGSbHWOFhedZg1UNf5X6R4VNfQX/?=
 =?iso-8859-1?Q?bcUeOvN2LK7976LE8hiP1Umy2MTlp+Rtca07HEy9SKEZxQ4j6+RAOHMbwg?=
 =?iso-8859-1?Q?6lK2eZA8DNqNTYk8i5WvhWOVF5JnJPIPOSAYfegCxj3XtLWimMT0Vvz2EB?=
 =?iso-8859-1?Q?4pQ0s9uI4J6yoIiIQt4+tiabO2YdLQWIlMsiKgsHaDj5/KRMt7TXQ8BXiV?=
 =?iso-8859-1?Q?52+nrMPKQsgSOfagJcruuObAHRlMMwm/M1zLlTsRnLAAkAqg+3E/tFwBU8?=
 =?iso-8859-1?Q?lauTfWNnSfXqJ3q/4q2A5MCxR0djuv7pYYXQZXUtLMmdktDlRqOO8yjxq0?=
 =?iso-8859-1?Q?ws6ifR4Q367YAN2nmdB/DK2jFROUJinQUNLEB5mRc9vKWor8YR0lmFrrQU?=
 =?iso-8859-1?Q?GiZS/wRCLXX4xw06HB/fTMjIV4rQjJCQxluFaKBfFSJT23fqeXDnIS4lFk?=
 =?iso-8859-1?Q?qfVUX6XYzav+rAn4UgQ1ubxqYNE3ueHrWmu7sxq+rnSt79zB+gv34+/nuX?=
 =?iso-8859-1?Q?xkr+yWlbZyi2mhIeSM4U7KIb5ZMT9iNt5sXfdMufr4qQyR33knM8pMcSkJ?=
 =?iso-8859-1?Q?ZOc/e1FmEnBQaLhRpUiSKbCpxMUcWEa8NNrPkFWnKmWGiS6jB6T28eZ7dW?=
 =?iso-8859-1?Q?ORvKJCsHb9MLIcpZ8edcSf/XGbquHAa7OcVG1QW9Z8rmWJmF4S8Snp2j8A?=
 =?iso-8859-1?Q?oLLSZLLitfqhmXPWLfKrjQwxXP7uEEudtb+m3i5baYzfqybK5MNn7Ics7P?=
 =?iso-8859-1?Q?mqXNfSAiamCG4DvXcq14CTUqAH0Jmrhlg9nhi0jb0hNeXirYoCRzottW8i?=
 =?iso-8859-1?Q?2mWLMlCwET6DoPCBY0lvWePaSfyWBwoebxZXFF8YURb7GsLaMQ/27LV2Zd?=
 =?iso-8859-1?Q?/pf+AgiiM3w3vKOlb3YYksgBZUdTKvS/ed9uiPH1Ak3YmOGEg4m+8iWPLw?=
 =?iso-8859-1?Q?LnkYE65v0OpX8WrlzGNy4skUheoUbkA1y9d/5xo5azE073AMGkMbICIKnO?=
 =?iso-8859-1?Q?JL39ottVlpsvEvr/j2nbyvJd1TNcMw49hFODPYrtf9KEYy/zyIoQhxEe9x?=
 =?iso-8859-1?Q?53YWyR5coKsdJgHwEyWu2gUoW6VefVwqTWnZtGegpPiBGr9YI5MJJkpMus?=
 =?iso-8859-1?Q?h1c5/CYEXQpMsCmB9ch4qydmaRShPCfD0D7klfJVcqnrpXgWoUXbe/LWl3?=
 =?iso-8859-1?Q?l3MmNUI1YTRoMGecYh6s1N7RzjijKiO9ehsFJz+iOwjanV/CK+uv6fAcPr?=
 =?iso-8859-1?Q?KijRyDeVAkOaaoxD3mX5xRgzhR2qt+7ZS/g7zi4bkc54PzsCuuZbVll5dM?=
 =?iso-8859-1?Q?iXazky/eIK/BEfeeD+WTYEoS6KJYGa7Kx9gMLQoKFmK7P9MzT1t//7uFUx?=
 =?iso-8859-1?Q?5Zra/vJdhd8kabWr9+2ye7jBqlN2/c3ojIaNSUg7kR4NS7D9t1VtTnZw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99afaf8-76f7-4f3b-c300-08dd62fcffe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 13:34:52.0730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pt4DvFeag/tssF0DjfCSao0qsIVaQXSrqPsQFw6vrF1JVT+5fJ8HZymwLs0XsKKe7LaCJbw/b7R0T2yoDlxvrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7950

From: Rahul Singh <rahul.singh@arm.com>

Implement support for PCI devices in the SMMU driver. Trigger iommu-map
parsing when new PCI device is added. Add checks to assign/deassign
functions to ensure PCI devices are handled correctly. Implement basic
quarantining.

All pci devices are automatically assigned to hardware domain if it exists
to ensure it can probe them.

TODO:
Implement scratch page quarantining support.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v8->v9:
* no change

v7->v8:
* no change

v6->v7:
* address TODO: use d->pci_lock in arm_smmu_assign_dev()
* remove !is_hardware_domain and pdev->domain =3D=3D d checks in assign to
  support future dom0less use case when dom0 is using vPCI
* check if pdev->domain exists before assigning to it
* don't print ""
* change assign logic to remove reassign reimplementation
* explain pdev->devfn check
* make reassign check stricter and update comment

v5->v6:
* check for hardware_domain =3D=3D NULL (dom0less test case)
* locking: assign pdev->domain before list_add()

v4->v5:
* deassign from hwdom
* add TODO regarding locking
* fixup after dropping ("xen/arm: Move is_protected flag to struct device")

v3->v4:
* no change

v2->v3:
* rebase
* invoke iommu_add_pci_sideband_ids() from add_device hook

v1->v2:
* ignore add_device/assign_device/reassign_device calls for phantom functio=
ns
  (i.e. devfn !=3D pdev->devfn)

downstream->v1:
* rebase
* move 2 replacements of s/dt_device_set_protected(dev_to_dt(dev))/device_s=
et_protected(dev)/
  from this commit to ("xen/arm: Move is_protected flag to struct device")
  so as to not break ability to bisect
* adjust patch title (remove stray space)
* arm_smmu_(de)assign_dev: return error instead of crashing system
* remove arm_smmu_remove_device() stub
* update condition in arm_smmu_reassign_dev
* style fixup

(cherry picked from commit 7ed6c3ab250d899fe6e893a514278e406a2893e8 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/arm/smmu-v3.c | 117 +++++++++++++++++++++++---
 1 file changed, 106 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index cee5724022..9c7c13f800 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1467,14 +1467,35 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_d=
evice *smmu, u32 sid)
 }
 /* Forward declaration */
 static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *de=
v);
+static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *=
dev,
+			       u32 flag);
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
+				 struct device *dev);
=20
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
 	int i, ret;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master;
-	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
+	struct iommu_fwspec *fwspec;
+
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+		int ret;
+			=09
+		/* Ignore calls for phantom functions */
+		if ( devfn !=3D pdev->devfn )
+			return 0;
+
+		ret =3D iommu_add_pci_sideband_ids(pdev);
+		if ( ret < 0 )
+			iommu_fwspec_free(dev);
+	}
+#endif
=20
+	fwspec =3D dev_iommu_fwspec_get(dev);
 	if (!fwspec)
 		return -ENODEV;
=20
@@ -1519,17 +1540,38 @@ static int arm_smmu_add_device(u8 devfn, struct dev=
ice *dev)
 	 */
 	arm_smmu_enable_pasid(master);
=20
-	if (dt_device_is_protected(dev_to_dt(dev))) {
-		dev_err(dev, "Already added to SMMUv3\n");
-		return -EEXIST;
-	}
+	if ( !dev_is_pci(dev) )
+	{
+		if (dt_device_is_protected(dev_to_dt(dev))) {
+			dev_err(dev, "Already added to SMMUv3\n");
+			return -EEXIST;
+		}
=20
-	/* Let Xen know that the master device is protected by an IOMMU. */
-	dt_device_set_protected(dev_to_dt(dev));
+		/* Let Xen know that the master device is protected by an IOMMU. */
+		dt_device_set_protected(dev_to_dt(dev));
+	}
=20
 	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
 			dev_name(fwspec->iommu_dev), fwspec->num_ids);
=20
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+
+		/*
+		 * During PHYSDEVOP_pci_device_add, Xen does not assign the
+		 * device, so we must do it here.
+		 */
+		if ( pdev->domain )
+		{
+			ret =3D arm_smmu_assign_dev(pdev->domain, devfn, dev, 0);
+			if (ret)
+				goto err_free_master;
+		}
+	}
+#endif
+
 	return 0;
=20
 err_free_master:
@@ -2622,6 +2664,42 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
devfn,
 	struct arm_smmu_domain *smmu_domain;
 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
=20
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+
+		/* Ignore calls for phantom functions */
+		if ( devfn !=3D pdev->devfn )
+			return 0;
+
+		ASSERT(pcidevs_locked());
+
+		write_lock(&pdev->domain->pci_lock);
+		list_del(&pdev->domain_list);
+		write_unlock(&pdev->domain->pci_lock);
+
+		pdev->domain =3D d;
+
+		write_lock(&d->pci_lock);
+		list_add(&pdev->domain_list, &d->pdev_list);
+		write_unlock(&d->pci_lock);
+
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d =3D=3D dom_io )
+		{
+			struct arm_smmu_master *master =3D dev_iommu_priv_get(dev);
+			if ( !iommu_quarantine )
+				return 0;
+
+			if ( master && master->domain )
+				arm_smmu_deassign_dev(master->domain->d, devfn, dev);
+
+			return 0;
+		}
+	}
+#endif
+
 	spin_lock(&xen_domain->lock);
=20
 	/*
@@ -2655,7 +2733,7 @@ out:
 	return ret;
 }
=20
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct d=
evice *dev)
 {
 	struct iommu_domain *io_domain =3D arm_smmu_get_domain(d, dev);
 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
@@ -2667,6 +2745,21 @@ static int arm_smmu_deassign_dev(struct domain *d, s=
truct device *dev)
 		return -ESRCH;
 	}
=20
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+
+		/* Ignore calls for phantom functions */
+		if ( devfn !=3D pdev->devfn )
+			return 0;
+
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d =3D=3D dom_io )
+			return 0;
+	}
+#endif
+
 	spin_lock(&xen_domain->lock);
=20
 	arm_smmu_detach_dev(master);
@@ -2685,14 +2778,16 @@ static int arm_smmu_reassign_dev(struct domain *s, =
struct domain *t,
 {
 	int ret =3D 0;
=20
-	/* Don't allow remapping on other domain than hwdom */
-	if ( t && !is_hardware_domain(t) )
+	/* Don't allow remapping on other domain than hwdom
+	 * or dom_io for PCI devices
+	 */
+	if ( t && !is_hardware_domain(t) && (t !=3D dom_io || !dev_is_pci(dev)) )
 		return -EPERM;
=20
 	if (t =3D=3D s)
 		return 0;
=20
-	ret =3D arm_smmu_deassign_dev(s, dev);
+	ret =3D arm_smmu_deassign_dev(s, devfn, dev);
 	if (ret)
 		return ret;
=20
--=20
2.34.1

