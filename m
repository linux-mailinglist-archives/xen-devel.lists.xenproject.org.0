Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D54743FE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 14:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246770.425573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx8Iy-0000wW-5n; Tue, 14 Dec 2021 13:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246770.425573; Tue, 14 Dec 2021 13:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx8Iy-0000th-1w; Tue, 14 Dec 2021 13:57:20 +0000
Received: by outflank-mailman (input) for mailman id 246770;
 Tue, 14 Dec 2021 13:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx8Iw-0000tW-Vi
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 13:57:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfdf976e-5ce5-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 14:57:18 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-jdc5vjMpMc-OVqkVnPCM6w-1; Tue, 14 Dec 2021 14:57:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 13:57:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 13:57:13 +0000
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
X-Inumbo-ID: bfdf976e-5ce5-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639490237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d82SRRXUwYU57am3sBelN7Vzrjljofv/UekY15CZkOc=;
	b=DmO8CwF6R4Su9BKM8sL/s5ISJwoWKe+79ukHu/DwEaoA2T1nGpWh9EZ7jqhnmJ2HkeWK2G
	4neeQmVs8tzQbVowuCAp8o1MwmeCkNtrArd9kiJKGbs13vm9Iqc8xa2xgmaIOFKzpyD/m0
	lC4ZmPL9rZFJHgAac5pfVrDFRm2Mk3M=
X-MC-Unique: jdc5vjMpMc-OVqkVnPCM6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWJVqiQBJkLd6D/8D9HjHDoqRMUwpZjYJjm+PWn6BXSgvUIWpCctHQhotxPOsRDgJkQuDHpPOW/YduyEv4IOcDzVbr/9ZOjE8NjqLNLHWffMVntHtxL9cdYi2VQeORnAg3GTieT5hhHBz8cc872Aih2Ja4rep4zXuanlWyt/uCcixKdSBzuXXwNa1iyhgS+EdDJuhiEIU0PrQ/iJR+Y0NsBysaONsMeOA4EBKXChd4WwBNW+zO21zkyuFDxzpfFuMLJI4DvpZ7oheZjEiptntuWj7LX+77t5J6/86Ygi5VDX99kqOYBkV4o4+Tw7tsG7ofbfmcrRbGjiAwJtB5ENqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gL7B/+3GB/q7NpfNxCWO1Yl+U7BzzRJ4Nt2Gs18E03Q=;
 b=YVvyiYpwEqDdDPKoWv2zyDQN8867rOlUQHvWAY/BbPO+JfcbxwZEQhDbUi9c3tf3VX7o/54v3rdy+aU8xJtpTkwKfKnHNOqR3Ev1Unz0fti5m8cDM87sqKYJUI7+gM78D6S5fliFtj6074NDugMkoHBPfxuFbMC/HvArfckhOvd4DOZMrhwuZUZ2Ek7I7ujEw4P0L331t6tX4pnErzE+k7+bIc+q2mWb9A6ze/U+D2XYPfbrQq6T5xzJ4ff82Kmoj6EcVmmXR8eHryn9mzBNwU825swyamrD6aC9aCdU64DTRHRL9yCF/A3gxOOUaTeuoIfxeN1exCnRzNQdjAxFYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72ba2a9a-e5a9-5a42-9761-f8a68dd9c70a@suse.com>
Date: Tue, 14 Dec 2021 14:57:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tools/libs: Don't recursively expand MAJOR ?= $(shell
 ...)
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211213190449.4830-1-andrew.cooper3@citrix.com>
 <76367980-c0ff-13c6-4a86-24be90f28f8d@suse.com>
 <4210cadd-a717-2a8b-1cba-044f2bede588@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4210cadd-a717-2a8b-1cba-044f2bede588@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0115.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9b53dab-c65a-486e-c1c9-08d9bf09a11a
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6174E44F0F43552FD6FD6F44B3759@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gs2C1nq0zrNUIq5ebEM9KuK9cTLyTJLjAatFvU18ahX1BWHNnn+ufVnQzLohhMpYe5Vo/UdpJogiRSOPt5Xhb1xWavDX0Hji6Z15uOYG77+tmtErkRDkPoR3/zU48G5O0NXK9RtxXWTZdTqtFNTMlMMBvR98oic8za+0idMrH3Q4B5P4dTiM2mKrUtyXTirK71c6BLyTUAJ49oTxhSG6uCoV0LPwMJRSpxENN8oTIZT4XbDi+9b4U8LiKBgVOv/2I0JaNPVvGc+mO7RzMWndwO8eIJkKQRrClveuAMINCfqxZKXf6nU0Xei+D8Hp1vPQsG2xmY5N/C0Ys50V7v6X6sjctpQa3MRMM0G++h7IG+OAqvtyXdW8nRC6scOcPPOAry9A0y+TcTBmvdFjjd1iBBiPVSU72bUL/CLwj4YelZLUCWiumY7/hmtoKjerD5f8VrSwL/OiBovYKFuglVFXET+4pzkqQSQgnHA4yqusRQ/6PKOXDfYVQm+zRKov9n0s7+cFPrkxaR2L+NWs5zBPZCdMtGQ6mNC5kd8d0VUoEqyW+04h4EF1ULONaep8vIy8kmwzHRmVdm92dKYRSssmsHuPNgOznFyXAl6VIVN4V+0Y/etAzJSpktlqvHByJn/jxFXej1ZoNtsW6b4+HEge5qz2z1JFus2Io4I4HzcQxkHTuPoxjnFfbFa137ZLfFW9PLAJFZvIGvzhS6DrYZNuhI3n01zoQTRuiexjEYRkfZyCGgFprGj408MWdPjCeMxY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(54906003)(26005)(6512007)(38100700002)(110136005)(31696002)(316002)(186003)(8936002)(4326008)(66946007)(86362001)(6506007)(2906002)(36756003)(53546011)(66476007)(66556008)(8676002)(508600001)(31686004)(2616005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Ey453SWY6wTfdKKZolnDy71okboyIGJweyWv1vOzLX3RnFKtLKwgXR8S613?=
 =?us-ascii?Q?dvpWuBrJn55wvGmWT8L9lISjIGKWhBCNc2J7zbtu0ltGfHXvPXSypV9SjSUy?=
 =?us-ascii?Q?8j34qOaB/iWJQrPpci1UakWfDR3IgPXJLvoZOzE4ALa/KGKqGr+1BomQF9jo?=
 =?us-ascii?Q?nIV5RiZa8eysQQexM2ht5+uWvio6rUWF3mjR8Y2pad9pu/n3+qiYATRjNVgf?=
 =?us-ascii?Q?GO0B8NVuorFMiodKnXCTWUzTYeIx/YwK1+ZxqenlTgBQo598tyze7i6LRden?=
 =?us-ascii?Q?grJ/WTJoax4IXDm/VguR87NHZel7YY4vkoK4iMWwlbDohF2ldEwnpLu4cqMz?=
 =?us-ascii?Q?wVVz8CLv7pieA9yRkzhdCFHEuHDZECUeWSuvExk++l+u68FZvNkP9wW3Ity6?=
 =?us-ascii?Q?186U6uJWxQzx9og36ldhVVNeQmvMajZmQebO8zPav7DCr1LjJ3EhP/2iEfv7?=
 =?us-ascii?Q?and9k2kcc7lShtB2x8NNdc6xRLywrbSwo94z6kAunQBqfo6wCdKxkxNcAAQ2?=
 =?us-ascii?Q?FS8+uv8ixV1nnwzHuS0JUrcnaRwNtsC5pK2oCUrCg0ZLo6rBkvG79ZG6NOZj?=
 =?us-ascii?Q?pTwaS/KP0W4rmlB5qZt1WWFSHkfQwEvuzASBFWWI6NNvVhwGPJnCnZ63I+6M?=
 =?us-ascii?Q?41uvY/Ozmxn2JuG8RgEdMWOG5Easof3ITOanWvfrm1/U6/5zv0tWcKXHNamS?=
 =?us-ascii?Q?4ZO1e/vOgJvrTIHS1HUF/t91fwoV+yC77ftsIm91NYjlQRsKAXo4CYKt1VwD?=
 =?us-ascii?Q?UggrgxqjyrHyOKb/uOKj+cqOfzd73QAhwO7Cawuilh8OJN0lY7UZprbdu/Kr?=
 =?us-ascii?Q?lg5DyiEEVK4Ota2kiGUea9vHVrvCUWFvTcUGdzCC+PZnurr7czThpQ1tHeCI?=
 =?us-ascii?Q?ywEoG9iIILdTRkM+BEGmYfq/BqHy36Rk/efoYznKu8OUE5HesSUPBPl84S2s?=
 =?us-ascii?Q?kaek9qKEMh9tnnJHV/BqDt1mpy6m9QRDyy/EEawh6cwhaeCrg58R2l2vt/hx?=
 =?us-ascii?Q?K/YUSgnJVjGcaFeG2B25PbI6lEEW6jdDqslSQC+qEYu9fTWDP4ylEX+jWsiX?=
 =?us-ascii?Q?GEQwtIicb54a2h3nnHqV1vE4mPXEjbWAYw1d14p9Et5AU7lBlnz+mCRgrhFn?=
 =?us-ascii?Q?ko+NzOqU7Rz3H2MIPDEE+hSffxmls0rVkF0GTFomHphmnUZnVTKH89w3qRJc?=
 =?us-ascii?Q?iawzdgfCyVF0WDgodl6zWhGZiddljJgVdHVDJDsaZx2dZXvA0m9Z5DITEwm+?=
 =?us-ascii?Q?RlIxHzhAAUrWTMkXoKSrMNW9GZTbYOI5mlvr7vRxqLHg7R06W88jeNS2Foab?=
 =?us-ascii?Q?VSHP9hz7GdZMJqBrdMKEvL+7UKmyRlh5l92nBsa12yPSDAVEo7G2y8WZpLs9?=
 =?us-ascii?Q?h4INMqYBb2XqHLgBy+6wrLsSkqHWI5hVmVxwvM198qmUpv+7s0qhzYL1QLBD?=
 =?us-ascii?Q?BcrwG8NoYUKAoj8OrQZeR/0iyldHS0ymlSboEs+FiqYs8Ahii6fSKUoS+v7X?=
 =?us-ascii?Q?QJcb7Yl4WJZktM2rs1w+CW05aldyJNUiWn/da7zqLMrXxYcCrcu+4XxCEYob?=
 =?us-ascii?Q?OjktS+cssJnRU/H3qb63pIvnExNvDj71O+KYleGMVrLQhgURjps113wmVDHf?=
 =?us-ascii?Q?OLzvQRYxph90LrCly/xC3RM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b53dab-c65a-486e-c1c9-08d9bf09a11a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 13:57:12.9661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TeS5nlHnE6+89yveZ7ECVt9Z/pT4nUCsgjdOKxavOGxpYC5Ge9/v/hElQ3Tp3H7APhyUReTQ4wcq61AX1hgzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 14.12.2021 13:52, Andrew Cooper wrote:
> On 14/12/2021 08:17, Jan Beulich wrote:
>> On 13.12.2021 20:04, Andrew Cooper wrote:
>>> --- a/tools/libs/libs.mk
>>> +++ b/tools/libs/libs.mk
>>> @@ -6,7 +6,10 @@
>>>  #   MINOR:   minor version of lib (0 if empty)
>>> =20
>>>  LIBNAME :=3D $(notdir $(CURDIR))
>>> -MAJOR ?=3D $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
>>> +
>>> +ifeq ($(origin MAJOR), undefined)
>>> +MAJOR :=3D $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
>>> +endif
>>>  MINOR ?=3D 0
>>> =20
>>>  SHLIB_LDFLAGS +=3D -Wl,--version-script=3Dlibxen$(LIBNAME).map
>> Wouldn't it be better to move the "endif" past the setting of MINOR
>> (which then could use :=3D as well)? Libraries with their own versioning
>> would imo better specify both rather than relying on getting 0 from
>> here (which at present none of them does). Would require an
>> adjustment to the comment at the top of libs.mk, though.
>=20
> I considered that, but decided against it.
>=20
> Absolutely nothing good can come of having a mix/match of whether MAJOR
> and MINOR are set, and the whole point of this logic is to provide a
> safe default when things are unspecified.
>=20
>>
>> And further, since you're switching to $(origin ...), wouldn't this
>> be an opportunity to avoid stray inheriting of values from the
>> environment, by switching to "ifneq ($(origin MAJOR), file)"?
>=20
> No.=C2=A0 Not because I think setting MAJOR on the command line is sensib=
le,
> but because it fails the principle of lease surprise.
>=20
> Basically all variables are editable on the command line and the
> environment.=C2=A0 Prohibiting this one alone is bizarre, unnecessary, an=
d
> fragile in the case where if it is encountered, it's probably someone
> who knows exactly what they're doing, trying to debug the build system.

And then there's that someone else who ends up having MAJOR or MINOR
set in the environment from whatever was done previously in a shell.
The two variables are simply of too generic name to sensibly be
communicated via the environment (and I specifically separate the
variant where they're specified on the make command line).

Anyway - none of what I've said is an objection. I was merely hoping
we could get the whole thing a little less fragile at this occasion.

Jan


