Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC604C8A49
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 12:06:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281245.479494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP0KH-0005uL-WD; Tue, 01 Mar 2022 11:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281245.479494; Tue, 01 Mar 2022 11:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP0KH-0005s3-Sg; Tue, 01 Mar 2022 11:05:53 +0000
Received: by outflank-mailman (input) for mailman id 281245;
 Tue, 01 Mar 2022 11:05:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP0KG-0005rB-DZ
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 11:05:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e601d69-994f-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 12:05:51 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-bIPFnNKYN3uSy7cJjYTBhA-2; Tue, 01 Mar 2022 12:05:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8095.eurprd04.prod.outlook.com (2603:10a6:102:1c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 11:05:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 11:05:49 +0000
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
X-Inumbo-ID: 8e601d69-994f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646132751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yVhh9raFqY1k1mmmz8RZiJfkzqL7jHEKprsJSfJ+qW8=;
	b=HLdOUkx+gebQi2TvLwqlywxBsKktvMc9Hv5XBYqScvWGUQ1Xxg8LlJ6feFTdd9yfucTuLL
	7u0r93VUqP88e9Mfwtm8nX08mjHoIxgM1KVEUeZThtDP5gpRnC75NLjWfQfX814LE6XCln
	pL3JUez3K6cCvowuK+9IxH71toaBa+M=
X-MC-Unique: bIPFnNKYN3uSy7cJjYTBhA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRdmnOnjSJ2Uvo98Tm4jPYGnspuBqOptTwVzWy63A5oEvqHELWgEHrrBuhhH26TOBO5dYNO56E6XVoW1n+l4Ovkp93471Y7WgMtI2vlYfySZOk2oZiQSZtohFjNMvxZYUhXiTaGI9AeZ5EqQeowoAzhX5TAm8/eax3C0pq3QRPGULmBS2okUxcZD0/pFZjjCPUK54HnMkNF0ABwMqYsA4Gizai7yPoACVHYE2VpyCpwpsZXsAmlZn43Tg2EDeXgXhasKFQUl4x0J+HsKvSHLWHCpIuQC0HpTVdBf/Cu6cvubKZxMPEds8hlSWBbLmhIRWU5HsvUpJV8ULfQlsTwVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVhh9raFqY1k1mmmz8RZiJfkzqL7jHEKprsJSfJ+qW8=;
 b=jWCBziFs9DYO4cOpBFWd56R5GdRyQDRW0Ktv1A7qpK25XnhBlHOPKPbo6GKtL0giyHF6jjVmKngksQnWxvS+mOY1ocbO7j39TKlihvpQDs23SKJkW3RAFAW/gJORS4iW4umlQ+MDLF5yEjBvGOYWks+VoOEhIODaOJTPCssLnIqt8WZP3p/2q+/PLG8wnnnDZa84KvMwk7CDmTN3WfAehU7b72mZorgSxwAN8RZb9WsqDj2CRxydXwx7y3Bsrp4tjx3xc+z8Bafkc43K5oj5tbvxMs41pKid5EN/Sdf2iPQ2ZGuGTHwIZEssPeBrJicOg46O7yaDlCOeIbbMS1dNSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f4f0e92c-9586-e021-6ad5-718628f88fcd@suse.com>
Date: Tue, 1 Mar 2022 12:05:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 1/2] x86/time: use fake read_tsc()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
In-Reply-To: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0272.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69dc9f71-5cd7-4d6d-2022-08d9fb73710f
X-MS-TrafficTypeDiagnostic: PAXPR04MB8095:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8095605EC301D4BA50096F56B3029@PAXPR04MB8095.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uh62QAnIYPkzL7Nagz1kpvhoFB1YtFwNl/H03ifJNkxRi54G5YE+Z/Lz4UQSAAdg3qmemxbPx8QtScuMlB0fo0TVbCYw53JzrmDDnuVT2syHUvpRfEhYZ2zRWaYc4UmUgQfdChk2ZH/ZLxKO3ibbs11lKacIRSeI8cGR4aWnQxe4GaH10eT32tKqeIC1g7Zs46uD7oVLnz6aQI5FrcmOzDAG/xy4KzqKkCqZltDUWwhVvDbsmhTwz2Ha0sEza/TCa9l1OhpQd3rwl+cjUuNOCYqTdLdGdghsGbxfuLvNDV6dHy/v9b530EMP93CuvzXLoZla1DkViBpyDkTTZbQQbCY5rWpsEqHf5+6TdIAlyKgHV9kpKm/B2tPHA5/QXwaGrAv3ZysNMfTeiR5t8B0tr52RTOQ/UXbLNqgTlH65GAP9g5EErJAfhhcSaO1C+cAw2L9syWFOLWaP9OQxEwe/e76jo4NZIYS9FLqXV6S0/4ggPLqS0EVh6SU/O8A6LGAdTtLYNSt5SqJkovkPxIsOO5ZjHsAizp7u/7IavC0xs2XoI75OcOUXE/pUYNnFuGm28Roiyv3s0l/GoUvVkfX/KLVxYFwR6JW7ecP6WCexyybPtfSWY/Km9rj/ZuU8h6YVbZgUA5mWPMo4kGkDMEkTneRmTUfKlRtvz9sX/KwL7mID+nqpftaRvNnvcFAag9EPT2gswAJRKOE4U40D3uXJYjrYbBbiBoDGGpMeWiTT/Xk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(31696002)(86362001)(6512007)(66476007)(66556008)(8936002)(83380400001)(316002)(38100700002)(4326008)(6916009)(54906003)(66946007)(508600001)(6486002)(8676002)(2906002)(2616005)(186003)(31686004)(26005)(6506007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWk0WXdoV1pSdi9vNFFKNjF0a2xDYVFXKzVNQ1N2T0xWeDJIOWRVN0hPcXI2?=
 =?utf-8?B?OVBGWk96NnZ0cEQxS3k4K3ovb1Yxd3JrSDZnSWQrS2hQVFlydklXanAyNDdl?=
 =?utf-8?B?RVJkdDd3RHJKTmpiQ29jRlp0ZEdKeTF5M2RoTDlXU2IwRG54ZVNLazFMdkkr?=
 =?utf-8?B?NWZ6OVYrcUQyZjgvVmFFU1FRN3FMZFViVURiZC9rZkFEeGN4OXNBL2s2L1B0?=
 =?utf-8?B?VFlaYWp0YTN6aFhPdW5xQVBNRWZiWkxHOE1CMEpoUGE1RFJPeHIyN0RKSjZz?=
 =?utf-8?B?bGhrdjQrZmV6WThtcHQ2VHVGS2F3OHdrZ1gwYy9ZbGZkS2dXdmlQckFyWWlZ?=
 =?utf-8?B?SFNjNDFsMElhSTI0clZkRXdXSWJBdStTcjlFdWpKQ2hHRXg1WngyeVNNOFc4?=
 =?utf-8?B?ZVgxZjlaVkhQU3luUnp5R1VSWjN2eXFnQjhoMk9UL01odmF5eW1nRWl6N004?=
 =?utf-8?B?N296d3o5bFpXZWc2R0FNa1NrWVhMNThrNU5Vcnl3Y1JzOFg1a3ZMM2YzZlhJ?=
 =?utf-8?B?TU9zZVpGS1VMZUJlVWZFeHRPUjJDckMwaFBnMlplOXVCaFdkOGI1RjJ5SkZZ?=
 =?utf-8?B?U090MTlWdTNlSHpFNGg1ZmY5SDk0YTVFYXhkWUNCaXhTeWpmdWdwSjJsRy9p?=
 =?utf-8?B?S3M2c2UvV2FUeUk3V3RZMmc0eUkrSHdaQzZGaEcrTDNDNUo0QnJ1UXRibXV6?=
 =?utf-8?B?UE4rd1NyR3A2amNuZUxON3Z1dHJtUjZMY1A5dytjVkxVcC9zRzZwVmMxbmRt?=
 =?utf-8?B?ZG1LV3U1VHp1dDVQbnhjRFhJMHVaWFBrYTdCZG5TK01XcTZMTWxZdDJUUnBW?=
 =?utf-8?B?aTBySFhrS0tPWTNqZ0hTTHJsTWJsQ01iUERHYldjVFcwekpiM0ovcU1uOExv?=
 =?utf-8?B?ZGlOQm5OYVo3LzJIM05LeWtGN2ltMFhaL2hpVnFUVDlHQ1pkYW9TNVplWGhI?=
 =?utf-8?B?Q09RVWttUHdUckRTNlRQNXRJTzZldHBxbFIyNWRvZngyYkQ3MG1Yd2RzVjBB?=
 =?utf-8?B?M2ZsZ2l6TXVoR2pWR2cwUS9hcEtqSjR1MFlHSWpaMFQwNTNGVElJbVdhbEov?=
 =?utf-8?B?ZStHUWRGeHB0emRvUTNKRTU1dnhRNm9ZRHc5UFFMTDEyZnNJNDV3c3Yyc2F1?=
 =?utf-8?B?dTJJaWY0d2dXUCt5eGNSMi8vcDVjYmo1TFZic0ZJNElaWmpSMTlvTHRjZXFK?=
 =?utf-8?B?akdKM3l6eGMveDNrbVd3b2dvUzR4eExSNDhjaUlSbnBIUjV1elR0KzhaSnVB?=
 =?utf-8?B?U05JNWUvYjJPUDQ0OW8wRC83alZWb01QN1VMa1BTenh3M3A2S3Zsb1VURjZv?=
 =?utf-8?B?YlYySUlqMmk3ME93S21jU1M0SDVYNDdIaHR0eXdNejRzbkxGcndFeTBKZm9M?=
 =?utf-8?B?UnM4WTZBbFNYOExqV1BtV20vUVA0NnBxV3hYTGRicjhWUTZDR1BYZGZJWTU3?=
 =?utf-8?B?clJzQTdpOWtUcUJSaXZzU09ObHhRSVdWV2QrWTU1R2Izd1EycFFQZFJjeHda?=
 =?utf-8?B?TUR4cS9hdlBSelgzWmJXczNoS0p3bDc0TGZHV0ppVmFRR2JjYUJGNU9idGsy?=
 =?utf-8?B?a1NtaEFxZlRJaTBCM0FxSU0vOHhjSkNnTlpFY3Ezcll1cEV4M2ZMMTBhU3c0?=
 =?utf-8?B?dFZ3Vjdrd2Q2eUQ3cmpRaGl6TGhLSnBCQ1hCcHNWbnJydnNEb0kzY1pBV0xI?=
 =?utf-8?B?dHF0UWYvL0hQdngrU2QrWGlwRWp3RUNqc04xWFFvV25GUDdsQmpOTnV3b1JU?=
 =?utf-8?B?cmh5Um02NTFoVFN2Nisrbi9iRWJ4alYwdUpEWVZIWFVzRzcrRmlkSHc3Ympy?=
 =?utf-8?B?cmV3R3RybTl0ZmhjenRCckFpYmY4dCtYQllXckk3ZE03NnR2VXgybjdTQXdx?=
 =?utf-8?B?cmxpUWtEeUJUbkdoNm96d29lYVZjdkRveDVIVFJyNCt1QVBLTy92Sk1UN0lX?=
 =?utf-8?B?cXBGVWtrZWNMRGJxanhKbGVFY3Uxb2JxNXJnakNqWTNWcmw0MGFnaGUyYzZL?=
 =?utf-8?B?OVROM0Z0THNJa0ZxNUJBZEp4MVQ0d3U2MzNFNTZoanUvSGl1eFdKb2p6MExW?=
 =?utf-8?B?K2ptZkJZY2pRMFZpaXZpNXlGcituQTBoNTZSYU12UWtGZ1d0V3pCK0tyRUhw?=
 =?utf-8?B?VVJlZG5DR09oUUUwaDJsQzRVV1p2bFk2LzVWN2szVThBakdpd2NNOVdBKy9q?=
 =?utf-8?Q?97Bp5H8YQ2tStU3oeKBZw4U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69dc9f71-5cd7-4d6d-2022-08d9fb73710f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 11:05:48.7825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeUt1EXn8FJ9jcllL9zZFAqp9084DVoxGU2H/9W4iefjzdD4KnNnVp7T6BAKFeWZivSD9auPMGQE+xkmUzP0CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8095

Go a step further than bed9ae54df44 ("x86/time: switch platform timer
hooks to altcall") did and eliminate the "real" read_tsc() altogether:
It's not used except in pointer comparisons, and hence it looks overall
more safe to simply poison plt_tsc's read_counter hook.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't really sure whether it would be better to use simply void * for
the type of the expression, resulting in an undesirable data -> function
pointer conversion, but making it impossible to mistakenly try and call
the (fake) function directly.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -585,10 +585,12 @@ static s64 __init cf_check init_tsc(stru
     return ret;
 }
 
-static uint64_t __init cf_check read_tsc(void)
-{
-    return rdtsc_ordered();
-}
+/*
+ * plt_tsc's read_counter hook is (and should not be) invoked via the struct
+ * field. To avoid carrying an unused, indirectly reachable function, poison
+ * the field with an easily identifiable non-canonical pointer.
+ */
+#define read_tsc ((uint64_t(*)(void))0x75C75C75C75C75C0ul)
 
 static struct platform_timesource __initdata plt_tsc =
 {


