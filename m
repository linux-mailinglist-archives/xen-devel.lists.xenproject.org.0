Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124C26FB0AF
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 14:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531542.827298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw0RS-000268-73; Mon, 08 May 2023 12:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531542.827298; Mon, 08 May 2023 12:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw0RS-00022t-30; Mon, 08 May 2023 12:58:14 +0000
Received: by outflank-mailman (input) for mailman id 531542;
 Mon, 08 May 2023 12:58:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pw0RQ-00022e-Oi
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 12:58:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbe7fe27-ed9f-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 14:58:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8674.eurprd04.prod.outlook.com (2603:10a6:20b:429::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 12:58:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 12:58:08 +0000
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
X-Inumbo-ID: fbe7fe27-ed9f-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgoIzciQBZD2QD6lfkwZoZWIIe0fFDaUwyz7kDDe1GAeAyNXTGRk4sVONe/kzjP7WkLwmDY4Sguao5ZCNtUEAtiJr4xKoRjIilpGB1h1hy6B/0lqQthp72gdSyflS0MBykDFH12TGXrzN1yZHtkg3MRnW55d6aY5AWWJEcX7cZh8mSUtsu4xN4CieXr+lG9ZmYnE7qnmHwHcTTvpjxGUFEuqTjVIzbbbKeISs+oJHxu4qSDVPWZRoKxdTjjbVquxRIOXV042sU09RCynsrhtfokXQHHYYvQk293CFZWLsiYEBXWcLCbDuqm2v0xC/G4rimKmcpVrSj9kOzC2WFpAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fglwV5hSyATtXnFfIAt/M+iOmywYI9rQMwaKbY12iBs=;
 b=li2L7Mrs3Zt3e0BJZw4puX2LA9M2pt9gpW0CgKMhKsAfF7h6mknONhKorQlhew/w3f3ZnKtbzbax5rJ7wZnWF6NeLzjbECb2F3rQqP2ecifU5RfwgOTULvUPptaEa6XRAsh/fN+M6/sWWT0zb84224kCkGHY2ayrGzAApQbRZH4eFFnKw5GLN+EYqsiLhmGBtgG0rhhDJ+dSUUVollBqb6hYse8BtG/iPH4jwNTjilY7LMd1sMUvLTTAjwg1yeWO3VtZ+Lt+RheVeo280TYp6jTmVmmhmwOqBM/fdVq3wgTe6eozLLQ7C1CbHPu43G6Ix56Tf7rxK3CQ58+bhieCjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fglwV5hSyATtXnFfIAt/M+iOmywYI9rQMwaKbY12iBs=;
 b=EqZCbrQu5RlTIcHiurZkKOwHqWTgRb07ab3GPerxUnbSDOb+OvtVWUuh960C8mYQasEfYSvC0+zdVMPGGHLFqzL/DBoM6pNwkmDbqnXbq+fb9pNPBR7kXF6XEFLNAIac86ZwnnOaxCZbptMPR6JTQ9lWNxy3ngV8sLWQUfyto4vl80OdLm5W78COojIlCdr0bLElPda3tGgpB3/QT4Oz2heKDbRkYxBCAi3oGNvzGPnErXxoZjNaQO9EV84O9Z0Cbwfne1tNKO+mm0wCgwEcRLSNYQRQpDgl8vvcGpjF9rbOuNADUQ7r4XUkrMd1PjJ2Q7AYl7OEGcxMqY8XvWdSTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa76774a-0d73-989e-e054-1b30490160e1@suse.com>
Date: Mon, 8 May 2023 14:58:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 1/2] build: shorten macro references
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <a261b10b-25e4-3374-d6c4-05b307619d81@suse.com>
In-Reply-To: <a261b10b-25e4-3374-d6c4-05b307619d81@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8674:EE_
X-MS-Office365-Filtering-Correlation-Id: 86563cf3-bae1-4a0b-5659-08db4fc3df4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pLKH/3zYOnjIB3eINaldLzjZfjqiwG91OAFqByml+dq3liBo73mCuo7gxHtI3SmqIsH6Fl2kgJjpVVv6enO26MBY4YarPiG4NV4lcwWJsKdtG3BPbSJUUruTnVC3Tb8J3ZP3FsY1b72iywh90gB6sCqWRb7yv/QbcXw+vxzJCd/jp5pTTmlphtI2oVfRKXqSIpssJjfVFYXmOjux4iez0P907IiT9QauOK/EcKSVLM3VC47LwtOmjiawj4Q7VjULjl8u2A7AcP1TDVmmPu7KzyQoiGDfZjTGElsgzkN1rBjMan/lebzxTDmhtew7x1URCLSz7389KCsOgXJ8btRT25ODT2+t+6rHeK3YLmH56b0rVx4GBDx1PYzm8Xi1vRUcoMGguSF/n0obzUyrzoonoZUFk7Yi4AeFGA1vSZqRPjqbTpnYls9GeOHgISXFM027oJYVRtcLn8uGX2yw3kJec5CjdIT5tPNSPraxEy9XcwvlESCbWrv/qSoG7aVaiLgKB/1451KW1TM72frM4XdcmrZSu7Tm1U2XmaHo6ziHgnawPOCuZIOqYMZq6Z3+ae7AUElqVupcLt9SU8zD2JzKAyjM//MhMKiCwaMB9USjOMJHA5FkYilOizrNxtms1s0gZI2Iu+doYT6UTAs08uKEDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(31686004)(54906003)(2906002)(8936002)(8676002)(316002)(478600001)(6916009)(4326008)(66476007)(5660300002)(66556008)(41300700001)(7416002)(66946007)(6486002)(6512007)(26005)(6506007)(186003)(36756003)(2616005)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1E4R0xnLzl4WWpqa2VHdmlYVUxSdCtWR2Y3cjY3T2d0ODE5eUZiajNkSHFW?=
 =?utf-8?B?d2xYWWNDMVMwK1dPUHkrQWR0VVg3VFRxVXF2VWZtWnlEd2hhVTNYODk5eXF6?=
 =?utf-8?B?azY1ZVJiSG43bHZaa3hxWWYvdnEzalF4OGwyQnZuWkNDdkpha3U0UDljb0VK?=
 =?utf-8?B?Q0lHOGF0TW92cmhscFRkYWlMZTF5UWsxQjA3TjVvclBhd1dCeElYeFhvVWxT?=
 =?utf-8?B?c0RhTG5pY1NabFNyWXdhVW1VSFRsRnpFbG9QbzBnL3d5VEVTT3V5Rzl4UmJz?=
 =?utf-8?B?YXg4SnVlNU5JT0FZQkpMeUFsRC9iY25MMWVyZFJ2MWZudnp3dk16eUYvSWhF?=
 =?utf-8?B?dUo5YUphc09lMjc1NE5Kai9PKzdISkhvTlhLM1BBRzlXNkFzK2YxNTliZDU0?=
 =?utf-8?B?YmNJTno1YUl1YmJIM3FWQzh6eUNMMURwekY2ZEV6c24wNlNlNUR1Ti8zckNB?=
 =?utf-8?B?OGVPUEplU3JodXJaZ01xN1BnNzVLdFhia0lxbEFYWnk2Y3VnaEpNMGs1OXJ1?=
 =?utf-8?B?SzhVSm14K0V2WVphaVpmOU9LK2VoYlp5aUtjR1BKYm10SEtKZW9TeVNrYThy?=
 =?utf-8?B?MzJPSWNYMElodjc4OXFaWk9qRS9Ncmx2ZjJMQlZmWXdnTStjMVdmLzA2MlFQ?=
 =?utf-8?B?NGZtVkNMalJkN3lodjRGVlUvQ1dNdU52TVFQZVNVYXFsQ0dqNU54YmZ0ZGhO?=
 =?utf-8?B?L2xnUGt3WTlXcWpPL3NIZHJpKytxQklLcGpGU0Z3dXE1Vm8yUktLVGhtV2c4?=
 =?utf-8?B?TWhzenNMUWNScGlBMk05bVlMOTVacGhIZmFJelBDem0zUVZibDVhUC9iVCtQ?=
 =?utf-8?B?cWlWRXN2SC9vdkl5Z0hjbmw5cGZ1UnZXQWh6U01HNkRQSWxWVDdtWEZDWlB0?=
 =?utf-8?B?Wmw2SkxyTlBvdXp2TVJiSDFCSjk1ZWJWSms1ZFY0Zm1NVFVRVWpqZ1BqNVlQ?=
 =?utf-8?B?WjduZmYzT1VPZlgwVHFIUEVNWDBTVTZYeXg4RmFVUEVpNWI1WTAzcXp3ZGI4?=
 =?utf-8?B?bThZNlpKUHU3eDIyd29HSWN0bnczdjRPVnJqYWZzUUs2Y0RsMFVRaDJNelRN?=
 =?utf-8?B?SGN5NlY2UTY5R0xva1hTcXZlQWZOY2FGaHBQdlUxTy95enJsb2paRnM1QUlo?=
 =?utf-8?B?REF5Uy9Ic0l2djZUWXlrYjR5TUg3MGRoSUlCMlkxNTBTU2lUU2ZOUm1OemRo?=
 =?utf-8?B?Rk9GZHNqQXZZWVZBNCt0NVFjTDR0OVp5bGQzQ1d3MFlBQmIxTWFZcmdmQmlG?=
 =?utf-8?B?VUFMZ0NsS3V1SUYyVnFacUR5c3BQY2JjMjZRaDFiTVAvbkY2TjdiZnNjSW50?=
 =?utf-8?B?Q2lMaGJXbHlWbStJbmt2MFBjdzVCU0VnTVF4ZnVuZEV6enJ2YnZsR1c0RTk2?=
 =?utf-8?B?aG9hRklBQm1GTUN6QlRxZ1VoQjY0V2pDa2txbDJZM2k2NHdieFIzWkJtbkNn?=
 =?utf-8?B?eHlmczArWHJxY3JUVWREanBJdWo1cTdHVUtaOUQ1V2kyOXZBNDFUUngyWCto?=
 =?utf-8?B?Qk9jdlMwMWs1OWJmZzlieHpWMUJkaENMdUI3eFk4NmFpcUkxUlI3eWYvNm9p?=
 =?utf-8?B?Sjk5VjNFUUp2TTFmaW52b3lHNzdXRnVnVzQ3anBVQkp4eU05anpMZkhGOVpl?=
 =?utf-8?B?Y01BbHRCWVJnajhibXJ5clJ0MWZaQ2p6NXhUeWpBTENlNXR6YkowckNDZm9Q?=
 =?utf-8?B?emk3T3RUWFh1Nm85RVdNc1VIenQwSWZIekxxN1hROVNUK0l3Mm11T0pWSHU1?=
 =?utf-8?B?b1ZMWXZkNWgwTFpjVGcrb1dDbzJrb3IvdHozUHRpbWlvdi9vM3duWGJnRVNt?=
 =?utf-8?B?TlFNQWZFb0VzQVFSMFk2YkY1VGpDTkNKeGVJYXp1Z3lxTUV1SXJIQkNyb1M1?=
 =?utf-8?B?VDMyK3A0R3g4aFdBdVJpcDFNV2dSNXAxQlBqV3RaOTVIOGxYbE0xS1dTWm52?=
 =?utf-8?B?SXVjUms5UDRtYlBnRmdpRzlRRU4reDgzbzI4c1VpUEUzSW0xLzBqWUVON1g0?=
 =?utf-8?B?ZEtLOHArM29wNkg4UUtvVjZjejQwa2d2RHhOeFh2V2xvTkdYOTZtRmVoY1Ix?=
 =?utf-8?B?TGlZMFNFK3g3dndra2o3bkhHaFJha2tFU2t3Y3E4OWRTTUwxcnpyaEhyNG1L?=
 =?utf-8?Q?gl4+ccmfAI3kuKRlfmGmEttP0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86563cf3-bae1-4a0b-5659-08db4fc3df4d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 12:58:08.7816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhxlAmTa2/E1NFyj36HhP3C8r8ha9giQVFN8vzFiQnVubcU5cHl9NCVKrtBElBYaE+RGoR9iyBiReCZXRaZGAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8674

Presumably by copy-and-paste we've accumulated a number of instances of
$(@D)/$(@F), which really is nothing else than $@. The split form only
needs using when we want to e.g. insert a leading . at the beginning of
the file name portion of the full name.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
v2: Insert blanks after ">".

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
+		> $@.map
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
+		> $@.map
 
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
+		> $@.map
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
+		> $@.map
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
 endif


