Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3D588960
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 11:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379686.613352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJAdF-0006RM-3i; Wed, 03 Aug 2022 09:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379686.613352; Wed, 03 Aug 2022 09:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJAdF-0006PP-02; Wed, 03 Aug 2022 09:25:37 +0000
Received: by outflank-mailman (input) for mailman id 379686;
 Wed, 03 Aug 2022 09:25:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJAdD-0006PJ-Q1
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 09:25:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80047.outbound.protection.outlook.com [40.107.8.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 397669d5-130e-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 11:25:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3713.eurprd04.prod.outlook.com (2603:10a6:208:d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 09:25:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 09:25:30 +0000
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
X-Inumbo-ID: 397669d5-130e-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOwqGT8T+dcOunE9Bh+pMfFD7kdPAeKpDFIJGelJQupDVIBKwQ2JZQQ6+mRpmVVdz/xbZBBTvHtirMR708WMG/XZxGq++wD05aDx8YkojLFFBS4XKkwL9j52YqxhDOkd/vWWEtNhZdR+fd9dubX44ci6IgF7O4NqQ8aTE5ymjwT9/W/8r0yfpylb2TW8TkGYmPIK7XfrfWAOYeFLYbj0JOzWPm7X3ChK31hiqdGr2EdqrqMV2/406pAQ39vwhMalbpgW5pCf3ti/pN+d4ZXia1mA+Nj1lpA8lpxNKpzUclQpVQsQ9V4CiMXERJCrOXpOa+D6abeNSEZby40YJszJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsLCwVlatWs2AQpVFwqvYMRezc71wIrbFReD0y2UrJA=;
 b=FuAWHiyd6aDLlexPT2MNdtVHq/ythnINSXX2cR6h1MaIH0GkOkK4wQrpbGa2Cg4WsVnLVMoHQrfqhqkXQJeVxpSp35XZXg6WzlG5ZROGbU9MARQxTW57uHTQ7sjGKR18ishNBrvNJbgWHy5/ciFPlFbZTnmNxlbfzkBTtKdN0KLJUrVAkJ+BGrjTraa6ZJiEJ37ruoGzeBaq6Fj8CdA9tOTWhwVilzvX9/pSw7PXZZhn32lwvj2YSYGPMSlmbrZWa2Za5AvBmuL8loiCLlSDZihQjZiTisjq7Aqx1lH8vHiqyDazdy4iATNg5yNsDHXlHPkY2tNNVGhzhB9PR8BGJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsLCwVlatWs2AQpVFwqvYMRezc71wIrbFReD0y2UrJA=;
 b=HdK5U33nyM4YT0dtgX3J/rxB8ITtrRVcpF/un8iTOt3hW8kupL51hNR3ANPSAsW+u0CFUuHGb7zPaDkP313++kVAAF2OO6M5jq7ZBZqbnDEatoMuv965Fg7lUv7I/njLeYQlipnotEkV60ApZoQlOF/rIrbK7QDwW47JaahFtkRkviZvUxG5z5Ir5f7XuZaVVcoL25ekE4dkVbVttE5S62T9RMdCrxx/m28SHj2NfqXggQy+R1zE9lUW+N8mfs1K/62GbNcUxqhOXb1BhzKPMlaMOaF4gYN8pZu0jqlhM6H/NIuokuT/riK2Yf0onqDNBzam9wwQar2rimPaeguGwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b68bc1d-e920-bae8-52c9-809d9f4919f8@suse.com>
Date: Wed, 3 Aug 2022 11:25:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802132747.22507-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220802132747.22507-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 466bff97-ee2c-418e-6958-08da75321ba4
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3713:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IsspGVYO9Yaf5CBfksViHFJf7IdSbtl7V2eYeFkjU3Ny0zi3Rxy9ZcXTKnficVj/0tYP9nQsfckQVVEA7rKIJxELjqOvF8Ll1vBETYjqCRFyz7Zqtv8BytxSgJvDkMRQd3tYwOEBPdUz1AuDLXkIIT0moAdUnXQADaMfbIYqqdlRVtZ2WxY2OYiox18Mq0WCMFJx6trB53LnIJFM6PRpu0Np6Ji1WxVvL96mPoeWGfvgsbdQ+LbzpbWOks58gJc5SQX/PcPbAG9MI8u8cW/ZgoKcYIp+TJDPrglOyf/4Xssj3lHRZ4jimoziUCTedy5oy4SkWZVYAIZX3m4eQVNR7XJvAH+RpE75SmrOErdkB9tPy/Au51m0ymNzmqeZlG/F7sRJiOjRN43olMPm8mkfrGd9zkFGMBNVd+SPnilJ2ShO0T0+ypp9BopTDHeVGJ+UdPxBGylc8XWYqrhWVLcJmS+1SwSJNKfaYEpgOqTt9Ap37eiEhXY/9z68ymxxEby1No2t0gyQe+NisdZ8daPwgE6kcNll7753Am38ulsOOJNoupZrce8EfQ+br96m/xQ5YOmF/dd8uOHHis53WvmJ7L+Dh+YAB6Y7y219etYOBlhxXiZxn5WB2xteZzM/5nja4w6GPDgRLGVKrG8xpNa3ne//0SEnXlzxYk6bXxlOnChB+jo29JKPFj0U8qWoBgDkEUVTz5eAJBHzEH6ceU9wISErC9ax+bkY0Sn1m+R1j2E6fa3gPSHRpyGwoKsedLg+MMu+Gyd1aXTY7xyNrHFBbUmmEvYI31xlbDCfBwRn/WDkYgKmchfR9IpGKUMwOM/mAaEf5HRlmZP5gUZmlkYQGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(376002)(346002)(39860400002)(5660300002)(6506007)(53546011)(6862004)(41300700001)(8936002)(6636002)(54906003)(316002)(37006003)(38100700002)(66946007)(31696002)(86362001)(66556008)(66476007)(2616005)(8676002)(2906002)(186003)(6486002)(478600001)(83380400001)(31686004)(36756003)(26005)(6512007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEZzdGxuKzFCRU5hanJMVFVYMVMyK0FhWmRzbTUxVkd0RysxQ25MMWF6cEdH?=
 =?utf-8?B?aXcrRmxLYnY0bFhjOFhOU1FybFhzdHdrWGR1ZUdJeU0waUQwa3ZsT2ViZDN1?=
 =?utf-8?B?ZUdnNllySVJzTVV2dUxjL2NTWWxrdHpTTUlNMG1keUNvd1RyeHhMeGRQOC8z?=
 =?utf-8?B?aWdrNzhtQVUyWUQ1bmhROVZUTXU0V0FyY2g5UFRiczNOeUc3NmN6cjZzNklw?=
 =?utf-8?B?U2tvR3hsR3QwV3FvR3plSllmeUVJMUxGUWh1d2RKcFNBR3FVcFV6WE5jYkVQ?=
 =?utf-8?B?TmtvQURmN2UwZ0ZjY294UWhjMkpTcnM4RXlnNzkvcWE4S3oyU3l6ZDdXUDZl?=
 =?utf-8?B?MzJ0NkNvV2hqMWNzdDlRa09pQksrRndrdGdpZVZKZE8vYkdJMkR6UmJQaGZ2?=
 =?utf-8?B?dFNFcFV0c1FmZ2cveStPakord3lURjN5U3pIS09vSHRpVnAxaWgwVVVrQTdH?=
 =?utf-8?B?SDMvWTRFSllScVNxK0RTbStYaG9WSGFUY2pLT2pPT2JqTjJHaEdoSDM2cWtC?=
 =?utf-8?B?eG1GVVNhdnNkb3REdUhMeW81Vy82TkFOK0RlSnp3THBISnBYd2JDVndJTDlP?=
 =?utf-8?B?NW12RzBNV25vTnlpV3dKRU12cittYWJ5S01oUnkxamhVM05iQUdkaGN4RDlh?=
 =?utf-8?B?NFBOOHN0V2psc1dXVFRkaW9BTUgrRko0bmphakhyYklaNC9NN3g2di9oOFdz?=
 =?utf-8?B?c1BQZE1wcm54ejhxbHlaN1VOZVpvKytURzNIZDVLelhLbEFwclJjcER3UFVM?=
 =?utf-8?B?VW9NZlpKd01qTU1hc294N1RNOUxkbVA5bGtPM0MrZ1puWCtXd09Oay9NT1o3?=
 =?utf-8?B?cUQ1M05lc21YeTVqaTZ1NDY5MnNDdEtzQ2pUclFNbkdrbm1jRmQ4YXlUdU1G?=
 =?utf-8?B?eU9ISy9vdWMzZCtvOVdCOVpIeFRuSXdTRFJGM0I5TTAydlFQMGRpclMwRHNn?=
 =?utf-8?B?b2l6cThuNWpzNFEwTnJHN0gwR2Y5bDluN1J4QVRNdHJQWUZiRVFRYmpMaWQ0?=
 =?utf-8?B?dktXOFJsWWNKTVoxNDhyWXEvaW9ZTW8xUWNnOGxTd2lraURLajBtWWNUOHFJ?=
 =?utf-8?B?ZXFCb3hhNFBxU0djNnNVR08zUkhlU2JsbXg3amtYZjYyYkR0WklLV0NDblJl?=
 =?utf-8?B?NHNDUis4dW9nSlNDOFI3WG9kMkljYnlia01wMFBubE9DOTg4TmpzQkptZlBx?=
 =?utf-8?B?TE5CWVRTOVZQRVROSHArVjJlOSt5aUZUTVFkbzNWc1I4MmR2Y1h6VzF6b1Ba?=
 =?utf-8?B?UlUzUHlpZjAzd2x6bmV3MkhGMnoxU2dHUkh3cU1LWVRSWUhDSFFnWmtSVVY1?=
 =?utf-8?B?SHlUOFZHdzBkMHB2aVJhYzJsSmJCV1Y4UzVqSm9ncEErOU1vVERBSUNEc256?=
 =?utf-8?B?YkRBNVpocFI4SWN0MlU1VllqT1BaVUpZZ2JIRkszcGx4QVF0aEJnNTVNM3lS?=
 =?utf-8?B?S2I3bXBCZWFCT1FEZ0dIcVZMTWREMmFscW9KKzFJaExHWUhNWW5KSmlYRFlw?=
 =?utf-8?B?dExwRUk2NzRmUHp1K2VGeC9oK0pqWWVkWjlZd2liNmZKMVUzd2R4bHhhUzV0?=
 =?utf-8?B?RlVzLzg1NytZU3FsYWhuSkRsNzdMVGhhQlB1SUNlNWNaT3V1S3Zyczg1ZUxt?=
 =?utf-8?B?OG4xSWZGaXpiNEFoZFlmN09qSVJXbzVLV3RJRzFaV2REUnRuTkRiVklsRXFu?=
 =?utf-8?B?cktCcVFBczhFTk9sbmtWalBudWhyZkoxWkp3ekVLcjVHTkM4ZkZxTnNMUnVS?=
 =?utf-8?B?YlNMZVlXenJFTitLMjdYbVBvcVRtM3NabU40ajdxZWl4QjYxV0ZzS25zelg1?=
 =?utf-8?B?amhuaVdBUk1DTzYwUkxjZUlIVnAxL042KzF0RFd1WWlQR2lLOWhLa3U1dWVI?=
 =?utf-8?B?V05yNnJ1Q1pIL09sbHdFcFg5bU5mZ09WS1BKeEFuaFdzbUQvbmZPeTd0WEwy?=
 =?utf-8?B?eml5NmphWDdnWjNpR1dxVzgvdUFzakx6Kzk3ZDFOMFQrM08rSDdVMUV4R3o0?=
 =?utf-8?B?TFlmNmdYODJlVXB1dHpSM1pXNFh0U3JlcnpqUStaNEF1dm5tWWcrV2RQZFdo?=
 =?utf-8?B?d2JSWXdlSzNzOVg1S1VMT3lMRkoydml3MG80eVZxemlFcklIa01QTnZtOEJj?=
 =?utf-8?Q?Xo8SAVmXZZ5DsOcj05W4mf4d9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466bff97-ee2c-418e-6958-08da75321ba4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 09:25:30.0014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLgQvz4OK3UCrYL0EptfVBJB5I3V6ZiJYKSXIZOERbbxfLpVOapGV9YTyrOO1HY2kkl4WDWY8035p32rO2um2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3713

On 02.08.2022 15:27, Juergen Gross wrote:
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -3190,6 +3190,66 @@ out:
>      return ret;
>  }
>  
> +static struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
> +{
> +    struct cpu_rm_data *data;
> +    struct sched_resource *sr;

const?

> +    int idx;

While code is supposedly only being moved, I still question this not
being "unsigned int", the more that sr->granularity is "unsigned int"
as well. (Same then for the retained instance ofthe variable in the
original function.) Of course the loop in the error path then needs
writing differently.

> +    rcu_read_lock(&sched_res_rculock);
> +
> +    sr = get_sched_res(cpu);
> +    data = xzalloc_flex_struct(struct cpu_rm_data, sr, sr->granularity - 1);

Afaict xmalloc_flex_struct() would do here, as you fill all fields.

> +    if ( !data )
> +        goto out;
> +
> +    data->old_ops = sr->scheduler;
> +    data->vpriv_old = idle_vcpu[cpu]->sched_unit->priv;
> +    data->ppriv_old = sr->sched_priv;

At least from an abstract perspective, doesn't reading fields from
sr require the RCU lock to be held continuously (i.e. not dropping
it at the end of this function and re-acquiring it in the caller)?

> +    for ( idx = 0; idx < sr->granularity - 1; idx++ )
> +    {
> +        data->sr[idx] = sched_alloc_res();
> +        if ( data->sr[idx] )
> +        {
> +            data->sr[idx]->sched_unit_idle = sched_alloc_unit_mem();
> +            if ( !data->sr[idx]->sched_unit_idle )
> +            {
> +                sched_res_free(&data->sr[idx]->rcu);
> +                data->sr[idx] = NULL;
> +            }
> +        }
> +        if ( !data->sr[idx] )
> +        {
> +            for ( idx--; idx >= 0; idx-- )
> +                sched_res_free(&data->sr[idx]->rcu);
> +            xfree(data);
> +            data = NULL;

XFREE()?

> @@ -3198,53 +3258,22 @@ out:
>   */
>  int schedule_cpu_rm(unsigned int cpu)
>  {
> -    void *ppriv_old, *vpriv_old;
> -    struct sched_resource *sr, **sr_new = NULL;
> +    struct sched_resource *sr;
> +    struct cpu_rm_data *data;
>      struct sched_unit *unit;
> -    struct scheduler *old_ops;
>      spinlock_t *old_lock;
>      unsigned long flags;
> -    int idx, ret = -ENOMEM;
> +    int idx = 0;
>      unsigned int cpu_iter;
>  
> +    data = schedule_cpu_rm_alloc(cpu);
> +    if ( !data )
> +        return -ENOMEM;
> +
>      rcu_read_lock(&sched_res_rculock);
>  
>      sr = get_sched_res(cpu);
> -    old_ops = sr->scheduler;
>  
> -    if ( sr->granularity > 1 )
> -    {

This conditional is lost afaict, resulting in potentially wrong behavior
in the new helper. Considering its purpose I expect there's a guarantee
that the field's value can never be zero, but then I guess an ASSERT()
would be nice next to the potentially problematic uses in the helper.

> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -598,6 +598,14 @@ struct affinity_masks {
>      cpumask_var_t soft;
>  };
>  
> +/* Memory allocation related data for schedule_cpu_rm(). */
> +struct cpu_rm_data {
> +    struct scheduler *old_ops;

const?

Jan

