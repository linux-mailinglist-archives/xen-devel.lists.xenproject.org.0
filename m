Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB16663BD27
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 10:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449313.705963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozx8H-0006Z0-L0; Tue, 29 Nov 2022 09:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449313.705963; Tue, 29 Nov 2022 09:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozx8H-0006WH-Hn; Tue, 29 Nov 2022 09:42:29 +0000
Received: by outflank-mailman (input) for mailman id 449313;
 Tue, 29 Nov 2022 09:42:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ozx8G-0006WB-6n
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 09:42:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 201092b2-6fca-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 10:42:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9436.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 09:42:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 09:42:21 +0000
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
X-Inumbo-ID: 201092b2-6fca-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxlEmKA9m7mcyFP66DhBcyZNVUqIb5z+TSZGbSFO/e6Xm6dePzEwb/IVq7VXY1DKVBAGuWNOoslNRSLic7GTYzrdxu1/gw2jgnTrVC7liqd1WPhr+uMn7CTs53w18G95NOzJZyInahCT+KiUTE6N3RmJX3jYyytSfLiydzKNULcwmnGfjMGnbMBsdgQJvAp4l91QF8ACg6KHcrQNqb1uKhnY5kgofXeJI1gltvw5OM7OKmYwgYDyu7q4zGKlu3k6vepeJ8tcErQJt4mZ6pY98SLcggMa2GosIjBmJ2tdJM2J3GwUdAdF/15lqbdZZfN4V7PGuaSS4lPVISDzu83x0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dmgb0WJLW4ak4TGCs9NLhwpQvw06caLPzbln007chRo=;
 b=ar9C83iqwXTNyy1fDpiCxY30nAXcFSRPHXfhVZngTzj/VAgP3FKPYmGlU6UxL24sjCPzUjdMGwsjZ/u/PEtQAenKY6D6pxRJYFpNXW2w/de3CT+9TjzRmUNRwRfvBqbg7KeXOL3Wl0Kj5fv9bQeVHzvPB/rQEO/A7BniTYtFZZDkE160paDjVOFJaK3XJe1u6Gv8/njk2UkmAPzTIg26M0LlJ4NyuMdwrAi54mcAl6g7+oY+k6V+Gi/OwQRswVyHg/P879wA7Xwr3zNS1MTP036OHO6SAudauc+n3NbKkoA+sSDUB0/FTDbMbL6HhZvRaiu3bkic0v81dlHKGnWL6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dmgb0WJLW4ak4TGCs9NLhwpQvw06caLPzbln007chRo=;
 b=giuqLn12JPiLFxpEJfGN+ykwxW99qfXh5bFxDBYxAz7ZUxGJzZbxa3YMTalqKIOCEHSXNjAzfvdd7OpsznHt4SGNCA7wpslljklJS5RR4ltuq6CkCfQ4mdpjDf1XUpDAwAXeHBbr9o7DnycZ7jsLjFN4DkxPWbOR5cHCqZwjpSKj/mIGMNfdgmooTj39gSBKueCfzncrvNTnsvl27sSwsCJBI01NpP5M63QBzpxyq8XiiN4NgRdBxaRZ1ExnSJD14VeAnUB4W7cP34xsA96C0kBiP2aTCumj05aMS2BR1bZRF2eVa0y+h+TeVYVgOoP2AS8/a1g5wDHhDpR0X5E5FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7da53010-56dd-8d91-fde3-9fde0d76125c@suse.com>
Date: Tue, 29 Nov 2022 10:42:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/4] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221128141006.8719-1-luca.fancellu@arm.com>
 <20221128141006.8719-3-luca.fancellu@arm.com>
 <1a0f27e6-1b0e-d5cb-7f3a-337b9664eb75@suse.com>
 <35743861-CF6F-4B80-AFE9-182D34678FC8@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35743861-CF6F-4B80-AFE9-182D34678FC8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: 9184327d-49e5-473c-5426-08dad1ee0367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MIDA9qG+G/5sqFhRbhbmDr1YY7fvsFbw0vKCJ59h7Wn/q15ijY/oHu2snbOIP3/g+Xr7wGkbenm5PKQjz+WIpz0azHu4Ah3JnFo9s+RBcvbfko0ZQO310+I/yVok2IiAyL46uxgOqQeAASA3e6DhFrENe7pZuCQMEVi/PF9E2q+aVqVmjc0/sykK25yUPZDfcgV3BUojHOFv6CF93rJN58jgoiB7ZCJdX2Q7P7TjNod04UDfoUrtUFTtClKhCUwBG/mETeJcgJo/jjAm5+W9BshOyn95ngoZ7tAfXfOs8knPGLJ7/qnGJzEncsVGDCLvD4KfZrsmCKLqsRdoZPIOCYWEAb0GB2o+cfH8ZIgtUE5zg/au4xoIEz/xFSZOu+Ge7TmfCo2tXFPMUHHKqDkIOedNFfAsEbZCxW6R52iCa3A3aO4i6I+yFS3q45m1t1GK87XnP3K33Gtu/9Y2lBKfy/okyRI0iS278AO77sJkz5dBKOSd62KwPt92QqvSmsEG9wK4DSxbui+OrVDSQHxjEBhqeNLussZbOOs+r3N/uVd7vUJzyrzjmvBdKGCUOJcxCatutBpfyRdEX2Omi8YkUrFiTWmA5E2V8PXkvvgZ85q8eUJSDpeHVajaBcfOGGmsqBfJj2/1ed1HgyrV2FEhuoVr7qH3ywmFyv2QAdeawClqm7I2h636cEMQ4A/SXX4asaiTIt4wigbqdqhAMKgGsqRzxc08bqTo0/WMheEsQBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199015)(2906002)(31686004)(4326008)(54906003)(41300700001)(6916009)(36756003)(66556008)(8676002)(66946007)(66476007)(8936002)(5660300002)(316002)(26005)(6512007)(86362001)(478600001)(6486002)(31696002)(6506007)(53546011)(2616005)(186003)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWt4dzgzL3NXckxsNU41VGtUWGNnZXc0S0RjVkw2MnZ0VFFIcGs0WnR6QXlY?=
 =?utf-8?B?Q0Z1WFBVUzREUlFCY0xQZW05RkhTRXhCWUx4N1VSdE9OTFpVVVJrZ0hzNVY3?=
 =?utf-8?B?Zk42aHBCaEpjK0JwT3lkckM0a1BXOWZ0bGtueFM2TGFyaEhSN3M4d0RyMXVv?=
 =?utf-8?B?LzE5MitwbFBYbThnLzRGMUpNVEZWMlhtQVEvQ1AzS2lJYXRva1JWSnhpeDdJ?=
 =?utf-8?B?c2RMcC96R3gxajI4T1lGUmtDakUvVFRLT2hYckl3VS9GNmhBZG04UGcrRm5v?=
 =?utf-8?B?ZS9XRmg5VVdQVXRZbHNBMVUzRGxhaEJJaDNSYXF6aDRaSi9KUjAyVG9XZlNt?=
 =?utf-8?B?V1J6MzRaRHlQYzlRcjRQdjJaTWdwUGxBWU9zNi9mYzRvVnpjT0cvNkwxcHps?=
 =?utf-8?B?OXBqbTFrZ3hjZnR3KzJNbytFNzNUb2tUZXFnbVBqUGY0b1R2L05yaGx3dkVB?=
 =?utf-8?B?bGlOQjFtV3VxWjJNTDJxajB6MkVpdWthclVQakN0TDdPZHR2SDBlRWZHVDZJ?=
 =?utf-8?B?eVdreDhnc2xpUVZCVDNYS2ZCZVhoM0NDN0pONmpKUURRcTI0SytITzM1bzlC?=
 =?utf-8?B?ak82b1RPZ04vK0JjVHNTeTYrTlpCZ2lycEM5aVA5WXhwRCtqRURwdkhza043?=
 =?utf-8?B?M0RVVjl5TTRqRGpnTmlQaVR4OVhKb2l1c0NNMC9FZEtHZnFpc3QwaDM4VkJX?=
 =?utf-8?B?V0ZVRVgyVjBGMG0zYzNPb1Mwek9qbFlrc1JXNm0yTEMxSDJMWXpaQzhyVStK?=
 =?utf-8?B?SmdRT1lsdzlMS2JsVkNocHZXNHNHSkJLVXh4NU0rd2VYUjFtRUMvY1F2MjB1?=
 =?utf-8?B?S3dZUnVBUXR5ZkJwUFBnM3k3ZzUreUVoUmUyQUlUK1E5SFRhOVUxSnVWS3Mr?=
 =?utf-8?B?N2o3QVRCajRJaDdVWGpUOUZkK21OOEp1YlFNUGJuQTJDWXZMMkJPd2xicC90?=
 =?utf-8?B?TVJJU0tiMUh6SVlubldPMENUN1U5N1VHK29uZURJMG4yb1QzK0ZOTjY1d3NJ?=
 =?utf-8?B?UU5YdjZzaElUcEhLMUZTRFU2RzNjVGpBTklVMHNHd3hyNitYS3poTmxYcTFS?=
 =?utf-8?B?NlV3ZnNyUmF0YWJKT0Q0TWRvNDIzeGJOeUJOMmovR2xXOVViWVRuK2pRV2lO?=
 =?utf-8?B?QlpNZVRQUTZpd3ZPNnZ0emh5ZXhlMHVXb2J5eUNIVXNuTGtnYmo1NFBhQWlk?=
 =?utf-8?B?WWI1V0ZKems4dDRGbndlUjBuN3gzd0YyNWFJWE9KcFQ2Zm5USGlIZUJzN0JQ?=
 =?utf-8?B?eHJLRmVrVXFKQ05aT082SEk3enQ3aFJzRHNkV0tyZTRTQzFOTGlYOXhMZWpC?=
 =?utf-8?B?TUx6TW90TkYrQ1hxR0xwL3NNVHNiSG83MlZYS2hjb0N0Nyt6ZHE0YTV1NTk3?=
 =?utf-8?B?UDZiK2JxaGNnT09BSFZxZWowV0VlRXgvOXM2b0J6US9BeTJnMHV1cWZFODAz?=
 =?utf-8?B?NHpad09Lak9EenZSblQ2T002MGl3dUgxbGYxTWVOVFRQWlZYSk1PSUxxTkpk?=
 =?utf-8?B?Q0FCK1hMM3hTZEo0Z3FZRzFidXRKTUZDKzhldDFicDNjbjJYMWJLck9iZlpC?=
 =?utf-8?B?L21tNmdWd1ovcG9wQXFEcWQ4WnVFTlBVUjZpRUVRelZEY1p5M2VFWUpNZXlh?=
 =?utf-8?B?Z1d0TVdNSlR2T3g4b1Q4bFkzMmNKSXBSMjRNQ292eDJ6WkVVRWR0VThlR1Nx?=
 =?utf-8?B?QWlQbnNTKytubFcvME1vODRZb0JGUUpsVkNaalJaMGpzdzhWK0c5RERUTW00?=
 =?utf-8?B?L0RFTGF0WkZTcXMzcjltd2NqUFludVJIL1RnMzgveTI5ZXUrS0RTcjFvcVpM?=
 =?utf-8?B?NU0zcnUzR0ZCZFdUMXBocmVFT2dxOHhaZjdWWElxRjY3RzZiOHBpS2VaL3BE?=
 =?utf-8?B?bVRnRENvdVl3aFIwOWdmYWsrV0JMM1BpQzdjZlp2OTgzM1dNYW00UnNEV2hR?=
 =?utf-8?B?dHp0bzNteHdUcEVrQWNoaklUTExiTGNBeWhhcTdaMHZKZnIrN0wzVERoeEZj?=
 =?utf-8?B?TVZYTkpFRWpVZU5NenhIOHBEb2RKME9iMno5ampiNHVPaHBWMVRWREM0amg2?=
 =?utf-8?B?NTZ3b0o3R2U3S0ppNWhKR3JpNy83TTlJOTZTdzVvdGNHMTNrdXFibVh5UVZq?=
 =?utf-8?Q?Fk+WIQ0DoMQC2BsEAlCWsux4W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9184327d-49e5-473c-5426-08dad1ee0367
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 09:42:21.6808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nu7LufalcNFmMCdZvDzqIK4F0716nVQ6fR14+jJZUM0bmE3EkW4ezOljz+J+NK7HdY8AP3cqZElm0xG2Hb+HAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9436

On 28.11.2022 16:37, Luca Fancellu wrote:
>> On 28 Nov 2022, at 15:19, Jan Beulich <jbeulich@suse.com> wrote:
>> On 28.11.2022 15:10, Luca Fancellu wrote:
>>> Change cppcheck invocation method by using the xen-analysis.py
>>> script using the arguments --run-cppcheck.
>>>
>>> Now cppcheck analysis will build Xen while the analysis is performed
>>> on the source files, it will produce a text report and an additional
>>> html output when the script is called with --cppcheck-html.
>>>
>>> With this patch cppcheck will benefit of platform configuration files
>>> that will help it to understand the target of the compilation and
>>> improve the analysis.
>>>
>>> To do so:
>>> - remove cppcheck rules from Makefile and move them to the script.
>>> - Update xen-analysis.py with the code to integrate cppcheck.
>>> - merge the script merge_cppcheck_reports.py into the xen-analysis
>>>   script package and rework the code to integrate it.
>>> - add platform configuration files for cppcheck..
>>> - add cppcheck-cc.sh script that is a wrapper for cppcheck and it's
>>>   used as Xen compiler, it will intercept all flags given from the
>>>   make build system and it will execute cppcheck on the compiled
>>>   file together with the file compilation.
>>> - guarded hypercall-defs.c with CPPCHECK define because cppcheck
>>>   gets confused as the file does not contain c code.
>>> - add false-positive-cppcheck.json file
>>> - update documentation.
>>> - update .gitignore
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>
>> Just two and a half questions, not a full review:
>>
>>> ---
>>> .gitignore                                    |   8 +-
>>> docs/misra/cppcheck.txt                       |  27 +-
>>> docs/misra/documenting-violations.rst         |   7 +-
>>> docs/misra/false-positive-cppcheck.json       |  12 +
>>> docs/misra/xen-static-analysis.rst            |  42 ++-
>>> xen/Makefile                                  | 116 +-------
>>> xen/include/hypercall-defs.c                  |   9 +
>>> xen/scripts/xen-analysis.py                   |  18 +-
>>> xen/scripts/xen_analysis/cppcheck_analysis.py | 272 ++++++++++++++++++
>>> .../xen_analysis/cppcheck_report_utils.py     | 130 +++++++++
>>> xen/scripts/xen_analysis/generic_analysis.py  |  21 +-
>>> xen/scripts/xen_analysis/settings.py          |  77 ++++-
>>> xen/scripts/xen_analysis/utils.py             |  21 +-
>>> xen/tools/cppcheck-cc.sh                      | 223 ++++++++++++++
>>> xen/tools/cppcheck-plat/arm32-wchar_t4.xml    |  17 ++
>>> xen/tools/cppcheck-plat/arm64-wchar_t2.xml    |  17 ++
>>> xen/tools/cppcheck-plat/arm64-wchar_t4.xml    |  17 ++
>>> xen/tools/cppcheck-plat/x86_64-wchar_t2.xml   |  17 ++
>>> xen/tools/cppcheck-plat/x86_64-wchar_t4.xml   |  17 ++
>>
>> What are these last five files about? There's nothing about them in
>> the description afaics.
> 
> They are cppcheck platform configuration files, they help cppcheck to understand
> the size of the types depending on the target of the compilation.
> 
> This section in the commit message is to introduce them:
> 
> With this patch cppcheck will benefit of platform configuration files
> that will help it to understand the target of the compilation and
> improve the analysis.
> 
> Do you think I should say it differently? Or maybe say that they reside in xen/tools/cppcheck-plat/ ?

Perhaps (I didn't read that paragraph as relating to _anything_ in
tree), e.g.:

With this patch cppcheck will benefit from platform configuration files
that will help it to understand the target of the compilation and
improve the analysis. These are XML files placed in
xen/tools/cppcheck-plat/, describing ... (I don't know what to put here).

Please write the description here such that people not familiar with
cppcheck (or more generally with any external tool) can still follow
what you're talking about and what the patch is doing.

>>> --- /dev/null
>>> +++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
>>> @@ -0,0 +1,272 @@
>>> +#!/usr/bin/env python3
>>> +
>>> +import os, re, shutil
>>> +from . import settings, utils, cppcheck_report_utils
>>> +
>>> +class GetMakeVarsPhaseError(Exception):
>>> +    pass
>>> +
>>> +class CppcheckDepsPhaseError(Exception):
>>> +    pass
>>> +
>>> +class CppcheckReportPhaseError(Exception):
>>> +    pass
>>> +
>>> +CPPCHECK_BUILD_DIR = "build-dir-cppcheck"
>>> +CPPCHECK_HTMLREPORT_OUTDIR = "cppcheck-htmlreport"
>>> +CPPCHECK_REPORT_OUTDIR = "cppcheck-report"
>>> +cppcheck_extra_make_args = ""
>>> +xen_cc = ""
>>> +
>>> +def get_make_vars():
>>> +    global xen_cc
>>> +    invoke_make = utils.invoke_command(
>>> +            "make -C {} {} export-variable-CC"
>>> +                .format(settings.xen_dir, settings.make_forward_args),
>>> +            True, GetMakeVarsPhaseError,
>>> +            "Error occured retrieving make vars:\n{}"
>>> +        )
>>> +
>>> +    cc_var_regex = re.search('^CC=(.*)$', invoke_make, flags=re.M)
>>> +    if cc_var_regex:
>>> +        xen_cc = cc_var_regex.group(1)
>>> +
>>> +    if xen_cc == "":
>>> +        raise GetMakeVarsPhaseError("CC variable not found in Xen make output")
>>
>> What use is CC without CFLAGS? Once again the description could do
>> with containing some information on what's going on here, and why
>> you need to export any variables in the first place.
> 
> We don’t need CFLAGS here, we need only CC to generate include/generated/compiler-def.h and
> to pass CC to the cppcheck-cc.sh --compiler argument.

Hmm, I see that include/generated/compiler-def.h is generated already
now without any use of CFLAGS. Which looks suspicious to me. Sadly
the uses in xen/Makefile are lacking any details on what this is for,
and Bertrand's commit introducing it doesn't explain its purpose
either. Maybe again something entirely obvious to people knowing
cppcheck sufficiently well ...

> Would a comment in the code be ok?

Not sure (yet).

Jan

