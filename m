Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15C738294
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 14:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552697.862910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBwbO-0001QD-2a; Wed, 21 Jun 2023 12:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552697.862910; Wed, 21 Jun 2023 12:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBwbN-0001O9-VU; Wed, 21 Jun 2023 12:06:21 +0000
Received: by outflank-mailman (input) for mailman id 552697;
 Wed, 21 Jun 2023 12:06:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBwbM-0001O3-DW
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 12:06:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07ad3a1d-102c-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 14:06:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9695.eurprd04.prod.outlook.com (2603:10a6:10:321::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 12:06:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 12:06:17 +0000
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
X-Inumbo-ID: 07ad3a1d-102c-11ee-b236-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEZb47cg5Mn5wkYIUpKrHUs5Ydvz3MHOxF2/RKZmoT0XsMC/OR3gkPI7a0x8HY2xj1vhW769et7N1vEuSapCtiIA89Qtuy1INKUFexjRw2bpICPCKWeaG135xiL2GaO1FUt2NjddNv/Dw6olF6otMIDSxMEBGYujRlOBX20lJSicMXW9OnXkCbpsm3wQeG2hlcNIEsF8CjG9b4D37dO2M8MS+RzGydgp0XaFxNAdKYZynBYfNBDh4U25tCsBOOVgGUtlhWhyrfYDVd2F7vn4YSSenHPkm/4AVOBgOEgCdPdvuUBTmHA+LzQGf5JCo9+HSZO/j485OZJjFzxgk6GDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzDCKPXt3E150ts+tNMv5iwq+ySNu/Tkpv8Q+i81QZ0=;
 b=Duo/o7anLYllYXK9JsyCOOMnafY7pkU2flIw5BrxWiFpgBYEd4Np+qjVxn+ITb2qSC7dselXdiHaMZPlXtm9tXFZXdPbhUM7kVh9xE/LDHXd105qlRCe/Jtj+yao2tBFq7DCktMWjoJqhXmwZ7yjSKOG3NQP6OIroLlY3/XoXLtMeWfGWqMRgEt60YWDbV0a3kGqYxaPwP63jCfWaZZSp46tzfu9njOXQhwDqiNsipceKfi9ksZQzjgTRlk3nK+Ti/q+gv3+g7NUOPu65RfX2dFRtbz/Rv1vvLvu/6UMmjtU8YopjO4GQb3N2DbOOeo32Isfmyn8QR+ArlLiGakSdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzDCKPXt3E150ts+tNMv5iwq+ySNu/Tkpv8Q+i81QZ0=;
 b=I5wW4xT6AhMP7KqNVlbVVxUO95tLGyU1icZoP3dBiJAa6zg0bcOXhdC/m/dirvSqPn3jZZgMXLGd6+2ol2nwLrMwUrmhYQUg/qCVkdjqLhtsSbfAQ356bfbCCsQfX2U76wMg8Zl3e+KOV92NGR0iL7AnFPWix8S6inULRvI4jCS6ak4DdF4yWkcMRzf4CgNjK/MC3qg2CZfz1qpzlzM/ceblLpjOOm5Uc7mfaDaQQUkWQHg123fFYmIX7VMkgQYpbvOOnEYTXNkUzkxZ8X/A4ac92qdiQkVnERiQ+c1Gag1P/Q1lZtdVVNRa0EWA6OMFf900G9GWNd22UyhoCKTQIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f368e425-157f-ea1c-2123-be8a374c328d@suse.com>
Date: Wed, 21 Jun 2023 14:06:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 10/12] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-11-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230613103159.524763-11-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: f4de9c5d-f30e-443e-d609-08db724feaad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cpD7pd4cbNb9F/s7BugitajmdrSUWmgKgvxJAw2xyDFUWye+/TO00S/lSr9kmqbAhJIQ9mpmfoiW2ddoMUMBn8F1+/Kgc4Vcm80glozgngyvUlv5UmY5NIqPUhkQ2gkW9hzZaUNYyTcr0QDxppKoHAvV8Ae0IjnE+JPdB1eZ5u/pAc78bVo5Q8bFGnjhRXJtZJk2uYR0lv+iF3V5dNqvQIodaiYPpjH3h7Aa964Zj4U6+9mBomjkG4ZUjC2dXsN7xMxKny3PHAqDvgsS+28jEuKugOQCYMggxU38o5rxMGzU3ZYukU0K7sbhnLqbFWjsAtQhWhCCD0mqD1B3wtxPmikRZ2XJitp8nMukoYAdf1s/DMum1IHzl+ehUw69ry3JneFXnpga5b3CI1u/Aht3Dqn3ZGeeDMlz+i5qhp+GT9jcY42ujmb2Q86XG5zLnmS2gCwgcHNN0BWm/6UztZ/wnKNA9nfMkVezI1KKTOMmeAWbuG4ulwHd+f3HIgs8Ly11pIh02+YYV6OeGJWBCJz9d//NPuJ5HRL2wv8gPK4InSuUumHA+hLqpcNNMae9DdsS4b6YFadnd46AtTmv4W/crDbo4QUopa9DTdQxi25r+4LN2Lc1Ku8Mbgg2dVuk0LTRa8utPxr5a+JkKyasmygqyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(5660300002)(31686004)(8936002)(8676002)(6916009)(4326008)(66946007)(66476007)(66556008)(316002)(2906002)(54906003)(41300700001)(6486002)(478600001)(6666004)(26005)(53546011)(186003)(36756003)(83380400001)(2616005)(6512007)(6506007)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG15TVZ5cXBrSHFYcGk5a0Rqa1lyR1M0OVVYUmY3UVVUTnhNUGxmMytlTkRL?=
 =?utf-8?B?WDJiREhGZ1hqRkJPUnE1OVlnMFk3WmRCbVZrQS9XVXdxRHpKNHNMLzd2TWJw?=
 =?utf-8?B?MTdUendHSW9NNXNZdEJaczdzUE10S2ZLTlVlSldhdFBFdFVEZ2RPTVNVUkxj?=
 =?utf-8?B?UFpXQnBPSXRDeTBWcXExbG9pMWt3eGVQa2NxYXJ4U1lYb1YveEdkTkpUZTR5?=
 =?utf-8?B?cWNGN1ZFamZENUJpSFBjQ0lUL3NZV2p4Z01GeGdtVkdkTU83TU1CVVAzS1VR?=
 =?utf-8?B?dDBQUCtLMmdkdDJ0WHJzTmhPb2d3SlYwQWZHbGMvTHluTGpibDJPU2wwSzZl?=
 =?utf-8?B?b3d2cElZbWt2Tjd3bnZtVnpvMFpjL056b1daZXo2N0xIWnNwVytsSW1mcjM2?=
 =?utf-8?B?TXJJV0NuT3QyTEtEaEdJdjh2enJSaHlGVUhvSkFQVkZ0RVYrb2cwVDlPditx?=
 =?utf-8?B?WUhDMGpvc0dFVGhBYXl1L2ZWTGZ4TldkM0JMdTZGUzR0UUs1R2IzTTVFd3pB?=
 =?utf-8?B?MThNaTMyK01CQkxWRndxM005bHppUk0ybDlyVXhKWk1KOS9wOFFPMFZhY3Fr?=
 =?utf-8?B?QXVnOGl5dU5iUWQ0MFpaQkJ5Zm5lZHM4VSsrZk5NS3laR1BOQTN6WTBpTjJh?=
 =?utf-8?B?ZmFrK2xCT01qaFZDdjNHUWJFZ2Z4V0tVUkJUdDY0RUp4TXRtV1dSUU1GZUJT?=
 =?utf-8?B?N2k2QjY3cElhRmpRaHMyQW9FMkk2NWc1RWNyUHJwd0V2cHZ4RmVSYXdCM3Nv?=
 =?utf-8?B?amkxcnowdVZVMytJR1pxNmlOdGQreXNocnJPVkRRcE5mZlF5WjVUL0NCM2Nv?=
 =?utf-8?B?eGtvNk5KNDZPKzhRbWhtUy8zVnNVSEhSSXdoeVBTdmpidG1YVWErcVUrdGNC?=
 =?utf-8?B?MTZXOUxNaHJUWEVyeXJTd1k2Zk1MczdkMTNPTzdGRjhTR0x6aDV6ZzRmVERT?=
 =?utf-8?B?OFlESjJxbU9sS0VtcFhRcUs3SmlxdmhwZ2xFWkR1a1QwNzBydDJwU0phYmZW?=
 =?utf-8?B?T0ptOWkwRnJET1ZFU3huMWVxTk1FUXdWVzZIQXAxakZKOFZDa1FJQTgvUmN1?=
 =?utf-8?B?MldjMkl2TFFMMVRjQzZPWXpZZ3VqdW1MUlUzTEwyejdzUUZFUVZRYWNHZkdC?=
 =?utf-8?B?L05EVTREY01TV3ZxdHVYbHR0QmlGSnk0QXgzU2Npamt6bGgyTnY0bGkzS2tC?=
 =?utf-8?B?dFdUQWcvYnc4eU1rcUxrZmM2NVZ1TThrWERHdGtzRWhCa3kyYXkvaHg1eEpZ?=
 =?utf-8?B?STU3VFVtTkRhRzNqdlU5RnYzMDJtRlU1V25FQ0lIaWdmU01MV3M1UHNOS2ZP?=
 =?utf-8?B?SEkrL3h4QUlRSlhIMDgyNmF2ZmFSYWlyWStWTEpJa1lLR0xYRlZuSERoOWNQ?=
 =?utf-8?B?VlN1RmhSRjVIL2cxNkxQeFZ2cE5abk1YcjY2VW1KKzhuQXZIVUF4akF4djE0?=
 =?utf-8?B?amlZLzl6aFgwOVBEMmxzNW1LU3E3YkxXMlViV2liWXN1bmE0YnlETjlpMnVD?=
 =?utf-8?B?OWgvMjlrVVE5YktQalArMDhzRTFRZW95SFpkanJNTEg0b2JRdkRJZm10Z0NQ?=
 =?utf-8?B?NnBoZ2RhYTBjZXNmTWtCTHIwd3NUKzBEVXhYU0pQK2czREIwZW4wVGhDQVN5?=
 =?utf-8?B?NEROYnh2NlczcVZ4VnpseSt4ejQwV0ljS2ZRajRDMWc2NjZvRWpqZThuVU5t?=
 =?utf-8?B?bTNGSWdqM29KRnJJRjdYSjlBUllqM2JaTkdUT08rWWd1a0wrN2t3bnRrQXM5?=
 =?utf-8?B?SG1FeUJpVDhnaWFWaC9Neitia1pDT2pXU2lpTDFsSnBTSE1tL0QvcnZhb0hD?=
 =?utf-8?B?Wm1nNGcxanBsaUEreTNzdmxjZ0ZmUGNQSzhGS0d0UjdYT2tQMzJaV2hBMS9S?=
 =?utf-8?B?Kzg3T2ZSVVJqTTZLVm1Tanh5dERVU2tWSmxJeWJRZ0V0eC9VQmt6RXdodUxu?=
 =?utf-8?B?Vk5CNWdaSFRvVytXRUlXUkpTdllaaE8yTk9uYyt1S28wTGR5N3BOdTZNVjhP?=
 =?utf-8?B?dGtNVnVLZW0reWtXelBWVEVWQW80Q0FBaXRNN0hLZ3daRVNFUi9VTU50R1d5?=
 =?utf-8?B?ZnIwd1FnN0pjd3J6UTI2TDlkSWtvTHZyRy9rZ01wV2cvK2tYUGpSazNlTllO?=
 =?utf-8?Q?v4XItrp/JCiJ7dIfzc4xhzL/B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4de9c5d-f30e-443e-d609-08db724feaad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 12:06:17.0069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDHARe2s5+mErQvfObvxFlMkTVKpcLr4XQLMoEnMyTbLXs8/suuPreV07Cnz2X7u33aT5ZEq92tBx7eL2mXg/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9695

On 13.06.2023 12:32, Volodymyr Babchuk wrote:
> @@ -121,6 +124,62 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  }
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +static int add_virtual_device(struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    pci_sbdf_t sbdf = { 0 };
> +    unsigned long new_dev_number;
> +
> +    if ( is_hardware_domain(d) )
> +        return 0;
> +
> +    ASSERT(pcidevs_locked());
> +
> +    /*
> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
> +     * there are multi-function ones which are not yet supported.
> +     */
> +    if ( pdev->info.is_extfn )
> +    {
> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
> +                 &pdev->sbdf);
> +        return -EOPNOTSUPP;
> +    }
> +
> +    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
> +                                         VPCI_MAX_VIRT_DEV);
> +    if ( new_dev_number >= VPCI_MAX_VIRT_DEV )
> +        return -ENOSPC;
> +
> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);

Since the find-and-set can't easily be atomic, the lock used here (
asserted to be held above) needs to be the same as ...

> +    /*
> +     * Both segment and bus number are 0:
> +     *  - we emulate a single host bridge for the guest, e.g. segment 0
> +     *  - with bus 0 the virtual devices are seen as embedded
> +     *    endpoints behind the root complex
> +     *
> +     * TODO: add support for multi-function devices.
> +     */
> +    sbdf.devfn = PCI_DEVFN(new_dev_number, 0);
> +    pdev->vpci->guest_sbdf = sbdf;
> +
> +    return 0;
> +
> +}
> +
> +static void vpci_remove_virtual_device(const struct pci_dev *pdev)
> +{
> +    write_lock(&pdev->domain->vpci_rwlock);
> +    if ( pdev->vpci )
> +    {
> +        __clear_bit(pdev->vpci->guest_sbdf.dev,
> +                    &pdev->domain->vpci_dev_assigned_map);
> +        pdev->vpci->guest_sbdf.sbdf = ~0;
> +    }
> +    write_unlock(&pdev->domain->vpci_rwlock);

... the one used here.

Jan

