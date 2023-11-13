Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76707EA16D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 17:44:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631831.985514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2a2P-0004BL-4Y; Mon, 13 Nov 2023 16:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631831.985514; Mon, 13 Nov 2023 16:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2a2P-00048J-1M; Mon, 13 Nov 2023 16:43:49 +0000
Received: by outflank-mailman (input) for mailman id 631831;
 Mon, 13 Nov 2023 16:43:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2a2N-00048D-5f
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 16:43:47 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfc46d85-8243-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 17:43:45 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7286.eurprd04.prod.outlook.com (2603:10a6:10:1aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 16:43:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 16:43:42 +0000
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
X-Inumbo-ID: cfc46d85-8243-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRPt49y72LtwGMQD4vuQ83Qo8bKExNbtwMF2s7QD2HaEFiMb1/A3zfyODRBUt+d9Fmv8nR6avBYmzUHdOBlRUiF3D/Gj5l3e7WYmLGhGV9WywWr+vG8rj532YrFhF71zgdifrVd1ggeZeCd+rUfXYDGibSPFtTZKWVXEIhu8ABVVXI6oJpumPx4AnRlbH31ZNPMwsR+IxAZv0Dqf6sLdOSKzqBk86LQGkz6JDDF9RBMQLTk07nnfuTgDiSelc3e9e8nW34DBfy8KGYMCHgnIEDYwKMYkBos7CmtyHBlCS71LqSg1VYN4qWFn0Ed0vlwtauw+9N0sDgjTWqSC5yAoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BbK6sxOg1Gc0ynyNYi1X5rCO6gGZ0+ym60kqIBXVis=;
 b=gISZhbpNH8kZ1CDCfwXw2qSbhdetXp6T21+jUTTZCei6BbVwGRl9Am4leqPeX3d89jEwVv/olrI+EXR2rcEC4s5bIYvpjF6Se3WnH0ypJqch2hdNnJLEtfOmbYsety/iFgmNMh/DW0woru2Yf67sWuay2XqezP15QNEOySD2zUSAi1Jl7c/n0LhH3WjMNYAmN3/M+gamvC88+vkBvfmAnA0NwufOj4hhXtfYV4pDHyMaNp+iCT23cAlbhqRRbaq1kSDJ3IbHNwTl014ZMn+/PYRK6zO7H7hDKVQnzt/a1UVnn9ea/ju0OZ5PwFx/me/HYKU0KVMbU0zoUZCRUponpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BbK6sxOg1Gc0ynyNYi1X5rCO6gGZ0+ym60kqIBXVis=;
 b=i3oO5soLeWCZpLV3Sll0iXcExgRzGvm8ATOZnvAx4Zyqt/WS09Bdt/GywfTr6UVY6RP6RdAeWSrSzOVA+fXl3I0kfbyOSGCtfsk216AtXn3kxaTpzYIscDwNVD7L6Fnnv4enuLpuUjdHk2pXP64UdgE2eWK6rAq+JVPC9ArSbGGvYmxz2ghlOtTOKmH2qG3Ozv0hD05DHSzkqiKMk44vLAi9koM6Cw/8+ts71aQRZOlLcnOmXOafmY+19W658FeV/bH/N8M6YTgVcVDrfu/B+OUHwtFSKUbJe3o41+sgys70UncbRVJqmBl0+MaFBxzKgvKtNlu9zzCc+Yki3uXlog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a51f216-7dda-ed6d-b85e-f332cdba22a3@suse.com>
Date: Mon, 13 Nov 2023 17:43:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 02/15] xen/asm-generic: introduce generic device.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <f006e36726ecfefe5dad3c13401365c4f7276ccd.1699633310.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f006e36726ecfefe5dad3c13401365c4f7276ccd.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6ca216-8e3d-4396-5eb2-08dbe467b1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m1wgCLVDU7OB02s6mw97QVIr7HkvtphmN/OYsvnpokzKEZreZkOI2WMEBbuw1PhEb7jIAtTr24H0/Z16DKeYnq/1czo/T8Td5RvUi1JJiJAa01MWRfpjcQ2lzN+snMHpYhNasBqfMI1jF0LT2/hsuRWlRCuolyVV3/Pv3E5hij/0FEZ24+d1Pgu6A9bS2eraE0Hdm1y1wHFzGpFU/EQHc0/vFYw1fM7wtp4h+FlZM3dgkJE8o4Z4ewNZDXnsNQ2N63SFTABg6Rz39dIkJZIFVRuByuDfh9hhT2hyxfcVIPeLdtj0iz13r/I1KtSCbXCKt1fO+d167LaGj862sBZ5I6T413VVN0wAWt1RD33/PbPoW+E/CgPxTD+iAsPQ+zWZhU4o3Ma7bJcRAoxSAQSv5SWKu8gZfxmQ1IRjTiBYrsQXXgCW0UquDh/dwszm2SQxMfIEpS5P47+vtFtCD7bB9QyJd9pxtcxb8bcGZQQrXQ8j6r1bbEXYlsNXMm9Pbwy/LPcgx6lxQwtKmmkQ9TaMDhSWmTEi3vzAP7fiLfWpu5KSipMZ/mKFLcn4jfgbbvrQUvpy0sFpaR5YyLaxT17+AirqPXk9h0jLVY1fCa8fKmC1sajV3FTaZerMwWKSF3gw9PXVs8XgCKdonOvrwI0CA9lW25AfXOyQyvFtBagAJwY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(31686004)(54906003)(66556008)(66476007)(66946007)(6916009)(38100700002)(316002)(36756003)(86362001)(31696002)(6512007)(26005)(6666004)(2616005)(6506007)(53546011)(4744005)(2906002)(478600001)(6486002)(5660300002)(41300700001)(4326008)(8936002)(8676002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW5HNTNVVjFEVGEyaVcrVDkwaTlGUGFtV2JPaUFLTTVSYmNhb0VsdXVVYnp2?=
 =?utf-8?B?bnJFb2k1Z095RElVN1hCeVcxcEJUNnkxWkoyNC9XblY2ZDAxQ1haMjhvNnBC?=
 =?utf-8?B?WEtvQ1hLclZUVVliNjRLeUFMMlVOZjI4T1VpZVRKVm5OWXNCdS9lZ2hkV1Zm?=
 =?utf-8?B?S3pjTUlZcUx1Vi91T2RaaW5YK05Ba1JZeDNWK1FNY25pN0lmN2FhSEl2U0FZ?=
 =?utf-8?B?TmJQeDlNOEx5U1lZOFpYNVVEdndsRjFBMmxKdDhzSEZHZE1LSldscWxXbWRZ?=
 =?utf-8?B?TWdlTFNQeGVYWjZrMW9QeVZwbUEzS0dHRnVYcVRhTXA5eWZnMFhmY1V0LzA0?=
 =?utf-8?B?TWx3WlhlMDZhQkpvemhKYm9WZUUrMWRkODN6NHRwTzdBOXc2VUw4M1JrMm5w?=
 =?utf-8?B?S2YwaEp2NFVrWjBTSlEzUi93YTFwMHFFb0lKTUdmWVN3cjh0cFdvN0hqMzZW?=
 =?utf-8?B?QXIyb3Mxd1QvNjFScGlTNndRdnVtQ3ZQV2h2b2Y2QjhleHd3WXhmaEdzM29i?=
 =?utf-8?B?di80YjFWdVdTMSs2STVrQTNVeWJYNmw0N3ZHSGZHR1J4RFlUc1pST2NuUXJp?=
 =?utf-8?B?Tk5wTHRKMCtyYlk4UXF0b3pwWnVsZzBjVENLOGJETWlKYkJYRGVqUmlXUG1U?=
 =?utf-8?B?dFBLUjNpVWZpRnlWQTdvYWNIbTYzSjlmM21yS0pIMzRISTY1aVRha09LMlZX?=
 =?utf-8?B?UzhPKy9HSzZRY3YxSGdqMnpiUW00OUR3TUFicU5XQ3RzTzdkazlLUFdZcEhs?=
 =?utf-8?B?dlBOMTF2dDFPOG40Vk1tNjJPVkFJY2dTOHF0cE9mWjI0V2U2V3JaeitYT1pF?=
 =?utf-8?B?dEcwakEvTjllcnV2YW5tcWdDRUZDTGZiM081TGhoYXgxQnBmT2hPUlY5dUNq?=
 =?utf-8?B?b05CN0VTRHptL0NUZXYyNzJObVR3RDdIdlpWNmhxQzk1L05KWmhIRTJQaHJL?=
 =?utf-8?B?T0lzZnJKSGhROEd5UkxUWlJQTFdKSktQVVNrMTludnNTdC85Zko1NjJoaFZO?=
 =?utf-8?B?VmV4Ym4xV2V5Vjh5OGpWMTRPb2JhVFo2ZUVaa2hZVjNiSkZrZ3hjUklhM1Nk?=
 =?utf-8?B?WTl5T2N6R3h1MkhhN2I3ZFo3TWFVV1piKzFva0pjUU0vcjFDU3prT1h5N293?=
 =?utf-8?B?MERYOUN6ZlJNVlcwMmw0aFVlb0JDRzJYT0I2bTNRd1h3QnFIUkRnNGhvYVF4?=
 =?utf-8?B?UklTRVdudytrbWR1RzNkZ0lSQ0I3Zyt0TU1sbkZ3TW1rbk9ORHZ0VGh3YWxz?=
 =?utf-8?B?NFM4TVAwN09NSGJGdmFhOFVNb0tjUlZQdGJYMENiUVZrUWN2d3RYWTh0OWhv?=
 =?utf-8?B?T1cyN3ZVVFpwWFFTc3pwMVFTdkRDM0RLdFowYkhkZkxSMzVIL2h1U01vV2xL?=
 =?utf-8?B?NjRQelJkeDhRZG92OTJid0ZaU1IwU1pPaG1Oa0ROVG9ONnN0L2FtOS9JelJi?=
 =?utf-8?B?U3IyZlZQV0hLM0M1aEZ5Unp6TjJraXhyL0xoalRpd2tvaGdmbnEwTG8zMm9L?=
 =?utf-8?B?NGtVdU5aNTVvYmtKcEI0TkNvZVM5SGpBaHcwYnhOL3gzNWFCTHF5bEltVkJF?=
 =?utf-8?B?Qmk3RmV4ZDhsUUZRb0xjL1BVU3AzbmVUcGJmSmFuYjJCQlBsK1BhamRwZWdH?=
 =?utf-8?B?MUlVcFM3V2ZNMDltUloyZWMzVDlpZ0crR1R3WktROTlQbUVLZmhGazRIZHRC?=
 =?utf-8?B?Zlc4VzVjOGlFeDFyZ3dUKzdzNG5PUjdpRmhzV1dmWXRyZzJSWFJrc2tsMFZF?=
 =?utf-8?B?S21MYytrOWpxM0dWaEphRDcwYXhUTzJ4SUVrL2NYQVNuS2N2bjdhWHJIV2dl?=
 =?utf-8?B?d1A2Q0E5L3VzTjY3WHJreENTTWhHN2FPMnZZVkVRbDRvU1QxaCtuK0Y4WTJ1?=
 =?utf-8?B?UXFOWkExMHFSVmxKeWtDM1BtNzlJakNsby84OXcwcHhZTi9tdDFVL0FnZ3BM?=
 =?utf-8?B?S2p4SHJtdHhkSVpueEh3d0RvMWVvemp1dzFPbzE1K0tYZENWbUNic0E4cVJP?=
 =?utf-8?B?RDNiOXlXUEY5Rm1GdmV5WHIvSXc5aDQzckhmaS9vd0lGeU0xekpLZnI5elJX?=
 =?utf-8?B?R3A0eTQrWDZmRVk0OXlKL09xc2FPUjF6UlJiKzlxTTA5Tkg1dENmT3NYWWNa?=
 =?utf-8?Q?DT45VUX6wFVAoHtbr2SFpwYzf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6ca216-8e3d-4396-5eb2-08dbe467b1e3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 16:43:42.1817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4iKeP34wnSlACi2Wo2mpnjFRLBw63ZxfAWGVCTsJotQgOE0bClSm8QcIzA733QyJi1AlK658Q6up6K95gP6Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7286

On 10.11.2023 17:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/device.h
> @@ -0,0 +1,140 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_DEVICE_H__
> +#define __ASM_GENERIC_DEVICE_H__
> +
> +enum device_type
> +{
> +    DEV_DT,
> +#ifdef HAS_PCI
> +    DEV_PCI,
> +#endif
> +};
> +
> +struct dev_archdata {
> +    void *iommu;    /* IOMMU private data */
> +};
> +
> +/* struct device - The basic device structure */
> +struct device
> +{
> +    enum device_type type;
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
> +#endif

There's just this instance where HAS_DEVICE_TREE is checked. Why not elsewhere?
Imo, if you really want this header in asm-generic/, then it wants to be truly
generic (i.e. not implying DT just like you're not implying PCI or ACPI).

Jan

