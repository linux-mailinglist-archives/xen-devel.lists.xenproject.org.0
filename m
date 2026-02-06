Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DNLLD2ihWlKEAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 09:11:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03333FB4A1
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 09:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222882.1530561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGvn-0006tM-5H; Fri, 06 Feb 2026 08:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222882.1530561; Fri, 06 Feb 2026 08:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGvn-0006qg-20; Fri, 06 Feb 2026 08:11:11 +0000
Received: by outflank-mailman (input) for mailman id 1222882;
 Fri, 06 Feb 2026 08:11:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1voGvl-0006qa-Ce
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 08:11:09 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62e8fe5e-0333-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 09:11:06 +0100 (CET)
Received: from DU7P250CA0001.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::23)
 by DU0PR08MB9903.eurprd08.prod.outlook.com (2603:10a6:10:470::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 08:11:00 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::f4) by DU7P250CA0001.outlook.office365.com
 (2603:10a6:10:54f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 08:11:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 08:10:59 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PA4PR08MB6176.eurprd08.prod.outlook.com (2603:10a6:102:ea::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:09:55 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:09:54 +0000
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
X-Inumbo-ID: 62e8fe5e-0333-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TofQlYGmaJ/WQVYj68ci6Xzk6ANQWLa357j1gnjFRmcvfbfpqtb/6zUqGrqx65hJg/c/HYG+UH29ik9qN4E9uedMsAnKLr0arWDNx4tsB4Rtrk5ZVLyuSBZMoXNQ1+19Oc211lsT+lDNgjFo45KT8faeuD27/2s8Tzuvcf8zTMcSF7N051C0EUsgvqW40sPm0b18IrvETM73jMh4jVhlIlv3wWSuOf3pkCu7rEP4P1r9Rxxn53w5Rf7tpsEgM7cVXq29EWLWi0rqAZPtgMxmeCNudWVoguRuZRLk0mYuh6w1IVBzZJl1Cf5zRJDz7JXjEDwh1c4PiUqnbMHWky0ZXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Rabjhhvd83tr7aWZzIR0w55EB/7Bw+hHmRK29bmjAM=;
 b=ps+KL1/qlPGxIKD8u/5CihTzOEl4ERJWoU3EpAar2Gc8iOEqhczLvgk0fNTcZds8p04Idr3YDo9Z/UAMZqNklvLv35oOJbU24CRx1+aYdR7zYnwpl4Z5iOAWN6K9awfWw8sOwrZk1NPAFNAjWhEmxeWS3NNrOtxMGCdM+ZzijvRD1SrtS+aPxOQOgaSRcM30/cL+w5TAiJUTiCcvnU7SYL7l9NVu0VPZHmkpnkRarM6QLii53hiW30h4uNtsiDZBJ92QYOSxX1p4QmbtwTmBY/ddES14U2XHxkVxv4DNSs2iQ5CXJWzEJbadF41DSGsYPmuGlHP402Hvdjld38dlTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Rabjhhvd83tr7aWZzIR0w55EB/7Bw+hHmRK29bmjAM=;
 b=W9PFTR+O6TT5IvFv2XmXAYLh3ioqH/HjxFYKSQIwyTWj5HI8tZHHerynKw4VLRRA+fjVgUy73tQfBP9lkN6TbSOEjWRM8LS7mSLjRggmHqdBjENhvQzhKvHyFXM3CPxi1IDGiusJErCrxtnmzUgtRKZ/jj2Xef0X9qBvKxSz0Hk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/hKnbWw737c7OVrlHMxC0kHfcVyenoJvwTrkbw4NnWzOvCsZkkmuEPClbkSzQNyIBepoOF9+jnYdYi672UBvNZUr5r5D5ujHgFqtzdMeySOj6wWqkYKP0aob7/Auhr4/VdAbDEo6c9vSo0OLJD8vruIqKdZx1idxXGEb1PaFDaXJGOx969iJmsrIfHuuXGlemZHHy00B1bh3zHikR+Y0Qd3Ec+mxutpu7ZKlIYFvcBb9Jaum0B2esOVkQlW6UXIrtKHnrLWi8gsxbsPyiPE9dlyJmkvWrK+IRgvkAKtUfSKefRHUnEFcfkzLVdnopvui2sAGaUsmphFf8tN2qQP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Rabjhhvd83tr7aWZzIR0w55EB/7Bw+hHmRK29bmjAM=;
 b=qREo6PEv5XjBLvFHaJ1NFsoUiHDIW9y3OHFO+lBGv6AA6+0v45zzG6R6yC9AVyynixuKwkU6HwRJ3AU05PoiQafW0+xKFPBWMTBAOGfJURisyff0dJ9StdvEcVb1oJBNVMYUfCOrQUhLKxbeurzwlj7Dka4vDEN9K93azvM2SIONKtOfzb2WU5NRecLTJfzNHBW5mzEe63hQmlirWBzIXCizcXw2W2e8JGbGFkf7I78xzxL4hE7nUgdVGd/w7j+nKPKUwio9QVR+Wk8bVI1dDyPrRnvQQcoxBOwqY3eJX9u/fBruZO/0xpdoZOcsMnu9sxxLNDmYYrWeJr+rHZPl0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Rabjhhvd83tr7aWZzIR0w55EB/7Bw+hHmRK29bmjAM=;
 b=W9PFTR+O6TT5IvFv2XmXAYLh3ioqH/HjxFYKSQIwyTWj5HI8tZHHerynKw4VLRRA+fjVgUy73tQfBP9lkN6TbSOEjWRM8LS7mSLjRggmHqdBjENhvQzhKvHyFXM3CPxi1IDGiusJErCrxtnmzUgtRKZ/jj2Xef0X9qBvKxSz0Hk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1] xen: Use MFLAGS for silent-mode detection
Thread-Topic: [PATCH v1] xen: Use MFLAGS for silent-mode detection
Thread-Index: AQHclpNYPLhzf1Jy6UKGKEMKa2gWarVz/LiAgAAD8oCAAU1iAIAAAYGAgAADMwA=
Date: Fri, 6 Feb 2026 08:09:54 +0000
Message-ID: <1DCB4CF7-99F9-4958-AFC8-521EE4779664@arm.com>
References:
 <3ab39249c788fd0463e73df9464d482fefe8516b.1770290975.git.bertrand.marquis@arm.com>
 <1a0c5e48-5457-414e-89c8-0f12cfa55a96@suse.com>
 <2E85263B-38BC-49CB-80CD-3C30F37EFE4F@arm.com>
 <F6E76E4B-1992-484E-8232-85696D3F23F0@arm.com>
 <37e2fad1-ce06-465e-b56b-190bc0aaa379@suse.com>
In-Reply-To: <37e2fad1-ce06-465e-b56b-190bc0aaa379@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PA4PR08MB6176:EE_|DB5PEPF00014B95:EE_|DU0PR08MB9903:EE_
X-MS-Office365-Filtering-Correlation-Id: a46ab3f1-38f2-40af-9d5f-08de6557434d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TmdWSEVWVFd6S1lsREJDZU9pWDZjRVJGbkJHMzRFMDhlbjh0NWtGSWR5NmZ1?=
 =?utf-8?B?VHBnR1FWeXprR0NWbmI5d1dudGp1MVYrR01IZ2ZZV2N4UUZpdllhWGxzMWJN?=
 =?utf-8?B?Vkg1ZEZmaHFGYkh0OWQrYXJzMXcxZVZRM283TUJnODJrOGF5clNId2JKK3Q4?=
 =?utf-8?B?bGdGalhEK0dKSFpuVk5hSDhEQXM4Y2VUOUNhM21NbWM2VFcyNHhBVzVXMGgz?=
 =?utf-8?B?dXpJR0xUMlBLRXdNTkQzRVlUR1hXbEVXalVuU09iaEJ3b3hEZDV4eUlES0FG?=
 =?utf-8?B?aVNic2J3SXNDNmNjdHVocUVTNG5vd05GNVZxQnlkSG1RWDZ5SlRnUkJmV05P?=
 =?utf-8?B?c0ZMRGtWWVFlUHlDU2Y0anBCZ295SCs3ZmdmYWVWWEsxUzdOb3QrMlhzdE1x?=
 =?utf-8?B?NmRIS2FTZDMxQWN2cEhTaFdOZkRRaXZXd25JcTUzTFNSY0JVL2lzS1prNWRo?=
 =?utf-8?B?UTJHdWV3aTdlclZBL1RzOFpqY3FnYjBicHJrUzhkZlg5SzF5ZGNzdnFpVm9I?=
 =?utf-8?B?aUs5ZEw0UVRBQWMwYUpYR2tqNFhDVFBjSVo4TWx6OWNRTXoxSkhpczh4eEFB?=
 =?utf-8?B?c1dRU0pyRGkvUnhGUVpjWVc1ZmVFQVFNbzg3dDNsUzRXdDV3OTBCMCtVTmw0?=
 =?utf-8?B?N3BvMEF0QTB0WTFaY2luREEyZVlQR2lZMFZ0Y1hJOEtoSkd6TmhEcXVwVHU1?=
 =?utf-8?B?RUZFbGtncENKZmRreWJ2ejNUbjB4d1ZiMzcwbUNXMTF1bVdrNEdUQnI3V3Aw?=
 =?utf-8?B?OWh1SVYzaWxxVkpJTDVaaHc3YWk5TGY4YmdQL0FZcytjNGkwS2JpMTJsWkhO?=
 =?utf-8?B?TkNtdGtUWkk2UW01M3BGOWtwbDFLbEpFQUc4ekNJb003ZjBxV2hQT2RnTXM2?=
 =?utf-8?B?RDJoQ0M2VEdjUjhoa1FFOW5UeDhZdDgwQWRGbHZ3QUpublArZlh5VzcwamxG?=
 =?utf-8?B?d2RCdjVHM29wYkJkNHlVVFlseG1OMWZyRjRtVnIxeW1HT3dhRzl4Z2p0cEhB?=
 =?utf-8?B?RnJ2Rzd1cjlIWncwQUN4TnhBeWcvUWRDeStnb20wbG9pYUZNODEyVTZ2cVdI?=
 =?utf-8?B?MVJoZmJ0SXdZN2lrS0VidXZvOC9EZkdCTksrZGpSeGdnNzZFUUVqeXp3UStT?=
 =?utf-8?B?U1pDbEMvQWE5amdRWml2TnZhU1NUY2lHNENkWU02TDdoV0lxMGlZTWFuYVB3?=
 =?utf-8?B?bnArQi9XZGRtN2RyRGVRcUpYQmx5TlVxdXRHcWxRbDhzRW1NdUtkQU5pZjRG?=
 =?utf-8?B?cEI1dHdPb1BoTTlTMTcvSFdEYVRaMHdkeGlTeDg1Q1NnVzJmNUZ5TFBlSmV0?=
 =?utf-8?B?cnl0blJhalp0TE1ma2FJQ242N0o4b0l5RUNuODd3TVVka1M5STdXTk9PbEp2?=
 =?utf-8?B?L0FZZU1KS0ZtOXYxcC9HL3A1VWQyVnAwU3ZGUythNGViUHRZR0xHcUZUa0p6?=
 =?utf-8?B?K3EzTnRyeHQ1L1A0OUNyTDFYYkdLMFNxKzNzcUliczJCTlhsZUlQVm1NSFpZ?=
 =?utf-8?B?eldWak1vOXRPNTg4enFSdWVreHU2WXUxUGZTQmxWUThhVkZwWjMvUVVoRmZp?=
 =?utf-8?B?KzRSUnlxdVZqVHF2TWxnY2NjV1Q4ZVhxOGZ6dkxUUUpVb00vZHpON0FtOUVS?=
 =?utf-8?B?a1ovcFkzN0t3V3dTbTJETE9kS2V5QTZhMTRGSS93d1FJZVZINmtuUlFxWXVk?=
 =?utf-8?B?TzhCTys0K1dNOEZ3WEFXbUhUTHpoTVNZZVRTTDhseGRPL2lIVEZSWERMNjc0?=
 =?utf-8?B?ckt1eUZJNW1iNzdOdnl4SVRYTXZJbUNNUVM0Q0Y4YkV0dE5ld2hxOVZDUkpE?=
 =?utf-8?B?MFgyb3lqbUlBaFlyTnFQWmtxaHk1N00vQjlMT3pIanFqd1NYTWRJVTQyVGRo?=
 =?utf-8?B?ek9RcGFaUE91UzJNMU9NZ1d6Q1p1SGk4SFhkME16RzBlZUpoNjRLZUt6NGxY?=
 =?utf-8?B?cS9PTUpDSkJrQlVVaEdZNmd4bWk5UDBNNTV4dUhhVStHM2xZbDY4YXJpdzlO?=
 =?utf-8?B?VmpKaXA1K0xUVUdSQnc1VlNZY080Wmo5aTNvbmJBbHkxTVlncmN6TDluREFv?=
 =?utf-8?B?NmF4a2V0ZTZRNlNhUTlDSEFhQmJaSDV6aTdqZlBkWVora0ZiS0JQMXlBZkZk?=
 =?utf-8?B?KzBSemF5UEc3Y3NJSVB1dkNLVWRVeHZiYkdKN2ZZWityVGV1aklIZ0Vwb1M4?=
 =?utf-8?Q?shkcof0b7EIF/lR6kwmkgH0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD7976C4B6D9E14F9EDF26CBC35E0161@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6176
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8aa616ca-45a8-49ee-c618-08de65571c92
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|14060799003|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2RnaTJsdFpsSDBHMkU3cXZVRmVKWm5JREV2R21sdmpWd2VyWllZaXJVTVEx?=
 =?utf-8?B?SngxUzljMlFnc0c4RnVWU3AyK1R3Ui9md2Iwa1NLVTBrMFJ3R1h5c25Welhw?=
 =?utf-8?B?MHh4R3pEd1Z5d0Nwd3pmV2JSWGEyckU3bk8rTXpKZGNVQTh1ekRWRS9qSUZq?=
 =?utf-8?B?S3dpSzdYQytVdklzVmdJamNza25OeldwblJGaTJPYm9jcVF6UnEyV1ZZbU5m?=
 =?utf-8?B?Z2hpb3dqT1Z4aDdIdkI5YitjSHhXanRLbTA3RlNLQ3VYcVJrb2Nsa25nK1Zo?=
 =?utf-8?B?a2l6bnBlOFJ4L3pVcSt4aEtkcjNyMW9ydHhNWC9LV0czSEMycHkyd3FlVzB6?=
 =?utf-8?B?ME5lb1FaVEdXMm8rMmsrYUgvazY0cmhUamFLSFlTZGh3VW5kQmVhNlhFQm1H?=
 =?utf-8?B?SzRvbTZJSGxSdkFKUE0vV0FUSkFiOEFtbjhqeGJvZ3JGTkh0aU9qV21aWC9z?=
 =?utf-8?B?WXZCSWZ0dFNOaC90T25qaEtUMHBKSVN6WU9RaVU3REZDRXZMazlmTjJFU3dL?=
 =?utf-8?B?SjZnMW8wMEQ2MUY4MHYwTnVGSnZNT1Z0ek5jc0JDTm90a3BJZUNWVHlnRkgx?=
 =?utf-8?B?T1kveHlLTFU3ZzA5a0FSakExRndZY0JUZytNQTdwT2gxUDJTL0JMNGRWR3Fv?=
 =?utf-8?B?OGs0VjhIdHlNaUtPa2duY3JyZUhmcXpaOCtCVmVQVkVBRVhoZm9SWjVOb0JX?=
 =?utf-8?B?bEJBaHJCUWxReHh4WEpnZmxDbUR0MDZyU2VpVDNXMUk0WnBxdmZkWGs2dW5o?=
 =?utf-8?B?UUhzamFBTzU4R0NSZkVnUnZSck5XN3duckkvVjZweE5qa0p4eHI2bWtHOWhi?=
 =?utf-8?B?RHY1dUNJdHpVRXlCQlYrTEJKeTJqcUlRQUJsNnlIdm00NFBiSGlEbGZWazJt?=
 =?utf-8?B?U0daaHNzL1VDR1Z2QjF0TU9YOHRFVjFuV25YWkp5YTl1eFZXT2FmblpIbm1u?=
 =?utf-8?B?aHR4bHQwWFFsZEJhNmZycVpKQ3c5Y0VaeUdValFqai9UbmhuMXZGQlRXTVlO?=
 =?utf-8?B?VjVaMDFsa3hCeVMvMG5RRkRQUllYWmsyMncrOVh4ZVZZYW1zZy9heU05cUJH?=
 =?utf-8?B?N25HUVdFQ3V3RHAvSy82UUhMY2RSd2M4WTBsaTYzVnN0dWF2QUgxaTRLSGV4?=
 =?utf-8?B?QW1tMVRwYWY3YVpSQ1BwNzdHZTdGSGRRdDN2OVBmb013RnNnNUlZODYyYUZS?=
 =?utf-8?B?Y09mL2JNdS9PcXBXSDVwT3hYaFdWM1pzRWFhTmxjeDlIbzBNcEJzbVFOYVpn?=
 =?utf-8?B?MW9pY0dMbEx1K2s4aldqZHp3YXJTZ2lIdUNCbW9DTTFhRjcvd2RwQS9yZHpV?=
 =?utf-8?B?MmpsUnY3STFVVTFia1dZVHp2OHNlRmNRbEZ3QXJJRWdjYzI5RDE4TTREeDJ0?=
 =?utf-8?B?VXUxZ2xvbzhlZ3ZKWFJpeTZkSTRHd0xUVTdKZ2QrK3hlTnZXYjFHeFRRQmRR?=
 =?utf-8?B?N2R0a0xWdCswWDdTbkh1NGpwUGhSeFo1YkJrSmRVd2lSdkg0R0xsZWVoRC9k?=
 =?utf-8?B?RVI5bGx0V0trNnYyemdJNVJjemN1QVA2Y1RUUVZBbUVPVFIyZEkvdCtRUmt1?=
 =?utf-8?B?UDJxcStxOVlpdGl6eERVUklFKzRjYzk2S0RTMnQvQXB3ZXRoZnFpMUlFak5M?=
 =?utf-8?B?bEY3WTBxM0xpSy9LWlpEL1NBSi9WUllSMzFNMi94NjYzWllwUjdsRnVVa0VK?=
 =?utf-8?B?UU5zMlFWcnU3WmNjQTBZTVVORlZOeUs5Q1VVN2FiYi9hc1ZScFFlWGFJZnRv?=
 =?utf-8?B?Yjdma2pMUmFCY3o5OW5tRFp3SUdOWEl6Tmk4WGlUQmR4RFlrSGk3TllsMDcy?=
 =?utf-8?B?bzhKY1pjVC9SVXpWSzM3bUpwbjYycmxra3dmOUlYNlhVOCtDVHlkVHBhcWQy?=
 =?utf-8?B?VnptZ3BRekNCT1NscnlQNEpJSVNkRURHcjNnT0JVYVJaQndaUlNubUJlVUNh?=
 =?utf-8?B?dzVQRXJQMmF0YmlzREYvanRUTnhqMDZsNk9OTS9mdFhyT0hlWE1JWjB4c3RN?=
 =?utf-8?B?dllwdDRhMmFSc2RrUElDNTJreVpCNG1QMm1FNFBleUIwejZTR2V1RDdEK21O?=
 =?utf-8?B?WlRMcVJXWDd1ZEZhemRLa2ttMHAwMmtrT3NORDNQVC9ReWVUQ0pQbDdGNTd1?=
 =?utf-8?B?U1RkUjlmbXhYZENURUI0ek5POFFSNFNuSlhwUVdTQTYyT3UvVkxJSFIzZVd0?=
 =?utf-8?B?NlA2ZkY0ZjlKYlVsa3ZKdjZ2MmMrdVdZbGM5aU5pV0lveGZTNXJVUGpXNno4?=
 =?utf-8?B?R3BUUzNsc0pVb3ovYitxS1FKdSt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(14060799003)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6nNIdksqlpNat7463gBAzAVozHISM1j63bBS3cZFB+X8KIuG0vi7fJUB2L00dys3pgTGkXt36mU11m1YkLKZy7O8fEMVeQF+BojvnZPWhIe57nESlSr8DOAv0y640GyrqtlJNB8I0Tqby03sPESMTCpTQxdmgXxAB4tCG1MIhnZu5eRrzAOtxOJFKxUmo4HfxVGnAhzdJM3IdU20vpjBJEeTP3yX9eU/e2owNohX0kaGwLWgIodByyr/gY232OX9qwKmzU1KxQGiXCuweGrV1CDrfYVvAxe/msyZ/YeRUd5Ne+YnUuuTjmXMipTIuY1HbqnpdLBu0ODGMcEPWTnUcOYQHlAS96Y7ZyuRhZWxlMHGtcIfRO/bbtGoBJa951fSPt2SAn4FT1FnWCHvWaw+xYgHChu3JFScC1SN01pZY1SlvjURAbXmT7nF+QlC7yck
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:10:59.7849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a46ab3f1-38f2-40af-9d5f-08de6557434d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9903
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 03333FB4A1
X-Rspamd-Action: no action

SGksDQoNCj4gT24gNiBGZWIgMjAyNiwgYXQgMDg6NTgsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNi4wMi4yMDI2IDA4OjUzLCBCZXJ0cmFuZCBNYXJx
dWlzIHdyb3RlOg0KPj4gSGkgSmFuLA0KPj4gDQo+Pj4gT24gNSBGZWIgMjAyNiwgYXQgMTI6NTks
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+Pj4g
DQo+Pj4gSGkgSmFuLA0KPj4+IA0KPj4+PiBPbiA1IEZlYiAyMDI2LCBhdCAxMjo0NSwgSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IE9uIDA1LjAyLjIw
MjYgMTI6MzMsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+PiBHTlUgbWFrZSA0LjQrIGV4
cG9zZXMgdmFyaWFibGUgb3ZlcnJpZGVzIGluIE1BS0VGTEFHUyBhZnRlciAiLS0iIChlLmcuDQo+
Pj4+PiBPPS9wYXRoLCBGT089YmFyKS4gVGhlIHNpbGVudC1tb2RlIGNoZWNrIHNlYXJjaGVzIGZv
ciAicyIgYW5kIGNhbiBtYXRjaA0KPj4+Pj4gYW4gb3ZlcnJpZGUgdmFsdWUsIGZvcmNpbmcgc2ls
ZW50IG91dHB1dCBldmVuIHdpdGhvdXQgLXMuDQo+Pj4+PiANCj4+Pj4+IFVzZSBNRkxBR1MgZm9y
IHNob3J0IG9wdGlvbnMgYW5kIGZpbHRlciBvdXQgYW55IGxvbmcgb3B0aW9ucyBiZWZvcmUNCj4+
Pj4+IHNlYXJjaGluZyBmb3IgInMiLiBUaGlzIHByZXNlcnZlcyAtcyBkZXRlY3Rpb24gd2hpbGUg
YXZvaWRpbmcgZmFsc2UNCj4+Pj4+IHBvc2l0aXZlcyBmcm9tIG92ZXJyaWRlcy4NCj4+Pj4+IA0K
Pj4+Pj4gRml4ZXM6IDRmZGI0YjcxYjE1MiAoInhlbi9idWlsZDogaW50cm9kdWNlIGlmX2NoYW5n
ZWQgYW5kIGlmX2NoYW5nZWRfcnVsZSIpDQo+Pj4+IA0KPj4+PiBJIGRvbid0IHRoaW5rIHRoaXMg
aXMgcXVpdGUgcmlnaHQ6IG1ha2UgNC40IHBvc3QtZGF0ZXMgdGhhdCBjb21taXQgYnkgYWJvdXQN
Cj4+Pj4gMi41IHllYXJzLg0KPj4+IA0KPj4+IFRydWUsIHdlIGNhbiByZW1vdmUgdGhlIGZpeGVz
IHRhZy4NCj4+PiANCj4+Pj4gDQo+Pj4+PiANCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5k
IE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4gDQo+Pj4+IE5pdDogTm8g
YmxhbmsgbGluZXMgYmV0d2VlbiB0YWdzLCBwbGVhc2UuDQo+Pj4gDQo+Pj4gQWNrDQo+Pj4gDQo+
Pj4+IA0KPj4+Pj4gLS0tIGEveGVuL01ha2VmaWxlDQo+Pj4+PiArKysgYi94ZW4vTWFrZWZpbGUN
Cj4+Pj4+IEBAIC0xMTMsMTAgKzExMywxMSBAQCBlbHNlDQo+Pj4+PiAgIFEgOj0gQA0KPj4+Pj4g
ZW5kaWYNCj4+Pj4+IA0KPj4+Pj4gLSMgSWYgdGhlIHVzZXIgaXMgcnVubmluZyBtYWtlIC1zIChz
aWxlbnQgbW9kZSksIHN1cHByZXNzIGVjaG9pbmcgb2YNCj4+Pj4+IC0jIGNvbW1hbmRzDQo+Pj4+
PiAtDQo+Pj4+PiAtaWZuZXEgKCQoZmluZHN0cmluZyBzLCQoZmlsdGVyLW91dCAtLSUsJChNQUtF
RkxBR1MpKSksKQ0KPj4+Pj4gKyMgSWYgdGhlIHVzZXIgaXMgcnVubmluZyBtYWtlIC1zIChzaWxl
bnQgbW9kZSksIHN1cHByZXNzIGVjaG9pbmcgb2YgY29tbWFuZHMuDQo+Pj4+PiArIyBVc2UgTUZM
QUdTIChzaG9ydCBvcHRpb25zIG9ubHkpLiBNQUtFRkxBR1MgbWF5IGluY2x1ZGUgdmFyaWFibGUg
b3ZlcnJpZGVzDQo+Pj4+IA0KPj4+PiBXaHkgInNob3J0IG9wdGlvbnMgb25seSI/IEl0IGxvb2tz
IHlvdSBtZWFuIHRvIGRlc2NyaWJlIHRoZSBtYWNybyBoZXJlLCBub3QNCj4+Pj4gd2hhdCdzIGRv
bmUgaW4gdGhlIGlmZXEoKTsgYXQgdGhlIHZlcnkgbGVhc3QgaXQgY2FuIGJlIHJlYWQgYm90aCB3
YXlzLg0KPj4+IA0KPj4+IFRydWUgc2hvdWxkIGJlLg0KPj4+IEZpbHRlciBzaG9ydCBvcHRpb25z
IGZyb20gTUZMQUdTLg0KPj4+IA0KPj4+PiANCj4+Pj4+ICsjIGFmdGVyIOKAnC0t4oCdIChHTlUg
bWFrZSBncmVhdGVyIHRoYW4gNC40KSwgd2hpY2ggY2FuIGNvbnRhaW4gYW4g4oCcc+KAnSBhbmQg
ZmFsc2VseQ0KPj4+PiANCj4+Pj4gNC40IGFuZCBuZXdlciByZWFsbHksIGFzIDQuNCBpdHNlbGYg
aXMgaW5jbHVkZWQgaW4gdGhlIGFmZmVjdGVkIHJhbmdlLiBJJ20NCj4+Pj4gbm90IHF1aXRlIHN1
cmUgYW55d2F5IHdoZXRoZXIgdGhlIGNvbW1lbnQgcmVhbGx5IG5lZWRzIHRvIGdvIHRoaXMgZmFy
LiBUaGlzDQo+Pj4+IGtpbmQgb2YgZGV0YWlsIGNhbiBiZSBoYWQgZnJvbSB0aGUgY29tbWl0IG1l
c3NhZ2Ugb2YgdGhpcyBjaGFuZ2UsIGlmIG5lZWRlZC4NCj4+Pj4gDQo+Pj4+IEhhcHB5IHRvIG1h
a2UgYWRqdXN0bWVudHMgd2hpbGUgY29tbWl0dGluZywgeWV0IEknbSBub3Qgc3VyZSB3aGV0aGVy
IHlvdQ0KPj4+PiBhZ3JlZSBpbiBhbGwgcmVnYXJkcy4NCj4+PiANCj4+PiBBZ3JlZS4NCj4+PiAN
Cj4+PiBJZiB5b3UgYWdyZWUgYW5kIGNhbiBkbyB0aGF0IG9uIGNvbW1pdCwgaSB3b3VsZCBqdXN0
IHB1dDoNCj4+PiANCj4+PiBGaWx0ZXIgc2hvcnQgb3B0aW9ucyBmcm9tIE1GTEFHUyBhcyBNQUtF
RkxBR1MgbWF5IGluY2x1ZGUgdmFyaWFibGUgb3ZlcnJpZGVzLg0KPj4gDQo+PiBBcmUgeW91IG9r
IHRvIGdpdmUgYSByZXZpZXdlZC1ieSBhbmQgZG8gdGhlIGNoYW5nZXMgb24gY29tbWl0IG9yIGRv
IHlvdSB3YW50IG1lIHRvDQo+PiBwdXNoIGEgdjIgd2l0aCB0aG9zZSBmaXhlcyA/DQo+IA0KPiBJ
J20gaW50ZW5kaW5nIHRvIG1ha2UgYWRqdXN0bWVudHMgd2hpbGUgY29tbWl0dGluZy4gVGhhdCB3
aWxsIG5vdyBiZSBuZXh0IHdlZWsgb25seSwNCj4gdGhvdWdoLg0KDQpXb3JrcyBmb3IgbWUgbm8g
cnVzaCwgaXQgaXMganVzdCB0aGF0IHlvdSBuZXZlciBzZW5kIGEgUi1iIG9uIHRoZSBNTCBvbiB0
aGlzIHBhdGNoLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IEphbg0KDQoNCg==

