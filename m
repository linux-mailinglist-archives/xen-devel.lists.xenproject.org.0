Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE34666553A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 08:38:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475096.736618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFVgE-0008Hx-GJ; Wed, 11 Jan 2023 07:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475096.736618; Wed, 11 Jan 2023 07:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFVgE-0008Ep-Cl; Wed, 11 Jan 2023 07:37:50 +0000
Received: by outflank-mailman (input) for mailman id 475096;
 Wed, 11 Jan 2023 07:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFVgC-0008Ej-KO
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 07:37:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2087.outbound.protection.outlook.com [40.107.6.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d763f9af-9182-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 08:37:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9300.eurprd04.prod.outlook.com (2603:10a6:10:357::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 07:37:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 07:37:44 +0000
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
X-Inumbo-ID: d763f9af-9182-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ylhaq2dbWYtp2PCsAqbi6EZUATIrgXI3NU9ug2iNoHC01ScMdqf+JG+GmH9b2FXwFSYuWLoNHbTodEFHoy2pZNG63ubP8pfC2nGi9g2U7rGAflQ3WCpfMSRWVxxfDANmEI4eFtnyzYOo1YNlZzpCZWiHPlI9Qt2XGaLfPBtQCGu7iGF9frXU0PHjddpF7A0nrsWo9/A8Z8QHMg3D8XVmUlVf/nLP9nGTTth/WMofU4yZgwYF8Ubs6hSPNaHZO93xR/fpsPUWWizTaohzW4/4Uf/jpjpkTfeI4rO4EFQWh7ynr9GW0NNV2uE/Ic+BfPao00OQ6On9ZNJ9FTPvcwUE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhz+97kEQewXrQMY8ev7cqCU+oOfgrtlWTWgYUbkSVk=;
 b=NYMN3PBk+1+retThxrA3rEPbAmqABTWtctjgGAYXMBKHBiICdnAOf9+5iC35svKuAX8bkpTLRt8lOnXibbGqxqIvIlpVQNrW6Gl32IVpGYi7UnCvH5BhKlLaz1lyzqDefHZYHEeIqlwOiYx9lGh1QlXg2eSfvkIdFrc/9LqbJ4MPupRrmITV1vmsY0cel0lXHFVTQhJF7CLqkGHVZk24p4L84V6F52bh3zhgPcNChxqs/4OCdifUnr9C2hoE0YSjRjwOhGhwZu3478ZU/UPNWcU+32iOo7AhBlDq6ADlPvfZ1BuHfAUPKZGsEs5F+a8PohP1ZpNYx7lyYE0+Et27QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhz+97kEQewXrQMY8ev7cqCU+oOfgrtlWTWgYUbkSVk=;
 b=rLfq79Wmkm5JJWSU/5KAXxtaOuzo6G8J5qbv8K6JYzCKAc0JfsDiTEGk9xID6UoTUQTzQPe0eTnunEcleE6Rr5ovF0Qtbt2vqyc+zFUOuDWM3C9qErj6zebG2gR7Ja3HRitbRFGigB3GAmybA/OlpojMIvxvk6k+e6qsOXdO793Dxpfpw+qPeQLRul72Y9F8nUWilBnJNkNKGgcyXV2ubX415/4VdL+LZ/3gDOhvxjy5IRtfSArSDtUfT/BcrrwtqzrakxQUqB+wzwjJYkbwhLfkYIt7DQtFIQ6sOtm7DgkFEBuzIpV50AGRwkXdje39lNriCfGSjGwnkRqloOwxcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da886d73-efe1-f5b2-9647-cf167741c8eb@suse.com>
Date: Wed, 11 Jan 2023 08:37:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/6] xen/riscv: introduce dummy asm/init.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
 <b1585373e39a7cbe023f485aa5a04b093e25ec80.1673362493.git.oleksii.kurochko@gmail.com>
 <891d0830-7fdc-202a-5f12-2364cae5bce5@suse.com>
 <e15997cf6e765cb23b706889b93ee35a90173a8c.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e15997cf6e765cb23b706889b93ee35a90173a8c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8ea0a5-f7d9-4e9d-15df-08daf3a6ba7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UkNZtxUzAMOYfa7Q9hxaQ033OhtDFbzkinkzniv1vh3aleUg+v/5h0FcQTPoc1bxQkm7dZgA5fy/gfJpxMwGPcd6qQ2AD9oZGhKYv1nU+ddBH74vp1Wpj8B2YGegecTpaj8iad+SozoW5lguugJcwV5/EzICQTxdL4750fCkHdzp4Q3Dapwkx07V8X3FfEOM85pxezjE0ig1lkDjeimVdQx77fFZxj2afBRpruZ7nz9J9BUo1/OyfzWmK5JtoeD/74I8lSeIxif4GW4TJ8aWBTD87F9RJnPrEu5s4OsuGY94rGWgLZ052ctC8xYlvxlaDjX5HFXt+lYyFBjYWNCEnNYDGeX9AV60c7JiZjXmpse8QTWLW5ztbMtEJh/deIxlrVpRZ0mVguoLlkKlj6vq0tyglChClH7C5dA0IYEsClt563Wam1QHhPFAZ5e6UsSeWZnxCdHFAKRh1uwF5eZbUCSRudIISKz3qfguzW76zPAsbXJ5q6vXLUSHppNXhF8RWT3KQEvFM7L5eC/1Xuggb+fkDCo5N244r/7ZDQZiVGU0iJdamkkm2R7diIjq5K10n2QfmB5rQ0Jt/zDTGWgDVyTgG1Z7pJYVcpfiAWrpnanYb6qKwJTayZhU7KzZU85TVzpAyGZ7u0Xw1GaJU7UMD9YxnJbDAm8wG2XSl8ccwV3XQp3j7Zs6wKVZWqdQi+PhReM0Fl56AsoRE4UitKrUxiG8FqkhRXblWEY6D9JnwVjy1QP3rx9sXlemQeWC1Gzh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(7416002)(316002)(5660300002)(186003)(6512007)(26005)(6486002)(966005)(478600001)(2616005)(31696002)(41300700001)(6916009)(66556008)(54906003)(66946007)(66476007)(4326008)(8676002)(8936002)(86362001)(36756003)(53546011)(31686004)(6506007)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck9zSmpmT2VaM1hFRGhlNGRqL1VqZ1RQVUdPalVFS3lJV3QvV2ZLZjFMNWtF?=
 =?utf-8?B?UHhaOENYY0hNQ0psNXFtN2IyVDdGbm1wNk82d1BkY3F4dWN4K1VlYVpOaFJ5?=
 =?utf-8?B?SkF5czJwbnEyYk9ta2dTZi9pbFhFdk8rMmwrNFd1aFNHRkFJeGUzUnp3M05l?=
 =?utf-8?B?T1JUMkk4eXAwVzFkMTBUSGN6Z0lja205VUYwU2EwNlFxYVJuc0s3QURmS2hw?=
 =?utf-8?B?NmFWWHJ1RlRDNy90cjF1eWQ2RVlDNS9RVE1EeFBTSnJaSk9tWStad3hISXRi?=
 =?utf-8?B?d0xTRjRNTVhaRW43NEptRW1tU3g2Q24xVVJKOE9GZlZTUXBEK24rZ0M0TElL?=
 =?utf-8?B?ZTF6UWVaL0ovVVNQZTg0QitFS0t6alQyWHEyN3ByMDBleVNWS1JsRzhaQ1F1?=
 =?utf-8?B?eGN4RzNBZTJCN1hlY1BIcFdxcVc3QjNhTldvamNoT1hJV21VNEZZdnhQUmt4?=
 =?utf-8?B?UVhETmhqTTRoT0pXRUlIWWpZc1NvQ2hCYWNuMTYxV0wxUk1KY3BiL2dUWnpB?=
 =?utf-8?B?Tzh5YVp2RlZJQUYzazRWNlJwNTh5THFCeTArR3FtYzlubkxvdGp6V2VRVTlK?=
 =?utf-8?B?Tzh5cStMcElwaEFNb0NIckFPT1NuV084bmo5Qm16SUNnckVJRTJMZ3IwMUhw?=
 =?utf-8?B?cHZGKzRxWG9DdjRRa3NMNTNZRXdPeHFXcWlxQmk0OGc5RnhRVjFoQ3U4UVgv?=
 =?utf-8?B?akVSMjJnTkMvMlJTVXVWZlczOUFHWUM4eWZ0MjBYbzR2L0tsNHJPTm82NkF5?=
 =?utf-8?B?WlFsckkvc1VCUmtMYmVDa2czTmtvSzhZM0ZPZGl4dldPeUlpNzVOaU5wWkJC?=
 =?utf-8?B?eUNRK21ldXRXa0trbmdOV2tQSlAzZFM3NlNSQ3NmOGRCaWdVSnZzVnVJVVNa?=
 =?utf-8?B?WTZ2OG5zU0MrRGJZZmNURCtZZ21DY21hajVFdXFKTjJ0aFNQWkxWTGZndEtP?=
 =?utf-8?B?bGZUcW9CS3AvbkRjNFc2ZnNmREVycTFrL1dYdlN3RFpzK1Q3RHI1NGY0U2hN?=
 =?utf-8?B?STZIOHRobzVVbDUzd0JxdkJUbllhRVk5VW83NzcxQUU3MUwxazRXOW1NcUN4?=
 =?utf-8?B?V2xjUGJVMys4d2pIYk1BSnlaSHFOSkNvNWNWUVpYWm5TZklVUlhRK2o4WVlR?=
 =?utf-8?B?ZXRsdVFIOE9Ua2l1VVp5OUxIZ0c5NFY4Tjhzbi9ZUGFZb1lheVpicWs3L3VF?=
 =?utf-8?B?NXlHRUphVFRybVYweHRYdG1paC9KN0VKOG5icjA1d21VcW1iWmFRYWE5Zklo?=
 =?utf-8?B?Um9NNEgxaHRDRFpqL1E2L3lrampNckJYU3BLblB5bnhEaW43M1c4azR3NWN3?=
 =?utf-8?B?Q1kvK3k0VGwyVnBCb0xDVUk4Ymg2VzlkVzF4aU92VERwKzBPcURtZHJRTzRF?=
 =?utf-8?B?UXNBRVRoa1BQWG9xNm9QbllPVWEzcDhaSXowUjJBa3JtaXU2VEdBQkgwL1RI?=
 =?utf-8?B?dko0VXJ0ai9rMU9lOEJZa25uNHlvTFRTVTZpcXhBNlZOR053eWoxVE9rbUZq?=
 =?utf-8?B?anRsVnlhakNBdjlPYzdHdis1NkhiblhTbFVRWmxBMHlJS1QxQmpxclJQTmRu?=
 =?utf-8?B?UVAzbTBEeTFiYmJsR2RKNGcrU3JZSW83K050RFJ2Umh0MWh2WnFhWWhlWUM0?=
 =?utf-8?B?d28vRUw0NFZUemdTTjlJc1JjcWlVYy9saGg0ZGRqbEFVSFhxNURvd2FpY1d3?=
 =?utf-8?B?cmc5VG9xUnRRbXVuNXhuWEUrNUN5SExTMEtMam8yUjNXQ0x5Yy93OTh5TGhu?=
 =?utf-8?B?cllPU1V3OExqR1NwOHRzeFdBaFNYYWFnbkh4QVVxSmRhclpSeU92bW1EaUZN?=
 =?utf-8?B?dUZMN2Q5dXp3a3lnQXhYL0lzOWJOTThoS2pLWUdxdHFZZEc2b1V0U05Bb1dp?=
 =?utf-8?B?WHlKUzhnaEpFVlJVY01KdmdNanpleG5qR1BqdWdZZTd1UnF5aGJwaTFLbFJp?=
 =?utf-8?B?ajdsNGZBWGtoYXgydWRDUVRMTVVtaEZ1cm5nVlVDa0kwZ2hVbkVjanVXVHdC?=
 =?utf-8?B?eUZ2V3FNaUpTRHZvWUo4NDhQUUtESnhBYjN0Y1oxWTd6TW1oeU1EWVJGRy9v?=
 =?utf-8?B?NVBySHFMSFFUemRHQjF2VEZwWjVrQ0F4Q3ZicjZDVFBpazFXKzNXZmFsUGlH?=
 =?utf-8?Q?eodkwE7lYXeUNTjStxNttCP+W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8ea0a5-f7d9-4e9d-15df-08daf3a6ba7f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 07:37:44.7076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wp03pECD6X9qBJpSdaiKGIBMHiYyCaAgqy6McWAlDLYiIhUHSUqmHTl3ATJ3y4UR58tiBSMMTwR1X/rGRUODRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9300

On 10.01.2023 20:16, Oleksii wrote:
> Sorry for breaking into the conversation.

That's perfectly fine; no need to be sorry.

> On Tue, 2023-01-10 at 18:02 +0100, Jan Beulich wrote:
>> Arm maintainers,
>>
>> On 10.01.2023 16:17, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/init.h
>>> @@ -0,0 +1,12 @@
>>> +#ifndef _XEN_ASM_INIT_H
>>> +#define _XEN_ASM_INIT_H
>>> +
>>> +#endif /* _XEN_ASM_INIT_H */
>>
>> instead of having RISC-V introduce an empty stub matching what x86
>> has,
> Have you had a chance to look at the answer (Re: [PATCH v1 0/8] Basic
> early_printk and smoke test implementation) of Andrew:
> https://lore.kernel.org/xen-devel/299d913c-8095-ad90-ea3b-d46ef74d4fdc@citrix.com/#t
> 
> I agree with his point regarding the usage of __has_include() to not
> produce empty headers stubs for RISCV and for future architectures too.

Sure, but as he said, that requires settling on a new toolchain baseline,
which is something that we've failed to come to any results for, for a
considerable number of years. Plus if we could get rid of this (then
optional) arch header altogether, it would imo be even better.

Jan

