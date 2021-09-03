Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0BC3FFFEE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 14:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178065.323923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM8Vh-0004a8-6h; Fri, 03 Sep 2021 12:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178065.323923; Fri, 03 Sep 2021 12:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM8Vh-0004Xa-3W; Fri, 03 Sep 2021 12:41:33 +0000
Received: by outflank-mailman (input) for mailman id 178065;
 Fri, 03 Sep 2021 12:41:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=etbn=NZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mM8Vf-0004XU-Ui
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 12:41:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9222c8ea-69bc-4cf3-8606-09a74fbeab7b;
 Fri, 03 Sep 2021 12:41:30 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-LIyylY2YMj6tMTlQvMVfuw-1; Fri, 03 Sep 2021 14:41:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Fri, 3 Sep
 2021 12:41:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Fri, 3 Sep 2021
 12:41:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0063.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 12:41:25 +0000
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
X-Inumbo-ID: 9222c8ea-69bc-4cf3-8606-09a74fbeab7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630672889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EbrS5Qs1UIXDzktuDY0e79UHyHoqnt/wbQv5dVhWme4=;
	b=SA0v1wSI8hF4sjL2hFMBaKgX+jFl4HrmUMoL/2PToXrpOJu6rI/abwIq4cMXu/C4bnaesG
	kshKrBdhrTORfbfBf+VcQC7G3oU5hoZliqyjBa0R6RI2YfyTiFU5gJ/0a7F4oeq7+agsRs
	mkS5tY/qZ0++4rIKW6/S+RD2YV8bA1U=
X-MC-Unique: LIyylY2YMj6tMTlQvMVfuw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjWebvd6BgjtC+0LvqsHTUHOHb8rx5hON3KQeKXN5d2vNjiYgabJWbI3XCx3ST9of4AgwHqLWepzO+7fcWLJ2coIdLG30zWqY/m5rZLB0aEM6+QeEModsU42xiDlzWSDqhU9Zq48IxzorvaEOqSkVCoHs47Qp5d4K9U22jnf/MC40AihSUJuyqmcWfd1CINvv2yMpOI4Sb02IwmXKEoAFwF2DjKZS/lB42W5DS53SIpeukvXKxRbyDAC5GBbQb86LhZBfhURcA9emgOhC3ggtI8RRovtYU1k9rOHeMTEgA3PmBD0bbGY4O2u1MQ+1fUgVoT64BlwmYnBwg+bNYSFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EbrS5Qs1UIXDzktuDY0e79UHyHoqnt/wbQv5dVhWme4=;
 b=MtXi8j+n+Rsyn1wjfYVoO9O2Za/S3EceM7KDmDB1w6r83oMMYODtokGtdh3HC0O+duYYOOZTzleE/ZghupwPRYjRd2y4eI6v6l+ReB1G7Vz3qTFiQ4OnTotR2xx5rX2PsuLf2EbLu48ppEsfONMIvS5APETV91P+zYDZVub/71RAEZggLtRGnWwreGmGiqCxIC4uiaC+h3gDnGIKSAU0nX7Zr+F1HoSYQz86dmHR7XYjx7qRv15zCYk4H3F8VWYriaHwhFAL4Kn2LWi33S0l9wHcddGMjC1IrdIrK0Z7cKvk7qnMqXBPlBKp+6prz708+TKikx7/fI5xBP8ZIdj/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 05/11] xen/arm: Mark device as PCI while creating one
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-6-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b890e67-c907-6678-bc98-d810231d9b50@suse.com>
Date: Fri, 3 Sep 2021 14:41:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210903083347.131786-6-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0063.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a061db7-b876-4ee2-2881-08d96ed82517
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5903D145EBAD533118FC8072B3CF9@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I1mDtXKJhnyl/yZHIr8Fa6Ij7nODyJmXEahwicGcdrNx/7jHwW4g7J936zDMdCj8h8h8uysEvYiTj1NL0G/5UBAuMbuQAUms8WOwQD2Ub4PD2oZrOuiZyiGFd6bCB08mC2XtabItvKado6f1SkkQxwjtPPZN7bubbBHbO05eTFgQBq1lqx2tYtCbEeN9a5zaakJYQGqdhOmA9uHaduWxTj55azO3m1yfEOmcb17PUdsk1MOsXVdO+PAgWJuhpCUnhCA3yp3wu/FwQR/UrmplhnNxTLfWH6FT8+rQ6yGd6X0dPIrkrKFtPp/O34XViKLFP+PZ1xNVPzay/Ffgf21k3/K+LuG0BOxO+IiPBJff874c97p+RXN6mEy0+fQAISwSdaJ3E46TmQbdTc2uetgwsZPSuSDaDcP7E/O9sQSo9NXydmYsLkZnNOjmDv9huB5vt8DrrsuzMjXAXIMcLpIc9YPlUZn8QkNqyz7Lib1m9Qk9Szz+INGUSpElYLQgX4cqzArcLDZfrDXbFje/uG+aKtpQz1wZ53LOogpI8UzPjL29Ztw3myuMmafoagHi170Z1Ob7SSxTsUcFtMaart7Mh8gjxskCLqPTztS/ru12bL1zdrQwMOGdk6sk05pI9uR9+UI5XwLA1dMDlFjEgRoHWo8pn9En7nnvNF/tYEKJ2a9VHVWzusIKLMD2muXjM2t4Agl6sAxOwysWo+EvC/lCZi6qWNzZ+F5nNDjK1nk/ugM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(396003)(136003)(376002)(366004)(956004)(26005)(16576012)(7416002)(6486002)(478600001)(316002)(2616005)(6916009)(4744005)(5660300002)(4326008)(31686004)(2906002)(66556008)(186003)(66946007)(66476007)(36756003)(31696002)(86362001)(53546011)(38100700002)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDZJcHVXN2FMZGVQaWpjUlFqeW03RVgwb2ZGN2REcFE4TXRNMFczN0paRmRM?=
 =?utf-8?B?eTZZUmRGdFg3VENDK3g0SWF3VktUWERubGUzbzRyTGo3cDdMaTBpbnhIUEJS?=
 =?utf-8?B?a3pXSGJTNHFYU09VazMybm9mZk8xVFU4TVphUWFVTUV5dExtOEVYVXBZZy9N?=
 =?utf-8?B?ekJmT3JlTFRjRlpZcWFBN0xMNXZ3SVhJbDNSbTMrazMwVWxsUnhEQ2JoaHFx?=
 =?utf-8?B?RTQ5WUhBLzJWbFRXSVpBU1ZrRXZTVkVGeHdob3N3UGhIRTFOTzJVNllPa016?=
 =?utf-8?B?WWZzWllZeU9RN284TEswZkpsK1JSdXNhRWRGTnVJZ3VTcEtqdlpqOWRVdU1O?=
 =?utf-8?B?OG5CY1BXWlUrK1JVZXF5T2NpSzhqeUxhLzd1R3gzR09zSFQ1Q3UxOWhXZ2lO?=
 =?utf-8?B?RnZ5c0dyR2lFWG94VVpoRDRnTG1IcEhNWDJNcnY2eUoyM2dHZFNaSEt3bit3?=
 =?utf-8?B?d3BCTTlRajdEL2ZXcUlGVU1vakppTTZSUTVHS0RMa0lVT0F2Z2hHZjJKRTBW?=
 =?utf-8?B?YVZIOVp5MXFDZitrbnBZV3pjQldNQXJkWWdKUVpMSDAwU0h6RWNJU3k5QWZw?=
 =?utf-8?B?aFM2b2dpenROUE5wU2g4cW02Tm5SZTFvak9lbVFybklCMkI0ZVp3djMrT2Np?=
 =?utf-8?B?bFhvVis1SGU2akFwdDNzVXRsVitHeWxkQmg4amlGRVJuNkVZWDNwNWlLeldQ?=
 =?utf-8?B?eC9RUjFPSlNOMHg2dkxYMVRVZjhSLzQxV0V0Q2tRTCtMbWNYcE1WcWxDY1RJ?=
 =?utf-8?B?NWlpYTFCa2IzWnF5cGkyVXhaakRPUU80Y1pFWjZaRjJETjNlTlljam1tWkkv?=
 =?utf-8?B?d0wzRnJwWVdCc0FxUXRXY0R5Qnd0VnRoQmJFdjRkRGJwdUh3cUU3UkpzVHpW?=
 =?utf-8?B?NW5sRnpVL1MrT2w3MkZoM2xVZHl6UDVvMzhHV0p0MEtMcUpZakNNaFR3WDZK?=
 =?utf-8?B?VUNVdUpHZ1dsSnY4andMUXRCZ3dSak55UC9wclhoTThaZ0ZDVWtTVXpUdmVi?=
 =?utf-8?B?NnF4ektKbEN1ZlltZFJjZkpONFRjeHZISUFISllSbjFMU3FXdUlKQlE5VWZJ?=
 =?utf-8?B?dmhsVFN0YjVXeWlOeXNzcnk2ZmcwT3hVdE9Sbkx4UVZYd1lDR3Y1cUM0RnJy?=
 =?utf-8?B?UTVxKytBdzIyd0dldWEydlJzL3picjhQYVNrNm0wU21JekQ2RFhzMTdFSWMx?=
 =?utf-8?B?MzYwZHo3VGR2M0hvQUcxeTIzVGh6Y1RRang4RldhTHZoeXBMTDZaZGpkTHZZ?=
 =?utf-8?B?aHVjeVpXYkEvVThwUTFaRTdPVmhMQzBBVTFEQjkvMGxEeVFJakV3OW5qdGpz?=
 =?utf-8?B?MFQzNmI4QlRZeFZubmhGUHhRMU9xWkdrVDVUL3FMWGNqTGk4cWtRcFJOMFoz?=
 =?utf-8?B?RGl5cEZhb3FDQUllU213c2dveERJc2x3ODV6SVhpclFjVG9JaExpZitRaHg5?=
 =?utf-8?B?WEN5MU90dytQNk9GQUEzV3hQaFpqOWRrTzUzdVNoYXc0SFI2dm92YURyVXUr?=
 =?utf-8?B?cGFhK0ZsTVVlcmptRFNrSCt4c0xLZmJiMVoxdytPQ0UyekY1cUJJNDVnWHcv?=
 =?utf-8?B?R2VZREtqK3JRMDdPSVNya2JWelNqR2hIcXJmNUxibXlZcERFL0Zlby80UkVC?=
 =?utf-8?B?RDJBcXkzRDBRZ1MzWDEweUhKU2R5aFZ0Z2llNEpjNllDVHl3bEFxK0lFOC9o?=
 =?utf-8?B?b0NnSm8yeXhhcENnY29RRVg3cVN6T2Rqci95Zk1oVWw3RUcrTTdzMS9lUU10?=
 =?utf-8?Q?Q3IIIBW0jFzUo8x9h355byMsXgu0HQSr4c5hQ/7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a061db7-b876-4ee2-2881-08d96ed82517
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 12:41:26.6250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: relRL+MFgHFf7TrmdR5q5a+iAf+9damWMM5MiPNccQpaZEy9KMs4NJ/zhSSmFp+1M4yQKQ5Ag36wRckubKQzMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 03.09.2021 10:33, Oleksandr Andrushchenko wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1301,6 +1301,9 @@ static int iommu_add_device(struct pci_dev *pdev)
>      if ( !is_iommu_enabled(pdev->domain) )
>          return 0;
>  
> +#ifdef CONFIG_ARM
> +    pci_to_dev(pdev)->type = DEV_PCI;
> +#endif

Why here instead of in alloc_pdev()? The field should be valid by the time
the new item gets inserted into the segment's list of devices, imo.

Jan


