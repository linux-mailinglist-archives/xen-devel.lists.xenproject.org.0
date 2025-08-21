Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954BBB2FF7D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088986.1446684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7iT-0004IB-KU; Thu, 21 Aug 2025 16:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088986.1446684; Thu, 21 Aug 2025 16:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7iT-0004F9-Gj; Thu, 21 Aug 2025 16:00:41 +0000
Received: by outflank-mailman (input) for mailman id 1088986;
 Thu, 21 Aug 2025 16:00:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kfR=3B=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1up7iS-0004Ew-2r
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:00:40 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faa70681-7ea7-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 18:00:38 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAVPR03MB9164.eurprd03.prod.outlook.com
 (2603:10a6:102:325::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 16:00:35 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 16:00:34 +0000
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
X-Inumbo-ID: faa70681-7ea7-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFup0kiVnFUPYRgyQo3J9GZ/bZ0kUJW9LY9l8ipTxPD6+ENCXC6MuwDIsmgp/fYtOfx2QDhgOEU9LZy7R/FHnCsF3RhDHV3eQMY7uS2KsAJZD8SORoiJg7dqX5fND9PnnWD1gv4GeCI8a29ISS50Yw9M5C8VpqgHy+j8CQM8f8JFf+Y6ZYaDToHDWyx4NHYO8Qszp0FE0bgbwJhT5ku4bXN6sFSJxWxRPlCvvJhZlOexEqGzSH4CXxZb5ndEsgP5+5bX3s/lCCtIyyKK+P9X0DnpdOSv37+JG3Z7TxElcEdBa7bejqEdiU0cWCdlnf/v2wqw/hQEhY6+rUJa/3U75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zz5iD+Y8p8a3dJpjNpWzIG+R5GejxyFRritCyx3tl04=;
 b=rt5Uoa0jTROzbPGK8bVMYuuclVPljUOOtjKieMjyBTRmJepa0NRlJZBgc2XnTO8lLR9GHCDCKtDjODw/2DkOf7qJ+G8R0O0RU4PJEn0MTSlyESA58eX9sNNk+Udyvik4IxRmIl5JyzBEya/ox6hw4FbL49F0rT1UvSzt+kdiQ6e5zXpM8DbaidKSrD8EL3Cf+hWVx4c7e9gTBN4MUJcT36Z1SpoDq9DwXdnE3oAUwq+iGnk6xFe/adJUGryjH8NR+mZW8gLeUqsktgyklaFKX9vLffyF3Tnwemf9MirYtY2MQsqB+wEnhykN42YkvobSgfV/dt29n1I/nycVJQkBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zz5iD+Y8p8a3dJpjNpWzIG+R5GejxyFRritCyx3tl04=;
 b=oBooyYfqVBZG6YLhj7aFVc1xl22QYY3BDqgnyD9xc5grC1ozE24nK/uRqjg2QRWv41IGXSfPq9YJmRxfcW4GLhk7H4e2eshThcfhPdxWfRUZaIKmS8ajSLZobaLpH8dvR1dHA1DdYeoqoSm/C5Iz6M1ocIHDqTtGWY29QoD1INk3fDOf/t6YCS5OzA+gEMDXQeZqnr2fj1R0ryyA+MndPGTr8F67GWG5YAsqqCw0+tnOKEM430uGKr0SPLtgaLH3PmKjNPUH0St1Y87tu8GxcM5vCrNyrbiPTJiA33At2i5vj3gyw7tNQY7RLN5udfCpRT3o99/ZhclixnbekgmPRQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 01/10] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
Thread-Topic: [PATCH v2 01/10] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcB5d7cCAQRdJCgUKSzBGsZt4ytQ==
Date: Thu, 21 Aug 2025 16:00:34 +0000
Message-ID: <87h5y0ekbi.fsf@epam.com>
References: <cover.1754514206.git.leonid_komarianskyi@epam.com>
	<7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Thu, 7 Aug 2025 12:33:30 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAVPR03MB9164:EE_
x-ms-office365-filtering-correlation-id: d15c5df9-cd96-4733-254c-08dde0cbdd17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EXHCcb4WLDYbQajtal1d+mCSe/8wMxW5AI33J0Kd9MYBfj5gWgiG29EU5F?=
 =?iso-8859-1?Q?fKGnU9SA4ZzF3QWYNcENRdUVdiA7h5YuwAQury/4tKuXb4/NjcrNGXFfDj?=
 =?iso-8859-1?Q?6S/QpfYxTlwiwM5OEwP89uXEteH9DTxMMdJzOuB9CHDIXzxBY07eSBPK3J?=
 =?iso-8859-1?Q?bZy1Y2io4D+Kg9IvVdAl9Nn7SurIMUq89E8Wn4utxO/uiQoE4pJSG4Baoe?=
 =?iso-8859-1?Q?YbVLZPXfZrkRoBe02CEM5ZaBDgnwdSv1T9Cc9QZa0LvCUik3k04n3o9Czo?=
 =?iso-8859-1?Q?u5LvXicG2BdUIlQNQFmlmPDPawhYL8pe6ul7nRa8GO+H1Qi9CQfvbXvRbz?=
 =?iso-8859-1?Q?4/EctF++bxYpg/dnwtAsLmAuPBRk2t+xrGvmuiWWrEy7JlgOAfUkTTv+ol?=
 =?iso-8859-1?Q?7CF63Vr8+y2Uqf6ShxArTuHftZ8Qg60DrY4udnl424Af28l/rrxQiafZRM?=
 =?iso-8859-1?Q?RunZQw6Ug5+SYn0QFjtnOjEQxKb55Cd8tSnCrPyJxa5FVbXIhmpYs65wqA?=
 =?iso-8859-1?Q?9+ByW+2ohVY0C/3+G9hZZNBKmRiBjCbLTUICUoEXud9lYGaCKM/k0eaix5?=
 =?iso-8859-1?Q?RNLaFQJkdhArt6Q/U35KxXVAcsSyJa2ZGnRrLMD9MzjKVoDNpXRkHB2kkH?=
 =?iso-8859-1?Q?KYVElQHleEh3wW0Ly/DJf56ZgJQEPpe9I/FPIEdFTZPCzCydN1LqVlYaWt?=
 =?iso-8859-1?Q?px2c7btePvQx07OzT0+Ccgv+wzNrvWfykB7G7TstIXM7i1HYuvht6sBNhL?=
 =?iso-8859-1?Q?GzPrxq38oc44/LE0aNhFJg18C7B0MQ46ovsD+2AGN3yIfyZEoZ8GAPYOAW?=
 =?iso-8859-1?Q?ups7L4A7sSeT5xciF1gnKa2ykNO6nNvcW3lzF9Ek5pNBmvpfjjGFRhQzwe?=
 =?iso-8859-1?Q?xBJtR6Ntq9UgtXCaVsF9rjiCjJcsvXrnh0iVN1tPvPovBxVAzCMMtlytLj?=
 =?iso-8859-1?Q?J3rik5YTVlANw6gT8TRdNSIXUuGGhIEmyl4rPjSbzmNmv290S10IPEfRvZ?=
 =?iso-8859-1?Q?sOY/BuzeqGHOfG8SSkUIWi3mwFyWg2f+sZObnvGhbBg8VKOO+738teYtqn?=
 =?iso-8859-1?Q?ZfoVTEExulR69T48M/kYLGYd+J7CWtMd1GtnYuSHBqnRifUYW4aq7m7wAd?=
 =?iso-8859-1?Q?jGnGH8lVBkYgVBF1qZ7Zyj/F7/Z7BdrlUv4ihyaMizm8lcP4QSS4bVzHB8?=
 =?iso-8859-1?Q?qEOOli+OPcayeRpjvsAB3tIXu0PYVmWZbUPEfkYvsRo99o0IBDRC/nWdX6?=
 =?iso-8859-1?Q?VQaTtBlontsgVFK4suzaROx1jJ4XMAvoLJ6OFbtZLSZXN/nzmISroXltg0?=
 =?iso-8859-1?Q?V/LvMVlToShS73JU0NQSHkgUaWOYI+mYum5aXzmlWTX5fPTRaLCMbfO+vy?=
 =?iso-8859-1?Q?wTVfEqlermTSrc/b37ipewvRVfRY2I25eI5Sma0acPlI+Ablsrvx7/YxGL?=
 =?iso-8859-1?Q?L/9Ok6ugXUt6CsczUJZr2KvDmQaXdNJAAEfbethrsV5bBSFWaa8lQOkUOa?=
 =?iso-8859-1?Q?k+oOrzri90KXX20xhHJxTIUnKdRXu+CM+BmugYzaqHmA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?M9lAFQPxTLOyfBU/qXBLJrdcYzleoK48qBFsKvHOsIeEYTivIW1TNwSlYJ?=
 =?iso-8859-1?Q?jXfnujGcoXuA1/IZ8ez6N2NzZ/BML8hm7EP1F7tQP3TjzJ+FgF7ZdVt/IU?=
 =?iso-8859-1?Q?P5Coh2uqwdnfLkDSHTTyXUYodKVBG+3ruh4NXCvbw/pqqnWvgh8OVS6w5d?=
 =?iso-8859-1?Q?cuD1gfldblxnLWN8HFCnEIj+uKgzj5QDOLivhb55M/KCIHN9fZjn93qvt9?=
 =?iso-8859-1?Q?d7xX14ItQStlzK1GQP9GBIEK7zJ2e0Dl+QzfJw6/MOb0jRncMk+K6aB6LN?=
 =?iso-8859-1?Q?ZOWRcjsfYvBJWdUIMKYDgSYwf3swDMEk5oIpZVv5CjTGkMGAdt4q88JKwN?=
 =?iso-8859-1?Q?vKs6pr2cpCclG3XhFP9z72guKRmqxKHXtmX9FYM4eTk6hE63XWRUAn1bmt?=
 =?iso-8859-1?Q?ygYqPejs39uA5iv1dtgwTr2IpLS+LxeD1gZ0Y8YrIoOf5LvacAmUhXOSig?=
 =?iso-8859-1?Q?x04DH7wg6hgf/EXtHpXgH7mB+bWkANWbzMv+tg5a9JA+K+gXvVvEMVw1MZ?=
 =?iso-8859-1?Q?ax5h2dHhun5Gw80awfp9z8zcIsI3+K6XYvpjkkK3NLXf5Wqn9R9M9j1AGc?=
 =?iso-8859-1?Q?xNgDdxJDh9/FH8ayGmAXQ/hZm2wKJoj5CKhckapXrWSyAuSgRBS/8SvC7T?=
 =?iso-8859-1?Q?HXHeC+weOyVPjH+8oZLIoUSupU5izEWxEoYVSglMFuOFKNDOuRYiviah9g?=
 =?iso-8859-1?Q?Ll7WYnp8/D3tovPl0mBMTDh5g/nowWqNb7PKEZXFHqQTEkoTOSTYvnuKcc?=
 =?iso-8859-1?Q?0mnC5Z90q09CX0leR/6ySUw0jtqCCKlXLFiy26ZyAUT10zQH3OrkglNZLk?=
 =?iso-8859-1?Q?hR7iy4fjIviYss37un3lKwrL/Or+hhEfi0NgZJtvA2UbXjw1SX9pOWh6+i?=
 =?iso-8859-1?Q?Otu1VHm1Q4HjogJXsilqfsElsAk88szrcg9AsrC66TP27YLE9aVJrEmSaQ?=
 =?iso-8859-1?Q?3cLa0qyZq8EElbGzMs3iqfnBN06ViMrYgOMHhh8ewshn8XkcgqsVUvo8gp?=
 =?iso-8859-1?Q?NQeW6XiZybO0satDYt+B1Xlt7+jNwqgPGoyXE46Vpj+71yoEvw0rDmaiP5?=
 =?iso-8859-1?Q?0ORBrE7qmXmR69LGxq2dpmW8zI95bxOARfXnnn9e/kJifJJSD7H0SCnw1v?=
 =?iso-8859-1?Q?TVISeIT5UQN6HFriE5PCWvcKRfy21Gzkh0pFWMnhkwX+BM95Jg4M69jTt/?=
 =?iso-8859-1?Q?dVh9IAQpZci5uY7NzjDk2kF2WSZQyyFoCuFqF7owrNrtwAHFpTkKixuRn8?=
 =?iso-8859-1?Q?HEzPTg3L0s/S5f9RwV7//D+xmqSJ+DhqRiouiAt+iYJ9Z9yGk+UMwq2+2h?=
 =?iso-8859-1?Q?PUOzteqqZgT34wqNocg22umQuLhDdt2HublKPWvR/PkwRWAxm6ND+OBdZw?=
 =?iso-8859-1?Q?w16tGLmugg3E7GtpwYMLWiPWp04/fJl6TwvV/UYkC09qggA+CtJhe40rLt?=
 =?iso-8859-1?Q?KBAyI4VyI777RVNpQGwKC47Fu9jV39cxpI2WBklrxM0bJbPTAZ4h6Xg/E8?=
 =?iso-8859-1?Q?LtS2zhXHMjJUtHWly6IilHkk6/YpAyIeZbzPkDsp5eYNOwGGfEtLoaquaI?=
 =?iso-8859-1?Q?Rr1nBcr3b6MZSWVZKU0c9+uGvp8akhzoVRcBO07R34TFFt1/vwxZknU2do?=
 =?iso-8859-1?Q?na5FuLPpIfsaWjZXi/o/MCKNgkLXDulQh87OCd1zLzFoLTUCIT2K+Dkw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15c5df9-cd96-4733-254c-08dde0cbdd17
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 16:00:34.8505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dF2HXbAEEG14cP7J+1+3L01RqICtti57X1o2bO3Mmzwkk//UBLuBGHXeiLVMcZaj2he43JRR0GWP6oY0wMW4S6Oh23J3XKgDDuZfPVuht/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9164


Hi,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Currently, many common functions perform the same operations to calculate
> GIC register addresses. This patch consolidates the similar code into
> a separate helper function to improve maintainability and reduce duplicat=
ion.
> This refactoring also simplifies the implementation of eSPI support in fu=
ture
> changes.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V2:
> - no changes
> ---
>  xen/arch/arm/gic-v3.c          | 99 ++++++++++++++++++++++------------
>  xen/arch/arm/include/asm/irq.h |  1 +
>  2 files changed, 67 insertions(+), 33 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index cd3e1acf79..8fd78aba44 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -445,17 +445,62 @@ static void gicv3_dump_state(const struct vcpu *v)
>      }
>  }
> =20
> +static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32 offse=
t)
> +{
> +    switch ( irqd->irq )
> +    {
> +    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +        case GICD_ICENABLER:
> +        case GICD_ISPENDR:
> +        case GICD_ICPENDR:
> +        case GICD_ISACTIVER:
> +        case GICD_ICACTIVER:
> +            return (GICD_RDIST_SGI_BASE + offset);
> +        case GICD_ICFGR:
> +            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
> +        case GICD_IPRIORITYR:
> +            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
> +        default:
> +            break;
> +        }
> +    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +        case GICD_ICENABLER:
> +        case GICD_ISPENDR:
> +        case GICD_ICPENDR:
> +        case GICD_ISACTIVER:
> +        case GICD_ICACTIVER:
> +            return (GICD + offset + (irqd->irq / 32) * 4);
> +        case GICD_ICFGR:
> +            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
> +        case GICD_IROUTER:
> +            return (GICD + GICD_IROUTER + irqd->irq * 8);
> +        case GICD_IPRIORITYR:
> +            return (GICD + GICD_IPRIORITYR + irqd->irq);
> +        default:
> +            break;
> +        }
> +    default:
> +        break;
> +    }
> +
> +    /* Something went wrong, we shouldn't be able to reach here */
> +    panic("Invalid offset 0x%x for IRQ#%d", offset, irqd->irq);
> +
> +    return NULL;
> +}
> +
>  static void gicv3_poke_irq(struct irq_desc *irqd, u32 offset, bool wait_=
for_rwp)
>  {
>      u32 mask =3D 1U << (irqd->irq % 32);
> -    void __iomem *base;
> -
> -    if ( irqd->irq < NR_GIC_LOCAL_IRQS )
> -        base =3D GICD_RDIST_SGI_BASE;
> -    else
> -        base =3D GICD;
> +    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
> =20
> -    writel_relaxed(mask, base + offset + (irqd->irq / 32) * 4);
> +    writel_relaxed(mask, addr);
> =20
>      if ( wait_for_rwp )
>          gicv3_wait_for_rwp(irqd->irq);
> @@ -463,15 +508,9 @@ static void gicv3_poke_irq(struct irq_desc *irqd, u3=
2 offset, bool wait_for_rwp)
> =20
>  static bool gicv3_peek_irq(struct irq_desc *irqd, u32 offset)
>  {
> -    void __iomem *base;
> -    unsigned int irq =3D irqd->irq;
> -
> -    if ( irq >=3D NR_GIC_LOCAL_IRQS)
> -        base =3D GICD + (irq / 32) * 4;
> -    else
> -        base =3D GICD_RDIST_SGI_BASE;
> +    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
> =20
> -    return !!(readl(base + offset) & (1U << (irq % 32)));
> +    return !!(readl(addr) & (1U << (irqd->irq % 32)));
>  }
> =20
>  static void gicv3_unmask_irq(struct irq_desc *irqd)
> @@ -558,30 +597,26 @@ static inline uint64_t gicv3_mpidr_to_affinity(int =
cpu)
>  static void gicv3_set_irq_type(struct irq_desc *desc, unsigned int type)
>  {
>      uint32_t cfg, actual, edgebit;
> -    void __iomem *base;
> -    unsigned int irq =3D desc->irq;
> +    void __iomem *addr;
> =20
>      /* SGI's are always edge-triggered not need to call GICD_ICFGR0 */
> -    ASSERT(irq >=3D NR_GIC_SGI);
> +    ASSERT(desc->irq >=3D NR_GIC_SGI);
> =20
>      spin_lock(&gicv3.lock);
> =20
> -    if ( irq >=3D NR_GIC_LOCAL_IRQS)
> -        base =3D GICD + GICD_ICFGR + (irq / 16) * 4;
> -    else
> -        base =3D GICD_RDIST_SGI_BASE + GICR_ICFGR1;
> +    addr =3D get_addr_by_offset(desc, GICD_ICFGR);
> =20
> -    cfg =3D readl_relaxed(base);
> +    cfg =3D readl_relaxed(addr);
> =20
> -    edgebit =3D 2u << (2 * (irq % 16));
> +    edgebit =3D 2u << (2 * (desc->irq % 16));
>      if ( type & IRQ_TYPE_LEVEL_MASK )
>          cfg &=3D ~edgebit;
>      else if ( type & IRQ_TYPE_EDGE_BOTH )
>          cfg |=3D edgebit;
> =20
> -    writel_relaxed(cfg, base);
> +    writel_relaxed(cfg, addr);
> =20
> -    actual =3D readl_relaxed(base);
> +    actual =3D readl_relaxed(addr);
>      if ( ( cfg & edgebit ) ^ ( actual & edgebit ) )
>      {
>          printk(XENLOG_WARNING "GICv3: WARNING: "
> @@ -600,15 +635,12 @@ static void gicv3_set_irq_type(struct irq_desc *des=
c, unsigned int type)
>  static void gicv3_set_irq_priority(struct irq_desc *desc,
>                                     unsigned int priority)
>  {
> -    unsigned int irq =3D desc->irq;
> +    void __iomem *addr;
> =20
>      spin_lock(&gicv3.lock);
> =20
> -    /* Set priority */
> -    if ( irq < NR_GIC_LOCAL_IRQS )
> -        writeb_relaxed(priority, GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 =
+ irq);
> -    else
> -        writeb_relaxed(priority, GICD + GICD_IPRIORITYR + irq);
> +    addr =3D get_addr_by_offset(desc, GICD_IPRIORITYR);
> +    writeb_relaxed(priority, addr);
> =20
>      spin_unlock(&gicv3.lock);
>  }
> @@ -1273,6 +1305,7 @@ static void gicv3_irq_set_affinity(struct irq_desc =
*desc, const cpumask_t *mask)
>  {
>      unsigned int cpu;
>      uint64_t affinity;
> +    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IROUTER);
> =20
>      ASSERT(!cpumask_empty(mask));
> =20
> @@ -1284,7 +1317,7 @@ static void gicv3_irq_set_affinity(struct irq_desc =
*desc, const cpumask_t *mask)
>      affinity &=3D ~GICD_IROUTER_SPI_MODE_ANY;
> =20
>      if ( desc->irq >=3D NR_GIC_LOCAL_IRQS )
> -        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc-=
>irq * 8));
> +        writeq_relaxed_non_atomic(affinity, addr);
> =20
>      spin_unlock(&gicv3.lock);
>  }
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/ir=
q.h
> index fce7e42a33..5bc6475eb4 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -29,6 +29,7 @@ struct arch_irq_desc {
>   */
>  #define NR_IRQS		1024
> =20
> +#define SPI_MAX_INTID   1019
>  #define LPI_OFFSET      8192
> =20
>  /* LPIs are always numbered starting at 8192, so 0 is a good invalid cas=
e. */

--=20
WBR, Volodymyr=

