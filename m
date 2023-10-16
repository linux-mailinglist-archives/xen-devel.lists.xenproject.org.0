Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271F67CAB7D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617667.960487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsObJ-00062K-FP; Mon, 16 Oct 2023 14:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617667.960487; Mon, 16 Oct 2023 14:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsObJ-0005yq-Bp; Mon, 16 Oct 2023 14:29:45 +0000
Received: by outflank-mailman (input) for mailman id 617667;
 Mon, 16 Oct 2023 14:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsObH-0005yZ-KP
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:29:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72084800-6c30-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 16:29:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9053.eurprd04.prod.outlook.com (2603:10a6:150:1c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 14:29:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:29:38 +0000
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
X-Inumbo-ID: 72084800-6c30-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7u0KAxMoOPGqIdPtG4rttP+iX79/fhAbNpnKrG6k7PbsgIOWnVSm5trWQ6bDM4v/UQSAIexnAhGLtgjjKerpaZyEmlPiev6tB/A9zJC8gtzWRkrA1FdlRE/Ym1fHJWiml4e5twaWyqgr2YIeDl4Cdzc7niWstHUZ5e9+1Cf/0xYmAdqApS5NgqcMwgCJ+A2ufM4SgbJlw4h1FXuzP7wndhllPQ7nPkys3l/ZS4R5Qzwy3pyRsWHjzOejGJ04BY/kIKuKTqntURh2W1wVCRrIeNvQuhSOpmqm0x99Lch2ANtt1gY/BB40XWlAW+Ccar5cM7dhjMq8pn512X1b9G5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpkl2vlC2MPaue4A/8TfmVHhQjlVAVjbUnPssKywBqc=;
 b=SJ6uoH3H+T64foAPLSgLe9yD4odXDTcnJrYGsIR28ZudQQMLPQirsxhZrWUC6uopZ2dNkqFlSMNEx3O49ViJT2CcB6aDUgDSMFwlzpLkSHgn9ujwl6avuwiWCiSu2FfmkURGi7pwJgdq2k3kRiR9RLDAeA/Fh59VOJtcL+QroGImc2W2bD4yWcMli3b7p95ERcYcrSYCy2wCagpADZmOtRiMAYrgNs3tsJAlLOvK4F4uWN9CKQy5uMz0KGxYSFhqBzrXFC5iGOfGKAuOTYmZB1BRuhPDnFyIxW97MCvNGeed+j02/0ShDi6zF0Jtko+7OU8ls2Wez30tgiDzTWTTuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpkl2vlC2MPaue4A/8TfmVHhQjlVAVjbUnPssKywBqc=;
 b=0YiFfsxyZbN/3AyQVnEGBsG5Moa23y4S+aXtvpqgH2PB2Q2KgsWTJjh2XntZzPdXUePM2wdi+3+2YT7jshfUFAIAXzfgYsnHwnbWQz7yngqII/OJI4xqgfA5uv8KSHiWBw8heePTN8vQ9PBsBCIwBOROfI0Dq1Gw1KKd0wmHq1p+5khNDjNtdHx9HdghUNVQ43Vxj2B9FzWFPWiEMVyPdFmcLghxT8wT4L6Ph+kLa5HiuAmN/8ooJY4jN95xOxJfN9Z8/L6YKOJKcP+ohNOHyIxQkuu8SxhGUd28SXut4z9hE5vn5aBWJJvPwdf+MqXSewNzlVchuLDQjOGAzQ2TjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1d7f6e4-c0d9-d79d-504c-3b676d2be380@suse.com>
Date: Mon, 16 Oct 2023 16:29:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next v2 7/7] x86/mem_access: make function static
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <f9dcb169ad472fe888d6a03234264ec73e290df9.1696833629.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f9dcb169ad472fe888d6a03234264ec73e290df9.1696833629.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: 147287e5-984b-4eea-0f09-08dbce54540f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xsUTd1qPIIIrIMcnw4LDMgSegI0obv+phHNqpLJO0Prlow2mj1XAJw7vcFBc3iQW+nQKOparzvUneGLc9Koa6fJU3L7nWQLtI4/Z0w46QviPsHnkwjm1eoYKFOUtLPmVV5BV2khxa0T3WuP8NmsoDnKY85kAtMK2ZsVPviK5m3fxGFewpzyTt6pmpfkYC3BU3avUFCoOlHuxuWiZFD4sjVvO4hQ+4YgHLgfXhoZV32WTgMazwjGjvQAdLg8IuInACZpJQl19tmrgLhGejIHUE2pctuTtjWR45rVHxw87+xg/EUm69lJQGWS/gtSfC3MRwaxvaTd+VCPdDX9/ajtfgV91u0PXLUtq1AKkqxGS2jBcKqx8NsvRxwG8Uw/h872uR1Y2eHYTFeh9kxVdUqkAZvAG7ofP300iVdmmNGG2NTOCj+KJBPpdCd3+TdpJdtfw2ZJofoB0rfmHbwDH8ZTvHc43gwS/HjMTWha7q/MP1dZ6R1hvj9xkdmQ9tFEgaJh9texwpKcL9q9b6kFYGHLKi6mWns7rlrSAny/Ba3KQDpLf9sst8KEWgdfSt9bg28TGW+Hd231vtAm8R3vMhVkXryTmnQKjmwW/SHnr8kcE0SMnxIAAwrkFIxU+qYApNwVpLEYCVIZIEmKE4B21ARI0Ag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(366004)(346002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2616005)(4744005)(83380400001)(6512007)(7416002)(54906003)(66556008)(66476007)(66946007)(8676002)(4326008)(316002)(8936002)(6916009)(53546011)(41300700001)(6506007)(5660300002)(478600001)(2906002)(6486002)(38100700002)(86362001)(31696002)(36756003)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU9SQ1QrMWJaRnk1UHJvS3J4OHoyUWNlUU1JMTJ0Yk9tanowaTVCOWNnKzZM?=
 =?utf-8?B?eUg2Y0NZNDZ3b3dNUkxDU0dqNXN5U2JUVVROQy9mZjA1ejQ1bGV1eUxkbFZs?=
 =?utf-8?B?Yi9lSjl1U1hlakpzT2RTMkZ1ZHVkUUZWMHZxZ2FXYWlIWHNOdVpPQlRIZEd4?=
 =?utf-8?B?K05zTndYMzk2djdiU2JPNVRvQlNMaVNnZkFHQWpnTE8ydkdWbFZqYlVWMFhk?=
 =?utf-8?B?VlJLcXNiVTZIREE2TUpqeE5GSTVnSUdoOHNCeWxOZlg0aGQxUEYxcnlZdmxD?=
 =?utf-8?B?encxMmRGbmNLQ1plRXBVa3VwWEJsT2V3OVVFd2xiK3ZnYnFBdk1xQkZRRWg0?=
 =?utf-8?B?MGxYMGIrdzdCMUR1SFErT0RFck9adyt0Sk1nK0dsSWpWVW5hUFhPSzVlWjhj?=
 =?utf-8?B?bE52WDZoUGpkQ2FwVHdGT0N1emFTbEN3b09PMyttOXg1L3V4ZjRjbWhOQkgx?=
 =?utf-8?B?d2l0M2h1b2tZaDZ2dGlmM0V0NkdlaXBUanVWeVBQbE9oMnc2T1FMaXFwdjRZ?=
 =?utf-8?B?U2REVm1jWS9KTkh1VUdMWExKZG54Q2lPVUo1dVNmMU45TzV3WmNtUUVUNzNh?=
 =?utf-8?B?dFcwRlRjT0JVa0NYRkNidFhWTlBsNG1EbEVTM0Z2K3ZzQURvckMzQUVDOS9h?=
 =?utf-8?B?MSs2dit6T2w1eHZCRzNUSW5UM05qQ2MvVzI4NDZ5aVFlY0xvSHc1WE0wcHpO?=
 =?utf-8?B?UVVkVk1vK3FjS0xwVkhFTys4elJOazZzbzljM2VzMWNza0ptVTVoRkEvekRq?=
 =?utf-8?B?SVdzUmlpZzA5TkxXN0EyUWlaNkhhT0NOVVMzWnFwWmRGYThWNEo5Qk5yVmpt?=
 =?utf-8?B?TGpSUTVkSUg5d25qZTUvd09jSU9udGdhaXQyMElMRU5QTStsSHU1TjRXNlY4?=
 =?utf-8?B?RHBnQ29hanNXcVBDUkI0aDV1NFZlWGVBRTdUU0duTGdYTThTN0RVSG1nQTlw?=
 =?utf-8?B?SkhkSXFIaDAxR253dndtTW1uUWdTcTJNZ2d4d3VNRGZhc3AvMFl5cUJCNGp6?=
 =?utf-8?B?dmJuK1U1UWJaaFN2TXBiZW5vUjlndlI5SmwySHQzNG8wbTJVelRETVEzc08r?=
 =?utf-8?B?RHluWDNEN045Sm41VHNmTlZ4N1haLzRVYmswTlY1aTJHSVBJbTRQT1ZXajJq?=
 =?utf-8?B?OXFQeWdBSTFvQWZwV0srV3JMcVFCc0lKSDdlTFJUSFlnYUgyYm9sbStKdkp6?=
 =?utf-8?B?MTdoMWtiUGtPZU9oYzBnSDVCanJkcXF5QjBUTVNKTE4zTFphQ0QvRGc4Mmkx?=
 =?utf-8?B?SHFISm55eWpocWFvSWlCb1luRmM3a2NMNCtucWR5clJBVHd2MCtHam15dXBq?=
 =?utf-8?B?UnVoNTVlMnlKaHZ6V1B0M1lETE9ZRkQ2VGQrRG1hTWd4Nk9HTlpyRHkzSWs2?=
 =?utf-8?B?QWlKMnRpRm54dTgzOVFnaUU2WC9uVEc2bXEwdEJpVWprckJ2OG9naEtVNS9X?=
 =?utf-8?B?NjdIYURhbHROeS9US01SK1hzR0NKY05PMkRJY0hCTlJ0aXJrQ2piUzNnQlRE?=
 =?utf-8?B?cC9rYTNLQmNaeU5tQzZoRUptUDN3TEZhTXRVU0YzRHgyNkZIZUtORUd2WGZX?=
 =?utf-8?B?YnlscDROWWhDdGVFcE8yL2tNVzVMQVcxZjRFeXFtWlJGdTVYcnMyTk1PWlE5?=
 =?utf-8?B?ZEhKdW9LUTlmSkxtdEZDQUNIdjI0VWZiTUJyNnRGOVZPQkRuL0g5ZDVmM1ZV?=
 =?utf-8?B?bkNjb2duc0oyTmV5bnlCa0hGZ0Q4aElUVjZvOU4rL1BDS1ZHZXUwMnJtcW1a?=
 =?utf-8?B?VG04QjVkdnErTS9Fa2lnVngrbUN5M1FEcmc2NkxvYit0S0hqSGc0QUFPenpZ?=
 =?utf-8?B?cHlTYldOYVdvOFQvR2t5UTVzM1Zkd0gxWDNOZzI5MWRkWXpVc3pWa1FNbjVa?=
 =?utf-8?B?anNZRTUycDJ2OXRUL3ZnTkF2R0NHNUtsYjBXY0hGR1AzNmh0bjBDSXpWWjlS?=
 =?utf-8?B?Skl0V1QxSmxpY04xSEgxejdsTXIzci92Um5kbk5DL3RUQ2VtS2QvbTluMkVm?=
 =?utf-8?B?ZDMzcmNYWEozb1ZkWW1VcWtIZ0d1N3ZWdVlLRFdINDV3Y1FoakVIenB5K3pW?=
 =?utf-8?B?ZzMzQTBSWFFuS0h5cG9lNDVQL215RXVZSUpTeVQ3K00rdytraEJndXJja3ps?=
 =?utf-8?Q?SnR4wK4aT+q4fEVBpxUB4u1IR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147287e5-984b-4eea-0f09-08dbce54540f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:29:38.7128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tW66v6pt6TAmMfucbPJHG/p4waF6mbIXsQQJunzxvMYDmsZGNmNUfqGXmdbzeWvUJmBxV6wjuJAEo/Rey5dwwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9053

On 09.10.2023 08:54, Nicola Vetrini wrote:
> --- a/xen/arch/x86/mm/mem_access.c
> +++ b/xen/arch/x86/mm/mem_access.c
> @@ -249,7 +249,7 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
>      return (p2ma != p2m_access_n2rwx);
>  }
>  
> -int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain *hp2m,
> +static int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain *hp2m,
>                                struct p2m_domain *ap2m, p2m_access_t a,
>                                gfn_t gfn)

As mentioned before, when adding static (or whatever else) like this,
the next line(s) need re-indenting.

Jan

