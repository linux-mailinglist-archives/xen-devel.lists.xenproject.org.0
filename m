Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7718773A7D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579899.908088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMoz-0000Dz-8f; Tue, 08 Aug 2023 13:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579899.908088; Tue, 08 Aug 2023 13:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMoz-0000Ba-5D; Tue, 08 Aug 2023 13:32:25 +0000
Received: by outflank-mailman (input) for mailman id 579899;
 Tue, 08 Aug 2023 13:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTMox-0000BU-Nx
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:32:23 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 008e9d4c-35f0-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:32:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9232.eurprd04.prod.outlook.com (2603:10a6:102:2ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 13:32:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 13:32:18 +0000
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
X-Inumbo-ID: 008e9d4c-35f0-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogQO7KvVI/FS5SIg4I1vNsElA8VD9SOHk1NN77XcDSasjaNp+M9DKAsoTRQ6944YrE+lPdGHo5ri7T+D55lmoITb2+lCeDiTlP7IDNBGZIx23Jc7XjGlvLw9l4OMXK67arIUpoeKV2CVlpk21CMXsq2rJCoCUsWg3eTEazJZlMkKSqt0zW4NHZXQY8ffabJklhCg14lsZEpgOGj6RAISS5ZbzBblOubt1rzM74m+nsX2AyovpNEmDS/HFdegw7NGtRdwl1zgtHndgwQYo0olWoyRP6qMuhNRLj5qpCsuGvEEoW7iHy7JBDoQHu2xapIydwkztUHbmnhpGpiLPwZ6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LS9EXPu1kaxGyZ2rFP39sKzgFC+GHstcRYigC+hlzEY=;
 b=CCeMbAtQWPBfveboVRndnpdg5Y4omnyAF7Gf35ywPeDUEQH0vbb1CQGxSSFwGjEv/bFoBd6s2c0nl82LBuytkCpVtEwfaQHNHVKTwimh5aYK7HwLMlLEwMdt+B0LLoC0WjV9B2CW9My4iAWTDuDEbUntJKD+T23aSMN3Uz/vs0q/9uw8ZP90TtZxaIsmGFP9YAUDh9KsWiV0H+MAmMxCP+QNBwqytYPcQfSUJTNb4FlHv1meu59vCgkBOSaaqPLsSdn1dODVT1YVDNqfqwfrtkIHVbQh7RHYKmpa5Mwe4ORS0Ehj5zuYdQ9Pff89Icjbt+qLUg7TvdVDm3JwqL7rPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LS9EXPu1kaxGyZ2rFP39sKzgFC+GHstcRYigC+hlzEY=;
 b=kxxCj/GjOGqjz5+65TmDcV5Zd0C15baa9+ZPqcCL0Dl0Y9pJ1bDNiNLCQxroVBTU1Uh6ioX5byyj2tatSfiLayztJlNwS/4s7VqXb9mTYNLHMFSgnN5uGPtTBDfw8noVHTbKpOYq1Eg+838WR8561RLP0rq0FRcZnRJogQWsadGGzXTN3e0O7qh+L8C8/v+A+muV9R3dEoKE6QVmjDNmXXu8oH5e6UVFTgRCatpLphm/smM7ckidd4AGg8RHSJ/egI1idZIggh4kgLIvGnf2ZQRtiNASfBR+LgsdWCuzzYjbqooQZVx5V0tMioPvizqVH1xHgpFLAaSNSn8B/M2AvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8907fe4-be0a-7045-38e8-7dde8970ecb5@suse.com>
Date: Tue, 8 Aug 2023 15:32:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/3] tools/xl: reject bootloader=pygrub in case pygrub
 is disabled
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20230808132219.6422-1-jgross@suse.com>
 <20230808132219.6422-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230808132219.6422-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: f2883185-b653-4f6b-8ab2-08db9813e339
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+Xk6lTm+9hIvNPkNYPJTEgWm+J6P92hkEpN1VYjzvOo7/+ggqL0pqfOMGSRvchNKHpzPgZ6BHtVlx7swkXZDzXz8AAMsfABtQmNTxgnX9ooi8+VzPYjfKjCC7YSruOifzk7O4vWxjodxmoRL6U1mR/TgB9hzvawr9ue3CibVVLRQpJQJhHb4jgmPwmj1BCjMMDsH4CXoUL4HGIgFMKOgVkB1DDB7llOqjSSUD0TFwzNJSHyI76qop2RvxPBrCz5Gpt4OCue+0waozRbEQ+5BViAg2qrnn578tyayKf7nyg1rW7SXgm8ReL/Ri1I++5fL3s8cpHm8FDlbhDViACIgsTxqOSPGpYbgrUCBjiPilBx1XEjOd7FzjcpzPhge5ojwbKAuvl/K6HGhLdGB8fuAekpi5waXAcxXsHhwCsNqfs1QAA6+itAgMphuThV7SmxsOmbW9RmrktyLF6/Bd80w76cE/5Nhq8YTm30lbrWwuy5AE7hmDoxdHLbi/hHxjLwuMDPK74bTg3yEIUyS4Byyiu4XI52w19foU3YvEwJa0By6cODbTDPDsllHIMQSggA8WtOl7SD9ZXBbwF635Lx6uO4V546WOzdqTlF72y6n58P1BQLKd+3eUK2MNEsslgpy0tFkiPrqCvI0GYo1DkJkIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(1800799003)(186006)(451199021)(26005)(2906002)(31686004)(5660300002)(6862004)(8676002)(8936002)(41300700001)(4744005)(2616005)(86362001)(6636002)(53546011)(6506007)(316002)(31696002)(66556008)(37006003)(54906003)(38100700002)(66476007)(6666004)(66946007)(478600001)(6486002)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzYrVWdMRWs5SkNTcjcraGRPWEdTd1E5cWJIY3krc0ZheWFmbE9pcVp4ZVRX?=
 =?utf-8?B?VUtmZ0lwbHJJbG5PL2liVmJzc2gybHpULzhnRUp1a2tHUXJyYXk3OHRpNTFu?=
 =?utf-8?B?UTZ6V20rVFdDYUlsbklFaDF6L0lDNGl5VHBOUi9Ub281TzVleXVkYTRmbXFm?=
 =?utf-8?B?MExkaE51RHN2b0JWVld1ZnBOejlucm5iRE5yMWYrUjZ0bWxzUFdNa0p4Q1Zo?=
 =?utf-8?B?NEJHc3JheWh6WThyL05CRi9aL3VUL2tYNEV4clNhdXIzQmkyVjhEKzB3OXpq?=
 =?utf-8?B?UTFiTUtjbGxqdG1jTDJEMXpXejFscllZNmg1UCtLNVkxcGxJSmgxTmNWK1B3?=
 =?utf-8?B?UzJoQk9aSitxQXFaOFcwd3VUTmdlOUJOb2FGaExDWWVmekJBaUJpMm9rWTRh?=
 =?utf-8?B?Sll6WUFDaUhyeUJYY3hJSDU1LytDQWlGN1ZtUnRFMUp6QkIyVVVEUG5pb0Qr?=
 =?utf-8?B?N2hTN2tzZHdhVmVWczBmQzRHNTJDbUFKQTk5ak5rYldpR3l1cmo2L1l5V0xM?=
 =?utf-8?B?dkJCZmJWZzZveG0yRzR3OFB2b1MrYkJhSjVNUFR2VEMwQ1RrMFViOW9HSlpW?=
 =?utf-8?B?UE40V1pPQkxoeVU1QkJJcGRTREpCUzArSEI4c2syczlVUU1Ea1FRd3JodzVU?=
 =?utf-8?B?TTJvWUZ3OTFLRUFXMFY5c29UTGpOZGJDVlVtRG4yNWNZcG1WVExraHZYUTV1?=
 =?utf-8?B?VnhFelRzVlJlZjYrUnJiZHRuRXVVaTQzUnJQaEdZU1B1djI1SUlJaExTRHQy?=
 =?utf-8?B?QXI5cml6VTl3T0xoQVZTYnh1V0xxQ2hHZVlyWjd2UzhLNjZmZHcybXhMbVNp?=
 =?utf-8?B?MnFYMzdzRDcvNG84SjhyTVdxbGs2QVE5eFZNdytPUVRNRk9aaEpJK1AxQ01j?=
 =?utf-8?B?SStBeGFTVlFmdTlrdjJmNWxMeXh0M0Y5K0lLc3ZwMkU4dlcyNVNMMXJLZkl6?=
 =?utf-8?B?Zjc3YWJ2cjBWSlVUZFJMVnViTngvRisrWC8ybGFQWjl6UGU3bzhZZmNlL2Fj?=
 =?utf-8?B?cUZwODY5OWJMTHZ1eFJ4bmw3c01vUVN0T2RibDhoMXF6UCtEcnVBSXgwZ1dC?=
 =?utf-8?B?S09nTHQvT3oydHNWTXFhSTJvc2VKZWtvY1dqdjhkTXZHMGJuQUwxSkxBb29p?=
 =?utf-8?B?ZFR2UlNEOXk5eHBHOWltYS9yYUNwYnlqWWtuenM3eGkzU2NhbjZpUUhtTzdp?=
 =?utf-8?B?UTU0MVE2ZENYMWNHbDJuTjJ6ODhiNzNtRm13UGYvTUNrVVRNWFNsRC9sVE51?=
 =?utf-8?B?R0JWN1ovQ3luU1kwZWJkZFRGYjhad0J6YVN5ZUpBVU9lYS93blJMZTlyRlho?=
 =?utf-8?B?WTNUOGdFUUI2dGY0TXlhRnJ1S054ZkxvSGJOMFNnT2M3dnZ5cHBVRWRmSG5r?=
 =?utf-8?B?SVFvQ2FZSFl0N3RGTHd2K2FVM2VxTUEvMSsxMGV0RVcwOXZPVG1kclJKUXpU?=
 =?utf-8?B?bHhmQlJ0NnRndXhneUx4MkNldUJWT3J2NGY4ZU9VbHBvaWFQTlhwbjlPNTMw?=
 =?utf-8?B?QXpFdXZIaEJsRVpOL2VWajgyb3FTR2ViNElhTlFrY3NlTVlCajM4ZUFML1I3?=
 =?utf-8?B?TDlOUDMzNDRSRDBJbkhSb2hXUTB6cnh6QnZGMUhDMlQ4K1ZLKzJoK2hreUdH?=
 =?utf-8?B?aEVjR0ZsZnFHWVhIcVJsTUpuK0liaDNGVkJXNkRZTVBYTnBJTnZka3Q3bW5X?=
 =?utf-8?B?MlUyaTR3YllwdHQvOGpwV25EVGc5Qmt0K0pmVHhBaUdvTExIbDFvYlFKNHZR?=
 =?utf-8?B?RTNONld2eW8xMGlJR3AvOUdRS0xrcHpUWkxMTGRHOVlSSW80YTl5KzUxZGM3?=
 =?utf-8?B?cnJ5WmNSV1VsQkxqTHJiNmRMUU4zWkdkeEpWWk5RSlNUejVUTjRNQkkxMGZZ?=
 =?utf-8?B?MS81Z0owQ3RYdHlBS2ZoYVNORE0vd0FqRUhMOEJ1MWRaRzhJUVE3T1JUWGZa?=
 =?utf-8?B?S1J1OGg0bGJuT0VuZUZRdUlUWGVuZzBibndMcU9lUUV4TitGUVlrd2VSc05S?=
 =?utf-8?B?eGxmRURNQXNyZUJrbVJsOTN5ZjU3eEtaVk83cHNqRkFZeVNNWk1wb1hBRy9t?=
 =?utf-8?B?NzFyU1dNVXdJS09oRjBUalNYYVdkeUFaQ21pNkthUWRXRGMwb0RBdkVFNHBN?=
 =?utf-8?Q?CKYq42ZUKzZFgyprf0MWvPHb6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2883185-b653-4f6b-8ab2-08db9813e339
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:32:18.7985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdvMXdo2fBcMG8C7ZQUHCvqOOFgINIlIvFK5XzYiDrIL9gLkaahW+CngBzyS5xthr73OnoNG2+8oE69Gdd6Q2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9232

On 08.08.2023 15:22, Juergen Gross wrote:
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1692,6 +1692,15 @@ void parse_config_data(const char *config_source,
>      xlu_cfg_get_defbool(config, "acpi", &b_info->acpi, 0);
>  
>      xlu_cfg_replace_string (config, "bootloader", &b_info->bootloader, 0);
> +#ifndef HAVE_PYGRUB
> +    if (b_info->bootloader &&
> +        (!strcmp(b_info->bootloader, "pygrub") ||
> +	 !strcmp(b_info->bootloader, "/usr/bin/pygrub"))) {

And no other path combinations can occur? strstr() is perhaps too lax,
but what about finding the last slash (if any) and comparing the rest
of the string (the full string when there's no slash) against "pygrub"?

> +        fprintf(stderr, "ERROR: this instance of Xen has been built without support of \"pygrub\".\n");

The other question (I'm sorry for my ignorance here) is whether pygrub
could come from anywhere else.

Jan

