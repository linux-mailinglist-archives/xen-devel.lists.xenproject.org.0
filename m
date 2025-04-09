Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB7A81EBE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 09:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943573.1342274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2QGu-0004KX-IM; Wed, 09 Apr 2025 07:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943573.1342274; Wed, 09 Apr 2025 07:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2QGu-0004HM-Dl; Wed, 09 Apr 2025 07:54:56 +0000
Received: by outflank-mailman (input) for mailman id 943573;
 Wed, 09 Apr 2025 07:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tnZY=W3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u2QGs-0004HG-QJ
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 07:54:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2612::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea1ad738-1517-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 09:54:52 +0200 (CEST)
Received: from DUZPR01CA0126.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::20) by PAVPR08MB9652.eurprd08.prod.outlook.com
 (2603:10a6:102:31c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 07:54:48 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::58) by DUZPR01CA0126.outlook.office365.com
 (2603:10a6:10:4bc::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.37 via Frontend Transport; Wed,
 9 Apr 2025 07:54:48 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 9 Apr 2025 07:54:47 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DU0PR08MB8977.eurprd08.prod.outlook.com (2603:10a6:10:465::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.22; Wed, 9 Apr 2025 07:54:12 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 07:54:11 +0000
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
X-Inumbo-ID: ea1ad738-1517-11f0-9eaa-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Qfn7XC3b0BFXcSddi2UMcTsyNc159OBurCJZ7grgcGSWdJmNF+cIMvnqL6XV+4XMQKqi8HnkqGsEjC1pAJmPJxU7g49Bon/P1Hs8pA37wexEhuaWj5CCzPC3yRNa+1AOh4qys2doHCAJRLJlS92dDhe0o4k+GgSyU+UmQCcBls1NJhnoxpepxTyx1YMb9RX+UVjoUav1ASHl0vyKRCn61ARwmGIcM7JifvBk7c4x4i+mO64uagds3Zl7MSRDGxgFmpJVWR/otm/GUCpVeVYuKbCHFQHsYkHk+pBHIwm8IQGAQwFdoDP3pB1g4jA2qailUHAt4xLxMItNd7JfXScsHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zsaal9L25uUxHpERlxbTPux5iK2s4rvNpXwrJvwKmI=;
 b=Xx2cycTsVfuuSAFEjgsNs3zmbXWFu9QsagsxlMMbWyj06r4TNg9m1K4VSoFMOSgE8jBOq3isLUlQ3g8TzP7Y5KWk9m1EbLD5eC44S0sJGvidT++2raKVTsgTqL8WuvZe6JuCi+5EKEgPcp4XCOhlwFpTLCPw5SEcZOS1jyPckPolGleAC2eaktwhygchwxgB6VWgLBdDLn7N187JwsULLvAKKoCC1Egn0ogF2vUfbIIgkxPQfuqNg/vHEcDq9bUVDgbp6KT/5xQ4l1CRALa1Giz1U4a/gy2wgkYIpbl3MtqsLf45tzZXK8uGr9s/Ozc2App7bk1XFstgEQNtVQt9rg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=permerror (sender ip
 is 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zsaal9L25uUxHpERlxbTPux5iK2s4rvNpXwrJvwKmI=;
 b=C6R1bsI40PKXZ4vis30aJtGb1ouDIZYFDy6WaNTOqME/YUP+b4lfMss1+IodQnlr0mj6bdIWb6m7hOryWqkU3nL0LpKHCYt7EOWrZdgUY1Zx3qejrcHt7Ch5UDqIZwQB+TWtpCB72NPweSQdE9LHSgWXMgs+B+2w6t80G4rRMO8=
X-MS-Exchange-Authentication-Results: spf=permerror (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: PermError (protection.outlook.com: domain of arm.com used an
 invalid SPF mechanism)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pan0q+QRfo6DksvDTw7bPutPOQgnlhGKd7Vsv0D65MIE/Nqgn7r13o8nlTvPYp65hkFO2jVtWtaMbzyAY1itfkuk1JK5SgY/sch0ENMVmh0iU9lMwZKZtqxxWiRFlswb6+66cRsaf/Uj5M7f7HOqFJuqWMF76OWFZ8j/DpSP6at7ZlCetaf6HDKTgVx9i2s3TQq2oO0A1/Qa3FE0opnXaWKL0pzd4K4pdE4aBDq9Dc3YH/lRSkBCoJMBYvMPI1wxj4HSLebl3kq2CNthcXUywT+PzJmQ9TR43o8u619uVZMIq6lNGlKHyonN/ag/CScBw0x2xJLQY5vE+DcEUF7b7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zsaal9L25uUxHpERlxbTPux5iK2s4rvNpXwrJvwKmI=;
 b=J6pjVJsUutbbX9INRD5TQuz5PRnj6nelni5XJMB8Cr/9TAycKflTCE6nGMqYRORZcFLswvY9Rrk+IDWQeD/IE+Z/qihrgdBca9VxvzzaZvf+tEAnxl1DV+Gd82xwP5IJDhnOxILtubDRyzZ/l9flEwQoiLOtEP8T7Nxc9CeptuCgAhkk9Tsih4RtiWZ3b2m4Lc35hKwFrucSsXwgwYcO2UV/pBsG9is8eax8OjC0kOE2hYJ+AWdI2Cx309PkOvutlstN3zHctDtp135GMSQSVtufrdEcqvASG+uowoc12MvEnQ45pV9oWZjoxNo8cKzqps6ZIKcN4G0/wxSjKh0FPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zsaal9L25uUxHpERlxbTPux5iK2s4rvNpXwrJvwKmI=;
 b=C6R1bsI40PKXZ4vis30aJtGb1ouDIZYFDy6WaNTOqME/YUP+b4lfMss1+IodQnlr0mj6bdIWb6m7hOryWqkU3nL0LpKHCYt7EOWrZdgUY1Zx3qejrcHt7Ch5UDqIZwQB+TWtpCB72NPweSQdE9LHSgWXMgs+B+2w6t80G4rRMO8=
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
 AQHbp52Ro+Yg+pQClU+WnJSxei+hH7OZzl8AgAAHm4CAACKVAIAABC6AgAAEEwCAAPj6AA==
Date: Wed, 9 Apr 2025 07:54:11 +0000
Message-ID: <EABA5C5E-4FE3-4E7A-8E29-B37A4CFCC18D@arm.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-3-luca.fancellu@arm.com>
 <0acf63c0-267e-44c0-b629-fa576307497c@amd.com>
 <1AC85CBD-02B1-4AA4-B9A3-68DFC06137AA@arm.com>
 <4f860a56-5536-455b-9490-196bfc220556@amd.com>
 <40C7A4DC-0216-4981-A501-AFDA0E8671DD@arm.com>
 <9f637d98-c8f8-49e0-9f0a-002cdfefc296@amd.com>
In-Reply-To: <9f637d98-c8f8-49e0-9f0a-002cdfefc296@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DU0PR08MB8977:EE_|DB1PEPF000509E2:EE_|PAVPR08MB9652:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d1604b-feb3-4dd5-d7e2-08dd773bccc8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?KzhTazVWei9UWHdOUSs3TmZVakVPQVRMeHEzZEp5QzNpeHRlRUtUbGE5T1py?=
 =?utf-8?B?eU5rTE1OQ2FaVmd2RlJEMlhpL3hiMWpGanJHTHhHdG5tVVJuYkN4Ymk2RkdU?=
 =?utf-8?B?UWl2YUd6VktrV2tsL0hDcXhBRkhqMlRUOUN5TTZucTR4aHZjMHVabVFXMjUy?=
 =?utf-8?B?VkJTVjU4M0lJYSsvUEZrcGNwTnpqUVJXMTlRbjFsYitpbEdLQjJVc054djZ6?=
 =?utf-8?B?enNvNzV1ZGNrY3E0L0VFNmpVZjhFNlpxYkR5WWN5aVFWeDVaTldpWlhFNzB3?=
 =?utf-8?B?OVMxMyt2OHpvR1RGRUk4RTlHeEJ0S2Y3NmNPS1B5VUZ3c25mb3JjR2ZibVN0?=
 =?utf-8?B?TmVpODIveGlHMnJBRTV2cnJPQ29ia2d4SXJPTFAvTi8za1VpNzJETmdYSHdI?=
 =?utf-8?B?eVJud3FNUExCaTZUb1F3R0pFQ0kxZExQQWFiTUZQSlJud3diNkhSSElCQVRM?=
 =?utf-8?B?QUlNS0xxRGcvRHZSZWxjRk50WGVFV3hlQ1h4eFFPU3BML3lKMFQ0QTFCZEZs?=
 =?utf-8?B?WGdyZmJNZUxNNk14eTBmaUFRM2RTQmlHb2VsTG5xOTVLNzNzOXFwZnRCVVVM?=
 =?utf-8?B?VXFhcEZrLzhNWmxUNlJCUjVJSGd6MlVORXE4VXRyOXZYaFdGOENvNzM1dGhN?=
 =?utf-8?B?V09nYUZCVW5Ca0o3VFJyR0Z2bERka3hxZ1ZndDk4UUR0ZndGKzlJbUFUMjFX?=
 =?utf-8?B?aldONUt3bDhpQm40YzE1U2ZqZTJaeTdGUUFPTWUrK2tkb1orMDFURDdkQVVv?=
 =?utf-8?B?d0lIMUk1c09DS0tCQnhrTnVpMUM2NjN3cmQvK2ZjZ01VdWpFYTJzNW9IZDIy?=
 =?utf-8?B?cFlKYlBCQ3BYZkN0TnptVXBTQnNkcExXTHA3VkVLRjZXVndzQnhtMm94aCtj?=
 =?utf-8?B?S0NhNTBtRFBLY2IzUUpMdkdReENURTNFbGVXNTJTcGNrWC9GbXg5RmdrWGpT?=
 =?utf-8?B?NUYrVWREL05iaWVHemdOeXpQcHQ3ZjQ0RFd2cW9lbnNueWVuZzU5cVBoNjhF?=
 =?utf-8?B?TzlUTkNoUWp6SzI0aHptbjhvbjdOc1ZnaC9hdEoxV1UwSjk3d0FvejFCWGJk?=
 =?utf-8?B?ZXVMTXdtMTB6WHpzcHlVM0lNc0RMMkFNQ3hqVzJwZ1ZZT05IZ29lWkpYek5k?=
 =?utf-8?B?Zzl5aGhQSEVlLzR2M2RWRUtPY1R4ajhvMVdQeXBoeXprdFh1aUd4NFpqcTdJ?=
 =?utf-8?B?VUtyc2piVmNOdi92bk1rQ3o4SDFvdHpiV2RqbWFBQ2xUOGFOOUYweENHazM5?=
 =?utf-8?B?Y1RXZUttVWpDb09nWm5uT0lOQ3NrTXU0YURJMXc1SUxmRjU0dlVVMk9TdWpF?=
 =?utf-8?B?RHhiVXJwbGdIeklEUGhzcmc3d05QWmg5TkhOcmxyeEU2SUNPaVdmV3h2Qndz?=
 =?utf-8?B?eGJoMEorSkpDM21BTUoxOFRkZkJ0OXg3WFpkcFRlbklyUHlIK05KMVBpbDhM?=
 =?utf-8?B?dDBVSHlWb082WTFyZzAzTVd4NFJ0RFlRSzg2Sm1ucEM0N2FYdC9oMEpxV011?=
 =?utf-8?B?dkN2Z3U3eGd0ZFVXMkYxMCs1THJqY0NrWHRKMExVMmdQbllSbHI5VnRWS2Rq?=
 =?utf-8?B?RFZ3Nkh0ajdGdTh0cmpvK0dxZW1XbXIxd3duZE9RVElIV05GSXZQVHAxRC9P?=
 =?utf-8?B?WTdtWWNpdU5WbHhVSU02Y3BKa2xkZ1pOQld0cFdZNUtEL29xUmFRRkhMZWl0?=
 =?utf-8?B?WXdLUENYNk1jMk41MmVta0Y4U1BXWWNFc2hsOXAwQ3NoTENRcHowMzFSWTBC?=
 =?utf-8?B?T3UvTG83b201UXpGczk2VzlYVHlMekFNUURXMTBBMzQrVXhtcGRrQXk5VVpn?=
 =?utf-8?B?alJVZjB4MTRXZ3krbjFLK0RLWndMbk5CSG8zd1d1ZFlXMDJvTXNsNm02Vlcy?=
 =?utf-8?B?M3VhWnlZTzBRMnEwRVBTa2NEbE42aTBqOWYvejNneUt1cWhyd2JycElmNURl?=
 =?utf-8?B?MmF1U3ozcTZBaWE0TkI5UmNTVmlPemg4Ujl6TTVoLzdXY2xHTVJ2VVM1VjZM?=
 =?utf-8?B?VkU1YVlibHB3PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5759E42EE76FC548A5AE4FE120E12F44@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8977
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5919ca36-dccf-4b61-3df1-08dd773bb6ff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|35042699022|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHh4elZ5STg5QkdLN3QyU09OT0ZHYm1aYlNHTTBINzB2aVlwOTMzNDFNc1RY?=
 =?utf-8?B?TGFmcmNLRVdlRVc3N2dwbzBCeW9DdDJUMG1lbnYyR2w1a2lVRnZkOEt1TWNY?=
 =?utf-8?B?ZlAyd3c1WFN3c21kenZKaG9hd05wZkJ5WEF0S3pNeXlrWHB3M1h6RWp3elNn?=
 =?utf-8?B?Lzk4SVgxSTFaM0tDL1ZSQjdBaFJpM1RkVE9yaHBpdG1qbDlHTzQ1UEtkdHR5?=
 =?utf-8?B?R1RkczZQaWU2bjlrcllCM2dxTG44NEV0TzM1Z2NDekNUNngybUlpa0d6MmRx?=
 =?utf-8?B?OFVHTWpzYWEyeEZCQU5MT3VlTDJTUEFMc3Mwam1vK0hxNFVCWjZoeWYwN3pv?=
 =?utf-8?B?U05pM1FyRG5LNlJiWVUxZTlneEJDeTlLVXVKYjhUeDY3aFU1RHpNUWs3TmpQ?=
 =?utf-8?B?NDdnc1dFeXhnVGpHbzhLdW5FZnl0OU1KMnBLZTMzeHZWSFhRbVdhSjNEazFJ?=
 =?utf-8?B?L1FWcHpLWFM0TDI5R2o2U0lWUmFUVDZMblYzdnhGZExhS1ZPNFlOMkhZQWFq?=
 =?utf-8?B?R2p5MXZaSnMyTGg1am56WWJYRUFEVXNrSmpCbWN1TUZRbCsvZGlheU5ldTN6?=
 =?utf-8?B?SUxyWjczMCtRVFRkVFQ4YWVIMXV3SmRER1I1TGZWeVBsbmcvSXhoZkphajdM?=
 =?utf-8?B?enByMVMra0lnclNDaDFRZDJ3MmNGSTk1cTJHUDFkMnNEMmJ0QjM1YXNWOFFH?=
 =?utf-8?B?T2pkS3NaWnh0c1I3MHVyKzZaMjkyMDdWL3hJMFZBcUhIbnIrNUEyc1YrZE1C?=
 =?utf-8?B?eTdleWxzTVd1eHlCejMrc2drbDZ6dE51K1hTMUM3SDIwMkxUNVp2WVBQYjZL?=
 =?utf-8?B?L3lWdmtJQkFMYzJlVlhrbFZPT1NMWUdvaDhobTk2L3hGRUNUNTNXeTgvbyt1?=
 =?utf-8?B?TFMyMGhqUDVUaG00MDlnakc0cjdkZFExTkIweTFGblBucllrUFhxQXltUlhI?=
 =?utf-8?B?ci9IRXl1U2k2RG40RHBnN1NlMUx6cWZiaDZDSUFWc1V4NG9QeHNOSWhJbStF?=
 =?utf-8?B?SzErQTQzMFlDT0dWd0g3WFpzYUovajB5aEFzeC9ib3NTWVRKa2ZhL2wyVytv?=
 =?utf-8?B?aHBVc1dleVN4cTcxQ2ZWZnRrV1htajd4UnZpMFZnUk90cU12VUd2dWo2OThK?=
 =?utf-8?B?ZFFSM2ZxWXlEd2hiL2tZMlE0V01QQkdrcE9mYmp5OEVKcFQ4dWh5ZEIyWVpt?=
 =?utf-8?B?NnM0aXl5cUp4Y2cyVzBYaW43QmRXeS92WWtKSTJ3VkRUVzdXM0ZXOVFNSEVU?=
 =?utf-8?B?Unp5N3JzRzFOM2UxdHdrNjdvT2UxQ0tJeHNiZjUrcW80cXZoSzRJMG5KOHcv?=
 =?utf-8?B?aTAxakp3am9LL1gwdERvUVM0NFpsZ2diYmV5M0kxenFqZXVGdytPZytXa2JZ?=
 =?utf-8?B?VGNYekZCbVNMV2phNDJBZ0lkdWJEYjdESm5hdXBYUXhUbWo5OWZJT1VwZW0r?=
 =?utf-8?B?emhVaWMyTkpIRGxHWDdtcDZhREJhcHlsOTVSSm1DSUNXeUxqaHBBN2VJayt0?=
 =?utf-8?B?b3dDZGpPbFB1QWJSL3MxWUJCa1NvSm9YN3llRm9HR2QvZWROenJwSkZGT0hD?=
 =?utf-8?B?TGRHNDFsZnlNVHhuZFZtYjc1N1BOTFgwbUQ4S1JmMHAzNXR2ZjZBWDg0ekJ5?=
 =?utf-8?B?Qm05cjIrWlg2VmtQVU9uWmtocFRRcytEb2Z1bVJ5UjdUSk9haGVrVXJHT2s0?=
 =?utf-8?B?YUtqV2FuUk84WGRSYjZZRXRXSHpWTFBaa1pQZnI3d1VkeFcrU05WSW83WjMv?=
 =?utf-8?B?eTdNK1ZWMFo5OGlqL3hvN2U0QjdBbk9odnU3eml2VnNLNWlkUDkveU9najB1?=
 =?utf-8?B?UGpDYi9ScTNyTG81eHdVOGVQNkN4S09TSWJWUitZYnRxTFpTYjZHam5ETmRZ?=
 =?utf-8?B?YUY4QS8xZGtycEFyRUhjRlk5aVhHR2NMdVNJTnp1bkJ2d1p3S3grVGVEd1U0?=
 =?utf-8?B?dytHaXdpOTRNSk9YQlZ2TVI4UVNEZUw0K3ljZ1BMbWFGVkdIMXEzOGZBTyta?=
 =?utf-8?B?RHNCZk84T2xBPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(35042699022)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:54:47.7875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d1604b-feb3-4dd5-d7e2-08dd773bccc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9652

SGkgQXlhbiwNCg0KPiBPbiA4IEFwciAyMDI1LCBhdCAxODowMiwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW5rdW1hQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAwOC8wNC8yMDI1
IDE3OjQ4LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+Pj4gT24gOCBBcHIgMjAyNSwgYXQg
MTc6MzMsIEF5YW4gS3VtYXIgSGFsZGVyIDxheWFua3VtYUBhbWQuY29tPiB3cm90ZToNCj4+PiAN
Cj4+PiANCj4+PiBPbiAwOC8wNC8yMDI1IDE1OjI5LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+
PiBIaSBBeWFuLA0KPj4+IEhpIEx1Y2EsDQo+Pj4+PiBPbiA4IEFwciAyMDI1LCBhdCAxNTowMiwg
QXlhbiBLdW1hciBIYWxkZXIgPGF5YW5rdW1hQGFtZC5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+
PiBIaSBMdWNhLA0KPj4+Pj4gDQo+Pj4+Pj4gK3N0YXRpYyB2b2lkIHByZXBhcmVfc2VsZWN0b3Io
dWludDhfdCBzZWwpDQo+Pj4+Pj4gK3sNCj4+Pj4+PiArICAgIC8qDQo+Pj4+Pj4gKyAgICAgKiB7
cmVhZCx3cml0ZX1fcHJvdGVjdGlvbl9yZWdpb24gd29ya3MgdXNpbmcgdGhlIGRpcmVjdCBhY2Nl
c3MgdG8gdGhlIDAuLjE1DQo+Pj4+Pj4gKyAgICAgKiByZWdpb25zLCBzbyBpbiBvcmRlciB0byBz
YXZlIHRoZSBpc2IoKSBvdmVyaGVhZCwgY2hhbmdlIHRoZSBQUlNFTFJfRUwyDQo+Pj4+Pj4gKyAg
ICAgKiBvbmx5IHdoZW4gbmVlZGVkLCBzbyB3aGVuIHRoZSB1cHBlciA0IGJpdHMgb2YgdGhlIHNl
bGVjdG9yIHdpbGwgY2hhbmdlLg0KPj4+Pj4+ICsgICAgICovDQo+Pj4+Pj4gKyAgICBzZWwgJj0g
MHhGMFU7DQo+Pj4+Pj4gKyAgICBpZiAoIFJFQURfU1lTUkVHKFBSU0VMUl9FTDIpICE9IHNlbCAp
DQo+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4gKyAgICAgICAgV1JJVEVfU1lTUkVHKHNlbCwgUFJTRUxS
X0VMMik7DQo+Pj4+Pj4gKyAgICAgICAgaXNiKCk7DQo+Pj4+Pj4gKyAgICB9DQo+Pj4+PiBUaGlz
IG5lZWRzIHRvIGJlIGFybTY0IHNwZWNpZmljLiBSZWZlciBBUk0gRERJIDA2MDBBLmQgSUQxMjA4
MjENCj4+Pj4+IA0KPj4+Pj4gRzEuMy4xOSAgUFJCQVI8bj5fRUwyLCAvKiBJIGd1ZXNzIHRoaXMg
aXMgd2hhdCB5b3UgYXJlIGZvbGxvd2luZyAqLw0KPj4+Pj4gDQo+Pj4+PiBQcm92aWRlcyBhY2Nl
c3MgdG8gdGhlIGJhc2UgYWRkcmVzcyBmb3IgdGhlIE1QVSByZWdpb24gZGV0ZXJtaW5lZCBieSB0
aGUgdmFsdWUgb2YgJ24nIGFuZA0KPj4+Pj4gUFJTRUxSX0VMMi5SRUdJT04gYXMgUFJTRUxSX0VM
Mi5SRUdJT048Nzo0PjpuLg0KPj4+Pj4gDQo+Pj4+PiANCj4+Pj4+IFdoZXJlYXMgZm9yIGFybTMy
IC4gUmVmZXIgQVJNIERESSAwNTY4QS5jIElEMTEwNTIwDQo+Pj4+PiANCj4+Pj4+IEUyLjIuMyBI
UFJCQVI8bj4sDQo+Pj4+PiANCj4+Pj4+IFByb3ZpZGVzIGFjY2VzcyB0byB0aGUgYmFzZSBhZGRy
ZXNzZXMgZm9yIHRoZSBmaXJzdCAzMiBkZWZpbmVkIEVMMiBNUFUgcmVnaW9ucy4NCj4+Pj4+IA0K
Pj4+Pj4gLyogSGVyZSB3ZSBkbyBub3QgbmVlZCB0byB1c2UgSFBSU0VMUiBmb3IgcmVnaW9uIHNl
bGVjdGlvbiAqLw0KPj4+Pj4gDQo+Pj4+PiANCj4+Pj4+IElmIHlvdSB3YW50IHRvIG1ha2UgdGhl
IGNvZGUgc2ltaWxhciBiZXR3ZWVuIGFybTMyIGFuZCBhcm02NCwgdGhlbiBJIGNhbiBzdWdnZXN0
IHlvdSBjYW4gdXNlIHRoZXNlIHJlZ2lzdGVycy4NCj4+Pj4+IA0KPj4+Pj4gRzEuMy4xNyBQUkJB
Ul9FTDINCj4+Pj4+IA0KPj4+Pj4gUHJvdmlkZXMgYWNjZXNzIHRvIHRoZSBiYXNlIGFkZHJlc3Nl
cyBmb3IgdGhlIEVMMiBNUFUgcmVnaW9uLiBQUlNFTFJfRUwyLlJFR0lPTiBkZXRlcm1pbmVzDQo+
Pj4+PiB3aGljaCBNUFUgcmVnaW9uIGlzIHNlbGVjdGVkLg0KPj4+Pj4gDQo+Pj4+PiBFMi4yLjIg
SFBSQkFSDQo+Pj4+PiANCj4+Pj4+IFByb3ZpZGVzIGluZGlyZWN0IGFjY2VzcyB0byB0aGUgYmFz
ZSBhZGRyZXNzIG9mIHRoZSBFTDIgTVBVIHJlZ2lvbiBjdXJyZW50bHkgZGVmaW5lZCBieQ0KPj4+
Pj4gSFBSU0VMUi4NCj4+Pj4+IA0KPj4+Pj4gTGV0IG1lIGtub3cgaWYgaXQgbWFrZXMgc2Vuc2Uu
DQo+Pj4+PiANCj4+Pj4+IC0gQXlhbg0KPj4+PiBPayBJIGRpZGlu4oCZdCBnZXQgdGhhdCBiZWZv
cmUsIHdoYXQgZG8geW91IHRoaW5rIGlmIEkgbW9kaWZ5IHRoZSBjb2RlIGFzIGluIHRoaXMgZGlm
ZiAobm90IHRlc3RlZCk6DQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21w
dS9tbS5jIGIveGVuL2FyY2gvYXJtL21wdS9tbS5jDQo+Pj4+IGluZGV4IGZlMDVjODA5NzE1NS4u
MWJjNmQ3YTc3Mjk2IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vbXB1L21tLmMNCj4+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL21wdS9tbS5jDQo+Pj4+IEBAIC01OCwxOSArNTgsMjEgQEAg
c3RhdGljIHZvaWQgX19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlvbnModm9pZCkN
Cj4+Pj4gICAgICBCVUlMRF9CVUdfT04oUEFHRV9TSVpFICE9IFNaXzRLKTsNCj4+Pj4gIH0NCj4+
Pj4gIC1zdGF0aWMgdm9pZCBwcmVwYXJlX3NlbGVjdG9yKHVpbnQ4X3Qgc2VsKQ0KPj4+PiArc3Rh
dGljIHZvaWQgcHJlcGFyZV9zZWxlY3Rvcih1aW50OF90ICpzZWwpDQo+Pj4+ICB7DQo+Pj4+ICsg
ICAgdWludDhfdCBjdXJfc2VsID0gKnNlbDsNCj4+Pj4gICAgICAvKg0KPj4+PiAgICAgICAqIHty
ZWFkLHdyaXRlfV9wcm90ZWN0aW9uX3JlZ2lvbiB3b3JrcyB1c2luZyB0aGUgZGlyZWN0IGFjY2Vz
cyB0byB0aGUgMC4uMTUNCj4+Pj4gICAgICAgKiByZWdpb25zLCBzbyBpbiBvcmRlciB0byBzYXZl
IHRoZSBpc2IoKSBvdmVyaGVhZCwgY2hhbmdlIHRoZSBQUlNFTFJfRUwyDQo+Pj4+ICAgICAgICog
b25seSB3aGVuIG5lZWRlZCwgc28gd2hlbiB0aGUgdXBwZXIgNCBiaXRzIG9mIHRoZSBzZWxlY3Rv
ciB3aWxsIGNoYW5nZS4NCj4+Pj4gICAgICAgKi8NCj4+Pj4gLSAgICBzZWwgJj0gMHhGMFU7DQo+
Pj4+IC0gICAgaWYgKCBSRUFEX1NZU1JFRyhQUlNFTFJfRUwyKSAhPSBzZWwgKQ0KPj4+PiArICAg
IGN1cl9zZWwgJj0gMHhGMFU7DQo+Pj4+ICsgICAgaWYgKCBSRUFEX1NZU1JFRyhQUlNFTFJfRUwy
KSAhPSBjdXJfc2VsICkNCj4+Pj4gICAgICB7DQo+Pj4+IC0gICAgICAgIFdSSVRFX1NZU1JFRyhz
ZWwsIFBSU0VMUl9FTDIpOw0KPj4+PiArICAgICAgICBXUklURV9TWVNSRUcoY3VyX3NlbCwgUFJT
RUxSX0VMMik7DQo+Pj4+ICAgICAgICAgIGlzYigpOw0KPj4+PiAgICAgIH0NCj4+Pj4gKyAgICAq
c2VsID0gKnNlbCAmIDB4RlU7DQo+Pj4+ICB9DQo+Pj4+ICAgIC8qDQo+Pj4+IEBAIC0xMDIsNyAr
MTA0LDcgQEAgdm9pZCByZWFkX3Byb3RlY3Rpb25fcmVnaW9uKHByX3QgKnByX3JlYWQsIHVpbnQ4
X3Qgc2VsKQ0KPj4+PiAgICAgICAqLw0KPj4+PiAgICAgIHByZXBhcmVfc2VsZWN0b3Ioc2VsKTsN
Cj4+Pj4gIC0gICAgc3dpdGNoICggc2VsICYgMHhGVSApDQo+Pj4+ICsgICAgc3dpdGNoICggc2Vs
ICkNCj4+Pj4gICAgICB7DQo+Pj4+ICAgICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0Uo
MCwgcHJfcmVhZCk7DQo+Pj4+ICAgICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoMSwg
cHJfcmVhZCk7DQo+Pj4+IEBAIC0xNDAsNyArMTQyLDcgQEAgdm9pZCB3cml0ZV9wcm90ZWN0aW9u
X3JlZ2lvbihjb25zdCBwcl90ICpwcl93cml0ZSwgdWludDhfdCBzZWwpDQo+Pj4+ICAgICAgICov
DQo+Pj4+ICAgICAgcHJlcGFyZV9zZWxlY3RvcihzZWwpOw0KPj4+PiAgLSAgICBzd2l0Y2ggKCBz
ZWwgJiAweEZVICkNCj4+Pj4gKyAgICBzd2l0Y2ggKCBzZWwgKQ0KPj4+PiAgICAgIHsNCj4+Pj4g
ICAgICAgICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMCwgcHJfd3JpdGUpOw0KPj4+PiAg
ICAgICAgICBHRU5FUkFURV9XUklURV9QUl9SRUdfQ0FTRSgxLCBwcl93cml0ZSk7DQo+Pj4+IA0K
Pj4+PiBBbmQgbGF0ZXIgeW91IHdpbGwgdXNlIHNvbWUgI2lmZGVmIENPTkZJR19BUk1fMzIgaW5z
aWRlIHByZXBhcmVfc2VsZWN0b3IoKSB0byBjaGVjaw0KPj4+PiB0aGF0IHRoZSBjb2RlIGlzIHBh
c3NpbmcgdXAgdG8gdGhlIG1heCBzdXBwb3J0ZWQgcmVnaW9uIG9yIHBhbmljLg0KPj4+PiBBbmQg
aW4ge3JlYWQsd3JpdGV9X3Byb3RlY3Rpb25fcmVnaW9uKCkgeW91IGNvdWxkIGFkZCBzb21lICNp
ZmRlZiBDT05GSUdfQVJNXzMyIHRvIGFkZA0KPj4+PiB0aGUgY2FzZSBnZW5lcmF0b3JzIGZvciBy
ZWdpb25zIGZyb20gMTYgdG8gMjMgc2luY2UgUjUyIGNhbiBhZGRyZXNzIHRoZW0gZGlyZWN0bHku
DQo+Pj4+IA0KPj4+PiBXaGF0IGRvIHlvdSB0aGluaz8NCj4+PiBJIGdvdCB0aGlzIGRpZmYgd29y
a2luZyBhcyBpdCBpcyBmb3IgUjgyLiBUaGlzIGxvb2tzIG11Y2ggbGVzc2VyIGNvZGUNCj4+PiAN
Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21wdS9tbS5jIGIveGVuL2FyY2gvYXJtL21w
dS9tbS5jDQo+Pj4gaW5kZXggZmUwNWM4MDk3MS4uNjM2MjdjODVkYyAxMDA2NDQNCj4+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vbXB1L21tLmMNCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vbXB1L21tLmMN
Cj4+PiBAQCAtMjgsMjMgKzI4LDE5IEBAIERFQ0xBUkVfQklUTUFQKHhlbl9tcHVtYXBfbWFzaywg
TUFYX01QVV9SRUdJT05TKTsNCj4+PiAgLyogRUwyIFhlbiBNUFUgbWVtb3J5IHJlZ2lvbiBtYXBw
aW5nIHRhYmxlLiAqLw0KPj4+ICBwcl90IHhlbl9tcHVtYXBbTUFYX01QVV9SRUdJT05TXTsNCj4+
PiANCj4+PiAtLyogVGhlIGZvbGxvd2luZyBhcmUgbmVlZGVkIGZvciB0aGUgY2FzZSBnZW5lcmF0
b3Igd2l0aCBudW09PTAgKi8NCj4+PiAtI2RlZmluZSBQUkJBUjBfRUwyIFBSQkFSX0VMMg0KPj4+
IC0jZGVmaW5lIFBSTEFSMF9FTDIgUFJMQVJfRUwyDQo+Pj4gLQ0KPj4+ICAjZGVmaW5lIEdFTkVS
QVRFX1dSSVRFX1BSX1JFR19DQVNFKG51bSwgcHIpICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXA0KPj4+ICAgICAgY2FzZSBudW06IFwNCj4+PiB7IFwNCj4+PiAtICAgICAgICBXUklU
RV9TWVNSRUcocHItPnByYmFyLmJpdHMgJiB+TVBVX1JFR0lPTl9SRVMwLCBQUkJBUiMjbnVtIyNf
RUwyKTsgIFwNCj4+PiAtICAgICAgICBXUklURV9TWVNSRUcocHItPnBybGFyLmJpdHMgJiB+TVBV
X1JFR0lPTl9SRVMwLCBQUkxBUiMjbnVtIyNfRUwyKTsgIFwNCj4+PiArICAgICAgICBXUklURV9T
WVNSRUcocHItPnByYmFyLmJpdHMgJiB+TVBVX1JFR0lPTl9SRVMwLCBQUkJBUl9FTDIpOyAgXA0K
Pj4+ICsgICAgICAgIFdSSVRFX1NZU1JFRyhwci0+cHJsYXIuYml0cyAmIH5NUFVfUkVHSU9OX1JF
UzAsIFBSTEFSX0VMMik7ICBcDQo+Pj4gYnJlYWs7IFwNCj4+PiAgICAgIH0NCj4+PiANCj4+PiAg
I2RlZmluZSBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKG51bSwgcHIpICAgICAgICAgICAgICAg
ICAgICAgIFwNCj4+PiAgICAgIGNhc2UgbnVtOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwNCj4+PiAgICAgIHsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+PiAtICAgICAgICBwci0+
cHJiYXIuYml0cyA9IFJFQURfU1lTUkVHKFBSQkFSIyNudW0jI19FTDIpOyAgICAgICAgIFwNCj4+
PiAtICAgICAgICBwci0+cHJsYXIuYml0cyA9IFJFQURfU1lTUkVHKFBSTEFSIyNudW0jI19FTDIp
OyAgICAgICAgIFwNCj4+PiArICAgICAgICBwci0+cHJiYXIuYml0cyA9IFJFQURfU1lTUkVHKFBS
QkFSX0VMMik7ICAgICAgICAgXA0KPj4+ICsgICAgICAgIHByLT5wcmxhci5iaXRzID0gUkVBRF9T
WVNSRUcoUFJMQVJfRUwyKTsgICAgICAgICBcDQo+Pj4gICAgICAgICAgYnJlYWs7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4gICAgICB9DQo+
Pj4gDQo+Pj4gQEAgLTY1LDcgKzYxLDYgQEAgc3RhdGljIHZvaWQgcHJlcGFyZV9zZWxlY3Rvcih1
aW50OF90IHNlbCkNCj4+PiAgICAgICAqIHJlZ2lvbnMsIHNvIGluIG9yZGVyIHRvIHNhdmUgdGhl
IGlzYigpIG92ZXJoZWFkLCBjaGFuZ2UgdGhlIFBSU0VMUl9FTDINCj4+PiAgICAgICAqIG9ubHkg
d2hlbiBuZWVkZWQsIHNvIHdoZW4gdGhlIHVwcGVyIDQgYml0cyBvZiB0aGUgc2VsZWN0b3Igd2ls
bCBjaGFuZ2UuDQo+Pj4gICAgICAgKi8NCj4+PiAtICAgIHNlbCAmPSAweEYwVTsNCj4+PiAgICAg
IGlmICggUkVBRF9TWVNSRUcoUFJTRUxSX0VMMikgIT0gc2VsICkNCj4+PiAgICAgIHsNCj4+PiAg
ICAgICAgICBXUklURV9TWVNSRUcoc2VsLCBQUlNFTFJfRUwyKTsNCj4+PiANCj4+PiBQbGVhc2Ug
Z2l2ZSBpdCBhIHRyeSB0byBzZWUgaWYgaXQgd29ya3MgYXQgeW91ciBlbmQuDQo+Pj4gDQo+Pj4g
DQo+Pj4gQW5kIHRoZW4sIHRoZSBjb2RlIGNhbiBiZSByZWR1Y2VkIGZ1cnRoZXIgYXMNCj4+PiAN
Cj4+PiB2b2lkIHJlYWRfcHJvdGVjdGlvbl9yZWdpb24ocHJfdCAqcHJfcmVhZCwgdWludDhfdCBz
ZWwpDQo+Pj4gew0KPj4+ICAgICAvKg0KPj4+ICAgICAgKiBCZWZvcmUgYWNjZXNzaW5nIEVMMiBN
UFUgcmVnaW9uIHJlZ2lzdGVyIFBSQkFSX0VMMi9QUkxBUl9FTDIsDQo+Pj4gICAgICAqIG1ha2Ug
c3VyZSBQUlNFTFJfRUwyIGlzIHNldCwgYXMgaXQgZGV0ZXJtaW5lcyB3aGljaCBNUFUgcmVnaW9u
DQo+Pj4gICAgICAqIGlzIHNlbGVjdGVkLg0KPj4+ICAgICAgKi8NCj4+PiAgICAgcHJlcGFyZV9z
ZWxlY3RvcihzZWwpOw0KPj4+IA0KPj4+ICAgICBwcl9yZWFkLT5wcmJhci5iaXRzID0gUkVBRF9T
WVNSRUcoUFJCQVJfRUwyKTsNCj4+PiANCj4+PiAgICAgcHJfcmVhZC0+cHJsYXIuYml0cyA9IFJF
QURfU1lTUkVHKFBSTEFSX0VMMik7DQo+Pj4gDQo+Pj4gfQ0KPj4+IA0KPj4+IFRoZSBzYW1lIGNh
biBiZSBkb25lIGZvciB3cml0ZV9wcm90ZWN0aW9uX3JlZ2lvbiguLi4pDQo+Pj4gDQo+Pj4gLSBB
eWFuDQo+PiBUaGUgcG9pbnQgb2YgdGhlIGNvZGUgd2FzIHRvIGRvbuKAmXQgaXNzdWUgYW4gaXNi
KCkgZXZlcnkgdGltZSB3ZSBjaGFuZ2UgdGhlIHNlbGVjdG9yLA0KPj4gb2YgY291cnNlIHRoZSBj
b2RlIHdvdWxkIGJlIGVhc2llciBvdGhlcndpc2UsIGJ1dCBkbyB3ZSB3YW50IHRvIGRvIHRoYXQ/
DQo+IA0KPiBOb3Qgc3VyZSBpZiBpdCBpcyBiZW5lZmljaWFsIGFzIHlvdSB3b3VsZCBuZWVkIHRv
IHVzZSBpc2IoKSBmcm9tIHJlZ2lvbjE2IG9ud2FyZHMuDQoNClRoZSBpc2IoKSBpcyBpc3N1ZWQg
b25seSB3aGVuIGNoYW5naW5nIHRoZSBzZWxlY3Rvciwgc28gd2hlbiB5b3UgZ28gZnJvbSByZWFk
aW5nL3dyaXRpbmcgcmVnaW9ucw0KZnJvbSAwLTE1IHRvIDE2LTMxIGZvciBleGFtcGxlLCBvZiBj
b3Vyc2UgdGhlcmUgaXMgYSBjYXNlIHRoYXQgaWYgeW91IGNvbnRpbnVvdXNseSB3cml0ZSBvbiBy
ZWdpb24gMTUNCmFuZCAxNiB5b3Ugd291bGQgaGF2ZSB0byBhbHdheXMgY2hhbmdlIHRoZSBzZWxl
Y3RvciwgYnV0IGl04oCZcyB0aGUgbGVzcyBpbXBhY3Qgd2UgY291bGQgaGF2ZS4NCg0KYXJtdjgt
UiBpcyBldmVuIGJldHRlciBzaW5jZSBpdOKAmXMgYWJsZSB0byBhZGRyZXNzIHJlZ2lvbnMgZnJv
bSAwIHRvIDIzIHdpdGhvdXQgZmx1c2hpbmcgdGhlIHBpcGVsaW5lLA0Kc28gSSB3b3VsZCBzYXkg
d2Ugc2hvdWxkIGV4cGxvaXQgdGhpcyBiaWcgYWR2YW50YWdlLg0KDQpJ4oCZbGwgc2VuZCBzaG9y
dGx5IGluIHRoaXMgdGhyZWFkIHRoZSBjb2RlIEkgd291bGQgdXNlIGFuZCB0aGUgY29kZSBJIHdh
cyB0aGlua2luZyB5b3UgY291bGQgdXNlLg0KDQo+IA0KPiBJZiB5b3UgYXJlIGdvaW5nIHRvIGtl
ZXAgdGhlIGNvZGUgYXMgaXQgaXMsIHRoZW4gdGhlIGZvbGxvd2luZyBuZWVkcyB0byBiZSBtb3Zl
ZCB0byBhcm02NCBzcGVjaWZpYyBoZWFkZXIgYXMgd2VsbA0KPiANCj4gI2RlZmluZSBQUkJBUjBf
RUwyIFBSQkFSX0VMMg0KPiAjZGVmaW5lIFBSTEFSMF9FTDIgUFJMQVJfRUwyDQoNCm9rIEnigJls
bCBtb3ZlIHRoZW0uDQoNCkNoZWVycywNCkx1Y2ENCg0KDQo=

