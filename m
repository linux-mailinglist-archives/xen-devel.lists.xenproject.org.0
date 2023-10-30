Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7B87DBC3E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:01:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625177.974183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTlW-00084a-A2; Mon, 30 Oct 2023 15:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625177.974183; Mon, 30 Oct 2023 15:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTlW-00081w-6V; Mon, 30 Oct 2023 15:01:18 +0000
Received: by outflank-mailman (input) for mailman id 625177;
 Mon, 30 Oct 2023 15:01:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxTlV-00081q-7H
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:01:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c39e75f-7735-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:01:15 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7442.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.18; Mon, 30 Oct
 2023 15:01:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:01:13 +0000
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
X-Inumbo-ID: 2c39e75f-7735-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaJk2m4TnDuiONzoQ/KKpyv2wCCKGnsTi9XjwnKUa/+6kQhodKrGQurA6ZNw+hnrJGHhKqdplX0UeUvkFOlIHTM0WEY7l3+gFtudxXios2lSCXIxVJo7cBwT7qJzW/+SzM66Qtmuket0O6stXvGsLSSCykmVvH8PTqgNvCbdGhKRGjoCfCB70QfYeM54NzLM3FFEf6jcP/0EvIaC1KdWqPna87l1nZKPQty8+6D2bs1DIn34nLiNys4iPPx0l2MZnz9eWxUXCkpBvOCMD03GIMP4dLIzVQKWMAJZbg2zEmC3dKiPp5tTJNAlCUjS3uqQLtg7acVGgAZNJYD2ZPJhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icjcyNuIn5b0D9mqM/w/ep/8gav10tNy7bxwpu/29wM=;
 b=J20ibSDQQQ0UzHj8c8JZa60OsrMg+CVSZ2rMnhsSEeFuvjXEq3ZrUXiR3otKVokaAevZj32rnUpQnXIJj+YQhecwwKUdLWebntWkSuNVb0NpbTvY+ZglGibcL/oXcU/0aEU7Jqx7vQY2nSbbN4ARvFKV6sV/fWumgYen1sX26fq+5uCNrdccInU2LJI7rKt6g+9kcJBBJeZfzsKhuLBR292r4We1iUd+5k0eIf9RUEPzwCYsqvEG/nQi1vKGW/JSziK37+YBLEcejOhwJX7RALf8bNgZxGA3VH9HGMoz2KCxJ6letm4fsxu4AxO9uYeSbj8+RzY8CweXkLT4e9mk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icjcyNuIn5b0D9mqM/w/ep/8gav10tNy7bxwpu/29wM=;
 b=MWeDhcLp3BgCDb9CIdsOn0vytjKvzBlamBsNwCJq5BCbG22+KTzgswdJ8uV8hBO5vGLR+b8t6IdeljcgbwLWom4HIWzawFYWxlZ3EZRRN+KKb09XlSNoa1Qs9DWrtPiyzxl7RlJH/btN9pOS9g43ABEVe4zlQwT74/j/5kVbuY8g0RI8Zm8BzZmag528OCnVsTpx4C3M9aGGsdz6ZJr/5PK40t0kfi4PAi/SGJYjWmzCXkqO+gkmV3qRfZwG6cAPmM+xRYW6dL8UJce71PaBwWI15329NpFUZGRXhzCLdVvtNaIAXhQxppar48+CUm0sI5TNwFWR0pNkiFS94in7YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e21cb579-842c-a3c3-db82-067dc023ef06@suse.com>
Date: Mon, 30 Oct 2023 16:01:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2] x86/iommu_init: address a violation of MISRA
 C:2012 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <ba5d1368fce181a6a3a6abc150651e1e5323e489.1698238686.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ba5d1368fce181a6a3a6abc150651e1e5323e489.1698238686.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: abdbd5ba-e5be-475b-33e7-08dbd9590ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JfGGzU4HIhyMmOca6Rw6W2vaJPXI9o6m2nUpgPN9AhybjP+j7D9tE8YMoE/7dCB5BNixSVH2gpIMnrqxSH3xHloabkFiSkGy1Pih89veEPkCF+HFR3Fr2vuQ8lLDFtvrbn5uCsRdIHUo6M2HhGhUZWOaYHerUTPkGsfPJlHEAg5ms8ylgXf2cuOlnlweU4U+uuw7bfgxpNgcSV1PcSWsXHc483WuBo90allLXeXLwcMiquNrtE5Cn9KAPwSRA5HGxzrh8OedpuB77ywSMVnusuyCeUYXKbU+fz6WAxexWObwRSH3ve9jpemExOZ6vC3moId7k0/63Fg2rzXwwaTP0yuOTy9+RpFLVvVCF5LCCKAGfY+69fj1ihrZBs9leG7uQ8WO5RQvdiiuvWBZyRY9OSV8xo/D63n6COwbQ5IVN7T8hP6RHW9mD4pmmD+LFDTuKm7WF3HN0Bf9nxpR/LyAygyzlPmd079An5TrE1xsY3NAZcwBn6qxvyDxxQ9Puw9EQAK0NxQBd/zy5WzBTaU3nePtV110P2HmMlkeSPt0xnhWbDEIxnjzqd/xEdlFoyt9+IPVeiBsiTB+D4du3HEwpbZN44Q/bef30H4db8EAMNUQDIl7aXl83y58AhJkWhFyNNUrraXcLB/Zm19ZqU8kWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(478600001)(6486002)(31686004)(6916009)(8936002)(316002)(4326008)(8676002)(66476007)(66946007)(66556008)(6506007)(53546011)(31696002)(6512007)(38100700002)(26005)(83380400001)(2906002)(41300700001)(2616005)(5660300002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUVlamlUU3pqb1RYc053UlJzL3pvQ09HTEVKa09SN1l3eHpXR2V0Z3hmR00x?=
 =?utf-8?B?R1VvbC8xQXZSVWUrKzY5Vm1jT1VKUW1KbDBCN1lhS2VycENaek13Y0tqWnBi?=
 =?utf-8?B?RFRqNkl0SWNDKzZHaE1HVnd0ZG5ESzZIdi9COEJhUTYwK2dhZ2pUMDlrWFRj?=
 =?utf-8?B?amZFUzl1Y2x5SmZCUndhOEZtYTJwVzYrWEh1OXlkQTFLMW44eVB0RnpEckp6?=
 =?utf-8?B?K1FKVTZSOTV6VTB4aS9mdm5OZDN6b05md0h5QUt2a0tyWlBPSnJ1K0Jta3c0?=
 =?utf-8?B?M3VSSkt3WFlLcG1jcVNEZzY3cDUxcW96OTNBa1grenpSZ0U0c1NwNUFsU3h1?=
 =?utf-8?B?T3pFN2JnTWhuYlR3OXoreGJPWUszS0E4cnNoU0FhbU90alUxZEF1Z2FnQmo5?=
 =?utf-8?B?MzdIYlVBb1pPSVBXWEtsKzc4azRTcFp2WjRyRXpVVVc4WmpCTld3ZkdQNmRN?=
 =?utf-8?B?U0ljZ1R3ZGNUVExtSVJCcFJmQXdvcUhPdWZFZnMwdFVIUmhlTy9mRFFUZzlB?=
 =?utf-8?B?T3l2eDBWT2JJck16Y2lTeUk5QVkzQ0lndVRnblZnUnQ5WGdVZ1JNMEM0UDFU?=
 =?utf-8?B?TTNDb2JQOGcvZnVhOFZ2RjhSZzJPVllPMncyVjhlcndvYTk1N1cwSTVmOVdK?=
 =?utf-8?B?cmtiVnFsTWJPS29HbTlrNHpRa3BaTnU3UXVaa3dsT3ptcUtLNDkrZkxyUkZy?=
 =?utf-8?B?TWJKT0Qxdmw5MFR5L2V6bEJQZHY0SUVkbk9TK2x5UG9CTmpMdjNiMVlyYmxm?=
 =?utf-8?B?NS9UZ05DeFd2N0s0NWpnOEY3TEEwcnR6aWl1dUgxc0pmWldTNUwweFpHRG56?=
 =?utf-8?B?S1A1ZXl5V1BEc21KTER6NE9qalBhSmcxTU1HdXFkT09salNIdG56NHZTbzVq?=
 =?utf-8?B?YXJnOFJLUk8wdnZPK3NQRmJMa0VrWHZ6RmdSdkJvbjhOekpoQVhRcXBNUkp2?=
 =?utf-8?B?YitidlRGS3dESFlVNnp6QkVScmFuOFAyNXdrNW10RWdaOEpBZTFzSWQrbHJo?=
 =?utf-8?B?YkJsb1dsekNrQUdyRlhJL0JMRVE5V0lhTGhoeFk0SUhrNlVNelh3MWVzZ1Rn?=
 =?utf-8?B?RlgxckFoUGpyaHR0NGxGODZtNEJVQ0F1enRFSFh0VjY2THBwSFE2aEZldHgw?=
 =?utf-8?B?SGRxZTNFRFpoOXd0WE1IZFloWGtUS3dBMndVYkNhK0hTbUtFeDB3ckU3SERr?=
 =?utf-8?B?c0ZMbjNhZ1o5S09NRVFzamxKNG5IbjFhNVdKSnd5UFE5MG55MEJNQjlWSnpy?=
 =?utf-8?B?UzRtdDNmQU9QY3Vza1dDTi9ncjgxZTJEaG5DajMwamxMemhCMXUzd3l4K1Rw?=
 =?utf-8?B?YU90TGRFd0tuS2xUMDhDUE1MOW9SV0hVcUQ5MjBYZnBkbS9PZFN5b2ZtYTJW?=
 =?utf-8?B?VWRXamxzOFQwcllNWkErQ2Q5UC9rajVoWUNBMXhqcTlUL09oSHZBZmRWWFpL?=
 =?utf-8?B?TkZuUGJHK2xDTDdNdFkrRk1EU0k0V0RLYU9Gb1VJaVJnMmdSLzNNSUFVd0Ev?=
 =?utf-8?B?WXl2UEZyWUFpV0VaM2htaUJwWXJHRnFqK1pNMThYeWJwbVNzaXRsZVpwN1Nu?=
 =?utf-8?B?R3RGRWV6aWlmSXF1ejBpcnVCOTZFZVNpTFRIR29md1Z5VmRRcVFZb20zYytn?=
 =?utf-8?B?dXRYSzBYMHc5ZERuWGo5WHNEUGRCYnRJL296MjFNOEpmYzYxeUF2clA5c3pU?=
 =?utf-8?B?OC9yVHd1Y1FYeHdKcG1aYSt5Ymo1SnplN1FZNit2SHJkM1lrTStMU3ZvUGpm?=
 =?utf-8?B?ZDZ0YUh5UCtJQkdXeWZnM0ZWWUdhOHUwQWVmOWEvM2NGTU96dTNCV2htamVk?=
 =?utf-8?B?a0Y2ZEVUWUQyUWszMXpWbk91ZVAyVEEwQk93Wkc0TjBCdm9UUHQ5OHkzZHcr?=
 =?utf-8?B?My9CRzRlTmZPVVY5Rk11aGdOOXo4OHBsQXlKNFIxemlvbm9qdTFad1F0ZFl5?=
 =?utf-8?B?TVh3cWREMTlsTkpGUmhJZWMwelBhd25EVytLWVZ5eUV5L2FldmZia2ZYQ24x?=
 =?utf-8?B?VXl4aFcybkZvcDdJUkVLTHBBVWxlRkhqV2owT3pvV1RMSGNnUUM2b05oamt1?=
 =?utf-8?B?SHdRMmw1VHVTTlIyUWVwQ3Zmc0hiZExmK0MxK0hId3lFci9pTHFZeE1LNkcr?=
 =?utf-8?Q?fgiD5aO+3gFRnJVGAKFzYeKpr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abdbd5ba-e5be-475b-33e7-08dbd9590ef7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:01:13.1065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bcx49c8N9gxRTpgUC9Y1icuipCErBZPIFUMOe64nkmH+weP9STHElDgvNkf1t2oFI4SyMDXUelLTDsIIizeeNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7442

On 25.10.2023 15:01, Federico Serafini wrote:
> Make function definition and declaration consistent and emphasize that
> the formal parameter is deliberately not used.

Coming back to my earlier objection: Did you consider alternatives? Best
would of course be to get rid of the forward declaration. That seems
possible, albeit not quite as straightforward as it ended up being in
other cases. Second best would be to rename the parameter in the forward
declaration. Question of course in how far "emphasize that the formal
parameter is deliberately not used" is important here. (If it was, I
wonder why VT-d's do_iommu_page_fault() is left alone.)

Jan

> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -692,7 +692,7 @@ static void iommu_check_ppr_log(struct amd_iommu *iommu)
>      spin_unlock_irqrestore(&iommu->lock, flags);
>  }
>  
> -static void cf_check do_amd_iommu_irq(void *unused)
> +static void cf_check do_amd_iommu_irq(void *data)
>  {
>      struct amd_iommu *iommu;
>  
> @@ -702,6 +702,9 @@ static void cf_check do_amd_iommu_irq(void *unused)
>          return;
>      }
>  
> +    /* Formal parameter is deliberately unused. */
> +    (void)data;
> +
>      /*
>       * No matter from where the interrupt came from, check all the
>       * IOMMUs present in the system. This allows for having just one


