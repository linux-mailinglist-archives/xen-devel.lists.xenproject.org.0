Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D076FB5D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 09:50:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576943.903662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpZR-0002xc-Hx; Fri, 04 Aug 2023 07:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576943.903662; Fri, 04 Aug 2023 07:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpZR-0002w0-EH; Fri, 04 Aug 2023 07:50:01 +0000
Received: by outflank-mailman (input) for mailman id 576943;
 Fri, 04 Aug 2023 07:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRpZQ-0002vu-8X
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 07:50:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8285ab8f-329b-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 09:49:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7244.eurprd04.prod.outlook.com (2603:10a6:102:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 07:49:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 07:49:56 +0000
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
X-Inumbo-ID: 8285ab8f-329b-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A//hTqTS05Uf9mDHd8lfOgmr+xNEhNXhVuejcvsPaytZb4iBwSdy7TO93Gp3XwCjHwaEahtsFx5B2f9qZcEx/Iawnrnt6hlL2ZABwC8MMYWjbmGaIS0oy+2tvZJE9xwdMM5WxBCvwh0p+zbyFjL2nW8Z+JyJYV5/pbuf9614RdYLe8j/9dlEmABxyrZ1gdrDxi5lrNVCmLCnNWNSZPYFyXF0DoSxgHbRPrlnpjKjMUOB3W5QD/U0cd+ZJOUMu0SrtmJNZGaHc1ZKkZPkUq4/fqe/fFkTK8kyuVToTaUNuZMJHShqEUQyWlepvE4IMD7IvlJPED5RJ1pkPe/d6HO6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pK8Vhq387biROCAprJ3LZiRopB/zy2Jlz6LEwBX6jI0=;
 b=hrplvX8R/BfPxx62uXBYLugDBezfbRdrlwVkWRqrdCJBdEdmozPnrT6/fcHLvk8MheZv41rDD6aSn7Pl2BuUXN2CUoy5mD+zdrUvhfyyxEdLm0BiDa35diQ488ZKFy4nqcBp5/MOnRGce6I3dSNV5cV5vhr22aUWq4ZPq+SUidDTFw6r8ldLphhWVjO9zPEvJdxwaJ+82fPl3qhmgiPRqVyp4Hlxmh32eL1EisTQhMWWO4BZ3Dkhf9Jrn0LnSNPUMlcALJ++iLQdq6YySIND8YSWePh+O74686DSUw5y3de+bM/1h/j56SOwR8tiiKAQpt6U+Nxe8l2c9nqt5l023Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pK8Vhq387biROCAprJ3LZiRopB/zy2Jlz6LEwBX6jI0=;
 b=FJ1u4+GFAmVvFDVTbm5pAYjLmks3zpcniO2ToFxRGdBgFU44wTtedSgF19DuluJzLqK1gFm8lPF8kRa8jRorWmY2Puvia9aXpsfcdpKwc/dFc3XPZ+XmOrc9wuj0ntS7Jgmgm2z5+D4yYTDGwJ81qC7H3/pEjyU9w10UHi7bj7/TaZFHciigdwTjmrwqvFTpPxBg4UkRd+zdislEhYTH/clZp/5ib/9KEhaGeeIFaMpk7nccsvNqFzzAT3bvOhhNCt5q2xK+anwy1Goc/AhN4hE3J3eI7acMvH4MmL3BTH1EMRcQrQdWEhgqTc7uY0m/qxaeuri3Ou//KPEAoB5Ieg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ded224f-0b8b-90fe-367a-91762d1f25d5@suse.com>
Date: Fri, 4 Aug 2023 09:49:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] console: generalize the ability for domU access
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801160608.19219-1-dpsmith@apertussolutions.com>
 <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com>
 <d90cc238-87ef-d0d0-b06f-58e89d24eaca@apertussolutions.com>
 <01a80d4c-f19b-98ec-805e-e648e752d6b1@suse.com>
 <e1554020-a605-8df2-619a-eda86d86c50a@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e1554020-a605-8df2-619a-eda86d86c50a@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: a43d3003-1292-49e3-1da6-08db94bf650b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ea7pMgCjE2NCXlzxnS/6iH3WFvLNA9picOII2rmtW/r5/01vAFsMtVBx0CTGwbJ+LEClTf3NSQxii8xsEiXYuK/MnZDgpSyeeWe5aqMBzX9pAxzCxtIa1tLsOESfTPDy9GUhdWHQJarqypJ1gAgxIgEbZ+1vtYi+vgmJJliNCLbY4RVGUR71vuz10VU76S16KM3cGXyRSHPeZuT4sxuruWSSlEQZSnAgodRbPHucQhRRV9L9X3cE7ay4jLBa4L1OAxPvcXmfU98BbrnhZOu2fz+CzqrcaLWYulVQDoe1lUbHdHtClHdZ8xWMPe2fT1IIGG6028cXmbOnC4aSzHbhiOjXGR/HW3ABka8tWeVK4r9RJ/GhoBquCoUhvRVG6YSxcqrCbRnYtaJmzts/UMwpS5sYjw5UdVZkEytxqotVxJDyaebEZmsDldVRNjgjzCkIilmErJHxeYJ0phU1d8aHLgeGz9jwigopauAzd8m56ah1UIEbtQMwzHnPxrx/SCvETSA84ryWnqa4L99uDSWZ9FaOiZnkq9nMQS3lUtpiQ/hms/3tCxL1htwpfwFgFnHT34Kr5fya4ITu8xBgS2MndokFhZJgQKtl0vaIUOJ02pAh1ob5j35IesfX4NJw4y9ZjXyTF9dFy+jU2kmJF9O0mg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(39860400002)(396003)(366004)(186006)(451199021)(1800799003)(66476007)(66946007)(66556008)(4326008)(6916009)(2906002)(38100700002)(2616005)(53546011)(6506007)(7416002)(83380400001)(54906003)(86362001)(6512007)(31696002)(26005)(478600001)(36756003)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEl2ZGJWSWdGa2U0QWI1VlM5THZYN1p5bjdMVlgyZ0IzUUxXOWtRelZyRXhI?=
 =?utf-8?B?SmZKU24zOTI5aGJTRkdqUDJGUDFheW01SFowSXVITlpuVTRPdXFaWDd3NHdF?=
 =?utf-8?B?bWYvcG5pd29oU2FOdnJTSUkyR0dZbW5KbTdxVG1JTFk2OUpMam9iTnpJQ1E2?=
 =?utf-8?B?VDRYUHZqT1FzQVFhaVVGR1pyL0RLKzQ1V2RoWTZERmsxS01RbHhZRkhmbkJO?=
 =?utf-8?B?ZE5yU0FnckRiQ3RIVXByTlphM0NnVnc2cWJUdkVHbXZLUmlXZGhuSEVscTZa?=
 =?utf-8?B?UFVLUnFiS3JpNFZjRkxwbTJmRzBlRWxiMmVoblRrM0NVSUtxRk14TWJjdWlm?=
 =?utf-8?B?T3ZiTkNacjZkZjJjSTc0R3Z3MlZPSms5TXZwL2l6QTJVcld4ZGxXaEZhV0hl?=
 =?utf-8?B?bjB4RUxpZC9lY2NlUG5qeFczTlduTDNUZ2tDdWVuS2lsQi96Rkl6bVJMMFZv?=
 =?utf-8?B?Y2VEcFBDUVFKdklyZGx5UjVIZnBaVkFaNFRNcXR4QVhUSUc2RUlKWGVsOU4r?=
 =?utf-8?B?OStEVFJ0a1pWV2RaZnNDRTZLYXZhVzZKV2tCTnRUbjhkUXlnU0tYbVkwbmFY?=
 =?utf-8?B?ZkFiNmprRjdoL1E1S0thMnZDcGlReDdHdEhEemt3SWdHcU9kdGRNV0xKK1JT?=
 =?utf-8?B?VW52ZW9TdE54S1ZTVmIva01VNk5oQW9wWHpnVk93S01oRVBUUEZ2V3VsYXpF?=
 =?utf-8?B?dDdXMEpZL2JodjdOYks4Y3NlTFFTUnllRWorY3NSZkx0ZHBBcTNhd0ZHdTEx?=
 =?utf-8?B?c0ZGZ2F2U2wxaG1vTzErb1JlTHRFQmdqK3dFb2NiVkl5V3dESmE5Znp6eUNs?=
 =?utf-8?B?VWZ5QmNRZU9HT2JkUm96ekFsc3REeEE4bnNISk5Sd2ZIQUpKZEpaWTRLaWl5?=
 =?utf-8?B?WlJOeWYySkFUNXNQUUdsZ3Z0bjMzeWFTc1Y2RkIvNnZEdXYvWi9yaGpjM2Vq?=
 =?utf-8?B?L2ZrVFMvM0twOWNxVC94ZTFIK3YwNjVMd1pYUWZEQkJCa1pwRXloOG92K2ZP?=
 =?utf-8?B?cklKNnpuaFVWbWV6R0JrbDlMUGdGMkVuZGdlZFF4cXhUUWNOeXlJOWdMdTQ5?=
 =?utf-8?B?ZG1ra2hPOUdaL2RvVlFvU0VENnN1RkgvRWE0TGQwakJsbkZHNTBqbFRSWGE1?=
 =?utf-8?B?Vy8xSTVuY2x2R1NUNjRkSXkrNkZGT3FuVysvMmp3aGFmc1ErMlEyU3pnTVcr?=
 =?utf-8?B?eTN4T3E5QWwwZXF4S2RaZ296WGVyZU8zSDJoajRRM3FscEZkKzlCaVp3NVNp?=
 =?utf-8?B?Sm1sd0FvNnR4UkFZWXZ6Z2hhaTlmUS9TYWdEc1psMkl5V2YwamMwc1EzVElH?=
 =?utf-8?B?N2hOWThtTkF2Ky9VZVhCSUUyWlo0Z1BzdmhZWms4RHJYSU04MUpBTEt6cFBr?=
 =?utf-8?B?cjZxaUozcTNyRW8xRUcrTy81TzlISjJaRW1yT2RPdHlBL0pJUW1wVlMrdTRU?=
 =?utf-8?B?ZUNaN3NrdzVTaWg2WWdGYThwdnNGRmhJTkVpQ1ZvcVNvRTNKNTV3Z1V0Sllu?=
 =?utf-8?B?TEZpeVVSNkRKRWFJSjdjbnk0YitxZlNDVUZRMkVwRUc5dFF5V3JsK2hwNStO?=
 =?utf-8?B?aDFBSlhySS91UWpMSUI1VWRQTTZ4V3p6Z3pmaXpEQmdHYTFZbXNVdkVMTkwr?=
 =?utf-8?B?YXM4Y3NZVkV5OTdPT3pFRGUvM2VIS1NYVGxyNnRma1FyRE9FdFlWd3lLakYx?=
 =?utf-8?B?MzhQdWdCeTZKNlBycXdhaG0yUTZRR0ZtWmx6dkU1WDlvQkl0eEo0RW1RS2Iz?=
 =?utf-8?B?UXdnT0xld3JycTVacDFQdXFNWXNKOGxoNjN0Z2FUem5hQUVSV0c0RFkyNmdY?=
 =?utf-8?B?WVoyOG5BMjZ4c1NERllVWmlZWjhoczQ0NmZ3bGwvcVRBekoxbTJpNDVrWVkw?=
 =?utf-8?B?ZjVGNGg5VE9RUjRHNzJHUkw1eGFlYW9ZWlU3VlJxVG9GSEo0eUJBa3ZTRmRy?=
 =?utf-8?B?NWJzSS95WXdHM1NvV2ZBbWNMS09uSW0xVExlUzJVTUdOTjZKdk44UXVRYkMx?=
 =?utf-8?B?eUVncEZZOVhrVmVMRk94SUdNY3UvdnJ6bDR3NXBoYnlRNHBESlBWT0xERkZB?=
 =?utf-8?B?VHVsQW9uQlhMeElnUXV3YTRHQlUxUzFQMS9BSVZSeEYvWE5TdGh0amwrdXVQ?=
 =?utf-8?Q?j71LrMM8qGAB4b8b3p/s47LAZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43d3003-1292-49e3-1da6-08db94bf650b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 07:49:55.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XxomRD1fGud9DSoQhXw1juIoYztd1vgaiB4PBSZ4mjq5jQjvBauFHa0ipuCQfUHiK2km/fWScdwBazJwcbBiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7244

On 03.08.2023 18:31, Daniel P. Smith wrote:
> On 8/3/23 11:56, Jan Beulich wrote:
>> On 03.08.2023 14:56, Daniel P. Smith wrote:
>>> On 8/2/23 07:01, Jan Beulich wrote:
>>>> On 01.08.2023 18:06, Daniel P. Smith wrote:
>>>>> +        {
>>>>> +            for_each_domain(next)
>>>>
>>>> What guarantees that the list won't change behind your back? You don't
>>>> hold domlist_read_lock here afaict. It might be that you're safe because
>>>> that lock is an RCU one and this function is only invoked at init time
>>>> or from some form of interrupt handler. But that's far from obvious and
>>>> will hence need both properly confirming and stating in a comment. (It
>>>> is actually this concern, iirc, which so far had us avoid iterating the
>>>> domain list here.)
>>>
>>> It is better to error on the side of caution instead of assuming this
>>> will always be invoked in a safe manner. I will add a read lock for the
>>> domain list.
>>
>> I'm not firm enough in RCU to be certain whether acquiring that lock is
>> permissible here.
> 
> Same and I took your statements to suggest that I should.

Actually I wasn't paying close enough attention here: The code already
uses rcu_lock_domain_by_id(), which acquires domlist_read_lock.

Jan

