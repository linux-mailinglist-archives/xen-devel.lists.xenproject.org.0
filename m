Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD84C6D0A89
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 17:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516787.801468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuew-0006Xi-Oh; Thu, 30 Mar 2023 15:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516787.801468; Thu, 30 Mar 2023 15:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuew-0006Ve-Lg; Thu, 30 Mar 2023 15:57:54 +0000
Received: by outflank-mailman (input) for mailman id 516787;
 Thu, 30 Mar 2023 15:57:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IhQB=7W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1phuev-0006VY-Om
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 15:57:53 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fcd63ad-cf13-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 17:57:52 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY8PR12MB7292.namprd12.prod.outlook.com (2603:10b6:930:53::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 15:57:47 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242%4]) with mapi id 15.20.6178.041; Thu, 30 Mar 2023
 15:57:47 +0000
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
X-Inumbo-ID: 9fcd63ad-cf13-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYC1JdqCcME2zvcoXsp9zCXyPc68wndURkltdag9ItUufUplOfzBeTcP3FgFXOLTrZEvbZbnh6I5PuJorf66WB0ToRxomATd6CiVtO5EZrm/p0YZpctwLw9VOZ+uXqJZHVXNvJvMt9QUnW1FHmxZCq1uQHt7IYSQlgmb0SrnQU/K79aaqUCc2dRHke6PFirFsKn+pdgLOk0YkJft+bPHDvd8b/pygkVcKOVRqxLBHu/c0uKpmm4j7DewGwYPWioLPZoYYAtHu/GbaLVpZc3bPjAqy9l8uVnUobhurRdUzfdehLuSboWhkMCNKY4S1NPPSEBRep+UmvFJRlNk6Bl+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5HwkUDx95h6sNWQjqad4mtQrWIR3hbH2JzrcpAvgyY=;
 b=CyFtqE232GC8A61kkojb9fP6xQHYQj4z8hGtWLoGQwI3FEFWE/v+eDZZKlt3A1t9MrbgUkLL4W1fCuLAkK+8CnmcaeNmaBrlSPCUg/ONu3/ZCkWOGcqD38h0G2WKtvwgl+Q38VmOMWmRcAWz2KfbOhRbNE1KD1w7FrNx+CgXdcfLWJhTuSCC5CJTeKw2LWwOBg1Cts0iBfvFFzDk7Qm2D10OdfvazRCw1u6I6gTCPK7yJofcA+6rLdT2O6ODa1Fbsh7HOR31Mo14RFwGMfCapVf/wPsecMwzDO7460XgS1z0oBYW9tLUfnmfemBa4iOCppWoqgaCl9NOcdiHXuYImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5HwkUDx95h6sNWQjqad4mtQrWIR3hbH2JzrcpAvgyY=;
 b=As2Ep12pbQfE6vwnF/prmTMWuAaeVzfd8QVJ1l6HihThLj81axPRCL+uOpp9bWwL+4fEuLRwmoqDd74dC1NQmBBMgl/LrYeOW65VjocCGMoxqeMMo397oRf+qKahID3Jx2d6+OOyVlwGuLvHLOHOsTGE2V8v6eNP0zM4LC9fEC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2f7a00eb-50c9-bee7-231e-9285ffa4c9a9@amd.com>
Date: Thu, 30 Mar 2023 16:57:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: Need help on a issue (Unable to schedule guest for Xen on Arm)
From: Ayan Kumar Halder <ayankuma@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "Garhwal, Vikram" <vikram.garhwal@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
References: <b4badb12-8887-d8d8-138e-8b4536ad95a4@amd.com>
In-Reply-To: <b4badb12-8887-d8d8-138e-8b4536ad95a4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0685.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::8) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY8PR12MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: ae619c44-38ec-4e47-c4a4-08db313781c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3oqYFnYD93D1C/Itei5xy2kEBpIeaULyUVRjMWm9ZvHOtoeIO65DmfQ3Lr7GPJELZ+vnEs1ELnF+A+7jmn8gjExixkUddbn3C0IOX0LQqTLDmYnjNJRVAWeVZLZ+28oeBSbF4HCiHH8SVPeWAYT6gatUE4894oKdI0H73heN/8XlJXauMjM9ITFlKU7ilQpjuOkTxi/FK78bq4YIKm/NIqKZXG+CrePrLnR2tuZUARh38G7KSEecFU+DsiHzVsXloks3hdl8A2kGDv8l4U0sAJ+LV8IXLx4D9AwDVHdqWB6pJ8a57ZD00L5Kxn940QVzIU+/c/Lc0cpBs2Xh2165r5BBlPDcMea7/7m/DZMRcjwflZcScLPmI1MlZ3auBNMlTBUeSXO+LCFqMgeC7Fm15FT9qMnnukwZGG+EMnLnhNGM/XEXX/IRqMYj1qxaWbaBHRZLyZhbq7Uk+hJ6Wo9w/HqLazha51J1ijY5G8quCpoocNZOVHfa2YJnVl7LLbrvCn+ftpmIBLVPk9OxXgVMO+US798JnmnNkkIMwpNPwMaE+pfBoCRknEudbQh5dKaOVJrUWR/oeGWDaUZABRZ+JKqyFFsNBSp2GxyFJ+A1IDODSbkvXjaLeIrtw54vlY4UXO8ERLLixB2bZR2MygeSJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(31686004)(6916009)(8936002)(38100700002)(5660300002)(4326008)(66946007)(66476007)(66556008)(8676002)(31696002)(36756003)(41300700001)(83380400001)(186003)(53546011)(2616005)(6486002)(54906003)(6666004)(6512007)(2906002)(6506007)(478600001)(26005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1JFTXdJOFEwNEZFa3ZXYW4ra2twZGFlUlBCV2FwdWhTenlxUCswR25DMk5y?=
 =?utf-8?B?bHBXVkFmRVhYZ3RLY1Z1dEgxS0ViOGpYeEJpZEJNM2VMQnhPT1duTUsxUEJC?=
 =?utf-8?B?Q2luK0F4UEZxU09tRzY0Ym1GaU4zN0hEZmYxb1JkYWduaVNOZlJTMmNrRUk2?=
 =?utf-8?B?VDNma3FscmRyRlROckxra1VXTmhMSDRheTd1Q0xkVlZBYmJZVW0zdjNCQzFS?=
 =?utf-8?B?VjlmR2o1YlVlQk5vQlAySTFtdGZjTy9zY0l5dDkxMXZJTldMUmJZOGFkQmxL?=
 =?utf-8?B?azEybmlOdGZPQWRJR2FJeGNYSUJuWlpRU054TFAxNmhOQ00zMEN6bDZqWU10?=
 =?utf-8?B?RHQrSUxzWFcxSFdlZGI5cFlPRlY1VElCMEVlYUdzRHNQMEtpV1VjK1N2RHU0?=
 =?utf-8?B?eVNRN3ZBbXAvb29kaUhidXc1eEVQMkhEbnNrais3dkM4TFkvYlZaQlNZQTdz?=
 =?utf-8?B?WkZvdFdJVWZjSk9HbE9EbldKK1N3SHhETm9BNmJ1UCtGQjZEdi9HVWNIOHg1?=
 =?utf-8?B?Z1R0U1QvOWNFTkp1RGpJU2Vzd25acDFtWDhNSFlqS3hSTElLQVJSVDdTRjhu?=
 =?utf-8?B?WUNobC85MkI3OGU1RkJmY0R4UDdYcXZkTGh0T2h6MHhSYk9ELzRycC9vTVhC?=
 =?utf-8?B?WjM4MURQdjlkdExkWXF3SEM1bzF1dW40ZWhKb1J0NkNIKzg4UzhWLzRNVmQz?=
 =?utf-8?B?N3NybkhhYUhHSXQwZk10YnZYd3FzcWkwMXh4SUpIMUlzbmpmQ0xrRXpNZTRS?=
 =?utf-8?B?WTZSNFN0VWpIWjNrZUZ0Nm9wZGIzNUloOGoxbTd2OSs0blRpT2wwUGNBZUM3?=
 =?utf-8?B?VUJVd0JjNDlTbUNjVmFVSUp5a2x4bUR1dWtsenJMOE9LWVBCaDRaWUdsZlVQ?=
 =?utf-8?B?aEFSUFl2OUowcUZsWnhrUjZtM01FMDFMeEp2Tm10T1Rudnk5WFM2emhmSS9z?=
 =?utf-8?B?UnhWTDJqbnBXQWVOVXNqSE1VVk00OEN5bXg2Tk1KV2RjRmlNZFlEUkFaR3Fv?=
 =?utf-8?B?VkJ5cTRkTVFDM0ZENzA3dmVNNkR0VWd3TDhYNk9lVEtnVmFmVjc3Nlpnczg1?=
 =?utf-8?B?UmE4a1RWRURqZk1Sd1F5b3pPSWNTOHhseGpNSlBEdjBobzN6VUFqNjBhdEVl?=
 =?utf-8?B?SE9HUlpLT2dFanRTVUMwamNCWk1xMG1qY2xnUm1abjVXd3IvRStOOTdLZ0xG?=
 =?utf-8?B?bzVMMFVHajZVWUN2bUFOS24vdHAycTQzMVVwU1pHdUdHUnlQMU5jTTljVGlv?=
 =?utf-8?B?d28waDVGc2NuNy9xTityRlZtUnMxWHJ4Ni9mYjA0UWtKOUtySm8vbkY3UjVJ?=
 =?utf-8?B?WFJQVmFZZ2ViODdxNForaUZiT0hvLzNucGNNdDZZb1JucllJLzZ3bWEvR2Ny?=
 =?utf-8?B?TEVIL2w4d1QwZnRkR3dLQjlucFJJUXV1ZEh6a3h6YkNxejhkczJncmpINmdN?=
 =?utf-8?B?QWlvUkJHNEhCeDNoM1AwY3g0c05Cd05sOExHSllOVDVveksxRVEva09GTURU?=
 =?utf-8?B?OUtaOEs3QXNXZnNmQUFuMFgwVDl2TU03QU14aUo5OFFGYkE3N3BMNlVVOVdh?=
 =?utf-8?B?cGk1UWZlRXNGWlpFYmNHV2J0QWgrdzVZaTVWN25ZajdvWkpMdy9XUnhVZ3Y5?=
 =?utf-8?B?OGl0REttNzd5WVYva3p6RU5ybmMzOVVVckVWTVV2eXNXUkE5S2VObUYvcGhq?=
 =?utf-8?B?VlA3RUVNZnhiMTcvUEdkSlQ4bFRHa3ArL2Q1aDdsakdtcXkrR0RvNjhEeDFX?=
 =?utf-8?B?MU5JRDRPRlF5c29yMWxheGd6QTM3b3BRK1FnMmNpSE5TNVZWRi9pZmhBMERE?=
 =?utf-8?B?OWg1WXhCK2FHUjlkZzZUbU5rR2lwZXJTTTBJRURiWHJ5T3ZGQWg1aWRYeEpq?=
 =?utf-8?B?cHFOaXZuNTFteGRLUDZTWUJGT2IzWGdoQjNkb3I3N01HRW9RbExnQlpVMGF4?=
 =?utf-8?B?TDdQbitPWXArMDM0elNJRjd2cTgzOUx4YnV6RzVkdytNMDdOMVBNTVBZK2hs?=
 =?utf-8?B?ZmdIc1FtcCtkSHBER0MzaDVCUHVodmM3TTdEY21XMlV1bCswL09PcC8zaERp?=
 =?utf-8?B?MSswaWNyWEk5dWJHRGRFeWtoOFc2cmNIWVlvaXRpVTR6bmErWHZyQnB0S21a?=
 =?utf-8?Q?R6eBWnrO2rSkJRFYSlFxZiQU8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae619c44-38ec-4e47-c4a4-08db313781c2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:57:47.5388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILVDm09NxraRBFgjMkt8GbaFmOUKCxMFI3Yr4oh0BiDyTzOSalIoE0qu58DF/EcV+7xSemy9T1whuyArNHi9Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7292

(Apologies, fixed the formatting issue)

On 30/03/2023 16:50, Ayan Kumar Halder wrote:
> Hi Xen experts,
>
> I need some pointers on an issue I am facing.
>
> I am running my downstream port of Xen on Cortex-R52 hardware. The 
> hardware consist of two R52 cores (the second core is in lockstep 
> mode). So, currently the hardware does not support SMP.
>
> The issue is that Xen is unable to schedule a guest. So 
> leave_hypervisor_to_guest() ---> check_for_pcpu_work() and this does 
> not return.
>
> Debugging this, I see  check_for_pcpu_work() --> do_softirq() --> 
> __do_softirq() --> timer_softirq_action().
>
> In timer_softirq_action(), the problem I see is that for all the 
> timers, "((t = heap[1])->expires < now)" is true.
>
>     while ( (heap_metadata(heap)->size != 0) &&
>             ((t = heap[1])->expires < now) )
>     {
>         remove_from_heap(heap, t); <<<<------ So, this gets invoked 
> for all the timers.
>         execute_timer(ts, t);
>     }
>
> So, further below reprogram_timer() gets invoked with timeout = 0 and 
> it disables the timer. So, timer_interrupt() is never invoked.
>
> Can someone give any pointers on what the underlying issue could be 
> and how to debug further ?
>
> I do not observe this behavior while running on R52 FVP. The 
> difference is that for most of the timers "((t = heap[1])->expires < 
> now)" is false, so reprogram_timer() gets invoked with non zero 
> timeout and subsequently, the timer_interrupt() get invoked.
>
> Also, looking at the following from xen/arch/arm/time.c.

/* Set the timer to wake us up at a particular time.
  * Timeout is a Xen system time (nanoseconds since boot); 0 disables 
the timer.
  * Returns 1 on success; 0 if the timeout is too soon or is in the past. */
int reprogram_timer(s_time_t timeout)
{
     uint64_t deadline;

     if ( timeout == 0 )
     {
         WRITE_SYSREG(0, CNTHP_CTL_EL2);
         return 1; <<<<<<<<<<<<<<<<<<<<<<-------------- Shouldn't this 
be 0 as the comment suggets ?
     }

     deadline = ns_to_ticks(timeout) + boot_count;
     WRITE_SYSREG64(deadline, CNTHP_CVAL_EL2);
     WRITE_SYSREG(CNTx_CTL_ENABLE, CNTHP_CTL_EL2);
     isb();

     /* No need to check for timers in the past; the Generic Timer fires
      * on a signed 63-bit comparison. */
     return 1;
}

> Kind regards,
>
> Ayan
>
>
>
>

