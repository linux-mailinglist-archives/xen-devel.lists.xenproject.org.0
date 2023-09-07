Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37EE797162
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 12:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597229.931437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBnp-0004rf-J5; Thu, 07 Sep 2023 09:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597229.931437; Thu, 07 Sep 2023 09:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBnp-0004pW-GN; Thu, 07 Sep 2023 09:59:57 +0000
Received: by outflank-mailman (input) for mailman id 597229;
 Thu, 07 Sep 2023 09:59:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeBno-0004pQ-17
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 09:59:56 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe16::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b5baeb4-4d65-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 11:59:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 09:59:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 09:59:51 +0000
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
X-Inumbo-ID: 4b5baeb4-4d65-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdNxLZaqspK+JqncFPfgTr3murO6B0zu73SdDZDLIQKUAqExQ/fXQLFrOA8+Fv/n5k4RdElWdh+BhdRgxeWwaUOQRUFqbVBZX1qwTynyJcgtIKPp0zJs8GLWhKO8eiVZzXTGvOYjtd7pKmIHVrBHQHsdLKX3aMhl++idCE9r65L0rouT5t5oFGumsxy9Zlet8R1WU5Levk7I9oz74pdTT1iIBPIdR+eyTT8II2qz3RpKJnff5MxAyEo8ZAhG9pKnANqlChm5obi6vMZHRJwfRbZnyBE2f1DYPGfb8KQxDU5U1dvmPPf5d086PJkAE6We9KRRA90QBa0FQixlZApqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEO4ezKNwE08bJUzrct65q1P97fukneA+cDWmlvtXBc=;
 b=ORVyfMxe5nsBRqnJk47UxXuzt56it2/+ck/CeC0SESQsrio8Z7z5Yp64JZEab6rNGYaWJbC9FE+ZKul8AjDXTX/P52EF5xvJWEzRGlKjJP2Sxe4UCjZFSrj4QtTQVqLlbRNe4X4J9MB0o89wpJwOdaQbNbQ74Ql4flLLijPTRlf4adhAnJ16izF45hF7chUEfCFTB/wi20D/hfsO57P4VR8fxCwEeuKHGJ7b/yr7egPbAiONC8xmtzd4HUq29cyUuSIxzzu3bU6X4GuU2Hkbm8EoZHPMCjWXwX0woIc9cAuTULD6lUGmEy01bz1jKi73ojyI19SNt5ePF7G+X9XJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEO4ezKNwE08bJUzrct65q1P97fukneA+cDWmlvtXBc=;
 b=JTJxoAy8ElDDE3hLxK1149aaUG27QvrCBdmF5LD3RMkPl2mbWroqhBp+cG0YHeh0+CozuIixSWbQHVmJZioFNNXUNiloEwHfDfkdwCltXMi9PYFqiYOi24GGBMO2UgkO6ak4VNXrGX9uGjkyAtEFdAqrhqqRiiW+CWD/LXhAm9RMxzgUsMuluUlpRvEMPF6o8EbcqosovxiBQqNZWdsKFqagBLjb621xqgx/PWn8eiGu72UGYqRHXeFpFOB7SExF1MXXdJ5kJ9aiLnyOCBToseCSZ8WP9UyLIoneHMFBeIj8EcoLtxT1EAM3U1F2aAq0sgZzEYYjzv8eHCdPuotbzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <687a1039-5f8d-bee2-50ce-1fa80ef31f19@suse.com>
Date: Thu, 7 Sep 2023 11:59:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 2/2] xen: move arm/include/asm/vm_event.h to
 asm-generic
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694078544.git.oleksii.kurochko@gmail.com>
 <47e12756edfefdb5ff1112ae6b78ae95baadbbef.1694078544.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <47e12756edfefdb5ff1112ae6b78ae95baadbbef.1694078544.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: a81d6aa3-307a-4de9-40be-08dbaf892db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	63TjGjDxAr+KnVuC1eOVHYLIE+IAzq0Na5rQNPhrMtFduYRZUSHQkX1+eLSs9ahXYyY9AkqVy4dj066d0RawEPbqodugYB9gFkvQD2kjoQASLDIAJo9wqpBfMQKPvrs9BQ03NaIxc9VL8+5hrYx/gZwx8hVIy2qRnSVt3GlBIxtNKUvDOJGSLReBeGMikB/rvM0WbfgTKm/VD4UNKpg8B5G2RE7LVIiddA93I0UC61vvRYJn5CWjaqzhl3oYvVYeKr2Z4aLeRGb+8bOvwVqAtQRRvpEj5moWxlvLgsu6gCnUXwopieS0OHkpD7rw0UAAtFiHiooskr3jMYWcZSuAoPzyCtRrC3yscKFyAFeSaKNMVNUIEnB5BvlIJJkD7oLJ40+9ZwFfAdj4UxaDIimQkkQ/GDTuUSbpAzO+Tylpz97mneczPJl3Nsf+c+j4CnmDux3iL/VLP9jCRI/0h5JCsf3xjpce9sopsscw+o25tBLhPTtSuHuLzl1dao1s/eMWxjGRSU/ky+hXp+c2cRmLo7HMKMen1SXbcEU3e1nOuGNGUr9ECCHkjefcJCc1ip/kE7xnZ9cRjRKmVLqGJ5AOT5xpJjM2KHI0dKcsLlhLH2tYo68s3+m7Bax3YEiyGQQu9H6phxUPzVG/hjp/S9Zr+W+hZA1oOake+updtkipOmw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(1800799009)(186009)(451199024)(4744005)(31686004)(36756003)(5660300002)(83380400001)(31696002)(41300700001)(7416002)(4326008)(86362001)(26005)(8676002)(53546011)(8936002)(6666004)(2616005)(6486002)(6506007)(6512007)(2906002)(478600001)(38100700002)(54906003)(6916009)(66946007)(66556008)(66476007)(316002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGRXUVJLY3FLWURGNXVJUDdmTzFkVXk2OFNBYkcwTFRtVXA1L1Y2UlNDeHN4?=
 =?utf-8?B?d3ZRQWN6NnNjZUVGTkZXYUczTFd0dCtHOXpPMXpQWkZSVThvVnZ3RVkxMzBU?=
 =?utf-8?B?akpveUkrMVVUUTZRb1Q2YURGTG1LZ2MrUUw0a1JDbHFBdXhNRlVKNEFCREpV?=
 =?utf-8?B?OWZtWTYwK0dJczVKNVpaNVhHQ1pGa0ZjS0t5MTI2NkVjRlJPdU9zTzFaMkMz?=
 =?utf-8?B?MS9Db3FtNllyWHQrZlBDdWtYR09UcHgxQ1QvWDQ3ME1JRXpjbXJLajVBTzY5?=
 =?utf-8?B?WjZFdmNSV3pQN3VSM2hXSmhsa2lVWnVLTkxJU1crZ1dwOXBsWkd1K0dKQld6?=
 =?utf-8?B?T2VBSEFrcWhoUUgrdjZ4RC8zNitNS2Evd1lUb2c5SnJFWHpjUXo1NHZmM24w?=
 =?utf-8?B?aTRWVnVoNE5YZjdYMTM0NFdoQ2R2VjBlc2xwVCsyQXJSb1dxVWlxbnZGQUxu?=
 =?utf-8?B?WUhSOXljcFU3YUNBWGhSNFZaN2JOaUFDVVlpUk85a2xKejhCakRYYmpqdWh6?=
 =?utf-8?B?bHRWMHJENjBIVEVXNkprdjY4V3BIbGowTGtiVXFKWlF3VXdkQ0pTK1hQUGwz?=
 =?utf-8?B?c1VHT1FDb1A5TDN1YndyTmxtQjNUUittUDQxTEMrajYxdlJhWHZJbFF6U0wr?=
 =?utf-8?B?VW94Z1lSTHluNmtsR0ZiQWIzODVvdytKaFBHNmFTTUJrcW5FbDFKcC9VUVV4?=
 =?utf-8?B?N1pTR2ZIcUNkYUYrUDZuMjNmUWlob25nc3YySVhVTXh3NWpodnFZbDZOZTV0?=
 =?utf-8?B?OS9lQmU2UlBNUEJiWUlGSytMOUJRN2hvb1g1Si8xMVVPeS80QW95NVlmYVBD?=
 =?utf-8?B?ajZkbUVVNzNhdlpNd1BMOGFvZ01vSXhPMnlZTnRPWXZsMW5aSWIvd1VrMXNJ?=
 =?utf-8?B?a0YwMWZRNFh1RHFwOTNtUlUvYlFhWFNyVlJaNmpMdnAvZFNVNjFxcy9PMG16?=
 =?utf-8?B?cGtIQ0lEanA5cVJSeHd0dDZ1V2NMalhTR2hSejZqVTFCU0JWNHd6MXVicm5J?=
 =?utf-8?B?dDV0b1ZTS0tjNHphRW1GZzdjOWlyWjZxQ1NQWVU3bStYQnQvemhQbUpwOGxQ?=
 =?utf-8?B?d3ZIdk5LTk9keEFQQUFOeGhFeVJyQllGanlBTmpFRW1IdXMydlVvN0Vxc1Z5?=
 =?utf-8?B?YkVrTnNLM2NNeUtQb3pBSnBWbEIybXZLeERDNTF1ekEzVlRDcm9OcFlmM3ZI?=
 =?utf-8?B?WExIRTBBU3RWSEFFSFcvQmRUZk9wQS9LSW92dnNTK29aZ0d3QXh3ODYvQWFy?=
 =?utf-8?B?NGRzS2ZlK1RrREoxa1Z5OThra2U2R0pwQmxSUFN4ODdqS25XRzFNRWVCenhn?=
 =?utf-8?B?bUZNQW9zWE0zU1l3YnFFOTJ1b044NUhJRDhmM0xUVHdlNXJVQXFUdzBNd3Jx?=
 =?utf-8?B?WDN3L0dUalZhbE9EV0VFNGlGRVFwR3h3WVBHYmMvbFpuVGE0SDFiS25VT1kr?=
 =?utf-8?B?SWJ0OFRuMGhTNlYwRGJ1NkVlcCtXV3VaSTlpendnOEs5SFpkVjlmVDhPN0pR?=
 =?utf-8?B?bzlsRUpteU92NU0ySDhkZTRLTEhwYmZaQVpEb0JEZkYzbGgzMEdIMFp5VDA3?=
 =?utf-8?B?SWhrTy9WajZaWjIwc1Zub2F0YjBrUEozaU4zV2dJMW9ycEV2cG1QMVFzbFdP?=
 =?utf-8?B?dlRhTnBIQmh3Y2NkOGpmVFdqekVDNStRS1NaMWIvZndjM3NOWUs2R0Z0THgv?=
 =?utf-8?B?Tk1vbjMyODRSd2VCVDcwelE2L1M3aFpERGJua1J4OExKQ0xDZ0FVUmpQTk1i?=
 =?utf-8?B?cEdYaHRTNm5LK0swMFhkQmdDVllnWE9NcVd3bmRqc3hQYm5iZWs0SU0xYzhE?=
 =?utf-8?B?ZWsrT1Q0cjM2Q0x4WWs3NFBjRVRYdEllcU4rbGxJVkJjQjZHa3czT0lCWmNR?=
 =?utf-8?B?anhHd0pYRFZNZEI2cnZsWmtmV0htdjJqRHdnOEhMUVovREtSbmlXemRBOUth?=
 =?utf-8?B?aXdPQWdpZWg2WUJ0ZWVmdnBDeGZleDhTRUdFSEwxeDBTcGtMUGpuVnB0a2xo?=
 =?utf-8?B?akQyS1ArOEpRZTRxb1pxbk9tWDJKcWhOMkpwaUZVZU9DNXhjWCtFSFBmOXF5?=
 =?utf-8?B?QkQwMUY0R0Erb2hVcDJNS0VIUFg1aWZEWmJqdkpWa2h5RHQyVnkwYWRSSWNS?=
 =?utf-8?Q?2WG7u/ufNNzSONsYTpPLkg/5A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81d6aa3-307a-4de9-40be-08dbaf892db2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 09:59:51.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdMi7g1PV1PnQ21G0VbpnIdPnEWv529QCa5iCE7Io5w8wS2rwzuuNfwwvZlKtX7Aj49MWvjGWO/Lf2TnC70uAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643

On 07.09.2023 11:32, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/vm_event.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier:  GPL-2.0-only */
> +/*
> + * vm_event.h: stubs for architecture specific vm_event handling routines
> + *
> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)

Tamas is the maintainer of these files (no matter where they live), so
please make sure to Cc him in order to get his ack.

> + */
> +
> +#ifndef __ASM_STUB_VM_EVENT_H__
> +#define __ASM_STUB_VM_EVENT_H__

Nit: s/STUB/GENERIC/ ?

Jan

