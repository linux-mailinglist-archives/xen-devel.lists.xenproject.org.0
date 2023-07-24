Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6A75ED80
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 10:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568480.887816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqu4-0000am-1K; Mon, 24 Jul 2023 08:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568480.887816; Mon, 24 Jul 2023 08:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqu3-0000ZG-Tk; Mon, 24 Jul 2023 08:26:51 +0000
Received: by outflank-mailman (input) for mailman id 568480;
 Mon, 24 Jul 2023 08:26:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNqu2-0000Yk-DN
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 08:26:50 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d55d8886-29fb-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 10:26:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 08:26:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 08:26:46 +0000
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
X-Inumbo-ID: d55d8886-29fb-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADL7FVdUSrMrhitqXvq3RIHj7WwosaEMxCf8+4rNBpbSTIfz895B7AMaC3MYmIc9HncQAwGpcJpTxQJqK1FsqHypD9A8z+btEgaRz9lU18vLOKQUmRtJRgZ6CALGEwM8OqhuXt4gyQhknhnMV3Dvd0i5OqK/8vTxWdPPhS+CqTOEKAeCBjQDFJCvOLA4D0nPGmcxX6KK36PzGsDou+bukK8l2bi2X/93VKlFELmSBK/FtJE8GK3nndnAMJuuWRBZtNvk8N3jNAwDkQshJGOFUrEKujsbFYKe9mBawjhaukmdtTKmo5i8gTwq507gpKXQKxQeXveI5HFRB3zU8cujxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1fqNcW2vRkKe42/FyS3M48IcTMRwU+HhI9BZMW2xI0=;
 b=DdwPA3eHFyP8BJZgzpBbouQ+LqS+p+BIA25Dfqq48pRo6WmrEP6MwOxcVlAKeXIWYRvt5J/fY0DecujBVvxz3Ox24mFXZPhXuiZUOWUM2CrpiEC5+gGcxMeygO0tiFFGi73RIj2ponLrzn5hJr36WWzD6VuAP99AsIbPj5gY0tbFuuw1SkA17jC9eGeLiIFSB2VXq6AZRTnn9DWhrrB4Gk+g28gP4HVPEG4IDUYE5jvOMSzEsHIvA5yKaDD23xHi+s/Dm7AcV74FspcDOD3Ijo23NepOs9gO/K+x+SG3HxQErM16+R/PFtbARGbD1nxvO8BX0kBtn0waYbyvTi9vqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1fqNcW2vRkKe42/FyS3M48IcTMRwU+HhI9BZMW2xI0=;
 b=Qtby51u/J2uJF/dJQqtJtN/Pduqdwfcb7FHrA0YzCq6AC4+iS1GK6I5fZ04EdoRAR3Xqs+6xQl3wa2imqg+dcPKpDYnZgmfYwtLs7t0mlCHs2Q2mLAWQChEQ37arWgVte6sQk1ULBJ6/oPTwgGyQUIteI9EmR8GMNbox2lhodqEz7gWJ/fe0fyewBgYMBQgOtWEPZ8Vt7IAU7PDsWRzOLqAKMKHLeafRuhQsmIMaXsOPLSkEkpwpkOsdyGW+HmP7/OHIG4Yvckvj8PlgT//SHEqioHUSzAJo9YO1NaxGszIfiIYLbuM0xR0ScL9vyN6zVfyuQTjYcv1vEpM7/LSu1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c08f1df7-e314-f3fb-b5ac-7aa5e4c546a9@suse.com>
Date: Mon, 24 Jul 2023 10:26:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/sched: mechanical renaming to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <9945fd23b0bb88f3e0c6054a7f992cfa642d3f9f.1689953420.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9945fd23b0bb88f3e0c6054a7f992cfa642d3f9f.1689953420.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: e896d992-5e54-4ef3-4559-08db8c1fb80b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	honS2ic1Mvkeq8IphQW7mdbvZRBgDblZSJfx01Y+sThJhrcBA2NnM9KF3ZNubqQWVAZi9LOzf0LfE97hYR1T075Gve+b6oViGUCvn7B+1Wc8+7/npmmY2Yu6sJbAKCFKIZt5ubfyuA3yreH8+6xLpsR9toLWW0BBHzCVJ/MdcUcJjvYCZGk0nvLyzcxfbfktfxgG1m3vqkjNu779K4jzOXfbDhLWL6+RXVcl5I+jHQvqrofqZgwOd+D6j8j28Bi2k2+9GXjcSDPmRcba44LJYjP/JblKNMRCZuL4wCklhayEuV7F00WwaTWOgPMcq1W9DvebltmBlemaWBMboafONwfALOmhxVXRmo5ZngqCyro+dELIyatxttMgXaGDbWRYrdqMv2wix9jYn0XneoOCE2c0NyTiuAQAbKFJ/DDK8u3HBEc3XmlOTaJWq3R74bhYaNRcwCbEB95/05jDN9QEmMbgWY5+S3mP2CTh4LmdKZhrNpR2X2Hv0x8CYfvJr2WxUu8cnNkblnxIgQrRxpABj9JcRi8cfOiHwggAtU9R/iEC2SeYJTlEIagkFRFxwDVPyag2d5czLUYui+imRo6f+lFaTbmldi+tFjmY+2iq8zNd8vNPwG/mPIYb6E8mrvwc5Yoa0tYZenDbwTcROreCoQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39850400004)(396003)(136003)(376002)(451199021)(31686004)(2906002)(478600001)(6486002)(36756003)(7416002)(316002)(4326008)(6916009)(66476007)(66556008)(66946007)(8676002)(41300700001)(54906003)(83380400001)(38100700002)(6512007)(53546011)(8936002)(5660300002)(86362001)(31696002)(6506007)(186003)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzVBL202MWpIZWhVcUZYWTlYQm1ucDFFc2FVYmxDdTlzbXgvdXY1S2NHMEpY?=
 =?utf-8?B?bEI4S2ZVRU8vSmo3NldTT3g2SFlIQlZWUUpPMkoxUFo3K1RrYWVNT0hiNGE1?=
 =?utf-8?B?T05pd1dmNk9VQUpwc2xwV3dIMWowQkhjOEpuTjBlSEVndTJlMGtNT1VxR1RQ?=
 =?utf-8?B?SStMUkFrT29iZ0Iwc3Q4a3QxY0dJZHRXOXdlOWVLUDcvbE5uVUpxbzdZNTZC?=
 =?utf-8?B?dUhBYXRhczJVTXJudnArWU5iSlZMbHJaVzJXVFlOMzA5T2pvSlNTYTZUdmFh?=
 =?utf-8?B?enpHeTdYcnNUVE9wMzJhR28vRVNyaEIwSVVNM2c4WjdTT1NnTmlEOHMyTVMr?=
 =?utf-8?B?THZZNzBtc0M0cDc0QXZhZHZUQ2h2d1dicHUyNHJ2UmdzTXNYWmErTkdCem1U?=
 =?utf-8?B?aXhXR1VQNlAzYzZZL1JHdnoxemc2YVE2a09vUm9DSkprRkhKNFdWbm13cWM1?=
 =?utf-8?B?OGRHZDVZSlJrSHFPS0Z2NWNiQmk3WC9wWVRpSUNpUHVJM0ZaS1hDYklhM280?=
 =?utf-8?B?VnNERWttUzVYM1Y0eXI3aXYrQzNja0lRcUdXZDZiN1JJM29QbExZeUh2bklG?=
 =?utf-8?B?blJTSVU3ck9BOGdZM1kwM0NIZEloL0lLNUVra2FoaUJaejBWYVpaU2M2OTI4?=
 =?utf-8?B?MlBMZE5ERzYyUnhzdzhXT0k3RUY2Q2tNcWR3Vm5JZGtmVUZsSEN5U3JoZTlp?=
 =?utf-8?B?YW5QOURwSnRCcCthaWtYR25GM2s5V0pVbXZORTRPOGs2VjNXNUZhb2VzVTR3?=
 =?utf-8?B?RmhwNVVxV0NtbFFCRUd0MHpWUFhLL2VpanQrT1FxZklYcDdpSFJrYUJLV2ly?=
 =?utf-8?B?eHFVaGY3S1RrN0hmbXZ5c2RqUzZlVVNmVnVtV29xdlZQZ040S2h4ODhKd3Fa?=
 =?utf-8?B?eEZHQnpIVHhvNEorUzdGcHEwMUhPVVVFOGhnWWhDUDdyL1pweTV3RkZSWW5j?=
 =?utf-8?B?SkJuUkVmeU5WUDYxNWpBUVU4cUM1bW9ZR2pFNlU1V1puN3IyZ2luaUZmV3NY?=
 =?utf-8?B?N2ZJOEVGM3QxendWSWc3NzFZVzV2aUorUUhKa2JoRjc3Tlp6QmV6K1d1ZUFP?=
 =?utf-8?B?Umg3L25GNGRWS1NheVNReHYvSGV2MXdWTDR1TEFuRnRHYW81NEM5TWRsYkNV?=
 =?utf-8?B?TE9UdVp0Umo3UmVOb2g5M09HNWpHUlBhazRxNktOYTdZbUdsRDcxRDc4Ull3?=
 =?utf-8?B?Vk1tYVdhc0V0a3E5WERqSUdSVGd2Z0pNSnk1aDBFTEFMMGpmZS8raDd1SlhB?=
 =?utf-8?B?UFBSQVZteFpBODJrQnEreEd4NGxJKy82azVOVHlUNHZEOUpiUE5JZlhGeWdq?=
 =?utf-8?B?T1VtaDBidDc4YytSMVgwK3ZTV0JkekNlajY0dDF1VHMycytsSlJhYTRaMTNK?=
 =?utf-8?B?dlBDMXZhd2hMZkdkYWlXKzZSMkQzM2gzdC9nY0xwNko2SjZBS0p6eDVLTjk2?=
 =?utf-8?B?dnc4azhIOGE0eDA0MTFFcmR2cmZOOUFnOFVXWm9IQ1dsalY5M2ZCeUl3ZStZ?=
 =?utf-8?B?MEwrNUxPc1RmblpGTHAvRlhON24vWllvQ24yaEtwa1ZubGxndUxuVWZ1WHJt?=
 =?utf-8?B?dmIreHFCS2I5aE56Q090RVZIeGxXSnhwYTFZUkNVMGlwSEFaZlg5bG5TRkhO?=
 =?utf-8?B?aVF2UitZbnhIWW9DbGtIM3hSQk1QWjdzQW5kaUFmQ2lodlhnM2pNMm83cEow?=
 =?utf-8?B?MTdpQThyQ2o3WFRFU2ttRnZYYXdaSWZmcWNMRytvZEZyRFJEbUhCMUc2S1Nn?=
 =?utf-8?B?MFA5MlBha3VsY3phcUtwdzB0QVZIakIwTjNYTy9neTlyT3dpVEt3ajQ4RzV4?=
 =?utf-8?B?OVJmWXRvR0p5eE9XcVpPSVIwaEFZNUtvS3gyN2lqWUpKUng2cnJNYzliZ0dj?=
 =?utf-8?B?cUk4bEJkMVY4dEhITE1ONkJZOE5GN2x3YXJORi90WkpLa3dLRElaeWhRY2FM?=
 =?utf-8?B?NS8wTXZlL0dVdmdqYmpjSXBkZTNCTUlYOXJRTjBwWFd4R0Qzd2ZnZ1FFNE12?=
 =?utf-8?B?dHR4K2R0dFlVOVZWbDZRMFNzaUZGNnFaT2lBeVBGOTg5UmVFZGtpeGZHRHVw?=
 =?utf-8?B?SmRsSUt5UG5tN1d6a2oxc29ZeVBNeENobkhXZXZJUzh4b05mK3UvSndnVXZG?=
 =?utf-8?Q?1rRGlyUt0k1DfH/Y0KAhmcCc7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e896d992-5e54-4ef3-4559-08db8c1fb80b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 08:26:46.3820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHP8KjfSb4+Y5/eq04BbnzgXJ3KnaJ7Td0mwKy6KCdtmbXNb1PChcX9PG9L0hee4BSV4HVwV0u5PeItLGZbR8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

On 21.07.2023 17:31, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The renaming s/sched_id/scheduler_id of the function defined in
> 'xen/common/sched/core.c' prevents any hiding of that function
> by the many instances of omonymous function parameters.
> 
> Similarly, the renames
> - s/ops/operations
> - s/do_softirq/exec_softirq
> - s/loop/it
> are introduced for parameter names, to avoid any conflict
> with the homonymous variable or function defined in an enclosing
> scope.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/common/sched/core.c    | 18 +++++++++---------
>  xen/common/sched/credit2.c |  4 ++--
>  xen/common/sysctl.c        |  2 +-
>  xen/include/xen/sched.h    |  2 +-
>  4 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 022f548652..e74b1208bd 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -99,13 +99,13 @@ static void sched_set_affinity(
>      struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft);
>  
>  static struct sched_resource *cf_check
> -sched_idle_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
> +sched_idle_res_pick(const struct scheduler *operations, const struct sched_unit *unit)
>  {
>      return unit->res;
>  }
>  
>  static void *cf_check
> -sched_idle_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
> +sched_idle_alloc_udata(const struct scheduler *operations, struct sched_unit *unit,
>                         void *dd)
>  {
>      /* Any non-NULL pointer is fine here. */
> @@ -113,12 +113,12 @@ sched_idle_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
>  }
>  
>  static void cf_check
> -sched_idle_free_udata(const struct scheduler *ops, void *priv)
> +sched_idle_free_udata(const struct scheduler *operations, void *priv)
>  {
>  }
>  
>  static void cf_check sched_idle_schedule(
> -    const struct scheduler *ops, struct sched_unit *unit, s_time_t now,
> +    const struct scheduler *operations, struct sched_unit *unit, s_time_t now,
>      bool tasklet_work_scheduled)
>  {
>      const unsigned int cpu = smp_processor_id();

These renames bring the idle scheduler out of sync with all others. I
think it wants considering to rename the file scope variable instead.

> @@ -2579,7 +2579,7 @@ static void cf_check sched_slave(void)
>      struct sched_unit    *prev = vprev->sched_unit, *next;
>      s_time_t              now;
>      spinlock_t           *lock;
> -    bool                  do_softirq = false;
> +    bool                  exec_softirq = false;

As an alternative to Stefano's suggestion, maybe consider "need_softirq"?

> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -3884,7 +3884,7 @@ csched2_dump(const struct scheduler *ops)
>      list_for_each_entry ( rqd, &prv->rql, rql )
>      {
>          struct list_head *iter, *runq = &rqd->runq;
> -        int loop = 0;
> +        int it = 0;

Instead of renaming, why can't we just drop this second variable, re-using
the outer scope one here (and at the same time doing away with a not really
appropriate use of plain "int")? (This may then want accompanying by ...

> @@ -3901,7 +3901,7 @@ csched2_dump(const struct scheduler *ops)
>  
>              if ( svc )
>              {
> -                printk("\t%3d: ", loop++);
> +                printk("\t%3d: ", it++);

... switching to %3u here.)

Jan

