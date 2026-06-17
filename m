Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zvtZNwVJMmpyyAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 09:13:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E94697139
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 09:13:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b="UvE3c/4D";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339815.1600892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZkRh-0001we-Nl; Wed, 17 Jun 2026 07:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339815.1600892; Wed, 17 Jun 2026 07:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZkRh-0001v3-Jp; Wed, 17 Jun 2026 07:12:21 +0000
Received: by outflank-mailman (input) for mailman id 1339815;
 Wed, 17 Jun 2026 07:12:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wZkRe-0001uV-UE
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 07:12:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZkRd-00CRyc-Hd
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:12:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3248ce-5cb7-0a2a0a5109dd-0a2a4507bf88-4
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 09:12:16 +0200
Received: from [52.101.125.100]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3248cd-229c-0a2a45070019-34657d648175-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 09:12:15 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OSCP286MB5166.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:34e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 07:12:10 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 07:12:10 +0000
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
 b=NxHXBsgOoXjoyDk6O1l0eGLyZOZn8MQRE6jAeJ3Q+Jhk7ydNmuO82xzjSFDb94zZvkAEtTAZxlZGPgPaXeJkxXcZKOU7OmHsiaRA7aVQh+yWOxv8bhYiOsycvhdV+9qV8gt6m9/pNJOV3Hp/TSBsxnTHCIrdCmEtDuDWBSAwlDCQaootohdA/Lq2r5Zww+Sgufe/tbsqXWzwnz8hsWqLkkbjGyvZqavQHnca9Qq9OLiuLggzGv/tbNz9er5pyy85ECNAg7loLQ1v7Pf57eC7a+aqIrrPh1IMSR903dwid20KittTLyfgWr/2d9Tnx09U+B0GkuNrRsWf/vb5X6R9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrvMnlsbLcf6hVm7dzLutZZx8hyZIVvC1XpWfdLPeg0=;
 b=bHN/tZXejHRJTTiBBHTxDeaJQkB4RgJLVlwz+th7Vhtx0jU9brUMGb4vT+qYeQzV1A9lPMFG1zcW/kTIRjCPZ7SUkTy3ilBPMWxCHzKYQoghNAkKb/yYX94awynTVuF0iOiLgWMpSlyZ+xYK5SmJC1PdmFaH0vvYjkf5n+u8fAduR/yzMOwa9NhWkAn9tivtYyt3zo0wh5CqiYvYteuzvJnRxooAJ+qgPrancImbHgPzRF4mvfKUEyPgD1doe+jAeaYUZqJUImELnGWCOeZ8jh/+V0zk2iMk9iRQskxVyFqjM59p4XXKgI28c/5wE/XBwIBgtyFl7f8NjLCHqntCLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrvMnlsbLcf6hVm7dzLutZZx8hyZIVvC1XpWfdLPeg0=;
 b=UvE3c/4DOk/5X1AYKsFdvnJOMo2IcKr/MIvcTNvFG9upufrrRCxZXDkzX46LHBEyjnGO+xWodKAe5rzD2BpwsFeWDN4Irwsa6Thy+hCzKhAikGFy+mM+QNm9Cp3BdIndlCOYbGUEBCD4e2HOipJbZSZphkWfpUbIExKzmTKPhCs=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v2 0/3] xen/arm: Device Tree based CPU topology support
Date: Wed, 17 Jun 2026 16:12:03 +0900
Message-ID: <20260617071206.265599-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::10) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OSCP286MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 108cefe0-dd33-4aaa-d24d-08decc3fbfd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JYwVZQE3iYQ/J00G2viDSYw+7fVRmUVGI1hcKH4ZYnzntl+IrLGO1KoKjUJB9eIn1l30sr8HILq3PdP4USBF+cn2BFr1jZKk6VKVnNJ3MXyxrcjPvmZ2wRg/K48b9b5FH1Ox4vFvEUyGWCyTjvDOVN28QN4l+Hs2RL70Bfv6zNBlnV27HSrohaH1w/X7ZVc1XdydwVBW82C28+NfciJxx2j1jiweOLbWbL6+qZATqG4AyKGEFQnBkhjL/Mx90jBxchMNdzVCaXTnDhRARqBjcnvJ/lIBJP5vTMgmxOrMA4A1aWuVSpf0E+i8sQN8IaDVVZXbvQ3MxRDgwiZj89YABd4ef4aSOdC8mNN/zV5YmJlgkI2vyMuL5fhSMGUlJ7MYp6ZEDbc2a98Z0qwtMaWuah2F1vdlov+8LDbd+8gIOBKolWuaTpENCI1wUsiIRIZ82+APrhWTrED3hRyZvws0fhp1f6jOvrMjC86CjobcjvnkXmI4loYxDsFjmS8g0jAZcXMMAfV6tGjrenaA98Pg5QRJ6H8k8AntVvZht0QMLvcPnBJPpxX8VbNX2cZOpPltvHRT/wzX2y/4R7jT6lVP6sxIAa/gA/Zee579xsqjKprQphkl9HvCRmFWLrJZgbUJ4NbSUg7sq+kBJUMvcxTft+rXxOA3SldfXzgnivLKUAzrbB2jgpGcIwvmAK0bFMpM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fGoWXYChP3evONTqt3zLCYORfchlCtwTIYB4UpX0vmlmAAy69Bo2/EGCfVbh?=
 =?us-ascii?Q?1dgWo5jM4o7s7WEWG8+kW6GuPJR3NTMYftmQr/9MQMLNV1E0eOCp2W3GfyDM?=
 =?us-ascii?Q?duRjSC36vFMisYA31CDMQWdyk/se21nu2In9cPW/MekP90+9FUwepeGKZd+1?=
 =?us-ascii?Q?h95676BY1qRVctLNmEiCEnfEm0MRV3gufUWUD15+/JshsHVbRV1HzQWIwp4x?=
 =?us-ascii?Q?FTAHXdSQjNKrHI/lS7OSzVheuMCDvZB2Ks/HuDsp7wS788hjOZX22CeclEov?=
 =?us-ascii?Q?10fyeY9CHTiCZmxAJC+wFBIot5sPtA2B+h+43PaHJWRwqNUOT+WSE/iVycxw?=
 =?us-ascii?Q?vvYDLLptBaKgjNQYZtz0i37i9oJ4Uc3VPn4t/UxzFgouxWmAjTeFnc5PnzG/?=
 =?us-ascii?Q?9m3AV9x5hRRb9Qypz6RQDAdS6F/5L940v9bhXlJc4Lu7H5T8BUzTjiTNEzM8?=
 =?us-ascii?Q?rYpqjmKKi1zFnai1jjt4DHpIeRN+VIryPDzRfc+ceBwNfAZ0fKYgMllVbxk4?=
 =?us-ascii?Q?7qBe9K1UlOjV5e0/VInjuCYgGT1Eu2GGUCcL2H+iJB71SuWz9xfSaEBm0QyW?=
 =?us-ascii?Q?3DaYEHiEhXs+gg7EAbjCLTmmsld361p+PuiY+ITLh3WF+4KztFzt/VP8kuSh?=
 =?us-ascii?Q?ZLHH2Isyu1jJ8NR3u0KeXF5RGAi9jJTeri6anOojRnbnYkTWrHim2QZAGP6R?=
 =?us-ascii?Q?+/z2deUOP2yS5QABwnGfPTX0l3Wj/B4V7mUPzvo8+LF+ffUPOjbcD8g2Wc47?=
 =?us-ascii?Q?K4O9fQY/wI/57Q2RfukEKNzSJtSAwW6X3sewM5XfUBgjRSVkkahg1YuJqoFw?=
 =?us-ascii?Q?yJu7NtjEKEJ3Hnr8WV9cANwz5r4nT30J2Hs4CxWR+zHrRFcemY+q6ayHe6tg?=
 =?us-ascii?Q?dws4DCxA6z1glmQMvVSi1MOO6wM+3JFBLVxaMsDl3bnLK4RdTLEMN/tfx9Ud?=
 =?us-ascii?Q?r8nms1qHn3e+QNoaNuw4qzpAjGTKKvsepaumr9/dxtlZ2c89dVJ+yIcHk7ld?=
 =?us-ascii?Q?9cKqB3dLdeRv2tCIxQGuBsuj8Gv7dOmx4MUDJPVRcUpv4W8PeIjTSPqGyCIa?=
 =?us-ascii?Q?AcvtWs+zIMy0jrQJ3Y+vo5Kf3Te1/1w5qgT++nDvJkLBUBkGsKUUSmi2jBuJ?=
 =?us-ascii?Q?yCA6/MQ313eoj8eKuR1jdE3jR2pRaSx4YpoQmo4CuGkdSAQsPijmsW+c+mEx?=
 =?us-ascii?Q?2FifBkRx51DwuR4xBPsZ1Hc/W9jq44TgL6cH3vjXRG5JcPjHULx+Y7eMCHr5?=
 =?us-ascii?Q?/iF58jr5CO6W/JKUC1X9zcENmjV1ofLbGV9i3A5KxoO8ozPFdSsgkfbnbobi?=
 =?us-ascii?Q?0WAQUJQAVD6KZJgFA5kv4xcgBUSgnSGhR31+p20DXYRd2V3nUVP5p7nNSW0C?=
 =?us-ascii?Q?k0kOLb713x7IPxr+zUTd1Ez4NjE0iZQ+Rwgm83OcA4A1XYvny5NpgQ5feWDx?=
 =?us-ascii?Q?X1WPymvqiQoRcP8rRW+v6yOkXYRMhf3eXHwbzarIpXB15ctpeXATs0nrwHN1?=
 =?us-ascii?Q?nieKjSCO0nqCljrkkGYxzgsPnqjTVeXRaXPGhsNoiMNV2gWa8F4+PIZxPaQT?=
 =?us-ascii?Q?35pCJLNH5TjbTF/q6gAIGJ1Mp/KE4QXbkGj65jGZJhJycx5x5SNuQj6bbNDS?=
 =?us-ascii?Q?zeNd9/uvh7A42BUISVE6anBCImoQyhmnju6hY8/y8FMBAVZbyBkEqQ3RYTBm?=
 =?us-ascii?Q?EfAGsLoTroMWCocKqOURpJJhYFenhci322XVQh85klXyBtuiX0YAiBjVCAVR?=
 =?us-ascii?Q?d57o+Ue66lrTlD9AqpAHJtVNpm9g+KbuV8L7SWKTIvnrEyhiuIlgpsA5eNTI?=
X-MS-Exchange-AntiSpam-MessageData-1: xpJoJ+qwORoPRQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 108cefe0-dd33-4aaa-d24d-08decc3fbfd0
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 07:12:10.7549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/JTjcDOiQuCtXGJkunn1w7EX71qIJpVzfo97c/UWfyVeUju45Ka7jz7Qjoh4wLFekTdbX3uTTIDDpbcUFLMBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5166
X-purgate-ID: tlsNG-ef75cf/1781680336-20F66C48-0E548BD9/0/0
X-purgate-type: clean
X-purgate-size: 2582
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9E94697139

Hello,

This patch series introduces basic CPU topology support for ARM Xen.

Changes in v2:
 - Generate topology information even when ACPI is enabled. Note that
   this is a temporary implementation and doesn't yet parse the PPTT
   (Processor Properties Topology Table).
 - Added support for cpu-map node in Device Tree that doesn't contain
   explicit cluster node definitions.

Changes in v1 from the previous series "Introduce Device Tree based NUMA
support for ARM Xen":

1. Optimized Memory Allocation:
   The series now allocates only the minimum required memory area to manage
   the essential data for the CPUs.

2. Flexible Device Tree Parsing:
   The parsing logic no longer depends on the definition order of the 'cpu'
   nodes and 'cpu-map' nodes in the Device Tree. They can now be read
   correctly even if their orders do not match.

3. CPU Hotplug Readiness:
   To support future CPU hotplug, the system assumes that inactive CPUs are
   also described in the Device Tree. Xen will pre-load and generate the
   topology information for these inactive CPUs during the boot phase so
   it stays available in memory.

Thank you,
Hirokazu Takahashi

Hirokazu Takahashi (3):
  xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
  xen/sched: Link CPU topology to scheduler
  xen/sched: Make cpu_nr_siblings() architecture-specific

 xen/arch/arm/Kconfig                  |  11 +
 xen/arch/arm/include/asm/processor.h  |   4 -
 xen/arch/arm/smpboot.c                |  15 +-
 xen/arch/x86/include/asm/processor.h  |   1 +
 xen/common/Kconfig                    |   8 +
 xen/common/Makefile                   |   1 +
 xen/common/cpu-topology.c             |  30 ++
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 394 ++++++++++++++++++++++++++
 xen/common/sched/credit2.c            |  21 +-
 xen/common/sysctl.c                   |   1 +
 xen/drivers/acpi/Kconfig              |   3 +
 xen/drivers/acpi/Makefile             |   2 +
 xen/drivers/acpi/topology.c           |  41 +++
 xen/include/xen/acpi.h                |   4 +
 xen/include/xen/cpu-topology.h        |  48 ++++
 xen/include/xen/dt-cpu-topology.h     |  30 ++
 17 files changed, 591 insertions(+), 24 deletions(-)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

-- 
2.43.0


