Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2354B671B4A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 12:57:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480538.745017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI74M-0007MO-Ba; Wed, 18 Jan 2023 11:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480538.745017; Wed, 18 Jan 2023 11:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI74M-0007Jh-8m; Wed, 18 Jan 2023 11:57:30 +0000
Received: by outflank-mailman (input) for mailman id 480538;
 Wed, 18 Jan 2023 11:57:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/We=5P=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pI74L-0007Jb-Hg
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 11:57:29 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2066.outbound.protection.outlook.com [40.107.96.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46631980-9727-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 12:57:27 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 11:57:23 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 11:57:23 +0000
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
X-Inumbo-ID: 46631980-9727-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuG5v32okDEGtAO2b8J5k8mVgheW6TUeYRPk8lfN7lirahGf9WOk+0EvUlClxo3Z9lC/R2XyqAKQvho/ab0w6DP0pqOL8qW7r/yvRglvF+i3XhIUWXjj9/yURDZ7adOR1ts7nQmRh+1/fowwqCfQil9uczsJH1TQqBwf8MQ4tah4Ekkej+yUMyWCRhBlh9bBVkRhYtHuZHvjE//UiSPPirFtSZNfRQpC350+JqsENsYvkwDwqR2+c+led9Suet9IiWfM/GZEngRLVGBuzxOdOkXExYvZ5G3uGTMsbGAAJ4Er+CnfoeEUyVrSJbTyL3pqeZ4AD1Xuz9dJOmrOkBsW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53o/4KDeUpLeu/3KOTvm152saLu89gsSRqp0bP1KkCE=;
 b=VIVW6T6MX41moYojSTWAV4GeJXHJh2q24TuAcLEr8VC0m9wuW2BsuHHVtWvgy24ntEtUKlnCawTHOBQxvhJhFnoX9h7O7JKpEToo9hoFE/KXLjxs45dZLQSb9dQgGaSJZA+iOEPFb+vY8X3nYqhuY0B78Z3mLaYUZoBYXKhWchH9sBAEngU6gzGdOUFyjBXeEKq40vDZa4pC42tJ7WQJErLY5FwGYl5XJi2+Ckf0Ke5ruqNrH4F7d8/imKFpIBMcPCFvlbe4BWDuL69Lm/CiUjeI7MiDJ8IdyFzuoK5mwEotOR62UKGxu/mRrX7LLuHnxzPpSBiA9HIy0i/xPjQ2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53o/4KDeUpLeu/3KOTvm152saLu89gsSRqp0bP1KkCE=;
 b=hyLqn1Cr4cabdq9c1VPCAtejGKr6VJ3fzq3dgN57PALyOkjXn4Ax6GUmmvJB4Y8zNwuypNxqI7cGxLPejsOewjnsn/COikJJZdN7wGYPAS5xNstBqlnE015wmSvO3GNA8m3LORZlxRn71C37IJDdCe39blxkmRxYWW9x87hE9Es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <376c32ed-2e9d-a81a-69a9-8ba6d54f603e@amd.com>
Date: Wed, 18 Jan 2023 11:57:17 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 09/11] xen/arm: Introduce ARM_PA_32 to support 32 bit
 physical address
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-10-ayan.kumar.halder@amd.com>
 <49228d15-3f0d-eb89-6107-40ae9f0b9b92@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <49228d15-3f0d-eb89-6107-40ae9f0b9b92@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0358.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::34) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: e87386ec-21e3-4118-834d-08daf94b28df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Dq13BoteqNbgn568PK1smoJMXf4zCy/IWO4sFsLoIWW9KkafSNeFwLWc/qwF9Jyt/pNRRhvGumAkGWElYJgFG/CoB15YJCIjJp4ONuED83zTkData2CIeXyowp2FlSnZQKshF2fH6yU1PSipx+nJHc3My2Nj5P/FI9AmpeFKwhZh5EJ/9f/wvRArnOVspD/Ak+vxalnQ+CcvR4Qav84rHAzeVn+Z5GfQXq6u6+ta9G4RA9ORELwUDQ9YCmh5FylgSD3VbpQ3NPL8+WZTIA4Tb7Kka/sYBIC+buZamv7EgsUC8rwBJv6eNUqzfzXtJcDq9yjad2iscKBBb5SovPRnCij4dKxwV2wETQnG/yYQKYuBqKoik3Y1INbYgYMyYTuUPkzsBTlGzprsJ8XDicfKtH+y0YjAJeEtuVnUAaU3RlVANRU9beH4aiGdenbeuiAiAGUqDLb8+c1db535riKTO8z49Uy1hdH1vf0KX/FEzKCJ8dDP+sAWrUXhLMchibJ20UkRkF2CCLXr4A9FZ6dJcmKstsUBrDUugK+hdwrPACQZmoIRTjC43A/XUOwGTJl8sYvrxP6K2L9hNYOvbr/2/wI5qGM7upH12I8CXFve749wcI5JZ9yBR58AskEbfq0hWFn8Fx0mtH9NzbYrgbH44rDJuewz+yoQfc2yg/Rr3a0vTRo5k0Rsp73zq3vSBwKCqxl8rQ0Mw1mKlQV0utOMzek04kLl1nzBVJZvdg2b3w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199015)(31686004)(66946007)(2906002)(66556008)(8936002)(5660300002)(66476007)(38100700002)(31696002)(6636002)(6666004)(110136005)(53546011)(316002)(6506007)(6486002)(36756003)(478600001)(8676002)(4326008)(41300700001)(186003)(6512007)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFhPNjFieTViWTVPcW05c0ZCU3FCVkRkUVJHNlZTUEdJcGFqMFdmeG1CWE82?=
 =?utf-8?B?c0ZRSmZXZ2U3dW81L3huQ0NFUm84SHZybGxBTlZ2U1Ixck1hYkhYNjlGZUhr?=
 =?utf-8?B?WWxnNThnRXJWRFZGV25pL2JISHBCUzZubml4S3lLVzBySU00UktmYnFmaUFh?=
 =?utf-8?B?NTlqUlAzemlkSXU5WGQveDkvUEd6bTRISUozS1Q0K2RRSjU1UW82Skk0TUhh?=
 =?utf-8?B?TjVjdjdLaFlLQm1JWFlJT3NGZk5VVk9hSUd5T2ZFa3c4YnFZTHl5U0xIYkxq?=
 =?utf-8?B?ZlR4YU0vSGwzY2FHb2J5NUsxblFLQUlwbFJlbFRTTnVtMjNyMjYwWG9Sakk5?=
 =?utf-8?B?VXl3dXRuUjhjSXorYkxaSzdVczRDcVFvc2ZHVUZsK3p0bWpDa2VLWnY3alpr?=
 =?utf-8?B?L1BsaFo1V2VUUW5YKzJxbVNnQnNveERZZ1VWZUFzYWdNcG5EbllEeXBpSUw4?=
 =?utf-8?B?YmRZb2RhYS9WK3hWbWxOeUE1SGxIZW9zOGtuelBvWDFxRGRXS2FYOUFwclgw?=
 =?utf-8?B?WFhKc1h1bEVxcUIxMXhqS2c4UG9TczB2dlVYNkRDVEFiMkVqV0YzTXBaSU5E?=
 =?utf-8?B?NmF0UDV3OUF1VHUxaGJFT2NTRktUTXUvUWFPQ0Q0VE9rdEJ4K0d3WGFvTFFF?=
 =?utf-8?B?cmpka3RxWDBDbklDQ2M3N0FwVU1zQVY5akxNelZ3ZnRRWnJjdlEwNzRaUXFH?=
 =?utf-8?B?OHVHb0dpZktOYnlPdGQzMmY4dzdiY29CY0FJbkJYV1hmcVhLUXNnNjh1Y1VN?=
 =?utf-8?B?UG9kcjJtUS8vTlQreml2MVhySEFmWlRuSnkzTVpOZ2swY3JhZ2hOUVFUTU1x?=
 =?utf-8?B?SmoxZWNzVVBtc01icUpBaXo0UVJGbjdOMXd4N0hzcmF1VzZXOGxqTldVSGFX?=
 =?utf-8?B?MEVVZk1Vc2lPUlEwMjV5dG5ZOWIrc0t1MDI5VlRMVHBZZ2hyNGdvemF3bjQz?=
 =?utf-8?B?ZHI1bXN4NXpZTk9iQTJiNWNFK09kQmZVT0xWUGx0TFRwOW4wNzJ2ZEVMRFZK?=
 =?utf-8?B?bUFPZlBMTjJseW5sZDdyVzN4akcvcXIxZ0hoN3MybXNVWXJsbzlGOUplZ0xC?=
 =?utf-8?B?OVcySDNtUHIrdTRadGxoNHcwekJaYXAxKzUvZkxvU1hKM3doM3VWdlZDSXQ5?=
 =?utf-8?B?LzlWcUpxaWdPK05Jd2VDaXd1dVFnKzlnOEdyVjdiTlNQWm1mVUNDVjV6U1Ey?=
 =?utf-8?B?NHR4N3Fab1NtdHgzWkNESUhENWZqbUlmZno2ZGQ0VXNVTlE4UHVkSDRibzlN?=
 =?utf-8?B?Qzl0TVVYaTQ5Y0YwTitOMHoxTDJ1VUZmb01zSjJ3UGMyTUFXNmJza3k1Tk96?=
 =?utf-8?B?ajJhMmNtOTk4WXQ3SHdISVhRYWQ1dXJmZThEMjlza1RBYzZwbm5DSWFzbmdV?=
 =?utf-8?B?OUozUmtMcUVpVmQwVWtnNExkVFdmV1dnaUZWc2hrSmdES0J6RmFVczNxdjJP?=
 =?utf-8?B?QmN2VW9nUnpJcjNGTXI0U09Kc2Q5UWpab1czWTlQSmw1OGRCNU14MXlxVlJZ?=
 =?utf-8?B?OG5VZHFqRDdXZVJ0QUswMmo3NlhqdnZTUDNIdHg0UGpuQit1d2VmZkdCRXFn?=
 =?utf-8?B?Tm0ydDFhdFQzL0RmT05yMlRibDNjaUZSTzBqQmVNZXZNZFczVWdDaWpwKzB1?=
 =?utf-8?B?aGVRM0g2TkVvRGM0Y1ZxSEZDT0xtRVAyODFZMmN6VkRtZDZHSE1aRHRoQWhz?=
 =?utf-8?B?VVBLaHZ6eHFzZTRqVXVscWFHdWp2U0hUVThnMTVvTVpESkc5eFJQVUlwQk1U?=
 =?utf-8?B?Q0RwWTJOejBkRGJ1TjR2a2dZdDZvWE9uU0h0UXplWDk2UnltWVVBVURMZ3M5?=
 =?utf-8?B?bG9PMWVHakxqekxNcktCN3hBS09QbEQwTk5EN2FVNUdiV0hVeVhnRFg1N1Bj?=
 =?utf-8?B?M0FPVURJMGpFbnU4Y0RlNkxZdEE2Q3hVb1NMeDZGQzBKUHp1MlJTUzltWnpZ?=
 =?utf-8?B?MDVmcEdPVzl5QzNXYUl0cExBMlhVbGhvaWt6aTdHR0daaFA5NElTUlFwNjRy?=
 =?utf-8?B?ZGtONEJMeUVOMmhGaXcrblJFTFRIQUdXVHJ0c2xvYjlDcThDbTRldG5WSGc0?=
 =?utf-8?B?YUdqMXVPR29iUGRoMEZ2Wm9MTmw1SksxTFN2eDBIZGxKVUpKaUQxeCtDeTBY?=
 =?utf-8?Q?B3U2Ndmn5UvES098/wC6NaeOi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87386ec-21e3-4118-834d-08daf94b28df
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 11:57:23.2134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tK4ONq4CUvmpPaLCWivogk2dFs0WPVa9KgyNbfZD5mzVdD8t+iXHGWbUaza9w/QDAwP3dOPnxbobYBwHiwGbXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357

Hi Jan,

On 18/01/2023 08:50, Jan Beulich wrote:
> On 17.01.2023 18:43, Ayan Kumar Halder wrote:
>> --- a/xen/arch/arm/include/asm/types.h
>> +++ b/xen/arch/arm/include/asm/types.h
>> @@ -37,9 +37,16 @@ typedef signed long long s64;
>>   typedef unsigned long long u64;
>>   typedef u32 vaddr_t;
>>   #define PRIvaddr PRIx32
>> +#if defined(CONFIG_ARM_PA_32)
>> +typedef u32 paddr_t;
>> +#define INVALID_PADDR (~0UL)
>> +#define PADDR_SHIFT BITS_PER_LONG
>> +#define PRIpaddr PRIx32
>> +#else
> With our plan to consolidate basic type definitions into xen/types.h
> the use of ARM_PA_32 is problematic: Preferably we'd have an arch-
> independent Kconfig setting, much like Linux'es PHYS_ADDR_T_64BIT
> (I don't think we should re-use the name directly, as we have no
> phys_addr_t type), which each arch selects (or not) accordingly.
> Perhaps architectures already selecting 64BIT wouldn't need to do
> this explicitly, and instead 64BIT could select the new setting
> (or the new setting could default to Y when 64BIT=y).

Looking at some of the instances where 64BIT is currently used 
(xen/drivers/passthrough/arm/smmu.c), I understand that it is used to 
define the width of **virtual** address.

Thus, it would not conflict with ARM_PA_32 (which is for physical address).

Later on if we wish to introduce something similar to Linux's 
PHYS_ADDR_T_64BIT (which is arch agnostic), then ARM_PA_32 can be 
selected by "!PHYS_ADDR_T_64BIT" && "CONFIG_ARM_32". (We may decide to 
drop ARM_PA_32 config option, but we can still reuse ARM_PA_32 specific 
changes).

Also, then we will need to support 32 bit physical address (ie 
!PHYS_ADDR_T_64BIT) with 32 bit virtual address (ie !64BIT) and 64 bit 
virtual address (ie 64BIT).

Let's confine the current changes to Arm architecture only (as I don't 
have knowledge about x86 or RISCV). When similar changes will be done 
for other architectures, then we can think about introducing an 
architecture agnostic option.

- Ayan

>
> Jan

