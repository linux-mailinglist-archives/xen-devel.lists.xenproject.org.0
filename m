Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Uaf8By2xj2kVSwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 14 Feb 2026 00:18:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C18139F40
	for <lists+xen-devel@lfdr.de>; Sat, 14 Feb 2026 00:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1232095.1536951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2Q1-0005Gf-Kf; Fri, 13 Feb 2026 23:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1232095.1536951; Fri, 13 Feb 2026 23:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2Q1-0005DZ-Gp; Fri, 13 Feb 2026 23:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1232095;
 Fri, 13 Feb 2026 23:17:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v8h/=AR=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vr2Q0-0005DT-1N
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 23:17:48 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 316e287c-0932-11f1-9ccf-f158ae23cfc8;
 Sat, 14 Feb 2026 00:17:42 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5200.namprd03.prod.outlook.com (2603:10b6:208:1e6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Fri, 13 Feb
 2026 23:17:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 23:17:38 +0000
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
X-Inumbo-ID: 316e287c-0932-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBcGoe9mGpubySIS0m6x4G8s5bN+pqUe8DSkcg0mp/S+Fy8UkvpFw2H1O1s20UfNZEAZiAu3kq0ZGMGZ+MjxiX9M9nmCG5a/nzrrwCmHx7jkRq+QElFA7rsIxps1htxwv0djURGnUmXtI4PblDXM8+22XxW0Uo5ychHITFaJSUcTwB91bRBwu0428b9Dh0NTtaVPuwExz2hWgXnCFluwqIdD8TwDeLOU3gBM43/43SdLrcCokkvvDU87Jeu80XjkNuLsNVxjFSvXrcrCf2s5B9mWtXW8eMkQ9M4xk+mru+ZINA/eEyNPIinra4LAnXHhcW3O2Oz4r+7dDgwkB9uP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVHRu33hvp65dvsTFs5JCOYQ5bOsSNFS2e8T1SyguCQ=;
 b=dcJyscMtQfJcdVxv2e2/R2hDepcNEBV8j12QP42pwJ003B5N/D5aklhS5Actv9r7CurSybRdXFu3b7QUvv5uIznW5ddySIZz18wX6pW2q+/Lxk6W3+6KEVNPgsdy8IIGcEVyb6VcX2p9zNz793+CHbLxXcj/iK8mE2BOdSJr/b5D6/AxofMuYG40wsdoitHtLMySHJtBhmP8YTsQ//3uG+/Tcxwqrrtb5+qgg/Ff/LMV0jQH0Na2OPAeJ8YWpG7fqsLuXVYr4QDAYZnRmL5df4lVgN3FdlLhcP53IVLRcORBSR1FeSUeXLTF2NmpXhy3tyT3Grf5y7EwNs+5TtcZtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVHRu33hvp65dvsTFs5JCOYQ5bOsSNFS2e8T1SyguCQ=;
 b=NOymYDGzd6Msg+YweAdrqdmkJjl+7/A6UPqjAxJWr9gNbgqH+MmzdSMSG5THN3zlw47C0hHk43fhjkmIn0AfuXYtl1jYo5DFd5hmSvdsW7JOB1UbQBkwg36Ugg89LjGPZ5sTIMiL7G2H1dOH6n54KJgl8D8x9Sk0EYKayAOBdgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <704f06b5-eb2f-429a-8ca0-2bbdbc24cc2c@citrix.com>
Date: Fri, 13 Feb 2026 23:17:35 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com
Subject: Re: [PATCH v2 2/2] x86/svm: Use the virtual NMI when available
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1771016301.git.abdelkareem.abdelsaamad@citrix.com>
 <54110a1c3800557d1fe611e4f8008b702df5ee84.1771016301.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <54110a1c3800557d1fe611e4f8008b702df5ee84.1771016301.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5200:EE_
X-MS-Office365-Filtering-Correlation-Id: 019dc0cc-525b-4f78-bd29-08de6b561463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bU5WTFZCZGxpMjVZUGtDUGphcWNENzZBL3hqaWZCVWZ3T2J5S3lQaG0xRGFE?=
 =?utf-8?B?Tit1NzJRWEYyekRsTVpieWhiWFVmUVpqV1Y5NzhZYUxieUh5WlA1QWFpcHpJ?=
 =?utf-8?B?WEJGRks4UU1icVpqWEtNL3VkTXlyaDNxR05XVFZldG0rbDJNYzNzOVhTYUZI?=
 =?utf-8?B?SElCYWp6czlQVm1SUHUrS3dMQzhqS1BhWGFKV0lxY0VoNlo4bnJnaGNXOXhq?=
 =?utf-8?B?YnRUc0JMQTRpWVg0clJPU25XU0VVTFhGZEdaNURhSFBJOVE2aS93ODRLOXRZ?=
 =?utf-8?B?d25KNWp0SmtTN2lUOFY1YjZPVm8zZzJGZndyaGFJSXUxTXBvZUM0TUFMeUNm?=
 =?utf-8?B?WTlGVGN0VzQ2ZU0yQVF0b2VsUFdGMTdGUW1KYVk2UWRtNDl2MVFSUyswY0Mr?=
 =?utf-8?B?RDNpS0E5MjBrVUhhRDFUK2pycDlhSTZOUHRLRWt1NXhwMEpXa2xaU2RpbGt1?=
 =?utf-8?B?K3R5VjY1ZzdlREYwSjh0MzhuK254WEh0QUZGbkZTTVE2UUIvcXJlTmUvdkMv?=
 =?utf-8?B?TzUvaDBNbU5TWnZiT0I0U3pTYStTcWpsdkxKOU5aaDhWNm8wS2JXakV5YlQz?=
 =?utf-8?B?ZkQ5OEZNV3hKakdNU1MzV3ZsZFJpcmY3WU9qZVF1RE5hT0Vzc09ZWlc4WkVX?=
 =?utf-8?B?WkZKdkZkS2VJZ092bncyVTVrYUttWFlGc3VhdHNTQW9KOG1QZTNEcTdDSW5z?=
 =?utf-8?B?cVFLMzJVNHFNOVo4aGdUdEF5KzRHMGFrMFdkcjdndFI4N0xEcTZkOTBDalY5?=
 =?utf-8?B?ZUZ2TE5sc1gvclBzRzF0RlpoZjN1YW5aUHVyYlkxZmk4SDNxcTVCQ0dybit3?=
 =?utf-8?B?SFdpQkUvZkxaUVNrZmpENGp5aVYvSlczcmo3REJ6aU9XYzhUa2VnSVhhL2M4?=
 =?utf-8?B?djhWblIrajFkaGNEK2QyZGlGMDFscUUxZEpHUTdJeld3emJ2WFpkandPZklP?=
 =?utf-8?B?SHc2eFAwd3NMVjRWZmx1eHRhRjRyRTFPY2k1c1JsYUU2ZDhlZzJ6QVZKblp1?=
 =?utf-8?B?cEJJMVJQTzdPa0VnYWhOMWtJZUk2Q1BHdGNQbUVnakRHbFZyOU9LWHhEVmdS?=
 =?utf-8?B?MXNaR042LzlxWHNtT0RXamJDSmU2YVNSMXhYY1JqM3JYNlpkbTFkbCszQUli?=
 =?utf-8?B?VkpORU03L2h4eUJZUCtKazNXLzFvL0pUZ1ZQOElYT05XalQzbTFaUmJxdUZw?=
 =?utf-8?B?YTY1aGozb2xIencvZElHZy9XVlFuYnhzdjJCT296RVJxa2Z6bHNzTWpPUDhz?=
 =?utf-8?B?T3REMXlHeHlXL2VLc2M0M2x6a0R5UWRKc040OFFMVW8xQnEwTlZnU2IrbGlV?=
 =?utf-8?B?dHBKcGNlRFlmc3c3WGwzRTdia05VOExCUjRlS0pjMTdSSmNuZlV3SmxmY3RD?=
 =?utf-8?B?aHVqdGpqcmVSNm1GdnJMTFdmN1BQeWVQMm92c0tGaGNTdlhGSSt0NVFXQU5C?=
 =?utf-8?B?cGNxWHBYaEI3WkZxQzJRR25pQlVWeGhJRTFmYkpJYi94NUZEK1hpM2RMMmdU?=
 =?utf-8?B?L2R5cUVsc2cwV2ZxTmpBVkdBS2RLVEtNTE1CZ2FRRm1sckxYQUdWbjZTWXlt?=
 =?utf-8?B?cGFsUURWUGxNQVRrZ2l3SXRNZmNTU09YTGY4K2Fud1FwWEVidHMrL2F2M2JX?=
 =?utf-8?B?ZEkrUXVyT3FCaHRyVGxvdVJtYTFuUGVaeWtEL0FWTlc0Nks0TGVxZWpKS2VM?=
 =?utf-8?B?V3FYR05FV292YzFKOG1RQm1PZ21qcFVXTnZEQzlRcFlMRTAvRWJNLzJoMWUv?=
 =?utf-8?B?cjRyeFFxbWVVTWdoWDErYy9naWN2QVkxbVJpTG5oaWM0bnhJVjRvd1lVKy9S?=
 =?utf-8?B?WkNPV21pU2EyRUI5eGFIVG5DdjZQNFBwWGJhdmt1SmhUbWoyV0NzQ241Uit5?=
 =?utf-8?B?UVVYdmhJTXp1ZU1UeTA5RWtkWjBVelVYSEUxb0RvU3VkZzZSVVVRYkllQjNV?=
 =?utf-8?B?T0cwNGVqRUV6eGtqUkpBL2ZIUnJYVXAzRFRxblV2TElWRU44MzZlcVlRMk9S?=
 =?utf-8?B?bWpIVzdNbHMzUmkzZk1tampNVzc4M0tkYVJTdm9jY0dkalA5Qm0vMkZlbnJL?=
 =?utf-8?B?TmZzbEhPU0JaM3RuMlZJZXl6MXNaUWw3dWVzbmk1RTFNc1BOc2hDWTg0RzBm?=
 =?utf-8?Q?AlIE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NURSNnRBOFBQSTZ0cGRkQkphRzdqdlZ2OGVJWWI4ZkZzWGNiVXBNRXYrZnhu?=
 =?utf-8?B?OXRCYkU4TnRLODJXK3gvRWEvMEo0S3U3aEJCWHpxUC85aFR6Y2pIVDBUZ3V0?=
 =?utf-8?B?dTg1cmZaUE9NYmNMWW9ISFRSNDV0ZnhHS3F2Y2JZWWdSSkg5MjVQeGUxWms3?=
 =?utf-8?B?RDJlS2pvc3lTK2NieDNLaW55bzVYbUtmekpLZi9nbFYyblkveDRJRWZZaStK?=
 =?utf-8?B?SnQ4SUVGVXBWMHlHUG9ZTXYzSUhmanFXZVAxeWtXOXgwS2JYeXdINVZ4SUJh?=
 =?utf-8?B?VzdSYW5kVTgxOEovbG5lSkxCOWpOZmx3NkYxaGdlWnZxU3BySVZ5bnlpcTI1?=
 =?utf-8?B?M2l2U1R1WElQdFpCKzExUHpqRWhsYmdKSTNvRVZlUmw2Ui9aRngzenpod1oz?=
 =?utf-8?B?bnhrMVNJR2hnUUsyNEpqOXRibVA0Z0NFanBmakpWajdqblFKRWdscGlOZ3py?=
 =?utf-8?B?OEduaWY0YTJxcHJMZW5MV0VGeFhIa2NqMjV4T1lMNjdkVDF1d3cvOHpzbE8z?=
 =?utf-8?B?ZXN1MFRPNkQ3QkhEVlVVTHg3N1VNR1cyS1FxYnFmMVU5bHF3Tkp3WmtqaGI1?=
 =?utf-8?B?VG9BcGhsMDF3UEJZeGFqc3NUeEFySTNaaXdvSEoxSjFhb2JDa0NFSnZ4Uk5T?=
 =?utf-8?B?MHl6TUxZWTVPUlNyUGZkOXNxT2htWjRaZkY5WGthY0EzRHg5d1Z2azdvRHN0?=
 =?utf-8?B?am5kclllQmpCVmxrQXZXQnYxTS85ZlhXanUxRVA1dWUxbGNEa25tcEF1UEpH?=
 =?utf-8?B?T2Y4MDBaS0UrTlBtY3pZSXR3UDNuQzdzbmlFV3o5NW9GY3ZNYUZ3SVRNeHpm?=
 =?utf-8?B?ejdNV0V4b2EzMzdaeFZ2VkhsNDJOZU8rT3licjJlV2MrOHlmQThVM0lNRjV3?=
 =?utf-8?B?SFUrSWpZRDYrODNnQUVUem9VaStLTXl1YlVKNCtpbmQ3dmpqR1paeW9RNndr?=
 =?utf-8?B?YVlVZXNEcjMvMGpHeTFDTWlWK3JxSnB6ZXdFaDYrQWVmZ29SWXBPd3ZLcWlD?=
 =?utf-8?B?SDdVR3pkQlI0WXRUb0J0K1ZiNm1naUh2S045cHMzYTlrOFZ6Wmg0TmwrNFNX?=
 =?utf-8?B?d0lQSmVlUVZKNGpqU3M1eldTOGhUVCt0QjJ3Um8vYUJNdHFvdVJ0aFQzbEpq?=
 =?utf-8?B?U2l1bFhsWUlZZ2hSTDFzV3FqNVVjTmtIdEtlMm8vOWNURUFpVTYxRm1CNmRk?=
 =?utf-8?B?YTFYZXhRSmh1V3BIYzlBZ2Y5SmJndUgyR3NWVFAzSytldXVweVpmeDNDYlk4?=
 =?utf-8?B?aU5nQTNiV25NL1pWUmJRK0pEa0g3V1R6OS8yNXg4ejkxNmJwUDBIdUpwaDlY?=
 =?utf-8?B?MmhYMVdLRENGbEkrUTNGbTVnQ2I0OFQ2cE1ET0dnNXpGRDBMZGg0ODgxRmZy?=
 =?utf-8?B?OXlsbENhRUtSVGlyUUk3YnFiU0pGS0VDR3NIY0s0ZUpvRkhuZGdPRXdQZ2M4?=
 =?utf-8?B?TENjNkdYalpxUEhtS3RiRVRLeVN6YjhuSzVEV2lUVkxaV0RudVlua0lNTWRo?=
 =?utf-8?B?MnFSOXhGUFpHNWNmYUhhNVBvWDFxN3pLS2YxbDhISHpjNENFQ0s1YTgweXJ1?=
 =?utf-8?B?aVRhNzBPT2xJak01TTRHTTFMMGhUR3NLQlhuN0NhWEpXMG9UVnZiVE02ajZx?=
 =?utf-8?B?cy9ZaUo2Y2dIdFBEdUxMclhKRDVaa2hqQmc0TkNKTU9DNE5DZW9wbmZoUXZJ?=
 =?utf-8?B?ZUFiUWJ2dkVYUi9hcVFocWhTelMrendIOWhKdjNXMk1tQTllU1VxWDFBYmlt?=
 =?utf-8?B?Tm5FR0NteGNVcHF6eVMraWkxei82NTVmUW5KVDhQRXVYb0JoWXJ2VkIvY1JL?=
 =?utf-8?B?bllqSDRlTXY5aHo3RVEvWEZWMmhnOWFjc2gyRXpKcXdDZTYxRnkxMkN2ODNC?=
 =?utf-8?B?UVdBM1hYOVYzOE9RZ25iMXZXMUhxZDdOd1JwY1ljU256Y2NzN215R0pBMUR5?=
 =?utf-8?B?aWQ0TUJ0TTc1eWRjOHZXZU5DQ2kxb05YWUJvNlhzWWN4U3loZjQvUm9WTHVU?=
 =?utf-8?B?TFo4N013a3NFazRMQWlqMEl1dGdWcUdlU1ZKUElIUFFhK1k5cnVseXlVNmZU?=
 =?utf-8?B?RGtNM1hZTTFYRE9DWVN0L0NiM3hLQzRXSlNGMXBQYldxQWd2NmZpTlVDcHQv?=
 =?utf-8?B?Q3g0bmJKUmRyVHJyZ2J2Mjh6VkFsUlVodDhhNkNzZ09WMG9pWDdKWk1zM1NN?=
 =?utf-8?B?TlA4Y2x2UEMvWlZRczAzdzhKODRyYjNmaUpNNzlpdThDeXU5aEhoYm5KakRS?=
 =?utf-8?B?ZjJjRnE4Mmd3aUxnRDlJMTdSRWpKcWhBY0NRSkxoWHdFL2lEeGtTQXZrbEdz?=
 =?utf-8?B?YmtjRVRIS3l2U3F2ZDc1Uk0vNGdoYk5rYnMvTVN5aHJkUW0yWm9Zdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 019dc0cc-525b-4f78-bd29-08de6b561463
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 23:17:38.7346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUHsFU8/d/TZ4rroZbGCq9w6+pvuk5ZJcAptXkFpcfZmejeLAiDjRrmVEM532ENB94M76f23AtglR6G1Vjus0CgaDCAYqex9AWKzdZBvwmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5200
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 76C18139F40
X-Rspamd-Action: no action

On 13/02/2026 10:44 pm, Abdelkareem Abdelsaamad wrote:
> With vNMI, the pending NMI is simply stuffed into the VMCB and handed off
> to the hardware. This means that Xen needs to be able to set a vNMI pending
> on-demand, and also query if a vNMI is pending, e.g. to honor the "at most
> one NMI pending" rule and to preserve all NMIs across save and restore.
>
> Introduce two new hvm_function_table callbacks to support the SVM's vNMI to
> allow the Xen hypervisor to query if a vNMI is pending and to set VMCB's
> _vintr pending flag so the NMIs are serviced by hardware if/when the virtual
> NMIs become unblocked.
>
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/intr.c        | 13 ++++++++++--
>  xen/arch/x86/hvm/svm/svm.c         | 33 ++++++++++++++++++++++++++++--
>  xen/arch/x86/hvm/svm/vmcb.c        |  2 ++
>  xen/arch/x86/include/asm/hvm/hvm.h |  9 ++++++++
>  4 files changed, 53 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
> index 6453a46b85..bc52f8e189 100644
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -29,10 +29,19 @@
>  
>  static void svm_inject_nmi(struct vcpu *v)
>  {
> -    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
> -    u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
> +    struct vmcb_struct *vmcb;
> +    u32 general1_intercepts;
>      intinfo_t event;
>  
> +    if ( hvm_funcs.is_vnmi_enabled(v) )
> +    {
> +        hvm_funcs.set_vnmi_pending(v);
> +        return;
> +    }
> +
> +    vmcb = v->arch.hvm.svm.vmcb;
> +    general1_intercepts = vmcb_get_general1_intercepts(vmcb);
> +

There's no need to defer these assignments.

When the HVM hooks are deleted, the correct logic here is:

    if ( vmcb->_vintr.fields.vnmi_enable )
    {
        vmcb->_vintr.fields.vnmi_pending = true;
        return;
    }

> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 6e380890bd..00e5630025 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -545,7 +571,7 @@ static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>      unsigned int intr_shadow = 0;
>  
> -    if ( vmcb->int_stat.intr_shadow )
> +    if ( vmcb->int_stat.intr_shadow || svm_is_vnmi_masked(v) )
>          intr_shadow |= HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
>  
>      if ( vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET )

It's only HVM_INTR_SHADOW_NMI which vNMI applies to.

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738c6..f5c7ea0b0dbe 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -548,7 +548,9 @@ static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
     if ( vmcb->int_stat.intr_shadow )
         intr_shadow |= HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
 
-    if ( vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET )
+    if ( vmcb->_vintr.fields.vnmi_enable
+         ? vmcb->_vintr.fields.vnmi_blocked
+         : (vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET) )
         intr_shadow |= HVM_INTR_SHADOW_NMI;
 
     return intr_shadow;


~Andrew

