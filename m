Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651CA456F3D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:02:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227883.394255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3WM-000601-6r; Fri, 19 Nov 2021 13:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227883.394255; Fri, 19 Nov 2021 13:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3WM-0005xv-3r; Fri, 19 Nov 2021 13:01:38 +0000
Received: by outflank-mailman (input) for mailman id 227883;
 Fri, 19 Nov 2021 13:01:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo3WJ-0005xb-SI
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:01:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1b4c749-4938-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 14:01:34 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-KhUTFP3wMQG5p-uWI6enmA-1; Fri, 19 Nov 2021 14:01:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 13:01:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:01:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0701CA0065.eurprd07.prod.outlook.com (2603:10a6:203:2::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.17 via Frontend
 Transport; Fri, 19 Nov 2021 13:01:06 +0000
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
X-Inumbo-ID: d1b4c749-4938-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637326893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l3m3b2AtaHUE8ZHHHVdW19u+G4FZGg4/IgQcJjG71Y4=;
	b=Q8xH0bKKxGDWLQ9eNN0CJ5u3MW/0lUkBiRLmRsnHQZ98n9u7Tn6P0tEAcizJM1T30ElUwQ
	g4v65F3IspHngWzapMHlxLoFto7wDSD3LFeQdDgP46yUWgz/kIazE8dMB59d940AcVGEwf
	xkbPFzgxNY3b8S21kxcdEzfAvacZlcg=
X-MC-Unique: KhUTFP3wMQG5p-uWI6enmA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JD3jLjNp/E2LiIGIQOd5XcRPs7aqtyXcgiqTr1AO6zqdP8dNHm2O6snUxZmY2zia+5RXkSUOhrb1tqstayspYQRC1fJjamwHuwqqCGZGusZr0nSkrTbfnichoMtX5gIkrtZKnPy037wm1gyxRakhcsMiJNIwLlXbYJ/Eg0fd2UCTEx8KLOHm3yUWVDtDZeSchc2dvEl9eXbjBJjcCSjkXIMKxS5wJg4l7msb8TBytOCGW1dYuz/F7hRgx9nWnFTa4/IQZxTjd6mu72UZVzt0HfL4z5cUKvrd+HOYgKojTe/c4gmlhinDXiERljHZXGaM8lrcvFDCg5QKko5G1VB7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoXtEWcat3ZJ0NsTKaaM5NBTp3WHS2TcIAermQB/Scw=;
 b=buGnLYl14sd0pBwkt07vsJBxXa/1Ojzy1jjOij/TdDr3iGiKfbpWNRDmcjeqtgcxj+EfScliCIvMprW6TMJLsnHdJk8VVejtd11FJuRcRR88WyUJWR3qp8ENQxZMfp8JR8BZeqfyuyRtQbFCZvPax02AotYdEqxhPAJexxudEQRqGpHFe/OnLndPraNnResBA0pJMILiZk+3cxi0YP+eC2wZr6p8jGFAyVoIcw/EkiiA9hHOJXwosbyd/ePb2Gl5qf/FSlJ9ldVuYRcUP0cBZkFjnLUZVedFtpZKuyc65JjMW2SonVxIuhIXUH6sAxuJ1ewzSjx+nzigoSW7Hbvgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <126a2864-e7e3-b887-43ff-55b1e59151b4@suse.com>
Date: Fri, 19 Nov 2021 14:00:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
 <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
 <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
 <2db325e9-0349-1cc3-1c4a-fefa048f181b@epam.com>
 <ac0cc710-05b9-bdae-c31c-d159b4de0105@suse.com>
 <00e78d11-8e7b-84d2-5aa0-0a7f82f13af6@epam.com>
 <7dd919b8-0e3d-30dc-302a-9964f9d94ad2@suse.com>
 <fec02ac4-1ecf-18e1-7ed6-3b1094d60890@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fec02ac4-1ecf-18e1-7ed6-3b1094d60890@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0065.eurprd07.prod.outlook.com
 (2603:10a6:203:2::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10f1b639-41f0-4445-77ae-08d9ab5caec8
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3934BB13758989A1B2EB10A8B39C9@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/gQ5nKn1Ho8/1sY00tflZ14UdUXnbpcBxSaisXLloCc8rijBJQFrDQNUBLZFmkxLCVYwuLRSLSiynA34STS8+HjUuDNqkPaUoMOhXYi4uLCUl8N1+ib5Y3jx92NZjKH/HWYu+c5DDzDRIr8jNKjjzNoGZkIua7rADIIh4b+FCMONB3giCLGZobV8mo5wP1uonVTrbcNj/Xn6OdyluRj6VpR17PrJDYO91fMak19IEeigXQDcd+1qssYmQ/keK9MdAED9CuDhwQyI+9DKwgW1A6sSpcxgnP8D4/uh/KqinVzlAV3vNr+suL91zUfHCBMb72l058kphlB+6AVOU2ukU8UPKvI2Hy5uOfKne4Jjx69kYq1BaQ+FEjtDHM5yrAqdXIKSaX7prhV8P5edsuUB+PC/SEu0iXvo3sOtms4yFNL1akOsACC4vBc/8Xfa22kbItGc/kUXIZAJJP4X2k0k/Eu2z2/jC5SxpYV7vrlxNjNdkTRoz/p9Vtpq9733mHFBqGJqZ6VH2aAC6L4KawEln8pncedEjH8ERmnlHIH56zX2oRKK2kEOVGqmfiWN7Ga/vgcKBH8c+LTqIMXkY9FNISNPtBLLba34URK2qO1NN4hzAPXIiTyk894z//bdctonVmwdJIJ2VVOzSBjmbA0oJS3WDOTDzuXoalH9RnQOq16ualmXpjFMOFUkWkAw4Pcvbn/CU/VyERlSd1s8T7K2A6LR0qqnLQ2qumXd/MAoDWM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(66946007)(36756003)(8676002)(83380400001)(316002)(508600001)(53546011)(31686004)(2616005)(26005)(956004)(16576012)(5660300002)(66476007)(86362001)(8936002)(2906002)(38100700002)(6666004)(66556008)(7416002)(6486002)(4326008)(31696002)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ywET9dhD41dBK1Xmcn6G31QaOJrl5vWsbvZefnbADxQk8RDgSs4Mbbvi5YRZ?=
 =?us-ascii?Q?UnT3PtJPXnhRgnzBPuoUDEe8ex0FAQDeaLU6CAYBYDgzgkUtw6CD6LdjBbLm?=
 =?us-ascii?Q?uSJDqLxN3RK6HwMQzzNueJnDsLBJQFoVvXb0Fi9PSyrwAT+tndoOB93i0EHZ?=
 =?us-ascii?Q?Y1kef4vKFI7x9zdgh6D1jsUlKBrddQhuzcjoPote8N6KdEZ7dyE+f4SU4j3y?=
 =?us-ascii?Q?3XkvqcZwEGSu1KNjLt4lmaZEfCW+uHS92gvMzVWNwNUy8RQrQSOqhhZh07Pg?=
 =?us-ascii?Q?R1QkAbDwYbgTdDz8LyMX44Yga1utNvCsm+uO+d8TzXcZ1mB4jTGGDgYvg5oB?=
 =?us-ascii?Q?j93UlPh7fdT5gyyYwlhoO0PJULP9IVNqpQ/iL8YDm1brG1l0le4LkcwAtErN?=
 =?us-ascii?Q?eR6Qdq73ycHvHgdUsDdRMjJCcxVaQ0iwl5RvLlVgmnsq2q2YU5rNEHxMeLQw?=
 =?us-ascii?Q?kaOB3sb9kxYg2uuIh2+bHA7wL+DpHZ+ijcCsbRByQbl5QWaX8xRC/mtMAro1?=
 =?us-ascii?Q?FwzTVrJLKvT8uc278lO9gWk3BCXevJa2VVztI5SB1g06wuZlZcuGGg7kOtCP?=
 =?us-ascii?Q?Q5sK6DiHTs1DSm5+gj3T1oqcc65sDAoADoe8AsKFHUKzOm8tP3c5I07jG+un?=
 =?us-ascii?Q?LYM08On1BdTmERYv02QNYbf+o9PRifhDXw7VURJKekbg5RkRL7eJwPxbTDYn?=
 =?us-ascii?Q?XulXM8Hh1B5RqQ1IPzClX3x5AY7zct+n4nDNltuvAuMIW3yTyJXvLIVq58PR?=
 =?us-ascii?Q?MTMp1udSOdRRhJjC+RzVkvgtBZveI/lvm3lXrhT8/DCnDsU7h8gKCufvCNwp?=
 =?us-ascii?Q?GYfs0IG5td2mrtYeHScmErDjGubajjnf3BIO7gSab7Sxu6LUzn/2gYDZ2FS+?=
 =?us-ascii?Q?w0YWaGNgeQHtqElYm8GExraxihRQAWVhc+26NQmbIJwfadhPUkvITr7bb4sB?=
 =?us-ascii?Q?bMHKJZ2HRcIDhWwfyP4aFuHldnnyBGfYfazP9oUliXGTTwTjT7Az0WTortGz?=
 =?us-ascii?Q?UQPdfpAx2wQ29zSHNP0tXO7rLcgMBhxHrVuzlnuhS4ed6dZwDmImIGhmPAUB?=
 =?us-ascii?Q?UQAMynRWzsU4LXlKzMKyOahTNXOtgpeoqllU+GcLRWONB9FmyNxokEiqrFzS?=
 =?us-ascii?Q?649mnrCwG56A0l5Z0Qn/x10ztaeRq2wSs1iyjipkWkoP90pBTN+I5fTYHxDI?=
 =?us-ascii?Q?q23Bege/PqiQEmNByEYawAtwetHCm3AisgLs9RahReEZOdKBV7Q6YpSDr73N?=
 =?us-ascii?Q?QK8IOvFvWaXClFZX6IjYfUw/o0LymwBtGKPuUWoWkGdaDUCS40sxjrh42+/v?=
 =?us-ascii?Q?doYzq8qgKyiaoGsAzzo/RTizo945X8+dsZrTpRjl0EMOrp4XTGVtXm/K9VGj?=
 =?us-ascii?Q?i4M2saKXNzQ1mGPlHiik7G8854bbMjCzJ0sMqmJcVN/VM9NiE98f60+xXJC0?=
 =?us-ascii?Q?HU/VlwY6ton/1Lvt3VyEp0/igK7cbSFFqeYRlHsfdrhUp6hdaRnTY5FULbvi?=
 =?us-ascii?Q?GdUX5h+kmhV/AZfZJkRABZ9eqI9gEL28neEKpNVROE03Keg3hjJS9e6YCwfu?=
 =?us-ascii?Q?fw8cbaxzKbY4dkrEgXOZVClfZ8KF/dO1j8U+mVAfELuBCRs8lVJ9CqQMvqSj?=
 =?us-ascii?Q?uE8S8m5d0q5H6Cs1ZW0Dxbc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f1b639-41f0-4445-77ae-08d9ab5caec8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 13:01:21.4985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvXBu3cUrav349wjp44TTpt9M2sCMkDJv5YAnOY+CzSAlZaPXuXgkB/N/vL1dyeS9rWEImSwFd6Zx/PgVOZ76w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 19.11.2021 13:34, Oleksandr Andrushchenko wrote:
> Possible locking and other work needed:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> 1. pcidevs_{lock|unlock} is too heavy and is per-host
> 2. pdev->vpci->lock cannot be used as vpci is freed by vpci_remove_device
> 3. We may want a dedicated per-domain rw lock to be implemented:
>=20
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 28146ee404e6..ebf071893b21 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -444,6 +444,7 @@ struct domain
>=20
>  =C2=A0#ifdef CONFIG_HAS_PCI
>  =C2=A0=C2=A0=C2=A0=C2=A0 struct list_head pdev_list;
> +=C2=A0=C2=A0=C2=A0 rwlock_t vpci_rwlock;
> +=C2=A0=C2=A0=C2=A0 bool vpci_terminating; <- atomic?
>  =C2=A0#endif
> then vpci_remove_device is a writer (cold path) and vpci_process_pending =
and
> vpci_mmio_{read|write} are readers (hot path).

Right - you need such a lock for other purposes anyway, as per the
discussion with Julien.

> do_physdev_op(PHYSDEVOP_pci_device_remove) will need hypercall_create_con=
tinuation
> to be implemented, so when re-start removal if need be:
>=20
> vpci_remove_device()
> {
>  =C2=A0 d->vpci_terminating =3D true;
>  =C2=A0 remove vPCI register handlers <- this will cut off PCI_COMMAND em=
ulation among others
>  =C2=A0 if ( !write_trylock(d->vpci_rwlock) )
>  =C2=A0=C2=A0=C2=A0 return -ERESTART;
>  =C2=A0 xfree(pdev->vpci);
>  =C2=A0 pdev->vpci =3D NULL;
> }
>=20
> Then this d->vpci_rwlock becomes a dedicated vpci per-domain lock for
> other operations which may require it, e.g. virtual bus topology can
> use it when assigning vSBDF etc.
>=20
> 4. vpci_remove_device needs to be removed from vpci_process_pending
> and do nothing for Dom0 and crash DomU otherwise:

Why is this? I'm not outright opposed, but I don't immediately see why
trying to remove the problematic device wouldn't be a reasonable course
of action anymore. vpci_remove_device() may need to become more careful
as to not crashing, though.

Jan


