Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE85AA0AC3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972144.1360617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVc-0001GZ-Gp; Tue, 29 Apr 2025 11:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972144.1360617; Tue, 29 Apr 2025 11:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVc-0001C7-9o; Tue, 29 Apr 2025 11:52:20 +0000
Received: by outflank-mailman (input) for mailman id 972144;
 Tue, 29 Apr 2025 11:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zRN=XP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9jVa-0008D2-G1
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:52:18 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2608::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 655d2a86-24f0-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 13:52:16 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI2PR03MB10907.eurprd03.prod.outlook.com
 (2603:10a6:800:270::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 11:52:10 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 11:52:10 +0000
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
X-Inumbo-ID: 655d2a86-24f0-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weL9sdx/oslpPBb0TbLETZJkAj/szeMQ1kPGn9iQZeHQcS4WPM/66JL2BVDx4blGDnodcCobuF0Npzk5264zHWZTQCcQTV9A3KfaYlFnS055criCFC8/sn6iAbw8jUCs4CPGuwY7v9bEAwaFKLN8s+VRugT7bnz8GvzfxhILcs4J8WJGlB8snRZ8Ajt8pmtdziP7JlQzILUY+txrO/M8fkcMI0qrhiMBESwkXaPjogjps8o5gsWbQQqIVD0vsxXblp/dHBwRpp4zZJ24qFb7AX4pqAk8FkCqAvxFgH9HSIADO/Tq49aTBcmwr/a7aQCJVNHs/F46HSYGtbpY7ccZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+0XDP9MZSidacSS96rHnJtqZQG1BjZP+hiM8PBTD6s=;
 b=QMEOebATYopj0K9u60XKK8Veoh6yYok4TVfJvY21t3IzWB/dFsnYFoIybNFAiEG3S7Uq1Hg3iKvSExuOLX5O9V4MB2NCGq60kDp1f1ehlVR1wUzjtG7IHatyXn+ThaNwUKClGvt5npLN9bNKGv3DG78AIjrpTNLFKO2lZ7WYXOTS1hFjXI3WKYeBu8/BwiJ/P5H6cG2dPlKsvLfgh2jAPgCGD0yQeEZI2WKNjXMhnDNSA2Sbj8Slk4J+s2bqtgmZjv0rrGbSZ5XXmWoTJBnytwoCBOP5eOBeQC1ePLaWem019P6HdYv/kvAW6rwsbrDHb1fjcMY9rjzRXG2pog0+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+0XDP9MZSidacSS96rHnJtqZQG1BjZP+hiM8PBTD6s=;
 b=FS8UcOZLkqOyv4ubeidHCbGwnu8FIAfKodVm8nj1kWWpGfY/a48zmucIVtBe1YAjkDI7brC1YExI5uPonS0xBuinnTM9ajsVWZhBFp7pleYK4wlUY5IPNFAV6q5ZgiEdTZ9KCb/1iJ95VKQwefCOgk34ARjy5ZA6Utz6AVwGbdPTDwJjcehiSl7A5Y1IbZCzFdks+Nb69LBWI4IdRqkOo/qhKSZb/WyLgI0028nbk7BEFWTfaeEcBpLrvalS01YIAy1XyPf+iQ3nxjGERWAdsH/+jlIGGNy4H3/Cy7Ox/K+qKaEkdIfp1B/DeHAT41H0970UpCC4yHxCyN7PSGnekw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Julien Grall
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v10 3/7] xen/arm: smmuv2: Add PCI devices support for SMMUv2
Thread-Topic: [PATCH v10 3/7] xen/arm: smmuv2: Add PCI devices support for
 SMMUv2
Thread-Index: AQHbuP0jnTAzHmn7sUu9THz0sjqD/g==
Date: Tue, 29 Apr 2025 11:52:09 +0000
Message-ID:
 <4874d41630f6bb3e7b688bfa332004558bb543b9.1745918678.git.mykyta_poturai@epam.com>
References: <cover.1745918678.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1745918678.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI2PR03MB10907:EE_
x-ms-office365-filtering-correlation-id: 18bd39b7-49d0-49b3-5638-08dd8714460c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ac6pgiJiWknPCQW4Zctksl+mEInLgjFwtzA5nXhLHKT74MsGuK5MEuHBi8?=
 =?iso-8859-1?Q?IZIE45VwqzmbIItOAMTLkRcZceZXj6uqoDs7FucOYhlzBxSj/uS5Lrg7g+?=
 =?iso-8859-1?Q?MybK9ilaSvQytR6Ij04E2BC06jmZZ9I/2hueUQ9jch+X7x4z/77Q4Lw+7y?=
 =?iso-8859-1?Q?qCqft8E13qQN5392Eo8ZAjk0gi6X7MqoznfFhwvGACMVaHdL0BXm1NP2vq?=
 =?iso-8859-1?Q?s3DUoQuaxywDaAdWFms0RG3zGXiz/tyKaUpPyyTJLDelqYDfJut1Ku/vkO?=
 =?iso-8859-1?Q?9Jp8jZS/aUo6hf00e0ofUEAPxdtYkP/gCqKgmkc10G78QzlGUoaC6w9HEN?=
 =?iso-8859-1?Q?rvk4466fkMbfk89c70AEKXBySQpywWYoS+qIEWsRqkb+7SSVE47G2kSV+M?=
 =?iso-8859-1?Q?HuABX6q7xIZiQk+HTK7OT9srvg+q17QNpjpAR7jVfs/h46kNbFiHot2tF5?=
 =?iso-8859-1?Q?gdGmWNt2xh8KBhuLRFRDbwqVmB1kBiek+Gi6lHC4ZGOJtZ4fydlSMmcf1h?=
 =?iso-8859-1?Q?fJ17NRFIpBUVEYSO+QA8A9jtGUTxqaYh2vns89YpLCG3ztZsi7uhdtaBtv?=
 =?iso-8859-1?Q?LmMH8LNTYFKV5gI9ieUmJwn7sHgTfrW4/52mYDAt5ybftyBE93l9fpLHY9?=
 =?iso-8859-1?Q?2PPJKV/nkcK6o4cdVqUoNlZjleheYJHlXsOsNqxjkHptdufvNiofBtT8ke?=
 =?iso-8859-1?Q?IOrv64ftonCaQ9PSN+z74tUITF0p5ey+1kSjNOHySZsNUxe3GCkydotqKQ?=
 =?iso-8859-1?Q?hg5AuIHy4jKI3eKJTMbIJdz75ipwV3Dh6ZxGImj7Ekbtws0s8247xJpy6n?=
 =?iso-8859-1?Q?LvMjOXiZ0DQzvaDBbQqgtDJCGrDdGQ4SB1D6zeLo2WAiAaY/FJQJaLGlFC?=
 =?iso-8859-1?Q?v5x8PPgiOBuHgucGP19HL6hkeMbFZ40wfds/kMRXdcp0cCN4BnoN1BmVxr?=
 =?iso-8859-1?Q?8P5EXcWGGOpuz6ePkTi7Xy2yQdGhsmZmBYXTGoOcMF1eImYy3Lm2tsvgG3?=
 =?iso-8859-1?Q?iHyuLqHis+ZEsV9HzXLnXyhkUXmDxt5362gI+Qd+VcZ8IwrQKtjNA1xPs4?=
 =?iso-8859-1?Q?DolT3jsZ5njvLTp0S2K/p72Ldgm/PPlINUqc0WTfjEvLqz/SHwW9nWcjb5?=
 =?iso-8859-1?Q?awAizI4XY6k6LD09jYm9egRFcxcyFJwfG/AkmccQC03FDf1L+Da5a2L78K?=
 =?iso-8859-1?Q?iDaJ1YWhGRfmE39TE4zb2sH3EpY+4u1VLWmPT88SiZEuzqucpdwo2a0hDA?=
 =?iso-8859-1?Q?9UHfMSxgJxwA1D8bLaygMW+P6l1TlM9OZtde5XKQ780DTCtrD0gDpHcRsm?=
 =?iso-8859-1?Q?HE3Aaf6ysBrGdeavlhdizdlG2LvSQb2ntRXwFCcmx4qI7Jc+9VHFKbPzVR?=
 =?iso-8859-1?Q?KARgufDXLp19J//5mWVXeLwlQM43Ysmh+rBx1p5r9wA87rShw92tYbrCy5?=
 =?iso-8859-1?Q?+LvSeR9SG9/3ri5OXJLjZXHCo3zzOC+xMeGYfXSpjpmzTnubtDklDcp/eE?=
 =?iso-8859-1?Q?vqWRWcxWf9ZqeVWXlsddpo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VeUGyN4IxkWvb7h2hhV9OnsU0cUOo03q+yxsQ2S+0yRlN+3j1dXhMFFqND?=
 =?iso-8859-1?Q?6xM5DoCvqAf2P3zKzOJzjF5b+LsfyPp/NlS9DywD/yS8NxGPZwKq/9LOC9?=
 =?iso-8859-1?Q?UAijr2JW+8N6MWBqRX16OgoMZ/AZnygMjtfG8e5gzwVV/OwMJLW8JZmN69?=
 =?iso-8859-1?Q?nzmJbZW/X40eG4IZltQ4Q1sz4epuJOCwhq1iUtzGPsAXBlWZxkhCcsK3f1?=
 =?iso-8859-1?Q?rigj9v//tOTSDjDjdI0sARuXPu1xt1zpxDlS1H56Yy3exsvvFWMTuvM6Hm?=
 =?iso-8859-1?Q?rBoVEqQhQtpHmnzht2k1e+YIainOKbnZuiX1EmLzRdzAEqj/AbAAGM2eYu?=
 =?iso-8859-1?Q?vB13QIUqjTzsuXhujAgqGC4NqlZbBvF2Mm9XUOQBOLvoyXOSo23b3DAZH1?=
 =?iso-8859-1?Q?hwXuIbLxN4ZNnOLxBZOZbvVtc7XPP9QJ5JAQRdFQLeqdG2JPfpBHg8Z/mP?=
 =?iso-8859-1?Q?HZ/GKXkNh3HCge3zggaplFzMB4uIgZes6JKdCaHt6tO2X5nJZl1swRZjP6?=
 =?iso-8859-1?Q?IOqr4I8hHL7555CWVsJZXvzHSIiUIbbVxM63fwJEwmDzUf/B3ulTs8vG+L?=
 =?iso-8859-1?Q?5euEzWBWjEIhvBDdNHV5F3RT7eDFg09kIwtncbYX6sNdtwaZPgzXcRSn1A?=
 =?iso-8859-1?Q?fdG/5fosthwzP6sEfwQGsDhTlI5nCx56KIpk/QOldDCyoT7hIs83GwJBXY?=
 =?iso-8859-1?Q?8/A/wqb7NqZWJNgQut0BE7/MnCPjIzDfRtrke1bu9yz7ijG7wpRzVMDS/1?=
 =?iso-8859-1?Q?geMar5MaFj2lRlqdM8hN5uUzkBqadKR04unyVOwKBB+lsNMFFKDBkIHjha?=
 =?iso-8859-1?Q?vVtK/XfXiUHTeRzwvipXkYBZhusKB0guB6uv7iSVBqMINHtceYBAqbCizj?=
 =?iso-8859-1?Q?XxZwIQgzMUwEmmX8uvkmjX79cbHcMda/44Ay725/rOOAmAxUqI59W1sGG2?=
 =?iso-8859-1?Q?ZTFFavnKh79YW0A0dqGYuRMI9KlLRi8kf2sD6ObhrAlGqwQP0RSfDQjuJ2?=
 =?iso-8859-1?Q?NBtBoV5GS01ztq+Gxqd9A5MT/ECwybePU3u0aq1Cwtu8hdxD1G1TTRlRS8?=
 =?iso-8859-1?Q?1J0+UM6Se5ycZMke7gDLxblsThoi1yAMazxKRcAh8GvuiTMXTdPv5w5GFM?=
 =?iso-8859-1?Q?UEAOxaLHklMCq9EK1h1NTV5gtcOGbOog0qGST3f40bIC0HclT5+puD9ElA?=
 =?iso-8859-1?Q?hAzB5lvfnN1SzrEAB/kPIvu5Z6/BSjZdBgWRmGXo8GQdhOXgkYp4HveFWQ?=
 =?iso-8859-1?Q?PKWK58xZgk2eJOTuGLYFWkktlZJPTJZWHtfcuJ1+Sabyt8o/OTKTHyMMZ2?=
 =?iso-8859-1?Q?JSWmdzUSB1mZkuSjjUWd1IJBl9GXZ78J7y7A4WMIcUA+Tf/W2DoRIlSBgy?=
 =?iso-8859-1?Q?IBbroey+ILzi2qkZGMLjpUQdGiKnR+aLVwX1vQQXp6RPyVXNRtm6IG8LFy?=
 =?iso-8859-1?Q?84zLgIPsECMRMxXKJgOL/YtWdLdOI12Hwrj9+ZNV1o858G0uwNkeQ46DIR?=
 =?iso-8859-1?Q?gQuCoLQaCWZjjA298pB234KMs0a0DBTcRSaWoRF9F6kRLsNfsyhzudH/v7?=
 =?iso-8859-1?Q?O0XfDD5eLSWAqhAKZSIAQYRA6Bri2HunCOkkfDJ+bmjB/OiQbQFEMykRjx?=
 =?iso-8859-1?Q?bYCtB+qZvSSiwMTPUmUU1dESPaOBCWrlR09G80x98OCPenRH/hv4oRsA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bd39b7-49d0-49b3-5638-08dd8714460c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 11:52:10.0307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FCeNlNjInwvdps9ErRDL/7cCl6ZkNzI0yPNcbh2Ecr/nuf9KG1znejiDg14+7F8sZ8URcSsn9TShZ+eCEIDSYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10907

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Implement support for PCI devices in the SMMU driver. Make arm_smmu_master
structure to hold a pointer to the device to allow it to hold PCI devices.
Trigger iommu-map parsing when new PCI device is added. Add checks to
assign/deassign functions to ensure PCI devices are handled correctly.
Implement basic quarantining.

All pci devices are automatically assigned to hardware domain if it exists
to ensure it can probe them.

TODO:
Implement scratch page quarantining support.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v9->v10:
* remove unused code
* return on error in arm_smmu_dt_add_device_generic

v8->v9:
* no change

v7->v8:
* no change

v6->v7:
* use d->pci_lock in arm_smmu_assign_dev()
* remove !is_hardware_domain and pdev->domain =3D=3D d checks in assign to
  support future dom0less use case when dom0 is using vPCI
* remove stale todo in dev_get_dev_node
* don't print ""
* remove redundant dt_device_is_protected check
* remove assign/deassing prints
* change assign logic to remove reassign reimplementation
* check if pdev->domain exists before assigning to it
* explain pdev->devfn check
* make reassign check stricter and update comment

v5->v6:
* check for hardware_domain =3D=3D NULL (dom0less test case)
* locking: assign pdev->domain before list_add()

v4->v5:
* assign device to pdev->domain (usually dom0) by default in add_device() h=
ook
* deassign from hwdom
* rebase on top of ("dynamic node programming using overlay dtbo") series
* remove TODO in comment about device prints
* add TODO regarding locking
* fixup after dropping ("xen/arm: Move is_protected flag to struct device")

v3->v4:
* add new device_is_protected check in add_device hook to match SMMUv3 and
  IPMMU-VMSA drivers

v2->v3:
* invoke iommu_add_pci_sideband_ids() from add_device hook

v1->v2:
* ignore add_device/assign_device/reassign_device calls for phantom functio=
ns
  (i.e. devfn !=3D pdev->devfn)

downstream->v1:
* wrap unused function in #ifdef 0
* remove the remove_device() stub since it was submitted separately to the =
list
  [XEN][PATCH v6 12/19] xen/smmu: Add remove_device callback for smmu_iommu=
 ops
  https://lists.xenproject.org/archives/html/xen-devel/2023-05/msg00204.htm=
l
* arm_smmu_(de)assign_dev: return error instead of crashing system
* update condition in arm_smmu_reassign_dev
* style fixup
* add && !is_hardware_domain(d) into condition in arm_smmu_assign_dev()

(cherry picked from commit 0c11a7f65f044c26d87d1e27ac6283ef1f9cfb7a from
 the downstream branch spider-master from
 https://github.com/xen-troops/xen.git)
---
 xen/drivers/passthrough/arm/smmu.c | 224 ++++++++++++++++++-----------
 1 file changed, 143 insertions(+), 81 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index 0f8d47dc98..b9f2a33815 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -120,11 +120,21 @@ enum irqreturn {
=20
 typedef enum irqreturn irqreturn_t;
=20
-/* Device logger functions
- * TODO: Handle PCI
- */
-#define dev_print(dev, lvl, fmt, ...)						\
-	 printk(lvl "smmu: %s: " fmt, dt_node_full_name(dev_to_dt(dev)), ## __VA_=
ARGS__)
+/* Device logger functions */
+#ifndef CONFIG_HAS_PCI
+#define dev_print(dev, lvl, fmt, ...)    \
+    printk(lvl "smmu: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
+#else
+#define dev_print(dev, lvl, fmt, ...) ({                                \
+    if ( !dev_is_pci((dev)) )                                           \
+        printk(lvl "smmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
+    else                                                                \
+    {                                                                   \
+        struct pci_dev *pdev =3D dev_to_pci((dev));                       =
\
+        printk(lvl "smmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
+    }                                                                   \
+})
+#endif
=20
 #define dev_dbg(dev, fmt, ...) dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_A=
RGS__)
 #define dev_notice(dev, fmt, ...) dev_print(dev, XENLOG_INFO, fmt, ## __VA=
_ARGS__)
@@ -172,20 +182,6 @@ static void __iomem *devm_ioremap_resource(struct devi=
ce *dev,
 #define IOMMU_FAULT_READ	0
 #define IOMMU_FAULT_WRITE	1
=20
-/*
- * Xen: PCI functions
- * TODO: It should be implemented when PCI will be supported
- */
-#define to_pci_dev(dev)	(NULL)
-static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
-					 int (*fn) (struct pci_dev *pdev,
-						    u16 alias, void *data),
-					 void *data)
-{
-	BUG();
-	return 0;
-}
-
 /* Xen: misc */
 #define PHYS_MASK_SHIFT		PADDR_BITS
=20
@@ -619,7 +615,7 @@ struct arm_smmu_master_cfg {
 	for (i =3D 0; idx =3D (cfg)->smendx[i], (i) < (num); ++(i))
=20
 struct arm_smmu_master {
-	struct device_node		*of_node;
+	struct device			*dev;
 	struct rb_node			node;
 	struct arm_smmu_master_cfg	cfg;
 };
@@ -711,7 +707,7 @@ arm_smmu_get_fwspec(struct arm_smmu_master_cfg *cfg)
 {
 	struct arm_smmu_master *master =3D container_of(cfg,
 			                                      struct arm_smmu_master, cfg);
-	return dev_iommu_fwspec_get(&master->of_node->dev);
+	return dev_iommu_fwspec_get(master->dev);
 }
=20
 static void parse_driver_options(struct arm_smmu_device *smmu)
@@ -730,21 +726,11 @@ static void parse_driver_options(struct arm_smmu_devi=
ce *smmu)
=20
 static struct device_node *dev_get_dev_node(struct device *dev)
 {
-#if 0 /* Xen: TODO: Add support for PCI */
-	if (dev_is_pci(dev)) {
-		struct pci_bus *bus =3D to_pci_dev(dev)->bus;
-
-		while (!pci_is_root_bus(bus))
-			bus =3D bus->parent;
-		return bus->bridge->parent->of_node;
-	}
-#endif
-
 	return dev->of_node;
 }
=20
 static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *sm=
mu,
-						struct device_node *dev_node)
+						struct device *dev)
 {
 	struct rb_node *node =3D smmu->masters.rb_node;
=20
@@ -753,9 +739,9 @@ static struct arm_smmu_master *find_smmu_master(struct =
arm_smmu_device *smmu,
=20
 		master =3D container_of(node, struct arm_smmu_master, node);
=20
-		if (dev_node < master->of_node)
+		if (dev < master->dev)
 			node =3D node->rb_left;
-		else if (dev_node > master->of_node)
+		else if (dev > master->dev)
 			node =3D node->rb_right;
 		else
 			return master;
@@ -790,9 +776,9 @@ static int insert_smmu_master(struct arm_smmu_device *s=
mmu,
 			=3D container_of(*new, struct arm_smmu_master, node);
=20
 		parent =3D *new;
-		if (master->of_node < this->of_node)
+		if (master->dev < this->dev)
 			new =3D &((*new)->rb_left);
-		else if (master->of_node > this->of_node)
+		else if (master->dev > this->dev)
 			new =3D &((*new)->rb_right);
 		else
 			return -EEXIST;
@@ -824,28 +810,30 @@ static int arm_smmu_dt_add_device_legacy(struct arm_s=
mmu_device *smmu,
 	struct arm_smmu_master *master;
 	struct device_node *dev_node =3D dev_get_dev_node(dev);
=20
-	master =3D find_smmu_master(smmu, dev_node);
+	master =3D find_smmu_master(smmu, dev);
 	if (master) {
 		dev_err(dev,
-			"rejecting multiple registrations for master device %s\n",
-			dev_node->name);
+			"rejecting multiple registrations for master device\n");
 		return -EBUSY;
 	}
=20
 	master =3D devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return -ENOMEM;
-	master->of_node =3D dev_node;
+	master->dev =3D dev;
=20
-	/* Xen: Let Xen know that the device is protected by an SMMU */
-	dt_device_set_protected(dev_node);
+	if ( !dev_is_pci(dev) )
+	{
+		/* Xen: Let Xen know that the device is protected by an SMMU */
+		dt_device_set_protected(dev_node);
+	}
=20
 	for (i =3D 0; i < fwspec->num_ids; ++i) {
 		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
 		     (fwspec->ids[i] >=3D smmu->num_mapping_groups)) {
 			dev_err(dev,
-				"stream ID for master device %s greater than maximum allowed (%d)\n",
-				dev_node->name, smmu->num_mapping_groups);
+				"SMMU stream ID %d is greater than maximum allowed (%d)\n",
+				fwspec->ids[i], smmu->num_mapping_groups);
 			return -ERANGE;
 		}
 		master->cfg.smendx[i] =3D INVALID_SMENDX;
@@ -860,7 +848,7 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_=
smmu_device *smmu,
 	struct device_node *dev_node =3D dev_get_dev_node(dev);
 	int ret;
=20
-	master =3D find_smmu_master(smmu, dev_node);
+	master =3D find_smmu_master(smmu, dev);
 	if (master =3D=3D NULL) {
 		dev_err(dev,
 			"No registrations found for master device %s\n",
@@ -872,8 +860,9 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_=
smmu_device *smmu,
 	if (ret)
 		return ret;
=20
-	/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks.=
 */
-	dev_node->is_protected =3D false;
+	if ( !dev_is_pci(dev) )
+		/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks=
. */
+		dev_node->is_protected =3D false;
=20
 	kfree(master);
 	return 0;
@@ -902,6 +891,12 @@ static int register_smmu_master(struct arm_smmu_device=
 *smmu,
 					     fwspec);
 }
=20
+/* Forward declaration */
+static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
+			       struct device *dev, u32 flag);
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
+				 struct device *dev);
+
 /*
  * The driver which supports generic IOMMU DT bindings must have this
  * callback implemented.
@@ -926,6 +921,25 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, st=
ruct device *dev)
 {
 	struct arm_smmu_device *smmu;
 	struct iommu_fwspec *fwspec;
+	int ret;
+
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+		int ret;
+
+		/* Ignore calls for phantom functions */
+		if ( devfn !=3D pdev->devfn )
+			return 0;
+
+		ret =3D iommu_add_pci_sideband_ids(pdev);
+		if ( ret < 0 ) {
+			iommu_fwspec_free(dev);
+			return ret;
+		}
+	}
+#endif
=20
 	fwspec =3D dev_iommu_fwspec_get(dev);
 	if (fwspec =3D=3D NULL)
@@ -935,7 +949,25 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, st=
ruct device *dev)
 	if (smmu =3D=3D NULL)
 		return -ENXIO;
=20
-	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
+	ret =3D arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
+	if ( ret )
+		return ret;
+
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
+			ret =3D arm_smmu_assign_dev(pdev->domain, devfn, dev, 0);
+	}
+#endif
+
+	return ret;
 }
=20
 static int arm_smmu_dt_xlate_generic(struct device *dev,
@@ -958,11 +990,10 @@ static struct arm_smmu_device *find_smmu_for_device(s=
truct device *dev)
 {
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master =3D NULL;
-	struct device_node *dev_node =3D dev_get_dev_node(dev);
=20
 	spin_lock(&arm_smmu_devices_lock);
 	list_for_each_entry(smmu, &arm_smmu_devices, list) {
-		master =3D find_smmu_master(smmu, dev_node);
+		master =3D find_smmu_master(smmu, dev);
 		if (master)
 			break;
 	}
@@ -2054,6 +2085,7 @@ static bool arm_smmu_capable(enum iommu_cap cap)
 }
 #endif
=20
+#if 0 /* Not used */
 static int __arm_smmu_get_pci_sid(struct pci_dev *pdev, u16 alias, void *d=
ata)
 {
 	*((u16 *)data) =3D alias;
@@ -2064,6 +2096,7 @@ static void __arm_smmu_release_pci_iommudata(void *da=
ta)
 {
 	kfree(data);
 }
+#endif
=20
 static int arm_smmu_add_device(struct device *dev)
 {
@@ -2071,40 +2104,15 @@ static int arm_smmu_add_device(struct device *dev)
 	struct arm_smmu_master_cfg *cfg;
 	struct iommu_group *group;
 	void (*releasefn)(void *data) =3D NULL;
-	int ret;
=20
 	smmu =3D find_smmu_for_device(dev);
 	if (!smmu)
 		return -ENODEV;
=20
-	if (dev_is_pci(dev)) {
-		struct pci_dev *pdev =3D to_pci_dev(dev);
-		struct iommu_fwspec *fwspec;
-
-		cfg =3D kzalloc(sizeof(*cfg), GFP_KERNEL);
-		if (!cfg) {
-			return -ENOMEM;
-		}
-
-		ret =3D iommu_fwspec_init(dev, smmu->dev);
-		if (ret) {
-			kfree(cfg);
-			return ret;
-		}
-		fwspec =3D dev_iommu_fwspec_get(dev);
-
-		/*
-		 * Assume Stream ID =3D=3D Requester ID for now.
-		 * We need a way to describe the ID mappings in FDT.
-		 */
-		pci_for_each_dma_alias(pdev, __arm_smmu_get_pci_sid,
-				       &fwspec->ids[0]);
-		releasefn =3D __arm_smmu_release_pci_iommudata;
-		cfg->smmu =3D smmu;
-	} else {
+	{
 		struct arm_smmu_master *master;
=20
-		master =3D find_smmu_master(smmu, dev->of_node);
+		master =3D find_smmu_master(smmu, dev);
 		if (!master) {
 			return -ENODEV;
 		}
@@ -2772,6 +2780,42 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
devfn,
 			return -ENOMEM;
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
+			struct iommu_domain *domain =3D dev_iommu_domain(dev);
+			if ( !iommu_quarantine )
+				return 0;
+
+			if ( domain && domain->priv )
+				arm_smmu_deassign_dev(domain->priv->cfg.domain, devfn, dev);
+
+			return 0;
+		}
+	}
+#endif
+
 	if (!dev_iommu_group(dev)) {
 		ret =3D arm_smmu_add_device(dev);
 		if (ret)
@@ -2821,11 +2865,27 @@ out:
 	return ret;
 }
=20
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
+				 struct device *dev)
 {
 	struct iommu_domain *domain =3D dev_iommu_domain(dev);
 	struct arm_smmu_xen_domain *xen_domain;
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
 	xen_domain =3D dom_iommu(d)->arch.priv;
=20
 	if (!domain || domain->priv->cfg.domain !=3D d) {
@@ -2852,14 +2912,16 @@ static int arm_smmu_reassign_dev(struct domain *s, =
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

