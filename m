Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0808078C8DF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 17:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592374.925090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb0vw-00032q-1D; Tue, 29 Aug 2023 15:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592374.925090; Tue, 29 Aug 2023 15:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb0vv-00030T-Sr; Tue, 29 Aug 2023 15:47:11 +0000
Received: by outflank-mailman (input) for mailman id 592374;
 Tue, 29 Aug 2023 15:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qb0vu-0002d2-Nq
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 15:47:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f88b111-4683-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 17:47:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6913.eurprd04.prod.outlook.com (2603:10a6:208:184::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 29 Aug
 2023 15:47:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 15:47:06 +0000
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
X-Inumbo-ID: 4f88b111-4683-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3MEj+imnICNk5t6jTvhOZTpzYQlFdoJMAy//RSRbTOyXPJNUrmw5PyjYx+iuaR7UhuAj3UO+X7eTRTLQKlnURUwFVZLSVdstwY2pJlkxKSsm7XeP9B19PXyLbOJWZDXi8Q5MS5aX3xQg6ZFtxNuG1hY/bGmdn8s/n8rn+u/NPqcw5f6FMB/yETXmyIM6CZo30+dQGM3oCQ2tFSv471pXQODST9khGCM0mNy9I2xl4wcq+ciXHHGq+IOAJLcvuI1ZDm8/qtDmv9Xz9Bun1+aOWFGhzhnjstk2s4WYKDDzw4qaiSIjjeSz01G8kdqyHYLOzWR1nz0TmeBf9NXLP6RrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFm8YOtUgzVpkRHcCKfoWxBg/w3Q8QcU/v7hyGc4fZ4=;
 b=MCHQBD+R8RsvZu0bVjF02Uq/bUs2B1lXvgJBYhVmc1YGiRasbecHM14BnqKTOqmJ+KdCudtOJYX/kdCPspiCbC1B6ahI81w9ZGVlYiJvMG66xe0EShNCXTPxcJs1CdSLOU60Fk8SjbqZGorXtifmRAFozSRytCeaBwpf6LoRdGlGDGMxfuZAi1LNQJMKKeSEVneRhJpjtwPL/Cw2CLI61VBl4Q5EZlS6Uwa0Eoak5adjiL+OB5Wca+L602XufTeBLlGaesLzUCXxpwldm5Kc+9C+8H73IS3o1kwbimXcrevkwaxzZmKKCXtfgU9kUL0DyDWwW1NTakI06GyDLPMcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFm8YOtUgzVpkRHcCKfoWxBg/w3Q8QcU/v7hyGc4fZ4=;
 b=Y3dI+OWe8Cf0QKslu+/7udgurE0AmnNGypVdEOOQROM8Y7gtnMzanoDmL14VS34yIs+V7IOfs8VCiWvUswGDJZSy5VoWAKJWdULnPlTytK4JrcU/FCU+49CboQ6rTPZEYS1cWNjkSfYZ5vGhJvUwJmdeHTdZewaO0RofW6ovNbUhCTHya2Se7aVgC5VWFgNlkFOAJ0wzQAX3zNicbovwGkSySXv8AknEyat2Z2iQVsCkNC9YZFWmUqH2WRDMsAkAMQ7B6UQzdOE4fEeMX9SyARuQQUwcv1T5SLENQHuk/EPV74OHLpEYmguh8GK74u6RhTq5pBzDa+gtMGKFDk7s8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30dd4c1e-c07e-7313-f2cc-b3476a04f9dd@suse.com>
Date: Tue, 29 Aug 2023 17:47:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] x86: Fix calculation of %dr6/dr7 reserved bits
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jinoh Kang <jinoh.kang.kr@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-4-andrew.cooper3@citrix.com>
 <f5e258e1-5517-2276-6497-4288192cfeaa@suse.com>
 <339df064-0ee7-2b2b-ba73-4528cc2b0b00@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <339df064-0ee7-2b2b-ba73-4528cc2b0b00@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d2d6e2-a473-453b-c22f-08dba8a73218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4XjgR/WqhYHWv5Mi/QlMibdR6tVGSxLEU+DE8lan51uUTI4nzrpNK4zr6DCl/lexG801D3KdfbgKIvtxKcwj8zFX9LaTX6iENvyJoOhacBYK13t+HOLbZruXht+M/5GE8TWRhA/1y++hFwpxWfPCADrYklvK8IRkkk5P2ShyKnhiAoCG+D4zNGjnsV3LPx3gy+TxrT+aC1VFeAGh9HM1TM8Qwnt9duqTdzFS6+GUwpYoIwwY2nqZ3ZB2lVfdhKfzLdGhqG4STj27t7ifZaIx00mB3Ks6vW2ush6SB2ty6BjrXNdZm6qkCBudGKllqP1zm9cysijq8YNc0BMqBTpWyCNcb7N0Yt3H/MQiwiafESO0H2PlyAwjb1l+RH7Oz5C1R/e0JHLPE8/9TkMt1vlL1lGkomY/1SrYTMGlWNFXc634DJTrUwEIqUTQz7SqdPZA3pFNiLg+NVmQ7dJLw1FzyOzdQoHHkkddN/yYsx2GUwkRaVLKxZ3m6CLwELP2liwAkPqChsV/SS5Mh7ZHfQmO4fCr3SKvnVaFPO+c6BBlJgSidlXE4b7suft+k/YWp8Dk9mGM1JTgChLPpiQtxa+zhTqBziejPo0u4EyE/SJs1K8dasQ9B4m1KjPqwaJf7w8Obd2M5AS5ZWyRa9jkpEd9ig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39860400002)(186009)(451199024)(1800799009)(38100700002)(2906002)(5660300002)(6486002)(53546011)(83380400001)(26005)(6506007)(31686004)(31696002)(86362001)(8676002)(4326008)(8936002)(66946007)(2616005)(6512007)(66556008)(6916009)(66476007)(316002)(6666004)(478600001)(36756003)(41300700001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?US9MRUttQlk4U2NnZWVoeXk0UjRMUmlYOFhWMXd1VnRKSFFSNFhKTlp0ZTl0?=
 =?utf-8?B?cFdpTHcwTGlIL3VhU3hvUjhGcGo5REtXWkw3a0lXZDhPb1RvNGhod1RzZE9X?=
 =?utf-8?B?VytkMU5zZ3FyWFJBUUZEU2lYK1hvZjZOWllsUmRleEVXNmlLd0dKU3ZuZGYy?=
 =?utf-8?B?ZTFydWpuV0hTRjI4YlFNYXpZbUdxQ2hDNi9sL3dScUpzTy9ZeEpxN2VmK1NV?=
 =?utf-8?B?TGlSY2QvMWNLU2pFdm9xeHZnTnp2bWdHOEdZRXpuYUtCNTZvbllRbXZzK1dF?=
 =?utf-8?B?ZnZjZGN6cGJ1ck9CN2V3dDRCUFZwSWJLZWhYSHJHS3IvYXk1NjBGK1BsUXdq?=
 =?utf-8?B?OVRHbFZ4NENMT1NUYVVXcnd0NjQ3bDkydlpzNnRrbnptNnZwd2d6aTd6bUxU?=
 =?utf-8?B?RVRHa0ZPMit3R3NkS09hUjFlWUIycG54d29zVkdtNE4vb3B1L3pUeVFFUWd5?=
 =?utf-8?B?anI0WVFMcm5NRUcvZGpWOU13cnFUQW9HTE15NENNQzNEOVgyNkp3RU5yRGJy?=
 =?utf-8?B?VFdoYWtudXR6bFhmcThndkJ2ZUd0M1hqWWk5cVovN0twSEJXaE1lK2dnVlg1?=
 =?utf-8?B?T1oveDVLb0FlMFRGMGpnanNsZEw5Q3BObVFjT0RwMUFJMFhFS3BMT3YyZXBJ?=
 =?utf-8?B?dFB3aGZ2ZXlrdGdoTVRGY2NWRDJ6NXJ4UEpONzJNaGRRM05kRTRxQVNxdnh5?=
 =?utf-8?B?UHI2L0I5ZThnOFdMVG1ydW9Wd3FleXJaVnk2aUdTYitVMFhjUTkzUEhrRXp4?=
 =?utf-8?B?NS9KbGdVUDRZL1RWTThJZURTeVhGU1NoelpyWDZ3MHFPdHZ2RDhIUzVkUE1v?=
 =?utf-8?B?UjN1cVlsN3JVMkRJNWdwWlRWcnU2YnFPdjlaZ1JtZmFnS2F3M0c3VmVZNzZJ?=
 =?utf-8?B?U2ZIMVpkSHpyRHNOKzZLN0xtcDMvdmZ6eVdCdEZnQW9XNUpMOVJpYWRWSUdi?=
 =?utf-8?B?V09VY2M1dHZYZllQNVU5ZjVCaTN0VzNvMCs4YkFyQnVrLzhUb3pHVG05Zi9V?=
 =?utf-8?B?OTNneUxIV05ncFhreCs0b2xEcXZobWVYb0Z4WXZkVUtCclZSSi9vSVNpbWJB?=
 =?utf-8?B?cEY4WEl3MlhoL0I0OElOamV0clRhb0Zya3NaR3pRTWNuREVLSStSdnhycnIv?=
 =?utf-8?B?VVllR0orTTNEckRBYUlnZ0FwTmg1d081eWRzNWNpSjRoTnhmOFZ2MjNlUi9m?=
 =?utf-8?B?TEZsZFpaWE8vSTNZQ3BlVnVIdytNWFFUNVhMcDlMZ2NmMEQ4Z2tObUhkWlN0?=
 =?utf-8?B?bC9JdUxBYU5WdU03eVdGWjlhYmlJYmIrM2RleHdoNkJLalh0MitDUDNmTmVX?=
 =?utf-8?B?VXl0Zmc1ZzIyVVEyZjVDZHV2L0kyWkZSaFFHL0tGNXQ3THVMSW4zK3JEVzc1?=
 =?utf-8?B?Uzk3UGtlZWF2VTFkN0NaMnBwak05a3RzOTdvNFhVS1cvMWdMeVZ5SWpPd0Ez?=
 =?utf-8?B?U2xXKzIrR0RKczEvWlpHMkpQR0ZDczlyMDNOSlpBUUhTQTJydDFTNCtKbDhY?=
 =?utf-8?B?WFpLUlBnOWxFUDNnejFUWFhPYktvY0oyU01ESFpNdVAxSlhiR1hzQVpHbUxK?=
 =?utf-8?B?aDdWa2orSWJvbWdDSS94dU8zNUZLMU8vUHYzdWZuWGh4dVVvcXZUcnhhSVRa?=
 =?utf-8?B?ZTVvS1htRlBOc295dTBuMWxoVU1BT0lEaFZwNzdhVCtieUVWQytBSXNmaGNZ?=
 =?utf-8?B?UXViVCtSTHB4c3MrTlBTQTVrWGJXWFk4T2dpcnlrYnpZbERVZDFZSjYzd0pz?=
 =?utf-8?B?Z3gzTkMzWk1vbWZFNkE4SjRrUXgxUkNBekJHVzZwdVc2ejJSa3pzQVQ3SkR6?=
 =?utf-8?B?UXUxZ2t5WkNvaC9SWTJRcmhTcGZxUVdUT1lscERjZVU1SHREWVRmcGN2Z0hm?=
 =?utf-8?B?ZmtkejBsbElrb3UyUXZOb1pFQlNNTkJ5dmVGSUlTTm85QXAyVWhLVlBrWlNB?=
 =?utf-8?B?QmhFWTBLbDVkTVJKOTNlTTFtRzNNd3F4MGk5bEhGbXJNS1VGTkQ0RjlzSTZu?=
 =?utf-8?B?SjdnQmhjSWwwM2VqR0Q5WmpkS0ZjVDk4d0Y2VjgvTUJCNVh1UmRDNW9aTTRz?=
 =?utf-8?B?cnpWcExrZW9FdDNRTTR0c2x6bERLa0tHMGxZZmZrNUh0c0VhOFJiMG1aNS9t?=
 =?utf-8?Q?XQ7+vRfJO6V7i6RpFOq6Csf1y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d2d6e2-a473-453b-c22f-08dba8a73218
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 15:47:06.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiFsdKNFSchSndpZqZ/12FZuEtYBeAUXjvE3M4NP0HN5vYG7RNrL2RgiFU4QGzVizVZ9AgN2hMjOdI0ohG2f2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6913

On 29.08.2023 16:29, Andrew Cooper wrote:
> On 29/08/2023 3:21 pm, Jan Beulich wrote:
>> On 29.08.2023 15:43, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/x86-defns.h
>>> +++ b/xen/arch/x86/include/asm/x86-defns.h
>>> @@ -102,13 +102,30 @@
>>>  
>>>  /*
>>>   * Debug status flags in DR6.
>>> + *
>>> + * For backwards compatibility, status flags which overlap with
>>> + * X86_DR6_DEFAULT have inverted polarity.
>>>   */
>>> -#define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
>>> +#define X86_DR6_B0              (_AC(1, UL) <<  0)   /* Breakpoint 0                */
>>> +#define X86_DR6_B1              (_AC(1, UL) <<  1)   /* Breakpoint 1                */
>>> +#define X86_DR6_B2              (_AC(1, UL) <<  2)   /* Breakpoint 2                */
>>> +#define X86_DR6_B3              (_AC(1, UL) <<  3)   /* Breakpoint 3                */
>>> +#define X86_DR6_BLD             (_AC(1, UL) << 11)   /* BusLock detect (INV)        */
>>> +#define X86_DR6_BD              (_AC(1, UL) << 13)   /* %dr access                  */
>>> +#define X86_DR6_BS              (_AC(1, UL) << 14)   /* Single step                 */
>>> +#define X86_DR6_BT              (_AC(1, UL) << 15)   /* Task switch                 */
>>> +#define X86_DR6_RTM             (_AC(1, UL) << 16)   /* #DB/#BP in RTM region (INV) */
>>> +
>>> +#define X86_DR6_ZEROS           _AC(0x00010000, UL)  /* %dr6 bits forced to 0       */
>> 0x00001000?
> 
> Bah yes - serves me right for a last minute refactor.

With the adjustment
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

