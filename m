Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCMhOUCqrmntHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8278223796E
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249277.1546772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTY-0004VC-PO; Mon, 09 Mar 2026 11:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249277.1546772; Mon, 09 Mar 2026 11:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTY-0004St-Ln; Mon, 09 Mar 2026 11:08:40 +0000
Received: by outflank-mailman (input) for mailman id 1249277;
 Mon, 09 Mar 2026 11:08:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAaF=BJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vzYTW-0003iR-Te
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 11:08:38 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52878060-1ba8-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 12:08:37 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB9695.eurprd03.prod.outlook.com
 (2603:10a6:20b:60d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 11:08:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 11:08:33 +0000
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
X-Inumbo-ID: 52878060-1ba8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqd8cYj7gy2TZSBOlBkbaLMT6N1GKSlKJkUPzNqCtkbo01FLxHG6Q3uxyJ03kCj5CQBdyLE97eueuXbMdLGhp58TCU/Db5WUa4egtwHZd/tU1LZ6cwIJ0nmmbNr3dEE26d9tfRYekoOn6VVQ8A6segUyG+WjZuKCR8v2JHUI2kT8TQfzNdy9OsffZ6RT762MrE88G3CgOPQ7yBQe937oNFVAYqH+QhdrMUZFI//ULZChed0DRB/nU4tswXTVpnZyrgdJ4Otv5Kjdu1KN9Ag8p9st0gaydhIcFSLlPoZks+FFfD44UVcmR8eec2OkyA3jdF6l77EQrW9LACucgkI28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIjXoyluGNn9xI4dhnAjl42ZVBDPRjpiZelesPBUChw=;
 b=tWIRsOk2mLToM6/blopyO0HS0cFJh5OKhmN20RRJzSLN7EQxaO1YQJsRicwIuGMRd2o86sFbjps5qfVBPIj803vGM6DFaeLi4jCh/KQLmv2xzf28D0PHesuK8SaesgWeZmvKY3uYFfbU2EPEDfSNJF33nLs6bSJybtsWleeWeQOwGbqHDNTxp14to9kBVYZUNd+VfhgYocGAGC7VQFZS2OURF5kqmL6CWMxTYw2ORTsPX7GtY/Lq5pQ3VjJVDQ7gHMi8XCBIVa4pqAz3FEqoS+gZ0xH1v/loKFqvE8uquzBeYFrLRNUIgGMdwmwiIaPBKjxsS2ozjWwqAiuTnP2yxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIjXoyluGNn9xI4dhnAjl42ZVBDPRjpiZelesPBUChw=;
 b=icksVjs0RBwAZ6amoj6d06hDrO0Vm8ttxzyCLQ8vMPtDNjkTZOI4HCbAandGHlQWxoWquwz7+wCIGzVEYVWnGCVWP66444diOPJCdLRoP7uKnkfBlHLKyfA+dwBReScg7tjKnA97s7qurwF6Yvu0PpDtXH+JCQ52S3fCmlt6hlLZ3WihALk41VgiThD8zYzSV6j2mK9jzDj3oCufaWg1NG0o/Z1OIKVU1iWjVaE3e8UJwyFeqJWxOX56JjQ0nfRvZuZkVjEtD10F0nog+4yPTn4BW+sLRWM5oi52wVUXW5ZFwqK4BMVDuejkbi2ugCvjIgEwqsyvucv469QiA33YhA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 7/8] vpci: add SR-IOV support for DomUs
Thread-Topic: [PATCH v2 7/8] vpci: add SR-IOV support for DomUs
Thread-Index: AQHcr7UO+MwgiaR8rkeSbkx2JKFNaw==
Date: Mon, 9 Mar 2026 11:08:28 +0000
Message-ID:
 <4df03dab1dc6ce3ac7524b9f06641bc90889f743.1772806036.git.mykyta_poturai@epam.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1772806036.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB9695:EE_
x-ms-office365-filtering-correlation-id: c39d720f-7feb-489e-8530-08de7dcc3437
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 US12a8QYXxbqfc0jdD1/5pKn21z0T2D2rwo7FlXKT3EdnjTJZCMqDH+0JAvFGZ4HgxSunTdrHuAMmEnZ2lQdRqmoZjXV1thM7zTqP+0DkJkZyLwaf9NuTXH4pskfkUp24uzetDbOo/1F1D9hHaO3309t9Ci6N0ksFQzMYikrAMM5XLAVrcDvqI5aB+9drUCbkEIWJWwbd1LzdLPS8A+rJnIdHy5Kc95BC0Za5w7KYsrgEyRLjCy4kFzwnyzt3EGTUzv+/X1u3yDOeL87ZL2mwlxPrTtMSCk1PSxHk7Ge9mX3GUIoM6BBZfppLLsK4Pg7PJrS1keWL/BYbJafi4B/GxHGpNQ0RLvWU+LuSKSSrOlbRyuvvOkjOb8tyEjpN0x2evYPl2EpjGrEkMh0jir9jDYyi4zqmdGUYhvGuFvz/nQKAO1qjEwNXL4eTa0wn1dl0Z8B0TTsH1hBsVIZEkEwAwowuzxfy8sTv13xmNnYE1QjwjvY0LztSAPWRI3vujdXzeY/8Kh870Ix8GZ/4w+m36mPZRVLXTTdSiS3VJiyypTzCQDRl09w98UEzQSi1cWgeOchvcq+Woeu0HF7M28LtdcAR0p2/RW2I7gYnKkY3rudMdBClwbmZ9hALoYuJXN+PEoiHgOZSacRcqqWggM6lBEXtV5HFSZ3BbsQB5H2t7jvvsldGwQRfRKfKxNqUG3JKNfBXApPolQVFwAik6TyulJLxWlJ+foTwp7dvLkXEwI+QPA7toerZdfQntqYEBAAJj35gUaByObicO7eK3Y1lJFPa22FBTT3XYkuZcHMN5g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KB3hOanFokbhrM5e0rg3V3DBJYCU2FKzvsTbQg+5FOCYkKS84zN3n0w0Y4?=
 =?iso-8859-1?Q?oWn3z6xqkj9i1vRpZYarCkSmSjEUcfdsgvq64vfjcZxcqDoX8Ncoc2V2ld?=
 =?iso-8859-1?Q?nw/B0eN+zr0lIKWEFdmxnRqJQt2MIc9b4r3a8CiANYtv+U1m4HlCFwEnCC?=
 =?iso-8859-1?Q?dlowIZYZEQf5gqS2RKon7mk8hqq3vcPz1DQXf0THb5ldQzIV3057lL6+gq?=
 =?iso-8859-1?Q?yZH1k+7B5iEH5cJ2wFGN6WM/YZuKsUWf2a97uCuGgU6CxbPPlGI8F7kK/s?=
 =?iso-8859-1?Q?VsfWF594DD0U4SJ8+ly5KtZpDHUDCVxEOlk7fdVOM8SvzTI54dq7mhtVFn?=
 =?iso-8859-1?Q?QWqu+SiSoEeSaN8T0WCT+pjOaAOLpH9nUm920lNaGGrdvlvfJqibh4GaVd?=
 =?iso-8859-1?Q?K6SI/OBsEbxohI1h/lhQFBMlEscLB3S7IubLII4onqirnwUnvmlYkHUa7E?=
 =?iso-8859-1?Q?eXOe8N2oA1glHLkM1uVQ9QLZj7dmDmWKfx4U7Vh6vsNpqooCMOCYShNuFw?=
 =?iso-8859-1?Q?xiDmvbwQfebkgsyvp/sMcZydEQjFxFS2IR0U8h9V7198QQ4lpZULG59IN4?=
 =?iso-8859-1?Q?n+c+lunwo70yYnWJYf1K3/9Q+Sv5YTeVqTLza3grTsYFfnYdMjzErRV5HM?=
 =?iso-8859-1?Q?OjZ7cHIfz9CnFTglcnnBOckHBpxvF64zSa/RNK6GC9FEh3NjkP4bNsu5QM?=
 =?iso-8859-1?Q?Qiu1xuM4KaTBRHfPFosLPt/cZUE7Rg7FbBGeohloV+tamF5bDI08Z45xl2?=
 =?iso-8859-1?Q?X9sXAn16lAf17bCvHo7E8XAHR3IobvU15r+KLADohicRevUnb4NUXi6YiQ?=
 =?iso-8859-1?Q?MIrUCWlJLvrkHItPouXrHW8jhteFG5cEDIdjSPg/c7AisMsyLa48l8Nt6S?=
 =?iso-8859-1?Q?BtgP7rZTso9B6SzdNloXeCMFMe29dsehmzPyPfCeEUuGMMrPoXBu+71DID?=
 =?iso-8859-1?Q?wCKL4OZvB52I1NeK0AiuLhizpsKo2QDzK02uGhHcMK9a5VYoAbLum+7wxz?=
 =?iso-8859-1?Q?PyN2ZYvqhwIcbrdkOd8FKZGiV1lpS7KRrBQIo/+5/Dhe9nVG8If+P5VXS3?=
 =?iso-8859-1?Q?rXLrWxGNthf4yQkXRht3EDJoUsUoKAjytrpQaYstt/jkdrLEQPZNzbL2Wb?=
 =?iso-8859-1?Q?StYLGT5jdutavNVvWUi3aIpIPioCmY1ppHA1C/6FH72GNxKCgIzGCHzzge?=
 =?iso-8859-1?Q?5rPyiLVHjlYVfcwOK5ztmBeXYNiAq11lXvBVlA2DUkqTVpyYcOTDBcbQjy?=
 =?iso-8859-1?Q?udRRGKg4p3RDlLGWrLvn6Uz/QNAp/ARKfevoakkMWOys2vxAzg4/2Y4E8d?=
 =?iso-8859-1?Q?XAzUbs5ANpgJmKOYK0vJgZ4zTMa6EZOD6s6LUrde2v/aNtKB4k+FhV7xYi?=
 =?iso-8859-1?Q?IEZw11YEy4RG1Xl3kLd7MjaZyfeeuM//rGhCAIsJtU1GKdzRtMMRk1tQfS?=
 =?iso-8859-1?Q?i0gQsSwyxC4ASf1lqw2c8Kwq/pBzAaJnxRpHeoQlI1kJkqjeBlQfZ7ddcv?=
 =?iso-8859-1?Q?UdZ4GkdW3HhX+Pmmgr4uaMe7t639r9UswIipVryQxat7AjhO7QbhIIemjq?=
 =?iso-8859-1?Q?A9ZAFzADlIWkRFA2uj624bFXO/Ic5SOAoIUYOeYfDZNlYnThhLxtBg1nKb?=
 =?iso-8859-1?Q?+niyNwIKhRZFza6DvQc4/5zacnjBX83P4Av5XYbEGf+s7g4qRrGaTHLq+d?=
 =?iso-8859-1?Q?neo5jl5T2qiqfyGOsrN50nvF+AQFqYWqUdeaL7od1V7KTPCXJmIyakmQbr?=
 =?iso-8859-1?Q?CJgEd7N8CLeVXvc6nfuwK/N0kLnvTdKkr8SQczhaZMZTcmz9UBm/cvwu/d?=
 =?iso-8859-1?Q?vo3UOo/8qRNr20wwF4I0WXMIGv77Pa0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39d720f-7feb-489e-8530-08de7dcc3437
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 11:08:28.2601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: meoYxEVlFmzSkLtlCLYWjSmiZZc//L3Tpt8twbzfGmw+BEdX8crR9YtB07/y3I+FNpb2m5sHjJZze57NBLbIlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9695
X-Rspamd-Queue-Id: 8278223796E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:Mykyta_Poturai@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

SR-IOV virtual functions have simplified configuration space such as
Vendor ID is derived from the physical function and Device ID comes
from SR-IOV extended capability.
Emulate those, so we can provide VID/DID pair for guests which use PCI
passthrough for SR-IOV virtual functions.

Emulate guest BAR register values based on PF BAR values for VFs.
This allows creating a guest view of the normal BAR registers and emulates
the size and properties as it is done during PCI device enumeration by
the guest.

Note, that VFs ROM BAR is read-only and is all zeros, but VF may provide
access to the PFs ROM via emulation and is not implemented.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* remove VF register handlers covered by init_header
* set guest addr unconditionally
---
 xen/drivers/vpci/sriov.c | 57 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
index 6f691149e9..1c408d1c6b 100644
--- a/xen/drivers/vpci/sriov.c
+++ b/xen/drivers/vpci/sriov.c
@@ -303,6 +303,63 @@ int vf_init_header(struct pci_dev *vf_pdev)
     sriov_pos =3D pci_find_ext_capability(pf_pdev, PCI_EXT_CAP_ID_SRIOV);
     ctrl =3D pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    if ( pf_pdev->domain !=3D vf_pdev->domain )
+    {
+        uint16_t vid =3D pci_conf_read16(pf_pdev->sbdf, PCI_VENDOR_ID);
+        uint16_t did =3D pci_conf_read16(pf_pdev->sbdf,
+                                       sriov_pos + PCI_SRIOV_VF_DID);
+        struct vpci_bar *bars =3D vf_pdev->vpci->header.bars;
+        unsigned int i;
+
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
+                               PCI_VENDOR_ID, 2, (void *)(uintptr_t)vid);
+        if ( rc )
+            return rc;
+
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
+                               PCI_DEVICE_ID, 2, (void *)(uintptr_t)did);
+        if ( rc )
+            return rc;
+
+        /* Hardcode multi-function device bit to 0 */
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
+                               PCI_HEADER_TYPE, 1,
+                               (void *)PCI_HEADER_TYPE_NORMAL);
+        if ( rc )
+            return rc;
+
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_hw_read32, NULL,
+                               PCI_CLASS_REVISION, 4, NULL);
+        if ( rc )
+            return rc;
+
+        for ( i =3D 0; i < PCI_SRIOV_NUM_BARS; i++ )
+        {
+            switch ( pf_pdev->vpci->sriov->vf_bars[i].type )
+            {
+            case VPCI_BAR_MEM32:
+            case VPCI_BAR_MEM64_LO:
+            case VPCI_BAR_MEM64_HI:
+                rc =3D vpci_add_register(vf_pdev->vpci, vpci_guest_mem_bar=
_read,
+                                       vpci_guest_mem_bar_write,
+                                       PCI_BASE_ADDRESS_0 + i * 4, 4, &bar=
s[i]);
+                if ( rc )
+                    return rc;
+                break;
+            default:
+                rc =3D vpci_add_register(vf_pdev->vpci, vpci_read_val, NUL=
L,
+                                       PCI_BASE_ADDRESS_0 + i * 4, 4,
+                                       (void *)0);
+                if ( rc )
+                    return rc;
+                break;
+            }
+        }
+
+    }
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
     if ( (pf_pdev->domain =3D=3D vf_pdev->domain) && (ctrl & PCI_SRIOV_CTR=
L_MSE) )
     {
         rc =3D vpci_modify_bars(vf_pdev, PCI_COMMAND_MEMORY, false, false)=
;
--=20
2.51.2

