Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A230C75A77A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 09:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566387.885144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNqo-0000mc-P4; Thu, 20 Jul 2023 07:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566387.885144; Thu, 20 Jul 2023 07:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNqo-0000kt-Ku; Thu, 20 Jul 2023 07:13:26 +0000
Received: by outflank-mailman (input) for mailman id 566387;
 Thu, 20 Jul 2023 07:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMNqn-0000kn-Km
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 07:13:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe12::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea5148f7-26cc-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 09:13:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9263.eurprd04.prod.outlook.com (2603:10a6:20b:4c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Thu, 20 Jul
 2023 07:13:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 07:13:15 +0000
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
X-Inumbo-ID: ea5148f7-26cc-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjCOn6IEB0ARLj0fkx45+oh6eC5r1HnuK2WUigGpdlTCbdp6aYI8Ee7jG1zMsrrk3qbdVVkHfkn+ek9AxYxI5P1E0PNKL3h9nceyaw6CxaIBBVLDB2Ktp+f91ViI7lfShfJTNlB14eEvVLQvRZDch20Es8jJZ25BCUnYeHLQqFWVOGBQa1FRYUNGxTkcFzRv5IBLDGDz8NKe6OKUVUKRmB7sbt4XDepeunQkXKWBoch26nrLhyDZzmUFyqprc+kkK8B+LBnAQ0FyGAZF3sygF+55O/C56TpS6957xBkqrecrG+gFH5HR0A7q/CAxVk2c8ZgAYsS7KgjxwbXxfO2Cdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSOexzgjdj3jGYtL4tQirhvoCQIqOI32M5rUFJgXD9Q=;
 b=lo/8IcqD/cqyZP6lde4cTdJVoZMjHiubm1Nbg7bXIgluMkxdruMAOTTFHUDgY/D1oPgcRbrfoveWKHAdkHGobssBPaXcUY6x6nQOBrgDIhP1E+bCnGYZjfmh6m2iOSZdK1WWPldl94PBiVCPNJSeepoH5l7ryPuOs3I9ESqAIYBAH8B1xEBCFWFiizl1P7zR5itZIP+DsKe87q6M0kQoNVOplLsbCznVRyp94xCHld/wSdY+0E8swa+xoDj1IdvWkUlsknRM6dxM+hHcdy7tVcmWx193RfOg7+nBbfDo6fRtXwMyG4Kigi9aVqADwwtIKOq+kDYyvT7FeBXGrC6hGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSOexzgjdj3jGYtL4tQirhvoCQIqOI32M5rUFJgXD9Q=;
 b=UwQnrDvWsfgyIwy+dKsePp9LxQakZzMttYq/qKDUSEpBLF+45hcy8CWScOhMo3NhAsnIxZyWEt0ed35UtyHrjwcxTwmHMxKdWxQO0LiFblQ6fXwU6zJ6x9wfCaKpWRFQZEum+pwTLh0jK59XOhT9CeIU0s7NbQdGR288Sw9+ocKGngMqf54dgTtyK6fC+A4m0gJ8OB1g9XNoDiufPr4bPNpY353hXDu8I9aFQxYVobdhitV8hTOJ0moaHq2WJA79zSVqgvNI4zThT/AhY8+24SAtSq8Qy3OKh7yhzcBux3mXR5mDktXfrKXGN+fGmRtiKGF7XcQ7/E/5Nk6PMz069A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ffe60a1-83dd-c027-6924-029b36b9a4eb@suse.com>
Date: Thu, 20 Jul 2023 09:13:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] x86/HVM: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <589e9c2ef5f13bf0c035b63f7b2e24fbbb878543.1689773180.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <589e9c2ef5f13bf0c035b63f7b2e24fbbb878543.1689773180.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9263:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b1821d-718f-4dfb-82d2-08db88f0c975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uk3Vwy6P0PebBwXA+01fG5aJV46FgUp/DACUobYuKiOE+ZTzxbryQ4xsYWgBzdGfFn9Qhl/1Ro13VjooOdef87XyzaU0+F9XwXhN5wlia1LQqqjyFRHjt4DD6qLdcYZsY0I9W49772bA9+7XgYkZA1IrDxprsaDEgavrOPmAQ/MBo4Y4k2ph7Ff6fTWp6KtL/YZ70iwzSIxVYB7G/F1mvwz1R5eOVAzbxh+ESsCIBRr/r7keDocuINg9oDcDCFZeQrMVAc1amxTpD/jLbLmXPW1f7chhYf6srtzQ9MgpnUY4u2G2Tt+6gnH3fFLUdQQT5bAYczZsO8BGcarCip/tnY1TcalZzxTJn6uEfglEl4YIkDcSpLtK9mCuFqd8IIPI5Kwepr3fquDQAap7J/eYAfgg3dzgOGJCS+M/xocIIYLQDXlGfYVbSGMzpyoyZTGK8qfHXnacQH+tRMjSQWfPz5hKtILfe34UgWWy6UIDwKMUV/oJB1GTlA/uwaBxCZORTlt9ZI13fegG8xe59/4LJDIQbX11cdX/UX2PQbC7SVbhEf+2r/BuVZ7sGKZ/Y4iEILvU3Twx4qmXtwko/lkmlaj8DPCeL39ZFl2ZoBlVCsZ5BhvS1t5ZWhp8LZmyYYmcaER5vzIIlwzrtQbX9QsRMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(31686004)(478600001)(6486002)(54906003)(2616005)(86362001)(31696002)(36756003)(4744005)(2906002)(186003)(53546011)(26005)(6506007)(6512007)(41300700001)(6916009)(66476007)(66556008)(38100700002)(8676002)(5660300002)(4326008)(7416002)(8936002)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjRoTXBxYjVwQmFCSU9zUzMrS1hyaVVlWGZtbXdiRGJiTURTdHpGSzl5ZkxS?=
 =?utf-8?B?ckhkb2hiYXFzYnp5NUFJZ2VpR2NNUGcvMmw3NW9US0pxZjFpS0hHWEExWk95?=
 =?utf-8?B?SDJsNUdSUlBNbjJZQVdDazAyMEJLbGNxUTJJMU1IOUJEMGFyYVIxbkJzU2gr?=
 =?utf-8?B?SnE4YWtTcHp2TmVhdlJaN3J1SHpOdzVndGpTaE04aFlVMElpTHl2Y3BSQ2NR?=
 =?utf-8?B?YjEwbnQrR3h0NFZUWWlDd0lscHUxOHp6RXBuaGNnVnc3dmZhOW4yaDdpWG01?=
 =?utf-8?B?WDdoMFhBWVdLWDBaRFlLU2dpcjYrQzB0VVZ3WjBmcU5HSjhieDJBNUhTMDRn?=
 =?utf-8?B?WlpsdlJJQkdvcHVESzRBWktXaVFZWDlyTk9MSG1zVjk2cVdxV0VIeWNtS3Vt?=
 =?utf-8?B?c0pIdkYvK1FCRWppUVQ1aTh4UEwvR3JudVBHanh3aXZIV0xYYXZUOEx4NzJO?=
 =?utf-8?B?bEpEV0Z0VnBwUGVmZElqM3dMTjFCZXBTY1l1aWRSYW1oOW5NWnJHYVdTNzNx?=
 =?utf-8?B?UUpqQ1ZwU1JxUERaVjZhUjg0WHA4QzhMcHhnclRGRjhKbnVmQ09Fc3o5aDha?=
 =?utf-8?B?cmFSNHFTNEJQWW1JMUJWVDQyVzdBQzN3MU9mODZjNGowNlkzaVlWZC9Fb1p5?=
 =?utf-8?B?T0xwbW5JQ0Z3dTdNK0h1VmFQRHJLSWdBNC9FSk1ZMjdsL3M2bDluUTVpU1Bu?=
 =?utf-8?B?b2FRa3cxeEYrTUtFZnp3dER5OHJlK3NyekVOQ3gxekpPUjRha0Q3OXhzT2R0?=
 =?utf-8?B?dm1uZWZzMTFqOXVQWEJsYW9rQVhVT2RrT0VYSEh0T2gxRnIzcEhEQ1pCWmVo?=
 =?utf-8?B?ZUd0NU1yTmhrNUJWRyswUWtheG1uSFg4SjJZdzk1UU1CRjVleUZKT0s3dlJu?=
 =?utf-8?B?enJkbU9DN2ZaM3gzSXpsWExZeS9mYW5LVU02dXdPWS80SVpqTitIRE5PeEtY?=
 =?utf-8?B?aGllN2NKbDVNcjVIcXcrUXlJRVhSb3JiaDVPbmkvLzZJTFFYQ2hWdnduUlJJ?=
 =?utf-8?B?YzZjMUo1UUhYNlc3L1djV0hIM3ExS3ZtYXU0UFFzTEJ1TDl0VW11NzN2NmRz?=
 =?utf-8?B?aGdocGNHdC8vT3M0SFVhWXFVcXdxUVZ4RS8yMzlIUXBYclB6Yy9seVdWQ25s?=
 =?utf-8?B?SUtUOVhEVW1xQmJMM2hwRDRBSDNsYWdCcXdZUzhWMXJSamZDbC9sTi9zRW8y?=
 =?utf-8?B?bHhlRi9vb2JSYXFidEdYMG9KOVNSdFVZOEFGaXlIVXU3VkY4MmVzdEE2Sjd6?=
 =?utf-8?B?U3NYdDdPcGczZWc3NTliTHp2ajk1b1BzU0pmY2FTaVZXM0Q0ZGdVbUp4dmRn?=
 =?utf-8?B?c3pkWHFHLzBIZnJOcExmcU1OUFpiZ3VrUmhIb3U5cE5Iak1TOTJ2VEF3NWY2?=
 =?utf-8?B?Zmk0eHp6MkpTemZGcmtWTzNNdTNRR29vaVNvM2FjUDdienVKSmkrbWNqblJp?=
 =?utf-8?B?V1I2OWhYaXd6NnQxaGdGcFEzSEo0SWpsZ0VsUENHTW1mL0tUTmVQbkpaSmZR?=
 =?utf-8?B?cnhkNkpkUVR2M1p1SnNwT3J3MTRON2EvZlhFanRPRGNhNmYzN1BVdkFEd2xt?=
 =?utf-8?B?U0NZWW9iWnV2Z3BldDQ4VGNxOThwVFIyaUV0K3ZrOUZMa2RnSzdKK1RwMHh4?=
 =?utf-8?B?TzY0TnZqMHpsVlBkV0g4UGZrSElFSlBJT0JkUlJRK2FwdG9vU0xEaVpZN2lx?=
 =?utf-8?B?UVR4SEdIMzZPaDNqSkhwYWhXVTNab3g1dGxadXlMV0NmM1lVU0JRY2g3ZHpM?=
 =?utf-8?B?UDNVTy9IVDJlRDhDbHp2OG8vcnFJMlVyV3lsd3ZVZXJpSiszdXZDRXZmbExH?=
 =?utf-8?B?dEptRXVCU2dpR0pMK2JUUFZGWGtIcnBhUmxvVW5tWHdNLzRUZm04NkorSWxy?=
 =?utf-8?B?MGVCUUt0d0RoenU0dTBsU0RIM1dtZGtaU3RlK3FMNnRPME94ZXFtdTI0WFJa?=
 =?utf-8?B?SDc2dmdhOC9wV2VCdDEvbTNLYUxMemwxRDFvU2dURWdXN0ZPaWkwTVJrcU5w?=
 =?utf-8?B?SVdqa3g1L0lwc2xkWXQ3aWYxZXVicmtlUEZudjlIYktaS2NVVWVYWktpZHFX?=
 =?utf-8?B?OFNrWExockdMQ3lJOHVReU5saXZMY1JBVGNUeVNXSUlOUUU4amNuRDQyUnVx?=
 =?utf-8?Q?H/TsPvnS4mM9ddw3VCyNEDmV+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b1821d-718f-4dfb-82d2-08db88f0c975
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 07:13:15.7541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wydh9hbfyqG++2dys6FDb1LqzKsL3cmBebgi/7r1R9kKBYm85ZwMixAVj9sMrktGFRYcWf1aWyi4141CKpcgww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9263

On 19.07.2023 15:52, Federico Serafini wrote:
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -559,17 +559,17 @@ static inline int from_bcd(RTCState *s, int a)
>  
>  /* Hours in 12 hour mode are in 1-12 range, not 0-11.
>   * So we need convert it before using it*/
> -static inline int convert_hour(RTCState *s, int raw)
> +static inline int convert_hour(RTCState *s, int hour)
>  {
> -    int hour = from_bcd(s, raw & 0x7f);
> +    int ret = from_bcd(s, hour & 0x7f);
>  
>      if (!(s->hw.cmos_data[RTC_REG_B] & RTC_24H))
>      {
> -        hour %= 12;
> -        if (raw & 0x80)
> -            hour += 12;
> +        ret %= 12;
> +        if (hour & 0x80)
> +            ret += 12;
>      }
> -    return hour;
> +    return ret;
>  }

I've just sent an alternative correction for this.

Jan

