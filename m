Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CB4415C90
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193712.345084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMd3-0006Bl-96; Thu, 23 Sep 2021 11:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193712.345084; Thu, 23 Sep 2021 11:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMd3-00068j-1U; Thu, 23 Sep 2021 11:11:01 +0000
Received: by outflank-mailman (input) for mailman id 193712;
 Thu, 23 Sep 2021 11:10:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTMd0-00066O-VO
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:10:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed32efe6-1c5e-11ec-ba2a-12813bfff9fa;
 Thu, 23 Sep 2021 11:10:58 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-_6HQlhhEODys7yKR7h9Evg-2; Thu, 23 Sep 2021 13:10:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 11:10:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 11:10:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Thu, 23 Sep 2021 11:10:51 +0000
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
X-Inumbo-ID: ed32efe6-1c5e-11ec-ba2a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632395457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5n8E4qDNOXyPRZiTn4zsnzmSBAjyQQDHUXlXehU+4/E=;
	b=I1MlNhdguwdpR7/beWYOCX/SeWd4lee3+jyskoNnNYD/7sKAh1045Zb2QkvkqqQAwEIdDU
	XaadVzncmFU//9kGcLkAtDnp8mJocUlklFty5tWLAO7Dvk4SGM+/qgQGkEkFS0EWbAUmY3
	GLrK1COCvEzKlTYBH3EooTYDdRnr8Nc=
X-MC-Unique: _6HQlhhEODys7yKR7h9Evg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aj2dgfk1cZqcAYpsJ3ql+31AmQTVIY40+Kt4ht+l1WKq54rZKOu6uGXPHZgXuiQw7WG+3G9kitx6FGRoo1Th5SbdEASxOAXgi4iVykdLqPuA+IlE9GV00+P4gSbQCNjdmtcIFB3b2I1mZzUx1NroamMvLyMvMJuV3nEL8MtMhIUGM1Y3vR9NXP1ScnVmEjGwj1AeHM9CYzWUPxb1kg7M1JQ0AJNbt+L1A+0j194QfBq8KC6Y0LH3BDhsMruCLlhNJ3nuFMJo54abtHv/ZIwXqMaAcO0sEWDZ1b1DonfUmIBzIwzjGJ95XeFBIXaKJYs5g//4hbCqZHgbHewdmNoUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5n8E4qDNOXyPRZiTn4zsnzmSBAjyQQDHUXlXehU+4/E=;
 b=b0ANod3y0yT1cVjQcXawCokCazyeuvRwJY69aMvkSjugSjREOlVJIgabXtWI9f9cxEn4RNlI4oP5pqQq/XG3rixqNH4YVE8zZuzISGA5KrSJcBydUiIBMuwW1PIkYZ3cUOYdmXDIWvuHA55lee1vOMdlvwedXEN7khHoZnUq24i5I2lkfNSvX5aFq1Kg6uNbxPkAblFLi1Qfj16iK/vWDYDDPcxY2kFpHhLGxhEiTBl93wk8Si6J2OjGqQURlqHquz73gdDGOb/nipucoC81G/HHuGEpMOaRU0w5sPjN4FM6nejBbF0KsKMQyUCV9f18BRfR6zkvkMAzbRn75oYpGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 1/2] xen-pciback: prepare for the split for stub and PV
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: boris.ostrovsky@oracle.com, jgross@suse.com, julien@xen.org,
 sstabellini@kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20210923095345.185489-1-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d12b0bcd-e998-d4c5-e673-9c13a864eea4@suse.com>
Date: Thu, 23 Sep 2021 13:10:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923095345.185489-1-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62403514-8f2a-4f56-2a16-08d97e82cdfb
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4383C01842F656D72C8890ABB3A39@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sQPeRfzDZ0+qRqLtZTLy4yuM88tx9z5WtFdeqDKk3Sf6atduPIJXavj1N4iedtd37EQKcMZ2UdWQNUYQcrHixS+ZY+0kpZQ695htoIWUdiaDelcP+atjCjEu8tdecYnq6YWQWh7K5AMvtOmMgE7jKbb7aV7Xpn1bkzM1CByMukAJjomJcDXYvnuHgabcxht0qptM7sbVThpGsAPEu/KRlkzQv+9XF7vEADtg0F6k0iX8P8G1V1KJ+D//M57oxUBAANN5zMrzwEx7qEzC4R6DgGIaAhYMzK19asoL74+uwJHsWDQqVbh/SisGbxQty/Yhrj1ywDJbWFcr4ytgwHWvowtOv4hK2ZcU8i3YmVOHmsdN41d0GdV8nBKNH9+bpQcNuPRUdQATvruRvSHu1IJEKKSScdqAkxnCigfYRbQwW8b2To0TYh0JifMjGadkYlRdCHTVmjckxC692sTWY5Ye+tLYXTAkEbeU24V2WsUvVKwr+UBTK0XHUuzjtCIWfIVjOcduL8A+ZpzXg4hTjIcqiVctNv8fgmR+Y8fWgjH2I81hP3AcsUws8cN/98cB1ju+l7e3wsaYjz/7CErMldBdXpJ2c4w6pqAs1ITkQJUY5dWMfsU0Ng384bwNtsyL/B0gLeawdK1CfDTYmLSozv0zEd2daqf86E8PVMm5QsPQBhvJ7Yar9gprvt2krqZ/+kPvr9YBB7FYGhcrAej5Lv6PHgLUlEHbLOna4679YPZNv/Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(26005)(66556008)(956004)(186003)(8936002)(6916009)(6486002)(4326008)(316002)(86362001)(66476007)(2906002)(31696002)(2616005)(83380400001)(8676002)(53546011)(508600001)(31686004)(5660300002)(38100700002)(16576012)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1FpMVFzRmx1ZjZrMk5aSGFHaXE1cVI1TkFybHkybEhSQ1gvRER5TlFMeDFM?=
 =?utf-8?B?OFNzS3V0dUpYY3A1aURrTnRCRGpCZ3RsREJCN2d4UnM1NXFqTm1Ba3htTTZF?=
 =?utf-8?B?MWh3cThGY21WOW9FRXFtdGM5aFZOQ0V0QUNEU0NwMzVFTVNraDY5MUtpaStS?=
 =?utf-8?B?WmtLSHJJSUUyOW1PYTE2Wm8wa3JCTFlMR3dwRDlNd0tmVWpWTEUzZHVvNHdk?=
 =?utf-8?B?VTRYNmloNUMrMCtkeUJrOFlRYkdLN3NFZFNGMGFzSDByZXkvYmNQeHZjdTlt?=
 =?utf-8?B?WWF6UGlPSmhqVDl0TEZydEs0LzFrMlhzK25UWTdPU1NrQ0ZFZGU2RDh0MzRE?=
 =?utf-8?B?L0REbXNJYVpIK2Rpd2RmcUF5cFJjdXlzV3VMbmRERGswTTlpMTZmYVRlR1VG?=
 =?utf-8?B?TlpuYlI5N3N0TnNkOHc0RXhBRHlJeHBaa1BBMnhPWkRDV3JQcDM1VjNEc0pD?=
 =?utf-8?B?Vk9DMFFLbncwVURiSSsrY3E2NGU5OUlqVUVSdnlpcnN4UHVRb2xlL3ZTYzJF?=
 =?utf-8?B?cmFUTHNaeWZoeUZlbUxRejNCclV5Q0xVYVl0YjVPeFlGaTIxWUpqSnM5ZHlv?=
 =?utf-8?B?R1YvSUhnazdKRWhvL0p6MGw1YnJmWHFnOWV4Z0pSU2pWYS9BZmlTWXdxWDBG?=
 =?utf-8?B?Zm9uSldJQnRKWUlkKzd4TnhRaDhUd3dHWURwSUhrbkFqRlZZTXExdnRtNHhK?=
 =?utf-8?B?NS96SVkyWXQ1R0NoWEd4OTRvcHIxME15QVMrZU1pNjJGZzd6dGJQQS9NNCsv?=
 =?utf-8?B?a0hnYjJoejlWOC9oODlUaHJsUFQwRzhYMXpDdW9FQU9Ed3htejU5bUEwWFFE?=
 =?utf-8?B?UDVkV1RmbXc0MFB0R3NkMC9ETXUyckxuQnFLSzRCUS9vc25rQi93UGp2aWtM?=
 =?utf-8?B?NmJTSFRIcmNEWFVNQk11MGpvZUJ3MmxTWEVkZXdjVGxFMGFHQ3BubDJLVVRp?=
 =?utf-8?B?VFNRV3NHNkdYVEtRcFN6MHVmcm5xWUtDM2dpaEVUZkt1Y0FRQnFxZ3QrZ3gw?=
 =?utf-8?B?T25oMEZKckVwd2thYVV4TmpGS1FVc1FocXlTZ2pKbVNTNWRHYTRPL3Z0c0JE?=
 =?utf-8?B?OXRLZVBlenZPaXRqT1U1VVAvUXROM1FJbFlpY2w4NjJTMkZWaTJ5K0J5R1ZZ?=
 =?utf-8?B?bnptdktESitiSFBySnRUSDIxSHZCZDNnaEJqejRTYkdLWGcvWEVkOHFYa2Vm?=
 =?utf-8?B?bGs4d3FTcTFNYWc4SGw4N1hwM1JOcWFBTlovOGMwYVhKTjNZOUd0b2F0STBq?=
 =?utf-8?B?ZThxTSthVCsyYm5Ic3V4a0NuLzluYzVrTU8valROdFVMNEtPQWJVbkEvc3VQ?=
 =?utf-8?B?RGs0YkN5UHRxaTRrSGNQS1gvMDl3S0tvZXFZM1RHU2xNMlpPSkpsdE9XU3Jr?=
 =?utf-8?B?Nk9vQ0FtbjBPN2lxRjU3cjNwM1g4R2s1UHVMSWVaUU1uWW51T3dFK21rVitV?=
 =?utf-8?B?RWpTTXFzUjRsMys3d285ZGlKYUJPd0t6bEx3OHk0bjR1SXVQRzg1RXRsWWJM?=
 =?utf-8?B?VnByenhPTzAvVGxya3B2KzIxdUlvTTAvV3EzZUFFakQzcHc5NjI0UHVHMWRM?=
 =?utf-8?B?aC9BV1VDSHFLT1F2ZG9pc2VmTXdhK2Q5YUl6a3Z4ZWV3cExWSld5Y2xuZUpZ?=
 =?utf-8?B?V0tDSCtQSzhtYTE1SkZYbysvSk1uTW5MK1cwd28zKzlLTllGeGZGQmRPTG5R?=
 =?utf-8?B?YTVzNmVWZFExM2VOUEFqVFk5RTRQSEsvMVVMaiszcVd1c1ByK01JcDhDUFBK?=
 =?utf-8?Q?UAEjZSWeuc0TZR4mgFM1uV2jwzNGYfUYij+L3GG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62403514-8f2a-4f56-2a16-08d97e82cdfb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:10:51.6943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CyaRxDGeAFY5Oe4Ia2MB52FhyYLYzc1Dk+zU6JaONFxqQaAagLYxLVjkkFbw6cB+XbUPE3SNML+eJEhr63STww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

On 23.09.2021 11:53, Oleksandr Andrushchenko wrote:
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -180,10 +180,34 @@ config SWIOTLB_XEN
>  	select DMA_OPS
>  	select SWIOTLB
>  
> +config XEN_PCI_STUB
> +	bool
> +
> +config XEN_PCIDEV_STUB
> +	tristate "Xen PCI-device stub driver"
> +	depends on PCI && !X86 && XEN
> +	depends on XEN_BACKEND
> +	select XEN_PCI_STUB
> +	default m
> +	help
> +	  The PCI device stub driver provides limited version of the PCI
> +	  device backend driver without para-virtualized support for guests.
> +	  If you select this to be a module, you will need to make sure no
> +	  other driver has bound to the device(s) you want to make visible to
> +	  other guests.
> +
> +	  The "hide" parameter (only applicable if backend driver is compiled
> +	  into the kernel) allows you to bind the PCI devices to this module
> +	  from the default device drivers. The argument is the list of PCI BDFs:
> +	  xen-pciback.hide=(03:00.0)(04:00.0)
> +
> +	  If in doubt, say m.
> +
>  config XEN_PCIDEV_BACKEND
>  	tristate "Xen PCI-device backend driver"
>  	depends on PCI && X86 && XEN
>  	depends on XEN_BACKEND
> +	select XEN_PCI_STUB

Does kconfig not at least warn about this? The selected item has a
"depends on !X88" conflicting with the "depends on X86" here.

Jan


