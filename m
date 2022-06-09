Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E6545148
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 17:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345610.571283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzKSq-000109-BW; Thu, 09 Jun 2022 15:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345610.571283; Thu, 09 Jun 2022 15:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzKSq-0000xr-8T; Thu, 09 Jun 2022 15:52:52 +0000
Received: by outflank-mailman (input) for mailman id 345610;
 Thu, 09 Jun 2022 15:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzKSo-0000xE-Kq
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 15:52:50 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe06::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3690995b-e80c-11ec-8b38-e96605d6a9a5;
 Thu, 09 Jun 2022 17:52:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8545.eurprd04.prod.outlook.com (2603:10a6:20b:420::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 15:52:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 15:52:47 +0000
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
X-Inumbo-ID: 3690995b-e80c-11ec-8b38-e96605d6a9a5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzpsjknwbU40iC/+l8GagzCTs0OXrg/jVbCkp2LMq6fM5NJ/mhcKheii8WBweNuRh3ccr6qfsf3M1LR5CEP99x95Wriy/PsStWqo5vEH7imrMeiSKz+sWIQEfbky49BFoA6gFYXcJ++e4gvQ5+Ct2SF1lJ8Gr6OyeS7O6Ra9T7R2m0StS3on9+gNkcdY0Rqlrd23HOVV895IpOczYke1MY392bFi7FCxGp+CYTwTEjJXORNXfwIkA0LO9E87xnew0Rwx2yC1QTPSvYDFzRj2fGGkgSfyL4p9iG5gEpxKrBTSWMt3VmJY0Pjkq5bVmvmk3LWfoAjhGfNJfU3SLSHIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0KfPugo3KQU69jKeUIwn3lcDuM0nZSDmJTaW1CYFB4=;
 b=iRKpcjbG2JA2IXIdgXHnHb5m/nKCaNfKSxdRALS4FfPO2QyRhVQmqWiF/MPOTbFQQsTNHSydCsB8hUs+xLDWk7w2l9DaKQHZ6C5iC73r/CK40r3xm7T806Gk4dG/9CoF9Ohe75Bbs/88fmV5HJTDRUKOAumCTpreRTjqI3T9Pvpi4r/C7cGz4QjMkwHQ4OEwN9Bp6RJrW/YzEcuzy9tfrKUiTTl8mg82KFJBX+hqYvziUjKbG6vmAZyoUBsiHS63Wsi0Z4rPdb68D4ykGHK0RlSXpo3MBwCwu0fJx3ANnQoZHdKwwYr6e+75Y+bfRCODO9P6TfWc8h7sB+VeRpDtwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0KfPugo3KQU69jKeUIwn3lcDuM0nZSDmJTaW1CYFB4=;
 b=z/5J8jlgVTLTrwN31eyScP09K+y5f/Ls56zYnlLYTGVpH4l4DupMCCbt5njMdDQDbwHt1AGPSt08H59ZYnbxG33bHaC6fFDvMMDFjyavTtFnnps1w+D6OZ1MCNlYs5Npq5In1t8fTWyOH4886/UOddFQDLnerRSTrbXafle+u91vwfw63cU9+SomY1RhefP32pGIlBeazz2gA73+z0XtLTafvKOA2yUYZu38b3b6NCFhUmWXTBUQK/CHfVDcf3oQ0gZovSc765BKxosPFS8Eczi8yT6fYLb9N8kIkYV80Am4c8IxVJtAruTpSFBnjq418EFvBL7gygcgViG1GxJyIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <79ebbde2-4be8-d393-476d-25326a2aa327@suse.com>
Date: Thu, 9 Jun 2022 17:52:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] EFI: strip xen.efi when putting it on the EFI partition
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0288.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a5cad77-d870-43cd-d60f-08da4a301985
X-MS-TrafficTypeDiagnostic: AS8PR04MB8545:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB85450C349A57423204154293B3A79@AS8PR04MB8545.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/pn6PVK6v8f0202XpUKlM7IKVvYaaQZaSX2TAj+r6T9JfFDTp/02fgCCZMnIsAsZHJe5kP9lGzOamkhxuk3ffFTjYrhMLmvRML8nVDhoMfs/5rRqgL8UtK4UKhZQOAseh6eSlIbdeeDYHTQ2F9rGQeATXzr6ze+JYuXBtWM8fTywHutH6vhVgIaxhSN5xKABkm5dVm1ucNhLFsikRoJTpLJBnt9BVrkcXSF4SPg5nRmeISXbcEX1rEeCLjCTnPy7dr1qElGA9fS0P/iTyp3umhyJA7+1pEd0cAhIE84o0m6ctoOQEatWPtwX3lPsW4ISJbFU36IQgtqrXIYqrTorRhwXPK/0uaNUCRlpj2kr9GY1b652Ts9SDfkpYrVQrw8nTUXTJZaziGyBdKW8wwkb2Oz+vKFN096czlASddKsEI3tg991O9mhDOv3jAQzwHw8003os8SPXOgegweegajWQU2aHyJJmLEnBUPR9H4NgrDW8w0kTIwbn/0a+MIEXNnuvfeq6Uy8EMQ9Y1Rd8wh9hhKcqcCLiSF/COleYhpR8yVYb4TTpCVpZ/xt8E1QAuLkOjjo5cEnnmTEOMLvT81ENdiBtJYsBjUGU9j3s2/5v+a9UnQIKNWhsLA+CDe96N+FPyccRS+w/9zYpTkop2j2ANZYkSRr7c+fzOxyDWd6gs3FBoH4rEyhGp76TG8rKBjBel2zcsOe0MHz+xTPiO2xA/7cPHBVHGNL+J+4D31rL5lqv4wMqy9w+jWBbj83RhAP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(66556008)(4326008)(8676002)(31686004)(66476007)(316002)(2906002)(66946007)(5660300002)(6506007)(6486002)(31696002)(26005)(6512007)(36756003)(2616005)(38100700002)(186003)(8936002)(86362001)(83380400001)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXlBa21BZDlWQWtoemVzVGhYaDhXSndvVUpYeTh5ampyOC9ncHdvejFLY3hi?=
 =?utf-8?B?alZ4NkdtWitpY25xVThPUnNTOFZ2ZzZLRXk1WGVFRTNrTU5DYTA5dnQvM3Ba?=
 =?utf-8?B?bnFCYk40MUdDZnkzOUFMb2NOdFlCUE8xRzljRVlsTUVrd2sxTWdZaGpRbUpL?=
 =?utf-8?B?VDdXb1lLOTJLc2VNbWwyVGMxWkFZSWZTSGJKL2YrSXNna1BrRHA0UDVsUjRJ?=
 =?utf-8?B?ZzdTc1FTYUZYdUNMVVExRmVQOTRMMnVYT21JVklzTjhtUlk0bWt4dlhPV2Jy?=
 =?utf-8?B?TVZZMlc5OExQYi9HSHp4ckMzb3hyZVU5N1oyZjVuaGFRbTNxZ0Z1ejdnZFBG?=
 =?utf-8?B?Vk5wRFZGRjAvMllKUFRuTHVaMGZ1RjNFSmViZG9mOTQ1QnhwM0htbVBJanJB?=
 =?utf-8?B?bXJyZ2RiSzA3Uzk2cWV5N2xWRmFzbi9hczZaTnd6dUNwRU40MDlRMW93SkF4?=
 =?utf-8?B?Tzg1Ti9FSWJ1MzNSMnFxdEJwUU9vK2U4bk51TVI3cnZ2WXMrcDI0U2dDZkRm?=
 =?utf-8?B?Nm5uL0V0QVByejNydzJuaFRNVVhMNjdUK0NhL0hEVVZ4NkhnOFo1dVFvV2ZH?=
 =?utf-8?B?RHZQMmhHOFFyZi8zeFk4QUc0MXNRVGNiazVSM2N5RVJJSnpzSHh0eXA4Q1Vt?=
 =?utf-8?B?Ni9kL2J3Ykh0WGI4bENwazYxR2hhQUVOTTlUckxYOFlsN2xwUitvMzNyREtC?=
 =?utf-8?B?QkFHeDJNaW5VRkVsRldlaFYrZUorZUxua1JjUC9ISkpXMFM1MytLcE1ScUxR?=
 =?utf-8?B?TlVRcm9jODFwMUU4b1dQSllBdWkzK0Z4eUF2SWE1V0ZQcHlnODhkK2p3ODgx?=
 =?utf-8?B?bWR0bzJIVWhRdEVLQVAvbnF5QTYxOWFDdVl0Nk1IdjBNNTdLY2QzWUxkSjZ6?=
 =?utf-8?B?QWtsR0N1d0xlVXU1blF5cXZpcWs0eWo3U3hhdDVXWUlsbklDSE5NWFE1NWdP?=
 =?utf-8?B?VTdyWHNlczN5Umh4V2FFdkVFaFJ2L1ZDTXk2R1NsNEovamRwNktvRkpoNkJs?=
 =?utf-8?B?bWJIa0lDdjJZK3RQc1plV2hGTUpFaWU3WkRNcUlqMDB4MEhaM2FwWTJnMU1T?=
 =?utf-8?B?Uncxb0dFTlF4ZHNtM1RHOS9HQldNUXc2NEZnZnQxdUlFdHBFSTVuSUhVV2FQ?=
 =?utf-8?B?UjlEeFMxR0o5R2tROWF0U2NGaTlObm9uSGN1OUJNcDU5aG11VkhDdkF5L0tL?=
 =?utf-8?B?SjJZV3ZpSlQ4TEMyNlpuZTlTWGM4NVMrbUZmZkd0UXN5VGwxcEpCa3dZSG9l?=
 =?utf-8?B?RGRLRzBIMW4vTTFUQUlTb1FJS2RCMWJrUTdjSllSS016UzQvcDN5WEFadTdu?=
 =?utf-8?B?L2orN1FzOWZIQTVUTDZGTE1Fc2pjWW9nZVo0U3lFV0ZCdTE1SmdnUjdDSlFv?=
 =?utf-8?B?S0llZnBVRytoNWlvTjV5dE1rSXpqd1dyMUVKeEpmTlYvSVFOMkVoWjI1S0k1?=
 =?utf-8?B?N08zdVJaVEFlNUtUYXRmMkg3QjZXWFc5NFdyVkVqVEQxYUxkK0owV09yQnNl?=
 =?utf-8?B?WFArdW5Zb0oyVGNzd2thajVoellaa2hqdHZtUU5IMG5SQkthUDhuN1libGY2?=
 =?utf-8?B?QXNCeE41VjlnekQvd082NTlOMXVFTTNoSzVDbVZGdkJRVkpuMnpVR2EweGNz?=
 =?utf-8?B?RGxUV3o0Z1k0MSs5V0ZhanVmOURDVnpESDMrcFdGNXZTNzRFT0dvaTVPVlpP?=
 =?utf-8?B?MzlUMG1xQkdWQ21TS1o5SitIZEpIdGp0RmpQeHhsbTFORWswNmljL1o5MzI2?=
 =?utf-8?B?TjF0R2t0cEhzQ1ZqbTZMV2xjaWo1RkE1WkY3dUVjaWliZzc0d2VSaUVJWWtx?=
 =?utf-8?B?MDgrdmgxeFZnZ1ZMcDh2M2Z2cGI3andYS2t6eDJsbmdmR0JNNzBJNDA1dFFu?=
 =?utf-8?B?a0MyOHpxaE1BZkFqOEEzUHpZVnkxZ3hyeGdDZEYyeUNmR0MrUzhCaTQ2ZHpR?=
 =?utf-8?B?bnhvN055cXlXcUtLRW85bWZqRGE5QTJQR01iaW1oUVVGeHE0bnNQYVdaK01I?=
 =?utf-8?B?RkEyc0lxbXdRYk9oUHkwUFNYQUduQUtpVlZEbGpnR280amZRT3ZkREZIbWwz?=
 =?utf-8?B?eVIreitmdmpWcGttKzExM2VVaWNvUlhPdVVjWHBTS2dRZ3JHUXRUb2hhbzkw?=
 =?utf-8?B?WCtWbmsxbURLajVvQlovUG5wS2xNdE9jdXNtRzgvbFlrSTVSUXlRM0V4d2k3?=
 =?utf-8?B?eVF6NEYyaDR2USswcEQxZ0U1Tk9ENXA2VzExUzgxOEo4cXlLUDQ4dDBZYVFY?=
 =?utf-8?B?NDdNVituQ1NzNmRCL1JiVll2U01ZZ3gzajRVUWdDUC84UjY5K3ZLcXd6cERx?=
 =?utf-8?B?THNmU2JWSHZ6Zy9SanFCU1Q5Sm90NHdqTWxCVTVzMnNabVZmUmF3dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5cad77-d870-43cd-d60f-08da4a301985
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 15:52:47.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ee477lgsmE3EHTMqg5K2/ymklB01xSawyFrRvYQLLkd5RVKzy5O5AdjwDQ3IVL2Y7sid6UfPNexQoX2xeHUSAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8545

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
---
GNU strip 2.38 appears to have issues when acting on a PE binary:
- file name symbols are also stripped; while there is a separate
  --keep-file-symbols option (which I would have thought to be on by
  default anyway), its use so far makes no difference,
- the string table grows in size, when one would expect it to retain its
  size (or shrink),
- linker version is changed in and timestamp zapped from the header.
Older GNU strip (observed with 2.35.1) doesn't work at all ("Data
Directory size (1c) exceeds space left in section (8)").

Future GNU strip is going to honor --keep-file-symbols (and will also
have the other issues fixed). Question is whether we should use that
option (for the symbol table as a whole to make sense), or whether
instead we should (by default) strip the symbol table as well.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -465,6 +465,22 @@ endif
 .PHONY: _build
 _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 
+# Strip
+#
+# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
+# is installed. If INSTALL_EFI_STRIP is '1', then the default option
+# --strip-debug will be used. Otherwise, INSTALL_EFI_STRIP value will be used
+# as the option(s) to the strip command.
+ifdef INSTALL_EFI_STRIP
+
+ifeq ($(INSTALL_EFI_STRIP),1)
+efi-strip-opt := --strip-debug
+else
+efi-strip-opt := $(INSTALL_EFI_STRIP)
+endif
+
+endif
+
 .PHONY: _install
 _install: D=$(DESTDIR)
 _install: T=$(notdir $(TARGET))
@@ -489,6 +505,9 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
 		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
+			$(if $(efi-strip-opt), \
+			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
+			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
 			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
 		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
 			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \

