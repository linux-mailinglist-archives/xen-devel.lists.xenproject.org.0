Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916246335D7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 08:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446999.702847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxNgX-0003Fq-Ia; Tue, 22 Nov 2022 07:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446999.702847; Tue, 22 Nov 2022 07:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxNgX-0003DI-FK; Tue, 22 Nov 2022 07:27:13 +0000
Received: by outflank-mailman (input) for mailman id 446999;
 Tue, 22 Nov 2022 07:27:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oxNgW-0003DC-2A
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 07:27:12 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe12::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12d19627-6a37-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 08:27:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8564.eurprd04.prod.outlook.com (2603:10a6:20b:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Tue, 22 Nov
 2022 07:27:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 07:27:08 +0000
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
X-Inumbo-ID: 12d19627-6a37-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMvnq3Ko2Br6NrygAZPu2p3A1/8K+Fg+r72+7g5y3Y+w8lqLdsK5HINppYpqqxsQNcHXEEL3c1q5156JrGnFo/l0Rpa4TkDqI4cudaDhB73Pg8ct/SzfN0PIl/x562hnaSUqa+42o7daB4Aj1EphwGEHBfxDTPl7viM0uC08cwHHyNzsm86+8b92CU65He80I6erAPGdEfAnrfZkcXdi5A/ZQJ9sE1dpowCSTYqJAwSXxp7djtXNHsWjOE90HVLnCgFD3IJgBRQpCg4uIQsJewOPgPlEMTVI/XbVHLnKkzbsD1VAOtRCcxjxpcHuwXFg0/ZZsD9mTBMQyvc5Uzs5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bj+l0B2KzTpqvQj9Zw9Y2nhgWJnlS2JA2gaymQIwPDY=;
 b=N7WgZP9evAuoo7/7Nz5rLbSgkYgEVYnI+ggQZZBF5Wu8/kD1cAZL+FcUq3SVeHIKxqPjNb6IY24AcOSGA+TyJVYJvm6zymA/cyS9dKpfxpTScSaCu9ML/DiMiblvJENHusMAvV6TzeKEC/BbCvFdVB2/n16BNe15HISDzyR9oKi8K5peKNxZBBgPNehy7S8E5IPqcIbpMNeSXHUKRbsYNSnOZd8Rh3Rag74Xoy4DcLVTLGBsIO8TzBdxTKTKB8vFcAXJm9vapKRij1z9CEMubXpR4UO3GUEoxkJ3Niiz+cyktlDFMvEPINUWveGR0SFBwMQ7nlL9ntBqyYbFRu0Syg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj+l0B2KzTpqvQj9Zw9Y2nhgWJnlS2JA2gaymQIwPDY=;
 b=08MBm0Sv6IOql97qOdJ6KMTEnrtZ/1ta3186uoqxvZbbisXeap7pnl2v0664UuRfDCAwgny9LWaqh8ULAIEXLRnFuc4gjs9afJwi3XTDNW2NV8qeBXRe+utZTxwDJNCYX2tqEtJNf5gdlU//kwvcRvgH4I+pJwYVWlirCTM8fqBk+SExPXpyRS+IPcjzqon0WWws5Bz1mZLDUH1KOq57UIU71XC6ryIUFEKladoMxhmu68JC+OlkfCAlNOwmdh9QUDtCpRjWRbNB8b0V1J5gQFOdVhoVVsuxdPEp7SxJ5jxhvcAcbXwiE9UCqiVxKmuNmYqFgDey1sd2OqR96GIuyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44dfd2eb-9ef8-7254-70a1-e41177d6c9af@suse.com>
Date: Tue, 22 Nov 2022 08:27:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [xen-unstable test] 174896: regressions - trouble:
 broken/fail/pass
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <osstest-174896-mainreport@xen.org>
 <AS8PR08MB79912EE5EF2BA9A0F9527416920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79912EE5EF2BA9A0F9527416920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f246e6-55d9-4369-7b3c-08dacc5af651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UnWsLjDPejvBGAdl5qI5W3ji7qXcfapVIbiXOhm3Xrm5YaGdofboEizUWZEJq1B2zDNpjvOLMCp1c4lQ/SjT0HenNCw9tYn37bLGFQHIJYTgRqz0a3g095K0uMh73232eMh/uvR0X2NFAoQ0TvQaEZnnCpVY3DmVyaqp4M1AcJQl0gKhDn368ixK/N9yVNGXHUS4gdbhacpfYfl5JaSPfyK+w5XkC7u0JaeGUpACvnKM1QNeULp4cdQHuSzZbhCUqDnjxlxUF0qHxvxR8YMkbw7ZJI8IH/uq7scXRyAFRVgZcUjNwue0ltv8Ygiz29h8nAJSWMtdlZHmXx5y7HgMdgLO14oP8rwmTUcboNAMFB5uGSARigCn+GaeIHNuuj3vs6/5G0abD/cZWbN5l2rXbi6T5deNC3XRd+U/oMCNXDBjLevOmbpAUZNDr4Wv57Zpym6lI/YddWcFVR+aLNuWATHXe7JSDP7uGDJmpmKr1n7FYKyf72SP5Wc4u6wtkw3fB0kNBSdUCB6cKOdFBbGsCygku8kQ5UDI4YQ1/ccK+JeObGE2IDUYVF8BEPk7SU+VVA6V76jG3EuyM/jnk46GtMjQw6qDANuILWywWS4V/In7MxB31m4K1m7+92qMuBVC4Z09Lv2X6yA9uK5IsYOR28njLqVlu8qu/ty1vsIQeboE7FVsI83wWMQrqX6f+0y7POYxZ2Mqs4nT/TqDWE/Yntnx2iZ8prta9xlAPJycery+5ZmP852rbpCYn7Fq/rkuSzE0f7RZrG1cmqmRci5LJ1Jv7Q6yKfX9yuZhAUGknaU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199015)(31696002)(86362001)(31686004)(5660300002)(36756003)(6506007)(2616005)(66946007)(316002)(66476007)(66556008)(6512007)(8676002)(4326008)(6916009)(53546011)(26005)(54906003)(41300700001)(8936002)(83380400001)(186003)(966005)(478600001)(6486002)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDZnOVQ0eHNkUnlMV2FvTHI2TE83VlZCTHpsWkpBNWdsbmRCREgvc3hnL0lG?=
 =?utf-8?B?aXBxM1V0cVdWZ3RkNEQ0YWMzazRXRlkrd2JLMXk0bU5LQnp6ZUxIa0Jranc1?=
 =?utf-8?B?MEZkVVNzcWhFdkVuNFlRQkZ3Z3RkZjExYUNuQTgwSUQxbEFSYlc1eDVBa0tZ?=
 =?utf-8?B?MCsxWTNRc2xKV3AyR1dBcVR4M0xuUHplUi8ra05uS24vYU1MdWIvRlZjRVlx?=
 =?utf-8?B?QzBjTGd5YnZtbENNNmlpbFJYTWpyNTlDMEpxRExjYy93UGlCNUpQM3k1cEZQ?=
 =?utf-8?B?aGp2SVhmQ0VuQU5JRm9OQTYvdVBSWUxSOVhPZ29SbHA4ZzR5OTJzUlN3TW1F?=
 =?utf-8?B?d1d5c2pDMTZQRkQxTlRod1dYN1NCdXpQdDRpRFJvdUVJVkI3TnRqeHRYL2Vx?=
 =?utf-8?B?MXZzS2dIZTEvalpjSS9FQXpZRGliajFDSGYvQkE1VWtUQ1B3Q1JLRTYwTUNV?=
 =?utf-8?B?a0RzU1JtaDZjUDIxL3NaQXVHWjdMZWV4blFXc2gyWTFwVFZPaGJqb2FNcXVk?=
 =?utf-8?B?cStTaVNtZ1AvZHpDd0UzeVJhMFdOQ2NHb08vQXBsVnlBcEVtUWFWei9kVnI3?=
 =?utf-8?B?ejF3d0xIdGdZa1hKbTFTTm1OV010VGc0Wk1TUUtJUzVScWhLSjFqMm5lM05t?=
 =?utf-8?B?WnNodG96RG54QW50bnhuUTN6dFRLWTRtVTdNVllXZEhudHE4bnhiQVlXMEdk?=
 =?utf-8?B?ZnJFTkVOSm5oL3Y4MWZKRWxYY1Fvd2Q5K01EVjhuanRSTU93MVY2S2lqUmJC?=
 =?utf-8?B?WVBzMjlsM1ppVW1hOENXSVMzSHoxM25jdWVuTi8xYWRRU2FCYk4wSlV1NGl5?=
 =?utf-8?B?Vk5pVWZGcTVVRXBqbjloUDJ3S0JOYVNPNzBLYWY4S2tWdStaelZoVTBjT0Mv?=
 =?utf-8?B?cjJVVGFwM0xNMkluNmV6ZXpvNmpsNGlKcGJOTmxaMmxVRzdrZzVWdisyZjdR?=
 =?utf-8?B?WUhuN0I3Tmo3Mnh2SXg4VC9GZXhyeEw0ajNqRFpPWWtVMjdJL1YrWmFTNUhj?=
 =?utf-8?B?b2dIODdUQVgrS3NRbUphdEJQVDFMcmdoUXVzRytCOEs2bzdBUm5yanRUNjdR?=
 =?utf-8?B?WXdobkp6TnA0TDlHbWRuL3UyZGVqZEhZVTd3a0RLMENBTVZTRzlOTlN1dk1C?=
 =?utf-8?B?MlpDaGtBKzkyV2JNK0JCdDA0MlBONFFmaDNUVDZJblc0QnVab2QwVzFVNXpz?=
 =?utf-8?B?QkRSL0g5SjJMVFF3eHhqdC9iL3kyb3R4dU1Mc0F6VUVlRVg2VkRVb3EwV3VX?=
 =?utf-8?B?ZERYL3Jnem1vOWZwdmtKRVpZbm04dlBtT2NZUlN6YzhoYkNqNjBpRzZVR2x3?=
 =?utf-8?B?MHAxeU5xZC9neE1SZmE0SXNOcS9UTHhYWnpycTJ5VFBLMzBjMGpIb3NTMWVV?=
 =?utf-8?B?c1pLZVVQQnI1eUU3bENVZm9ZS0RwcjJpS0xTU0JKZDA3OHhTT0N4b2c5a3BR?=
 =?utf-8?B?S2VmeFhiN21HbnQrYThnYkJOTGYwR0FSVWhnL3gvbXpDVU5Yd3pkZFpjeWZj?=
 =?utf-8?B?M3k0UTQxOTU3TjI4OStCMDR6cTdsVHFINFRQREhFZnVjVmZsbVVwL3dOYnZS?=
 =?utf-8?B?a01sQ1BlU0plYVBTN2J3TWl0NnVaNTRSbE5IMHFSZm5IalhhNnlvY2dMaFBO?=
 =?utf-8?B?VytsVE8rRWlGZ0hNeC9wUGlXNkRnQ29LK2xaZjEvSiszdXJ2eDNDeU9NeFRk?=
 =?utf-8?B?c0NRNXlmYWlnY2JZSU5KSzJkTU5UenRLQkRqUjBpNXlTRXR0RmJXR0IzSnp4?=
 =?utf-8?B?Rmg2cThoQmpkZFA5S1VDWXFoWWNSdWVZeFdtdlQvMVp0eDFXcStTYXFzV0NO?=
 =?utf-8?B?ZmRrclpyNXFqbis5b1hYU003Vm1tV0lGK08zcjloSTJVRmJvMzdDSDFiYmEx?=
 =?utf-8?B?eHozNk9GWk5YV2FRWXlXQjlxMWx6a2hNN0lyTVZLUS9RZm1FOFQwOTcwSVBP?=
 =?utf-8?B?RHJRL2xLMTc2U1k3cDF1MmpFa1cyVEVic3FkY2p5cXNqaXhJZ3RSOUwyYjUr?=
 =?utf-8?B?T3dJK1JjOTlmYkRXSVE3MnRBakhZRFZHbHJKMUgydkZXczB1RkRqSGNoeTRN?=
 =?utf-8?B?MnJtemRrQVl6Z1RENWdMMnBUWWhLWldkOXFRMlNjWTY4ZEQxZTIzMVFaQy9J?=
 =?utf-8?Q?8xcAoZJVcc0WgunANfVuG7oN1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f246e6-55d9-4369-7b3c-08dacc5af651
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 07:27:07.9098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3k9EHP3+UgNEhbudwVNOw7KG/cV7zOQRWZGL3FKzPAfHEmdLh/2KlU6vS054nXTYvNqtsT9pXMR/hCkBfECZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8564

On 22.11.2022 05:40, Henry Wang wrote:
> Hi, 
> 
>> -----Original Message-----
>> Subject: [xen-unstable test] 174896: regressions - trouble: broken/fail/pass
>>
>> flight 174896 xen-unstable real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/174896/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  test-amd64-i386-xl-qemut-debianhvm-amd64    <job status>                broken
>>  test-amd64-i386-xl-qemut-debianhvm-amd64 5 host-install(5) broken REGR.
>> vs. 174797
>>  test-amd64-amd64-examine-bios  5 host-install          broken REGR. vs.
>> 174797
>>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install
>> fail REGR. vs. 174797
> 
> Seeing [1] [2] and [3], I guess there is still something wrong or it is just an OSSTest glitch?

The first three are certainly osstest / environment issues, which is
generally the case when a test's status is "broken". The 4th, as
already said in reply to flight 172089, is a test which sadly fails
every now and then. So let's hope for another flight and better luck.

Jan

> [1] http://logs.test-lab.xenproject.org/osstest/logs/174896/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm/sabro1---var-log-xen-osstest-serial-debianhvm.guest.osstest.log
> 
> [2] http://logs.test-lab.xenproject.org/osstest/logs/174896/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm/serial-sabro1.log.0
> 
> [3] http://logs.test-lab.xenproject.org/osstest/logs/174896/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm/serial-sabro1.log
> 
> Kind regards,
> Henry


