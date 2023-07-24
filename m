Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BD875EF4B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568522.887896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNs4T-0004wz-D5; Mon, 24 Jul 2023 09:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568522.887896; Mon, 24 Jul 2023 09:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNs4T-0004vF-A5; Mon, 24 Jul 2023 09:41:41 +0000
Received: by outflank-mailman (input) for mailman id 568522;
 Mon, 24 Jul 2023 09:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNs4R-0004v3-FX
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:41:39 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4819227c-2a06-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 11:41:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7498.eurprd04.prod.outlook.com (2603:10a6:10:20b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 09:41:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 09:41:35 +0000
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
X-Inumbo-ID: 4819227c-2a06-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLml5g56QAklOGRs7XhhCeQCZArUx3QqjKniqfsCFzp15pfr3p2pMxrhWvWVDHFX7OtHi+DbwBPRmdWUhj1n5D2HuyjWAQONmGHnKRN64oAlrPU0rTS5Ei4qOJHX4Dyz2YNscj0jCvHxySYV1rULACfVjyTefgCQyhdXC8wyv0VNMa1zPVcXWL8u2rD22OftnJUxTmkFMbdDv5s9RJknaT3Z+ygZHV10eAYkumvs9ccIY/EbqrsOMAmtfA77REBd/ofMMlOJ41DYHqaWwUTIL2GC5nM+9ExCzNPxefYP96br2BMnX/b4sE+YbM2o0PZJN677w5u+Cvj1SuhqMYa4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYrwqGSlqyeMdaVpr7MKG2KaWIkESZGb1YTpr5NSxsA=;
 b=DFqP2YzJedCgdj+H9gxYp31t9FfavSxFgWTRH93at6n6HHs8Or46A3T7beFWZsXAxR47XS/OdEpp1FNlh0pQgcX1gztJpe5CCCEPHK2Fb3UaaH12XHxQN+P8YW3lgHxJFHG6iVyxacBI08ClclrTFBhHybDV0oi2lkjfwrJ9viap9jYgsGJzSnjIEHje/6tUCzELouA8ZcJb/G+UemVs7TgbPn3lH5e6Jqlls9XUY5bOFlEdgPpljStOmOJ/v3KDvkHTvIPNiakJT2BwTxEh6gEU85v0ubTXehzJcC5OieAxApopeRL21PX3U2Kg3VrQfOGENtYPnOgiIE5oTMUkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYrwqGSlqyeMdaVpr7MKG2KaWIkESZGb1YTpr5NSxsA=;
 b=Lfrzx7lzOFlJfeMBcQeR3n78CtzTXv7Gd/rNkqR41QbqcPROU3ngaCItr2UF7NJlukDwaD63jO/Ou/6OU0Tb2Bh2N6FbPCWl6q6tNiVbkhvA7oSDp31w0HTBhq5s2F4+7tQ/DFpUNhcQsYIVCYUf+gUrFAQ3C5nG9rUxjKRJ8QhV1Je5lndNRlsnpRhwsu+BTTkFiNMx5kKoqMmR++4aW0qQ5ed/0TwqHuUiw1ANIl5rv49TIUb1PMBR4jzjDaOkWJ1v6XxiI5mGWeORS6HgWM4rLG7vAbhbEekUim4X86ZhMU42d3FRwwtCEr5XaCb8tMAULBw6zzVby/H3BmjZCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e84c743-ca1d-28ba-e79d-d43a55ebcbdf@suse.com>
Date: Mon, 24 Jul 2023 11:41:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 04/13] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-5-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230720003205.1828537-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: e74a0c06-53c7-4760-9b19-08db8c2a2b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u/sfr8lWL3lWQERqH1AzBAF2mlBDd0+oDshsc+8cYRwNPVnejVk7JnY4om7KdoBJIl+R9qp2VX+UjrdAM5e/Jnrsaw0IotIH6kvMuWglUTnNyqAOFCnX4Xow16HznP4AKSOOqMvYGOP+Kf/uD5OShYsuQxjBKjPT6UUfh92K7nvmzg+LJU0QG8zacExLVmS4k9mq1mN4b4V7kazkLaHmRBO/hR/KrjkMD/NVFeN4bUyCD7ow9dqb6jR61xtkX6IfOB/bOgz+SojqIaWK+fhLxUXzOwsObnfQKcde+Zsg7ElsO3/NNGuvFMUjFp0sGxdP2X3NQkbByK9xiMvJx1YPgcdROimBcmwnzR+hYQckjAeFvzJsGmXCjmsc09LV4cy7z3A5re8SGwWUe7cY9/ywxorH70j5hfzlvMF02QNhOzEIeVeZrqCuzD50fMh3LKcd/gRJGBxL91M35xkWw7LJLGug3fBBBfUdJXRLHOw+4RMh86ZlLiJLyLlLddMwipMWGAk7oIFLdXk77FGEVUs279/jYooNn0rntD0dqkbkMs2qvLB7zEiZ8zEWDkDQ/xITFJ3WChfbOvrSiZUKTygepZ2C3UiT1ApYYt/tclMoBtTuYe+gvCbeZaFh3FEBoLdQmmvJdIYpXLSwj/T9+sPmsM5ITklhNyt0mCBOobwWkhsGwU55VuszXusi61OWjB52
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199021)(38100700002)(6916009)(36756003)(53546011)(2616005)(83380400001)(8676002)(8936002)(5660300002)(478600001)(54906003)(316002)(66556008)(66476007)(4326008)(66946007)(41300700001)(6486002)(26005)(186003)(6506007)(6512007)(2906002)(31686004)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU94S3F0NGZxVDhlNUVQNm16UjY4RFdxMjVOYkQ1a0Q3Nm9yT0x3a0NDYnZj?=
 =?utf-8?B?N3IyNlo1Z2Y5eEloTkozL3Y2eG1ITGEydnk3dkpGVHg1dDNadlY5bVVrK0Nv?=
 =?utf-8?B?eEtZcHV4TzJvcTBOYXZzS2V6dEVyK2hTL2xZNW13K3RJWmFEUWo4MzlDS2ZY?=
 =?utf-8?B?UHJpQnpybVJZTG90UW04NWFXVWlkUWM4NERjMmRNczM2ZXgzd1JLcmFTQWZ5?=
 =?utf-8?B?MWl5cy9mdmVIZHJRV0RyYnZ6aWZ5b3k3dUpoeFdpb3dleUJsaTJpa2VrTm9O?=
 =?utf-8?B?c0VzQ2h6alliYnZVbHEvMmVtQVB4aVZrMWxFZUV6YVhjN0hnY1J4bWp5aVV1?=
 =?utf-8?B?b1FmMHc3aENGejl0TzRtbWNEYzlScVlhWjY0eWJIUXY5M3A5Q0N6YUUrQ1ll?=
 =?utf-8?B?TzdVRU1lZi9ycSszMWpWeVI3cDlsZTlkaU9TRzFFcDFrMjEyUm9MT21wQXdW?=
 =?utf-8?B?VWxmL1pMNXl6Y1plNnFmb0xnQWxSWEV2NCtCcjhPTnBTazdlYjVIVmVRUkpC?=
 =?utf-8?B?WlFGdFgxMUNlY3JQUnYvRENBUTJXZVp1S2Q3VkkvZ3VrUml1dzN6VHVTZk5k?=
 =?utf-8?B?bzZUVjRmN1R1Yy9uZFFDbkdQM3hraGw4NzRpK1ROb3BNQlZNbWNwMWpDMHM3?=
 =?utf-8?B?S1RZZDZnTVRJYzNRbFI2dVY2NGc1VjF4cnkrNkRUSHhXeXRZck81ZDZxRENG?=
 =?utf-8?B?ZWFJZm1XU1FHQVptVmNuRExIQUZuZ01WbFJLR3RsalZWOHlkbjl6WldNMzJo?=
 =?utf-8?B?aUdDSW9ZeHNLZVl5N09IMzMzczA1RndHbjBORHhmZFZsUEs5VlhlRWJIdUZy?=
 =?utf-8?B?cXlKdG8vWE9MM0plUG1tL1lpUnF0UUoxdFdSRk84WFNEclBjb2gvelMvY04x?=
 =?utf-8?B?U3dLdGZBU0tiUTRzbkFSMk9na1JpSDJvT0xZSWJHQXlNeU95enVieURJcnlG?=
 =?utf-8?B?ckhIQStwOGFWYVNSa3VvZXVjNHB2Zk9RUFE3OHN6Z2N0RFhZN3FpL2l3VDF4?=
 =?utf-8?B?TmhpMk5QUGJ2L2pVU0J6aWs2L3BWOXgxUkhKSDZrS0RkNUpXeVc0ZXN1K3R4?=
 =?utf-8?B?SUorNzZ3aXdtOGZnL2VINmp3UDNkb292WkdiUkF3L1NoeFJFT3VucnpNU0VF?=
 =?utf-8?B?bjBuVW5TRWV5VHVhNW9WaU84dXd3MWRLMjI4ZjA1M1NLdWE0dGdFR3JRODY0?=
 =?utf-8?B?NHY0Qk1GZE96MEhaWVBsaEttTDNCMHdyVUdUMjBtWGN3TGtQRWhDbFZRVE55?=
 =?utf-8?B?c3FRbG4wWFdualJHdUY0YXFrVmVrU2RCYmFOMDhPWU9KcTlBY1A2WkdoNXFX?=
 =?utf-8?B?ZDFaRkVwYmE5T3B6NlNwUk55OVVMZ0E3b0tsSEFNUE1kR3I4QlhWMjVnNjlW?=
 =?utf-8?B?Qkt1YzZFTEtzLzYrVnVYN1JEVFl2Y1FDSEpiRGRyWkNxRDlqTVFPY2VXbkVE?=
 =?utf-8?B?M3JiMXkxdG1icEhHMGVxYlloam52dHlJVWtQcDdCMUdsYVovVW14Ky9wT29H?=
 =?utf-8?B?aG9JdzhjODVaMlBDMWdxU1RCVGlvVlJsWDRuTVhiY0NEdk5POG9WSlpoNUlC?=
 =?utf-8?B?QjUzZUJoMFZUenoxa3JJME8wWGlpcDFoY3hEOURGR2NqcDR0NDFNVjM1aTVp?=
 =?utf-8?B?aUZIa2RGT2IyaDVEU1Y1dDI2b2xWMnpPM2JmSHAyTlorRkIxRDRyMlBSRjR1?=
 =?utf-8?B?U0xZeDlVeXhleThuaHpWVENGZThsMEFWN3dHdzNmOHJDKys4ZGxUZ1VoMmRX?=
 =?utf-8?B?azRzUXE0T2hnVUV5TnQvY3BuM0RDczBHcXljWnFRL0w2SS91NkhhV2dCNk8y?=
 =?utf-8?B?VEljT1M5Slg4RXdaSCs2UlJZd2J5aHlRUUMxM1NNMThwVWxVOGhjRitzK3E1?=
 =?utf-8?B?QnlTQ0VlTHhMRm9ydWQ3RTVOazZjZTVvS2U3d2pYOUY0bkNwNVlLcEg3dUhh?=
 =?utf-8?B?Nk5yWnBTYlVPUnVXOGJvU3lNcXAzeUYwNG5obFVDSnphdUhuRytUN3RNOE9F?=
 =?utf-8?B?aDAxVTVxL2FHb1RJYWxuM25ZVWdacFNlZFJQWnpHQ0F1WXhRNUIxMzBENjZR?=
 =?utf-8?B?cXNFd0plaWZ0WlplZms0bzRBMUJLK2ltWmZtcXlabTV5T2NEVU1DdHZvRTho?=
 =?utf-8?Q?alB838Tto1/2QTAk/h+ZF1RZ2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74a0c06-53c7-4760-9b19-08db8c2a2b82
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 09:41:35.2453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNECoBRCtDIZNCeR49dl0GvXC00AHfHTccIpOjKuGutYXk54ZFjam7hJccb93ktWCrJYZPVuRWeTnIye7e477g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7498

On 20.07.2023 02:32, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a PCI device gets assigned/de-assigned some work on vPCI side needs
> to be done for that device. Introduce a pair of hooks so vPCI can handle
> that.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

A couple more mechanical comments in addition to what Roger said:

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -885,6 +885,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      if ( ret )
>          goto out;
>  
> +    write_lock(&pdev->domain->pci_lock);
> +    vpci_deassign_device(pdev);
> +    write_unlock(&pdev->domain->pci_lock);

Can't it be just d here?

> @@ -1484,6 +1488,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>      if ( pdev->broken && d != hardware_domain && d != dom_io )
>          goto done;
>  
> +    write_lock(&pdev->domain->pci_lock);
> +    vpci_deassign_device(pdev);
> +    write_unlock(&pdev->domain->pci_lock);

Is this meaningful (and okay to call at all) when pdev->domain == dom_io?

> @@ -1509,6 +1517,19 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>          rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
>                          pci_to_dev(pdev), flag);
>      }
> +    if ( rc )
> +        goto done;
> +
> +    devfn = pdev->devfn;
> +    write_lock(&pdev->domain->pci_lock);
> +    rc = vpci_assign_device(pdev);
> +    write_unlock(&pdev->domain->pci_lock);

Just d again here?

Jan

