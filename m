Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F374C6452
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 09:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280217.478071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOb2s-00022I-Sh; Mon, 28 Feb 2022 08:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280217.478071; Mon, 28 Feb 2022 08:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOb2s-0001zt-Pi; Mon, 28 Feb 2022 08:06:14 +0000
Received: by outflank-mailman (input) for mailman id 280217;
 Mon, 28 Feb 2022 08:06:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOb2r-0001zn-5e
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 08:06:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49dffbd0-986d-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 09:06:10 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-R0ME7ReRMbCld5zOWB79Ww-1; Mon, 28 Feb 2022 09:06:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0401MB2583.eurprd04.prod.outlook.com (2603:10a6:4:37::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 08:06:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 08:06:06 +0000
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
X-Inumbo-ID: 49dffbd0-986d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646035569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1MVKJsZZ4FZphk4iI3F/skfgZAbFHqBSWA96qazOT2E=;
	b=P5K4O5nTjXyuH5oX9bOBD8rKnIhWgO7zAW2FBI/QCd6NIcJV8Wqk2FgDQ+fSogIj0PgvL9
	9CIr4lmyV2Wi5bwLfbh1B4xMvply52P/7VJXozoA4h23fSaJ/fhCgu5V4FuL2Fmk4bLHUx
	Al3xGXYWKmRGeo/2jx5FTguFYh8u7FI=
X-MC-Unique: R0ME7ReRMbCld5zOWB79Ww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ju29got0lGSbwq5gyTfeSCoN7MgDiqAzxFh84IW7LtXna9+w0fMIVuUMy8UFwQ467Xsr6D3A55lbzBLNhL1nuUOt4w2r9vR8Z/JOu/on3ObKv2G37Tkio6zuWqSxAT7+O5VPst74vkM5+MOiPC8ZWGvHa2LL5I2MTMQN8cRTbi6cQ2PB1TNZ44TfUps5/t1OLy9s8OdyIQhcoV4Cr23D6iCvL0kFc6ySvti9GtP3F2xiz78IgtHeCU3huUDXvYmTLXN9oXWyrXAvvSVMgqEQUyY+lbI0njq4RlKDXPKpQeBeViKOO1YKJCH2ghlKWZEOvgEYiWSGU+7TTSfOwbKB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MVKJsZZ4FZphk4iI3F/skfgZAbFHqBSWA96qazOT2E=;
 b=mr8gbTgXkpzcvy42GewkQR14rt7ECxf+fphM0hgU4Inu1VvEuga7LISUfYzkUCQRp7QXupVO0Qod1fVPU8qqkFVQKZnmQTMTW3fKRpopZNeCfp7WT1qozBUGEeAcZ1cRqVG+Xtv9iIBMwZWtvK+5SQswLG4jOPx2iRp1T56OfzxIm9jYDaSj9hJsyCDneQMNom2TBSl9i4rafPmFaH9szmY9eGtHblCRQzl5JsDVXiYj9q40wKfXC1aqVd2yMjfrWZOTjEPGIBsWaIKCxNGC1PRHwsnKxJpylA+J67M5rvAPO1DK/J2B8gMRvkfFMEn6n1EROH66apW9hn6862ADNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8938002d-6ed7-bb52-43b5-f9788da3a4d1@suse.com>
Date: Mon, 28 Feb 2022 09:06:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 0/3] xen/arm: add i.MX lpuart and i.MX8QM initial support
Content-Language: en-US
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>, sstabellini@kernel.org, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220228010711.11566-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8660e871-773c-4260-6ea1-08d9fa912bda
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2583:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB25834163D2E62C23DF0B923EB3019@DB6PR0401MB2583.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ug3UsEkPdXsC8qd0i8npT6kc6vynsX57wcR81xzttEmzvt/FQMwYt9cj/7Ibrd6answ84uxHBnBjXK/FwWcw1PjXuHF/g+hwUNmmLthf04jZx/MHcSWzc95fuAAJLvjApgj3tHqYnJTBVIqHFAaZnYQwnL/VSNtiPL1uuMXCF1ixVh3uVusB5rs0lBtoGc9fA9LPCIx8PSJvcsG3n+XPkRIClFonljw8YYgdORi1Ad1mrk81EaGabugYCpRiLwtWsGSkXON7LEeSwHCaKv8Rsf+gTjhxgB2iZLbmXYcTfhzmErcZXCNgYpysjw0+3r+yz3KwcV1hhLtto9KkGa+rtd0xQJsHSR4YgaK/COakS6lDLaJlnuW7SWQGBljRW7k0NKXhp084PWYVdLrdk+JcERVYSB8O5l+PrPYSQjJy/rUbn4BxTuJigvPKTboJWWO3s3+6S+mnzjFr7NlKi4ef8ZjADZkIuo+wrtVQhSjyQmEtiMUpnvceJj50iVDUTB5kQY5lzSUa77s1kfox75x+crOZ0X4PTcAArIgR30L4locfURRB5cGMsaawDGstF57b8Zx4wsb40gWFpHje8OILiw59e332lmDM87Roq+xt6qAOFTFfChnuvvvNbmbhr/to6yihv6FnfeL9YXEMSf6fVpqnO/jXIySM8M3jBxiNJv1vqLLtyaWFh0t/0iiY8sr+gRxuhUj2fCmHjN7Hq1jGuAflFGJrA2rYW7nJEqzT23k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(6916009)(4326008)(66476007)(66556008)(66946007)(316002)(508600001)(6486002)(86362001)(36756003)(31686004)(31696002)(38100700002)(53546011)(6506007)(6512007)(2616005)(26005)(186003)(5660300002)(8936002)(2906002)(7416002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGtFREZydHVXSkU3bmU5cTRpYTJWMHdWS2J5TkxlTmZDWmZsWmgyaVN2Z3JN?=
 =?utf-8?B?UDArNmwzOVRDRENJYWgvTG9GbmkvaHNTSTVJR0kwZ0FBYVJKVDJKSXBnZ0Q0?=
 =?utf-8?B?d3NVRzlGRk9JVkJ2RVIyZ2hGZkpFVkxvRXJMYWlrOXpFbUQ5OWQwUUNURjBi?=
 =?utf-8?B?NU9hUThnY1VVWkV4bkJ0Yk9wZml1V0phNk43cmJFUXFSS1Q0LzBCd0lDb2pv?=
 =?utf-8?B?SmNRR1BHVHVFTnBnUUVaYWxGaUxsSHF4Qm9ETWJqSnQ3WHhGdGY4MnZDZEhE?=
 =?utf-8?B?S3RsWUdpK0lJSERpWnFNdWtsSXllTUxkdVBLeGE4OExHeEs1WU1YTnE3KzVH?=
 =?utf-8?B?WTJocTZGRFIrQkFLZ09MSk5INkFVczhTSXBUUzE0dHI4ZTk0M2pJb3h5d2dJ?=
 =?utf-8?B?TjEyNkoyQ3Z3WXJPS3NZNWxQMXgrejlXMXgydDdXUXFPZTdtbTJyVGpCUkFr?=
 =?utf-8?B?N3JPeUpDaHpSSHlSSFF6b3BXNjNmbmRSODVHUDlNNkMvSGt1UjRrbDVnNGhp?=
 =?utf-8?B?V0txU1BKeGhuRjZwOWFQSG1ycjdrcy9GL2ZYVldWVk11QkUvb1EzTEZwbTE0?=
 =?utf-8?B?VnhKN2VCRnpmSDJKMlh4KzRZdzhoZ21xVEh0Y3NVVHJUV3JXc2hyejAvRUR3?=
 =?utf-8?B?MnQzUXRSbHUrdVozSkdwWXl1QUE0VVAyR1hnS0Y4WU9GenB0b0l0MmdoWWEz?=
 =?utf-8?B?NklDUVBRYy9TQTNiN3VselJiRXpZeEI2SFdjK1R0eWNOV2Y4a1o3OWUxNHdV?=
 =?utf-8?B?bEpNOHJqWFdIRHlzeEVpVFVvQlVjRVByRlQwMEFCa3ZYM0k2Z210cTRJMUVG?=
 =?utf-8?B?S1RkQnc1VUg0bXBwdHR2TklHSCtidXJqQTlRRUZSdm5wWGlYdVZBc3BYTUk1?=
 =?utf-8?B?K3hlalEvMzVTMTZtR1RqRWVZUlExWnFwMS90aWxqamtXTUdMYkZsTTNPclBW?=
 =?utf-8?B?Q3pBYmdlWEU1UTh2cEZDNUt1ckJzYStJdmR2SzkwZEZEczFZOWZnUWF3Yjc3?=
 =?utf-8?B?cGtlRUFlS29OOUs3WEtRMTBuVlEvMlBvdko4cnY5d2o3Vm45Q3lkRTd6N0da?=
 =?utf-8?B?b2c2MVovb2FFRWtoUlV6MnlQeVRNeko3NFVuY1Z3Z0xpOThWWS9SeXRaOU9D?=
 =?utf-8?B?R1ljRzVWb1lVb3E5ZDV4VGxsV09WQ1VqSXlQVllpdjh1OFJKQ0lOb3h5NVBO?=
 =?utf-8?B?VCsrTTZQU0JZcDlCZENSM09TK3FVN25IQzNrN1dJUFUwYjZzQkNVeVNzZ1l3?=
 =?utf-8?B?NDdxTDhhNDZkUjRJZDdINXMvUi9WMEdIOTlKZmF6bHFibXNqbXplMWZQYzlo?=
 =?utf-8?B?S21Jdm14VXdEUHhFOFBGNDJyWDd4MERnNk1WSHhyVTJaSjAwbVRaUGM4ckZZ?=
 =?utf-8?B?Y2tid0NySUhxYXhuOWdJUjRObFl0T0FIVERjRjFnUnh4VnhSR0QrUFJLVWNp?=
 =?utf-8?B?T25nWGVPMmFsYjg3ZkRjR1ZKNTVBL0xNSkJuY2p3ZTJrNXA1UC9DWlJGOGM4?=
 =?utf-8?B?NGVhampRM3N5MVl2ZEt0Zk40SjRLTThJOGJtM21PWERJTjdsTko3QkdzcGZW?=
 =?utf-8?B?dGhNVUxkUG9COXRhR29BVE5idGl4UURZaHhvSVFsanFWYjRSUWVwamo4Y005?=
 =?utf-8?B?aWtCcHMxNjVONUlMMStkdWxTUjZ0M3hHQkY0SFVyaGgrLzNGU2JmenFHRk9i?=
 =?utf-8?B?OXdDZGF0Q0ZUb1poOExHcW5pUkE5RjhseUozUmVrVG9tMzhTY3I0WnJLazBy?=
 =?utf-8?B?eHUrWFZGcFE1SjRWd1E0emJsN053eHVHZnF2N0pGZlI0aXlwKzh2TDJDK3dF?=
 =?utf-8?B?VFNqYi9QaVF6d2Q1QkpWaG1UMlJyYU1QdGY2bzZhN0ZpQWpreEU2emNqdTJq?=
 =?utf-8?B?YkQvaU1JWlBmR280WHJtY2R3YS9VKy9nVE9BVi9KdVBva0tvb1dlblZWbFp4?=
 =?utf-8?B?Y2ZWK0JoZDZVVEpaNHRvRllNYjVYZFZmak9hdTVOeVc0VEIybVZ0RnpBaG9Q?=
 =?utf-8?B?OUF0bzZDTUhYRlZDbHMwcTZkZUNjVHVOUjNWOXZKNkMwV01pTWpkKzFsTkUx?=
 =?utf-8?B?NytVQjlWbGEwai8zZkFhWEFqd3JCNmdRcEw3aXpTSjdYdXo3YTRYaVNaTGN6?=
 =?utf-8?B?ZitabnkyL00rZEpOOGxHNXNzaHlmditXUUh5d0tuWVU4ZWYzNzNuZ05pb041?=
 =?utf-8?Q?Vw2VItpKQg4VDL/zxABBDrU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8660e871-773c-4260-6ea1-08d9fa912bda
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 08:06:06.4291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2lT/psiO0NlSXbczeQ15I7qsVv3ICpUm9sfPc+/aFGAoOIdrjuyuxdouhWdjbOf8vxxZ4KkMTje/X25FoFgBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2583

On 28.02.2022 02:07, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX lpuart driver and i.MX8QM platform support.
>  - lpuart is the uart IP used in i.MX8QM/QXP/93.
>  - Very basic i.MX8QM platform support.
> 
> Peng Fan (3):
>   xen/arm: Add i.MX lpuart driver
>   xen/arm: Add i.MX lpuart early printk support
>   xen/arm: Add i.MX8QM platform support
> 
>  xen/arch/arm/Kconfig.debug              |  21 ++
>  xen/arch/arm/arm64/debug-imx-lpuart.inc |  48 ++++
>  xen/arch/arm/platforms/Makefile         |   1 +
>  xen/arch/arm/platforms/imx8qm.c         |  44 ++++
>  xen/drivers/char/Kconfig                |   8 +
>  xen/drivers/char/Makefile               |   1 +
>  xen/drivers/char/imx-lpuart.c           | 303 ++++++++++++++++++++++++
>  xen/include/xen/imx-lpuart.h            |  64 +++++
>  8 files changed, 490 insertions(+)
>  create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc
>  create mode 100644 xen/arch/arm/platforms/imx8qm.c
>  create mode 100644 xen/drivers/char/imx-lpuart.c
>  create mode 100644 xen/include/xen/imx-lpuart.h

I guess the latter two additions want to be accompanied by an update to
./MAINTAINERS' ARM section.

Jan


