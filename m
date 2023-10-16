Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628107CACE3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617718.960607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP9d-0001Pn-Qv; Mon, 16 Oct 2023 15:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617718.960607; Mon, 16 Oct 2023 15:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP9d-0001Nz-O8; Mon, 16 Oct 2023 15:05:13 +0000
Received: by outflank-mailman (input) for mailman id 617718;
 Mon, 16 Oct 2023 15:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsP9d-0001No-8J
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:05:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67796894-6c35-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:05:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:05:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:05:10 +0000
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
X-Inumbo-ID: 67796894-6c35-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El1uvA6tfj1G8TmwCn9o9eaPUU03sNvuyocL2LAsoyZOrJgHQBBvPtTb/mDxXMqtNm/VLvE8oQHRD2/NGa09JZAvpcTrSrkkxjHG7Fmiq3NowW/7Cd0jb+ATDk8K5VY83T+5ugq7AL4IdueJG6PFah5IuBGJx3+qevSEBI/aN2a7RNhgcr/FmXp9s2REVH0fLVkflFfMlml8e/pD8iPOBl6wzEmu/BV/6QF5f3y7/gl9+lHqY8mE0qGaWlLfxedRXjwd+n0VG7iNcRQ7UPKp5gmkhZK1mrVhZjN7vm950BZjr8KPSX3CgA7Nsgb692KBGhs/DWH3bV/c4y/K60UlEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VReKBjPhO6xQ9477Q9HPXqG14/UFQxiVdtksTYevc9k=;
 b=GwRtRrytR2j24us5uNPdlB2JGKy62RoQPfXlQUOXgZr7YJF+6HDTrZGXTt+f5siTDz7XS1d1gjxDHiwjoUxie2kO8OFtKKGTH40VMydsBjjEyLbjw0xLO0+k+6mGsb0khWn58a/YoFZcvsGihJQCofPwhY4K2aJodM5qheV7cUaEK4Iz0Rc4/tA9OM8p4DysuPaBwMnuzbq8y124+JVxB0fGnUo3czmHpNO5JD3qyhue1H1n1GwSj8n9/eSCsHUb/OzgyTEJwrsT0tN379GkULLm0CWOG7gd6ujfsddUHDqKpSDKoJZGWVVeWO7dE/KynqjOMI+ig0h/7GWbow3x+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VReKBjPhO6xQ9477Q9HPXqG14/UFQxiVdtksTYevc9k=;
 b=iYhk1ia3E3TjGLt20jmVuSWTsmCKaH44jhC9V8+9HzeuSxu5zfvs8BTtWtnKD/t+/B/UgQe9GYEl++qikBiiIdhx/GGqehyJrXHuzW+5pW+p5Stc0g9KCDmwaceoqM68p/uQUJKe//lPFgLUCG7JpkozR5n9YKbzQJhxeHwyDnFpD3HFHeUsnL4p0DcKVyXvSCU9pP86cXgbiFITkbDyJFrtV6E+J9L49OeWii0MaBc1VqURkkzvzxCKbMRipqI6iqGH5R5VZqDzKHGcSss0flQpLISI8TpSTm4wCA82/pQ3+5N0EwZwqOBgJ1bTRc3HLPlu0TWgkLFVt+G88OHvdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7eb91ca5-c078-a3bf-8c7e-7456a89a2d74@suse.com>
Date: Mon, 16 Oct 2023 17:05:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 2/4] x86/uaccess: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Henry Wang <henry.wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1695972930.git.federico.serafini@bugseng.com>
 <7e32d3b6c078a7692668a509d05c44175ad99310.1695972930.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2309291352560.2348112@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309291352560.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b14d5f-2e98-4b61-908d-08dbce594aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gSruRxmAyCHRh7TTezDTRu/TP5xl3gGwPP88QDHedaG22+WN1+kL95qu7lw8hbWBySh6QjpqbDR5s7NfSqtu3XEFmZytvB7flupjonxnehU5ndHcy4HioQ/NDEKQsRSlrtxSkvXxRNuJV0X0AK6LxaZVqrEsHWCRh7RTfhGgzbqMg852uaqdhKNqI5BF8GLewLDUohDuUrBIvmyymPSDx41VQVBhGOijgg/91b7ewCNye5w3KMaO4Gyea9jv4/jBcIvCzsMJJ9sEt1isv83FkV73elgAsAuntlIYttaGroTQ/MgfHkY+DJYXzziOv/0OllIyhdGjj4Ty+2DjYmNLvwFwe7kdcBvUL13Bd6XDIZmQ1RtOIpuZw2ms5bSZnTVqqKJtC/p53jz74smyqLWGllo+zwPAr70Ml4QijChDdE1+758nz8SUJtCOEAFg20vF0xxIkde8JA9rTTcvEJFbdMakz04l5QDYiEvWqXXwRKhrWwy9sJDSEZ+C0In9teqIVivwR03YQfK5WMtNuS2ZEnahp8soj1BdBnJrXv2GP8aCOSRxma7/fgCdjQ3Mkc4aGgkTGoT7OPd3AzF1TnW6tldFDDD1724REEf5wLcchCtOTQY299WlhmSWGE3Y4S+LasnBKRv91+cDMcCJDU3SOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(41300700001)(6486002)(478600001)(66476007)(66556008)(66946007)(54906003)(6916009)(6506007)(26005)(53546011)(316002)(6512007)(2616005)(8936002)(4326008)(8676002)(4744005)(2906002)(5660300002)(36756003)(86362001)(31696002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG9nNkpwQVYzZTR3MXJBYy84TXZyNDArWEtvRXNoSmNjM21SSGp5VUtWbWlX?=
 =?utf-8?B?QTMvemVmNC9oUFRVcUpYZzBKYjM0Q3NoRGZ3a2N1K2JURFE2MHBwbExNOFJj?=
 =?utf-8?B?SllMdWtDR0oydW05OVhsUm9DNXo2SXYyR05OVlRTRkJTYXFkR1dua0ZSZExi?=
 =?utf-8?B?bG54aTUvMmJFMy8rYWp5dStzYnh0bkRqcUpWSUQ0eURaZ1JDOTh1RGpEUGJF?=
 =?utf-8?B?ZG1YQzBVczhzdURaU1BzWEVYZXBGVzBZRGdiVC9KSnpUY0lNQ0JVK0dVdHg4?=
 =?utf-8?B?WmNyUzJMNTdPUTJQU1lLQ0JYYmpZS2JORXpyQkR3bHRyN1BUd0hCWkpGUEtr?=
 =?utf-8?B?TFFBZWM2c1dzM3lhNEgxTWtSeC9sZmV4aVFHTkx1cEc5QzU1QWQraG1vU3k0?=
 =?utf-8?B?QS94WjVRSDNXRktUNWFIclNGZzY2RTVSUS80cEd6TVFiVFVKWE5YS1NUTnNl?=
 =?utf-8?B?QVBMUWFaMWNsbTdKaEc5dVFkcGFaQXZwQXZXYWt6UDYvOEhLQVZBMlFOUU4r?=
 =?utf-8?B?SjdWU2M4MjJVZ0FpZ1NEZm1QRlBoeXFERTFjdDY4RmJTS0RpZWZGUGp6YzZq?=
 =?utf-8?B?Q2dzL3Z5VEFNSGV0dllaeStuM0t3WDZGZkFzUEprUnY3c0dNYVNiTUFOT1Zo?=
 =?utf-8?B?c1JLZ0kvd3VhUklENnhkZ0ttbmpNOHl1N0RlTGpwZTRNV2F6aG1meXNxSnNV?=
 =?utf-8?B?M3gwMmF5eGZyREhSc1pYb1NWZnJ3OFJ5KzRpNmxXenNOM1h5clA3MGxBSXVG?=
 =?utf-8?B?YWNBMElxb0QxVzAxcGUrcURMTGwybkdQcytsQWVyQ3N0MmVnUzZqU01NaXRZ?=
 =?utf-8?B?QXgrbDNmTjJ5d0VkSG45UHQrbEdhTlRBOU5PQUpHa3V2dEFNcGJhOUdxbHB3?=
 =?utf-8?B?cC9rb0RiWlFmRmhhcXVLakljNmhrcTlHKzFneXFSQitZNTE1T096OG1nTFYr?=
 =?utf-8?B?c3R0aERnRnltZE8xaUtMY1ZuTkhuazhOQWNicDdtZG5mbXZ3UHlaWTZIc0Jx?=
 =?utf-8?B?RHVGY01OeCtjT3FOTUswQnh6VXdHcUdwdlhLSTV5djVCZFlkOFk2cS9HQ2p0?=
 =?utf-8?B?dXlwY3ZhZHhGTWtURThyVkpxcGlJT1ROenhNMkhFcVNabFFZak4rVGUwK3Jp?=
 =?utf-8?B?U1luTmdhV1c3THFyRTZVNlpRMzdYMXhvT0dpelYwRlhuMTJKVlIxSmVOYWRk?=
 =?utf-8?B?T3RPV3V4WG03SVRlV1R0WkJuTFRPb2FtNjRRWTRCd21qSkdsdmpBWWppMDJS?=
 =?utf-8?B?Qk9DdU8ybEpPRjYrT0tadGloZVc1MWFNTDhodk5JN1RtMVdFSU10S3VmeUdJ?=
 =?utf-8?B?N2FUMjdTejB5Y1lPTFpPdHczaFlmby9xcjJZbWlBRnUyQWlsa2JWY1R5Znp2?=
 =?utf-8?B?ZCtVY2ZZMFM1dUR5R0ZlYnhYMkNjOUtaRjV2MzNRNUhaYVBHTDB5c0w2emxB?=
 =?utf-8?B?KzlNYVluZUxRU1J6aGNnY2VEWjhjWUlNSGwrc0FUL0pFQTR4VjhpWGdJWEdu?=
 =?utf-8?B?Uk5BR1JESEFWUDFIWU9iOTR2S2hUZCsvNGl2QWVjMXg0c2dlU2c3U3lQanVi?=
 =?utf-8?B?UENkTTNaT2JnMHFvanV6SVpJVWgrazVrQjFmVm9IM0JYbWdIdnZDM0ZOY3RG?=
 =?utf-8?B?T3JIS2w1VUZBeENUeFRUK0Rkdm4xbGhPek9idlZxeDNiTitOTHRlSUpjRExz?=
 =?utf-8?B?aStYWDVocWdzaXZ2aG4rQnJ5ZEFyUVRDL1ErS3Bxb0habDlJaWZkUE95WThW?=
 =?utf-8?B?eDh4Rm1PV0J6aXdJYnhieVhqeVNtVmZsSkJSSVNiODUyMWxNZGl4NlNZaEVj?=
 =?utf-8?B?cXNIcW1ITFRaamI0OVpMcXNZTGpTZ0RGajZ6OUxFampCSHVITUdWUUoxdXJo?=
 =?utf-8?B?UFNHMWZFaWlwVEVrTUQ3eUs2bnoyTkRiL3hoUG9MQ0pvSS9VcXMzK2U4VG1o?=
 =?utf-8?B?SHhHaTEwUnY5M0RlOVBkcDdtUnptS1RJL2VHcFBaOFZNUVhJV2JmVnBOc1Zz?=
 =?utf-8?B?Q2tjNHdYZUE4cE1JRW5USGRsYVF6aGp6MVFUNzhsM1RtR2JwMjAwUWVBN0to?=
 =?utf-8?B?QkxJbDFKSmQ4WjRCQ3N4bmlIa056MTIwMGhHUFRmR0diKzRiRlVuWStGcDN6?=
 =?utf-8?Q?GndCGWQfrcVTohypOkyg3unET?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b14d5f-2e98-4b61-908d-08dbce594aaa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:05:10.5264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nth7k9C/UosP5Rdx7842RTwQm3jh/W3caN3kcF/jXU/u1HLwmS1dwdSI+7wWphaZMwgRFbqRLss6D4sOQIHGsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

On 29.09.2023 22:53, Stefano Stabellini wrote:
> On Fri, 29 Sep 2023, Federico Serafini wrote:
>> Make function declarations and definitions consistent.
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


