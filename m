Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D230F566554
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 10:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360683.590111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8eAb-0001Ej-Hl; Tue, 05 Jul 2022 08:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360683.590111; Tue, 05 Jul 2022 08:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8eAb-0001CJ-Er; Tue, 05 Jul 2022 08:44:33 +0000
Received: by outflank-mailman (input) for mailman id 360683;
 Tue, 05 Jul 2022 08:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8eAa-0001CD-C0
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 08:44:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af812554-fc3e-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 10:44:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9450.eurprd04.prod.outlook.com (2603:10a6:10:369::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 08:44:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 08:44:28 +0000
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
X-Inumbo-ID: af812554-fc3e-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjZKGFam89p2hcwuBQnhH+gfWVTx3PUyyfniwiGqiNgoshmlnDxaHPO75zg04BVhnbDDhEto+YJkp9N3BhtE7UATVhfYc1b5F5Tl4nnbqBGZg6N8OB9nHWokGd4oUZ0JRi4KH0j2BAKI9XKjv1gJlL7m3eSKoUVev/omzHMbHzBaDl5ZtRRIFW7XY5/JAkF3nrkXUaD2TuFj4HXkE/En/1x5q8N3xuA3jsemK615KzaoB0hcW6Lhn+6mpPdM0Haiz1cJF4iDT6L+c1ND+0NaHvwvQRgU1/1e8TVpZ4wXmDOP75vQvAbj22h7L2ZCjzSvl/vqZEG1f4JlavnfhW2Ldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cDwZpqa5KPrlAl4ZCkM3Ax2z2QShSo5yP48/j/vqPg=;
 b=IhgGFEbHN1vzgyKO1tySorF1c3bCXJJ9GagJ3cWi3Uue8c8k9dbeKP9Qd0mQ4WEvtDWpva6HJkYkB5dGT7krnBh/WpKk8/hloKxnB2H1pVMPscjzsHyVfsfiS0kMhGB6h/k+JbPIzmOOErRCJrhPaW3gbwHYCEtq+qLxI1SiXvsLAXoVUQVuLa5bDwic2RHjLKFW7azVwaJh6QyWA6FMhTAklodX04KrDfbTSLyd6BYvx5bnicdkOI2g1kIO3SEGEhsFRM6hUjNpnBdP00wexZqcQ1ZBCMzCHes69JZxvE1OfI2KhaLq5lgs1ZduDkILBGKW3QNSBve4FLRO0FhBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cDwZpqa5KPrlAl4ZCkM3Ax2z2QShSo5yP48/j/vqPg=;
 b=5zbNyf9EraiRqvP7aaxp9jGdu8SCV9l8SnNYxbZW4Am5O3OCQOee9DFPnBn59bv9E6nuWaxY2AiApEX9LZPM+VbcfqZR6kVvTjNpxcdhaTfWX1RpR/vRhfFbuOE9BehgMu7PeHvex4GD9fdWR4LS3Ins1UJ/zOXYGBsqC+0c35rOvoylIsh4zbm2KhgAyYweuEgu+AekHtVH05loF3YrY+f1+5upv0pqGfG0eKy9Uu2VM3i1mvlXxmIVeFFqCxPsFOieCfw+nBiWnIzEL0cton2T0EW4ONHmqITglLLMP8om3sv1XFamV/zNLqeeynH/kSNYN5gpAgmVKj4x3mg47w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3cb46257-c6e7-9735-c824-abb296668ee3@suse.com>
Date: Tue, 5 Jul 2022 10:44:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Ping: [PATCH v2 1/2] x86/mwait-idle: add 'preferred-cstates' command
 line option
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f8cebd1c-1679-7b67-c43b-8c0cbe8ffa52@suse.com>
 <46c6bf61-5669-0de2-163d-64b9a3ce07a7@suse.com>
In-Reply-To: <46c6bf61-5669-0de2-163d-64b9a3ce07a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31884b70-d7b6-4ea7-3bcf-08da5e629273
X-MS-TrafficTypeDiagnostic: DB9PR04MB9450:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/AJGcCjUZ6XykNgldPNeXxBmlUcZAIgLs9NN2Zdpp/KQIxE7nBOCu4w4otnRIePN3XqvXldi6/pZeBoHDZIzlpgo9/RlaCJeE116IMJdMVzIvFGHdr5eJewYlMFK/tieXnBG6uEbotYTo6C7JTNIW1WDmDuyiGCoLKhaYxCzhMkx+MvAFtqTNDXnA9XX4JILc+FR1CnWJN7ewtfQ1EE62co4luMNDqEZJ3rH7El/w5+saFVbdMqG7J18PsE5MT48ih00nMpVa/5L+i6oa6Ye3ZzbvCrUxGVOzhINXkIhbCAo3yj90Y4eg1IIvpSBpHE3VlOYmyjaZ9tTYXwYB25PHJDhcEjUqjNMHBtKZdKKjB/rVWQPq4fVjanLkEArez2yAwN5xZ0Q66y8VAP8j8aSy4TQ9OF/9V9zPOhXHIlucSk4+lPvoV/ChUJUsoWtHtkCgJ0qOkTBYIuKEPYiro/1skmVSGJ5So/wO1D+Qy5ZPHz/svL4IJIpcMRxeGtCEtHRC8jMdAPopRGOTkmKnHg0sWDWaJNFeL7QWYtIOVN2is4rn+dZci99J6QADZeo852cMUz/07cn0iEnp0L5qLsTh/k98NTXN4ASQ06x1iV09oq7yRzZapVuFNWIj0XbIXld4I7SB7xYI0q5YFj3CbeByBI2Z7wecf5D+4SNwJrMiJLQkA4zLlf57esvTlZtOZRo8RdeXaCjLaWk1NvQ2uEYK/OjQ7TI0WwF9OScxrr5zCFLRoYdXD4ph1dzGQA7cc4lIOW9kHtVQp6k2pA6f77l6PW2jl2lVdklxDj+gB0q7LaFQZaGMkURUOJOLriMABaZax0mD9RgGh8fiStItkqwWCIWoMrRg8qsLgoOYsCf7LA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(346002)(39860400002)(396003)(376002)(38100700002)(66946007)(110136005)(66476007)(5660300002)(4326008)(8676002)(66556008)(54906003)(316002)(86362001)(31696002)(26005)(2906002)(2616005)(36756003)(6486002)(41300700001)(478600001)(8936002)(6506007)(30864003)(186003)(53546011)(83380400001)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3NNaEJ4UjVJTWpCRzRzeGtYN1I4L2FWdUNlSTVDVTJLWTVCTU0vRVhQQ3gv?=
 =?utf-8?B?MG5zSWJXQnFKNjBJTlZ5Wk01bkFmZXN5cGZPZi9xWnlUT3FFOEV3VVM4WFVY?=
 =?utf-8?B?b09UOTl1Z0VTYjdUazNSN09KMnlFS0ZIcjhlVnlISWhmN0JTV0dkWE9WTE56?=
 =?utf-8?B?L2ZnSi91a2xYNFM0VExVUmZYSmE0cnBxWTg0VzczSTFIYTc5VWRVdkQ3U0tz?=
 =?utf-8?B?WHpFSnlnai9HekcyazM1K2pRaWpETmVwcjVIV2RERXErMWtYU0w1M09Ha1VC?=
 =?utf-8?B?SnozWkduYXpRZGV1S0ZyVkhQSWU0Ykp6RmNXcnF6Rngyc2Q4V1RMdEM1Z0Fs?=
 =?utf-8?B?R1FGODVBS2JXUnBFRzJ4V2dRT3YxbHVBeklhLzV1TFN2eDZDeDMwd00rUlJy?=
 =?utf-8?B?eTU3OTBDUXBkVW5MV1FSSW5XSnNaeVBEcmcrTHVuczRnQk5oZm12eUlsRzh4?=
 =?utf-8?B?MXMzVmVGdFZCS0JFemZZRE9xWUVxZW52NmZjeFFsdDNlRDFjNHlrWXpIdnQv?=
 =?utf-8?B?cEJ0SUduY3A5N2xJbXNoOVdpTXRrY0M1UW5sdm1ZcUNmc3N2Y2dkSVlFcDYy?=
 =?utf-8?B?VDRkSUtuNkFvT3pEYitsbWpDTitDaVVFZThqV2FQWHRNellWQzNWTWJIb2tY?=
 =?utf-8?B?VDVEeGh1bVAycXFOTGlBanJqc0x0aVZGSTAvTnlWWlJ3MElnWFdOUDRMMGZk?=
 =?utf-8?B?Nkd3ZExMc2FMNURCZHlhaVhEYW5KQmRsQzcwVm82d09rTFd0VXkwbzVNNmVu?=
 =?utf-8?B?MVdKNExURWwxS1Z4MzRFYVgwV1ZUSE1UYmNBNDNtU3BpRTBiQmt2OExYTktT?=
 =?utf-8?B?TGY0anV4T0NwbkllWFNnMTZwT2JVT0hRVllSa2VubHJsOExLWVpWaWpxWVNl?=
 =?utf-8?B?dU0yTG5HTWxNZzBmT2hQZ2lybmZTMTdHbkgyeHlUUGFmRHFqM2dxTFZEbWdz?=
 =?utf-8?B?eVhFQ0IvNm4zK2NvSlE1S2hnNU9uSDFZK0pMczJTcGJ4Z0Vub1hZTFBWNFBv?=
 =?utf-8?B?ckZLWnZHTDNmQnk3N0xCS3hXVHJKWTlGbnRIRmxVdmU1RmtLdFRZaXlndE5I?=
 =?utf-8?B?dG0wWU94V3VCQ1N1SXBiWWVMWGxkbDVrcE14VjhLMmVOR3I2eTdHRktHTE1m?=
 =?utf-8?B?KytkVFhKZmFBWmNkd0NvUHQwdEV2dmo0VVJzcis5alVoelhwMW1QV093aEhz?=
 =?utf-8?B?Rlp0ekQ1TlBDRkpIMm5rMW9udC9UQU5KYnpwaFZodEdQSFRmaEZna2NaY21Q?=
 =?utf-8?B?dmpiZ3lYRGdYZVMrRjhqMGVod0hwQ3lMZXYvYU1FYXhIdFBwTWgvMEdZclVH?=
 =?utf-8?B?V2NlYXJoYTdralIxWDNiYXdBd0l6NGozTjVqUElZaDdnUE9MRmc5N0lNSU5h?=
 =?utf-8?B?RU5tNnRVYTRScGpnZlZkZWdDNXJBTVhIeG04bkZMaWxIZlV3bk4yY2lXQ1Yx?=
 =?utf-8?B?U3dZU2wwV0U3bGdmQnlHR0FsZGFvN1luMU5vc2V2Y20wYW1hMDRnQUdobWNS?=
 =?utf-8?B?R0dld1IrL0tzSlhTVEhyU1hNVGJ5T0doYjZMbVMyeHEyeW9EUkdFQU1hMTI3?=
 =?utf-8?B?S0NEVHpHcFM0QUFJNWdCNHhOR1BiMzd3RUdhdHlNckZxM1Z6NUhIaUVWbzdH?=
 =?utf-8?B?YVh5enhReElEdjNJS1crOHllQVV5b1dLa25GK3VqKzlRejJ2OXBMbTBweUs5?=
 =?utf-8?B?eUVLZGVjMDY1b2hOQSsrU3QzNzliM3NmMnVSYVArbVBGVFROL1FMNG81OS8w?=
 =?utf-8?B?c1BvME9QdTlRWFFDWmZaNy8wci9VbXRobk1DTWprbEZZejhVWkxMQlVVQTRS?=
 =?utf-8?B?ZTNoTy92cmtHVVVFSzJ2eHhGdnR5RWxZNzUybGsrbW85YnZNeURVaWs4M0Zw?=
 =?utf-8?B?OHpielhFYjd3TGpsMkJJMm9CcGhpNnZ6VWFKRnppak53YjZrWitpckEvSmlK?=
 =?utf-8?B?R25hUmRtN2dZckpKV1VKSFBXU1ZzME1LNm5Ba1RpdGRYaHc1a1FacGg3M2Vp?=
 =?utf-8?B?VnhIdWNRVThRTkNad0VERkNJTmNqa0dHNW5GMXRRekthNmxmd1hmMFlMODdI?=
 =?utf-8?B?TGxNVysxdlJmK1RRaXdPUlZjblI0UzJPSmg4cnpxRUlsazFiejcyUTU4VmN0?=
 =?utf-8?Q?lUzX0VpKSHS4IZfEqS7Gp+M78?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31884b70-d7b6-4ea7-3bcf-08da5e629273
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 08:44:28.4896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IOoADXeQQuQTUS8beWH3HUnmh69o5NpkqYq6V8geJS4ZY8JTarQUBGtKrQKlOJ5+7gteMd9+f9m3XGOdhS/lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9450

On 02.06.2022 12:26, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> On Sapphire Rapids Xeon (SPR) the C1 and C1E states are basically mutually
> exclusive - only one of them can be enabled. By default, 'intel_idle' driver
> enables C1 and disables C1E. However, some users prefer to use C1E instead of
> C1, because it saves more energy.
> 
> This patch adds a new module parameter ('preferred_cstates') for enabling C1E
> and disabling C1. Here is the idea behind it.
> 
> 1. This option has effect only for "mutually exclusive" C-states like C1 and
>    C1E on SPR.
> 2. It does not have any effect on independent C-states, which do not require
>    other C-states to be disabled (most states on most platforms as of today).
> 3. For mutually exclusive C-states, the 'intel_idle' driver always has a
>    reasonable default, such as enabling C1 on SPR by default. On other
>    platforms, the default may be different.
> 4. Users can override the default using the 'preferred_cstates' parameter.
> 5. The parameter accepts the preferred C-states bit-mask, similarly to the
>    existing 'states_off' parameter.
> 6. This parameter is not limited to C1/C1E, and leaves room for supporting
>    other mutually exclusive C-states, if they come in the future.
> 
> Today 'intel_idle' can only be compiled-in, which means that on SPR, in order
> to disable C1 and enable C1E, users should boot with the following kernel
> argument: intel_idle.preferred_cstates=4
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git da0e58c038e6
> 
> Enable C1E (if requested) not only on the BSP's socket / package. Alter
> command line option to fit our model, and extend it to also accept
> string form arguments.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Also accept string form arguments for command line option. Restore
>     C1E-control related enum from Linux, despite our somewhat different
>     use (and bigger code churn).

Any chance of getting an ack here, then also unblocking the 2nd patch?

Thanks, Jan

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1885,6 +1885,12 @@ paging controls access to usermode addre
>  ### ple_window (Intel)
>  > `= <integer>`
>  
> +### preferred-cstates (x86)
> +> `= ( <integer> | List of ( C1 | C1E | C2 | ... )`
> +
> +This is a mask of C-states which are to be used preferably.  This option is
> +applicable only on hardware were certain C-states are exclusive of one another.
> +
>  ### psr (Intel)
>  > `= List of ( cmt:<boolean> | rmid_max:<integer> | cat:<boolean> | cos_max:<integer> | cdp:<boolean> )`
>  
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -82,10 +82,29 @@ boolean_param("mwait-idle", opt_mwait_id
>  
>  static unsigned int mwait_substates;
>  
> +/*
> + * Some platforms come with mutually exclusive C-states, so that if one is
> + * enabled, the other C-states must not be used. Example: C1 and C1E on
> + * Sapphire Rapids platform. This parameter allows for selecting the
> + * preferred C-states among the groups of mutually exclusive C-states - the
> + * selected C-states will be registered, the other C-states from the mutually
> + * exclusive group won't be registered. If the platform has no mutually
> + * exclusive C-states, this parameter has no effect.
> + */
> +static unsigned int __ro_after_init preferred_states_mask;
> +static char __initdata preferred_states[64];
> +string_param("preferred-cstates", preferred_states);
> +
>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
>  /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1. */
>  static unsigned int lapic_timer_reliable_states = (1 << 1);
>  
> +enum c1e_promotion {
> +	C1E_PROMOTION_PRESERVE,
> +	C1E_PROMOTION_ENABLE,
> +	C1E_PROMOTION_DISABLE
> +};
> +
>  struct idle_cpu {
>  	const struct cpuidle_state *state_table;
>  
> @@ -95,7 +114,7 @@ struct idle_cpu {
>  	 */
>  	unsigned long auto_demotion_disable_flags;
>  	bool byt_auto_demotion_disable_flag;
> -	bool disable_promotion_to_c1e;
> +	enum c1e_promotion c1e_promotion;
>  };
>  
>  static const struct idle_cpu *icpu;
> @@ -924,6 +943,15 @@ static void cf_check byt_auto_demotion_d
>  	wrmsrl(MSR_MC6_DEMOTION_POLICY_CONFIG, 0);
>  }
>  
> +static void cf_check c1e_promotion_enable(void *dummy)
> +{
> +	uint64_t msr_bits;
> +
> +	rdmsrl(MSR_IA32_POWER_CTL, msr_bits);
> +	msr_bits |= 0x2;
> +	wrmsrl(MSR_IA32_POWER_CTL, msr_bits);
> +}
> +
>  static void cf_check c1e_promotion_disable(void *dummy)
>  {
>  	u64 msr_bits;
> @@ -936,7 +964,7 @@ static void cf_check c1e_promotion_disab
>  static const struct idle_cpu idle_cpu_nehalem = {
>  	.state_table = nehalem_cstates,
>  	.auto_demotion_disable_flags = NHM_C1_AUTO_DEMOTE | NHM_C3_AUTO_DEMOTE,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_atom = {
> @@ -954,64 +982,64 @@ static const struct idle_cpu idle_cpu_li
>  
>  static const struct idle_cpu idle_cpu_snb = {
>  	.state_table = snb_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_byt = {
>  	.state_table = byt_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  	.byt_auto_demotion_disable_flag = true,
>  };
>  
>  static const struct idle_cpu idle_cpu_cht = {
>  	.state_table = cht_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  	.byt_auto_demotion_disable_flag = true,
>  };
>  
>  static const struct idle_cpu idle_cpu_ivb = {
>  	.state_table = ivb_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_ivt = {
>  	.state_table = ivt_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_hsw = {
>  	.state_table = hsw_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_bdw = {
>  	.state_table = bdw_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_skl = {
>  	.state_table = skl_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_skx = {
>  	.state_table = skx_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_icx = {
>         .state_table = icx_cstates,
> -       .disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static struct idle_cpu __read_mostly idle_cpu_spr = {
>  	.state_table = spr_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_avn = {
>  	.state_table = avn_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_knl = {
> @@ -1020,17 +1048,17 @@ static const struct idle_cpu idle_cpu_kn
>  
>  static const struct idle_cpu idle_cpu_bxt = {
>  	.state_table = bxt_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_dnv = {
>  	.state_table = dnv_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_snr = {
>  	.state_table = snr_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  #define ICPU(model, cpu) \
> @@ -1241,6 +1269,25 @@ static void __init skx_idle_state_table_
>  }
>  
>  /*
> + * spr_idle_state_table_update - Adjust Sapphire Rapids idle states table.
> + */
> +static void __init spr_idle_state_table_update(void)
> +{
> +	/* Check if user prefers C1E over C1. */
> +	if (preferred_states_mask & BIT(2, U)) {
> +		if (preferred_states_mask & BIT(1, U))
> +			/* Both can't be enabled, stick to the defaults. */
> +			return;
> +
> +		spr_cstates[0].flags |= CPUIDLE_FLAG_DISABLED;
> +		spr_cstates[1].flags &= ~CPUIDLE_FLAG_DISABLED;
> +
> +		/* Request enabling C1E using the "C1E promotion" bit. */
> +		idle_cpu_spr.c1e_promotion = C1E_PROMOTION_ENABLE;
> +	}
> +}
> +
> +/*
>   * mwait_idle_state_table_update()
>   *
>   * Update the default state_table for this CPU-id
> @@ -1261,6 +1308,9 @@ static void __init mwait_idle_state_tabl
>  	case INTEL_FAM6_SKYLAKE_X:
>  		skx_idle_state_table_update();
>  		break;
> +	case INTEL_FAM6_SAPPHIRERAPIDS_X:
> +		spr_idle_state_table_update();
> +		break;
>  	}
>  }
>  
> @@ -1268,6 +1318,7 @@ static int __init mwait_idle_probe(void)
>  {
>  	unsigned int eax, ebx, ecx;
>  	const struct x86_cpu_id *id = x86_match_cpu(intel_idle_ids);
> +	const char *str;
>  
>  	if (!id) {
>  		pr_debug(PREFIX "does not run on family %d model %d\n",
> @@ -1309,6 +1360,39 @@ static int __init mwait_idle_probe(void)
>  	pr_debug(PREFIX "lapic_timer_reliable_states %#x\n",
>  		 lapic_timer_reliable_states);
>  
> +	str = preferred_states;
> +	if (isdigit(str[0]))
> +		preferred_states_mask = simple_strtoul(str, &str, 0);
> +	else if (str[0])
> +	{
> +		const char *ss;
> +
> +		do {
> +			const struct cpuidle_state *state = icpu->state_table;
> +			unsigned int bit = 1;
> +
> +			ss = strchr(str, ',');
> +			if (!ss)
> +				ss = strchr(str, '\0');
> +
> +			for (; state->name[0]; ++state) {
> +				bit <<= 1;
> +				if (!cmdline_strcmp(str, state->name)) {
> +					preferred_states_mask |= bit;
> +					break;
> +				}
> +			}
> +			if (!state->name[0])
> +				break;
> +
> +			str = ss + 1;
> +	    } while (*ss);
> +
> +	    str -= str == ss + 1;
> +	}
> +	if (str[0])
> +		printk("unrecognized \"preferred-cstates=%s\"\n", str);
> +
>  	mwait_idle_state_table_update();
>  
>  	return 0;
> @@ -1400,8 +1484,18 @@ static int cf_check mwait_idle_cpu_init(
>  	if (icpu->byt_auto_demotion_disable_flag)
>  		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
>  
> -	if (icpu->disable_promotion_to_c1e)
> +	switch (icpu->c1e_promotion) {
> +	case C1E_PROMOTION_DISABLE:
>  		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
> +		break;
> +
> +	case C1E_PROMOTION_ENABLE:
> +		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
> +		break;
> +
> +	case C1E_PROMOTION_PRESERVE:
> +		break;
> +	}
>  
>  	return NOTIFY_DONE;
>  }
> 
> 


