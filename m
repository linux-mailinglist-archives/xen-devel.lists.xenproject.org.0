Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322EC3A2A41
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 13:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139843.258502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrIvm-0001hu-Bn; Thu, 10 Jun 2021 11:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139843.258502; Thu, 10 Jun 2021 11:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrIvm-0001fP-88; Thu, 10 Jun 2021 11:33:02 +0000
Received: by outflank-mailman (input) for mailman id 139843;
 Thu, 10 Jun 2021 11:33:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iP0d=LE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrIvk-0001fJ-Rr
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 11:33:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07d8f4a7-f3b9-4e14-b725-fdd1f55c21f1;
 Thu, 10 Jun 2021 11:32:59 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-FRwXrX2CO3SjesCVKFISnQ-1;
 Thu, 10 Jun 2021 13:32:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 11:32:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 11:32:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0086.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:32:54 +0000
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
X-Inumbo-ID: 07d8f4a7-f3b9-4e14-b725-fdd1f55c21f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623324778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m6Ao1vY1duG4cub/667UzQL8XBxQH9wjKhboKvMhOYo=;
	b=LAT+dB/pdSvBJPJNFP15+JJHQlHhjCpJKNRf3B+QB+uY9lQ7PMe2n6/QFNjC7EJNNhpyx6
	Yoy6ge3yJlyogufut97L0bLnKnZHpb2xrpOC9YU+zVv1Mb3BlMDdTbUO6wuJeEwwR9tEwY
	pIaxMZj7qnRqHTwIoPncs49QjGYL84I=
X-MC-Unique: FRwXrX2CO3SjesCVKFISnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fhngoop+kwqu5FbuHeaZHSFPkEgViTt+83buc8t0Bh65UxNhWRgt55OM7U/ln7jjb939r55VEpr+GRd6AtDmUtZ7j8MK3xgNwX09i00VlkcPx+DONzO3WOePoz4uD6qaOKKeLOfPOgmb4TIh/CrJ5SDp3Cn9zU2P4sUbV5kRLuXPhWwCkoV7PGWGCiY8kkEWroFaDmD5zp7a1BWMV6lpv9b+BsWcWAf2fQoG0jYFdM69ARASM70A84UfNvP5xhR6Qv9FP3Q2upa9CXBTtBdatQPIOlU1h14g088xnimMcmYLZXKC6KKVpY+aiKeuJkbalsqz2GwUx0kzTEeIOzUHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6Ao1vY1duG4cub/667UzQL8XBxQH9wjKhboKvMhOYo=;
 b=iqF1MvhjrTCja9fY3Lcg0urGA2APg5NHFUaB0R3kHUhAFGw3rZTRkjHuCabqKbh4EU/z3DDXbxy33L1PkhQPj/1505wNkAaBhm3xRWTGw/2F/s2vnMjbfop0xAAFVMZzV3kuvauK3hRxx88lRSKwVyE5yc+fzDscom7k3V3Gp6m24gb0ekB2kODAxpUZn4z3ybxiK6QII9L1e+gLEw/Y/IUsLKi6r6tcpqQfM5OunY+WQqH5Grh1JXX7ptPdRFOqjPFYmIfzrYYOoIVyPq0O13Accue/YJTxQJFt27U1uvB8U4F1ugKkuA3LSNu/rjCWpDzE0JObyTR6sqI0gZFqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable-smoke test] 162597: regressions - FAIL
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <osstest-162597-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d95cfac-e43c-d1f0-f988-4f11335b104d@suse.com>
Date: Thu, 10 Jun 2021 13:32:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <osstest-162597-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d9e83d8-8660-48e8-0986-08d92c037d67
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244519808FA02F059230DBA4B3359@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6s3gwUA/U1giFuJYvFLWk2Yqi0aCfR9UCyfFb4n4XlqBUIo3n09eBYO77hbrx9c15h8eIfknKnTHTeQDP3x7aYkxGDr5WIJSyU/SKqrgrRK+zJHbZjUIO4VnwoEpovgVQgrPc5Y7cgwukhdP44s/7nvOu43a2sqZW47xtxM0gTLC00gfgY/AjlyN/lGTe4eJxjObX6fR9y8+FITsXV67yDgovpQM7z0/XIpr/azXHUBGgH85oBcErF0Omab7wHQ4qC3BAiMqJcW7wKwbVykiDOqDbL0j0T8brK/EbbVptmfzOk7OT5yq7t4fjUtaj77GmIXfVOgyQo+CMaHuiLnEKUmJye9yYrZd2TjyiG3/OLkgjPIT/kPBzNHfUtc1wbWCLWWBd6zcChD/lT65UGc5X+hxlKTstPUYLuB332iXOMjcj9w9+hGdHAItNCf/fYuhFlZ7fPoSVilHT77rKlLB9fBBQgmDgsZWfwQAru19Rb2f9V75Fhnqi4MRa1Dze3ak6kGzuuWFGsYV+8nOFThW7utqq692pf37w2nu1m1PSKcw4926HTt8G2UBUBl5TW2zYVpE1Jon+37xzsdOlIyIrBbj/+8OA/Rvb5yKYafdOC3jXanHXpzeBeOfbsdDg9Ok3GnHyLaP6wJhHg1fo0/jiyhA7ptjpJQZTX+Zb9bvJQPgSERlEAC6d1jgu7aP+yQebEKyyY2PrXzDNU2DeCXvAHxDQSI0tLSixzf2oOusX/Fmkrjo4HsIgWe0WDrz+sD7QkGEAK3vc48Z+2ZrgOo1SxkhbiqFyOEyZbxJpS2j8kC7Hq1C2ZkmgCMAXdEi/ryN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(136003)(396003)(376002)(366004)(38100700002)(316002)(66946007)(16526019)(2906002)(110136005)(4326008)(186003)(66556008)(86362001)(966005)(66476007)(83380400001)(8676002)(16576012)(6486002)(2616005)(31686004)(956004)(36756003)(53546011)(5660300002)(31696002)(478600001)(26005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?eGdXaHhJczZQaVc1ZTg3NlpqNmxrVnJsWGJ3NGtiYnU4TWpnUkE2TTZzVGlM?=
 =?utf-8?B?eG9qRStsam5UUHVpSVhCelh3QjJWN040K0R4K1F2dzRFU1N1ZGJZTlRZMHo0?=
 =?utf-8?B?cDFkM2tnem0rbm44MmlmMk51Z0NHdWxHd3N2eEtKT1VhK25YbG9nb3BDTFNN?=
 =?utf-8?B?UmF0N210Y0JLa0hSZitHNUhzb2ZZSE1SWlNrYzNlTTY1bWh3c3huN2hibDRK?=
 =?utf-8?B?YTJQczd0WHJPMjlKRjk2ZklHTm9KcXAvTGRIY0tOMjhjSURXNzZJTFRnMjRQ?=
 =?utf-8?B?ODBUWGY0cHFNdmFVMW5jajZ3NTJHU3N6RTljcjVWTnQ2MFNjdDFQdkcxSVJ4?=
 =?utf-8?B?VVBCOEYvdkVEQk1LNDFrY2pWOUNyVHRuQlF6RTcyL3gwVmZlcGNtUmdIeHFp?=
 =?utf-8?B?MU9yOVc4UEUyNzdhRTNrQkJsWTlmWUg2YXRlYXlwRE41cDVFU3hsQWU2cE1x?=
 =?utf-8?B?bjlORS9NWFVZUVZ4OFZmeUo4bjdkNU5TSTh6K0RzSEMxRzBid3VjejRYOUY1?=
 =?utf-8?B?OWFES3l5aXZndXBVM0V5LzB2YnFuOERpMmR2M21sRExIZGFodmxBN1pJOHVa?=
 =?utf-8?B?UWpwdFY1dGRCeW9RSUIrdkhQdmhTN1VkV3BVWjNZYkhIcG1HUVAyWTJGdzNu?=
 =?utf-8?B?aDVnd25CTU9RRHc2T2FaeTlqNVRXMHcveW04YmNmcmhiLzZvUjBXdmxUUCtB?=
 =?utf-8?B?MU1VY0JKVU4weFVmYUFzcjFaU2xHMGk5RE9HeFZZeC83TjFZUXZGQUE3dElP?=
 =?utf-8?B?QmFLM3JJV2xWRm9JaVhKakxsV21OdnZYd01NK1E5S25UVTExb2F6TDZ6ZHdh?=
 =?utf-8?B?SWplNExsTU1nQ3R6UDJXWGdQaDFoVWdLOW5BNnFDaGRWdi9ra0JUSjNvZ0dp?=
 =?utf-8?B?cjI5MnRHNjVWYm9qTHhMeDBvQ0FiYVk3OERkb1VZQ1RlRUI5bkdEUHFocjFE?=
 =?utf-8?B?clBQV2hLaTl0VGpvS2gvRk4zeUh6RFYvclJyMFJ6a3JZdHY4czRvakZLVUdp?=
 =?utf-8?B?TXV5R2k5MmR1UnErTlNlOHlSTkV4NjVoQzZyZHg4Qlp1TjJDRVhEU2ozdmtr?=
 =?utf-8?B?NWpQa1hiM1NtZXVZY3paczg4K0dUN0s0eWRldllxTHBWR3FnR09FdFhYTUJ0?=
 =?utf-8?B?eGo2VWc1OWxhWjVBV3pudkFpcWhJa0ZkN0JVSVgyb0xaZ0dMWFpZMjVHbkdO?=
 =?utf-8?B?N1dYN3J2cTBOeGhsTEt3L095aTMva3hPakRwUU9NVFhZRjlPWWNndWdKQlly?=
 =?utf-8?B?clc5T2RLVjBZSlJZMmM3VENEa1BKSHJDZnNnaFlISmRwUFQ0UVg1SXZqckJG?=
 =?utf-8?B?QmRNa01Sd1BsTDVoTmh3bVU2aVFEY0p5QVFRaVN3TS9abEJLVXZRTTNjZUN1?=
 =?utf-8?B?ZFNXcHhsTkRCbU0vc0hFMXhONENSMkdxKzR4eG95cldpZlZwRFdqejk5STZI?=
 =?utf-8?B?bTNQTFlnZ1pFc0d1a2locE1WRndHK0VFbFhpYWpOWUV1M1pKWlBTY0V0OWdv?=
 =?utf-8?B?LzJxa1pzMlJ1anQwVXc0Y00rdXkzbDZ5bXA3RDZMbGRpdi9xYncrbkVxK29R?=
 =?utf-8?B?YUd4UXU0ZlRYeHpva1hxRmJCRSt2ckJIb25jMHpzRU5MRzF4UUplVjJaTkxR?=
 =?utf-8?B?VG1abVllS2tZTlBhWHBtQ3pIUEQwaW1QN3J2dXBSNkJsSk1WYUorak53cVBR?=
 =?utf-8?B?REYyYW9FV0doV1lqbnJ0U1d3Q0Y4VkVPMFZwYkQwaXkrWE9ObXlEVUo2RGo1?=
 =?utf-8?Q?ZxQkzFIVT/nXHSWv9bU1zqkm+nOIajJ3W5IJSQV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9e83d8-8660-48e8-0986-08d92c037d67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:32:55.2013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvWkSDMRu4cba8XWb8QavXHC94klHHsxv+tjVYNF07ufKWr0usV4+ZzC3fqjaM6aWHYnD4FciizYbUJUu/NOrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 10.06.2021 12:50, osstest service owner wrote:
> flight 162597 xen-unstable-smoke real [real]
> flight 162602 xen-unstable-smoke real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/162597/
> http://logs.test-lab.xenproject.org/osstest/logs/162602/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 162574

This now being the 3rd failure in a row, I guess there's a fair chance
of there actually being something wrong with ...

> commit dfcffb128be46a3e413eaa941744536fe53c94b6
> Author: Stefano Stabellini <sstabellini@kernel.org>
> Date:   Wed Jun 9 10:37:59 2021 -0700
> 
>     xen/arm32: SPSR_hyp/SPSR
>     
>     SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
>     trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.
>     See: ARM DDI 0487D.b page G8-5993.
>     
>     This fixes booting Xen/arm32 on QEMU.
>     
>     Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>     Reviewed-by: Julien Grall <jgrall@amazon.com>
>     Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>     Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

... this. My Arm-untrained eye couldn't spot anything in the logs.

Jan


