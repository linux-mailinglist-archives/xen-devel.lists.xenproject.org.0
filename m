Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2BFCA3816
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 12:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177603.1501848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR7wr-0001Gm-EZ; Thu, 04 Dec 2025 11:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177603.1501848; Thu, 04 Dec 2025 11:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR7wr-0001E7-By; Thu, 04 Dec 2025 11:56:37 +0000
Received: by outflank-mailman (input) for mailman id 1177603;
 Thu, 04 Dec 2025 11:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdJQ=6K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vR7wp-0001E1-Lg
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 11:56:35 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41990ea1-d108-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 12:56:25 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5622.namprd03.prod.outlook.com (2603:10b6:5:2ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 11:56:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 11:56:21 +0000
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
X-Inumbo-ID: 41990ea1-d108-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzsL0l81LTU8ddtEs/gy24G/+W0ckwVbgjKmIJUN0xOukNJhDcz+jsXcncDlknjMk/jJC3R/FEeA7jx4F2yhpsvD3UeBF2EvpsQtTvL549VhCZMIGFq6xLq0yjiAhg+gGfgZf3RqkbyBXdMGSuV0i9DPbcUxftiHeA5gDogUwW/nsMSXJPtgel/NUyeWQEVmGJFnr6ck3Air1f8EYEfoA3HLLDuM/kQ3BIwK4ui9VH4nbHCdM1Kd+CheLnK82D+SByb5iL3/zhsK5n7BXYSiD4/qsjoR0xmV/p03amMcsXNPohezXGQ70IxxOc/VJN1hIMS+A2zLFFozvbSQCK7pGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=979AaQTcNswXGon7Uw2M8iFwHq2O8Juo8snw4GX3V/E=;
 b=GRt3dfeValXOaGcPa1RyJBxZJhBMW3bP4+eQZQq/K9jsMFLLCGC0z9QnbtifEY+IuWhvJWjxpfjAHUB411p1UCjZ1LaAkHf7xkIWq/kXQX8oI32phGHBgCUReeDIranIiavXA7U1mcB23g57W8VDXuGFIAWWgdXcqzQAWvS9JW0S2S3UVnOME9k2xaqldr+xRcKUnyhfaM0bpT49AVTG2fLoqSOb34WWyBWlUeUEhm+jmu1PagaNsF1mEAPpVtGr3DiAhqOY/IftrqHJ6ZwCER+2hY3UaMVhauvWwOOuYaWR98LprXnvKuQcyMnGngrmhpra25PU5m3e3x0e9fXSDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=979AaQTcNswXGon7Uw2M8iFwHq2O8Juo8snw4GX3V/E=;
 b=H6UslSVByB8DHFJIY8hObBCAUMUYa9nBVBd/PthOT3I4ly+eW7BKY+oR0HqDGdEhT1AZeGQ0fKE7Ww0amVVXLqI7pHObfSNLWzq7nZ9cebh6184RyFtP3oyJcLhxAz6rNgAcH9XMi892j8TiAbO9g7KU+hR+sEqnEGkqaZUWmN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e47d6ce7-272a-4b47-a9f5-ec61998cb1d4@citrix.com>
Date: Thu, 4 Dec 2025 11:56:16 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
Subject: Re: [XEN][PATCH] coverage: add extended coverage capabilities
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251203222436.660044-1-grygorii_strashko@epam.com>
 <d477a21c-b621-46bb-94ce-4775b2b6a90e@citrix.com>
 <7a920fca-8945-41de-ac3d-864ff03d571d@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7a920fca-8945-41de-ac3d-864ff03d571d@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f7ca5a8-8b13-45db-11fa-08de332c23f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czVzdE5wZFFhY25MYzFRajlZZFhEOUlPMGhHWC9PbnF3QUphZ1BsWEMwUC9Z?=
 =?utf-8?B?anNFamN0bFUrSXdtTExQVGcva0ZscW1HeVI1YlN0TG1XU0RuaE9BTkEwWk1o?=
 =?utf-8?B?TlJxUWpIUmsxOWZJSjZVcDMzaDJnR3ZFdDUxcWhvZlZCNmtBZ3UybndOc3Y3?=
 =?utf-8?B?Ym1xQ0VEbG1BeVRGbDdWem5kT1NpZjBja2NkTjJZbWZ1UERhQmlyOVdIbzlH?=
 =?utf-8?B?QUhqQkNTQ2E5UEFycEJlVlpoOUVLeDFYWmpFM0Vnb0FnMzVocEZjMW9ZZkpr?=
 =?utf-8?B?YXNmWG5OOHV1Zm5Bc0F1YVdZcmEzaDlGTXZnM24ybVVvempPdGtEYjRFRnlY?=
 =?utf-8?B?MW5HWE5LS2dRMjdkUk9rbENzNG5TMFZxN2VqNFNxV1JmOEZDeEFseCtHNEVq?=
 =?utf-8?B?VktMYjEwdHRKaGlaVzdsbDNiRmdiSjFOWTYwMm5MUmpvZG5CbGhPVVhpNmF4?=
 =?utf-8?B?S2xQRDBTVkJnM2pDdmpOYVk4bGRRc295dXI4T3JlUjFmWk0xZCtCam5GanBa?=
 =?utf-8?B?a1E3QmZxQXdvUG81Vk5ZQ2k0MHpWUjA0eW9sSlhBNVF5WVlCdWV4U1B3aGhW?=
 =?utf-8?B?YnJGdHYycmdKWU95L3p3OFIxYXpnNk12dWNVVDh1dmtINGRhbEtzK09UaTc3?=
 =?utf-8?B?Nmd3cCtyZURMYVh5NWw2UVhuYlV2a01WcnVjZk5FSG9sdEVKaWxVNUdxdVlj?=
 =?utf-8?B?TEMwQitqTCtPQkdyYUpGRUR6M3V6b285NlJZdVpqdlhTcmIxMGpiTnloRjU4?=
 =?utf-8?B?ckJDVWxlU1N6clhNVzFsaTY2MVpmOUxkam5YVFNld3V1Q05EZTdKRTdncEVq?=
 =?utf-8?B?REh2eVR6OXMvMnBOQkVnMUU1TTJkUmNIbmhGQzhHOEVPYmdQeTlsSDdJWGR6?=
 =?utf-8?B?YkVmaDVhdzVCZ3NLeVFUSS9qMTJDTGxQNUxEdVVKZFcvWS9heUhRa3RSd0Y1?=
 =?utf-8?B?VE1MaVZVbGZrVlNSWm9oNVNEOXJhUHV0VERINXVPOTgzT0FnVGIrcGloVzh2?=
 =?utf-8?B?Y1lPSE5rZG1RTjJLdmF1YXpNLzM2bDNqdjdCc1c1R2oxZFdzY2dxSnp6M2Nz?=
 =?utf-8?B?RHliTUF4N0dvaDNhVXZJWnQ4MW9CYlhwaHZNWGdoY2p3bHd6N1Z5Q0Vnai85?=
 =?utf-8?B?ZFBVMTQ5MFR2cE1NN0JZL0RPTnljSzNYbHdMNkpjNkViendKL3c1dU5SN3ZS?=
 =?utf-8?B?TlhROTJQNTk2a2NHVWQybVBOenBWOVhQSXJlS3JGVHM0L0VqRzFqWk9RVUxs?=
 =?utf-8?B?OHVzTmVZMXVwQ00rRFNKbU9PTTQyajdUUFcxOVJoZTZUbU1RUUo4K2lhOUk5?=
 =?utf-8?B?QUROOUx1eFpiRk9QUUR2YitwdnkyMGk5ZXhadjR5VVcrNkNXQ1BRMlpxTEF3?=
 =?utf-8?B?UFhvcHAxdGc4WGpnS0FCQ05ZNUU3Tm81Nyt5cVhTa2hkeFN0SGkwcjNLQy9X?=
 =?utf-8?B?V2p1WWFQRjlJemx0YzdDbHIvWFBzT1FJQkVYMUNHL1NkajB2bE53dzREY05L?=
 =?utf-8?B?YkRLY0thVEQra0cvZFRtNU5vRkg3WGVDVzBEc2ZuK1YycytQT3ovVUkwWnYv?=
 =?utf-8?B?RXVkL0RWTW5kSmZlTGFDTHNLbnZVNUhJeU15V0hPZG81Znl4dURNNXBLZUg2?=
 =?utf-8?B?OUxnclpqUW1WNm1kSXJXUmZJUXhySWZBQjBhTTFqck8zSmh1Q1dHUFFkM1Fr?=
 =?utf-8?B?bkJISWxxSzJrRmV3ZVYrbzRMT1M3blhSVDBqeFVMbHh4MTloZEZpZVl1ekFK?=
 =?utf-8?B?SjJacWpXeUdmbVBCLzQvaHBONEdTNkROS2FocUdBeFF5MEZUcTNIK0hpdDFT?=
 =?utf-8?B?UUNGUVJkdCtkbiswMGhTTk51TDUzanhJUXdBZ0IxOXQzTW8xNzE0Uy9hOVE1?=
 =?utf-8?B?djRnOVdTM0NGb09Fd3RTQ1JHdU5VL1BiMjFTKzhaT1lUU3A1RE9Ta1ZSaU1T?=
 =?utf-8?Q?gB5AJzCKXKqDop/wjJ89B810fWYbqRq+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFpueXp5aDU3ZzN2T3kySEg2MVFhdkdQTnRROUgxVkRiaGQ0MktSMHYyRitS?=
 =?utf-8?B?NEg2TEVxdUl3UWhhb1VJYjJTY2F0NDhKeXdiV0t2Q0Yzd21vSEdMaHliYWRq?=
 =?utf-8?B?TGF6d3JqQ0tQcnkzcUxGbFhWdlZsWlhNYWJXczVPNjZpSkNra3U1WGtZeTl2?=
 =?utf-8?B?OE5NcjZqSHcrRmV5SVE0WWdLWGd5UGVDY21lTzM4Kzg1UVk2WkthRThmLzhR?=
 =?utf-8?B?d2h3bWdKenJXV2ZremR6RzB0TG1BcEw5YzN3eUJZVWhKTmM0Smo0WGxMcVJt?=
 =?utf-8?B?UWFJa3RBeWg3M0g1Q0o2ckdZcU5HeE1leWZHWFJ0MGd3VmRxNDFDK1p4WGFP?=
 =?utf-8?B?eWJBMURIai90cjBudkpCSjZqb2cvUWtZZmJkUU10MVBkeEs3WUM1VGRsS1NQ?=
 =?utf-8?B?RExrM1lHWnkyWGNpRC9yeldDVTJLNS9QMC9RYk5uR2o2L1EvSHk4S0t1MW0r?=
 =?utf-8?B?cElvU1dtcCtvS1FrT29MOEtYVjZEczRoZlFZZHd3TXFrME1odEtNRFdnRzZi?=
 =?utf-8?B?eGp5LzBvVzMrekhCTW9Ydm5Ublo3OEdmdEJNNDNJRys2Wmp4SWxNN0I0WCtN?=
 =?utf-8?B?ZDJFRzVKSEY2Y09qTFgyQmtyYWxaYytjS0JFVk9iWklkUG9Menh2d0kzcmcz?=
 =?utf-8?B?ZXU2RUdWUXNta21Pd1RjZVgwK2QrMFc2cU9tNkxtaVdSUTFZK2xJbzYzS3Bv?=
 =?utf-8?B?U2FtZWVPUFJST0pQVzFrbE1MRm01TCszRm9YL2JYSDJMRUh4ZlpsNnBidFFj?=
 =?utf-8?B?ak1FWmtkZng4a3BIaDA2MGdBOG1uS3IwbFR1QmVwK2tNeVJHTEFGV0I1WWpF?=
 =?utf-8?B?NUZiM3p4MWQzcjZ0OVBWcXB2cE8wTVFFaWN0bEZXWklmd0RXTERPR3FKQjlQ?=
 =?utf-8?B?cDNOUEFCS21rSDlDL1FQM0VUbFVJcEFIYUlYSmhpTUEwUEEwZksyVHAxYWhX?=
 =?utf-8?B?Rm1Ub0M5NXlnS0Njbm1qR3FrTG5uZlhpRVMrTmpOMWRwMjBaa2RteDlmZGZZ?=
 =?utf-8?B?RlJnc3ZHZkhmSGNnOURYRFplTEVmV0pLVTJkOWU2YlhpWjVzNzF4Ui9JVUdk?=
 =?utf-8?B?L2FldEY5VzhUSUEwT2tJT244ZTRLQVJ0bDBOZnVPUSs5WktzbFg1SFJQbHZz?=
 =?utf-8?B?SXp0WWV1N3Jpazcyek92N01QNk9KeTlUZlErbm14M2llMi8xQWNJZTRDc3ho?=
 =?utf-8?B?V3I3clVuUDNKZlJWd3ptZWVwOUFteWFVYVE0M1BaeEZHbFlXWnlHTWlxU0dM?=
 =?utf-8?B?NGYweWsxL1hMVGUyMnRCWUp4c1BrYjVUWWoxUmswU3lmSFYyRWtpdlFWMzJC?=
 =?utf-8?B?c3J5eVRqeVYxVndtejBDdURlVDB3RDYwU2NFN3BwSjZTbENqcDFlNmxNSmhv?=
 =?utf-8?B?L0dXVXc3VGMweFgvZCs5QkxGNGVVTWViZUNZVnR3VW10R1pKVHZnM0o4Z2tL?=
 =?utf-8?B?Vk1HSE1RRVRkWDZObVplSDBtM1VvaDJyTnVWMEdjV1hQQmo1RkR6Z2ZNUkQy?=
 =?utf-8?B?NUhTdGJjc2RwT25oa3YzMEFRRUJ6OS9vYmJubFdqN04xb25VMHdEWE9nWnBX?=
 =?utf-8?B?bmk1bWY2RUE5d2hmV0hiTFJUeWFwbkdMaTFNdkRJYm0rVjRDQVN5b3dwMzdo?=
 =?utf-8?B?b2g4SytXTXVFTU9hVVZva2R1QVd4MXp1TWtrK2lzMU9CTDREN0lMZUVWcW5k?=
 =?utf-8?B?VXJMV1RFWkQ4Y21YemlPa0hUZHZ1RWMxejlTd2dvQVYyTHVLckpjU0FqQ1lv?=
 =?utf-8?B?dGw3T3pEQWRpZzZPZFQwVEUvTE9pRFp2WU5yZzYyMjZTMXRLNjJ3VkJYd0dq?=
 =?utf-8?B?aUhvR29zT0lwS3lNNlNBWUVZSlVJZ0o4Ri9qMStYdndQdUtlQmlZdEtTNEpj?=
 =?utf-8?B?RHNSNXpCcE54WUQ5YS9wUCtUR0YrSGp3Yk80UUpqMEhQZjFqSmtOUko3UGww?=
 =?utf-8?B?RE93SWVPcUFpdGZyNFVyZExuQ0RXNEllRjYwVTczdWprcUJ4T3Y3ZE5iYUcr?=
 =?utf-8?B?NjhmcXVDNHM3TlMxRzkxZCtFbFcwM0Jla2R5V3lncFcyY1QweThqeWNyc0ZR?=
 =?utf-8?B?YityWGVIZ0NVT1BVQUR2NnJJZ1p6bElDTXNKdmpoa010K0tlZnFzWE1mRkFR?=
 =?utf-8?B?OWFnRWF3VHFQc3MvZUllWGdGR0pwb0pGOWhYTk41STBFMlF1NG1sVDN4UmhE?=
 =?utf-8?B?dUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7ca5a8-8b13-45db-11fa-08de332c23f2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 11:56:20.9492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EKk6pKwfte46lPPQHllzX5h5TdpK2pB49im3ybOJHdN8k1pDbPOzpcFLiG7MEq3CWjamBCSRWY6Ji/kus6tiuxFCQuOTSkymcnwF4K7RKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5622

On 04/12/2025 11:00 am, Grygorii Strashko wrote:
> Hi Andrew,
>
> On 04.12.25 12:02, Andrew Cooper wrote:
>> On 03/12/2025 10:24 pm, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Added CONFIG_COVERAGE_EXTENDED to enable coverage for .init and lib
>>> code.
>>> When enabled - Xen .init data will not be freed.
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>>   xen/Kconfig.debug          | 10 ++++++++++
>>>   xen/Rules.mk               | 13 +++++++++++++
>>>   xen/arch/arm/setup.c       |  2 ++
>>>   xen/arch/x86/setup.c       |  4 ++++
>>>   xen/common/libelf/Makefile |  4 +++-
>>>   xen/common/libfdt/Makefile |  4 +++-
>>>   6 files changed, 35 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
>>> index d900d926c555..3e04e1a3992b 100644
>>> --- a/xen/Kconfig.debug
>>> +++ b/xen/Kconfig.debug
>>> @@ -44,6 +44,16 @@ config COVERAGE
>>>           If unsure, say N here.
>>>   +config COVERAGE_EXTENDED
>>> +    bool "Extended Code coverage support"
>>> +    depends on COVERAGE
>>> +    default y
>>> +    help
>>> +      Enable Extended code coverage support which include .init and
>>> libs code.
>>> +      The .init sections are not freed in this case.
>>> +
>>> +      If unsure, say N here.
>>
>> IMO this is unhelpful.  Noone wants to opt for the model we've got right
>> now.
>>
>> Instead, I think we want:
>>
>> config RELAX_INIT_CHECK
>>      bool
>>
>> and have CONFIG_COVERAGE select it.  There's no need for any user
>> visible option here.
>>
>
> So It will be always enabled if CONFIG_COVERAGE=y, Right?

Correct.

Now I come to think of it, IIRC UBSAN is also excluded on init objects
for related reasons.  (At a later point), we can see about giving it a
similar treatment.

~Andrew


