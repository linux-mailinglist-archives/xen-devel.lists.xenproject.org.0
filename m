Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9B25707F9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 18:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365281.595400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAvus-0004O6-1W; Mon, 11 Jul 2022 16:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365281.595400; Mon, 11 Jul 2022 16:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAvur-0004LW-TP; Mon, 11 Jul 2022 16:05:45 +0000
Received: by outflank-mailman (input) for mailman id 365281;
 Mon, 11 Jul 2022 16:05:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAvuq-0004Jt-5m
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 16:05:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eb9d2cc-0133-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 18:05:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6075.eurprd04.prod.outlook.com (2603:10a6:10:c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 16:05:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 16:05:39 +0000
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
X-Inumbo-ID: 4eb9d2cc-0133-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAAiIl+H7j1q1RrlEQjZqOKo+5bISIuJH7vQQRkTTyYeSizDT8C+vi8Ri5oBknFkUiVMrIdWajPmqK4U4LAsFIyt+WjxELubE3bb3iiLgawT98zguKw52eSMBlYRUSpAnuGNcOM7UAXDOrUOLMCUfdlGFWmpW9zw+olJlp0xtncAEm2bSVFc28pPNkafF742q1qlW9VfFTZQTqabX8w/ckVhmmi9XSi/L/sujChVSdYaf8kXz7qTbkgbwOsTCnHbu6Let2p1HJ4wjUwcuf6HVmzJIhdbQ1G8VYJveJXjUF53ij9XDCQSDsvZDKPt0XyXYNCipOggB9fQH3UCOwjzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZJhi/0JPagQhzQIH3E3WVG24pojUvNPKRJ4yJJhDuk=;
 b=YBYpM8WKHV87TRKIkUM0d+gjFbw9L4VDbnF2WQYNMlUkl+Scd2Ipby4HIXuJ7huydcbktK4DG2WmqJ43k1etr/k3yV3M/XbRxfZfIy5v1YNJ4GFlOPp5GE89iK8Gxp4GdE1VXOKPUOOvZl7upZzOKw3uXckcXxoIAQvuR3S1pfVqkdGA+8a/AYy9QI986psmg1/Kdr5H43ubnTuYpQ9/58PcoowgctRv4G+yePTFl1VsJCr/A9O9F7JImd82QSOw6etJLIpsyzNViszXlkdMdtZ+84dTkYXSeeWGot+TRSTj4qp4vRhPtrMX1y+x/eENu9aFl1Mm0sJR1iHNX4jcZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZJhi/0JPagQhzQIH3E3WVG24pojUvNPKRJ4yJJhDuk=;
 b=0tJzclq24JGhQWaZwM4H1xvZQ/IeXrWBkbjrqSjBIILSoHfDNc1RJa+A4unp0yL2Cy5jDyGJWz17RRDcgdPqgcdY7ncMwvtc+F26GxjeM41iea6WlV8W7hl8f0bBT/6xlCsa1hP441MeR3wiusHKg7UcdmH21H082BZws8Bs/Bs9lFGnpT+nE1OEIefuHw8iakUOOV8InLUJBjUrAUCq9xwK7vJXW9Mclz4nZcuGVfmoNXenwH+WSLTSjdvBuWFXlvmr08UAwUBCBIyWhmD5dcYKUzfX6AA8XFpakT3Fn+LFdrcVcNzt6O+5AAdf/xGVmLoT3I5ELIrUBOgnIvgVMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a2da2ea-bc8e-05be-2c4a-5f9b0841f0d3@suse.com>
Date: Mon, 11 Jul 2022 18:05:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] EFI: strip xen.efi when putting it on the EFI partition
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30f634fd-6504-4ed2-4d8c-08da635732a5
X-MS-TrafficTypeDiagnostic: DBBPR04MB6075:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kl+D2EWBFobHriHWwaSAnrRRBowpSNBu3S0/o0xH3c1XhtDlBjocuEps3qwWRDbYeKDtBDc6PI0P+AKb3AjQCrGhEpmTjeGWKhKp40yDfwuF9Nx+aEyiBFz0zkZST6o91JTIzFTAfPwyiGnwa/Irsz+y/Uc52XaUCX3rIuESllUDGrRPZK4H39+S22mJ8lL1SPShNdno5whEq34wo3mz/yIP22+skPvKaMJTohfBtYZkZPieckNl5bj1KmLfqtCSOJb6ZhGieE7gbDfGUtiJ6Scd8xeCo8aUrL2mY3Khg4lUtUknk3W4qXuq6lHZ9BDRtfQnG3wi49c7ZfPEun0fC+GS36VN8b2PN5/QkGA2ysi98xP4gzOUFBkTt0RUbSYAPIjtRDO1XOxKgVwzvtVzTBC5i4RMBi8FPqy1fwKLaD6lw/CGOg4mM4xA3eNsIfiZCNLnhDvtJxKAlS7NNIwWI8ojg0CVOs5CSqyq+bxBH6KfGRilc3Nyoy4P0tIO4dtcu07XroxSp3tCBmJImUfwrPr/BTpYUCJQWLIUoKA5ZQYkSMXM1f6izLelfJLB7uHf2TmwFnJOq4kna5XlcDNjnpEwq0m1BXD9EHQoMt28IeVm79FRxhsPe6Ch+YLSwT3BcnxKj5eRqT58LB0q9K2S3yRJMNTAAfAliuty0vcQu3js/ad2GKfKOfIY2AlEXCRTmJMVHmZWjWqjkiafiOOM2FreGrn7SJ66CGYaIP4JmZW0WhtO2w4kNMiwQx708PS0I9QvgrDuXqhW7ExuHxfpcAXbDuntGBC763fd5LYhmxlq/GGnuofS7LpeK/iOz1mTyHjyhwLGxo+EdS0ZQ5PtUDXEqcgakGs+7GoMq/bGpE0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(136003)(366004)(376002)(2906002)(6486002)(478600001)(186003)(83380400001)(31686004)(36756003)(5660300002)(31696002)(316002)(8676002)(86362001)(66946007)(8936002)(66476007)(4326008)(54906003)(66556008)(6916009)(41300700001)(38100700002)(6506007)(6512007)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WC8zMVV6REFpdWRDd3J0UXp3dWdkVzlxQXNYY1Z3QlNWMW1OQW9vc1pzTUFu?=
 =?utf-8?B?TTlrZmtPUWVqcy8zT0RmSlJFeXNXV3kwcDFsU3dJV1hMb0ptYTREU3JpUkI0?=
 =?utf-8?B?U0pkcjJMYTVaTG1RYW16K0xvNDIxWmY4UXQzVmdjZ1BJbUZ1N0pEVTJCMUlR?=
 =?utf-8?B?aWM0Z0c0OG9ITkU0KzllS1NRSWw1Tmc0aktQdHRMMkVzTnoyRUMwYUo0bFNp?=
 =?utf-8?B?Ry83VTl5UTBkTUpldTQ0cGlTUjl6Z1FLWUFwY2pHNklWTGJ3WVFXdlpDOGI2?=
 =?utf-8?B?R0dVdzZBWTlGbFZtWEZsWVAwcFJjVFNieXI5Q0lCVEg2RDBGcDJRUDE3SGlF?=
 =?utf-8?B?dS83UnNzcEdESU95NUliaTdjT2Fnb3NUcmx6Vkx5WGlYV016WVBOZDQ0RGZD?=
 =?utf-8?B?aE11SFhodkRDWmxVU2IxTjBKNHducWpQU3JZVi9MTmlGSlY0UGhndVJEQi9x?=
 =?utf-8?B?Z1Y2NXhrcHFxV3Bhcllib0Zic1MyRGJIczVJUzE0UGhsaTV3eGFuc2tIMTBR?=
 =?utf-8?B?S0hZMnBQVmlvdUdXaUZXZ2FVd0ZKdTJySU5EN2pWenJnNWRSUlgyWW8wZDVB?=
 =?utf-8?B?OHI2b0xDZTNEWXZzLzQ1TzE4YStMekcxUjA2UytYZThEeElwblhBaXBoeVhn?=
 =?utf-8?B?VmJKa2FtQ1ZZR0NzMSszdi9nTEZVNDBCS2lQRHMzK1VoUXBqV0RyV3Y5a3dK?=
 =?utf-8?B?R0dRWldIMGFySjJaalFrOGlSbzNnNjkwb3JrSVQ1anBLTEFLWVhuMzJ0NGQw?=
 =?utf-8?B?K2VReEJ5MEZ6REMxK0dmV2xZWi91TmZhdlhVUklSMXdYRFNzSTYwano4ajdm?=
 =?utf-8?B?ejRwUzJXaEpERGlsVUlRUGhBUTZTVnFHR2NIOFBQOHdYVXFHSTR5anJyM29P?=
 =?utf-8?B?NzNUK2o0WVNtTW1uSzcwRXdiZ1BTQzBPMi9LSXFmeWxFMDEzMlBBYnlxWk1V?=
 =?utf-8?B?WGIrZU1EeXY1aUw4dHoxZC96bEFzVWlyTHNUVjRiNy9XZnJZSWZmNVg3SzdH?=
 =?utf-8?B?bnlKT3RtOHVRdThwWTh4TFJXUklrZTEyNzcwV1NDMTRhN0JyVlRUaldFTHhN?=
 =?utf-8?B?V2dhNkxvZ0YzZnNXWDNuTmJsbDVha0dETVhRQjFTT3ZuQU1ldVluSW9CTjB4?=
 =?utf-8?B?cSt2Tk11OVZpVjM0YVFLN3pVb3lmZXlvZEk2RTBnVGNLNXN2WStIb2gva1ov?=
 =?utf-8?B?bVlObDBKelBOVXNrdER5a3FyZlltVjg0cERSa2VqLytMZGorMk5WTmVFWU1i?=
 =?utf-8?B?TVVyZGxNLzNuMDczUFMvRTA5KzB4eEwva2VXNytiV0tTbjhxZkgySUQyTHFp?=
 =?utf-8?B?Um5nUTBVb1VaSWZaUFcwT29rZkJSekFiQTJoR1Z0Y0NIK2hFS2w1YTZqUGJL?=
 =?utf-8?B?T0xVbmZQN2t4VU5rR3ZYTm5aWUJPajkxM0VDRGEvUU9BLzI4eWZTVUN4dHA1?=
 =?utf-8?B?RUlidDlOeGFwWXhvMUIvSTd2Tk9vbmFnMzNveWRPWmJLMlNRbDFGWE5Hd2JJ?=
 =?utf-8?B?Z2dGQ0cxU1Q3TXBNam44YnVxODFmS1JMRmlla1Q1ZjhiYlMrMWZ3RTYycGZ5?=
 =?utf-8?B?eStmQiswQTAzNVlWdnRPanhRcEQwbjhLVmlwUU9wVm1mQWRDakNZWWNKUjJj?=
 =?utf-8?B?eS8yd0dPa1pjZFZQVzdoYU9FK0txR0NJUmRndlhzK2Q2Z29ITEJxQ3R3bFZs?=
 =?utf-8?B?VlhSdkZrbS9ubUNrQnFXdnlBeTBtRkZkQXNZa3g2WjJvY2E4ZTA2b0RzUWJo?=
 =?utf-8?B?N0ZrMDdBTkx6K2dreWU3ZFdCSFhmdi8wbEk3OUt0SlVXa1pCM0VVbElmajNM?=
 =?utf-8?B?ODdMb1pHMjBFUVUzdDBzQWdFaWc1cUI4THI2SU1BMG8reVk4d2ZVZ1NydGl4?=
 =?utf-8?B?T3cwK1RlcG0xQy9PNDdJb2t4UUl2ZWYrRG5IOHhzZFppK3R4aEdraWltZnpV?=
 =?utf-8?B?MFdDam5VWjM2elNRTnBPNy94ZmdLWVdrK2lMS0oycTFzT1JBdWJSZ0VOVlRk?=
 =?utf-8?B?MGpCMTlkRFEyeThzcDhYSUxwTUVwVW1taGcwVmVtWXFpcHBsL2ZCbm9talRl?=
 =?utf-8?B?amw1Yzh4c2pFZXB4a1ZyZkZ2SElNb0tOUnNqZ3UweXU0WWNVak9vV1h1WlB3?=
 =?utf-8?Q?iXCvxFi4c8a3jOWzVeNC1rLH+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f634fd-6504-4ed2-4d8c-08da635732a5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 16:05:39.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IsJ3MbOnIzKwA4IEB6YeB8kYtIDD2GaCuOZQsB/XIR+QKLPq2P7X4EFockPozIJkr44oXluvAKLonzubLC0AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6075

With debug info retained, xen.efi can be quite large. Unlike for xen.gz
there's no intermediate step (mkelf32 there) involved which would strip
debug info kind of as a side effect. While the installing of xen.efi on
the EFI partition is an optional step (intended to be a courtesy to the
developer), adjust it also for the purpose of documenting what distros
would be expected to do during boot loader configuration (which is what
would normally put xen.efi into the EFI partition).

Model the control over stripping after Linux'es module installation,
except that the stripped executable is constructed in the build area
instead of in the destination location. This is to conserve on space
used there - EFI partitions tend to be only a few hundred Mb in size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Henry Wang <Henry.Wang@arm.com>
Tested-by: Wei Chen <Wei.Chen@arm.com> # arm
---
GNU strip 2.38 appears to have issues when acting on a PE binary:
- file name symbols are also stripped; while there is a separate
  --keep-file-symbols option (which I would have thought to be on by
  default anyway), its use so far makes no difference,
- the string table grows in size, when one would expect it to retain its
  size (or shrink),
- linker version is changed in and timestamp zapped from the header.
Older GNU strip (observed with 2.35.1) doesn't work at all ("Data
Directory size (1c) exceeds space left in section (8)"). Future GNU
strip is going to honor --keep-file-symbols (and will also have the
other issues fixed).
---
v2: Remove stripped intermediate file during "make clean". Use
    --keep-file-symbols by default. Add doc.

--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -20,9 +20,13 @@ Xen to load the configuration file even
 Once built, `make install-xen` will place the resulting binary directly into
 the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
 `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
-match your system). The xen.efi binary will also be installed in
-`/usr/lib64/efi/`, unless `EFI_DIR` is set in the environment to override this
-default.
+match your system). When built with debug info, the binary can be quite large.
+Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
+of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
+to any combination of options suitable to pass to `strip`, in case the default
+ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
+unless `EFI_DIR` is set in the environment to override this default. This
+binary will not be stripped in the process.
 
 The binary itself will require a configuration file (names with the `.efi`
 extension of the binary's name replaced by `.cfg`, and - until an existing
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -464,6 +464,22 @@ endif
 .PHONY: _build
 _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 
+# Strip
+#
+# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
+# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
+# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
+# option(s) to the strip command.
+ifdef INSTALL_EFI_STRIP
+
+ifeq ($(INSTALL_EFI_STRIP),1)
+efi-strip-opt := --strip-debug --keep-file-symbols
+else
+efi-strip-opt := $(INSTALL_EFI_STRIP)
+endif
+
+endif
+
 .PHONY: _install
 _install: D=$(DESTDIR)
 _install: T=$(notdir $(TARGET))
@@ -488,6 +504,9 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
 		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
+			$(if $(efi-strip-opt), \
+			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
+			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
 			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
 		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
 			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
@@ -544,7 +563,8 @@ _clean:
 		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' -o -name '*.c.cppcheck' \
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
-	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map
+	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET)-syms $(TARGET)-syms.map
+	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.stripped
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
 	rm -f cppcheck-misra.* xen-cppcheck.xml

