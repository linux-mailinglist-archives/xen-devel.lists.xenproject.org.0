Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E1BC9F166
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 14:13:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176748.1501225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQmfF-0001HS-Kj; Wed, 03 Dec 2025 13:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176748.1501225; Wed, 03 Dec 2025 13:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQmfF-0001Fg-Gg; Wed, 03 Dec 2025 13:13:01 +0000
Received: by outflank-mailman (input) for mailman id 1176748;
 Wed, 03 Dec 2025 13:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh3s=6J=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vQmfD-0001FT-Ma
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 13:12:59 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c858db66-d049-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 14:12:57 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5513.namprd03.prod.outlook.com (2603:10b6:806:b8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 13:12:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:12:42 +0000
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
X-Inumbo-ID: c858db66-d049-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcCbsyvQ66zMfgPVFal1g6PVmbxjUv27POWYGHfraFHjgEz+0lkZt26X6EwzBIARSROAW9V+TZle3ZtZxjgu3c0c8qO3GxJ7PIGBMJQcu7sbYGdhEPVMN0EV5b83zQf2A/GLek1tFfdqBYTN98K26FQWgMk06H7Qt3qpPR9EicriJlSHpQM3i/s2qxTBQzXmSDD3LFxe9oCMhB6gmw07UI9bIkl6A9kMACccNcmOpNZ5xhib0/DlgagIVnLszaRXL1DTaKWTkbegAohYqiwUsUCSFFD75T8P9PFVfVWZTV/+0W7MbajBw5nP54UkwCBYSwzTCN781P6p3EWG35eA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+pFcYOx6jvLy3jNC+FBASZLCEy2PfMCZvEsw1QfR+8=;
 b=OB4Mhz1JhtjoYNkn25YTUEAJTZmTntt8SkbJmVj20FU7X/PJhvMRvAm9i65cdrtDrVQ4sgaWfOawoDXCCynQJd/RNqb1f0U4Uq+oHYxOz2xSS8n9GThqPgDtZGjLaRi7WqlcNylWxHISCcmQwNcOxwHrf7YJ6MRRlWFSF2PhERMUW+aZRRzARWRaEwLpbLvjZ7LeYo5o/ZwJ33lwSJBNe8kI7556uMu9KGBH86mD+z+PYBuYmD4lxBm1MexUnVRjiU9+7ZTMIapBPjd5jsfbgw3fg5dgFxaCXaIEw/AwIdme3SkAEmL6RSfe/x6Mbll3ykWnRDWbsuaySgBZjPvyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+pFcYOx6jvLy3jNC+FBASZLCEy2PfMCZvEsw1QfR+8=;
 b=peiruNq4GvFDM9HFTUQVB/c5FzwiiedLzEJXL5lok6S7ELL2FDhHujI5eF0Il/F86wIJke4kWfyYw4PMfCp9Bna/faPihH1v543e7etlvS8wKabx/CRutFk4/ZHhl6y6VDxBKy7evXQkUOEpTUhodRq76oYqUqaf/QxL/l9RwBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b71fad57-ca46-40f4-a210-5f95b441f01d@citrix.com>
Date: Wed, 3 Dec 2025 13:12:38 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [XEN][PATCH] common/libfdt: optimize usage
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114180130.346755-1-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251114180130.346755-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0677.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5513:EE_
X-MS-Office365-Filtering-Correlation-Id: 4058e1f4-13a5-47bb-2c44-08de326da463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzREYXdmZ0tTZmw0UlhCUDZjZXVrRnNmU3o5bE43bWV1ZjNlck94dHI1STRZ?=
 =?utf-8?B?aUZOSWQza3lzclh6RHFsdmlNVldKcWtzWnF0NkdQMjBHNEllQVdpNzkvSTVm?=
 =?utf-8?B?WTdtQ1h0d05CYnVITHBLV1N0OFlrTDJ6M000WjFwTjZWZDFqTmYvRzFCbDNY?=
 =?utf-8?B?UHhncVFuSXVDMkYvSTFmWm5PaTl0Yzl1ckhacjU3cjNZM01xR21UaU8vMEVB?=
 =?utf-8?B?dis2WkE1cmIzWVFMRGlEMDl6ekxSU0RXVEJET1pMMVRuSDFLNVE4VUswMlVs?=
 =?utf-8?B?UUNNWVdiN2VrYTA4aExIS2hkYWkzZC9vMkIxV00yaWJ4NTVPeWZkRjQ3ZFdB?=
 =?utf-8?B?QjJYdWJFN3p4bURlOXNPcVpDb0tXU1g0OXE5WGZ2MlhYb1QySm9oTmQ3NWlx?=
 =?utf-8?B?UldMUjN1SUVTcWVvcmVQQUMvVk1mMkNTMzUvMzJWRDNYSEdBZUJzTThhUW1q?=
 =?utf-8?B?bHdrMENucVFVQ1ZrQkpoWm9BYXZ6K0dIQkdBWjN4dmVMaFRyYTYxK2VlZ25Z?=
 =?utf-8?B?eGVTczJmSjB4Wk9Hb3RwY01WcmMrT0VaMlhHbHZNZXRHeVp1L1k0a2FuUVAx?=
 =?utf-8?B?Z0w3WTRsWmRmYzV3WGdPRlo0a0FFSkR6VHNUbFhTTFJmaXg4NU5PRlUvZWxo?=
 =?utf-8?B?MTd0MCs4a2luUUhXZ2dSSEh5Q1ZxMG93dEZxNjJ3ZTcrLyt5U29FSlViai84?=
 =?utf-8?B?SVk5cXBueUJmb0lYQXFVK1FMZVBhTGd3OHExU0FKY3NBMmttYWNIOTBOUzV5?=
 =?utf-8?B?WnJxcElNcDVodVpvQUxWRzAraXQyMGxwbmhMUU40OEZpalhEVEVHeEFKOThT?=
 =?utf-8?B?a2ltcU1HL0hjazJxZUxSTUQ4RmNCeFpJZTJ0MGZCbjlYcmtIa0doTExrVlRR?=
 =?utf-8?B?RDhWNGVCS3p1c1ZxbzRSWDBKUXZLVGlWSy9JZE85TkdXdTV6akczczRlN0hX?=
 =?utf-8?B?TFVOMVJvNGtYY1BSajc0dHFiYTBIcG04RXhlU1pZL1FMU3RBdkN4cUlGU3lE?=
 =?utf-8?B?OWlvY2JCZ2RGTGpVRStVbjY1ZWw2Q09JU21XaUw4aXJVZndXMmdKOTVIWmp5?=
 =?utf-8?B?aStBaW15VmJLZ0xOc3BIVFZ1NUJzTHc1akJWSXlwWE9IZXpYemRUdUl4MXd0?=
 =?utf-8?B?dWl0ZnF1NnI3dUgwcmw5blF6RUxrQTFobjJWeXlPdlBSdm14TmJ2WGtCeHNq?=
 =?utf-8?B?OUpHOE01aEMyRnl2R2dQanhoUnRqakIzaytnMFhEd092b3pLNExQYnVLd1Zo?=
 =?utf-8?B?UDNua3FlOVhnZjYzVFE0UEJRWGJLZ0JIZE9JQnVzQzdJcS83Qjhoem1IR0kx?=
 =?utf-8?B?Z1cyTlJGRHE1RHlQSVdRSDRScmZyc0NOdllBQVZQRkgyMWY1K08rUUM4Qlh4?=
 =?utf-8?B?eHppazFxZEpyWDExZFJoSitwdW1DUE8xV2RGMXB6Yk1FSEd2dzRKV0FxMzNH?=
 =?utf-8?B?UEV4SzBOa21NODJXMFVxamJHVFlQSkxiNGU2eWRycVNPOWw3SmNBVkZGOE41?=
 =?utf-8?B?TW9WemNtdHJvL0pHNTZxSG9ERTVrZmlReTFMNTJZTWhXeUFHYzROdnV4MFI5?=
 =?utf-8?B?NFB3NFBGNE9CTm51N3FLRjRBVURHQlBMeU0rTEY2YzFWNmozZGp2MlVPQ3JF?=
 =?utf-8?B?UlJQNTBOM0ppLzJ0TGVBLzBKM2FFbjB0eGlNSkZlS0JKWllEN2dsZTkzSEZx?=
 =?utf-8?B?M21GWWtjemFWb0hEaDVpanVIT2xhT1RhVGtYTlQwbGN6NWhtV241SHJLRXFT?=
 =?utf-8?B?bUNWdFVOZStGYmdDamRiSEVOb2MzU29BMjR1Zy9ZMThEb213SHI3NkFraitI?=
 =?utf-8?B?eHVybGNJMjh4VFZMcUh6WG9tcEl3VFA3YXVOdjBXR1IzWWloVkN3NHR6WkRY?=
 =?utf-8?B?QXlDdGhqSTBVNEtrQmVHYWNZK2N1RVhERGRPb3BsbVdSdW10dmwvOXhmVlQx?=
 =?utf-8?Q?aj28OEvsNwnCCliAFbmnaQ1plH5sN0Cr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjdmbjJtL0JqVVFMTmRyUy93M1l0K2NyTmVTYVF3aEFMekMzMlpyTjNhbTM4?=
 =?utf-8?B?VmxvNGhkNU9pWGF1eXJPd1l0Z2ZRMmdMS0c2UjBubG02LzVLT1hXL1R4YXo3?=
 =?utf-8?B?ZVFoMjVLdlliMVBZV0liQVJmaVYwalMyRmhjYjFVWThlalpCeXprUDcvMDdX?=
 =?utf-8?B?YzlXYVBxcGU3NnNicE1NaHlpcW0rWVdtak52bjI5RjRsK0MzTVlqNjdxTWpC?=
 =?utf-8?B?KzZhMTdYVUwrRmttT3lMbkh1UFRQbkdsTjdVZlJuc1NwR3h6SEhYZ21ONVV2?=
 =?utf-8?B?Q05nNWhRZmtESlVXNHViTlFmM1hRU0tadnFWNlZBRHBzUEk4MFRZYmZaRDIy?=
 =?utf-8?B?UmpyRS9Hd1lhVWtoY01xdGQwZzFON1J4UFJFclh3dDBwcEZRSVFFMUk4bWZ0?=
 =?utf-8?B?Y08wVzZob001bVVTTFZrQU1LZzg2SUhMV01TUUViZTY1WXl5aUtpNzZoQVlK?=
 =?utf-8?B?NUNhcVVMOFcxTEJkaXNJVkFOWU1nekg3S041a0dyWm1peFpTODRzWk1FWXFG?=
 =?utf-8?B?RmxzYURTd2ZHZm9xenZpdUVpeEsrdDg2YkJ3bG0zY1pjVFE4d3BlNkNmK0pQ?=
 =?utf-8?B?SWxnR2h6bk1OQkQ1b2lTelRIWUU0WU1ybitlTHA4d054c1ptc2IyaUQwQUJE?=
 =?utf-8?B?ZGZqbkFzcEs0UDFEcEdIdU9lVzNvQThncHJXQmh0REhMa1hMYnBsbDhTSEJP?=
 =?utf-8?B?dTNnMmVzYzRiUWxYUUxTMWkwRWxNNXZJNnNYRUpjN1oxcDNObWpqSXAwbTJE?=
 =?utf-8?B?ZG1RbkdNUGNsRVo5Y2F3Qzg5KzBkUW50WkVaN2IvNnpLYmRxRGtGMWVJSzJV?=
 =?utf-8?B?TWhZT1A1OHFQcm5uYXNFWDhhMDFBZXdudzBNeEhyN0FDNW5BeEFnYnViMGZo?=
 =?utf-8?B?cEtuZkptbUJxYmJTT05CaDJ3Q3VxcTFwTVpMYTdGbWk5M0ViSlQ2UEJySGlh?=
 =?utf-8?B?RDg5ZjBqcXJKWDRVdXZHczB0djI1R1NjY29EWHlXMnhSSkFWd2VBS1NDdU90?=
 =?utf-8?B?VkdTNkpOWmhBamxLbU4xb0tEeS9DVmpBQ3dQbXVOaUJLRXZiMHVSemdnVGRr?=
 =?utf-8?B?QXk4Slk3bVBqcGp5bXd4amZFUTdSaUtXdjRwc3o2bXJHRjdRelN3Mmd1TDY3?=
 =?utf-8?B?QUsxem5qQXpsUyszRHhsbDZtVkJrazlpbDM0ditsOWh1QkxvN01ZejBORm1X?=
 =?utf-8?B?WHJKbUJ3aFl6aDdDOEc0aksvRTlIa1hIbkt6STAydEpaS1N1WEZ5czJzY3l1?=
 =?utf-8?B?SG16K1gvWGpEeHNQNlRTYmxVczljSG9mVXJXdkl0ZWtiRHk1R0E1dHo3MDk3?=
 =?utf-8?B?RDN0V0NvUlNDcGc2VFpxc1hSaTZvR3ZGN2dRUHg3WEY0by9DZlBHc0hkK2Jy?=
 =?utf-8?B?WC9QNUlVTW1MU2VxQ2Q3TUlLdVpVcEFLVGUyUXAwUlhSTjFVdTM2YkoydHdh?=
 =?utf-8?B?bGQ1OG9DQ2tlRG5CdGhab3Y5OG5XMWhhenlNZzdGdGJLc3l5VGw2bDJhTnls?=
 =?utf-8?B?Q0dvVFVzN1Z6eWhOOWgwZ2dyd2NXazlmaW5KRjJtZndxR2xQTFVVREM0Q3d0?=
 =?utf-8?B?akZ4WG00aGRqSFFiY0k3S2c2dmZZTmtzcGZ4UnE4cERscGlpV1BxTStpRDlE?=
 =?utf-8?B?NHY3TVNjVlFnNnFzTmVta2J1dkluSHppWSs2MnZMNmRQaEFDVWJGRndkY1NS?=
 =?utf-8?B?KytTWmUxNWdxQmhOYy83UVlIN2svaFh3WSsxc2V0ci9GOXdzRlovaURtaEd2?=
 =?utf-8?B?RWhLSHdJNXBCTDNNb0pTTDN6UDUxZ3NHS2R4UWxRemU5RFRiRzk2SC95Y0VR?=
 =?utf-8?B?dHNrTTh6ZHBoTnBFQnhsaDdhTCtueHg0c2xMZm5PcW1rSUo5OUF3SHhhRUlL?=
 =?utf-8?B?YjBoTUd4cWxCRE1JM3lSTEtKd1NXTFROY3VXTXN1OXFaTmNvc1VCcDNZQ2kz?=
 =?utf-8?B?alRTTUpTRUdQSXpGUTM1Qk54R3Q2aDEwL3hyMldjcmUyU0tRblBXcWtsbVdn?=
 =?utf-8?B?Q3hFTVBQeXp2bVRVY2dIem9LS3BwaXRHdE4wTWZwWkFDSDViNVJjN3g3djRJ?=
 =?utf-8?B?eVVjTGFrNGtYck1MdDJCaHpkQnBvRU5IOVlSaTVLVjZleWM5QU92eE9nKzV6?=
 =?utf-8?B?anhmZVlBVVNaWmNvaXdiN1ljRlhtem9ZUW9mMENQaU1wYUROODRERytpbXNJ?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4058e1f4-13a5-47bb-2c44-08de326da463
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:12:42.4786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOpgQ6bn39tSFkHlyq/CQpERh8htyM4B3NwK1iAV5Qa5qGrr2F5gOQqlxAMkECpWh69osgezcK7YEQlY7xKVSpCae2AZMsQLbrtP6qUn3Wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5513

On 14/11/2025 6:01 pm, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Now all libfdt features are built-it unconditionally, but...
>
> X86: The libfdt is used on x86 only to parse Hyperlaunch/dom0less Xen
> nodes, so full libfdt is not needed in this case and minimal, RO
> configuration can be used.
>
> ARM - situation is more complicated:
> 1) ARM reads Host DT (fdt.c RO)
> 2) ARM reads passthrough DT (RO)
> 3) ARM generates dom0/hwdom DT from Host DT (there is a mix of WIP and SW APIs)
> 4) ARM generates domU DT (there is a mix of WIP and SW APIs)
> 4) With EFI enabled - ARM needs RW API and fdt_empty_tree
> 5) With CONFIG_OVERLAY_DTB - ARM needs RW and fdt_overlay API
>
> Hence, add possibility for optimizing libfdt usage by introducing separate
> Kconfig options for each libfdt feature and select them where needed.
>
> Following libfdt modules are not used after this change:
>  Makefile.libfdt
>  fdt_addresses.c
>  fdt_strerror.c
>  fdt_check.c
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> Not sure about using DOMAIN_BUILD_HELPERS for selecting 
> LIBFDT features, as DOMAIN_BUILD_HELPERS doesn't exactly
> says that domain's DT will be generated when selected.
>
>  xen/arch/arm/Kconfig       |  4 ++++
>  xen/common/Kconfig         |  4 ++++
>  xen/common/libfdt/Kconfig  | 14 ++++++++++++++
>  xen/common/libfdt/Makefile | 12 +++++++++---
>  4 files changed, 31 insertions(+), 3 deletions(-)
>  create mode 100644 xen/common/libfdt/Kconfig
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index cf6af68299f6..f10cd3d7effc 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -111,6 +111,8 @@ config ARM_EFI
>  	bool "UEFI boot service support"
>  	depends on ARM_64 && !MPU
>  	default y
> +	select LIBFDT_RW
> +	select LIBFDT_EMPTY_TREE
>  	help
>  	  This option provides support for boot services through
>  	  UEFI firmware. A UEFI stub is provided to allow Xen to
> @@ -149,6 +151,8 @@ config HAS_ITS
>  config OVERLAY_DTB
>  	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on SYSCTL
> +	select LIBFDT_RW
> +	select LIBFDT_OVERLAY
>  	help
>  	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
>  
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 401d5046f6f5..256aff269c3b 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -28,6 +28,8 @@ config DOM0LESS_BOOT
>  
>  config DOMAIN_BUILD_HELPERS
>  	bool
> +	select LIBFDT_WIP
> +	select LIBFDT_SW
>  
>  config GRANT_TABLE
>  	bool "Grant table support" if EXPERT
> @@ -680,4 +682,6 @@ config PM_STATS
>  	  Enable collection of performance management statistics to aid in
>  	  analyzing and tuning power/performance characteristics of the system
>  
> +source "common/libfdt/Kconfig"
> +
>  endmenu
> diff --git a/xen/common/libfdt/Kconfig b/xen/common/libfdt/Kconfig
> new file mode 100644
> index 000000000000..3abd904b2969
> --- /dev/null
> +++ b/xen/common/libfdt/Kconfig
> @@ -0,0 +1,14 @@
> +config LIBFDT_WIP
> +	bool
> +
> +config LIBFDT_SW
> +    bool
> +
> +config LIBFDT_RW
> +    bool
> +
> +config LIBFDT_EMPTY_TREE
> +    bool
> +
> +config LIBFDT_OVERLAY
> +    bool
> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
> index 6ce679f98f47..c832d1849a5c 100644
> --- a/xen/common/libfdt/Makefile
> +++ b/xen/common/libfdt/Makefile
> @@ -1,7 +1,13 @@
> -include $(src)/Makefile.libfdt
>  
>  SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>  
> +obj-libfdt-y := fdt.o fdt_ro.o
> +obj-libfdt-$(CONFIG_LIBFDT_WIP) += fdt_wip.o
> +obj-libfdt-$(CONFIG_LIBFDT_SW) += fdt_sw.o
> +obj-libfdt-$(CONFIG_LIBFDT_RW) += fdt_rw.o
> +obj-libfdt-$(CONFIG_LIBFDT_EMPTY_TREE) += fdt_empty_tree.o
> +obj-libfdt-$(CONFIG_LIBFDT_OVERLAY) += fdt_overlay.o
> +
>  # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
>  ifneq ($(CONFIG_OVERLAY_DTB),y)
>  OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
> @@ -15,7 +21,7 @@ CFLAGS-y += -I$(srctree)/include/xen/libfdt/
>  $(obj)/libfdt.o: $(obj)/libfdt-temp.o FORCE
>  	$(call if_changed,objcopy)
>  
> -$(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(LIBFDT_OBJS)) FORCE
> +$(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(obj-libfdt-y)) FORCE
>  	$(call if_changed,ld)
>  
> -targets += libfdt-temp.o $(LIBFDT_OBJS)
> +targets += libfdt-temp.o $(obj-libfdt-y)

Pulling together several aspects.

Now that we have xen/lib, library stuff should be in it, including this
libfdt.  I suggest moving it to xen/lib/fdt.

The build system problems are created by using non-standard rules to
bodge the init-ness.  For livepatches, we have `init_or_livepatch` as
friends to do conditional init-ness.  I'd suggest a similar approach here.

You might want a prompt-less CONFIG_LIBFDT_NONINIT which can be selected
by CONFIG_DTB_OVERLAY, because that's going to be better than trying to
make an implication directly about DTB_OVERLAY.


As to other issues hinted at:

* Init coverage.  The only reason we don't have init coverage is because
of the overly-restrictive SPECIAL_DATA_SECTIONS check, and while it
serves a purpose, it does a lot of harm too.  It should be disabled by
things like CONFIG_COVERAGE so that we can retrieve coverage of boot
time paths, and because data placement is not interesting for these
types of builds.

* -f{function,data}-sections and --gc-sections.  This gets dead
code/data elimination with better granularity than the translation unit,
and removes the need for interior ifdefary to achieve the same savings. 
We already have -f*-sections for livepatching, so this is really just
using --gc-sections and will probably net a good win in one fell swoop.

~Andrew

