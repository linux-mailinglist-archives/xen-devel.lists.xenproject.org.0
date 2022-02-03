Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6354A85B6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264800.458038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcjP-0006WE-BR; Thu, 03 Feb 2022 14:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264800.458038; Thu, 03 Feb 2022 14:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcjP-0006Td-7R; Thu, 03 Feb 2022 14:05:03 +0000
Received: by outflank-mailman (input) for mailman id 264800;
 Thu, 03 Feb 2022 14:05:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFcjN-0006TV-UE
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:05:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 467c40b4-84fa-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 15:05:00 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-c1IDmQh7Mjy6d3luFvArDw-1; Thu, 03 Feb 2022 15:04:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0401MB2267.eurprd04.prod.outlook.com (2603:10a6:3:2b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 14:04:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 14:04:56 +0000
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
X-Inumbo-ID: 467c40b4-84fa-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643897100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ScDkqfasUl6RtJCwketVb4VOq3IzD9NIKTJM5lYSMmA=;
	b=LK6krTlO3Xli5exMR6zj8rVMPd74cRE2Ykb8RPUoVWqhztEMwgJOe35IjMYXCo428TO023
	IxfqEGmZz8y2bZ9sSWcMssKeGfIV9V44Doxg6PWCUdbCOvG+g9FKLOBihqYgMQLwohEiZh
	c4ty5Hi7kcvdVnelc1zVqXSwmIZdXIs=
X-MC-Unique: c1IDmQh7Mjy6d3luFvArDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiaxVZ0O3QDKBSuuvZ5kOPpYWYeAnUS5cgP1PVxr7nJ6Cafy8G4fvRME6GZl23PxSyy4a2+NjMO7XzEyduKw74CxfM4+77m2Edyp4DLgQ02qI/IUNh1W3wskBghE+TfwLNXlC6zeYbmC2D9mwAf1S+aGw4D+Ct2VFIgsTQp0D1DbIQkH/LZg+k4cztFxnw6Dsb6e3I530ThLmvQwK5hpEQhEIsbEpNaeNexuMIydR5uvtEv+hJkmJFWUMe7Hkg6yf/qZyjmB5bn8AIQIEVG3nSxF1J5f69DVkfJDZtZaTwWIf6BhHekQMFqk32GVsigQiojm1ZDDxt0u1ZuHEcn9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guEwFPsRbgbhwZ0w+ILIYeqg/kkfC0D/Hxs0UihSAYY=;
 b=ich3hpjQ6FUjJcv6TYR6R4URZnwvIXE5MqqPLDHqj7v/D3x7Q/zjXZPItqdrEZkQijNYG+r5yb043ErK+ZXT7Y1Pa/agtH1PTE/jGPHcz3e8+cH/hq+uvjbnS5J4SadP/xlyHnjBHAIyqXm0+EYEkP0ey9d4O04sgMSOwy9ZJq3PMFVKoVsMcuZUOYUGv54Uce/K89+pN8sLFrZ/YlUj09tPc4xpxy63aykdz9Y/hurE68ohQmO5JgJ91wj+qv5IDxjAlXDixAz9ZgXk9C0zztuSyJ5DBGZTJzxMUHW/ZrZYPCvpuU2bUQmBEy8fx36IrdfELMBpY7eJWGTunGcUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be1546ec-0465-9398-9681-7e85e2ca9455@suse.com>
Date: Thu, 3 Feb 2022 15:04:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd8RJfpEalnfl+CC@Air-de-Roger>
 <d493b022-3c78-1721-e668-48f4553056a9@epam.com>
 <df98cdbd-36fe-0386-c068-2a1540f10188@epam.com>
 <9c1f376a-0df3-67eb-7fd1-bb75ae130e77@suse.com>
 <0171761f-d90f-3e3a-5c8f-e32d70096e27@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0171761f-d90f-3e3a-5c8f-e32d70096e27@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b05823f-2605-4be5-fe16-08d9e71e2890
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2267:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2267B7CECC8AB34BD8EC088AB3289@HE1PR0401MB2267.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	glRGVBd7BcWO4p/5y8VGW8bkoQQKMUZth1w2u3xosrrFXTyyNddpLuJFzztkF14vHkEzLuXnES6DQ+FU1BjJo0dqVH8TIJU3SxCLtkwhkPkyGihmVQTq7t54z6YCbgCYWiz5xIEqE7UNlAltfChQnMFxnopmkP+VJaNI2WWTAXbqo9+tib+7EsmqOGuZOoz4TFzzxYSQKm5cMxM7CeqzWGfsN4YKtU7EsEYD+o04hhPHG0/fR/mi7Ku2PIecNXczPWbY6IbLdaQlOUgsjnhtz/oeSIVrQO0IQ43QDYsJ2U4+bWd+aOp/p7Z1LO7bzdkl7E3oLLqQdT/dOJYxGRY+vbv+N97/jipyK6Ek7G15mwzwtZTWtX2tqGJOnmreWEIG5pn2Zc8Uj9qYPCFuoGOPoc52twcUA986fDL48C3ENkFYHDgD1kZKA34y2qygaUhjkPokTvQQE1t0k2ePiVpfK2z1Op2FmQwzo6pd/1KExwA6DhQdifrx/20bE+q+uVIO6wMVAUKJSrqPP7tjWYtONMNlH0FRdK45g+xAbXq8NLYd55fZ546iX1aB/TDKRdog9yi24QgYAmZ/CcvK9rHHpnay1JEXzetUltnD9XGNTTqf06UyMBOB5uE1Z9+OQnwk01YQ0ADYfKsyrHvwxXHJGIUML7rVu/lRPBIV5OA06Bc8pnZxp0XDUxcxB1XcNARGG6DzFvMZsNJ7kz0zOfvd9Ng96UugntYPg9FikRKBCUa2V8dSgLkS9zX+Cm6hZZgO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(2616005)(8936002)(66556008)(83380400001)(8676002)(4326008)(66476007)(2906002)(66946007)(6512007)(6506007)(26005)(7416002)(186003)(5660300002)(86362001)(36756003)(38100700002)(31696002)(316002)(508600001)(6916009)(54906003)(31686004)(6486002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q7D/yP20dCgjGcPD4RNhoPF8F6LZF/RFFAyUku/flg2nCN990fYNWzwlQ8o7?=
 =?us-ascii?Q?UBvsdzI/ChdQc46g+c7hQEmdoCRKl+wLVUCMavNnEQynDbA5NNwb0Z5PDIDE?=
 =?us-ascii?Q?gc4a0SnPMAiQ7k+PTLGm3nnHayfWyKtCwPqVrCERm7F/UjsGtZKH4XP986mD?=
 =?us-ascii?Q?U6JPXunU4AAqdK0vgQItu7+aT1pCJL9prR9OibuazC6INH1AZTM56GB0DKFQ?=
 =?us-ascii?Q?72mxoe5seeF+MrS2cBiLJW6Mu0ogg6nF8RTH6cCyQWXD90XwlcvT681Ql2RZ?=
 =?us-ascii?Q?qqsC/OjU9eUhNHqQ95pEP48XuAaSo/BcIlY6DxKuUEFyUMfRsKGQ3JgxtNsL?=
 =?us-ascii?Q?BhmcWku2AajWLkXz/CZD+rE7wUg1qS2BNfQz7ELtipeGEQQIHJ12xEQJo8Mk?=
 =?us-ascii?Q?i6vVV4ICtqRXn0vOD8uc6ochpVfIHPQj7Qa4PrOW0cz66FWN64DGon+V/d+3?=
 =?us-ascii?Q?qhxik28xacpPiWeCO1GyhDzfMaOvWjMbQYezwvWURZOCW+Zfmt75/KCnK6Lu?=
 =?us-ascii?Q?9nBxN0aX3/MMAVhBQ25bj1Z1h2yescKcivFzhlejBnY5cwb6ngtlcfPgzg1C?=
 =?us-ascii?Q?uzKdigGcaI1McRGziFWT86GYKp401K/H+suK5Y/2iuWNSfX8ESUMAXbq7Vxj?=
 =?us-ascii?Q?daYRZfCyzEkyfwrhn6g55ZiW/JJPgfuSf7PQcLD88XVpqlvthOwZZ8O6OI7o?=
 =?us-ascii?Q?LOxIY3nPPtWGrbz3tKxfcmOtLSCbP94m6+viMrLAp3ZBoxwLqGb+JfnLvMX0?=
 =?us-ascii?Q?A1lxxNMKa8TqLMz5GIQc2QaQQoeB6/40Cl97dAJQ1oo/EHhJhzmF56/leTkj?=
 =?us-ascii?Q?/kA5dBoYJZ1DH9rdoOVQjZBdqVljU3vcUDqETqm4ga0emMzh7O+PUKqBaodQ?=
 =?us-ascii?Q?o1NPtjRKFbElVxq9MNZ9+qLWYWBG931WyYz7KahEW/l7mu7uQAccc3jsFCAa?=
 =?us-ascii?Q?6ELEhR8uaNQz47Y8fwAoxI3Ii1LViu111aUQnOghqHK7XdkMDwtgfNG7528o?=
 =?us-ascii?Q?DaSrrET4wZPBJQ6DySbLoh8G07uLnc96rltHH+jDz2J7lql4srH2Joqcidmk?=
 =?us-ascii?Q?U7//1oUq+uAHO70P7R+UEzrF666C22KGoTNX5qLi/Xm1JPfxSydPzD0x+k3+?=
 =?us-ascii?Q?9n/kzo5oBqYmKcTA4iu8mZcmrQZI9m8Qie3HK5t8uVfBuX9U3ke+HEHy6jGj?=
 =?us-ascii?Q?vVkme1eQosNXZ+31oYdYLynsKJXusfu7zLQwGPwF93VezbRKhzkIY09rd0MF?=
 =?us-ascii?Q?qSwLiVsnJJKWH5uhs6rOf1nvzRphSa/mhZSyJ9IQwtMFI2pqyZ9EVI4g8QOP?=
 =?us-ascii?Q?NsaRzJHguiDdGHan+EJPc6FzLG2Px0ZmUvB3K2To+b3npdDOrubBMa85cS6H?=
 =?us-ascii?Q?GNc+73yascqMIPqlXdRd+jq8ZFBfohYAl/bqQFas5mh68D6l9PSCogp2tQYI?=
 =?us-ascii?Q?5E7XGPUBVO9uv1NlXGXl2uOhq/bfxH5M0hdhlHDVkv8wxDhcmJqRehs3deXT?=
 =?us-ascii?Q?oHBiuw3ttIJrmCKrQgC43107/faR71n3QyZ6DhwVFdl1pxvKqdE6IaFpRTFT?=
 =?us-ascii?Q?OBlwzX6ZIjVWFRimm6x9dJ5IwzUWz4fcktMx0Gpe3KbncpzMqYkbQCHyHc+T?=
 =?us-ascii?Q?qe7NcQt2TIuce5N6IaiRjNc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b05823f-2605-4be5-fe16-08d9e71e2890
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 14:04:56.7136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGOs6mqImexZ9H1RpPF81dNcndFsytKXZmpMRKCND01TC2dLLjyhGfTr/se2dQAaHYvTVKVuYJeruqcANnspMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2267

On 03.02.2022 14:30, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 03.02.22 14:54, Jan Beulich wrote:
>> On 03.02.2022 13:45, Oleksandr Andrushchenko wrote:
>>>>> Also memory decoding needs to be initially disabled when used by
>>>>> guests, in order to prevent the BAR being placed on top of a RAM
>>>>> region. The guest physmap will be different from the host one, so it'=
s
>>>>> possible for BARs to end up placed on top of RAM regions initially
>>>>> until the firmware or OS places them at a suitable address.
>>>> Agree, memory decoding must be disabled
>>> Isn't it already achieved by the toolstack resetting the PCI device
>>> while assigning=C2=A0 it to a guest?
>> Iirc the tool stack would reset a device only after getting it back from
>> a DomU. When coming straight from Dom0 or DomIO, no reset would be
>> performed. Furthermore, (again iirc) there are cases where there's no
>> known (standard) way to reset a device. Assigning such to a guest when
>> it previously was owned by another one is risky (and hence needs an
>> admin knowing what they're doing), but may be acceptable in particular
>> when e.g. simply rebooting a guest.
>>
>> IOW - I don't think you can rely on the bit being in a particular state.
> So, you mean something like:

Perhaps, but then I think ...

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -808,6 +808,14 @@ static int init_bars(struct pci_dev *pdev)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return rc;
>  =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Memory decoding needs to be initially disable=
d when used by
> +=C2=A0=C2=A0=C2=A0=C2=A0 * guests, in order to prevent the BAR being pla=
ced on top of a RAM
> +=C2=A0=C2=A0=C2=A0=C2=A0 * region.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 if ( !is_hwdom )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_conf_write16(pdev->sbdf, =
PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
> +
>  =C2=A0=C2=A0=C2=A0=C2=A0 return (cmd & PCI_COMMAND_MEMORY) ? modify_bars=
(pdev, cmd, false) : 0;

... you also want to update cmd, thus avoiding the call to modify_bars().

And btw, from an abstract pov the same is true for I/O decoding: I
realize that you mean to leave I/O port BARs aside for the moment, but I
think the command register handling could very well take care of both.

Which quickly gets us to the bus master enable bit: I think that one
should initially be off too. Making me wonder: Doesn't the PCI spec
define what the reset state of this register is? If so, that's what I
think we want to put in place for DomU-s.

Jan


