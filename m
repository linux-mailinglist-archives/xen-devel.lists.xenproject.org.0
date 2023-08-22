Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D2783A17
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 08:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588141.919609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYL2g-0003p2-5M; Tue, 22 Aug 2023 06:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588141.919609; Tue, 22 Aug 2023 06:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYL2g-0003n1-2l; Tue, 22 Aug 2023 06:39:06 +0000
Received: by outflank-mailman (input) for mailman id 588141;
 Tue, 22 Aug 2023 06:39:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYL2f-0003mv-8C
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 06:39:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95a94f00-40b6-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 08:39:03 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB8964.eurprd04.prod.outlook.com (2603:10a6:20b:42f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Tue, 22 Aug
 2023 06:39:01 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 06:39:01 +0000
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
X-Inumbo-ID: 95a94f00-40b6-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chAuXmcOmBk/6w7H/SqXW5U6H2zdL7e5807lsknrpbOS47JIV0TE9hlzKZhus3ZQLxhT1gu6IV5LFyZGLcU78+wgvW79brvsrjOjZ+cLAqNWYMBdJoYGVCmJ1lqwveOeysBKivY5E7AquhetG2zyoNO1lcIAtfrwMqYDA1jE9jiP/Eu/7LkWtrSOtCRmn6tqyykEl0IH0PFoTKKH6Niqyg8o+57EWhz24cR4yXEujieT7wAoAyC1YCc3bNFGfOGP+YXmaohqolsw8NcaawcXUI2ke02iNr3OVyH51uGgRgXvr2B1XJZn9vMDk4b7buIO8ciryv93l9Z5RlgaK+CUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQpHGDdzzsNpcCUIxBtd5IUq4fKOlheR0piZaDIJjAY=;
 b=bjbKX7V5Q6nGlW5YSn0obBghj34XVXo4h7FwVCtjz6GcIwLd6qS5EFdB56NVCB/v1TxRKX++otvXs645XFOyPI9tWvWuM8ZHx7LFbFfNFmx0jMuGPWjYVRz9iU/G0QiE48erWy77qlOiMUZgLEV0/L7f4uww3zfYiMQNpajnOMzDb7e3UmUm8Vs6x4qrsxfnE2/juGZ2a+poq5vsiQQCqge9183wOl0SKOJ9V0Z8XQaLrX8xNLGp8zqt+ZABu4cK7gkmetc9Yw3YuuF7GteM1YLIq/DQjruRJcxnu1SyaiOD3FetHkEIVizlyxfHyyg5HoAEYvgogeV6fYeHybJLNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQpHGDdzzsNpcCUIxBtd5IUq4fKOlheR0piZaDIJjAY=;
 b=l22lmcWvVhK+Uvi9Gr/3pHxkelRtBmkRHSsx0hwefwCDJdGhTy7gfg6FxA8BIXw6QkVWdpd4QBw29aymtEFo27EK+dfZ0FvUFlQyPKzomVHsMFs1PVB8cTcSUbd9mJwTfne8WER/nErQKEy3gFgGLxtNG3tJPBfdwQOYyKqO5SM1fTENelDlkJ/85RLjyIAPi2pTscBRSvF6LGUpz/buqAbt3GKKdXX173KPhbiVqTOm0SNFF25uj4O4RsrTvbRLKdA/hwTa5kh6ZqgGQj2/ZPJ1rBj2OdOfKc5f/erRjY4xkSGN1SLmruJo2l2igxxxxC0YaTCwLZ8fvlF3Br707g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eaef1c3f-490d-a21d-92d1-cfbee50dbdd9@suse.com>
Date: Tue, 22 Aug 2023 08:38:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
References: <cover.1692636338.git.nicola.vetrini@bugseng.com>
 <857dd398240accabea73e5660ae77f3925727ee9.1692636338.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <857dd398240accabea73e5660ae77f3925727ee9.1692636338.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::11) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: add08ee9-abfe-4fb5-4212-08dba2da7888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ujc/zTY7nvvsb0m48HaCKNblxkiNzCjDAURMiAHDgDkCvhIKHmUU4Ld+SbjMnN0QG7tsH2OMtkqdQVrzvUEu9l1Z2b70LoSqcrea/Fnacf0R2pp7MWBQKNm1ccRPPkBQk21lfVOh14PgD5BBzt3QJliIsTC1mZ9620DzPyEE7Bzv9elw8G9eooEu1p5fLDYhRx9LfZHG7XnlZ0ZIQl5V6AXK1rHRC+EPKxc+ip0UWcHdzNGgmgcr7O3Y/hHLPWo/jvh2lDYiIqU+CJVTgkPiPSvoH/rkSE9gNzbvusBoDrd/6/MVgTXSYLgGHvevedCN4rZUJ4qlem+qHDyPTQuoZdb44DhpIGsLvHK2tVQcnjkXmb/LmJ9hiWOFgE3eTva/fPXapDxoQPuH7D7cCaAAjAUsQK3+qV3zEhZImTmBDetKcd/aVyUtnd7VvYUqqzA1FOiKp96FVB+VB/pvC6a2ERLcjFy/cx7/XIudzMdFEv5T0Q6/e1oEgNmafdQDCcMz+FB35xQ613v1PvF5cjB2u0xcTC+DSypOu8UVeIH7q54AHsxXT//xUIY7f3k2mneqMkseVyc8nwmbB35dmd31FhFWpfCELXTrWKFN0quYuYS5CL3OijQy5vJgKqFMVVXg3v9/1yD1rBUcEkxlRGf/Gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(86362001)(36756003)(31696002)(38100700002)(8676002)(5660300002)(26005)(2616005)(66946007)(66476007)(6506007)(66556008)(6486002)(53546011)(6512007)(41300700001)(478600001)(4326008)(8936002)(54906003)(316002)(83380400001)(2906002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0hTcElGclZoMU5YSHBRRGpEVDFsSk5SWVkraXJJdGpmUnlEUHdMSWRTZDRM?=
 =?utf-8?B?SU1OTnVvOWtWTm02MjducnlKZ0FmbVVDSGZOQ3UzMFZXdEZJVTJ0YXRadm1P?=
 =?utf-8?B?ZlVsTWszMlh6YjNJNEpDUnhyOFVjTVNpY0h5ZkpweG9IS1ZZalR0TmUwWklh?=
 =?utf-8?B?eTN3MnBhVkZUTzNNNGxlNmJWQVRFeVNmM2ZnY01DWER0Rm8yV0Z6Qk9RS2Jy?=
 =?utf-8?B?Qit0aTM3dkt5bS8yREVTaHI3SWVKSTE4b215UVlYbzl5OTloY2FXTHAzS2lh?=
 =?utf-8?B?dHlGcDF1bVM2U3hCYXcxbjN4dzIxYmFxVHRoaytnSFFmamtuUlA1QUlISHVh?=
 =?utf-8?B?c3h6NW43RzJTZWtnN1RzSmswQmxZTXlmNHhCdy9qNlZiNm55R2M0Y2Rabjhk?=
 =?utf-8?B?SjF0OHlmZWlSTFM0aC9kK09HUGh6TzRYemMzck9yRDdzcXhHaEt0d2VwQTNh?=
 =?utf-8?B?NTdPSzZvU284WWFURXYyd3pKZnBUYlBUVEZiSm5qZWxWakhVendLcGpGTGt4?=
 =?utf-8?B?VW5YR2ZIN0dWVWdYdFFsaURpUkh0ZmpHZjY0MXkvWldHN2VMdmViMHBKdW80?=
 =?utf-8?B?Rk1LbDhudEVrakhNNTdDL09lY090ZllFZGV2RFpYV1lyZUg2MG02TXUrR2Vj?=
 =?utf-8?B?a2tQakFzTGd0N3BuQi9kVmlmL2Zrb0dlQkRaT1Ntdk5BTzE4SkZTR1ZXNENO?=
 =?utf-8?B?NTBTU09xMVhQQzkxTTZRN0d2TWR2cHVrZG9NTDcyWWRiWThNYncxQUcxQ2w1?=
 =?utf-8?B?UXRCNG02NmhjNXlqZnB0dlBud2NwemJLY01CZEhOWXAwQjlBNk5HeVZDaUcw?=
 =?utf-8?B?bzhXWWN6WG5zelRVVVFvN1NZMjByeHFvNDhJemNTWm8rU1N4N2pPS1dHSmwx?=
 =?utf-8?B?dHJGNTVIR2s3WFFLR0p6L0dzWjRBOVpiR0REeWxOeDVMbkVvbE1JMzlSMnkv?=
 =?utf-8?B?SCsyYmVnQ01la3o3RVBXUzNXdWJITHlzQ0d2L1BwZVo2Tk1rRXpNeXNSV0Jk?=
 =?utf-8?B?aTNvazJLT2E1TnNPY3ViQmNTazVuZ05ha25XekRFRDRBNU1uLzNoQy9DZU1M?=
 =?utf-8?B?WXdLeCs0Rmh5dzIrdDRlYURJbVRTUW9WV2JKeGRvQ2laVEh2bitzQWErSnA2?=
 =?utf-8?B?eUc2SE8vS3NSSGhqY0dFWGhEbUpadUVENjBMV0ZmelBxMzIrVDQ5bmFoRG12?=
 =?utf-8?B?cW5idThCd29jVTQ0WHBVRFQ5WERxa2JKSlZ1YjFmNkVMRTk0elplcGJRZGxj?=
 =?utf-8?B?Wjd3N2pPd29MamI4c2xzRmIyVkkzMEZoajJWOWVHSzh1ZXZrU2hEdFd4d3VX?=
 =?utf-8?B?ZGdvUktkV2hjWURRNDk0UmdGRE5tL0J5VCt5Lyt1cWx0U0hjNmNPTmU2Zk1N?=
 =?utf-8?B?THNwdEJIbnEvNmpRcktZZ0N3UW5aNVVTM0RnU1I2ejA4U3VJakhYS2V3cDdC?=
 =?utf-8?B?M1hVNy9PcHR4K0FvanRlVFFkZW9yWUpqaVovMDNZZWZhdnRyS0VJZ2xkcFRr?=
 =?utf-8?B?ZnVMQnhtQnRjbE5YODlmcFRzVUZWL2JwaExGNk5tZVhFTzhSNVYzamQvbisv?=
 =?utf-8?B?OFM4R0ErZTZJNEhBYXlJdy9VOFMyUU42cjlENjBOcHo0QjJVeGFkR0JuU3B1?=
 =?utf-8?B?WUZmSnpaaTlyMmxBOUNxZmFyVkZMd1QrMEFQNys4V3FiQUZZYW1VV0FpN1NY?=
 =?utf-8?B?QXozTUFyckN5WFlqdkZPVDNjbXEzMkFoRXQ1WDJMNHIvdEhpUXFnVkF3K3FV?=
 =?utf-8?B?eDd1cjQ0K0JzM1UwaXNGM0xuSWt5SE9uOURyektDRDFDcUw2U3FVRTJ1czds?=
 =?utf-8?B?ZTl6dWNZc2FyUmhqTWFKbzkzSE52bFlGSDMraWdmVWthL3J1dW9JLzhZTUlD?=
 =?utf-8?B?dHRSam1FMlBPVGRrN1JuRk8vMGxJRW9nanlXVldWQzZxbGtmZ3AvR1FlYStk?=
 =?utf-8?B?RnJLREw0UWtaOEpjWWwvTGRyK1ZJNVBIeG04SUgrT0ZjYWtkNE5zQTJRc3ZZ?=
 =?utf-8?B?ZWxCWlJlODRYZ0tJL1FoMjR6cEJPOU9Ob2NzUnkvbDFoNk92ZUFjTVZBeU5R?=
 =?utf-8?B?ZjdEci9BTU04alA1bm1XMy9kSFd5ckpoa3JQNS9PRmxzMS9CdXJCWE40a0ZP?=
 =?utf-8?Q?2/Gce/trUclGK1uAiujhZgEa8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add08ee9-abfe-4fb5-4212-08dba2da7888
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:39:01.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLQM/JQoV/E5U0ITj+RmqR8a4zyZ/zbYrb8mN35hLY9PPVKMdblOAfYZ1ZenqUDxNzqSnxJUr1B0ib7A/DGhdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8964

On 21.08.2023 18:54, Nicola Vetrini wrote:
> To be able to check for the existence of the necessary subsections in
> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
> file that is built.
> 
> This file is generated from 'C-runtime-failures.rst' in docs/misra
> and the configuration is updated accordingly.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  docs/Makefile       |  7 ++++++-
>  docs/misra/Makefile | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 docs/misra/Makefile
> 
> diff --git a/docs/Makefile b/docs/Makefile
> index 966a104490ac..ff991a0c3ca2 100644
> --- a/docs/Makefile
> +++ b/docs/Makefile
> @@ -43,7 +43,7 @@ DOC_PDF  := $(patsubst %.pandoc,pdf/%.pdf,$(PANDOCSRC-y)) \
>  all: build
>  
>  .PHONY: build
> -build: html txt pdf man-pages figs
> +build: html txt pdf man-pages figs misra
>  
>  .PHONY: sphinx-html
>  sphinx-html:
> @@ -66,9 +66,14 @@ endif
>  .PHONY: pdf
>  pdf: $(DOC_PDF)
>  
> +.PHONY: misra
> +misra:
> +	$(MAKE) -C misra
> +
>  .PHONY: clean
>  clean: clean-man-pages
>  	$(MAKE) -C figs clean
> +	$(MAKE) -C misra clean
>  	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
>  	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
>  	rm -rf html txt pdf sphinx/html
> diff --git a/docs/misra/Makefile b/docs/misra/Makefile
> new file mode 100644
> index 000000000000..f62cd936bfcc
> --- /dev/null
> +++ b/docs/misra/Makefile
> @@ -0,0 +1,36 @@
> +XEN_ROOT=$(CURDIR)/../..
> +include $(XEN_ROOT)/Config.mk
> +-include $(XEN_ROOT)/config/Docs.mk

Why do you include this? I can't spot what you consume from there. Also,
why the leading -? _If_ you need something from there, surely you always
need it (and hence you require ./configure to have been run up front)?

> +
> +

Nit (style): No double blank lines please.

> +TARGETS := $(addprefix C-runtime-failures,.c .o)

Does the .c really need listing here?

> +all: $(TARGETS)
> +
> +define MISRA_HEADER
> +/*
> +
> +endef
> +
> +define MISRA_FOOTER
> +
> +*/
> +
> +endef
> +export MISRA_HEADER
> +export MISRA_FOOTER

Style-wise I would say: Either you put each export immediately after its
define, or you merge both into a single line.

> +C-runtime-failures.c: C-runtime-failures.rst
> +# sed is used in place of cat to prevent occurrences of '*/'
> +# in the .rst from breaking the compilation
> +	( \
> +	  echo "$${MISRA_HEADER}"; \
> +	  sed -e 's|*/|*//*|' $<; \
> +	  echo "$${MISRA_FOOTER}" \
> +	) > $@

The rule of thumb is to generate into a temporary file (then you also
don't need to wrap everything in parentheses [or braces]), and then
use mv to produce the final output. This escapes anomalies with failed
or interrupted commands.

Jan

