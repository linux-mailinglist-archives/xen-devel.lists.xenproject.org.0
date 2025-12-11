Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9D8CB66CB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 17:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184348.1506827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjCc-0000jU-IE; Thu, 11 Dec 2025 16:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184348.1506827; Thu, 11 Dec 2025 16:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjCc-0000gy-F0; Thu, 11 Dec 2025 16:07:38 +0000
Received: by outflank-mailman (input) for mailman id 1184348;
 Thu, 11 Dec 2025 16:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cEbC=6R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTjCa-0000P2-VC
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 16:07:36 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fb0cb39-d6ab-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 17:07:32 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA5PR03MB8450.namprd03.prod.outlook.com (2603:10b6:806:474::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 16:07:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 16:07:28 +0000
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
X-Inumbo-ID: 7fb0cb39-d6ab-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8rD7jFQ0uVDnEPxDCbT9LIBmStoQUlbuJMcYHduB0MX93x37buw04w8tLO86OJfSkPht0Ve0a0KMN8o8/Rx6oOSHPGh5V7aq4ifNgM0eJkegXy35YTtupSKGOF5GE5ih0tzhE2q3zFq75fMvgqfc2Dc19oMdIEssDtpiG6n2m16pNDFul6WFa8NVYLwCPTcC0ztAGh0EpkBAAu6SmNZ+s79PKuW3Z7JOM/mhBptkTQKGw5xw5+fYjNcDJsgVWEfHVM6ZSG6i6OJH3RtnvIDsW0i/AejALKUV5I7Vq7rokiO6gJLpjMmcQV/5qMDDrRt1utz7W/CqiqhYbR70WhBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dkC22Fapj8fe/Y/15LRmqOMgRTxVpOrZTEoC1V25/o=;
 b=rwNdMmM+zhtXJBTS+VChloQdA9InCQF9QthkTV2Wibt2uxL4DbvH6/blKHIhKsAW/Os4lOzofb43otn2d4BxilP3RFPj4zfbLQPV4a+rjWHDbWBpomPTGTjff6ug0szfwuq7BhA2/AhhbSQhWKPaYgu8hTXacn0/JaNlqRtznOnSTaqRcRCeM+uBsrZQDvsiMywUC0CLyiZnib88wC+9rPHGifmqyzA5F4IlnIPis5B5DRWwdbzPHS/pJMhp8NwHecxybFjPGJjnrXFkZIbOqose064WtJ+fgAm7R/OfsvMmo5MTTYw6CUC8B0rshDi0NdOTpIFIQCmVlhwjPPVuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dkC22Fapj8fe/Y/15LRmqOMgRTxVpOrZTEoC1V25/o=;
 b=EgG6JERK0TY800Y+OICqw/qKDlpZqPcKHfXYlxRoaFMtOr8r6bDwN+XuolN38hluG1JVjux0FSYTabsHZuvPzC/fPwVLzjLRoLfdmviDDDURg3o8TX8w0/2eRthMsIVuYI3jzeaSqkon2hbGiSCqLHCSRbQeSZ/rPYVCehji5t0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <712305da-b435-4f5e-8ed2-279e1f26e45b@citrix.com>
Date: Thu, 11 Dec 2025 16:07:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Current Eclair analysis
To: Jan Beulich <jbeulich@suse.com>
References: <7744f9e7-17da-4f48-837d-8fc087899af5@citrix.com>
 <73559a38-d5c2-4e04-a6d1-24695573552d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <73559a38-d5c2-4e04-a6d1-24695573552d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0153.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA5PR03MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a5c3562-6dfc-4809-06d8-08de38cf6203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1l4MmlFdjFSZit2bTVyem81dGIwdlVqV1pEaCtNejdNdHRNL3Rpd2JjekVo?=
 =?utf-8?B?eEtLSHlaWXBjOGt4cVpJSC9qVFdIdXl0MTZTUStRbFhuM3pCbUhuTTBoc2FF?=
 =?utf-8?B?OVIweDBYcEpjTSszWHBCaVNrakU5dWtXN2x5SmZONFdxREpyWUhKTnp4OWJG?=
 =?utf-8?B?QVFLeFZ6SHpLeU9lem9BQjZibGhmV0JuQXpjM21BbStBMzVBeE5WK2JzY3ZR?=
 =?utf-8?B?UzFDaGpZTXZPSWxLaHRwZjhzSGtkcG42L3NTN1NrZVBwdElvZG1hUHNPTlpV?=
 =?utf-8?B?dFlpREtuQkd0ZTZWakUwUGtaaCtocnI4aUMveFBVRERiMHpxMisvNk4rYzE1?=
 =?utf-8?B?MHZDMUVCTEhjanF0K1hFWmFJSVlQRThYR1lJN2RnMGE5L053RGJ0SVhac2p1?=
 =?utf-8?B?Q01WRWxER1crOHcxdnN2OFFxQ3RWaWVLemVGTWNmdnJpMTVjUkJoRVNqSlU2?=
 =?utf-8?B?dXdOL2FwMFFwdmRxQzN4ZkZzZTR5MlN3Y2toRnFaaTZnRzArQkcwMVRhdk1v?=
 =?utf-8?B?RHA0MU12Z1pyWWlDTXBHVnRnRUNMZytHRmNNVENDUE52aTZvZ2sxK09WT0Iy?=
 =?utf-8?B?aGlIVmtOeEpZaHJ5RVZkQTZSY2dyd1JJd1V6SVBIOHR5bFMvdEFZVEk5S2hr?=
 =?utf-8?B?NlRja2NmTnkwSnE3d2VBSTNnVUU4SFM1bGtPdGN5TkRaUFBacld3Wm5FZXRI?=
 =?utf-8?B?Sk14NTcweEgwZzh4QUc5aGMzOWlvd2h6b3FVdVAyUFdQVkVwdnRTdWt0UDdF?=
 =?utf-8?B?UWwyTEhGL3kwKzRlYnNRa1FseVZVaGtEcFNwNVpUQ3FRaTdhNC9COXVyQlNi?=
 =?utf-8?B?YWU5bW8rMk1WQ3RSMzhXMWVSRm54cnJ1SUxrYUk3TW8vWElReFNjbTd6dWxF?=
 =?utf-8?B?ZzlxR3c1R1RPMFZPSUcyT1FKaHZiWDNaQzVLTXNwZVA5dzhUUGt4K2Zody9x?=
 =?utf-8?B?Tk5yRmxPZHdCQVBZTzg2SzJMM1cwWnZERndKdzZtbHhadStxNUVucjFWMCty?=
 =?utf-8?B?VHhqRzNFMWtjbnVhdGd0UlZ5b2R2ZFB2ZGVETk16Q2x6RkpkSWJJQjgxZE9R?=
 =?utf-8?B?RFA1SnJJNHArQnhBZWVnY0Nmb2V3Qll0YW9GSWd0bDByOFpIUXY2RVBnQWNh?=
 =?utf-8?B?a0Y2VXRWYnhQd0p4R0JJVklYQTlCcnhkYWZPblFyYzNzMm9TVk9CZ1JtTFFW?=
 =?utf-8?B?bHVIYWlRblIwN1M5T1EyckhObmZ4SE9TcHcxU2dFRzZVZmQvaTFiQ0YrTmMw?=
 =?utf-8?B?NlVLR3N4aVR5THNlVHZuaUlrZUNHOUYveE1uS1hyaDRaVzJ2S2p1MTFWQVBS?=
 =?utf-8?B?UkE4NkduRG5WdlZMR0RQcE42WEdxQ3Zsa3Q4dVVudk9vYS9Ockt0bStSL0VK?=
 =?utf-8?B?YkhVQ3BueGRqWlU2TjQ2bFhCeHhvc296bEhNQksvU2taSTZkbUc5Y2N1MHli?=
 =?utf-8?B?dGwwUXJySmJVVVV4WU0rQ095OWdORXBCTkdTQitNbXhnM2FSMUpYSkpZSllL?=
 =?utf-8?B?K2NuSHpXTlo1M1hJclY5ZENSNVgrYU1ROG01RHUwU0pzTVZzTzlUVVFZM2RL?=
 =?utf-8?B?Q3V1anliRU5nejdnTyttK2xyMVlrQXRyUE9xY2hkSnFQeTdGY3BUbzVkR1FN?=
 =?utf-8?B?bzU1OUtPbGY3QlE3NFRUTGdqMy9YNlUxb1VySHFsTkhiMkJpTUlqSzduVk1G?=
 =?utf-8?B?c20wMWVnQnozQ2hoY3NSNW52NGRTWlZJdEtjM3RWcHJwQmJCL0tVVy8yK3gv?=
 =?utf-8?B?RUNXemxMc29Oai9CZ0RoeDNzSmlIeTYvUVhheE9UZ0dTV0pFVERkT2FaVkVV?=
 =?utf-8?B?WkJjZ05FTGd1YnkrZG9HSmJDYjcvcGZ2cHhJeXFBV09xOVYzZmt3dUc2NkVv?=
 =?utf-8?B?SVFvZzhTbEV0V3l2MFd4dThrVGU5MUZQS0c1L29CY09nNkd3K0djKy9JM2k0?=
 =?utf-8?Q?8esoBAEb4nZ5sTg9p45pTm7kGfnxGCKv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S00xcWhaNTRzczMxYldydGZmVGxlN2RrTDUyS0RON3RFM0FUcE9GWUtUeXVE?=
 =?utf-8?B?c3I0ejRFQ1NoSEhNTzVaVitCb1FkSnFxVmVPUFlmeVNVQWdpU1ZvYVdPZFFO?=
 =?utf-8?B?aEw2S3pOR3YveFZkcnR4cFRFWnlQaHBXeW1WTzNsRUl6bXRHcHQ4cUNNR05x?=
 =?utf-8?B?TXN4SzFSRVo2bXN4WCtET3lXRzNGcC9FTWdYUVBiRUIzdVRxTmtCMFdwTkFO?=
 =?utf-8?B?ZlpPRFFub3VyNEVTSkliUEEzeWl1b1JnWWxxT1d5NjBLMlZFU0ltYXVzQi9t?=
 =?utf-8?B?ZWtXc3pHUkVucVNqbTEwUHh5ZEVyeW9BZHd4emxYYkpEVHFScjZEeG8yd1pQ?=
 =?utf-8?B?ZmpwdjBiQk4rV0MxSzNONE01bURkcVZ3TEEwZGZMRG5sdEpSMmdVQmxwMHBB?=
 =?utf-8?B?VTJJRGNyMmRZUm1rNVNERlRGcHFkOXVZdU1UbDgrQWgvbUh1R2luU1BENE1t?=
 =?utf-8?B?M3A5YVB5T1BRRWlDZWhNeGtDa2R3L3dtbE5jeW5FRjc3YVlXWE5wUUk3Q2ov?=
 =?utf-8?B?Q3lxZkJUZDQvclBQaU9uaHUzVU9mWWk1T1NpMU5YbzlqQmNzSmpDNlJRNWdj?=
 =?utf-8?B?MmtZcFNSWmpWT3Z6YXIrejRtQTlFeUNISHRoeGYyRHo0emVqb1o3RlNDNGIr?=
 =?utf-8?B?QWh5MzUwdVlSQjF3Zk1sajFjdjdITmVYaTVvY3c2VXpFU0N1UnBLeFdpK0wr?=
 =?utf-8?B?V2gzOVFaWGY0RGRhVDl0L0xrOEd5NStDcGNST25yNnN0N21vaXBQQ1VBZHpM?=
 =?utf-8?B?alNUYTFYdXhTcUVvTFFOa3pKVGQ4WGpwTnozdVF2K0FQYlZXQmNLd3cxR1hH?=
 =?utf-8?B?NkVteGdnMTJDS1d0cUcxRDl4R3BNeDhGODNqZ1Yyc2tuT1hHYzZTZ0lXd29Z?=
 =?utf-8?B?RXhkRjlrd2VCc1dialVkVGxtbTRrdDJML1BvR1RWN3lmcXZmb09TSEFoVlJp?=
 =?utf-8?B?MmZpL2VTQ2cwMk9JczZaN2s2Zmtndmp3b3oxUGh2cWVaN1NkYk9ZU2JpTHNL?=
 =?utf-8?B?eElIV3Z5R0M5Ym5wdkYzQk04VEZGR2E5OFFya21QbDFQMHFmemZZVEQxa0hH?=
 =?utf-8?B?eTVQRzhWdmMxMHFlVmFuWUR1Q3Z3cHhiYXo0eTdsKytOOEdJenNzNGNTbVlQ?=
 =?utf-8?B?Y2tTVjB2YmMrWVVPMnB0OTZqemgvKzluTzBzQTBOSmR3MXJKNmV3NmFFbHo0?=
 =?utf-8?B?Y2VaUXR5d3Y5ckxpMUhURkxzWFYrNVdmVUx2OXozdlpHQVlxd2xRSi9WWHBI?=
 =?utf-8?B?Rm1NMThpNit6ZkV3WGphZG92WUhpejRmVHZGNGZ6dHJkTkNHa0srNERGSFFo?=
 =?utf-8?B?N3dXcGVsRFdKem1EN1EyeWVzV1BkTWFEeG9xSUcydXozMWo3WU1Wa2FNRzNx?=
 =?utf-8?B?bllmUXFQWXk5akE3bWpGd3EwSHY3dFBrbGlDSWZSMkVBOVc5QVdNUUt6NlRH?=
 =?utf-8?B?ZkFyUmRYZnRNdStZUkRVWlNCWlpFS3RHNDRCNE96a2NtaENEY0FpcnFIZDRV?=
 =?utf-8?B?MHE5UXhIc0JKeGIxejZhZzN3RGl0UkFta3REdktPQlY5YjZYaFdiRWpEUGt4?=
 =?utf-8?B?dHJUYzkybXRRZllpUE9VVU9BRDlscXFSSnRyNVlGTnU1QjV4NHAxckMrZjhU?=
 =?utf-8?B?RHhDaUg2ZTRvWjZVc2NGNW93QzRMT2pyMStlVXB3a2FYZjNaTkwyZ05xbXRu?=
 =?utf-8?B?T0M0RFJJcTluNVNWQjEvcERkc3dTOVpTU29nSG81eG9lWFdIOGZ2bFBDcC9D?=
 =?utf-8?B?cmNDZVRKRnNySkIzV2dWNk52NExVOVBIbmRjNWtkdW5ycVV5QjBkRWtiMHB6?=
 =?utf-8?B?V2IyeHp3WGM0Z0pDcm91U3liRW1nT2hPQm8zK09LODVXT0YzbUp4d3BWTFZl?=
 =?utf-8?B?ZTU5MHNQUjd2Tk93d0FqU0lobHlDR3ZHdTNJWWZDN3NNcnhBaFNCVEg1WWs4?=
 =?utf-8?B?MnA5N29nUDdTeDdGSTdkemVXUU80eDl1ZnY3RlYwTk0xMTBHODkwZkd1cHhK?=
 =?utf-8?B?MHZIR0xDVWp1amVPSVJrQkZaakY5dHRUWjZoWEZjeEtid0lhSzJTRjZWRnNk?=
 =?utf-8?B?cys2TVNxUTV0WHVtczhqazhhUG9iMHNIVndpdkVKV3JuUm9VYkNTbVhEazgx?=
 =?utf-8?B?OGZRcDJZdnpCNVVkOEVHbG5uZ1NRNGt5WCs4MWM4ZmF1bk8ySmJKQVZLWnVw?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5c3562-6dfc-4809-06d8-08de38cf6203
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 16:07:28.8411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwTVJjmiRKdfHLLW5ctsjs1e2U06Rej6oEMFgithwEnG4lQC4QkKKMKhBlfk0Bfbc4t9TotkhXyul94Kl7nqpndOl05j057KarIKN6rVfb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8450

On 11/12/2025 9:04 am, Jan Beulich wrote:
> On 10.12.2025 19:14, Andrew Cooper wrote:
>> The *-all targets want everything possible enabling. Ideally we want
>> something like Linux's COMPILE_TEST, but in the short term we can just
>> adjust the input Kconfig.
> Assuming the PV_SHIM_EXCLUSIVE negative dependencies get sorted, what's
> wrong with simply using allyesconfig there?

Off the top of my head, ARM have two different GICv2 implementations
which are currently mutually exclusive.

Linux uses COMPILE_TEST to include drivers which would otherwise be
excluded by base architecture or platform.  We've not got much of that,
but IOMMUs are one example we do have.

But more generally, "I want to compile all the code for CI" doesn't
necessary mean "with coverage, and sanitisers, and LTO, and everything
else we've not gotten to yet".

~Andrew

