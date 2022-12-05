Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD3B6426A4
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 11:24:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453374.710990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p28e7-0001xr-Cr; Mon, 05 Dec 2022 10:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453374.710990; Mon, 05 Dec 2022 10:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p28e7-0001vV-A1; Mon, 05 Dec 2022 10:24:23 +0000
Received: by outflank-mailman (input) for mailman id 453374;
 Mon, 05 Dec 2022 10:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p28e5-0001vP-VL
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 10:24:22 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa265c67-7486-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 11:24:19 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 10:24:14 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 10:24:12 +0000
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
X-Inumbo-ID: fa265c67-7486-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9Eh1QXbqMN4E4hmigX5kBfBJvF8MtKAjxsSeT9cX96Lzl9BX9PAAzrTiquHjNxyWWzFxqU+KEnOOaoPeT52KVN+Cg6UHTPRx6+T2aB7l99c+lGVLnGLsfufB01pSCvZUgxehVwZAlvKQw36TQTOMPH5bm425DtBN8ybiqI7Gq61a4ypbVn5rgd4hxH8zJpHbZ6yDc53uM+GhCsrGsoNGWHTfYhwSeSqdCopB//M1nK+MW7ZEDRJfB2kvZ6GDWPQZZgLujJWgLagcYkoxIbUhwKCGOjsSwu913z8h32V4Skl0P28BzvJcgWI6eF4HnkZKPxcguWInZXJr8ZMo/mPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHNoaakouzx8u32UkQuVIFtw6w10PoPUrzk1jY4Jm5U=;
 b=L6H+ZsKv0WBohb9z3aIK4PVV61fWkm73qdXex9nB9ReHfplbzgQTTfIXiE2gXlLDn4r6L1fn7rrpNSAybwZXk9sPU06VQmg4jx7oxDdsSivoFUUD8FPch2cxoDVScFMd4g5lE4kHWt4tel+SppQP2VW30W4aQfmh/v65xqPEVek6FUMw8PFw5JuRxaUTj0tIvnp9RdXOLo/Q2hr7y3kvwB64K85HWQC0+Wyr6ALTibrzfH6REvtpG4PPHFITdWG4NoRfCnI+0aHtRz5Kjx3v4r1eobQdVQ/kzn3OGwGaVhOSsD/jSysYRlqR8nerWLiElISj8T3YYdalA69xYVmHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHNoaakouzx8u32UkQuVIFtw6w10PoPUrzk1jY4Jm5U=;
 b=1xz/SmRFCGyBus7JUDb86280ADDkt0S59upHFnlcI6Le1HlbaAGEJdKWCZ43e52863WWO8lK0VrD/5qgOkWnae7I4KROpkv67HLbEzpJTudDAcSkaJFqg75Pu9P+EOd8FgodS8nm5QNL00VakV3r52PCNM5bTNfI46U9/XZOtc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <24d54521-4136-62ca-67e8-e6408104b94e@amd.com>
Date: Mon, 5 Dec 2022 10:24:03 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [XEN v4 09/11] xen/Arm: GICv3: Define remaining GIC registers for
 AArch32
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
 <20221128155649.31386-10-ayan.kumar.halder@amd.com>
 <4009fec8-4bd7-afe5-49d5-89deb4d132c4@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <4009fec8-4bd7-afe5-49d5-89deb4d132c4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: d0756c04-b8f5-46da-f631-08dad6aada20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TMg6ZeZhmA/Jy+QTtev7lr3AmyxX9HXldekP2T5Aj0bjFMy2iQh/T4IcIARoFxssj6fD3QubJSZvuXKFLDK+Ok8fhMq/x9lOZYfz1cuEzeXQBdMtHy8DTEXPtKWBzdGAgnOad7J0z7IKvyvPF+tlzrrI27ReAx1EsHZU8k6Ilx16KdCSAhFWDj5VhNKZBrWoDcKgowd0qvDISM5OP82u6BUm5L7PkfkZnmTHoUeNDGNn17YukuFdQ/B6u3PcCYLoZJ/4OY9cH4/yGBGSXLd7ORNi5ZemAuWf0xqCaEVPCa7nLCdTyKpZM/aKYfCaAmoR0GVlB3dP3ZZdv6O0u3GCB5ITIytZF8gcSmKb5JG0Q2FosDLh0CsuGDURapFR1njA9K45MM3wZC60dbhSGogAocv8RNN6eXHUAfCiEix4sVjHlW1Cb06jMe7xIotzRvw4ccmz/YKflTOUDGsaCTIeRtQXjApHQEx/CXQM1Y8Tk6CO/RlXFzupugxve0Piocp7peELbnGXGkFxQ3sRZ97+8srtXO9ZjFt88M6FPErryDmhfK11dKMMRyRjGvugp2abBJDFGLYvVurevK2T6KQQUEGukbAUIatnn4JAhWrxxse6UnntBa/LiyyWyU3Kh/O9ox5BKHArOe83IFOmIPTOTrGxn0svDp+tacBi93zjdZ7rNVQpy2xMA3QuMt+6b0S/CVZ680adg7qw6q2/RtMnn/GDGEaspNgewPNi1e/D5dw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199015)(36756003)(38100700002)(31696002)(5660300002)(2906002)(41300700001)(8936002)(4326008)(83380400001)(66946007)(66556008)(66476007)(478600001)(6486002)(316002)(2616005)(110136005)(31686004)(8676002)(6666004)(53546011)(186003)(6512007)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWF3L3ZyK1RuRjFudzBUYi9OVmZIMnJsZkx4Y1F2dC9GWHYrZjFKVStQUmFU?=
 =?utf-8?B?T3k2eS9sbkJGVWQ0QWdEUTZiRVNGZGZYZzN3REtKUm9tQWZxckxBaHFRLytO?=
 =?utf-8?B?bW5ta2EzV2ozbzhIdmtOTk5WN3E2dEZYMTBaK0JDNUR6TTJmQlBHendtVDBz?=
 =?utf-8?B?bDV5QU9FZGJ3WTU2N294TlhrL1puZFdzb3l4Sjk0MlhjZlZyeFNjVmNOQ2Js?=
 =?utf-8?B?U0cxalVtcW9aRUpZRDI5dzcxVkNKcHhMUjBvRjFrOFhqNEhUOElXSHRuRXFk?=
 =?utf-8?B?dHpFMWRWbFNqMjZRUUFmUkJNNEdIY2ppTUtBUDVzVEZjUC9zSkdwK2FKcnJQ?=
 =?utf-8?B?MjJnQ0Z6YUY2MFZ3L29JVXk3SFVmWlNOdUdEL09SMHA0a2owVktBTXpXZEc5?=
 =?utf-8?B?dUNXM0pTZFZQUUR5VUM2bkFLSTZkeFJRV3FVSWt2ZC8reEV1M2JWQ2hJUW44?=
 =?utf-8?B?OVFueXgxK3hpR25DRFBKb0dNRWk4eVVmcWE1RFZZRlF5Q0JyQktOS1d6dGpY?=
 =?utf-8?B?bHNLeEpnVEJZRURqVjNpSzVmOFE2a0F5K3lLTWVzZWJWT2RmZGVyK0JhQW5o?=
 =?utf-8?B?SE56Y3pXQm9RN3F1ZmNpaWROeU84a0ZIVXgvUzQ3L0pERmF5dzZicXNHc2k4?=
 =?utf-8?B?Q2h4T0lDbTREZGFHVXBweENWdlppMHlDbS90eDI1cTU1T2lQNnZydGV3Zm4r?=
 =?utf-8?B?VUpLNWZxc283ZitHT2E0eWozTE9TT0lkazNaRnpxZVpEVU9OakptMGNlMjVo?=
 =?utf-8?B?RkR4SzltTjJRTGROWUlYWjhLM1libExWdTE4QTFQb2Zhc0NZcm1leSttT1ht?=
 =?utf-8?B?OGJHcG5xMndLL2dndmw5aXk4U29DZTd4RGh6Mmg2enZyZ1lyQ2VNUWVST0tP?=
 =?utf-8?B?akRLWjN5UmtVbjZHTzAwdStKeCt4MllKZEsvdFFZRXlSeVhOQzRzV1YrZVBv?=
 =?utf-8?B?U1dBSWF5dFIwVTIyMDlpZ2xPY05vOHlRa1ZtMDlDTy8zall2aUpyeG9WSGVL?=
 =?utf-8?B?UTJQSW9NRVp2cVBYVFhtamNPbmZ4OU9mSHhKUEYvekMySmNSWnlDMjg2M21L?=
 =?utf-8?B?YThEM216OEpkZ29nMFpWS3hTcWpmb0k0Z3hGb2Y0RTEwSWkzL1l3UG1zQzda?=
 =?utf-8?B?eE5JblQ0MkhuQmVvSmRveHh3RVh4Yi8zazVSbk5yUU8yT1VrbG82Wkdxc01X?=
 =?utf-8?B?bGwvZjB4ZktuVFhhc2d6ckNuYUh6ajUwS2NpanNsbEpzTk4rMVF1NTZWaito?=
 =?utf-8?B?MVNXb1Q2UFhlV0licEpvQVc2cmJqbHFyU1FETnk5bC9EbDNHOUR6WkQzLzRP?=
 =?utf-8?B?S29HRnVHaVdTLzBKeUtmbmVsZ0NPdEJSVldXa1FlV3UzcmdPTzlkWFBvTzVk?=
 =?utf-8?B?aUJtb1M4MVpuSmlWQm5Bd2JaZlgxSnUzMVlpNklSUWRkajhLcmk1VWdBRnN2?=
 =?utf-8?B?eTd4TnB2MHB0amFHSEtuNUpZVE5sME03cGxNWjVWZXBwWjJZdGpzZnJsZGY5?=
 =?utf-8?B?Q2pBczF4Vjc2YjNIMzZLazUvUnhYMVhYbWwxS2tvWWJMU2tjbVZIODVYTk1x?=
 =?utf-8?B?NUxvcDVuK2lFam91T0Fxc0pXbjJoZHlzOWcyT0ZrUGhKQ0k3ZHdOSkVlT09K?=
 =?utf-8?B?ekNObDdTMWZoT1h6TFcvNENGanl4WEgvd0dpNUlYVWpGNjBUV2VGRXRQZ1Ra?=
 =?utf-8?B?SWNEMzUyUXFscXFaWjNpUUdmcWpIMkxtSFByRVpueCtsaDREZnBSTFNtZHpC?=
 =?utf-8?B?MENUdk9Rd3pwSHJkNUlZenV3Nlg4UXdXVE00cGd3YWZyN0FTUS9zU0p2RlNW?=
 =?utf-8?B?NkxCWEZlSmF5Z1VrYUozcm9qTXJPT252M2RKK2ZtRnI1RXJGZHdHR1E4bW1i?=
 =?utf-8?B?dm5pRExoQWZXcWNpbmphcmQrZnBkRXNKSWdmWjc5SloyQXQ5by9zRTdmQlR1?=
 =?utf-8?B?azIyTWhVVWczaVZuRmVhYXBzR0VJTWpMYXZNaXhvcFBWWFVNNXd4Q0cvNnNj?=
 =?utf-8?B?WmRDMzE1T1dyL2RtQjF3amtWWmlEWHZGRG5OUk5VWnNEUUhHOTA1NHdwUU5T?=
 =?utf-8?B?WXFZVlBtRnFGOUFvTVVzOGV6SXB4bGhJZGFrajhySUtKdXFITTRkbTdEdjRu?=
 =?utf-8?Q?FuLcKoXTYalHxcdmcYbvUxnx4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0756c04-b8f5-46da-f631-08dad6aada20
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 10:24:12.1223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5uF8D8w9s3sl+QhONeWyf7pacOMPdz+xbPbzxmVVBiFwbPqvFmjBM0npx+VhfEiVTwigp9pTXRYJcbvOo2VBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495


On 29/11/2022 14:57, Michal Orzel wrote:
> Hi Ayan,
>
> On 28/11/2022 16:56, Ayan Kumar Halder wrote:
>> Define missing assembly aliases for GIC registers on arm32, taking the ones
>> defined already for arm64 as a base. Aliases are defined according to the
>> GIC Architecture Specification ARM IHI 0069H.
>>
>> Defined the following registers:-
>> 1. Interrupt Controller Interrupt Priority Mask Register
>> 2. Interrupt Controller System Register Enable register
>> 3. Interrupt Controller Deactivate Interrupt Register
>> 4. Interrupt Controller End Of Interrupt Register 1
>> 5. Interrupt Controller Interrupt Acknowledge Register 1
>> 6. Interrupt Controller Binary Point Register 1
>> 7. Interrupt Controller Control Register
>> 8. Interrupt Controller Interrupt Group 1 Enable register
>> 9. Interrupt Controller Maintenance Interrupt State Register
>> 10. Interrupt Controller End of Interrupt Status Register
>> 11. Interrupt Controller Empty List Register Status Register
>> 12. Interrupt Controller Virtual Machine Control Register
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> with one remark...
>
>> ---
>>
>> Changes from :-
>> v1 - 1. Moved coproc regs definition to asm/cpregs.h
>>
>> v2 - 1. Defined register alias.
>> 2. Style issues.
>> 3. Defined ELSR, MISR, EISR to make it consistent with AArch64.
>>
>> v3 - 1. Rectified some of the register names.
>>   
>>   xen/arch/arm/include/asm/cpregs.h | 32 +++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
>> index 53142fc2b2..8f4d097a15 100644
>> --- a/xen/arch/arm/include/asm/cpregs.h
>> +++ b/xen/arch/arm/include/asm/cpregs.h
>> @@ -163,6 +163,7 @@
>>   #define DACR            p15,0,c3,c0,0   /* Domain Access Control Register */
>>   
>>   /* CP15 CR4: */
>> +#define ICC_PMR         p15,0,c4,c6,0   /* Interrupt Priority Mask Register */
>>   
>>   /* CP15 CR5: Fault Status Registers */
>>   #define DFSR            p15,0,c5,c0,0   /* Data Fault Status Register */
>> @@ -256,6 +257,7 @@
>>   
>>   /* CP15 CR12:  */
>>   #define ICC_SGI1R       p15,0,c12       /* Interrupt Controller SGI Group 1 */
>> +#define ICC_DIR         p15,0,c12,c11,1 /* Interrupt Controller Deactivate Interrupt Register */
> Shouldn't ICC_DIR be placed after VBAR?

I have moved ICC_DIR after VBAR in my v5 patch.

Actually, this ordering is not very clear to me.

It defines the following ordering "Coprocessor-> CRn-> Opcode 1-> CRm-> 
Opcode 2"

So "p15, 0, c12 ...." should come before "p15,1,c12 ...".

However, if I see in the file for examples where "crm, opc2" is not 
present, the order does not seem to make sense.

For eg

#define TTBCR           p15,0,c2,c0,2   /* Translation Table Base 
Control Register */
#define TTBCR2          p15,0,c2,c0,3   /* Translation Table Base 
Control Register 2 */
#define TTBR0           p15,0,c2        /* Translation Table Base Reg. 0 */
#define TTBR1           p15,1,c2        /* Translation Table Base Reg. 1 */
#define HTTBR           p15,4,c2        /* Hyp. Translation Table Base 
Register */
#define TTBR0_32        p15,0,c2,c0,0   /* 32-bit access to TTBR0 */  
<<<------ does not seem in correct position , it should have been at the top
#define TTBR1_32        p15,0,c2,c0,1   /* 32-bit access to TTBR1 */ 
<<<------- does not seem in correct position , it should have been 
between TTBR0_32 and TTBCR

- Ayan

>
>>   #define ICC_ASGI1R      p15,1,c12       /* Interrupt Controller Alias SGI Group 1 Register */
>>   #define ICC_SGI0R       p15,2,c12       /* Interrupt Controller SGI Group 0 */
>>   #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
>> @@ -281,6 +283,20 @@
>>   #define ICH_AP1R2       __AP1Rx(2)
>>   #define ICH_AP1R3       __AP1Rx(3)
>>   
>> +#define ICC_IAR1        p15,0,c12,c12,0  /* Interrupt Controller Interrupt Acknowledge Register 1 */
>> +#define ICC_EOIR1       p15,0,c12,c12,1  /* Interrupt Controller End Of Interrupt Register 1 */
>> +#define ICC_BPR1        p15,0,c12,c12,3  /* Interrupt Controller Binary Point Register 1 */
>> +#define ICC_CTLR        p15,0,c12,c12,4  /* Interrupt Controller Control Register */
>> +#define ICC_SRE         p15,0,c12,c12,5  /* Interrupt Controller System Register Enable register */
>> +#define ICC_IGRPEN1     p15,0,c12,c12,7  /* Interrupt Controller Interrupt Group 1 Enable register */
>> +#define ICC_HSRE        p15,4,c12,c9,5   /* Interrupt Controller Hyp System Register Enable register */
>> +#define ICH_HCR         p15,4,c12,c11,0  /* Interrupt Controller Hyp Control Register */
>> +#define ICH_VTR         p15,4,c12,c11,1  /* Interrupt Controller VGIC Type Register */
>> +#define ICH_MISR        p15,4,c12,c11,2  /* Interrupt Controller Maintenance Interrupt State Register */
>> +#define ICH_EISR        p15,4,c12,c11,3  /* Interrupt Controller End of Interrupt Status Register */
>> +#define ICH_ELRSR       p15,4,c12,c11,5  /* Interrupt Controller Empty List Register Status Register */
>> +#define ICH_VMCR        p15,4,c12,c11,7  /* Interrupt Controller Virtual Machine Control Register */
>> +
>>   /* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
>>   #define __LR0(x)        ___CP32(p15, 4, c12, c12, x)
>>   #define __LR8(x)        ___CP32(p15, 4, c12, c13, x)
>> @@ -381,6 +397,15 @@
>>   #define HCR_EL2                 HCR
>>   #define HPFAR_EL2               HPFAR
>>   #define HSTR_EL2                HSTR
>> +#define ICC_BPR1_EL1            ICC_BPR1
>> +#define ICC_CTLR_EL1            ICC_CTLR
>> +#define ICC_DIR_EL1             ICC_DIR
>> +#define ICC_EOIR1_EL1           ICC_EOIR1
>> +#define ICC_IGRPEN1_EL1         ICC_IGRPEN1
>> +#define ICC_PMR_EL1             ICC_PMR
>> +#define ICC_SGI1R_EL1           ICC_SGI1R
>> +#define ICC_SRE_EL1             ICC_SRE
>> +#define ICC_SRE_EL2             ICC_HSRE
>>   #define ICH_AP0R0_EL2           ICH_AP0R0
>>   #define ICH_AP0R1_EL2           ICH_AP0R1
>>   #define ICH_AP0R2_EL2           ICH_AP0R2
>> @@ -389,6 +414,10 @@
>>   #define ICH_AP1R1_EL2           ICH_AP1R1
>>   #define ICH_AP1R2_EL2           ICH_AP1R2
>>   #define ICH_AP1R3_EL2           ICH_AP1R3
>> +#define ICH_EISR_EL2            ICH_EISR
>> +#define ICH_ELRSR_EL2           ICH_ELRSR
>> +#define ICH_HCR_EL2             ICH_HCR
>> +#define ICC_IAR1_EL1            ICC_IAR1
>>   #define ICH_LR0_EL2             ICH_LR0
>>   #define ICH_LR1_EL2             ICH_LR1
>>   #define ICH_LR2_EL2             ICH_LR2
>> @@ -421,6 +450,9 @@
>>   #define ICH_LRC13_EL2           ICH_LRC13
>>   #define ICH_LRC14_EL2           ICH_LRC14
>>   #define ICH_LRC15_EL2           ICH_LRC15
>> +#define ICH_MISR_EL2            ICH_MISR
>> +#define ICH_VMCR_EL2            ICH_VMCR
>> +#define ICH_VTR_EL2             ICH_VTR
>>   #define ID_AFR0_EL1             ID_AFR0
>>   #define ID_DFR0_EL1             ID_DFR0
>>   #define ID_DFR1_EL1             ID_DFR1
> ~Michal

