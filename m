Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E7467655
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237421.411807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6if-0002kd-60; Fri, 03 Dec 2021 11:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237421.411807; Fri, 03 Dec 2021 11:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6if-0002in-1G; Fri, 03 Dec 2021 11:27:13 +0000
Received: by outflank-mailman (input) for mailman id 237421;
 Fri, 03 Dec 2021 11:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt6f3-00064Q-7F
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:23:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fda1e7c-542b-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 12:23:28 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-UPImK2diOhqP9Q_ZdHKf0g-1; Fri, 03 Dec 2021 12:23:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 11:23:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 11:23:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:20b:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Fri, 3 Dec 2021 11:23:24 +0000
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
X-Inumbo-ID: 6fda1e7c-542b-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638530607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFvGg2AyKiCL3CXNR/7f8T5X0LRpA3l3GkYroFgY/v8=;
	b=NIL2SB0goXbkvd8J+knD6SIM4UOupXp0+TJ01ARU4mkX68sxM11ncjL278rZOnqSStSWWE
	keOnUGMSd0hQ6/zRf1DN6w6KrTvM4EQ/JriELWJ5RIIdu9yxrmRml3u0oKPkVMCYjfJATN
	67Qvt5OcvSrWj49qFATTGbtYwnhzETs=
X-MC-Unique: UPImK2diOhqP9Q_ZdHKf0g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZI8uQOflQKFH/uNIokRfzmeVuCktWAEgbxdfHmV+/+NA1HSN9PiYMQpfOeROCADM0aGIok6tXQthyczOGrjiZ6u9DzubYNZ3R52EerYWsK1BuJfIjLzw6BRMRG1JK9ZYn1HLDDX6vQoaj4zS8q3cwGQAx7eQPNhO1BmHSM6JGl+QzaMNWbRm4H8V3VpsBup75Hdn1Nx9nyNslx8dldDiSsH0QfhO/bXXLTGcFSBGdKv31tNJhv1NxRpHVLCEGeGGlxMiL37CNU9++nYg08EvUCzEEeJKH+lsOfLgrlvIWwGNsWbRORXwNfK9LCwVrJsaG2WpDktPVTSaqB4SBeWUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFvGg2AyKiCL3CXNR/7f8T5X0LRpA3l3GkYroFgY/v8=;
 b=AZeXxxs70HsmgRDNJ2lh9BhZ0VFwK9JwsNNFraXpPA3dtyvwUEU3o0GE5gAySMLcrSyRU4sW0fNYCnm1flehhKl2cZrbMNc/zxdArbqjP/kDiDK5IeNy85SOlv6SFbXHqfsbkVHlEpM3PDoTImmBYl3m8MFcr5mYTRDPig+EExvQC//7drwICQ/7/0VpSIEJGdBEw0YmnX7spnD+EhHDRdr6U0COBMfHyf4LtRdaIIuPYxtT5J7acl7lZnPct1TdEeD0iqsPt9GuKdI06hss66LyayFKW88EKSCJuTH6Pq+1RaHm7KfWkR7tfVBWkPevIyBiZZnxrOIs7lrEk4OUTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53cf0492-e197-d3e6-8898-9e199bbc5399@suse.com>
Date: Fri, 3 Dec 2021 12:23:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 3/3] x86emul: drop "seg" parameter from insn_fetch() hook
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
In-Reply-To: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0025.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 979c54f3-86d8-413d-5d59-08d9b64f5278
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73753E0426978088A92D1DFBB36A9@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YXvBS01+dT4U/cy00IGBI6NziOyeaC10JbhIijIIaXRiNJ2Kj3WifcDf732zylaBc0cGI4IfIP8tu3NjnBv5EB6BfoswdM0M/5sN9PoRzX/m/ZYuC0UKtJTXTAulOJKUPfvLrkibyECO1Yd6x/LydY527+7//TiBgpCePBjqzfXS6DQ0JfcBca/btnXqlrM7yojC17LPLcocgiePxI/SMqKr+AMpvEw6NCvpUCVjPkEGLcgmr8sp32Ggbe1lAmN3NVxTHgRf8AWU81eVdNptkUv8zYqRihx49ibEX8cuIG5OVW+XyoVXnwtp8iUWRlWzE/7aQm99eJdTTXgyejZNM8Vya4rmrMtdb20H70XH/ok7thYXhV5C2Va/HWHEH18D/8jcG802L0+HJk35f3Wx18hjCF3Bfky7yoFLS4CduIG6HMgyQDBOO4Dhpq1CQDGE+ZHw+aRHAL6ieIRQ9GVtDy2Zgl4+dz+6R44KpFJdnMgWzjPJd15HZo7ySjM5cDAPcOSWjd48HFAr11LIpkg+/Loml3GV7+qNKLKE5UKpsc3qFHN4nr0EGzaXlFSMQZyBS5RQdbLTvl/ORudwZvYh5EdLuLgLe44blzwVztZtxU+e7Cgd7vogDgR6AwxQERnDAlN79afsleiooKKedi7JvHWF2l8EPQhR6uYWt+RKLgjNIFjq6Uf8830ls5yHBq5CmuJjLa+4JHDwYN67XeljZ7O5QYVG66PdtkVuycUySoM5WKo0yvOFLYDwg0P5KGaPikDon4evodkfDxXjAnpRWW4ngXnYu0zixWLeyv+l7mU2BXEngDu4JUvEdJM0Vqq+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(36756003)(16576012)(26005)(66556008)(2906002)(30864003)(956004)(6916009)(54906003)(66476007)(31696002)(2616005)(316002)(66946007)(4326008)(508600001)(38100700002)(8676002)(83380400001)(5660300002)(86362001)(6486002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnF1MnNxbkpoaUVhbmVvNmVDVHdSMHFYOVJ4QkxTREhJZW4rcnhqaEhuNGJt?=
 =?utf-8?B?cHNmK29NRmhIdEVmNXVvOXpBbzBXdDJPSkpyTEtUSTlKODMrN09pWUN1ZlIx?=
 =?utf-8?B?MDNmSFM2em05dzY1Q3dNM0xDVGc3YUkxd2UxbG9LMm45VU41SjllN0JpeUFn?=
 =?utf-8?B?NE1qYklaNExUZExUdGsxbjRZc0FTcGlPVjk4Nyt2ZWFwZFFxRXUvcWF4WVA2?=
 =?utf-8?B?aFVOQmlyRCtkd3dqZlhsVE0wTFZzWWtnZk1nenJrcm43Nk1QdlNob0Q2U25J?=
 =?utf-8?B?RjV2R040RW5GQjU0MGROa0kvemV0UmZNL2gxY05Td3dxdmFvK2NpQUZITlJK?=
 =?utf-8?B?NUJob0EreHZ6a1BQdVBadkN0SVZBdHYrVlZaWUdFNUZJRFRZMVAxdDZraHhz?=
 =?utf-8?B?K0F5dnp3QmYwZEwwUWo2ejEzSE1GZEN5bWhSUzczNnRFczRWVEhLcU9GMXhI?=
 =?utf-8?B?Ly83SE9EUnhjb0FIQ29Pd0tMdjFpRE5jK21UUXFCMmt2YkM1YjRDZjF4Y3Uv?=
 =?utf-8?B?Rm9ZM09VZlAyT0lRVTNrcmo4bU9namRPcFVWQ1l6Wm1BTEVtWjVKREFFOUtW?=
 =?utf-8?B?VjNydlU3ZEJ1WVJRTzc0ekZMTGhDTU11SlZMMU1PQ2h2NGJDQ0JaKzB5eklZ?=
 =?utf-8?B?WDVjclJva3ZKai9PVGFuWGVia3ZLOG15aFRONUJTZVlVRzFCL0thTTljOVZB?=
 =?utf-8?B?NnVtNXdpVkpYRkFqUDdnTkdiOFZuYTR0WmNsYy9HVE1IWHFaV2VNR2VlYmo0?=
 =?utf-8?B?LzR6dW1TUWpCSFNhdjFTQ0oxbnBLYjBYN3lwNXRaNW5EUlJWY3J0VmUyNWcz?=
 =?utf-8?B?eGFpTlk5LzFQT1pXN0ZzeUhXN3hnTVVoOFBaTHBNUnRPbFRHMVFySG1UTkYz?=
 =?utf-8?B?bi9wdWF3dTVzZkZCRllFRkhCSEcrTlNSVmtpTTBCYXZ5MkdXZlNzM251L1NW?=
 =?utf-8?B?d01PZGw0TGhlMlRCam83dUVFVWZnYTZrT05UTXF2TTl5djFaT2ZUN1ppYlRH?=
 =?utf-8?B?MWY5Y3crQ2tyUXEvaW9BTHJpYWduUTN6Y1Q2L09MbVJUWHFvSDNLaUFNQXdW?=
 =?utf-8?B?NFF0alZYam1nQWVPZEhQbG4rWlJ3aFZLbEVEcE4zaFZaL24rUVZmb2ExWlNF?=
 =?utf-8?B?dmV4THNTWk92YVIyNjcwOUY3cElKRGVlNEpLSGpKTkYwc01yRDVaeXBaUXQv?=
 =?utf-8?B?UU1JWXhNTGRscHVocVFLQm13cm5wcUdMcXEvd3grK01jUEU4ZHJiNWZIT3VD?=
 =?utf-8?B?aElvMmI5S29YVWEzN1hpRzhnNDBPYWFvZFduMC8xamlXc2RsZVdtQVlYeGV1?=
 =?utf-8?B?LzN3NGNoRGFWY1NVM0Z6dC8vemtBa1Y5ZFVldlh0ZHIveHZ1dTB0VkhhZWt5?=
 =?utf-8?B?aFB1elVzZE54WkVaOHUwZGN1U0Y2bThtak5VeXJyZ29sT3pQMGQrOHVQZ0g2?=
 =?utf-8?B?aVQrQ1JoME55SnBsQ2hBbVZ2WXM2SG95cUU0VDBjLzAxMFIzMFdrRk53ZTRZ?=
 =?utf-8?B?MXpoRUFNMmsycGJjZStOVC9SYmpkZVFIRXJEZno3WXdZRnZXb0VaZ3pReHlX?=
 =?utf-8?B?azJCV3liaGlKZHh3WS8vWStxWm83ZVdmdS9PYjl2bFB2Z3I2WU5uelFJWXZy?=
 =?utf-8?B?cTF5Mm5qT25TekUrbEVVcThJcmh1ZzN4cjVwcmg3NWhGdzN1aDhlVEt6NklX?=
 =?utf-8?B?aEJlTnVnU0VQSXRaS0RPeFdQWStBNFJVYUY2QjRUNmlGOVQxYitIVjBRa0FB?=
 =?utf-8?B?TEVabVZOcktGYVBEeW5OSHkyVkpLcjdjaGVGOGNid2pnMm1kaXFkd0Nid0dO?=
 =?utf-8?B?RGN0Ti9ORURQN3dvK20xTEl2TGZtUnN5V3Jsb1A1MWtReEpyVnJmWU1mbnVU?=
 =?utf-8?B?TmtWV1F4VUZ1RkxSbStqeUpXWTFmVWk3RmdIZ2c5U3NOcmkzMXpOOHZ5dGwz?=
 =?utf-8?B?akpPWW1NcEhWRUQ5OXdjeTAwSlJ5TytCRi9kNk1zSXMzVXJoNCtCeFdxcWxC?=
 =?utf-8?B?UXJPZDlDU2Y3NE9sT1hwRk45Q0ticW13L0tzTXFuMUVUUnhUT0tjZU1nd0ZE?=
 =?utf-8?B?VUxJT3g3VEtPM3BaSjJYZ1dra3VreWtMdjZFWTdyVWlGYXJKZU5LbitudlRV?=
 =?utf-8?B?VjBwNTgyL0xWeGFpYzZaZEM4N0xNNnFVVFFYN2Z2bDFRdno2cjRRMGFzaEJl?=
 =?utf-8?Q?TPgXsnCqADNIHiGTg/BHrjw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979c54f3-86d8-413d-5d59-08d9b64f5278
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 11:23:25.3286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFrKd2f9rVxbEXrdUPzgeKaODOG8yHCXBRvlbMuP44mTp5qwCoZZOHQmh6qfqlC5zDJ5Q68mQFXfSOmPvB7cDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

This is specified (and asserted for in a number of places) to always be
CS. Passing this as an argument in various places is therefore
pointless. The price to pay is two simple new functions, with the
benefit of the PTWR case now gaining a more appropriate error code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In principle in the PTWR case I think we ought to set PFEC_insn_fetch in
the error code only when NX is seen as available by the guest. Otoh I'd
kind of expect x86_emul_pagefault() to abstract away this detail.
Thoughts?

Note: While probably trivial to re-base ahead, for now this depends on
      "x86emul: a few small steps towards disintegration"
      (https://lists.xen.org/archives/html/xen-devel/2021-08/msg00367.html).

--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
@@ -197,14 +197,11 @@ static int fuzz_read_io(
 }
 
 static int fuzz_insn_fetch(
-    enum x86_segment seg,
     unsigned long offset,
     void *p_data,
     unsigned int bytes,
     struct x86_emulate_ctxt *ctxt)
 {
-    assert(seg == x86_seg_cs);
-
     /* Minimal segment limit checking, until full one is being put in place. */
     if ( ctxt->addr_size < 64 && (offset >> 32) )
     {
@@ -222,7 +219,7 @@ static int fuzz_insn_fetch(
         return maybe_fail(ctxt, "insn_fetch", true);
     }
 
-    return data_read(ctxt, seg, "insn_fetch", p_data, bytes);
+    return data_read(ctxt, x86_seg_cs, "insn_fetch", p_data, bytes);
 }
 
 static int _fuzz_rep_read(struct x86_emulate_ctxt *ctxt,
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2049,8 +2049,7 @@ static void print_insn(const uint8_t *in
 
 void do_test(uint8_t *instr, unsigned int len, unsigned int modrm,
              enum mem_access mem, struct x86_emulate_ctxt *ctxt,
-             int (*fetch)(enum x86_segment seg,
-                          unsigned long offset,
+             int (*fetch)(unsigned long offset,
                           void *p_data,
                           unsigned int bytes,
                           struct x86_emulate_ctxt *ctxt))
@@ -2110,8 +2109,7 @@ void do_test(uint8_t *instr, unsigned in
 }
 
 void predicates_test(void *instr, struct x86_emulate_ctxt *ctxt,
-                     int (*fetch)(enum x86_segment seg,
-                                  unsigned long offset,
+                     int (*fetch)(unsigned long offset,
                                   void *p_data,
                                   unsigned int bytes,
                                   struct x86_emulate_ctxt *ctxt))
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -594,14 +594,13 @@ static int read(
 }
 
 static int fetch(
-    enum x86_segment seg,
     unsigned long offset,
     void *p_data,
     unsigned int bytes,
     struct x86_emulate_ctxt *ctxt)
 {
     if ( verbose )
-        printf("** %s(%u, %p,, %u,)\n", __func__, seg, (void *)offset, bytes);
+        printf("** %s(CS:%p,, %u,)\n", __func__, (void *)offset, bytes);
 
     memcpy(p_data, (void *)offset, bytes);
     return X86EMUL_OKAY;
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -113,8 +113,7 @@ WRAP(puts);
 void evex_disp8_test(void *instr, struct x86_emulate_ctxt *ctxt,
                      const struct x86_emulate_ops *ops);
 void predicates_test(void *instr, struct x86_emulate_ctxt *ctxt,
-                     int (*fetch)(enum x86_segment seg,
-                                  unsigned long offset,
+                     int (*fetch)(unsigned long offset,
                                   void *p_data,
                                   unsigned int bytes,
                                   struct x86_emulate_ctxt *ctxt));
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1294,7 +1294,6 @@ static int hvmemul_read(
 }
 
 int hvmemul_insn_fetch(
-    enum x86_segment seg,
     unsigned long offset,
     void *p_data,
     unsigned int bytes,
@@ -1312,7 +1311,7 @@ int hvmemul_insn_fetch(
     if ( !bytes ||
          unlikely((insn_off + bytes) > hvmemul_ctxt->insn_buf_bytes) )
     {
-        int rc = __hvmemul_read(seg, offset, p_data, bytes,
+        int rc = __hvmemul_read(x86_seg_cs, offset, p_data, bytes,
                                 hvm_access_insn_fetch, hvmemul_ctxt);
 
         if ( rc == X86EMUL_OKAY && bytes )
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -162,8 +162,7 @@ hvm_emulate_read(enum x86_segment seg,
 }
 
 static int
-hvm_emulate_insn_fetch(enum x86_segment seg,
-                       unsigned long offset,
+hvm_emulate_insn_fetch(unsigned long offset,
                        void *p_data,
                        unsigned int bytes,
                        struct x86_emulate_ctxt *ctxt)
@@ -172,11 +171,9 @@ hvm_emulate_insn_fetch(enum x86_segment
         container_of(ctxt, struct sh_emulate_ctxt, ctxt);
     unsigned int insn_off = offset - sh_ctxt->insn_buf_eip;
 
-    ASSERT(seg == x86_seg_cs);
-
     /* Fall back if requested bytes are not in the prefetch cache. */
     if ( unlikely((insn_off + bytes) > sh_ctxt->insn_buf_bytes) )
-        return hvm_read(seg, offset, p_data, bytes,
+        return hvm_read(x86_seg_cs, offset, p_data, bytes,
                         hvm_access_insn_fetch, sh_ctxt);
 
     /* Hit the cache. Simple memcpy. */
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -163,6 +163,12 @@ static int read_mem(enum x86_segment seg
     return X86EMUL_OKAY;
 }
 
+static int fetch(unsigned long offset, void *p_data,
+                 unsigned int bytes, struct x86_emulate_ctxt *ctxt)
+{
+    return read_mem(x86_seg_cs, offset, p_data, bytes, ctxt);
+}
+
 void pv_emulate_gate_op(struct cpu_user_regs *regs)
 {
     struct vcpu *v = current;
@@ -205,7 +211,7 @@ void pv_emulate_gate_op(struct cpu_user_
 
     ctxt.ctxt.addr_size = ar & _SEGMENT_DB ? 32 : 16;
     /* Leave zero in ctxt.ctxt.sp_size, as it's not needed for decoding. */
-    state = x86_decode_insn(&ctxt.ctxt, read_mem);
+    state = x86_decode_insn(&ctxt.ctxt, fetch);
     ctxt.insn_fetch = false;
     if ( IS_ERR_OR_NULL(state) )
     {
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1258,8 +1258,7 @@ static int validate(const struct x86_emu
     return X86EMUL_UNHANDLEABLE;
 }
 
-static int insn_fetch(enum x86_segment seg,
-                      unsigned long offset,
+static int insn_fetch(unsigned long offset,
                       void *p_data,
                       unsigned int bytes,
                       struct x86_emulate_ctxt *ctxt)
@@ -1269,8 +1268,6 @@ static int insn_fetch(enum x86_segment s
     unsigned int rc;
     unsigned long addr = poc->cs.base + offset;
 
-    ASSERT(seg == x86_seg_cs);
-
     /* We don't mean to emulate any branches. */
     if ( !bytes )
         return X86EMUL_UNHANDLEABLE;
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -52,6 +52,21 @@ static int ptwr_emulated_read(enum x86_s
     return X86EMUL_OKAY;
 }
 
+static int ptwr_emulated_insn_fetch(unsigned long offset,
+                                    void *p_data, unsigned int bytes,
+                                    struct x86_emulate_ctxt *ctxt)
+{
+    unsigned int rc = copy_from_guest_pv(p_data, (void *)offset, bytes);
+
+    if ( rc )
+    {
+        x86_emul_pagefault(PFEC_insn_fetch, offset + bytes - rc, ctxt);
+        return X86EMUL_EXCEPTION;
+    }
+
+    return X86EMUL_OKAY;
+}
+
 /*
  * p_old being NULL indicates a plain write to occur, while a non-NULL
  * input requests a CMPXCHG-based update.
@@ -247,7 +262,7 @@ static int ptwr_emulated_cmpxchg(enum x8
 
 static const struct x86_emulate_ops ptwr_emulate_ops = {
     .read       = ptwr_emulated_read,
-    .insn_fetch = ptwr_emulated_read,
+    .insn_fetch = ptwr_emulated_insn_fetch,
     .write      = ptwr_emulated_write,
     .cmpxchg    = ptwr_emulated_cmpxchg,
     .validate   = pv_emul_is_mem_write,
@@ -290,14 +305,14 @@ static int ptwr_do_page_fault(struct x86
 
 static const struct x86_emulate_ops mmio_ro_emulate_ops = {
     .read       = x86emul_unhandleable_rw,
-    .insn_fetch = ptwr_emulated_read,
+    .insn_fetch = ptwr_emulated_insn_fetch,
     .write      = mmio_ro_emulated_write,
     .validate   = pv_emul_is_mem_write,
 };
 
 static const struct x86_emulate_ops mmcfg_intercept_ops = {
     .read       = x86emul_unhandleable_rw,
-    .insn_fetch = ptwr_emulated_read,
+    .insn_fetch = ptwr_emulated_insn_fetch,
     .write      = mmcfg_intercept_write,
     .validate   = pv_emul_is_mem_write,
 };
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -34,8 +34,7 @@ struct x86_emulate_state *
 x86_decode_insn(
     struct x86_emulate_ctxt *ctxt,
     int (*insn_fetch)(
-        enum x86_segment seg, unsigned long offset,
-        void *p_data, unsigned int bytes,
+        unsigned long offset, void *p_data, unsigned int bytes,
         struct x86_emulate_ctxt *ctxt))
 {
     static DEFINE_PER_CPU(struct x86_emulate_state, state);
@@ -618,7 +617,7 @@ static unsigned int decode_disp8scale(en
    generate_exception_if((uint8_t)(s->ip -                            \
                                    ctxt->regs->r(ip)) > MAX_INST_LEN, \
                          X86_EXC_GP, 0);                              \
-   rc = ops->insn_fetch(x86_seg_cs, _ip, &_x, _size, ctxt);           \
+   rc = ops->insn_fetch(_ip, &_x, _size, ctxt);                       \
    if ( rc ) goto done;                                               \
    _x;                                                                \
 })
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -357,7 +357,7 @@ do {
         ip = (uint16_t)ip;                                              \
     else if ( !mode_64bit() )                                           \
         ip = (uint32_t)ip;                                              \
-    rc = ops->insn_fetch(x86_seg_cs, ip, NULL, 0, ctxt);                \
+    rc = ops->insn_fetch(ip, NULL, 0, ctxt);                            \
     if ( rc ) goto done;                                                \
     _regs.r(ip) = ip;                                                   \
     singlestep = _regs.eflags & X86_EFLAGS_TF;                          \
@@ -2301,7 +2301,7 @@ x86_emulate(
                    ? 8 : op_bytes;
         if ( (rc = read_ulong(x86_seg_ss, sp_post_inc(op_bytes + src.val),
                               &dst.val, op_bytes, ctxt, ops)) != 0 ||
-             (rc = ops->insn_fetch(x86_seg_cs, dst.val, NULL, 0, ctxt)) )
+             (rc = ops->insn_fetch(dst.val, NULL, 0, ctxt)) )
             goto done;
         _regs.r(ip) = dst.val;
         adjust_bnd(ctxt, ops, vex.pfx);
@@ -2822,14 +2822,14 @@ x86_emulate(
             break;
         case 2: /* call (near) */
             dst.val = _regs.r(ip);
-            if ( (rc = ops->insn_fetch(x86_seg_cs, src.val, NULL, 0, ctxt)) )
+            if ( (rc = ops->insn_fetch(src.val, NULL, 0, ctxt)) )
                 goto done;
             _regs.r(ip) = src.val;
             src.val = dst.val;
             adjust_bnd(ctxt, ops, vex.pfx);
             goto push;
         case 4: /* jmp (near) */
-            if ( (rc = ops->insn_fetch(x86_seg_cs, src.val, NULL, 0, ctxt)) )
+            if ( (rc = ops->insn_fetch(src.val, NULL, 0, ctxt)) )
                 goto done;
             _regs.r(ip) = src.val;
             dst.type = OP_NONE;
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -254,13 +254,12 @@ struct x86_emulate_ops
 
     /*
      * insn_fetch: Emulate fetch from instruction byte stream.
-     *  Except for @bytes, all parameters are the same as for 'read'.
+     *  Except for @bytes and missing @seg, all parameters are the same as for
+     *  'read'.
      *  @bytes: Access length (0 <= @bytes < 16, with zero meaning
      *  "validate address only").
-     *  @seg is always x86_seg_cs.
      */
     int (*insn_fetch)(
-        enum x86_segment seg,
         unsigned long offset,
         void *p_data,
         unsigned int bytes,
@@ -750,8 +749,7 @@ struct x86_emulate_state *
 x86_decode_insn(
     struct x86_emulate_ctxt *ctxt,
     int (*insn_fetch)(
-        enum x86_segment seg, unsigned long offset,
-        void *p_data, unsigned int bytes,
+        unsigned long offset, void *p_data, unsigned int bytes,
         struct x86_emulate_ctxt *ctxt));
 
 unsigned int
--- a/xen/include/asm-x86/hvm/emulate.h
+++ b/xen/include/asm-x86/hvm/emulate.h
@@ -92,8 +92,7 @@ static inline bool handle_mmio(void)
     return hvm_emulate_one_insn(x86_insn_is_mem_access, "MMIO");
 }
 
-int hvmemul_insn_fetch(enum x86_segment seg,
-                       unsigned long offset,
+int hvmemul_insn_fetch(unsigned long offset,
                        void *p_data,
                        unsigned int bytes,
                        struct x86_emulate_ctxt *ctxt);


