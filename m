Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA84B472338
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 09:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245885.424157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwh1v-0007oZ-6T; Mon, 13 Dec 2021 08:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245885.424157; Mon, 13 Dec 2021 08:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwh1v-0007lL-37; Mon, 13 Dec 2021 08:49:55 +0000
Received: by outflank-mailman (input) for mailman id 245885;
 Mon, 13 Dec 2021 08:49:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mwh1u-0007lE-2d
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 08:49:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a344eadc-5bf1-11ec-bf02-3911bdbc85ab;
 Mon, 13 Dec 2021 09:49:52 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-yPuZLpg3M-GtwLBEu2ubUw-1; Mon, 13 Dec 2021 09:49:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 13 Dec
 2021 08:49:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 08:49:49 +0000
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
X-Inumbo-ID: a344eadc-5bf1-11ec-bf02-3911bdbc85ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639385392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oMEP5QVK22axG4eddfrPgsXtspkPr8gsDXZteRa5uqI=;
	b=GvV6PWhzW08mH2XZHyfREtUXHKLdrJVkLKuawEjehfWLuF82jIRgPAmuOkLEqiHuQ2X4uI
	o2lCnuWDtBJCWQAGYEUPQNMOgeq639tMm/Zg+Za4mXz9mbmqDuf8fPvutx3mIMG4nKenUJ
	FGocenHaoIoBlvYMsSB3mZGT52r3RuI=
X-MC-Unique: yPuZLpg3M-GtwLBEu2ubUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pdcf1JzdYEcnIwv9ClK2AJfo2GCnzY3FO40uE1lqreiGBZ1IRqk/0AN3mN4+Yj6S/QDUdOhLcETqqsf+tlwPMotTDHR6j915Jx58IxBLB9xybCQveTGnotRzViFa1SJyaC4xTl2PWkcIF40a9aKjW/ixQJFmLdg2OT62OoxMgti0NOwkpfJijxUtYCRXSj4DybdRt7FshlAJLguBrlEHQTxZWdN6DVSVt+IPg5FPX7gBpak9ySfBw9JER2GVDQREpsZbWQi3HzLsNHPG/P7UMCQ8veuojf8cjw2lNBmeSaGNMQ3bEfwlwQ1ohdIaGPrd2YWWhfkILpNj220CJjq9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohJ8t7lloX5sC8D8ws7KI7zCjKwxwysN4U15Zet3tsg=;
 b=XFPQE4u0aUS2fpDTk+Vfsyk48dtkdq00e/v4CH9l8FTIttxTtmEeCTkl2zmLNVPJfX+kkU3Pm2+WnlGObBXfXaX8SmW6l1l+Ys/D180YNwQfzPTrMMcw0JZT6x/+WA1iG/91SdLo9g9z/3PvizoWg0nlnMzFAbFw5kwa7+0sm4KwAZVWw+YGFhSievec8Y9HOy6tzFLnO4WWUzFgyD7sMlApkC+YbQIkpqbom8MZ9X8DwLKgpvqCOLYkZ1ZVFGsELliAIO9yKp7186x4Vm2wouyqPK4jtu2FUve8//ZMkdpbT8Hm7oENQXoAlOgJf882DNWnUzL4CFWPem3wOEhknA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d472fbb5-95f3-dc6b-8103-e7d76e71290a@suse.com>
Date: Mon, 13 Dec 2021 09:49:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 12/18] AMD/IOMMU: allow use of superpage mappings
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <cc93398d-982a-edbc-4ddd-b5459cef8f9a@suse.com>
 <YbNtBPv1M1lIyEOd@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YbNtBPv1M1lIyEOd@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abc3400d-4f96-4bf0-6055-08d9be158589
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532820F302788607DE646097B3749@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	isoyS159sTw9ZPJhsY/Cy4XRLDyMzASkabmjj0PtNNRoHwwV4s9QEUXs/iH5ib0l3cy7a7Fn75KqteDt23I8eBMYIMdUzBTnqUqvelA9ICF7nmNY8ipURtpgabbvpJtDHtyUnu0eN9Rzrl6iKQ/BOOKhq9LluKfw17eAp64CXgcfVICC2PjdBzivAX6tpkj7NQ5KChDuRRVnbsmIAkiDrA74BXwzdEB6RfDKRubosBsvDnJMeAdAviLVqvF/LxRbykcX35W0iLZufH1UI2cOhQ3+GxlQoL1+vVOb25aSal8ZU/RzTRejL3V6f47RcHEWk+MnQraOyISURXgZ5LYAwrvIJIKzLsZKnzarQnTBJlZlUDMq0d+fRb0T8E8oxjp1MPuhEHq7BsLd+Ye3EXPEGvN7mvtskzoWbHzOPdTqhaoVFZv9yGIhZ2Gavyktc2B+2/l5ZduLORObjhsA5iH6xsM8mKsxtsr07taAzfM5tty3JpQlGKtcVe8me65/8q30hYOor2QXK6A/BJ/lwWtbBQkF+nTduJOEq0n6k3ImsNYwIoFZCgY15T3XN+ZSN8GLNHo5kKcbVh8J2nDPBU0MWhFn03VJ2P8VAp87IuNHoewyuGSeRm7HQO4KzQo9BqtuAvM08Chhp7hF7vZuCKyrZIJhulKZ8h37iXjI4yLTudlUV+8kUvVXWE0fyE27Wu7YUIh/X58MnUNj3ft+MQxDVayV/Ti/zuJ9Ht1ITBLizc2aM/TKW9RnuOOpgz5v/oLL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(31686004)(6512007)(316002)(66476007)(66556008)(2906002)(6506007)(53546011)(2616005)(8936002)(83380400001)(54906003)(6486002)(508600001)(6916009)(186003)(6666004)(5660300002)(86362001)(31696002)(26005)(36756003)(38100700002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7IHAjBt7XumaeV8yyPyW8BWHQcxNWmtXs/zotD4kCpyYC5XB1eCj5+eUUwny?=
 =?us-ascii?Q?KvG9zHfv7LuwzeCl2z43RGiakuB9wTLkPVh7ysvgUt8EdLLYP5/egCx+tSFp?=
 =?us-ascii?Q?iTYScM5XqXWFYGB1n5/YISnBmr3A71Uiidmi6CQbLKurXzFNRtQrk1Rjb+aG?=
 =?us-ascii?Q?IkciyyG8Pbs+pE1QRpJImxxrnDFujdbFNFzvjRCv2A0z+3UUqtWdoM1kfJ8k?=
 =?us-ascii?Q?wfj5xkBXAPqbC8hW0/iQT0/+bZdA8QU34oEIYl6AZiCywzDtH4dY6PLp+/1P?=
 =?us-ascii?Q?nig7UugboUvwGMEJ+LiOefKkL9kWJeoo1syN3pXwwHjOTDxJnWB1Mn9ILJgW?=
 =?us-ascii?Q?iUL22TzalcTJ4lOC5trfdfuZGnNChyhR8iRmiBTUev6U9gwwVmRdjspc6dw9?=
 =?us-ascii?Q?nEzNusU3bpo1GZ3WWAiz5n6im6KRkVgt94aBqhfMAz0wQPhyQ/sKcTk2Pl0L?=
 =?us-ascii?Q?iMkRGGZxpkmi0r9yp5U/ma4fzvVej2T5yqhbJJk3s0Kv3AI4emnDly6nUoPN?=
 =?us-ascii?Q?nknkyyUqpe3bVmVl6hCsUpox/dhXCzDWjbcRRT/yv0oTcR5vAKo/f1rmVmdP?=
 =?us-ascii?Q?2MybGZCY+2NODjhtHFhUDJXDBqQIBXriSEtfREbcO8pfV5z4wfaz3hFeQFVE?=
 =?us-ascii?Q?ITwwUW8RBmNyjUTP3oUNpzx1iiumI7AWN8A4lZKlq4Lz50b9Bn93mmPCoX4K?=
 =?us-ascii?Q?mA2lOz2zRFxA6IgG6zOQm5sh22sBIEufUZQrtCDSQy1Rc1pT6sKXsuXJwbaD?=
 =?us-ascii?Q?leoULgrT68XHm1n/SNTBUJuW2gWqAIC1BqjlS42bInD0tJrd6rw58rSX/CsG?=
 =?us-ascii?Q?775hcG79PEBgaiLAFdhezsu5C6Z00vtqdEYWRpRWNIqk7oRvd2d/y8mFQgHE?=
 =?us-ascii?Q?Rxn9UxCA9cf+19NLjn1M2tR6LO9Al03YSZN1vj6ZyuGw+iIh+fnCXzbe75x7?=
 =?us-ascii?Q?HDNZHK/AVHy+OoHAn4FWYrLp9VBactVq0xggPTE76DWSR6dNclSeec+tEmDv?=
 =?us-ascii?Q?RswwjsbqpHd8DBVNPQ8PnNbLMkeLDsOZdVrMSih7Vxli/cNX1YFu1a92kyAu?=
 =?us-ascii?Q?hbRXbrY55bHpS+BRScbJLo0acQaHAgFvIA1d4SQ6KWgDi0p7LV8Q4m+8NiH1?=
 =?us-ascii?Q?5StqAajHBRE+BMQfxoi7va5higgbnZxVrjS8z8PlSEYgz4fEUFKkpxXtQ50k?=
 =?us-ascii?Q?nb9wAAA+uTsKLT1UMgewL0aVJOz7opr2n+CzRQqZgNezBUR77s4X17NArDrl?=
 =?us-ascii?Q?8KS0t4w/5EvmZQAjZtaQ3OgPbOCkz34eE5vxgRAx/IhSpQ6LVjLh5JHTgJV1?=
 =?us-ascii?Q?pL7lXTJm75AwCOnld6RU9r59hVV5tn6atlpGvuCRQRQx2lj9DJV8kTxj4uzC?=
 =?us-ascii?Q?66MZIoebLWMdtEYCvZIsmY0pG/jd8vRA2RIQ+QlvEqHIvigX+lA9mqtN8MHS?=
 =?us-ascii?Q?rMdsrCg1NxnIpbxXbwTUqqsd44b6bGcm5C7kEeGm1gksa80uXJwl/VvAf3pZ?=
 =?us-ascii?Q?Wd2UeN4EZEj6/GpHg2mlUIM7ggS6BRJzckVoCaJ0WavlfCR8I+mq23rQSFxp?=
 =?us-ascii?Q?ULSV/K75JpGEaeLRYJLQRHI36Ku72wRSfWL4Y4eF3dnGMeyZMppEJRHKql3W?=
 =?us-ascii?Q?cSReZeT3atZzBf6lR6RnVP8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc3400d-4f96-4bf0-6055-08d9be158589
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 08:49:49.5208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpDU5w/tzxOrxGc7PA5sRzVtgcU23iYlgCC57tZiv17WV+DLTdDvMbaKjGwqS3iVfW4KK/5JT+PQVr1waqu+Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

On 10.12.2021 16:06, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:52:14AM +0200, Jan Beulich wrote:
>> ---
>> I'm not fully sure about allowing 512G mappings: The scheduling-for-
>> freeing of intermediate page tables can take quite a while when
>> replacing a tree of 4k mappings by a single 512G one. Plus (or otoh)
>> there's no present code path via which 512G chunks of memory could be
>> allocated (and hence mapped) anyway.
>=20
> I would limit to 1G, which is what we support for CPU page tables
> also.

I'm not sure I buy comparing with CPU side support when not sharing
page tables. Not the least with PV in mind.

>> @@ -288,10 +289,31 @@ static int iommu_pde_from_dfn(struct dom
>>      return 0;
>>  }
>> =20
>> +static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int nex=
t_level)
>=20
> Nit: should the last parameter be named level rather than next_level?
> AFAICT it's the level of the mfn parameter.

Yeah, might make sense.

> Should we also assert that level (or next_level) is always !=3D 0 for
> extra safety?

As said elsewhere - if this wasn't a static helper, I'd agree. But all
call sites have respective conditionals around the call. If anything
I'd move those checks into the function (but only if you think that
would improve things, as to me having them at the call sites is more
logical).

Jan


