Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KgdAbdehGnS2gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 10:11:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4821CF060C
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 10:11:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221662.1529847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnvNq-0002F2-He; Thu, 05 Feb 2026 09:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221662.1529847; Thu, 05 Feb 2026 09:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnvNq-0002D2-EL; Thu, 05 Feb 2026 09:10:42 +0000
Received: by outflank-mailman (input) for mailman id 1221662;
 Thu, 05 Feb 2026 09:10:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vnvNo-0002Cw-UH
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 09:10:41 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 862c5d58-0272-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 10:10:32 +0100 (CET)
Received: from AS4P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::6)
 by MRWPR08MB11826.eurprd08.prod.outlook.com (2603:10a6:501:9a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 09:10:28 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::86) by AS4P251CA0017.outlook.office365.com
 (2603:10a6:20b:5d3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 09:10:25 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 09:10:28 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PA4PR08MB6144.eurprd08.prod.outlook.com (2603:10a6:102:e3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Thu, 5 Feb
 2026 09:09:25 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 09:09:25 +0000
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
X-Inumbo-ID: 862c5d58-0272-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G5nTpc33Jxr+33GsusUf2JklL5TEt/2xXWcWTc5izkUaTzKK/fxPuVUo5B9mH/2M2RgBXV6K/7J1AEXv9/n77ruBqjtN1eOiHWZvifc2pMPPwT1Im2gOxrhcF1e77Csy6QzdJEut8lYEWKdBG1/166xdd4BaZ5RDOx8jHvX8s2U9dHBdb1rMNh1QSSSkSnQyM2plGMCfwraN1iG/b4vqDZnIVv5/YOE0ch7CXI6jXdcwtYWD8DfhG4aengQ7RZporaynXCyLYxWRKfNL7mXPiJ3PV2yuJVvHMu6J8HrRl2U3xmbkMiuHuXNTFQrBG/TzSf/eDC9pjYyBH2P5SaXBuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJze7kEu5pNh4GwQaLr8lilZBUZikcp2XZkpTPWled8=;
 b=DYMdhrc45qRAVchdj+M58akrpwbXNcV+psiFy/wP0kve6C56RPEeXiSO0KlMQzq7A36plczH3DdAbfPFSbQXXjL+sXvmSwhXjFPv745vn9LXmZshZxrf1ROkUCroQotv0Vdyr/qh18ORsU6DLaSQ90ZhAgMvMi0T+x+Pugfb2SZg23Zb7VaMPnG55f1uILc+twqTkRrOW3rHMwUOtnBcLJSwyvMKQqmVo22MRhBtQs0V723DSfXflFlgSxRQ5pAkRGIh4evBLhd89y2Eal7RC4BdfnQ9HBaEtZ/oddkiW7B+QVhyrxwe/eddWXJKEdy3GgC4vxTgp1A7OyXBo+HQ9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJze7kEu5pNh4GwQaLr8lilZBUZikcp2XZkpTPWled8=;
 b=Sxw0hXDbOkGEV6hzLKmVLkM5xWzq5O8lD6Q+Myqk1B/hdmb5gTyy8r431u6q/fEIEBPAf0ryX8CczgBryqUhliSDetXfDnJz0lNNN7kraRfHDq6sUa19A7PGnMzVkfJ53B6YGYw819dktSaPkUP6WOwpVTPIdlkWpunlCNuum7A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMxdA9lO1hs1nzMXhLYLWJQV0/phUx4gwlu95MO0UxGbpNwAtx+qG0rE+wDcHWA2hWGSHmy/Qd1RjP0bARYou2PEMO+g37iCki/LYGEbJVuD7+BEa7cHMkFW3wU1N8T9hYod+Fd9expSJieJI3VttH4pxk8Tbgvdp85nZMKPGPDZT7PmL2F+zmjoUk+foWpp6n6HsWUIlYHsxYFYDPTYhxF4+olAfYf1QByeXww1h1jeL1SuzVkuwFaeeRVoyPCG89bY81CpkSBOpoyPwdNzsxm9AZ7zBXHFB8AlW8/8/jyIZr70d8RUYmxjlLDNg/Z9KsfFCsG/g7+6mI+5l424xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJze7kEu5pNh4GwQaLr8lilZBUZikcp2XZkpTPWled8=;
 b=tMRooLU5FQquTPLrd57vWwPVXqKHwEB8tUKqo64Nt9FIqQqUGfmoVShX1BckKuytc+QHZPtciE6b2kDfVQ/PNUqfZpFAiQPSCmKw9VwoFIpfkaG349p6UjTAsd22u40Q9O1hYcPaeSOt4xH/h3Nag3nay/cfYrzn/l5mLzk6ELnsFis5gVIBiMtwV7A57YAIZWuHllvZ2jeFBSJBmypw8ePo0MwrQxtOaTYQjEmvsFiQV8Qra5vXmvFdg4qVhalbWDQiPxfuajz/NqaKttklTSrW17aKQnjldXSuZeF2xuDYvHuFq7mjyUm9XlNAa0AxBOBa2Td8kYplVkCSpvj1Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJze7kEu5pNh4GwQaLr8lilZBUZikcp2XZkpTPWled8=;
 b=Sxw0hXDbOkGEV6hzLKmVLkM5xWzq5O8lD6Q+Myqk1B/hdmb5gTyy8r431u6q/fEIEBPAf0ryX8CczgBryqUhliSDetXfDnJz0lNNN7kraRfHDq6sUa19A7PGnMzVkfJ53B6YGYw819dktSaPkUP6WOwpVTPIdlkWpunlCNuum7A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
Thread-Topic: [RFC PATCH] xen: Add macOS hypervisor build support
Thread-Index:
 AQHcldiTYCc32vRyb0mp6O53Aox8PLVyquQAgAAD9QCAAAhKAIABA5IAgAALHACAAAXaAIAAA1oAgAADfYA=
Date: Thu, 5 Feb 2026 09:09:25 +0000
Message-ID: <5A50CA14-6AF6-4DFF-A395-5DDFE01C8C50@arm.com>
References:
 <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
 <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
 <eca1e783-b147-4230-a340-41b8cb694c5e@suse.com>
 <65D4FEA7-DECD-4DDD-B119-4625F72ED585@arm.com>
 <eed4bb7b-5836-4345-984d-c542b9f1da34@suse.com>
 <C8CFD80F-057C-40D5-93B4-176F3D785C44@arm.com>
 <e77fc7ab-39fe-444d-bc04-591155f68aa3@suse.com>
In-Reply-To: <e77fc7ab-39fe-444d-bc04-591155f68aa3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PA4PR08MB6144:EE_|AMS0EPF000001AF:EE_|MRWPR08MB11826:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b44dbae-6a9a-4970-9054-08de64966807
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?nm1i/euxVIsd2oPfFUXyKQDd8qqUyRQWCu6Uq/Fqg8iq0XPzqb3NPlfHY4?=
 =?iso-8859-1?Q?HV8NLOEUKHlTxUsK9GKlzKzX3SZUpA2h1JDvCNHsK//Q8EMwltpY22B215?=
 =?iso-8859-1?Q?jSGTW1pSKb1oisGc7fg2uxLfxeb7k5XPYHT/HhlJ3VBpQzYWlNp3c/JxAg?=
 =?iso-8859-1?Q?3TlAtwxeRG4h6QNcRX9rLWm7LxBFpS/J/NEIDLYVJOYKk8tq+TlgvObA+e?=
 =?iso-8859-1?Q?uFffaGwjaWibTkQQIPy7zyDcVNS0qsm+dsj0IBCAmXMZOTLtI0VuT6SsfL?=
 =?iso-8859-1?Q?6kYYB83WKSyuCCWrumoLR5EWNsgxlfxrN8M23s71tdOAy8EujH00VGPDon?=
 =?iso-8859-1?Q?RHuFk7GFJEnwzPOuW92dwZk3f+I9a2ddo5oHZZmKbvoVQnWdVWKOiiLIry?=
 =?iso-8859-1?Q?TsNqYxaQn/Aow29Rz5WViWXcsCX/S/hF9e7BoaxhofpGJUjGfeOjLQImZn?=
 =?iso-8859-1?Q?zKF4B2Ujhy0sTHW+8q5QSUQJKgevzSkKMaHJSG+jc97UpGnXKC+aRNrBDl?=
 =?iso-8859-1?Q?z10oyxI3g0HmJ8DYm1QYFflql5YiIx+ViX7XYrcruxXABPYzby44tc6o/8?=
 =?iso-8859-1?Q?VGZsV8H9Ybft0HGh5/EgXYy78KLtNn5OuLbSiStgFSok/88prTsHFPT7jk?=
 =?iso-8859-1?Q?sEgle7EIMAnPpYLU2ikTsWVcWpvexTz5cdrzh1h0lW1QRtWMYXqcHKGc4d?=
 =?iso-8859-1?Q?NA7PBwT/ANjL6BKbaR+7KK2S9JYFOTJYNaFn2W7sPMKugUZcc94VuyHv6u?=
 =?iso-8859-1?Q?+9cnFwWWmibG911vW9XeJJpwd1pUB4Qar/liQRo6JKxZDBDx9VBEoo8Xwp?=
 =?iso-8859-1?Q?WVU8UrCu67b6504F6V4on/szmuPL6rb7K6wwZ5HFzo1DsNL+cTx2fUd7m7?=
 =?iso-8859-1?Q?waLsgo8lGDUzAfhYC0yQBb0eMReus5zZK+WvYuDUrAvyCWPoK89uUuN+w3?=
 =?iso-8859-1?Q?pgz2wK8ZOGQ0hYb2MPqVnufa5k1eNtzqC+BohBu7V46TUo8tLldGJsO1pr?=
 =?iso-8859-1?Q?nmblP1aU+G4eS0SYNs8bJ8+IZyAJWw1Pa0mwxTBHvNPoqh9MWsQec7wioM?=
 =?iso-8859-1?Q?inTgqXeKA2aih/WMJYfrl1a1nL5AXRod4M8/xhup03UbNjlRoG4uwn506q?=
 =?iso-8859-1?Q?6lotR4kbv1uIVOCwQPOwPDFbOpz6SeeS8r+11Tjs+DopWYkUGM+qgeIKha?=
 =?iso-8859-1?Q?S03gTrPuvD4z0JwqNgtiPSQ/J+zGfAF0OaFzyZXT2SOHCSW6+Ii16UEPLP?=
 =?iso-8859-1?Q?ZXdeVKIsUDetRlEa5YEX4jYaXsLwXUohaN/xs7KQPAnRd5ho4lN0HeS2Rr?=
 =?iso-8859-1?Q?GuZ90XJNZpdIHJNWFbNT6B8RijqXoHsl3zZVBWXGUys11glSARgm72snyS?=
 =?iso-8859-1?Q?Bz2O2WBt1aBHw0z2iSegZ6zJ+JdRDp7v6KmEFdYtGkA+noE8Ryf5QbSBN6?=
 =?iso-8859-1?Q?N+Bh3Ciu+PXgSzZg/Nm7Uqg4x4jLZ0ReDLAUs0DhNcklS7MrqGHu+7+3Ev?=
 =?iso-8859-1?Q?Diel66ZQzCqSxR1FGjEQBKG2BsxYKFrdHH++WPxk0KxMc+DaRefZkbu06L?=
 =?iso-8859-1?Q?3X8tvYlckIZH0NWkhQWZkgG+LblaLCmONLKxFE4Va5iOqRBYasLqR9p9iP?=
 =?iso-8859-1?Q?3hPSnNgwA7ovvxFJlF2/ULQu4DL+N0fwApo7JwUOwdAKsNErHXPyDjKRgL?=
 =?iso-8859-1?Q?y6AFeIyrTcVkwnEXTV8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2EA2188E9C184442B682650F58091714@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6144
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14541817-7b79-4956-c6aa-08de6496429c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|1800799024|82310400026|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ir6n2sCr94VIRi+4lec6URPHjdjzyG38Mpj3qF1wEOz0rgvWLwGsc1P1jJ?=
 =?iso-8859-1?Q?MC/h0sdHS7Y8d/tR5sQWHvAZDlL1D0lT/fr8c/v/FI3H3KCbhl1iaQS8XI?=
 =?iso-8859-1?Q?sWu0r42Xzim4ehGLbACHng0p6MgmJuPSJVX6s5zQ8u3LNYYm6M/EO3MGIe?=
 =?iso-8859-1?Q?1gnrBOmIyvdCADzqAr3JigaHR7wZgg/jEFgfhsMBSuO66PngTeIGrRq10I?=
 =?iso-8859-1?Q?z6j+3lfCLPeQD0QSlfWNVEJa7RtoUQB+hW9XnewjmtF2SdEOd2BttULNfy?=
 =?iso-8859-1?Q?HOxT0U46zTWSyDflZZZm4vpLId+bb8MxVH1VqEu+LIZkruU4jW2gdqDp4W?=
 =?iso-8859-1?Q?2sqnP57cxiU5+RlzRUY1Kewm8vPKGZ+YYlrCeCQpirPsqOvytNdX6lyG5Q?=
 =?iso-8859-1?Q?FPMfeGPlf/Up0mHlH+/1c9Bc8zGXmYj+wa5cim4GW7QHHrrKR2sQtLrHdK?=
 =?iso-8859-1?Q?AsmktvzomNR0bDg6GMJQsPpyHj4NFNkwjJ1Yxld5Z57UosWOuJHP2Ev/q3?=
 =?iso-8859-1?Q?Sgl94p3Q/ZS3LA9uhWeXUoficq/XEwKWPCHJp67D32118Pqd+Yt46TvI30?=
 =?iso-8859-1?Q?tc42x5KT1rjUqz/v0ibY8n6CbeC4pMGdafxqQImwR5h0xFxtW3KFy6zqD0?=
 =?iso-8859-1?Q?oB7s63VOrivqzBtCziVZO7qXYppRsaIRWrBIzeJARfGz++QCgoDQQ3NU/D?=
 =?iso-8859-1?Q?x/5DQRMt7V/r+CaMP4sbPtB10sAx8pFssHhvkW5p5y3+GF0NFApd354wad?=
 =?iso-8859-1?Q?gICeDTd1VoY9MQL44UW+hDiUJzKnCFmDrLzvBNfr/JreBCctExddXoY2wL?=
 =?iso-8859-1?Q?sxJnAaE24Kfxf2p91kebTVCXCKYWHyILiAg0oeRriMIIpWs7q0A5C8HEX0?=
 =?iso-8859-1?Q?o0mSHupJxr+2eypeT3NXVB6a2AU//WvRlysVEDXJgfO5bB6jUUfqehHYZm?=
 =?iso-8859-1?Q?qiDZpnYORXGAbTZVfaVOJuj7qH6gEmLXzw8GECMFOH0ZCtHiMGflge160s?=
 =?iso-8859-1?Q?GrvzIHkG2J1+DDC7iYmQgFxclx/ZpSVT3qHva0M4v7NkWIKxq0xsYoHxNJ?=
 =?iso-8859-1?Q?oJHq2PMd2T6qknEpzcLcbkK8n8ozisyTt9ADA29xg6q6rl/6N/Dkf1DHFI?=
 =?iso-8859-1?Q?7WohdgvSh/7eDxoI+RiUU5+RMj4j2uS17dcG8UuNeAWwb83kbq6rnqHD7m?=
 =?iso-8859-1?Q?II9qS2KQ0Mv+dKFh+WtKBDpXvU4gZGt1cO+4cuTfYqWDoJDEGpZKArbZus?=
 =?iso-8859-1?Q?L48PGX7zDPTti5XHl+jGYVA1J0HvlM4fSScFfspScTcYQPVhMkQJc2loL8?=
 =?iso-8859-1?Q?QJxBcI3y3TVIfLERXS2qY/7yOhUQWyBAKcmcOKZCsqWtF0HDlBUMW/TIrQ?=
 =?iso-8859-1?Q?Uq0e8WClX7tsmmJpKbzsB4m24QGqhp7FM6fpCrcNAadfvVs0vlXL68AXpI?=
 =?iso-8859-1?Q?yt86Va89aLtdIJ8qcUBeHSWHOnT+Wn9XCn2fmxJSHSG2NWZedO5XPttC3e?=
 =?iso-8859-1?Q?wPwGwjTq7aRlKS3TGwMZYkSDABE7gH/oWrke7ztDc6boB55Mcfbl+wqV5L?=
 =?iso-8859-1?Q?qWV3Gmh863Iz5y5W3h2IczeKnnZRzDb3XUnT7iM6r4laBJyhuDGHgFTaSR?=
 =?iso-8859-1?Q?YBWvLNQaNLNUmrLRXApvVUGgE+tq5i4mzhLgQgGiCaAHun1nZW+WCv0VVk?=
 =?iso-8859-1?Q?mrdGo6hs1OK1899LXjtrZXJ2F7FhNQ1Eb/58MSH9vywE/RtdPYzK3TpJe1?=
 =?iso-8859-1?Q?S4sA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(82310400026)(376014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0TXnHAKL8bwM+NkWJnpBlTN5Xoadz80hZ1CtGz9lOJzMYuOQTbFIkzWTRMYHtMvTSrnA5ED9qOMlZIqmSBEYU5KK3KfzK23widin7gXAFkFbsFNaLFIY2vLnlu547zVl42snED9LgTZBScP64c+CRxoJynOqnRr61vy4VsZAXtj01hf/PdfMaiB7zGRQ2l9lKy0iEQBzkaMTE8/L/aav5HDk4MMJWXLS5Bfb/p2OTiMV79B+XIyqJ1jy0Wiuh8b05dhYL0+z/GAf+GwuOspCeLyyj2VPpHLV6om1s/sN9A14AIfQHi1c/ACfCa2VQSDn1Mdt54Swz/j6lN8PW0RBVfBUsCz6S21id9Lnp8/y51gH9WpQXlhIuw9RZOAU6kohM3eZhIcDdGmtUU1sgWsFlWIpbxdeu4Z7mll4hMA1OSH2Hq1XJCi6hU1wu1LOGFOo
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 09:10:28.5367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b44dbae-6a9a-4970-9054-08de64966807
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11826
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 4821CF060C
X-Rspamd-Action: no action

Hi Jan,

> On 5 Feb 2026, at 09:56, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.02.2026 09:44, Bertrand Marquis wrote:
>> Hi Jan,
>>=20
>>> On 5 Feb 2026, at 09:23, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 05.02.2026 08:44, Bertrand Marquis wrote:
>>>>> On 4 Feb 2026, at 17:15, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 04.02.2026 16:45, Bertrand Marquis wrote:
>>>>>>> On 4 Feb 2026, at 16:31, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> On 04.02.2026 14:16, Bertrand Marquis wrote:
>>>>>>>> Xen does not currently document how to build the hypervisor on mac=
OS, and
>>>>>>>> there is no Darwin configuration for a Homebrew-based toolchain. I=
n
>>>>>>>> addition, the Makefile silent-mode detection can be tripped by -I =
paths
>>>>>>>> that contain an "s", which hides build commands unexpectedly.
>>>>>>>=20
>>>>>>> This wants submitting as a standalone fix, so it can be backported.=
 But see
>>>>>>> also below. I don't, however, understand how -I could be useful her=
e - our
>>>>>>> build system is self-contained, so any include directives used shou=
ld be
>>>>>>> satisfiable without any -I.
>>>>>>=20
>>>>>> This is added automatically inside our Makefile if you build out of =
tree:
>>>>>>=20
>>>>>> MAKEFLAGS +=3D --include-dir=3D$(abs_srctree)
>>>>>>=20
>>>>>> which ends up being -Ixxx when tested.
>>>>>=20
>>>>> Hmm, but I do have an 's' in my source path, yet I need to explicitly=
 pass
>>>>> -s for the build to be silent.
>>>>=20
>>>> I did further investigations and my previous assumptions where actuall=
y
>>>> wrong because i looked tat MAKEFLAGS value once the whole Makefile
>>>> was parsed and the include-dir flag is added after so it was not the r=
eason
>>>> of the issue.
>>>>=20
>>>> In fact the issue is coming from variables set on the command line (an=
d
>>>> in my case O=3D with a path containing a s).
>>>> So you can easily reproduce the issue by just passing XX=3Ds to the ma=
ke
>>>> command line to do a test.
>>>>=20
>>>> As a consequence, your proposed solution filtering -% is not working a=
nd
>>>> the only reliable solution is to actually use firstword to actually ge=
t the
>>>> short options list. This is making an assumption on MAKEFLAGS having
>>>> them first but my tests are showing that it is always the case.
>>>> I would propose to put a comment to explain the assumptions on which
>>>> the filtering is based on top:
>>>>=20
>>>> Something like this:
>>>> diff --git a/xen/Makefile b/xen/Makefile
>>>> index 13e336ba5484..a7924fcb7af5 100644
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -113,10 +113,10 @@ else
>>>>    Q :=3D @
>>>> endif
>>>>=20
>>>> -# If the user is running make -s (silent mode), suppress echoing of
>>>> -# commands
>>>> -
>>>> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>>>> +# If the user is running make -s (silent mode), suppress echoing of c=
ommands.
>>>> +# This relies on GNU make encoding short options in the first MAKEFLA=
GS word;
>>>> +# if this changes in the future, this check may need revisiting.
>>>> +ifneq ($(findstring s,$(firstword $(MAKEFLAGS))),)
>>>>    quiet :=3D silent_
>>>> endif
>>>>=20
>>>> Also i can put a fixes tag if you think that is useful:
>>>> Fixes: 4fdb4b71b152 ("xen/build: introduce if_changed and if_changed_r=
ule")
>>>>=20
>>>> Please tell me if that sounds ok for you and I will resubmit this as 2=
 different patches
>>>> instead of a single one.
>>>=20
>>> Sadly no, see my other reply sent earlier today. Furthermore, as said t=
here, even
>>=20
>> Sorry missed you reply when i wrote mine.
>>=20
>>> with O=3D I can't repro what you say. In fact with a Makefile containin=
g just
>>=20
>> interesting
>>=20
>>>=20
>>> $(warning MAKEFLAGS=3D"$(MAKEFLAGS)" ABC=3D"$(ABC)" XYZ=3D"$(XYZ)")
>>>=20
>>> all:
>>> @echo 'MFLAGS=3D$(MFLAGS)'
>>> @echo 'MAKEFLAGS=3D$(MAKEFLAGS)'
>>>=20
>>> I can observe (with both make 4.0 and make 4.2.1) $(MAKEFLAGS) expandin=
g
>>> differently depending on where it's used (I'm passing ABC=3D and/or XYZ=
=3D to
>>> experiment): Only the use in the rule has the variables. What version o=
f make are
>>> you using?
>>=20
>> I am using make 4.4.1 on both my Linux and brew based builds which might=
 explain
>> why i always see the same.
>>=20
>> I have an other linux system where i have make 4.3 and in this one, MAKE=
FLAGS does
>> not contain O=3D options when the test is done so the issue is not appea=
ring there:
>>=20
>> adding:
>> @@ -116,6 +116,7 @@ endif
>> # If the user is running make -s (silent mode), suppress echoing of
>> # commands
>>=20
>> +$(info MAKEFLAGS=3D$(MAKEFLAGS))
>> +$(info MFLAGS=3D$(MFLAGS))
>> ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>>     quiet :=3D silent_
>> endif
>>=20
>> ## On linux with make 4.3 i see:
>> MAKEFLAGS=3D-rR
>> MFLAGS=3D
>> and the build is not silent
>>=20
>> with -s:
>> MAKEFLAGS=3Ds -rR
>> MFLAGS=3D-s
>>=20
>> with --warn-undefined-variables
>> MAKEFLAGS=3D --warn-undefined-variables -rR
>> MFLAGS=3D--warn-undefined-variables
>>=20
>> ## but on linux with 4.4.1 i see (same with brew make 4.4.4:
>> MAKEFLAGS=3DrR -- XEN_TARGET_ARCH=3Darm64 O=3Dbuilddir-s-test
>> MFLAGS=3D-rR
>> and the build is silent
>>=20
>> with -s:
>> MAKEFLAGS=3DrRs -- XEN_TARGET_ARCH=3Darm64 O=3D/home/bermar01/Work/xen/x=
en/builddir
>> MFLAGS=3D-rRs
>>=20
>> with --warn-undefined-variables
>> MAKEFLAGS=3DrR --warn-undefined-variables -- XEN_TARGET_ARCH=3Darm64 O=
=3D/home/bermar01/Work/xen/xen/builddir
>> MFLAGS=3D-rR --warn-undefined-variables
>=20
> Ah yes, and here is a quote from make 4.4's NEWS:
>=20
> "* WARNING: Backward-incompatibility!
>   Previously only simple (one-letter) options were added to the MAKEFLAGS
>   variable that was visible while parsing makefiles.  Now, all options ar=
e
>   available in MAKEFLAGS.  If you want to check MAKEFLAGS for a one-lette=
r
>   option, expanding "$(firstword -$(MAKEFLAGS))" is a reliable way to ret=
urn
>   the set of one-letter options which can be examined via findstring, etc=
."

Nice

>=20
>> So i think the working solution would be to keep the current test but do=
 it on MFLAGS instead of MAKEFLAGS:
>>=20
>> ifneq ($(findstring s,$(filter-out --%,$(MFLAGS))),)
>>     quiet :=3D silent_
>> endif
>>=20
>> Could you quickly do the same test than me on make 4.0 and 4.2.1 to conf=
irm ?
>=20
> Well, I did confirm this already with my earlier experimenting. IOW eithe=
r
> this or the $(firstword -$(MAKEFLAGS)) they suggest (effectively matching=
 my
> earlier suggestion, prepending '.' instead of '-', as really any char oth=
er
> than 's' or a whitespace one will do here). Personally I'm slightly in fa=
vor
> of the MFLAGS variant.

Agree, i will use MFLAGS as this looks more reliable.

Thanks i will submit this and the mac os build thing as independent patches=
.

Cheers
Bertrand


