Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F17E5BC542
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 11:24:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408644.651449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaD0O-0006Jf-58; Mon, 19 Sep 2022 09:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408644.651449; Mon, 19 Sep 2022 09:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaD0O-0006He-2F; Mon, 19 Sep 2022 09:23:56 +0000
Received: by outflank-mailman (input) for mailman id 408644;
 Mon, 19 Sep 2022 09:23:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaD0N-0006HY-4Z
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 09:23:55 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2055.outbound.protection.outlook.com [40.107.105.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb000294-37fc-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 11:23:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8565.eurprd04.prod.outlook.com (2603:10a6:10:2d4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 09:23:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 09:23:52 +0000
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
X-Inumbo-ID: bb000294-37fc-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwn5EcgWsBEtFnf67jswXuIhlkdjiVycgB5sLhbU3heXF/3pLG9JVKmNycsnnDs4m3/hC9IBk/d2Y2M2doCj7Z6KV1wAuiIcrgotTsGWhvPXIIUlOz/MX2wpB903FZUupOOrPNqMCeRddUuZNARq/+LR1sgYzzD0TOmg629Rmllw7a2NxOTaKlCLgVovm1TmpFR6Pf7GHMqdT6Luupnd3X71HkZOMLLgVQo/WMJqRgSpAbM0/X2OkOUrCjB3Qau6sLWWrXCiwyFVMy+QrX+jqVKPu3qO9ak5VCVpzAsy1cZJQLc92CNBnbyqyAOV9IC9jij9AoByr3ZTEbpDC6rbnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bD0OXo/TMREN6xJbQBro6A2OazDB4aHvq19+U1c86w=;
 b=ahbVZanoXfXI7ziXXAI4M22W/dgxqjrfyzEXGENdnws1UVdzAOVtVj0hUtFSXpBzVJhof008XjLye5wmG4i91zUjDG/RNquJg2K8ucfvu4JHoNXoxBX35JN4TkfMDYBVDmP0nUBFe0My8IJE6zSxuRatwHJzdkAF+RJ/i1fnS45V/oLk+XGVGAQWgCUzswrOf2M4P6AEk8SBdPW/ea7V8yQZpuVbTGdcWiHMCdMo4E4QOi4YNbThhGQjt/zJyonRF+3aZRd7h+5dwpu0DfTpukbxtUSA/b/f4aix7FseFA0VMlfja9a5D+AV2ounwA0dJaVxJR//an68ab8ORgfyRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bD0OXo/TMREN6xJbQBro6A2OazDB4aHvq19+U1c86w=;
 b=sB+ULnElKiVQkKdq73dPV0BIHYKetZF3CkfsQJeqJ1z1yw8oTotD6TaGhGma0UzLfaU/bbb9bDAkDymAIfWfxcfpjL251wXgB1bkXimGm61x0JAAAk58MsZM3k1xvB2O7yNqj673HPQhI7o55wCXq+5/Hr4GZaA9md4L9Nu8y8d35IxcWAmAVo/OXrwBLLB/dRtheEFODdr06zxNdvP79r6HQEC08fzz8oIHLyIqUQtjs7DXVXDnLeRBA5Sfm8XznT6cIVG46KzKPNNCzgeRF0Y9/9m5+toOksT6u/mE+u4ZHIBq4GiyPLRqGylrZ/AnT1cD5WQFlw/OX836ceKDrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aeecfc0d-24fd-b674-b255-e7c284b67fd1@suse.com>
Date: Mon, 19 Sep 2022 11:23:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/7] Fix MISRA C 2012 Rule 20.7 violations
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 burzalodowa@gmail.com, Stefano Stabellini <sstabellini@kernel.org>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2208311534070.2375071@ubuntu-linux-20-04-desktop>
 <44eb89f1-67db-6232-e28f-ab380e71b9fc@gmail.com>
 <6A69A0CA-087F-4260-9371-8EEEAD3926A3@arm.com>
 <alpine.DEB.2.22.394.2209011904571.3931@ubuntu-linux-20-04-desktop>
 <422ad42f-8bfa-55a9-2e70-4ae857632a94@gmail.com>
 <alpine.DEB.2.22.394.2209021743150.3931@ubuntu-linux-20-04-desktop>
 <e2046144-48ec-2d8e-62d4-88ca1cb3aeb4@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e2046144-48ec-2d8e-62d4-88ca1cb3aeb4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0684.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: e027d501-50cb-412a-783c-08da9a20aae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K/2iJTC1sDpZwoaxYxfoNdfqVj1hpcaSv9LiTA1mh+6TDAkXcXqTI4ZbH6Ah+VkNV0+RaC737OM2P0yB5PUpi8FSwSPfsjxfOMBmPAcqM6nywjPljBUWPrcVx7bcX+Bwx0d46M9h/59TDH22ps8enbgUB44pWMrwvM3umGt4YQViNpnPASRUL5HDm0ZVylOldlKFU9Zoryer/rZ/ofWdQ0jK4sFklXZtfs0dRuKZ2hPmvcL+f60i2bo5caL4jFJ0PxACp5JFqvyoMgmYtLiLeoxPMcb5BPsNyPOtMAFHKOJ7L2u3Sc8CXUid9CXGYZlMd9UMFNzc8YJx/G2weEGrzXVHvdQ0Rn3yrXPpn9hvpV2dPijL6ak0UCxIV72Q9QfC8XIw0hR85iiz30tW1DViUKptSWOVFz4sLPB/DbQvZ5jVuIXTSJTLdMMbi3UtYlKA28mF4qcx429Tvt4ZtOh4XsB7KvS2IIrb/zKsuJ32+Pndgrlshncxx4Ex/NRuYd942K8Y+LGtrHIQTTe/owBQytIT+/z14lROBrnOcMh/zGqpSoOuuFX2e8S62zj7H3ULV9aFF9paMhbLkYLyw2PZH23s81kDDK/z3piTLUXXh1OnkyX8yYfIE4D3W6aSDuijqlwg4BzsL475kXOTdpsZkt5DV8YGBkE9biWZZlz3U6E75nX7fNrxcOiONvRxgq7WOnzBCUSfdkRXjdn6ffEvGfP/vyZILLPga+wyDenCit43Dq4fKglixLHWZhdbohtg9AWSSFF0klksOve8qL8217Ktp0EVh8Rbq24dEF6Jt6E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199015)(2906002)(31686004)(36756003)(316002)(38100700002)(66556008)(8676002)(5660300002)(4326008)(7416002)(66476007)(66946007)(8936002)(31696002)(54906003)(6916009)(86362001)(186003)(478600001)(2616005)(6512007)(26005)(83380400001)(6506007)(6486002)(53546011)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0hCT1Foc2ZuMkVGdFQ5NDNsWi9KYjJ1RVBydk1Vc0syRVdWcUQyRlJoWlZ6?=
 =?utf-8?B?NE4yNDRFWFJXT1N0SGRRc0UwWnRWQlp3c3NKWTdVNHY1bDQySTMyTC9pVTRI?=
 =?utf-8?B?eXdaa1FuSDIwY1lqMnZ0bUd6cVJaZTNNc2dTTFZXNWpUVStpcVJHOEk0dVpy?=
 =?utf-8?B?VWpIWHRUZ3lpYW9pRnE4eE1QWW1xczRURWpZaHFjSDl5enZFRnJ3a3VJQU9J?=
 =?utf-8?B?VUtMdzJyUElWYUtZaUVwTmVOT080Z1VGRXhqU09qMFdLWi9wdG5vZHVWL0Qy?=
 =?utf-8?B?T1ptUFpUWHVFVS8zVGV4UVZtUm9XN2pVWVdXUTlEOW0zVEdYODVoaWhuS3Fo?=
 =?utf-8?B?LzNRdkJOU2UxcWk0VFkwLzdFWEsvaHEvNmZiWmplTFdCY0xyLzhUL3dCQnl4?=
 =?utf-8?B?Nm13bmV4Nm5tam9WRWVjWWVIVHhoNDJBaUtMNWwxTS9oTUlBajBNdWl0Z3hX?=
 =?utf-8?B?ZDVKWWg0dnZ4SWZjZndaNFBjMXB2NGR0WU5FUVQwV1VTUkR3ME5sUWVIZHhD?=
 =?utf-8?B?WEh6TTJpck1VTWY4WVV6clpoaXNRY3RkT1FBelJkV0tEdEhRZEJFeFMvbWcz?=
 =?utf-8?B?Q043R0hqLzI5cDhueE53V1JoUkN1NGxrOGJKb29qK0luajZlVjFOWXdEVlMx?=
 =?utf-8?B?bW5jUGJVdmxkSjFNMit3STg5MW81Q09GUWVZS3JxRGFlQ21vOUdiQ2xwVGtl?=
 =?utf-8?B?QjA5RytWZHlGRjlNc3l6dExsYUlRdkR1VmFBRUVnY2t4ZERsZVA1bzBQdHk4?=
 =?utf-8?B?dElZN3hmcUZGaG9GT3B6NnRxNGRqMWxabVJoenk2d1FkV2NqRXFaTlJPZEVS?=
 =?utf-8?B?NHFTbXpldjZZZ1RrSi9Cd0hMY0JVRndlcVlSWWx2dkNQVW9xK0RzZURTd3Z3?=
 =?utf-8?B?WUxjVWNITHpJVE9zYzZVMVZJeWhDZ1lVTEF5a2RWQ0tIeHlHNU1WRkF0Szl0?=
 =?utf-8?B?Wk9LL0EyTElIdkVlK3BFaWxjKzJNYjdIdk9oWmdteTdJc29VNW0zTFVOU0pu?=
 =?utf-8?B?WkFndkJtcnNDbDhyZ1RlcjFJYXgxajlWbHdXK2ZJQnpYekRGNzBhekRPMUxh?=
 =?utf-8?B?RFJaK3M2NEtDd3d1ckJneGhFTkpyUUtXMDhwc24rdzhDYXk3cXI1d2FMa1lw?=
 =?utf-8?B?QUR2by9aaVB4L2FkcjQ4L3h6TUlSc2VvZzNaNGhQazZkV2wwZXJJa096MGhq?=
 =?utf-8?B?YVN6WXlYL0RSMFc1Sk0xRTNXZEsvMjdjckk5c01YL2tvVVp5ZWhjMlRpRUpF?=
 =?utf-8?B?NWU2R1V2MmZxYkV5b1BZeW1NejljYkx4S0dlSzcrYVpPemNuOHdpZ3pyNXpC?=
 =?utf-8?B?UUZoVHBzNTUzL3Q1aDRSRGZEYThDamZjdnc0UDMwZlozdGhsZWtLVWs2cjl4?=
 =?utf-8?B?QU9LOFd5aThxZlBKb2hlazB5anB3bk1BdW1qMCtpaUV2N2t3SnFoYmpVNUkw?=
 =?utf-8?B?a3UydVEzWGprYWZpSlpmTnhOMnBZNGptT1Q5eXpuUEd3bWJnOWVPMlFEVmgv?=
 =?utf-8?B?VjAzUWt0SFFESFlzc3Nib1doUkxib1BMQXQwdDRiK1pIS2tyaVg0SWhFZjZS?=
 =?utf-8?B?Wkw1NHpDWTF2UUpnZ3RrejN2ZW9BSk9JV0JZNVZqMnRRWFVuWUlXbGN4Yng5?=
 =?utf-8?B?OW9GcEFxWmx2bE1UUXBvQTFkRjY0VkFkVnd4OEQ1Rm4zL1ppcVJFTTRMRk5m?=
 =?utf-8?B?M1ZvTDh1YWpWejhmQklDczErM0hGVVo3Vk9SbXFSd3ZjN1luZlQvOWVhY3Z3?=
 =?utf-8?B?aFMya0paV0xPbm1EcFpheTdmYkFPR25GYm5hWWs4Y0hKSERmZHozbGhySVB6?=
 =?utf-8?B?NVBpNG5LSlA2OUtpS0NCZGdWYTk2TlFkMEttVFA2NzBtdURBTDVjbmR4MXdn?=
 =?utf-8?B?RnBVZzlpRVI3d1RGeUJaZ0VPQUhHWVNaRFlTa2diQTQwa3NjODEzdWp4WU8w?=
 =?utf-8?B?d24zQ1VmYnJzaUVXWjU2dEN4eWlJMzhBVjNkbStkbHZVSkFhUlR2UFYwUWlS?=
 =?utf-8?B?RWtRZlN3UnE1cUkxTGYxbGRRZC9UQ3d4aDJiSVJ5ekZZRkdnS0FBU1Y2bkkz?=
 =?utf-8?B?KzBTb3lUOHZDb2gvcGM4eDVrSWtVaHo4YkU3U1BzN1NqU0JFVWlhTWdLVzM5?=
 =?utf-8?Q?+9TDehPj8oOa3xFGGSQXZsDzT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e027d501-50cb-412a-783c-08da9a20aae9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 09:23:52.4498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Oe5LKkXHn8GNTblVGGBMZaByxXtfaq0s4sxmcDhFNm/1HVT2ftRcDZgwbbrsYMWQQWXElUSoySaVDuD/Y64fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8565

On 18.09.2022 15:02, Roberto Bagnara wrote:
> On 03/09/22 02:52, Stefano Stabellini wrote:
>> The question is on the interpretation of Rule 20.7. Are parenthesis
>> required by Rule 20.7 in the following cases:
>>
>> - macro parameters used as function arguments
>  > [...]
>  > - macro parameter used as lhs in assignment
> 
> You can obtain different semantics depending on whether parentheses
> are or are not used (in the macro call and/or macro expansion
> depending on the case):
> 
> 
> #include <stdio.h>
> 
> void g(int v) {
>    printf("%d\n", v);
> }
> 
> #define m1(x, y, ...) g(y)
> 
> void f1(int x, int y, ...) {
>    g(y);
> }
> 
> #define p 0, 1
> 
> void test1() {
>    m1(p, 2);
>    f1(p, 2);
> }
> 
> #define m4(x) x = 4
> 
> void f4(int &x) {

Let's focus on C here.

>    x = 4;
> }
> 
> 
> void test4() {
>    int y;
>    int z;
>    z = 3;
>    m4(y = z);
>    printf("%d\n", z);
>    z = 3;
>    f4(y = z);
>    printf("%d\n", z);
> }
> 
> int main() {
>    test1();
>    test4();
> }
> 
>> - macro parameters used as macro arguments
> 
> Please note that Rule 20.7 depends on the final expansion:
> so whether parentheses are or are not used in a certain
> macro body is irrelevant, the point being that, at the
> end of all expansions, expressions resulting from the
> expansion of macro parameters are enclosed in parentheses.
> 
>> - macro parameter used as array index
> 
> This is safe today, but my understanding is that in C++23
> the [] operator will accept more than one expression.
> A similar change might (who knows?) be considered for C26
> or even offered before (intentionally or by mistake) by some
> C compiler.
> 
>> Some of these cases are interesting because they should function
>> correctly even without parenthesis, hence the discussion. In particular
>> parenthesis don't seem necessary at least for the function argument
>> case.
> 
> This is not the right spirit for MISRA compliance: why would you want
> splitting hairs when inserting a pair of parentheses is so easy?

I think I've said so before - too many parentheses harm readability.

> C and C++ are very complex languages, and the MISRA coding standards
> are the result of a (very difficult!) compromise between simplicity
> and effectiveness: rules that are exactly targeted to all and only all
> the problematic instances would be very difficult to express and to remember.
> So, yes: in many cases you might spend time to demonstrate that a particular
> (real) MISRA violation does not imply the existence of a real issue,
> but this time is not well spent.  Critical code must be boring and obviously
> right, in the sense that whomever is reading the code should not be
> distracted by thoughts like "there are no parentheses here: am I sure
> nothing bad can happen?"

I also did indicate before that "(x) = ..." visually (but not
syntactically) can raise the question of whether the left side actually
is an lvalue.

Jan

