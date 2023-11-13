Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C30C7E9E67
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 15:16:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631610.985132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Xjs-0002nD-4M; Mon, 13 Nov 2023 14:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631610.985132; Mon, 13 Nov 2023 14:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Xjs-0002lT-1C; Mon, 13 Nov 2023 14:16:32 +0000
Received: by outflank-mailman (input) for mailman id 631610;
 Mon, 13 Nov 2023 14:16:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2Xjq-0002lN-VJ
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 14:16:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7d00::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c97dca8-822f-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 15:16:29 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7973.eurprd04.prod.outlook.com (2603:10a6:20b:28b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 14:16:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 14:16:25 +0000
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
X-Inumbo-ID: 3c97dca8-822f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQ5ZhUM7B40tBm36uoDxDF+TCfBZyWMOkmhJf91vGcMIHSA0e4iAEPi2AhTEVm95ZDcX7yesycDNohGcxs6kIs3BgGMepyvbElcYzv6a6JbXOSsO3585yY8aZxRtncIba5NX1sE8j2KxWzlx67dApcusGoUmvIC3f3qFnGLFjoV6jb3BOeJ4/Bt6LWlQ3zKAS0aMe9qIyOGqZVgpD5WqyarkC6TzCcdUPWEkC66Wlw6ao7VREmP4pTuhaj6gvgSw6euB7xWW10gZAAXq4RCLX29FLRIXtdP3RtEph5Zy0mTNrXX8/aixRJL/dTVaJ6bwyXH6H9oVwltaHZTvVO8oEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTffHfv2bB3KFSHbxrGKwVy2uJUBGianQ3d4VxC/JAw=;
 b=JE7MrHEHCe7eWFKp1NzJa9JW5w47HCcScajr/NzX5nOQTh5hAUyjojQwjlaHGNeVRokXdljTe6Qx/QDINN0vgrca/KkV6NVk8nDDByZ3mAIYzkNUOwL0Fw0WuVs7dgK0WCFZVe+7FOlnqOsUx10JOOX6UNsYpeDKXtAIUvK5hexllwuflk7yX0ToaNpgTsAjB7udZiRZT/3dB97DEhgLy1RStvS210mXhDTOhYnij166aX3ii+LbLY+A9shfhv7VCw3Cu8tbg6Kx9+jDbk4u3R5nPvKWriSI65AELryLLp5qfnlTt83OIiT283ZppgXdiKu3tn5RnikQ36AKGKpN8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTffHfv2bB3KFSHbxrGKwVy2uJUBGianQ3d4VxC/JAw=;
 b=I6+jCNIl8qA2Z5AhZ/RI201LecWLO7HDHpDUTHWowQzivkR7H3WmstNQgNne52Wo1/4dLgz4V5ME3JxtrEtKtJgBBUOrtnkGLzDWFbE8ZEizXiJSVo/zltBaO4oztZHy6piXtqC0VOeO91D3Ad2iTeU/0b3mzTKpXvEbUqQF8wUri+WEZgxyTI3q0Z4EUwkdqEUTEI9+za2JPd7yCsEdHZCmQwcoV2b6ZAhdbcBRb3Xx+HczfBqgpsTmQXzWhdZuAcm7pBAJL8tto23D/DcQ6y3g4U+1y3IeV2hTttU2yQZrygBRFfI9PNakWeUtcBrN9KYKVfrZpy1krEyR14OhJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7207a9f0-c53a-228e-7482-31c2564b95b9@suse.com>
Date: Mon, 13 Nov 2023 15:16:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v6] xen: Add deviations for MISRA C:2012
 Rule 7.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <3646e75ebfc8b78d44578e3303bfa1660e0b684b.1699022991.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2311061649260.3478774@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2311061649260.3478774@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dfe728d-1393-45ca-4049-08dbe4531f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MAcoski8wnbGqwQUn2FfB00Fug8PuM/xHnjagFTPAiX2nLkUQ8szbCWqkuIGFDsJafcoIKfwTxFbuBHlesFFUi25NJ0dsIrphljyhtGi8nhAuvdM+tN0NrKkCK1yvxYz5C401oDAdNDyvPFoHqriybuZK5u81IouDwLux7x9CDRwnIAdweLO/YTqWfB2iYtZ4QoFDYDwaOQMGWCseF8tThMYf4ahtwERZ5iLCJm3OTvKCQtUUmhZ9G3V1tixhj/1NLcml2L2ZhKMM1F/gC0n2uMyy/EG9i3j12EOjqtjeEZg6BOKyPo4MAfctouWRbVpP7Lhod3FFfsj4/RRoMnD3utKaTYIzAbEueKPbkt3EyIPViBdthq0e/qUyYqiOEF88qZN4D/iZEKhg8rshFOIAMApm44XDAHrqzsCwcHqAuZq6OArjJu6DbYeMP/RxVzPswp3MuGw0Z2qNHCu4RSM4mlwDvY/mxvhcHqP8jGLdeJdEhREu3+NN1LlUhm5ulYSrvXnfMJ911zt+Dj7daidkYvX0you9iqZnecyIIrfE5I+vB25ZXrL44hhXxiFMHvebIObyWEnhFndqdfmHcCIIJcxfUTz9B1NN48DWx+rOIbAgcTh96NXk7ENGwjDm0n88854E6v+Cc1bhSb5hJTZfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(53546011)(6506007)(2616005)(6512007)(5660300002)(7416002)(8676002)(8936002)(41300700001)(4326008)(4744005)(2906002)(6486002)(478600001)(316002)(6916009)(54906003)(66476007)(66946007)(66556008)(31696002)(86362001)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlMrUHhGOEN1NVBvTGxZWmpVRHdBTEVSTGRFb29hUXlTaWhxOVRnN1JDM1FR?=
 =?utf-8?B?anNHYzZsV2ZDcGZwYTlsUzBhalZzOFYwdDk0bVc4dE1qZTB2OHNZWXQvZ0p6?=
 =?utf-8?B?QUxRaElBTDUrN012Y29mTVdjVURNL1kvSjZmbklHdjhyMmZSODJlTktGLzB1?=
 =?utf-8?B?OEViMUdJNDUvYUlDZ3diQXVCSkdXbVdKK0oveGRyd2h4aGFZKzFtVnZ1NzBt?=
 =?utf-8?B?TW5LQmpPRHJoYy9NWFJwaHo3enNNazZzNGZqa3hGSFRoOENsbW1FbHNxdzVm?=
 =?utf-8?B?NUd5T2EvQTY2anZmcWUwVEtlOXp6SzZVQjhSaS8vYVczNjdjeU5OeHNZUTdq?=
 =?utf-8?B?Q28zV3FueGF0VlVRc2FlWWhYMlhQaUNkc3p5UGt4WXc3aHF0Z3RuVVFjVjZu?=
 =?utf-8?B?MWRGOW5aQWpGdTY2SDVyYmVoZGR5L0lhMk5WdkYrK01iaDJnWklaS0FYMEVY?=
 =?utf-8?B?TWxJbWdhS2xsNnZ1NnorNlNWcFA2Wk5jUDlkK1Y4QUxxUWk3Rk9OaXlZV3RQ?=
 =?utf-8?B?T3V0eStubWtLc1lUczUzZzUwRHU0aTNyZ0xpdThyQWFIQUJ3MnNOYXNCM2Rl?=
 =?utf-8?B?ZXVRWGc4YjZnK2F0aEdDQmZzd3RyTG92RTdmb003Q0VQd21mRUgrUlFjdUdu?=
 =?utf-8?B?cTZCMTJlbW9BTnRWbDFZaVRTQlMwNEF5WkFwVDFqVWtPYis1N1BEZlN1WjBZ?=
 =?utf-8?B?SlVqTFdzWm02VlU1UXcxcHg0LzcvNzNKWWpWZXNpZmowQk5VaXZqRExRYmx1?=
 =?utf-8?B?dXNQYlhrVlJicUtHZHJaYmtvNzRQZ2FpZlVrR1VEdTdPVHBFTXVIbm5sOG54?=
 =?utf-8?B?eUlzSG9xdHlJcnBvVVdPZ2pYNktaaHo5R3RXcTV1Z044cjR2azBsWTRwNzZl?=
 =?utf-8?B?b1BZSkxLRUYzSEgwM3hUUkFwMk5pRzdsZkozTTJJZXViSkd3cGlodGthcFRx?=
 =?utf-8?B?cit1NmFvZWU3cmQ2YkU0dlkrZXNnVnVPTE1xdStubmNlMGdiTTZtVjh1Zk9a?=
 =?utf-8?B?R055d1RGa2VUckhQZGNjNVl2cURyYVJiT0VWa3ZlYWJYOVlSejVaRXZXdnZD?=
 =?utf-8?B?cis4L3dZa093WGo5aERGcUhBdWpxQ0VUd3BrTFgwZXJKK3V2YmVsNHhWTjdH?=
 =?utf-8?B?THhpcDQ1VldtRnJhOUE5V1hXSDBvcGcrUUVhTFBFRE4yclBsYXFLbmV3bnZB?=
 =?utf-8?B?QWlFWk85T1RVN2pVWVZZZXRSc05RcGNGVDg3VDNvRnFsMFpBMnFVRjRFNnZY?=
 =?utf-8?B?dXhqVk1SVjZ3YmIvMXl3TTFyNTYzMktUVThRd2twWEpXeU9Cd0M5RzFWbWU3?=
 =?utf-8?B?cm1OdklLSTdpRGJtN2NjRE5sNlVwZCtKVkZyRU9HTUZvQnV6Zjlta3VtYmRz?=
 =?utf-8?B?bHpFL2xjWUtBUDZyQUtnakEyZFpaSXVrY0VwbWJiUTJwanFHYzdZb3ovRTZQ?=
 =?utf-8?B?SmxHVUZDNFdnZDR0S2d0K21WZWJiaHpJNUlBRnF3Rko4a2I1enk5bytENWxP?=
 =?utf-8?B?SkMwVndKSmJqQ3o4YXJKZDlibWQ0WlhsRG1jdVpleEJCZFU1WkkzcytqZFdw?=
 =?utf-8?B?UEptbTZlYjQ0UlNxVTNZMnVFZEZoeDlxVFpOM2lmSjA0Y3o4amt1QldMU0ow?=
 =?utf-8?B?MEZGTEZZeDV0YVVZQnZxbSttY2FxZlFsTUd4SWsvWHBFd0JCUzNPUURZWjlV?=
 =?utf-8?B?T0FhSlBxQStxbFBGQmJOcnhEMHEvMTFYWDIrcFI3eHRxdnBhenJOdGZZU2J6?=
 =?utf-8?B?Y1VKeHB2dGRCVnZOTEY3aUEyQlcyTTFFcG1URGNvRGJPZEhLeHpUVGhzMWlD?=
 =?utf-8?B?NEFtNS9uZDNrTzE3Qk1Pbzl1UTBaTlJxT1ZlbkJUYVlVZGdaNzk3VlZ4NEdX?=
 =?utf-8?B?NGY1Q1dpZHdsZE9Oc0xWQStWT05ZNXhXMFJYTU5RQiswUEM3NFlhblZPTHlv?=
 =?utf-8?B?bytYcm1CYkkyN0E3THFZUnFodnNMNy91MllSbGNHeHFCTEtOdTJSNzZ4Qmlw?=
 =?utf-8?B?VWRZVUEvU2htRXc0YlBzVkk4RkF4cXdRZC9pekJ6aGZRVHF3eDE1bG13RHZm?=
 =?utf-8?B?ZlU4SThrT0pEMDQycEtpSHVISVc4Tjhabit3elJ1TVhUdXJGQmMxbVM5UURB?=
 =?utf-8?Q?JJtMvFcm4bxoZdSCLe6M9/B2Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfe728d-1393-45ca-4049-08dbe4531f03
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 14:16:25.8039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esF85aBG/p2hfxBOs98lr1GS1F/S41/RjbhMFYaGKMmLeTJ7RRM9xqide2eoWPrLL9X4KU9RdCd5F4g8cp36Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7973

On 07.11.2023 05:18, Stefano Stabellini wrote:
> On Fri, 3 Nov 2023, Nicola Vetrini wrote:
>> As specified in rules.rst, these constants can be used
>> in the code.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>  
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


