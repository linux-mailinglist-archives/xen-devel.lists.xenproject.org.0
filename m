Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A677F59B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 13:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585315.916401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWbTM-0007tY-Eh; Thu, 17 Aug 2023 11:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585315.916401; Thu, 17 Aug 2023 11:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWbTM-0007rI-BV; Thu, 17 Aug 2023 11:47:28 +0000
Received: by outflank-mailman (input) for mailman id 585315;
 Thu, 17 Aug 2023 11:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWbTK-0007rC-NT
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 11:47:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7d00::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4ced680-3cf3-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 13:47:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7486.eurprd04.prod.outlook.com (2603:10a6:800:1b2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 11:47:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 11:47:22 +0000
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
X-Inumbo-ID: d4ced680-3cf3-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcOdI9JKhJf33ANn6u9EwwQQ6sJhkNBo0x6vAKYcpTsPD9K//zkC0D2c3mk2bJ/P7DEH7iX0MKlfwSgbt/E9+yOjL8I1Emhkj1lrdpePCIj8dO/WVEKMPk/smXb02aNZyQUYjTa4GjRAacdFpAiMU7Y5W/VrKaCc1MJ+gQSyUA5Qvg7QOrNmIdrUNvJTrTqABGRTmZ3ldbwhWBJovUifYA6ARqxJg96OOeUsjoaXP5DxTxpcqMwSkW6LMOxefLteKklTaUGAKhs18M0Yxp5SVRoHJ9lWiw3Ru76L4ojY70DwBWs2g5Y4x0+5KnukUDtdXTesYWR8S0ebBfTTBH4FcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIUEJ0eqIWAgWmGZLWK/2DewBJrOKlSR8KnpIr3cvMc=;
 b=VXYRjp49DKLrU+uF/sEBlY6dfVMEtje4vWFICTsjXLmFqvEDZWU4zC3RY7aHyxLMdhNw1gjPZbuX9Pp2YWYnq54uYm5OAyaQjIhkP0+zyUT/Izomk/HwOFQ3CHZOAk6QFYnT5ZQK30ozNHbWTtHT0tP/9hD8w5QKktCeIdPniUZjIP/LNOGK1j9rH0CsZGjWzpL+5i+bxu7/EFyXQfLDaVKRKDKqeOeE0l+BDjo/lfbPsMQkx1eQ8QMXtbR2RLus4uln5srYRerdmxizduGU7cRYlxui7/mDKPEpZazfaQGxxTdHSeB0+yQNJU4Wm58oWbcXpJ0NkWJjgAjSGC2vaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIUEJ0eqIWAgWmGZLWK/2DewBJrOKlSR8KnpIr3cvMc=;
 b=BbCVstM0BrBACdsSWKQw/K5mu0+2PAw+Ozrrn4pqScYF/uGdfMJ6ZP310O63U5L2tX5l3FuFz8cDR3cx33I3f015IUF5FnhDPvW3ztJey3ipdEJMaBVRQE9AyZ0zgepJim1ERGqFBOeUFOnVG5CD384/ckH60KiieAZUbjw2+KJMahhH4WTYJVLmKqBSYdK8E1oPpOZWaOhuXOI/22p/3ZaRa5whu3Wgk5tFtCWXLBuX6ov4g8E5vXbLqqLa13tKSFbnJHKdkIJ8kZ84d+U4Gr2MlaXDpPGq5A2Dgam0H8BgAccvxumJWdrty9IOgmAGr+W4/8ffCW92zqqEHIeOnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a67c2fa3-ba1c-3783-c3ee-250aff6903d5@suse.com>
Date: Thu, 17 Aug 2023 13:47:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: rework wrapping of libc functions in test and
 fuzzing harnesses
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ff2c4e-9f82-4d41-a958-08db9f17b7ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FA2P33jnoMZQLJfhOVrlGRbnB/Irk3vvsx+8XrFmiujmVvagMnwNHGh288oYSmC/Kte6G0sdb4MFVkSHMW7VBvBlN3qYjUsdVH8grjei5lsVOCUgKCgIjtDuOGU65t4MxwWrycRr1vORqEAYp/TYCpaNQeDwaMdmFtULJ9CEUS9htpehCnnnTnAozYZgbxicAbGNhj9ZAXm/E/USmHOsLOBW/5iifVNp+podTYy5d7vC563PCQNivrUAnrNFYuXUxWaAMBOnTMueE/RRU4EyzS9hVNqAcSWLkLE79eLNFvoDabnmWoO+d5kfl2jrQCs6kN55uJUXNGKKkJYoSgTF4fR040vXQEHbOqdXNCjHQO89xtMA/i71zGfOwrfC+x7f91VenuhZYhZs5zWN0qXogWKB2SyoIOEpZQT8E6AgFe3PkXB1RRHHtN1ygVN8kQjM8+p9MYAAN++gAfHF8HXoJPlPJKaWv4LX4YtBv/xMAyNBu9NRxbXdeFVOrdi4i2zPn3pSLviZ2Ja5oFtrmzQXU5A/nQy70Ubi4YJeVKT6B4pom1ePGeMFHCQcXtX99NgyEpGb31mmZpPSgm9+O2LdAqUtitRsFKs7fiV3eKElIKQhftD7wZ3VNA3eYh5VESShurUQv+Y1pqz21m92rsv/AQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39850400004)(1800799009)(451199024)(186009)(6666004)(6512007)(6506007)(6486002)(83380400001)(31696002)(26005)(86362001)(38100700002)(36756003)(2616005)(316002)(2906002)(6916009)(41300700001)(66556008)(54906003)(66946007)(66476007)(5660300002)(8936002)(31686004)(8676002)(4326008)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjlNTERIZHFnVVNXc0JoSVJyZUVDWHk4Zm9jdVkwaUVkZFJLVlJkamEyYktI?=
 =?utf-8?B?a0JobTFkV2tWU0p4K0xCeEFkUGc1RDRCZkdwU0FmcjVQV1FUMzlDTEpQdjly?=
 =?utf-8?B?NWI4OXMzRno5ZFRROGFLNjZUb09CNkZVWmZKckEvVENwMDNZbG52bVU3Ty9q?=
 =?utf-8?B?eTdKV3RZWkczdXpNaWtNTWh6Z0lSMnIzMDRwRmxWM1N6Vmx6OEVOa3ZuVlc4?=
 =?utf-8?B?RlRhcDBMaFlQMXp0bDZZWHhydmdJb1BkelJucUcwaUF6eEw3TW8xL2RSdUhj?=
 =?utf-8?B?aERaaG91OG1GcUF0Q3laVExlVm05MmVDMG5JMGprT0YxVHlDS1h4VjkzeHhq?=
 =?utf-8?B?MXE4UXNEMlhPQm5YNHJ3VnJYMnlldFZYWmJqMFIyNFBFRUhUcW1sMXp0ekFY?=
 =?utf-8?B?Y2Z2aEwydEhxZmYvYzVqUUlyeEFwS3owNjQ5SXEzaEwzdEI4OWNYNTFrckdY?=
 =?utf-8?B?Zm83eFFXUDUxOWdRUG5sSFdPZE44NVpEZ3ZyWThnUFdNOUR2VUgvVnVPMDJP?=
 =?utf-8?B?NCtwVDZZaElLL2dVd1FLbU9UeS9vTmF5aTFLdm00RzYwTXZ0Si8xRjJiVXo5?=
 =?utf-8?B?Q1FHSmNaZ1YvRVEvSm0yS1pldkdMZnNMVDZVRHRCcU1ERTMvOFIrSDNUaVBv?=
 =?utf-8?B?MWxYNHVGeTJSN0ZielE4UWxQRmNXanQ0c3RuVmd3RDh6dlQzQnRRSCtsc2JT?=
 =?utf-8?B?YWpmVk4xNG1oTnUrVkZ2SzhialVyekltU25uK1hSaG1ERjFoTTZJUUt5QXdy?=
 =?utf-8?B?YVIxQjVhNkowNkFUWGdxT21RdWErWURtV1A1WDVxN0RIN0k3Q1Z0SkhKTDg5?=
 =?utf-8?B?VGZmWnhQSFdQQVNFbnZrSTBFdXRFMlR0aWR4NWtrMWlWdElBRG5iN3dKY2pK?=
 =?utf-8?B?V0p1QStxb2M4Sk1ZeHJMaGkyd3JEOVFSTUZRRjNvTkdCQVNhV2VNcjkxQVJ6?=
 =?utf-8?B?M0VoN1hJRUYyMTRjdmFVTDVzZ3FGdGVvUTUzQ2pOVFJtb3BweUtGcnJMZXov?=
 =?utf-8?B?NWd6aSt0WlBhOGpiY2dUVW43OEdDMWIwTkZkZmdVZlB0TndIemc0b3gzY0xU?=
 =?utf-8?B?S3lUdFFFdk9JczlteUMzdERCWFJnYWZJb21LUWFVMmsweHJpKzc4czRpdTI5?=
 =?utf-8?B?anltcWhSUERGc3RvS1V0NUlQVzNVV0RXallQZ0haS2pYTDBwSTVkZWJlVnpM?=
 =?utf-8?B?SGI0NjM5clJnOVZtMFpLZzB3YkEwVjNzbHBqWFdNdTBncm5hUEZ2azlYaTZL?=
 =?utf-8?B?TC8yWUhCaHdoRHBhWE0xUkFGTUMzTU1jc1BhdVpJV1ZMUjVXZTV4bTliV0Ni?=
 =?utf-8?B?RzFSUXVCNGtZM1E5V0hyOG10d0ViSUw0NTc1d3ZvM2xmZktCaFBuZkhUYUg1?=
 =?utf-8?B?RlhpU3JyYVdsRnNSekJ2TERQMWZPQXRlbncxTnU2N096bjRTbmZlWXE0cjc5?=
 =?utf-8?B?bmVYMDZlQ1RXdmtCWnlNRURvN2FWZStBbEx6NTRGRU9iT3VPYk0vOXQ1Q0Zz?=
 =?utf-8?B?ZFNTU2hML0IvYlUxU0xhVjB5NlpTd2dlR21KRWdwNzhFcXpMNEhWR3BKWDJO?=
 =?utf-8?B?N2t0NUx2cGdTZVQvc3VOWjZQbSs2WFdaak5udWRUNHZuNXZBZ0ovZjBJdE9a?=
 =?utf-8?B?M3RtMi9nWEtpMjM4ZW1VSmpTTVpORi9IUStsc0dmdnVXQWZXT1FrSnJvcWEv?=
 =?utf-8?B?QW15U0pPWTlRYW1sV0tuVWp4d0lndUxkSml5blhRL01UdytJU1NJNVBVVURV?=
 =?utf-8?B?RmxpUVp5TTRyTWlCQmJsRVJ1Tm9kOWpPRzVuY1VjdzN4OEtIRW8wRVdmZlVV?=
 =?utf-8?B?QjZJZE5IdlU4WXcvSHdEMmJTOWxsWHJCT2syWFpNbjAvbCt1VUIyRGwrUmtM?=
 =?utf-8?B?Sys2MmVZSnRnT0syRmM5MEljQ3NEN2l1NlBQUWJ2bEp2NUpPQzBpeEpqZUgx?=
 =?utf-8?B?TUNOaXRZUGVkSDdldG5HbGVLRGYvbDdKTzJVOFhORFQwMHJtMlFPMDFrb201?=
 =?utf-8?B?YmZyeEdMRk5zb0kvODI0ZGFpZFZ6ZWFUNkZ6T3Y1ekFnNzRzazZHNE41RytO?=
 =?utf-8?B?a05BY0hDd2hhbFZKSHQyMWllcWJIUDZ5ZjJKZXAvellLTXdUTzl5SHYrVDBC?=
 =?utf-8?Q?a+z4yuLFlEVovdiEqK91shzlL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ff2c4e-9f82-4d41-a958-08db9f17b7ce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 11:47:22.1415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkqUvXIbjVS32eNo+4RBA0M1nxugBQFUBvgNW5y5RzLORxUzDDXHnYaBvy6sSUMFnikUgUhtjBLvM7oD1BY7EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7486

Our present approach is working fully behind the compiler's back. This
was found to not work with LTO. Employ ld's --wrap= option instead. Note
that while this makes the build work at least with new enough gcc (it
doesn't with gcc7, for example, due to tool chain side issues afaict),
according to my testing things still won't work when building the
fuzzing harness with afl-cc: While with the gcc7 tool chain I see afl-as
getting invoked, this does not happen with gcc13. Yet without using that
assembler wrapper the resulting binary will look uninstrumented to
afl-fuzz.

While checking the resulting binaries I noticed that we've gained uses
of snprintf() and strstr(), which only just so happen to not cause any
problems. Add a wrappers for them as well.

Since we don't have any actual uses of v{,sn}printf(), no definitions of
their wrappers appear (just yet). But I think we want
__wrap_{,sn}printf() to properly use __real_v{,sn}printf() right away,
which means we need delarations of the latter.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -35,6 +35,8 @@ OBJS := fuzz-emul.o x86-emulate.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
 OBJS += x86_emulate/decode.o x86_emulate/fpu.o
 
+WRAPPED = $(shell sed -n 's,^ *WRAP(\([[:alnum:]_]*\));,\1,p' x86-emulate.h)
+
 private.h := x86-emulate.h x86_emulate/x86_emulate.h x86_emulate/private.h
 
 x86-emulate.h: x86_emulate/x86_emulate.h
@@ -51,10 +53,10 @@ x86-insn-fuzzer.a: $(OBJS) cpuid.o
 	$(AR) rc $@ $^
 
 afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
-	$(CC) $(CFLAGS) $^ -o $@
+	$(CC) $(CFLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
 
 afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o wrappers.o
-	$(CC) $(CFLAGS) $(GCOV_FLAGS) $^ -o $@
+	$(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
 
 # Common targets
 .PHONY: all
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -259,8 +259,10 @@ OBJS := x86-emulate.o cpuid.o test_x86_e
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
 OBJS += x86_emulate/blk.o x86_emulate/decode.o x86_emulate/fpu.o x86_emulate/util.o
 
+WRAPPED := $(shell sed -n 's,^ *WRAP(\([[:alnum:]_]*\));,\1,p' x86-emulate.h)
+
 $(TARGET): $(OBJS)
-	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^
+	$(HOSTCC) $(HOSTCFLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) -o $@ $^
 
 .PHONY: clean
 clean:
--- a/tools/tests/x86_emulator/wrappers.c
+++ b/tools/tests/x86_emulator/wrappers.c
@@ -1,78 +1,103 @@
 #include <stdarg.h>
 
-#define WRAP(x) typeof(x) emul_##x
+#define WRAP(x) typeof(x) __wrap_ ## x, __real_ ## x
 #include "x86-emulate.h"
 
-size_t emul_fwrite(const void *src, size_t sz, size_t n, FILE *f)
+size_t __wrap_fwrite(const void *src, size_t sz, size_t n, FILE *f)
 {
     emul_save_fpu_state();
-    sz = fwrite(src, sz, n, f);
+    sz = __real_fwrite(src, sz, n, f);
     emul_restore_fpu_state();
 
     return sz;
 }
 
-int emul_memcmp(const void *p1, const void *p2, size_t sz)
+int __wrap_memcmp(const void *p1, const void *p2, size_t sz)
 {
     int rc;
 
     emul_save_fpu_state();
-    rc = memcmp(p1, p2, sz);
+    rc = __real_memcmp(p1, p2, sz);
     emul_restore_fpu_state();
 
     return rc;
 }
 
-void *emul_memcpy(void *dst, const void *src, size_t sz)
+void *__wrap_memcpy(void *dst, const void *src, size_t sz)
 {
     emul_save_fpu_state();
-    memcpy(dst, src, sz);
+    __real_memcpy(dst, src, sz);
     emul_restore_fpu_state();
 
     return dst;
 }
 
-void *emul_memset(void *dst, int c, size_t sz)
+void *__wrap_memset(void *dst, int c, size_t sz)
 {
     emul_save_fpu_state();
-    memset(dst, c, sz);
+    __real_memset(dst, c, sz);
     emul_restore_fpu_state();
 
     return dst;
 }
 
-int emul_printf(const char *fmt, ...)
+int __wrap_printf(const char *fmt, ...)
 {
     va_list varg;
     int rc;
 
     emul_save_fpu_state();
     va_start(varg, fmt);
-    rc = vprintf(fmt, varg);
+    rc = __real_vprintf(fmt, varg);
     va_end(varg);
     emul_restore_fpu_state();
 
     return rc;
 }
 
-int emul_putchar(int c)
+int __wrap_putchar(int c)
 {
     int rc;
 
     emul_save_fpu_state();
-    rc = putchar(c);
+    rc = __real_putchar(c);
     emul_restore_fpu_state();
 
     return rc;
 }
 
-int emul_puts(const char *str)
+int __wrap_puts(const char *str)
 {
     int rc;
 
     emul_save_fpu_state();
-    rc = puts(str);
+    rc = __real_puts(str);
     emul_restore_fpu_state();
 
     return rc;
 }
+
+int __wrap_snprintf(char *buf, size_t n, const char *fmt, ...)
+{
+    va_list varg;
+    int rc;
+
+    emul_save_fpu_state();
+    va_start(varg, fmt);
+    rc = __real_vsnprintf(buf, n, fmt, varg);
+    va_end(varg);
+    emul_restore_fpu_state();
+
+    return rc;
+}
+
+char *__wrap_strstr(const char *s1, const char *s2)
+{
+    char *s;
+
+    emul_save_fpu_state();
+    s = __real_strstr(s1, s2);
+    emul_restore_fpu_state();
+
+    return s;
+}
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -32,9 +32,7 @@
 #ifdef EOF
 # error "Must not include <stdio.h> before x86-emulate.h"
 #endif
-#ifdef WRAP
-# include <stdio.h>
-#endif
+#include <stdio.h>
 
 #include <xen/xen.h>
 
@@ -88,11 +86,7 @@ struct x86_fxsr *get_fpu_save_area(void)
  * around the actual function.
  */
 #ifndef WRAP
-# if 0 /* This only works for explicit calls, not for compiler generated ones. */
-#  define WRAP(x) typeof(x) x asm("emul_" #x)
-# else
-# define WRAP(x) asm(".equ " #x ", emul_" #x)
-# endif
+# define WRAP(x) typeof(x) __wrap_ ## x
 #endif
 
 WRAP(fwrite);
@@ -102,6 +96,10 @@ WRAP(memset);
 WRAP(printf);
 WRAP(putchar);
 WRAP(puts);
+WRAP(snprintf);
+WRAP(strstr);
+WRAP(vprintf);
+WRAP(vsnprintf);
 
 #undef WRAP
 

