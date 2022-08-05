Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253FD58A860
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 10:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380909.615343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJt9v-0000uo-Vs; Fri, 05 Aug 2022 08:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380909.615343; Fri, 05 Aug 2022 08:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJt9v-0000t2-SZ; Fri, 05 Aug 2022 08:58:19 +0000
Received: by outflank-mailman (input) for mailman id 380909;
 Fri, 05 Aug 2022 08:58:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJt9u-0000sw-Nv
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 08:58:18 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50076.outbound.protection.outlook.com [40.107.5.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf1fbcb3-149c-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 10:58:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB6350.eurprd04.prod.outlook.com (2603:10a6:803:122::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 08:58:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 08:58:15 +0000
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
X-Inumbo-ID: bf1fbcb3-149c-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIfi6wU4G7zUubCtKq31qbH8KzIKtHXTGRh+gZm4zca+4FwQtv2iYkerdmPSNBdG3YScsRSsZdSqanNyzvqFvFHx92mbynrrNDL7KefWhMxJ0k12mrDGlvBJzPpXnsYlvCQZdaJtJXf5BmDMXdg4ak8Wu003BlJbjxd3p7O+v+pMKzzzqssW4n8ydizMB7QJg2sxW0zfBvLwM4VvQKfcVBpp22zVpvwDU20fX7HnbeFeJXyXHl+tsxvTAKw1SOhtB/UR4XiAj+sttadFRTL6HA0JH0lk0wUChOqtLKZBQHwhGUpXyNJYi0pX4Ihce26c6u4J4zbRhSvZA6M6JKu7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqU+19+UTeOijz/zjWTwxXmWEbbRKExSixiLHgOID4k=;
 b=fOGfaKNDbPVRlnBa5UkM4eppiBeNixYACmRU623mv9T5eYP94NbXRrCqkcII5+bqs5h1U9PTR1+FG1h5d6L6OJHIHan3ehi2cxDMK7SjphCoGMnI3g3m/VkRwqRRoy1p2Whs3vCLaq84qu+hXBl20G7ZksgkpcY88aWTRtSNQdif2ayaZ7zqIrsbPNp+YkU1Vn06BxDRDobCoSQX8JE6GvAIeTOKui2fXF0ehadvc5qDSnmm1g+aE3nwY4+I/1W9tKj7oJLZGIHpeI98m4VJa7AkrjzvUikpMbPD0LuoKFJTn7wsUZJxdsEDdHCxHGjwU5L8oo8FX7vix7IvscRkhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqU+19+UTeOijz/zjWTwxXmWEbbRKExSixiLHgOID4k=;
 b=FvI1tiMTxvVik8v+OiD+YeTfqeh+Bpqn8cKspCgUe8qIcG4GDpGoW5BN3yN3KM55Uwd8YloAi8GX1GJo+RT1kc3obnZTU/gAwJLiSaj5GaIXgkq+tpyVqIGh5TpGWPrvSfNYROJa0Biqr1MwI7mverD6mWpTpjJUDuNCJhrRuny/G6DsvK+GFqq0z+XrXWYycM7n4dSVt5FKJ1rfBjgm8cGTmgRCqycxXW/MplfgZ/818LEaAoOt37G1AS4MbKtQ1Vz47yZa4CFhUnEiLQWmP3m1HCOVEpvpW8hXympXmflwttgiwdXQjzzmMqbAOFTt2MHECPT+4t+7Y2xnh+sNSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc54f348-f1b3-71ea-14c2-5d756532ba48@suse.com>
Date: Fri, 5 Aug 2022 10:58:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/cpu: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220805084354.1847282-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220805084354.1847282-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0022.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6921a410-bf8b-416f-a51a-08da76c0a221
X-MS-TrafficTypeDiagnostic: VE1PR04MB6350:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0XT1fL9Qfi1RUx8eFFpJYmyEL3HhwUj7g3mp+L1aN0HPNjNW4Zn3hhWDon63CVF+tCmfQdWKXp3PT5xb4cTAo1zESL5htwY/wU0XUelw75m/yedtFRXrafGum2Ky/m29lw9qjLuCkN3seu5+2ZJEftmy3IGI1kPDtszqo+j+zvxnJwUAN5zbtpZ/eJTwerN+k9k45y9A68RqtYodRgrpAb39SFJiS+5bLJpMx9+JI1HQ5F0h5/abH1ybHvxRQ/fqsA2qRH1PhqJQyJc9aOw7XQ670yg1zODS3kMRaWBzs/ikfnEPq4565WPKfVVz42UNaPmZrqq4HtEOsCldzmrwAjZqhgJw1fnqffRr/Hl/jRZkMIl+XTqutCHX9N7RbqRg2NA/t8CmnQ2LQXP4hF75IWYUadluE5sFir5wXtZD68IZpSEFerBGQqyeWnfdWmGIpRZpf/kLkgyfQIzAAJOJ0r4J4YdRZ4pSBq01f7if3HuLaDAAw2JjPTexE/NnD5pdN/AogiLEMeixKErdb2dAlHGz/+3SFR49CsFsirqovQm1i2vE7mFZ//OSP0qahQpwDSmyrh+eIrNXOrCywFvRhr2kXKOVUI7c4PvuSlPO6pr6G9x90WFW4iBwKz1yeSWeBK30U3cBE5pChdDuKIZJkNExOLwXPUb4NrkvUuemiKnNeIcEOI2lzMROJFDMTRYKHaUxQ9IbKVuu7lNMz5zYrK3klQyY1fWIKNGd6XaT5KbBrb4iS1bQvqtyiuB/7WxqdeNNXVeyzSgocpotCJA5PA3SpyGWuzsxjYPqF2PRWDWv+XdfSULdNHUKWJc2m8NIZMSsgZ/srTuXn+/wmwnVrg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(366004)(346002)(396003)(39860400002)(2906002)(6666004)(6506007)(41300700001)(2616005)(53546011)(6512007)(186003)(31696002)(26005)(86362001)(66946007)(66556008)(66476007)(8676002)(31686004)(4326008)(6916009)(36756003)(54906003)(316002)(5660300002)(8936002)(38100700002)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmgzUW1xMUE5Qyt0cHhlekdic0Fqay9XZXMwcEswSjcwWVpkN29Qd0F5cWJt?=
 =?utf-8?B?bHdadHY1ek9vU0czazZYQ0orNlFWcDh6em5uN3FmK1JFQ2liRkNpZUkwNzly?=
 =?utf-8?B?Y1dpNzl1RWU2UVNBOUpnL0ttZ29qeUN0NkpJamZXdUUrVldocWxUUzcyUTlp?=
 =?utf-8?B?QWRXUnlEbHBKUHhnUWkrMmNIS3JESDQ1VVc4UXVhNDRUOG1RK3JiOWVlNXZq?=
 =?utf-8?B?WDZDQzBCeXg1cTdNVGp5NEVLMVRHOFlka1h6KzlwL0V0SmtYejQrRXZ1d0dz?=
 =?utf-8?B?VXRVZnFDY3NoUUZsNUZJVlp2SzFkaUQvbEI5QVdIUnlEV2drV0dPQ0dKM3Rk?=
 =?utf-8?B?VjdJL0owZ2xxU2FGb3FaeHpCOFlMUlY2dlpNbFU1TUJ0RXVXSG9WanRRaEhZ?=
 =?utf-8?B?NzZldVNPcmZvcUlYMk1XQmZvbU5ZTDZhdklCRmVnbXJ2SDlsaStNL3VyMExL?=
 =?utf-8?B?Mk5ya1MycDQyQjdwS1BtbGpGTGx5dHRSNzlEdzdDQStpYnY2UWVBUzZlNmFy?=
 =?utf-8?B?dWRGNFN3TytyVVZCT0J1aWFnUk9DNzF4bTRuWVhUSExyS0ZDdVVUOWc4RGZZ?=
 =?utf-8?B?RWNqZGZsWVc1akZrRlo3K1JlRHlUTFZVblBWaVJQK0psa3RRY3d6QTh3aUtx?=
 =?utf-8?B?LytOUy9DYnFpRUpxNEF1MnRzb3YySXlVaHBzekxyTDRsNjJVV0R6YlBRWGsw?=
 =?utf-8?B?TnlnYWprQWNJWFJ0SkpoS0pPd0xad0ZqaGNVRko5QWQxcGsyMEw2andjRDhr?=
 =?utf-8?B?aTdzbkxaZkJDS0pQOWNUWWxqc3lYZXhSd1JlVVFGZHVuUldCZlkwcUFnb0tM?=
 =?utf-8?B?ZVdLYUx2T2lSY3pKM1EyMi8ya2dUZ0dwNDBxNUUzbXozOFBYcUpiaDBtRUFV?=
 =?utf-8?B?cEpzMlg2YWdGTHowV2laWDM1RGhDazFYWEpQNGNyazkzSlVTWSt4eERUNmZ6?=
 =?utf-8?B?ZTVyaUU4ZjVCQ3JYVmZzTEpEZks3eWZocjRxTHFmOVI2MXl5YTZ0NkMvT3VV?=
 =?utf-8?B?eFpOWUZ5V05KVmU5Qm5VRkpHM2VpOTVacEhPayt6bkxJWHc3ZTFUMTJhRVhO?=
 =?utf-8?B?b3B6bTZkUzlNZEhEM1NoOWtYMTVnVW1GQ3FUWHlTU3JNb283ODFVN1plS3ZS?=
 =?utf-8?B?WEd6TDZsbkJOWVljalphcDVPQmVVS2JZa3BrZUF5enJ3cWpyRFA1c1lZUWFF?=
 =?utf-8?B?RnUxWWMxYmdzYS8yVGxFOVlYN1VGR0VaZkdtNnZGSlBVUkNNZUhIN1pLNlZK?=
 =?utf-8?B?QXBIY1NtbWlpa3pXbEQybmwybHFMNHNNaGhVazgvcFNHSlN6THV1akZpalJQ?=
 =?utf-8?B?Vkd3N3VWNVhYR1A1YStvQmRHQldmR1VrRXNoSTNTZUQ0czNmaXp2Y1grU3M5?=
 =?utf-8?B?L3FTUGJIMmlBUS9oSWlESThWMG9UaW1tNFJSOGdzaUJnbVdwWG5aODlvQ0R5?=
 =?utf-8?B?dGV0enliNnNFUC9OK2JJeVV5MW1wdG1PWkhac0dmejFCdnpzN1ZiMEltVkxM?=
 =?utf-8?B?OTAwWjJYRHpQTGR4UlN2RG12QlVBMVBPR1lzbGdpOGZpVlN2c1dNd0dYWjBU?=
 =?utf-8?B?ZlVpUkJWZTNScXJ2eWhrOGtibk1MZlpuNDJ2bEd6dThDMGxpUUhtL1lrckp3?=
 =?utf-8?B?RW1BS1NxcTJ4UWFZRDBwbm42R3loVmxadm5xa1Vhbmdra0p4RDgwWS9VUWVp?=
 =?utf-8?B?UVU0S0UvanBkZXhoMDdsNXhQY1lYUDJKQ05Uck1qUnpRNk9WUUIxOTFEM2E5?=
 =?utf-8?B?UEJubktoRkFWRnpLWmg4Z0lxa2NaT3k2WkQzdUlYekwrQkF4a2pqZDBYV0RJ?=
 =?utf-8?B?S0N3ZDVUTFowWGRRQThxT1RaeEd5ZG0xdEMxQ2Z4YmxndzhEUHlIUUp4aTR2?=
 =?utf-8?B?YlpUTHhZVEdBUnd0T2JNVWFQSGFjYmpmZEpZNXhTMHZyRjNDSTdLbGZQSmha?=
 =?utf-8?B?bTNQK2QzalFCM1VDNmFzK0hnbldIczhsbDAzd2tkS2NncGhJUkFxTEhnckU4?=
 =?utf-8?B?UVViOTdqaHhBeWFmOTJ0U2xoYVdad1FqRWQ3T1RGa08vZ3NtUk80VURpUWNJ?=
 =?utf-8?B?bGt2b0VNMzBCaXpWWW5pSkJQTDI4L0l0TStoMjZ2VmUrV0NPejVSSVJMSmor?=
 =?utf-8?Q?/bNBZxm6+AA4m7xdKBPOT/AB7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6921a410-bf8b-416f-a51a-08da76c0a221
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 08:58:15.3196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLPTuOPXajJWzUsuNbwW/Uwe7/h30Lez+sbPXZVM3WLiTGztZzyNg/Hpv5pQkPWD4C7cJLvbGCYysvfUocSpnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6350

On 05.08.2022 10:43, Xenia Ragiadakou wrote:
> --- a/xen/common/cpu.c
> +++ b/xen/common/cpu.c
> @@ -25,7 +25,7 @@ const cpumask_t cpumask_all = {
>   */
>  
>  /* cpu_bit_bitmap[0] is empty - so we can back into it */
> -#define MASK_DECLARE_1(x) [x+1][0] = 1UL << (x)
> +#define MASK_DECLARE_1(x) [(x)+1][0] = 1UL << (x)

If you adjust these, you also ...

>  #define MASK_DECLARE_2(x) MASK_DECLARE_1(x), MASK_DECLARE_1(x+1)
>  #define MASK_DECLARE_4(x) MASK_DECLARE_2(x), MASK_DECLARE_2(x+2)
>  #define MASK_DECLARE_8(x) MASK_DECLARE_4(x), MASK_DECLARE_4(x+4)

.. want to adjust all of these, as they all have a similar issue.
And while doing such adjustments, please also add the missing blanks
around + .

However, these are macros used locally in a single .c file only, so
I'm not convinced as strict rules need to apply here. To make clear
no further uses (farther apart from the macro definitions) are
intended, an option would be to add #undef-s right after
cpu_bit_bitmap[]'s initializer. (But this is not an objection to
adding the parentheses, just a general remark.)

Jan

