Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF68B3106
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 09:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712469.1113199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0FbB-0001Qc-1f; Fri, 26 Apr 2024 07:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712469.1113199; Fri, 26 Apr 2024 07:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0FbA-0001OX-U7; Fri, 26 Apr 2024 07:02:20 +0000
Received: by outflank-mailman (input) for mailman id 712469;
 Fri, 26 Apr 2024 07:02:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9cwh=L7=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s0Fb9-0001O8-FY
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 07:02:19 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e96f9119-039a-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 09:02:15 +0200 (CEST)
Received: from PH0P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::21)
 by IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 07:02:12 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::b4) by PH0P220CA0022.outlook.office365.com
 (2603:10b6:510:d3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.29 via Frontend
 Transport; Fri, 26 Apr 2024 07:02:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 07:02:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 02:02:09 -0500
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 26 Apr 2024 02:02:06 -0500
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
X-Inumbo-ID: e96f9119-039a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cX9HKp7+nmlNy0q9lunXXgsfLcWwh9p9pzvZYUynotvXS4zw6y3Q4IYtn7Q/YbqUme114ilthXeGP8oNSAdGbGTyRqoR2vh6Udu+fPF6c0+JDqyYTEljruaxTSOjWxt6yoDkMq43m+uNAP8XUo6jSZZcZtx5MGyfa6/8AononameVJN2zHDsr+f9k1RbTNdpht61Nt9mfMa2vT0Dza6Ldku09xrupbFQj3ERdJjN0FaHsVnc2506Z8NhJG0OI1eVkd2wtWKn7TvX5ybhPIbF58YHMq0LJTYFjnkN617AY4jog5bYA+HFADbB0jt0KHRg3znb9Mz9zjCwHggre/vjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E391/ayyWUSlsp4QtaYTlN5MV1Nw+UTVTLOMKm4cHsg=;
 b=GPw/qu+rAoinyG06WX3lDs4rMkor1eWTyoxuK7wUQjFaI2ClBAKvejD4Gw+gy7ityjaHLgq1oRelHeY6c9+OBE56Pd5sjqIQTZJvvT1deTRgIgEoZAoSpeJ3O5+MW6G/D8X1aTRY3RJsoTwwfwgGC2zvEm4v3/mD2tPptzio1lIoMtW5oFLHq4CTFDwTA4HbEP8/QSlW5/muT5rBkdl6mOuboubypAowROgyAz7qYDtEcPSraY5bcB/96ST6cofgQuvHAuJaXmzCSg7i8M0A+T9o/kbWEGEUC9mNEAiPvEDvTciXJThj/9lqYDFuMMf5J5y9tGvI1+kDuHK7Zxo04Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E391/ayyWUSlsp4QtaYTlN5MV1Nw+UTVTLOMKm4cHsg=;
 b=GDdlSTU+h95KyywTlahGI09PikJ0WCm9g7S+uqONjSoVk+a/Qwv3sRZ/zPhyQWxf+pV+Kb4F4KpobT8o5Y0kNPULf1wippyvV/jiCl4/zcszLtFFgE9R37hjWrNkEcBFOB6CYdN7BCm7kAcGlpF3+O7ab9tDqm5D/s8kTbXtJGE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7d7dc2c6-ce22-4ff2-8bb2-3f16e1c2120c@amd.com>
Date: Fri, 26 Apr 2024 15:02:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN
 key in HVMOP
To: Jan Beulich <jbeulich@suse.com>
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
 <c49cbaef-101e-444d-b202-2f1f34beb390@amd.com>
 <9825c488-0acd-412b-894a-b683525b1592@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <9825c488-0acd-412b-894a-b683525b1592@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|IA0PR12MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dcf6e22-a854-4535-2e4b-08dc65becc1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWVxSXFBYVUwd253dWxJMmRISXU1dDU2QkVVM2hnb2VGTmQ0MnExQkZWT0E4?=
 =?utf-8?B?TTY0eFpVdGJ4d1NlQ0ZpU3ErZzY5M1AzV28yaEgvVWFqcDNCaXZtcXVPMXdQ?=
 =?utf-8?B?K0s5ZFlpWlN1Q1hPNVpFS3FYN3RpREpiOEtCSlpZbXY2R2VxL0krY2x6bWFI?=
 =?utf-8?B?cEw0cFRlWE11anRnNVpZVkJTVERMVC9uWHZubGVxWVVocEFSNzdiVnFJaXlH?=
 =?utf-8?B?dzYxZmtOZGIzTnprMEVOdzgxa0UyUS95QUwyaXJ3UHRVc2c2VklNcFlsZ2Ey?=
 =?utf-8?B?SHlxdFZPTjdYNTdWcHRsYzkvbXY2VnowQmoydkpMMml2VFJOK1h3bWlOSUI2?=
 =?utf-8?B?ZHhJRUF0Tlc0Q2l5dTdmL1dkem9VQTZ5ZHl1Q2xVVUJZZ2lxdTlnTGJlZkoz?=
 =?utf-8?B?VS8xZzJBMjdpTy9saGVuMUkrck94WjJqVTh4RXJmWEtCdHJiMXFQR3FFQlJW?=
 =?utf-8?B?RUh6VzgxbGVlMndxaWQ0dkEyTkk2VGdNTmZXVVNFRG9sQ0hOMHR3RDFwU1NL?=
 =?utf-8?B?TlErNlY5MFJxRXRiVFYrSDlNMzF2ZEpsT2l3T2NSS0dVZUptKy9BMEdKbWk0?=
 =?utf-8?B?ZkEvYjJLcDJvNHc5MzR0UzQxdmRKWWtTNkJHQUhGT1B1MFJoYmNJbU5sVHBZ?=
 =?utf-8?B?SUx6ZDBkOFF3b01UdUJtOTdQRVdVSUZBM213SmUzVVlYckxMVHdtamk1aXZC?=
 =?utf-8?B?OEdoeWpmNEV2NHBCOVpqTmFmQ1dmZ2c4dG14R2JrcjJ2Y2k0c01XYVpPOTlv?=
 =?utf-8?B?SUNRdFVFdUJLSWJTTXNhN0NZSXNKQ2c3YnpqTnZPMDFoTmx6dWdZY2ZFWlhL?=
 =?utf-8?B?eXFrS1llR3phZnZDQ0tZc3k2L3kwMCtUbFhHdE1ZdGF5TVFiRWoxTWxLbHpF?=
 =?utf-8?B?YWl0UG1jTmhVcEZMbDFOLytmOUdGeFdaYUxiZEFadm5ZUkk3bVdFNTNGNEp3?=
 =?utf-8?B?bEp3SGZBZ3AxYzB2RzB1c1RBWlYrZU0wQ0lSTGNUU1RIOTFwa29NWGY0cVF0?=
 =?utf-8?B?WkV6VjRBTkxnU21FcFJtTUZOelZ5UXUrRnhnREFlQUpiQmpUV1YwU05QOVo4?=
 =?utf-8?B?SHdCMlNZTXlEM2Rsck5zSUoxbHdQZ0cwTEQ0cXo5M1hiSDlUeTE1UGxQVjZs?=
 =?utf-8?B?TGdUQk81Q00yaFBRck0yeG9KT2dCR2pxdlRiUXFrUGh6RUo2NVRPeXk0K3pD?=
 =?utf-8?B?cTRMVEVtMDRWMkUvdWFmTXdBM0VPRHlBWm9TL1FobzA1dUJIa2psVHB5ZVl6?=
 =?utf-8?B?ZWs0N21pT1BWMFNrUUZEb0lsdURUZWRiSmwvWStSTFg4cTN0dzZRd1BQVzRu?=
 =?utf-8?B?YlJzZ21XVE56a2kxODFab20wSkx3ZTdZQU9YcGE4WkthRnZuQkpTUEZXdFVJ?=
 =?utf-8?B?TzRYK3N2a1FGbkk0MjdNL2FZYUluM0I5S3c2OXg5b3hLTVVaNHYvN1VvOHpZ?=
 =?utf-8?B?OGh0bmhkZ08yVDJ4WExmU2hiRGtHei9ISWdWbkZ3ZVV1TFlhekdHNGFuQjI4?=
 =?utf-8?B?SVdxbDRMM3Y4S3pSWDdVVUZSMFp3aDk2ak5zSlgwVk9xaVFHVW80NU9uN2lj?=
 =?utf-8?B?S0RUN2J3dW5tVFpMU2ppcHJaRU9mK1lHTWtrSEs5UU1RQ1J2aWdRc0gxWm4v?=
 =?utf-8?B?TnU4dXJFbHJYZjRSL3d3cmx3UHd6K3E0aVNCTU5KUzBreXdIbERUSGtPZkhu?=
 =?utf-8?B?alRvN09XTVc5Smk3cnZUdzhuc1NOL3Uzd214OVQvcnRNcTZhNWc3c21qRExM?=
 =?utf-8?B?R3Z3U3VKOVh6TTZJUkYwNnV3aGwvZk04dG5MdnAzQ2FCY0JEaFg4dXczYStQ?=
 =?utf-8?B?eEpaQXNYbEVRdnl3dFozcm52dVArUndCb0RCYTE2UVFURmhnd28vYUx4c00y?=
 =?utf-8?Q?0FyP6sxx/TcpU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 07:02:12.1264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcf6e22-a854-4535-2e4b-08dc65becc1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8374

Hi Jan,

On 4/26/2024 2:50 PM, Jan Beulich wrote:
> On 26.04.2024 08:30, Henry Wang wrote:
>> On 4/26/2024 2:21 PM, Jan Beulich wrote:
>>> On 26.04.2024 05:14, Henry Wang wrote:
>>>> --- a/xen/include/public/hvm/params.h
>>>> +++ b/xen/include/public/hvm/params.h
>>>> @@ -76,6 +76,7 @@
>>>>     */
>>>>    #define HVM_PARAM_STORE_PFN    1
>>>>    #define HVM_PARAM_STORE_EVTCHN 2
>>>> +#define HVM_PARAM_MAGIC_BASE_PFN    3
>>>>    
>>>>    #define HVM_PARAM_IOREQ_PFN    5
>>> Considering all adjacent values are used, it is overwhelmingly likely that
>>> 3 was once used, too. Such re-use needs to be done carefully. Since you
>>> need this for Arm only, that's likely okay, but doesn't go without (a)
>>> saying and (b) considering the possible future case of dom0less becoming
>>> arch-agnostic, or hyperlaunch wanting to extend the scope. Plus (c) imo
>>> this also needs at least a comment, maybe even an #ifdef, seeing how x86-
>>> focused most of the rest of this header is.
>> Thanks for the feedback. These make sense. I think probably
>> dom0less/hyperlaunch will have similar use cases so the number 3 can be
>> reused at that time. Therefore, in v2, I will add more description in
>> commit message, a comment on top of this macro and protect it with
>> #ifdef. Hope this will address your concern. Thanks.
> FTAOD: If you foresee re-use by hyperlaunch, re-using a previously used
> number may need re-considering. Which isn't to say that number re-use is
> excluded here, but it would need at least figuring out (and then stating)
> what exactly the number was used for and until when.

I just did a bit search and noticed that the number 3 was used to be
#define HVM_PARAM_APIC_ENABLED 3

and it was removed 18 years ago in commit: 
6bc01e4efd50e1986a9391f75980d45691f42b74

So I think we are likely to be ok if reuse 3 on Arm with proper #ifdef.

Kind regards,
Henry

> Jan


