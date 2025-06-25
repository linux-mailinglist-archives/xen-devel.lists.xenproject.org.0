Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7749CAE7861
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 09:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024390.1400281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKS0-0005DE-I7; Wed, 25 Jun 2025 07:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024390.1400281; Wed, 25 Jun 2025 07:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKS0-0005Aw-EA; Wed, 25 Jun 2025 07:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1024390;
 Wed, 25 Jun 2025 07:21:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxbR=ZI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uUKRy-0005Aq-Tj
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 07:21:43 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2009::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a3b48ee-5195-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 09:21:41 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by LV8PR12MB9155.namprd12.prod.outlook.com (2603:10b6:408:183::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 07:21:36 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 07:21:36 +0000
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
X-Inumbo-ID: 0a3b48ee-5195-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nB+KLDcsuank98k9rUrhn7djY2iY3pRDMs2joCDWGGZPctdFvS5bFYyEkVabHa5c4dTlNps9SRmQfIVSV/azaWYGvPmPByjmalJEzAnMIH/Axfzh4K6ISp5kaijPGa1ZlRdRo/QXjZOq2xMzTEkNFKuCqu4NxqmZLnoHraKKeB7SiDCz8JRVAp4nxAQEnkPprtVGb0pqGVQ/oQJ/epXZmt/3ymd6m0Aylw6dcqsRWwA8o/ablnPZX0hFURhGAA/PTPgHtp2Jv8UjtK28OVeinyk2zLabPxlYZrOsPt1TypnVvNTcvlNBZop2BFigeXetOESNxLIEtIO48hKm4OSgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gonRy1FaP36eKCrWW86Ilg4H11Yign/dP9BjkpiZdZ8=;
 b=EcsF0lTr7RKXj7h6lO6e30pbncSPPFTdqL3gMKi/dOfJ/9pR4W3sGtCtvYH4laJoSHauTczPljeZdigw8QMV04qaEPejcFc2vuANIIMM1u5GSUrzy3wxrD3WMwDIZ9zny1Sh498gf94qQ3M1hvYTTNVG4vsv6Q0WZVBE4MLTNXEYJPajc6SGWsfcHKeEgYMKf0iguUvkdedkq92PTfek29+fwceUPRyZaqXpeVjVbb26isexIV5nfoiP3GVE7qeoY3CZxMwPFpapt7uKAH+DJCYJvt7/yScj7NoRW7IkpPus46qQuBBDpgltUIU6mmncFJfGQ2hmMC3zBFHYEnJ2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gonRy1FaP36eKCrWW86Ilg4H11Yign/dP9BjkpiZdZ8=;
 b=KIy8i6ENDHFPKZkiUR4jszHorOwm+SoK1K9GIBhNauc40dtY4FNmKsrumY06bVXur3QR/TlRo0CQiujLRZSMVb5UZUcTi8GC0a+YvRamlCbOH/0erROV5g0VaRt8M2Mvy/+dboQG74Tp64UpR4cQbuoEvnWxqkHReIUUm1x3Q1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <22990854-7048-42eb-b48c-5f79115e8170@amd.com>
Date: Wed, 25 Jun 2025 09:21:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/16] arm/vpl011: use void pointer in domain struct
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-6-dmukhin@ford.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250624035443.344099-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|LV8PR12MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d93572e-1863-407d-0f89-08ddb3b8eb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cm4yNVBFL0RaVEViRTJpS0NlWUd4SitVakxrZ2xvdi9zN1RNRGkvTXl4ZlA0?=
 =?utf-8?B?NWZiT0RzR3pmNzUrODEwZ2g4MTF3azlnOVk5Yy8zZjJJMDVLUG5CRGo2dmhD?=
 =?utf-8?B?Q1hyb052RTFCdWNpVnh6eHZnRFVNYW56UzVaTFVuU0Z2enpJY1ZjOW9VZlNF?=
 =?utf-8?B?RW83dVhKNWdYYUxUNXVFbXJ0NGJpSVJBemFMcXgyUzFjbzZrOUtmQ2l0bDYr?=
 =?utf-8?B?dXoydVpBK3lFYkt3THRycG1JNVU4eFp2b3hmZlhGdEJtbi9CWVBmSUxDVUo0?=
 =?utf-8?B?ajFKNkdWU2NTdW5KeGVEOHRaU1RTOENYMlJyVlRidFUwK1NIRFJDb2ZKSFBP?=
 =?utf-8?B?TDlINy8rUGxvNUdMREJPOXdPN0VWZE1xWVpxNmFKYjVzNktkU0ptallTTXVj?=
 =?utf-8?B?VXBzc2Mxa1pONEZ0dmZvVFNIY0NNN3BBd3dQQU43MG9vYWNhRVVxV0tKZUJJ?=
 =?utf-8?B?eGs0L1p5Nklrd2NQK0lQeDZEYzlJemZKa3pjMXZTb0xwbDdtZDBlbnVhQ0F4?=
 =?utf-8?B?MWtlbXhKLzVmU0NFdGFhRFh6Sy9VNjRPczROdDYxOFE3SjlKVDFvTTEyRm5M?=
 =?utf-8?B?S1J4VGNiQXB0RVRaa09EckNUbGl6SDFoNlhReWJKT1d2NWpYTVd2cUpNV2pR?=
 =?utf-8?B?aGl0WEdrdGtvVnArQnNvWUxINHgwVlg1dTNmSGw0T3VUeDR6ZXV0VFovUFBm?=
 =?utf-8?B?VmJuU21aSjJhQ3IyVHp0OUYzbkNKZ0RIbjlRa05uNXBSODFocnlBNkZZY1By?=
 =?utf-8?B?aUExUHhiblhuNGRISXBrZlliZG1NMldQY2xaYitYWHhCYW1GYWd0Ymh5UGJP?=
 =?utf-8?B?N1FvNFpPS3ZaSUJaaHJTelBNUVhLOFdVZEFpczRFWkVXYkFWTzl6TnB3K3JO?=
 =?utf-8?B?ODcydEkwZ0d5OEFTdXNBN2dIWnJtbk1RY1d0ZFdTL2NtRDZSc0dPZkY0S2NX?=
 =?utf-8?B?V3JWd0U2Qks3M2hsVXJ4YUdJaDc1UFFvdVdRVEZvU3B6YTZCSzNWSWIrRHZr?=
 =?utf-8?B?UEt3SGV2cko1UmZNajBVb3BhRFBSdUJLeE5BdFF6WUUwcFN3ZXFWU3ZONlla?=
 =?utf-8?B?MjF2OWlCeFdoRCtaQzdjcHFIYm01S1lMcklMUmdjWnl2NTlUbTFTQ0ZFdnZ2?=
 =?utf-8?B?eDZ5UDQ4RjBsZ2FNV3ZqR0g0QXd0djZuSzVFSGRIZHZuNVJSOG9peUZibmtM?=
 =?utf-8?B?b01PMHJOOURCT3J3SVNnelFWc29ZUSsrVFRIWExGN3IxcnUxRTZVSHJhOWRT?=
 =?utf-8?B?eVp5SHE2QnNSMVBTL1h2dkkwZXQwb2lURFZ5Q3JLQ0kxalNLdnhQWXU3T3Za?=
 =?utf-8?B?ckVxOHVNT054TmFScURBSFpPa3g0eVlMVUs2S3RyRk9JYXNLOVVWb2ZQNXZW?=
 =?utf-8?B?VDM1bjc1YS9XRVEzSmN3SHpEKytKQzdUQlREQ2c2dTlzQzhFRUFuMGFXUktl?=
 =?utf-8?B?NDFWTEZWK3BlSDF2TC80ZVAvK2NPUytYZjhJQndkczJJUEZLU2lZU1ZDcUhY?=
 =?utf-8?B?Q2tRdDlmWXRzVGQ4V2lmWFlKSGpma2JXUDhNSWJweXMrUVhyQzJRR2l1WXkw?=
 =?utf-8?B?c2QrS0hCdVAzVXBnZHd0QktvSzVVTXkwWTAvb2NYb1dnSUhiN01xMUZlcm55?=
 =?utf-8?B?REVndXN0dkFIYXlXUUxvbmFvSGIrams1eU9kWHRaSGFCSUJiakVzQm1hZkJk?=
 =?utf-8?B?Q1BIbk5nYnNxbDRJcktkeGxNRm5hcjFwZnAzRjY4ZGIyWVJ5em9QMEdCT1g3?=
 =?utf-8?B?N0xxQ0pJY0JuenBiSVZYSVk4MWQzOVVLdGJubXhWcWJqb0xjYjRFb3pJZ2RY?=
 =?utf-8?B?bUpIaS9tcGFJOXpEa3R3Z3JTRmRJR1BwV21Rdm9hdHhrQW41am9GeFk5VUtV?=
 =?utf-8?B?ZThaSUVzZXlVNXR4TW5FaFFqZFZlVXZ1VGI0Vno2QVNnTGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE1ZTXVObGl6eXVvTllOZ2pYbXZ1NlZpTWg5SktuOHR5TUc4aUtabXpEcVR3?=
 =?utf-8?B?NEpHOEFZN3hKcXF0d1dWZnltRnBiR2JWL0Z3bCt6cFhDTmR4VXYrRWhjUW4x?=
 =?utf-8?B?WWxVTVV6WU43VGswTGYvT3g5TlczTUVidFJoS2NsMzEreVlmRjZoTDFnZmpq?=
 =?utf-8?B?SUwvbmpTZzJKNHE0UXZuaWZwZWlrREg3NFdiNWFhUDNBZVVHMGpmL3JkQ2tY?=
 =?utf-8?B?bm5KMTFrc0hGd21sWk1ZUjl2c2Y4K041TW1vc01pTkFwVExOZ29UUWsrSElm?=
 =?utf-8?B?ZUZQU3JhSGF0TFQ2Z28zdTcrZE5rb0dPdEk3Sk9yNkJsbVprWWNRbnpvZGht?=
 =?utf-8?B?ZmtTRlQrL2lkc1VkWVYySm0ydXJQeW41QzdVZy9jRzN0WGZSMEtkdHZwM0J5?=
 =?utf-8?B?cDd5MDFxa0lJaENldXpQUWRxVkw3WnNsTFFPRzV1NXdPcVRGS1A2ZG0yUlN4?=
 =?utf-8?B?NlQzWTRhRFByRXk5U3krb0R1UVBNTXJacU44bEVhS3NVYlJyZkJCcTFuWEpK?=
 =?utf-8?B?alloZGhJVWl1dHBnQlFqSkZ4TkRSdlMxOUx2SDNoYUFyR2psUWcrNFBpS09L?=
 =?utf-8?B?N0pVdkpXWDgva2lqVHROUjNIR2gzZ1piVzRVcUxHRlF6VFZaQlFvdldYcDRo?=
 =?utf-8?B?b1g4YUVGV2RNZkxvWWNaS1JGa3YrT0tRR1orbVEyUks1SFVEaUpCWFFHODdH?=
 =?utf-8?B?RHNhMjFBeEZvUll6K0VvZmxwcDhFMFc3RkhHM0J4UmtaTDgyRHYxempXakF0?=
 =?utf-8?B?Q0hGSGlqMklQVkdCWU5YVnVVUk94L1RWWks1cGRTaWREYVpqcXR2dUdGbStO?=
 =?utf-8?B?bG9ZeXRzQTNPRjJTOEhuQ0ZGeDk2TVdsazhyUmRYR0JpOVRneENrYTIxNGhv?=
 =?utf-8?B?bVdKdnNPd2ZZcUVwYU9XSWZ2UlVCempQQ0wrQjhoTEtuV3ZNbVVNY3ZCNzY2?=
 =?utf-8?B?amFzN0ZOQWpaSSsrL2RNWTc4SkF3SWhNSkJ2dkkyWVlQRmFmaTJyOHBwTjNo?=
 =?utf-8?B?L3UxdjZJaTNtazZUYUpmWkd5TVBNRkl4WVY2SWpOVWN6c2k3TllEUDg3OENt?=
 =?utf-8?B?MmdsY0hXOGo5RUxGT1p0SHM4N0RqS0dFL1lodGp0cGczMCtWcGplNTdRdTNW?=
 =?utf-8?B?eXVBVlZCN2NqTCtDQXBUOHVxSmZwMDN2ZnB3bmNndFN3YW1Kbi9EcDc0a0Yx?=
 =?utf-8?B?QzE3enBiY2d4MEpIQXRSa044YUFmdnVBQnoxN0V1c1ZFeDQ2QWVGZUh3N09L?=
 =?utf-8?B?S1FiYjNZUjJGUFZ2K01ZcVg1bXNqZ3k0ellJWjdqSkl2WldJS25SUk5pN29y?=
 =?utf-8?B?LzlYTW1JdmRjd1k1MXRwSkZrcTlyMENMK1hTdzlGM0NsYzg1M2lRdVppcG1Z?=
 =?utf-8?B?MU0rSTFkOGFmcWhvVTJIVXkwYVBFbE5BNUNubDJtcHVqeEc1YkZUQlBCUUwv?=
 =?utf-8?B?dkZick1wUEdjYzNHNnQrYmpqb2REQlRNZnFmaHp0ZUZPUGxXY1RocWNjblVh?=
 =?utf-8?B?WDNaL1BmaXRwYjluWnhPVGJwUytmRkRYQ0VwazVmWUlYbVVtVU5ySHYydU1a?=
 =?utf-8?B?RlY4azZVQWZPS2dMSitVNDA2bmc5K01mUDZ6b2gvRjJVSHlnR3UxWFNnZkc3?=
 =?utf-8?B?TjRUcG9NM2UvV05vcXdUR2p2cGRtSDdWNVprU3NzaWxpMjBmYVQySkpqZ1Fq?=
 =?utf-8?B?TTJ0VmRCOEdQWUFtTHRBQ2JjRytYOG5qalVoaXhKRm1sSERUdVdhYisxcE0v?=
 =?utf-8?B?L0tIbFZJZUttcEdleUZGVUVwZ0I0NklwTDVOQUY5UDRzNm1kQ0xxc056ektI?=
 =?utf-8?B?UjJVZXZpYjJCTzFmaTdMTVExUkJ1MmZ0L0lxcG56dHFlbnI4a21RY0FvVWF1?=
 =?utf-8?B?K0FNMHpHcmVqV3Y3YVI4WGZWWUpCUXdXenJCblFtdG1ZNnM5R0V2UEJzajBl?=
 =?utf-8?B?Tm5nZE1EaXlWbHNveG9hcXRDN3Fla1BVYmNDckJVVXBqUWRUelB1NWNzVjlF?=
 =?utf-8?B?TEFmbVVnS2xVcUpXd1h6NndBRjRQNEJhVlQvMVYxUDFQeDJkVG8vMlI0OFF6?=
 =?utf-8?B?T3pueW5UVHJWZ2FZQVlSN1QzT3JkbE9wcCszUEsxYUdXeHNZZWZ3bUtUTExW?=
 =?utf-8?Q?nDe2IIXibXgH4ZAL2PzhitzP3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d93572e-1863-407d-0f89-08ddb3b8eb7d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 07:21:36.5092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvAwCWoyqLzlbIcP0dKTh5/pb+PDzFqOx/hBFCbqt5DdobLVorrsXreIQUdNNsqx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9155



On 24/06/2025 05:55, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Switch to using void pointer in domain struct to reduce compile-time
> dependencies for PL011 emulator.
I don't understand the rationale very well. Could you provide more details?
Why can't we keep struct vpl011 in domain struct given? I would understand the
need for void if we used a single member that could map to different vUARTs
depending on selection. That's clearly not the case. If it is just to avoid the
header, then I don't think we need such churn.

> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/arm/include/asm/domain.h |   3 +-
>  xen/arch/arm/vpl011.c             | 139 +++++++++++++++++-------------
>  2 files changed, 79 insertions(+), 63 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 746ea687d523..2ee9976b55a8 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -9,7 +9,6 @@
>  #include <asm/mmio.h>
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
> -#include <asm/vpl011.h>
>  #include <public/hvm/params.h>
>  
>  struct hvm_domain
> @@ -114,7 +113,7 @@ struct arch_domain
>      } monitor;
>  
>  #ifdef CONFIG_HAS_VUART_PL011
> -    struct vpl011 vpl011;
> +    void *vpl011;
>  #endif
>  
>  #ifdef CONFIG_TEE
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index a97c3b74208c..3c027ccf0b4e 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -22,6 +22,7 @@
>  #include <xen/console.h>
>  #include <xen/serial.h>
>  #include <xen/vuart.h>
> +#include <xen/xvmalloc.h>
>  #include <public/domctl.h>
>  #include <public/io/console.h>
>  #include <asm/domain_build.h>
> @@ -31,6 +32,43 @@
>  #include <asm/vpl011.h>
>  #include <asm/vreg.h>
>  
> +static void __vpl011_exit(struct vpl011 *vpl011, struct domain *d
Names starting with '__' are reserved and forbidden by MISRA C rule that AFAIR
we accepted (don't remember what rule exactly).

> +{
> +    if ( vpl011->virq )
> +    {
> +        vgic_free_virq(d, vpl011->virq);
> +
> +        /*
> +         * Set to invalid irq (we use SPI) to prevent extra free and to avoid
> +         * freeing irq that could have already been reserved by someone else.
> +         */
> +        vpl011->virq = 0;
> +    }
> +
> +    if ( vpl011->backend_in_domain )
> +    {
> +        if ( vpl011->backend.dom.ring_buf )
> +            destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
> +                                    vpl011->backend.dom.ring_page);
> +
> +        if ( vpl011->evtchn )
> +        {
> +            free_xen_event_channel(d, vpl011->evtchn);
> +
> +            /*
> +             * Set to invalid event channel port to prevent extra free and to
> +             * avoid freeing port that could have already been allocated for
> +             * other purposes.
> +             */
> +            vpl011->evtchn = 0;
> +        }
> +    }
> +    else
> +        XFREE(vpl011->backend.xen);
> +
> +    xfree(vpl011);
> +}
> +
>  /*
>   * Since pl011 registers are 32-bit registers, all registers
>   * are handled similarly allowing 8-bit, 16-bit and 32-bit
> @@ -43,7 +81,7 @@ static bool vpl011_reg32_check_access(struct hsr_dabt dabt)
>  
>  static void vpl011_update_interrupt_status(struct domain *d)
>  {
> -    struct vpl011 *vpl011 = &d->arch.vpl011;
> +    struct vpl011 *vpl011 = d->arch.vpl011;
>      uint32_t uartmis = vpl011->uartris & vpl011->uartimsc;
>  
>      /*
> @@ -81,7 +119,7 @@ static void vpl011_update_interrupt_status(struct domain *d)
>  static void vpl011_write_data_xen(struct domain *d, uint8_t data)
>  {
>      unsigned long flags;
> -    struct vpl011 *vpl011 = &d->arch.vpl011;
> +    struct vpl011 *vpl011 = d->arch.vpl011;
>      struct vpl011_xen_backend *intf = vpl011->backend.xen;
>      struct domain *input = console_get_domain();
>  
> @@ -140,7 +178,7 @@ static uint8_t vpl011_read_data_xen(struct domain *d)
>  {
>      unsigned long flags;
>      uint8_t data = 0;
> -    struct vpl011 *vpl011 = &d->arch.vpl011;
> +    struct vpl011 *vpl011 = d->arch.vpl011;
>      struct vpl011_xen_backend *intf = vpl011->backend.xen;
>      XENCONS_RING_IDX in_cons, in_prod;
>  
> @@ -199,7 +237,7 @@ static uint8_t vpl011_read_data(struct domain *d)
>  {
>      unsigned long flags;
>      uint8_t data = 0;
> -    struct vpl011 *vpl011 = &d->arch.vpl011;
> +    struct vpl011 *vpl011 = d->arch.vpl011;
>      struct xencons_interface *intf = vpl011->backend.dom.ring_buf;
>      XENCONS_RING_IDX in_cons, in_prod;
>  
> @@ -284,7 +322,7 @@ static void vpl011_update_tx_fifo_status(struct vpl011 *vpl011,
>  static void vpl011_write_data(struct domain *d, uint8_t data)
>  {
>      unsigned long flags;
> -    struct vpl011 *vpl011 = &d->arch.vpl011;
> +    struct vpl011 *vpl011 = d->arch.vpl011;
>      struct xencons_interface *intf = vpl011->backend.dom.ring_buf;
>      XENCONS_RING_IDX out_cons, out_prod;
>  
> @@ -350,10 +388,9 @@ static int vpl011_mmio_read(struct vcpu *v,
>                              register_t *r,
>                              void *priv)
>  {
> +    struct vpl011 *vpl011 = v->domain->arch.vpl011;
>      struct hsr_dabt dabt = info->dabt;
> -    uint32_t vpl011_reg = (uint32_t)(info->gpa -
> -                                     v->domain->arch.vpl011.base_addr);
> -    struct vpl011 *vpl011 = &v->domain->arch.vpl011;
> +    uint32_t vpl011_reg = (uint32_t)(info->gpa - vpl011->base_addr);
>      struct domain *d = v->domain;
>      unsigned long flags;
>  
> @@ -439,10 +476,9 @@ static int vpl011_mmio_write(struct vcpu *v,
>                               register_t r,
>                               void *priv)
>  {
> +    struct vpl011 *vpl011 = v->domain->arch.vpl011;
>      struct hsr_dabt dabt = info->dabt;
> -    uint32_t vpl011_reg = (uint32_t)(info->gpa -
> -                                     v->domain->arch.vpl011.base_addr);
> -    struct vpl011 *vpl011 = &v->domain->arch.vpl011;
> +    uint32_t vpl011_reg = (uint32_t)(info->gpa - vpl011->base_addr);
>      struct domain *d = v->domain;
>      unsigned long flags;
>  
> @@ -518,7 +554,7 @@ static void vpl011_data_avail(struct domain *d,
>                                XENCONS_RING_IDX out_fifo_level,
>                                XENCONS_RING_IDX out_size)
>  {
> -    struct vpl011 *vpl011 = &d->arch.vpl011;
> +    struct vpl011 *vpl011 = d->arch.vpl011;
>  
>      /**** Update the UART RX state ****/
>  
> @@ -576,7 +612,7 @@ static void vpl011_data_avail(struct domain *d,
>  int vuart_putchar(struct domain *d, char c)
>  {
>      unsigned long flags;
> -    struct vpl011 *vpl011 = &d->arch.vpl011;
> +    struct vpl011 *vpl011 = d->arch.vpl011;
>      struct vpl011_xen_backend *intf = vpl011->backend.xen;
>      XENCONS_RING_IDX in_cons, in_prod, in_fifo_level;
>  
> @@ -614,7 +650,7 @@ static void vpl011_notification(struct vcpu *v, unsigned int port)
>  {
>      unsigned long flags;
>      struct domain *d = v->domain;
> -    struct vpl011 *vpl011 = &d->arch.vpl011;
> +    struct vpl011 *vpl011 = d->arch.vpl011;
>      struct xencons_interface *intf = vpl011->backend.dom.ring_buf;
>      XENCONS_RING_IDX in_cons, in_prod, out_cons, out_prod;
>      XENCONS_RING_IDX in_fifo_level, out_fifo_level;
> @@ -644,11 +680,14 @@ static void vpl011_notification(struct vcpu *v, unsigned int port)
>  
>  int vuart_init(struct domain *d, struct vuart_params *params)
>  {
> +    struct vpl011 *vpl011;
>      int rc;
> -    struct vpl011 *vpl011 = &d->arch.vpl011;
>  
> -    if ( vpl011->backend.dom.ring_buf )
> -        return -EINVAL;
> +    BUG_ON(d->arch.vpl011);
> +
> +    vpl011 = xvzalloc(typeof(*vpl011));
> +    if ( !vpl011 )
> +        return -ENOMEM;
>  
>      /*
>       * The VPL011 virq is GUEST_VPL011_SPI, except for direct-map domains
> @@ -670,7 +709,8 @@ int vuart_init(struct domain *d, struct vuart_params *params)
>          {
>              printk(XENLOG_ERR
>                     "vpl011: Unable to re-use the Xen UART information.\n");
> -            return -EINVAL;
> +            rc = -EINVAL;
> +            goto err_out;
>          }
>  
>          /*
> @@ -684,7 +724,8 @@ int vuart_init(struct domain *d, struct vuart_params *params)
>          {
>              printk(XENLOG_ERR
>                     "vpl011: Can't re-use the Xen UART MMIO region as it is too small.\n");
> -            return -EINVAL;
> +            rc = -EINVAL;
> +            goto err_out;
>          }
>      }
>      else
> @@ -707,12 +748,12 @@ int vuart_init(struct domain *d, struct vuart_params *params)
>                                        &vpl011->backend.dom.ring_page,
>                                        &vpl011->backend.dom.ring_buf);
>          if ( rc < 0 )
> -            goto out;
> +            goto err_out;
>  
>          rc = alloc_unbound_xen_event_channel(d, 0, params->console_domid,
>                                               vpl011_notification);
>          if ( rc < 0 )
> -            goto out1;
> +            goto err_out;
>  
>          vpl011->evtchn = params->evtchn = rc;
>      }
> @@ -725,7 +766,7 @@ int vuart_init(struct domain *d, struct vuart_params *params)
>          if ( vpl011->backend.xen == NULL )
>          {
>              rc = -ENOMEM;
> -            goto out;
> +            goto err_out;
>          }
>      }
>  
> @@ -733,7 +774,7 @@ int vuart_init(struct domain *d, struct vuart_params *params)
>      if ( !rc )
>      {
>          rc = -EINVAL;
> -        goto out1;
> +        goto err_out;
>      }
>  
>      vpl011->uartfr = TXFE | RXFE;
> @@ -743,50 +784,22 @@ int vuart_init(struct domain *d, struct vuart_params *params)
>      register_mmio_handler(d, &vpl011_mmio_handler,
>                            vpl011->base_addr, GUEST_PL011_SIZE, NULL);
>  
> +    d->arch.vpl011 = vpl011;
> +
>      return 0;
>  
> -out1:
> -    vuart_exit(d);
> -
> -out:
> +err_out:
Labels should be indented by one space.

~Michal


