Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE278FB50
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 11:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594555.927911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc0iA-0002I0-Qg; Fri, 01 Sep 2023 09:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594555.927911; Fri, 01 Sep 2023 09:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc0iA-0002G8-Nv; Fri, 01 Sep 2023 09:45:06 +0000
Received: by outflank-mailman (input) for mailman id 594555;
 Fri, 01 Sep 2023 09:45:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qc0i8-0002G2-M0
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 09:45:04 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3912ac35-48ac-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 11:45:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7984.eurprd04.prod.outlook.com (2603:10a6:102:ce::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 09:45:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 09:45:00 +0000
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
X-Inumbo-ID: 3912ac35-48ac-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5WZhQTHKDrn6cJdVEy46adQGfa4P4QZB282OHT4RUAOxqGku6PbhQpJAXof+9EewDChaB/WQZLOgN7/2QZ4CzG+R+qHLVsaGdce4PArhWT24AgcBEO3cm4wjlwpn1rItxPcJQLf2C8YXIVvzh9+d8B6sbBvTjXl4EfYTpkaZTek2Dyf2X5b7Rd1cSU5hXvuUqDUBR31Iz83USZHn1OBoxOdLFPnQlptVzpTi4LAWsSe+dbYMGwh6RppdLj4UccCDrbh+POj8O9i3YyC/+y4xRsPBkRCokpvJuY20bqFaH8NZdY6YKLKBI7z5+O5M/LDUssX79UdlWTwdy4zWNrLjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPYjQh/I6+2PLd0nv5uoFusxETAxD7M0FSb7FeBXW+Y=;
 b=VMig4RijfPEH+c1si/o+pSUWtCyG5p32txytt4qj0/EsCgeEufZLqqoJK7ykSfsOwOfx7LVNSY/BgIfiXA7crrru6td20tlB+Si9KNNcQBzovaYRTt6kOnmlFY32WlbaoV4yTJ+VuChkHoPlo6UL311SAUwpZhyzEzBT76mGrFMlg41DibuT0cdFxQ4MBnGVKnS4V1JHzLx09w7Lx43Ll1j80LeVCVgNJ6h29XjiGRPFJQ5cNTNi5pr8XV2UkKvZf03q5vtT2lUGnS5zaVG+7cTiRhVGZNyQfoYI28cnwFZ4G568VOrYRKg3ANui/mqOiM9AGF2gclYGva+9P8Z6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPYjQh/I6+2PLd0nv5uoFusxETAxD7M0FSb7FeBXW+Y=;
 b=AYGtgLS5boHfPBzkkNWJrlc5exB6GC45W2nNbvyMAKhGhRDcNG4qfTB6aGb5GWwh438m9BMhNsPsz118AZrMiMCobU4mGl9CtPSndLPcgETkwAAKr3ulsq59laTYy5hrEKPJ8yfAYqib/izSnH1f856EI0t7+uqSNGIIvGCG8igrHy/63nPFi1VqVK3LmCqRh7PruJFKR0nT4cvyQ6VOz+yvtNfQmUKCT/3KdSpcHVuGzVVN2kNk+YrNtFJTsbOhCHirK1/+YVrd5ys6LG0Ky17AR/0qM+6KRc93wa21wk3saxm7UpHC6aXAOscA9IRThR4RAnASBg5u6MNqUjRy7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9de603f5-d7f9-495d-6f4a-2effe9db901d@suse.com>
Date: Fri, 1 Sep 2023 11:44:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] ioreq: include arch-specific ioreq header in
 <xen/ioreq.h>
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <e5f13920dfcb9f828abb4a36dd410d342f4c0939.1692974235.git.nicola.vetrini@bugseng.com>
 <73a78132-a086-5ae1-2617-fb38c51e64e5@suse.com>
 <f96865f3d7a47e4d9d52ee13dea064e3@bugseng.com>
 <15eef072-d7a5-23a9-a7de-3c16fea49dd9@suse.com>
 <cf5f8c126cc6bb5564ac4cf214055df2@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cf5f8c126cc6bb5564ac4cf214055df2@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab915b7-daad-4b13-fa91-08dbaad01bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KXI+pKdRkg5hCX+Na57YQb0EzOLGtZvZE7opslKVgmJPrhWRBMh803oQNls/5tVNwhWKgVoZpgWiYtiiSSjrABJap4KoKJRtPfR8GEvLXsmTc9DPogNOXwPnSA5Sz5Wd53ylElQU0/XpJA2/0gLTav67fcpwV660xDOLu1Dz+EjPgaEuTiDmmc3GKSPXmlfGHGdsGUeJNEWtMISvp/nF5PJeNOLWWVYAjUod6DW4lZZlrE4NXvl73w9mTy/Bd453ng7qbSlWIetfdT1rytJz8j8wJYqdsk5zlb3xPIBkLyhqtWpOdFBz4jd6zc8jNqNSH/AlavgHq4+c54Yw/+aMtVAXP7CyC/ygWAlzq1wHRDT2R7SzgA9Plppl9edUEURiecItP0LnDExQqWN6Wi5CE9YTUD5Loe06n5VrmYpPlSaL6+dMktEGoePBpyEBQExgYURHD3YtC8vS5TpMuMNd+xZhHLX4CjUoDl9/f6CKg0McGHngoLf6dYYKR9yZrKDtvSjLvXGhkx5IRpL6n1STpo/g3oqTAdpY4sxlSYh7BQ+hcZ3flCvfL0TmBuWWQnovtgwwdtN7xy1jeKMmheIaBpbleFn2mXlxHo8izNYqkGA/P/uESAvbyjnzR/PgnviEmvW7Hnc8t39ovtByxhVErQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199024)(186009)(1800799009)(6486002)(6506007)(6666004)(6512007)(53546011)(478600001)(83380400001)(2616005)(26005)(2906002)(7416002)(66556008)(6916009)(54906003)(66476007)(316002)(41300700001)(66946007)(5660300002)(8936002)(8676002)(4326008)(36756003)(31696002)(86362001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlVyZTJKdi9VT2VVT2FHK2lCN3hRV0Q1UEQzbndiUk5WVmhENUNTcWd4WHJP?=
 =?utf-8?B?aDVZRkMxNGpRWHI4MHUwb0pib1F1Z3JyZlVDT0hFd1Ryc0h6TjlPd2RTMkZl?=
 =?utf-8?B?SU1nMGszVDJNazJ6UWFHb1F3YWJla0h2alJKa2xIRXhTakh5WUROOE9sRGZN?=
 =?utf-8?B?M01sQ3U1RHB2L3NDNDJkY0ZxTjM1elpsNWl1MUdnaVdXeVdESGpDOUFqcFN1?=
 =?utf-8?B?RkpIUjlsTUovRnFwSDFWczNXZnpIbWVjcTczN0NQd00yWUYvdHo2SExISkg1?=
 =?utf-8?B?b3FxRTVBYU1JbENUZTVKUXY0Y3lFT2ZxbDl0aFNaZVZTN3I1VmMwV1NYc3I2?=
 =?utf-8?B?aWMvaFl5a1JPQUp3RVpxYnNWQUwvNW1SUUM3RWxqcUZCSWRQanl0MmIwUFZt?=
 =?utf-8?B?NExHWjdHcHBOVDZvTkpTR0Vlc3hRK0JGU3ZMaVZLNlRYSmh0RHA2SDNZWlFi?=
 =?utf-8?B?TzJwMXlSM0s1ZDhoNi9lSVBzeTdrdWU3VWo5dG8vWlVuTmc0U2hzT3hqZ3RN?=
 =?utf-8?B?TXRCeVJXRXovUGNwMnM0OUx5Tk1DUHF2b09zQ1BqTWR3OHJ0NzZ0UGdFc0p3?=
 =?utf-8?B?MjNDNmlzVTJRV2xSMndnMVZaUHhuUytiRzJSZjJ0US9vRTFBMTBSOWVyVFhr?=
 =?utf-8?B?Q0cycTZ4Tm5OWi90bEI4dzZkbFI3NHJxc09QTER0dnVoMzhuOTVVUlpxc3E4?=
 =?utf-8?B?RXVsNjVwTy9KZytMOEpwdENiRzZkaGpqcXF4d2pIcnJHa084Mmh2bnNobFNB?=
 =?utf-8?B?R1JIWEloL243blpyODlteTNZQkhValdWN2FIb3BMK2JqREsvNUs1YW1GTUlS?=
 =?utf-8?B?MXF1MDViQTU0UTByZEhlZHFLZ0hNM1lwSkpKOVR2d3ZLeGZwUlNFNGtoMnVX?=
 =?utf-8?B?OWtvZkdNZUNGbVZxSkhkWk05T0dobVNvQnpaOWlHTThaQjNTZ29pNnRkMjZD?=
 =?utf-8?B?ZjZ2a1VnekhWamZKOU9NNzQvalpGU2FXSk5NVkdZQ1NyTXI3ZVpFcDdrdkFP?=
 =?utf-8?B?OHJVaXRCRHBqNkgwUVRxVktia2ZSQjJQLy9CSXFQN01CRkxpWFAxUlNaYkJE?=
 =?utf-8?B?Y0U5RUZUT3NiRzc1SlN2YysrbWNSZ2tobFZCVHJnQitkR3lKUC9UelhYakpx?=
 =?utf-8?B?Z2NTemI5YVcwSTNhTUQxYW9NWEtSRk9LRzFhdno2QWJaTTB1SVJaWlFjL0RM?=
 =?utf-8?B?Vi9qZWV2Y0I0cXpKclladnJrS3FIUDBKRXQ2bUs0NUN0S3pvNDhRQ2UzcHhH?=
 =?utf-8?B?dDkvT3JKc3dCSkNTd3FyT3pYSFlsdzR4RFYxQysvTHNoanpGRUwvbW1ZdlEx?=
 =?utf-8?B?blNaUlRLbFFtaGlwZ2JvWExoWG9pcTU1Zk5PVWVacHF1bnI1MEJEcjhzTDdB?=
 =?utf-8?B?ejI3ZFAvcEIrTXlaY0FwMGZzay9aMldMQ0N6UnpJODRwdFI0MDhobGF2TzV6?=
 =?utf-8?B?NnExNlVvamMxWlpZclhRb3gxWVdoTjJpRWpuWUJtcjliWjZRL0k1cndmUyth?=
 =?utf-8?B?L2tyMklTQXJzQVREMjlOcjZNbFhwYVViWGs2anAvZjF2YU5KL3h2dWpHUlgv?=
 =?utf-8?B?ajhxbmJqN2VFNHpieHAwUWF5aVlBdTJnNm5uREQrU3I5bVZSYzF6OWFGMjhs?=
 =?utf-8?B?TTU2b3d4NW5lVTlnUWtLcUtUT2NuRzc0Mm5Xa042NGhBdTdEQTdOWk9uU0Fu?=
 =?utf-8?B?VGpjc1lZay9UMm9sdS9UWHZjbEVWUzE1RzlSNS9WbGY0ckVGUEVLbmoxb0ZM?=
 =?utf-8?B?SkRad2ZzOTFwZm0xaTZ5dmxvRXBlaWhZYVFEam9xcjFwQkdwUmVqV3EwRUNR?=
 =?utf-8?B?cEUwc1FzTGFmSy9EY3JJR3grdUJJSUtIZkN2UXN4a3lHRjlybVl0OEtxaHhB?=
 =?utf-8?B?QmJ1d2h3R3AzQUx3K25UMG15TTVmN1BtS0xUV0NzYXdmUk8vcmZkTStVaC96?=
 =?utf-8?B?QVBvOVhzTnhtVStsaXVJaWdzSFF0VGtVeURpZzlWMVNmUEJpQUNMYWs0NDZD?=
 =?utf-8?B?TU9wYWRzNU5YL2VEUnR5bjZwSDhiMkl4cFFaeVFML0ptNi9aRHEvc0YzRndy?=
 =?utf-8?B?bmtKbWRNVjFPV3ZuNi9xbjg1WFl3Ly9XUytxN2F0WFFEcEVtMWtOUVRXcFNK?=
 =?utf-8?Q?17iKr9cdSQL5aqj9z1EfRJn6o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab915b7-daad-4b13-fa91-08dbaad01bc2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 09:45:00.0927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VGPlFuBi8jpG0sk10Y/uIk6Z25yqaIJ9+iHA5PZyvk4iWVgQd35+8mC8fjcQtcqURG+UDx9QrIy6k7QKZF6oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7984

On 01.09.2023 11:13, Nicola Vetrini wrote:
> On 01/09/2023 09:36, Jan Beulich wrote:
>> On 01.09.2023 09:13, Nicola Vetrini wrote:
>>> On 28/08/2023 09:59, Jan Beulich wrote:
>>>> On 25.08.2023 17:02, Nicola Vetrini wrote:
>>>>> The common header file for ioreq should include the arch-specific 
>>>>> one.
>>>>
>>>> To be honest I'm not convinced of "should" here. There are two 
>>>> aspects
>>>> to consider: On one hand it is good practice to do what you say. Otoh
>>>> it
>>>> introduces a needless dependency, and it'll require new arch-es
>>>> (RISC-V,
>>>> PPC at present) to introduce another dummy header just to satisfy the
>>>> xen/ioreq.h use in common/memory.c. Therefore, _if_ we want to go 
>>>> this
>>>> route, besides a wording change here I think ...
>>>>
>>>
>>> Since including both <xen/ioreq.h> and the arch-specific one was
>>> requested to be changed
>>> in previous series, I was trying to apply the same pattern here.
>>> If you prefer not to change the current layout then the fix is even
>>> simpler: I'll just
>>> include <asm/ioreq.h> in xen/arch/arm/ioreq.c, which is where it's
>>> missing.
>>>
>>>>> --- a/xen/include/xen/ioreq.h
>>>>> +++ b/xen/include/xen/ioreq.h
>>>>> @@ -20,6 +20,7 @@
>>>>>  #define __XEN_IOREQ_H__
>>>>>
>>>>>  #include <xen/sched.h>
>>>>> +#include <asm/ioreq.h>
>>>>
>>>> ... this #include wants to be conditional upon CONFIG_IOREQ_SERVER
>>>> being
>>>> defined. (I'm actually surprised that there's no respective #ifdef in
>>>> that header, meaning types defined there are available even when the
>>>> functionality was turned off.)
>>>
>>> The two functions in question are actually guarded by an #ifdef
>>> CONFIG_IOREQ_SERVER
>>> in arch/arm/include/asm/ioreq.h (in the #else branch some stubs are
>>> defined)
>>
>> Well, I don't see how an #ifdef there helps with the aspect mentioned
>> earlier (new arch-es needing to needlessly provide such a header as 
>> long
>> as the #include here is unconditional).
> 
> As far as I can tell, including the asm header in the arm implementation 
> file does not imply
> that new archs will need such an header. Of course, if the solution 
> proposed in the patch is
> chosen then I agree with you.

Hmm, maybe then I misunderstood your earlier reply: I thought you were
arguing against the change I had suggested.

Jan

