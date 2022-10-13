Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9EB5FDCE5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 17:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422268.668182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizuR-0000Wb-6L; Thu, 13 Oct 2022 15:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422268.668182; Thu, 13 Oct 2022 15:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizuR-0000UM-2u; Thu, 13 Oct 2022 15:14:07 +0000
Received: by outflank-mailman (input) for mailman id 422268;
 Thu, 13 Oct 2022 15:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzGh=2O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oizuP-0000Tn-Fz
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 15:14:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abc4be57-4b09-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 17:14:03 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW4PR12MB6950.namprd12.prod.outlook.com (2603:10b6:303:207::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 15:14:00 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836%6]) with mapi id 15.20.5709.019; Thu, 13 Oct 2022
 15:14:00 +0000
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
X-Inumbo-ID: abc4be57-4b09-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrmCHU981nb/tB5zDyuLxTIKTLU+WQ6zE1Lpcmj1OQJvE7OoW37AK/1dhGTSb4701nFuW1jjqAR7ftJP9NhnKSTcyWEtnRUkFiObcyJKauIHIIWdzJ0XG3zMgUELuSnn+vf5DnhKscMcvQW40By3KDn9eBMSl8VCxM3jDcYY60bGqpi1NbEvANs/cFBZ2segdkCqHYDv2qjxh5427dh011xfpqWf2E9CeN/dMMCzhZeXct8jKWN9PLYXD5zR0wKPasHg/A2x9I14uZEFNz6uAuAYWtW4ovXl4cjpwYL8GnxG9sSgeh0KpRNhB/AJ9g0KD65KyDnEE3x6cuK5erdNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjUPQmvnvCJTrhGMnTfyBxzK++N4OPIj3vEFLRWZiY0=;
 b=a3pglpA/Qz4dlZW2YXfAwG2gmb6T8D/OQNkWeLBA7EWU2ufhNQpSepZdRcqMv9sK5pU24DECdLjYNkLzPpaTAt8DVKjRbEHAJJPBDuSBl5hhynOpeqLLvXrOlOb9PQ5ao0KyIOKLrRjcK7c+b4fNalcLn/v4vNZIpqdnXdrG7w7wf4Hof7lNsThDko6+wa7jeVfFppRZK9nBxucmK52pPNYol87IlxmbfqvKg7eb486qIKu6k4a5nVS4Uzc1RMycDqcz330lYQRjjOt/zEyEfBiDJUqqv/Gt5KtKl8gdQwQQeZK38OjGK61wdoJ8YJa0dCv4VCWDHSOaaunTUdhXnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjUPQmvnvCJTrhGMnTfyBxzK++N4OPIj3vEFLRWZiY0=;
 b=DC5A6b6eQawKEaFuv0hKeg0L+/aSzYObmCfchZP5SynaKfThj00K9TvvkOJxMwjLqla6z9mSaMS5ZattsdhWHJaJm20LgzB5EHbQsb4zWe23wrhL8ECk88UBjGMm8hptbCpIUZ0NhZkZ89+xuEg2QsvuzDQw+TsfwCMZZ/7rCrM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <28a406b7-0b9d-3c4b-4db4-67af6729e35f@amd.com>
Date: Thu, 13 Oct 2022 16:13:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
To: Julien Grall <julien@xen.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Jaxson Han <jaxson.han@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
 <9b4a9bbf-eb5c-3d13-f796-c6bf5704d85b@xen.org>
 <e94b7c65-1c38-024f-6a91-16098045574a@amd.com>
 <96f989d9-4d55-acc9-a0f7-cbb1212480ad@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <96f989d9-4d55-acc9-a0f7-cbb1212480ad@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::9) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW4PR12MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd915f0-b574-4de7-eb97-08daad2d8e87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QiTzQk9pzGSq1efIKy8D8Fx+BA3+OB9QEs4EqZssONzymrfAFEcrG40dCRzpoNxN1yyVcBo3cYzIBSLPOc1K69b1WnL+yZBPH7h/q2NJHR/9jDo9wD2xDIVDVhM6rNkQKawnP3uxZSXPS178dn7Wz6qjsE7ep/1fHyWzSPkFybNORAHDmawvQCL/3l4J+T+J5/R6//8ClMjKb9zvpA92jAn5qmYQZgnEy996sDS8q9MEn9lxbxtNLF3Loh6SKttiM78/pvtMWan65GytUVJCwPTBtHeUBr07vyuXUjKtqUZ6g7Js/mVi2TWbOR+RVqvl0Q806SSA7wIoHXoWt2qp4rgzzPVmNijiIhoRYq7gMLSaRnpr/N7Cony67ohaLxqO80E5nZWcZlzeOyUG8C/LUHkuw27BqEVgjsuYTz7S8mgtjNtu6I38kVSJ1MoW1wA8kuTnPWbD5tMOlQURW1TCQBDePa64UyoeLdo5M9/ko9JxECSch6hT7hHK/vFFTS1qkSbtWsXFgosAaLi61SeMUzFXHYnl9WqNSZDpXbOrZJNo3wKUJl6q3a//d6A1gk3CG+Eazm75LBxMpoK7bEVpYZMHvMdrLdKTRy4KCsl1BmQGBNydYO0zxXxco+Fcp0M54Ehy8HELEsbi8/45g3LnaSfwTF/hCu6ODQvsoHXQfRfNPm1kPju305UGrzNaZ3VKvRfVsz3l/xyhW3bItwihLUWX0+6Qjszd7nhXNVr8LeziCCUcOB21XWGXrUfgtXdJTsLQNwKOy2CBhEYPWTeGnmlXoXvWcWkThCmxC8H6cozQtVY1O+6bJ7GJXAQpv60qakr67KjX0YVq/13SKbHpvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(6486002)(83380400001)(36756003)(38100700002)(186003)(31696002)(316002)(8676002)(4326008)(66556008)(66476007)(66946007)(2906002)(6506007)(2616005)(41300700001)(8936002)(5660300002)(6666004)(26005)(966005)(54906003)(6512007)(53546011)(31686004)(478600001)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmhwTER6a3hHNnpzOG5TUkg0Smg1Tk1odzdUdmN0ZkpmWWFITnJvdFRTeHYy?=
 =?utf-8?B?MFpCQW5rQ29ZTVhyQy9IVVJpc3lEbVFtUHFQVG95enlmTVI4MzFtYmRUUjEx?=
 =?utf-8?B?WmQvRE5CekxOc1M0ckN1ejdRTHhlWCtubllDa3FHdjVSdTd5TGRLUVBRTnBQ?=
 =?utf-8?B?V2RUanZIemYvU25TZDU2blNyK0dkV01wa0JTYVMzMmlXZDA5b2VYYmFkU0la?=
 =?utf-8?B?bTNiUmdBVmp3emtsbjR4Zy9adEw5UFc4WFB5WGo3cWxHT0QycE9LYi9zYTJr?=
 =?utf-8?B?MGZTVndybS9NSFl4Tk9UQWR0am9Bc1hrcGRJVjZYMkFSZHEzaGFvL1A2NERK?=
 =?utf-8?B?bVBXenY5YmdYdEFpajNQZTdXc3BVS1hIZUdGeFR0elpBMURZQmRpRy9Wcnh4?=
 =?utf-8?B?YmNYU0NWODk4LzNYNzJYNjB6MG5jKzdnZWgvdnpsMy9IZDFMVWYvRFVYQi9R?=
 =?utf-8?B?aHpLTStsNUtoV0lSd282Z2xwQWhKUjR2bTFJenpBK3VzYmMxaCtobXpRZ1JF?=
 =?utf-8?B?L3dOd3lETDhNRFN3WUZrdlBKZ2tDREFTMUowZ2tDOXZ5QWgweTdCT3J2eTVG?=
 =?utf-8?B?UncwODlBcjlvSlIrbnVSL1Y4UnJKSDJSRm52Y0wwODMzT005dTBUa3h3eVJo?=
 =?utf-8?B?a3Z0MHdqYjdCMGc1cVpQdk9ZcEk0VHdNK1R5cVpCU0xtdUlTYk93VW9iUS9K?=
 =?utf-8?B?Q0NteVYyWkRacy9iZUVQYTlQeDQybjgydjhPcFF6cmtnbm55dDM3U1NNVHpK?=
 =?utf-8?B?UEt4ZVBrMXRZRXBlbXI3dys0dmtCM2hPK0JGRDZpUzNiR0I2V2FCWEYrcmUy?=
 =?utf-8?B?eUlKZ056eEIyeXNRWHNZWnVlNzFrWk1haVZPVU8wWXNBdGt6VnFsZnd6Z3dr?=
 =?utf-8?B?SHlmNHhacFloT1p1T0ZYbGlOb3FQdXZ1UStnRHFLVk5DMDFQL3lUNEpoVWp2?=
 =?utf-8?B?NGNIRDRIdklOTWlqZnlPdUhQSElpbUdUd1Fwd09tazZWRllTbTVaSTI5ZnNq?=
 =?utf-8?B?d1VIaGFBT0cwcmppanFpYWdJNVRvb01UdEh2YkRyL012ZGVyWUUrUjNaYVVk?=
 =?utf-8?B?UUYzeTRXSk1hNEV3SmVWYzVwTGliQlZBdFd0TWQvVzNWNDFMQlNtZGlDZjBv?=
 =?utf-8?B?TkJKWitGVXN4ejBwelZ0dVNLQS9UdTExVUMrdk9vVXVicFV4VE1FRk53ZTVk?=
 =?utf-8?B?RnRpSHgzbUw0ZDgxWStaaUhObngxK1laVnlsUzEzUnh3WkdGSko4TEsxRDMv?=
 =?utf-8?B?bmlvS2tNZ1NxQit6dHdFQ3lqUU5rRHFkNW5wbHNVdkRSOSs0UzFaeHZUR1Bo?=
 =?utf-8?B?QmxrNGkzMTBEWGp4b1dEU0VuR0Nqc3VEdnBsM3dRM1NhMU40dmxiY0VyY3Rh?=
 =?utf-8?B?UnExYmVoVCtOU01ZaDRXN0RqZUpDa0xpeFozYytZbFh3czZ4WjNEVUFKN3Va?=
 =?utf-8?B?RFo3cmMzaEJMZEpvZVkwaGM4QzczQllESko4VVpVNVFPZDVCSE5TUkoyRGNh?=
 =?utf-8?B?TjMwNldBWlJ5QzJqdm5YMUE5dXFkT1g1YUdFSnR0SkMyNm94ckNPRlFGdElT?=
 =?utf-8?B?U2h5d21SNDlzNk5lajNJUThCNmN0OElHTDhRRm1HcS9FWlprZTdBQUF1bldq?=
 =?utf-8?B?MXhLL1dXVUVwMEpIbWZWODQyVG1VWWlSZ2JLUGlsTXV1ZFlnanpZTG1yYjd4?=
 =?utf-8?B?L2p6UWhrYUJGa2s5RFFocllxTkRvdFEzZExEc20zaXB6Sy9jRGs5cUF3Mko0?=
 =?utf-8?B?SDBTK09pZTJUeTB3TGYrWlBpenEzSnFEeEpDeXpkMDI1K3RGNHhxYXZRMFM4?=
 =?utf-8?B?UG4vSjRHRWNnbnpxT1dZVU9zRWRBcVJHS1BzTnJwdjRWRFZJRExOcWV2TWFU?=
 =?utf-8?B?MzRiSlhBZmFMZEVMaFR2T2FCMWFOWEhxdy9tKytzQlI5S2VmRGFPUk0xVGJL?=
 =?utf-8?B?ek1FbExjSHErZUhQeGdNcFNqWFBKMWJtTlQwVmRpRjJjTk9qVnEwS1BURkFK?=
 =?utf-8?B?NSt4SU9PNy9VaHRoZ2JoZTNLUWM3RXkxMXVvbi94VENQVkxzdGxoMVhBTlpi?=
 =?utf-8?B?SUJzVlZOdnQ4VE02eGEvRC9WeUZpZEFMOGQySDlsUlMyaGhjRXZqSWx0M1JT?=
 =?utf-8?Q?oqZcl56jdvPIrLcpxrDr2bC6x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd915f0-b574-4de7-eb97-08daad2d8e87
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 15:14:00.4939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEMQrBTXkgDtKvulLwOug0Vdl5leQ0y+hVwCbZrxRkZYrdjmx5DMVR0QEZP8984zqV87nLZxcfZ2WY38mKPJcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6950


On 13/10/2022 15:47, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 13/10/2022 15:30, Ayan Kumar Halder wrote:
>>
>> On 13/10/2022 14:20, Julien Grall wrote:
>>> On 13/10/2022 12:47, Ayan Kumar Halder wrote:
>>>> Hi Arm mantainers/Folks,
>>>
>>> Hello,
>>
>> Hi Julien,
>>
>> Appreciate your help as always. :)
>>
>>>
>>>> Please refer to the discussion 
>>>> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
>>>>
>>>> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed 
>>>> virtual platform.
>>>>
>>>> Zephyr is trying to read GICR_TYPER which is a 64 bit register 
>>>> using ldrd instruction.
>>>>
>>>> As GICR is emulated by Xen, so this instruction gets trapped with 
>>>> HSR = 0x9200000c.
>>>>
>>>> As ISV is 0, so Xen cannot emulate this instruction.
>>>>
>>>> The proposed solution is to use two sys_read32() on GICR_TYPER to 
>>>> return the lower and upper 32 bits.
>>>>
>>>> With this, HSR = 0x9383 000c, ISV=1 so ISS is valid.
>>>>
>>>> Now, for Xen to emulate this read, I have proposed the 
>>>> modifications (in my last comment).
>>>
>>> I am confused. Looking at the emulation of GICR_TYPER in Xen 
>>> (arch/arm/vgic-v3.c), the code should already be able to handle 
>>> 32-bit access.
>>
>> When I compile Xen for arm32, vreg_reg64_extract() definitions do not 
>> exist.
>
> Ah. You are building Xen for arm32... This is unsupported by Xen at 
> the moment.
Yes.
>
>>
>> The reason being 
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/include/asm/vreg.h;h=f26a70d024e2d1f933ea66793ea6e42f81c7a8cf;hb=9029bc265cdf2bd63376dde9fdd91db4ce9c0586#l189 
>> , BITS_PER_LONG is 32 (Refer xen/arch/arm/include/asm/config.h).
>
> Right, so that's not an architecture issue (like 'ldrd') but just Xen 
> not providing the helper.

Sorry, I was not very clear.

With ldrd, HSR=0x9200000c. As ISV=0, Xen cannot emulate the instruction.

So even if Xen had implemented vreg_reg64_extract() for arm32 GICv3, it 
would not have helped here. Unless, we decide to decode the instruction 
which may not be correct thing to do (as you explained in the comment on 
https://github.com/zephyrproject-rtos/zephyr/pull/51163).

>
> As I wrote above, Xen doesn't yet support GICv3 on arm32. 
> I expect that implementing vreg_reg64_extract() will be one of the step.
I don't think it is required in this particular scenario. I have 
explained below.
>
>>
>> .Thus, the guest need to invoke sys_read32() twice (GICR_TYPER and 
>> GICR_TYPER+4).
>
> I don't understand how you came to this conclusion with what you wrote. 

Sorry for confusion. I was trying to explain that the code does not 
handle 32 bit access of GICR_TYPER on arm32.


> If we had implemented vreg_reg64_extract(), then Zephyr would still 
> need to issue two 32-bit read because Xen doesn't emulate 'ldrd'.

Yes. So what we need here is not the implementation of 
vreg_reg64_extract() for GICR_TYPER.

Zephyr will issue two 32 bit read access for GICR_TYPER and (GICR_TYPER 
+ 4). So Xen needs to emulate 32 bit read for GICR_TYPER and GICR_TYPER + 4.

So, we will need to modify the Xen code as follows :-

|#ifdef AARCH32 case VREG32(GICR_TYPER_L32) : { read and return lower 32 
bits of GICR_TYPER return 1; } case VREG32(GICR_TYPER_H32) : { read and 
return the upper 32 bits of GICR_TYPER return 1; } #else /* For AARCH64 
*/ case VREG64(GICR_TYPER): { do as existing; } #endif Let me know if 
this looks sane. I can then submit a single patch to add support for this. |

>
> Cheers,
>

