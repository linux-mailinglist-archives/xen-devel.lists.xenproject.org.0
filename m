Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859B6CF711C
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 08:39:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195836.1513732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd1ei-0008B8-Tb; Tue, 06 Jan 2026 07:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195836.1513732; Tue, 06 Jan 2026 07:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd1ei-00088m-QX; Tue, 06 Jan 2026 07:39:04 +0000
Received: by outflank-mailman (input) for mailman id 1195836;
 Tue, 06 Jan 2026 07:39:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vd1eh-00088g-6q
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 07:39:03 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c490df79-ead2-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 08:39:01 +0100 (CET)
Received: from AS4PR09CA0030.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::20)
 by GVXPR08MB11536.eurprd08.prod.outlook.com (2603:10a6:150:2c3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 07:38:54 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::66) by AS4PR09CA0030.outlook.office365.com
 (2603:10a6:20b:5d4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 07:38:52 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Tue, 6 Jan 2026 07:38:53 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17)
 by DB9PR08MB11545.eurprd08.prod.outlook.com (2603:10a6:10:606::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 07:37:50 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b]) by DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 07:37:50 +0000
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
X-Inumbo-ID: c490df79-ead2-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jmAHBBahRZ8OO+SRYTTItkLTdqqKdQS4fdSXVYZglsO/tY4mTGF3hmSmnJnAX5oGnLtkw5JhqMff+vX0gI/4D4G117z6PiWp94hQsvEplKBt9vWapntavuJXz5TK0NBI/7MF5+J0ZHBVC/UgK32e8yFiB82/pDMycxMnbon799xjB6wcEC4PEfuTrL2I889TxePb58VXB/E9ONuTWq7/PUT3cwl6DEbdHsmpnLhVPUoM9BN3h5aHB6wgs+WWgf1MXdhe42AC19UhC1Ux5f/3EYCY0AslQglKe0USC2XLICEWmLS6v2lRa8i/0oj6fGM0z/ywoIEuT4FUCf+hw0Gagg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Dwqc33X5Dlp7xZffu3FfBk8YWW4XA667tnXi8LDJnY=;
 b=pTnavakCzvR7qzJDIa39A1UPoPQ8mqMDie1s63V3qt6CtXQtMF+HktI9vivdOTmccyAXhzlpB3Sexjopz6qMNUH8D2fYCmDh+p9pzX30U8CZ1dISxZMgLZbQ81bQAp4bo8R+MvB5n/rTjOWAUv6yg0IJZpb5QRbAJtqTVustrZeKtN4sgwXeTIoS8sFFhufRXLkFboMKozJ0PDIas+h17Fu5FPPcVceoXAZXdJFmoHUS5OpKgUul78dJCNjkoiyXwLkMAcnBDMFWI4KMsOCu/0gZEpWVjezADgs6P9xc4NjUY+qjQ5dJbpyLKnD1Eg+dnwuD1h+18pOP1YC3TANH/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Dwqc33X5Dlp7xZffu3FfBk8YWW4XA667tnXi8LDJnY=;
 b=Xjc+banGmePP60aYtfBxTNBl08ysc+hp5IoXdbjz1t1EHhTLKmb7BoDbG+L1kWmVWNyLjYFIq7KB8f0eX8YY+tdqTB9nqOZbIvhNsYKqB9VVzrYaR6shnonA/Mu8BI2DCuhGFbpgL9W3JJzJRROIyNaQC5ny5PambLFP8aGiL0M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpoXJlaiwVIk6nhBVH2sQXQ3KQNBUhMYMhlrp30rYnahrHc3SG8m+dFOkhJX/CmEjqCMP5oWXy4N7pWKCwmj/3XqgO6/3IhmmoMYrUXahLG3lWJ+ppo6+gHpCHL0mocuX57+yb8HuTMiL+k27XaqYIepy64qbi3X6mBfigmyDyFrTbHiLjrKd1AxfVcDRLF3WN7t7LUq3LD1+GgLL1Q2roRrhc1BmDfRRHxwh3wBLCUmRseZuGxPbJpJdoXkT0DFWiDfDkKJ/lxXjO0yVI3nkbYgiN5pV1Speln7ACtT2V5wsdryjVWLKcJJk9M04lPLZ0thUPCY53tIHcVSTj2aaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Dwqc33X5Dlp7xZffu3FfBk8YWW4XA667tnXi8LDJnY=;
 b=M7o8DaZHAmRDGA5EAJZl8ObgwA8++qOPmBchYSXd7RjZbdNGCogZbaU3/Wt6s3/uWxx5wKzk5lPMHG36jn1WzPBXDR9ZDzwUSMhJnKHa1WybtT4d+wHMFJQend22948g6iiJzEgJGPe3nWfPr8FpTvm6kmGiwYOJZCuN2AqKFqLfgBMPUgHEhZiTk+q01kmxrRORb9/j0KXJcbecNR/b9cyO/9x7gw/hO/yQVZiJdUBfLY1IONgsvPqlsTlG77hGlYe0IW//CZreOGXC9ezuTjNKMCojH0NbXf7erDkYjAdLa/tAIyG8WjBbTVfP/U5rWlmsLz9Al4XFFAQ6CDEn+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Dwqc33X5Dlp7xZffu3FfBk8YWW4XA667tnXi8LDJnY=;
 b=Xjc+banGmePP60aYtfBxTNBl08ysc+hp5IoXdbjz1t1EHhTLKmb7BoDbG+L1kWmVWNyLjYFIq7KB8f0eX8YY+tdqTB9nqOZbIvhNsYKqB9VVzrYaR6shnonA/Mu8BI2DCuhGFbpgL9W3JJzJRROIyNaQC5ny5PambLFP8aGiL0M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan
 Beulich <JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable as
 much as possible
Thread-Topic: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable
 as much as possible
Thread-Index: AQHcfj5G7fNp7PSkb0GiHPxZx0yorLVD4eGAgADfJYCAAAEpAA==
Date: Tue, 6 Jan 2026 07:37:50 +0000
Message-ID: <DBA9942D-FF7E-4ECB-BE2B-3C8814A4B4A6@arm.com>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
 <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
 <FBDD1B8D-F686-47C5-8117-BFEF8C8FD3FB@arm.com>
In-Reply-To: <FBDD1B8D-F686-47C5-8117-BFEF8C8FD3FB@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5590:EE_|DB9PR08MB11545:EE_|AM3PEPF00009B9F:EE_|GVXPR08MB11536:EE_
X-MS-Office365-Filtering-Correlation-Id: dab7e027-4446-474a-005a-08de4cf6a42f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?qDwSalro0T8GrHVsDOGpDGi/Sdx+E5niSHRkj6nTghvEQFX5aijb3XnKLO?=
 =?iso-8859-1?Q?vsMJ3tLpxe+K0Z71cX/fvgHZ3BhwQgKkYU/LwZhCwSjwpfPRcrCZHcWulJ?=
 =?iso-8859-1?Q?1s+3SFOBb8tD3jNIBsfy41zvGahgEqRg55velP8S4kFtX0mTPo8f+b6Lte?=
 =?iso-8859-1?Q?z+qyqqQ596WVFEphru2xC/t/jK/8N14bl2AIN7c/ZN9nox3bH5oBYQ+UWs?=
 =?iso-8859-1?Q?1m/A0Iu4Zj60hRtuJkUgeA+hMxsbQrwTukPTb/wcMyzGP4tUo/lbRKW5bG?=
 =?iso-8859-1?Q?AOxSReg+KeWS5TmLXUK1Bnr6/TTPZPousJkTf5HbltsQRHzGckyKJGISQD?=
 =?iso-8859-1?Q?eq+RaHc7y3lz9irNoXqh94hFmk+Ij9MwPYksnI5gJqxOw2eK94Cnt6zb8J?=
 =?iso-8859-1?Q?rXt1P1sHFaAlLNaVzHgbwbiHFeiaZ4B3jlRxDXk1gmLZYaTceYeK4c+pHW?=
 =?iso-8859-1?Q?GBCLwwPxjL4UWOr9+akSuhUYKed8Kt3aF5oSM8HMkUJQ8nNjO8rUR3qfjN?=
 =?iso-8859-1?Q?uBOs+e0SBva4EHXDhtNbrCAwrtOPCXGX5lUw2ptTgFmsyRhthhzmlenvlT?=
 =?iso-8859-1?Q?++RD6qXLfZC0Sy8TZVAne+4Qz2g/Fl8qJZqgDIe1nVxEBtIBMZp2OlogMp?=
 =?iso-8859-1?Q?LKMife8Z6NZH7Y9N9e/jBgaaF1o1bNqN+mtvbEOLlr6OId9clg27DjTYTJ?=
 =?iso-8859-1?Q?6xBJL9NurKS4tB3kARTHY0T6dQ0KuAQ5vhyGJ6ewH/zhV2UfR0M9xl7fam?=
 =?iso-8859-1?Q?ilZlhsIlGlfyja9iEFgfLdwsSfRr6P8CXQrByVv+FOsg/MTtvJ+bT+4h2r?=
 =?iso-8859-1?Q?+lzZXDOEJIHTT+HWbcPLjNoTh4CNcZ0YEn1WFBgHXuC+s9uI34fFD+8Typ?=
 =?iso-8859-1?Q?zOzv9jM6Dm3HOYQBn+UG177GYdrkXgutLV2Y2i5YEpH4bjaKSldk81ThOE?=
 =?iso-8859-1?Q?Aa0wxyo4iY6c6M2GqPlqml2y0C06hCXkJvuf3ZutYWTkVJx5HLX2hpNPAq?=
 =?iso-8859-1?Q?gICSf0tAl5XhTtT6X4gCXIVsaYGSEPxmWffKAtZP4+btlZKlDEtQDLmbYT?=
 =?iso-8859-1?Q?RkTs4JzBHlOXJzzkt1jkdRWc9VayX6nJ/oucandURc2b8zZQLaPgVLCnII?=
 =?iso-8859-1?Q?dAzzQAHV7JogDdMNbkFKow9xjrvTgoVOip9dGI18NeHcwbddzQpPFEIVEr?=
 =?iso-8859-1?Q?NCqu+skSKwJgi9s3u1ZXLmp3BhcD1MtVUVt0x90ILoR90xrzLaEUYZce5J?=
 =?iso-8859-1?Q?D81IdiGE98bPaaaEo3AYFMR/rywZDQonDrLd1lO2HWS87ScqMxn2o7OW1m?=
 =?iso-8859-1?Q?KciobBuZJCY6ngqwDqC9JI0NLMOPtil4aj4sxIB2WulkiMFM1Ykcq0IDAT?=
 =?iso-8859-1?Q?a4jEJscX4cLUdCWVIohexBS0yZJfiA0iRXroqKoIOUbFe+YKLdYsMX19si?=
 =?iso-8859-1?Q?YsAkzjGdpmsUhtLODFkX9tPWFuJClP6iQjjxDQ5ugyQdsNvXRLzzf4MbWH?=
 =?iso-8859-1?Q?GYQKxEGzeneMOtZD+fZ7GbxEP5DTsAH832F/7LmJKsdoTXc8Ei2POMKo8t?=
 =?iso-8859-1?Q?hwNuC0ND5GnsCAfws8enGNil1HTt?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5590.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <84B3E08D5F8E7D4698D75E7DCFA15C9E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11545
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	77fc7f67-0623-4b72-78f0-08de4cf67efb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|82310400026|376014|7416014|14060799003|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?10VhA6oItr6dnAjsSFiSRIlTEcunAm0lWVoNrZuhmhQ4mGacxqQ1LIoeZu?=
 =?iso-8859-1?Q?4BMEp6Y5PL2Y12u0JceYDZQFHwwtKNY9ngw5Wn8d413l5MbPxCYctSTp+4?=
 =?iso-8859-1?Q?BdHpOKDstM5QN/sLNRbbFTjmfu2D/i284O2bZh08IHvIL2uPr6QW3lQ6ig?=
 =?iso-8859-1?Q?5zyBLollD1u+EriNxujinEaBIBuekukjJy3OIbi4KQf72rHau2oC9i9jge?=
 =?iso-8859-1?Q?0BFhhICvjSTao3ZBJsRmmOLYOBVEzo0ozCUJiLr2rQj5bJ770M3iWOcDh2?=
 =?iso-8859-1?Q?MbZ9HIniiD9by067kKwPw5cdIxYngU4UWWDfI6LdzYH+9SSFsMlo/rMUCr?=
 =?iso-8859-1?Q?M1DeoZKxvgNk+AOY28X/kPlF+/NG7L5Je/WQE3UGAxbJB/Idhg058OD4i/?=
 =?iso-8859-1?Q?fHF3OvXcISoQqUbpwRZovon2UyBBOKbWZbMu93aFSLHO6tbhL4Tfs1BQ99?=
 =?iso-8859-1?Q?NLvpTZWGOYEK6du5Cw2SXK7KMAiQzfl/2zU1H8A+RkmD58AC0BmZ2vyqgA?=
 =?iso-8859-1?Q?zoAz8/Ima9Tlu0bZMnraIAXFi+bxXL2NCCCQMqw0d+cSumS6y0vEofO0jR?=
 =?iso-8859-1?Q?yzrZ9n9kftOCqb2qyLT+FuJQiRgF8uF5C8iQywoDIvopIJgLs+fzGI3Ow9?=
 =?iso-8859-1?Q?NKoufBTpZJ3kyE/qzDjN70XCQgxFCNqgQo17COe7ITnlABD/oAmgaC+TYA?=
 =?iso-8859-1?Q?94Wa6AOgbkvHB/HX10HJU0Ww8Zzzw0WXyG1WQ7MSVhTwy29lTqYW0WZ/I3?=
 =?iso-8859-1?Q?FHJHhBB5gml2Ct2c5EuTzLPiEsYGDrPVUaFulptSokXbeqVGYj0xdvwDwz?=
 =?iso-8859-1?Q?2UEFpDYIAw3NykzUJ6btqDq/pR5dEiQvDGoWsYX4GNl9v73JiD6BtANWqR?=
 =?iso-8859-1?Q?6AmVxW68yuZxFZSURjS2eFLkxP1pTEvhtJONGXKzrkJEUwlq6uS/WIAems?=
 =?iso-8859-1?Q?vWp5vC1LrggijS4/pGD/4yhZ9AmPkfuEDA+eC62gOA85cuCBLqkQwIZPfe?=
 =?iso-8859-1?Q?aYlVwhJ8QVJNlaUZhRTHp+qvbJhgZXRUgye3y0c3lLHgvWfK/G+pjVkiDv?=
 =?iso-8859-1?Q?vGLHVglo8qksl3t3eTChZRwj5qwb3bPxHrJ5x4LkSV6f241wQZQlwOO/C5?=
 =?iso-8859-1?Q?KQUBQ52cmlqiKqP52I+pQk2LlmCFXAxDkBZjkNMSqS6Jt5gs3g0apsJFuP?=
 =?iso-8859-1?Q?VEssoFvzpN4Q9tC92VYq6r8r8l86+yAhr9yOVoy/q4n2t4ICaBSp5kIwQ3?=
 =?iso-8859-1?Q?C0vgQDdCho9xVwctGVH5lEG5RAwKYTR/xms4Bf8L+HhhWxjRohPwx2jAg0?=
 =?iso-8859-1?Q?QfkL1jvUOIWhJBWZphDac408uX4C/wA9oM+wRPJ4H5q13nKi1aFM6uw01J?=
 =?iso-8859-1?Q?S2GewH/OxRhQp4v7fmr0K6Ug64RPuceCS9gwSBUGAvLGJjCsnLaHeK07w8?=
 =?iso-8859-1?Q?KoWIfzH5V6Xqq1WZwKkGo766f28zkeFkVPpcThp1h1wR3ei4kYzYdwARA9?=
 =?iso-8859-1?Q?kTq0UCicEyqjeD827fhQN4Yg/w2nPYNPMEX9+j0LheWA4r6HAp5DnFjZ0y?=
 =?iso-8859-1?Q?RHpSn/I/JL4GaXNwXX4bAjqD2slk2FOjdHjVdrhoWPvZva0KbQYrJfHp4w?=
 =?iso-8859-1?Q?dj8ykAN8UWLvA=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(82310400026)(376014)(7416014)(14060799003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 07:38:53.2288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab7e027-4446-474a-005a-08de4cf6a42f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11536



> On 6 Jan 2026, at 08:33, Bertrand Marquis <Bertrand.Marquis@arm.com> wrot=
e:
>=20
> Hi Andrew,
>=20
>> On 5 Jan 2026, at 19:14, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>>=20
>> On 05/01/2026 12:24 pm, Andrew Cooper wrote:
>>> eclair-x86_64-testing:
>>> @@ -104,6 +122,33 @@ eclair-ARM64-allcode:
>>>    LOGFILE: "eclair-ARM64.log"
>>>    VARIANT: "ARM64"
>>>    RULESET: "monitored"
>>> +    EXTRA_XEN_CONFIG: |
>>> +      CONFIG_ACPI=3Dy
>>> +      CONFIG_ARGO=3Dy
>>> +      CONFIG_ARM64_SVE=3Dy
>>> +      CONFIG_ARM_SMMU_V3=3Dy
>>> +      CONFIG_BOOT_TIME_CPUPOOLS=3Dy
>>> +      CONFIG_DEBUG_LOCK_PROFILE=3Dy
>>> +      CONFIG_DEBUG_TRACE=3Dy
>>> +      CONFIG_DEVICE_TREE_DEBUG=3Dy
>>> +      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=3Dy
>>> +      CONFIG_EXPERT=3Dy
>>> +      CONFIG_FFA=3Dy
>>> +      CONFIG_FFA_VM_TO_VM=3Dy
>>> +      CONFIG_GICV3_ESPI=3Dy
>>> +      CONFIG_HAS_ITS=3Dy
>>> +      CONFIG_IOREQ_SERVER=3Dy
>>> +      CONFIG_IPMMU_VMSA=3Dy
>>> +      CONFIG_LIVEPATCH=3Dy
>>> +      CONFIG_LLC_COLORING=3Dy
>>> +      CONFIG_OPTEE=3Dy
>>> +      CONFIG_OVERLAY_DTB=3Dy
>>> +      CONFIG_PCI_PASSTHROUGH=3Dy
>>> +      CONFIG_PERF_ARRAYS=3Dy
>>> +      CONFIG_PERF_COUNTERS=3Dy
>>> +      CONFIG_STACK_PROTECTOR=3Dy
>>> +      CONFIG_UNSUPPORTED=3Dy
>>> +      CONFIG_VM_EVENT=3Dy
>>>  allow_failure: true
>>=20
>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/12604499722
>> shows 122 failures in otherwise-clean guidelines.  Some observations:
>>=20
>> llc-colouring.c uses binary literals.  These are safe to use now since
>> 4.21 with the updated toolchain baseline, but the Eclair config wants
>> updating to allow this language extension.
>>=20
>> ipmmu-vmsa.c has a git:// url inside a block comment, which is
>> considered to be a Rule 3.1 violation.  In principle this ought to fix i=
t:
>>=20
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automati=
on/eclair_analysis/ECLAIR/deviations.ecl
>> index 7dee4a488d45..8f5fc6c93bc5 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -60,7 +60,7 @@ removed by the compiler, the resulting slowdown is neg=
ligible."
>>=20
>> -doc_begin=3D"Comments starting with '/*' and containing hyperlinks are =
safe as
>> they are not instances of commented-out code."
>> --config=3DMC3A2.R3.1,reports+=3D{safe, "first_area(text(^.*https?://.*$=
))"}
>> +-config=3DMC3A2.R3.1,reports+=3D{safe, "first_area(text(^.*(https?|git)=
://.*$))"}
>> -doc_end
>>=20
>> #
>>=20
>>=20
>> but I've not tried it yet.
>>=20
>> There's a R8.4 violation against __stack_chk_guard.  I think this wants
>> deviating locally, because it's a fairly magic construct.
>>=20
>> Other than that, there's a smattering of violations.  Some will be fixed
>> by some work I've got pending for the x86 side of things, but most are
>> specific to arch/arm/.
>>=20
>=20
> They are quite a lot of violations coming from ffa.
> I have a pending serie on FF-A waiting to be reviewed/committed.
> I can push something to fix the findings after it, if that is ok for you =
?
>=20
> I will retrigger the CI from the branch corresponding to my serie and wor=
k
> from there.
>=20
> In any case, very good thing to activate all those and check with the CI,=
 thanks a lot :-)

There are also a bunch of optee ones that i can handle in a patch.

Cheers
Bertrand

>=20
> Cheers
> Bertrand
>=20
>> ~Andrew



