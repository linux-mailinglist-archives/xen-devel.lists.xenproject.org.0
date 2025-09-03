Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A384B42BD5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 23:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109045.1458923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utuxy-0000rH-Rj; Wed, 03 Sep 2025 21:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109045.1458923; Wed, 03 Sep 2025 21:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utuxy-0000ot-Oi; Wed, 03 Sep 2025 21:24:30 +0000
Received: by outflank-mailman (input) for mailman id 1109045;
 Wed, 03 Sep 2025 21:24:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rz8A=3O=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1utuxw-0000WA-Rn
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 21:24:28 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f2e6501-890c-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 23:24:27 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GVXPR03MB11033.eurprd03.prod.outlook.com
 (2603:10a6:150:287::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 21:24:22 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 21:24:22 +0000
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
X-Inumbo-ID: 5f2e6501-890c-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAqGYWpGgcJqdaXTL9fPWp6Ph5qt63JXpfakdHr9yAKLR2PUDe/QDcRCdYrcVp9UZcqp2bqtB+C+26vmZ0NKLanN3IDEmClDha2ijo5bRDuTCYX17mAOSfjXX8d31oGC7X6vv45K/K4K4dBZGDeAAFnpyU5IQnfIqdaFCSYcSME5gjxdu4h97YeXSI/xLdwvYuoBNuAlxPoDVS8qGw8yH+T3aFy7OUibLc5VnxyZwpJWgcJ+/wrItsxzzSB8kvvyq0T/4rYogowygfToOeoVko9NzVVbRHOzKRmsCVG/FYvYSi3/FHE0RzbUcJBt8WRM29oBbVN6xWLDZsejAkoUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTsDulHDpx1lzcz7xtXo4Vgsh3MUrM2r5m44z6nYTBM=;
 b=NvXfgXw5v3fRJffMQuULAjsLSZGQW+jJmaxE1ix0EgABFKCbw/7osmZEnpzR4ds+jQ/LCD2sSP4K6vJjwdwC7SndcNsEzdrE1jiL2/FaDuLUUmH8nRZnsvpSb73Tg91AzR3rUQ1UT6DSWALlR3vdEc4Hl9cNerhDcQrzfYbW0+yullmVDno1LOqmWzPYndbgmXd3gNsETA4QWOsQq9Bi4Jy1+lJ7GPvk4wad7DjRHLg1o4dp9BdBKxx2jKiOU9X238k9u6B68x8oPJKtvPf52t2BQxdzUeA20Mgnb8jc3hXAG+3D38x7WN+Lg5lCpGQRJmnDhkYDLbLvrDpZJhjAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTsDulHDpx1lzcz7xtXo4Vgsh3MUrM2r5m44z6nYTBM=;
 b=ST7Q2oKS96Nbg4RiiUthG5UHP55m+zgBpttU8+rzvbqGodnWbBAHhdZOK7HwA1OdlgCqCCzn89oiDTewjt7zn/jgZ/5u93g+Uf7KwYsMD8FxspuMHLnZEORdtjKmIqNRALn7esML/d6U0Azdne0P9cCebrQvjwA9DTd4Y4qiV+qGInYta7S9FGYcA69JDa3eYTgiRqxRhshyQQWGaWMwG0TUXbn3QUDjO1+cvRgdlHB7Ia5If7ohS1nVN5LbofZDKeiH1bFEQ59F8dkQCUrCQeZFj2AN46eEGHqFDiTgZD0JAK/iJN9onmEtmo1mYLxcW6BRU9H5BtrOCnzrnDo/TA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v6 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Topic: [PATCH v6 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcHN9B/XZckpNoZ0qtaeK6YdrfOA==
Date: Wed, 3 Sep 2025 21:24:21 +0000
Message-ID: <87y0qvteka.fsf@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
	<e91abc4c21f9f1fe425b71b3000e7ec0135d5cb9.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <e91abc4c21f9f1fe425b71b3000e7ec0135d5cb9.1756908472.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Wed, 3 Sep 2025 14:30:10 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GVXPR03MB11033:EE_
x-ms-office365-filtering-correlation-id: fe7289e5-252d-443b-5c79-08ddeb303ff1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8FufkNwIBiBUBtTPdqQjgQOa0TnitFaqACdOGa3a6dlwlwOgsptT3lvTZd?=
 =?iso-8859-1?Q?p1KPKZehBfOOgjUUobs33bfFm31t744/hTnuz1SkW5Z9QU/lmrF+LCPBUe?=
 =?iso-8859-1?Q?17PIQzXBzUGHHBE7BqI4RGpgBCZ+r5x77FmamvwuMHMhiI0S+mKo0SiqhS?=
 =?iso-8859-1?Q?KiIJ+FDV5AohFDF7mSFm6sOCVVBo1U81ZsFOp63VjMSaXpd68iy/naRgmF?=
 =?iso-8859-1?Q?JRh4ri8i6tx8ebRnQV7jZKnxUSKqFZc5tbb3P0N9jzADfjmw/ky4r0tlS2?=
 =?iso-8859-1?Q?07ZrhUEV21V4T0zrVrpGYilGUHO9fIO0ivnJwh1eaLYz1rP7nkEixjaaQA?=
 =?iso-8859-1?Q?E9JBt5B3UFZVB/QVgVXU71sW2REOyVxiHhERJo1g+IglqEos7NvSgQ9Rgm?=
 =?iso-8859-1?Q?KtiSN8PJjKpta0EIc6dNWNniB+eLnCL1/0/iNaxmGgbLKZGhDf7oOn3sZm?=
 =?iso-8859-1?Q?rdn/DEfNp9J+8m8izo+3g0+7DcP7IAV5ukAwtAfRRQOuX/ABNQYs//eHdG?=
 =?iso-8859-1?Q?Hw9HYwmelM+5SC5LujLRvwfVc/flXRkOO7EmdLrK3aWqcto5eYTtxYB9T4?=
 =?iso-8859-1?Q?oWH5nHAK0MyefiaRQCNneBIUhGNliHouOHeZihaLjBX2eI0OBwpnF5HtEu?=
 =?iso-8859-1?Q?rAeEEEoBZxXiKgWwa313DV5cDogFlyTi/fcAqRVkzbN9a2PMq39Lm2iXkj?=
 =?iso-8859-1?Q?fkELsoxCseW7alSyIXzbWg94NfgRqts6Fz1ml/7fHzzSHw4Gr9WA/iPwtX?=
 =?iso-8859-1?Q?3SttYRuWqtdoKw8yc3J16aO/DS1t/OLgRov0yUzD76YZ0t+4Rm66q9+QlY?=
 =?iso-8859-1?Q?b8VR0kCYRQdL7ZpMC5umWSgIgJedsX4mYXPgaUt56u5PXOyItKOtHf/1Td?=
 =?iso-8859-1?Q?YfTy2gtVAM6RMmRKAXqUql6cRG9H8BrxZNRNtzbMITXf3wWczr+0a8TbNK?=
 =?iso-8859-1?Q?Gsk5aKBJxY0ziyFmTiNQjuttbXSeJfLgyXKYOg2gxZxSfOnyJ4SE0pvjID?=
 =?iso-8859-1?Q?VqprwKv75rZHvBWVu4HdtqBoEzZhHaqwPbI94lYMGbwg9PXUf8RCGBpxBj?=
 =?iso-8859-1?Q?RKUrJalGlnh6mB8yX70TOPpMrsyyMWaaC6cq2LXKoLAL8xrh/A4g+g7ZdS?=
 =?iso-8859-1?Q?RYybjKziJ5p0MvIucoALVzwZL/AbzNfluD7N0swiqBvJYcPyXKoikRJE26?=
 =?iso-8859-1?Q?xPXpp4ZDXdhQzDogkMWl79unGYFKookQdoY1+BYD1s8v3B6bTmPFyQUSJG?=
 =?iso-8859-1?Q?YNrVQ+rhKeM7jBsiNNQi0HzZgF+bEN+sgTUVARYA6SecOjU8AuG7HId8BN?=
 =?iso-8859-1?Q?HnFuyOFSSspRsG1ENPmBBBJjvsr2R38xlnumlwqMEmmkRms4uIq4PzPcks?=
 =?iso-8859-1?Q?MXPf+60IKHuphT0jFY+0b/fq0l6ULrKC/uK81xCNnMw+xRgOLWWAwW8pM7?=
 =?iso-8859-1?Q?127sXJT3WZ9x6HqwCAj+F/nd4riUdTH2pyVIx/LOAq2uvZMktfdagNed7m?=
 =?iso-8859-1?Q?fmFDwcl/bKe8gO7gk7oEzfIMnVt3o/fEpvDNbd2HwZRA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7KAQPtoTyIbeMcaiwdmXr/LfL2Sy73AsB5qPKUH7oeEVWBxs75A7bYMkoY?=
 =?iso-8859-1?Q?/0juuVhDUXKKoAxOUHYUKQNyS7nHfK5U+Pb0pqm7376Bjjzyvc/7hB2zGf?=
 =?iso-8859-1?Q?m+uDw5QDDQ/gosasUKQ9vlOID6FELorWxd7szN6Z8NJVQvbHKJRdYTOvVl?=
 =?iso-8859-1?Q?feQ7XTQvJstE/UP5J0WHUL1udCOaOqM/AfJ72/1QtOBqJVDAbbaluUjaHY?=
 =?iso-8859-1?Q?osE8TmZlDuz9aMlNHLSEq6lpW3yBjEmhnW/HycQ4W/8koN85aylUcNotQv?=
 =?iso-8859-1?Q?Eo5m2WO30Mf5vjOgYlB0dixxWGfS4Qy+BHS5RjQ+aQmMZsEfR2phrbLmtX?=
 =?iso-8859-1?Q?4RECu28hYCqeTQfykWmYlDX+wnMublXkLOtLRlaX+LS2Rz40e0fwH+0sJ6?=
 =?iso-8859-1?Q?rArk2vN0rT6DmqHtYL8QP6ubvwaTHm/G++ZgfBjut8OpbEHbb3QrZwPAAN?=
 =?iso-8859-1?Q?Pg7qcRfql7B8DsSZZGyLSVh3yliJYdSs96Y7HqEHIsvjxV6yOOiooD7hHu?=
 =?iso-8859-1?Q?I8LSI6IgkMLu9eOr5lGCsKUDvk4KHY6iHZMB9Dc+xSsbUp5GQLQS8K5VFk?=
 =?iso-8859-1?Q?eW2H1CTIUHsezj6LcJbyoZ3FIyqcpXzBmtbmCmumPU05HvjaUXZsI528KP?=
 =?iso-8859-1?Q?+Yx3QhYXmKiXdz/0WS0vEFzWJvGMIClLSAXsiBF6g+xQa7HIdA95QE2kBp?=
 =?iso-8859-1?Q?1EdnJ0sS8TpvnWqZKf6N7/UY7WNyOEQIVUqW/RC63Wyo940swFkl68p8zn?=
 =?iso-8859-1?Q?/i4o+kwwL8qX2GVsEEsFdZvbopFYAEMRc9NLB3AyZezdcpUgpfMbO9Q70Q?=
 =?iso-8859-1?Q?6tgP8XUwBCsRiuF5NQOeflBihYOlZVJOz4SfxBDzNphZDpKAarA6LjAZvP?=
 =?iso-8859-1?Q?pubD465k2K4E+vehwvvCUia+DB561tMtykpsJOl+yyCMMJRjCp7wIQ1/rL?=
 =?iso-8859-1?Q?bK/NlpZr8CZBRipO9kwcGl/OVQ/mL8t55K/t9n2aPmyqUS253Uhq3w9IsT?=
 =?iso-8859-1?Q?EWoTWpTfOsG1OQeQyR25SKD9sZaX1BNLEV9nn6sWhouFO5fl3zlOp9fB+7?=
 =?iso-8859-1?Q?I11OTd1Rd+5zsU0lydcXnfuezA//vXebfbKXtJhQsRNkdvn5wfk4N8nDKd?=
 =?iso-8859-1?Q?+Tahim9zeXs91n4Gl/GliHqavXl7/IJBzj1IUqdMPNXqUlPLXf3/Th/pTe?=
 =?iso-8859-1?Q?lICeBibVgwvZJJP5IKqd+qLv15ToVtJWC+6k7R68hzJgZ1gu6KVKCAG7B8?=
 =?iso-8859-1?Q?Dl3k7JxG1si+lPerVTXaGi0IG79c6ZKofaCC7F3ejFIuCFw5WKmO5h4WtT?=
 =?iso-8859-1?Q?WYHgGWxuhChEz5IsWSJle7mMwhUa3lfdauy4BfTmD3sNTWNZ4OSzgx8mLs?=
 =?iso-8859-1?Q?/WeOiztA4MdZbq3JsyfqGg1DvnClHLSaZ/L/6pLLankpthyX1Z12C9z6tX?=
 =?iso-8859-1?Q?OJVsTuGqRUX0IBNlYOHuFlIXeQm1zQHvlixoSlGGn4O/3VAztTI5Nduk3p?=
 =?iso-8859-1?Q?2at4HhGmtx1iVUI7Vz5Je35XHok1M6ibML66hmVydXcLkgv9zQ98w97sQs?=
 =?iso-8859-1?Q?4L0KX1zCxuKP2HbQbYUEYZHD00EgswycfaCkbNUszB7WhQbv0iCmMkEYgP?=
 =?iso-8859-1?Q?dmplkrrZ21qfDUeDc1VH9cvFU4iKVEQcFmpOiRnoCI5oYKPP7GbZH7zA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7289e5-252d-443b-5c79-08ddeb303ff1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 21:24:21.9606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQ0ylBgeQRiVNVJ08WJqdktyZPqgV7gPSfdDW0zQcbREglLxic2ri9OSSx34IA95TrQOtxlfWY0GMa208bdp/TxTGqkuh3qehqN1WbKhFQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11033

Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> This change introduces resource management in the VGIC to handle
> extended SPIs introduced in GICv3.1. The pending_irqs and
> allocated_irqs arrays are resized to support the required
> number of eSPIs, based on what is supported by the hardware and
> requested by the guest. A new field, ext_shared_irqs, is added
> to the VGIC structure to store information about eSPIs, similar
> to how shared_irqs is used for regular SPIs.
>
> Since the eSPI range starts at INTID 4096 and INTIDs between 1025
> and 4095 are reserved, helper macros are introduced to simplify the
> transformation of indices and to enable easier access to eSPI-specific
> resources. These changes prepare the VGIC for processing eSPIs as
> required by future functionality.
>
> The initialization and deinitialization paths for vgic have been updated
> to allocate and free these resources appropriately. Additionally,
> updated handling of INTIDs greater than 1024, passed from the toolstack
> during domain creation, and verification logic ensures only valid SPI or
> eSPI INTIDs are used.
>
> The existing SPI behavior remains unaffected when guests do not request
> eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
> option is disabled.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes for V6:
> - introduced a new function for index to virq conversion, idx_to_virq.
>   This allows the removal of eSPI-specific functions and enables the
>   reuse of existing code for regular SPIs
> - fixed the return value of vgic_allocate_virq in the case of eSPI
> - updated the error message in route_irq_to_guest(). To simplify it and
>   avoid overcomplicating with INTID ranges, propose removing the
>   information about the max number of IRQs
> - fixed eSPI rank initialization to avoid using EXT_RANK_IDX2NUM for
>   converting the eSPI rank to the extended range
> - updated the recalculation logic to avoid the nr_spis > 1020 -
>   NR_LOCAL_IRQS check when nr_spis is reassigned in the case of eSPI
> - fixed formatting issues for macros
> - minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
>   into appropriate inline functions introduced in the previous patch
> - minor change: changed int to unsigned int for nr_espis
>
> Changes in V5:
> - removed the has_espi field because it can be determined by checking
>   whether domain->arch.vgic.nr_espis is zero or not
> - since vgic_ext_rank_offset is not used in this patch, it has been
>   moved to the appropriate patch in the patch series, which implements
>   vgic eSPI registers emulation and requires this function
> - removed ifdefs for eSPI-specific macros to reduce the number of ifdefs
>   and code duplication in further changes
> - fixed minor nit: used %pd for printing domain with its ID
>
> Changes in V4:
> - added has_espi field to simplify determining whether a domain is able
>   to operate with eSPI
> - fixed formatting issues and misspellings
>
> Changes in V3:
> - fixed formatting for lines with more than 80 symbols
> - introduced helper functions to be able to use stubs in case of
>   CONFIG_GICV3_ESPI disabled, and as a result, reduce the number of
>   #ifdefs
> - fixed checks for nr_spis in domain_vgic_init
> - updated comment about nr_spis adjustments with dom0less mention
> - moved comment with additional explanations before checks
> - used unsigned int for indexes since they cannot be negative
> - removed unnecessary parentheses
> - move vgic_ext_rank_offset to the below ifdef guard, to reduce the
>   number of ifdefs
>
> Changes in V2:
> - change is_espi_rank to is_valid_espi_rank to verify whether the array
>   element ext_shared_irqs exists. The previous version, is_espi_rank,
>   only checked if the rank index was less than the maximum possible eSPI
>   rank index, but this could potentially result in accessing a
>   non-existing array element. To address this, is_valid_espi_rank was
>   introduced, which ensures that the required eSPI rank exists
> - move gic_number_espis to
>   xen/arm: gicv3: implement handling of GICv3.1 eSPI
> - update vgic_is_valid_irq checks to allow operating with eSPIs
> - remove redundant newline in vgic_allocate_virq
> ---
>  xen/arch/arm/include/asm/vgic.h |  12 +++
>  xen/arch/arm/irq.c              |   3 +-
>  xen/arch/arm/vgic.c             | 174 ++++++++++++++++++++++++++++++--
>  3 files changed, 176 insertions(+), 13 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 3e7cbbb196..1cf0a05832 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -146,6 +146,10 @@ struct vgic_dist {
>      int nr_spis; /* Number of SPIs */
>      unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
>      struct vgic_irq_rank *shared_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +    struct vgic_irq_rank *ext_shared_irqs;
> +    unsigned int nr_espis; /* Number of extended SPIs */
> +#endif
>      /*
>       * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
>       * struct arch_vcpu.
> @@ -243,6 +247,14 @@ struct vgic_ops {
>  /* Number of ranks of interrupt registers for a domain */
>  #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis + 31) / 32)
> +#endif
> +#define EXT_RANK_MIN (ESPI_BASE_INTID / 32)
> +#define EXT_RANK_MAX ((ESPI_MAX_INTID + 31) / 32)
> +#define EXT_RANK_NUM2IDX(num) ((num) - EXT_RANK_MIN)
> +#define EXT_RANK_IDX2NUM(idx) ((idx) + EXT_RANK_MIN)
> +
>  #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>  #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
> =20
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index c934d39bf6..c2f1ceb91f 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -494,8 +494,7 @@ int route_irq_to_guest(struct domain *d, unsigned int=
 virq,
>      if ( !vgic_is_valid_line(d, virq) )
>      {
>          printk(XENLOG_G_ERR
> -               "the vIRQ number %u is too high for domain %u (max =3D %u=
)\n",
> -               irq, d->domain_id, vgic_num_irqs(d));
> +               "invalid vIRQ number %u for domain %pd\n", irq, d);
>          return -EINVAL;
>      }
> =20
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 2bbf4d99aa..b42aee8d0c 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -25,11 +25,61 @@
>  #include <asm/vgic.h>
> =20
> =20
> +static inline unsigned int idx_to_virq(struct domain *d, unsigned int id=
x)
> +{
> +    if ( idx >=3D vgic_num_irqs(d) )
> +        return espi_idx_to_intid(idx - vgic_num_irqs(d));
> +
> +    return idx;
> +}
> +
>  bool vgic_is_valid_line(struct domain *d, unsigned int virq)
>  {
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( virq >=3D ESPI_BASE_INTID &&
> +         virq < espi_idx_to_intid(d->arch.vgic.nr_espis) )
> +        return true;
> +#endif
> +
>      return virq < vgic_num_irqs(d);
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * Since eSPI indexes start from 4096 and numbers from 1024 to
> + * 4095 are forbidden, we need to check both lower and upper
> + * limits for ranks.
> + */
> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int ran=
k)
> +{
> +    return rank >=3D EXT_RANK_MIN &&
> +           EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d);
> +}
> +
> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> +                                                       unsigned int rank=
)
> +{
> +    return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)]=
;
> +}
> +
> +#else
> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int ran=
k)
> +{
> +    return false;
> +}
> +
> +/*
> + * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn=
,
> + * because in this case, is_valid_espi_rank will always return false.
> + */
> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> +                                                       unsigned int rank=
)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NULL;
> +}
> +#endif
> +
>  static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>                                                    unsigned int rank)
>  {
> @@ -37,6 +87,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(struc=
t vcpu *v,
>          return v->arch.vgic.private_irqs;
>      else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
>          return &v->domain->arch.vgic.shared_irqs[rank - 1];
> +    else if ( is_valid_espi_rank(v->domain, rank) )
> +        return vgic_get_espi_rank(v, rank);
>      else
>          return NULL;
>  }
> @@ -117,6 +169,54 @@ int domain_vgic_register(struct domain *d, unsigned =
int *mmio_count)
>      return 0;
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +static unsigned int vgic_num_spi_lines(struct domain *d)
> +{
> +    return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
> +}
> +
> +static int init_vgic_espi(struct domain *d)
> +{
> +    unsigned int i, idx;
> +
> +    if ( d->arch.vgic.nr_espis =3D=3D 0 )
> +        return 0;
> +
> +    d->arch.vgic.ext_shared_irqs =3D
> +        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
> +    if ( d->arch.vgic.ext_shared_irqs =3D=3D NULL )
> +        return -ENOMEM;
> +
> +    for ( i =3D d->arch.vgic.nr_spis, idx =3D 0;
> +          i < vgic_num_spi_lines(d); i++, idx++ )
> +        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
> +                              espi_idx_to_intid(idx));
> +
> +    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
> +        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i],
> +                       EXT_RANK_IDX2NUM(i), 0);
> +
> +    return 0;
> +}
> +
> +#else
> +static int init_vgic_espi(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static unsigned int vgic_num_spi_lines(struct domain *d)
> +{
> +    return d->arch.vgic.nr_spis;
> +}
> +
> +#endif
> +
> +static unsigned int vgic_num_alloc_irqs(struct domain *d)
> +{
> +    return vgic_num_spi_lines(d) + NR_LOCAL_IRQS;

This is good that you are using NR_LOCAL_IRQS here.

> +}
> +
>  int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>  {
>      int i;
> @@ -133,7 +233,39 @@ int domain_vgic_init(struct domain *d, unsigned int =
nr_spis)
> =20
>      /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988=
  */
>      if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
> +#ifndef CONFIG_GICV3_ESPI
>          return -EINVAL;
> +#else
> +    {
> +        /*
> +         * During domain creation, the dom0less DomUs code or toolstack
> +         * specifies the maximum INTID, which is defined in the domain
> +         * config subtracted by 32 to cover the local IRQs (please see
> +         * the comment to VGIC_DEF_NR_SPIS). To compute the actual numbe=
r
> +         * of eSPI that will be usable for, add back 32.
> +         */
> +        nr_spis +=3D 32;

I think that it is better to use NR_LOCAL_IRQS here.

(Also, I just noticed the same problem as with documentation, meaning
that nr_spis actually does not represent number of SPIs anymore, and
behaves more like max_spi, but let's set this issue aside for now)

> +        if ( nr_spis > espi_idx_to_intid(NR_ESPI_IRQS) )
> +            return -EINVAL;
> +
> +        if ( nr_spis >=3D ESPI_BASE_INTID )
> +        {
> +            unsigned int nr_espis =3D min(nr_spis - ESPI_BASE_INTID, 102=
4U);
> +
> +            /* Verify if GIC HW can handle provided INTID */
> +            if ( nr_espis > gic_number_espis() )
> +                return -EINVAL;
> +
> +            d->arch.vgic.nr_espis =3D nr_espis;
> +            /* Set the maximum available number for regular SPIs */
> +            nr_spis =3D VGIC_DEF_NR_SPIS;
> +        }
> +        else
> +        {
> +            return -EINVAL;
> +        }
> +    }
> +#endif
> =20
>      d->arch.vgic.nr_spis =3D nr_spis;
> =20
> @@ -145,7 +277,7 @@ int domain_vgic_init(struct domain *d, unsigned int n=
r_spis)
>          return -ENOMEM;
> =20
>      d->arch.vgic.pending_irqs =3D
> -        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
> +        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
>      if ( d->arch.vgic.pending_irqs =3D=3D NULL )
>          return -ENOMEM;
> =20
> @@ -156,12 +288,16 @@ int domain_vgic_init(struct domain *d, unsigned int=
 nr_spis)
>      for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
>          vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
> =20
> +    ret =3D init_vgic_espi(d);
> +    if ( ret )
> +        return ret;
> +
>      ret =3D d->arch.vgic.handler->domain_init(d);
>      if ( ret )
>          return ret;
> =20
>      d->arch.vgic.allocated_irqs =3D
> -        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
> +        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_alloc_irqs(d=
)));
>      if ( !d->arch.vgic.allocated_irqs )
>          return -ENOMEM;
> =20
> @@ -182,9 +318,12 @@ void domain_vgic_free(struct domain *d)
>      int i;
>      int ret;
> =20
> -    for ( i =3D 0; i < (d->arch.vgic.nr_spis); i++ )
> +    for ( i =3D 32; i < vgic_num_alloc_irqs(d); i++ )

s/32/NR_LOCAL_IRQS

>      {
> -        struct pending_irq *p =3D spi_to_pending(d, i + 32);
> +        struct pending_irq *p;
> +        unsigned int virq =3D idx_to_virq(d, i);
> +
> +        p =3D spi_to_pending(d, virq);
> =20
>          if ( p->desc )
>          {
> @@ -198,6 +337,9 @@ void domain_vgic_free(struct domain *d)
>      if ( d->arch.vgic.handler )
>          d->arch.vgic.handler->domain_free(d);
>      xfree(d->arch.vgic.shared_irqs);
> +#ifdef CONFIG_GICV3_ESPI
> +    xfree(d->arch.vgic.ext_shared_irqs);
> +#endif
>      xfree(d->arch.vgic.pending_irqs);
>      xfree(d->arch.vgic.allocated_irqs);
>  }
> @@ -323,10 +465,12 @@ void arch_move_irqs(struct vcpu *v)
>       */
>      ASSERT(!is_lpi(vgic_num_irqs(d) - 1));
> =20
> -    for ( i =3D 32; i < vgic_num_irqs(d); i++ )
> +    for ( i =3D 32; i < vgic_num_alloc_irqs(d); i++ )

It is great idea to start using NR_LOCAL_IRQS here instead of hard-coded 32=
.

>      {
> -        v_target =3D vgic_get_target_vcpu(v, i);
> -        p =3D irq_to_pending(v_target, i);
> +        unsigned int virq =3D idx_to_virq(d, i);
> +
> +        v_target =3D vgic_get_target_vcpu(v, virq);
> +        p =3D irq_to_pending(v_target, virq);
> =20
>          if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p-=
>status) )
>              irq_set_affinity(p->desc, cpu_mask);
> @@ -539,7 +683,7 @@ struct pending_irq *irq_to_pending(struct vcpu *v, un=
signed int irq)
>      else if ( is_lpi(irq) )
>          n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, ir=
q);
>      else
> -        n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
> +        n =3D spi_to_pending(v->domain, irq);
>      return n;
>  }
> =20
> @@ -547,7 +691,12 @@ struct pending_irq *spi_to_pending(struct domain *d,=
 unsigned int irq)
>  {
>      ASSERT(irq >=3D NR_LOCAL_IRQS);
> =20
> -    return &d->arch.vgic.pending_irqs[irq - 32];
> +    if ( is_espi(irq) )
> +        irq =3D espi_intid_to_idx(irq) + d->arch.vgic.nr_spis;
> +    else
> +        irq -=3D 32;

s/32/NR_LOCAL_IRQS

Also, I want you to consider adding local variable "idx" instead of
reusing "irq" parameter.

> +
> +    return &d->arch.vgic.pending_irqs[irq];
>  }
> =20
>  void vgic_clear_pending_irqs(struct vcpu *v)
> @@ -668,6 +817,9 @@ bool vgic_reserve_virq(struct domain *d, unsigned int=
 virq)
>      if ( !vgic_is_valid_line(d, virq) )
>          return false;
> =20
> +    if ( is_espi(virq) )
> +        virq =3D espi_intid_to_idx(virq) + vgic_num_irqs(d);

Here as well. It is very confusing when you are updating virq with a
value that does not corresponds in IRQ number anymore.

> +
>      return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
>  }
> =20
> @@ -685,7 +837,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>      else
>      {
>          first =3D 32;
> -        end =3D vgic_num_irqs(d);
> +        end =3D vgic_num_alloc_irqs(d);
>      }
> =20
>      /*
> @@ -700,7 +852,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>      }
>      while ( test_and_set_bit(virq, d->arch.vgic.allocated_irqs) );
> =20
> -    return virq;
> +    return idx_to_virq(d, virq);
>  }
> =20
>  void vgic_free_virq(struct domain *d, unsigned int virq)

--=20
WBR, Volodymyr=

