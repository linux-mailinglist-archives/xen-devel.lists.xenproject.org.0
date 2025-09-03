Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E7B423C6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108474.1458637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoW7-00041X-Ej; Wed, 03 Sep 2025 14:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108474.1458637; Wed, 03 Sep 2025 14:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoW7-0003zw-9U; Wed, 03 Sep 2025 14:31:19 +0000
Received: by outflank-mailman (input) for mailman id 1108474;
 Wed, 03 Sep 2025 14:31:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoV6-0006B7-JJ
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:30:16 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 817568c8-88d2-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 16:30:14 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB7844.eurprd03.prod.outlook.com (2603:10a6:20b:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:30:10 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:30:10 +0000
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
X-Inumbo-ID: 817568c8-88d2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pqi+rMUpXNI5xvsrhmhiOyjAIQTFnXge0cE2hC9l8JZpGWje3dGDYVSqYABERVD/RK8JVtuLYrm4X/pL//tlUsDON+bv8cLM2kVL03YCFOXUSPi9BxGbKIc148cJYmXOOkyTTSKkCMuFQ3s7bWYIqulK2afsuZP527ZljpWKiNyYDt8EwIBYSlpIDcOyM49h0si1fXEAy7SGh1pWuhXZ4QPs7iVYt6+v+mzPoPi4ZXfhIpfdWKqFLzfgADCGQH/xgqwTprw4umNbgbYitQtenVXiAkYm9ehYsnrrd2INwgg+fLSxywng1rWn2+OkVDB2aa9v9hZ/SUgXHrDRVqNEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLHN8gb/+L/f8ZpI5+SxlAV36wlxEeH+bBgvmGYv+D4=;
 b=U7rI+zf93PdeH+nCevhoaQ2xBJU8+Bw7u4nyCvyKhGrm+AlRRUkQu+fxqbodhyNzvnq/HfJZl4tY+4E5vJfgywpSpd8n7Z9nyVvIkq/FGlgpDalqxJYMRioJ3paK85zJbQDZgw0MfNRCGBrUPyTzi0d+eqAXLOc9kxWVJ2KxEYFW0XyId06uNDriou/jdtW3UX2SgQpQz7PGFQIBHY1IxBHPr1MJXqVI6VEtajhuz9dJPA/duSpcQUKxwEXmveZ+69lEvuKmqcBXBx7tsjbGM/ziObgvE0gT3wicUbPwxtnx9Ul3r//tJrxIX6RT3tUc1Di04jvR1+EQvtuf0tgBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLHN8gb/+L/f8ZpI5+SxlAV36wlxEeH+bBgvmGYv+D4=;
 b=rHRUW46a0IIV10jLZbaHYAIBRXQ+7yvm4QiKmhV3WzWmbaNuQ4L+FlEBrFGjdb/XP4l7+5xYDQrbXjr6ZFl0MMxSedg3Il1eki1Tm88VPDKg5sBwSFRstAhaV+IZAIOBXoZUW/3bE4kVBPrUmhsw3J1uFssHMi6eUPUNL0StzSoWeQwD7WBpX5cz4p6wyeC4emqeCHnd1m9/zzAAYK6/M9rrWdi+iY2xEsIoNO49IUwWjorFBklvU0XY0q9L28ZCTcmkgYd/zWemJ850Oy4HIVr4w6fx2tdMz5V0vh08wLw7PsMEAYuVYNlVdDXRwu+rsUHgD9pFQzgoZsr6f2PfIQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 08/12] xen/arm: vgic: add resource management for extended
 SPIs
Thread-Topic: [PATCH v6 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcHN9AEk+ywvTyYUiwpifc3pdNGw==
Date: Wed, 3 Sep 2025 14:30:10 +0000
Message-ID:
 <e91abc4c21f9f1fe425b71b3000e7ec0135d5cb9.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB7844:EE_
x-ms-office365-filtering-correlation-id: c0b416b9-3f9d-40c0-65ae-08ddeaf66377
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UBsTxzYtB3L3jLc/PfQgnRx9vplWNoFIKDgpJctE8z8MGlDNYhZNO5Nesi?=
 =?iso-8859-1?Q?qKZ5uPozWkLZJctW0uhl5eaIQdiK5+RY9VCsHlHP5lNNTJUl9fTu6ZMcis?=
 =?iso-8859-1?Q?+RhQbtvpepPRw0IHJdXKZhMTUUEFT3Z94LRBo0K3RGs5iVr1PaCYQ/K4Mf?=
 =?iso-8859-1?Q?yCA+sFdojW4JcMXmNDsZTRoQtxYqovzYTsNUwxG1W2uyJZnV5mU99wOuIf?=
 =?iso-8859-1?Q?Ur1hZzHxTwcqaEf6kpQWuN7Juak8q+CrCxYQFcjbiNDAXTR4obPQYHCJp1?=
 =?iso-8859-1?Q?0Ei8BI9PciVuJWI/9HCbDHQovP1jm2vq78KrzHiECI5FLbBO9mOmXh2EGp?=
 =?iso-8859-1?Q?bAZI3wsKDqQTshpQH/FLqZvBTni4UHFy94ps2hhl6lYYJHitDeMzyLOquD?=
 =?iso-8859-1?Q?WChrQ25+1NB9YAWAVQsO2ViQjhI5I1JBpYSQFE+nj8aYz80QreW010pKFW?=
 =?iso-8859-1?Q?BOyFRHAt7N6yKu5qxrv4A4R9neIAHsAlZgUJ2P0uDinNj2opaohE6cubzW?=
 =?iso-8859-1?Q?bwsxZTBVWhkQJWsbmKmlhb9l3Z7DBfW1OZNG3etY/lJsLg5KWdbhRJ5qw5?=
 =?iso-8859-1?Q?2ok8XdqooGQxv9whWX219cjFct1WH0wy2Zxe3WW59YjMC3/wj1jE4Ucxsd?=
 =?iso-8859-1?Q?jPH6cFQlLVhlT0dat7awAz4RAozyCkphZ/Nyao7nztkkv6OOVUDyrFp7Wy?=
 =?iso-8859-1?Q?hmvRM2zMQBLz83/SF1LvEZF6vgkZaZH/mi9cbELDYYTM9H9PDi/RcEEGIw?=
 =?iso-8859-1?Q?mRn9/nQauCPKCRPMRvZsp9df7Aju4d89u3VXl4daLh/HlgEZtLUWiIEfMX?=
 =?iso-8859-1?Q?+UiQF1YrmWkY411gSu5AP/hzYIuzmUAWbxr9AbU5RN9383d8Ue7PyJoow/?=
 =?iso-8859-1?Q?Qu3P97zZnZVYrgVb2BjXZtTPYdBZCI5pRgdauooWtU4bYcdIvWUMMDwJ5R?=
 =?iso-8859-1?Q?XjCmwAagq5FQvmrN0V73UWDvR3n9N5cF7gsU8Y4hCCRx4pzlbN6r5siCwf?=
 =?iso-8859-1?Q?5i8HR9CbUNHozzew6/eCb36WMrnMjrSNlHgFocyhglIRDKq5L38ud4/JnA?=
 =?iso-8859-1?Q?LlbzLowc6mAMCSfA4Tq78Ei0DQg0wsmXvp5TM+wlgDCwjgEyn6Pn89PVHV?=
 =?iso-8859-1?Q?i5krCHz38g81LItJtVVArud4quWX1rkzZphoUlBhSDKdS8sormK2uaP7vP?=
 =?iso-8859-1?Q?HD4MGGeAt+1aSGKz7Je+ba4S5bZ9xWFl6OQVE8S/dFMJiIhxl4iSOftqVa?=
 =?iso-8859-1?Q?4E1zUgOihmKVqqNbQcutWNYQz1clrX5Zaog3DCWicABST0+r15N34nD/yW?=
 =?iso-8859-1?Q?kIuVH0fdBXC+jjA9FfdE9Q5hl2DxMFssmmo2KhDwGVsa/2CUX6Ly7e/wcq?=
 =?iso-8859-1?Q?sbRNDmMi9so/2ny/PTXwdVBd4sgcATc3j3aAcWfbJoheKxJTqenfYoIEph?=
 =?iso-8859-1?Q?wWubFNGzllmtX3drRihBW/6wXhjtkWj0tDeAY6KxUArZp3U14qhSmhkkxT?=
 =?iso-8859-1?Q?JpgVSBIj4Df/FW5SwzbfUE/XAyjddDbE6zFAPUAsVtYw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lE7JA9s/u/w7U+3VMS9/WDtfQmW7QG31uJ7O5CROIcy7B8xCqdNaJ42Jje?=
 =?iso-8859-1?Q?6R5lj2t+Om0Q3V4tPLcUs7E+iVhjqBYwDdQ/VBB9BPHtPFAboI7vHbvAKU?=
 =?iso-8859-1?Q?j4E0s/wp9W2F1yQloim5TzfA1wpFpD9Zk27cMw8bL+ey0JYNkk/0lCR5P1?=
 =?iso-8859-1?Q?1w+dds/osfOPa4QpGidi+ZuhzHKTfItu0NcCdLv4anWLALr/+qagwXMuYw?=
 =?iso-8859-1?Q?izMPH+ZJ1jI3+vqjd+y95Wo19i5hwJSk1g+Hf7lZLBZ70H/OFDbYDhltmY?=
 =?iso-8859-1?Q?NKMQLUjYL6AhXuIoSE4TwpZNjCcY4S8USkyTDrG/e3Qe1oRIEIJgFsi5Pt?=
 =?iso-8859-1?Q?HOL/258xPG0UPOxzfyzI+UeWuOJ1EICmL+JmRIY3JSOr55W51pCJS6Ism0?=
 =?iso-8859-1?Q?tYMfUDm4yRZtkqHHulweAMFtKbNwfbtFLpud7M1tV/4ixLuIsukt2ojPph?=
 =?iso-8859-1?Q?gAFQrEIdU0KX6BfdT0Ra1I7kojx2X1ll3fW+lovfTsXZZI43dZQZ8Xk2qX?=
 =?iso-8859-1?Q?2ih7yZQE9+O4wGU1As5WmqFk3HD3p0O2Cb1hWT4sPxQlsL4/EMb/+/RIRi?=
 =?iso-8859-1?Q?5uOwuYbqkLhdpisujBagkzgpYDN7cwwT2abFUSMrqyeEQ1jX+9NFHW4eEi?=
 =?iso-8859-1?Q?VWpjZCNyl871xqFP1Lb7Hx5/1/uAAkHWF+BQ1e9iEPcC37wmGIoVUsV7qN?=
 =?iso-8859-1?Q?8Ro6+CaByZ7WeV2H0O9DGVbf108tc5ZDbIN5UTQqtUZHlfDRBj8uWxUkkF?=
 =?iso-8859-1?Q?ndZCXpY1+EIZJGyXxq3M3jeXjvyaQCrbunXTE5IP+8vk+aBnKXaq6mBIe9?=
 =?iso-8859-1?Q?mCBwOvDUxKTi0JvEluC8Bia8ccizQSd2ueSW45xJmJynUcR6zG3nGExSH8?=
 =?iso-8859-1?Q?AQav+JQEk8XoQELHJSX/odx/idqPXDd/Fszx4zpgzH9C8bPs4PHPi9CW0b?=
 =?iso-8859-1?Q?SET0JBnzjPapgDD5Q/NYiI8y1j9sLgySrKxJRJxZ1RRzZFu7UGG2ueKhV2?=
 =?iso-8859-1?Q?h9T9yTZgLqhwTO0mVulqEIIl04kTxM+pgqLAX3PS/xtxWHAYN4oCcMfzdm?=
 =?iso-8859-1?Q?WCkbbv69KLpj9aWCeBnJo36P4JZR27CEo9Q56/G7cJhwmnQVWDMHTB79CA?=
 =?iso-8859-1?Q?QStcsE2xtVWaP0afup67Yx/f9GNR1kcIw1X4dUzGJWwVVMVgCmv3tz9dY9?=
 =?iso-8859-1?Q?V7w63mjjKbIrWEe8R2bIZsNE5tsdfRx+esjvtcRqnuqcR2VLHkuHz757Nd?=
 =?iso-8859-1?Q?K6/ZVSJq6XGcDuEdgwyVnA+ZLlIxyiHiFbWCiAxpctpsjiYU0MhpHvuxAa?=
 =?iso-8859-1?Q?0IJXLcWK65oCr3Bw/ZPQCG0EqAGV3uYSaSi0SiBTFDShqTqbolbXRJzYHF?=
 =?iso-8859-1?Q?ruwryQX7I+mV/Q46QZfuJ/HoC8aLhwc3qFJSmD0hDtZERzUQ1902KInjdE?=
 =?iso-8859-1?Q?BpbpK7cSJOzobwGlaNp2HBktG3xTxq3FdP+fLgKwnkmQrMblNHfE7i9Trp?=
 =?iso-8859-1?Q?gTrk4joDMN7bTcWbaki5670eOMzFTtti0OsW9ufH84i47G6qbJ2lKp6/Un?=
 =?iso-8859-1?Q?dyLxW2B1lnFgM7vlIE0CAva670rz/Xbo5ZcptJQ/QNH5K05ZlgqpYmtdqD?=
 =?iso-8859-1?Q?QVAlNKyhdnoysTBAGk0t3lMB36V++w1VLGoGWjatSt7hRMgcCt3h9ty8Vi?=
 =?iso-8859-1?Q?Al2rk0ZCSWoJSVr6GSY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b416b9-3f9d-40c0-65ae-08ddeaf66377
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:30:10.7667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+EtT31HBg/1NObwzFhtxqClXMqBzEouPexoawcRFtnjPjL+x0jKgD/L/F6akJUnpXjyL1qiX4isCDUBHEqQlDBWFJ3Khbhib+f+2pGzVNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7844

This change introduces resource management in the VGIC to handle
extended SPIs introduced in GICv3.1. The pending_irqs and
allocated_irqs arrays are resized to support the required
number of eSPIs, based on what is supported by the hardware and
requested by the guest. A new field, ext_shared_irqs, is added
to the VGIC structure to store information about eSPIs, similar
to how shared_irqs is used for regular SPIs.

Since the eSPI range starts at INTID 4096 and INTIDs between 1025
and 4095 are reserved, helper macros are introduced to simplify the
transformation of indices and to enable easier access to eSPI-specific
resources. These changes prepare the VGIC for processing eSPIs as
required by future functionality.

The initialization and deinitialization paths for vgic have been updated
to allocate and free these resources appropriately. Additionally,
updated handling of INTIDs greater than 1024, passed from the toolstack
during domain creation, and verification logic ensures only valid SPI or
eSPI INTIDs are used.

The existing SPI behavior remains unaffected when guests do not request
eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
option is disabled.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes for V6:
- introduced a new function for index to virq conversion, idx_to_virq.
  This allows the removal of eSPI-specific functions and enables the
  reuse of existing code for regular SPIs
- fixed the return value of vgic_allocate_virq in the case of eSPI
- updated the error message in route_irq_to_guest(). To simplify it and
  avoid overcomplicating with INTID ranges, propose removing the
  information about the max number of IRQs
- fixed eSPI rank initialization to avoid using EXT_RANK_IDX2NUM for
  converting the eSPI rank to the extended range
- updated the recalculation logic to avoid the nr_spis > 1020 -
  NR_LOCAL_IRQS check when nr_spis is reassigned in the case of eSPI
- fixed formatting issues for macros
- minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
  into appropriate inline functions introduced in the previous patch
- minor change: changed int to unsigned int for nr_espis

Changes in V5:
- removed the has_espi field because it can be determined by checking
  whether domain->arch.vgic.nr_espis is zero or not
- since vgic_ext_rank_offset is not used in this patch, it has been
  moved to the appropriate patch in the patch series, which implements
  vgic eSPI registers emulation and requires this function
- removed ifdefs for eSPI-specific macros to reduce the number of ifdefs
  and code duplication in further changes
- fixed minor nit: used %pd for printing domain with its ID

Changes in V4:
- added has_espi field to simplify determining whether a domain is able
  to operate with eSPI
- fixed formatting issues and misspellings

Changes in V3:
- fixed formatting for lines with more than 80 symbols
- introduced helper functions to be able to use stubs in case of
  CONFIG_GICV3_ESPI disabled, and as a result, reduce the number of
  #ifdefs
- fixed checks for nr_spis in domain_vgic_init
- updated comment about nr_spis adjustments with dom0less mention
- moved comment with additional explanations before checks
- used unsigned int for indexes since they cannot be negative
- removed unnecessary parentheses
- move vgic_ext_rank_offset to the below ifdef guard, to reduce the
  number of ifdefs

Changes in V2:
- change is_espi_rank to is_valid_espi_rank to verify whether the array
  element ext_shared_irqs exists. The previous version, is_espi_rank,
  only checked if the rank index was less than the maximum possible eSPI
  rank index, but this could potentially result in accessing a
  non-existing array element. To address this, is_valid_espi_rank was
  introduced, which ensures that the required eSPI rank exists
- move gic_number_espis to
  xen/arm: gicv3: implement handling of GICv3.1 eSPI
- update vgic_is_valid_irq checks to allow operating with eSPIs
- remove redundant newline in vgic_allocate_virq
---
 xen/arch/arm/include/asm/vgic.h |  12 +++
 xen/arch/arm/irq.c              |   3 +-
 xen/arch/arm/vgic.c             | 174 ++++++++++++++++++++++++++++++--
 3 files changed, 176 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 3e7cbbb196..1cf0a05832 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -146,6 +146,10 @@ struct vgic_dist {
     int nr_spis; /* Number of SPIs */
     unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
     struct vgic_irq_rank *shared_irqs;
+#ifdef CONFIG_GICV3_ESPI
+    struct vgic_irq_rank *ext_shared_irqs;
+    unsigned int nr_espis; /* Number of extended SPIs */
+#endif
     /*
      * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
      * struct arch_vcpu.
@@ -243,6 +247,14 @@ struct vgic_ops {
 /* Number of ranks of interrupt registers for a domain */
 #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
=20
+#ifdef CONFIG_GICV3_ESPI
+#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis + 31) / 32)
+#endif
+#define EXT_RANK_MIN (ESPI_BASE_INTID / 32)
+#define EXT_RANK_MAX ((ESPI_MAX_INTID + 31) / 32)
+#define EXT_RANK_NUM2IDX(num) ((num) - EXT_RANK_MIN)
+#define EXT_RANK_IDX2NUM(idx) ((idx) + EXT_RANK_MIN)
+
 #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
 #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
=20
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index c934d39bf6..c2f1ceb91f 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -494,8 +494,7 @@ int route_irq_to_guest(struct domain *d, unsigned int v=
irq,
     if ( !vgic_is_valid_line(d, virq) )
     {
         printk(XENLOG_G_ERR
-               "the vIRQ number %u is too high for domain %u (max =3D %u)\=
n",
-               irq, d->domain_id, vgic_num_irqs(d));
+               "invalid vIRQ number %u for domain %pd\n", irq, d);
         return -EINVAL;
     }
=20
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 2bbf4d99aa..b42aee8d0c 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -25,11 +25,61 @@
 #include <asm/vgic.h>
=20
=20
+static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
+{
+    if ( idx >=3D vgic_num_irqs(d) )
+        return espi_idx_to_intid(idx - vgic_num_irqs(d));
+
+    return idx;
+}
+
 bool vgic_is_valid_line(struct domain *d, unsigned int virq)
 {
+#ifdef CONFIG_GICV3_ESPI
+    if ( virq >=3D ESPI_BASE_INTID &&
+         virq < espi_idx_to_intid(d->arch.vgic.nr_espis) )
+        return true;
+#endif
+
     return virq < vgic_num_irqs(d);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * Since eSPI indexes start from 4096 and numbers from 1024 to
+ * 4095 are forbidden, we need to check both lower and upper
+ * limits for ranks.
+ */
+static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
+{
+    return rank >=3D EXT_RANK_MIN &&
+           EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d);
+}
+
+static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
+                                                       unsigned int rank)
+{
+    return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
+}
+
+#else
+static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
+{
+    return false;
+}
+
+/*
+ * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn,
+ * because in this case, is_valid_espi_rank will always return false.
+ */
+static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
+                                                       unsigned int rank)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+#endif
+
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
                                                   unsigned int rank)
 {
@@ -37,6 +87,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct =
vcpu *v,
         return v->arch.vgic.private_irqs;
     else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
         return &v->domain->arch.vgic.shared_irqs[rank - 1];
+    else if ( is_valid_espi_rank(v->domain, rank) )
+        return vgic_get_espi_rank(v, rank);
     else
         return NULL;
 }
@@ -117,6 +169,54 @@ int domain_vgic_register(struct domain *d, unsigned in=
t *mmio_count)
     return 0;
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+static unsigned int vgic_num_spi_lines(struct domain *d)
+{
+    return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
+}
+
+static int init_vgic_espi(struct domain *d)
+{
+    unsigned int i, idx;
+
+    if ( d->arch.vgic.nr_espis =3D=3D 0 )
+        return 0;
+
+    d->arch.vgic.ext_shared_irqs =3D
+        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
+    if ( d->arch.vgic.ext_shared_irqs =3D=3D NULL )
+        return -ENOMEM;
+
+    for ( i =3D d->arch.vgic.nr_spis, idx =3D 0;
+          i < vgic_num_spi_lines(d); i++, idx++ )
+        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
+                              espi_idx_to_intid(idx));
+
+    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
+        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i],
+                       EXT_RANK_IDX2NUM(i), 0);
+
+    return 0;
+}
+
+#else
+static int init_vgic_espi(struct domain *d)
+{
+    return 0;
+}
+
+static unsigned int vgic_num_spi_lines(struct domain *d)
+{
+    return d->arch.vgic.nr_spis;
+}
+
+#endif
+
+static unsigned int vgic_num_alloc_irqs(struct domain *d)
+{
+    return vgic_num_spi_lines(d) + NR_LOCAL_IRQS;
+}
+
 int domain_vgic_init(struct domain *d, unsigned int nr_spis)
 {
     int i;
@@ -133,7 +233,39 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
=20
     /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988  =
*/
     if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
+#ifndef CONFIG_GICV3_ESPI
         return -EINVAL;
+#else
+    {
+        /*
+         * During domain creation, the dom0less DomUs code or toolstack
+         * specifies the maximum INTID, which is defined in the domain
+         * config subtracted by 32 to cover the local IRQs (please see
+         * the comment to VGIC_DEF_NR_SPIS). To compute the actual number
+         * of eSPI that will be usable for, add back 32.
+         */
+        nr_spis +=3D 32;
+        if ( nr_spis > espi_idx_to_intid(NR_ESPI_IRQS) )
+            return -EINVAL;
+
+        if ( nr_spis >=3D ESPI_BASE_INTID )
+        {
+            unsigned int nr_espis =3D min(nr_spis - ESPI_BASE_INTID, 1024U=
);
+
+            /* Verify if GIC HW can handle provided INTID */
+            if ( nr_espis > gic_number_espis() )
+                return -EINVAL;
+
+            d->arch.vgic.nr_espis =3D nr_espis;
+            /* Set the maximum available number for regular SPIs */
+            nr_spis =3D VGIC_DEF_NR_SPIS;
+        }
+        else
+        {
+            return -EINVAL;
+        }
+    }
+#endif
=20
     d->arch.vgic.nr_spis =3D nr_spis;
=20
@@ -145,7 +277,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_=
spis)
         return -ENOMEM;
=20
     d->arch.vgic.pending_irqs =3D
-        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
+        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
     if ( d->arch.vgic.pending_irqs =3D=3D NULL )
         return -ENOMEM;
=20
@@ -156,12 +288,16 @@ int domain_vgic_init(struct domain *d, unsigned int n=
r_spis)
     for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
         vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
=20
+    ret =3D init_vgic_espi(d);
+    if ( ret )
+        return ret;
+
     ret =3D d->arch.vgic.handler->domain_init(d);
     if ( ret )
         return ret;
=20
     d->arch.vgic.allocated_irqs =3D
-        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
+        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_alloc_irqs(d))=
);
     if ( !d->arch.vgic.allocated_irqs )
         return -ENOMEM;
=20
@@ -182,9 +318,12 @@ void domain_vgic_free(struct domain *d)
     int i;
     int ret;
=20
-    for ( i =3D 0; i < (d->arch.vgic.nr_spis); i++ )
+    for ( i =3D 32; i < vgic_num_alloc_irqs(d); i++ )
     {
-        struct pending_irq *p =3D spi_to_pending(d, i + 32);
+        struct pending_irq *p;
+        unsigned int virq =3D idx_to_virq(d, i);
+
+        p =3D spi_to_pending(d, virq);
=20
         if ( p->desc )
         {
@@ -198,6 +337,9 @@ void domain_vgic_free(struct domain *d)
     if ( d->arch.vgic.handler )
         d->arch.vgic.handler->domain_free(d);
     xfree(d->arch.vgic.shared_irqs);
+#ifdef CONFIG_GICV3_ESPI
+    xfree(d->arch.vgic.ext_shared_irqs);
+#endif
     xfree(d->arch.vgic.pending_irqs);
     xfree(d->arch.vgic.allocated_irqs);
 }
@@ -323,10 +465,12 @@ void arch_move_irqs(struct vcpu *v)
      */
     ASSERT(!is_lpi(vgic_num_irqs(d) - 1));
=20
-    for ( i =3D 32; i < vgic_num_irqs(d); i++ )
+    for ( i =3D 32; i < vgic_num_alloc_irqs(d); i++ )
     {
-        v_target =3D vgic_get_target_vcpu(v, i);
-        p =3D irq_to_pending(v_target, i);
+        unsigned int virq =3D idx_to_virq(d, i);
+
+        v_target =3D vgic_get_target_vcpu(v, virq);
+        p =3D irq_to_pending(v_target, virq);
=20
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
             irq_set_affinity(p->desc, cpu_mask);
@@ -539,7 +683,7 @@ struct pending_irq *irq_to_pending(struct vcpu *v, unsi=
gned int irq)
     else if ( is_lpi(irq) )
         n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, irq)=
;
     else
-        n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
+        n =3D spi_to_pending(v->domain, irq);
     return n;
 }
=20
@@ -547,7 +691,12 @@ struct pending_irq *spi_to_pending(struct domain *d, u=
nsigned int irq)
 {
     ASSERT(irq >=3D NR_LOCAL_IRQS);
=20
-    return &d->arch.vgic.pending_irqs[irq - 32];
+    if ( is_espi(irq) )
+        irq =3D espi_intid_to_idx(irq) + d->arch.vgic.nr_spis;
+    else
+        irq -=3D 32;
+
+    return &d->arch.vgic.pending_irqs[irq];
 }
=20
 void vgic_clear_pending_irqs(struct vcpu *v)
@@ -668,6 +817,9 @@ bool vgic_reserve_virq(struct domain *d, unsigned int v=
irq)
     if ( !vgic_is_valid_line(d, virq) )
         return false;
=20
+    if ( is_espi(virq) )
+        virq =3D espi_intid_to_idx(virq) + vgic_num_irqs(d);
+
     return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
 }
=20
@@ -685,7 +837,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
     else
     {
         first =3D 32;
-        end =3D vgic_num_irqs(d);
+        end =3D vgic_num_alloc_irqs(d);
     }
=20
     /*
@@ -700,7 +852,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
     }
     while ( test_and_set_bit(virq, d->arch.vgic.allocated_irqs) );
=20
-    return virq;
+    return idx_to_virq(d, virq);
 }
=20
 void vgic_free_virq(struct domain *d, unsigned int virq)
--=20
2.34.1

