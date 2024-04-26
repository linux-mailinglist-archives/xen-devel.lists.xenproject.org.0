Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5918F8B306D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 08:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712436.1113136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0F6Q-00014L-H3; Fri, 26 Apr 2024 06:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712436.1113136; Fri, 26 Apr 2024 06:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0F6Q-000129-Dx; Fri, 26 Apr 2024 06:30:34 +0000
Received: by outflank-mailman (input) for mailman id 712436;
 Fri, 26 Apr 2024 06:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9cwh=L7=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s0F6O-000123-LK
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 06:30:32 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e88::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a2c156a-0396-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 08:30:31 +0200 (CEST)
Received: from CH0P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::30)
 by DS0PR12MB8785.namprd12.prod.outlook.com (2603:10b6:8:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 06:30:28 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::2a) by CH0P223CA0013.outlook.office365.com
 (2603:10b6:610:116::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.29 via Frontend
 Transport; Fri, 26 Apr 2024 06:30:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 06:30:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 01:30:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 23:30:27 -0700
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 26 Apr 2024 01:30:24 -0500
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
X-Inumbo-ID: 7a2c156a-0396-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6Rua/Fv/9YrkTAoHd/lWzjuQS1Z3dkk7Z7pq0+oQRxc3Pwa0ANmy8t/tglBJDu9bJmRescbvX2T/naBq1deyhRwPz/zqv8nNGs+YnBkRYsHFkXdiQlj5SGVHfYDtZTKs3CgyXxVZNenJs6KzjQbQDN7GmTsOXMXrZASWkgj636J2t7vGupbXSUNVRwZTRm2v+QzAt4SuXfLUzbbnWPRLoubfF0b5FDpPdOQG2Qv9uQTUNXsOYmYtmboEJFVNwKETJqVIRX9WXhjZrmJSCgal08p15GdP0qnrFHz2/Ky1VwIrVbPX2vbkpBND5p5Ns7kYUbHFJgisBUmaStxnAF9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJO5mcHwdPaiF8pZ44dYl57wpjCjF4DE9swaQwsptfo=;
 b=fwxiPQcxMt8Lyv8j0t0Vsau0lLxhCjb0bnqrPoQKKf9od6PVZ2ovUeGizoU2Lbtj/0eETTh3jjtURTvxIK3EkUE28nbx309FlQg2YpmoLh9DYsBLNDtvRVcAHvSWpfzKsw4jq+quYLx4+cdcmZL0eKXqEXNWvJrj0rzsppyzXToxlfoDhzkJ+5x31sgvCgouLxPw+tyCOfVUy/KSpVEla93PjFNzsfcJCXJUToNkpOeTI8hFcpTb74NMcZDZfsaCZXTF9dOrqdjQhejaoVenoSHowLj0wugzaj1rKRw+0ac2Tr7p6lycGakowH2ZZKJ3GtSSxKOsFCDza8XK4FBs6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJO5mcHwdPaiF8pZ44dYl57wpjCjF4DE9swaQwsptfo=;
 b=dT4kzR1AhXYFYc0JO7n18iTXbifld6CoxNMwDipkC22mBi9sD6PF2yjkV/77dmtjNIw4Vjl9U3e0dJb4DNSOkvxNAj+HumIboS9hHelYjGCFCtYowqseIQqEuDuLIujffXeXS+wZirctjB14Eo2hf+CtDbACmlFR2vgKmrOtMWk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c49cbaef-101e-444d-b202-2f1f34beb390@amd.com>
Date: Fri, 26 Apr 2024 14:30:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN
 key in HVMOP
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alec Kwapis <alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-3-xin.wang2@amd.com>
 <3af4f1c7-9059-436b-9449-94bd7aad9eed@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <3af4f1c7-9059-436b-9449-94bd7aad9eed@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|DS0PR12MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: b8502ee3-d2f0-4490-6535-08dc65ba5d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UG9qbC96WVA3ckUyN3BtdDNDNEFHWkJKVm9IdXpoUzFZY0hOaVV6REMvQ3U4?=
 =?utf-8?B?WG5idCtQZUJXYjNwUEpFZWgyN1l4N05ZRUZTbjVkUzFZQm1oQ29ZM0sySUI0?=
 =?utf-8?B?Y01yckFlVjY3aEhvdXpNUlRIK3RTQm9JaUI0NFBTQjQ1MWorK3REUHRuL2pP?=
 =?utf-8?B?K3d3aGlTWTdRcG1WdkFVOHhWazJYdS9RM3hrbEkvZGdoMFdVLzBrRE92ZlZV?=
 =?utf-8?B?ZGpFVHBMcjNpeGNabHZBelZVUTdUcTRjOHlQay8xVllLdlFNalZ4SCtDL3RI?=
 =?utf-8?B?U0l5emhXSUhiRXhiNzhVeWdZSjZRelM0em9UZm5hcytSNmF1WXVyTkJsVDhy?=
 =?utf-8?B?NFpTZUF3bU1VL2RRMkZ5TGVaejZDWThJRUJZV2JkbFFYQkdsQ3FiTUE3TGtQ?=
 =?utf-8?B?c3BMOGlDQ2g3ZjBZUzR3dHhPQ2hUOTlZbDlMRVBpV2lVRno0NWwzVnZaM2pK?=
 =?utf-8?B?WFJkWm9rbjArd0MwQncyMDBadkxKeDlyMEFVdjJvemQ2dk0rdVFLUmNlT1lP?=
 =?utf-8?B?N05sSWN0aXRxT283eWxEYTRwZ3BRZktFNmx0S3BSUG5PU3FRNFVRZ3BjY0ZZ?=
 =?utf-8?B?Q1VpLzdXa3NSSC9Jd0F1RCsyeDY0QWQzOUVFTnQyamJzY3R0c0M5aW96K0wr?=
 =?utf-8?B?UFJ6NW1kU3lvSU81M3htaXg3UFM0bVlKTElEaEJYN3o0YzZUOTNzUGIwMlQw?=
 =?utf-8?B?WHRLZVRIR20ycHBZakNuVkplK0M2UzJXS3V5M0xqNzRaYm1aN2dtYWpJN2hv?=
 =?utf-8?B?RUZKSVRRL2FPSmkrVVJ0TmwyMjlhdHQvY3djNzd2L0pteTJqQ013akJuM0xX?=
 =?utf-8?B?WGtHbGsyaGZXSmsxNEJXNmFEcjhrQzZQLzhzYnNNWjh0Y0lpWUo0OUNMUXJ2?=
 =?utf-8?B?c0FnbVR4Uk83WDlQWW9Td3JWOGQ5Wm5MbDM4UGYvVnBLWGJPVG1scnh0U1VQ?=
 =?utf-8?B?R24rY29qSldyU25YSEVjN1JYZThoRmNzSzMwNnlxT1pnRk90dDhLMXp5cUNn?=
 =?utf-8?B?NmFvVVlYM1h5U2JPSHMxVG5ldUtuU21TSGN6Q0E5dldIRGZWZzNlaHpaTEhC?=
 =?utf-8?B?dm53c2UrNFJXTXlqK2JuODRhUXNhNU5oMW9nbzhFckRUUEF5REUyQytwRHB3?=
 =?utf-8?B?dmRSakxqZk82UHZpOGJOQkVicXZqbjJpd1JVcW52bWIrb1JnaXhsNGt0ODlT?=
 =?utf-8?B?MWdOT1hSYlR3Wm1jNEpxcHZ1MmxnaTNsY2sxYzJUNEZ1TWJFZFhGTHdOVUxL?=
 =?utf-8?B?WmsrT29WdjVXaFh4L0VLbm9BdU0zcDRDbDBiYmd5SXVTVy9wc0xDY1J6N0hr?=
 =?utf-8?B?NHBKZnpOc1NSc3A2UGoyZkp1VVF0ektTWVFUa1dKbGJmV2E2eHdiRWZmb1JP?=
 =?utf-8?B?WTQ1aFJId3htSFJzUnA0M1c2dFBLT1MwWWhSRlBGeFJ6OUNHcU5pZXNBY0Fo?=
 =?utf-8?B?UDBmWFlsa0VpeThtM1NsOEZZcDEydFQvTjBFa0EwL0J0NjcyZ2IwcjFDcExq?=
 =?utf-8?B?RXdVM042dEg4UGZGSFVMSHEzOFJHdVJCdXFGTm5jRnJFWEJOMzZlWDFUSEVQ?=
 =?utf-8?B?T08xQ2ZPZTZxNEFmMnVFT0NtZ2xLSTEvRE8ydE4zVXY2ZjRsRG1abm0vNThV?=
 =?utf-8?B?Y1pXNFlhdkg1dmJnWjh5NkthUEVyVXM5SmVkODNpU1BOUis3dkwzQlFkY2pW?=
 =?utf-8?B?MkxBUmFuOG8zZTRVYk1nUTAwM0Q2NzNDL04vS2tnU3VBRllWY1pPdE5NOCtP?=
 =?utf-8?B?NVB0TDNYOEhBN0hUa0dFWVE2eUxZb2xYS2RqM2xnaXM1SW9mS09leGExaC9M?=
 =?utf-8?B?aVE0UDZYY2VmckVDMi9VUHkxZHBsb0kwM2p0d3djcTdQRHlETWVtVnZXZVlP?=
 =?utf-8?Q?CHGbAQ0/n3y1q?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(7416005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 06:30:28.2032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8502ee3-d2f0-4490-6535-08dc65ba5d41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8785

Hi Jan,

On 4/26/2024 2:21 PM, Jan Beulich wrote:
> On 26.04.2024 05:14, Henry Wang wrote:
>> --- a/xen/include/public/hvm/params.h
>> +++ b/xen/include/public/hvm/params.h
>> @@ -76,6 +76,7 @@
>>    */
>>   #define HVM_PARAM_STORE_PFN    1
>>   #define HVM_PARAM_STORE_EVTCHN 2
>> +#define HVM_PARAM_MAGIC_BASE_PFN    3
>>   
>>   #define HVM_PARAM_IOREQ_PFN    5
> Considering all adjacent values are used, it is overwhelmingly likely that
> 3 was once used, too. Such re-use needs to be done carefully. Since you
> need this for Arm only, that's likely okay, but doesn't go without (a)
> saying and (b) considering the possible future case of dom0less becoming
> arch-agnostic, or hyperlaunch wanting to extend the scope. Plus (c) imo
> this also needs at least a comment, maybe even an #ifdef, seeing how x86-
> focused most of the rest of this header is.

Thanks for the feedback. These make sense. I think probably 
dom0less/hyperlaunch will have similar use cases so the number 3 can be 
reused at that time. Therefore, in v2, I will add more description in 
commit message, a comment on top of this macro and protect it with 
#ifdef. Hope this will address your concern. Thanks.

Kind regards,
Henry

> Jan


