Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1358684C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 13:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378703.612052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oITn9-0006BK-U5; Mon, 01 Aug 2022 11:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378703.612052; Mon, 01 Aug 2022 11:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oITn9-00068e-RM; Mon, 01 Aug 2022 11:40:59 +0000
Received: by outflank-mailman (input) for mailman id 378703;
 Mon, 01 Aug 2022 11:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oITn8-00068Y-10
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 11:40:58 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00067.outbound.protection.outlook.com [40.107.0.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce6438cb-118e-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 13:40:56 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB8941.eurprd04.prod.outlook.com (2603:10a6:102:20c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Mon, 1 Aug
 2022 11:40:54 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a%4]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 11:40:54 +0000
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
X-Inumbo-ID: ce6438cb-118e-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TF3xdkRO1phG5KinKEKNaQYMjrj8L3XWYWxmjiNRXnq1Kjs/vd2y53uSO6oQg1iSN33u4L+P9JazmIavFPKJNQsHunB611vP62P/zqvbNe9faw4ZHsB49fCiBr6oMoC5I9komplP2b2KNvFp+tShKNatNr+Rcyc9LUiZ5ya4JVdlqE6ghgh7q93pNDLG4gzYie09e/45sAwDhDee/l2VdxmXpBllp7jEsGygU+8L8OTCdwBN8WftXLe3R0uFV0+fcldTk0dhonbo0Abq0M/elcCI15dIDT7D+hf3DioxDKDCivSQLjQwIa5m8q6bb4bXJp5aXFs0Hg7pmF3OwNu85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud1uzmIWN/8nZ1Hn6rc/kE6IQQ7Kf9EFS108CLtt4yE=;
 b=Hl49xFNQljr5aia/BkCh49RMnWSQYI3pieBedN+VAw9tEd+Kl1PjAZne6VfoHwLyx4Sd6ZyhBkBTN34CNEF5LcvTfI5+Q4VcH//S55KBoqRd3swLYArdJp8DfUzirlKiCwfnMT4gTPqzloSULwL3K95xF5J6jOTcHpCcNIFlPnCEDEWwmtusHNktXsuyDdw+WKHT3/gY62pJQO2nJuJEw3vM7GJkPskXS4eOdPBZ0HISjwOKYC75PeWChw6CwiyEO0ukPHm71C5iOCMypox3m1A4t17S61YDwlT1v0By1/SBFNxYFfUSEReXP5WwR2O5Br24MqW47fECogzLaJzx4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud1uzmIWN/8nZ1Hn6rc/kE6IQQ7Kf9EFS108CLtt4yE=;
 b=vrtyVAFM7LuQPWnnQxTbsL6SwkuLZGhlu6h3GGnr2nxrsfW6IQWa+Ig/kztbw+TcedrH+jMHMg70s6qOMTO7gm4LYGiksJnfmTJG3WcoIb/fQyl881W13NwsySk8JdgveZhn0XhDV13XSVIEUkapFTqYVmDpANfC4UNPnbft/Y555jXNPK4WfCqRXJTHjqWwv6REIg20uDBJoI9ABTk8iEPAtwzSA7qzEphGtk9P49R9cbfrEtud8bwT2t8J0HwcOtL9PQwjtqYPaMmd3naitSeZpMzmO3jw5LzRzPnG/eDH0e3Od8YDdqWzdVznXOpK0m8qjdxzdBQBCGmleeDykw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <381b3611-79c2-807e-c5db-d5c0d9ea4fc4@suse.com>
Date: Mon, 1 Aug 2022 13:40:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/4] vpci: use pcidevs locking to protect MMIO handlers
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-4-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718211521.664729-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 550a54eb-8273-45bb-35f9-08da73b2b19a
X-MS-TrafficTypeDiagnostic: PAXPR04MB8941:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FaHYnuk1hQmlilfW3WSH1wLQK46E/rRlewrdXTxJUr73Sm3V50UWo+//oQTzFou3viQedtFhWZgw6FXj5+X+gsPJ4n//feDkls1D2k58FWYZBQxQf3rcnf8hxVU0JFaL+f1HrFAdWbxfen19oj0nJ/P3uGFTthsnhKgy2Ad3YvhiMi+Uoj45qMoCHrcPQiq2+o7kFUtPd0ShkaZDsFDC+sCMfXsMqkaC8Gpx9gKSnIO/XHfjTvwTOMimGRtdnRW6lDSIyWMglqhmkJXX1okBEbgrLuYpvUN5m9yaZj39IVg9O5ky18k7Cd7aFCE2oniMBR+1hVrZxVn3poLDVOdNwL62y/tpxll6NkWTaDdlta658HuelL/QrjdrlAOCR/ZrhyL/sZoF98PT53iL6fPFoEGVTAMzRmLtVb01KkztLTWCWSJr72BS6HSHpUArntqi6jQDowJwmIsVuO0K0+geHTCxD4wWRtDOsVJHzmV/4o1aRAvW98S7lEe9Gem22fV0nzB4x2FbtK14CufMluZ2mJbazkNSCK003K8J2g9DgnS8mgCPYJLzzbue6aHCE/Atr6E15kHuzwviLIUrtLMW7hdXbDjVGEw9PmdV9h0q20+xvWQlRPfTSD+LQZroG3Pi6ohCeMG6BLaeR+H23/JVYx2wZ2IPT2fofvHe/fBh1tYQMyTMkZcAoT0nW40qPkwMcgf4dPSXwJt7Y7MwsgjYHOENoi1sI3dvqs4NKSTOjqw7cfUIVg7ukFWBUQhks6zTQYqeG9+IgJpxeMqkBSjINhdiU5M4r+n3bLc56SIyMVreIlAi/M7xl2pTTjdfJsBbSjbbHOkwQGrGKg4UhKTDxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(39860400002)(136003)(366004)(396003)(66476007)(316002)(54906003)(8676002)(2616005)(66946007)(4326008)(41300700001)(66556008)(6916009)(186003)(31686004)(38100700002)(36756003)(6486002)(5660300002)(8936002)(83380400001)(478600001)(2906002)(26005)(6506007)(6512007)(53546011)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjdCVllXN0UzbVdZRmFtRUtTMmVJclplR1ZlYlpvNEpiR3hoT2F3ZVVmMDJa?=
 =?utf-8?B?dGx6cDh5MWU5Nm9kbThhZzBvUVRRVTk4R0FtUmFPcDl2d1pTOG5SVDR2K1JP?=
 =?utf-8?B?M0VZM2daZ2Z1MzBRNUtOQTZtdUdkNm5zTTVuYysyQVBVZWxNaGhINS8yRUdr?=
 =?utf-8?B?VURQWHBRSy9YbWhmb3p0R05iTisxZVI2b3l1S1VGb01FZGJ5QTBaeWVFZjJ6?=
 =?utf-8?B?emVSMEQ1U2tDYlRhNW9JYnFXckJPV0RrK2s5S0NDdC8zY2xMMnUrQW9aN3l2?=
 =?utf-8?B?aEhjeDUxVXpWTWp3Sm1RSytJRE9NbjlFT1Q2ZGxIUE1qMU1kN2RoS1FrYlVP?=
 =?utf-8?B?YWJ6VGdyVi9MdEQ3aUN3LzBGb3NBRkJ4ZExIbitsTTIyc1AzYi9UclQyL1Ay?=
 =?utf-8?B?bmlHTVRBdUtBUSttaEIzYnFKNkczMnFiUjJVZ1hQSEd5TFNWOGhrTXZDd2t5?=
 =?utf-8?B?UHRML3JOcmRhYU1LckdZaWE0QVZGaXNYN0pGakZDSkZzb1FOcjVIbzNRQm9a?=
 =?utf-8?B?V2VKWWZvYWxiMXhFRXBSbDRXa0dVeGwxZFdQbkM2Q05CU2Z5TmxBWld3amlH?=
 =?utf-8?B?RmQ1RnZ4TzNNM2tMQk5SampGakVxQmw5REIwa3orQ3hyYW9OMFZZdm5PR1kv?=
 =?utf-8?B?WklaYjFUREpIdFBBemh2bVVWY2xFSkxYc2l2aWgzazRXSk53RGJMcHRiZDdX?=
 =?utf-8?B?RXpOUVlHZ1VPMXRpNmJIRWlFUVdaaFlldFJLNXdaQXhDaVV6THFSOXRWa1Zx?=
 =?utf-8?B?N1grOGpQeGlTMm94N3dZUVFDOFFqTTNZMjVsN3RhSGtxVVlJQTIzd1ZjWVBM?=
 =?utf-8?B?blVtZ3BaUUVNS0NjdS9wMEtjTElSQzNxeGc3YkFuWVU4NTJUN0t3ckZKRWY1?=
 =?utf-8?B?Q3JwdlpxdDE2UXovSlRpa0JnVGFJSjRuaGwrckRkY09hUjJudGQ5Yllyc28y?=
 =?utf-8?B?MXg5UjhicTRFanZkK2Z0aVhIemVjdmtPU1RkOUJ5S0lCTytsTlRlRDJkR1hv?=
 =?utf-8?B?REdTZ25jR3B2d0xoSjhFT2Mrdjh6ZU14bUlWMlNsNzlMNyt4aXFQQU1iaWJC?=
 =?utf-8?B?dVNyK09vRGhtT08wUjdQT1ZGNEdpNVQ2bVljNkVuRE5yZUZrT2dLYVVDSWRX?=
 =?utf-8?B?NksxdFlzWGZacXUzeE5JUlg2MzZOTlZXZ0RHMW0rWC94NUtyVS9SWnRVa0hD?=
 =?utf-8?B?U2lpdmNYZ1hpdjJGSWEwM0c3VUFrWlRmdUt1MndBVS9qUDByZ2xRNG5yK3Q0?=
 =?utf-8?B?MlFuWmNMdnVxQXpQY0dzSFMwblFjSFFuK3FYSGlNaWFoSFZIRFpSbms3OHVk?=
 =?utf-8?B?VFN1VU4zakhqRHpHTWY4S244ZGZGRjUzbW84d0M5UUxlblB4VTlqN3IvRld2?=
 =?utf-8?B?cGV6VkwwbjU0Q2pUTHl1b1gxSFBlS3BGNDNKc3YzNnRVbzdnQnJPUHZsU05h?=
 =?utf-8?B?aWpOQTIyOVZobnRCYTRMWWdodmlzSDVwNWY4b1ZmWGZLSEpWZDdoNGNNdHJn?=
 =?utf-8?B?UDBsUUs4K2lXZ3ZjOEZJKzA1dHZQU05wQ0YyN0lBSlFaKzc5d1Y3N25mMXAy?=
 =?utf-8?B?eHJrZXNQdFBTMjNrSGlNcEtyNnJaVzRTdHEvckFDTkJ2aktRQWxoWlVLQlFG?=
 =?utf-8?B?Q0RpOWxmMnRXbHZFTFlWYzloY2VZMWZkb0JpU1l5c1JCbE1PMlNGMk5RRmpY?=
 =?utf-8?B?dFMzcmRac2l3bTI3NlNvaDhlQjBwV1RYdTlwSUs2SHdNYXQyYWJ0cmc3TnB4?=
 =?utf-8?B?Z3ZVTmRxKzRDU0s5enJNZkxySWZwblJCU212U28xYWdmaHpuVFk3cGxiejh0?=
 =?utf-8?B?bnJ2MjZielRpZkMyd0ZWOTJ1RGNLSU5pUnM3OGRpbDdOcmFYT1NQVUFYN00w?=
 =?utf-8?B?dTVwUWZVSG9wOVRpTVFLcGVDR3ljeWJwbjFZVEd6dlBCVGlOWVh3ZDFYNFRB?=
 =?utf-8?B?THNNZ2VGQUkrV3E1N3FiSHZBWUc2MnZWb2dicE0vVHZHR1dENElRNWN6WSt4?=
 =?utf-8?B?QnUveDVkY3ZBRFdQV3FmNTRuVHA3Tkc5RlZQRythbDBXRlgyd2tmcVU1Rytt?=
 =?utf-8?B?S0ZWQmtnYzNEck9lUlp5MzZiVkFtUnRhUDZ4NTk2V3NSd3BWK3Y3L0t5bUoz?=
 =?utf-8?Q?5BwQo4wJ1slv8FySR+J6GAbp9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550a54eb-8273-45bb-35f9-08da73b2b19a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 11:40:54.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCoabzCaS5K4w3Ops/wd6suEzW5hYDyUubULyauJBrn0J2ylxLkMVlpDvcZH3YLypwHqs+s5UuOS4iktdjodbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8941

On 18.07.2022 23:15, Volodymyr Babchuk wrote:
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -891,10 +891,16 @@ void vpci_msix_arch_init_entry(struct vpci_msix_entry *entry)
>      entry->arch.pirq = INVALID_PIRQ;
>  }
>  
> -int vpci_msix_arch_print(const struct vpci_msix *msix)
> +int vpci_msix_arch_print(const struct domain *d, const struct vpci_msix *msix)

I don't think the extra parameter is needed:

> @@ -911,11 +917,23 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>          if ( i && !(i % 64) )
>          {
>              struct pci_dev *pdev = msix->pdev;

You get hold of pdev here, and hence you can take the domain from pdev.

> +            pci_sbdf_t sbdf = pdev->sbdf;
>  
>              spin_unlock(&msix->pdev->vpci->lock);
> +            pcidevs_read_unlock();
> +
> +            /* NB: we still hold rcu_read_lock(&domlist_read_lock); here. */
>              process_pending_softirqs();
> -            /* NB: we assume that pdev cannot go away for an alive domain. */

I think this comment wants retaining, as the new one you add is about
a different aspect.

> -            if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
> +
> +            if ( !pcidevs_read_trylock() )
> +                return -EBUSY;
> +            pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
> +            /*
> +             * FIXME: we may find a re-allocated pdev's copy here.
> +             * Even occupying the same address as before. Do our best.
> +             */
> +            if ( !pdev || (pdev != msix->pdev) || !pdev->vpci ||

Despite the comment: What guarantees that msix isn't a dangling pointer
at this point? At the very least I think you need to check !pdev->vpci
first. And I'm afraid I don't view "do our best" as good enough here
(considering the patch doesn't carry an RFC tag). And no, I don't have
any good suggestion other than "our PCI device locking needs a complete
overhaul". Quite likely what we need is a refcounter per device, which
- as long as non-zero - prevents removal.

> +                 !spin_trylock(&pdev->vpci->lock) )
>                  return -EBUSY;

Don't you need to drop the pcidevs lock on this error path?

> @@ -450,10 +465,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      uint16_t cmd;
>      uint64_t addr, size;
>      unsigned int i, num_bars, rom_reg;
> -    struct vpci_header *header = &pdev->vpci->header;
> -    struct vpci_bar *bars = header->bars;
> +    struct vpci_header *header;
> +    struct vpci_bar *bars;
>      int rc;
>  
> +    ASSERT(pcidevs_write_locked());
> +
> +    header = &pdev->vpci->header;
> +    bars = header->bars;

I'm not convinced the code movement here does us any good. (Same
apparently elsewhere below.)

> @@ -277,6 +282,9 @@ void vpci_dump_msi(void)
>  
>          printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
>  
> +        if ( !pcidevs_read_trylock() )
> +            continue;

Note how this lives ahead of ...

>          for_each_pdev ( d, pdev )
>          {

... the loop, while ...

> @@ -310,7 +318,7 @@ void vpci_dump_msi(void)
>                  printk("  entries: %u maskall: %d enabled: %d\n",
>                         msix->max_entries, msix->masked, msix->enabled);
>  
> -                rc = vpci_msix_arch_print(msix);
> +                rc = vpci_msix_arch_print(d, msix);
>                  if ( rc )
>                  {
>                      /*
> @@ -318,12 +326,13 @@ void vpci_dump_msi(void)
>                       * holding the lock.
>                       */
>                      printk("unable to print all MSI-X entries: %d\n", rc);
> -                    process_pending_softirqs();
> -                    continue;
> +                    goto pdev_done;
>                  }
>              }
>  
>              spin_unlock(&pdev->vpci->lock);
> + pdev_done:
> +            pcidevs_read_unlock();

... this is still inside the loop body.

> @@ -332,10 +334,14 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          return data;
>      }
>  
> +    pcidevs_read_lock();
>      /* Find the PCI dev matching the address. */
>      pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
> -    if ( !pdev )
> +    if ( !pdev || (pdev && !pdev->vpci) )

Simpler

    if ( !pdev || !pdev->vpci )

?

> @@ -381,6 +387,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          ASSERT(data_offset < size);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +    pcidevs_read_unlock();

I guess this is too early and wants to come after ...

>      if ( data_offset < size )
>      {

... this if, which - even if it doesn't use pdev - still accesses the
device.

Both comments equally apply to vpci_write().

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -161,6 +161,7 @@ void pcidevs_unlock(void);
>  bool __must_check pcidevs_locked(void);
>  
>  void pcidevs_read_lock(void);
> +int pcidevs_read_trylock(void);

This declaration wants adding alongside the introduction of the
function or, if the series was structured that way, at the time of the
dropping of "static" from the function (which from a Misra perspective
would likely be better).

Jan

