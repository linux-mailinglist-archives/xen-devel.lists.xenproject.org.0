Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC463ACE205
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 18:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005731.1385144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMqlI-0003Pd-3w; Wed, 04 Jun 2025 16:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005731.1385144; Wed, 04 Jun 2025 16:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMqlI-0003Nv-11; Wed, 04 Jun 2025 16:14:44 +0000
Received: by outflank-mailman (input) for mailman id 1005731;
 Wed, 04 Jun 2025 16:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/xQ=YT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uMqlF-0003Np-Ug
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 16:14:42 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [2a01:111:f403:2416::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 038db770-415f-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 18:14:40 +0200 (CEST)
Received: from DS7P220CA0058.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::22) by
 DM4PR12MB6133.namprd12.prod.outlook.com (2603:10b6:8:ae::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.33; Wed, 4 Jun 2025 16:14:36 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:224:cafe::50) by DS7P220CA0058.outlook.office365.com
 (2603:10b6:8:224::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.32 via Frontend Transport; Wed,
 4 Jun 2025 16:14:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 16:14:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 11:14:35 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Jun 2025 11:14:33 -0500
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
X-Inumbo-ID: 038db770-415f-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOxm7/JMk7hRVq01wVdPUm+RhxTw7uD+Wnu/nHXFKL9PVPinddFR1Zz7tx98lXtkektc84dx9y5KhdWpSpc+MN4aRngHzZYSWoo23z/rUyWMYEflt6o3b7cdrmOz3GfxIgwm02YfvKNuZ9IzuBxrHs19+wXYAFkj7FN1D0mt/aJMc2TUDUfKbyyAD8vb/gJ91gPty8Qgyv+rSavAK8Q5rIxs4NqnG/cY70QeTMaa9lmTKJjrVl12h5Y+iDnl6eE7yfpKxcog3IYfRvMfhNU83q+nE/OooaXaOYYK6ihAzv1CV19h4Gzf2RPkqxxICYun2AfS2i7WmtmGG/XBkGGxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSOJ6meNppqIJCtLKD1Winmsj/qxt0d4kcfO69cMtAo=;
 b=IYajzAh0DhBxwgTtDiho7j/3035nlyJvymyClvv7b0SVaK96+pEr3NQbwd7XcMqFiXhqGdbPGyz/XLcVFBmopQAWqOVU/CvdJvQ1s7Y57N9QKDLEVSzerzmxiQVWfwONZT1VjnqypEuKlRexPrPeyOQG3foZ3d4K3c9tDgm+PM9L+g4eUCn3NiYugz28P+JAhSf1Ev6D6M+htpB9PZVyaTufD7BsDv5CuB1TWBHN3SqOSA7rUa/1ncYLlzRtjbrd1pWha/Zm2RHnNZ0nETVvice5sRG6xngTyparLUTqAqmeNp4hE91JjQDtTBhzVCh7sW4KvXo+hL/Twlzf1AwNmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSOJ6meNppqIJCtLKD1Winmsj/qxt0d4kcfO69cMtAo=;
 b=goB+FOLTZV3FEBJ2w2Uxq+xanal4eebS6Ju+NhGy6vSMVdiew7iQM9DznWTUG/+5ydNfaVAN9jsdAcLr9Pd7FJKIn/fptNgOrrnD2l68iugmYZYI71yx7LRRjEGg+KcgaKF8fmj7yzrAdMDMiLzxgFoej5XQ74ygnB7IygbZCXU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c6e91b58-ea4f-4ea2-a820-bad97cf19306@amd.com>
Date: Wed, 4 Jun 2025 11:42:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] docs: add documentation for Argo as a feature
To: Teddy Astie <teddy.astie@vates.tech>, Christopher Clark
	<christopher.w.clark@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud
	<persaur@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20250528211040.10562-1-christopher.w.clark@gmail.com>
 <f05fb94f-91ba-4abe-b59a-c14e25388e68@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <f05fb94f-91ba-4abe-b59a-c14e25388e68@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|DM4PR12MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d242c3-8b10-49ae-b954-08dda382e645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1FTbURjR1FFMVlqWnJqa3hXVUsvRlJselZtRGJiWE9tQytac0daWW9RUkZr?=
 =?utf-8?B?TmFQSGpRRThVcGd4YUE5L29HWFlrUUh6Vm5ndmcxNkdFOEFRSTBSNEMrOHJh?=
 =?utf-8?B?LzZJbGplVkVaaG5rdEpLRTBnVzlXQW9jckRxYUFMVHFPYTdMOWVRN0FncmZD?=
 =?utf-8?B?ZG1PSnU3VVhjVnlsWHRmWSt2d3pORUZONXVFZmUrSW5PRjlKNm1jeWFVM3hk?=
 =?utf-8?B?eWdHSjM0V1FUbGFpOHNHeTRoWlM2NkJnYXFyQnQ0YlF0bytlZVZ1dDNFS2cw?=
 =?utf-8?B?LzM3d1lGNGQ3UGxseC9FSXdqdWFLZExIRnVKOHhBdmxRTCtxUzFXRDhjeWIr?=
 =?utf-8?B?R0xjNnRRZjI2Y05LWk5NbEV5ZUZycklMQWVva2NtczBCR2x0eTFjbm05MUNl?=
 =?utf-8?B?N0hnK3JOK0EwL0ZFTDVlMzdQMUlzK201T3hJb0tUQUM2UDN0Q1B4RVUzY1F5?=
 =?utf-8?B?czIrYm1PWEpYbThIVTgzWTRBczlYS25vMTk0VlVXdlpvczJxay9MMW5jR0RU?=
 =?utf-8?B?VHJsbm9UMVpYVEpLVWFoWWpkNU5VK3Q5ZVdsS1dXYWMrMFZMMDJRSGZCenBm?=
 =?utf-8?B?cDFWeEJBY2ZFUWg4cEpETGRCQ3J2ZnFkYy9RMkg2MFVsclFTdFNaaVRQR2xR?=
 =?utf-8?B?ODFRWEZmM1pac215ZjBwNEttY0RKREladURpM3BCb1B3SHJhNUdNY2l3UFZQ?=
 =?utf-8?B?T0RhbVVlT2F1MXp3Z2xheTZXS2tpT3FBS2tyeUZFdDYwVFJTRytzQTh2SFZW?=
 =?utf-8?B?L0FkSVVlQy9UYjVHdEp2d0JYRWViY2lLLy8vOEFGV2cwcFF6bUcxc21EdSt4?=
 =?utf-8?B?NEV4Q3cwYTJ1UlQzaWo2ZEt5dVg5YnNqVXc2cWlUNWZxSmZPa2dMaWZJUDdC?=
 =?utf-8?B?YXlWNUJqWW5WaGRXM1pUZDlaU0JPODU2M3hCOENGZkMzUzlQNW1kZnFaaHJ0?=
 =?utf-8?B?N1I0V3NhRGdRdGxMZDltNnk0N1duQnBiL1E3NUJYeUNpRUdncFVBK0gyUXRK?=
 =?utf-8?B?VW5BNTRsNFhFOCtwSzRwR0IwbUlnNEhzTSs4TUx1NlJRNVh2TFZzajdZVUd4?=
 =?utf-8?B?RzIrS0pZbVBLVHpHQmZEbFBudEdMM3pvK1o2alc1bVJUTkdxOFV2alpKeUl5?=
 =?utf-8?B?dXB0Y1ZISWphOEx4QmlHb21mejRLVWxYcFdmVnlteHFaa0FETm4yZFpFQVIr?=
 =?utf-8?B?TDkrU2JlNmFtUEI4VU8vbjhzQ0lGN0xNaHFTZXA1RGZEdUpkTmhnTjkxV3Fy?=
 =?utf-8?B?ZS9XTzhVeUxNYjE3YnY0ZGxhSGVqeW1qdlYzYUl3cnpTTTQwdFY1Y0VCeGlY?=
 =?utf-8?B?aVVnUlUrKzA0c2JDYVo3bDZqYU1ZOXdhYzlJTUlXbld3aVM5d0ZuN0NzYmFu?=
 =?utf-8?B?bXVaTVgxVlRKTTF2UlJzVE8xS1Y4dTVHVzFmVUt5VGllR09ib3BqV3dWZFlH?=
 =?utf-8?B?SnVHZS9LeWZRTUJpL1QrZThwb3JJMmovWUFYOHp0SnZHVE9GQUVhT2FYV2Ir?=
 =?utf-8?B?aS96YW5IUWppUWVMZ3R3Nm1Hb1Vwc3lJejBYendaVXdMY04zVXRjT2htdHVL?=
 =?utf-8?B?SXRCUERqRUh3RGphcDJLNFJSVjFOL1R5dk16cGkyR3FLajg1anY3ODVkcE9v?=
 =?utf-8?B?NHhPS0kwZ2FRVEt1OUtzM1ZjRlF3Lzd6OGM3aWtpSGFiM0V4QUtacGJsNXl2?=
 =?utf-8?B?OWJoTEc0alp4SDg2U1Y2YUx6dXJTUTdRQm9UN09BOXlZNW1DUG9sNlRoMm9o?=
 =?utf-8?B?b21hY0VDdzQ1WmZiUkh4ckxnZXorNDJRRFhNK1dvZGdpeHhxazlrSVBTWTJ0?=
 =?utf-8?B?K1FBcXhOZDV3RjFOUWdjY3BmU2NXd2liaWJ4ak5Oek9WQjc0eU1FeWFRM2Jy?=
 =?utf-8?B?Tk1ZRVdWMmZiNEdoOG5XS3NCbmYzTlJnN2hDRHRIam15SkdsRitjUmdWNUVO?=
 =?utf-8?B?U1pYQUdnTGdiWG9wMFhIeE5WMCtmVnNFaDhjcEJSb2l0QTVYRXlvN0hDM2VT?=
 =?utf-8?B?bk55allTS09BPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 16:14:36.0080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d242c3-8b10-49ae-b954-08dda382e645
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6133

On 2025-05-29 18:40, Teddy Astie wrote:
> Hello Christopher,
> 
> Le 28/05/2025 à 23:13, Christopher Clark a écrit :

>> +## Argo and VirtIO
>> +
>> +References to design documentation for the development of an Argo
>> +transport for VirtIO are available via:
>> +https://wiki.xenproject.org/wiki/Virtio_On_Xen
>> +
> 
> Are there news regarding this ?
> 
> There is work done on virtio-msg [1], which looks fairly similar to
> virtio-argo (or at least, virtio-msg could work with Argo in a similar
> fashion to what's described on the virtio-argo design).
> 
> [1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview

I think this should be dropped.  We don't need a link to a design 
document without an implementation.  You can add it once you've 
upstreamed the implementation.

>> +# Known issues
>> +
>> +* For development: sysctl/domctls for toolstack to control per-VM access
>> +  to Argo
>> +
> 
> Is it regarding disabling the argo on a per-guest basis, or regarding if
> a specific VM can communicate with another VM ? i.e can the toolstack
> decide to prevent 2 guest from communicating ?
> 
> IIRC, in Argo, a guest on his own can decide who can communicate with
> him using separate registered rings. But I am not sure if there is more
> on that regard.

Yes, I think the existing text needs to be rephrased to be more explicit 
on the issue.  I can guess what it is, but I shouldn't have to.  I'd 
recommend stating the issue as it exists, and then optionally clearly 
state a proposed solution.

Regards,
Jason

