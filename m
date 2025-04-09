Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EADBA822EE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943902.1342510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2T7E-0002Jk-II; Wed, 09 Apr 2025 10:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943902.1342510; Wed, 09 Apr 2025 10:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2T7E-0002II-FL; Wed, 09 Apr 2025 10:57:08 +0000
Received: by outflank-mailman (input) for mailman id 943902;
 Wed, 09 Apr 2025 10:57:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tnZY=W3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u2T7C-0002I9-Uz
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:57:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20622.outbound.protection.outlook.com
 [2a01:111:f403:2608::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fce845b-1531-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 12:57:05 +0200 (CEST)
Received: from DUZPR01CA0303.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::27) by GV1PR08MB10750.eurprd08.prod.outlook.com
 (2603:10a6:150:165::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 10:57:00 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::e8) by DUZPR01CA0303.outlook.office365.com
 (2603:10a6:10:4b7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Wed,
 9 Apr 2025 10:57:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13 via
 Frontend Transport; Wed, 9 Apr 2025 10:56:59 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DU0PR08MB7946.eurprd08.prod.outlook.com (2603:10a6:10:3ca::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.32; Wed, 9 Apr 2025 10:56:27 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 10:56:26 +0000
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
X-Inumbo-ID: 5fce845b-1531-11f0-9eab-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KHxHi91BtgNtNI1iHoEZ5TawvnLSRxlDS9mb5YF/i9O5jRFwVP9S905goXQKtW9Wrw7sAtiblqUW0RLSaeHowzPrHodwi4SEllj34E3iCBphVLyit7IeRFgkcnIqTGSHZdud07NXL0PTWz1GrNDFWElAftd8JT6rSAj4gdjLreeJ3ALhtPekob2t8d368qsOgh0LrSHZ6Z/dXvS8Ft711DTd+qrOmR/JAybrtyD7VP/2+BrLBzH2KtPVu6EvECORSFQkt8nTCuDo6eVNIBHk28vcZLq1P6J2uCM1MQ2cVFqyZuP9cy2UaCSZhFYV3xnzleECSZfpkcuvcCdGkWLrfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tggu0kKceMXHitowsjFTiqg5lD7rPQ5JchRwMuc6HRg=;
 b=q2vEWdfUsiQuXL3ik57BHt5UA8dzgM/mWRLg1UOgNUD6A6RZGpDf8Z3EU/GYCGAbZu0mcZvuLgJho+SHeWUBugflfxdSGmRS7NUw8rjGcv5Z0lCUDOXoNz7C6Qzyh2j8OHEdLTqC1agCzKTZUyvr6TYr9I3bzzNfdiahyZvYhdnXQ9aUuG9fltAHp46r4sCYZMBPru7Kfi4Nah15scnwbvQJE5giHMSI69Rfl+2I7b/Ezt6xyv84SJpGIEc53UINmu2BXQ1oIkx2XFv9FGX8rw+Jj893lhW9TKbTT2AzFwZLhplv0qEhCQdLw77DaJaJ1ZYwwjvLAabIIDmBEHLAwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tggu0kKceMXHitowsjFTiqg5lD7rPQ5JchRwMuc6HRg=;
 b=SnbOfnMCoMFegG6uVe33Hywy3m5fNFZqTo3EJbnSpa+yrAr971294KrquN+4Kcoq7hdtMSRPSoTI4BaBI3us79xWn94/wGMjvSlnbS1f4X6NCNlQ27kRRtalhaNmmsxvS0CSSBGk37rLbaTDUAzaxUENG1xpAGHJZmbxXYvqNtU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVv4Ix3g9Ummr1CHCkosGVJtrrk9ZG8GGExvVyqBYQPaDnZn7c1CntskDTTW5JPG8OCUa8J4hABQqZLkpWL9RL9aiq+N+42EernFnUKi84EOt04iIpEtGjL7jHfp8p/FGzo72q44VOannRkBYi2KYllqKyezGeZV1cy7/5URbokdybR7uzBPJKQgsR/x40TamV+grO7LK8DMcaB2bNXzQHqKP56uSRH1iFI7GvhfoGLVLv3YINpPnekXKxUu63Z09WVXuYzhXE2s9/48s4tPun8+NJUBfsq8mwS3ZIYwZWgTUyaSWfxfxwkez+XLJflfMWjs5WzfyipTI92zpIo9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tggu0kKceMXHitowsjFTiqg5lD7rPQ5JchRwMuc6HRg=;
 b=osjWreUU5rMq7LTh/AforoZKm0yjP4BXf94P7ZlzGgd1KD1ANtzMvIPd1NFcM95lPjtF1yDYmUWf/nR8ibiKhWxlEzZnKK9gtawVqlfNAVwxzZ8k2vXYfQAfI7cVZk1kRoe+2YWQwISevHCXdD3kFjIm6txs0AH7kgTHfefe0mzOf8ZRwu5LxROC2OrI862lghLLlCmXXFF8SSzMA5r3ffUhAv5zfOK0F/9k49tdNX5jlyeeVUfYia4pwTBMlXNmwkbkyxc1mybMxfsNn4LBsUcFixKq19sRC2+ZHcxklqcDNavcPLocfWJc/fBWwXjEKPMORFFTejHe0ZoMQPZZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tggu0kKceMXHitowsjFTiqg5lD7rPQ5JchRwMuc6HRg=;
 b=SnbOfnMCoMFegG6uVe33Hywy3m5fNFZqTo3EJbnSpa+yrAr971294KrquN+4Kcoq7hdtMSRPSoTI4BaBI3us79xWn94/wGMjvSlnbS1f4X6NCNlQ27kRRtalhaNmmsxvS0CSSBGk37rLbaTDUAzaxUENG1xpAGHJZmbxXYvqNtU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Thread-Topic: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from
 the C code
Thread-Index:
 AQHbp52Ro+Yg+pQClU+WnJSxei+hH7OZzl8AgAAHm4CAACKVAIAABC6AgAAEEwCAAPj6AIAACQkAgAAcT4CAAAO6gIAABy6AgAACqoA=
Date: Wed, 9 Apr 2025 10:56:26 +0000
Message-ID: <8EDDD953-857A-48B1-B0D8-B161DA9D5B33@arm.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-3-luca.fancellu@arm.com>
 <0acf63c0-267e-44c0-b629-fa576307497c@amd.com>
 <1AC85CBD-02B1-4AA4-B9A3-68DFC06137AA@arm.com>
 <4f860a56-5536-455b-9490-196bfc220556@amd.com>
 <40C7A4DC-0216-4981-A501-AFDA0E8671DD@arm.com>
 <9f637d98-c8f8-49e0-9f0a-002cdfefc296@amd.com>
 <EABA5C5E-4FE3-4E7A-8E29-B37A4CFCC18D@arm.com>
 <F2C6FC52-386A-4417-B592-151ECE079E52@arm.com>
 <aded1d6f-0e6f-4903-a5a3-127e06e3803f@amd.com>
 <C4B4B135-AF5D-4BA9-AD17-0C46868B7FFD@arm.com>
 <44944588-2225-4f77-9a89-1153630f900c@amd.com>
In-Reply-To: <44944588-2225-4f77-9a89-1153630f900c@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DU0PR08MB7946:EE_|DU6PEPF0000A7E0:EE_|GV1PR08MB10750:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b6fc86-c68d-4c1a-fa1f-08dd775540ce
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UWVMYTJHWVc2SEdheFdlbXR2bGkxaUxTN3p3QXFSMW1SNldFRkE3dmFjKzRV?=
 =?utf-8?B?cVYwVnFSOFp6TExhMVF1ZHVnTzFuRDhXWjBCQjVWSG1PT0diY0swa2lFc1B5?=
 =?utf-8?B?YXRNdEhZZ0x3L3BpclBRNjFybVMwOXRvSVVLTGZLdDdVZ2tpUUZ5akkzZGZS?=
 =?utf-8?B?VGhIOUlRbW5IdFlYWmd1dUNTS2pDb0VTVkdDQVV4QU5ya2V0Yk1VYjhZeVB2?=
 =?utf-8?B?VCsrUTNMaUtoMUlrUGhZblNGcVBRc0R0anVSb2RiUGcwbUR6OHRUOUZjeVVh?=
 =?utf-8?B?TnJCdkdBcG1jUFBjOHlodFRiUFBJMUZZQWRoVU5OL3l2VXBXdDdwNURrWFZT?=
 =?utf-8?B?bjZ1ellkOFo0VXBrQ0J3Q0c3SXAvbkNsaFh1WUNHVUJycnlQQkVIOUJVWXIx?=
 =?utf-8?B?UHhlV3BnaVd6N3YxMi9Wb2hrSGNnRDZ3aUdoYjVwaUM4UVNOZVJpeU8yRzFX?=
 =?utf-8?B?UittLzQrR0pjKzkxVUZVZnlIMEdzUEhLMkpHYk1EenZkSTZpRW1XU25CdzVr?=
 =?utf-8?B?RWsvd2VTbUM1TTFzV0RhU0NyQkx5eHo1RFRiRTJyS3ZvYWdQeUhpa296eWZ3?=
 =?utf-8?B?bUlic09zN0pmK1BDb1dEU1BzVjhNNzZwMUZUVmVlcjhodkRoeDFzR1J5OTZF?=
 =?utf-8?B?YWpvOU1MTmttdDhjOTdrWi9RUHRlQmwyUzdYamg2aTlEbzhxMC8vLzJYVWl4?=
 =?utf-8?B?bUlKRURuODM2WnBKSmFocEFrN0lTSXU0NW9kYWhXcFJMdmM4STN2T3N3WEgr?=
 =?utf-8?B?WDRyYUx3ejE1WCtFV2JHdWdnWkl3akxTb3BhcVZLNXpGeCt6MVNoM21mNkJj?=
 =?utf-8?B?RkcrVnVpSDAyTHByUVJtR0t2bzVxd3hNSHlUVi8vQkxzU0ZadldiaW9IWDlP?=
 =?utf-8?B?SlY4SVFJbXo0SUtFNE13K2xFRmJWZmE3TitXSmVVMlpFL2R0RVcyb1I5ckxa?=
 =?utf-8?B?QmthanhDSE9wcGIzN0F6b3RCTXduRUxHR3pUSmQrZTNTbE1TOUphc3dIUFpw?=
 =?utf-8?B?QWoyTkdWM0Uvc0RoZjJ4TmlDOUR5UzBiUUxXZmowelp3WUtlV2JNRUNQbXRx?=
 =?utf-8?B?ZWdNVEVxTmN4S1NNKzYxUnhWZ0JDME4wSjIvRXVyZVVXVmhjUDhqR3lxTzg0?=
 =?utf-8?B?YmYrK29UQ1UyWGltMU9Bay8raEgweHJTVWVHQU55WklLZFJUVnZnMUthMkZ6?=
 =?utf-8?B?MmdGQmZ4Tm5uV1NmRnlmeGgwdGgxM2JLZzVJRWZ4TGVaY21GaXYwZDB5dFRR?=
 =?utf-8?B?Rjc5Q0lBRWdDUFAwSTA4R1A4Y1FuQ1VpVGEvUWZQQ085a1BXZ25scUdHaXdJ?=
 =?utf-8?B?dDIxNG9FcSs3QkJiUWFCNkh4WDFmWHVHWUNYa3hZQzg4bWYrdEM5YTdNa0RD?=
 =?utf-8?B?UFhQYVA3RjdZR0ZLNUJUVXh0aCtKWHR2VW02V2N2cWdOb2p4VG45MTlWZkhB?=
 =?utf-8?B?T2ZLTGJseHZZZXJ3MHRhSng2RkFmbHVaS3hoVGtXbkk2RGVnMTVwb2JwSGdJ?=
 =?utf-8?B?blpkK0xMdndFYWt0enpYcUF1S0luUFQxVlg4TzRIdzFKTHlQRk1xT2hybXhh?=
 =?utf-8?B?ang5SjhmdW5UUUViUlh6Qi9vQjd5QXAyK3VaK0JXbzd5WnNLWDZSZEV4SnF6?=
 =?utf-8?B?eXJQTVZjei8yRngvNUZXY0prSDRjM3V6d2wzbS9yNWdUTWtTbmVPMUNjQ0Z2?=
 =?utf-8?B?WGpNUGVWUEpGcm85Wktmam01Ym1ZVm5ibklDeVVRaHdGL2dsdUF5eElSdDdF?=
 =?utf-8?B?a3NRa3Naamk3Y1poR1lHSUxOM3hNWnVnU0pYUlExZERrTGFObkRWU1pmRnJT?=
 =?utf-8?B?VVRRbWhMdHJ6NWZuN1M0MFBld2Z3K1dNU1ZRSmhoT1BXWllMR2VWSTFOeXhw?=
 =?utf-8?B?WHo2V1E1VmdiREg2ME5jazVPN2tHcE1lejE4Wk1CNnBiYmR4eldTUWdBR1FP?=
 =?utf-8?Q?5vOxTeMeLt/WCFUtE3mMCOrL6+Su+u5p?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BF1669C90A13845964D1F904A01D647@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7946
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4478504b-efa1-4645-679e-08dd77552cd6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|14060799003|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ri9CbENiSTZJM2RtMXlLQTU1QUhOcE5va1FDRmczelB4QnA5b0gvZTVWZmxu?=
 =?utf-8?B?a3AweU1xdVg3RGVTRmlTN1pLd3Q3Rk54bWNmb3c5bjk1MThOUXRzMVlMdEkx?=
 =?utf-8?B?YjBaZWVKcm1wV01TQlp4SGxVcCtiMC9hZVFxRThhaVp5eFpqM2UyUk93Wk1v?=
 =?utf-8?B?SEh0ZmM0MVpOWTh0Z3hWNTJFellSQm1vUjkwaGY4dkZ6SWdYUzNIaTZBeGdr?=
 =?utf-8?B?Mk9YN3JEVXArLzVwbVlNZUdhV1pkVEFtbXBMcktERE5HTWdXK0M1YzRBdmpR?=
 =?utf-8?B?T29PWWNZbnFLZVlFRjg0S0pDU3lSY2FDMTlCNGhDM1QwbVlZRjZCVUs2TVA4?=
 =?utf-8?B?QTRRbjdab3U3R2JqbTkzVmNtYTc3UXMxRWFkL3IyQ1J5TWZXc3dzTjlYTWZJ?=
 =?utf-8?B?YTdLeEV6ckF2ZFR5dnNhTUl6K0dRSTkzYjI0eDZBTmNRaXF1d3dLNWNmTDBP?=
 =?utf-8?B?MWJBWDRXZU1Nei8xMnZVTnNwWFovMVlEdzJyOUtubE43WVFiSFFlUkhIUS81?=
 =?utf-8?B?Y1ZEdEVQZHY3VFYrbERkQnlSMTN3UzJSQ2RPTlppWm1QZlZhVlp1TWFLdjJR?=
 =?utf-8?B?UXpVUW0welFkZlJmcHhNd0YwM2pkT1FDN1VZYmQwbHRHeWxRR3ZaT0h6akty?=
 =?utf-8?B?YUdPUTR0bys0Uzh2Y1Bsbm0ybzcwVkd4RFkvaUoyTkV5aHdhSUFUMTB5TXVr?=
 =?utf-8?B?YWNJTGFlc1BrRitHL3RNRStwVnMyeGtBUmRXdENITEFUbnFGNGZzMWhIOXRa?=
 =?utf-8?B?dkNLajRGcXJnakRNbnJUT0JoMmJHbGFpQkRHN1lPZHltajFBSE5TVlVIbkNk?=
 =?utf-8?B?dnJ1WmFDQlB3MnhkbVpZMllWVWVUaHRuZmExT1p4T2d5MElXM3RBOHVKQUg0?=
 =?utf-8?B?aDgwUlI3eVBpU0J0ZWNUdGUzRi9nMzM1aFZ4YVk1VTZ1ZTI5THhsUU9Pa3hF?=
 =?utf-8?B?NitRZEFzYzdyaU1tcy92T3ZucS9RM2VnWHVZQWQzdjg0M1ZMT0dOMUdkK0tj?=
 =?utf-8?B?cXBoTFlFN3FQMFV3V2IzeDlndDYzZ0MralJXcVZrRnljT3pjejZPREh2RmpM?=
 =?utf-8?B?R29qRStxRCtEdzMrT2RGbTE2V2ppbG8ySFlZS2ptVy80UFRvSnlZdjd6UUFC?=
 =?utf-8?B?WHIzNmNTVUtpa0x0ZnMrdk42RDlyMnVPUGIxZEtzM011bW1SMThhbHNSYXps?=
 =?utf-8?B?bDFybGt0WHlvYlpnSGRkbDRueElXU3R1ZVpMa2dabTMvQzREbHlqWXVWMUpG?=
 =?utf-8?B?bitnZ1BZVlVnaSsrOWNvclJyTGhnc3FzdlMwblBzejNMSXJwcTFyTW1BWjhU?=
 =?utf-8?B?NHVlRHE3WFFwaE1PNDIwUU9VVVFvZlBTYW9RK0FPRVdYSFZySGV1VTFvTzFM?=
 =?utf-8?B?Wlhla0tlTGZ5SXVaNDVuQ0xmVGFhdXQ5WXY2djZaK2QzZkZDaGdUUTdUZHlW?=
 =?utf-8?B?RGVQZXJUcklrQTlhek5CWmV0Rk8rU3JEOWU3a01mVWVJa1lTWlRnTGRBOXJ1?=
 =?utf-8?B?eEd5M1pJLzN5SjhhSTMyTTZIOEVaNHFLQ0xZUVAvMnV5SEV5eVhuYmhUcE1G?=
 =?utf-8?B?TExCVlhJcFZxK3QwRGlpQm54N1pYbDc1a0VqYjlla2J1M0M0Vk5uaVQ0Vno4?=
 =?utf-8?B?cE9PaThHaVRQMjY3aGJGdG9ZT29CQXpmUE9TZFFwaEtQNmx5SUMzQ1BxSFZq?=
 =?utf-8?B?b2lsWC9JQU5ZL3RZUldHWnN2YVN0QlBiYnNBbVdaNlFxNzBSWG80TVRwV05C?=
 =?utf-8?B?OUFhUlYzczJ3VkQzQVNTNVdhTGhTRkxkZTQvWWhaNkhyd3lTOS9qZTJYcERx?=
 =?utf-8?B?L2hKalVabm1RcmtLbFl5a2M0elhjcm0rbEcvT2o1Wk8xYXlNY0dtaTBLWEVq?=
 =?utf-8?B?emZ6cWtkdEpzRmtOYWtQK2xsdzJzMXRKUG1FNWx4UUR6YWExbXQwdDVJQ3Y5?=
 =?utf-8?B?ZDNPNHpzWTFnV2F6UnJzYytRdmtNSG04aE1sdDcwM0NFeGJSQklMRDA4WHg2?=
 =?utf-8?Q?4neHWVOkUQ/aeZlivO9nl3/O4Kap60=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(14060799003)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 10:56:59.8616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b6fc86-c68d-4c1a-fa1f-08dd775540ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10750

SGkgQXlhbiwNCg0KPiBPbiA5IEFwciAyMDI1LCBhdCAxMTo0NiwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW5rdW1hQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IE9uIDA5LzA0LzIwMjUgMTE6MjEs
IEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBIaSBBeWFuLA0KPiBIaSwNCj4+IA0KPj4+IE9uIDkg
QXByIDIwMjUsIGF0IDExOjA3LCBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbmt1bWFAYW1kLmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gT24gMDkvMDQvMjAyNSAwOToyNiwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4gSGkgQXlhbiwNCj4+PiBIaSBMdWNhLA0KPj4+Pj4+PiBUaGUgcG9pbnQg
b2YgdGhlIGNvZGUgd2FzIHRvIGRvbuKAmXQgaXNzdWUgYW4gaXNiKCkgZXZlcnkgdGltZSB3ZSBj
aGFuZ2UgdGhlIHNlbGVjdG9yLA0KPj4+Pj4+PiBvZiBjb3Vyc2UgdGhlIGNvZGUgd291bGQgYmUg
ZWFzaWVyIG90aGVyd2lzZSwgYnV0IGRvIHdlIHdhbnQgdG8gZG8gdGhhdD8NCj4+Pj4+PiBOb3Qg
c3VyZSBpZiBpdCBpcyBiZW5lZmljaWFsIGFzIHlvdSB3b3VsZCBuZWVkIHRvIHVzZSBpc2IoKSBm
cm9tIHJlZ2lvbjE2IG9ud2FyZHMuDQo+Pj4+PiBUaGUgaXNiKCkgaXMgaXNzdWVkIG9ubHkgd2hl
biBjaGFuZ2luZyB0aGUgc2VsZWN0b3IsIHNvIHdoZW4geW91IGdvIGZyb20gcmVhZGluZy93cml0
aW5nIHJlZ2lvbnMNCj4+Pj4+IGZyb20gMC0xNSB0byAxNi0zMSBmb3IgZXhhbXBsZSwgb2YgY291
cnNlIHRoZXJlIGlzIGEgY2FzZSB0aGF0IGlmIHlvdSBjb250aW51b3VzbHkgd3JpdGUgb24gcmVn
aW9uIDE1DQo+Pj4+PiBhbmQgMTYgeW91IHdvdWxkIGhhdmUgdG8gYWx3YXlzIGNoYW5nZSB0aGUg
c2VsZWN0b3IsIGJ1dCBpdOKAmXMgdGhlIGxlc3MgaW1wYWN0IHdlIGNvdWxkIGhhdmUuDQo+Pj4+
PiANCj4+Pj4+IGFybXY4LVIgaXMgZXZlbiBiZXR0ZXIgc2luY2UgaXTigJlzIGFibGUgdG8gYWRk
cmVzcyByZWdpb25zIGZyb20gMCB0byAyMyB3aXRob3V0IGZsdXNoaW5nIHRoZSBwaXBlbGluZSwN
Cj4+Pj4gICAgICAgICAgICAgICAgICBe4oCUIGFhcmNoMzIgOikNCj4+PiBDYW4geW91IHBvaW50
IG1lIHRvIHRoZSBkb2N1bWVudCB3aGVyZSB5b3UgZ290IHRoaXMgaW5mbyA/DQo+PiB3YXMgcmVm
ZXJyaW5nIHRvIHRoZSByNTIsIG9mIGNvdXJzZSB5b3UgYXJlIG1vcmUga25vd2xlZGdlYWJsZSBv
biB0aGUgYXJtdjgtciBhYXJjaDMyIHBhcnQsIHNvIC4uLg0KPiBJZiB5b3UgY2FuIHBvaW50IG1l
IHRvIHRoZSBwYWdlIGFuZCBzZWN0aW9uIHdpdGhpbiBSNTIgVFJNLCBJIGNhbiB0YWtlIGEgbG9v
ayB0byBzZWUgaWYgSSBtaXNzZWQgc29tZXRoaW5nICh3aGljaCBpc24ndCBzdXByaXNpbmcgYXMg
dGhlIGRvY3MgYXJlIGh1Z2UgOikpDQoNCkFybcKuIENvcnRleMKuLVI1MiBQcm9jZXNzb3IgVFJN
LCByMXAxLCA4LjUgTVBVIFJlZ2lzdGVyIHN1bW1hcnksIEkgY2FuIHNlZSBIUFJCQVIgZ29pbmcg
ZnJvbSAwIHRvIDI0IChzbyBJIHdhcyB3cm9uZyBhYm92ZSwgdGhlcmUgc2hvdWxkIGJlIDI1IHJl
Z2lvbnM/KS4NCkFueXdheSB3ZSBzaG91bGQgZm9sbG93IHRoZSBhcm12OC1yIGFhcmNoMzIgc3Bl
Y3MgaGVyZSBhcyB5b3UgbWVudGlvbmVkIGJlZm9yZSwgc28gbWF4IDMyIHJlZ2lvbi4gQW55d2F5
IHlvdSBhcmUgdGhlIGRldmVsb3BlciBvZiB0aGUgYXJtMzIgY29kZSBzbyBJ4oCZbQ0Kb2sgd2l0
aCB5b3VyIGNob2ljZXMhDQoNCkNoZWVycywNCkx1Y2ENCg0K

