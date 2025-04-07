Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BABA7D8F7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 11:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939341.1339481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iPJ-0008Mo-6r; Mon, 07 Apr 2025 09:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939341.1339481; Mon, 07 Apr 2025 09:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iPJ-0008Kd-2v; Mon, 07 Apr 2025 09:04:41 +0000
Received: by outflank-mailman (input) for mailman id 939341;
 Mon, 07 Apr 2025 09:04:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsCM=WZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u1iPH-0008KU-4o
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 09:04:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2418::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fea2733-138f-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 11:04:30 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH0PR12MB7930.namprd12.prod.outlook.com (2603:10b6:510:283::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 09:04:26 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 09:04:25 +0000
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
X-Inumbo-ID: 4fea2733-138f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQ5xqhrXczcdHwTaEus0ZKftFW2MOilTFVvPkOBb2zUFj9naVbj37+XXO7Q5s5V/s2oL0XUXe7nY5eH0PQoz2DiX0EZ8NQmY/EB68yX2ps3w7Su5kR4/3u2I8aGiCgW6OLSmDeaYPqpasmV0e6vY+pI+psCK1PVQpjM8nODzTiVzs+I+ugrxS7gjHVNbEkcO9Sn/bGz/CuSwayPhzgiTeTuMb4ucqEeBZtxAXZbTFAlU/g9eHgaThNZ2YXXqsdaBfeEDCf0BthfSa/C9jXu+IyQfZaodstiuqB/anPxZLeC2eWo0LHHYsGp7Zbsw92xbXR1bGdfpndHZ21TlYF9kRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/hXzcNFjPfGx2p5Fmcz3iqPzNX/iGxr6ouwRZfOXGg=;
 b=XoqdGH9hDA+9Eb6UY1ujrh21Y++xNXoE+STTc1KMmRFPLs8Akob+oaJ3p3yC0j5NSSnoc19LJfGWriEBg+NhUC0zcnf9r+lTpamsep1y3t8NNoJG6oFfEQlGu1tmJy/KIlJ6BdnqJmHh5LmFpeheoHLdQgwvXbZ7abHDf+c6OPL6x1kWW86t3jk2dLcNq9vczxhYiSl0DWrRbAjCAKmfR8dCv+7+rr6A7L1TbMHFkfo8rD4ULEswJTrj9ABvWtIlV440VVs4pyFg6Ajsa41vzI+G1mD4o+AFX9Eb+dr7JVO3v/ld10UcKGChRdAwOT7o7PGc1NZ6/XdGGf1uKu5vwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/hXzcNFjPfGx2p5Fmcz3iqPzNX/iGxr6ouwRZfOXGg=;
 b=k1p3dnTl0Klejc3KWhlfHMZsoaJmXK6AJSfT7Vmlj3acKS0mRxGNu4COcCmTJsEdpo3nhynS0snKrCL4VShdiW4FPHyE1Fb9lZcy6SFOcsm8prJUbFSDmIuD+/jEShFA6M104aJctbuz1K/vvM7X4tECIXh/CqKM9J6Yq2nnyUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <45d47205-409c-492a-9841-3b162c05ec09@amd.com>
Date: Mon, 7 Apr 2025 11:04:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/arm: Move some of the functions to common file
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
 <20250403171241.975377-2-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250403171241.975377-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0316.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH0PR12MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b78d90-f4f0-4d24-a973-08dd75b33226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWp4eElMcnlldTBKeTBaR2c0KzRhekNsNnBVRS9tUXVoMFE4SFVCZzdoTUU2?=
 =?utf-8?B?MHNyZjV1QWJGVEFiUm5xT3hBblFlRjI4OHQyejRRT0YzUnBhVGRXY0ZwVnJl?=
 =?utf-8?B?WUZsNmwwMVN3d0ZDSnRrdGgvRnZRZ1c3MytCMEtUcTJQYjB5Rjd3MFhmRk42?=
 =?utf-8?B?eFpWemtTVWt0SW5FVkxOZ1dnamlpd2o0K1YzZzI1akRadVZ6aHZKTVZZU3hp?=
 =?utf-8?B?RXZabzliUmhLWUtTemtzN0RacjlVdXBGU1dyY3B4RlpOWXZvZEhSaEY1eWVO?=
 =?utf-8?B?dmc0eWVTY0tJdGY3VkphcWEyVWpKOHZtM2RrRTBJMzZQR2RiclQwUnhTQ2JK?=
 =?utf-8?B?UmpJb0doMThwTmxYZzRVdVZJTXZITlQyNEsrMzlZWU1Pejc5VjN4U1JOd285?=
 =?utf-8?B?RDl2ZzkwdUJwY2ZoODVULzd3RGlNYUxQVUl6akZVQjlQbU9Lc0dCSXhyNWpU?=
 =?utf-8?B?N3dmWWgwWFRqdjBQMExGUDIwOU92N01HQ3I4THZhY1hqVEkyeXM2NE9sTlhk?=
 =?utf-8?B?VWYzT1hRZHFkUTlaWERWZEozRnRXUWdEMDIrdjBlSnZ1NVk0cEZJazZnY1dT?=
 =?utf-8?B?Zk5Rd1p2b3VwcVhkVGtnRU5pUUJmaTZ3WE5ObldFTzBPQTQrcG9WM1RLRnFu?=
 =?utf-8?B?NjhoYmwyN1dlVkxWTjZIRzduMmZaclowTlltU1ZYUm5uOXJUemdya2Y4Q25l?=
 =?utf-8?B?WVR6WDlVMndSTTlkN2FDanFBb2w1OE1zYXVuTi9NTmR2amVHNXV4RlFRcjdu?=
 =?utf-8?B?TlJjcDJSbG5neEtUOXNUS1doQlBDV2hzeFdIK0VFWnNIZ2NGK3FuNURySHRS?=
 =?utf-8?B?TFRpWEpGMlpacG1XRExJcWJERjZWdXNHVU5CemtSbVVSZVpKQUNmdlYyRHNY?=
 =?utf-8?B?VEhzRTVJRVE5NjhkM0VkVGoveDBaZk01dnhtR1Qwd21VbmRXd3ZSNjhaci9B?=
 =?utf-8?B?UlR2VzkrcDdzQzdmcXhRcGpnNDVVT3hZblYzdDF5VGVZRFNmais1WS9nODUz?=
 =?utf-8?B?Y1djY01nekhXQ09HcHZoOFB0bnpJRVI3UXZ3cC9BWWJqMk1GTjBhald6WkI3?=
 =?utf-8?B?b3dSV3Z5UDlOcm9XTTF5NHliVFU2V1NrS3U1cWFYbzk2UGlSaThuSjFqRXJC?=
 =?utf-8?B?dUo4WVB0SGZRZ2xidU5lWGNTMGJMVzhsSzRxYXNXMTBUaXg3OThwRWlMNCtV?=
 =?utf-8?B?dFVUd0I5cm12K3l4OE5JWEM4NkZubGh2M1AyNU02ajFTUUJiczZiU2FvNEIx?=
 =?utf-8?B?d29aUEpWcnFFc0RVd1NSeWhkMk1IQTFYRmRITmhMbTQ2bzZheHlmYWdTSjhs?=
 =?utf-8?B?L0FlNmNGTXZZTCtSVHBqeFovUWkxWS9TTzZ6NXNrb1pFRXVsa3RFYU0vbCtJ?=
 =?utf-8?B?OTRaRHV1cmZPZXk4VXJ1Wkd2dEpnNFFDc3JuVjl2L082MjdPTGdFUWt4OWJU?=
 =?utf-8?B?aExiRzdjeHdNQ0lsL1l3NzZ6c0IzVHJPcjc1N3ZyY3lNUDV3ZUtrREJxQzll?=
 =?utf-8?B?OVQzTkV6Y2l6ZndnNE9rZHg2eldMVHptOTdQU3VLVm51ZmNvR0JrWTNMMHhP?=
 =?utf-8?B?c3RKc0YvY0VRdDNTZGJoL1dQWWJiK1JYMldERldZVENWKzNqV2ZzK2lTMGZt?=
 =?utf-8?B?U0w1TUhRZVVLejhSejJISjJWSC9BQ1pzMWRRZ2MxSVdVZnl1RXdlY2xVcnIx?=
 =?utf-8?B?M3I0UXV0cE1ndERiVjM1UlFtK1RIUUlyNTE3Z0xGY2UybzY0VVp0cVJzV2FG?=
 =?utf-8?B?aTI4MUtISlZhdE8zMjJRYm1jV2hPY3hkc29NWDVTYlNPQjFFcDVMQVVFZUw0?=
 =?utf-8?B?c0VMWEtZZkZmYmhNWDhWSVFYS0VZdWVDSk9mdTN3djBFK2hYN3FRVXBWY25p?=
 =?utf-8?Q?+G9sNMX0TTklx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjY4VGlaU2dpMmtWcGZXVWZwRFhUcThhWitaWlRqeHdqblphYTBxOU9hOVB0?=
 =?utf-8?B?QUs2ZkVQb1M3WEROaWsvRHFOR0NPZ1dFUzZkcEZJRU5XMUpYK3BrRVNveXdJ?=
 =?utf-8?B?WnIrYTVoZUo4bzBpSkw2TFd3QlJ4RDl6L2YxVm5kdjBIeHdZdnArQVk1RXY5?=
 =?utf-8?B?UE1EL1FXOEkzQjhvYkt3ZnJRZkhFdm9KN0kzUkZjelFtK3MzYUVOdXphQ3hX?=
 =?utf-8?B?SGpRRUhvdU9YWDg0eHZobWtjVVdZS2lCcDN4ZklIVzVRU3NtVkhHOUs3NmZN?=
 =?utf-8?B?aWdEcXppUDJLOUVqcXlReVY5dFFOcEptVlZRZDFEUXVCdXM1Qk5WRjZwSGRO?=
 =?utf-8?B?d09OaG90ckQ5U1VmOURjM3VYSmVOYUdnZTViT2ZnMlA2cjIyd09RbHVZSUtL?=
 =?utf-8?B?Z3pwNC9GME5XQm5EcElVeDhDTDRwRHovdGMwM0xXcmhYZ1JEWFFNS2J6SGtX?=
 =?utf-8?B?bWtVd3FGRWVkYnpkZGk0cm9tVU9XVUY1ajF2TjBHbGlvRkw5MGN0SEczS0N3?=
 =?utf-8?B?aGxkb0Z6WWxCZ09zSHNQUVA2Nk0xSEdiT281aWZub2tTd0VEcVZFS1hvTjlv?=
 =?utf-8?B?NllwVVlRSiswT3lvUWRNVUo4eS93MmNCdzhEeXV1Kzlyc0dFancvSGxhakM4?=
 =?utf-8?B?U1AxcUk5ZXNXejEyOERjeXRIb1c3S3d1RlE4QmhtUzVHUTVFYVoxcXptVjJW?=
 =?utf-8?B?N2VCdTJ2U3kzVXh6UnpjdUlhVWMzNHpPVkRHTHNHWUdoSU9rbitUZGllbUZr?=
 =?utf-8?B?eUpUc3hSV3QvaCtRanQyVHdCNHQyUTh4RFdHb3NZT09HdGRkTmRhbXlIcEF6?=
 =?utf-8?B?bEY0Z25ueVNqMWVlQ0k3dms3anVoU3JOKzk2WGZ5a3VTM2lGdVN2bHJpSFlZ?=
 =?utf-8?B?UTNpN2VuSkVEU1dGSXFWVWVPVHdaTjJWamQxZ2tWRnlORFRmS29kQnNhcUE2?=
 =?utf-8?B?OWNkZVQvMVNGS05ieU1MNkxBdGJXQjNEeHNsck5Md202eWFZNGdoRFgvWUhB?=
 =?utf-8?B?R1dLY1lPU2ZTdGVsV2hKa0lXV0hka3FYWWM5UERMSXlRM2ZJbXdYaWVvckNC?=
 =?utf-8?B?WkJjaXEvWTJLWFJ3bXlKek1NU3g2cXJyY0luZlB3M2RnZEc0WjhxUks3eGRy?=
 =?utf-8?B?K3htZWtsNHlucG9BSlBxYmxEWHdMb2l4bndIdEJTYm5RUUFvMlhaYTBpbTJ4?=
 =?utf-8?B?cWRsWERwSkRjTlpPWWVEb1J5TU9TbnBhQ2IvLzZ3OVZrTi9NUUtKQjd2K3lx?=
 =?utf-8?B?K1ZBaUtoejVuTUl6WTgxRGFETnUrYXhjWi9SNFBkYksycU1FaVpBWmJvaTJL?=
 =?utf-8?B?UGNjWlcwNmUvV3pyNmpVUHlMeER2eGJiTnAxbmtvUUpJR2FYZmVudFVaRHNI?=
 =?utf-8?B?MGtKVmR6RXlTUG9kS1VTV1AyTlhWVVI4Qk9lWnc5RTBpVDdHdUpYNEw0SWRY?=
 =?utf-8?B?ZklCT29KbFc0eGVVNENkbkI4TDg4MXR1NU5BWkNHUVhsT3VDbDhlbUR0eita?=
 =?utf-8?B?bmYxbmpCaFU0SFdiU0gzQUFoMmxqU2c5OCtCbmF2Z1ZJSm5waG1EdXRvbEVX?=
 =?utf-8?B?dDZISEtlK1YxQjZWcUVOdmd6VExaVVpLQ3RTTWhyUU85WExQRjZvcWtiTDNV?=
 =?utf-8?B?UGtRTDZ2enRYdk9sNDRyQTVaVTd3aFJhRzhiYkJpcVRkRzJ0Wkk0akFQQWJE?=
 =?utf-8?B?N2VWdUwrbmpwdTYzV2h0U0dPZTY1cFBGeEZLOWxPcDJEL3hnYW10WHJGa2VF?=
 =?utf-8?B?dS95and3S2RLQ1dVanFYei9rbk5TZ1JKc3Z5eUd0MXp2Qk1nZVloUEtMcWM0?=
 =?utf-8?B?RG1RODlTcFlFSFp1bFhHMlBNVkhoRTVxc29SU01xdXJRV2tuQW1IQkh2TkV2?=
 =?utf-8?B?WDNjSE8xN0dkbUR1WERIUWxnVHFJOFFhdmhURlFCSENaUVRGTTB2K3NUNEFM?=
 =?utf-8?B?VE9xbUt4RWJwc2tqa1RsdjFMajFpYVliRkxWa2hoaVh1R0EzZVRGc2NXVkY0?=
 =?utf-8?B?c0tLQVpSNjFaaFUvWWxNYnhad3BLSGhXK3VrSUM0ckFRUVhvMWlEVTc0UmlT?=
 =?utf-8?B?bmhHcnZ6R2lqK0lORXdwRk9IT3FhM3Uyd3lrNm9ka0pUSENpMU5KbGw3RUdk?=
 =?utf-8?Q?fMv7hL4NkOuNY6Co/IHEnIszI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b78d90-f4f0-4d24-a973-08dd75b33226
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 09:04:25.9334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyt/ut8DaHGsFR8u9V5ihA9aZQUI3yVa2Ru9/xAptGl/imyHkAbIxgLtuiHw9PUA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7930



On 03/04/2025 19:12, Ayan Kumar Halder wrote:
> Added a new file prepare_xen_region.inc to hold the common earlyboot MPU regions
> configurations across arm64 and arm32.
> 
> prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
> arm64. Thus, they have been moved to prepare_xen_region.inc.
> 
> enable_secondary_cpu_mm() is a stub which is moved to prepare_xen_region.inc as
> SMP is currently not supported for MPU.
This does not sound right. If you want a place to keep some common MPU stuff
between Arm64 and Arm32, you need to come up with better name for a file. SMP
has nothing to do here with preparing regions so it feels odd to have
enable_secondary_cpu_mm stub there.

Also, new files should use dashes '-' and not underscores '_'.

~Michal


