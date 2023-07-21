Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A071E75C20D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 10:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567417.886438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMlsj-000840-14; Fri, 21 Jul 2023 08:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567417.886438; Fri, 21 Jul 2023 08:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMlsi-00081D-Uh; Fri, 21 Jul 2023 08:53:00 +0000
Received: by outflank-mailman (input) for mailman id 567417;
 Fri, 21 Jul 2023 08:52:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMlsh-00080b-9M
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 08:52:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd72a8e0-27a3-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 10:52:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8260.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 08:52:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 08:52:55 +0000
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
X-Inumbo-ID: fd72a8e0-27a3-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDzal5nlBQpmnKu3c+6yQdtdt/n23Bnkxbx+qaU4Wq72KD2FmU9cPWquiEkqCoXEH3tMrGTpYyPky1UCK1xjpkMdiRWyNFZcpN0DEEUPM25XrGSi70BFtlAQvVsUkL4/T91VouxNHEQLnRUaavSauU4MKq/pU+oogVPr20Yt8byc9ASDVe/ZKcAv0OfH1J6NiKZtLu/6H6nbtRlhpwcmHRcc9o+UMKQgd4gSMeR6lDBYGrhoCCksgGGV7w+PGx86PoWjJFsv+pbOem0zwkDbR1RFS9Vj7TIubcOp9LcCPirklNq2Z8oBCLOi7iK57awLVA/d1xzxb/Z+2/FkWL9M3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W44X56DAKZ+FZMFVDZ+C054AFIkKyu11ph2HWTpoH8s=;
 b=I6PNbLw3nqPkclyIcPD+7u6hUuR1r6nUBVfvX6+Y/L+Qq9vkhW3fpastNBqacErHLlflEiiTUX6wGHNnNGn3Q5fmYzbG3xDTagqs8G/nlrjb+tdIfC55hoRlNZEmBy6iQnV8vUYrWPTmIwA1OjEvAc1hPJMPqv5/wE8ouKu8RzdTWx0YxIa26XTENJwUxG3AAnkXeaMpo36RtZMXJQKmm/M5TmygiN78TocivyYzfgYew/qFjylHc0VtzRFEkkV0QUblFxPwJ+yTBCkZrQpDMr8REOBbBixY3kMwsj/fmV6aNiVUXxsv0RH94DhTgTI+3PKlc9y2RU3ueMjuygVqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W44X56DAKZ+FZMFVDZ+C054AFIkKyu11ph2HWTpoH8s=;
 b=KD/xRRlYfenPj2GJ1V+7+EvZU9zMuQazHleqEAFjJYoeAOr7BrPfRpixkBqb0CfymMTskO3UjGzNyHzMUQ0nSXFOsnNFrTLVKPazuQgqyUhqRmF4g3xRFhyXI8lrCFepAz3cbhkl1TQJHn9A64JZIa1B+P32ERyxs/elA/jUT0L6aYHLCaY43YzcPICNuYNIlTqBsUhKBr5TkqfX9tHuj11kc3k3Fv+hHuxqS2qzWelay351hRXzKgXbPo1o9Lbdl51mjuPCKhBiNAcR428hM6bVG1nlUx4/gZX0pRViyD0NUZRQRe9m+FR6Zgp6tts/xdUXhYoCfUYG46l15ef5EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb7b53bc-2440-8619-61ce-39c967b56eb7@suse.com>
Date: Fri, 21 Jul 2023 10:52:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: jens.wiklander@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
References: <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c43674d-4289-448a-df9a-08db89c7e024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KW6neIfe6rxIaCbqKr6QxFwihUEXvzlkdL3BkseQdWPNnSCL5sctkuMGQH1LM9DfS+2WujoYXcTNahyhQKJZ8w9m6+fbLgqLPP0wmOJem+l8HXIxftVtxAAhEN2+UTRa7pUNuqmQav+k+/MKTK/UhKO6i5RZcPKeIN9jfR1vXA3dFx/FtuwXWS65/frZXdeVPRAVAl13/h8AaDWpSLhyRiry6qJVwavZWB3EzvYwR81iFfD3t0h4T82UhvCrzeV/2g2zhR7ADo6+1NdnQoU5zvl4g8TII6nJH1GezA0VKGlRZHvglAeQnbwZ+e2P/A58YN8rOo7B3qOiKovFlIf7J5tH1fEMDjTvACOePwW9TU4WM2Qiqcnq2iecAqJW8H2+Ohejvh3yMDySNYbDvlvhGyZMmWNwI9WKyH15X/cOVZ45IbC4FV+wx1eyvp2OGP5+ptYpSkG4belIjlpDAsXXFO+BSirAVcym9qxZXMI3XtHG0kro5+gWvOyDlAgCin2vMpXX6a05nrwb2GaeqYvYYn5AmMlqvE5YimzbyOQ0DgUf2DHA7ZZGrJ2dzP7YHP7OfIhnfXxQALhTsxMtXBiSkZEtfto3f8X2s5WcB1FEQk/Xkw6yV+Vq2kQk6BgcKb/ndUZ9YycWQyyncFfoubC7iA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(53546011)(26005)(186003)(6506007)(2616005)(4744005)(2906002)(66556008)(66476007)(316002)(4326008)(6916009)(8676002)(66946007)(8936002)(5660300002)(41300700001)(36756003)(6512007)(6666004)(6486002)(54906003)(478600001)(83380400001)(86362001)(38100700002)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWJKWnh4T2M1STJYaGRqOVVCbTZ6SmJYK1hqRXdTYXNwdEFBeGZFNWFrTkpY?=
 =?utf-8?B?Vy9mT0JQUmZzK2lIbDlqcGRCMEVubGxGeUZzZUNMb0VSN2ovdURZMVl3WlVU?=
 =?utf-8?B?L29aWGxwN0YyWldrYTRaT3UyK1YvUFFzMVFWWkxydTNNS3FtVitkQkJQVjhk?=
 =?utf-8?B?bWVaYUZPVm54MWhrekpkZXpPWkM5QnNHUmhWMGVaeDZvejM3RUNYN3dlTzgy?=
 =?utf-8?B?NjBSUlljVFFoZTVCOUVqN1hmWkVIbnk2ZlpiTXp3ZHVBS01FN0s3MFJKRmdh?=
 =?utf-8?B?SGdmTDJjNkhBN000L3JoU3BoOWpwMTQ5cFg1b0FvZUFPekJGUGFXaG5RK0RE?=
 =?utf-8?B?blpFa3AzOEp5bXFudEVTbjZ6Uk1GOEZJSkR1Y0ZVRFBKK01qWlA1SkQ1ckx4?=
 =?utf-8?B?ejQ0MVVpZFgrT1p4RW5tZk9RY041L1d3ZG5ZRFlLQWc5dUlKVzlpWE5QSWt2?=
 =?utf-8?B?R1N5L2RhVUcvOTV6YTZ1RnNPQjd1OCtJYXpndmJWMk1yNWUyWnViM1kxbW42?=
 =?utf-8?B?T2F5TXRZRWdFUE1NOTdyN3lQbUtlMmFNaGdxRGFpMzdoemV0RE44eVdLbFVo?=
 =?utf-8?B?VDFrM0ovakdDdGFOZW1ldHhjYU55U2xOclRzcEtWYno0V2NObnBLS0g3RXNi?=
 =?utf-8?B?Ni9aOGFIOWhwSFBsOEhiWHVyNWNxazhyaGxCbGhQQWtqaUFXR2o1WEJqVXBC?=
 =?utf-8?B?OVFhL2M0djFvR29WWjVPZWViOWliRnEwa2RYK0JLSjhERzVPQVZzV2drMUJl?=
 =?utf-8?B?VFg4WDRlZkVxNkJCYi9JdjJQSDB0ckZraHV2SmRzWjAwaUFZNWdFekY4V0l6?=
 =?utf-8?B?Z0FPUitQR3hpSUlvTHVUWTBYbEtrQ1I3ZWMycWxqN0xiZmtCakxBci94Ujl2?=
 =?utf-8?B?ZUlhcCs0RHR4T2FvWGVZWlVKV1Y5Ly9oeUxIUDRCcDIrQ1IwU2ZyaEtjbGZ0?=
 =?utf-8?B?Q21pU3N6Z2dUeGl1Qjh1eHRBUkFzOU4wVVYxUVNWZWE5bzJXRFNZQ0lRZHJN?=
 =?utf-8?B?dVpZcGFIMTlHZTV0aXZudXc3VkI3bFB4RDlPMEE1cUZLa09SckRRbUJqVEI0?=
 =?utf-8?B?TTFiOU10QTZSQ0ZlYk9GRmZhQ0Y0QitLRHNSNkJ2QTlyR2pwRWVndXZoUFlW?=
 =?utf-8?B?aWF1ZFVGR3NjL0pJUEszdk5qajFDeDBXRG5Ra0p1TnYxc2ducXg4bEtxUHhm?=
 =?utf-8?B?SjFadG0rYW1WdHczdHhUVStVSkdUNHA4bHRlcFRRT0FQOHppZTRWd0w2R2dX?=
 =?utf-8?B?S1JsT3dBUFU1ZVpYUnRTTThoODk1TTFuN1NNODhPUmRDZEc4M3BJT1EweHVk?=
 =?utf-8?B?M1hndC9pZVE2ei80eTVrNXdTd3J6K1JDcWhDcXAwTTVyVWNmREFUTzBrY2Ew?=
 =?utf-8?B?bWt0dUdic1NnTFJOM3NTTXpBYjJPWVF5L0ZvakpOT0RiaUpWVlZEa3lQOWdh?=
 =?utf-8?B?c1pjMmEvWjRycnBLWEEwakhTazRONXBjTTdsR2xxQ0RTZlFCVmoxN3p3Z25U?=
 =?utf-8?B?VDFkcFZMb2Q0V21WWHZuU2RrZ0hvdVFBM2cvTEhBM00yeFV5RERFRWp0L09V?=
 =?utf-8?B?UDYvcVdmZzRhWUU5a2lRdVIvMjJXUUVsY0lGQmJEbytQazkzNVFXNzVzOEVi?=
 =?utf-8?B?RDM5dzN6RVpCcnBaMGFnSHB1M2VKMUJEbEdYNDFJaGhNRDE2b3YzRVlQblV5?=
 =?utf-8?B?SzVhTlQ0cXdBRHhRMndvU2psajRyakFnUWw5QnVuQ3hoeG5qRlFpVnJrSU54?=
 =?utf-8?B?VlNka3ZsZTArR2RtRlhYM2pnNDc3eUlOUlVPcVRhSWg3a0hxRXpjcnJBMTlP?=
 =?utf-8?B?OHdsU2JDOWY5cDF0Vm5HeGt5UkR6UlNiVEFrK3pxdWNVQWF2bmZ2MDJWL1FW?=
 =?utf-8?B?a3p5djFGOXluQlhQSGdHRjhPb2pYVkNkYmFoa1VBb0ZveHNaMXlocTIyUEFr?=
 =?utf-8?B?MmhnWDB6Wnd5c3J1QmYrV0VlSmN5Wnd5b1pROXBkUzZxYVRWTE1IT0N3dGo0?=
 =?utf-8?B?SzRNQzgwNnZVYklKWlRzaklzZ3JKbzF5L3h1WlFqYU5UV0tmakNoSkJxMWt4?=
 =?utf-8?B?aktIbWdoZ2ZkR2lwRVF0bnlmcnA3bVcvQk5EeXFudjFaUnFNV2tsaFMvZWtt?=
 =?utf-8?Q?bzUp+GffN3yu3j8v5O4khsmk2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c43674d-4289-448a-df9a-08db89c7e024
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 08:52:55.6138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yIxzqJsEvxjFl7tGuqMMfx6nJ9xJBrtLM/01Ixr3tn5qeyaeLrsZwCUCdZuBSzyva/Z5WXjV6Wrf58+kdDGQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8260

On 21.07.2023 10:02, Bertrand Marquis wrote:
> --- a/xen/arch/arm/tee/Kconfig
> +++ b/xen/arch/arm/tee/Kconfig
> @@ -1,7 +1,17 @@
> +menu "TEE mediators"
> +	visible if UNSUPPORTED

With this ...

> +config TEE
> +	bool
> +	default n
> +	help
> +	  This option enables generic TEE mediators support. It allows guests
> +	  to access real TEE via one of TEE mediators implemented in XEN.
> +
>  config OPTEE
> -	bool "Enable OP-TEE mediator"
> +	bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED

... you shouldn't need the "if" here, and ...

>  	default n
> -	depends on TEE
> +	select TEE
>  	help
>  	  Enable the OP-TEE mediator. It allows guests to access
>  	  OP-TEE running on your platform. This requires
> @@ -13,9 +23,13 @@ config FFA
>  	bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED

... you could drop the one here. I think.

Jan

