Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7A666DEC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 10:18:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475902.737795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFtid-0004zU-DV; Thu, 12 Jan 2023 09:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475902.737795; Thu, 12 Jan 2023 09:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFtid-0004wR-An; Thu, 12 Jan 2023 09:17:55 +0000
Received: by outflank-mailman (input) for mailman id 475902;
 Thu, 12 Jan 2023 09:17:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFtib-0004wL-LD
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 09:17:53 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2086.outbound.protection.outlook.com [40.107.247.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf42ad4-9259-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 10:17:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9572.eurprd04.prod.outlook.com (2603:10a6:102:24f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 09:17:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 09:17:49 +0000
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
X-Inumbo-ID: fcf42ad4-9259-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jy+oa6BwyNonTn+EQbtnnvjI+/E/m1RPpYTRYt6gFnixa5VQS/rs2yVL7hcMkWXT0lvkrEXZP+m9dUVlnhm2o7J5Z12fSjet91bdt2OI3309qBcIpzqPd3TXf03Z9tRA1nFCXfxOkaBNaJXDVgfwanx496eX6sCRZn+FovQb6bIM4s4VrFQqZ4HF+B7RhgcNVxE4C10CUw/TttAf8r+0Q8tYz0YLn9PK0kXGeiq0tOOijpMm6GnnlcEIuZ/G/nT3MvmM3cWQ5V3RnEEvRnICIjakbbGKhhq4xz0+qYml8oUaaffBD1zB7L5Xx1jK2V3yjC/nBkztfE+Jw7z5dSC5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcCUI5uWmX3KBPnNjDCJtytod74+7velJJnLKEUL42Y=;
 b=DLfvGMCPDMAd8rRKJybtkvjpXNAHYZH5iztKw67/tktcHCLAy7swa8xV0B/Rrf22nznWZbtVZ+C2HCnCzBrSHozcCyEzAhdQzKu2igtKdG4dneuoBHLy4h0u3+/hMy34ruTU9kvlOlHOOTHXuky8VaanuUruaDgYcaUSZVqohuuuy57WvQuneTxh475/BenumxU8qtIS/JkCPWT6MqviJqUwKjam2XjRX60x3NKYz2YQIBse/SHgo8OWGuM4DaeyEyKE602BuQvmJBjR2eNzmtcAwXSX6OgDGcdpzdRIN3QRlUtuqnJkNf3FIBcVftJ3Ij61zja5QvG7URaBO29hZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcCUI5uWmX3KBPnNjDCJtytod74+7velJJnLKEUL42Y=;
 b=BMyok6OSAjEc5Z5VUw24mYIL/Sn80If2h/URnC2DSMbEVgFVYu+j32C/qe6hzTL7+EMlXB7dr7HioGbrj9y7AgI25GOI0PacVlumrXxBUv1V+s60Gzo/Vj7L4LfpukCWhPClAbpcVfacY4b3vNoBFvvc4WFbuR7PR5dmC57ANYuJcJENn+QORzd6OtCL2ThvlwLvK3GxEwRa+HDfRz9/GKCgU8q8her3YROAXn9bq+nBPnMKENVFKr/7HKJk8KSJxIa8wBaKtVUbLf5sqlj+c64BgOnPwbsS3wW6gqQvW1npnR4oQkg+RjhZ9Z7HKVQMGxbLmAin8svlRtfRTurriA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <992a28e1-bfcd-97ef-b3d5-c7341846b3ad@suse.com>
Date: Thu, 12 Jan 2023 10:17:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] include/compat: produce stubs for headers not otherwise
 generated
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c53f94-59c5-49db-e374-08daf47de018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bkCjyLoWUYJ+f9HxL2Nmi7u8kGYnyjO1uljzf8vbM3AsRvYGnfGgTngF+PzHwFROLsaayFzBFZ7H9FhIQG73ofNmGrh567a1fP7C7DBbta4Mo50WlSssoKpnruLyww2lYGT86Wj4H+RMKtSgsPGs7QD2eBqoW1OX+s052atZL35EE85OMmpIiztxHuT6VqTF9/HAnUCy3b2dV4Ud4mSelZF4Lxqu8n21WD/46MrIHAcvOEY1+4E1HDctV+fpJj5ULycbCSWyIOfrhewKANIzRAyMsMKnQ6HrUmyCbx+OXFrnsLOwzuJY5BiF7+hRLQ6b2zuFvTIx372RIsy3BnWwhR9EOLzvYOQT1InXqd7/dXLC1V9Jib8VIzzyO4musjgPF93s0bV3FJxWwA6jPfFFJH4Z4aRBJ+PQGa1DT6wyND5GnTplrBLhj5kgEG8PXzSjDmgk5ziSnldhqOFzJTtmenB6Gsv4Vigi1tU3ahJomfqqif+33Mk7Xaba0nqSfUM95w+OLptDGDgwu4aBaFFIzqKvyvvpEenMGoZyI1QIIouDXdCZqXal244BtUAaOl+vejznOFUWfbMpYVXdrLEB7rruGmaWtp2QGJHB1z51rTAq77noU5eugAWDzAqwxnaPL0sMYvMQEm2PPLcVee2GSHRQGs1F3HTRwGCZi1y7PFOPMrWKU+hofgS6K6YJQ85AXjDYGky1X2xoSFKyD0FssUz4LQrLON3wCPdLHn70LuJEC8Qo9K3sc9PSQIMxej85I54ruALFnvQJVS4kkTagjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199015)(2906002)(31696002)(38100700002)(66556008)(8676002)(86362001)(6916009)(8936002)(5660300002)(66946007)(4326008)(66476007)(26005)(41300700001)(6512007)(186003)(2616005)(316002)(6486002)(54906003)(478600001)(6506007)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2QwTXprcVYyN1FUZjNXcHVhbHdwbVJhTjZkUWdDR3o0OUVISVhtTWtib0Rr?=
 =?utf-8?B?M3FXeGpscGZDK3JTSE1VbGdCZEg5MnMyTjVYSEFSbGdaZ3QwQU9LbnpaMnhv?=
 =?utf-8?B?aGIxT2dFS0tyS1Z5NktKdnZZdFdTcG9BbVlqZDRlQkhONGVWdnUvVmZTY29P?=
 =?utf-8?B?WkdMYmpURXFYSCtHVjNCa1NERTRDTkllcFlPU1BqbzdXUDJPVm1CelFkdGN0?=
 =?utf-8?B?eDdEdElCQk4xOXIxNXlncTJtOVdDbUVScFArYUN1eFZEdU9SS3dIbm1ra0oy?=
 =?utf-8?B?Nk5McFZjS2Y2N01SU2JRL0lLdzkyQ2FxMW9LREhqT0VyYUlGb3ZqRnJ1Y245?=
 =?utf-8?B?NG9NQVd2b01CVHJHdGJaZEYvM1p0ZmdMMVgxKzh6aE5XZmdycWdiaWZ3U1ZO?=
 =?utf-8?B?a3FjWnk4OTFCUXhtalRORk1aTHZ0NVVCcG1wRlJNRVNSRlN5SUhObGxVY2lp?=
 =?utf-8?B?clN3Y1RmUHRXSFN6dmMrZ1krUm02a3RyYlNwMU1pbytqY2dOVURKVmtUenIr?=
 =?utf-8?B?YVBmUVJZb0EzSDN3aEwrNnZVSnBjVnQxS2VQODNqakwvbTV5NzJpVDcvZkpP?=
 =?utf-8?B?RGJtSkRvMUdrZEhKbzJya1YwNUs5aXVuQ0d5UFdxclFsVkhVVVRWUHV4enNN?=
 =?utf-8?B?bVBReHBlQk5OWHc4emlGWEppaVc5RXZJaExqL3FjZXplSU85aW9CcGgzWkxl?=
 =?utf-8?B?bTZpNFZjbXhCMXo2Q3BlQVJaakMwSGxkdkNpc2pDTUtmVmZDRzRKcTFUU2hy?=
 =?utf-8?B?MCszaVJEclpjMGJIV0NPbGptRDJjSkpSNjMwRnVvWnRlWC9RWThYK0M3bTNX?=
 =?utf-8?B?dHZHemZmY2lveTBWQlBwZS8wSEdRb25WaHFmMndRQWFsSGdSVzJlSHg3MzlR?=
 =?utf-8?B?eDRoZktDaTV1NmRlRGU3aE1qUUZiOTgySVJleWJ4NklqWE5xTnV4QVdrTHk4?=
 =?utf-8?B?NW9XVnR3RVNRZDZvTjNxZmQ3bmRwRnZRR3cxTzM2NU9KbWZZcERIZGpkOCtj?=
 =?utf-8?B?RDdaR295bEMwUWlZZ3pheWIvNk5aV1ZkaEFmUkFXVkNJemJ4U2p2d2hZSDhM?=
 =?utf-8?B?amo3Mm1FNldzL2YzUjlpOWo1YnNrekdGaDZsZ1BuQiszVFRMWnJTbjhLM28y?=
 =?utf-8?B?VjgyTS9CMHNGcEFKZ0RyeFJ5YVRXVE1HMWI1ZG1VUDdkaGxnenh3aHZuUi9u?=
 =?utf-8?B?czk4d1YrZU5vVTh6WW5Ic2R0bUxDVjZRVGc0U0N5aE5Hc2tHbnJ6NkZhc25U?=
 =?utf-8?B?U1JKS0lIb2pGMFZiMDdZbmdEZ2grOFZxN1hZUlc4VjArNmlWL2NFb1dhaGZ5?=
 =?utf-8?B?Y28zZk9KWmJFR09weDhqMWRrMmNEanZkRFJrSTFDMklzUUlNdHpGbFlpNHdt?=
 =?utf-8?B?U0p2Y05qNldZU2tNRFNUVTZLZFQzUHR5Sm9SdVptZDJkdHF6OVphMHQvOTJW?=
 =?utf-8?B?MFFQM1BOTEhKZGhRVWlRRGJJSDR6ZURELzU0S0NheXhKaXg2WENESXl6dTZN?=
 =?utf-8?B?dGhycjJSQnpJME84a2YzMVA5Y2QvY01VVG8wTWhYencySThMaWJpRFlpT2sx?=
 =?utf-8?B?UUpyV3RHYTl5R1VmTzZkd1Vxb0RYWmQvT2xuY1JEZGFMeTFqM3NaNGdqeGJz?=
 =?utf-8?B?UExNbks1MWlUeGtUUHllalVZK2xMczVtZDJaUUpUYUsxczlMcXdHbHpXSksr?=
 =?utf-8?B?MUQ2UzVERk52TFMxTUo4a28yaFBlaitOQXY4Z0RxR1cvelpnOStpekRxNFBZ?=
 =?utf-8?B?RHprd1ZMZlhxakpyZGs0dGlPcWNHWTJwZndxd3RQMVVpcXc0UTZSN1JJS0Nn?=
 =?utf-8?B?OG5sMDJtOEhqSXV3cUJZVmxoZzhZUytsN2dhYURvQm1FREVXSjNqeHYxNXVp?=
 =?utf-8?B?VEd5dUY2d3FxOEgzTitkY3g0bWkyQmdJeFd0V3BpV2ptSHF5WkdzV2FMWHBL?=
 =?utf-8?B?WVkzYU1VN3UraHpoemNBa1IrMXBzR2hRVU1tS2hscTZnaWQ2UEJibEE3T2FJ?=
 =?utf-8?B?RXpuSWgrQVFGcWFvR092N3FIM1ZvUm9WczZLa1VrQXFpRmQyLzloeERWM1RV?=
 =?utf-8?B?dElpMW1SQ1JPZG0rR29YMlQrbEtPUWkxUXV1YWc1M1V2bWUwazJ5d0lyN1hx?=
 =?utf-8?Q?h8UX6FKQmIz8HmqTvZs8lxhOt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c53f94-59c5-49db-e374-08daf47de018
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 09:17:49.7288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJiCWsfZ2/oy5AibghUp4jYd+VCWACs5td18jZW/bdWggGlTGDeovqCJ6VmimR7NC7yUErZpcuoij/C0aF9GxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9572

Public headers can include other public headers. Such interdependencies
are retained in their compat counterparts. Since some compat headers are
generated only in certain configurations, the referenced headers still
need to exist. The lack thereof was observed with hvm/hvm_op.h needing
trace.h, where generation of the latter depends on TRACEBUFFER=y. Make
empty stubs in such cases (as generating the extra headers is relatively
slow and hence better to avoid). Changes to .config and incrementally
(re-)building is covered by the respective .*.cmd then no longer
matching the command to be used, resulting in the necessary re-creation
of the (possibly stub) header.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There may be differing views on which commit this actually fixes, hence
I'd prefer to omit a Fixes: tag here. The issue was exposed by
4c5edd2449bc ("xen: Drop $ARCH/trace.h").

--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -34,6 +34,8 @@ headers-$(CONFIG_TRACEBUFFER) += compat/
 headers-$(CONFIG_XENOPROF) += compat/xenoprof.h
 headers-$(CONFIG_XSM_FLASK) += compat/xsm/flask_op.h
 
+headers-n := $(filter-out $(headers-y),$(headers-n) $(headers-))
+
 cppflags-y                := -include public/xen-compat.h -DXEN_GENERATING_COMPAT_HEADERS
 cppflags-$(CONFIG_X86)    += -m32
 
@@ -43,13 +45,16 @@ public-$(CONFIG_X86) := $(wildcard $(src
 public-$(CONFIG_ARM) := $(wildcard $(srcdir)/public/arch-arm/*.h $(srcdir)/public/arch-arm/*/*.h)
 
 .PHONY: all
-all: $(addprefix $(obj)/,$(headers-y))
+all: $(addprefix $(obj)/,$(headers-y) $(headers-n))
 
 quiet_cmd_compat_h = GEN     $@
 cmd_compat_h = \
     $(PYTHON) $(srctree)/tools/compat-build-header.py <$< $(patsubst $(obj)/%,%,$@) >>$@.new; \
     mv -f $@.new $@
 
+quiet_cmd_stub_h = GEN     $@
+cmd_stub_h = echo '/* empty */' >$@
+
 quiet_cmd_compat_i = CPP     $@
 cmd_compat_i = $(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
@@ -69,6 +74,13 @@ targets += $(headers-y)
 $(obj)/compat/%.h: $(obj)/compat/%.i $(srctree)/tools/compat-build-header.py FORCE
 	$(call if_changed,compat_h)
 
+# Placeholders may be needed in case files in $(headers-y) include files we
+# don't otherwise generate.  Real dependencies would need spelling out explicitly,
+# for them to appear in $(headers-y) instead.
+targets += $(headers-n)
+$(addprefix $(obj)/,$(headers-n)): FORCE
+	$(call if_changed,stub_h)
+
 .PRECIOUS: $(obj)/compat/%.i
 targets += $(patsubst %.h, %.i, $(headers-y))
 $(obj)/compat/%.i: $(obj)/compat/%.c FORCE

