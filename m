Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E499456F8C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227919.394333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3tc-0003Y9-10; Fri, 19 Nov 2021 13:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227919.394333; Fri, 19 Nov 2021 13:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3tb-0003V2-TY; Fri, 19 Nov 2021 13:25:39 +0000
Received: by outflank-mailman (input) for mailman id 227919;
 Fri, 19 Nov 2021 13:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo3ta-0003Uw-MY
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:25:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2eb3afdb-493c-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 14:25:37 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-knv5a8trPVyTsR2qnYquag-1; Fri, 19 Nov 2021 14:25:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 13:25:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:25:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0049.eurprd04.prod.outlook.com (2603:10a6:20b:46a::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 13:25:32 +0000
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
X-Inumbo-ID: 2eb3afdb-493c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637328337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7zW3qLcfzzAXVxDFhUZj6ytQ3UyEj2z83YS7hfAhML0=;
	b=kv+yUPeTSE2CtRuW4jI6QWZR8gWUbeW/TcoP1ttHarkKe0/SYMql+2cGoLz6HtnMv7qR8y
	jmt+M24rD6AGcaDvy/CFzwkZJgUTWbrdz+YD39ysTVy9nDiK1bYBxB0F7iSJ94JAfCN5e1
	z7M87rX3/4gZZYwbrdYx0ZBMQpZwpL8=
X-MC-Unique: knv5a8trPVyTsR2qnYquag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSZJJCNt1I66P88bqYmGpMCT7J/P/GPh9+D35QivG6mCQb18OToKwvUvTUhBR1yo0EdSZy8yKt4Xw9qv7LY55zZ2VNNynvE/EpGJU4GrH3DWTexOaaoB61zMORyfV4kjiLEg+tytfFP/OWe2SqCk/r7qY/1udn+Od0WIX0an4ZFb0V/5ylsAJ+TdEFmiCSHlyMzbRhY/+ltqjSwxQpNmpoLIRn2yGDsT/3YMzpdzqBd/Q+9hIH8renHCq+9kNT9kAQ/IxstnQj/mjoy2AWEgxaDF2rSzyOl3uCI6ZGAWE6JyPM2XLFfrZGDsOrnZTLSvG8CzORZayY8cqMQP6pRnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Anzg6xKa+MrZlMyg8UVUjQjS0oAGtXUcqbEBmuEWug=;
 b=kfHZ6zq/vPosgmQFppcnIGOrjFdrdXdyaa6ByrNVDYFTVtabhijmN4eVt0X5gL22KIV0bKImM2J45/D7OwIxCPXdxfA43vdq3+QCEULgeX2qzClpuPHUo1+p7wLgaVRyb8SzD2jGXsv56hR2eLKTfOkWVSeYb3k+DQ9HsEfjQE/ChJopKFrP5D8s6QtdY0YwtT2pYbIePgoAZVN10tHYMXSQcykvNvEsfEpYRADvd61MmPkTy49/bTjYvP4CVEcS0Z/+BCX2cEnVL79IO2g8iZ6ZilyELDSosa63wGhcdqfMNJg34XVOP4/z1pkefMkvvuncsni9NjvOTHclvlyefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fbc8a807-ea73-760f-8c75-df0930a5139e@suse.com>
Date: Fri, 19 Nov 2021 14:25:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "julien@xen.org" <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20211105065629.940943-1-andr2000@gmail.com>
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
 <126a2864-e7e3-b887-43ff-55b1e59151b4@suse.com>
 <5baf1199-e12d-cc41-4520-e32ed29a0436@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5baf1199-e12d-cc41-4520-e32ed29a0436@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0049.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c0edf75-2049-49c0-c293-08d9ab6010e8
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6173DC16778B84A071ED0A80B39C9@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+OZK0uDy5JHG1o9zJt7dFf3rGEOgAu1vurSiToumJjOxnTVAzJB5rvcRFJqxRi1p+kG1OPslfTaA19BTpSFY9bPju3URV6O6DwflmjF8VOg2WAc4dWyr8i9OrjyBp8lzJPj7kK0gmccvEqcegFqCGlYw7zu0kD+s1+L1N91llDfos/wq9e1mRZXxIUIYWhDaBki6vugSnrFU58tDnFPWohDOGNSArXhjRhlhbtx9u8IDeM77n3LJ9AqzSoQkTNtJHVzrfM4/skEw5mjVrSoZ1nhYXfnOuEMFiSwDNx1fVlCXBp4TMuDIRQ26khuk51gEX+eWyXx7uLOBNFYr0J6Pqs/ui35NytSp3dMChKqOqDvsTl8mBEFW3w/kVqINZkeOW5SWHDeIIctCaA1UIA7S4ujJLUCFPp29pQ6L0kwzqtdy5FMbggEhXx/b2H0LkaWb0Qy/Ni/nPWbDXyfBfcAp9pKVuqVIvg5lyj4P3+wAU8ojyqVylmE0MhcMCyvvd0XvatP6B3t9X+cN80zVniCH7i+Iprn/gwVG4wdCZ00HjONQRb9bvInzsBj5mvHoM2+33WU2Yt+x5rfXK4oQxtMN8HecfwDp2nFeiiXAhKd/mQrhdao0/ik4O20Fwd5vWlfHcIq9hdF7RzN4cYK1kpsJj92hdtur/YWcALsgC3UHDJkmwf7cp3edHFtmunEAsUxgCYEq/+iw2ALNwf0dmEv2sJ011KuRLhzYG/8kHSouCn4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(36756003)(16576012)(508600001)(8936002)(316002)(66556008)(6486002)(31696002)(66476007)(6916009)(31686004)(53546011)(83380400001)(4326008)(956004)(2906002)(2616005)(86362001)(38100700002)(7416002)(66946007)(8676002)(5660300002)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LnGl7nu7LDL3/Yz7ZCe/qCG5xjpaHVmzB38svdohAEWOpeYSx0Dip4BKiqLe?=
 =?us-ascii?Q?vHiFAaMkqlh3J6G7ZvQtZ2b7TC2aqlA1gdV9VOsNAne0rZ9C+xC6QJ2MOiHf?=
 =?us-ascii?Q?oLEtOTIEX/N/D/5o6QqZ1Flt6AU6GIEOEKljqEjhEHunzaO/0XzRNHFG3o+N?=
 =?us-ascii?Q?lRK4Aicmp55QnBDXC9Oea6x3i9jkBRYE37U3kYLNdrBw/PxiejH+wHXR5D7O?=
 =?us-ascii?Q?sA/PSXGvfUWdRvEqctG4e12EoBONIbMzmJKiaJHQ5QBdUEJA9piym9i2G1Rr?=
 =?us-ascii?Q?+HYp4NwFx3k9Nd149lwHpzEHx+QwWPZq47/0BrDUyJ+0NPinD+AL+APIoFRC?=
 =?us-ascii?Q?mO+Cm8tfJXyuCIme0JDFJyeo+i4eTE4gOW6ymwzUUT9xXeA+jOnNfZab84er?=
 =?us-ascii?Q?aUkylvOMkvEUe0cK6WVfCgis6TX6Zl0sTAtC29vDrdxIzqRk9pUyFkJfzdqo?=
 =?us-ascii?Q?gn/uCByFDYop44eKpx5Orlt3CfWsMfvtwifsow6fHQ4c7cmfrqFDJ8x4agnr?=
 =?us-ascii?Q?9P/E4ouAPtTD26UAaoFpgTPO8tQzND3NxAb8TPw0k3KhGZ09pzZUb0wAtoS7?=
 =?us-ascii?Q?KBSh9S1p2nkjtqGmSD7BUp37+hdiA2ZpPwhxYtC4lTWS0LTfBod/sM2vvnGK?=
 =?us-ascii?Q?4lhqjx7CjXm1qbDJ7npiuxLmNDWqs8eESXrBJjUrrd0v+Bc//PLQjjmpRZUO?=
 =?us-ascii?Q?nEF1aNHl8D0lj+lzZ5cTbjFusOpQwmZZGoAKIZgs6TNUwuB9PMcgImURHtOt?=
 =?us-ascii?Q?/Fsl7CQ7bBMMibPGLlrKHdjmxhZkAfVO9zKR7tfpqjfZCudLvuoXS4TnB8Oy?=
 =?us-ascii?Q?5HUsVXni9uR1Qo2Pj7tDIWiZAMPK1IzdrKBQJfgT32a7Nrr2s+krbE7wZRuH?=
 =?us-ascii?Q?WWCo2sZtz1f8wR0AuZY4pWmhQD6hdLgkQqZFVafEq5MKiCS6T0LaQ9Z6QnmN?=
 =?us-ascii?Q?fvjYDA/RhUhwaOr88OfbrALVEXIYR0T8cbnBFYBcZmQBRBBOmi7J4NLwRj7G?=
 =?us-ascii?Q?nBVb4+4b17eaXDh7T29O3sOw31mTgPIUemUYY1IYuTOG/TNlG8E34Ku9s95s?=
 =?us-ascii?Q?emivBnV3A0jDGlZuYfOqhQ6aDLQRfhT0a5TIHdyQWq1inkhWcJ9Z8lwra65r?=
 =?us-ascii?Q?hpAsOO6LHfeW+NIzWLJyQJG4OWauqDE8c+NW5HfV7qEOSG7mkgoednBlM2qd?=
 =?us-ascii?Q?5xKqTJ4b3dTlsq9/opuEYNo4P0zZ+JQfFjqODKk7KacjTHhk4K7P8l5lm/Uo?=
 =?us-ascii?Q?FBct9u3ts+uZMIH4VkjvnUsr2/8HMu08v4VeSPZo1pO7vDcxOYvqO14HXXEv?=
 =?us-ascii?Q?tVqFZ5plM8NlQvJW/+KwfH14jjz1NCPoQgizHduhzlODwQOI6Cz+O39Sz3/g?=
 =?us-ascii?Q?aWcPCrwMYkMHZpAU2yBZ5jcP1SD0hgZ6Qj2Xs9vtO7xN5jpMjpx8nNTS3bC2?=
 =?us-ascii?Q?M9HP+EheUtwrD1bPuh/UcjddbBoOKy1X18i9p08Z275U+Ta043SdBaFZZ9Gl?=
 =?us-ascii?Q?rIsMKZkttjkAnK2AebpkC7n6w886aUFHpb6T4XZuoQhZdGQBZ5C/vl3h5qpu?=
 =?us-ascii?Q?yZHW508JCqzjw4y4u6aQ6C6214vtV1emFQSzd3wlORprNtynUfK/1vN55gTE?=
 =?us-ascii?Q?SqLjSivv9K7Afl706vMZNyg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0edf75-2049-49c0-c293-08d9ab6010e8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 13:25:33.9714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCUsRXbwbtWfba/RsRrHsFgy50hPKet7ippZgALa0geegQcjS4mEMM1enVJ9bIjeM/KsMs72Qr/FYWoToyaAOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

On 19.11.2021 14:16, Oleksandr Andrushchenko wrote:
> On 19.11.21 15:00, Jan Beulich wrote:
>> On 19.11.2021 13:34, Oleksandr Andrushchenko wrote:
>>> Possible locking and other work needed:
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> 1. pcidevs_{lock|unlock} is too heavy and is per-host
>>> 2. pdev->vpci->lock cannot be used as vpci is freed by vpci_remove_devi=
ce
>>> 3. We may want a dedicated per-domain rw lock to be implemented:
>>>
>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>> index 28146ee404e6..ebf071893b21 100644
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -444,6 +444,7 @@ struct domain
>>>
>>>   =C2=A0#ifdef CONFIG_HAS_PCI
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 struct list_head pdev_list;
>>> +=C2=A0=C2=A0=C2=A0 rwlock_t vpci_rwlock;
>>> +=C2=A0=C2=A0=C2=A0 bool vpci_terminating; <- atomic?
>>>   =C2=A0#endif
>>> then vpci_remove_device is a writer (cold path) and vpci_process_pendin=
g and
>>> vpci_mmio_{read|write} are readers (hot path).
>> Right - you need such a lock for other purposes anyway, as per the
>> discussion with Julien.
> What about bool vpci_terminating? Do you see it as an atomic type or just=
 bool?

Having seen only ...

>>> do_physdev_op(PHYSDEVOP_pci_device_remove) will need hypercall_create_c=
ontinuation
>>> to be implemented, so when re-start removal if need be:
>>>
>>> vpci_remove_device()
>>> {
>>>   =C2=A0 d->vpci_terminating =3D true;

... this use so far, I can't tell yet. But at a first glance a boolean
looks to be what you need.

>>>   =C2=A0 remove vPCI register handlers <- this will cut off PCI_COMMAND=
 emulation among others
>>>   =C2=A0 if ( !write_trylock(d->vpci_rwlock) )
>>>   =C2=A0=C2=A0=C2=A0 return -ERESTART;
>>>   =C2=A0 xfree(pdev->vpci);
>>>   =C2=A0 pdev->vpci =3D NULL;
>>> }
>>>
>>> Then this d->vpci_rwlock becomes a dedicated vpci per-domain lock for
>>> other operations which may require it, e.g. virtual bus topology can
>>> use it when assigning vSBDF etc.
>>>
>>> 4. vpci_remove_device needs to be removed from vpci_process_pending
>>> and do nothing for Dom0 and crash DomU otherwise:
>> Why is this? I'm not outright opposed, but I don't immediately see why
>> trying to remove the problematic device wouldn't be a reasonable course
>> of action anymore. vpci_remove_device() may need to become more careful
>> as to not crashing,
> vpci_remove_device does not crash, vpci_process_pending does
>>   though.
> Assume we are in an error state in vpci_process_pending *on one of the vC=
PUs*
> and we call vpci_remove_device. vpci_remove_device tries to acquire the
> lock and it can't just because there are some other vpci code is running =
on other vCPU.
> Then what do we do here? We are in SoftIRQ context now and we can't spin
> trying to acquire d->vpci_rwlock forever. Neither we can blindly free vpc=
i
> structure because it is seen by all vCPUs and may crash them.
>=20
> If vpci_remove_device is in hypercall context it just returns -ERESTART a=
nd
> hypercall continuation helps here. But not in SoftIRQ context.

Maybe then you want to invoke this cleanup from RCU context (whether
vpci_remove_device() itself or a suitable clone there of is TBD)? (I
will admit though that I didn't check whether that would satisfy all
constraints.)

Then again it also hasn't become clear to me why you use write_trylock()
there. The lock contention you describe doesn't, on the surface, look
any different from situations elsewhere.

Jan


