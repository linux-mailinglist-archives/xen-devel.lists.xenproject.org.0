Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16BD538CA0
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 10:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339215.564038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvx4N-00051U-Gn; Tue, 31 May 2022 08:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339215.564038; Tue, 31 May 2022 08:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvx4N-0004yP-DJ; Tue, 31 May 2022 08:17:39 +0000
Received: by outflank-mailman (input) for mailman id 339215;
 Tue, 31 May 2022 08:17:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvx4L-0004yF-SP
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 08:17:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dfc1311-e0ba-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 10:17:31 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-3nUSs_j_PjmRPSBbNEwR0Q-2; Tue, 31 May 2022 10:17:34 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4773.eurprd04.prod.outlook.com (2603:10a6:20b:10::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 08:17:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 08:17:30 +0000
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
X-Inumbo-ID: 1dfc1311-e0ba-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653985055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hgszuEWJ8PlB1T2UprLpogzfv1/FWWEjNMDO1Rvbo+w=;
	b=ltcWCjX26j8KuswLaV/JhD/5CSuNziK7HnU0nA1RycChoToAcuyLbtIZAUUvNsn51BT8Fk
	yyr+CwnZkNPF91qivplxbLDcKxRttMxXW4oBoY7eX2lPun7v2wMuRsx2UrFmS9MkjP6DyK
	HCtQoOUi1sbONB8aPOG3Cr36OCkXORc=
X-MC-Unique: 3nUSs_j_PjmRPSBbNEwR0Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWoL5eNUVkvxt4C4C9beBAHyUqbrh6dZ7c5ih5gmGBny1hEjsUCWxCI9f9WZPB7ybp6KWsMUWAH3ItwfoQgXZariYT4OQZvJZZwAb8IvIvbvIGQ8KHXdhQkWAYmGFF4AUTJL7qpTBg0EZXIf48Gh4OMBZDnxYTCjm/yY6U47uY+NqRwG1taG+fgfjC/oE91PJbkAJTJDs4k0qIpPP+cIYM/JZ00b5QzArCeO8ziS4hP/Lu3qFmOWXKTYqYHpDk7J8qmE0RcoBMN+8tVshtB77jY6Rcxm8xa3UeuUlxESBb6+PIstfwzfOYtd68MxQ8tufdkCWjpjFREAPwCnKtNhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgszuEWJ8PlB1T2UprLpogzfv1/FWWEjNMDO1Rvbo+w=;
 b=cAQxEvrk1wjMF+zqRMw60LKsXqESLlrovpyApUgAYVnqC07B40ecidU+hctzSrRcH2esC7zb1y2O5Cq+8zHlN2nlPLB+fYxIOqnpTDc6+ut5h4BjSCVIFi7+Ndr6OvSg5Kq/ptIwbsqDjY+BuPMgwdvaWp0Xwp+F5YxzjqaJCW8LiJshb56YHRt+JJeLTANiSuafjgWOWJMlzFQUzJdV/8Wa6bU1DSWVyEpgty++4ci+9C8ggoxFoSqVFn/DOnCqVP2W2Ttk8TCHUfSIXo7qhmotO0TnsfGKxl0BlUtweRDp/jCRzMR5ACnt2hHPoXCKQGALQ+dmOXyA4sH3hm6SIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a74c733c-7d12-52db-f602-847912bbc471@suse.com>
Date: Tue, 31 May 2022 10:17:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/6] xen/riscv: Add necessary headers and definitions
 to build xen.
Content-Language: en-US
To: Xie Xun <xiexun162534@gmail.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1653977696.git.xiexun162534@gmail.com>
 <e1a82be152f9e7e344032bd253aadca502a01ab6.1653977696.git.xiexun162534@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e1a82be152f9e7e344032bd253aadca502a01ab6.1653977696.git.xiexun162534@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0009.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efa7fd42-0989-4768-84bf-08da42de019e
X-MS-TrafficTypeDiagnostic: AM6PR04MB4773:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4773A091DF660853360A310CB3DC9@AM6PR04MB4773.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W5MzvATm1CC/9FnkKtIJkcQuSVwRv84UwCsbQWLk3tAd0ZEI1RIpmytEUPiBn7TZb3qhTvHsrBFkl8uSYlsKRa0o7Jz+5hBZeFMmZx05vQ7s1MfA1igt0tSeFTxiukuzlJHw3tsU+ArP8VgltJIvup+hZT1DBzC+oxO+/JQmNUC8whvBu1fiD1Y4V15iTlV+FLh7q3BAqg4vYq98GNZzavowS/9EfYYh2Q7CnTfi+Qm36sdyw6+wb8E+3lCH+m6fTTpkJU63sXB7mJ6n2RfNcTOGRVkTlBXHF6R7p7WJPtTAZRdHoyucUVZw/84A0Bmr2HLPuAEN2HM7399yOZUHQ8I4dzgr2JMdeGY2UPyyzA28y8Ns8hdjnylz37Z9WkGjguld7cWgUBqrFTONNo5pmYv4tPZdkvqwoh0zk36KvG07Gqxm2ofSw+k1uS+TmlMkp9NLTlHZuUobE/90nbarT3YvFExwZgrDeUXpU2f0qnniTMCp1FoLoy5e3TrCSgPrsWXptr3f+nWqcxi+NEcBEtX2+TKmTV8x/234aKwiNQZ4cofIPSvNEARl9vj3bwJl2RjlzmD95wUR4t9GjvmRr/e/rSVJxgPGv+UXvZHm9VDdemdG4CnxVoIMi24B74Ftjh+4P1oV5+IqUkkxPe8o1uyYAO0gNOOt+wohO5n6PS6xbqb6YK3VOvKFanpgELzTZUZTsc/x2fXRAIFSFe8JA74DGo3Vm14uAhRX+8PxY0GZqhqQjlNLMMwgQeuYsuVkyY7x1BKocnyN34smxMW6sA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(38100700002)(86362001)(31686004)(7416002)(5660300002)(66556008)(66946007)(66476007)(4326008)(83380400001)(8936002)(36756003)(8676002)(2906002)(54906003)(6916009)(316002)(2616005)(6512007)(6506007)(26005)(53546011)(508600001)(6486002)(31696002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzRVTlZ4cmRCeTk3cHh6cG5uS0k2dWszL1Z1MGNEbE5XUGI0Q0UwakNrc2ow?=
 =?utf-8?B?ZENTOVA5U2xzZDc4Q3g5MnZxNm1nNlZBWE9PaE5HMk1yd2RSL3dNeWhsMUZu?=
 =?utf-8?B?dTRHdlBiWHozbmNxNSs4K0hmQm1RN1lEODd5cVRmOG5YNGVYcG1zanRHMWpP?=
 =?utf-8?B?a3REY3dNK3RzVitrOFp1RjI1Nmp2VlF2TDRxWllrRVlnQmRsVEdGOWZ4VEIx?=
 =?utf-8?B?Lzl6dlF2dHNkKzg4cVl4Z2xuTkZVMmp6UDBGNVdMYVVXZ0NETXoyanN6Rmhx?=
 =?utf-8?B?c092TXkzTWROZ243S045Vmg1SGpUTkxwTi9vdHBtbnpJOTFZWHcwbE50d29s?=
 =?utf-8?B?VEYzMUE1amR1YUF5VHBuT0Y2YkN0a2VpR0dWZkxqQkRDMkVvSlQwVW1BVEo4?=
 =?utf-8?B?c0xpOVorZnhrZGpKSlgzL0krRzFhWElvMHQ3dW5ZZno0djZ4NDlNa1JJbktU?=
 =?utf-8?B?WFQrMGlHTlBzTDFiZHFnY3RBSXp3RXpsUFdGY24vSStLOEdMVEY0MnY0VjNP?=
 =?utf-8?B?YmE4QzBzR3M0dlVBbzdNS2prMXVJemd3TEdTR1ZMd3VnMzJCK0gxcXdlRFox?=
 =?utf-8?B?OUcxTC9ORFpSZFFKTDdLbW84RDZiY1l4SWJZRUtTTnlHWXFTdmZoZlErS3FB?=
 =?utf-8?B?c0xFaDMxc3M4bDE2MVZMMmRUMEdhWGlIS0RSTlhtSFdHazk0aXpMK2N6TGlw?=
 =?utf-8?B?VmNVQWRtQXlRWGdXZ2M3TGsySGtpT2FvOHU4RDAyV3dsVUcrRGxIdktUR2wy?=
 =?utf-8?B?RVlUNkpmVW82M1FGR0JiZ09sdUF3dEwvc3hueGRJOUZaR1hOTFMwRlF1WEJs?=
 =?utf-8?B?M1hKb2dOZ0h2dFVNZkhQOXRIb1FRdlpSMHhnU05lVDU4MDNLWUo1cnlYK2lu?=
 =?utf-8?B?Z0FBbUF0bGgybkFCdUV5TStRWkhXOW5YZXZGQ3c3cHJqNVI5NmVCWlg1aWpF?=
 =?utf-8?B?Ym9kaS9UNnB3a2tGT0o3WVJ0TFZDaHNMaTY0VFZoYTBkWDcybGJUbnNSZmZE?=
 =?utf-8?B?VnBnK1p2V2JDYkRYQlozemQ2UURKbXVyQVpTRTh4RXlCTG5ZTWk0QlFsZ01R?=
 =?utf-8?B?MkxMRHFWYnFZWktqWnZGZjdyWlFCTThtOW5iZnl2UlozQ2kvQU94L2xUVWVQ?=
 =?utf-8?B?a0tyOGc3cElCbFIwb0wvaG1kdEpWL1lQMEVwM1BaRlUzOE9yQlMwL2xja0Vu?=
 =?utf-8?B?OWJ0OVRvTEtwT09QcitCSS9OclBLSE13ZGI5akZ4enFzV2FwL3V1cnpZT2Rn?=
 =?utf-8?B?bjFRZTJPemFMVUpLcWVaRE41VXcxWDVMMEVLK1U4RnFhYVMwSmUySXdjRUVx?=
 =?utf-8?B?NWVKd3A1QTdkVVVWRDhMMWJWdjN3eGNuYWZHMk1kYklSVTRqZmpDZHVyYVhE?=
 =?utf-8?B?dGZsa01Zd1dLYjNOZEErZEJOMXJwNmlyMGMzZUtDTUJxd1NvYjJCZStYVHpa?=
 =?utf-8?B?dUYrci9ZS2ttT3doS1JRcWp0clJscURzNTR5NFQ2YVM5cm5hRkFDdjZNeGFm?=
 =?utf-8?B?Z3ZmUU1TdUp6RHdoRjFrUk5laU1EV1JqcUZrTDYwSFhHbkNUdFl5eXJyVVZE?=
 =?utf-8?B?YUxpN3RsQjNNTnRFWjFySi8vUGpSZ29lOUY0SGpYeVRtYlFtcmVDVy9SOXJi?=
 =?utf-8?B?MUhOdHVwMXA3NWF3VzFENVhWT0hUckc0TUx1bnFkYXRscDRiRVBFVnUrdmpo?=
 =?utf-8?B?bU1CMis4UFZTSS9ia2ZPa0hueFo5SGhtSjNUTDRaeDU1L1RBVlp3T2xUMEI5?=
 =?utf-8?B?RExKOGg0aUhMbUZVWmJ2UWRrWWM2Q0orYlZWNkYzWE5ka255MmFYUVEyQWZi?=
 =?utf-8?B?WTFxalJ4KzB5NFg1OUdUYUxOOWVHanJDbjJlQjVTUVdleTVwZjRienZJeGxC?=
 =?utf-8?B?b3hNckFWd0ZDSXFGdWFPdTVqNUVXeERwSVZJMnViZTQ4WFFsT25sUTc3azhF?=
 =?utf-8?B?bXRsUEcvVjlKNWJKbWh0S2duZTA5aVhJdzVsajhiay9meXNZM3pUdUJ1N3hE?=
 =?utf-8?B?VnZrdHVMR0VvUU90dW1OeU10ZFh6Y0JQczRxdnd2WjZSaGNHZFVzRTBZRkVk?=
 =?utf-8?B?dm9MaGpOYW5nTXpFblI0cytnMThFUjh5aTg1WWlaeDNRMmJ6U1Bvb2hZcUtC?=
 =?utf-8?B?OUZWakd1a0ppYXU2WWxHcE5pWGVheEFrMDdxQTN4M04zbXBEWUZGQXFaSUNB?=
 =?utf-8?B?UnlZVUhDZ1ZmVVdCWDQxVVovSHYxeFduQ20xWU9zTk1VbjdnN0czcmxRVmly?=
 =?utf-8?B?Y2FWdmJ5c0RqcHh3Y0xHTG1GeG9SdGtzcTBKQ3FUR201RXJUT2lPbnFQRm5N?=
 =?utf-8?B?eVIxNHFtaHZWN2wxNnVXRENXSzRtblJMdCtPeUtOZVdhSFV1K1gwZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa7fd42-0989-4768-84bf-08da42de019e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:17:30.4778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i70nfoZ10ShPVex8MqF4TjKkOe8YECwpDPhYrlF+mPHSseQ16F1kDM+0dEePdV/omzxqh5wAzjqVSHxMx+N+/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4773

On 31.05.2022 08:57, Xie Xun wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -0,0 +1,274 @@
> +/**
> + * Copyright (c) 2018 Anup Patel.
> + * All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2, or (at your option)
> + * any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> + *
> + * @file linker.ld
> + * @author Anup Patel (anup@brainfault.org)
> + * @brief CPU specific linker script
> + */
> +
> +#include <xen/cache.h>
> +#include <asm/percpu.h>

At the example of this - how up-to-date a code base was this written /
re-based against? The Arm version of this file, which likely would be
the closest reference, makes use of e.g. the recently introduced
xen/xen.lds.h.

> --- /dev/null
> +++ b/xen/include/public/arch-riscv.h
> @@ -0,0 +1,182 @@
> +/******************************************************************************
> + * arch-riscv.h
> + *
> + * Guest OS interface to RISC-V Xen.
> + * Initially based on the ARM implementation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
> + */
> +
> +#ifndef __XEN_PUBLIC_ARCH_RISCV_H__
> +#define __XEN_PUBLIC_ARCH_RISCV_H__
> +
> +#define  int64_aligned_t  int64_t __attribute__((aligned(8)))
> +#define uint64_aligned_t uint64_t __attribute__((aligned(8)))
> +
> +#ifndef __ASSEMBLY__
> +#define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
> +    typedef union { type *p; unsigned long q; }                 \
> +        __guest_handle_ ## name;                                \
> +    typedef union { type *p; uint64_aligned_t q; }              \
> +        __guest_handle_64_ ## name
> +
> +/*
> + * XEN_GUEST_HANDLE represents a guest pointer, when passed as a field
> + * in a struct in memory. On RISCV is always 8 bytes sizes and 8 bytes
> + * aligned.
> + * XEN_GUEST_HANDLE_PARAM represents a guest pointer, when passed as an
> + * hypercall argument. It is 4 bytes on aarch32 and 8 bytes on aarch64.
> + */

aarch{32,64}?

I understand that despite the base architecture having provisions for
128-bit mode, there's no intention to have provisions for this mode in
the public interface? But perhaps at least #error on unsupported
__riscv_xlen values?

> +#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
> +    ___DEFINE_XEN_GUEST_HANDLE(name, type);   \
> +    ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type)
> +#define DEFINE_XEN_GUEST_HANDLE(name)   __DEFINE_XEN_GUEST_HANDLE(name, name)
> +#define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
> +#define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
> +#define XEN_GUEST_HANDLE_PARAM(name)    __guest_handle_ ## name
> +#define set_xen_guest_handle_raw(hnd, val)                  \
> +    do {                                                    \
> +        typeof(&(hnd)) _sxghr_tmp = &(hnd);                 \

Would be nice if new code could avoid cloning name space issues, like
use of identifiers with leading underscores (which are reserved for
use by file-scope objects/functions/macros).

> +        _sxghr_tmp->q = 0;                                  \
> +        _sxghr_tmp->p = val;                                \
> +    } while ( 0 )
> +#define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
> +
> +#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> +/* Anonymous union includes both 32- and 64-bit names (e.g., r0/x0). */
> +# define __DECL_REG(n64, n32) union {          \
> +        uint64_t n64;                          \
> +        uint32_t n32;                          \
> +    }
> +#else
> +/* Non-gcc sources must always use the proper 64-bit name (e.g., x0). */
> +#define __DECL_REG(n64, n32) uint64_t n64
> +#endif

What is this good for when ...

> +struct vcpu_guest_core_regs
> +{
> +    unsigned long zero;
> +    unsigned long ra;
> +    unsigned long sp;
> +    unsigned long gp;
> +    unsigned long tp;
> +    unsigned long t0;
> +    unsigned long t1;
> +    unsigned long t2;
> +    unsigned long s0;
> +    unsigned long s1;
> +    unsigned long a0;
> +    unsigned long a1;
> +    unsigned long a2;
> +    unsigned long a3;
> +    unsigned long a4;
> +    unsigned long a5;
> +    unsigned long a6;
> +    unsigned long a7;
> +    unsigned long s2;
> +    unsigned long s3;
> +    unsigned long s4;
> +    unsigned long s5;
> +    unsigned long s6;
> +    unsigned long s7;
> +    unsigned long s8;
> +    unsigned long s9;
> +    unsigned long s10;
> +    unsigned long s11;
> +    unsigned long t3;
> +    unsigned long t4;
> +    unsigned long t5;
> +    unsigned long t6;
> +    unsigned long sepc;
> +    unsigned long sstatus;
> +    unsigned long hstatus;
> +    unsigned long sp_exec;
> +
> +    unsigned long hedeleg;
> +    unsigned long hideleg;
> +    unsigned long bsstatus;
> +    unsigned long bsie;
> +    unsigned long bstvec;
> +    unsigned long bsscratch;
> +    unsigned long bsepc;
> +    unsigned long bscause;
> +    unsigned long bstval;
> +    unsigned long bsip;
> +    unsigned long bsatp;
> +};

... you don't use it anywhere? The use of "unsigned long" here needs to
be changed anyway, as you need to express both views (rv32 and rv64),
unless you mean to never support 32-bit guests.

> +typedef struct vcpu_guest_core_regs vcpu_guest_core_regs_t;
> +DEFINE_XEN_GUEST_HANDLE(vcpu_guest_core_regs_t);
> +
> +typedef uint64_t xen_pfn_t;
> +#define PRI_xen_pfn PRIx64
> +#define PRIu_xen_pfn PRIu64
> +
> +typedef uint64_t xen_ulong_t;
> +#define PRI_xen_ulong PRIx64
> +
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +
> +struct vcpu_guest_context {
> +};

At least struct vcpu_guest_core_regs should have an instance in here,
shouldn't it?

Jan


