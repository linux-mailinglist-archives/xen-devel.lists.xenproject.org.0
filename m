Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B30F4C2C4A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 13:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278215.475384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDhf-0008Fk-Pw; Thu, 24 Feb 2022 12:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278215.475384; Thu, 24 Feb 2022 12:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDhf-0008Dr-Mu; Thu, 24 Feb 2022 12:58:39 +0000
Received: by outflank-mailman (input) for mailman id 278215;
 Thu, 24 Feb 2022 12:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNDhe-0008Dl-GV
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 12:58:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aee8a81-9571-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 13:58:37 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-5U85C_0nPRef3YmUT8ezrg-1; Thu, 24 Feb 2022 13:58:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 12:58:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 12:58:33 +0000
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
X-Inumbo-ID: 7aee8a81-9571-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645707516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UZ94uHQ+9OLCPOGsPzHIN2ucdat6bBz3ZQM5mOmP40=;
	b=JO/sUiD6t2Eyf3ikSCbJwcclytPzUkhmTRfrBS1cRgSANUWJnmxgwlZ91Avgsr44jZ+3PW
	4L8frHRbIMPM/cULAS5wHG0reMlvGGIewKJznw2TJoDRkB2IoCqTI5aHHTBp+4C/rqz5Bt
	TqrfOc+ErEK8G39TLIkvoneq/CmSwOg=
X-MC-Unique: 5U85C_0nPRef3YmUT8ezrg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Le5O/5UmblZxSPYVtcrgtGk4kr0AITyou8ND4rLE0wIKMfqg4UKY+lq2hS5rk2bdCcdJkoy80wQLqdVRsJ9p356eEsO4rTC9173XtTGXfnldE2aPClHBKU/6iTsxQj5kIuQd0EAUMoayqR/7nN2VIKCiFRDslzJpld/uxXymuooO982DmX/CiBc7szT6a4SDbK3W3laSuN2yRG/G7vW9OdIo/iMVqbPa4iirWVg7FosxzIAZ+2PPgXPUZqSdwmR3w/RcX5+RmYycjn4+7qotZ+YDwiLbSWobgjKKKl4MsW2Si8vFS9/xPPVglVEe1Xy5gE+wm/eSvhXYNCqOA/mbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjpLk9EzMqLrv4I7VyEkS5pYbehDb2Yx0JN2Qh2mtOE=;
 b=aeyy1zzz9RXwMafXCzCEgCQjwQwSk944m/ELUnMRI6nTCfhGVWtWKwZck6YgE2fp0W9KPxwQRgZG95EkALk/6gt3hIhx1lZ87NhB57KpdXue59wsBBNDjS6HfqGB4WR0KPlBZm/Hij9vOCTtSLYXBASrVcLKQglEd9nGrtwnziAt554x8a9TaSqBVkzJHrriZ2m27AIy+yybS4lPoDZcAnaW6y4todWVZdbIwU9htl0LjzLQmFnSd4SwB4i73nTd8NS1XHRzSon/3E7q8hKUho3f7MxqqV1ezTDD52AMk3bRW72ssaBjumkom+BYs6COUDV5M6jtF6ZDCG+G3acFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3eb5e059-b37c-27c9-5c1b-0ed92b9edfd0@suse.com>
Date: Thu, 24 Feb 2022 13:58:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH RFC] pci/ats: do not allow broken devices to be assigned
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org
References: <20220224124344.86192-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220224124344.86192-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0070.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de577601-9ad5-4d9c-ceec-08d9f7955d39
X-MS-TrafficTypeDiagnostic: PAXPR04MB8624:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8624491052135792E384C4CEB33D9@PAXPR04MB8624.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UuhOucOq3c4k8UbaQo2wH7BkaljmqSqMNX7lH61fzvWJJB0C9kD56GnIVLcps0kk1jXduOIo8COSjOC8xE3JJLEilP0ABV4F8Luqapuuri88Jj24fycfUMVWr0hF+21q1I3cL2CWapfld5Bql4h/GZxetHNyPufxobb9uTq5xaiKU0NIocmWWIGNZ0YTBB7nTPbPGwJxWv2xnV9lRfFZxBzfd4yq0adJSWXBquQHQi2LopHS6UNRNKU3M/SUPYhtEIeGwfDUJj3rP03N6FBqj/Cnx9eqjMQQGFoFOSR3Y0VeOZWW/pCnDEsLx2jEtudZBDLwwj0+Zhs846W2LU3X++TAdbNPPGwWH240WclS7LfxM8Gnw5mQk4FwLBW70Wb96WCw4RZbmLQmseWCLflam0R2B2VQov0Hhf0D0c+3Yc0OvJ5Khg+uJ2Kgnwz5S9O29ew5zZYvymP1lMOh2U6T9AWXdx0snIgqHKASZgExGEL4sSS/qC2ES7EWQWj47MLLo/PnJmkzJy1yfd3TSc5Lqdte6cs6lRikN+QoxD6L/yLodrYVWvJ9+9nD+KHDGwm8AqoaB7S7+hVQloOUbAyXPoEFlP2mj3PUMojBj3RQKv6UY/f4xzcKqoKJ8bLsTMPZz5MrZ40XTaiE9Q5FzV0/36rqdITWBkyfxFFNsbPD1wDJBevgYGbrkSG0H8IqBQ4sSOjgFQ6IoqoW+ia5Y1bCh7QeCXTo4bZYPl00N/KL6SlaAyYDcJ6wB2/JTbjp4JJ6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(31686004)(6486002)(508600001)(36756003)(83380400001)(8676002)(4326008)(66556008)(66476007)(5660300002)(54906003)(6916009)(31696002)(316002)(86362001)(8936002)(186003)(26005)(2616005)(2906002)(7416002)(38100700002)(6512007)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sz7pbSVY048SNSMux+TCT+7IqlupeyZK07MYeYca+yyav41BqdeBwf4rVnIb?=
 =?us-ascii?Q?DsdPEalCuwn2xE0lCsTJqHUd8NHJGN5kjjGeJUW7U8fhSI6AVhW77PSlHmfW?=
 =?us-ascii?Q?dlI8Lfa0K/wFHJV1ux5YEJJ7IKkTwtQsIhY3NfMJMQndkSP7xgQChiJyKTx3?=
 =?us-ascii?Q?gMzl/1UB6UOyymHdDRVJAA3iLYa6r7ldnWL3PB8C7FTc6vEB9tL2lYU8RMiu?=
 =?us-ascii?Q?3TrZaDlJ/uDvlpzdCkBDQBC0DisgquJzM6oR2xtByXyEF1N6ENcB1626MWCO?=
 =?us-ascii?Q?F+5bKJdj2eJ7WQK1MSLCp9QlizLo61IcaCYY/MX0d+0VVFPyxAkEZRwhk8i2?=
 =?us-ascii?Q?79nr9m0WVyjr1JRCF3sgKuYUqkfnF3tezYqRYWAPHYQ2m43xGt21NKfpncZI?=
 =?us-ascii?Q?4WanakciST58J1szEVmh3+NuUox2yHoKS4hN0dv6C4MQbftjD4uPWbK7meJn?=
 =?us-ascii?Q?Td3eY+UCQZiRgzydgbFFFIXV2KXOUE450TXHETmdObXCjmBQzj9wUDVaTND1?=
 =?us-ascii?Q?34aeSwebBAB8EA2jotFL/2xYgHPF57Kchif6wHxGeVdnPE6fZnMrn2xC0dVO?=
 =?us-ascii?Q?0oSQjYXiS01SdBhNXmbN+EqnxUg8IPlADXQDpliMFt8yvmqi2sIzl16f5gN5?=
 =?us-ascii?Q?iYs+fM6ASBQYs9qHR4l24zhy317rn+sbEaAnPdX39ZIzRXmQODCtE7rCwg4O?=
 =?us-ascii?Q?WmC7kKjTkMK3dUeiFbmcPDRP9FfsU04fFj4VGQCoUNdBaFMvY+mS5OjzQOVN?=
 =?us-ascii?Q?RTONIaPrXAeFF+Gsq/Y8+K8yBP2Rx1gBbdP2NPnujX/CDNbSpIyg2f6qG7sJ?=
 =?us-ascii?Q?qtUXQSEomb+s4Ji6rbwuav81wGcQQXaXjd862XHnhy/ABr/NOJ43R6mR8L2r?=
 =?us-ascii?Q?Dm3LS5zcjrHdLbUDSWCFJDepqWUOe5DGRTefUaFR9ejSgYt2RKTWWfZJBkVk?=
 =?us-ascii?Q?MYzD41l7Ob+xnm8A+1a9ntA8hlSNHPtxJ7pfQgQpLpHa7+ezJDO3Ajvt3fXn?=
 =?us-ascii?Q?GJ1nHJKASOembvR4JUv7cq/QAnIGyzcE0rzEjeo5igP3e7Wb4zAasW7car+B?=
 =?us-ascii?Q?30GZO7o8BDmZ2IkaaSdSim05M+0vj18tfbkAjJB+pDzYLLb/Mifg7UMKwd6b?=
 =?us-ascii?Q?hodQLdNOM4HO8lKwof1m394BTi5Pg55/foforMbfsmHZxcUH32dNc3fszTsB?=
 =?us-ascii?Q?Kgz3EUCfjasvRQvH9j7Ips4FMp2bA96Inywfwt2VkEnh4uTK4+YQksUbvlBN?=
 =?us-ascii?Q?c5yDonhG8FiIZ+0uXlrxRflqqkK1h8ZpZJOo4DY6eUWCnF14eKeP8XdgiDOA?=
 =?us-ascii?Q?fOYS/RBxejwPn4De4TY6k9n4m6z1iBZIqUkHa9GbLlfsqYo+FqXQmSNfBK/L?=
 =?us-ascii?Q?XEMF6AI+jI2/BMTGnW2jgsYpGKklrnapaO/L50JUnPBiUkjf1vZ520xxFX+0?=
 =?us-ascii?Q?ytr+7cgXlPknttnQYDtZliLpo3Dhc5Wc8+vNqlv2WiR28ZxqXwRdNeP+M8aR?=
 =?us-ascii?Q?Iv+CshzA5fzc27eW3Pce/pL7fwkTmf+wao5hsPwgqtciE/DXXj3zUdxs8oyu?=
 =?us-ascii?Q?CqSryxJ6vMj5jJ9H7huRaPInL8cuVf7jW/l9OEYf5OU8SSkJrVOw62MI2Nxt?=
 =?us-ascii?Q?6HAELuNhf17Q1tCdk5vBRq8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de577601-9ad5-4d9c-ceec-08d9f7955d39
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 12:58:33.7455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCse2OVU6rkS0eGol+L/jgKd5fP96Apn+d+p59bZuz27r9uL6YY2VgoJWFoNSk2mZ07qE/c/sB1P6/IpFFnQQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624

On 24.02.2022 13:43, Roger Pau Monne wrote:
> Introduce a new field to mark devices as broken: having it set
> prevents the device from being assigned to domains. Use the field in
> order to mark ATS devices that have failed a flush as broken, thus
> preventing them to be assigned to any guest.
>=20
> This allows the device IOMMU context entry to be cleaned up properly,
> as calling _pci_hide_device will just change the ownership of the
> device, but the IOMMU context entry of the device would be left as-is.
> It would also leak a Domain ID, as removing the device from it's
> previous owner will allow releasing the DID used by the device without
> having cleaned up the context entry.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> RFC: I haven't tested the code path, as I have no ATS devices on the
> box I'm currently testing on. In any case, ATS is not supported, and
> removing the call to _pci_hide_device in iommu_dev_iotlb_flush_timeout
> should allow to remove the dependency on recursive pcidevs lock.

No objection in principle. Whether this is the only dependency on
recursive pcidevs lock isn't really know though, is it?

> TBD: it's unclear whether we still need the pcidevs_lock in
> iommu_dev_iotlb_flush_timeout. The caller of
> iommu_dev_iotlb_flush_timeout is already bogus as it iterates over a
> list of pdevs without holding the pcidevs_lock.

Analysis of whether / where recursive uses are needed should imo
include cases where the lock ought to be held, but currently isn't
(like apparently this case).

> @@ -1487,6 +1487,11 @@ static int assign_device(struct domain *d, u16 seg=
, u8 bus, u8 devfn, u32 flag)
>      ASSERT(pdev && (pdev->domain =3D=3D hardware_domain ||
>                      pdev->domain =3D=3D dom_io));
> =20
> +    /* Do not allow broken devices to be assigned. */
> +    rc =3D -EBADF;
> +    if ( pdev->broken )
> +        goto done;

I think this wants exceptions for Dom0 and DomIO. An admin may be
able to fix things in Dom0, e.g. by updating device firmware.

Jan


