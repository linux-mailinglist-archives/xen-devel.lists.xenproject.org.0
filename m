Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC504AC0A3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:11:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266987.460684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4jY-00008q-J0; Mon, 07 Feb 2022 14:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266987.460684; Mon, 07 Feb 2022 14:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4jY-00006q-Fb; Mon, 07 Feb 2022 14:11:12 +0000
Received: by outflank-mailman (input) for mailman id 266987;
 Mon, 07 Feb 2022 14:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH4jX-00006f-38
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 14:11:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c729abd9-881f-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 15:11:01 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-NOGjNVOoOHSfr3SAqaSDWw-1; Mon, 07 Feb 2022 15:11:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6244.eurprd04.prod.outlook.com (2603:10a6:208:143::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 14:11:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 14:11:06 +0000
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
X-Inumbo-ID: c729abd9-881f-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644243070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8QP5TCoyeHmpSS0YtYXiHeghGiapLO1wWkBFNN1DPn4=;
	b=gbTiZrOYpfhlSNKtKHHG1IqkIinghzEAY81jT1afzSITYrDbC72ML5zbhza65lTInHjcyK
	WEYvf84INiM1JtiUHyGpt0QHoMOWBIFQeIUg/orsK0mco7fD2pORZHAIkU2N8y2FKgvmIU
	V5EjQtyDntX0E80QnUBRb5SBOz1T78o=
X-MC-Unique: NOGjNVOoOHSfr3SAqaSDWw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afFAQic8k5hyCxEW2o/zQJuvY7yVhpIDmuOVfVifmWJ4IX+nHhn7p/b3xvHZzTZBeJrVlykTiYheQUjROpmPYo6nwgFCydWIfVHaaFYz/WRWMkDg8CfIu9SCU33pe8tZwDgy6mD+OYoCnFT0hq/cfdxikvvUXavvhWumIKyqjWFtmfTGlZLu99s7m8MJE1jlzM+8OL1kBhO3QijxLfrMaYSCNnYXbLGnxa0jgAdGpfW9rhHLZ5F4o14P1++Zhm8UaiY7LjeYfzMEprCFX8Pr7zS607Je89RIHtotu/XSmjPK0XMP9Dv0RDa0Y2CM+6hMVNpjRgrrsb78FHVzABM72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qo2Txv+cann+/Sw+Ehm5UvgQnQa77eTqW0JzwA4xoHc=;
 b=HX56dOFZ3VxQsoiBKh8hq4FMVyr3Um+obKBpBEEzHfznYxM1xbDwjd6bMsFDkpkiLY+WE4VxtvMX1tUpJchQ2Lp1bdx3QLQj5u16Ud1F96gkGfccHzFtHNEhNtYo6CPjxknDGbY+wzO88ioeOneukDPnAy+6yFLpxoLRf88gVImCsS3wmYNKQe8HU1o4Pu+fTE55Bzkbwc18Qk0fp+JexDwg+Qn3rKBig5mXm7zBvgibxFqyD0Wjc97rTSgAdcLoBV8ptQ1szsEC7K8lHP6Hb2csqrW88GkI53qBHMTcd6lmDAT9WfXZtsZCk6tgHLK/p7fUD4Y/bKqM9W+MUNSJog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
Date: Mon, 7 Feb 2022 15:11:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
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
References: <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0399.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fc0b82b-661d-4d9e-d2f2-08d9ea43ae5c
X-MS-TrafficTypeDiagnostic: AM0PR04MB6244:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6244EE03E23E9DB87896FDD4B32C9@AM0PR04MB6244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wFkNBC+Do6MRIFOE1Ewp45rSR1cuSSyw9d125VJVzujEnWiqk2oy2qD+FmkpTaAsXt2e2/ygnwDP+aQiPZyJHtATSurB5z1sRN8oQZr3SI01GvRdgMcQfiyofiLNKoqTX8qsUHAMxYPS5ZvQWMyNEuBlmFBwFiAEh28+XbyQt0Tp1vvXzk6fBQ5AEkXs7e5iasW0PGs7gdPseQFLS/bf5g+UyKUJII6NTA6e7008lyJliEtepAd6PV7i2dwdPLuzR/Txi2k9lLGKE/M4Z9ogHptFO9F7x6gqw+2tAXhT7OmhO/J3CAnXcO82qA0wqmLWG2oM0yxXiw4UHGsZ5zjYsn1/A8ATm6XJNu+LAnGTjU8GeFLyzv20JpgWP1se8o1GVTr4cJEN7p88aTn/QYyyhjpcvkxHHh6zYwNCgIbjMlULnekFaHqMWTno1csvyxPXdaVYjKivOzpBVyaaikq+5hvzDPxgD61gyxezwZL2XI5ObvNd6Y6jtZs23KF1qqkzeXP2gnAVp33+UQHv6QaUZusGslnqomCwqA/lHZtO7VAc7Nahp7k/bLlL2fKTW7xkOP3ED3hkF4mYti3Tv4y6qxMI8H9Q0mnpHy3clvffFtJkwOMN/ush3WjUwGscK52BZofNhGhV/UnB6yFCN4I+C/f/fJ8zOBiNB7+mWxl8XT2lKLbq0JxwO2IJdu+5eQ3pNzd9TibuYDRFa4v2wsLcEoN42/vx6rwfKJtv/1nGGqE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6512007)(4744005)(53546011)(31696002)(86362001)(54906003)(6666004)(7416002)(6506007)(2906002)(6916009)(186003)(38100700002)(66946007)(316002)(66556008)(66476007)(2616005)(8936002)(4326008)(26005)(8676002)(6486002)(31686004)(508600001)(83380400001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?usfpoACuZfCxJCxQit3Q4kXUT1aA467h2PbLdHadYlmOHlTTg+8NlR6s/a/v?=
 =?us-ascii?Q?kH5zwUvviSj/9wEtHTrmlkw2qJMxZMQsNbbMeU3cHLP74ld/VFA6U+bljrRs?=
 =?us-ascii?Q?PGKkZwYyDFjr4rAjHNZGvwA0b/Pv9eLww6HN+fgGFVomNoyCePCeKEjYiyw1?=
 =?us-ascii?Q?z/Ek//X1y0kiyQQDHuu0Nu0dpnbV/c3XJOrC2YvfDMR75LZhozy5OyFO40LM?=
 =?us-ascii?Q?MK/dPZBaZ6DG3jkyLAexNvvLzHV9/pPr4F5nABnIP5YYnoAQEW7eg0l9dYbw?=
 =?us-ascii?Q?PMwG+TcXKy+9PxV1JGRPm32/3hpwxZy0UHdqcPfF908bXL7Y/nKxi0Bo2i7s?=
 =?us-ascii?Q?T7OD/B/t2BKsjVH+kehZgUNFPYj0cS/ZzqKie4FvYwLlJQQ8Pg4/pa3QlGcn?=
 =?us-ascii?Q?spWgCi0m/3tk5t5FGSJln9o2kglpNVVhmB+AW98Ot0cb4zM0tkDlX8rQfvwE?=
 =?us-ascii?Q?R8FhT0dT0q0GNFvJFzzh2ZYzpiG/9IKFExH9LzLl+Wfjac1yPqLAvcFoE2NS?=
 =?us-ascii?Q?/Tj0dFJFR8OcTN1DNpC2KbG0FrOI+oeYGZ4tldBJyc02Ae4jri0D0HNIo1OL?=
 =?us-ascii?Q?c0fOiclNbX+9Hoszs6ob8sULRyw/HEQvIPJAA+/WbsgRepLHRpsOyKpC94LG?=
 =?us-ascii?Q?MVFpB+6dFxgB2J7o4wz0mU+84E3/xVUi8lV8eZaTEWZ+qMVnHbxsgdGuBRh/?=
 =?us-ascii?Q?R1837g9QBs0vWUlzOJ1bUYrXc3aHRoWLIKJnw0BU9a1o24rDoAUwL4x7eTg4?=
 =?us-ascii?Q?kzIsu9qemravmtUIqIqDbaZQH0Yewbf0BqeWDDO0Rxj2js8mCByriyFEnnib?=
 =?us-ascii?Q?XnwBiHJ7/b+BKt9Vt2DefDXm9pPlfgoXhHWyjgmRLDkstPOx15a/BVZv/Sbl?=
 =?us-ascii?Q?lpIZniq1vPY7CjGfHF90vm6jmkFSK5dGr24qUiRw3s669QmvYj7oDhShaoz5?=
 =?us-ascii?Q?u6MTVQrHhBHR+ad8rEHre+DfYQQhbuprAiSUm/vm/EPlhzFVIVHt8jmt2Xas?=
 =?us-ascii?Q?dv+TH8qJdKsp+hxaH65n222qtBDWv+6tY6Gvno2lcBu+4q774hbLpfTBCogp?=
 =?us-ascii?Q?h+lA78WGGZ5dR5iH8JAxGivG6T73hwDJRlNLlZlejXDQ6rOVH0Ovw2ZxRbNP?=
 =?us-ascii?Q?w5n6HEl65Z8jc32v5QcX8DJK1QmAomh0wXGCVf4cyEzhwtUdPK0EviomSU8q?=
 =?us-ascii?Q?OrWGfMj0ddPanLt79jTSQsWnop6w9bRRA3ZQnTRPrH7/URLFJqSxPuAIjg2d?=
 =?us-ascii?Q?uz7JZ/T7h4L6AilF1LpMKEzAzZLHW8pIj9rjmWd5d0VGc8E8JdM784C+GtNL?=
 =?us-ascii?Q?E2uBzXgngpgdXZ1RHO6DGiFwYtnorKaR0yPMhR5qNxgCYvp2rTAL0v/x1/5C?=
 =?us-ascii?Q?DXTPd02buT39+hr9XWYrg/HFWfxAQ9SGuTs5gL3XbELzDdTHwELUfbI4MyZH?=
 =?us-ascii?Q?rHG77DCunJATypiHlIHzk6XUiBrlIOOD/OxT918xTReSl4QARiArZFLTl2/3?=
 =?us-ascii?Q?P+90vFpw+N9YDNe2Nz/W5//GS4HjYojlstyNzQAD4yTtS1yLWE7AIyAzXPgn?=
 =?us-ascii?Q?KkWw6JvUJgPXtZ2lXWfq59TyKVLKAYPXBhHWELSoxjDH1jDEroGWkgeJMuf7?=
 =?us-ascii?Q?3O2T870ETMfOt7bb0WTOOIc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc0b82b-661d-4d9e-d2f2-08d9ea43ae5c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 14:11:06.0694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79M5im2dvIvCCjAVDzUSXyfr81qxZRrVw9Qn1MEraURGhh576ONzbgKoQOGyqu2719yEEhQakYVsDQ+Lv5947Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6244

On 07.02.2022 14:53, Oleksandr Andrushchenko wrote:
> On 07.02.22 14:46, Roger Pau Monn=C3=A9 wrote:
>> I think the per-domain rwlock seems like a good option. I would do
>> that as a pre-patch.
> It is. But it seems it won't solve the thing we started this adventure fo=
r:
>=20
> With per-domain read lock and still ABBA in modify_bars (hope the below
> is correctly seen with a monospace font):
>=20
> cpu0: vpci_write-> d->RLock -> pdev1->lock ->=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rom_write -> modify_bars: tmp (p=
dev2) ->lock
> cpu1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpci_write-> d->RLock pde=
v2->lock -> cmd_write -> modify_bars: tmp (pdev1) ->lock
>=20
> There is no API to upgrade read lock to write lock in modify_bars which c=
ould help,
> so in both cases vpci_write should take write lock.

Hmm, yes, I think you're right: It's not modify_bars() itself which needs
to acquire the write lock, but its (perhaps indirect) caller. Effectively
vpci_write() would need to take the write lock if the range written
overlaps the BARs or the command register.

Jan


