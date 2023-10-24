Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE917D53F2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622027.969101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvILi-0003nf-0J; Tue, 24 Oct 2023 14:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622027.969101; Tue, 24 Oct 2023 14:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvILh-0003lH-Tf; Tue, 24 Oct 2023 14:25:37 +0000
Received: by outflank-mailman (input) for mailman id 622027;
 Tue, 24 Oct 2023 14:25:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvILg-0003lB-21
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:25:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe02::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30cb55b5-7279-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 16:25:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9894.eurprd04.prod.outlook.com (2603:10a6:20b:655::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Tue, 24 Oct
 2023 14:25:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 14:25:30 +0000
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
X-Inumbo-ID: 30cb55b5-7279-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+FkTU8H5sQR8nA5ZHvW8C8z+RZhe4fGpopK0ydVQ3HAbbOP+utTRTohi9TYLT8RYXiznAMNHdvEdtI9lvYvEY14BIwFUDl5nNyEuSxuMWYK8CxdOYC5ocKQqWwupnvW94wfT/GLv5jAUzHX8XUy3zkxfIhCz3cTAcarq959zyFEvwG0ixusLHbu8nsTtF23ZDkjSbnhheljCBvTA8sQcSo/tTBpWw+HwZZRlflnYV1mgyUTdnAo4PMzW9S3Y5hjOphbivc74WgH0ENuW9CZ4UNQoQ/gevvR2V0z0OLis+1slO1ntWSnSm+u8bhTAIOwVbolNAFX9oIPuUcMjaBQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qq57+vM2516dkts2mV9mBKjzUppZftqK/7jZddFf+gI=;
 b=mpYVyBUm5n1MwiMS1i/V4KBQyZqxCq/Bw11DSDS0oYgsUWqA26LcQWW+E+BNMUCrG5EqMTeheR51o9e7VDVtRi5+g0Vs/OaHgoqH0263TkgNazP04tE/GEgDNaFfXz0nS4txl5H8Fwr07EMojpmN/AiMnhyiTkm9B6p/xTnp2yAGSkXgldSUoFMJ0f+IJxb5Q83T5Mdw5urdwzd8Zybd0fPJCrKNl8eyHFNccvP4FgbQlNmob2UiXLDIKTr9dhdNYrdG9XewBEFUi0o8gbIlDxqM/OOcibfU6zFshyAmjG1xfEW6DvNVvFqDLORVXceK7N/MWKNQV5QmsuxuAYtmyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qq57+vM2516dkts2mV9mBKjzUppZftqK/7jZddFf+gI=;
 b=H97jeQ55Ln/iEm6k1Q3NmqwWt6dBRueITwTiOBP8wClvSi12hNHxmX2LKeyuKIOKLaZwf4BGxmbEFudiH2v6D5m1wBOOExfnyLVaa1J3z8+iza1x4D5ScWE26SqlSoFReLgkkNuOWKQEJI3LLMZzXZjZZP91fCSIm1u/w2zv2+RmxVYmIdrxI0CR6Tuc9EZ8kAi38zHV6Oy+9GY7BL6grPYg7KZB4JycbuNEqDElN0Ysr10PsMAOeNv1gpSqLFMT4wwJwfAqLjUAVJN4sA7htyidXdFNFVYbAXT7jB1rZzlL2/4NHol9/TIyoIixRprPrl7xU5IR/qDGuwZ6DyZaDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1fa350f-6f49-e2b1-0cda-dec99df415ae@suse.com>
Date: Tue, 24 Oct 2023 16:25:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com>
 <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com>
 <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
 <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com>
 <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop>
 <725f5193-c8d3-1bc8-cd62-2a2b1b5ecc01@suse.com>
 <alpine.DEB.2.22.394.2310171709310.965337@ubuntu-linux-20-04-desktop>
 <ead797ed-84cc-fb70-5259-7e11211d049e@suse.com>
 <alpine.DEB.2.22.394.2310181739270.965337@ubuntu-linux-20-04-desktop>
 <e642bc2a-cefa-4ee4-6394-3c10102e8164@suse.com>
 <alpine.DEB.2.22.394.2310190915590.1945130@ubuntu-linux-20-04-desktop>
 <6374f0f4-d58f-83ca-6eb3-d5a9fcbac525@suse.com>
 <alpine.DEB.2.22.394.2310201622160.2356865@ubuntu-linux-20-04-desktop>
 <36e6dd08-918c-9791-0dab-ca75d4b98d7e@suse.com>
 <alpine.DEB.2.22.394.2310231346370.3516@ubuntu-linux-20-04-desktop>
 <af4a86bc-40d3-4363-adc8-30981652cd2b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <af4a86bc-40d3-4363-adc8-30981652cd2b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9894:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a648bc4-7094-4b9b-421c-08dbd49d133b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hC5eNon6UFrIMcmUt4Eno0M5DxdFJ7uOht+HOQtV9KEHAg261d2aNDcyayQuxxMFEJZ/Y1L+5ECVs08GznCNINhTtnx2NcXOcpZhWyS2xBdT3AiEvGZGrVM5Ts0kLzTd5CgQqO7OcwX9RtFRbH4NoLQ2gUslWPRH7bh6eddXxa3hHFuF9/iAJMtr1YfZAi6bWRiHoxysKmhaoi6Kk1aLYaXOYMfkq7OIU1jm35ApjeeduJVydoe/0HpFm1KujJZm5LrGB2FywQTQdgZoOg9p48sZrpY6HR9cN9XIsVi1rowkGvGEuK40bOAvbcTkVRNd1DNcEnYQMcPeXxHp8nIm8mihwwJVqqwwOKdZ6Gl1K892fKC8KVgfMcqG3R120fXVBj+yYUj18kXXpel07DERFd+3hOdJeHZvoAEj5r0874fA4R5aV2eflUsOv0HLkQdd5Ohqo2a1yLBHpLrpzLYhVj2frm4MuIhVjjl+O0ZGjrvc3t82KvpvrY6bT5j2ee/4izH/7tV6pUjSec3jmgTZFYJS79Ug8vyzUp6IAaVchrulUf7xG9+v1tSvZK2QP7dcRW+uSXk4QfAS7VpjSNx4ZeAymNqts53FTkDWoucvE+z+/fN6lHywIGp2dlwle1eKHW1FfUyGNNfITZ7sgc2Ahw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39860400002)(346002)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(2616005)(6506007)(6512007)(38100700002)(26005)(53546011)(36756003)(66476007)(478600001)(66556008)(66946007)(6486002)(54906003)(31696002)(31686004)(86362001)(83380400001)(316002)(6916009)(8936002)(8676002)(4326008)(41300700001)(5660300002)(66899024)(7416002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2RseVVSbk5mY1pTNXh1bmxBWkNvUlByS2g1NzhJZUE4bnFhaHlhc3FvcUZq?=
 =?utf-8?B?Mit1RDFaMGsxdUhsNUU5bVJLSzJ2OTRLd0MwV0t5cUgxTURvVTRUMzFiSnFX?=
 =?utf-8?B?cFFGS2ZDQ0xPTmRjdUlPem5YTXFpb3JVTy9KbWpkZGZwZTdEZzB0MDFMNkVC?=
 =?utf-8?B?NUtDYVdzSjVEdUZCcm1DSWl1QWcrWFhTK2o0NkJuaHZvNURYQm56UE1BZEZo?=
 =?utf-8?B?VW5Ick51QzQrMUd4akVRZ0hFTGFxOUk2NlRiR0Nyc0pEanFHT3JockdndEJi?=
 =?utf-8?B?dTAwc3hhczIwc09DamdyRW82SzRMRWtwbkxSSHlyK3ZUcWxMSTMwVkFqRUp3?=
 =?utf-8?B?WllSMklaczBzMHlHTXM5UFVnVEhTN3dBYXNacHQzRU9JdzgrNnpSeGFNZXZp?=
 =?utf-8?B?cExPU0Zoc3Q2Vk5GcGhQQmhsdURqcXVrY3MyeW01YjJRWUJ6SGx1REx6cVJQ?=
 =?utf-8?B?QXFocGMyeDJtbStQSmFLai9Jc1Ayb0lldVR5a1VGMDZWTzJyU0w4THlSelk1?=
 =?utf-8?B?R3BKeFhmTjRmdExIZENzcUVHdmZla2ZxSUUvaDhPK3l5Tldyd1BMT3g5M2J3?=
 =?utf-8?B?b0Q0TGNZVTF6aEJaa09qODVVYk5nS1RidGJKVnVOdkJhOU9xSXVQL09MNEg2?=
 =?utf-8?B?S3ZaK1E5VzgrSFFkK2w0VVRNS1dzV0Njd0dqVU9GbTNyaXd6aHRzbVBvbm1X?=
 =?utf-8?B?Uml0aHp1UXdsMzloditmN1ZUS3prS0FLbWxROXFlQUJoZit3RWNRTXNZbkVq?=
 =?utf-8?B?bDFXQjBDZkd3YlY4dHgvU1QxbFp3ZTRBNldST1N5cEVabGlya1lmbDByb05Z?=
 =?utf-8?B?d2g4cnczZjVCc2ZBYlFVclZmS2dQbU8wRExjRDE1Rzh5SnIzcDZRQmFFeHdX?=
 =?utf-8?B?dlZ5UURNNDdoOTE2TS81Mkh3K0FPRjZmTHBpazdZOVVYemt1cUc1N01CM0ZB?=
 =?utf-8?B?UmdSb3MxdWRvQXFIT0lvK2JTdGZqVzd4QVRRWnp0KzhPNmx2bWhPWTRRYTBu?=
 =?utf-8?B?NDhLWGlVenNNeU54RFFObHQ2S2dZclZpTDErWmtUQ1AzMWRaK214WnQza1Fi?=
 =?utf-8?B?dC9vK1JjRU1LZkhmM1MwUTlXVjRjMkY3dWNyUmVJUWFleXZxZXlNL3FVa29k?=
 =?utf-8?B?YW9RMUpId2dNbmtHNTErNXBmTlU3OHlldElzYkhNck9Cdm02YmNZU2hGZUQy?=
 =?utf-8?B?NGJLN0JxRjJSYjR2VEIrR1lrTzlMUTdTbjExM1kxaU9DTU0rMVgyajFnazdy?=
 =?utf-8?B?RVZLQXpQamlObUZyaTR1S3VKeTBFVVRXdEU2TEVWZnBrNTJlZG5jSDMwb1RU?=
 =?utf-8?B?dHpuMEEvVUlEM3NOU0pJdjlWaGtHZXh3dWxwQnBleS9GeEFnNjM3bmJKN0k5?=
 =?utf-8?B?ME9wc1lvQkIrYVNaQXdwMSsveGNURVVacHI4QUhXUVNYUG10dnNYem81c1Vt?=
 =?utf-8?B?RS81aENVU0h0RTVEMjU4NWFqVlZSeG84Z2Vxd1p6UHFEWFZwQVJiMXV5cVVM?=
 =?utf-8?B?UXI4UGhWMmpzRTVLc1dEOUo0Z0Y5R1pROTlGTysrODNpV2dYZ1p2azJpMXor?=
 =?utf-8?B?Y2EzMEloY1pCdkF4bUxsN055SUlhYzk3RzUzUXd3SHJFVCtkZkZSWUw3WVhQ?=
 =?utf-8?B?QlQvbTdLaUM4TElJbmtzNlV1Ynd4Tjg5NnJ0Z0luR2dJWVVJSEpLN0ZLaUNs?=
 =?utf-8?B?TWMyTFVDUk5KbGVGbGZVYnY3bUJoUnpUWFdzbW1remIwYy82UFgxYUJ2Tnpu?=
 =?utf-8?B?bXpSWXlGZ29JUEpRemw4L21DbnpPYWIzMGNmVHBFd0xib3h6a1lQcGd5eVA5?=
 =?utf-8?B?WHV0YVZ0b3d5czJOK21VZkxJS1lma3IxZ05FNVdYdDQ0L1JUM3NjSFNnOU9N?=
 =?utf-8?B?cmMxdVg2dm4yVmtxaDBNVWhBNHJpVDk2OEczNU5FRk9RK2FtMkU3c2lVNHVR?=
 =?utf-8?B?VDhXZWN3VU1MalE2NmdUZ3AyMm1KRlB5eStuQkJ3bUdoNjNPbTJXd1l2bWZP?=
 =?utf-8?B?U2lOUVlmRDY5SU91ckQ1cmU1NytTTXNlakJyN1FlZVR1ZlhXMjQ0NGV0Ukxl?=
 =?utf-8?B?V0pWUytjdzF2aFFnK2g1dXZaQm1YVWtjUkh0aUdaMDVWdHN0OTAxQStiQm1C?=
 =?utf-8?Q?3VyaLI5mdxfoe9lfwKh3B0ybl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a648bc4-7094-4b9b-421c-08dbd49d133b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 14:25:30.2106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CWNOBzAHs9w3hnH6xjqdzK+DoFR4g880cK/8bPbgvaAFJtX1h+MwyKeAwuuCDONRiMyaI7CuERwOIqmuRMHog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9894

On 24.10.2023 15:31, Julien Grall wrote:
> Hi Stefano,
> 
> On 23/10/2023 21:47, Stefano Stabellini wrote:
>> On Mon, 23 Oct 2023, Jan Beulich wrote:
>>> On 21.10.2023 01:26, Stefano Stabellini wrote:
>>>> On Fri, 20 Oct 2023, Jan Beulich wrote:
>>>>> On 19.10.2023 18:19, Stefano Stabellini wrote:
>>>>>> On Thu, 19 Oct 2023, Jan Beulich wrote:
>>>>>>> On 19.10.2023 02:44, Stefano Stabellini wrote:
>>>>>>>> On Wed, 18 Oct 2023, Jan Beulich wrote:
>>>>>>>>> On 18.10.2023 02:48, Stefano Stabellini wrote:
>>>>>>>>>> On Mon, 16 Oct 2023, Jan Beulich wrote:
>>>>>>>>>>> On 29.09.2023 00:24, Stefano Stabellini wrote:
>>>>>>>>>>>> If it is not a MISRA requirement, then I think we should go for the path
>>>>>>>>>>>> of least resistance and try to make the smallest amount of changes
>>>>>>>>>>>> overall, which seems to be:
>>>>>>>>>>>
>>>>>>>>>>> ... "least resistance" won't gain us much, as hardly any guards don't
>>>>>>>>>>> start with an underscore.
>>>>>>>>>>>
>>>>>>>>>>>> - for xen/include/blah.h, __BLAH_H__
>>>>>>>>>>>> - for xen/arch/arm/asm/include/blah.h, __ASM_ARM_BLAH_H__
>>>>>>>>>>>> - for xen/arch/x86/asm/include/blah.h, it is far less consistent, maybe __ASM_X86_BLAH_H__ ?
>>>>>>>>>>>
>>>>>>>>>>> There are no headers in xen/include/. For (e.g.) xen/include/xen/ we
>>>>>>>>>>> may go with XEN_BLAH_H; whether ASM prefixes are needed I'm not sure;
>>>>>>>>>>> we could go with just ARM_BLAH_H and X86_BLAH_H?
>>>>>>>>>>>
>>>>>>>>>>> The primary question though is (imo) how to deal with private headers,
>>>>>>>>>>> such that the risk of name collisions is as small as possible.
>>>>>>>>>>
>>>>>>>>>> Looking at concrete examples under xen/include/xen:
>>>>>>>>>> xen/include/xen/mm.h __XEN_MM_H__
>>>>>>>>>> xen/include/xen/dm.h __XEN_DM_H__
>>>>>>>>>> xen/include/xen/hypfs.h __XEN_HYPFS_H__
>>>>>>>>>>
>>>>>>>>>> So I think we should do for consistency:
>>>>>>>>>> xen/include/xen/blah.h __XEN_BLAH_H__
>>>>>>>>>>
>>>>>>>>>> Even if we know the leading underscore are undesirable, in this case I
>>>>>>>>>> would prefer consistency.
>>>>>>>>>
>>>>>>>>> I'm kind of okay with that. FTAOD - here and below you mean to make this
>>>>>>>>> one explicit first exception from the "no new leading underscores" goal,
>>>>>>>>> for newly added headers?
>>>>>>>>
>>>>>>>> Yes. The reason is for consistency with the existing header files.
>>>>>>>>
>>>>>>>>
>>>>>>>>>> On the other hand looking at ARM examples:
>>>>>>>>>> xen/arch/arm/include/asm/traps.h __ASM_ARM_TRAPS__
>>>>>>>>>> xen/arch/arm/include/asm/time.h __ARM_TIME_H__
>>>>>>>>>> xen/arch/arm/include/asm/sysregs.h __ASM_ARM_SYSREGS_H
>>>>>>>>>> xen/arch/arm/include/asm/io.h _ASM_IO_H
>>>>>>>>>>
>>>>>>>>>> And also looking at x86 examples:
>>>>>>>>>> xen/arch/x86/include/asm/paging.h _XEN_PAGING_H
>>>>>>>>>> xen/arch/x86/include/asm/p2m.h _XEN_ASM_X86_P2M_H
>>>>>>>>>> xen/arch/x86/include/asm/io.h _ASM_IO_H
>>>>>>>>>>
>>>>>>>>>> Thet are very inconsistent.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> So for ARM and X86 headers I think we are free to pick anything we want,
>>>>>>>>>> including your suggested ARM_BLAH_H and X86_BLAH_H. Those are fine by
>>>>>>>>>> me.
>>>>>>>>>
>>>>>>>>> To be honest, I'd prefer a global underlying pattern, i.e. if common
>>>>>>>>> headers are "fine" to use leading underscores for guards, arch header
>>>>>>>>> should, too.
>>>>>>>>
>>>>>>>> I am OK with that too. We could go with:
>>>>>>>> __ASM_ARM_BLAH_H__
>>>>>>>> __ASM_X86_BLAH_H__
>>>>>>>>
>>>>>>>> I used "ASM" to make it easier to differentiate with the private headers
>>>>>>>> below. Also the version without "ASM" would work but it would only
>>>>>>>> differ with the private headers in terms of leading underscores. I
>>>>>>>> thought that also having "ASM" would help readability and help avoid
>>>>>>>> confusion.
>>>>>>>>
>>>>>>>>
>>>>>>>>>> For private headers such as:
>>>>>>>>>> xen/arch/arm/vuart.h __ARCH_ARM_VUART_H__
>>>>>>>>>> xen/arch/arm/decode.h __ARCH_ARM_DECODE_H_
>>>>>>>>>> xen/arch/x86/mm/p2m.h __ARCH_MM_P2M_H__
>>>>>>>>>> xen/arch/x86/hvm/viridian/private.h X86_HVM_VIRIDIAN_PRIVATE_H
>>>>>>>>>>
>>>>>>>>>> More similar but still inconsistent. I would go with ARCH_ARM_BLAH_H and
>>>>>>>>>> ARCH_X86_BLAH_H for new headers.
>>>>>>>>>
>>>>>>>>> I'm afraid I don't like this, as deeper paths would lead to unwieldy
>>>>>>>>> guard names. If we continue to use double-underscore prefixed names
>>>>>>>>> in common and arch headers, why don't we demand no leading underscores
>>>>>>>>> and no path-derived prefixes in private headers? That'll avoid any
>>>>>>>>> collisions between the two groups.
>>>>>>>>
>>>>>>>> OK, so for private headers:
>>>>>>>>
>>>>>>>> ARM_BLAH_H
>>>>>>>> X86_BLAH_H
>>>>>>>>
>>>>>>>> What that work for you?
>>>>>>>
>>>>>>> What are the ARM_ and X86_ prefixes supposed to indicate here? Or to ask
>>>>>>> differently, how would you see e.g. common/decompress.h's guard named?
>>>>>>
>>>>>> I meant that:
>>>>>>
>>>>>> xen/arch/arm/blah.h would use ARM_BLAH_H
>>>>>> xen/arch/x86/blah.h would use X86_BLAH_H
>>>>>>
>>>>>> You have a good question on something like xen/common/decompress.h and
>>>>>> xen/common/event_channel.h.  What do you think about:
>>>>>>
>>>>>> COMMON_BLAH_H, so specifically COMMON_DECOMPRESS_H
>>>>>>
>>>>>> otherwise:
>>>>>>
>>>>>> XEN_BLAH_H, so specifically XEN_DECOMPRESS_H
>>>>>>
>>>>>> I prefer COMMON_BLAH_H but I think both versions are OK.
>>>>>
>>>>> IOW you disagree with my earlier "... and no path-derived prefixes",
>>>>> and you prefer e.g. DRIVERS_PASSTHROUGH_VTD_DMAR_H as a consequence?
>>>>> FTAOD my earlier suggestion was simply based on the observation that
>>>>> the deeper the location of a header in the tree, the more unwieldy
>>>>> its guard name would end up being if path prefixes were to be used.
>>>>
>>>> I don't have a strong opinion on "path-derived prefixes". I prefer
>>>> consistency and easy-to-figure-out guidelines over shortness.
> 
> We adopted the MISRA Rule 5.4 which imposed us a limit (40 for Xen) on 
> the number of characters for macros. AFAIU, this would apply to guards.
> 
> In the example provided by Jan (DRIVERS_PASSTHROUGH_VTD_DMAR_H), this is 
> already 31 characters. So this is quite close to the limit.
> 
>>>>
>>>> The advantage of a path-derived prefix is that it is trivial to figure
>>>> out at first glance. If we can come up with another system that is also
>>>> easy then fine. Do you have a suggestion? If so, sorry I missed it.
>>>
>>> Well, I kind of implicitly suggested "no path derived prefixes for private
>>> headers", albeit realizing that there's a chance then of guards colliding.
>>> I can't think of a good scheme which would fit all goals (no collisions,
>>> uniformity, and not unduly long).
>>
>> Here I think we would benefit from a third opinion. Julien? Anyone?
> 
> Just to confirm, the opinion is only for private headers. You have an 
> agreement for the rest, is it correct?
> 
> If so, then I think we need to have shorter names for guard to avoid 
> hitting the 40 characters limit. I can't think of a way to have a common 
> scheme between private and common headers. So I would consider to have a 
> separate scheme.
> 
> I am not sure if you or Jan already proposed an alternative scheme.

Well, my suggestion was to derive from just the file name (no path
components) for them. But I pointed out that this may lead to collisions
when two or more private headers of the same name exist, and a CU ends
up wanting to include any two of them. Adding in the leaf-most path
component only might get us far enough to avoid collisions in practice,
while at the same time not resulting in overly long guard names.

Jan

