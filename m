Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B11AA92B7
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 14:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976083.1363323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBucR-0007kP-5O; Mon, 05 May 2025 12:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976083.1363323; Mon, 05 May 2025 12:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBucR-0007hp-2n; Mon, 05 May 2025 12:08:23 +0000
Received: by outflank-mailman (input) for mailman id 976083;
 Mon, 05 May 2025 12:08:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VAKQ=XV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uBucP-0007hj-Gk
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 12:08:21 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2414::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a088286f-29a9-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 14:08:18 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY3PR12MB9556.namprd12.prod.outlook.com (2603:10b6:930:10a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 12:08:14 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 12:08:14 +0000
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
X-Inumbo-ID: a088286f-29a9-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hw0Wqakt7LIMbPb8XSIxAtwpYrClvBJiOfVCGtPSaaWxFkOAl59ZDiNBhZZxwKZ/NDPn9Wh6nXHFRjTP3qkMVjtIbMvfh5/5zRpOddrfMDOtwv38u4KkRABnqyvK/cmn5NjOL8/CURmhMnZ2TWe7QQn8WD9E3gNpiGgL4XY0G0J4j2XkxVrYbHIa7S5VJdf9XjOSVI2Ksh12zQfKGdRg4L2TQ5cdFGk6PGJEeX7S78q8z5k0uooTSFjpjTiivE4UJ+hV+95+XZm3zFZvPO0fyZC0p4l+d62Y7Pqr5a1FsuQuPtliQIzeYq9TG0pCNVIcOkpHgwkloKCNMqcQu8IdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJJ0qItWcnQ3XRF6aJ7N1gpfTNCYMYpoKwARsVw8rrY=;
 b=aA77pxBXukECKCmivptTRL1YWbk1xuzbwBDU8yhTEKKKpiS/pedPaRdYeeTu2a6qZ6Ok+l81Uoa43a9jsYdMC9aOLNkiCP4SIY6ECqhcrF0XwNN3bnbuU5JjRaoL26r1nXFQpBsPwNMI0P396Sd2SQKAnMq6D8G6ZD72Gx5HY66Pid/cSRvB5DB5fTrE6+Dio3w9T+6iQhV2ewmIcKlBV4chZa5WYlUHN6lLTAUrcowQ0IzIWJrXnHfaxn/3ml8LY3TY+VGGZv6poy7Aix0ETGsfDJnkWYEh85fY/v5qBu5goROlboL7dNJBtuFMsLngfyJyMP2a4cbd5ELwJOa1gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJJ0qItWcnQ3XRF6aJ7N1gpfTNCYMYpoKwARsVw8rrY=;
 b=TfdvJSNjKn6fjpve0ZOuKJ7QWEGe1ObUW0R5mdMWQTIhHVckaN/OCXrLJDui0hvXD1f1Ym5Ll9rBKVgk8GI9IIcM+GDNWdPIl0d25txVlFenMq6h/medXOXZFTsvMHlqVWxPt20h4bdEnarbqF6pPoowXaEyedSbbIbIm0RhwXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a11855ac-62f1-439b-8fc0-dcf2006a76b0@amd.com>
Date: Mon, 5 May 2025 14:08:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] arm/mpu: Introduce utility functions for the pr_t
 type
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-6-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250429152057.2380536-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY3PR12MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab03f44-0eb3-477f-9e19-08dd8bcd8349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWpQeGtjVnNlYisvMDdvUlpzOU1xckdWQlBoSTI0dzhKWWsrM050ME1rWUJk?=
 =?utf-8?B?anBPRE1Rd2hpVW9NTjIvQ2ZRbjBlTkh1dDA5TnhQYkY3U29TdjFpejNnbjFm?=
 =?utf-8?B?S2JtOVBwL2Y1N1VreVl3NjJwVm1KOUc5a1AweklNUGpqV2Nnd1o3Z0N5VVVG?=
 =?utf-8?B?UGFXNDl4UjAvRENoemRScW4ycVhMa3R1NG50VVg5eEpXOGZaVDZLb0tTYmNx?=
 =?utf-8?B?c0JnR2k4T2JvUVVTTEJoQTBDTHg2RFNZaWQ4SVJYcjNmU05naDBDNFBSVVlL?=
 =?utf-8?B?TDBnc3FuakoxZE41bk5QUTArelNUTmc2eEJMR0FpYnhMZVlvZGFqaElGUHBi?=
 =?utf-8?B?VFA3cmo5MndYTW13VkFJSHRtcDloTk5jRjU3T2IzZDFhV2l3MnRvK0VrL3dS?=
 =?utf-8?B?TFFMU2RxQ2FrYnNvbmFiK1B5ajRlMmIya2xYR1JCWHh1bDRTVDBYNVlpUzB2?=
 =?utf-8?B?a0NGelF4SFdiSHRmTUl1STl0bTN3c2dKWkpqY0s2L2xlWXRBcTJOLzFackVx?=
 =?utf-8?B?bjFRejUzNXV1RzVvaDVRL0VEdkhDWkFyaGcrcGI2bG0wWHJIYUtMelZobzBn?=
 =?utf-8?B?aXlPd0ovTXFVYTNJWUY2bEpQVkE4MkpYZDQvdlRmT2RmdmlReFFpaGxnd3VM?=
 =?utf-8?B?YW5jRW1DSk5BUkl5Qm0rRWFNVzF0WmZvbEUyWjNZeVFPT0wyUkV4Z09FR3c0?=
 =?utf-8?B?MW5iQnRLYjkvSVE1SWlGVGlQL00rU0JJaEJHSTluMW9rS0FxVHBBWGx6V2VE?=
 =?utf-8?B?R2g0aDdkWHhzMFo5eDB0aEhJS2FDZDN0RUQvSkIyRERZZmlCbDdDbkc2c0Z2?=
 =?utf-8?B?cmJnU250WlA4eEF5TW1iVkRDRmdUNmhTaHgyZEluRGhMZ1paRGQzRm9IeXd2?=
 =?utf-8?B?M1hVaUhhN3ozeE14RjZqUHc2K2JESTdQOVY3ODc5M0pOQURHRTFxY0NnV0Uy?=
 =?utf-8?B?bGtHK1phb1lERzlHLzgySUF0WjRYK0dJRUpsZk5yZzNxdHRDRitKbzBXWXln?=
 =?utf-8?B?RTI5VTlpY0tORDRERHptODRBREZObGwvUk00M2lMb2VvSDBoRGI1L1VsZ25O?=
 =?utf-8?B?NSsvYytYbkE2TGczTS9hY2oxU0FYVkUzVXh0Y2J0ZmppaHNuL2dSK0VXQ0xD?=
 =?utf-8?B?bXZtSnZkeFNoQ3pmVlFHeE1QQTJrTzh0a0wrUCtuZExyc1VsNlJ5QllhWlZ2?=
 =?utf-8?B?N3Nia1dvWXp3OXNSTmZxQ1l2KzJiRm1oRVhpRlBVeDFmWk5UMm1VZkl1bXQz?=
 =?utf-8?B?TTBaVS9pWEY5MlVhK1ZuL0dOUGZOMlZGT0pwVTlaa1pCVlQrb3ppT2lISk5B?=
 =?utf-8?B?bWhjRE1PMDVVdVJDTWJyb0s3WHhHVGRUZGd4eVB5ci9qV290cU9YNXJQNDJR?=
 =?utf-8?B?cThTRktlNHNNSHdiRDRHQjlCeGwxcllicFFpby9tU0pIRlRCdTN0djB0aU8w?=
 =?utf-8?B?ZU5WbFg0Z1FjR2NRYU5rclRlYXE2cHgyNDZXWlUvTzVWL0c1WmVxYnljbXVn?=
 =?utf-8?B?NWhuR1hnK3lXQUtHVmxmWnpRUTV3bHVVakszb0tDRTEwMTBFcEVtQ2x4bUdl?=
 =?utf-8?B?Skw1U0JTK1NOdTZ2UjVjOWllNGlwUnYvWVlIUm9naEY5U1JnV2hZSXB5SEVt?=
 =?utf-8?B?NlByTmk2amw5cHQyUllOaWxhWFVWbmxyM1Yzd3A3Z0xMUWFIeHJmYURIY3N6?=
 =?utf-8?B?K3FHYnBKWXJpZ3kzUXZBTExEY2FUYTVkT1VOUnN0OWM0aFNvcGQxWjhsbzAv?=
 =?utf-8?B?azdjei9maWhGdE92SFJJdEZkSXA5VzJkLzBYU2xuWmxQVE44YWdEcnZXTjlP?=
 =?utf-8?B?WXhFRmozeEc0bTk2eTZSRkUzNllTVkQ4UTBSSHYxQVpuMi9GOTQrYU8zZTBL?=
 =?utf-8?B?VlJYWk40SU8wS08ycEJTUGhJdWMrTGZVM2oyNmNzUUVVT0VMRG93SThEczcv?=
 =?utf-8?Q?t+/4W0lc4t0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHNTbmRvdmFLQS9RejBKd3FuSjlycUd0cSt1R05iVTFJMzRuYUxqWVd1WTBy?=
 =?utf-8?B?WXl5YVltNGN4L1h1M3JEZEhucWU5SkJUTEJnMGxRT0k5RXpWeDBDWUZocml4?=
 =?utf-8?B?UzhaTjY0UFdKdkMyRUMxcithTmFhMXhZcERFNmJMaUFuRlQ4SnVybXlNUjFn?=
 =?utf-8?B?UktnOUMxUGdUVEdFWHVhOUtMdEtwVjJDaXNhSXBCYTRLVFo0ejd1R1dTZjlH?=
 =?utf-8?B?cUNJRGVmbmN1d256WUdTSS82YXRQM0lGMnEvTy90cm93YS9rQ01XREZ0WjZ4?=
 =?utf-8?B?b2R3cU03TFVvZjVjaXBKTkwyeDdaeUxnVWxCRGkvN2JISXFMbjhmSllqcnQ4?=
 =?utf-8?B?bzhGV3NYZEtJc1pZK3BDN2VKcUljVjRWOWN6N01KNzRkOHhhblFrOFhzdno1?=
 =?utf-8?B?UGZSd0tPVjIzMzgyYzFyVW56eC93UnBCUzBnS2JTSDNnZGg0WUlaRTFSS0Jr?=
 =?utf-8?B?VXM1MFhZZWlxQWhYd0M0SS9CR3ZmWWdhL1ZZWUJMT0hLb3RsL0JJUFVPblRI?=
 =?utf-8?B?anhSTnhkK1dPWHg1bk9ObDhXaUswVU9DNGlhMWpKbUdGaURwakZWbXYwbzQx?=
 =?utf-8?B?UGk5blFTaWEwcUphenZCbmxwRzdYTVhZRS9rb0tOUEhvMTRON2NKRHpoMzIy?=
 =?utf-8?B?dm4rZGFreWR0YWFKdmZVUWttY2V1Ri9ZMlBFQnYrYWlGOWJka3draTYybCtY?=
 =?utf-8?B?ZGpOcG1wR0ZkZmRRdzM0NkRoK1lBa1RxZmgreGhoWGZYNXhvK0ZmVkJGTkdY?=
 =?utf-8?B?VUVka1JYZ1ZveE9HeS9KZngwYjIrZFB4a091c2xZUGZVYXliWmhraEJ5OEF0?=
 =?utf-8?B?bUR0ckRMUlo4VmRJVHU1cHpuYmNRcEpWV0JqMm81Tk1rTHpyWTA1YktEeDU1?=
 =?utf-8?B?L0dOMGZzK2dlcy93MXJVdk96QmZjWkNCdlVOT2FEbVFYWFRIaldRQ1lMM0xN?=
 =?utf-8?B?T0g0TVNrK3JxdVoySmlDSmFVd21UNlV1ZXU4QVFzZEw0bWQ3dUg5L1ZzSWxW?=
 =?utf-8?B?K0hVMHFjbzdmN2cwS2s5U250SThYZ0Fnd2EzTEVWWlBZVktOWFFIbVh0UzM2?=
 =?utf-8?B?aFlNd29qeE85R3BiclZLL3VOR3lNRU9yNitjMzNqTkRMRDUyYXVxMmtiSWky?=
 =?utf-8?B?dERBVTBKd3Q4MXVGMlRWNUZLSGRHN080SFNMcmhKd29jc0RxeWpLaSt4OHF4?=
 =?utf-8?B?aitNeVRRbk5lbVdNU0czZnNzR1poeWtSbWNqSlhOUTBRN3NZWEZRRExKcXp4?=
 =?utf-8?B?c1h5YW9iQUtoMy9NNGU2T2YvN0J6THNHWW5JUWlabHlsV2pFbEF0MnorYmor?=
 =?utf-8?B?NHE1b1FkN2s1OURuREVlcmFMSjRMQXF4eUVuOHBIYThuV3FQSURRSEZEWmJC?=
 =?utf-8?B?WE50YUdSQWk0UExRdFBUS3lOcnVVZ29jUnNaQkFCbGNBVUxqWDNucjN2Nlhw?=
 =?utf-8?B?bENWME9OTzNMbXdCbHRkSWJDSDd5VFVPczlQZTRuMFZRV2ZjRXA4VzkvYkFD?=
 =?utf-8?B?ak9Md212bmF5ODJsTzA3TmtPNlNDSGw1SlQ0My9sbDNWWTFpdUZ1NTdaNlph?=
 =?utf-8?B?VTZwd2JmK3VQVkcxNFBuVGlZVWMySkFLNERNVHE0OG9DSjVFL0lqMUQ4S1JP?=
 =?utf-8?B?WSt1VW9PYnF2NjBzS1hkcCt4am9sY2UwMmd2NGxEVllWL3N5SUJLVlVpUmxv?=
 =?utf-8?B?eTUzOU5tN1lLSUthNkJ3NGxYRUlzb25aNjBQYnIrdk54UlBkMDE3c3dGM0sy?=
 =?utf-8?B?NmljL0wyS0xpdHhBdFprNExuS2RZaFRHNE5WMFBVZ1dwNzJqT1NRMk55UGIv?=
 =?utf-8?B?eGcyeW5TeG5CMkRtWGtlbFczeXpQSWtNVHNZK3ZuZkR1VVYrNFB4a2hoN1RC?=
 =?utf-8?B?TWJnOEd6b0tvTFMzbGMrdXhpdDRidWN4dDVtMzRzM1FFRTNHTTM2TUpFajF0?=
 =?utf-8?B?Vk9MQkp2M3pIZkNOTGxOSzZiUi92VUluaEpFUnJRVUVvYUphSEY2T2RrOUlZ?=
 =?utf-8?B?WGhDNjhITXdNKzJSTmhpTXV1Y3cwM1QybWkza2l3a1YxRFJ0N3RzSHptbk1W?=
 =?utf-8?B?d2xWN0NjSnUvZUc0aWlTaEhvSW9rbmVMVWRhaUVYQTZWeUlYWk5VT29mUXhP?=
 =?utf-8?Q?QUvPf2LVblCkvKdhUPqLtvUZZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab03f44-0eb3-477f-9e19-08dd8bcd8349
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 12:08:14.5062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a39ga0zNSqkkNN43sewY/xh9atW+Czq8KXMslGZyiWQ+2MDj+fFtNE1+WU2Cq8wu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9556



On 29/04/2025 17:20, Luca Fancellu wrote:
> Introduce few utility function to manipulate and handle the
s/few/a few/
s/function/functions/

> pr_t type.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
>  - Modify comment on top of the helpers. Clarify pr_set_limit
>    takes exclusive address.
>    Protected common code with #ifdef Arm64 until Arm32 is ready
>    with pr_t
> ---
>  xen/arch/arm/include/asm/mpu.h | 64 ++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 40a86140b6cc..0e0a7f05ade9 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -24,6 +24,70 @@
>  #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>  #define MAX_MPU_REGION_NR       255
>  
> +#ifndef __ASSEMBLY__
> +
> +#ifdef CONFIG_ARM_64
> +/*
> + * Set base address of MPU protection region.
> + *
> + * @pr: pointer to the protection region structure.
> + * @base: base address as base of the protection region.
> + */
> +static inline void pr_set_base(pr_t *pr, paddr_t base)
> +{
> +    pr->prbar.reg.base = (base >> MPU_REGION_SHIFT);
Shouldn't you take MPU_REGION_RES0 into account?

~Michal


