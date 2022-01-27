Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5F449E50C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 15:48:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261504.452875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD64f-0004o6-Nv; Thu, 27 Jan 2022 14:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261504.452875; Thu, 27 Jan 2022 14:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD64f-0004mG-KY; Thu, 27 Jan 2022 14:48:33 +0000
Received: by outflank-mailman (input) for mailman id 261504;
 Thu, 27 Jan 2022 14:48:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD64d-00048y-VI
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 14:48:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31a6ca23-7f80-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 15:48:30 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-FYOqhvIEOheojccgRClpvw-1; Thu, 27 Jan 2022 15:48:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4887.eurprd04.prod.outlook.com (2603:10a6:20b:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 14:48:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 14:48:28 +0000
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
X-Inumbo-ID: 31a6ca23-7f80-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643294910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9uRmQeQ2GIyo2OW1VQw24UUZo9Bo39U2yqak3SzTI9o=;
	b=fQCcnO0Logkpo3J7KwRkGmJ4AYW7R3uc8rd10P6/+qZ2hbCAVAfpNaPw1921/0O08oQ41u
	S0OqYmv3IkvO2Zl82d+8lTvOFTtFUlZKEe9Uoo7bhdm9Frcs5qcQhq4sf8UkJXgXsyFDf3
	K1oXsat81n96pmttHwg587fzolzt0JU=
X-MC-Unique: FYOqhvIEOheojccgRClpvw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iaf2ZAEFiph+lboTFgT+gQj387kmVuAt6F1xsUZrzsUYxupz+2c8jmeSs9nYwMNIrCDXpeetjQyc1ZeYmCFX8Rf1JeAq3Jf1J/0q2VUBbsTFolvTSR024Ez98XSXl3JynoNcWxkkz+J/P1lDpGU1Zd+tlQuUXi/yH4TN6w3EAIMR4p+IsORYaHNivg1ufQdmXmwLL00gjl5pt6UUEzuQwrCDf3NAbpRNgnmDSuw5OrikmiPPEXDOg+GhYrtT4+3N0kA/kwj7r0b+jMIx9DSPxFpzkPSizSYpTVf4X6sfZmDhqlINvy/KzTPpjt4dAWPYfiVgGZw79l33dHcxv46Bog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uRmQeQ2GIyo2OW1VQw24UUZo9Bo39U2yqak3SzTI9o=;
 b=B2QbSkVWPjNwseaykb2WLX+lrl7PXgLs65Ed+OJGBECu7hAhiZwBXd31dxw4DAR9aWDpbRjuoBV5bQiJwn6OfON+jW7U2eDXvfzKHA/XNusD55I9sLp9sVA0QkyxeHZ1OjcixkaV+G/Z0Ojz+QHyRcZ2WY6qaWfQOa2VXz+/QsyTnyQiGXEwH/b20cbxqag/TlUtIcTw36byd+wS9KZcbg3YbNoyxL3zAzwtkS0lT4oQcN3lzJrFTssJAtH6FPONBD/wEZLM9HsvNfsR9HJPyNafwhELsEhraYjDUwBO4qn7KRt9ES061jYX02lPmg/ifK3DU7x8VsBSolkfdZ1SlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54c4539f-0bed-c42d-aa8e-4e31c45c4245@suse.com>
Date: Thu, 27 Jan 2022 15:48:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 2/4] VT-d / x86: re-arrange cache syncing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
In-Reply-To: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0058.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8b32988-752b-4555-8ed0-08d9e1a41444
X-MS-TrafficTypeDiagnostic: AM6PR04MB4887:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4887F89B6E59AFFDDF68819EB3219@AM6PR04MB4887.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2zeN7dvCFKzVFE9+qYjDRHT6ox73hyj6qKSq8ajxBYoewhpwunKTLYWI46SxPMgC+S7NI4SH8mVATSaHZBV4kfaGoaNX4okyouZNgQUCEpZ1bv3KsNfj3NM+SomOtqnKOvBwd5Sm8NHAFPJ1t/XvTlMtg50W6Kv0aMuf0rg00f5tw6f2QuDjNiUEV3FBXcQuK9yu/aJ1p+5abuaRtAs5+j1ESjLQ/Ji6Lfx4/MqPQ+5LDeXaNDLrbXUR55whwIcLnHSwUHyOxyj28aYRZvBkDjGi7bNbmUlGxZJ6tWIXktBaN3qwT80w3+nc0uQcT3hYhH/nxC3fHobF8Nypmf1XjEg2fdoh4ZQa0Zel7FMxw8KxE0O2/A+YZvuAfheZfyGUox/jg/L2z6E3aVAlnofZcMUysvVleBhjjVPeA/mmgku6KCjuOu/xAyDn089t/6qCxWz5Byg0Ieg4vBEdf6xXz7Nz03zDVs4nq9xbE2ccwKQAJQj+NkCgppj2id5MUCiRT2A1Lw9T4OXEaH8AjhHJ9uDK0iNxU7EkdsX9E1FMz51+29Z24NkdgAPl1n+8yIJmxukp/e1F/fXyl/aPv+dLPL99bIU1uPLNkLKuxy8rk3MeY85/3n2BBitlExY1zSdvLj9KBGt3iWlOA2GUTR0VXIiu6WhImRqaVRwaESuJUO4CFwjuP3CG0vxdTiYc4aThc8gX/VUXh1wO+aRYWo+pR4IVllb87WOjZYx119Dr6FrGaWRanZPzmf++w8Wc7nSC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(83380400001)(6512007)(6506007)(186003)(26005)(31686004)(31696002)(6486002)(2616005)(54906003)(6916009)(316002)(86362001)(508600001)(2906002)(4326008)(8676002)(8936002)(5660300002)(66556008)(66476007)(38100700002)(66946007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3J0V2lOV0tMOUVLN2pwc0ZMWkp5SGdFWGlZUUZDZGlPY2NvTDJpN2FIOEp4?=
 =?utf-8?B?VDFZRjdBUjRGOG9ENVlIZWVmQ1ZBcVluSEhUd3NSWWZvRkVzSEsrdEwwcS8y?=
 =?utf-8?B?WjlyZXNOb2t5TjFLeldHSjUxOHFTQUkxd1hMNEc5MVBnd2NOdlRCMUgvSUFu?=
 =?utf-8?B?ZU9uSUFsd2xiWC9nQktYenh3VXZKdTVzcHhjUGhHNS9nbkZwSjkzYXlybkFm?=
 =?utf-8?B?aTBpNk8zZVdIR0Y1dnhjb083ejZGeHJBeVpzVHdsMkpDOUlQOGI2ZmlaY0tX?=
 =?utf-8?B?TWo4SS9jeGVTbExKc1VzQlEyeVVBUmdZSDBvZmtib0NBeDcxZFpQK1RJQ05z?=
 =?utf-8?B?aElXVlp3cC85WXNBWkphUmFEZll0emp4cVFPYXRCRFc4ZXRhM1hNSGhJT0hz?=
 =?utf-8?B?MlJLL0JHUml5T2NYSkNCcWNsNVhyOGlVazBDZUNzMjQrNXl6MkQwbDVsSVFn?=
 =?utf-8?B?ZFdKc05NMWpkbVowU2dXM1owL2Jaa2xtNUp2aXhGbDJDUlVobXAxcjBLaDVn?=
 =?utf-8?B?RzhOTlNKUG1Ya0tsbWN1NHJKeFh5UnpXdG5SWFBSckRjTjZJb2t5aDBCUjFP?=
 =?utf-8?B?SXhpVGtRUGtuWXJ0YjcvejZJL2tMSVNqczl3SzUwM282MyszYU9NY0oyRXFP?=
 =?utf-8?B?RWtxcmVBdGFhTUZ4ZXkzRE4raUVEamFNSUtqamtvazNXT1RtRVg4WEtZaHJR?=
 =?utf-8?B?R1pnZHRTcDNYTkZ5SkRyTlJ0QUUwbUZ3ZnJpUU9jLzczV3IwM1p0dXUwc1Zk?=
 =?utf-8?B?WmxnaHd0aGxEdHVsc2lMRnEzRzRyVHk2NEVmTE5Qa1BHa0p3NjlFcVRmdVFD?=
 =?utf-8?B?QlBtelN6K0hHOVJrSGN4ejNaK1hpZEV4dnFraGVZaTJMNlFPZnB2K1cxb3hM?=
 =?utf-8?B?aGxCa3RZb29oRk9OOEt2VzN0bmxkRmJQUHNwTEY2THR4ZUNheUdVQk5ZY1VL?=
 =?utf-8?B?R21sT3FMVUZDd2lsMVlOYTZlbnN0K21BTXF2bXcvT3hnMUdiRWwrenFiL3RF?=
 =?utf-8?B?b0RjUXJ1SUswZTdxN2cySWEwaDRtRW5ubjc4SWFYdFowRjNxUyt0elpTaUNy?=
 =?utf-8?B?U1kzbUVSZkhadmtSMVlNamNYY0FHRkNvQWdTRGFhQzc0SUh2TGNvK0k1SDcy?=
 =?utf-8?B?T3pib3o5SXp0M1prOG8zcU5vc2Q0dDlHeElXa2R0WTMxTlp1QzBocXR4TUNX?=
 =?utf-8?B?M3NLQ1I5MFF3NG8yZFpRdXJVSUI1blV1bTg0WElDakg0OFZGUGEzR0lFNGhp?=
 =?utf-8?B?NWNyWHVqcElRM2VpdCtLeVJ0WFludDVZeHBNam9PYWViL2oxMnp5Rk9OYWNQ?=
 =?utf-8?B?V0Fwb0RzYm4zc2N3ZlFpYS9SOFg4bnY2dVdzd0pHVWpaQ2k1QzJnOUN5RlY0?=
 =?utf-8?B?ZWVzUVhjemIzSGl0UkZQdFUxc0dheVdLQUFRdEt2QlEwTHFOcEVaby9jamFw?=
 =?utf-8?B?R0NQaTVLZEJpRDE2TE9BbHJIbm5va201SU9XVS9nc0NDbzlaM2VuVXp5SlFz?=
 =?utf-8?B?YTF5Y3UyNGhpUGh6ZU5jc2hNZ0czVEtTajFqQWRDMHJDa0lPc1Z3R3lHUlNO?=
 =?utf-8?B?V1NuU0o4TEJNR1o1dm96dmthcnJxVFRyOXA5eWU5TXFPS0k2VHprQnpQQWRn?=
 =?utf-8?B?K3cxL2dPV1pIRUhFMzlVcnpFRmFZQ2tNSFZJV2xkUmtyVnowOWVkTHJyUjR1?=
 =?utf-8?B?TWM0czVIeVVMMTJKcHZaVnFnNEhGdlY1OUY3T1pnUCtoNlBTRVZRNE9OMnpK?=
 =?utf-8?B?ZFV3NVlITEdyWVZzYWxvVmJmaUFPcER3NXZBWmJ4Y1I2dDRwbzI5cnNsR2xS?=
 =?utf-8?B?dHhrUmhidllGbSttS05kL3pmNmg2MG4rVzd1MGdYbFdib3lTNFZ5cWl5STdr?=
 =?utf-8?B?TWlqSWRZNkpUUkFkWDhTVU5wcUdaQlRxYTA4cE5uRlZCS3UzdXlSbkxqNEQ0?=
 =?utf-8?B?WUljVlIwWFY2MkRYQnhPSXJWTnRzZzRzdmVCWW5ldHByRUxIYnpoSFp6VzB3?=
 =?utf-8?B?czhFYndPOUo3MHFpRVg0VFpGdWNYUW02SFV3UnNzZ0NpRnNSWFRTZFBHZzZT?=
 =?utf-8?B?T29BVlhsT1RGZzZZOWwxR00rSWNRUjR6Z01RdWtPMXZYNi9BTGlCNTFBaGZm?=
 =?utf-8?B?YkNuWUdUNzBEemhOT05CamlLRVNaN1pDcWM5VHJrUzBQY1htbyttQUIzYklt?=
 =?utf-8?Q?we8AU47qzivb7VOZk4khI2c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b32988-752b-4555-8ed0-08d9e1a41444
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:48:28.2121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhnPS8FxfXme2rYRGL1yR4XQHYWaAT+b74XViFOvPZg5gk63lmVQhysQ3fczqaevHcxByva2O+5wOy0kLBT+vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4887

The actual function should always have lived in core x86 code; move it
there, replacing get_cache_line_size() by readily available (except very
early during boot; see the code comment) data. Also rename the function.

Drop the respective IOMMU hook, (re)introducing a respective boolean
instead. Replace a true and an almost open-coding instance of
iommu_sync_cache().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Placing the function next to flush_area_local() exposes a curious
asymmetry between the SFENCE placements: sync_cache() has it after the
flush, while flush_area_local() has it before it. I think the latter one
is misplaced.
---
v2: Rename sync_cache() to cache_writeback().

--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -11,6 +11,7 @@
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/softirq.h>
+#include <asm/cache.h>
 #include <asm/flushtlb.h>
 #include <asm/invpcid.h>
 #include <asm/nops.h>
@@ -265,6 +266,57 @@ unsigned int flush_area_local(const void
     return flags;
 }
 
+void cache_writeback(const void *addr, unsigned int size)
+{
+    /*
+     * This function may be called before current_cpu_data is established.
+     * Hence a fallback is needed to prevent the loop below becoming infinite.
+     */
+    unsigned int clflush_size = current_cpu_data.x86_clflush_size ?: 16;
+    const void *end = addr + size;
+
+    addr -= (unsigned long)addr & (clflush_size - 1);
+    for ( ; addr < end; addr += clflush_size )
+    {
+/*
+ * The arguments to a macro must not include preprocessor directives. Doing so
+ * results in undefined behavior, so we have to create some defines here in
+ * order to avoid it.
+ */
+#if defined(HAVE_AS_CLWB)
+# define CLWB_ENCODING "clwb %[p]"
+#elif defined(HAVE_AS_XSAVEOPT)
+# define CLWB_ENCODING "data16 xsaveopt %[p]" /* clwb */
+#else
+# define CLWB_ENCODING ".byte 0x66, 0x0f, 0xae, 0x30" /* clwb (%%rax) */
+#endif
+
+#define BASE_INPUT(addr) [p] "m" (*(const char *)(addr))
+#if defined(HAVE_AS_CLWB) || defined(HAVE_AS_XSAVEOPT)
+# define INPUT BASE_INPUT
+#else
+# define INPUT(addr) "a" (addr), BASE_INPUT(addr)
+#endif
+        /*
+         * Note regarding the use of NOP_DS_PREFIX: it's faster to do a clflush
+         * + prefix than a clflush + nop, and hence the prefix is added instead
+         * of letting the alternative framework fill the gap by appending nops.
+         */
+        alternative_io_2(".byte " __stringify(NOP_DS_PREFIX) "; clflush %[p]",
+                         "data16 clflush %[p]", /* clflushopt */
+                         X86_FEATURE_CLFLUSHOPT,
+                         CLWB_ENCODING,
+                         X86_FEATURE_CLWB, /* no outputs */,
+                         INPUT(addr));
+#undef INPUT
+#undef BASE_INPUT
+#undef CLWB_ENCODING
+    }
+
+    alternative_2("", "sfence", X86_FEATURE_CLFLUSHOPT,
+                      "sfence", X86_FEATURE_CLWB);
+}
+
 unsigned int guest_flush_tlb_flags(const struct domain *d)
 {
     bool shadow = paging_mode_shadow(d);
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -240,54 +240,6 @@ domid_t did_to_domain_id(const struct vt
     return iommu->domid_map[did];
 }
 
-static void sync_cache(const void *addr, unsigned int size)
-{
-    static unsigned long clflush_size = 0;
-    const void *end = addr + size;
-
-    if ( clflush_size == 0 )
-        clflush_size = get_cache_line_size();
-
-    addr -= (unsigned long)addr & (clflush_size - 1);
-    for ( ; addr < end; addr += clflush_size )
-/*
- * The arguments to a macro must not include preprocessor directives. Doing so
- * results in undefined behavior, so we have to create some defines here in
- * order to avoid it.
- */
-#if defined(HAVE_AS_CLWB)
-# define CLWB_ENCODING "clwb %[p]"
-#elif defined(HAVE_AS_XSAVEOPT)
-# define CLWB_ENCODING "data16 xsaveopt %[p]" /* clwb */
-#else
-# define CLWB_ENCODING ".byte 0x66, 0x0f, 0xae, 0x30" /* clwb (%%rax) */
-#endif
-
-#define BASE_INPUT(addr) [p] "m" (*(const char *)(addr))
-#if defined(HAVE_AS_CLWB) || defined(HAVE_AS_XSAVEOPT)
-# define INPUT BASE_INPUT
-#else
-# define INPUT(addr) "a" (addr), BASE_INPUT(addr)
-#endif
-        /*
-         * Note regarding the use of NOP_DS_PREFIX: it's faster to do a clflush
-         * + prefix than a clflush + nop, and hence the prefix is added instead
-         * of letting the alternative framework fill the gap by appending nops.
-         */
-        alternative_io_2(".byte " __stringify(NOP_DS_PREFIX) "; clflush %[p]",
-                         "data16 clflush %[p]", /* clflushopt */
-                         X86_FEATURE_CLFLUSHOPT,
-                         CLWB_ENCODING,
-                         X86_FEATURE_CLWB, /* no outputs */,
-                         INPUT(addr));
-#undef INPUT
-#undef BASE_INPUT
-#undef CLWB_ENCODING
-
-    alternative_2("", "sfence", X86_FEATURE_CLFLUSHOPT,
-                      "sfence", X86_FEATURE_CLWB);
-}
-
 /* Allocate page table, return its machine address */
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node)
 {
@@ -306,8 +258,7 @@ uint64_t alloc_pgtable_maddr(unsigned lo
 
         clear_page(vaddr);
 
-        if ( (iommu_ops.init ? &iommu_ops : &vtd_ops)->sync_cache )
-            sync_cache(vaddr, PAGE_SIZE);
+        iommu_sync_cache(vaddr, PAGE_SIZE);
         unmap_domain_page(vaddr);
         cur_pg++;
     }
@@ -1327,7 +1278,7 @@ int __init iommu_alloc(struct acpi_drhd_
     iommu->nr_pt_levels = agaw_to_level(agaw);
 
     if ( !ecap_coherent(iommu->ecap) )
-        vtd_ops.sync_cache = sync_cache;
+        iommu_non_coherent = true;
 
     nr_dom = cap_ndoms(iommu->cap);
 
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -28,6 +28,7 @@
 
 const struct iommu_init_ops *__initdata iommu_init_ops;
 struct iommu_ops __read_mostly iommu_ops;
+bool __read_mostly iommu_non_coherent;
 
 enum iommu_intremap __read_mostly iommu_intremap = iommu_intremap_full;
 
@@ -438,8 +439,7 @@ struct page_info *iommu_alloc_pgtable(st
     p = __map_domain_page(pg);
     clear_page(p);
 
-    if ( hd->platform_ops->sync_cache )
-        iommu_vcall(hd->platform_ops, sync_cache, p, PAGE_SIZE);
+    iommu_sync_cache(p, PAGE_SIZE);
 
     unmap_domain_page(p);
 
--- a/xen/arch/x86/include/asm/cache.h
+++ b/xen/arch/x86/include/asm/cache.h
@@ -11,4 +11,10 @@
 
 #define __read_mostly __section(".data.read_mostly")
 
+#ifndef __ASSEMBLY__
+
+void cache_writeback(const void *addr, unsigned int size);
+
+#endif
+
 #endif
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -19,6 +19,7 @@
 #include <xen/mem_access.h>
 #include <xen/spinlock.h>
 #include <asm/apicdef.h>
+#include <asm/cache.h>
 #include <asm/processor.h>
 #include <asm/hvm/vmx/vmcs.h>
 
@@ -134,12 +135,13 @@ extern bool untrusted_msi;
 int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
                    const uint8_t gvec);
 
-#define iommu_sync_cache(addr, size) ({                 \
-    const struct iommu_ops *ops = iommu_get_ops();      \
-                                                        \
-    if ( ops->sync_cache )                              \
-        iommu_vcall(ops, sync_cache, addr, size);       \
-})
+extern bool iommu_non_coherent;
+
+static inline void iommu_sync_cache(const void *addr, unsigned int size)
+{
+    if ( iommu_non_coherent )
+        cache_writeback(addr, size);
+}
 
 int __must_check iommu_free_pgtables(struct domain *d);
 struct page_info *__must_check iommu_alloc_pgtable(struct domain *d);
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -268,7 +268,6 @@ struct iommu_ops {
     int (*setup_hpet_msi)(struct msi_desc *);
 
     int (*adjust_irq_affinities)(void);
-    void (*sync_cache)(const void *addr, unsigned int size);
     void (*clear_root_pgtable)(struct domain *d);
     int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);
 #endif /* CONFIG_X86 */
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -78,7 +78,6 @@ int __must_check qinval_device_iotlb_syn
                                           struct pci_dev *pdev,
                                           u16 did, u16 size, u64 addr);
 
-unsigned int get_cache_line_size(void);
 void flush_all_cache(void);
 
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ b/xen/drivers/passthrough/vtd/x86/vtd.c
@@ -47,11 +47,6 @@ void unmap_vtd_domain_page(const void *v
     unmap_domain_page(va);
 }
 
-unsigned int get_cache_line_size(void)
-{
-    return ((cpuid_ebx(1) >> 8) & 0xff) * 8;
-}
-
 void flush_all_cache()
 {
     wbinvd();


