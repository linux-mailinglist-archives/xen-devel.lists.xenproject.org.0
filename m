Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPk4If7HgWl1JwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 11:03:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C682AD7453
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 11:03:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219171.1528105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnDF6-0004Ms-89; Tue, 03 Feb 2026 10:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219171.1528105; Tue, 03 Feb 2026 10:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnDF6-0004LR-4F; Tue, 03 Feb 2026 10:02:44 +0000
Received: by outflank-mailman (input) for mailman id 1219171;
 Tue, 03 Feb 2026 10:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vnDF4-0004LL-CU
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 10:02:42 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79e1a325-00e7-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 11:02:41 +0100 (CET)
Received: from DB9PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:10:1db::18)
 by DB8PR08MB5449.eurprd08.prod.outlook.com (2603:10a6:10:119::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 10:02:34 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::46) by DB9PR06CA0013.outlook.office365.com
 (2603:10a6:10:1db::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 10:02:27 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Tue, 3 Feb 2026 10:02:34 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PA6PR08MB10623.eurprd08.prod.outlook.com (2603:10a6:102:3d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:01:32 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 10:01:31 +0000
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
X-Inumbo-ID: 79e1a325-00e7-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uo6w3/HZpvnZFZI74c65jCiqLGY+Rp3Qw5N85jANnBzlP2RpQFc94Q0GQ7D1DgYH9S3+PwHSWpjS3lgspkZ9wB9lpsozvp4UdZPxJ5qdozIn0xnEOutA6LIboPS7lbBDGnBMMRpFa8mYDBSv88G8I7sUgAv5th5EeTWgufE2dMvC3ztHsuHnWCzBUHpfKNt1H5BiALCXXmEUEM4iU587on9CI8ynw9V0AcPa1saqlrhx21lH0vTmx8x4/yJwUzmWJsgicZchInTmiVonbVNk1am08lVNCd3i3/qGSsHI3HRElvgWPDjWuBFP7VPfo83eCC0Ip0wOb+P87/zVzbC9zA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A79W+o0/IRzyFjpGKaukQWZL32KI18czLLJ7WebtV/g=;
 b=cbisBeq2QEPWWbsDz/K8dAghu0xfW7LBaTNxid+WoZ/u6LkPukSK38NFNaNzZlDae0/IBXspolE0fjRABPNt3B+hsMvjOC5DxDmh0VNj4eZlBIamOQVLkZx0Dm/lZ63EeHegFFdWs0zak/6f02LYaQIuIcV+j36PxTWkYLsTpFxgq9YMGpngXpKzkrxlqtIogTkgjlTm2fbFGoYq7XjsQdefv3AMrVihL/+pr+iOKkj77kjqchwucWqsYtWq660Ydp6Kw1GtyH31RY959baCtKIWbt1FKhJIECU1S195M/W2jl4lOmi/36t9FZbLeLFacfo0OwcIMZjEx/i+kpGm+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A79W+o0/IRzyFjpGKaukQWZL32KI18czLLJ7WebtV/g=;
 b=rAXkNRDUvqRqxsmVbeXvWa6PCvNTPQf0oJnxkGXq/bZso0dwwRWtyJWMhgg/4o3TYN10DWj+ALpq3zY+GGoTQkswoaTnDXnFswab7LNdARE2WWVBHV5aSz2D/rgcAtwpWicYVweDtMAMc8qagaUJkqHbGyjUZctDytAglGIucTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGZLhtFvHIlLojvz6sYm3kSILVfeBSpAljQb7op+cKB6gJo4n9lPH3tlfDGLOXzUb/yieU74jarv/pFiilzj7a3iaLVK9eH1Ltpq+5chuwkcorBGVYsHlqY4yiZ/Wl8xOeb2+ImoNSArulI+f7PuPLCIWicvMnAHMSydXG1poW2pTek7MW+Ay9HFgDxoXPq9o5DyQpjwILz1sXwU15mIGaeg8jrWpXMzqwqZaB7baGyy07M+Y1360GJVyfnoUKla6g5HUIqMgKQWWj2R2gW7kO3uaF+HMpWeuzO+H2V1YfDtex++GZGASOi0Z70OZTr9qyh3aPXADxq2rSROnZwtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A79W+o0/IRzyFjpGKaukQWZL32KI18czLLJ7WebtV/g=;
 b=LzxIxZDL+JvILJWAVnExvTz5BW7899MyBkEXHeJ9hqwa2MKHFl2pRmY7m1eF3GNph8j4baWWtap2o2hg1C7C8C1ssi1E7Eysk5xf3ql2SCMo7kNnmujLZ2zSvu5Z1sA0cPxtmXGGif3rScCJ5c16DPnGNhnXIDJV34Lth+wGipg262qCk4SExv8rdypbaEQCt3jqIYKcpcTb2w0+OetBCUTZ9l4nyCgm9mKKrjmRUxjMmXaxivcIu3xWV4icJ3jBv1uXHGgaQhK0EyG6A6hU8TzoHfOADbzufp3qRChY6FitLCe+0Y7xEk5dEx1QYTXOg6qrCm/AGSp2T0tCmXdWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A79W+o0/IRzyFjpGKaukQWZL32KI18czLLJ7WebtV/g=;
 b=rAXkNRDUvqRqxsmVbeXvWa6PCvNTPQf0oJnxkGXq/bZso0dwwRWtyJWMhgg/4o3TYN10DWj+ALpq3zY+GGoTQkswoaTnDXnFswab7LNdARE2WWVBHV5aSz2D/rgcAtwpWicYVweDtMAMc8qagaUJkqHbGyjUZctDytAglGIucTo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 00/19] GICv4 Support for Xen
Thread-Topic: [RFC PATCH 00/19] GICv4 Support for Xen
Thread-Index: AQHclF8GgI2Kr/X/QEO5wnP/6sbdXbVwv1qA
Date: Tue, 3 Feb 2026 10:01:31 +0000
Message-ID: <AC263D87-9EE3-4F32-BC5D-1A290781C48B@arm.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PA6PR08MB10623:EE_|DB1PEPF000509F8:EE_|DB8PR08MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: 463cb9bb-8f3f-48c7-8741-08de630b5a8a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZXM2NGFpeDRDYmpXUml5NlhxamhEaG1pbjZIWEQxdXhISlBONTNCUUJxOXNU?=
 =?utf-8?B?MzVlSUtxb3NpZnhzdlUzWHRRVjZLQmNMT002SnJBbFBLb3ZVcmZaOFdLc2dk?=
 =?utf-8?B?bUZ0ZzA0YjAyNkRvN0k1NTlrczFrUy9Sb3RZd3dlMmg3dVpTc0FJbCtWZ2FB?=
 =?utf-8?B?NkhtOWxhdWdMSzd4RVdrcFo3c2tkU2wvRzQyRG54V2oxYWxlTmF0d1AwdDFJ?=
 =?utf-8?B?TXRNMjhoaWZkUy82OURLSFliMWJoVVJyVG1XbXp2Q09lS3FkVUZTdDcrNkV1?=
 =?utf-8?B?YXJqNXdOUTZxdEZRcENwUnZDeHZkQkgwVnRxZFUxeWpORUREY0dkRm14OExS?=
 =?utf-8?B?VWJ3ekpzT3UxU21ranNJSTcxbjVCZ09SOHpsZm9GSk45QlBOQTB3K21hYzV2?=
 =?utf-8?B?dllSalFwSVJVdDlXNHBZTmhLQWtBLytNVGtycGl4ZE13ZktWcTBscXBqZlNz?=
 =?utf-8?B?VUhDK1V5QkhjcDNYT01VajlhSE0vQ3FhMStQKzRBVjYrNlM5MHNHTXVyVHVS?=
 =?utf-8?B?endwZnZXWnRvNmJsVUJuaW1XdDdmVEhtN2hyeGN3MFFPQ09ZSG5kZ3VuQk9B?=
 =?utf-8?B?R0Z6MklIWnhmZlNiNWRvejhlY25JTjNkeTdEYzZ1WjhMVWlEQjA1OVE2bEVn?=
 =?utf-8?B?cU1FNlFtUFBobVdTNnF2ZWxjc2NMOWIxR0Nja1ZTQy9UdHNjb05Ua0FsNkVC?=
 =?utf-8?B?Wkg3UXlVdnE1djcyR2ZNcDZjZEwxVmhmQUpNSWl3RG9lcjM1ejFDV2FidkhT?=
 =?utf-8?B?QTc0Sk1xR0hXVUdPYWlnaElobnhDNlhuNkNEWU0vTXVLMnB5Si9ka3ZrUVYx?=
 =?utf-8?B?RVhkYlZsMEFzcnVzRTEyRDZYVjdqc1c3THU2MWhCZ29VNVhNSkJPYkRDOVV4?=
 =?utf-8?B?cFc0cno0K1E2S0VIRGUvMGtSbk1BKzEyWUlMeFp0SFlqZmVLcGFWRVc2dGRM?=
 =?utf-8?B?QnJXS01KRE5leU9rZmhuQXVUb3ArU1Jxdy9BMys0ZEpRMlMxclRIZEw2Q1Vy?=
 =?utf-8?B?ZVRPdGJkbzhFMHB1bGNOWFZJdGtDQk1xWXBuaWxqNFNuNEswTG8wMGg1aDlU?=
 =?utf-8?B?MGRtZHdjMVY1dktoWitGTEdTVXFId3hrTXpRTWdibkhFd0J1dmpDWXBpU0Vi?=
 =?utf-8?B?WDdPRE83UlhhbHZpY2x1MnEyaUZ4bEMyTytWOTdvdVdicDkzOCtnSHV6K2dv?=
 =?utf-8?B?ZFZWbmIxbVpUWGZITWlmNXBOTmtpNmhkMjREZWpYS2d6QzloY2ErWmpyU0R4?=
 =?utf-8?B?VnV0WlNSY2x5aEczekZWd2VZN2pCeVhjRXd5ak1lM01GTElQRlVNMjZRMUZr?=
 =?utf-8?B?VjZOU1d4enNMWHVyU2tvQ281ZGF1VEpwUk91M3l6Ky9xTUNsK2FSL0hCVHFW?=
 =?utf-8?B?M0xFSUJ5Mmc5dnJsTWo5K3BMUEsvemxxeFFnL0dPanNnbGo0TzJNNzNqMDQz?=
 =?utf-8?B?eDNSNk1QQjZwcjRnUWQzMmdXcUp0ejI0eGs3NTUrU1oyU3RsQy9NaGc4N3NU?=
 =?utf-8?B?YjU2VTloVlVYSTNsTEsyaVpKZndzNWtSckVSQUYwRnoyNUU1ZUdrb3VsUkFv?=
 =?utf-8?B?S2pkT1ZGb1phZDErWTl2Yy9tVWJjbk9KZ0ZOQTFXRi9kSnVlZmp4emlYYXIx?=
 =?utf-8?B?Q1pscStxOVdyamJoVDVWcWNCUm9ENDU0RHQvU0hxeVE3ZklIdjdmWXZhamNy?=
 =?utf-8?B?UE95cU9NOSs4N1dzS1JDZFAxbTg2ZmZBRVF6QjRHbk9JTHVNaFk2NXk0N1hn?=
 =?utf-8?B?ejdhNmhEaDdYMmFGM1Mzdlp4QjEzRE9rK2o2YTA1UGpUcStveDJteGhyRytW?=
 =?utf-8?B?ZTBySFdqa0VncHVEVzhHVVRLVU0zaUhRajZ3OUdsdDd3VlFFUCtuZkZONHlK?=
 =?utf-8?B?My9GbUhnYytwV25HRVBncUx3OFI5aVZFY1hMQUQyTTRXbFBlU0ZGOWg2M1dr?=
 =?utf-8?B?REgyaVQ3bEtvYTBtWVlPSFUzQzdZZ3JQQ3loLzJZc25tQnpxcTI1NEJIc0tT?=
 =?utf-8?B?eXN4ajFCK3VMZDRvQjJhVG5FeXNhUWFqVW01aDB0M1JSMFhncnFGVG9XdVRZ?=
 =?utf-8?B?ZEIwM1FWb0EwWkw1aUxiMFR1UVBuSUxIWHVBVG8vb2tScENMUlE4SzNpZE9F?=
 =?utf-8?B?d05CcERuV3Y2NzU3TlJpMEtiVUNKKzhpdXpqZFZXekN2c3JEQlJEaVRNdGVo?=
 =?utf-8?Q?3j8sHcTi6jzouGue2la053I=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A0647CCB2F1AA438AF5D367E40FBBFE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10623
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c7facfb2-46cc-4188-1254-08de630b34ff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|14060799003|7416014|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkI5dlhiQ05TVjFpUVNkZ2dEZnFDRXVFVUtGRVRyTUc5ZVVnWkdCTHZLbFhR?=
 =?utf-8?B?WmJ1dUtsSVJ5ajhhbzZyT3pMMUZnWmxNaG9EWlRmeTMxc1htVEV1dDg1ODZu?=
 =?utf-8?B?Z0Y3eCtTdmgzUFVwT1NmVnNPcWEvR3VIdjRBOWc4NXhNU0tBc0U0UW1YcTRD?=
 =?utf-8?B?U043RFZXU09EM1RoUXdPQnNheVdyZkJJOHVNSEhoVjZaNXpTdXVqQVByMjVi?=
 =?utf-8?B?TmNmblNVR2Q5V1FtU2dvYVVvMzYxNmhpdVl4Q3RyRVZDVmMzUnhEUHFwd24w?=
 =?utf-8?B?SHFiL3ViNGFXWGJTWWEzbFRVaUxzSEh0NnRNVFBmbjVJYWhORFVWUHJaTFBG?=
 =?utf-8?B?cHZ5Q1NYSmxic282MGkxc1o4c3NSODZkUGhjUXpqeCtrVnZSRUIwRnN0NU5K?=
 =?utf-8?B?MkYzM2NITEdaQ1JTSXhpMlBwK0d4UmZyWVJmcVhkRWNoVUJzSXg5VnhxbEtE?=
 =?utf-8?B?a1lTYllhaDQxdWh5dEQ2aGR1bDRxMVUyRWw4dTFvRENGcmFXVlM0dWJNQ3g4?=
 =?utf-8?B?NVBlNUR6VU9PQlhieUkvYXZBQURZTEhJMmVZVjBRUVJBQVVUdEVSdjhDVjJF?=
 =?utf-8?B?ckdDNWI0amdxcEpEbEtSZUNhTUw5eDQxbnNPREZzV1BaeDM3Y21rVUJoWDhZ?=
 =?utf-8?B?K24zdGR4TzhWWmxCLzNxKzVwSUlOQ0ZBK3JiQWc2ZThGbUNqUFByVHpKc2k5?=
 =?utf-8?B?U3AxdmZXV3g1YzI0YlEyczRkZ1NHTTZJRlg1WFFJc1hiZFl5VUdVWE45ZUhG?=
 =?utf-8?B?WDVKSDRUZ1d6TE95RkpCKzIzU3Z1Q3lxQUJ0YWlxcm1OaUhnQjVSWklTQnRk?=
 =?utf-8?B?M2N2blZzbFZRRHlpakhsN01QYzZ1MnRVR1dMcjFiL3IzTnV6dTl6bUJjN2x0?=
 =?utf-8?B?emZua3RtRFMxbFh6N3N6L2cxM1Y4V0daSVpUQUNBL1ZQMlcxdG5QMGMxVjE5?=
 =?utf-8?B?M1VLdVhtMC9TenJLQWFZNzZyc1ZJaTFyWk5EeWo5VWQ3dzVaRkhGS0RSVUs1?=
 =?utf-8?B?VVg0dDkyRDhBYTBpb1duMDRQMEFuWDFNMGlzNC9lRUNaOU1CQkFLN0Q5MFYv?=
 =?utf-8?B?VFBHK3VBUUFHZTNsTVJnb21aNTUrR280VTZ2dGE0VXN0ekVBZ2hiMnhQVHRz?=
 =?utf-8?B?SUZqUzIwTFlYeDFQTUdzbCt3ZWhIbnNsMm5wTDk5U1Fpam9Pd2JCY2Q4c3E1?=
 =?utf-8?B?SlpYTk9KV29selVrY3NMYkNNUUV6SFp1S2NKbTh4YmtoMy9TWFFqZ0VtbVZq?=
 =?utf-8?B?T21DUTdUcnFSek9BdTFxOXlreHFuMm5ucWxFbTg1Q2VKU3RyNDhIckgxV3Bh?=
 =?utf-8?B?ZjlUVCtSYVVWWlhkcVliWmMvUE9UbnRDcVp2aVFBUHlTS2ZuNSsxMkkzdFBq?=
 =?utf-8?B?OTU3UXVWcHU2emFUWkorRDIzdytrRnFQN0k4Qk93OXJmMnNEMnJwcVNlSXBL?=
 =?utf-8?B?VlNKQnhmc3NlVUVHS0wvckV6VWl4VFpoaFRDdzlDYmQwSHQwT1lybTNuNUJX?=
 =?utf-8?B?WjRRWW5hZG9XamQzYzhwWkxqNnlZUTZ4VDJWVDZ3VCtWOXZSZWtkcnFxWGpp?=
 =?utf-8?B?a2hQazk0RTgxUzRucEwxWmU3N2dLb3BqZEhvaEtTelRqTkNtSkZqVzVpY2VC?=
 =?utf-8?B?eG5TVXluMTV0amloSkhqUEV0VU5JbGllRXB3R2dwZzg4K0RpQS9pVEIrYUZ2?=
 =?utf-8?B?RkYyd2NhQzAwTlJVa1ZsTzFVWGJTVUl6a0ttTnU4MWNZYjV6bzhJSkt6YTA1?=
 =?utf-8?B?UUxhQzJGT3pHSTZZWTZNSElXS3hsV203WFg4bFdHdkJ3ZFFvRnBrM2Q2bkND?=
 =?utf-8?B?b3VtK0R5aFdVOWVsbndUbENEeG9ZcjZoWTlHd3dMQlFGdlRPdFRCYzBFSEh4?=
 =?utf-8?B?T1ZVSUhaNXN2ZXRwWkM5SmFyQUpOMVljbG5uY0lWTUFicHdobGxpTzM0ZGll?=
 =?utf-8?B?c0VXWmVBZDQzNEtiWmQ0eU14QlhmVUFZbjFFUUI0MFRJajJ2NkNVMTFUdFhz?=
 =?utf-8?B?TzFEbFZoRHdldm9sdXVqVWhPVkYvcE55MjdHNmk2OElYZzU2aHI3RW5ibzAr?=
 =?utf-8?B?ZmVJWmpuZEZ2SzBkOXI2NHMzZFZPTUdyYVdtREh1OFhGT3pVVDdrNzNRNFVJ?=
 =?utf-8?B?bzZXL0RtbDdDNlAzb2NlMFlRMnlNNkZSQVMzdXphem1hVzZ0aDNxekZja1V3?=
 =?utf-8?B?cENtNVJMMXNyaENKOG9hbkN2QnFHV3ZHdzFhRkdqT0ZiUW9FZkVTOU9ZOHdZ?=
 =?utf-8?B?Y2d6dzQrWHBoRjNtUS8wc3o3MGVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(14060799003)(7416014)(35042699022)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rFNCdvivRCtItRpf1kTxS1JE8heJF/IfC+PA7ogfxdaKb0dpYvoAaQMQvsdngtBQKaE5DwJYI5WfwLrq3UzTvwpv3BwnZ56nP6PEzTnhOI1rG9e1iRr7U4wk/UWgk/ceXSAYj0Y11nz1fZzgenfXELZ9U6mSLRH8/qG6VmVvU5ZCzr+W04hz8ccZa/o8d9Ol6xbOlCYJxwLljK5HVnle/VkaosOCZok7djmrcSkyI9o2b2TX2gtCcCW4eaz4kzVsjC6o3uJR2tVuvxW53nMvutQl3mdZ8haBqqvjqWK1AuscMDRgALGIHQg1FMkOIyPSuijHUCB8ADvoCKty8RNs2jzVvCLQg9PdNZHfMS2kuw7OQCfTBxPSXU5xpXO0hy8aJ/JN/V23nrfYmFJMTtqJY6LkpUP1C9bLUt/Xr9MfDNh/rffVZ46x+nJX6UfYaxwR
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:02:34.6939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 463cb9bb-8f3f-48c7-8741-08de630b5a8a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5449
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,kernel.org,xen.org,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: C682AD7453
X-Rspamd-Action: no action

SGkgTXlreXRhLA0KDQpXZSBoYXZlIGEgbnVtYmVyIG9mIHNlcmllcyBmcm9tIHlvdSB3aGljaCBo
YXZlIG5vdCBiZWVuIG1lcmdlZCB5ZXQgYW5kDQpyZXZpZXdpbmcgdGhlbSBhbGwgaW4gcGFyYWxs
ZWwgbWlnaHQgYmUgY2hhbGxlbmdpbmcuDQoNCldvdWxkIHlvdSBtaW5kIGdpdmluZyB1cyBhIHN0
YXR1cyBhbmQgbWF5YmUgcHJpb3JpdGllcyBvbiB0aGVtLg0KDQpJIGNvdWxkIGxpc3QgdGhlIGZv
bGxvd2luZyBzZXJpZXM6DQotIEdJQ3Y0DQotIENQVSBIb3RwbHVnIG9uIGFybQ0KLSBQQ0kgZW51
bWVyYXRpb24gb24gYXJtDQotIElQTU1VIGZvciBwY2kgb24gYXJtDQotIGRvbTBsZXNzIGZvciBw
Y2kgcGFzc3Rocm91Z2ggb24gYXJtDQotIFNSLUlPViBmb3IgcHZoDQotIFNNTVUgZm9yIHBjaSBv
biBhcm0NCi0gTVNJIGluamVjdGlvbiBvbiBhcm0NCi0gc3VzcGVuZCB0byByYW0gb24gYXJtDQoN
ClRoZXJlIG1pZ2h0IGJlIG90aGVycyBmZWVsIGZyZWUgdG8gY29tcGxldGUgdGhlIGxpc3QuDQoN
Ck9uIEdJQ3Y0Li4uDQoNCj4gT24gMiBGZWIgMjAyNiwgYXQgMTc6MTQsIE15a3l0YSBQb3R1cmFp
IDxNeWt5dGFfUG90dXJhaUBlcGFtLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGlzIHNlcmllcyBpbnRy
b2R1Y2VzIEdJQ3Y0IGRpcmVjdCBMUEkgaW5qZWN0aW9uIGZvciBYZW4uDQo+IA0KPiBEaXJlY3Qg
TFBJIGluamVjdGlvbiByZWxpZXMgb24gdGhlIEdJQyB0cmFja2luZyB0aGUgbWFwcGluZyBiZXR3
ZWVuIHBoeXNpY2FsIGFuZA0KPiB2aXJ0dWFsIENQVXMuIEVhY2ggVkNQVSByZXF1aXJlcyBhIFZQ
RSB0aGF0IGlzIGNyZWF0ZWQgYW5kIHJlZ2lzdGVyZWQgd2l0aCB0aGUNCj4gR0lDIHZpYSB0aGUg
YFZNQVBQYCBJVFMgY29tbWFuZC4gVGhlIEdJQyBpcyB0aGVuIGluZm9ybWVkIG9mIHRoZSBjdXJy
ZW50DQo+IFZQRS10by1QQ1BVIHBsYWNlbWVudCBieSBwcm9ncmFtbWluZyBgVlBFTkRCQVNFUmAg
YW5kIGBWUFJPUEJBU0VSYCBpbiB0aGUNCj4gYXBwcm9wcmlhdGUgcmVkaXN0cmlidXRvci4gTFBJ
cyBhcmUgYXNzb2NpYXRlZCB3aXRoIFZQRXMgdGhyb3VnaCB0aGUgYFZNQVBUSWANCj4gSVRTIGNv
bW1hbmQsIGFmdGVyIHdoaWNoIHRoZSBHSUMgaGFuZGxlcyBkZWxpdmVyeSB3aXRob3V0IHRyYXBw
aW5nIGludG8gdGhlDQo+IGh5cGVydmlzb3IgZm9yIGVhY2ggaW50ZXJydXB0Lg0KPiANCj4gV2hl
biBhIFZQRSBpcyBub3Qgc2NoZWR1bGVkIGJ1dCBoYXMgcGVuZGluZyBpbnRlcnJ1cHRzLCB0aGUg
R0lDIHJhaXNlcyBhIHBlci1WUEUNCj4gZG9vcmJlbGwgTFBJLiBEb29yYmVsbHMgYXJlIG93bmVk
IGJ5IHRoZSBoeXBlcnZpc29yIGFuZCBwcm9tcHQgcmVzY2hlZHVsaW5nIHNvDQo+IHRoZSBWUEUg
Y2FuIGRyYWluIGl0cyBwZW5kaW5nIExQSXMuDQo+IA0KPiBCZWNhdXNlIEdJQ3Y0IGxhY2tzIGEg
bmF0aXZlIGRvb3JiZWxsIGludmFsaWRhdGlvbiBtZWNoYW5pc20sIHRoaXMgc2VyaWVzDQo+IGlu
Y2x1ZGVzIGEgaGVscGVyIHRoYXQgaW52YWxpZGF0ZXMgZG9vcmJlbGwgTFBJcyB2aWEgc3ludGhl
dGljIOKAnHByb3h54oCdIGRldmljZXMsDQo+IGZvbGxvd2luZyB0aGUgYXBwcm9hY2ggdXNlZCB1
bnRpbCBHSUN2NC4xLg0KPiANCj4gQWxsIG9mIHRoaXMgd29yayBpcyBtb3N0bHkgYmFzZWQgb24g
dGhlIHdvcmsgb2YgUGVubnkgWmhlbmcNCj4gPHBlbm55LnpoZW5nQGFybS5jb20+IGFuZCBMdWNh
IEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+LiBBbmQgYWxzbyBmcm9tDQo+IExpbnV4
IHBhdGNoZXMgYnkgTWFyayBaeW5naWVyLg0KPiANCj4gU29tZSBwYXRjaGVzIGFyZSBzdGlsbCBh
IGxpdHRsZSByb3VnaCBhbmQgbmVlZCBzb21lIHN0eWxpbmcgZml4ZXMgYW5kIG1vcmUNCj4gdGVz
dGluZywgYXMgYWxsIG9mIHRoZW0gbmVlZGVkIHRvIGJlIGNhcnZlZCBsaW5lIGJ5IGxpbmUgZnJv
bSBhIGdpYW50IH40MDAwIGxpbmUNCj4gcGF0Y2guIFRoaXMgUkZDIGlzIGRpcmVjdGVkIG1vc3Rs
eSB0byBnZXQgYSBnZW5lcmFsIGlkZWEgaWYgdGhlIHByb3Bvc2VkDQo+IGFwcHJvYWNoIGlzIHN1
aXRhYmxlIGFuZCBPSyB3aXRoIGV2ZXJ5b25lLiBBbmQgdGhlcmUgaXMgc3RpbGwgYW4gb3BlbiBx
dWVzdGlvbg0KPiBvZiBob3cgdG8gaGFuZGxlIFNpZ25lZC1vZmYtYnkgbGluZXMgZm9yIFBlbm55
IGFuZCBMdWNhLCBzaW5jZSB0aGV5IGhhdmUgbm90DQo+IGluZGljYXRlZCB0aGVpciBwcmVmZXJl
bmNlIHlldC4NCg0KSSB3b3VsZCBsaWtlIHRvIGFzayBob3cgbXVjaCBwZXJmb3JtYW5jZSBiZW5l
Zml0cyB5b3UgY291bGQNCmhhdmUgd2l0aCB0aGlzLg0KQWRkaW5nIEdJQ3Y0IHN1cHBvcnQgaXMg
YWRkaW5nIGEgbG90IG9mIGNvZGUgd2hpY2ggd2lsbCBoYXZlIHRvIGJlIG1haW50YWluZWQNCmFu
ZCB0ZXN0ZWQgYW5kIHRoZXJlIHNob3VsZCBiZSBhIGdvb2QgaW1wcm92ZW1lbnQgdG8ganVzdGlm
eSB0aGlzLg0KDQpEaWQgeW91IGRvIHNvbWUgYmVuY2htYXJrcyA/IHdoYXQgYXJlIHRoZSByZXN1
bHRzID8NCg0KQXQgdGhlIHRpbWUgd2hlcmUgd2Ugc3RhcnRlZCB0byB3b3JrIG9uIHRoYXQgYXQg
QXJtLCB3ZSBlbmRlZCB1cCBpbiB0aGUgY29uY2x1c2lvbg0KdGhhdCB0aGUgY29tcGxleGl0eSBp
biBYZW4gY29tcGFyZWQgdG8gdGhlIGJlbmVmaXQgd2FzIG5vdCBqdXN0aWZ5aW5nIGl0IGhlbmNl
IHdoeQ0KdGhpcyB3b3JrIHdhcyBzdG9wcGVkIGluIGZhdm9yIG9mIG90aGVyIGZlYXR1cmVzIHRo
YXQgd2UgdGhvdWdodCB3b3VsZCBiZSBtb3JlDQpiZW5lZmljaWFsIHRvIFhlbiAobGlrZSBQQ0kg
cGFzc3Rocm91Z2ggb3IgU01NVXYzKS4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo=

