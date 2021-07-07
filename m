Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED613BE40C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 09:56:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152008.280874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m12Pf-0005jl-Q1; Wed, 07 Jul 2021 07:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152008.280874; Wed, 07 Jul 2021 07:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m12Pf-0005ga-M2; Wed, 07 Jul 2021 07:56:07 +0000
Received: by outflank-mailman (input) for mailman id 152008;
 Wed, 07 Jul 2021 07:56:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m12Pe-0005gU-4b
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 07:56:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d59f4487-edde-40d6-aaf3-f8b5d91926b1;
 Wed, 07 Jul 2021 07:56:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-h7cbHuM2P9-4Q0PxI_xFQA-1; Wed, 07 Jul 2021 09:56:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 07:56:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 07:56:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 7 Jul 2021 07:56:00 +0000
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
X-Inumbo-ID: d59f4487-edde-40d6-aaf3-f8b5d91926b1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625644563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kY2T5N0lukkGYt2uXO3QTJ+GAh+pAWfNxRwbGjN9srM=;
	b=Ux6Cqs+krmTaRFHZHtW2uxzqHbTdppGhx5PVMEDaJo6dmR5E2ar2QE14OtbsGiGpqwnNf5
	7Z+XjQzN9rmYRj5E4Spn6U204XqHvEVIidF5Ql8arnI9GlXifkaxsKalyJhK6TgZZst93O
	K7u8/JxjR2f/gHw6oKwOktEECsoMd6o=
X-MC-Unique: h7cbHuM2P9-4Q0PxI_xFQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJ8MC6UVGVCZ3ILZrbqo6vfaVeHDlQ1BtfsKP70I7uvE5IBu7vI9BnYlO0QVjVVQRx5eYfz0bn0TgpHXv4woU5XJ3crRbpVsc6LW074JZGLJZyd79GEbLgbHIsg1kiCOk6Weixhb9qdB4ghf66YpOWlmBaMFNILVWQDUUgGSsgVkf8iUSGw/0CdGCHyIZZtNNqT713Iv70I1kz1+Rvz8f9KBKt7tdttzas5yLF/lLhqSA/aeYAQf6PlFEz39xw83ipUBb5i5SxZBdj0JAou2bMm8fyF2xSeONopk/M777OCUrVUgN+RjbzLWYQhNDAkZ2qFZY+nHHB6fKqO2J/QjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTvlHnnyONX/KH0jqIumGVdWjPlusGv3/HMY3wmdLH4=;
 b=cip45uaRAV03BJXvSRuHqaAknUu4iiWRbQRKuck82rZMJo3M7mR9/6L8Sw+c10mU8+BjpfwKFRTZrPfVkKfZ2UwjU+rW13cw1nJ8OOXad7glqu5Pen5rgEq5DZXO1yZ4xDPkkYGkMkdrPKTbS0SuMUVJFACyKR5dSHvC2hRiwkMwFYVedC0azfURSE8LJfBbAK/K6mODoaziOgfmSivWTXFmJCqE4rMOSwsxlDmb9yO4m10HxMc8woM0j8YbX0PYH50eMOwKIQL8GdOmd6HiLiInst9e9A6NzTbFfat8dCzbhbER5G+yd7aoEVxdn8KDXBSF+q0TxwRz81pjPZWNXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: A possible pointer_overflow in xen-4.13
To: Rroach <2284696125@qq.com>
References: <tencent_A17CA7BA63F6E47B3FE7B1AC54E55B2A3609@qq.com>
 <fbd1eb89-695c-5c23-da07-ae16fd567010@citrix.com>
 <tencent_40EF4EF7C31E752FD2BCB7D5963C44459006@qq.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <912547a3-92a3-8d65-30d5-3ca264ef79f7@suse.com>
Date: Wed, 7 Jul 2021 09:55:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <tencent_40EF4EF7C31E752FD2BCB7D5963C44459006@qq.com>
Content-Type: text/plain; charset=gb18030
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR2P264CA0012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::24)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a119c2b6-a10a-4203-1258-08d9411ca945
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5472B95E9DBDF54A975EF16AB31A9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ubQPlQsYazCGBOkJ2HLbGtZXKUCsRX6pyJK37pq38hX0AedGUmNPrgjtwoQ70E4sJ+0d6pj9K3fI59wV426OX1Y7bRW5xKJH338nffiVA2taEjHR7qF9tJochXoUjjWaQZVOHJ4zrNncjP2kR4MBrDK0qPlx4ST4ckkkWigFcV2d1oDIJWY1YaVtOwqdlCziIAj8leswYf9n9EueZ3zavdoOFwZvAinoj2Afk3ks0mUTj5EswQg8HPoPs/Ubh4Ks8BLvjHO+DG9s0ZLR9i1ZjFjjW5NfD+DCAmKtDXtnCP1ZRwNmS750zKwkreRuKlvIrsd0Xtq9/hKG36uc/DVt0bQ+0YXHk4m1pQxa01H23w4WU0PEukFH2dYmw3kUmuItx/xef57FqqjZtSJGjqvHrYcjCubJA/9kbqSg3H0nMQ5pPJopkCDXxb5xkeEW2NcPQyuzxTyVjEA76wnwTEFo/NkYagsHkxfGv0l0NL7o3EeCJUhjTh6y2Ep+ALAsMThLxXqKE4HAS6dddZMIVjuXWT90vXCOvMY/JQu6b2cRkP3d2ehtgGD9XBnL5y3NoDZpcNZ1rMUULidk952J9XGF2GxxKD4TlgfchNA+BWoRLXIXVb6EFyza7EAnf4om1hGWCrjLcuUbfhu8Qjbhgv8Y3Hii//lkes+WBIWZWZqXR4wJzg7rQZYA45pu+NtIXdXfn5ZdC0g8kNzuuS6Wc7SNzBHyPoxj3rE8DjKBb3t94k6+/n3QEG53vk7tJ4ohaFGN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39860400002)(376002)(366004)(396003)(478600001)(956004)(83380400001)(2906002)(2616005)(8936002)(16576012)(8676002)(4326008)(316002)(6486002)(6916009)(54906003)(66946007)(5660300002)(26005)(66476007)(86362001)(53546011)(31696002)(186003)(38100700002)(66556008)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g3UOi5FeosXoas0xkN32z6VRJ8YeRLkhapTt+Dr+pnDuJAHBTTofefEClCBx?=
 =?us-ascii?Q?5kRv6OmA6orRMQJ/etUoyS0Q97zbY8pSNHtcCkWY2bgmBSAeFKFjqr07pvYS?=
 =?us-ascii?Q?bE37uWvCK5H0hLlFpwu7L37EfeFHOxkC/kuwMlcQJYYEcgKTxcoDuZYslVg5?=
 =?us-ascii?Q?NO/NWj+08UeLlJgu+Rq87sWKhZUJRqsQVi6oHDlAYz1ziuYYWxgFgeA86v7q?=
 =?us-ascii?Q?QCoupzz6uaV60IXyUfy6qVcXk60LN3ZlCITrj4f64+cSY9Kk0Wcj7HXiqZyP?=
 =?us-ascii?Q?EzJI0UEz4C70z7xBHHoaHv6+b7Y03BtFkksn4qYgCBPiogpBsuYywQuFBbPj?=
 =?us-ascii?Q?r+DzW5mwB7/Ql8OuuUqWM/J2/+vD1/kYdh6DkQL/9P7r6wvVaI9F1cdZTDM7?=
 =?us-ascii?Q?s0+J1bWbbboQ2oZu2twH2Ulq9USwhp+MtOsN2f6zkz9BUGaNt49av9mtUZEq?=
 =?us-ascii?Q?/MKm6cj9g4jwjbLfaa4znK79my2x67h1QvsQQxIJcVZyo7LCsVMvNDoIYj83?=
 =?us-ascii?Q?AOba51jXeEarBta3ixcajWlijmLnCO/Q2TgZc0BQIzQ/t2wPy/FsMKTn2gmZ?=
 =?us-ascii?Q?4S+WXS60EEqLc0PNHx0+timf/oDLKSIuA1sfKo7cTUdPwEkslmKJxuxNjIpg?=
 =?us-ascii?Q?mS2rXlN/WVqPPKtw66vDaedavLAwZ0pUD69YWXKIhUE/ERnV96u2oEev8iAy?=
 =?us-ascii?Q?oD6B4pRKeallzR2I0QHiXYlOJuAeCQppZQiii/wyVsNnrr3t1L0g9Ub7x/ZJ?=
 =?us-ascii?Q?OxG0Pj1P/Rl+/snbPOxTNjHMooxhijmtEejs3QPFwvNhRNUVNaMMscfVJb98?=
 =?us-ascii?Q?56kzmIhbZ6iE3gGJvSOR4kRLwCqSdhgNX0MmtCRLpelfFecOqbEYh6Pl27H2?=
 =?us-ascii?Q?uTQyGsL/3PuSIC44ZkjGsecUIMsEdU/9sc95ydPhT1BlIkvVLdQpqAG029UR?=
 =?us-ascii?Q?oJ6f5mm7BGAacSkEcGwDhTDHTP8aZSQbBeeUg9DnDLDislFsUw7JIyP4i4th?=
 =?us-ascii?Q?mUTcnSreGFfEipJc4sG78ZK7dzf2CV6Mch/rSs6E6O8OUUyzrRAr/jB9eb6S?=
 =?us-ascii?Q?0e+uJRXhVgUo+kQzzeAnv0jamt/ZTaWXaGjYi2DYJl1XvLfZfVNjceBHdCR8?=
 =?us-ascii?Q?5qAVKNDQ74RNyUrXKnHYICWPGSYXGHBCm0q6TuAfm0zPxjZSlgShJ2N3BwW5?=
 =?us-ascii?Q?ZO9NslDikLzN4Vc96/KFaYuIDIMdyMOMJ7Jf/VimP6lTwWcrqg2eWVXd0FW9?=
 =?us-ascii?Q?mCyE1wV9DTA0nzLZbYGnpXjCv024nZbjAOxh8M9VwfmqQxpHRFe5v1h4WYrM?=
 =?us-ascii?Q?pfrbxH4hJLq1yZP8AJoZZmbp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a119c2b6-a10a-4203-1258-08d9411ca945
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 07:56:00.5950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RT9kF9gPH/kBvX1ATfzhX95Fjq/Sg76HREmsVL++Pvai3sTy0wMwx6dQ1z+0lHicLMhrd4i7xiZr/F0uQYLIZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 07.07.2021 04:32, Rroach wrote:
> After patching it, this works fine and UBSAN dose not have any error repo=
rt about it.

Which I'm surprised about, because in Andrew's suggestion (sorry,
need to reproduce it manually, because quoting your HTML mail is
rendering unreadable results, as you can see below if you view it
as plain text)

--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -98,7 +98,7 @@ static io_emul_stub_t *io_emul_stub_setup(struct priv_op_=
ctxt *ctxt, u8 opcode,
 #define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p +=3D sizeof(b); })
 #define APPEND_CALL(f)                                                  \
    ({                                                                 \
-        long disp =3D (long)(f) - (stub_va + p - ctxt->io_emul_stub + 5); =
\
+        long disp =3D (long)(f) - (long)(stub_va + p - ctxt->io_emul_stub =
+ 5); \

there is still a possible pointer overflow afaict, unlike in the
suggestion I had given:

        long disp =3D (long)(f) - (stub_va + (p - ctxt->io_emul_stub) + 5);=
 \

This because of expression evaluation order, which I understand would
match the fully parenthesized

        long disp =3D (long)(f) - (long)(((stub_va + p) - ctxt->io_emul_stu=
b) + 5); \

where both stub_va + p and the subsequent subtraction of ctxt->io_emul_stub
are liable to overflow. Whereas p - ctxt->io_emul_stub won't overflow, as
p starts out from ctxt->io_emul_stub and then gets incremented by a few byt=
es.

Would you mind giving the alternative suggestion a try as well?

Jan

> ------------------&nbsp;Original&nbsp;------------------
> From: &nbsp;"Andrew Cooper";<andrew.cooper3@citrix.com&gt;;
> Send time:&nbsp;Saturday, Jun 26, 2021 9:50 PM
> To:&nbsp;"Rroach"<2284696125@qq.com&gt;; "xen-devel"<xen-devel@lists.xenp=
roject.org&gt;;=20
>=20
> Subject: &nbsp;Re: A possible pointer_overflow in xen-4.13
>=20
>=20
>=20
>            On 26/06/2021 14:29, Rroach wrote:
>     =20
>                               Hi, I compile Xen-4.13 with CONFIG_UBSAN, a=
nd try test             it. However, during testing, xl dmesg got the outpu=
t as             shown below.
>           =20
>           =20
>            It seems that there is a potential pointer overflow           =
  within arch/x86/pv/emul-priv-op.c:131 where xen try to             execut=
e instruction ''' APPEND_CALL(save_guest_gprs)             '''=A3=ACwhere A=
PPEND_CALL try to add an offset on *p without             proper checking.
>           =20
>           =20
>            I compiled xen-4.13 by clang-9, with following             ins=
tructions: ''' export CONFIG_UBSAN=3Dy ''' &amp;&amp; '''             make =
clang=3Dy debug=3Dy ''' . Do you have any idea what going             on he=
re?
>         =20
>          =20
>      You say Xen 4.13, but APPEND_CALL() doesn't exist       there.&nbsp;=
 I added it in 4.14 when I rewrote this mess to be       compatible with CE=
T by not using a ROP gadget.&nbsp; Your backtrace       says 4.15 unstable =
which means its an old staging build (not that       that is going to have =
any effect on this specific issue).
>       =20
>        The fact that it continued executing correctly means the       cal=
culation did the right thing, whether or not UBSAN was happy.        The di=
splacement will end up negative as the stub we're writing is       numerica=
lly higher than {load,save}_guest_gprs(), which I guess       means that f =
- stub_va will underflow.
>       =20
>        I'm very confused as to why UBSAN reports against       save_guest=
_gprs() considering that load_guest_gprs() when through       the exact sam=
e logic a few instructions earlier.
>       =20
>        Either way, does this make the problem go away?
>       =20
>        diff --git a/xen/arch/x86/pv/emul-priv-op.c       b/xen/arch/x86/p=
v/emul-priv-op.c
>        index 11467a1e3a..be41bced76 100644
>        --- a/xen/arch/x86/pv/emul-priv-op.c
>        +++ b/xen/arch/x86/pv/emul-priv-op.c
>        @@ -98,7 +98,7 @@ static io_emul_stub_t *io_emul_stub_setup(struct=
       priv_op_ctxt *ctxt, u8 opcode,
>        &nbsp;#define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p +=3D   =
    sizeof(b); })
>        &nbsp;#define       APPEND_CALL(f)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; \
>        &nbsp;&nbsp;&nbsp;        ({&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        \
>        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; long disp =3D (long)(f) - (=
stub_va + p -       ctxt-&gt;io_emul_stub + 5); \
>        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; long disp =3D (long)(f) - (=
long)(stub_va + p -       ctxt-&gt;io_emul_stub + 5); \
>        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; BUG_ON((int32_t)disp !=
=3D       disp);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; \
>        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; *p++ =3D       0xe8;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; =
\
>        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; *(int32_t *)p =3D disp=
; p +=3D       4;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; \
>       =20
>        ~Andrew
>=20


