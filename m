Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B43660F0CE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 08:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430896.683161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onwog-00024s-5z; Thu, 27 Oct 2022 06:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430896.683161; Thu, 27 Oct 2022 06:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onwog-00022I-3E; Thu, 27 Oct 2022 06:56:38 +0000
Received: by outflank-mailman (input) for mailman id 430896;
 Thu, 27 Oct 2022 06:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a7vm=24=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onwoe-00022C-Sk
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 06:56:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f368857-55c4-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 08:56:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 06:56:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Thu, 27 Oct 2022
 06:56:33 +0000
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
X-Inumbo-ID: 7f368857-55c4-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQGVI7nFT9T3JjaAGbHGzWx+W6ybkBnVPBkB8k38VFkF2qRqMbvCpvM4RivwxfWaxfxLnu0v+9woQvAGDcrCtIXUISFS4Y2Goeey+zUo6/VNjaPHwjIrPFyU/bvU1reUPmBCtmrzDQzZtj4x3c8y9fgmIZPVfYDLRfVfHQ5xIqg2VjC8RnEV00OOcxP3pS12oW1hofOFDAj2hvB6IlZv9aXa22NrMtM4KIYlr3Xq4LxNszB1Dxe3DaPsqoJN6I6qsr6pGqNs7P/8bHnm2ik4mbjmkzI0Ubwq9udyUV7tGDZfgZ1e9FM1OZbMsKB9NaM4EtPXrDhzksb7eq/0XOf+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCY7I2ZdJgT2X3NvZlqbK5kIo0Sa6ZEyRPlwJhig8p0=;
 b=U7p/v9NbOgaHpf2PEklIIrH7pxgWP5iVKDM6ayAph2VsEeMnaPzsi2zGzRqlF5mDLxgHIa0IL8ZDRhBLc2DBT/C4FxSkkr/0CnrmSJqsnWEJDTYRktDPRjec5uI4lh0VMUbzIgdKAtAUO4yamE93RAk/45OwV5rdpWeSf4Gm6iTBeVi/6KuBUVApmKiw3oVKU6yEpDHpjH4LG7Zm4ddtugg9ZVp6U6cAu/qYkOpo1Pvq1P6RiJk2SnFyIoP/dlL2KYS9Cp/EWFBtKDJ1aKyZn7rjvrruKBt79kR7dDjFOWJpU5nFyFnpFp/fHFqa9QKMgD+/cgca+x79MQG3jaeskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCY7I2ZdJgT2X3NvZlqbK5kIo0Sa6ZEyRPlwJhig8p0=;
 b=XgGF3LwoMxYRyTkZxP18TGaiCdk4h4s3uBcebg0YnQ2TVnqjMhhdz5sMhkm8KJMyS2zU1PVCXxETX/WXd3ClI/1KIMc1OaUdKPjiqnC+3MZm0XizBwn05YC/IS+fMzAaRzGyw+5f0OsKPcCL2Dakfiq7O7ApHtNBOs1j6isRQf8770oAErINcNLJr7ZbT4m/tTv9KlWHv+R8TWdYhc89MHxtwWjcMsvdsCSOhIZWtmWujFXIqu0cKOm0xRn82uIZHWp4aHH7LBn43jI8mJ4CrZTWZfUP4ABeib9/PIh/Q3fQPuX7glJSM1EqMsQNhec0iubRdge2VyT4GF3bSomp+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8c5cebd-06c3-2a8c-737c-c6bd6544f95a@suse.com>
Date: Thu, 27 Oct 2022 08:56:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m pool
 size
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-2-andrew.cooper3@citrix.com>
 <ffb8bdb8-f54b-2107-ce1a-775337c172ac@suse.com>
 <0f048bd2-d08c-8bd5-2a20-7e49e794c679@citrix.com>
 <4c713750-670b-eac1-5f5b-376de79192eb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4c713750-670b-eac1-5f5b-376de79192eb@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e1e7e9-c2a1-4dff-60f1-08dab7e8620d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	owjdY3kXVankasGdPzjYu086APD5QIXR9bWTZth3Dw8aQZuoGARQAZRqQqxsxV5dBH69VMWO/m4y/Kn/nW3VVm5UdnyZep9yvk4CHzhAXsBaW7hdsR+eukdyh8AMk73lNqdRMDY/lZjTnywgy8J+USIVP4GPBo7KGNGfW5PnUGu4SIn/AzmsmOl419Ze2kzcvn2lHAL7etJGzzyL5p4csu6NgMVncfxYw1J1WClXSDCnfjy1gEPN78Dsn1Z9CuMSB44SsikSIO174SBZ/0e2dy6TmvWPFK8JwKDthlgWB1vo4LV3WPghp3AorwGFiYe92FhC+Jr1AnlEnHCXEkdlU6cAnSWFMXqvizc+VbgBH0YxNihPA6LK6nSJQz4XdE4MHVs9UWxQFmegODpeKDEugmNdUZia89CAKkHHj6hlJrmTBwmhv+apQhaBWdvoHY7l4LsUPByXOFySnoX4jTXfN/BACsJVo+rb5w/qsIn/cgE19lQuNybiqAeqDqVpaUtnZ9XhTC16k5RvGxGQLmfp7q7AQ7kH4Paz+rkVQiO7hzgjAjUaFJzF0fm4EV0hUeKhiPNaIdirkkFpEjzl/DOOMYBRZepM9Bi/JNUG8IvwN/dVo+r8zNPjl43/w3NXuSu3U3vQyVOYLgohQ98TNiMQgwVMxGnxhCVcZOXnieQqMd2gYtpVG4ZqIX7BYn0MqBRsc34gYVrXOx1VJjSO3q4GBGGNF/cOH4i73fwZDD1Vgyy0WXR0RLVYRGJg36TLLa6aG/XsQlkyfyHr6Kf34nxjxuOW97rwwFhPR053miV3F+r4sIQ9xk3HItO2zbn+xxVUE3PRyYbk2xOC5JZTh3xIzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199015)(31686004)(54906003)(316002)(6916009)(83380400001)(31696002)(6486002)(36756003)(6512007)(478600001)(6506007)(2616005)(26005)(38100700002)(53546011)(8936002)(66476007)(66556008)(41300700001)(7416002)(5660300002)(2906002)(186003)(66946007)(86362001)(4326008)(8676002)(60764002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDUzVDgxcVVMWjkvQ2xpalpPdG9vWkJCdFp0UEl4Wnd2bW5HbkFKYlFpODBa?=
 =?utf-8?B?VXVOSDJiVUJ6UVR1dHFFVERpUDE5a21TMXJnbWwrN3FEclBjb3RRK1h0bktZ?=
 =?utf-8?B?Q2FSOWZKdG5LMW03SHkzVU5TczE5cFZ4bmVhbktZano0Z1haN1dyNkZ1ZTdp?=
 =?utf-8?B?bUdKbkgrTWF4Wkdqc3ZSb0xlTU44L2dZWkdwcnoxVWlpRzBSMFZsWEoyUlFu?=
 =?utf-8?B?UEZjek55cjJENTFqRlZ5OEhMcTBtcG9PTG1BRU9lK1VkWGZmOXVQSDhWVXlk?=
 =?utf-8?B?MXdES1BodnNHRjRCekJTNmFoK0p0dmo0blEydlFrc0FtTHY2eDk0aEFadC9u?=
 =?utf-8?B?eGN3NDVDVE1BSSt4Wi9XUEZ1MVdVTU5iYXFKcUtKSktRdEw1VU81VUY4dnV3?=
 =?utf-8?B?eTAyc0R6T0k5Skd3Ky96aVY5cllBRUhVSVI1cHBrYVZPUk5EdDk4bEJDWkxQ?=
 =?utf-8?B?TDY3bCtDWG1Qa0VIMkxqc2tubXNZNHdQbkhINzFpTjVOVFgzWWhwOXhmYzVK?=
 =?utf-8?B?a3I2WXhtNVJUeEV1YmRGditJUjA1eXgwSC9CRmI3SlZaUmZhaTVkRjM1L3pz?=
 =?utf-8?B?bjZQZzFrQzg1cGV3YmhpS3MyUTdBVlcrOUZ0Sll0K1RqaFhvb3lkQjNmL1Br?=
 =?utf-8?B?cEY1SkVqbVl1aHdjdXNvcjMzeXd5S1ZUUVRkNGVFcnV0NGFRenNSUU8rcHk4?=
 =?utf-8?B?M3Nwc1psUGNkcEFVZlJmcDhCcGNSY0RIMjRDdjkxakt3OWVWTHRkVFlvR0Nu?=
 =?utf-8?B?c3l0b2NqazhubmhObDBYdkgySWVYb2JDTWo3dDdySnFna3phNkFzbHZISFlT?=
 =?utf-8?B?d3FWRkxQNDJDRDV6S3JsaG9sbGtBeWNvNXVrNVZveEJQL0JFdzVBc0c5M1lI?=
 =?utf-8?B?UFJMajJhOGdvZlVrR2d0a05sS2lpajM2Z3NrMWc2NW9mWEl5TVNXazRnSHBY?=
 =?utf-8?B?b2ptenlOK0tGV2JmL1FudjBZZTUvVkpBMUhtRGd1K2IwcnltN3RYMjdkbkhM?=
 =?utf-8?B?eW83dFRWTXJid0hNYUt5bEwvQU4zaDBVWXJhMFEzdllEeUtpMStrUWlROSs1?=
 =?utf-8?B?YlFWaGJUTmJ3KzVZdy9xWUR3U0NybWtscUMyVFE2emNEWWNuKzFpRThzQ29Z?=
 =?utf-8?B?WjBObStSN2lIUkJyQWoxbi90SmNqWlY2d2dNK2tqTk5wZENrekRzYzI5WGVh?=
 =?utf-8?B?WG9nVWJNVDI4aFVub2VaODdFSlk2VFQ3emJBOENuTHVxbmo3L0sycHFLSHdk?=
 =?utf-8?B?ekZiWWQvM3o5ODkzVUVNQ0lzWW9vTEc2ZnB0VmdZaUN3WHZRdXlrZWY3NDR5?=
 =?utf-8?B?R0lRRjlrbjd1NmdNQnNKcjhKeDY2eVByUTJtUmVzK3ZTeUU5TG9wN0dyaWRQ?=
 =?utf-8?B?YUs1NnVoMWx5bVhUTWpQOEFJSkU3SEs0cEd5eHlwR0dGTHZtWXpYdkdySUp3?=
 =?utf-8?B?cVgwL3Nya3hidXVVZUpUbWs2Nm9tOFJvTHJRMkhVaDhscjVPQjBVcGVMMjdH?=
 =?utf-8?B?OHFleS9POGdkL3YzU0cxbEVhWVVhU0EvejNZbzBkYi8xRFZjQm1IK0w3K2Nj?=
 =?utf-8?B?Q2NBWXpuNmQyTFRZdG9vTnRJWE1lQ0J0UHRlRnA3WS9XWVVvUENMemU0YXFa?=
 =?utf-8?B?Q1U1TlYzRWJIZU9oZ21iRUtJWFk3ZDNDOUxnNU4zVThBcTJ4V0VJN3ZYQzVh?=
 =?utf-8?B?eWxXNFZoRzhQV0JTRlJFSjUvdjVaTzFHTEEyYkdoZTM0ZGdaVUU1Umo3TnFn?=
 =?utf-8?B?TEtnOUlUTlorU0xHQUdwUkMycGhqRUQzRTMzdG9SeDZBUE5keWdLZC9Pc1Ey?=
 =?utf-8?B?TzhQb2FQNGtXdHNicDk5cVp5VENYOTRTQ0x6SHc0UFdDbDBCVFRDUnluczVp?=
 =?utf-8?B?OEVRdVMvQ05kQk5lOHZyTE5SZmlYRisyZmRiSFF0SkVGQmc5MVhpaDBoSk5h?=
 =?utf-8?B?ajhuV1F5VWxlckRZWEpKMEdhWGVlUncyMFlqYnpOMWl3STg3Z1pkRHpwTm5P?=
 =?utf-8?B?S1d2WEdkZzdvbzdieEdIQ0F5MWhwOVovZ29weVEyUUpjanhBbzA2NnA2UFZa?=
 =?utf-8?B?UUI4Vi9WUTluRlJmVGYwTDZlNGxsa0tNMGFxRlZ6Z0h4d3VlZTZDZDVlMHEy?=
 =?utf-8?Q?auqFl5aFQCmAH0pqVUJGnkRZt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e1e7e9-c2a1-4dff-60f1-08dab7e8620d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 06:56:33.2936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0hIAnl9kh9J9XyDp89FqtWJqxHJib9U/z2tys+dJD90QcWRPWZN1fD9bLfDZDqr0GL03adkFcHUsGwIMDETlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6902

On 26.10.2022 23:24, Julien Grall wrote:
> On 26/10/2022 20:22, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/mm/hap/hap.c
>>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>>> @@ -345,6 +345,16 @@ unsigned int hap_get_allocation(struct domain *d)
>>>>               + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
>>>>   }
>>>>   
>>>> +int hap_get_allocation_bytes(struct domain *d, uint64_t *size)
>>>> +{
>>>> +    unsigned long pages = (d->arch.paging.hap.total_pages +
>>>> +                           d->arch.paging.hap.p2m_pages);
>>> Unlike for Arm no ACCESS_ONCE() here? Also the addition can in
>>> principle overflow, because being done only in 32 bits.
>>
>> I'm not actually convinced ARM needs ACCESS_ONCE() to begin with.  I
>> can't see any legal transformation of that logic which could result in a
>> torn load.
> 
> AFAIU, ACCESS_ONCE() is not only about torn load but also making sure 
> that the compiler will only read the value once.
> 
> When LTO is enabled (not yet supported) in Xen, can we guarantee the 
> compiler will not try to access total_pages twice (obviously it would be 
> caller dependent)?

Aren't all accesses (supposed to be) under paging lock? At which point
there's no issue with multiple (or torn) accesses?

Jan

