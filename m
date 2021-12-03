Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCD24678F5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 14:59:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237680.412239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt964-0006hH-9A; Fri, 03 Dec 2021 13:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237680.412239; Fri, 03 Dec 2021 13:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt964-0006fU-5m; Fri, 03 Dec 2021 13:59:32 +0000
Received: by outflank-mailman (input) for mailman id 237680;
 Fri, 03 Dec 2021 13:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt962-0006fO-FR
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 13:59:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b516649-5441-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 14:59:29 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-L5m3LtYuM621NnMlGE6bOw-1; Fri, 03 Dec 2021 14:59:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.28; Fri, 3 Dec
 2021 13:59:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 13:59:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0010.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:59:25 +0000
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
X-Inumbo-ID: 3b516649-5441-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638539968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDg05RpEF1bPYLL6/rK0bqFh/BJbTp9zWAak54uQXhU=;
	b=YwiyCXAet5LmM29Vr4YCAy7srOtlq2A49rCLhu0P4OxMIdULHU52oZuC+DMt04doJdirj/
	+Jlwg3ycwR8zmgpqQV0as7/3vSNbGQauIrs0sOTTFTXrXZHlwsNR7r8E8T2q6Br1ZlKrk9
	Qv69VPhCthDmDPwU9zImgD5mFAvXGhU=
X-MC-Unique: L5m3LtYuM621NnMlGE6bOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWlsuNde5RZB9XYD3UDqCYl/PwM/yZGN6FFJsPYQPfSL7in9gbl79cLKQo+Uj1qyyoVRbagv8U4tch0ecLIu4Bw7DxbZZFirrhZP2NK5TLosQ4Km3SHcaVR2JLvhr2trFP1SvDDozQOw6YVpM/5vJ6JOvApy+bFi+2olhAsGdUu5Sw63FfqPNACZ8g5+yYvO0KNCtJ5kyeFUI2+uHSXKIRZN665u5du0rNTDjYkUeHQtV+C46EM85rgJr5ED4u5io0rTqH7A/QKWyDqirnQrpQQB6tzh34nOMOmxedPq0NFXqg2aNgzyRuSJlHG+llwYlafS1P6QrcOLs2a/Q94sUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDg05RpEF1bPYLL6/rK0bqFh/BJbTp9zWAak54uQXhU=;
 b=Ml69u60zydKZlquVKrcRMtWoe83wOMl9K2e3BVisyC8fvl8kwyQNc+NvWhrdS8eqZZQ1KfJxltipx+cDmjUrOZRUMBtFwh22Vk613fKCMd71py3oOKsS5HSsSoK4qmuHgfHF9PtffQhrHTLUYEcWJD4Xb8aWqT3knKKBZIs3X88qMWmSJFVd65N4EdaBBfZLAzeszNNKCNNCZXqUcfRcdBB2i1igBmwcbmZU40aM4TrGUyATXOzR/f5HiPujZFM+CxsHKSsBZ28N5q4owL0+w0eWu//jaNK9Q+VSiiPPOKWOM1tzwiTGTlN906AgmlIV4wipNA7rDoaoOBgX6w+yhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5da1903-20bc-4523-9d0a-6071f117c3ce@suse.com>
Date: Fri, 3 Dec 2021 14:59:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 59.5/65] x86: Introduce helpers/checks for endbr64
 instructions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126163340.26714-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126163340.26714-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0010.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3b6a7db-f24a-42ca-7140-08d9b6651e18
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59022C71097473FE8E547EE8B36A9@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bWxRATvo0ahK6unZeIolAQyVQ25CuAb8gUNvPwmgqWcv3EIJXdV99o7yO+c1o6DxbOagDXiVe0kMZ8ksNq7Z4Dw53WTXWjWJJiETj0tvRjqt2+ZAFRGoaBNFRCIibmR4OYLy0VZe4n+BUNhlWVf3Eg+jScDmnaGuV7RXh0tfmtKMlmX+6BxrSltHafLVNJPiU1kBjFM6GCqhLDGO1faiNzedZ6GsCelxTf0Zgh9tNFsdhkxw7n75/2ZOBPGnMCfefP0KCUC9Tj6joEtmjmJDxfDiNYR0yBOoXhCBdBFZkmV+438osN8np+csDmogNji4f0mK3jefVHKA+KNAbOXDqkoNLEVlqWR1fgzTwtE5p2t+r57EW7u2HysNHdiWU8dwCZNzU6tvzxw1P0XLK3aU5gb76pb6TQqhNDQrCSbOwKg8Rl/8nlNQbqBKzIE4zItAzw+e6RhYcJnHf6Jv8JW0lbUivakb2wvKGRiBpp4ByDVrxnH2P3p9G6gcVwn0ZTI3gJgnLICJNASlJNZmbPtRjlh9SG6+8DST5wMlAG/csu6Rol0U4FuPu2D4CAaR9Mbf9f7I4qdXvcvQ68O1MLFC19fRNLZ6sSxvceBh2ScICENzBmqDP92xlA6RrXlb8ebGB8F0ky9+N6r5TeBmUHUB+GGFCoZ26gtf3OAQnzBbTDkvMDJ4w+RMYEcY6FU/WToVEnobLmtSIryE0kwkEtmu9YSe+hFkdC248TCwyWqz1yhR+IJTt2A32n4mL9Id2up1Q5u+6GFPOBKFQ/08tPYTr4nRfjmYqIkAcWNeznX+mmMe/9wpypP4YW12t4hzXFCEj+nPB92eqZvjXva1lLQMLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(36756003)(66556008)(316002)(31696002)(31686004)(54906003)(16576012)(2906002)(86362001)(6486002)(26005)(53546011)(38100700002)(186003)(4326008)(6916009)(8936002)(8676002)(66476007)(5660300002)(956004)(2616005)(66946007)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amx5Z252T3dLQ1U4eG9kUVlwTFUxNnF5Wk5vcXZLZEtRUkRadXorTWxaaC9T?=
 =?utf-8?B?UmFOSGpxUGNYV2JyUHRvSkR2UCtQSGVOZG84VFlseitZZFcrV05EZUk1UHRo?=
 =?utf-8?B?b2p1eExOaHRUWGtuamFNRUpWSW16QXpMZm1za1hIOEZLVUxnZ1VVU0RvOEc1?=
 =?utf-8?B?SmVkYzVzVDRBNFh4NWtRMGFubWhjMkQ3R25ZT0I0ZmlPdVc1Qm50dDI2b1ZV?=
 =?utf-8?B?ZGx1OWdZR1lCR0FDbFgwbUhKZ3dOM1d0QVYyeTRNNG96Wk1JMDd5dUZCZUFN?=
 =?utf-8?B?Sm5KM0QzOTd3cUxxRXAxQWhQeEFQM3Y4c3dZUzZ3VWUzWExnVmVnZjQ5NXZW?=
 =?utf-8?B?UUU5eU01dllzaitKZ1dzOW13aXFjSE1pWkN5VHNQYlFyZFo4Y3dNY1BGcmQr?=
 =?utf-8?B?OXQ5a21IemZSajIvNGFVL3BsektuZTlIUTA2MnVNWWNiOXgwUTBJTVBpUXdJ?=
 =?utf-8?B?OXZJV0VMc0h0aVd3dWhjQTdZZ1NNbW1mTTAyci9GOVJBU1dGc2k4bmpLeTlx?=
 =?utf-8?B?N1BhUDBuNkRFQjUyeDRVQjhDWlFBalp1NzA1amgwc3dIZzYyanZUVDdEMGY3?=
 =?utf-8?B?WFNDL3ZVSUV2bWJkb2VzZjcrcXlROWl1NEVYSnNobFd4MmJrMEhadWhBTDV0?=
 =?utf-8?B?TUhLblp5WVNKM1djeUtwVGRvT0tpRFd0TEZXd0Q0NlhHYTJrOUx2VyswU05p?=
 =?utf-8?B?eWlUYXV4K1RHQnZLTHFkK0syeWNXZi9OaE5MTjdFenZFS2FyZ2UxQUhXMmxJ?=
 =?utf-8?B?c3ZCUjhUc2RWeDkyR2tLTi9Sa2RDVGJnM01CT3J2aFhnU3JmeGplRDZQNU1j?=
 =?utf-8?B?cGhMQmlyR1gzZkN3MkRybVl5Yi92MnplT3lINVpPbGgzZ00zaWVrdkUvZ3NU?=
 =?utf-8?B?RXpUOGdRNUJTWEVuVkhiQ1dqZ3JNNHpRRjd4ZG9UenNwdzBqeXZJaXFlNFJ6?=
 =?utf-8?B?ZGpzVnFublVhTUMwU3YxVjRTSU1EV1duaFlUY2kveGpsOGZFQktxYmRIUFp1?=
 =?utf-8?B?dnNYRFpaT3FPTnExZXlVYzZCK3RPaDdGbG1EV1NROGkzeUtSTjZ5RmNuaHdO?=
 =?utf-8?B?MGxpaEUxY2l2SWhUaWtKa3ozd1E5Wit1KzRyMmpwOHFqcDNVeGttVnpBQWpY?=
 =?utf-8?B?Qkw0bWhsTGlqWkdjVzg5VThVdmhJRi9rbm1pQkxGNjg2VklWdnpSOW02czkx?=
 =?utf-8?B?S3dYRzZWUCsvSksyeHFZTUNnWnZITVdCSEx3dmJLZFBoeXV6U0lKV0RmTkdD?=
 =?utf-8?B?Mi82ZU1JSmlmNk1CNDZxS0wvZUk2blNJMVdoaVRsVm9ZbHp2ZG1QYmRlVXNI?=
 =?utf-8?B?ZlJPUUhiR25QRWxSSnp2cFMyODlwYmJHRVpJVFhSSndTSmU0QUlqRjE3NnB4?=
 =?utf-8?B?ZXozR0NlTXFDbFRHYS9CbVN1L2x5eFpkY2RodC9xNWlNUzRPM1EyS3lkNk02?=
 =?utf-8?B?K1lvNjUxQVZVSWxSSHhMZHlSSmRMaTBQNE1RYU5pMjM0NnFXVlZ5Z1dRUytR?=
 =?utf-8?B?dWFDeU5DanBjZWt5Ly8xVjQrS013ejIyNHZvdCtjT1JRekV4SUdJM0o5OEl5?=
 =?utf-8?B?ZHowbjFsNUVLaExFNmUxVVk0MDhxTFRUMmlEL0dhaVdHMm5acGhnNXhxREwx?=
 =?utf-8?B?TkYwQk9sYytLL1cycjZrMXdXRXo3Y3RCeEJncWJlTWxkMUxzRlE4SlA1bDk5?=
 =?utf-8?B?R0lsY3ZWbXFuZmxrM3RQZnJRQmVhTHFuOE1ySFdMK3RwYWtvTGs3ck5lL3dD?=
 =?utf-8?B?YTAxeWgvakpob2hjbzJaM2I0dGVEcHB4MDZhTGx1SUhqNWhMQzkwTXVYTlZ1?=
 =?utf-8?B?ZTc1cUNyanhlMngvMkJSV3gvK0NyZmk0ZzlFN0c1ZzV3ZmtUMkh1SXNpYXpY?=
 =?utf-8?B?VHJaSFNXVENaZnVGZ09HaitZZE10RWk5Z2NCY1lzZlJuNHpoVWV5NVl6OG9T?=
 =?utf-8?B?c1pvN1lrZTU0ZUswckpuYzBicUhlSzJ6T3o0bE9yOXhSdDEzd3A5bStsUk5D?=
 =?utf-8?B?ZnlyK3dMNmZQV2tiWEQwdjBpUTR1aFlIdDdlM1ROSVp4NDZ5Q1M3TzVJbk1Y?=
 =?utf-8?B?VVFtajdYTEZPNUlIR0pFK3Jxd2N0U2E2eHZGakdZd3RKb2Q4QnE0bWo3dHUz?=
 =?utf-8?B?ckx3V01Gck80azhtWkxOTnVqb2ZaMUdVKzkrdXEvSEFZZCt1dGdPMVpGTVcw?=
 =?utf-8?Q?7Kion8jSBaSW7nBn+VYI4GE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b6a7db-f24a-42ca-7140-08d9b6651e18
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:59:26.4015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4im0N6s+b954ZNmhrBT72+yiPx0rO6eINQ9LNuG95zFSDb+9VOxHuswj/ViFzCiXr04jJOlhnxkXwPH3vzL1Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 26.11.2021 17:33, Andrew Cooper wrote:
> ... to prevent the optimiser creating unsafe code.  See the code comment for
> full details.
> 
> Also add a build time check for endbr64 embedded in imm32 operands, which
> catches the obvious cases where the optimiser has done an unsafe thing.

But this is hardly enough to be safe. I'd even go as far as saying we can
do without it if we don't check more thoroughly.

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -190,6 +190,10 @@ $(TARGET)-syms: prelink.o xen.lds
>  	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).1.o
>  	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
>  	    $(@D)/.$(@F).1.o -o $@
> +ifeq ($(CONFIG_XEN_IBT),y)
> +	$(OBJDUMP) -d $@ | grep 0xfa1e0ff3 >/dev/null && \
> +		{ echo "Found embedded endbr64 instructions" >&2; false; } || :

I guess I'm confused: The "false;" suggests to me you want to make the
build fail in such a case. The "|| :" otoh suggests you want to silence
errors (and not just the one from grep when not finding the pattern
aiui).

Also isn't passing -q to grep standard enough (and shorter) to use in
place of redirecting its output to /dev/null?

> --- /dev/null
> +++ b/xen/include/asm-x86/endbr.h
> @@ -0,0 +1,55 @@
> +/******************************************************************************
> + * include/asm-x86/endbr.h
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> + *
> + * Copyright (c) 2021 Citrix Systems Ltd.
> + */
> +#ifndef XEN_ASM_ENDBR_H
> +#define XEN_ASM_ENDBR_H
> +
> +#include <xen/compiler.h>
> +
> +/*
> + * In some cases we need to inspect/insert endbr64 instructions.
> + *
> + * The naive way, mem{cmp,cpy}(ptr, "\xf3\x0f\x1e\xfa", 4), optimises unsafely
> + * by placing 0xfa1e0ff3 in an imm32 operand, which marks a legal indirect
> + * branch target as far as the CPU is concerned.
> + *
> + * gen_endbr64() is written deliberately to avoid the problematic operand, and
> + * marked __const__ as it is safe for the optimiser to hoist/merge/etc.
> + */
> +static inline uint32_t __attribute_const__ gen_endbr64(void)
> +{
> +    uint32_t res;
> +
> +    asm ( "mov $~0xfa1e0ff3, %[res]\n\t"
> +          "not %[res]\n\t"
> +          : [res] "=r" (res) );

Strictly speaking "=&r".

Jan


