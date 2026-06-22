Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tUJuMB5SOWpDqgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A066B0A74
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Gf0mRNnj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343893.1603143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgP9-0006DK-2C; Mon, 22 Jun 2026 15:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343893.1603143; Mon, 22 Jun 2026 15:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgP8-00067w-SF; Mon, 22 Jun 2026 15:17:42 +0000
Received: by outflank-mailman (input) for mailman id 1343893;
 Mon, 22 Jun 2026 15:17:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wbgP7-00062H-OF
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:17:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbgP7-0052r4-4s
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:17:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a39520c-bab6-0a2a0a5309dd-0a2a4502d4ac-14
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:41 +0200
Received: from [40.93.194.36]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a395213-fdf1-0a2a45020019-285dc224af76-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:40 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH9PR03MB649383.namprd03.prod.outlook.com (2603:10b6:510:3e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 15:17:38 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:17:38 +0000
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
 b=rlozvLKr0aBUznnvpMaAtqPB6HYCPXILfHthMrLqT+16HVmivBLvr/kGKuxNKJIiyzcTnep4tpy62gq/ixu1FNB7BvetvSRjvCRSWPLXK/rJv/A1vT/6TlNRjS5nF4bFOroh7yV33qZDwOsWVDZ/3c18Q91+cOPN+GArU7oyef8IIV0obkYU1VIqCZQGp/egiYMXr3YO6s4GSYth91q/X2Z/piy2TGzua8peN5nmxgO68tGxhD17nj5vHhZO3chwwbDDYuNqNI80u1t2whDl9NSvtldMJHi0ENQ6qbr4qg0dI0N+yMA9GY9rkK28c83qUr6wF/9TiosylqnrmeAiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kq3XUrFRCUR2ttK7TfS4U/324yvP/l6gtcQldulK+jo=;
 b=jIfWlFDUkgDYRU/YN6HNNNkaVeSyEXxtt2h45307mWcEPPEcPWrG0/lUU8HU4FD7dvYRKvdUyMQpGt1DkHaf3h+spRHJEJpYoWLI5nNGEeu/A+nPavE87AMBYXJTSd4cWyKEKRAVYzUgzYPZWdqNwceQsaG+WTPSrm01+VusZueyJBq+8ItF/IB0Jq/SH+bmgVxfs7Hmiihn1WljNx1+uKM6vjgDhsCFog53yZiG4liK7qj46GTt+eMO6Tg74mQWp8T2LUhlgjMSIVvKWNDnCkPgtdZFMu8FT2auuRhjGCKZmhTqaDPRjbL2mLwnEZybUcp+Y3yB5g+4CLSMYzmIqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kq3XUrFRCUR2ttK7TfS4U/324yvP/l6gtcQldulK+jo=;
 b=Gf0mRNnjWvXWii034c/q7oyI3+VRI9u+D90y2dKUSuLamsgaORWYjntJaAUssTN2IH3q/EtUi73LR4rfCryjklljWdZ9S8wfFEFXa3n0uIqHI6OMfG6mSgeFzzAIpyj7Jd3Jkuba+jreUlXF7W1der6Jt5z3e8Rhkgyv0uwuls0=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 5/7] x86/kexec: Implement new EFI load type
Date: Mon, 22 Jun 2026 16:18:31 +0100
Message-ID: <20260622151833.3397692-6-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260622151833.3397692-1-kevin.lampis@citrix.com>
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::14) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH9PR03MB649383:EE_
X-MS-Office365-Filtering-Correlation-Id: a80a05d9-99fd-4871-a8bd-08ded0716502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	24/YgtMKY/o1RN5MPBey37Y0Wa4Kp2MzgcA1/kSVudeyIvHQUx8ApBbt3ao0yd0U982mMeY8n3oGXrTXFXwmscsVYP6M/OmtZGZFSGMRuTVhKyup7AmQ87d7b7FfWIJuYXKLOysJwNaCZZe0w65GHc5bY5k9ganSIYD6bfh8RoFy6gAN7Yz+a5gbitch1/cuLY9J0twrsLuejA2s5GzlhbJD0LsEtDuxOSUlwpOddr/Sgk4jyIU3Ow0J1CXzvkxoa/UxLUtLZWmk9ykyhtF5amNGtoCQQLnmJbzLW0zKlmjQWyMqZHeYdt3QIKmGPauSEUdPhyW+Yy0hDDA1I5MrnzeO2xsbp8E5LxDJOIqobw/YymC2HKl5MINmhXkNy8WqYENczRNG/Y536k7CDLMphr5NpJsnUnWmAgnnJqw+zErWPPHsQOMTcdZObtGMUkSORJIJPLVQAkCj7ESYVYD1eTU36XqsUdhAPONNOfFiSl3cKL/kdLi6hLjXwGiC0UgnwScGPeXia4x6B9xkgtNmMf875ZrruMP6NJZrqBQNmIhy1gq1Z+UiK+B3sOV1qow2k7hKsoFDHa5aJkhqQRRqjGhdR4hCHo+BspxGa2/hQxstK0izY9eADeZVTU+7kiTK0Ox77WUyykFBGMQm6tP6hliyKSkNBICRG7wudgljEfI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y6aXfcYAifp/UkQm9/XFDRROi9UcnqN4yD73tQAbkrOANPsn1gZ2qm+Ud0tb?=
 =?us-ascii?Q?wb000urH12NmOubczQl9DFMmXbDWtmKPreoWtm9htVSS2a++cALWeecs4cL4?=
 =?us-ascii?Q?rh8YsQeRJbVJBbECdrzknIIArqD87iq3Uh18G/z39fPu/dir1EJGVZ6ryUpD?=
 =?us-ascii?Q?daTes/48Ty9+VbV+joQeOdR/SNyNnn8bKNWlt0uzKzxThV/fu2BPT2tNFQh0?=
 =?us-ascii?Q?RQktqTJmceLh9uDJQxr1zPQW62IYI187HOBdyWD5ToImPogyNdt+4NAYIL7a?=
 =?us-ascii?Q?p2A1VygVnLNWgBVVnDS3dpG3oykPoQYPx6gmXXZIJsfbBmeey4eh4jonG9X3?=
 =?us-ascii?Q?z69zi3qgJqePQdERB6mjju9wBV0kOSO4g5glcNqZp3iyTBCDAfVaIuk9qCzc?=
 =?us-ascii?Q?zj+QSg9qAlt84PeOs6zNyxiOlahvNjwXfhY6jxMLZZGrJrLs8xKxxiR4TTtj?=
 =?us-ascii?Q?68oQzgvvAf8J+hImgLIiZd3/iwFhv+lyB5ceh6g0SQ8FjpBkAjuRfy8xhtN9?=
 =?us-ascii?Q?E3396MBx/YeH0aEie00WSMGxqs91HpFt8bGolOUwJ4kTJtaf+azl7Zfb3Ayp?=
 =?us-ascii?Q?bdJU+qsu/9XOzTIi+BQPpUm1NnCOWouIGqmXvsm1D9SyrSMAAq6Rz5tZ/yUV?=
 =?us-ascii?Q?DPflKhuvkACFbwnoIKV/1WNurMtCRrtaciqUfCB5c8rFA7Cn7/3Bjf7WwgkC?=
 =?us-ascii?Q?xfq6nlKeUnvkSbdG/nwaAQ2a+EuTvNsoFCBhua1K7o2935RXZoWX8QG6VWBv?=
 =?us-ascii?Q?qjmAogozFRIql2UqO29/gkRYQM1tYHRmjIvYlUVd1V1FkO690//8aOFfvfrE?=
 =?us-ascii?Q?NVE1vqhGDqScV8wRw8YCQP79Be+ip/BjqEBYDfs9FNT1BvfOQl2WKywHsNqX?=
 =?us-ascii?Q?ZOaMccCvsMWA1ovN2aT6GCuAtMf5oxMufKj9NVZ4hCjabz0+cgjIyPBdyT0g?=
 =?us-ascii?Q?iLzZHTEVQmEFn1q/4jO3vG2XodK9kTK2g0RXVLKFsfZhQvkzGsR9IcwDmBdJ?=
 =?us-ascii?Q?b7GReZGyeL3Kxe8szOmBC6HBl7Kj0dgWAKpBbzPpiv01vFnzUJd2KppebVNe?=
 =?us-ascii?Q?IPyDspb/63oQFo8RpZt8rqLMbgxsTG9MG4Vs3Flb42EPMXP1v+ZKTOLSxRSN?=
 =?us-ascii?Q?QPq1ewQRbiJlnny5AHJJHXMroitRGC8k0I8tNUY48jnTHYXDDbXWTDLOkKwx?=
 =?us-ascii?Q?i2Nt9Gr5JoyGA3gh+tJAoDmQK3pSFBPcEnGGngGCYt+C3LHlWPQz0NDHqlMa?=
 =?us-ascii?Q?oY5WuTu0afRsdXYXWzyf2e9lk8fBihIJedg0phyRq5NzAkpd6LXrY3Yp6JPw?=
 =?us-ascii?Q?7R8grAniprFSjsSZ6IClPMgFKxWYZbPAEv3G7rEdwqVA8LN1cKPPN+FIiqAP?=
 =?us-ascii?Q?jYWlEeXyQffGP2rQKI52gE7p7TlAJLoSOFjR6+NNjwfNAGOGsQB9FwnNNomz?=
 =?us-ascii?Q?nZzclV3pHR8Qp5te3TDoWtmxDCA74FKKS5yrZ+Mx5fnzYmXQNsbGmB1BMxr4?=
 =?us-ascii?Q?DgnG8WgUfiLnQtlCGdF8AmB3FIglSueGEnrjR83+TlqLnC06HiKLJ3GivLt2?=
 =?us-ascii?Q?3mr58l+r9oKJi4iZPnP3GlCj5YpvcT64SrNh0ES86xdZl2KlLvqMRp6gGbyR?=
 =?us-ascii?Q?LVI/SKQ3G8F5/2oKRXHvxMUc4yEzDMeuXpTWF5gFr8W/EMrInlkG+kLIf1uZ?=
 =?us-ascii?Q?pEIYZj7QcrzmjAkzMAfiJdCLit6Gf55dmaDyfmuaMnv8/mYaXxyuuwWIuR5D?=
 =?us-ascii?Q?rNRW15JyEw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80a05d9-99fd-4871-a8bd-08ded0716502
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:17:37.9914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XeupzVQn2vKxzBX6KLC20GFUaVs9Tw6HtDvS6LmeoOzUpFQm83VunGvL4SlwLw6kgeuVQCphEadF4lAR3rBmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB649383
X-purgate-ID: tlsNG-720697/1782141461-4C8103F3-F59E4375/0/0
X-purgate-type: clean
X-purgate-size: 13395
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39A066B0A74

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Add new EFI load type for kexec. This load type is suitable for use when
Secure Boot is enabled.

When this load type is used, the caller should not pass purgatory as one
of the kexec segments. Instead, Xen will prepare any glue code needed
internally.

The new load type only works for Linux bzImages using the x86 64-bit
boot protocol documented at linux/Documentation/arch/x86/boot.rst.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Move kimage_find_kernel_entry_maddr to arch specific kexec.c file
  Didn't add stubs for other archs because CONFIG_HAS_KEXEC is x86 only
- When parsing kernel entry check for header magic and boot protocol version
- When parsing kernel entry use setup_sects instead of ROUNDUP
- Update commit message to explain new kexec type only works for x86 linux
- Rename kexec_image->boot_params to entry_arg
- Use size_t for return type of kernel_alignment_offset()
- Remove error handling around map_domain_page because it doesn't fail
---
 xen/arch/x86/Makefile              |  1 +
 xen/arch/x86/include/asm/bzimage.h |  5 ++
 xen/arch/x86/include/asm/kexec.h   |  9 ++++
 xen/arch/x86/kexec.c               | 58 +++++++++++++++++++++++
 xen/common/kexec.c                 |  9 ++++
 xen/common/kimage.c                | 75 +++++++++++++++++++-----------
 xen/include/public/kexec.h         | 11 ++++-
 xen/include/xen/kimage.h           |  2 +
 8 files changed, 140 insertions(+), 30 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/kexec.h
 create mode 100644 xen/arch/x86/kexec.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 47dd6c50fe..9a84cf9cab 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_TBOOT) += tboot.o
 obj-y += hpet.o
 obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += xstate.o
+obj-$(CONFIG_KEXEC) += kexec.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 8c54b21d06..e363cc9a4f 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -47,4 +47,9 @@ struct __packed bzimage_header {
         uint32_t        payload_length;
     };
 
+static inline size_t kernel_alignment_offset(void)
+{
+    return offsetof(struct bzimage_header, kernel_alignment);
+}
+
 #endif /* __X86_BZIMAGE_H__ */
diff --git a/xen/arch/x86/include/asm/kexec.h b/xen/arch/x86/include/asm/kexec.h
new file mode 100644
index 0000000000..04b7eee4c1
--- /dev/null
+++ b/xen/arch/x86/include/asm/kexec.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM_X86_KEXEC_H
+#define ASM_X86_KEXEC_H
+
+struct kexec_image;
+int64_t kimage_find_kernel_entry_maddr(struct kexec_image *image);
+
+#endif /* ASM_X86_KEXEC_H */
diff --git a/xen/arch/x86/kexec.c b/xen/arch/x86/kexec.c
new file mode 100644
index 0000000000..eb31fe2e47
--- /dev/null
+++ b/xen/arch/x86/kexec.c
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/kexec.h>
+#include <xen/kimage.h>
+#include <xen/guest_access.h>
+#include <asm/bzimage.h>
+
+/*
+ * Find the entry point to the new kernel, we need to map the crash region into
+ * memory in order to read the kernel header.
+ */
+#define KERNEL_SEGMENT_IDX 0
+int64_t kimage_find_kernel_entry_maddr(struct kexec_image *image)
+{
+    uint64_t dest_maddr;
+    uint32_t alignment, magic;
+    uint16_t version;
+    void *dest_va;
+    const struct bzimage_header *hdr;
+    int setup_sects;
+    size_t kern16_size;
+
+    dest_maddr = image->segments[KERNEL_SEGMENT_IDX].dest_maddr +
+                 image->segments[KERNEL_SEGMENT_IDX].dest_offset;
+
+    dest_va = map_domain_page(maddr_to_mfn(dest_maddr));
+
+    hdr = (const struct bzimage_header *)dest_va;
+    magic = hdr->header;
+    version = hdr->version;
+    alignment = hdr->kernel_alignment;
+    setup_sects = hdr->setup_sects == 0 ? 4 : hdr->setup_sects;
+    kern16_size = (setup_sects + 1 )  * 512;
+
+    unmap_domain_page(dest_va);
+
+    if ( magic != 0x53726448 || version < 0x0202 )
+        return -EINVAL;
+
+    /*
+     * Ensure the kernel alignment is a valid LOAD_PHYSICAL_ADDR,
+     * which ranges from 0x200000 (2MiB) to 0x1000000 (16MiB) on 64-bit systems
+     * as defined in the kernel x86 Kconfig
+     */
+    if ( alignment % 0x200000 != 0 ||
+         alignment < 0x200000 ||
+         alignment > 0x1000000 )
+        return -EINVAL;
+
+    if ( (dest_maddr + kern16_size) % alignment )
+    {
+        printk(XENLOG_WARNING "kernel dest addr 0x%lx is not aligend to 0x%x\n",
+               dest_maddr + kern16_size, alignment);
+        return -EINVAL;
+    }
+
+    return dest_maddr + kern16_size + 0x200;
+}
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 5caeb19819..735a4342dd 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -760,6 +760,7 @@ static int kexec_load_get_bits(int type, int *base, int *bit)
         *bit = KEXEC_FLAG_DEFAULT_POS;
         break;
     case KEXEC_TYPE_CRASH:
+    case KEXEC_TYPE_CRASH_EFI:
         *base = KEXEC_IMAGE_CRASH_BASE;
         *bit = KEXEC_FLAG_CRASH_POS;
         break;
@@ -859,6 +860,7 @@ static int kexec_exec(XEN_GUEST_HANDLE_PARAM(void) uarg)
         break;
 
     case KEXEC_TYPE_CRASH:
+    case KEXEC_TYPE_CRASH_EFI:
         kexec_crash(CRASHREASON_KEXECCMD); /* Does not return */
         break;
     }
@@ -960,6 +962,13 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
 
     kimage_calc_digest(kimage, kimage->digest);
 
+    if ( load.type == KEXEC_TYPE_CRASH_EFI )
+    {
+        ret = kimage_efi_setup(kimage, load.parameters);
+        if ( ret < 0 )
+            goto error;
+    }
+
     ret = kexec_load_slot(kimage);
     if ( ret < 0 )
         goto error;
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index d4a695a2bd..b31f205176 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -19,6 +19,7 @@
 #include <xen/mm.h>
 #include <xen/spinlock.h>
 
+#include <asm/kexec.h>
 #include <asm/page.h>
 
 /*
@@ -104,29 +105,6 @@ static int do_kimage_alloc(struct kexec_image **rimage, paddr_t entry,
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
@@ -212,9 +190,10 @@ static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
                            KEXEC_TYPE_DEFAULT);
 }
 
-static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
-                              unsigned long nr_segments,
-                              struct kimage_segment *segments)
+static int do_kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
+                                 unsigned long nr_segments,
+                                 struct kimage_segment *segments,
+                                 uint8_t type)
 {
     unsigned long i;
 
@@ -248,8 +227,28 @@ static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
     }
 
     /* Allocate and initialize a controlling structure. */
-    return do_kimage_alloc(rimage, entry, nr_segments, segments,
-                           KEXEC_TYPE_CRASH);
+    return do_kimage_alloc(rimage, entry, nr_segments, segments, type);
+}
+
+static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
+                              unsigned long nr_segments,
+                              struct kimage_segment *segments)
+{
+    /* Verify we have a valid entry point */
+    if ( (entry < kexec_crash_area.start)
+         || (entry > kexec_crash_area.start + kexec_crash_area.size))
+        return -EADDRNOTAVAIL;
+
+    return do_kimage_crash_alloc(rimage, entry, nr_segments, segments,
+                                 KEXEC_TYPE_CRASH);
+}
+
+static int kimage_crash_alloc_efi(struct kexec_image **rimage, paddr_t entry,
+                                  unsigned long nr_segments,
+                                  struct kimage_segment *segments)
+{
+    return do_kimage_crash_alloc(rimage, entry, nr_segments, segments,
+                                 KEXEC_TYPE_CRASH_EFI);
 }
 
 static int kimage_is_destination_range(struct kexec_image *image,
@@ -421,6 +420,7 @@ struct page_info *kimage_alloc_control_page(struct kexec_image *image,
         pages = kimage_alloc_normal_control_page(image, memflags);
         break;
     case KEXEC_TYPE_CRASH:
+    case KEXEC_TYPE_CRASH_EFI:
         pages = kimage_alloc_crash_control_page(image);
         break;
     }
@@ -781,6 +781,7 @@ static int kimage_load_segment(struct kexec_image *image,
             result = kimage_load_normal_segment(image, segment);
             break;
         case KEXEC_TYPE_CRASH:
+        case KEXEC_TYPE_CRASH_EFI:
             result = kimage_load_crash_segment(image, segment);
             break;
         }
@@ -831,6 +832,10 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
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
@@ -1039,6 +1044,20 @@ done:
     return ret;
 }
 
+int kimage_efi_setup(struct kexec_image *image, uint64_t parameters)
+{
+    int64_t rip;
+
+    rip = kimage_find_kernel_entry_maddr(image);
+    if ( rip < 0 )
+        return -EINVAL;
+
+    image->entry_arg = parameters;
+    image->entry_maddr = rip;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
index abb2a49238..5341ddcda2 100644
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -54,13 +54,16 @@
  * - kexec into a regular kernel, very similar to a standard reboot
  *   - KEXEC_TYPE_DEFAULT is used to specify this type
  * - kexec into a special "crash kernel", aka kexec-on-panic
- *   - KEXEC_TYPE_CRASH is used to specify this type
+ *   - KEXEC_TYPE_CRASH or KEXEC_TYPE_CRASH_EFI are used to specify this type
+ *   - in case of KEXEC_TYPE_CRASH_EFI the first segment will point to the
+ *     full kernel to load and entry point will point to boot params
  *   - parts of our system may be broken at kexec-on-panic time
  *     - the code should be kept as simple and self-contained as possible
  */
 
 #define KEXEC_TYPE_DEFAULT 0
 #define KEXEC_TYPE_CRASH   1
+#define KEXEC_TYPE_CRASH_EFI 3
 
 /*
  * Perform kexec having previously loaded a kexec or kdump kernel
@@ -167,7 +170,11 @@ typedef struct xen_kexec_load {
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
index 86250f2939..fdda0a89a5 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -48,6 +48,7 @@ struct kexec_image {
     paddr_t next_crash_page;
 
     uint8_t digest[SHA2_256_DIGEST_SIZE];
+    uint64_t entry_arg;
 };
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
@@ -66,6 +67,7 @@ int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
 bool kimage_verify_digest(const struct kexec_image *image);
 void kimage_calc_digest(const struct kexec_image *image,
                         uint8_t digest[SHA2_256_DIGEST_SIZE]);
+int kimage_efi_setup(struct kexec_image *image, uint64_t parameters);
 
 #endif /* __ASSEMBLER__ */
 
-- 
2.52.0


