Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F2592E4D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:42:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387317.623505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYTp-0001O7-OP; Mon, 15 Aug 2022 11:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387317.623505; Mon, 15 Aug 2022 11:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYTp-0001M7-LI; Mon, 15 Aug 2022 11:42:01 +0000
Received: by outflank-mailman (input) for mailman id 387317;
 Mon, 15 Aug 2022 11:42:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNYTo-0001M1-2w
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:42:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 455e09cb-1c8f-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 13:41:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7914.eurprd04.prod.outlook.com (2603:10a6:10:1f0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 11:41:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 11:41:54 +0000
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
X-Inumbo-ID: 455e09cb-1c8f-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIyqheKbvZw2hK3nOTir24eVR900CipsIZp1jGmA+VSk26W/J2a+MtU/GpWMiFeFZp60LTU6rkBCxxTEtWbKMoM6V6irVmIcn7faT40MWUVTdLojXwPZNjE+2sShmqbdEyZen6a89059fDWKPdPY8DgPGDqczQMYMXDU7ZuOMAhmfPS1ywiItt3o/QUn+6rw2IvtUBeulssV5edFAndK7gOnzwPdSRCLnmUSClKFEpBURuSCTczNp8yChV7OFrA9BsVrhDV0om16vum0aD8dsZxmcoMkeHkmQeCcBPxKizzoStIO3wlL5ImBY4FsHGyl73gO4In7MlmfJpnO2gXNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c5Xnjox/aFnKyU2Sf7zKAlWPBsEHfz6jZpO+CsRjB0=;
 b=kbw1KteXdnty3AAH0t3MfH2udpAHUim09CqcNEof++MRrVzlG6DhBoUaxCU5Kfxt/h9x9XpU88nnlbRwzkum21/Y7SaPjO8mEtyqfgzJMB3+uTemh/arvhQDJbvoCYT6heSNLy2d111jy+FitGRw8G2Lgu0XIQq/hkjczTL0eLClSDTmM8DO89P5UTyX9FXOrDtsKW8j0mGkjJsITuXCHgtSvAI4E6ly5Lod/jEzrXEUON8fIChRKiGv1lVWeY9PA4vWHUJI4abNTolezky8jKL5ZRm99WwfyJZTDSLObqdk+HtRYT5CTfFrkAqb1hr150j98w6qbsZNM1SHZLSx5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c5Xnjox/aFnKyU2Sf7zKAlWPBsEHfz6jZpO+CsRjB0=;
 b=i9v0aSV7PGhenLdqmhA9FucPoJDOsXDMeAmiJvX6wsya1FJ3yV8FcvrumUV5TPIDl4sK6l7psdOFs7iNx3rL0/BxERhB+RZ1bh5xQNxismyGyg1Ap52WbZcww9mlxKqhJPIgLSysa+9CmoaheH+PknHA2HOLeiWNKqGmfKOBzQXi6CZEj9ipSM/Sv/Hpf7IF7xhHKiUS4y4zlh5fEMnEQ0ZLSARsDf+hzJ86j+xoDV7vIgGNDIHkkM8CKjEKORNMrVcgwoYBfRfvQMxR7iN8JpFQMODzBHPZd3zsL0JwG/TQLU71dPpFk24k7mxVPwhfzA0MiBOpBQeipod2wsRvuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9abc061b-2d98-ace8-af4b-0881a5737dd6@suse.com>
Date: Mon, 15 Aug 2022 13:41:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] xen/sched: introduce
 cpupool_update_node_affinity()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220815110410.19872-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea53ca3a-7d56-41e5-0f64-08da7eb3272d
X-MS-TrafficTypeDiagnostic: DBBPR04MB7914:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qFbb3ihLTSUa6y5vEpiBC6wmLWov24AJln1AobYLpUTVkpMdOUSajukQ8S/F5czRGVhgp8QJ6yAcDQ8tMZY6JZQySpPaniNqVb+TofAOB+KKbxeUYKl+F1iQph5FFPFFdatCPT8e2/LEwQg/DUsgT8Z7QTl+mv/sOp46qN1Fx649lGRFHVBfX/iw9cp/2dCvC+H7TcAoo3itQwM8qu5ZEV9l7SPBHhitE7P5b74x/8hVhXBvlqLO21i0cdiDl4E6w1mjYb48wt8QlO0mu7zghJmRROMU0K7rBc1vqHqp72uRjn5TCrTpVngMx+eXbxuVwfwtLImGR/04V98omLez2yNwjs5Hkm9Tn73dAyDNScgr20ZSBkD+JKTh8XDHSrDAbUCtyQX+Fouodfev6AX355UBWLfQcbBPM13UdbmGcIibn+xox2mEJTREJ/zPw2C7dYR3ddBkPDc9Ia8c4OqwQDgL7Rkz5gzgagwlyyoJVcUlIJqkv0tVgZJZmjwK70tsQyy1wZRlNAQ/Vsw1MMmZUj21m1cB+baQ0IyNcyCZ9El/qDgCC1H3fnszfpYstPEgS/Um0dB5llef4wmv/TY7/d7PITSl61AMouxzJXi8xtnSoFCeECY5eaiG3mzoPxvaGRw1BuG/T229Xjd1H/YIiip1WGfcnrnNmFhAw0DzmO9biRHpx/NQrqsVBRa/YknZEXtxr1mn0yddSGramD2J4ChIsUXu4ULr+qyJR4uqhHhtMgj8RF9TKu3UMN22VOfIEn/0GVkAkHT0hdIImh1W1dJ4okd/3CbwAigLEmkw/DgIlwLPttikcIpt6LTJm7sS5xRQrsR1lqTj0+YDHc6+bQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(396003)(136003)(376002)(26005)(6506007)(38100700002)(5660300002)(53546011)(6862004)(6512007)(478600001)(6486002)(31696002)(8936002)(86362001)(66476007)(4326008)(316002)(6636002)(54906003)(8676002)(41300700001)(2906002)(31686004)(83380400001)(2616005)(66556008)(186003)(36756003)(37006003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1JvNGFaY0tXalByMlpnZmZpM0NHbHFTUlE1Y0NzSm9WQ0xGVFpTM0Q4UE9a?=
 =?utf-8?B?YTA3L2prNWJqdmUwcTN6TU5XczJkenJNWG96WTQzeHMzaU0vVE45U1RzWDU5?=
 =?utf-8?B?Z0ZhRCtjeTV3VXZ3c2NYY1pFWkViZlZFcG42TWt0ZklBQlVWVEdkdzBFcDIw?=
 =?utf-8?B?NHY4YUVSbk1mQi9RRWxDdUpBajdlMHlUQ3JSSkhuejJQeEpCeVlrTzNjVm9O?=
 =?utf-8?B?Rzd4V1hnZ3l6M20ySzJEc2lrZHl6Ly9tZ0JHcWhFdlVOMkt1UEtyOHlTZHNj?=
 =?utf-8?B?Z3dHRm5EUU1mQWJVVUtTWTdZMnNoTWV3UGdSQS81ZTJxUzJhZ2lyVm9sV3dX?=
 =?utf-8?B?U2htRDlES25QT2dLSzJ5UkZscXBBT2swNDFncThzYk0xaHBoY2pNVnk1a3ZY?=
 =?utf-8?B?UGNrcElSNStUbzN1aUhZNG1FSTlpRU9FRWs1SUFBYWx0aVMyQjVTL1B5eExz?=
 =?utf-8?B?NmtzTkIwVUx0V1RrK1ZPMDcvdkJEemtDZW50eGlDZFJqOXQ1ZlBCVE5RbmJ6?=
 =?utf-8?B?a0phczl4UmdtVTB5OUMzZHY4Q2Nqd1M1eHpEaFd4VDd4N3BjbS9ZR2h0aVFk?=
 =?utf-8?B?aDEyZzNBemU3bUJQc3RGTnFuT1RXalhZOTQ3NWJnKzZuWnVtbElaTzB4VkFr?=
 =?utf-8?B?VmxPVFZPM0VhdStxcGtOS0RNUFU2eW93Rjh4c1Fia0VGUVM3VisvaW96Yld1?=
 =?utf-8?B?SXZRMEc1Z3hRQkUvdFh4RWhHSHE3ei83TFlhRFNIODIwUWpETGl5NGl0eFdr?=
 =?utf-8?B?Ty9MZjFvSFgySW93UjhienpJcEN4MDB1dU9mTDBqdlNMN3l3NlM1OENyTmwv?=
 =?utf-8?B?ZUczdHRDNGhFKzAvR29ENXlZQmVBT2U5ZVBrcXNFby9pOVhYUUJlUVlScWlH?=
 =?utf-8?B?NG14TWJ6RHZNNW9lNlZlQXBjYzdMY3dmVTg0ZXRtOW45RWxwcXpUa0hjTmZq?=
 =?utf-8?B?dlJRYzlaaGsvRHBGZUQvQlBzT0VJRkE0K09CcUVSRy9IL2RSQ0tSUVAya0FH?=
 =?utf-8?B?dXI3U2ZaOERON0laVGRob0g4NjNockRDblBhN0o5OVhNRHY5Yitma2dDZWlC?=
 =?utf-8?B?K3pCYTlpdFR6R095NHBjeS9XdTFQNmx0NW9NeUpaa010eGdFQjhYL055TDNP?=
 =?utf-8?B?VlFIdjhWQ1Z3dk9vT2lnemtKM0I4VGhscS9wa1REU0JvcUpSenQ5Nk1kbUN4?=
 =?utf-8?B?TTIxR0luTzdEcVlJRm83Uk52a0o0dlJLRUdEMlEvN1RXTGlXcE0yZlE3Uklj?=
 =?utf-8?B?NWhZeEdrSkwvYjdmRFlrWmJ3WW9EZXVEVnRKMW9URGcyWDJFTmo5djNCRnNo?=
 =?utf-8?B?cFN4Vkt3Y0VWSWFJM3VQVkxtZi9PY0poZnZWNjg5UTFUZ25HdjJHRzZqdGlR?=
 =?utf-8?B?RW1BTzRZcnEyZXVVQzVRTmxWZlVsTG0zeTBEeU93WGpMb2pFMStBdHJSRGNY?=
 =?utf-8?B?OFRaZ2pFYlJCVlMyN0RCZ2JpYzhldktQRHJENjlYYnh3dElHM3FqRmZGSVF4?=
 =?utf-8?B?dWp5U2lLNUttZS9Uc1hIbDhjZE9aem90ck1YTldKczNmWm1GbmMwekc5VTVI?=
 =?utf-8?B?MW9lVmVJYnF5NS9qTFNrNCtyTzM1UEkyb0xEajcrek5BV2dqd3hBcEN4ZUkw?=
 =?utf-8?B?WEh0REE3L0VEOWVlbFhxSXMxNVZlai90TUhqdWRvbEJqN1I5U0phSW56Q1dK?=
 =?utf-8?B?ekZPc2I2SjZ6T3lyQUlkR0JjUlY1SHVIdHY5K2l3bmo0bXBkZ1A2YTZMNlA4?=
 =?utf-8?B?ZkFZbndjaExNS2NVbXRVRG9RcTFDQ1JIRnZSSHV0TUNha1JZaGtaVGU5by9M?=
 =?utf-8?B?M0Rsd2d4di9ENDBMVTNMVzZmZHcxcmt4K0Z2SENOS1pGd084bkw1ZXpFOE9z?=
 =?utf-8?B?VldaTWppeUJCUTg5Y0RtNzkvZmI0ZHprdzhMaEpRMmc1SUluc3c3WVZRdTBw?=
 =?utf-8?B?RFgvTDlQUVV0cCs3dkRQenY0am03cGp4WTNuY0hOaDJBM21qV1dyWDJnOE0r?=
 =?utf-8?B?NHdPZXVZaUg4TzgwOUxTQU1RL1d2N1JlSEE5bVlzMEdVYVNLNFBJWW93QSt5?=
 =?utf-8?B?elRqdDFkelFtMXVrUFVSYVlQVEtrVTRPT05sNmVkV2hETk1mK0JVSlZ6NFVl?=
 =?utf-8?Q?3TcS4izeVQ/rq6W2bpZbAvi7E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea53ca3a-7d56-41e5-0f64-08da7eb3272d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 11:41:54.8950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSL69aqzl/v4BTBVKauzqlhNBLD0XjssvK3ZG2g8stgtZQrf0xnmbt7h3XAEvzgr+ZKmPFaEA3U3gUdQGvV/Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7914

On 15.08.2022 13:04, Juergen Gross wrote:
> For updating the node affinities of all domains in a cpupool add a new
> function cpupool_update_node_affinity().
> 
> In order to avoid multiple allocations of cpumasks carve out memory
> allocation and freeing from domain_update_node_affinity() into new
> helpers, which can be used by cpupool_update_node_affinity().
> 
> Modify domain_update_node_affinity() to take an additional parameter
> for passing the allocated memory in and to allocate and free the memory
> via the new helpers in case NULL was passed.
> 
> This will help later to pre-allocate the cpumasks in order to avoid
> allocations in stop-machine context.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with the observation that ...

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1824,9 +1824,28 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
>      return ret;
>  }
>  
> -void domain_update_node_affinity(struct domain *d)
> +bool update_node_aff_alloc(struct affinity_masks *affinity)
>  {
> -    cpumask_var_t dom_cpumask, dom_cpumask_soft;
> +    if ( !alloc_cpumask_var(&affinity->hard) )
> +        return false;
> +    if ( !alloc_cpumask_var(&affinity->soft) )
> +    {
> +        free_cpumask_var(affinity->hard);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +void update_node_aff_free(struct affinity_masks *affinity)
> +{
> +    free_cpumask_var(affinity->soft);
> +    free_cpumask_var(affinity->hard);
> +}
> +
> +void domain_update_node_aff(struct domain *d, struct affinity_masks *affinity)
> +{
> +    struct affinity_masks masks = { };

... the initializer doesn't really look to be needed here, just like
you don't have one in cpupool_update_node_affinity(). The one thing
I'm not sure about is whether old gcc might mis-report a potentially
uninitialized variable with the initializer dropped ...

Jan

