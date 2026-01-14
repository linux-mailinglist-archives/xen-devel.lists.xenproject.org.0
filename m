Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF68D20D26
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 19:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203676.1518772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5cz-0006gf-5J; Wed, 14 Jan 2026 18:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203676.1518772; Wed, 14 Jan 2026 18:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5cy-0006c5-Ta; Wed, 14 Jan 2026 18:29:56 +0000
Received: by outflank-mailman (input) for mailman id 1203676;
 Wed, 14 Jan 2026 18:29:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1I=7T=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vg5cx-0005zq-R9
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 18:29:55 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0531865b-f177-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 19:29:54 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS2PR03MB9465.eurprd03.prod.outlook.com (2603:10a6:20b:59e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 18:29:49 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:29:49 +0000
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
X-Inumbo-ID: 0531865b-f177-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCIC6pJOhQZjdJ3Q9pk4DPPXVVu/7u73GWHaoTl3K8JOhkKs6JNUcC/dH1rJ3entwQAbEmS1EV3meEfJawko3VFyU4ZustXGYx+Jkd6YfMyPG7in2tgh7rpGcB6mS/A9ZtLTlJi+ZIv9V61kLhtQFK/gLQ6zjEUDRvbz5RxPnLbxD9AFWLSn4p/PSlHTKk/R7VIgKXE2uG0OoDuFaCJKi06JgCLsYccA6DlS+TURKTkeF9ESnRJHJKyaoNGl9eTTZwTw0yxdv9uChDwJTJBRBlyMa1DlfHwFFs+MRsYLlgCrhXZUYGryg309psvGP2aXBFiEJe6aiIYecnHt7N37dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBJ28+wEFMkWxPquD6NRuZ/oMYSkhs3ZtZEPQWhlYnU=;
 b=FMH1bLksSnd6M60ABwuk1wxpYkkfbA1aSvp3DMcBV/9nyMfy3rIpMtMBZdwQB5e2OAixl17yhiLgSAbrV7CsUUM41GcdTOAxsZti2JIBj2NHjrKJdlc0QyaeDEU3+qyVDgLR77NsP78ML9LcTeXy+x5pwmv3GkIXDSfT1Inu/dsCyi2RFpTLSOo9IF+ZdOrcuLUyq3blymCsoqojN8B1grlhsQrzikDdObAfn1YeI/0OseU4DSmZ6RLCBdLYAa5oac9cs80CS4f750SDzha24afGJDf5+9pO/pa7g9aQnjbzzuxIy3W2Agw4k0FTPpKLQscdM+PIf+BzFHy6eDehHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBJ28+wEFMkWxPquD6NRuZ/oMYSkhs3ZtZEPQWhlYnU=;
 b=EywkCCfHbVmSP6bmF/8KJUU6ruWqX0BnFQ5dYbNK02tw5qlQxmghOKOxHl2DxPSsckX3Vr65uF2G76tngm8a1rBvC0mxXgCokNQcF3Zw4GJUkDcdCRkZrQ+arwnZkYwqQc6Fm92mFjg78UM5PfRafJ4gIo3EZ2iQKM7WfR358UlnOIo4BB8oJEwYopQ4IvHoVYBoMJ7DKY4hYaMHpCYKHI16cZBtpuV+pFSgPoTCfaik++EnAFRo9bCw6DHXnQAuBehR82RYfqNy6fSBl1HHbtkrBp8GQ7m9XocB/sAwt2acqoNgq3AvUb3a6SMF/5CsiTfdbRq+Gx3L5/eLPFBZng==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v7 3/5] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v7 3/5] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHchYPD+fwQGyuKXEKqeHI8xFGbqA==
Date: Wed, 14 Jan 2026 18:29:48 +0000
Message-ID:
 <d166348530b9229673e1a6e3b29ff4ee9123ab2f.1768415200.git.oleksii_moisieiev@epam.com>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1768415200.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS2PR03MB9465:EE_
x-ms-office365-filtering-correlation-id: c39b417c-e9a6-4348-42d0-08de539ae6c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5AKzwDTcQJ/AkSr3keE+L4GK4PdHHVllc4DXfH+cFgoTe7+s9jlXTafF/s?=
 =?iso-8859-1?Q?sOstg7jGk/AJpH6/iS6oYrNC2wtvDENcQ1NLkU+6b8DwZgZ9xpWq9mtY42?=
 =?iso-8859-1?Q?523qsDtrRsm3um6KjmXaWYdrblK0Z2sVHO4aJgVksO4NGVrWrg+/sA414g?=
 =?iso-8859-1?Q?d1i1Mrm0NmFn0eO/7s1JAPvJoDuneL/74aSLAq51fr2vx42Dt7blPuk4ya?=
 =?iso-8859-1?Q?UMFHn+lFr/O8Ufd2ISJNOKQhCavhmlO140tB1qdb6NTyb/Bom6mvtBpxyQ?=
 =?iso-8859-1?Q?nMdcizXM4aJZ+1gtVkWBitP/yUcH8um4qSP7CBPbk5F1BznwF0kDGvArwb?=
 =?iso-8859-1?Q?28FJ+pSP740k6eTVFt+Gd9UqVwgoNs2EpuB/qCJE0WbDIM2qrQ3PuIQeMW?=
 =?iso-8859-1?Q?FOWUdJoqtgYeNCih1Mq/y/Ap+VnKuBy7OesGZpHqMPPGxbLGb9BNdYok9Y?=
 =?iso-8859-1?Q?LC/izhDiAcsp3bs0k2CRftoE2LSxKDMsjiZpG062zTPSyNPfwc+M0UTypH?=
 =?iso-8859-1?Q?D9prOAByOLBwOlSd2at2VEm5uyhOCazGOMyc8GutCOlUTr60Ug2QcwzDqb?=
 =?iso-8859-1?Q?SYwnhuUHPFUOtmPOKwR0FasGQQPOm0rvDQ+kzlAGPvS0n4qGcuJ2wo+yTV?=
 =?iso-8859-1?Q?QG8TRcKuCr2gvjGDxuqSL/3mXe4V3C/5wpOrJCGOA/UITGAoWnh/+4jGg2?=
 =?iso-8859-1?Q?ibiqh9taFwFXwVbqnuagvnDNGjrpD39eVrMN91OY/HcUcRRRkPxqBLRLyg?=
 =?iso-8859-1?Q?ebOyovjh4wDLszvMOOCNsNZjp/+m52IXiF27WKCfPXPVM2o8ratHI8QcKh?=
 =?iso-8859-1?Q?o4HjSZu+a6D2is31w0pct8hfL6kAjb5jLOUpH9oUbXTmmLkjnkK74u7z62?=
 =?iso-8859-1?Q?s/VvOHdUftzL0AJ74XyIkRLc0SjspzcyPTna8VaFa4S0sTNKaSh3W9JSwl?=
 =?iso-8859-1?Q?KaI399LGA+fqHkH12/qFWG0i/vtQMio8CxCj+scjzt7h8X7Lqpj9pxBeDf?=
 =?iso-8859-1?Q?VSVWQKvN/NEhB+l0f7jbrYAd7mAlvrVvabwjFhQkxOCDth2n83dS9bfLjD?=
 =?iso-8859-1?Q?DKPKuA6rmKBi37n7FoJ2vxTBqfuxc/EetmWKGyBvt9hdH03JrNSdYw2kei?=
 =?iso-8859-1?Q?U8QvrCubRnXL4wazwa9w81RE2iXpm5LjI5hqpXRHnux5MxzcJMnX8nrrLN?=
 =?iso-8859-1?Q?Hsw/oTyjeJ8+JgloDK1LZydmjXF4rdyMwDpC4uOnKf//wylDDWe8jDNb91?=
 =?iso-8859-1?Q?L52Jxz7lYPRUS+iysms1pGNSgG6gAHOYQ44AfMyFl4pcd7oCXGT8UBpHgV?=
 =?iso-8859-1?Q?imL1FCfs8gX1OGiKtotcAp7HHk4iduMF0VksU9JE7/g92T8mk0/7snD554?=
 =?iso-8859-1?Q?f0gKf9np//c4ABiZyYIPa2d1Uo1IbtQqwrq4ShcNqD6rUVoj+Ktpfd10OI?=
 =?iso-8859-1?Q?dPEKVbv1b1M1sZnZ9PIeRxO8paobOL19+nMOuPEYbQUchdMc9fZo2/vQqv?=
 =?iso-8859-1?Q?gWL6Z8xT+XagGQAx9Up4bmoxeZmtAM7a/flJLw7vaFqJxQcgTS1XDWobcD?=
 =?iso-8859-1?Q?3uTS0dHp94JszE+OOVOnNwvel8a3mdYwL2bho/Gjpp/Vrs3SQOBFOJihdV?=
 =?iso-8859-1?Q?4+oy1Mkz/m7enb4UdHTj1/NjNsJwllMkAEmcs6XHAtvgkOamjzZSsJKojk?=
 =?iso-8859-1?Q?07Qhn2K3AjAjMdInBww=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EPOOcGaW6UgXikcbSa+MaGZyuyg75DrkWLwoyeDGomVr7GTBqZOfIRtNRG?=
 =?iso-8859-1?Q?EcFUOvm3lGCXhESYNq0FFgvgx+3TUoT06IrcL4nxneyp+gtHgecTbED97/?=
 =?iso-8859-1?Q?rhPkhl3x4A4bx5KlMSI2GJLjMJJY/PgvCBHaDXiuUomhGFVw0c4wUEzBiQ?=
 =?iso-8859-1?Q?5PyF07yReNr4A3tj6to7OgqV/ylixqxkEWI5xkwemOnJdAjanBU2+lX/wo?=
 =?iso-8859-1?Q?XJYXFuR20v+38neLxCjInC2dhwOavd1UODZ+3JTc56nlBRndFcezKx6Bat?=
 =?iso-8859-1?Q?JWN9Dp82Otc0SReCtM3KZCtbeJzmx/Jy2yceMhb/mPHHlnPLICqgpMxlPr?=
 =?iso-8859-1?Q?oFax0A4KD+LYEWbtobSB9ilIN+tcK8Yz88Jmz5mHhGtRvIOZPUQF7ubIJt?=
 =?iso-8859-1?Q?lpoca02sVNvLewaGwwPzYLZHZJLTGBK2GMJUEEZf7IL8AkxxetqFKNd67s?=
 =?iso-8859-1?Q?CRROz5fdhnh6OYBMOczhhhMO1XchyhfELyFf8jB6sGsbL1yXHvSdrKTsf9?=
 =?iso-8859-1?Q?URwy1ivyvD08f/h24La7LNuK2NYar7QoLplpMBn4xTVYVSBiHqbmFP3SkW?=
 =?iso-8859-1?Q?wPEwzNYkIhStAqZ3tgL9FiRSXTcfG1XGhQVFTgw438f1bQDOITyIUdAHRx?=
 =?iso-8859-1?Q?Ht/Pw+B+Txfdm/9IxhBBZGxam3AjsTDeSyBvmuT/CIlnzc0pvRQBPgQXEm?=
 =?iso-8859-1?Q?ljMRhkw3GvLKrPE9bqSTLeuzHMTMCRg0cUX1UF7RXulZmN4hJNEjDtfAFi?=
 =?iso-8859-1?Q?YfjZSxX6S9V1d4rO8e+P6mktOkzgj9uurRfi9DbPU4OPSNpIHbKV0+K48m?=
 =?iso-8859-1?Q?pBj/vJh7+ce+/mv6v6nreavLprC1eGvW/n84CSHK/caaZ+7qfmIP5OoEwV?=
 =?iso-8859-1?Q?fc/AI9kSHKFoeL7mQVvNP4GFJtzMoeZdpCfFAuCTJsDUZrUXL4Tgbk9n6y?=
 =?iso-8859-1?Q?xFIwrLnFVlbo5jn0x2Fo21KNL5w5cLmrv6I4RB1XOyU7xq125MeKwdSWXC?=
 =?iso-8859-1?Q?/BSHJETnnCWvgNSll493Y93mDZJkxgQEEanKPQMOqH5mg8gjkTL0TWlZyL?=
 =?iso-8859-1?Q?94eogkEkls6doFPiVPQigUyhXlDqWy3R0CHvLypGQzWjcmdL7TyjZHvoIF?=
 =?iso-8859-1?Q?N32OATdjRZ4zfpzHfFLGOqpI/2SAKQGAp5/FHWVD2T7de9mv0vPycL/QcC?=
 =?iso-8859-1?Q?sOdNZhLpc0evj4zelvx4Uubmniu0NElwF9zhDAZtqtQPzqwnPmb824qeQz?=
 =?iso-8859-1?Q?0pfiVlzpGRBfcDXUF0yOH2LkRnIjVOlLvWR5cSiP25rbWs1TMr73FMpVnh?=
 =?iso-8859-1?Q?N0wT6rZPbAvN6Xz+fSHxyGNzXUCmdKgzXVZQM/TV6/bCjYLrKZlYY6fCiK?=
 =?iso-8859-1?Q?Ew231ivTBiUA1zThwXH6jsssUF+a85nSdHUTLxL+91/f7rUjFtP/ABkKct?=
 =?iso-8859-1?Q?9jZhDl46OlfqrwPpiNHkNwkdFIDX654424026z4QBTAjDSohyhdL9cad2f?=
 =?iso-8859-1?Q?c+U+mu06grkK8LS25P3AmgY4TKJgjhvfIDlmxA9wk3JYbeflrdfs4yGtiH?=
 =?iso-8859-1?Q?zmcgBYu3I26QL1Qgm88DLof++iEk4ww9OOyJWghw1+pHAn6bBJpmvUPJhS?=
 =?iso-8859-1?Q?LBOTVK+rWb5rg7gh4CgriDCFKQXPS1K6gqMxPwG67eQpXxbRD6TWKgSiAH?=
 =?iso-8859-1?Q?4lCEfVTqoAX+rjps+7HGfCLQ48DlgVWdj/yjDkewD9FY6m6p9v/qt3slfi?=
 =?iso-8859-1?Q?9nNZQlsrux5ncd+8oQAkgXrys4aZwrSB4US2XNLGch1ab7BglZiw2FK2Qv?=
 =?iso-8859-1?Q?nwYoIuPO1IWWbJRmHhyjKWlN8UXPGhM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39b417c-e9a6-4348-42d0-08de539ae6c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 18:29:48.7771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OTLPb0LVgZAkIEkj+GCN51nB+8KC4NrXbim3IeJ6FPtPuFgaNGeSRyXP6HA7uWBz0p+3+4RzhVibe0i8RRvmiTV/TRE9idjSh5l6kct3w5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9465

This commit introduces two helper functions, `memcpy_fromio` and
`memcpy_toio`, to provide a robust mechanism for copying data between
standard memory and memory-mapped I/O (MMIO) space for the ARM
architecture.

These helpers handle alignment safely by using byte accesses for any
leading/trailing unaligned bytes and 32-bit raw accesses for the aligned
bulk transfer. Using `__raw_readb/__raw_readl` and
`__raw_writeb/__raw_writel` avoids unintended endianness conversion while
remaining safe across ARM32/ARM64 devices that only support 32-bit
accesses.

The interface lives in the generic header so other architectures can
provide their own implementations (as macros or functions). The ARM
implementation is split into separate compilation units and added to the
architecture-specific lib Makefile.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v7:
- x86 guidance: removed the speculative note; header now just says
  each arch supplies its own implementation or macro.
- name spacing: dropped the double-underscore; the helpers are now
  memcpy_fromio / memcpy_toio. The header also explicitly allows an
  arch to define these as macros before including it.
- updated io.c to keep 32-bit transfers safe on arm32
- moved to __raw_read*/__raw_write* accessors to avoid endianness conversio=
n.
- split the helpers into separate compilation units

Changes in v6:
- sorted objs in Makefile alhabetically
- added newline at the end of Makefile
- used uint{N}_t intead of u{N}
- add comment about why 32 bit IO operations were used
- updated cast opertaions to avoid dropping constness which is wrong
- move function definitions to generic place so the could be reused by
other arch
- add SPDX tag to io.c

Changes in v5:
- move memcpy_toio/fromio to the generic place

 xen/include/xen/lib/io.h    | 65 +++++++++++++++++++++++++++++++++++++
 xen/lib/Makefile            |  1 +
 xen/lib/arm/Makefile        |  1 +
 xen/lib/arm/memcpy_fromio.c | 48 +++++++++++++++++++++++++++
 xen/lib/arm/memcpy_toio.c   | 48 +++++++++++++++++++++++++++
 5 files changed, 163 insertions(+)
 create mode 100644 xen/include/xen/lib/io.h
 create mode 100644 xen/lib/arm/Makefile
 create mode 100644 xen/lib/arm/memcpy_fromio.c
 create mode 100644 xen/lib/arm/memcpy_toio.c

diff --git a/xen/include/xen/lib/io.h b/xen/include/xen/lib/io.h
new file mode 100644
index 0000000000..cd2b6680d5
--- /dev/null
+++ b/xen/include/xen/lib/io.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic I/O memory copy function prototypes.
+ *
+ * These functions provide low-level implementation for copying data betwe=
en
+ * regular memory and I/O memory regions. Each architecture must provide i=
ts
+ * own implementation based on the specific requirements of the architectu=
re's
+ * memory model and I/O access patterns. An architecture may supply these =
as
+ * functions or as macros in its own headers before including this file.
+ *
+ * Architecture-specific implementations:
+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * Each architecture should implement these functions in xen/lib/<arch>/io=
.c
+ * (or define them as macros) based on their hardware requirements. See
+ * xen/lib/arm/io.c for an example using explicit I/O accessors.
+ */
+
+#ifndef _XEN_LIB_IO_H
+#define _XEN_LIB_IO_H
+
+#include <xen/types.h>
+
+/*
+ * memcpy_fromio - Copy data from I/O memory space to regular memory
+ * @to: Destination buffer in regular memory
+ * @from: Source address in I/O memory space (must be marked __iomem)
+ * @count: Number of bytes to copy
+ *
+ * This function handles copying from memory-mapped I/O regions using
+ * architecture-appropriate I/O accessor functions. It ensures proper:
+ * - Memory ordering and barriers
+ * - Alignment requirements
+ * - Hardware-specific access semantics
+ *
+ * Each architecture provides its own implementation that may:
+ * - Use special I/O accessor functions (ARM: readl_relaxed, readb_relaxed=
)
+ * - Implement alignment handling for devices requiring specific access si=
zes
+ * - Add memory barriers to ensure ordering with other I/O operations
+ * - Or simply map to memcpy() if the architecture allows direct I/O acces=
s
+ */
+extern void memcpy_fromio(void *to, const volatile void __iomem *from,
+                          size_t count);
+
+/*
+ * memcpy_toio - Copy data from regular memory to I/O memory space
+ * @to: Destination address in I/O memory space (must be marked __iomem)
+ * @from: Source buffer in regular memory
+ * @count: Number of bytes to copy
+ *
+ * This function handles copying to memory-mapped I/O regions using
+ * architecture-appropriate I/O accessor functions. It ensures proper:
+ * - Memory ordering and barriers
+ * - Alignment requirements
+ * - Hardware-specific access semantics
+ *
+ * Each architecture provides its own implementation that may:
+ * - Use special I/O accessor functions (ARM: writel_relaxed, writeb_relax=
ed)
+ * - Implement alignment handling for devices requiring specific access si=
zes
+ * - Add memory barriers to ensure ordering with other I/O operations
+ * - Or simply map to memcpy() if the architecture allows direct I/O acces=
s
+ */
+extern void memcpy_toio(volatile void __iomem *to, const void *from,
+                        size_t count);
+
+#endif /* _XEN_LIB_IO_H */
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 5ccb1e5241..6bb0491d89 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_ARM) +=3D arm/
 obj-$(CONFIG_X86) +=3D x86/
=20
 lib-y +=3D bsearch.o
diff --git a/xen/lib/arm/Makefile b/xen/lib/arm/Makefile
new file mode 100644
index 0000000000..0bb1a825ce
--- /dev/null
+++ b/xen/lib/arm/Makefile
@@ -0,0 +1 @@
+obj-y +=3D memcpy_fromio.o memcpy_toio.o
diff --git a/xen/lib/arm/memcpy_fromio.c b/xen/lib/arm/memcpy_fromio.c
new file mode 100644
index 0000000000..342a28cb49
--- /dev/null
+++ b/xen/lib/arm/memcpy_fromio.c
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <asm/io.h>
+#include <xen/lib/io.h>
+
+/*
+ * Use 32-bit raw IO operations for portability across ARM32/ARM64 where
+ * 64-bit accessors may not be atomic and some devices only support 32-bit
+ * aligned accesses.
+ */
+
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+		   size_t count)
+{
+	while ( count && (!IS_ALIGNED((unsigned long)from, 4) ||
+			  !IS_ALIGNED((unsigned long)to, 4)) )
+	{
+		*(uint8_t *)to =3D __raw_readb(from);
+		from++;
+		to++;
+		count--;
+	}
+
+	while ( count >=3D 4 )
+	{
+		*(uint32_t *)to =3D __raw_readl(from);
+		from +=3D 4;
+		to +=3D 4;
+		count -=3D 4;
+	}
+
+	while ( count )
+	{
+		*(uint8_t *)to =3D __raw_readb(from);
+		from++;
+		to++;
+		count--;
+	}
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */
diff --git a/xen/lib/arm/memcpy_toio.c b/xen/lib/arm/memcpy_toio.c
new file mode 100644
index 0000000000..e543c49124
--- /dev/null
+++ b/xen/lib/arm/memcpy_toio.c
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <asm/io.h>
+#include <xen/lib/io.h>
+
+/*
+ * Use 32-bit raw IO operations for portability across ARM32/ARM64 where
+ * 64-bit accessors may not be atomic and some devices only support 32-bit
+ * aligned accesses.
+ */
+
+void memcpy_toio(volatile void __iomem *to, const void *from,
+	       size_t count)
+{
+	while ( count && (!IS_ALIGNED((unsigned long)to, 4) ||
+			  !IS_ALIGNED((unsigned long)from, 4)) )
+	{
+		__raw_writeb(*(const uint8_t *)from, to);
+		from++;
+		to++;
+		count--;
+	}
+
+	while ( count >=3D 4 )
+	{
+		__raw_writel(*(const uint32_t *)from, to);
+		from +=3D 4;
+		to +=3D 4;
+		count -=3D 4;
+	}
+
+	while ( count )
+	{
+		__raw_writeb(*(const uint8_t *)from, to);
+		from++;
+		to++;
+		count--;
+	}
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */
--=20
2.34.1

