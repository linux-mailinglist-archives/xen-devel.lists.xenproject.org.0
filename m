Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BCB71FD29
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:10:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543014.847555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50n4-00017q-Ny; Fri, 02 Jun 2023 09:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543014.847555; Fri, 02 Jun 2023 09:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50n4-00016B-Ki; Fri, 02 Jun 2023 09:09:46 +0000
Received: by outflank-mailman (input) for mailman id 543014;
 Fri, 02 Jun 2023 09:09:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q50n3-000163-W1
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:09:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36cbcebf-0125-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 11:09:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 09:09:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 09:09:40 +0000
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
X-Inumbo-ID: 36cbcebf-0125-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NV4fd0xJkprRTIAXTMxxkfpyQafB0RAFo5ZzV+YGHMcVC6suH55hrhwkb0kLB0kizrJpkFkDTPlAPl8Kncqig3aDBa28DlIHoJ2fWVlOxP2LpVETO+QcS0OVIEVUOUILAU7Vz+SYGBy6b/S/VeUnxDgCiLKiLoo0i4JoSHO5i+kV8s/s8H8oVFt4on0iIwBbVBAcyTgC7croT8OumbZp4uHfdSmE1wTlEutfOU/ML2Ex2Bn9yYMlbXW1m6Ky9P2+13mMhv7C5Gfrm0KRAHWDDnI8LJzdfKPmDmp45QJdfAL22N1pIiTARUggXxhgImn77bO+jsNPPQ+FxsKP+S0Rjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qN9yENbE+BYxlLVy78NjiG3zoUq6RGsuqPWFbHNk+k0=;
 b=LekT8HUEnRqla96BpeMw2CGSdR9uca6weeMGRqVkVJNV8zLl2mQRdNK1lzNvKDtDfolUeKlyR+PdQwJeicSvDhN2wrSTCMexpsW7nzDuqG/eRG43VmmTqvGNhi6yDYyUivc6iEYSuKdJfGGzhfvHc/8U0a0ge0BBA8QDSlSryC1jGND+qPniU4JGjr6TquIQ57TJifWhBtvwgMKvmRwRaQX5A9Iy72CvqXxzXKnQAunrSKzTpbDbz32HSGt/vJUQezLaR8Rfij8i/V5US4HlaUeDYC9eQu/PYlCiFJtvJ9oYiNgne6u3D5lCfjGdf8xImbTP5Opoo8c3DyPw9Ug2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN9yENbE+BYxlLVy78NjiG3zoUq6RGsuqPWFbHNk+k0=;
 b=aPhsIK97/V1BeLjxx+fb6scLaGxJnV/EowqDJvg3J5pc47v1DQ09fJUzPX2JEsnD6WSF5Y5dETROWqlkpiNcD8X3RWE62AhTpRtSOwerY0ZZiOnoc42O4ztzfx9qI6H4bm7Vtw9FErOOweWm6dj4IxOdsO6Mg/y7tnPnYN2SAT8avdk+HTiGzKJFiNZ4ZpffwdmdCOQLgmSVq8HwjhzmZnPH4rJdr4QnZL9AOekQ+SaVi/qpJfxiPSLjN8MrxViqJUN7mOTurvGNXYRnq/NIhXVywpfVWjEuq0un18YJVkRK+9WWSD/8HiCuZFBfOLyJzukkRF6eGc/n7+uYudeDmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <384f1950-08f5-b1ea-2382-5f4b87b2ff79@suse.com>
Date: Fri, 2 Jun 2023 11:09:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 06/19] libfdt: Keep fdt functions after init for
 CONFIG_OVERLAY_DTB.
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-7-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230602004824.20731-7-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: 681eb990-ac5b-4183-0138-08db6349190b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lejCIhnWvG0arWhKrFccZfCbiNeW04yzSzy9g2kP9qfLPKltVJBLm9X59hD0gXykKyw6lY/2xQ2CM0IjhT4kiFZOxh48U+Kf2R6hgeILIAECr8v1ATbX9S7/cnJ64p7ufGL2Ocx3GFjES0ragr/KZy3ZHTHRY+T+J11kEncAByK/RBJECF2Yf0G0WbyqaF9Sw0IDUda//Ipfi1M1/0xN2tDJKHByBPUTx0CD+LT7PrqL9FxQc1qRmIMnoJwHjclZbye2V26xOnmU0bgEtpYV15HRhKyWYSF7tHGPbdw0pZnqavRf0YRbW+Zl5G+bzS0Tt7DyQpckriyx+NPU34aUOgZvbVIOmLs/zoYO1TWXOWMHaZoKHAuWWWAj9Iwkid5ElfQ3vPfCPI1wvCWq0KeS13y54LY0CFw/FVLVHRecMAeH668QpFAolCN8Vam6GgdmxJaCvlAgxveAYVV8NfEqiFZkeF5i8FNwoPrI3Eh6L08Ympzl8wvJhLG2AIt0ag1S9lA40uHQkI+rQHB4d5UK0HVe9MojOKD7rx301m8iwxL3raMrbOs0XII2oedEh+bRzrWc/f+8lAN15LqfP9mnx2ldR6+GF0YEdQIlRgytwZx8RtKg0JLM2FBpXuwaNOMaOpJzTit3tGcnz4JcvbR30g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(4744005)(2616005)(186003)(2906002)(4326008)(6916009)(316002)(66946007)(6486002)(478600001)(8936002)(66476007)(5660300002)(53546011)(26005)(6506007)(6512007)(8676002)(66556008)(41300700001)(38100700002)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDNENnZ0cTdZTEozYzczMm9rSDhPTC9kRHREMlVsejlSRTZnUzhNUjhoajlT?=
 =?utf-8?B?TzFKWWcyM0hPRmVhNEtFejRFM1VmVWhtTnh1RzVqa0tENUUzdFBQN2RxYzJa?=
 =?utf-8?B?c0wxeDRydm9TUlBRSG9sQ0hQb0VKUURtTjFBWEF5OGpjR2g4anVEYXNnYWt2?=
 =?utf-8?B?anJVbzVTZDVNdmtYZ1pDSldLQk82TUJvQ0NkMkV5ZlFHd1MxRVM0aWxYYkI2?=
 =?utf-8?B?WjZaVXYvV2dLd0dQV3ZRTzRVejdVcFR6OXhQQ0E4Q2RyN0xmaE1PSlR5SDRw?=
 =?utf-8?B?aDVSelpDeFJIQm4vSU8yK1F0SnV3dVBjeEtPZUpmb0t2T041UUlmQUlsTjVj?=
 =?utf-8?B?bjBNMXRlUkxGMW9oVEMycllpcEVuRWFJblNhQ2h1S2Z1Qk5jaE53aHZBaWpI?=
 =?utf-8?B?bEdJdW9rSUtmRlppZ3pkOVhFQTBXMS84SkxBeC9Ia2o5QWxYL1J0d2c3ak5H?=
 =?utf-8?B?UHB4M2F1K2ZJUlkvQTRhNGdsa3lDWCtMUGJXN3pIVzFxSkdBWVF6QXNiMWIz?=
 =?utf-8?B?VUJlMmRKcDMzTjBNUllvR0xwVnQ3UTFDUW1BT1RXamo2NmZiZWZaRFQrUXNM?=
 =?utf-8?B?SnZ0QXhMMWdGSHd6c3pmU09MY1NzMGF1MWFIUmhiVTB5Tkxta1hoT0Y2djd4?=
 =?utf-8?B?cUkyaTkvb2V3Tzg1Z1l2WUVBYWVDUEc1cjdhanV6em1kajRlbittOUh0ZjRk?=
 =?utf-8?B?SW9MTXpQU3BmempyQmlxK1QxV0k1bTBFVXNqV0NjbmxTNnNvdVBGQm5ZUFdS?=
 =?utf-8?B?a2FMMHRHVDh0ZGdBSStiaUZGdS9zNlVtTzN6RElhZVBHZ1RPYUFacEVRaFNi?=
 =?utf-8?B?ZFVpUXRUQWtybG84ZTdreEVBNEowbnVocnRLbVpUNjk5T2ZCNEc2RnhlNDB4?=
 =?utf-8?B?RUFtWlh6MGdtdm9EWTY0QkZNOUdXbFFyWnl4SGhqcUdGcmJNQ1BnbWJHcnc2?=
 =?utf-8?B?SEZ1aEc0WGdZbWh5SU0wNlh0c2ViN0lNOFNidUZPNGg1MXdseXEyYzVmSjdE?=
 =?utf-8?B?WC90R1B3NGlpZjkxLzBMOTZyaEtIZEpab2t3dDBpa1JzZkxxcll3VTREdGR2?=
 =?utf-8?B?QTk1a3BuL0lpcUlmMjJnTmJZVk43Z1RHalpnQVoxOWdwdlk4M2VvcmxCOVA3?=
 =?utf-8?B?bmhyT096VFdHVi9CVWpIeWNDakVzSThmUTZUUnk1ZFMwaDlKVkhsSUxwZU5i?=
 =?utf-8?B?bFdFTGlvSGltQk96MDdaWllGMWluODJGSm9YT0FBOEN1MmduTVZDRUx4QU1n?=
 =?utf-8?B?ODVUZVRWNUl6NzBybzNPcERQMnYxaVczT1dJZGhoV0l0YTFBazZpRSt5Rjlx?=
 =?utf-8?B?ZWdlbFYzdGJ0Q3NKMk9iSXdlQTRpNmJhZnJYOE5mR1pCNEtYelRVR09lY29x?=
 =?utf-8?B?T3N3dFFTTHpIQ1BKZ2dHSG8yOUE4eGFRK2RyelQvOWNCRUY5WVg2TllxNC9u?=
 =?utf-8?B?T1FDcGIyVzdOQzhjbG1ZR3VDajYzaVV4ajcrYjdKOVFxNmwvN2o2aDRXRDFq?=
 =?utf-8?B?MVptcVQxZDFURlBYWkxoRWZObHgxR0xDNm5jMkdCUkIvOEFBWVB1NEx1VGcr?=
 =?utf-8?B?SG1qSlFMQnJEblRSRHkza0Z2c0V3N3dPamsyTGcya1J2bmpYbGZZS2E1dFZl?=
 =?utf-8?B?Nm9HS2ZhYnhnZW5LZXpwTTdUeE14SG0yVVJtUWFhUnZmcnpLM25nd0VDYTRJ?=
 =?utf-8?B?aWk4Q2UvakI0UHJDQ1Rqayt3Mkptd0xLMTZpZ2R0WVB2TUlUSDREU3o1THZt?=
 =?utf-8?B?OEV3TU4wU2xLb2VOWjg2d21ZaUJ0OTAwZHZnVHNqS0o1R0x1RFluLzE5eHh2?=
 =?utf-8?B?MG1ON3EvTUxObkxSVU1KaW1kb0kwS2hXcFpjU1JtbmwzdnpXZ3ptcFIvbmxp?=
 =?utf-8?B?MXlnUFhnTnR0dHBMcGcvMTlxWG5lenBSaFNvNXR1eWtvYVk5eHM5SlBBdyt3?=
 =?utf-8?B?a2ZLMHorQUdjWEpNVnIrN09mZnpsVEs5MlJ3dFJtWkJ3cDlqTEV4YTVhYS9v?=
 =?utf-8?B?MVdlcU54Z2x3Q2IxYmJnTXZ6KytSMHlNSWEzczdNTS9sUEE5Ty9UQndFdmQ3?=
 =?utf-8?B?RVNRN2NxMkk2djVjbzQvNWxEbWxWNWdJdmcwM1BiRExNQ3hGUjZidWMrbW8v?=
 =?utf-8?Q?QSaNmLX1ha3gaQ7Z7neYLTxOZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681eb990-ac5b-4183-0138-08db6349190b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:09:40.9116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++NhHmNnAbw9xy2tf5aX78+sx68V/2WSgvdIZcnntJm4DE7VDovPHyoZil1hOd4WGU707BYg3n14buwajFLl7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293

On 02.06.2023 02:48, Vikram Garhwal wrote:
> --- a/xen/common/libfdt/Makefile
> +++ b/xen/common/libfdt/Makefile
> @@ -1,7 +1,11 @@
>  include $(src)/Makefile.libfdt
>  
>  SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
> +
> +# For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
> +ifneq ($(CONFIG_OVERLAY_DTB),y)
>  OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
> +endif

I have to admit that I find this odd: While it may be the least intrusive
change, why do the objcopy step at all in this case?

Jan


