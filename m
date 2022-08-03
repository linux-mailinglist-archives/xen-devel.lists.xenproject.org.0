Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23635588845
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 09:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379610.613192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ998-0005oh-Kp; Wed, 03 Aug 2022 07:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379610.613192; Wed, 03 Aug 2022 07:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ998-0005lv-I8; Wed, 03 Aug 2022 07:50:26 +0000
Received: by outflank-mailman (input) for mailman id 379610;
 Wed, 03 Aug 2022 07:50:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJ997-0005lp-Gg
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 07:50:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140058.outbound.protection.outlook.com [40.107.14.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee855b4a-1300-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 09:50:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6076.eurprd04.prod.outlook.com (2603:10a6:10:d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 07:50:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 07:50:20 +0000
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
X-Inumbo-ID: ee855b4a-1300-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oiytix/dJyyeMv0CLWwz3zT13+1FmTy0Zp+/ig+YA2V1crEmX5GEw2/7SiHclKPws2dGWnwwdA2AWgIVlplQTl9CAHPjJYR0/vf0ZLlL6eaCEBxCFavCrvlO/47be34gChf1y3ZuwtxzFlK51Bf8tbK2Txm7WUcbvascO3+rLebfZevjI73mBFdZfJR7zI82Mu91JKqe+lmL6ABZWpuigGGQ252tSdbIo/3//WHyv2WsEKpAxAJnJqN0M/zBnaIWASA6VcD2mSpq+a7xYxjYMvuDwzXazyqJqtEHjFlsVwqTvFWPsK9M7LF9olv13P0qvpOsLSGXzfpXnjwkQFni8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IA2FWrZc0ZBmU9i3X9RwKpZ3EAF95UEhHUzsTdGHfG4=;
 b=E1fUSXEsPucuC33foCkAzGM14q3aJqOXhWtkStxdAO817ThOQFz/V04vzxMv4s8B4mwhFsTyag3+ElmbKMIhI+dGQBs6OS6KARuv5EEP8cm6r48JZFvB6D8CWBaXsb5nBRKqTXB8N/A8/O2qch86OkE0KelQCdrXRjlwqCET6ltSDIV61/SKrXH0zA+HZTPpNVgnJj2GTFAYnaEkSwRMgp8pCB/H/inp4Y4bSsBVAew3H6ZyN+EVzXgAv65S7nvLpkJ6kxie8RKK35b8zQ58cmj1N9LDMQkKB1H4y8kwolkO8AU3eNelQhYAscPdG+Pb/II1osibbPoFnSwtl3pLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IA2FWrZc0ZBmU9i3X9RwKpZ3EAF95UEhHUzsTdGHfG4=;
 b=wIVb2Mv3fYmelvCDFIVbMjPjF7f/AmHRGxWMdcsHsCoTEO+YX/2SY/1hqZuD/BjwsJNJWeiW+0Gza0u5CRfw+5h9Ty5r1803M/Y9B8qjnHjJRmH/1WNpOQvG9QRTcaiOCJX8n/cZWg4p6gvNVnYllWoakyJWrYfuPKWDZRKJj85ptzsMj/zzERJ75J+j/ptnnKxyDhBLgJ7whkV51Nc588VdqA3WiIkub5wMO4RHrgmOjBPZHhIMNXWiwXgnRAtmwokYUuCtck/2rBbZNZdTzYZeGKbUfiYjxjIM6fVD75LM4HymqlLQa05nIDXNwmStItd7Nomf5YInKJaOOPfcUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <266615bb-1465-f38c-5eee-ad2f4e7256fa@suse.com>
Date: Wed, 3 Aug 2022 09:50:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] xen/sched: introduce cpupool_update_node_affinity()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802132747.22507-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220802132747.22507-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0503.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc30b643-3aff-449c-a702-08da7524d060
X-MS-TrafficTypeDiagnostic: DBBPR04MB6076:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ho1ftojZvk30J9Ew/3jC5Z9fShAVErbceOETEpYx19n6vwxsFzgpFy30PMVL+S2mm5iwlnLYocJaKm6JVo4If60ppIpE+NECKQ8IqzoMNY0NgRuV3sLbQO+O4doHR3ZHF2KFS3t+IElskJm1V+gFZcvNOvPEJR7jPIeOFK1LdY6rqDA+FeG2XVSAPwGms6TB2D1EXWHk3xkS6dzECbDGMtjXt2vgKOeeV3RVmEFenq1cHmHabJIxPaBuBa+W+uvPahmGdTpnWBJcroaXzPDSXSseQvrVj+X/zK+zRydaudEjTGGI3Yvlt7JI7bPae3tEwmcK/kYVU7vs5rOorEAdG7veEJg51HlZW37lWwdmA/KgM411B288r9K6UFkCjwfopejMI3yhzys6FIkpxN2TVmBlsOPAxC3nHlDa7hrBlTRwdw+rzx+dS639VSVWaoIjo8fBi9Cu4PMiEBTpkDz4uvNkw0uUqho0RUQEwWRFzjlLYJZKtD7DIXLkMif8gas3pSGRXz+xevLKJbk7FEpXEkntdpD06+ZbuoGzRuEhYxxMRsSjUuV7kqyYkOpBZTUoVSVWsffMJ0nguxDqfOnqVk6us2W+etrDOgMgAxJ60+bYWn0HLPhZZdtlcEA+xpKyjpTK7B4MpVUtWHQt9KChmClrB8yNVAnDA4YCotWGYXVWNC2qipqGJ+KtcDnin30UNHo8GLfVJL9zXQN8EIaY5SbkNpPtIbN4/t15cmD5Zn9sjtfwsAU2FYaifNiNbdXMvkkuyxPUFntuJRNPC0O6RpQMqRYYK4Hgnt2KXWhvV7/55jMeSeKaHnEZe/wS00pr0HYylR+neNFvxqkRt69cZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(39860400002)(136003)(376002)(41300700001)(31686004)(83380400001)(2906002)(2616005)(86362001)(37006003)(53546011)(54906003)(6636002)(6506007)(26005)(36756003)(6512007)(38100700002)(5660300002)(6486002)(186003)(8936002)(66556008)(66476007)(66946007)(6862004)(478600001)(8676002)(4326008)(316002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3BrV2N4YmtEOTdISVNQZHFDSEdLMk5yNzh2K3BpYjYwVU1zQXpUa1pPRHBy?=
 =?utf-8?B?cU1NQ3Z0eFhFamxjU3E1NnYwY1pza1lkcy8wWTVDekxoRHhHR3ByTlBRME5j?=
 =?utf-8?B?SitKc0Y3c0dBRFVFQjhRd0RrTmdrb3YzOHJ4K1JDeW5iQ0hTMWRRcDU2bThv?=
 =?utf-8?B?YmkyMFRrV2MrVXArRDNQd2x3SEJMRlVGTmZMVkFVcWZtbW5vZ3NGY2Y3ZUQ1?=
 =?utf-8?B?R0M2NDY2UWFNZFpHeFczRG84MXJIRFJpRmIzMDZyWTIxeVY1TGYxQUp1NGx2?=
 =?utf-8?B?MjVISno4bWRUVWQvelJKSXdoNThkZExhR0QxRFFOOHRmR05nVHMxYkY5cXlB?=
 =?utf-8?B?SzZWNUJNS2lMbkxMdFk0dm1BSXQ1Vzd6L3pTdnJmV3U4T3VNS2Jsc3JmMTVI?=
 =?utf-8?B?UGpSc24xL0V5dVJHM05UMnE3RkhiQlhXU0xvSVUyaW43T2plVFBYT1BjSDFI?=
 =?utf-8?B?OHVxaHkwTFZHUlpodlU1WFFLZkg2c01QMGhVYkZEZDVpOWRSU2VWWjVnNE55?=
 =?utf-8?B?VVA2L25NaG9ydmpacVRzNFVjWDdkclVTSDd3S3lGM25Ud2ZjM3dqQmpTUVBM?=
 =?utf-8?B?WkdROUtwbzVRMlFMUXE3RFF4QkM4UnpqUkkrLzRpeUN3YjhNMDRCWXcrMGt4?=
 =?utf-8?B?QlZRTFkwNnZLMWNFaXc2RS9YYnh1cWJxdXFqaWJuWHMzSWpBb3lUU2FHbGFZ?=
 =?utf-8?B?Zjg1VVVxVDBFcXZuTzhiUVBScU1kSlJHUUpoaUFJcE9QbVl4dzVNaGRJRkRQ?=
 =?utf-8?B?YkdVWitic1BDN0VFTzNpNEhlNS9yVVhJa3BBR2J6MENyY1V5azZpQkIyUWFJ?=
 =?utf-8?B?cXJZdkhFS3BCY1J2TmJjMjNmcFhQbTl2OG5NSEF0V3k0Y1plVVFrQkdxVFIz?=
 =?utf-8?B?LzdqTVVyVm4rWVRwNnp6KzFzeExDdHgrdTNqZ2pKWkRPYXpEZGkwMndPMHMz?=
 =?utf-8?B?WFROeUZQS3Y3VXlVYndUNmdrUG1nQ1dYdml6UUF4bnNnTGIrUGhCeGxlRDNn?=
 =?utf-8?B?cjJNcXBjYmx2dVNMZXZzcks0aFBTRjdsdnlHT255b3d3bXh2ZkxpS2cwWGhS?=
 =?utf-8?B?bWY5ZTV3SHQydXkrcitSTnVnK2tRUU83clR6bXo1eWx2dVRlNWlpbStkQStm?=
 =?utf-8?B?WjRoT042cUg3R1hyTUdvdW9zWFl5azRqZ0h5aFE5b21iOHI3VmJ2UFppWHFa?=
 =?utf-8?B?ZDFOOTYyQW1CNWh4U0lHOFo0Qit0VVB4ZEJhR1g2THdpazZxK1NJWWZlclYx?=
 =?utf-8?B?d0thZjdEV2M4Y1drYlhxbnRUU2dCTDVzTk15NXZaWFVQaEo4ekNIZjltQVA2?=
 =?utf-8?B?ZGtCSnRZNzlQb0dZaTFzK0Q3andLTVhIQUNDd09yVHJmWW8rZDFyQ2tmRDEx?=
 =?utf-8?B?RHRmR2cyajE0M1N5SnBiV0dMd2FzVmVvQkkvaXRKOVVkaU0weko3QytDa2k4?=
 =?utf-8?B?Z21oNFhVTmszM3cvUFUwazZ0OXhLTngrSjZTNmFrRm9ybFdOLzJNWmowelBM?=
 =?utf-8?B?aGFoUTIwVHRYM1gzV1NFWDkxcWZVQWdxYkVEc3dHTEZLeDJaZHNQaHdCR2c2?=
 =?utf-8?B?ajllM0ROVVQvcnQxY0FWVW9KK3hidWdzNzhkR2Y3MFlibDkwMTlLTWl1QVJS?=
 =?utf-8?B?a0RJYW10OG0xeUJsVldienBHeUlBaTREbzlOeW1adGt5K05zUDdpS3dSWjNv?=
 =?utf-8?B?WjAvN1ZnYVI5Y0ZuWnczclMrdVNNdmVZNWxrazlmUkJ3aWg1QitZRmNRaU9z?=
 =?utf-8?B?Q1VTWUlvQUVLT0tuMUxGdEJjRTZjamtHSjhZbksycThrY1RwbkRqbGNRYmEw?=
 =?utf-8?B?bWNvdTBhU2wvdW0xVHlpdWxDNWJTWDJvWHFnS3RCa0MzZVkxRVEya1U2N3Ry?=
 =?utf-8?B?MkNFY0l6VTlvMkU3L3dPKy9Nang5YXZJZmh0WnI1V0lERXZGckdidTF2S1hP?=
 =?utf-8?B?NmJrWnB4UnpvOXhnNytFN2trR3dmaVJCSE5BSm5RcFI4ekF4OHFBT0VkTVlY?=
 =?utf-8?B?QkRZS01LZVI5eXg1U0JaVkg0WUViWnRpcm85bC9ndUhueGVlKzVlSmJZeUhM?=
 =?utf-8?B?TTRYbng1ODZxaW9Tb09yZlZXREJCL0hudGdjc1lsTXQvMHhoUmlodlVHMDBU?=
 =?utf-8?Q?Jgq3BKcvl4d+YnW+IG50ISsmd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc30b643-3aff-449c-a702-08da7524d060
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 07:50:20.2864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0nyTEuD7vTI4lPD/jxQhnTRjg5lc+0L9ctSuW21LJIFzzEXU+EbOCN0pPQ8G3gMVtMsKIpUiSXj06AkWRmLPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6076

On 02.08.2022 15:27, Juergen Gross wrote:
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1790,28 +1790,14 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
>      return ret;
>  }
>  
> -void domain_update_node_affinity(struct domain *d)
> +void domain_update_node_affinity_noalloc(struct domain *d,
> +                                         const cpumask_t *online,
> +                                         struct affinity_masks *affinity)
>  {
> -    cpumask_var_t dom_cpumask, dom_cpumask_soft;
>      cpumask_t *dom_affinity;
> -    const cpumask_t *online;
>      struct sched_unit *unit;
>      unsigned int cpu;
>  
> -    /* Do we have vcpus already? If not, no need to update node-affinity. */
> -    if ( !d->vcpu || !d->vcpu[0] )
> -        return;
> -
> -    if ( !zalloc_cpumask_var(&dom_cpumask) )
> -        return;
> -    if ( !zalloc_cpumask_var(&dom_cpumask_soft) )
> -    {
> -        free_cpumask_var(dom_cpumask);
> -        return;
> -    }

Instead of splitting the function, did you consider using
cond_zalloc_cpumask_var() here, thus allowing (but not requiring)
callers to pre-allocate the masks? Would imo be quite a bit less
code churn (I think).

> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -410,6 +410,48 @@ int cpupool_move_domain(struct domain *d, struct cpupool *c)
>      return ret;
>  }
>  
> +/* Update affinities of all domains in a cpupool. */
> +static int cpupool_alloc_affin_masks(struct affinity_masks *masks)
> +{
> +    if ( !alloc_cpumask_var(&masks->hard) )
> +        return -ENOMEM;
> +    if ( alloc_cpumask_var(&masks->soft) )
> +        return 0;
> +
> +    free_cpumask_var(masks->hard);
> +    return -ENOMEM;
> +}

Wouldn't this be a nice general helper function, also usable from
outside of this CU?

As a nit - right now the only caller treats the return value as boolean,
so perhaps the function better would return bool?

Jan

