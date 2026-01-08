Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E7D017D4
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 09:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197353.1514908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdkwH-0007M4-0C; Thu, 08 Jan 2026 08:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197353.1514908; Thu, 08 Jan 2026 08:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdkwG-0007JD-T8; Thu, 08 Jan 2026 08:00:12 +0000
Received: by outflank-mailman (input) for mailman id 1197353;
 Thu, 08 Jan 2026 08:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9CW=7N=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vdkwG-0007J7-2A
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 08:00:12 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0df96766-ec68-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 09:00:10 +0100 (CET)
Received: from DU7P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::29)
 by AS8PR08MB8875.eurprd08.prod.outlook.com (2603:10a6:20b:5b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 08:00:04 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::70) by DU7P195CA0006.outlook.office365.com
 (2603:10a6:10:54d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 08:00:03 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Thu, 8 Jan 2026 08:00:04 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV2PR08MB11465.eurprd08.prod.outlook.com (2603:10a6:150:2a7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 07:59:01 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 07:59:01 +0000
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
X-Inumbo-ID: 0df96766-ec68-11f0-b15e-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VL9REVPG5Fsqj802+Qp4K42959tpu02kVZ7wCWYUNlAfmP5WjEWOOfaQYRpA+lLrCwuc1eNkdi8RpWfCIq/MitNHTiO951O7vlDLamvkk+eymYUfIPenPBbmBunlANE80nkJXFajgJKStf3tykBRN973YOC0NPXANDuSDVpNiL4vEEFBx+ZM+jmDlKOdRUnio7QH/cXtbBhJbIpohCzxRhnm5JyfpqQgUiAGB8WWWobsxQkgNMenRburyDKGmzCFcF3PW2jCtyIXGLu3B6xhLGF43pw9RrW6dviHXmBE9xFovfjNwJ6l4IQmx08ma3rfoKyNHLUwUrlznw9AaguOig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Jl/nn6qt/nzdN9u1StQlIPKyXWCbxTkqoe0eDWh5MM=;
 b=bXQw3Sq0a3GiF0xU9KckHw1Lt76m8HowYsMDLFB8DUivZArNHzY/stoD2qAWHs8sc39HdHAuztdy7y705rQF843o8EYY3vi7Ehgn8c4/rGQgsn/CHgxxbSnENfBqlBCr7WtQ51VBy5pCbQGgyqHlIgzmeuOt9Dagm2yCigApAGnif/tsmZ6Nope3xYOdisfw/3pui7d5rycHIqg4/9n0BZsKgp9PXLRYO+pmlK8nOHBOwi2h/qki5yIaTDp/TUAm5oSs/76sjULBFCFjDVf/0UVbzIC48xuf4hk2TZu/TJkfxZ0LBeXxMDpOqvZOZQW8dw4VpfxWWLFOKxVmlOVyEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Jl/nn6qt/nzdN9u1StQlIPKyXWCbxTkqoe0eDWh5MM=;
 b=d5DAN0BNshj3fnazssDDbTK9p1AEZnFA5HFRCopOeH3nptL45LcBfciRIm004SxIDwHTE/MNfOpmSuumABgrTrFK12nZYuqoU5kP20FdinmCmSLxwfhGuQyj/XhpgpMBTU+JodULn+crPb8meyPdoRHcMxVA723OxdFBpoNpEQ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SP4zfYJbdMbfgBxZ/AkCw2SUL6G5vhz8TI7+ryB0wIogc/uGACHkj7we/uZyx2lhHxHOZT2ysqglbu4tmSL2YHrwKLEtT9sNKfDhGeCCUoOwX4jeb4/cgWPTDKdohdfEqod6CPW8p4hug2WQnK00o+6pwghP/KQjUv50CIUXExe7XOwhpYX3gJRZFU63idWSw3I1mI6rEAmoGMY85JVr7+wxE+XKqYY+4zcs9/IENd94HNzlcxPccKCUL5/sLMRmCyFNc3fHHAnZx0WprKTapsazbveaL0IPcQP+F1B/8sVp9sl7PjgYo2uqOu7ltMU3YE8/nfpdAHrZDDUjk3jp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Jl/nn6qt/nzdN9u1StQlIPKyXWCbxTkqoe0eDWh5MM=;
 b=nTE/GEj7/aIiU6OBlC51m0NrmULaAA6Zy12IWr9T5Crs5NxTFB1bbgH3P4I8qeGs6iI3ftnV+jJObgaVx4+VWJ22omRtWNrKg1dYs2ADDlfWwR7TAzEDwlMidGnniQbFaCoDjNT+5iLXaOn+aipT74wS0sP5wU5YBMyUSRgk+jJ/R5lrudgrP361MEYcXM4CMMAm7cg3oGlElLIg5Gk968RbyAkDJU5zzPfDSwsYKXHSa6awqhJUGnapTRdL1OOIUIiZlfRZJ4dWLWxcNXJ3OJwhyiailhyQ9LQKUT/ebqriqsRPm4pCPJTxGVnBALzp17WlCdmy5gvPlNcEgdWxWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Jl/nn6qt/nzdN9u1StQlIPKyXWCbxTkqoe0eDWh5MM=;
 b=d5DAN0BNshj3fnazssDDbTK9p1AEZnFA5HFRCopOeH3nptL45LcBfciRIm004SxIDwHTE/MNfOpmSuumABgrTrFK12nZYuqoU5kP20FdinmCmSLxwfhGuQyj/XhpgpMBTU+JodULn+crPb8meyPdoRHcMxVA723OxdFBpoNpEQ8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
CC: "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 00/12] xen/arm: ffa: FF-A v1.2 support
Thread-Topic: [PATCH v2 00/12] xen/arm: ffa: FF-A v1.2 support
Thread-Index: AQHcbdIZ54xp46f98kibMufFF0ZVibVIDZyA
Date: Thu, 8 Jan 2026 07:59:01 +0000
Message-ID: <2FA52A4C-98F2-4066-8BE7-36F37093FCD6@arm.com>
References: <cover.1765807707.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1765807707.git.bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV2PR08MB11465:EE_|DB5PEPF00014B9B:EE_|AS8PR08MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bbd54e4-8b1b-41f3-bed2-08de4e8bee82
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TzFwVG8zSTJUV3JpVk1wSjBOVnNjTVZvaC9pbTZIZzBuYzZjdTN0bGJwRlox?=
 =?utf-8?B?ZFptVGljdy9hOG9DWmdBYzZpZzBEMllXWU92OXNHY3JRL2F3bHJNM0R5NFJv?=
 =?utf-8?B?Qk5YMXp6MXpGYmlwRkUyek03Q3ZiSWRrQlN4czVDNmluOXB0dHdPL1pISWl0?=
 =?utf-8?B?TTRJK0NVVitVTllKSGoxbzNkd3N0aVZPM3FiU0doM1V2djdVRDZxYitFOFpH?=
 =?utf-8?B?dmNUeC92N1Fhb3FEQzFrRVJvQUp6cTJRTC82ZlQwMDl0TkQ2aSt0Y0xTblBF?=
 =?utf-8?B?VldDSGFKYUJMaklHZHFRV09zMjdLM3pyZVJSSzlySDBDWGF0MDdpQUo2OVhv?=
 =?utf-8?B?QTZFSHhFeitDaHRXdG9PWjFTNlk0dEFpM0E1L2JzeHNSaXEveTh2TGVqTHZn?=
 =?utf-8?B?aEZOSktqVWhBT2I5YWJLRG9wdnN2UFVZNHRlRHNCVnJ4aDA1UVBRZVJ6aHIv?=
 =?utf-8?B?cEVkWERSWXNGZzhoNFpUT084QS9ZZmdzQmNYaU1UUENYNkdCZ24ranFvZzhE?=
 =?utf-8?B?NHhVcDlPZlZFUDZuZjFnd3N0dE1kdkFVQnEzMWk3WUt3Z1BWRExOaXIvSlZv?=
 =?utf-8?B?M1lHTyt5YUFCOUJLbkFLaEl1KzZRWVh6dTM2MjhLcmRTT2F5YUV1bUt2WTBq?=
 =?utf-8?B?aFg4YmE1R0dGSFBGTW9lZVcyUGV5TUlFM2o4dXlFdHhoNkNkMDlqaFpmQ0JJ?=
 =?utf-8?B?d1d5Y0c5dXpXUi85bFhESDVMdysvaXRTcGFJTlZ6NWYwbEpob1QrYnZQaTlW?=
 =?utf-8?B?ZWpGZTNyNjRWeVJWc1UrQXc1eWplSjBMWHNJeGpZSHc4NVM0YlFqdGd4Z1Zv?=
 =?utf-8?B?ai93eVZ0aUkyKzVJUXgxaGUwc0ZrNzJMenhPRDRoSDMweURPdG1SSlU3Z0Jt?=
 =?utf-8?B?RWdFL2NHaTRwQWhxT1lVR0pwQ0x3SVR0S0ozWHF2bDBrYlhTOS9LVGlKQkVv?=
 =?utf-8?B?bFo5WERxVGxqdHpqYXluZC9Sa2hISVdweDdibWhQV2ZTSXVCNlVvcnBIRnJp?=
 =?utf-8?B?T0oxZjBjOE8rMDJoM3ZQSDVPUEZIdmplbHJWdHJIb1plSTBFaFB3V0xwek5p?=
 =?utf-8?B?WnVLblNkMHluSEFORnFIaktUMUJRZndYd2trcE8zbjZ2RXIwQWp0RUkzcUlZ?=
 =?utf-8?B?LzBwTGhPbi85MVY2bTVLRjVOeWduMVhLVmxBaHZPUTZ3czBDQTBRNXBpRDE2?=
 =?utf-8?B?SWxkeUxFVjFnci9sWU9iWDEvaERJYWhtaWJoRTlwT0F2OUJqTDRzU1lzVEpq?=
 =?utf-8?B?V1NFWUQySHk3VGIvUzArb2tDQ1p1L2JpWlA3Vis3dVBUeXgyYSsrUVd4cDZW?=
 =?utf-8?B?cWVqNGk4TWJGSTFjY2NzKzR4NHNHTHhRa3YzWlJTbnFWS3FQWk9KNytkN1JV?=
 =?utf-8?B?Vjk4VVBtekZmNkN3VG5GZStFcERuUjMwNGNlWEE1ZkljMFVScW15MmRoelZ4?=
 =?utf-8?B?VnJvNzA0RXFHYjdGNXVwVWtmY3FISXI5czZkT2pZSWJ3ZjN1dUZrU2pjeDdC?=
 =?utf-8?B?OTdSWk1DNm8zcmpEOVJUUml5SC9GMDJjZmM5K3BEek5wYVlqSGFadVBla1o5?=
 =?utf-8?B?dlB4Q25qR0szeFpnYnIrK1Z2MzBVWG1USndyZFhha1ZsQ0dHQ2x6MGhzU0xN?=
 =?utf-8?B?RlM3Q0xUMWZDQXFvMmNPSmptcHAwVE83eXY5ZW5HeC9Fc0F6RytQUGNGMmJW?=
 =?utf-8?B?MXhuUXlJdTV2enprdGZmSlV3STdGYlZrZ2preFRoWjdzandZaUdHazdScWJU?=
 =?utf-8?B?aGFNdityczM1VWRYeHI1M2lVZ2lKVG1xVjlwNnowakdwc0J0bDhYbVpQZTh5?=
 =?utf-8?B?QmRpeC9jejFwV2xoYUlRYmZPZjJBL1FNZlN4SlFYeVV4Z1VWOGpYVXJDVXU4?=
 =?utf-8?B?SlFDSXRhS0F0VHhsb0VmSFE0R1REaHFHRnhkcjg5SGpHaGk4SG4waTRTN1hn?=
 =?utf-8?B?MFp6L2FUUlBYU1JDSUR0U1lNVkg3aUJTWm4zWDF3WEhqUUJyYnNvZE0vN3g1?=
 =?utf-8?B?NmtXTnNIWXV2ZlQzRXhkY05kdWNWOUJDVzFwcmZBaWJFR1pOcCtaYUNIOUlB?=
 =?utf-8?B?azBkMjZyK2pJbUZpNEtFRkd0QUJqS0FET0hjdz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C38EF5001B25A498F4F88FBE3B4DB4C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11465
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae5da050-129d-458b-ac2a-08de4e8bc919
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|14060799003|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVFvSnZTRmNvaGpqUUpLNWgrQ0NqT0J3T01UVDkvQXp6Y3ZnZmIvWjFYRnRs?=
 =?utf-8?B?ME5ncWNxSnpTM3VydWI3Z1RTOTdvTjNYVUJJc0NkMVptQzdCQXNPMTJ3NW5Z?=
 =?utf-8?B?SGNJSFRxeW04dU1oVllLS21wRVd4eTQzeTFsdURUektpb3pMcWNQS3Y0MjhZ?=
 =?utf-8?B?M2xJN24vUDErL2tydUs4L09UL2xvS0psclh2NEVqQ0tZdnNDYmV2M05jZjhP?=
 =?utf-8?B?cGJxTzdObit3ek1nWC9hSUR4RE5DTnVROXYrRThMb1YxZ1R3UzErcmsxcVQr?=
 =?utf-8?B?MHRXcmVBMitFK0sxazVqTE9UU2lIcHJreVN2bE9Gb2hWZ1hMYlJYTzB5YWwr?=
 =?utf-8?B?V3FiTVNKOU9WUWhKMVNCUFhQVUMvZWNtREVXUTU5bXpZSjNTT3NUaUo4MTF4?=
 =?utf-8?B?cGdYMTBTazRyZ3VQaVJUR0JDRmIrZUZoVXVJamZTbXZBbVphT1kzRUFtOC9U?=
 =?utf-8?B?a2FPTzRsRVFVbDMzaFQ5bXBza1poUEY5WjRJY3NQOENLcVJYWkw4U1NDakUz?=
 =?utf-8?B?Y1ZDRkpycEoySlVYclZYRXhSTnV2YzN1Y0RNN2ZoWnYyRitVRUZqRWhBR2Fp?=
 =?utf-8?B?d2xXTHNhYS91OW1ZVjNWenpjbEwvVlVyQ2lvVlViVlovQytQQi9hbjdSQWt2?=
 =?utf-8?B?WDZSaDhkbTNYSHhMSk9oWVRUVFhjcDd0Y3IzbXlTelNIT1R3NDYrK0UwYWdh?=
 =?utf-8?B?dnNGcFRvcWdKOW1hWFFqWjJ0TmJ1aEJjSHlobU9XMmQzZTExeWVmcDZRMk5M?=
 =?utf-8?B?bVkzcjBoRzRrZzVqNGNsQURMNkJkOGUzaCszVUNySmJaaDQ2aEFmejBhMFFG?=
 =?utf-8?B?OFZmODdDMmd1ZnpjaHVYSnBSZ2JGMVJmM2h3d05JSXNIM1Zsc29WVlBqUjhk?=
 =?utf-8?B?NDNlL3NPczdzTXhlMm1seHBITUxIWnZjUEMwdHRWOERpazV0RTdSbVZ0TS9x?=
 =?utf-8?B?YXAvQis3YU51bFpnZXpKck96SEZlVHFIZDU2TkVDV1piclJXK09TTzRIdlFs?=
 =?utf-8?B?aUpoa3dnVTY4QldTMnp0ODhVSm85dE1mdWsvZUp1cUduSDlzVEpvUzFtSHZD?=
 =?utf-8?B?WUJERS8vdGdSejI3MlJLa2IwMy9VMDAyNmpHWmRoTTdhK2FjTGRMVUxOTm01?=
 =?utf-8?B?YVdmaFNEakkzU1FGQjV1eEpqeGdpSUp0NFpOMWU2QVRiZlQ4UldEYUVFbmpt?=
 =?utf-8?B?M2szbmtNNHdDQVYxY2U3YjFKakoyMzhIU0xiSVE0RlE5YklHZ29pQ1hkeUNa?=
 =?utf-8?B?S3hmNlRJZTVseUhZZnpORkFGOGJIZ1hMZC9TakxJRjEwU1RjUVVVTFdYdUVD?=
 =?utf-8?B?Q2YyUmJTZXRlSy8wN3NPdmFGYTVOczVZQkRZdGNQZ3NkMHlhRFc2SWdoS1Rz?=
 =?utf-8?B?OWZ3cGxrWDg4SDB6bDFuRWpBMTdwTEZQU0QvVHJkZDZIalk3MytzSVRJSEpj?=
 =?utf-8?B?NWtqd01wc0NPdm9TT09PVk5pNGxON05CckFEQ0pwSjJwcXhkZ1MySW90TVFZ?=
 =?utf-8?B?MzhrRDllVWpLWC92THpucElYL3VFQWk4QVhJK3pZMlpySXFlUkM5YUV5WkxU?=
 =?utf-8?B?b0l1UVpMN1lMMEtmTzc4ZjEydHFGL0tjUjhOZnAxczJ0V3NSYUxSZnAvNGg3?=
 =?utf-8?B?YkhEYU9Vd1pvdi9ZaCtObzA0cjFsVldZOGdLRkV2S29STGJ4T1l5UDduK1ly?=
 =?utf-8?B?TVl0Yk1QSTBVRDNWVnJZdC90QU5SSlN2dVJqc0dyUTVqa0JBc3RTckhTRzlL?=
 =?utf-8?B?VFZiRFNZVk1ldzhoOFVTVTgzeFkvTUVHQ2x3bkc2dEtzWjJvSFF3NkZRbEVG?=
 =?utf-8?B?MFBUU3dxdUsvOWdUdXZFMVp2UmIzOVlRR3hubS83OE9iNEk3RGZrMzB6dFRK?=
 =?utf-8?B?dGh2dWpJS1hvVE9yTDk4QkFDQ3VzMDBsWUxMaVZBbjVYZ2h4NFdnS1FpK05D?=
 =?utf-8?B?cE9lbm41amVkSFd6TXg1N01FYkY1aDVMSjY2NVBxak9HZ3FEOTR3cjdZODQy?=
 =?utf-8?B?VVg1SHcrMFVoRmdob1VHRjFPclN6bXdRZ1ZXWlBJWjV4UGNDY3dwT3d6ZkRY?=
 =?utf-8?B?SHliS2JORW9MZDZ5dlhucUFMMGtkSVFqbllvenNCaHNzUi9PS1JhcitNS2F3?=
 =?utf-8?Q?YbwPUt4JlxBgPl7Y5WOJCrTuI?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(14060799003)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:00:04.1010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbd54e4-8b1b-41f3-bed2-08de4e8bee82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8875

SGksDQoNCkdlbnRsZSBwaW5nOiBUaGlzIHNlcmllIGhhcyBiZWVuIGZ1bGx5IHJldmlld2VkIGJ5
IEplbnMgYW5kIHdvdWxkIG5lZWQgYSBtYWludGFpbmVyIGFjayBvciByZXZpZXcuDQoNCkNoZWVy
cw0KQmVydHJhbmQNCg0KPiBPbiAxNSBEZWMgMjAyNSwgYXQgMTU6NDksIEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGlzIHNlcmllcyB1
cGRhdGVzIFhlbuKAmXMgRkYtQSBtZWRpYXRvciBvbiBBcm0gdG8gaW1wbGVtZW50IHRoZSBGRi1B
DQo+IHYxLjIgaW50ZXJmYWNlIHdoaWxlIGtlZXBpbmcgZXhpc3RpbmcgdjEuMC92MS4xIGd1ZXN0
cyB3b3JraW5nLg0KPiANCj4gUGF0Y2hlcyAx4oCTNyByZXdvcmsgdGhlIGxvdy1sZXZlbCBwbHVt
YmluZzoNCj4gDQo+ICAxKSBhZGQgdGhlIEZGLUEgdjEuMiBmdW5jdGlvbiBJRHMgYW5kIHByb2Jl
IHRoZSBuZXcgQUJJcw0KPiAgMikgdHJhY2sgcGVyLVZNIEZGQV9WRVJTSU9OIHN0YXRlIGFuZCBl
bmZvcmNlIG5lZ290aWF0aW9uDQo+ICAzKSBGaXggaXNfNjRiaXQgaW5pdGlhbGlzYXRpb24NCj4g
IDQpIGhhcmRlbiBSWC9UWCBtYXBwaW5nIGFuZCB2YWxpZGF0aW9uDQo+ICA1KSByZXdvcmsgU1BN
QyBSWC9UWCBidWZmZXIgbWFuYWdlbWVudCBzbyBhY2Nlc3MgaXMgc2VyaWFsaXplZCBhbmQNCj4g
ICAgIFJYIGJ1ZmZlcnMgYXJlIGFsd2F5cyByZWxlYXNlZCBiYWNrIHRvIHRoZSBTUE1DDQo+ICA2
KSByZXdvcmsgVk0gUlgvVFggYnVmZmVyIHRvIGhhdmUgZ2VuZXJpYyBhY3F1aXJlL3JlbGVhc2Ug
ZnVuY3Rpb24NCj4gICAgIGVxdWl2YWxlbnQgdG8gU1BNQyBhY2Nlc3MgZnVuY3Rpb25zDQo+ICA3
KSBzd2l0Y2ggdGhlIG1lZGlhdG9yIHRvIHNwZWMtY29tcGxpYW50IHNpZ25lZCAzMi1iaXQgc3Rh
dHVzIGNvZGVzDQo+IA0KPiBQYXRjaGVzIDjigJMxMSB1cGRhdGUgdGhlIGRhdGEgc3RydWN0dXJl
cyBhbmQgZGlyZWN0LWNhbGwgcGF0aHM6DQo+IA0KPiAgOCkgYWRkIGZmYV91dWlkIGhlbHBlcnMg
YW5kIHJld29yayBwYXJ0aXRpb24taW5mbyBoYW5kbGluZw0KPiAgOSkgYWRkIEZGQV9SVU4gc3Vw
cG9ydA0KPiAgMTApIGFkZCB0aGUgdjEuMS92MS4yIFNFTkQyIGhlYWRlciBsYXlvdXQNCj4gIDEx
KSBhZGQgTVNHX1NFTkRfRElSRUNUX1JFUTIvUkVTUDIgc3VwcG9ydCBhbmQgbWFyc2hhbCB0aGUg
ZXh0ZW5kZWQNCj4gICAgIHJlZ2lzdGVyIHNldCBmb3IgdjEuMiBndWVzdHMNCj4gDQo+IFBhdGNo
IDEyIHRpZ2h0ZW5zIHRoZSBkaXNwYXRjaGVyIGFuZCBhZHZlcnRpc2VzIEZGLUEgdjEuMjoNCj4g
DQo+ICAtIHJlamVjdCBTTUNDQzY0IGNhbGxzIGZyb20gQUFyY2gzMiBndWVzdHMNCj4gIC0gZXhw
b3NlIFJYL1RYIGNhcGFjaXR5IGZpZWxkcw0KPiAgLSBidW1wIFhlbidzIEZGLUEgdmVyc2lvbiB0
byAxLjIgb25jZSB0aGUgaW1wbGVtZW50YXRpb24gaXMgY29tcGxldGUNCj4gDQo+IHYxLjAvdjEu
MSBndWVzdHMgY29udGludWUgdG8gdXNlIHRoZSB2MS4xIEFCSSB3aXRob3V0IGJlaGF2aW91ciBj
aGFuZ2VzLA0KPiB3aGlsZSB2MS4yIGd1ZXN0cyBjYW4gbmVnb3RpYXRlIHRoZSB3aWRlciBBQkkg
YW5kIHVzZSBSVU4sIFNFTkQyLCBhbmQNCj4gRElSRUNUX1JFUTIvUkVTUDIgd2l0aCB0aGUgZXh0
ZW5kZWQgcmVnaXN0ZXIgc2V0Lg0KPiANCj4gVGhpcyBzZXJpZSB3YXMgdmFsaWRhdGVkIHRocm91
Z2ggZ2l0bGFiLWNpIGhlcmU6DQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9w
bGUvYm1hcnF1aXMveGVuLWZmYS1yZXNlYXJjaC8tL3RyZWUvZmZhLXYxLjIvdjINCj4gQnVpbGQg
cGlwZWxpbmUgZm9yIHRoZSBzZXJpZToNCj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0
L3Blb3BsZS9ibWFycXVpcy94ZW4tZmZhLXJlc2VhcmNoLy0vcGlwZWxpbmVzLzIyMTU0NjY5NjUN
Cj4gDQo+IENoYW5nZXMgc2luY2UgdjE6DQo+IC0gUmViYXNlIG9uIHN0YWdpbmcNCj4gLSBSZW1v
dmUgaW52YWxpZCBBU1NFUlQgaW4gcGF0Y2ggNQ0KPiAtIEFkZCBleHRyYSBjb21tZW50IHRvIHVz
ZSBBQ0NFU1NfT05DRSBmb3IgZ3Vlc3RfdmVycyBpbiBwYXRjaCAyDQo+IC0gQWRkIEplbnMgUi1i
IGluIG90aGVyIHBhdGNoZXMNCj4gDQo+IENoYW5nZXMgc2luY2UgdjA6DQo+IC0gUmV3b3JrIHZl
cnNpb24gbmVnb3RpYXRpb24gdG8gcHJldmVudCBjb25jdXJyZW5jeSBpc3N1ZXMNCj4gLSBJbnRy
b2R1Y2UgcGF0Y2ggMyB0byBmaXggYW4gaW5pdCBidWcNCj4gLSBJbnRyb2R1Y2UgcGF0Y2ggNSB0
byBtYWtlIFZNIFJYL1RYIGJ1ZmZlciBhY3F1aXJlL3JlbGVhc2Ugd29ya2luZyBpbg0KPiAgdGhl
IHNhbWUgd2F5IGFzIFNQTUMgUlgvVFggYnVmZmVycw0KPiAtIG1pbm9yIGZpeGVzIGRlc2NyaWJl
ZCBpbiBlYWNoIHBhdGNoIGNoYW5nZWxvZw0KPiANCj4gDQo+IEJlcnRyYW5kIE1hcnF1aXMgKDEy
KToNCj4gIHhlbi9hcm06IGZmYTogYWRkIEZGLUEgdjEuMiBmdW5jdGlvbiBJRHMNCj4gIHhlbi9h
cm06IGZmYTogcGVyLVZNIEZGQV9WRVJTSU9OIG5lZ290aWF0aW9uIHN0YXRlDQo+ICB4ZW4vYXJt
OiBmZmE6IEZpeCBpc182NGJpdCBpbml0DQo+ICB4ZW4vYXJtOiBmZmE6IGhhcmRlbiBSWC9UWCBt
YXBwaW5nDQo+ICB4ZW4vYXJtOiBmZmE6IHJld29yayBTUE1DIFJYL1RYIGJ1ZmZlciBtYW5hZ2Vt
ZW50DQo+ICB4ZW4vYXJtOiBmZmE6IHJld29yayBWTSBSWC9UWCBidWZmZXIgbWFuYWdlbWVudA0K
PiAgeGVuL2FybTogZmZhOiB1c2Ugc2lnbmVkIDMyLWJpdCBzdGF0dXMgY29kZXMNCj4gIHhlbi9h
cm06IGZmYTogYWRkIFVVSUQgaGVscGVycyBmb3IgcGFydGl0aW9uIGluZm8NCj4gIHhlbi9hcm06
IGZmYTogQWRkIEZGQV9SVU4gc3VwcG9ydA0KPiAgeGVuL2FybTogZmZhOiBhZGQgdjEuMiBTRU5E
MiBoZWFkZXIgbGF5b3V0DQo+ICB4ZW4vYXJtOiBmZmE6IGFkZCBNU0dfU0VORF9ESVJFQ1RfUkVR
MiBzdXBwb3J0DQo+ICB4ZW4vYXJtOiBmZmE6IGFkdmVydGlzZSBGRi1BIHYxLjINCj4gDQo+IHhl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS90ZWUvZmZhLmggfCAgIDMgKy0NCj4geGVuL2FyY2gvYXJt
L3RlZS9mZmEuYyAgICAgICAgICAgICB8IDIwMiArKysrKysrKysrKysrKysrLS0tLS0tDQo+IHhl
bi9hcmNoL2FybS90ZWUvZmZhX21zZy5jICAgICAgICAgfCAyMzIgKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQ0KPiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jICAgICAgIHwgIDE0ICstDQo+
IHhlbi9hcmNoL2FybS90ZWUvZmZhX3BhcnRpbmZvLmMgICAgfCAyNjMgKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0NCj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oICAgICB8IDE1
NCArKysrKysrKysrKy0tLS0tLQ0KPiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9yeHR4LmMgICAgICAg
IHwgMjM3ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+IHhlbi9hcmNoL2FybS90ZWUvZmZh
X3NobS5jICAgICAgICAgfCAgNTIgKysrLS0tDQo+IDggZmlsZXMgY2hhbmdlZCwgODI3IGluc2Vy
dGlvbnMoKyksIDMzMCBkZWxldGlvbnMoLSkNCj4gDQo+IC0tIA0KPiAyLjUxLjINCj4gDQo+IA0K
DQo=

