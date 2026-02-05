Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN+oCLNKhGm82QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 08:45:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F84EF8DB
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 08:45:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221534.1529731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnu3O-0001pg-VA; Thu, 05 Feb 2026 07:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221534.1529731; Thu, 05 Feb 2026 07:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnu3O-0001nH-RY; Thu, 05 Feb 2026 07:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1221534;
 Thu, 05 Feb 2026 07:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vnu3M-0001n3-Tj
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 07:45:29 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a31b94ef-0266-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 08:45:27 +0100 (CET)
Received: from AS9PR05CA0156.eurprd05.prod.outlook.com (2603:10a6:20b:496::18)
 by AM8PR08MB6532.eurprd08.prod.outlook.com (2603:10a6:20b:316::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 07:45:21 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:496:cafe::e2) by AS9PR05CA0156.outlook.office365.com
 (2603:10a6:20b:496::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 07:45:19 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 07:45:21 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB9608.eurprd08.prod.outlook.com (2603:10a6:10:448::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 07:44:15 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 07:44:15 +0000
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
X-Inumbo-ID: a31b94ef-0266-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=J5XLHrCbxieS/KL3esgyuCzaPCHFFCk/piDEw2Q/gW9qUeZnHwBID4Mymd8k9DFIOowJ2BkfZbLFcx02Cc5WYpTYu/NPQ8ZRrj+cmXNGVLBmqho8k7uYkus2l2AZP+bPoTVc+3v4WtTmLZYshTx3fK0rLOrEQXyA6xL+nG61aCGe+EF+gbgA0V4v506z3gjgfYDxNTqup/gu8D6qS4lSslVPDkIsyyx4d2aJryduEXxLJW6739ya7XnX6zPZkZxlB+db9ukkwlL7n5h+hnzDv57TSvrZLYPuOkzz2WqJ17vzTzBWvRszps89ugmoDR//Wu1fw5mfdL84You7bqvgdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc3lKEF9j0RG9jiIh2b4N9jrAj9EvhH8sotbzhhim5k=;
 b=htwsNKo//Bo4SZPa/g2+GW+22cutu+nd/tsFDpMteCVZIKzeg4y+FmoAY28tobOOkaAWiA+1i4+ZXQ6+7jDvvj6zJy2uZJW+k+qhAuRPqguGNYbnv6/Yp9+Rc90RSh4LXRu1n51NgUxTx1JOrVA7sw/cmrFzSjbE0D/HRFwhbjtMrhkFE1jYLp4mRkySuX4Hd8uNVNQYQE68GQ7sQ0pKpVvUWGQ0MS25/SHqtm9jMHeKIE83d7noTb5F/3MN4CA9exzxxxsUTcExjmrquhcbOjB3qiKdug1fvP8qDZUY8q9TYLBhRaxaM0jhn2WgDPA267Y4mWlFXGYW8gX7/t340g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc3lKEF9j0RG9jiIh2b4N9jrAj9EvhH8sotbzhhim5k=;
 b=ZHrgTxePQWQMCSh/Et+kUFTlmFJmgB66pnLXYUwzpPcYB6NMANdt06KH6pw0VYbSgs1bg43psUb2B7r0qz3Ic+U7mLSjdBkpuycL/SZyBd30yo1vH9UTC2Rqr7DthLjwCHg40uHdFoZlVxIonBARREQGOm50poMnZLmnaUIvuHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke23X3QYix7sHjLFOWZOCqb3fidnKA0mWoBljLETAA5ggmtgytl6dGZYcS6WRcKniPmRLzRPgcVSQ9FDZFGFY7uusp4XPxh6Cgq6Guvj9H31QykUsgWAznkaz2akkrOfzFhyvq8ww5NUy2pvSYyLg5JnSwieMccTU2hIRNB6fTVwKk9ZqcdfTlAJBA/LzJkAKDhgwlkvKoM+XrmyLxV0cVpGVV1UjRSeIKPNL0oXK0HsXjSCXH0IQV5BZRHABVL/9hDHZByIyTqGEe1E6MT0nztf86W6m5wy9KK819PII1295MBPFkpVKHDM8njEitblYGxaLz+EPVZwcbm10aMRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc3lKEF9j0RG9jiIh2b4N9jrAj9EvhH8sotbzhhim5k=;
 b=MD2L74oolYah6TdrFpy1UXMh5sjeItrhXK4yJ36myW7ZjE5OHH5XA/wW7jbiWUXKLeSk1c0ReVo2drXaryUe9pBEWon+RICduPq/ltrp94y+eh+E9QKCokRHKgfje2EkvpRS+eB/w5wk6doGwDxJbjvRH4Q+dU4GOTaGqBHLESD0CALi21duBsy7cDwxCAqnPkV2JX5qIiVBY40H1RQAnnQURiU7roWd7vzDHAYqE1XrhPwvfk76NcskcJVUI2YRAhUvEcwXjUOzSnvkzkAkvhf0+uiweAAxns80Ij8Zh9Y77+pH6ZrvigyoUeVbSKcJTtB0spGATuThG+R+Q/vAFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc3lKEF9j0RG9jiIh2b4N9jrAj9EvhH8sotbzhhim5k=;
 b=ZHrgTxePQWQMCSh/Et+kUFTlmFJmgB66pnLXYUwzpPcYB6NMANdt06KH6pw0VYbSgs1bg43psUb2B7r0qz3Ic+U7mLSjdBkpuycL/SZyBd30yo1vH9UTC2Rqr7DthLjwCHg40uHdFoZlVxIonBARREQGOm50poMnZLmnaUIvuHA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
Thread-Topic: [RFC PATCH] xen: Add macOS hypervisor build support
Thread-Index: AQHcldiTYCc32vRyb0mp6O53Aox8PLVyquQAgAAD9QCAAAhKAIABA5IA
Date: Thu, 5 Feb 2026 07:44:15 +0000
Message-ID: <65D4FEA7-DECD-4DDD-B119-4625F72ED585@arm.com>
References:
 <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
 <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
 <eca1e783-b147-4230-a340-41b8cb694c5e@suse.com>
In-Reply-To: <eca1e783-b147-4230-a340-41b8cb694c5e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB9608:EE_|AMS1EPF00000048:EE_|AM8PR08MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 73cbcee4-8306-43e1-7d0c-08de648a83d9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?pyWm1Xon6vlwfn3rBFttEZvrxgz4Fv45cQ/tw/Hu5PWbb9AKSNNl4v6Sk9?=
 =?iso-8859-1?Q?Pkmn3NQRWt352WchIj5D1u0IFFAk/MunUF5tCbI0V3/I0xGihclSXIPbaw?=
 =?iso-8859-1?Q?kFGMFIjrtPMdblxc1YTA8VUHPLNVzmA0eUWu+gilbbmJCQq5k/EaaPP/B0?=
 =?iso-8859-1?Q?RhhQ+JGKdCgW/iUSB4zlT+TnfnLb5UL6KeQUGSOpBu8zcM6UG82nDZVR4i?=
 =?iso-8859-1?Q?ObSWdJeee0UGKNU/l3hKN2/Ws1epyhKz7L0MzpniheI9qBO+sOrHM1sOa8?=
 =?iso-8859-1?Q?3YunAJqq9YEcXCZEXCuEWIMrojfjmwl/LfkK3T416Cy+tWfQJJiPWiMhXL?=
 =?iso-8859-1?Q?z07J6oePoV+Yt9J+zqCxZYYrcywxaDdmyaNG1TCfx21bMUVDS/iglZh7UU?=
 =?iso-8859-1?Q?YUFZHb0X9wJVxj3gVezx8WOye4rEVYWHYIWXgzY0Lc5HBGG5fJFLpb1q+U?=
 =?iso-8859-1?Q?Wjf0czwux1hvioFxPaHVmIrsc4efgthbTkJfPEl+jCb+W02yKPOBXf66F/?=
 =?iso-8859-1?Q?6dkCXd+KWZrB2tNBWV69e/1LYNzkQEHVhc0GNzA6edUOsIIgU86J7Ye5PP?=
 =?iso-8859-1?Q?CjH18knAlU/Bwsoy++Ka5oxR+uh1RJXgtu+yCsweKD5S1kSg0+WPCPbxd0?=
 =?iso-8859-1?Q?qHi8K7BQL7gGiS10qS8x9U3evjAI0nmLNa/41lgm9uy1SWia3eBVc7Lxoa?=
 =?iso-8859-1?Q?O+XKoMWEWSl5EvEu4ft4iCEAoGzkFRkw7pd37CHwUILT6NmTyXafLlKWvi?=
 =?iso-8859-1?Q?zKZeru01dUS8fF3s3sA+rpdlTYrgN0PXP7pKotIjVSRizfa/5mvqQawR9e?=
 =?iso-8859-1?Q?cQ0qlkKrAjn7Rz5IYj8QW20if6gZ6kVxzGqq6yOBNHX8q0X2T1eDkHUIO7?=
 =?iso-8859-1?Q?/xDCZmjEUElyQIelRdWw78ISGbhr5sPBLgUg3rLuXcmtRXbPrDoqW3+Lra?=
 =?iso-8859-1?Q?/07I9W9ooQoZ0/KtndI35t3tHbbyUq3zTz9NVqiBWsoeD6ip1FxensTBQU?=
 =?iso-8859-1?Q?im/bqcceZ0Sng4U2jT0I6XQjYlUe1HPGf/3mU0kvJfy2/jKyNeIb8XY5uW?=
 =?iso-8859-1?Q?yGonuCiUdK4Q594THxYNNbE4g30azrpXSdzbwSujbbE2k8ruB9U46tMAvP?=
 =?iso-8859-1?Q?lVNOE/zo1Ok20UAbWBH0ImYeCM2G6PcbRk0qN4Fbv1TAIMtoPjy9NQa95z?=
 =?iso-8859-1?Q?C1NvB1IDkWRBCJSOOyDCgXmUHTyMnp4RwqzlrBoOFHwBvtQSOL5ep6GeZY?=
 =?iso-8859-1?Q?GLVNns65Z9fEFeL8Y5VbSI2/YWwRrksXGYbKaWecx1uwIyCsNfAslBv66s?=
 =?iso-8859-1?Q?4tj2TAK/n6oIBlAABo1iunlP6mk83qH+1wFszt8XVWzgCgjjVJbbeX9YCt?=
 =?iso-8859-1?Q?pFmWzrcqZNrxV7xBFFAQiwxkui1MBf8jNlx9Wv6xEmKUlxAIUYBSud/bLm?=
 =?iso-8859-1?Q?N85RL2Ew+pQ3goD/qwhTL/Mo8Mx6fGSZOAr2HwV3ahX3ZZBCeDGraPmSbv?=
 =?iso-8859-1?Q?1RgGqBuQXF6xG7WtNlDfdjAnnxtR20Yt3di2t9x4XfCYZy8Bumjm8Cq9kt?=
 =?iso-8859-1?Q?pQsZ+3BlGP67xp3mJJwAo5tB48qaCk2v/EFrC6YKrXGkpnaDMBjnGos0j0?=
 =?iso-8859-1?Q?wUNHdwqbHkmIhZHunMvhbZICAuWSsWWDZOvJeFaP7DI+jkiVNsSxarIxhL?=
 =?iso-8859-1?Q?ELwE/ECU/SdfrA6J9H4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8C9E445DF3832746B9F7FF717507326D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9608
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ecce320-6cb6-40ae-3a34-08de648a5c63
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|376014|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?x3ELEfLm9OB5L1cwGG5pApv4LSnvQ1ZrdL4lKFcMgCzMWbAaTQXCzeJVBx?=
 =?iso-8859-1?Q?gj6svpDCffZXRYtDTIVYa+3Xfyr9wT+n78EVgcv9VICKzShCW5anbeGgED?=
 =?iso-8859-1?Q?u03VAUXvSflq19IzGGaSI9QguYIEMIsBz4cjJfjtmZI9QF6MmxK6simzlM?=
 =?iso-8859-1?Q?CBsCS3hWHNnhtOm5dVJSWA0JgsB7BIi7j+V/Y5NRwNPrBHXJk4FCcVIKjp?=
 =?iso-8859-1?Q?cb/CjP2CkvxRkTyxaGC/mpnakZrdkXnWHzagBxWmQc9evIi0WiqKwbUD/B?=
 =?iso-8859-1?Q?6xvcntPz0FVqRGKYdk3vBBXWAUTDJTIna6pMWsQx0ykpZB3hJWnLHsEwU3?=
 =?iso-8859-1?Q?Z+c6Kp0Sbw4/0WCvgWt7jG5JbxuNCLYp6RARlQYPFfT2oCfMVPb4gDxsMp?=
 =?iso-8859-1?Q?Ct+RBeYQFKjC0IA1xExrXSMvAca3EeFz2F434NJJWD1KxUXq49eCgBlcy8?=
 =?iso-8859-1?Q?uTyg0uLfpO+XgoIIM4d+/OjvN9Ub0CfhSL0d3R9DvpkM5ConisvHhv1fyt?=
 =?iso-8859-1?Q?XVOLYzgyqpm07xkfsCSWTnqi+c/GYMx+Vpa1fXsQ7/H3s+YpoGdR7A8+ce?=
 =?iso-8859-1?Q?cLckB2zjaU7ZqJOYKEFlIhEn7bG/N19nMwAh63QbwjzkS54VCxi9nVX5lE?=
 =?iso-8859-1?Q?a18wvyiixFkgDB3BeZPMjSryAiVtSmmjj18C98v/aLOjZ4hCm6c0DfzB9/?=
 =?iso-8859-1?Q?8QLN7fHjx5UUNgkzki815AEP4HlFO33JhRjrS+1EpFP3QQiFvQCWK5WfSz?=
 =?iso-8859-1?Q?aHl9Y5z895DasxuMGxh+SOIlueX48A1YBarZyd8uofHD4xzlNhJkJ3tNPn?=
 =?iso-8859-1?Q?7pWgjvRdIeWtfJUvuNhELKVtgCoKVxLcJY71MrSYmkFjdnxu1D7tQhRRGX?=
 =?iso-8859-1?Q?v5p4DFmin1jsUH1fwvuABFMpZulYQRdUWa4QmUPsXzZKFK23tOVRi3mwr8?=
 =?iso-8859-1?Q?Jvl6q4kBik6fxWMtwEY3dZBbaXqkR0EU1B3HZOfSrUPpbWIq3hGUvSBl8v?=
 =?iso-8859-1?Q?DybG2tg+AhmE21Zq01xH3fnWKdSq5mYsWFC4GZDruRFIw08JK4VVV+G88W?=
 =?iso-8859-1?Q?XRIdjPjTTnstY24Xxc9UnmxCu8SPeHoc3YvpDYUdkJdq4EIu31gdNr2lsc?=
 =?iso-8859-1?Q?LfeMpOuRWK/lhZsLLHzRz2Fzo6kHkYjXuROUjUC73vS+98eZmVLoxNrqM5?=
 =?iso-8859-1?Q?RaZscVX6Gj8bT+Dt2Lii6nQXbtaqDjxUhDivMAUl32lDmshTpgtpPfkE/3?=
 =?iso-8859-1?Q?qS10A17CX5yHaPBbHjmyj/yFzJ5tdV15AqyxpbVFWQlzF0W7QF5EURm3Q/?=
 =?iso-8859-1?Q?AZOhmJKDwbZ58SYFWztMKP/cb8QcNRVM1mdJIfNgSvRnFcSTQ3BCePASJ3?=
 =?iso-8859-1?Q?Rc+ZuQX+mHSkKBk5PXRMSVKBUWHIhCnfe4VZVB9Ej4V/1zebfiqd3po+ns?=
 =?iso-8859-1?Q?LFloP8Ud2t+ZivOZjqfSK8+Sq1EqeQAZpg5CtPjDJGVl17i5Wtc83URb1+?=
 =?iso-8859-1?Q?mBlV+iZJc7MSvxwmpr1j375zW8xWjqUNvTi2Jrr8ImBOAi//H4SQA/Dg8h?=
 =?iso-8859-1?Q?CRlaoFb0GmoC/e+/NV8lxsM9+qmIr37OLw1ARECMrA4C+YkgLFNrsszV2p?=
 =?iso-8859-1?Q?bMXbRxqbmzib428t+azSz02t1xBXSJbODt1rTYCCuxNvcxAtm81Tk/Fo+0?=
 =?iso-8859-1?Q?vyOzKVybnAu0TG51eS3GzP7uNJR0HdgdZ9e8EgS2qKfmVmH310xe4+YiVs?=
 =?iso-8859-1?Q?2OLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(376014)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pp1e1OAijDdyK03U68AxjViWi/jcuzM5uOq3o6Lhjmz/xN/SdJuM8KkVOj6HqFKpaY5SGqGH0C/5BYYt7GMqSgEQYp31ei2s0dS8GpUAQC5c4SHafoYoMCLFRjLFgsGIJk9reTni/xsKqCfa3l3Azy+KcDj0uX09JbUwI8V9GHi9YGL3Ck/7HiVDddavcgWMLUgSHRfDM1yxjYpNJqIXR+552PfB3kYxg5DSEj+WAn0td8VnkEeiEy7ftfkmEr5g6FvuyBY23d7wULae2ok+LOf0Xu7OeCwyELJtdHNr6akPeqIOj0LwpTkwOxhkLlaJYruDkdykuiPb5hGtmaqePtE/sC4ZblxqDx9NuH9YmpgUzsDCWcj05ho1cye1C5KK3LMCByZJq7UA+8k2TPbq//CweDyaDkURXBlh18FiF9ldNKyEI5SoisGUY612Hk5/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 07:45:21.2595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cbcee4-8306-43e1-7d0c-08de648a83d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6532
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
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 53F84EF8DB
X-Rspamd-Action: no action

Hi Jan,

> On 4 Feb 2026, at 17:15, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 04.02.2026 16:45, Bertrand Marquis wrote:
>>> On 4 Feb 2026, at 16:31, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 04.02.2026 14:16, Bertrand Marquis wrote:
>>>> Xen does not currently document how to build the hypervisor on macOS, =
and
>>>> there is no Darwin configuration for a Homebrew-based toolchain. In
>>>> addition, the Makefile silent-mode detection can be tripped by -I path=
s
>>>> that contain an "s", which hides build commands unexpectedly.
>>>=20
>>> This wants submitting as a standalone fix, so it can be backported. But=
 see
>>> also below. I don't, however, understand how -I could be useful here - =
our
>>> build system is self-contained, so any include directives used should b=
e
>>> satisfiable without any -I.
>>=20
>> This is added automatically inside our Makefile if you build out of tree=
:
>>=20
>> MAKEFLAGS +=3D --include-dir=3D$(abs_srctree)
>>=20
>> which ends up being -Ixxx when tested.
>=20
> Hmm, but I do have an 's' in my source path, yet I need to explicitly pas=
s
> -s for the build to be silent.

I did further investigations and my previous assumptions where actually
wrong because i looked tat MAKEFLAGS value once the whole Makefile
was parsed and the include-dir flag is added after so it was not the reason
of the issue.

In fact the issue is coming from variables set on the command line (and
in my case O=3D with a path containing a s).
So you can easily reproduce the issue by just passing XX=3Ds to the make
command line to do a test.

As a consequence, your proposed solution filtering -% is not working and
the only reliable solution is to actually use firstword to actually get the
short options list. This is making an assumption on MAKEFLAGS having
them first but my tests are showing that it is always the case.
I would propose to put a comment to explain the assumptions on which
the filtering is based on top:

Something like this:
diff --git a/xen/Makefile b/xen/Makefile
index 13e336ba5484..a7924fcb7af5 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -113,10 +113,10 @@ else
     Q :=3D @
 endif

-# If the user is running make -s (silent mode), suppress echoing of
-# commands
-
-ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
+# If the user is running make -s (silent mode), suppress echoing of comman=
ds.
+# This relies on GNU make encoding short options in the first MAKEFLAGS wo=
rd;
+# if this changes in the future, this check may need revisiting.
+ifneq ($(findstring s,$(firstword $(MAKEFLAGS))),)
     quiet :=3D silent_
 endif

Also i can put a fixes tag if you think that is useful:
Fixes: 4fdb4b71b152 ("xen/build: introduce if_changed and if_changed_rule")

Please tell me if that sounds ok for you and I will resubmit this as 2 diff=
erent patches
instead of a single one.

Cheers
Bertrand

>=20
> Jan


