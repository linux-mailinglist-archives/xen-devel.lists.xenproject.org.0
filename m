Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920E731B3D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 16:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549626.858255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9nsz-0007Y0-S5; Thu, 15 Jun 2023 14:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549626.858255; Thu, 15 Jun 2023 14:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9nsz-0007Vw-OD; Thu, 15 Jun 2023 14:23:41 +0000
Received: by outflank-mailman (input) for mailman id 549626;
 Thu, 15 Jun 2023 14:23:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9nsy-0007Vq-6o
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 14:23:40 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe02::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37ee8d91-0b88-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 16:23:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8296.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 14:23:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 14:23:34 +0000
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
X-Inumbo-ID: 37ee8d91-0b88-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1KlOs1agyi9TepISsnyyNIKxtJN55wjTyTT9k59RIvDw8NOhx/d+c8yekdSNlBahmfyGjDZK5Hdiff7nn8aLe205knbdWH/JLq7fjz40AcEWpszwMwjfnF4CEaD4L1f19IceSUNmpyQ5zh/mDoiqaYAZSk/CViqUkN2683+OkFH+0B4y/1dduzNmByz4HSHZRYhmDcawCR/a78X0SUyyLmq5oKqeqfvP4M7BeSy33sPJhsuhQN3HqE0bnD3xjZ3fpzOprfCiJtuFzsmaNFacp7cp0prIswWHeNN4aHdwwIPptjQlg6+U71SqcbLmNxEi3oDWzhs8oeQph60PDQ9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLgDniDbZ/fM4TgGEeUzyNPpmQxp8widl1D8rqaW0ow=;
 b=hEPvfSJBMHuZ+cUVRjg15p8xpO244fg47F35w05eEKCQN3xKrVx3AJlRiJ7GlxEIh/1WRHHtPyXVh88ELC5eqeErkHh3uXJ/nu3Lixj/5m6j9mHkonK89yo5bBwCG7KJ+mMUJfXHOQ/+ZyjPhZYjVo67SCOGIAk/gMWvqqYj44BhyngaOiIZMVOfFZN9hTIZ85dgXRLFLGYzILDtGp8SLqkCkXv7CsgrECPm0SfvUWuu5ufZvOP3ZsF8Lvhx3thQNNFticfETjyqD2ylq6VESj+EDk2bZtcdIyygHIcsfFdwzHHoUMe/vCeHubVGbOO/Lkv9wy+st4NUI+7WIJ0Vhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLgDniDbZ/fM4TgGEeUzyNPpmQxp8widl1D8rqaW0ow=;
 b=QH6vbbgFNjUENvbWq8akP3O5PUUbLwLepZ+mXe56D3aqmMvSDBL8HwWNrIT3yCukbWLzN5b684rZV5ECjUjGbtxLZf4VZqK4Y5isIkTPsc56iB/pTF3x4wNYePyLeXdyQgMTQeXaiEnetc5JgpkltXc+/6JJhMTJM0D7OuISzBbJ8iD9bP8sp108iaMk/UUcCmFw/J0tI2Xybr8RQD/cZt2AfVqO6P2NrAMBv3gOhrX52uXmlwnYX+bmc33Y2TJhFQoJVX0RsU0Aj5mvKM4+/6LVlxeA6eZAL9iHo7pb7qwlug16Qlq4U+ZbgR9rW9dia0uL+jEBGodd8AZZpt2KAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d4be98a-ae27-0cd9-d72e-8557d2d3a319@suse.com>
Date: Thu, 15 Jun 2023 16:23:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 01/15] cpufreq: Allow restricting to internal governors
 only
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-2-jandryuk@gmail.com>
 <71c1d8cd-8777-e913-5a9d-93696dad3740@suse.com>
 <CAKf6xpsWrOer0Unq3oaOs5+AtPOyGvWJqUYkN+h_2FAn_KuTkg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpsWrOer0Unq3oaOs5+AtPOyGvWJqUYkN+h_2FAn_KuTkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b64d909-eb12-4d1d-dc05-08db6dac1a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CLh0/tfuzc1iKcYM0DEzfoRwsLplotDLiCu694MEaZRCtiviDWVBOej2BzmY6daGGn0LhoVNFJohMkUXOdsDG8NeBGMwu4Qu4uuWSGnb9WNVuAIWo3wOP7DhlsKvLZzZ3zDWB0653I4C77GlsC5XMOgWrW1qE4RvBZx1F3StGgIm4l5LaW3DTlME2/t+2AYV/ZRBNPZwmmXBT1l/1T5KZwUIS4ydAh8WNtxiNCbaRn/ZrKV5Vpne/5I2agaqTM8KxzDiWX6g1djNYEBREqc5/0S0G5K9dnUc1QrxAI/Q6S85stCHMqYxVgPkDJnbefqZg0aalpG81K+zPC6ji441kSALUKjETSaP3YN+vcSVz2xuz4ga2SMagtk2lO4bF+96dVrEBa+ykWrCX4dffMbFrCbWOW60gqCiHC9Q+gb3pjN5uXMP5WFhmFPOPHDb1ZxfNIX+REOqGnaUFeTmS75wSZ+OLC8UFyxHTTLIPvJ33fjNxJY/QStiXJLT2fhOnCvrWEFVrf0jRe+Rvd2QWJ6ufsGcRdKtgV4yKUSDiKrYO84HnWDhEn5nwgAJOr4mbSScMUeAYK4psUpkzg/DgCOFJgLyRtEi7aSQNQ4/1DVJpKcbhCiaBtN5zxENYC7TJHqEeXy1WKpaxsUtVLxfjCuQHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199021)(53546011)(6506007)(36756003)(26005)(6512007)(186003)(478600001)(6486002)(2906002)(316002)(8936002)(41300700001)(31696002)(86362001)(31686004)(38100700002)(5660300002)(8676002)(83380400001)(2616005)(6916009)(4326008)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE9LeFV5eTgvQjRoYi9mdXlEMGFhWUpSaUpUNkEvaDlPMlBjMUJDdi9mb0Rl?=
 =?utf-8?B?R21qS096clBIQm0zakFIbE9UNEljWWdFODJDOGl0NDN5Wm1renMxMVhLWVRS?=
 =?utf-8?B?QnBWL0xJeU9CQjM2RUg3Rm1iSHQ0T2NEZDJyTWNjaGNadmhoQVdhR2FYajZT?=
 =?utf-8?B?VnZ1TGlwcG1HRXVHNnkvVjh4dHBpSGh3dklRL2pvUG90bHI0aVVqeDZDT2pP?=
 =?utf-8?B?ejVYQ3ZHNEpXZDFESkZWMnJHOWYrM0NQSjZJMlZOd3ZSM0FoYXg0WUtNNEZ1?=
 =?utf-8?B?eEc3c1ZHUGFrdXBaWGJidG84RVg3OXpNUmw3YjJUSFNmZzJRekhrakFiTWFV?=
 =?utf-8?B?citVMGFUU2piOU55TnVpZFExRkhhdTNCY0xibWUzeGh4Mm0zRnhrUy93Ump0?=
 =?utf-8?B?NnFXK2N3S3A3VDlCTklVTk0ra0RoaysyYS9pUWtROFlhNXlTRGNrSDcwcFN0?=
 =?utf-8?B?U0crZGxVQVJmMWxRUG1zUThqdmo3eEs4bngzSndEMVpud3dPaUdaSmFzendt?=
 =?utf-8?B?Y3pmajgwZ2pyZ1djNnN2S0tRYVdtc0RIVnJrcERoZjluRW5kRW9xMGhBYTRJ?=
 =?utf-8?B?WE11VXhWOW44UTNBeW9MYU5zUmVVYXlYVW04TkxCeDJSUnpKVXdaejhFM0tu?=
 =?utf-8?B?Zk5ONDJyOFp1U0lBcWZQMzFGbnZLeEQxbzRLMHhWdmhxZFNIdGQ2aWlObkI0?=
 =?utf-8?B?bW4zOEszK0p1UlZHS3V4OGR5MkpqVDBZYkMxQmVTSXorcXRpZXF1Ym5qRXYv?=
 =?utf-8?B?NERDdllIVjJUMFJFRUcxZVZZazN1ZXFqWDJhSWZ6ekNSOXB6MmlDQXRWRHVm?=
 =?utf-8?B?aHQwZUV0bmFiTnVaQk5zTXFpTzVpbXNTVWllUkE2QVZSUVdVVWVROHFHUm1C?=
 =?utf-8?B?bHVPelc0T2xvZEZndCt2Vm5tVGxpbE9id2pieUlOWEZReUxmNnZhZjBDbEZp?=
 =?utf-8?B?d0lGeXZXQzUvZ2p3T0w3TXl6REhDSUd1RlJjMG02OVppem1SRVZYTW9ZbjFW?=
 =?utf-8?B?MEhKWnJTdDd2Y25Idkw5Ri92eWZNZHRuZ3VEY3krcVY5c3hCT2s0L1VVa0JB?=
 =?utf-8?B?MzJKcjRLcitVZHJWOGdIWFVhczE2TUh6WGZCWGdJOWxxc2NqUXk1ZUZuZk15?=
 =?utf-8?B?akFBczVZa2IwWWJGaUI5UTdyaUQ5cjJvTlVWaFFIV0RGaFkxczVqbUxiOXl2?=
 =?utf-8?B?MFI5Y3ZBa1VqaVlIeWJ5bCtzblQ2bVVmdnZkVm0rTXh2bzZ3UlFsaGZSZ05w?=
 =?utf-8?B?V0RqT3oyNzI1ays0ZUUvUTZQMHUrVGpDKzYwV1FPcEJFTXQxZitDVmx6WnlJ?=
 =?utf-8?B?SG1vb3ovV1RGQUg2Ty9rS1EyMjNlMlQxTDBEbGowNGpuMS9CTTJxZyt3eC9m?=
 =?utf-8?B?dTVqdXprbDVKYUxVclVnczJ5d1RpQVVZMnRQU2tnSndFcCt4aVk0UFB2aC9s?=
 =?utf-8?B?dHVuT2xCblNpc3ZubXZsbHhCb0hVNXVRZkZDdTdLUTZ2YnA4djBmT1JiYitP?=
 =?utf-8?B?bXJ2R0dic3Jxb1VxRUtLUHc5WEtwUkc5VlBTdGpPc2JFRG9Sc2I1Z3IwYjl6?=
 =?utf-8?B?SVdFWU1TajFJWkU3SEtLYVBFb3Z4SzdQTXJDY3h3QVNVU3VNS2ZjYnVybmh3?=
 =?utf-8?B?VTRqdUJvWUxEclVqVG1zemQ4ZFZpb3FnWHNYZ1BSMHVWUVpScnF3ZFVTMkhZ?=
 =?utf-8?B?MW1ZdVgwZ2Qxbnd2c3ROelQxbkljaHhhVnJWRzVEOUFkS1FRcWVFWTlzMlRL?=
 =?utf-8?B?TnhkQmROZW9NMld5RGpvNXFGVTRSZ3BBUDNTaVJTQ2JocmRlNFJQV0pJWU96?=
 =?utf-8?B?Vk8vMzRpbS92K1ZEdmI0QWVaS0xyVThiSHd3Vm51Z3AyeDdNMkhTLzVhaHdY?=
 =?utf-8?B?QXRtdjVhend5cVRDRFE4OHBWa3pva3RkR2Q0Q1QwenpPL01BTzJ4emtKZm40?=
 =?utf-8?B?Mm1ZUlliVW5QZHJSUUN1RzVpRWh3RDY2bGpxRENnbC8rN0pvTnpMRDA2Y2J3?=
 =?utf-8?B?NGk2Zkh4NzlJc2xsbzJ5cEErSERlcEM0MHRKcTFTMW00VkVzVTZpaTlJUldI?=
 =?utf-8?B?Ylo5aFdqdnVzN0JyaFZrbDU0bFZ6aFlQTkQzYXBHVHZkUjdUYklidkRoVXJ0?=
 =?utf-8?Q?bBBjJ01giarmDRNCvJAibBvBs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b64d909-eb12-4d1d-dc05-08db6dac1a46
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 14:23:34.7025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/qWw3hA8BXX0o2gTekBl35H3SdzbUg/RlwF+L+Tdx2IWFUv+osFaXV54XxU7xmyLTRJzMIXyUYqpYreLVYmzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8296

On 15.06.2023 16:04, Jason Andryuk wrote:
> On Thu, Jun 15, 2023 at 9:21 AM Jan Beulich <jbeulich@suse.com> wrote:
>> Yet then I find this approach a little odd anyway. I think the
>> registration attempts would better be suppressed, thus also not
>> resulting in (apparently) failed init-calls. Especially for the
>> userspace governor this would then also mean / allow to avoid
>> registering of the CPU notifier.
> 
> So are you suggesting that each caller check cpufreq_governor_internal
> and potentially skip calling cpufreq_register_governor()?  e.g. the
> start of cpufreq_gov_userspace_init() would gain:
> 
>     if (cpufreq_governor_internal)
>         return 0
> 
> ?

Right.

> I put the check in cpufreq_register_governor() since then it is
> handled in a single place instead of being spread around.

I understand this was the goal, but I'm still wondering why we would
try registration we know will fail. Plus, as said and even if benign
right now, I'm not happy to see initcall failures being introduced.

> To leave the check in cpufreq_register_governor(),
> cpufreq_gov_userspace_init() could be rearranged to call
> cpufreq_register_governor() first and only call
> register_cpu_notifier() on success?

Might be an option, but would address only part of my concerns.

> Or do you want the whole governor registration to be re-worked to be
> more explicit?  Remove initcalls and have governors registered
> according to the cpufreq driver?

No, I'm not after any extensive re-work.

Jan

