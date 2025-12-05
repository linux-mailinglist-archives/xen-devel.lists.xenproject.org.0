Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3445CA697F
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 09:04:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178534.1502307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRQnU-0000v7-Qz; Fri, 05 Dec 2025 08:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178534.1502307; Fri, 05 Dec 2025 08:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRQnU-0000sY-OA; Fri, 05 Dec 2025 08:04:12 +0000
Received: by outflank-mailman (input) for mailman id 1178534;
 Fri, 05 Dec 2025 08:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XFGw=6L=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vRQnU-0000sS-3h
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 08:04:12 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb0bafcb-d1b0-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 09:04:10 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PR3PR03MB6572.eurprd03.prod.outlook.com (2603:10a6:102:76::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 08:04:07 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 08:04:07 +0000
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
X-Inumbo-ID: fb0bafcb-d1b0-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfbN/jLcT4sDh8vVC6de2D3RTcL1TCN1McSfg46AAk/wVth6iMv0FlyM5WpoIfg430RpST5saXgGCalcEJkyg2ZsUDOyVsJqCwb70RTPgS5+9eSpHRIGiF9j+zAr+YMm4rQWx91EQJNAqLwbRokTJ6twqcW0BC+e0Qt3BGsSQd3IyqjpQVKMOdjg/bybRUVzH/EENjvP9wjbEMVXasiIAn7/O7/r1FQqUUu6t2DRlDw1AxUcGgmB5CU9NlGjNa7416uxtXKEAmJfXSJaQScpeLQpYJgSd4FCNhZB635lf74n/MI5taaZI1IfCRDQfgLUz37B7tReRLEBwRXKUQcvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3BsiN4L6fNRoWyz+H/uQp4LH3rqAy8hTd6o00L3zMc=;
 b=MEJitEL+od8gGEUhbl/KUigjy6sYhKdv1eczqk66DBDyLYdiAI1dt1D03AGKkUAQaQII64aWcQ4H2wLruMwM03Tuh0ksv/3eQqCsmChkiyoNW1FcWqPpXf8jHd8P+aD7BJCAAQQK6pVNlDpKPwRsYMBLnbWYMlP4Vaa6LvZsY+iFdfoqchp/R2Mhmfzu95Xo1iQk7wfKYdt0GJZcEUh0XUuL9MEMk6MQW2LkdMuxIcKz1ElCYKKi5gCwcT7CdyD9c3DMgoAUdBbwvDVLuJ/RdEbgBq9A/MXMH85zhcO8qu+tlFjCfIP/ISYfmjS80l68RATj8DQmUwGlXPKUtH/LEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3BsiN4L6fNRoWyz+H/uQp4LH3rqAy8hTd6o00L3zMc=;
 b=gwiOlar6X0jauIlJ0oqam0Rnj0Tm+E6PmcybPYVUaLhBBwqKiG1iMli605fVFoLOhSGqFqaQJGbITmxKtj4aOfc5DHd87gJhMM+aX5awBqBAyD804IJo7lBN6Efm+JLnd2f9cPuJNI0drIUDfa5luRDaYY0czEc6Ml7QzaduScHXGDgHTSYxROu9pcFShjToWUTBfCftZaWFRgvJ5i5FtbiCGzSp/XEvYpRFGK34/MEuTSX3VDHylEyWWuD+g5+rGpFM23r+vpxQxm8L8XMJOALL5s5eS+AoTNSjq9GCA7j2I6aG6RoMA7EAtLS/XATn+RtuXYqICeudDN7yDBVbyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6bdff7ac-28bd-4e1d-9a05-2284f675c22a@epam.com>
Date: Fri, 5 Dec 2025 10:04:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] console/consoleio: account for xen serial input
 focus during write
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251204233211.980862-1-grygorii_strashko@epam.com>
 <6e189be1-a7c6-44bc-91a8-84dec7ed47e4@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <6e189be1-a7c6-44bc-91a8-84dec7ed47e4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::6) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PR3PR03MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a845ead-d215-4433-ca65-08de33d4dd50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YldaZzZHL1JlT1dUK2FYdVBHdnF4V090ZUZwMUsxbTN6d2RaVS84SGgxVXpF?=
 =?utf-8?B?OTFnT0wxeFB3Ym1OVE00WmdZNjEyZXFTVUFWWklIMEpWZkYvemE1WS9FeW9n?=
 =?utf-8?B?MUJsNDY2SkZYaEpEc0xLaG5zSTQ5dGpTVzJwWVRCZ1I4V1BqZDhicjJpblVz?=
 =?utf-8?B?T0lPUjVDcGpUMWQ4VEV4SnhQTzdtNmVjREVNbTc4NTNQT0xrS2EvaGlCZ0tI?=
 =?utf-8?B?OTBYam1UdlQyc1BJU24ra3RKY0FBM3FHQURLbzJ1U0s4MWFjNVl1QVZsRVow?=
 =?utf-8?B?bk5ZZjBxcEJyNGk1SGY4Wkd1amNaNy95YmJPVkN2M09pNWlOZGRYeTdzYVY2?=
 =?utf-8?B?THBLR1RkcFJyMGVNM3E2MWlYQ0FLSGZoVmNYeXFId2kzdjZsT2tJTGhvYVBp?=
 =?utf-8?B?UEtBcTVlN3M3a2ptK3VCUVpKTElqTTREYm96L1k1WkNFK21ieFNyZGFoSjVr?=
 =?utf-8?B?OTFoLzg0OTFOZlFaUXZpTlFqVmRiVjF4bWcvN1RHUC9HbE4rclNYb3VXMTdk?=
 =?utf-8?B?SXZxbUZ6bVZDS2tkemU4emlsa3hYZUcyb1FxMm5JV2lQODMyMGFaSE55Qnkv?=
 =?utf-8?B?TVFtUXQrb284ZzBCa21hSlZ1TTQvQ1RiUGVmSWY2Z1NWSDdTYkQ3S3BiNkYx?=
 =?utf-8?B?a1hMcFR3aTIvaFk0TWlkRkZnOHMwOVNHWlpYOXREZHJOalBKRzNDYWZxNlFz?=
 =?utf-8?B?VnVIMFNIdGJvOUNqZ1dRc0lPRkREOWoyUG4xZ2N4OFdsTlczY0NXcGxYMW0z?=
 =?utf-8?B?Y0d2dWVmMmV3alNzQ3R1eXdpcGtBTTJWVyt2eVRkTWQybTdsR3NWM0d5RGt0?=
 =?utf-8?B?TWZiWk5HNzAyVzBaSUpIRGdSblRzYW1laWE3VHBWeDd6K3ZpaDR2LzlKei9U?=
 =?utf-8?B?V3Q1MU96a0d5N0s2Y2NQckhZYk1na2ZWbm91TEo2WUdNbnpUZUFRTnVSNzZF?=
 =?utf-8?B?MVNtYnd3ZGxBeU9sUzhoZVV5ODhES2cvcEdHT0JmVmtpZmZJdU1JTWFCSHU5?=
 =?utf-8?B?R0JFMXR1NlJpWkFkOFB2Y2g4RDlxdkk0SHhEblNvb2d4cUc5T2loNVJEbjZP?=
 =?utf-8?B?UHBzbUROWlhYaHp6THBDMU5JWEFIQ0VwelJiUnhRMGgySTY1YXUrT0dTS1hS?=
 =?utf-8?B?YjZsMEFsV1lVdVlNL1dncVNBTmkxTUZBTXBFejNZRUdBQmV4ajUvRDdONmJQ?=
 =?utf-8?B?WFhTNlF4NEhKYVV1R2JtWmhycWdiaFFzNFgxUGtHK3k0ZTYwRHFDd2JqRktS?=
 =?utf-8?B?YUFJbGQ5ZnpicXYvTm01dldIeWdGWXZ4RExMMkoyVk9sOUZyeDZMNjkvTmZr?=
 =?utf-8?B?WDFqLytwUGdXeWJWMWpvb0sreEVtUUtPeTN0clBlV3RnK0I2QXZ1azlaczJN?=
 =?utf-8?B?WjRsb2NENG5DaE5MY2R2cmlGNk5ldDN2V0llbk9MQU5PVFZkeW41eHRzSDA2?=
 =?utf-8?B?eWZjOU1MZENmODZ4SHFTZmhET1ZSU3l4UWdJMGlkMElpWm9pR1ZZZFNQelNC?=
 =?utf-8?B?b1FMOVRIdkIwYUNIQ281RG1OTENrOUphRlpVNS9NSGlMMW45TnZPeFdUKzdv?=
 =?utf-8?B?end1Q2VMKzE0dXVaUlpqMVp1UHpEZGxwZkRocG9YbXlteHdVbm10MTZjMEhD?=
 =?utf-8?B?TStucTdZM2pFaTkrekRBLzVRK3hndUJ3MUZ3dXNLS2hJakxGY2ZJenhyVzY3?=
 =?utf-8?B?UkF5N3ZCdWFCdGNEa3hxdDRFdGNFdi9ZR1E2OENzaDNSWkFYY3dHcExZVllG?=
 =?utf-8?B?b3RiVzA5dWFtdEpPenBRQitON0UyWDNsMzRmeTBHSGpTYXNtWTRMRnZEQ2Jq?=
 =?utf-8?B?ek4ySFpLcG9uZ3BDMWQ5KytXZ1BwVXBRUWJ4VDF0SHhQcWxtMUdxQ0hqNXhs?=
 =?utf-8?B?WDJrTGJSOUtSemxhVERyZEhzWXZQTGVtL3JEa3o3SUV5RkJUOFA0K1pzaHVN?=
 =?utf-8?Q?HZX6GMVuY7+uFpTy6/WYAFP1gUGns6tM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1R6ZlFsNXE0dE5BaVozMFZ3MTFtMEtPWGlGMFA4dWdaYVpucjFtYUZwZm9o?=
 =?utf-8?B?RG9ZVjhiaEM0dUxFMytPbVptTkR6a216TnJoYnBiUFRGYjJCRmdCNG45VFZy?=
 =?utf-8?B?U21IMjJNQnJqUGkrMTd5bWptN2lkUWh0N2pwLzlQam1oSmozM01lMlJvcFpU?=
 =?utf-8?B?WHZXZ3JwZzJFNnpjbnUyR2UyanNlcytNOE5qUHdISXJtU1liaVlRTk5IRHNx?=
 =?utf-8?B?VkZ3bVBxU1pBM09Td3dPK2VBejZWMlAwY2RJZFRhKzBNeXdtK1FXbzdyeUI2?=
 =?utf-8?B?T1lGYTVRNnR0SnhHdXBaeE5FZ1RiZXprS2ZLSDdUdkF1aGRDalNSZFp0bzhp?=
 =?utf-8?B?UWJqczkzeGxCSW1QUnFQbU9ucmJYMjB2Z28xTENOVXE5bEMxa2taTnJqcXg0?=
 =?utf-8?B?QnVRbWpuekVTaEtrZFZYNnRmY2Jvamd6UmdML051WjgyMUV5b2VKcEFjVGRp?=
 =?utf-8?B?MWp3eEd2ZEt5aEFEUzFQMWpTd1RwMEVxeFRxME1LSDFOSnoyNkk4U0Jtc1oy?=
 =?utf-8?B?QmVBNFU3Sjg2SnRlUVo0d2Q0bmF2Z0tKVUJtY1RtdlBnbE9xT3ZOV3N3Vkd5?=
 =?utf-8?B?b3Z0SjExWE5PQlp1ZENmdEVKenVoWFR0KzlQYlJTMHd5K1pPOXNxZVZ0UFYy?=
 =?utf-8?B?bmEyNVN6dmJGYTBsaml0OFZTZk5CeW95UklmampVdnpvN3RJV01YektYY2tD?=
 =?utf-8?B?N01KUWMvUnpGS1g5SHpUbTZXWldESW5kVmw1Z3pTcVdIczgydnhEZCs0VXRB?=
 =?utf-8?B?OXR4cHhLWmFiTEl6VHMwOGQ2andpNFJBSHZXK1lKSFZWSFlmY3hMWktPdldF?=
 =?utf-8?B?SGdnL1ZCV3hiQnZaM01VTENxbjBkN3h0dG5xYmtWYlEwVG8zcDgweGgzNmZZ?=
 =?utf-8?B?SiszTVc3YnBjT2l6N3YxRXN6RDEyU0Rrb2I0b2VwUVBZdGlUUkJSTTFvMENX?=
 =?utf-8?B?L1QzelFDbDNxd3dzYWFjcERkU1BUeDlWVEZaWGplcVFYQUxhbktPdmJDZndL?=
 =?utf-8?B?M2xDQVdIM0tkNy9sZWRjOHh4eWRSQ3o0RFhxbC91VnZHS0VJYnlSSTdINUlL?=
 =?utf-8?B?dVFkWTBMdk1UdGF0MHVRWWdYc3pUUFZ4SDNQNG52dmlMYUZ3bXZTamg5NkdK?=
 =?utf-8?B?aHBsSmpxVy83WXBGNXpDcDIwakp2MUhHa1BsUnN5dWZCdVE4bm0xRC82ZnNW?=
 =?utf-8?B?UHRacmxaeHNmcGptWDdGd3N2UzZVOS8weTNmYmlNSmhncGJBN004NmxyVmhU?=
 =?utf-8?B?enFDakxwNEx4ems5SG10c2pRcXhzUW5ONnNlK0ZDSEdaV0g3eUxkNCs5UWJD?=
 =?utf-8?B?dTZ3NGlicjUvS1dKbmc1eExwNFBGSU5BUnc1aUJsdHlkRDZTbDdCQS9nYVcw?=
 =?utf-8?B?d1BOVnZhLzNXV3NJU0d5RnYvNEpBNEVucUs4Qlp2a09DM3dpMTU4R2FmcHIr?=
 =?utf-8?B?RzNhelNlSXN3NmlYT0VTQk9veGUzNVF5SUw5Z0ttRXl0WWtWZDllZSsxZWNp?=
 =?utf-8?B?ZUdJeFlzQXlrKzhZbFlCK2EvaENhMkhFSHVQWktTZHBlMEJEUDNBS0JMbEdK?=
 =?utf-8?B?Z1FYSDJGSHhmbjV4TXFKV2pRMUZxbCtaRldrbHNqbkc2YnhJY0xvWS9hdFVQ?=
 =?utf-8?B?T0FCczBnVmxZY3YyeFIzVm9vRzl2RXZTZkE4ckt6b2pPMXpGNkpnQ1gvZ2xO?=
 =?utf-8?B?Y2JadUZHUUJCMlNBMEEyUHNRMFpIWDkwQjY4bU5EUzZjcFJRNGJHK3V5QU02?=
 =?utf-8?B?dmlKUEUwZExHNG11MGtCRmY2OEY2MlhRNXM3cnZaN2VVYUY4SGs2NW9qVXFT?=
 =?utf-8?B?U3NVeUM3QkE5a1R2Um5CVjBJWTNsa2xPcm5XWlFFTzRFRFRWY0ZZKy9Qck0r?=
 =?utf-8?B?QTNmOVJuNXBMKzl3RElob0MvbkxOR1JrZDI4RDVFT1NCQVB3WGpySGZDU1M5?=
 =?utf-8?B?Q2pKY1pCVnpPVEtVRm12RVpjb2lIaVZQMEVUSFpZMzdUOTRUQVBpQVd3TlBU?=
 =?utf-8?B?cmFieTYvbE1CM3FaWW9hS0phcjdlZlNuQ3VKdEVLb3NrbEE4MnU1NWhHOUtk?=
 =?utf-8?B?MThLUGVsQWVLZXJidDM0VVg1Sy9Sd1JuVDFNRVdHRjhRcVNUVFpmRG5heDVl?=
 =?utf-8?B?RGRId2gyZVdFeExzZGpvMlFDcVllcDcwOUlWMGU5bjBCTjk4aitmZlNNaHEv?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a845ead-d215-4433-ca65-08de33d4dd50
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 08:04:07.3428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDkAP6fupqyhkjuPSm7aPYNNC6sg4S99ay6lDdgZH1uUKTUrIr2WbOnQsGaHeuKOaXodgnXgAbeTB2HYV91K30bW+yGuV6MBRiYTzw5JB/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6572



On 05.12.25 09:39, Jan Beulich wrote:
> On 05.12.2025 00:32, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> When 2 or more domains are created and:
>> - one is hwdom with "hvc0" (console_io) console
>> - other DomUs with vpl011 or "hvc0" (console_io) console
>> console output from hwdom may mix with output from other domains.
>>
>> Example:
>> [    2.288816] Key type id_legacy registered
>> [    2.291894] n(XEN) DOM1: [    1.016950] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
>> fs4filelayout_init: NFSv4 File Layout Driver Registering...
>> (XEN) DOM1: [    1.018846] audit: initializing netlink subsys (disabled)
>>
>> This happens because for hwdom the console output is produced by domain and
>> handled by Xen as stream of chars, which can be interrupted when hwdom is
>> scheduled out and so, cause console output mix.
>> The Xen consoleio code trying to mimic serial HW behavior for hwdom
>> unconditionally by sending available data to serial HW on arrival.
>> Xen consoleio code does not account for Xen console input focus, comparing
>> to emulated serial hw, like vpl011, which does the same for domain with
>> active Xen console input focus only.
>>
>> Switching console input focus to Xen improves situation, but not enough.
>>
>> This patch changes consoleio code to account for domain with active Xen
>> console input focus - console output will be sent directly to serial HW
>> only if domain has active Xen console input focus. For other domains -
>> console output will be buffered and sync on per-line basis.
>>
>> Example output:
>> (d2) [    4.263417] Key type id_legacy registered
>> (XEN) DOM1: [    4.658080] Advanced Linux Sound Architecture Driver Initialized.
>> (d2) [    4.277824] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> This causes random multi-domain tests failures due to inter-domain console
>> mixing which breaks console parsing checks.
> 
> This remark reads as if "here's a patch, but it breaks things". Instead of
> merely "This", did you maybe mean "The original behavior" or some such?

Right.

"
The original behavior causes random multi-domain tests failures due to inter-domain console
mixing which breaks console parsing checks.
"

-- 
Best regards,
-grygorii


