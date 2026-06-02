Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Clu/M30JH2rpdwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:49:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C47B6305E3
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:49:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=CRi5iJMu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325290.1590799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSIL-0002Yb-0z; Tue, 02 Jun 2026 16:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325290.1590799; Tue, 02 Jun 2026 16:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSIK-0002X6-TM; Tue, 02 Jun 2026 16:48:48 +0000
Received: by outflank-mailman (input) for mailman id 1325290;
 Tue, 02 Jun 2026 16:48:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wUSIJ-0002K7-Hy
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:48:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUSII-00FO3p-Ur
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 18:48:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a1f095d-e002-0a2a0a5209dd-0a2a450bbc6a-20
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:48:46 +0200
Received: from [40.93.201.54]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a1f096b-212f-0a2a450b0019-285dc936d2da-4
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:48:46 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SA1PR03MB6644.namprd03.prod.outlook.com (2603:10b6:806:1cf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 16:48:14 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 16:48:14 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knxJeJ8sw7neZDvuJ1WCRixLX5s8ztnI4QS/kz5QZsqPwBYEqGFhIpY9sYOna3rwW4czFlpr486WA5Qwr8tlA4I+Ig8OTyWFpV006oGZrfEP7ntRXJPw+mSKcTBiF/BiULZLDfKpGp3F08JA70ZZmkf+F0zLclxJ92gYT/pMLnfshMMrvkCA5BYBVeEmTov3CfBwkurjny6+jyw5j9m0ScAkG4BQunkrCWrCTrzz7mQCqYV+v6W01AKBJcWLIM8NLaF3A9MwdxJEiY8tQHZwbyqOaiPz11nupfg+E5jy2xL7M7a8yO1q8NwK85ZsuR0uxiKRk+utpiRbfHCSjepkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5SMf9+M3eYkK+VCoT5N51c8wrzFph7I+7rr12mI5fg=;
 b=QT6Mdre2a2czDMZefxt+WNf0XT07R2mCOgOgLr0LzR/rVrVxkoDraYekAu9fuE7u26BAT6pto09l5tuss5Rh3FH7ewPt9jg3ytbFlt7yRyjC12vYSOJKzbmLJbNuW2oAi688EiGVcU/rzVRbCeMOWRicZnTT8wpL3ooVhIb5x+pV26P7IGymHos1MCpgv8XS9UtslR7SNA4QdrKsOnzlHoYxpyD8sOw1vY0dyYYJDzAiDB0O0gu+/est6P36TvUlVFfEmvLH22nKuiD1FGQ3KmRPrspx4e73v7s7GtkZXPMVLztrKw6LVS64wWiILlYALEso/p2xl+GepeHVxl69tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5SMf9+M3eYkK+VCoT5N51c8wrzFph7I+7rr12mI5fg=;
 b=CRi5iJMucJhz9xfdJDkuk/LYtGYRJbJOH1CUilTVlzU+K6GGoNt3ZuPnMdCqauq52Xi8db/VXcd2nnNPY4887nxRukWHyLEk/Jkvixrx70k1rmEk9pTpWSw7BI4UXVGzmff4ROkoGla4UAgofPFD35bMgEFm4MDyWIXMBa2d6HI=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 2/2] x86: Implement crash kexec for EFI
Date: Tue,  2 Jun 2026 17:49:11 +0100
Message-ID: <20260602164911.2684471-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260602164911.2684471-1-kevin.lampis@citrix.com>
References: <20260602164911.2684471-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::15) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SA1PR03MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: cd310bfd-2a9e-47de-550f-08dec0c6bcd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|3023799007|18002099003|22082099003|6133799003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	CNoImHOTmGNMIazauwR5UdZyY6xdSe4QV6OSOSh2TXSCMFZ9h8RRom9/RjynsN0F7V8WnK6XZIbkLGD0XbRM9u14XiJERamL9Hucd+BQxBwdK20RleisnRdNEcEwoO4gAIEBgrzEPn+6zfJwjI48MEz1qthgnv4Quzh/7aN927WTC3bLoLAUkl1ZM1ADjk0Ii9oaClNrQ1NeGXUyeFrKd3PV9H4tHl/wEtw8e2gm+qvZDOnXWGWTjNfkve6ei7QcxKxYX1Oc+EimAsvrC7Blfhhyxh342uk7c7g+DUaj8mX59LaeRKoJ1DwQNYwaXhC/w6zQ67osiy2TWA2HFGV24/fIgAqeZa/s2Ozq6UOMZmXhOe1S4nDdACUlofWLrfW1LWv+iynenZRZeRkNNGdaSjrYLbn0j/cFuDRf/dHRSA1Ef5/bJCWTuVVOJIsiA71gmFVohJPBlyy3DiYlJRkRcQuqdHeDhogCSSMPG77pwfAhyVd5t7sRAOT5IKUlZCww+a26Cm3SaHGYNV8xwACtuolwyAPpb9UMdz9uJQ+zaDDimIqWkUNvYKB4G7prY0vJOIb3sUrHmcUH3hxnuwPxx8h1OWPDktHJzDgsatqez8hq2GhmDcOCI4m7kuazRIBG+2YYIwqMKfdPcvyIpbkKKs08F35Ypta0DBkmrsHFAxVf4JTVMZFa/F45VvfpRLPd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(18002099003)(22082099003)(6133799003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CpVDWeL3qnXF5nm8tmrwOhzL9amnNpaTI4IC1yLsT/z8we5sKyXCyktptcGA?=
 =?us-ascii?Q?C2SNTML6EyrghbpRgpfU9xZC9AuuN6RXKSN08L4tFM4ykD5Trg+9960Y3AO3?=
 =?us-ascii?Q?12kyrGB4ReLj/e0UNauYbNZjC57UITcEbEVhoURJ32SnxGn3SseN66FCzl8J?=
 =?us-ascii?Q?/AqRo7KGVzKsXRyIxipV4SQ/zCdealwO2ls1osKZbwRMDG6nHd+DfcKWIvng?=
 =?us-ascii?Q?fm+bsmmi+HxM0f7sC5jMa+i2Zn4M0aVbun3yJSGMu83+IKh4OkRKuSXf79gQ?=
 =?us-ascii?Q?2OhnGhbaRK06qj0pqIgd7S+d0wD3c//w1UcptUmKxaZa+oAhC6ry9lp+td+e?=
 =?us-ascii?Q?qC0J338zh0JDHnlAVVr0ca/TRNMfogOF4vY8OlFtZ1RQFiT0nabcsLqqCord?=
 =?us-ascii?Q?QeixMVvfy3aD0e4QlM2OfvE5zow0nSNkuYEVOWJl/vF52ELENygGue6clgHR?=
 =?us-ascii?Q?Dyl48AiT2hd0RxBxVmb09Y0QQxL+PttCT7gAbf64HO7xRJoBBeXloPdcWUnw?=
 =?us-ascii?Q?MXOS2dNZ5HDfATz8SQGtjVnQU8s6dHOm/2fN+IyWNM1pXzQqouBOHHS+sIiG?=
 =?us-ascii?Q?xhYI9eplku5OEkRYl2sUrPhyMdgn3SXLt9Q3k6X4NPploqH0GZllUO3CaMP7?=
 =?us-ascii?Q?MmnMY4cfNfYUYVPA9p0Fuv+3eeAftSCz5iTNNROzSeGOEOF7+oPMSlDJ8EdC?=
 =?us-ascii?Q?4CtqM/QYqifcwOl7UTcr9xb8ib8O0/XF8jWBuIMSts3y2xGR3POGXdB1ZQBJ?=
 =?us-ascii?Q?61SJcB13ayaG8d8rKvMDJBCmXIcNyxXQClQ3DZGhcK788JBEEKq0+tLAMakl?=
 =?us-ascii?Q?3Xykl80MuRTfzvLPkORfIREUJYmpnjYrmKwUJ988t6mgPYZ45SrOgEfbcrjy?=
 =?us-ascii?Q?L0vGQh8yUVnMPZjhbRxsqR3OnsdsYAXfB8zR4TpmT/n4yzIS4ETPXJHsQggy?=
 =?us-ascii?Q?+opMQspu+R1MiHrWzUYRzHFlEcbxXXMu+mNk8nIyDSCgLNc3QkurCOb8CgRd?=
 =?us-ascii?Q?zN+0EmUaqqpoyqdjl0NZaqpFGxTBZ+RZSBetymWuBwMFDpdI74OXCK8R/Mse?=
 =?us-ascii?Q?f8iPZXGzLlTR3z7Pj7W+6630Q/Qku67jIblgm0TPXU/KNSv61B85Kk2buBN5?=
 =?us-ascii?Q?lmz/7AS+2VaEft3f5pKBrFLgInOAfQZbr8UUvyHBM5cUmDpvEpk6PZxr4Zqz?=
 =?us-ascii?Q?L6XXC4OIK/YPG562eDIb+Rc9ZuPHSHSKbes/u8yiuc8BHWAJXMhN6xTBqFqR?=
 =?us-ascii?Q?xmUO8iCZTpyALAbGaRbfudjzx5Lq47t3OZ/rKbCZ/Msw4HD8MwXFozE4mTQK?=
 =?us-ascii?Q?UNIQ29ealadEdqZF3ZMgPG6MvHU3JJaf/Gd5fHm1uULx7baJiCcG77z8LUjk?=
 =?us-ascii?Q?kGrHFWSgNXyBE+i611KHwaBIlPQI0OQQVVSl146HnbDyrXCPx2sojPHFrI+p?=
 =?us-ascii?Q?yz1nAzeVTv4mFf+92qDO7uk3PREhCLO6w9I07JPCYhtRHzjOsvomo959GCDz?=
 =?us-ascii?Q?k4Lp5OwzlcuMvWa84gEz40v/c/U3IyryL0vt36nAakdGksnVZP5NjNHbrNqm?=
 =?us-ascii?Q?3c4HPj9I4YD93gDedMvJ9pPPB2DmIRHAK9qYhf91D7L5ern06Dei9zthBPGw?=
 =?us-ascii?Q?/lwqtJKG4wOjrcXlI+XyF2yLBEKewsC8NVjj4IeSba/DLV3qxVkQLkTeKbPD?=
 =?us-ascii?Q?sL+msk3n45AxP/Ja6Q0cS02xaGIVXFNw6ROivoh+8BczpWkdDIwFyXGbgFhn?=
 =?us-ascii?Q?rFDUed468g=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd310bfd-2a9e-47de-550f-08dec0c6bcd3
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:48:13.9654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06XaZZvPsyEVH3xUw3iSTNibQgei7BQE9Dc9O/Oyv1Jl/cUJiwsyFnXQx4yNGdOGFidj9qPMbjwbVsCWGql4Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6644
X-purgate-ID: tlsNG-42698a/1780418926-19969F3B-9002A3BA/0/0
X-purgate-type: clean
X-purgate-size: 29447
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email,xmission.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C47B6305E3

This change adds a new KEXEC_TYPE_CRASH_EFI load type which is suitable
for use when Secure Boot is enabled.

When this load type is used, the caller should not pass purgatory as one
of the kexec segments. This is because in Secure Boot mode we cannot
accept and run arbitrary unsigned code from dom0 userspace. Instead,
Xen prepares any necessary intermediary glue code itself.

When Secure Boot/lockdown mode is enabled only the KEXEC_TYPE_CRASH_EFI
type will be accepted.

During load a digest of the kexec segments is calculated and stored. The
digest is calculated again during kexec_reboot, this removes the need to
re-verify the signatures.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
---
 xen/arch/x86/bzimage.c                   |  40 +---
 xen/arch/x86/include/asm/machine_kexec.h |   2 +-
 xen/arch/x86/machine_kexec.c             |  10 +-
 xen/arch/x86/x86_64/kexec_reloc.S        |  16 ++
 xen/common/kexec.c                       |  41 +++-
 xen/common/kimage.c                      | 264 +++++++++++++++++++----
 xen/include/public/kexec.h               |  23 +-
 xen/include/xen/kimage.h                 |  23 +-
 xen/include/xen/x86-linux.h              |  62 ++++++
 9 files changed, 381 insertions(+), 100 deletions(-)
 create mode 100644 xen/include/xen/x86-linux.h

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index 66f648f311..f4d5b584cb 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -6,6 +6,7 @@
 #include <xen/gunzip.h>
 #include <xen/decompress.h>
 #include <xen/libelf.h>
+#include <xen/x86-linux.h>
 #include <asm/bzimage.h>
 
 static __init unsigned long output_length(void *image, unsigned long image_len)
@@ -13,45 +14,6 @@ static __init unsigned long output_length(void *image, unsigned long image_len)
     return *(uint32_t *)(image + image_len - 4);
 }
 
-struct __packed setup_header {
-        uint8_t         _pad0[0x1f1];           /* skip uninteresting stuff */
-        uint8_t         setup_sects;
-        uint16_t        root_flags;
-        uint32_t        syssize;
-        uint16_t        ram_size;
-        uint16_t        vid_mode;
-        uint16_t        root_dev;
-        uint16_t        boot_flag;
-        uint16_t        jump;
-        uint32_t        header;
-#define HDR_MAGIC               "HdrS"
-#define HDR_MAGIC_SZ    4
-        uint16_t        version;
-#define VERSION(h,l)    (((h)<<8) | (l))
-        uint32_t        realmode_swtch;
-        uint16_t        start_sys;
-        uint16_t        kernel_version;
-        uint8_t         type_of_loader;
-        uint8_t         loadflags;
-        uint16_t        setup_move_size;
-        uint32_t        code32_start;
-        uint32_t        ramdisk_image;
-        uint32_t        ramdisk_size;
-        uint32_t        bootsect_kludge;
-        uint16_t        heap_end_ptr;
-        uint16_t        _pad1;
-        uint32_t        cmd_line_ptr;
-        uint32_t        initrd_addr_max;
-        uint32_t        kernel_alignment;
-        uint8_t         relocatable_kernel;
-        uint8_t         _pad2[3];
-        uint32_t        cmdline_size;
-        uint32_t        hardware_subarch;
-        uint64_t        hardware_subarch_data;
-        uint32_t        payload_offset;
-        uint32_t        payload_length;
-    };
-
 static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
 {
     if ( len < sizeof(struct setup_header) )
diff --git a/xen/arch/x86/include/asm/machine_kexec.h b/xen/arch/x86/include/asm/machine_kexec.h
index 3e189acf24..e2d7b4854a 100644
--- a/xen/arch/x86/include/asm/machine_kexec.h
+++ b/xen/arch/x86/include/asm/machine_kexec.h
@@ -7,7 +7,7 @@
 
 extern void kexec_reloc(unsigned long reloc_code, unsigned long reloc_pt,
                         unsigned long ind_maddr, unsigned long entry_maddr,
-                        unsigned long flags);
+                        unsigned long flags, unsigned long rsi);
 
 extern const char kexec_reloc_end[];
 
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index f921eec5aa..e61b63ac53 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -154,6 +154,13 @@ void machine_kexec(struct kexec_image *image)
     int i;
     unsigned long reloc_flags = 0;
 
+    if ( image->type == KEXEC_TYPE_CRASH_EFI &&
+         kimage_verify_digest(image) != 0 )
+    {
+        printk(XENLOG_ERR "kexec digest failed, won't boot corrupted image\n");
+        for (;;);
+    }
+
     /* We are about to permenantly jump out of the Xen context into the kexec
      * purgatory code.  We really dont want to be still servicing interupts.
      */
@@ -198,7 +205,8 @@ void machine_kexec(struct kexec_image *image)
 
     kexec_reloc(page_to_maddr(image->control_code_page),
                 page_to_maddr(image->aux_page),
-                image->head, image->entry_maddr, reloc_flags);
+                image->head, image->entry_maddr, reloc_flags,
+                image->efi_boot_params);
 }
 
 int machine_kexec_get(xen_kexec_range_t *range)
diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index b52d31a654..aa725266e2 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -33,6 +33,7 @@ FUNC(kexec_reloc, PAGE_SIZE)
         /* %rdx - indirection page maddr */
         /* %rcx - entry maddr (%rbp) */
         /* %r8 - flags */
+        /* %r9 - boot params (EFI only) */
 
         movq    %rcx, %rbp
 
@@ -75,6 +76,21 @@ FUNC(kexec_reloc, PAGE_SIZE)
         testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
         jnz     .L_call_32_bit
 
+        movq %r9, %rsi /* boot params */
+        xor %rdi, %rdi
+        xor %rax, %rax
+        xor %rbx, %rbx
+        xor %rcx, %rcx
+        xor %rdx, %rdx
+        xor %r8,  %r8
+        xor %r9,  %r9
+        xor %r10, %r10
+        xor %r11, %r11
+        xor %r12, %r12
+        xor %r13, %r13
+        xor %r14, %r14
+        xor %r15, %r15
+
         /* Jump to the image entry point */
         jmp     *%rbp
 
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 65776a95fd..14f15dd371 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -34,6 +34,7 @@
 #ifdef CONFIG_COMPAT
 #include <compat/kexec.h>
 #endif
+#include <xen/lockdown.h>
 
 bool __read_mostly kexecing;
 
@@ -910,7 +911,7 @@ static uint16_t kexec_load_v1_arch(void)
 }
 
 static int kexec_segments_add_segment(unsigned int *nr_segments,
-                                      xen_kexec_segment_t *segments,
+                                      struct kimage_segment *segments,
                                       mfn_t mfn)
 {
     paddr_t maddr = mfn_to_maddr(mfn);
@@ -936,7 +937,7 @@ static int kexec_segments_add_segment(unsigned int *nr_segments,
 
 static int kexec_segments_from_ind_page(mfn_t mfn,
                                         unsigned int *nr_segments,
-                                        xen_kexec_segment_t *segments,
+                                        struct kimage_segment *segments,
                                         bool compat)
 {
     void *page;
@@ -991,7 +992,7 @@ done:
 static int kexec_do_load_v1(xen_kexec_load_v1_t *load, int compat)
 {
     struct kexec_image *kimage = NULL;
-    xen_kexec_segment_t *segments;
+    struct kimage_segment *segments;
     uint16_t arch;
     unsigned int nr_segments = 0;
     mfn_t ind_mfn = maddr_to_mfn(load->image.indirection_page);
@@ -1001,7 +1002,7 @@ static int kexec_do_load_v1(xen_kexec_load_v1_t *load, int compat)
     if ( arch == EM_NONE )
         return -ENOSYS;
 
-    segments = xmalloc_array(xen_kexec_segment_t, KEXEC_SEGMENT_MAX);
+    segments = xmalloc_array(struct kimage_segment, KEXEC_SEGMENT_MAX);
     if ( segments == NULL )
         return -ENOMEM;
 
@@ -1103,24 +1104,35 @@ static int kexec_load_v1_compat(XEN_GUEST_HANDLE_PARAM(void) uarg)
 static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     xen_kexec_load_t load;
-    xen_kexec_segment_t *segments;
+    struct kimage_segment *segments;
     struct kexec_image *kimage = NULL;
     int ret;
+    unsigned int i;
 
     if ( copy_from_guest(&load, uarg, 1) )
         return -EFAULT;
 
+    if ( load.type == KEXEC_TYPE_DEFAULT_EFI )
+        return -EOPNOTSUPP;
+
+    if ( load.type != KEXEC_TYPE_CRASH_EFI && is_locked_down() )
+        return -EPERM;
+
     if ( load.nr_segments >= KEXEC_SEGMENT_MAX )
         return -EINVAL;
 
-    segments = xmalloc_array(xen_kexec_segment_t, load.nr_segments);
+    segments = xmalloc_array(struct kimage_segment, load.nr_segments);
     if ( segments == NULL )
         return -ENOMEM;
 
-    if ( copy_from_guest(segments, load.segments.h, load.nr_segments) )
+    for ( i = 0; i < load.nr_segments; i++ )
     {
-        ret = -EFAULT;
-        goto error;
+        if ( copy_from_guest_offset((xen_kexec_segment_t *)&segments[i],
+                                    load.segments.h, i, 1) )
+        {
+            ret = -EFAULT;
+            goto error;
+        }
     }
 
     ret = kimage_alloc(&kimage, load.type, load.arch, load.entry_maddr,
@@ -1132,6 +1144,13 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
     if ( ret < 0 )
         goto error;
 
+    if ( load.type == KEXEC_TYPE_CRASH_EFI )
+    {
+        ret = kimage_efi_setup(kimage, load.parameters);
+        if ( ret )
+            return ret;
+    }
+
     ret = kexec_load_slot(kimage);
     if ( ret < 0 )
         goto error;
@@ -1235,7 +1254,9 @@ static int do_kexec_op_internal(unsigned long op,
                 ret = kexec_get_range(uarg);
         break;
     case KEXEC_CMD_kexec_load_v1:
-        if ( compat )
+        if ( is_locked_down() )
+            ret = -EPERM;
+        else if ( compat )
             ret = kexec_load_v1_compat(uarg);
         else
             ret = kexec_load_v1(uarg);
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 6202491f7e..69833d3ba6 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -19,10 +19,21 @@
 #include <xen/guest_access.h>
 #include <xen/mm.h>
 #include <xen/kexec.h>
+#include <xen/x86-linux.h>
 #include <xen/kimage.h>
+#include <xen/sha2.h>
 
 #include <asm/page.h>
 
+#define KIMAGE_SHA256_REGIONS 16
+
+typedef struct
+{
+    uint64_t start;
+    uint64_t len;
+}
+sha256_region_t;
+
 /*
  * When kexec transitions to the new kernel there is a one-to-one
  * mapping between physical and virtual addresses.  On processors
@@ -83,7 +94,7 @@ static struct page_info *kimage_alloc_zeroed_page(unsigned memflags)
 
 static int do_kimage_alloc(struct kexec_image **rimage, paddr_t entry,
                            unsigned long nr_segments,
-                           xen_kexec_segment_t *segments, uint8_t type)
+                           struct kimage_segment *segments, uint8_t type)
 {
     struct kexec_image *image;
     unsigned long i;
@@ -106,29 +117,6 @@ static int do_kimage_alloc(struct kexec_image **rimage, paddr_t entry,
     INIT_PAGE_LIST_HEAD(&image->dest_pages);
     INIT_PAGE_LIST_HEAD(&image->unusable_pages);
 
-    /*
-     * Verify we have good destination addresses.  The caller is
-     * responsible for making certain we don't attempt to load the new
-     * image into invalid or reserved areas of RAM.  This just
-     * verifies it is an address we can use.
-     *
-     * Since the kernel does everything in page size chunks ensure the
-     * destination addresses are page aligned.  Too many special cases
-     * crop of when we don't do this.  The most insidious is getting
-     * overlapping destination addresses simply because addresses are
-     * changed to page size granularity.
-     */
-    result = -EADDRNOTAVAIL;
-    for ( i = 0; i < nr_segments; i++ )
-    {
-        paddr_t mstart, mend;
-
-        mstart = image->segments[i].dest_maddr;
-        mend   = mstart + image->segments[i].dest_size;
-        if ( (mstart & ~PAGE_MASK) || (mend & ~PAGE_MASK) )
-            goto out;
-    }
-
     /*
      * Verify our destination addresses do not overlap.  If we allowed
      * overlapping destination addresses through very weird things can
@@ -208,23 +196,18 @@ out:
 
 static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
                                unsigned long nr_segments,
-                               xen_kexec_segment_t *segments)
+                               struct kimage_segment *segments)
 {
     return do_kimage_alloc(rimage, entry, nr_segments, segments,
                            KEXEC_TYPE_DEFAULT);
 }
 
-static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
-                              unsigned long nr_segments,
-                              xen_kexec_segment_t *segments)
+static int do_kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
+                                 unsigned long nr_segments,
+                                 struct kimage_segment *segments)
 {
     unsigned long i;
 
-    /* Verify we have a valid entry point */
-    if ( (entry < kexec_crash_area.start)
-         || (entry > kexec_crash_area.start + kexec_crash_area.size))
-        return -EADDRNOTAVAIL;
-
     /*
      * Verify we have good destination addresses.  Normally
      * the caller is responsible for making certain we don't
@@ -254,6 +237,25 @@ static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
                            KEXEC_TYPE_CRASH);
 }
 
+static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
+                              unsigned long nr_segments,
+                              struct kimage_segment *segments)
+{
+    /* Verify we have a valid entry point */
+    if ( (entry < kexec_crash_area.start)
+         || (entry > kexec_crash_area.start + kexec_crash_area.size))
+        return -EADDRNOTAVAIL;
+
+    return do_kimage_crash_alloc(rimage, entry, nr_segments, segments);
+}
+
+static int kimage_crash_alloc_efi(struct kexec_image **rimage, paddr_t entry,
+                                  unsigned long nr_segments,
+                                  struct kimage_segment *segments)
+{
+    return do_kimage_crash_alloc(rimage, entry, nr_segments, segments);
+}
+
 static int kimage_is_destination_range(struct kexec_image *image,
                                        paddr_t start,
                                        paddr_t end)
@@ -666,7 +668,7 @@ found:
 }
 
 static int kimage_load_normal_segment(struct kexec_image *image,
-                                      xen_kexec_segment_t *segment)
+                                      struct kimage_segment *segment)
 {
     unsigned long to_copy;
     unsigned long src_offset;
@@ -719,7 +721,7 @@ static int kimage_load_normal_segment(struct kexec_image *image,
 }
 
 static int kimage_load_crash_segment(struct kexec_image *image,
-                                     xen_kexec_segment_t *segment)
+                                     struct kimage_segment *segment)
 {
     /*
      * For crash dumps kernels we simply copy the data from user space
@@ -727,12 +729,14 @@ static int kimage_load_crash_segment(struct kexec_image *image,
      */
     paddr_t dest;
     unsigned long sbytes, dbytes;
+    unsigned int dest_offset;
     int ret = 0;
     unsigned long src_offset = 0;
 
     sbytes = segment->buf_size;
     dbytes = segment->dest_size;
     dest = segment->dest_maddr;
+    dest_offset = segment->dest_offset;
 
     while ( dbytes )
     {
@@ -742,30 +746,35 @@ static int kimage_load_crash_segment(struct kexec_image *image,
 
         dest_mfn = dest >> PAGE_SHIFT;
 
-        dchunk = PAGE_SIZE;
+        dchunk = PAGE_SIZE - dest_offset;
         schunk = min(dchunk, sbytes);
 
         dest_va = map_domain_page(_mfn(dest_mfn));
         if ( !dest_va )
             return -EINVAL;
 
-        ret = copy_from_guest_offset(dest_va, segment->buf.h, src_offset, schunk);
+        if ( dest_offset )
+            memset(dest_va, 0, dest_offset);
+        ret = copy_from_guest_offset(dest_va + dest_offset, segment->buf.h,
+                                     src_offset, schunk);
         memset(dest_va + schunk, 0, dchunk - schunk);
 
         unmap_domain_page(dest_va);
         if ( ret )
             return -EFAULT;
 
-        dbytes -= dchunk;
+        dbytes -= dchunk + dest_offset;
         sbytes -= schunk;
-        dest += dchunk;
+        dest += dchunk + dest_offset;
         src_offset += schunk;
+        dest_offset = 0;
     }
 
     return 0;
 }
 
-static int kimage_load_segment(struct kexec_image *image, xen_kexec_segment_t *segment)
+static int kimage_load_segment(struct kexec_image *image,
+                               struct kimage_segment *segment)
 {
     int result = -ENOMEM;
     paddr_t addr;
@@ -795,10 +804,30 @@ static int kimage_load_segment(struct kexec_image *image, xen_kexec_segment_t *s
 }
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
-                 uint64_t entry_maddr,
-                 uint32_t nr_segments, xen_kexec_segment_t *segment)
+                 uint64_t entry_maddr, uint32_t nr_segments,
+                 struct kimage_segment *segment)
 {
     int result;
+    unsigned int i;
+
+    for ( i = 0; i < nr_segments; i++ )
+    {
+        paddr_t mend;
+
+        /*
+         * Stash the destination offset-in-page for use when copying the
+         * buffer later.
+         */
+        segment[i].dest_offset = PAGE_OFFSET(segment[i].dest_maddr);
+
+        /*
+         * Align down the start address to page size and align up the end
+         * address to page size.
+         */
+        mend = segment[i].dest_maddr + segment[i].dest_size;
+        segment[i].dest_maddr &= PAGE_MASK;
+        segment[i].dest_size = ROUNDUP(mend, PAGE_SIZE) - segment[i].dest_maddr;
+    }
 
     switch( type )
     {
@@ -808,6 +837,10 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
     case KEXEC_TYPE_CRASH:
         result = kimage_crash_alloc(rimage, entry_maddr, nr_segments, segment);
         break;
+    case KEXEC_TYPE_CRASH_EFI:
+        result = kimage_crash_alloc_efi(rimage, entry_maddr,
+                                        nr_segments, segment);
+        break;
     default:
         result = -EINVAL;
         break;
@@ -939,6 +972,153 @@ done:
     return ret;
 }
 
+static int kimage_calc_one_digest(struct sha2_256_state *ctx,
+                                  struct kimage_segment *segment)
+{
+    paddr_t dest;
+    unsigned long sbytes;
+    unsigned int dest_offset;
+    int ret = 0;
+
+    sbytes = segment->buf_size;
+    dest = segment->dest_maddr + segment->dest_offset;
+    dest_offset = segment->dest_offset;
+
+    while ( sbytes )
+    {
+        unsigned long dest_mfn;
+        void *dest_va;
+        size_t schunk, dchunk;
+
+        dest_mfn = dest >> PAGE_SHIFT;
+
+        dchunk = PAGE_SIZE - dest_offset;
+        schunk = min(dchunk, sbytes);
+
+        dest_va = map_domain_page(_mfn(dest_mfn));
+        if ( !dest_va )
+            return -EINVAL;
+
+        sha2_256_update(ctx, dest_va + dest_offset, schunk);
+
+        unmap_domain_page(dest_va);
+        if ( ret )
+            return -EFAULT;
+
+        sbytes -= schunk;
+        dest += dchunk;
+        dest_offset = 0;
+    }
+    return 0;
+}
+
+static int kimage_calc_digest(const struct kexec_image *image,
+                              uint8_t digest[SHA2_256_DIGEST_SIZE])
+{
+    int ret;
+    sha256_region_t regions[KIMAGE_SHA256_REGIONS] = {{0}};
+    struct sha2_256_state ctx;
+    unsigned int s;
+
+    if ( image->nr_segments > KIMAGE_SHA256_REGIONS )
+    {
+        dprintk(XENLOG_DEBUG, "More segments than allocated SHA256 regions\n");
+        return -E2BIG;
+    }
+
+
+    sha2_256_init(&ctx);
+
+    for ( s = 0; s < image->nr_segments; s++ ) {
+        ret = kimage_calc_one_digest(&ctx, &image->segments[s]);
+        if ( ret )
+            return ret;
+
+        regions[s].start = image->segments[s].dest_maddr +
+                           image->segments[s].dest_offset;
+        regions[s].len = image->segments[s].buf_size;
+    }
+
+    sha2_256_final(&ctx, digest);
+    return 0;
+}
+
+int kimage_verify_digest(const struct kexec_image *image)
+{
+    uint8_t digest[SHA2_256_DIGEST_SIZE];
+    int ret;
+
+    ret = kimage_calc_digest(image, digest);
+    if ( ret )
+        return ret;
+
+    if ( memcmp(digest, image->digest, sizeof(digest)) != 0 )
+        return 1;
+
+    return 0;
+}
+
+/*
+ * Find the entry point to the new kernel, we need to map the crash region into
+ * memory in order to read the kernel header.
+ */
+#define KERNEL_SEGMENT_IDX 0
+static uint64_t kimage_find_kernel_entry_maddr(struct kexec_image *image)
+{
+    uint64_t alignment_addr;
+    uint32_t alignment;
+    unsigned long dest_mfn;
+    void *dest_va;
+
+    alignment_addr = image->segments[KERNEL_SEGMENT_IDX].dest_maddr +
+                         image->segments[KERNEL_SEGMENT_IDX].dest_offset +
+                         offsetof(struct setup_header, kernel_alignment);
+
+    dest_mfn = alignment_addr >> PAGE_SHIFT;
+    dest_va = map_domain_page(_mfn(dest_mfn));
+    if ( !dest_va )
+        return -EINVAL;
+
+    alignment = *((uint32_t *) ((uint8_t *) dest_va +
+                                                PAGE_OFFSET(alignment_addr)));
+
+    unmap_domain_page(dest_va);
+
+    /*
+     * Ensure the kernel alignment is a valid LOAD_PHYSICAL_ADDR,
+     * which ranges from 0x200000 (2MiB) to 0x1000000 (16Mib) on 64-bit systems
+     * as defined in the kernel x86 Kconfig
+     */
+    if ( alignment % 0x200000 != 0 ||
+         alignment < 0x200000 ||
+         alignment > 0x1000000 )
+        return -EINVAL;
+
+    return ROUNDUP(image->segments[KERNEL_SEGMENT_IDX].dest_maddr +
+                       image->segments[KERNEL_SEGMENT_IDX].dest_offset,
+                   alignment) +
+                   0x200;
+}
+
+int kimage_efi_setup(struct kexec_image *image, uint64_t parameters)
+{
+    int ret;
+    int64_t rip;
+
+    ret = kimage_calc_digest(image, image->digest);
+    if ( ret )
+        return ret;
+
+    rip = kimage_find_kernel_entry_maddr(image);
+    if ( rip < 0 )
+        return -EINVAL;
+
+    image->efi_boot_params = parameters;
+    image->entry_maddr = rip;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
index 40d79e936b..9bc94c6fd6 100644
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -56,15 +56,24 @@
 /*
  * Kexec supports two types of operation:
  * - kexec into a regular kernel, very similar to a standard reboot
- *   - KEXEC_TYPE_DEFAULT is used to specify this type
+ *   - KEXEC_TYPE_DEFAULT or KEXEC_TYPE_DEFAULT_EFI are used to specify
+ *     this type
+ *   - in case of KEXEC_TYPE_DEFAULT_EFI the first segment will
+ *     point to full kernel to load and entry point will point to
+ *     parameters
  * - kexec into a special "crash kernel", aka kexec-on-panic
- *   - KEXEC_TYPE_CRASH is used to specify this type
+ *   - KEXEC_TYPE_CRASH or KEXEC_TYPE_CRASH_EFI are used to specify this
+ *     type
+ *   - see above for differences between KEXEC_TYPE_CRASH and
+ *     KEXEC_TYPE_CRASH_EFI
  *   - parts of our system may be broken at kexec-on-panic time
  *     - the code should be kept as simple and self-contained as possible
  */
 
-#define KEXEC_TYPE_DEFAULT 0
-#define KEXEC_TYPE_CRASH   1
+#define KEXEC_TYPE_DEFAULT     0
+#define KEXEC_TYPE_CRASH       1
+#define KEXEC_TYPE_DEFAULT_EFI 2
+#define KEXEC_TYPE_CRASH_EFI   3
 
 
 /* The kexec implementation for Xen allows the user to load two
@@ -195,7 +204,11 @@ typedef struct xen_kexec_load {
         XEN_GUEST_HANDLE(xen_kexec_segment_t) h;
         uint64_t _pad;
     } segments;
-    uint64_t entry_maddr; /* image entry point machine address. */
+    /* image entry point machine address or parameters in case of EFI. */
+    union {
+        uint64_t entry_maddr;
+        uint64_t parameters;
+    };
 } xen_kexec_load_t;
 DEFINE_XEN_GUEST_HANDLE(xen_kexec_load_t);
 
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index fccba1d88d..5bfb678897 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -11,18 +11,30 @@
 
 #include <xen/list.h>
 #include <xen/mm.h>
+#include <xen/sha2.h>
 #include <public/kexec.h>
 
 #define KEXEC_SEGMENT_MAX 16
 
 typedef paddr_t kimage_entry_t;
 
+struct kimage_segment {
+    union {
+        XEN_GUEST_HANDLE(const_void) h;
+        uint64_t _pad;
+    } buf;
+    uint64_t buf_size;
+    uint64_t dest_maddr;
+    uint64_t dest_size;
+    unsigned int dest_offset;
+};
+
 struct kexec_image {
     uint8_t type;
     uint16_t arch;
     uint64_t entry_maddr;
     uint32_t nr_segments;
-    xen_kexec_segment_t *segments;
+    struct kimage_segment *segments;
 
     kimage_entry_t head;
     struct page_info *entry_page;
@@ -37,11 +49,16 @@ struct kexec_image {
 
     /* Address of next control page to allocate for crash kernels. */
     paddr_t next_crash_page;
+
+    uint8_t digest[SHA2_256_DIGEST_SIZE];
+
+    /* Address of boot params. Will be loaded into %rsi. For EFI kexec only. */
+    uint64_t efi_boot_params;
 };
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
                  uint64_t entry_maddr,
-                 uint32_t nr_segments, xen_kexec_segment_t *segment);
+                 uint32_t nr_segments, struct kimage_segment *segment);
 void kimage_free(struct kexec_image *image);
 int kimage_load_segments(struct kexec_image *image);
 struct page_info *kimage_alloc_control_page(struct kexec_image *image,
@@ -52,6 +69,8 @@ mfn_t kimage_entry_mfn(kimage_entry_t *entry, bool compat);
 unsigned long kimage_entry_ind(kimage_entry_t *entry, bool compat);
 int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
                      bool compat);
+int kimage_efi_setup(struct kexec_image *image, uint64_t parameters);
+int kimage_verify_digest(const struct kexec_image *image);
 
 #endif /* __ASSEMBLER__ */
 
diff --git a/xen/include/xen/x86-linux.h b/xen/include/xen/x86-linux.h
new file mode 100644
index 0000000000..940d830323
--- /dev/null
+++ b/xen/include/xen/x86-linux.h
@@ -0,0 +1,62 @@
+/*
+ * This file was extracted from x86-linux.h in kexec-tools
+ *
+ * Copyright (C) 2003-2010  Eric Biederman (ebiederm@xmission.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation (version 2 of the License).
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#ifndef X86_LINUX_H
+#define X86_LINUX_H
+
+struct __packed setup_header {
+    uint8_t         _pad0[0x1f1];           /* skip uninteresting stuff */
+    uint8_t         setup_sects;
+    uint16_t        root_flags;
+    uint32_t        syssize;
+    uint16_t        ram_size;
+    uint16_t        vid_mode;
+    uint16_t        root_dev;
+    uint16_t        boot_flag;
+    uint16_t        jump;
+    uint32_t        header;
+#define HDR_MAGIC               "HdrS"
+#define HDR_MAGIC_SZ    4
+    uint16_t        version;
+#define VERSION(h,l)    (((h)<<8) | (l))
+    uint32_t        realmode_swtch;
+    uint16_t        start_sys;
+    uint16_t        kernel_version;
+    uint8_t         type_of_loader;
+    uint8_t         loadflags;
+    uint16_t        setup_move_size;
+    uint32_t        code32_start;
+    uint32_t        ramdisk_image;
+    uint32_t        ramdisk_size;
+    uint32_t        bootsect_kludge;
+    uint16_t        heap_end_ptr;
+    uint16_t        _pad1;
+    uint32_t        cmd_line_ptr;
+    uint32_t        initrd_addr_max;
+    uint32_t        kernel_alignment;
+    uint8_t         relocatable_kernel;
+    uint8_t         _pad2[3];
+    uint32_t        cmdline_size;
+    uint32_t        hardware_subarch;
+    uint64_t        hardware_subarch_data;
+    uint32_t        payload_offset;
+    uint32_t        payload_length;
+};
+
+#endif /* X86_LINUX_H */
-- 
2.52.0


