Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32498B4FD9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 05:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713809.1114686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1HoY-00071n-PF; Mon, 29 Apr 2024 03:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713809.1114686; Mon, 29 Apr 2024 03:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1HoY-0006zV-MZ; Mon, 29 Apr 2024 03:36:26 +0000
Received: by outflank-mailman (input) for mailman id 713809;
 Mon, 29 Apr 2024 03:36:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uSuK=MC=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s1HoX-0006zP-Q2
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 03:36:25 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a563a93f-05d9-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 05:36:22 +0200 (CEST)
Received: from MN2PR08CA0005.namprd08.prod.outlook.com (2603:10b6:208:239::10)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 03:36:18 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::a9) by MN2PR08CA0005.outlook.office365.com
 (2603:10b6:208:239::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34 via Frontend
 Transport; Mon, 29 Apr 2024 03:36:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 29 Apr 2024 03:36:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 28 Apr
 2024 22:36:17 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 28 Apr 2024 22:36:14 -0500
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
X-Inumbo-ID: a563a93f-05d9-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWo+SP4tmkNaEldymWIF370aX4NVqaeh9WP88gy5w9qZ44tDivJbIiqe8+3F7seUYg4hAlNR5v81f4ButcaMXIyfbRmZWyGQ0gAx0WNGlmu4rYSuolYBLbChnDpkPIKl7LfJImsdFOR9MU0wq/CDZu0YnPVGwIvFNehAwi386dLkPhavgJ16DvkqRJTq9QgeJWoVHFQKXi8+Mi/mmIX31n28Uply1KgnEmwu7lvfrhpTW4YhrNOtlkIRkCxgJeAlRXxSRM18PT8ZpHjPabs+P/0jRW5oSAaODQoZbqR9lXSRg76c3n7IVKfuLxwRRM4NxQqmX9fdCpR7xwpcWS8Gaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KR2o27fZSEuoKaueE9YEOWjPvoqPgl0eotZZdzHPH3I=;
 b=bdnZWf7aM4ID5F5gnI5/lsrmA+nMgQGuPt3Ms7PO//ek7jWgarwQLYYQlVpsm76imfgvZ98DCG63lQFUG0JQ0WvITvy+7SCCgnxfmqs72RxpD7yA/3SPJyc4+yqHN++5O5aifcfZHgFjGPqtaUvSqp3KnJO+ZYP+a59314D9AMQxudJusCWBgDLdK8uesWZRVuzMwGXPmbjTUlRW3lmP3juBDGrzbo3mOemRyo19r8W/9hf63eY3SXxMGbG6Jk5Nznfl3vAH8426DopozpWJZk5ugKLR28APuCFYUxGDWMFq0lJthqeV96NTAaXfPgvfy7xUjkgTRk0ejvaRGw05ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KR2o27fZSEuoKaueE9YEOWjPvoqPgl0eotZZdzHPH3I=;
 b=VJpyiaFIaLwgtxRhwyNzJNMZRjc7X9+3d1mdE+KRvh4LuDR4f5mxw/l1N32rlKKYJez96jG+9vu5Qkcg54xpuR3a+kG2nTFlczxTvP6B+++r36GkZlF6VpId5bwcVszuCONp+R/yxa92Ta0C1ehL5Ja0CQlrRnpTR8bmHPAgr6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <97a401ff-4b5c-4e6a-8d9c-e36305ec64f5@amd.com>
Date: Mon, 29 Apr 2024 11:36:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] xen/overlay: Enable device tree overlay assignment
 to running domains
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-8-xin.wang2@amd.com>
 <da67f90f-6807-4fdc-b65b-f7a4ba9f78ad@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <da67f90f-6807-4fdc-b65b-f7a4ba9f78ad@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d86a1da-f30b-46c3-e879-08dc67fd878e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|82310400014|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFZ3aUNYSklObUEwR2I3QS9NR1N4QlNqbkdLMFdXNFVoWGZYR0cxOU41bzRz?=
 =?utf-8?B?TndmcVk2YkR6cHlCb05VcjdPc3pMTjk2YXpjblU5cnlIejFrcFpVWWZ5NDVR?=
 =?utf-8?B?Qk1TdGFtamhhZW5vUG44NmVLNEYrMkN6cDZpeHNwYVZRTGpad05XbTVWNmJR?=
 =?utf-8?B?TmJpMjljVFQrWmNiZTNRaXZyN00xbUpMTkFrME5aeDhjbm9mbDE0eW81NTBR?=
 =?utf-8?B?K2c0RXNKSlM5U093SWt1ODlGbWdvaWdQY2VaNlcxTGhBZmFuQko4MWVldlZk?=
 =?utf-8?B?U1hkWjkwUHNWQmdrMXdGRlRxa3hWbXZnOEtvV3RTQmdDeEtCRXJzeWhLM051?=
 =?utf-8?B?UHRzSFFMVEg3MFJrVkpjclhEZ0h4VTBxcjlnSWJkay9HTG1xMWtyeGMrS0xa?=
 =?utf-8?B?Nm5RdEJ0VTZzc29VWDBESnZ1c0QrYXFjVEthVVk5L3NKSW9OM0dzRWlaNzZB?=
 =?utf-8?B?L0RwdnlSdnk5MjFGVUp2Tk00TWdNVGVlT0JXcmwvZnROZU9NTUw2VVZnellj?=
 =?utf-8?B?ZlZhYTlXQ2xIUDVLY2ZNYUFjRWZqRmU0eXJheGhKV1FJOE5vRDNkLzhrM28x?=
 =?utf-8?B?RE1FNHhSZzZCekd0TnF1OFVrUXFWQlViRTNVZktIa1ZMK2E5QXlQblUzcFlp?=
 =?utf-8?B?V0xOendCQTRscmlhYzROcStaa0gzTGRDMFB5SHdXck92eUFTUzhLanNRUDgz?=
 =?utf-8?B?Wm5EUTdKck5tRjI5S0FtL1ZUV21tQ1hMV2lrR1hXWCt1ZDRwRU9SWmVvZlpx?=
 =?utf-8?B?ZXVxMCthN2JBemhGd1ozVjVHYm03UWtsU3Y4QU91ZWVGVnQ4NzFkM283NWhR?=
 =?utf-8?B?cGJ4NTJEd1BZVi9oby9VTGlONWxzR1lSSlNETDNLZldHamt3c0FHMmJPeGlI?=
 =?utf-8?B?SFpoYlYzQzEyamhMV0U4VFJHMC80aTUvMUdKTndKTW5NbzVWaWoycS9icWVh?=
 =?utf-8?B?d1AwSDF3bG9XNXVoVnoyUUhHSDMyOER3MDdZVVB5T1IwaGlJQ2d6M2RHeWRD?=
 =?utf-8?B?U2ZNc1BTdlEvMWxyRVJjeFQyZEJNbG52TDV6cUF5YUQ0cUJMSmduNXFUcll6?=
 =?utf-8?B?Rk9jeEZJNk1QcVQ4VGJBMGh6d2o2N05DV1FWSEJvZEVkMU9xREk2Y1BzYVhB?=
 =?utf-8?B?Z1hlR2RQWXFmeEZDTkRiVlczWTN3bWxJVFdhdTRGaTFnZDhSdHgxRlpacHFO?=
 =?utf-8?B?VkZJSzF6N2VqN0lIckxkUE9naG5JWG8rVm5CU3FmWDI2dkczbm1hOWZRZlh0?=
 =?utf-8?B?Y2lGdS8wZGJ0elVmUFQrL2lvbzBXQ0M0SUUwam5oSS9SM0huWjNUVG9LaERK?=
 =?utf-8?B?c3gwUXh6NTIvYU1Wbm9Qbm9zdzYzM21HSlZJT0tMclBrMlByZDRramExMGFa?=
 =?utf-8?B?MG5kNWpOdjU4aFVQMTkrVi9oM2NNNTRvdXUyTGpKdUltYStrU0JEZFo2Q3hi?=
 =?utf-8?B?Q0N4L3JkV2ExUUlPWFI4L0JqTmE5d1QvZkM3ZEs0Y1ZZUThSUEl4TjBrR2NV?=
 =?utf-8?B?QWNRamp4OXVYM0s5bmdNOXNIQ1Iza051WEtBdWltQWZUaWZrVkkwWFExWUVI?=
 =?utf-8?B?clhSNnFHTzFHM1BOVGhPV3lzcVdSbUh4bVAyNnBrY2QvR3JyRHh5VUdCMG9a?=
 =?utf-8?B?Zng1TisrTDhwT2VJOWJKSXVVc3o4YTJFUytRbGJPaC8xbGlQNFdtMmlDb1Vs?=
 =?utf-8?B?TkJBaWNzTCtGQWtMWjU5MkVwQkcxaGlvbmd0aGNMVUZEandHWXhaeEM1ZndF?=
 =?utf-8?B?SGdmc1FKZXE1MlhWMUxQcWpvVzdIcHdwVk1XZkRNOGo4NzgvbUlCVzhKZmJh?=
 =?utf-8?B?elVBVnJzalliODdpbDVvdjdwb3dmWDNMbTNRUkF1YnpNZjhJOWloTEowZi9K?=
 =?utf-8?Q?5xn1gpXyOK5uL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 03:36:17.7975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d86a1da-f30b-46c3-e879-08dc67fd878e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949

Hi Jan, Julien, Stefano,

On 4/24/2024 2:05 PM, Jan Beulich wrote:
> On 24.04.2024 05:34, Henry Wang wrote:
>> --- a/xen/include/public/sysctl.h
>> +++ b/xen/include/public/sysctl.h
>> @@ -1197,7 +1197,9 @@ struct xen_sysctl_dt_overlay {
>>   #define XEN_SYSCTL_DT_OVERLAY_ADD                   1
>>   #define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
>>       uint8_t overlay_op;                     /* IN: Add or remove. */
>> -    uint8_t pad[3];                         /* IN: Must be zero. */
>> +    bool domain_mapping;                    /* IN: True of False. */
>> +    uint8_t pad[2];                         /* IN: Must be zero. */
>> +    uint32_t domain_id;
>>   };
> If you merely re-purposed padding fields, all would be fine without
> bumping the interface version. Yet you don't, albeit for an unclear
> reason: Why uint32_t rather than domid_t? And on top of that - why a
> separate boolean when you could use e.g. DOMID_INVALID to indicate
> "no domain mapping"?

I think both of your suggestion make great sense. I will follow the 
suggestion in v2.

> That said - anything taking a domain ID is certainly suspicious in a
> sysctl. Judging from the description you really mean this to be a
> domctl. Anything else will require extra justification.

I also think a domctl is better. I had a look at the history of the 
already merged series, it looks like in the first version of merged part 
1 [1], the hypercall was implemented as the domctl in the beginning but 
later in v2 changed to sysctl. I think this makes sense as the scope of 
that time is just to make Xen aware of the device tree node via Xen 
device tree.

However this is now a problem for the current part where the scope (and 
the end goal) is extended to assign the added device to Linux Dom0/DomU 
via device tree overlays. I am not sure which way is better, should we 
repurposing the sysctl to domctl or maybe add another domctl (I am 
worrying about the duplication because basically we need the same sysctl 
functionality but now with a domid in it)? What do you think?

@Stefano: Since I am not 100% if I understand the whole story behind 
this feature, would you mind checking if I am providing correct 
information above and sharing your opinions on this? Thank you very much!

[1] 
https://lore.kernel.org/xen-devel/13240b69-f7bb-6a64-b89c-b7c2cbb7e465@xen.org/

Kind regards,
Henry

> Jan


