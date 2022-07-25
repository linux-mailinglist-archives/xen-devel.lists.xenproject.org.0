Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AC457FFA5
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 15:12:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374593.606663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFxrF-0007kx-Kb; Mon, 25 Jul 2022 13:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374593.606663; Mon, 25 Jul 2022 13:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFxrF-0007iK-HD; Mon, 25 Jul 2022 13:10:49 +0000
Received: by outflank-mailman (input) for mailman id 374593;
 Mon, 25 Jul 2022 13:10:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFxrD-0007iD-QS
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 13:10:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31f30ef8-0c1b-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 15:10:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR04MB3115.eurprd04.prod.outlook.com (2603:10a6:7:1a::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 13:10:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 13:10:44 +0000
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
X-Inumbo-ID: 31f30ef8-0c1b-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7hV+7GWpfMnXoUgxk1J3AG6bf0RGtNWCsOe4mDbP1AFiXPPAIfUsatCM3Ju9PCJ6kCxwI1j0ZPjD9qmItBbtfoHh3DNWmISNW2bn+CVh/3ikUaNP96QpJS1LK/hhz4zcgkWpZPkXVaXxC5S6i9ZeMTinA8DHJFadvZCYmirhrWhcaPkXu//xtF/f0z7pX2rN7cb/2HTN9Xyyr4lS0hXz/66q0Yu6Rsr53OXrfT7R2bDka6c4M8BaYEMp4hFHy4tl7JEslemlbXkmK2cLjONLmYV2Kp0cu5tc9w1Lg60Y6j6EQCDSw/pTrd33vs7WG0vIYqeYnSNiPAOYPK/HiCbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Y9bbWTZkIjkIehIg0UtM+rMqcF9EceSJLRI57FqFxE=;
 b=TATjkFkkXOJB2TgbHallS+C6lTCuqdTRum9jU0QhQklZIHZ3v2w5nfO3V+vV/HjDRpEbg7gb5tYHssqupeIkX29R5Ju8lUZntIslw5yNfWVenudXFMP/5iLpDphoeZFxV7xKmmT9oesfGWOll/bht+Oi2bHRoJbzuCORjv6mMdFYZznbUTISn5EYWJ1ZoIFiRbKmChwFWSVRlkJ5hNS6qgScGQc+FWCFEmLfDYMGDjIqsqJG0LL4+ffDTL3wHMaYTKUu86TvYCJnZQNF5jbOC8l1bdFjrBgND0EkVtaiYLeNBoa93lYvg2ikIlnclij47WODzvA3t221kIUh8hJOVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Y9bbWTZkIjkIehIg0UtM+rMqcF9EceSJLRI57FqFxE=;
 b=rKGazL1OEET0smcw4rmwi/bogfT6QQiS2R784G0UXD99/U7/02Ym/kGsM9xjmGxIMdpEHU1U+c5tiOFIf973MUA4lpJDIYsSkubhIZ267vzwn8QBxiTz/hV9Dn4UWQL4VZQcnSub4MIE927p+gIgqLhA8PRwgFj9uJ9YHGoNJIRv1ET/fnulwVeZMQjZ3B7kapx/Q5tCH6QNMaw1VAy0dU09hC6KwdOXKHaTZn3PgS/CKsDyg+2INtvALwnkOn0QMYoas8zdaKldxa8E9zeyMIkrxNc7jTyHsFNCWUllJ5AOOtBktU6lPrN59SQkZmE023jf2U+f6ElSxj2IqH9Ccw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <473c82d9-0f81-b4f4-70a3-8dfc3beb2be2@suse.com>
Date: Mon, 25 Jul 2022 15:10:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "Xia, Hongyan" <hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] page-alloc: fix initialization of cross-node regions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::46) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbcaea2a-65cb-4853-ee23-08da6e3f1541
X-MS-TrafficTypeDiagnostic: HE1PR04MB3115:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M2gCZ2IR9ZSLWvPVOs9PHXl+Si4IwfVPaIU+2AaPLMotonQrW37VVyr2+zQF8lxtYsOtezlwDAxOAikmtryPUNyvpV29Kd0iCbAPU/nVHDqm/mu1tNXX8RPNQlVjihSHjR4mmV/1QToiOYrVvFGQiAUcxAidouMFvETGgGWfjPfTzXjSjV3OXvzfuARgh98FKw9ii0lxvfVnBKy2F0jjwrTnBAxxEyA2E/cAlTlVMouy8A6FW3lzU5/+Q5+tt8wnLsdcB/sCTB+dGoGMH3qwMW5ylfXz7PesVV7sBvwOM+JBiIajgw+dGUnzql6GmOmaPusEjOPOz6s9NWt4yvHsGppyLXwTlEJbDeTwwtXjYm16V+nHjR3TG+kdBjKNwBoJoWQ0z/Z7IFz6Srdhspy5VA4AAGY+iBTKZpJ7AUFSzcWzRlXRZ4ArnB5UGd596FcXr/qYgmGMBxA1dJipNCcPWqtluYvkBR+fqxiifqx8ZWpAXUIhjfoDCjWzqLBV9o+6NQwoMjcfQosqbKPk8yiX4nmKtj1KuPrwcW+m1QXn5wlBbzUZBRaQnNCGQulknl+TJ2TwA6s8vUNNgnMCPfSD+TWZ9r6PIBoSc+zR0bW+IKuMlWNEjF6yAL09/CselCcscu+z91UKzAJRqzBwOh6w8l/H9+Pe4wpbRM8lUH1QfofyWm7PW1T/6oXAaY3qvYVAmlaDUwzMMQujxxSS1ZdHLp+9FeYINtwlOER5ZpfjsEoSLTVewg1Yz31mB2NjAVOJG5AHfs33ShR1WIMMyMmOI+2gD9zJTeB3EY7cqt+dXoJiLZNwj9s8MKZzHtPfvQ+5wzLdQnrt6Pi6TyeywclGYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(376002)(39860400002)(136003)(31696002)(86362001)(41300700001)(2906002)(26005)(6512007)(6506007)(6486002)(4744005)(5660300002)(478600001)(8936002)(83380400001)(2616005)(186003)(38100700002)(6916009)(8676002)(4326008)(66476007)(54906003)(316002)(31686004)(36756003)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVN2RHdGaWxZVTZ1bDBIVjUrMUloWjU0Vk5RcUxsUE1rUTM1WHZmd2pseEhi?=
 =?utf-8?B?ZDd6TldSTkkzM0E3ZXE1QUh0Qmh1V052S3Y2ZGE2a0p4d0I2TnpwQlUvbkRl?=
 =?utf-8?B?WWtDdXU3TmlnMXUySHduR0VZa1lBbnhZM3lyY2lERWdIZFdTUkNibGdqTWZK?=
 =?utf-8?B?eDl3eW5jeUs0eEJSaTJPdnlmMitvdGRDeTUzc2hsOXM4MmY4azVjaWdZSVdi?=
 =?utf-8?B?THk1WDg4WHVzdm5UTlAyR2k4ekVwaWpFWktjL25mV3F2YzdIZUphNFh3STJQ?=
 =?utf-8?B?WW9rc09mZDNJZmdFK0pkcTVkZktqK2Fpb0VVQkMvU1F1cUgzcGlScDM2bkE3?=
 =?utf-8?B?Sm9Dc3BQVVNCTnJuT0syY05uL0VDdWZIVGxvL3JtckNmZU91Z3FmSStiL25s?=
 =?utf-8?B?ajZEZk9ONldodGM2RktBT1dKMERwVTdqQzRYdytWVERmM1F5M3YybGZ3M1NM?=
 =?utf-8?B?M1dzMFd4enAxYnRDY2FPbXlIMjk4cVEzOTF1NG9UZS9DclIvTFZPZUZ0SzRN?=
 =?utf-8?B?WlNoWFBBbERYazA4SERrczlneWo2VUN4aTBkUUNpV0RVdEZvK1lkV1lKSmJm?=
 =?utf-8?B?OGN0MEVORXc5dDNZRXErYWZaakgxRUw5cEVsVTFDV1NibitWRTN4MkFuVVg2?=
 =?utf-8?B?QUgxWnBmT2RMYU8xZHlsc1VmRTJxN2IyWDVKTkFCOHkyUUgvTDNDVGlXaUtG?=
 =?utf-8?B?b1duRXZGZ3lOTHVrWjhRL01kaDNyWmRJQ1NBeUUyQ096YnFDSzlDZk51UDhl?=
 =?utf-8?B?ZWcvYkxnTjY3TDc2ZUtVbnJxT1NtdHZ0WExzVFdhcjBIL2ZqdmN4L0FqQVlW?=
 =?utf-8?B?WE5COGVtV1QwME1qQTJsSFBkMzVhZHpoNlhWWndGTjl1dDdkM0VBY1dwZndU?=
 =?utf-8?B?Q00yaldRNEZoUVI4UURMcVN0NUQvRXpjQkVnV2FLc3lVbWd5OUtTeWlZTXlz?=
 =?utf-8?B?MHBSaTBYb29lNmgwanBYWk1pN2gzS05LZkdGT09jSE1CODVsdEp5M0d2bW80?=
 =?utf-8?B?aUV2NGcrWnBVeWdQQnlYYW5tem56TEFxNCthMTN5UXN0Y29oQWMvb1RScUtX?=
 =?utf-8?B?K3h2L2xXbXpWeXZZSU9UL1BSZEZaMHh0TzJ5SjVoYWp6c3I1TEMxNjhIY29T?=
 =?utf-8?B?dEEram92dy92Qmw1S0ZkT3hKWWtWTjJvRmgvWDNrcmhuTTYxZit6S0NqSXhq?=
 =?utf-8?B?Z1VMRUE2UzNuNWMzcm1kaEd6UUJKQTh4L0UxckkwazFKRkM0TUxKZU9FWUEr?=
 =?utf-8?B?cGQzY2hTK2xaYWtTY2phUEl6eEhxWW9oNnFzQndDQmtoNzZNa2xkaWpub0No?=
 =?utf-8?B?U3YvZlcxSU9uZWhGYzlDSlk4bmJZRGk2NXA2WGt3TUdjbm5UbUhOZEs0TnNE?=
 =?utf-8?B?cXVRckd0YnRIT25UbXRRT1JRRENDSWVYS1dwMEljaFpjMTNld1hvMGRhV2F6?=
 =?utf-8?B?MmFnNEhvU3MzRExVS2dRWjhhbWtxR2lhNUJCUUE2dHFKYkJENDMwV1l3V3Ry?=
 =?utf-8?B?cCt2TlZ2anJZVXN5NHQ3cmRXYWdNQmwxb0JvdUlEaUUxWldIa2JPN1o1dW1s?=
 =?utf-8?B?QXRNZUZFZW12cGFweWpUZDZPOHFsd0JiUWZxSWt0M0FlejFtUnY1Zm1DVEtu?=
 =?utf-8?B?amo2cWJ3WHhoTnB6d29lOGJFV1NXRllBaWY4cFhFRDRTVkJFWWludjBvWDJ0?=
 =?utf-8?B?RisyZ2M5WnRaa1gwT0hKQURXYWtRejlpMXBMekhCbzM5V1N0dVF3OGk0TU1p?=
 =?utf-8?B?YWlBSVBxNy9SWmQrZ1ZOdGE0d01yd1JWWFVVV1JNRFJHZTZ5ZFkzWXdJMnJG?=
 =?utf-8?B?N1ZybU9sL0NmTzkxa3AzVDB2YWVpK3A4Q0hFWHJNOTR0QjFLa1NSdWRnK282?=
 =?utf-8?B?a2RrK1VLQUYrS3FDRGtVSXA1SzdYU1h0aEVNU0NHanp2RVkyOElRZnBnbXdG?=
 =?utf-8?B?RElLb0FoczllZlA4WlF6UktHZHlHYTQ5RG9tdzREWmRSSjcyVEFocGpOZnVX?=
 =?utf-8?B?azk3cGxoSWJjQnhWVHRPUllYdnlqWG51ZHd3Vk9TbHhTNnc2LzhYNHVuLzhp?=
 =?utf-8?B?RzYwT2RaeVZhYmNLN0R3WGttMWhBK1E2TW5BTEJjdkJ6S3EvaU5mWWM0dzZv?=
 =?utf-8?Q?BSfV/NJURx3E0XSEwrW89Bqmi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcaea2a-65cb-4853-ee23-08da6e3f1541
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 13:10:44.6233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nA+yFO/2Y0m8IJppJlSYR9brnyzTq+vzIKLTTCp+JE8XDnpREY1PplwwSnk6bKIvB1p5aLDTFxG0+Z0D8OvNlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3115

Quite obviously to determine the split condition successive pages'
attributes need to be evaluated, not always those of the initial page.

Fixes: 72b02bc75b47 ("xen/heap: pass order to free_heap_pages() in heap init")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Part of the problem was already introduced in 24a53060bd37 ("xen/heap:
Split init_heap_pages() in two"), but there it was still benign.

--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1885,11 +1885,11 @@ static void init_heap_pages(
              * range to cross zones.
              */
 #ifdef CONFIG_SEPARATE_XENHEAP
-            if ( zone != page_to_zone(pg) )
+            if ( zone != page_to_zone(pg + contig_pages) )
                 break;
 #endif
 
-            if ( nid != (phys_to_nid(page_to_maddr(pg))) )
+            if ( nid != (phys_to_nid(page_to_maddr(pg + contig_pages))) )
                 break;
         }
 

