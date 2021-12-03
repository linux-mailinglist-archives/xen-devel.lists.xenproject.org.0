Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD13F467710
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:07:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237512.411934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Ld-0005mt-BT; Fri, 03 Dec 2021 12:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237512.411934; Fri, 03 Dec 2021 12:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Ld-0005kM-7T; Fri, 03 Dec 2021 12:07:29 +0000
Received: by outflank-mailman (input) for mailman id 237512;
 Fri, 03 Dec 2021 12:07:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt7Lb-0004Rn-6z
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:07:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9482a559-5431-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 13:07:26 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-FAZvQMsONi25VyTIfy6i3w-1; Fri, 03 Dec 2021 13:07:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 12:07:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:07:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0011.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Fri, 3 Dec 2021 12:07:23 +0000
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
X-Inumbo-ID: 9482a559-5431-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638533246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ms0YHIDv5FBReZC9ySpmTf7afFn9dSpJLL3t23RnwNE=;
	b=bGnQWmiZTnPgU9kWETHVHSSbG/xU6V5Fz8Qb5ZBVMkCW/qHPTvjLp5AzsrKLvJzsdCsAmU
	qEw3kJ8MjdEDZD9bYLwO9eMZOUgrczOmUdnjj7+YU2YgzB6DFS9ppNVukkH9ewf1BzHcJv
	pWdQdoXrHjageyYyEiJAR595VCoOtWY=
X-MC-Unique: FAZvQMsONi25VyTIfy6i3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cR2ezW4bj9BBvDk1dLj+Iwniy+DMTauA4SLL+43kZXbVAB5OJo1vudK3a70zRykmztKTGr4AmmUosby1Fb3sw9Pdr2pyBi+T3n8BEtxRm9I+LJJrcZ+jJEdHG5BCJ6lipZAlQiYemaVVa7V7r4VXY/6tfRCEJj/+1vKPn0/j8q1hozVLTsTcaZsezi4/tSqZwkMSrwbZMQozdLiZJzIZbvgreUCr5aHAPUlKn6P5i8oa2AO0XQ/svq34YvFrjPeAMJzKKMh0LpiDjrgPQ0W/g/kIdRQRUy3cT5tLTRq6W6yHdeiTZEd57m9zeQzVMk5rqZfC/taksC5DLLBU6fHyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms0YHIDv5FBReZC9ySpmTf7afFn9dSpJLL3t23RnwNE=;
 b=DqxKR/X9lIIscjP9rs+vxRIKTipCqogWbuns3njs/koiS5wyqoUSzQm0L6v7M1VGwQPNOg96yJ6N2KT0wFOT8BFE4tG9/FvZUsHo+1QW/hb30fulx0pMuBIIWM8JQu06sGAHRLW07+RoHg9GL+ll3PFuQ2F2eHH4RYpX35iJ/Ma/mV1LLi3kJuACCDFZYau5qlJrsgkb4R5hmaSemEOFzer1ghb20erdYPOyIz4wU8I0/S0bXLlfNqdPTE4NfgLF5RJfvIHowIDe/iX7iw3R2/rBHhu2qBqxf023cYj30wCUte86SCDSzlUYbQZwqS1uk6WdxMjSXhESKVm1//zXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcded1c5-85c8-dd43-6662-115652ce7932@suse.com>
Date: Fri, 3 Dec 2021 13:07:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 5/5] xenperf: name "newer" hypercalls
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
In-Reply-To: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6d02cf6-7dfa-4641-c8d1-08d9b6557769
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191AA42FCC11EADF4F8D8B4B36A9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ib0gUJMBMdgPLzuafH6a+RCwI2lLJjWdN9Bj/y7FT22ytfjoeFAnZKoq+VgUFwGvDqO/VTdqhgxph0vNGySH1X5AGR7doyOr/5Gj9V+Hg9MDo6b/yMDITFAtbXlCt0joWZJ/ETDIke+aV8iNApS6eULynpiXkOVD4OEVoRMjTbu1aD5Kx7LO4x+lH0UMZhx5N6W4tR+gG6nnLLXQN0VSdi3KawC4Hz837lQQv9lW7QQt5y2uMU8c9IC+rLzBBa5RzCLdjnXSIt3nBm4fEA0h4iulztX7aw8GMV7JsgKbU2JkPGnwkuTNAT61qogv2Dhxj3nz68nBoQ1F2g4fVggUMQhYedvOkUy4ehPjvaLAJjJlNDhBt78ErT9SyKw588rbMeZQs76a/g5v6DrpTTNAcu5pezXmkzW62BV1BOYAo7VYAWlEks6GGO/IeQhfrjcDIFuqsF4Q8K3wzYQ8tYrffqEo1zf9PRLaQuW6vy9ujujpBb5cjkrb20f270u4UEpLJgyxKYv0wPa++2zHi+crmqjgBKIkVPNAFpjpoGvdkG9vi2IKVsOzkpD3gf00VJ5K3yvbu8L0L5Wrp8ebbavwx0OVNi+vHnCCZSxP+9UVqxBF627UVw+wCSmvXiimSwqXnOKLqWU/CcAWc+d2rhfBEtDYvFdSANIFOYP0I/xduhwX1iKKO1Q+K8WBRy8QYPZ3+gZslXNAa/r21C7jX+NSI+7q2W3MJ7afLPuTsAh3s4w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(86362001)(8936002)(5660300002)(2906002)(4326008)(8676002)(83380400001)(508600001)(54906003)(6486002)(956004)(36756003)(2616005)(186003)(38100700002)(26005)(31696002)(66946007)(4744005)(31686004)(66476007)(66556008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUsrSWdsZWUyNE1ZOFp3OSs0VTY3Vlgza3dva1YvMHZiQzdSUDM5RVltRFR2?=
 =?utf-8?B?Z0lQZXJucUpsTThYNmt0MmpwdkJjNHIxRm4zOXF1UkFLQ29BTjNzNXVNMVM3?=
 =?utf-8?B?eE9rS2dJeDhDQ3AzTzI0RHNDUmFCYkVPY2tadGFpOWQ1dHlvSXZrcXRNOXpV?=
 =?utf-8?B?TC9Ockw4L0k2V3l1QWFnUUp2R0JlK0xua0x2NjJBNXE5UnZsTkxhTE1nSTdU?=
 =?utf-8?B?cHQwWURaRGwzdTlJK2JHbVI1c0hSWC9kYzJQZHJhMEZXRVV0U3YzYnVuNHcr?=
 =?utf-8?B?REFsbnB0b2lKNkRZMWRBbHNHeXpDUitINnhkOTRZQ0JmTXYyR3hXY2wyV1RF?=
 =?utf-8?B?aDZBekJZMW9UOGp0dGM2NWp1VW5ZbndTMlFvR3VxUURVWCt6RVMwV1o1MDNv?=
 =?utf-8?B?TUR5ODdNNm51VUJtNjFWaVp3QitFWjRWTlBINytmRTFwWHpnZ2l1ZzdQTXhz?=
 =?utf-8?B?RGtvOUIvMk5SSnI2WStxaUQ3YTUvbzZncHlQcUFVNGorSHBvazhsWDdERGlm?=
 =?utf-8?B?S1RtMExqc1dMMUYzWFdVU09sVXluRStIK29LVmRyUUZMUUl5ZHkyblB6MXBB?=
 =?utf-8?B?bGdHL2dhL3JvUFkwYTV2QjRMbGRFT2ovV3luV25obHRVKytubVh2WjdhNmxw?=
 =?utf-8?B?YVhkdklWZXRtQjBEQ0ZIUXUrOHAxQitOUWNOWnZhSmtLMVd1NTkzOUxsSDZ5?=
 =?utf-8?B?d0s4Y0FCSkRXWk1HVkh1QmYvNkxWcVA2REFQbER2R0RlblRMaDRDcTFpbkJK?=
 =?utf-8?B?S25KbVNsMkx3UkVVQUlTNUtBRjdDUklkSXoyakIvRlBUMGg5bE9GeHgzN1ow?=
 =?utf-8?B?MGQrOFBmaG0xSUxadEJYcWpEbnRrUFNodHJRUnA1NzNnNkJWQStpR2FuNGcr?=
 =?utf-8?B?dDVuSDh5TEFIVFNRdEZMbmJxTUg0QzVLUWZLbjdjdDdLaVpmZm1pZTJlQkY1?=
 =?utf-8?B?Ylc2cFR2TFR1SUlGVk8wbC81RU1lOGRqWFlPaXBOUlcydDYyaHp1WUdNU0ti?=
 =?utf-8?B?QjNiaFJOVTRabFd3bnc3T05OQVFOSFY4M09SeC9EVWNBVDVjZUZpbW1pTHkv?=
 =?utf-8?B?b0JHV29NNmdEUWtCcFg0THkzU3o0ZGJtLytYaWtseG43aU1RWTJ6Y2o3eS85?=
 =?utf-8?B?QkJkUDA3NWpLWXZod0daSzBOMGJNc0ZCb3VtSFpWVTE4QTJOdTJrQ1paa1NZ?=
 =?utf-8?B?ek84NklMWm1Ed2VHZU45T2NJK2ZtTTVvQ0lBUFBOMVJnWU9keGUvdTQ5dWpw?=
 =?utf-8?B?OTQxVEV3MUZ2NnhPSTdpZ0tHbllDU0dCdjltN3hwNTZIWThQV2xoeTRySzU2?=
 =?utf-8?B?TjRteE9HVThDcVdvMG5XOVdXbGdzamVLbUJhakpuRk5Ed2tRd1M2N0s0aVJL?=
 =?utf-8?B?YTR0bk1LVHpocEpWclNtTHFLT3Y0Rkc2YkUzSTRzWFNSMzd3d2Nhc2pidFZz?=
 =?utf-8?B?SDlOM1hlVUgyaU9objFZanhEK3lILy9ra0E1ekNLTkFQdTBCeURMOXBQOVhJ?=
 =?utf-8?B?eTFMNFBJaGhUdFlSSXVlSTJTaG5aRkM1S3E2b2oyZ3FzakpQcTl3VE5WYVdD?=
 =?utf-8?B?MndVRzlMYkl3T1BQa013Qnl6eU8yK0VuRklYdGdyOVNidnZIck9BeVVJNkVG?=
 =?utf-8?B?R0ZPRzhnL0p1U0NDU1VjcUFNYWNNK2MrTi9lZFdiSTZndS9ZNEkwQXhqSXFX?=
 =?utf-8?B?NmloUDZXWGRxOVJPZXpreERzOFpwV2oweTdxRFh3dWc2dHBTRlFjcTdXN2Ur?=
 =?utf-8?B?S0c4d1d1a1VKbmlIUzk0M254YU5aSVhPbzVOVXRJYmcwWXFYRzk3L0wrbkNF?=
 =?utf-8?B?aDVYbVg3NmJoWHdycklmMWNURWhIQlhQYjZpYzliWU1wVlJlY1hjUXJvc0hG?=
 =?utf-8?B?WHZxZFVWa1R6S083SE5uOGMySWxZcW8xYnFzeHIxS3dLT215K21iVkJVTGtl?=
 =?utf-8?B?K0lEd2xLN0p3cmNjRUtVR0daTjBNOUVTMDJVMWJFd1p0YWt2SnJwOFBlZHNN?=
 =?utf-8?B?Q2E3N01hTFhmOUI3M1NrY1JGQS9HY0ppZEJHTFdzRnRJTUJuSytQVWY5RDZn?=
 =?utf-8?B?c3VXY0tRbjg2NkpBVFFWa01sa2lPM2NYMmY3L0g0QUo4N3BhSHpGdzdNMWMr?=
 =?utf-8?B?b0ErSDVVckpoQit1VDVta0VqZ0l3ZHFCVlpWdVJSbnhEVU1aV3FBdFpqNjl0?=
 =?utf-8?Q?Lu7C/i3/xGiyOJH70RIFQ6o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d02cf6-7dfa-4641-c8d1-08d9b6557769
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:07:24.2512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixtlYJ56UE+a7ubUQfRnFBp54EwMArX1ODunnjrv1joCHt2NtlPCwXEpHfSJPY/m2uEJuP77cD3UrmLjjLwpXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

This table must not have got updated in quite a while; tmem_op for
example has managed to not only appear since then, but also disappear
again (adding a name for it nevertheless, to make more obvious that
something strange is going on if the slot would ever have a non-zero
value).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't really sure about x86's real names for arch_0 and arch_1. The
tool runs on the same host as the hypervisor, so __i386__ / __x86_64__
conditionals wouldn't be inappropriate to use ...

--- a/tools/misc/xenperf.c
+++ b/tools/misc/xenperf.c
@@ -18,7 +18,7 @@
 #include <string.h>
 
 #define X(name) [__HYPERVISOR_##name] = #name
-const char *hypercall_name_table[64] =
+static const char *const hypercall_name_table[64] =
 {
     X(set_trap_table),
     X(mmu_update),
@@ -57,6 +57,11 @@ const char *hypercall_name_table[64] =
     X(sysctl),
     X(domctl),
     X(kexec_op),
+    X(tmem_op),
+    X(argo_op),
+    X(xenpmu_op),
+    X(dm_op),
+    X(hypfs_op),
     X(arch_0),
     X(arch_1),
     X(arch_2),


