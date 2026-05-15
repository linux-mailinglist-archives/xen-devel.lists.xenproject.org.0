Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLcfMBOdBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD954924B
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309435.1580522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjtw-00022f-P6; Fri, 15 May 2026 04:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309435.1580522; Fri, 15 May 2026 04:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjtw-0001yr-Kd; Fri, 15 May 2026 04:11:52 +0000
Received: by outflank-mailman (input) for mailman id 1309435;
 Fri, 15 May 2026 04:11:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjtu-0001he-Ft
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:11:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjtt-0052Iz-SF
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:11:49 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069cda-e002-0a2a0a5209dd-0a2a4505a2ee-26
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:11:49 +0200
Received: from [52.101.125.85]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c47-aaa8-0a2a45050019-34657d55753b-9
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:49 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3682.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 04:08:38 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:38 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkv1vfI5O59KWDyXSA5ViGCg2IXxkdwp7owGBtNvMwvokpEomtjQnXw+JxUN9uamIOV1l+YqoK059pLHKbU69Sm7OI4vFocvHSFWQl0MjctEz+sJ8VQqn8aqIuxFFI44khV3vFW/25kexn/xCFrN5dR7nSe0P9ElRbqK0zEh8efvOkpON6K7QjDwW5bXZcKv2M3YHVDYQ3F4tk18r5Xq9e9075efGYRILKJA5RABY80xqnZk5cieAF0DyMJNP5SAeQSFv2IdK1FgXv/1+v3CwAP8TMuBR4Cu3x/qSpPvf7AfhKClFbbpj7CTCUezZeEDhZ6lvUUuIpLiJte0Gv2Aew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUEonI82EmDhnjoUm3kfT18UbhTpOT2nksAcbviCf7Q=;
 b=aQET2pp3uemV1zGmgN4xkf4vVcB/GNIMFESSnVQ8oH1oTOSRsEZRP1PeMnPxwpwiR6uELxY2BvUfpv6jClZDrkl0ib0mXvcEKQ8KlB3jeuUVCRzZ8b5RjjsR50mLWX68mNxU//yEBmSOS67B7lsST8ufDnl4R4AfhpzVSq92Jsw3eI94/imqCtgL5GjbVWHFJxB6tQ0FCQLvCV+ZwS36q14U/yZ55qQ5brpVpTCIYipVJXFRxYViZ30XHdSRZz7r0IXFAmCNz051pPJCkUSiXwc3gB6U8A7fYvad0o+ZNR+lwLDTx59pujoTW34Nnz1adi2WdMTh3e0Nry76tv4Gog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUEonI82EmDhnjoUm3kfT18UbhTpOT2nksAcbviCf7Q=;
 b=t2jBLsht4aP6S3U9ddLn94eyqQhRlH5Y92wfAh7Wb/+CCPHJ8Jo+9eRNMdIYVykhJY5dDigF+GdemaHqSa+z24WBWG9DMIh8llGVyTJjNNEQ3zc3yqtTPLzj5DnEwMlnTVyWHudmU1xXVdGn7Mby809KLOsflwoJ4OY+FwxDlCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v1 25/26] libxl/arm: add and validate Realm guest support
Date: Fri, 15 May 2026 13:08:11 +0900
Message-ID: <20260515040812.983626-26-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3682:EE_
X-MS-Office365-Filtering-Correlation-Id: 951d4835-653b-4b40-954d-08deb237a440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xyVH9c1JnYSO8Iq457ifJbqmB9wu/Ow82h3fCkxDUhQnx4XaNu3xFC4EEMars0sNMlB43ljs72aEdjhwPxbug3tWPjGyRFXdyRqe0sjQ29jEJuGVm4tu7tpEkz+cpDFVpQdGYC8iqrKbWu/nnGB+S6NsTkXJdUbf8rKFFatwedSZE1P8UsL0dKgTIia3UFZvWHVDFGmurZiloztiHsOuwrLgv2lMaH/EnH8Ganne9SOYxYXj1nhaFHykPGT4svG8JZuMZSif6qGI4RvSDntiyPGgE+hMUqMDUbsRodSeyrODa+I8mRslMVCkv/sA86gN5zqphHwvUnSbIiJxX/tx4/HT51mhW7gVXQqIyZYgJ5WGKBywqlbbz5byuj9hhrv4nK4/bS8pewT3a4r0aOrMO5wkoITfXWucX6WS5iQmGagv+xlYl9LgbOsyjoSoKW/KRDYS6iyb27efNEW3amzlcLC1ga0MYWjy+dOQZJR73/AnqxEAQttJxph6mzfNkXdcxduMOfYoHN4w29XKH0JOI2+vAubexFAevdqnktXkMvjTbMkXtBcNgzbZalAlKoVgjfrKiBJo0IvzWg34AA2iZ09tRitBplvr9nK41D18YWnbQV81+/MUX48PvDsGtk/a1WOGANskXdAUcxdjajYvrVna3kbzvq2HdX2kfoNt1ebkG+/2nF7Y0FKH6gLD3TrXDgc5o6fCptQ/MTGqoBFFBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a6M73JlCkqorr190fg7qoJy+9ouidG5qvLfQPRyF5ABjhap60jc3Arq0/CWP?=
 =?us-ascii?Q?UrYdtt9w0FTcYmcrWNkRARFdUdwEFTiWr2ADpvE+Lo4t06zkGOOGLR1WLUy3?=
 =?us-ascii?Q?IQPESn5Eco4/pRk1/bX97eZgRq9kToO0OcNpl6EUFzJxBQ3fwZOauHrcj3y7?=
 =?us-ascii?Q?nxtG/r2tJQCxqVUCxrO1/MF+AXEMX36Zb3heHDVjrWepxXIrJtENnnQg/hzS?=
 =?us-ascii?Q?MByWTPw7AJmB2by4XE2whrB2oFOyfjdJKpTRRHjZZEA99zvi7dx1CV169Iwq?=
 =?us-ascii?Q?Gs6AJBWs+on45cis5xc/eKuHgzLvxomxkfZsjtpmYzc4QeHMPzvk9iM37pYX?=
 =?us-ascii?Q?/iD6Nrnc+CHGynNcIfKP8kSMTOT3144hE2/crTgEoDP733k/1yN/kbDIlX/y?=
 =?us-ascii?Q?wL+YP297NsQZ8Os+lfmlAYM9hsdKgAM4wBKXxOISfpKTOBpbRZaDoK3QGz8Z?=
 =?us-ascii?Q?0kSGMDWVKgqAYrgL/8ulLhIr9MELZgmLu/I4id6vNrTJ4Tuo6FGIU/tp6kEy?=
 =?us-ascii?Q?Q74GUWQKcJJpnsmNytT0Mbr7JnTGVo5s6PnR9NNDUeHdMTLh6CWr8HY4Ba1c?=
 =?us-ascii?Q?aliJSOhFL8vM2QMyw5J2E2duG8Fr4f6jzKErlDqFvJGksKAuwnUmfu+cuGv2?=
 =?us-ascii?Q?OLmRVJorPd5/YtLSef/aGbT5YpY4LiCGHyAe/r5HZ1qqkFaWawtPs8oh+wk1?=
 =?us-ascii?Q?CAbJDzeQ6v7CnFQri2W5qvBgTBaFG0RCBTZWWO/bSKToFZQBqjSXRzdohTTs?=
 =?us-ascii?Q?WH5G8AE4HI1mWSrIVgV5QiZZzuhJ096WsTEMbMBo7Phn3YDIdTWQ3ispyrQ7?=
 =?us-ascii?Q?6W4kmsQM7jHAkSFSeSvTieXbFc4Vrcl4shRYJnQS5wPj5CiaoivhS3qRpP0k?=
 =?us-ascii?Q?r5uNWDKCZbw9UL2Hsxnogxz+mhFuuh7THicgDZXGWTI9auSqiAGu2FePtKpv?=
 =?us-ascii?Q?o8tH1v/UXhsYMdVh7Din7wb7Gzjc8AmA+Pdl7R+ESlb938Ri3VpBE3cNMY1T?=
 =?us-ascii?Q?yfZ+qOwGB1S1LZaOwyheJrxyWZZuTQGm3VeCEvfRKJMWrQ2Ti5u1IIoj3QCd?=
 =?us-ascii?Q?YueuJdm5zfMrGauuMohAEzEc/oHsffOmWJGqy0v1D6HFyWQwdlGQtQ/IKlQP?=
 =?us-ascii?Q?vDjFQwIafO85OOUXRrrhKmEkJJakvJiSLvxjVsb5IRP4NexG/e0siXfZPKi4?=
 =?us-ascii?Q?aeekDWTdF1V93/DjP0jA8i5oIjfP3G51X/ZpHcL/sM6DV/+295IQXnN36N9Z?=
 =?us-ascii?Q?ougokPWCLr34n6/CC9jsV0RoGJ8aCEA7gGgoog//v2yOi9+FCK/clAgHgDZr?=
 =?us-ascii?Q?YXUpGDbyx28V+Af8wD0hOyXQANvaxMOxLFy2lmrR9cfBopqV4OnLX4P1jA6x?=
 =?us-ascii?Q?EQaBsc5KFun1OPuPhDtzse/LArGgh25DS7C+uFSJQuk5Ln/YTDS9+MHa/D3Z?=
 =?us-ascii?Q?f+cU8qch5JOHqnHMLomhXvPejyQcNKXcLo7p49SxScoI8QwETxTlMnkKENKM?=
 =?us-ascii?Q?qZDNsj+xPoSTAC/T2tiXgnIXWQg4sVFx1vi116SqLu7gKLxXHDk4WqnYVmbf?=
 =?us-ascii?Q?jh7M2veGWuXMpTlJwlm/WHLjtx81bralKirigGtAbQ+KcUJ6rLE5lQK9AidA?=
 =?us-ascii?Q?psPZ6PhWA+iCgT4wfzapu3q7I+tXM6xiO+T7jkFbMgf4YB4+4t+paceczkSS?=
 =?us-ascii?Q?2PSRkamP03m6pDmN/RpXf4RK2hr+q/mRInv+W7sZ0IwACWOK6viy9YUCQynW?=
 =?us-ascii?Q?6t5fWfowutGYqabdPalgqwwZWSgw5kG0RcMmW/exEdK/S7BvLFNz?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 951d4835-653b-4b40-954d-08deb237a440
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:38.2658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5b2FR7uXDT2eB2WNVwsnnYxYGQxWxOEYCngAVlM2urrUSxeM/QOoDpk2dhgnOj/49/5dGmkuzqetReOd6nfnJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3682
X-purgate-ID: tlsNG-c201ff/1778818129-E2997443-C02D1EAF/0/0
X-purgate-type: clean
X-purgate-size: 12215
X-Rspamd-Queue-Id: 27AD954924B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim,xenproject.org:email,xenproject.org:url];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Add realm=true for Arm guests, reject unsupported combinations, and call
the CCA finalization domctl after the guest is built.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 docs/man/xl.cfg.5.pod.in         |  46 +++++++++-
 tools/include/libxl.h            |   5 ++
 tools/libs/light/libxl_arm.c     | 140 ++++++++++++++++++++++++++-----
 tools/libs/light/libxl_create.c  |   2 +
 tools/libs/light/libxl_types.idl |   1 +
 tools/xl/xl_parse.c              |   2 +
 6 files changed, 173 insertions(+), 23 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 2f77016ecfae..7ca7dba4d29d 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1704,6 +1704,47 @@ i.e. enable grants if backend-domid != 0.
 
 =back
 
+=item B<realm=BOOLEAN>
+
+B<Arm only.> Create the guest as an Arm CCA Realm guest.
+
+Realm guests use the Arm PVH guest model and currently support only a
+minimal configuration:
+
+=over 4
+
+=item *
+
+type=E<quot>pvhE<quot>
+
+=item *
+
+guest RAM fully contained within the first guest RAM bank
+
+=item *
+
+GICv3 only
+
+=item *
+
+Xen-generated device tree only
+
+=item *
+
+no passthrough, no virtio, no Xen grant or IOMMU exposure to the guest,
+and no ACPI
+
+=back
+
+When B<realm=true>, Realm DTBs set the PSCI method to B<"smc">. They do
+not expose the Xen hypervisor node because this series does not provide
+Xen PV interfaces for Realm guests.
+
+Realm guests may use B<vuart="sbsa_uart"> only when Xen was built with
+B<CONFIG_ARM_CCA_REALM_DEBUG_VUART=y>. This is a host-visible clear-text
+debug console for Realm debug access, not a confidentiality-oriented guest
+access path.
+
 =item B<tee="STRING">
 
 B<Arm only.> Set TEE type for the guest. TEE is a Trusted Execution
@@ -3096,6 +3137,10 @@ vuart = "sbsa_uart"
 
 Currently, only the "sbsa_uart" model is supported for ARM.
 
+For Realm guests, B<vuart="sbsa_uart"> is supported with the same device
+model only when B<CONFIG_ARM_CCA_REALM_DEBUG_VUART=y>. The guest kernel should
+use C<ttyAMA0>.
+
 =back
 
 =over 4
@@ -3249,4 +3294,3 @@ documentation. Patches to improve incomplete items (or any other item)
 are gratefully received on the xen-devel@lists.xenproject.org mailing
 list. Please see L<https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches> for
 information on how to submit a patch to Xen.
-
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 7c098edab663..9b9398401029 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -293,6 +293,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARM_GIC_VERSION 1
 
+/*
+ * libxl_domain_build_info has the realm field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARM_REALM 1
+
 /*
  * libxl_domain_build_info has the arch_arm.tee field.
  */
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 7e9f8a1bc366..fa13703bb98b 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -80,6 +80,70 @@ static const char *gicv_to_string(libxl_gic_version gic_version)
     }
 }
 
+static bool arm_guest_is_realm(const libxl_domain_build_info *info)
+{
+    return libxl_defbool_val(info->realm);
+}
+
+static int arm_realm_reject(libxl__gc *gc, const char *what)
+{
+    LOG(ERROR, "Realm guests do not support %s", what);
+    return ERROR_INVAL;
+}
+
+static int arm_realm_check_config(libxl__gc *gc,
+                                  const libxl_domain_config *d_config)
+{
+    const libxl_domain_build_info *const info = &d_config->b_info;
+    const uint64_t bank0_memkb = GUEST_RAM0_SIZE >> 10;
+
+    if ( !arm_guest_is_realm(info) )
+        return 0;
+
+    if ( info->type != LIBXL_DOMAIN_TYPE_PVH )
+        return arm_realm_reject(gc, "non-PVH build types");
+
+    if ( info->target_memkb > bank0_memkb || info->max_memkb > bank0_memkb )
+        return arm_realm_reject(gc, "guest RAM beyond the first RAM bank");
+
+    if ( info->device_tree )
+        return arm_realm_reject(gc, "partial device trees");
+
+    if ( libxl_defbool_val(info->acpi) )
+        return arm_realm_reject(gc, "ACPI");
+
+    if ( info->arch_arm.gic_version != LIBXL_GIC_VERSION_V3 )
+        return arm_realm_reject(gc, "non-GICv3 interrupt controllers");
+
+    if ( info->tee != LIBXL_TEE_TYPE_NONE )
+        return arm_realm_reject(gc, "TEE/FF-A plumbing");
+
+    if ( info->num_irqs || info->num_iomem )
+        return arm_realm_reject(gc, "IRQ/IOMEM passthrough");
+
+    if ( info->num_vnuma_nodes )
+        return arm_realm_reject(gc, "vNUMA");
+
+    if ( d_config->c_info.passthrough != LIBXL_PASSTHROUGH_DISABLED )
+        return arm_realm_reject(gc, "passthrough mode");
+
+    if ( d_config->num_pcidevs || d_config->num_dtdevs )
+        return arm_realm_reject(gc, "passthrough devices");
+
+    if ( d_config->num_disks || d_config->num_nics ||
+         d_config->num_virtios || d_config->num_vkbs ||
+         d_config->num_p9s || d_config->num_pvcallsifs )
+        return arm_realm_reject(gc, "frontend/backend devices");
+
+    if ( d_config->num_vtpms || d_config->num_vfbs ||
+         d_config->num_vdispls || d_config->num_vsnds ||
+         d_config->num_channels || d_config->num_usbctrls ||
+         d_config->num_usbdevs )
+        return arm_realm_reject(gc, "auxiliary frontend devices");
+
+    return 0;
+}
+
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
                                       struct xen_domctl_createdomain *config)
@@ -92,6 +156,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     uint32_t virtio_mmio_irq = GUEST_VIRTIO_MMIO_SPI_FIRST;
     int rc;
 
+    rc = arm_realm_check_config(gc, d_config);
+    if ( rc )
+        return rc;
+
     /*
      * If pl011 vuart is enabled then increment the nr_spis to allow allocation
      * of SPI VIRQ for pl011.
@@ -617,7 +685,7 @@ static int make_cpus_node(libxl__gc *gc, void *fdt, int nr_cpus,
     return 0;
 }
 
-static int make_psci_node(libxl__gc *gc, void *fdt)
+static int make_psci_node(libxl__gc *gc, void *fdt, bool realm)
 {
     int res;
 
@@ -628,7 +696,7 @@ static int make_psci_node(libxl__gc *gc, void *fdt)
                               "arm,psci-0.2", "arm,psci");
     if (res) return res;
 
-    res = fdt_property_string(fdt, "method", "hvc");
+    res = fdt_property_string(fdt, "method", realm ? "smc" : "hvc");
     if (res) return res;
 
     res = fdt_property_cell(fdt, "cpu_off", PSCI_cpu_off);
@@ -1363,7 +1431,7 @@ next_resize:
         FDT( make_root_properties(gc, vers, fdt) );
         FDT( make_chosen_node(gc, fdt, !!dom->modules[0].blob, state, info) );
         FDT( make_cpus_node(gc, fdt, info->max_vcpus, ainfo) );
-        FDT( make_psci_node(gc, fdt) );
+        FDT( make_psci_node(gc, fdt, arm_guest_is_realm(info)) );
 
         FDT( make_memory_nodes(gc, fdt, dom) );
 
@@ -1384,7 +1452,13 @@ next_resize:
         }
 
         FDT( make_timer_node(gc, fdt, ainfo, state->clock_frequency) );
-        FDT( make_hypervisor_node(gc, fdt, vers) );
+        /*
+         * Common domain creation may still allocate grant-table resources,
+         * but this is the guest-visible path to them. Realm guests
+         * deliberately omit Xen PV interfaces, including grant-table space.
+         */
+        if (!arm_guest_is_realm(info))
+            FDT( make_hypervisor_node(gc, fdt, vers) );
 
         if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
             FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
@@ -1427,7 +1501,7 @@ next_resize:
          * The iommu node should be created only once for all virtio-mmio
          * devices.
          */
-        if (iommu_needed)
+        if (iommu_needed && !arm_guest_is_realm(info))
             FDT( make_xen_iommu_node(gc, fdt) );
 
         if (pfdt)
@@ -1559,6 +1633,9 @@ static int finalize_hypervisor_node(libxl__gc *gc,
     libxl_dominfo info;
     int offset, rc;
 
+    if ( arm_guest_is_realm(b_info) )
+        return 0;
+
     offset = fdt_path_offset(fdt, "/hypervisor");
     if (offset < 0)
         return offset;
@@ -1732,31 +1809,50 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
     return 0;
 }
 
+static int arm_realm_finalize_guest(libxl__gc *gc, struct xc_dom_image *dom)
+{
+    int rc;
+
+    if (dom->rambank_size[1] != 0) {
+        LOG(ERROR, "Realm guests must fit entirely within the first RAM bank");
+        return ERROR_INVAL;
+    }
+
+    rc = xc_arm_cca_init_realm(CTX->xch, dom->guest_domid,
+                               GUEST_RAM_BASE >> XC_PAGE_SHIFT,
+                               dom->rambank_size[0]);
+    if (rc < 0) {
+        LOGE(ERROR, "xc_arm_cca_init_realm failed");
+        return ERROR_FAIL;
+    }
+
+    return 0;
+}
+
 int libxl__arch_build_dom_finish(libxl__gc *gc,
                                  libxl_domain_build_info *info,
                                  struct xc_dom_image *dom,
                                  libxl__domain_build_state *state)
 {
-    int rc = 0, ret;
-
-    if (info->arch_arm.vuart != LIBXL_VUART_TYPE_SBSA_UART) {
-        rc = 0;
-        goto out;
+    int ret;
+
+    if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
+        ret = xc_dom_vuart_init(CTX->xch,
+                                XEN_DOMCTL_VUART_TYPE_VPL011,
+                                dom->guest_domid,
+                                dom->console_domid,
+                                dom->vuart_gfn,
+                                &state->vuart_port);
+        if (ret < 0) {
+            LOG(ERROR, "xc_dom_vuart_init failed\n");
+            return ERROR_FAIL;
+        }
     }
 
-    ret = xc_dom_vuart_init(CTX->xch,
-                            XEN_DOMCTL_VUART_TYPE_VPL011,
-                            dom->guest_domid,
-                            dom->console_domid,
-                            dom->vuart_gfn,
-                            &state->vuart_port);
-    if (ret < 0) {
-        rc = ERROR_FAIL;
-        LOG(ERROR, "xc_dom_vuart_init failed\n");
-    }
+    if (arm_guest_is_realm(info))
+        return arm_realm_finalize_guest(gc, dom);
 
-out:
-    return rc;
+    return 0;
 }
 
 int libxl__arch_vnuma_build_vmemrange(libxl__gc *gc,
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index bfc9149096a3..1401697ab1d4 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -407,6 +407,8 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         libxl_defbool_setdefault(&b_info->nested_hvm,               false);
     }
 
+    libxl_defbool_setdefault(&b_info->realm, false);
+
     if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
         if (info.cap_gnttab_v2)
             b_info->max_grant_version = 2;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index a7893460f013..d2fa3535ab18 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -657,6 +657,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
     ("tee",              libxl_tee_type),
+    ("realm",            libxl_defbool),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
                                        ("bios",             libxl_bios_type),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 48c72dce9c6d..742c203a0326 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -3058,6 +3058,8 @@ skip_usbdev:
         }
     }
 
+    xlu_cfg_get_defbool(config, "realm", &b_info->realm, 0);
+
     if (!xlu_cfg_get_string (config, "sve", &buf, 1)) {
         e = libxl_sve_type_from_string(buf, &b_info->arch_arm.sve_vl);
         if (e) {
-- 
2.51.0


