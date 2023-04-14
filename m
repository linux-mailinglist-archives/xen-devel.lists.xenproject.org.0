Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739BC6E293A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 19:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521173.809544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnN93-0004Xd-Au; Fri, 14 Apr 2023 17:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521173.809544; Fri, 14 Apr 2023 17:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnN93-0004Uq-80; Fri, 14 Apr 2023 17:23:33 +0000
Received: by outflank-mailman (input) for mailman id 521173;
 Fri, 14 Apr 2023 17:23:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YiN8=AF=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pnN91-0004Uk-G5
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 17:23:31 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11d5e261-dae9-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 19:23:28 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by CO6PR12MB5442.namprd12.prod.outlook.com (2603:10b6:5:35b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 17:23:25 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea%6]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 17:23:25 +0000
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
X-Inumbo-ID: 11d5e261-dae9-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OobbYPp7E/tUwaL0H/DvMcsv2VP9RYcUJvVDsFl1lY5ehOXPjgTeGQ82zjy2Gr6qO34FcDutP+P0hfC/FIghfAXkUKUAelh8oK42SRMUKA8n7xxk8SGR+OlbelUlHa92B5psxhcgzl+k4cS3bODVnrRwMoEt21qvwZzsXZdZnD4vS1+7VsiSL00FSdfy1SAL3UFf3qeLPgehG4eiJv//eaMOQfC2E4f/1IKTANXsNkp3cnskgDbLSEfoK1QgOVTJK9rDIAEpbY8Khm3B+UzDcF+i0mZfzIHEt13dzv/vaoHP5MTL75+CVtE0YHuYiCTPMgrKZCh+zgFQmJbQx1nn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej5SWGuUgb6hps2pgI4GwpP608Nluv+8+jfvaBUuYXI=;
 b=Veyc6rjldKlPLkv2VXtAIN9+eJQHiE6BehYFTAXgBLiAaF0S6oOcC0XmviiQ/1NsvgpAyhcQw4Pu5+icodoviiX0dph4l1VIuJopfZfdvm5d80KUEKtRV0ox5xj47MVPxPeMvYheg/+Sxc/cDP0BlaGL5mp5LQFntJozgBSoSzgjvMc3ZV5hcd0HqwpgGO6brzq33eLend/aM6L0gLFuGrWT1OzERxWntvhvNt9RCrVhq9mNbjSTkdqWByAStMu3n8L3nMuD2PL9/f31E1MPRgF6vf1QATVRed3bqgiFdr3K02plwyHOJQ6FqD+SBMdTA45ie0mi3t/vIVZ78we6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ej5SWGuUgb6hps2pgI4GwpP608Nluv+8+jfvaBUuYXI=;
 b=5ILnij7Kx8AxWQsD7JT8qGoQ6eRtqCKrJ211NNAaAciWScaFtksRYEh3c3/j+Z+Z7ajqbuTVz8EvCiRFF89pRTEWoWa8jj2Rrmo9Sh46ddcU8SOVsIoIhTUp2P9dSbVwDjRDf2qGDtTxTkdHWGqiRFULK6mULgFvRK8fsvpdVQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a93baa6c-2b9d-315d-304a-956804b2731b@amd.com>
Date: Fri, 14 Apr 2023 10:23:22 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 12/17] common/device_tree: Add rwlock for dt_host
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-13-vikram.garhwal@amd.com>
 <AS8PR08MB7991D4C1352B785D505AE63892999@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <AS8PR08MB7991D4C1352B785D505AE63892999@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0201.namprd05.prod.outlook.com
 (2603:10b6:a03:330::26) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|CO6PR12MB5442:EE_
X-MS-Office365-Filtering-Correlation-Id: 630d318b-25ee-4ed6-13d9-08db3d0cf448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/rdxoWmQGvXsw1gtkowbXup1MuKId+vzOySCZAA1G7OoRAV3C9l00bgPy/We/nqoK7GPL/z4WriHZUjBtBGw24P/JyLnRQOv+Dm03iTVTxbj3xhQ5ZKcAo0sLgF5Yenm5wRSX2iR1YnHMBFSWAFYpbCgkubchZ4sbPxdemdmr+mhjJ9PsjKnciHtMeq6wdsQKGWbPuSfYQlk67Vu1h/QfLd2LJegA03Qf4GSS9oEnaLdZq9/SFs8s1WGaYn3M+0SOySynGk+BaXD8nyNzfjjDr4j3es3yQJjTDPHzKfM0p62OaQb+RoxkBZod3y0rVKxsRfHk9cBY/w/MAoehNA/QAgpbjSu6C6JDtecByHkXB1HpcrQzRMGPWnuhlD0HtUSXTKBA84hxMc0JfA3Bg0b0c8heIfHroTWBUpDqdwV9g3IMovp+I+dtrMlTiziUjwhxDk30iO70XydMZuRey3DIHLe79BV7xYt7cwd6IrCOWg3qyRRYme5/WWmJW1kd2qIn3EPoCf2i5BUfQS3gicvHhQpnbHkjXcFMalpuG39q+WXGqUQ5h518RtHkz0I/R6bDmpRy50RuM/1qYk1Uz2c/tpNqQFvwdfnNc3/GuHyN5B+kXrOZMy9+Fm3PQwbPuuNLVp1+Pc6nsH/9POwjkrU/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199021)(316002)(41300700001)(53546011)(6512007)(26005)(6506007)(6486002)(6666004)(38100700002)(186003)(86362001)(31696002)(2616005)(36756003)(83380400001)(66476007)(66556008)(66946007)(110136005)(4326008)(54906003)(478600001)(8676002)(8936002)(5660300002)(2906002)(31686004)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3BhQWQwWHhZQW9sUlF2NFF5Z1JGc3Q4cmh0bmd2QTNjY0o0bFRLSUVYRFdn?=
 =?utf-8?B?dUdQZUVqSnZLa0ZDdUkxdmpWUDd1cU9sVG1wblpNdzNHTExuNm14VlVyNHk0?=
 =?utf-8?B?OG5NMXhNbUljTDhsZjgvSVd0TXdkYTFYQlM4aGpVVnlNV0RDWHdpbXVZWnRN?=
 =?utf-8?B?aXZwb2JPVEk1NzczV0pZYmNUYUw4bC9INHhZaTJaV2lnaWVRSXlDM2p4RWVP?=
 =?utf-8?B?L3RkVUtmRDRnV1VlUSs0S1ZLa01ORWk4cHVUNS9iM3VMZ0xCSVFCMmhHOGxZ?=
 =?utf-8?B?VWdSOGN6cWhlZ1ovSzA1WXV6UFNJSGZNS0w4UVA5eVhMQWJ6NlQvaDdTeUR5?=
 =?utf-8?B?OFJjbnFlVk1tRWtkRnc0eFhDdGcwanJtT3BLYzIxVmxhcWg1LzM4OTZqSUlz?=
 =?utf-8?B?QmtTUG5UVjZyOFRPOVZQZ3N2NWw1NGh1MGkxU3gzT0dQckkvaWpYUS9zb05n?=
 =?utf-8?B?TzVrbHR3eWZiWUNJU3E2WXFOUmJEWU0vQnVXZSs5a3QzK0lMR2tnVzdRMFJp?=
 =?utf-8?B?cVRzYWVabnpkdHljMHBjQldoZWxmcFo2eGNMeS9PdmVCelBHd21wRm5lYng2?=
 =?utf-8?B?ei84QnF3RitRZjRBSjJZd0IrMWdjR3NGVG9VLzZSbGk3eThRM2VTZG9aRjlt?=
 =?utf-8?B?dDdOZTFOajUyMldxbGhFRVlLTkVMTmxhajFHUTdEejVsazJpQ3R5ZXk2cFFT?=
 =?utf-8?B?SkxXbFVCSG5uQ29uY0FUN2k3VXJCcHlrNkZ6S2lpcmR2dHpiUWtsdk9rdDZF?=
 =?utf-8?B?dWRpTkE0VGNES29QcnFCdWFTRjFhaHd5UUUremRtaFNNU2xmUzJTRlk2ZmpY?=
 =?utf-8?B?VkFKdVZhZmkrUFpOcWwyV1VQQUZBNThsRmhOUjE5VVlqQVN2TUkvN1ZkempD?=
 =?utf-8?B?Q285UW1sZHV5d3hiZ1pmU0E1QmhvaVBnNjdXeloxU3IrY1VaZFVrVC82eW9P?=
 =?utf-8?B?Skk2MFRSdFpNT3RKbDBPUDRrb2hiVVlIRXJFSFpKSWVFa01SWDBWTEdYMW02?=
 =?utf-8?B?N2JPUVdPYmxOM1Z0ZjRITDM0VkQ2MTFqT3dNS0FVUUhrMmtoVE9ucXZWR2Jw?=
 =?utf-8?B?TW44QXBubjc3SitsaXJoeTBjQTFlWTZScmpYdkdJdzljbmxzVis0SUVReG90?=
 =?utf-8?B?TTRJUS9yeXMwTFZTdWozNStzNDlpUXJRV0RZZU5jZ1ZhOERtUWg3UFdsVlV1?=
 =?utf-8?B?Qk9TT0J2dzBKdmhDcFprdHJnM3J6NE95ZzVuVVhMQzNWaHB1aUs4QzAzOC9F?=
 =?utf-8?B?c1ZYa3lheDQ2MThYdTZ3amxVUWZoOWg0VGJ4Q05SaDFTSFVOWGI1cUV4OVpK?=
 =?utf-8?B?dGhxWFkzTUdiV1ByNDNTYU1uZUZhby9YOXhMTU1ESlRNa0hKSklRRlFlM2Zz?=
 =?utf-8?B?TzRrdHJub3R3dzBTTlJGWVNUMWtJd3l0YlUydVNnV01VME1sRkJaVUdqQ3E5?=
 =?utf-8?B?UmwyTVovUEtTZWtPNlZ3Ylg0dmlnWHJPbEx3aGFhMnNmdVZXSng5T0dGeHd5?=
 =?utf-8?B?WjRwa1FDeUFiY2NNeThmWU45emwxQWNWaHFwNVNDdnFMYzNRZktteXV1cS9N?=
 =?utf-8?B?RDBzd2RudGJXdzRCdGl5T2xrR2hibFBEaW5KU0JXSVRraFk5R1Y5VkovSmsr?=
 =?utf-8?B?QlVWQWE3VlRWQkI1SDlCVFA4S29uOGJldmJHdkhGcjBmU3BXMGRENytYZG0x?=
 =?utf-8?B?em9RNFZxYjBOQTR3RmxTa2UyNWVPT050SUQvczJiRUxVQTJmVW9pU1JPcU9S?=
 =?utf-8?B?c05PZjZDeVlVUHdZdVFEU0RSSG1tRm9YRTJSbURINjB0VDIvajQvRjVYTUhh?=
 =?utf-8?B?ZzBMZW00UlRHOU1Ud1BzdzFFTndadS9PYUh5ZnJGbGhGV0RlUHYvelRTdlZ5?=
 =?utf-8?B?aVBYZS9YY2tJQndqdVJIbDQvcU84UkxxT0thdGoxOW5mSmFBWXdnT3NvK1ZK?=
 =?utf-8?B?MEhLMnFzbmpNYTY5OHN5QVFUa1lLNEY2LzZKSUJQWUpPZHFpVUtXeUNYbEpq?=
 =?utf-8?B?dzVkK1NzVWdiRlhyTVJ1VmpQQWw4V0cwVGgrMUJoZG80VFQxTjdIaEVsK0cz?=
 =?utf-8?B?UVVUc2plcDh1RmVYRmViK3lZcVVHWloreXU2UHFyaXg5LzEwWjEzQmFlVUJM?=
 =?utf-8?Q?RkNphRRsUeQ46YAxHqCEgMPre?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 630d318b-25ee-4ed6-13d9-08db3d0cf448
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 17:23:25.2225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAArDci8ntS20m5aQNh+rArKUdN3/I2MPysXEX76yzbpILQ6jXPIHTvTcokDwy1t7YQ8w2OV/0V5xoQv7mlwRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5442

Hi Henry,

On 4/13/23 7:09 PM, Henry Wang wrote:
> Hi Vikram,
>
>> -----Original Message-----
>> Subject: [XEN][PATCH v5 12/17] common/device_tree: Add rwlock for dt_host
>>
>>   Dynamic programming ops will modify the dt_host and there might be other
>>   function which are browsing the dt_host at the same time. To avoid the race
>>   conditions, adding rwlock for browsing the dt_host during runtime.
> For clarity, could you please add a little bit more details to explain why you chose
> rwlock instead of normal spinlock?
rwlock is just to protect someone reading the dt_host while dynamic 
programming is modifying the dt_host.
Initial suggestion was from Julien about adding rwlock here.
For now, dynamic programming is the dt_host writer in Xen during run 
time. All other iommu passthrough function was just readers during 
run-time. So, it was better to go for r/w locks here as spinlock won't 
be able to difference between read and r/w access.

For next version, I will add a comment in commit message.
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   xen/common/device_tree.c              |  3 +++
>>   xen/drivers/passthrough/device_tree.c | 39 +++++++++++++++++++++++++++
>>   xen/include/xen/device_tree.h         |  6 +++++
>>   3 files changed, 48 insertions(+)
>>
>>           if ( ret )
>> +        {
>>               printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign
>> \"%s\""
>>                      " to dom%u failed (%d)\n",
>>                      dt_node_full_name(dev), d->domain_id, ret);
>> +        }
> I am not sure if it is necessary to add "{" and "}" here.
You are right. Will remove it in next version.
>
>> +
>> +        read_unlock(&dt_host->lock);
>>           break;
>>
>>       case XEN_DOMCTL_deassign_device:
>> @@ -322,25 +345,41 @@ int iommu_do_dt_domctl(struct xen_domctl
>> *domctl, struct domain *d,
>>           if ( domctl->u.assign_device.flags )
>>               break;
>>
>> +        read_lock(&dt_host->lock);
>> +
>>           ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>>                                       domctl->u.assign_device.u.dt.size,
>>                                       &dev);
>>           if ( ret )
>> +        {
>> +            read_unlock(&dt_host->lock);
> I think instead of adding "read_unlock" in every break and return path,
> you can...
>
>>               break;
>> +        }
>>
>>           ret = xsm_deassign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
>> +
>>           if ( ret )
>> +        {
>> +            read_unlock(&dt_host->lock);
>>               break;
>> +        }
>>
>>           if ( d == dom_io )
>> +        {
>> +            read_unlock(&dt_host->lock);
>>               return -EINVAL;
> ...do something like:
>
> ret = -EINVAL;
> break;
>
> here, and then add one single "read_unlock" before the "return ret;"
> in the bottom of the function?
Will do.
>
>> +        }
>>
>>           ret = iommu_deassign_dt_device(d, dev);
>>
>>           if ( ret )
>> +        {
>>               printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign
>> \"%s\""
>>                      " to dom%u failed (%d)\n",
>>                      dt_node_full_name(dev), d->domain_id, ret);
>> +        }
> Same here. I am not sure if it is necessary to add "{" and "}".
> Kind regards,
> Henry


