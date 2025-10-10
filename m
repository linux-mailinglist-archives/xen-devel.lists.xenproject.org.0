Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63654BCDCCB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 17:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141253.1475798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7F2g-0002iJ-W2; Fri, 10 Oct 2025 15:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141253.1475798; Fri, 10 Oct 2025 15:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7F2g-0002gP-Sj; Fri, 10 Oct 2025 15:28:26 +0000
Received: by outflank-mailman (input) for mailman id 1141253;
 Fri, 10 Oct 2025 15:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vPy=4T=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v7F2f-0002gJ-KK
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 15:28:25 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1ae45c1-a5ed-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 17:28:23 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by MN2PR03MB5358.namprd03.prod.outlook.com (2603:10b6:208:1ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 15:28:20 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 15:28:19 +0000
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
X-Inumbo-ID: c1ae45c1-a5ed-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAhCLUSCBcwB9dGurkjZ13J+Sl/PTti7qJLK8PxQRl9cfTMWNQgwU8Eg5gRwTIOaeuJDeNz/9dJ51TbURLPWCJogLuweM35Y+a66UbbNLYPkwOQGvSMwh6mWnk8BOlv4fnwXQPY7TtcwtUdRwzyMEbx05+sYy7aTFvgAOFnfZDKIOXzBMyKH0sIlfnjqzY1kzjSULRtCeH71K4OXYqx9v1QNVdJBA1mqb3LCgZCLBWTzJBGaks4dg69721aG3gawWhUskw+gM3hQ9eSc/LURUynM8FPRiC6LGSHF+EDOrAeYXpDHrwfUCVjVNrWS2S9Xz0tRoEd73PSHfB45f7R4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+UdOyKUf753zj9Sp4iy1yJwvoCATUX+ffAq4+hFdGE=;
 b=t6WUw9GPWZkbLQHAJ3DPO0icS8i6Xr5AI5YCnAm4vW7N3q/j+sAR/n611uDI7sll2Enp+7Ba7uVk3Ft0bqxulSe/Qk1v2aSCIIU2Ocd7FzxQZwqKkWYpdNYBEobtOm4e3WL1MhObGgMD6i1ce3LF6VGqtA4oeSvzGru5TGs+RwP1H6hV5CA4zfnS47/sWJ6HJZWXdrg5/u+OpuBrCy4PjpmxfJSTPE3wAan44nk50VRIXUtER3oJqAH3J0uJSUx8CAwvzM3CLCzd3umc3Yk8pBV/wj6eclTtiLI8fftacgxFdXu3O5D5xqxKHcJNtCaEZ0Ntlgl6nXms+y8WXsL+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+UdOyKUf753zj9Sp4iy1yJwvoCATUX+ffAq4+hFdGE=;
 b=F+aBuY6+wX3x9uCd4aSsulSOKfUFfg0DQaKSdYtSoKHW/7TbRFh3GkQ1tiGyWFiwZvXFZ3psVhwRPZ2xc9KSxUPN8HwCwgZJyMkEoWUUzn7oIcjBqDacUOfiOFCEul8Im4nsQubTq0D8aSoTPVFjINm3UGZI8vr/h02J/wDp3lM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 10 Oct 2025 17:28:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Saman Dehghan <samaan.dehghan@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] Support LLVM raw profile versions 8, 9, and 10
Message-ID: <aOkmD59fmPu6l5Kw@Mac.lan>
References: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
 <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
X-ClientProxiedBy: MA3P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::17) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|MN2PR03MB5358:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e02080c-dca1-4631-e5cf-08de0811a419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjVrREhDbDJMd2VhZWxvVmNiR2RDOElhMG55TzF6bGRwZGl2Njhrb1FqTHVm?=
 =?utf-8?B?alVLamdXNGZiZTQrT1g3SUJlZGJIUmdqbWltMEMycTEyank3dC9jdEk3VVY3?=
 =?utf-8?B?SEtjb1lZSjVIQm8xZ3YwbUsvQnRuS3BFZjVQTmh1Y3FHUmk3Yi9yZ3RueTBG?=
 =?utf-8?B?bUhjMVFKMHo2RjFaNjhWbXNCVEZFcjNxek9TSnNFVStWcWFKZ3JmYk10S096?=
 =?utf-8?B?ZFdDbU1LWDM0dkxHL0IwT0ZydHp6K0NVejRia09WamxSNDZPVThOWmtrTnIv?=
 =?utf-8?B?QTAyUFNReXBUQ3JnWUMrOWxrSlZJRmhyOFhrRW9RRWpValF2TEdhY0F4dGdJ?=
 =?utf-8?B?ZHhQQ1VCWDZUTnBPZUd5QXhkYTRGSnM3QnNkdGpYTmJjT0RjNnh0bEF5M2dI?=
 =?utf-8?B?WUM1K2NrTGZTNk5FelZ4QXRmUDV6ZnFiSEtOdnJlZHVDSGxIeDNNdGl0SWFL?=
 =?utf-8?B?M3h3OTAyS1lWakhZL1lPWVJDM0tncjVCdG8yc2R0V2RkRi80M3ArOWd4WURm?=
 =?utf-8?B?bXRFZUhrTHpXZzBrdUxiQzJsenB3RURwTk1MWnNrV082NDQyczVMVXJGdjRZ?=
 =?utf-8?B?WVBMTC82N1ljMzRFUTJzdGxxbE1aZUZ4TEw4QlNiTlg2NUpZaEh2VmRPSHNV?=
 =?utf-8?B?dkt3WU4yUU92eXhycjlHazQrY2VxMDFFOW5qUG03SGVCYWRpWDNHK0dLb0xk?=
 =?utf-8?B?SVdjOFZpS21sdlBDd2NuRmM4alFGKzN2bGZ5Q2w0YnlwdHhMZjZrTjdnMzNH?=
 =?utf-8?B?SnYvcFdvVE1WZ3dvVU90OEZpZHZCdHdvZkNRYVBQM2I1WmlSNDNiWkV2OTN6?=
 =?utf-8?B?aHd4YkVpNDhtakJ3WTRXbGZpOVhZUEdEVEswUTFWVDIvZzFDOGJFcGd3S3da?=
 =?utf-8?B?cm9ERnFNWHZSWTBTcjRGcTgzOHNFdFQ0cU42ekM4THRBb2F0QlA1VzdJcVFq?=
 =?utf-8?B?dkdDNXR1c3p5SzQxRWExU0NYU3FwOHQrQWNMd0tWVXZ4alo1My9WRkdKeDRR?=
 =?utf-8?B?dHNGRnczR1JWQStFMHlwZ2FHZkMreC82TVJVcDZhQ2lMRCsydU9sRnhyQ2Nn?=
 =?utf-8?B?RWdLUGZaU05ub0pKTEgxWU1oT3dSZi9VOCs0eXJ4ekkzUW1EU0hxcXRTQUs5?=
 =?utf-8?B?UkRBK2k1dnJZZm1oSjdDcmdzTVpKNUVHb2I4eVNwbVcrSmV3TGduR05QOXpF?=
 =?utf-8?B?SnNhNzRoWkx1c24vd3hvQmdNaFYzT2xNMHluL2h1dVluUTh4ajZTZTRPWmVi?=
 =?utf-8?B?Q1FSdHREc2FtMG9YYjlsb2U3OG44RkxCM2dTOU5FcVJ2cVhuYWxpYUFob0Zp?=
 =?utf-8?B?M1V4OGkzVHZpak8xNFA3VnFpdkNjYkZ5WEdsZlQweVRiZFViZXBjRFYrTXFi?=
 =?utf-8?B?Yzg1N0o1Y2U4cmpHeGV0ZFlPSGwvMysxVEZVK2VBamx1Y3lDTDdLSkdXRzQ3?=
 =?utf-8?B?OG5OTTJDVkpUb3dOK0R3cG44SVR0c2lLVWw3ZnZEMjV5NXg2b21QRjJobHQ4?=
 =?utf-8?B?SU9Cb3BzUjArYUlSMjcwNXp5c1U4c2h3T05oc3NLeVpXMDV3K2V5a3hnODZh?=
 =?utf-8?B?ajNoU3pqNElFNFYzbkJHMDB3ZW4vMTR3S3hMTDZ2ZjNtV0tWT2E1OXF4L3BR?=
 =?utf-8?B?WjdEMklNc2dQWTZtMW5Pd0hsdWVheTZSYnRTK2JBWFJzVkw3ckFDNTNLaXpF?=
 =?utf-8?B?bXZBeURPQitOMHBWTHZMaE9IL1RtM2tzdUpLSTQ5d0xuK3g2RG14VTF5UEdT?=
 =?utf-8?B?amZVSUNhb3NZRU1WWU5mZE94L2VGZGtIVldZUVI5QzNwS2JlMXBZZC9lN2xt?=
 =?utf-8?B?R2ZLcXB2NWxuLzBScjRRdXJYMlM1VFJjc0FUZm92VkczQmgwaG1UNERiRlVk?=
 =?utf-8?B?TkZ6NFZmYy9GZDNaYWwzSTJleEhwY2FNSEUrKzFMTWpUUTBFeFNkRzJSNjlH?=
 =?utf-8?Q?Mk1jQYbVayEX5n2Wbp8FXXJo0Bs60P8e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dStwMGx5OW8rYjM1dGM4MmNZYXEvWUNyS3BaYTJSZjFTTFlkZGRUT0Vkc24z?=
 =?utf-8?B?cU5Tb3pYaFY5MWYxY2lycUR6YTdHTnJiT0JsNUZobjFyMy9sWXd5a204T1Nh?=
 =?utf-8?B?WnU5UXA3TUk5RU1rODJFZkZCVlZOazFOWCt3VzJMTzJaUStkZ2Eyc0pLR1lu?=
 =?utf-8?B?WDVaNUtiUElDN0xNTXlJcndhYzNNL1JHTHNJMGs4Z0xTaDZIR1hWckx2TGhM?=
 =?utf-8?B?ejBoNnROOEtWZVdaSE5CKzJKckUxaW1XdlFnK29uRUhaaGFIQVVSeUl2NHYr?=
 =?utf-8?B?NUdQeGVNVk5qdytUVWRQS0tVMFZRMFUxQms4YlJ6VjQwM2hrNVJIM0hCOUVK?=
 =?utf-8?B?OFFjOXZBalpKVExlRjFTdEVLbnRUcTh6d1JZNFk4YlV4KzNpdWVIRzU5dTFL?=
 =?utf-8?B?V2YrMU9sWlRhazNrR21TbXh3cThyTUFwTzNHV1draHZLc3FOeGZPQlBJNFc4?=
 =?utf-8?B?RytoUWUzYml6cVlwK01MWkZtVnZPZk5aMk42YUxiRUVBMm9ZeFVNazVqM2tw?=
 =?utf-8?B?dXdOZGk4SXdJcXFsZ0xRS1pGRjlNa2E0alphODB4VVJtVVNTaFJmejNrbmtn?=
 =?utf-8?B?a1BmR1VXWUg3bTBseGJFUk8xOUI3NGZJa01JUEJ0TVZKTTB5blkwZTBrVUFQ?=
 =?utf-8?B?UytmWXdTM2pmbDlMWUZrNjdsb1p6RkQrL2NMcm80MHF0UFYwbTFQYkJudmd0?=
 =?utf-8?B?bnRERWlqWTc2aGpLY1NWbFpMekZDMkd5VjY1Nk00NHNHWFZnQlFtNlluZEFi?=
 =?utf-8?B?SURIaDIyeHkzZnJRYUx0UUphbDdTT0w5aWprZGdkYWVjc3ArbWg3VjFCK09h?=
 =?utf-8?B?RExmc1lyOEZWbFV0bnc5SzBkQU1OYUEyVHh2ZXJsN0diNFZlR1hONFREck96?=
 =?utf-8?B?Ly9zOFJ2aUNBNlpCWjRqcEc1TytDZGRucDBPdExYQzVGT0pxU2F4MTAwMVVL?=
 =?utf-8?B?V0UyV3Zwd1JWc2R1UW9MbjRxMzBjb0wxaThRZFcvOExPM1NxbzhjcEQ5Z1J3?=
 =?utf-8?B?L3l0Mk40ajFGa3hkd1ZDV1ZCUlo1RnFIdE9VdlhKdUgrVTZHTUtmVXpqNjIv?=
 =?utf-8?B?SG9qbHN2WUlDTWo4WWlGSmQvcnFiWUNzTmxMSUo4TzROa2RsNTk1eEhaQ0ww?=
 =?utf-8?B?Y3U5NVZraTFiVmk1NXdlUHVzYWlpV3J3ZVN4TzNsdGNWVTBQZnlVeGNzVXRy?=
 =?utf-8?B?ZjJJeENQSXI2SnB5dFNvRXRiZ2ZpRlRHVkpJVlZPUGhEdFdIdzd2ZHJkQW1F?=
 =?utf-8?B?aWxldlcwSUtocks4N3ptNkNUYmV2RFdIcXh4MVpXWE9SOWVUV2hrb0RDajIr?=
 =?utf-8?B?WjFaODRvNnRoUktxU1JQa2lsN3lZZWZ6ZVdWYklXV0FWbFlsZE5KZ2NBdDRD?=
 =?utf-8?B?WTZOcjNlQXdDcXFlN0tEaEk3QlhrVjNiS09OVHlCYVpwV2w4dWIrcEswemJq?=
 =?utf-8?B?K1dhNjNDTU5LL29pZGpSbGZNaFhkZDk5NG1DbkI0MXIvRms5KzF1RkVVOTRy?=
 =?utf-8?B?TlY1dkpEbi9MRUMwUldrVm9aWWVjOUlabGhjY1ljVm5zTlJZWXp3dFBCSjVs?=
 =?utf-8?B?V3NuWUVKNUR5SXJJYUZvOWxQdkxJc3EyMm93OFpRT3lkMjNNOUtpUU5jVVcw?=
 =?utf-8?B?c1k0YW5MYXJLOHdRdVpwYThDNzYzSHkyaGhybFR5QWlHMzVjNnZaLzZjQ3dr?=
 =?utf-8?B?cStQMVkyOUgzeWdHL2QzRkN5TEt6TEUycXY2SzZBY0V4MTNQWGsySUtQLzNh?=
 =?utf-8?B?Q2tRMytZRFVRcEo1eEZlNVFaQlNPd0oyWk8xY09NMnkwb3ZxOWM2UndTVGZN?=
 =?utf-8?B?V0RFRThJVk05SUdCdmlhZjVpYU9mVW11bzBwb3NLZVVzeVJBZEc0cXJRNEJ1?=
 =?utf-8?B?QkhjQmFFSGhzcUpTcmJMTEdjbEtYL3gxdDN0OEd3bTM1TUZXbXc4V1Nra04z?=
 =?utf-8?B?YTdmZi9oYmg2MTlXOGo5MnFaNUtEMFBWSmxqL0NDcWczbzFRY3VvVjF3R2tJ?=
 =?utf-8?B?anlVNUxSTHRFSWhhSnRkNnJnbGdsbHJ6SnNTcUNFQUxOWlQwT24xRENpNTFx?=
 =?utf-8?B?alFpYTlCcGhWTTZHYUtXalZYOHlYUTBoZ29YRXc4Uk9ZbWxqeVQ5aXoyU1RU?=
 =?utf-8?Q?/DKZubd/LGuey1zVJZrWsmPSy?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e02080c-dca1-4631-e5cf-08de0811a419
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 15:28:19.8666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOZXwViAsz/k/MGjOtrV8T92HhfuSA9alXPUHRjfXYJF3ZyeOKJ9aPq28Rnd1VHQHCqtadqfXTQ7WE0CmRxBRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5358

On Wed, Oct 01, 2025 at 05:09:52PM -0500, Saman Dehghan wrote:
> This change enables compatibility for measuring code coverage
> with Clang versions 14 through 20 by supporting their
> respective raw profile formats.
> 
> 1- Add support for LLVM raw profile versions 8, 9, and 10
> 2- Initialized llvm_profile_header for all versions based on llvm source code in 
>    `compiler-rt/include/profile/InstrProfData.inc` for each version.
> 3- We tested this patch for all clang versions from 14 through 20 on both ARM and X86 platform
> 
> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> ---
>  xen/common/coverage/llvm.c | 78 +++++++++++++++++++++++++++-----------
>  xen/include/xen/types.h    |  1 +
>  2 files changed, 57 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
> index 517b2aa8c2..f92f10654c 100644
> --- a/xen/common/coverage/llvm.c
> +++ b/xen/common/coverage/llvm.c
> @@ -44,27 +44,55 @@
>      ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
>  #endif
>  
> -#define LLVM_PROFILE_VERSION    4
> +#if __clang_major__ >= 19
> +#define LLVM_PROFILE_VERSION    10
> +#define LLVM_PROFILE_NUM_KINDS  3
> +#elif __clang_major__ == 18
> +#define LLVM_PROFILE_VERSION    9
>  #define LLVM_PROFILE_NUM_KINDS  2
> +#elif __clang_major__ >= 14
> +#define LLVM_PROFILE_VERSION    8
> +#define LLVM_PROFILE_NUM_KINDS  2
> +#else
> +#error "Unsupported Clang version"

No strong opinion, but it would be nice if we could support all
profiles from clang >= 11, as that's the minimum stated clang version.
Again I don't know how much work this will involve, so not going to
insist.

It would be extremely helpful if clang could provide a set of builtin
functions for freestanding environments to handle the performance data
in an opaque way:

https://github.com/llvm/llvm-project/issues/123034

At a minimum it would be good if the compiler exported a define
signaling the profiling version it's using, as we could then fail the
build nicely if coverage support is enabled against a version of clang
we don't support.  Right now anything >= 19 will assume to be using
profiling version 10, but that will go stale sooner or later.

> +#endif
>  
>  struct llvm_profile_data {
>      uint64_t name_ref;
>      uint64_t function_hash;
> -    void *counter;
> -    void *function;
> -    void *values;
> +    intptr_t *relative_counter;
> +#if __clang_major__ >= 18
> +    intptr_t *relative_bitmap;
> +#endif

I would prefer if this was done based on LLVM_PROFILE_VERSION rather
than __clang_major__ (same for the instances below).  The field are
related to the profile version implemented by the compiler, so it's
clearer if the check is against the profile version.

> +    intptr_t *function;
> +    intptr_t *values;
>      uint32_t nr_counters;
>      uint16_t nr_value_sites[LLVM_PROFILE_NUM_KINDS];
> +#if __clang_major__ >= 18
> +    uint32_t numbitmap_bytes;
> +#endif
>  };
>  
>  struct llvm_profile_header {
>      uint64_t magic;
>      uint64_t version;
> -    uint64_t data_size;
> -    uint64_t counters_size;
> +    uint64_t binary_ids_size;
> +    uint64_t num_data;
> +    uint64_t padding_bytes_before_counters;
> +    uint64_t num_counters;
> +    uint64_t padding_bytes_after_counters;
> +    uint64_t num_bitmap_bytes;
> +    uint64_t padding_bytes_after_bitmap_bytes;
>      uint64_t names_size;
> +#if __clang_major__ >= 18
>      uint64_t counters_delta;
> +    uint64_t bitmap_delta;
> +#endif
>      uint64_t names_delta;
> +#if __clang_major__ >= 19
> +    uint64_t num_vtables;
> +    uint64_t vnames_size;
> +#endif
>      uint64_t value_kind_last;
>  };
>  
> @@ -76,19 +104,20 @@ struct llvm_profile_header {
>   */
>  int __llvm_profile_runtime;
>  
> -extern const struct llvm_profile_data __start___llvm_prf_data[];
> -extern const struct llvm_profile_data __stop___llvm_prf_data[];
> -extern const char __start___llvm_prf_names[];
> -extern const char __stop___llvm_prf_names[];
> -extern uint64_t __start___llvm_prf_cnts[];
> -extern uint64_t __stop___llvm_prf_cnts[];
> +extern char __start___llvm_prf_data[];
> +extern char __stop___llvm_prf_data[];
> +extern char __start___llvm_prf_names[];
> +extern char __stop___llvm_prf_names[];
> +extern char __start___llvm_prf_cnts[];
> +extern char __stop___llvm_prf_cnts[];

What's the point of defining those uniformly as char instead of the
more accurate types used previously?

> +#define START_DATA      ((const char *)__start___llvm_prf_data)
> +#define END_DATA        ((const char *)__stop___llvm_prf_data)
> +#define START_NAMES     ((const char *)__start___llvm_prf_names)
> +#define END_NAMES       ((const char *)__stop___llvm_prf_names)
> +#define START_COUNTERS  ((char *)__start___llvm_prf_cnts)
> +#define END_COUNTERS    ((char *)__stop___llvm_prf_cnts)
>  
> -#define START_DATA      ((const void *)__start___llvm_prf_data)
> -#define END_DATA        ((const void *)__stop___llvm_prf_data)
> -#define START_NAMES     ((const void *)__start___llvm_prf_names)
> -#define END_NAMES       ((const void *)__stop___llvm_prf_names)
> -#define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
> -#define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)

Kind of similar question here, what's the benefit of using char *
instead of void *?

>  static void cf_check reset_counters(void)
>  {
> @@ -107,10 +136,15 @@ static int cf_check dump(
>      struct llvm_profile_header header = {
>          .magic = LLVM_PROFILE_MAGIC,
>          .version = LLVM_PROFILE_VERSION,
> -        .data_size = (END_DATA - START_DATA) / sizeof(struct llvm_profile_data),
> -        .counters_size = (END_COUNTERS - START_COUNTERS) / sizeof(uint64_t),
> -        .names_size = END_NAMES - START_NAMES,
> -        .counters_delta = (uintptr_t)START_COUNTERS,
> +        .binary_ids_size = 0,

We don't usually explicitly initialize fields to 0, as that's the
default already.

> +        .num_data = (((intptr_t)END_DATA + sizeof(struct llvm_profile_data) - 1)
> +                - (intptr_t)START_DATA) / sizeof(struct llvm_profile_data),
> +        .padding_bytes_before_counters = 0,
> +        .num_counters = (((intptr_t)END_COUNTERS + sizeof(uint64_t) - 1)
> +                - (intptr_t)START_COUNTERS) / sizeof(uint64_t),
> +        .padding_bytes_after_counters = 0,
> +        .names_size = (END_NAMES - START_NAMES) * sizeof(char),
> +        .counters_delta = (uintptr_t)START_COUNTERS - (uintptr_t)START_DATA,

The casting here seems not uniform.  Why is intptr_t used in some
instances while others use uintptr_t?

I also think you could just use void *, as Xen uses the GCC extension
that allows arithmetic on void pointers.

Thanks, Roger.

