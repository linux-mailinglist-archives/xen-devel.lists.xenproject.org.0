Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127CB48C75C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 16:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256726.440704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fia-0005dF-3P; Wed, 12 Jan 2022 15:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256726.440704; Wed, 12 Jan 2022 15:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fiZ-0005ay-Vk; Wed, 12 Jan 2022 15:39:19 +0000
Received: by outflank-mailman (input) for mailman id 256726;
 Wed, 12 Jan 2022 15:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7fiY-0005as-1k
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 15:39:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd140d46-73bd-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 16:39:17 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-Qz4w-rKeNISjt5u-zWqzvQ-1; Wed, 12 Jan 2022 16:39:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 15:39:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 15:39:14 +0000
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
X-Inumbo-ID: cd140d46-73bd-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642001956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuaw4pm64S8+1bi66QUmMLszgHEtQ4lMfAZnq59p/vU=;
	b=dQmmgdK5hZvb0Z9ufGCAl1dnERqxsyftgb8PHm6yDMdy+9xmZlQOCmyp41OgElGNlV/mMm
	St/FMJoVmbMWr4xzaJlGBSDLydnJcNfdqCsCvmyiOJ5HU4ybVV1umklZoCWUl72qRNvZd/
	O/mFmaO99YKX5djV3vNDMAffYoK834E=
X-MC-Unique: Qz4w-rKeNISjt5u-zWqzvQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QG8Q4o4EPXxjCRXigM7CK2vX9Om3Bkqhdq8osJZXlbM/6hiBAwOGpLNY/7U56KYuZ5ocVKw/cYj1cEV2LnWVL/mKIGtXL5Z1CYY5GUfhUV8IW7oseyTasas0mygjizku2JZ38Qq8jSn6B7aRhpPDB7+QVX+d3kEF9+ISnXc5reEzGcNi1RRhtgsWj9NzAI+cTBY0JjRC/S26bGjSB3a6yF9QtfFGxTK9JRZCs1Aa9zY6F7LXjhN9M9twW4dTbH2mwoBhUIqfa80209fPS6EVbq3olYE2VdwPPkOHDNKvDTINP4VyyAEWNu6w9sz4MgzfbW77hRWpkEeNU9eP38aTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuaw4pm64S8+1bi66QUmMLszgHEtQ4lMfAZnq59p/vU=;
 b=LrUiwrTutSkGPoZFVzhdNXy4HoEQSWpd4ZAM9pYMIYOrdqSniiCPc4EVlWpNj0cfJ/RbqOI+dobaECePfEAbkywXSoBriBqnOG80YtyVXLhgm5tZxfXbUX1t+lg8zm3p2b4sFcv/bLFLh0waVHGsKEu6zuf0R0HzajdyULIsCN9UM5hb7GXPqYyuLP/oLRk3nW17wo0zonyGiLPQqWYhGhOSq45Gej3FMXsf0TJ/vMXgcpYSm3l7q3rn6wKPWpNR6Ck+XrZLpfTsxNrbiKgSPrMF1AL4JL4j7F6EAyT3OmRbtY1Nn5hDV4jONabPwGMKJimtbdrEfUosgNIy93mA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6caa134-cef4-f6b2-378e-759c10a37c0a@suse.com>
Date: Wed, 12 Jan 2022 16:39:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v5 11/14] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-12-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125110251.2877218-12-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 141b6f8d-64c3-4d6d-1908-08d9d5e1afc4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2702B9136454DFD96C0E5591B3529@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fj+12UwaMvb0gG7yC18LrCBsGHHZ42Zb/54FskDE7oVt++2Mq+WQH2hvyLyWIbdsQ7d2WlT4jyGeAZy54WltS3cbYWPy06JP/vQDx0Yr8JsgyXxK600MAJEYHKHv1LFfE0QYCR4aix6yJLtmzNAtJ1ktPc/RaYCOoRViZoC+JgVNEItScZSjtXFm3Ceyf8FWxagDPHuen9KPpL6WciECA2Kf2KGPTA91xSGuQA+FHxvXBKzCfymFUomL8I8pZpznICpy8wXIUwefjohHf1EMyv8ODecSgCOIuZFP/ZAD+8X7VD5JXYUWt4BgoeVSdCOKPmwROlQdcsieGoSKbdg+i3vINfdZ4IW0AW2LCnGKLb0mObI8f2wb4KSdEaltEMVrnVSdQbrWx+dhULerNrDfUVbBZdjl9QMQ1zSZbYClyqHYt19SrH5l1ueH6DTnmLmJlZZ6Q3HUcttn+DbfSagj+hV1BzEsw12f3LECiBuy3Xxi4d+hDuR9HINO+GPQqq2/b+t+JuQR1YBE3ehR6NS9bpF30xNRIgTc1jNeRJoQbGSalODH9/8GA3XAF4uESO8V7h/BozQOLRdWTVZJwpNY7Bpg8uxisaHDZD/QnfhpF3+DLZP8LM6D4z7JAuSEnTGKtQNuJGxbv8jJhmleUf/G++mjQh1m4+R67bdE1RNW+7/WxcgrVJQwdPfgxVnAE+hpKuC8aZnFGAzej/OAeS/qX19dyVSDFfXvT3a7N/OAOmU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8676002)(8936002)(4326008)(6506007)(2906002)(5660300002)(26005)(86362001)(36756003)(2616005)(53546011)(6486002)(38100700002)(508600001)(316002)(66476007)(6916009)(31696002)(31686004)(6512007)(7416002)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1huTkNoem9UVmRpelhJeDRBb3Y5L0o3b05vK3puNlJwaTN4a2xlTjR2NndI?=
 =?utf-8?B?L3R2Y25xOE9KcHMwVzVwUlAwRTFSOUVOQ3BKSVEvT3JGQ3FWOFIxUVpRMjVs?=
 =?utf-8?B?NmxiK3B6Z0ZtNm56RURSVDF5d2xDTnJXTkJ1NHExYzFsaEpsLzRETU5UNENK?=
 =?utf-8?B?amtxM0VEbjJhbVFlSE1SbTNGTTIyZk4rZUZpdFRYZHRwMGxLalUvY3dWbXp1?=
 =?utf-8?B?RjFEK3J4SW1IM1YvcFh3TEpNT21aSUZ0NUNaTExUcFpBeXg0Q1dRT3Y4dVRO?=
 =?utf-8?B?eUdVS2xrUnF0RzlOTDRoNHZNTjZISnlxNlorVGIwMnpETnFwTzhDSWw5MFJi?=
 =?utf-8?B?Z2NtdGdpc2RHU1cxTXcvQWZHNkljZUdXUzFUUFR4d3AyZW9BSk5kbGU4dlll?=
 =?utf-8?B?WUNQN1VkdGluZHFxN1VWcEFUK1pTZFk2NWdpMFBQK085OCtoS0NjcWdkem0w?=
 =?utf-8?B?Zm8zMCtXODlwY1BFVGh1SWRiMXZEWkkrRDEzdElpUlJKMmpUcjJreEtQUXgx?=
 =?utf-8?B?SlhzMk51bUl4K1BDazNmVU91YTRkWWlMbjZZKytUN0IxeXJPaHZSbHhldnd2?=
 =?utf-8?B?RDZIQkZIbWtzc2FFQzR1V0h4ZTRjTmlsWFE3NHFPY01yWVNaR2JOTjJLUE9I?=
 =?utf-8?B?eVF1VnorNnNFL1Zqd25LU3hYNVNTK2ZiU2dtUmhIVWpFUk1LQ2N3Yk5Ua1VK?=
 =?utf-8?B?Z3c0bEYyNGRMWXg0V3ZEcmNKWDdzUGFHYVE5TlpYeERPWXI2cTlCcXhuaFVQ?=
 =?utf-8?B?blhRL2pKTHg5RUdLdlc0aVNRbE5oQU15bys0U0o5cWhNd0Qwd0V5QVgzdUV1?=
 =?utf-8?B?Zis2WHZoR1NiN3MxTEdRZUhIMW9NVHpuWjZTMFNKZitPUFUrVlFwVnIxUU5h?=
 =?utf-8?B?cWVsSW52TUdjT2RCUHJHc0NkU2g0OFEyTm9URTFOMXpxbDg1MkpIVUhMZmd4?=
 =?utf-8?B?c0dsYXZBV3lSVlpsckczeEw4QlphRThPYjJQZitBRnVFbDJTZnhTRXArekJH?=
 =?utf-8?B?L1BUZDFKNU5EdHhuTk9xZU5rQy9XZHhKZ3JYQ2diZUFhbVlrMjhFb2JEZU1P?=
 =?utf-8?B?SEZwUEhFeWhBTVUzYTUvaEMvR0dEZnd1SDBPZyt3WjhLMmdaYmJhaVNTRlZS?=
 =?utf-8?B?Q0JCaFNKblZYbWNqZzZyTE5TMTVqNjZpc2JNNTk1UzMxWEE1aXB1OFVZT0Zv?=
 =?utf-8?B?NGY2SlNjUWM1akNuSnlCUHNudUV4bmxGL0d2bitKVHhWaHFJTXVYbm1QY3o5?=
 =?utf-8?B?ZTlPdjcvajIyTS9BTHE3Zm54dUhDNVB0aGhYOFNqb0x5ZGlrWkNGVnFqd1RO?=
 =?utf-8?B?Y1NxM0RQNG1zMzE0Rk5kTXQ3a0xHWnlDemQ2ZUVKRU16MU11K09sUGFwOGdE?=
 =?utf-8?B?Mmc1cmlxTk9wMFRDQmVZeFhLcHhDNGExWW1keFJiK1JQamxlR05pbkJXcWgw?=
 =?utf-8?B?OTZnSHNIUllSRnR0N1FUbGQ0N05SeWdZaFlnTVF1S2pCZXoxN1RHUjRrempO?=
 =?utf-8?B?TWJlTTBoaHBPNktNOTFaMFFTMG9sdlN0c2EwSG42aE82aWdKUW9pRWJwNVJB?=
 =?utf-8?B?QmoyMVJWSHZ3NC96dktRSlp5K3lGZ2MwMFN1WnJlTm5ndmg5R3I0Yy9aazJB?=
 =?utf-8?B?VFNta0t6a0wzR0w5eTduU3RlTS9CSmtsQzJWMUtkQ0YzbGg3WU5iM3pPZFFS?=
 =?utf-8?B?NStwOUVjenlOVVArd25hUHBSSnVBKzBWWlNFM3pKUmNyMG5aV0FzSHJSa3VB?=
 =?utf-8?B?VVJhalhMK3lyWW5nMmRqc0NoeUJPalhZUWJZS0VoTjFiUnRHMklNVXhsYUl2?=
 =?utf-8?B?YW95ZzVKb0hFWk1hOWNSaHRIUkRBaUQxN1ZhcUUxeFRhRE1HdVA4RHBEOTN4?=
 =?utf-8?B?VFgwWEVlWk5yVk84bEdVSUt1ZWdCZW9zaThkR0J2Y1lxbnVMTHQwZ3MxcEN1?=
 =?utf-8?B?OWYvNHNmTitjUTF5TTBBVXVoV1RsY0tVdm5Pc1dTdWZyYzE3Nlo5aGhnUy9S?=
 =?utf-8?B?SmFCenhVWTlva04vWUhXSW04K2I0eTBEdmZUaEllbTlMWjViVnYvbHNrRGVN?=
 =?utf-8?B?eFRZYzJLdVlZTm5RNUZYQ0NveGFBSE1ucWFHcVV3RzdNdUh0a1lhS0s2T1k5?=
 =?utf-8?B?YnZRT1BHZ3EvRG1iWWNhbDVOZTNjeFpXQ0k4T3ljaThqRUlXZlNpOW1ZZGdk?=
 =?utf-8?Q?5bquVW022mpszWDML6yzTzI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141b6f8d-64c3-4d6d-1908-08d9d5e1afc4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 15:39:14.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiY8vGo6yjdprSNFT9LpZUlH7B6oHi204n7wZrFSU/YdHPUtdLrBqn2VukUT/l7iMvgJH3Lfl63ymjdXEOxz9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 25.11.2021 12:02, Oleksandr Andrushchenko wrote:
> @@ -145,6 +148,53 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  }
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +int vpci_add_virtual_device(struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    pci_sbdf_t sbdf = { 0 };
> +    unsigned long new_dev_number;
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
> +    new_dev_number = find_first_zero_bit(&d->vpci_dev_assigned_map,
> +                                         VPCI_MAX_VIRT_DEV);
> +    if ( new_dev_number >= VPCI_MAX_VIRT_DEV )
> +        return -ENOSPC;
> +
> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
> +
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
> +REGISTER_VPCI_INIT(vpci_add_virtual_device, VPCI_PRIORITY_MIDDLE);

Is this function guaranteed to always be invoked ahead of ...

> +static void vpci_remove_virtual_device(struct domain *d,
> +                                       const struct pci_dev *pdev)
> +{
> +    __clear_bit(pdev->vpci->guest_sbdf.dev, &d->vpci_dev_assigned_map);
> +    pdev->vpci->guest_sbdf.sbdf = ~0;
> +}

... this one, even when considering error paths? Otherwise you may
wrongly clear bit 31 here afaict.

Jan


