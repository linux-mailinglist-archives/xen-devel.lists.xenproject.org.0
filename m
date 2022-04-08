Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE9E4F9570
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 14:14:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301493.514532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnVN-00018i-7w; Fri, 08 Apr 2022 12:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301493.514532; Fri, 08 Apr 2022 12:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnVN-00016s-3O; Fri, 08 Apr 2022 12:14:21 +0000
Received: by outflank-mailman (input) for mailman id 301493;
 Fri, 08 Apr 2022 12:14:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncnVK-00016h-U8
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 12:14:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69b2b7f0-b735-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 14:14:17 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-dAgOwjJWOWK7qRm-h6L0PQ-1; Fri, 08 Apr 2022 14:14:16 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by PAXPR04MB9668.eurprd04.prod.outlook.com (2603:10a6:102:243::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 12:14:15 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 12:14:15 +0000
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
X-Inumbo-ID: 69b2b7f0-b735-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649420057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVfb5Bd6fmwMHlQ6EzAUC1CaEkWi/Gi6okL2pb65sIo=;
	b=fMxhvNju1Hlh4gJrmZPhYomQm+uhg5UTlybMM7U554Whh+Whc/LnzsBrGi3hcVtFD8Xf12
	fH3pxSqX3e9VRMv2DHn5f/UYWS6xJRpmwykbEFtR3USkuPIYM7obzde2IEoRJBKySfw6bJ
	QrD/5WMATMxQn2NBoHfR5XoH7BtRL5I=
X-MC-Unique: dAgOwjJWOWK7qRm-h6L0PQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RX/+FZYcDZBFgfjXz/lESUzWFz8T6Na/2kDqcp1Xd2Ykg1bgkHAJCJdRk40BzFfZNPZSp3U/7VW4wClqCj2M5otLfVVCfi3Pbfss/poyiVM2oDDXoQviYOt/0RUdZaBg7vi+LcNpGPVZWHaFJIr7cbWG3d7VJOGjrPqXkX2D7yNfDykvNyH/4iQ7duMM62mpkYLlE1ZA3KBzUxOfWVe7Ku23MbwJElYmDVULJdH/0gz5JYp7tqxSteVfgZFEI60Z8sfalVOHEcfcnxq1cnUqkcocQyB5bzPKEYuj/3qM7mnfxQl7ygnZ8yjwJ1/K34Jci4dpBpDMnSqZ08k04dcQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHV6gbW///R1wlj+a4qra8fR15tXppu/qY55Lum5rV8=;
 b=YF6UxMmNk9ezVtW/+0ib9KJNIo3qnmAwzSKIAMs37KVqGWyQ6EerPjTKxqgw6xCmYuQ5U0Us/xCkrQnFZ8vxKjYf3CKKYmnH6ZcHhVOst+VM652rQOoEPT0nvLOuLaMo8wvIucLq+GiJvl9qpzAoFPQsFwi1oY2O4pX+ascsogJ/kiue4B3VClSGTxf5TJ0hy7OKgHINaiYElz3Soph19sZ3ZzXI3bpVKgnOOkj9rXZJPaWG5k+GmLKCZWeN5EfHinTSZF6NhCr2KC6Jx1+/7G6FvzIGxyqvRubScMxp5HEJsXubXEYldnIv+wH7LBoXdvwOz45L23xXKU0CNBua1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c0d4b41-5c4f-cad2-dc0d-d87e47e08ea4@suse.com>
Date: Fri, 8 Apr 2022 14:14:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 04/14] x86/mm: split set_identity_p2m_entry() into PV
 and HVM parts
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
 <69623630-cda7-9b2b-4f2f-09a83d5dc22a@suse.com>
 <YlAUloDvk20Y01tn@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlAUloDvk20Y01tn@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91a65b68-956b-44a0-deb7-08da19594ca0
X-MS-TrafficTypeDiagnostic: PAXPR04MB9668:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB9668CE1503DA20E40D012D40B3E99@PAXPR04MB9668.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V/kUFQi8YNeItILVA2MIMge5Y6Ze+Bv1Q+WKBROypOSrfTs01tz9B/lUDuXohLQlC57dWOlCW6aThb6W7oj28NHmwxP+t55dwRQ4C5ybRlpFoEx4vq0jBARntHBe0aJhDwnZo1Gq4odVdQu3jU371y6kDJGE1tkGyky2b4pIWYZvy2P/mQhBv9NCT9tPEKHh8Pq1DB6+a53VbyEmYuLdrNTxHls74RhOZoGUCOgBxgn5uzzPHZ6UkdXhH0pW+BPYZJfOO4j5+6vK84ALuG4imMpEAuq0a/zOpUxs5en2RiEWRl/2ClrmMkNv8fGUTVBC/OXnx2Q4S6m0V/JTEXBu2yn6tDwTwcwKOh259pcg3cx2Av/pWPXEcJXXBZ6lntdS9RfS+0owKkjNiTcnBamKCCrdruLIAEOBPa6JFR8lVA5l9R/jKKm6NdbnSosL8HVMm0vO6RBs8eFBcrXJ1/889viNaKSpAgaERY6gzaFiNSy2LhN4PSYCPvStV+Lm0UDxiaOPG9paxBn9L6EmFkTHRjU4aI+nAxf9EvZM5FhSURHBEtuEEGhtklV7pt4t9Z7/pDgTaAZSEyGnv1xkFDoEYUh/Iw8vxiIIZSfkLtSq80fb32IpmzZGyoXB5vW0uFfTOGFOeD3HbOd7Bzlgt8h6S57z52QloQL5XDcQzTvVihvXj5komMrX3XYfxwn2wD6c+zqbFIkQkZG5BPIw8DoDZ6ARatN9JAdaT9/OI5y8wJXDGzNquofRBD7VMNfn3IuJXvws1+B/+P4PCKoYq89UKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2906002)(6506007)(8676002)(38100700002)(53546011)(316002)(6512007)(86362001)(36756003)(5660300002)(6486002)(31696002)(31686004)(26005)(508600001)(66946007)(6916009)(54906003)(8936002)(2616005)(4326008)(66556008)(66476007)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pkwnvrwDT5ecAej5eI8pXdNwlQtgriTrciCfJtQu4ha3MvWM7+3uS7+Pk/cj?=
 =?us-ascii?Q?EaL2FoFDmAkXV80YUm4B/HtUcLmkYgiUgMm4wZQseQ5eww2PooSzxChF8Gva?=
 =?us-ascii?Q?cm8W5junLXdIpQ8ZkNSEAgsXH+ZGpY8BjH9UQ6jKJ2bVtoYwOgAzEzqtGPRJ?=
 =?us-ascii?Q?4s803DMq+Tuxk6Q6XjJ81uZUy3sep3br0v7d+X2xhqDXPV545Uo4twPs0hVr?=
 =?us-ascii?Q?4gEZow8j+eR0n2plF7a9buYm1h94ybTvjGpyPVulY43bSoaqPFEdWhX9/dcE?=
 =?us-ascii?Q?JyKx453uIWK9qyGlemg+l3Wf9kqrmGfCBNMcqnJ0qlJnOwm33qJZeGMk8LPE?=
 =?us-ascii?Q?i2nCnSSlPps/4gkorgmrQjLbZxFKxOIqz2zUeBwmSjw11Vx8AxZ5H9pkKcMs?=
 =?us-ascii?Q?EQTXfvX/OVh+MiyoxX3qOXKes2WMUNthu4rI6Hocfu0xY925b9Edla7R4ID9?=
 =?us-ascii?Q?GrXo4uCkv52tVV6czLQxP/p4QvLbkFU03XNAOzEJaQrEErC1Ekjjs/xqckHf?=
 =?us-ascii?Q?nvGEkYhT31CQ8GE+aE0njSFJul1z9OUUnAkq8TCOealI/QPOCMA57pRlxk/J?=
 =?us-ascii?Q?2MI5DrzvuHG9lBPHeQ8pVAPSKpHjYcIdBfUOftSSNdP4PIctMWPIinHKBGua?=
 =?us-ascii?Q?zDxpdU/UxLib9Zo7zRyN+/aI7qqLwaox7LYpXsSQuvXMXof2BmTFTaxJVboq?=
 =?us-ascii?Q?YhmqFky+Knn7B1iZ/AOFsT92fGGeETpWDqNaWNaoph69lVwwKf0BivBYQjEY?=
 =?us-ascii?Q?1mjtWYVKxvQ76yZObWccvs4rV8ajA1xdxAURa3qvDxhGG/VVPYr4z4joNZGK?=
 =?us-ascii?Q?RoZ2u4zvgK30RynrEiIagHbOosj2OF2pyAFOiIv7A3sfV9tuiB53qznQThmu?=
 =?us-ascii?Q?mOU6jVBxcDJSaNDfOaNUfzF2g2KuSA2bW1K9FQLRjmoRrmzXqxcWHxGy9yf9?=
 =?us-ascii?Q?sb9JNwHoEJwH+5lXh+6nN4s43bnFN2Y1qL4DD2oC9n3FsYAriatwrqj0ZebD?=
 =?us-ascii?Q?f8Sb41X8QZNLEJ5qh5FFuC54rSbb945nvqajKIzMjVepfdgQHXPKSihHUZ5r?=
 =?us-ascii?Q?HgL016WClHefrCYI4CT82CksuUSKm7sz5colyoUvAViWeB8sJgz6Ehz/ud3O?=
 =?us-ascii?Q?3YqSE/UqymBANPgH0o49glz5qZoMfk/+8j4v74BgLgcua6kuAcDybkUrOuJs?=
 =?us-ascii?Q?jWCjSS2t4qP0y6NU/FeuJjVJY0Dz4pmRfpjfkf2jedCopWa1K82RlECFcfP6?=
 =?us-ascii?Q?wmRxyg/e1xN8dmvNq85ke735vxgez0KzZ9/7pLBwAx7pI7eOQmEE4LLyOem3?=
 =?us-ascii?Q?Yew1dioiFxe3pKOG/anA8HJj9vFOfzu2jIrtmePi3O7TfhCy9Z/wSPGw9/K6?=
 =?us-ascii?Q?ZLeJbLLiaoB29+UVpcWF4rgbL9Lun+cX3Tlpd3kZP/l8o3UKBdorPAz39/YN?=
 =?us-ascii?Q?qOwmBIM1YZNDiweHxeRXeD014pHvllgvjh974DQpdU27DrxAgY7CWnoQ5qTI?=
 =?us-ascii?Q?7awkKFah6X6/BEq32muwyXpkaES0/D8B2g/81rgjl68EwPBSQJMQFC3HNQbn?=
 =?us-ascii?Q?N6Ilkuia3srnoPnk4ljebB/175Hifoaq6wpOc4Mbj5IMLrYnBxaNv4toVHPl?=
 =?us-ascii?Q?RX8ou8GJCU0Zu5ORL5V42fDePx1Qg8E7Rk9nF+B7T2MLvgQZoIJksPODFIzA?=
 =?us-ascii?Q?3cLE8BBlP8IuhsiQXPukpAjTP4Q3OjKx1Qggsn+PzlJxtN2YP3x1kiM95Iu3?=
 =?us-ascii?Q?0A4nOLLB6w=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a65b68-956b-44a0-deb7-08da19594ca0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 12:14:15.5991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8C+EVIKUkVzWHKZFPnQvDjEQ+E8ncDtRim8nw67E8sY8yavAJMxVVu/F3bDAksSYBIdAEOI3Zpf/vO5BmEnbaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9668

On 08.04.2022 12:55, Roger Pau Monn=C3=A9 wrote:
> On Wed, Feb 23, 2022 at 04:59:42PM +0100, Jan Beulich wrote:
>> ..., moving the former into the new physmap.c. Also call the new
>> functions directly from arch_iommu_hwdom_init() and
>> vpci_make_msix_hole(), as the PV/HVM split is explicit there.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: George Dunlap <george.dunlap@ctirix.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> Just one comment below, which can also be taken care in a followup
> patch if you agree.
>=20
>> ---
>> v2: Change arch_iommu_hwdom_init() and vpci_make_msix_hole().
>>
>> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -1473,12 +1473,9 @@ static int clear_mmio_p2m_entry(struct d
>>      return rc;
>>  }
>> =20
>> -#endif /* CONFIG_HVM */
>> -
>> -int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
>> +int p2m_add_identity_entry(struct domain *d, unsigned long gfn_l,
>=20
> I guess switching the gfn_l parameter to be gfn_t gfn, and then
> defining:
>=20
> unsigned long gfn_l =3D gfn_x(gfn);
>=20
> Was too much churn?

Well, yes, I probably could have done that, but the series was (going
to be) big enough already, so I tried to stay away from such (for
consistency's sake I think I would then have needed to do the same
elsewhere as well).

Jan


