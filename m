Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oBCYINTJRWrnFAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 04:15:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5285D6F2F78
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 04:15:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=pmibQIbe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1351133.1608413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf6wm-0003cQ-3i; Thu, 02 Jul 2026 02:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351133.1608413; Thu, 02 Jul 2026 02:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf6wl-0003Zj-W8; Thu, 02 Jul 2026 02:14:35 +0000
Received: by outflank-mailman (input) for mailman id 1351133;
 Thu, 02 Jul 2026 02:14:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1wf6wi-0003Zb-Dy
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 02:14:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf6wh-005aXr-NR
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 04:14:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a45c96b-bab6-0a2a0a5309dd-0a2a4506d3d6-6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 04:14:30 +0200
Received: from [40.107.74.117]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a45c983-08de-0a2a45060019-286b4a752b29-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 04:14:30 +0200
Received: from TYWP286MB2938.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:29e::6)
 by OS9P286MB4880.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 02:14:23 +0000
Received: from TYWP286MB2938.JPNP286.PROD.OUTLOOK.COM
 ([fe80::939a:c9f7:3b72:1ed5]) by TYWP286MB2938.JPNP286.PROD.OUTLOOK.COM
 ([fe80::939a:c9f7:3b72:1ed5%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 02:14:22 +0000
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
 b=LRLVcnxTu4EsiAxj0UY1pQ22TKBvWitIEdbnqJuFLFFqmugxOeP+LS7aM6DIeQ+JqO9cELfNaWLIBPFzqhxHAnko4iJfr05qxX/AIK1tTiYRuXX6PrvfrRmuTBXsWU8GfLrlzd6k57lhtvNm3VSzeNZNNE/W23Zuar5DKTVfKwbk+7hSmJzzxqP46LzBN/s7U7xzf18HodDPsw+yPtZOOJiuHiSRNmeFL8/c3rySUmxwbdN37KNl2w/oITBPXJl8ebnwDMaLM8+QmMoHoOgudbH/OE3++zE4IXGe4rBGhD4TrOYLGx+jel7T2wBDo2Y2UeIJRhJ05qsf7vjBY5QcNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEQYCUB/AsrZes5fX6l4h5HMkIT20KsBaBAhAmYHYJ0=;
 b=ZI+8zQv3pvn8roMYreM9rPaDU2KVm446+yEJo8sgxx8gTYnmluOQlI9pj/APFG/WtCJouBHPlUcOzdDrDJ4lrzomar6qvyVJyf8FZdenP0csuULtpNovhRnBiunboeXWwGXqNRbupo/oXy7ORHD9axwhRYkG+0vmyHnoDCcj7yV/5qoW43Y9CMAl6mhf0ub1ng9Q93M/+oi9AKBOR2uCKr+pOdD4rNFKclljURIXHevqiVM0z3wFDi6Y/8/GcQZzNHJM0DMjx1qielDI9giCHVc4DVM+WJjd0c5zOrVdo6B5PIYRv9OOwqfRgKVMvCUhI6naOEGf2rrdhcRQuuRbXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEQYCUB/AsrZes5fX6l4h5HMkIT20KsBaBAhAmYHYJ0=;
 b=pmibQIbe9HWnlJiLLMjsnaHN9QeWX+U1/PfJMG51FtbL5QJv1c8wqqpR7v2lTbzY/FkrCEQfLaBqnuSfL7O4fKFhjP5lwVKegfvuT78N/LKXQA9aKEEuIdVEVtP3pt4fslMi1hOy8tODm8LEnoHFlrls5RRVmUzfIqJxvdmtNz0=
From: Ryo Takakura <takakura@valinux.co.jp>
To: roger.pau@citrix.com,
	andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org,
	ross.lagerwall@citrix.com,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	taka@valinux.co.jp,
	den@valinux.co.jp
Subject: Re: [RFC] xen/arm64: livepatch: enable attaching callbacks
Date: Thu,  2 Jul 2026 11:14:20 +0900
Message-Id: <20260702021420.8283-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <akUbQyNy-Rj1oOkJ@macbook.local>
References: <akUbQyNy-Rj1oOkJ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0181.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::19) To TYWP286MB2938.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWP286MB2938:EE_|OS9P286MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: 6566169f-088d-43e3-d306-08ded7dfa1b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|3023799007|5023799004|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6OFmh+gV+pKKf2OWjvHuPfvJ8EzGj7/s0L3tMqEYrOIr4J4nsu1QuJRVcCrfreJMPdF9P/7z5hbaU07VZ3zVQ74exO7h+wKqncwgFP0gKYRjd4m85DmNvvltCc5TPGpV5FNbAE9EO7OqHKu2mMJI+YmDS2/YuBI1xfJ7JH6pzNYn7VyXdf5Xe4Z7WbIO5uxftldLxh8hcqcZoAIMtwZVlEoEBdXQx6u/a2iSPbGsdqIINoY0xjCElbhp4ir5ApLmpncyT1X467NUwH3dpiodOtNZAlDjmLQ9dOrCxsjHSXkb/1ce+yEdAPXyRkaBrowXwXInHXkauOBQx6i3T/V/eZJXYgzDFddJ2Buvyref57jvzOXNc1uPKo/6ZQ7qBFoL4ToVHIihKrQ8+YoA5REb1l6Gv6SJK8/mF6ymSW7I8YGQ09VtFeBZ4Z26D2HZLA4q3gRCMYzcbDu5oyiKf6YhjcomIEWT/5GhwUfcCLIinsWF6NzSuN3TLqRjy0yzyET1Mm6xnyK7XY0xQFartBCvFJ8Fs/FKF5PMnArkpdaWxo+kJo0SZwTAeJzs4sYLIdon93m/zE549CK4Sw3BzxLtK/U0X22iVMisdwW15bV+qXow0WX0IK6aDYr2fX7KiQF/hOoP8KkLHJdAwtJV4YN2lxu7rYBkpKnaBEjDyNKprTQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWP286MB2938.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(3023799007)(5023799004)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZStSeFBGbERBRkxDODNGR285NUdkTzNkc3p5N2wxN0YzVHVqOE96TC9ORVBG?=
 =?utf-8?B?TGt2SjZTQnBlcnYzWENHTmVYRXQ1WFJSM2k4NDQ0Y3N6cW1ka3VFOVdaZkxY?=
 =?utf-8?B?bjlOdlRsQjZaa1hNU2pIR1lwbmtDQlFUaUhLWXRiWG9nRzM1d0ppelZJRCtV?=
 =?utf-8?B?ZTBxWkV1S3d6V29URmZyZXh5K0NtRWdVQkJId2loa0EyNzcxNGtPOG1hM1Qx?=
 =?utf-8?B?alJ5eWxTalVQei8xR2ZwM05PZDJvL3lqSVJ4NWw5WDFGU1c5WURLcXpLSTNK?=
 =?utf-8?B?TkYremhpM01NcXFjR0hiMFRlYVlJSVJobmU4YXZ3Q0pIYzlyMlFNWE03Tmor?=
 =?utf-8?B?V1JGUlFSVnl6U0NzVUs2bThzWXlnNGZnQkxaRlpCTHZuclFJVWh6eS8wQWhK?=
 =?utf-8?B?Wmc2SmZhWEZjQXU3LzYrUWRRZ2R0aUNCeTBhLy9yT0FHd3FwMzQremVaR2dJ?=
 =?utf-8?B?b1JNUVBaTHd1dXhBR3ZKWWFrSW1scU82aDlnRTVYREpRTkJzZ3dyTjcyVXJv?=
 =?utf-8?B?eEtNaTdzNUNldzdIVDFvaGI3NGpJYXF0OGFvNzNraFdGei9EeUVyNFZJTUNo?=
 =?utf-8?B?RGtLSWNzNlp0VDlIUWxDQ2JtZ0t0TGhKQnQxN09KSG1uRjd6Q2VOWGdQWHVv?=
 =?utf-8?B?WTA5QWhSTXVYdmp6bXZ0RTB5ZnZZbVFpbnNuRVR3UWNrcXBTNi9EN3ZNbmRK?=
 =?utf-8?B?WVZFOEsvanh5MTlhNjZCV2Rxc3lVbzRMQ3BseG9OK050Yjk2dXVscEtSS25N?=
 =?utf-8?B?bVJlT3h0dFNnN05kbUdJeWZwNHg5S3ZIOUFlTkU2UHlXc2M2aXQ3QVZYaHlw?=
 =?utf-8?B?WTVQQVdSb2xZVGVrTlFZaHBvWWNSU3Vzc0c2QWRTRVFvdXNXRi9UYjU2M2Vu?=
 =?utf-8?B?eTNvS1NlWU56dnhLZDBNdzUzb0FiTEsrVWxzQVpqQ2Z6Z1AyUkduRlJiMzVL?=
 =?utf-8?B?OEZhQUltSS9aeTRodGcxMmhuM1RlWWVVN29xVE01dCtiRGVTT1JZSHRvWlBu?=
 =?utf-8?B?dG80Y0QwRC9ERHZ5bDh2VVVMbE9RRVY2MkRLaVRnQ3Fjd1VPeGVGbWp0U29G?=
 =?utf-8?B?WkVIcitCYmlzdWtnQmtNMi8zOVhLYXNxMXFFQ2RmVGxKQmZRZVRYeDh4cVNC?=
 =?utf-8?B?UEEvYTVwQ0hvelVxM1NvaHQxWElhSE5MWUlmV0l0TjNTMDhiZytmRFNQaHV1?=
 =?utf-8?B?eGoycTdJNWd4WFlLelc1bi9JS01MM3phS0xMQWQ4d1Yyb2tzWnVSZW5MZHU3?=
 =?utf-8?B?UFN6N1crd1poUGtObzRXb0RPZklzYjI1TmxGKzJNSHQvZkZwOHhaUHlqb1NS?=
 =?utf-8?B?Ty80RHdKYXF1ZVNvUDJrVzVHa0ExdTBPSlVyRWNteU16VmduaVpCc1MvdjBo?=
 =?utf-8?B?bWpDUWd1WTluSGRXQjJsSWQ0NFRuNUtYK0I1cjdJK3JUUXF2VWh5V2JIVmlD?=
 =?utf-8?B?SmpVcHg2aUJ3Tis0K1JXa2k1K2ViTlVCV1grdUhPQzQxT0NRMlBSUW9CbVlM?=
 =?utf-8?B?cjlEUE1meEVIOWs3aXh0ejBManBmbmhoSTVJcEZwR0dBUm0yN0w3amhiTUtO?=
 =?utf-8?B?T05zU2k0U1JYRkg2L3d3R2RwNkhlN3ZoZ29TZ3pkMVBEa1FsV2RDQnNxNU5u?=
 =?utf-8?B?UU1qYmIzdk5GRFdQbzMyK1Zwa1UzNWUreng0eWhSZFNCeWNDenFnVDJWdVE5?=
 =?utf-8?B?dVNLVmV5MThqTEZBOXNNZURWQ1JGR09yQXd5UjkvbEVWL3UwRTJJbjVOdUFh?=
 =?utf-8?B?Zyt2NGlBVE1VWTJoWEQyS20vSFdES0FFdXJVeW5RblRvSitpdVhwYkQ2N3c2?=
 =?utf-8?B?QXJvU1lHKzZja3hBdXVDRGlZY0k0OUlSN1VpR2E0blhZTFpSR3JEMGs3SGw0?=
 =?utf-8?B?L1Vxd2ZpbWtMOGhtRWMxNERSdXJCNSttanltcEZRZUIrN0hidExzN3lBa21s?=
 =?utf-8?B?NXBLTTlEWmVERnJ1RGhrZ1d2aUZkcFBSNXIyQXRvcFpWaWhTN1ArRGYzTDYr?=
 =?utf-8?B?QnI0MXpkSHNHeXN0Z0ozUGR5WjMvR1FTRTY4eTBUTkZUNU5lanZiakwrNmho?=
 =?utf-8?B?OWl1VkpsamUzZzhUYmNKWWdvYTZOZDRpTG5mSXVJanRSSjYzaHVNM0Y2cmZ0?=
 =?utf-8?B?Yk8rRy85SlhjSDB6dnV6MnR6ZDlKRmE5bnArTG5IZXQray9SQi9NbnRVSG9Z?=
 =?utf-8?B?RGNxMXdQbkIxZ2pjekYvUVFEUlRKSm9VeGpuWlU4RDVZTzRYU2d6VC9tS3R6?=
 =?utf-8?B?SlhEK0xwWEFQWFVrZ0xOdjFiczAyeldCeU8vQllkeW5OT2krZ2VRNmZzV1dW?=
 =?utf-8?B?TkhsbitCYksvek52NFJlbkYxOGJqSjV1Q1d5WkxCOXdIazFXMTlTZz09?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6566169f-088d-43e3-d306-08ded7dfa1b7
X-MS-Exchange-CrossTenant-AuthSource: TYWP286MB2938.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 02:14:22.8251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyndUgXI4drN6I+nXSsBGAr79fiAlTfOBQ+a3dO/iwdJPYp+SBuSnuVTqT+F1K2NdUKytAeeGpIMo9mADWZwFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4880
X-purgate-ID: tlsNG-16d1c6/1782958470-C513768D-44D0127E/0/0
X-purgate-type: clean
X-purgate-size: 3354
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:taka@valinux.co.jp,m:den@valinux.co.jp,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[takakura@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[takakura@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5285D6F2F78

On Wed, 1 Jul 2026 15:50:59 +0200, Roger Pau Monné wrote:
>On Wed, Jul 01, 2026 at 06:09:08PM +0900, Ryo Takakura wrote:
>> On Tue, 30 Jun 2026 08:47:14 +0000, Roger Pau Monné wrote:
>> >On Mon, Jun 29, 2026 at 11:01:28AM +0900, Ryo Takakura wrote:
>> >> Linux ftrace allows registering callbacks which is useful
>> >> for debugging and tracing events. On Linux, it is done by
>> >> reserving function entry points at compile time which can
>> >> later be patched to branch to a trampoline.
>> >> 
>> >> This patch implements similar callback feature, but with
>> >> different approach using existing livepatch infrastructure.
>> >> Instead of reserving function entry points at compile time,
>> >> the traced function will be livepatched so that it branches
>> >> to the trampoline.
>> >
>> >While this is an interesting usage of the livepatch logic in new ways,
>> >may I ask why not do as Linux and add an empty function preamble that
>> >can be replaced at run-time with calls to hooks?
>> >
>> >You could still re-use most of the livepatch logic for handling the
>> >addition of the hook calls, but it would be nicer in that we won't
>> >need to move the original function.
>> 
>> I agree that we can reuse a lot of livepatch logic.
>> 
>> >> The role of the trampoline(illustrated below) is to preserve
>> >> the context while jumping to the tracer function, and return
>> >> back to the traced function with its context restored.
>> >
>> >Alternatively - why not use livepatch-build-tools against a build with
>> >the added hooks to generate a proper livepatch?  This looks a bit
>> >fragile to me (see the question from Andrew about fixing up
>> >instruction pointer relative references).
>> 
>> Yes, I think proper livepatching would still be preferred
>> given all the concerns Andrew and Roger raised.
>> 
>> >On x86 at least we would also need to adjust the bug frames and
>> >exception table contents, and the contents of the symbol table to
>> >account for the function being moved.
>> >
>> >IOW: it looks like overall this is a lot more work than possibly
>> >reserving a function preamble to add hook calls?
>> 
>> Yes, I agree.
>> (I wasn't aware of this additional work when I replied
>> to Andrew yesterday, thanks!)
>> 
>> And if I were to summarize the discussion so far, assuming we
>> still want to add a tracing-feature, I think we are in agreement
>> adding an empty function preamble like Linux.
>> (I personally would still like to see a framework on Xen
>> that is more convenient and tracing-friendly which can be used
>> reliably at the same time)
>> 
>> If this sounds reasonable, I will try preparing one based on
>> the feedbacks I was given so far:
>> - Use of Linux-like reserved function preamble
>> - Use of __attribute__((no_caller_saved_registers))
>> - Split replacement and preamble-hook handling in common code
>> 
>> Let me know your thoughts!
>
>I think the above approach is easier to implement, and more reliable
>than the current proposal.

Good!

>Do you also have the intention to integrate this with existing tracing
>tools used by Linux or other OSes?  That would be very useful IMO.

Although I don't have anything specific in mind yet,
I also hope for more tools to be integrated in the future :-)

Sincerely,
Ryo Takakura

