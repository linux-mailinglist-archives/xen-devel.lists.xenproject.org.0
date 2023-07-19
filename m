Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B08759054
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 10:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565665.884021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2be-0006TN-Ml; Wed, 19 Jul 2023 08:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565665.884021; Wed, 19 Jul 2023 08:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2be-0006R1-JH; Wed, 19 Jul 2023 08:32:22 +0000
Received: by outflank-mailman (input) for mailman id 565665;
 Wed, 19 Jul 2023 08:32:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM2bd-0006Qt-Ho
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 08:32:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c63541a5-260e-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 10:32:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7136.eurprd04.prod.outlook.com (2603:10a6:800:122::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 08:32:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 08:32:15 +0000
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
X-Inumbo-ID: c63541a5-260e-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKNTyQ/qEVL3l2s361cqan1kegxseI5rt0uCLC+qnWVo8UHFgeNvxU4fSCEoAtygfaCVKHI8K7DtYfMXHIWxX1Sah2pVCQVBksM9dI4D1v2d60k9ZSI4idwrnPqPD2Beelp6PW7hXrGJH5twlrSj3tYhuiL7koXd+nmaVCPR66X95Ni7lOESsw7Ye3RtvpGekNjGZfi7yrqPt3vtF3CLeURevRxGBSXzFc/zUuGayQWyPAJ4OKw7dcd31B64FVdX826Ccx0jMEp+B6rKdkQDiCJJHsehFt5IMflWz0cxzCb1lFLIrhafkgcX3c6rCj4kdjlk4QZ7ec2YvY43HhwomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n61DsqpUHiVq8H8rkX+AiHC5sfRkczDf6N1bv4EXnI8=;
 b=bvwg2UGfGu8U7m167eryReKdc83uxDlFYmaQhRMUcIjFfNAm4I4Oy4tyGcVBnKz0aPW6pTDACGsf1VbrBicNc3cV6lvhPSVNg+wO/TklxS90URUDyR8SOoLnYuUuqG4Tc4rax3KDmTXqMEMXMxZx+xTLZPPvtdermwJJn7p3cjValJRu1gnAABhpah2sAZq34nqz9RT8lPH7oqfk6Qdustu3+87MJQe/ZlJNtxMPNsN6lTkCfEEhim+GrTibysEJcbmPow275IZNZET8IgKphZNXLlmNtAwd5DEx0/RCGcGd4XWjlmXCxgYr90yaQ/OVxk1ksv/HeBTUbD9P5vbqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n61DsqpUHiVq8H8rkX+AiHC5sfRkczDf6N1bv4EXnI8=;
 b=YeByrFCQ30NlGdAu17E4+qrPMnwNV8cFkYbC5NQhDwgWpKiLGYg0IQC7TJm3pwDSqFYzyOKEl+nFdWenJ/EkgaBr7B92KpdRgDGwZtUt4shNmRO7Ei7TeR2E6UuWOQdJH4uP/CP2mQgcmE5MnqKctsnITC9WrtTu9k2FYxz7QVNJYT/gvxo1VKi52ImZvBuW6l3RwGbmezEqn5jTOo+Sd1WhvDIpXjDGXkTDOkQpNsBxM94HqZ/C64pCTN44Ly9nB1OLsdENgUOPNgGOh7MdK7R4+T5eG6W+5uyu+gEa3SzE5s0N8er7/KBJ7iM5Ky3VlzL7Rnqm5uQZL2U1OCN1cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be50867f-a3e4-0230-4ca7-bc24cc30b946@suse.com>
Date: Wed, 19 Jul 2023 10:32:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86: I/O emulation: fix violations of MISRA C:2012
 Rules 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <b6ebf3a49de027981505da63aef594cb0dc42ead.1689691260.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b6ebf3a49de027981505da63aef594cb0dc42ead.1689691260.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: c378db74-f121-4c1d-ba0f-08db8832a828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4/NZnri2XwCfEb0wES0JIQGV4zmyWWFQCXTVbtYYORrxIKASagdC7Hpn159iH21j9wf4iST1qbSSek5ozls1t8FKEPkB3K4JyaWPJfLox8ejrlq3JHPtjGUGf7Za2hPMseD8wgjwNc+oAdF7qPh3K9qbErzvEBIf01V1mDTdJH/iLpHgAMgQnsxAZZt0VZEwcBjtzhPoAcGodTFIyjzV7ieDJK4ZQ979v9Q2qsrZnOEPsTGbzu5czRWBt41Fe2gIJmWSjpCM+JgD6x6JpyppQi/LnsriIaO2HbhR6kt0CPKAjQQASFzcBgjG9+Rk3e3zQAU7njtPIvs/a7W8SZWnfztOxC2AVJcZUrR2S7OblBILAjtZ8e7p6Skc4AHR6pG2d1vfFx1RwVzqeXRpNCxmSOElh+DYjBX1G+un9evgHy6sl/7IH9F26c0epdvNd/WjdUOZukjY3rfkCgKIv5zidLLvW95zwTRz6BOgPY3Vnct+eR5g9j8SpGil+d8C6dVDflRHfW1I73s22mqg6SjFCEy7NEo0KI30DXkNwMQdgM7gw1G23mKzdE6zrjpDXZpgnYnIgJx6t1E+srKqzFFtTAAG9A8No96eCEL92X5nriyczOiiK7y8uZ7u15H7EGbYaNb2V3Q8r/XRmBftndeYCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199021)(86362001)(31696002)(2906002)(36756003)(7416002)(31686004)(38100700002)(83380400001)(6512007)(186003)(53546011)(6506007)(26005)(54906003)(6486002)(66946007)(8676002)(8936002)(4326008)(66556008)(316002)(66476007)(41300700001)(5660300002)(2616005)(6916009)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0pMVGZxMWhiRlM1Q2J1NXZ0ZURRMlZVd1BFNTgwRzZJU3ZPN25UaXRCNjlz?=
 =?utf-8?B?QXRVWmxiTGxFOXlLWHVHVjNyeWozcG9nKzdFeVZNVWFvNVVEdHUyaExWMlZu?=
 =?utf-8?B?bkJ6Zmd3NU1iWGdDSjEvOUhiMGNYZnhjRmh6aWlZOCs2UnRhNUpWNlpyd3dQ?=
 =?utf-8?B?WFNjZ0ZYc0w2US9Vb2dpR0JWYy83N3BxVWE5YTR5clZtdU5yVHpmOFJDN200?=
 =?utf-8?B?OFpoR1hVblQ0WGRsb1VDdXBMVXNnVWVtQzF4NFhTM3UyUXN1MENzejk3WThz?=
 =?utf-8?B?MzRHcllBbmdJVndWbjE2b1JoY2IrTUxMbkpPV2xPLzFxQlRsc3JBaytvUEc2?=
 =?utf-8?B?dWlGbVVxYWpaKzhsNU5QdHpzUVVsNFQ4cHY4M1QzWUtYUTAzK2huYjdtdXhn?=
 =?utf-8?B?R3kyb2swOENSWlBJbFNYTFRVcnJhZWJ2cHAzRjV5dmxxeWpKNGNhczdZZ3lC?=
 =?utf-8?B?SmZPWUJiaTlrT1pOY1J2cmhPU3JGenJUcmxNV09IbFZ3cEhyWU9CRjY0aWMr?=
 =?utf-8?B?YmRvN0ZkbmNLMUp1V0YvNkE1NG1sajJjdXdEOUp6S09JZG9sTk5SQ2o1dW0x?=
 =?utf-8?B?SmpZVU1PQ09nQnZEUTBoV2l6K0hCV1VCdytwVWd3MGZsSi94RUJZUGZvTU5P?=
 =?utf-8?B?T1pKK3NiVHRwZUhILzRmKzBFeE5LQUt2aDVuMWIzOENhdENUOFBvTDlVTFN0?=
 =?utf-8?B?VU4wOTV5MlBTWmMyRlIxa3RQblJMN3gzV01nMi9lck1WaWRnZk1wbDNZRHU2?=
 =?utf-8?B?MEFMVDZ4STNzTTczTmR4S0NVcWF1Yy9lRk1nOVJ1UlhUcTdORnJVc1hMUENB?=
 =?utf-8?B?NXoxbDBqUlNBOUJ3Rlh6dWVFS1NFNXR2WkNNZmVNQ1lMdXYvNW5NaUU0a1ln?=
 =?utf-8?B?dDJCUFQzZ1R2eDFBaDU1YUJrQVdDbE9DQmJPeWJmai9kVzNldEdzQUo4WEdL?=
 =?utf-8?B?bDRGQlJPK3N3a1MzVEh1RytHMWREYUVuKzdOV0YyM2Z4UXMwNWJZYjMrSVhZ?=
 =?utf-8?B?MDNiSzdJSmZQT1hoNzAyVklqaWVJZldJM1BJY05QbTU1V3BFQjRNOFZ1d2kw?=
 =?utf-8?B?b2xPanBNcWhybjBiZFZ4bnpnVEVHYWhWTHJiNEdIYy9GUXY2WnZYeG5pWEdt?=
 =?utf-8?B?eCtHU3h1N1Q5MDlqMExQQ0g3RDNPdGhoWTU4MllkNmtvK0FzbkcrZHh5a2FN?=
 =?utf-8?B?WURLc0pPeVk5MEJ4OVB4WDlxbW5ScmFDRVJHdGU2cm1oREowYVBseTBJMUNu?=
 =?utf-8?B?R3VEVTQxR0VTbTVzczhDQ2JKUUdxZU42RzJERGt2Z2FacnYzQUdDL2hVbkJR?=
 =?utf-8?B?ZlQwa1lEcStmYVJYOXFnNDNrb3FzUGlwL0ozTUJKYzJWblRTT0t3UkNmSE9V?=
 =?utf-8?B?WDFmeENlWWdlbmNzOWFYQkdTWGJyS0U0dkFuemhkU2IrU0xpWUpVNVBmM0VR?=
 =?utf-8?B?RU0yYkFablh1U3EzRjBNV3dwY3dkc0pWSU4rV0dWb0g5cU1rQlQ5cmFyMTZw?=
 =?utf-8?B?dmM0dE4rZ2p1dkxaZUszd3pnRHI5S0VjSlhzUnR1Z0JXdmFpa3ZpMjhEWm5m?=
 =?utf-8?B?VWZPMVJENDlnWi9VY2p0QjJjaHdsYU5UN1I2TjBNbGRnemhOd1JWUjNyckxs?=
 =?utf-8?B?SjBJWWZ0L0RZMkF3YURsRGNBcmpqMmF5M2lyRHVtVU10akJMaWFDNFJ5dWUw?=
 =?utf-8?B?MjVoRmhTSDNXVno4dlVFcHRDbGhpdFpDRmVWcE04cVpJZzJzblJwVWl0Vmc0?=
 =?utf-8?B?NUZENm1UbUsvRzY3bnlEVlQyK0tIYkxDMkZCMUI2bWY1TFh2dTVxMmNjWDRO?=
 =?utf-8?B?RG9MdkR1VnNHOGY3TmZYSHRiZjlueU84SG16aW5MNVhpMnhzRVpqelpnMEJw?=
 =?utf-8?B?ODlrbklFOWtTYnArTys4Zm13M1MvVkI1L0pzNHA2UGREanJyWU1HQjhaNHNB?=
 =?utf-8?B?TXh1Nnp3R3FpVTltZGFPbFo1SXJoNGhlYkxYU2NadTZtNmRjRFpSamNQTGdB?=
 =?utf-8?B?V1l2STUxUy8wc0M2eEVDeVMxWVNzUGE3N0wyV2VYa0dwcEVvWDg0c0g0Q25i?=
 =?utf-8?B?anRVUVQ3N09rRkwydmhGWUFHUVNwNGJrS1FXcG1zQjdKZ0cva2xyVTlmUTY1?=
 =?utf-8?Q?uJzxuzOCyHH05/CX4vSADbdQ1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c378db74-f121-4c1d-ba0f-08db8832a828
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 08:32:15.4855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEBJHRmd+wZLBcOhRGZ9H5RAH0N8zqrrQNti0HaQFgGrnh4YlXHQPLxGDQ7woc6d4PW/3hpWRWvzgerrmMPyOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7136

On 19.07.2023 10:24, Federico Serafini wrote:
> Give a name to unnamed parameters thus fixing violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names used in function declarations
> and names used in the corresponding function definitions thus fixing
> violations of MISRA C:2012 Rule 8.3 ("All declarations of an object or
> function shall use the same names and type qualifiers").
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/include/asm/hvm/emulate.h |  8 ++++----
>  xen/arch/x86/include/asm/hvm/io.h      | 14 +++++++-------
>  2 files changed, 11 insertions(+), 11 deletions(-)

If it was just the 2nd file, I'd agree with the "I/O" in the title
(albeit as a minor remark and as mentioned elsewhere, personally I
think double tags in titles are undesirable, and blanks in tags
aren't nice either). So perhaps "x86/HVM/emul:" ?

The code changes themselves look okay to me (no matter that I don't
like some of them), so
Acked-by: Jan Beulich <jbeulich@suse.com>
I'd be happy to make, while committing, whatever title adjustment
that you can agree with.

One other note though (there's no good general place to put it):
I'm also a little unhappy with all of you often using "fix" in the
titles, when you don't really fix any bugs. There are certainly
cases where addressing Misra complaints also fixes bugs, but that's
more the exception than the rule. Could we settle on something
like "eliminate", "address", "avoid", or alike when changes are
merely about style or other aspect which don't really correct
functionality?

Jan

