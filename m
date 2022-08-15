Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97FC5930A0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 16:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387511.623804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNazV-0003Wz-Ec; Mon, 15 Aug 2022 14:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387511.623804; Mon, 15 Aug 2022 14:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNazV-0003TV-BN; Mon, 15 Aug 2022 14:22:53 +0000
Received: by outflank-mailman (input) for mailman id 387511;
 Mon, 15 Aug 2022 14:22:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNazT-0003TP-LL
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 14:22:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdba4831-1ca5-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 16:22:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6545.eurprd04.prod.outlook.com (2603:10a6:208:173::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Mon, 15 Aug
 2022 14:22:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 14:22:48 +0000
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
X-Inumbo-ID: bdba4831-1ca5-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLhg+ZNRpClE45sdaAObqUj85qfTLpt8Cl6suZ16B7Se60nqN5nKOeSegwJTFaDHEnAUx/qvbe+jl2AqOMIKT0lg67nqCm61olJJvhiYzCQ9n52Ul6lhgRIltgk8mom2cyKPll4qJnZ/zb28RKroRCehzEYLU74MICJwnxElJKU4EETuxZwHFLrzkfFTiQFDsfG+cyTT/HKRmpGyRli5Hc0+rcy4081D59KTE+BkADr6HMNEp/Tj5X2YiJ48YQqq6EScBkRiQ4hxwIxI5BCAPE4B/JfaC2VJjWXqIzbsTLUklDxKB6Ww7Q834rGEQwvnt5XOi3+BITazVAIGLujb2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+U1Y4YOJsAYsYVDpmNjOSUuIUDnkzWOhjYre/EG8rcI=;
 b=FI3uVRIzKbjxi7A7WglCYsTF4Qh/raiD+FnV2j0XzDAj/K/x2k9vaFYxaGx2Qns19gs5HOskOvmUtzYBs+jaHbyM9L8WtZfPGRyV/0Pq2SYH1j8l8Y8HtibHJoD5F9IzrPcNq9pDccwpUJDDowuABH/PD0NLhDnJMNVVfFsf8YL1jT7bYqwm8oiY4WBr/xik1vq9zpqwzlydVGidJMmhAlBKWg8OzNe6mpD325lYmavN8w8cNFTaXD3yRjRzAoYUp6PuCnHkvkjAWQSVDNbyJg7SvT/eagsFgIyKvH+jvzb5Z8o+YipC7UEkC9cXgXwIg/20q3ZxASMc+AV2ulSGqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+U1Y4YOJsAYsYVDpmNjOSUuIUDnkzWOhjYre/EG8rcI=;
 b=yElEGJgMPReVLZBoLtram4SH2cHIDnsMVThIMAJAK1pBiDLB3cVUTVShwSaXiXOWnOnclA2o4ASLuIxXAaIRAzbwbAZiu5JNH7q/Sp2Z1iaupA6fMfj+ZEwdwXlFUVwUrNALGYsM59J5AwGBK33+/14EfT1W5hc+7ORc+TsxfR+xKZ1w0b3/QLEnIObfz94GxOXjM4Z39uy1LLqPPPAO+50yNpgg+NE2jTgqUR8HWaX9HOVAP0ApNR3gk8pk0XdBEV0iOFBN34W9svBUz9eYQU+VOuiZfOtKqOZu1UuycFF0Piv1Qso7/Y1NwOhomFCamSEmMV9l4ROMDBQyifhZdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd7b52c1-5ccc-8def-26d1-aa1f73dfe8ac@suse.com>
Date: Mon, 15 Aug 2022 16:22:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 01/13] cpufreq: Allow restricting to internal governors
 only
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
 <20220810192944.102135-2-jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220810192944.102135-2-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83ac2ed7-ce8b-4079-ce8a-08da7ec9a0e4
X-MS-TrafficTypeDiagnostic: AM0PR04MB6545:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gc+Pf/OvUXL1WMmZcnKZWatULeCe1yppBbIVS3g/FN6pKFkKwG32mZLAegEgpRIwIuwRpyiwSVRDZf9HEHjT2ziTkfxa+C2rRgYGGfjcIHTxq37k0GxzUfpZR+WqvluBf9G1y3RzyxRmkuvTVgmYxjHQlG7aXjIA16YflfWpdfSLM5rVk7WWOirJyanVuBxNjVc8fZuNbHsfX7xbYriz81z22M3TFY7I5glfR7YyVc3Wldj+Vrowj+19x5mQeSdlcH0qkIr5Orm12cpbSZk3SexFCVbmDrbm7f45dNK8nja3rcwU18AY8TeL4lkz1H+vg2HQJHbsGWngFR7uyB2zOORqfbfTF5G4y1SM0NA68GVzZQpLnGx63uRWFDprp2e7+skghuwYpJVwq5RuLHJuKfcfknzlvIuI7NC2euuLwf/n1Xa4pG19DpXKBdztf11UDd3NXRTusnTC6fvOiTbbi6XW2noctHOLpfzI/OHQfC7lFxFCJg0Jxyp57823Q4Vh1Ud/0ENMxM6PbZ2jt7pSLStNidQKyVmJP6IKuwcdoIWcpmfWfiJg44R2yRXTQp+O7iXg6VXk25/0Eid9nex9qLO/PDrLPu7YawWE1nikw4snylS9uAfBemsNYRHa4pWPqNxe4dXFZBh1ol53cpwQhzyNgViAifY48gUShCxsMoJmoeGpec0tLYP0GQ6EXBoF6zIf4AQYau4BisCkGvMi/frmcgrDXAbsfLQmdQ041QXH/nyvS//bcoMeZC1dVd/i6pomdG3ZUpwMEKIQuLmFWYnvpE88Z9eLqRjRV2ljzcWVkHDEk0mYGsnfuWmiIsJjvGJ3BJ+5y5ASV1eS1Hm0Mw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(39860400002)(346002)(366004)(136003)(186003)(2616005)(41300700001)(53546011)(6512007)(26005)(6506007)(36756003)(31696002)(86362001)(38100700002)(5660300002)(8936002)(2906002)(4326008)(31686004)(8676002)(66946007)(66556008)(66476007)(6486002)(478600001)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU9lNDN3ZkN6MGNvSEh6T2RyTHUrRGIvUzlBRDVqSG1wa2pXcExIaHpWMGpU?=
 =?utf-8?B?RjhsZ0lkeElibURtRTJwWGwrTGhGQ0hFeUdvYmFXUHNraGY1OUppNU5IQTdX?=
 =?utf-8?B?R3VHMXFXZ1pzUE1xem85ZlY4QmpNS3RIaGU4eFVUVE5TTlp5ZHFsZmc5dTh6?=
 =?utf-8?B?N1VyN2NnS2ZyRW91NExlUkM4ajZkcmN5azFaTVR6dFM5d2gyaG5zRzJ2OXlJ?=
 =?utf-8?B?Y2VnSnl6L252bnhzU2NoU2FGcVVSL3Fpd1Q5ck5mRUlEY1QrMVpROXh0ZWtl?=
 =?utf-8?B?b3lEcDFnMXRiOG1VK2MybS9NbFFpRlJtVlZ1alNSV3pOOU85SDlGWXhFVnVS?=
 =?utf-8?B?QjNHWW9VR3QzL1lsV2JIem1lbXFyR0VOUVkxRUlqMGNhZDJuOVNvN3c3WUVt?=
 =?utf-8?B?TUVaMU5rZUV1ZmRmNDBoZ1ZHNStTa3FUbm9hV0tLWFkrTGlhaC96cnF3cm50?=
 =?utf-8?B?N1ZiWXdJTFFCL0YxcDRRUmF6Q05iS0E0ekJZVXo0bmJSYk53ZXcrMDA5aGl5?=
 =?utf-8?B?ZmJ4L0l4TnNwa05ZcWNGTTV6azRpcEs4NXhTeEFJRkFZSFdlK3AvdU5yeitp?=
 =?utf-8?B?QVUwQ1dpYVYwYnFBU29nbUdBaVBsMWF5MGhuK1g3SkhBaDEwM29wYVBtdmUw?=
 =?utf-8?B?RFE1UnRMb3doaDlUU2ZMSWhGclk5TktQVWszeUdrOWREdHo3WFRGVjdUUDFQ?=
 =?utf-8?B?R2kwRVJ0MGc0aDFXU3c4cWlEV1NqeHpQSTRZR2s4bVlDNkZLeDIzTFI2YTFq?=
 =?utf-8?B?b0UvL3crNFFXamlhQ1cvM0RtOFAyOVBzOUNkemVQM2NxR3hHS1M2NkNQSlVh?=
 =?utf-8?B?RDlWUWdqWVZ3L3lDN0R2dDhJOFlmcWRuVzBhZkk1Vll2WldZV1FuZUFKK0VR?=
 =?utf-8?B?c0VlcUhtL1NPV2JMUTd1NnNwL0U1WHhnMlJveHdpZ0tXQXQvQnhSNTFtTUxD?=
 =?utf-8?B?NUxpNU5adEpzQnVMMFd4TnZGN0d0OTRBTjZlbE1veTlOWC9rU2tZTjJLTTEz?=
 =?utf-8?B?N3VPOGJPSlJ3L3ZjODVuWmdKMmRoM2tkSFFVc01RWXJpTVFqWUptYUlHcGRY?=
 =?utf-8?B?ekVibk42STVXZzhZem1ZZzYxendoR3l6bGtmVURvRkZIcXlXaUdDbkhJbXND?=
 =?utf-8?B?TEFEUytkMkNteHo1ZWlZcEU4VUxZRlRYT3JNRnVnNWxmaUZTWEt1bjIwS1Q2?=
 =?utf-8?B?NGdiSklRbkMyTUE0QjJURjdiV1R3TkdVMmM5cFd2UVcwOStxNWl1TWMrMEtL?=
 =?utf-8?B?TGxXQksxQnJmOW1NRE93YVk4THl1RGFTSWI5dXdHTmRGT2FuV0szMEpTZUd1?=
 =?utf-8?B?Zm8zcTBsSWlROFVkVVVKNFZBcnd6SnpZL2FzZUE4dlFNZ3p5WjlIa1dlc080?=
 =?utf-8?B?NEVObEFYRlBCanBEQUpEMVhQL0RvYWFrRWNaV1c0Q3NSMWVJNEdKQ2dWSmxo?=
 =?utf-8?B?cDE3bTVmWGV4M0ZNS0dMbUV3RWNLMTE3bnhCN3dGT2I5d1JMSjNqSUdBWmNL?=
 =?utf-8?B?VGtpRTh2K24wUDdnRmFta1puS1hVZjdRYm5HZjdZZWpheDFDczRRYXV5dWph?=
 =?utf-8?B?SjdaWUFmU3l2K3M0aU04aXJGSmh1cEMrZURSZzFHRC9PMVh4YjRXaWIvSFhD?=
 =?utf-8?B?MVJ2QnVYckFQSlVlRE5MUDJiMUxKUGR1d1lGN1ZlR3NQaE83UmkrMWNmZHZX?=
 =?utf-8?B?UGtXbC8vdm1zR3NpSDh2M245SnNxY1NBOUNjQU9aMW1hdkFQN1V5L0JzWFBy?=
 =?utf-8?B?b0NUWDJsOWpsQklMR1pYWno1cHppV1IzWFp4eXVsL2RQWHNSRzAvaW8zOUdh?=
 =?utf-8?B?VGJZMU54RUtqSUxWZzJlWmo5bUswVmpMTFJUd3dublB5MXVwSTUyYTU5bVNl?=
 =?utf-8?B?SlZWR3pta0tpRFFlclVqS2lndmgvQmtKbDFxNTVnZWhUYk9MQ2M1bXlFb0tJ?=
 =?utf-8?B?WGx4WDB2eXRmY0pleVZQWTJqazNkODJLLzB5UVhWZVd3MmRkUlNoUWZzWjRG?=
 =?utf-8?B?TTlnOE8zNk9WQmE1WFVDRVBNcVNLMFJ4V2d6emx3amN3azdycjMxVDh5U3U0?=
 =?utf-8?B?VjJXMUNNVlU0SWE1MmM5NmI1dFlWOWJ1elFPa2NEU29vVE1TeS9TY3M3NlQ0?=
 =?utf-8?Q?jlN9sJI1/0dA4ZQNTg/pAN3z/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ac2ed7-ce8b-4079-ce8a-08da7ec9a0e4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 14:22:48.0472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdelJHL9uASxspKObbM9loxoP2Ot5s4ImcRTlEM+b1gJuW63UsBQS/dtgBPMHIUrUrAFHh2JdyZKFWVc57aRnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6545

On 10.08.2022 21:29, Jason Andryuk wrote:
> For hwp, the standard governors are not usable, and only the internal
> one is applicable.  Add the cpufreq_governor_internal boolean to
> indicate when an internal governor, like hwp-internal, will be used.
> This is set during presmp_initcall, so that it can suppress governor
> registration during initcall.

At which point ...

>  Only a governor with a name containing
> "-internal" will be allowed in that case.
> 
> This way, the unuseable governors are not registered, so they internal
> one is the only one returned to userspace.  This means incompatible
> governors won't be advertised to userspace.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> v2:
> Switch to "-internal"
> Add blank line in header
> ---
>  xen/drivers/cpufreq/cpufreq.c      | 5 +++++
>  xen/include/acpi/cpufreq/cpufreq.h | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
> index a94520ee57..1fdd63d7b5 100644
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -57,6 +57,7 @@ struct cpufreq_dom {
>  };
>  static LIST_HEAD_READ_MOSTLY(cpufreq_dom_list_head);
>  
> +bool __read_mostly cpufreq_governor_internal;

... I expect this can be __initdata? With that adjustment
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

