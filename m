Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A07D7D09
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 08:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623489.971363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuBK-0003NP-V8; Thu, 26 Oct 2023 06:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623489.971363; Thu, 26 Oct 2023 06:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuBK-0003K4-Rn; Thu, 26 Oct 2023 06:49:26 +0000
Received: by outflank-mailman (input) for mailman id 623489;
 Thu, 26 Oct 2023 06:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvuBJ-0003Jw-Cf
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 06:49:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbbce6c4-73cb-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 08:49:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7992.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Thu, 26 Oct
 2023 06:49:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 06:49:19 +0000
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
X-Inumbo-ID: cbbce6c4-73cb-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRjjwUM8Qea+jwG0KqfqCNmw0wrkXrHGGScLmaUMbKZlV+NM8GHvxKsnA3XJJuXkLcT0y2ysfoJyynUUarNch2kaE+z0jNJbVFqZwD/KmCnBqS4+IKBSlfDuEFdP1he5YJ6/TjhSLvaOKfXLdTZmMj8aPo41mjk88rhCftIxaBLDJ9rhtzcwdQwCi+21ePd+qR09K22KA7JdAu24WSFEUncj9CRhXZuziDBwecyu0YMkNEapjvimEAisd+lGneiYgwEqcfdk2xIrQoI7y3QuDM9LoBz2TFFSJvmLqtSx7P9+9hpgiAzi/byceDyyw6jU+0xtDdettDjCNk2JrDzJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScXXPbgvfg69sK5/V/jSimFsnBtWPz1Bf5ddu0j4Bz0=;
 b=QAhDlZbGjkNHRf0VDI586HfJGNTDADcJWzNGoH0NeNCkZmml2u/CV4NX0N89zeATrZ3PVDtH8Qc3IducJgfsb66DD/Nih7qbGLqrvx5k6cBbUu4sU0iC0YZBgA/hV0TwFXo4y8QS+30CvCS8aqJBYJMxpybjg8q6d2a7yWu9lQbFlGj8VjCK9ZCnLWCK0L7MPMH2Nj5YdPy6k0yqoyAtSOb+c9hoKqh9Wyt02ejk4v6hYbkxKwrPla5MLEpu6zE8nP1LR/40yfC0lUT8xOqxOjhy09IyXXz0oW6/lE/h7LGZF3ZvQnlrVza1IUcFQsqfe5YIcER8XlUpvKk3azMCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScXXPbgvfg69sK5/V/jSimFsnBtWPz1Bf5ddu0j4Bz0=;
 b=rke9ClfeOuvnjBye1YU96RFjBKUNwdbvPEOrpn3K4bpzMuBNrJ4SaXdnPyeeR1v8Y3+jW705wJlCR6x+uZ4HmOyXY7qlcXsathU8O6U5lUa5m2OkgzjbxC97ISGSwEk/x3FCW444stdTlJ40w9fPgnCuIyLDJFvkss764y7WhOzDdvu+XVELFbhJt4GRmxHQNvA1kwyUquVAbjUBWHT7giyPBbkia2x25a2I2frBmDrbHjuNFWNgVjIJTW7DqrBh8LrGLbUQ5vWC1nlrVxTVERgpWkLgPgW4oAsmaPaZOFH27LZJRPOjjfZWkAdW/fTHYOiMztKczvbBpKFq/90ahw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f740f6db-ccec-1187-7c19-1cb37d8cf4b6@suse.com>
Date: Thu, 26 Oct 2023 08:49:16 +0200
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
 <78107fe9-de43-30b8-7423-240450bc0da8@suse.com>
 <alpine.DEB.2.22.394.2310251532290.271731@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310251532290.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: c5eb64f5-1fae-46e4-f8c9-08dbd5efad85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mhWuP32D9mvVH3whfjW9xJHXRpd9HKMD2SVVpj10xL5qSpQVuNVuRKq/U7kWhFVp+3lkWSoTS6HK5ObT3FMUBLe3hzXWg2xXugtXyOL33GweXNG0AWlOwLLm8WOuy3Ln8/sF/fDqEoHUKw40cK2C8DiGvGSNtNDliPLxF+qT69p4QYO+CEiq5iBZB2zBhFnL8sx7HVX87tWrEqcwwghPoMIUqJ26tRax4RnKM3sbMM9HUHhvsl3Dzgw0DmCv8V+H9NfQbcPIbcdiFKtROjfjlY2vG31iH/KWcVKOdPLiYoUWKMzcELuAb6CVrMS2thlAROVBFEofG/96wPvylk74DapHLX0pui0qnBiAEBCg2za7ygUmvzTIwaqjKSbZfoae32ZLiPI9emJkMgh82juy20yKlEJg5D7YegjxPaoA4SHFnRtbEvNypPyQfK/9mgmlHyA/+w4dehx09TELgy2o8hvuKLvgBLFTuBVgdn+v2eXxKDYigzVO8i6DcMPOVOlE1dETqGtgM2mOfyO3vLfUv1zemxOXax3Ydc/uqyemTT/iv8/eZnbees6v7SMNKry791O6yBaL1HiAMBX03Egt8W4ViXBbNKouBr4Va0r5UOZ2sq4MHNVudopjT567cItunwURgtu2MQtk88Ydn572Jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(41300700001)(8936002)(8676002)(6486002)(4326008)(86362001)(7416002)(478600001)(2906002)(31696002)(5660300002)(31686004)(36756003)(54906003)(66476007)(66946007)(316002)(66556008)(6916009)(6512007)(2616005)(26005)(83380400001)(53546011)(38100700002)(6506007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk4vMWpBbndqd09aT2ZvdGhCOE9HRW4rc0xhdWpBOGdGYVJ0endmQWFmSEx0?=
 =?utf-8?B?bmxxK2I4eWFhdnFkQWdncFpxS1JvUjArOXdGQ3Z6WWJRREpURGhITWowWnNP?=
 =?utf-8?B?UHp4c001bkhhamVjbkZYc2ZDYUFGd2ZpSE92WU5RR2FiamJHYTVlYnk0eW1l?=
 =?utf-8?B?RGdDU2hkdUZyUUdIV0pYOG9wZVpBSDl1NEJ1eW1meGFqeU9KYU96S1ZIQkxx?=
 =?utf-8?B?L0ZWdU5EdGxFTEZJM0JIZ3dESmNLZjNSeEVteDlDc25Xd2RyYXBzdkp2WkRZ?=
 =?utf-8?B?aTBlRHlzNTZOTGtHbGJUUU1IOGJUd25sZ2lRaUpKcHloc1piTUY4K3UvT0JN?=
 =?utf-8?B?YzEybTd5Rk1pNjlFVVlYcDZMY2N2OUZmbkwxSGY0QXdJR21LTVBuRnpqcERq?=
 =?utf-8?B?bUxNelJ0M2NtTWlvTXlTUWV0Mk0wb2grRXRoaHdFdEEzbUlWRFNmUXRXdk1h?=
 =?utf-8?B?MDl3bU1uU01NYVEwaVV3SFNMTWVvOFRTa252NW0yS1lzV0F5U2ZvNFR4SlVM?=
 =?utf-8?B?ZSszUDU5YWtYTkk5VVVSVkJET0lGWEFqTi9udG5NejNudldxU1p2cnZheXRo?=
 =?utf-8?B?dU9Ua1o3S2RWcFNZdlFLQXh5b2hCUHIvTzcwZ3BmRGhUTnpLemJ3TlE5NXlB?=
 =?utf-8?B?ZEVvSWUvWGZmYi9YbFpqcEFqQjlweXNub0xTcng2aWh3RXFEN0tMVk03dS9G?=
 =?utf-8?B?OWdNRWpFODVPcnhvanRPKzBMZkFzTG5PUkNuZmxSSjBnVUlrV0g4cVRDTE93?=
 =?utf-8?B?ak5sM3AwUlN0SWdGMnZyUzB4S1NxazlpN0l1bEk2UVFlZjcxSk9pT2RxWXBu?=
 =?utf-8?B?Wi9EdGlxT0xyRTB5Y21nNHo3TW9qaUNabWJ5RjhvZURmTVphbk9tZzlCU0Ix?=
 =?utf-8?B?L3lLYjF1RWZ4RmgwSmErRDY3engvc0sxellYcldxVzY0RlZlQ2NHNTBhTExP?=
 =?utf-8?B?TXNiK3dSMUhQNFJtK3l4c29ORnhEVkRzUEFKV2JCVnE1QTF3Vk1RZTZVN25N?=
 =?utf-8?B?MTh0NmcvaytOOGhLSGVkbGs4OG4rMWUydnNqSmxNcmhRbkhtZy9qcTIwRkdt?=
 =?utf-8?B?QysxNVZ1eDc5WllsUjZMd1RFWG41TFBGbHJkSVZ5dFI3SjYrekZxbUlrZC91?=
 =?utf-8?B?aWxId1pwZFJ5TlRMdmU5dEF3K2ZqNllmNzg1OGZhU1BEYTVOZWFXMVFaOHVo?=
 =?utf-8?B?V015dzVlMHByQlErVGZFWDcrQkFwMmNwa2ZFNWxkemZZQ3g5V29zaDFCSkRx?=
 =?utf-8?B?c2JpMCtSbTNaNndEemRlTHRKZlRrVGVLTEEwTFA3NHNHWG1wTkZHZExhUjNW?=
 =?utf-8?B?QUs5WTVXektQUlBOMGNFUVhHVVEza0lQZUNjZkcxNm1iYitIM3RYWGg0M3RG?=
 =?utf-8?B?QUtmcmYwMjFOV0RmV0ErUHVTWFVTUnljMlV1TnFOOHprNVlSdVFFcmpLT0d5?=
 =?utf-8?B?by85Z3JQSm0wN2I0cHo5WDczUEp6NXBTRXhpSXNSd0FvTVA1OGVHUWdJTU5y?=
 =?utf-8?B?d1l5Y1hXbWpMSEx3UEh5VllTZU5QWFBFcFlMdEFDMW1wUThjckw4NW00b2Fq?=
 =?utf-8?B?OVlKMjNnVnFzb1cyWW5jTjUxcFZxVk1qd1p0a0RVR2pCQjE0QWN6aDY1dG0x?=
 =?utf-8?B?aUh3QlVLRUxjc2dhcHdpdlZlZFppMTlLekxoQnliek4zcFdzTW8wWWptUVl1?=
 =?utf-8?B?M3A0RmlMaDNWMkpib1lKdGw1WFpSS2drVW5pU0xqbUlRcE91NVUxR3ZvRUUr?=
 =?utf-8?B?dkorSTJuVmVFWUJwRUhlbWkzSUVpeVlOUGg5SE9nd1JNamZEUUhVeGFadlBz?=
 =?utf-8?B?NThlY3NUTGlDZkNRWEl4cGZJZWRSZzRQMXAxbjQxWDJRSEdodmtXcDFXN1cy?=
 =?utf-8?B?cStZQmdrTVI1NFFWcExzQ25kV0hTZG1NZnRld3JUUUFMZVRFdXdidHlaNTRL?=
 =?utf-8?B?NG5pUFJGTFhRZ0NLS05FMjIzbzlHWElHd0p4VmxzM29ZTlN6RXhvMFpKKzI3?=
 =?utf-8?B?ODhBZGR6VzdwTGdqUm53eGxQVm1QMFplZW5wTVhseG5DZXhtUXhpTDFLY05a?=
 =?utf-8?B?TGJvVzl4MEVTc3ZpZ29RczFYU3BQSS9EUVBvSkhzZm5hKzBQNWRiemhlZVJ3?=
 =?utf-8?Q?n2668V1RNAZrLWS1HdPkV3T3g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5eb64f5-1fae-46e4-f8c9-08dbd5efad85
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 06:49:19.6280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALwSM11JtlV3tXQlzecsk7Th6NX8NF+5X6W2nTZ/rO4YO2aFMMQRm1LB1TZ3eoZVb6STmTP+PMzQOghOsLC2cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7992

On 26.10.2023 00:34, Stefano Stabellini wrote:
> On Wed, 25 Oct 2023, Jan Beulich wrote:
>> On 24.10.2023 22:30, Stefano Stabellini wrote:
>>> On Tue, 24 Oct 2023, Nicola Vetrini wrote:
>>>> As specified in rules.rst, these constants can be used
>>>> in the code.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>> Changes in v2:
>>>> - replace some SAF deviations with configurations
>>>> Changes in v3:
>>>> - refine configurations and justifications
>>>> ---
>>>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 10 ++++++----
>>>>  docs/misra/deviations.rst                        |  5 +++++
>>>>  docs/misra/safe.json                             |  8 ++++++++
>>>>  xen/arch/x86/hvm/svm/emulate.c                   |  6 +++---
>>>>  xen/common/inflate.c                             |  4 ++--
>>>>  5 files changed, 24 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> index fa56e5c00a27..ea5e0eb1813f 100644
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -85,10 +85,12 @@ conform to the directive."
>>>>  # Series 7.
>>>>  #
>>>>  
>>>> --doc_begin="Usage of the following constants is safe, since they are given as-is
>>>> -in the inflate algorithm specification and there is therefore no risk of them
>>>> -being interpreted as decimal constants."
>>>> --config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
>>>> +-doc_begin="It is safe to use certain octal constants the way they are defined in
>>>> +specifications, manuals, and algorithm descriptions."
>>>> +-file_tag+={x86_svm_h, "^xen/arch/x86/hvm/svm/svm\\.h$"}
>>>> +-file_tag+={x86_emulate_c, "^xen/arch/x86/hvm/svm/emulate\\.c$"}
>>>> +-config=MC3R1.R7.1,reports+={safe, "any_area(any_loc(any_exp(file(x86_svm_h)&&macro(^INSTR_ENC$))))"}
>>>> +-config=MC3R1.R7.1,reports+={safe, "any_area(text(^.*octal-ok.*$)&&any_loc(any_exp(file(x86_emulate_c)&&macro(^MASK_EXTR$))))"}
>>>>  -doc_end
>>>>  
>>>>  -doc_begin="Violations in files that maintainers have asked to not modify in the
>>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>>> index 8511a189253b..26c6dbbc9ffe 100644
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -90,6 +90,11 @@ Deviations related to MISRA C:2012 Rules:
>>>>           - __emulate_2op and __emulate_2op_nobyte
>>>>           - read_debugreg and write_debugreg
>>>>  
>>>> +   * - R7.1
>>>> +     - It is safe to use certain octal constants the way they are defined in
>>>> +       specifications, manuals, and algorithm descriptions.
>>>
>>> I think we should add that these cases have "octal-ok" as a in-code
>>> comment. Everything else looks OK so this small change could be done on
>>> commit.
>>
>> But that needs wording carefully, as it doesn't hold across the board:
>> Right now relevant MASK_EXTR() uses gain such comments, but INSTR_ENC()
>> ones (deliberately) don't.
> 
> What about:
> 
> * - R7.1
>   - It is safe to use certain octal constants the way they are defined
>     in specifications, manuals, and algorithm descriptions. Such places
>     are marked safe with a /* octal-ok */ in-code comment, or with a SAF
>     comment (see safe.json).

Fine with me.

Jan

