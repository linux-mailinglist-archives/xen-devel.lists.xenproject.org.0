Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449D41DD41
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 17:19:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200043.354421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVxq3-0007YX-Fu; Thu, 30 Sep 2021 15:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200043.354421; Thu, 30 Sep 2021 15:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVxq3-0007Vv-Ce; Thu, 30 Sep 2021 15:19:11 +0000
Received: by outflank-mailman (input) for mailman id 200043;
 Thu, 30 Sep 2021 15:19:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVxq1-0007Vp-Rl
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 15:19:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c11f9c77-2201-11ec-bd54-12813bfff9fa;
 Thu, 30 Sep 2021 15:19:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-QHld5u4RPiq49rp9TzMvJQ-1; Thu, 30 Sep 2021 17:19:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 30 Sep
 2021 15:19:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 15:19:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.16 via Frontend Transport; Thu, 30 Sep 2021 15:19:03 +0000
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
X-Inumbo-ID: c11f9c77-2201-11ec-bd54-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633015147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bgDlE3U3NKHONbHyYc0K96n7YPWEMknxgbSho7XY7Y4=;
	b=EzrTuAPiAq1pC/zGorw0NXQf0duE/JnxrI9wOG6TzBvw9pEGy1ifRRJS0wZjE1dJUHZ4BW
	mqKY89IWyvVRhhqATboE7q4fvx3uNuvO0OIhZEBdRqt0oJEToIbUMkORWCrzukTMDRz0HY
	hzZbAfXvuqchKn6re1+3wdV0gWNNT6A=
X-MC-Unique: QHld5u4RPiq49rp9TzMvJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMFro7XkR6oxrOGIS6oFjd5FexPO4IqCYTdpZ1LT2lHwaRBFFEUaXPzQ/ENMCRA/p4yXDj3VXMrwWFEQczaJxJkjb496/8Hod0IckgEcGNBE/l68vjRQetCxT7vx5yszMQPMdO1pDCA637zOK9eLNvqJq/xGyjxojT9Q+gX9kNOYc5FY+ou3mOKVa/l5jfi//3vzGcDwSDKpCtuB4OwCjovLjEEcUrXZjhDJfno5dW5AqsFuOURpfg3lWucLLgw5rkuIj6I7vBqj99LAK+pv3TOPJQNtVXRpIxeN4/2Qvp9iEHjPejDrYDjz6xmoIZV5AUBhq63FS58x/s0PBHxrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3BAhEpSNUGTXpf37neCD/9++svB9G8eXQxhjuiXz/nk=;
 b=hCKLxGhDnim676lHqbEIhee8vQfFIwNTV6taXNldh7WusB9DwlsevNGIZs+Oyn0V0RRHjMPxcGECZxRzVylUg/2Cd+536bul2DTrlazN/5BADpyiN7Noq5+dzUHB0ZMlvFBiqFlAH4sAz9tlOKQO1gcihUtqreReiVJy66wCEC7mIhD8Ej9wwzWW3BkZSPyOMtcMBNM3vU3SfJlLDL3EXSgB82ka1YbUAeIhrYb3xHwUqWmQuCbK8aaCD9nbIVJulUCg8LWdKTGVj814XJLt7ZPYYNk6W4sl698MIyP3HBKv+0/RzPLnyvS0hJFOBLroDns5hckCZp6SmFt87+fmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 14/17] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Rahul Singh <rahul.singh@arm.com>
CC: bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1632847120.git.rahul.singh@arm.com>
 <d7f62249e6aa7b33017ef707d6bc451b5e2c7047.1632847120.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <491a49c0-d609-c122-f64a-999b16ef3a83@suse.com>
Date: Thu, 30 Sep 2021 17:19:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d7f62249e6aa7b33017ef707d6bc451b5e2c7047.1632847120.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0049.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af7807d2-5055-4ec9-0849-08d98425a378
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7149636C3F774877EF9C8E4CB3AA9@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xcDEG15fIgmZytgs/PzvOJWAALl/JZK7v1fmi7lOVjtIh3DuaZU20dXb1cAt/wJ7mI+x+xP+G/JvvZ6J55GjrrH1X4GSOxnEr2StChYhjP2vXhhhlKBsG7NSpn2+Etk2W82wfQRwtIzRxW2pO8otZUklZkGqby2z9KqsWyni4WiiTSYbqFev+uzqbg9JpV33DH/9FK4GVF8i5X0lUSpFukpuZYl9zeDPUT0R5gk7ezGQ6WwS+5VUndhYaxQNHaEhFJYbFsPAFReALOGfO7dEsdSX7XQPMsAXB8tGrwF5BJKr6FVoS7GiaaZrEhVjgqktEgUdirP1DX9JBKjYCX91AVsk15zIijIr7YdbTjojIbCpNyYI0ffANXOy5IB7ImSOzR4nRnA2CflDzSOIDpX30ALQhvgaWKNqtkrS/VM+UF61cGJr5XqqgM5gdFTTKzDl9M6/g4in3KPSuQ9ih4Q3Pkr0/1y96XRfE9oPyyA/3U7fXX/uNHPesCF5p/QJQYK9iFRtqT3ze3R9sFMsBefqePKxYDUtt8M9ZCQcxmiKQ6PdbmqINZWouUV5/rKS9E3aR/UGzANvq0AWV9JOfG9AoSJqJuZfRfj/wWADlfD/vFHrBff4rja0bnGVilfb/8/Mry8e1x4i7zDxzzI0AlDfujVRiZ7cLXgqZMpUwtHrccKn3CjMh6lmIff04Asl7bUQCAntu9elbU5G128PO8wZw47Ozox/gfnBflDyQkXGdXz66Nnw8EbGnRSKHQ0s9hO5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(53546011)(26005)(186003)(2616005)(6916009)(508600001)(2906002)(956004)(5660300002)(7416002)(6486002)(66946007)(36756003)(54906003)(86362001)(4326008)(8936002)(66476007)(8676002)(83380400001)(38100700002)(31696002)(316002)(16576012)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fuM6PBukR3OoA0+NNcEr6zEvmmHF1RQW09fYY7ENLvTJIqCw+vBlqHB6J8K0?=
 =?us-ascii?Q?csRNOUKVURveUBPwJrjquarlSHEm1RdPQzITw1kUA9bTz1fCkf+ReZrV7NxC?=
 =?us-ascii?Q?Z4CkWthq4JKf9L66ToM3DXvqXfyqfnNZUbnD1Sy0inj2nTe3DmaKRkIG5K5r?=
 =?us-ascii?Q?TmhJc82l+UKYtLK28f7wSypyWcMge3w0T50lF0RRQCGyidBPhJRsWajv97ai?=
 =?us-ascii?Q?QOPDa74UxTme5pjYsvnwGNSykGrr5iWZSKJ6EBKtyxcKA+herTLTZHiy+R61?=
 =?us-ascii?Q?/KVtCxbR0mC256PFtBrwQfrJ0JhlC61TRwylGLB5vyG3yTRWquVXj6dct7WD?=
 =?us-ascii?Q?O29Tb8F0v8TRwumrkcCWB65kkOnFJzhM2mIDMo8hxzBXiMVG0Ri2e9kTyu4/?=
 =?us-ascii?Q?vFYeCP1/aixT11P1AgOTDbP3sCY2fEvZueEYa22YaLksWpUtPtHR5ej8VZFQ?=
 =?us-ascii?Q?huu8gbCLqd2lIIVGdxV31TVLqyPCT6DGlzTQnMNwQ97IF7jBVC9Gt2/gVXWT?=
 =?us-ascii?Q?SDCufKKy6C2G6bu55QE5KXDAZa93AVHMgJoieMkW89UjSpInsueEo7IVuAlA?=
 =?us-ascii?Q?AoI2IEFCg/Mzy+izXX7bPTxmrh9DeTa1nZ4nM3+gsXws9gSu99RDURXpy+pZ?=
 =?us-ascii?Q?SAzaWc9mkm18qDWy6oiG5ayFOZTrsxIge7N3DulKzRi5bYzXoxGgK3vVQotP?=
 =?us-ascii?Q?AlfyLQf9B+hdqkhx1RWEARVey5Hdd4VYE8bGqAV8zkN7OYjb2TM+DBl0nd15?=
 =?us-ascii?Q?dlEeAgkCRoDQIfuS04QEwX6/WPW3LuJo4lhO3aIduJvyzioPyOj2pEiFrSSa?=
 =?us-ascii?Q?sw2MZUY/jeZYtDntSAhsO4kBKeUvFkMHeW+6fFqrD+3cGtW2zQcawVvD1IK8?=
 =?us-ascii?Q?qZECo3Pd29XHRitYEq7IxE4jvPa6Uoe3KzjxGAFhwkhaWH7OpKWdUat5HHnT?=
 =?us-ascii?Q?xqgf6DNIB+gmYm3Tvp5NAQDzfvCEl/WgGoHHMSjk7B5stU5rXA5a7OvfIprm?=
 =?us-ascii?Q?sw3j9XZaEyirwuvRInHtfr1iAb+1qRiA3ZNEA6eKbgkzp1CHlg8scFH2uMQM?=
 =?us-ascii?Q?1xA4kc5D6bJ23QuRqu8XRS/8+NF7zcVZnPFIu7qTJX4INjptnxolqlUKZ2Pk?=
 =?us-ascii?Q?hy9RZFXzFNEsPjH99c28DBxNaUeGaCIFiWdfw28LYxNfrXv7u5HlbP/pt/H0?=
 =?us-ascii?Q?lCtCytRsGlHzVnKK+fcMDWADV/iBo8MN+griCpkYUZcR7JNFa6eCz4DHD6G7?=
 =?us-ascii?Q?rIV8eFAfzI29uBHR1Mg+PmY37FJUN/3awMmMeMTBxdrAjbC3PLN4IdCXReB+?=
 =?us-ascii?Q?l9UWsmHo5JFviwRCgLxAtOrG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7807d2-5055-4ec9-0849-08d98425a378
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 15:19:04.2374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCkbLTrrQhVAqTrR91f3yYPOffUjko/d/fJWt1G9BwzTsJ9aaGVuE572QGmr/Hvswq7KavV8conYWA383WuZPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 28.09.2021 20:18, Rahul Singh wrote:
> The existing VPCI support available for X86 is adapted for Arm.
> When the device is added to XEN via the hyper call
> =E2=80=9CPHYSDEVOP_pci_device_add=E2=80=9D, VPCI handler for the config s=
pace
> access is added to the Xen to emulate the PCI devices config space.
>=20
> A MMIO trap handler for the PCI ECAM space is registered in XEN
> so that when guest is trying to access the PCI config space,XEN
> will trap the access and emulate read/write using the VPCI and
> not the real PCI hardware.

All of this is just for Dom0, I understand? Could you say so, perhaps
already in the title?

> For Dom0less systems scan_pci_devices() would be used to discover the
> PCI device in XEN and VPCI handler will be added during XEN boots.

So "would be" here means at some point in the future, rather than
before or in this patch? This could do with making unambiguous.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -662,6 +662,12 @@ int arch_sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
>          return -EINVAL;
>      }
> =20
> +    if ( config->flags & XEN_DOMCTL_CDF_vpci )
> +    {
> +        dprintk(XENLOG_INFO, "VPCI not supported\n");

This is a misleading message, at least if for some reason it was to
trigger for Dom0. But down the road perhaps also for DomU, as I could
imagine vPCI to get enabled alongside passthrough rather than via a
separate control.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -767,6 +767,18 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      else
>          iommu_enable_device(pdev);
> =20
> +#ifdef CONFIG_ARM
> +    /*
> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handl=
er when
> +     * Dom0 inform XEN to add the PCI devices in XEN.
> +     */
> +    ret =3D vpci_add_handlers(pdev);
> +    if ( ret ) {

Nit: Style.

> +        printk(XENLOG_ERR "setup of vPCI for failed: %d\n",ret);

Nit: Style again.

> +        goto out;

No other error handling (cleanup)?

> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -262,7 +263,12 @@ static inline void arch_vcpu_block(struct vcpu *v) {=
}
> =20
>  #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update=
_flag)
> =20
> -#define has_vpci(d)    ({ (void)(d); false; })
> +/*
> + * For X86 VPCI is enabled and tested for PVH DOM0 only but
> + * for ARM we enable support VPCI for guest domain also.
> + */
> +#define has_vpci(d) ((void)(d), \
> +        evaluate_nospec(d->options & XEN_DOMCTL_CDF_vpci))

Why the (void)(d)? Instead you want to parenthesize the other use of d.

Jan


