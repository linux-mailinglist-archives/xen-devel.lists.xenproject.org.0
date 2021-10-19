Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE094330F3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 10:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212873.370928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mckLt-0000j7-2u; Tue, 19 Oct 2021 08:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212873.370928; Tue, 19 Oct 2021 08:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mckLs-0000di-VV; Tue, 19 Oct 2021 08:20:04 +0000
Received: by outflank-mailman (input) for mailman id 212873;
 Tue, 19 Oct 2021 08:20:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mckLr-0000RW-7U
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 08:20:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c84f66a5-c0aa-4c14-9141-15a758139818;
 Tue, 19 Oct 2021 08:20:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-aQKHriRwP7-Nl3T92WmYkg-1; Tue, 19 Oct 2021 10:20:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 08:19:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 08:19:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0025.eurprd08.prod.outlook.com (2603:10a6:20b:c0::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Tue, 19 Oct 2021 08:19:59 +0000
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
X-Inumbo-ID: c84f66a5-c0aa-4c14-9141-15a758139818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634631601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLd4LSj7xY3Eb1qHGJbLjUsKx2l2uyskN8OtKLVs6ko=;
	b=IPYryWizBJsWuxU9sUT7Em/FfQN1OvkBJ/VIvVGT1ilduNRvHjLJFjWVf4/nvG+D8qpGFF
	CTo8gY9tXmAM/E8vX+jCjNNJywGBzEGDkcZdkUKvDTcBi9SYhwFjW5q6v+xDrPGEBND3fo
	3aRrY7cFDeLIoW0sgAUqR77MYiLXmhg=
X-MC-Unique: aQKHriRwP7-Nl3T92WmYkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6i/2BC0MKz8Md4XeO0Um0t9hP7iTzkH5HGhHkf6zF32N6yfi9ReKl3itKkBcG7xDvEG9enAA2CLUvthpiPS6vlkOi3XY0XNRz5Id6buTF5976JuKf3Z+beGE8WvGIo9CFAPvB76wdMcRX8bJNEw06MAsQw+rqEdffkS26mBlqr6abCoea3w5ikfCVAHAE/KvS98kpA1USlrwwMBELXPa35v5RaQueUzu77OvRByby9FnIJWJVs2kjESmesfplU0uVFaQsWP8YfmBsnH2ZShTKar7go7gleNEqP/XlLywy/oxub6MIOsikRkwvKtWy8FpaasCAVTL5PGN51TM+uT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baP6DYa68zhFQLDQE0GpQyqWX9/SJ38GAe8So7JQDY4=;
 b=F/VtC9kukHhaSrcXpObCq8prBsNYQbOgk+XfkCJbIE1A7sN77GlNdR9HbUmiqNKrlPr7GyRwJmvy8uvep3mR3OaCzhJ5SmuRZNzMZgacR5cw+7XXonD8bKEwyUJXc088dG2phlL3Hi1pw/KQ4h5BdWzNCRUletONBawYKd6zVXNBrgc/ykOJjwKIrtyNQo2rq4Di7m9Mz8Viob/QhhNExO37zMQ7a5O6xFNyYDj8akTprNC6rxpXCbDsyTLOyrgBP4yArGLJj1pJA53hUtdmqx/+lGOU7q0KDWYcngoMtDLhwwyhJqw5AgjjSrwym+C7w2EPiCqInLffVjDD+gE0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/PoD: defer nested P2M flushes
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
 <YW59OUi9tpnGccl7@MacBook-Air-de-Roger.local>
 <fc543483-bc67-1323-6db1-b335bbdc4238@suse.com>
Message-ID: <65a88325-909a-7995-4ded-c9d77b386129@suse.com>
Date: Tue, 19 Oct 2021 10:19:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <fc543483-bc67-1323-6db1-b335bbdc4238@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fb39872-8f99-4f01-e2bb-08d992d93dfb
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039B8518846A88F5703D6E6B3BD9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q/oO3kYP60iNSB1sXyK2sDQ4OcY1Jaow39W1MdLUt+h4e0S+3daJrdiCoJu8NsSnVioQHV9cAcSc532NzyhtXUpWcbJg5oc1LaqVgTWB4ZcZxlLnbzMvb+0Ts35aqrZNZ4phtma2hHTdX5j8yUFHjywoCZOP+vnt7DhuTKO8fIb3sKGj30ynQ8YO0YhlOJZCjq/l22dlaP1Opz0aKmmsQdaVZHEqm1ni5IORTur34cjl17aMUDFYlWmJ4Dg9AUton8UYBHpUM6OhL/5q536q+ZzezpsE3gaix9gy0f6JHCeZ6Bf4wsu87xWYhFPSkzKbm4wwIo/cF2IB1Mxi7BWMuWWaWIAfWwpUjlGt3y6TbhI/rXxFzBFZTTi2jOuYUv5I1yEbzNk8+HdvF6j2SK8xlozLDvdmGWEfFEbsH99vpC3QZxs5Ah+5qO1aaLisBOLVboZAHVEmzdvQb9VvMO1Gy9Cey7MHYyxQQVNDmoTXonZNRzPlEIZnvAmIG14N7ah+l5TLwXwHkdyl4lmwD9hczFAP0DnUcle4lzSuosziTy5Qm20KZAxlUiNvinWUlLAhE8Lxhd5UzAj4rnfKF4ejr8aa09q2hmFnW1UA30IzExuGmmquQCqqwSuUSasd28WU7RBONJ8ZPpYel6uKxOVWn0x0fAIzWt0SWXtVxN/0sRcX5sUzwv0CJdXLIIVwVzIP9QCUw5aQr5ppE+vFKqQREEhKO9mR0g4sdnQdaS7l4ag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(54906003)(86362001)(6486002)(956004)(2616005)(2906002)(8676002)(31686004)(31696002)(508600001)(53546011)(6916009)(66946007)(66476007)(38100700002)(5660300002)(26005)(4744005)(66556008)(4326008)(36756003)(83380400001)(316002)(8936002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?djxIAC+Q2NCqFXLnxiJct47hkRlOGeZejz4Fk2hr3u7jJBInUk/PclFlCN0W?=
 =?us-ascii?Q?w3EBtoWMGvbObE964TSRS4TaagAhKQ0kr+ovTq6khKCzUkf1eG+apKznmTou?=
 =?us-ascii?Q?/Yotlsbtwu5ajsb5VAgFEKCm+1X5ZpgVpLI/jp/KcLkimKqHztRpuHp7K3hs?=
 =?us-ascii?Q?7KPyaGkq0qr8iso+g5PqrN4NVJ675tAUgT6u2/0fRejy+quAnU+6Jl6+tnBs?=
 =?us-ascii?Q?DY5hD8D6Wo42eqYcY5ASx9Wb6oZR/ZFekUYRYJuLzR6Aw6m/O2Mb5nqWKCwm?=
 =?us-ascii?Q?o67sWQ7Cq59CCJwJVLKZdIcSpFB00of73AZ8t0T7GBsJjLHqruxBXkMCIG0R?=
 =?us-ascii?Q?lVf7NPe/++vf4zT9BvaJ91oJoQ88UycPo9u/GAInEg2JCNOoCpv5TZNmrAqm?=
 =?us-ascii?Q?QgBoeGJNRdKySZU+eyivuxfjV57n68/l0/3KHt83cxH0BpmyVkiFvsBi7gER?=
 =?us-ascii?Q?w6fGU5J5OL4f8N4N5Zi28zkFBMA1VYaXqaG+0kPtxuWvCkrFwWTXtDm6N4t7?=
 =?us-ascii?Q?SjKi6Q0OZWZf1lBaTecMnlY95SvHVxr1Y9Ebz54Mm7oU9rwpWMf3HAX66pM7?=
 =?us-ascii?Q?jyPbgYqRPf3l1vGZI5wLcdjT7ctYWxXoBSySwuWuGRhod61Y3AWX+H0Iv26C?=
 =?us-ascii?Q?JHL5jOGOQhGcXG2a7D8n3Nl6lItS44NCMZMzRgu9nK2Zb2Fib4rrDIv+9xyz?=
 =?us-ascii?Q?bpla+S3TfoHHLL2k6m9HdGYpI6bwowudyHoY8In4aJZ2m5FGKu+whIUW3IhW?=
 =?us-ascii?Q?63SWOzObaPwoRl7JFeMuOWqxEbbVn6/EA5LDYvRt0hOuF4ZwSsDegGBYNT0S?=
 =?us-ascii?Q?iblT6GtPg9r5lNHyPVfHFjW1yWcnWHbt5ThFiWQdp6JGBOVLLK3btZrVNW/S?=
 =?us-ascii?Q?Dwf9UQ1Ybz1P2sTdJIpJjsmDoS8C0FVI0GvzkArHz1gk5Z8MzDbkUzVNrwfa?=
 =?us-ascii?Q?srV22BwAN36xrTIBDGmC+JmDDXHJHGJ4wzyBzB2lbNFikHZTlHYMo3tTd9Jd?=
 =?us-ascii?Q?gLYOEop5Zhc9hXs5FBfWcrP/+i0bCrWHueqRfwMhGDDAX+2hBxbNquZrc2iZ?=
 =?us-ascii?Q?0X6LEct3RCtp2ziEGNF7ijzkgTBDEFYMSp27FSFr9Q1eX30PnMnpjvycGn+1?=
 =?us-ascii?Q?yRznJhK56hkxHyzvfXR4urVT5Hf880WoPRzuhbXQni6oB78SPhmBr+du/gbS?=
 =?us-ascii?Q?/X9KZ2VHiPY2MRaM1hyXddQ6bKgQtdQbcjxizZKhXX4atwiInvHEZMDNI1pa?=
 =?us-ascii?Q?IG2yF7OYpY73vgsTfQPyw9ZopAFhGL2KZsXyDA9M7fUI8qp3FIG6c3l58R+c?=
 =?us-ascii?Q?Qdy/ZvYQoiJBf5rRQ82HGYDS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb39872-8f99-4f01-e2bb-08d992d93dfb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 08:19:59.6231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UG6os5fLwHGzi2+4PSOcsfV4IKKYk9HL6z2lh0TSlIVZcMIGCTC06CevJNZSpnED6eXj1YxPzCVaFsX+M/NZLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 19.10.2021 10:17, Jan Beulich wrote:
> On 19.10.2021 10:09, Roger Pau Monn=C3=A9 wrote:
>> On Mon, Oct 11, 2021 at 10:17:08AM +0200, Jan Beulich wrote:
>>> @@ -1229,8 +1242,9 @@ p2m_pod_demand_populate(struct p2m_domai
>>>          __trace_var(TRC_MEM_POD_POPULATE, 0, sizeof(t), &t);
>>>      }
>>> =20
>>> -    pod_unlock(p2m);
>>> +    pod_unlock_and_flush(p2m);
>>>      return true;
>>> +
>>>  out_of_memory:
>>>      pod_unlock(p2m);
>>
>> Don't you need to set defer_nested_flush =3D false in the out_of_memory
>> label? (as you don't call pod_unlock_and_flush that would do it)
>=20
> Yes of course - thanks for spotting. I had pod_unlock_and_flush() here
> too initially, and when switching back I forgot to convert rather than
> just delete that.

Oh, wait, that was on purpose: There's no point clearing the flag
when the next thing we do is invoke domain_crash(). If it wasn't
that way, I don't think I could avoid using pod_unlock_and_flush()
here as well.

Jan


