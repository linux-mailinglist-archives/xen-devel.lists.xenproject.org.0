Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC7263AC0F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 16:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448978.705567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozfur-0006hU-Di; Mon, 28 Nov 2022 15:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448978.705567; Mon, 28 Nov 2022 15:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozfur-0006f3-Ab; Mon, 28 Nov 2022 15:19:29 +0000
Received: by outflank-mailman (input) for mailman id 448978;
 Mon, 28 Nov 2022 15:19:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emon=34=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ozfup-0006ex-OM
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:19:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ad82e59-6f30-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 16:19:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 28 Nov
 2022 15:19:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 15:19:23 +0000
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
X-Inumbo-ID: 0ad82e59-6f30-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDqbld8BRHVog89MIek3yC27EM2NHX5FteJWrLcwzxGk5cxnZ2QCmNJnnpXQTVztZoV148oFHApItAOklhNqomnhZp7KvctVWhXMQTd8RaBQZmCse6lqQ2SHCWp+N1ZLppRVikjJSuryvkJg5hq9eQRqt0hFEu2FNDdwkIPs/Mo4/HRSRUPbIt+dKWgyePPi9w+ZHGGJFq4M96GMsx/F9oMKlv4AaJWJ/crYD0s2/OrX1v5iUWo/DRA5CZTXhhYKaOR27HxiLuRTXWgPpBNZeCC84C3qgAUR/x0RgQE/y9sa5W3YOsgVvDO0LL0NW+Arz/kFLn+flaC3MUJiVtq0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyhwHJWkwwebNwKOaPY6gXrxD5spEWmGxy/VhVWFRIM=;
 b=XTM6D4DAuke0wBQ/90EeZLxK8IhzYUNZvUMYClm/K57zMeuSLPY60aoea0H8FMPwIScdEEEl46u10PcbHXcdgf4khkVKq8E//vmZCqoXK68sDXB0xosmv5AvTxbmaRnTLCATozFro61xBysHcE5NAFmZ3eyvcETVqdEnOitk42D3Iy/Sa44oLSud18VOIc4dNKKmuneGFc807LJRUDOOmoMN+4q0c/jM0h0+OQiW0XNJkuYkcOBxPo6MmJhhYMWw5rJHzq07SBoc3NEgT0vV8jLSuioM7GRkzP1ekgA4eZZdWPdP3OmlqY6DdATHClsZV82eSobH+fFyhQsg+9xqgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyhwHJWkwwebNwKOaPY6gXrxD5spEWmGxy/VhVWFRIM=;
 b=DVeR83RMGfsVPQXex/UljIci3MADTxEoWUeRLnVIdTxsgR+iyKKcXI/88X9ljoOxEiQyVdJ+u15JSWs8j+s95UmlhEKeCMpU/tGTtWaCZ2blTbSvXpqPLuv8+ExfDsFBDytJbNLsMmi/gQ/91kGBt5DFA0CzoEePMsC/HjdDcPwsP9XenE/NJ9fLtcAdfd6ukhGUOMXnIV7/l3+o0Sc7lCADIG0Z40bh1umjToJeFO/4JHyuWqD7K5Jutlspt6O6KABHUF2PgE5rIuWkKNDCVlnuXNN76AZKYiiWeMb6s8y0UPA0CUUj88Gb2mn4q+0zaRcujaMzMtAiXLehUvXhZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a0f27e6-1b0e-d5cb-7f3a-337b9664eb75@suse.com>
Date: Mon, 28 Nov 2022 16:19:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/4] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221128141006.8719-1-luca.fancellu@arm.com>
 <20221128141006.8719-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221128141006.8719-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: eeca08a7-9587-4bb5-61f2-08dad153edf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EA6ItVLSgw+hNJ74iYe3EVPnWOdXkjeDMi3Nko9epwEnH8BU9s8j/AqCPK9gvBKT67O21E7+Id/Qy1uNEDJv1XFabCZ7NYyK7NowXN9k/iiVnIkyp3QFfu+yvwMySVmiNM1kzIYyaLehYKoCtUSrgZ9/IFuEW5YVu/BVJgRoIKmmREq12sGm/hxb1beLpq1UMjpWhf+Xi4lbDLTCx/e3SU1fSjagqFnYe9AlEaU4HAMI3RrO2vfoXy6eVr6VnsGN49csVVI1z/kOR2UY2QAwmwo/PTzk+TttEdmSS1ZtcdLx2do3/GJy9qjaYz41KlOSND1Q/nu8KCxYjBvS+dpJpJjtQPi4TZ5PXW7FXtBBxF66Ztcu3UnzfzVl9XKroCJgcXm9xFuWZbKk7JIwVG9L0ScL6vT/5wFMWMTRDU8UkxJysc7NFs/FVEaHeDr7fUHzV1jzE7QgW9OHzCVjk+hXKhnVDhwX/0wUZbLJ+nJtzsdhAmji1XePLdTpgB5cegkOiEQktfUWwxx59/Tzt+h4QnfxBdpApVwHYkpF+HkleJ5AAYZMD5OvC9Qicw9BZb6ZW1xoC7IziRn9urwPMhfzZE03ZwIUkNbpsm0GFkkUSXS7FZJGyiAXqqskIeumFLFZduUaz8VwTPbIuCjew7ZK5QDEtVDJ00gij3C1bTfUjElGcHP/OU2YjQ0wTyslPFL0AhRGKWh/I9OunRpLtycsSe4G9xWwQUr/wV5b2LEVDVA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199015)(316002)(478600001)(66946007)(36756003)(2906002)(6916009)(54906003)(83380400001)(38100700002)(26005)(6506007)(53546011)(6512007)(86362001)(31696002)(186003)(2616005)(6486002)(5660300002)(31686004)(8676002)(41300700001)(8936002)(66556008)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEFCRmppclhjTjFlelIxMVpiNzd4dHhVU0pWZWtGM1lHdnNUNnd5TmtPMFUv?=
 =?utf-8?B?VDJxaDNQSTdGNHBpMVU0eFhJVDg2UGpvcU5KM0JMWmtmbFBQdDZwclpzaUFM?=
 =?utf-8?B?ZEQ4dWIzNmxvQ3JrRGt6aGdpMnVrV29ucVNEYmRrUkllckxvaUg4WVFDWFpi?=
 =?utf-8?B?Z21XU0gzRGhKS01lRjZsa0tlV1VBN3hhZlh6Y1hQSkFvTFp5R1dGSnNOdk8v?=
 =?utf-8?B?VTg5MlIvU3Y5Y0xrQkhRSkxoQVN0d1pNcmFJd3p6b3czbHV0SkNBSUIweXpx?=
 =?utf-8?B?UkIrb0pka1VqdXlJZzJpWFR2UWo4eElQLzJBekpyWUxGT25vTDJiclduTjIz?=
 =?utf-8?B?MEJWTk12QVlQaHl1RlZGNE00dVdFa2xtMmxyU3ltRVI5SEdIZ0ZPbkM0cWZO?=
 =?utf-8?B?ZklrSXBmT2k3WnVhUnFJbWxlR3lkRmhKdStmZWNxZHFubE90Nk9sTFZaUlhC?=
 =?utf-8?B?MmhyQk1OdXZINUp6dVdOMER3MTB0VVJvbit2MnRhcVFyYTdvRnU4L0cyT2th?=
 =?utf-8?B?Y20zWlVUeFdHMkFCUEJRYUMwbFE0RVh0bFBubHZSbnB2SWJBK2FyaWQ2ZHB5?=
 =?utf-8?B?VW1IalIwQWdaemVCaU16SGZvZFk3TzhDenE4RytSb3F2VWFQVGtjcmF5blh0?=
 =?utf-8?B?MnptVk5QaXc2V1VkbnN6cVRmOUZlZTNSWXQ2NGJWS3ZlQzBRTEt5NC9vUlBH?=
 =?utf-8?B?MjgwdGQrUk1YK2FQZmdiYk1SY29MN24yMXhPREM0QVpBMEt1dWVvRXVoWGxj?=
 =?utf-8?B?eGFTT0J6czQxd3o3Z1d6N0ZPODVlekx1UW4wOWdNWXNqVklpK0VEeDZRR29F?=
 =?utf-8?B?S2JMM1VKY1BETEdoM3BuQnVEZnN1RU9ZNkhZUFJkK1ZoWk9rL0kxV2wzN3lN?=
 =?utf-8?B?UldiR1RhcUllS0szR0ZyRzBvWmxnNnp2R1I0cGRIeFJ0VTFOeVl2THpJWVpW?=
 =?utf-8?B?d0FFVjVxc0hNV3JvZ0Nsalp2UHhKVndGSy94dThpQXFkc1dkZmJqS1ZFbFFU?=
 =?utf-8?B?R0ZzU0doL2Q2ZnFqek9Kb0U0Y3JDMlBacE9ZOU5JUEVLT1dVS243RU96TWFZ?=
 =?utf-8?B?MlMwaW9FWUhjemhHQ1JzUnVqOWZqeDdrYktDQkZva2VoT1VVcEd2WGNBYTFJ?=
 =?utf-8?B?NkNhN0FNMFVwOFcrcFpUN2FtMFNENUZ3ci9VdnhadWp0aWhDVjU2SzZRSnlF?=
 =?utf-8?B?cDUrTG5qZ3c1SE9xL0UvOFpIWUZmZUVwNEppM2wwRDBJbm9iRUlMb3BxLzNr?=
 =?utf-8?B?Y1ZiK0NZMU0wV3M5NEVIZnQ5aHdZZDJEd1Q4VTdJY0tpUHgzV25MLzNacDZo?=
 =?utf-8?B?dEV6MEpGYTkySkhMbUZIZWJtT0ZtbEhVTnM2VC8ySlhST3BFYmEva3FVZXNY?=
 =?utf-8?B?Y0pDYWpJQ1kveVBML3FjeEFnUUQrdloreEROa2pONWNSUlgyYUtOR0tDWEZv?=
 =?utf-8?B?d3RHbVdzQmE0cnBkWnlpa1cyci9yYUFlc0pEQUtnUXQ5eVFKTXI0UUNZOXMy?=
 =?utf-8?B?RUNnUERLQ1VPY0x4U1lqSWVnZFIwTFFrSCsyZHA3b0NFbkVHMDJERVUzNUdy?=
 =?utf-8?B?VzY0a0o0ZGZZbDBsMk1kYkRVakR3bnMxWHl3QUx0OEVZWFdmemtlOTEvSmk5?=
 =?utf-8?B?YW9taWgwbURTRittSlNka2l3THhyVUR1Y0dDRHdRQkVhLzdXUllVamJVWThG?=
 =?utf-8?B?MXdjd2ZyQm1pTFZYM2NmdnBkd2hKRDZJbnhBU2ZtOGR4VE9xSU1wZ3VBNmxX?=
 =?utf-8?B?WGV1Z1o5WDVYaVEzbDZtRkpFbk1lZ2wvQmlMUjhmWFo3cmM5QjlIZUN4aVpS?=
 =?utf-8?B?NnlvYndEdFJ2Qkt0Ump3KzhwZmpnRWZMbE1CVVN1Y25VWGU2NERuTnVScmNM?=
 =?utf-8?B?MFhtMERxc2E1dUF1SFF5UUlBNjRhT1VTYzJqeGpPT0QrR2UvMk1IZGN0dUQ0?=
 =?utf-8?B?cnJ3Ky94TFMwOElvOVQvWGhFVVJVOVZVSmoxRDhYTFNCbTRjR201ZDNBaGRn?=
 =?utf-8?B?MmVZSW56SS9DZXNqNURUdHlBOWh0T2NBQ0txMFVSVWRKZWRhbUc4WlZPT1RL?=
 =?utf-8?B?VysvL3lkOHJEMnpDZmFGMHFqZnFVZjZCSGRnZDd6VFM0S3pheGJnZXRQcVJL?=
 =?utf-8?Q?6PFphDcqv6Hsk4Izogibggm/W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeca08a7-9587-4bb5-61f2-08dad153edf0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:19:23.1884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlO83mPFR0yt92UkzRIsJNzqdy1H8WE1jlTOQUoMZ/l3ppjHrN9x6aV0ILdf/x1RtkG3A9qyuT9StXt03zmjbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8147

On 28.11.2022 15:10, Luca Fancellu wrote:
> Change cppcheck invocation method by using the xen-analysis.py
> script using the arguments --run-cppcheck.
> 
> Now cppcheck analysis will build Xen while the analysis is performed
> on the source files, it will produce a text report and an additional
> html output when the script is called with --cppcheck-html.
> 
> With this patch cppcheck will benefit of platform configuration files
> that will help it to understand the target of the compilation and
> improve the analysis.
> 
> To do so:
>  - remove cppcheck rules from Makefile and move them to the script.
>  - Update xen-analysis.py with the code to integrate cppcheck.
>  - merge the script merge_cppcheck_reports.py into the xen-analysis
>    script package and rework the code to integrate it.
>  - add platform configuration files for cppcheck..
>  - add cppcheck-cc.sh script that is a wrapper for cppcheck and it's
>    used as Xen compiler, it will intercept all flags given from the
>    make build system and it will execute cppcheck on the compiled
>    file together with the file compilation.
>  - guarded hypercall-defs.c with CPPCHECK define because cppcheck
>    gets confused as the file does not contain c code.
>  - add false-positive-cppcheck.json file
>  - update documentation.
>  - update .gitignore
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Just two and a half questions, not a full review:

> ---
>  .gitignore                                    |   8 +-
>  docs/misra/cppcheck.txt                       |  27 +-
>  docs/misra/documenting-violations.rst         |   7 +-
>  docs/misra/false-positive-cppcheck.json       |  12 +
>  docs/misra/xen-static-analysis.rst            |  42 ++-
>  xen/Makefile                                  | 116 +-------
>  xen/include/hypercall-defs.c                  |   9 +
>  xen/scripts/xen-analysis.py                   |  18 +-
>  xen/scripts/xen_analysis/cppcheck_analysis.py | 272 ++++++++++++++++++
>  .../xen_analysis/cppcheck_report_utils.py     | 130 +++++++++
>  xen/scripts/xen_analysis/generic_analysis.py  |  21 +-
>  xen/scripts/xen_analysis/settings.py          |  77 ++++-
>  xen/scripts/xen_analysis/utils.py             |  21 +-
>  xen/tools/cppcheck-cc.sh                      | 223 ++++++++++++++
>  xen/tools/cppcheck-plat/arm32-wchar_t4.xml    |  17 ++
>  xen/tools/cppcheck-plat/arm64-wchar_t2.xml    |  17 ++
>  xen/tools/cppcheck-plat/arm64-wchar_t4.xml    |  17 ++
>  xen/tools/cppcheck-plat/x86_64-wchar_t2.xml   |  17 ++
>  xen/tools/cppcheck-plat/x86_64-wchar_t4.xml   |  17 ++

What are these last five files about? There's nothing about them in
the description afaics.

> --- /dev/null
> +++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
> @@ -0,0 +1,272 @@
> +#!/usr/bin/env python3
> +
> +import os, re, shutil
> +from . import settings, utils, cppcheck_report_utils
> +
> +class GetMakeVarsPhaseError(Exception):
> +    pass
> +
> +class CppcheckDepsPhaseError(Exception):
> +    pass
> +
> +class CppcheckReportPhaseError(Exception):
> +    pass
> +
> +CPPCHECK_BUILD_DIR = "build-dir-cppcheck"
> +CPPCHECK_HTMLREPORT_OUTDIR = "cppcheck-htmlreport"
> +CPPCHECK_REPORT_OUTDIR = "cppcheck-report"
> +cppcheck_extra_make_args = ""
> +xen_cc = ""
> +
> +def get_make_vars():
> +    global xen_cc
> +    invoke_make = utils.invoke_command(
> +            "make -C {} {} export-variable-CC"
> +                .format(settings.xen_dir, settings.make_forward_args),
> +            True, GetMakeVarsPhaseError,
> +            "Error occured retrieving make vars:\n{}"
> +        )
> +
> +    cc_var_regex = re.search('^CC=(.*)$', invoke_make, flags=re.M)
> +    if cc_var_regex:
> +        xen_cc = cc_var_regex.group(1)
> +
> +    if xen_cc == "":
> +        raise GetMakeVarsPhaseError("CC variable not found in Xen make output")

What use is CC without CFLAGS? Once again the description could do
with containing some information on what's going on here, and why
you need to export any variables in the first place.

> +if [ -n "${CC_FILE}" ];
> +then
> +    for path in ${IGNORE_PATH_LIST}
> +    do
> +        if [[ ${CC_FILE} == *${path}* ]]
> +        then
> +            IGNORE_PATH="y"
> +            echo "${0}: ${CC_FILE} ignored by --ignore-path matching *${path}*"
> +        fi
> +    done
> +    if [ "${IGNORE_PATH}" = "n" ]
> +    then
> +        JDB_FILE="${OBJTREE_PATH}/$(basename "${CC_FILE}".json)"
> +
> +        # Prepare the Json Compilation Database for the file
> +        create_jcd "${COMPILER} ${FORWARD_FLAGS}"
> +
> +        out_file="${OBJTREE_PATH}/$(basename "${CC_FILE%.c}".cppcheck.txt)"
> +
> +        # Check wchar size
> +        wchar_plat_suffix="t4"
> +        # sed prints the last occurence of -f(no-)short-wchar which is the one
> +        # applied to the file by the compiler
> +        wchar_option=$(echo "${FORWARD_FLAGS}" | \
> +            sed -nre 's,.*(-f(no-)?short-wchar).*,\1,p')
> +        if [ "${wchar_option}" = "-fshort-wchar" ]
> +        then
> +            wchar_plat_suffix="t2"
> +        fi
> +
> +        # Select the right target platform, ARCH is generated from Xen Makefile
> +        platform="${CPPCHECK_PLAT_PATH}/${ARCH}-wchar_${wchar_plat_suffix}.xml"

Purely cosmetic, but still: Why is "t" part of the suffix rather than
being part of the expression here (allowing e.g. a grep for "wchar_t"
to hit here)?

Jan

