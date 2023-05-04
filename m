Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F996F6FB6
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 18:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529839.824703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pubcz-0005tI-Or; Thu, 04 May 2023 16:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529839.824703; Thu, 04 May 2023 16:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pubcz-0005qp-M8; Thu, 04 May 2023 16:16:21 +0000
Received: by outflank-mailman (input) for mailman id 529839;
 Thu, 04 May 2023 16:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pubcy-0005qj-1t
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 16:16:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff74922b-ea96-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 18:16:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6868.eurprd04.prod.outlook.com (2603:10a6:208:18c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 16:16:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 16:16:15 +0000
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
X-Inumbo-ID: ff74922b-ea96-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAPZt5EH1bG/JD1PnkOnmqHz5Bm+krvubRyDUOZujf5iertOEbV/yRHRYrw11JQz3xag1Ksh0ZYUYsGIym1GsilgQg7ZoO+GY0gZa6OPEAGD8/33aOgfD2M7ZYJi3X2qtfFPdOxxDU5reCdlxv7Ez7I8QwrH0jUngUwc2TLkO99KHmJYNXoNY0d7PHAOh10dXyXWfHaCzh/5OddAj4MJApZvnyTWZ+14SBpFVS8cLeSkbBToZckG26e24bzuknV/8fQs6ROkJhMTOG89LLQnpsTHjtrni2uy6yqHHmhsrD7WasLEmulFks5Hf926VIpOMSwY0Ouw932KTr/0nKT7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XShP+I010xYQHT+tjQ/t6tTbyUcOlkO/Qe5OKDnivA0=;
 b=jeYMry1EH9lkAX9Z5SgWbby6ko5SSBRl33BTGZKb0PtySXR7qXZpNT8a6niPJOsbq23dIFwy2Pu/GYd1fH/WTASO3AK+H26nDh9RpGVfVsTqYoRCsEwxWkoDBYic2/30wlOWDTGUcS1Ty2OdQ0UdrMRjP+F6OjyAiEYEUVxk7+K7vsFzV8mVXrm1JE0q/sW2EibTalklpNj8Uym6Lnq40ispg6b4T21Wo/2RXQpguO3CQVrnib2dH4EbvVHKpj1uj2UOk96kMvhgzs+Tf+YeAdwIZZBuwnn3OX0PNE0PZNgcAd+3rQhJC/UPpVpAUCme5z9UDDvPp1CJYAWs9DN/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XShP+I010xYQHT+tjQ/t6tTbyUcOlkO/Qe5OKDnivA0=;
 b=lzcg3IWpJg/9wzZ3pZugaXML+3og185wg/vNrd0XX5IzuPm0Bl0Hf2rwRSCDQqtsN5dJZBCYe0KEi2wML58WYo+xE2m6SSiJjo7fHdlNqJpBelMbKb5k7p6mRisaprqD17t1rqFFEGJCGqyezRYwiShSuAx/dpaYr1aX5clUwlBTA2YElZYVqlO7UadBYGaSQn4jix+GHHHsXeVmt/0U34GKZzTTtQg4u7r0EVGRAjL6ZBmxDKrga9e8g2jEXXRF36gUtY4w+AuAsbCs0l83HkGiGV/Q68FyeUrpx7tE04u1gGCxbl38wCrDtVI2iDXD69XBvDwkWvhJ0/9brHnMDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95467f2c-09ed-d34f-feef-5cd55c60f628@suse.com>
Date: Thu, 4 May 2023 18:16:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: shorten macro references
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ae8391-1c8a-490f-f2e5-08db4cbae2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z6DzkKvn/98KRYaJl7lCZMBlQ3F2I9Qi0Dlnhy0A6lSH6J7DhsIbTEzZQ9HCYdzKQcWiPEBjSK8idWpnYUERh/0X2fFy2xeGrwJuZyR3aYDZ5YtX6Odoy49TS7P/AX5vpbfEFx2jiRoBOr0bjO8V188FE72aLMN1+dNA2sD6k7bJTgv5UYnbzcDMRg28PC9/1j6WHcIo941wnrjHXr8CP/giGgNIm266v7VLEN1OpGXXD69CNcBD4VCe3BaK4bae/dbdkiOEsJYBp5yi+QUVDbT9lH3gnTVpM2uOgzy2bz0Gsgl3hR0jIJr2hZ0QElBwozg1PN2enO/F2Ggk9sTd7p6NMDSCDymQGS0n35gJNrTrq5Z4nYAn9FGDRdb1lU1f88sk35MXCux6O6z0Sv0mBaFhT+TLd7ucnchHAdfjPPVmpZm04khjrIK35qnUaDt/UoKtNqtjY5RWAAeBerO4Jx77d5WWuA+Kb7hMZO67LsaFVR/Mdtmr9ZPIfHDRYvGVhlg1IcnWn2WULDHC9kQwHXPoO2IBmb3IUyNon1GkMSZ5Ibr2lR3o9XK029bHXwpDnR/BCaCX3bfvru4UcJz7+1/zuv0jRKW410DIuqKclZxlGDQbGez/IAD/i5lRPKToNiTmywVE0rk1/tXYefwEaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199021)(2616005)(6486002)(26005)(41300700001)(86362001)(36756003)(316002)(4326008)(6916009)(66476007)(66556008)(66946007)(31696002)(478600001)(2906002)(38100700002)(31686004)(186003)(5660300002)(54906003)(7416002)(8936002)(8676002)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnJvYnNyRnk4eHdMU1dUalhIZTlsN2pydjgrbHAzVDM0MjU0VGowdFlYcE1r?=
 =?utf-8?B?a3N5RTFHNXVDc0RGTWxyRVhlcTRleTlVRGNLak5WR29QNmFFMWM2cWtFSXJt?=
 =?utf-8?B?SllsUTEzKzFZbUdVY0FBejl3cVBsUGE2Y0c1OVlNUHUrSGZtV2NSWU1ZbDJF?=
 =?utf-8?B?Q05kQitlcmthVHBlZm85eUxsTjdna1lzR3F5amhUTTE1US94YzZzL1JZSDVt?=
 =?utf-8?B?NXVpRE5RUklLcmtPbVVvTDZwWDErWlhCS2tJeVhrR25DMTFPSm9vZG5wSHp0?=
 =?utf-8?B?MW0xZ2xKaWF3bTNoVTQzVC9Ybk5sRUU2Zk43MnIyUjJRYUl6RUpHaVJqY3RU?=
 =?utf-8?B?bzl0d3QxSklwemdTUEFXdWJLbWpWSzJla3QvZjkzU0l6d2FGZXpQN2RxWjNz?=
 =?utf-8?B?YzlVWmlQdldqL3loSlFuOEhaVkxlVlpydjdXeTlnWGFpU1NFVW42bnhRSG44?=
 =?utf-8?B?amVSNVZ3Tkx3U2p5UmxLTEVHV3VoY2R5NHNFL2pmekVJL0xtemVNMk14M3h1?=
 =?utf-8?B?c0FQQkM1dzlJVnB5MER1cUFidWR2bENGZnpIem9ycHBiZWczTjJuQzRvaWVE?=
 =?utf-8?B?UDRyM2tkK3d3R1VuMVk2c1daTFNEaDAxNnRTVlZlTlEvVXJETjdiRjNSWTZH?=
 =?utf-8?B?MXBNU2lCQ1ZTR3NuRjd2Rkp1d0VFbkxseWt4ajhZOCtzcXBOY1k5U1N3NXBQ?=
 =?utf-8?B?SUIrZjE2emhQblpFRlUxMzlydld6TmhMRzlVUzdaOUwyL24xUmJXbEY2WGVI?=
 =?utf-8?B?cHduQXUyTVdpaG5VQlVsTWFDR0JUYnljcjZMRWtYMGpqZU9nRzlCYWpDSk5X?=
 =?utf-8?B?R0VyNlFZaUNZd0JHRFRKUlhvbzlUamI0MzNQZEVlN3FxRUg0NElsT0ZLTk5C?=
 =?utf-8?B?V1U5WGg4S1NGb2FqbHJvWGhBVFNienNSSGU0bUNqQk1IRVNEUjBRaVNSL1FI?=
 =?utf-8?B?K0kwaTczeGVRbVVUTWZkVmt4UnZvQTVjMFNUM3o3MmNaMG9WUW0rMlBxVmhG?=
 =?utf-8?B?dW52SDU5N1NCRWdMaW9LTjJmejNuWXJYS0tQY2xSekJhQldVNGE3YTZVVzV0?=
 =?utf-8?B?R1JmMDJEMkVYUG9KdVo4dWV4UUVKcjM0elQ1WHllQzdkM1FXVnVhNFdNU3Fu?=
 =?utf-8?B?NkRUblBGeG9ON2VzZWUzc1ZBWDFaczVSSllYdGtZY0w1bVZUb2hBUGQxeWQ0?=
 =?utf-8?B?R29Vc0tTRkp0bk8ydk1hMWZaOU1Oc0dJQ3lMRi9JSHNyRndzQ3ZFT2ZBeWtn?=
 =?utf-8?B?Y1dvNW5mNXRLdHpEenB3NDRwSUVQNi9teFUvRlR2OGtQaEw3bytIUkg0TWFv?=
 =?utf-8?B?OXUxUUZPVGJTZjdraENkcnZuMXBxbkxnOTZlZzM4dWdvNlQ3bXhxWEsvRWxN?=
 =?utf-8?B?a1pELyt0UHJzYkJ4ZEhFYjhnN1VpeXA4Nm1UWHc4ekV6cy9BVEQzbTdyZjVt?=
 =?utf-8?B?T0xlUDNYOEZ0VjRSbWIvRUNCWkkwNFpwV0NKMXJyMHhzY2FUblRlMDM5YXl1?=
 =?utf-8?B?bFJZUmNIRFJ1aVdUaWtkZ1g0cjhzRTFva3dteTZkbWtxTHdLc01UVWkvcmtu?=
 =?utf-8?B?dG9raE5KdGVLbjNodGlLSkJuZUt4WWt5YUpBUUh5SG5FdU54aFVsNXRhRXg3?=
 =?utf-8?B?VHhJak1Zd0NHYVZrU3RTOCt1YWJkVzJudWs3bjRmZnVsSnJCT2JQaEFDeXZU?=
 =?utf-8?B?UVRQQUVWaFNuaDUxTkFVdzBEdFdBeHV2dVB1S1g3WFdDSWJrbHBQM3JmMWxS?=
 =?utf-8?B?NzV4Tk1rSjFmRENCam9kSUN0S2dvME44NFhSR0dPSm91cDRIWDV4NEJ0YWlU?=
 =?utf-8?B?WE01S2FvTUxnaFRGMDJEYWxDMjJTcjlZOFoyNjZpVGpRZHl2RjhtV2tmeGhz?=
 =?utf-8?B?WkRRSXYwOENFMDU4MzdaNnlMbFZzNFo1SFRJY3Y0ZndiMFhzay85MThlM0VI?=
 =?utf-8?B?K3ljQ1c0VHVENFR4ODZXSGxidGhCYkh4SThqMy9iWFFTRXRScUFySWFVNEV2?=
 =?utf-8?B?WDBRWis3aWpYMGpCZDFESFhibmZ6M21jOEpyWVJGcFBYSGFyaW9OelhNMTYv?=
 =?utf-8?B?am5VbUl3ekRzVGpGdTliSkh3VTJYZlpiMmlYbG9MMDBBalRhR205NGR3b2Vu?=
 =?utf-8?Q?hxcVA3Aps6FJlVEABrZnAzfkd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ae8391-1c8a-490f-f2e5-08db4cbae2a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 16:16:15.5234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdqUSzeXNVT569WwvUHoZxxMFjEk8BPau19nyl3Whln5glGFvgJWspIdGZAR67DoELwUE3iak1eYAVcxCfNPfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6868

Presumably by copy-and-paste we've accumulated a number of instances of
$(@D)/$(@F), which really is nothing else than $@. The split form only
needs using when we want to e.g. insert a leading . at the beginning of
the file name portion of the full name.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -104,9 +104,9 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
-	$(NM) -pa --format=sysv $(@D)/$(@F) \
+	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
-		>$(@D)/$(@F).map
+		>$@.map
 	rm -f $(@D)/.$(@F).[0-9]*
 
 .PHONY: include
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -10,9 +10,9 @@ $(TARGET): $(TARGET)-syms
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) -o $@
-	$(NM) -pa --format=sysv $(@D)/$(@F) \
+	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
-		>$(@D)/$(@F).map
+		>$@.map
 
 $(obj)/xen.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -150,9 +150,9 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
-	$(NM) -pa --format=sysv $(@D)/$(@F) \
+	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
-		>$(@D)/$(@F).map
+		>$@.map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
 	$(SHELL) $(srctree)/tools/check-endbr.sh $@
@@ -224,8 +224,9 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
 	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file_option) -o $@
-	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
+	$(NM) -pa --format=sysv $@ \
+		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
+		>$@.map
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
 endif

