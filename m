Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3FB54C57D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:09:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349883.576067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1PxA-0007fm-0r; Wed, 15 Jun 2022 10:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349883.576067; Wed, 15 Jun 2022 10:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Px9-0007dm-TW; Wed, 15 Jun 2022 10:08:47 +0000
Received: by outflank-mailman (input) for mailman id 349883;
 Wed, 15 Jun 2022 10:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1PpS-0002HV-Qb
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:00:51 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe06::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 081b40d1-ec92-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:00:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8981.eurprd04.prod.outlook.com (2603:10a6:10:2e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 10:00:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:00:46 +0000
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
X-Inumbo-ID: 081b40d1-ec92-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsjuKNgqvmeV7oaBwKYLSE3sA8fTrVtd50A8+TyqB2lhkHlzLM+rZDmfKHaqFUsqZmieUh/wKfQwvE7w29EJSuyKB0JgzydYszi4Offz2k9qSNdn0iq03H+9Yp8HfqGr//A61UfkTOYoUGYthqo93qo5SQrI96cgu65thXDUh1fUX8A0vmrruQ3wQporueG014P49rM15KRh33oSnRDemFWF3/gvaSoalLau/+EQFzwEEQCDBiM4lfDZx30tjKWHGPm2oIR9QJCX8VFFlXNJV89QVew7TmJ+IXOQ9pYbKv5kljs69/sMeDmgCSOx37MY30QJnlYsUTw0VDTnX+DmwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGTVbbNaA6ED01gQ8SQkg/aYpiFfNFnjBETt1TyhgK4=;
 b=oUvw0DGBWHdwsWC3ywv9gX3U54Sii92z71blG90ePIVljt5UA0fPX2SrMJwxLj9SFmRtk71NkoWaV4i38wNVoXYMGZTII9bP/wFnSVCCDdl9Zi5zGaJwWFKsaJY3H6/KcxIzSm5SkfyzOuEQSbzVzugGeUs8+OarEhwXha4MfxaLyaA7KKptYa2Fn4GbOG44L0oj1GXkHBGc0wNk2PTZPkHmeKbRQI9vBOlUixUyls1SaX+x1M3AqDWXT1U9bpDnoQv1RE2Z0eVTgInPpsskf84LDk0j1QTxhRsupNL6vM55SOa1YThVfdyLlL19wvR5fcoRXGjA/UEaYi+sjySs/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGTVbbNaA6ED01gQ8SQkg/aYpiFfNFnjBETt1TyhgK4=;
 b=eK1pNgeV2DaqxxbwTmI6gEs0TEgnks6u7P4x0gCTw/JywZOO9aT2IHtZpKQHNTEV5QLKUosgSrNWVza5NpylkV6rpLW7vfX6WcrIHgKLTCAnwYO0S/M9fB+7TxXuvKjk2DXqr6CABet/y5/VnZbLmm/LGQpU3CSP6XOVIIBwd1Hb7ZJKSIJefUO1Z0LWz2YyJuxwTQ+7OXBos8k+qgWmemaon9JPQZn0m349vHrf4/MMsiCmjlx8gOF2eKegBZgFjoj9jHbgrk7z0MBlvhO8NIaLn4eZKrd0wUb88lkKvEFXt0L43Qnz9mShhoE8FQgwRprVxOhMgM2riCiTZY1ElQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e909ff6c-9339-3de6-1eef-24cb65eb7e74@suse.com>
Date: Wed, 15 Jun 2022 12:00:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 6/8] x86emul: move x86_emul_blk() to separate source file
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
In-Reply-To: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27f3b43a-a183-4b12-53ce-08da4eb5eb05
X-MS-TrafficTypeDiagnostic: DU2PR04MB8981:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB89810FCC5CA0721F2DFE6F5BB3AD9@DU2PR04MB8981.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NZWINzKtRx6DaBKXeSKYSTZ5fD2YtVnpFwb67hRXM6Ijpb7+f3pyD04Ju50+8IMff2uj6bYlnCBWEkyTvgj/i1CTY/42e6L/aw/v4TGOpl+kLZxPQ8tPSPDBm7gzr5NLpVGQrEK2H+j25fXt2R2uqckdBaqqgBWbX/f4xKf0QQwBQckCN8y++QnNrgdAZGFz6r13paIXZLCPmaSp5hRFj2lMtbwNrE/zq/HD90dz8UagOnpbB/a2K+/nvZ7mOVAatcYXBz+PP8r0ZrLt7A35SaDN3RsvyAJ36S4D56EXmeZKz4KLDoO3XNwg+d8ujrYQTrtl/50xMGxiCK/NwwITm63zi2sXmXSHgko97SCq/LAG1zKTRPMOsEguChyQHS95qOa/7N++T1U8JBCK/lpoUUrWVfumcazjYuEiglDHUZ1L/pekvN6v8+novPd0ETcsdU8xCahQirhB8/wq/PH3FKADP6mTdMevj2EBoK1sbZXUMAKo788WS/AUhdE92lrhtM/2dE3pmGSkQE+fFoHnGFz7NdkYk4kV6SGZGUCYVsRc++ks5fLrZXhzPHJP012+cil0PP1qV0sMQ7Mh2hHL07UKlXQ7HL4F6ipSqukxbd0bOKcuyvsvp0a1pTvhCg3Bk/qZKySb9qK+MQUXIUFhEcZY5XPYCpeCqx3XGF8Hzl494hYqxitFjqV7EUOSqB9buTVtxxck0sdQR9PHlgMbJ5GpL7XX0cHP1wm2vVWAnXm2HYhrZQlkpKIQ80goIzcXjSCQrXZjjq5r4jsOqCxzpi78VgcFy5+OF5KX0oDFYRFRfQkcAvGkx9yVvzkGj6l7HvRWoWTr4PayYIzDqCf80A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(83380400001)(6512007)(4326008)(26005)(54906003)(66556008)(36756003)(6506007)(316002)(186003)(31686004)(2906002)(30864003)(5660300002)(8676002)(31696002)(6916009)(86362001)(6486002)(66476007)(66946007)(508600001)(2616005)(8936002)(38100700002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzFGdXFYMkVJZ0hBVVE1STVnNlczWG5lU3FXVzczcEtvY1oyYjBZUVJVek1j?=
 =?utf-8?B?b0lYbVFBdUROT2hSRnhUbEQvMnI4WlVyZjlUL20xVCt5ZlppNG43TDE1QVZp?=
 =?utf-8?B?VkpuMFRiT1BWUFdvV0I4RytWYlB0bnpUZ1NRa2o2OG9PUHZ0NWNMRGxBWFRl?=
 =?utf-8?B?TFZOVWRVYm9udUNtczNJa2lZY2ZZWFpQQTFncnZ2cE04cXRRWXpyalR2QzMy?=
 =?utf-8?B?ZFp6dTh3L0FyMTJuK2ZYVjFqNDUzSnBuSjJzVlM2cFRTMlFZZnRlSWcxS0Ex?=
 =?utf-8?B?UzhubE9iY25LRHVBdC91YkVyNTFRVkRrRkdCcEtjMkdKVDBEMFNjUEk5WHlI?=
 =?utf-8?B?VWE5MHo0MVFTTUdNK0RNS2VTTk4vZjJmdUdlUTVsdU9zY0c0OU1iKzh3U1VB?=
 =?utf-8?B?RVJVQ0liQVhZeGhyV2VVK2hDNVFwSWhTM3YvVW1RNmRwVU9SRUxHNndwcDdx?=
 =?utf-8?B?T2NISTh3V3JYaUdKUHZUWkdaTnNWMnF4eFd3SDA5Qi94eVh2eWpUZHY5N2Vp?=
 =?utf-8?B?bGEvZ1VZdC94V05vQnlwUTJXTm9zRmxxNFdVSUpXUGRIYjJGMEpOeTFicG95?=
 =?utf-8?B?NHhPOVBsaTBWUWhDdDQxOTJhSkVyZUgrL0NrZnJKeUU2UTdVcVJ6Z3c2NVQ2?=
 =?utf-8?B?L1Y3NVNNVkoyVW1pY21QSnNBbXZrS2dmN0tiUklmMzBZYXdDRHRZZW93WWhm?=
 =?utf-8?B?dzJWOHJkaU5YVG5uZ0FuMHNNUDJzMXE5dVE4QXZncXZLZERzVEZHZkhySlhC?=
 =?utf-8?B?aFRGbG1Wa0ZQMytSZVFrbFQ5bHRibG1jYVQyVnh0QWpZRFB4NnR2YWtmQWlE?=
 =?utf-8?B?OWQ0SytGbGdHS0s5dElyZE40ZWlSZGJDQm0zM1VWRXJSTnpzQVptY1RpTklr?=
 =?utf-8?B?dk1EaE90eVh4cGc2SEhQM3lpdkZvU0kwbVdrSW1zd0xoZ3EvUjFDN3Q1bXRp?=
 =?utf-8?B?ZjJTVWVDay8xdlg1eFRmMzlLZi9rbjlrWC9Nb3R6SnhJSi9oTk5ORHJYVk5Y?=
 =?utf-8?B?QXc1U2JhdEhvcU5SdU9jNHpyN0tUZUJWOFZVc2pXZHZ4WU9aNjZMY243eitz?=
 =?utf-8?B?VEVSUVN6Zk5JYkpMc2ZWWjRhdFFCRlZ4KzBDRXFBdC8xUnRwTHlpUHgwN3Ur?=
 =?utf-8?B?MnE0cU5iUmRkREl1T25IeC9tZjRQUWZHR25GcWdvaDRudEF4SzNkVVh3ZCtT?=
 =?utf-8?B?aWo3VDlZTmF2L05FUGlIeVkzKy9qWS9TZGtUOHZmUzN0OTJ3MVZCT0xScGNy?=
 =?utf-8?B?STVyaXRCa2t6SHFTVTR1SkJhMUpaRXk0dGd0UGJoNFZTc3hCalhES2laZjBJ?=
 =?utf-8?B?K2d4TzQzbGJoSEgwUStlR3Nya2ZjbzdXWmUrSUN5ZHdQUFE0TkZGWXF5YnZo?=
 =?utf-8?B?M1l3K2thNDlUNDhuMG1iOU5VU1Mzci81bDdMbTQ1N1BXMHJ4RjgySDNIS0xH?=
 =?utf-8?B?TWIrdzR1dzl1MDJwbXRHaTljeit4WkhKQ2tRQjAwUml6N0R2NUtnMkg5VVd4?=
 =?utf-8?B?UnZDM2QyTEd2UTdSa2lhU2liQWpseEN6U3E0MEU1OW54SEFDSG1sTVpYaEdY?=
 =?utf-8?B?Rnl0ZHp2UXczRWlWSUJFMWlObXUySFFsMEg2U0NXellVdWptVm14TUVJMDJI?=
 =?utf-8?B?RmlBenRjMU5USWVHRDZGZlNaNjJ1N0hRNkZnVXN2NERtRTBvQ0dCOE5xQTN0?=
 =?utf-8?B?YXU1ZDZYVGYvSFJaVUNGYlJ0Yy84N0d1LzkvRk4wV1B3dHhBdjJBd201dGt5?=
 =?utf-8?B?SjlhemhBZ3RBbXYybzFCTDJLeDhiVlI3amRqODBaQ3hNbVJaRjdNMDFmVmFG?=
 =?utf-8?B?SlR6YkN6MkNmdDI4OGt2WllPTGdPblN6YlcwTStqby9sZ1daV3B6a3dHdEx1?=
 =?utf-8?B?WDRZRXd6YXpPZjFjWUJFencxK1c4U1JIakdGWDhjQ21zbGlRMHMyZk1hVS8r?=
 =?utf-8?B?V1A4NHNqcVFGRmNUTlFIWFNrcktENExoazhRRXMvajZBbVl2dE9aZXVqb3Zj?=
 =?utf-8?B?b2FwNFl2YWpTb2FsNE1hN1hTWFRpYWEyQ0hQOGV4N2xnMUp0NWpDS2NFcE1h?=
 =?utf-8?B?Y1BFVWtXVFZCb1JjamNFcEJ4OXgvR1JraFpYdWdMOFJJME9NUjBNU1hocW9o?=
 =?utf-8?B?OHJsTUVuZ0wyUzY0Z0F3VjZmQ2ZsVkQrcGljeWQ3TnNDTFFxQkE2NERsa1BU?=
 =?utf-8?B?b2pKcDZUMHBQMFBaaVp1NWhkMHFUVHJZaW5MM1kyRVY5TmlIN1VNZEswaWlV?=
 =?utf-8?B?N2tCMWV4WGR2MTFvNC9pMng0L21JUkR1SEVQNzZxVitBeTRaL3hCR29oQjZ4?=
 =?utf-8?B?ZnhQMncxOWFxME41b0x4TUMwQVhINmhzSlJJK05CMWwwZGkvQVpOZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f3b43a-a183-4b12-53ce-08da4eb5eb05
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:00:46.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vbZG7irrysk3aW8IEduu4EfESd8YUjDzkCgSOhG15SXbQvoljRfWvWUGxWbrM7rEEhVjccUPYyC2onl4qW0xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8981

The function is already non-trivial and is expected to further grow.

Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
by X86_EXC_* (such that EXC_* don't need to move as well; we want these
to be phased out anyway).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base.

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -252,7 +252,7 @@ endif # 32-bit override
 
 OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
-OBJS += x86_emulate/decode.o x86_emulate/fpu.o
+OBJS += x86_emulate/blk.o x86_emulate/decode.o x86_emulate/fpu.o
 
 $(TARGET): $(OBJS)
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -85,6 +85,8 @@ bool emul_test_init(void);
 void emul_save_fpu_state(void);
 void emul_restore_fpu_state(void);
 
+struct x86_fxsr *get_fpu_save_area(void);
+
 /*
  * In order to reasonably use the above, wrap library calls we use and which we
  * think might access any of the FPU state into wrappers saving/restoring state
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -24,8 +24,6 @@
 #define cpu_has_amd_erratum(nr) \
         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
 
-#define FXSAVE_AREA current->arch.fpu_ctxt
-
 #include "x86_emulate/x86_emulate.c"
 
 int cf_check x86emul_read_xcr(
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -1,5 +1,6 @@
 obj-y += 0f01.o
 obj-y += 0fae.o
 obj-y += 0fc7.o
+obj-y += blk.o
 obj-y += decode.o
 obj-$(CONFIG_HVM) += fpu.o
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -0,0 +1,396 @@
+/******************************************************************************
+ * blk.c - helper for x86_emulate.c
+ *
+ * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "private.h"
+
+#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
+    !defined(X86EMUL_NO_SIMD)
+# ifdef __XEN__
+#  include <asm/xstate.h>
+#  define FXSAVE_AREA current->arch.fpu_ctxt
+# else
+#  define FXSAVE_AREA get_fpu_save_area()
+# endif
+#endif
+
+int x86_emul_blk(
+    void *ptr,
+    void *data,
+    unsigned int bytes,
+    uint32_t *eflags,
+    struct x86_emulate_state *s,
+    struct x86_emulate_ctxt *ctxt)
+{
+    int rc = X86EMUL_OKAY;
+
+    switch ( s->blk )
+    {
+        bool zf;
+#ifndef X86EMUL_NO_FPU
+        struct {
+            struct x87_env32 env;
+            struct {
+               uint8_t bytes[10];
+            } freg[8];
+        } fpstate;
+#endif
+
+        /*
+         * Throughout this switch(), memory clobbers are used to compensate
+         * that other operands may not properly express the (full) memory
+         * ranges covered.
+         */
+    case blk_enqcmd:
+        ASSERT(bytes == 64);
+        if ( ((unsigned long)ptr & 0x3f) )
+        {
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+        *eflags &= ~EFLAGS_MASK;
+#ifdef HAVE_AS_ENQCMD
+        asm ( "enqcmds (%[src]), %[dst]" ASM_FLAG_OUT(, "; setz %[zf]")
+              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
+              : [src] "r" (data), [dst] "r" (ptr) : "memory" );
+#else
+        /* enqcmds (%rsi), %rdi */
+        asm ( ".byte 0xf3, 0x0f, 0x38, 0xf8, 0x3e"
+              ASM_FLAG_OUT(, "; setz %[zf]")
+              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
+              : "S" (data), "D" (ptr) : "memory" );
+#endif
+        if ( zf )
+            *eflags |= X86_EFLAGS_ZF;
+        break;
+
+#ifndef X86EMUL_NO_FPU
+
+    case blk_fld:
+        ASSERT(!data);
+
+        /* s->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
+        switch ( bytes )
+        {
+        case sizeof(fpstate.env): /* 32-bit FLDENV */
+        case sizeof(fpstate):     /* 32-bit FRSTOR */
+            memcpy(&fpstate.env, ptr, sizeof(fpstate.env));
+            if ( !s->rex_prefix )
+            {
+                /* Convert 32-bit real/vm86 to 32-bit prot format. */
+                unsigned int fip = fpstate.env.mode.real.fip_lo +
+                                   (fpstate.env.mode.real.fip_hi << 16);
+                unsigned int fdp = fpstate.env.mode.real.fdp_lo +
+                                   (fpstate.env.mode.real.fdp_hi << 16);
+                unsigned int fop = fpstate.env.mode.real.fop;
+
+                fpstate.env.mode.prot.fip = fip & 0xf;
+                fpstate.env.mode.prot.fcs = fip >> 4;
+                fpstate.env.mode.prot.fop = fop;
+                fpstate.env.mode.prot.fdp = fdp & 0xf;
+                fpstate.env.mode.prot.fds = fdp >> 4;
+            }
+
+            if ( bytes == sizeof(fpstate.env) )
+                ptr = NULL;
+            else
+                ptr += sizeof(fpstate.env);
+            break;
+
+        case sizeof(struct x87_env16):                        /* 16-bit FLDENV */
+        case sizeof(struct x87_env16) + sizeof(fpstate.freg): /* 16-bit FRSTOR */
+        {
+            const struct x87_env16 *env = ptr;
+
+            fpstate.env.fcw = env->fcw;
+            fpstate.env.fsw = env->fsw;
+            fpstate.env.ftw = env->ftw;
+
+            if ( s->rex_prefix )
+            {
+                /* Convert 16-bit prot to 32-bit prot format. */
+                fpstate.env.mode.prot.fip = env->mode.prot.fip;
+                fpstate.env.mode.prot.fcs = env->mode.prot.fcs;
+                fpstate.env.mode.prot.fdp = env->mode.prot.fdp;
+                fpstate.env.mode.prot.fds = env->mode.prot.fds;
+                fpstate.env.mode.prot.fop = 0; /* unknown */
+            }
+            else
+            {
+                /* Convert 16-bit real/vm86 to 32-bit prot format. */
+                unsigned int fip = env->mode.real.fip_lo +
+                                   (env->mode.real.fip_hi << 16);
+                unsigned int fdp = env->mode.real.fdp_lo +
+                                   (env->mode.real.fdp_hi << 16);
+                unsigned int fop = env->mode.real.fop;
+
+                fpstate.env.mode.prot.fip = fip & 0xf;
+                fpstate.env.mode.prot.fcs = fip >> 4;
+                fpstate.env.mode.prot.fop = fop;
+                fpstate.env.mode.prot.fdp = fdp & 0xf;
+                fpstate.env.mode.prot.fds = fdp >> 4;
+            }
+
+            if ( bytes == sizeof(*env) )
+                ptr = NULL;
+            else
+                ptr += sizeof(*env);
+            break;
+        }
+
+        default:
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+
+        if ( ptr )
+        {
+            memcpy(fpstate.freg, ptr, sizeof(fpstate.freg));
+            asm volatile ( "frstor %0" :: "m" (fpstate) );
+        }
+        else
+            asm volatile ( "fldenv %0" :: "m" (fpstate.env) );
+        break;
+
+    case blk_fst:
+        ASSERT(!data);
+
+        /* Don't chance consuming uninitialized data. */
+        memset(&fpstate, 0, sizeof(fpstate));
+        if ( bytes > sizeof(fpstate.env) )
+            asm ( "fnsave %0" : "+m" (fpstate) );
+        else
+            asm ( "fnstenv %0" : "+m" (fpstate.env) );
+
+        /* s->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
+        switch ( bytes )
+        {
+        case sizeof(fpstate.env): /* 32-bit FNSTENV */
+        case sizeof(fpstate):     /* 32-bit FNSAVE */
+            if ( !s->rex_prefix )
+            {
+                /* Convert 32-bit prot to 32-bit real/vm86 format. */
+                unsigned int fip = fpstate.env.mode.prot.fip +
+                                   (fpstate.env.mode.prot.fcs << 4);
+                unsigned int fdp = fpstate.env.mode.prot.fdp +
+                                   (fpstate.env.mode.prot.fds << 4);
+                unsigned int fop = fpstate.env.mode.prot.fop;
+
+                memset(&fpstate.env.mode, 0, sizeof(fpstate.env.mode));
+                fpstate.env.mode.real.fip_lo = fip;
+                fpstate.env.mode.real.fip_hi = fip >> 16;
+                fpstate.env.mode.real.fop = fop;
+                fpstate.env.mode.real.fdp_lo = fdp;
+                fpstate.env.mode.real.fdp_hi = fdp >> 16;
+            }
+            memcpy(ptr, &fpstate.env, sizeof(fpstate.env));
+            if ( bytes == sizeof(fpstate.env) )
+                ptr = NULL;
+            else
+                ptr += sizeof(fpstate.env);
+            break;
+
+        case sizeof(struct x87_env16):                        /* 16-bit FNSTENV */
+        case sizeof(struct x87_env16) + sizeof(fpstate.freg): /* 16-bit FNSAVE */
+            if ( s->rex_prefix )
+            {
+                /* Convert 32-bit prot to 16-bit prot format. */
+                struct x87_env16 *env = ptr;
+
+                env->fcw = fpstate.env.fcw;
+                env->fsw = fpstate.env.fsw;
+                env->ftw = fpstate.env.ftw;
+                env->mode.prot.fip = fpstate.env.mode.prot.fip;
+                env->mode.prot.fcs = fpstate.env.mode.prot.fcs;
+                env->mode.prot.fdp = fpstate.env.mode.prot.fdp;
+                env->mode.prot.fds = fpstate.env.mode.prot.fds;
+            }
+            else
+            {
+                /* Convert 32-bit prot to 16-bit real/vm86 format. */
+                unsigned int fip = fpstate.env.mode.prot.fip +
+                                   (fpstate.env.mode.prot.fcs << 4);
+                unsigned int fdp = fpstate.env.mode.prot.fdp +
+                                   (fpstate.env.mode.prot.fds << 4);
+                struct x87_env16 env = {
+                    .fcw = fpstate.env.fcw,
+                    .fsw = fpstate.env.fsw,
+                    .ftw = fpstate.env.ftw,
+                    .mode.real.fip_lo = fip,
+                    .mode.real.fip_hi = fip >> 16,
+                    .mode.real.fop = fpstate.env.mode.prot.fop,
+                    .mode.real.fdp_lo = fdp,
+                    .mode.real.fdp_hi = fdp >> 16
+                };
+
+                memcpy(ptr, &env, sizeof(env));
+            }
+            if ( bytes == sizeof(struct x87_env16) )
+                ptr = NULL;
+            else
+                ptr += sizeof(struct x87_env16);
+            break;
+
+        default:
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+
+        if ( ptr )
+            memcpy(ptr, fpstate.freg, sizeof(fpstate.freg));
+        break;
+
+#endif /* X86EMUL_NO_FPU */
+
+#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
+    !defined(X86EMUL_NO_SIMD)
+
+    case blk_fxrstor:
+    {
+        struct x86_fxsr *fxsr = FXSAVE_AREA;
+
+        ASSERT(!data);
+        ASSERT(bytes == sizeof(*fxsr));
+        ASSERT(s->op_bytes <= bytes);
+
+        if ( s->op_bytes < sizeof(*fxsr) )
+        {
+            if ( s->rex_prefix & REX_W )
+            {
+                /*
+                 * The only way to force fxsaveq on a wide range of gas
+                 * versions. On older versions the rex64 prefix works only if
+                 * we force an addressing mode that doesn't require extended
+                 * registers.
+                 */
+                asm volatile ( ".byte 0x48; fxsave (%1)"
+                               : "=m" (*fxsr) : "R" (fxsr) );
+            }
+            else
+                asm volatile ( "fxsave %0" : "=m" (*fxsr) );
+        }
+
+        /*
+         * Don't chance the reserved or available ranges to contain any
+         * data FXRSTOR may actually consume in some way: Copy only the
+         * defined portion, and zero the rest.
+         */
+        memcpy(fxsr, ptr, min(s->op_bytes,
+                              (unsigned int)offsetof(struct x86_fxsr, rsvd)));
+        memset(fxsr->rsvd, 0, sizeof(*fxsr) - offsetof(struct x86_fxsr, rsvd));
+
+        generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, X86_EXC_GP, 0);
+
+        if ( s->rex_prefix & REX_W )
+        {
+            /* See above for why operand/constraints are this way. */
+            asm volatile ( ".byte 0x48; fxrstor (%1)"
+                           :: "m" (*fxsr), "R" (fxsr) );
+        }
+        else
+            asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
+        break;
+    }
+
+    case blk_fxsave:
+    {
+        struct x86_fxsr *fxsr = FXSAVE_AREA;
+
+        ASSERT(!data);
+        ASSERT(bytes == sizeof(*fxsr));
+        ASSERT(s->op_bytes <= bytes);
+
+        if ( s->op_bytes < sizeof(*fxsr) )
+            /* Don't chance consuming uninitialized data. */
+            memset(fxsr, 0, s->op_bytes);
+        else
+            fxsr = ptr;
+
+        if ( s->rex_prefix & REX_W )
+        {
+            /* See above for why operand/constraints are this way. */
+            asm volatile ( ".byte 0x48; fxsave (%1)"
+                           : "=m" (*fxsr) : "R" (fxsr) );
+        }
+        else
+            asm volatile ( "fxsave %0" : "=m" (*fxsr) );
+
+        if ( fxsr != ptr ) /* i.e. s->op_bytes < sizeof(*fxsr) */
+            memcpy(ptr, fxsr, s->op_bytes);
+        break;
+    }
+
+#endif /* X86EMUL_NO_{FPU,MMX,SIMD} */
+
+    case blk_movdir:
+        switch ( bytes )
+        {
+#ifdef __x86_64__
+        case sizeof(uint32_t):
+# ifdef HAVE_AS_MOVDIR
+            asm ( "movdiri %0, (%1)"
+                  :: "r" (*(uint32_t *)data), "r" (ptr) : "memory" );
+# else
+            /* movdiri %esi, (%rdi) */
+            asm ( ".byte 0x0f, 0x38, 0xf9, 0x37"
+                  :: "S" (*(uint32_t *)data), "D" (ptr) : "memory" );
+# endif
+            break;
+#endif
+
+        case sizeof(unsigned long):
+#ifdef HAVE_AS_MOVDIR
+            asm ( "movdiri %0, (%1)"
+                  :: "r" (*(unsigned long *)data), "r" (ptr) : "memory" );
+#else
+            /* movdiri %rsi, (%rdi) */
+            asm ( ".byte 0x48, 0x0f, 0x38, 0xf9, 0x37"
+                  :: "S" (*(unsigned long *)data), "D" (ptr) : "memory" );
+#endif
+            break;
+
+        case 64:
+            if ( ((unsigned long)ptr & 0x3f) )
+            {
+                ASSERT_UNREACHABLE();
+                return X86EMUL_UNHANDLEABLE;
+            }
+#ifdef HAVE_AS_MOVDIR
+            asm ( "movdir64b (%0), %1" :: "r" (data), "r" (ptr) : "memory" );
+#else
+            /* movdir64b (%rsi), %rdi */
+            asm ( ".byte 0x66, 0x0f, 0x38, 0xf8, 0x3e"
+                  :: "S" (data), "D" (ptr) : "memory" );
+#endif
+            break;
+
+        default:
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNHANDLEABLE;
+    }
+
+ done: __maybe_unused;
+    return rc;
+
+}
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8365,371 +8365,6 @@ int x86_emul_rmw(
     return X86EMUL_OKAY;
 }
 
-int x86_emul_blk(
-    void *ptr,
-    void *data,
-    unsigned int bytes,
-    uint32_t *eflags,
-    struct x86_emulate_state *state,
-    struct x86_emulate_ctxt *ctxt)
-{
-    int rc = X86EMUL_OKAY;
-
-    switch ( state->blk )
-    {
-        bool zf;
-#ifndef X86EMUL_NO_FPU
-        struct {
-            struct x87_env32 env;
-            struct {
-               uint8_t bytes[10];
-            } freg[8];
-        } fpstate;
-#endif
-
-        /*
-         * Throughout this switch(), memory clobbers are used to compensate
-         * that other operands may not properly express the (full) memory
-         * ranges covered.
-         */
-    case blk_enqcmd:
-        ASSERT(bytes == 64);
-        if ( ((unsigned long)ptr & 0x3f) )
-        {
-            ASSERT_UNREACHABLE();
-            return X86EMUL_UNHANDLEABLE;
-        }
-        *eflags &= ~EFLAGS_MASK;
-#ifdef HAVE_AS_ENQCMD
-        asm ( "enqcmds (%[src]), %[dst]" ASM_FLAG_OUT(, "; setz %[zf]")
-              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
-              : [src] "r" (data), [dst] "r" (ptr) : "memory" );
-#else
-        /* enqcmds (%rsi), %rdi */
-        asm ( ".byte 0xf3, 0x0f, 0x38, 0xf8, 0x3e"
-              ASM_FLAG_OUT(, "; setz %[zf]")
-              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
-              : "S" (data), "D" (ptr) : "memory" );
-#endif
-        if ( zf )
-            *eflags |= X86_EFLAGS_ZF;
-        break;
-
-#ifndef X86EMUL_NO_FPU
-
-    case blk_fld:
-        ASSERT(!data);
-
-        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
-        switch ( bytes )
-        {
-        case sizeof(fpstate.env): /* 32-bit FLDENV */
-        case sizeof(fpstate):     /* 32-bit FRSTOR */
-            memcpy(&fpstate.env, ptr, sizeof(fpstate.env));
-            if ( !state->rex_prefix )
-            {
-                /* Convert 32-bit real/vm86 to 32-bit prot format. */
-                unsigned int fip = fpstate.env.mode.real.fip_lo +
-                                   (fpstate.env.mode.real.fip_hi << 16);
-                unsigned int fdp = fpstate.env.mode.real.fdp_lo +
-                                   (fpstate.env.mode.real.fdp_hi << 16);
-                unsigned int fop = fpstate.env.mode.real.fop;
-
-                fpstate.env.mode.prot.fip = fip & 0xf;
-                fpstate.env.mode.prot.fcs = fip >> 4;
-                fpstate.env.mode.prot.fop = fop;
-                fpstate.env.mode.prot.fdp = fdp & 0xf;
-                fpstate.env.mode.prot.fds = fdp >> 4;
-            }
-
-            if ( bytes == sizeof(fpstate.env) )
-                ptr = NULL;
-            else
-                ptr += sizeof(fpstate.env);
-            break;
-
-        case sizeof(struct x87_env16):                        /* 16-bit FLDENV */
-        case sizeof(struct x87_env16) + sizeof(fpstate.freg): /* 16-bit FRSTOR */
-        {
-            const struct x87_env16 *env = ptr;
-
-            fpstate.env.fcw = env->fcw;
-            fpstate.env.fsw = env->fsw;
-            fpstate.env.ftw = env->ftw;
-
-            if ( state->rex_prefix )
-            {
-                /* Convert 16-bit prot to 32-bit prot format. */
-                fpstate.env.mode.prot.fip = env->mode.prot.fip;
-                fpstate.env.mode.prot.fcs = env->mode.prot.fcs;
-                fpstate.env.mode.prot.fdp = env->mode.prot.fdp;
-                fpstate.env.mode.prot.fds = env->mode.prot.fds;
-                fpstate.env.mode.prot.fop = 0; /* unknown */
-            }
-            else
-            {
-                /* Convert 16-bit real/vm86 to 32-bit prot format. */
-                unsigned int fip = env->mode.real.fip_lo +
-                                   (env->mode.real.fip_hi << 16);
-                unsigned int fdp = env->mode.real.fdp_lo +
-                                   (env->mode.real.fdp_hi << 16);
-                unsigned int fop = env->mode.real.fop;
-
-                fpstate.env.mode.prot.fip = fip & 0xf;
-                fpstate.env.mode.prot.fcs = fip >> 4;
-                fpstate.env.mode.prot.fop = fop;
-                fpstate.env.mode.prot.fdp = fdp & 0xf;
-                fpstate.env.mode.prot.fds = fdp >> 4;
-            }
-
-            if ( bytes == sizeof(*env) )
-                ptr = NULL;
-            else
-                ptr += sizeof(*env);
-            break;
-        }
-
-        default:
-            ASSERT_UNREACHABLE();
-            return X86EMUL_UNHANDLEABLE;
-        }
-
-        if ( ptr )
-        {
-            memcpy(fpstate.freg, ptr, sizeof(fpstate.freg));
-            asm volatile ( "frstor %0" :: "m" (fpstate) );
-        }
-        else
-            asm volatile ( "fldenv %0" :: "m" (fpstate.env) );
-        break;
-
-    case blk_fst:
-        ASSERT(!data);
-
-        /* Don't chance consuming uninitialized data. */
-        memset(&fpstate, 0, sizeof(fpstate));
-        if ( bytes > sizeof(fpstate.env) )
-            asm ( "fnsave %0" : "+m" (fpstate) );
-        else
-            asm ( "fnstenv %0" : "+m" (fpstate.env) );
-
-        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
-        switch ( bytes )
-        {
-        case sizeof(fpstate.env): /* 32-bit FNSTENV */
-        case sizeof(fpstate):     /* 32-bit FNSAVE */
-            if ( !state->rex_prefix )
-            {
-                /* Convert 32-bit prot to 32-bit real/vm86 format. */
-                unsigned int fip = fpstate.env.mode.prot.fip +
-                                   (fpstate.env.mode.prot.fcs << 4);
-                unsigned int fdp = fpstate.env.mode.prot.fdp +
-                                   (fpstate.env.mode.prot.fds << 4);
-                unsigned int fop = fpstate.env.mode.prot.fop;
-
-                memset(&fpstate.env.mode, 0, sizeof(fpstate.env.mode));
-                fpstate.env.mode.real.fip_lo = fip;
-                fpstate.env.mode.real.fip_hi = fip >> 16;
-                fpstate.env.mode.real.fop = fop;
-                fpstate.env.mode.real.fdp_lo = fdp;
-                fpstate.env.mode.real.fdp_hi = fdp >> 16;
-            }
-            memcpy(ptr, &fpstate.env, sizeof(fpstate.env));
-            if ( bytes == sizeof(fpstate.env) )
-                ptr = NULL;
-            else
-                ptr += sizeof(fpstate.env);
-            break;
-
-        case sizeof(struct x87_env16):                        /* 16-bit FNSTENV */
-        case sizeof(struct x87_env16) + sizeof(fpstate.freg): /* 16-bit FNSAVE */
-            if ( state->rex_prefix )
-            {
-                /* Convert 32-bit prot to 16-bit prot format. */
-                struct x87_env16 *env = ptr;
-
-                env->fcw = fpstate.env.fcw;
-                env->fsw = fpstate.env.fsw;
-                env->ftw = fpstate.env.ftw;
-                env->mode.prot.fip = fpstate.env.mode.prot.fip;
-                env->mode.prot.fcs = fpstate.env.mode.prot.fcs;
-                env->mode.prot.fdp = fpstate.env.mode.prot.fdp;
-                env->mode.prot.fds = fpstate.env.mode.prot.fds;
-            }
-            else
-            {
-                /* Convert 32-bit prot to 16-bit real/vm86 format. */
-                unsigned int fip = fpstate.env.mode.prot.fip +
-                                   (fpstate.env.mode.prot.fcs << 4);
-                unsigned int fdp = fpstate.env.mode.prot.fdp +
-                                   (fpstate.env.mode.prot.fds << 4);
-                struct x87_env16 env = {
-                    .fcw = fpstate.env.fcw,
-                    .fsw = fpstate.env.fsw,
-                    .ftw = fpstate.env.ftw,
-                    .mode.real.fip_lo = fip,
-                    .mode.real.fip_hi = fip >> 16,
-                    .mode.real.fop = fpstate.env.mode.prot.fop,
-                    .mode.real.fdp_lo = fdp,
-                    .mode.real.fdp_hi = fdp >> 16
-                };
-
-                memcpy(ptr, &env, sizeof(env));
-            }
-            if ( bytes == sizeof(struct x87_env16) )
-                ptr = NULL;
-            else
-                ptr += sizeof(struct x87_env16);
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            return X86EMUL_UNHANDLEABLE;
-        }
-
-        if ( ptr )
-            memcpy(ptr, fpstate.freg, sizeof(fpstate.freg));
-        break;
-
-#endif /* X86EMUL_NO_FPU */
-
-#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
-    !defined(X86EMUL_NO_SIMD)
-
-    case blk_fxrstor:
-    {
-        struct x86_fxsr *fxsr = FXSAVE_AREA;
-
-        ASSERT(!data);
-        ASSERT(bytes == sizeof(*fxsr));
-        ASSERT(state->op_bytes <= bytes);
-
-        if ( state->op_bytes < sizeof(*fxsr) )
-        {
-            if ( state->rex_prefix & REX_W )
-            {
-                /*
-                 * The only way to force fxsaveq on a wide range of gas
-                 * versions. On older versions the rex64 prefix works only if
-                 * we force an addressing mode that doesn't require extended
-                 * registers.
-                 */
-                asm volatile ( ".byte 0x48; fxsave (%1)"
-                               : "=m" (*fxsr) : "R" (fxsr) );
-            }
-            else
-                asm volatile ( "fxsave %0" : "=m" (*fxsr) );
-        }
-
-        /*
-         * Don't chance the reserved or available ranges to contain any
-         * data FXRSTOR may actually consume in some way: Copy only the
-         * defined portion, and zero the rest.
-         */
-        memcpy(fxsr, ptr, min(state->op_bytes,
-                              (unsigned int)offsetof(struct x86_fxsr, rsvd)));
-        memset(fxsr->rsvd, 0, sizeof(*fxsr) - offsetof(struct x86_fxsr, rsvd));
-
-        generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, EXC_GP, 0);
-
-        if ( state->rex_prefix & REX_W )
-        {
-            /* See above for why operand/constraints are this way. */
-            asm volatile ( ".byte 0x48; fxrstor (%1)"
-                           :: "m" (*fxsr), "R" (fxsr) );
-        }
-        else
-            asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
-        break;
-    }
-
-    case blk_fxsave:
-    {
-        struct x86_fxsr *fxsr = FXSAVE_AREA;
-
-        ASSERT(!data);
-        ASSERT(bytes == sizeof(*fxsr));
-        ASSERT(state->op_bytes <= bytes);
-
-        if ( state->op_bytes < sizeof(*fxsr) )
-            /* Don't chance consuming uninitialized data. */
-            memset(fxsr, 0, state->op_bytes);
-        else
-            fxsr = ptr;
-
-        if ( state->rex_prefix & REX_W )
-        {
-            /* See above for why operand/constraints are this way. */
-            asm volatile ( ".byte 0x48; fxsave (%1)"
-                           : "=m" (*fxsr) : "R" (fxsr) );
-        }
-        else
-            asm volatile ( "fxsave %0" : "=m" (*fxsr) );
-
-        if ( fxsr != ptr ) /* i.e. state->op_bytes < sizeof(*fxsr) */
-            memcpy(ptr, fxsr, state->op_bytes);
-        break;
-    }
-
-#endif /* X86EMUL_NO_{FPU,MMX,SIMD} */
-
-    case blk_movdir:
-        switch ( bytes )
-        {
-#ifdef __x86_64__
-        case sizeof(uint32_t):
-# ifdef HAVE_AS_MOVDIR
-            asm ( "movdiri %0, (%1)"
-                  :: "r" (*(uint32_t *)data), "r" (ptr) : "memory" );
-# else
-            /* movdiri %esi, (%rdi) */
-            asm ( ".byte 0x0f, 0x38, 0xf9, 0x37"
-                  :: "S" (*(uint32_t *)data), "D" (ptr) : "memory" );
-# endif
-            break;
-#endif
-
-        case sizeof(unsigned long):
-#ifdef HAVE_AS_MOVDIR
-            asm ( "movdiri %0, (%1)"
-                  :: "r" (*(unsigned long *)data), "r" (ptr) : "memory" );
-#else
-            /* movdiri %rsi, (%rdi) */
-            asm ( ".byte 0x48, 0x0f, 0x38, 0xf9, 0x37"
-                  :: "S" (*(unsigned long *)data), "D" (ptr) : "memory" );
-#endif
-            break;
-
-        case 64:
-            if ( ((unsigned long)ptr & 0x3f) )
-            {
-                ASSERT_UNREACHABLE();
-                return X86EMUL_UNHANDLEABLE;
-            }
-#ifdef HAVE_AS_MOVDIR
-            asm ( "movdir64b (%0), %1" :: "r" (data), "r" (ptr) : "memory" );
-#else
-            /* movdir64b (%rsi), %rdi */
-            asm ( ".byte 0x66, 0x0f, 0x38, 0xf8, 0x3e"
-                  :: "S" (data), "D" (ptr) : "memory" );
-#endif
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            return X86EMUL_UNHANDLEABLE;
-        }
-        break;
-
-    default:
-        ASSERT_UNREACHABLE();
-        return X86EMUL_UNHANDLEABLE;
-    }
-
- done:
-    return rc;
-}
-
 static void __init __maybe_unused build_assertions(void)
 {
     /* Check the values against SReg3 encoding in opcode/ModRM bytes. */
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -35,7 +35,10 @@ static bool use_xsave;
  * (When debugging the emulator, care needs to be taken when inserting
  * printf() or alike function calls into regions using this.)
  */
-#define FXSAVE_AREA ((struct x86_fxsr *)fpu_save_area)
+struct x86_fxsr *get_fpu_save_area(void)
+{
+    return (void *)fpu_save_area;
+}
 
 void emul_save_fpu_state(void)
 {


