Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7278461647E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 15:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435948.689911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqEPS-00089R-Oa; Wed, 02 Nov 2022 14:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435948.689911; Wed, 02 Nov 2022 14:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqEPS-00087i-F5; Wed, 02 Nov 2022 14:08:02 +0000
Received: by outflank-mailman (input) for mailman id 435948;
 Wed, 02 Nov 2022 14:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqEPP-00087Z-KS
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 14:07:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60078.outbound.protection.outlook.com [40.107.6.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c06395f9-5ab7-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 15:07:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9068.eurprd04.prod.outlook.com (2603:10a6:10:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18; Wed, 2 Nov
 2022 14:07:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 14:07:54 +0000
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
X-Inumbo-ID: c06395f9-5ab7-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzhIE70kjY+y+cuY46maKKB5pnsYXCbwcXN0hZ6Mz84WiezyubOx3FMIZgRsUm2/x31mBYNYQUSO5VptWrsZWQae8/7JR3ov7eFf4Q57EXIJHhlxbeyLMNnXQLMaLYv9xfMqbdF3pFnw0Ubo1DsvG1FoBntY3AaX0vgdGeZTMxyDfkpAQZ3gS4+ofObDgF9wQ10kPAiYGwydHTHa6ZsCv2j+gJt1HkDVR9bEFsmSmRq+fhc6GL3PxZAVHQuA4CkVlLgOEc07axYsJ3lhn/qGKGTOW8YTsVKWpX5CUeYrk+4OJPvGRFuRhr3EfBz482ZzX2oNZ1tQ0MJ10+mGUwt4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNImGd2VfP1X7a4ep1HdEPAIBmU3R5jAKZYwcxXLpUY=;
 b=UYlCt+EDBoJhMYlJCyPcymyvtDV7maBdLMRQeCNox7oPr2Trdg54JWSamH0wZOSYVX/KcBKYMP5CwxDbHn7IOPij1sDc692/9YTiABDGkHaEyJkT/MOeEgng64iUMVHx4f4leGW7Kxr2HKy+p7Lf/93LIevpC2Nq1NhTU/sgFBDc++Siau6ZK7iNA0xJh4DA2akk7BS0dUrV//LQ1SbZrMuZ/5OQUt+e90BXjeYxWXQe+uc0kFlL4wYECBgBTn6mXGhk/gex0KFnTPYLEyl8OmVoiZ1EiQ8u+7XbrwcssaGDZsnbJ2mT51QRA3c9YHXX4YuvyTJqTlZhiWSM4DA//g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNImGd2VfP1X7a4ep1HdEPAIBmU3R5jAKZYwcxXLpUY=;
 b=1pNJO/B5IO/VgQIVd4hIBKjxBCPbhXoVORC7zHj29JZ4tS/z/HL++w8UUPlAUrzhbll/Zpg1wIOYhTc9dWUjvoqUI1MwDD9ZB7np9IEr0BHGTPp05dLrDM3Sk+q9nYv8x99fo+efb4B/0Cumeh0FabUzZqYjmiR1WQb5E5T3i01yxs84veoDDB0NMUVIudfhIxUmm1sl9al5ETblcN2lavbAv/vgcHGos+qzPTI8E+ctZG8MJsDvI5ARRJw4jNfb2l5RHELmm7RxDdXbI4GZcoQgk7cc5QrO5jshnNgXAJ8gRN8qMtrlz+Lb2y9g9yHvUDXo/vZygqc8s4JNZmxgNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b1ae29cc-71c8-63c3-467c-59450a6e3c32@suse.com>
Date: Wed, 2 Nov 2022 15:07:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH-for-4.17 v2] xen/sched: migrate timers to correct cpus
 after suspend
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
References: <20221028111231.31355-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221028111231.31355-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6e652b-acc1-420c-6831-08dabcdba31b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CVFDTIE12RxsdrowLnpSe2fQpiLBl4CGH1+NLv7Tu2IYs6k1Hgpv5TWTA56KO/TnZt6AYTEG0yfBVH9MSjJnZgBPkjfoeijlFnaabYTMNl0nBgj8i6vEJcZSixxJudgG+FVXMvn7Am+edYoX+TbkSvGVc9GNLlEv9Rturh/accj42XApsjKrICIT7oDgcBetPid3N1+KgmMNpOlHxEChG3o7htzhL9Wg3i7xkgkv4K/8HxuAhnUHmBdAMimNqJvN8m3MIqcz0GDcvdKRWDei5+A37tdR6BE9ofqxWAco5Fl+oQa5kVW71stFxdyyDOpjyxxqquG8oR1I5Cnze2Xh8ypBkuaZ+fyJIdIa1SUgSzE1UZ+9zDLLnKfovXM7cMGgtxpUkeWO2dDYMCehoBR+f5Ak/W1JKKsSLCXAVcP0Aj1OpkYNdbrKDRkdZ1aURyek2MfOV0WrDgQGDknlAIGC+1KMFX/zIuxI0ZaqbjdkRaCYdBpH7Pphb9085uOPJXvz0xpTDeNvHjEq5T7aZgdgvWbISQ9x9rWVoeEzYJLbJzRiyXICaf6Z+TOJgJT9k4BOEWeSuW1e5x78yeztAKnRUXZNYd3BTL0Oxo9tbkVnVJcSI2NrLN6q32nA1puR7dOtyybpZQnt8Y5Tqm2WoHspeVdaZ1l4uTgb9lp1PxzHhbElwbWmVrFEcG3l94gDcgeT5UXtwBadfTZEhvMPltGg8L+443sLmwS2Y0koTtOXchxx8HfG9FHMgBOHUlJpX5NuWJGRximbpwqpZk0r0Fr8vX3YuD9IqjOpN9pamn5f9Ls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199015)(2616005)(6512007)(478600001)(26005)(6506007)(83380400001)(54906003)(186003)(53546011)(15650500001)(2906002)(66556008)(66946007)(6636002)(37006003)(8676002)(66476007)(6486002)(5660300002)(4326008)(8936002)(316002)(6862004)(41300700001)(31696002)(86362001)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHYvenZQRjdFUitoQkYyMkVIdEVzOUFnbXR5VlVaRVpxSkxRY3pCNGxwUXVs?=
 =?utf-8?B?cnZSc3YxV2YyYThJVVpNR2F4cEdMVS9EWURMOVUxSG42Ym5kd3ZlT255QTFI?=
 =?utf-8?B?aFlZdndGTFp6a28vbFlUUVYwaEhGa3dSVXQ3ZlF0SkJCbE90UEMwd2NLaGFr?=
 =?utf-8?B?ZHY4QkRPK1NwcHVEUlRubWVsVGRkUFRhbG1uR1VHUTRZTVlJOW1aY1JSQ21X?=
 =?utf-8?B?T3NUbEgyM2x4VENUUDZQdlFocU4wckEybVE4b0djNWV3T1MySzZJbTZQWWxC?=
 =?utf-8?B?SDZvQTBkdjIrR2hkMDVQSWJacVptREF1U2UyVnBrd0tmZ1ByVVNXOUpoeFRB?=
 =?utf-8?B?Z0JDRTRjYXhUMThpdjROOEx0WGR0V2FUSytpMGhrTGNuL3VldFRPbDVxYWhu?=
 =?utf-8?B?ZlRqajgwb1lydHFyMHRhWU5pRUJ4WjdUS2NNbE9OdS81Z1dKSm5hN0xpRWhX?=
 =?utf-8?B?RlJlbmlBdGRJMEVqMDRTRmJPNlg0Ukw2M0pjdTVLdmhFeEtacU05eVA1Smd5?=
 =?utf-8?B?T2s1OGJrQjdaRmJzS29GN0t1TVBtODdMcXhEZS9FdHUveHdtUG9SMnR5bGt0?=
 =?utf-8?B?NkpwMFJSWlZiRzFBMm9nZ3NCK3ZZejUwendONXVCUEZGbnM1dkVOWVI1cUJ0?=
 =?utf-8?B?YnBrOUpOSE5aQkg3T2xhMy9ZSHp2dG5WK0h4bm0xU0pmRUFselhjRkRRSTFp?=
 =?utf-8?B?ZjVrL3RVWDIwaGFPakVHY1BWY1RJbjFGUVdPMEhHYXNoM0lPNXZWZzJ3dE96?=
 =?utf-8?B?akFUVzJSR1NSNjg5SmtobUlSM0lYRjAvMjc0QS9JeFZ0b3ZxM0lld21KM1VP?=
 =?utf-8?B?bXRLakthanpLWVFFRFBDUW9NWDNTZkNYSFIzNXNIeVYwZFg4Qkd1NkFwWWwx?=
 =?utf-8?B?Uy84Z1kzdXp4TWpYeEszNll0YkRSekY5M1FiQW93b3l0NjA2bUFNTUNqd3BP?=
 =?utf-8?B?em9tL1hubEhEenJVY0ZwRXlWek1rbEZTNTlobHhweEUrMmtJQ1F4VEp2aFZv?=
 =?utf-8?B?YnhNTWwrUzNjRjFrcDhYUU9xZ2RYQ0hVVTdBa1pqSkowNUNkRXc1OG1Hbmoz?=
 =?utf-8?B?SHF2RlBpRUtFNHRoRDk4R2oxUWdYWGE4aDBlazlkb3hkMzFXU0pya25DUktI?=
 =?utf-8?B?UjQ2UkdXL2h0OWZXczBVUUV1bXgyUXU0SE52VHJwTDdnV3BBNkhXNjFSUDFD?=
 =?utf-8?B?a3FQQ0VKREZFNkkrcnF3bm51aGk2THFaZ3ZFYkE0OWhIZHpjVFE0b2ZkdUNU?=
 =?utf-8?B?eHdYeEN4Vng5eXhCUmxHZEtUNEpwUkF5VGxSRWd5ekNsWnEwdmVLa2dPczBB?=
 =?utf-8?B?RHJiakZuSklMNlkxcmpkQUl0MnNIN24zUjlrb3NESTNQanY2eWdMUC9HVWtu?=
 =?utf-8?B?YlFLckNwbEdHMnBLZ2JyTFU1REpOZVhRNUJRaVpyNGgvc00yU09COWF5dlRW?=
 =?utf-8?B?UU9RZzNyS3pMd01oTnUrY1R4cm5XdnZidk1teWlTSmNsNkJYWGx4RjlaSUVv?=
 =?utf-8?B?TXkzaW9RaVRVNnJ3TlZueS92cGpxclJoY0M2eXBVeklSUmRBamN4RlhIM3Vh?=
 =?utf-8?B?TUw1OTM5UHBzMXNJYUdNNkVKQUxCRk9ZSENUVGJvdW9SMi8wR3NuWEppKy9p?=
 =?utf-8?B?WlhQODBDcXJxWGVtMTRCYTlURmJhaXRoajl4L29oeW1tN2JBYVhBSWtUaW1i?=
 =?utf-8?B?cEtzNThmZ1dhN0IvOU1WT0xIc0ordXRocEZVQ0FDakRIOWFVOTJrSms4WUxj?=
 =?utf-8?B?SFZYOHRlQ045OU85bjIzSklldnMzQ1dnNDBzWXBtK2pOOSsraUFIeW9ENzZr?=
 =?utf-8?B?ZW5ueUZWTGtoVEsra2NwV0RrbXRWVlZBL0Nsc294QlZ4dFlMR1JvOGN4Ykkx?=
 =?utf-8?B?bXJCTlVVUXo0K05OUlFkMG5Ub2xxYTFObjhFbk42dFlzam01aFU0dXIwYXBp?=
 =?utf-8?B?K1lvK1E4ajlCaVZiWnMyaTJjRVhCdUo5aXBMVWdmcnRrQlhjNUp3RHNRaDRj?=
 =?utf-8?B?RC9JaC9tUUJ6TVNLclp6a0RwYmtDR3RQQ01YQjJFY3I1TkZibEd5Q1FiTDRE?=
 =?utf-8?B?MWt5Z2M3WEhta3VZMmJpY3lrcFFGRG5YZmpGVHR2NlRYaG9RdWQ5enJQWTI2?=
 =?utf-8?Q?dwmpMMjfTWsytXPiiqKV/pGMH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6e652b-acc1-420c-6831-08dabcdba31b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 14:07:54.7625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tYdCZpmvPeyTubAREsc6CmIeZP/raj+6tb6Kj6BayoIH9QDJzRMs0v4jNGRj9uTr1Lam/Mws3fGZ9lWdsAZjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9068

On 28.10.2022 13:12, Juergen Gross wrote:
> Today all timers are migrated to cpu 0 when the system is being
> suspended. They are not migrated back after resuming the system again.
> 
> This results (at least) to problems with the credit scheduler, as the
> timer isn't handled on the cpu it was expected to occur.

While you say "at least", this doesn't really make clear in how far all
four timers for which you change their handling are actually problematic,
or whether for some you make the adjustment "just in case". Looking at
core.c's s_timer I'm inclined to say that with s_timer_fn() raising the
schedule softirq things can't go well when this doesn't happen on the
correct CPU. Just that it won't be an obvious problem like the crash in
credit1 which had prompted the creation of this patch.

> Add migrating the scheduling related timers of a specific cpu from cpu
> 0 back to its original cpu when that cpu has gone up when resuming the
> system.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Is there any Fixes: tag possible? If not, could you add a respective
note in the post-commit-message area, to increase the chance of
recalling that this will want queuing for backport? (Or maybe the lack
of a reasonable Fixes: tag could actually justify the use of the
Backport: one.)

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1284,6 +1284,32 @@ static int cpu_disable_scheduler_check(unsigned int cpu)
>      return 0;
>  }
>  
> +/*
> + * Called after a cpu has come up again in a suspend/resume cycle.
> + * Note that on a system with smt=0 this will be called for the sibling cpus,
> + * too, so the case for no scheduling resource being available must be
> + * considered.

I think this part of the comment would better live ...

> + * Migrate all timers for this cpu (they have been migrated to cpu 0 when the
> + * cpu was going down).
> + * Note that only timers related to a physical cpu are migrated, not the ones
> + * related to a vcpu or domain.
> + */
> +void sched_migrate_timers(unsigned int cpu)
> +{
> +    struct sched_resource *sr;
> +
> +    rcu_read_lock(&sched_res_rculock);
> +
> +    sr = get_sched_res(cpu);

... inbetween here, increasing the chance that there won't be someone
trying to remove the extra check ...

> +    if ( sr && sr->master_cpu == cpu )

... from here.

I further think that explicitly mentioning "smt=0" isn't very helpful.
Aiui a system with some CPUs otherwise soft-offlined would suffer the
same problem. And I further assume no problem would occur even with
"smt=0" on AMD hardware or Arm (where we don't park CPUs). At the very
least I'd therefore like to ask for "e.g." to be inserted; better
would be a more generic statement like "with some CPUs parked".

Jan

