Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E263674AB47
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 08:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560184.875890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfDI-0003Qy-RA; Fri, 07 Jul 2023 06:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560184.875890; Fri, 07 Jul 2023 06:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfDI-0003Nn-ON; Fri, 07 Jul 2023 06:45:08 +0000
Received: by outflank-mailman (input) for mailman id 560184;
 Fri, 07 Jul 2023 06:45:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHfDH-0003Mv-Fx
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 06:45:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceeded80-1c91-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 08:45:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8335.eurprd04.prod.outlook.com (2603:10a6:102:1c2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 06:44:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 06:44:35 +0000
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
X-Inumbo-ID: ceeded80-1c91-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BipA2udUgxs7lHWnrnpbhY/7CclQICXkmKIZ0r+k8Kje+cE2o5qsmQcJ93YrgsiJPLHWmGcOGHAgcKy+jm/XK17wIOhGnainXEA0vYXmWt+s5IvQijgnAy6/lzbqB3/TgLOX0rPrSt77MkGKclPo+vis+79PpbdO2cy4iHQOBiZG1VgXLL1y2MZcxNp02CMeN52wuDl2zSj+dQz5cnXKfKpeMSMSoWd3+jXKkm6lGS4wmGFtzSORTeZ6Q8XFPEnW919z0IUoo2L13BglSx9ZktmZLk7qbKKPcLq7pmIJloK6lAqhG+8py7TzCVCfYX6GQwsYf84eZTMqKZhvosFvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZ79/PeRiZAXUpkz5BPKVLnJPRfqrgVQQWfTaOLvyz8=;
 b=HpQc0Etj/qt12e02rMUFh8bD8qR93v0zKjebSFrPvWgDe/qWaYOc1MIFMvMTyAWEr98l8unSElZjYonU2F2RgmcFds1d3l/RFAc/yHAXw/jf6/75vPHqRdTFssdAzdEdbXzpuRQSTeCQBeCBnLTXbrwk+ieVZsfxT2dyU48XvMs5cYChEAPR9uN1HzslW8SVDnBySOxM8xJKwAteac+GvJ4vfBlXT0rZRwYGPEANDDyOM5pzVPU6rjgklOzbd1HGMR4ySRPMDCERuDKrf40MoTIsylnG/f1NobvIJMQRmEJeMbKCiyQL2cc4hMpUI6D9YQ+UpESLKLo7ZQcEn6ZoHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZ79/PeRiZAXUpkz5BPKVLnJPRfqrgVQQWfTaOLvyz8=;
 b=BV05FL65gMIUnEia4b02Zk8ComtkufVU2oUvbFkAEARGkSEVeFrbo7IIzwY9lxQJiyTEZkMy9UAdbXLcSQPVjNoypDRzHFENEQltE/haM7vQU4e9fQWKYDTKxjDdvTXtJn6HCbGwnJI5IX0/TlYP2UVtgs1Pbz7jo561GkR5LYvzrG/PvSmGJoD3U8npxBGPdRW9+z3qw/cHPVGNlfbZa5oZqbO3EgHFOusF2xQUArOGnebazHjd3vvwhaOrvuTQkNcIZnz2H+th/9KX3o0ZrNQe1irpmtd6vlKICNUwQPP9g/B/glJ/WmT7AlinYxZeqWqYmZR7IbHmZyLgC8IGxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2eb9324-82d6-a75f-0852-6af6edc92ab9@suse.com>
Date: Fri, 7 Jul 2023 08:44:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 07/13] x86/vmx: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <f30ef7c2cda2516d9ef07bb79e5da5513cd90c6c.1688559115.git.gianluca.luparini@bugseng.com>
 <f3b6170a-db0d-ef00-b3f8-7deba17b9fe2@suse.com>
 <alpine.DEB.2.22.394.2307061515100.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307061515100.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dac6576-9502-4e62-96f2-08db7eb5a0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T2BTB7TQSQHVCr3SFHeQansWw3f85Z0lePTu2vQLgqCdxsaBGJGbdVcOXqOFQ18yIDniAJrk1mkEtNdQCdzpTBy17cf3mmmgtGbDjYMOwCjzq13mCNNwWg36me8QWzAbNWzG/CzyfOmi9SsxJ1foZArseT30txKSDSF5DZZp8OO5AKoWnQ+HQ/1qpfm4jW+sbgQZYZPOA7Mm6gw/LxXV5pYMGwNsGjfeevmd1Nx8t13BS92a+tBXyXEGIXNMpvpX/SKFQcV5nRmmmspgey++7rbUHgb59hY0lt6JqTODfe54M+NqAMAeeGSJzHnpphOx7y0qK7g978NHzyaL7UooKBEq4R2qaHSdo8FpxuOvH3Kyh+GLiWqdjwN1fvOD3sJzdIM5Sy3L9Z+lq8oD/8A+FQPyh3PdBUtEUJihOf1tD/SNDSFDGClpTKKTz+0IxM7oa5XNz5VFkLOQo+jeJo+/clQLKx/Sr+EmEjU7Mm3Z5omOxXK+MPWqkTucN4nxHjGN7/TfxOe8y77CSvekakfMs1kKVy3P5oJGPePHZ0vZA+SN8Gy/6D18US0MXtQgn35XBHx2UMzSnf+p5VI+VlIJGYGWm1FSxhuAYbZAVNwKt0JDfIu6AQ5PaBCK2vFabgGHOgI+vkRyqLbHUc4+fbKpdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(54906003)(31696002)(6486002)(478600001)(6512007)(6506007)(26005)(186003)(66946007)(53546011)(2906002)(66476007)(66556008)(4326008)(6916009)(316002)(41300700001)(5660300002)(7416002)(8936002)(38100700002)(36756003)(83380400001)(86362001)(2616005)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzQ0Umc5Tm5IWkgyQ0xjL2taa1NGeEo1cE5ZNVQ2bUtORjFETWJNWWxKaFJu?=
 =?utf-8?B?QjRIVS8rcFdwTi8vQktKKzNDSlR1eWZQcnNIV2FaMXY4N0tRaTNoMEF5RzVz?=
 =?utf-8?B?Vko2ME1kZ3o4azhuOEYwMjRIZzN2WThBeHI1K0VGRFlOOWtXeDBuUDl5eTZh?=
 =?utf-8?B?QlE2dGlGdmkwZlRSaUk3NlFYMXpSaUN6U1AxcjUyY3BnZnVhNTIwRkppWVYv?=
 =?utf-8?B?MWozaEg1V28wQXFOVTRLOXpPWE9UZjg1Tys4WXhlWXhwVFdmQzB6S1A4TVFz?=
 =?utf-8?B?OVVoZWJ4VlN1QlpYUzFkU0E2ZHQ3YTNxbytXQWxtS3J5cnVOZlBxNkRZUmVS?=
 =?utf-8?B?Wnk4ZzJRNWtVTTR6MjdhMzc2dHZNZHNEekVhTS80amQ3OVlHb0NUQ05LSUNp?=
 =?utf-8?B?Z2RXTlViUzZDUWFLVFlFb1RxbGVmREVGS3ZBdk9KVGtkazNsV2FaOG9UVTFz?=
 =?utf-8?B?UzgwNm5KaWc3cnhTTTI3Ujhyc1VmZVMwS213UjZpa0doSVRuOGR1aE55ZTU0?=
 =?utf-8?B?SUtSZnkrYTRJVmNBWFloUnJmSTl2WENlTzRXWnZ4ZlJJZGRMQWF5TnE4Wjk2?=
 =?utf-8?B?SHZ2U2drUU4rVWJOSVRDdFNzQU4wVlVMTnBuc3MzdnRzdkVsSEpZczhrYjNX?=
 =?utf-8?B?bWlzV2ExcW8yRXRnV1I1VFl6akJTMUZRZTRpYkVQanZwd24vbUVZWEhuN0Fk?=
 =?utf-8?B?TW5HZFNkd1FCV0NNTHErWUw4UTRMdDhVSlJhcldVRmpib2pqd2w1VTcyeFlL?=
 =?utf-8?B?QXhLQ0pTZ3E0OUg5bG9VVlNwRXRhelluVkRsaHJKYi9mNGtYSU9BMmZpdnJL?=
 =?utf-8?B?YmNLSk5oWkZiNGcrSmtYYStuUmFqeXFxQzJucllKZVUrU0V0OEc4QjVSeWt1?=
 =?utf-8?B?VWpPVjk0SFBZUkY5TDhmL0JPa1EzcE5Ec1JCQTFQOXB5NWRUR2IwYlBaQUNQ?=
 =?utf-8?B?anAvRWtMOXFyaEtVZnBnKzNQU2pDYm5aRFUwbFlFZWRLVE1rUXdLRlRqdVFF?=
 =?utf-8?B?c1Qxa3VabWF4ZW83em5ybU5VSnh6NkdmZkdiRTFpeVZWemtZcU5nSTR2aVBq?=
 =?utf-8?B?NlQ2WU5nc3R2RVdDQzJuUXVuT1l5anhKZksvRGZ3R2Z4bkpvZUs0S2FRY2th?=
 =?utf-8?B?TWlwNUhvYkZJdGJSL0Z3ODJhT3dCRXFja1JFYThrZVpDQzhNNk5FL2pJNlk1?=
 =?utf-8?B?QUtDV25DWUwraENZdzdUWjVIbTJhcko4Q1owTTVFbEl3cHdxOFhkUVdmY3Nh?=
 =?utf-8?B?ekNxbDF0OWFQVDlJWDJ2VUlZdnF6NlhuUkhiZlJRUjcvMEdDeUhjdTlMQzNE?=
 =?utf-8?B?cEVSVU50a2pjUEl5RlZ4TTZNdjN0ektxc2h0dVRCYnV1clRNaUhpaEFnTkJw?=
 =?utf-8?B?N3lZVzZlNkhiMVE5QUtZaHl6TmVOWkRVSEJUUXNtMTBhMW1VUmhpTGxpS0ZM?=
 =?utf-8?B?cXNqOGc5M3VhMTdMK04yalhQdE5kTUJsRklKdnFNUUlmK3FSZG9ZMG9la2xw?=
 =?utf-8?B?MEYyUXJWUFcxbFAyQXppMXJrMnVLNXczNTl2WHVvd3I4ZVp0eG0zcncyUER6?=
 =?utf-8?B?K1hJK2VNOXkxVjFrWWxCeE81RmJjMGY1YmE5dWloQ0EwSmMwbmdUYW9hejQw?=
 =?utf-8?B?UmlSWGE0OUhoUDBnU1RvZ1NOSEdDRGUxV1g5L2h4M2ZUNUYwM0FlR0pGaDVI?=
 =?utf-8?B?OXpIZWEzMnE3RFJ4Y0ZEb0s5dDZkUnR0elFnTVJvazZpblpyeTdGUzVNejhn?=
 =?utf-8?B?cThRZFN1aHQ1ZllXVVBRdHNuSFk2WVBwclhkS1FYb3dSTXh6ZXBHTTJQeWl1?=
 =?utf-8?B?MVlFdlpjQVNOdEtUTVcrQTA5UTJWTTRUeDQ5SktJbVRYcUYyck54QWNidmV6?=
 =?utf-8?B?NndDdU9CS01CSUtNNDBIRDVGdlpoeUplVnQ1NWExeXNXbWVKOFdBb0JZM0s1?=
 =?utf-8?B?YWVvU1FKOGkrby8yZFVBa05TVzh2eUE1RU0wQ2pJNkdlR1NZSCtnR1JWVmxy?=
 =?utf-8?B?RHNSNk5FVFZxaTZZUHpEY3l0TndMVGtDbitCdmJFeEdqWkp3Ti9jNVVBMDhJ?=
 =?utf-8?B?ZE9rbjk4aW9DYTBETFkxNy9LOVh4aWtKVjQ3K3JrNnhUSjNZTU5MRXBqSld2?=
 =?utf-8?Q?KFmCU6Pv9HCGbTI2qNIIXmU5E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dac6576-9502-4e62-96f2-08db7eb5a0fc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 06:44:35.9259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnohQWzZ1P9ue162JMc/nY6/G5iLC4lZwiqYFLoRRxOxk1Wbl6BPTVoCk9bMSVzPGMis6vcmk+YDtFZZtqldZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8335

On 07.07.2023 00:17, Stefano Stabellini wrote:
> On Thu, 6 Jul 2023, Jan Beulich wrote:
>> On 05.07.2023 17:26, Simone Ballarin wrote:
>>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> @@ -207,7 +207,7 @@ void vmx_vmcs_reload(struct vcpu *v);
>>>  #define CPU_BASED_ACTIVATE_MSR_BITMAP         0x10000000
>>>  #define CPU_BASED_MONITOR_EXITING             0x20000000
>>>  #define CPU_BASED_PAUSE_EXITING               0x40000000
>>> -#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000
>>> +#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000U
>>
>> Interesting - you don't change adjacent #define-s here, nor ...
>>
>>> @@ -257,7 +257,7 @@ extern u32 vmx_vmentry_control;
>>>  #define SECONDARY_EXEC_XSAVES                   0x00100000
>>>  #define SECONDARY_EXEC_TSC_SCALING              0x02000000
>>>  #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
>>> -#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
>>> +#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U
>>
>> ... here. May I ask why that is? (I'm not opposed, but the
>> description suggests otherwise.)
> 
> Like I wrote in the other email, the requirement is only to add U where
> the top bit is set (0x80000000). Adding U to the other constant is
> optional and for us to decide.

Right, but as said then the description shouldn't suggest things are
being done consistently everywhere. (Likely this is going to become
easy when splitting by maintainership area, by then simply omitting
the respective sentence from the description.)

Jan

