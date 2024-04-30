Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D698B680F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 04:52:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714460.1115705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1dac-0006uy-Ds; Tue, 30 Apr 2024 02:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714460.1115705; Tue, 30 Apr 2024 02:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1dac-0006sO-9y; Tue, 30 Apr 2024 02:51:30 +0000
Received: by outflank-mailman (input) for mailman id 714460;
 Tue, 30 Apr 2024 02:51:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H2uD=MD=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s1daa-0006sI-RH
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 02:51:28 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8905ecfd-069c-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 04:51:26 +0200 (CEST)
Received: from DM6PR11CA0049.namprd11.prod.outlook.com (2603:10b6:5:14c::26)
 by PH0PR12MB7906.namprd12.prod.outlook.com (2603:10b6:510:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 02:51:23 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:5:14c:cafe::ac) by DM6PR11CA0049.outlook.office365.com
 (2603:10b6:5:14c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34 via Frontend
 Transport; Tue, 30 Apr 2024 02:51:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 30 Apr 2024 02:51:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 29 Apr
 2024 21:51:19 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 29 Apr 2024 21:51:16 -0500
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
X-Inumbo-ID: 8905ecfd-069c-11ef-909b-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ken0uOiQKhrHy8zpsrY7FvOVMFm+AeQ4N/9xtEf9qcOxJhtRl2jzHxSN5f+yuSuptAJAs5gBPyiBk+uyN8+Vn7CgZkEKASUtqLNVxkhQBy+qFGGGA8NBR7si2yHOBaTzuB2+9ICjMmK9fizTcyjo+h/Of4XfOMiq7oY8xBpVA8BWY3HBzIJMf0WWxdc4j2ljD9qbuFW0VjTn1q2gmW9aFLNQIKwi7rgAu1dtzDtd0wi2SUuGYxuPjnvCu51Khp9Pc8X+ykrdPdV4zgz3yzhZgKbLzrBnr5RBH7fAXjeOsrBew+r86v53iUUczTgqWu1gwXhtsufX55UB60yLmmcRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnM9zowzY3hYxOZoruqgKyItj7CRlYGLq7jTRlTOv/g=;
 b=B84DYJ1eSMeu3gFug6IHG4Wqyq5xYjToS4iUsTzX/tWH2jrlNuJPHr9HarLJDkFi2YiaMpjP4nlyPTLoKBuDF9kNlQkSRVghA4G3FVpd+c88w8hr0JKZQ80eytXKIw55UgkBTP7uPGrJ1ahm+mfWCsS6iNChzoFpvmeqvqLFxU46NImhlyVOD6J4lsCQsa9bydvrEuFKU4BvbbfY0I/ZuUfrSnLlfRqC2stR1gPH/gsBBG3rLXSWS+2Y2UY0mJbjkgpsyBWtnEZAt9IgqOvvsU2nIFZPHwx9TtkBtLHSdFwcxKmIrRs0HiGMOj5xz7QmICOkUcFDw7QeEvqydh52dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnM9zowzY3hYxOZoruqgKyItj7CRlYGLq7jTRlTOv/g=;
 b=4azxxFhgFNrk3jA45j3gvOx4rvaKACpCLAKcVXC4I7iYS16fRpQQKv9QbZLGRuh2uneXFpGGkoKFL+H16L+fR7F3VF78ytaHBPSxbMf6lttN2A2V0m/RWPO/IsW9lN8luyN3kp+CVKb3Rg1YkG//g5I3JsEtWqjHxMgYSf0JszE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8f543eac-a686-4298-a677-c984fe5230bd@amd.com>
Date: Tue, 30 Apr 2024 10:51:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN
 key in HVMOP
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
	<xen-devel@lists.xenproject.org>
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-3-xin.wang2@amd.com>
 <3af4f1c7-9059-436b-9449-94bd7aad9eed@suse.com>
 <ce942d72-f214-4043-bf61-9d124c0bca64@apertussolutions.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <ce942d72-f214-4043-bf61-9d124c0bca64@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|PH0PR12MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f44ede-e7f1-44ab-f7fc-08dc68c06b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400014|1800799015|7416005|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXI1OHRvZldUTW5GOVJob0p4QXBWTk9MdE83TUl6M1ZHenVOOEc3dVFOTFdQ?=
 =?utf-8?B?dnVFcUMzOGUzWGdJSDE0RDBZazZ0WlZmb2ZtUmRJNVFkZWU1SnNFMXBRK0Qw?=
 =?utf-8?B?TVJueHpnVGo3M1Urd2NLdmpDa1hDWWFWRHd5a0RpU3F5SlZCZEZBRWZOZ3Bi?=
 =?utf-8?B?U2puSVh1aldJWUdQRFQ2d0RDb0FFMlBjYUFxWnFNMGlMdkRCUEpKcXpQNUNK?=
 =?utf-8?B?Wkh0TFlXYytQTUdnNUg2SHhjZHN5R0pUSUJ1VGhqeHRSZGJDS05IeHVxdTFW?=
 =?utf-8?B?V3RmblhrQS9uZUlRSG1KMHFQcXI2TjA1ZjRVc2srR0ZzSHBXM1p0elFlVldN?=
 =?utf-8?B?SnFmbzdwNFVPN1VleWI1T29GQWdaZXYzVUFOQnNmMGV6OG5sU2JmKzVZZ2Ja?=
 =?utf-8?B?bVFNNHR5Tk55YXFJZnRkM0h6aFFKNjgwT2I0bCtlaTBUOEVGZGcyNkNTb0d2?=
 =?utf-8?B?Q0Erek56Sm44ay9UYUlnN21LWTJ4NU1NMlZBc0tBUEZKVlJRaHV5MDV3MlJY?=
 =?utf-8?B?Wkw4dGNZcWtwMi9vajFWSGF4dW4zMWQrT2IwdDVBU0hFOUNDN2hsbFFIWlJ4?=
 =?utf-8?B?NXJUK25oZDBhd2lwTTRYMjhQdkpPOFBGVDZSUmY3c1VIOW9PdWM5WlErbVR1?=
 =?utf-8?B?VVVxZ1dER3FmN01FZ0l6MUhiMzZFWUNrRlZvNDJHWnZUaEFlSW1aOGMwM1Q3?=
 =?utf-8?B?dXBYNlVkY1liVHh1VGE4dm9OWVF2Qml4ZjJrVnBUT25SWHl4TE1sVm1Qa0Y3?=
 =?utf-8?B?eW14eVFkMUU0WWN1OFhHb25qMDJrYmdkYnlRWGF0Ti9nQm96MlpKZFJqeDZ4?=
 =?utf-8?B?ODRWQW1JVDczWS96VGFQc2dVbVhOaG5vQmlSNndJUHZvMGpBWnBDckd4aCs4?=
 =?utf-8?B?ckI0S3BhWkQ2MUszc2xRSHZNcUQ2UHFMd3h6ekw4d0N2bzdVVVc3cnlyajZC?=
 =?utf-8?B?dkhIZldmUFVUL3hmQ3ppNjN2cFE4U3NEdG1WZWNoWDJGc01KR1VCYUttY3Rl?=
 =?utf-8?B?MWtrMjB4dE93SHFkMVovSVhNMUorajRjZnpCV0FaSkJpbWdqRmo4NDRGdVFR?=
 =?utf-8?B?dXRMTUdFbTE1TEFxb1pPRHI2VXBMWmljeGd3TndsaDBJM2Z3VnBLd082R2xo?=
 =?utf-8?B?UjZUanVNdVdJUWxySWRRMUJrNVYvV2JRYzF1bnJyTXJoMmRHOVZ1ZHc3aUdB?=
 =?utf-8?B?RGRUZjZjblk1MnRKWXhpMGNORVBYRTh6Ry9yZUFhWWVOdkJXSkJ3cXAxVU4y?=
 =?utf-8?B?dUJxU1NkSDV0MlVqa0JuOVRZSmF3UHpkemM5RHJwWDcvMHZPcmZWTW5Deitz?=
 =?utf-8?B?V1k4ZTNwaUV2MFVmTE1kMXllOGptY3NBMUhrd1NJTFlTY25kZXl1SEFtdkk5?=
 =?utf-8?B?b1BPSmgycFFBemZyTDlSbURiNWhYRHg5UTgxNTlabFdXN3o0WGJ3dUh5eXVF?=
 =?utf-8?B?d0ltVHQ3Tlo5VllSd3ptcHd2NHo4dDlYS2ZRQ0dWTTJ6azFSWGcwU1pVQ0g0?=
 =?utf-8?B?dzBGSS9qMkdjL01WQXRWZlBjc0NndzZlYSt1ZkY1by9JL3V4OTg4SE9hYkx5?=
 =?utf-8?B?aXZkL29nbG50L1pMMlNhdjBNcWpnamtDNml1R0MvYXI2dkdKSjRncEcrMTlh?=
 =?utf-8?B?UmYyTEcrbnNLV1hXTzRDOWpOV2wrUWZiYWV3UFBqOC9tK2pSeDVnZjltL1I0?=
 =?utf-8?B?Q0svU0tqVTZ0THhUeGRtbjUraFgwMXMyTWV2Y0tGUXpVMXdMUU1jTUZPd1ky?=
 =?utf-8?B?NlM0dVhBK2swa0p3MGI3TlVUMXdEUVIxYTZsdlRiSWc2N0tHUEU3bitPcEhU?=
 =?utf-8?Q?Qu4WLiZq0bumE8E19MOIm0gCCNvdLzRUVOjyc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(7416005)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 02:51:22.6502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f44ede-e7f1-44ab-f7fc-08dc68c06b90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7906

Hi Daniel,

On 4/30/2024 8:31 AM, Daniel P. Smith wrote:
>
> On 4/26/24 02:21, Jan Beulich wrote:
>> On 26.04.2024 05:14, Henry Wang wrote:
>>> --- a/xen/include/public/hvm/params.h
>>> +++ b/xen/include/public/hvm/params.h
>>> @@ -76,6 +76,7 @@
>>>    */
>>>   #define HVM_PARAM_STORE_PFN    1
>>>   #define HVM_PARAM_STORE_EVTCHN 2
>>> +#define HVM_PARAM_MAGIC_BASE_PFN    3
>>>     #define HVM_PARAM_IOREQ_PFN    5
>>
>> Considering all adjacent values are used, it is overwhelmingly likely 
>> that
>> 3 was once used, too. Such re-use needs to be done carefully. Since you
>> need this for Arm only, that's likely okay, but doesn't go without (a)
>> saying and (b) considering the possible future case of dom0less becoming
>> arch-agnostic, or hyperlaunch wanting to extend the scope. Plus (c) imo
>> this also needs at least a comment, maybe even an #ifdef, seeing how 
>> x86-
>> focused most of the rest of this header is.
>
> I would recommend having two new params,

Sounds good. I can do the suggestion in v2.

>
> #define HVM_PARAM_HV_RSRV_BASE_PVH 3
> #define HVM_PARAM_HV_RSRV_SIZE 4

I think 4 is currently in use, so I think I will find another couple of 
numbers in the end for both of them. Instead of reusing 3 and 4.

Kind regards,
Henry

>
> This will communicate how many pages have been reserved and where 
> those pages are located.
>
> v/r,
> dps


