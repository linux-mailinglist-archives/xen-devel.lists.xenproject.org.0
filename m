Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AA8A82648
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944043.1342645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VUl-0002gl-O4; Wed, 09 Apr 2025 13:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944043.1342645; Wed, 09 Apr 2025 13:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VUl-0002bp-J7; Wed, 09 Apr 2025 13:29:35 +0000
Received: by outflank-mailman (input) for mailman id 944043;
 Wed, 09 Apr 2025 13:29:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=scqd=W3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u2VUj-0001T2-CP
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:29:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f403:2612::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abb57ebc-1546-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 15:29:32 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DB9PR03MB7468.eurprd03.prod.outlook.com
 (2603:10a6:10:22d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 13:29:27 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 13:29:27 +0000
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
X-Inumbo-ID: abb57ebc-1546-11f0-9eab-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3RL8nHftxqKZqqoN+IayV9NvT5z8mk9yC1c0/Epf+NOhVirJCetPQJJ8U+VWy7DUDVT5T0nH7A+Z0of/8EgmeOrrwlT+X2lyECH2YBwpRcuRI/CjzxDS3J/p96VpXjS8WQkIoM3ejxua0mszdbwdBaSR0Vj6GZg+hZLQbXo4nFcVsIZQNhCexiNwngk+oK4lATUedqmJI4M/5nKGcJD8KdS2sFcuRVWBpK1pf6WCanJAZ6fD2G+2xl4LME8oDSRYlq1KWYr8aWBMvKLjdHz2xP69Ed1VKB7Hg/s3dp44lqgea0xOxGpL24T2WPE6lUz3rBc2YopWO6p+KZF5yszGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyBcA+yWQnOCSNF/kUVEX+WjJUIBXqs8G1+6ttzX/UI=;
 b=tZbDY/H0MfxkA9VMWH8tVRUP10vJPBajn4536zfAXQ3eunVI02n1tR9Md9sQyPW7x1CMH4+PRcJFoF2mOcicRygJK/RZzj0zoV87StjsZ0wE9QyHU4xb7mFy7ww0pNDDifS9lBQK9mPDhlJRDGdAkfYRHFnmxbi/ORnCmGOcU+2gLAdHW2aaCC4ChBRuR65v78sHGfoEvhCqDL/SNwkHR7Z3U+eaomlDKmfm7zPzLlyVSyZa1WqyGGmTwGakAbkutX5mefACTnD8QKfHngp1131UVlETteYcB/TUhsjm1HZx25lxIFJiIMIzKHHChn1tkCA/qlHIt1M+ROvUV8c92w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyBcA+yWQnOCSNF/kUVEX+WjJUIBXqs8G1+6ttzX/UI=;
 b=iVa441bxpPw/kxphP2bB0EhDfSfUU+AEpae7MNiooEnE3iXm04rZyAJ9vfSz95sTh2t35U5G8cdIRIHjS/DXBtmhXYNVMUaT/U1CsxdNIKSWas5diylnZ9eVmdVUCb5cdTjq10J/5wjTeHJX/CYzR5Gb9VLbhZsPnpMVPpbrxKBHBvvsm6V0PMbEpJc7hUK8jfYeujY71Er0ZzjbrEO3jeFRBr7MncZqxaAa0iqmaOj2JTsele+Ir+SnPiR5teobrifK75AbvIRl99fDLck29PvZDRffMhed5vM1ULC+yTLy8/sbKAaqfC6g0z7hhrF8oYBTkoYAjpNrdz+mOiIaKw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v3 3/4] xen/arm: add support for PCI child bus
Thread-Topic: [PATCH v3 3/4] xen/arm: add support for PCI child bus
Thread-Index: AQHbqVNqEyexvvIpgke1QVGEurkh9Q==
Date: Wed, 9 Apr 2025 13:29:27 +0000
Message-ID:
 <24a9ed02f049d3187a14a0c0ad847ff97d346b79.1744203405.git.mykyta_poturai@epam.com>
References: <cover.1744203405.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1744203405.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DB9PR03MB7468:EE_
x-ms-office365-filtering-correlation-id: 6cd07f39-65b3-4635-7305-08dd776a8d52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?SP5LoL2tRoOwHXiymLZSK4BOmk4UivX8OP7w2Hz2rl2WxKYmWVBSuWGDcE?=
 =?iso-8859-1?Q?jq9N0Gp4tVs8ussBXn+spMgiisPcTWiQKLU7VXpqKlEBOURIwjlBJVC3wt?=
 =?iso-8859-1?Q?M0u+438uh84BnKHmHxGygrd1vSJ3sIkSqGmI/JQdracPWCLkV0kxwKSm9Y?=
 =?iso-8859-1?Q?ozMBu5UgPPyYSs85rERVYff6tPKoO0GuQgLb9RZaGkQ2jlJFIQq/rJR9Ul?=
 =?iso-8859-1?Q?/pCl+ZBgeNHQTf4ylklk00+iwYH5lS39s4N21dI2TlbzZyFbL9Y9+ovGCh?=
 =?iso-8859-1?Q?lbpmQU3Pa2QUBXw+U4WQVur6reXqLEFldRZuqbcJO3903S31H1ABVysJk0?=
 =?iso-8859-1?Q?JK71NTmEyaewZSgFYzwmC9rw0/onXDmKueoCiP+8CmDPc2DW6boEXaCPs5?=
 =?iso-8859-1?Q?AbY/a1Kv4oZnr0Rey6stCrFbl4q2M5h8geFV1Rg7gqum5W1z4WduLjljqX?=
 =?iso-8859-1?Q?BnCQotKM2peQ7qDk+hYwRx/z4ihk5LSApZLNFdoml0ki5GF5DOl9hh81Iq?=
 =?iso-8859-1?Q?LnRky9cL2AEWAoNk53DqD8A7Q9vtfQThS5OlhEqQ72JpzUq/S7I9qKtysf?=
 =?iso-8859-1?Q?ia9Y4Ie0nh2QhBzNrQ+L6oVa3ZDDhGTlM8wBD/1F/hH0ri/U19Frm6F6+S?=
 =?iso-8859-1?Q?9FEp8AIy4DD5rYV+Ago12XL6i/uquyVA3gm4nIR897QUqJOTVJcGg2/R2S?=
 =?iso-8859-1?Q?yTR95c7mUSfQIzULKYa7yvKzSay2ix1CKsTvzWMKmmBzZbiZSIZczNG31H?=
 =?iso-8859-1?Q?ejZYJBWxIqoOgBlfmYebuDgNAGzuZrOVi+ZKstk07LBynPnhQ6OnTSmniu?=
 =?iso-8859-1?Q?u3kscXUXl1t7MNnBaW+rfQezhpcM7f1hTERhs8zQZj8q1m7ULzD4KE7Q+M?=
 =?iso-8859-1?Q?Wn/qRbwQlReXoakZaxsr4DC/dNZm0atf7R5bi4l0ZW4/VVHarCqQ/Dcoxh?=
 =?iso-8859-1?Q?nPOL+GDbUX3YzbZCwuhvp2Widhk6YKkm9ZOr+hvqTJz2qkfPos/2vwBZnE?=
 =?iso-8859-1?Q?2naPU+0dwebisaM8RdrHC8DrScf9kaIbjd3DCidQHWk+B5w0SLEfu/NzjW?=
 =?iso-8859-1?Q?GFb0OqCWegxgwIVUagxp1B0Emmout3UVjc2r9zRtBhy18Y81xiuVoQ7h/k?=
 =?iso-8859-1?Q?rZh4foauR7bn+oBSQ4J0VGA6qEXCiz+Y1asL7l2qRtPkUbs6OFGTVWyS8v?=
 =?iso-8859-1?Q?OhdmDeiBHwM22+aR87BGrmIuHxSuvJfkPqs5tIfe/KVdIGRRK3G4tpRaxN?=
 =?iso-8859-1?Q?D95hafWRp4tfjN9tYat2KVGZ0UGYN9HV1bjG2nPzqlvQp4+ZJnYIIPGjVx?=
 =?iso-8859-1?Q?oWSsXn0huld5tJQlfprtLBQb9XVZavMHrtWXyJq+5eOawQsb7MGyVJju1U?=
 =?iso-8859-1?Q?ZWxWkdZFZIC0sARCs7YWzVdoJxLaP1342BqR6diLNTQ6ILlwvvApOxRb4a?=
 =?iso-8859-1?Q?wFtSxLCg7fyPnG0GwzHebJX33ZCq584BT9ryyQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YBhKs217EGqrhCYW70CAGi+WeQmAyNv/vhBQacOk2C3Nk5Czvyc9jcRsD/?=
 =?iso-8859-1?Q?0TYgtI0ZWR5NrOPj77BkWi0SLgw2SKmhLtT/lxak8rO/Trt1larWI2Q28p?=
 =?iso-8859-1?Q?2HWz/KBdpxWUcFuF6Z+ibaCg8gNmzBlnC24lgS0m0BHnVnZbO6WslpHmTg?=
 =?iso-8859-1?Q?0B4ar+x2ZOAz8uJARDvG4mKMhoDBodUM+QsyCscr01dlLEmPr3WnQUlz3+?=
 =?iso-8859-1?Q?0iBVyWN4T9IoaxPQegJ1aYV33WKH1I95kbBN9VXL/0pQctrTZ7XaiDyVsT?=
 =?iso-8859-1?Q?OlO/OkwMrZ5ZENzBVJhFxmNObOZmas/ZH0J2DAG/3HbfSl3/5FR6tqInQa?=
 =?iso-8859-1?Q?dJLhKs0mCZue4nhdYs4+VRbRHHwjMfXzMFzUbJYGuBSZM7GctiAA98PbZi?=
 =?iso-8859-1?Q?CATF58Om3R0kbN4PnMrPs5vF7EqeedSySkz6Po02BssjsLoSZd6JjOr6a9?=
 =?iso-8859-1?Q?Ho6KbFjwtUCm44bit+J1o/W7sC+um9IvhNq9ehwMzPXYnlOBuGQB6UDSa5?=
 =?iso-8859-1?Q?upASdS6mYmc71arlDdswV7uPFV/NbzMzMPieuQ/zDqo/h6yVGd5xA6meha?=
 =?iso-8859-1?Q?Rq63aJ0JxSNlbyeTK9AVYrw2t5DQ4VXkelsCXQNbjdUTy/rqhFhaLpYOD3?=
 =?iso-8859-1?Q?NPauy+VYUbiPe3aZYlD4S5I4yFm/uGoKlKB7I5il5GnNGRL9zTLZTAj6zv?=
 =?iso-8859-1?Q?CERWcLOiRVoyiaFqbkRrSzxFF5ZM1r4iHywQZp3x0RYRwAxadzhQdPBGeI?=
 =?iso-8859-1?Q?r4fN8j5D+k3Sv+3T8dJoNOVb6wA4o2bc+CBcFCa5jiUa4zxaczFXpcPGMZ?=
 =?iso-8859-1?Q?NyMM2fOU2X+BkwL7s0OXrkgei6HC1MScEMOSZq1nTel7sUr66Z1GW93eI9?=
 =?iso-8859-1?Q?7i2Wo32rJyO35XRSCPs5j88PGXcNN2fpdbMGeNcJZ7B6D3ywGa/3daeowr?=
 =?iso-8859-1?Q?eyK5CGjpBxRBhfFmhBpX+nCByviQLho15jjcaB5ldfh87BRXZw4VpbJIhR?=
 =?iso-8859-1?Q?0QhASB5Wkd/P88Nnu1+0b4W+N6JkwTnS2hrFYnSz4gDQ0BtaFhxxrhkejq?=
 =?iso-8859-1?Q?s+/nOvP2YLbGFOBdUx+El9Qs51/uGgCkF/5hKxq5WJs3bk8dgSTzUO3e7p?=
 =?iso-8859-1?Q?wFAG2j0/g+ogvoAGFQOijfMExpt5pBihPGp0Z0iDI8dXlNpS1/tjBJArpl?=
 =?iso-8859-1?Q?NjNl7/i0bSh1Q27rJjyCxtyOomoUDfpG47uFi+47yQof4wdi0yuC0gyvBn?=
 =?iso-8859-1?Q?1dZn1dhqwQz8dmdH/gubsrR5UhQeyTTBYGlbFEBLOTNaFig1kmqdS9q+Oa?=
 =?iso-8859-1?Q?uYsbCzhgfz4f3yccPEQceJObACIVJLY4aaCin1Pt+kJEi5hS9Pc+jl1GeT?=
 =?iso-8859-1?Q?F5p4uTjqrrhQtTcRTjcOK/k81a7m/lbZ6uV6L/Xg5jCqKhGtTxPF12RNyj?=
 =?iso-8859-1?Q?cRKaaHiASClgFMRhfHdE0tZnWTGIO0uXM8xzSeDThk45jsI80LdtIHdewC?=
 =?iso-8859-1?Q?nZw+sZg2PXWj2N6h1zUdhHgffqRfzVwjW0W1dMF9jgpaRHKCoVav3+YMWK?=
 =?iso-8859-1?Q?gNOT870gWt76FbueZvUQZnlSSJMWTPu1ks6jKPlsxhEi7vzkMN16FT68zE?=
 =?iso-8859-1?Q?Z8G+jeVbGl4GmzhpSM8vpS3wCrjBKAKIUdmp3DvdvSrGkILQNImYrjeg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd07f39-65b3-4635-7305-08dd776a8d52
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 13:29:27.7368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6gK7yvPJtNmOaMY0YWWcJJqKHs/xO/oBHHaCvUGUZyu/Q9XTgL5usg4me9cq4Jadv3o+V5/MPj9dWBqxyPn1Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7468

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

PCI host bridges often have different ways to access the root and child
bus configuration spaces. One of the examples is Designware's host bridge
and its multiple clones [1].

Linux kernel implements this by instantiating a child bus when device
drivers provide not only the usual pci_ops to access ECAM space (this is
the case for the generic host bridge), but also means to access the child
bus which has a dedicated configuration space and own implementation for
accessing the bus, e.g. child_ops.

For Xen it is not feasible to fully implement PCI bus infrastructure as
Linux kernel does, but still child bus can be supported.

Add support for the PCI child bus which includes the following changes:
- introduce bus mapping functions depending on SBDF
- assign bus start and end for the child bus and re-configure the same for
  the parent (root) bus
- make pci_find_host_bridge be aware of multiple busses behind the same bri=
dge
- update pci_host_bridge_mappings, so it also doesn't map to guest the memo=
ry
  spaces belonging to the child bus
- make pci_host_common_probe accept one more pci_ops structure for the chil=
d bus
- install MMIO handlers for the child bus
- re-work vpci_mmio_{write|read} with parent and child approach in mind

[1] https://elixir.bootlin.com/linux/v5.15/source/drivers/pci/controller/dw=
c

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* no change

v1->v2:
* fixed compilation issues
---
 xen/arch/arm/include/asm/pci.h      | 12 +++-
 xen/arch/arm/pci/ecam.c             | 17 ++++--
 xen/arch/arm/pci/pci-access.c       | 37 +++++++++++--
 xen/arch/arm/pci/pci-host-common.c  | 86 +++++++++++++++++++++++------
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
 xen/arch/arm/vpci.c                 | 83 ++++++++++++++++++++++------
 7 files changed, 192 insertions(+), 47 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 3d2ca9b5b0..addec31791 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -67,6 +67,9 @@ struct pci_host_bridge {
     uint16_t segment;                /* Segment number */
     struct pci_config_window* cfg;   /* Pointer to the bridge config windo=
w */
     const struct pci_ops *ops;
+    /* Child bus */
+    struct pci_config_window *child_cfg;
+    const struct pci_ops *child_ops;
     void *priv;                      /* Private data of the bridge. */
 };
=20
@@ -96,14 +99,19 @@ struct pci_ecam_ops {
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
=20
-struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
-                                              const struct pci_ecam_ops *o=
ps);
+struct pci_host_bridge *
+pci_host_common_probe(struct dt_device_node *dev,
+                      const struct pci_ecam_ops *ops,
+                      const struct pci_ecam_ops *child_ops);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
                              uint32_t reg, uint32_t len, uint32_t value);
 void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
                                pci_sbdf_t sbdf, uint32_t where);
+void __iomem *pci_ecam_map_bus_generic(const struct pci_config_window *cfg=
,
+                                       const struct pci_ecam_ops *ops,
+                                       pci_sbdf_t sbdf, uint32_t where);
 bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
                                      struct pci_host_bridge *bridge,
                                      uint64_t addr);
diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
index 3987f96b01..ad0b2c35f9 100644
--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -20,12 +20,10 @@
 /*
  * Function to implement the pci_ops->map_bus method.
  */
-void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
-                               pci_sbdf_t sbdf, uint32_t where)
+void __iomem *pci_ecam_map_bus_generic(const struct pci_config_window *cfg=
,
+                                       const struct pci_ecam_ops *ops,
+                                       pci_sbdf_t sbdf, uint32_t where)
 {
-    const struct pci_config_window *cfg =3D bridge->cfg;
-    const struct pci_ecam_ops *ops =3D
-        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
     unsigned int devfn_shift =3D ops->bus_shift - 8;
     void __iomem *base;
     unsigned int busn =3D sbdf.bus;
@@ -39,6 +37,15 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *b=
ridge,
     return base + (sbdf.devfn << devfn_shift) + where;
 }
=20
+void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge, pci_sbdf_t =
sbdf,
+                               uint32_t where)
+{
+    const struct pci_ecam_ops *ops =3D
+        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
+
+    return pci_ecam_map_bus_generic(bridge->cfg, ops, sbdf, where);
+}
+
 bool __init pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
                                             struct pci_host_bridge *bridge=
,
                                             uint64_t addr)
diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 9f9aac43d7..cc4787f2b5 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -18,10 +18,31 @@
 #define INVALID_VALUE (~0U)
 #define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
=20
+static const struct pci_ops *get_ops(struct pci_host_bridge *bridge,
+                                     pci_sbdf_t sbdf)
+{
+    if ( bridge->child_ops )
+    {
+        struct pci_config_window *cfg =3D bridge->child_cfg;
+
+        if ( (sbdf.bus >=3D cfg->busn_start) && (sbdf.bus <=3D cfg->busn_e=
nd) )
+            return bridge->child_ops;
+    }
+    return bridge->ops;
+}
+
+static void __iomem *map_bus(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
+                             uint32_t reg)
+{
+    const struct pci_ops *ops =3D get_ops(bridge, sbdf);
+
+    return ops->map_bus(bridge, sbdf, reg);
+}
+
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value)
 {
-    void __iomem *addr =3D bridge->ops->map_bus(bridge, sbdf, reg);
+    void __iomem *addr =3D map_bus(bridge, sbdf, reg);
=20
     if ( !addr )
     {
@@ -50,7 +71,7 @@ int pci_generic_config_read(struct pci_host_bridge *bridg=
e, pci_sbdf_t sbdf,
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
                              uint32_t reg, uint32_t len, uint32_t value)
 {
-    void __iomem *addr =3D bridge->ops->map_bus(bridge, sbdf, reg);
+    void __iomem *addr =3D map_bus(bridge, sbdf, reg);
=20
     if ( !addr )
         return -ENODEV;
@@ -78,14 +99,16 @@ static uint32_t pci_config_read(pci_sbdf_t sbdf, unsign=
ed int reg,
 {
     uint32_t val =3D PCI_ERR_VALUE(len);
     struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sbdf=
.bus);
+    const struct pci_ops *ops;
=20
     if ( unlikely(!bridge) )
         return val;
=20
-    if ( unlikely(!bridge->ops->read) )
+    ops =3D get_ops(bridge, sbdf);
+    if ( unlikely(!ops->read) )
         return val;
=20
-    bridge->ops->read(bridge, sbdf, reg, len, &val);
+    ops->read(bridge, sbdf, reg, len, &val);
=20
     return val;
 }
@@ -94,14 +117,16 @@ static void pci_config_write(pci_sbdf_t sbdf, unsigned=
 int reg,
                              unsigned int len, uint32_t val)
 {
     struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sbdf=
.bus);
+    const struct pci_ops *ops;
=20
     if ( unlikely(!bridge) )
         return;
=20
-    if ( unlikely(!bridge->ops->write) )
+    ops =3D get_ops(bridge, sbdf);
+    if ( unlikely(!ops->write) )
         return;
=20
-    bridge->ops->write(bridge, sbdf, reg, len, val);
+    ops->write(bridge, sbdf, reg, len, val);
 }
=20
 /*
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 7ce9675551..2b058b5f5e 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -57,17 +57,12 @@ static void pci_ecam_free(struct pci_config_window *cfg=
)
     xfree(cfg);
 }
=20
-static struct pci_config_window * __init
-gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
+static void __init gen_pci_init_bus_range(struct dt_device_node *dev,
+                                          struct pci_host_bridge *bridge,
+                                          struct pci_config_window *cfg)
 {
-    int err, cfg_reg_idx;
     u32 bus_range[2];
-    paddr_t addr, size;
-    struct pci_config_window *cfg;
-
-    cfg =3D xzalloc(struct pci_config_window);
-    if ( !cfg )
-        return NULL;
+    int err;
=20
     err =3D dt_property_read_u32_array(dev, "bus-range", bus_range,
                                      ARRAY_SIZE(bus_range));
@@ -82,6 +77,36 @@ gen_pci_init(struct dt_device_node *dev, const struct pc=
i_ecam_ops *ops)
         if ( cfg->busn_end > cfg->busn_start + 0xff )
             cfg->busn_end =3D cfg->busn_start + 0xff;
     }
+}
+
+static void __init gen_pci_init_bus_range_child(struct dt_device_node *dev=
,
+                                                struct pci_host_bridge *br=
idge,
+                                                struct pci_config_window *=
cfg)
+{
+    cfg->busn_start =3D bridge->cfg->busn_start + 1;
+    cfg->busn_end =3D bridge->cfg->busn_end;
+    bridge->cfg->busn_end =3D bridge->cfg->busn_start;
+
+    printk(XENLOG_INFO "Root bus end updated: [bus %x-%x]\n",
+           bridge->cfg->busn_start, bridge->cfg->busn_end);
+}
+
+static struct pci_config_window *__init
+gen_pci_init(struct dt_device_node *dev, struct pci_host_bridge *bridge,
+             const struct pci_ecam_ops *ops,
+             void (*init_bus_range)(struct dt_device_node *dev,
+                                    struct pci_host_bridge *bridge,
+                                    struct pci_config_window *cfg))
+{
+    int err, cfg_reg_idx;
+    paddr_t addr, size;
+    struct pci_config_window *cfg;
+
+    cfg =3D xzalloc(struct pci_config_window);
+    if ( !cfg )
+        return NULL;
+
+    init_bus_range(dev, bridge, cfg);
=20
     if ( ops->cfg_reg_index )
     {
@@ -208,8 +233,10 @@ static int pci_bus_find_domain_nr(struct dt_device_nod=
e *dev)
     return domain;
 }
=20
-struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
-                                              const struct pci_ecam_ops *o=
ps)
+struct pci_host_bridge *
+pci_host_common_probe(struct dt_device_node *dev,
+                      const struct pci_ecam_ops *ops,
+                      const struct pci_ecam_ops *child_ops)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
@@ -224,7 +251,7 @@ struct pci_host_bridge *pci_host_common_probe(struct dt=
_device_node *dev,
         return ERR_PTR(-ENOMEM);
=20
     /* Parse and map our Configuration Space windows */
-    cfg =3D gen_pci_init(dev, ops);
+    cfg =3D gen_pci_init(dev, bridge, ops, gen_pci_init_bus_range);
     if ( !cfg )
     {
         err =3D -ENOMEM;
@@ -242,10 +269,29 @@ struct pci_host_bridge *pci_host_common_probe(struct =
dt_device_node *dev,
         BUG();
     }
     bridge->segment =3D domain;
+
+    if ( child_ops )
+    {
+        /* Parse and map child's Configuration Space windows */
+        cfg =3D gen_pci_init(dev, bridge, child_ops,
+                           gen_pci_init_bus_range_child);
+        if ( !cfg )
+        {
+            err =3D -ENOMEM;
+            goto err_child;
+        }
+
+        bridge->child_cfg =3D cfg;
+        bridge->child_ops =3D &child_ops->pci_ops;
+    }
+
     pci_add_host_bridge(bridge);
=20
     return bridge;
=20
+err_child:
+    xfree(bridge->cfg);
+
 err_exit:
     xfree(bridge);
=20
@@ -280,9 +326,12 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t =
segment, uint8_t bus)
     {
         if ( bridge->segment !=3D segment )
             continue;
-        if ( (bus < bridge->cfg->busn_start) || (bus > bridge->cfg->busn_e=
nd) )
-            continue;
-        return bridge;
+        if ( bridge->child_cfg && (bus >=3D bridge->child_cfg->busn_start)=
 &&
+             (bus <=3D bridge->child_cfg->busn_end) )
+            return bridge;
+        if ( (bus >=3D bridge->cfg->busn_start) &&
+             (bus <=3D bridge->cfg->busn_end) )
+            return bridge;
     }
=20
     return NULL;
@@ -348,6 +397,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
     {
         const struct dt_device_node *dev =3D bridge->dt_node;
         unsigned int i;
+        bool need_mapping;
=20
         for ( i =3D 0; i < dt_number_of_address(dev); i++ )
         {
@@ -363,7 +413,11 @@ int __init pci_host_bridge_mappings(struct domain *d)
                 return err;
             }
=20
-            if ( bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr) )
+            need_mapping =3D bridge->ops->need_p2m_hwdom_mapping(d, bridge=
, addr);
+            if ( need_mapping && bridge->child_ops )
+                need_mapping =3D
+                    bridge->child_ops->need_p2m_hwdom_mapping(d, bridge, a=
ddr);
+            if ( need_mapping )
             {
                 err =3D map_range_to_domain(dev, addr, size, &mr_data);
                 if ( err )
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-hos=
t-generic.c
index a6ffbda174..47cf144831 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pc=
i_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops));
+    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops, NULL)=
);
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host=
-zynqmp.c
index a38f2e019e..75d1235aaf 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
ie_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops));
+    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops, NULL));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index b63a356bb4..468aee1db7 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -8,15 +8,17 @@
 #include <asm/mmio.h>
=20
 static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
-                                     paddr_t gpa)
+                                     paddr_t gpa, bool use_root)
 {
     pci_sbdf_t sbdf;
=20
     if ( bridge )
     {
-        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
+        const struct pci_config_window *cfg =3D use_root ? bridge->cfg
+                                                       : bridge->child_cfg=
;
+        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - cfg->phys_addr);
         sbdf.seg =3D bridge->segment;
-        sbdf.bus +=3D bridge->cfg->busn_start;
+        sbdf.bus +=3D cfg->busn_start;
     }
     else
         sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
@@ -24,11 +26,9 @@ static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_ho=
st_bridge *bridge,
     return sbdf;
 }
=20
-static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
-                          register_t *r, void *p)
+static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info, register_t *r=
,
+                          pci_sbdf_t sbdf)
 {
-    struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
     const unsigned int access_size =3D (1U << info->dabt.size) * 8;
     const register_t invalid =3D GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
@@ -46,31 +46,78 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *=
info,
     return 0;
 }
=20
-static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
-                           register_t r, void *p)
+static int vpci_mmio_read_root(struct vcpu *v, mmio_info_t *info, register=
_t *r,
+                               void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, true);
+
+    return vpci_mmio_read(v, info, r, sbdf);
+}
+
+static int vpci_mmio_read_child(struct vcpu *v, mmio_info_t *info,
+                                register_t *r, void *p)
 {
     struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, false);
+
+    return vpci_mmio_read(v, info, r, sbdf);
+}
=20
+static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info, register_t r=
,
+                           pci_sbdf_t sbdf)
+{
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
 }
=20
+static int vpci_mmio_write_root(struct vcpu *v, mmio_info_t *info, registe=
r_t r,
+                                void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, true);
+
+    return vpci_mmio_write(v, info, r, sbdf);
+}
+
+static int vpci_mmio_write_child(struct vcpu *v, mmio_info_t *info,
+                                 register_t r, void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, false);
+
+    return vpci_mmio_write(v, info, r, sbdf);
+}
+
 static const struct mmio_handler_ops vpci_mmio_handler =3D {
-    .read  =3D vpci_mmio_read,
-    .write =3D vpci_mmio_write,
+    .read =3D vpci_mmio_read_root,
+    .write =3D vpci_mmio_write_root,
+};
+
+static const struct mmio_handler_ops vpci_mmio_handler_child =3D {
+    .read =3D vpci_mmio_read_child,
+    .write =3D vpci_mmio_write_child,
 };
=20
 static int vpci_setup_mmio_handler_cb(struct domain *d,
                                       struct pci_host_bridge *bridge)
 {
     struct pci_config_window *cfg =3D bridge->cfg;
+    int count =3D 1;
=20
     register_mmio_handler(d, &vpci_mmio_handler,
                           cfg->phys_addr, cfg->size, bridge);
=20
-    /* We have registered a single MMIO handler. */
-    return 1;
+    if ( bridge->child_ops )
+    {
+        struct pci_config_window *cfg =3D bridge->child_cfg;
+
+        register_mmio_handler(d, &vpci_mmio_handler_child, cfg->phys_addr,
+                              cfg->size, bridge);
+        count++;
+    }
+
+    return count;
 }
=20
 int domain_vpci_init(struct domain *d)
@@ -101,8 +148,12 @@ int domain_vpci_init(struct domain *d)
 static int vpci_get_num_handlers_cb(struct domain *d,
                                     struct pci_host_bridge *bridge)
 {
-    /* Each bridge has a single MMIO handler for the configuration space. =
*/
-    return 1;
+    int count =3D 1;
+
+    if ( bridge->child_cfg )
+        count++;
+
+    return count;
 }
=20
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
--=20
2.34.1

