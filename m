Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C084573A539
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 17:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553713.864434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMRX-0005Yr-Kd; Thu, 22 Jun 2023 15:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553713.864434; Thu, 22 Jun 2023 15:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMRX-0005WL-Hq; Thu, 22 Jun 2023 15:41:55 +0000
Received: by outflank-mailman (input) for mailman id 553713;
 Thu, 22 Jun 2023 15:41:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vm32=CK=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qCMRV-0005WF-PS
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 15:41:54 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cda6ee0-1113-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 17:41:50 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB8564.namprd12.prod.outlook.com (2603:10b6:8:167::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Thu, 22 Jun
 2023 15:41:45 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 15:41:44 +0000
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
X-Inumbo-ID: 4cda6ee0-1113-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ9tI8hwXCN4QABZIEMGvVuER8O/2qDNlQOekzrIvgcMPyajXsi6cARVcWjPAe6XSAXACcI4gi7SkW4xa/qT0ocCJbuRHZNhZI0n5imV8x7tTZ4KmU58AARxQfXuRSh06BbD+h9pCQqBg4M96YMD/twQxg0I0t+ZleuwJSSAWMjJrtojyaJmcztSrd6rPJcL3B4a6e1h3tfq5QeNuDsfA46MCVUYy/BxPLdNNNUi4SvmwGJwARmPGMMYkOYqLfEqhp2uuRwpEmJA1UeXiF50id67MkyCXemRNsDVEBCfz9LtqebwedBjGWMS+y6/PsdoGm53I05Shee1izGS/e+Tbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sZsReLBiQg+gJcFL6VFnpWoaS8VuGcE112WdT8rge0=;
 b=bgZut/f7zIQbtEGbEinR+2nL8JBXg9an7o3p5qfcibGqzrIkiob/8eiNYxk8eap7Vp577j2KRpK98t71D4YFS26HiM8wkgjAi37DyP0YoZqT/OYdyQPjSuUXC7VhD7MLxd6cI9jFaI765r9SesIdCpx1OwTkSlCZfGfSMymwmWBSU4K67pRNaMK94Aq/qxjyzZnD4sQxYHzUijDhfFy7/XoN97vKsvDXf286T8FcZd1Ia9EXNJUAIwFHdVliBUPEnq/Jq2GP6VfgQ0YLgsvavtY4IJRMNUW2tJNpaVIjeVtxpifCPfu+y3tlOb5QJwvaSz+FuZeBJPg96SRTCYXJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sZsReLBiQg+gJcFL6VFnpWoaS8VuGcE112WdT8rge0=;
 b=OAFx/RpkIyXTCslIO1VEFqGm4dbvamSxwdjEJGNOUZy2+NDtF9iEowu6IpsnOkjjaKFxG8Pb2sJnyMGvNUil2FzRBZRCvX5Fxw1iUpg9c8B6IgyQQYrh7uLg263+YmezI8z9PoL3G+TgtV4zsai/ZvYAH+T5xQ5AcpSYzkPRQYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c7ca9356-ffd7-8fdf-3a69-5267f2957815@amd.com>
Date: Thu, 22 Jun 2023 16:41:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v1] xen/arm: arm32: Add support to identify the Cortex-R52
 processor
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230620151736.3720850-1-ayan.kumar.halder@amd.com>
 <d92e26fb-86d4-1681-0d10-be6c2e2cc846@xen.org>
 <d7701ff7-4cee-800a-69c9-deb8560804d3@amd.com>
 <3b7f584e-700e-4598-f36e-51a96140323e@xen.org>
 <bdaa74a7-8707-62a0-fcc9-24f80772a104@amd.com>
 <030fc5e8-8293-2306-06eb-9275c2a2c9e5@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <030fc5e8-8293-2306-06eb-9275c2a2c9e5@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e5167d-0467-4cf2-6632-08db73372e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	23z432xOtJyuJ60tEIWx7zzTBsFVlI8ZWyFDKHoRkjHoNn5hWqktkAT4DraNJt3bQOAXp1BoyvEBoSDOBfPwR6Oo9qMas5unHdwBXnSP4b4EgResnHbH4mj0F2uvg/q/okIq+qTulnrZ59oFHNBRWQFS2OthUXYfHZiigObbBIAqtzCvHhbpOBfHzK4vprT1iS/srDR7hQ96F4k3xxSdDAXCIn2x0ttQaQPOZZxyi10GuehJLyPTqWn1Fap3PU1eYlg+DaUd+JeIusm2iDnm+2vXEhYnyEN1gbcph1Cn0DYbYxEsaBWI7DhGTS383NJMelOgXnaheClBzLy9G5XSRKWcuP+Y1rUdox1w9f48O81ftz6AHj087vnp4iUUu2LBUHmX5uQCaaAeZ0rqQX1HUxOX5VK+YAuCHxOpkrKkZMfoebH4GVokc5729pQnOaAA0ZtP2dWruTYgzHn5GZps/bA2X7pMzPZUbcuJIloQqyZqGDLS/kBcnfzd8MDItMjTGn4RPPuASR33tqQ9hTviANgDilILoSx15agcsHWGde9bXUvVAW4M6O3W/hNJrSm8RFwWVUTwBdykqN0ifChcfhYdpqG9oZ284T+YXPzrGFUKA+pvdgQ6F01+UyfgTce2mr2WjZ2ClvOgtZgRh6722g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(66556008)(8936002)(66946007)(66476007)(5660300002)(110136005)(4326008)(6512007)(186003)(8676002)(6666004)(6486002)(316002)(38100700002)(36756003)(478600001)(6506007)(26005)(41300700001)(53546011)(31686004)(2906002)(83380400001)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3NJcm10UE1wKzA2VFd4ZHpSQ0VZdGxTTmhoYWwycUdWbDhLMHFXakhqL0ds?=
 =?utf-8?B?YWZBbnBwYjA5eno0aFRVOTFNNjI2dkloSWlSUm9oc2N6SU1ueWJhMjhvZk9p?=
 =?utf-8?B?dURJN290c1ZTaHZFNUo1N1JJUUQrVzYzaWtoRW9lU1F2YTlyZWhFcU15bGd4?=
 =?utf-8?B?QUYyejNnWnlaNUhyaDFweHNyazRLT0svOUljaXNHNjZ3ZHVxd1JGdFpBVWZJ?=
 =?utf-8?B?aURvYW1kaEg4a21PdmYxZWhBRFpyWjVQdWpWemVSUUFuSEsrd2FHUUpxbTR6?=
 =?utf-8?B?SmorYXVMUjRWWXQ1TFBzT2pobForSHFIMzZIYTNqTFBVa3RseWlMZS9XL3pN?=
 =?utf-8?B?YkFjbUYzTy9adTNxcUJYSzJ6UExrbXlhRVJTa3htRW5DcWJxV051VVl3RU5X?=
 =?utf-8?B?c0lOLzIySU9ZbUphUVI0LzV2cytDYjk1b3ZFQ2hwaXJBRUxmMFJGNUpMTDdL?=
 =?utf-8?B?MTlTOHU4VjdPaHpSTkc2QTN3eG9uV2lsQ1RMK2lvSmNESC9zUlhJcDJmM0F3?=
 =?utf-8?B?UGNUZDZYYVl6Wlg4QklwejFGN3QwMzdROFc0OURYMnlzNEFKN0Uwc3RKQkRW?=
 =?utf-8?B?ZjdRRXFhSlpNV051YmZaOWZ4cmEvOVQ4VlhjMEtyeVUrTFprQzRCZkRSeTFS?=
 =?utf-8?B?R24zcVBySWMwTnRBQnpGenJFN2VkTEx0MEFySDE2b3JrMUZkeVUrYkRYQjVh?=
 =?utf-8?B?cGZ1Si9PNWJwTDM0d1ZTOVVRVXMxcmtKM0VNbnNSRnFIK29ISExnMlNSYVV1?=
 =?utf-8?B?c1RtbGRiRTI1UHN6RmRJVnRWaTZ6NCtnQmxYclBKN1lRRzdWV29TK2wwOWw3?=
 =?utf-8?B?a3lKUzJ1MmRoa0lSWndGNW8rQjVPM0FrK2YvZHY0enIreU4zcEdVRnNmTzBx?=
 =?utf-8?B?dTk3MURIT2RZS3F3Vy9OK1FkaHNsUDM1OXdUM2VLYVN1dXNuaUlPTUwyM2Vh?=
 =?utf-8?B?TFV3Z3ZoSHM1QVErYlh0ZDQwTGpjTXFiYkczV1BHamdodTRjdEdDMW1xZldC?=
 =?utf-8?B?RVpxTjIyQnRUSS9HYzBrcnk3aU9zTllkQTlYcWRmSzMxZWhHbFZOQzlsWlI0?=
 =?utf-8?B?dHNwRUphWWk0UXJzb1VKWGhBeHMyMVBhRFhYUFM5WTk2MjAxTG50ajdPeCt3?=
 =?utf-8?B?M3dLMTFrNkMyRjQwU1JobFdnMitJdjV3MmR6aFM3TFEvUnVPRGNyZUVia01v?=
 =?utf-8?B?aUxUTkNJQk5aa3FCZU9YNlROZnoxcTBWSnZwZlBIRHFCOC90S1NteUdjSU5J?=
 =?utf-8?B?M3BSSTF1bzkzOTNEYVJ6QW9yRmJTMTVkZk5qTlNKbzdJWVN4b1JFamZSZTNT?=
 =?utf-8?B?RHRSSUtXaisvS2Z2dEhSNGQzN3lJWGIxMWNzTEF6Ym9Wck1uT1F4RWc1bUZy?=
 =?utf-8?B?b1psOVFKb2V1Zk8zdmNSd1VCQmdaOVdrVUhLSk9VcXNMeUJJRTByMC9ZTnNX?=
 =?utf-8?B?bWhjZkptd1dkeEhkZll4K0NMTDRMYWNDd2poV0dMYVBzam50UnZad2dYQVY2?=
 =?utf-8?B?eGxFM2d1VVcxOFZ5bzZrcHhROVlYazFoOFlDK2w0Qkk2ZmpVODhoRHdSZnh3?=
 =?utf-8?B?cEp6TFVQZkJ0TURYVkZJYmRWWWZIWmJWeDBGeExZc3BySzYya2Q1N1FlTGpL?=
 =?utf-8?B?T0ZmQXAvRU43aWdsbiswZHBRTDFybFBUZ29uTTh1amZNU1lxeGJWTldzbTc0?=
 =?utf-8?B?cWdrdnA4N3EzUkJYUWJGN0J0bFhnQ0xtWEIrNFpqZGFnWm1RdkZtTUN1bDM2?=
 =?utf-8?B?ZFlTeGlWaGNtaE96aXRPN05QaHJFeHRFay9yRVppNyt4TFJKQjJiSllpQk02?=
 =?utf-8?B?LzNvZ1IwOUd6MHc3b2p3ZkVkZUh2ZldFV3JVRFkwMzdLQXEzMWdJNWxnMjlF?=
 =?utf-8?B?YlR0TlU4aC9YWmI4Z1RHS2xYK0JIVjJMdDN0Vm04T0N6SlIvMVlFWmFTU0p3?=
 =?utf-8?B?aC9tRFFGSVIwSTh1ZmxUeXRaRnVXenZIUzJLdWxhNlgreGlLVnY0T3dlUTk2?=
 =?utf-8?B?ck9ZS2ZtMEtSWm9IQjluTjg1emhzU3V1U2JETzJBMFdNd1AvNzZVK3BZTEZ0?=
 =?utf-8?B?dDc4RFBIVGlVYk9XN1hjRlM3NmFqbFZacU1hS2NJRUlZMFdxc25NSEtsV0NK?=
 =?utf-8?Q?k993b0SgP1KvzmTm5A4uBw4yr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e5167d-0467-4cf2-6632-08db73372e99
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 15:41:44.8911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALxRCGTCs0u9suGOXwXKt4WIrbs3YBuTZwdhHBNFZO8xXEwHMQNrE/eWhHbM8zj6BEv5EWvu7xkCNS5bTZDyCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8564


On 22/06/2023 10:22, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 22/06/2023 09:59, Ayan Kumar Halder wrote:
>>
>> On 20/06/2023 21:43, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 20/06/2023 19:28, Ayan Kumar Halder wrote:
>>>>
>>>> On 20/06/2023 17:41, Julien Grall wrote:
>>>>> Hi,
>>>> Hi Julien,
>>>>>
>>>>> On 20/06/2023 16:17, Ayan Kumar Halder wrote:
>>>>>> Add a special configuration (CONFIG_AARCH32_V8R) to setup the 
>>>>>> Cortex-R52
>>>>>> specifics.
>>>>>>
>>>>>> Cortex-R52 is an Arm-V8R AArch32 processor.
>>>>>>
>>>>>> Refer ARM DDI 0487I.a ID081822, G8-9647, G8.2.112 MIDR,
>>>>>> bits[31:24] = 0x41 , Arm Ltd
>>>>>> bits[23:20] = Implementation defined
>>>>>> bits[19:16] = 0xf , Arch features are individually identified
>>>>>> bits[15:4] = Implementation defined
>>>>>> bits[3:0] = Implementation defined
>>>>>>
>>>>>> Thus, the processor id is 0x410f0000 and the processor id mask is
>>>>>> 0xff0f0000
>>>>>>
>>>>>> Also, there is no special initialization required for R52.
>>>>>
>>>>> Are you saying that Xen upstream + this patch will boot on 
>>>>> Cortex-R52?
>>>>
>>>> This patch will help for earlyboot of Xen. With this patch, 
>>>> cpu_init() will work on Cortex-R52.
>>>>
>>>> There will be changes required for the MPU configuration, but that 
>>>> will be sent after Penny's patch serie "[PATCH v2 00/41] xen/arm: 
>>>> Add Armv8-R64 MPU support to Xen - Part#1" is upstreamed.
>>>>
>>>> My aim is to extract the non-dependent changes and send them for 
>>>> review.
>>>
>>> I can review the patch. But I am not willing to merge it as it gives 
>>> the false impression that Xen would boot on Cortex-R52.
>>>
>>> In fact, I think this patch should only be merged once we have all 
>>> the MPU merged.
>>>
>>> IMHO, patches are independent are rework (e.g. code split...) that 
>>> would help the MPU.
>>
>> Yes, that's exactly what I intend to do. I will send out the patches 
>> (similar to this) which will not be impacted by the MPU changes.
>>
>> So, that both as an author/reviewer, it helps to restrict MPU serie 
>> to only MPU specific changes. >
>> Can you suggest some change to the commit message, so that we can 
>> commit it (without giving any false impression that Xen boots on 
>> Cortex-R52) >
>> May be adding this line to the commit message helps ? >
>> "However, Xen does not fully boot on Cortex-R52 as it requires MPU 
>> support which is under review. >
>> Once Xen is supported on Cortex-R52, SUPPORT.md will be amended to 
>> reflect it."
>
> While writing an answer for this patch, I was actually wondering 
> whether the CPU allowlist still make sense for the 32-bit ARMv8-R?
>
> From Armv7-A, we needed it because some CPUs need specific quirk when 
> booting. But it would be best if we can get rid of it for 32-bit ARMv8-R.
>
> Looking at your patch, your merely providing stubs. Do you have any 
> plan to fill them up?

Actually, I would use cr52_init in a later patch to write to CNTFRQ. See 
below :-

+#define XPAR_CPU_CORTEXR52_0_TIMESTAMP_CLK_FREQ  800000U
+
  cr52_init:
+        /*
+         * Set counter frequency  800 KHZ
+         *
+         * Set counter frequency, CNTFRQ
+         */
+        ldr     r0,=XPAR_CPU_CORTEXR52_0_TIMESTAMP_CLK_FREQ
+        mrc     15,0,r1,c14,c0,0  /* Read CNTFRQ */
+        cmp     r1,#0
+        /* Set only if the frequency read is 0 */
+        mcreq   15,0,r0,c14,c0,0  /* Write CNTFRQ */
+
          mov pc, lr

- Ayan

>
> Cheers,
>

