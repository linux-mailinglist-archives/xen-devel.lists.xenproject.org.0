Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC1548C733
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 16:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256722.440694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fXI-00048i-3N; Wed, 12 Jan 2022 15:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256722.440694; Wed, 12 Jan 2022 15:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fXH-00046J-Vb; Wed, 12 Jan 2022 15:27:39 +0000
Received: by outflank-mailman (input) for mailman id 256722;
 Wed, 12 Jan 2022 15:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7fXG-00046D-6Z
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 15:27:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bd84c34-73bc-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 16:27:37 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-hTOu-7pbM5Syv3ujHYx_Hg-1; Wed, 12 Jan 2022 16:27:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3296.eurprd04.prod.outlook.com (2603:10a6:802:7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 12 Jan
 2022 15:27:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 15:27:32 +0000
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
X-Inumbo-ID: 2bd84c34-73bc-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642001256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QygfY3ik59x6ir6bES/j5uSfiw8Ny9rK1/8Wwfhixp0=;
	b=ieMAvBdINjQXgtWy0dJqkVuO0mhEQHwfao+Pdtc6TiCrGe2+DWlZpAHg+VV2umKXCt/9k2
	mujYtySHxgT0EjTe5UxefJY5eOXszpbrc6AudiNzy8oqDKY9/awdPdBU7RZPGc5lJ8waXJ
	JIIbayy11fuxnk/6EI2zpYtDhHR8fQg=
X-MC-Unique: hTOu-7pbM5Syv3ujHYx_Hg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qd/aGnLaqz48bqZegufWTkFY7m8+O8PJM/HQHvH3sASPijuBi4tUBdDDTM+f8WeTk7lx9xQuOIo816/2QUs2WQBVRL2K8VRK067aJhDQfjPlQEf00Rzxh85glMNdzuMbiNMzB2D4VbgBkcAaimv5wPBQA8z6M21SGhSHaTIY5M8EeCXPTyy1tSpfxJLvnDP73zKfcLcPu6cDE90+0qd6YWfiiyPG4WOlyMEXvIKxlAm5yw818N2jC147TUUMlse5WXOUO7X9++TfOuIe83JuuG8vGIUvvkcFXP4Bf2WQw42wRj78WX8BX9ICkUryhVYIPh8GvSDV4194z5yG1Bqafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWFdSE24icpcZTDwVntd3e1oBj5Dp4X5/YgJhl8hgqo=;
 b=mVszAjEOPJIpg+NvzjZsfmTNNYtVRMc71EU7WL8bg64aQhReJgRK4ruc0VvsUDe0agQT7u92JJoRab1SRBvqoexDZGtqmePqFMWqUyygj0ixmCDNggRezPjYY4mJxRQfgpw5+NGJ5Ai3K4BB7TasHUpwwhMmQlZyxEMZI4Pbgj+T1jFLwPQtH84NR1ZBEfaEv46Qi1LDTNTJ8i482O8KJH9AhRvH6F4TjdAtsgmNPD6okQmgZDSFc5fYhlzx0iMe+WB5Ta7afE+p2xGGzhDQlxEalayCnbqLej6b14vIr8bqCTSJ9wtKO5XroqlOQBInjF4JmxiQYUe9gJX3/GJ7Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7dd52b2d-9fe0-0ece-a7f1-9ec2c6da72de@suse.com>
Date: Wed, 12 Jan 2022 16:27:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v5 04/14] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-5-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125110251.2877218-5-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:203:90::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15e65224-2eba-4410-5659-08d9d5e00d96
X-MS-TrafficTypeDiagnostic: VI1PR04MB3296:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3296068ACFACBD8A0C71A027B3529@VI1PR04MB3296.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+xaf7KOkeKcwOv1YIW8lvw9RjGZ7kUGomkeyZFQ4Km0HTVsUNOjIVMb2ytVlDg5nQSnY90F+Y/lZYpLnGPbYd4znYFrf7iUQZ3QBAujIbxwIL/t2gqOtR28wBqA7KQsSAyEaPgzWK1g6dneFflEGBlo7zAQDB4NN/IWIWABkZHruKYtKpRu2jPDQemCJ2ux1Pqj+k4f2uJMW36KZ5Fwuu7SSyup68qvvo9/JI4bQra4Da8LpGaBqcACz73PCBI/Bz0Hz8/ho6HMVS1uzXP+Y1jXSVWH9cZu9zVl5aLanq8rFzYAd6hyXQd8XRmN4z8DLSDGv6OukiLoO8QI0Y4QJZcvh2hGirr2k81TeXIuAQf1rdoqyTeeqwuF3qFlzvO7fqBwrPQtaGBBoNwA429TxrQbLD53PX9gmnj4GLQmD7TTwpqZHzbpigvtQbzBeUAwEZQTccjvVjuohVzdkodyG7Vk7vDqY4DGtnfBNHBON8jQKKjjTNcmXmNrDYYZ9hpHIhhh6+Slc76oXpKN/WoFSxbjjXRFn56+pkzOGoJau7Dpl1oK5Ni1Xl1QOMGmRlfL5mEdlb4oLNQr5odkLA2DZln84rI+VbE4fd4PQe+T0RJCRl0MgpxUS8+XXglKUqMhhxrybfeZB7fnWWoACVgni5zFYAyjZGe2D4H/4GS8RTWudbWm7ajXBlDeHXTgw33JZitFUnOmaMH9i9FDn6QLu4FL2KWR+G1X0TF7OHcqOgLCVainOsl3VYIBSR+NbYdHk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(316002)(36756003)(508600001)(5660300002)(6506007)(2616005)(83380400001)(8936002)(6512007)(38100700002)(86362001)(53546011)(66556008)(186003)(31696002)(6486002)(26005)(4326008)(2906002)(31686004)(8676002)(66476007)(7416002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+LVAbZbw0CzeiPLfdrsk0G9m3tYyhlBLdgI2XPPDm1mTpQTHVsTKerHia4Jl?=
 =?us-ascii?Q?0kdACpd9S9glxHR/ofc6lltnJWJGl77NhB6pAI/KdE3FrqpuVi1JwrGvp9ks?=
 =?us-ascii?Q?Vdc/d/rS84C/HMqrXpc/ruNyzNFAAIKCag84Aar5sTC0+cK8BKcoEmlBuYvn?=
 =?us-ascii?Q?0rllyY4rwynCz8lwppSnOUciiQXA56n7Za0i98vaUrRP8rt3f3YXQSxxTn17?=
 =?us-ascii?Q?YjAzg9kuMJID/W6kC21i9HmtI/jK8NqQycCNnwu/cTUZSLN9UAU4gzGym/IC?=
 =?us-ascii?Q?7sjDc7PDzFdnKPXH4lcXTAbhBEnaZG+e5ciCu5LCRLzsQhUlN5iu0r98SWQQ?=
 =?us-ascii?Q?Zc9v8w6H8KURArU1JSRQzacIX1CnS18KKGsTXBnd/SSf648lpn3HIl4ocudr?=
 =?us-ascii?Q?w8cL3f6EB/458i1iVjm2UFGSTkzflAUhbiwkVcSnY6FfjYUTJAqRR5OUhkN3?=
 =?us-ascii?Q?K6gcO5jXWHUhjUhW+ea0g5kn/h+Y/RLaHeWpqIZIeLRt8SO3mzYNioBndguj?=
 =?us-ascii?Q?SNcu8uCRsAKHRnV/OKhtIXD9YOHPfxsFGq0kz9XVuuAvZq1KSv5UXpD9GXhD?=
 =?us-ascii?Q?+t51oGd0G9nUznde0/6M6F6WfqyXi1X3UEK+qerAJq76dBiC0GgwXJGgU2wY?=
 =?us-ascii?Q?YworqRfQXyNGM+ARRuDsOyOWMHUv12LJ+/DTYV6HbgRHhh6EUKjFgziOQEcv?=
 =?us-ascii?Q?GNeEU8A6ItHfiHia5ol14rOr8McYHrPDZfPWqC36L9BnsvaMoBqaYgPkRdu0?=
 =?us-ascii?Q?dhoJjoALSriCi8axOfARjspIZeJEfCZX0lZGUDgNZ7TLM8/06MO39wSmXJKG?=
 =?us-ascii?Q?kzDV55rR+X4zD3QS+6GZ/Br4qWjWPmOFcpwqGBqAvCIvIC2QGPXXL+W8aPVo?=
 =?us-ascii?Q?RYa/4iDb/pcO4myxJ1IQ0TaPqUYdthCrIxDvbgxfnKbUn8BWiAuzBGbTyg00?=
 =?us-ascii?Q?qe0Iey2rOMy4rkjoWg19rDsJlRuWRumu73toSryIX/X2cMy3nrT+PnD97ZDk?=
 =?us-ascii?Q?kO+76vesyC9A/1V8a0aaczUVsLgNDwI15avvJG0F5u/MwNzb9IIgKVGHztXV?=
 =?us-ascii?Q?aFnW9yDC+EqZCWoK6TA6lNIQqUiv8gnyr/3msAChvljrd+EDA2CM7oMpRjH0?=
 =?us-ascii?Q?ajWeVkpB1JBQYDEdjPayS89DltEmb7chv2joWEAlVzH0XmwdfO2p7q39Z2Op?=
 =?us-ascii?Q?cMLsbvVV6pHJCRTHUguJ9RJYk9nbHPw1R/91E1Ip89r+CaKIg2pnlQlYpX+0?=
 =?us-ascii?Q?A+TRZZfOfRaUJjwFJ5yyQqVP53mkZIRHAiR4J6VNR72b0Du33FIJBxzz4ftd?=
 =?us-ascii?Q?g51NVv9DDQKkQJYYnE9HaydU2lALBS5KYupkYKao5Mtvf4kWzlRlNnQ/fStu?=
 =?us-ascii?Q?usNALDk5NHuGKXr1ihglYdIAQem23NbUyQgTCsmp0/zpZ+daCD8w60uJtIrY?=
 =?us-ascii?Q?PwUfvVXCXy4oxV+6PIYbxAWVqOj5cp6RhI8hIowFRhnVa1OQEAOWGTZXcE5E?=
 =?us-ascii?Q?cMtVUhQ4QunAvEDgiTpo6UKoAITVlptxjEDg/Ulj2gdN2lrh6xhOLA3EAJLQ?=
 =?us-ascii?Q?gb2MspA1QeZfI8BbabmsvUamSWNdT9gQImwun3ebnZ4WWag/UAonDdOKIYY3?=
 =?us-ascii?Q?VnDtAN5aa7W5VQpsXhpc390=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e65224-2eba-4410-5659-08d9d5e00d96
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 15:27:32.8771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRUzVOsOhDVk6d0gp3PeLB9YpdjZuYqbCh3xilLk+JYhLgaUT5iOiqC8WJBdIrPpbIpnXScSxNIGS+kimxs0Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3296

On 25.11.2021 12:02, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> When a vPCI is removed for a PCI device it is possible that we have
> scheduled a delayed work for map/unmap operations for that device.
> For example, the following scenario can illustrate the problem:
>=20
> pci_physdev_op
>    pci_add_device
>        init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SO=
FTIRQ)
>    iommu_add_device <- FAILS
>    vpci_remove_device -> xfree(pdev->vpci)
>=20
> leave_hypervisor_to_guest
>    vpci_process_pending: v->vpci.mem !=3D NULL; v->vpci.pdev->vpci =3D=3D=
 NULL
>=20
> For the hardware domain we continue execution as the worse that
> could happen is that MMIO mappings are left in place when the
> device has been deassigned.
>=20
> For unprivileged domains that get a failure in the middle of a vPCI
> {un}map operation we need to destroy them, as we don't know in which
> state the p2m is. This can only happen in vpci_process_pending for
> DomUs as they won't be allowed to call pci_add_device.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> ---
> Cc: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Since v4:
>  - crash guest domain if map/unmap operation didn't succeed
>  - re-work vpci cancel work to cancel work on all vCPUs
>  - use new locking scheme with pdev->vpci_lock
> New in v4
>=20
> Fixes: 86dbcf6e30cb ("vpci: cancel pending map/unmap on vpci removal")

What is this about?

Jan


