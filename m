Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C69727D64EB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 10:24:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622690.969753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZBY-0002s3-3T; Wed, 25 Oct 2023 08:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622690.969753; Wed, 25 Oct 2023 08:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZBX-0002p4-Vq; Wed, 25 Oct 2023 08:24:15 +0000
Received: by outflank-mailman (input) for mailman id 622690;
 Wed, 25 Oct 2023 08:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvZBW-0002n5-Jp
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 08:24:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e07d0143-730f-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 10:24:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8288.eurprd04.prod.outlook.com (2603:10a6:102:1bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Wed, 25 Oct
 2023 08:24:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 08:24:10 +0000
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
X-Inumbo-ID: e07d0143-730f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmnYst3sPcwQaRG6T2TPTiMBir2bVZFPsMix+JV7zfLgTs/6ohI14THXqB3tEJEpVyeowbwkJn+4vP+cQOGl0nQBF1cr5VgMiUujmubr1a3LKZrppfXY6be7y/FlCKL05k3rMGsItuii//QXa+LFviGMdEUqMNjEKDlaz+QCNg0Ljl85wAPboGfFsVn5t5pPZUNTxPaPnhGF07pCR0nvD9ed2nlooeXffybxiQOQUslYSfxY3AbhvlvFLHNrltnvoDpeLL4ovgStE2Elm55yhP4mNyod7WRMpK6SoP5zcBD4+NQfxns9tEldAveQZYK89HPk1HdbnLrHsxBMJ6VTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OH2YBTXjJvyR02M51SEUYn+nvjE5otLRzJjOliwPOZo=;
 b=hhPpL2jeICn2LjN5p/oRKtiVaVk9yzeTIpv2tNPxdfo998rdajpo+dj/RD+pu5MshcANLK1iEtciF7lkM6LMXFsbIW56EDxhNsg0KPqndunVx6SCT12B4zo1YfpvIPNopQrdLYHLAC3ow1k2z7baQT60cwkfnsm0u8sRIkKvepntygTaIhY6+lG5JI3of53JgW1mzsrpt6azBPNRHU8T4j+QydEM6gm+Q97EkB19CaGMFef+b39kUAbYubfMbjcAlnsJ3c0+iUCJcUT6hceGNCLJYszkSDKABgePBcI5ddF2DPUZ3w4P3F+QZ3DpOoqYfZBnsmTTd/N/uU/tuXNalQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH2YBTXjJvyR02M51SEUYn+nvjE5otLRzJjOliwPOZo=;
 b=18ZVH3Fq6jqRZXzZj1AFnO3S+sJBGE/fB0vo5lb3zYZW8A/rssn3Yv68mDGbRoxhtXAHDRAygImNQK5BIGO3nDs19llolU58ozbicc7xl3btA8fqDirKHujE177SIU3q2O2mZMrbxJhIAkye8MNQzZRyTsi8nYj/UwdIynw/GKBdQnNHhK+G8vnAdwIyzpEtsbKuajxk6lPjauTXnkqYDO7N1rOHg45iE+0ChbNw5xWaSURW6kryjtosNaqzAi+nQVb5BOqsDv4ajyrihbQ10IYMHPPNridmTr+ehG78hOXZx+7yTSzIVlSf80vSoDBoVB5NezLx1rtQ7/VykMzuaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78107fe9-de43-30b8-7423-240450bc0da8@suse.com>
Date: Wed, 25 Oct 2023 10:24:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3] xen: Add deviations for MISRA C:2012
 Rule 7.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <5e0f1bcd7b4325141e64a3c2d581034956b42293.1698136547.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310241329390.271731@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310241329390.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0276.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ec5f64-6955-4446-86b2-08dbd533c389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xS0XNMO9UQprR5saE4OAbBGPOhyn2hRFbIdhRhss83ekjamB/3SGnbugInni1ddEkIEIktclDOpuHTv/GAM5G+ALyI+bQjtlmLWum6WNNnvzeG08T3yxFnyrvydGjD5aHk2pE43YbInUmC9aqbZQWqq2xe5e8KEEi/ztyI7JHN7wZQJ7ksQ7f+KvBbA180XOeoj7BghqMVy7u2m6JR5pW2ZPcDm3LjmjyPTeDwPLRD3GeViF5aQNayUPpFJ+yqmNTBRdhM5Q+u8JFIWXAJh3w0Po9PVM+uktWBeml6SgOViTvjI/kyVR7nfV75fkWvsf3jasRIOv+xVLUjVYzCG6FBL3tVmkTRUIAxkSQ7Hids7Xvj+6xOY81bsvIjMGsRoqYw1XnnkEookTDwNADlijXPSu6tORWg+x5Dxr610+0X4oZV/ykEh/9kNLByTCdwzajP0GNdHjrgRP3giUPRJcE3gXPRi3eIqszJHrCkNsVX4q66Yfkh+GCOeGPASRM9FCTY44ljHVBegDG5iblO6yCxDMB+DMr38DXzuoRYXvfniTkDrwkgHdZbxRmNdQs0rGDXk2RZxpTQaV+8NZQ2Nr/CEO/aCfldBl+8uc6JjDAGqYKnaCpDvT8WtpT8k9AQZAjVJgf/+b5VNGDtEYHoOFXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(376002)(136003)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2616005)(36756003)(26005)(53546011)(6506007)(38100700002)(6512007)(31696002)(316002)(6486002)(86362001)(66476007)(66946007)(6916009)(66556008)(478600001)(54906003)(83380400001)(31686004)(41300700001)(4326008)(8676002)(8936002)(7416002)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXA3VUo0Y0o4OUFrR0RMU2VsODdPaWpFTGtLVCs1bGsxdTZWSDhXdzhFcmdz?=
 =?utf-8?B?Ni9ZT2RTQ2ZnRUFsa0FmNzNHbFU1KzA1NVVyRXpLUEd0a3NReFlmUDZpYS9z?=
 =?utf-8?B?dDZrb3JVMWRXdVpEZ1FreGFyVEovK3VXM1pETTBSZDc5SFlycTN6TnFMa1Zm?=
 =?utf-8?B?a25iSUxJMzB1WVZzbmxhbzZtQTZFK3VQOER0RTcrU2VNZGJYR0gzcUs0MUE0?=
 =?utf-8?B?OHQyckpkZHZFeXF5OXdUbndraGpvS2szMU05UThMeTJCZ1E1SkR3K01Xa3ZM?=
 =?utf-8?B?bVZxcTdjaWtHdEVqaGdrS2R6eEhTckhaWld4WEdNUGsvSlZ3N0ZrZFNKdStw?=
 =?utf-8?B?WThLMHJ5YmNocUZJRTB0QUppbW1KMjRsejhlMlR0QzJhYlJZLzBOcWtMeTlQ?=
 =?utf-8?B?ZXliNE9JRFFVd0lwR3p4RHd6TkIvVlNJcXJHdmVlSms5MzhLVm13ZkNHU0Ux?=
 =?utf-8?B?MS8vczRCRUYvdFA5ckozZUdPS3pWVE9aQ24zQjdUNTlXRENKMFo3a2JnSDVE?=
 =?utf-8?B?WHkwT2IyR25zdHVWMzZCMFdCNUdwWEg5elJqSE51SGhTTnYvTnNaOTVCaXFy?=
 =?utf-8?B?b3NIU09yR0JDYU5pdE9ESmlKdEs2SFR5aXh1QlhFNU43Sm9CaXV6YzU4ZEpG?=
 =?utf-8?B?cjF5YmE4L2JDZXlYMy9JTWEyRnkzMHFXYUQrNzM0dW8rbU9ia0tRMzcwclAz?=
 =?utf-8?B?Rzd3NjFVMlRjaTZCK2ZXem1RYnhRUW1rbmh0bnJhWnVjdXdQZjJhWTZMU05j?=
 =?utf-8?B?YU44R1VJdVRNcTQzZU5zanV2eE42YmMvZU5BQm1KVTZFYlFKcGtsTGhUMDRD?=
 =?utf-8?B?MGdLTkpRMlI1dCtab0xZVkdJMDV4Y0huZUhXWnpreE1CTTd0cUlxcmY3Z3V2?=
 =?utf-8?B?TndQZFFoelZIS1MwMUlscUlQa1h3Rkc3VHl0c0N3N1EvcmtjOEtoN3RwWXl0?=
 =?utf-8?B?ZVAwV21EcGNSNmRSYjFaR2JCV04vOVpickRNWXJzYzFpdEo3QU9TNEFTd1o0?=
 =?utf-8?B?bHVmQ093SXE1dUxlemxORGFVSFdLeTNnWHZlNjlGNlFKNjNVa2lySXdPUmh0?=
 =?utf-8?B?NC8xK1l1Z2FabGRGSUZiWEU2bEx5bk4rVTQvWXNkanhaaWkyK0c1UVk0QjhO?=
 =?utf-8?B?M041bkhDWGRPN0F6WkxYQyt1QXByTlZsMklhRDlxRjZ3bFZOaTFKZDdKS3JK?=
 =?utf-8?B?YmZ6RExHYkVqazV1cnArNGFocjdvbWRtMEE3Y04vNFZLQVdVaExaaFBseC9L?=
 =?utf-8?B?OFNGTW05TTUwZWJpUzEvTXRhcVFHMHVkK2VWM1l3WjU1UlhsK1FJbzlpcjkx?=
 =?utf-8?B?U2w1ODZXWGZEeDNydmozc3FvRXZFakZ1VWxlZENPc3d5ZXVncGhFWmJZeDRa?=
 =?utf-8?B?eFZjTkpnR3JKdlloZ0VKR2E2RnNlTlM1NFZxRThqemtmWVhSL1R2NHZxZ20z?=
 =?utf-8?B?ZytyT0lBQkIvWWRHc1QwL0x2KzMxWE5aVitqc0cvU0FISGlOTE4rWEY2WXdR?=
 =?utf-8?B?Tk5RL0xwbEFZMXdLL3J1RGpTSDJmL0owLzZENVlRSTlsNnJaSEZXZXlBWjQy?=
 =?utf-8?B?M0RsVkgxRWFWamhLdnNMRXFjY1BXUU1SamNlRWZYS0dRWGg0QXlwNjhTcGZ6?=
 =?utf-8?B?VzBXRzJFQ0cyMjVLWEVBbzhjQmlzTXA0YWsxbnl4cTB1ckZxQ2Rodk05ZmZs?=
 =?utf-8?B?d2F5MUltUWlZcXk1OC9oK2s1bzl3YmgySGF6S3dDa0VjcWE2N00wUkhmVXlp?=
 =?utf-8?B?UEJnUU5GbkdhWE9vUXVqSi81Ylh5b2l0R0NNd0ZUQ2VMWjlwdUF0N3RsV0dv?=
 =?utf-8?B?bzR3RStuNTV1eHlKZFg1U0Q2bGF5dW9BNjgvcVA3QWU0c2h2OHRUanV4SnlB?=
 =?utf-8?B?cldmUGg1aWZ6OENtUnlLaCtVNWZobTZUSEd3QlNxTWQ3djNMdmpLR1lkQnJU?=
 =?utf-8?B?czlYT2pZSlZWRDlrQ2RsL1RKWFpKODZCbnVhMzRPWWhaZ3JsNU5KbGdDd3FL?=
 =?utf-8?B?M01GcFVnQloyQ3grYUFhK3ZJZUlibUFIa29yWWk5bTdncU5VOU5NVUNDc01S?=
 =?utf-8?B?YWJMZ2VObVBxcitQbjJ4SE95Z09QUEltcTdkbStka0ozTWFkYzQwaTROZktP?=
 =?utf-8?Q?qMsxiTuyOy8p/ub3RsOtfy9VH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ec5f64-6955-4446-86b2-08dbd533c389
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 08:24:10.4790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LhCqEbUAllqAQ5fqCBmb1OXvbH4IENEkhIk07BcjlyuJOxCpAbP/+fBRUhtV2kE97wFAy3a55qRqt4+lIO53w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8288

On 24.10.2023 22:30, Stefano Stabellini wrote:
> On Tue, 24 Oct 2023, Nicola Vetrini wrote:
>> As specified in rules.rst, these constants can be used
>> in the code.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Changes in v2:
>> - replace some SAF deviations with configurations
>> Changes in v3:
>> - refine configurations and justifications
>> ---
>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 10 ++++++----
>>  docs/misra/deviations.rst                        |  5 +++++
>>  docs/misra/safe.json                             |  8 ++++++++
>>  xen/arch/x86/hvm/svm/emulate.c                   |  6 +++---
>>  xen/common/inflate.c                             |  4 ++--
>>  5 files changed, 24 insertions(+), 9 deletions(-)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index fa56e5c00a27..ea5e0eb1813f 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -85,10 +85,12 @@ conform to the directive."
>>  # Series 7.
>>  #
>>  
>> --doc_begin="Usage of the following constants is safe, since they are given as-is
>> -in the inflate algorithm specification and there is therefore no risk of them
>> -being interpreted as decimal constants."
>> --config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
>> +-doc_begin="It is safe to use certain octal constants the way they are defined in
>> +specifications, manuals, and algorithm descriptions."
>> +-file_tag+={x86_svm_h, "^xen/arch/x86/hvm/svm/svm\\.h$"}
>> +-file_tag+={x86_emulate_c, "^xen/arch/x86/hvm/svm/emulate\\.c$"}
>> +-config=MC3R1.R7.1,reports+={safe, "any_area(any_loc(any_exp(file(x86_svm_h)&&macro(^INSTR_ENC$))))"}
>> +-config=MC3R1.R7.1,reports+={safe, "any_area(text(^.*octal-ok.*$)&&any_loc(any_exp(file(x86_emulate_c)&&macro(^MASK_EXTR$))))"}
>>  -doc_end
>>  
>>  -doc_begin="Violations in files that maintainers have asked to not modify in the
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index 8511a189253b..26c6dbbc9ffe 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -90,6 +90,11 @@ Deviations related to MISRA C:2012 Rules:
>>           - __emulate_2op and __emulate_2op_nobyte
>>           - read_debugreg and write_debugreg
>>  
>> +   * - R7.1
>> +     - It is safe to use certain octal constants the way they are defined in
>> +       specifications, manuals, and algorithm descriptions.
> 
> I think we should add that these cases have "octal-ok" as a in-code
> comment. Everything else looks OK so this small change could be done on
> commit.

But that needs wording carefully, as it doesn't hold across the board:
Right now relevant MASK_EXTR() uses gain such comments, but INSTR_ENC()
ones (deliberately) don't.

Jan

