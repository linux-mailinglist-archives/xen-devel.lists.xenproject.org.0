Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7+mbGVSURmr5YwsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 18:39:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38036FA574
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 18:39:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Gs52Ehnq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1352212.1609089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfKRr-0003HU-FC; Thu, 02 Jul 2026 16:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352212.1609089; Thu, 02 Jul 2026 16:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfKRr-0003G6-BQ; Thu, 02 Jul 2026 16:39:35 +0000
Received: by outflank-mailman (input) for mailman id 1352212;
 Thu, 02 Jul 2026 16:39:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wfKRp-0003G0-U7
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 16:39:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfKRp-007HlB-At
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 18:39:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a469419-bab6-0a2a0a5309dd-0a2a4506b7ca-40
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 18:39:33 +0200
Received: from [40.93.194.58]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a469443-08de-0a2a45060019-285dc23ac512-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 18:39:33 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB6032.namprd03.prod.outlook.com (2603:10b6:5:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 16:39:30 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 16:39:29 +0000
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
 b=irGt1oz+VsHtgk0pilSn2K54dKX8Es2jvlAesgTgaVbkMUP8sgwow2DUD5+3J2t7f9ikJSOUAUpw6+6lS5cu4nEEmhzgNhS6J4hdjIPJ2pDU66QygR7U3SYSaF5GgRnRC1CN7Svx8nq1cOxAeCcOxiSryAdNrqfS3JW2SSGUhWbwj02yNcddjWWXpU0N4ZPM7swRwAVkuDqeo9T++NPJ8ro9JLSi2Azmv8AxVAd/VjJzrvvsXwI24R/PMp5IC1lrNegxwMFbAZGt9DYC4LXFathrVzHSaefsFznVb30n68xcpSr1zayA8QMwL8xJD0NSjqLFBUm17xRcfnA+vQ+Xnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGR5Lkr/+WrJogcyH2alIWIw2RuHcvnc2gBp24CTNrI=;
 b=dRbvRyGytqzEs9wZ4z9Ha09XTZ/qbas7kf+aAi1g0Iv7uCjND8HnfcNPavtHvtP9mJuYLuT9krPZ0Xeqmte6LxjXxj/mkxbbU1gMrVg3l1CnchiRnN9LfMOXek0m0CiWpsh0dIymWLgk4oi7m05ss2sMOgIWuu8YzBxNDDKJ3jpmW7vlivM1GXd7nXitqrHBeEGInhgf4e5x+a1CkijOUs/uGDrqOZHUUPcIFod9Jw7XQljX6cZJc0mFBW3J0MfBRn7jzS78KzLYl5AtxjSbHy+jKFXvCm+umH858PewHu9H3SXTFGA+QnNfL9f47xFAeSJu3v9poTir3Y/0zalUGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGR5Lkr/+WrJogcyH2alIWIw2RuHcvnc2gBp24CTNrI=;
 b=Gs52EhnqeGx0hf6XYEzeSvDOBHdNOyaoqOWuy3TPivXDbgxxsTSjbmu73YbO/PwjYJzkGorcOwUyGwluD6JrqxaAc1xK0kFLkS2R5UHwvdPNQS8WoyFdcvvprdjBpNL2DQ5jO74W/HRgATQS3lqIGv+5KJ+jGLo5z4tIx+BRzDw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH] argo: fall back maintainership into the rest
Date: Thu,  2 Jul 2026 18:38:45 +0200
Message-ID: <20260702163845.36453-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0022.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0dfa93-bf91-40a0-4249-08ded8587ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	zy3ULQqMl5sgjXblwkch4T8D7H0ThUTmTSuEpuOpoS+9gLEvEy86GTXruh+6e1YjgUi721PTginD5AZIXL4VkwH4DMFd0zUVB+MMqX7DCkxnIh+wHB1xozK4kJQff3R4c0A4L93ph6fGo1KOgp1xMngARiryeFYHWC/jSByFZmRDjpxaykrGZLNzHVJKwbsQh1pS7e4f/uX2ZpPzgPAdnih7EHXkgDgPs8N795n9GR5jHcGTktnHclcQE6E193H0ycRBVkpjbBXZaXNvidr39FOp7zJ2uMEY9tfrYaw9or997Vw12Ql5jSlti9lCIMXj7OKoZWlH7nKpUDT1WGgrj+sWU5j2W4KEl5J2iYPg9kDsIbtjUZaoAeI/NW2s4go11gD+MnDLKtjkKw8LF0VjdxhShqT+fU5B0xyH8HYx0sd0kVClVTgUIaFPwCPKYzJag7RPk9X9Lsr6BoHBoixB6422ie+6rHY8zDIvEBuXLObVovkWu9nIErVHbxUx5qeR1EyaWJjqqEZ80dhwIC6vAMF+1PuihXL16kH7dk9P4uj2dCgnBonpalrguOVA7TxL9+jovcFiAb7nB7pU6DZ1UXxKw0F8Sf79bBQzXu7kou/BWboRwRA7j7cWUlyNuTLR5Q8G78CcPPSsBrcnRX+TKnVDlxvCJgt8Poh+O4p8ABc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1BodDJIY0x4YmxCWWdVQ3RaRjdqS21DUWNqNE5yajJDcFVTTk85UW9ZQUo0?=
 =?utf-8?B?TzlRb0RtbTF3cGlBeVNBdjE5UC9xMDlMbnMwVUJGOHNrOWZ1TWNpNk1WeEJR?=
 =?utf-8?B?dk13a3BUL3MvWkRyT3dYQ3A5ZTBhVFkzUENlYjJ1WVp3UHZ3bjhrQ2ZXak1Q?=
 =?utf-8?B?SmRkVm5kWTZHSy9GbW9zZG9VZjVSbnh0QXNIK2trcDl2UGRZNEpCVEFLaDRu?=
 =?utf-8?B?YXlGSEVQaEFPMUU4QzF6eDYyREpvU2doa2Y2L1l4SlhWWkVMR25zakpPYWVj?=
 =?utf-8?B?WWV0ekUrbEVXK1hzdlpqbVViS2NiTUZlNDVqU21ETGhJVVQ1czBCK0RzVEc3?=
 =?utf-8?B?WUFucG9wdmZiNzVWNVpGK3Z0RHdETDVSa1cwamVpN2xZMWFMRkkzcHlnV01j?=
 =?utf-8?B?M3Urb05jYjRCdkFuRkI5K3djTzNYd0VEVmVXRGgxM3NQT2MxMkRvVXNKRmZQ?=
 =?utf-8?B?K3kyZXpaajZ4bWMxd1NBRHZEZUorQlBqMUQxZ3VJQ1VxSkJYcXFyOUx4cUhE?=
 =?utf-8?B?TERyUGVRM0trK3FGUHZ3WVFlNlpMRHdBNVQ1RnhGcnBHT2pqckhRMWpnRisx?=
 =?utf-8?B?Rk9GKzBpR3RvZEVIdkhGT1ZHQ0h1aDhHTXFHVVBQbjdabTdYYTJBelFNUEcv?=
 =?utf-8?B?QkVsR2ZTbitaT2kyWTI0MFhtcXU2TStkbHo2VUZjTmE2ZHNsTFNZbEtTbXFM?=
 =?utf-8?B?N29uaDJTWHhrb0ZJeno5eG5tRHlveXhja0J1aWRTc2NWbkptV2psaXAvaU52?=
 =?utf-8?B?anZlaU9UZ2ptTnVzWE5STUhlbHJUM2I1UWpJckhxZWIyTnFJNUN4NS9zVE8x?=
 =?utf-8?B?YmJucFhUWnE3dkY2THdlR3Y2V2ljUnFtMGY2VGlmZnRVMmM5Zm5iVFR1MlZY?=
 =?utf-8?B?TllDNkhVNGYwUEN5emVGZUpneXB3ajB2RHVUbTB0OTFNWnNKeTZ5YlNaUmZ4?=
 =?utf-8?B?c3A4U0tsSjhCa2llZ29qV0YvMkhsb25HYmZYSW1LbGlvbzZMcGR2a2s5Zm5K?=
 =?utf-8?B?UTZ2UUw2azhKanNrMFlHRkQ2eFFoS0VuWElxUjJzTUFEQVkzd0UyVnZOa0xp?=
 =?utf-8?B?V25EL0JxbUNVMUVMTUg1aFdYTXkrZkZGQUc1clRkMER4clVPYjA1Mk0wWGNS?=
 =?utf-8?B?cUtwcjZ0WmZVbm9EWk90UWF5OU5QT1JwaS9XM3NwTzdCZTcyVlV4ZWszRUZO?=
 =?utf-8?B?RXNaa0M5Qi8zUjJ6L2lseWxXdkcyTFZxeDhXVStCM0JjVVFLczFzaUtub0tt?=
 =?utf-8?B?aUE0a0dVNThWSnF3NmlKcStjWnZaRk5aUG40d0JTd2NuSmg5cFc4R1V5TmJB?=
 =?utf-8?B?ME1YcTNPTnJGbUlTVTY2TG1ST2RjNzh1SGdkcS9HS2dMcWlyWmJyVE9NQkFn?=
 =?utf-8?B?by9MWkJQMkJ3SGVrSWhtZ2pOQ2M5N2Q1VEtaRGNpdTVxR1dSODFMcWNzL1Av?=
 =?utf-8?B?djdscWlHYXEweWFaYkx2cUM3ZGNxWjQ0Q01JNXZpN3lnVDdUQUM3L3NRdXRJ?=
 =?utf-8?B?TElRS3pURiswMFZrc3owaThqalIwakpwNmdTOTJkT1pGSjZXdk8xcDQ4ZHhH?=
 =?utf-8?B?d3YvRkdTMjQ0b0c0VW5iUFdCMGo0aUhyMmNmMFNITmJzNDB2ZFhwaVNjdkU1?=
 =?utf-8?B?SWdQYjdCQThaUHN3SUp6Zkd6UGZjWVU4TVVlZndYOStaVHgyZ25ZdmZoZlhL?=
 =?utf-8?B?c0dxUjhzTW9qbndDQnlmRUFsK0RaNGJDdy9mQzBqQTAyUU83Q0VKRVJVdXJm?=
 =?utf-8?B?RFByZzZQdElhbUVrOUdhb1dBbk94UWVVMEpvQTVjQzU3clRuaUxsK3hOeG5l?=
 =?utf-8?B?WXNQSlV0eFF6N3ZYWk42OGY1Q25zTXVncDdob1dhU3pMSmlTWitIM2wwVndi?=
 =?utf-8?B?Z0Zaak43SVlNcHdXbXFZWUFwbmQ3dyttc2ZWazFNaERrQ2NFRTU5VEtVUHVY?=
 =?utf-8?B?a0ZtaU11aTRRL1U4L25YQUhUUUN4S3pPSzdDb3g2QkdHWFkzakFHVDFRaTln?=
 =?utf-8?B?TktsSy9oaEloYVJHek9WcEFZMkJRMGxiYm1aYUlJU1JnWlNteWkxdXI0VWFT?=
 =?utf-8?B?Tm5yMDJrK3RRZjhqbnBjbEN1L1lxR1RBbzVqT0oxQW03MnFZNVBSbkljZWti?=
 =?utf-8?B?a2pSMjBLa0M2RHMrU0p3YUZ3T0puYVBnUjZOSUZneGE1dkJRRE84MWpRRXRT?=
 =?utf-8?B?eFdDdEtHMDI3akdRdmFBdHU0VUZjNzVQRklMUWhHTFM3aklvdWkwVGdpekZF?=
 =?utf-8?B?V2UrckxKaDl6eGhJWVJTMnBLTzhKNXpCUEpmRlZHVzIveDI4UU5jNnkrNENM?=
 =?utf-8?B?RVRiaG04TmQyMmNQQVJ2MmlndnN6UVVMQXJ4QUU0bkFycVcxdytjZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0dfa93-bf91-40a0-4249-08ded8587ccf
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:39:29.7670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8xNlq3beIsYp95l/g32QwU0+VNy3Elt3Ur2eGqYwGMyyjWqPHG5vidc5cIIVyy7zzRl/4ZNZdzSPRh6u1gn1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6032
X-purgate-ID: tlsNG-16d1c6/1783010373-F87E668D-0520EC45/0/0
X-purgate-type: clean
X-purgate-size: 864
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apertussolutions.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B38036FA574

Due to unresponsiveness of the current maintainer.  In particular, the
committers have been trying to get in touch with Christopher for 2 weeks to
have a chat about disputes around recent commits and pending changes to the
ARGO component without getting any response.

Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>
---
This patch is on behalf of the committers, and not a personal decision of
its author.
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81bd0dfeec30..6b2e391441d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -241,7 +241,6 @@ F:	xen/arch/x86/hvm/svm/
 F:	xen/arch/x86/include/asm/hvm/svm/
 
 ARGO
-M:	Christopher Clark <christopher.w.clark@gmail.com>
 R:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Maintained
 F:	xen/include/public/argo.h
-- 
2.53.0


