Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A7645606
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 10:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456066.713761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qNl-0005TQ-0K; Wed, 07 Dec 2022 09:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456066.713761; Wed, 07 Dec 2022 09:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qNk-0005QA-T7; Wed, 07 Dec 2022 09:06:24 +0000
Received: by outflank-mailman (input) for mailman id 456066;
 Wed, 07 Dec 2022 09:06:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2qNj-0005Q4-8A
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 09:06:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b114dcc-760e-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 10:06:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 7 Dec
 2022 09:05:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 09:05:51 +0000
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
X-Inumbo-ID: 6b114dcc-760e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmZZTerTcveT47wvS1VAvEsXEsBZGekV0BXAY+ATm2623ek9F09Nt9ExOpTS/0UJy3JfL9T8LZYVeh5A/owcg51dHIR7wFwYCSeCZd5t2LSLn/vNtPLxnVje60WK8o5SZNvqxAzUxodGkN46naNd/cQcre2+DtjIkvuOXEI+GlDgd8N+LihMjW1uvEyENBUs4kRiVFP6XoBQ+j1tu84FzKPBZQD9blHD5N8mQBvfuM6rmVzxmXP1oMlGE/zlGOLpO2vr+2exra4ZaRII8/w4Ul1g5nv3Z1iJ3s9dZCZN927FaqWaiVNeV9AbhC4sqdhvGN8vvgsLS/e0P+R10ZrVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NnTJrIX9yVfzKsX7gi8eQ/oYaq8/R9FEhj+m/cfizA=;
 b=hj/gh34BkzLEorhwusvIOsidXWYw94y5JRXFwNewrXNKcpHQFrvVSKzZI8FU5hk8LHy/+jyOI2aljyWFxxLj2ZpO586BgwqiGNJTRrvH3/ZK58xf5D/zSRx4gS2aVRiodzZ2vRKMx9VC0jZGWzBUy/ThGBEt6gAiyhmGM3E/+ixKDs33+SZSVHNNGLZIdD9xOQapShJVZTBgiN5Mzj6ukAnIy/XobO56wUFiFyfb6UTxThnAAbABUjGLRqsdOqCFlbr2vgmN/TXryjo6D4Edt2FQO9PPiFvYmdGFg3yAx/9YJhfI6R4RUInUCwVQgilC6Vl8DqkoMBunIvyoKrS1Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NnTJrIX9yVfzKsX7gi8eQ/oYaq8/R9FEhj+m/cfizA=;
 b=X4oq2y+tiBZ+lCXrF1Tt4gaILk+/QjTetduaKVFdzTanjKOgkf1SPQDZ/puXVV8Um242ik7FFfUSFlZgXCbwXHls4FasEhDTNPwZzFf4GdvRaXnGpZLyMOh0vrTreEXrGMNkwDhOX0KEyjhMoN98Y3vu90Pg+T6eu4eEPIPRzWZm7pBsgyn0s3McxbRwK/WLbN+xs83PjkHteoTz3OCHmSWbc9NA5DDdTdXCXk+5XBboYfZBplr2TLuzKTKGZFdAlG4uY9SqUJ06DWSNdAAVxgpHlKLFVTZ0RGQkZ+Dk/2r/Lhrlh7LAdjeXjujgFuw+jgtGeUMzAQf3RT3Ep4tmOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <397a24e0-e143-6a8a-571c-ea20ca4ccb63@suse.com>
Date: Wed, 7 Dec 2022 10:05:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] ioreq_broadcast(): accept partial broadcast success
Content-Language: en-US
To: Per Bilse <per.bilse@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <9cc56d01a09fcf6e1e3e9d48e60420f435fa34c3.1670348481.git.per.bilse@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9cc56d01a09fcf6e1e3e9d48e60420f435fa34c3.1670348481.git.per.bilse@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: e9922be3-9abc-420a-e1ee-08dad8323d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jzdHPJkwiQSelT6EAvH6W1DgQ1rZvBL68xKYlFqKC5kbgQKKZQK8hYfIhxq/exY4f7b/b1c95O3v0rJRiIKCMBc568GqgVGkepgnb/tQeaL9pQkfRf6i3WUzy/pREEOkXw82/vvNOzP2rbgcHlp+CoKBwNbWOJJQRMWqYGty6sMUfORLTtE8tWeRFfK0oRzOugKgjntcGU7vzK1JpsqctEENOhI/yn6wH97WTjbQP0ljtELWTAY87FbJOmxRMzYktU8/QEqig5FMm9PWerQjD7ZVt/jzzVt0rBeHEFqVDieAwYaabK8SM2JlH4hwsVxr7Kr66ztsDJ+tzoR5u349NbDoyIavaPTxV2Yb7AH52rpjdGxh+xOqNpYFbt5h3tTgOyyRtLAxl+22el21iPCscrzeL3yv0SyBAXCmXWrnpYwvIwBZltEM8dce+pdVKps0dKV1wdHuG3Q6RkTmH0lahKbhU0rmGLTTSWOJ5gMNJ5NGV1EpIKbYBemqjUm7ctnowMsDxSoAs0a/6F504D90SdXww2SA+ZQxY6Dw6egZypNod72DhKdIaNn4tN9Kjrk1cGnNSLLYQQ6kMasc0z6aD0j45sVezS4jtb9haujUnVd66nWA4RtJT9xnTL/HWPAXgsT7feezD3ivdCGYhgZr5YqwxJu5naxv7poQQ7+axGEPDlV9Ufy332OED7aLOL6RDVIxcFf/8LLGnPJfhjf6ME/QLQTuDIgvY/hNztKrcVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199015)(41300700001)(86362001)(31686004)(4744005)(478600001)(31696002)(4326008)(5660300002)(8936002)(2906002)(8676002)(26005)(53546011)(6512007)(186003)(6506007)(2616005)(66946007)(6486002)(316002)(66476007)(66556008)(6916009)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGpoUHpCUDRlOHF4Slp6Rk1OcnhzdGZhVjA0UGg2OTcxK3lXaXZiT0txUzlr?=
 =?utf-8?B?aCt4YnE1NmordlNlQVNJOGg4UEtHUjJRQUtCaENLYlZCWGpGeTAzMEkvdmt0?=
 =?utf-8?B?YjY3UWRZeTVqRGM1RU0xaXhlQVlENmFoNTN0clptR2pxQ2ZFdit1VS9TUS9r?=
 =?utf-8?B?QjE3YjVwK3VjaWptN1o0cG9MSkRTa3ViL2cyWnJkcElERHo5YUxRakxFT1ZO?=
 =?utf-8?B?RER6WjJ5TmFhR1NGMForWmFYTlUyT3Z5eTNBZUJMbGRJZ2FHZmYzbjErYm9w?=
 =?utf-8?B?VG5FVVloV01UMGJFVkdWbWduOStSMDRiVHJ5OWpqWHVMRExTVm53aXFIMDlm?=
 =?utf-8?B?cFFhYS9TUUVJdldlOFdwR0tQQm92RmE2V3RLdU5lcUpnUVZJWUxrVUwrVzFn?=
 =?utf-8?B?Z0Erc0JVb2Ezcmx2TG1qMXJ6aStUNFRBZ04xZm9acXFlYjhQbHUvMGRrN01v?=
 =?utf-8?B?VEJTQUNZVTBIOFFaVVkwcWhKSUlXTnRvcEEvZ2RGcElHSkZzTEtxK1B1MWZ2?=
 =?utf-8?B?SU0xQjJUaStTbDhvVHJOK1Z5RHNhZFRiaitJdGpBRDRIc3p2ejNqVi9XMzhR?=
 =?utf-8?B?cE5SNE9hVnVKSDBTSnJpampuTzlHOXBTSHBpcSsxWVJobkg3dmpQcEkxK3pv?=
 =?utf-8?B?U00xcXRINzhSS1Vyd2IzK0dtSWk4U3dVQ1JxOTZLVFVGcmRVSWc0NmROeE9z?=
 =?utf-8?B?M0NlY01rWTN1K053eldFMFcwNWliK1dUck00Yktha1p3ZG04M1VtMHJEKzlU?=
 =?utf-8?B?VjlTVVZvR2dhZjRlU1B1eHluQ3QvbHNMN0huZElVWVVPMWJFL0pLalVhdnVO?=
 =?utf-8?B?TXlTeEdITzhUL0FYdjgwYUNORjNiUHdNTDdXQUo5Yng4d1YvR3h6LzYrczlD?=
 =?utf-8?B?dzIwSWxMcDZ5M2lqbXNYeHRkOVo2enFXaE0wS3htRk51elIzTG5oTHc3ZDM5?=
 =?utf-8?B?V0tVRHQvS05EV3RCUVJXbEpNLzBsakNETnNKTmZDZmJ5VjE0c3BmNlhoT3kw?=
 =?utf-8?B?ZFJhK1ROK2tEL1VRL0F3RVVpU0ZIaHo4YmNhYStyOWJHMlFBVi94NXRiVUI0?=
 =?utf-8?B?Wk85akMybHRiL1ZiRSs2YlZ1S1NZQXRNVW1NRFNUcXQxYmhlVUI4NnJDb3NT?=
 =?utf-8?B?TW9hamxuTGdNcHNmSFdHaFdlRnRDdkNpeDVUekpUQmFpZEtRWDl0KzJCT3Jm?=
 =?utf-8?B?QllicnpuRDc1Z1F3T3VmODZyaU9rS3pmMldSQ1RrbmxBS2FhZnRvU2ZVNjVq?=
 =?utf-8?B?V3crdncyVWxvellqU1p2bW1JM1ZJNis3UUNLT3hzRmtmdWU1SzBqcGtCL0pG?=
 =?utf-8?B?aGEwL3Z2eG96c3puN2dNSjU4TjhKV3djUGNwbUlGUmIyaHFhRTYyYTA3TmYw?=
 =?utf-8?B?enVFdzFtMUw4ZjVYVTFWcm1XanFWenZvQmlJelFEUWhTQVRUYXVLcXZoeVdJ?=
 =?utf-8?B?U0o0QnhQcHk5cDM4aDE2Y1A1aHNPOENtTU9Qc0JFeGk1Ty9rbFhRS1d3RENF?=
 =?utf-8?B?eklRMGlKak0zRVdYd3FzbTVDTC81dmxVY2VaemxOc2JRVDdZaXRHS0QrMGNP?=
 =?utf-8?B?eVhOS1BPZERhNnpTZ1BCSGZOS1h0OXVrdC96aTF2YytIMEZzbldRUjFoWkJE?=
 =?utf-8?B?b3lvODgrS2lpZHZqS29SSlpRSUZDMUplWTZTY3BZWHh3dG94dVlnNURFSnlK?=
 =?utf-8?B?c2Z2Y3hsVUNCUUpoTTBuYmpTZ3UxeUNac1B1UzhnZ3RoVm50SERBdDYwRTEy?=
 =?utf-8?B?ZW9FQ0NnM2F1bmNYR2xPWkdtK3kwMzRWK3pBbVdJNDNpS1phTW9YVC9uc1lP?=
 =?utf-8?B?R0dpU1ppRENvaU1iUS9DUHZ1Q01ET05kbjVjR3BxOGNIem94R1RGa1FwdW1T?=
 =?utf-8?B?UlZvOW1HMm1nb3UzQnQxOHNCZENHZ3BTV0tzNWtBN0pxWndzVy82ZEZrQXBy?=
 =?utf-8?B?S2RtcUdsUnpvS3ZPM24vcTVsOFhLNzJ0bUYrejU5ZFN0WlV5a29pVFk5Vk1n?=
 =?utf-8?B?YUlySExuaHhIOElmbm10SUt5M08rZWp2WHdVYnRKd0YwS3IvOVh2bW01MVJQ?=
 =?utf-8?B?OGVwWU1ScFRBSzBRMU4zUEE1SWswSGZrM0FHS3VuaEZKektYa2NEN2dBdmVk?=
 =?utf-8?Q?Yb3Suliiu3DIK8d9jzpZ/lP1q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9922be3-9abc-420a-e1ee-08dad8323d3b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 09:05:51.8488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAyniZ+8SP275ypGTKVfv83Dw2POAG34joyRfzcfrIsfI08BVnXWD7kffJba2k8pD4dclDkFIRFP/92CjN9fRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377

On 06.12.2022 18:52, Per Bilse wrote:
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -1317,7 +1317,8 @@ unsigned int ioreq_broadcast(ioreq_t *p, bool buffered)
>  
>      FOR_EACH_IOREQ_SERVER(d, id, s)
>      {
> -        if ( !s->enabled )
> +        if ( !s->enabled || (buffered &&
> +                    s->bufioreq_handling == HVM_IOREQSRV_BUFIOREQ_OFF) )

Nit: Bad indentation. Since inserting the missing blanks would make
the line too long, the expression wants re-wrapping. Can certainly
be done while committing.

Jan

