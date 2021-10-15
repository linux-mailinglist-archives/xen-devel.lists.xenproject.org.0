Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1AE42EAD7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 10:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209862.366433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbI8q-0008TJ-AN; Fri, 15 Oct 2021 08:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209862.366433; Fri, 15 Oct 2021 08:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbI8q-0008QJ-6V; Fri, 15 Oct 2021 08:00:36 +0000
Received: by outflank-mailman (input) for mailman id 209862;
 Fri, 15 Oct 2021 08:00:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbI8o-0008QD-J5
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 08:00:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cecc61b-dc2a-4876-9602-b4af37ce4a79;
 Fri, 15 Oct 2021 08:00:33 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-vze-wcxwMUuq0m212oZ8ag-1; Fri, 15 Oct 2021 10:00:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 08:00:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 08:00:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0117.eurprd06.prod.outlook.com (2603:10a6:20b:465::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 08:00:27 +0000
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
X-Inumbo-ID: 4cecc61b-dc2a-4876-9602-b4af37ce4a79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634284832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tq+awYj+ZnEKgeRiE5OU/ofkwXDqqFRhPxxAft7XSNA=;
	b=hIUjJib6bJbE9uEXmBgbvgBJ8cffAk9FIfvUx10rCZe35XdtoShTMb4rSCtRjEf3RVJdFS
	9jY6YP5NSZU2cARAGiZhCqvLdWCyJ6e5VDwpUOyX7Dlir824c/Ba1yr4w25T+ZHTuxUPKT
	w+6fLjg6WJWqIFsT5J+FDm549l3EbIM=
X-MC-Unique: vze-wcxwMUuq0m212oZ8ag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlDIhU0QF5na84842RwtxMSpqHFDjJZxoWqMflUX2X2Sw8bgfI0oH52wFQS0DQJDcNl5wcYLXdFtdwYKrFXN8NqQdDKVgPpWoaVa7VDWSP6Ui46dWLSELip8hKaFO5aQQWa/K+XCgusVFQ1t+4k72GZF9iDepFxruiVWze6zuggC4E8PWDPIqk67/by3GRvxmQmm6hcAabKMbpMcfUOI5OwcIQxI4+NQd57wqDOOuOfjzOW/Lu5dmf/9zYlGl+m42y45aYGk2KbluW1C7NuQHHPpQzAPIXC28Z3qvrbBTqp8Hw8IJU92wbLLupAJmYScgAbsRY3KFTuwSLHvjLgx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tq+awYj+ZnEKgeRiE5OU/ofkwXDqqFRhPxxAft7XSNA=;
 b=JGi9UcExgNqQe0QU94+Tqn4/g0pzyU9Grlrenv6OaKl7j871LCdc/exXuMvzLVhhrLlFdzikg3ZoLMh8EvYfCnkMEWCQ74v9Mxp3Dctw3c1COn95E5PEmemZPH4AVKXG4dGpfgEGmYpBBXc9xBhj7JPHu1f7iLBzgk1Ni0kaehaBqYquFp/SzpJ4xVQn3QgzFNBTYsLbRdNe0Ry6irn3l6gq1FQtp1jesi47INSMsA4JOt2v6u2SnyQ/Hbunp7193SqtgNNuxua/pXhMaT/WVC8ogeAYQXZJ34mp4tEIuRx9bq5t48TEvqn8lesJ/Wi62kCIOLb+Pui3kECr8eC7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: iwj@xenproject.org, Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
Date: Fri, 15 Oct 2021 10:00:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0117.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d743cfd1-1105-409e-6e9a-08d98fb1da8c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39340A321015A5775A49E35EB3B99@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nfmRcA/7FGPTj/wLqkN56G1r/GqMPRbsi1cMG1H0xN5e7GbBWaiytXWQ3EJcjwFRIyR5uOExXvjDVOa8ErsYIER7R2vVc31AH1CzzhRqiQcSsy1kNVPbrorz7ZSmGEp+19eIa/qZiYZIh8H6Bpl8dnHcSfBNLXXlxZPj4OgEvtZkXiBeZLlIc/YWNsvLiy44PqM+zJBCGZSAJUoJ5VRmHZn67YjTuWDDclE8nHmS2Z2ToTILNqzWOZuHWdticGy9H3f+KZrYMe8BiPx2ClS4IiNDoT8J168h2KlMrIyK9ImJQzfHiQFDqblpFkVsiSNP61QranS5QOteHDqS5uzOs0hRKk9r5k0vM/QmZv3XF/cyS2EhdcREG3N8W5k30HMGG/yYW+alHnDnZOW75a0FHddOPyW0qIYI7YZDzIWKfT7Hc+PXNZz3/GuctxzI6OaZ50xu6cGLCHbgG6NvYj+jLQpH5Ev2jXaKk2A+8gVma2WY7/3XPikonkWVr3DWxp1oM8h2pU1E2iHSX3Vuwi5QxuKjCqOaaB/2ZtOzRV5s04E7NMRH+laTWBKgegfUXKye2+pFrixUnLQ3Q5gSGNv4jC/12NMxfOWlw7Kd0rFgD+okfflrkYsgD19EJMl8oSD33dKz1/O+tILFbOQshC1NaU8yTJdsZkm3zaV7uQEvxEchh4el1et29By+CGe8Mqa4B/JOho39riUI8opapsQoO7XGqQO/vWEwLXJYw0wOiUI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(31686004)(38100700002)(66476007)(66556008)(5660300002)(26005)(83380400001)(31696002)(7416002)(508600001)(53546011)(86362001)(8676002)(36756003)(2616005)(8936002)(956004)(110136005)(6486002)(186003)(16576012)(2906002)(316002)(4326008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlNxWEx5eVFrMTYwNDJJMEVkY3NycTBUN3NPM0tnak1oUGE3ZmVDc2hkUU5n?=
 =?utf-8?B?L3MyTDltOHY3V2F2UDFoL3NHTG41V2g1OGJ0YlVNb2Yrc016NFRxSXRsSmln?=
 =?utf-8?B?L0NYdldhQnRxaHR0VmFLQUdST25LSGtCdUcxV3Z2U1lVNTkvZ29RM3pNOVR1?=
 =?utf-8?B?TDNrMEFLeThJNWFvWkkrVTZjSDF4SEEzNEpDWndWZTNMY09LWHJrbjV3SGVh?=
 =?utf-8?B?NEw5bENQanJJVVluTXNialNkbVROZ1hDbmlZZURYVHk5dHhlODV5YmhReWdh?=
 =?utf-8?B?VGhGQVdMM3BWbjh1d1BXb2krYTFRazdTSXVIOG40ZEdyS25keXMyY0d1Z1Zp?=
 =?utf-8?B?a3dpUm5qZ1E1Mk1KNjJNYXIvQWNueFZvT2pEYVM4d1pBNXZuc3NONExDdjgx?=
 =?utf-8?B?NTEvbkM1em1sZXlIQUZ1Vjd6di9OSnV1ZXB3eGxVR29YRDZidnFPNG1yZUZV?=
 =?utf-8?B?UXFlUnA1NWlNeVN6OCttZElnZEZxTnNvRnlvK29HN0h5eDJtMnFjQkFja0JT?=
 =?utf-8?B?QkFvN1dYc1laeVlHaEdmTXFnQ3JtQ1pocXhRc2VYTVR3SFIrRVZkcjFvek90?=
 =?utf-8?B?eXlndnVoNGJGV0h2bnRDNS9kS0tzSlZwYlFLZUkzbnByb0JWa1NrNitsNW9H?=
 =?utf-8?B?NmRtSTQrTTN0VWdzdkYxbFNTN3VTaXkwZTJyUkJoeWVwMDVhdjlNTmtobk8z?=
 =?utf-8?B?aWh2Wk85Vy83Q2wzbHdlOExSM09jVnFLRGJKOU5SN2drWUZWVms3RC9pQmZ6?=
 =?utf-8?B?bTlYazNuQ2Z5akt3T0ZtM2dOaU9uS2V5U21qcFlyTlVtaXloRXB5K1VSYlZO?=
 =?utf-8?B?eE1YSTRyUHVPcVBnUTZveUlMY2Vvb0FNSnVCMjR3bStuWlRNSXV4d29hYmVh?=
 =?utf-8?B?SXZHQ0FpUTNNdzI4UjRYcnFOWGdsVEdUdFp2WGEvVjFNNFpMSTJPNFI4NWx4?=
 =?utf-8?B?QjBDMEdvc0VLak5scmVPeWRGbFRMRG5Ld096QTMwZUVGT1hCaGlPRFJKelNV?=
 =?utf-8?B?SlBBaTlIYXB5dWNFTm41VWdMYmtCMHltYXdKQzJQZVBQSi8ybTBFOTRjTTda?=
 =?utf-8?B?cUdxbVJCcGoramxYR2w2WnpGMmt1Wk5URWJ4RTR5NEJDWC8xQjF6SlJ3V2ZR?=
 =?utf-8?B?ZG54Z3F6ZlljdnFRYXNqeFc1RnBheGt3RzdOZnRZZ0hOQ1NrNVBjOFFqek1a?=
 =?utf-8?B?SVRxa2pPZnowb0VBSVlRdkU3RXlSbWprK2RZYnFMeS93Q0dDWEwybW5KdTVJ?=
 =?utf-8?B?TU1ydkZWMXJWVmtpZlNZalo4Uzg0NGxQS2hxTG00VlRuMFRTL3NOSmh0anh2?=
 =?utf-8?B?V3premt5TktVcHdXY280ckx4K25GaGhnZzRHb3R2RVZVYlJrdE5NYVFDMGlG?=
 =?utf-8?B?RkR0WEV5a1FlaFJjNkdYekZKTkZTMS8xb3Bjc2RHTHRscTFhR0tnU2FTWUda?=
 =?utf-8?B?VXQ2dE9VWjdVb21RNnU2NjdQQmhIdy9GNzlXZ1FMS2pkWHFNbk8ybmdKelZt?=
 =?utf-8?B?c1UveXdTOWFzK1liSXZ5TUVLMldZQTF4QVBqcGdhTnVyRlpuR2ZZQTUzSVhE?=
 =?utf-8?B?MDR4aEJMNSt2Z1Jua05qSm51UUNRRDBBcmVBcmZHTFVtWlZZcVZEaklIaVBK?=
 =?utf-8?B?Y04zK01KbENlcGQrcFpwS3ZHYkpUOHdmZnhNQkk4VFpyNHBTNjA3QmJObDI2?=
 =?utf-8?B?Z1hoUElmeEp5V1F3WkFkMk1odEVKelg2NW9sNzNaa0lrMHVScVdVTmhhV1ha?=
 =?utf-8?Q?LfUSrF8rD7PbSDRHXhA+uML3wAX2UjpYF46iKPJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d743cfd1-1105-409e-6e9a-08d98fb1da8c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:00:28.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vleld+FHM3Sc6Dg6ccvgIWZ6aTc76WHvzvBdQ+O5lVCtCj0hhy3eJ2oiZDNFTXVYoACPQ28PnHhC2m1Qr2RYOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 14.10.2021 16:49, Bertrand Marquis wrote:
> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>  
>      check_pdev(pdev);
>  
> +#ifdef CONFIG_ARM
> +    /*
> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
> +     * Dom0 inform XEN to add the PCI devices in XEN.
> +     */
> +    ret = vpci_add_handlers(pdev);
> +    if ( ret )
> +    {
> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> +        goto out;
> +    }
> +#endif
> +
>      ret = 0;
>      if ( !pdev->domain )

Elsewhere I did point out that you need to be careful wrt pdev->domain
being NULL. As the code in context clearly documents, you're now
adding handlers before that field was set. In comments to a prior
version I did already suggest to consider placing the new code inside
the if() in question (albeit at the time this was mainly to make clear
that error cleanup may not fiddle with things not put in place by the
iommu_enable_device() alternative path). This would have the further
benefit of making is crystal clear that here only handlers for Dom0
would get put in place (and hence their installing for DomU-s would
need to be looked for elsewhere).

> @@ -784,6 +797,9 @@ out:
>                     &PCI_SBDF(seg, bus, slot, func));
>          }
>      }
> +    else if ( pdev )
> +        pci_cleanup_msi(pdev);

Have you thoroughly checked that this call is benign on x86? There's
no wording to that effect in the description afaics, and I can't
easily convince myself that it would be correct when the
iommu_enable_device() path was taken. (I'm also not going to
exclude that it should have been there even prior to your work,
albeit then adding this would want to be a separate bugfix patch.)

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -374,7 +374,8 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>              gprintk(XENLOG_WARNING,
>                      "%pp: ignored BAR %lu write with memory decoding enabled\n",
> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +                    &pdev->sbdf,
> +                    (unsigned long)(bar - pdev->vpci->header.bars + hi));

This looks like an entirely unrelated change which I'm afraid I don't
even understand why it needs making. The description says this is for
Arm32, but it remains unclear what the compilation error would have
been. My best guess is that perhaps you really mean to change the
format specifier to %zu (really this should be %td, but our vsprintf()
doesn't support 't' for whatever reason).

Please recall that we try to avoid casts where possible.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -507,7 +507,7 @@ int vpci_ecam_mmio_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
>  
>      vpci_write(sbdf, reg, min(4u, len), data);
>      if ( len == 8 )
> -        vpci_write(sbdf, reg + 4, 4, data >> 32);
> +        vpci_write(sbdf, reg + 4, 4, (uint64_t)data >> 32);

I assume  the need for this change will go away with the use of
CONFIG_64BIT in the earlier patch.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -40,6 +40,9 @@
>  #define PCI_SBDF3(s,b,df) \
>      ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
>  
> +#define ECAM_BDF(addr)         ( ((addr) & 0x0ffff000) >> 12)
> +#define ECAM_REG_OFFSET(addr)  ((addr) & 0x00000fff)

The latter is fine to be put here (i.e. FTAOD I'm fine with it
staying here). For the former I even question its original placement
in asm-x86/pci.h: It's not generally correct as per the PCI spec, as
the bus portion of the address can be anywhere from 1 to 8 bits. And
in fact there is a reason why this macro was/is used in only a
single place, but not e.g. in x86'es handling of physical MCFG. It
is merely an implementation choice in vPCI that the entire segment 0
has a linear address range covering all 256 buses. Hence I think
this wants to move to xen/vpci.h and then perhaps also be named
VPCI_ECAM_BDF().

Also, as already pointed out on a much earlier version, while the
blank following the opening parenthesis was warranted in
asm-x86/pci.h for alignment reasons, it is no longer warranted here.
It was certainly gone in v4 and v5.

And one final nit: I don't think we commonly use full stops in patch
titles. (Personally I therefore also think titles shouldn't start
with a capital letter, but I know others think differently.)

Jan


