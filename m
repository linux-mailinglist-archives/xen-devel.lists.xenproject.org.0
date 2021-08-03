Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E78C3DEF36
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 15:44:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163495.299485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuiR-00066t-AV; Tue, 03 Aug 2021 13:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163495.299485; Tue, 03 Aug 2021 13:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuiR-00063r-6o; Tue, 03 Aug 2021 13:44:19 +0000
Received: by outflank-mailman (input) for mailman id 163495;
 Tue, 03 Aug 2021 13:44:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mAuiO-00063l-RE
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 13:44:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e46c004e-f460-11eb-9ac4-12813bfff9fa;
 Tue, 03 Aug 2021 13:44:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-0MldT1T7OKSpHwkgH4Oj_g-1; Tue, 03 Aug 2021 15:44:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Tue, 3 Aug
 2021 13:44:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 13:44:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0073.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 13:44:12 +0000
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
X-Inumbo-ID: e46c004e-f460-11eb-9ac4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627998254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2HThejoIp8FccxtAC5C5w3a7mNRsS8Nu4nw/7hYGTE=;
	b=S57MQ7zUq+1kSwh95vde+3D+s2EC7LGfzZBgIqZ9UpZEap4FYbQzU4TIdptmHZG3suRrbP
	YWO6px3Ypua5QFn6TV+lGOOsQ1RKrsYNLaX4B3Y0QkrM3mlXUM9bMtLx5LH5H68a81dmdL
	7hpmB4HfKEk4sdeOAwKMkwm33Zsa4Qw=
X-MC-Unique: 0MldT1T7OKSpHwkgH4Oj_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJY0EREU/BONleY41U7DLCZL0dO0BUi7NDGSBkfSM2qoYVXf/gudMyHgyOndAZLwhzHTxygnY3whbqcYasC912dPY2IJuFHsTNSX9265oM9ck2pswem430hUQdA8BufSusTkoOEvNwwJm4UEGF1p/3VNOmhfo5c+/qMaETBz3nr8SdpDFGZiHmqN1YqUzHpwKqZy/xL25taoY/6mteULXHietI2WFGRbPuudVT8vWWtZf8nlAxfa7jbH+ZyZUOIWoKKk5vWPXmsZ+cOrYzaXyeNDB1yzdCkxz6TWdkxYeGmn1EN0ti24YWHNZJbc0/HwW1M5Sjd76rMP6E27bTc46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGSXQmza9CTdD4S04Q9EqGGjwV4arTNEsfAY1ryr2TE=;
 b=emyT//9zq6y8fRA1cfbImzADXCbDaOJjuAxw+2N0baIZv/w/UnuN/mOcO6/6MAhV33A3XeZnclrnHBoiYGAGy3BmcED4ysE5srhL0PO9PmR5U+7Ul80GsDx/nm2by88ptKwZG8LhflfGyatOl9mhDPjsBN8XpADaxKj0hycKNv++xBDb5ChPsgHCVewJ/zGmGCWdxiOJO7njaZwwrtTrz9pkpeAPfADEMGHlL0y/wT5Jy7k+q8IqMU23l8UNd9zV3z5jfjk/ZR/mqIZ4mlj4/rATQuVf5V49Da4QVQ1x2pYc9TmTdw1uVi1V3wqxp1tu0elnUHQGUwJZ6zETybMVSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
 <YQk0vrH5Oe62ozbW@mail-itl> <ec1cc65d-5a10-7ef3-2643-622302cdafb7@suse.com>
 <YQk+I2FglGrnuyPw@mail-itl> <10425176-438f-370b-9d60-183d6e0f5441@suse.com>
 <YQlAsAneiMOD+SMq@mail-itl> <b7b0c929-26d8-c1de-7658-a58ed31ee9be@suse.com>
 <YQlE6XgSK207emw/@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f9f613a6-cf27-8432-c877-95a8516216c6@suse.com>
Date: Tue, 3 Aug 2021 15:44:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YQlE6XgSK207emw/@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0073.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb0466c6-0b59-45a2-7bb7-08d95684c70f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4848523934DC4A6D0778C027B3F09@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u1ufrdDvGBJu02Egwd/yKdyFJy4bM+l9qC7UrSREMcze+odQanQJOzlNJV4uuE9JMa0ccb/zqBduQFBlpv0gujZfcg2fqUcpy1TY1q16RB4d5nAO1Vd9zdjVO0Gg3L/jwZ8qJyr5nnx/WZJM3Bh8L40us7H7lW0ChHSRMplBoeF4E+QJmnZf0hHaS2Vffk6Ec3Jb35cTE4PFQYhC5kLGQ0NlpLSZ1Lz1CNY2xqW3UrI6a3d1KrZVoH0rl1XeP+scDd5KOItTMCTzjkR0ArrHKCEpPYe4o5hCYde+tz1k0x7SEDf+dtIf0NOzsKqAxDdYHF9oIKDjx0LsjfmytYmWPXl8ep1WTsh6D68MZ1WD4R7kgVEUrAJy+Lxb1EDRyj0BUjMXaeikKhNeT+EssmlfHElyL72fFnjKg2Suk0ubY71dwarpFVkj8nNi67ALxY1IXmXZ05wq+3HtlVY+vREWif6KMA88zsZ7YFh6mOle5QYMnDGjWNsKhukt4s8vuUjfsfNugryXrwOt4b47wg2Q2D45Vv3qcWPb8Ii+sINS7rkyR3rtrZCQkigCk7sHQh0/QA6WLEKFI46T/NtMoMCBMe4Yqth3edV8brtBNHzVMXz9wMt3Hqx3E9k4uT+CuwEf4Q3E/JFjs99Q9iiwgTMmTv6R09o804VhermL/9KLk/a8LATwaCdouwQCbt0miilf6QLQ+9Vxl2VoTQgOBCkwxRK7Tch4JH0QpKw58h9kLXk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39840400004)(376002)(396003)(366004)(2616005)(2906002)(86362001)(6916009)(6486002)(31696002)(5660300002)(956004)(186003)(4326008)(36756003)(66946007)(66556008)(26005)(66476007)(478600001)(53546011)(8936002)(31686004)(316002)(16576012)(8676002)(38100700002)(83380400001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7RoBf5sPHLwKiTcncIldFsIvsRGoSOFc86ReoY8FWuQ8GY/kTQ55JC2MsPPT?=
 =?us-ascii?Q?jbVlR1cDId0iqwsM/lIl7onbmnk71ZfBROm5ig7I3Lsuz+qILK5aNRLnhQmP?=
 =?us-ascii?Q?4rvoY8qQaBlix2YnbLXrhcLgdcvsQxn51M0fFBqguSGXimi34WdEzqjHI6f1?=
 =?us-ascii?Q?BeBLcJ6Zx1RT2th5Er9/s7M+8pCNLfTK0nw8Wnvw99MYEre+7IvNleMaICNu?=
 =?us-ascii?Q?l0xz3qkoQX2f8bsmVRr1RUW3Ncz1gCujxwRIpdR0EkFobXhX3lCpEpKcQ3DN?=
 =?us-ascii?Q?mk6kGp73F3XWlwScdkvaEdnHUroWczX+SailTp0YelH8y+wewOLqR/Tl5DVU?=
 =?us-ascii?Q?PKciNKUjfcwTCj5fqW0svqdUXO0y1t6seHyrTUynH2mDNyjG0Z+kYWVn6na4?=
 =?us-ascii?Q?m/5dP+1fFI9C4XMSzOt5A8ZEnve7Fn2/cr6cjTAxStME8c1KJV6uvhhCrC5p?=
 =?us-ascii?Q?/1y583EVA6zCWq8eP//VSOsMGyj3Uz72rqbytf98rEtWppsZQXPB+X6w+jsy?=
 =?us-ascii?Q?xUI+meH6gaJ4qKEZC72citbaWvdLb3iJQY0y/atfT2ZdrPjLs6PjJ/wpWqql?=
 =?us-ascii?Q?HksIwTZKuEKIyjBXPQmMZEmgx6pNIDU+p5Nk02262Gj1FYyhWlzaCJwrii9R?=
 =?us-ascii?Q?LBM6fh/J/Q4xJY1gwOeSLxNe8r5WcFRfPOGbF9LZX8mPpt+4ZB/XWj97pbGn?=
 =?us-ascii?Q?G0XJuv3pPJsCL+7qSLCrjYS/UfIlq4RNg/mVHhI8qjsTUBYrIa9g2+52Nfm/?=
 =?us-ascii?Q?h1krJ2bbKA0Viz7D6OurGlH7s2/OvQFD9Z480GuP0Zr9P+/ww+C6licQpxu4?=
 =?us-ascii?Q?WrPHaAjeHcM214SeuzAOBaK2i9pW7dtt06yTHgYrsNhNzbXBRdw+HjP0lnbs?=
 =?us-ascii?Q?0KvM79p+Mtj8M3esm6iY6fijIRMoWRKOiuugS7fMXVUX2vh1BVPTctEEc65o?=
 =?us-ascii?Q?6Nfgcum0sjoRyP3FglnAhZpLxyjJcETP5VzPCLdPfT0/22WmtdXyjQMt0xKr?=
 =?us-ascii?Q?2ZbvcHj+CafDbHwegJfEVh1absMH2rPYW1k1/fTiXq6fwQyqxwcM8sGxVnfp?=
 =?us-ascii?Q?rK/uA+snDZ2hiUvv4ZSTxaH0Wy2ZXhBgvejoI5ZJlTzviPBqNh0aLHLnXD1z?=
 =?us-ascii?Q?8ArlvBvnEo0b6eKlyjSu66FUgBwknFP2NqocoXrfM64dcGuxFqgOzD6hEg1k?=
 =?us-ascii?Q?l0AmFd2vX6mXVufLWYbhjyo3Jj7VuG2UhB0xvcO5gcPZaLIvZGdK17ZHb8r1?=
 =?us-ascii?Q?CsiePupTXQkiIV/cqLr0Zko91lD2nvF0RwYQXHyNsyhGAAGsKGfi/LD7emms?=
 =?us-ascii?Q?Xn2Yb2ompijWL/eiFHKV/2EH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0466c6-0b59-45a2-7bb7-08d95684c70f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 13:44:12.6077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l12RMB7TguUhNWoyOiCalXhVDtYu4laAHnAz7PNnI7PKICzRFTisB0pFIEefxEiFlGMRxMO5wFvTfgFxX6H9Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 03.08.2021 15:30, Marek Marczykowski-G=C3=B3recki wrote:
> On Tue, Aug 03, 2021 at 03:16:14PM +0200, Jan Beulich wrote:
>> On 03.08.2021 15:12, Marek Marczykowski-G=C3=B3recki wrote:
>>> On Tue, Aug 03, 2021 at 03:06:50PM +0200, Jan Beulich wrote:
>>>> On 03.08.2021 15:01, Marek Marczykowski-G=C3=B3recki wrote:
>>>>> Ok, then, just setting iommu_intremap=3Dfalse should do the right thi=
ng,
>>>>
>>>> ... if "iommu=3Dforce" is in use (but not otherwise), ...
>>>
>>> But that's the purpose of iommu=3Dforce, no?
>>> With "iommu=3Dforce": strictly require IOMMU
>>> Without "iommu=3Dforce": use IOMMU on best-effort basis
>>>
>>> It makes sense to refuse the boot if intremap is broken in the first
>>> case. But also, it makes sense to allow using IOMMU without intremp in
>>> the second case.
>>
>> I agree with both statements. What I disagree with is that the latter
>> happens by default (instead of only upon admin override), including
>> the case of intremap being unavailable in the first place.
>=20
> "upon admin override" - do I read the code right, that iommu=3Dno-intrema=
p
> will actually achieve this effect?

In the case of this quirk - yes, as the call to the checking function is
gated by a check of iommu_intremap. But by "admin override" I meant a
per-guest attribute, not a host-wide one that isn't explicitly meant to
cover all guests.

> Will that allow to use IOMMU without
> interrupt remapping on a hardware where it's broken? In that case, maybe
> at least add this info to the log message?

You mean to suggest the use of this option? I'd rather not, to be honest.
I don't think options like this should be suggested to be used. I'd
prefer if we had less of such options, i.e. if they went away after some
initial integration phase.

Jan


