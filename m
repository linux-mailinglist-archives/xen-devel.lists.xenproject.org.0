Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA4D6F657A
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 09:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529570.824076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puT4W-0005Du-4T; Thu, 04 May 2023 07:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529570.824076; Thu, 04 May 2023 07:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puT4W-0005B6-1i; Thu, 04 May 2023 07:08:12 +0000
Received: by outflank-mailman (input) for mailman id 529570;
 Thu, 04 May 2023 07:08:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puT4V-0005B0-8C
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 07:08:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bc27803-ea4a-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 09:08:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9994.eurprd04.prod.outlook.com (2603:10a6:150:11a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Thu, 4 May
 2023 07:08:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 07:08:03 +0000
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
X-Inumbo-ID: 6bc27803-ea4a-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJK8lApNMuCDa6EhPpym/yWjsLTlG0QQxtoUFI8cYht1bOXkHwW7dhvGMlwcNg1uKmCJ9WZsSJlqcj/fXU3NNIc+rK4dNn2OCAQ6SKn3OHAujEbQwntMc3lsDY2+0HSQp7Fhqyh+M2IfyGmC552qx7idEL8sor5IaHxX3ihbG7Al5f7sEQovpjBlCOYARHZZLclK7iRWDxb/nn6d4yVd6edvLsDoIsO+qkDuBzTcKQkH9NedTj7dmW37mDkt8KcPayhtc2uWn40db1qp9pua2HXtphd3QZ69wM09sA7RZb79VHP+vmvQhXw1pBIJ9NdiIeKMHDgJWVPJPdtxj3oKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMCovZM5a+5Fe3ZHk/ZrcwEFDoMx44Y0U1aq3mDeCHg=;
 b=X8sKn/gVa9kMTKvq1sS3RKaynzLi5t7cYOB9lwc6hoQs7Bj1IxxPSj3Q5SjhzCEu3IwECN0mAaX84s91pnxD0k4hjITOwYMDCHfHZCjs5fQyVJaHeABfu4SHJlRi4wLnUpCEUOoyWecepMQCzeXDYmYznikVhw6ollNuhHVqdyUwPufBAYRvmiAFvL5rHinOglAHh4RN7aASnUSeBVySsSX+8HTdkIj6OPMiu+MSxkJqPgP75k9GoDO+O4978NTL2D6txcHRUNjVTH5VX2GZSYkmYqmH0+c8bOO9pN1o/rz29kvJcmasDR73m5iKVQTU9h8/Y0GgGJ6AcLDlAuBikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMCovZM5a+5Fe3ZHk/ZrcwEFDoMx44Y0U1aq3mDeCHg=;
 b=fDmkOD5ZiOGtBToTpAlobXmUMzeRxy/N4QMwpCmxe6oHds6zV0U/GOaHP5kqvYOyYOsBR+ILp0wx0Tvg0OLTYvNjrCx+yAMVqLy/txZdgcGKxDX839HTSmQAghZ1wreKvXeJyVcFQBnwzszOS+EcW+T/XFeSTwFu9L59Wmm+nmKalFW02arWhsd8q6/NtK7g6JVC2+fZLl9VTzrkdUDrA8B5EB9CKI+dh1CQX9qb07J1HYygwAUls73GvEjIU8WYwHW3sUNvlMtgGu3Ibw5aLp69CCH5BhGV0TLGkiC2YSa7D39TSNaDAqGzEQuj2DiZbIUjZbueoAsaw+LP8oxG9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ccf68f0f-6fd7-a9a4-ef72-03999d11035a@suse.com>
Date: Thu, 4 May 2023 09:08:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86/ucode: Refresh raw CPU policy after microcode load
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d4a750-fbb7-4a1a-373a-08db4c6e4d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6N0pE+SRulAfFCgkWYLUMMXDq+lWyGuGEY0+2Oyuub8xKRtb6zYiLwFw9ArItYgr92mXf8iNA3hPd6mfvyYC6XictQ7YOTKcnjSR5ASKmNm0kH+TeT9XHipGM97NSxVXxYZKOULQKclmPUwMBvbWYa0NtEWCX9I0qQcU5+NgRX6M9j9JsIBPs0yh4F6CYisqbT9gJ+v4YQRs3J8l1fXEUOZXGpEn5hnyFiL900LEZMdbh5/u4xb+5XIe91+Rdqiyy31iAPAIGjVcxF18C+AtwYuy/SnHWD9xVDkYWYkkR4kFKlCNTQMHcAdWj3dcvwr1GBXO1+5VoBPX65Icu8n5kD3EyIXYPRexdoaUYtgFU2jtsR9krptHdBzXi7dmfgF78LGUAxOnh3zpZLf84/6b+39MDDJIt1ssIG9gnkARB/KYVRe+cR6gmjy5Xqug3J7tG6Is/XnM4lLdjr4C1Jlw+RdW0MVjajoTBew+xP9ZBdzT0P7RJtpXSc+5bilUeWLo6hiUOjErOqnFMwJQb8/WdKMgwNFoRMfjwsi3LDt4X54v/CD7Puncel0LQvEJfOIJQH1pENh6PHJ8kmMEC39f7pJdCSkvEkRq52Yy7HYSe6ClYLEDEt/a/s+dSYYemzsnG2ceHyi7+ieO9QGVXhY5qg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199021)(31686004)(5660300002)(8936002)(66899021)(2906002)(8676002)(41300700001)(316002)(6916009)(4326008)(66476007)(66556008)(66946007)(38100700002)(83380400001)(186003)(6486002)(478600001)(2616005)(54906003)(31696002)(6512007)(36756003)(6506007)(53546011)(86362001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUxHaTFoaW04TExJUW91RklBTG9mQitoclErNVd3d3VJT09hV0h5c3NzeEd0?=
 =?utf-8?B?K1UydkFxOXVBM0NDaGZnZVZhb1Q4dzFldlJ0amlFeFlUR2IrUWhBNXUxRlNL?=
 =?utf-8?B?dkRYU0tXVGhuYTlGTVhNSVpRQmM3a3ZoNm43VlQySXROYURsVjBTbzJyRU0w?=
 =?utf-8?B?UHR4aWZVQUtYaXp2Z0hFOElsSnNacWYwbzV0UUhDTEtSMTlTZ3BReC8xN3VV?=
 =?utf-8?B?eWZNKzVObkJpNi9zRXZaQ1BBejljTGpoK3JlbC9LV2FnWGlIL1c1ay9Ieis5?=
 =?utf-8?B?NHFOTkt5Q2lJVEc4ZG0yWTBGSitLdjMyQ1NTZmdsM01kK3c3MG43eEJnN1lK?=
 =?utf-8?B?KzF6QUJlYVJyc3RvRXV2elNoVFRWNm9WV1BveElIUU94TVM1akx4bEZXRDZK?=
 =?utf-8?B?NmVITnN6ZE0yMnMyS1pSLzJ6bHZxT0ZFa0dWa0N2Mno3eEdGazFRVVRSWjRk?=
 =?utf-8?B?QUFxd3dPbitBMjh0NGJpTktjMUc3VnBTbytYL0RwcXN2bURDUlZ4NWZLVFVN?=
 =?utf-8?B?Z3RSSjlEOFFlR3NXeWZpWFdHeHdJbkVPbjRiK3hlT2kvdzBuaDFBNHduTlNG?=
 =?utf-8?B?eHhDcm1MVmptWFdVOXk3VFRzd0xBMlpuYlYxU3BCNFk1OE1nMEMyRXFtaEFM?=
 =?utf-8?B?eUN1R0QwZHBzSEZUR29VU1FqVVNPeGY4WVRtdXFYd0lqdHlZUzVjZjdhdURv?=
 =?utf-8?B?RDludm1xTVQ2YndiUFpzblMwME9XYm9kWkdETjQwRk9wb2JJQmllY0JMa1Ny?=
 =?utf-8?B?Q2piNDhMNTFhZXU5REQ5LzF4cGxHa20vN1c4MnNtTGU5KzQ2eDI4Ykx2SEtO?=
 =?utf-8?B?a21pdFJGRVBGMEJhRkdNakJCQ3BnYlJwQlY4QWRIenVoc1BPZGVNWXVHTVdW?=
 =?utf-8?B?dk9uRnp4QzFEZnd4TFNjbElGYkhEczJ5OFRVKzI5VEF4RTVpQ2xleHRzMTZ2?=
 =?utf-8?B?SzFLMG9UTVpJeWNGekZldkFuK0ZSLzRPVDdWSGI0ZjkrWmh6NnNCd2ljOEJJ?=
 =?utf-8?B?ZDNjL2xRcnRTc1dGcHlaWkk0SHNBb3R4VE91VktkSFArd3FWNGczemZRbUY1?=
 =?utf-8?B?R3JZM1VsNS9FcnRqVXhBTVBEckVLS1VjcjRtazU4ZzBhRXNPc3F4cERmNWZr?=
 =?utf-8?B?MzdjVXpLVnA1cjZVZkJ6T2hKMCthYUs3Nk10Q2lPMlhaVmwvM0hUZ05yV0Nu?=
 =?utf-8?B?enpLMjhNSGpUMW9KVnZ5MnNpaTlBVElXaFJKSFhURWZrSEZ3UzNXNkFETzJh?=
 =?utf-8?B?ay9CQXlXVlJLdStCQVcyVmU0SmFvVWZVdEdiZUZwdGRaWUpmOUtadmU4UFZD?=
 =?utf-8?B?d01PbVZITnJaRG5SSE5GbEFicUxnSStBcmlLVG5uM3Z1bFAvb2xSd2pjcVlP?=
 =?utf-8?B?a2V1cm9xMWY3dUtKZTdIQkpSL1pzOTVPekc2ZkNTcE5tV256SzBZcDUyZ2pW?=
 =?utf-8?B?YSswTEJHOFlTeGs4M2JEU2RnR09NMi95M0ZBa3ZKTytzL2JlZ01VNzZlaDkr?=
 =?utf-8?B?ZmZwSkhTZDc5R1JPVVpRckhicGVEMC9nZmh5KzZNSHVVQXpqVE9UeU4rL0c0?=
 =?utf-8?B?djR2QnJSSkZtYmRGaUhsVVZIeXE5Q3pSQ2ltTTl1cm83Tm5nZE1oSlB3NVlW?=
 =?utf-8?B?TG1HY2V6cVBjWFJuYTRwOTFHcnpzOTlvRGpxTXdybXVNUExGODlSVzUvYytn?=
 =?utf-8?B?OFY0cmxscTFqOEZVcmNIclJWbTVXWHZ6ejhkVFM1S0VTSGFyUnpHL1l3NU9E?=
 =?utf-8?B?SUhBbzc1RUFNdkRBSGdBbjMvSk5nQmlFTkJOSjFaR2JTZk1kZ1l2Yy9TTHV5?=
 =?utf-8?B?MVR6SXh1V3cxeGtTeHk2MTI5V1BZRWlRcDNTKzQySGpiOHRqd051L1hQQWl3?=
 =?utf-8?B?eEMwNWxUdHVzdkFuMjh5cmFMWXVlTHhGMkRiUmlTM3I1YzU0YU9TYnJadXkv?=
 =?utf-8?B?clBtRnF1MU84MXM2VktMUE8wRDVBdVh5ZUpWL09kQzhvM1VtTUFBYnk0QVU3?=
 =?utf-8?B?V09ZSUs1OEVLWHpTQVQrZ0VmK243cHVWc2FOQlJHTFY2eGFzMmlMbmtVRE9Y?=
 =?utf-8?B?T1hTbEhxYkgwU1djSkp5aHoyTGRyQnhUc3Awa1Z2TEVGWm5OMEtYbDdxOFgr?=
 =?utf-8?Q?s8H7F8fy/2rWuA3cyk6C3A23E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d4a750-fbb7-4a1a-373a-08db4c6e4d4c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 07:08:03.1123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySQCA00UbaDE7s6AJDCte1d8MrqmQNEM43NOgGKZ0r0EALxUi6dQOI33tCYD8xXJAyBI8esf0FRKATn0gVh/gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9994

On 03.05.2023 20:58, Andrew Cooper wrote:
> Loading microcode can cause new features to appear.

Or disappear (LWP)? While I don't think we want to panic() in this
case (we do on the S3 resume path when recheck_cpu_features() fails
on the BSP), it would seem to me that we want to go a step further
than you do and at least warn when a feature went amiss. Or is that
too much of a scope-creeping request right here?

> @@ -677,6 +678,9 @@ static long cf_check microcode_update_helper(void *data)
>          spin_lock(&microcode_mutex);
>          microcode_update_cache(patch);
>          spin_unlock(&microcode_mutex);
> +
> +        /* Refresh the raw CPU policy, in case the features have changed. */
> +        calculate_raw_cpu_policy();

I understand this is in line with what we do during boot, but there
and here I wonder whether this wouldn't better deal with possible
asymmetries (e.g. in case ucode loading failed on one of the CPUs),
along the lines of what we do near the end of identify_cpu() for
APs. (Unlike the question higher up, this is definitely only a
remark here, not something I'd consider dealing with right in this
change.)

Jan

