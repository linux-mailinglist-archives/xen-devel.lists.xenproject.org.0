Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F7D4B5476
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272432.467273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJd9C-0006lF-HQ; Mon, 14 Feb 2022 15:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272432.467273; Mon, 14 Feb 2022 15:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJd9C-0006jD-DP; Mon, 14 Feb 2022 15:20:14 +0000
Received: by outflank-mailman (input) for mailman id 272432;
 Mon, 14 Feb 2022 15:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJd9A-0006j5-LT
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:20:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99d39d90-8da9-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 16:20:11 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-hLf6BF8tMNKqUtH2Gs7dIQ-1; Mon, 14 Feb 2022 16:20:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8719.eurprd04.prod.outlook.com (2603:10a6:102:21e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 15:20:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 15:20:09 +0000
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
X-Inumbo-ID: 99d39d90-8da9-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644852011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zdjjyL3E94323xRAaDNAQjC/MZwuD4FOVoSraGxmtdE=;
	b=TWxPO06U8z+F+zbtxFBwIOPMbinnjmgQ/5b2v2PdAnYAiknGoSHAtCKxHJsvSdXf1fcYo7
	zeieZ9ruFozAkwJB313fLlpV29ubOkmYPfw3z6P/MfNfMy2ybBe47B9FHc+BokwboYv4b5
	fqJfQ7uwpe8SUZsCV0hheakOzs5rZhQ=
X-MC-Unique: hLf6BF8tMNKqUtH2Gs7dIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVIAkVAkJgsOeo3o7criCj5XsA19b0lnNMAQFQstDxPqd1g4Lkvuw4584ggJe8jm2vhMYgYtJ/ksask8aUqAR0pvB1nYcmVnf1AcnPV3sUuxk5uHMGO6FEY3DnzQojTEfri0kHd1O/njXT8tPVIwymgiX/fQB104Em2PAyGCPzcDwzLFe9wl+IvjGWLqSljO1RXtVIghKTTeo4EbZUMAebbkwGmtB6UPcEyv2CBUrEBCucvT9zQ5ZrWKiF/plDgq2raxA79O2VAvS1L/EGtxb5AjVhACWmbq5nYHJ7C05kzO1zH0eljvd9Iy20W1Vvbw4IPh1xaT8ZXyg5zWoTNcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUErQLu02xx2/Pvr+vZNI6PGIhOoW+pkVjD63t1mMWM=;
 b=mRZRq1bQCev6F0+s7DXRI1hrQ9Wp8tVN4B8XxSE/LlsYB+GD71MPm7Rd219ndY0S/N0ErSNViP8v8JFrVIU3riMA1uuCKEondTaeS4E4U0FsduVBQjxzzVj5EdKWKcxkihlroVQMGKsyM6JkrnuWQBVfTtj/96xG7DJc2TF+aZBUkp5lR3qtEEtwkwz0hQbcDZ/9gqVDLO3482x6kKWriSsNWlkraV6QXZOrkcM0RDqzaGv0R319SBqXuCKkpIVsC4vnIJSMn3EwKoBEfhUUk4mpQThnxvL0iKsWoPboZHZzQ+G/Pb9TAFNBH7oIEr0AzuYUM5rf5xXpBzlQi9L6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2644fc70-612e-132a-c0d7-75aa9242fe8b@suse.com>
Date: Mon, 14 Feb 2022 16:20:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 11/16] x86/P2M: derive a HVM-only variant from
 __get_gfn_type_access()
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <a940e734-75ae-2660-7b2a-9b426437c48a@suse.com>
 <1E368B6E-A3E4-4A43-8CBE-6213D302C6F1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1E368B6E-A3E4-4A43-8CBE-6213D302C6F1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0147.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ead1527-07ad-41bc-2cfb-08d9efcd7c99
X-MS-TrafficTypeDiagnostic: PAXPR04MB8719:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB87192F93275F90B97980F1EAB3339@PAXPR04MB8719.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KTquIhA35jciunuvcgTndWWxiotLq1Wjke6UhMYY+UZepzGfGXcvUlmoiB6Hb2e01q1Fl4lx0amkhJri97j7BBsJTLjnard5F4Rb3sqvVWifykrHFfKRa+e567wVq5naPeQByh2Roh9wp4uhVZcLPiajO72aHCdcNe7L0UfWsfORVzSE1UTiYURdhb2xhguxV593pKkVp8CFJ06Ym81dPoeoFy5849LUhzE0zQASmhSiLxMS7v0ZrTaYDmqkhyqnovYsvEGtTLsHea4PLN0r4xyLSK25bfVYIzan6zVZ7oTrSD6DtSjUzXVn9gZuu0QouqjhRSgNc1ZXi18fjwz9+qgvh8tMEenQt0L/I5gO2o7X2CQOYeWZRto5TkjmF9bgXC5uVp/ZmRw/kT2QMAQATrCFYrLSHPvAuXk79lfWorOZNZEoEMJeK3sVn0Zeb7xYAFRdcQv4VT6p9vptDKuyPNm7DMK8X+PC9hGbj9SN5qKs9wWgeSSbTgE9SiZYc+HsQ3dF8aeZ+16HMPTHn1kAfxp+pwX3lh92465jfh2gpEmKTsd4nEfWBSAdG7kJLD0pI+2SYrAQJr/trWuCSO9iSGDqdlozzu0SxrnWkFERguFey6IRQw0gqinPxekjnr0J3M3VVlYAyFcYj5KDqFPgzBO46Re9gMYBrmySkeFZ4A6WyQe0odb/i+q6tfP2cqwZeoQ6MT6t/j/z3TtKgD+EDFKhHhpSvc4wq5usbdumJGTAdRPS//JFZmzTJDe5pODy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(6666004)(316002)(66476007)(66946007)(66556008)(8676002)(4326008)(53546011)(6486002)(508600001)(38100700002)(83380400001)(6916009)(54906003)(6512007)(6506007)(36756003)(2616005)(5660300002)(26005)(186003)(31686004)(2906002)(86362001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1OeY4HRP0nbVhwhvEfa/9mC7SGhNpk1o2g8T7DDWyRC5V6OvAOplUYPUuTOf?=
 =?us-ascii?Q?D4aXSFkH09rFkztNcHTxE4U3D9tkuAjloRCMVwoIzP7DeT608j8Pqjq0BBGS?=
 =?us-ascii?Q?i4d+ckpFNL+TjD3XC3R0cPgxTlI4WatyrsCYQPwpAR+zCSBT0w0/+tvPaQc5?=
 =?us-ascii?Q?u/yFqmeOslwjMAF5T/MDZDppMEsla7iWYo+J/TP6lcfET+H63nOZ25tPINDV?=
 =?us-ascii?Q?zBgC188dyyDNgmeg0R1l4aYLBTZcWZ7ainRt97wNjcyT9Rdc+2um0cZ1WplE?=
 =?us-ascii?Q?KwAWS0A4HpvLLgv51+Chbj6Q1rUoRb5Af5OvMDLdZxq8XUt/hFno1c/nuIcT?=
 =?us-ascii?Q?fc4qQNSRQTKW23Z2edurQCTYm37tiTOg4LsRpNKdJeS2q9s3SNSr2hLOP+wW?=
 =?us-ascii?Q?dWjIQV/KNAR9LMsahHnnx0eR3/GgyHbGSTemsqI9pkk3Affvw4P0Lzg0Wk8L?=
 =?us-ascii?Q?DDR/mxP5QZDK07xcNTYEP3KLnE3Hv7gLMQoqdjv2vLvd6RshyG++PHll0BOL?=
 =?us-ascii?Q?IJftZqVLfoTnQXAPJIJRUiPqlYeDJYsQkq5QrmUtk9BSZwnlb/FjeKzvUVwU?=
 =?us-ascii?Q?KOg0I1OUogfvVLhlWuoQadqyOjXzXCc5Ir2eNN+Pf5/n1NYERlR24XOJUdFn?=
 =?us-ascii?Q?3fEusaxct/PuXiot7nBiC8gntzUJ8Wz070/M+RyZHJgjTQGLoAFvyV/NmeIJ?=
 =?us-ascii?Q?/ple3mkiZsNcXpMuVMU5zOVxPssjeEUTVTogRqyXPsMsg3yLVQRssd7AUOHF?=
 =?us-ascii?Q?4QCnRONGDGrYPcAG5itUKz6O2D3FaeMIFJT/EwWf4FRfv7FJlhSAiyG655Pv?=
 =?us-ascii?Q?/3lM/iwOSg/Vhsrm+kpE6Y4ITuogzAZctunmLFT3qa9uFJ/CPyEbLucduyXj?=
 =?us-ascii?Q?MkRBb+g+KExjinNbAd/Oh/5bl7so/hbhpfz58Ly+VjhXTMM3S7gCPNgjNaAJ?=
 =?us-ascii?Q?l7eTSQ0hTQsdr6lvfOQbsqgeLo69Q2rMGgXnewC9u14/WOjxL1Nnx5C8Zkd4?=
 =?us-ascii?Q?PBqh9MmWIj2gpuz1R+2DtW8iUxAETVGaf7Mg8eN/c3Opp/8uCu3rhgvZwHBE?=
 =?us-ascii?Q?VX1PmIAGyzzFDL47RELjcfXlsuUvJoaV4r7jzsSBS09JJih5FFF5Bf4Ntzwn?=
 =?us-ascii?Q?A+UjMZFaXgv2Npm6F2yjllYlhPmKusyVSApNodOApHjXQSoRq11ynqFIrras?=
 =?us-ascii?Q?Vln17bBNrv07Lnwh+xhDMuRwYkNxTdrB+se4JgWS7B/J+wtxVqAh1yDXskdG?=
 =?us-ascii?Q?DbIdYBg/EeRkQ32Csl2PLJY+F5ozSv0YPUrzFjlGID6DYUirU9SgViAys0Rh?=
 =?us-ascii?Q?1/6CWDp0iF2F7LRjCCUwI06TEnzDZ3o69EI/KPOEHMSqRDmj4nmmGRw48kUk?=
 =?us-ascii?Q?bS5K5hGxKw6Z0gGc/7E2FsEJkBjPivjNvyNyaQ8UeHnwZDPiCaJoS04ejApo?=
 =?us-ascii?Q?GVm/ACCxnWNgTD6hYCNN/lXSdoPW8ji9NqZQb+TzvTeYKjIBXF61I4iM97jF?=
 =?us-ascii?Q?d+7qjyyiJ67ADl4vZIxChxQrEcFJsEKwryxGe0HFKkhgxja0jzN6UrJkVVw+?=
 =?us-ascii?Q?sr2Y0cWesDGooBy0SPhtNcg8cUnocs6uL3kFyJ4zgC0ERG08iGQckSKBlyUf?=
 =?us-ascii?Q?jqQZB2fWDtoFmxqR44Ccv44=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ead1527-07ad-41bc-2cfb-08d9efcd7c99
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:20:08.9258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v13M5BXPVSd5/iGfQhcubLBTv//SVDiXI7IfNSjsj1Q46Xw3L6lJhU0dKE5j2aC1RVKye5g/V7hxNqyPjBN0jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8719

On 14.02.2022 16:12, George Dunlap wrote:
>> On Jul 5, 2021, at 5:12 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>
>> Introduce an inline wrapper dealing with the non-translated-domain case,
>> while stripping that logic from the main function, which gets renamed to
>> p2m_get_gfn_type_access(). HVM-only callers can then directly use the
>> main function.
>>
>> Along with renaming the main function also make its and the new inline
>> helper's GFN parameters type-safe.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Nit in the title: I read =E2=80=9CHVM=E2=80=9D as =E2=80=9Caych vee emm=
=E2=80=9D, and so I use =E2=80=98an=E2=80=99 before it rather than =E2=80=
=98a=E2=80=99; i.e., =E2=80=9Cderive an HVM-only=E2=80=A6=E2=80=9D
>=20
> I feel obligated to mention it but I=E2=80=99ll leave it to you whether y=
ou want to change it or not:

Thanks - I always appreciate clarification on my, frequently, improper
language use. In the case here, however, I know people saying "aych"
as well as ones saying "haych", so I'm always in trouble to judge
which one's right (and probably both are). I therefore decided to
simply drop the "a" from the title, which I think still leaves it be a
proper one.

> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

And thanks again.

Jan


