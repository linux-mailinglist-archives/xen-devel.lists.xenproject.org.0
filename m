Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741667AFBA3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 09:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608689.947339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlOae-0007d0-1K; Wed, 27 Sep 2023 07:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608689.947339; Wed, 27 Sep 2023 07:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlOad-0007bI-UI; Wed, 27 Sep 2023 07:04:07 +0000
Received: by outflank-mailman (input) for mailman id 608689;
 Wed, 27 Sep 2023 07:04:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlOad-0007at-4l
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 07:04:07 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2081.outbound.protection.outlook.com [40.107.13.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b67e4b4-5d04-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 09:04:05 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8606.eurprd04.prod.outlook.com (2603:10a6:102:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 07:03:35 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 07:03:35 +0000
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
X-Inumbo-ID: 0b67e4b4-5d04-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZ0sZVI74q2DBIXXPbdxoQIdrVWgunGmq9OssZydSKY1TQjaH4alTsJGKwKic4dZXy0PQ8aaI2rVhyyKlU28QMxX34y027ac4JiuPM0DwGkVn0fercSl8vvtAZgZNjU9ckWLDo2p09Uhs8tbZ9fVud/uopar3uO8J5UkWGbdkjZAVc71oqijBXZgW8AJMRSVMDMK9cyrMMqjmA/On0ybUPfYrCoh8zxykDLnj1qIyqTDeiVCHKaHIFx8ceDGOpHkw2KciqOLvTH9GYdSznTb9BUL1S2t9wvM7QpC1waMOL94dOIg9jyWt4xZrqUrFL+GAPUP3ZaRBaUIvKtc8x84WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTQc2OKIPjsQ2o3qDMfhRALZbpLsKGyi1YWIc+IEfaM=;
 b=aPSX164Jaxek4icatZOi91eia4ia1GvHAyl2IvF743sdvUqAIFr/y4aO3sZabMTaDzw7rDBsdVYLqDH+FnZkmBMpE+h+R+H0oC0AsxEdAPjQKeZ5gwzA9H6YaOPUuFkR/NaNuRg+fKqsGNPTHLfSKflYHHoGxxMMP2avdVS9oXiyipBaRF3qCpTRbFV35ciYTMgsBSFJN6Yjaf1oexEuKt8sXXwR920jwTkMEYYbbu72dGY3go+L21S/M3IJa39VLlSwt0fMrhRMrUCYLoeACNS3+F3eWLIQiQSnPE7vK7QfdyHeAHj3Y7BdryfBQ+vvMCIUU2VKAoaVzavBsqLGyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTQc2OKIPjsQ2o3qDMfhRALZbpLsKGyi1YWIc+IEfaM=;
 b=Z4viZMfl8Yv0UlcQxWcdSAeqjpGArhm0EVAEjf4793GbfhiO2r9CPXyGBLjCSDOVUka8CPCtdnGqUY8Jnz6Hc6bH2KcxwCX3vG23p7qKD96bg8r9YqDJgR/GBzXvdPAd0tAo0YJ31sg54MhBVdpUw9BN/2gv0e1si1UlktRnS/NNR8fdSKdx9ZSFQZoMyYk+7T5EbtSvasZugHthyfuBnYS8YbijvmNAGbJsF7ALPcAGhU+bmTn8DdVbuwq209V2W0Ne1KnJEaYUeqVDlNuxce0O47/V+kg0otSuviBQruVBd+JS6CmTG9iyRrWVtOC3qg3JVvdi2sXtRDhXKPDndA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93386802-a4ab-b5c4-6d0c-fffcb890e056@suse.com>
Date: Wed, 27 Sep 2023 09:03:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1695767747.git.sanastasio@raptorengineering.com>
 <d16b2f8749b65e303f531776d303586336ef1729.1695767747.git.sanastasio@raptorengineering.com>
 <43be87e9-d947-c6c2-a70d-c6ba947cacbf@suse.com>
In-Reply-To: <43be87e9-d947-c6c2-a70d-c6ba947cacbf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::11) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 510917e4-432e-476a-9329-08dbbf27ddf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yyD4DYfEID8MJmejwgoMXmX3AlZfaDO3ZoLgXDsuiFsndvHSKutVTs2Tc7AkBYPe+QZYKP1klu3XPEqJ2+gAWvif2yZWLTawekOzNXSLf6KchWDCeTOcqCgsm0IqTExdvxqkrLJrWJ7Lmg+AWseyeubzUBlO9CAJVKNwwijkYsLAGvdykF+92oKVUgHSbpziL6R4dRw4vP9xi5+NT2bNHkLedesoTyrhLFiVaCE5t12mlSF0DNatEkHFWPPe82e/mdvWkk17MjKPfXgkSJtXFyzviDolxfkpY6Ra8H+/3uJa73+5VWUek13DYzC9fUnmbDi36ak0nK97ssAyuyzxKgaZzMZr1vGtuCNLsIycruHc5kirllkuK+1Qgd3D/PVvJClfimnGKoZ/WGkkKZ1XUutWAAjvjyLeisiapEXInEl+pVwzoKYwpEzuWe/1LvEPTxosCseiPw63Dn7TJRWM9M7sskgV5U5nsf5MJU5KyZWrQiwoBZzoo/9EOOlqVL/uH9dv/DLJp+hNd6UFNJPG/ydRhs9yGtoRM4uwnqeWXtEvcvnryY8UMIT8oeIK5CoKdy9ZcyJlS38gh5IqYVNYMQmuJfE8h4BkoFhvFsKRr48EPqwkOkoE/iCvzpFjX0vUjGBHC7EoGZ+zxSE8uqk1mA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(186009)(1800799009)(451199024)(6512007)(6486002)(53546011)(6506007)(83380400001)(38100700002)(86362001)(31696002)(36756003)(2616005)(26005)(2906002)(316002)(41300700001)(66946007)(66476007)(54906003)(31686004)(6916009)(478600001)(4326008)(8936002)(8676002)(5660300002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDFqL2dDVitDUlphQU95ajhpaG1tM0lNeEkrbFA4ZjJORUdSaXFYQmZUdkRx?=
 =?utf-8?B?L0dBYXdRVHM4WXdzVkJsRjRZeEVGVVY4NDFzc1lDeUovaFpaVGpFTDNWcDhC?=
 =?utf-8?B?UHhkYXJ4bDQxUmpnMldzZ3NxaktJOFB0RHFTcWRPOS9rWkVVOWQ2ZlJpUmJk?=
 =?utf-8?B?cjE3UStJY0ZuODAvUEw1R1J6QWRhY09IeFc5TTZaYTJnZzRXV2hKZ3VMdkNU?=
 =?utf-8?B?VGpOanYrMnpIczAwU0p0WWF4bFY5WDRaVzBGMU92dmR1a0FrNGhpckxDZ1pQ?=
 =?utf-8?B?TkRBekxKVXlFK21EMDlvWUpoQytGRkQ4UzIySUI2WkYxanNjeWZiM0s1MkpG?=
 =?utf-8?B?RVdDV3JrSVRkS0VOem5nUWFzSS9uQWZLNHFpMm0wTmtPbmRTT0w4RWp6MllZ?=
 =?utf-8?B?YzN3TkEwMDcxSEYwTmNXV2szZnFkbmxWLzZ3amNiaUhsd1RwbzR6NURKQVF3?=
 =?utf-8?B?bldOSzJ1bWNrd0J2THlDT2p6ajhtRmx3d2l5SjZiZ1ZEa2pWRTFuN3lVNjlQ?=
 =?utf-8?B?UEdKc3IxNGdCb1FObUlOWTRGVWEzNVdscnptWmI5aDJKTG11bVg1Tys4NFlO?=
 =?utf-8?B?OGFGbmdRRDJLblZEMW9XaEZ5eVBKSk9zNlg5TUw5U2dHM0ZHa09pbFZwY05I?=
 =?utf-8?B?RUVwRnlJdlhJeUdoY0VBK0xXakFqQjR6Sjh0bFdnV1JMVG5oVXlzUnAzVlU3?=
 =?utf-8?B?eGo5Rk5vUDU1SkxUR1ZjRHNuRXFzYW9BOGZKY3hkZWdJeXpjeHNwWlUrZG5n?=
 =?utf-8?B?NlRxdXdiWStVN3d6aUZ1NllQUmVqNUxGd2JhUG1xcWxrUFc0eWdzNjk1QUd2?=
 =?utf-8?B?NHVET05VN3FsU3grTlZid2diR1BFa2cyWkJTV2tCcHZsdHRPdkp3bFlQL21Y?=
 =?utf-8?B?ZEtGcW8yWnd0T05qUDFvaW9WdDhFeTkwaEtJUDVFQ3B5SHNsWTFYNjc0OHAv?=
 =?utf-8?B?eUxmTEdxNVVUV1JRUzVWdEJWSVFnRXFCZWptazNHU21OTnh1c1BJZW5Sb1Z6?=
 =?utf-8?B?cDhFdXZJcHBoMUIrQUI2U2xiUnpsVXdjYWNUUWlNMWJXK2QwRVFsQ2pGVE5C?=
 =?utf-8?B?TzdwZGRob0RpdFYwWnh5emRDOTBQTHFGTy9BcS96RHB1dEFoQkllM3R6cDBx?=
 =?utf-8?B?QlFQUlJXRTR5Q2hWVXBGM2JuK0oyNUdPMHhqeXVTODFOdVd2aVNIQXM4MjU4?=
 =?utf-8?B?VFR3bVQwZHRHdkgzSktsbjRRSEFBSmlRWlIwT2FrSHR6dVI1SWdkbzdvZDB4?=
 =?utf-8?B?YmRqaytKaGJnR2tsT1VsTEJIODNiSittVzJvaGhSKzhFYnRTUEdldWJMV3RE?=
 =?utf-8?B?SVBxUUZSYWVoK2lhYjZ6SWMxZ2xWK1RGVWVmRUZGRlJFeTFpL1g5KzMvdnhu?=
 =?utf-8?B?eUN3T2xjSzZZeDNRblFnVXIwMjRmRTY0Y1FLNzhHdlhObmhyQWhjYlBwRWlB?=
 =?utf-8?B?aWZKcGZSYkZCWlFqQlA0MmRtbVhKSHR5dTJGckNJTlBtSGg1ZCtvaEJXeDdS?=
 =?utf-8?B?ZmhjRGM4amhTSTEzdDJ1N1RGMGsxMVJtOEJpaXFLek9kZzJXMk52K1BoRVUx?=
 =?utf-8?B?MkdycFBWbjZTK1Yyem1CNG8wWHFzeXM3ajg2L3lSeWEwMmlhdjRDVGwzVUhD?=
 =?utf-8?B?WmNtb3BuVXJLQy95ejZWcHUxTTVIdzVaTzFDQ0w2bW83dWlhSkVkbHFsSjhP?=
 =?utf-8?B?TlhZeDhNK2hOY3VLVVpjeXhkZlB3RmY5bFhzSkI1bW96UW51cW1Sc25ScUdD?=
 =?utf-8?B?dGt6a1N6WGV4OHNlTmVnNkFCMS93bHFNdVdaOUpoTFkzU2ViZXFzT00zMnBX?=
 =?utf-8?B?OURPOElDbUFzR2UyazNpZ05oZmlZUlZRRlpCNmQ2VWRkQ1RXTXk4WHRwRDls?=
 =?utf-8?B?VzAyTzBMOHhSL2g2QnU1a0dXVDlGM1lLTmUvN3hDaTdaaWF5V3JjRktQNjFO?=
 =?utf-8?B?OHF6TXFPZkVucjQ4RjNtUkx0K013eWZESDVJblVsbzJ5V1lyUm1DeUwxTDM5?=
 =?utf-8?B?WVAzMUQxOXRETlNNS2l5K01aT09oa1JBUHUvOTlzZFlZVlE2VFFCZ0lQbTFS?=
 =?utf-8?B?bU02ZG5TMWlSOHp2bEJUN09JZEVtSVJ3MGlGYTh3UzhPVWpsck5XelhHbXAr?=
 =?utf-8?Q?UO0uwf59MxClQdv9vNnpFm7j+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 510917e4-432e-476a-9329-08dbbf27ddf6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 07:03:35.4048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIIAY4JVN04IXU6vBTmj+LPPTRY8T4AY0ZBAUogr37XskAkq7JM8MB1wX1EjktbwKv0GHu/wIGtoQfHRmJEYYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8606

On 27.09.2023 08:32, Jan Beulich wrote:
> On 27.09.2023 00:37, Shawn Anastasio wrote:
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1211,6 +1211,14 @@ static unsigned int node_to_scrub(bool get_node)
>>          } while ( !cpumask_empty(&node_to_cpumask(node)) &&
>>                    (node != local_node) );
>>
>> +        /*
>> +         * In practice `node` will always be within MAX_NUMNODES, but GCC can't
>> +         * always see that, so an explicit check is necessary to avoid tripping
>> +         * its out-of-bounds array access warning (-Warray-bounds).
>> +         */
>> +        if ( node >= MAX_NUMNODES )
>> +            break;
>> +
>>          if ( node == local_node )
>>              break;
> 
> My comment on v1 wasn't addressed, either verbally or by a code change.

I have to apologize, you did respond, and I didn't spot the response earlier
on. I'm not happy about the added code, but at least it has a comment now.
Hence I guess I simply withdraw my objection, so the change can go in.

Jan

> Imo
> that would move us a tiny step closer to what Andrew was asking for as well.
> 
> Jan
> 


