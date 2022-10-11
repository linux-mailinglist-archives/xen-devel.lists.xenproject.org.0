Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E0F5FAF56
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 11:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419477.664252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiBYZ-00034j-9K; Tue, 11 Oct 2022 09:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419477.664252; Tue, 11 Oct 2022 09:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiBYZ-00032W-63; Tue, 11 Oct 2022 09:28:11 +0000
Received: by outflank-mailman (input) for mailman id 419477;
 Tue, 11 Oct 2022 09:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiBYY-00032Q-8U
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 09:28:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2047.outbound.protection.outlook.com [40.107.104.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04aadb1d-4947-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 11:28:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8600.eurprd04.prod.outlook.com (2603:10a6:10:2db::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 09:28:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Tue, 11 Oct 2022
 09:28:07 +0000
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
X-Inumbo-ID: 04aadb1d-4947-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JX2G5Hrb2e11gb0n9RjKB/eO0dJZ9bcxjCF5cxm4Ird0YYOCbqiAxoYhpyiqkK5wTO+n1YPB2TNQWRHAcaKkEK8e8KsUGW6yht5X+e0DsX6K9houVgplIxBTBnfEvKu9Lp6w22MuT4hbx5iUX0wBg+IavGhG7GrH2/Rzsnxz7mRYcCo0sSpqDC7ibiraCHBMXuswatUks1TJlYiEu9WC4aqsIImyFvXjgDCx+WVemaa5pU8HBpSCKi4ySOHtpr0wU/2OZ8l8SEwFBKlq7TO8KZwq8O74RpLjTRscAFRwC56QNJrj2yap0RiKK8kwtwK/eOd+cm35gm4bimS8LKfJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PYxNmAx/0BwYebHPv3JpL7U0cAtJcGFRrWrDqUDEgM=;
 b=VuFP6tLulfhs1qWbX0vFoqctto7bGA60L95pNo1Soik8V8qV+/dGmke7sPL2+9zhzk4H0kSkRmqY9IiFPR54kqsKI5B3AgQ05mtEdlf204/+d3H+0mKyBBIOvS6CwLuzCR1GdTYsBgBaTtn/TH5KD1a4onQ/vIYdux//Ne7MUSqjD2ok8HLJDc+qRcQpY4++gLc/vbiqMYhjrfdKyI07L5AGMhgQXw/ZdaBtg4gmbrPBa908XrRe04ueJ4Newuga6m3T9pveDGtZbNZHSobwjkM/KGFVBqPk9ex47gFtaq5SR/bgWmEelceC7if2aObO0YHm+i7Pk7V5LT2PWlhqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PYxNmAx/0BwYebHPv3JpL7U0cAtJcGFRrWrDqUDEgM=;
 b=M7L1v1bU4IF5cflTe8t3yoqdvBAitbhegc7zYgqNxfp/oa1pzX+2JCkJdngrQe/6ieQm/xE3UyRH44NkszGaSXB0yjzXo1AE2cpojyGd0JrDij+HfAqOF8s4zF3pzeOO+j1JF+T3DZlHabctACLUMKmoxPHWnAKcsI4Iupr1iq52OmLF/yU5EbbWgp1gj1B/0KxwU1H8fheZtztoZbIKQdoZoiFHIjUKr80xT6X7Vj/tkUrDY4ZlfVbqbOge+qRtyim2J/WS/j5WduaASMe67YCrQWbdIJteXYJ96PjTNhqMpncnoZiIDOuMCuRYnFTVSxDUuNNhe3Yqu65qg1baZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f9cd7b84-6f51-d797-cd2a-b9c9bc62b0f6@suse.com>
Date: Tue, 11 Oct 2022 11:28:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Christopher Clark <christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Argo: don't obtain excess page references
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a361519-4bca-4f63-8d30-08daab6ae82c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vBcIoCKTGwE5HdmxX5WKpY6oCoBs+8PoS3SKivkogH3Vu/8T4gcufYxL1Ik82g/6JTYQPvuNAqJ2/meN59fGdkm5N8rrote1Xfwm9lH8hRFQ9G9zQPPsCFYcPkoS3pTnImQVvQJet+MpWCqSjdE/M+RLXnDexBCICB74UKBiO/WzKPN6YOBL+BGQp+BU4MrCCIQ2FYIjmyS3an0WlQoIFF5stgGhwR48Pwv7mGPYRW6B+uQAYYgQpMn5KALo+VE1KQFPJLaTC3F3+WM+J8g8yqMMR7l2Hf05QZcqZ/SnXo/2+e2UZfur4AF1EckcjaTLydBej6h2RqsBf5AnxXYoXlvbb6AW/vI1RPk7pFvu/jpDgi0KW8g85Ug4ug4rTlBkkcrD84+6ny3EABNot45z1vr1e7mMP5xhskKIcY1fO6tSc+BV7VlYd6qAnoD3Z4y9dVXNbOuNyZ/wu9pN74ZSIBouLtD9VszdraSjlilJzxHB8eGM8OGo6ix8xoqbRK/qajfP51xzChAXNVPoZwCTOvtg2wBDoLw4F6hK+uXpDnQzYJjqK/9jVtFnmxTdQFYu1wI5V90fCXQrzEXsak3F6EQ99IaL9LoHAt2FSNufJQxr8cHd2dNH/5EHSMaAADTkUYT/NrYuCyosOZWeKfrr3TEZk3WpIw3BN1FcVMBOclUrnD4f3Umx+mPhAk9tkGHveNO+NXCRV3uAuC+x0uQl9zO3SnR0M/fDdwOWr0GbAbN2KKG2qLnJ6QkZDv/YhUSIaJgMSnw5I7yGZBf2X7qVlieyPxiu1S7wGknufgolIa8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199015)(2906002)(31686004)(6916009)(4326008)(316002)(4744005)(86362001)(66946007)(8676002)(66556008)(66476007)(5660300002)(31696002)(36756003)(41300700001)(8936002)(478600001)(83380400001)(6512007)(2616005)(6506007)(6486002)(38100700002)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGd2WUFnTDhuRzdqWHAxS2h0WU51Rm53K1ROMFB4RjNJNGs5RSs4QmxLeU1O?=
 =?utf-8?B?ZE1VWmJrVjhRaEQwMitsOUVpZk9BOVQwNlhGb2NERUdoZVRGaTNVZ0ZRQXg5?=
 =?utf-8?B?dWxpbjJRcDFsZGxlMVU5RDdQb2Q1bVVXZ3FtWXltRjh1VHRiVXI1Z0FDTGl6?=
 =?utf-8?B?UzVESU9SOWR5VTgvTTlKRGJmVHY4b0ZadXQwbG5EVFJvVHJ2MStia0xzcG5w?=
 =?utf-8?B?WjdxcS9ldUdPTnRFclM0aHkzOFVkcVdzTTJmSWkyb1k5L2hJOUFPWnR2MURs?=
 =?utf-8?B?bW5TMlpmZjBBRFJTcDNSdEdXc1ROc2NLbkNGcEVaclhBUXhDdkhqaEk4SFpw?=
 =?utf-8?B?cmJwTzdoV21wYllVa1YzclpKQ1JKS2RLWHl0QkNDWVo2RjRGeTg0TUJlRFQy?=
 =?utf-8?B?VEJxZHJwTTc2QjlpcHpMNmlqaGN2NjhjeVVFYmh0RTdSNlZNdHFRM1RycmpB?=
 =?utf-8?B?eS81OFoyT1NaYzVmb21ZOUpaS1NkWHZkV0hwSlJGZ0RRR0tOdk9hOFZGcG1z?=
 =?utf-8?B?NUcydkhnUU9pMTYvQkVEV3p2SkZKT2VwUWZ5dzhsQ3RyMDNsU1FNMzZ1TUY5?=
 =?utf-8?B?V3RHVmNTdXlETGV3SllqeitZYnJlSlBKQmtCeEpoTkloWnMxZnRWaEtxektO?=
 =?utf-8?B?UkdMeVRLRGhVUU00ZER0bE9mc1ljcGRPMEp5ZWNJUko1cmxHYlRYY3o3K0kv?=
 =?utf-8?B?b01uUjNEdEZOM1V6SGRXQno5WExPWWJOd0pHK3E5cXA5bVNHWFNoN3FuNi8y?=
 =?utf-8?B?N1c3VE01UWhpNU84R2J4Smt2Rm1oeHMyR3JidS9hZkxKMEdOeStxY0V0d1Ry?=
 =?utf-8?B?L08xU0FXd0o4ZDE4ZTZ0R0c4NmhPcHVWNzl4VWhacHJ0MzcyU3pmODd1VGVh?=
 =?utf-8?B?RndHQUR0amdyS1hzc0JTeVFXSjdYc1lPYXlZSDhEcnZpdWtnY1JNaS9RNjdX?=
 =?utf-8?B?MU40TUlsVFd1eUVsSDdHK01Ic2tLZWRaQTdhbEZsNEQvMmdudmdkMkp0aUNh?=
 =?utf-8?B?NUczQjR1NXN2cTcwc1ZUM0FabmNyMDhDNTk3TzdmdDlUSVZzZW1WZVBNWDZF?=
 =?utf-8?B?N3hjTWVBZk9Gc0ZJeUp4THdOQ2Q5bDV0WjlqVnNmc2FxVmRIRmR4RFFLMWlG?=
 =?utf-8?B?Tmo2NlVXTE41OGc3MEdveWs5SjkvSS8wWEN6VmRTSjBJMENBWDBaNk9TaG9K?=
 =?utf-8?B?YWp5NlNJMVJKb0ZhYm43QnFGZ3BBbVBIdmtVS2FYbUNlemxRM3hCTjBkQ3RG?=
 =?utf-8?B?WTdLQlFKbWZzbmEvOFNVSmNyanA0dUFkTnArRkIwQWZHWjUyVHlmVE83OVI3?=
 =?utf-8?B?RzcydlVBRUxSMGc2cFIvV1B6R214YUNpZTkycVlDN3FYMG5XOW4wUXZmcUts?=
 =?utf-8?B?S0FvcWZpQmhyZUNxc1liZ01CWDFLNnoyYjhWVjB5OVRGWUVLcEoyT2k0R0xX?=
 =?utf-8?B?eEFqNkZwVGtmclRVRk0yS2VXUG42b2dnUmhZTk5nak40K2VhTEZqcHVBckxV?=
 =?utf-8?B?OHFTRFNpRFRqalIxZ2VNR0daQkhyL2FxNzFzY2ZSS21mTHd2cXNEeWtMOUNz?=
 =?utf-8?B?ZGROZHpTNElJcjV1bm43ZzRyai9CazBuMXdDdHFCSU8rZmlHVFE2b1dnZUZV?=
 =?utf-8?B?bzNVajEyNk1iSUhYcjRBRWU5RjVXdHhweHZCbWlKUGRKQ21KWE1CUVVxVStN?=
 =?utf-8?B?eUt1VUxhTzZ0ZXZzRE50Y2tMWGNqNC92ankzRHJCWE5tall1YWVIdmI3b2dS?=
 =?utf-8?B?cVB3QW5TTjhScDZQckU5RDVTU2pReVg1anUwQzlLV0Q3MFNja3JyZU1jU2F3?=
 =?utf-8?B?YlVHYUt5QTVwakxHWEVSeUNGaDY4a0x5a2RlbndFZ1NMUkp1cjBqL0wzc3Jt?=
 =?utf-8?B?OWFUTXVDS1hQTDgwVTV4YVo4d2ROMjJRMVJwZjlKaDM2VW1NRm1OdGFuZFpi?=
 =?utf-8?B?YjFybmJBWER4dkVwOHJXZ3ZGd0dudEJEaVBhU1JrbVVLTzcveXZsUzBXL0ZQ?=
 =?utf-8?B?TjhxdWtzdFM2T2FLby9jQU9BUDFVTWdTZ1MxUkpSSU5hNFQzRGJjcjJweFlK?=
 =?utf-8?B?QXEzTEZDQ0pxajFnQzhlZEVVeG9wMS90YUdFMm1EaVVNdHZEVjd4WWxQVzRI?=
 =?utf-8?Q?nkJpTO/gyPKq3zuA9W8Y9yglb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a361519-4bca-4f63-8d30-08daab6ae82c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 09:28:07.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8YJusw+Re1ZhEeh4VNi0RxzQjo+/4S1E2wIa4D/vYJvKVhChUSdLnvemkY4uBgSPmcmezZYeUv8T9srLGUgDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8600

find_ring_mfn() already holds a page reference when trying to obtain a
writable type reference. We shouldn't make assumptions on the general
reference count limit being effectively "infinity". Obtain merely a type
ref, re-using the general ref by only dropping the previously acquired
one in the case of an error.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I further question the log-dirty check there: The present P2M type of a
page doesn't really matter for writing to the page (plus it's stale by
the time it is looked at). Instead I think every write to such a page
needs to be accompanied by a call to paging_mark_dirty().

--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -1429,10 +1429,11 @@ find_ring_mfn(struct domain *d, gfn_t gf
         ret = -EAGAIN;
 #endif
     else if ( (p2mt != p2m_ram_rw) ||
-              !get_page_and_type(page, d, PGT_writable_page) )
+              !get_page_type(page, PGT_writable_page) )
         ret = -EINVAL;
 
-    put_page(page);
+    if ( unlikely(ret) )
+        put_page(page);
 
     return ret;
 }

