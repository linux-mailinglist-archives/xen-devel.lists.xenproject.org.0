Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMNACE/kkmndzgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:33:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6AA141F9F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:33:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233848.1537205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruyE-00051J-TO; Mon, 16 Feb 2026 09:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233848.1537205; Mon, 16 Feb 2026 09:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruyE-0004yT-QG; Mon, 16 Feb 2026 09:32:46 +0000
Received: by outflank-mailman (input) for mailman id 1233848;
 Mon, 16 Feb 2026 09:32:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2lT=AU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vruyC-0004yN-NK
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 09:32:45 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 716cef69-0b1a-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 10:32:42 +0100 (CET)
Received: from AM6PR05CA0033.eurprd05.prod.outlook.com (2603:10a6:20b:2e::46)
 by AS2PR08MB9024.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 09:32:33 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:20b:2e:cafe::ae) by AM6PR05CA0033.outlook.office365.com
 (2603:10a6:20b:2e::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 09:32:31 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 16 Feb 2026 09:32:33 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GVXPR08MB11846.eurprd08.prod.outlook.com (2603:10a6:150:317::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 09:31:30 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 09:31:29 +0000
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
X-Inumbo-ID: 716cef69-0b1a-11f1-b163-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fCEPFP+uJxGu8dbj01ZEBRNrugbE9Rq0rM6wAMFJ8du3WX/bLAJzMfIPBTYdkdcq9VDRsK0jdQd++ESGBgjSwUVprs1eqk8FtkF2hfxnumqmbzuYnlEuScnW6B2P/iPczwEXq/CwfkHneWcbdvFHz+W1NbhS+B+Gi++rsdzJqh1+qQtHUfRlpLeYOhw0pZJVyjaWDPqhXCqkcyHli9te5RviFn6+S/pOPfROXu7WyY8WeaIxeFYl1OwdKF90X2fs24FEqAC6pKD9KnDrNdmlVKWsM0xd2vcPYCnsOtO6lQVcYvUAMfnMw4sz5nsVpD7TefAP6pOlJHMQpGCS/B58Eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTj+yGqPL4YmlAbDtOeqjY6tDvYVS0U3TrbXDjHDUMo=;
 b=d5z1vZplWmxt54yHkMnUOEO/uYDykGO5Hvbjhy4OqozhmPepDYLk8WRACCuMsBrvAL9kby/y+8WO6MCNbyVzISdBMzENIdTLrTKfrhEJziIc2wOEm3aLlMv8yYhUItYAAeB9CAQCkcN/ik8RN8DZ3LP0HMDTim9A7ZgEEJwzKNuIaPgfjdSPKYk4jCiZiKHevZnNSLrwap6GMyTUNEhg8Dptg+tGx0Iw/6lLR9OqH3R3795eKjNC0zN/qXmhJ+vnBnd99tib01O9uxWMQrmCKAZr8tyXEN9VRaPm2D/7RhHBbBw3ZedzszY7nlTPAYMEz0r6AnBKwfNTuQ0g49O3aw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTj+yGqPL4YmlAbDtOeqjY6tDvYVS0U3TrbXDjHDUMo=;
 b=jWSs4LMwH9kJVuNv5QtOUlZoQYCdHvs9Aq7NuW2QjPu1Sl+xpfZ2rdPgMQVMm+2PjQrH3Z6aOFtkjtJpTS4RE4M5PrheGUMsHYiiR3ElHV3iM6PkdpyWFgVgsivb2rhcIUN+/lC0BTsruoVMaK0mKfuX3TDLTTcwXQRmxrASDg8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSIJ8MyTey4dJsOBJ+19MtOlrCbYeh0GgbeT8sMSj2AzZomUw391Vd3Mm/kXWTlDvdPrwkEACmmeq/cD/TE8+80TPq6gDlk2jhCAh3ysXFRgnxUzLsKnmt5OvEKAcqH3tkqpWHZql0USr84GsyQh7FFA66dXkDnXvsYFSnQvo6Nhfa1gAxZGVpU600zls9KKGs6MvdDGSIPDdZsqmSkUcNrsdijNFVOo49rOyDaC9JPjfIE+v7J+f0zCZVIKRS96cOlTPhzpuEF7XH6FDc6xdSQ1yWJG2kdUIVgWnln8P2JFZO7Y1sGe+DNjgdWTWVd/JyL4Hq0NVSDyuRWf6aBbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTj+yGqPL4YmlAbDtOeqjY6tDvYVS0U3TrbXDjHDUMo=;
 b=kOZ5yj2KtH/Oj2ttCDaB8+7oRYB+c0V9mt2TxYDFc5TTsZBMllXhMmyO8U8OFUbkyrg5F6b5DcbsxKrRgeSAeWu8wf1r21ePaZSqQhEzW4aTz3QFA9Uu5BuQpfz1zwhbqbWS+f11zgLwJasB6UQTqo2VGLMeRhg7IoXimSdexvv4hTB1R/DHtd7jaorBr3v2De2tCt6lkYi8viRJzWtrHsvVVEHiDHTCby9m/jLneKWwe3wulWb3AAmF3//HKT+PzyeAcsVyPgsN/kQy/8rDNk+kdNc9gkatRnQlCo+jJHxouqYKhkfFaom+Iw326i+FrKbuHJ+RAIponH0qjYJ1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTj+yGqPL4YmlAbDtOeqjY6tDvYVS0U3TrbXDjHDUMo=;
 b=jWSs4LMwH9kJVuNv5QtOUlZoQYCdHvs9Aq7NuW2QjPu1Sl+xpfZ2rdPgMQVMm+2PjQrH3Z6aOFtkjtJpTS4RE4M5PrheGUMsHYiiR3ElHV3iM6PkdpyWFgVgsivb2rhcIUN+/lC0BTsruoVMaK0mKfuX3TDLTTcwXQRmxrASDg8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/arm: smccc: Preserve argument types in v1.1 SMC
Thread-Topic: [PATCH] xen/arm: smccc: Preserve argument types in v1.1 SMC
Thread-Index: AQHcnxiN7299tnoecUy3OIetO+v/gLWFDRSAgAACvYA=
Date: Mon, 16 Feb 2026 09:31:29 +0000
Message-ID: <D54AC574-88E9-477B-B355-375F4B1CE787@arm.com>
References:
 <0e2ba0af683fa5e53a3d2b4b625703751cf7ce54.1771228001.git.bertrand.marquis@arm.com>
 <3bbc408d-d16d-473e-81bf-6ea1f78290af@suse.com>
In-Reply-To: <3bbc408d-d16d-473e-81bf-6ea1f78290af@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GVXPR08MB11846:EE_|AM3PEPF0000A792:EE_|AS2PR08MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: a6670964-5c70-4498-1d43-08de6d3e5006
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?h+N2xWUXIuyrC1YF16B2VpxDySlk9XF4HaV3YspmvecHCsiZ9Qkq4iwsug6A?=
 =?us-ascii?Q?yebiql8LgFofshydDrnvopkHiQzX5BI49fO0T6acAmR9zeTKX2yB/KuQ24M6?=
 =?us-ascii?Q?gKrPUDIuY7QLhuFTVLAfHqXuycDe5AvvhOnDGGROquxRY8khboZaSfMd50f0?=
 =?us-ascii?Q?PUPEaltOF+m3ex6A2kBGOuW5uIlVh2SS4TkxVPP6VDalmludK6G7gfLYRNFy?=
 =?us-ascii?Q?xd+yuusPL2a1XJ1hCFCQSaew7/IuMB6D5wASHUyG8bXECLVGf4NV55yM8lNl?=
 =?us-ascii?Q?6T3Vv/Rj9PJ1quMoFkK1ch5jy/YhGdQIqadjbv+sKAhoPhgYfAfp9NBlbrS2?=
 =?us-ascii?Q?DSS/fzjkY8yL7MpJ7W4VHdGrB0AD1KXotoyWg34nK26EQBws0z1WPnuwhUKm?=
 =?us-ascii?Q?cT/BVm2eGyYwsJRcSyrTAYvfBxQ08gKgsePzmPmIUnQ8jBqJ99dbDv2aZ42o?=
 =?us-ascii?Q?azjGLaKrm8Fpz59gfaWmfuEop8241aByz8v6CThdohJ5NhW70WQswvNOuhrs?=
 =?us-ascii?Q?dh1766xMKxCDz5F2DkgjUTuKTm5dI9Vrvql5vMdQo+uI4962gSD6rMs09P3z?=
 =?us-ascii?Q?yangYQbLQuYBEZ3GHJ77iB1zR6nDKWlvt8MSgeU94YewBprncEWhvuiY5xL3?=
 =?us-ascii?Q?X26l6EDGklzeGWrRJkUApMvE6NU0ET+36IofXh09gy52KIjKvzYjbFPFiLKE?=
 =?us-ascii?Q?XPmuDyT1fQ3vkwSePGJWTAhuuRffSgA7l3Jp9c9R+wjjxL9qDY+GsgOukIVI?=
 =?us-ascii?Q?OGYjQTNfhL/WgodPhGn/e/qfcX54CVNPfA4mTOzWmTySUZjVLkFWqK5i8A31?=
 =?us-ascii?Q?tmBHrdoL1qgrV+j11VzV5k4XOW9CnozaYWvarE+2kiJm0keA2Zs+UYYDMFcx?=
 =?us-ascii?Q?0ZEb/z+6+lwi8fiheGGl+jTxByX+NO0BXKmhCsbdr6PYOqemv6JrzPKPW6Nk?=
 =?us-ascii?Q?u6V3WfdDNvL7Zd+m09vw9rfy6hE1OLvJWaPaWsLhPgRdSpVS0r5hmUgRgNxz?=
 =?us-ascii?Q?gqPgFNt+8TIkfOF6bmA/MfvptzRG6cwd5mMnENCmClhomwf+c7+HLIc5tbV4?=
 =?us-ascii?Q?SYW9eyezwT8bJrD77Z2RRIA3+B2dw/1xWwKi+8v9iPkUgUJ18cVd6uNWFGwE?=
 =?us-ascii?Q?eQx5ryFZXYncbymz1+rPpi6s8/u6rCbBLxKDzz4UAch6BCtPeWqWzDHtldmf?=
 =?us-ascii?Q?6oCQLCTc9Ki/+hQyuGFFoWYY/6jW0UoiwsUl1XOrlJ5jozWWJSWLcyiZD5BY?=
 =?us-ascii?Q?1n6kSjx/NkxUfeygpxH9Xim/IqwNWiyuBkifQuqHIgE5nvbz99X9UeGHhz0v?=
 =?us-ascii?Q?ShnrXBeLULwAFVKClUFtHSJKNiXeuoDkL2+Rai7If7jkWgr9/0w/8RyGdh4c?=
 =?us-ascii?Q?cM2qk43qHC/Z4VYjjtZMBxdl/uKJ92BiZcNQS2eaf6HrGu02BWhHOpBnUbzT?=
 =?us-ascii?Q?TGRWR1L4hRdsj3loK/7K81DyiFfWLBUmrtPNq5SXUnkq5qcmNBrzJKMnX+JP?=
 =?us-ascii?Q?/MckkKUsMtNtCtPQEjjam4/jOeMyQIcZ5Bg1Yfx0rE4W2BqvKo+ngUT7CU8v?=
 =?us-ascii?Q?lDEPUm1ApAsTOcFhkxKrfsnJMW+hr5L26Fx8VTczaWiz0BRq+u+WUuFqQ7wO?=
 =?us-ascii?Q?7O7Pte5/bGBGS0qanH7b3G8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <35C16E0401DC084AAFC9C012DB79A050@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11846
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c9f53aa-10cd-4943-e046-08de6d3e2a36
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|36860700013|14060799003|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xnQyMw2fDYEG/Ag5ukekmoxUkeRpoeSPXpTegWHeINFkMXgMquDgmEViFpZa?=
 =?us-ascii?Q?UMFqP7tz1ICulredpcMmkzTAMAjEn6ZSX6Lzw64vOX9aADMSOc86MBc1uYzz?=
 =?us-ascii?Q?2/scDhEiUEM+OfqycLgAbT4azJq2cCleyf/71/Sma7iXbM1hNIbonE9B1ZGb?=
 =?us-ascii?Q?gFslUpyKnA8X26ATPh8bqMtu8abi1Lxf6NAqa81GM9+20WknwFIV183mij1I?=
 =?us-ascii?Q?QuflbKfQiWwGiH5ZLeQfQ/o/cEqTZwaOzv2ne6/soKESJykNQSG8IqvWlyzZ?=
 =?us-ascii?Q?ELzUP+SkfWcx2L/D8DkF3valRPwkxEVP+3V3tfeM5+uN1osDYYoir7I7bzB2?=
 =?us-ascii?Q?f0ezjrpOR8XBegtRr1PRFqlEXmkas7aXUOr60IWE4snPElixjTdZNYzzTwST?=
 =?us-ascii?Q?Gvqv7ggkqh+q/6YXvMz+e7O2GTf8WDi3iLyNgnJOva+R5QYUlQ08sTxmrmo0?=
 =?us-ascii?Q?1txi4Qzs152OuYMW/QmjoZU3GKZhJUs5nTY20C/HhJzJriZxnDnbm974pHgQ?=
 =?us-ascii?Q?eppdMXXi48WvxT0LltQy37CkpR69DnvSjoIbqRtqhD1ByWldERmf7KHN5u1V?=
 =?us-ascii?Q?eLk5YbcM3W48Qphr3zlqgqXK02zMRbwzQG3v2s7KnWEBX5QfK9ahZRo/cHyj?=
 =?us-ascii?Q?Fx24mpq3M1rrz088ca/NuFuhkPjMK5FgJ5Cj5j1kUQLPUs0ljzP+SLjqz+KX?=
 =?us-ascii?Q?SmBG4fLNx1ZP2SGAldV5htt40qMwIwZqpa1AXlsj8g4T3rfUhajz7KIRzaLd?=
 =?us-ascii?Q?+pSLGDij4dy/5XjUkrIccUkzjaRpoPeTVzzda8aVAqpbDy+id5a7sJok/YUV?=
 =?us-ascii?Q?L7ZIRWa5hM84wa9vjS4nRj7d7Wib+4PANWAP7cMpjS8Sj7tcAvAmLINUAoc9?=
 =?us-ascii?Q?bybC92eZzCOB8+qtddvAYAv/rFsBxVuVNUMHZ2UZklcv+nCYv6bSv/HHljmz?=
 =?us-ascii?Q?p06NFBZv3ALu6mHyUrheA9hITrPQsoK5qlJYdjxdDnfculKrhc6CY4yNBQ6I?=
 =?us-ascii?Q?0uhSHmhus+doYdAvuev04lrzQCmrnqIS/0LoIZRrfF5i+gqOYMjQD16sDb0f?=
 =?us-ascii?Q?s1chYUGux4Yx037uSp07a33LHE4XlBqYFX+NggUxj1KoJsoo22apgE27n2Wx?=
 =?us-ascii?Q?jJ6+P/hyp+/q2w1rR6LxPKHk7Db3gcDi6uQxlsjm5ibk0Y71nm4MsygLimTi?=
 =?us-ascii?Q?0Q89pCIzmkdt97g5apj94x+KZli5nJ/RAqAu6hDMRdhZdd5gWkBymh0SbGhH?=
 =?us-ascii?Q?gKqPAk2QOWQu3nP1YOn7ACjLqHFMfDaVkykQjy1xXhJc20M3E2zJ5dbUoB6e?=
 =?us-ascii?Q?FSzwByyq6k09X2q0QhUz81IJ/GE8LOKjPaR9wvRD26xj5rDKVkqVpfPmNKw0?=
 =?us-ascii?Q?TyrPj/QEN4JJwJbox/SxKXRgaTVU3UB9kB+cTkwyooyxuGLj2O+lK7WtAS02?=
 =?us-ascii?Q?aEGsj/YoR7uW8TFjlSo46JHJfKaFnBhIjATdpTujUTcU40y31NOzcmz4uNE0?=
 =?us-ascii?Q?6SQSxfREsuh0hRz0JbdUfm+PQYxceQGaVZp0hrNnCvDqmugMuoARjUEUw4+E?=
 =?us-ascii?Q?Ljnr9sfsQbw2IlTDupCgMiJziFrrreAAkP0Dwwe5yv4QNh/uc0y/tIO1DTok?=
 =?us-ascii?Q?vSJ5MOn8WKZoI6AZ9QxCnjEAEFcy3AOCZ9X45sFYnlbeU+26Ckoydn6N1nwa?=
 =?us-ascii?Q?ZvPLMg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700013)(14060799003)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ssAQTnmYMznKWSekvwBEVhembZgc58lYcw4TrSE65QxxuOhxNtQBQFpbClIbqG7cM/1EJVHpjzuamdG+/lVVycUqNn1z3mKrpWQ0sr8i9tYSVeRBKRO6hhNq1l/v1PqOXHyMw+wJ0MPd0NPo49Ry2AOQqTx9hwqkvUEhXiSazkrv4My1+O/YfJHazw6xary6l68fyHJgVyVCH9sz84uuhNbS4sTKLvnb8dsh1pQA7WjiJQYodQWtbFE0ptsHbQSIu+uTyD4YVGt3hRMKrlVrtTi9OiYWGzlNeiO27MCkkR0gvcNX/9ZbE/XAqYaI/WN1b5UyuaPClMmsuAamOABn+IbZsYguTYFkhNvHOk62BH51Y+VPoNVah2xAUYfQaam4a4xj09BeNoiBbzrgIoWB2PubwnJmRnDDNgc+ETVsIISp5TMAY8deClGy4Z1uQvRY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 09:32:33.0171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6670964-5c70-4498-1d43-08de6d3e5006
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,arm.com:email,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 1E6AA141F9F
X-Rspamd-Action: no action

Hi Jan,

> On 16 Feb 2026, at 10:21, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 16.02.2026 08:47, Bertrand Marquis wrote:
>> The SMCCC v1.1 inline helper currently forces a1-a4 into
>> unsigned long and uses in/out constraints for r0-r3. In
>> contrast, a5-a7 are passed with their original types via
>> read-only constraints. On arm64 this means a 32-bit signed
>> value in a1-a4 is converted to a 64-bit unsigned value, while
>> the same value in a5-a7 keeps its signed 32-bit form. For
>> example, a negative int in a2 is widened to unsigned long, but
>> a negative int in a5 is passed as a 32-bit signed value, so the
>> SMC sees different encodings depending on argument position.
>>=20
>> Switch the helper to use typed input registers arg0-arg7
>> derived from the call arguments (keeping a0 cast to u32) and
>> separate output registers r0-r3. This preserves argument types
>> consistently across all positions. Argument evaluation order
>> is unchanged, so we do not reintroduce the issue fixed in
>> "e00dc325bd9e" ("xen/arm: smccc-1.1: Handle function result as
>> parameters").
>>=20
>> This also aligns Xen's SMCCC parameter handling with Linux's type-
>> preserving behavior (same externally visible argument handling,
>> independent implementation) to avoid surprising differences
>> between a1-a4 and a5-a7.
>>=20
>> Current callers (PSCI, SCMI, platform SMC pass-through, OP-TEE,
>> and exynos5) pass unsigned values; exynos5 passes an int CPU id
>> which should always be > 0.
>=20
> Reported-by: Andrew ?

Ack, sorry forgot that.

>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> xen/arch/arm/include/asm/smccc.h | 69 +++++++++++++-------------------
>> 1 file changed, 27 insertions(+), 42 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm=
/smccc.h
>> index 441b3ab65dee..5b30dd57b69d 100644
>> --- a/xen/arch/arm/include/asm/smccc.h
>> +++ b/xen/arch/arm/include/asm/smccc.h
>> @@ -99,87 +99,68 @@ struct arm_smccc_res {
>> #define __count_args(...)                               \
>>     ___count_args(__VA_ARGS__, 7, 6, 5, 4, 3, 2, 1, 0)
>>=20
>> -#define __constraint_write_0                        \
>> -    "+r" (r0), "=3D&r" (r1), "=3D&r" (r2), "=3D&r" (r3)
>> -#define __constraint_write_1                        \
>> -    "+r" (r0), "+r" (r1), "=3D&r" (r2), "=3D&r" (r3)
>> -#define __constraint_write_2                        \
>> -    "+r" (r0), "+r" (r1), "+r" (r2), "=3D&r" (r3)
>> -#define __constraint_write_3                        \
>> -    "+r" (r0), "+r" (r1), "+r" (r2), "+r" (r3)
>> -#define __constraint_write_4    __constraint_write_3
>> -#define __constraint_write_5    __constraint_write_4
>> -#define __constraint_write_6    __constraint_write_5
>> -#define __constraint_write_7    __constraint_write_6
>> -
>> -#define __constraint_read_0
>> -#define __constraint_read_1
>> -#define __constraint_read_2
>> -#define __constraint_read_3
>> -#define __constraint_read_4 "r" (r4)
>> -#define __constraint_read_5 __constraint_read_4, "r" (r5)
>> -#define __constraint_read_6 __constraint_read_5, "r" (r6)
>> -#define __constraint_read_7 __constraint_read_6, "r" (r7)
>> +#define __constraint_read_0 "r" (arg0)
>> +#define __constraint_read_1 __constraint_read_0, "r" (arg1)
>> +#define __constraint_read_2 __constraint_read_1, "r" (arg2)
>> +#define __constraint_read_3 __constraint_read_2, "r" (arg3)
>> +#define __constraint_read_4 __constraint_read_3, "r" (arg4)
>> +#define __constraint_read_5 __constraint_read_4, "r" (arg5)
>> +#define __constraint_read_6 __constraint_read_5, "r" (arg6)
>> +#define __constraint_read_7 __constraint_read_6, "r" (arg7)
>>=20
>> #define __declare_arg_0(a0, res)                            \
>>     struct arm_smccc_res    *___res =3D (res);                \
>> -    register unsigned long  r0 ASM_REG(0) =3D (uint32_t)(a0); \
>> -    register unsigned long  r1 ASM_REG(1);                  \
>> -    register unsigned long  r2 ASM_REG(2);                  \
>> -    register unsigned long  r3 ASM_REG(3)
>> +    register unsigned long  arg0 ASM_REG(0) =3D (uint32_t)(a0)
>>=20
>> #define __declare_arg_1(a0, a1, res)                        \
>>     typeof(a1) __a1 =3D (a1);                                 \
>>     struct arm_smccc_res    *___res =3D (res);                \
>> -    register unsigned long  r0 ASM_REG(0) =3D (uint32_t)(a0); \
>> -    register unsigned long  r1 ASM_REG(1) =3D __a1;           \
>> -    register unsigned long  r2 ASM_REG(2);                  \
>> -    register unsigned long  r3 ASM_REG(3)
>> +    register unsigned long  arg0 ASM_REG(0) =3D (uint32_t)(a0);\
>> +    register typeof(a1)     arg1 ASM_REG(1) =3D __a1
>=20
> Is it intentional that you switch to typeof() rather than directly going
> to auto? This was it'll be more churn, aiui. And if deliberately going
> only half a step, perhaps worth saying so in the description?
>=20

Yes it is because Andrew wants to rebase his serie on top of this
patch.

Cheers
Bertrand

> Jan



