Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9A7B1D03
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 14:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609689.948789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqUI-0001CC-4R; Thu, 28 Sep 2023 12:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609689.948789; Thu, 28 Sep 2023 12:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqUI-000197-1U; Thu, 28 Sep 2023 12:51:26 +0000
Received: by outflank-mailman (input) for mailman id 609689;
 Thu, 28 Sep 2023 12:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlqUG-00018v-Gc
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 12:51:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9c4e0b5-5dfd-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 14:51:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6846.eurprd04.prod.outlook.com (2603:10a6:803:12f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 12:51:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 12:51:19 +0000
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
X-Inumbo-ID: b9c4e0b5-5dfd-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQcgXGfsQsLlkIYje9fdVAvqBQ64f4+7X+lnjhk+KHhLMxGwEkNPI+BtCAKR7fQBfqD3Hf5Gh6Q2Mg+wYAmG4X3wGTaQ2uNq++dyfjhFPhg8ngGgfGKTQgdhjneDcCERLHhr+XOi2bUrWafEu3MtCPhBmkVU8P3ruOIqEHL9cXfTtdsHmhVaN+tefGqddYqafys6fgE+D5gcdUYbMvReaGKNwGlk5Xp39sfPUe4b+vY4pRaFNWcF4HxI5SDQdhS7obYNQyccOvJ40DqYOUgFONzWGK2P7kztCpW9VfrabRiCZ2JXUQc8iynsvr/z8fkDrRBdJ/r+xJnFaRjRqKuJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW63JsLgwKOuQZ88dJt/vuqFR1CwMNRu/oM0hCsFhY0=;
 b=dKQFlf8yc+9eMhiEfwnSpYNCmqw3FZW+aJxkIxd7UX6dNHwUE7CrwsqO40EIGSQSgDxJHuyqHnL+dZzeZ+p3AYhQEPE8FN1YI8eQKQ6tG6xsJw1l0pxZjpU1NedDEe9lCVqUPJpAhqIw4/UjCbKJtVXIhRpm08Vw58KjBZX4VbT8WD65jn78JYR6c5xTa+1+vhHB+Tl+GsSrKejHFVh5SfKcLAim6tDPMIfqnss9N9+gTiwXpbzgZoRBP2cwbwoKvYGy6aLaXTj4S8yo2GYvQWSV1QYXE+8LHHruzGebzF1PFlt0mtd29Ir2mGGQeeFzNUtqzTG/+SYD24jFs1yiEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IW63JsLgwKOuQZ88dJt/vuqFR1CwMNRu/oM0hCsFhY0=;
 b=nagIasJf5jcMhdnZLqs+44IkXsv1NX+LwR/aJHIbVzodYSp42tIMN/NF7CxnQgbDUKe2/KFsgmfoHMin6wwkxtMTWjI9zyrsX4NW+ks9woTkACRkwYqPtIeTKeImk+hqJyn7L4OFdxph2K5NMBTVYPV5hxmD+WVwciqLXYWXRrNVDSElUKv3UuOUNnLCvDLFBG1cyjYpENJg0vjjOpnJplaohxQMmqNW9KofokbdNPzegnWkQdlvnxgVoocZOJwvdExhXfAZ3Yag/ARym8HS4BOk6DvnKQ2XqMDbUsEyFCvj0OrPcS3KLHgJUY2UiBnttOg6f/jTrNwFoINaiAVwyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com>
Date: Thu, 28 Sep 2023 14:51:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com>
 <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d29a633-4729-4566-9ed0-08dbc0219c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wyilUfX2Qy6vPs7o/9HFL6CNvLNxEfjbBX6ZjxYcWWrkTzgO8xFq9Lu9CHx8aqP88Rz5ve3o8hRqb5njrRvZ5OHz+Ifoqbaa3S6Sc+Erlildusl5qyb0LNz6A6mhI64ClKgYJPoTDHrEws1cbtm2nKjTdIEQtLEseR4FpIiqRFf64rU4g2NiOCniPa9wxHrqJdiaB4EXlBD19lbW5Nupk5ycEUvHW1iCZl+mRNlPexJDatc+N7T/BDXiPYssDlSP7I2WgfpAGP+kh5/70ISEbxH3105zHnoczd0GHprw8+uspPlGPAWXwmBgVQXURyjSREtgId9dLIzhNtg78RRL4Iv6bbM2uXNojlbKUyqcGR9yXN+MInmpY7MmKiEKrhi+N9lkUgBlrN1P1q91eqOHf9dQEDBU3jRk0kc8EsYUbMzx5YidSFUby2PR2A7Sya6x5RaiBFEESiGr5Nfw2LJjcfLsrgZJOSwQFTXTrcnxz/vswC52C0xyOUZjJZXmoj77V5jmU6ycF40o4Ig4nIzyA0YDMJBrcsoxegX/sOFf0C5pKM7iW4Q5P4tsc7RRj7KfJy/iV7HGAHYfcu8iOphrjQN5wLjw5Rky/NSbpvXfsbWE61NqOrPUpq6N1mL6MgZlSNod+NyM+G/zoH7muBxxsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(41300700001)(7416002)(31686004)(6506007)(26005)(5660300002)(54906003)(6916009)(2906002)(316002)(36756003)(8936002)(8676002)(4326008)(83380400001)(86362001)(6512007)(6666004)(31696002)(6486002)(66556008)(53546011)(66946007)(2616005)(66476007)(478600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW1mcEdLSmxqekFCWGxxMXpqZDNsYkV5MVY1Q2tEZFM3R0x6cWR4djNXNktQ?=
 =?utf-8?B?M3FTcHVSVnVBN1JzdGtMWk9COUlaV3d4ck1rbUVRMXlmN243UUZRN2JvUFFn?=
 =?utf-8?B?WVF1WGQ0SnpuUllHcmZZcktQaXdmMzQ0NWxGYVZKbkplcHFvV3dJQnRJamIz?=
 =?utf-8?B?SGZOWUFtNWo4VzB2QVd4UFJqMCtkaDR4aXZRRlZFR2hEaXJSaUtkNncybWRX?=
 =?utf-8?B?TE1rU3dxZWV5MkpNMWRNMTI2dW1Sd2xUeFliZHplUEJHbUZRaTlZN3dRVHpR?=
 =?utf-8?B?OFNwc3NUc3dyeSsrd1p4WWdGMmIvWk9MaUt0bmRvbllVS2dxTEI1TFNpOFdB?=
 =?utf-8?B?eEZjaHNIb2dzWnAvdUlCQS93VUE1T2hNS1dOZS82S092OGNJUUYwQmYxZ3BR?=
 =?utf-8?B?WGh6VnBFQUpSNVlOSkZvVThBMWJJNnJzdGJvd0twcDU1MEwxN3dnSSs2bFVN?=
 =?utf-8?B?a0lHS2xHSHh2RVBkVXNoUkdmMTVsd3VJVzVVNUZ6ak5KbEc4b2pOdUhNcVI4?=
 =?utf-8?B?cEtzMmpZVjFocy9YbFN4WjZFRXg1THBUU2dWbjZSZGY0WVMzdlRWd1NqaHFG?=
 =?utf-8?B?cGVOa2JLaEI5NVk4VGRFWVk1RGw3M2wvSm1OalkvVmlqQkU0YS9Yc25odkxN?=
 =?utf-8?B?dG0vQUpTcWg1c2dhVmlmRkFDSDFicnhBcE4xS2VOYkV2Qm5xaDdIQkpMUjl5?=
 =?utf-8?B?K0hJZlBCU3pBUUswS3hqME9FZHZXd2JqckwxMjJNVzBleUtTL2NQQm94VUtx?=
 =?utf-8?B?RWpnaTBSQzU0RGhFajFuQ2UvWk0zd09lT1Jia0JxNlFTZjZ6aGNPWHJMaWYr?=
 =?utf-8?B?MFNzeVpiRVR2N2NVYU14K0YwYXRyT0lIcmJyNm5xVjVWTjRYNG1UQlBwVi9x?=
 =?utf-8?B?SlBWTUpTeEM5TDVRaVVQYWlxaksrOHNOTytEV2NjTjcvbnJvcVZkYmlVOHpo?=
 =?utf-8?B?U3ZvOTVUeW1FbmE4ekJHUjN6RjVuL3VRVXR3MDJYS0hXRU1DMlVjbmFOTTc0?=
 =?utf-8?B?WDhNWGhobXFXQ2phbTh4R0xWaXo1L2c5a3VOeERGcWViQkhiaVVaV3NtS3BH?=
 =?utf-8?B?K3MyUlhKYWtnYTcrbGVGWnRhcWgwcUI5QVdMYmdJdWo2V1Y5V0duUDdTcVdV?=
 =?utf-8?B?RzJ0ZlQwQTZEdFpObUFQMGRndzZKMXQ3VS9RbUt5UkwvdFpjWUJaeXd0UGdF?=
 =?utf-8?B?c05ZUTBZaVJSTHl6VnhVM0dCaFJiZHZVOXdQdVRSWHRoNEtFS2l3bHl3WHNQ?=
 =?utf-8?B?aGVkUi82cDg2eXk3Z0pXWU5SWkJSek12UUVnNGFjWFE5eHZESFhpMFFsMWZ1?=
 =?utf-8?B?eHlkTmszd1dqLzRyNm83dUhaRFhsZzViWUVXblBtTDdhMGp2S1NRT2txeWFx?=
 =?utf-8?B?YWk3dkpoSnZnblQvSmdiajViM1FsKzNFOVY2eUhvVnY0L3lYVFkrYmRVdWl6?=
 =?utf-8?B?TUpFL1pjVUhWcG52a25DNkxCWTd6RWVnM2pGV01KV3pqS0hwb2xITUdKdkhp?=
 =?utf-8?B?eHVtZ0tpM3RiRVlPLzVyaGtHeERkS0J1SDJESW9iZjIxRmhPa0xxZ2xkNjFu?=
 =?utf-8?B?cUdlbkx1M2l6NHNZZTNDSkl6VmtZZFZRZjNTaTQrUEVOUHpBSDBxSVo4N2M2?=
 =?utf-8?B?cjJhakx3OEJuNjU4QW4vSjN2YmluSWhYaU81MXM2NjZ6SlVMd3ZoME03cyt0?=
 =?utf-8?B?Q0lEdURybmdQeHZmejBmT1VYZldXZVp0ZnVQZkZpNmsvWmtoMFlzZmdIaFMw?=
 =?utf-8?B?cWhJdnNEdDF4MmkrRW94bFlSSmdSL1dVZFgybEgvTjl4UzUybDFmdHMraXRM?=
 =?utf-8?B?SXptR1NZSzJCd0QwR3dSeUJEYjJVY2lkYVdMQlU3Vkk1VDlFcUpDMEhacUY5?=
 =?utf-8?B?aW4xdEE4MWovR2Jjc3dFamNpSG9rQzZQU25tNEg4MDZRV1pKZEFQeUxUTDJz?=
 =?utf-8?B?V05lRXZ1SDRSWVY1NnhSMnM2eDhkRWJWamxxUzZrNGhsYy9zNmZOUTNyMVlu?=
 =?utf-8?B?STFFMmhUSStYQVNJZkNUWCtPcVpMOUdEcXpHbnByZWk1aW05YllqTmlTWmR4?=
 =?utf-8?B?bHl6YWl0ZUVNUXRTU2dwRkhvak1YeElHNUJUNDJXNDY4USt4WVZKeTA1dXVL?=
 =?utf-8?Q?jc0rYRqyiQFvBhq+Mmu3MGW2Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d29a633-4729-4566-9ed0-08dbc0219c87
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 12:51:19.6738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9P0x8S47pydkLfbScN2C7UH+qW8evcjfJezj8pMkfsIBmi2Wjc/TLD4eR9aTPBP4O6efRO32uysxrGV8KaVUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6846

On 28.09.2023 14:46, Simone Ballarin wrote:
> On 13/09/23 10:02, Jan Beulich wrote:
>> On 12.09.2023 11:36, Simone Ballarin wrote:
>>> Add or move inclusion guards to address violations of
>>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>>> to prevent the contents of a header file being included more than
>>> once").
>>>
>>> Inclusion guards must appear at the beginning of the headers
>>> (comments are permitted anywhere) and the #if directive cannot
>>> be used for other checks.
>>>
>>> Simone Ballarin (10):
>>>    misra: add deviation for headers that explicitly avoid guards
>>>    misra: modify deviations for empty and generated headers
>>>    misra: add deviations for direct inclusion guards
>>>    xen/arm: address violations of MISRA C:2012 Directive 4.10
>>>    xen/x86: address violations of MISRA C:2012 Directive 4.10
>>>    x86/EFI: address violations of MISRA C:2012 Directive 4.10
>>>    xen/common: address violations of MISRA C:2012 Directive 4.10
>>>    xen/efi: address violations of MISRA C:2012 Directive 4.10
>>>    xen: address violations of MISRA C:2012 Directive 4.10
>>>    x86/asm: address violations of MISRA C:2012 Directive 4.10
>>
>> Just to mention it here again for the entire series, seeing that despite
>> my earlier comments to this effect a few R-b have arrived: If private
>> headers need to gain guards (for, imo, no real reason), we first need to
>> settle on a naming scheme for these guards, such that guards used in
>> private headers aren't at risk of colliding with ones used headers
>> living in one of the usual include directories. IOW imo fair parts of
>> this series may need redoing.
>>
>> Jan
>>
> 
> My proposal is:
> - the relative path from "xen/arch" for files in this directory
>    (i.e. X86_X86_X86_MMCONFIG_H for "xen/arch/x86/x86_64/mmconfig.h";

X86_X86_64_MMCONFIG_H that is?

Yet then this scheme won't hold for xen/arch/include/asm/... ? It's also
not clear whether you're deliberately omitting leading/trailing underscores
here, which may be a way to distinguish private from global headers.

> - for the others, the entire path.

What exactly is "entire" here?

Jan

