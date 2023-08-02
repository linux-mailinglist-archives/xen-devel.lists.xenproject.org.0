Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31176C6CB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 09:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574740.900300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6Gm-00052B-Bc; Wed, 02 Aug 2023 07:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574740.900300; Wed, 02 Aug 2023 07:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6Gm-0004vZ-7b; Wed, 02 Aug 2023 07:27:44 +0000
Received: by outflank-mailman (input) for mailman id 574740;
 Wed, 02 Aug 2023 07:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR6Gj-0004tM-S5
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 07:27:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f7a321c-3106-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 09:27:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8343.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 07:27:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 07:27:10 +0000
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
X-Inumbo-ID: 0f7a321c-3106-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLJ1bccHBmM8NFJvdgXz9YumDHKh1xh76rscYl8UkkX1Sa/KXtfteUA5P1I0hOt0tu8SW0arXi3Pe4wZ8tLhsI4LI1JtCzZPUfNnnau7pLMlxjyc2bwshmQ92OVsdoG8HPddg8P4uiNm70snzjfZFyowbU4Fuz33BaBBhtP5ZFusIo+U2jo/F13w0C/2Jf1cHnemYM7O7ozPU9TsCvd9hIBajAc2jCO/BvrQpzXJfCdQFteGhFKWXEerQ9pnoO5KYt9PGKyqsz1jGD8Q4GuL/VnKFB24kt1crLx9i2pcwTTvjIr/V/q07gL/FE/mlAGCkav0vhUr50kPz7QMsogJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pRboXmPxAwZ6LRmPy3jmICi5TEhvx+Bu2Lh7GmNhJs=;
 b=dq7hDxBgh+B85l3t3GtP332ayiZdUp8OoU2Tfb3jLRle1f8dg54FTZmdpMV8G+gGJ+mKU37ZbZ3yqbdVdkLjV7wktOEdcE1jSCWqcTGnhgqz9BFSZozJoAXe0Mwq372yNzy0gzdJ72EJsyb/peFRkKLm5Y9G7QDKTwpku7ZbZKDlmmnI1CyBhcL1o/dumOzZ5mXiKws5oCGOVZ1z1mxbAo+mj5shyCHpFhBom7WxDwVQe6UHvMra9s0OcbXeWzoc7qME4g4FpUwgrRRA98DkQ+O2pXHJL55yMWL7XVBsnMMOU1fwUTtWXhFAj37MVFRWqFDAHEGcVohHAM/0DcMgog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pRboXmPxAwZ6LRmPy3jmICi5TEhvx+Bu2Lh7GmNhJs=;
 b=2DQ1yXe7ZIWvFMCJAAm7if3/xI47C8MMbrXjoYY80Jl2ZwbkCzZgwF65ZObGDwHHmU6A8kkCHDCpL+FI4IjbwAw875sBeLyQIXWiJoNQckZenUsnyX8VdnAZXFO7gMQGNNs0ZQJ/v4uOoV94V98yHnvtyE2Js2fw2GwXfjy0ZKZuuc9JtCVEDQaqadZSu1oDWHmo7ZWPwyrQtPQLJFYqC/m4Po/i8YdCg9HCmRlmlXR1CH6sTQzVwNcUClCgYTGY7KpGrotVbQ0qOjffprFNLl2DrwTItdnO4FqCQsqAfxn9t6Y23Jr8X/zxCDvwPhnVb/84laJ6IeGnOF5RNdjOVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ce3a936-e35e-caf6-b197-66441292bb9b@suse.com>
Date: Wed, 2 Aug 2023 09:27:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/2] fdt: make fdt handling reusable across arch
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230801161409.25905-1-dpsmith@apertussolutions.com>
 <20230801161409.25905-3-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230801161409.25905-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: c568ad1d-6076-4e58-c428-08db9329e258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MxEXircvWrdY1uffGuTQ/+ZsfMX+94uzQRf91bTCcZJMcf9WEkXU0ayN5Qk845jgJJc2TCg3loH5sIAhakft1RApCeiX1SAt71gDXTQuZPMyNKGRSi6vlX2OAZKm7NPi7woUzpTGB11AOmmCG9yFfm6w84sT54zxQWvweNFOMaRrxilSASvliJ0vpca0h3vW1Akr3AUNvDqW/vjuXpvKxUtcM+yoZ+kdxf+O97Wu2QWgTkPjYngj+aDHgwQ08/cBi5mh/kvH27QGrtsxaSD/RZFhz7hD3gaHTmV9aq02LaVdor7rJT96h+KvCBxMeafSuVqRag2QFrG8Iw7QPEOnWN7RJpjHntSH7sKxjB0t5JYlB5vLRDzYj/8qt50KCLE6OY/9rVGkdJ/W+zKvJHf67YILiLQtWKDr4iGRSKcqg6P8IOdWvfdAYonaxKS1rdLOazlTP/uPOke8Mykjakgije4KLxbts027qEbeKYaz0R+vcIld15ZG4LA28cFddP0VK2VIzrC0XV5Pk8S+H+bypUYLIrUnOu1aujS87iVNA4CjdwQQWOtSIx+5tH72+Cyw1hlgaLpS1qyioC1yT67tLLRv0x4UF4mcdJFHgkN1KEBHQNetsKZ1/jCmUQmoB/0jKgBXmvbIr7eI6+2FoA6JtA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(2616005)(186003)(6512007)(316002)(86362001)(478600001)(54906003)(38100700002)(66946007)(66556008)(66476007)(6666004)(6486002)(6916009)(4326008)(31696002)(6506007)(53546011)(36756003)(41300700001)(26005)(8676002)(5660300002)(8936002)(2906002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHBZc3RPdFVLRWtrcnZ6emlib29ndEx5UUtMZzFZQnVidVZReFYyQTdPOVFt?=
 =?utf-8?B?RUFob1orajltWU1mcUVjaWRCZDJINFkxVlRIOVdXQWI2TnlzT2lyL3d4N2Jy?=
 =?utf-8?B?bEw1WHoyM3FPcThsc2Z5Rnh5SGpKU1hQNi9ZTU8yUk1NcDZlTjNWRW1hdTAr?=
 =?utf-8?B?V3VwbHkwQVl1UzFUT21mYzl4MGl1RmRPWDV0cytDQUgwNE0ycWFwYUtibUU4?=
 =?utf-8?B?N1BadVV5UjlOb3BHL0lLSjhTT1ZRU2lnOW5XNlJFVjdwbzRhQ3liZ2hQdnVQ?=
 =?utf-8?B?a2V1V1JFRDJjOHB2OWduVlV1TjRyc2ZEL3BkaDZVWituUXdQY2ordXpUMlAz?=
 =?utf-8?B?WmhxS1JISTdHNUJLSGR6aDA3YWdnVmVwNVVKSk9XMjFzcUxSVDB2bEFqRkNp?=
 =?utf-8?B?TE1VcGVvNTVYVXVUYnhZMVhBZEhXU3VzQlo5ZE9qT0NvTk1VWDEyQThRNXBZ?=
 =?utf-8?B?ak42RFlITEg1UlVQNWo2RWo0R3Fvd1o1YzF2WDJrQWNSblJPRm1KZTU0RGUy?=
 =?utf-8?B?MU9vWjhoSXNsM2Fac3g5a1QraGJTSDBNalhUTUd3ZG83L01QdytIS0xJOGJT?=
 =?utf-8?B?VFptaHJCVm9pTUMxcHZIa2RZR2N4NFJSU2huN0NjYlA3cTFhZzkvTXBmS0lV?=
 =?utf-8?B?T0lXWEI0ZGdWZityaHhTYWZ0TGdpRGZUY0lITlUraWZycm9hZmZXSCtobnJE?=
 =?utf-8?B?b0VGSWdELzBrNnNwclNVYndVVC91VE52L2NxeDFmdU5URm5HRHVxV2R2NU9W?=
 =?utf-8?B?VDVzRmQ4S2FCd2VRNmNGQVZpUnFjUDErbDhpMEVMTlJqaFNSUU9Mc2Y1clNU?=
 =?utf-8?B?amxyMU55TFdwNGQyQVVjR0ovR2VlN3RIa1NCRTlGTjlMdjFLOVhiSm9DcXAw?=
 =?utf-8?B?ZlJqMmFvZ2RNcnNOK1Ayb2pCeU95M1YwYlVpTUtZNkc5S05pT3d6SlhpZWpB?=
 =?utf-8?B?MTZKYVVUK3hDWi9RUDBhQlNQQUp0QlpkZlpKSjNOdFphUG12Z3p1V2RBVDEw?=
 =?utf-8?B?MW05MVJxUjNXdDZ4dHFrb0RmVE5UUXdCQUF0WEE4NzlramNZTXZlQ3lObU1V?=
 =?utf-8?B?WGhaa0diQnMzM1lJTzlLTWxnaFl4N1JyL0U3Y0RobkljWmxySGN2RHZKdFhz?=
 =?utf-8?B?VnljbTBtWDQyTGtUQnpQNWQvTVhWdEd1VnVKTytWMU5sZUxtdUtlQWlRRTlS?=
 =?utf-8?B?dlBYY3JBVGxZV0d1T3pjTWxPWnRUVEIzbDhWUmVpVXZKbys0Ui81QWcyRi9v?=
 =?utf-8?B?aTdJQjNqQ2dianBOa0grRVJOb2l2SUdkaklVVCszd2k1Q0o3YmVLYUxuVHRB?=
 =?utf-8?B?dGtKSEZQRWVBRSsvam5HY2dpZW9lcUp4Vit4OUpybGI4c001QTQ0S0tOWmhD?=
 =?utf-8?B?dnBxL0xHcncrSGpPdjdoYVl6MW5NdTdjRVFFRWwvUngzWXc1S2JGaVI3bk5z?=
 =?utf-8?B?aGhzcHJISkw2YWY4cHhteElhWVZUSFo1OG8zcmhaZEN3YWdhQXE2TUtCZTFU?=
 =?utf-8?B?TzRvRzVEbUs1eHhyaHVVL2NuazRQN3pUM3ZvbFlabElJV1FQU09TSCtwOHJk?=
 =?utf-8?B?dUhnL2VJYzhtQndCZmtoTUJnTWl4UGNSUXVIRlZEaUVueit0RUt2N3BpbHhJ?=
 =?utf-8?B?cmN0SU5uVGFKUGpZSXlIaXp4WE1odS82QTlFbWNYa1p1c1FtTGZwbE9TSWxG?=
 =?utf-8?B?SUZWcmJtbzNVemRUY1Z4VnpaTTh5MFQ3RmZkbmgyRzgwZTB3UkFlK1ZBbWcr?=
 =?utf-8?B?cHVja1dGYXJoUU51amFEY09tM2N3ZkZ2NmY5MlFRYlViMW9iVURSZlRUTUlt?=
 =?utf-8?B?VjZQTUhKOWt0MVpQcVZHYTN2cEQvejUvVHhWamcvS2FNekg1MEhWL05ZR1Zh?=
 =?utf-8?B?a1dVejVSek9WaVlnRU9oYVhWbSt2NGc2WDRnWjF0ZXMrdk9lVXNMdFpEZkVZ?=
 =?utf-8?B?OVBCQkgyQ3AwYkhML0ZFcURBWWQ4dXprWFRiQmdrZ0VLdlo5ckVsS0pXNjNG?=
 =?utf-8?B?ZVFJRG9tcTRjVzZCWGxvYlM0ZXFFUXdJM3pLa2NiQURERDZ0MkVVODcrdjdU?=
 =?utf-8?B?MkZhWmdIa0ZDT1hFT3lMNVdBM2tzRXBIcTB3Vkc0N2JFSFA0ZmRkcGVUaXVD?=
 =?utf-8?Q?gvv6R8M5te79WTYZwwBQPO+y8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c568ad1d-6076-4e58-c428-08db9329e258
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 07:27:10.4475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgKh/Q3e6lyhwpQwZcgYndj/ZVWD+lQ6vl7OfLMZ7th0kW1iN1XZjxf1dUtD9PmTGz8SPhyjqL09kiWFyBjxLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8343

On 01.08.2023 18:14, Daniel P. Smith wrote:
> This refactors reusable code from Arm's bootfdt.c and device-tree.h that is
> general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
> introduced for when the ability of parsing DTB files is needed by a capability
> such as hyperlaunch.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  MAINTAINERS                   |   2 +
>  xen/arch/arm/bootfdt.c        | 141 +------------------------------
>  xen/common/Kconfig            |   4 +
>  xen/common/Makefile           |   3 +-
>  xen/common/fdt.c              | 153 ++++++++++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h |  50 +----------
>  xen/include/xen/fdt.h         |  79 ++++++++++++++++++
>  7 files changed, 242 insertions(+), 190 deletions(-)
>  create mode 100644 xen/common/fdt.c
>  create mode 100644 xen/include/xen/fdt.h

The filename here ...

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -303,7 +303,9 @@ F:	xen/common/libfdt/
>  F:	xen/common/device_tree.c
>  F:	xen/include/xen/libfdt/
>  F:	xen/include/xen/device_tree.h
> +F:	include/xen/fdt.h
>  F:	xen/drivers/passthrough/device_tree.c
> +F:	common/fdt.c

... don't match the additions here. Also please insert in alphabetically
sorted order, ignoring the previously misplaced final entry (entries),
unless you want to take the opportunity and get things properly sorted
again in this section.

Jan

