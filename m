Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77502C0D581
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 12:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151543.1482084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDLrW-0006Zo-Kv; Mon, 27 Oct 2025 11:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151543.1482084; Mon, 27 Oct 2025 11:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDLrW-0006XB-H0; Mon, 27 Oct 2025 11:58:10 +0000
Received: by outflank-mailman (input) for mailman id 1151543;
 Mon, 27 Oct 2025 11:58:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e0hQ=5E=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vDLrU-0006WO-Jv
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 11:58:08 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 308da27e-b32c-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 12:58:03 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by IA3PR03MB8023.namprd03.prod.outlook.com (2603:10b6:208:509::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 11:58:00 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 11:57:59 +0000
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
X-Inumbo-ID: 308da27e-b32c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoN3w+I7qTmT9O2taSeeF9wmFxI2b+tRV2ucpZKdATliwB6F/jXZzA2hy4j9H3JTKtu8uifCMnJYVMKOvTDQxyPI8y9TmxPdY0mRLyo2vgIvjIJ3FX3fYW80eAM4/2/MHm/6xuSoFBTeS3LrDNzIAWiZgQhjpUM2uIt+eIze94BCcJPreAyAviRJHV/Q9/aDLhsEkreTl32tqGvR/iFWb/+IB1G/5N+EnILGC2rXdJFzJUX2k8fJ946Lexzdi2QxOvKn4YSd/V6sznf7uvIj53dt+BXLdT1uA1mylPE0J4h140qKH1iyjDCSgF9ptDFf1HbdU9EhJJfzZK6xRskJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOtTMIADFGG3siFQlDAHSKDRs+JGGbR4zupmQ7zpFwo=;
 b=TXDZgLA1XQUX25gj69lPZljvkEm4s96sga7gWn4IM4QrUQTqQGABrmRF4+ZcXJUGToBXT5Ztz4medzFp0xFfoF6Cwy7fVGq1Cv44T2Qbb09IG++RrdwnGI+VRDzkFg1CG4Qke/t99GR4+TG5i+K2nw6H/+eMsJagW30Ax/P6bbA3fE9xFS/QwWTVf0RGrBgqk3QX4/6gc27mCUCp0kKjqPGZ8eJaQnaw/fO0qtKV5wPl/MCzDvUVNKdZ+Yio+ULDakpQZ7gpLaIWCy4RBbFf7dmKALDetvVu/MKkfbd1QrbxTO2f0XxXgSWPVmry6iO06XMyVRa61Ye7ZIc7+s71lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOtTMIADFGG3siFQlDAHSKDRs+JGGbR4zupmQ7zpFwo=;
 b=AX/b6UVEmGhLi02EO2rvmxDhjiX6I4GBA0jY2iVRc6HCpbWUwBXp4jKuYbo+wWIF559HDAaqrKLA2HP05nXMyYTz2903pBabazC8NUnSK1Dk5Tijpakk7G+NtSfcIwGCxj31ChBET54jMrExYy7wyKgCG++MOp9OCnD2iJ76eFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Oct 2025 12:57:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
Message-ID: <aP9eRN6U0twYEein@Mac.lan>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
 <545d98e0-755d-471b-84c5-54f129a5aece@suse.com>
 <aPt-B5R-FwJpQbZR@Mac.lan>
 <6428217d-b5f6-4948-aff2-b007a6cfcfc0@suse.com>
 <aP9YkLo782XbfMQM@Mac.lan>
 <536c4e25-1e32-4adf-865d-7750f08a2922@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <536c4e25-1e32-4adf-865d-7750f08a2922@suse.com>
X-ClientProxiedBy: MA2P292CA0027.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::16)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|IA3PR03MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa5ecb4-7399-46f3-333d-08de1550133a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0p6YmY3Rkorczhlc00xU2s3NkZCaXpVcGlucHoxbkE1eXJDd284L3BxSWQz?=
 =?utf-8?B?WWtmclhBMDUvS3Y0L2FETG5TTHR4dlJnZVBEK0xrRmlKditKVVcwY1NQZy8z?=
 =?utf-8?B?MUpuUVgzY0I3U3F6NXk5c3M5VEt2UkRtZXd0SnFxalA2K0dJTjc2SFIybnht?=
 =?utf-8?B?VWFxOTZRK2hLNEI2MW1xU3RXck53U2thbzlmK0F0UHplVFh4OThwSVpZZWlw?=
 =?utf-8?B?OTZGV3YzMmVPZnRTNmVERS9lRUZYTnE5S3FuUDVwKzd4OWFqTHdmRmhBR2NX?=
 =?utf-8?B?N3FZL0xxaGJzeE50TWg1MzdDVFo2TEJjNXcrMnRQc0ZXejR1b1J6bWQzN0FX?=
 =?utf-8?B?Nkx5MmJCVXlzaC9uM1FkVW82UnhKU2p3UUhoN1BQRU1iVXVud0dITko2d29k?=
 =?utf-8?B?emxUZ0o0OEhqMUgvREoxZTZpWDhISng4b2NabCtCL3MwWjFxR0srSjNFNmtu?=
 =?utf-8?B?NkRjd1pzK3A1R3hQdlpTbFFFNzhHWDI1YlJqNHU1L3hUT0ZiMHhXTjBNcld4?=
 =?utf-8?B?dG9aMEhuYUZSRGltVUZhYllySm40bCtQckh6WnR0T3JDTkkvaVg2UytoSld5?=
 =?utf-8?B?d3d0UEVjaGtzMExOQXM3a0x2UFFycTAzS1B5LzRWeU9xQXNZZGhKdGh2ZnMw?=
 =?utf-8?B?VnZPbXV6V3RCamoyYmFJS0ZPendzYzVXcjhYWFdDMnJqN2dVZWU4Z016eFVF?=
 =?utf-8?B?T3Jqd294Y1lCUlZrL0RobXJnWEVhb3NHM2RlcklTY0RmbGo4dktERlZ0WlI4?=
 =?utf-8?B?Tlg2SkJqNFo0ekJCVlprMnA0N3QveWVMRjMvd0FrWS9RbmRzRVNpSHEzdldu?=
 =?utf-8?B?aDdONkt6d0RoVVZuR0FGWkFmaFlzazBFWUxlcDgxT01nZjhkb2xZWFpxOGVo?=
 =?utf-8?B?cEpVMjJrbG5OL25hVXFHQ1YxMkxHUjBEbk9GcUhHd0FIazQ5VkVjeTExbWNp?=
 =?utf-8?B?TUd1allrcUhZbEZiZ0Z4ZVc3eWtvbG5nNWFQSmJqV3E2NzF4VGs1SXVuWERj?=
 =?utf-8?B?NTVwU00zdTUzaVhzM0xOUGpXakc3V3kwZ2JIZng0UVRCNXJFaGhTN3VEVUY2?=
 =?utf-8?B?TTlWSnpvZm4wTFF4eVcrNFgvWS8zaWRjMzlBSHAxUktqcjBHVDRBazdtTWhw?=
 =?utf-8?B?bjVvSnpzTlJDdXNXVkE0QVpvM1RURFNCdjNiWERjYmdhU3E0OXhGK0FGM2ti?=
 =?utf-8?B?YkloTC9FeHlrbnEwR2tVdUdtekpoUGZEWHdlNTE4NEtSbVBrVUNlZSszUFpt?=
 =?utf-8?B?QzIrQ2pFajU1Uy9WR3ZlanQrWFo5Ums0NVJtWnFDa0M2RzN3eThvbkNVbzJH?=
 =?utf-8?B?cVhZSElVaW1NTFBBQkhLNzFpeVNsamdNcVZMSEQ0RnkwckxpY2ZSNStoV3FM?=
 =?utf-8?B?dkV0K25ocEo2QUdLUzR1MkhORVJPb2trZWNuNU1JTW5jSkRqVnhIWHUrTEQ4?=
 =?utf-8?B?cCthWWZKZEFiSGVibDIyTnZKYmJiY2pwQm45eUorWTI4d0ZLVDZaWmdnS2p1?=
 =?utf-8?B?eG9SWWd1OFZoc0NJeXJ5SDZSbE9IUnQ1VXFTZmNaak55enNneDRrU01UbnJV?=
 =?utf-8?B?VkNzUmhBWCs1SHQzT0VOUWsva1VpRlVVaUpKS0FoYis2MXhpbXdXVXU5VFZY?=
 =?utf-8?B?UGNOY3RaVHA3dXRidWc1eXpPQlhwSGZaUkMwOEJOd2plZURvVW1mWWVHaVUx?=
 =?utf-8?B?cWxBeXJvRFZxdkFzSm5PaWQ3bFR4U1A1UmJ0cDhlSDlhcGRVR1d4aHNkWWlq?=
 =?utf-8?B?eE42K3krQnJ4Q3draUo5NG9LcVBUMDc2SVFoMzNzTVdoM1A0RzdsQjRiSGdC?=
 =?utf-8?B?SmhoLzZ6WXEyZzFqYXdOZVV1cDVKUkVPOTR0cDJPcGlueXlxbHNBK2JCWDVV?=
 =?utf-8?B?ZlllcTFJM0V3WEIyTXgxRGRwbDNqSWw4N0QwTDB3dUhuWGljRmhyS3dXZkZo?=
 =?utf-8?Q?e3DLwW7bG6fJas8Nal+L5ZUD+QrrJ3zU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGZLSzJCU2lPVUozZDNiNCtnWmVmaStPSzJOcTlNOUxBUjFyQlp5RnRaS0RB?=
 =?utf-8?B?UXVrbncwN0FVZkZNSy8wT28vSzJOdmFRcC9qdkVkaU53MXVoU3BGSy9oTUNz?=
 =?utf-8?B?MHhMMzRDTE5wWTNaeE93WjV4ckZPR244SVlnSXNJdmdoL2tnejVvZFF1QUdK?=
 =?utf-8?B?UTdadDVwemg4aG9xTG5iSldYZDJSY253d0M3SHpWbXVTK3V5T1Uxc0RFZzl2?=
 =?utf-8?B?M0I1TEVySElpbHg3K2xTYUhvSjNObUpEdDVDNVR6WjJycno5NzRBNGUrc2ta?=
 =?utf-8?B?TDNpR3R0UnoyQnVtUmplQ0p0a1QyOHV1blhhdVBSa3hNMUF4a0trTUI0K3Ns?=
 =?utf-8?B?S2VER1hqa3FxelZiOFNicGFnMGswOXUwVDkzSTNmN0ZHRDduUkg5Z05JMUtl?=
 =?utf-8?B?R095NDJiMUdTVFVXMHNyYVhzR3R6b2lPSjljQmhkbzluTzRXT3JnYVU3OU1V?=
 =?utf-8?B?UE5YTnFVejVTdEFtcDYwQ3RGL0l0Y2U1M2RIdkI3K1pWaDkzeFFabEJVS2F2?=
 =?utf-8?B?R0RsN2FaQUEyZHBHTGkwcCtZL01UZ3AxRm1XNk14Y0FrN05DQ0tTZ0cwY1FY?=
 =?utf-8?B?dnl0UlIxcm52cmlBLy9pYmYxRndLQ3BiaXhnMGFyT1R0QWIxc29pUE1wcWEr?=
 =?utf-8?B?eG84OVRRUGd6a3dRN3ZJSTJKQ3pIZmlMb2F2VE9Rdkp3dGhzVlByOFpZbW9p?=
 =?utf-8?B?UjRVTTN0c3VLQ2p4QWRickZEU2ZFWDBvZWZ1OWQ4VHVIdit5dUFzTGxwT2wr?=
 =?utf-8?B?MnNFaGdQSUNFQXhmd2dqcG9acE95Y2RNV1FpQjIxa3laaWRrSURWRWhtdVow?=
 =?utf-8?B?R29qVzgxYUw4SGN2V0w3bGc4czhrRW03L3BvWThHckZZTzdnM1hpcHNTUHFo?=
 =?utf-8?B?NXZMMDNoQ1c0R1l5MVJMRDZaZkJCVCtYaE9JL1dITHAvclNkcGwwL3UwR1dC?=
 =?utf-8?B?Z2VNNDFmSVc0azcxTytGTEd1c05QQjNUb2lWcTEvR0J1QU13UHJZSnpXVTh3?=
 =?utf-8?B?NEQ5SytXMTBwSkNzNmpUaDdCWFgyQXQ0a1J3R05SRDN2a3ZHTFRiOTU1dzNm?=
 =?utf-8?B?UFNvZmFZMGsvd2h2d0FDbUt4REhGYmw3Mm9SbnpPRzlPUE5JTXRzeHo5UlRZ?=
 =?utf-8?B?UUJWT1JNQkJSZW55Y0E4Sm1uM0dDenhDaElOSVhJUU5zcytiWlRBL3llNWts?=
 =?utf-8?B?T1BVRndYK1lhWGhvNVoxRjlTbVhXcnJzekN0T0hhazc1NGt4SEtIRDBqMjdk?=
 =?utf-8?B?L21uZ0pBODQ2U1l4Wk1YcHA1ditIN1ZlOG9mcHBnWjhYS0F6TWhJOWF3OURD?=
 =?utf-8?B?SkVzcitzaHlyc3FnN1oxZ0lFZ0RvNEdTT3lCREcyNkRITVh2dU5NYWJ0RGJX?=
 =?utf-8?B?blFrTnFWM2Mydk9DWkdTN0k1MnNyS0M5bytlWlo1LzZkZ3RUY3pEWVM0WWRL?=
 =?utf-8?B?ZGxXMTVxWVZtSWd6d2RpT0N3K0VlNWdZcURiVWpyTXMwczMwZEQrRXIrc3lM?=
 =?utf-8?B?Vk95NEJDR1UwbDJ6Z0RHd1NtVUpjKzlEU0NYWU9oakN0UFgzY0ZDamFtWWZL?=
 =?utf-8?B?K2kzcmJDZkp1c3VmQWI4OWR0TjZOKzAySWJrRHdxd2I4Ky9KaWhhbFdBdXBi?=
 =?utf-8?B?QXBUTkRUN0NJWmEyTFI2bjJXNmttM0liakl5MWg3bEwycFlGaXVjdDdqMkg4?=
 =?utf-8?B?WVVpd3QzcUlvMFBIVFJTNm9Kanh6Z3JiZElNczE5UEVDZURpZWticnVCUVpp?=
 =?utf-8?B?eGFOWE5QZ21CS1A1SWJDWGVBYXdsa2VOTm0rdFdJaDBwWURFanVBcCtLZngy?=
 =?utf-8?B?K010SEg5a0FleUNoVE41VzgwVnhPM0lZODJ0eFY5dDF0Z1hQMG5zQjlFKzFE?=
 =?utf-8?B?N096R29FL0FobVU0a2JHV1RwdDZoOXk4UWVQTXk1bTA2U3Y0U1NKNHRUQks2?=
 =?utf-8?B?NktyM2hTSXNCSCtKbiszZW5lNTJRNmJOc3FucFEwU2p5Z2FxQXNQbzVWZ3gz?=
 =?utf-8?B?R2E4aWN2bDM3TWIrQzBjMG9qVnNpRG1jWXROY2ZzajVhVERMaVFZcHVpdmZK?=
 =?utf-8?B?Szk1dlFEOTZyWGlUTFVuamI0bVltTFVHTXNudmROMDQzZFh0N1ZkZ0hhbm9z?=
 =?utf-8?Q?QiX2ieMGrgoR/Rew2OnjVsI8+?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa5ecb4-7399-46f3-333d-08de1550133a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 11:57:59.8828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZR3NacxTRvCQzWuZEBhOb363V6gcl5LX7F7YOIU9mNz9otsNzLs5aQQtyWFcjsMirDvxp/wgASudCG7cPl4nxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8023

On Mon, Oct 27, 2025 at 12:53:34PM +0100, Jan Beulich wrote:
> On 27.10.2025 12:33, Roger Pau Monné wrote:
> > On Mon, Oct 27, 2025 at 11:23:58AM +0100, Jan Beulich wrote:
> >> On 24.10.2025 15:24, Roger Pau Monné wrote:
> >>> On Thu, Oct 23, 2025 at 05:50:17PM +0200, Jan Beulich wrote:
> >>>> @@ -343,6 +347,12 @@ static int __init hpet_setup_msi_irq(str
> >>>>      u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
> >>>>      irq_desc_t *desc = irq_to_desc(ch->msi.irq);
> >>>>  
> >>>> +    clear_irq_vector(ch->msi.irq);
> >>>> +    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, &cpu_online_map);
> >>>
> >>> By passing cpu_online_map here, it leads to _bind_irq_vector() doing:
> >>>
> >>> cpumask_copy(desc->arch.cpu_mask, &cpu_online_map);
> >>>
> >>> Which strictly speaking is wrong.  However this is just a cosmetic
> >>> issue until the irq is used for the first time, at which point it will
> >>> be assigned to a concrete CPU.
> >>>
> >>> You could do:
> >>>
> >>> cpumask_clear(desc->arch.cpu_mask);
> >>> cpumask_set_cpu(cpumask_any(&cpu_online_map), desc->arch.cpu_mask);
> >>>
> >>> (Or equivalent)
> >>>
> >>> To assign the interrupt to a concrete CPU and reflex it on the
> >>> cpu_mask after the bind_irq_vector() call, but I can live with it
> >>> being like this.  I have patches to adjust _bind_irq_vector() myself,
> >>> which I hope I will be able to post soon.
> >>
> >> Hmm, I wrongly memorized hpet_broadcast_init() as being pre-SMP-init only.
> >> It has three call sites:
> >> - mwait_idle_init(), called from cpuidle_presmp_init(),
> >> - amd_cpuidle_init(), calling in only when invoked the very first time,
> >>   which is again from cpuidle_presmp_init(),
> >> - _disable_pit_irq(), called from the regular initcall disable_pit_irq().
> >> I.e. for the latter you're right that the CPU mask is too broad (in only a
> >> cosmetic way though). Would be you okay if I used cpumask_of(0) in place
> >> of &cpu_online_map?
> > 
> > Using cpumask_of(0) would be OK, as the per-cpu vector_irq array will
> > be updated ahead of assigning the interrupt to a CPU, and hence it
> > doesn't need to be done for all possible online CPUs in
> > _bind_irq_vector().
> > 
> > In the context here it would be more accurate to provide an empty CPU
> > mask, as the interrupt is not yet targeting any CPU.  Using CPU 0
> > would be a placeholder, which seems fine for the purpose.
> 
> Putting an empty mask there, while indeed logically correct, would (I fear)
> again put us at risk with other code making various assumptions. I'll go
> with cpumask_of(0).

Yeah, that's what I fear also.  It's in principle possible for
the cpu_mask to be empty, but since this targets 4.21 I think it's too
risky.  Using cpumask_of(0) is fine.  Please keep my RB.

Thanks, Roger.

