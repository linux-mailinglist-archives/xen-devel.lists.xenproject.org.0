Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEC0AA0ABF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972139.1360569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVY-0008VI-Nj; Tue, 29 Apr 2025 11:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972139.1360569; Tue, 29 Apr 2025 11:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVY-0008S6-Gk; Tue, 29 Apr 2025 11:52:16 +0000
Received: by outflank-mailman (input) for mailman id 972139;
 Tue, 29 Apr 2025 11:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zRN=XP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9jVW-0008D2-QE
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:52:14 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2608::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63c76802-24f0-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 13:52:13 +0200 (CEST)
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
X-Inumbo-ID: 63c76802-24f0-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+4jxDNnlgUmHkwyA+rsXko6Pu+qgrSu8lijtGpGuStuil1VQHgI5RmYPcIgQi0v6k5uZ4mV2rGFiUEDQ/EJNK1lCYepLgkTwz45m9fsAlN6zVlPV/8SfTUNeaHJb/h/LQUDc8wmuCzI4uCMyhxZAFGal2/Hlr/SMNn3jpvE03urAmhc/ctqfa9vqjVFmfrsJbZCsKGBZKYXW2rFD8u99+kdyG0+YT10wmotXmwNdtkpJ/61rqcA/S3FPlHQCRRhXo2BkMUDbmXZenr1gYqY/WkjisIxxryWEjhowzYMmtVW3OqLlEn28sGUXSC7iyuFAUoIgMvZSPSwiSI+v8ij7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O5dJjmsCdPEIdQTN5iHCPldfvnxP7ufNvJm0uKmLwk=;
 b=BDC8lBKO6mjHi7ZJDAefK2CdrSTPUcELFxK3UIa8SUbSLpsLxZhd2W+dsDGYDPfXi/DE24OWcVa7pzDl6n6jVufDhNTB6IWcVYijNa0gl4jBBjVuqEPZoUqSNDAOYmjIVIrgwwFYr5gITqg9HcgpfLkmvMfrLhFChYlAD/bL4IZ1uMmuFRnqo5SLGtRXZqJa642czcZ8xNT9LuALSmCRVcHEAqvd/CphJMeguPADACOAYwSaqDl+Mb2EUcMgTHyM60YJM81wbHI98PpJVA0mRD8JCZRNQBE8AokXcY3VUnsBB7Hrhl66vWD/NS+/6AyVR3DYvCwQPeirOZT6sQlplQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6O5dJjmsCdPEIdQTN5iHCPldfvnxP7ufNvJm0uKmLwk=;
 b=H2wowjOotr6iGgdXysWsAvDbjeYI9xrWazLAYtlD1CGTTHfViAdFx0zKnn8QcakFI/XlRDGP2r3X5h7EUrV5QaobSvwyIRI2omXqlRe7pFmHCxXxqP/TS9ZzrBE4jDb7S4j8SFW8gqc68PHVyo2cwJdUMpQ0JrCCXtCrRT0iS0DIDnQtws8HLKrua0og898l7MdIPDRuBHGJ6IaoKSZVo8kV+8QmcxK7NhFCkwMJr0tvpV06n2sqbZET4FpsXX1Qxzd1UETCncd8WgrhJl1PSQJQyY53HQ5ioJoV2xgk81Yha8kufzB0v7S55Jn3jS31jbleQ5zutmaioE1/4T0X7A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v10 4/7] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Thread-Topic: [PATCH v10 4/7] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Thread-Index: AQHbuP0jUlr4M+QGW0mRuMiNDm9maQ==
Date: Tue, 29 Apr 2025 11:52:10 +0000
Message-ID:
 <993c2ffc7ab57bb883eb2066b7d55ebe07adc280.1745918678.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 9c9cdac7-ec6d-4edf-1db2-08dd8714464c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?2Mh2ug4qR4Cmaxtc1xfE9kyTXWH2AYf/vRLjxRfaon+VAPFrRBFWqaT9+u?=
 =?iso-8859-1?Q?2/exBgAXmuIwdxwuJL5s++Yi1zZIdJ071xSMo9zPBV5YdK2S6U3wctggvr?=
 =?iso-8859-1?Q?xcXkur40U63dLsor5VWOH81KNL9oxTt0tMaxJUn1I7oEkyjh0J/PDGVSXX?=
 =?iso-8859-1?Q?ox0YzxgVbGP+PEhECXxjnoVTrh8ZOCJsjxlnkEWJOxLz6PywF+lcWe3XRI?=
 =?iso-8859-1?Q?THjvEVnJ6sCy475Ms5pvpUNo0Q4VOGQCJSa1DAoSeG5IwO0XtKNvssF2MP?=
 =?iso-8859-1?Q?f589L9v9+Gw5WNi6AvwvM7ky56w5tTq52ZqOf7y8XSCNfcMDxraD+ILEiV?=
 =?iso-8859-1?Q?oBTbEhIUXzPwMd5NEapLhRrTaoH5e1AIUY5tMmwcigzg/Uiqp75GtT768c?=
 =?iso-8859-1?Q?nMMuzsH0/FxLGHi/spMUMinL88qAl3y0df9Zcvq10Y1skrinn8ByfMHdGu?=
 =?iso-8859-1?Q?zlLrdGBa3QG26T/UC4qtqu+zN3jDO5uG1q2NQrgphSHemaYQ3q9sS4EcRD?=
 =?iso-8859-1?Q?0IEuDEmpvowo4isaEkU9PZ+sinzG0+FGbJSRg2IzWZTwnbOdRkfQLwqkxe?=
 =?iso-8859-1?Q?fH5e/EqLAhFwlj7PO833MEMIfR6MkcSizlvQVpT+cRiX1PPvkIYZzT5mMN?=
 =?iso-8859-1?Q?BK4H6MiM5PpEivUECcv4l7m+/Lbxthz1nAObhti99LLCP4NDur+8sAiddE?=
 =?iso-8859-1?Q?Xwq9W2GqyBJ6gi1W41DOPFoeP63njdPA57f+AJh2Btcbrv+srlGV1mXZ5K?=
 =?iso-8859-1?Q?gLmR+3z/NsyoownDpLYwQkHMq8B835SC0Foq2fyJBExCTlnmN+MPy1G78Q?=
 =?iso-8859-1?Q?5GgcQRKvItLvmckeug5pKQkQOptksvvI9BLyV3tRT8k29cuTCgZw1ou4Li?=
 =?iso-8859-1?Q?zbxXUh47WhcaC1XO8ICEOqmIWWnZpJ1VP16vEmESmL0woS7q6zxSVfDxLO?=
 =?iso-8859-1?Q?AZ8+qC5ibVANgdfmx1NVYtnptcY5Zn/RhmTiZtijI9T9Si5USIFpzRb6uA?=
 =?iso-8859-1?Q?a7IidI4cOyFud5uxAr95np99rG0AGtKivZWVMWLLMTR52aeSLszEWdb8rv?=
 =?iso-8859-1?Q?Jd9scvL3wUeUSxnN2lDKcC+8c7f2NGdkvU/Wo9SU6qf2efQ/IwBeSjNPlv?=
 =?iso-8859-1?Q?LJfyRBFU1/TCkRDEcKL79kUswygfihXlh+DoihPwlE3e4U5HQ43p1b8xK5?=
 =?iso-8859-1?Q?m7aKRuAAdjtgbKtbxSHaVp3nC/uNu7Z+LNlljmbii/PJrIKo2+OHhTZrfY?=
 =?iso-8859-1?Q?XmEp5Pw5/+D4WJ0IF5KYpvix16bGv2y4zBOfpliXXl55fmfR7kp6qBEFKl?=
 =?iso-8859-1?Q?5g8zgNjt9ckbYshXfxpnH9fjBY9s1c+DnLT/eGL/uTtnybn2YHfvSNjV6Q?=
 =?iso-8859-1?Q?uEV59Yioy2iZ3m3VAfgUXARzi29mAxOf+dtw9tuQIpxdJ1audwwTe68cjs?=
 =?iso-8859-1?Q?UuJyASxcJCv7ywb3ztP+qC/hBVj3BGT908dPjFelOKzQ6DPMSwnzT9cvNY?=
 =?iso-8859-1?Q?LNeZMGnuFSpz2wOH5mRgBXHxXIlx6tuTgerd/JRbgKxa+qj9J35Ibpj/WD?=
 =?iso-8859-1?Q?YbKxGIY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fMk5lcRAFJIbw+DC1WuMmplw4SYX4N6Go44KcKFn9ZtVqDwSm7nbvgJO/Y?=
 =?iso-8859-1?Q?yKYTaDlPCpBSgy8kNp/hKyXOTyvzRVmg9S53zWZRq6tGyhjgR1j6z09WTV?=
 =?iso-8859-1?Q?BYFlbflsbaiJw4M0ZVeu7FrVi/E6Vro1pGkYZz9w2IIqNAXGg0nPftMN5m?=
 =?iso-8859-1?Q?Kuo8RiKW9ZKPNCmJZ+e+AlEEfnp67AsLa1aEq7JM1n1V1Wz8g0KCMDNrOi?=
 =?iso-8859-1?Q?3+mY9lFQlOPmq0eWLIDRn6GasOjo0sVjaOCJUqcwtasFC0S9aQM3J+EJb+?=
 =?iso-8859-1?Q?lUtDBOxleJEj/HicLCgrk5NBoDlsLx2P640zr8yG5BhMg/kHRQy5aTVpe7?=
 =?iso-8859-1?Q?R6p+hMKL8E2hzIIbOdc+dn/cmySPwfmYI3YPzvPQL26Oyh8vKVWBviBw42?=
 =?iso-8859-1?Q?1LrbjcZeEcN/q0UuxTBm6vzmmCbx79iy5QGQcNAaVSxG5D+ORO9RQBJJ2F?=
 =?iso-8859-1?Q?XAiGat19sf+mc/y5OHygk8kKOZ7DDexaWdFSqIqpBYxYCnnNN+XHuF5ePp?=
 =?iso-8859-1?Q?hlLCgg67dPuM+U9K3MSleHNj1Wa1IkYGWu9S3K7/sIyP2uPEUch/3ZpJl/?=
 =?iso-8859-1?Q?lkb9ZC4aESMiQTTPqM97vTtH3TP1y/nbV13qYIyb0M7AamAJA5eVVcwnKj?=
 =?iso-8859-1?Q?BUH9S+6RDqSSWrpu2PkJbpcqlbdnQFi33Ve3KazMuzs8/aAGcLxmBtksui?=
 =?iso-8859-1?Q?KdVeK5HG1mqslbIgJRFBIFDe7NkcWMDl+b2gBEdPpGwlbFOGtofeGg4K4L?=
 =?iso-8859-1?Q?muN0EAYrCC5Rrh1F+hz5zi7pBQ1os6aVyzhve+dKPp/fUxoqC33kI2K3iI?=
 =?iso-8859-1?Q?5OoIplbg96hDIe3xyMu6lOuof8msOlJOKPn0itSlBQo+aIoSJTkb+dxjjV?=
 =?iso-8859-1?Q?PbDcdsbVdJbhwMdAG5Ul0S9T41FFiSLgRvzqWCzRb9HldJoOS8mtbPjRVk?=
 =?iso-8859-1?Q?N2AES4VI+0rLLTK61bqXq2UUFEQ29KG2XOzq+2Fh7VUKCOCggQcCoZQunm?=
 =?iso-8859-1?Q?5bxRsBusx4zTkSaJKJX6aE6JoT06wjJi3PJsxXETvT7hyP/hTSMd9wimiB?=
 =?iso-8859-1?Q?nYlx1/5i9lmc2VuI09O/x//MKD4GbSJF5GvpX+ZARRwHB4u91s7Rjd+ha4?=
 =?iso-8859-1?Q?6tKerrpUMsAOsQrp3rRut2NDi685vzner1lp4MBJtlY7f0iuGozxU5WvOs?=
 =?iso-8859-1?Q?YC4Y0bY986n2LSG5gLw2roe7ZlZN2LCqhRbMrcCu4r0+pQYROmYcMzfQSy?=
 =?iso-8859-1?Q?KRbta/l/oUmbfWbShkQHufWf9EInKtv9o1/z12LKUuMM4Ao+q9IFk4K4uh?=
 =?iso-8859-1?Q?WQoFWhekDiIWK9wx4N3ZAchZNf7H+/RbA7y1hxBzL/liD+WuFivEkwIFbB?=
 =?iso-8859-1?Q?wTuKoa52cLTBVrHSQEIzGubCb7Pr9lKoJSizlBMCGP5+odhbT1/DnEmjCe?=
 =?iso-8859-1?Q?1g9LL1+h2C0EuferCGb/vyaZ7YpC1aAlrQl7VtpeCydPrd00mvxZuKkqvt?=
 =?iso-8859-1?Q?BKSHKeG34RF3mqt4Wcd0LqfM45i8xTvtaQKyN2Z/0dIFiMveOVd3sJgMKy?=
 =?iso-8859-1?Q?ryxwNDBOmtaolarGEdtKhgE1eRVEMOs+FgW0wqY7LhMXMskQo6qBEtXU59?=
 =?iso-8859-1?Q?9AHZl98lWCX/cRKvl/PRb1pylNai5KRvfFTkj+wf3D+RDpY2oQhgoD1w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9cdac7-ec6d-4edf-1db2-08dd8714464c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 11:52:10.4529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: is8SPiehvsZJuudQisc+Ysq3vfPAqUOCOdc+89WE9Aj1SyUm4rlEzkEWCPUVgHzmHhR2yHnQHoGif30H5MjO6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10907

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
v9->v10:
* return if iommu_add_pci_sidband_ids fails

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
 xen/drivers/passthrough/arm/smmu-v3.c | 119 +++++++++++++++++++++++---
 1 file changed, 108 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index df16235057..a3bbfda993 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1469,14 +1469,37 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_d=
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
+		if ( ret < 0 ) {
+			iommu_fwspec_free(dev);
+			return ret;
+		}
+	}
+#endif
=20
+	fwspec =3D dev_iommu_fwspec_get(dev);
 	if (!fwspec)
 		return -ENODEV;
=20
@@ -1521,17 +1544,38 @@ static int arm_smmu_add_device(u8 devfn, struct dev=
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
@@ -2624,6 +2668,42 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
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
@@ -2657,7 +2737,7 @@ out:
 	return ret;
 }
=20
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct d=
evice *dev)
 {
 	struct iommu_domain *io_domain =3D arm_smmu_get_domain(d, dev);
 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
@@ -2669,6 +2749,21 @@ static int arm_smmu_deassign_dev(struct domain *d, s=
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
@@ -2687,14 +2782,16 @@ static int arm_smmu_reassign_dev(struct domain *s, =
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

