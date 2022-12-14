Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F21664C463
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 08:31:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461757.719903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5MDJ-00054H-WA; Wed, 14 Dec 2022 07:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461757.719903; Wed, 14 Dec 2022 07:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5MDJ-00050Y-QI; Wed, 14 Dec 2022 07:30:01 +0000
Received: by outflank-mailman (input) for mailman id 461757;
 Wed, 14 Dec 2022 07:30:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5MDI-0004ye-27
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 07:30:00 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ce6d2c0-7b81-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 08:29:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9685.eurprd04.prod.outlook.com (2603:10a6:102:26e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 07:29:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 07:29:55 +0000
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
X-Inumbo-ID: 1ce6d2c0-7b81-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPAdMpijnHPzE9Or1HQYf3Ib4ZowdMJZOCIE4go0s29Ot5rq61A6mWjGGnQcPWowHtbdq/VL78sOL0321HJvxliik2I3/16JW9YY8RuKodi3u0C7wDPqOJtGDHG2d0nqwNVo1+9ADAr/gkyxZ6FCQcBdxfNkA+RNrkoc8VCoxCwIJpPXSljZ7zOuuhW9Cxev29o9Rf4YZjANBFmCDeh9UeGJeFCIZZ3W9hGtVBLxBnHG1y1ssULD2DWDlFxLUcvy7x9vHXMEDK3vmHBVukhw2pFF99igHgrbVme31OpMxLMsf4vwKgC04rnei+Q+AIEsqrx1tx1JvXtv4/bGoHpB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yzWEt4nyvMlvhXy7bhLnRWsozIpgvXnYXEUsGYqLXM=;
 b=GuReub7rqs2LdxTMLaqKQPqtAwqjhxLkdT0biOQpA1wL5HMdoP4miifAmZyjBponBGMeDbTyBPVQyiueTtjOSVRwCLfEz+BecXOYhAnL1zzZ8AIp2Y/kJx76GoSfIFOKAyhadltA3vnAsOTXhwZK2hBK5hH30PzuiSB55uCU4lrGvyFXp5cKg0+FjSwdAYb9ZIIiK2GpRG9QIKUG45BrBuKZtOxMaF8A71HPa9kNPLZmqftvVn1lm95r4bu2ZV8c0AWMZ/1v/migUtIAzFJkACWW0CG92Y6rXpjCyhcYH/ZrMfv2T/vD8g/growDEtcUjgqnLiWT2rr/kY+AYsdwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yzWEt4nyvMlvhXy7bhLnRWsozIpgvXnYXEUsGYqLXM=;
 b=ygIj5xm4zgX2Ftx/7VccHURlhhqJCd+bmiR7JUWTPLJNsBaT2p5Bo2E0iKlDN5bSC7pddCD02c5oGiS9sZC6rovp6LmJTYHFaYbTmVqzTN+/mO2dDI7HWTuk8xMCoL+beHII2K91XUVYN+mxa0kC2COehh4s3UH5auckeFBJJdzC7GaHmynTUhGHwU1XjG1CdmHg6BrcZeke98MnbjKrRmQWLHsGJOj71Y+H4rjaGyL0zeGB8u9CamxndNElTZkZFZ4DzTOkTlB7WfOvogfKV/qBLBYfQj19eGSHeNrAn/JZLuZvx6WIVgmw/Fqdg2gcnhPPDUWw+vJmZ5vde0sMtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
Date: Wed, 14 Dec 2022 08:29:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 6731886e-f2c5-4d32-1595-08dadda4fefe
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DhuYc8f3G98lHfDGsDwwhRXiXuTyC/dUbe7Od6uqrgcIaICLR3Ni6MnxJqwmyldDOxkwL2YsN9CX6H5ryOQsXiUvjxInjow8V+X/Lynf8Nl+oWbKtORO/BG4TpJEJGZqQBDlXRWRueok83zdfQFPoFABBFyWS1kye66kAZPRie1hhIN9FoB1k7HT4sU/Ac4HW/Sx6+nUD88K4RkXJXEKBYjhZvVmP/N/N+ZBNMEp0TV8917S0/iXtnpU1AzHX9VmCUkqUOwi8MoUxuc6cGNrTO0Upfe06w0HCNGZHOAdQSmghpqK5Gd7oZswOig4uAPtG9ZpY7fZ7ErFI7Q9FYlfxnIFe5UbcFn97gtfJDuLssgy/n/OeKdhXF1y7QeMs8P6zJmj+98jAmQP3VoiKUW5xTBrGJA02CC8n1p/ckQbWc+b6290o4Py9x7M/vGNBW1Nlh0RvmHvRt1Au4Ygmu9NKnvy7BqNIHfCitEik02JsnuqXSOMn6XXpqAD3C/jyOsrxLPqi6HKNuCyaijQcEFXVU1cEtap/TMQJQ2A07Pd89ujL5+KC2C8vqVGFBePFiH2FmNGy7Astrxz12/MFvNa081S0CbUr0XyAuyX94440Zzn4bymkfTDqjkGnFn0YQtcB4dV9cVwBxNS8M4+ORLshhhjJFCldzNgJOLzaTE9CD2acw8ZC0kuXGVuCQCngtW8ef8XLX8qk+pcJVQa8/kSorOR8WOWUTeJS+e0vJ0gTX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199015)(6512007)(86362001)(31696002)(36756003)(38100700002)(186003)(26005)(31686004)(4326008)(6916009)(316002)(6486002)(2616005)(54906003)(6506007)(478600001)(53546011)(83380400001)(5660300002)(8936002)(2906002)(66556008)(66946007)(8676002)(66476007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1NQcXhGbVdNbVJxNzVoUkE3cUtZNk8yZldRdjlrQ3ArKzJDU2JXeDVJZWtS?=
 =?utf-8?B?MTRrWFF3aHlnak1Yb2syMmRZdHZVcmhnMHR2YTZqbkdLREluZUxhb0gyL2NL?=
 =?utf-8?B?TjlOVndmNkpqdmtxd1d0Z2ZhQUd4WS9MeHRvM0VuWFpjVURhQ3NCWnBna2JH?=
 =?utf-8?B?WlNhbi9XR3FvRk5MTmtFL21rS1NRMVZvTnFQdUNOZHEyMTRrZFNNUTRqNVJz?=
 =?utf-8?B?ZVFDOU96dzZPbWhYQlFyc1BzbE5zS0NPRGRHa0gyV2hNNHUwM2E2ZlRET05F?=
 =?utf-8?B?VWVXTTkydWFqV3cvZjlpRXB0ZGNiVjFMVlNQSFRucGw0eU5CQTZ6NkZKdWx3?=
 =?utf-8?B?RDNBTFdaUzJjYTZXdGxyQjVvNXF5UmNLTzd6SlQwVWpjZGRyZDIzaW5BQUF4?=
 =?utf-8?B?OStUd2cxbG13YmUzcGFERWs3cHY2ZU1PMFZFYThoNlZpVGtleGkrOEgrY2Nt?=
 =?utf-8?B?ZDZ1WHBlcHhKR21zS3hiWE1IaXBJai9QMUZ4dDk4clFIc1pEdWJCcWVjTEJX?=
 =?utf-8?B?VDBTZm52YVlZWEdNeURZd0U1bmNBK2hYd2pZNEVDQW0zZXJEWUNWdVZ4czFG?=
 =?utf-8?B?Ym9OOUFmcVlVS1daUGVCaTB6a1hQTjdLQmJIS20zUmhrL3NaMGFxWjdtRUdO?=
 =?utf-8?B?d2c2NFFlNlQ1SDdva0FpdnlYSjV2aHFmSnZpOGtab3NlL1RCUEd2RkJvUFVa?=
 =?utf-8?B?T090Z3Z0bC9QT2NBdks1Y2Q5SmNySVRNSzZEYkNXeWZ4ZXlpMDZuY3EwM1J3?=
 =?utf-8?B?WFEzM0tnWEVoTkFEYTlXREJGSWE0YUZNYVVkU1pjR1BuUTZ4V2FXZEkyZDZP?=
 =?utf-8?B?cEZ1MmZRN1BBdVVQYkQwVnpkUGg5cWtIdStKUlVCZnkzb1FISHlFSWtDNU5N?=
 =?utf-8?B?cms5T2MvUFVOL2w0WEcxclJ3akxmTjRscENuVUFPaXBiUzduSlhuYUVwYzhM?=
 =?utf-8?B?UzJPbmlTSGp1Q3NiWC9LYTBpRWxtVVMxbWIrZHlSRXZPYkFINXVMTXBtdjVp?=
 =?utf-8?B?N0p1bGl2Q3pabHI2RnM1WHVnbUxJNWdwNmNwc1VocmhrTFdLbFZicGlTRTdB?=
 =?utf-8?B?Q1pPMmp0L2l3RWNMa1B0elcrK2JSOFZsM0VJUEFUMEQ3NHV4cGNSczhwUWpC?=
 =?utf-8?B?R1lJd3V4Y0V6U1JjMkxmbm1ybTB5bVY5dmp5TDJIVW9WNGljM05VOUVmR3ov?=
 =?utf-8?B?d0EyQmJIb3UwUU9FSjVrM2p1b2QrSForREk1SjlVUk85b1kxV2t0OG1BVjUw?=
 =?utf-8?B?NjJEUmo1S2owYTF4M1FVSi9admFMWlAydGdGdElIb1FvdGZ1UzlqM0NKYlNz?=
 =?utf-8?B?WFpiUVZPN3NWdnB4VlJGcWczUHdVVE9USG92K3UxdEpjVkkrdjd3YmV2NUhw?=
 =?utf-8?B?K1doMnZaNk9iTTFzNG9ydzZCdmRXSktqZ2IvazFuYUJMMmxPN3lTUDZFTUdp?=
 =?utf-8?B?V1pycWw4ODRDUmNrc1Y1dFRtd1c1QkMvdGNHYjF1dWxTakZmTUFXSjdGVWYr?=
 =?utf-8?B?cmMvMlJrM1NDaWwvNVc3cWpkZEFUMVZVYW9Id2VCd1FIZXdXd3BYSUo5OTRu?=
 =?utf-8?B?SlFxRGZVRTBBNmlBcG4wUXQ0RGNMQkMwK0xCNkxhWGhNK2NZcWhOTzZDTjZW?=
 =?utf-8?B?b2NpbzBsQnp2cGtwU0puL1Bmb0x3K2w3eUFnQ3J3QU0rNE5SZ29qYndqRGRH?=
 =?utf-8?B?aVlOMGkxODV4ci92N1FHM2JMY0lGVDkyUGpxNGk4aHZwRXRPU0NIYzh4Z1Zw?=
 =?utf-8?B?WjBxVmFGcnVZQVhUMEVISFh5NUtPLytlamlkUDlnamVMSDB0NXAvUkZaenhQ?=
 =?utf-8?B?N2VNRUY5b0t0TUEwbU9lYVFKS3E2S2wxTTNETFBVdHZIeklIck9tbWlsQlY2?=
 =?utf-8?B?Uk9zOGNPRzJSSlh4MmJkalRPNUswVUZ1UUM5ZVN6NEtHa2M4ZEJzcFNNQ2dz?=
 =?utf-8?B?TGxUSEZZclZ4NHU1NWt2ZE1XQllCWGVtL1RwLzBhS2Z3eFhsN001QndnUUJj?=
 =?utf-8?B?YnQvZ2Q0OEhDdk90eXZQcVE4T09SR2JIOG5kVXJhbFk1NkRIZlhFaHRZclRw?=
 =?utf-8?B?NFpPMks1NHVHMTBMNFNOajZ4TXpOT2FUL0tPUmdXYnZ6WXcyaEpPbHlpZ1Ri?=
 =?utf-8?Q?C8k0c3CfpETwZgEVLRAfdGt38?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6731886e-f2c5-4d32-1595-08dadda4fefe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 07:29:55.0035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WA8/fjR/qN5oyIoaDkJkj0TuWesv5FbgzRmq3eEb++QV1fWxy69unFy+OZE4y4EXCqAhQthRvoLWEJVoAogvgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9685

On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1078,6 +1078,12 @@ unsigned int ioreq_server_max_frames(const struct domain *d)
>       return nr;
>  }
>  
> +unsigned int stats_table_max_frames(const struct domain *d)
> +{
> +    /* One frame per 512 vcpus. */
> +    return 1;
> +}

Beyond my earlier comment (and irrespective of this needing changing
anyway): I guess this "512" was not updated to match the now larger
size of struct vcpu_stats?

> +static int stats_vcpu_alloc_mfn(struct domain *d)
> +{
> +    struct page_info *pg;
> +
> +    pg = alloc_domheap_page(d, MEMF_no_refcount);

The ioreq and vmtrace resources are also allocated this way, but they're
HVM-specific. The one here being supposed to be VM-type independent, I'm
afraid such pages will be accessible by an "owning" PV domain (it'll
need to guess the MFN, but that's no excuse).

> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
> +        put_page_alloc_ref(pg);
> +        return -ENODATA;
> +    }
> +
> +    d->vcpustats_page.va = __map_domain_page_global(pg);
> +    if ( !d->vcpustats_page.va )
> +        goto fail;
> +
> +    d->vcpustats_page.pg = pg;
> +    clear_page(d->vcpustats_page.va);

Beyond my earlier comment: I think that by the time the surrounding
hypercall returns the page ought to contain valid data. Otherwise I
see no way for the consumer to know from which point on the data is
going to be valid.

> @@ -287,6 +289,20 @@ static inline void vcpu_runstate_change(
>      }
>  
>      v->runstate.state = new_state;
> +
> +    vcpustats_va = (shared_vcpustatspage_t*)d->vcpustats_page.va;
> +    if ( vcpustats_va )
> +    {
> +	vcpustats_va->vcpu_info[v->vcpu_id].version =
> +	    version_update_begin(vcpustats_va->vcpu_info[v->vcpu_id].version);
> +        smp_wmb();
> +        memcpy(&vcpustats_va->vcpu_info[v->vcpu_id].runstate_running_time,
> +               &v->runstate.time[RUNSTATE_running],
> +               sizeof(v->runstate.time[RUNSTATE_running]));
> +        smp_wmb();
> +        vcpustats_va->vcpu_info[v->vcpu_id].version =
> +            version_update_end(vcpustats_va->vcpu_info[v->vcpu_id].version);
> +    }

A further aspect to consider here is cache line ping-pong. I think the
per-vCPU elements of the array want to be big enough to not share a
cache line. The interface being generic this presents some challenge
in determining what the supposed size is to be. However, taking into
account the extensibility question, maybe the route to take is to
simply settle on a power-of-2 value somewhere between x86'es and Arm's
cache line sizes and the pretty common page size of 4k, e.g. 512 bytes
or 1k?

> --- a/xen/include/public/vcpu.h
> +++ b/xen/include/public/vcpu.h
> @@ -235,6 +235,22 @@ struct vcpu_register_time_memory_area {
>  typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
>  DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
>  
> +struct vcpu_stats{
> +    /* If the least-significant bit of the version number is set then an update
> +     * is in progress and the guest must wait to read a consistent set of values
> +     * This mechanism is similar to Linux's seqlock.
> +     */
> +    uint32_t version;
> +    uint32_t pad0;
> +    uint64_t runstate_running_time;
> +};
> +
> +struct shared_vcpustatspage {
> +    struct vcpu_stats vcpu_info[1];
> +};
> +
> +typedef struct shared_vcpustatspage shared_vcpustatspage_t;

For new additions please avoid further name space issues: All types
and alike want to be prefixed by "xen_".

Jan

