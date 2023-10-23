Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0607D38D2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 16:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621488.967980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvXG-000260-I4; Mon, 23 Oct 2023 14:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621488.967980; Mon, 23 Oct 2023 14:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvXG-00023H-Ed; Mon, 23 Oct 2023 14:04:02 +0000
Received: by outflank-mailman (input) for mailman id 621488;
 Mon, 23 Oct 2023 14:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quvXE-00023B-US
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 14:04:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 037ff65f-71ad-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 16:04:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 14:03:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 14:03:57 +0000
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
X-Inumbo-ID: 037ff65f-71ad-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6lVTeQ1BEhSr+wFGhBfvV9NP97dEnLp1T1c29p5ibCDCPOyjZcHb7JAlvbmVZiyoPv2HfZuSYq0nhp2B9PIYs3Fr8eCbnZo9IJCh0aHM9EiOr8TCGdIScx5I9I83z4ydaV02oUpPiPlbCqNUvoCEdiXdQS1fsgofrYOZmhNgvnhOOVu7eFczQZ+EqwVtKke3h6ibykbwCydZQHYmsCn6kmqR45tY/ICGVNWCtsL6JIGD+rIUdo1eTDgvBPp1NQzokf1n0QN7eLPM2p+ehgfxtzLQ6Dxrqv+3mlkGY221xPCgbqdFm4LbQDeqmmxwOltDkyxw+uhDEjf2m+Jlklgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpIJiKb5ovzB3oo+KARX+SPr3ykDCz0v8w8szud63Rc=;
 b=IxwTBb7d18xEVEtK2zc0MgRpdMLeJim6GIk5TCaI2iEfkjhERd+AXtPo1vwpfRuWu7s2ea7/ute2lITpbdqBu7Ua/ZnzWK7bKnkhx9QB3bvsFR8Yuy76wIg0Fny1SS60tfY32RyAWF8YKRqUF0P+LUV+xAVlj+K4l8iIYmp1OHTIRUz+qz75daROjJXMJpm8CNfCyN5iAi0kegoeyd6P9tNCHM8x45MK/2xZgUeucryfALfPbORjP+0mIhLYr8Ox0bLis4zh8SEvOY66Lk0KeeiIv5C7c/wZU2lRfI6yXJrC4QVBnmQ3slU50WzFxUrWfNDZT98g3dPS4xIOJAi9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpIJiKb5ovzB3oo+KARX+SPr3ykDCz0v8w8szud63Rc=;
 b=zqhCzdcwadBGN+sSHlwikmSY9xJvVbu3nd3jAXJIavmk1uDY52Bzcl3nMtk5PSxh0YyD2bK8hY5dO6h361YAb/QEGmNor3vytV+iJjL5gDsX2vd5j6HiEi2mPHcx6uxKtMjtUV3yJKSCPxq7fC544qE9XKvZwmaTP0RPi4pdoLyN7OQoMVF96pN87dCk6dInnYmpH1LoC+/dvF3IUojP60lMdN7JMXQL+FEcjA3FwkQN9RKRNdLbHZmISy4GQj7SSIPR6ZfxJTWDBsDYQLII3XwUMufBIS4QzreeHoArJj2izYacTBSVY66JdmOUFVzz7QV25qw3YARNs07eGMBvEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a927b439-8fd9-8014-df76-e731358d9255@suse.com>
Date: Mon, 23 Oct 2023 16:03:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 4/4] xen: address violations of MISRA C:2012 Rule 13.1
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <1e0f12095bcbc82ae3585c9fcf57bec7e324049c.1697638210.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1e0f12095bcbc82ae3585c9fcf57bec7e324049c.1697638210.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 55528e86-3fd9-4740-9bec-08dbd3d0e609
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tQZd0dxdCBs+KAkoBVi61Jv/7V3+ete+7ZRYTXfQQZO1KEgKIL9qmm1C5E+GIGbzlPDPerw/UNvV/B+AkQHCaOWj3u0Gvu5sSK6Wi7habQRuKio0L1E6DFtg1sqz0ZakYQ7Kq1IGah2+JcWybD4hszIVfOjHg+u+ALJreDMwyEk2bbe4DYGHuVq/nNugbASF6iIh9ButEMqoazNeXp8VVXQ9pScA8ir9bVgbcW3gdZ9j5iFkXR3110zoGnGkg9zPX9+nOXxZqdg5NBw3tyByzqWsUi0iLEBA169QPsG0/22cksi5O2cfKXbfXbbhkXHcL92OurHND03zrLAPGrwUrdnfdwbjJm/Z46Aw5qftTXjKIypg6XToye7aAP44ehwrfiH2ZdnZhzj512bqAzfMoQZ+Zf2QRdbBN53YW669QBfXaUlteFckifoYGF6GRqCm+3nDaonF6sAK0rdbd6U28PV+VXsDnToew92SyZonGYUR56ZaGTU2w18BOXat1tzBTywQ2uRWoOpPIdIP7XaiMLiY4dHrrXGCKPamL9aiub0jvOORRyi8jJIDCi3EpJbAnyvoCJFYnKA6sstWHBZcoDttXTbzoikhnutNgVm7nwDC2AKwQmtbf5RbRB5S1RGRzVYXf7pk+IYV6ef1HDXRGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(4326008)(8936002)(8676002)(41300700001)(2906002)(5660300002)(53546011)(36756003)(6512007)(6506007)(83380400001)(2616005)(38100700002)(86362001)(66946007)(26005)(31696002)(66556008)(31686004)(6486002)(66476007)(54906003)(6916009)(478600001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG50SEFyVUhRcFVrajhwQ3Z5Yk41Q3NNMUJzYWM0dDdGKzlDNWJzZ09VVUNH?=
 =?utf-8?B?Zk04Z2RVeXlsZTZxeUNNMWs2RlVkQzRjUHdnOTU2dHJTblJ3QWk2QUtadHdN?=
 =?utf-8?B?N0VuVjc4b1FyeExSNytCVW9saG01ZWNibXlERnNBcHc1ZVpOeUUwOXdpWG5Z?=
 =?utf-8?B?N3JkbUFxRndQTTRiNzFHT0RTL2VqT2lpM2JZZk9iUFpuRllUSHdxQ1FFOTJ4?=
 =?utf-8?B?dXh6WTd3N0dvakhnVm9DWWtQTjU1bHEwdW5WOWtMdmRjV2VpY0JUWThqaXE3?=
 =?utf-8?B?b3NzdGZxTDgvc0t5Tk84bGlCZFdKODdKdHV1Q2VuNGh5c21pUDZQVktUejd6?=
 =?utf-8?B?eUtkKzRESDl1TVRzcFJDQjRYQnZQUHdjWUdRU3NjTlFuWDRsZERLNHZyaHBM?=
 =?utf-8?B?ZDVnZWR5N2FYVEJOMXlNbXN1d0gvVkpqWmdwcUVPcTlxV2dFSVdFOG5nZ2c3?=
 =?utf-8?B?TXpzMlJuNXRXa01aK0IxbE80cG5TSEdLVHRHVHlPaE1DQVRWTEsrYnFTK0sw?=
 =?utf-8?B?M2R4K1F1ZDM0MmdSOEN6T25sQzVzYTVIVzhGRlhpZUkxa1VJTDEyYjRBS052?=
 =?utf-8?B?QTlSZ1cwNDNlRVlwMy92d1R1a284Z1VBOEc3MUFxeEdwc25oc1VTNlU1NnpS?=
 =?utf-8?B?NmFTeDJOc054cGxpdVdWSzc1ZGtCWldwNGM3K2hlSGtBNkhCRG9XS054VzM4?=
 =?utf-8?B?bW5TN3ZFWWt0aFNITjBSaWg4d3ltWGg0bjZJWGZnR1BuOW83RW02bloxTURU?=
 =?utf-8?B?ZXNWUTJoZEMvaVhvU3VUZnhLSFR0UW5zY0tCdTVCRjc2aWd6bkEwa2lxdTRG?=
 =?utf-8?B?ZnRhdGNQempqelNja000SmQwZm4wV0VGVnhoN1ozMENQK3drSVdwTnlyUSt4?=
 =?utf-8?B?ZnZjK1phcThDRy93dFhJK1k0SlE0Yk5weGc4MTR0SWFrenAzQ1VNd0hBQ0dM?=
 =?utf-8?B?UmNHMENXcE9WeG9lL01ZQXBqc1hVUFZGWTM5SmY2ODFMTWpsT1BSUklKOURL?=
 =?utf-8?B?c21VUEV4OHEyeitwT0lOd3V3UzRneUQ2WDNLbjBsL2pYUjRWUzJmU05vNURn?=
 =?utf-8?B?NFgyeGJLNWMwa3RRMUlaSDA0VXpYcUwzTjV0RTBGWVQ1cDBsVEFMZmZPQjl5?=
 =?utf-8?B?RW9RNTVYRW00elRJUjVEOHl0dXc3d2dIalJKM0hLcWRsd1ZBaWxFbmpXenlr?=
 =?utf-8?B?dTRCK1NrSlNmRU1PT0xsaUppZE9qVEVGb2NlNGJOVXF3NEVXUVM4RVp6alJo?=
 =?utf-8?B?USt0NjBpdXJYTmxSczNXTVpxRkxEVWNGS05iWlNlZlRYSFROZTh6VU96UlMx?=
 =?utf-8?B?dlZUVUZ3YXc3QkMyWk1ERkszTlg0U2xVdjFwZ3JKaEUwN0lJZkxqTGdCand2?=
 =?utf-8?B?alE3MVZZYS9xUk5vcm5VVC9uMWxmNDY3QXk5K3JWd1FlRC94TnpWZXV6SWx4?=
 =?utf-8?B?OW90bHltTnZjWEl4U0FZOWgycjBHR2NKeDB2V0Nzd1E2Wkdjc21OTk13Vy85?=
 =?utf-8?B?d1MxbjgvU1J5bFp3bDJVQlRDQ24ra1ZDR0NXZGRHcDFZamw0N3NJK0RtVERv?=
 =?utf-8?B?bllVNG1DZWhrdlluVmxOdU1Zd2h0cGY5WnpLSXJZRnZtUE5GR1FOZFdoOVRa?=
 =?utf-8?B?b3JaUzUwMkNneU5lQThubWswRHdsNEtKOE8yMVRBNDFDZnhEdXkrRmNpbTBE?=
 =?utf-8?B?MlEzcDBhVHdWZmtKVTIwZndzd3g2SURqUTRFbTZLdHV0YnlGVWpJWmN6UEpp?=
 =?utf-8?B?ZHRJdjFvampGdzV0Z2NOTWx0a2FIcTdra0UxSmZjU3U5eFpKclRCOGJvN3FX?=
 =?utf-8?B?THBTb3RRSlV5bThaTS9RWXZzWEt6aHNCYkxiRHRlWE5jaW5vaG9PM0g5eUJY?=
 =?utf-8?B?VFNwL1BCckQvdkd6UERhZmhZMEVMQWVyK3gxL3E2dEhpdVQvNWxrWkRZMXdv?=
 =?utf-8?B?RGt2dHk4Nm5JS0JVMkh0VGlPTnJ1NnhRdnowTjFGY3JadzVPVlNrWUk4QnVN?=
 =?utf-8?B?M1dKRHRvVHpad2RIV0dubWVOcnk0djZQamJIWDVOREZJNXRFRFNobFozaWVw?=
 =?utf-8?B?ZHpaUFhoSG1rVjM5bnZuY0xLUnovZzFYcVdpbE5tZ1JSRHNZYUdyOVRqOE5l?=
 =?utf-8?Q?gBsv9RR+s22TEKqPwqk6WWle3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55528e86-3fd9-4740-9bec-08dbd3d0e609
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:03:57.0144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbQtadypqn7GQgMgbMK7etiXHgS9JlVXYGbgt5R9aekAapSucao3G2oDOxBXW0gbm5m+WzfAZXa6d4FWG3NVBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8196

On 18.10.2023 16:18, Simone Ballarin wrote:
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1504,6 +1504,8 @@ long vcpu_yield(void)
>  {
>      struct vcpu * v=current;
>      spinlock_t *lock;
> +    domid_t domain_id;
> +    int vcpu_id;

While I realize that the field this variable is initialized from is
plain "int", I still think that being wrong means the new variables
here and below want to be "unsigned int".

> @@ -1515,7 +1517,9 @@ long vcpu_yield(void)
>  
>      SCHED_STAT_CRANK(vcpu_yield);
>  
> -    TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
> +    domain_id = current->domain->domain_id;
> +    vcpu_id = current->vcpu_id;
> +    TRACE_2D(TRC_SCHED_YIELD, domain_id, vcpu_id);

If you touch this, I think you ought to also switch to using "v" in
place of "current" (making the supposed side effect go away aiui).

Yet then (for the further changes to this file) - what persistent
side effect does reading "current" have? Clarification of that is
part of the justification for this change, and hence ought to be
spelled out in the description.

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -445,10 +445,12 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
>              struct msi_info msi = {
>                  .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>                                   uart->ps_bdf[2]),
> -                .irq = rc = uart->irq,
> +                .irq = uart->irq,
>                  .entry_nr = 1
>              };
>  
> +            rc = uart->irq;
> +
>              if ( rc > 0 )

If this needs transforming, I think we'd better switch it to

            rc = 0;

            if ( uart->irq > 0 )

thus matching what we have elsewhere in the function.

Jan

