Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CBA464BBC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 11:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235827.409056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMxw-0005dS-IO; Wed, 01 Dec 2021 10:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235827.409056; Wed, 01 Dec 2021 10:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMxw-0005Zz-EN; Wed, 01 Dec 2021 10:35:56 +0000
Received: by outflank-mailman (input) for mailman id 235827;
 Wed, 01 Dec 2021 10:35:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msMxu-0005X7-Lt
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 10:35:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9a7d901-5290-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 11:24:49 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-mkJGIjbpMD-sFYYK3mHWcw-1; Wed, 01 Dec 2021 11:35:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 10:35:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 10:35:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:20b:313::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 10:35:51 +0000
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
X-Inumbo-ID: e9a7d901-5290-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638354953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lk+/9fya1n2KyjR1glsL0wj+Ac+2/Uh8SxxK2MJO7+4=;
	b=TiN8ZcuMbhBOr6meY1a31W81qmCLESPFAAC1I//VeTJeOJS1ARgODXMhIplZQWnfIgIP/F
	kLDkVn2Yxp+CsETNL/UxWyzoby4WHK7U1RvYbD01WzcSuAxHycvSIrzIHCHpYIgf0mJGb1
	CMBIDDRNCb4c+qQfZGMx/4jpx0YYWO4=
X-MC-Unique: mkJGIjbpMD-sFYYK3mHWcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bK5FQEU88RmTl0NQnZxRvlZAo6TZgOlskGJtXykRu9mYgbQ2NrqXcjaYS74vGC8wPfCI3HeeM5/XumbTTNmvKo3g6j7hhgrUL+sVJqgUwqd3lnirSnJvY2PozjLXZRasmIiseJkDB3GhiilwyNCTc97cnaOaf0yoMo/mUBqHnP8EzDRBdS02ahR3veidEtukna+u0ch4BsUTDqgJfzmKm3roeguuCfBRv3ptuiy0rCrehuWeG61TDDyl6Wb32WaQD9igMET0sPuuxSR8Fi32krqSuLkr1+XOR63MKRUMLeFT3CcF4f4OSe9u9+W7pdeih8orGq0OyeMCUgBtoBIaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lk+/9fya1n2KyjR1glsL0wj+Ac+2/Uh8SxxK2MJO7+4=;
 b=Se8QePMsIA3QrRhyTw9mUk9hsm7/GHlCOaQCs4PU0wFZVmlMp0BPaPy/rT62M8QInOT1VwH768yylkJ3Y1vZRf2jJxcgeL+9T5gKTOOsoCSShdoCLr7ybUq56EzfOCHdwzMq1OC0a09AZutXz5QlA6bLM+1sNCpLk06HoMH6Wj9ygMk9rkFfJrv/1e3FsCht4xq1iWRcO6v9Hk+6nFCMrS2u9tPVgtdvr0Wr7uycyyKN/7rnhFnaJJGFKg+uXGlzwP98t57/6Petc8kvXsNpmUq9tJyEYRI6vVPnxO0HZLqiMi8Uv1yFMCzsib+sTajMUO2OF9bgY5AwRmpr1WgIAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5070cbe-949a-4913-1f99-7b7a4e6c5536@suse.com>
Date: Wed, 1 Dec 2021 11:35:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 2/2] x86/paging: tidy paging_mfn_is_dirty()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <69b75eb5-82fe-e075-146a-28a9758da433@suse.com>
In-Reply-To: <69b75eb5-82fe-e075-146a-28a9758da433@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0070.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bf2e2f1-9180-4260-7c21-08d9b4b658ce
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43815C2FA69BCD8C3F7A62D9B3689@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ToGUhcd5K0UZG3hOUr755e8QE0bIu8UkvWBrAbgxNTPECfTQKnEkXjB8AkUXc2JtE0nFMgqs7CASwixgKTPQ7bDzN69PiJe0b/Y+J6NPTaHwe4HGACq5lWmvy9wDB5YEujECpriJbJLWmWPjeFTlTELy61rmUZmy85jqR1TZ9nwq/N0QYvEWyz4DF+ahPHpFonzDkk/PkJLzyXcA6VksNlNd+y7JyEzXNUofPn1TYsspeYtFbpeAuWozzRKru04WFaHqXkpD1PYkdWSSnjUu8bDSsG8Tr5CvuVEaqXYuIMZbpaalPI4ztZRcoYDRFZRdNIb7KzHU9dwdEQdVbSbUta2xZhmHhqHNK2eTZ1nE46GstuBJdCiP55Jl8oJZJZXrDi1B9g+2P66NS95IazOijDeCVyhQ12mtGzx1NloQdqPeM4gBcfk5QwdIz1R79ZbOBsgb1JiSQ2wRa57c4GSzsRLMqZaGO7VbWmSn6wUHJFYrtGoC3WFjbih9KFyOLqyIHJ3n16WfTXG/TipN/1qnELZs7qf8gZaHrLeF1aK8GN6NhPE2oUmMkjl3+1fDQjsZC44zrQhp2BUadQt4/Nm6iM7IstFgvVJKVRUtTjre7IsmX4TUczluXn3MRf4lF9edb/i6IVdAQKCQ1JAdc69NRAu8R80XJVpY+gYG4XgJbVMXCUdqirJuNHaF8C440GNcwqw3/fG59d764N+q6kHnjg8QriDe2DAjeurvRadzCB7XeOOUAY1FgPtInHxWFBS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(36756003)(66946007)(66476007)(66556008)(956004)(186003)(6486002)(508600001)(31686004)(8936002)(54906003)(86362001)(31696002)(316002)(16576012)(5660300002)(6916009)(83380400001)(2906002)(4326008)(38100700002)(2616005)(8676002)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWk4c1lkLzBYbXRYSWQweTZuSUVzU2V4OW9jMVhtOFhWOHl5bmNPaDFZWGYr?=
 =?utf-8?B?SFVGOGFLSGFUd1BFSEZabExuR2ZDb05qSU53YjF1ZG5lMzJQZ3ZTWi9DYVVq?=
 =?utf-8?B?VUt1V3dYRUhKSVFtUXNXVjRXMnFXWUZnYytjTFhuRmErVU9tclVTK05YODFD?=
 =?utf-8?B?WXBIS1ozb3ZnRS9qL3BsN0c3ZXgyZ2Y3NDE1aFIzaU5EelZlTVd1cXFacFU2?=
 =?utf-8?B?Yzh6aG1IUkNLOCsyR1BiQVJzcVQzVTVUWjFRTmp4eEwyYmRTS3VzeE5uWFdL?=
 =?utf-8?B?czBJOG0yNWZNMUs2SGVMZ1RycXNMNVNzc0w1L1JVVDRma2lQQzZkZ2RlbktN?=
 =?utf-8?B?N1BmR1lMbUJ2MXhZTHpkcEx5OXZ0OWZ3NjBOcXd5YTNrdTZEU2Q5TEQ0cEw4?=
 =?utf-8?B?eDBpS3BqTnRaNENSVnNZSGtBVmhOUGlqbENJTDVkMTlidm1rdW0rSFRuK3RM?=
 =?utf-8?B?N2xRcG4xS05iQk5Ra3ZJYUUyVmg0ZXFQb0NFL2tXSmZVa1ZUNm9WYzJFcHoy?=
 =?utf-8?B?alE2bTJUM04vK1hpU0N2OGVYbDVDR2dlOU9wMEFxVUYwVlQwYUR0SExzUFor?=
 =?utf-8?B?dmxjbjNQdGpSa0F5VXJpZXEwTHhtc25OODRqOHU1RWdjL3lsM2FtZTNudC9M?=
 =?utf-8?B?V2QrY1ZhQzNVVXYvVFVCZUZQZGRwSkt6VVNnaGNndzZNSzhtbVAzTVQ4Zm8z?=
 =?utf-8?B?UGVmcVpYOUtEOHkzK0RHSCtrRC85WnhScFdGSGtvazRaS2NXSHhEakZQM0pJ?=
 =?utf-8?B?cG12QTJ3WHZVOTk4M3ErZWgxMFBnM3k5QnVjRjdXVXhMcTJZN3BoazVxeFQw?=
 =?utf-8?B?LzVGa1RJa3VVd1huU3hrT0VQYlMyTy80ajE1NGV0ZTJYbkdzTXp0M2FQaXRS?=
 =?utf-8?B?aHJQd0hDbXI0Q001UW9wVXdablNyWkNZT3B1OE5tQk9XWFZGYU84YlBYclkx?=
 =?utf-8?B?eDJJUlFBRkQ4eitMOWVXKzMwUk16Y0k4bGdRNG1GYlJ1MWdxVzV3U2ZYWC9S?=
 =?utf-8?B?U2pNQkVoQklMWktWZCtUVkoxRmN6NFgwdXBOVjluekFKdkNtWXBrczZtMUV0?=
 =?utf-8?B?NXpWOE5JOHJSTDNlL0UzMm5XY1ZaUDRURjhWREhPRjZSak9Qb1JPbHhXckVB?=
 =?utf-8?B?YzBOOEtNZ0VKTWlCODg2MHJLa1hGbEF5ZlFWb0JRV1Z0V2ZLa3JycUl5RVU1?=
 =?utf-8?B?bzYvOEp6dWVPT3VoYzBQMFFqWUlMSnI3MStlNmJRY2orUFcvbGdhMnplUG9E?=
 =?utf-8?B?YnRQenZZekN5RFZFVjlEOFhGVE44cis4OXV3Q2FVRkVJTm5OZEZsVTlmM3ZD?=
 =?utf-8?B?dXBXQWhQSnhLelhxWmNITE9WZXNQa3lxS2hXeGRvbnVFVkRnS0N2TXYwSmpr?=
 =?utf-8?B?NFhFKzh5ZTRXSURDNEtFbVNqVTZJc0JyRGNGZVE3Skw0dmJsU1A5QTlqazVB?=
 =?utf-8?B?c0wzakNJZ2lFbmhwUWwwTWlNV2xzTm5XTTloaGY5U3U1b0FGN01YeVVMWVBN?=
 =?utf-8?B?VWVYUUtQcW9BUTJHYUJVOGtVQ3BQM05ucVBEcGFHQTRvUEY3eXVoS2xZZm1X?=
 =?utf-8?B?UnlwRkdRbHorU3l3enFpVjcrVHB5a3E1Z1Q4a0FSSFkrYjRqeE5KNkkvSlNv?=
 =?utf-8?B?aXlTdTZJMXZiVTdHd0d2cTAyeHV4Ry9JajNPelhCWjg2T0ZoaXRNekVwWjhO?=
 =?utf-8?B?eElwSHZ6Wkc0b2czVnlhTnlDem9CblJNdkUxTG14aGZCd2hxUUI0N2dGdWpR?=
 =?utf-8?B?S1Zvc1B4VVpQTk5Ma1J2TGJESGNJNXhZVUl1dUdHUVdFM0tLVE1MUXVSR2x4?=
 =?utf-8?B?cEJhcW1Ub0xoRmRNTlVlUVJkbHdUL1VZQXhYSDkydURlWTdiN29KTDBSaUlh?=
 =?utf-8?B?aWExSlhzR0U4UzJIVnBuSUNmVEwwSE9DZG91aGN3MFVHWGc4UEN6TlF4L0Yr?=
 =?utf-8?B?c0ppZGhCeWlBV2pqUW9zVlFJUXFsK0xMZ0djdVJvMGhSL3pySjdsUzd0eE5l?=
 =?utf-8?B?VmVIRFY0QUhMUk5hVDBnckNyc29GMmc2cEZqUDJBUStrMnRqaXBpOFFZR0R3?=
 =?utf-8?B?K0hqdXNIQ3dsRHVYQ2RrNjdSVllaZGlhZnJ5YlA0RWdHbEpPeVhjb3VROUFl?=
 =?utf-8?B?dk10MUNHZk5BM3NKWTM0TzJSZ3ZINS9OZzA2eHd1ZEEzQXB0ejhtdStTanQ2?=
 =?utf-8?Q?nwE55+fyXx73SsMh8nv040k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf2e2f1-9180-4260-7c21-08d9b4b658ce
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 10:35:51.8159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IXVz/ZKscc6BTFgV34g5lLg4Npb2CBpdGn8RCYv4kI0ed/02Aql3oz8oFkmgdUB3ttEqTImXplr7403eQwnlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

The function returning a boolean indicator, make it return bool. Also
constify its struct domain parameter, albeit requiring to also adjust
mm_locked_by_me(). Furthermore the function is used by shadow code only.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -40,7 +40,7 @@ static inline void mm_lock_init(mm_lock_
     l->unlock_level = 0;
 }
 
-static inline int mm_locked_by_me(mm_lock_t *l)
+static inline int mm_locked_by_me(const mm_lock_t *l)
 {
     return (l->lock.recurse_cpu == current->processor);
 }
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -351,14 +351,14 @@ void paging_mark_dirty(struct domain *d,
     paging_mark_pfn_dirty(d, pfn);
 }
 
-
+#ifdef CONFIG_SHADOW_PAGING
 /* Is this guest page dirty? */
-int paging_mfn_is_dirty(struct domain *d, mfn_t gmfn)
+bool paging_mfn_is_dirty(const struct domain *d, mfn_t gmfn)
 {
     pfn_t pfn;
     mfn_t mfn, *l4, *l3, *l2;
     unsigned long *l1;
-    int rv;
+    bool dirty;
 
     ASSERT(paging_locked_by_me(d));
     ASSERT(paging_mode_log_dirty(d));
@@ -367,36 +367,37 @@ int paging_mfn_is_dirty(struct domain *d
     pfn = _pfn(get_gpfn_from_mfn(mfn_x(gmfn)));
     /* Invalid pages can't be dirty. */
     if ( unlikely(!VALID_M2P(pfn_x(pfn))) )
-        return 0;
+        return false;
 
     mfn = d->arch.paging.log_dirty.top;
     if ( !mfn_valid(mfn) )
-        return 0;
+        return false;
 
     l4 = map_domain_page(mfn);
     mfn = l4[L4_LOGDIRTY_IDX(pfn)];
     unmap_domain_page(l4);
     if ( !mfn_valid(mfn) )
-        return 0;
+        return false;
 
     l3 = map_domain_page(mfn);
     mfn = l3[L3_LOGDIRTY_IDX(pfn)];
     unmap_domain_page(l3);
     if ( !mfn_valid(mfn) )
-        return 0;
+        return false;
 
     l2 = map_domain_page(mfn);
     mfn = l2[L2_LOGDIRTY_IDX(pfn)];
     unmap_domain_page(l2);
     if ( !mfn_valid(mfn) )
-        return 0;
+        return false;
 
     l1 = map_domain_page(mfn);
-    rv = test_bit(L1_LOGDIRTY_IDX(pfn), l1);
+    dirty = test_bit(L1_LOGDIRTY_IDX(pfn), l1);
     unmap_domain_page(l1);
-    return rv;
-}
 
+    return dirty;
+}
+#endif
 
 /* Read a domain's log-dirty bitmap and stats.  If the operation is a CLEAN,
  * clear the bitmap and stats as well. */
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -173,7 +173,7 @@ void paging_mark_pfn_dirty(struct domain
 
 /* is this guest page dirty? 
  * This is called from inside paging code, with the paging lock held. */
-int paging_mfn_is_dirty(struct domain *d, mfn_t gmfn);
+bool paging_mfn_is_dirty(const struct domain *d, mfn_t gmfn);
 
 /*
  * Log-dirty radix tree indexing:


