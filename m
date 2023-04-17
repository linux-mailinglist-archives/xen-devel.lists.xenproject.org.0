Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E16E41C7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 09:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521810.810707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJjS-0000Qu-5J; Mon, 17 Apr 2023 07:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521810.810707; Mon, 17 Apr 2023 07:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJjS-0000P9-2O; Mon, 17 Apr 2023 07:57:02 +0000
Received: by outflank-mailman (input) for mailman id 521810;
 Mon, 17 Apr 2023 07:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poJjQ-0000OA-H4
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 07:57:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7d00::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d16db00-dcf5-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 09:56:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9302.eurprd04.prod.outlook.com (2603:10a6:102:2b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 07:56:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 07:56:56 +0000
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
X-Inumbo-ID: 6d16db00-dcf5-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldd4As3KEiTK+m4eagL9fG10B7sPRkWSQYmtbNTsT83m7yRGXFXZumKdBDEWAOIfXk6FBP+g19oVPNruOrIrPIxRm5EaahRPIe12Jn6v2Kilj6w7M51+DRwJwVyRAfj8T+rWvQyvDMYMvv+ZUVD2tRJnPJM5BXJbUTmyhufHfZFofGrfZ877GjGuEUN1q18hCY29GOGL3ZwwV6OJpRq95/OTQkFcpRRiqbVgZzPGRBiUdGv+QIcpTBUy0dlL+DC0LijswAQ21Bi9jNrRY1K8bPkJlv1VbeBrflsI5RUYDuKEl7e58KX2ciTJGKocM40Ww29aDTf9sSs8QUIidBw5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hTLNFxuSW+sx0jVTw/3lYVZEc+ZiEssDDfFuBdiE90=;
 b=nhO/08kgprDvGYnH9xu6Lnp8JqAfNxTo7U6WvfeIWBPww8dfz1+Sjv1rcDQ/1PO9Y4vEDDls1thxoChHW8+QKR18l4GJ4ZWOR3xcHSHmDWeoodyn7O09Zo+eLLLyFaXHAATp35ZYG1OY4yu9o/zeIR9jprpqbofSF8N20WlhHEQJ4H/UP0ijwNUios9mKb5lp9DWQ2kkxkcs5c933FJJ+BPkNYAxblNlG/Q4zvrnWqlu1M8E6uXuY8MNbXoJPjAdQRhwB2tyyEz3I2A0RNeDVp54URQLwqDvLnv9u0/zoLZjqTf3/vNFVVQfl4+iV+aQmnI2qWA+sa3WpDUcmSLJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hTLNFxuSW+sx0jVTw/3lYVZEc+ZiEssDDfFuBdiE90=;
 b=uMcMymeimRqZMDLQ3csTEaP1CTDX41d6MI8XGdMZS7OQk3PRvY41juLwFGp2Jh69dMqDNHUUviyDiCzsfV9wcCwSBuF2OC9nOIkLLD+QWjDNxQbaNq5ieq+lXtjZGIKSUzs8il71HiYMefkluQz8C+gbqRUE8D0i+WVPv0tVKWF8Gols4894wWYZ55fGJ5xZ56w68wvRE9ztbSRvpYa2qHPlgp7wrmo34h7pEQ+Nl8EfTPZ1AYmcVYXeodr01m0iUE3kGr3ztOTR3vXZWDQW5t/sWS5o+njrR3evWNYHe4KJOsSNAM3WzQvt5dJzmn7HSW5pU2dvzZ/4GakNTVtAsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7f3c088-2b80-b965-f307-4a31d72eb89c@suse.com>
Date: Mon, 17 Apr 2023 09:56:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: switch split-off files to SPDX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff73370-2723-42cf-e132-08db3f195083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E6jr8k1NOi1tsmwKEwaQK9dCUBv9OCPFOpSp7iXdqx0C3fLzYhHcZQlrBA9qiqfC65LvmSHBD5gouUTC8InT6KPG1AQVyF9RSg/WT99S1tPt1S9TyNggFErw6vCkMJcUX93NIH9FqfXrHpn8rANQ4JAg6Ieh2+NjFqiwIK5qFSBwYcnLKhE3haEmWlXT+cJzCXanyUOZV0J00QFUhpNuByj5yJDiGAzGglVis5G+qj0Saym4W14Zvp3OXHZzvlyHMzZ0io++W6tviLgNKZhQY59g9Kmbi1l/bb+5/A2n8dF4ic+e7by1JyId4yzMqC1ILiiSL1b48GB/og7zcYKaTH28R+AIlGiv6D9bJS8TshxkWHSh2H+9+QX0+Ier11aWUXW2zN8MD8zXk+DneekKk6qS8TGUSyVVDurtiDLtoRMGv/TP/SzHGsW7+tXmiNL+TX0cU/WARQFSYQpiTZEJCsyGwps64wDNRhSpwdvkPF/wVJPN+YhiOuUir9yWZXDa2c1XuCnY+ts6BNFPLAQT3utvEmpENGy49tkyxby7QZqThzXKrhpd4fLrO5/KNUM0a3evKnr9Cyw/KoDfC5wCsguNBqhinBbZqikSaWXKNxOk9uOZxOxdxm8mU/Z0F7k560s7jzby96SdQpnpkHYg0PXm1jKYINYfPGYsDUALYI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(5660300002)(6486002)(6916009)(66476007)(66556008)(2906002)(4326008)(66946007)(36756003)(86362001)(8936002)(38100700002)(41300700001)(478600001)(8676002)(316002)(31696002)(54906003)(6506007)(6512007)(26005)(31686004)(2616005)(186003)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGpVV3MyK05pc25ZNDVGL1Bsb0pQbkx1RDlzU3V1Zm1razFRVlB0SDRzUmZz?=
 =?utf-8?B?c05ERmNPMFZpWk4vR1NxdnN5a0NvdFozdityL2s1NGNocWp3aE5saXIwUnEr?=
 =?utf-8?B?TFFGMkdXNmk0VHBUejRBcDdvbVpGWlBydW8xSzNsUVQ1bzBYQ3h5bE5aUDl6?=
 =?utf-8?B?SXRWRmRRNW5wU2JXaTRoQ0dFVVZaTE9QOXpBWXB2bnIwa1lxeUFxS2p6Ymhr?=
 =?utf-8?B?OXI3dVNRR3ZSUlEvMTBlNlBZV0JNb2dTcGFyN290YW5ZLytMVGtOQ21VTVFO?=
 =?utf-8?B?RGZudkMyZXl5SThOUDI1bWFOR2ZhcDhPbUdDUU1CVksxSVUrbzkvUnp6ZTQy?=
 =?utf-8?B?cGVMNlgxT1FTYUNqZUVaSTZqRWdoZkZQVCtIRTZNbDZtNjR5Vm5GNmJPQjJp?=
 =?utf-8?B?ZE5iVFR4VzFjc2Z0OW5ZckNZZVFQV0lqOFRnWWpJaWZIMGZyTlpDK1pJeXIr?=
 =?utf-8?B?NUowbmtZWDZycVlReVJJNkhnL251WEJyeks5N3VJSDBPZmp5M2ptSHRKS1Zi?=
 =?utf-8?B?RDdLK0s0SGxYQStlZklFVm9iNHMyeWQ0UzdWRmtnTVZDM2U2dGhQdWZ2RWUr?=
 =?utf-8?B?ZC9mSDRUTFE2aXMza3pTVjhRQ0dMYVVISnhGa3pid01rVnJzeUliMmRnR1NB?=
 =?utf-8?B?aGs3RkoyNU5sU0tnbzVVOEc0SVp0ejdNVjFaQXhlMXErdzNqdkZreGVqMUw0?=
 =?utf-8?B?N1FaZXpFbmF6SkVFK1h0MnBoQ0FzcGNvaEhTR3NXbUkrYmRHTHB6Wm9YbWFr?=
 =?utf-8?B?V2h6ajlUY2J3VnorMzlGYWtpb3hWV0x4M2FjSWYyQXoxcE5rWTIrSi9taE1V?=
 =?utf-8?B?L1pQRUsvVjVQWTdVZjRNUkFSS1BuNGJyMy9GUVRWc0oxTzNvMkJrUllSeDNS?=
 =?utf-8?B?KzVaZDM0S1JoSXN4VzdJREZzVkhUOERMSFAwZENpdFdtNlJGbk9nd1pkMSs5?=
 =?utf-8?B?Y0p0QmZGcDBYRkJ3QkZBUFlSNG1ZRUUyWGRBWTFDanQyUmF5VG5DY3EraUkr?=
 =?utf-8?B?UXZ0bUdsR0hEcGVEdElFbENwdE1sa041Uk8xWXg5ajdsYnNVRmJjZy9hcmhi?=
 =?utf-8?B?SGhGUDBVaDY1YlZFNXRvNklHaXNxL0ZiNDgrMGczNVlUbmZyeW1YaXB4UDMv?=
 =?utf-8?B?WGtEdGt6NGxQeTR3blBhR1ZpTEw1Nk5vOWhnM0hhbTUwS1J4TUJpNnZRaWdG?=
 =?utf-8?B?cldYOFA1dStGdDJtMjdaK1NqZ1V3ZlNyZ1pMRUo2bWtqU3U4ZnpkV2hQa3l2?=
 =?utf-8?B?amN3MWNwcHYyVURHcVB6QkNDN3pkWExCRkRyVVhuZEQ5b01DY1R5SXNLZit4?=
 =?utf-8?B?dG1tbkd0MWxJVkhvcWZjUHQzMk43NGZQNE56ZVYyWWFlbG5jQkY2QjduaUNE?=
 =?utf-8?B?TitqTDBxRW4ySkVhVWhLMllOdTgyWnVyeFhMM3o4ZVpCaXVKZ0E3L1gvZGFy?=
 =?utf-8?B?dGJjdk9UTjQyS01oZjVXdXZPUTRrb29mVGI5Nk1md25Fbk9mSlNwTG1DMDkz?=
 =?utf-8?B?QVk4MTlFc3MvOTZ1bTVCdUI0R3Vha20zMGFwMjdCSXlJMS9ETVJ5enVXWXhr?=
 =?utf-8?B?R3B4VHRWS3I2L1dDQ0NpVVZRQUVyc21tUzB3cGd5cnpkYVRpUzQ5bFlzTWl6?=
 =?utf-8?B?azlYUDJDaFRBWXpZL1pldzQxSG9PYTdwdGl2amJYMG8yWnNmNjFLdFRxRkNn?=
 =?utf-8?B?K0p6R0t5WDdpZEZpQStoQnRYa0VHbDJ2QWc5dU50V29QT0ZmYUV1a25KZ05v?=
 =?utf-8?B?d1RIQzhnOFJPY1ovdFkrWUhTVENxLzEwaVJLNis2dnFrSnE4WHVPZWI2L3V1?=
 =?utf-8?B?K2tGZytqUURLWmVVanlkc2FzOU9RZDZkWXAyVkUvRms1bnh3MjVhL24wWFpE?=
 =?utf-8?B?M0JqNVlTbmlaM29wRnRJdjBwM282WkVKV1NYUGhDK2xLMHBMWi8reGgyREtH?=
 =?utf-8?B?WXpuQ1VoTXZRSVE3OEl2dzU5aUV0bDRKdm5WMEVUSTRjSHNnOUZMR1ZUQkdG?=
 =?utf-8?B?K1RhQ0M4N3p3NUdrb3l2SVlMYzdFVjZwcGtCNW9xTkdFUDQzODJCc2RwQTcy?=
 =?utf-8?B?YSt0SkFsR2dyQ3ZQcWZsRkJUZUhCVnNIeWJlN3Q0NjZsWDNNZ1VOMlJ4eUNK?=
 =?utf-8?Q?w+XvfRQk9U91TDAosyEy0+bf5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff73370-2723-42cf-e132-08db3f195083
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 07:56:56.1884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asVGXdh6Rx9lsxjBadCpBcsD5vqTUNukJk5+65KkvekaV2QQcbOBAQ6rLZa/CZ52nJmV1wrnMiXI+no7Q+sFDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9302

I should have remembered to adjust the splitting patches accordingly,
but I forgot. While making the adjustment also correct fpu.c's first
comment line.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * 0f01.c - helper for x86_emulate.c
  *
@@ -5,19 +6,6 @@
  *
  * Copyright (c) 2005-2007 Keir Fraser
  * Copyright (c) 2005-2007 XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "private.h"
--- a/xen/arch/x86/x86_emulate/0fae.c
+++ b/xen/arch/x86/x86_emulate/0fae.c
@@ -1,20 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * 0fae.c - helper for x86_emulate.c
  *
  * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "private.h"
--- a/xen/arch/x86/x86_emulate/0fc7.c
+++ b/xen/arch/x86/x86_emulate/0fc7.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * 0fc7.c - helper for x86_emulate.c
  *
@@ -5,19 +6,6 @@
  *
  * Copyright (c) 2005-2007 Keir Fraser
  * Copyright (c) 2005-2007 XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "private.h"
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -1,20 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * blk.c - helper for x86_emulate.c
  *
  * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "private.h"
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * decode.c - helper for x86_emulate.c
  *
@@ -5,19 +6,6 @@
  *
  * Copyright (c) 2005-2007 Keir Fraser
  * Copyright (c) 2005-2007 XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "private.h"
--- a/xen/arch/x86/x86_emulate/fpu.c
+++ b/xen/arch/x86/x86_emulate/fpu.c
@@ -1,23 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
- * x86_emulate.c
+ * fpu.c
  *
  * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
  *
  * Copyright (c) 2005-2007 Keir Fraser
  * Copyright (c) 2005-2007 XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "private.h"
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * private.h - interface between x86_emulate.c and its helpers
  *
  * Copyright (c) 2005-2007 Keir Fraser
  * Copyright (c) 2005-2007 XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifdef __XEN__
--- a/xen/arch/x86/x86_emulate/util-xen.c
+++ b/xen/arch/x86/x86_emulate/util-xen.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * util-xen.c
  *
  * Generic x86 (32-bit and 64-bit) instruction decoder and emulator hypervisor-
  * only utility functions.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "private.h"
--- a/xen/arch/x86/x86_emulate/util.c
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * util.c
  *
  * Generic x86 (32-bit and 64-bit) instruction decoder and emulator utility
  * functions.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "private.h"

