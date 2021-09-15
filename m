Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF040C208
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 10:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187342.336162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQdH-00049Z-F7; Wed, 15 Sep 2021 08:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187342.336162; Wed, 15 Sep 2021 08:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQdH-00047U-Ba; Wed, 15 Sep 2021 08:51:07 +0000
Received: by outflank-mailman (input) for mailman id 187342;
 Wed, 15 Sep 2021 08:51:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQQdF-00047O-Q1
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 08:51:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3117ad0e-2e44-44e1-9db5-d36df0179b26;
 Wed, 15 Sep 2021 08:51:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-hcS_bbY4MMiu4JECqCsohA-1; Wed, 15 Sep 2021 10:51:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 08:51:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 08:51:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0237.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 08:50:59 +0000
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
X-Inumbo-ID: 3117ad0e-2e44-44e1-9db5-d36df0179b26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631695863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1r1mvd/U+UK2xcDF8uzoLqEn2rfVHv9tFZu8OzyBY0=;
	b=e6vJoZZNxnUUbQ7okPl3FMeyW/TyhFp9MgwiAZ1w6d3OXW9KNACiXa4H7a7c4ehz5WHv2U
	tGbJQp48qyi61PlZiLV/a9qpdC7V3j0fQthC1dnqJKD7mudVqBsP3P4Myxu5vnliEquCo+
	VSecyJsO3DoUSS2SgFujhiTl598nYDs=
X-MC-Unique: hcS_bbY4MMiu4JECqCsohA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrqptWP5yG/BOIDI+QeSl14nPF7WDggOrQydE+jsmvGyQG36HThP96fsKlIw6tQQu13sptv9eSYVCuvx1fYAbJO86ckTvKBAyl1QXvI5URNvjcgsrA8EPMS0NTPzZQWM7dVvUyGBZshNh0MeTj7xcEUL/BVdASkOV90cJd7RwBVzNWJdB0UQ2Qnifxh0u5bHfp0A/A55utQV0a5Ff6QA/RLXKkmKXkmRUdLVxqbQuptDKnA+KuO7/Ay1xj5SmTQU+e+OlqUjHRUeHRwDVIeTr0hvnuS96rid6WNXBRLeTbtPJDhiRx7Scu7hkiPQ71C7FPLCPL1DPIvGs32dMaguIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3XNe/JhcU0nN+6cWPJW+M2KdPbtv7prVQ7AwVqLTYJk=;
 b=cCYN4CVcFnbmwkfldTnsWMe1ZSWwQFJuMYfrl5bGPOzG0wo6sj+bDLC7TSO5Oi89Yc3Y7+9p3eIhSM/V+5+EmDqOVsChaI74h6aXiHwDIO4Gm4Y/JkFIYP0WfR8jQWrnUqKFBxp2OHo52BWNDvcyBSLqSnlJg/Ki1FPQBU+smW5DYqQ9aY/hN9H8+HZXndUd49YphNvQ72eSmFZxSZMZaTWcE5+WYYkrW+jfImrROsA9wWt1SKuI1ig4MQjrfhL7oRyl26lNhZG7A2MWilOE8n8hZKpSl1OHj0LRnV36yWt2MBo3JjNfI6nmdzoDqEQEmoXv9lcP/BwlCbWIPYhYbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86: quote section names when defining them in linker
 script
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210915082123.21795-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a71f281-2bcf-910c-91ed-881de3f78439@suse.com>
Date: Wed, 15 Sep 2021 10:50:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210915082123.21795-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0237.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a376f78d-f146-4176-5f4e-08d97825f106
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233569596860FEB473558BA2B3DB9@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P1x3cPybpQFnqvnfL94MjIanQskP/hVkG5CzPmWLW7T1JnMBl1C4nUVMPhyaXntBywVnPjp1gHbyMX/DjOf8DiT3q9meJ+EMx9xZ8/tjDjiTG9tZT6lK7iLKvo1vphzhdfClmK1uPJtZgweM70QbqoeHLdTh2NSTKCGnB2dV9NFFngQ1TegsCN2qE83PLWzgjZshmUlwJd8QFHx0cPXKhm11c9cbsgE9AftmYKqIdB5KgwQLvm65Q1AG6vbFjaGrlYn96feSXKs+FH8ief4b6FZcA9tkcVgHp+e3uCbVqWoRgBmP0lUJKgtsfZ6dKWoTGmovMxColEoPieBR8qkaaUNDKdmCwyfl6To6I8ge02CEcnK4em+1nhcZ3RN3QkIIHGxx1WdqisPEsjyGSY2Itv715/r7f6wpXXoPHFAO+ygSBbnQVcSRIt7W9KjUUUOlQPcpRVZJy4IwZ04hABbkDE96qflei8uah1DFktvSj9E3xbzHTEgRa6BfDaBDIfw/IJ8ckITBYhu0o5BxxyQMCk/yJ9P3p3Cc5LCfvz0La34Kch9t20/Sj7r0IaCX3KYbl9Ti/88nRIxGuT/xbEwxt/IVFaXTFxM5ghG6QgJr1ErgnnUvu0bZVkdO5huA9UvNS1+0fp80B6kQ3vXnXLRrtfDjCmH7a6VSIGjM+auganvk6MUnAFJbEbB8FAJt9DAUcRHzYSGHUwz/7O540GdcTzWKFBEP+OMZ8JcflSERmCrwDMRBS2ZU3HXL1qvtv7P7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(136003)(396003)(376002)(366004)(83380400001)(5660300002)(86362001)(478600001)(186003)(4326008)(956004)(66556008)(66476007)(54906003)(8676002)(66946007)(2616005)(16576012)(316002)(26005)(36756003)(6486002)(6916009)(31686004)(38100700002)(53546011)(31696002)(2906002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dsTFLP13viThDnU92IQHNaWnbaCKK/PI04wOFjKQu0tYR+naQp/Mt9Blj9Nk?=
 =?us-ascii?Q?c+PorNgNI5YXsdKu8CRuhM35gmXn0+gpMQj7Q3qevDKM/QiIk0uPSJSG9/ik?=
 =?us-ascii?Q?cuuTOlcFO50dp6I2xO5OJ0dz1i2s/RHAxAIOuFL4+/zjQpou6AOjPVNp5xWK?=
 =?us-ascii?Q?dpeRFDwDE2ZVwmiKpCdvlebLDUptQEjcAeAopXWkfmhp0IjxPNgpREk2yngY?=
 =?us-ascii?Q?ugJfw463b0W1OKzLI5NTvlQlbWS7bb+BTg59nC8otbD1pK2xAaRV1I0VcFv2?=
 =?us-ascii?Q?t+g80FeUXNt+eT9WzJRVcdM92UIEZr5V7PAzthZItOKgnHpoD/DdrUqIoOFw?=
 =?us-ascii?Q?i/qEnPgb7JVfzyECnQJ4U52ItVSxSeY4nKlIaNyyg1WnxkXWfoAhGULmTbwL?=
 =?us-ascii?Q?7W68wiViUwz4B5FVC76PeZ7a1wiPox2IQ5RqiK515pW6tMyqSEKfFmfKwiMy?=
 =?us-ascii?Q?5EYFbLcY4xXJZi0ffMnWJ+tvHdB+RihZ0LTg6yaZ/i/laiZc8pMRA/J4ZJvj?=
 =?us-ascii?Q?GfiDwhme2rg7AMO0L5zBHxurekI9vfDwzIRmnHvwU4CxbiI3CJUMI7yR5zyO?=
 =?us-ascii?Q?nTM1zOCkrFbtFlXB09CdZG2XG8X4f1kgArJW4uEXjLh0755W+DevSkpvq51s?=
 =?us-ascii?Q?EuxtwQVfZtLpNTOg5riuZDDbtqMB9cpScKKuAs711M5MEngpK7FomfuBg38w?=
 =?us-ascii?Q?blhImOZgOLDDJH0qXJb3g7l7lAsaFZ9r/mp8BCkRYsU9NWAuhkK05pv7R92E?=
 =?us-ascii?Q?+Gm3ksI6ylP5F9JTY3S4qLQOV8F4LqW5FAihZluvn5RNg81saSMD/6nHFYXR?=
 =?us-ascii?Q?VhPimHDO5Fmdhv0yjTtOIagSoOHVRM+S7GZIV7ClstfGvjjFgvI0aIFThgmC?=
 =?us-ascii?Q?d6LFSMnOq49q/6G6+KVBw7K0A1oTlN2DafEOi9rS97K3cjvFxEKe9nXy+v7j?=
 =?us-ascii?Q?T7FW9FuHp93ZblQRolNk3po2QtpMyOh4kIAWC+M1EWHT529IUFu4gDWWj6gt?=
 =?us-ascii?Q?AW5biViEKiWjWFnh1SD5TT816IJsOdSposnAaP34KurRkVLvGQGl1DZ56NPq?=
 =?us-ascii?Q?XmW6d+ttUVcWhJq3AsSf+y19X01suRrYwv41mHyUTuHyJNY/aSSgNc+bxP/D?=
 =?us-ascii?Q?3e+Y7uAgqua8gGn4OwV9ChawpfX8fTn9+AhDL+uv5/R6Drp9WPXDl/DnIMS4?=
 =?us-ascii?Q?fCr2oVDjJJYHp+h5x+hZnY+BWWH9wV7DVJuWlKRbYwemcynQKbxCM2d9u2SU?=
 =?us-ascii?Q?Uq1HOK/legC5r1zek0nSrj/zb/ESlZ3uesNpD9QFONChBAWwV+jTt+Lx1Mf2?=
 =?us-ascii?Q?0pCN6IFgyuUNEoTpOIRCGhlJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a376f78d-f146-4176-5f4e-08d97825f106
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:51:00.3305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eG4Wo4lofcuXaKz2bae+0tjFzjkdEmxYAhzQpgiC3MdnfBBuHOWG2MWqixCoEmGb6YYVR0sJSu/6X60Z9APmaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 15.09.2021 10:21, Roger Pau Monne wrote:
> LLVM ld seems to require section names to be quoted at both definition
> and when referencing them for a match to happen, or else we get the
> following errors:
>=20
> ld: error: xen.lds:45: undefined section ".text"
> ld: error: xen.lds:69: undefined section ".rodata"
> ld: error: xen.lds:104: undefined section ".note.gnu.build-id"
> [...]
>=20
> The original fix for GNU ld 2.37 only quoted the section name when
> referencing it in the ADDR function. Fix by also quoting the section
> names when declaring them.
>=20
> Fixes: 58ad654ebce7 ("x86: work around build issue with GNU ld 2.37")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I'm slightly worried that LLVM ld requires quotes to be present always
> in order to match, but I can confirm such quotes are not present in
> the sections names in the output binary.

They're "drop in replacement" statement clearly is too ambitious.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -18,7 +18,7 @@ ENTRY(efi_start)
>  #else /* !EFI */
> =20
>  #define FORMAT "elf64-x86-64"
> -#define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
> +#define DECL_SECTION(x) #x : AT(ADDR(#x) - __XEN_VIRT_START)

Indeed much neater an adjustment. Thanks!

Jan


