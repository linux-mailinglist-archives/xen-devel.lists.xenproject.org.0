Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5834CBB9B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:41:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283063.481949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPito-0008J2-6j; Thu, 03 Mar 2022 10:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283063.481949; Thu, 03 Mar 2022 10:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPito-0008Gk-2u; Thu, 03 Mar 2022 10:41:32 +0000
Received: by outflank-mailman (input) for mailman id 283063;
 Thu, 03 Mar 2022 10:41:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPitn-0008Ge-1U
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:41:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c2cd8bc-9ade-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:41:30 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-JOI5RF6VPx6BHdy0hAaIGw-1; Thu, 03 Mar 2022 11:41:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2783.eurprd04.prod.outlook.com (2603:10a6:800:ae::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 3 Mar
 2022 10:41:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:41:26 +0000
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
X-Inumbo-ID: 7c2cd8bc-9ade-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646304089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYJVT3wzSyrUbROzTeEqtNq0FW5NMcpmiJ1XOZB20bM=;
	b=f0Q7f57gEOtVn5C7HYZDiS0Vj0cbznINVUP3GHdY4zi4GTx9/XaTsGSpftvNOmx5CakrKb
	qnBd+CUBWYO2br3zlFQEU9GvXlvEyxp9eCA0gVJJa4wj9oIxLPoDlIcJloKq1/tLrnHj/o
	ZP17gWC0ATlmuYRrlekY5HKzY6lc1KU=
X-MC-Unique: JOI5RF6VPx6BHdy0hAaIGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMlIdcru6duqfH/UbH3LdgEa4tYbLz4Y0dlAfUEIi9fY32YM4V6vng2WIL+1UwrOfS7IAll9ISJ6fN6jV55+/f3nF/zXwZaliOJycZ87qJdsVXRh3VR3zpeZ6FSSRZphjCvwaILrylrDRxjkerH7NW712KlkIxSFRwg+g5XH+2qOIe1ETfNv34NnqizjvkZIX0pBMvHUiO4jCTL2BPkeCCaP7rJ+70yvsDr7d6WWNKcwPap0WJ8riOjG3AflWAUH7uoeIvJO/a2WgvA/tHUGwa/tWVdOwN9j2zAn+GWPC+tJ8gkBfusevbXXj6j8v2An8JJ3XBznBA+oTX1jroqxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocrnWVGVJseQsq/tw8U64QEYWft8t5ClbHcEqgkCQsM=;
 b=g0ZaryL1wJjgoz3ozcI7TLjsUAMYAAYtmgRweK3H9Q0tixSav+J3UeJlJGbXOiYnjefVtVhsNBV0xT+7U4OCPLhbtkNI29LSxN8oItiPbsg0Af8KBxynXT46EarK4G/3EKcQglh6SavYqmj8EuyVOrYtLu6+jxbe33a3qGaOIP7xI8lm9BfnX9/0I9pcBVpGiP18czz28IdIsxhUgrOWdOtdpVqDUbqwJSkW7FNZ/B6EGUJwNObQukYA809Jo3a/6GDBTYx7qwGaWPDvQ/Oru7/mONXzUzaCWmyxEM03GBjVwFZ4tg+dIkv2qiyqVIhw5/8H395p//4dDAJoFh24Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3caca736-fb83-93be-3217-d858dc9f9b56@suse.com>
Date: Thu, 3 Mar 2022 11:41:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/CET: Fix __initconst_cf_clobber
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220302221005.16636-1-andrew.cooper3@citrix.com>
 <8eb7d30e-32de-fdee-43c9-3500fb10e6ee@suse.com>
 <36e72452-1ae2-93b3-c5ba-88707dfe47a5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <36e72452-1ae2-93b3-c5ba-88707dfe47a5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0032.eurprd06.prod.outlook.com
 (2603:10a6:203:68::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e6ba05c-05a9-4821-15e1-08d9fd025e73
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2783:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27834F78C820E39C8C2ACF62B3049@VI1PR0402MB2783.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yh58LeOyVzt65559+wEyrQIsZfqWd9uKs7L/anSzQnKtzbYCDeS3GsB5QER+Z/G2PRe3uBj0MtMsCyYOHwW5yLyhRy68f726k/556/oP58ohEWeprgantXkAAwT5jUar7kF2xNTc/h8pSafXZ+I3CorIEt5MIlvW6k1qHhMvmypz2g3kqG09XOttkocxrnohG0Zx5cbS6bkMbNHzYeoHVaEH/SoTfEqBc8o7Y/VfKlIIgUKZJo3Bq3vvMCaJNyCy2/+7V1N0jXNijSR2rfteVPpj44KncT9h0ud8rXzomft3yb7y+i4sqTzUjk135efXmtpLCe1NEvgznm1wz9NPWuqnI+52RyoRZqiNDKlv3Xh4xuOrcdoj8fD7i73MmOWbLWCPeyTdrVPhyZY3qa+iR7D5jmQK71yK7eFma/635ZN3ZTEYjOE9CnP22sN6i6/oOwyRnjE+bJUanbUJ5yAgDqoAXdaqwPauC9bvAk2BVNu8VRLT2Pkw4h3BEgozeMruXfNPcavXHp56OrhfyBoIEBjX06pxpbrby5qdQj3UiD9HD9Vx1eSI0xrXVkJoFOTx5AM/gzgAdeqpMlSfqHBq1IyUcwwW7le+SxjpGcmMaqz0u6xh5r4VTXcWuJMi4haevJ3Z+HMiSSOHrIAQmFseutsO8xvCw3RBn0KwEQMhC4YPyqexddUK/YEKN+7nqyX0CzBs/3ADr5Y7eoYdiJ5N1WfW/2ZHSEcL6wNZKzcJFdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(5660300002)(2906002)(36756003)(2616005)(54906003)(26005)(53546011)(186003)(6506007)(6512007)(8936002)(45080400002)(66556008)(66476007)(316002)(38100700002)(31696002)(86362001)(508600001)(6486002)(66946007)(8676002)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qp7eBwRFAqVtYlZhS8teAsj7ru0RBGCoFYn2KnF0fzCQy3gAiE9491qWjsx2?=
 =?us-ascii?Q?rsrS1SyWhqACpPcIX5q9RkIOyt/k7E/p2MyoGgFoHAhtWoOcGRzxr4sXyMC0?=
 =?us-ascii?Q?DRLJGulX/qXvehdikmpDgs6NyAAQwraun6XBDqnFONF6wUhwzU8xtMfc3SMb?=
 =?us-ascii?Q?r115lgeJlhQTuPUhvj1nBoVhBlR/EiH9TyzoepJWzYyWq+eBvj+zeNTWzWro?=
 =?us-ascii?Q?ICSUyNR2p0XUVVdyp9Pgi0bzixkQtYsC/bVLpU6SEx8wScPAmgVaT03tKpSj?=
 =?us-ascii?Q?QOrWWqw44P+zHvYLj/pwX4EqruqJ2R6u0T8uqqPWl0/LybkouH9v5AgJuY5h?=
 =?us-ascii?Q?kiOeNzWst2O4VO/ncNNc+26AtpQiq3YvTBURyDxS4pjToH+9vNxN7tGm1S+9?=
 =?us-ascii?Q?HO6rM2HSSLNT3jUt8ugG3+5m/axygfDGtJpZXRZvGUOgeF4ZOh9Q/aMkvcMk?=
 =?us-ascii?Q?dyDUZzouaomer94WqB/11DKrLUxLcrfhVTc34o2Ns/FhcoXTrFqTVL703+ZW?=
 =?us-ascii?Q?3pfBkIpsoY5vVsKcAPvRkltJ1HDBJDBwZGhXf8YXFcaqF4lcOnQwvbgfnsqS?=
 =?us-ascii?Q?znKAKekM9761NSMuTka5FiV8tHLscUGXORj141/ue0mKaYHE7FMhYKlaFgUw?=
 =?us-ascii?Q?cMgNxbLZabWSISdoShJeZIAosEZ0ZQRJ0mZsVGahpKet4OffCpjdd262lcs7?=
 =?us-ascii?Q?rfNq1sqhff+0+kWY16TAU6tyPM9PlouJN7pXRgRbzg8s3xg/iVopHxgswKnR?=
 =?us-ascii?Q?y8+B4lRg0Miy1Abyf5Sjt0xA9rzaiL0k3wZDX3DLrWAuU0L84g0z7FqJA6Mz?=
 =?us-ascii?Q?fF88gUB7BSXxHKDxx2BZ2ZwSd4NQbfn71Zh0J1fHyS6YYVbZWEE3V/abruE/?=
 =?us-ascii?Q?ISA3qd7jtsNZEEnuhEZjhhttMJkboF/nhmYLR38mP1AiWgpWsx/Ymjv2qWPX?=
 =?us-ascii?Q?hfkym0MBVYVGVRy3yHB5f/q7TFchMSHA7gdCryFIrMc/N6z4GuPRvBuhoHor?=
 =?us-ascii?Q?QJ11nn6/lP2tk3uPF1MwZq79rG3cX3vfu/xQ6B4keZaCXF0GHA921DN36VOB?=
 =?us-ascii?Q?lnkpl2XTwDpHzs17YABy1oH0rc/x8DuRQzKcTZiP/umYM0n3WgWTEl3yYFZT?=
 =?us-ascii?Q?fzajtEHrMbNPQlFBguXbP6yTThXSN9lZli7CNpKMBgO4EEBP0mFdi/amePlK?=
 =?us-ascii?Q?QXpbO2dLUAx8vGrOEsF17npK5911XIjyqKmo8DBsg3/dVcpFcgScFJHnqncs?=
 =?us-ascii?Q?+57bAMYsD5gN37rEZYPbk/Ep6ESj/G3Dw51CscUB1BkN9hv8o/pOW20i/UWT?=
 =?us-ascii?Q?NNLDKLIGrqYEN3gq5pL1baj/LW44quduLUNFBbFAc61iLosNFRJba77qJygh?=
 =?us-ascii?Q?DAdvR2kig/Nd6LPLtaMJJENzB18WS8+TgzmsQKEIvlDCyx5WhqbLR9D5QK1/?=
 =?us-ascii?Q?Uo9wr/w5AY4gBXoselcIZeVpUkiCC9C2MKTQN1phqQNlaEB1cy0ynOs+cy1e?=
 =?us-ascii?Q?FpHjdBQXvVl59U0/hX6IbJiiNzJQqZdwv82eO++G+M6YDMeDD+81mZBdDy+5?=
 =?us-ascii?Q?xsz1RtcD0LB9s8JeDrlOOC35CFeNg2exQJJrryDrgJwCtB5SwektqVj/JKYt?=
 =?us-ascii?Q?BobUZH6g4SmDfFK49t2kby4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6ba05c-05a9-4821-15e1-08d9fd025e73
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:41:26.8654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atpOh+lhfjBvLWZ4rms8nZxO1IbbRkNfFDlKeZYmsU+eNBFrWOh4NfvqVTsBzmM9/JfnVNbbE77SozNrNEKdMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2783

On 03.03.2022 11:29, Andrew Cooper wrote:
> On 03/03/2022 07:35, Jan Beulich wrote:
>> On 02.03.2022 23:10, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -210,6 +210,12 @@ SECTIONS
>>>    DECL_SECTION(.init.data) {
>>>  #endif
>>> =20
>>> +       . =3D ALIGN(POINTER_ALIGN);
>>> +       __initdata_cf_clobber_start =3D .;
>>> +       *(.init.data.cf_clobber)
>>> +       *(.init.rodata.cf_clobber)
>>> +       __initdata_cf_clobber_end =3D .;
>>> +
>>>         *(.init.rodata)
>>>         *(.init.rodata.*)
>> I wonder if this shouldn't really be two sections. Live-patching will
>> need to supply two ranges to apply_alternatives() anyway (one for each
>> section, unless you want to start requiring to pass a linker script to
>> "$(LD) -r" when generating live patches, just to fold the two sections),
>> so in the core hypervisor we may want to follow suit.
>=20
> I don't see why livepatches would need two sections - they're linked in
> a similar way to Xen IIRC.=C2=A0 Either way, if changes are needed, they
> should be part of the livepatch work.

Live patch objects being relocatable ones, their loading logic works with
section boundaries. Hence there'll be two sections of interest, the
boundaries of which are independent and hence need passing as separate
values.

Jan


