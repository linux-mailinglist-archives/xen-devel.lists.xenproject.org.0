Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nx1eATguKGrF/gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:16:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628166619EF
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:16:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="ULG/ImJp";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333495.1596529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyBC-0007tQ-2Q; Tue, 09 Jun 2026 15:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333495.1596529; Tue, 09 Jun 2026 15:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyBB-0007qR-Vg; Tue, 09 Jun 2026 15:15:49 +0000
Received: by outflank-mailman (input) for mailman id 1333495;
 Tue, 09 Jun 2026 15:15:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wWyBB-0007pg-1R
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:15:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWyBA-008IjG-EG
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:15:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a282e17-e002-0a2a0a5209dd-0a2a450ba404-26
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:15:48 +0200
Received: from [52.101.46.25]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a282e21-212f-0a2a450b0019-34652e19d220-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:15:47 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB7523.namprd03.prod.outlook.com (2603:10b6:408:196::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:15:41 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:15:41 +0000
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
 b=AijrgETh7YXynvDy+vd+4/yH07MdrbKYNqGWLrgaI2u35j2MstYn+cbHXrDOBwgFGkgscbkedBDkDVGjNCsISVjcRUKq+SPzkARLRL4tenYLRPqMC6zbe2odHHbi8mKAk2YaNeB2BnOPkJ5ZPurwAkkr83nopobQjkquRCD8+lu0+L6PkGGcmhiNk52a6d9aVn5+MydgTwt/I/eZhYN5yZQTwhzAJmTRCeBoV4P+F1HmywQaFbuGTfRTrVrM5KAi+DznQUdXqtTdGXV58dtAfmXjzwbaNGUqlqGwwKjYueC+BuhzDlXx/xK5dd2qa3tUuvXj6FHyd9yLZM+ggaNtwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ+6LjObK/SJhMLiKkSaCczGj1dUVZKr7QNXr8dj8dU=;
 b=lHcQTZRi4oL1Z+hQS6Y77fDOfZAaQWijG/SocescxpLWdKBqHT9Pq2meTjc0t2/6gLQze3tb4qFuGwlfKwNBpFmosA6tU5gsu3ziNGfR51M65YOKrf09z0aYnZ2fhvnNlTMEive2bt5TpieWGrC7WUmUSWqud0bW3GLLryNMdTPfVr+32haZ6s+exbt9AzU3KuCoSKrRrvBsxPuVcFPl0w0LYsK9VP3N1/h8whhWkYkIDunreSCwBFEeRn8OjL0rNSNFNY8a5JLONMkjrw1E2gJYKH9JWy1PpiiezQ9GkqEL9tVb4WT1BeLGlnH2TU3cnIDEQBwVUlUA7JTLgIKDlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJ+6LjObK/SJhMLiKkSaCczGj1dUVZKr7QNXr8dj8dU=;
 b=ULG/ImJpkyIaUWZFXXwxE/uuh5NjrconYoI1s7JC4lRMvzwyBeMhFFdxc1a1PyGPTJVAiJfYj8uBp2O92iEF7B0KUsvk+mwC76mqtI3lLpHuA0iTBSLUiu1ruFh8G7FRxbfQgM0ayHLpjzNC01W5CAtNiuz1MYycPvECbo1CjOI=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v1 2/2] domctl: Handle some of XEN_DOMCTL_shadow_op without the domctl lock
Date: Tue,  9 Jun 2026 16:15:28 +0100
Message-ID: <20260609151528.2426788-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0362.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::7) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV3PR03MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c9fb07-4e90-4a7f-eeb7-08dec639f827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	nHSdyoZt4jizpJcSyP77QZj6cKVpuYQFGvqg/LvzdJgVtsWJSl495/BfkNZAPYnVvD6qNnQfRWtvz52INjUftQWsRv2CLhWrdkreJyCJlOsMNxohtUihkCy8H5kqwsSyohbLfPbhg1gKxMgCfNRXLXC0w5uxp9OizkKyCexnGylBghaTNSjM4qoh8nNXYRkHNnLBCSUxj52c1/nwYnG/EuIUY8/IszH+TD2Ya67dvPuBecTDA4LpKRjKNP4fCvLRerdrjaVWmreBp8JHKMeIeUDAq8JGn+Pdo+z1XlOjvFSBNbETuEffPnUlylKXPeEMIUO6OYHcW4jty9Nj7gXbdbW0HJzMFqOWIMmWeODayvRPN8gTIA/14sC0AhFmQxKMJdpJbVjg5u55X3IwhdaJljImpK8KrxgbXXPpNbcrDqs74UaVr7lKBDO3tJN1KiwQu9CY+GbMOHhucKo6opYw0oI27ApySWbmlnmQ/PEtPy6A7GLbAFufMEZo1Z4+yDj7nWZ5MayqyGvVBpIuLretgg51OH8K+VMcatiC3VYdXm/bEQLbs5wJfNzfySd0udXc5D9jLsfVugCmkNx/07y8S91SyfzofbNFJak7OPSEpwsUK1ZpTql6f5JuATvn/sOq/46bvaJMylboWY381goeiTeiUtJDpyKV3tvwoxXO7EdSq6icqw/I7tKHPyUvySMk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ehxi5M7+DWa763er9mCoTlM1UH1wv3rhVOr5QCdTchl9Hko1R1Y/iqP+xLqU?=
 =?us-ascii?Q?C1haJIDaxzdf3kqQNy4S4Y+l6T3TA7yW2+zHCuOr+dyfdrBMdTsamB4/uWYK?=
 =?us-ascii?Q?A992bS1B3OfWayKT1s+RUYlpZRnGr7cvO1hy/dqwXa8eRqWhfcoG23T09D9i?=
 =?us-ascii?Q?HebXP0wlJz/czc9LvZXzcQN9Ez75Ipe8jCf+TBfg+tVKE9monYpEhDJkj7WF?=
 =?us-ascii?Q?xCXGcXI91yFxh5qW+Q1oAKNbDpdOu0+AxrK4l9mb/FjcWgmqzf0Fg1RSOuVS?=
 =?us-ascii?Q?zJkXV9jcK92shXZHCXa4wM/onV9u9X3W7y747M1wz4GMGbZnPAOaTF0vTLzN?=
 =?us-ascii?Q?eU/M6pSrXTTZ85whiiXC3uQnXRbvT2+K1qpOFJh2Rk3O3AHAHGizkAISs+TD?=
 =?us-ascii?Q?Vq4CQ/mVgTMA0q4kzmHH5jvcXTVQSzF1LY4RCjF5A3aSRY22d0gDXvSjA0go?=
 =?us-ascii?Q?8PBo1hfijnWvPduNEtS2mTrkZnFQ10+oc87C1/DRQB2X4B4iYT3mgo8S19Jx?=
 =?us-ascii?Q?2/5Zsq3x10H8fqxoeD+Fh93+dLl30bKAhy8Bt3dtqHjNqMwIaASFK8h6Na/q?=
 =?us-ascii?Q?loFFuL8DxSO1nhKddP7SSOPr3ShJ6pT5W4oyQRA3B575g+49aUPQ+qCJVFFM?=
 =?us-ascii?Q?M1qPMo4MyWoT+oDSzH6zbVqc/KkzD0Bu/SVPe824ED0L9vwImCaGs+gY8d7f?=
 =?us-ascii?Q?qnEYyTThDnlP5eot2nkIQyAT/sPL8u6kWoqJ5wR9bTY0wCyNGg5gcBvVJWci?=
 =?us-ascii?Q?n06kIek1hlfpx6RzcgQC519ziV5rRi03fiJ3zF3NjOiAcJjnPWCAghaNZYIF?=
 =?us-ascii?Q?VCXDxmxKxglWk6H9f6xJC9sICEYka9rzWn1edRDG+JO4S19+M0wr6Fp832kd?=
 =?us-ascii?Q?eEX+tEHG1BxehsfJ9l2mi0fTe41ZPz1cj8BGqcWi9U235Os6fmRCep5y5saP?=
 =?us-ascii?Q?5a1jWn8hJG0SiaQL2/qFyiCeJs0umwtb9aNiPVkvk7v3pPv7kR4mADOybCLP?=
 =?us-ascii?Q?1gRd09lsuF1LMullq7Xa+b+LvRIuNdoZTKDbRTX/2Uxs72pPiXvKarCYlIEQ?=
 =?us-ascii?Q?RSl4vjn/40x9ZGH5+8l9m3bhbBaiHietOdRWQwRuOVlL1FTnfvvWQGF2Uc3o?=
 =?us-ascii?Q?sKW4ZdkvkRzn8unr+oTGLPZkF6nCbKoKgRWjXwsP/xJw909z2MNRZvQls5gB?=
 =?us-ascii?Q?w2dSJI8pqi8/aD743AuVyokrGnhGTSoiy3/g1d7RvHEaJg9lDVSUJexaObsR?=
 =?us-ascii?Q?MDCO4xAu2zJXW5/vJBNnx/8eadLMfxI2dFbrP+bx6BoIoVUzonp64F9jbdPD?=
 =?us-ascii?Q?L5EpHJNY6LJ6wQ0OPtGjw2hMnkQ2baivxGcETMo27rntz57hv4A3fupFG6nQ?=
 =?us-ascii?Q?EZug6emWyqvuSiqiaf4l4/++jaetjiggfBcJQKw/SWZoU9btzoZ618QHfGum?=
 =?us-ascii?Q?sSMGQvaOw9CinRmk5HV3827BFmQnzGPLKtUYI223xj3Y4++vLm251BBWbXdz?=
 =?us-ascii?Q?SWRrCywCqEvvHsG5ga39RrawkxsaF0lYy+6jml1GAft9IneNUwEFzpoZ/+09?=
 =?us-ascii?Q?uVhyVlNOd6pjNV1/KcThtFqVmmyonN7pX8ZJQt6R8o/+/7onbErrmMgMkz13?=
 =?us-ascii?Q?E5/Y8PHbMJnql8soCFWnXRUVuEifNa9RqESr6POverg6PkFAUDv1HtFMOs4D?=
 =?us-ascii?Q?mQfsCrM99QbklMg29EdOs5T+HCWA1bRogMEG9un+umTo/Fmn8/qi8yLpMums?=
 =?us-ascii?Q?7HFXq6CJ8q1uc/SLiuoctBMUzmV4/8Y=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c9fb07-4e90-4a7f-eeb7-08dec639f827
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:15:41.2721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAHsoZ1cPROLVAtuiXf/kKTMWl2kalWIWYVj9oSdLy7EeYkRxIlG8IWNg0tqu0I0gOi/iGvfpByOtLShRHwPtLsHTsWWX1VcC88qm3corXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7523
X-purgate-ID: tlsNG-42698a/1781018147-18B60F3B-565615C9/0/0
X-purgate-type: clean
X-purgate-size: 3010
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 628166619EF

Handle XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK} without taking the domctl lock.
This is safe because for these subops, the paging lock is mostly held
which prevents it from operating concurrently on the same domain. There
are some parts that are called without the paging lock held:

* hvm_mapped_guest_frames_mark_dirty() - The function itself takes a
  spinlock so is protected from concurrent calls. In any case, it will
  mark all the pages dirty as required.

* domain_pause() - The toolstack cannot unpause the domain while in
  paging_log_dirty_op() because the toolstack's pause/unpause ops have
  a separate ref count.

* p2m_flush_hardware_cached_dirty() - This is called elsewhere without
  the domctl lock held so holding it wouldn't achieve anything. It
  should be fine as long as it is called at least once.

* log_dirty.ops->clean() - If the callback is hap_clean_dirty_bitmap(),
  then it will hold the p2m lock while modifying the table. If the
  callback is sh_clean_dirty_bitmap(), it will hold the paging lock
  while modifying the table. In both cases, this is OK.

* domain_unpause() - Same as the earlier domain_pause().

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/mm/paging.c |  8 ++++++--
 xen/common/domctl.c      | 12 ++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 1a5822808620..bfb5b423a0dd 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -746,11 +746,15 @@ long do_paging_domctl_cont(
     ret = xsm_domctl(XSM_OTHER, d, &op);
     if ( !ret )
     {
-        if ( domctl_lock_acquire() )
+        bool lock = !(op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
+                      op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK);
+
+        if ( !lock || domctl_lock_acquire() )
         {
             ret = paging_domctl(d, &op.u.shadow_op, u_domctl, 1);
 
-            domctl_lock_release();
+            if ( lock )
+                domctl_lock_release();
         }
         else
             ret = -ERESTART;
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 35144d95b808..a3888c4e87d4 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -559,6 +559,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         ret = arch_do_domctl(op, d, u_domctl);
         goto domctl_out_unlock_domonly;
 
+    case XEN_DOMCTL_shadow_op:
+        if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
+             op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
+        {
+            ret = xsm_domctl(XSM_OTHER, d, op);
+            if ( ret )
+                goto domctl_out_unlock_domonly;
+
+            ret = arch_do_domctl(op, d, u_domctl);
+            goto domctl_out_unlock_domonly;
+        }
+        fallthrough;
     default:
         /* Everything else handled further down. */
         break;
-- 
2.53.0


