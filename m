Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BAE323A85
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 11:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89242.167960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErOE-00082R-Sf; Wed, 24 Feb 2021 10:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89242.167960; Wed, 24 Feb 2021 10:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErOE-00081l-OU; Wed, 24 Feb 2021 10:27:30 +0000
Received: by outflank-mailman (input) for mailman id 89242;
 Wed, 24 Feb 2021 10:27:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs49=H2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lErOD-000815-Bg
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:27:29 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a452f7d3-735c-48d1-8ee4-73ff64d6ad5e;
 Wed, 24 Feb 2021 10:27:28 +0000 (UTC)
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
X-Inumbo-ID: a452f7d3-735c-48d1-8ee4-73ff64d6ad5e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614162448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=gt/9qJPpfd+Nj2qzhIwzlRauIGrZSQbZDuCtyyUly+w=;
  b=Wg5ATzqEkQcprUt4sgm4O7mmCSjoAoTXa3RNHtWFON57uciq1N4IiwPv
   6vUdWcPvM6wusyXbIbvCipgQfY517OfyGpTUAmaV8kc2a0bjkQaChKQe0
   BMzITPmIu+dlDOFw6Blqzj8CE+4H6O7p3OV7/zYHnnFwjMBor41CKQuzu
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /vncOgBxjZJ3mxkJF5wDc4oCoDxhBISWg1v6BFsZQmxhpFEJH1t2iXWr47uWrI7k/n37riAj9y
 62MzIG4mK5jEddphgpUEw7ddwH2Zu0oUSgoBLibYv+ygrCLNtX0jR45K7wdr9SI5rwoBCRD8TD
 W6JBwLZM+wed8RvOxcMHcVaT7A7VrsESgG4bZfnz2G2Hf5BLfuQbXS8coSzFMkTrCJvOeIH51N
 iIQjwk9CVLdHnADv48Mhg4+/LG7TcgybO43Mt0F2DhKAWVLqjY3f1hUiKdfnQo16+UcioxrhgQ
 e+s=
X-SBRS: 5.2
X-MesageID: 37836438
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,202,1610427600"; 
   d="scan'208";a="37836438"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9dPDgWZz3qu/FCOZZpRUK6DbY/kshW2QyJgJW6XfKHudiN70NKtydNAPfG/fzkH86v1tewj0SbW4UdNusVfjIY3LoCkYgBasR0aIzH9EGadcOMNAmURxr1vBDPRKcCI9llEqI+jpiJ8jEJVUyK38nNc8yCahyHhiYdZPkv0IsW7r1FZf7rBECE1r5RjQY9H+GqSCM0ybwtUjgnc7HnwlObN5OjYH8RG21l08XgLJykPEGn0xQjpLCG3L86DIgPxBmvUZit5/HHHuYoAVKWRLLw2vYD0bBhEx0ywawHxfJQ0JdGuZJe4v5k8v6hJwMk9BjcWbMETr5ssUxgoJ86WtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKK48ldDFyTZ4nizItvT0SdssDedMC6C9cFvsgN2uNY=;
 b=VqGpN+qr58ZV8+odDlR3/NjFuJuq7A80Rg/TVaGDcekBSQJnVykZQwogLoa3g0PR5zg8iPG7K1IfvMiOUPckdotZ6bOmoI5BjTWLzVLYlPjlAvxVonT98nzFHvJVZOuwpgdzkJ78x9FYjbb+MdSAwMSCYhaQ28VEymy+rUoFexTJJTPaOQLb3iheRwBqurebYLyeGldey/ZVu/blhlD35wQ8SAua1v1r3DeiUO3lBnw4uit7QfdDdZxLjFTlExnd3ow8QUytiiuw/v++Rvp4mdL/C0LpjWS0aeaSGRRIOS6KFoV9BD+DXfMTp9NuKXtt1l90xGVo6tTcXsvSmbD5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKK48ldDFyTZ4nizItvT0SdssDedMC6C9cFvsgN2uNY=;
 b=hs7lzedNjIJqX+DH8a5D1cEuu7lcH7Ziitip04d1ckMCE7vCjg3FJI+aGVZY36f+fsL9b8mU5dudYmpukGOUUZddZb/KFj3/cbnjiBE9enhQB23IgGiAp40aMYVX+EVatQEECceududNRZXgLMQETrDstVur5Y/t/Hbx7giNwso=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH 2/2] hvmloader: do not include system headers for type declarations
Date: Wed, 24 Feb 2021 11:26:41 +0100
Message-ID: <20210224102641.89455-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210224102641.89455-1-roger.pau@citrix.com>
References: <20210224102641.89455-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70b3d478-8a79-4c21-2925-08d8d8aec64a
X-MS-TrafficTypeDiagnostic: DM6PR03MB3481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB34819566CCBA25EA4C31ED488F9F9@DM6PR03MB3481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F/dvgrk/5ZveMsj36jR6vJoWkHdA0PzLPMZ6Uyo7WXacCiOv3QsTalij0vZ3/+8zqM05zSpOPYW7e8wQoMGaD1B/GISoIe5zeQZKbeW5JQDrBQOIg7PgFguNLDpGSGfTFPLy9Li4yIKmyhUOIJLqRHUTyjJckITxknMQ5/wjfVRd9gmyBvkK0MV9BshL5gadeqXkjvAsnk3D46V9PhgA3JSaI3bPQ4WVIvBMTi2xypeB/9il1MIbLTiRpQ+ZPnurH1hYDmJmFE87qEUKnHdFKFs3L7aXrvg8K9N/kSWsy/wQ1cvBbFcjp7dYf5Gcv3Gg2bH5Y+GBuuU7lcWPgL+5IttAFfyJGktyRuE6aVdmsuW2HUbP/jIsASSXJqgNu32oBsy4ZWEYR8tKhtuR6uzr1haYjwFgMS7E8r1DKPmdQOIV/u9FpRJy08Y9824sLf05jQzksmxKxHTxBvELO1GX/giXkYsBEsN0C42aNoKYmgRWfV1gOcudw7Fz442BlQ3KrP1kO8BlBlzI+Swh24YV7Mxfte6JxCR54axYWPAALomc9PeoBKRjWMCOPUhXH98ZNVAdQwvoiWSxI6SQpuZyqUIjuN4ZAHkO91xSoInsMjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(83380400001)(316002)(6496006)(1076003)(86362001)(6666004)(26005)(8936002)(8676002)(5660300002)(6486002)(54906003)(478600001)(2616005)(956004)(2906002)(66946007)(6916009)(16526019)(66476007)(36756003)(4326008)(66556008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d0x2S2ttdnhJVWpGNW5lZ2ZjZFFNRitFa285UUFFNW5hUGVyeDV6K1kyejA4?=
 =?utf-8?B?eGJ5TGI3cVd2MXhrV0lwWk9NVXMvVEpqUTNEajR3ZkZTK0NKSWVvcllYUE9X?=
 =?utf-8?B?Nmk5YnVyL3AvY0cvL3N0TEtKRmM0dzBjWHc1UVJ1bEZoSWFUNzJ3Y2E3bFBJ?=
 =?utf-8?B?L0ZRZlBKcU1zbk9Id2RUckVBMm8zWU1uM3kwOEpZLys3cTd0ZVFxNVdxUld1?=
 =?utf-8?B?aUtWVStmQU1VRlU1enBQd1Z6VEh3NERPNTVtY0orRzB3TVRkbGVueEgyVTV6?=
 =?utf-8?B?L3JwSFBpYjNMeWFKS3RTL2F3Zy9NUjlsb2N1NVZjNmhxc1pDcUZxa3NadDY1?=
 =?utf-8?B?NGdRYTZaMjFlRlp5T0NJN3Y5Q0ZJN3dpZFpHLzhtVngySTgxS3ZZZjJVWmFW?=
 =?utf-8?B?WHl4Njc4QUtuZncwbUlHdGNVZE1BWlZ2cmNKdkJSb2ZoOVVrcUxJS0MyOEh0?=
 =?utf-8?B?cHNKVUk2SkRWMXZQVTRSS3FtTm85UDZIRXRlSktEVmJBOGc0M0lFTUwwS0Fv?=
 =?utf-8?B?MEVGZ1VUeXhLWDFkRjhWcmZUNGN5VU91czZGbDVPNjlYOHRXWXBRbU83WXp1?=
 =?utf-8?B?U0dHeXQrNWppTFpsbWVKTHovZXpzTnJ1RnY5d204OUpMSXNiV0xnanlhZEsv?=
 =?utf-8?B?T3ZxcWJ1WlNEZFB3V3FhVSt5NzZZaHZpTW5Td0I4NXZyTUtIZ1dkSC9TWXFl?=
 =?utf-8?B?VUdjckc1eWJaU1Ixc29ockFSQzJwL0ZLMG9BMTFYb1lPWmsvMGhER0pXQmV6?=
 =?utf-8?B?RXBaL0N4QVpZaE1XU1ZXSHBDMS82dUtXYk52bDlDckNVcGl3SzB4SlgvL2Qr?=
 =?utf-8?B?ZnVaajU4ZURhRG54by9OdFNtQzZCbTB0a2tOYzJ3clI1K1pFMldOWmJLSlVC?=
 =?utf-8?B?bkY4VDVlNVFyTXpPYjNSZTlOZXROa003Zmh2aGN4T1BGc2dnWWp0cUZ3ekVH?=
 =?utf-8?B?RjBOOHFGSHhQOWdwL3h0N3UwcW9NYVg5WGlRdHR4K09BMFMzUWFxMkY5NVJ4?=
 =?utf-8?B?TEZiYlZQV2J0Z2JRVUJCTE91STdzNE9qYW0wbFQrSjl1cDVuNVNaa3pELzcw?=
 =?utf-8?B?YmpJdk0xTy9HQkR2WFNZOENhK1RwOUJseVFQMHRJd1lOYW82blFrZnRreFdm?=
 =?utf-8?B?dVBBV3VwU1lhcmpvbU1EKzdKZFN6OE9oblQyVjRGMGF5QmROMlZNNkhFbFdB?=
 =?utf-8?B?RWFKYUJMYnF3LytUb1F0aWF2MFlnMFM5dVAzSXV3eGs3MmthTEVzaFozTzhZ?=
 =?utf-8?B?YmxjNGRXZTlpdVBtZjhzWE1CRGlhT244T2J0Y25iNVQwd1FUSzczNldsZTVC?=
 =?utf-8?B?V3pDSC9YN29xVzU3bmFSODZaZ3V0QlBZajRSMGlnZjNYZDlSblZpd2huWDBZ?=
 =?utf-8?B?bVdaQWQ0Wm5WY0ZVcjl6UG0zaTNIWURTOVRnTWJiTDAxN1ZXT0FNRUVjVnI1?=
 =?utf-8?B?eTNRTTlBQ1psOTJCeitQY0YxRkRyS3VzcWJjQ0k2NjM2NkxVYlFEa3hVTWF2?=
 =?utf-8?B?L1BwZ0RWciszSFpGdnMyQzl6NUNZR0MvdlNZdmxXSlhvcTR0MlJBVGc3Tzln?=
 =?utf-8?B?U0dKeCtubWlZNjJCREpyTWppM09TcnVpQUNGbGVjOEdyWmhuV3pEaXdRd0VJ?=
 =?utf-8?B?NWpEYmVpRzM4dUxRSVJLTTQ5RkNXSXNJVFl2c0xXSWxXcHBacmFjUldidms5?=
 =?utf-8?B?SW9Ib05GWEZPbCtUakVGTHltb0NDU3ZwTFZlZm0vcWVabU12MUt0ekQxWEl0?=
 =?utf-8?B?VnRvV25PaG1yRkVaWE13Uklha0FiREp2Y1I5RU56TlNXa1lkRXhwZ3hZZGVU?=
 =?utf-8?B?UVpiUWdOTGFndzRNNFNwZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b3d478-8a79-4c21-2925-08d8d8aec64a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:27:23.7016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6qO8/NbA323Zzf+AjsVS9D/vu4YbO1Efv935iYtubOTDP+9ifuNaLEtsf1FWgVoUZHaEpM/NujVstd0wYemFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3481
X-OriginatorOrg: citrix.com

Instead create a private types.h header that contains the set of types
that are required by hvmloader. Replace include occurrences of std*
headers with type.h. Note that including types.h directly is not
required in util.c because it already includes util.h which in turn
includes the newly created types.h.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/firmware/hvmloader/32bitbios_support.c |  2 +-
 tools/firmware/hvmloader/config.h            |  3 +-
 tools/firmware/hvmloader/hypercall.h         |  2 +-
 tools/firmware/hvmloader/mp_tables.c         |  2 +-
 tools/firmware/hvmloader/option_rom.h        |  2 +-
 tools/firmware/hvmloader/pir_types.h         |  2 +-
 tools/firmware/hvmloader/smbios.c            |  2 +-
 tools/firmware/hvmloader/smbios_types.h      |  2 +-
 tools/firmware/hvmloader/types.h             | 47 ++++++++++++++++++++
 tools/firmware/hvmloader/util.c              |  1 -
 tools/firmware/hvmloader/util.h              |  5 +--
 11 files changed, 56 insertions(+), 14 deletions(-)
 create mode 100644 tools/firmware/hvmloader/types.h

diff --git a/tools/firmware/hvmloader/32bitbios_support.c b/tools/firmware/hvmloader/32bitbios_support.c
index e726946a7b..32b5c4c4ad 100644
--- a/tools/firmware/hvmloader/32bitbios_support.c
+++ b/tools/firmware/hvmloader/32bitbios_support.c
@@ -20,7 +20,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <inttypes.h>
+#include "types.h"
 #include <xen/libelf/elfstructs.h>
 #ifdef __sun__
 #include <sys/machelf.h>
diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index 844120bc87..510d5b5c79 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -1,8 +1,7 @@
 #ifndef __HVMLOADER_CONFIG_H__
 #define __HVMLOADER_CONFIG_H__
 
-#include <stdint.h>
-#include <stdbool.h>
+#include "types.h"
 
 enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
 extern enum virtual_vga virtual_vga;
diff --git a/tools/firmware/hvmloader/hypercall.h b/tools/firmware/hvmloader/hypercall.h
index 5368c30720..788f699565 100644
--- a/tools/firmware/hvmloader/hypercall.h
+++ b/tools/firmware/hvmloader/hypercall.h
@@ -31,7 +31,7 @@
 #ifndef __HVMLOADER_HYPERCALL_H__
 #define __HVMLOADER_HYPERCALL_H__
 
-#include <stdint.h>
+#include "types.h"
 #include <xen/xen.h>
 #include "config.h"
 
diff --git a/tools/firmware/hvmloader/mp_tables.c b/tools/firmware/hvmloader/mp_tables.c
index d207ecbf00..76790a9a1e 100644
--- a/tools/firmware/hvmloader/mp_tables.c
+++ b/tools/firmware/hvmloader/mp_tables.c
@@ -27,7 +27,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <stdint.h>
+#include "types.h"
 #include "config.h"
 
 /* number of non-processor MP table entries */
diff --git a/tools/firmware/hvmloader/option_rom.h b/tools/firmware/hvmloader/option_rom.h
index 0fefe0812a..7988aa29ec 100644
--- a/tools/firmware/hvmloader/option_rom.h
+++ b/tools/firmware/hvmloader/option_rom.h
@@ -1,7 +1,7 @@
 #ifndef __HVMLOADER_OPTION_ROM_H__
 #define __HVMLOADER_OPTION_ROM_H__
 
-#include <stdint.h>
+#include "types.h"
 
 struct option_rom_header {
     uint8_t signature[2]; /* "\x55\xaa" */
diff --git a/tools/firmware/hvmloader/pir_types.h b/tools/firmware/hvmloader/pir_types.h
index 9f9259c2e1..9efcdcf94b 100644
--- a/tools/firmware/hvmloader/pir_types.h
+++ b/tools/firmware/hvmloader/pir_types.h
@@ -23,7 +23,7 @@
 #ifndef PIR_TYPES_H
 #define PIR_TYPES_H
 
-#include <stdint.h>
+#include "types.h"
 
 #define NR_PIR_SLOTS 6
 
diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 97a054e9e3..5821c85c30 100644
--- a/tools/firmware/hvmloader/smbios.c
+++ b/tools/firmware/hvmloader/smbios.c
@@ -19,7 +19,7 @@
  * Authors: Andrew D. Ball <aball@us.ibm.com>
  */
 
-#include <stdint.h>
+#include "types.h"
 #include <xen/xen.h>
 #include <xen/version.h>
 #include "smbios_types.h"
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index 7c648ece71..439c3fb247 100644
--- a/tools/firmware/hvmloader/smbios_types.h
+++ b/tools/firmware/hvmloader/smbios_types.h
@@ -25,7 +25,7 @@
 #ifndef SMBIOS_TYPES_H
 #define SMBIOS_TYPES_H
 
-#include <stdint.h>
+#include "types.h"
 
 /* SMBIOS entry point -- must be written to a 16-bit aligned address
    between 0xf0000 and 0xfffff. 
diff --git a/tools/firmware/hvmloader/types.h b/tools/firmware/hvmloader/types.h
new file mode 100644
index 0000000000..3d765f2c60
--- /dev/null
+++ b/tools/firmware/hvmloader/types.h
@@ -0,0 +1,47 @@
+#ifndef _HVMLOADER_TYPES_H_
+#define _HVMLOADER_TYPES_H_
+
+typedef unsigned char uint8_t;
+typedef signed char int8_t;
+
+typedef unsigned short uint16_t;
+typedef signed short int16_t;
+
+typedef unsigned int uint32_t;
+typedef signed int int32_t;
+
+typedef unsigned long long uint64_t;
+typedef signed long long int64_t;
+
+#define INT8_MIN        (-0x7f-1)
+#define INT16_MIN       (-0x7fff-1)
+#define INT32_MIN       (-0x7fffffff-1)
+#define INT64_MIN       (-0x7fffffffffffffffll-1)
+
+#define INT8_MAX        0x7f
+#define INT16_MAX       0x7fff
+#define INT32_MAX       0x7fffffff
+#define INT64_MAX       0x7fffffffffffffffll
+
+#define UINT8_MAX       0xff
+#define UINT16_MAX      0xffff
+#define UINT32_MAX      0xffffffffu
+#define UINT64_MAX      0xffffffffffffffffull
+
+typedef uint32_t size_t;
+typedef uint32_t uintptr_t;
+
+#define UINTPTR_MAX UINT32_MAX
+
+#define bool _Bool
+#define true 1
+#define false 0
+#define __bool_true_false_are_defined   1
+
+typedef __builtin_va_list va_list;
+#define va_copy(dest, src)    __builtin_va_copy((dest), (src))
+#define va_start(ap, last)    __builtin_va_start((ap), (last))
+#define va_end(ap)            __builtin_va_end(ap)
+#define va_arg                __builtin_va_arg
+
+#endif
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 7da144b0bb..2df84482ab 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -24,7 +24,6 @@
 #include "vnuma.h"
 #include <acpi2_0.h>
 #include <libacpi.h>
-#include <stdint.h>
 #include <xen/xen.h>
 #include <xen/memory.h>
 #include <xen/sched.h>
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 4f0baade0e..285a1d23c4 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -1,10 +1,7 @@
 #ifndef __HVMLOADER_UTIL_H__
 #define __HVMLOADER_UTIL_H__
 
-#include <stdarg.h>
-#include <stdint.h>
-#include <stddef.h>
-#include <stdbool.h>
+#include "types.h"
 #include <xen/xen.h>
 #include <xen/hvm/hvm_info_table.h>
 #include "e820.h"
-- 
2.30.1


