Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E80151D857
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 14:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323100.544657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmxW5-0004vz-Tx; Fri, 06 May 2022 12:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323100.544657; Fri, 06 May 2022 12:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmxW5-0004sy-Qu; Fri, 06 May 2022 12:57:05 +0000
Received: by outflank-mailman (input) for mailman id 323100;
 Fri, 06 May 2022 12:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmxW4-0004sq-Aq
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 12:57:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 067e826b-cd3c-11ec-a406-831a346695d4;
 Fri, 06 May 2022 14:57:03 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2170.outbound.protection.outlook.com [104.47.51.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-gjcIu7mENb2ZEDPuPAKvKg-1; Fri, 06 May 2022 14:57:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 12:56:58 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 12:56:58 +0000
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
X-Inumbo-ID: 067e826b-cd3c-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651841823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ArrKCQKNcUdBZ27Feomc/vyeJEr4bMub3Aov7mlP2Y=;
	b=kidclYY3LBx59VANqhzuW2Qq3HbsWsjAN+1eMJmGAS4M+tOl63rs2OYs6bKZTHVy2P+XNC
	chidgelTTo8f4F/AOjp9pTQjsW9WMDLBmYl/XMJyVdMaQv5RrUYBe1a4P/vsxONuKb82b0
	Sog3pJrneuf+S0TCjJmgylaVQazZ3gA=
X-MC-Unique: gjcIu7mENb2ZEDPuPAKvKg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ka/qHkLopxGc6dxEzxiZVlJCO944mKaiM8Yhe3NDs1wcYroKPaC6Sg34uJ6y040fnVwbhO+Xh/McJPG3KGrMYPFUxivWISajr49UjrlmR9ADIPFrmRPxuf9fFjKOquhJsbEUEZ/wNuKUyeJSTuFhBwjIh0n0Est89X7UB8hpj0iIwBoCDb+km/ESDxCcjEt3ZV7o5Ju1NqwZpTzB/6OXyRBnTKo5e9tfq4T1FfkjyPP+GvvlN9D2rlrkUThJxIgJ+OQkKGe6mZCuwtR8C/L4PjsQ0QXkOo64TvCyt2TpCSzgBkaY+TST6GnYkD/CNsrrKs78i+DgY91PLorwFWAU3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ArrKCQKNcUdBZ27Feomc/vyeJEr4bMub3Aov7mlP2Y=;
 b=i9HrbU+0lmpY7ox5jTgYkVYlj/hHJZ61axuqCsKXhecc/EIryXb231eZafLxMa5lZfRRDXfzyC9McEWvaN/CiA5OwDkb0nIDjDowXTE4dX/7N2mY2abJOd+G5YmTXOawk1eQs72e8t4r7fGSh+MrRoPjhJavsfYzFaxp2DmK0xUnI4bHCwxEIukPNrgDWQaKD1zbxGsexc318NlfC0u958DJT9Z9BdKqADUOLekxbhd1PffCoBucqWu9fa4nqlM4HgcbhP/xH7NxdpW9izdtzP8Qc1JpIxrWKOMFA3bQJM5O8QzARw8k4GWIwSukdnT1BjDGDiNLQXLnMaIplt2WSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc494c68-787a-3cb9-f192-48511d5577cc@suse.com>
Date: Fri, 6 May 2022 14:56:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] build/xen: fix symbol generation with LLVM LD
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220505142137.51306-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220505142137.51306-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0264.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::9) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34229bd9-331a-4000-ee32-08da2f5fe76e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB547247C0283B7BE68E8DE26CB3C59@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R8PPl3yLJ1oIb3uRcjnaDGI/wAU4Rnw5byimNyysm7Rx8ypEVmLWDZI68ZghCrsPgvcU5kupZwXxToYzt56bbOWQgvdajSVOI+fTYlrAzAGdPpSwRj7ZmY8tToSWIcXyI2u4ZkkiUZ4wgW9yzREganRKj8+cLoiZ5n0JqIE7dwtnSk0ks4VDO10NQvyRxzpE+BvZVbECK9JRlbonhm46Ydc/sEFBO30Ixwau/CDDhjm8v3ng+wrjE6fJ5w1ZuJ/5gK+UINitmH+r/T5J0icYbxOFwHVUr9LntGFBDHi+XDGm0+qg4ZqgfoNr0Tft0GooCCgQP8h8wb3HcL+3/F8UH9NQ7h5IdUF/SDu7rLnUvBxut4fTneToA176Oe3Ly60mvJGNwiZ5aTiaDLzRJK1xdUbXwKKPpA3d4jCD8U9dfHRKYmSybDY31VAmChNIiBUoP0VH170NWP6XgpKq3BikM4i93g5P5F6yhtm5Ck48xM2/UTzAQVTo0pr/vA+kOS/KsBp/1B2CEhvxpZWzhI4oOyU1EG0Z6PEVve/2zhekllNOntKdtVQR3LGK5Iw6ehPkga5AEcz5KnRvt+TpfSfzGZI0o47+Mud5R86+XYdRXodaFDEhAS+9n758EWhlH0W4K/zkG0q7C2VxOliVXDuA06IVKuLxv63rjHe5suZouevUB3GbBttycqBd3BbPIMkhuU/cchYrFUUJ6XnMuzpar1epRyO4Aiw3+wgm/+87J/w1szgC8PsV/037HZ3NT5N5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(6512007)(6486002)(54906003)(6916009)(26005)(31686004)(5660300002)(316002)(38100700002)(36756003)(508600001)(2906002)(6506007)(53546011)(8936002)(2616005)(31696002)(4744005)(66476007)(4326008)(66556008)(66946007)(186003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1l1T29oSlRISXVPa1hJeEc0bi9kOXVNc0psZFpiWFVsV2pYRkhPeFAxN2hz?=
 =?utf-8?B?c1YxcldKbVZ5Q2VXSlByNjVZWENNZ2hyL25jUFZPbEpzRkh3TmdnSEwrQ0dE?=
 =?utf-8?B?N0xhTUdFbXNja2Uyemg3dm1JV3Z2Yk1JKzhUOVRnbEJpR3FKNStFRjg0Nnhv?=
 =?utf-8?B?VmJ3N0VTamZEcVJIUDhEY1Nhc0ZJSXlpTnFsQjB1bjRZRy9RM3hjalVXa2c5?=
 =?utf-8?B?MGk5TlB1MXk3K091ejVOSTVoQWxZTi9WWTRDYWdTL2FvZVNoUzJ2VzJEaVcr?=
 =?utf-8?B?S2xlUDRhbElkMDZNME12bjdmWGplYUdFWCtJcklXUmNubllUZW5MeXVhYnRZ?=
 =?utf-8?B?c1hKdlF0SkpmTDE0QTR4WUZYaFREYXRVZGk3bE94UHF0NmFNNEl4OEhickFM?=
 =?utf-8?B?ZFBla01tbnQrUVJoTGUzTXN4ajJCNnBlTEZ3QkJ5WmFnLzZIOE9iaFdWSGNS?=
 =?utf-8?B?eUtDRjBWSldtUko5Qi9sY3RiemVYUlRTT0c5Qm1HSXJZZFFtZWFja3lxMXo3?=
 =?utf-8?B?N1FBT0NSSFNJZDR1QVpJOHRsOHNmaStBNC9YQkEvWVo4cGhlbGVNY3BCanJ0?=
 =?utf-8?B?MERETjQrVE5xOHR1Nm5KTzJVcFFqaHZUTmpKTWVSY3gzSzVhYmZPY01hT3Mx?=
 =?utf-8?B?cW95dU1xNDMyR1ErMThmMTFQUHNjZXE4NE0yUWlXeWJwK2ZRTGYrZmRwUW1V?=
 =?utf-8?B?cFpBNzF5M2VJRURSeU9sQktudVg0REtvWFRhV1dMamtxWU8rSVBidDFIelFp?=
 =?utf-8?B?ejFqT3B1NTZRamw5eGpsOGplU3JYNloyR1NMczhUSEplSU1SZ0NUS0xnR3NJ?=
 =?utf-8?B?SGJYMUZLNkI4TmVGUTRqSTRVTjIvTm9DZGtvRFlJSnZoSVhqdjViWlNoV2NF?=
 =?utf-8?B?dmlnZTZaMUNTekM5ZytxTk9vUGpjU2ZoM3paZElQTVZRWG0wWk5HU0VqR2RP?=
 =?utf-8?B?elEvZUhDUHVNbEpjRU9OTWNyTWlOenlMUHJDc2xoVmxsbEpUNU5YdEVReVk0?=
 =?utf-8?B?VENNcjZHY2hCOHZpNm4yYXNlWmcxamFMMVB3YVp6YjBNRUI1WXZvWGI2Nk8y?=
 =?utf-8?B?VC9OVDRkVGcvd3IzNzZLWVg0ajFDOG1jMXVPZzRkNHFGL1dsaDZFR0dEQXYw?=
 =?utf-8?B?VUR2NXNPZkRKdkdYSHdZVUY3VkRSMHNaUWwyRXVUeEJRaG9saDVidmRzZTV1?=
 =?utf-8?B?c0ZvUlpiTXpScnVSOTgxUG9pK2ttVzBCaFMzeWlEOHpERXUvWWlNdmQ5ODdv?=
 =?utf-8?B?VW9TamVsR2RjVVlUbUxFZnllbDBxejM0ZmNlQ2huS3FtSVo1QlI5VzM5UzN5?=
 =?utf-8?B?Qm9XamhwaVg3dnJwVnVxRzFyNzk3aDEzQ3EyT1Y0TnVRcTNLQlZ6ejZGQmR0?=
 =?utf-8?B?ZFIySG5JSjdmQlF3RG9LRUZRRTB1aGlaZGhjME9Sb1IvV3VBaU01ZmhsV1hH?=
 =?utf-8?B?WkdiZGRSQ1dRWTJLTEZGMVhQVkk0UnZDcWVmV0xzbFR0WFBTTWQ1amgzcVNy?=
 =?utf-8?B?VXFXY0w4cHExWGNMMDhmV3FWemV5Um1UdTBxbCtCbEhSNFdFcmpEbCtvTkFT?=
 =?utf-8?B?eU1qRjVpUGttdm5CQmh5c0gySWlCOEpqTDZWa0piWlRYWXNCeGZ3YWt6NllW?=
 =?utf-8?B?S2kwdWdpMUFncDhNYzlrUFZNRFNsejB3TUVab0Y5L0kxY2FnUm9HZDE2R1pz?=
 =?utf-8?B?S0NFV0RpYzN0VTBoRitSVTAxSjJSWFcvaVo0UnpQZVJSU2l5TmZOZElIbmM2?=
 =?utf-8?B?V2hxOWVGYVlFWVJSVmZ2dHhoUk5zSXo0V3FOK3FsemZ0OUJOVExGNjlFU2hv?=
 =?utf-8?B?cy9WRmFCdUNrVHhCazE1YlZRSDlzSU0rcVlRMFdEdlp6amY0OExYU0loOE1C?=
 =?utf-8?B?M01SZlJYRGJhMDVxRzEvaWEwVFUxTnFEMVByRmdoWmJPZTUxMFhQU1oxeUNI?=
 =?utf-8?B?bWdrMFYreVRpekxGR2lXTStDZGZtSzZ6TVhVZFFhZ2tzV0FBWkJvMHdFb1dl?=
 =?utf-8?B?NTFncmgxV1diRDRWOW1wMHNZaW80MlpnRldYRlorMUIvWmdWQ1VQT0lERGpl?=
 =?utf-8?B?QjhHS1VjS0lpTG9yUUxVNkdhT3I4QksyeS9nQm9sanZycFJOcG45SG94NHox?=
 =?utf-8?B?RWVzOXNJeVRBV2lYOWRvc2wxTlhFMkhRNzRwT3FWSjBhWjVlYkRtU21FcFdI?=
 =?utf-8?B?dGliaSttRlBSMEc1QTlxY3poamdhRTVuUW9DcFR5MkI0aG1GWkswbFlCMFhL?=
 =?utf-8?B?VnhVQnA5UU9XWk5CS3lOZ2kvOHc3Z3kzMVZBa3RhMllETG5vRmxYQmI3OVNV?=
 =?utf-8?B?VTAyUGJoQjBJOUtQZ3p5Q0R0NlN1K1pFd3dhVHFBTUtiUWNnc3lnZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34229bd9-331a-4000-ee32-08da2f5fe76e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:56:58.3800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAbSxLge2S4YJ8ovBj1zjYJTq931e+38SFwdT+XZzM8XIN96XMaOPs7fKFeUtple2jsQrzWVNreiaqvTYf+rKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 05.05.2022 16:21, Roger Pau Monne wrote:
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -125,10 +125,11 @@
>  #define __must_be_array(a) \
>    BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&a[0])))
>  
> -#ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
> -/* Results in more efficient PIC code (no indirections through GOT or PLT). */
> -#pragma GCC visibility push(hidden)
> -#endif
> +/*
> + * Results in more efficient PIC code (no indirections through GOT or PLT)
> + * and is also required by some of the assembly constructs.
> + */
> +#pragma GCC visibility push(protected)
>  
>  /* Make the optimizer believe the variable can be manipulated arbitrarily. */
>  #define OPTIMIZER_HIDE_VAR(var) __asm__ ( "" : "+g" (var) )

This has failed my pre-push build test, with massive amounts of errors
about asm() constraints in the alternative call infrastructure. This
was with gcc 11.3.0.

Jan


