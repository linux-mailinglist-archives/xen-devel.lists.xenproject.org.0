Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F258F761C4A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569753.890797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJPN-0002Tu-59; Tue, 25 Jul 2023 14:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569753.890797; Tue, 25 Jul 2023 14:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJPN-0002Rc-2F; Tue, 25 Jul 2023 14:53:05 +0000
Received: by outflank-mailman (input) for mailman id 569753;
 Tue, 25 Jul 2023 14:53:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOJPL-0002RO-Vb
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:53:03 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f419fe0a-2afa-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 16:53:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 14:52:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 14:52:32 +0000
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
X-Inumbo-ID: f419fe0a-2afa-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sl9mJzCwpY7uoyPwhPLfYUeNJw2YuASmYw9zkR7JpWhv9l1xFJAsFCSURSDIT1x+WXw1HNyQTdKuI6h2sPZeuME5ExQmMxR6XukUN8MUp9frerZ41vZHIpysrPiNeCR0WkFlefx+XGAba7V2+pa8Ss1PIZXuR4l0GI7X2NbZvZHqJ72Im+cTUf7ljPv3OrU/VA4dythoMqdhg6YvDxzJ+zL1toWse//FOn32X/+0Xqe4YRbJUl7hIS91qvljyihBXsz623xr9IA9b+bmuXdvGQH49dhkNuDJEWwbW++22vkzjtKobcvhW9azJXhIWS9bwVH9XmaY+oiP9cwXXEX9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9ZB3Cp0sgSI1qvkZRQIy33j9qWeKYMHFTtR0g54CNc=;
 b=aQGUGIL1BM43VF7i/2BXR4KA2+aIu2mchWXhGpDdV5oL7Xn1MP7FpjaTn3ZGiGpo63fdF4CFuhAzHbmij4o3L1wcs7iBM86nfHbTOTjVeeEwWIRBnvxK7EsAOKGiyQWvVSNqsDJyzO2IRVoc33p+hXN5qIzCK1ha01nNeptec9NDowSRDN/gkyFMs15WhyIbmHctlWDLg0FTKxvzcVT9cYGauDbkIK/z2tTtGzL94aplMWPVl/N2AXIvNlHmvsgPRCwsJy/o8LFJJXmK8TkG4P4L6/2SAZkRB5h7CJJiwnwB+5gBeNFp2KIep5/ISojSPYHZ/V3VZjhGXr3+CzkIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9ZB3Cp0sgSI1qvkZRQIy33j9qWeKYMHFTtR0g54CNc=;
 b=KivcR4/u14NxCKW/yy0B/oLCGpG545UG6vFsRAAhNlTBhsLkp35wBEY1kht6YGErE+Xmpg9LzIf6n+wUWGh12ZBt9UW5eeCjf5JvkqxuYPinmtnr9FUXEF90QwMPZ3quhDYNGQomIAEWzUJyvpaFm2DpE8SJEUKn4sS5tuVSs7gw0MUE2qi/Bqt+5N1m1MAjdVCEmbB77tkJbxNW7U+deb5pj5DVLFy9SS0wmi+hd0zFYbkO7vln9qNHZG9ao0J2gAfZVGMwg+ME9bp2QvEGPce6l/dpRaEpAwGZIUSy3CKOJk7cT/G7j5aiPs35/ZuchX4dTo5DdZaCwA/+XAnBdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a30cc1f-79fb-f202-a602-3645de619825@suse.com>
Date: Tue, 25 Jul 2023 16:52:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] xen/sched: mechanical renaming to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <0b489f53751f8f7e80a7be85eb832f90bcadcbb0.1690272371.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0b489f53751f8f7e80a7be85eb832f90bcadcbb0.1690272371.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 7742f871-66b0-49cf-72b5-08db8d1ec661
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LtaMDBvon5i2hivg/g9dC2XyIwWjeJVSsSGexSCq8b0WtziHRfF9qntJTm/naEkojtLcQakcYchakZyhDcPZYfAE/CFz3ojZNqFYF4z4dCy11XZLissBQXPRU9SgGVOG+4D8+WguGped4SYK/unTLE1vqnbdPfjTQqgZHWWsBhov3/f2eMNefG/BTrHQDSB2t6nyOtpiVNbfc5d0f/EMdhyoJrSEpfc0olNpuH8kwJ8Kd6+LXBjmCVf6a9i/tHYmW04B8Fnqd0itEAw+W6io1E0jeub+iD6dQknnsKBz3T89K7ubudtVC/LY7juZSpP6Vgjb/SXTryDcEC7XN92RRxl7Sxu0XFK+gc5X+pCCJ88tUQxJsYYu0cEYEEpAHcyFQzlL/kGyGGvWLtLzuoa9OEgyCI0nbGfh+Mc1YPwNgNuNKUoa/5BVChuGr05Hwb4bttev/nBLBXGGeLdheRxIiH2UtBh/lYNnVJyX3mmn9lnp39ypEk8XDnLASy46yavSMQbVxnFNcB6qaGHpHAMvVcuTE71pwi1MnF9LFa0eT5OP3WF29Sdifm6Rp0wMntbANKW7czdjiCIyzw5G5cXc3P+6gJyjL1ptT/PSW9Ecx5C4atxe6vgwW8vNepeKjVasNmBZZPRYqgQIY9yFPcVEqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(54906003)(66946007)(66476007)(66556008)(6486002)(2616005)(36756003)(83380400001)(31696002)(86362001)(38100700002)(478600001)(6512007)(53546011)(26005)(186003)(6506007)(6666004)(31686004)(41300700001)(316002)(5660300002)(2906002)(6916009)(4326008)(8676002)(7416002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEhwU3R3QXk1d04wcFV0R1lkSXZzNmVKeFFVNC96K1VXSzhtbW1MdHpMdVRE?=
 =?utf-8?B?WlZkTlZCVnZTeGhpVmY1QW05cG01UjJxQ3RBdFFIZndzUUw5RkFvc3BmbUxH?=
 =?utf-8?B?aUltRGNlb1N3VVo4WnNtU0ZZY0pRTUZYRVdRYlNkSzdNc0pHOTQ5QkVzWHFm?=
 =?utf-8?B?VWlTMktLbTRRWVRPbXExaGZHb0greEU3WFNZNHg3VXN6RnRlU3AvMFNlSWJr?=
 =?utf-8?B?bDkxM3hEazk0MkR3aHAvSlBHRGRlT3NvMXJVY1k1WHZETTVnZ2FZcnVwWnY0?=
 =?utf-8?B?ZWhwWlNrYTVWbTdrTGJ0QjVGK1lXc1kwWVg2bm9iOUcxQnZJMVBJNGcxTk40?=
 =?utf-8?B?UmhvR0tQN0R5b3g4SHN0TndCL0RxVjE1YkhGWUJITjJQenQ1cEJpWXdUWTJY?=
 =?utf-8?B?Nk9DL3JxU3l6bHk4RTJHZFVMR3pMSVYwR1lZWDVsa3MrL0wrdDZEaWFSQURX?=
 =?utf-8?B?cEhLaGpuTjFRd2RVZnBPdy85WUNWZlZ0SjlUQ2RoTVRjcTJmbERBRC9yd2JM?=
 =?utf-8?B?QzJhMk4zNFp3a09QSEhZK2NCQTAwUm1YNEVyYm03ekpLdm4yZGFhRkFTT0hE?=
 =?utf-8?B?bmpacEsySkNOcFFhdkFDSGNtMjJScG4zRVUzbVE2L0hEbXIxMkRjNkdzY1pl?=
 =?utf-8?B?dlBYZ1ZVY2RIdEhZSTIxREt1cG9PY1JJN2xLQThlNE5WQTZQcS9VdEJhUU1U?=
 =?utf-8?B?MTB1QkpaR2JDTG9PcFFHaDVZbXVFTSs3dHRyUDRyZ2djSlRtZUp5NHdlYVZV?=
 =?utf-8?B?N29qRy8rbkxPR3M2RkdRY0VwUXlMb2MzYzNRVUJiSjgxMkRvSFNodUJDMDMv?=
 =?utf-8?B?K1VKdHpqbktzdHZhTHhyZUoyTUVuQ09tdGRGTnNsdjNiVS9BQytrZXZEcWdk?=
 =?utf-8?B?d0lGVUhTTi90K1c2RWduUVJxRGZHWFVKUzMxRUh4UkhTTkJrdmJyOXRKVzRu?=
 =?utf-8?B?M21aM0xJckg4S1hRbDZVcWdyTHozWlNtZHhlNmNuTFgyZWRMdUUzSkNhQmMz?=
 =?utf-8?B?NFNzZEwybFZYYWVJVnZJeHo1Y0E3Y25SWnR0bVkvb3NIZnF1V0IrcWJ0REJ3?=
 =?utf-8?B?YWJhdjJYdHU4SFNYZGVFRWprYmIxQVB5QTZGWEdwOW5SZmdENnBGZ0poT2RF?=
 =?utf-8?B?NnJoaXM0Z3VEZVdqd3ZaSlk3ZFNlbFFBenJPSnk3aURZd3lYM2lIRFNMSWQy?=
 =?utf-8?B?SnNhR1NzV2J2dHk5ZUxZTTNHT0lMRGlicHNzWGlUTkJtMWtHWUFhdVlhQmNm?=
 =?utf-8?B?N0VLcWxCdTd4MGlBQWk0ajRuYjV3Sjk2U0hFdUJOSnhsU0lESlN3RGxXM0lu?=
 =?utf-8?B?bGJjaDB1VWRYRE1rbFBFSUhkNWVLWGt6MCtnekkrbzM4cTAyMFJTeWZzT1dq?=
 =?utf-8?B?K0ZvV1VmNHUxRlZXWVJ5ZUNSL1lFOGFvUC9HME00WEtEMVBpWCtFOTExZjRM?=
 =?utf-8?B?S3VVSEpZLzM1dkVLY0tHaEZkUjRIWWRYLzlXcHhoZlNhS3N2SWZZNzV5cWEv?=
 =?utf-8?B?ZkNhN0NuTU9tb05MZVMyYkR1U1FEcE5nQ1VsOTBqSnMrTC9XSDNKNUErRGZZ?=
 =?utf-8?B?NURCMmsveEYrY3FjTHNCb1RJMktFZ1hjK1oydlRYc0ZkYXR2MHFnTXFYWXlQ?=
 =?utf-8?B?Z2V0bCtKZ09Ma1hISi9PMnhUbkFEV3BHOEtGVklBRkJvczlCeDFhKzB3WHkz?=
 =?utf-8?B?TXBaYW1qU1paVko5SXRVOHNMV0NrKzBoMkdmSTZjQmtYWDg4U0J6TEg0NFVq?=
 =?utf-8?B?NHVPb2ZmaWdqL1MyZjNkN2tVM0ZGRzFDemswNkxUQ0RPZU4zak00M1JML0xM?=
 =?utf-8?B?bGRLcmlRU1FsZU1xS3NVcHZKeDB6ajRQRlp4cHpsOVVpTG9TRmxaQXNNbjlT?=
 =?utf-8?B?SC9VclQwOFJLd3RCWGJ1WWh1eGxLYUx2bUllVEI3NTExQW12UWs4ZEYxN1Ni?=
 =?utf-8?B?OGlPY1F3dGJ3MHE5ZFRnblZkWjZObkFRZ1NlNTdobjhnWDZwdjJZZWxXRk5R?=
 =?utf-8?B?V1ZvZU0rOHI5QWlGejlXVnRiWVdvamQ5ajlWOGRpK2gzRDlhNzlCZ1JiU3Zy?=
 =?utf-8?B?dEU2bFRzc1VTUi8vTGl0VktmTnZRYk1paWhaOEp0ZUxscHBnOHRKbENpanFU?=
 =?utf-8?Q?WluqOqz/xkE8lXtFYDlrE55cf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7742f871-66b0-49cf-72b5-08db8d1ec661
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 14:52:32.1173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aj5cOngI8YxTLAhV9gUbmbgHMV63u/HY3WjMekbqE+xr9Ron3faEuTIm1gHkI8Pa47rXeP8vC11FTF/7AVJghQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

On 25.07.2023 11:08, Nicola Vetrini wrote:
> @@ -99,14 +99,15 @@ static void sched_set_affinity(
>      struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft);
>  
>  static struct sched_resource *cf_check
> -sched_idle_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
> +sched_idle_res_pick(
> +    const struct scheduler *ops, const struct sched_unit *unit)
>  {
>      return unit->res;
>  }
>  
>  static void *cf_check
> -sched_idle_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
> -                       void *dd)
> +sched_idle_alloc_udata(
> +    const struct scheduler *ops, struct sched_unit *unit, void *dd)
>  {
>      /* Any non-NULL pointer is fine here. */
>      return ZERO_BLOCK_PTR;

These look like stray changes, presumably resulting from you not fully
undoing earlier changes.

> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -3809,7 +3809,8 @@ csched2_dump(const struct scheduler *ops)
>      struct list_head *iter_sdom;
>      struct csched2_private *prv = csched2_priv(ops);
>      unsigned long flags;
> -    unsigned int j, loop;
> +    unsigned int loop;
> +    int j;

This looks like a stray change too, just that it's unclear where it is
coming from.

> @@ -3884,7 +3885,7 @@ csched2_dump(const struct scheduler *ops)
>      list_for_each_entry ( rqd, &prv->rql, rql )
>      {
>          struct list_head *iter, *runq = &rqd->runq;
> -        int loop = 0;
> +        loop = 0;
>  
>          /* We need the lock to scan the runqueue. */
>          spin_lock(&rqd->lock);

With the switch from declaration to statement, a blank line wants
inserting (to separate the remaining declaration from the
statements).

Jan

