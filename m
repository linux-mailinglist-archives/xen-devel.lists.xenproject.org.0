Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24172CACA42
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 10:24:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180286.1503495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXSv-00035A-Oj; Mon, 08 Dec 2025 09:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180286.1503495; Mon, 08 Dec 2025 09:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXSv-00032q-Ld; Mon, 08 Dec 2025 09:23:33 +0000
Received: by outflank-mailman (input) for mailman id 1180286;
 Mon, 08 Dec 2025 09:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HI0z=6O=siemens.com=haseeb.ashraf@srs-se1.protection.inumbo.net>)
 id 1vSXSs-00032j-Sf
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 09:23:31 +0000
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c405::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a199ef5-d417-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 10:23:23 +0100 (CET)
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 (2603:1096:820:87::11) by SEZPR06MB6059.apcprd06.prod.outlook.com
 (2603:1096:101:e1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Mon, 8 Dec
 2025 09:23:16 +0000
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523]) by KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 09:23:16 +0000
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
X-Inumbo-ID: 8a199ef5-d417-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAdP8wbeOfuDoeQwZFwPRMZP0/QGt79vEP357o2M0U+44jeYngBMTXzzE6QymhKEq+fGut92wGUp9//aUYWUGEp9nmGVa2l9Jw5kXeii6NRRlaJmqm1fecFVg8rPUmvCVRY1u5vn7OEptEjsoeZ46GWAbSp4yfQxeWdzxU5ZiZVD4peqddkP2mugL2hSNO7BXU7TXs7SoyHyli8IQXefM5snW97ifnKgWBIAhJSWyAw7k/6KFpxKftqS3wqscJ/QonRGTg+zZnw3OSmdqE5WCAaN1/Jj65oUELj0jpg8fdrTc49dM+BtAtZoS1vVy/16S2M3zriGW+l/EBD2IMQoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HadczEWJpfFoe19TlJGE2Uym7zOSW2JrIy1GBp2VcUE=;
 b=UhXVCmq0aCVjDuQ7HZd9oeq3Y+fRf/4Z7zZ9hCm4TvVMnGmgj5Ht8212l4Bc42Akz1YYOJBWEnUWu54/sF8IyIWrIbkKxp9DXPuLU415GssA42h7P/yEuBAV0jVtGRjsiNWSmoycvHAcGiUe5BqH/3869zahEFPNcvMx2mYnqCm1OclOhLDqVaKCroUz88KcsZuc4cajzzfD2x3Q41eQ7zT+/tMhgMzuZtgQKuj5DRmPmwzwWGApeGTYp50yLqaYXeBt3+kgGio0P2d/ocNDbCYFD0tWSE1JfEn27NjZWrr7jivWbBhRZ9D9c81keQUYgIG+dTfNJ5on+LHZgjB5AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HadczEWJpfFoe19TlJGE2Uym7zOSW2JrIy1GBp2VcUE=;
 b=ughd7idMQq+sowIsdRHAMu8+Cg92atJl1EDytXS1kZKuJI0ZyYThM++q6owqQvzbb2lLAXF5Vo76rysYm6KuzcByc3B74FeVNUB5EIf3X7hvsJ9M9j4A8fSWEWyzdoDbnMYQ6h18vnSQnd2pN205Wy0JCIPGIQ7QZBVaPwA6rjBCt2y0z4c5Jlq1XK4GkRGL+7xNF0S3C5eW1Af+YlxyykR6a8i4s9HIY9kwbGtWe+iEx0S1yT0OeUNVNjdOtP/oFF9o3447AXHhyrgQyxnwwi52FjVFKKcNe3fojNExoTuqS06UUNjdx21vQVPNZ+3fOo9/BQSP6VjBl+eu1rRMrw==
From: "haseeb.ashraf@siemens.com" <haseeb.ashraf@siemens.com>
To: Julien Grall <julien@xen.org>, Haseeb Ashraf <haseebashraf091@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [XEN PATCH v2 1/3] xen/arm/p2m: perform IPA-based TLBI when IPA
 is known
Thread-Topic: [XEN PATCH v2 1/3] xen/arm/p2m: perform IPA-based TLBI when IPA
 is known
Thread-Index: AQHcZTbEL+J8Hf9qH060epeFxunK57UTtIuAgAPHJUM=
Date: Mon, 8 Dec 2025 09:23:16 +0000
Message-ID:
 <KL1PR0601MB4588F25641F3FB9AA5C355B3E6A2A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
References:
 <ce2e7c32f06ba8a48a2074fa8cadd9c122b6490f.1764863575.git.haseebashraf091@gmail.com>
 <a726e56e-b864-4ec1-81f4-da552fe71470@xen.org>
In-Reply-To: <a726e56e-b864-4ec1-81f4-da552fe71470@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-08T09:23:16.055Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4588:EE_|SEZPR06MB6059:EE_
x-ms-office365-filtering-correlation-id: 613a075c-1297-4567-854d-08de363b6b7a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|39142699007|31052699007|376014|1800799024|38070700021|8096899003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UqcQa59d7/nfeiQUXmx/nuHN406IC7UQ61WkWRImLB/wU37I7cJ8E/yAv5?=
 =?iso-8859-1?Q?JlS/2XjFWNeaaPIQl//sHcihw3Z7QPoKXn98OAFqpV7TwJFaHwOrPr9S/x?=
 =?iso-8859-1?Q?HONuRWzX90CAS3oXg/c0XeqYzRBLdtmnl0/qe/pg6vPmS7+UJ8iUp8I6HF?=
 =?iso-8859-1?Q?WA9QiXiMNQeC0RFK3PhxO5aFkgN9b0umr7ZlOYwXFWjbKHQrvv/6umqAGU?=
 =?iso-8859-1?Q?xuNQWc5N5/GIp7cfdZB8FR1419g40liXsSqRzNW6OK6RUwqd5aZoT6PYCr?=
 =?iso-8859-1?Q?57TWu96byyV/MywT3sF9qPY63Cl8nfoXOD7wV0ZB/NVWeuFtoLjuTfS3yN?=
 =?iso-8859-1?Q?UIReQ4mYZ4AWfOpNAPgjx8FxgnK71o5ffWzUKCw1I5qzVLALpV7Z9z/Qa4?=
 =?iso-8859-1?Q?GbjvJ4RqqjVHyMlBBvDraSLqxF3qIEFanH2PhQ55NqlLAb4pAprp7SY7JE?=
 =?iso-8859-1?Q?p/9CyLl/KL12qQ512W0z2gh/d9Y7XAwfbvPOEqxneAoQi4JEq4Te0dNqEh?=
 =?iso-8859-1?Q?Vm899momaWO7RnSDvxL1kTg7Hv52Wfip0gp5PjEtMCfTwliq8zuidi5dz/?=
 =?iso-8859-1?Q?v+EBXxzexbyIV0GcGKpDs7LJc4ni+f5pxhpFM08fKYdVZ6SmijqKLohvYI?=
 =?iso-8859-1?Q?uNgNuPReNyPnO2+EaDY3SDXSYRcpfVB3RpTxINibkSKeHrIy4LdjQSuK+W?=
 =?iso-8859-1?Q?JBqmcG/AAd3UK+w9xmKiGGdgZpW+b5eMcw1BRlyPgSf/tVYvk2P+Cd0xyj?=
 =?iso-8859-1?Q?x591U7+RZ3ozmT/RDiuA24JnkDnqSbPoDah5QekJ30Qc8DuIbEGG8TNRo5?=
 =?iso-8859-1?Q?M3LGWom53U+gbFMoQbcosDcj9NiRlba9Fk06QuLKVI34mP2/o7kvTTeHZU?=
 =?iso-8859-1?Q?7KNTrul7PwgwFef6hj4T5QcC2HLo/VRTj/hnF+gHYKzRkoUYPq033mYN48?=
 =?iso-8859-1?Q?3GEFYBaiZL7bff8cALY4ruzOu0lvyjDwEv8D2GiDX+jnD4E5azSPTNa0iO?=
 =?iso-8859-1?Q?gzIlsMH/XDNoeSVAOTwKZ/Ae91vrpnZY/T22T1Vf1dHjyZ5pD5qQwexBfY?=
 =?iso-8859-1?Q?X9RObCl9DavHroV6hT9KzxiLpeZC7lU/W5BZLYb7Hl7Xqgr4MMQcjhQ5pN?=
 =?iso-8859-1?Q?k1UVhcLAh9AiZbKZXdnhCNhz5VYOwoZ9lMFrf72b09bVvIfRIKYA0bJA2s?=
 =?iso-8859-1?Q?LgduegWqzAhNzCkpRwI47rEOGpq76k16cY5ek0auEQX7/NmdkzAaRPwmhn?=
 =?iso-8859-1?Q?KJWP+VuE9zdRjqN+sf1cV031+3g/4d71bS8qUid9BSWRE0MRuJ6WvSzNiv?=
 =?iso-8859-1?Q?uuMERUhDSW30rdepcs7gQ8lUg9hld0HoY1YWONiTWGI2dYu6Sv/WIF/cDz?=
 =?iso-8859-1?Q?5xzUAUvGy4jwz3HDIgVXa8u34J+Rtm/13HQs/LtckKqa599PupKYmTZQMW?=
 =?iso-8859-1?Q?QCX6sxP0o1eRs2lH/EguLAWIGJwgGymYMtZuza3rOpjPHvzx/F1WloTwkW?=
 =?iso-8859-1?Q?A25yfkfyMxB+1DSXA2ZNdM8iggLGOlb8jpcx1uNz+tkZUsofIjvcUTNbDk?=
 =?iso-8859-1?Q?RQCZwd2IRbocfo9P2Ta8ih6TJ8n9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4588.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(39142699007)(31052699007)(376014)(1800799024)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tqYWG8VUoAt4XRAjNeDvjh6G6ggFA6SGpsPhm2kdtr/zvW6iZ5jSTcFmX0?=
 =?iso-8859-1?Q?u6Bh9KG5HOiRgIGYcxd4SsQtptjN/npRYBMkLTonYB1YwIb9fCBq9O2QL6?=
 =?iso-8859-1?Q?URQuoXvH/6HuGJON6tk85fadNZoDASIKiiJtbAVQC91thnAqoIl0ZXJDVu?=
 =?iso-8859-1?Q?yAZOA5Zd1d41ijWeBYyb55Y397HAbrT2YZ693n32Q6MPhbTNmyFk0bC0wp?=
 =?iso-8859-1?Q?HAEfrzr0i6kqfSgQcOp0L2XqjO0Url85a6vbGd79ZQAVqT+RltjLBEIi12?=
 =?iso-8859-1?Q?O234rSLZjOO6NXqv8fPwbemC61tpl6r8W6RRzYz8mPaQrTok7XAO9ow1kE?=
 =?iso-8859-1?Q?gV/Jj0g6ipDERBgr1OUYFTDZw9i9SoTWV+gKP0EZwVLWKGGIYrPAs0zYgH?=
 =?iso-8859-1?Q?+1hJEbhVIoxFbMQhYM91kiKmtK8vUrlWiZ/tn/QEczjunh3HuIpXAOQXAI?=
 =?iso-8859-1?Q?l1XyvDdqePlTOfw6bI+GisqgENkf3u4tffAabNlu6D4ycBGehlujfLU3Ka?=
 =?iso-8859-1?Q?iI6iJQoBpcsqtm/PFKzRrFd8oB2J/5yXUs8VDzkvvZO5+bgRqdW1i0Jl7a?=
 =?iso-8859-1?Q?wMX+H1Fd/U7qrooVasir93Onn+3GJ7VDUeZYyl6wFOdhUc5/UvBjpCKqgI?=
 =?iso-8859-1?Q?iukmDUSgVuWWOynJEJjJjXyhJ7HXP94Deq/nWfqHjSPHnuzg/K5p3WY/p6?=
 =?iso-8859-1?Q?v8blIlBQ6Fkq2Ir57WNoSMKKh+vhsSBAD0D+iODcch4un3sycfI1wFMqEj?=
 =?iso-8859-1?Q?kz4rzipMXTDYyRoL6pHu4LvWRtnhf9hg7JFugMPVi4FiDPJhgqv7fkaDl8?=
 =?iso-8859-1?Q?injp6oWTMuznGckJnhzeqCn5GqGI2Xze9P2CCX0WI+FehATvnU6vBEwScJ?=
 =?iso-8859-1?Q?BmavxteP9IF98mmqVj16Sm/PviIozDe//dnm2OLMoyM/euXS1K8OzJV7O7?=
 =?iso-8859-1?Q?Vo6s4dIJQ9mxtgS6+H33hO9Nb0nwtWTCkH/b9uee+uK2DceFfiBadBj52l?=
 =?iso-8859-1?Q?Nf+GYBCM96s2FIh/hEwmqg1agTtNIC1+AE8c7ZknnrqOWlgzCk9stoVt8M?=
 =?iso-8859-1?Q?jUoZSICP1+LdmIYp0b1ELX1YRLQf3thdmROrRW1Ka+t2C7zXRW1akxM2gO?=
 =?iso-8859-1?Q?sNyDQ0Elzdlc7svyVJB+iKjxgPkt8LhIfn48KBWNoSM9d7i/VPALVcJlzZ?=
 =?iso-8859-1?Q?yEHXpKylU+i4c53FAbgm6BbXWJpfQwjXkzPdFDbtbk06WyeyJgtqZS1OZ+?=
 =?iso-8859-1?Q?buMlYipBXBUoztR6joeoLPrOESs9G5dGFhZAWwRkegZOBV6xoXd0LNnkuk?=
 =?iso-8859-1?Q?IBcTxfBbyawT2JTFCCcfKsIlo3AIfR+pK7vGAlr4LIuoueiNDPexlERCvn?=
 =?iso-8859-1?Q?yNZQgk2Ag5wNYizRK3QuIrUCCJdRLdav2T2gzug0/GWLIE732OREX3knbN?=
 =?iso-8859-1?Q?u0Tjk1HkFqSLBfDsO1ULOtc1YbXpVfC0IcV0Ll2qAXKS0cIRijibrX10mB?=
 =?iso-8859-1?Q?d2jDFfo89am8oLWqGv/aOzGgtYhd+9+C0K/5VmLQ01oRLs0LV9PMfgTmZW?=
 =?iso-8859-1?Q?n92ur6NBjDuoune2V4Igi106q2f93+3Y+fCpWhj9aDCrFc7CqMkIpqu6EP?=
 =?iso-8859-1?Q?wxlAOG7t083d7JfhwzBQVjEKMdJWaW6a83?=
Content-Type: multipart/alternative;
	boundary="_000_KL1PR0601MB4588F25641F3FB9AA5C355B3E6A2AKL1PR0601MB4588_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4588.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613a075c-1297-4567-854d-08de363b6b7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 09:23:16.6877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVwpbUEEODQLllaHAL+rS3Dcr7byO+Ny/bM/SWIz5OiHOIZeCSEwfvf2YhDhqjablV2R8n1Otifw30/9RNxOlgWeIqUhkMfpYcM/U/mJftE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6059

--_000_KL1PR0601MB4588F25641F3FB9AA5C355B3E6A2AKL1PR0601MB4588_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

> Let me start with some process. In general, we expect multi-patch series
> to have a cover letter.

Sorry, my bad. I'll keep in mind while submitting v3.

> > The second one is addressed by using IPA-based TLBI (IPAS2E1) in
> > combination with VMALLE1 whenever the IPA range is known instead of
> > using VMALLS12E1. There is an upper cap placed on number of IPA-based
> > TLBI. This factor for execution time of VMALLS12E1 vs IPAS2E1 is
> > found to be 70K on Graviton4.
>
> Is this running Xen on baremetal or in nested virt?

Yes, this is with Xen running in nested virtualization. I'll add this infor=
mation in the commit message.

> > +    /*
> > +     * If IPA range is too big (empirically found to be 256M), then fa=
llback to
> > +     * full TLB flush
> > +     */
>
> Bertrand, Michal, Stefano, Luca, can you check this limit would be ok
> for your setup?

Yes, please, if anyone of you can evaluate it in baremetal setup, then it w=
ould be great. Also, I have currently used the same limit in Arm32 which ne=
eds to be evaluated and it is not possible in my current nested virtualizat=
ion setup.

I'll update my patches as per the feedback comments and send out v3 soon.

Regards,
Haseeb

--_000_KL1PR0601MB4588F25641F3FB9AA5C355B3E6A2AKL1PR0601MB4588_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Julien,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; Let me start with some process. In general, we expect multi-patch seri=
es<br>
&gt; to have a cover letter.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Sorry, my bad. I'll keep in mind while submitting v3.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; &gt; The second one is addressed by using IPA-based TLBI (IPAS2E1) in<=
br>
&gt; &gt; combination with VMALLE1 whenever the IPA range is known instead =
of<br>
&gt; &gt; using VMALLS12E1. There is an upper cap placed on number of IPA-b=
ased<br>
&gt; &gt; TLBI. This factor for execution time of VMALLS12E1 vs IPAS2E1 is<=
br>
&gt; &gt; found to be 70K on Graviton4.<br>
&gt;&nbsp;<br>
&gt; Is this running Xen on baremetal or in nested virt?</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Yes, this is with Xen running in nested virtualization. I'll add this infor=
mation in the commit message.&nbsp;</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; &gt; +&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; * If IPA range is too big (empirically =
found to be 256M), then fallback to<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; * full TLB flush<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;<br>
&gt; Bertrand, Michal, Stefano, Luca, can you check this limit would be ok<=
br>
&gt; for your setup?</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Yes, please, if anyone of you can evaluate it in baremetal setup, then it w=
ould be great. Also, I have currently used the same limit in Arm32 which ne=
eds to be evaluated and it is not possible in my current nested virtualizat=
ion setup.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
I'll update my patches as per the feedback comments and send out v3 soon.</=
div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Haseeb</div>
</body>
</html>

--_000_KL1PR0601MB4588F25641F3FB9AA5C355B3E6A2AKL1PR0601MB4588_--

