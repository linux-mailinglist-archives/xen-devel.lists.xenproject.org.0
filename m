Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VcCtD5FrjGktngAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:44:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743BA123EF5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227398.1533792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq8dU-0002MS-Hy; Wed, 11 Feb 2026 11:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227398.1533792; Wed, 11 Feb 2026 11:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq8dU-0002Ke-Eb; Wed, 11 Feb 2026 11:44:00 +0000
Received: by outflank-mailman (input) for mailman id 1227398;
 Wed, 11 Feb 2026 11:43:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vq8dS-0002KY-63
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 11:43:58 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2dff251-073e-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 12:43:57 +0100 (CET)
Received: from DB8PR06CA0053.eurprd06.prod.outlook.com (2603:10a6:10:120::27)
 by AMDPR08MB11652.eurprd08.prod.outlook.com (2603:10a6:20b:73a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 11 Feb
 2026 11:43:53 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::8) by DB8PR06CA0053.outlook.office365.com
 (2603:10a6:10:120::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 11:43:51 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Wed, 11 Feb 2026 11:43:52 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GVXPR08MB10586.eurprd08.prod.outlook.com (2603:10a6:150:14f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 11:42:47 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 11:42:47 +0000
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
X-Inumbo-ID: f2dff251-073e-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CczI03d6YX8vQLsCokRL3ANEvjx0jcWXpc1glbiiXN9pb7VPw+P1/hzPrIghdLMKiw4rStBpQSgG+bkfDxK9KRnl3pmfsWOdYOMv21K7hecsV2ZgHyK8KbFtjCnWtoaO5vqfqgORnSqCJKkZoLqjlvp9g00AOObjrbp2X+gYsBkw0m38F5aPzdofRYpCAfkcNR2nyZvCwofEG9ip9FFmuQN4/pFMlayGZXLl+rUd9avSc7RmjZwTv2+lvMU8NzP0GTddLzqg8gWow20EURATWvZXBYMl+rVVvanP0JlYfFSzchVE8lwpNDY6+F1K+NdhyqWzv5ZoYmxHwjRZRbV+Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rcBLi1aoRtywbZ/T93D9mrJrpvjzyhBIbhS4enMz4M=;
 b=S8wG+CAdE5Gjt6yFrZYZ/Mci3aDjb30eGzRrVgpINqore+9bYwvIb2i1ZCXI9LI2U3wGYv5cUIQFQUw9C136P+rpzNVMtzbfmrmky2De6w0zPLjJ66H9jiuKb+lJZ7PuZ3c4tjfdOOgZzPrjPe07te9fPbgnWyUrNoCF37xo6RSrfe7dQ6CKcNH3TbtOYCrEVuSjXdjcPxw+wHq+yHtLSx8zXXSoJ9cBz0ahOB/CfXpX5ugyOSnqcylkkOqzs9/OBabHn1tfdHX/hCs+BkZU7dfuAgXXGfiRCO3EP2U2XDPn4cMSz7KgSNC1k2UEL31jZtoA5W218MAq/Zp0iyYqVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rcBLi1aoRtywbZ/T93D9mrJrpvjzyhBIbhS4enMz4M=;
 b=X3YwnJejhhH43ixFG+wtlFhM5vLUMsnGkubuKxidtBzrlb8EOPxaZ/l9XT2anSasw/KEB9DQtLRl7sSp89VWkBQQAR0zny6v+m2dv/xnZlvLifGM9TKhjMhZ1hdUPFEV2pnbli5yAYnJ3pKqyqJ4EA2ePCx26cGsA+MwYOSE520=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFrkiQSgkR8h1XwxmxKgJC/u/tTXdHbGVm2OeLMWUbRAWzYCVzEo985qTH5in6A9CykciU7XeiTtqxX03x4mk1sLF3+U9dA24swt/DK4D3t/2r2Q4D0Fp/JsKvIhoRo8gn+LP08xgxEFxK9cUlDf69nQAN1enNJ4669U3PfQg2NpENgv+rGH0vyddZIEfKjZIfZQmMdrWK0wZtPnWIdZ/MdWWnfhYTtIfpjrb3Zz5J1kw8wCrRW1yopxiNT8LGySUeat3HBdNsDzjIo4kCxtKPzq4uc5ceOlBllmIMx5vvkZ8LOb8CnvNfvPOwf+UsBrHrRAfQjaFtJN4BL+cLryHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rcBLi1aoRtywbZ/T93D9mrJrpvjzyhBIbhS4enMz4M=;
 b=IWeIEieYriL5JI4fpc9zgpKPlkZ1FcOjaCEWq2Cz2JL1umLUwtdl3eEChfJnm0x0rVvyb72bnXUjwGXXXSht5taO7XPJ0y8xQfqKPrEVE+K0rrwVeXQSQ/T/D2Ny3tSle5KJ/Ha4F9Ff5G2+dnjlWyONjWFsTTy8i1E34vrHAY0nRiyeMeF/UCHOuz1rBbPYtAlmVpCXQgIZkwkCIRmh6QMrDi6aUCJPeCHmmhQ5unwmHDIy/PwwyyDAMlHOAABCMl3eAqNthssAtAmCgSraxtG0nSSV9nDI+v5sNTDYp3WcWWbOc4UcDZyp7SfdgCn758TXNQqGH2xaHzWZQey6mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rcBLi1aoRtywbZ/T93D9mrJrpvjzyhBIbhS4enMz4M=;
 b=X3YwnJejhhH43ixFG+wtlFhM5vLUMsnGkubuKxidtBzrlb8EOPxaZ/l9XT2anSasw/KEB9DQtLRl7sSp89VWkBQQAR0zny6v+m2dv/xnZlvLifGM9TKhjMhZ1hdUPFEV2pnbli5yAYnJ3pKqyqJ4EA2ePCx26cGsA+MwYOSE520=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 11/12] xen/arm: ffa: Add MEM_SHARE page diagnostics
Thread-Topic: [PATCH 11/12] xen/arm: ffa: Add MEM_SHARE page diagnostics
Thread-Index: AQHclTUyA7I1agGV+UuUfDON72XmkbV9Uj2AgAAaYQA=
Date: Wed, 11 Feb 2026 11:42:47 +0000
Message-ID: <7FFDFB40-DADA-448A-AFDD-16A108FBC70C@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <94e10f14d499d7e584fb0fbdd28d0288bb5831bd.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44EN19q4NBteEY12g0w2TZE4apfo=a0Lu30ufjTDYr5DLw@mail.gmail.com>
In-Reply-To:
 <CAHUa44EN19q4NBteEY12g0w2TZE4apfo=a0Lu30ufjTDYr5DLw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GVXPR08MB10586:EE_|DB3PEPF00008860:EE_|AMDPR08MB11652:EE_
X-MS-Office365-Filtering-Correlation-Id: 7657292c-8660-409b-10aa-08de6962d4b3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZDR2dThabDNqWmRzOUlFemY1Qk96QjFGcFRwc05aR0wyRDBTV1E1WHJ2cU1v?=
 =?utf-8?B?bUtHZjBuMGVmSE9BTnI2TktGRkd0dXlpYXA5VVpnZ1F0OWI2L2w1N1NyRWZN?=
 =?utf-8?B?WVpVN1NkeWVRRFVhZWU0NGtJZ29qa0Yxc0NTZi9PNGlLNXZpRXBpd0pFRERX?=
 =?utf-8?B?L2V3VGFBRlBpWUpnVkZpMjBDZGVvNTdtR0dIMmhJNjVHdGZtSWcxTGdla1JR?=
 =?utf-8?B?b0xubmFvbE8zQVprVzJUUkFZVEU2UnN2b1M0WjQ1RHUzWkNXMW52aCs5RUw4?=
 =?utf-8?B?NmpQWmdTbjgyV201cDhpOFZMZWw4TXVySUxpbXBIaVBpS3I3KzJGMmtYNTRh?=
 =?utf-8?B?WU9LSkY2Q1NQckFJYzBXcXRDL21MRjJzYloxa1RtaURnRmREcE9vZURiM1RV?=
 =?utf-8?B?My9OTzlzeFNPM0ZvcnRHaHU3WGp5QVU1Q3NUWEtwZndNbmhXZkt6RmZCN05t?=
 =?utf-8?B?RDFmUU1Oa25KbHBBNVpuK29VczFKdkIwZXNGdFVrTU5wYnhpUGhNRzh2ZFND?=
 =?utf-8?B?WmRRc2xpMmZ6OU1pNjVUK1dhK1dVRVF5UVYrbXlrTksxS0xVY3pCeDRVWStn?=
 =?utf-8?B?Qnd2ekloU2Q2ZUovSkJwZS9GVC9QNnp2eVZCaGxWMDluV2hTOFQ4VWtqQ3VX?=
 =?utf-8?B?ZWhEWFFuaGhwaUpPeVJvUVRZUmxPRFVTcWZrVVNJZmhxbis5a2NZV21DL1ht?=
 =?utf-8?B?clhRSlY3eXFVS29La3hkRnJ0UXZBWDlJc0V6N1RIWmFld1gwUk1wRkZ0bXcv?=
 =?utf-8?B?MXlPaXZmOTMrSzN3ejRJMjgrMHFqeUJXeXEvWk42ZlRyV0VpTFNOelpwWCtO?=
 =?utf-8?B?SGM0WFlqWEdtczhKUkxiUXB1RUlsMVQ3V1UrYjdRRmZRMmJMaTNRSlRmdDJm?=
 =?utf-8?B?d05IUjI0MkxRNUFjOGFVOWs4VFkzSFdYbGxYVUtUUHE5Qjh1bkUxVUwxYnhw?=
 =?utf-8?B?c3JXVk84ZWx6M3Bxb0dkTEpLNWtRVVdTdm5zdm0zQ21EbHlrL3VmU084cVBp?=
 =?utf-8?B?ajRybmN2R3JHWm9YZnVTc0lNamFaZjFrM1lObEU3ZlNkT1dSQnVxd1d0SW1V?=
 =?utf-8?B?R2E0RGI1aXVYeGY1SVViVXFqQkE4dkJSakc4THA4Nzhybkp6dncxdXUzZVp4?=
 =?utf-8?B?SitseFJ6bHRoQ010NnUvNUlxbUVmWDdSRnZNREZJT1dEUGlyRUdLZWdxck56?=
 =?utf-8?B?TUdkZXFmOGplbzBRcnA4SGRpdXBUb0d4WDRTNkNDSFVXcTVWRGtYWjlWNmg0?=
 =?utf-8?B?d05QV0hlTVdpcUx0T1NaaElGbUsrbjEyVHAwQ3M4MEFXOTFZZVlRZXR3ZHY3?=
 =?utf-8?B?aTNCN0UzeVVFS2JnVmZwUFY1QWhOM3hHU01HQ2ZUVkhJaVRnQjBFcHYwMXlr?=
 =?utf-8?B?WEtDVWJTc3dZck4wSUhiOVNxa0FyNlNpOFppdEVab2hxdW1mV2tHSjJmWS96?=
 =?utf-8?B?b3NaakY0d0JySkRieXNVVDBDWHRhdERXajM5eWNzbEpIYURETVpOWDRPTTNO?=
 =?utf-8?B?R1Jsckp2eVc3d1FYUHFDUVllcWxLWndobGlvZERFKzhRRllqK3hGMTdURy9T?=
 =?utf-8?B?WjR0bTByV2ozZVFqdlRZZ0JkYk5XOU4rRmo5MURCcGl5UlhVcVkvbGV5YmVh?=
 =?utf-8?B?akhlYWRHeGkySENXNC9SZkgzWGIrS21oT0wrQlZhRGgvUExXOFFYYTlRL28r?=
 =?utf-8?B?bmFka2VyY0w0aW5PUnZ2RTJDaVRmZzhPbFpJRkNKaVhMR05mN2dIbUtTSzBD?=
 =?utf-8?B?WEVxMTVrU3hRbFhFbWEwOW42L0pIc1AzYWxWMy8xWnVXcXc2RklXOWM1MGtx?=
 =?utf-8?B?ZlFXMnYxNEhjaWN5V0V6SGtSN0gyL2crYyt5Vnd4bEgzbDVzRHpzajNibEhl?=
 =?utf-8?B?K1ZaYm4wV1VPUUJOL2oxTEFEZlBUNFpKL0FwOEhOam8yYWhBRk1uamdmSkVv?=
 =?utf-8?B?RDI2aWJ0eWswMWFJQTE1S2YvMUYxeXZ3WmllcWYvQVNEWHlXQlJzd21OS2JX?=
 =?utf-8?B?S1ovQXQvN3VQOEwwRFg5enh3OWpXQ0ROdjYraUI2cUVTeWRtYkNsT1RlUjRO?=
 =?utf-8?B?VWRtbzBxRnk5MUVyVzhlUk44VHVFN0FFUUlRT2lINHd3N3VROHFwVW8zTmVj?=
 =?utf-8?B?YVM5aXlkakZWc2tZY2VIWFRERkRsckVOSW9xendkZFBYeG00S2dNczBSWkxs?=
 =?utf-8?Q?br0wQkoFLK3Mywvn81xJZu0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8402831F3F18E4BA7DC87F04AED7047@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10586
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b656a3fa-c8b2-46f5-d227-08de6962ad96
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700013|82310400026|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWJJR2xFOHFjSVh6dU11dnpxbC9tbUhxUE1CU3NXdDZSb2dIZ3RXcjhRZjhl?=
 =?utf-8?B?SDNLWExYT2ZkVi90RklnaGdnYksxWVJ2WHhndk8rZjlxaUMyVmpUeks0b3BR?=
 =?utf-8?B?RjVCQXhLb3l4WURvV1d6cDFxeFdZUjBCblRPQjQrZHoyQVh3VVJ6TjE2M250?=
 =?utf-8?B?dWxOQ0l4Yld6VFg2Z24vNFhFMEw0bmxqSVN5N2VRbERNeXVXMzJhakg2dHRz?=
 =?utf-8?B?OGVOOEpNZ0NXZkU1MmZYL0d0cDBMaFNLdDlMTENYZkdZdWZBSXZFQVdOMmFM?=
 =?utf-8?B?WmhyNnZDd2c3YTNzZWU3T0JWNmxMNDJtQmgyclBab0ptTjlJTStGTFdPTkdh?=
 =?utf-8?B?czVpUkEyZ3FDWlhlVWZOcjVReDRlWmJjMU9UaFdzdXZtcFBPVHVUdkVFQzJK?=
 =?utf-8?B?UUZZbmRIQmlGRlBsY3FZU1E5NnVOdjJiOTArMVl5bDQzU3lEU3VDZGRyY2I5?=
 =?utf-8?B?cG1WVFBoUVZ4TmJDT2tJeWh0aVRhQlhsT3p2MVZWWXl6Rnh2dzNSUVdVbStU?=
 =?utf-8?B?Rk00Ym9LeURtOG4zMnp6N3oxNk5EZGZzWmxYN0dtS0NZdC9Jb2k1MjVMcjJs?=
 =?utf-8?B?ZHV1SnpzOWdWU1VLOGcrS3RXejJCMmxZdHBDSFBveWYvUVVybjlXZkt2cWlh?=
 =?utf-8?B?OVZXTDlpajVoQjJwbUxGSE0yOXF4VnhnbmVmcVFCZmFEVVFHN3o0T3h6RVdI?=
 =?utf-8?B?cXFoY2NjVExDSG1id1JxQ3lTRHJISFdFU3d1UVlNYjIxdUNpdm5vbXFMNm1V?=
 =?utf-8?B?UDFaOHJrMUxGeFoyZmhNUmVyb1B4ZzRMMmwvRnFsYk9Hay9wa1VTOFVveE9Y?=
 =?utf-8?B?OE9CYUIvREVGaVRCTkNMUFhnaVdhaGduSm50K0Y5K0YxdFAvNCt0N2c4VkhC?=
 =?utf-8?B?SlRsaC9wVFIzajd4WXJsaUVKcGtoTG5zMytrM1BqNFBHWFp6eEVaSGFMTU84?=
 =?utf-8?B?SjlqQ3owcitiUytyTU5pQWZPdC80b1U2UThHMkQwTVZIdHZueVRraHhOTWRS?=
 =?utf-8?B?V1RaMkRUaElSWHkxdE9KTDlTbWFsd0VtN3B5Y3g5cFlLeGZSaDU4cHhsa3Ey?=
 =?utf-8?B?OHpUSDl4ZXF3UTh1Q0I0N01BakR3YndFRzhPekZLWUxXM0pub1VNTmkzY2hO?=
 =?utf-8?B?dHY3M0lKMzRYT1V1UHJQZk1tYU52RktHK2RLdkY3akt2V2FWMnROczdDa0tx?=
 =?utf-8?B?QzJYcDhYY2srdWs5aU50aHRwU1UzY2tYK3NzUHpZQi9FdkpYTjRzTTBQbytw?=
 =?utf-8?B?UlFJUmJiQlVaaHVlVXNETFlaOUpVc3ZwZ094QXAxeFlRSTFwTDB4VS9IVEYy?=
 =?utf-8?B?SE1HRnBiZUI5SVQ4eS9sWWdmV0FCUWJvVk1RMFgrckY5c0dtZVF4SGRCekpW?=
 =?utf-8?B?V3hCa2M1MXVCV3I3bFRscjJUMzhZRGJXZit6WmJJVEpiVGFZK0toTkJEczNa?=
 =?utf-8?B?eVk4TVVucU5mUkdMbHJ6MzRydnM5VGVlUWYrQnFiaWI4K2l1bEhqcW83NmdH?=
 =?utf-8?B?YU9HUlcxN1RhYjcyU014Z0ZuajlCT2lIc1pZTmdtbzE0bmFEdnpneUNWSDZ4?=
 =?utf-8?B?TmxSYW9QWEhFN1U1RjhzcXU1Q2tFdWRiWXFxZ0ZiVmU3SzhuSU1qWktWNmQ4?=
 =?utf-8?B?YWswdTB0c0tCdFBwdGl2eEs2SkVqYnRhVjllT2RodkZabHpKMDd0Rnl3c1Jw?=
 =?utf-8?B?VnA4ZTJiR1h1WjNpQmJsTlFNRFJNZ1E4VTRMQit1M24yc2daSUNUNFZzSDJ3?=
 =?utf-8?B?V3h2bUlpZ1Bmc1dHaGE4Y3RMc0FCZDVpWVMyZVM0VlVuSXNBeUZEeFo1NFZD?=
 =?utf-8?B?K1pDSExLVXZKL1RGaWd0Y2hQMHNnOUxsTzEzdTRZQjdtWTNqdUk0UUF4VlVq?=
 =?utf-8?B?K1dkYnRhUS8vTGROSXNzb0JKd1Q3czVTV1g4WEpHeXN4Umw0TFcwMHpPL0Qz?=
 =?utf-8?B?QTRmSjVaTVY4S085QTZTL0VFZzJKRXFPdC84Rk5VV0VhSGRpekFHUVM0dHdJ?=
 =?utf-8?B?MllCUWl2SlVRRFpCR3U3UkJFcVBibEF0a3p2N1psT09pZStRZHhzSU9CRjRV?=
 =?utf-8?B?T0EvT2pCdFN3MlRaREQrc015ME54LzZRNzBvNVF1R0RaTjloZUJNZFg5VjRm?=
 =?utf-8?B?WE9wUngyTHR1VCtxaEtEVjYxWW5uU0l2RjIzSmIwL2pITWYrUmR3ZzYvWVRx?=
 =?utf-8?B?b01xY1o2b0RrL0RYcE52WkZxam4zV3NoL1FUZFFiSnQ3eVdKaU9nRmgyN1Yx?=
 =?utf-8?B?RUZ2OThLWkhBZkt5dUV5UlJCRGh3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700013)(82310400026)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8CLeBzZs2LKX+SKeWpNYmSVzYw6zxcgTnn0wTEntXFJxNEkfhwN//UhLsgGikt+9D1QuHXTtunq731xXio9MidtrQ2XQuyB8we/7pg5TNaLlSYmSwwSzb/74WtbdGMTvG972neGpR5dMDZ56lsyCvlIyf+9FrwJwgQva6oWLgKdsdDQf/UBavQNI/bmTFdKjQJaoY6NaX/LCHc7Qh5FAkZAo1y6yG+Ooh9Mv8NrwIHPp1uRobAaPn6jItkvOwHB0Y3FFi4ZOeXBUm3c8kBJtElXmWVugcPmAKgLf7NN9OlGhAdFeHXKtyXI4PlnsWkwx4kGaz7yh1WQGFyMv2Ez1LQAJkWqLFssZysG4Bt7DQrykzCf+5lKTL4LXak9rlyjpUTNgAHhfLuz8vxSU9x5UHgztWMaa/3jApRCPSG8+E42P38SRBVY7X4ZbHH1q2S7C
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:43:52.8321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7657292c-8660-409b-10aa-08de6962d4b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11652
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,arm.com:mid,arm.com:dkim,arm.com:email];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 743BA123EF5
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiAxMSBGZWIgMjAyNiwgYXQgMTE6MDgsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gVHVlLCBGZWIgMywgMjAyNiBhdCA2OjM44oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gTUVNX1NIQVJFIGZhaWx1
cmVzIGluIGdldF9zaG1fcGFnZXMoKSBhcmUgc2lsZW50LCB3aGljaCBtYWtlcyBtYWxmb3JtZWQN
Cj4+IHJhbmdlcyBhbmQgcGFnZSBtYXBwaW5nIGZhaWx1cmVzIGhhcmQgdG8gZGlhZ25vc2UuDQo+
PiANCj4+IEFkZCBkZWJ1ZyBsb2dnaW5nIGZvciBwYWdlIHZhbGlkYXRpb24gZmFpbHVyZXM6DQo+
PiAtIGRlc2NyaXB0b3IgdmFsaWRhdGlvbiBmYWlsdXJlcyAodW5hbGlnbmVkLCByYW5nZSBzaG9y
dC9vdmVyZmxvdykNCj4+IC0gcGVyLXBhZ2UgbWFwcGluZyBmYWlsdXJlcyAodW5tYXBwZWQgR0ZO
LCB3cm9uZyBwMm0gdHlwZSkNCj4+IC0gYWRkcmVzcyBvdmVyZmxvdyBkZXRlY3Rpb24gaW4gcmFu
Z2Ugd2Fsa3MNCj4+IA0KPj4gUmF0ZWxpbWl0IHRlbXBvcmFyeSByZWNsYWltIGZhaWx1cmVzIGFu
ZCBsb2cgcGVybWFuZW50IHJlY2xhaW0gZmFpbHVyZXMNCj4+IGFzIGVycm9ycy4NCj4+IA0KPj4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBN
YXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0NCj4+IHhlbi9hcmNoL2Fy
bS90ZWUvZmZhX3NobS5jIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkN
Cj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3NobS5jIGIveGVuL2Fy
Y2gvYXJtL3RlZS9mZmFfc2htLmMNCj4+IGluZGV4IDkwNWE2NGUzZGIwMS4uODkxNjE3NTNlOTIy
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfc2htLmMNCj4+ICsrKyBiL3hl
bi9hcmNoL2FybS90ZWUvZmZhX3NobS5jDQo+PiBAQCAtMTY5LDYgKzE2OSwxMiBAQCBzdGF0aWMg
aW50MzJfdCBnZXRfc2htX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBmZmFfc2htX21l
bSAqc2htLA0KPj4gICAgIHVpbnQ2NF90IGFkZHI7DQo+PiAgICAgdWludDY0X3QgcGFnZV9jb3Vu
dDsNCj4+ICAgICB1aW50NjRfdCBnYWRkcjsNCj4+ICsgICAgaW50MzJfdCByZXQgPSBGRkFfUkVU
X09LOw0KPj4gKyAgICBjb25zdCBjaGFyICpyZWFzb24gPSBOVUxMOw0KPj4gKyAgICB1bnNpZ25l
ZCBpbnQgYmFkX3JnID0gMDsNCj4+ICsgICAgdW5zaWduZWQgaW50IGJhZF9wZyA9IDA7DQo+PiAr
ICAgIHVuc2lnbmVkIGxvbmcgYmFkX2FkZHIgPSAwOw0KPj4gKyAgICBwMm1fdHlwZV90IGJhZF90
ID0gcDJtX2ludmFsaWQ7DQo+PiANCj4+ICAgICBmb3IgKCBuID0gMDsgbiA8IHJhbmdlX2NvdW50
OyBuKysgKQ0KPj4gICAgIHsNCj4+IEBAIC0xNzYsMzQgKzE4Miw3OCBAQCBzdGF0aWMgaW50MzJf
dCBnZXRfc2htX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBmZmFfc2htX21lbSAqc2ht
LA0KPj4gICAgICAgICBhZGRyID0gQUNDRVNTX09OQ0UocmFuZ2Vbbl0uYWRkcmVzcyk7DQo+PiAN
Cj4+ICAgICAgICAgaWYgKCAhSVNfQUxJR05FRChhZGRyLCBGRkFfUEFHRV9TSVpFKSApDQo+PiAt
ICAgICAgICAgICAgcmV0dXJuIEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0KPj4gKyAgICAg
ICAgew0KPj4gKyAgICAgICAgICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0K
Pj4gKyAgICAgICAgICAgIHJlYXNvbiA9ICJ1bmFsaWduZWQiOw0KPj4gKyAgICAgICAgICAgIGJh
ZF9yZyA9IG47DQo+PiArICAgICAgICAgICAgYmFkX2FkZHIgPSAodW5zaWduZWQgbG9uZylhZGRy
Ow0KPj4gKyAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiANCj4gVGhlIGV4dHJhIGhlbHAgdmFyaWFi
bGVzIGNsdXR0ZXIgdGhlIGNvZGUsIGFuZCB0aGUgZGVidWcgbWVzc2FnZQ0KPiByZXF1aXJlcyBv
bmUgdG8gcmVhZCB0aGUgY29kZSB0byB1bmRlcnN0YW5kIGl0LiBJJ2QgcHJlZmVyIHNlcGFyYXRl
DQo+IHByaW50cyBmb3IgZWFjaCBlcnJvciBsb2NhdGlvbi4gRm9yIGV4YW1wbGU6DQo+IGdkcHJp
bnRrKFhFTkxPR19ERUJVRywgImZmYTogbWVtIHNoYXJlIHBhZ2VzIGludmFsaWQ6IHVuYWxpbmdl
ZCByYW5nZQ0KPiAldSBhZGRyZXNzICUjbHhcbiIsIC4uLikNCj4gcmV0dXJuIEZGQV9SRVRfSU5W
QUxJRF9QQVJBTUVURVJTOw0KPiANCj4gSXQgc2hvdWxkIHJlc3VsdCBpbiBmZXdlciBsaW5lcyBv
ZiBjb2RlIGFuZCBjbGVhcmVyIGRlYnVnIG1lc3NhZ2VzLg0KDQpZZXMgeW91IGFyZSByaWdodCwg
c2luZ2xlIHByaW50cyBvbiBlYWNoIGNhc2Ugd2lsbCBiZSBlYXNpZXIgdG8gZmluZCBhbmQNCnJl
c3VsdCBpbiBsZXNzIGNvZGUuIFRoaXMgd2FzIGEgYml0IHVzZWxlc3MuDQoNCkkgd2lsbCByZXdv
cmsgaXQgbGlrZSB0aGF0IGluIHYyIHdoaWNoIHdpbGwgYWxzbyByZW1vdmUgdG8gZ290byA6LSkN
Cg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo=

