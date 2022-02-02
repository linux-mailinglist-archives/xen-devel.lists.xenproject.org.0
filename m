Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621CF4A6DB9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:23:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263895.456756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFBqv-0001b4-IH; Wed, 02 Feb 2022 09:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263895.456756; Wed, 02 Feb 2022 09:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFBqv-0001YK-Ef; Wed, 02 Feb 2022 09:23:01 +0000
Received: by outflank-mailman (input) for mailman id 263895;
 Wed, 02 Feb 2022 09:22:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFBqt-0001YE-Qa
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:22:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5db7590-8409-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 10:22:58 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-j6mh_N_rNZ--Yr20cVtsJQ-1; Wed, 02 Feb 2022 10:22:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 09:22:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 09:22:54 +0000
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
X-Inumbo-ID: b5db7590-8409-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643793778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C3FgSpAFmC/6n5eHJQiaNCxiCVxC6E41jAbdjHwgLgI=;
	b=m4IvCHput46kVqMlFnpcpCJoY8jrYktgVOmUbGsylbVZzONTaZZeaDoasms2Sok5GddGJD
	8tRhuPaZAsuNXbvWGyC4DcmMG/JSbtkJ1bg9HKjb7Wh7zGCf4zizclDW2tZ39zWdzxQiwA
	98qC+NyJ2qWi6e5EKnoh6RPHvmI8nC0=
X-MC-Unique: j6mh_N_rNZ--Yr20cVtsJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFZB1c57sm5CMdlcQNb3/vZa6GfqHrmyusLLgIFl8+tOhIwCTEz6ObRGSq9u44T1rCtSVcQHZYkUXZa1+yWk2z74gE2uC+Weye09JGnsibqp9Qes9Mkg825JgH2Srw194c645JWsf2JQMxPYsotdGEYbdkDKXJgczclWdL3CE8yVDfeVLixMNIs/XwuAWp+DKTuniUXpyeOkD4/32SaHCfKm6uWdxyJn1snMHvqpnITKDAb3KwJtpc0n+w1K1c+HXzEb46XcKkcz7oyMl8s56hy9YQju/7Y/SekAEpfJiuLIPQv8RxhcBiWCkprtnqfWxQzEE11t20uDrj6sBbEN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6d010bprS5cb8KzyWEqozQZY38xeveGQHFF/5nPemqw=;
 b=j9As4jHGh3ZLdeKslEBZlX8tE+KSxPf6Eb1Dx6FHdPQchNw2qAgXj2kYLXrTyGynwIl3joBMCuzSPDAk7PWCr9KmV3RdOFQwzyjSRCeneMCUw/inzEDu8GH9nPJou+8saVTBUze+j5DSRwqfErjpEtKhsnACbSj+MtK5braByjIkH6MvsIVJMyJ6MSd0/QLeyvb0NvAAm5ppJNlE5mHKU3ZpkhJtGXm9goPR8US4p9pk94/N/JqQMRQIxX+oVoSMC/krcVVY1n2DAjXqb0kiTkBmrBkxw8WQt77gMCkY/K94Gzo800ViSc+34IdLocBl0uTALdL/WsKoZrQND7iJuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc3df33c-d1e5-8c74-01e9-7ea7cea41521@suse.com>
Date: Wed, 2 Feb 2022 10:22:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-5-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220201162508.417008-5-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 696fc09a-6b34-4430-ef30-08d9e62d9770
X-MS-TrafficTypeDiagnostic: DU2PR04MB8902:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8902AA4D0C7CD39E1DCDBE12B3279@DU2PR04MB8902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	szrdVW3xingEjffFnkjZBaNeXG16bb53PhzW+Kud7PGMEEeiBoobCt5AvTg6TFGNBcYDpAVjeqD5KLXBUCdAmjvZsTpnor5rKXbk/AfvSkq22I1b0qgOjj7AC0H37gbo/q2oktSNJWY7zwHVLWgVF74Yb1Eps2XsTUU5TTbm6dKV3XjYKo7f1a8D4Usk/vmbXk3JDl8zageme2fMv8yqAWEZRql1fr3Z64xhzyUJjHTfjNu0IkjeYFA6ZqYznmlmMRuTKmS4L2omfTmOH46k01dIAF5gpS8YZF5NFDEK0yp5IE3Mw/FvPGVCFX46qUIG3lwg4euCEvyF6j16bw0o79grdGmQM3D65NQV7StEEnNvsY60AqyuLeqY/wy9Jzpca9NJLHhgw0pkWB191sQ+iExRXDPHu0WYeTRAYecLSiSodnijGOYg5FZp2DsFUhdyO5FmJSQ2moTui2l6L5cOOqiTFJI2Eury7AAuzJgYTzzjG/9asQi5N5RStPWSV1WQUs2cYrmAUzl6CeHA+eakRG+xB6BmboRcS5pC6HBqicC+l3lbGF/wzcPakjI47DLcOLLo6uswh6xvvRXKjEUSeukPFlkx80rgvg9YbcaJq3xcecKK7l2ugpW/5WmM9dr2iQSCxRHerWtfjnTKaU7rEgk/xnhgU2YaQUCCVE4GfRMSbJbQcqeQn1UrpAMZKHB5KIrhOkvS0FKy8q+q9IQynoJX9HAYWN9w1tGUycjZ6HG5PGPv6BGe5BWgQakqRXSkH8de7aIIAQDhbJij+b+KOUk58qILoMy4RwWAq5fvupHLSYBHoMF+tIMsYi/dp3bq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(110136005)(36756003)(2906002)(66946007)(6512007)(66476007)(38100700002)(66556008)(4326008)(86362001)(31696002)(8936002)(8676002)(508600001)(6486002)(316002)(966005)(26005)(186003)(5660300002)(7416002)(2616005)(6506007)(6666004)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IFJbny5yB2kuWly8dai58yyHXKclxsxJPTXo8eAyO7Oq5m4TU/jffhlwNr/V?=
 =?us-ascii?Q?+noihNiA2hKxa83yk8YaeQ4WvbFuUROPfv+Dkfqn0aOClAIjPklg4gohHSEy?=
 =?us-ascii?Q?rl+ZCxK3NOdpqhkfEiBHhkvH7xo8QPlsLoaUYXkhRtfMHKsGkh7pM++kPvpd?=
 =?us-ascii?Q?6rM9xm4ZwgusxKMdSt1VEDY0YJ3Z2RgYPJMQCnSssvEjq5Bt+SyuqUPtE/xK?=
 =?us-ascii?Q?DnpD4UwQhAFUoQkoxsZoMwUMvK0cwY39K2EUlIS4iesjr9CmzcDRhzHbfPi1?=
 =?us-ascii?Q?Tota2p8alnypUg056CDndw3Cc7+hhiHvVYQBnR0q1/kCwShMLu1EVSHQmSDj?=
 =?us-ascii?Q?NwYDNH9A6aK3pwM05Mk1B7J3+ldWqC0+PUPbaSkccfkW9lbtKvWrf7BrpjWv?=
 =?us-ascii?Q?okKMwzVZX1DPRDAgo01cnqUQTwnG69VVOym2JzsgJ1qVr+c0HYPbeg9BHJhI?=
 =?us-ascii?Q?wPKt/Ej2cMTolzIAlkMtrehMJxrjAda04DjuzfnQvwXGEPeXkpEpH5HwPUv9?=
 =?us-ascii?Q?hgLvk9BZ2EW0/Rbc0MJhpXEphCLGMrvEjBLzHV02VACax3c6GYT8VRM8R34E?=
 =?us-ascii?Q?+8d9kuwIe2x/rG7w8flQITXHBJqspc9Sqlpmjyn9vipzqrDiTzuAKwH4vR6Z?=
 =?us-ascii?Q?AqnqCLnXb7u49MzPebI+0ubbHM6ysscJ12+I8YMHVKaLMemj0HMZFE0WzkKw?=
 =?us-ascii?Q?/otyyI0UpbrS4nud4+WNBWhHufEI3wBa7aCYatVkkrwf826GbgYWz51JTEZf?=
 =?us-ascii?Q?VY4bgvFy2c89CLxUHzm20e1ZtdDXlB6OS09WHO6auQBNV1zPQSa68VLCK7gm?=
 =?us-ascii?Q?z6QjX8cO4Gjm7mDs8FuPZVSCInCzCQEkwZ3MDxRnVXL5VRRL1qT67meliKAs?=
 =?us-ascii?Q?jwzjDlh8d75NpJLr83KR4w96neadKf+lij9a6Qjqm9RxejzgkgFm3YQHJDcP?=
 =?us-ascii?Q?d7ahzOmbrBJrxlmA+KPqDOY9fzeNSEFRfAePly+8x7zrIARQZ86hezuYaJxg?=
 =?us-ascii?Q?xASovLMN5duOJLTkekEYljYTnR3oS0Yj+TBQeIoJe5hGZLEhZ5+6G7dmODtO?=
 =?us-ascii?Q?MAHrNrpBOYnmGmIqCY2x6r0y5Tyiws1pE6PsfGtO496q6Sw+eWM/kh02WGeX?=
 =?us-ascii?Q?P0K5kgOL2bBnARCwgmSUdtisnuDdpc6RYGWPe1ifCupb7V8M130S8RUkZEx1?=
 =?us-ascii?Q?uF4cf+8PwcKeySJk9ptL5hVIzTzE0BinmOoaDwilyotI803aS5T6RKFuN3gz?=
 =?us-ascii?Q?WsgpgzFmH+qNth3LRescpGOorG9FQ1T+hy9At3ZxLMLTkMZGbdUhojS7J1/G?=
 =?us-ascii?Q?kYdRzhrxdKOVEJ9gBfHT2TG4TGeaqrhuX3Fq5A+k8e6rMiXTamPg2jg2SFPh?=
 =?us-ascii?Q?DkJJjfFYbrFn7YSYJRqsv8y0XrjHMW/+xOP7EgbGvO9thK82nO5yIvSeLIs4?=
 =?us-ascii?Q?kSJPjqfVOwi1DmZfZ8RRbWZL3zr/j6w/vOmAcYdk+Pu1K0281eqGFAV+B1zo?=
 =?us-ascii?Q?XEQGNZRQICZq8MKsbzkEsIE3w9FV11QvveMr8JBbAQpU/rkfSuRK8h8FODrc?=
 =?us-ascii?Q?5NMhml+Zmk/CfDcwwFf8vQHifLhmu8xhOGdx80otilqgrfVWmYNJK+S2k7py?=
 =?us-ascii?Q?dmL4gPK8T86lSpcMPm9Pyag=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696fc09a-6b34-4430-ef30-08d9e62d9770
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 09:22:54.0500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lcaie914OXpKKHOOtMtPISJtEXuyUjFd26h3pinsLGsM2KGl5CSqWn7NJkuXJ4T4ckIdJCc7m5tn8f/BP3R0nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902

On 01.02.2022 17:25, Oleksandr Andrushchenko wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
>=20
> This way the lock can be used to check whether vpci is present, and
> removal can be performed while holding the lock, in order to make
> sure there are no accesses to the contents of the vpci struct.
> Previously removal could race with vpci_read for example, since the
> lock was dropped prior to freeing pdev->vpci.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
> New in v5 of this series: this is an updated version of the patch publish=
ed at
> https://lore.kernel.org/xen-devel/20180717094830.54806-2-roger.pau@citrix=
.com/
>=20
> Changes since v5:

This is a little odd in a series implicitly tagged as v1.

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -142,12 +142,13 @@ bool vpci_process_pending(struct vcpu *v)
>          if ( rc =3D=3D -ERESTART )
>              return true;
> =20
> -        spin_lock(&v->vpci.pdev->vpci->lock);
> -        /* Disable memory decoding unconditionally on failure. */
> -        modify_decoding(v->vpci.pdev,
> -                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci=
.cmd,
> -                        !rc && v->vpci.rom_only);
> -        spin_unlock(&v->vpci.pdev->vpci->lock);
> +        spin_lock(&v->vpci.pdev->vpci_lock);
> +        if ( v->vpci.pdev->vpci )
> +            /* Disable memory decoding unconditionally on failure. */
> +            modify_decoding(v->vpci.pdev,
> +                            rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->=
vpci.cmd,
> +                            !rc && v->vpci.rom_only);
> +        spin_unlock(&v->vpci.pdev->vpci_lock);

While I certainly see the point, the addition of this if() (and a
few more elsewhere) isn't covered by title or description.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -35,12 +35,10 @@ extern vpci_register_init_t *const __start_vpci_array=
[];
>  extern vpci_register_init_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
> =20
> -void vpci_remove_device(struct pci_dev *pdev)
> +static void vpci_remove_device_locked(struct pci_dev *pdev)
>  {
> -    if ( !has_vpci(pdev->domain) )
> -        return;
> +    ASSERT(spin_is_locked(&pdev->vpci_lock));

While, unlike here, ...

> @@ -152,8 +164,6 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t =
*read_handler,
>      r->offset =3D offset;
>      r->private =3D data;
> =20
> -    spin_lock(&vpci->lock);

... you did explain why you don't want to add a similar assertion
here, I think in return the function wants to have a comment added
that it's required to be called with the respective lock held. I
notice you did so for the declaration, but I think such a comment
would better be present at the definition as well. Same for
vpci_remove_register() then, obviously.

> @@ -311,7 +316,7 @@ static uint32_t merge_result(uint32_t data, uint32_t =
new, unsigned int size,
>  uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  {
>      const struct domain *d =3D current->domain;
> -    const struct pci_dev *pdev;
> +    struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset =3D 0;
>      uint32_t data =3D ~(uint32_t)0;
> @@ -327,7 +332,12 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg=
, unsigned int size)
>      if ( !pdev )
>          return vpci_read_hw(sbdf, reg, size);
> =20
> -    spin_lock(&pdev->vpci->lock);
> +    spin_lock(&pdev->vpci_lock);
> +    if ( !pdev->vpci )
> +    {
> +        spin_unlock(&pdev->vpci_lock);
> +        return vpci_read_hw(sbdf, reg, size);
> +    }

In this case as well as in its write counterpart it becomes even more
important to justify (in the description) the new behavior. It is not
obvious at all that the absence of a struct vpci should be taken as
an indication that the underlying device needs accessing instead.
This also cannot be inferred from the "!pdev" case visible in context.
In that case we have no record of a device at this SBDF, and hence the
fallback pretty clearly is a "just in case" one. Yet if we know of a
device, the absence of a struct vpci may mean various possible things.

Jan


