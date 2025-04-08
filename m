Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D54A7F910
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 11:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941631.1341071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u251p-0007tG-41; Tue, 08 Apr 2025 09:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941631.1341071; Tue, 08 Apr 2025 09:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u251p-0007ro-1Q; Tue, 08 Apr 2025 09:13:57 +0000
Received: by outflank-mailman (input) for mailman id 941631;
 Tue, 08 Apr 2025 09:13:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h40A=W2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u251n-0007ri-CI
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 09:13:55 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2418::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca0ba72c-1459-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 11:13:53 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Tue, 8 Apr
 2025 09:13:49 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 09:13:49 +0000
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
X-Inumbo-ID: ca0ba72c-1459-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IA1Hvo9WknF5zAsCHqlZIyb5SybETGmPTItm/nkshxKZexrltgmGsKRDzLZpFfF4W1qUM0jXgclbZfbGDEYzaAkTTclq5FL9MYJCN/kK/bo0dctx1lKij0OKJgwyw5+R/yYAx9RHvoS2SvUY8FWmR72nHZ1S0NWP+XMiGPGhoCljiQnFNtCVdXITOiz9Shyr/1UtTdd9whFAaLuh6G5Q/yAjol6SskZTQ9Y2VcpTmwvb0iITbiFfSNlPEiksI5QvYWF5WeATs4X0pXS8aV5GhLpJbYV/FlUqmXQKlo8Ew4/6qvZm+8pu6OtyE1p95Mp0EnoYzpM+K2Wy3y7vpL7Y+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjJwMog5CwgG2/J0SzMadEKkgifi7kE1D/72iZ6uRkE=;
 b=VazbgEtZ4t2ldH9//vV3F5xzl/0LRL3Q5VxHZcWNkRRXr1L7nDOnoW1acvIdAL0w3As1DoW9HijDIb11RYUbz4twcKM4QVf7bbu/SH5NIWn61NOiujBJ3GyakuzZbngTzyZKhLMm96d9EweE1ByZHIgcNhxrFqNGtwTsJKYssIJk5nuOt48A7p/0TJard/lY193g/E/PfXyoE1FhG9StiDsiarbiv//bfULlJv/eyLXVszGg01MKvhpkr6rmhlz0XurgBDLdFZHS2OAVav1/NpNx7GwspST49GEiTqbFBKnLlv//HvVh/ZCyJ0WAFowlYZ4yigzNhx90VvCDfLNplQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjJwMog5CwgG2/J0SzMadEKkgifi7kE1D/72iZ6uRkE=;
 b=fikLFR7a2fLr2U5YsMrcEb7Hd/ois1SLQE571Et9pp8DbPObI0ph/PG0cHSbO0SOUmK86MQ2+/1KjTg8OSups6TTB9LVCm9oq6vnNCQJw2BG4QLaqsYJ0onHjXd221NF/G1HlF5EacD+srPZjEZHlw+j/kiryQQIegKzS3dhPAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <1a58517e-e882-4ca6-898a-923d8a8fa8cd@amd.com>
Date: Tue, 8 Apr 2025 11:13:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
 <20250407184443.1790995-3-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250407184443.1790995-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5ef580-62d2-438a-2f00-08dd767dac37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MU9pNms1SkhYaktyUkpLdVFscE9CRjN3bW5mUzV3RmYvSmJRRmtKQWtkRTRF?=
 =?utf-8?B?M2FXR29raWRmY0N4TGZJZi8yc1RPb1p2RWd5aFZzYkoxUzdkTVVXUXp1bXJR?=
 =?utf-8?B?MnZBMWJ3ekUxNVNUK2RJanlKazExdDRVeE1OdHFXSG5SeXUxV2kza3JPTTND?=
 =?utf-8?B?bmhQVDQrTzMzeXFjREhtQVR5ejdhSWtBdDdvOTNVY2dPdG5SZ0VrUFkxVi9Y?=
 =?utf-8?B?NUtPbktVOUFtekdjUzhxYzUvREF6ZzBjMmpTUXJKNy9XTVNnOHZEaUpMbm5r?=
 =?utf-8?B?VThOdmw1OENwMkVmSC9RaWNpbUZFZU5xb2EzYWJHTGdBbnI1aFFldDdFQmRt?=
 =?utf-8?B?T2ZLb2YxM1NqS25vRjVucDRvbjF4RUllT1lUclZDOGg1ZC9IcGQ5YXEwWTRn?=
 =?utf-8?B?Vjhhb3Z6cXJueU92R2M4TWVYRFJOc3M0Tnl3RVM4SGh5NjJpdmZpTlN3ZXRG?=
 =?utf-8?B?SS9jMkhzTjRkMWREZ3Y0RkxldUxkcW05NTdpeDlIOFhPamQ4SUxKVXNmWGtU?=
 =?utf-8?B?ZGJxMzVGbFNONE5wemdJcFFaVlRMYzRZNldCOTlKdnNEd2pLMGFIZ2ZpVC9O?=
 =?utf-8?B?UlB3MWtsRGJadG4rUGtjd2xGblVZbGc1YkErOXZBRy9EcUdBRkhIZm5pcnBX?=
 =?utf-8?B?VGUzVFpjWWhhZUozMWFpMmZNRHVEdklWSmtadGtaYUNUbmFBdnJTYndEZjdP?=
 =?utf-8?B?RTJSV3g4MkcwYWJuTGJyZWdRYmdvSFc2TDl3MUdOVVpGSEdqTlRKZ0QwSDN6?=
 =?utf-8?B?NVFTcDlSVVM3dzBWclkyVFlUejcwRTI5OFVQLzNoeHo0T0p6UnI3VGNuWXNC?=
 =?utf-8?B?SkxsaWxta2dtZWJDVXhNWWZLZTVHSlF3NE9SdHlIRUZKb01IOXVrd29nb0Ni?=
 =?utf-8?B?WnBadXZReVJEeDkwbHFrK2Z3bXV1MkhrdllyaFU0WDZidXlDV3FrWWhpc0lJ?=
 =?utf-8?B?TFQyK1VhZWNRY2hhajZvSktiMzMwRy9JT1FLYzhYWHczelllQnQ1ZVRqZU1S?=
 =?utf-8?B?dTN3cG1VOHNkcnlBRW1jSHpheXBHdFBkN3dIVWxHS0ExSXdNWUh5aFhvQy83?=
 =?utf-8?B?dUUxVWcrSXR3bStuTFFJY0dqTDdDY0tTakJmaENWK3J5UHZsNkhuRVN4c1pq?=
 =?utf-8?B?Yk9YME16UC9TVWF0U3BiajhUVTZTYWlvOGJNamhsTVJKMUFLZStwMTJrOXNC?=
 =?utf-8?B?VVJQTG9KV29wa2xFVTVGZVdadFpVOVF4czZ4RVpXMTF6RGpXZUp1Wmhqa2FO?=
 =?utf-8?B?Rk5lYktleHljd2xGS1RqSlNJdmEvRm9TOGNuOUl0T1k4OThGRlBLUU5KU1Jq?=
 =?utf-8?B?RXhOSHU0WXJiK3FVL0dkTGJka05Ock9QTmhILzk0cGRHKzhRbXhSd3RITmxm?=
 =?utf-8?B?RjE4OTZOeDF2ZFFHUC92TzZTdGF3YWJFN3lrcDdQYWtsdlRpWDJZRUZNMHFK?=
 =?utf-8?B?aUgrdjB0SDhMWDF1djBhV1VIVFhtTzR0Q2NDN0tpSWhVaVNtOVlobjJ5ZDFR?=
 =?utf-8?B?VDdhcUhKZHNYQXU2bVpLKzY2ZGZRc3ZaM1dpejRPd2ZzaWl4T215VXkxTGd1?=
 =?utf-8?B?SEdrVXNCZXhSeEFWNDBIQlF0Wnk3NGdaZzY0dkM2SEtvajhnVDExL0hjR0gx?=
 =?utf-8?B?dWhpOUpYWTQ5a2JZK2szWkJ3RzFuQjhjNDlqNmdPSGJUR01ZVW0zQUE3dnoz?=
 =?utf-8?B?UFQ1eGtCMXExZURzS0VqSmU0eXhodjZrR0FzdnhyVktFOExqeGMzYW9WQkYx?=
 =?utf-8?B?TDF3NHAraGNQZVhMNGY5UDlnQzc3dTk1QkVDbE1zQ2ZUQ1FzaHQ1WWxjQm41?=
 =?utf-8?B?bk1zd0kvUnU2aTlwSDU5b3pQM1AvMms3dkZGUjVOVFNJS29jZ3dQTnNWWW53?=
 =?utf-8?Q?NuvFxkiKuLdct?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3pwV3ZHMWZwZVZxSGNJL0JMTk1uZTFkOUx2MFdzdXN2SHBkTndoR3JCQ2pS?=
 =?utf-8?B?OHJqNllGNWxtYlRwNnFzTHBDbUxiRXlFZUR2M0ovT2ZWUlA3cnVKZzQ2K215?=
 =?utf-8?B?c1pseThKWUd5RjcrdktFQkVac2Y3S3lxV21GOFlHNXhpcForRUFxZlRQcWpL?=
 =?utf-8?B?cDVYNlNHN3RJZVluenZ3UWYxbkdQaVRGU1pNN2xaYzBkUTREREkvbWE1d0Vx?=
 =?utf-8?B?YUQ1eDZYRHZTeEttRzJDcEtKaTRuZXBzdVoreGY2cS85cGJjbVNGV2wvRkxz?=
 =?utf-8?B?WE5IcTR5NE5nZnhGbldVdWxSNjdYbnZXNU5KNnhKckhJYzBHczJNUnY1QUpk?=
 =?utf-8?B?NlpiT0UrVGxrL1ZFYmluM3NUd01MZU9KcnVaQnFoQ1YxUTRiWitrUW15T0dQ?=
 =?utf-8?B?TEM3cFJIdzg2M3RxRTVaYkx4RXE5Umh6ak9jZXJhR0dKdm1XZCtzWXRHWmZQ?=
 =?utf-8?B?aUg5b0IvTGZxYWd1UGc3dkl3L29SbEh3bFRLZGM2K1BMR29QM2gzc1AzT1px?=
 =?utf-8?B?dEVzTGFTWTZpazltdkVTYXcxZEoxbGQ1dFVvMTQ3K055dUhuWCtUMXlHZVk2?=
 =?utf-8?B?cTUxMCtabTVVcnREbHBGc0gwbTBzYTNvUndXbnhvR0ZkR1Q5Q28zZnVrdTls?=
 =?utf-8?B?elgyUGJvTmF5Q2FhajBKZWFvakEybm43VHZpUk1SUy9CYXliSVh5U2VqSEd5?=
 =?utf-8?B?SmMrdEZkUFF6V3NBS2xaTG16d2tIK0ovaUpBSUhIR1ZwMHIzRXhtR2hHVWp3?=
 =?utf-8?B?MzZZTzUrS0FiS3lDN2U0aGdvZ0NwWjhUUVIvcjBLamYrcGI2MTA0NlVTUFVI?=
 =?utf-8?B?U3lCWlRaekw2b0RhNCtxci8zQmJXbzNBaUR4LzdjUnRKYWdIclVNZldGM0N6?=
 =?utf-8?B?cXJ1QUpmdG5UQmxXdW9ZalovemtFcFNGaEd2V3B6a3VXMGJSSlZLNHB0dVFi?=
 =?utf-8?B?ZDVCd3VnaXlOQUNvZzdBRG5WRHkzV0lVbzgyVjF5ZnYrSE9NRTNFWlJFemlY?=
 =?utf-8?B?Rm4ySGtDNUtpYUFuWmhnOERmdUFaSnIweERYNDdESUdkNithZkFjN3JNODRN?=
 =?utf-8?B?c3ltdDFSa1BkckdXVWgycWNWQktCU0lrYTdBb1JPYkZhRGNwcW9wUnJSeVZ3?=
 =?utf-8?B?bHR3TTMzVTQ0WGZyV1NZRDVTc3R5dFpFWlpzRVBTdStGN2p2UTBxTkh0YUtn?=
 =?utf-8?B?bEVmdXB2RHplNGs2enN2VGdyTlcvZnhpdkdMZHAwU1JjS0dWNDlBVXg5dXY3?=
 =?utf-8?B?RTFCVG1LSmQwSnVUcHUzTkI2U3JIcDVXRlNWaUlzOWMxcXdHMjJ2R0wvYm9y?=
 =?utf-8?B?V0hDRDkzS1MyYysxWEYyMlMzNkdVVDRmaStKMjFOSEtpeTh5Z3ByU2EyamhO?=
 =?utf-8?B?WTNETHJnby85c2dvNzljSFVDOWxQMkpzcS9tdk1iU2R5UGNSeWVoM3hheEda?=
 =?utf-8?B?eHVpNG9lMURXSkJzUnN3R00zdXBKMkZiaDdnY0s4R3dISlFnUEk0cENpc2xh?=
 =?utf-8?B?RlQvSDVVb2dLRE5DaE80M1k5WmM5SXUwNktOdlViZ2Nkb3dqek9tQ2FTS3pS?=
 =?utf-8?B?dU1KakxNd2NEckhKaFF0NE5ZTFUzMVVnbEYvRHJFSmpIbTVVRjBiOVhaWHR4?=
 =?utf-8?B?c0hrTlNHdmx5NjcwZGRpQWc4Nm9zRDRSNVpLUkpVK3UwOHlpNFI4TndjZzA4?=
 =?utf-8?B?U2E1TFJtTE5WMmZvTWVpWGxaMU5EQ2ZSYXhwWnRPemoyeGVCQ1pLSjJBNzdu?=
 =?utf-8?B?WEh1a2VKVldodVBaQi9SenJHNGhpMVlVWTFaTnNWMmRuVkMwcEUwRTJ0OE1R?=
 =?utf-8?B?VVFScHRtSTlGTXM4ZThUWG94VWxGUlY3a0FQQTltdm1STkJEZE15WDQ4VHBX?=
 =?utf-8?B?bGhoeFpCWmFFRnFWN0ZtV2JmNFVNbXlFek9ldXo2M3VzRHgwbUhjcGFCWGt0?=
 =?utf-8?B?ZkZJVUpxZUNlVFk4bTBvZ1VkajR6ME5tcVRRdXZWZllPUFFDNldyWDlMV1ZS?=
 =?utf-8?B?eEVVM3pWclFzdFp3K0pNeWpXZXlxSE1pWEU4NGxRMllodnJQTXFCWHRvTTdm?=
 =?utf-8?B?dkxBS2lBY0hJRmFEVThESFhKQUkrTlFnTFNiZ2lPNWVlUDc4a2F6Q2REK204?=
 =?utf-8?Q?Ctt5QsHZKArSOI1+yKjDyDmcA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5ef580-62d2-438a-2f00-08dd767dac37
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:13:49.0488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kt9/ChMIbD3tM6588nUMDUdpH38RoXXGPbe8TcI9AWmudOy/Xe3Mb88jSre8EoiH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066



On 07/04/2025 20:44, Ayan Kumar Halder wrote:
> We have created the same boot-time MPU protection regions as Armv8-R AArch64.
> Also, we have defined *_PRBAR macros for arm32. The only difference from
> arm64 is that XN is 1-bit for arm32.
> The macros have been defined in mpu/cpregs.h.
NIT: Describe your changes in imperative mood

> 
> Also defined WRITE_SYSREG_ASM() to write to system registers in assembly.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from
> 
> v1 -
> 
> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
> being done in enable_mmu(). All the mm related configurations happen in this
> function.
> 
> 2. Fixed some typos. 
> 
> v2 -
> 1. Include the common prepare_xen_region.inc in head.S.
> 
> 2. Define LOAD_SYSREG()/STORE_SYSREG() for arm32.
> 
> v3 -
> 1. Rename STORE_SYSREG() as WRITE_SYSREG_ASM()
> 
> 2. enable_boot_cpu_mm() is defined in head.S
> 
> v4 -
> 1. *_PRBAR is moved to arm32/sysregs.h.
> 
> 2. MPU specific CP15 system registers are defined in mpu/cpregs.h. 
> 
>  xen/arch/arm/arm32/Makefile              |   1 +
>  xen/arch/arm/arm32/mpu/Makefile          |   1 +
>  xen/arch/arm/arm32/mpu/head.S            | 101 +++++++++++++++++++++++
>  xen/arch/arm/include/asm/arm32/sysregs.h |   7 ++
>  xen/arch/arm/include/asm/cpregs.h        |   4 +
>  xen/arch/arm/include/asm/mpu/cpregs.h    |  24 ++++++
>  6 files changed, 138 insertions(+)
>  create mode 100644 xen/arch/arm/arm32/mpu/Makefile
>  create mode 100644 xen/arch/arm/arm32/mpu/head.S
>  create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
> 
> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
> index 40a2b4803f..537969d753 100644
> --- a/xen/arch/arm/arm32/Makefile
> +++ b/xen/arch/arm/arm32/Makefile
> @@ -1,5 +1,6 @@
>  obj-y += lib/
>  obj-$(CONFIG_MMU) += mmu/
> +obj-$(CONFIG_MPU) += mpu/
>  
>  obj-$(CONFIG_EARLY_PRINTK) += debug.o
>  obj-y += domctl.o
> diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
> new file mode 100644
> index 0000000000..3340058c08
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/Makefile
> @@ -0,0 +1 @@
> +obj-y += head.o
> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
> new file mode 100644
> index 0000000000..84e9f1f8ec
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/head.S
> @@ -0,0 +1,101 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Start-of-day code for an Armv8-R MPU system.
That's exactly the same text as for Aarch64. At least write Armv8A-R-AArch32.

> + */
> +
> +#include <asm/arm32/macros.h>
> +#include <asm/mpu/common.inc>
> +#include <asm/page.h>
> +
> +/*
> + * Set up the memory attribute type tables and enable EL2 MPU and data cache.
> + * If the Background region is enabled, then the MPU uses the default memory
> + * map as the Background region for generating the memory
> + * attributes when MPU is disabled.
> + * Since the default memory map of the Armv8-R AArch32 architecture is
> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
> + *
> + * Clobbers r0 - r1
> + */
> +FUNC_LOCAL(enable_mpu)
> +    /* Set up memory attribute type tables */
> +    mov_w r0, MAIR0VAL
> +    mov_w r1, MAIR1VAL
> +    mcr   CP32(r0, HMAIR0)
> +    mcr   CP32(r1, HMAIR1)
Is there really a need to do these 2 writes one after another?
Why can't we use only r0 and save one clobbered reg?
mov_w r0, MAIR0VAL
mcr   CP32(r0, HMAIR0)
mov_w r0, MAIR1VAL
mcr   CP32(r0, HMAIR1)

> +
> +    mrc   CP32(r0, HSCTLR)
> +    bic   r0, r0, #SCTLR_ELx_BR       /* Disable Background region */
> +    orr   r0, r0, #SCTLR_Axx_ELx_M    /* Enable MPU */
> +    orr   r0, r0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
> +    mcr   CP32(r0, HSCTLR)
> +    isb
> +
> +    ret
> +END(enable_mpu)
> +
> +/*
> + * Maps the various sections of Xen (described in xen.lds.S) as different MPU
> + * regions.
> + *
> + * Clobbers r0 - r5
> + *
> + */
> +FUNC(enable_boot_cpu_mm)
> +    /* Get the number of regions specified in MPUIR_EL2 */
> +    mrc   CP32(r5, MPUIR_EL2)
> +    and   r5, r5, #NUM_MPU_REGIONS_MASK
> +
> +    /* x0: region sel */
> +    mov   r0, #0
> +    /* Xen text section. */
> +    mov_w   r1, _stext
> +    mov_w   r2, _etext
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
> +
> +    /* Xen read-only data section. */
> +    mov_w   r1, _srodata
> +    mov_w   r2, _erodata
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
> +
> +    /* Xen read-only after init and data section. (RW data) */
> +    mov_w   r1, __ro_after_init_start
> +    mov_w   r2, __init_begin
> +    prepare_xen_region r0, r1, r2, r3, r4, r5
> +
> +    /* Xen code section. */
> +    mov_w   r1, __init_begin
> +    mov_w   r2, __init_data_begin
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
> +
> +    /* Xen data and BSS section. */
> +    mov_w   r1, __init_data_begin
> +    mov_w   r2, __bss_end
> +    prepare_xen_region r0, r1, r2, r3, r4, r5
> +
> +#ifdef CONFIG_EARLY_PRINTK
> +    /* Xen early UART section. */
> +    mov_w   r1, CONFIG_EARLY_UART_BASE_ADDRESS
> +    mov_w   r2, (CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
> +#endif
> +
> +    b    enable_mpu
> +END(enable_boot_cpu_mm)
> +
> +/*
> + * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
> + * please the common code.
> + */
> +FUNC(enable_secondary_cpu_mm)
> +    PRINT("- SMP not enabled yet -\r\n")
> +1:  wfe
> +    b 1b
> +END(enable_secondary_cpu_mm)
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
> index 22871999af..a90d1610a1 100644
> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
> @@ -20,6 +20,13 @@
>   * uses r0 as a placeholder register. */
>  #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
>  
> +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
> +
> +#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
Same comment as for previous patch.

> +
>  #ifndef __ASSEMBLY__
>  
>  /* C wrappers */
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index aec9e8f329..6019a2cbdd 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -1,6 +1,10 @@
>  #ifndef __ASM_ARM_CPREGS_H
>  #define __ASM_ARM_CPREGS_H
>  
> +#ifdef CONFIG_MPU
NIT: Do we really need to protect this include? I thought we do the ifdefery if
we need to include either mmu or mpu. Here we don't have a choice and afaict
there's nothing problematic in mpu/cpregs.h

> +#include <asm/mpu/cpregs.h>
> +#endif
> +
>  /*
>   * AArch32 Co-processor registers.
>   *
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> new file mode 100644
> index 0000000000..6b20c7ceae
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_ARM_MPU_CPREGS_H
> +#define __ASM_ARM_MPU_CPREGS_H
> +
> +/* CP15 CR0: MPU Type Register */
> +#define HMPUIR          p15,4,c0,c0,4
> +
> +/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
> +#define HPRSELR         p15,4,c6,c2,1
> +#define PRBAR_EL2       p15,4,c6,c3,0
> +#define PRLAR_EL2       p15,4,c6,c8,1
> +
> +#define MPUIR_EL2       HMPUIR
> +#define PRSELR_EL2      HPRSELR
AFAIK, these macros are there to use AArch64 sysreg names in common code when
compiling Arm32. This would mean they should be protected with #ifdef CONFIG_ARM_32.

~Michal


