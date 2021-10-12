Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301B642A0FD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 11:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206976.362678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maE3W-0006Ob-Lq; Tue, 12 Oct 2021 09:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206976.362678; Tue, 12 Oct 2021 09:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maE3W-0006Mn-IV; Tue, 12 Oct 2021 09:26:42 +0000
Received: by outflank-mailman (input) for mailman id 206976;
 Tue, 12 Oct 2021 09:26:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maE3V-0006Mf-1s
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 09:26:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cd8cc66-edd3-4238-bc5f-abb866dfa310;
 Tue, 12 Oct 2021 09:26:40 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-WF0At2RGO7edNOEFeJJlBA-1; Tue, 12 Oct 2021 11:26:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 09:26:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 09:26:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0092.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 09:26:36 +0000
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
X-Inumbo-ID: 6cd8cc66-edd3-4238-bc5f-abb866dfa310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634030799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfgbzRb7yA4XjUtaUAf4Abv7ClKyEgs3Gf8y/3mHnz8=;
	b=iqS6Q6oJjLZNhg1gHOTakqTMfOZCwXueUK2dhkuNjD9/TkudrxlHxj6DjpDlLnwA+Kj5j5
	AwiH5OT7Ro3tC+uT6HtvxEnfN+i0+QrP3OJQPpNJzFFoxztnl1UDILZYsw9HKtnwZzKDJd
	PPufb5tVBL0txQB4k13qc8whxKSxAcw=
X-MC-Unique: WF0At2RGO7edNOEFeJJlBA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/TtfJs983dTU5Vzn3GuiVYpY38mHuqzjb+qs7XJ+HhVE/RRL/TtLo8mYw+zanByqGe0ca4z2GdLnYeua3P/smMvWDszCu61s1DP9JNbS3/moftrTV8SstC317iOHkOI/zbfB5XarJ7CVSIP7X/gp0WNG2RFsfkKl5GCgPFe56YkmMXv1cusqaAVnE0dtvrOnAB3UheOB5YRts1t2yLsr/bDU5O1XwRKa1QO8OiFqTqmstSQHMsbabT2VVSGNQnXT7HXeIz2SOntNKt2SccNiEJc6b5W5qWp9wzzFKOUAWVqx7VW1bJ6uZam0/FBnonqlbd6yyqzyhUKVf1wLrmKJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfgbzRb7yA4XjUtaUAf4Abv7ClKyEgs3Gf8y/3mHnz8=;
 b=DfdoUZZ8lJ78lJyGjvgCxZQJ3zQJKWODDzkgeY9iEJiNhqe9LQOUtHa5YfUI+xb/yP9leA7t+jlicMfVjUI2bVTQvQEG1CrHyG0/Gtw+g0J2+vLfNh/w8aNlS7QB0XA7ABeikKp5BgCUaE01JXVpzPJg0uoqXqVYchm40sRxKTVJDWR+TnU2AhWQLQ+E0L1kM7QenpMlxYR0d5xALjZlywSut12NS3PoOOF3539YSD5bSF7pJj4qkAjOkYq5xihJj5n/5FdoXKy9LSzrIxbLgVw6GvLrGyPwZPA9FtB8k/d2AKuIh4rxTuDhZCmkO+NWDv1ZN9eFqqDDkAeFqjhMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/pv: Split pv_hypercall() in two
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211011180541.24501-1-andrew.cooper3@citrix.com>
 <20211011180541.24501-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cfc8940b-81bf-58ae-8c3d-d9f3a5d662db@suse.com>
Date: Tue, 12 Oct 2021 11:26:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211011180541.24501-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0092.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24e5447d-9d4c-4644-898c-08d98d6263a8
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6174DCFA6E03FF9D7E2250D7B3B69@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KkBAj/SCcUp3j9Ba7c8cUTiBYSNJHmOA78iGyd2w6XkUjYuZNUCo86zGv7Zt9Wr/1w4QGXV+GPu9Y/gIJMGNKRfc8Yn16qDy+qEb1pEuvz1FG/m4GUuqepxdLOqZlb+fl0Ya6QtQejQg+SpbZRHlD+tBjXc2w4IlGV+wsrqXebc1bWpu+yZVkdy1l3v/6IyU4ngVBsCbbsevWnx/E4znJgFUwXZNYTVNOw2vjn41pLMJV0BKq3n+9u8K2FdElATEmDns8PAZx523+pKhFDpz1K69YW6POs67XzhMGvnar3nq5TqpIYRNgFQ08asn5rsYyBeXSuX0hVitN4dK2M+BhuRMrMPCUYr4ezKduQ0ioDgnvO5QX/egSUrdGFqmTmv2uH32FZTf7PHyo7MTt0hZmgpT+OGfOo1KXjoQFdBG/9zIuaafmIYdw0/Ek6OjaP02K3RBICqZHfcgWk5M49mvbVwBo0wU/pHvr71qLw2wpXn8qPmTB7ADu9Vg97hXRsb/AkZPO8BIfOtNaQA7wtSnrj/iPncTLfGbUNxsMOn8EQrzvj6fA2QvLmh3pHBa8pueKJNgjwNojqeKFH4v4Mf47jpjd47OLuBoRKO+nCB7VXTH+2xguhInSe295mGTuowOePCN+rE4IAvb4sRI6+/6Cg/cvF81y3WFxunUPbGRaXOZordH2arK4im6XNrAc41J3yXjiuGgn7gNyjqdRSzAPrs7xVppAK3nLPGrQH6sN9Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(8936002)(6486002)(36756003)(4326008)(5660300002)(186003)(26005)(31686004)(54906003)(508600001)(66556008)(66476007)(2906002)(66946007)(16576012)(6916009)(316002)(38100700002)(2616005)(8676002)(956004)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzNweU9NZ3d6ZjVUaENRa25UcGN5K0UyVlZhOVJ5SmRMVy90OXVseWVjSGlz?=
 =?utf-8?B?RUxqZE1RR1BFMU4rb2NuMitHZi94eVlmSVk4UWR4V0xPQXZmWmFpRHRPOVVt?=
 =?utf-8?B?M0dLMysxUUZtOFdHMkhjeHBQK2N2M1FUTEZ5cC9ZZ1Y3NTNMOVh5YXN6MlZo?=
 =?utf-8?B?ZEc4VTlSMUZwb3QzRG1KWU9iMGx2ZTZQMVlYL1dXaVU3Z1FGRWJZVWpYZmt6?=
 =?utf-8?B?aklEaXBnay9LTFV6dUg2QS9EUk9kZzBkWDFVallscmwyS2ZydVpVRmQ0aTNz?=
 =?utf-8?B?dlZRMUJyRGd3andPZCtoQTVNbGYveEtBWlRZNXoxN285dTZiS0FXNDVkUm5N?=
 =?utf-8?B?dzVsTTExQTA4YklSQVUwVTdZZm1vQjBwcDVsYW5LQk1qUkV5QTRHdGhxTmtT?=
 =?utf-8?B?TTMxei9oZWJlcGtVYlFHc1dNSVpRd0pUY1phT1BvTkR1VVMvcU15RDE4ZTRk?=
 =?utf-8?B?SmY2cGNzd0hPYUFNaVdiTHI2RGFKeHI4dDdQazZGaVRIV0ZDUVVETUZWbDF1?=
 =?utf-8?B?VHk4YmwveHVJWm8vR2ZzbVZUTk12RlpKMGtGN3lPaWpWTEE2TWJIdEVSb0xK?=
 =?utf-8?B?VXFPZHVmSk0xanNTbWFFaVFJcmlGeW0zZWNjVU0zaWVqdVJNa0ZuaGROUmZK?=
 =?utf-8?B?MncvWUU3S2dNQlFFNDdOeGFSMnZMUWFUZnJoZWR6R3JvWW4vTnFSd1FkeSsy?=
 =?utf-8?B?aEVwVUdFQ0NKSGo3RzhDR0dzam43cE1ZRjJ4bFhudzBaYk5DYlAvSWl4NzZt?=
 =?utf-8?B?OXhEaVFGNmZlVmV3OTdsZkxYME54aVpRY1JyOXpQVkhyNkpWWm9lalZsRkxX?=
 =?utf-8?B?RlJTNSt2QXBiVUFFV1J3Tm5wZ0s1QUFGZG10TlNOR1lLTWhHMnBPdDFkdmRj?=
 =?utf-8?B?blVYaG4yRmdTTE8wbFAxQ2o5MkU4QWkyVUgvSENNam84Y2dMQUtLSVZ5Ym9o?=
 =?utf-8?B?NWx2NnU1SnlXWjZXL05zQW9LaEU3czI2eFdVeU8yT1NrQ3lidmhyMjVRNTZ0?=
 =?utf-8?B?Sko2UUVoOE1kaHp0VHhjVDFMN2dGd0gvdFlZQ0c1ZnJDaVdOSnJtLzVqU3ZW?=
 =?utf-8?B?cGlRYVl4cGlHNDc4a1l4M0F6WmVRVTFjc0FFMFUreXBTOE1BTm1YREttZ28v?=
 =?utf-8?B?L3J4TnNrR2JzRTFvSTc4QTlDdXVURHNBNVRJakFhMnN1UHZ1bENtKzYybHdP?=
 =?utf-8?B?aVpwbWlwSHhvM0tnMmlNeGlOVm5lcnM5ekRUZVBzVWs4R0RMSlpXL28yWkFz?=
 =?utf-8?B?VU1JS0gxYm5yMHc3MkZkRHNGKzAzQUtta1ovUW1UVldORjYvbDJVVlJKTXNL?=
 =?utf-8?B?SHh6WDh0R2d6QmtpQWlISWtiN0lLM1hGdWRHMmZYTHJud0plcHZrVzNwbFpq?=
 =?utf-8?B?WVliOEdVN3BuSTY1enQ3RVhGUWdpd1lZbXZRRk1DQjhJbnVPYUgxUHdlMzdF?=
 =?utf-8?B?Qnh1YjJiSUdBQ2p5YkFSMTE1dzNvS2MyTTd1UzNja3FRSEViSW96ajNSNmd1?=
 =?utf-8?B?d3Y0TmlaVmVsMVF4QjRHR3hKV1RncndiTXVHVVdmaURUVmpyQkpBck56OWZQ?=
 =?utf-8?B?QmtIR1ZIYy82QVRZZkl2eWVrRzlLTnNHWmtXSU83L0pmZG9TOGxPYXRqWFVy?=
 =?utf-8?B?WXhXWTczYWJLSnhEek9MRDJKMmtIcmVQTVg2ZngwRFdZejJ2NXdaYnYybWww?=
 =?utf-8?B?ZDJ3MHRuSzdhdzFKM0JuWDNLeWxpYkNYSTErSXlFaXdKQU5hNkZoSmF1RE94?=
 =?utf-8?Q?afcmq6H6lBX+bSKiUSM0Pe1NFImuVMnITGnxGhX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e5447d-9d4c-4644-898c-08d98d6263a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:26:36.8626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1sRRMVqticOnZ/FQ9rqdeCXwC6q0VRzW0U73ad11NNpGM3o8iBKpoBO8w6nKp8sCL+INETKsf5Y6OfkuSCIsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 11.10.2021 20:05, Andrew Cooper wrote:
> The is_pv_32bit_vcpu() conditionals hide four lfences, with two taken on any
> individual path through the function.  There is very little code common
> between compat and native, and context-dependent conditionals predict very
> badly for a period of time after context switch.
> 
> Move do_entry_int82() from pv/traps.c into pv/hypercall.c, allowing
> _pv_hypercall() to be static and forced inline.  The delta is:
> 
>   add/remove: 0/0 grow/shrink: 1/1 up/down: 300/-282 (18)
>   Function                                     old     new   delta
>   do_entry_int82                                50     350    +300
>   pv_hypercall                                 579     297    -282
> 
> which is tiny, but the perf implications are large:
> 
>   Guest | Naples | Milan  | SKX    | CFL-R  |
>   ------+--------+--------+--------+--------+
>   pv64  |  17.4% |  15.5% |   2.6% |   4.5% |
>   pv32  |   1.9% |  10.9% |   1.4% |   2.5% |
> 
> These are percentage improvements in raw TSC detlas for a xen_version
> hypercall, with obvious outliers excluded.  Therefore, it is an idealised best
> case improvement.
> 
> The pv64 path uses `syscall`, while the pv32 path uses `int $0x82` so
> necessarily has higher overhead.  Therefore, dropping the lfences is less over
> an overall improvement.
> 
> I don't know why the Naples pv32 improvement is so small, but I've double
> checked the numbers and they're correct.  There's something we're doing which
> is a large overhead in the pipeline.
> 
> On the Intel side, both systems are writing to MSR_SPEC_CTRL on
> entry/exit (SKX using the retrofitted microcode implementation, CFL-R using
> the hardware implementation), while SKX is suffering further from XPTI for
> Meltdown protection.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


