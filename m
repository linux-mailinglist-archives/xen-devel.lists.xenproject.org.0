Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB784C0FE6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 11:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277261.473699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nModR-0005eJ-Og; Wed, 23 Feb 2022 10:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277261.473699; Wed, 23 Feb 2022 10:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nModR-0005bL-KI; Wed, 23 Feb 2022 10:12:37 +0000
Received: by outflank-mailman (input) for mailman id 277261;
 Wed, 23 Feb 2022 10:12:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nModQ-0005b9-6s
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 10:12:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eb8cc47-9491-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 11:12:35 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-edIydqH7MR2OtKPIzJmdsg-1; Wed, 23 Feb 2022 11:12:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR04MB3004.eurprd04.prod.outlook.com (2603:10a6:7:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 10:12:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 10:12:32 +0000
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
X-Inumbo-ID: 1eb8cc47-9491-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645611154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LI5XIykVTVe8uWmfaLRy4nPxEkgSqXOP7UAzhSepRo8=;
	b=bv1yK9+Ekcbop+xlAZ63wz3H3kdBRWjYJlKb88NCJS1gdGJvZDTwBPusYRH3/GsbyN+Gbi
	tEqJNjp+4wu0HEwuqS5W5tbvHxoEZVRs0UF6f1hZI80vQJ0Z3syNDMnTUlNepa/XYYjFNX
	TSmUgB+mOZ7IIrazcFI4Tx/hbh3HlN4=
X-MC-Unique: edIydqH7MR2OtKPIzJmdsg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8cJ3SunquUDnonYw6Ockk+aAATSSc52wp8pvvENqGSgjOVd73W0ccfD2SdVpEEZXJ+IQW10oscfLJmMK41kiFVxbQa+im+x7iLjHjUd2izuQ6O9Kjc5Tyk25MGf9JEElKFJAsg/xj0j4EHuOJ8XGNs+2mzKIJeztzdGYCoRWKn0jRJDql+8nZbdEnjteGnFGwIIcltlwkGj/RfGG0RZJRkbU1ofCJ6XRBSDdYLVf6v9MsTmz6yR6ZF51sBWzuVx/Joz3Dgs0k/OQbaLgKqgtJ+9zLDk2gKxR64Ha0RopRAe9da+kU+28ebcb9vWB4JtKIXTiadZATVoQKwZR6efIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI5XIykVTVe8uWmfaLRy4nPxEkgSqXOP7UAzhSepRo8=;
 b=MQfWo27d7mIgjjnQGS7Z25Qy6FxRjutcbfQLnL2d2TcexSI0PjmJ6mXhirglBBrd68rDlpCoL8Kv9rpZFeDv0gnNhMk3FHN7hGCRxL+ZZ8UhtxqPDf84wigBf5/fJDIjS0gim8i1KQxe7sxAgWzgK6MY6uw3vqAeDlx32qnwvaWc4JxODpo+tRrNmdJG5eX4yPi06p6MaiciIfPneNSlQWy5mv/lma7jaxBxpe8kADGSp1FpZ6F6ub3HLJC2FskxXIcLCgYFVpQKe0r0qEWchFZrktD6vbuJtYvOUdCaB8xNOygSW50JIC85qByucb4yIl0fYQ3D4kmq3q2aMILLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96f493ee-a360-ce46-7a61-5f55ca436295@suse.com>
Date: Wed, 23 Feb 2022 11:12:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 1/3] x86: drop NOP_DS_PREFIX
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
In-Reply-To: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0002.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfe5c7f8-e711-4ede-e782-08d9f6b5011a
X-MS-TrafficTypeDiagnostic: HE1PR04MB3004:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB3004CCA75603E11F10FB0EC3B33C9@HE1PR04MB3004.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nJ+6sQlvvNzyDeK2OqB4mBbs6UNNm/RXXDSt1Xwe5XOZ9biLHxAxkUy1Uv/02mevbUaE4AJjnr/s9U3iNM7/JBvOIL8FwTfAXDiyebn6ef7JXVQBsuG0vd/+rMnICktG4GrlQBxTfIPJ6XGyoeWCLVK4c5chvLYENKnUHQROESaTNbQS4xUS5HCCK0FwbbuQbbv05cNXDMJEo7pNMBG6eiFRC2ECq79Bx+XLeTzcOLLjxH6pVtCPlNYBgQKt29soQo6ej2Wkgm2OuZleZ9nPybCtrY1av7m8C4ehLR169d1myCLwgXbARgeHqWov+cGn3ZkWKvt935AgHvSa95qsbkDlM5uvNUd792pqn1WlGKiZ/o/5vK2i+8xFTT2RxtcwAFBauv6QgTkoCqzMBST0F6+Vf97Y6ZuqkpLjI3BERvkU4Et4HodIeytgy2jEmbt9GiAFIm3M0BdxJkEbE2/Ym6AYRkMxEA7ri+zZP7jd3Hl9l0/ZRPjf2G0Q0HPY6+0zv/q4CpZZJiN3K0NM4NwSzmGtsajLMcH7hoxHfkYsvKoNiynx9vz78hhuTGor7ypMwoZdo1r6A6tnin5DG/LklcOVgG505ntQ3cp06AKwCvvZkZ4ot1+YQziEnXSBkaYw661uEgDczJuQf5AnxX6GB6rhJiI1yG81xME7M5iJytv97xgElOSqORaQoX5kfIv7zbmKsgRqiwWbM2eqHxJXo5OEXNWLM6WKNS0IEWujGR1/xIHdNDivuHXoE4BQpUia
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(54906003)(8676002)(6916009)(508600001)(38100700002)(2906002)(2616005)(86362001)(5660300002)(186003)(26005)(31696002)(4326008)(66476007)(66556008)(66946007)(6512007)(6506007)(6666004)(31686004)(6486002)(36756003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFZlVkxpZ2xHeXpreVo2b2VSTGRGbGNMQVhvYy9HQjA2ejlBaWhtOEh6NkNS?=
 =?utf-8?B?Q2FXYVV2bDBkaWhnSzB6Y0RLaFdWdXgvb0ZGSDB4SXdiZDBSdWtGeG84UjNE?=
 =?utf-8?B?RVluWHBWbUNFVmtsMjgzV21JNzVQT1dadG82TFRiMVgwQ1ZUS1pKc2hYcG9B?=
 =?utf-8?B?TUkyeUl5MHN6T05tdTRjQjVyRjhOb0FCS0d6b1J3RTZ4L01hUUtpb0NqbUhL?=
 =?utf-8?B?RlhicEZxb0JPb0xIN2dOaGNvSE1XMEMrZlA1ZDJ6WlR2dENnR0tWeFNpcExD?=
 =?utf-8?B?cktLdGlqVERwV3d5azBKL2c5eFVWOVMzSGQ5RHVmdjFvUmkvNmpScmNUdUM5?=
 =?utf-8?B?L2tLUWd5cWh4NTEvazBIU2V3eDg0bXNmZTRld0R6T05GSE1aejIrOUQzeDlj?=
 =?utf-8?B?Sk9IMWJlazdjak8vTmZjMzFRRHNuSVQ4RWVGS0xGUG1JT1cwQXFPTFVQNjNv?=
 =?utf-8?B?alArMnl3KzFwUTEvQWFZMlJoUVQ2aE4zdHQzODFiZ2VscFBmYU9iTzlzWFY2?=
 =?utf-8?B?WUdCQmVJeVVGcnp1bnc4Z2VTejJOQ1B2ZDVEVmxZV3preHI3ejhGS0FHdDEv?=
 =?utf-8?B?RFlyUVovUGF6YWFBWXBhNlZmMTVyZEd6TWRZY0JSQWk5SVVhZzRHTzZUVkZC?=
 =?utf-8?B?MFpnLzM2MVB1U3FEbDZwY0JUN1hENnhNcFp3dGZvNFdBbm1NRHBvQ2NRRm45?=
 =?utf-8?B?T3ozKzJ6WS9RaVpuZlN3a3Q2Y2g2cFA4ZE5YVFc2WU9RSnFrNlFxbGEycDZ1?=
 =?utf-8?B?V0p2cXM2Tnd5bnVCNTVKSVlqR1JUZDNvdEtSQWY4WlpiM00zMnFyM3NhK0dR?=
 =?utf-8?B?dnpVTEZPMWM5c3diZnlxNWcrM0xYU3J6S013QXE4NHE3TW5NYmcvckNrQ254?=
 =?utf-8?B?WFo1Y0lYM3dlbmF5MCtCV1EveUc1a1B0UmdQcWZoSXRCdGp0SWRKTlhyNElr?=
 =?utf-8?B?ZHMrZS9lNUgrMDZPTGcxUXJGTThEMWg1OE9TWGNTWGZ0c2kvMGFXeklXL0ZB?=
 =?utf-8?B?S2l4SGl3Uk5JNEVXVDU1K05wL1VLY2Z5eHp2T0oyNi9wRFR2WjBWK2hUclRS?=
 =?utf-8?B?c3FITTV3aHJhOXQzZG5NckpwZ3NsVlZRdU8yNFJhTlhJVTg0UERRbGdNR05i?=
 =?utf-8?B?Tld6K0s5UEVBRWw1SkU5TGZ2SjZyYWtJa2NEV3FtanRRRjdVRkhGUWhDVmNI?=
 =?utf-8?B?MHM4QTQ3aFQ0QTlvSDFha0Z4cFJkWXZlM0hpUG5xUDEzUFo1RGJHWHdRRmk1?=
 =?utf-8?B?Yk5ZR1YrRUJmV1ZsVGczdU9FTktWSkp1c29FTnloZ0RlM3R1bVRKcUdranNk?=
 =?utf-8?B?UGVCRU0vY0UwUFMzOHJrd1Ywb3pKaVdPbFFGZExvaEY4Vi9QZHpDVkY3TXNX?=
 =?utf-8?B?Yk9Fd3VjaENFT1RaOE5lOStrUmZGMTlHWmR4bENaN3ZwTVN1Y0k1ZzI2c0lF?=
 =?utf-8?B?dVZOb3pSU2E2Qml2UW9oZCtjTS9wYjgxUEpkZ0FhMjY5UG4zdnRDQWd5TkZo?=
 =?utf-8?B?Q01PdkNSMzExT0xFelYrUTdkUWRTUDE4OGhRYnlMODNsWWJacHRRM3MweEJO?=
 =?utf-8?B?MGpTdnpTMUtnRnZsR0pIdEpXUlluSE1VR2VRNjIrSXY0ditTalhCa3NQNWlM?=
 =?utf-8?B?cVd4TEVaQ3lCaTFsbHZrTzZFK05pNnpkRnJqUEhCcHNQSklrUWV6TDRUb2Ri?=
 =?utf-8?B?QVRsdU9Zb0tURFBrYVJPK1NJQTdKWEtjMHlmUGNST0NEN3ZpQ1RyQXdWVUJ2?=
 =?utf-8?B?OERnRjh5NDVmZ2ozcEcxRytKRVN0bHlDU3l1RUdHeWVGT3JNLytLSmRxbk0w?=
 =?utf-8?B?cHVxQ1p0RllSTGtMbnpHOWluRXBpSFI0TTFoNVhuYnFyeXB2MTJIdnpwajYr?=
 =?utf-8?B?SHQ4Z25ZaGF5MHVrejR5VHY0U1NjWkM3enVacUo1WDlUQTVqTEJ5TUlwcUlr?=
 =?utf-8?B?YlVLd082eFYxMWxQZ3lDM1F3M1Y1ekZ4V2FWRzlqVTMzcFZzdkxBT3lFSlFt?=
 =?utf-8?B?ZkYxd3EvaWtBQVIwaFdyZnB1NkxNblZLUHJpb3hONjFWQS92clhrV1V0WjV0?=
 =?utf-8?B?YnhpTEI1ekQvQkV1N24zRVZrTGpicmxFSFlvRXBURnAzdENkNHpWT1BMUnB6?=
 =?utf-8?B?R2NrWVRoMWY0eGxLUzNaMzA3Z2Jxak5CQ05ieG5uckRzZ2tTajI4cnc0Qk4r?=
 =?utf-8?Q?1ULUuIrNqVJt+X+I6d8yyDk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe5c7f8-e711-4ede-e782-08d9f6b5011a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 10:12:31.9720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hi36XRmL0zsmTTDijtBhNBLeIhmg+9KlJ7pPxnBqnMro7Z4pp0dKWd4ijLCMcrcgvX3LGEgMTlQ+UlixTv7Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3004

This wasn't really necessary to introduce: The binutils change
permitting use of standalone "ds" (and "cs") in 64-bit code predates
the minimum binutils version we support.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In fact we could patch _just_ the opcode prefix in flush_area_local().

--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -247,8 +247,7 @@ unsigned int flush_area_local(const void
         {
             alternative("", "sfence", X86_FEATURE_CLFLUSHOPT);
             for ( i = 0; i < sz; i += c->x86_clflush_size )
-                alternative_input(".byte " __stringify(NOP_DS_PREFIX) ";"
-                                  " clflush %0",
+                alternative_input("ds; clflush %0",
                                   "data16 clflush %0",      /* clflushopt */
                                   X86_FEATURE_CLFLUSHOPT,
                                   "m" (((const char *)va)[i]));
@@ -298,11 +297,11 @@ void cache_writeback(const void *addr, u
 # define INPUT(addr) "a" (addr), BASE_INPUT(addr)
 #endif
         /*
-         * Note regarding the use of NOP_DS_PREFIX: it's faster to do a clflush
+         * Note regarding the "ds" prefix use: it's faster to do a clflush
          * + prefix than a clflush + nop, and hence the prefix is added instead
          * of letting the alternative framework fill the gap by appending nops.
          */
-        alternative_io_2(".byte " __stringify(NOP_DS_PREFIX) "; clflush %[p]",
+        alternative_io_2("ds; clflush %[p]",
                          "data16 clflush %[p]", /* clflushopt */
                          X86_FEATURE_CLFLUSHOPT,
                          CLWB_ENCODING,
--- a/xen/arch/x86/include/asm/nops.h
+++ b/xen/arch/x86/include/asm/nops.h
@@ -5,8 +5,6 @@
  * Define nops for use with alternative().
  */
 
-#define NOP_DS_PREFIX 0x3e
-
 /*
  * Opteron 64bit nops
  * 1: nop


