Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F639F9593
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 16:40:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861864.1273896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOf6c-0006Aq-9I; Fri, 20 Dec 2024 15:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861864.1273896; Fri, 20 Dec 2024 15:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOf6c-000689-5z; Fri, 20 Dec 2024 15:39:58 +0000
Received: by outflank-mailman (input) for mailman id 861864;
 Fri, 20 Dec 2024 15:39:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o45M=TN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tOf6a-000682-TV
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 15:39:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2415::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a97ced52-bee8-11ef-a0d9-8be0dac302b0;
 Fri, 20 Dec 2024 16:39:55 +0100 (CET)
Received: from SA9P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::15)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 15:39:46 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:25:cafe::58) by SA9P221CA0010.outlook.office365.com
 (2603:10b6:806:25::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 15:39:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 15:39:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 09:39:45 -0600
Received: from [172.18.155.234] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 09:39:44 -0600
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
X-Inumbo-ID: a97ced52-bee8-11ef-a0d9-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n78cBcXrDnzcRg/oKgp08JlxHj78HFjtFkLfW2KWZPJJ/+BuY++lGXNcuC4Pn68mzN3xYtKuQJW/YjSz8pYy4IJVcmbvPJ/ZLFUjFTzk8Gx7DmBrqofqPuoEFXmZ5U8yfaO0Nye4f5qf0XA02BJ0NG2qMGHTGhLMyOhH9J+Py20QOI/TmoxlQPCPn8qNPrr5jbufVcJMJg6KgwfgvaQZrzoA+OLx8fi6gPcIGMlhyKFPVagysqYBTnd9z5ZbyUs8+cOK2zCUZUAkaIfQF0BrWheKUYU5PYQ1UDcRvg9a37sBIBjFrmqmiV6TrOnG/sDce4uKRHgI40LTHxIND9lFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpOFmIDrrLM3gcmeYZK6B8PRv3c0B1xLvAXUsFbFV/I=;
 b=FtzbzS7brfjw5BJympC4lukdAvSFUKSV/0usb2/F9wGq9BVMuXUpjveisVyww1xLuPr/ZFILVILgh3T2ZVKOqw73nI/SG+TuU589kXdbZkmx7wz1/7SdwIE+kusvO7e2NaGWbrM/uPmSR2oGF5aQr6SrPViYu34YgOI9iWBfV4cqr8vW0ujIyRgLENmeHKmYkGQEIY6UpvfWd3Zqza5zXzn2nBDEqsXkqQcsbBvKpPoJpzIQDhSBZuwF0+qiErd4A7mwyBdt4T4SwLa3o/pytH3UkKqEwqkq+X+gNQkyQvwKDMQRll6LA7YC2iTXQScGX35HlYx4x4+u3Am9rwlmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpOFmIDrrLM3gcmeYZK6B8PRv3c0B1xLvAXUsFbFV/I=;
 b=5i02Zq8LRG3L9/KSKfibpnNDovj2cSoy89H9jhwU/iEhCmKshT+A621eReoh0LUxptfiW1juTBTogC0QNAYkNbjVbkTRv9Bax2vIYPe3X6VQnzsDB+eO8bjQ1aTX64IrUsRBn+QYGz128JMVUMjaDHmsGr9wCo7+0y4zO+L0Ecc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bfbae7cd-a5d5-40b7-8e7e-65c3de2d440e@amd.com>
Date: Fri, 20 Dec 2024 10:38:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH Hyperlaunch v2] xenconsole: Add connected flag
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20241219223222.2211-1-jason.andryuk@amd.com>
 <eac9a69e-3f54-4c4a-adf4-2ab4a810abf1@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <eac9a69e-3f54-4c4a-adf4-2ab4a810abf1@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c85d27-ecf1-497e-93b1-08dd210c87e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1VjWnhyOHFYL01TUXpkUmZCSWw1ekFSazBmS3QwbTdmc1daelIvN1loSVNE?=
 =?utf-8?B?ZkJxb0xSVE9EWi94MWpGdjV2ZEE2cTlGZERjNjNpeVhzWVJaUTVST3ZPRU8z?=
 =?utf-8?B?SituNVR4OWZQQ25IUFRLNTcrU0lyZXV1Yks1bFgrcldaeFpya1RoWURzZmp1?=
 =?utf-8?B?Tks4RXVEMzlWUU1ZRDNLNU00VWNRRWNNNm1BNmF4WTJXSTdnK2JxdmZoOUFp?=
 =?utf-8?B?emtHMURzRU1DWkdmcDVFbi9WZHlvT2pjZnpmc3VHL1c3YThsOU4zVFlxNUwy?=
 =?utf-8?B?SnBOUktLMDRDbStVR2Z2SHFIN3I2Z1dyNGxqWnhsaDlUSnRFajR2ZU1hN216?=
 =?utf-8?B?YUVyTEM2Sks1aVJ6Z0J3SEFrT2FkeWl4bGoydFlkV0FmRkRJT2FWMFhWNlJT?=
 =?utf-8?B?U3d6ODFWdVRCWlM5VFdnM0hYbEY1WEE3cWpENDQxd1AyR3ViK0tSUWJBUW40?=
 =?utf-8?B?L3l4M3FnVlZZRWVHbVJOS21ZQ2FnZ1dNN0lyWjMzYWU3RUVqRUJsb1BYT052?=
 =?utf-8?B?UEJrVTBsRzh2V3lXQUJMZy8vSzdNVHo0OXp2M2lYZzJZL0FTTmcwZXgrVFhQ?=
 =?utf-8?B?a2pUQUZZNlpyTm5aNlUxYTVoQ3l2ZHl5VEVrM1VVT2VrM3VlbkF2V3p4bVdH?=
 =?utf-8?B?RW50b29XUTR0OWZPbVozbFcvYitxakhScWhvVm5lVkQ3OHp3ZjNzQlRlNExH?=
 =?utf-8?B?alNOSmxvYi9YR2tXRVVaVUdkaUVsMzJaS0RyR0ErVjhWQWc0aHdvMmZkbEZn?=
 =?utf-8?B?MnJvRGVYbWhUb1czVXNJeFR5NnhmTUV3MFNIaHFINFpJRTQ0N3pHZGsxQzJG?=
 =?utf-8?B?RUYyaU15QjQ3dFBsZHBQTTJ0Q0l2WVBVMVZ1d2svdzc4RkpIWXYxOUh0U0li?=
 =?utf-8?B?ZDVkSjQrVUhhYi82NkxXV0pUQ2RpWjVHNE1uUDVvNmpjSzBscHcybDczTCtw?=
 =?utf-8?B?RDRKdjdLTk1vUGZDeHlJVXhuOUlpaEluekNuZnYvRG12ZUJmdGxQZlA3OWdu?=
 =?utf-8?B?cldCdTM5enVjT3k1b0FZOWhra0tyVWpDczZ3RmE4YlJGd2NwTlBuTW9HenFP?=
 =?utf-8?B?eklUK0hJdUJkWkV5Ti94TjFvTytsaGRtOENvd0lPUG9qQnk1bkw1WUQrVFpV?=
 =?utf-8?B?L25WWGg0MW1qcFZ1YU41dVVid0FJbGZSWGwzOEFWVmUwdnE4c3VYcytPa3Zw?=
 =?utf-8?B?WXNVeXBCOUF0SWZlUlhFWHNadm9JMUI3MW5zaGphdlM0VTJFbzNBc25FNnJq?=
 =?utf-8?B?UzhwOVFvdldWYW9uQ1hFcEJQNUhoV3RLOVRaTjFjZnRJNGNsSDhpOW1Td3ox?=
 =?utf-8?B?TDdhUlU2ZTBucitkUXVkMHdLS281ZjBPZjFrYTFVSGt2STdXUldyVTlJQWFT?=
 =?utf-8?B?YTh5ZitwMU0xNU1TdWFNeTAzLzdKRmtLNnN1WEdFbnVBMm9EOU1UU0JDeXh5?=
 =?utf-8?B?UkhFWjRxNm5wcWlBZE1BakYwQWRDME00VTBEcGRnNDMwcGlSL0YyY0tRbW92?=
 =?utf-8?B?ZThmbnhBM0E2ZkwyT0ZlS0w2MkY5cmVUSjROUTUyNHFwdGNyRzJKL3dNVjFW?=
 =?utf-8?B?enN0clBMSU5xVGZHRzFwMkdZYTExY1grc3NyVU5MTTBuaVl0N1VnNmNwczdZ?=
 =?utf-8?B?VW11amtJVS9Bbk5WaEw3Z2FjZzl1cFVtYlhnN21xWXlCZ3hwamR1V2RtM3pB?=
 =?utf-8?B?YmQ5RnhIVTF3M3ZlSmFzMzZ0WmRLMTBweU9jMUg3VW9yU21BdTRJSFVha21E?=
 =?utf-8?B?bXE1Q3ltbSt3L2NGdmQ0MkdWVkxQRnZFb1BDQ0ZkTXpWWUtFRFNSak9qMEps?=
 =?utf-8?B?cHNMNVZqRVpOYW1jZXJTcHB1ZVZSZEpjODZTa3VmdXpmVVBYSDlOL0h3VFdl?=
 =?utf-8?B?aGxCS1Zyc1hjK2wrTFRRRUl6OGt3Y0xKdFNUVHZxK2NvU2pDVlMyOWFlZ0xE?=
 =?utf-8?B?ci8rOU4wamtORG5EN3JlajFYSm1tSDluNDMyY2RaWTZzKzJqT3Jvc1lYYWFL?=
 =?utf-8?Q?stQPAVeKVTgQOefkpCyZ/DRP4qOjI8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:39:45.8703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c85d27-ecf1-497e-93b1-08dd210c87e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072

On 2024-12-20 08:00, Jan Beulich wrote:
> On 19.12.2024 23:32, Jason Andryuk wrote:
>> --- a/xen/include/public/io/console.h
>> +++ b/xen/include/public/io/console.h
>> @@ -19,6 +19,19 @@ struct xencons_interface {
>>       char out[2048];
>>       XENCONS_RING_IDX in_cons, in_prod;
>>       XENCONS_RING_IDX out_cons, out_prod;
>> +/*
>> + * Flag values signaling from backend to frontend whether the console is
>> + * connected.  i.e. Whether it will be serviced and emptied.
>> + *
>> + * The flag starts as disconnected.
>> + */
>> +#define XENCONSOLE_DISCONNECTED 0
>> +/*
>> + * The flag is set to connected when the backend connects and the console
>> + * will be serviced.
>> + */
>> +#define XENCONSOLE_CONNECTED    1
>> +    uint32_t flag;
>>   };
> 
> Given no other information, how would a guest know that it can actually
> expect the flag to (eventually) become set?

You mean that without some other flag to indicate the presence of this 
flag, the guest wouldn't know whether this field should change?  Yes, 
that is a good point.

Non-hyperlaunch, a new xenconsoled would set the flag ~before the guest 
starts.  AIUI, there is no explicit synchronization between the 
toolstack and xenconsoled that the console is connected before the guest 
is unpaused.

Old kernels without checking the flag will just use the console.

A new kernel, with an old xenconsoled, would never see the flag set and 
would never use the console.

Thanks,
Jason

