Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h5yZDxA1KGqjAAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2AD661EEB
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=qC2mNv34;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333581.1596703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyda-00013A-Rs; Tue, 09 Jun 2026 15:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333581.1596703; Tue, 09 Jun 2026 15:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyda-00010N-OC; Tue, 09 Jun 2026 15:45:10 +0000
Received: by outflank-mailman (input) for mailman id 1333581;
 Tue, 09 Jun 2026 15:45:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wWydZ-0000zD-D1
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:45:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWydY-008Mzm-Q2
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:45:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a283501-bab6-0a2a0a5309dd-0a2a450ad3b8-12
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:45:08 +0200
Received: from [52.101.52.15]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a283503-56b3-0a2a450a0019-3465340f4839-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:45:08 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH7PR03MB7785.namprd03.prod.outlook.com (2603:10b6:610:24f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:45:05 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0113.011; Tue, 9 Jun 2026
 15:45:05 +0000
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
 b=BuRqPDP4CKgSVn1Son8rNWPkGWfWGtJSwcpY0xJfwRafs6GMke7PseJTEwZa/XuqPMnVvZMHFCUACfiq6eWSUb+stLsbKJwRpyMuT9l//ef/Ehk3FFuDzrC6SCbxh0OAAypEqRCsOisTUDkXlVAHa1RRGs4MhuAocW4JiF7f0br0/KErUW1Kv4K0VA6J2HAQk97Ma+i0WzJ5hKDVw3qFrHp0+X2qmY76c3+SE+9i8iG3WWdBQCWwbmBxXxeSTYf9t27emKdW7bEkHK8YPUsELvKn7leuz22zha+RJe6llxkV4YFyfNE3yVEvryAEdkmwE3EV9jGPpv6FeOGtWhFN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KI7MOQ10o7YlADLvcQgiPGvdTZ9HEiOmoqZrzV/uJUQ=;
 b=PCVTZPnKnMlr2diS6KOYXpTAS2uAoAC2r4c2cpz7EWkfIrWpQF7F2sszx3QDhFCX83heoVETp0xI+RGXQHs/ZtJn5PlBjDjvfmslC7B6AJdUHDfN2FhB3Zwp6OzEZW08ACXWF3k5lJdn0XComF63eEusGk+5yzD6JV+PD2+Jd2+EjBKxFnQ65kY5f0QridVdjuM/Z1+wUymUTKwZo0gdWBHQEtvnD80XHInq/uO2YU2VlS8qiFd+QYRIH6+6yEXKw0xfNRzczhBFqFHrQ3hpcINNPfVQd7qDgYKYv9NYI5cmLhRyHtu4tL6mfW5Mtr680pAZU7r9pMktIwJTpH7Xsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KI7MOQ10o7YlADLvcQgiPGvdTZ9HEiOmoqZrzV/uJUQ=;
 b=qC2mNv34kSM64td1KdiAFrkgc/fHhyVfaFHU8O4UIHZ2kZ4tP/99wVO5IyjNaQ4gVDVDO9v+CUg3pc8QXGIS5SVw0lXr93jsbsTVcAfKG88Er3ZSovrVyadx7kxh2TCJ5K+fBCfpyjmZc9fst2yHrP2OMuPOJEmhGMPEB5acoeE=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <klampis@citrix.com>
Subject: [PATCH 5/7] x86/kexec: Implement new EFI load types
Date: Tue,  9 Jun 2026 16:45:16 +0100
Message-ID: <20260609154518.779757-6-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260609154518.779757-1-kevin.lampis@citrix.com>
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0188.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::13) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH7PR03MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: d5a33db9-cff2-415d-6836-08dec63e1346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	H0nEbq2v3FR7gTck7B81/EDKIcWdn63kOyGn0nplL1bLd/4K4jwBr4sIGBO5XJbmuZlpTvy0oI0U819FaUNr1ti2xO/PnU8vOTLbLSeJJQpnFz3bGBxP448AEmSRWfgll95x1G8WeTgXVCPYmvDUBdJPEqbnwoCalDKC7rg2C+mECNMaBugUz1btFOLVihY9Xv8avqPtOdWh4i64ZUpqBj5O/DJYNrN6F3pdS/1Nmt+suOcKWmq/4FwJMJLLY1Jb1kITuKT57hdq7is37970fAXAT4I+CECFuAFDadSG+5U1T+WgcsIqIrzY5gBgwl6aOU55p7tCU9TVauE/YKolDmM8q58/C2XQpkpjkv/NgW7AbaUxF7u3Npet4qSdrirpZUmmChhqJx5IdVEXYoFFYh4biGPJRlGq9720jBqiHwE6f273rMVh4L9za5YTVqBudH09xPy0QQjBYvl67L/u7koMpkcwPWBZ/EyOUuqxymxjI5K+DDYWyVo370nWclXYOWldd5/3bUy7SbLOcX8A9m7ry+zhj+2dJ1Ru7UmisbVzbDY5dtnjpXSMX/plM9AT2f8a+9wky+jcUIktVWWl3vQ5ud++SIPEJ668gODu/GduYaUR5IkVaVGiCQ7VrMkCeVecQd2nrDD1mn7Y0hey/RnxqvqvhqDEoFkPvpdOM8yve52U3J3sImNsxDiD6eyn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hxTJCbF3TNPjnWKRnE+X3EShqeUqS22iyZ1G/InEqHugi8ROKnpmTZr8Fnk5?=
 =?us-ascii?Q?e9VSfJRCit2cxp8Y8Qeq408fm4s2xTIoczO1PpjwgDTucgiQkSz13REKEHri?=
 =?us-ascii?Q?RPJXaY6XlO2q2fWBQ/SUerpGqOjmtD2Q1SmHCKueXajn/ciwBtgrGgTHbJZU?=
 =?us-ascii?Q?arFwcpDG3u2kNZyHa+Zet1NKBWaqJSCUqHBJ67IgJwv5zaepC5498q/N3eOT?=
 =?us-ascii?Q?s6+jAl5m29wFrFADbyXb/6kF27DL88mdFpWXZblznLkR6RqcbAAbdr2A6kw/?=
 =?us-ascii?Q?iB3lkZesnahGk3cFsPksFvUn+KVbJSrJvX12gpuv+JPNvvZI++0TY6vVu0+D?=
 =?us-ascii?Q?eRz3K1EaRpDtFzj3tPyKxUI5HD4f0uKF1n4Zfzt8qbeNiik9gDUJXuvjJIX0?=
 =?us-ascii?Q?onpubRx8JRL54YJD5xoVZousyR/VY2XA5E2FopRc9c/FeuPnBUPJWbOXeWy3?=
 =?us-ascii?Q?/a+8H7VMa2+SJlU7KA9SYgykWEUNI00hJHYZbIreua1ai2aq0mDGuSnfyxp5?=
 =?us-ascii?Q?lMpC+Eu0KMDcpJfDUbdQLKrCAnJPX0cPf12z0TGK/D0dwfJQqW55Lr1fEATR?=
 =?us-ascii?Q?oN9LEC65KGqukGDZb5kXw6qOii+ixRYIx29qDDJOgVheKzvmtCOTyBmXFpMe?=
 =?us-ascii?Q?+zIZdulOsUSre3w38dfg6AJS32IfHmAacWljmYmYsvghRHQyHfTjtlB+0+U0?=
 =?us-ascii?Q?E/5ffSGnIbtx+Pu+Nn/bgK3MkXifPv5uuJvOgQb61Qie9yzqLHWyEYqBcdVO?=
 =?us-ascii?Q?5yZYqJ+5rSMcK3akpN2+65f+AbldXHzYaSgMRsEH4xhLWcIGJW1t8+NQXTYc?=
 =?us-ascii?Q?7J8WAuH/FuQVbPOpqLSPKQxMeSgtxTEk7EaZThMJK+AF4t7l1DJtQqaGX0FQ?=
 =?us-ascii?Q?yXQOqUMc8PrcufVej9Ayqcnf29AMPg1r4HmSrf2bnhhDdXqWmS7KDhb17vPY?=
 =?us-ascii?Q?a6Ho5Mcvvn+SXwmc+jb0kqNbo/AQ3fqkyvNae5WS4SGFbtyvGg4Ai4hAklIa?=
 =?us-ascii?Q?P2UtiEK5gNDNiOcf5f15Pvg9Rcab7iw5rbmscThtf7oumXnLQBxFZwewIKBP?=
 =?us-ascii?Q?uXCR2WswY0CdeW47rTvUMjxai+pyqe4wj4DAP4n0PVMcgx5GdLNulXRZxYE0?=
 =?us-ascii?Q?62bh7G8UpH2Q6PugjU5cDgtYcqk2Wfhv1WtXxD/gZp0OHI2EvZ0mnkQXvnFQ?=
 =?us-ascii?Q?44m1XWepWOpvbmetbAKIDqv6JYCcpjaUWZFVQNlWiWq1mtE3JcUbaX4OQLRV?=
 =?us-ascii?Q?MzlUc3e6PO2KxTlDLOEeGIS/FInL7ErDDKg2vtLz69Hbd6JEvRhkPBzPA6xc?=
 =?us-ascii?Q?lTsMyFBrUbKf03/KChY/it7u2a03Td7ZQbaGteWWry1uAZHuXGxCpwSY3Cwg?=
 =?us-ascii?Q?VB4o5lT6j7K/Ryv52JoqJjvFN/ly9zgd/IjnlSsAmITQF/KzjnUeLw07Kl7r?=
 =?us-ascii?Q?gVIPIhQmVf5lyZU5278mCMNJ/MhSvqU8YVYQ3+k2n0gg6xKuw3gjqEfiR+jt?=
 =?us-ascii?Q?WeR04hXxY8sG10DmAo1lhLMhZtss1tzj4TrVEHaK9OMKzkfAUFkBO3eldkNe?=
 =?us-ascii?Q?e9fMV9p4iZvgexCLyt3fg472/mLTSUCsPhVRSqGqsM7wLnEVzHGCkqInJE7u?=
 =?us-ascii?Q?xAoOnc0gW4m4Iz+jaGocvQ2vDYzdsn+Ou2AdJSA7BC+3izhyzFv2V41idyKN?=
 =?us-ascii?Q?wRGE+kq33meE9SE6wfkWnCHmFI74KCs+YI6X1pNzdxlol5aKlpeWgAJ+j5r3?=
 =?us-ascii?Q?VynAPSLniw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a33db9-cff2-415d-6836-08dec63e1346
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:45:05.5778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Y3qxvocIZOSvTM9NTUFF9+T+8S7JeIIefoB5FNTONRoAo94M/sjB/QDDdsA3+ByF65hfQtIZfUL2NqXLXWSfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7785
X-purgate-ID: tlsNG-4011c0/1781019908-7CC7A8B7-05B187B5/0/0
X-purgate-type: clean
X-purgate-size: 11502
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:gerald.elder-vass@cloud.com,m:klampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A2AD661EEB

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Add new EFI load type for kexec. This load type is suitable for use when Secure
Boot is enabled.

When this load type is used, the caller should not pass purgatory as one of
the kexec segments. Instead, Xen will prepare any glue code needed internally.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Signed-off-by: Kevin Lampis <klampis@citrix.com>

---
 xen/arch/x86/include/asm/bzimage.h |   5 ++
 xen/common/kexec.c                 |   9 +++
 xen/common/kimage.c                | 123 +++++++++++++++++++++--------
 xen/include/public/kexec.h         |  11 ++-
 xen/include/xen/kimage.h           |   2 +
 5 files changed, 115 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 8c54b21d06..ed61f9446a 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -47,4 +47,9 @@ struct __packed bzimage_header {
         uint32_t        payload_length;
     };
 
+static inline uint64_t kernel_alignment_offset(void)
+{
+    return offsetof(struct bzimage_header, kernel_alignment);
+}
+
 #endif /* __X86_BZIMAGE_H__ */
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 00346fe616..1ae4c069c1 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -750,6 +750,7 @@ static int kexec_load_get_bits(int type, int *base, int *bit)
         *bit = KEXEC_FLAG_DEFAULT_POS;
         break;
     case KEXEC_TYPE_CRASH:
+    case KEXEC_TYPE_CRASH_EFI:
         *base = KEXEC_IMAGE_CRASH_BASE;
         *bit = KEXEC_FLAG_CRASH_POS;
         break;
@@ -848,6 +849,7 @@ static int kexec_exec(XEN_GUEST_HANDLE_PARAM(void) uarg)
         ret = continue_hypercall_on_cpu(0, kexec_reboot, image);
         break;
     case KEXEC_TYPE_CRASH:
+    case KEXEC_TYPE_CRASH_EFI:
         kexec_crash(CRASHREASON_KEXECCMD); /* Does not return */
         break;
     }
@@ -1147,6 +1149,13 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
     if ( ret )
         return ret;
 
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
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 1d872916b9..9b49455e8e 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -22,6 +22,7 @@
 #include <xen/kimage.h>
 #include <xen/sha2.h>
 
+#include <asm/bzimage.h>
 #include <asm/page.h>
 
 #define KIMAGE_SHA256_REGIONS 16
@@ -109,29 +110,6 @@ static int do_kimage_alloc(struct kexec_image **rimage, paddr_t entry,
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
@@ -217,17 +195,13 @@ static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
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
 
-    /* Verify we have a valid entry point */
-    if ( (entry < kexec_crash_area.start)
-         || (entry > kexec_crash_area.start + kexec_crash_area.size))
-        return -EADDRNOTAVAIL;
-
     /*
      * Verify we have good destination addresses.  Normally
      * the caller is responsible for making certain we don't
@@ -253,8 +227,28 @@ static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
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
@@ -426,6 +420,7 @@ struct page_info *kimage_alloc_control_page(struct kexec_image *image,
         pages = kimage_alloc_normal_control_page(image, memflags);
         break;
     case KEXEC_TYPE_CRASH:
+    case KEXEC_TYPE_CRASH_EFI:
         pages = kimage_alloc_crash_control_page(image);
         break;
     }
@@ -788,6 +783,7 @@ static int kimage_load_segment(struct kexec_image *image,
             result = kimage_load_normal_segment(image, segment);
             break;
         case KEXEC_TYPE_CRASH:
+        case KEXEC_TYPE_CRASH_EFI:
             result = kimage_load_crash_segment(image, segment);
             break;
         }
@@ -838,6 +834,10 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
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
@@ -1064,6 +1064,63 @@ done:
     return ret;
 }
 
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
+                         kernel_alignment_offset();
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
+    int64_t rip;
+
+    rip = kimage_find_kernel_entry_maddr(image);
+
+    if ( rip < 0 )
+        return -EINVAL;
+
+    image->boot_params = parameters;
+    image->entry_maddr = rip;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
index 40d79e936b..287255ea6f 100644
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -58,13 +58,16 @@
  * - kexec into a regular kernel, very similar to a standard reboot
  *   - KEXEC_TYPE_DEFAULT is used to specify this type
  * - kexec into a special "crash kernel", aka kexec-on-panic
- *   - KEXEC_TYPE_CRASH is used to specify this type
+ *   - KEXEC_TYPE_CRASH or KEXEC_TYPE_CRASH_EFI are used to specify this type
+ *   - in case of KEXEC_TYPE_CRASH_EFI the first segment will point to full
+ *     the kernel to load and entry point will point to boot params
  *   - parts of our system may be broken at kexec-on-panic time
  *     - the code should be kept as simple and self-contained as possible
  */
 
 #define KEXEC_TYPE_DEFAULT 0
 #define KEXEC_TYPE_CRASH   1
+#define KEXEC_TYPE_CRASH_EFI 3
 
 
 /* The kexec implementation for Xen allows the user to load two
@@ -195,7 +198,11 @@ typedef struct xen_kexec_load {
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
index aab8707cac..ba5d5c2b92 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -51,6 +51,7 @@ struct kexec_image {
     paddr_t next_crash_page;
 
     uint8_t digest[SHA2_256_DIGEST_SIZE];
+    uint64_t boot_params;
 };
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
@@ -69,6 +70,7 @@ int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
 int kimage_verify_digest(const struct kexec_image *image);
 int kimage_calc_digest(const struct kexec_image *image,
                        uint8_t digest[SHA2_256_DIGEST_SIZE]);
+int kimage_efi_setup(struct kexec_image *image, uint64_t parameters);
 
 #endif /* __ASSEMBLER__ */
 
-- 
2.52.0


