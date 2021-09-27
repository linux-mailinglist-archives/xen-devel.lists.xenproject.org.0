Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137A419321
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 13:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196743.349682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUorW-00022W-6L; Mon, 27 Sep 2021 11:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196743.349682; Mon, 27 Sep 2021 11:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUorW-00020g-2y; Mon, 27 Sep 2021 11:31:58 +0000
Received: by outflank-mailman (input) for mailman id 196743;
 Mon, 27 Sep 2021 11:31:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUorU-00020a-6b
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 11:31:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83b19402-1f86-11ec-bc44-12813bfff9fa;
 Mon, 27 Sep 2021 11:31:54 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-XSyh8YLoNpaq3TPIZcpjHQ-1; Mon, 27 Sep 2021 13:31:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 11:31:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 11:31:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.9 via Frontend Transport; Mon, 27 Sep 2021 11:31:47 +0000
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
X-Inumbo-ID: 83b19402-1f86-11ec-bc44-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632742313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o2GYJL857UsI0GbUPLDhmje2RvcSOCoELDigK3SKglo=;
	b=Kuoo7rfE5f6vAljUG6cklNnWXfahA1sgc/53tSF/Zewf9bSATxLQMhVFiqdz7J/+/7z/jz
	IeuvvJ/GzyOplZZxss4XKtsdkOMQdfIhiQ8eHqVxGYE1t333hXDpvh4xP6eQK8S7wO2lGl
	lwSQwdwB8kM5rUK2luVUXpmrVXV4XCs=
X-MC-Unique: XSyh8YLoNpaq3TPIZcpjHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2EbRzUaR2mhZ427BYm6uNqepfjHgdTfNzXFoMr7oWl/KZS+iG785gG6SlKDEFdwCyZOft6YDSzmpi5y+2XSbri0gFwzs7Ednmcr8Ze/36tbV34DySviadMi/HzfPnN86b09qFRs+dT3a6LP2+1Opm4SW++NxqawMBrySGC8dtr2w+B3QpEY52hMHxIbsjx0G55V30OspL3DNig1ltXA/I0HMOfFSW3LbPr6LJDLfJBDSnvwl9BQaljRCrNtCMtJ0R2nWv7tAnMs21fVatwIV+gAraRZQGVI6UGxMrLVSurndotpouqlVvjhJrKAoWwWuu/DiPt7dUKIh5M0KqnSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=o2GYJL857UsI0GbUPLDhmje2RvcSOCoELDigK3SKglo=;
 b=M920bz1+ojJpegEUxlCXpsaD3yN/ndqujsgd2Doo1m4AEzvHstvzcE43tySDNJpYHJh2YglBBVpUapYf9SYA1Us4tYWN3/5L4aYw7t8uxo4eucRx4xwJ/Bhm/HcoaFq/qTh25rCVGTK9KjFhFcxgNJ9ZWBwFwDirCZlycAg0i6ZPm1KG+xPuuUW3Y94nFMa52GathgvGVt8IfmtPbcoZnIXDWdP40qLizq170NrUTYtQAc591YBnlJzqwrs0XWEFLwlLmku7uOqFpCVYMBK9p5ACYQD/3yboQVAzM/5iScgx8aZLM6kfLqIKUL4FI0OqUOhK7PqOc4IOGqf5DMdnzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-12-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df675ecd-3774-4b5e-241b-0a68e36c99f9@suse.com>
Date: Mon, 27 Sep 2021 13:31:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923125501.234252-12-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf03436a-900e-4834-e436-08d981aa64b9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190E900BC781B63ADEB2C7CB3A79@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HwWfiTISFF5tSEM3ihqBoANfVmYOr3X4stLkdj7Ww7C6DWy7tUfUQB0oPSecWK+4Ahdk1Qb+0H/WP+AfhqP0hjR2T8i/W/2JOP2zltQ6uS5JmmObBwIy3HFzUJYAldgbk6dSMIBfqDHYg29K2esAltBqt5iYbgp3wycpYC5z3ng0sEHMQwGl9jPBKRKQamuKf8VFcxJPzeZuabTwb3sqeGC4ql/IjLA4z70EhHFVG/y2k+7jNsvjLMtc7q1CnGr7MNN6g7fMfJeI/mLSJTwG6U7UAUCA19cdVpBxWtsua94PnG0YcSBsTl4EJ60ObFIp1NDX4pdNVLsW7832TDWS4PbAo9TEV3RFjBZycWgxEXbvWOzPZLoBwJoatsOQK6ci9f6RvJA8P5aQjsrfGw/ucaEks/XltyLK/nQCP4VmvuMK8juYl+LTNvKsudEnFN5dc/472kMe9NbCEgHv4JHAsa/Xc9kt6JNKQsavgKlxmSduMhuddVwtWWPsbey+JNYuLH2QXpqTrgDzGF5tRL5KkSPTzaUNIX2Fom50J/4uWamya/fvuwKOF4GKwZzKlZSmj/YcpaaLo5ZIT3EOru5uy7oC9SmDfByO3xnjT1NiS4Jtvi8FyxvqQK05/oTvfg/R3/FFNglJiXPy/Mqnbq7yq+LvMkJg8IXkFQRLKxAnhgHOwgu00YUxn0NTNGRx3/IOD1i7JbLfKqJRwnNTuDjdVUBQEg1JrVXU3kgIlfmlClk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(956004)(31686004)(36756003)(316002)(16576012)(31696002)(53546011)(6486002)(83380400001)(6916009)(7416002)(2906002)(26005)(38100700002)(66476007)(4326008)(66946007)(8676002)(186003)(8936002)(508600001)(66556008)(2616005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFNEbSsxSnZCc1NrNmtxYVdzSGdLTEs4OWxhRWN0OTVRcktrakpDVXhzZlBO?=
 =?utf-8?B?U0pJbzBUSytZOHErQ1VOL2l3R3pDZHJxd1JLSWJNM3NVU291WlVwQXJsSzht?=
 =?utf-8?B?S1BFMkR3SkZ5MW1jbVZ1SlJpM0VGUnEzSzNiZkhXSUlYRVBFaDBjQjhianJn?=
 =?utf-8?B?bHFWRk9mU0k4QzlDQ29zQldwYTljWkd6SG1oWnRwb21BVmc4dk5Ta0dJVm9r?=
 =?utf-8?B?L2lHU1d2bitpWUhDRUhVcGJuVkllRzk1K1hvRFVuaGhoTDNIcHBtbGRHSmI1?=
 =?utf-8?B?SlVYSFJ5aVk0WG83c0xsbFlTMGlETDQyTXZwdEhqNzVxWFRUcWcxZTVrN2Y3?=
 =?utf-8?B?L0JiZXBZaFJYdE1zT3ZsMUNSSFAwRi9RaGdPUC84Wno1NDhUTkJHaGMxTGVy?=
 =?utf-8?B?MGJpSWFNdUV5VmNtM0xFY2FrS2RaRFBaYU1TMzYvMFRKVjVRSEVsY1dJR21F?=
 =?utf-8?B?M0dlOVN3ZHdpRVJLM1ljeU91ZlpoODhGb0RFRjI1V3Z4VFZ6dUl6d09waXF2?=
 =?utf-8?B?NDlSaloxcEZkVWJPWGJOYTc4Y0o0eGZRK1BJUXBEVmxhb0lkekVUcUlvZXlt?=
 =?utf-8?B?a29Va2QyL08rRWEwS1lMRDdRclY4UUtHMEFSeXg1ZTdvazlLTmxqOExqZUVD?=
 =?utf-8?B?MnFQdlkxdWRhRlI3Qy9PeFRENzh4ZnRkT2RQRFhvNmoxS3h4WHpwdUVHRVkw?=
 =?utf-8?B?UCtKVW9pTUlZdndVM1NmMm1sSXo5dFFqNTd1V1JPd2VaeFh0T3pPeWhQT0hs?=
 =?utf-8?B?VS95T2F6ZWYrdU13M0lPeHhMNDIyOXVrYkRHMWc2Y0NrR3FDMng5aExtUVk2?=
 =?utf-8?B?V0R5bzNMWmFKblVGb2NHeEJDVDZqaU9WZTByejA5SGVkK0p6ZU1zV2hRc0lD?=
 =?utf-8?B?ZXR4UmRmUjUrVjhBMU9TcWtMSTJWSmZwZnQ2NnJ3Umhydi85Y1hPeDZ4d1lI?=
 =?utf-8?B?Q2RMQVBibTh0QUp0OThhS3NXTUtnTnZxRmJCbkR2SkVxWWxmTXNRQmFtWjZ2?=
 =?utf-8?B?UkNGeCsrY1hJTXg5RzNnc2ZoVVBEelBlbXNXdHkzOEtQeHpDbUJjcm9TZ3RX?=
 =?utf-8?B?c3cwY09qS1BiT2pQZCtYM3pCSktRVVlzdjAzdDhHVVlMNXMwR0VlTmhON3No?=
 =?utf-8?B?aUppUStRNUNFL2thckZzZGpXSml5d1JRck84d0RJTWpuMlZZLzBZZnlHKzZF?=
 =?utf-8?B?VE43WWREWDV6VzlEdVE0S1ArUThKVzA5WXN6K2c3SGJJUEZFMy8relljbXFh?=
 =?utf-8?B?SjF1NnJ4enNvMk0veC84R2JXOEdyaEJsMWp4cTZmZ1RJM0ZSZDVGOTFnUWEz?=
 =?utf-8?B?REh3UDJQdktrRC9IVlZMVkNZcFphQmhzZkh5NkZOWTMyWUp0a1FVcE9HNGJR?=
 =?utf-8?B?eXhkK1VnVi9uNmUyZjZGVnh6bGtDa2QxY1oxNktDbHVKZW9GeHRMMVVNd1Jm?=
 =?utf-8?B?R01uL3Exd3dkelh2ZVVWM3RrL0hyZEZXT3FIdFBJSmx3U0VPcURGeWRiTG5w?=
 =?utf-8?B?YjEyVmtJa2lUUlVWM0p6S1FvN0FnQWE4MEY5UGprTDRjUGUwVjYyWXk1KzNo?=
 =?utf-8?B?enZZNUoyNjNVK08xUnhZbGorRjJCdTRicVN3ODUrNEJWaTREYXVpSjFyd0xI?=
 =?utf-8?B?U2pkMnp4MUNtZGdheTBqRDY4TUhmb1NUWUF3d3ZpWE5laWFNUjc2cHBvQndl?=
 =?utf-8?B?WVYrM25MT2dTT01vVU5WTUtrb3NyVy90bS9vZUZXcGlRaEViNHhZdlIvUVE2?=
 =?utf-8?Q?nTKF/X6DGIXFldvvyTfL94NoLTGKCHJR5Wnm+8Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf03436a-900e-4834-e436-08d981aa64b9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 11:31:48.5292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBDLwxVGeOYncOFF4VtliTHIqwgqVWsQsc3yxAz4t0zhqwY4TfE2w1L67VuVzCQyx/x+xzATNmVfAxxMgUDzwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 23.09.2021 14:55, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are three  originators for the PCI configuration space access:
> 1. The domain that owns physical host bridge: MMIO handlers are
> there so we can update vPCI register handlers with the values
> written by the hardware domain, e.g. physical view of the registers
> vs guest's view on the configuration space.
> 2. Guest access to the passed through PCI devices: we need to properly
> map virtual bus topology to the physical one, e.g. pass the configuration
> space access to the corresponding physical devices.
> 3. Emulated host PCI bridge access. It doesn't exist in the physical
> topology, e.g. it can't be mapped to some physical host bridge.
> So, all access to the host bridge itself needs to be trapped and
> emulated.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> New in v2
> ---
>  xen/arch/arm/domain.c         |  1 +
>  xen/arch/arm/vpci.c           | 87 +++++++++++++++++++++++++++++++----
>  xen/arch/arm/vpci.h           |  3 ++
>  xen/drivers/passthrough/pci.c | 25 ++++++++++
>  xen/include/asm-arm/pci.h     |  1 +
>  xen/include/xen/pci.h         |  1 +
>  xen/include/xen/sched.h       |  2 +
>  7 files changed, 111 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index c7b25bc70439..c0ad6ad682d2 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -797,6 +797,7 @@ void arch_domain_destroy(struct domain *d)
>                         get_order_from_bytes(d->arch.efi_acpi_len));
>  #endif
>      domain_io_free(d);
> +    domain_vpci_free(d);
>  }
>  
>  void arch_domain_shutdown(struct domain *d)
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 14947e975d69..012f958960d1 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -17,6 +17,14 @@
>  
>  #define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>  
> +struct vpci_mmio_priv {
> +    /*
> +     * Set to true if the MMIO handlers were set up for the emulated
> +     * ECAM host PCI bridge.
> +     */
> +    bool is_virt_ecam;
> +};
> +
>  /* Do some sanity checks. */
>  static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
>  {
> @@ -38,6 +46,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      pci_sbdf_t sbdf;
>      unsigned long data = ~0UL;
>      unsigned int size = 1U << info->dabt.size;
> +    struct vpci_mmio_priv *priv = (struct vpci_mmio_priv *)p;
>  
>      sbdf.sbdf = MMCFG_BDF(info->gpa);
>      reg = REGISTER_OFFSET(info->gpa);
> @@ -45,6 +54,13 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      if ( !vpci_mmio_access_allowed(reg, size) )
>          return 0;
>  
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( priv->is_virt_ecam && !pci_translate_virtual_device(v, &sbdf) )
> +            return 1;
> +
>      data = vpci_read(sbdf, reg, min(4u, size));
>      if ( size == 8 )
>          data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> @@ -61,6 +77,7 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>      pci_sbdf_t sbdf;
>      unsigned long data = r;
>      unsigned int size = 1U << info->dabt.size;
> +    struct vpci_mmio_priv *priv = (struct vpci_mmio_priv *)p;
>  
>      sbdf.sbdf = MMCFG_BDF(info->gpa);
>      reg = REGISTER_OFFSET(info->gpa);
> @@ -68,6 +85,13 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>      if ( !vpci_mmio_access_allowed(reg, size) )
>          return 0;
>  
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( priv->is_virt_ecam && !pci_translate_virtual_device(v, &sbdf) )
> +            return 1;
> +
>      vpci_write(sbdf, reg, min(4u, size), data);
>      if ( size == 8 )
>          vpci_write(sbdf, reg + 4, 4, data >> 32);
> @@ -80,13 +104,48 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
>      .write = vpci_mmio_write,
>  };
>  
> +/*
> + * There are three  originators for the PCI configuration space access:
> + * 1. The domain that owns physical host bridge: MMIO handlers are
> + *    there so we can update vPCI register handlers with the values
> + *    written by the hardware domain, e.g. physical view of the registers/
> + *    configuration space.
> + * 2. Guest access to the passed through PCI devices: we need to properly
> + *    map virtual bus topology to the physical one, e.g. pass the configuration
> + *    space access to the corresponding physical devices.
> + * 3. Emulated host PCI bridge access. It doesn't exist in the physical
> + *    topology, e.g. it can't be mapped to some physical host bridge.
> + *    So, all access to the host bridge itself needs to be trapped and
> + *    emulated.
> + */
>  static int vpci_setup_mmio_handler(struct domain *d,
>                                     struct pci_host_bridge *bridge)
>  {
> -    struct pci_config_window *cfg = bridge->cfg;
> +    struct vpci_mmio_priv *priv;
> +
> +    priv = xzalloc(struct vpci_mmio_priv);
> +    if ( !priv )
> +        return -ENOMEM;
> +
> +    priv->is_virt_ecam = !is_hardware_domain(d);
>  
> -    register_mmio_handler(d, &vpci_mmio_handler,
> -                          cfg->phys_addr, cfg->size, NULL);
> +    if ( is_hardware_domain(d) )
> +    {
> +        struct pci_config_window *cfg = bridge->cfg;
> +
> +        bridge->mmio_priv = priv;
> +        register_mmio_handler(d, &vpci_mmio_handler,
> +                              cfg->phys_addr, cfg->size,
> +                              priv);
> +    }
> +    else
> +    {
> +        d->vpci_mmio_priv = priv;
> +        /* Guest domains use what is programmed in their device tree. */
> +        register_mmio_handler(d, &vpci_mmio_handler,
> +                              GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE,
> +                              priv);
> +    }
>      return 0;
>  }
>  
> @@ -95,13 +154,16 @@ int domain_vpci_init(struct domain *d)
>      if ( !has_vpci(d) )
>          return 0;
>  
> -    if ( is_hardware_domain(d) )
> -        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
> -
> -    /* Guest domains use what is programmed in their device tree. */
> -    register_mmio_handler(d, &vpci_mmio_handler,
> -                          GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
> +    return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
> +}
>  
> +static int domain_vpci_free_cb(struct domain *d,
> +                               struct pci_host_bridge *bridge)
> +{
> +    if ( is_hardware_domain(d) )
> +        XFREE(bridge->mmio_priv);
> +    else
> +        XFREE(d->vpci_mmio_priv);
>      return 0;
>  }
>  
> @@ -124,6 +186,13 @@ int domain_vpci_get_num_mmio_handlers(struct domain *d)
>      return count;
>  }
>  
> +void domain_vpci_free(struct domain *d)
> +{
> +    if ( !has_vpci(d) )
> +        return;
> +
> +    pci_host_iterate_bridges(d, domain_vpci_free_cb);
> +}
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
> index 27a2b069abd2..38e5a28c0d95 100644
> --- a/xen/arch/arm/vpci.h
> +++ b/xen/arch/arm/vpci.h
> @@ -18,6 +18,7 @@
>  #ifdef CONFIG_HAS_VPCI
>  int domain_vpci_init(struct domain *d);
>  int domain_vpci_get_num_mmio_handlers(struct domain *d);
> +void domain_vpci_free(struct domain *d);
>  #else
>  static inline int domain_vpci_init(struct domain *d)
>  {
> @@ -28,6 +29,8 @@ static inline int domain_vpci_get_num_mmio_handlers(struct domain *d)
>  {
>      return 0;
>  }
> +
> +static inline void domain_vpci_free(struct domain *d) { }
>  #endif
>  
>  #endif /* __ARCH_ARM_VPCI_H__ */
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 4552ace855e0..579c6947cc35 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -890,6 +890,31 @@ int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +bool pci_translate_virtual_device(struct vcpu *v, pci_sbdf_t *sbdf)

Why struct vcpu, when you only need ...

> +{
> +    struct domain *d = v->domain;

... this? It's also not really logical for this function to take a
struct vcpu, as the translation should be uniform within a domain.

Also - const please (as said elsewhere before, ideally wherever possible
and sensible).

> +    struct vpci_dev *vdev;
> +    bool found = false;
> +
> +    pcidevs_lock();
> +    list_for_each_entry ( vdev, &d->vdev_list, list )
> +    {
> +        if ( vdev->sbdf.sbdf == sbdf->sbdf )
> +        {
> +            /* Replace virtual SBDF with the physical one. */
> +            *sbdf = vdev->pdev->sbdf;
> +            found = true;
> +            break;
> +        }
> +    }

For a DomU with just one or at most a couple of devices, such a brute
force lookup may be fine. What about Dom0 though? The physical topology
gets split at the segment level, so maybe this would by a reasonable
granularity here as well?

> +    pcidevs_unlock();
> +    return found;

Nit: Blank line please ahead of the main "return" of a function.

> +}
> +
>  /* Caller should hold the pcidevs_lock */
>  static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>                             uint8_t devfn)

Seeing this function in context (which patch 2 adds without any #ifdef
around it afaics), will this new function needlessly be built on x86 as
well? (I didn't look at other intermediate patches yet, so please
forgive if I've missed the addition of an #ifdef.)

Jan


