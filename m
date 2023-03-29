Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D56CD798
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516164.799851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSxz-0001yV-9Z; Wed, 29 Mar 2023 10:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516164.799851; Wed, 29 Mar 2023 10:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSxz-0001wn-6f; Wed, 29 Mar 2023 10:23:43 +0000
Received: by outflank-mailman (input) for mailman id 516164;
 Wed, 29 Mar 2023 10:23:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phSxx-0001wb-Rk
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:23:41 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe13::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c626d600-ce1b-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 12:23:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 10:23:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 10:23:38 +0000
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
X-Inumbo-ID: c626d600-ce1b-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBf4jZHXck5Lx+va/zVqp5fnSzUM4R84romrJBcFLjTMkGnzspnqoedircjRnq+UcydUVonaMf0sX7S6/wD3YD8kn4bX4EeNk9SGmw5n7UeKluszWtD2j2cD13sAp+V2L2p4/WZuyHZ8/YgdYqXnpxEb03gGAJbn7Kmv/cW6AbXzahEaujMb3LZH+WybJf36S2sAliMdc2WsDKcxl0p50YflhfwrMe5M27FiuhSwgIJbt5WJU0GHxs6oPba4zlJ70W8EBlkl6xu5XNWgpBX9uqJxNN6CQU75MlhANFsPV2BfkS4n1O7Hn4fSDSjRL2+THOG+AqL+jv7LkI7vJ1GQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUp7Plbc2kXtBLdSWWqlV8g55m/2J4f6Qht55ExnldM=;
 b=UzqGkiwfyl4+0Bm+tBtXKc7UBpim4UQK7TwRMxaDyUFN99YQNpxGCftM0KGBEBhfnIGzWnk4UEhzPErzo274PR8/IzwG/IirX7FXnzZnMwQ0/dGfDwLaeOBt9grmbsy1tQBkhYBsRfOr9jm6E2rlaAiCD/16vXV0zfBaNibdOm2812Lpp0tozkpR9y3trd0ghAyQE6U9jp3C/JzdU8vhv8T0oYVeGEJhBifkbFMGPXLbj6+U189f1ReQL5dgrOD+Q8ZeXINV391fjS7XEmvFcEedpuu0WTQt20q3pfJ3VA6aAzdtFso20QLLhHW3QkdfgrufQ0e++eylbdPrDMRX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUp7Plbc2kXtBLdSWWqlV8g55m/2J4f6Qht55ExnldM=;
 b=TaO6mBGDlxgoC0lsSotpwiFUWTD/23LK7o+m3nyCx/Aw9BpVNiBjO52juGNUu2babQV9Oi/EQDImpAvwgvFRL9FWmUZaw6TpjraczePDCjQwrYS5ZeIduhfK52QL9dat8TWU5ccXNBEj4WEcSh8Hu33JMs0lhr+k/UkZj/9ESTVjNalyeSRtiUT/6I6KKN9KKMCzr2kS1P315Zyhe0dqYc2lPSfxKvap45BIKlbkRHpFVal9dPmpnSZydATmo0VXzGYCXV4/sKxYRD9Rmgb/jxKg8Jwr3zhcwZXrzAE2xwUJOMPUGdpZMhsSz3dzyhGhalJ6qO+GHA0IdtVzyETcXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d073a56-b3a0-a64d-6bf4-851c660c6155@suse.com>
Date: Wed, 29 Mar 2023 12:23:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 2/2] build: omit "source" symlink when building hypervisor
 in-tree
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2e3c8f9d-8007-638a-c88b-21ad2783d8d3@suse.com>
In-Reply-To: <2e3c8f9d-8007-638a-c88b-21ad2783d8d3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8646:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cce8e73-0bae-4c78-f5f7-08db303fa96d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xmVBh6cB2zNMvKaDb2gftZjasbAF7ti6INghhxHO/cHBz5Y/hAKNZmuKH6cTlD9Aikn4b3jUh4h+r5ZVw4eGLtfcQUUYYds9J1jyb1dd0085tydm+UScbh8z8K10znMOgTaQGoFjc78kcuVxI4WgrJTrIcLlXLWrGGfqNjaVx6Fdq19CTsu/12poSVPzs+G7h7pKcoRcNCxtoDdP0oOvCSC3cZRKapKmwEXvBrTCVw3eFlXhKzfRDBrNFpJCla9sOueY0Y6HaZ70L5TW6i1kQewi5LlyGfTLni9UMFBGEbaVAjsBZnLbfV/VMqQR6Rjx2HKe6RuoYTTwhTB9g4lKE8PNCF2Ukq9nB1lmBY4TbYIDgUmNdsoJ/TxkKFDak81vVR8n9D7Eky6VDevQt5jM4Axee4QYIe15iin3Vu8nD7yoquNE0Z5h/PclZHYVE95mErTGgtbnJQFQc84BMHL8CR61xMMK19CpaZLWjQUZ+ZXNptQKTYTCBpEDxK0CXRvVCaRpLv/dA6CxbYk2kr4ajmHIt4ROY+mXx11KI+4th6PnvEaDJ80T0tDjeNrQxzdVHXM2Tgb7ZPPven1J3UMLWA/taJLz24FV2CmZP8ffE6FIb0fG28zZWM/cSZFaGYhg86SzoE84RICvKNbZ/WpZrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(6512007)(26005)(38100700002)(6486002)(2616005)(5660300002)(186003)(2906002)(8936002)(36756003)(54906003)(478600001)(6506007)(316002)(6916009)(4326008)(41300700001)(86362001)(31696002)(8676002)(66556008)(66476007)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnFJTDlNQ1l4aWNGVXdtLy9IMU4ydG0wYktnWTUyMEF4U0JGNVBPK0d4QzRx?=
 =?utf-8?B?cENiQjh4cVJ3REpEeWJ5V2s1Y2lYbnJVeE1LOFNpeTNhRUU1bXA4Q1pNbTJV?=
 =?utf-8?B?S1paK3RPMHRkSXVQNDJ3aG95dUVySUdLRVZPV3Zsdis1UnUwMkNOamZiNjhp?=
 =?utf-8?B?c29HdVAwUkVMWmc3d20yWkU1bWNiaXhKMGFIMTJDVk5zNXN0SXF4ZXVPRkRB?=
 =?utf-8?B?c1lCVkNTemFudUVrUklQSUFQdXhWRzdXZDZrcFJYN0k4dGlDc1lDZGpFMXh6?=
 =?utf-8?B?cmVIRWpUOFQyVlJCbWtTVE02SXpzWlFZZHJ0bEdGb2NHeDdGaUZWcmFIeTZV?=
 =?utf-8?B?aWNRelZKYjBydnFUaEU2YkJYSkpPRFBUb2t2dnFacVI5V2J4RmgxaFpPOGMr?=
 =?utf-8?B?MmkrTWIyN2ZKMWh4UHl1KzdCZzZKMVFNaEhabEtMSDI2NWl4RnVpVDFqbWpC?=
 =?utf-8?B?a2JaNFNQR0kxOU9BMWg2S1NKeVdHY1EvTVFNRmVySjViS0hQdUtzTUhQYTl3?=
 =?utf-8?B?cXBsSVd3NlcrbGw5TWdQTWN1MEVSRW1xVEVnb2k1dFZzamx4Qmk4NVdkSjdq?=
 =?utf-8?B?bGNFZGpTMTFsN251Tlp1eEtsMktUTHplUGwxM1V6bWJVb2sxWnN6SENVWHZm?=
 =?utf-8?B?ZWdXcUVSZ2xmb2hPNkhBYVhtbFd2MkJvNzdlUlNZRTZReG90YnplcE5SQVlw?=
 =?utf-8?B?dXBya0l1eE1CTjR4ZEQzSStpTGZnaG5JeVZhc3FZMmhRSmUwVDk1R0d3Z1Iw?=
 =?utf-8?B?MVdGSmdTTzNxa0Y0b0d4ZW45QzMzOEZWRHN0UlhxeFlmdlhCdHVZakF6K2Ry?=
 =?utf-8?B?UVE4aURRWlU2MzhYYVZJOGpLL0Q4NkF2ZjZvd042MEVTdXBBVjhBNXg4WEFM?=
 =?utf-8?B?S2VjZTJHSURiaWgwWlRuKzRwQzZjZk5odGdRQ0M4REtxWTBCTDEyVWZPK2NE?=
 =?utf-8?B?alhLQzF1RVhrWXhrK3djK1pTUVVWc25yWURNNURDYTk5ZFg1Zlh4bUYwMjM4?=
 =?utf-8?B?MUo4ZlRFUDZRTlkzZUY1bmpGdnN3UGZJVy9yUVFQcUJTa2E5bTEwdkQxRk55?=
 =?utf-8?B?dWpCWlZYczJDWEhXQ3ovMzNxV1BsY28yWG5BelpjekJZQXcxd2ZodWdTRTYz?=
 =?utf-8?B?WkJrS0paR29IRXJGaC9Ua2MxTzVTanIxNFN6TUlnVkE1bHJsdWdXcTVIL2Z5?=
 =?utf-8?B?cnJNYk12OTRyOGZHb21IS1hxblRIejBUUmdMNVgrZnl0T2tuRFFzRWF0UHBF?=
 =?utf-8?B?a2dEMG1qbVhJS001ZjNuSUtaQ3dNcWZ0a3NEQUx5UlZRSmFwTFNaNDFnejRp?=
 =?utf-8?B?RzVlZURsSFRNZ0RWbEhtVjZTSlhoYlM1SjZLeFVPUDErb3d1dGNsUUxjMHhY?=
 =?utf-8?B?dTFGQ29FKzdLVEhQWUQ3dXBvYXFBSk9RaGZoRkdOMitLSzVqRGdzK09jUjRG?=
 =?utf-8?B?ZHV3aU5RODNMOHA3RDVieXhVNDdvS0hvSVlyMWZLeHEvc2l4MWI1d0RibnBk?=
 =?utf-8?B?cm1wdGYyTzV5S3psU1V4R2dQRW45S20yYndiVFYrZ1ZoUE8ya0kyL0RxZjJu?=
 =?utf-8?B?YUFPUWNMV3ZtVHRJOXF4ZlF0bjhlS1RNK3JsbHBleHl6Um9EZm81RzV0ZC9i?=
 =?utf-8?B?Ym5iQUtBM3pXTXBQUXlHelBqaWxrdDBsdWYxZk9yVFRwSnVkNTBUandzZHUz?=
 =?utf-8?B?OWtGK2I3eUlBeFplNHBob001QlRYUTVTWVR0VHZiMnQ4ZzEwUHkyYkprZkxs?=
 =?utf-8?B?RFdkTFIzZWtWaGZJbm5KVUxEdXdFNUluSk01M0hBeU5HWVFVWm1JaHEzQ0pP?=
 =?utf-8?B?VVJ2VVdpWklmSUlvSHdqSmVrcXJPUmxqNWtZMW5IakhjNG0xRElEdTRzVEpw?=
 =?utf-8?B?MHNZKzFLNU1zOWNKbWNLYXlHVU9MWkErcGJMclIveXZGaFVOaW85WDFFbGJi?=
 =?utf-8?B?MUpneUdFZEJEVS9WUUdJNU9aU2szK1BsN09IR3lNVGVkVUhpemZ5OUhEWFQx?=
 =?utf-8?B?RWtjeHVaMmtXZDVkeDBabUpnUDcwaUQwdEk0TVE5NFNzWmtrdm5PeldjemlP?=
 =?utf-8?B?OHd4VFFRdmoySUFEOSt6M0RVS0c0RnNCcmUzNnhHOG1sQms1clF4M3o0NCs1?=
 =?utf-8?Q?i8W+jAZrCGgyEyp6bI86qqrL9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cce8e73-0bae-4c78-f5f7-08db303fa96d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:23:38.8342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldxmPttJrOzhhfw9/skXPOgVWzFdsql3kM9On0lb3zWpP1ZJF42K7Ep4UAnHWUtvdX0SGAexAeu8ndqhwLc5gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646

This symlink is getting in the way of using e.g. "find" on the xen/
subtree, and it isn't really needed when not building out-of-tree:
The one use that there was can easily be avoided.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/.gitignore
+++ b/.gitignore
@@ -295,7 +295,6 @@ xen/include/xen/acm_policy.h
 xen/include/xen/compile.h
 xen/include/xen/hypercall-defs.h
 xen/include/xen/lib/x86/cpuid-autogen.h
-xen/source
 xen/test/livepatch/config.h
 xen/test/livepatch/expect_config.h
 xen/test/livepatch/*.livepatch
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -310,7 +310,6 @@ cmd_makefile = { \
     } > Makefile
 
 outputmakefile:
-	$(Q)ln -fsn $(srctree) source
 ifdef building_out_of_srctree
 	$(Q)if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
@@ -321,6 +320,7 @@ ifdef building_out_of_srctree
 		echo >&2 "***"; \
 		false; \
 	fi
+	$(Q)ln -fsn $(srctree) source
 	$(call cmd,makefile)
 	$(Q)test -e .gitignore || \
 	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -5,11 +5,16 @@ CFLAGS-y += -fshort-wchar
 CFLAGS-y += -iquote $(srctree)/common/efi
 CFLAGS-y += -iquote $(srcdir)
 
+source :=
+ifneq ($(abs_objtree),$(abs_srctree))
+source := source/
+endif
+
 # Part of the command line transforms $(obj)
 # e.g.: It transforms "dir/foo/bar" into successively
 #       "dir foo bar", ".. .. ..", "../../.."
 $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
-	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
+	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/$(source)common/efi/$(<F) $@
 
 clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
 clean-files += common-stub.c


