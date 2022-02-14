Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B184B459E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 10:25:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271291.465700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXbz-0004cE-SM; Mon, 14 Feb 2022 09:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271291.465700; Mon, 14 Feb 2022 09:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXbz-0004Zb-Oz; Mon, 14 Feb 2022 09:25:35 +0000
Received: by outflank-mailman (input) for mailman id 271291;
 Mon, 14 Feb 2022 09:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJXbx-00043T-S7
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 09:25:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cc35a1a-8d78-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 10:25:29 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-GuhDHtz2NK2pHNWIx8v9mg-1; Mon, 14 Feb 2022 10:25:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 09:25:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 09:25:30 +0000
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
X-Inumbo-ID: 0cc35a1a-8d78-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644830733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+QV9f4zvS046E/T2Qkac91dJy0u0hz2Q9q4aDSre0U=;
	b=N+jjAsKrxPQk7f04yzErt10ld9LTyUNC+CdnA4oKjMeheu8qAnKuYUmahqv4QmFkERtvjh
	kWbWw7KgQydCVmxJzJ/MCVZlEL12yGTnjiYphGQfSK83SLz7Osji1mXdb56ADr8fIaUlPl
	lQMVNPkUqwxk9wCTbaKaRywhwPiBg20=
X-MC-Unique: GuhDHtz2NK2pHNWIx8v9mg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmsxkszlYhy9rfK5pTW28fFHhpMd0i6AoM1UXVRopzgF7syyUC1934kuiF+UpCyP5UDWAgZfqoRMsWgTg1lBqNzJbAgAudbwNyqrfU3Xu1zmuj61toRonZ0s12QLnidebIRucvN/L8riM7XgVo8Td75i0n6gLK1bKu22dzNISUlBpm1ZzYDTnI12/6noXEm0gddq8skXBLLnNJVglav/E6XNjJ7Lw0zKT1Ez8JUu9L9RLzjAqEAz/FgGm0yEClLAbGe/iiPY09LpM5ZQzoGqVzmc7RCqXlD696ABxMl/C9Fh8HHxu9H4ZgD3ZbvLV46dEHL+1SEa2YBLSQltHjaEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+QV9f4zvS046E/T2Qkac91dJy0u0hz2Q9q4aDSre0U=;
 b=KfutONe6ZQ8QBqcd0ReSkeFI54gpCk4BVW+Dvn8SSeh2vdOmq10wI6IFSDTmjAA5Czw64VcxFTqNcV1SsrCOi1OQfIaCUMpA4R5UqKCCWpd6NZ6cyTEtHdSFbpEW+GdnHj9Xk0/wCXKYoi7omNQolZCtoT/9hJZrtqff7R7Q6a+qJqCzyt7Dd5XQktq2B31KHDLp+PsTu2fbQ1JBkkMWRu0Dygi9AKI6oL66uo65PQE9uxKKhPv0Ay7vIIkxrd3AjlPBP3XapV8DvMWbRP44r3lFhT+94d8fqi31+hcxrDuMy916Dfk3xw575fzXK4LrcAN1yU3SL9nOgSZTUcVUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c679a11a-d2b5-403a-5341-3e00ac91ff45@suse.com>
Date: Mon, 14 Feb 2022 10:25:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: [PATCH v3 3/4] x86/APIC: skip unnecessary parts of
 __setup_APIC_LVTT()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
In-Reply-To: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0125.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c447af9-bff8-4182-a35a-08d9ef9bf1b8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB516854A429E7B2DCD673BF72B3339@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BF58ZCy2mrVZd/TySIs1MooX5HdVPTPsrTfAQgyWDd+NmvD7jVjw7rKng8kkpbowlmuMrIHqap44KKLJZNwTN7ApD4r7RN/vcFaEMZ6nJoAnhDXCI02DCv48QAlr5hFiXk+noeTLszOslzjKVtshP6Gk1MytEVKIFoJTYD2BP3sbPcC550RDXJm7fg/FPxDV73BTj6nZy1CqTD96ajF1xKZ+PcgYIZUXrv36GBvh80kw9JVTn5gKj9COdcHuZC4VRq1MI8xwL8vXSzAZ4G2BNYidYHHbn/bCW/rf/B8wsv1wMLW7QtgNCX4Bs3Rfq0f/4SNDNudztUcPtf30jM7aWdBJ0I66cFNLLkJhoywHygKSvGzCVUsldPwrEm7yc1lYzwrvB/YglBRHEAVS/Vffj2Z7xinPAQsQcRDxOPhqz8huR5WfBR4ov1F+sa+XBDOAaodCr/K6C8ta7K/Vje/Il5nuFyUJmp38Mp5agnkvabnXl+5lq5TI/6MBeT5+rYZH3RqdVn9yP3nAAqrqjiWWr2k3Zplbtblesp9lV+SbpdgN15inAuSx+wwGO5FQFj5wKbG0Y30bpAohS1K3J7wu7AlxLML609/brBc0Qbk79Y+V9BLZlJ34hCQ3S8OfC4hQK374rxsGfsoFElFzt9KYWpDHV4GtuswMpVOZISIg/lrmRzjMRs5b7Fzjy60FYk0JGYv9Y5MV2/03uNfabyb0vKjEHNyZNgoAn1IDre2eYGpX/ON1o6nBG0261f021B8n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(316002)(38100700002)(6916009)(31686004)(66556008)(66476007)(5660300002)(86362001)(54906003)(4326008)(8676002)(6486002)(508600001)(31696002)(26005)(2616005)(2906002)(8936002)(66946007)(186003)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2dNQnVvVCtPUzJxS2cwb3N2alJDMVIzOUl0TUlBdXlCcm1VOFI0c1FzUFJm?=
 =?utf-8?B?Wko3d2wzSzhNYXh0WTBabFNxbFNtK3FTMXVkQlJtL0F0QlVLQm0vYkUydnIy?=
 =?utf-8?B?QVVTSnYyOUJoLzRUaStZUCtRcFh3ZXRxSDJPMjJXbkVaY2dvTmFXU3RRd1Y0?=
 =?utf-8?B?Yk42cVVaODVPTEZORTJRdkVjTzdNUVdxS3IxYlFPditYUkZrNUhUd0h4bEJ2?=
 =?utf-8?B?VHF4ajhlZ3g3WFpzM3Qxb1lTVlNKZkZzMVlBYlEyVEdGUjYwVFR6bHpCenc4?=
 =?utf-8?B?RitOd1p1Q0xhbkNFQnJGVVd4bi9rbzIzamw0NXI5K1NDbGloalQ2S0ppeTk1?=
 =?utf-8?B?bzBYYW8rWW9KTm5TSWxYa2g3c0IrbmYzQ01rd3ZvVGRtU0Z3THhBdXBhcE1E?=
 =?utf-8?B?VWNXZU5pa0FaTmNuZmx5cXhndGpFN2FnVWJMUzE0dDVaSS9PS2I1MHVvcjJw?=
 =?utf-8?B?eG1aQy9uYVprSzgzUUpaM0MxdUgvSitZZC9ocndVUS9GOEMxaUV6TkR6d2pO?=
 =?utf-8?B?NExOMXZlMjFvdXRWUW1YMDdFeXVJYkFIMnZwcEhtekVPcjJndWxDNWpEcVlK?=
 =?utf-8?B?L2FhMlE3MHdTWTBTdllYTHFlZ2pwcUFsS1J3NW1yWjhNdlpIT0pDT2ZaNFhS?=
 =?utf-8?B?OXZsRFNBK1dOYnZaVmhtSGF6d3VadUlqNThGV3JGenZNVHk1UXFIa1kydHhT?=
 =?utf-8?B?Y1h3U3p6UWhnaWZ2WjY1SmNDd0I1eTZiK0xQZ2ZOT3Uwa1JCOGlPN1haSmFN?=
 =?utf-8?B?b1BSOVNkdElhMk43YnN6T0xtYitTbmtVNHI5RWZZQkFYdlV2VDB0dDBndGFQ?=
 =?utf-8?B?OStVd01JVyt5SndyVXphbVZrdjNvOStSeFZJdGRDbWxxazV0dHJJTnQzaXdH?=
 =?utf-8?B?aXJZQTZVMm5IQ1pYQnptbDc4MlpxcmNSS1RrbENyYmlDc2RrRklzZ3NsdGZW?=
 =?utf-8?B?ZkxUMi92ditEM2FwMTFIRi8vT2FhcmZrZUxPaStBN2RSMlB4b3JweDJ2T3RZ?=
 =?utf-8?B?WjFpd3RsTkZhdXEvM0t1SGJyakVwb25VeENHSld1NGZpVW1LeDFhNGRPR2sw?=
 =?utf-8?B?blA0QW9WK2Y3ODNEa211NStIUkgvdHFKdXNjT2FFRnN2MHNHMlp6UVNqeUZC?=
 =?utf-8?B?TWhSQ08yOXU0R0U1dDJyRGNjUThPQ2Q4WSt5MElocGU5K2FVemxKYnk1WU1N?=
 =?utf-8?B?aTRHSFAzREtuWWRsR3JoaXh6TUVVaU5IcHF1NkRYTW9qTitBL1NWSDNLV2E1?=
 =?utf-8?B?WXN3cm9UNFlBay9oVmRPMmdzT2JFRXFkTGthK2ZyYjcwRTZIVDlZUjNFOFJX?=
 =?utf-8?B?VmJMcXdwVzRnV3hxb1RmOHYvKy9QQVJCeGdYRHBXb2RGczZFcDgrMUkxT1ZH?=
 =?utf-8?B?MlFnV1ltdXZJMUwwWlYvTEI1WEJLZ2I1NmY1ZUZxNi9TMXJ2REVnQnRiN0Vk?=
 =?utf-8?B?M1Ixd1d5d3hXMkdkQXBaNXV5QWdFNDR1LzRwN3I0YTg2WUdHWUVsM2lsWEJh?=
 =?utf-8?B?L0F0R3Q3Rm05SmlmNDZTTy9Ha1phbFk5bitUVERLQkhYTmZLZHZnWXJENUto?=
 =?utf-8?B?clRuUzlpd3poVXg1SFZFeFB2U0FRRTZGKzhQMGkzK0FRUUF5MEYySGl0d3Yv?=
 =?utf-8?B?ZFBxeVBOdGxrNThNcHpTYXdQbmI4dnlHbHZjL2g1RElwTnhQbWRaZXpuM1l6?=
 =?utf-8?B?YjNySGZpeDdjU3l5RzJZNGlzZzRvb0J5UVZYMDNpdU9vODE0SDJEeDFRN3JO?=
 =?utf-8?B?WkNtQ2prVi8zNkNrTVEyaitidGJQRnhCTUFjQ25ZNGY5NTZET2pyWkUwNkJR?=
 =?utf-8?B?c24rYWkxWmQ0QkRoanlQNXdMMzFzZ212ejhaRmQ2c1R2d3dTWnNCOUxPQUo2?=
 =?utf-8?B?aTJSdk05Qm0rb2VER0pnQlp6ZGZBZXE0RSt2dmpDOG5tQWZQa05ORWJLcDEv?=
 =?utf-8?B?eWtzWHBmOHlJeEV1KytFRXZ3Q05US09CVnJUZTNtbEFoa0U4V3IwY2hiZlcw?=
 =?utf-8?B?clN1TGViRnNKWlNzKzY1eWtFMnFXcndWelFQNDR0UGNNaEthRkk0YnM4eTN5?=
 =?utf-8?B?Y2RidnovUXE2bzhIeCtPMy96dytJQzZWYzVEYTdNNnRjTkp5THMwMXBYK2Zy?=
 =?utf-8?B?TnlZeEpBOXlmQlFockFQSk45TTNmVlhrMEhudTlHcEFkRmFvZDlESDZnM1hs?=
 =?utf-8?Q?hl2dRG+KZtxZdntm+IpO4kE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c447af9-bff8-4182-a35a-08d9ef9bf1b8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 09:25:30.6202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKz6K/yInSzvCMCOegjV14k5CrxAh3N/Wq3em6a+ELqHlNs9BPO0nZQgtZmIPXGxsQhdfMJR9eP+wvNuLzhf8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

In TDT mode there's no point writing TDCR or TMICT, while outside of
that mode there's no need for the MFENCE.

No change intended to overall functioning.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1059,24 +1059,25 @@ static void __setup_APIC_LVTT(unsigned i
 {
     unsigned int lvtt_value, tmp_value;
 
-    /* NB. Xen uses local APIC timer in one-shot mode. */
-    lvtt_value = /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;
-
     if ( tdt_enabled )
     {
-        lvtt_value &= (~APIC_TIMER_MODE_MASK);
-        lvtt_value |= APIC_TIMER_MODE_TSC_DEADLINE;
+        lvtt_value = APIC_TIMER_MODE_TSC_DEADLINE | LOCAL_TIMER_VECTOR;
+        apic_write(APIC_LVTT, lvtt_value);
+
+        /*
+         * See Intel SDM: TSC-Deadline Mode chapter. In xAPIC mode,
+         * writing to the APIC LVTT and TSC_DEADLINE MSR isn't serialized.
+         * According to Intel, MFENCE can do the serialization here.
+         */
+        asm volatile( "mfence" : : : "memory" );
+
+        return;
     }
 
+    /* NB. Xen uses local APIC timer in one-shot mode. */
+    lvtt_value = /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;
     apic_write(APIC_LVTT, lvtt_value);
 
-    /*
-     * See Intel SDM: TSC-Deadline Mode chapter. In xAPIC mode,
-     * writing to the APIC LVTT and TSC_DEADLINE MSR isn't serialized.
-     * According to Intel, MFENCE can do the serialization here.
-     */
-    asm volatile( "mfence" : : : "memory" );
-
     tmp_value = apic_read(APIC_TDCR);
     apic_write(APIC_TDCR, tmp_value | APIC_TDR_DIV_1);
 


