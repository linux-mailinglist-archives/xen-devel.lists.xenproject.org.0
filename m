Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CAF4560DD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 17:45:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227511.393498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnkX7-00059Q-Ee; Thu, 18 Nov 2021 16:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227511.393498; Thu, 18 Nov 2021 16:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnkX7-000577-Ag; Thu, 18 Nov 2021 16:45:09 +0000
Received: by outflank-mailman (input) for mailman id 227511;
 Thu, 18 Nov 2021 16:45:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnkX6-000571-0h
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 16:45:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e237a675-488e-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 17:45:06 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-kP1dXfuANeS3pthcULgOlA-1;
 Thu, 18 Nov 2021 17:45:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 16:45:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 16:45:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Thu, 18 Nov 2021 16:45:01 +0000
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
X-Inumbo-ID: e237a675-488e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637253905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uix2DAhqKeZn61GAOWGgesnFsdoXTIb+1GgSD0sfalE=;
	b=JyqUvGzRzI0dN/yBDKj1iQEoZI5NDaPGJZh0im1EwTrAw4fHK0b+Zc423WBp0AF9+8aiP1
	wmI7BUOklx7jRl7eRELc/xMAScQIvnePZQYgtx8hDkocwibYlFS24LtEstCtGdRwtvJ/L6
	i8NOA8UXxAZDLX1XM4zo2B6IFEFj8Oc=
X-MC-Unique: kP1dXfuANeS3pthcULgOlA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4NJVE6Qf4bTXWmFzyy7707CQc+gdb9mLkfAbN4YFnsIIjozkC9pJCCCjvNZjotPvfqn9ADl/wu07BkOqeOQOOFNuUsTYrx5W2DXCqZ6d3g5jiL7WT3HBFBw/p6rs6YaN5e5+2zJPjeoKQx+ffvqDk62xmJ58XFIt31lt7Ab83EGx1ZWAGiBhvF9RikNmMHiV4tRHmMs3ZG/WBgqAXpBKszra6TvG2J3F5lkpLwu/SvBSjFzQQPPQXYJfjrL8XcMCwwc9tN9U1PZGKI/KI5LB6jeQHCRGBEksd5oLW2ZZaco78q8jayK8EKUTbpk4/FVlLw3+j4BbUGAcesnH3PxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uix2DAhqKeZn61GAOWGgesnFsdoXTIb+1GgSD0sfalE=;
 b=muIdOToVnt8kUqkv+qDmvPO4nc0ecmsOVD/W8vEb6W+lthrHh4XFVnlCzg7qthS0e3YssPxd9TtCRl3rruWaKwzTJwG4R4ob5dAVXRLnj/W2ZMxrMATiqbtTDad4UGetWSgWpHDDgSEgcHzhLwtQW8uG2N/run/A4awiIvtaa35XziLAMz51265/ezYztykEhUbOss99ue457Uamn/B4DShSb4EOPKzvN+4PpEnHqZnIEZ6YMkpFoQevwjpDWaHg8I10G6YtUDIuCSXjQ2i952Lv+gMrAONaGja3sAn/BPuddIVbqeLj1yZg1Wsq2C4E3Yx1rS0OA9rClW+vdFVFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <217a5684-34af-e08c-2d70-563857ec5595@suse.com>
Date: Thu, 18 Nov 2021 17:45:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 10/11] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-11-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105065629.940943-11-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e23340d4-d974-4ba9-5a72-08d9aab2c46a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB418939B2AADFA10721D8256CB39B9@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F1OwBYdV417CZDwoUJML830ACnG/boTl4fCNxN6C+ADhbixuhkG6vYEwVOQ8F6KSBRy4aZuh1knoDJzi9ntOu/A4MDK2dfhaudOAR0eYdr7g8kLx++6wk5As5z/D7zGMhQhXkh8xRFzbKMfoYP2yiMrI44ket3L3ICNL7FatNNH1LacaPa9PlW68xjKvlhftgYEaw1WLW06Z0QAs6Un5maudY7gqfA9gDLbQ127Cm2TcO5/B7Nqc3LKJKGjtlhniyq8WjT3ms+qDmTNzCo8RbCtkmAzAptdY7PnJSP5R1yubzG1pzCSem4PFc06b9Pkv8cs82qDWebxCcPH3h7mhsFS62qCQCMEuOfkOR2h9zxV4+xQuVK7qsTBecpOXCsdCTgVqx85jHEHorFoTWgq5YUCXek5IhRbThPA7D7/FXn6e4CaDO81hc+5VZsfuYIi8tQIE+CmsOFNnRv+XO7BrsTw196zE+j+u/PotxmTs1/U1j3usKH+wxJOVf+l/VabZMITcLH8oatkPb876s6NkGDwq/S88Sna62Fy4PH4G2IS+Ipj8OTqJ2OLV1bdW0rTLWhkGur5qW+VaYVBS1/IJrliHhEfqb3mZ2vZQU4ikK5PskNSsPv8xniwMRxnY+GnLjPQOQVFhDwy3Y7k1zQxID9De5gBj4flYNz3jFu7YKu4FVe0PZHE1fXSW3HAwvnQE7lljF8YpVAVsUZMgbrkMqckxzUHwBWrTFNMfDoFsO1Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(26005)(186003)(508600001)(31696002)(66556008)(6486002)(86362001)(31686004)(66946007)(66476007)(5660300002)(38100700002)(956004)(2616005)(36756003)(6916009)(4326008)(53546011)(2906002)(16576012)(8936002)(316002)(7416002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWFBS05ObnhWcDRtWGk3SVFTQ1hkZ0ZqdVhCTFpwM2l4QndQSENXVWxqeGkr?=
 =?utf-8?B?cmxOczVEWW9QZ0pORk5DYmZrcnkwS29qN1JGbWdPYUtHdFJwVzNBaGRzTHRU?=
 =?utf-8?B?RTlPVlhNVUVXQkxQeWFxbVdDeGFTQWpYTDNLNlBUbmRQdFlFY09UL0NPbUV6?=
 =?utf-8?B?MTlGRmE1bWxLT1FiOGtSTFBFamRORm1qRTVlZjdma1lLYlFoaml4RVpRVWRI?=
 =?utf-8?B?Mk52UXZkUVc2RFdSOXdWUEQ3dnBlcWM1MVAydCtlMzlHZlc1K0ZJaXhuYnBx?=
 =?utf-8?B?dU1RbDBKb0MvODNjc0FQWkRiWCtmNjZZYjdoUjNrM3FyL0gxNDRYQlhJZ2hN?=
 =?utf-8?B?L2s3UmZ2NngrVVRtOFVGSkJiRHppMzBKOE9wRGRkMStzN2VKMkpMWVhsS1pv?=
 =?utf-8?B?T3BZRHgxSUxsR3lvNEx3SDIwL25JSUNMdVIrOWZyb1NTS0x2NGl6b3lsdUxa?=
 =?utf-8?B?WERiZUkrclJRS1ZmMTBDRmxPSkFJRUJSYXhyQlpFK3k0bHdhclBqalVYNUhB?=
 =?utf-8?B?c0NTU0pOTmc3OWowRCtsVEF2L1o4Y2QyaElzRis3Kzkva1pFSk1ldURSVlN4?=
 =?utf-8?B?TWU4NVltbkNkaGZobjBPNUhrTG82ZzhGa3BJQktBNW9wN1BVeG5EZTZ4Umxp?=
 =?utf-8?B?dzNlUVhWRDJTMEtlVkIxaHNkVkZMbkovbWx5cXRhaWVlcmVCWncrTFh1UUt0?=
 =?utf-8?B?VGlYSkx5NFA2U0c0S3V5MWVKaGVGa21uT3ZYT1E4aWxsN21nbnlQWlFzeSsv?=
 =?utf-8?B?UTgyc0drRi9sb2R1R1FkZFhjQStvVE5hcEc0MnRWdzk4UmgyM0p2ZXVMbjBT?=
 =?utf-8?B?YWZ3dXRNcUE2NlJqNmNER3U5QXNuTStqK1NRRWJrV0xlK01zMWhMbWdXRkJV?=
 =?utf-8?B?TVJnRm5PU1BBMTllN2lWWk5xcEhrcXBiejZZbUVRc042dzNDM2dOOGZyNWJy?=
 =?utf-8?B?dURpSk5obXgxTnRNRFJRai9jbHh6M0xWTjBkaDV2VTlXa3hISXhuV29vUWVv?=
 =?utf-8?B?YnhTUzAxdzYzdlZZWU5xb3dqTmliOUZXbkUvUWUxZE9TTU91QmE2Sk1ZQzJR?=
 =?utf-8?B?dFBCcjQ5QkFHMmFCUCtkUXE0Qy95OTU0VnZQS1Z3UTAwTDUvZVZaNHdSM253?=
 =?utf-8?B?OTE3aHNmSFZoMC9DbFo2NHR4c01hcURaN3p2VG5DUkN5d00vTWwwdWlkeXdx?=
 =?utf-8?B?MC9Ud1kwVWxSOWdMNG1LSFRnc0hHcm4wd2pteWhaTWNwRmZOM0FPSGd5L0sy?=
 =?utf-8?B?MWFKczVrOHdlSm12eXUxcVYxaGd5cDF0dDhWVFJGZng5dk00YUloN0hkd1Qv?=
 =?utf-8?B?OG1PV2o4bUE4a0NJOFROWVR3NjYxS1ZxQlEwcHY5eUtkRUdWcjBSeWhqRlF4?=
 =?utf-8?B?b2xORFl5c21SZUs3bzQ1T2R5UjlYYmExbERvTGkvaHJXOHdIaXNON1BxWUxV?=
 =?utf-8?B?WXk3ZU94ZlRRTFFvbC9nL3R4SDNmSEwxbUJ6TGdKNUdQMTJnL2lYaDZBV05E?=
 =?utf-8?B?ZGt5aVV4Y09ZSlpwWW5lb3B5NWJGOG81OWg0VWJzQ3BmTGJTcndKMm93YUZ5?=
 =?utf-8?B?K2dkdnpDeG05UWRVVUNLOWJSbmNNczR5Z0k5ZGFraTZ3RGZEUFRBMUVrSHBx?=
 =?utf-8?B?UitvNEx2Qm9qNGNBOHY4VFBkYmtoM0QyazJMSGNwaHFGdVJPczlscnp1NFF5?=
 =?utf-8?B?RFloaENiYWNGeTdPVmFkN0g1cWFiY3BoOE9xYkZzalJTTy96OStucW45eEQr?=
 =?utf-8?B?KzJlUnd3ZGJBYWJTZjNjbTRpaDJXSEZQbHRJTVpmYVhnaHVtMWNMamE2aEhZ?=
 =?utf-8?B?SnBIU3JCNjV4aVBOaWc2TGZkV1llVGsrT3Uzb2lBZm81R2ZMZ0EwcmpIWDc3?=
 =?utf-8?B?TWVhcXorNzIzR21XUVdtK25MQU9pcEptZy9JS1BpUldyVzN0aithYmhzbFo5?=
 =?utf-8?B?Y0FZeGp5M29FYmRqaWV2WlVKQkxzYkwrOTV4UXdEL0VFL2NJbGpaNXdHK1Zw?=
 =?utf-8?B?dDZyZUh6VUJZajlTS3paRFI1U2pJcG9FZ0lGWHVDSXQ3YVNRekZWcjZ3T1Z1?=
 =?utf-8?B?ZEhtd3k3OUhSSkxzcmRqK2xuanFWRXo0NWFYYXhmWURKSThIV0IrWnNqTWk5?=
 =?utf-8?B?VVZGZVhHMGIyMUpNbEdWaVpTbWp1YTg2dGFIQmwwNFN1c2t3YWZVRHZndjlI?=
 =?utf-8?Q?C/dlRnNlGrUc5GmgsGn4iyE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e23340d4-d974-4ba9-5a72-08d9aab2c46a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 16:45:02.7429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vi4hTKcpPzlvTBCbdA80XdVFdmzboHzrfb9kukw8wdMAOD3MQoCrv61NKHDUFOOxOyqn7wv4vGEn41Ag8d5Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> Since v3:
>  - make use of VPCI_INIT
>  - moved all new code to vpci.c which belongs to it
>  - changed open-coded 31 to PCI_SLOT(~0)
>  - revisited locking: add dedicated vdev list's lock

What is this about? I can't spot any locking in the patch. In particular ...

> @@ -125,6 +128,54 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  }
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +int vpci_add_virtual_device(struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    pci_sbdf_t sbdf;
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
> +                                         PCI_SLOT(~0) + 1);
> +    if ( new_dev_number > PCI_SLOT(~0) )
> +        return -ENOSPC;
> +
> +    set_bit(new_dev_number, &d->vpci_dev_assigned_map);

... I wonder whether this isn't racy without any locking around it,
and without looping over test_and_set_bit(). Whereas with locking I
think you could just use __set_bit().

> +    /*
> +     * Both segment and bus number are 0:
> +     *  - we emulate a single host bridge for the guest, e.g. segment 0
> +     *  - with bus 0 the virtual devices are seen as embedded
> +     *    endpoints behind the root complex
> +     *
> +     * TODO: add support for multi-function devices.
> +     */
> +    sbdf.sbdf = 0;

I think this would be better expressed as an initializer, making it
clear to the reader that the whole object gets initialized with out
them needing to go check the type (and find that .sbdf covers the
entire object).

> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -145,6 +145,10 @@ struct vpci {
>              struct vpci_arch_msix_entry arch;
>          } entries[];
>      } *msix;
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /* Virtual SBDF of the device. */
> +    pci_sbdf_t guest_sbdf;

Would vsbdf perhaps be better in line with things like vpci or vcpu
(as well as with the comment here)?

Jan


