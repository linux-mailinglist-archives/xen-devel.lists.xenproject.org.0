Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CCB7CAA10
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617590.960318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNsi-0001KJ-R4; Mon, 16 Oct 2023 13:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617590.960318; Mon, 16 Oct 2023 13:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNsi-0001Hf-OI; Mon, 16 Oct 2023 13:43:40 +0000
Received: by outflank-mailman (input) for mailman id 617590;
 Mon, 16 Oct 2023 13:43:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsNsg-0001Fn-W8
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:43:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01d5c385-6c2a-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 15:43:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8745.eurprd04.prod.outlook.com (2603:10a6:20b:43e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:43:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:43:07 +0000
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
X-Inumbo-ID: 01d5c385-6c2a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6aPjGOWd3Wywd8RNhockcT3Nkb5mqtyWIDuyD+FOO48mcxX6+mUBB9hh6ELTmvAYpUs+EHEjmjqvrpdIr74MymPluvPIgB8xnbsUCTeCkxKcMn3bXA2E/WnbTptDE0GVep/V/dZeCo/I/UZCM3OwUTxyfeeeooOppUEigGcS+gCY2TxaFnd/fgzPVlYi6QSLdVwdYni4+341QHxgmiYby25bpnPbi2O9vTwckLoIG69vN8aQ1mmBdx4j04mf4QcNQpby+hv6W6LLWw7IrjoeZt3AI9geFGW3FdTPiAKqrOXNH+5QQ/CPeoedikhQWDuz5RzHjPeb7SQeAbEe6aWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBaK3ZLoLXUarm5dtYSB7/wjB4AzfB70ZMT/mwqqPn0=;
 b=Uu0TB0R2X8pbLc1xL0t+CY2/gYpjkugi5/mCHB1wGFebWwF6lZ1LKdDLzHFOOrYXjQ/UWGR2UREO0UL1/Mkq2I22kyMTRYF4/WZ7Sok/7YmGy3xpJ6lylxxehDOeBVvXOHGPiSwg2x+mMUMbGcIEFw4ELp64dJcOST5QPbs40xWIR0Mzz/CepAMcBCWVVOGpPIaxpcDxPmdTrJ9ZQK1+H/+U074OOLnS1RP3JSTIWj+/rDUfuq/AWO+rGn2zAozHO/koGeLoSMtME48UXeQ3sZcZN7y1gty+Sfv0sD+FTlagp1UzsZ7gmmcA7XXUoWKfwNsqh5gSWhANlldd+rRvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBaK3ZLoLXUarm5dtYSB7/wjB4AzfB70ZMT/mwqqPn0=;
 b=irvl6z63AkUHb/NnbijMQCnAz/joL3Yqh7i8aq9U2NXiD8Ju5Q1VDnCtJyD7syhoVoBO1FijWHzavhv8aOt11zz7GBuLe9o1klxeCqJi3/r7KLoQ8ZhaLEoQiqY7kkg3YiRVTP1Kf9TRHOqV0/CHKFBsp60ltCLUDhfHkvVra4ju2eQ1hcvGQ3c66M0rgs4+PCSaCWCC4F07jSKj8f5hXi7H85hgCd7CeOU4VSQQhJOAhI3elGhxmIyrdA7+QHpOqFYTSdYFVLMrJmTrEa7AoThGF+HYHRPZ3GnqP1DG+hUfeDOCmGUlk1RLuRqPqCa3aj6Uky1vY+7I4ZWOL460XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7be93272-dc82-06e0-726d-030d33aee5e1@suse.com>
Date: Mon, 16 Oct 2023 15:43:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2 1/1] xen: introduce a deviation for Rule
 11.9
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1696948320.git.nicola.vetrini@bugseng.com>
 <c684c36402e6740472fa91d73436ca5790e5e109.1696948320.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c684c36402e6740472fa91d73436ca5790e5e109.1696948320.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 174a2838-425e-4890-ea50-08dbce4dd476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dAor8e22nLS8HuriVFDFdO6uiaPqOVliMq57beG7wcpDQsZFN7zXKpX+6+He7u3tIsXSfGDV/tYZH8vDIvdTqzNVVXs8WbINt9/9QbHX2cwrZQKt7uTFefDN/bToVX3l1w11D+IolXrY2dCT9tNg3o/yFuLEXmYvG+oQJKcBTJTX23t+zHGOvBr3mYiFqAR3cZ0Vul4zaS7KAy6V0AXXxCqorFLVaNo+orzK+3IhM8kXb0ohSQIA9QOXn70WIQ3ywxScgr2Pld2sdRYX3EuQAQ7/K3DvMCWvkl3pXBgACloPMjXizLhNyMiszecUkgp9P2S9Jdu9LEwkQDkuy3FhsbGtQc7VMJX7pTPma0D/pbUO1hHXR7YBtNEsgPBjDX1s5SdTYAvo3+Yh7a0rA54w2/1sNVV8NUNLVxkU1VAjBE7HGyQiWEXm6+fowZYHzW4CaNRMwHChjtb7dOVaNYo4bJOHMl+SJd84wdgXcAU9NI8PZuiFNneNMt69KA87LIWleiHihs8W2zldWX+AAmw8ArJ+slO88xljVV/IVWEdvG/JEFmldWd2L/WVH/hJwPt0S7V8L94Uckfpb1PP7EfBkO7b8Dy+p7mXJRJduFlyI0Oh7U1uPfY0xHYFIyFIPw9Wou1yE6Zvz0ZA8/11RrlHdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(6486002)(478600001)(54906003)(66476007)(66556008)(66946007)(6916009)(26005)(41300700001)(6506007)(53546011)(6512007)(2616005)(316002)(7416002)(8676002)(8936002)(4326008)(2906002)(5660300002)(36756003)(86362001)(31696002)(83380400001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkFNd0NINDdDeDlJOXVyUG5YNVM5eEhDaXVZdGlnV1oxS1dsUFZUdVFTRllM?=
 =?utf-8?B?NjhFakRnTmt5Zmt3U1ZSSlp0VDJreGtsRUJQeUJwemdmZGlwZE9uUXptWDlB?=
 =?utf-8?B?dlVIdSsxQkVlVEJTK21LR2dLNENGSzIxbTdFWVU0YklLa21qQXB6VmlBZVc2?=
 =?utf-8?B?NWJ2SXFSNEx3SWRDcXVpbFk0K0FSZ3laSnlRRlpmNDJTWm5nOVA4ZGV0WGNE?=
 =?utf-8?B?eU9rLzNYVWt1Vi8rYm1uaGNSRHFBVFpqL295OFY3THh6Qjlsdk9BSkRvWmNn?=
 =?utf-8?B?eWNjUXYzK09IeVMxaUVncjF6R1hmSHVFOUtiOWI0dFdaUWt1Y0NpYjFQRzdB?=
 =?utf-8?B?RFAyZ1gxMzVGWkNPVHpISzJZeDdJZDFiN1hDNlZaOGQvYVVJTm9hdEFFU3Zq?=
 =?utf-8?B?b0E1VUhhQlFOSDhwVXFsTmlSRWxhT2JjVlpob25aaVIzaFRSU0xRVUUycy9F?=
 =?utf-8?B?emVhM25NK1lsbVd1RUNCb1pISHNqVEpwMEdaSnJ6K1Exa0ZESlRpQmFVL0Uw?=
 =?utf-8?B?T0l4V2NKcElHSnpZQ0NqVCtHSTJIbzg2Z2ZKZFM5dkU4M2E1bkdnRzFxQXRO?=
 =?utf-8?B?dkdSUXp1dUZ3UzgxZENMMmhsVmhmajdsajNYUzJJZ0h6bXAvMGk2TGh6Tm45?=
 =?utf-8?B?dDIxQ2JjWGl1aGVSVlEydFd1elYzK1V5eXF0NU5aTHdCWmRMRFlKbkRza1F2?=
 =?utf-8?B?ei9qakhOT1I3cHpvVkhlUTlsaWJ0UkxDQ3hnQVpBYVNMSnlGb0R3bkhQQ3Rn?=
 =?utf-8?B?eVZTOVhUd1NFdHZ4MGliUS9hWFU4a2grTXN4OEVVNmp5RW45Y24waHYzZW1J?=
 =?utf-8?B?N0UvSmFZbGFvak5aSG1QbFJKQXdpQi9aSStzb2owaUVlSTNRYUs5My9ZS2xT?=
 =?utf-8?B?VFFZWkZNaVpFWmZrb1JxdGxOOWZhcDRaOXFjdUJDdkhQTVJzWHBnOFRQSHps?=
 =?utf-8?B?SnlkUDV6NW1xYlpTV2dMejM4RlJCZFJBdDBha3NFVUMyKzhVSjJ0bzJlVXZN?=
 =?utf-8?B?TURNM1M1K2RPWTdyN0R1dmFVM1FxY2FvaWsyODV5My9BV3dUNklOL2hDTDQ0?=
 =?utf-8?B?WEZDYmFVWUtzSmRYZjNnYnpwN3dNNDU4TWExdHFvbmE3R1luUkFBYWFaYVdl?=
 =?utf-8?B?RzNSZHcrTG40cTk2S1J5cmVCL2JhZUdsZ1Y4WEd2UmtoMWs0c1BXbjNVaHJn?=
 =?utf-8?B?eHdzNllCNHBWU0Z4bEErZUhhZE1pQVpBQkZHdkNFamlYTEFNUHJLUHVDNnNG?=
 =?utf-8?B?ZjloSEU3akdLN0FLZXpMd2ZQRXFkS1dPZm5OSDZOaHBWNnRLZUpjL2NzckZq?=
 =?utf-8?B?Zi91TkYxbmFjN0xqSGt5NitTR0pTcG1velNPSTNGV29xUlNPQm82QjFQZWp2?=
 =?utf-8?B?R2p0MVRiUWlBWkw2SU4zbjFJWnpMeW5vL3VqWjdVcjhhYzQva3BsV2NkY3FB?=
 =?utf-8?B?SExhMlhZNHdGd1NWS3UzbS9Gc2pDRHFoaHl4WGdnWVhKSm1YQWdsMUtZZ1hr?=
 =?utf-8?B?TXJ5MUN3OFh4azUyVzhnMlhBcnRhWjFjL2xpNkQ3ZEVtczVJMWpzTStwMGYr?=
 =?utf-8?B?VVlYVzJRQTRHRnl4ZWhMNDNuQUI2Sy9IcFUzMXZkVW1kK3lGTERIclpOcUZq?=
 =?utf-8?B?dFl3SlJIb3FJaGhNY3drdi96S1UxT1FXT2RPRVUxbmdQa2dYRWdWUkd5clhj?=
 =?utf-8?B?M05oOTh3TWExaUluSHJiRHdMcWlUajZxNm1jbENtTzE2ZFBBUmR0a3hJdmdX?=
 =?utf-8?B?Z0tkYXBZdG1NUzZUdXFWYUVVL2JleGlLT3NxU0lrdFZqUlRLYXFVU3laRENz?=
 =?utf-8?B?M2RnT0hkd3NmcHoyRGNkWnN5M2U0TTJTZkwxUDlQUWF1OVRXbk5oRjV5L0w5?=
 =?utf-8?B?WW9vUWRiTVBhL29oNGdLbFRuamhLekFQQlhENldsV3JwZWlZbTB5dlhta3dY?=
 =?utf-8?B?NERRVmdyZXRYRUxXYkswYnBoQXZrYzQ3UytnbEJSbWx6bTZjZDFRV2hnZmsr?=
 =?utf-8?B?cjlUVFJibFErK3lEV2VXaDNLaVVHWnRRL1NiR1pVckdQT2VVZGx2RXlka2RQ?=
 =?utf-8?B?Q0Q5Slo0QmdjNE9oV1FHVUE5Q2x4YXNuNHFXZWFZT1UvVVdHZ1dLT1Z0Ti8x?=
 =?utf-8?Q?Wo5Fo84wqCvspA1qgw4X6j71Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 174a2838-425e-4890-ea50-08dbce4dd476
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:43:07.6736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3YMDN6uohJnQKaFIW2YSvqWpJ5yMrd1/3S5xKodW+8domYl2+nvINk8ZRW+E8FvFWxsR16aJbtRYouZB1PDVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8745

On 11.10.2023 14:46, Nicola Vetrini wrote:
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -109,13 +109,16 @@
>  
>  #define offsetof(a,b) __builtin_offsetof(a,b)
>  
> +/* Access the field of structure type, without defining a local variable */
> +#define access_field(type, member) (((type *)NULL)->member)

This is not a field access, so I consider the macro misnamed. Question is
whether such a helper macro is needed in the first place.

> +#define typeof_field(type, member) typeof(access_field(type, member))

If this needs adding, it wants to come ...

>  /**
>   * sizeof_field(TYPE, MEMBER)
>   *
>   * @TYPE: The structure containing the field of interest
>   * @MEMBER: The field to return the size of
>   */
> -#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
> +#define sizeof_field(TYPE, MEMBER) sizeof(access_field(TYPE, MEMBER))

... with a commend similar as this one has. (Or the commend could be
slightly altered to cover both).

Further, if fiddling with these: Wouldn't they better move to macros.h?

Jan

