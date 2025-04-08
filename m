Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A520A7F8FD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 11:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941615.1341061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u24vc-00054z-DG; Tue, 08 Apr 2025 09:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941615.1341061; Tue, 08 Apr 2025 09:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u24vc-00053T-8w; Tue, 08 Apr 2025 09:07:32 +0000
Received: by outflank-mailman (input) for mailman id 941615;
 Tue, 08 Apr 2025 09:07:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wetR=W2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u24va-00053N-P3
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 09:07:30 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e48fc622-1458-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 11:07:27 +0200 (CEST)
Received: from DB8P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::27)
 by AS4PR08MB7631.eurprd08.prod.outlook.com (2603:10a6:20b:4ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Tue, 8 Apr
 2025 09:07:22 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::a9) by DB8P191CA0017.outlook.office365.com
 (2603:10a6:10:130::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Tue,
 8 Apr 2025 09:07:22 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Tue, 8 Apr 2025 09:07:22 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AM8PR08MB6563.eurprd08.prod.outlook.com (2603:10a6:20b:315::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Tue, 8 Apr
 2025 09:06:50 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 09:06:50 +0000
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
X-Inumbo-ID: e48fc622-1458-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=R071GjeugQwYV4zpMtmvSYN/g02J/y3rHg37etvMACmTivs7Bg9XypgJFWEXKfss1DQG01VDcsq4I2tcjtHucT1IYdCS8UDsP1ZhiqA0K7XWvF51GmsOzCylCgdz0vVTkGrLWck++p7mUWGza1xpIfpC3k33TNvJ7498liWGHAlFpay8nnPF28njMJLytTjtiuSNXN7d7OR68E0t+nbOsEGr+jAtyB94kxH9D1B2BSoaSjR5UhgUTtg6/bsvpBMlZmuo98YDDPgi8axjg6upOeZ2ja6fCh0wMdqfNAC2+7iT9dfp39qJFhC7S4Ube2vYz2T+437c4gfq9JlALYh0Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjfKsFNQY8GAg6w7ApVnQel3l2kAt7UeaB4GFYaYTm4=;
 b=bv1fKZn3b51JRIoFv3GBEyirpHP41i7QGZ/8L8Z/ve/e9dR49/TLuDRXySZfmfasIxFJFQs6VMIL2TDat3PpPRyScAbLav2PkZ8MRw4VdX4oflQ2Sdbh0zqEhlh+BCWcYXr3cTynwLS0ivuCpWHea19yp/c2YjvS6g+DLvQU9+4LN6s4BDP96fW6HNC7j3yDiwRWVCX8q0sa+9nLeQZ9ZEkSs44Ul16cy9EsWz2+VNZj93SyYFSYZpxdPqXicpOYE8QkX8HHo2+8u6iUmxmHYnJhWgBWei/yueoc6b/9ellPzuGWz6HLy2iYA3AoJK1QPKUD+uCkiIOLHJtVP6z9Tg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjfKsFNQY8GAg6w7ApVnQel3l2kAt7UeaB4GFYaYTm4=;
 b=Y66kyAZgK6Y2ud+/2wxCcbxWg3Yj0MpK9Y3+9jzncYE+fWhLE+EWavZAXVLsfFfCzGienrQWTxzSlWu/t8kZBwdMzxjehcijE4hZ+QHUXJFXS2PR9LOCqQqZhCWK5zDn9E7BukE1HDHL/W7QicvNmu2HKSQiCPXM5Yk9niYyWUk=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGnBN9XMIzYBtWgx5usN0BmaJFunFUyw5UrzKMx06f5Bk1gm1Ew7qjrMhi1BjAk+iudaIiI5AZ9zYrbPolwHzv6g/KSCbKGooGrbSyScI7Br6aDb+ff8QLwa2/aaeQ4hG5Ct6zffPfnzB2FR8+xupYvQZr4Uf+OuJ3N0Powht2cNCpZCulSEv1fHYNT4ek2EP+OuQw/tiOHivRRCTNumNvL2AGbrvM86bOfpzIgtYN13kxtWTLqlGkhz8LoSKWrfxNVXdTkkCDLmy5fRETvAtsvTk+zi/tMR38QMgdYYAnSMuiK7oEXOAeu0EQbgcC72j7MKWYcMof6Iq8nQHRS1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjfKsFNQY8GAg6w7ApVnQel3l2kAt7UeaB4GFYaYTm4=;
 b=btVyXR6hVVEYaKMT0FSayF9U2cI3eabbHiRXfcccnyLyMHeXCrPWcg8TW/khMzvdPQkq6aaGs1wL4xA0YHo7YVBheRvXh5LWw4iRDBp9Y9S74qz8dBMb8Mdo7GEGb5Wh5BTRHpIqxqsaNDK9aBGrz7Y2t/pZfNJqbZj6waCpGkACRtjMBy01rH5Hy8XNBH4dnzwTde7Kmo/YYHG3LEYtuEJraq6MP0KoNWEDBsCx3eVk+U8MRKTAIouEB67Lip4n+jt6aGzgS48SBx2qGBSfnoqsGJrZeTy+XLsSut8sHRIJWJ1tjRVlUgbZ2FAp19jthKIhMTLhyah7QKLBdelWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjfKsFNQY8GAg6w7ApVnQel3l2kAt7UeaB4GFYaYTm4=;
 b=Y66kyAZgK6Y2ud+/2wxCcbxWg3Yj0MpK9Y3+9jzncYE+fWhLE+EWavZAXVLsfFfCzGienrQWTxzSlWu/t8kZBwdMzxjehcijE4hZ+QHUXJFXS2PR9LOCqQqZhCWK5zDn9E7BukE1HDHL/W7QicvNmu2HKSQiCPXM5Yk9niYyWUk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
Thread-Topic: [PATCH v5 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
Thread-Index: AQHbp+1A9+alQyM7NUm0i9guCUDbS7OZeyCA
Date: Tue, 8 Apr 2025 09:06:50 +0000
Message-ID: <8E041BA0-2C36-4185-A2A3-B92CFDAE11FE@arm.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
 <20250407184443.1790995-3-ayan.kumar.halder@amd.com>
In-Reply-To: <20250407184443.1790995-3-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AM8PR08MB6563:EE_|DB5PEPF00014B98:EE_|AS4PR08MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ff29c6-453d-4538-a09b-08dd767cc5ce
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dE5MRUowaUVaamZsZTdVYlN1S3ovNVhWY0xMcnlVK1I5MW4rVFNGTzV0c2JY?=
 =?utf-8?B?UkU3QnhIMDlMajY3NWQwZ0RUc3dyTGtnM09VRVhUVU5iRFNHZDhkUTdHNGpN?=
 =?utf-8?B?dkt1YnlNUjc1ck5Jb3RzRHZIaEgvaytCdUVtVW9TcXBuY0R3MFFhNnA1dFlF?=
 =?utf-8?B?ZjA3YTVOTkQ5S05zRDZNV3p6dnNwTHRlVndSeHlrNjRldVJvVGtHU2xJNkRz?=
 =?utf-8?B?YlJ6UVpONFExYkZLanFtQ09BR09HTkJ5MXN6UGN6SXNVbml6eGJRM1QwdWZk?=
 =?utf-8?B?MXhZM2pZd2tPS1gyNFI4N1hDK1BUWTNXc3d0ditYeUQ0WGNWbW9QUnNDM1pX?=
 =?utf-8?B?cVpxQzdCR29OdXJGRFdpUVpwL0dJNG5wem81MkRtNEV6VnVLN0U1UWQ5TFV3?=
 =?utf-8?B?M2tLams0Q21OYW9QUmZGQWRzTHZkTFF0dmp0VkxDYjludS9hcDlOVDJkcXJt?=
 =?utf-8?B?L0Q1Lyt0Z1BoWkMvaTdFSDBtc3R4NjVIL1R0K05ySHQxUWY5cDRNaDBtdUJq?=
 =?utf-8?B?ZGU2YUxnT0ozR09KZkpyL004akJXdVN4cVZBVS8zbVQzZ0ZOSXRzZU1qNmh5?=
 =?utf-8?B?ZktTVno1ajd2VGh5MVBtRTZpN1lLMGFGdXR3SnNhRjJhQVcvckcrZGR5cTRx?=
 =?utf-8?B?Z2M5M2U4TkFuN2JTODBHYk5aQ3g4SnNUQmlEU0ozWE5XbVNUQndSa3JZZ3Np?=
 =?utf-8?B?OXNrTDFkdU9jdDlNY21GMHplemYxZmhjSzBWZk5vemtRYlZTU3RPSWpPSk4z?=
 =?utf-8?B?TEtSQ2xQT1c5SEJyYzY2dHJxSVcvOXVBWDIvYWl0cDlwWmNUaEJsejIrckN4?=
 =?utf-8?B?YzhSY1lhSmdoZnFMc2J4MU5jU2s1YURWRUVmU0dvQVh1YVVHc0RWL1E2bGZI?=
 =?utf-8?B?bVBHSGhJcjY0M0J1U3hyQmRDTjhXWDRicUFSc1RtQXZoTmVqbCswTEpmb3ZY?=
 =?utf-8?B?Lzdac0tRcmV3d3UrNEYvWGxRMFd2QU9rNXU1SVV3c1YwUUpKY1RjdG9VWTBh?=
 =?utf-8?B?OGJiSFVwUWtFdndzck1Ibk92cDExQVYxdVlYV2J0RWYvd1ErNEorZEtMOFBz?=
 =?utf-8?B?dXY3bjlMQ2gxNjlHTEFrK1RRaFhxUE52ZVVWT1k2a1J1R2E4TjZTNlArNWRv?=
 =?utf-8?B?UWw1SVVOL0xVM0FiYUlyNmdPWk5aSWN4MkpqSHNlR2o1Mmh0MXF4dVk3L0xr?=
 =?utf-8?B?Y0xjRDg5S3AzL1BsUklKbUdxWXJ6VXpiWS9lVlYwN1c5NlVFRXZjMVd6ckFk?=
 =?utf-8?B?RTVjbmZDdWpCcDY2M2Y0ZjB2dkluVXNJbHkvNnUzNG9zcEw2cTlOY0gzWU1K?=
 =?utf-8?B?aDVhK1lHZkF5V24raVNtTHVWdFpoQmxqeFpXaDA5QjdrN0dnNzU2ZnltamRt?=
 =?utf-8?B?cldaZVJ0SXRrY1pUU3ozL1B5bnM5SjZnWGgzWUE4Y2ZYTHpZSDlnOWZOaVZp?=
 =?utf-8?B?UmhFOGRESWo5R2MyZWNZL05pZlA5UVNLTXBUTTVuencvZzJobytBUE1GTVd6?=
 =?utf-8?B?Q2pBbGw3RDZGSWEvTkFYQ2xmNFpjd2xkeERkRzRCMGZaT3JGRXN6NXJzNXpJ?=
 =?utf-8?B?K0tkZ29GQVlYenBlU3E1dkdySXJMSGlZR0h6L0hIQTc0WEpJRXY2ODlqZTNB?=
 =?utf-8?B?ZzBSelNob28xd29YdTBUeVpLMnF3eTZoaVNabThEVzBTWWVaUW9VVnZseGFP?=
 =?utf-8?B?eHZxNHp6MEJtNHY5QTdvYnNtN1VtdzhPb3ZLRXNuTmFYOHRrdGdOVEozakdm?=
 =?utf-8?B?SXRPaVNNR3pGZkZzOElFOWdrYmNjcm9RcVg4QmVid1h4WnEwYzhyTkx4Yncv?=
 =?utf-8?B?aHNuc0pYbDRKbGRxR1Q5cmc4eXpWclZxOXdHOWE0cWNQOWJBVXZjUnBLK1U1?=
 =?utf-8?B?WGJkaXZkQWh4eGhHYk9WZHpLRHFXcXRBOGZkYWNZM2ZiUE1rWWpGTlpUY2Iw?=
 =?utf-8?Q?V6knLrAMILm3Sz9edwjsZZclN/aJt+/K?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C09DE8265E245645892C6684CC140AEA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6563
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1573adf5-93f6-4617-7ab7-08dd767cb2a5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|376014|36860700013|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWtGQUovd3hrS3VOYTZCeHBTWGhuNHhPZWVvVnQyRkNRYW9BSVZBR2YvMkxq?=
 =?utf-8?B?MUtHbGZGZWVVMzZ2ODZWSE1sOW1pTzVPQ0RCODJmWGdyZzlJTVRQVXhNVEht?=
 =?utf-8?B?NGNlSklmZVRxSXR0MUhQeWZUNHVBZXdtNjVQYjc1eTlJUkR1R3k1dGtoY3ps?=
 =?utf-8?B?bWRydlVWVC9hbTZWMmptNWx4VW43T2pKSkY2Ry9yVTRuUFduK0R5TFdWMDB4?=
 =?utf-8?B?V1V2SlhkTmlxN2FmVWtCbUpKaGlDMENZNmIyTUswcGtzcXA0WFdyZ3FodVdk?=
 =?utf-8?B?LzI2RUV2bDU1WWdhVkFud2w2U3lCa0w4MGNWMTgxdnpKRlVHWEpkY2Z4cnVZ?=
 =?utf-8?B?elFyV05kRUpHNG40dy9yd1dPM01UR3B2RWtYQW5KTUJxRnVFVXlVVmUrRmFu?=
 =?utf-8?B?L3Q5YmlwMjVyQytpN3RXQitJcVNod2FCZXVCdEdSbEFBblhkTXgrUCtGb29z?=
 =?utf-8?B?YUEzUlk1UUUvWE12bkVqaE1PUW5WbWlRWnBEekNhNEYySEJYWFZsNDBRc2NV?=
 =?utf-8?B?eFNnb3pSMU0vVmU1UUdYUFU2RlBhbVNZVEk5RFBoTmliV3g2aXk5bDdhUi8w?=
 =?utf-8?B?UHVMME5WNDRyWEwrNG1XMHk0YzlXVVVoL1dYSDY5cUU5L1VMZ2RJVjZrNFcy?=
 =?utf-8?B?ZWhpUGNWMDlpa0UzYU1Ib0o3WmVrTmphc3YvTHp6WkZETzZNWmd5VEdjaUZT?=
 =?utf-8?B?VlNjdGVaczR5ZVNCZjBxQ1FIenU1M3Z4VlJ4WVI3YnVQZEoxMG13dW5mOFI5?=
 =?utf-8?B?TzNnTmI4cDV2WXNvWWZGNXExVks0eXNHRmQza3ZEeklFeTQ0c0lNcGd5TkYr?=
 =?utf-8?B?cFo4TVNhZzBmaVd3Y28ySzR1eE9hZytKNmxFR0F6MEkyTXdXYkZTWFBNclZ6?=
 =?utf-8?B?Ni9iU2ZSR3BkYUg3UmVYYnQyR1JBUWFMWWxXelZWZVFDWU8zcXN6aUh2aHc0?=
 =?utf-8?B?cUJzeVBYVGdxK2E5aTlSNVFjM3FUUVRZYnF4RnBoOXZ5TEM1enR3K2ZMREdx?=
 =?utf-8?B?TG1pcXZrZUlHQ0NxNU1IWHRJWGZHNTQ4WE5DaE9ORnpWUmErY1R1empMUHpR?=
 =?utf-8?B?QzFldytMdHJkMEFIVkhGLzFXc3R0eWl3eDkxZjM1ZVZPRkoxNnE5M2VtdHBZ?=
 =?utf-8?B?M2I0SVo1VTRpY0xsR2o4T3Z2RHkyTG15Tjc0ek9XM2xHeGZaQUlxMmJ4cTZ6?=
 =?utf-8?B?b3VuNkgwY25QZUMvUEhacHQwbXc2NzhWbDFoaFBQcVZZUE10NjlSZG5PSUww?=
 =?utf-8?B?REowbmRydHJCbHdlb1RZZGQ1S3pHdUQyZUFKcUp4bWVXajc4bGlJWmkzbXI1?=
 =?utf-8?B?ZGpaeEJZMFBsbUdNRzc3TnhZY05Kcys1VlFoUmc5U2NZaXd2VGo5bnBSbkY2?=
 =?utf-8?B?OUU1cUtCN29hQ2dDNTltdjlEMFdveGFrQTdtT2t2R0tHVU5mUHp4TFlhK00z?=
 =?utf-8?B?MTBNTEVJVWlHSkVKM1ZxZFdwYWE5OE1JWTBsMTFVd2E3MDFldlJJcE5ZbWNI?=
 =?utf-8?B?YlhkUndhK21nOUd3dzZpUDhsUzA0Uzl1NTMyZkJRM2Z4TmZsVkZYQjlSVVAv?=
 =?utf-8?B?TkJNSnJZdThsREt3bmFEdWt4b0FnRVlDSzZBbThXeFY2RURzT0JQMzRwWHZ4?=
 =?utf-8?B?M21LdFlIRkdHMWpuTzdTdHRaOUM1djU5WmErMUNiaFJDVmJNRmFQQldWakpn?=
 =?utf-8?B?Yks5Z2VNNVdqMnBmTDhNYW5FbU9XcTB6YjNabmZ1TVlXMEdZR1VoZkEvM1M0?=
 =?utf-8?B?aFB3VU9sSHRiRElDMlc2aTYvdVdwRU50KzBDUWxpd3pRVUZpeTBIM0VpeVQx?=
 =?utf-8?B?S2MzMkZobFNwRDRzT1ZscTZRdzBmc1lrMUh6ZUtycGE3bVM3czZFeFdWTjJl?=
 =?utf-8?B?dktQV1BTeVkrcEtiWWtFaUhLdW5iWU85alg0QUd6YlFGZ1hLcjk5eEovVU55?=
 =?utf-8?B?UFQ2UHJrcWxJbUwvY0Z3c0E1N2dqYnZJcTNWeW5yQXBla0RWNlVsWW0xQ0Vp?=
 =?utf-8?B?QlBKQVc3SG5ZSitTQVFaenpaTGo5ZDFtamJ4ZldzSkdJdE9kSG9KakxiRHJm?=
 =?utf-8?Q?goa8NM?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(36860700013)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:07:22.1278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ff29c6-453d-4538-a09b-08dd767cc5ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7631

SGkgQXlhbiwNCg0KPiBPbiA3IEFwciAyMDI1LCBhdCAxOTo0NCwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gV2UgaGF2ZSBjcmVhdGVk
IHRoZSBzYW1lIGJvb3QtdGltZSBNUFUgcHJvdGVjdGlvbiByZWdpb25zIGFzIEFybXY4LVIgQUFy
Y2g2NC4NCj4gQWxzbywgd2UgaGF2ZSBkZWZpbmVkICpfUFJCQVIgbWFjcm9zIGZvciBhcm0zMi4g
VGhlIG9ubHkgZGlmZmVyZW5jZSBmcm9tDQo+IGFybTY0IGlzIHRoYXQgWE4gaXMgMS1iaXQgZm9y
IGFybTMyLg0KPiBUaGUgbWFjcm9zIGhhdmUgYmVlbiBkZWZpbmVkIGluIG1wdS9jcHJlZ3MuaC4N
Cj4gDQo+IEFsc28gZGVmaW5lZCBXUklURV9TWVNSRUdfQVNNKCkgdG8gd3JpdGUgdG8gc3lzdGVt
IHJlZ2lzdGVycyBpbiBhc3NlbWJseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEF5YW4gS3VtYXIg
SGFsZGVyIDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPg0KPiAtLS0NCj4gDQoNClvigKZdDQoN
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm0zMi9zeXNyZWdzLmgg
Yi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtMzIvc3lzcmVncy5oDQo+IGluZGV4IDIyODcx
OTk5YWYuLmE5MGQxNjEwYTEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9hcm0zMi9zeXNyZWdzLmgNCj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTMy
L3N5c3JlZ3MuaA0KPiBAQCAtMjAsNiArMjAsMTMgQEANCj4gICogdXNlcyByMCBhcyBhIHBsYWNl
aG9sZGVyIHJlZ2lzdGVyLiAqLw0KPiAjZGVmaW5lIENNRF9DUDMyKG5hbWUuLi4pICAgICAgIm1j
ciAiIF9fc3RyaW5naWZ5KENQMzIocjAsIG5hbWUpKSAiOyINCj4gDQo+ICsjZGVmaW5lIFJFR0lP
Tl9URVhUX1BSQkFSICAgICAgIDB4MTggICAgLyogU0g9MTEgQVA9MTAgWE49MCAqLw0KPiArI2Rl
ZmluZSBSRUdJT05fUk9fUFJCQVIgICAgICAgICAweDFEICAgIC8qIFNIPTExIEFQPTEwIFhOPTEg
Ki8NCj4gKyNkZWZpbmUgUkVHSU9OX0RBVEFfUFJCQVIgICAgICAgMHgxOSAgICAvKiBTSD0xMSBB
UD0wMCBYTj0xICovDQo+ICsjZGVmaW5lIFJFR0lPTl9ERVZJQ0VfUFJCQVIgICAgIDB4MTEgICAg
LyogU0g9MTAgQVA9MDAgWE49MSAqLw0KPiArDQo+ICsjZGVmaW5lIFdSSVRFX1NZU1JFR19BU00o
diwgbmFtZSkgbWNyIENQMzIodiwgbmFtZSkNCg0KcHJvYmFibHkgdGhlIHNhbWUgYXBwbGllcyB0
byB0aGlzIHBhdGNoLCB0aGlzIG9uZSBuZWVkcyB0byBzdGF5IHdoZXJlIF9fQVNTRU1CTFlfXyBp
cyBkZWZpbmVkPw0KDQpUaGUgcmVzdCBsb29rcyBnb29kIHRvIG1lIQ0KDQpSZXZpZXdlZC1ieTog
THVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQpDaGVlcnMsDQpMdWNhDQoN
Cg==

