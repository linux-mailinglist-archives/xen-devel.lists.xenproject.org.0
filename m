Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HsKILVnjGlWnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:27:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA839123D94
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227348.1533689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq8Nf-0006cu-4G; Wed, 11 Feb 2026 11:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227348.1533689; Wed, 11 Feb 2026 11:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq8Nf-0006aB-0P; Wed, 11 Feb 2026 11:27:39 +0000
Received: by outflank-mailman (input) for mailman id 1227348;
 Wed, 11 Feb 2026 11:27:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vq8Nc-0006Yn-VF
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 11:27:37 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a896034c-073c-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 12:27:33 +0100 (CET)
Received: from AS4P189CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::19)
 by PAXPR08MB7317.eurprd08.prod.outlook.com (2603:10a6:102:230::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 11:27:31 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::96) by AS4P189CA0018.outlook.office365.com
 (2603:10a6:20b:5db::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 11:27:29 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Wed, 11 Feb 2026 11:27:30 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAWPR08MB11066.eurprd08.prod.outlook.com (2603:10a6:102:46b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 11:26:21 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 11:26:21 +0000
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
X-Inumbo-ID: a896034c-073c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=alH4Db+YCAzufoH8lPw1R4Ch5xKkX5dOFJqAq1+CPxCZqSx9FWoPanhgg+u2ZyEH9RJZ3XnwvTqU6vAsreQn0NR4UBfmA/CHTJ5j2aODJBa++JSPmb+v0L6pSiTVHqBm9rVrfdxpWoWR7jqNTFtPRy99x3Kln3IKq4Qyro/kJUG5r5TQShk81lLW0b7qz+ZmIc5vWXNkCcZEh5XtUKiE+DDRsZQwabALjASBL1ADUPo1PPR8z15mSDk+9yBXiPz1tQhGews7RP5v0CD+F97ChV9VzXi87nfOEBG0A3gBxcc2T9g2aGM2EEZUqt0uK3BS8ToB6mcET6OhHGXBeERyWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ucqx+nI1hwRHKmub3pZYl/QRigRHgYW7VbMw4rM2yWI=;
 b=nNSSiIfmgGrZqvU5LzbgTUH5QoOH/RkyLe7WzDaPo/+gGzjjfKPGTb96DZmFaZDzuuTqHHsT/Un1tkz14o0bkHnV+1+Q6dU4t5cd8SAcX1h/ai56roRw+fvvnObW6gcwcHDi4yUcf01K36eimJEr0cwRroODAtP6q9lzAt1adwk7ULeR7m/awimnQfov4cdA78M/mufWZvhaXA2j/V+esiferpOwDrMEvQOMCLx8ov7d6P7tv49/b3AOhywnn2nhD1mLbF5usV6FUqArPXKPw0Xtbwrcv2m+cduNDqNs0O9a4hIRKhsr3d9/rxXt2ylSKQTXjMy4EXE1Y6JIZc0nbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ucqx+nI1hwRHKmub3pZYl/QRigRHgYW7VbMw4rM2yWI=;
 b=bnLltUeR45ILcIkHLDwEItR98ZlJeNeEtw0Lyi+2/ncK+Z1XT+a6zK/+wUXueeDaDW2vNkVlIs3/9iGy9Kda1KQ4Jt1H9ndIg6eKPL3Vb8wKc3PKu2bjfTTSrkWPjdlxv+INxSnc9f3SyfUSGeqgAoDX3zaDOToKCdBcXkTOEwU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQexQ1lPwncH0FDZkjuq8ZPEzYoIzYVBhI6QhXlAVwoiT8rISUQeJkD/KTwGe3W/u1PvH9nXcADpSzCAU00RNASXIyErC1+3cX7fy5NrfmQRvUo3yZvcLODqVbqnP/G4IjDcj51nT+vtVnXuac/lOYS0lFs3vLjvjNtUIKKOcogHQ51Gu6AVzU3BxX2rEbOVyfd2FBik+dEmPtbiKmcSjF4DP6M0SfJfXNzjGdn3uPgbBR/6jXIcsCONlamL+tUBFEM1mBIrAbHeQoyzOw29y1RMhKZQej0pux/0367M0/HWCUJbBd2PX2LC/2kG+0prcH4A7gTnGMIW1/Xlj68UEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ucqx+nI1hwRHKmub3pZYl/QRigRHgYW7VbMw4rM2yWI=;
 b=kCNqYek3M3y1e6kzVbueeD5XesK6tE3jm8ebP/+3IgJfXoO4BK3PqZFj8r21V4cn8a9k5OSypxObDxNsHnv+EBVoAQX5gJPAGObDLTfAyqrferwCjvAhrNBOShqA23mHlxnXKrrl3PtZamK4KWJERTx8ncjJDsg3P4JY+Xy14x05M7UV/RF7V5eVo2Fzt6t/748BIG2cOwwr7NK6NxegewImmjrpylJQqoPIehKubPi/V2e3dS9VcBCxAS/bo49N6JIBn0ScuQdfL+RHOdOJgg24z26tVoyfKGpi3BoYelseUE62NlZog1IpZmPQUhAOSnjm0d7HDCTcQAA4M3I2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ucqx+nI1hwRHKmub3pZYl/QRigRHgYW7VbMw4rM2yWI=;
 b=bnLltUeR45ILcIkHLDwEItR98ZlJeNeEtw0Lyi+2/ncK+Z1XT+a6zK/+wUXueeDaDW2vNkVlIs3/9iGy9Kda1KQ4Jt1H9ndIg6eKPL3Vb8wKc3PKu2bjfTTSrkWPjdlxv+INxSnc9f3SyfUSGeqgAoDX3zaDOToKCdBcXkTOEwU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 08/12] xen/arm: ffa: Fix FFA_FEATURES validation
Thread-Topic: [PATCH 08/12] xen/arm: ffa: Fix FFA_FEATURES validation
Thread-Index: AQHclTQCVYzQoM1PdEyfckgwmOVEyLV9M2UAgAA0pYA=
Date: Wed, 11 Feb 2026 11:26:21 +0000
Message-ID: <26A3747F-0313-437F-B461-F5C70CE1A4F1@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <5331b33343441028d10c290b21b82acce295fff0.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44FWRepyAakwXLjObbA=8O_LMBR5jk0-WEAXZdgsQCsHOw@mail.gmail.com>
In-Reply-To:
 <CAHUa44FWRepyAakwXLjObbA=8O_LMBR5jk0-WEAXZdgsQCsHOw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAWPR08MB11066:EE_|AMS1EPF0000004E:EE_|PAXPR08MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa1ade6-6306-4f8b-94c2-08de69608b5b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YzFUbzY3bHlTNXU2eVVZd0p3SmNhTm1IVm8rVXBHUURKSHd4UDJHanlCT3Zp?=
 =?utf-8?B?UlJUY091Tkt2SmNFdkZhQmdWeTB2WGVoK0lsN2pFanNuUkMwZkhKalpjSWZJ?=
 =?utf-8?B?TGZpSEFpM0czQkVIQitkbDZoYWN5NSs2aFh0TTQ3LzBWVFpIdGg2eE1RY3Vq?=
 =?utf-8?B?dTRHK1JEQWp5VzU1MDZxVlV0S3owUFlRWW0yRTN3RWJzQ3g1ZEROajZnOHNG?=
 =?utf-8?B?ajBMR1VxRWp5bFhRaVFTbVI3WVF3aDg3MGZLNFdFM1psNHRwbFN1OTZOUmd3?=
 =?utf-8?B?dE13a2tpMFgxcW1HUXdjcHN1cmlWZDlCck51cUxJUGszcGFMUWIzcE5xaWZs?=
 =?utf-8?B?SUp4YkowbXZmVloxM1FMT2h1OGpMUEg0dHh5TzRYQXZyY3Jna2dnWVRUM1Fx?=
 =?utf-8?B?U1kyZ1ZkSWpENTNscmJBZGZUWkExcTVNY0NWOFQ5andqMEdoY0VHKy9sUHFT?=
 =?utf-8?B?K1I3ZnlaZ0xsWTMvZDkreVNaZEp1aHlIRnZuUUIwcEEyMlk3RFBGbWRhR0RR?=
 =?utf-8?B?RjJCdzNoZXlvTnpiV0xHQkQzSUtRRGhVakhlbndyWUtwTHg4YWpxK3hPOXFK?=
 =?utf-8?B?U0dSczJRRkg4RGJGYWhETkoybTR0aDRET2orNE1paTJ5WmU2eDBwOVhHdFBP?=
 =?utf-8?B?c0dTV01kOU9GK2lUOEs5VlBlOE15NWJ6UU1QNHV5N2ZFNzhLa0h3SDZ0eTJB?=
 =?utf-8?B?ejhqdWp1SHc1N2VMbVlUazY2enc1NC80UFNzd1NCSWo5S3Z2b0ZmLytUc2t5?=
 =?utf-8?B?ZmhkQmUvMlc3REN5N21mQ0dETXhQTzhKUTlLRDc5VkNYeE9KU0k1YWJJRU9I?=
 =?utf-8?B?OWZKc25UT1BjcW9hLzR3RllNcVFlaDFLVW9CbXdvSy9VaUN1L3A0Wk5TUnQ3?=
 =?utf-8?B?cjJwUThvNGRNRWtRemxteFNlNjhBWVMwQkhFdU41cVlTYzY0NWlseWhPa1Ns?=
 =?utf-8?B?OUtjWThQaTVIaERTUk1WY0RrVlVsYWpwTWRnNVRCUVBTVDRDcXY3OG9RR1Vh?=
 =?utf-8?B?N1E0VnZWRXBCYUxka1pzMDRocXhqQkMwR3hDcXF0djc1ZWEzTkRSWHpvOFN0?=
 =?utf-8?B?QXdqay9tOUhmV1UrUDhwRWl1dXFBTHd3aFUxeFFTNG1JZ2N4UkhoSkR3YTF1?=
 =?utf-8?B?b1dmeEhEMWtkVjVZbXdRbWNBWXcwWFpXME5iMmlHVE1DN2phNTNDZEZhSllk?=
 =?utf-8?B?NGIrdXBoU2NaYnBKcjhSZWFmZUdlREFidG0wUm1sN2J5UGNMbEpKSzRidUNK?=
 =?utf-8?B?ZytvSVBKZi9ManY5NkQ1eDBUNTRSVlgvSzNjTzh4aWpPVW9mV2UwVmdTcUFE?=
 =?utf-8?B?RDFvditldUwrNi9hczQ2M0NmNVhEaUJJcWJNTHNJdWczZFFUOUZ0RFdlc0M4?=
 =?utf-8?B?Y29Oc08zdDBuN0VHU2FJemRETno5OEdQYkVtc1JndXBqVnExUWFFMENmd2xx?=
 =?utf-8?B?Vy82aXdPSWx3TkZyU085eHR3VndIYTJROEZFVEU2NGZsTU9sR2lYSjhaNmVI?=
 =?utf-8?B?UUxXcHdyeUpybEJPM2wyVXRENmdWZThHSkJmOHJNUUdKN3pSTzdrNWpQdEZB?=
 =?utf-8?B?aXlOU3JwMDJNQjYxZk9WeE0vOVFrN3Y3VlpudSt0cWkyc05Cc1NHUXB2TzR0?=
 =?utf-8?B?eS91YUVNTFR6aTM2STMrNEJ2dE4wdXhGN0trTi9VYUprejk0a3IzM0hoVXkz?=
 =?utf-8?B?WU83QUY5cXZrZWxQWjFYUlhvTE9KK2xiYnpaQVdTamJoVmJjM0NFMmJTaVo0?=
 =?utf-8?B?ZkVENnowR1N1VCthS2trV1JFcGJRYUZOSlpYTHVGRGpVZVdhUmhmL1BheG5Q?=
 =?utf-8?B?Z0Fkb3ZTeVJHZ3RrTno4MFl6VHg3Ty92RkRUaWdVR3JtSmU3bzA2K0NyUnVX?=
 =?utf-8?B?ZHNwU01lbUJxWldMSVdVYmZYY2Z0UEczKzRsb0FJUlgvUVYzckJ0VWMrY3Vj?=
 =?utf-8?B?OUwxZ3NBVTl2SHJPLzJ3NjdQam12ay8wMi9aZ2ZPaXBTNnpWa0hnNjVuZk9H?=
 =?utf-8?B?VndiLzZtcFp4cm81VUZSVWtsRTV2a0NNRXVFc3p3SDJRamp0aXNrL2ZCY0VF?=
 =?utf-8?B?TXl4ZkIzMzZGVmZ1bDU4aVRRMzg0TWNON0NqZHdSTStyNU9HNWVQbU1rV2o2?=
 =?utf-8?B?TEdiNkM3SjBDZ3lKN2xVYlZvYVVqdFJlcDFjeHZXNkJGaEZocm04dU1aOFRk?=
 =?utf-8?Q?yPVBJgVixlgz+fLhfRj+3LE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7E15ED79B5ED1448CFE5133615EE36E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11066
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	79fb77a3-648c-4bac-1db7-08de69606207
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|14060799003|35042699022|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M09Pd0RsNU52UlJDa2FSUkwwWDRmZGRsbWZYRW41OGZwOCtITUMvMy85RU04?=
 =?utf-8?B?TENnbCtsQ1N0WWlFUUlad3F1WHpVQ0lkZUs0WmdLaEV2czhoaTltRWNjMnhZ?=
 =?utf-8?B?VCtrckszNzBCVjJuR0VIcGVjS0hxWkNuVlNib0NhNDdENGR1a29LZXdrNC9q?=
 =?utf-8?B?NCtkaG1WcFJZRno1THhqSUt3RTRTU0dVTEJkdjF5UkFxK054bnN3aGVNNzNu?=
 =?utf-8?B?VFdDeElRSmNCcnpXeTBERVU3NEhYY21Yd3NRWVZPWWhYcVBLcWRJWk5jY3pM?=
 =?utf-8?B?MW5CRnJlSEQrLzEvY0NEdFN6MVlMSUUyY3lRelpOc2xJcW82SWwzK0pyMTFR?=
 =?utf-8?B?NTBwUHlFMWk3b1JvU2dZZU5vTllCRjE2aTNicFhPNXNoVnZWTjZhMm9jY1pK?=
 =?utf-8?B?NTh4TktmQXpPYnJoQ01vVkFPOHI2R2t4dVBYZks2VGk5TytVMVZwNlQ2VFNG?=
 =?utf-8?B?UzN0eHJWdzRXSUpZQmtrbHNBSkxrbyt2U3NXeXp2SnNjcllYNWVKNS9uaDBq?=
 =?utf-8?B?TnFINmFGc3VYNDFKTWw0bHBYUUhHbVJtd2JEejlNNitKa1hWdGdsdzNsaEhL?=
 =?utf-8?B?MDVlalNOMWNwYm93LzlsVCtmNVBGVHIrcUxDRDAycGRBTWMwTTQ3TE1VSzBu?=
 =?utf-8?B?N1hLMTFnTmFCTXBMYzFUQTB2czBrcHc3bEFtSk1TdENCMXU4dzZ5VW9yUGZa?=
 =?utf-8?B?eVRWL0FIU2ZyVlhhNWgrNS9SZ1Z5cUJKMnlTekF0eWJpdytRUXM3T2czWGNP?=
 =?utf-8?B?QlhUMmN3TzRiMXhCUWFkUE8xSWpxSFdKWk1LamNWSDdoa1FIc01ENTlKSHY4?=
 =?utf-8?B?NUx1UnVSbXVNa2RXYXU4VC92UWkxb1U3enhram9Oa2VUUlozdVZoOTNrSDF6?=
 =?utf-8?B?TXBrYnpWV0xiVElKN1o2cFg0dnJ5bm94VXFXNWIxUGRkcGoyYUNReVZ0cXha?=
 =?utf-8?B?SHpEQTR0VWRCVnExbXRkcmJSbnUxbHR3SXA0bW9sd3E5eW9JVnpJWks3RXlw?=
 =?utf-8?B?d3dQMnh5STEycTlibHFQUjk1QmRZdjl4WWx3MjZvbEsyV0hnVXA0cVVzc2lG?=
 =?utf-8?B?MFd0MThEM3V0b3NpRE1Qd3RNbDFKOWFCNnhvalVmelNDK2tWc0QwRUJLS25R?=
 =?utf-8?B?c0hhcmlSSnE3anJVeXBtOGRnaVdLWHlNS3hRbzcvVGhCdFo1NEJ3RHZzSWFv?=
 =?utf-8?B?ZkRTK0dRaFYwdW8raUVjbnBRNDh6OFpZb1REeDU0YUNXbVhwbEhQaDdGUWU2?=
 =?utf-8?B?YXA4djNGODZxL1ZFbDF0bmJYZngyVUxDcGc4NW1xRk40MmVySEhSNnUrOWVG?=
 =?utf-8?B?Y3N6eTZ0Q0pTYWxWUllkZHJBa2VzWTRTQ2FFZzI0bm9MNFZXZ096NFZ3Q0Jt?=
 =?utf-8?B?WHBJVUN4cjI4anVmcmJudDlIZTNNa1MwSWVyNGJlVG9MZjBvSkx5anFMcG1N?=
 =?utf-8?B?V25jYVRPbkVFVXpsZ2p6b3FtUmZJdkVvMDBHTUR3c21zTU5qSThUcnpNUnJK?=
 =?utf-8?B?b0hTbFhhS0c2L0NuR3R0eDYwWk5PaGVGVGd3YitYblVwNXV5YXZya2lzdUFQ?=
 =?utf-8?B?NkdBTUJlTGYxOFI5bGZXeWhoZTlpYUtWVUM4ZkhnSzgxUm94OUl3K1YrZXlL?=
 =?utf-8?B?MGlYUnNxNnNwWmtvNENIN2FTUHY3clliVkQrd04zblFqaHdNT0FhZGJuSjd0?=
 =?utf-8?B?N01Cbmk5d2VDQ2VBZmhyS0p5QVRPYWFjRVEzbTQ5MzZPMWJ0WDJoWFNwenM5?=
 =?utf-8?B?bHQ0QlBFM3JMZDBwdnFOZGI0QkNqVkNzRFBxaUptSTVXR1lyNUhWeCs1SnpC?=
 =?utf-8?B?eGJRRkhKTTY2WVM1Qk5URENmbnpWc2FFMmRtMWZUNzI2d3VJbFNRb1Zta0s3?=
 =?utf-8?B?b2NpWGRMRDRxbmRYZ0tQcEs1RkxwZDQ5dFR4UGtRWFF0N0JzVDdPN1dOUHRW?=
 =?utf-8?B?UkR5UFZjbEdwZ1R4U0FlVXVzRkhnazhNVm9ESndHUGtIeWVxQ003SkVobzFU?=
 =?utf-8?B?d2h5enhXUTljSWdrVlhZVDIxK0RkanVhcFRsRUlIeU1jQmtEaE9rQzRqYVZw?=
 =?utf-8?B?aGZsWlk5SkpSSmVLT2UrR3hBQ1J6bGU0N1RUM1NJdENRQzdYMnVrUDE4cVUr?=
 =?utf-8?B?Rkp2T2ZiWGlFVjVjcDBpbCt2bFJtUkJYeTVHVEFQNy9WeWVPcDg4L3NnVG8z?=
 =?utf-8?B?MzJ0UzI5OWZ6Smh2d1FOamdmV2FEUEZRc25zeFRzTlZVNk5KcGhuUlF1bmR1?=
 =?utf-8?B?SEpOMS9kLzhKQXFBdDNrV1VuWUJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(14060799003)(35042699022)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b+VIOIWB13LksUmMM0esQnyBh2kP+TWQrFoSFgYdJsJA0K8FS/p8ijZC6QIZfBKRCO0L+Yey7inn+jXE61ehfl28akMSdSeH2Msn2nmUn0muLnr6eVsyhJdgmFekRs/BYCoA/Z/ShOW3xK4emnGO3/O05sJMZmHWwOvJKc7Tx8Zt35asKofB+RXuSkQnf1oNUkHS9flhMs2TQfQ+G0BI46HvRYLHpjC8n0rPujmiBv5tX0fzj8MB7lSIHECuzRgEik7XUOQR3+ODkg7SOmLXsscZE24upSWQbKC/CSXwC9wpy0OUCZo/+s/23Y/TtVS/0AxBrgQsWcmcSTwtkh+2x3f08maX60CU1LTLxKrpmmlPlKApY0fLo0xnO5jX09JIGSYJbUBKLil5OGRaLi+SBKH+hYxLuNqQJzXupsMOqY+JNSkFiBB84K2zQV28/7Ew
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:27:30.8070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa1ade6-6306-4f8b-94c2-08de69608b5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7317
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
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:email,arm.com:mid,arm.com:dkim,arm.com:email];
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
X-Rspamd-Queue-Id: CA839123D94
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiAxMSBGZWIgMjAyNiwgYXQgMDk6MTcsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gVHVlLCBGZWIgMywgMjAyNiBhdCA2OjM44oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gRkZBX0ZFQVRVUkVTIGN1
cnJlbnRseSBhY2NlcHRzIG5vbi16ZXJvIGlucHV0IHByb3BlcnRpZXMgKHcyLXc3KSBmcm9tDQo+
PiBndWVzdHMgYW5kIGFkdmVydGlzZXMgc2V2ZXJhbCBBQklzIHVuY29uZGl0aW9uYWxseSwgZXZl
biB3aGVuIGZpcm13YXJlDQo+PiBzdXBwb3J0IGlzIG1pc3Npbmcgb3Igd2hlbiB0aGUgQUJJIGlz
IHBoeXNpY2FsLWluc3RhbmNlLW9ubHkuIFRoaXMgY2FuDQo+PiBtaXNsZWFkIGd1ZXN0cyBhYm91
dCB3aGF0IFhlbiBjYW4gYWN0dWFsbHkgcHJvdmlkZSBhbmQgdmlvbGF0ZXMgRkYtQQ0KPj4gY2Fs
bGluZyBjb252ZW50aW9ucy4gU29tZSBTUE1DcyAoSGFmbml1bSB2Mi4xNCBvciBlYXJsaWVyKSBh
bHNvIGZhaWwgdG8NCj4+IHJlcG9ydCBGRkFfUlhfQUNRVUlSRSBkZXNwaXRlIHN1cHBvcnRpbmcg
aXQuDQo+PiANCj4+IFVwZGF0ZSBGRkFfRkVBVFVSRVMgdmFsaWRhdGlvbiB0byBtYXRjaCBzcGVj
IGFuZCBmaXJtd2FyZSBzdXBwb3J0Og0KPj4gLSByZWplY3Qgbm9uLXplcm8gdzItdzcgaW5wdXQg
cHJvcGVydGllcyB3aXRoIElOVkFMSURfUEFSQU1FVEVSUw0KPj4gLSByZWplY3QgNjQtYml0IGNh
bGxpbmcgY29udmVudGlvbnMgZnJvbSAzMi1iaXQgZ3Vlc3RzIHdpdGggTk9UX1NVUFBPUlRFRA0K
Pj4gLSByZXR1cm4gTk9UX1NVUFBPUlRFRCBmb3IgcGh5c2ljYWwtaW5zdGFuY2Utb25seSBBQklz
DQo+PiAoRkZBX05PVElGSUNBVElPTl9CSVRNQVBfe0NSRUFURSxERVNUUk9ZfSwgRkZBX1JYX0FD
UVVJUkUpDQo+PiAtIGFkdmVydGlzZSBGRkFfSU5URVJSVVBUIGFzIHN1cHBvcnRlZA0KPj4gLSBn
YXRlIG1lc3NhZ2UgQUJJcyBvbiBmaXJtd2FyZSBzdXBwb3J0Og0KPj4gLSBGRkFfTVNHX1NFTkRf
RElSRUNUX1JFUV97MzIsNjR9DQo+PiAtIEZGQV9NU0dfU0VORF9ESVJFQ1RfUkVRMiAoYWxzbyBy
ZXF1aXJlcyBGRi1BIDEuMiBuZWdvdGlhdGlvbikNCj4+IC0gRkZBX01TR19TRU5EMiAob3IgVk0t
dG8tVk0gZW5hYmxlZCkNCj4+IC0gcmVwb3J0IE1FTV9TSEFSRV97MzIsNjR9IG9ubHkgd2hlbiBG
RkFfTUVNX1NIQVJFXzY0IGlzIHN1cHBvcnRlZA0KPj4gLSBzdG9wIGFkdmVydGlzaW5nIEZGQV9N
U0dfWUlFTEQgKG5vdCBpbXBsZW1lbnRlZCkNCj4+IA0KPj4gVXBkYXRlIGZpcm13YXJlIHByb2Jp
bmc6IGRyb3AgRkZBX01FTV9TSEFSRV8zMiBjaGVja3MgKGRlcHJlY2F0ZWQpIGFuZA0KPj4gYWRk
IEZGQV9SWF9BQ1FVSVJFIHRvIHRoZSBwcm9iZWQgc2V0LiBJZiBGRkFfTVNHX1NFTkQyIGlzIHJl
cG9ydGVkIGJ1dA0KPj4gRkZBX1JYX0FDUVVJUkUgaXMgbm90LCBhc3N1bWUgUlhfQUNRVUlSRSBz
dXBwb3J0IGFuZCB3YXJuIHRvIHdvcmsNCj4+IGFyb3VuZCB0aGUgSGFmbml1bSBidWcuDQo+PiAN
Cj4+IEZ1bmN0aW9uYWwgaW1wYWN0OiBndWVzdHMgbm93IHNlZSBBQkkgc3VwcG9ydCB0aGF0IHJl
ZmxlY3RzIGZpcm13YXJlDQo+PiBjYXBhYmlsaXRpZXMgYW5kIFhlbiBpbXBsZW1lbnRhdGlvbiBz
dGF0dXMuIFdoZW4gU0VORDIgaXMgcHJlc2VudCBidXQNCj4+IFJYX0FDUVVJUkUgaXMgbm90IHJl
cG9ydGVkLCBYZW4gYXNzdW1lcyBSWF9BQ1FVSVJFIHN1cHBvcnQuDQo+PiANCj4+IFNpZ25lZC1v
ZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+IC0t
LQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmEuYyB8IDYyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLQ0KPj4gMSBmaWxlIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2Zm
YS5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4gaW5kZXggNmRlMmI5ZjhhYzhlLi5lOWUw
MjBiYjBjYjMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiArKysg
Yi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiBAQCAtOTEsMTAgKzkxLDEwIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZmZhX2Z3X2FiaSBmZmFfZndfYWJpX25lZWRlZFtdID0gew0KPj4gICAgIEZX
X0FCSShGRkFfUEFSVElUSU9OX0lORk9fR0VUKSwNCj4+ICAgICBGV19BQkkoRkZBX05PVElGSUNB
VElPTl9JTkZPX0dFVF82NCksDQo+PiAgICAgRldfQUJJKEZGQV9OT1RJRklDQVRJT05fR0VUKSwN
Cj4+ICsgICAgRldfQUJJKEZGQV9SWF9BQ1FVSVJFKSwNCj4+ICAgICBGV19BQkkoRkZBX1JYX1JF
TEVBU0UpLA0KPj4gICAgIEZXX0FCSShGRkFfUlhUWF9NQVBfNjQpLA0KPj4gICAgIEZXX0FCSShG
RkFfUlhUWF9VTk1BUCksDQo+PiAtICAgIEZXX0FCSShGRkFfTUVNX1NIQVJFXzMyKSwNCj4+ICAg
ICBGV19BQkkoRkZBX01FTV9TSEFSRV82NCksDQo+PiAgICAgRldfQUJJKEZGQV9NRU1fUkVDTEFJ
TSksDQo+PiAgICAgRldfQUJJKEZGQV9NU0dfU0VORF9ESVJFQ1RfUkVRXzMyKSwNCj4+IEBAIC0y
NDAsMTkgKzI0MCwzOSBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfZmVhdHVyZXMoc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgc3RydWN0IGZmYV9jdHggKmN0eCA9IGQtPmFyY2gudGVl
Ow0KPj4gICAgIHVuc2lnbmVkIGludCBuOw0KPj4gDQo+PiArICAgIC8qDQo+PiArICAgICAqIFhl
biBkb2VzIG5vdCBhY2NlcHQgYW55IG5vbi16ZXJvIEZGQV9GRUFUVVJFUyBpbnB1dCBwcm9wZXJ0
aWVzIGZyb20NCj4+ICsgICAgICogVk1zLiBUaGUgc3BlYyBvbmx5IGRlZmluZXMgdzIgaW5wdXQg
cHJvcGVydGllcyBmb3IgRkZBX01FTV9SRVRSSUVWRV9SRVENCj4+ICsgICAgICogKE5TLWJpdCBu
ZWdvdGlhdGlvbiBmb3IgU1AvU1BNQykgYW5kIEZGQV9SWFRYX01BUCAoYnVmZmVyIHNpemUgYW5k
DQo+PiArICAgICAqIGFsaWdubWVudCksIHNvIHcyIG11c3QgYmUgTUJaIGZvciBvdXIgY2FsbGVy
cy4NCj4+ICsgICAgICovDQo+IA0KPiBUaGUgc3BlYyAodmVyc2lvbiAxLjIpIGxpc3RzIHRoZW0g
YXMgU0JaLCBleGNlcHQgZm9yIHcyLCB3aGljaCBpcyBNQlosDQo+IGZvciBGZWF0dXJlIElEcy4N
Cg0KVmVyeSB0cnVlLCB0aGlzIHNob3VsZCBvbmx5IGNoZWNrIHcyIHdoaWNoIGlzIGFueXdheSBk
ZWZpbmVkIGFzIE1CWiB3aGVuDQpub3QgdXNlZC4NCnczLXc3IHdlcmUgTUJaIGluIHByZXZpb3Vz
IHZlcnNpb25zIG9mIEZGLUEgYnV0IGFyZSBpbiBmYWN0IFNCWiBpbiAxLjIgc28NCndlIHNob3Vs
ZCBpZ25vcmUgdGhlbQ0KDQo+IEhvd2V2ZXIsIGlmIHdlJ3JlIHRvIHJldHVybiBhbiBlcnJvciwg
aW52YWxpZCBwYXJhbWV0ZXJzIGlzIGEgYmV0dGVyIGNob2ljZS4NCg0KSW4gZmFjdCB0aGUgc3Bl
YyBpcyBhY3R1YWxseSBzYXlpbmcgdGhlIGZvbGxvd2luZzoNCklmIHRoZSBGRi1BIGludGVyZmFj
ZSBvciBmZWF0dXJlIHRoYXQgd2FzIHF1ZXJpZWQgaXMgbm90IGltcGxlbWVudGVkIG9yIGludmFs
aWQsDQp0aGUgY2FsbGVlIGNvbXBsZXRlcyB0aGlzIGNhbGwgd2l0aCBhbiBpbnZvY2F0aW9uIG9m
IHRoZSBGRkFfRVJST1IgaW50ZXJmYWNlDQp3aXRoIHRoZSBOT1RfU1VQUE9SVEVEIGVycm9yIGNv
ZGUuDQoNClNvIHRoZXJlIGlzIG5vIGNhc2UgZm9yIElOVkFMSURfUEFSQU1FVEVSLg0KDQpTbyBp
biBmYWN0IGkgc2hvdWxkOg0KLSByZXR1cm4gTk9UX1NVUFBPUlRFRCBpZiB3MiBpcyBub3QgMA0K
LSBpZ25vcmUgdzMtdzcNCg0KQ2FuIHlvdSBjb25maXJtIHRoYXQgeW91IGhhdmUgdGhlIHNhbWUg
cmVhZGluZyBvZiB0aGUgc3BlYyB0aGFuIG1lID8NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo=

