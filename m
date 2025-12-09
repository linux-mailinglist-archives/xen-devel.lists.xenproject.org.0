Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F8CB05A5
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 16:04:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181819.1504807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzFY-0004bb-Hp; Tue, 09 Dec 2025 15:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181819.1504807; Tue, 09 Dec 2025 15:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzFY-0004Yt-Do; Tue, 09 Dec 2025 15:03:36 +0000
Received: by outflank-mailman (input) for mailman id 1181819;
 Tue, 09 Dec 2025 15:03:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nu2q=6P=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vSzFW-0004Yn-B2
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 15:03:34 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39d6995d-d510-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 16:03:33 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6979.namprd03.prod.outlook.com (2603:10b6:510:169::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 15:03:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 15:03:26 +0000
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
X-Inumbo-ID: 39d6995d-d510-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/JnIYMu0ysZffp2YQBoELvxpvcHkRjeYahpteeb9BLzbplfjlakTIeB84qYu8WeCuD1V+YwGGOIFNIBdQY3fWS5w0Ko60hBx+k78GfMASat+DWKjgiojWRjC99IBd13/8sOVwlaGqXqs4GC+zoy/DLn0ba4Me3G4BJJfx2bYykEjdkIpFYrrXXjufN/S4zpK28QITP/7vAThsJhx3qcUXsfkdU7PX7b01tYL4NB/LqRs10xX0QUqcggb/APWVnTbfv/wl1HRv4ze0muNy3f7yNGmIMtR6PwzIh0eVkulRFC6kLEUJwt/7adu3EQmm+SM/efIegJfc0BeITFjMHNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG3xqfQOpQ/MM+TfmY3It2bUE9accSpebY+kr3jsJ+Y=;
 b=GpmWv90rT9PUbzI/FC99sU6RmbES7yfU6k96oEZxYsIpBiAu7j4T3+MnluiN36ZtDyIeP8ItfXviTqvM/GfSSkrodEDIaFHutEwXqRy5hG3ovKKXKfJmNoaVWrwOtXBcSVs7mZXP2Q0hN565vglOSx3ykyKzo1jV3DyvbVT/0Yk5Nr2KfLpMYe765wRLOwe9iIPOl53vE0ghkEsE9BeTyBxc29r9CFLbKbGxQ6SYlcFB8VvBuE8uQUKQYHSRK7a9xNfxXAPVNzp3zokz2t7rJP3Xzd9/pA2b+U6k5Mv0sgCj7tFVGAWGhr4AGcAbjnC2D9LyLvCycR3+gvhllhDa0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG3xqfQOpQ/MM+TfmY3It2bUE9accSpebY+kr3jsJ+Y=;
 b=hZckHbTmzBQl6mJYCTXuB1h45Lru7UzEImGBfnPckAmjgu1RzcJ+taiKzzybSscWSEDnTLIZtCEfWrXhId4+tq9nz1CWTmPYAp4SJsJWhFWnHxgsAhGpx1NHxRgju+4qK3E74KBd/aj6aEJZ4IBDXW1AKGacT84GF5NIUpOU1BA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <17923afb-526d-4141-8b08-a608ac4d2608@citrix.com>
Date: Tue, 9 Dec 2025 15:03:22 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Jan Beulich <jbeulich@suse.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
 <d9a632d1-8587-45bb-bc13-8dab8d346cb2@citrix.com>
 <4fc76270-98e6-46c4-a6a4-d73772e079c9@epam.com>
 <483d50d9-a076-4698-bd14-28afabd5d369@citrix.com>
 <f6cccd82-3112-4696-850a-119843fca5ec@citrix.com>
 <18ab3734-deb9-4569-ade5-9d96a7bf3c7c@epam.com>
 <25069a8e-ef00-4706-bffa-b3b724cca200@citrix.com>
 <4e7e8f25-a658-4e8d-bdce-1e1266ff6339@epam.com>
 <c18b4522-e131-495b-bd7f-2eb7e6568a8a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c18b4522-e131-495b-bd7f-2eb7e6568a8a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0572.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: cd75caeb-056a-4d7e-5850-08de37341afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWwvdjJmQ3hyV25MUEx4cDhHSG1McVJEelVwNVdsNHlhcmdUZnB3OW9ET2U5?=
 =?utf-8?B?VU10QytjSk4xS3JlT1lxbEhXbEFuR2JFbzhPblh3Y3dpZEZCMnBaSGR6Mno0?=
 =?utf-8?B?Snc3UUpzUnJoSWFJbjF6eE95VmpmanVCcThTN3FYaUVEZGZFMnFFa2JIWEph?=
 =?utf-8?B?UGhYWXZobzdHUWc1aWVZU2JDaUpiSjEwOFhXeWdZQ1hDMXMyR2hWaGxjTnF6?=
 =?utf-8?B?YkVURW5DWlU4K3pkalpHMkU2N2FKRlBCWFk3NElDTG9EU3c1M2JTQkV2R28y?=
 =?utf-8?B?MUlRdk0rWU1BK0Q2dXR1eVoxQjYyaDhEaHhYYzBoSWlUbWxlWE9EWSthM0pW?=
 =?utf-8?B?alBOcGIrUDlYa3dCUWhkNjRNQ3AvN1R1SDVHV1h5USt5a09aUjBjRTFEamh0?=
 =?utf-8?B?UktxYWlKMkk2MlNsd0pQSzhZaVhCZ29uRVZDZ0NFNGhLUEgrYzBnL0hKRW55?=
 =?utf-8?B?emFJT0k5RVNweUxoZU9OM1EvNHRVaHQxWEdNZ3d4QnRCMVEyS0RPaEdpRExW?=
 =?utf-8?B?a2ZqMXlaRHJuWW9tZkhFNHNJUGJPeEttYnl4M3M1djQyZmExQzBwYlBRWk5O?=
 =?utf-8?B?cXpUTzlRZXNGQmEzMnJrTHI3QTJWa3VNOXdWdFFIekdZdDRxOHVTNjNnaDFo?=
 =?utf-8?B?dk56a1RJOWZTdjVkSHp3N01mbzZDVXJ2aHpLMENSMi9QclJFWHgzeER0VDBH?=
 =?utf-8?B?b0VDVjQyNzAvMHdxOHByWVR3WExGN1VEcWNiSVFnR1lNNWd2SzdXVG9yMkV0?=
 =?utf-8?B?MHlWN2hUa05tWjJOZ3ExbERVOERpZWduYU1zREMxTStCSU4wWHo0Smh0bEJQ?=
 =?utf-8?B?WDh0UE5OdEpxMkQrZXFXZFVONjJiNjlBUnpIVEtHYXhvbCtIdnJMczhkZFp5?=
 =?utf-8?B?YTlKcWQ4YkpualhWOTJVbzd3SFpHbWtiT1czYWQ1QzFvRkhramtlVkllWmhI?=
 =?utf-8?B?S29NSVFhQzhyODd0ZWd3TE9XSFdlTlZlZzJiWVZYN2E4SDdHSUw1WFJ6WU9O?=
 =?utf-8?B?NjhiU1dnSHg2ditqNzAvU0dmQXVOT1d4OThDeGFiZ3h1OU5tY2tJaFdLQmUy?=
 =?utf-8?B?MHF6aUtjbFlGZitRSTB5Tzk2c215VVNPN2M3VGViU0tFSjdkWmZORWljRCtx?=
 =?utf-8?B?MHBMcjdaTU54YW85bG5VVmF1MmM2SmtsUXRSb3hSU3c3RFF1N3MyQnlCQWNJ?=
 =?utf-8?B?VDY1bWVkaHhNNEQzTzZ3L0RMbVRjYnRSZFIxZEJxUUVBSE9DRDFQVnlTN1Vs?=
 =?utf-8?B?TFByVndIYkdPdkxYbjMybGJNM1JJWkpTdGMwTXFSUXpoak1XdVRVZTN0SmxM?=
 =?utf-8?B?RVdXdWwwUmk3aUZVSHJ2U09aSHFGTEZTaWE1djhhYmprZ05aNTE2VlQ5YlNW?=
 =?utf-8?B?RzlWaWc4SVBFeFIxYWxKWVJpUjl2RUVPMUhmblhRYXROWEdmeEdtVzVNQmVM?=
 =?utf-8?B?OWQ3amNZSCt3T2tLamVuTmZtZkw0d0o3cmZBSWNMWllDSUhwbWtldE9GTUln?=
 =?utf-8?B?M05xYkR2MXVLKzRtemlKdmtXUTgrNEh0THNEeFdqYmhYaEdxalc0ZW9RSGJi?=
 =?utf-8?B?cTB0akNGVTNIenBlNi9vK3lYVWpKYXRab2tVM1dXMi80U3hhcDV4Z1hpempz?=
 =?utf-8?B?UTFhMkhPMzVFL3QzVlFEaytZNDA0QXpjU3I4RU9DYjRXZzE3VVRrZTFXdTJw?=
 =?utf-8?B?Q054cXNZSHA1elc2RWlJbHY1bE15SDkvRE1UUXJmV2FLYkRKUUlveTR1OVNx?=
 =?utf-8?B?WHFibzdNSUlJblZpa0lRS3VlZVBxbVlJRUJVZ05pK2MvMStjdnFHNU5NYjdJ?=
 =?utf-8?B?QVBucGNZaXVvakQ0MHRMT2lEZkpWN3B0ZVpCaHhmVmxYRXJCMXcxeW5mMG9L?=
 =?utf-8?B?V1hJbDhrNFFubk1sK0FiRmZIcndsUnJrZzNOQTRrL3RsV3VpSTlQcFg3OUFT?=
 =?utf-8?Q?h8AVSa5eHznRVtCULslP90jIduRKQPuH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnVHQ005RHlKUitYVllUNXNjdUwrcWNMelY0aVpyV1gzSGNHTFNRWXN4Q2t4?=
 =?utf-8?B?U1VzRTlKUGh1TFVHWHN0Z1JWbXVtbmZ5V0VEVHpRcFlUeVBoQVlhVVR1T3Q3?=
 =?utf-8?B?ZnE4UmthNmdpanRCSEVMTXNMNmtKRDJzTlNRc0UyZnA4NzQ5cnZya2RuaE00?=
 =?utf-8?B?QzZURi9QNm4xMitoMm8yeWVOYVZubGZ3a21zWjV5aS9UNXJPVnNJd1hlZk41?=
 =?utf-8?B?Zkc4T04wUElSaVBGVGFVd09UNi9BbWxvZjNJNlpEZFNDaDA1R0xCRElpa28v?=
 =?utf-8?B?aG92cVRrUXI1dGxqd2M3dVJ3ZDMvS3RlL2phaWlOL0lvZ09vd1NCOXNjUDV3?=
 =?utf-8?B?S3Y2cVphWUxaVlU1NDk1Vmd5N1BZSE9RME1wYlBNbjIvRkJPY1o0WTlOYUd3?=
 =?utf-8?B?eDZsbDd6WnEyTEFRc2Z3U250cDl4SDh0Y0VaclJDTnNqNGZtcVhjRTAvM0k4?=
 =?utf-8?B?SGtrcFB3WkFtU2JlOGQwV3IzQk5WK0I5L0dhQUgyaWNYZy9tUDhmWGVWWmI1?=
 =?utf-8?B?bjZuamFnR0FPK1RCRHhoNUNXbUZsR0hkUDdGWjhTWGtzMExORXNKeHZNdC9R?=
 =?utf-8?B?eFdUbnhFdUNFSnAwZW05ZXJJSnI3Y2dFZEk4ODF3aFFRUnVMa2NBb2xUUnFO?=
 =?utf-8?B?R0ZsRFhkdVpCcllaMU4vNC90Q3JESmE2cGI4MWdHSTdYSnI0K2VzaE5Wazh3?=
 =?utf-8?B?RnRzZEdUL3luQzBIR2MvcGZYUUtGcUhTU24wZ3FXZkNQVlFSblc5NkE4NHhW?=
 =?utf-8?B?M09IM1dTWlNYVVBBSmkxeUlkSnY2ME5tUTRvcnc4cCtzelFBMEs3QzFpMUhB?=
 =?utf-8?B?RkdBWjEvNDVDMzVrUXhNRkwyakRVdWRhYVRJNGZ3OUg0UmliSmsrc1FkNUhD?=
 =?utf-8?B?Q1hMbVhqR1YrU1RzVy81RGJvSWpsSzhqZjJQRFY1YzN6NVFSVnZDSDNUb3Bi?=
 =?utf-8?B?MnBpN0pnTTR6YTdpWGVrTS9NcGVqRjdFZmN6Q3d0TFkrdlhsUUg4RGxzWnNK?=
 =?utf-8?B?cmlBVEpWQVhPRVFSUnpKZkhjRXlpeUlpcUsveDZQY3gxYUVLcFFTdGsxV2l4?=
 =?utf-8?B?ZjRKQ3VnQkdyM3ZoSWhQRERkN0YrWUcwei9uV2RPK0ljempvanFWUDJwL21Y?=
 =?utf-8?B?TzZtVkJ5NVFtTU9vOHZoWEpDTk9FYVZxZmg5OGZKRkFVT1k3T2NtRnRZeE9v?=
 =?utf-8?B?eUFpOGlFS08yUTA0L1dYRUMrdFJ3TTZvQjJ4VUx3eXRxazZURjNvNUFlU3Mw?=
 =?utf-8?B?V1BJTHp2MTBHQmMrbzlXa2JmWVNlS3lEbkt0ZzNacE85NFlQUVR5cXdoVFRl?=
 =?utf-8?B?SjNXeCtLNUZua0tvczZQTE9rTUp1eFozalB0VkJzcStuV3hpUFBUcHJLWDRw?=
 =?utf-8?B?bDN5WlJDOFRkVDBqRWp0TXcrazRMNmxCa1hPU2YvbHBlQWxIWndneGRVU25K?=
 =?utf-8?B?eFdUSklOc0ljVHI3Z0kwYm5HRnpYSytHSjZOb25OS2sxRzd3bzZISTdDVXJt?=
 =?utf-8?B?Z3lveDc1NnV1ODRJMDhFVjdPNUlrUE5mOWhUQitMSTZ1Q1hmWVlGY2FGQXNQ?=
 =?utf-8?B?RkdHMnVJTXhNeDBtTTNqSDN5UElwcUJObGJXeDJCdk9wUE93ZndKSUpsbHQ4?=
 =?utf-8?B?aFRWZmNVTTcxVmZmbE1KeHBWbW40M1FjeVhPdkRtVTB0VnpQZStNaGJibWpn?=
 =?utf-8?B?Q21IVUZwc3VUUFFQdVB3SHcrVU9Wc2VtRkR3UHBFUGtqdVhYa3VkOXl5YTNP?=
 =?utf-8?B?T1RndGZ5SW9OMzJaaVUyY1Y3Z1dha0w4RXJCMUlxU0tEY3FVQzN2QXRUTnZ6?=
 =?utf-8?B?TDVDZWtxcXJHaW1ubXRkTzcyamQ0Uk13TmxCVVhRLzRwcy9VU015YS9HejEv?=
 =?utf-8?B?bXR5QmZnMGQ0TGt6d3NCR3JubWlIZU5VUDR0SFp2d2hMcjFWemhnbmkwZnN1?=
 =?utf-8?B?cmtSQ0YweUt1V05LeU9Yd1Q5TytiVTVNTlZzc0NDUzZ2S21TN0x2YXJRelV4?=
 =?utf-8?B?bTkwR2lCdC9BbXN3VkM2VEk2Y0NzNWI5VUlvVjV4N210YWRRSUZRV01wckRS?=
 =?utf-8?B?dFdoR1FvUW9Pa1dtWU5zVGc0Q1hCS0VWNG9nQytEZ3lyWmFkVTYvbmEwQS92?=
 =?utf-8?B?b0duaWxhVmozbmF1Z1FZWnkvMjJKUkNEWDlrM0VVUTNPRmFXc050SU9lREJM?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd75caeb-056a-4d7e-5850-08de37341afe
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 15:03:26.5691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OI+U+QBrRKxv3EJfYeizGX2EzTdXvTLvrUmGG/cVX3Adl9YN8BbzjF13UMrmyu8ixtCjKWuA+tb1HAQve4pZNGlJOVdVAJ7FNnxCwRAR5RM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6979

On 09/12/2025 2:28 pm, Jan Beulich wrote:
> On 09.12.2025 15:21, Grygorii Strashko wrote:
>>
>> On 09.12.25 15:19, Andrew Cooper wrote:
>>> On 08/12/2025 6:49 pm, Grygorii Strashko wrote:
>>>> Hi Andrew,
>>>>
>>>> On 06.12.25 16:21, Andrew Cooper wrote:
>>>>> On 06/12/2025 2:15 pm, Andrew Cooper wrote:
>>>>>> On 06/12/2025 9:10 am, Grygorii Strashko wrote:
>>>>>>> On 05.12.25 22:00, Andrew Cooper wrote:
>>>>>>>> On 05/12/2025 7:34 pm, Grygorii Strashko wrote:
>>>>>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>>>>>
>>>>>>>>> Extend coverage support on .init and lib code.
>>>>>>>>> Add two hidden Kconfig options:
>>>>>>>>> - RELAX_INIT_CHECK "Relax strict check for .init sections only in
>>>>>>>>> %.init.o
>>>>>>>>> files"
>>>>>>>>> - DO_NOT_FREE_INIT_MEMORY "Prevent freeing of .init sections at the
>>>>>>>>> end of
>>>>>>>>> Xen boot."
>>>>>>>>>
>>>>>>>>> Both selected selected when COVERAGE=y, as getting coverage
>>>>>>>>> report for
>>>>>>>>> ".init" code is required:
>>>>>>>>> - to bypass strict check for .init sections only in %.init.o files;
>>>>>>>>> - the .init code stay in memory after Xen boot.
>>>>>>>>>
>>>>>>>>> RELAX_INIT_CHECK/DO_NOT_FREE_INIT_MEMORY could be used by other
>>>>>>>>> debug
>>>>>>>>> features in the future.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>>>>> ---
>>>>>>>>> changes in v2:
>>>>>>>>>     - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two
>>>>>>>>> different things,
>>>>>>>>>       both potentially reusable
>>>>>>>>>     - enable coverage for libfdt/libelf always
>>>>>>>>>     - enable colverage for .init always
>>>>>>>> This is a lot nicer (i.e. more simple).
>>>>>>>>
>>>>>>>> But, I still don't know why we need to avoid freeing init memory
>>>>>>>> to make
>>>>>>>> this work.  What explodes if we dont?
>>>>>>>>
>>>>>>> It will just crash when coverage data is collected.
>>>>>>>
>>>>>>> First I made changes in make file to get .init covered
>>>>>>> then I hit a crash
>>>>>>> then I checked %.init.o
>>>>>>> conclusion was obvious.
>>>>>>>
>>>>>>> For example:
>>>>>>> objdump -x bzimage.init.o | grep gcov
>>>>>>>
>>>>>>> 0000000000000010 l     O .bss    0000000000000028
>>>>>>> __gcov0.bzimage_check
>>>>>>> 0000000000000040 l     O .bss    0000000000000040
>>>>>>> __gcov0.bzimage_headroom
>>>>>>> 0000000000000000 l     O .bss    0000000000000008
>>>>>>> __gcov0.output_length
>>>>>>> 0000000000000080 l     O .bss    0000000000000060
>>>>>>> __gcov0.bzimage_parse
>>>>>>> 0000000000000098 l     O .init.data.rel.local    0000000000000028
>>>>>>> __gcov_.bzimage_parse
>>>>>>> 0000000000000070 l     O .init.data.rel.local    0000000000000028
>>>>>>> __gcov_.bzimage_headroom
>>>>>>> 0000000000000048 l     O .init.data.rel.local    0000000000000028
>>>>>>> __gcov_.bzimage_check
>>>>>>> 0000000000000020 l     O .init.data.rel.local    0000000000000028
>>>>>>> __gcov_.output_length
>>>>>>> 0000000000000000         *UND*    0000000000000000 __gcov_init
>>>>>>> 0000000000000000         *UND*    0000000000000000 __gcov_exit
>>>>>>> 0000000000000000         *UND*    0000000000000000 __gcov_merge_add
>>>>>>> 0000000000000008 R_X86_64_PLT32    __gcov_init-0x0000000000000004
>>>>>>> 0000000000000012 R_X86_64_PLT32    __gcov_exit-0x0000000000000004
>>>>>>> 0000000000000020 R_X86_64_64       __gcov_merge_add
>>>>>>>
>>>>>> Aah, we should exclude the OJBCOPY too.  That's what's moving
>>>>>> .data.rel.local amongst other sections we target with attributes
>>>>>> directly.
>>>>> we can't target.
>>>> I've come up with below diff - seems it's working without
>>>> DO_NOT_FREE_INIT_MEMORY.
>>>> Is this what you have in mind?
>>>>
>>>> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
>>>> index 8fc201d12c2c..16b1a82db46e 100644
>>>> --- a/xen/Kconfig.debug
>>>> +++ b/xen/Kconfig.debug
>>>> @@ -40,7 +40,6 @@ config COVERAGE
>>>>          depends on SYSCTL && !LIVEPATCH
>>>>          select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if
>>>> !ENFORCE_UNIQUE_SYMBOLS
>>>>          select RELAX_INIT_CHECK
>>>> -       select DO_NOT_FREE_INIT_MEMORY
>>>>          help
>>>>            Enable code coverage support.
>>>>   
>>>> diff --git a/xen/Rules.mk b/xen/Rules.mk
>>>> index 8c4861a427e6..47fdcc1d23b5 100644
>>>> --- a/xen/Rules.mk
>>>> +++ b/xen/Rules.mk
>>>> @@ -33,11 +33,15 @@ cov-cflags-y :=
>>>>   nocov-y :=
>>>>   noubsan-y :=
>>>>   
>>>> +# when coverage is enabled the gcc internal section should stay in
>>>> memory
>>>> +# after Xen boot
>>>> +ifneq ($(CONFIG_COVERAGE),y)
>>>>   SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>>>>                                               $(foreach w,1 2 4, \
>>>>                                                          
>>>> rodata.str$(w).$(a)) \
>>>>                                               rodata.cst$(a)) \
>>>>                            $(foreach r,rel rel.ro,data.$(r).local)
>>>> +endif
>>>>   
>>>>   # The filename build.mk has precedence over Makefile
>>>>   include $(firstword $(wildcard $(srcdir)/build.mk) $(srcdir)/Makefile)
>>>> diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
>>>> index 60b3ae40728f..8180c78f1510 100644
>>>> --- a/xen/common/libelf/Makefile
>>>> +++ b/xen/common/libelf/Makefile
>>>> @@ -1,8 +1,10 @@
>>>>   obj-bin-y := libelf.o
>>>>   libelf-objs := libelf-tools.o libelf-loader.o libelf-dominfo.o
>>>>   
>>>> +ifneq ($(CONFIG_COVERAGE),y)
>>>>   SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>>>>   OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section
>>>> .$(s)=.init.$(s))
>>>> +endif
>>>>   
>>>>   CFLAGS-y += -Wno-pointer-sign
>>>>   
>>>> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
>>>> index ae0f69c01373..fb26e5bff0fd 100644
>>>> --- a/xen/common/libfdt/Makefile
>>>> +++ b/xen/common/libfdt/Makefile
>>>> @@ -4,7 +4,9 @@ SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>>>>   
>>>>   # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed
>>>> during runtime.
>>>>   ifneq ($(CONFIG_OVERLAY_DTB),y)
>>>> -OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section
>>>> .$(s)=.init.$(s))
>>>> +       ifneq ($(CONFIG_COVERAGE),y)
>>>> +               OBJCOPYFLAGS := $(foreach
>>>> s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
>>>> +       endif
>>>>   endif
>>> This is the (aforementioned) non-standard way of doing .init.o, which is
>>> why it doesn't play nicely.
>>>
>>> I suggest that we first convert libelf and libfdt to the standard way of
>>> doing .init.
>> I assume the rest is ok.
>>
>>> For libelf this means we need regular __init annotations, but #undef'd
>>> outside of __XEN__ (when we're doing the userspace build).
>>>
>> Need clarification here - this are imported libraries and changing their code
>> directly was not welcome before. Therefore there is Xen specific magic in Makefiles.
>> :(
> I can't and won't speak for libfdt, but for libelf I think we should really
> consider this ours (not imported) the latest as of the re-work for XSA-55.

Agreed.  libelf was already modified for Xen, and then XSA-55 made it
entirely unrecognisable.  It's very much our code now.

If we really don't want to modify libfdt's source, we should make a
standard way of init-ing code like this, so we can move the custom logic
out of libfdt's Makefile.

The problem really is custom local logic; that's what we need to fix.

~Andrew

