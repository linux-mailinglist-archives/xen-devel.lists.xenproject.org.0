Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p43cBfJ9R2rOZQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 11:16:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECE8700854
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 11:16:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=S73jlVwO;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1353029.1609231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfa07-0004eB-Eo; Fri, 03 Jul 2026 09:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353029.1609231; Fri, 03 Jul 2026 09:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfa07-0004cA-Ah; Fri, 03 Jul 2026 09:15:59 +0000
Received: by outflank-mailman (input) for mailman id 1353029;
 Fri, 03 Jul 2026 09:15:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wfa05-0004CO-EJ
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 09:15:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfa04-00GN2P-RH
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 11:15:56 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a477dc6-2eae-0a2a0a5409dd-0a2a450ace40-18
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 11:15:56 +0200
Received: from [52.101.125.115]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a477dc6-e40e-0a2a450a0019-34657d733221-5
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 11:15:56 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY3P286MB3731.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 09:15:51 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 09:15:51 +0000
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
 b=aLQf9NjWFAp0sgYXR18wZlVg/+WBL1XhhzCuFFSa2YTAVJVYMICZeO4I6K35UUMjbt4mrsy2qDe77Rp7m3Bf51boIW8Fqd32UyQKDZT9VVTwGakSK/03W0/S1CtkgGubAoEkvF4iguTzp86j8flI23e2jRRSTlbqufDERIW0RjQrHjTdSgyt9Jj6I9OdnKectMb1ryXKLwPd91LaELnLiwLsBQNwHc1wnLf4APmc6pLCllN5dZmLLEHvJ4ffHWTXaJQdiuRjrud9uBbUOZChgXf/aOYsIW9ZdEtaIosZab0Z+cjXzpKhBoP7y0ZHoKi5yJRGZZ+SZ1M/dnMvvACc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YHhlMJ0BRCDYFFnZBlOKPtPhGxi/edvzDAP34FGr24=;
 b=NsYvwOpSjf9vS+JCTcngE8sLnQkwc7UojEJkKIjDO34iNzeF0T/M9FoTWJao+S4Ryt2hp9JOn6nC+fqeKu1Xc0P/TVBZ6YNm1eJPAN19MzJnPBypqydbUXRf4yHAmDQomnJJvTZBbFAoG2xwH0QVKKijGLKao8y4RIhiVMkNA0uu4LoncwPzIJo5/B2lggyvv2RIZ0SCA3gTNMOK0TtF9hyMgtHYmco4HeNpvVJd/widtHrwrcQZMmt4LgEhIw+eI3laLeHjFOMYxWmGKoyCbuh4trG6BJNmpp3q6DXrr/DsHgMZmvarpx0ySJG8CVWeYw4RrZ4KOltp0Y2YStyy2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YHhlMJ0BRCDYFFnZBlOKPtPhGxi/edvzDAP34FGr24=;
 b=S73jlVwO/nBJ5kW3IUiFk+6QGyNfHhcIZ/W++QIYEJSl5S93Db6GcKl8kfTPW9b7/gcFaLXgGf2tuehwKxjAfFscOrHBeoI5dpMRQk+yjFQ/j9YBTkwknpfcur8Czt2V6aBzGWHv2u+CGxLaqlrW7A6SP0E9wnPfEGbBfxJG+bY=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v4 2/3] xen/sched: Link CPU topology to scheduler
Date: Fri,  3 Jul 2026 18:15:43 +0900
Message-ID: <20260703091544.183548-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703091544.183548-1-taka@valinux.co.jp>
References: <20260703091544.183548-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY3P286MB3731:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb621b4-27f9-4158-1e13-08ded8e3ad3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10070799003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nA6/Gz9DLhADgr6Uqb4vb8g/ivN7hfVWeBPFRkSrrFRqZXVc5mqcceZusHmkG4cOolrqdGuiFfa7GNDp9hiz8pNhdcJYw+Wnh9+21xBghhYswIM9/uIx0heSIM2QGSsryD/CJOz68YPojqRt5QQ7AeNF3KBQs2pob/tMLT4rBJ0ZFv4+FISDstVYbJHHU/8yGkDQzl1zK88EAhcETXYxS/bUHOJ4zUKp91wu6bWm5rS42JTETGQZ423dof71D9dBNMeIwz0B8j0pNNSya0lThgK0xgl88C2Q1WrbjCoQ8D5VjgaWaNVj9ACBf/RVqYeXatumWHFQaXywYir+dW3YY3yepjROTm5qyhhkh0QE26nHP1ApjN/OFtnE+SAgvMlVTc5IUNZu8QB2ObghrFu7SG14MELa6lNB1uDy5tMIMXMbRvSqZPhUL0/W+D/JcuzcHMEyyx4ot58qbSRF9Z87BTs/Ne1LO3z7Uwe/BvIAyV+ox3iSzHv/ILkN0oB73y05/k5hGm7bPWjCCT1eTBHjoziiTzqfUFCecNMlHE4VVhMnFV1RAItoavZ89Fxz5+Ex7Uxg79GW7qqfO6VrPEtElHLKYLf/2YW7sPsOtx46C2tpN0b2W+AHKMpd9ZHFpWWSjJvcDob0gLAqixKjWYeA7FQ18tEB0g/Lce4nMfKHevk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10070799003)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0D1BFx68aW6aVfbvesUXY8qnLYpTgYMqvDI/zjEIZblavbahj17IdISxMZR7?=
 =?us-ascii?Q?zJrAs2gOk4PmK9DR4nUSqu+IMi4DlqpVuMuHBpM0HXOkT9d2lcU2vHEGZRUQ?=
 =?us-ascii?Q?d4SN0SnmA3kM5rusKqnWzyLsAvX02v7NqRHTgMbXX0R68LYmokg/uOCQbR4R?=
 =?us-ascii?Q?fQs9HpuPaiwixb2V5otqNTlU6U12G3cMisPtHQwQJm1PUb4zog1lvLXmj5JD?=
 =?us-ascii?Q?X7j5rsLRhEdYwY8Vno+s5T0/IWpohADqqSQnYS3WsD7oF/EZt7tUvJplYn3W?=
 =?us-ascii?Q?JMpBX4NlX4BAwlSjZT4hparUwKzV4SFxTdHuUp/j0t/+0knpQsaTavaN8JS3?=
 =?us-ascii?Q?gF//RuRiZtoUdLBXr25aH1xpECThf/9TcG07i6T7tiWznhkCHVPSSU4yHCq+?=
 =?us-ascii?Q?1kdZsc+Dicz41dOKlLaTDcVsMwuLTM7aYlkk/E2PEa2RVBIVh7m4NhdG5HQb?=
 =?us-ascii?Q?iaFuNx3Gf2MDKo4M3p2zWUQ471gvEwYMSvkfUGjI7TBXoj2VIMOAvRxm0oBD?=
 =?us-ascii?Q?1HbPPjsdi+g1t/ak7GAHBc9HMPZHTzhoWt0PDIf5+gjcFc766qXWTMhBT+1l?=
 =?us-ascii?Q?js8GCwarqWmkVBHGGqbwd2eQ7+iHjhfiuQC+Xfk6h7u5a72Kv71fz93BG4T9?=
 =?us-ascii?Q?sqSZfz0fOCIYJhrULkjc5AbAODl2gqYCJo1Pyj1Enk9/YOVGA4ief1m8Gl8U?=
 =?us-ascii?Q?dablmPisjYCRWEaVtScoq+NeNwf0TErHANS9ZtuRNodGz0Mjcc8jmkTyHS7V?=
 =?us-ascii?Q?by1y56iAddykWGmKDYC3hoc+Wl4n7ehYuazWWCQQMphr4cx974wJXemHUbIY?=
 =?us-ascii?Q?bfzCuNTJEs9TIOGO5jqXdSz3v3pG5RENCouhI6muQ4E5hfOTcxNqmSFIvD9M?=
 =?us-ascii?Q?BzuAncAHkwBe4u8LL+cKpuvPEeBh2mL3slGXC1CoorfXJyP6A50qmFuMGKA7?=
 =?us-ascii?Q?7PFM6ZnueCjq6jdwqu8dpPFi2eW5crNUFneE/jXKMWTOEsBsnygSgidopipa?=
 =?us-ascii?Q?XWvFTsHueAzPHL0gp6ohfxl9HZGpcudtXNVfMU3HbPyHrDqUjhk11oK3ubAX?=
 =?us-ascii?Q?yq9Brn4yWZZFyEwoPtIgGde4OGDrOhls5dA4ryQlZV4xW7FbeFhYeAz80xki?=
 =?us-ascii?Q?8rIGA4uTrW39NQa4t4DmFq4Jmna2d/GYHieUmgsSqZx8UXSdoLAikCSY4Ztc?=
 =?us-ascii?Q?YwdM+HCCkU1TB7I8xT1FqYPrx/DcVSpAAzLkLiqpIHuP+BNBpJglG3hDnCrf?=
 =?us-ascii?Q?hAMJx1MEDHUmvo9AV/lmuYFgDIbWdDh6vL3wW/y376nkpAzUkTVdlrn8tEqz?=
 =?us-ascii?Q?6KDZkxMVi6u6wav7AuQKaueJHqBIZoNPaqUsjr7nezX6tjR8BB3E93nzB6hJ?=
 =?us-ascii?Q?SE7gGOmRM7rgn9mep++85z6tPBO0M43LZ+NsFgGPNyyAJxxDY6cK13CAhWbL?=
 =?us-ascii?Q?ndVgsZ+zMtirgXUCfAP3+GiO5wtwVtXug7sb1XN6jV8s8M78ySCLmO8XwcZq?=
 =?us-ascii?Q?A+vbBrSI+pRF1ed2arYnOua9VN+Dba7a68fixxed74upp3hYRYpiFXZ93vvo?=
 =?us-ascii?Q?QGa+8q/5vMFSuMZ1mRQk+RkFTyaWz2pX/hPt9SgNnlkZc3JnWDVcwJkxauZK?=
 =?us-ascii?Q?K4dfY3ixGKtGHG7VOKRHHaWNUowLPZ/5BedddCDiZ/wXhYcSQD1fbifDMPVz?=
 =?us-ascii?Q?nVQESFmozWbjobUJTG+fVy4SGYk72M71L1sH+FElPQNKITf5rfu2scGE75Gh?=
 =?us-ascii?Q?0JH6RDH2UUAhfHvIxIh8T046+0QVTQWjcOHaZH6+VlM/O2zzcZIOVLNuegeE?=
X-MS-Exchange-AntiSpam-MessageData-1: x9kPTIBldMY/0w==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb621b4-27f9-4158-1e13-08ded8e3ad3b
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 09:15:51.0417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4EaEG/NesYEwkb1Vgnv91kV8OexUC+y+UesgDFni0vdAPuYU6GhQjS/Gbe2ZmYjfX5m/3WzO/In61hqPvEQ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3731
X-purgate-ID: tlsNG-4011c0/1783070156-D5D23DDE-8CB46B54/0/0
X-purgate-type: clean
X-purgate-size: 9565
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[valinux.co.jp,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9ECE8700854

Make CPU topology information available to the Xen scheduler.
Additionally, ensure that this topology information is displayed
when executing the 'xl info -n' command.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v4
 - Explicitly #include <asm/processor.h> in cpu-topology.h to guarantee
   that arch-specific definitions of cpu_to_core() and cpu_to_socket()
   take precedence over the generic fallbacks.
 - Introduce inline initialization functions for cpu_sibling_mask and
   cpu_core_mask in cpu-topology.h, providing separate variants for both
   when CONFIG_GENERIC_CPU_TOPOLOGY is enabled and disabled.

Changes in v3
 - Remove the temporary definitions of cpu_to_core() and cpu_to_socket()
   from RISC-V and PPC processor.h.
 - Minimize the use of #ifdef blocks, leveraging compiler Dead Code
   Elimination (DCE) where possible.

 xen/arch/arm/include/asm/processor.h   |  4 --
 xen/arch/arm/smpboot.c                 |  8 +---
 xen/arch/ppc/include/asm/processor.h   |  4 --
 xen/arch/riscv/include/asm/processor.h |  4 --
 xen/common/device-tree/cpu-topology.c  | 51 ++++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  3 ++
 xen/common/sysctl.c                    |  1 +
 xen/drivers/acpi/topology.c            |  3 ++
 xen/include/xen/cpu-topology.h         | 45 ++++++++++++++++++++++-
 9 files changed, 103 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index a3753c317f..41fa73cfc4 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -613,10 +613,6 @@ void show_stack(const struct cpu_user_regs *regs);
 
 #define cpu_relax() barrier() /* Could yield? */
 
-/* All a bit UP for the moment */
-#define cpu_to_core(_cpu)   (0)
-#define cpu_to_socket(_cpu) (0)
-
 struct vcpu;
 void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
                            struct vcpu_guest_core_regs *regs);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 5ce2bcf6ec..3c9f2a5c53 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -92,13 +92,7 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
-    /*
-     * Currently we assume there is no multithread and NUMA, so
-     * a CPU is a sibling with itself, and the all possible CPUs
-     * are supposed to belong to the same socket (NUMA node).
-     */
-    cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
-    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+    init_cpu_sibling_map(cpu);
 
     return 0;
 }
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
index 242346cab9..1bf6f6c66c 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -141,10 +141,6 @@
 /* Macro to adjust thread priority for hardware multithreading */
 #define HMT_very_low()  asm volatile ( "or %r31, %r31, %r31" )
 
-/* TODO: This isn't correct */
-#define cpu_to_core(cpu)   (0)
-#define cpu_to_socket(cpu) (0)
-
 /*
  * User-accessible registers: most of these need to be saved/restored
  * for every nested Xen invocation.
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6b89df4a2d..d478ffb76b 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -54,10 +54,6 @@ struct cpu_user_regs
     unsigned long pregs;
 };
 
-/* TODO: need to implement */
-#define cpu_to_core(cpu)   0
-#define cpu_to_socket(cpu) 0
-
 static inline void cpu_relax(void)
 {
 #ifdef __riscv_zihintpause
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
index b653227ef4..43322a153f 100644
--- a/xen/common/device-tree/cpu-topology.c
+++ b/xen/common/device-tree/cpu-topology.c
@@ -330,6 +330,55 @@ int __init parse_dt_topology(void)
     return parse_socket(map);
 }
 
+static void __init setup_cpu_topology_ids(void)
+{
+    unsigned int cpu;
+    unsigned int next_core_id = 0;
+    unsigned int next_cluster_id = 0;
+    unsigned int next_socket_id = 0;
+
+    for_each_possible_cpu(cpu)
+    {
+        unsigned int first_cpu;
+        struct cpu_topology *topo = &cpu_topology[cpu];
+
+        first_cpu = cpumask_first(topo->thread_sibling);
+        if ( first_cpu == cpu )
+        {
+            topo->phys_core_id = next_core_id;
+            next_core_id++;
+        }
+        else
+            topo->phys_core_id = cpu_topology[first_cpu].phys_core_id;
+
+        /* Reuse the calculated core id if clustering is not supported */
+        if ( cpumask_empty(topo->cluster_sibling) )
+            topo->phys_cluster_id = topo->phys_core_id;
+        else
+        {
+            first_cpu = cpumask_first(topo->cluster_sibling);
+            if ( first_cpu == cpu )
+            {
+                topo->phys_cluster_id = next_cluster_id;
+                next_cluster_id++;
+            }
+            else
+                topo->phys_cluster_id = cpu_topology[first_cpu].phys_cluster_id;
+        }
+
+        first_cpu = cpumask_first(topo->core_sibling);
+        if ( first_cpu == cpu )
+        {
+            topo->phys_socket_id = next_socket_id;
+            next_socket_id++;
+        }
+        else
+            topo->phys_socket_id = cpu_topology[first_cpu].phys_socket_id;
+
+        topo->num_siblings = cpumask_weight(topo->thread_sibling);
+    }
+}
+
 void __init dt_init_cpu_topology(void)
 {
     unsigned int cpu;
@@ -342,6 +391,8 @@ void __init dt_init_cpu_topology(void)
 
     for_each_possible_cpu(cpu)
         setup_siblings_masks(cpu);
+
+    setup_cpu_topology_ids();
 }
 
 /*
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 95946634d1..ada430f262 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -9,6 +9,7 @@
  * Based on an earlier verson by Emmanuel Ackaouy.
  */
 
+#include <xen/cpu-topology.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -37,6 +38,8 @@ static unsigned int cpu_nr_siblings(unsigned int cpu)
 {
 #ifdef CONFIG_X86
     return cpu_data[cpu].x86_num_siblings;
+#elif defined(CONFIG_CPU_TOPOLOGY)
+    return cpu_topology ? cpu_topology[cpu].num_siblings : 1;
 #else
     return 1;
 #endif
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..81a68fe24c 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -28,6 +28,7 @@
 #include <xen/pmstat.h>
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
+#include <xen/cpu-topology.h>
 
 long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
index 6bd2d96ebb..9155edc0be 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -22,6 +22,9 @@ void __init acpi_init_cpu_topology(void)
     {
         struct cpu_topology *topo = &cpu_topology[cpu];
 
+        topo->phys_core_id = cpu;
+        topo->num_siblings = 1;
+
         cpumask_set_cpu(cpu, topo->thread_sibling);
         cpumask_copy(topo->core_sibling, &cpu_possible_map);
     }
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index f64820febf..ee34425680 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -4,6 +4,9 @@
 #define XEN_CPU_TOPOLOGY_H
 
 #include <xen/cpumask.h>
+#include <xen/percpu.h>
+#include <asm/processor.h>
+#include <asm/smp.h>
 
 #ifdef CONFIG_GENERIC_CPU_TOPOLOGY
 
@@ -11,16 +14,56 @@ struct cpu_topology {
     cpumask_var_t thread_sibling;
     cpumask_var_t core_sibling;
     cpumask_var_t cluster_sibling;
+    unsigned int phys_core_id;
+    unsigned int phys_cluster_id;
+    unsigned int phys_socket_id;
+    unsigned int num_siblings;
 };
 
 extern struct cpu_topology *cpu_topology;
 void init_cpu_topology(void);
 
+static inline void init_cpu_sibling_map(unsigned int cpu)
+{
+    if ( cpu_topology )
+    {
+        cpumask_copy(per_cpu(cpu_sibling_mask, cpu),
+                     cpu_topology[cpu].thread_sibling);
+        cpumask_copy(per_cpu(cpu_core_mask, cpu),
+                     cpu_topology[cpu].core_sibling);
+    }
+    else
+    {
+        cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
+        cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+    }
+}
+
+#define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
+#define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+
 #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
-#define cpu_topology ((struct cpu_topology *)NULL)
 static inline void init_cpu_topology(void) {}
 
+static inline void init_cpu_sibling_map(unsigned int cpu)
+{
+    /*
+     * If CONFIG_GENERIC_CPU_TOPOLOGY is disabled, it is assumed that
+     * all CPUs reside in the same socket and that SMT is not used.
+     */
+    cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
+    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+}
+
+#ifndef cpu_to_core
+#define cpu_to_core(cpu)   (0)
+#endif
+
+#ifndef cpu_to_socket
+#define cpu_to_socket(cpu) (0)
+#endif
+
 #endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


