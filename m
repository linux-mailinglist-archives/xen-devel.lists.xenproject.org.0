Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E282458C8A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 11:44:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228753.395883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6na-0004dv-4t; Mon, 22 Nov 2021 10:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228753.395883; Mon, 22 Nov 2021 10:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6na-0004br-15; Mon, 22 Nov 2021 10:43:46 +0000
Received: by outflank-mailman (input) for mailman id 228753;
 Mon, 22 Nov 2021 10:43:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp6nX-0004bd-QL
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 10:43:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f9bd2bb-4b81-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 11:43:42 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-ezdCsl9hPYy0UBZbS02Qog-1; Mon, 22 Nov 2021 11:43:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 10:43:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 10:43:39 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM6PR10CA0098.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 10:43:39 +0000
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
X-Inumbo-ID: 0f9bd2bb-4b81-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637577822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZcikmswW5I7Qqp6lISxfSraaS15PKiaAQrzP51iycM=;
	b=gJnsLSDk7vyEwek09RZIyJrLVNvCnSUXHuJv1p8urfLrZ9z1ew1E+Po2hJslnE35t1wxr1
	c7hrB4RAF7/Y+oWNKwFrAQeb8Iewl4ZnegskL16Ev1GZOxphu+LtYS8BY7cMdNIDLkdsEb
	TBlQCjKNYBFlHse2eJIhdMWuYg+pDPs=
X-MC-Unique: ezdCsl9hPYy0UBZbS02Qog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoB2dJLiOrVXCVNLUNckDhsoX4EoNIr1MVkpGJWx6VwldjJzrIjSkmCx1rV00TCBkQ1mK1LU1dIBzXdVH+ItkcPu5WRXw6WwynkpijvkMPsT4cGAV2UHJUGcExdfaXTGiwJOEQtikirvnFfk76KoodgkSaxHHrNb1wRjJYqkuw6FdQj3p8aPuVPcaStMPtI5kp7/djTNS5l/keaqGoz5UR6zJk5O05OOJzSsI/UZoqISaxfS7pCoXSoe0oRI5tXtPZgt1mmiLVQL6e1Cah8ZRHzOnsf3zR/zucHf4poPYErWS6ZwdMcj6jlMbfQVi3dARYoYJn2vm3M5sBJ0Qa+zkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdAnDADdZvHAbA7rz9ndwQXvpVWPYHtTJsLbFz7+HYU=;
 b=PTTHtXp1UGvlPB5rX9FMNuSwiaYpZ9MkWkXbulQaQvBxbUufCGYOJHt88b6IDMjhMMACsynnaKJ4enPRpkJE2biKhnU2J49Gyh02nIEtg6zliDVfDN1n0iuOOAhvNB4W35gF8lCFUPLF7MroP4E8lH29Fm4mHOx7sY8NrgyNZM3YQcq+1tHYN0dLWr2RYf03AVmf4OuTUGFvXjTE0Jg8RrcHnAVI2+nLR88brZPvwaCrlFhmnnUlBCfgiKxDngxlUy8vuoI/QMC+L2mn0yKxzSMaNOHuLL4i/QNwBBTsBWoDQ7ktZ9nLpwnNz77kqjJziWh+DWGrr7kz69JatKUtgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1aaedc6-73c5-e4ac-91c1-323f44d83687@suse.com>
Date: Mon, 22 Nov 2021 11:43:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/2] vpci: use named rangeset for BARs
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211122092825.2502306-1-andr2000@gmail.com>
 <20211122092825.2502306-2-andr2000@gmail.com> <YZtwj0OKrNaZ7s5X@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YZtwj0OKrNaZ7s5X@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0098.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfbb05d2-0957-4ee1-3984-08d9ada4f1df
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4845AD33B36DFA4ECCA5DC22B39F9@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:364;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KD6xVnwSfDggfDoplZoy52RG6stDKOeM52l+SCDb9i1F1vCoEE4nhzvs2rdLV0tR/5Vv2ILzk3+tWDCTbLFlxRxT4Jl/wY8f48F5fybzp+L6CaoJSZtv1mTK80xnIG9K5VeQuxs2aXL4BRsvgzxz7HU5eAZBTjoSbD/IJTg5BAFsHIwcGMHS1EYLsau+OFYxzqdjnrB7h24PmcJ2plZGqIURqeRIqVU5soYrKQAPtzRsbkVUbaxRiBbzzJRL11ve9WZLdF7QYfdSeQXMP7qMscPT8nR0iy4LkkAnaL22dCNoslXDJ80TTcqtv5IGMo73RNpK6SiIS3RRjCzNobuMmoSIopC/HqwpRsOwxeuxD7Bjcwbh6q7Yw/MQSzGxRGL9cGx+lQyg+BARX3pWwauCVgaKXupnm2276K8ccFbtvrheem5n3wYDblEKXKZL9miaux2JjO7eJIgUYNaN9OzMz5oUNPjGyuceGJcieBs+ckjMbGmvl5s7DvFyQAouKg8+eXUxlSgGmCZwCrzduDLiHZrm62YtMoTn9XuUn/LfEAfK2EICHHJZfb94Gym9hdGVQoFq4Exzj8fiZAHqBFYis55FfwLVjLldCxreEu7m6zZVVMKAmJXbiBjKSrMMGFj1vny/tEid+5dQ5IkHcaHH8vqJUZG8tXmGOFWbG/GwJ5XdoNngWNASiBYTF6dm1R9eU5qIgOhIozreR07jOpOJLhslj/GiQ4+SLc4LGbEJWkuUbgacCpLu0J1yykRjixNb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(316002)(66946007)(66476007)(66556008)(2616005)(31686004)(83380400001)(6486002)(8676002)(5660300002)(4326008)(31696002)(38100700002)(186003)(508600001)(53546011)(8936002)(2906002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zuaQzbOBMns+Nz2J+GZBaRdW8isHxfXtAUHpJCxXO7FF2PHXO8L4GJfvZj8J?=
 =?us-ascii?Q?qoNr1L6Nzg6h53Lge7f3bXXLppR5Sfm90nGa4P85uKB559RQO+ue0r6UhhaY?=
 =?us-ascii?Q?SRv5X+Ir6YoqdcGvEbCXtR+wKi2gEKcoXRXfFt/y70B+E0SZpolRdJk1qLHD?=
 =?us-ascii?Q?C/pwqP91kR8EIJuI+GdTXJqMM2ob5YM+7Y5qg/vlqxp3dw4lnkexnNat/uTB?=
 =?us-ascii?Q?oYiZSO8Xhadb5gUw1JEHxtziHVMEonALihfpzC8Q+Jm4B9Z5B0qtqJVIckin?=
 =?us-ascii?Q?/J+G+z5gEs3m4nc7K9BD4nQ+r0vrjcT/UZeF69XZMfdULHQgsGlsIwQFQwqK?=
 =?us-ascii?Q?0q0TIgiAcAbWcEUgLOxHpYefm7Dh7wKZKvJ7M7aB58ETZtQybzCwnr9VKGdK?=
 =?us-ascii?Q?3j3i7CYo++OtzJoPtc3c1PQbBUl7q1+UWLSuo1wJ4kHYyRWmnphczY/zAQtZ?=
 =?us-ascii?Q?EkqcyxGljScCY1fnTelv6WsVXt/+0BFRTdcEcZo2NtygybKkWytTiZ0jqZRT?=
 =?us-ascii?Q?yIGyxkMuyzedcTpTFuxl0hz2eXAU/93N3nSQbnQU9g+gdq9Pj+w60+bhwIA5?=
 =?us-ascii?Q?e4+TVr/G+Dn9EtizHTQcAlNd3JJw9lEqHB8cvq484phUJ2EWnMWNJwE6+flZ?=
 =?us-ascii?Q?v5Ruz70oKmUWrEvQe7aKdyYf8kQjAQQHXSSccpWtdAL2g753STb+iJtODxd1?=
 =?us-ascii?Q?AszhMMolsQUOnllXo5Nkvw/MvQbG6oNrAsOqw5uh1QQj55c/Nx8fHLVnFeSl?=
 =?us-ascii?Q?IpSQTOuJKRXHE0xNjPKjIb+/IsHqxtCGpQJ4y04RBGTKXS0EYBPypUqK2/UC?=
 =?us-ascii?Q?1RfkdbPuMrRmtIMjLJzHjvMFfgUwscBjvXyqtWmgDMXL1PmbL4MQws3WhBIT?=
 =?us-ascii?Q?8NK9sQMOCQIAHhYZQgytlKNarryyFYmvD2Zfy5iuQjMiyWlYAfdsTmq5n+hp?=
 =?us-ascii?Q?mU3+D2WnVzNr8gfx+UmXiRoSYveu5Eymcp8HWjddZZFuQNArkKsd0Pox5pe8?=
 =?us-ascii?Q?lMInWmGsTDix9QCy9x3SDMaO5f4+cEGHZsEw5BTzZJmJQuhy4FbWxrWvWb+e?=
 =?us-ascii?Q?9umpOOQlx5G0LhY7TVHILSfSVlL4vqJ0Pej3gVDTgkUJQytH9j6t4PMMCfiK?=
 =?us-ascii?Q?B8eVtFb/J+IkM9ifnM5xp04ZWIwBXJnYx0ApsqF+UW53WNZivfxdj5uOx2r3?=
 =?us-ascii?Q?eNtt56x4iyRoSbt0ToN+sdDpD8l1itJQwX4TVBb/7TgdxlwMZXA2wvDQzVvg?=
 =?us-ascii?Q?SjGo+WouSv3wnY4cfcSfYbCqeaiN/DJoCuoes+puwRv1mNffNZrlfHsxjpTT?=
 =?us-ascii?Q?/q1QO4s4mHueveOnrk5RzzYJMUfUyrLLeJYMXDrpOy+VMBFhXSXQCMRH+hgz?=
 =?us-ascii?Q?EI2hE2a4ZOZYHY2qOe9T2IjVRXY7/+faUFeY752VmBF04jPgjvNyvi2J2/q9?=
 =?us-ascii?Q?J9t/UfrY39t+WwHoc682LZTmFkdmHYabYrUhuvPU2RPHk1kDJy62QaLWGZHE?=
 =?us-ascii?Q?pm22HaIYX5xkjJ0B2zW1QzbxY+yEKvqHAyMu0S3SLLXjawfelQU57geLuNaQ?=
 =?us-ascii?Q?QSYhh5IU6KXa/6x+oTg0GDaPIh7sCHCwNIHbF8tWnuIfstByE1uYjsksrM+/?=
 =?us-ascii?Q?rJC7jFS+wnkOMRPDQcuiYW1S8Qy6buKTQx+J0so5vjpLi1Vwxnn8JsiRnoDT?=
 =?us-ascii?Q?9Xy98Pjgnqo0Zo49d4l7aVcV/oA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbb05d2-0957-4ee1-3984-08d9ada4f1df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 10:43:39.4805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVQOzdRl+GU2dE3l1u1v+qU8fO6ucDbU/XmeGo2HcTHTT1TbfIYC7hhpXnKxCJbX1HJ8gIFS85FULgXqnJN6qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

On 22.11.2021 11:27, Roger Pau Monn=C3=A9 wrote:
> On Mon, Nov 22, 2021 at 11:28:25AM +0200, Oleksandr Andrushchenko wrote:
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -206,12 +206,16 @@ static void defer_map(struct domain *d, struct pci=
_dev *pdev,
>>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool r=
om_only)
>>  {
>>      struct vpci_header *header =3D &pdev->vpci->header;
>> -    struct rangeset *mem =3D rangeset_new(NULL, NULL, 0);
>> +    struct rangeset *mem;
>> +    char str[32];
>>      struct pci_dev *tmp, *dev =3D NULL;
>>      const struct vpci_msix *msix =3D pdev->vpci->msix;
>>      unsigned int i;
>>      int rc;
>> =20
>> +    snprintf(str, sizeof(str), "%pp", &pdev->sbdf);
>> +    mem =3D rangeset_new(NULL, str, RANGESETF_no_print);
>=20
> You are still not adding the rangeset to the domain list, as the first
> parameter passed here in NULL instead of a domain struct.
>=20
> Given the current short living of the rangesets I'm not sure it makes
> much sense to link them to the domain ATM, but I guess this is kind of
> a preparatory change as other patches you have will have the
> rangesets permanent as long as the device is assigned to a domain.
>=20
> Likely the above reasoning (or the appropriate one) should be added to
> the commit message.

Or, as also suggested as an option, them getting accounted to the domain
could be folded into the patch making them long-lived.

Jan


