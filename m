Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3537FCB00B1
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 14:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181694.1504717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxd6-0002sM-6h; Tue, 09 Dec 2025 13:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181694.1504717; Tue, 09 Dec 2025 13:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxd6-0002pp-31; Tue, 09 Dec 2025 13:19:48 +0000
Received: by outflank-mailman (input) for mailman id 1181694;
 Tue, 09 Dec 2025 13:19:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nu2q=6P=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vSxd4-0002pj-FX
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 13:19:46 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9bb1294-d501-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 14:19:44 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6613.namprd03.prod.outlook.com (2603:10b6:a03:393::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 13:19:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 13:19:39 +0000
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
X-Inumbo-ID: b9bb1294-d501-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7KGTwVyUW0b+SxC94OLM7jZqHANyEmSWvdCRM0s+NJWSkgHHhSAXJyrbiJJ9hPAAqEGXy4kyu8XIZkjxJGk2TkrPigyoz3tvL0Tuirsq42Y7GCiP1f9l3VlRwgt7VD6NoSHX14lrPgrb3FxhgVFhs096DRuyzxD5CQIWPHtMwTCeIUmQMUcbB9vk2PYEeO812LqeN7+0wbCx1lT5n+dgA/XqUxUPVWsUo/D/m28hmVBuPru8KdtfsGvazWTWaqqWG1QhmlWriAR+1U+MBflm5U9leTUOsh4u+kGm7IKwbbwIgl1ao2GGm4r0ecvrmcGWgAtHf0SWFbShTXXOgCL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFP+hWantrk4VLarmx9WuD78vATgXibldqEnbljBg2Q=;
 b=De6gag0DZPO1U9D+ngPt0Obw9yRf6aOgRS2STC8dnDY6hLf2m7RCcQzqMKn++qKGp7q/jUKYNZQImEzz1LXDKTfol27MqanedMpkBv/BKGHgdzuHkmMcHAs43+GzKEMBl1frSpGhrHsKFTzM5icb3aq2Ag7rfIfURvZ4R0sSEFlxbMIvJLEn/XSxxNJPupiwJ7tnZpvz8cmfypXYrTQjkKGelnXTbyoWEzyCf7Di2t3WOlol+RVf2TMfHFz+VkUrejlHdu8wjaWqdybHtWSlVvDQkWftL/P/Uzk98PQhiAJx9HX0SOShDw8Hua3m9fx2vG5IBaDYaE5b5sPRyyYD3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFP+hWantrk4VLarmx9WuD78vATgXibldqEnbljBg2Q=;
 b=Lg+6t0lDAcu9tEQi5agD7IQT1RHKkW4wdYr81lXsfvCaTzVJ8ZJFWb7+8huw6RL1qQ6hvENVwuAj7NwPj0Joyle9LVS0dDDlWPtfPisnpTM5I29DFuBh+coZNVbLdrskav4uEFSrcBtx1Vdsr4CeM0VQ22WHJUu/V+veEvgDkvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <25069a8e-ef00-4706-bffa-b3b724cca200@citrix.com>
Date: Tue, 9 Dec 2025 13:19:34 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
 <d9a632d1-8587-45bb-bc13-8dab8d346cb2@citrix.com>
 <4fc76270-98e6-46c4-a6a4-d73772e079c9@epam.com>
 <483d50d9-a076-4698-bd14-28afabd5d369@citrix.com>
 <f6cccd82-3112-4696-850a-119843fca5ec@citrix.com>
 <18ab3734-deb9-4569-ade5-9d96a7bf3c7c@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <18ab3734-deb9-4569-ade5-9d96a7bf3c7c@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0430.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::34) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: a79d6b5f-9a84-49ff-d279-08de37259b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjlCSzRpRE5xZ3RNcDQzMDlOVkgrQkFQS1d6UDNhUTZ2ZUVMK0tnYWV5MitL?=
 =?utf-8?B?K3QvL0N3dmtRWDh2U3BDM1dvVk43UEs4RTRIVzB2V0JKeDBldlZsVUdqcjhK?=
 =?utf-8?B?SXZGM3JKdVpiTnNmMkVyQjlnS01pZjY0YmhhOWJ6cVhFa1AzWW84dnlVbWZm?=
 =?utf-8?B?SlJtM1MwdlhnMkNYKzNYZ3U5Zy9mbWJJd016dmM4MEx3cXBzeGQxcDMwcDZN?=
 =?utf-8?B?TVYvYzBoaXdnTzFlbmRVK2tnbm45RGVmZ0NuYk5UZzV3eXYxRm5TL1cxclc0?=
 =?utf-8?B?Szk3ellCWFNqcXpXd2p2WkNmSE5Zbi94SVo5dm4wWWVmaWtweUZnb3JlNVVn?=
 =?utf-8?B?RzZkLzY1UTFkL2ZpSzVGWFFTbWFETHAzdVZVcXhITDdSUzhNeXB2Y0ZsdS9i?=
 =?utf-8?B?TnJ0NjBSWC9Yc2FCbmwvYnZVamEvdHV5SGIwMFFacE15Wm54MU04eXAvVFlG?=
 =?utf-8?B?NlpHaEFKVnJYT2VEcWZpQmh3cVpvNFZraWdTZmdpdzVNQVRTazJVNGx4MjhB?=
 =?utf-8?B?dzlvYzNOT0l0VTk3WWpzUU5YMk1EaUtNL21RTW5VVUVBUWJ5T1dmQ3FmUThE?=
 =?utf-8?B?L2ppRXBaSlBLZnM5S2o2VUoyNzF4eGdWS0hGbWlEWTFMTC9NY0JHZmlIUkd3?=
 =?utf-8?B?WmpzRHZKUE9LNDA4MU1tckZMUDBQQlpuaDE5aXlYa2Z1dTRycHJnMHNsQk9z?=
 =?utf-8?B?ZVM2SG1XSmRieE4zTnc5RzZSbEtySzBlQ3VieVErakZ6eEZBVmlmZ0V2NU9Y?=
 =?utf-8?B?a3p3QXdCODFtV0pmRVlyblNtQkNpRHRhZUJ2Ujk3aVpoL0VSbnRXNDNhYlp3?=
 =?utf-8?B?T2ZIeHhaMUVLRVB4TklnKzY4RDNHRC9MU096QXlqWUl5NmV0NmJ5YktRcG1X?=
 =?utf-8?B?MVQ3VloyeXJ4eXUrN0VsazJWSE5leGdPaGVrMmMxOUM2MURrZVdtNTVidTRv?=
 =?utf-8?B?YmFhQjZ3MlNBakZvNWFYcXRwWTRTMU41VG1oQjdwNU5nTG1zRVIyaUdKRmgr?=
 =?utf-8?B?TDRMYzJ4TTIwbEtneTdDWkxZRTN6YXNMeU92bUowMUt2SjRZbHZLTnlvVXp4?=
 =?utf-8?B?YkRNYkJCV1lab1VEVFQ0cGhXVXdlRXkxM3RlUGtMalQrUW5rT0RUWnFIMjR5?=
 =?utf-8?B?YUNkcVZFWUFNcVdKcktiejZoSzhUZTNaVG4yWVNJZ1RQbUpReEpsMmFsUFdV?=
 =?utf-8?B?dkZrU0FKQzduM2dvc0R0ZDcxV3JQdDBmV1VxV2tYNmczMk5kSSt0ME9aNi9V?=
 =?utf-8?B?TlpnRkZDZGtndXNTUnhGK2NXUHpLU1gvMitWRm5EenNSQTA4ejVyVWxBbDFF?=
 =?utf-8?B?MWVzN0dLSVJ2Y0lmRUdGQk94K2hLYXR4R1VjWms1eUNLYnl4NlNMQ0FTbnAz?=
 =?utf-8?B?ZVZRdUdITUo2OStvNzZRb25HUkJIV09BaXExVWpxczJkQXVPUm1MMkYwQko4?=
 =?utf-8?B?V3hQZHZQK1BaanJRYTh0RUZEL2ZrQ2YwV1FRMUg4Sm4xenE4Vk1tV0M3SEJs?=
 =?utf-8?B?bkZnQ2JtRnFycERoVEtIOVRaRjZWcVdxNjEzTDA2UG85T1RST0dkbnJwb244?=
 =?utf-8?B?OXRJYkUvbzhTbkFyc09rQy9POUsyaG94aTV4QnNrdmJCZXJlQWdWVGUrZ1ZG?=
 =?utf-8?B?MzJ3aHJhTWZOY2dsd0hySjMrdlV0Tk5JRGxiWnF5SnE4clNFSGhFMjMvWE1F?=
 =?utf-8?B?RjRPZ3FwMlJrekpWdENQWFJLWHZjRC8wczlOU0VBT21rRy9lWVg1c3VRTGpW?=
 =?utf-8?B?WGdka21ZVlZrS3F4MTRKM0ExUDdMa0JyTjY3eDM3NGpkWnVYUzFhcHNrc2Zh?=
 =?utf-8?B?S0xRTjJYSXkvVjN2SEVGdXVqdkRTelFMZGlkWUJCVG96N2h3OGNReGNiVzIr?=
 =?utf-8?B?am5JREhvdkE0LzlzVUl6RGFqL0RMVmNXR1kyWk5JTGUwem1tSzBrR25JMjF1?=
 =?utf-8?Q?3QJavWCVsMA6pPMNemjMdrQaw9lpWYiI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFdtRHFib3AvUVhtNTVqZkJxOHZGWVNnMmJmdGhLazRJaGM1ZzhBMDQwMHBF?=
 =?utf-8?B?dXkyQTh2aXFqS2ZQMFR3RjlkLzVOK1RBS1JXMDdBa21wcWp1eGdPZTN6NEt1?=
 =?utf-8?B?R2tvdW0zVCswVjQ3UFNIdW5WT1I1aFByUVJhRWswOTM2Yk9nZzQrK1d6U2l2?=
 =?utf-8?B?NHltOW5uY0xsY2trcEtsTDlOdk5CakdmSVFKNElGblA3NHluODI4Z1ZwaU5G?=
 =?utf-8?B?MjREdWhzd3pJTkU2Z3JNZHVteDlNWGpqbStBUzJGMzByQ0kxYnBGRXRLVTBG?=
 =?utf-8?B?MnB1b0p3aHpIT25HbG9SK2JPOUd0MTlId0plMGtkQTkxNzh2bzlIWk5MbnZo?=
 =?utf-8?B?SGxZOG9PR0hKZzJLbjFIaDFYbGxSek5HWFh5ZlppTzZoYWhmTkVvTTY4QVFX?=
 =?utf-8?B?WW1YdU5WaTVmQXpXWCtyaVFOS0YwNVlPUmFGWEdxZllSK3I1WnZBK0hWUkRG?=
 =?utf-8?B?elptSWpJQjZSV0o5Q3ZHbHhmYWxvOVpnbHIxWGtYNlppN3lpWEw2b1h6YnM1?=
 =?utf-8?B?Nm1VSXBvNCtYYUdkQ2tIKzlsWndXTmRQT2NITE90ZlEyRE51bnhvck9UK2hh?=
 =?utf-8?B?b2dYNHJjbkRZWWJsSDlqS1ZreGVqY203NUxVaTVMUW9keHd1Ymd5TWg1WWEw?=
 =?utf-8?B?ZnZzbVgxUkk2K1RzUDJXWkU0bnJUSFZCQXZ2Mmh4YnhFWG41TkE5NldLZy9u?=
 =?utf-8?B?QndlT0ZEQm13V25rMHhIM05OczlVQTU5REJESWcraHA4YWZFZHFhcDE4aEJH?=
 =?utf-8?B?b2xnUEk3aHFGbWlZeHNvOWdRR09KSTh2SDlWbWZ0VEF3UWwzNFJYZjRlalFG?=
 =?utf-8?B?cDFHanAzOWt6SmRxd0Jnay9QN0NhN1FPRnlFS2ZMT29lWGhxc0pMNHRlYThz?=
 =?utf-8?B?UDZkWGJOdVpEa3EvTkhIbjFzQ3g4Q1krMlJXdUdXY2t0a24yYkxvK1d1L1I2?=
 =?utf-8?B?cWFaVG53RnMxS21VbnBUMkFKeVB5K2l0eGJjRjB3QWpubGVTeWx4VUdldDZM?=
 =?utf-8?B?NzZRM0VBekE1YkcyUXE1WnVMb0FxS1NlWjU3WmxGTDZLM3dVcU52ZWJNWUxZ?=
 =?utf-8?B?U1drUXBPcnBKYUR3UHMzN3hWYVEzVXcyTjA5elRYWFl5cDRuTFI4Vng3L0N6?=
 =?utf-8?B?b3ZsMXdWKzNqNHdIZlR1cVFnWEU3Y0VNSGJ1dktkdGNWZ3ZBSDlKd1Zmdmdv?=
 =?utf-8?B?Y1lwMC90SWMyNHgzS0xFdGhUSnFwTXdZdXk0T1M3dXVmT2c5NHZtQWpmY2sv?=
 =?utf-8?B?eHBpMnE2c21rUUdDL3BvbFFDL0NvczRYa0lYWnlhK1ZabWdZL3NsS2hJVFJz?=
 =?utf-8?B?V2Q5THZ0eWlMd0dwcVk5aUxLRGI5YTJoZkhid1F3MnNVZU1nSUhFaUI3Umc5?=
 =?utf-8?B?TEo0UlNoR29JNkgzTUxEVlB0VGxWTS9wNyt2eTVoZjc4Y25BdXA4cTRYY0xa?=
 =?utf-8?B?T0s3TEp2Tm1MM3dzbGJ3SEVzUksrUmdGRFBES0ZzK0ZiakFOS2ptdVN0cFRY?=
 =?utf-8?B?NWJlbWI0YzN3aURTaElmZ2o5bW82VFZoVzBiZm42NW9FU2dMeXFXOVpweDAx?=
 =?utf-8?B?bDB6Mzh4ZVd2QnppZ1dBdEhFZSttazdVK1lrMmNvYzRhbjlIZmlpWm4wRmV6?=
 =?utf-8?B?R1A5WWUvcGprWThCd2MzdDF1MndmaWZuM2RpdnN5dFJtRlZNVHc1MVR6cTZF?=
 =?utf-8?B?VGsvem4wUFFuaFhRVTIvKzBObVpMRCt5MkloWnBYeGJwZG5wZ3VRUzJNcjJ3?=
 =?utf-8?B?cVRmV3N5ZEd1RURrQ0dDQ1dyTnYvbEVEMEthSE1Md1c3eFZQZ2VYTE4xSkp6?=
 =?utf-8?B?dm9yck5OQmtYQjZRM0J5T1IvRXpROS8vL0NJT1VuUTI1OUc3RitnUHlQaDJw?=
 =?utf-8?B?QVVwRXJubFBnLzJ0VGhDWlVQSGNheFJkbjh3RjdNRHBNa2dINmw2V1plVTAy?=
 =?utf-8?B?MjE4eGwxUWQvd3Rkd0lCQU9uNzdEbmZLSm0vSjdjSUFTTjR2YU5iTXRjQUhh?=
 =?utf-8?B?TXZET2FJMTA2bUp6bnkwSUorNHpNZEtoc244V1Q1NmkyN3VyMTJJQXNkdCtL?=
 =?utf-8?B?NG5SNGJYR0FrbGxPWUdkTmJUa0NhRDlleS9YYzMvMjhYR1prT1pqdnUxMW9l?=
 =?utf-8?B?ZHNvOGg0YUxlTFhLLzRwN3owY2hsQURYNUxDQTVDcE9iU294K01rM3ozR0RC?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79d6b5f-9a84-49ff-d279-08de37259b1c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 13:19:38.9757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQ2RLwQBQkji9Q/wgGm4ZRZxU0fUcW6s23+2rkkOQYcFSCYi/n0V0veo1ZsjSC8WwIycTVT3WxQszRRJ+cKujlaw2peBvZgU8MlaAZZSlkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6613

On 08/12/2025 6:49 pm, Grygorii Strashko wrote:
> Hi Andrew,
>
> On 06.12.25 16:21, Andrew Cooper wrote:
>> On 06/12/2025 2:15 pm, Andrew Cooper wrote:
>>> On 06/12/2025 9:10 am, Grygorii Strashko wrote:
>>>>
>>>> On 05.12.25 22:00, Andrew Cooper wrote:
>>>>> On 05/12/2025 7:34 pm, Grygorii Strashko wrote:
>>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>>
>>>>>> Extend coverage support on .init and lib code.
>>>>>> Add two hidden Kconfig options:
>>>>>> - RELAX_INIT_CHECK "Relax strict check for .init sections only in
>>>>>> %.init.o
>>>>>> files"
>>>>>> - DO_NOT_FREE_INIT_MEMORY "Prevent freeing of .init sections at the
>>>>>> end of
>>>>>> Xen boot."
>>>>>>
>>>>>> Both selected selected when COVERAGE=y, as getting coverage
>>>>>> report for
>>>>>> ".init" code is required:
>>>>>> - to bypass strict check for .init sections only in %.init.o files;
>>>>>> - the .init code stay in memory after Xen boot.
>>>>>>
>>>>>> RELAX_INIT_CHECK/DO_NOT_FREE_INIT_MEMORY could be used by other
>>>>>> debug
>>>>>> features in the future.
>>>>>>
>>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>> ---
>>>>>> changes in v2:
>>>>>>    - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two
>>>>>> different things,
>>>>>>      both potentially reusable
>>>>>>    - enable coverage for libfdt/libelf always
>>>>>>    - enable colverage for .init always
>>>>> This is a lot nicer (i.e. more simple).
>>>>>
>>>>> But, I still don't know why we need to avoid freeing init memory
>>>>> to make
>>>>> this work.  What explodes if we dont?
>>>>>
>>>> It will just crash when coverage data is collected.
>>>>
>>>> First I made changes in make file to get .init covered
>>>> then I hit a crash
>>>> then I checked %.init.o
>>>> conclusion was obvious.
>>>>
>>>> For example:
>>>> objdump -x bzimage.init.o | grep gcov
>>>>
>>>> 0000000000000010 l     O .bss    0000000000000028
>>>> __gcov0.bzimage_check
>>>> 0000000000000040 l     O .bss    0000000000000040
>>>> __gcov0.bzimage_headroom
>>>> 0000000000000000 l     O .bss    0000000000000008
>>>> __gcov0.output_length
>>>> 0000000000000080 l     O .bss    0000000000000060
>>>> __gcov0.bzimage_parse
>>>> 0000000000000098 l     O .init.data.rel.local    0000000000000028
>>>> __gcov_.bzimage_parse
>>>> 0000000000000070 l     O .init.data.rel.local    0000000000000028
>>>> __gcov_.bzimage_headroom
>>>> 0000000000000048 l     O .init.data.rel.local    0000000000000028
>>>> __gcov_.bzimage_check
>>>> 0000000000000020 l     O .init.data.rel.local    0000000000000028
>>>> __gcov_.output_length
>>>> 0000000000000000         *UND*    0000000000000000 __gcov_init
>>>> 0000000000000000         *UND*    0000000000000000 __gcov_exit
>>>> 0000000000000000         *UND*    0000000000000000 __gcov_merge_add
>>>> 0000000000000008 R_X86_64_PLT32    __gcov_init-0x0000000000000004
>>>> 0000000000000012 R_X86_64_PLT32    __gcov_exit-0x0000000000000004
>>>> 0000000000000020 R_X86_64_64       __gcov_merge_add
>>>>
>>> Aah, we should exclude the OJBCOPY too.  That's what's moving
>>> .data.rel.local amongst other sections we target with attributes
>>> directly.
>>
>> we can't target.
>
> I've come up with below diff - seems it's working without
> DO_NOT_FREE_INIT_MEMORY.
> Is this what you have in mind?
>
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index 8fc201d12c2c..16b1a82db46e 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -40,7 +40,6 @@ config COVERAGE
>         depends on SYSCTL && !LIVEPATCH
>         select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if
> !ENFORCE_UNIQUE_SYMBOLS
>         select RELAX_INIT_CHECK
> -       select DO_NOT_FREE_INIT_MEMORY
>         help
>           Enable code coverage support.
>  
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index 8c4861a427e6..47fdcc1d23b5 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -33,11 +33,15 @@ cov-cflags-y :=
>  nocov-y :=
>  noubsan-y :=
>  
> +# when coverage is enabled the gcc internal section should stay in
> memory
> +# after Xen boot
> +ifneq ($(CONFIG_COVERAGE),y)
>  SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>                                              $(foreach w,1 2 4, \
>                                                         
> rodata.str$(w).$(a)) \
>                                              rodata.cst$(a)) \
>                           $(foreach r,rel rel.ro,data.$(r).local)
> +endif
>  
>  # The filename build.mk has precedence over Makefile
>  include $(firstword $(wildcard $(srcdir)/build.mk) $(srcdir)/Makefile)
> diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
> index 60b3ae40728f..8180c78f1510 100644
> --- a/xen/common/libelf/Makefile
> +++ b/xen/common/libelf/Makefile
> @@ -1,8 +1,10 @@
>  obj-bin-y := libelf.o
>  libelf-objs := libelf-tools.o libelf-loader.o libelf-dominfo.o
>  
> +ifneq ($(CONFIG_COVERAGE),y)
>  SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>  OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section
> .$(s)=.init.$(s))
> +endif
>  
>  CFLAGS-y += -Wno-pointer-sign
>  
> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
> index ae0f69c01373..fb26e5bff0fd 100644
> --- a/xen/common/libfdt/Makefile
> +++ b/xen/common/libfdt/Makefile
> @@ -4,7 +4,9 @@ SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>  
>  # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed
> during runtime.
>  ifneq ($(CONFIG_OVERLAY_DTB),y)
> -OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section
> .$(s)=.init.$(s))
> +       ifneq ($(CONFIG_COVERAGE),y)
> +               OBJCOPYFLAGS := $(foreach
> s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
> +       endif
>  endif

This is the (aforementioned) non-standard way of doing .init.o, which is
why it doesn't play nicely.

I suggest that we first convert libelf and libfdt to the standard way of
doing .init.

For libelf this means we need regular __init annotations, but #undef'd
outside of __XEN__ (when we're doing the userspace build).

For libfdt, this will need some init_or_$FOO things (matching
init_or_livepatch).

Once the custom init has been made standard, this code becomes easier to
move into lib, and we no longer have special cases when trying to extend
coverage.

~Andrew

