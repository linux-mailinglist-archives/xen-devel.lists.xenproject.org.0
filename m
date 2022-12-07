Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764516461D1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 20:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456571.714341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p30GY-0003FX-Gz; Wed, 07 Dec 2022 19:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456571.714341; Wed, 07 Dec 2022 19:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p30GY-0003CN-Di; Wed, 07 Dec 2022 19:39:38 +0000
Received: by outflank-mailman (input) for mailman id 456571;
 Wed, 07 Dec 2022 19:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p30GW-0003CH-Mj
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 19:39:37 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df2b3bf9-7666-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 20:39:33 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 19:39:29 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb%5]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 19:39:29 +0000
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
X-Inumbo-ID: df2b3bf9-7666-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+APP9YtAW6I6MDtyk2DlLNTupR6bhXiDw+hbqfH0pg18F6E9CTLEWblQVITMUp46Y9IK/t4DF2Cr6b3eruMCWuNeD9myXgllSsc+MOefO3A0+ezJelj30oVx3ca0cs+zfXVuAN4QprOsP3xjtgFhl0kaon6BjHqv5XM4eneEWXSGu43+P406OKp62g0QQk4lq4vLWjh/aGIX7HUBvdU1i64ki5IB5PVCO+Z+goo7352qLGKrDj9uvAQJAPAzjmxW+pT79Mf3eTJs6tDuQDG1wmX1qO1nbe+I+vs4nodPbNKvjOSixIHyWQAb+bcdZp5riK7NYCDrHMk7lFakZPqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cle5Buqi8EAK/iXeHAAT+ZnQsRZuKEFr1CgDAmdunvc=;
 b=Z3yNffW9tdTMTfDDEbqlqKZa1SC3RlyNmerBYZ38IFikYHtSMNzt+jAOi2tNqL14dF2R3mpZL5xsYPlcOT+smEEctARfBIx+wm5/TynKLoPq/LWM0X3qhYSaOxiuLBVn2IYOVfxV4xXuY3S8cd6R9VzRJPbRGTMZ+bERNzzNlRrSxl9Y3sjYVpnd5zyLqpD4M0+te+amVzh/RuAbrpa/F82jNDXTxMuIc7G/icTlPP15wW+4up0K/eMGMyoN8fY8d+T18wkVBhzFMW0ZK2CzQOcoJHp2xU15YV63jsiCwWZbwci/EoSZ0G6G9WBqiUd4jQEOB0zpzBun9uQ/IWTu4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cle5Buqi8EAK/iXeHAAT+ZnQsRZuKEFr1CgDAmdunvc=;
 b=CVK3w+lDLwErZ3gwpvZHO+byoTa7R2PKpbGtU0u0Ifz42lyAnEx/07sUfQrBv2cTol5X6HbTAT0EiELIauKrdaxw4fv5ZQokyC47ONzQtTWljOKqRtjrQWCPJB6Cqo5Bnyf7JlnVvy0JPRXDEphTU3gEuFS5O80N5rDyLCwOUSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a441cd07-8659-afbb-000c-43494718a10b@amd.com>
Date: Wed, 7 Dec 2022 11:39:27 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN][RFC PATCH v4 10/16] asm/smp.h: move cpu related function to
 asm/cpu.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Luca.Fancellu@arm.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-4-vikram.garhwal@amd.com>
 <7cb6475e-0ab4-a7e2-8049-04c66588229f@xen.org>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <7cb6475e-0ab4-a7e2-8049-04c66588229f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::19) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 8006727e-e747-49c3-c186-08dad88ac1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h+AyrCi/Afy81T6Nk8PBXSgz+VuwCsqxQb5urR1/3ek7lkCWv6bshBtdXgtR4YO2csQoizDjvhcnv3H8p4Og9bjvsTY/rz+t+LAH+fokQKhha8OJasHTJrnUotBxcsXS31I8TtCtM4cp4zNg+iIJ3iNlY59BAkTvB6MPeJ0SrN3nDe0a5KLnvIJA4nKyCiO2Z7PZNn0bEWmm6pq9xwTOQeHlVd5z0YTMksUtQL44Vq21YCMsHudWdz1iT4YJpB1UQM8KTHH3FiNr9un/BXF0PkB+/+88eVC/QLv2mlC89s9p0AYEPe2+Wpf9uHZI2V/fYWFlCz0PFbXFEk3XJyQXhHBdhhg4YmlsF978+ZFwC8TbDz3Ye6nVw37Q2P+SapfSHCooaJPap1ugtYYaKplAg3JPFZmj9MCZxfKoDusNcA9szSv6JwoPxzo0C8ogfdZz2JFeSdjiUS1eM/6WXZezXfkYTfgmAqxy4gwhV0gwjWyax1ztMcXPQXxdEV6UCmHpcXOhgNTty7J87g/5yHuWe6eOztBAFNAzjj33nh+lEo0R+46KSvPCXfqMYCKEFzp8jP/NUFPdrJAnLe6bcVj5QCpFlMub477VP4UPvc08j9OkWo1wL4AgvY+pOuWSq1fxFj5NbM2uUswLeUt3gRgjfgDW1T4eVG5F/iwmxhiShyfykYfHHjr75iCRCNhR8teFIv4raNGzAf3EkfJZnnI0GdSUQx5V9emOGKdG5neTBhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199015)(38100700002)(83380400001)(7416002)(41300700001)(31696002)(44832011)(2906002)(8936002)(66476007)(66946007)(4326008)(8676002)(66556008)(478600001)(186003)(5660300002)(6512007)(26005)(6506007)(53546011)(54906003)(2616005)(316002)(6486002)(86362001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGcvdHM2MDNXa1F0MVVPU1BIVW9qM0VBcUxscHV2LzJ0am5TZlVmWWJZWlEy?=
 =?utf-8?B?SGxhN2V0ODRuSFp6a2xUaE1IMTJZQTRGV0lTckJXSThJeWp4VXREWnYwNjQ0?=
 =?utf-8?B?UGw0RzZLdmo0RlZFa1cyb2lLVGlaOXdYS3R1Mk1YTmVzNEV0YzRaampSSDhB?=
 =?utf-8?B?MVp4VTQ0MCtsV29lanFFSWZETnN1ai93ZjQ2NURaZUJ4S3RqNWhuN3dtUFB3?=
 =?utf-8?B?cmpQRllMOGsxRXJ2bjBWMWtZc2NWaDVWblFnaGlnNCtCTTNiU1duMXozUzJx?=
 =?utf-8?B?OTIzY0VwR3FMd2gxMDZkL3p2ck9CQU1SL0pqVEI5REZ3eXdiRU0zWC9POERW?=
 =?utf-8?B?WnNSSkg0RFJMVllXclp6dkgwUnp2TU5Hc2NGRDVmWW9lUXZPb1p4dzdXeXNn?=
 =?utf-8?B?eUh5UTMzallFd3J6VzV5SU0zRVJVekRPejlkVE91MVMxWXBRWUFCUEI4bStr?=
 =?utf-8?B?TGNWOE1VSUx0WXYyV1lFdDkxRmVmUVdlTVFUVEllYVVSaFdKeE1VQTkyeno2?=
 =?utf-8?B?ZUw1eDhIeEUxOVN1TE1uR0ptdTlVbUM2TGtyQ09GTDRwcWs1UC9OTC9PVk9I?=
 =?utf-8?B?RmNlWDV1U1JxUkluQlRJbGh4ZHRHK2h3b0h4VUtNWE5mSXdnOCszVlBMN3py?=
 =?utf-8?B?VVZqOEJNejUxQkJuck9jWXA1U09sNUN2VU1iZ05scHBOOTBhVzJPVlJmT1pD?=
 =?utf-8?B?NTNObS8xTGFIaDF5WkR3Z2RUOWZwL0twZUJUT2xMTmdvZjB0WkJyc3NMc0dx?=
 =?utf-8?B?STM0NWZnZzdKdXFvQmtVQURuWEVBN09FaHpVd1pkOTc0TWRGWUIzUmtMaHhP?=
 =?utf-8?B?Q0U4Y3p5ZHpuUlg4NURVYkQ5TFhhN1hTTkZYTlowdHF3N2ZNTTNheUVXSG0w?=
 =?utf-8?B?TEZMU0JtWmtSdksyQ1g1ZjNBd0w4V0thYkg4UEFFZXBxZU5BOGxDWnFtVnBL?=
 =?utf-8?B?eDJTZVB2YlpWcXY1SGlvYlQxQ3IvR3dhZUhIRkZnUk1PdjFZVkdjM0o3MEdU?=
 =?utf-8?B?aEptVUQ4SEE0bHN1N3RGcXhFY0hLSytGbmYwcmgzTHM5L1A1dGRhWlJMSWx1?=
 =?utf-8?B?UGhJRE96NDY4Z3k3MC9KOE5LajFEb1JSMzBXaU1GU2oveGwzVTU2TUhlb3Vr?=
 =?utf-8?B?eXladjBjRjkzSzBVNVlqTXQ5YXJ3Ukc1eHhIWXRLZFNPaHhRUkxGT2RuRXE5?=
 =?utf-8?B?Z3Q5bjNULzlXUHVDSXpOZXQvNWNyQzNPV1ZvVnRCWGtlYWlpU2RSTlM2azB1?=
 =?utf-8?B?WUYvYmV0bkNvcXZVcUpJRjRFYWNSOHM0ZVZ4ZUE3YzVKcWlFcnNEdkJuaWVW?=
 =?utf-8?B?WDRkejRkY05ia01lMjhINVFHNGIyQWVKbVNPR1VQQ0pCTThCamg2VEo4Vlg4?=
 =?utf-8?B?SHphcUpIRDdtcjN2NnFheWZwV0xycExlbnN4Wi8xWkl1Q0piUWpHSFpoOUV2?=
 =?utf-8?B?RU8zbGQ1WjEyd201VnhHeWtIMmlGTVpwbUJQejNNd3loVzJ0NmdHemVjWFBl?=
 =?utf-8?B?WWhlMlNRZHlWVGNWYytwWFFUMXRDR1V6enhzR3oyK1NNMndvaGM1bGdHLzFu?=
 =?utf-8?B?Y3lVOWN5U1FEckhiV0QyMUNtZ3VKc1ZKZjdBa2lNWSsxU0RmYTFXS0lNNmph?=
 =?utf-8?B?TzFCTzBzVWZTNDFaekZzS3B1U0owV0s2bHFjbUJDTWVyOFVRMy9QUWlGSzI1?=
 =?utf-8?B?K2JLTEZJWjhtUnNIUDlMTnpwTitITlZ5TFZ2QzE0SE1jNWR3SUttL04yUDlp?=
 =?utf-8?B?Q0FobFFnNFNEU3hEQy9EQmhJNVVxYlRhS0pydHNKZmxmZWRUYk5GS0lBaWRh?=
 =?utf-8?B?QmQzcmxxYWNtTGFJbTkyZnZXYTh1MzNnZHIzSllCbHA3RStvTEJpeHB2TDJj?=
 =?utf-8?B?dGFlc3haSmRhVHhJUzI0azVTdUg4S3lMN25vOUZMV2JWZ1M2OW1Oc3F0cHB4?=
 =?utf-8?B?d1VJOXNKZ3JzSUVmRW5Md1k5QnpUM1plYzQrK0paSjhQcTYwY1VuL2FZUSty?=
 =?utf-8?B?R3NrZHBldW4wdldqOWF5OGJOelB0M0xUL3p1NG14M1JHVktHejVldzRJRnhl?=
 =?utf-8?B?cDRBcCswTFpXZEtxdkhQOWVPbWZQVzhaS0Z1Qkc3eHV2U0M4MUIyQzVjZVBz?=
 =?utf-8?Q?uhuNiX9fyQM5Oz1HoVWP4UZF+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8006727e-e747-49c3-c186-08dad88ac1d2
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 19:39:29.6341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7O911krPwstq6Cmc5u/w17iZB+FkKQYyD79XgKOPKZx6PSFAnlNNR/LGMSH8qM6RgqTn4hweDKiXYInyRHz1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879

Hi Julien

On 12/7/22 8:28 AM, Julien Grall wrote:
> Hi Vikram,
>
> On 07/12/2022 06:18, Vikram Garhwal wrote:
>> Dynamic programming ops will modify the dt_host and there might be other
>> function which are browsing the dt_host at the same time. To avoid 
>> the race
>> conditions, adding rwlock for browsing the dt_host. But adding rwlock in
>> device_tree.h causes following circular dependency:
>> device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h
>>
>> Inside arch/arm/include/asm/smp.h, there is one function which needs
>> device_tree.h, moved the cpu related function to a new file:
>> arch/arm/include/asm/cpu.h
>
> Given there is only one function, I don't really see the benefits of 
> splitting smp.h and then adding #ifdef CONFIG_ARM in the common code.
>
> Instead, it would be better if we don't include device_tree.h in the 
> header but in the c files that need to call arch_cpu_init() and 
> forward declare dt_device_node.
>
This was my initial approach also and there were less changes(compare to 
my v4) but then though someone might have issues with forward 
declaration of dt_device_node in smp.h.

> Another potential approach is to move out the percpu_rwlock helpers in 
> a separate header. The advantage with this approach is we would reduce 
> the number of definition included everywhere (there are not many use 
> of the percpu rwlock).

Will check this option.

Thank you suggestions!

>
> Cheers,
>

