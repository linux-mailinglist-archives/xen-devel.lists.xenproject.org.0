Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2198662063
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 09:43:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473377.733934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnja-0006JV-SE; Mon, 09 Jan 2023 08:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473377.733934; Mon, 09 Jan 2023 08:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnja-0006HT-OU; Mon, 09 Jan 2023 08:42:22 +0000
Received: by outflank-mailman (input) for mailman id 473377;
 Mon, 09 Jan 2023 08:42:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEnjZ-0006HN-7e
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 08:42:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87575a56-8ff9-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 09:42:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9481.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 08:42:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 08:42:17 +0000
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
X-Inumbo-ID: 87575a56-8ff9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrLxFM09aKt2gSNNsVBKYFe+OAbIls/JYGUFCX5ASOwc8DTaEBrqyYdSaNKI2uu74PsubJmrr1nkjZijYFIYgmm35kKwRUIfQ83yRBTvvBLBM2m0wvVYdHlbwu5V8QymUBj+TX3ZHyjPuMoNCnXpmk8bd240Czf0LaJC2vuBtW0VoH38g5yb697eqklbEfMqpI5ujXy5OakIqKi0gcyjdoIKpIVgYuI8pzfZl5wAyT7g5OjG73NcqzFXaVxGM3X+LSDDyqcu0C9Vo/yejllRiaF8Luz/rJTVJIx+OiegQysiOmJ6PuUotZ3oGi0WSSsEL9p0Ekg4WMusQFsEaQE7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8TokGGxB94VKlVbvpTwqndAo8B/W2RsotoDsKDJ7KA=;
 b=JrOFo/Npa4d0+m6UE5XuSVKNCF5sIyCm0DZbFDPLruH02Ug8k3d0AFtasFL09Qe9rZomjy87x+T/PGRjW5QgJkZTbeGlpJvNmtGSTAiQZS6Dic0YiRVPQ6lU0Na54LzrWecRDlJbN7416HpArKurIDe5pHDKdEE4WsfvY+FC9SC1qZDLDjOWOc2jvF2AW9vNb4l3N4EbhstHx9ZrDUkafD0EDcjKHhsADdCMFbM90iFkby+ur6pqi6W9X2Ma4dubSKS8DFIQS2OEpKnTeZdFtUMCE/Zo9k3RkT47LxZz4gq0CHUUUD/2zZg4W95K4TIdeEQOiZSxkgzcDouEcRhLJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8TokGGxB94VKlVbvpTwqndAo8B/W2RsotoDsKDJ7KA=;
 b=C8F+nWduWBPMXjWwqmQSEGlsXVqnVrVdxccq3fj8TnZJhoYrjYikmr6VPqBW81yMvDCF8M3aLRJYSyL6XpeClmLAOHTjjMEWN7qJYJETNir5majDLuI/D9QAzjbXs+vZ9nz95ivAOmsF3p3PepmFRjOyvk/dbmPzOYT6Cz4rJH7eNCD8i0kjfcESUEO45EivBRaf/xTWEZUWHl8NsjcCZoXqw2fka4jkqUJn8UR39ZqLzuQcxXgeO9z2qTxNnVWGsMSyJTLCeTZgf6rkAIRgBdyf3/gQpOD4d+cFeHS/1fHOfgngxezEVD28jcP8PQUiXPl92zknPe5OCTPR3hrMag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c333051-4c2b-fdcf-75bb-1a700bb3a3ca@suse.com>
Date: Mon, 9 Jan 2023 09:42:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 06/11] x86/shadow: drop a few uses of mfn_valid()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
 <ca3e0c70-ae80-4c21-97f7-36525229074b@suse.com>
 <11758833-fb7a-f937-a847-fe79ba932679@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <11758833-fb7a-f937-a847-fe79ba932679@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f8b1fd-57f3-4394-5d8b-08daf21d6a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XRCL1r1SSzj/RlFLW9OMCOpNDPiiGcpvgLxUmDnOKIV+6pX9FQ0I9+OO2UcXnMu1nZ+ckW85+9Siw0CQ05ZWGn7RWxBYv1AehB2OarwR+9Lrtod4ZlqC7w288+tOHcPGnalfUKQQNtKH9f7EulECDocu3W23sxApeSJR4UrdSZUUtnAx9DqTcd4nc7143elmhhlsHg+DKHfJT1Y4VaAxOA4meadqzMxVpn9xchUIR6BO2s6YXUw0sxDdqZljYKIs9ncNw2hstYgPVHyuj/tPjk3Mq8XgyWX4p8XK16FyeU657VhWsYmHCAxf6DzlwldI2QdXWMdM6zOvF5d8KnvuHw3IrIXt+D2bUNlCvZqLlaJoJet6Dz1JQHW+TiQrnttEwrJUCVeaieNcAcB5kyDlh77HHzp3IsKPd7GlsHU9OCjyK00UdzvCoMuYNPO7qWeuo9P6CQ0KMKso1WlDm/X8xxSYDCiBXCEbAuwBDMjVfVphTb3A2Sxngk5VB0V2aSvY4q4lrLjXGhVaeqsz46CrWWFQ4nnAiNmMsPvF7tDHT6jv/FekNaP6w4fo1KIC+bolQDmmxNvkBKe2unJgjwCAtkbEj2vUQ8wSCykA4bVCHQEhfSV1suLw1zcyVc9iOhKQzFT/iCXVJflft4kuVgxcRdw5vsKVY8htBk2A/coQIHX2be1B+2f0F7OomKXMDxSPLm05VokKcg0mwlUiR0M0xDlx/3vKEjpyP7ewPcQMONs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(5660300002)(4744005)(41300700001)(6916009)(8936002)(36756003)(66556008)(66946007)(4326008)(66476007)(8676002)(6512007)(2616005)(53546011)(26005)(186003)(6506007)(31696002)(54906003)(316002)(86362001)(478600001)(6486002)(38100700002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tkt1Wm5MeXFsQXh1QjVwM1RnY0VsR1puZGRXU09pSFRaOGpYeEpzK0tTNFB2?=
 =?utf-8?B?WDRoOHd4T0h6ejNTMWVCa2k5MXQxRkhlbHRMaUxaOStndFJQNEFFZVdlZ0tK?=
 =?utf-8?B?WFpMcERlckx1U0hTRDB3VmtacytFdThRR1pUSjR6SURQWnpTTHJac2xSbnI3?=
 =?utf-8?B?dXFWb2VzMmlvOGl0bDBSc2tyTTBkamtvSHYyUTJqNklud2tSd204bUxjQ001?=
 =?utf-8?B?ZFI5bjJVdWhJQTBkNzlSZHFkM2pjWVpJU294VjN0Q3BQZ2o0aWFCamlKTEt6?=
 =?utf-8?B?emJnMGduVlZkajF1SnZiK0RwMHR6bDlSSmNuaXhDM3RuNE5sNzNxMnRaS3VF?=
 =?utf-8?B?L0dtaExFSlN2aUgwbGdFaHNZcTZoYXRxOHpZUkhBNFFSQndYVENlbUxUTG1U?=
 =?utf-8?B?ZERybWtNSW5MYkhzK0pqZzJlRGNoRkpBZnhoOHdQOUlEZTdwa3lhTk0zVm0y?=
 =?utf-8?B?N1EzVUhMdUpVNjQ2WVFXVS9tUCs0TFd6MzRhNm1NdkVMaHVvQmFCOE9qTElw?=
 =?utf-8?B?SWRaUHVRdEVFUG9PY1VHOXpRN3hWampKcGRBd2dST1F4c2xxUFM1TFlNV1V6?=
 =?utf-8?B?TVVTVjkvOGxtVkgveVVKYUV5bGdpZWxoZXVlcFF5c0czRHNySDk4MVhJTFpJ?=
 =?utf-8?B?ejBBVUNwaEE3WG1SVFBYRWpmYW9xNVoxelpGTXhTV1lOcVVGUXphYzhUTnZx?=
 =?utf-8?B?ZlNrSTdWb2FLMFRYOENUOFRZQlpwNk8wUmoxcXhNOHUrK21LbjZNRldUdnFV?=
 =?utf-8?B?b1htM1F3emM1dEl1QlJtNngvRHQ0WWdOblN5ZDdWS1hiSW43aE5VTmFJa2pY?=
 =?utf-8?B?NmpKYVZlVTBlN1F2dytkOElRUXVQQzRablo5eElmMlZJM3hKbW0ycCtVVnZj?=
 =?utf-8?B?VUo5UTJKYkdLTnFhSWhyUE9pekZpRE4rdzRqNmErWS9uQU50UUZJelE5NDdL?=
 =?utf-8?B?NkJBTjVOZklaNSsrajdGcEVFSjdDTk5lS2NhaC80WUNadW8vTTJDc2ZqOXBJ?=
 =?utf-8?B?ZjZrVEcvNlJ4cG14a1NxcE1lSm5mMi9ic09EQmtaSUhOcnpIUnBzSHdMT3pj?=
 =?utf-8?B?K292THdndmhUUFQ0Y0swRXNkc0YrQ2tjVjE4djVxQ2lWSjhtcEViVWphTmIv?=
 =?utf-8?B?aVFFT2hJOUNCVFIwdkpVejBBMHRXWmdISzliTiswL2xWWmJhd05rdEhURzA2?=
 =?utf-8?B?Myt4eVk1cHZoM0MxUnJ0Q1JrSXFaV3BwcU5kRytUWHpRR0dHTkRoR0NPUkdG?=
 =?utf-8?B?OHNGRFZUMkNiUVo4RUl5Y2Q1QW1HQ2hNTkpZNHFKQUF4cjBpWnFLdXcrTi8v?=
 =?utf-8?B?eTFtNGYvejloTy92bm1XeVVMNGY4MmhDRFhTWWswOC9RMU5tWFJuSUxEMVls?=
 =?utf-8?B?YmdPQThleEVrMlpMMjdxeURHZ0ZRZ0JncFMrSHlJSlBrbXhyQVJXdC9pYkVQ?=
 =?utf-8?B?My9zak1Fa3N2aFNEYVBPWnVxckE3OVg3cHkxblpYbTlSbnYxRkl2eHZDSFNF?=
 =?utf-8?B?TDZpa213SDFmYUR1c3U1Q3p4SGZKL2IwZlpIb3FZT1lFOUg4ci9xU3FVZ2pL?=
 =?utf-8?B?aU05WFVCUVlmQm9DempmVDBacmxkUzRzYXhmd2JIY01qR2ZhZlJDVDYzM0pG?=
 =?utf-8?B?T01Ld0xZWERIVnN5eWNKZk4wWitJTGdaVUtDRzFoWkViS3NIOUNYYmswNHl2?=
 =?utf-8?B?N1VNMDZRQmtnNlpLZG5wZy9MaVJ0UkwyTDU2UE90MGlDdUdWQ2F4Ukl5WUlP?=
 =?utf-8?B?VUc1NzFGUEVhOUE5eko1YmgxOWpLb0tmY2UwVlFlcUJ1MU0vTGZJcjFLTHZD?=
 =?utf-8?B?V044MGNkUHczbi9hU3pYZVJZb0t3WVYzRWdiU284MHZVK2tZYU13VEwvcHRq?=
 =?utf-8?B?TXRJN3ZwY1JTeUxLcndQdnBFOWpBY3VjSFIwS2xkQ0JLbkhwb1dLYWxuN0RB?=
 =?utf-8?B?Zk1MM2NvTk9VaEI0Mlg4cDUvODhuOE1VZ2lQaDVKN1ErZzhzeG1scHcvbFFy?=
 =?utf-8?B?cGxOWml3ektMZjg0eStjWXNXQ2lJNFlRMFE4emFkTEE2RFduSnBNeUNtMUNZ?=
 =?utf-8?B?d0I3bU1HUzYzeGNueDh3UGdzd1RYRDJuMU1tUm12WWU3NzdTMzNyRkVhSUY5?=
 =?utf-8?Q?qjo8vpBiCKvuf+SDG0a4Y3T4w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f8b1fd-57f3-4394-5d8b-08daf21d6a3a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 08:42:17.7779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xexnsUkheh04hithoZeuD2EQvbz2+ufG/K0Yx7rainbDrLewa8PD7zxw+GUW6bLWViECzZWZeiPjVMH4jC81w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9481

On 06.01.2023 02:02, Andrew Cooper wrote:
> On 05/01/2023 4:04 pm, Jan Beulich wrote:
>> v->arch.paging.shadow.shadow_table[], v->arch.paging.shadow.oos[],
>> v->arch.paging.shadow.oos_{snapshot[],fixup[].smfn[]} as well as the
> 
> fixup[],smfn[] ?

No. See e.g. shadow_vcpu_init():

    for ( i = 0; i < SHADOW_OOS_PAGES; i++ )
    {
        v->arch.paging.shadow.oos[i] = INVALID_MFN;
        v->arch.paging.shadow.oos_snapshot[i] = INVALID_MFN;
        for ( j = 0; j < SHADOW_OOS_FIXUPS; j++ )
            v->arch.paging.shadow.oos_fixup[i].smfn[j] = INVALID_MFN;
    }

Jan

