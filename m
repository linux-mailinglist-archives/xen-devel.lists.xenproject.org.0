Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66BA7DEEA7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 10:11:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626791.977359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTjB-00049X-CG; Thu, 02 Nov 2023 09:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626791.977359; Thu, 02 Nov 2023 09:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTjB-00046d-8L; Thu, 02 Nov 2023 09:11:01 +0000
Received: by outflank-mailman (input) for mailman id 626791;
 Thu, 02 Nov 2023 09:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyTj9-00046X-6S
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 09:10:59 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe12::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bac88d4e-795f-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 10:10:56 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9190.eurprd04.prod.outlook.com (2603:10a6:20b:44d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10; Thu, 2 Nov
 2023 09:10:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 09:10:52 +0000
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
X-Inumbo-ID: bac88d4e-795f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3UukqeKkHt/sE4OM8pqFGwjChLgowrvqxGm5QYW/FUQR/iZRyNv0LzpXCm86AukWvlD7LghHcZRf/bKUE0Ux+GTjVNIhkmyn51YTJ0SS1V+A8B8MTWgJ9AYGfD32xV/VnKLETw4yPbzTPg8Msm9tsdELffx3v4nOVk4NxxAWoaeeDKGnKXdzOOe/4bw6W/Mhhx3J/ZZEANIl8yBoFD5UVeNn1ZoQXvpaYQWYMEJb2H3E1DOsKogZVH/Kgt4Z1XKxABB/nvZeAtZ0/CvDUtNZeG4MX/r6fy1HRtZUfGkmpu/CiOITmwmEBkD0dB2wsjOQcJJkCiRYWNOXNhEmXIdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcjcbdYKJ7U4xpjb7qwXRGi4MfKePnQMFQI/66XR7k0=;
 b=LjuhJOXsGP4umCT6G4V2MQQuhNCucARZCF7e4pn3NoV/HzzhUMdz8cq8HAD7PAkW/Y3K/rBT5lPH6mDngKR4jQIXdB4VudmXLSGjhBNcAv6BDeLeyQs7kIpyOljOjUfxZGnSsISwMcSUpMpgjDppZZwXsCMnFgIl4GkwnM+FMNhZxyUVEwesQ+D3dvnqsgvUlToOJX4ZD+hs+AWJgctaMS0Urn0afM7EP6JF4hInwN5S/a4j27BLiBU1a3hjOpzzv0jjd4IaBnZ/qTssTgXH7bjTnqVH52Sl/YxOtEqV77EJJ0FWKkjW0StxzqTTSgPu2XsuM4TZb+NxDgsle0ESwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcjcbdYKJ7U4xpjb7qwXRGi4MfKePnQMFQI/66XR7k0=;
 b=D/ttUwtAhZI76uzQmKbLavorZ/AsxmV3+jqOEN3ssrdDx6jneAJQSzk3lVt5NYWYvYktp7iDUE6yIh7/g1o6vzA5qTR0KtIQHux5MSiogmhd3sbnTv+UtPjobZFyTqoOG4UwTEl4qrd1PyfhimoXT4BloWfDJ7+VQ1fOydyE2A/Xid3iBbA9VwLWuZ61lxfF2pBGk2opbAgTACV2eWgGiIKrlFcbBWbWXpUBjJhn0sew9/A5kbYbbC8mEmG/obKzjpt+LTIc7Uq42iK6k/dSlkvjp0y/qy6uc+dgmT9YOhWjKz0wM01IRAuNUDiENryKQvS5BlqvTlS2wcjJYYIqbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0c05564-eadb-5135-b465-e15dec71aa22@suse.com>
Date: Thu, 2 Nov 2023 10:10:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v2 7/8] xen: Add clang-format configuration
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231031132304.2573924-1-luca.fancellu@arm.com>
 <20231031132304.2573924-8-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231031132304.2573924-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: 2defa687-8517-4e73-6981-08dbdb839cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eRpzgKequIiDQY+1DZ2ej+bK3QI+k6ua67tUlEoBPcTFBqmviT1PpJum5Bn9S2tOGjWyVPRLAEEcPhr6qCDsuvIyraw8z1PKz+OTwq5t4dVWlSLXrkD9SwBKXne3+Vh4xXt5VSRqCNnSj0Z/OWdQCTPlKA/OQ6I4OyCWAusiztIgd9W4TUCQltfZrSdCJoHdYfBA8Qp+Uw4K7D1KtUNeIARbAQvMG/kR0YDXmFa1tSZ6DmjP0tR8p/PIOWikA1eYOb8lpJeAF+EMwYa2kXlTTesWP5vI2gob/d0/UHdRhESpCiML1X6pvsQcohIS/zaTdWoKRI/fkAhb38Gt/6Rw5O+Zkgwqaaj003nJ2fVBSQW/61o1atG8bmwPItIr7duoVRCqGYwlgZZj9t9aK0Imxvr+q+vnR4T7WY4+7JDUb0IZuQD/dgIaM/O4CSP/6Xn7mnYS1lI7Tyci4TPZLC/wdnC/U28xBklbPplPk934bFtS3a+TRXyS26R8rDqVH2EnlGqxtYn4BcvhoYcXErOsa4AA3OasisArefIoelO5Tal3cMtnpsdPJKkqJm+Bb9ET4BGrOM7a7yGqyVl4xTsq+WajbZCdH5igfpeZHRNcBoVFoI2xLyr+LSEOGsk5LCjo6SWCDkqtXPmrIZ0s/zWnTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(31686004)(31696002)(86362001)(36756003)(966005)(6486002)(41300700001)(478600001)(2906002)(30864003)(2616005)(8676002)(8936002)(316002)(6512007)(6506007)(53546011)(4326008)(83380400001)(26005)(5660300002)(66476007)(66556008)(54906003)(6916009)(66946007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K28vbkVtTEpXaWZOOWc5bW5MbGVjL3N6WmdhNmVwWGY3eFhTUTdFWGFIcnJr?=
 =?utf-8?B?dnordWFsRkZ2cldDdVhjdVNkOUgwMUZZMmxTMlNYSkpyN0xBSkJ5NURvNHk1?=
 =?utf-8?B?LzMvOXh1WHJBa21KM1VBLzArcW9DQjhtQ245K3BuQ0pTVWYvbzE0UUgydDJI?=
 =?utf-8?B?RzVGeXhIMEdWYkRRSlJmZ0dvNDF6NVhJejJMajIyS0Robmxkbkl1Y1V5MU12?=
 =?utf-8?B?QkZaLzJrbXhxbWVWZ0JmOG1hZzRpRlQrWXp0QkIzYUM5WWVvQnFxVSsvWTVH?=
 =?utf-8?B?RUQ4c2pOVStpTHVwNVFjc2Noem5sMWxTZlpoM2xDOHBZYmRhd2QvcUNRVFZu?=
 =?utf-8?B?cVMzOVJVUE01Y0xKUXFKOTdvNFdEZUFMTlRJZ0F1SDBSL2dwUUV4azNyWUMw?=
 =?utf-8?B?cXpmcTdOV0dKOUZ6VFRlWFJlako3QmxpUWp6M2c2MXNNQ21VQ3lJOHhBL01u?=
 =?utf-8?B?Z2RZVmdjTWJwZXNxanJsRkQrMzk3aytheG16azFRZHpSY2lVRG0xRjI5Yk9L?=
 =?utf-8?B?NENxZ0xKVFBXUnArU2tWTk44VUNnL1lYNVR2ejFuNnpOMmt5YUpVTXRDWVhP?=
 =?utf-8?B?dnhJRk9mYURxQU5acURNTzNJbmVlZWhrNjdQNmFnYmhBQU4xcnhIejFuMGdR?=
 =?utf-8?B?Qm9ySnhCVk14dnlBM0RlOXpSaTUvZHlaMHMvS1h4alp5RkxjeUt3dUxUazI0?=
 =?utf-8?B?SlJmT2xGYjlieHhUU3NWN2hVaGRBa1IyS0JvazhPMy9XVHZJUjlWWlF2RzBO?=
 =?utf-8?B?TUdsNWJYUUxOeVgrbTM1RTdQZGloSGF0d1k1U1U4SVNwczBPcTdLc05LSHow?=
 =?utf-8?B?K0RvcTM3bHo5Y2lYS1ljVGFBUkc3cFg3a0VrRzFqcFEyVk9ZbEp5dEczeXVt?=
 =?utf-8?B?c3Fzb3BLTTE1ZnptajVsbWJVcExTbzJac2xRMWJpMTBIbytxODQ5YWp4Y3lh?=
 =?utf-8?B?aFM0VkR4N2R0bUh3Y0U2djJVQWIrWFpnbEtxWlIzRkQwM1ovUkd1Rjl5U1Q4?=
 =?utf-8?B?V05zR2ZQdVVzVFF1Z0tlOXdzMlJZdTl1VHk3Mjk4bndCN2grTHI3MC9Pck9T?=
 =?utf-8?B?ZGppQ1JTUCtVZ1FHVEpFbEhGb1JHYjU3SDZaN3pxcXpQSkQ0c1RXQ3lGNDdw?=
 =?utf-8?B?TTJ6L2xpOUc4c0VPb1hpaGt4ZDFLYUVBNHlFN2dIVFNXcnhLQnkzaEloMHJS?=
 =?utf-8?B?YlZUK2ZwZUVkWFpKNFd1V2JwQjIvZUJwTUpmbS9SbUhsaGZwOFJzNDhTZmVK?=
 =?utf-8?B?TE1OQUFLTmRFNzY5UDlQbFUxOG1JMlI3MDZaRGVsU0hLLzVrQ1JwVkxqbi80?=
 =?utf-8?B?TjBlTXdLalUwbU01bzhhOVFqT0NReGR4aG9NRzZDKy9uNmdkc1l0Tm5rSWIw?=
 =?utf-8?B?ZkVaR212Z09FQXFFV3kzWitEOEJCc0VacEVUbGVXeGJkY2o3M2lMeTNFOWdL?=
 =?utf-8?B?MmdRRzNpSXdJaUxFY1VXZEU5U0J0clg5TG1OQVJBODlEMGNVNWZsWUpydllY?=
 =?utf-8?B?K3VSaFoycng4dkY1Y05TaUphY3puZG9RQkJtRkJxdEErT01KemUrZ3EwMG9P?=
 =?utf-8?B?R01qeVBHL0RBcEorUzg0dWJJTHc1bm10NW0wTmVHMVRwZG9VcUxISW5DL3dQ?=
 =?utf-8?B?eVNmeldxU1VOKy94MTJWTDRiZC9GUkxEeEUzanVFQjE3UnFuZzhhNEtBYmcv?=
 =?utf-8?B?WjM3MEdhTHZWMTR5Qmc3ejZMcGlMbGo1RTZxS0lSeEpEWWNDajJEMk9Sa0lq?=
 =?utf-8?B?N3pnemcvTW5iOVJiUVJUcStVN21TY2pXVmR1OXFGNnNDa0tSSWNQckVrY2RG?=
 =?utf-8?B?RVErdlVqRCt6VW5mS1BhTTFGVzNKaDBnSVFXOHBxcnBKQktJc0VZN1VBVHhT?=
 =?utf-8?B?TEhBSXBRbE5sMmpyY3RsVGlwOXN0c0w0ZGhLWjJiSjFoZUFtc0hiTDNoZldF?=
 =?utf-8?B?Tlh2Y0NrNUZhMDNET2pxRWZwY1gzQkt2c0JCOFFrWWtNWjNRMDlDL0pQS1dD?=
 =?utf-8?B?d0hJRjJKYzkwV0xhR3ZvbXk0NnIrbFNCd1hTZEx3bzRVNmNMTUQ2TDI3ZUZi?=
 =?utf-8?B?UnFUaTc3ODJxNVlXMlJrdVhRNExDcmIrL3hPS1RBdUgrcUs0cm0rSWNtVlg5?=
 =?utf-8?Q?GV01o1Sa2w/TulitawnMVWSIc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2defa687-8517-4e73-6981-08dbdb839cf2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 09:10:52.6540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uB2mKUFU1BrVh+ASG/deQYnjqrdSFnbwQXe3/8jv3zhaJYc38Fe0dx8ciO/b0ZWOB1R6Hzwh9kaL9c0NrOZ4VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9190

On 31.10.2023 14:23, Luca Fancellu wrote:
> Add a clang format configuration for the Xen Hypervisor.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/.clang-format | 693 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 693 insertions(+)
>  create mode 100644 xen/.clang-format

I think this needs splitting and every setting then individually correlating
with what we have in ./CODING_STYLE. That would entail extending ./CODING_STYLE
by anything not presently written down, but intended to be checked for. Merely
...

> --- /dev/null
> +++ b/xen/.clang-format
> @@ -0,0 +1,693 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# clang-format configuration file. Intended for clang-format >= 15.
> +#
> +# For more information, see:
> +#
> +#   Documentation/process/clang-format.rst
> +#   https://clang.llvm.org/docs/ClangFormat.html
> +#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html

... pointing to further doc is helpful in general, but imo insufficient for
the introduction of the various settings.

Jan

> +#
> +---
> +
> +# [not specified]
> +# Align function parameter that goes into a new line, under the open bracket
> +# (supported in clang-format 3.8)
> +AlignAfterOpenBracket: Align
> +
> +# [not specified]
> +# Align array of struct's elements by column and justify
> +# struct test demo[] =
> +# {
> +#     {56, 23,    "hello"},
> +#     {-1, 93463, "world"},
> +#     {7,  5,     "!!"   }
> +# };
> +# (supported in clang-format 13)
> +AlignArrayOfStructures: Left
> +
> +# [not specified]
> +# Align consecutive assignments (supported in clang-format 3.8)
> +AlignConsecutiveAssignments:
> +  Enabled: true
> +  AcrossEmptyLines: true
> +  AcrossComments: false
> +
> +# [not specified]
> +# Do not align consecutive bit fields (supported in clang-format 11)
> +AlignConsecutiveBitFields: None
> +
> +# [not specified]
> +# Do not align values of consecutive declarations
> +# (supported in clang-format 3.8)
> +AlignConsecutiveDeclarations: None
> +
> +# [not specified]
> +# Align values of consecutive macros (supported in clang-format 9)
> +AlignConsecutiveMacros:
> +  Enabled: true
> +  AcrossEmptyLines: true
> +  AcrossComments: true
> +
> +# [not specified]
> +# Align escaped newlines to the right (supported in clang-format 5)
> +AlignEscapedNewlines: Right
> +
> +# [not specified]
> +# Aligns operands of a single expression that needs to be split over multiple
> +# lines (supported in clang-format 3.5)
> +AlignOperands: Align
> +
> +# Do not align trailing consecutive comments (It helps to make clang-format
> +# reproduce the same output when it runs on an already formatted file)
> +# (supported in clang-format 3.7)
> +AlignTrailingComments: false
> +
> +# [not specified]
> +# Do not put all function call arguments on a new line, try to have at least
> +# the first one close to the opening parenthesis (supported in clang-format 9)
> +AllowAllArgumentsOnNextLine: false
> +
> +# [not specified]
> +# Do not put all function declaration parameters on a new line, try to have at
> +# least the first one close to the opening parenthesis
> +# (supported in clang-format 3.3)
> +AllowAllParametersOfDeclarationOnNextLine: false
> +
> +# Bracing condition needs to be respected even if the line is so short that the
> +# final block brace can stay on a single line
> +# (supported in clang-format 3.5)
> +AllowShortBlocksOnASingleLine: Never
> +
> +# (supported in clang-format 3.6)
> +AllowShortCaseLabelsOnASingleLine: false
> +
> +# (supported in clang-format 3.5)
> +AllowShortFunctionsOnASingleLine: None
> +
> +# (supported in clang-format 3.3)
> +AllowShortIfStatementsOnASingleLine: Never
> +
> +# (supported in clang-format 3.7)
> +AllowShortLoopsOnASingleLine: false
> +
> +# [not specified]
> +# Do not add a break after the definition return type
> +# (supported in clang-format 3.8)
> +AlwaysBreakAfterReturnType: None
> +
> +# [not specified]
> +# There is no need to use a break after an assigment to a multiline string
> +# (supported in clang-format 3.4)
> +AlwaysBreakBeforeMultilineStrings: false
> +
> +# (supported in clang-format 3.4)
> +AlwaysBreakTemplateDeclarations: false
> +
> +# Specify Xen's macro attributes (supported in clang-format 12)
> +AttributeMacros:
> +  - '__init'
> +  - '__exit'
> +  - '__initdata'
> +  - '__initconst'
> +  - '__initconstrel'
> +  - '__initdata_cf_clobber'
> +  - '__initconst_cf_clobber'
> +  - '__hwdom_init'
> +  - '__hwdom_initdata'
> +  - '__maybe_unused'
> +  - '__packed'
> +  - '__stdcall'
> +  - '__vfp_aligned'
> +  - '__alt_call_maybe_initdata'
> +  - '__cacheline_aligned'
> +  - '__ro_after_init'
> +  - 'always_inline'
> +  - 'noinline'
> +  - 'noreturn'
> +  - '__weak'
> +  - '__inline__'
> +  - '__attribute_const__'
> +  - '__transparent__'
> +  - '__used'
> +  - '__must_check'
> +  - '__kprobes'
> +
> +# [not specified]
> +# Try always to pack function call arguments on the same line before breaking
> +# (supported in clang-format 3.7)
> +BinPackArguments: true
> +
> +# [not specified]
> +# Try always to pack function declaration parameters on the same line before
> +# breaking (supported in clang-format 3.7)
> +BinPackParameters: true
> +
> +# [not specified]
> +# Do not add a spaces on bitfield 'unsigned bf:2;'
> +# (supported in clang-format 12)
> +BitFieldColonSpacing: None
> +
> +# Xen's coding style does not follow clang-format already available profiles for
> +# breaking before braces, so set it to Custom and specify each case separately
> +# (supported in clang-format 3.8)
> +BraceWrapping:
> +  # Braces ('{' and '}') are usually placed on a line of their own
> +  AfterCaseLabel: true
> +  AfterFunction: true
> +  BeforeElse: true
> +  AfterExternBlock: true
> +  # except for the opening brace in definitions of enum, struct, and union
> +  AfterEnum: false
> +  AfterStruct: false
> +  AfterUnion: false
> +  # This is unlike the Linux coding style and unlike K&R.
> +  #
> +  # if ( condition )
> +  # {
> +  #     /* Do stuff. */
> +  # }
> +  # else
> +  # {
> +  #     /* Other stuff. */
> +  # }
> +  #
> +  # while ( condition )
> +  # {
> +  #     /* Do stuff. */
> +  # }
> +  #
> +  # [non-compliant]
> +  # do-while is not compliant with CODING_STYLE because clang format doesn't
> +  # support different styles for every control statement
> +  # do
> +  # {
> +  #     /* Do stuff. */
> +  # } while ( condition );
> +  AfterControlStatement: Always
> +  BeforeWhile: false
> +  IndentBraces: false
> +  # [not specified]
> +  # Keep empty functions with braces style like this: 'void func() {}' instead
> +  # of breaking the braces
> +  SplitEmptyFunction: false
> +  # Not related to C language, but specified for completeness
> +  AfterClass: false
> +  AfterNamespace: false
> +  AfterObjCDeclaration: false
> +  BeforeCatch: false
> +  BeforeLambdaBody: false
> +  SplitEmptyRecord: true
> +  SplitEmptyNamespace: true
> +
> +# [not specified]
> +# Break only after the operator in case of a long expression
> +# (supported in clang-format 3.6)
> +BreakBeforeBinaryOperators: None
> +
> +# Xen's coding style does not follow clang-format already available profiles for
> +# breaking before braces, so set it to Custom and specify each case separately
> +# (supported in clang-format 3.7)
> +BreakBeforeBraces: Custom
> +
> +# [not specified]
> +# Break before inline ASM colon if the line length is longer than column limit.
> +# (This is a new feature upstreamed by EPAM during its work on clang-format for
> +# Xen)
> +# (supported in clang-format 16)
> +# BreakBeforeInlineASMColon: OnlyMultiline
> +
> +# [not specified]
> +# Ternary operators '?, :' can be put after a line break
> +# (supported in clang-format 3.7)
> +BreakBeforeTernaryOperators: true
> +
> +# (supported in clang-format 5)
> +BreakConstructorInitializers: BeforeComma
> +
> +# User visible strings (e.g., printk() messages) should not be split so they can
> +# be searched for more easily. (supported in clang-format 3.9)
> +BreakStringLiterals: false
> +
> +# Lines should be less than 80 characters in length
> +# (supported in clang-format 3.7)
> +ColumnLimit: 80
> +
> +# (supported in clang-format 3.7)
> +CommentPragmas: '^ IWYU pragma:'
> +
> +# Code within blocks is indented by one extra indent level
> +# (supported in clang-format 3.7)
> +ContinuationIndentWidth: 4
> +
> +# Do not derive pointer alignment style from the file
> +# (supported in clang-format 3.7)
> +DerivePointerAlignment: false
> +
> +# Taken from:
> +# git grep -h -i '^#define [^[:space:]]*for_each[^[:space:]]*(' xen/ \
> +# | sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  - '\1',i" \
> +# | LC_ALL=C sort -u
> +# A vector of macros that should be interpreted as foreach loops instead of as
> +# function calls.
> +# (supported in clang-format 3.7)
> +ForEachMacros:
> +  - 'FOR_EACH_IOREQ_SERVER'
> +  - '__list_for_each_rcu'
> +  - 'dt_for_each_child_node'
> +  - 'dt_for_each_device_node'
> +  - 'dt_for_each_property_node'
> +  - 'ebitmap_for_each_positive_bit'
> +  - 'expr_list_for_each_sym'
> +  - 'fdt_for_each_property_offset'
> +  - 'fdt_for_each_subnode'
> +  - 'for_each_affinity_balance_step'
> +  - 'for_each_amd_iommu'
> +  - 'for_each_cfg_sme'
> +  - 'for_each_cpu'
> +  - 'for_each_domain'
> +  - 'for_each_domain_in_cpupool'
> +  - 'for_each_drhd_unit'
> +  - 'for_each_kimage_entry'
> +  - 'for_each_node_mask'
> +  - 'for_each_online_cpu'
> +  - 'for_each_online_node'
> +  - 'for_each_pdev'
> +  - 'for_each_possible_cpu'
> +  - 'for_each_present_cpu'
> +  - 'for_each_rmrr_device'
> +  - 'for_each_sched_unit'
> +  - 'for_each_sched_unit_vcpu'
> +  - 'for_each_set_bit'
> +  - 'for_each_vcpu'
> +  - 'for_each_vp'
> +  - 'hlist_for_each'
> +  - 'hlist_for_each_entry'
> +  - 'hlist_for_each_entry_continue'
> +  - 'hlist_for_each_entry_from'
> +  - 'hlist_for_each_entry_rcu'
> +  - 'hlist_for_each_entry_safe'
> +  - 'hlist_for_each_safe'
> +  - 'list_for_each'
> +  - 'list_for_each_backwards_safe'
> +  - 'list_for_each_continue_rcu'
> +  - 'list_for_each_entry'
> +  - 'list_for_each_entry_continue'
> +  - 'list_for_each_entry_from'
> +  - 'list_for_each_entry_rcu'
> +  - 'list_for_each_entry_reverse'
> +  - 'list_for_each_entry_safe'
> +  - 'list_for_each_entry_safe_continue'
> +  - 'list_for_each_entry_safe_from'
> +  - 'list_for_each_entry_safe_reverse'
> +  - 'list_for_each_prev'
> +  - 'list_for_each_rcu'
> +  - 'list_for_each_safe'
> +  - 'list_for_each_safe_rcu'
> +  - 'page_list_for_each'
> +  - 'page_list_for_each_safe'
> +  - 'page_list_for_each_safe_reverse'
> +
> +# A vector of macros that should be interpreted as conditionals instead of as
> +# function calls. (supported in clang-format 13)
> +#IfMacros:
> +#  - ''
> +
> +# Sort include files by block of includes and not as only one group
> +# (supported in clang-format 6)
> +IncludeBlocks: Preserve
> +
> +# [not specified]
> +# Regular expressions denoting the different #include categories used for
> +# ordering #includes. (supported in clang-format 3.8)
> +#IncludeCategories:
> +#  - Regex: '.*'
> +#    Priority: 1
> +
> +# When guessing whether a #include is the “main” include (to assign category 0,
> +# see above), use this regex of allowed suffixes to the header stem. A partial
> +# match is done, so that: - “” means “arbitrary suffix” - “$” means “no suffix”
> +# For example, if configured to “(_test)?$”, then a header a.h would be seen as
> +# the “main” include in both a.cc and a_test.cc.
> +# (Do we have a main include in Xen?)
> +# (supported in clang-format 3.9)
> +#IncludeIsMainRegex: '(Test)?$'
> +
> +# Non-case labels inside switch() bodies are preferred to be indented the same
> +# as the block's case labels (supported in clang-format 11)
> +IndentCaseBlocks: false
> +
> +# [not specified]
> +# Do not indent case labels in the switch block (supported in clang-format 3.3)
> +IndentCaseLabels: false
> +
> +# [not specified]
> +# Do not indent extern "C" block
> +# (supported in clang-format 11)
> +IndentExternBlock: NoIndent
> +
> +# Due to the behavior of GNU diffutils "diff -p", labels should be indented by
> +# at least one blank (supported in clang-format 10)
> +IndentGotoLabels: true
> +
> +# [not specified]
> +# Do not create indentation for the preprocessor directives
> +# (supported in clang-format 6)
> +IndentPPDirectives: None
> +
> +# An indent level consists of four spaces (supported in clang-format 3.7)
> +IndentWidth: 4
> +
> +# [not specified]
> +# In case a function definition or declaration needs to be wrapped after the
> +# type, do not indent the new line (supported in clang-format 3.7)
> +IndentWrappedFunctionNames: false
> +
> +# Braces should be omitted for blocks with a single statement. e.g.,
> +# if ( condition )
> +#     single_statement();
> +# (supported in clang-format 15)
> +InsertBraces: false
> +
> +# [not specified]
> +# Every file needs to end with a new line
> +# (supported in clang-format 16)
> +# InsertNewlineAtEOF: true
> +
> +# [not specified]
> +# Keep empty lines (up to MaxEmptyLinesToKeep) at end of file
> +# (supported in clang-format 17)
> +# KeepEmptyLinesAtEOF: true
> +
> +# [not specified]
> +# Do not add a new empty line at the start of the block
> +# (supported in clang-format 3.7)
> +KeepEmptyLinesAtTheStartOfBlocks: false
> +
> +# The Xen Hypervisor is written in C language (supported in clang-format 3.5)
> +Language: Cpp
> +
> +# [not specified]
> +# Line ending style is '\n' (supported in clang-format 16)
> +# LineEnding: LF
> +
> +# Specify Xen's macro that starts a block of code
> +# (supported in clang-format 3.7)
> +MacroBlockBegin: '^PLATFORM_START|^DT_DEVICE_START|^ACPI_DEVICE_START'
> +
> +# Specify Xen's macro that ends a block of code (supported in clang-format 3.7)
> +MacroBlockEnd: '^PLATFORM_END|^DT_DEVICE_END|^ACPI_DEVICE_END'
> +
> +# [not specified]
> +# Maximum consecutive empty lines allowed (supported in clang-format 3.7)
> +MaxEmptyLinesToKeep: 1
> +
> +# Parameters to tweak to discourage clang-format to break something
> +# (supported in clang-format 5)
> +PenaltyBreakAssignment: 30
> +# (supported in clang-format 3.7)
> +PenaltyBreakBeforeFirstCallParameter: 30
> +# (supported in clang-format 3.7)
> +PenaltyBreakComment: 10
> +# (supported in clang-format 3.7)
> +PenaltyBreakFirstLessLess: 0
> +# (supported in clang-format 14)
> +PenaltyBreakOpenParenthesis: 100
> +# (supported in clang-format 3.7)
> +PenaltyBreakString: 10
> +# (supported in clang-format 3.7)
> +PenaltyExcessCharacter: 100
> +# (supported in clang-format 12)
> +PenaltyIndentedWhitespace: 0
> +# (supported in clang-format 3.7)
> +PenaltyReturnTypeOnItsOwnLine: 60
> +
> +# [not specified]
> +# Pointer alignment style is on the right 'void *var'
> +# (supported in clang-format 3.7)
> +PointerAlignment: Right
> +
> +# [not specified]
> +# The number of columns to use for indentation of preprocessor statements
> +# When set to -1 (default) IndentWidth is used also for preprocessor statements.
> +# (supported in clang-format 13)
> +PPIndentWidth: -1
> +
> +# [not specified]
> +# (supported in clang-format 14)
> +QualifierAlignment: Custom
> +
> +# Specify in which order the qualifiers should appear 'static const int *var'
> +# (supported in clang-format 14)
> +QualifierOrder: ['static', 'inline', 'const', 'volatile', 'type']
> +
> +# Don't try to reflow comments to respect the column limit (It helps to make
> +# clang-format reproduce the same output when it runs on an already formatted
> +# file)
> +# (supported in clang-format 3.8)
> +ReflowComments: false
> +
> +# [not specified]
> +# Specifies the use of empty lines to separate definition blocks, including
> +# structs, enums, and functions
> +# (supported in clang-format 14)
> +SeparateDefinitionBlocks: Always
> +
> +# [not specified]
> +# Sort the include files by name (supported in clang-format 3.8)
> +# TODO: enabling this will currently break the compilation, maybe fix?
> +SortIncludes: Never
> +
> +# [not specified]
> +# Do not allow a space after a type cast '(type)var'
> +# (supported in clang-format 3.5)
> +SpaceAfterCStyleCast: false
> +
> +# [not specified]
> +# Do not allow a space after the not operator '!var'
> +# (supported in clang-format 9)
> +SpaceAfterLogicalNot: false
> +
> +# Ensure that there is a space after pointer qualifiers, when used with
> +# PointerAlignment of value Right it means 'void *const *x = NULL;'
> +# (supported in clang-format 12)
> +SpaceAroundPointerQualifiers: After
> +
> +# [not specified]
> +# Always have a space after an assign operator or a compound operator, for
> +# example '+=' (supported in clang-format 3.7)
> +SpaceBeforeAssignmentOperators: true
> +
> +# [not specified]
> +# Do not allow a space between the case argument and the final colon 'case 0:'
> +# (supported in clang-format 12)
> +SpaceBeforeCaseColon: false
> +
> +# [not specified]
> +# Have a space before the parenthesis of a control statement, do an exception
> +# for ForEach and If macros
> +SpaceBeforeParens: ControlStatementsExceptForEachMacros
> +
> +# (supported in clang-format 7)
> +SpaceBeforeRangeBasedForLoopColon: true
> +
> +# [not specified]
> +# Do not add a spaces before square brackets 'int a[5];'
> +# (supported in clang-format 10)
> +SpaceBeforeSquareBrackets: false
> +
> +# [not specified]
> +# Do not add a space inside empty parenthesis '()'
> +# (supported in clang-format 3.7)
> +SpaceInEmptyParentheses: false
> +
> +# (supported in clang-format 3.7)
> +SpacesBeforeTrailingComments: 1
> +
> +# Space characters are used to spread out logical statements, such as in the
> +# condition of an if or while 'if ( a )' 'while ( i < 5 )'
> +# (supported in clang-format 10)
> +SpacesInConditionalStatement: true
> +
> +# (supported in clang-format 3.7)
> +SpacesInContainerLiterals: false
> +
> +# [not specified]
> +# Do not add a spaces inside a type cast parenthesis '(int)var'
> +# (supported in clang-format 3.7)
> +SpacesInCStyleCastParentheses: false
> +
> +# [not specified]
> +# Do not insert spaces in empty block '{}'
> +# (supported in clang-format 3.5)
> +SpaceInEmptyBlock: false
> +
> +# Only one space is allowed at the start of a line comment
> +# (supported in clang-format 13)
> +SpacesInLineCommentPrefix:
> +  Minimum: 1
> +  Maximum: -1
> +
> +# [not specified]
> +# Do not add a spaces inside parenthesis '(var & var)'
> +# (supported in clang-format 3.7)
> +SpacesInParentheses: false
> +
> +# [not specified]
> +# Do not add spaces inside square brakets 'int a[5];'
> +# (supported in clang-format 3.7)
> +SpacesInSquareBrackets: false
> +
> +# (supported in clang-format 3.7)
> +Standard: C++03
> +
> +# Macros which are ignored in front of a statement, as if they were an
> +# attribute. So that they are not parsed as identifier
> +# (supported in clang-format 12)
> +# StatementAttributeLikeMacros: ['']
> +
> +# A vector of macros that should be interpreted as complete statements.
> +# Typical macros are expressions, and require a semi-colon to be added;
> +# sometimes this is not the case, and this allows to make clang-format aware of
> +# such cases. (supported in clang-format 8)
> +StatementMacros:
> +  - 'PROGRESS'
> +  - 'PROGRESS_VCPU'
> +  - 'bitop'
> +  - 'guest_bitop'
> +  - 'testop'
> +  - 'guest_testop'
> +  - 'DEFINE_XEN_GUEST_HANDLE'
> +  - '__DEFINE_XEN_GUEST_HANDLE'
> +  - '___DEFINE_XEN_GUEST_HANDLE'
> +  - 'presmp_initcall'
> +  - '__initcall'
> +  - '__exitcall'
> +
> +# An indent level consists of four spaces (supported in clang-format 3.7)
> +TabWidth: 4
> +
> +# A vector of macros that should be interpreted as type declarations instead of
> +# as function calls (supported in clang-format 9)
> +TypenameMacros:
> +  - 'XEN_GUEST_HANDLE'
> +  - 'XEN_GUEST_HANDLE_64'
> +  - 'XEN_GUEST_HANDLE_PARAM'
> +  - 'ELF_HANDLE_DECL'
> +
> +# Indentation is done using spaces, not tabs (supported in clang-format 3.7)
> +UseTab: Never
> +
> +# A vector of macros which are whitespace-sensitive and should not be touched
> +# (supported in clang-format 11)
> +WhitespaceSensitiveMacros:
> +  - '__stringify'
> +
> +## Not related to C language ###################################################
> +
> +# (supported in clang-format 3.3)
> +AccessModifierOffset: -4
> +
> +# (supported in clang-format 9)
> +AllowShortLambdasOnASingleLine: None
> +
> +# (supported in clang-format 16)
> +# BreakAfterAttributes: Never
> +
> +# (supported in clang-format 3.8)
> +BreakAfterJavaFieldAnnotations: false
> +
> +# (supported in clang-format 16)
> +# BreakArrays: false
> +
> +# (supported in clang-format 12)
> +BreakBeforeConceptDeclarations: Never
> +
> +# (supported in clang-format 7)
> +BreakInheritanceList: BeforeColon
> +
> +# (supported in clang-format 5)
> +CompactNamespaces: false
> +
> +# (supported in clang-format 3.7)
> +ConstructorInitializerAllOnOneLineOrOnePerLine: false
> +
> +# (supported in clang-format 3.7)
> +ConstructorInitializerIndentWidth: 4
> +
> +# (supported in clang-format 3.4)
> +Cpp11BracedListStyle: false
> +
> +# (supported in clang-format 13)
> +EmptyLineAfterAccessModifier: Leave
> +
> +# (supported in clang-format 12)
> +EmptyLineBeforeAccessModifier: Leave
> +
> +# (supported in clang-format 5)
> +FixNamespaceComments: false
> +
> +# (supported in clang-format 13)
> +IndentAccessModifiers: false
> +
> +# (supported in clang-format 15)
> +IndentRequiresClause: false
> +
> +# (supported in clang-format 11)
> +InsertTrailingCommas: None
> +
> +# (supported in clang-format 3.9)
> +JavaScriptQuotes: Leave
> +
> +# (supported in clang-format 3.9)
> +JavaScriptWrapImports: true
> +
> +# (supported in clang-format 3.7)
> +NamespaceIndentation: None
> +
> +# (supported in clang-format 7)
> +ObjCBinPackProtocolList: Auto
> +
> +# (supported in clang-format 3.7)
> +ObjCBlockIndentWidth: 4
> +
> +# (supported in clang-format 11)
> +ObjCBreakBeforeNestedBlockParam: false
> +
> +# (supported in clang-format 3.7)
> +ObjCSpaceAfterProperty: true
> +
> +# (supported in clang-format 3.7)
> +ObjCSpaceBeforeProtocolList: true
> +
> +# (supported in clang-format 14)
> +PackConstructorInitializers: Never
> +
> +# (supported in clang-format 7)
> +PenaltyBreakTemplateDeclaration: 0
> +
> +# (supported in clang-format 13)
> +ReferenceAlignment: Right
> +
> +# (supported in clang-format 16)
> +# RemoveSemicolon: false
> +
> +# (supported in clang-format 5)
> +SortUsingDeclarations: false
> +
> +# (supported in clang-format 4)
> +SpaceAfterTemplateKeyword: true
> +
> +# (supported in clang-format 7)
> +SpaceBeforeCpp11BracedList: false
> +
> +# (supported in clang-format 7)
> +SpaceBeforeCtorInitializerColon: false
> +
> +# (supported in clang-format 7)
> +SpaceBeforeInheritanceColon: true
> +
> +# (supported in clang-format 3.4)
> +SpacesInAngles: false
> +
> +...


