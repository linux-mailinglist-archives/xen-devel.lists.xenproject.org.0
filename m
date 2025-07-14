Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA79BB042FF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 17:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042939.1413022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubKqR-0000qG-ML; Mon, 14 Jul 2025 15:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042939.1413022; Mon, 14 Jul 2025 15:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubKqR-0000oc-Im; Mon, 14 Jul 2025 15:11:55 +0000
Received: by outflank-mailman (input) for mailman id 1042939;
 Mon, 14 Jul 2025 15:11:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohjq=Z3=boeing.com=matthew.l.weber3@srs-se1.protection.inumbo.net>)
 id 1ubKqP-0000oW-DN
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 15:11:53 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd41a9ac-60c4-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 17:11:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56EFBkuC004247; Mon, 14 Jul 2025 11:11:47 -0400
Received: from XCH16-06-10.nos.boeing.com (xch16-06-10.nos.boeing.com
 [144.115.66.106])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56EFBT8f003911
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 14 Jul 2025 11:11:30 -0400
Received: from XCH16-05-10.nos.boeing.com (144.115.66.94) by
 XCH16-06-10.nos.boeing.com (144.115.66.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Mon, 14 Jul 2025 08:11:28 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH16-05-10.nos.boeing.com (144.115.66.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57 via Frontend Transport; Mon, 14 Jul 2025 08:11:28 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.178)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 14 Jul
 2025 08:11:09 -0700
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by BN2P110MB1526.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:178::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Mon, 14 Jul
 2025 15:11:02 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519%6]) with mapi id 15.20.8922.025; Mon, 14 Jul 2025
 15:11:02 +0000
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
X-Inumbo-ID: dd41a9ac-60c4-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1752505907;
	bh=L26s6TBm8S1BAD/rKxqHMORUWK9xdRPsz8tQl/w1aZE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MwfS5pWB9KydTTeKR22lSGkqkENkjBAom/U2oijvPub4+4u40rxuuawApYZDIzUTx
	 q6pf0i1L3azjdKfjniNI5dW2DoT/dQbwpz62JpyZhfkwk36HJDAvKy20/7Wf+yzPFJ
	 Y2Ki6BM9Ofs26CdDi1aH0INbROCWtTWc6eLHGIqoQN2zwWW7dyWY8d2IiSZad8WGOt
	 5O7f4GuI8vWQuTmTZwUcwxj67J0BGhe6ZgMLS19wg96mlynzDpsx+Eayba6VdLq+5Q
	 H5ovbhpCSJtPhXV3OKgc7jjWTN5zB/M/BqYak1GYjMKe5XTrE4JK7oB3oBYaFpyedB
	 BPyFGRm9pOcsw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=dMVkyHbDsJDbDmuISE5MVJQnK6X+Iu7JQSo/nz5lkUdkeRy4qKU5yqywm4+gdtWRMAyFDZDFvNSnlm9oGsT4FWHnOPXzCv4p6G/gYNirh8/7VCI8Tswwtg8F0BW3iHRDxu6X9V/tixYoQ2/AcL1oo/TjOlrHXQcmHYAXFRplYaj4yBDKU2htcDpomwOa3jRz2FzgrwNYLb6vYVoI/FEob8ChbbT7Rljy0Ct6LckCy0CPTSQlh9aMwHyhzwl4VDooEbas8y/Kiu6LUzxZxoN/HWBdDxDY5q/VBEhBG9mzVqcXSOfFfKRFLjYiU9M5g6j9Ij+vGNnHYNNXVzZPSLQZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L26s6TBm8S1BAD/rKxqHMORUWK9xdRPsz8tQl/w1aZE=;
 b=bvBfyfQinlZVYPYc5Tk+uo+gLpzRyyWhsaJuE5yk1iKDxWryAeU/vm5vxkOaS9CK+8cANz8fUSP0k8s2O8SmkHaYCXBb7wxiFvRMQSkyokFwE/ZBLZVRibM3wGtueU8tygpQOcgNFBDE4fn0+rPtadZa+s2k9QkQ+vDHUjY7uLfyi3/tMhRK9iPZ071JkwJKLgXU1rVT3QH1V4Q6q1Iqh9uVuuX1CH3ZnvA0BRhrHmTsM9dA9v/q2pfNc07xLlMSAHeo+hPJUADR54dN82vCHzSNmVUWGGGHER+wt72B9k7rIlPf4dSvtVMe4O+VDruk0qMTFz4mUB5csa1BA/gHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L26s6TBm8S1BAD/rKxqHMORUWK9xdRPsz8tQl/w1aZE=;
 b=AFkAI30AUgArsqOU7JJQkLw5XDnXnVaJda4MFOqATPVjQFYDb4sMGN6yAl8vsaIxzMG+V8Evif3TQDYN8xutbcJJhkG0V7Oj/wvXtykhK1V7z72zlcevEb0q4Q5zjfx92pVlj+iJfE+oSZVvu0qsGWipx9cEIMR4Y4f8obWvIt0=
From: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
To: Nathan Studer <Nathan.Studer@dornerworks.com>,
        "Choi, Anderson"
	<Anderson.Choi@boeing.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "stewart@stew.dk" <stewart@stew.dk>,
        "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>,
        Jeff Kubascik
	<Jeff.Kubascik@dornerworks.com>
Subject: RE: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Topic: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Index: AdvmTXSjjVtbwyT/QSCLI/dKN0kF9QKhMe9AACLJK7AAqtXngAAyJJ5g
Date: Mon, 14 Jul 2025 15:11:02 +0000
Message-ID: <BN0P110MB2067D084B32D3F4601C288D6F354A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
References: <BN0P110MB21482D2B6DA8145F2F9EC923907AA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB16295017CE94610DA021ACA6F449A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB214873ADE19EEB94F6B6055F9048A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB1629FBC51EF4E46B99958A83F455A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <SA1P110MB1629FBC51EF4E46B99958A83F455A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|BN2P110MB1526:EE_
x-ms-office365-filtering-correlation-id: 02037ae4-46f5-4f30-fd06-08ddc2e8a5ca
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?soH/IAgtRyX2OklXN4Z9ev8uuCVrNfshSBOsjqKn4NiksCVdECzdtb7pUs80?=
 =?us-ascii?Q?Kz727EmBQoFNY5BagVdncBLWHNKmjK49pakkY0MvIiQ0WmuQrCIn9ZNvn1QR?=
 =?us-ascii?Q?PPjsgLsluwcjcOI07bPd31698nDxTI6vJQSEOzh2dg1+MXORqm3Tu0uiknfL?=
 =?us-ascii?Q?muQ3w0xBooU2KdmSwYVoYLQc3irrchoNvr6R//Trsw7wzpWLACczAp52CrCW?=
 =?us-ascii?Q?eWIv5TUEpyDeyvSCYu/0+8uLxK8893tiVE+6InJJpdlmkgoQT1ssEUI7bNdm?=
 =?us-ascii?Q?Zty21Ow309shg7cDCPvY0YHADg8xLbmkDTqlI594REksfxtFkek2KZnk9yvq?=
 =?us-ascii?Q?OWcMtTYG/KmMxsEPLTg+TI1p5ITEPTGCLg6sr/MeKQfkj04i0PNW6hyqnPQy?=
 =?us-ascii?Q?FTZqHcB1KolpjXco4IOKYJL53ci5FWtuk2GLRU7RC++QE1viyZDqgFxCTv2t?=
 =?us-ascii?Q?RpND1LHhGfPEyU6cBjkG2/ucAS7LKcSa0l1Vsm2j1plzFPDvftAcH04ywkkd?=
 =?us-ascii?Q?QyrRs9fFpPnyjTRTfM/sWhlPuaiad0uO2KWCrH882w6+s5DoAaVFSuwearZE?=
 =?us-ascii?Q?kC3dB8bOERQhyR4LV+E9LrPisfumOyrc/6yvZJkOrUyyYImSH5YWxsejjST7?=
 =?us-ascii?Q?X4+gPlPDBzp4Ggi4h4AQuURAJAVN9uW1p5JHWgca6ztWEHFMCsEyLQMCLDwA?=
 =?us-ascii?Q?0eAI5ItTP5u/Wnq3LgpOWEFZUHH3DziSJCbvUEDlZK/Ld0nIEkHCM+b0TNrS?=
 =?us-ascii?Q?bctf/R20NIEgbyI4YOIiGLYeQaJspIfDFYbl3jJeUqUzn/xvJ9/JjWdTV4Us?=
 =?us-ascii?Q?KXDJK2mxFmLLXldbRW0xSiyfVVMk1KUY95QmSWaJNlNvmwUOQ5Acr57fGWar?=
 =?us-ascii?Q?m2PHskFB9YMjAXo7+2gPNxveLMnEJau+9wYtMwHA/Qivr5D5Z+h8Jpdsym9L?=
 =?us-ascii?Q?duztxpqLkFLuanUEhOR+WeUQLvK8CLjXcJI5cjNDU2IywzI07jORAonxVFdS?=
 =?us-ascii?Q?6TrhzQKykV7zlnx+TN9juVTRMnSPpq5MuThCUAfimLyNrM3d/NWuGMP9LBc3?=
 =?us-ascii?Q?EqUK0RaeR3S8S9CKvCX9pFMFQ79eZjFK3aKlK4RrIwK9pA6PNt4LYXjSSbVm?=
 =?us-ascii?Q?3Vfa41aPQ2jw7QW6MTbylXjX70MJqeCSg6A7HvlJso4h/Njd7w5ufvE0WpTJ?=
 =?us-ascii?Q?rYjTnR9hOaeLqhcsp+HDsmzRNUV6BdvscEDxwfuUTW9YRMxz+ac6NbfZmiqw?=
 =?us-ascii?Q?M9qsonGOXqf+ZlkZgnH9Sis0HVx9AgPyIId3lgN/dW6xn7ykw6WFlUhu025a?=
 =?us-ascii?Q?G4ZCMIALbGZo5ZCSWh96Bj2Pdci7Ofg4djVfsHWMu3CNYPIbxanp1+EAVZy9?=
 =?us-ascii?Q?JAz29ogD5S17pcaJeURTjP20GKsIl02J0x9dNox/TOy9WXfOLvJuSs1KRa55?=
 =?us-ascii?Q?ZtCv+rEaliiizXtMPHfmn7pICQD20T/jLXT0XNiNVTTlUECU06p+avIZuNkm?=
 =?us-ascii?Q?HOQDoW4O1AGTfpo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4TBxdTVsjnEmS8q2lFOu4d0N0MbXppPIccjD/PRf+KjXfoCd3au9kh7dsEL6?=
 =?us-ascii?Q?8Ur1q43oxPugxwvPF3XeloI6BtNPdCKBt7WRuPv3/LMZKX3j193vjHyAM1hU?=
 =?us-ascii?Q?258rWCfP7aQ1pTzfh2+ZfgpT5LmxZthqaf09nUNTsSoyXiB+utUtvkJ0eR3i?=
 =?us-ascii?Q?e/1w1LmkaXKLvtkvBpxZj/VZ6aOMH1MWqHpnd+LVt/k33/Mb8IL4K/nRhM8R?=
 =?us-ascii?Q?r64vdQIdZ/zmN0vF7LSmSqKzQ0Y1JwP5YZcXYuVlVqvE5hv+RZMr10VndfYA?=
 =?us-ascii?Q?twmQ3VfMFUJYXksOs8y5nrDxV2QkFMs+2UFG2f0ZrvCM70RdjKYPoNgz4Jbc?=
 =?us-ascii?Q?WjI4o47giMd8vul2SMGxgOofF8cRwE5brIhGk1FDsbbB7On/ObGACWlOr9CD?=
 =?us-ascii?Q?bWmRJhPFLQxSnE7zq896KKdY1XHA2yCuqEgqngVuxfREYphw0CTn3OqHZexr?=
 =?us-ascii?Q?51ZTNVmZF9GR4PE9srRJ7MpwrHl+beJHEOWyoPEb7WGSUyb9NDTHKxcwkh/N?=
 =?us-ascii?Q?fE55zsNv3wXi0ENTw4pmxnlgLL4vZR6H8LWD54n78cGA7ILD8MHQ7KGDJ1OQ?=
 =?us-ascii?Q?9X0xfG0onRuAEr7Bpf4U9AMtWCjBG4EgBr3MIHB+skZKy60uL1r9TXrB15rI?=
 =?us-ascii?Q?6ZSmsDx1TY7pIQ6MeWHWyM67/uOF9tCNLFJ8YOxni2HcBFiIBleaI3BEKYZu?=
 =?us-ascii?Q?0tJfMDfV70ODojC2ZKwj5QgIzxzUBmnrcqn7vXJ/Q2Nqiu6jgZeT4XILxlFJ?=
 =?us-ascii?Q?dRFegMT302v87kQoJ86tau3oxTv9jCU23sm1iJLd2wp3sns9LITz1DxAnten?=
 =?us-ascii?Q?Pn+fbUo04EeHPnia/3hNd1IajKrdQalJNz4PGU1OcOCjQ0BFrqYriyMuPVbA?=
 =?us-ascii?Q?qOJAG1VXDlHK841yIr7xLmNgw3AHeeDYy0xAA2UBaeLT1e6s00E8psjm0jKh?=
 =?us-ascii?Q?GzwJp7T0BGgl+PJGLHnvsPFgvciybns1FIrmv8UI9TlnQ+0kDZBjZAKVDmjn?=
 =?us-ascii?Q?4Ifm/txa6kveYWE1hrVDLjLdH70a58IhDzQoHORIdHjudXUNGyUdjqR8GIL6?=
 =?us-ascii?Q?t6RcI/Z3hLzPIrZnOW/jcwETzQDiVOT/YokM5WgPRXzcAdtT41dW3cICpkcx?=
 =?us-ascii?Q?+cJWK6GKc3Nxm6O+2aSjYHVCX3mLmc1SytcVcMkRcoSooIfnrikvG6z5mlxF?=
 =?us-ascii?Q?58HQAdrDZTnXvLfzX+ms+Cblod5odDh44Yk4oma1vbkANLqkl4Bkl7cKnM3S?=
 =?us-ascii?Q?jai/EKWG10bYESZ7CLZaKKTdYME7ldzYvn+iGuFdh2dekpRFC/5zLFx7fd4w?=
 =?us-ascii?Q?Z0kuNQwz3hzvG27vEdYHsxneKXzPLMdEl9+DnTpqVKRkuTVDCzkQSlfTLrwP?=
 =?us-ascii?Q?ybtCZuffBsGJzPYuOcaM1F13wb90L8un58u4YAThuc4KOOJm+DXnfpiVYR3Y?=
 =?us-ascii?Q?esbQp6Z8ChDFFvMFovJV+hEmDAIIZWWAfyL6hRqenF3VuqipYH47RJytG52g?=
 =?us-ascii?Q?B2YMcPPBFzMEPhPoVjVHjde+fT/wISTYW2Cb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 02037ae4-46f5-4f30-fd06-08ddc2e8a5ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 15:11:02.5879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1526
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

Nathan,

> -----Original Message-----
> From: Nathan Studer <Nathan.Studer@dornerworks.com>=20
> Sent: Sunday, July 13, 2025 10:23 AM
> To: Choi, Anderson <Anderson.Choi@boeing.com>; xen-devel@lists.xenproject=
.org
> Cc: stewart@stew.dk; Weber (US), Matthew L <matthew.l.weber3@boeing.com>;=
 Whitehead (US), Joshua C <joshua.c.whitehead@boeing.com>; Jeff Kubascik > =
<Jeff.Kubascik@dornerworks.com>
> Subject: [EXTERNAL] RE: Discussion on the delayed start of major frame wi=
th ARINC653 scheduler
>
> EXT email: be mindful of links/attachments.
>

<snip>

> As a heads up, since this is a bit of a bigger change then some of the re=
cent patches, I am working on running a stress test on it, which may take s=
ome time.

Out of curiosity, is that something we could plan to run on our end as well=
 before proposing changes?

Regards,
Matt


