Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A083F2729
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 09:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169262.309199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGyWu-0000yZ-Ka; Fri, 20 Aug 2021 07:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169262.309199; Fri, 20 Aug 2021 07:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGyWu-0000vB-HS; Fri, 20 Aug 2021 07:01:28 +0000
Received: by outflank-mailman (input) for mailman id 169262;
 Fri, 20 Aug 2021 07:01:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGyWs-0000v5-BM
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 07:01:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dfddc3c-0184-11ec-a68b-12813bfff9fa;
 Fri, 20 Aug 2021 07:01:25 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-DASGLHlnNbGmjwoew19kYQ-1; Fri, 20 Aug 2021 09:01:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 07:01:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 07:01:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Fri, 20 Aug 2021 07:01:11 +0000
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
X-Inumbo-ID: 6dfddc3c-0184-11ec-a68b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629442884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yiC4UT2HKm11r1HQEMs4Hu4doySrRtfdENNmxdexH2Y=;
	b=T6SPlqgAALqq+5bCSuO4da2hafe6+3R3/6/pYIoWi9fXvsC6agvx+HYN9/pjBbS1Ww9I1j
	Nu5O+1j1sS3BQNXnjCS2uwic4K67xOpUShvCRASQjSyt7cy/klhRMuAepAEBsC9lSiRO8k
	HjUj1mbfKRNtaTEGQXfS8jOTKzN8ZwE=
X-MC-Unique: DASGLHlnNbGmjwoew19kYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkB9iegY34WyNHGZwtIpf0MXTRCW6tM4RrNeRDnRA9DArcgvG20ixm6PFEOTX9za2Ce7XOAce1kBDF8E/vz+BvTaQU8i4+zocFQdNwnQEls8uDEU874XDAvXMj3YKRJgh6Qx/xICfqJ9+qe4oeoyF60U0Vay3s3a2FbL2q935D9kyXgjRE5l4kYoGxlu1+rEYb5gvh/pe0Wr0y8iGrqp+IR/fRDuJb3WZ57GlXSImqlGgrXPQSr2HKU28dZ9oCbgnB5Owqk+U8fKGOrkRqEW5BW3Y/acxpU3ov2Gtt4r7R1pzAgiDlWWn2aCbSm9eQu+8MdyaTluu0JJqbRoTX9hVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDMFeztG2YFrgSsFOaTBP3sTriRUsScYBM23J+zzJ88=;
 b=FpZkkPvD63PIUrN51s8mmVyX7X0X1v3DHT3qbFCXhRFWUnt+5zPvKrd9IfbMFe8g1ySG/b7C408aGgOkeKJ/IOgKEFuIF/RoISD7pLca3b5Gaa7xzTpahCA3008Il5cLqDrmIv8RqExmANjQC1qq9+0O3tiCamsXQvZU71TTQi4RkIECckSq4HYmH96SjjPhg3OVl64lyrJsHZZrBjwbNF1z5h80hJ1T5v1lcDFwLlscTwjM2JdVY5ItfaYxw/vbjCZsJ6JXRh5DV4H3AcW4DF3qVGhArKY3W0J32xISfft05kdYyFB75SG9FWj/pjkwp657iaaI8JGopC/uaQHUWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 02/14] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
To: Rahul Singh <rahul.singh@arm.com>
CC: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1629366665.git.rahul.singh@arm.com>
 <c6009c327eaed66206fa093732ab6672530acd27.1629366665.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da5db823-1875-ff7d-6d39-aacc170e994f@suse.com>
Date: Fri, 20 Aug 2021 09:01:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <c6009c327eaed66206fa093732ab6672530acd27.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f34d83a-8f50-469c-c3ed-08d963a84b30
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31204D74A067EB870D6F8642B3C19@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wRspc75Rhmavd6pBeeibelRuZM/0BASeY6VbVZ6zZBHHT4YzsfaJMgtzKr1HDkLtEJqB0BXhph8JdTLMpRDh7oA39jj29ZYiBRt3qWmeHuvo73YzNACH8e4Bk2FF8ayyyre79AyU7yJ8ksbxCcLrO83wXnPX6J565jt4TqpIW9ypWLgHVASEEupoFYTEDPZ5rHmt3KlaunX32JqwABzfehGlQq6w1b4xDvT6LOzVXyqpnyBQidHTp56KicqNSa/dGRwUkvpTM5+U1lnNGSs2yY7BeSSNPivzjNbCfKa1HnuMSu8vr2fpwnTW7q9ihwGvXHo34TRiRLsOSwVCqR8FA7vmbkYETzdVsU0LLTvOM+4zLE3OiUehjN3uX6WKAFMgA8dMX4sPMxbLeB2Vq8R+SE1pH72MAzELoZP7oLSr4NuDwgOivu0QpVDrqV93E+arN0jR60DiEUKhorrCv3jZ7BkUEabCh0h6UIryDf4pCp8E8crLMZ7NNSXRR+iYLuFgo9OK0AIPi0lMnVnD//9O+uPCgKqFlt8FPhEZGwF9bae6gb2yVFAwH+UcpvT4hwnhkOgIO0QpxL0rf4nSaRv7l6P9k/ex75YPo5Z1/QI4u0q387mLMfQOxY1niH6EVVAXtBwZA0uaFoanaHdft9t6/wHd6cbf9WqPHWtB0OQ3j8RisWXpWC3/pW7QdoJgsBrw/vawceZSZ2zCdcDOz3KsdjgZvxE8dMTySmDW3ohGJjQ8FHZl0pmm56AZwUHR40v+5U19QDkkK0pBr+Z+NuVk5uojZ/qDK9i8Oilw6TndOwnS05/xAIsIBEE3I5W96carmxgL0hTzGccduCoa+KAEVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39860400002)(366004)(136003)(83380400001)(26005)(66476007)(53546011)(66946007)(66556008)(5660300002)(2906002)(6666004)(186003)(6486002)(478600001)(2616005)(16576012)(6916009)(31696002)(8936002)(86362001)(4326008)(31686004)(8676002)(54906003)(38100700002)(316002)(956004)(36756003)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qJ+k3raq0Y5iMBdXnrRUcGXfLvxZdUnkO1hfysFULM5S+CtVvTKKNau7/szG?=
 =?us-ascii?Q?0tFbUvWtheUMWnYTfV/5qO6hkmHmuk0KPP/pO38jy03EZ/nMHEQbzmjqzBIT?=
 =?us-ascii?Q?PJtXFUWSWDd5VvNlvPt5aaTQxeYrv0Ig23jrCcZ/5DaCJpAQOwFSEJUqOPLn?=
 =?us-ascii?Q?mk6oXnh8VX25vF3zMxIWVbPJuFQss3vzVAupRV3YkGolLSTm8ROsO16jkTP8?=
 =?us-ascii?Q?tOQ7o7PD3gXR2teP4QeC12NIju46Pf3HzIwx3nglJf0MbSJIo2r6P7rNIihD?=
 =?us-ascii?Q?QJJBxNdQ9WKqgVA8Y59MuouB6gXA00LH7DgqdraROeEhZKF2Oe6WgJ3ddUE4?=
 =?us-ascii?Q?l0RyqBiH2D9atx9K8mf4TEBhZKEbsN8DdppEOImcM4X4FhMVc1BgB+RUOYlD?=
 =?us-ascii?Q?ZLTAA+a6TjcJRhRRQZS4UQbLEciBd02Lnh3nOIlfYorebIxvRic0tF2VIiQ2?=
 =?us-ascii?Q?ZxU+oQp8UPfDlAYJcgn78Zk/K8uI35fAHwaOFPTPMRpb2uewizj82XRO4B8C?=
 =?us-ascii?Q?Aqb1hjJyQ4NDQvev9rMWE/VPWIgI6GrMiJhBIUXEuSQyXe+mfHZNNAJZMMT8?=
 =?us-ascii?Q?ykPX++oc/3D1/6QyXcvDH06M3q2qjygB9pgtZ3Ou4hp+Qa5bCfrbiDuOqyaz?=
 =?us-ascii?Q?AjmywesrEC6osgrPDQf06Z+FqQyayGjLLsreWAluvRtyPo4/AQU8+X0fZdbR?=
 =?us-ascii?Q?qqmVeWhQQTC5uRFT+drDm31kwR0BH0ZEyHhaEw4yQKu28ZEIKuEl7RLkhTjW?=
 =?us-ascii?Q?gm03juqPG4rbhiGa5IgXr+FxU5irg1ad/mqz5PE2eF7aNgxRJAQUOyaVvdfQ?=
 =?us-ascii?Q?t3D3r+5DEgkYWkNWWvxwLTXhIHRYgIhSNY9hWVokvrXC/uXdtIsleiowrffL?=
 =?us-ascii?Q?fuvpo8XrNMFinuY1jPBT831vbslmsb5bBzfGA+PtdJr3Gt/X6Gy7rDaV7HHv?=
 =?us-ascii?Q?SkkavHKjeI5GfuINFWtcC78kCm6vrWM8Ec4WhgPiN8GFzRRmMWvq0Wg6qCR4?=
 =?us-ascii?Q?gdcZV3yokLgiS1dhUQSQBMcSA4mNACm6EpzWBjkpiHifgVc4GmiSfvzCZMx+?=
 =?us-ascii?Q?26b33Hkh/MtgOspiSGi3XBxg/vqVu2LQymiRmtxiwdeQCmKKeYXbNmZzNRO7?=
 =?us-ascii?Q?IgCbiW4Ff6OHYHgfvVaUT167DZYYLQh20ocahlGXXVUHGriXqbBo0GFUjHFU?=
 =?us-ascii?Q?EnaEcVf5c+AsCQPNLwvov4aIL6/seixsG1wSdGWyB2hFJiTdFcrwzHaUdrQE?=
 =?us-ascii?Q?qQ9C6r6uP6+7+vERPtBt4PhWXxpjxSDnqvlFGM7Lx3lkLxvN+EWCSCWe9ecz?=
 =?us-ascii?Q?QX1aUK6OI9SPzjLtDhr3XdYn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f34d83a-8f50-469c-c3ed-08d963a84b30
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 07:01:16.8491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QU7vmpEK/6qeaAqdmFIT7Tlf6n5gtA8HJMwRfvxu1IJxE8OHdymc/Pn2ijmBaourJ4iy0Npfjf+b0Ve9VEgYaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

On 19.08.2021 14:02, Rahul Singh wrote:
> Compilation error is observed when HAS_PCI is enabled for ARM
> architecture.
>=20
> Add definition for arch_iommu_use_permitted() and
> arch_pci_clean_pirqs().Implement dummy functions for pci_conf_read*() to
> fix compilation error.
>=20
> pci.c: In function =E2=80=98deassign_device=E2=80=99:
> pci.c:849:49: error: implicit declaration of function =E2=80=98pci_to_dev=
=E2=80=99;
> did you mean =E2=80=98dt_to_dev=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
>             pci_to_dev(pdev));
>=20
> pci.c:18: undefined reference to `pci_conf_read16=E2=80=99
> pci.c:880: undefined reference to `arch_pci_clean_pirqs=E2=80=99
> pci.c:1392: undefined reference to `arch_iommu_use_permitted'
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

A couple of nits, notwithstanding Julien's more general concern:

> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -0,0 +1,61 @@
> +/*
> + * Copyright (C) 2021 Arm Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/pci.h>
> +
> +static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
> +                                unsigned int len)
> +{
> +    return ~0U;
> +}
> +
> +static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
> +                             unsigned int len, uint32_t val)
> +{
> +}
> +
> +/*
> + * Wrappers for all PCI configuration access functions.
> + */
> +
> +#define PCI_OP_WRITE(size, type)                                        =
    \
> +    void pci_conf_write##size (pci_sbdf_t sbdf,unsigned int reg, type va=
l)  \

One of the two blanks preceding the backslash wants to move after the first
comma. And the blank preceding the opening parenthesis wants to be dropped.

> +{                                                                       =
    \
> +    pci_config_write(sbdf, reg, size / 8, val);                         =
    \
> +}
> +
> +#define PCI_OP_READ(size, type)                                         =
    \
> +    type pci_conf_read##size (pci_sbdf_t sbdf, unsigned int reg)        =
    \

The latter of the two applies here as well.

> +{                                                                       =
    \
> +    return pci_config_read(sbdf, reg, size / 8);                        =
    \
> +}
> +
> +PCI_OP_READ(8, u8)
> +PCI_OP_READ(16, u16)
> +PCI_OP_READ(32, u32)
> +PCI_OP_WRITE(8, u8)
> +PCI_OP_WRITE(16, u16)
> +PCI_OP_WRITE(32, u32)

We aim at eliminating u<N> uses in favor of uint<N>_t - please don't
introduce new uses.

Jan


