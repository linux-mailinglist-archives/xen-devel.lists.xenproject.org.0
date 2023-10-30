Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767D7DBDD7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:29:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625295.974464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxV8e-0006bi-AZ; Mon, 30 Oct 2023 16:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625295.974464; Mon, 30 Oct 2023 16:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxV8e-0006YO-7c; Mon, 30 Oct 2023 16:29:16 +0000
Received: by outflank-mailman (input) for mailman id 625295;
 Mon, 30 Oct 2023 16:29:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxV8d-0006YI-0U
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:29:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74a6b446-7741-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 17:29:13 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.16; Mon, 30 Oct
 2023 16:29:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 16:29:08 +0000
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
X-Inumbo-ID: 74a6b446-7741-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxb0wiVBpH3WpYSp1zj6e3WxCDWF4N5+lofQYKALx+Gp4kI1v3fcUGC6RsAmzLE7tKWIiC6VnQ1A1ZtfyWjuMdPTJbZkzG+PpIywtj0R7auObJWGWXMvEY7KmduuRNVfs9eP3KZwDJYmZAjC1QfptE4SueVtXl4ne7fB9JBiwFMtpMw00KXg+Dq4fq0gjMudt828He5fcZXo73xGibDWlAijGIUm0WeKCqNQndz4wP7a6mvQcPxuQr5/SndhDaYfEeo6uzDfemUu8y6MP7rmlZg3WAG1bRrkfBUFKH86T1VbT5dto8idj/0UBgKuzQMtWNifaRzRiPJo57R+FrWxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMeZPXrw5XYyfODhFdDzOiAAkUt9zFAYFaSApJILQS8=;
 b=ld094hssTALy45E/mut/d4VY8JA37jMYl0wsCQ/XsMC8lWnRJVxCxkhlHRbnDp6RNznf71UEN+88kRF7B2Y+HvIJuFknGHYXjxb11zDU9+6JHffX0niT0FYi6pGW7/6zwA0mAmhYhnUP7y0Sl6JyZt5+y3PYTHkv22mHDfH2XZWmpV3bSLRdvcCkMPUnRteiF1kbEekfkGK5yHtiKDvyLyCWQtMw7+in7F8kDOhwhhbNHymat8OyH63B692lBN5uewedEcFYq2iid6C40hpPhHZ83e+o3LKY5evv+OhNiIPUDFpZtE5ItmmrGt6HvwLO1kFSFEmvj9WAwMslgxvn5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMeZPXrw5XYyfODhFdDzOiAAkUt9zFAYFaSApJILQS8=;
 b=c4rELk6YXGB0UwNbzCBEIFS7JHmaLeC1tz3QJNQTJ883pRa9Gq2YZK0fKEB9UogopPmQB25wOuyGYdvjpCZLcwrwIG8aHyCG134q37YKKg3TNnkxF1guDHUVXj8dfepAg2Oy+RtGg4rn2jZjSvFRZuVxYbsTxDn1AyJ5wg2cXlwSh4k5HP5+riECrdVCiJz//8rGfLD4EH8NdDcDlQYOvaLklEir+Lo+EmqMm9NZttes+XY530vIoDdEsT4Ocu2wFQMTnAY30CkUZDYpJKEI6/k9c9f/fKtDcMg1Z9v4LYaFHDbAtVmhTqKAwL8t5BMD3gV+mzo68dYu4NJMLUrqyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac2eaa4a-36da-9d77-f682-a6bef25e27f0@suse.com>
Date: Mon, 30 Oct 2023 17:29:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH 03/22] x86/msr: always allow a pinned Dom0 to read any
 unknown MSR
Content-Language: en-US
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <4c04e5661688cf1de3e3fd668b0a78b23b6d7b2e.1698261255.git.edwin.torok@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4c04e5661688cf1de3e3fd668b0a78b23b6d7b2e.1698261255.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0379.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: be3632be-e86e-4d97-9ad9-08dbd965572e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X6iBExAWRXzFfHD+6fj2RQ4dEYO/rpwOGkesYyV3KwTspdNyYkWyF6SS7og3B2B7O211h8zR6ULcsyksvajZYnrTRJI1V1vbSlLku0fa1mcz+8nv9iFGFTNLohRdXLkZb6zimdgbc6gmlkukg3Gm+Do48ak5UNBN1W6ZWmhLYMGr8oJdA+Im4aHGERSnBZTmN86qqlIP5UKAnyhd+45t9n79ZllK9rADoyYat1CyJU5bbB8sxJYKX0G2xK4+q76TNG61U3u5LyO9Qv64I1AkCYTbnN5KutwWKtv8S8WBv45dJfkFwIfc1jzXoNkzAUV45x9ui/z9WwrmxI5xUPajCTTEeL/NsobC4UpUeOd9ilJZ+v28WYjiCpKKd76RHJ2Ua3Q67Y2lhUufmClP80FVk6ew7h+sokgmNWvY3XvLcrz+5EW/tc/He1hXwFMVCC+plP4BkzcZxZ6guPZ7cp8R3IP3vkqMyNAI3bzq8HoA9XSxwsQ3jUfNwLKluwc420leVsH+HodaULDiJ9giy0IjYi/SBmSMTdCKy4jg3HmdGMpqZf0+iSlIcr4lKX3gGe9pajx4Efpado61U7rsjJw7YHTvxYqzjp6+/KZTVzbokO9Zwo7zvkb0JBQogiFrQYovF7KwAtOWqIhSfyMnb5A+hA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(4744005)(41300700001)(6916009)(316002)(54906003)(83380400001)(478600001)(2906002)(6486002)(66476007)(66556008)(31686004)(5660300002)(66946007)(8676002)(8936002)(4326008)(6506007)(53546011)(2616005)(26005)(6512007)(31696002)(36756003)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjhGKzlnVUNZaE9LOXVlL1UzM0lLWWNzQy9vNVprQUpUblBuLzJXZ3kxSmFu?=
 =?utf-8?B?RW8zWXVQTlpGcitYMlk0VG5KYkNzZWoyZlhOOXgzTCs1a0VoRVlUNVQrU2N3?=
 =?utf-8?B?L0ZJRWNYOU56WnVJN2FYWkFmcFZJR1JCUE1QdVZPemJlRys3VzdTV3VXcHlm?=
 =?utf-8?B?UnZzYWxYKzkwYkVIWTZqd00wTFF0MkZHUTRKbUQ0TndGaUN0MXRGMEg5U05w?=
 =?utf-8?B?d2hUbGI4Z0x1WGRLNVBGb2M4OWt0UzBvWlpmcDlqNEN0bllpVHhQK08xaVFh?=
 =?utf-8?B?c2pDdGFBM0VNMDU1N0dxUlhqMEVJTWdJc0MwZzlHV3BGVkh5TURLY0pQUk5v?=
 =?utf-8?B?ZFQ2TlExYUNBaGJYZE9TR2JETUZITURKTVRTbGNFWi9rZ3BqZ01kT2ViK053?=
 =?utf-8?B?azgwd1NTL3A2MVI4TzNEbjlrQUtFS0d5OG1uTGN2aGtiTVpueHdxZmVQbUV3?=
 =?utf-8?B?Y3lxbjV4eFF3R1lvVXVadEd4Q3NPdzlXakxBRHovNElRVTFBMmNCUlQ1cmRZ?=
 =?utf-8?B?VFdoT0plMFd6Zk9mSHhKWlVWeVhKM1VyK2ZmN29zQ0pwTDBXSzB1UFg0enE4?=
 =?utf-8?B?MDBPd1krczF5dGVtcUg4eEM5S2xLZFZjMEtRN0pKdGpWd2lVMmlhZDg1azdL?=
 =?utf-8?B?eWhsMHFFNXp1RDlhaFNWL1ljdnRHSXVJdUVNUS9WOFgzYkZnNUtnNkpHR1Vk?=
 =?utf-8?B?Uk9wN01kYnltMjNXZmxKV01QSmZURzkvaFZoRkxlYnhoeHZTejhka0pxMW9i?=
 =?utf-8?B?c2R2MkNPNWM5WlpNYWE5SVhqQUJLZ29mNHV1OGZYamJOUGZOWGwxWGhpbFdL?=
 =?utf-8?B?UzJhUjUzb3VpbDg0b3FZSUxXWHF1L3drNWdsaVc5cmdFMnd2NW9ZQjB6Mkdu?=
 =?utf-8?B?bjlDM2syYTI2eGN1Wk9Hb2F5WkIzbW95Zk1TQVdnWjd5eTIrUWV2WVIvZ2h4?=
 =?utf-8?B?S2ttVDYxMDZ6Mkx3cTd6dGRwV0hxZHNpenppTk03VU5weTc2TlAzQ2cvT3d3?=
 =?utf-8?B?MUNxdjBaRER0L3Z6eE4xZE1rZlFOMlEyOHZVTUVJTTBBRDZrcWx3Z2dDejdN?=
 =?utf-8?B?TXV2Y0c3dzVsWWZWTmZSTUZvdFl1cGdvU0t0TnBNeGplZElaMlo5alF6RjIz?=
 =?utf-8?B?SEJ2NFB2N1ZkNnJ6dkRZNmlYVHBmYzJiUmpWWnFXSUlpZjZDUlY4VWt4NVZs?=
 =?utf-8?B?SkdpNC9CbGEwemxjNW9TOVd3czRBNThNcHByeTdkQ0E0aFgwU1JkK25XSDFY?=
 =?utf-8?B?dXN3NEpNbkxlVzlKK2ZhbG1RMVJqU0FheHpWb0FkQzFDRm9FMWNZVml1bGVV?=
 =?utf-8?B?OEhITXpNdHQ0aS9xUzZmam9NK0Q2UDZxM3lNc0tUUkZRZVNBdUtJaVdVcWhI?=
 =?utf-8?B?UVNKMHVna2UwbGc4TWpSVWNYcHBCKzEvcHRyYmxmS3gva05ZczkycnRhdGd5?=
 =?utf-8?B?emRZR1IxRzRNUnVtWko3YVhmbXkwOE15a244WTRKVU9Ib2pvYnp2L2RLTkJE?=
 =?utf-8?B?S2N4T1RqbnM4a3NxZmhnZDRmM3BwZyt4Y2cwYUFKWjI2eVpwZ28yNURCem5S?=
 =?utf-8?B?bWs4TzZ6Q05aWm1KMDdpTzNQM2tja25BdjdJQUcvRkJBUHdTZ1dtYzh1KzhY?=
 =?utf-8?B?Z1VUYkNkSmdsdkd1bVJuTUk5TTVLUGZMSUpyNkxvVStrYXJCaDEweGdWMHQ4?=
 =?utf-8?B?MC9scEh4K1MvNW9VcFQvdHNEblp0TnRhZmVVL0xTQUkzZ0VUNjdiZ2NiTldv?=
 =?utf-8?B?TUIxblU4MlNIR1pVSnVrV2o2T2FsODJ6MDJVMTJyQ0JlWlFCZ1hIY280MldF?=
 =?utf-8?B?UjZQWDdPKzJJU3lwc3pIZ016bjU2U25XTnV4cDI2NWwxRVBaVHRTWmswYlNV?=
 =?utf-8?B?Rm5EOStpTW1YUzh3Q2F6VkkrSlJiUHhlTXdhQ2l3M05uV2ZkVlNuTGU5dmxG?=
 =?utf-8?B?Q0RmNW53WDErOTlNMGNtL2gvdy81WUI5aSs5ZHFXeEFmTy9HMDRjRmdzUXlN?=
 =?utf-8?B?QVVCK3R5SHZFVVNJUE9GSkVvOEp1MjNLcmNzQ1ZZRGxPTnF4NzNrVHlDVTJ5?=
 =?utf-8?B?TTRqSy9Fb3M2a0FmSFg1dWxYMWFUYjF1Z3FXUmVIT2VWbHJFR09sbkFtUzZE?=
 =?utf-8?Q?2ngsJ/fINvMVaZWQvfMErYw4X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3632be-e86e-4d97-9ad9-08dbd965572e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 16:29:08.1986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2dY9by8Fry+LYR3kaHXG+PVNi29SwuI5LA1M8+/0ngL4yzz4B2arjta1InTywgkRCcxbM+WKqVx+W5zHvrsjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9089

On 25.10.2023 21:29, Edwin Török wrote:
> This can be useful if you realize you have to inspect the value of an
> MSR in production, without having to change into a new Xen first that
> handles the MSR.

Yet on a non-pinned Dom0 you'd still be lost. Since iirc we generally
advise against pinning, I wonder of how much use such a change would be,
when it effectively undoes what we deliberately did a while ago.

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1933,6 +1933,9 @@ static int cf_check svm_msr_read_intercept(
>          break;
>  
>      default:
> +        if ( is_hwdom_pinned_vcpu(v) && !rdmsr_safe(msr, *msr_content) )
> +            break;
> +
>          if ( d->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
>          {
>              *msr_content = 0;

If we went as far as undoing some of what was done, I'd then wonder
whether instead we should mandate relaxed mode to be enabled on such a
Dom0. Then, instead of returning fake 0 here, the actual value could
be returned in the specific case of (pinned?) Dom0.

Jan

