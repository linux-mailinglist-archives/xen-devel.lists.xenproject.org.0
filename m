Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411FA8B924
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 14:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955949.1349488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51vu-00073x-9M; Wed, 16 Apr 2025 12:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955949.1349488; Wed, 16 Apr 2025 12:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51vu-00070k-6V; Wed, 16 Apr 2025 12:32:02 +0000
Received: by outflank-mailman (input) for mailman id 955949;
 Wed, 16 Apr 2025 12:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hq9D=XC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u51vt-00070e-1t
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 12:32:01 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca4aa766-1abe-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 14:31:59 +0200 (CEST)
Received: from AS4P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::14)
 by PAXPR08MB7551.eurprd08.prod.outlook.com (2603:10a6:102:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 12:31:56 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::3e) by AS4P191CA0001.outlook.office365.com
 (2603:10a6:20b:5d5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Wed,
 16 Apr 2025 12:31:55 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 16 Apr 2025 12:31:55 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS8PR08MB10313.eurprd08.prod.outlook.com (2603:10a6:20b:5c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 12:31:22 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 12:31:22 +0000
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
X-Inumbo-ID: ca4aa766-1abe-11f0-9eaf-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EBaXw5HkQurNZJOhr+SHDoi5MEtkSzvsQ4unTMk+RLGFCQpLDh8jZ6TtHQR6GfxrS4B+pArtqJp+K9mlEejsPobtprfol2AMiIa6DTzzyq+Azu68i2kZhfFyLSuxqtAHBvn85bd9jkP/gQKIlhW0JoAYbWBbkitFGdZGi3hy+0aEj8JtrQJ49AZ5LnnK+oVSujCjystJ0oIbmferfStNlBIMvj6gnKWkRZnn/MkevraexrfNW6O2GPT1VmAaRGdRGkYwUYbDebpa0W6AhXdeK3j2Y7xHDPWP49o+kjpbVVLhVZBdnD8yzBgsn82afhQl9oSgb/Yp9OYFBB2sZjnsXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKE9hTGFmIMD7PzxQ/Z3eU5/nDONibidLGD5JZxcsBI=;
 b=d/lhAdYTxEmr5szR4fSjlQ8KMVSs5D9vpvy9817mrjXKd9mAlWady3QJCqUbezEF7oTDI2WRTf/oMGMgMtQzvaEsiO/QJILoWGLa3tT/Cfw4426nfy0bUi/fY08uPwxixDfXvwLmX82FrgTpemx96PDlGz+rGRXFQvuIMsFsiWJ8W+BZMcRqE4fEGfFrMx1Ti/N4C+L7yi5SSYIb4UpVTaDF89yYlpQlxOrZfOBnGEyNlKbdV928bemeEd2HcWYT9nCWzAyNM3YtFPnQ9SIFrIJw7n2S5RkVprg+6T17QiftnLHAVeK14h6dR3gpfjF8L1XhPoNZZBrmBiqLx57V/Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKE9hTGFmIMD7PzxQ/Z3eU5/nDONibidLGD5JZxcsBI=;
 b=Cbf/AVBgm5g5Rn2soE2KBb85TwnTNLpUWGLbY4JrTAhQ+FGBgHm/H6JVNium3veiTZZ7+IIu6jZZBYfceKpkgeESre+f2Vm1hV00xopryRherMdiV9/sS4rFo4C7plKDEdDdqguVXaoLuGmIOB3OvHwe3qS2u6eJp731H3cI78k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMvQNMiBEs4fxX5X5iuYK2i77x236tW5Yfb4DBNu6b3VJD1Ayv43TC7/xN/FHRDldGUGTyFaw+HPRgFojm399+WCt9Owpo6RUxfHL6nbIPpMQUrlaM65Z68+x8ZQaO23OHtbE+D0OspCthAi+GOtvqvBRnoBYp2WzbjuSlP3vauHx01SpyBSBUFVhdrTd0ou5uS7ZqHL9AhlVEAr25eEloVA967UNgxkovGtBRl2sliiX6db+McwqcaOc94f4BtCn6Hk8CAgme19F91zCWf6p/h84JYF+jmfuI/ZkafF+Ch3USR7cPdPzumjeBhBEByzOs2xtGSWORr15m7C571fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKE9hTGFmIMD7PzxQ/Z3eU5/nDONibidLGD5JZxcsBI=;
 b=N4NiYA3pZ6/yxQf72zn5D44L6lnoQRDX8YleJs1tB8WFuY5v5aLHN4foOUhZPRp3cZjJ665sGDut7SaKW8/pLnXWpCeZicjWtfQKFik6rWQ150uhozLe1kmbk0oFvdQn3jXXIgNr7DGo66THZcVtvnf8vl4tXAcQiE0XWuTewqjG3aTaUSmrpkeVJPuzaZhugq4p8Alfrzmxzb/FJu9F00tw5gJM57wlTWMDMdjg8/QKqBJ5NRGs8+blP0MNmrRfOjZTuiFekm1HyQgRs73r9B49TpleAJqQYnE7F+SH5GLMAgnRE6b4lcln0YISCNpCIdjTHTwhOpkFWJ9ab3P0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKE9hTGFmIMD7PzxQ/Z3eU5/nDONibidLGD5JZxcsBI=;
 b=Cbf/AVBgm5g5Rn2soE2KBb85TwnTNLpUWGLbY4JrTAhQ+FGBgHm/H6JVNium3veiTZZ7+IIu6jZZBYfceKpkgeESre+f2Vm1hV00xopryRherMdiV9/sS4rFo4C7plKDEdDdqguVXaoLuGmIOB3OvHwe3qS2u6eJp731H3cI78k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/7] arm/mpu: Introduce utility functions for the pr_t
 type
Thread-Topic: [PATCH v3 3/7] arm/mpu: Introduce utility functions for the pr_t
 type
Thread-Index: AQHbqvIP34UccZOkWUuu+Y+Ap2U3MrOmJOcAgAAb/QA=
Date: Wed, 16 Apr 2025 12:31:22 +0000
Message-ID: <0877268B-138F-4FC9-B95E-544699D8AD91@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-4-luca.fancellu@arm.com>
 <d2b51729-e5dd-4325-9275-615ab1cbb68d@amd.com>
In-Reply-To: <d2b51729-e5dd-4325-9275-615ab1cbb68d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS8PR08MB10313:EE_|AM3PEPF0000A796:EE_|PAXPR08MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d6ed85-a260-4128-f971-08dd7ce2ac82
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ckNORkJHSVFVRm1EakhoK0NjSjZTcmVNeWp3VkZQWC81TTJzeG1DdDFtQmV0?=
 =?utf-8?B?b1luNWFJY3lQRHJsZFVDTjE5dzU4VlpDWlRmc2FUdTlmc0NacHUzd3FNVVdR?=
 =?utf-8?B?akZCNGVMTHltK2hBelEzYURudEVvYmd3WlF0NVZwa285eHpNOXJESS8zZXk1?=
 =?utf-8?B?M0NFTHE3RFhPVmw2QkZaY0Q2cWgrMnBqNS8xN2dwelcxVlpBcThlVWVEcWJ2?=
 =?utf-8?B?YkRDYUpqRXl6bVJaLy9zejdUT2UweURwcS9HNEJENGx6Smo1WGF2ZE00Y083?=
 =?utf-8?B?S0YwbG0xOWlVV1pWdlNlMWQzVXRxSVRybHVPZ2crZjRIdE5TL29tbTZ0enNM?=
 =?utf-8?B?ZVB5ak5BTkRMaWdIUEFWZ29mN09Ga3BjS2hnVmhWYjFxVG5FYVZla0VqRlhu?=
 =?utf-8?B?K0JiVWFITnJjeFd6UDBUU0FqV2llT2x0MEFSdFd2VzFsSEZQZEp6MWI5anJv?=
 =?utf-8?B?T1FUdmJDYlVxVWFoZDk2bHRKUk1MMnZCVFE5Q0R3aVFYUDhjNW9weGJmeHB1?=
 =?utf-8?B?SEZOOUVnRkdoYU00aDNKNHRMUlNYZzhWcUp3bmVESXZvV25XQmdIcGQxbDNs?=
 =?utf-8?B?ODhDYnlubGVONFBJcmZENU5MSXlMY1B5K1JKbVViNW1BZzV1UG10QlRTY29X?=
 =?utf-8?B?a2d3Uk9hbVVEdkFWOUxWdnJxRXVBRHZMay9UYkt5ZTBiRkJrNVZVZnlIRlJB?=
 =?utf-8?B?bkNGUmdQQ0VkQlovQVZsblY2cEtjK0pYSVpadDFFR3RreDVhS0VzMEsveW5o?=
 =?utf-8?B?Q0RoMVJwdDRDUHQ5dVJocjZVc3lxTHcraHZkeVNraXVSNTkzSWVUQ3czMkpw?=
 =?utf-8?B?ZzF1NytTNlNwTFB2aTVEU25TTmt4RTZxTUFNeXkvNmpkWjBSbE05Q0RUNitk?=
 =?utf-8?B?cjl3VjlCeC92eEF1SW9YdFZVRUxLVElQdExad2gzbnZjSTN3VTEzaXJRSTJI?=
 =?utf-8?B?dDE2SXdUM0FwMUdBNTVoNkIwbHVFMlM3TGJRcHlZcC9ON28wcDNPSXQxbS90?=
 =?utf-8?B?WTk3cFY2N1dqRCsxUG1QandsK2pjZlZscGdWNTFxYWcwV05HY3NTenRiWXRE?=
 =?utf-8?B?SVZJZkFHMllkWnExTzNpY2tFOFFuekEvVWozd1pMdEw2VVBZMjkxRE1GZE1V?=
 =?utf-8?B?TnZLTHI1eGNHSTE0bDhRWFk4VW5PMkhwS1h3RHRKMVp4MlhYK0t1U2tOVlRC?=
 =?utf-8?B?NzA0eC9tYzJ1VzlhdHZmMHN2bjAxZmtzT0ZrN2l5c2UzbDZwUGNCYmk0b05n?=
 =?utf-8?B?TDRzNllUbGZpSllnYnJrc200MkF5MkpkNEhZd0dvektWTE9sNXUwdUd3NjJo?=
 =?utf-8?B?cmJVZjFOYktKc045TFc3U25tZGpGM0toWVBENVdaZVVNL1lLL1dsRDJ1T0hN?=
 =?utf-8?B?Y0U3Y1A3Zi93cnFZY3A4SFpsTS9UNFZQSDM1aTA5U0FjMGEvSnZvcVFwNGhC?=
 =?utf-8?B?dlg5QVNMOHRxaHlhK2pqRlR2NHJzRFMrS2JCdmJSS2dROFdnaXVrY1dXQVp4?=
 =?utf-8?B?MXRBa3ZKOGZncGZvQk9ORzZQbGxWYWFZTkQvK0VKUVlFeEViR25tME42WXIz?=
 =?utf-8?B?YWVFN2ZNWXY4SzlIdDVwUW12RVhheEE2enhBLzN3RTlWbnlRTFpzcStUV0JM?=
 =?utf-8?B?VDV4UGh0S3VoVjE5ZmVnRWxSK0NjRXh4RndHWUZtVEp6VlpSMGxYeXRMYWJx?=
 =?utf-8?B?dG5zV3RXMElSQnJGYUQrZnJ3UHNHY0o2dUo3RjdLZEI4bG5kNUE2ZmE5b3NK?=
 =?utf-8?B?a2NFeEQrL1FpNklkWE1QaUdXVWFkNUJVVHpiYXRWaWtwN0toQldZclJ6VlZ6?=
 =?utf-8?B?WUxWQVExSEhFR25qZ1V6UThnV2xnMXhHVmJFa0w4K0JyWFpqRUpxLy9DNlkx?=
 =?utf-8?B?eHRZR2M0ci9sc01nWWRtd29KR05Ic1NpbE4rZTZJcm9IaWhvNFRUaVQ5UWwz?=
 =?utf-8?B?WDNUL2dLbVRpY2huMDA4MFRMdUlDcWl1ZU1TNTlFU1A1ZTJwMitHZDFxbDRF?=
 =?utf-8?B?Q2dXR3FwOGNBPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <121976805364CF43AC15456285ED79D8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10313
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d7db49c2-b4b3-46da-0b75-08dd7ce298e8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|82310400026|35042699022|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVQ0UXNNbSsvcGV0VnY4ZTFyaWdQNXpQWUk4ZFZUZW5FakF0R1k5T2U5bDIw?=
 =?utf-8?B?dm1GZkJHR01PczVrRnA3bDM2SjVSZnIyTFNXQk5adklTUmdDNGFBQzlEMXlx?=
 =?utf-8?B?ZzdUejBNSC9XVW5KVjBPUUY3NTF5aEszMmFqOXljcXFlYXdFVkt2YnNXMFNP?=
 =?utf-8?B?Y0toTlgrVGFtS0R6UGQ2aGdtTnZ3SC9aR2ZMY2tZc2x6U2JGcFV4L3RpYmFo?=
 =?utf-8?B?ZTRYM3FFL3N1OThYS1ZRN0o1VVhLd0Zna3NGMC93NmRUTDZpNkt0NU5rQUFx?=
 =?utf-8?B?dnRqZVdjU1k4ejV4d0xrZ09UWFZLMjc0SFVjNWl5dWIzMXdFRVVWTXRTRWw2?=
 =?utf-8?B?dUdUeC9ZQmRETmNDeWE1L1diRjJFQU9raU1zc2xZdFc2YlRrSmM4VWMvdzR3?=
 =?utf-8?B?OGh2TTczNEFvZjQ4eE9RVG9ieGc5R2FRZzRTSmcyaE5nOHc4ZWE4S25yZDJl?=
 =?utf-8?B?azBjM0h4am9PYmJLS2gvRmVYMkMySUJ2WG9PaVZJb3VSdFhNQ1Z0cDZYOCt2?=
 =?utf-8?B?aVBlRDY1SGljYTJXckVlS0JaR2hCcGJCYVh5d3hoQVN5d09vNi83eEt5azRx?=
 =?utf-8?B?MkZJRDVWYitvZVQyRTllWGpZTENBaHoyTlp2cnlHTXRtSjhlbWM4dmNwRnFE?=
 =?utf-8?B?eW95NVArV1NlTnQxRDBCR0NIckVNOE9XdmowSzZPbFBSQXYxNkEwbWlQbzlp?=
 =?utf-8?B?cWV6TkJhWXRheHpaRlhVYW5qTnRCenRhSmt4SHl5N3g3N0RUc2c0SWcxUUwx?=
 =?utf-8?B?WkM4bjZkSTVwd0MwRTdnazhEMlZmdGVkajMwNmFiZjk3UERrazNpZzdVVDJH?=
 =?utf-8?B?SUgwV1N6ZjJWREdKS2t0cnl2Ny91N1dMdWs4cXNEV0FLKzJNclJDZnZVWFVl?=
 =?utf-8?B?NENyNTB4MkFDV2NrUlBuNXpYSDl6N1lVVkcyRmJBQzIxM3kwWi9mSDQ1eUx3?=
 =?utf-8?B?WmY3V05IYXV3TTBWZVFyT3pvMGxXUVAxSjRCSmZUWjNKeXVzemlYbTJKcG40?=
 =?utf-8?B?M1J2RmhhVHB6cmdwc0tBWTljTnQ0RXRPMHdCdUlsZTQreUFhcDRnWW0raFR5?=
 =?utf-8?B?RDAxYVp1ZkdnZ1hGeWU5Y2NlR0hLeHdXall0YXZlcGxJcDhyZURqcmZFeU5Q?=
 =?utf-8?B?ajkwSFBoV1pXZWJKMWNRSEVlMzBOaDhYSnN5R2ZBZ1lhTXB1K2JDRDNybk9M?=
 =?utf-8?B?RWFBdDhKc1Vha3pnaEhIeTJYLzdtSnRuTUQvNVJ3aFVZaFRONUtydTNBa29i?=
 =?utf-8?B?YXphd0Q2MHRpL0lxOWFCTHZwUXJUN3VFOE5jMElIa0pha0ZEeDFYTkNBTXBB?=
 =?utf-8?B?NDByMytqd2dHSHJwOHN0SFVjZkE0Ynluc051UDA5MCt5QmExWWJzVlhUeXpP?=
 =?utf-8?B?bmVONUdYLzR1cFArSXpGWmdkenRnQS81NnRvVGk4K3hzY2R3M2pVaGVRRXg4?=
 =?utf-8?B?ajNKMEd1eW1Tc2xpMGxPTmZKNEpqTTAzNkR1WUZ0OTA3cDJsbDRiclduYXQ3?=
 =?utf-8?B?aXluMGFlaGtSMHF6Z0VaV3V0aC9ZSFNvSml6cG5lc3RBMitlY1NtcU5vNVJQ?=
 =?utf-8?B?dEZFMkpFVWRoUksxVGlQcVd0bUlpb0IzT3FJY1pITkVJcUw5QmxXblFpMDgy?=
 =?utf-8?B?NVEvNlFqYkhzclhiWFlnc21nMFRlMDBKbXh6WXErYmgvcHdZTHE1Uy9wbmtv?=
 =?utf-8?B?ZzlFZ0RWNERvWE1LdFZyR244QjVPaGxndnEraGVyemFXeW9sZUdJay9SMEVu?=
 =?utf-8?B?TzZZL1JVSFlGenY2R1pTbkU2bG5lTjVtdlk4eklwV2hHdUU1bVQ3Ym5oQTg0?=
 =?utf-8?B?SEpheFJLRkhrQXAxWEd5ZUUvMmlETzZLaW50aWZobkEycVk3TjllUnpJR1Rr?=
 =?utf-8?B?Vm1EUFQvekc5MDI2TW10ektxWkRwVCtaUGtIRTdvbURlREtWaDNQVkN6aU9r?=
 =?utf-8?B?MGNPckRoSXpqczN3ZEpBZnlUWEdMU1doWWlWTnZuWHJxYVE2NUZaSlZCR0sv?=
 =?utf-8?B?a3pIYUpaQm4rdTRtMXlTQ1NFTmtJN0ZkZEpLbUJmbnpmeUp2bUc1T2hhUGZR?=
 =?utf-8?Q?kc1Cwl?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(35042699022)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:31:55.4414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d6ed85-a260-4128-f971-08dd7ce2ac82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7551

SGkgTWljaGFsLA0KDQo+IE9uIDE2IEFwciAyMDI1LCBhdCAxMTo1MCwgT3J6ZWwsIE1pY2hhbCA8
TWljaGFsLk9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxMS8wNC8yMDI1
IDE2OjU2LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gSW50cm9kdWNlIGZldyB1dGlsaXR5IGZ1
bmN0aW9uIHRvIG1hbmlwdWxhdGUgYW5kIGhhbmRsZSB0aGUNCj4+IHByX3QgdHlwZS4NCj4+IA0K
Pj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0K
Pj4gLS0tDQo+PiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1LmggfCA0MCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9u
cygrKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS5o
IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS5oDQo+PiBpbmRleCA1OWZmMjJjODA0YzEu
LjY5NzE1MDc0NTdmYiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9t
cHUuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS5oDQo+PiBAQCAtMjAs
NiArMjAsNDYgQEANCj4+ICNkZWZpbmUgTlVNX01QVV9SRUdJT05TX01BU0sgICAgKE5VTV9NUFVf
UkVHSU9OUyAtIDEpDQo+PiAjZGVmaW5lIE1BWF9NUFVfUkVHSU9OUyAgICAgICAgIE5VTV9NUFVf
UkVHSU9OU19NQVNLDQo+PiANCj4+ICsjaWZuZGVmIF9fQVNTRU1CTFlfXw0KPj4gKw0KPj4gKy8q
IFNldCBiYXNlIGFkZHJlc3Mgb2YgTVBVIHByb3RlY3Rpb24gcmVnaW9uKHByX3QpLiAqLw0KPiBX
aGF0J3MgdGhlIHVzZSBvZiAocHJfdCkgaW4gdGhpcyBjb21tZW50PyBwcl90IGlzIGEgZGF0YSB0
eXBlLiBJZiBhdCBhbGwsIGl0DQo+IHdvdWxkIHdhbnQgdG8gYmUgLi4ucmVnaW9uIEBwciBidXQg
SSB0aGluayB5b3UgY2FuIHNraXAgaXQuDQoNCm9rDQoNCj4gDQo+PiArc3RhdGljIGlubGluZSB2
b2lkIHByX3NldF9iYXNlKHByX3QgKnByLCBwYWRkcl90IGJhc2UpDQo+PiArew0KPj4gKyAgICBw
ci0+cHJiYXIucmVnLmJhc2UgPSAoYmFzZSA+PiBNUFVfUkVHSU9OX1NISUZUKTsNCj4gTG9va2lu
ZyBhdCBwcl90IGRlZmluaXRpb24sIGJhc2UvbGltaXQgaXMgNDYgYml0cyB3aWRlLiBIb3dldmVy
IHRoZSBzcGVjIHNheXMNCj4gdGhhdCBsYXN0IDRiaXRzIGFyZSByZXNlcnZlZCAoaS5lLiB5b3Ug
c2hvdWxkIG5vdCB3cml0ZSB0byB0aGVtKSB1bmxlc3MgRkVBVF9MUEENCj4gaXMgaW1wbGVtZW50
ZWQuIFdoYXQncyBvdXIgcGxhbiBoZXJlPw0KDQpTbyB3ZeKAmXJlIGN1cnJlbnRseSBzdXBwb3J0
aW5nIG1heCAxVEIsIHNvIHByb2JhYmx5IHRoaXMgb25lIG5lZWRzIHRvIGJlIG9uIHRoZQ0KY2Fz
ZSB3aGVuIEZFQVRfTFBBIGlzIGNvbnNpZGVyZWQgbm90IGltcGxlbWVudGVkLCBzbyBJ4oCZbGwg
Y2hhbmdlIGFuZCBpZiB3ZSB3aWxsDQpsYXRlciBzdXBwb3J0IG1vcmUgdGhhbiA0MiBiaXQgd2Ug
Y291bGQgZG8gc29tZXRoaW5nPw0KDQo+IA0KPj4gK30NCj4+ICsNCj4+ICsvKiBTZXQgbGltaXQg
YWRkcmVzcyBvZiBNUFUgcHJvdGVjdGlvbiByZWdpb24ocHJfdCkuICovDQo+PiArc3RhdGljIGlu
bGluZSB2b2lkIHByX3NldF9saW1pdChwcl90ICpwciwgcGFkZHJfdCBsaW1pdCkNCj4+ICt7DQo+
PiArICAgIHByLT5wcmxhci5yZWcubGltaXQgPSAoKGxpbWl0IC0gMSkgPj4gTVBVX1JFR0lPTl9T
SElGVCk7DQo+IFdoeSAtMT8gQUZBSVIgdGhlc2UgcmVnaXN0ZXJzIHRha2UgaW5jbHVzaXZlIGFk
ZHJlc3Nlcywgc28gaXMgaXQgYmVjYXVzZSB5b3UNCj4gd2FudCBjYWxsZXIgdG8gcGFzcyBsaW1p
dCBhcyBleGNsdXNpdmUgYW5kIHlvdSBjb252ZXJ0IGl0IHRvIGluY2x1c2l2ZT8gSSB0aGluaw0K
PiBpdCdzIHF1aXRlIGVycm9yIHByb25lLg0KDQpZZXMgaXTigJlzIG1lYW50IHRvIGJlIHVzZWQg
d2l0aCBleGNsdXNpdmUgcmFuZ2UsIHNoYWxsIHdlIGRvY3VtZW50IGl0IG9yIHVzZQ0KSW5jbHVz
aXZlIHJhbmdlIGluc3RlYWQ/DQoNCkNoZWVycywNCkx1Y2ENCg0K

