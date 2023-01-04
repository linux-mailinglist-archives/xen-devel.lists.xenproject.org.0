Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2126165D08F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 11:24:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471094.730801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD0vV-0008VD-Rq; Wed, 04 Jan 2023 10:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471094.730801; Wed, 04 Jan 2023 10:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD0vV-0008S1-OI; Wed, 04 Jan 2023 10:23:17 +0000
Received: by outflank-mailman (input) for mailman id 471094;
 Wed, 04 Jan 2023 10:23:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+XhT=5B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pD0vU-0008Rv-27
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 10:23:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca8f7dde-8c19-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 11:23:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8074.eurprd04.prod.outlook.com (2603:10a6:10:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 10:23:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 10:23:10 +0000
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
X-Inumbo-ID: ca8f7dde-8c19-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+C7P2uz4eDXlg3xI4PsY7OYOZr8bcOox/EUFgAxGsF0wfvVz3wsZ/XSHSSXagnm/ytSWTL0KHIwA1QYdfVkJjGQN1paugLjrPDVEaSJUqjtBi6irkWb6xQ4gvDGvKUWYOR/8hdzCtV/lPSR3NpoRGEBrhw6cGsP9dEI0KH5etajyyeZdboJuQ3yjCSPNUmH5UXa0tGy/ykAq3NLu2RQBPen7RzRS6P4JSRQv5EjDeiGZ6oLMqiSkQkTjIRRpLN51RegeCjfuHUnpA1uzaiFrpOR0piZGWg5zV5wf14zC+PqpzIRt7I0z7nu0bjMe2pN81w/U2N/UFQtfnJmbrFj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0RcQ0o/ff3cMD/M7ElC/t6CUe9cnaxHFi1kJMUWY50=;
 b=XJhLCx+WVk6+PL63pxGEeGadAmtN3v/RX7vpLNgJiu5dfOZ+Tb3O5vG2h338icsCtRTbYZiQymqOGenGCWnQwn3wTp43KpOUCVMB+Y1g6Tljrt6YfbGS6olXP3o5dCA+ci2dcg2za3v9m2rEw47SlOiX21E9Dtp2yR/ZPlO0u8es35zEdqZvgTZbGcr2x1GmeoT2zxYBkS5dP5zMas29J3LBKLosSpH/lDct1yyB0o+pAjTEg6cLZ6KHt1xonIj78dy0SOYaV4Fa+EEu7Ae0DwJVPULw9rA8xAOHVp8l49Tph5ecB7cHobtSmp9T1bi4VqV/ST6odP8LDrr81iZUZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0RcQ0o/ff3cMD/M7ElC/t6CUe9cnaxHFi1kJMUWY50=;
 b=aLBjZro+AQB1E3fbVf7h5J85C9qzO/ai0gBdInG0zj4hKPeSqnfDiczxSK8vU+Bu05hA38r0pjA6gBJosGy1KQy/0ugw319GPYfzOl0pc1JOHP4ZOHd4P6FAQeaZYsv+FrxgFMEJvi4ckEu3vvR/rNH0ZeaAG7UboL68yR8ezedteaGQUViywe7mqaWkscV8icohbOUDBMQg2q1u74QfgtFhq0LwtxtERbo3TTMkbDgCKeccV1M8mCKChycBZUtTAoCIQKAWRoFITh+lL4QFtulg0ITSA+MSVzTkKssSzetSKY+fZcOlX5sK/Vpaz4YAzXUMUOFLbeXJgiivEjSn/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ade9f97d-aa28-bd7e-552c-35bd707bab29@suse.com>
Date: Wed, 4 Jan 2023 11:23:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 05/22] x86/srat: vmap the pages for acpi_slit
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-6-julien@xen.org>
 <ca02a313-0fa2-8041-3e8f-d467c3e99fb6@suse.com>
 <965e3faa-472d-9a79-83ca-fef57cda81c5@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <965e3faa-472d-9a79-83ca-fef57cda81c5@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d52c6e-e7fb-4996-ae12-08daee3dadc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	axDbbIbII69PS1LPz5UcfVp+L9CYX2zdCj8MvCFzXnbTpu2frFtqFHvpexQsrExYzXwPoVuhvZ4f/8v0YcxFuIUgm8EZS2L9I2dUe0zRLQ/9EK324TXkxi1oQ2cieiuS4wMItHHS0+cwgNZX52Z32uaBpjMN2s6Gfd0GynxWlWYgwaTxNwnLCmLXoFGLazjyw6jKKjxMuRqQgeJdOii0HhlShaxpoPKRubYDdyovkNg9WVCwbsMECm/Mv+PLTChtotpLmpaa1V8OxF08VH3X02WMtKfargEkkio4BghDmC9nLqKRSJeTmKKuNQaCAaaVX1d+EdI9y3nM/+h2Ma8v+k+gsxIQwAOda9tsUSKk96bs39yfdpEQ1I54Udxj+IDH0ntE6JTxgOEqbj/Q31rqLxSZd4BRynmN/78PbZXpkCatzPxWrh7kz7pr/YUdoYokAEvy8DtH1yilVw0smO71/os6HzKv+VW5JImxBAnEPIi46Nb5xMgj9sgSa38LG3wk0Vdzg2DowdNuXELPSIyrDxcs6n+Rn4eAwZCoYXT6ugzBlA5C9tMfYTRskmfGrPfmjY9dc8AwEg7LkkzWZGKAYelyi8KIPGaEE1QQn208NxF8dFBelT3UtQ2UCIXxCnjpvA5mZhxaZDn+HySRO3V0BoPswYCbHDR3dolv8nNt4bqNlAudrmqDRRp5xFXDFf14CVK+mt9x9WKm8Y86He3/mxLY3q7LqDUF734ns0TH7Ms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(83380400001)(53546011)(26005)(2616005)(6506007)(6512007)(186003)(31696002)(36756003)(86362001)(38100700002)(8676002)(4326008)(41300700001)(2906002)(5660300002)(8936002)(31686004)(6486002)(478600001)(66946007)(316002)(66556008)(66476007)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnNBTSthUjFDS0lMVUEwaitsMnZVM09BZ09vcmtadFJySFNIRk5WNFAwVnBu?=
 =?utf-8?B?T09Cb1NERXVTRHhKUU9XRlRjbHNZcFBWcHB4bUJnVElzU09oZis3TFNVZEZE?=
 =?utf-8?B?RGQxTU9tYWhqLzF4ckcvb1U5K3VnMi9US0VoQVNBQ2Fpd1lsalI1NXlEdE4w?=
 =?utf-8?B?b1lzck9YNUV2ZHJmTk91Y2IzWnFZMWM0aHFFaWZmQ2JaVjNqU2huOElYT0lI?=
 =?utf-8?B?OExpOEliVXEyamgrWENreWFqY3ZEd1hRaVFsZzdpQzN2YzJTZktwWmU1ODMz?=
 =?utf-8?B?TmJVcm5jSDl4SkVaUGlYZS9yWDNocXVsbHVMU2FEdmE4bGdsaE1acjFRTmdR?=
 =?utf-8?B?OTZVS0RhaXhKcldxK2lmMUJkcUQzQjZXNmhGeXVYZjZITlM2ZDdNQVFyMjZ5?=
 =?utf-8?B?ZWExc0ZVTGdHbUFIRTkxbzNSQmVaNGk1aVlnNEN5QjRLU2tpQVZia1lWRzRa?=
 =?utf-8?B?VldwOEd0V2NRNW1HaFZPNUNzd0g4VWRJMnQ4dHJrWGZyNzBUbmR1Q05MdVN5?=
 =?utf-8?B?a2Rkd2hVNjdIVnMyeFNvYWpYZUx6ZllnVzJETWJWc3ZsUHdHRCtTL1krS005?=
 =?utf-8?B?Y3R6dTRwMTJKa0FzTzRIdFpUL1pERW80b0kwUlNabTFsckJ2eFZJQmhNZ1hO?=
 =?utf-8?B?aXBEN1d0TjZlV3IrRUN1eE1RSDV1N3JQdEpkekdGTEt0Vm54MXo2dFd5UUR5?=
 =?utf-8?B?WllTTlJQSVJLSWtFRGczY2JlbXpuVkZua3pDM1BCOEtVN3BqWEppSk1BQU41?=
 =?utf-8?B?S3lPWUVwZE9PU0RCdHUvbmJXblF2Qk05RUdNTXU3c1NGSm9JWWh3clV5K3Yx?=
 =?utf-8?B?TEJJTFV3U2FDMkltcHhZRnhyd1BVNTQ2aVhNQ0xQRWJicWplVXhnalJjNmM5?=
 =?utf-8?B?U2tvZmZ4MjZDdmhhZTZiSGhqeDRrU3ZCOWIybFNlcFBWblBFZUdLdmVlZVF6?=
 =?utf-8?B?K1l5anY0YndrMnVUcEVEcXRCU0FRdkJ0NVlXVGtJMUVvTEsvTEFEeC9GcE1Y?=
 =?utf-8?B?NzlQZHA0eXJ4bXcrcm04YTBlY3ROb1g4emRsNnBzZkRtOGNIbUhqRWtLNDY2?=
 =?utf-8?B?RktIQUtuQ2pXVlZoLzJhcDlndE9iUER6S2d2TFl1NGJvQThNWUtzVWhwOWRz?=
 =?utf-8?B?QlhPaG1pUys5WU8yeFNvdzlXVUR5cWNudlNlZzRGUmlWYlBCTDNraEZ6ZGVB?=
 =?utf-8?B?bnBoWmI1UUZlemZsL1dUYllIVGNsaHB6Tk13M200VmNGV0cwUDNTUWxsYkp5?=
 =?utf-8?B?WVNwNjVJeCtVRlVPUjJTL2p5cnh0YytkRitOYlhSMDdyaFptL2ZhOVA1cHNK?=
 =?utf-8?B?Y2d3ZkdwckN3VGZVejZyeXhkQVBTdzV5Q3EvR3dXRjZsMENNVHlVYVZYV094?=
 =?utf-8?B?VTYxS2xEcDZUMmxVaERsZ1Bwc3p1WXE3K25scTZyRk1HMjJGQkpWSEhOdkFn?=
 =?utf-8?B?YzBkbnZCOXMxV2FVZVVjS1cwMnRlV0JqOGZ1VHZsMFozMHJ5dUI1RER3clI5?=
 =?utf-8?B?Nm9qcVhtdkFJRjVvMitDaXMvUFhaQ1hPc1ptaDh0cHNrTXc2ekZ5bEd6NUY5?=
 =?utf-8?B?c3N5NUlKcXZ4YXgyMVBzNVQyTWtCc2NxNlNIUWJQMnJydVpIOGo4VlRra043?=
 =?utf-8?B?MWpOMHFVV1Fxb2dQK1hXSkdmYnArSnBtLzdTa0FvNTRSbXNqMWp2M1J3R04r?=
 =?utf-8?B?L01rdnJwV29MdGdXQytmMStGZStxOU1SY3BEQXhiZHZOQWhKYUJEem02VThY?=
 =?utf-8?B?YzJsRVBSekpmS01wSll1SFV3T25kMEMyL2U2L2tpZWJxMG1KN0dScng3NWlX?=
 =?utf-8?B?YTZCWUpVK3A0R2IrMDZCcUUzcVJZUkV0TXJiVGI4WnlrMWJzcXMvUmM0c2ti?=
 =?utf-8?B?NGJ6a3JMcHVLQWVwdzdPN1VHd0tGcWZUMUhmK1c2WkFpVzZVMVJ6WTdtV25Z?=
 =?utf-8?B?TytYRHg4OGtCYmZ6QVhwazJzTDFXWkIrZXlmUWEzMkFOcmQwa1pYcG51VHZo?=
 =?utf-8?B?bU13UWtWMXlqenljRzBjZExMNU1lc0lxVkM5UzBjVVpLWmxSeXhiakZUdjJM?=
 =?utf-8?B?Q0R6U0tlMmdqMFgvT2Z5RFFoUFFlUVA0b2RTc3NCMUhsbmVPNXdNMHNxK2E2?=
 =?utf-8?Q?LL7Kz9BJn2X2uPkIT92yOCm/5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d52c6e-e7fb-4996-ae12-08daee3dadc3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 10:23:10.3919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoAl85N9MhwIKw8rWZZ17GRhGbByxtFt0vAbjMh33O2k/TjneAGBigAIQelWuQ8pp/cj0RNrusSMTEwZvR2t2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8074

On 23.12.2022 12:31, Julien Grall wrote:
> On 20/12/2022 15:30, Jan Beulich wrote:
>> On 16.12.2022 12:48, Julien Grall wrote:
>>> From: Hongyan Xia <hongyxia@amazon.com>
>>>
>>> This avoids the assumption that boot pages are in the direct map.
>>>
>>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> However, ...
>>
>>> --- a/xen/arch/x86/srat.c
>>> +++ b/xen/arch/x86/srat.c
>>> @@ -139,7 +139,8 @@ void __init acpi_numa_slit_init(struct acpi_table_slit *slit)
>>>   		return;
>>>   	}
>>>   	mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
>>> -	acpi_slit = mfn_to_virt(mfn_x(mfn));
>>> +	acpi_slit = vmap_contig_pages(mfn, PFN_UP(slit->header.length));
>>
>> ... with the increased use of vmap space the VA range used will need
>> growing. And that's perhaps better done ahead of time than late.
> 
> I will have a look to increase the vmap().
> 
>>
>>> +	BUG_ON(!acpi_slit);
>>
>> Similarly relevant for the earlier patch: It would be nice if boot
>> failure for optional things like NUMA data could be avoided.
> 
> If you can't map (or allocate the memory), then you are probably in a 
> very bad situation because both should really not fail at boot.
> 
> So I think this is correct to crash early because the admin will be able 
> to look what went wrong. Otherwise, it may be missed in the noise.

Well, I certainly can see one taking this view. However, at least in
principle allocation (or mapping) may fail _because_ of NUMA issues.
At which point it would be better to boot with NUMA support turned off.

Jan

