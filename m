Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B579C450A52
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 17:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225988.390387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmfHQ-0002VZ-R2; Mon, 15 Nov 2021 16:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225988.390387; Mon, 15 Nov 2021 16:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmfHQ-0002Tn-Nx; Mon, 15 Nov 2021 16:56:28 +0000
Received: by outflank-mailman (input) for mailman id 225988;
 Mon, 15 Nov 2021 16:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmfHO-0002Th-T0
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 16:56:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f671e846-4634-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 17:56:23 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-DSolPX4uNZChdH81hc92sg-1; Mon, 15 Nov 2021 17:56:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6672.eurprd04.prod.outlook.com (2603:10a6:803:127::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 16:56:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 16:56:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.18 via Frontend Transport; Mon, 15 Nov 2021 16:56:15 +0000
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
X-Inumbo-ID: f671e846-4634-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636995382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l0crSbdCxIsQ1vEscNNeY5we1MkrS+AqRP/lqWHF+Sg=;
	b=nDKKHb/US+jf9Id21ja7QTqOz4wawCgb6TACGIt9LDCYxOdZYI8cv3Un7ecDO4PYPLT7Bt
	mc+el/ScMugIT9geNyR3VfjBbKq/KdJSIezVTfWPuYNTpvNn1wJ1Os11kaLv+dUFMZZiJv
	5XgcO1AUZzaBJ6IBqDMuNXOCYV2UuRI=
X-MC-Unique: DSolPX4uNZChdH81hc92sg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0e5/GjbjI/UtrEg+yN+PgUilaDE2Au3EkMpImA2+N+YRnU+yDN3ccgIePLpcxR6aHsu1Du+9/P31I8Y8iXQIPFoP/sFgQULJZvk+klOtOO656cjVv3Nba5eGRRnzX/Ol/xCrI70/2uK1O5khND8VDsUNz3kviL2Nvi+TgxHf5lZXGbJP4hPaU5QsLkrLqJFgQ5aK4U/jK0fq1JeNmj3ZkLVfv3Ug1NT+oXdX/hcJ1WxF2cl0N7+0TFX9RAj9VHwwo76mtwl3TF6q1XQOq1BWvrY/5DkJq0p+CkHSYrO7zTZ9h25e4W3xjMYWC2D5T13Db3ZNHDq9sV3wSaMy+Rk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0crSbdCxIsQ1vEscNNeY5we1MkrS+AqRP/lqWHF+Sg=;
 b=nHWmv+AfatY4fpqmC8ccXmWow+AnaN/Sj5X3TIJzVdr1E5cnERGTfq1iK/tf3EfGWC5SD6M1D6GuMeK91LTRXIh4rLxMAib7RunRD3uoCieVSUBe5YDowG9KNEPgo4uNOtjvW/LwPaZJwYU6yZdZQUba7nZm22PMhnrt8tHAOVOfqpAvPLg6Xsg0LbZVLaBECtFJJZ91nRHxU79BJieUfXAJC3BFLHBhibJf0RB33k9yEOKlmiib9xbRDOppF3zgauxIx6jHnAM8uCl34oG+wuzMGPxlPzkxHEzEUKMEIYabuB13TdEhSXq9pWXCJdl6JdDe4AQgdQY5Bdy7zZmfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
Date: Mon, 15 Nov 2021 17:56:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105065629.940943-3-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b879d99c-c8fd-40d0-fd29-08d9a858d6e5
X-MS-TrafficTypeDiagnostic: VE1PR04MB6672:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66726D11B66BF05670B79E6EB3989@VE1PR04MB6672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OmIe2T538DWfbH+ODjR97CNP9qB79gYbcmVtvjiXLeGXTRJ6Wc9+JX3HWg/sYwDctC1gmbwgWnko0Gmphg2l6Ai8VoQsLbLzfxP/cT9Ru7DbFO88Kg/Tj9ow30glLgEANkoUUhtqh0GRS9l+1GjdAZaIG0j5dAVCN4dVhoepaCVkTF0qqs7GfSL3+D/fFjFRhqLSw30G39ptrjhrAzPWsNHDkZabZy3iQbKtVvhwTtgeO7NoCwgMhOmhcJohDHXzV1Tt4vK/HPvksvIjMwr5TCM6ZQWOqFhvgk5UqsXx2Q49vxzCurpt0xwYgi2GsOAXS5cey7Q+y7w1GNDYC8vEm9pPTKkth3jPPiYJv4AOtFze8jjBBeAXDh+SEYH0iVuIXY5nK90f9rc2YojyJGtuC9q0n+0+pWIBYeLg8nHS6U2Xq++UL7LUgi7Z1PoaP16jSUdJczfJOgtDzBek4094wehorGnpTHzOlByxKb3BBf+swZHxLev2KBIUvcYMYdEEvGTWac/HeloGz3/D6uXo+3IcoliLbclAviYn48PKSOM2j/tyEBF1L5oBI0YOCSF4xf4AQNuqn8hPidKPu3GbeNwQnzGcLmUlBsjGpuDmDx41QWyUxpPFQI6daIAEQo1qEULOAQtWCeM5gg6WwD9R/rx08eKd9c6Gz3g0GU4EOqqBrgr6TfrdFPadDgYuymk/zYte3q4oPP3gSj23IMPYddJKz9UX8YPS724KH9C8HSA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(26005)(83380400001)(4326008)(6916009)(66946007)(7416002)(36756003)(31686004)(8676002)(31696002)(508600001)(38100700002)(2616005)(316002)(5660300002)(8936002)(956004)(6486002)(16576012)(86362001)(2906002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2xXb2IxQlFFd01peUNNcUorOFh1ZndrL01ERU4rY2FUVXkxbWJhQTlIU1RF?=
 =?utf-8?B?OEV6ZklOSFNnSmhEQUxCSG5ZSFUvQjg0YS8xWlZsQmlhRkdxcDRsT1cxQXV3?=
 =?utf-8?B?ZzB4VlVUZjZtNUpCVzlxRXdCQWlUbkhRYW9xQWJOQXhpOTF1SGtWdmRPTW1m?=
 =?utf-8?B?M0laa0NzSlgvZnZhMGYweGd4SVQ0UTBSMnJDc2h3T2hJWERpQU9oSjlubWZV?=
 =?utf-8?B?WEdMRk1mZ01jUWRvNkpHS05iakxycjdXSytVeHgrMm5ETlhVZENJbEdxSGpx?=
 =?utf-8?B?RVNSV2NiUTZGL0J5MXdXcUwyVzFvUEY2MXV3WEUyTis1MFVSTHpmSVEweWpG?=
 =?utf-8?B?QlFod0dMQU9JOUtoc2RIOC9aY2Qzekgrc1YyRnFLYjRnV0NhWi95WFVTSnZn?=
 =?utf-8?B?clIxbHBIZUtXWnFNWFMwMzBtWEZmVVMrd250Vml6aEhXY1czNUJHaW9ONytz?=
 =?utf-8?B?R2cwUnRoODdmeHNjVHBwcUwwWTdxWVFpbWx1bzRBNTB4MnU3MDB0RkNWNlB1?=
 =?utf-8?B?ei9vWlF6dmlmb3BONVA3TXYzTERZK0IwTXJ6dkx6T1NFSHFBaDQ4RFdET1hB?=
 =?utf-8?B?UkFRdkt6eVVYWmIyeWhQOFlteEhEeGltWUZteVovUkR1ck9jc1hNRlZ6Sy9s?=
 =?utf-8?B?aEFWSW1QUmRwbVA0NjhtQzgxMTFxdWtqU3NEUU1VTkJ2cUJ3NlVxWjNTQTM0?=
 =?utf-8?B?bVl3bXZodXFvd01sVFhXNXZTM0Vtdnl6WlpZTWlzc2dXY1VvcG0vY1lRSUFl?=
 =?utf-8?B?TngvdkdJZ255b3JJWjlaSUVzalpJVURtdkFGZ1ZxcmZLQnZpVnFQOFpnbDc3?=
 =?utf-8?B?MTVnQkJjRG1mZTNIWTdScFFlUXdHSFpKQmpuT2lNSEJQeVhuR3JzT1FCMERw?=
 =?utf-8?B?K1BpZjh4em5uSG5RYWxJRjNjWTJIRkI2bzNnaUhaQU5FSlR6MllUZmtDMHUv?=
 =?utf-8?B?bExsTGdHSnB2dXl2WlBqNTVMR3RQcUttKzZsQ3Vxd1l2Ulpka2VCZjlncmgw?=
 =?utf-8?B?MEtVYUU1YzFZeW9rOHhsOCtBSmU5N2JxQVdNeGxZZ1dRSWdBZ1BRdVBuelQr?=
 =?utf-8?B?TEhpT1dGRlNndDVnZSsrckpKMnp3eHpkak9QRmVBbjY3cUNzTHZzeERBMjdS?=
 =?utf-8?B?YkNjcFVTT29SNUlUTHB1eVNpSXpHWkZiYldaK3lQYnVxUy9xd0phQ2dZUUJ6?=
 =?utf-8?B?SlplZFBNblJISGhELzcvZ2Y1N0ZZbWt3aDRNMzdURWtmVDVFRlMrSUhIeWhV?=
 =?utf-8?B?cDN6VVRjZ0RxditENWovNlJnait2akFLUEJjakY4V0w5a3hXYWxuTnc5YWgv?=
 =?utf-8?B?QTl5T1dzYnBwUS8wbUJrcjJ0NWpyT1BDZ2NnNVNFTGwvUWwzZklFaVV6MHJn?=
 =?utf-8?B?Mnh0d2ZvZzFyREFrNUt1WTJ0VFVqUFBDenhsNTI3ZmlIRjlyVG5tOGd2U3Bp?=
 =?utf-8?B?YVFBUVdJQXo0UVVobTRPLyswVXlrQzcyRnJXWWd5L2t1bGVKRHVJc3Jwdk9l?=
 =?utf-8?B?WVBiWnNVOGxKVVJhaDV3VmxuQitqUE16c293Ty9FWkYxZm5zT3dWbkRGTm5l?=
 =?utf-8?B?cllEOFFEbkFDeFE0YmgveldqYkc4NWpMOWlZWUMxcStrZmJ1MGVrTXMvTzBO?=
 =?utf-8?B?ZXdmQ1ZhbXN1TmZjOEpoSnlUbXhjTHpmZVozajZZVG4rV1d2UDJ0dlRteWE3?=
 =?utf-8?B?T0pya0t3VzJ5K3FBb2d4ZURtajJHck1XZEdFSFIvaENzckFHWERVamI0SmhJ?=
 =?utf-8?B?aWMzQmNQZEcwQWZQb095enlpNmJBcWNvL3hHQncrRFRoWkxCMzhpTVEzTEtF?=
 =?utf-8?B?UVovRzZXVkI3YVhqdm0ya0ZxWmRxSUxBUDVJYjhhUmhTV09mVGZ1NFVXYUxO?=
 =?utf-8?B?a1h1QzRUS0J0V2ltRURXc3hhTVlsRTBreWhWdWptWU5Cak91cE5pUWtSem5B?=
 =?utf-8?B?Z1pTWVNyVmp2TzBIZjJsa1VVZWN5M0tIeENFSE1vOFgvVWgxRVczZHNDU09T?=
 =?utf-8?B?aXg1TVAzM2tjcUphZ2V3UG95MWVZYnZLM1FxNVVFZ3ZBNWpLQ0x1TTZoaklx?=
 =?utf-8?B?SmZEa29McGJCYkQvVVY0ZUtCbUViMVNKemFxcjA5a09saHFMK0ViYWtZY2tM?=
 =?utf-8?B?WWd3NGpZZWFIMXV3a0hyRVRvZEpxcWF2OStON0lYajJNeWFYSnNqL2h4bnVV?=
 =?utf-8?Q?hwXHwVRHJ2Y+8W6e43/AXFI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b879d99c-c8fd-40d0-fd29-08d9a858d6e5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 16:56:16.6800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isyRfhy7owU2hxHLS1APn6P2m88x5oOW5jxcAZpErHzOAcoWPBjqmGgEtzY0ApYbKzA9RowsBuqsUu9TqtGj3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672

On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a vPCI is removed for a PCI device it is possible that we have
> scheduled a delayed work for map/unmap operations for that device.
> For example, the following scenario can illustrate the problem:
> 
> pci_physdev_op
>    pci_add_device
>        init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
>    iommu_add_device <- FAILS
>    vpci_remove_device -> xfree(pdev->vpci)
> 
> leave_hypervisor_to_guest
>    vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
> 
> For the hardware domain we continue execution as the worse that
> could happen is that MMIO mappings are left in place when the
> device has been deassigned

Is continuing safe in this case? I.e. isn't there the risk of a NULL
deref?

> For unprivileged domains that get a failure in the middle of a vPCI
> {un}map operation we need to destroy them, as we don't know in which
> state the p2m is. This can only happen in vpci_process_pending for
> DomUs as they won't be allowed to call pci_add_device.

You saying "we need to destroy them" made me look for a new domain_crash()
that you add, but there is none. What is this about?

> @@ -165,6 +164,18 @@ bool vpci_process_pending(struct vcpu *v)
>      return false;
>  }
>  
> +void vpci_cancel_pending(const struct pci_dev *pdev)
> +{
> +    struct vcpu *v = current;
> +
> +    /* Cancel any pending work now. */

Doesn't "any" include pending work on all vCPU-s of the guest, not
just current? Is current even relevant (as in: part of the correct
domain), considering ...

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -51,6 +51,8 @@ void vpci_remove_device(struct pci_dev *pdev)
>          xfree(r);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +
> +    vpci_cancel_pending(pdev);

... this code path, when coming here from pci_{add,remove}_device()?

I can agree that there's a problem here, but I think you need to
properly (i.e. in a race free manner) drain pending work.

Jan


