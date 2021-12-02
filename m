Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA2D466760
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 17:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236837.410761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msoUq-0003hL-1o; Thu, 02 Dec 2021 15:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236837.410761; Thu, 02 Dec 2021 15:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msoUp-0003ef-U8; Thu, 02 Dec 2021 15:59:43 +0000
Received: by outflank-mailman (input) for mailman id 236837;
 Thu, 02 Dec 2021 15:59:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msoUn-0003eZ-W7
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:59:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db8a1d54-5388-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 16:59:40 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-21-uaUlfKsvNoyJGtSp_xZvLw-1; Thu, 02 Dec 2021 16:59:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 15:59:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 15:59:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:20b:310::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Thu, 2 Dec 2021 15:59:37 +0000
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
X-Inumbo-ID: db8a1d54-5388-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638460780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F12yfpTN5XyPdyXcxW7s/UW+pE4Jqt2nMyrbyRPMU4s=;
	b=KpVDGKE5Jq/bI5t9R4J7p/kJz80i4GBgUsWJwu+RUZGDM441Cf9HvnoRXLoq1quY5qWDkh
	F4hyarPuYr8xM2ajZYBmZnglU+3w2n+tTH4FzrwlXsRAZRIYgklKs7wutB0v7xzFYiDcA8
	9R39SUeC5zRX60XqCRoBIpmvHvwaytM=
X-MC-Unique: uaUlfKsvNoyJGtSp_xZvLw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Keo5mhAo5zx7kPjz3EJNJ6jtQlADdpDfWNaV9UQ9855zSvKyqEA2QYlXPd+B0M5nbyNwbWeEfjgWIuTCcdgl4s4iM0qToI0PgOPXsTHITTYA9MV99/uEz5P+vLTWWW74nixpwxXDyFHAxekL3XaTjnD//u6mRkaimR/8lQ2wgBm4Wl0mS2Sgeb+/TD96spqzAj7joa0z/AmVDh6d9mv0rOH4nkR5HxJgk5ZxGIRWXIpoBmwM4bLv5hXdy5ukW6yj8mmjRzVPwMhbLQnMiLIknWPJQTRjytRf6HbabkRcV2AK99SsPWbFMafOUNEI4AotGjLj0HiYo7scJ4nx5n7Qjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4gXzBgNyOmjr0o1kPGL4Qi8t5k/TrlIA/QIcQvPeQI=;
 b=WZAsMcnivzk+tyP01msUTSKahP3l5OxyQB1+VnC8kD8s5EpZ3JaWYmkladf1CE/y44q7781gLrbmh1QujDCZ9WYvr6akQ/Es8zihRw/vIi5H1J2Lj9snXl7GRpOv5IGzkpAjhT616wqJzg4YX5b5JZVcjXjy8TfqxPbfxfx++epNXEO2fOEud/C1DFAXxaJ7dtsYLNVAlxkujb3pBkd9DYMMPy2WjAoWmg5SBCO3r7zi18WKXezrDFuVQSMQT9u/pVlCIxCP0MgNzWg8KwyhsJ7qYT/PqBcCS380kl+KFDmG2Fca+08zPlrhKvE/gsIVP2d1gWLL0YmREakbpbE7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea607a3a-55ca-7ad0-7a02-902516ac8528@suse.com>
Date: Thu, 2 Dec 2021 16:59:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 05/18] IOMMU: have iommu_{,un}map() split requests into
 largest possible chunks
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <134785fb-8ac1-50f0-de75-e0d6fe22f711@suse.com>
 <YaZCOHoTua8al3fU@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YaZCOHoTua8al3fU@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0023.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b78778e-a665-4da4-9d2c-08d9b5acbe08
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4349C3461DEFADDF163CC71DB3699@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CK+wEO9bIlsXE2Gf/pyneIOk9/BgGtMnXnP0qSDGSKlwifOGs5jrb1qaaS48UGNQiygSoCS6P2gei0WgRF7iKvjHtDDL/nlvb7Oge4Q8M8UZ2y9xgYSd8nR35YIB8CtWOINXfv8NYCP6bq15lZvGK7PbXyRoJT2NXwMqeDWrMM4A5lqdR6zT1BF9RT1/38R8Fo+l8tW95bHLqr0rbckvKS/EC1TH7uKYuDHADwfxKwpXC3oext44vV7V9Nc1/TvuN7ZlaclB1WHEM0iJgmP8wXtm9grH+PW9xwCatlrNIvPO+zcsI8E9w+j/o+dGIE5n51w1/3ceKnEgHCLGxnh9zvU5ONz/H9sb9JppebeLuydpGAFJnK1zGhv2x2nAi7Kp53SidFui449NMTWXFgBQOC6UgvYWbuZu7aIxCsrNG0EEMGXciCw27lw4+wlFun48RiwlF6bCIigIjDs/8zyi92LLWDoSPPDQEtrPfXh/neSZiKNqwG8n+uQJ/fI/Dv0Gy3H1j4ZTMl+XqC6/bsTZM88r3jNiimQ6BwMT7lRZEoGf/JutzhxuQBgoGF1yXBsGV1hJjvIfKC00kfXaiZgRtot/s02CDBJg5RAGXGfX4kVm1w8h7HJGRNBhPjn5QQataNmW5vr32NggyNoDP5Jpj6eqyGy+wwm7//MwEwuIRlrv1Uw2815ErMBNoYzJnrI+6DxIOFDUa/IDCekmBXvL4nOJVJWpZVQg9/YZ/d1HIrQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(66556008)(16576012)(2616005)(66476007)(6486002)(4326008)(956004)(66946007)(31686004)(186003)(316002)(54906003)(8676002)(2906002)(86362001)(5660300002)(83380400001)(38100700002)(31696002)(26005)(508600001)(6916009)(8936002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z80RRc4Dm2LzTw/mT2/nDClmXv0V5Ky/fAqpOgE/e7Qv/2x3eRjFrprt4XGA?=
 =?us-ascii?Q?pzCo0/+v33GRScei8zLSbf7fm2Rrnxf0eKPEKK5COS5KfhuUJX5ODKlC9Nah?=
 =?us-ascii?Q?YWP7u7IPtIbCtH2HAR95Pl2XHOK7cgDVR5O80QRjurrl3zmo7XxQY3ThDmnz?=
 =?us-ascii?Q?U5dNVaJOvXNGYdondZx1ssnf8+3Cq5AyTCk2IQtzsoCU++k7Caue4OI64zSd?=
 =?us-ascii?Q?a+YsXZ70WII2uSgU+PMht7Q46hhWf0TASIz9XWT7EUNMzzEFVo4mPyF9e7iV?=
 =?us-ascii?Q?+t++lpblt++v9uEYI2N+O+/1ZK/p4M5Vay35bMWo9VObKWx8mnv5waSRdyQq?=
 =?us-ascii?Q?9b049DLfB310Txy/suBV62PTA1Oh0oyUQtRmyiBPDgAhJSgc8Hz/NTB4XFmy?=
 =?us-ascii?Q?68c32QgWH50jpg6nYoWZbM/tAL6DsN+K5GphqTJ7JZSn5VyC6nhCfR4/0iQl?=
 =?us-ascii?Q?5wr9X48y1myT+2MShfDovHr5J/adK/oWMQcZpCv0ZpojIp1RfS41XD53r3YW?=
 =?us-ascii?Q?deFgNhSg/DgLSXMXO/XSKjJFjPp/sJxx4w43T+Hg0Z9eddW7n4stqkj95UmC?=
 =?us-ascii?Q?+f8LNNO+QIzzEVTcXir8CbfJazuyfHfvjexQGkmjUnFkvCdvUe9jshjqG3lN?=
 =?us-ascii?Q?se+4SIzpGAlmGB+fp7oR93nlCpl3DCrQj4HCaC8OGZuppgwSkCp/qptCgZUg?=
 =?us-ascii?Q?s1NERJH84rdi7ng+b3cnamyPd16AonAeC6RAkiPlDTXVr88JsrQxJKuqwByj?=
 =?us-ascii?Q?z6h4Tpe8gN0iYsXgLIZ3MaAzw5jwmF7shDDLylcRzK1Ld142OlgAKBHEHmWX?=
 =?us-ascii?Q?MG/Yy2/+Z5qPgb97yBRrZPndpa340g8h1F3jDoSjxKKLlqya/h/Kwt3Ta8Le?=
 =?us-ascii?Q?5sl2tS5otYxdOBxXQO/nUbiC1P/FG8LgyEAiuNlxz6PlkorGQ9EKBe/+aEKA?=
 =?us-ascii?Q?P8ru3W0T3AHoktaaXsmEP5bLc7nLY8u4QouljPHDmlV6XnlXG3is63xZMj2q?=
 =?us-ascii?Q?IQKvM8ta+VxLjMEDxAWHah4KsPwg95SMpdEfb1Wpu44Dqwlf1n8IBID6mPqt?=
 =?us-ascii?Q?eV4wfO5NGO77ynO7gtf7BN0CjVM181wwjaU8zypyj3UGZlRxqrzwnMtEKSxE?=
 =?us-ascii?Q?X0sfdiLRSkaS4y8QOiWxtaR09MtM0fethEih4hrsO7NpXffqG6A6r5H89Rcm?=
 =?us-ascii?Q?bDMPq6Bh5ma9k67+mYUDrr18EyBE4ZtEcOImW070wCWLBV1EC2HZYizzCSgg?=
 =?us-ascii?Q?w5F2V9wgYSVNkvXz/rXI9GgVqv0F+bHZ5elhhiC7BBcyc/5bI2OTU3FwDfhU?=
 =?us-ascii?Q?xu5CRM0TNI7K3YmyzBTKPtpmN+NaCQZe3uUW919uEU0CfNlakIafOsfl0QXk?=
 =?us-ascii?Q?jY5Rhq5NKwksDgBBW6b5FhbZA0AFJScAJY4wu6nKanXMhAM/xD5szEvVfzWH?=
 =?us-ascii?Q?lnpjn62IxKXzTTb3n595wIWO/K2driLieEizYAgojUNowCRbtHaqYe6C6x1u?=
 =?us-ascii?Q?Te2r2odoyKXmDDhA3f3mGM9VC/N9EqtMgS9XwfbDC8i18PaIQbWa3h2bd/Ch?=
 =?us-ascii?Q?tJg5G3S/Oct+sgC0HORrQye+vRW/TK5r6lh8UWl3rSeVh43W55ErUqkF7kJy?=
 =?us-ascii?Q?ao2tlP1vgDpy5GQe1wcz8ZQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b78778e-a665-4da4-9d2c-08d9b5acbe08
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 15:59:37.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFr3TDDDVkgK7Yd2og6J32IO/0If1W+K7emQTNaAaK98/rVgxZ8yil2d4zEx+PphsLx2NUP9AqWwFxpFr22vqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 30.11.2021 16:24, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:45:57AM +0200, Jan Beulich wrote:
>> --- a/xen/drivers/passthrough/iommu.c
>> +++ b/xen/drivers/passthrough/iommu.c
>> @@ -260,12 +260,38 @@ void iommu_domain_destroy(struct domain
>>      arch_iommu_domain_destroy(d);
>>  }
>> =20
>> -int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>> +static unsigned int mapping_order(const struct domain_iommu *hd,
>> +                                  dfn_t dfn, mfn_t mfn, unsigned long n=
r)
>> +{
>> +    unsigned long res =3D dfn_x(dfn) | mfn_x(mfn);
>> +    unsigned long sizes =3D hd->platform_ops->page_sizes;
>> +    unsigned int bit =3D find_first_set_bit(sizes), order =3D 0;
>> +
>> +    ASSERT(bit =3D=3D PAGE_SHIFT);
>> +
>> +    while ( (sizes =3D (sizes >> bit) & ~1) )
>> +    {
>> +        unsigned long mask;
>> +
>> +        bit =3D find_first_set_bit(sizes);
>> +        mask =3D (1UL << bit) - 1;
>> +        if ( nr <=3D mask || (res & mask) )
>> +            break;
>> +        order +=3D bit;
>> +        nr >>=3D bit;
>> +        res >>=3D bit;
>> +    }
>> +
>> +    return order;
>> +}
>=20
> This looks like it could be used in other places, I would at least
> consider using it in pvh_populate_memory_range where we also need to
> figure out the maximum order given an address and a number of pages.
>=20
> Do you think you could place it in a more generic file and also use
> more generic parameters (ie: unsigned long gfn and mfn)?

The function as is surely isn't reusable, for its use of IOMMU
specific data. If and when a 2nd user appears, it'll be far clearer
whether and if so how much of it is worth generalizing. (Among other
things I'd like to retain the typesafe parameter types here.)

>> @@ -284,14 +316,18 @@ int iommu_map(struct domain *d, dfn_t df
>>          if ( !d->is_shutting_down && printk_ratelimit() )
>>              printk(XENLOG_ERR
>>                     "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn"=
 failed: %d\n",
>> -                   d->domain_id, dfn_x(dfn_add(dfn, i)),
>> -                   mfn_x(mfn_add(mfn, i)), rc);
>> +                   d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
>> +
>> +        for ( j =3D 0; j < i; j +=3D 1UL << order )
>> +        {
>> +            dfn =3D dfn_add(dfn0, j);
>> +            order =3D mapping_order(hd, dfn, _mfn(0), i - j);
>> =20
>> -        while ( i-- )
>>              /* if statement to satisfy __must_check */
>> -            if ( iommu_call(hd->platform_ops, unmap_page, d, dfn_add(df=
n, i),
>> -                            0, flush_flags) )
>> +            if ( iommu_call(hd->platform_ops, unmap_page, d, dfn, order=
,
>> +                            flush_flags) )
>>                  continue;
>> +        }
>=20
> Why you need this unmap loop here, can't you just use iommu_unmap?

Good question - I merely converted the loop that was already there.
Looks like that could have been changed to a simple call already
before. I'll change it here, on the assumption that splitting this
out isn't going to be a worthwhile exercise.

Jan


