Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63323A2A2DF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:04:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882543.1292652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfws6-0004zh-UG; Thu, 06 Feb 2025 08:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882543.1292652; Thu, 06 Feb 2025 08:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfws6-0004xy-Qb; Thu, 06 Feb 2025 08:04:26 +0000
Received: by outflank-mailman (input) for mailman id 882543;
 Thu, 06 Feb 2025 08:04:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GaX0=U5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tfws5-0004xs-IZ
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:04:25 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2418::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9ccf817-e460-11ef-a0e7-8be0dac302b0;
 Thu, 06 Feb 2025 09:04:24 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB7539.namprd12.prod.outlook.com (2603:10b6:930:96::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 08:04:20 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 08:04:20 +0000
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
X-Inumbo-ID: f9ccf817-e460-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6sDqNBRcE7gU1D0Z9qiGWTfaFj7+BMAeYvRIePIkbvvnslsgvQEED0UV8WkuTZqQo3eVxltndSMpUSoVgFSbSG4aFW0C37EyeSQe/YOu6jxZtnklFfBNLD9+7s4x/iFpHGIZcLZ750wX5VPbfH0R+NukkHJoKko8dQezBXEHnl+HX9jW+hXpL5oOF/oHdepTfUODF+QQNFb4Jre/9XiNR0wQXeqHwQ3sedSuIKOPMl2yP/OnPDh77bS8NnBvXCtruNsqJVjI/czjNGGc9sfRX0piz6+jrcijqiSsPJuQYvmffYPL5Nylt2hFGiLbxolzhsf6DWhkbt3LVx+e4a/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSkQvAczRhjw8CF4SlqTnu6U5e+qrEE4SHAH7N80e4w=;
 b=eToJL2OUMXteB/yfPFReE7NtnxnZkFvtj4o6/mI9Q/CWHJ8lwPfXbcj25OM7IDwxxFwO/3UIwGVFr6+/utf3y3gLlFjgkjsczFlutLEf641axVk/S86wDQUGXX/WAHL+aL8x4/0vWKN+h0endpZRk7eVWe2PHvVL9k4t8w5PXa0kuRKAW/tmTFMOf6T2IRAJOyECaMez5t74DuLdYpjHXg5aWfWtD9UT8EYs6Ho8JG8DC2l2MkLlknlsLbG7AL2x6wv+O/xfuAGKA/iPUjIwPYgH9sDjZrrIL9YEXrb4cWDt+HQNuTrzpDyOJ+VhG8zkUlVZgpotiO1ryiHAhRnTcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSkQvAczRhjw8CF4SlqTnu6U5e+qrEE4SHAH7N80e4w=;
 b=PQokKrjvIMvy8ToYgjJAyLO+PkjT7zaQF471E5P/sV39qhBCKiNaJB4noHOrAuVAu0IJHOldyeGoIA9HBGiW7VOL9gd5JV0Mg8H0J+E9MHBx2slFdvrNhCvocVHOMJ7UuVdKx0anlxhYBcNHtJJiazMBkWjAQGX/BzCyNU7AsEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9e65b38c-20bd-4e4b-8bf2-5eb0510f9e4d@amd.com>
Date: Thu, 6 Feb 2025 09:04:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] xen/arm/static-shmem: Static-shmem should be
 direct-mapped for direct-mapped domains
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, Henry Wang <xin.wang2@amd.com>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
 <20250206010843.618280-2-stefano.stabellini@amd.com>
Content-Language: en-US
From: "Orzel, Michal" <michal.orzel@amd.com>
In-Reply-To: <20250206010843.618280-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f0620e-d55f-4d0e-43c3-08dd4684dc68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U29EZlRzaXFTUE95N0ZESUp4enJoZ0syQnIrdjhETnhkbmorVWpMWm5BL2Ja?=
 =?utf-8?B?WHdMNlVGN1daQ3JtcjNyTkpXQkpZZFV6b1N0Y0RDbUNEdFUxSEFnLzREb203?=
 =?utf-8?B?N0ZrTmQyaEJ2blNxbU41ZkdRbTJjdFp3UHpkZjVKbGZhUWRTZmFGNXBRZEpu?=
 =?utf-8?B?Ui85d0N1alFjenJZdXFZbm1FY0hzK1NiQ09DV0IvbkZSOUhyQ3B1QURXVERj?=
 =?utf-8?B?YzJVRzE1Y1k4RHYzOUhRaUNPWURYKzNVdGF1cCt5MTdHb3JwS1VlOElIYnZU?=
 =?utf-8?B?c2FIbXMreHNGQWRYMzJuZFcvTGUrVmxrSnN0UkxMcFgwNEF1anl4WDlwS0U2?=
 =?utf-8?B?VmxyV0tJZVRubnNwUFhXOHp2K2djLytudnFuS1hmL3NUWHJTeWw4QTRqZDMv?=
 =?utf-8?B?eHVXalluZTl3djNTVUxvRjRiN01FZ2tWdXliTDRpUXRqcFBzeWFoWmNiN05N?=
 =?utf-8?B?bjc2UCt1VXlGMitJV2RzditiY00xdGU2ek90ZEphYVpLWkVZNWFvaE9uaHMz?=
 =?utf-8?B?bnpCb2o2VHpsdmhvTnhYNzJzMklJbG53TGZBelNvUVF3UFlwTXVjdHgwd0RS?=
 =?utf-8?B?a2w3dHcxOWp4eG5BUVhrc05abFpkWm44djhaS0VwZ3oydnNoZDJoZ0tVYU5w?=
 =?utf-8?B?T3ZJUUJkUHcrc1NrRWVNOCtFeldSWmpwWnZKYVlGWGJhY1RJOUJ0VjJrNkVF?=
 =?utf-8?B?VHVkR0s1NmxtVHF0bjY1ekJHeld5VENCQTQra0E5QWhQK1ZJMmxNNWVNMjZa?=
 =?utf-8?B?VTVrbTFIQ1J5UzVCZGgzTm0xMGw3UHVhNE94ZWQ1K01qSGRTdTFxbHRnOVFn?=
 =?utf-8?B?TzlXeGFTSjduUlk5R3ZvczR6dmFLc1V2Q01RUkF1REozQVArNForbTE4Wmo3?=
 =?utf-8?B?eEhGOU5Cei96YlI5RmoxcXYxQUdTV1R6SmxLU1lPMlVEam1UZmFhQ0M1Qy96?=
 =?utf-8?B?R1prdzVzL1BuNmE1Q3Ztd0tuTmRQeXJDN0Z0Qy9Bdm11N01MQ3cydG5xYVY5?=
 =?utf-8?B?U3I2MDk1RVRZTSs0dExjWXU2NDE2SEVLS0l1Z2t1bFdtYnFORU1wRVI1T1Bi?=
 =?utf-8?B?dm5YcFd1RElEWGRjamhoQTgraHk5YjZ6ZTZreFVTQmdIRVE2VTgvbGhqOFUw?=
 =?utf-8?B?ald5MXk5WmhzSVZwdk96UTRpdEUxbXJVT2w0Wk96M3lBZlJpMTgwYTYvdDFn?=
 =?utf-8?B?QmNxdDRLNGN6ZlR6bXF5MmZ4aFlqbDlYY29XeGhVZWNQZXRtTURhYXZPMStl?=
 =?utf-8?B?eEJTelk1STZsYUpQYXhOejlLV2piV1ZlM2twZnpDOUhJd25CZG5memNWaE9D?=
 =?utf-8?B?VmdleFhndVlGdVhqTDYxUUVrcUdjMzZuNXN2QUZ3T29tanUwa1pxaWRQOTln?=
 =?utf-8?B?V2dxaUI0YVRFb3NHQnY1RGZkbXNqbnU5WXoxaWtCVWdDcFF6b3NFTW9LUCtl?=
 =?utf-8?B?bTNJZUo2Y2FabmlJdytEenZOL3haZ1dwYjFhbE9QdWZxdFh1c2lPdURPRzY1?=
 =?utf-8?B?NTdUK2cvcjlKSnpUbFMrellRY0Ryay9ma3BKNTJmL0h2cjU4SjRWbk5wbjZa?=
 =?utf-8?B?T1BVbFMzRUdCcER4QjVCMDlXSUJ3T2wxSHdQV0JabTJWdTZ6UUorbDJsdnRy?=
 =?utf-8?B?VEt3ZEszWklNeXgxcmJCU0U1QWVROUtROW51STZDRG1BSElPSnhGQlUzYVo5?=
 =?utf-8?B?Y0tUSDE3R1FLK0FSYXg3enMxU2xiRmJYbjk1RGRzS2NBcFVzTXhMNmpQK0hw?=
 =?utf-8?B?NFZpdnNlcmtEVkJES01CL05mUVRFKy9FcU8zUUV3MHBaUmlDbi8rUHNvZEZj?=
 =?utf-8?B?SmxHaEU5T3ZiSmszYmhZQTNjZlVlRWRaVEZxbGUrV1Y4a05aS1MvZmdmdzBm?=
 =?utf-8?Q?FAAoITP6lj/cc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlpSb2NBLy9scS80cW5NcmpCWVRpajZBaDFpK2VuSTlqNVpJVDRvRzAzKzli?=
 =?utf-8?B?eE5xSk0xeGxXNE5DYjZnZ2tyNWVibm1BTHFNSkU1MlZDRHYycC9EdDlQNXRy?=
 =?utf-8?B?Q3hvNzlQSnFsUkFhNElFdUtiZ29wWDlyQWgrNk9kVk5qaG4wU0FKSTI2VDJj?=
 =?utf-8?B?VVFNS290d09UWUdub3ZrcHFmY0QyYjZlQno0SHo3RHdLNXc0eGhmOVZiS0FC?=
 =?utf-8?B?aUFuWTY1S2FqQTJWY1VodDdmVjJYQkxyWWRFT28ybjRGU2F3OUwvOVd5Ry8v?=
 =?utf-8?B?Q25WUzh4T0FSelUzU1lOR05GU0Qwcy9GRkoyek9vV0U2OWJERWJvSloweVRH?=
 =?utf-8?B?aCtsMUFJYjJVRW1LdW4zV2NhbmdhMnUyNXNmY3JQL1pzd2NUUUs1cyt5QzhJ?=
 =?utf-8?B?ZXRHN05nMGZJQ1hIdXdHb2dBK3Y0ZWNkTWdQRGZZTHpUaW5LbG9OdDhEeFJG?=
 =?utf-8?B?cDI2WkpMMTdPS0hYL2NJNmgvbGpNSG85QWFRNGRNZ29oaENVLytqT1NOMGxr?=
 =?utf-8?B?RjNyc2w4SnJzcmMvNURJT0hOeFpwZitTRHpMdlYyTExFSVZEQ2NwbDIvZEY4?=
 =?utf-8?B?L3QzeGlXdlRadnNTT1BTUzg1VllKYi93dmJpN2JDUTRYOVd4TFM5eXI5aWcr?=
 =?utf-8?B?Yk9idUlkU2FpY0NOU2R0Mkh2Nk15Y09vQ2ZJRFgzNnVFY243TndKTDFlTkdq?=
 =?utf-8?B?UHdrSzJoL0JwTTR0ZzF0c1JGZXRNRDlLZHh0YkNROGtSR0duSlU3WGFNQUpX?=
 =?utf-8?B?d2hHUGd3WVV1MXdGakZpeW9PQ1AvUUJ6ajdnaUJjSFBvSUdGZytUTVE2YmUy?=
 =?utf-8?B?elFmRVQyZW5reXppZndyRDhqb3JIaTJBdXNFR0R6VFNYWTgwWnl3VDUvNCth?=
 =?utf-8?B?U0VGQXVUejA1M0YxbUZJejZRcnVoaVlyTGFla2kydFlVK1FsNmFYN0toeGtI?=
 =?utf-8?B?RGhBalUvM2t4V3A0Z0IxODl5U1phRnJYNWdNMi9NVzd5OW0xL3BEaEpydmZJ?=
 =?utf-8?B?Vkt5UUFMeUhtL2VLSFU2MXZsVkozd3MwdmVBSTR1MlprclI0SnVOR2dKVTdL?=
 =?utf-8?B?YndwWG9zZ2xzMWlRcjZOOXlKU0dtMC9uMmRWTTd3TUhvbHJLZGNRSWppem54?=
 =?utf-8?B?ZmtLN0M2OGdnRnppZHJ2b3FuTHFtM3ExREY0a1ZGRkN2UndvU0xwcWU2cVJk?=
 =?utf-8?B?SzY5dmp5cXNLamh4dWV5RDAzeFQxV2hFVTduTXNHRjc0QWY0SjVza0Q1SVVv?=
 =?utf-8?B?NHA2UC9RSVdBOUN1TzlQcXIxbjEzUWo1NGFlTzd6SnBham1DQm15QlBVWlN1?=
 =?utf-8?B?azRUd2dBdkJQN0hYbThjeER2WXBHY0t1NE55WHdMM2l4azBSaXpGRGx5TVpH?=
 =?utf-8?B?bTJTU1VEUlhJSklhOUM0Rk5kLzZ4dGNrR1lzbjYyWS9NcDhXR21EOVFQaXhK?=
 =?utf-8?B?RDRBa08zZmp1RnFqM2JKb2czVW5OSlhFUVdZOW91anlyTFNDQ1pWTjJwUGE2?=
 =?utf-8?B?a2s3dUZPcGZJZUlZYjBJNDFhT2Z1VEVNaFlxUVpqUGVWTVZCbjhaL2g5WkUx?=
 =?utf-8?B?UWJQWUwzZmFjSlhtZnlFK1NNTjRZTXhUVzRNVjZEQ1c0ZXFXcnN2TkRkUlFl?=
 =?utf-8?B?RlE3d2l0QWRxdXNramlCUGpQYk5BWHRzb09ZNEJwSXRZZDVIMnE2NUhuMEpY?=
 =?utf-8?B?blhlanhJUlhVdDV3b2R0c3NNYlJiY3RLeDFzdUpXTXFYS2dndmZKdEwzbFpU?=
 =?utf-8?B?aFA4cWk2cXREVDZTemUwVnJXZmg0V1VJNEN5Q281U3lSVEYxZjBQT1I2MXpX?=
 =?utf-8?B?MWpCN2JCTDdzUVFMNnhlanMxeFZUREswM1FxUTZrcCtrM05OQ3NyN212S0E5?=
 =?utf-8?B?eEZNSHR1Um5kVTdKRmF0Z3VXdEQyeFZHZk9RVHhZbHUzOXI4SHRabXZWbDJO?=
 =?utf-8?B?M2Z0VThCbDU5S1R3REE5QTk3YlB3NTJKUy9vMHNzc0xGRHhsbXF3OHBIV0Y1?=
 =?utf-8?B?V2h2S1VOQmVxMGV1Z3BQbTFJRHJtUVdIUTJvZSt5eG9xbFFrb1dMdHQraDRs?=
 =?utf-8?B?TTJKN0xVVFRKOVlaS3dGenJLejUwYUllbTNBWHk1Q3E0VG9ZUk5HVXBxWVA2?=
 =?utf-8?Q?x2zw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f0620e-d55f-4d0e-43c3-08dd4684dc68
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:04:20.5733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccr9p+vqzESyYapIvLygLJRNSJtBka/wnvnUmhq7v1mJR9K1//7GWTofbNRsGPIf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7539



On 06/02/2025 02:08, Stefano Stabellini wrote:
> From: Henry Wang <xin.wang2@amd.com>
> 
> Currently, users are allowed to map static shared memory in a
> non-direct-mapped way for direct-mapped domains. This can lead to
> clashing of guest memory spaces. Also, the current extended region
> finding logic only removes the host physical addresses of the
> static shared memory areas for direct-mapped domains, which may be
> inconsistent with the guest memory map if users map the static
> shared memory in a non-direct-mapped way. This will lead to incorrect
> extended region calculation results.
> 
> To make things easier, add restriction that static shared memory
> should also be direct-mapped for direct-mapped domains. Check the
> host physical address to be matched with guest physical address when
> parsing the device tree. Document this restriction in the doc.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Acked-by: Michal Orzel <michal.orzel@amd.com>
This patch has already been committed (see 0a0f30c1b55e) and later on fixed (see 988f1c7e1f40).

DO NOT COMMIT.

~Michal


