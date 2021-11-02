Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658AE442CAC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 12:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220114.381244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhs21-0002FJ-2x; Tue, 02 Nov 2021 11:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220114.381244; Tue, 02 Nov 2021 11:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhs20-0002DM-WD; Tue, 02 Nov 2021 11:32:45 +0000
Received: by outflank-mailman (input) for mailman id 220114;
 Tue, 02 Nov 2021 11:32:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhs1z-0002DG-7j
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 11:32:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9572495d-a25a-4630-91a0-9eb91113d25b;
 Tue, 02 Nov 2021 11:32:42 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-PLHtBZG0PTupeElMwjj9_A-1; Tue, 02 Nov 2021 12:32:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4606.eurprd04.prod.outlook.com (2603:10a6:803:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 11:32:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 11:32:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0067.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 11:32:35 +0000
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
X-Inumbo-ID: 9572495d-a25a-4630-91a0-9eb91113d25b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635852761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/FXaw8GtI37W2qewXpM6yv88CgXqln9+JpDw5fdxlbU=;
	b=c+Ct3bNiDfs+tgnhSiNIbKgaurNyrpsv0s7q5LdH6EUfjPpckgkoJF1iVUYGhy3EFeMCCt
	gZ47diiSLomqY8eVL6g2NqQYbBj1QJdxufMee2hSmN2du2fkfTXLg795Ysi4jNFU9OJUn3
	V9bds4J3R6auZdCJaLtGQzYGU7jp1AY=
X-MC-Unique: PLHtBZG0PTupeElMwjj9_A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hlyp+o5De5ji76pzsHo5ip5hckYdIK0WMGDSItyyjeEY+xGy2ux/c6Bgb46BwR0pz5/IuRmWlHXZzw7dT2w1P6FvyR3pCBrvdzP6VyCqy/tDsF7fpbzrr3kaz10zvuKxD4ZT2bs3JvQqVN7yBZcCpeBtawA+NRE3591CeAfRSOpjnOnieYYbCRTS9+HN07G5Xg6mIA75RZ/l9muapLnhFOJZHWTRU00FaDTIaR95PVoJpOHX+oQWC1JHYXsSj2njouLWujasi2oxfYCHVKjVnVp+gEkOVdRvYHyLqAmVHXKH3v4C6DsjQhCc0LgNFHviToiHapXUSEMvFxvXBIIhOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUsQ0vLHG9Y+0hgYET8wWoJoNJCLwnPVJm5qjyvZFGw=;
 b=g+Bl+NQ01EGCH8fpOQKqhKBciozNg64gOkw/+ZK3CuS3Q4fhIRJrrhgzO75XaT5pJh4n4FPwahH3SnLYFKWl7CWdiXCSdvVz9WOyPetJI4PrPuSwmfcrldK4Y4mOj6OYYjLp+YdMBW/38B4nFUFhPCjfoq9pyd8jptaEu0QzfICBrud0d6hSluTuTz5tzjWaZptfi7cnmtZydgbqJxejPM4xqv7GaJ/8Eo8bhd+31rndjLsmvc/jYV6+D9z1t5ucHz4TkgBv7YIz6PkZK7h/pKDl8YyVjsGiVkm1nVglcJXm2wZcjYOENBGRpJaqKedNSimBRiPzkWwHLpjfqoujRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be2b31d5-5bf5-773b-969c-ba17e8342644@suse.com>
Date: Tue, 2 Nov 2021 12:32:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v5 07/10] libxl: Only map legacy PCI IRQs if they are
 supported
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
 Rahul Singh <rahul.singh@arm.com>, Ian Jackson <iwj@xenproject.org>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-8-andr2000@gmail.com>
 <YXavl0e0zainVKT9@MacBook-Air-de-Roger.local>
 <3de59765-6bcb-d6a1-7e23-2b85123df71d@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3de59765-6bcb-d6a1-7e23-2b85123df71d@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0067.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0f41320-0e5d-48c7-1378-08d99df47855
X-MS-TrafficTypeDiagnostic: VI1PR04MB4606:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46065239CF37D757993FD0D2B38B9@VI1PR04MB4606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q3ikdMP8sHNR8jMpnso8v32MlVqEYIEQH78fELUIdC076ux5z6WeesF4TPwmH31EUrCpNIJN2FY81z562Xm0haIqr7v67aSTT4oSvsxyHexEl6Fb+ybVRbk8xFxpt84kx3Khor7zGrk1gFwQFLMPt2RRCwX5niCJAOWWtIFDo5Ll/fbD48P13ISzo2YsyMofqzoyUQAFY91JxqP1hzIx4QMpN8x6K/y/LUnwoH7ICWKvqWVgP5yrce0RTr3uBv+IGMDY6inZ58o7vvfw60ym8OEwL16aPlZtZX9chXXpx5wHvdJi8GrydmG0U0sFNXQU7TmRH0Qrz43lv035jOYQzHK4acxc7om80Rdnnjj1A9z4jYUr41KD0zk4bsPiibJw7qcM02cqyd+Dq5EIyA29tS2qqIUBRlFHfVszpWTBBoHR5QRhxLNlj6WVhFbakJLUCH5DvuQOxzeJJ3L2ediDJIqOHQZLoYYh/8+tSCVZFrhIVBaur/QElolId50Qv/pKJ4kUMvWLg4u4LhpeFsFZZ245QzM2Xm838BsnX3Vs5a8JVTCJZECq7K6Civ0FMMuBXbuTjwP4qCo7d1/2bVvci+NU/OYAZkrqPEVsavsem2DBycp/9TRK8UXrJn+kXROA1xhJrtLL5nU8e6NkF3KV6YdnYlIy55s2T8096FCd3KvTgoceqCIoHEoNANWt1fr5B/2HBfl5JQtETg5ktp49K8dhc6aijm/q3MvQnXrUgDNTgWS3vKoqSe6bQEu0pMKP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(8936002)(6916009)(8676002)(186003)(36756003)(508600001)(26005)(53546011)(316002)(16576012)(7416002)(6486002)(31686004)(54906003)(66556008)(86362001)(66476007)(5660300002)(4326008)(31696002)(2906002)(956004)(2616005)(4744005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YIdCiFxOCNfiRFbd7BVwxrgqR1QU2ykzo1FugAqKWCctOCVvxPlZ3+yZy+wx?=
 =?us-ascii?Q?LEB7UHtcz/ipDwaH0juBDi5xZd7KD1E7GS3nvaoIrTekUPom952N5/F/eGEd?=
 =?us-ascii?Q?XjLanfafGzBeqKv6UtgUQ/1TV8A4uiqL0eTOSGa31yOb/7JctKUV+OoC8Ats?=
 =?us-ascii?Q?x6h09ZO9KOpmS0u/WA68p0AJF/S6fb1pkt1NcUbf/xJC+fRR1v86w2ho7A+M?=
 =?us-ascii?Q?RZgDz5Q/s6dTcJzqBW6rq3U+Q3BJumeVr7Hr69eAZbVNddcTC3vXknIUqpN9?=
 =?us-ascii?Q?wX0ctAWaNX/M+EGK5C6pJetrA9Rl/BjAsT3UjZT0+r3+IqmIPP7E+N6+Rzxi?=
 =?us-ascii?Q?Uiib3Us6/GruoIhrl4Nr4dSt2iNSJmdg2QKuvDwDD3wl+We8HOeyvLmmoz9p?=
 =?us-ascii?Q?QRe73nRmSRPao4PK0vLAYakg+fC/u2EZ5Hrwj0LE874L+v7PfdzZHwevrbnl?=
 =?us-ascii?Q?DbnW6dZe3cpKu7NsD/z4x4Um/hSbH9T27XW1t0Ro5EqSl/Y7WivgOKYhuKo/?=
 =?us-ascii?Q?OrS601kVMFJY43fR78dZBcc4bC+h1k/7ntE/eSkRGqBhYxsAO4xr9ZTUO6rW?=
 =?us-ascii?Q?US7almwHTs6G952zduSQ48buSRZAwZilOuW0xHN4noYqATFOXn0SBk9pgERa?=
 =?us-ascii?Q?MhIIgTFtDqJlbnLQpLKGfjRW+QeBpHpxY/5lIStdU2q0JU+RXTja5k6G9naY?=
 =?us-ascii?Q?Xc3OnDvY7RR+wL/Xg4wAwXGWpAriI8AyFoyD/3oCX0yBZ/Sh8yBNMql1uTcT?=
 =?us-ascii?Q?NCG3KPs3hQz9MLpFvRGcYWxDOqiEfk/YHPYx/N0ny/FSeIPU8m4SitvSFABy?=
 =?us-ascii?Q?R97KoduzmJiJlnYTWYzfOALV3oOTAygKwjGussRSlOp8duGYZIeWmIFhs7/K?=
 =?us-ascii?Q?297+rbBJmKQ/aQMBjbyTVTAoODt+ZCc7VjKOYap3az0lFxagXEA3/zpjP5mh?=
 =?us-ascii?Q?XeG6xDHNFURlsh9OecRy7IJQH1W0yrq9On4nkjUF0YF+5b29BKQCuwW7r5TT?=
 =?us-ascii?Q?3ojp3g04s5dY/YSnYwOOjCNxlEW/ZmprogOoo60XqcDAL24IjujlWfGz2JtD?=
 =?us-ascii?Q?T1GL+gOx04aNEncEzCQsGHB7zaXymj/hQD/SlAJ8j5kzvusQvuM2x/gn53Ne?=
 =?us-ascii?Q?GKr7ZGbKIJJhhzF64lIRYbtXt70c2aoCdzWptGqkHoNL382lA97JKy0Gdvb2?=
 =?us-ascii?Q?pfnPuotAzwLaEAGnrD3lwP3RbL/1cKx1HSmj9+Cr4trwKnj8IoY2AKVwrU0N?=
 =?us-ascii?Q?z8/osyNOvFCp0gXgW6UCtqGvKxQ87AccK0DvxgSO4jIdwFZigVkcgV+OmfFQ?=
 =?us-ascii?Q?cL24y3gLdaYtQDu5yn2ngy49bdHTCAFG0opBO6D9km1RGZ6izgAMYkOjOKfS?=
 =?us-ascii?Q?FDnEWbXsIv1MXZvbJfmyZ57mIjnB46suGAk32zfnycqaK9dGCDyULqpY0mNJ?=
 =?us-ascii?Q?7vus91Ilo0lVl1KxihxMW5aa6qHdlPnh1x/12+twOK2/Bvbj46DgByTXE8/N?=
 =?us-ascii?Q?xno0ENQXGrEfaIw4vWRY9hnxnn89asn0OxOapio/oeC0wTwdLaFAfFcoAPhG?=
 =?us-ascii?Q?uSWmUVCjxmLDazF5n36fjZL3GoE74dhARiLNNQbzeZpaZCFLQPS0M2eTmCUp?=
 =?us-ascii?Q?PBaNfsmXUCqLUhqQf/T8eHo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f41320-0e5d-48c7-1378-08d99df47855
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 11:32:36.8427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMvVtPlCGHoY1/TlbrmL1pnCimPlnQapEE5bWDZxiOLhjCmNZCXfwsfirc7XpGbWbL1rIOyC6ROlq+sos9E03g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4606

On 25.10.2021 15:38, Oleksandr Andrushchenko wrote:
> On 25.10.21 16:22, Roger Pau Monn=C3=A9 wrote:
>> On Fri, Oct 08, 2021 at 08:55:32AM +0300, Oleksandr Andrushchenko wrote:
>>> --- a/tools/libs/light/libxl_pci.c
>>> +++ b/tools/libs/light/libxl_pci.c
>>> @@ -1364,6 +1364,15 @@ static void pci_add_timeout(libxl__egc *egc, lib=
xl__ev_time *ev,
>>>       pci_add_dm_done(egc, pas, rc);
>>>   }
>>>  =20
>>> +static bool pci_supp_legacy_irq(void)
>> A naming more inline with the PCI specification (since we insisted on
>> using ECAM instead of MCFG) would be intx, ie: pci_supports_intx.
> This will require a follow up patch if we all agree this change is needed=
.
> @Jan, are you ok with the rename?

Sure, but my view doesn't matter all this much anyway for libxl code.

Jan


