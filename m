Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90607850EC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 08:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588965.920631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhmf-0001wE-T8; Wed, 23 Aug 2023 06:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588965.920631; Wed, 23 Aug 2023 06:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhmf-0001tM-QB; Wed, 23 Aug 2023 06:56:05 +0000
Received: by outflank-mailman (input) for mailman id 588965;
 Wed, 23 Aug 2023 06:56:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYhme-0001tG-Qb
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 06:56:04 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe16::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f7c5311-4182-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 08:56:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8237.eurprd04.prod.outlook.com (2603:10a6:102:1cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 23 Aug
 2023 06:56:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 06:56:00 +0000
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
X-Inumbo-ID: 1f7c5311-4182-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQyZuGo6/Hugnz2edWO76euLxLVPPhlabLBzlIQy479zQKF9VLcvgDZPFrxs8F8vyF1aQxK+0I0Ik7BUTAcwScq/EIAU25Hs6L6IQ5vlcwLF783sAhbGhJIEvYN71erRIFaAeznepD6iAIdvur0vjEzlCAp8VF9t5vCr6xSHtj5SryNTil0OSsQYWwq8bLEPEYHeRnrlEBDkUHUVfAn+KTbGsnJOmoydMVcfWmMHOiVKWQuHDNL4REXFO3+cj41EulnQRzlPA7MQegvj4nmelq8Lztl+fXVBlXMME7zFb7tlQX9L0izpdl7ogDUPPx9b8RBtXC9j4n0GSH7oe7gUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXnadGLEX1PVRHhnDnCP4H+Nrv4kKX5YbCgEP1SFTIQ=;
 b=LdnqrT7VSwMJzAivZ8XL3TpdoXBsKYBDi5ZYjmI4S4BeK19/484FSe7gylIs4N5mKSrdQVg4tPSFtN6C2L2ZMSxwUpLDO/li+rxyyC9AtcMarN+RacSKZBhgq9lYM5icIXNOjfgEC4osvfpjRbSDH42t8u25v5oJWGXdQyL24yV55K53kVY/EswhGCS30R193cHape6e0WdIwqRJ9gyr4rn25Tf3vTV+7gqUQprrlY8g1aVpUm5cSD6AOIcjPVVJavnsuVAPTLRVV0b1JnbjnWxR+tuuUHFCGvDXMYv1PhYmG4rosotSLINy0ydoE4lZ2LqTNUcBjQ++deNLN5rt1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXnadGLEX1PVRHhnDnCP4H+Nrv4kKX5YbCgEP1SFTIQ=;
 b=Dlbl7beAmstdoh/XSMuD19DypFVDhnSh+8YzgjeI/00yXTwHLgYHeQQmubpUd9NQfM7Bl32EROH1ovyGfFoK1RjrZVM13X4pNxymVmMGcxvCkrX7Cr+uVWFm/kJZzAjlkSuMSu+UZIG1V65NgM/Yz/Y/kx8kUH+HPiOr8KDG2rUfipb1fx/Em1OB6j/CNSR58TZJAD5s7upTnS0UqwniZRU8wY1z1SjF93sjEXrH1zV9xj+Q3nmKZDMEZqwmmbS0POL8ifjqO6g3+fC3or3gPjBtizZH90uRNne3FElC0cll73y+2SK9pVCizVB5dMiiCIxaKnGNC1V2C5xtNqcRYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6776ed41-de83-91f5-d7f8-e84f65c65db7@suse.com>
Date: Wed, 23 Aug 2023 08:55:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] docs/misra: add rule 2.1 exceptions
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 nicola.vetrini@bugseng.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230823002458.2738365-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230823002458.2738365-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: e186d430-31c1-47d8-68ab-08dba3a60264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ARj7sqMTe64foBC+EBvEx8XOKn7qZscoxkSMDPz8Ctw/racz7SkyQIVhK31TQW9R3s/J2sM52nhmeItreAsNfSBKXvXM3Ot6MJPqfn8sqw3hoNdiGZKBqrcIRmoapjjUK4JB/PoYn0/5SSYOodAooRLmIOt6S02phSSAFTRh2ATp/29uiOrmW3Pmz2qpnIHGOdbhtFbH7OSK7iSLvxkscjTHcVT3PrvjJcf3z2OXQ8ORtMehkWCPZ9ofg9RPVJkyLw8G8q/GThi8hdlqpMPet+fOp+JjjFHkJrL1UgFjlZCaPfeYa0qD69/tgsMFJ1kHsqrYSlIR1FcJ1xNvld1zPcps3ZVDcjMuiqwuH4Ldq5QmKq7XN9V1ogD8c4PzWvoQjAMkvqAD07FD5IqsLiunochaEE40UvH5Hz1ub7pzIe+tyfrq29GjO1xaMnhtOKMIgenhmA32mZwHnw5jxo2zyxn9YjqqexbHAgkjZ8NlgqmIUzZL6gqegmUQ7PKX7sqYARLX/YXRLh17sJXvOIKw+NYxbBs+n70R6t/R+xO53Q1YXJVy5BfzugjK+abZM/bF7OLEEoguaP6OFfXV0B2w5qtWpLizCIWFSBp2uy1NZ6dXum/iVQX5uUPYmZuLP1SSfVgtEgW6/WqF0GvN1W3Uig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199024)(186009)(1800799009)(2616005)(53546011)(6486002)(38100700002)(6512007)(31696002)(41300700001)(86362001)(36756003)(8676002)(4326008)(8936002)(316002)(6916009)(66476007)(66556008)(66946007)(6506007)(5660300002)(2906002)(478600001)(83380400001)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzZIaGEyTjkyZUlWNlZiZmtiOHR5QjBZNk5XWEYvOFJ3UW14MkVEUmVmM3Fv?=
 =?utf-8?B?N2FnVDBiTmVlWk53YU5VSHZmeldTWU1oUzBXL002dTM4eWJmaXFXeFY4U3dj?=
 =?utf-8?B?dUFjclFybUpYQ1F0bzY0aDdKOStEQXJObUcyVWlOLythZFF1ZU5wY3Z5Tzc3?=
 =?utf-8?B?dDh0QWpsMXZuNFJtY21PR3VoZkVoY1VlRXZDYTJFdHVxdkpvcEhJTEtGeUdv?=
 =?utf-8?B?VGFXaXRjM04yTUowR1l0RFVLMTMza3FqOERZRUVCSVA5UEkvbzYxcDdNWFpJ?=
 =?utf-8?B?VUJZdnpZbDhSUkdtbVlpRll1RjltV2VnUmw5Zk1JMXFIeEwrdGRJbkFjZmsy?=
 =?utf-8?B?cC9VamZLdzNLcEw2M0doRXdZZ1p6VCtlTzI1TjI1SHdkalVuR0NsU0dicGRm?=
 =?utf-8?B?VUNscGZNODIyMTlSOTRUOGFZTlkwZWNYWFcrei92OEw1cStCR25SUE1XZGg2?=
 =?utf-8?B?ZkdEVlU5TVI1QjhvMGhmOVVnbVp6T2pRSk16Zkt0eVR0K3lwdVBkTWFOck5v?=
 =?utf-8?B?a3g3Q2lJSEhsdXlPTEs2cUZDWmhQSEZHMjNWQkMzWng2R2RWbFpEOEZCWnlZ?=
 =?utf-8?B?L01VUmpueEozTG4vYS9qaUhHbjVkMTRhSmFaZGxGeUFJZWR3UFBOWmVmM1RY?=
 =?utf-8?B?U09DNkovUDk2UVI4Z01mUllxdmJkUTJWT2t5R0NORUdiOFYyY0hmSGErK2dK?=
 =?utf-8?B?V09hNmJuc1U4RnpHYUlPeEN5elJoaDI1Q2d6MjNxVkRxTHNjOVZScXdTcTNW?=
 =?utf-8?B?N2piTkR5TU0vUGJWT09ibXlqeDRlS0xOOXB2RFRqN1VGbVB6RVhzNWc5b1h0?=
 =?utf-8?B?UURlOGhTZmdKeEc4RmM1VGM2RDhUemxCMG1ESmp5WlVCME5OWlk1RzJTUHZw?=
 =?utf-8?B?QjBxTHlxUEdPbWxNTmdRR1ZuVmJqOUQwTHVhK2x4dmdubzlhdmRQNzVmbTV6?=
 =?utf-8?B?bXhqclNCeEp0VHlLZVphcERkUjE2blE5a3FodkU3cWJXNUo1Vzhpdmw0djVP?=
 =?utf-8?B?WGpsbnNuREM3SS94VS9tK0JXYkV0WjZXNTUvaGdsZTZvQWZ4MVlmT1hJWngz?=
 =?utf-8?B?NDlOWGwrM2NsNjJqRzFhSmJ1OVN2dXlNeFcyaDcyTVNlZzJmQVRQN0xpU3Ba?=
 =?utf-8?B?Njk0Q1dVLzQ4NlBHaXVFbURNd05icXBYU3Uza3I1VUtWOEFUUE11RXBwSEFx?=
 =?utf-8?B?SGtIdndrTnYxVVUvTGVwOXRSSHVRbERFdTE1b29yQ3VoOUhyWStvTW1ERytB?=
 =?utf-8?B?UVBZNHBuYmZXYTViSUI3UytHT0Z5OVB4Q21DeDI4aURaL2xrUnZQbktFOUpq?=
 =?utf-8?B?QWpFTFl2OUtQd1BVdkFDaURJWGdZcGVQOFAwT3pObDNnTEY2NGxJZU45STlm?=
 =?utf-8?B?a0E5cm1kK080WGhJY2I1ZkxnK2pqSzl4QkpRbmI4eDl2aEZTVzZKZGI4S0t2?=
 =?utf-8?B?QUNEWUtjT0hwWnZxTUZxZWR2QVJ4YmQ0NjhYZnhIYi9lQVNMaC9SOWhsd0oz?=
 =?utf-8?B?ejBaL2djUEJFcDhwMFNUekRNWkV3V1F6UE1YQUFFSTlTSHRkY3MvQnFqODVs?=
 =?utf-8?B?aythUGxrRFpCYWFySzJLTmxDeDkyTjNNWDNpcXRyUk5GTml6K0o4cWdaYUVG?=
 =?utf-8?B?ZTNtK1cxeTZlZzhYbVJ0VEp5ZVgzY05wYlRQaGcvOVlMNzhHaVFTcnZaQm05?=
 =?utf-8?B?azJFM1M1NWprYUVhTkRSdG9RcURSUDBmdGUxanVnS1FteWtDT3k3YnlmMGZV?=
 =?utf-8?B?eWFHTnc0SFRxK2JieVRlSXlJMXUzN1FCMkpkNUlzZWJBOUduSzhIcERaZ2pZ?=
 =?utf-8?B?ZnlOSFlveThKYzhQZ3VJRk1zWkgxYm1iS01rMkhOaWdod2t5eDgwWmozL08x?=
 =?utf-8?B?YjVJcWpzSjJOU2N5RkhJYnMyeE9sUWFiME1KRFVmQU00MFEvY0xtKzNyYWFj?=
 =?utf-8?B?TDVzVVFocEw2UUNwUGFvRGVMcFZuWmhtb0NWYlFIYS9IdzdXMWI5R0dWclJ5?=
 =?utf-8?B?UU85em5oOGtkeTBFampNVUcvQ3dDaVhzQWdXTFpab3o4Q2VEcnRlcUk2RmpH?=
 =?utf-8?B?cldnUWdoK01POURZS1M3Z3huay9HVDFUUnVFTGVjd2lLRFp5OGc3VDhKVEEv?=
 =?utf-8?Q?vQg7eUOsFfoK10tTSn6jVlvDx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e186d430-31c1-47d8-68ab-08dba3a60264
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 06:56:00.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85krvpTbE23NP0mpBRbWVY3yRivJKvFcudxtUL1DKW4OF7BAbSCLfoMHbc9RSTPuXZxjVvVwjXH8p9rlzd+Kcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8237

On 23.08.2023 02:24, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> During the discussions that led to the acceptable of Rule 2.1, we

Nit (as before): "acceptance"?

> decided on a few exceptions that were not properly recorded in
> rules.rst. Add them now.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  docs/misra/rules.rst | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index b6d87e076b..8f38227994 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -107,7 +107,18 @@ maintainers if you want to suggest a change.
>     * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
>       - Required
>       - A project shall not contain unreachable code
> -     -
> +     - The following are allowed:
> +         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM)) { S; }
> +         - Switch with a controlling value statically determined not to
> +           match one or more case statements
> +         - Functions that are intended to be never referenced from C
> +           code (e.g. 'do_trap_fiq')

Maybe better put it the other way around, "only referenced from assembly
code"? This is because "never referenced from C" also includes truly
unreferenced functions/data.

> +         - Unreachability caused by the certain macros/functions is
> +           deliberate, e.g. BUG, assert_failed, panic, etc.

I think the "the" here wants dropping, and even then the result doesn't
read very well imo. How about "Deliberate unreachability caused by
certain macros/functions, e.g. BUG, assert_failed, panic, etc"?

> +         - asm-offsets.c, as they are not linked deliberately, because
> +           they are used to generate definitions for asm modules
> +         - declarations without initializer are safe, as they are not
> +           executed

Provided additionally this sub-sub-bullet-list then also translates
correctly to the various derived formats, then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

