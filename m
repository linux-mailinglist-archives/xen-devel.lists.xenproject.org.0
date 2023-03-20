Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A2E6C1184
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 13:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511868.791238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peEJq-0005zO-Dw; Mon, 20 Mar 2023 12:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511868.791238; Mon, 20 Mar 2023 12:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peEJq-0005w3-Aw; Mon, 20 Mar 2023 12:08:54 +0000
Received: by outflank-mailman (input) for mailman id 511868;
 Mon, 20 Mar 2023 12:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peEJo-0005qL-K3
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 12:08:53 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9e4f32c-c717-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 13:08:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8634.eurprd04.prod.outlook.com (2603:10a6:20b:43d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 12:08:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 12:08:44 +0000
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
X-Inumbo-ID: f9e4f32c-c717-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjIpXweCocXv64xhxg3vAZfWoaqSnzbWmoOgzDV7QQDmX5lGmxFedPB5odPkXfI/qZ6u3sjJgBl+8TeDQIzrXNhLTE6mOvQsL+/hYsQK1tqtEneYoizs4bLkL+EZQQAzombv5AgnVSHYwLwjZm3XhvcvfkkoPL9g7AA2boFWzzH9iaQ0dJrwJFw0u/HdO6XZz9/eBMGk45DQ9+K/L2XGuv5/3vGvP5jFiEEfvd62F6P/pkHawljR8dU95kZDIbO6xNtT2FODHeEDiaNZ5ZbIJgwR0SeoaczmWhoGltyUwn4yg39yUBLIUR1gitZAtqrXtmrD97eZhxx1ZXwsRzFj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aX1D+jW2ekavLXtYE+acfXo7BYGCmJYogoMLUO++a4=;
 b=VAKcz50ExzW/i51WYpZ4/RviOBB28Rn716q5a1tmjxR/kyt4/vy97vSd9tsKEAxSeIJ76A8BqemAgn5iJcoPVsU4waoIjVwYN5nqLprOIitIcNufKVhTQz0JW/ms2xmekQy0jpF0l7V6dn+J8JTt6scT9kzyfuovI4KIoCO4r/fu5eKKFmGm+Yp/z5cbf1FWWe6Qh+9VB+XWFFpIC4yH/go+wTRGbE2IV3BgX3RYUhYsbvS7a7RFa/ZnVAlziMzfx/9DXipyNS12pBkxt+BEZfkcpjHSddNYTjtpg4QKuf17/Vqu9vWbzVBaEwxbWS2ZGm2Ekug/EBAcuPGIPaQszQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aX1D+jW2ekavLXtYE+acfXo7BYGCmJYogoMLUO++a4=;
 b=OIiG76lijIViEBUZA9EhRCHXswDfZVsJM32hVZ22F71tlqmh+y6CTxD3Jj/XsdRZygCHl8TOqbOtxFpDm0hVuKI6xzQiHCS9ETRXSAJdtJWwU3FPex+u89r5M/gORX56eyZY2frG/aDVJOc8iRyPj+jXVCoKihAL6g6Zuo52ds6M4OmOJVOV7+FiaxgxaZlQPtNtQgwCQ7aOEdZ58IV46t5XOyHqeNUWbYGQuqn3YaI5WwsswtLr8BEeoNphBECyLF7IZPB8Tw4FJ7Iyud1lLOcwY6PemrX7Qd923pIONmNNnA0TKhwOl9QOXkyUcDZUzVU8F4YC7AQpuwbTkKOKIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa9bf8f2-5ff1-27b0-bc41-b7b639648e85@suse.com>
Date: Mon, 20 Mar 2023 13:08:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] vpci/msix: handle accesses adjacent to the MSI-X table
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20230316120710.38817-1-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230316120710.38817-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8634:EE_
X-MS-Office365-Filtering-Correlation-Id: b16c4090-d61d-48b0-b82e-08db293bda4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3FyjLRjr0+FCmHrJ3oCw1XK+3Bwp/QvMPLn5y8tc1l2fVRoPodFe7cU/tWH1ongKffoqJpeaeW5HmxTxsNKVHGHFFJrpi+wNQvmcpJ8WToSjuiWpywtQm8ERdyvP1a+lwaD7Eqkw0al+klIrxtUMNzbrW0F/8HFEXWfS/MwgBLUpO9Ivd5Upf99D2PIgRwQbxR0RzYRtbUpC+avoeWX/Mg2pgrN/te+16EJ9FVbGOjwbZ3VOsC4ebadzNWiOWUZ2sO7k8Pl80RrgQCMq6I3ivqJURV0QbNjbu9x4urhnsG/mgJOq20cHnYaWJqvNi64YFjYfvexQlKD/77PZR1ZJG3zL4l3LuzmmY3zOqKsoDDS46WUbZNkkpn7v14bICpXFO+AyIZ4H+jXvqmF40BjOen9nrV0UR0ZHGNWwn61AFDn5t9vdiQrAGtH3Vv0w3lMq5EKFYJoEvYmqkMU0aroFUEi2ZrdXEu8zvKVCROC5N1SEkHETw+d9WSVU81LhrpVkp2iGwVGvz0gkFwQxgf/C6wjNiFcUT+osQCNyL0WbufUmQz4evTK2Bl2FOyWT1FPJT91ldLv+zj/tuzuoXRrC4qfs4xt3BBF83NNf2kh5wNFD+EOPAnsyYcBjlAW7o+HuBlU/h9N8gBUIX/ZhdeWZNrmHZTV11GU9T8FW8EoH6rcVh8EidbsZJ6RgOkNcg2YuYnEzfFfYVjv6Xd0pFuVdcH43cQcMl2RcQgZuk6KeYeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199018)(26005)(53546011)(6512007)(6506007)(2616005)(31686004)(6486002)(316002)(83380400001)(6916009)(4326008)(8676002)(186003)(66476007)(66946007)(478600001)(8936002)(5660300002)(2906002)(41300700001)(38100700002)(66556008)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0hYSUNVVmpKRkpoVEM2TWZoYm5WcEEyaWVWWW1sOUZ1NjlTRURUT3JnRnk2?=
 =?utf-8?B?Uy9SMGN0WnZ6cXRtaGZBcmNnbEJZaUVNajVrcTBVN25JOGgxSm1FM21EbnZa?=
 =?utf-8?B?NXVwek15R256Ym92ZDBWTG14NE5rMnlLNjEwc2o4K1ZENEFPc1h2bUhyd2N4?=
 =?utf-8?B?WDY0Y3dtMXJxWDAxVDA0T0F5bVpXVlRaTjhxMFcrVVlCTy9Semd2cnpLazlu?=
 =?utf-8?B?REo2clRJa3J2UnJvamJtbzd3NnN6cXoyNmJRTVVNSm5WNkxtSDhZcVdhSC9z?=
 =?utf-8?B?aDNPMExmZDU2TFRCR0dhTzlCV0JWK2o5UldpZUpCdnFFYVZqdDlXNWRod3JX?=
 =?utf-8?B?TGVOSUYwUEd2M3NGR2ZnRVNVaWczb2Q4YnFjeUsyekpob0FKdEtTTVVNYXFY?=
 =?utf-8?B?T2E2YWdRS2dRc0o5OG1CL1g2SWpNT2RTYnBsN2NvN2RXQjFwekhhdjBYVXJD?=
 =?utf-8?B?ZmxTaWJrbE9QdmZlQ0MyTXdEMzh2ZThQc01xQWhOSmRDSDZGZGtEOHpNMVBw?=
 =?utf-8?B?MGRxSXQ3TGMwQlZoTEdwNGlMYmltc0ZNWXM5a3pGV1l4V3dVbklhWU92Z1FL?=
 =?utf-8?B?WUx2MzBMUFEvVUcwbEgrMGZGRnkvdk9tRlBnOTFwUHJyTS93eHRiaGRkZ2la?=
 =?utf-8?B?bGJ4YlBleW03SVhnak9lQU82citvMWk2bkpsbWppcDYyeEpob0diRlJ0NW1I?=
 =?utf-8?B?T2hCcHByWGoyZVBhcm50anNzaWZiUTJzTXl2T0RZRXcvOXYwS3JqMnVacE11?=
 =?utf-8?B?YmdPUCtPS0hFYUNkRVNOcmY3RitCeHVxNnl5NW1yZ0dMT1g0dXEvdFlDSWZW?=
 =?utf-8?B?eTEzeStZdDg4Vjh0dmJjNkhkelZRVGJZTXliNU1pNTR0U3lTYzF1d1lXeDlS?=
 =?utf-8?B?NXl2aUg3ekYzbWtDeFo1empuNGwxNzQ3Q3lOQ0NlbGFIYmF3b2ZlSGFrMXRv?=
 =?utf-8?B?M2RVR0laaDlWVW5TWDcwMnh6MXEreVgxWGczNjR5SUlJMXBic040TU9NcDBV?=
 =?utf-8?B?MFB0V2Q4dTV0QkhoVWpTTVozOXQrUHQ5dUlBcXdsdnIyQW1DOXNVb3FnYXB0?=
 =?utf-8?B?cy9yR1VISFlFZFBNV1greHkzbXQ5QXN4akJPNE91ZkJzSnVWampkTXlFaXZr?=
 =?utf-8?B?NTBrZE9LdllFKzQrUnF0ZmplN0Y4ZFRwbkNLbElDemttT09jYUVCUTBEcXRV?=
 =?utf-8?B?VGY1SFh4SnpEUDhXLytqRldRV0w5VStyM01OZTUrOWdRZ1RZZ3FudDBtemgw?=
 =?utf-8?B?UWhMUjFiaHJNRm5ZUGF5L2JGOVFjQlIrM3VURmVZTTIvTmpBdHZ1TTk5S3BE?=
 =?utf-8?B?aGtoTkxrNXNwcndtSVJTRWRUWnloRHFPVC9ENTdwclhSK2E1dDJCT2g5NFFV?=
 =?utf-8?B?YUpSRDdVUGJrbk9XLzJCaGJTSm5OUXVnOVdyQ2p6M2NqWEw3cEcwMDJycUxX?=
 =?utf-8?B?ZW9jYnlmbCtZaE1BNkFTMEp0UVZSWFlZRHE3eHZYdFFJYkJNTDQrN0NxVHJH?=
 =?utf-8?B?RllGRVU2alhtaS9vWTFnZGFjSkZEWCtHM0J5WndrdlVWdU85Qjc0RWNyL0I2?=
 =?utf-8?B?N0pMUitlMUYyODNOTzlUOUc1cXltZFhDUVZHZVNYYmh4MWFHSjZhRVFueDZ5?=
 =?utf-8?B?RkkzRXAxVUZyMEdUYmFQNGFIaG1Wc2Z5NUF2VEdiRmlTdXVsMlR0ZEtidTFX?=
 =?utf-8?B?dTllQlRGSHdwS25DQlFHOFRRQ1hVUnJpY2dwVThESGNydzJtbmFLTERIdFZG?=
 =?utf-8?B?SWhwWnF1MTVnUHdWNWhjUzlGa1M2Y2pBRXIyTHVDWTRSd1FJU1BrSHBiOHJY?=
 =?utf-8?B?S0F4ZEtnQVZEanFROG5scUt1eVFmckwwbDhzM0gxRjcxeTRiWlhadEtMcmdT?=
 =?utf-8?B?ZHhJMEVBWTFFUjV3QnVnOGlXSXVrWmthc3dsejI5V0c3STNoRExieXh2dkQ1?=
 =?utf-8?B?bHFOc0xDQmU5MlpzOGZheWpsWVFXc3ExYXNLaDNpcnd3cGdwbStOOVRpUVV0?=
 =?utf-8?B?akdwYUZHVUpiU085Y0JTc0NnckpGVjNrdDNOMHFlYnF0b284RlNGZ0FUOTZ4?=
 =?utf-8?B?MExwc3JxVWw5TGR3UWtkSzg0Z1YrNkZFTmNibG1sazNTNDROYTFiR2N0SWxn?=
 =?utf-8?Q?gNl4VnHaYYX7a0M3pBk6CrN7m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16c4090-d61d-48b0-b82e-08db293bda4e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 12:08:44.6708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORduoWPoYbn9yfPShbrlMzb1zYSG+Y6AAxTKzDK6ERdtDpMxdwPMp+fvGS/8q3BpjajjwP+mp2NvXGetcGbOeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8634

On 16.03.2023 13:07, Roger Pau Monne wrote:
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -27,6 +27,11 @@
>      ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
>       (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
>  
> +#define VMSIX_ADDR_SAME_PAGE(addr, vpci, nr)                              \
> +    (PFN_DOWN(addr) >= PFN_DOWN(vmsix_table_addr(vpci, nr)) &&            \
> +     PFN_DOWN((addr)) < PFN_UP(vmsix_table_addr(vpci, nr) +               \
> +                               vmsix_table_size(vpci, nr) - 1))

Looks like this would be better in line with get_slot() (and slightly
cheaper) if the 2nd comparison was ... <= PFN_DOWN().

> @@ -149,7 +154,7 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>  
>          for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
>              if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
> -                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
> +                 VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
>                  return msix;
>      }
>  
> @@ -182,93 +187,201 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
>  }
>  
> -static void __iomem *get_pba(struct vpci *vpci)
> +static void __iomem *get_table(struct vpci *vpci, unsigned int slot)
>  {
>      struct vpci_msix *msix = vpci->msix;
>      /*
> -     * PBA will only be unmapped when the device is deassigned, so access it
> -     * without holding the vpci lock.
> +     * Regions will only be unmapped when the device is deassigned, so access
> +     * them without holding the vpci lock.
>       */
> -    void __iomem *pba = read_atomic(&msix->pba);
> +    void __iomem *table = read_atomic(&msix->table[slot]);
> +    paddr_t addr = 0;
>  
> -    if ( likely(pba) )
> -        return pba;
> +    if ( likely(table) )
> +        return table;
>  
> -    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
> -                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
> -    if ( !pba )
> -        return read_atomic(&msix->pba);
> +    switch ( slot )
> +    {
> +    case VPCI_MSIX_TBL_TAIL:
> +        addr = vmsix_table_size(vpci, VPCI_MSIX_TABLE);
> +        fallthrough;
> +    case VPCI_MSIX_TBL_HEAD:
> +        addr += vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
> +        break;
> +
> +    case VPCI_MSIX_PBA_TAIL:
> +        addr = vmsix_table_size(vpci, VPCI_MSIX_PBA);
> +        fallthrough;
> +    case VPCI_MSIX_PBA_HEAD:
> +        addr += vmsix_table_addr(vpci, VPCI_MSIX_PBA);
> +        break;

Hmm, wasn't the plan to stop special-casing the PBA, including its
special treatment wrt the p2m? Reading on I realize you need this for
the (future) DomU case (to enforce r/o-ness, albeit having looked at
the spec again the other day I'm not really convinced anymore we
really need to squash writes), but we should be able to avoid the
extra overhead for Dom0? (Granted it may make sense to leave this to
a separate patch, if we want to keep the DomU handling despite not
presently needing it.)

> +    }
> +
> +    table = ioremap(round_pgdown(addr), PAGE_SIZE);
> +    if ( !table )
> +        return read_atomic(&msix->table[slot]);
>  
>      spin_lock(&vpci->lock);
> -    if ( !msix->pba )
> +    if ( !msix->table[slot] )
>      {
> -        write_atomic(&msix->pba, pba);
> +        write_atomic(&msix->table[slot], table);
>          spin_unlock(&vpci->lock);
>      }
>      else
>      {
>          spin_unlock(&vpci->lock);
> -        iounmap(pba);
> +        iounmap(table);
>      }
>  
> -    return read_atomic(&msix->pba);
> +    return read_atomic(&msix->table[slot]);
>  }
>  
> -static int cf_check msix_read(
> -    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> +unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
>  {
> -    const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
> -    const struct vpci_msix_entry *entry;
> -    unsigned int offset;
> +    unsigned long pfn = PFN_DOWN(addr);
>  
> -    *data = ~0ul;
> +    /*
> +     * The logic below relies on having the tables identity mapped to the guest
> +     * address space, or for the `addr` parameter to be translated into its
> +     * host physical memory address equivalent.
> +     */
>  
> -    if ( !msix )
> -        return X86EMUL_RETRY;
> +    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE)) )
> +        return VPCI_MSIX_TBL_HEAD;
> +    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE) +
> +                         vmsix_table_size(vpci, VPCI_MSIX_TABLE) - 1) )
> +        return VPCI_MSIX_TBL_TAIL;
> +    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_PBA)) )
> +        return VPCI_MSIX_PBA_HEAD;
> +    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_PBA) +
> +                         vmsix_table_size(vpci, VPCI_MSIX_PBA) - 1) )
> +        return VPCI_MSIX_PBA_TAIL;
> +
> +    ASSERT_UNREACHABLE();
> +    return -1;
> +}
>  
> -    if ( !access_allowed(msix->pdev, addr, len) )
> -        return X86EMUL_OKAY;
> +static bool adjacent_handle(const struct vpci_msix *msix, unsigned long addr)
> +{
> +    unsigned int i;
>  
>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
> +        return true;
> +
> +    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_TABLE) )
> +        return false;
> +
> +    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
> +        if ( VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
> +            return true;
> +
> +    return false;
> +}
> +
> +static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
> +                         unsigned long addr, unsigned int len,
> +                         unsigned long *data)
> +{
> +    const void __iomem *mem;
> +    struct vpci *vpci = msix->pdev->vpci;
> +    unsigned int slot;
> +
> +    *data = ~0ul;
> +
> +    if ( !adjacent_handle(msix, addr + len - 1) )
> +        return X86EMUL_OKAY;
> +
> +    if ( addr & (len - 1) )

unlikely()?

>      {
> -        struct vpci *vpci = msix->pdev->vpci;
> -        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
> -        const void __iomem *pba = get_pba(vpci);
> +        unsigned int i;
> +
> +        gprintk(XENLOG_DEBUG, "%pp: unaligned read to MSI-X related page\n",
> +                &msix->pdev->sbdf);
>  
>          /*
> -         * Access to PBA.
> +         * Split unaligned accesses into byte sized ones. Shouldn't happen in
> +         * the first place, but devices shouldn't have registers in the same 4K
> +         * page as the MSIX tables either.
>           *
> -         * TODO: note that this relies on having the PBA identity mapped to the
> -         * guest address space. If this changes the address will need to be
> -         * translated.
> +         * It's unclear whether this could cause issues if a guest expects a
> +         * registers to be accessed atomically, it better use an aligned access
> +         * if it has such expectations.
>           */
> -        if ( !pba )
> -        {
> -            gprintk(XENLOG_WARNING,
> -                    "%pp: unable to map MSI-X PBA, report all pending\n",
> -                    &msix->pdev->sbdf);
> -            return X86EMUL_OKAY;
> -        }
>  
> -        switch ( len )
> +        for ( i = 0; i < len; i++ )
>          {
> -        case 4:
> -            *data = readl(pba + idx);
> -            break;
> +            unsigned long partial = ~0ul;

Pointless initializer (~0ul is written first thing above, i.e. also in
the recursive invocation). Then again that setting is also redundant
with msix_read()'s. So I guess the initializer wants to stay but the
setting at the top of the function can be dropped.

> +            int rc = adjacent_read(d, msix, addr + i, 1, &partial);
>  
> -        case 8:
> -            *data = readq(pba + idx);
> -            break;
> +            if ( rc != X86EMUL_OKAY )
> +                return rc;
>  
> -        default:
> -            ASSERT_UNREACHABLE();
> -            break;
> +            *data &= ~(0xfful << (i * 8));
> +            *data |= ((uint8_t)partial) << (i * 8);

This is UB for i >= 4; you'd need to cast back to unsigned long, at which
point I think the cast-free variant of masking by 0xff is to be preferred.

>          }
>  
>          return X86EMUL_OKAY;
>      }
>  
> +    slot = get_slot(vpci, addr);
> +    if ( slot >= ARRAY_SIZE(msix->table) )
> +        return X86EMUL_OKAY;
> +
> +    mem = get_table(vpci, slot);
> +    if ( !mem )
> +    {
> +        gprintk(XENLOG_WARNING,
> +                "%pp: unable to map MSI-X page, returning all bits set\n",
> +                &msix->pdev->sbdf);
> +        return X86EMUL_OKAY;
> +    }

Could this be moved ahead of the unaligned handling, so there would be
(commonly) only one such log message even for accesses we split?

Jan

