Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD79CA815E
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 16:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179175.1502786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXOV-0001p6-Kq; Fri, 05 Dec 2025 15:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179175.1502786; Fri, 05 Dec 2025 15:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXOV-0001nS-I3; Fri, 05 Dec 2025 15:06:51 +0000
Received: by outflank-mailman (input) for mailman id 1179175;
 Fri, 05 Dec 2025 15:06:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRXOT-0001mR-Et
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 15:06:49 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0483e7d8-d1ec-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 16:06:47 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB7677.namprd03.prod.outlook.com (2603:10b6:8:1f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 15:06:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 15:06:44 +0000
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
X-Inumbo-ID: 0483e7d8-d1ec-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VN07CB3C3lBHZ3A1klJm3L44SM4KZngYr7q56exX8ok5zYQoDTDl8tZWBd22BQXlhJGAr44QNEzhWLaY/DkZHvp8ARQEyiIJO09HMeWbMtf42dVa17cw8UUn4nonm8BCaJOY30MokHbbO2xiaalPw7MSr+8zCvQkbiO4Fwa9atIfK0EBtwMeNR79A7pf3t16y4AOTEII1cUkgfAyPIJMIeVJdvPhldWKge56qEWS/gBuT7+iXC+wuiQ9Zh9fajKu/EkbP7gU/u3YHUbMk7KSYjwv5fXCfiJvKHjU1odp4qP1czZmFbXxh42zjzo4U3hed3RNzCdEMeSCajcIwIM4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAB2aPIjatkG6/LqpOkMLplp4a/GArTk1EgUwIgx5qE=;
 b=mJP00HMCWZxgFYMdwOVj5MNeI3Oei+vkt6kTTwaLiqauZ2p68EYYipkPpLJX1arnUeOwBzhnmmqCOdbChsMW1R7HBReCfxb2JsKeVaEgA5+euOdIQ/dFZXjqMeufiRPfibwmwzQVEiOkjSsA608mGBTUSJOruiiA/ZHJdn1FsbmKAyX1dThx68ELh2EKkxmVqIgf62mCLnGzYz0PFRg7SvClpIGdxq/9OHFkS1TJdkZVtk9jf5ygEeS2ixX1gEfsbxVr94iA54TL+U9zJtkoiimMHDrHwy33QYRka10sjOJFg8BJ806OGXlzbGmJQhS+us9ST0CerSxmzF8A6tFUJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAB2aPIjatkG6/LqpOkMLplp4a/GArTk1EgUwIgx5qE=;
 b=RJyiKGr+EPA1GADs4bWut47kY5gaa2msFVUXdGin40wGjOzumZUte7oVnbl2EWYlcHeVs4GPmt041sYCOX5lbsu2EtLoJ3rQZcxt/8SkJERCTOApRYxsT8IbP4ykAnSaEJOZuCSGEIfwnpR8ffpmRB2SVEqlDLiPpmXOu3zIWVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6f189d1f-a6e6-48a2-875c-2df317b59b4d@citrix.com>
Date: Fri, 5 Dec 2025 15:06:40 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/treewide: Use __ASSEMBLER__ instead of __ASSEMBLY__
To: Jan Beulich <jbeulich@suse.com>
References: <20251203133258.1624223-1-andrew.cooper3@citrix.com>
 <c21ddcb3-ba38-4dbb-9860-731eb43c38f3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c21ddcb3-ba38-4dbb-9860-731eb43c38f3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0454.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::34) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e1a399-7461-4a46-e77f-08de340fe716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjJaRXhTbzhlVjJPWWk4RnYrSUluakl2WUZPRkgySzlsYm56eUhpMC9sUkFL?=
 =?utf-8?B?ckxuRXdjR0g4anI0SzQwNWsrNDRjU2dqaVBvS3JzYUI0ZkpsMkZ3MU9qVzZE?=
 =?utf-8?B?NENnbHZoYUtRMUhIMExUS29LYXhzOGxKZElZTndsQkdaVmFzUE5YVndJeG83?=
 =?utf-8?B?UEl6L1cvY1dBTENBY1QxZlF6ckl5THcvbUFpVHBhVDl6TjZmTkRzNTl2YjZ0?=
 =?utf-8?B?VzhjUjBYeXZWb2xYQ2VCT013U3hadHFnd0cvVjhnN2E1MzlXMHFlOElvWnpV?=
 =?utf-8?B?YmplQUpDdWJFcW81YVZ0Z2Jqb2UxcWpiM1lxUlVQanVqL0hpZVFvSkorbitG?=
 =?utf-8?B?RWZBKzdad08zNUZvYitFN0lnVVlycVdNeU5XYURhNjViakRjYzgyNmxMSmdJ?=
 =?utf-8?B?cWMwZnRteWpKS0ROVTkwK0lZN3cxWElXaCt0WTM1YnBMeTRnS0F4K0ZUSFlx?=
 =?utf-8?B?S3dFY0xRVFhTamFiWFM0b2t2cGVHb0lZenZSZHZkU2c0NCs5bDN3RDVoTXZj?=
 =?utf-8?B?STUxZ3BMN241clVEVTY1TmpnSGhib3MveTNEdzNtRXZIaUtQV0Z0cHVodlJF?=
 =?utf-8?B?R1lZa0ZyL3plbkF1QjVPUU40WUdZWEd0UVdNYWNWRXdxYU1oTmV5eklNenhs?=
 =?utf-8?B?NWpKU093NVdBR1hUc3lnRUNRMnJ3WGg2cWFQeWFTdm9LZndJMWw0S2Q2N1JD?=
 =?utf-8?B?NDlTcm43Y0V4aXYrRlltUWxXT1E4NDVoaWMyUWZyUmtzTDhMZXpTRmRSdWNU?=
 =?utf-8?B?TnVHTjZmVlZ2Y25XUDgyR1FRODZLSnFQTjAyMUx2QlRQbGQrTm5DdysyYjBF?=
 =?utf-8?B?RTZZc3oyb0p6T2QrUUFvcFNrZ094NGhFUm9wc3U5MklrNmdhbFRFM2YyRmJK?=
 =?utf-8?B?bWtLckhlbG5OMzF5S0VCMWJjZGpGQ0JsdndCZmZuT0tGaXpBVlgzdHU1RzVr?=
 =?utf-8?B?RGwyZklUam9EeGIzT0FqdU5mc3pDam5XbXV2Rm5MR0pDbGlocnpBcGkxM3p4?=
 =?utf-8?B?OWpvRlV4bDZ2eCt6T2tkbnNxR3ZQbUw2L3h6REpaSXdiTitkNTJTb3JQVTky?=
 =?utf-8?B?cjlmUkhCRlRyRkZNSlI4NlZUY3ZYMnZJN09XOEN5SjZlUkVQT29PZnlLYVVD?=
 =?utf-8?B?TXhiZ0Njd25WdXZBd1VNbHJiSWxFYUgvVllmYzgrd1hjWE1WYUIxRnNEaGVv?=
 =?utf-8?B?WEovcjhkTUdrbGhqK2pBYUx2bno2UHM5ZEkrUmgxOEVMZ2lOclhLWnk4Slp0?=
 =?utf-8?B?M1Z0aTBGeUE1N01kSkFIV211KzdHVytaMU56OHkweVVRaTBYUDZUbTFySFQ5?=
 =?utf-8?B?OHlMMXhDSWl1ZGNPWXNpbCtrZEJnSEVJL1VxMEE3K1lMQndkeW5WRVpuN3ly?=
 =?utf-8?B?QWNpUlZHbU44aHhWYVJRNnFaVFYrRnlRQmdybE52UWJnUlRVVDlzMnNibi9G?=
 =?utf-8?B?enIwVGJEbE9BRWx6K2NnR3VUVkFMVEtQKzc0anV2QmIzSVdIdzhaMG5Kbndt?=
 =?utf-8?B?YXY2OG53VGpiYzJNNUNEemJNRDlzS3lHMlZQbm5LN3VaMndpQ29ueTJhZHI3?=
 =?utf-8?B?dHVpaktjeWZvbm1FSUNsbFFSLy93eTlkdDFibGFsT0lQSkVaQlJybUxGNTZw?=
 =?utf-8?B?U2Y3NHptTWhRSGx6TEluK3o1amovRTNyY2JjRGQ0THVYYU9RTXI1L2Y0S3pW?=
 =?utf-8?B?WlphRXRUK01mYnJlckNzd0pLQmRyd21McmxCUVlMWEIveElkQlRjQyt1Z1Zo?=
 =?utf-8?B?UytxM3RkYlJxTTF4R2VUa1NmKzdrYmtnOHNMV2oyL1g3RVdSbG5kUTNUWXBY?=
 =?utf-8?B?YUFuWTZmcjlhL09oNk4yc2JDdHhQcnAwdklOUkpjQTVNWGEyU0dRWVM1ZW5m?=
 =?utf-8?B?emt0YThDbnB2RzhFc29qYzZSTXFCWUZmOEdSSTFBN1RUS1Z5cXlFQ3l4bitR?=
 =?utf-8?Q?GhrgRkUizgRqlHH9GAoapkpwmIx2cwR1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGlyTHRFZ3FXK2dJMGtKa21QQU0yR0l5ODBGa0ltT01vNEVLWmc0S1pjVWw5?=
 =?utf-8?B?KytxcWV1QUpmOUtsVm9RUzY1bTdPTDFTQmtoNnRkTmdIczBDd1RtMkU1elQy?=
 =?utf-8?B?eUxzbkwyb1J0YnlFd2l3NmhMNjZyRmE4MDlCcjlSdlVnbXRhRnQzVnFrV0pD?=
 =?utf-8?B?WUV2WkJrUEFNa3VpTEFETnpSTXhFdHZGUTFlU2VRZG04NzVyVnI3clJrSWRz?=
 =?utf-8?B?c2t1V3dQYVdHcytiY3l5bzRIODludm5WTE1Mblh5bll4dmk3djFLd3NmZkZW?=
 =?utf-8?B?R2gxWldVTGJ0cmVIc1ZldXlPV0VEM3FhdW9weFdSSFR2Zlc1VUh5WkNxMWd3?=
 =?utf-8?B?YkR0bms4ckFpTG9jNmVVOXIzLzlDanFFbVpXSXZxdWR4OEkxSDljTzFkUjJw?=
 =?utf-8?B?QWpaUmY3UTRZQUpINngzdGxXUHBOYjA4U1pHUUFOZUJRZ2FWTVo0WHJSTlNa?=
 =?utf-8?B?MFBZOS9VZk11OVRRL3VPS0hCU3Y1V09hMXB5aGZ4TG5sSW94OEtZSmttaWVK?=
 =?utf-8?B?WjhmQVhxU0VNYzAzQlpnamozVHgyRzB5bCsyTEVKMGhqZC9TanIzdEQwYkxP?=
 =?utf-8?B?TmFRcVlxMHp4clRXZ3pjWFRCT1VncUp2M2gvUXFXbGYvNEdXR1c0bzFOZEVD?=
 =?utf-8?B?ZkdPZWVIMHdodmd6U3dXcXQ3RGc1WHJTUHI3M2JuRjJlMmJvR28vTzNTeXBk?=
 =?utf-8?B?am05SExLdElEUFlhS2ZTSHI1dENQUGFod0J0am50SGY2b0FIbXI1N2JqSENV?=
 =?utf-8?B?VUhCb3luVVgyQ2I0VUxxVmFCblNJbTdDUHlvRUV3VnU3dXNBNDJTUEVtbm1i?=
 =?utf-8?B?M1RJZ01FNVBJQm9WczJvcFFkV3VlQXgvNlBOOFIvZ3VSS2dlNWZWVXd0OHBI?=
 =?utf-8?B?eFVtZ2VvNmhKajBuU0dsay83NlFpTEdaUXNxUjlyZ1VTcHRRTDQ1RlA5YlBr?=
 =?utf-8?B?NHBBd0o3bG9ERmNET2VCcm00Z29kTUkzZ3BxcjgxcHdIUGRvSW5nSjlpMDZD?=
 =?utf-8?B?SkhaaXVXMjNmV1k1YVlxUlVLZ3pRdVlaaFl5QTdSaVU1Y1NXbzlkK3AvQXNq?=
 =?utf-8?B?NDlpdU5RQ1N3Mlg1Q0d1elF6R0p2Q1Yvc0xqK2Rxd0wxS0JEWE9OSi9rN1RH?=
 =?utf-8?B?WjJuNzJIcXFyNUsvc1pQV2hkK2R3eDdWbEtvQnBWellpUnR0SVhjUmo3RWZW?=
 =?utf-8?B?ZUdpU1liSjh0NkZ0STJ0K0w0WXJSZmp5VklXMFNaMzF3Q0RaNjAvRFhlRkV2?=
 =?utf-8?B?cERJT005VERkOVFqZExtaXFXc29iVjN6dk5wTW5uL0NFeGVyVitTbnZFMFdJ?=
 =?utf-8?B?dGhJKzZCSXZTYW1nQ1pHMm0yblNrNWVtbTJweEJyOUVTdVVJK3ExM2htMlN5?=
 =?utf-8?B?QlIxMkNHejVFTkJxd2JRYzVvK1hLWElUcWNUdnVPWC8wRHk3cVJodFRacE9Q?=
 =?utf-8?B?OGpiMEtLZGt6MG43QkpGT1l2T3Mzd1UyZ3lveVFIS0VONmxFUm52VHNibmR5?=
 =?utf-8?B?NzlxQ29CYWkySmlXNDRpK1ZqZ3EwQ1FyMUh2YzduWFJ3MEsxcEJ1MGZCYVpG?=
 =?utf-8?B?bzBuS0o3a3RteVkxL1FrYVl2ejRyV2FyaXorR0ExZkJLL3FTTE5hQ2FXTkdQ?=
 =?utf-8?B?czhnWkZPNlcyRnhQVy9oZmxrUXNVdzdPK3RRcTB4QWllNnhLUm5wOGFaOXBT?=
 =?utf-8?B?aGhBMW93SlpDM0h6UFlvUm5vZ3VrZGdrMkR2MmRQQmdFdGU2WlhXTzdKM0Fv?=
 =?utf-8?B?clpyUHdTZ3J2anljVnZHeVhpOXphdTBmc016Z2JWQnFVVTlLOGNnVUtFSW5D?=
 =?utf-8?B?amJJQy80dVNKRVFGZld4OGlzV25mbjRoMUdQMGhJbkZVczVnd1JiMy9JK0NM?=
 =?utf-8?B?OGR4TTNPenFXOThXQVA4Qm1EYzJGbmRyL1R1aEFXczVTTzA1NTJkVkh5Ry9B?=
 =?utf-8?B?aW84cFhjYWcwMG1waWthMDBnTEhjVDBoNHk1UFdwRnR6eVh4VDJjMnZuRWYz?=
 =?utf-8?B?WE1UQytsb3MwWFhhc3c5Umk3QzQzUFBpTjIvZitIcUNPZ2FBa2kwNkRCZ2ZC?=
 =?utf-8?B?NEZaY3JvREsvOFhoK2tsdEVxYllwaVYydHpJQllOZTg5SlhQdDBhNUl0d25s?=
 =?utf-8?B?cnFLRXJPcDJ5cW9TTGNDbXNkTUtZMGNyWlk0b2g3TU9uZjlzVzhRVFN4bCtw?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e1a399-7461-4a46-e77f-08de340fe716
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:06:44.3657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cr0qiwmRgqxBI5lMz+DZG8Rgd6GN7k+wbdye2lGPLfvEEtIxQy4+c1rElrlURTHgUT3LNWOIR558Jji84wxBxxMD/3NNLzaIZqx9lG5ZY54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7677

On 05/12/2025 7:48 am, Jan Beulich wrote:
> On 03.12.2025 14:32, Andrew Cooper wrote:
>> __ASSEMBLER__ is how GCC and Clang spell this, removing the need to set it up
>> manually in AFLAGS.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> While I fear this might end up biting us significantly on certain backports,
> still:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.  What problem do you see with backporting?

#ifdef __ASSEMBLER__ will work perfectly well in older trees which also
still have __ASSEMBLY__

~Andrew

