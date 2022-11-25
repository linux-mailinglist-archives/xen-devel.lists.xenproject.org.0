Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE116385F8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 10:19:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448125.705003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUqP-0004uG-1y; Fri, 25 Nov 2022 09:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448125.705003; Fri, 25 Nov 2022 09:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUqO-0004rI-Um; Fri, 25 Nov 2022 09:18:00 +0000
Received: by outflank-mailman (input) for mailman id 448125;
 Fri, 25 Nov 2022 09:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rprq=3Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oyUqN-0004rC-Bi
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 09:17:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c7daccd-6ca2-11ed-91b6-6bf2151ebd3b;
 Fri, 25 Nov 2022 10:17:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8022.eurprd04.prod.outlook.com (2603:10a6:20b:28a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 09:17:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 09:17:55 +0000
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
X-Inumbo-ID: 0c7daccd-6ca2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfxIXci+jt8fjNnj+h6PzRcXT1Z0btT5DClxEJgZlg89SWbif0wEAPBJPVxDImHX8f+9L2dAwgvHZEi9k650/PrH3Qtdp56AVA1dpMYBYPJvh4Ngu26268I48PiSAx1YqOM+ZwZVhRvW1Jj/bWFCQfmCDK7hzVTGWn4mzKq+8d2XSvyL+K1Mh19oZjE86awB9UnmeYTaMMAhDfUoXS0sxmlhmpQDrJne/s81amzXvYHH+uGwhbfyHQQ4rd6cCvZG9DNyqbM7zGuAl2QIRmBJ1aRgexgn86CkU4W0Bc6sfHN8I6AGORcecH7ebRy71bw5HqhZ743+oTdqG893mPfPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8Fx0aXdUkvYV9pxscOdGfz/m7b7C11B1FxCnhAwm24=;
 b=IHbF5/mrIa5IoERkXQntnEXNBt2uTuOTgf8uHWfcBomy3crcHHbHAVYzkxbvmPlpw7kmtdmTqojPsKbLqG6UEqpqAVMJMWjK7AB99qMG9/8G0fhG8ijo7fB5ngSShcfvXNlYiKfr3/xleC5NIZHZubeCtYdMxkxFj5OSg/QGLYGi/Ws9Mb8l75JY1cLsJ9cA2WlAPls6OHMZ5sa5chlEtEHXq0Q0HrHA/BNHYFMaZKagvbddXRCiLULWzQn9qIUvLqlfk8ivz9fk4mSJYO7hAAEq7GfUDnFCbITDc9DFxJskp+nP3o5daAQjRb+x0CnC1H4y+sG2UXossD+HWB5MGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8Fx0aXdUkvYV9pxscOdGfz/m7b7C11B1FxCnhAwm24=;
 b=hlb/cNpx8wlTwlygbgooaOP/VoXyOxLovf4uVclSGVPYFYL8UGCHcuNe2znu/IotUyNQoGX9x5qEbyr+appzNgxpSAi9fgwz8FWV1jXC1Wd5/aqXzu3B65Yc13KE1THroHW8lh4x/kuY7+p0RpK43A261+xz3gYco7ZLcz9t5/UPmtx53FOgq4nYykZwLUE4T80zcu5l3z7i6Ab2mE7vIQcD1ipR7Ng80HQsDi0BvPot8Mng4zXd4hKZ+z8JHlqzqFmWnubsXqNGgA1gZztkrMZlW2xSbYPwVj9kh+v366ElKEcNCFB/w+wwphQoe3ydrnUeZTcHj0FVPURDkHCsEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6819d05e-d1ab-fc3e-7795-bac650df3bc4@suse.com>
Date: Fri, 25 Nov 2022 10:17:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] process/release-technician-checklist: Explain how the
 banner in README is generated
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221124190850.35344-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221124190850.35344-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb405c7-84d8-493c-2093-08dacec5efa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lF5gZUBXJUbfNZZ3zmNykzYxjKTTs1a0ver5DSmelMd61+TWzwvSYDdfJo2PWRE+L0gu5PLAyL1s0X6qXk9b4v/Q09Z76UBx4Lka1s40xl2YPB/mmwSIgMLG0wJFrmh8F812drT4FCtKM08+BJivRwa4w4TeDEYqBOZzZfgPf8MuKchjhg3642uY5gQsMsF/2s6DdA1D9hZqjwICCDf7j3nw+1dOQ9tTHbbDlBypZuqzKKDtDFq6Lgl6aXnsEWCnTMgBKY3Y0yHqDEB8HckoAMn284blx2A0eMNPYv8Ihwgx5I5zm0gx2EAr9FA2g8V6bWu5ebjppQ0f8nzZancppglE3unkREn/76j0S9jNoubo2x4L5GpAPSZdCW8wQTlZOsAXGHe7wrHZmT1gwmbtLwWVMVjyZbj3eH35Ab7N2ebXlE8inOWLAhOpbjr+8RYKQoKwPQGHR1aJfwvQyqwtegUJAoDt1li9slQa8nh8k7W4Xoq43Ehs/2oFzkeqX8mv9CJpcmmEMguLY8hAufFPwogGPBeAyAmBg1WPjdCmpZS1a/Xa7TbNIKkgZHvb/nizeXsBZDNKMJ34ZrPVFCnPZURY4iv3/gWKUZ/Li2VQR83ny6zYc+jGGcrNZUp3LdmXoySdQc66cE45g9ezSEseVY+50oGAF8O2Z1lQo7kn/3PS9DPJDWs/W1Kjr2Pda8SyC41Q4brhS+Fz2qBf8zZAAH/CyB0+/N22d8Sa4fobwfw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(2906002)(31686004)(8676002)(4326008)(86362001)(5660300002)(31696002)(36756003)(66556008)(66476007)(66946007)(41300700001)(8936002)(316002)(6916009)(6486002)(478600001)(38100700002)(26005)(6512007)(6506007)(53546011)(186003)(54906003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHZVbDdGR0FWSFBqRzB6Y3d5THc5b3FyekJOQ0plOUZ3U2JZRUhhdnoxTEdM?=
 =?utf-8?B?dVNscDJvTWd2R2FDbHdVdWVNUVc5T3E0UC9lSnBBMHBoazA4dUVGUTUxSWg0?=
 =?utf-8?B?YlE2UW9FL1EyZjBlL0Y4L25ldnVEMnNtOTE1dXBIS2lkUE5hWFhPZE1paE5s?=
 =?utf-8?B?TXFHV0xBZ2lLYUhBQ0lWdE5IV0N5Z1dOWDBzQ2RMNUg0QjNaQVA1NDNTWitM?=
 =?utf-8?B?VzBpTGZIa2I4eFo1UHU2Z0Q5TXpYL2JqaGdmaTJwTGZZZGR0Mk8xWkRRaENY?=
 =?utf-8?B?SldWcUh5N2Q0Y0kvZjJKV041TE9PLy9FRWZaU05PTE5obTBQZzFSWHFpOGNB?=
 =?utf-8?B?S1gvckJFSWNuQkdPOXlvSWUvcFBZb05nK0ZyQitadEFoRkZRVDh4Q2Zoc2dZ?=
 =?utf-8?B?WElaWjNVVm5CTnN3dXhUejhVd3pkemFxMU5FcmFUOFEySzZrVUV2K254T1Ba?=
 =?utf-8?B?SWFBWThmb0JZdW1SOE1pY2w3VDRTVmpGNU85N25uaitRZ1hNZUNoSnZ3RG8x?=
 =?utf-8?B?YXd1ZldxVEhlOEhXd0luYWhqMk9DRy9pL29OVFB5RzlKRGZIeFhuck1Sc2JH?=
 =?utf-8?B?Znhpa3VQUjk5OGVtNzBtRElNc0MzOXZYRjlsMlJhemt2YitOdWNBc0ZwV0U3?=
 =?utf-8?B?Q3pvVzFvRkxoaTVpc2FuRHZWWnlzRTlvNXpUNTB3UVVTT0RuZWF3L3ZkM3I0?=
 =?utf-8?B?UTN6cWFDVkxtUmlZNmZPTGQ4QnQ5SEhwMk5RNWdkTWE1SVJyeFdPQmtHMkFR?=
 =?utf-8?B?dHJSeC82bTYzWmJtdE12aUR3cko1Z0xMWk5tK2xsMDFYekxXUGZmY3NIUEZN?=
 =?utf-8?B?SzNlN0FiS3VQNXRNbUtnMldUSjJhVkg0djh0aElhSzAxbXovMjJ5WVRReVFa?=
 =?utf-8?B?Z2l3MHVDUDRiaVpKREpYR0FDZk9TQVlMMlFYelhzUEJIdlg4cGR5WDNseHI3?=
 =?utf-8?B?RExhUHorK3hOdW9yeEx3WnpkVGpoYmdHdVRUb3NHS0dzUytYcDBlUkdPZC9R?=
 =?utf-8?B?MEU4ciswYU9TTERDTkNEd0E1bEdzNmxKdytkSm10TUFiMWVlRCsrUnN2TkN4?=
 =?utf-8?B?SGpEMlVGWkdRcGV4cy85V2VjaVp3cS9JSWY5aTAwby9Ka1dKc0N6R0dGN1Zr?=
 =?utf-8?B?WFZLUUQ0K1VzcFdVcHRKZmt3NTdQajY5VXpQdDBXV0F2a2d2UEN6MDBQVGdF?=
 =?utf-8?B?cFZUTXVnUVlSa0NNb2lIZjc5bmY2NkVJM1J0djJuaWpJZGl0WjlxMUYvNEI4?=
 =?utf-8?B?WURwdWlmS1ZvUkZ6VUJ2U04xSk41aE5mZnA2WlNMU0NyNUxTNExtRlBvZ3RD?=
 =?utf-8?B?a1A1RU91UVAzU2VsT1huNUtpZTZ5cjdmU2V2c3A0dFFpWDhuaklUQzA0cDZ1?=
 =?utf-8?B?U0JMWk1KeHd0bUllNm5kRjNydmZJVE9jNGE0dW05bHRpeENoOVlFSWdyZmlT?=
 =?utf-8?B?SC9xd3M5aGdoM3hIMkVrQlVRMGZZL0VGRGtIbHo4SjlIemEzNTFMcTRzbHNl?=
 =?utf-8?B?NWd4Q1MxMVdPNGc0ekFvU1RyS0V2K0ZhVjVyY1pzT0RBSDF3dHZIbzVXL0da?=
 =?utf-8?B?MjdJdWNQOXBJRWQvWWFMaVNLb0hLUit2VitsQ2s1VS9zL09oWnJScmxiMjUz?=
 =?utf-8?B?REtTMGUrdkNHYndER3dkeGdudlUwR283QkdTcVA4RUVpRnBRZDJZdEVOajYy?=
 =?utf-8?B?SUlJYlhRSldSNHRlSE5RRDNrbE55TGRqSGtnYy83MTF2NDhITW5JMG5IY3JO?=
 =?utf-8?B?bkNTY2F1L1R4Nno1azc1OW1haUY3MlZJem9iNzVORUZGTTFzK0pBQWhUZUo0?=
 =?utf-8?B?NU5UZGx3RE40OTA4R2RONjI3VkFsSDRWNHVFd2l1Q2ZpSnJMbzVOK3VyaVQv?=
 =?utf-8?B?TTdROXRlSzBKazFYTFVwdGVGMjlNQlllQ3NtcDdGQ2FieFovc1RhdHdhSTMx?=
 =?utf-8?B?dWN6Ni9EZWZ3T2hVaHUxMlZZa2RibUtjNHBsUklDNjRrZUVhNHhSbmdKdTZM?=
 =?utf-8?B?U2RRWU9KL2t1cmVrTTY3SjRJeFN1WlRrbE9sS00rUFR6ak5abkQzNC9tSGs0?=
 =?utf-8?B?RUhQcy9QUU5XZk1xWWJGT2JyRlZ2K3EycmdUNnpVY2EvUVdGS3hUa3h6Wmpp?=
 =?utf-8?Q?Ro8av8rIaJ3x6sJ6f02uO76L1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb405c7-84d8-493c-2093-08dacec5efa4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 09:17:55.3705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckqCEDuVM0ZEfgWpeaGRxsecfNmhrIaGC3rFXXELd2PDLubXmBp8lFsclLIEDsN2Qk7ujoBBxgniM58ZmJ2LFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8022

On 24.11.2022 20:08, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Explain how the banner in README is generated and take the opportunity
> to mention what it should look like for RC.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit with a couple of nits:

> --- a/docs/process/release-technician-checklist.txt
> +++ b/docs/process/release-technician-checklist.txt
> @@ -48,7 +48,12 @@ t=RELEASE-$r
>  
>  * consider bumping sonames of shlibs
>  
> -* change xen-unstable README (should say "Xen 4.5" in releases and on stable branches, "Xen 4.5-unstable" on unstable)
> +* change xen-unstable README. Should say:
> +    - "Xen 4.5" in releases and on stable branches
> +    - "Xen 4.5-unstable" on unstable
> +    - "Xen 4.5-rc" for release candidate
> +
> +*   The banner is generated using figlet
>  * change xen-unstable Config.mk

Perhaps insert another blank line between these two bullet points?
Or, if they're deemed to belong together, remove the one you insert?

The new bullet point you add also would likely want to match the
others in style, both for the number of spaces after * and for not
using a capital first letter (maybe "generate banner using figlet").

Jan

