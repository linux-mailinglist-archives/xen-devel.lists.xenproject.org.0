Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A94A7633DD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 12:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570285.892002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObqC-0008M7-8m; Wed, 26 Jul 2023 10:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570285.892002; Wed, 26 Jul 2023 10:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObqC-0008JF-5j; Wed, 26 Jul 2023 10:34:00 +0000
Received: by outflank-mailman (input) for mailman id 570285;
 Wed, 26 Jul 2023 10:33:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qObqB-00089h-3h
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 10:33:59 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe13::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edb30fa0-2b9f-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 12:33:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9175.eurprd04.prod.outlook.com (2603:10a6:20b:44a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 10:33:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:33:56 +0000
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
X-Inumbo-ID: edb30fa0-2b9f-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIlGtv243838urcZISZZpaCepcZ0enGGrTcprCxv0A3SV2m/hkRUMutPlRVLhoMVrXmJhZH3g8KmqbQ2/e5ckV6bbYIlnmO3UrfvGg7FLOclX41XH3vpeTH3qI1lAG+bCbXpPX9QM7CaygRee5gJORyp97k7A14M0gHSD1YWrSaUahWvsHYeNPAc+E4Y6c2MkiepQI15fHshvcSoF+TXmkGW+miHKh7FtamBso6hvTlMsl/wWm9IqCo+rmHUGxvh9pH9DoOEMPduoibeuNVgTPpQ/Gj/Uz0rn/bx/7D+KX8hpbKAfIY2l60zGweibIWH4AxL2mlc63Pcg0rzq3+EzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBwtNBln1PoPHd4P5QDMVI0TR5/7gNq72VnGJQQ+6LE=;
 b=hTX9lA5Ds1kpSxMCuHEdGG0otfSroxP2chakMD7qwUbLt+/B41PwIL1z8Qlx7mDRvHDprQDeO/F9YRw6luIiuHN3CLOOwVO9o37bcF9dnN+w65Li09mPztO3qdvmRHANqVZHiWPqCbDdqqYekl03xSxU/WS5k3sT8c0GIcAGzQizEYjrjz9iu7lv7lbhBYAJnl2Fu0jqO+FpftECrrNZRGDn+9uMhgwRq8sf2nvDGCmSiuK5kvYeAmoozvNNxZL0TismpQDhO+DXju3uKGz/6Xg7zYUKv8cHPsgBzSrMdbCKuOzNp5xEwQLNuFLNrbeIr9w1PZu6Wn0smXsJC4nJUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBwtNBln1PoPHd4P5QDMVI0TR5/7gNq72VnGJQQ+6LE=;
 b=AcrVotX6iyA6bHD+au+pVhACXLpD+EsjGv8T0G2jDLrex9YUcfNeEvY20Zeqk9Wf71reIpyM18PvXGUpPVZ0o2b0u70F2n0fKiFRa67sDxUwC8I4il42IvyS/VMqCYCxYRW0718W9rHc7NXwyCqcHdhsDGGS7HOAcWF3ioL/xy8z6bS2BhTCrMCPDt3yeGT5zbCCsP2jJCup6LTFSQWMnLnwjOAuIO7KZGyH70SmjhOxpFIKKTKr6BeH/HbiUtZZjrOKkdtf27qtvyxUze0z4NsFMg/LUvhV4HTsmzvMTxBclhmymztSNYjFC7lw5SuTpQYdRtw8Rz0CXYQ3rdLWrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <14b578f9-b612-4bb8-e558-983be6f72386@suse.com>
Date: Wed, 26 Jul 2023 12:33:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 2/5] build: permit Kconfig control over how to deal with
 unsatisfiable choices
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
In-Reply-To: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 9badda2b-1be2-4954-5f6f-08db8dc3d07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xUliL8az7+whMLLTPui9pgrZBhy9ZFHCteFU2RpdUoAQ/tWnnZwdkzwXc6VVApGpFJPH/kk5eH56dPOTBc3w3Yg/OA6GVa7wIz8YnvowLbVLU/JzkybbCo1dSh8v6eoTT5YjkTghJrOcP/LiVAZ/k07e5uRRe7KP8HvAMDbOHdU7dYBG0JdN8K1+EsAGLNPcPFVGCr0O+Ab/DCbLRAFaeogXcO/dbpEvXAZcbqsIvM0edHpqbB7tyxlyOQk2H5RKnFwaeV9h032XqY76ptOgYw0fn2pfbjHVLn1ZeFAfnAch33FqblGhkRkmaYkkvU18CRJ1U2RVunNkTDjGEeEHarZe2JBo1nK0+me3r1iL3i4YD9uI6nppSRAOKr/b9HnjfoC6XcfjS6OsZTBZQUEkUd93fOIuB0E610tLzf5rQKeP0xLN7e5bmHw/WLvgWkE5p4/x1jBclS9W5x+u7+iTGIEavmTyovPq360o4zYXmdOkduqkn7pIzW4vvbVgtCAjncn/5nTSKQcMiy+dxINWKa6FkIqsO6GnbWRFrwM38s7h1oCn1OLuF7qvjXX9JTeiStz4uvV0Q4MIiEIGxkBdX1bcTx+m0Dk81JaUiywaQwGQFgwTGQKfnZbxKxG3tSNqLzjXajUZ+3RJS/yXCkQuYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(54906003)(6512007)(6486002)(478600001)(66476007)(2616005)(26005)(186003)(6506007)(2906002)(66556008)(6916009)(66946007)(316002)(4326008)(5660300002)(8936002)(8676002)(41300700001)(38100700002)(86362001)(31696002)(83380400001)(36756003)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3RPUytGREw3YWJpWU9YWHY1VFVESVE4bkV0WGEyOGtyaDRTVGZkdTZrVlIz?=
 =?utf-8?B?YTJiQlBPSVRGbnBnOCtkSytGT2FrWU50c1l0empyTUV4TGNKVElkUmdEdVVT?=
 =?utf-8?B?SzRzcVhBbDB3RWtFMVlFcEFaVDJPcGxUbTFnWVNYUndLUkNjNXRiRWtoRTJY?=
 =?utf-8?B?Y3dIV2dVWE4rN1pTb0I3VUk0QjhpTEIvSWdSUzlRZG9jcUdXZmFPOXJlYzFt?=
 =?utf-8?B?RUlKYmFOYmVTT1FGbWdTR2p5Mm1OMW9FK3VoaEhQL21zZXUxZlVxME1XN0Nl?=
 =?utf-8?B?UGdQcVNaVXVVU3hiY3BqVnpML2svRG1kYzNNM2RuM3RWN1R4elZhcUJ4Wmhz?=
 =?utf-8?B?ZzA1N0dCN0RMWmhWQnVKUUc5SkVKYW5reDA0Z2JESHNpdFdtVGh2NHlFM2NR?=
 =?utf-8?B?cWh5enFqS1lOcWVjUzhPbW1sZmxkOFJza28wcmRRTGp3NWlvRUwwTGdRMzFN?=
 =?utf-8?B?WkZ1TWEwZzJSS2VnQkZmelY1YzhEK2ZwOExxWlU4OHY0YkZBd2tvREE4VXNl?=
 =?utf-8?B?cmErV3UybytBTnZRb2V0SG9rZ3UwSm5BT2htSjJ1Mk9rS0dMTDNQZ1BiRWl2?=
 =?utf-8?B?SVFVTXdXYjdqdG53THJHbmJwQ1dZdktrS2FCMUZwdDNXTFZHTzVGVTA4M0pF?=
 =?utf-8?B?TS9ueEFoQ3Z2OGlUMGdHTmZad2pZZjhDaFM3VmgvM2x2V0hKdEVxa01BWDQ0?=
 =?utf-8?B?dUdRZERIRS9UeGRhUTBLaVI4WXQwejltb1IvVlNqT1N0a2JLS0d0VU83aEds?=
 =?utf-8?B?b3h1ZnN4bml0ZnBhMHRHTmd6Zzl6NGdvR3BwV054N090SFFiZWhsUTVKdVRu?=
 =?utf-8?B?TFAvbGR3T1N1ODBjYmhZa2ZlMy9tZmVEV21PTXlHeVlZbGNadGdVMHZsbG1Y?=
 =?utf-8?B?cWFGVlZraENNeW1FUFlNNjNudm9qUENsbExqNGJiZHY4NnFLQ1JyZjVkUXNk?=
 =?utf-8?B?Sk0wUTJhdndFTHZhWnJ5QjBBam9UamtxMitLbWtuYW5YUnVTaHNlTE9QMGNy?=
 =?utf-8?B?SVMxR3h2UkdSNHFIT3RRZEZRWEZEWVBlOU9nQjJJWm13VzVlam5DYlUxRUNp?=
 =?utf-8?B?azZnL0hQanBsejZVdnFIaERNU0JNR2hVNDJGOTdnUzgvcmllRWFrUEt2cGNG?=
 =?utf-8?B?a3ZvYTlMUlhFYXgxQUM2K0VObFg4QjFGSlllVlFDb3ZFSjQ2RHNlZ2d1SXBK?=
 =?utf-8?B?Q2M1UUZmbS92K2RRN1lVVEVaaTduWVRoZW5VakpiSXM4N3dHMDZlVzdxY3ZV?=
 =?utf-8?B?RHRkM08vSHhJeDQzb090QVJvQlM1cVZNa3VyM1g4dCtZcTVwTEUwRmVrVW5t?=
 =?utf-8?B?RlRYNTdod3NoamEyRUtWeEF5UHJOZTRPMHYzTFdLVllsS1l4bUo3c2x5L0U1?=
 =?utf-8?B?WXhFVkxoakhBenROeVhWK00yTjI5b2MxcTdIYSthV092Rml3bXdqRFlQRGxV?=
 =?utf-8?B?U3JnUUlFVSttV0NtRitJWEkwbU8wNWQ3Vk43YnJ5bGNUbTA1QXNVZFljMWxl?=
 =?utf-8?B?QUVTaVpDSFh5UEJNRUh0dmNLcEZSUTZzbGdmazNMaUM1cGJFeHVGaHREbmxO?=
 =?utf-8?B?MVRjY0liY1h3YXBaTUNDa200N3FsMmRqMmVZdmdDVUZITE9yZEVFQlpiaHJx?=
 =?utf-8?B?WUU3SUh0eWQxQnlHbkw2UUFUU2YwYW9DdTkyUjNydjh0Z2doeDVaQXppNGFF?=
 =?utf-8?B?ZlpDUFViZEVzWGNSdkxQaWNWK2hjNGlpdThFczlhZ0VXblJ3djdmMTlOc3JF?=
 =?utf-8?B?Y2QrY2FFdmJqQ2Y0dUttdzIwY1dmQ3lQNnZma0Y2NTUvdy9Zc2UrT2RuNDN5?=
 =?utf-8?B?Rk1WYnViNkRnbFo4QlBzazZaRW83VWdnSnZKdmlqM3VESFVISklGV1lTZEhq?=
 =?utf-8?B?dEJCTWRTcjVqRk5VREsreElEek0xYk5USU5OUWFYZkFxYzBrVEZxK0hWbVBV?=
 =?utf-8?B?bTRTQXFybmlNUlB5ZkppWi92TmZzZ2VueDRJVjkvU084LzhTcHJ3amVab3Ez?=
 =?utf-8?B?THF6Y0N4cWFLT3FoRHIxbDh6azVXQW5xWWFzZVpLcTNlMndMK0xLS2M0M3FB?=
 =?utf-8?B?clBsbnpJMjZGME1YZVRubHNuNkdBTDRvbkNGSWxHQjA0TVMwRTYydHFpSUdE?=
 =?utf-8?Q?KzdnCJ/ke9f0J8aMZFy7sAWJg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9badda2b-1be2-4954-5f6f-08db8dc3d07b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:33:56.0156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+4ysTVEqNcniNVNTmV+pRBm7v+Bw3NF0wzep7Rc2SgcF5tsaaPupkS0tsMDf6fazqtMzJxMoVM2Kg5CQ13sag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9175

Some options we allow the build admin to select may require new enough
tool chain components to fulfill (partly or entirely). Provide yet
another control to pick what action to take at the end of the build
process - be silent about this, warn, or fail the build.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This may not be fine grained enough: Optimization settings (like added
by "x86: allow Kconfig control over psABI level") may want dealing with
differently than security relevant ones (like XEN_SHSTK or XEN_IBT).

Whether to do this uniformly at the end of the build is up for
discussion: In the "warn" case we will want the resulting output late,
so it is more likely to be noticed. In the "fail build" case though we
may want the failure to occur early.
---
v3: New.

--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -64,6 +64,25 @@ config UNSUPPORTED
 	  preview features as defined by SUPPORT.md. (Note that if an option
 	  doesn't depend on UNSUPPORTED it doesn't imply that is supported.)
 
+choice
+	prompt "How to deal with settings which cannot be satisified"
+	default UNSATISFIED_WARNING
+	help
+	  Some selectable options may depend on e.g. tool chain functionality.
+	  Select here how to deal with such when actually building a such
+	  configured hypervisor.
+
+config UNSATISFIED_SILENT
+	bool "silent"
+
+config UNSATISFIED_WARNING
+	bool "emit warnings"
+
+config UNSATISFIED_ERROR
+	bool "fail the build"
+
+endchoice
+
 config LTO
 	bool "Link Time Optimisation"
 	depends on BROKEN
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -588,6 +588,10 @@ $(TARGET): outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) include
 	$(Q)$(MAKE) $(build)=. arch/$(SRCARCH)/include/asm/asm-offsets.h
 	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
+ifneq ($(CONFIG_UNSATISFIED_SILENT),y)
+	$(Q)$(if $(strip $(XEN_CONFIG_UNSATISFIED)),$(MAKE),:) \
+	    $(build)=. 'XEN_CONFIG_UNSATISFIED=$(XEN_CONFIG_UNSATISFIED)' check_unsatisfied
+endif
 
 SUBDIRS = xsm arch common crypto drivers lib test
 define all_sources
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -88,3 +88,11 @@ targets += prelink.o
 
 $(TARGET): prelink.o FORCE
 	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) $@
+
+PHONY += check_unsatisfied
+check_unsatisfied:
+	$(Q): $(if $(filter y,$(CONFIG_UNSATISFIED_WARNING)), \
+	           $(warning The following selections could not be satisfied:), \
+	           $(shell echo 'The following selections could not be satisfied:' >&2)) \
+	      $(foreach c,$(sort $(XEN_CONFIG_UNSATISFIED)),$(shell echo ' - CONFIG_$c' >&2)) \
+	      $(if $(filter y,$(CONFIG_UNSATISFIED_ERROR)),$(error Failing build))


