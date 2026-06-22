Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e3wEFBFSOWo/qgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96726B0A64
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=mUKUHpoB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343887.1603115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgOw-00053u-4K; Mon, 22 Jun 2026 15:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343887.1603115; Mon, 22 Jun 2026 15:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgOw-00051m-1G; Mon, 22 Jun 2026 15:17:30 +0000
Received: by outflank-mailman (input) for mailman id 1343887;
 Mon, 22 Jun 2026 15:17:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wbgOu-000504-1v
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:17:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbgOt-00E73L-EY
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:17:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a395200-5cb7-0a2a0a5109dd-0a2a45038640-12
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:27 +0200
Received: from [40.107.208.33]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a395205-a3da-0a2a45030019-286bd0212c4e-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:27 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH9PR03MB649383.namprd03.prod.outlook.com (2603:10b6:510:3e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 15:17:24 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:17:24 +0000
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
 b=l84MRssP3/eD3cIWgWjBpZcT+pBEDkyFo6hqNImNqq4pxNLBdiKIDmK5zV8T8OksjQGZ1oGdSVJ6kG6JxQ26pD7akwdKB2TEddW21H/VkAJ1JCBjAOBy/j04cSQ6xIEL1YIvK349DFF2fdHykkegdjvgxFq6Z7o8lgPKmcGG1eS9L/ucfMzr76QjX69NR14fEoC3MmI4lSbiTAevTpWj1917VC+paLpMcykkDSOM++trQ3ZtMRKFWwQWsUGfFaJjgiRdMt9VQLy0aHgOTHpytjq9qwriTpntANwaJiX5z8qTkSzf0y1rdu2eI/SJ7zVuklN/5SVBS/bz3IasqAddAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUE0diub8b5VOQ/mzGELkOwMACwH9u3WM5ytnZS8ZpM=;
 b=TAHcl3JLo+uz/TdGEVimbpc4nLHhOUfSsn0cuEVBFWeG9I2wZLKeM0By1bORsXNPd2MymcRnRqdLNjvTP+FrRL3Q17nWSrTOBwkI/ZARkv8lSY2a6nH0qSoT/tPdMHeYEHXN6A5Pvswx6d6xGnAYYbte9tEf7cmgrG2waGT4gP1l9z1xFLokFW0IBa77az5EyzHs5jmnPVvufB+H1jGZykQqifDnkloACu37kOlaz1mtTwewT3APOz9UQiQmN7JqnqBCQk/wWBnhI18ZdFhDryJpJICkHblosveYGE5WU9VOVtvDE/zR15qAILUq8rI8byyTdlTfElu2xYwz8n1L2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUE0diub8b5VOQ/mzGELkOwMACwH9u3WM5ytnZS8ZpM=;
 b=mUKUHpoBVr1pLenZmLj6tJVyQILh2VpSAoKcDwtn0E8qM2Gnp4dKhtxmy9jqu+8aPbQUq04NIdCH/anrHFjO/0us7hIg/Ey/V9XrF+VaC5ZcoLTN+gGk4XcPyy75Uh/bZvCJMddZvzW81nD85UHn4Y3KU6J4WII/SgAffey60mA=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 2/7] x86/kexec: rename setup_header to bzimage_header
Date: Mon, 22 Jun 2026 16:18:28 +0100
Message-ID: <20260622151833.3397692-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260622151833.3397692-1-kevin.lampis@citrix.com>
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::13) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH9PR03MB649383:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8e6b2e-f3ed-4a61-2ff6-08ded0715d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	J56mAV2sJvOxcSP4v9bD6gZiF6Tr3a2yEy87MaiyDgF578SxzAAzUBrcAki9mqAKDgnPcRDGM65tJLOeZ+ADGNm6hG2BST4imjcy1J1GHEFFyR5rUbDMSHyYqkiLSvf1ROIX1jq+nxAmlC/SgNXjAFly+QmJBLpYdT0ZFJUpzqK1ugP4nRYBGmDojaAh8b7tcE0W9KenkrqfGMibgae67o87hceNdcmoMwRvLr2hf7OzvqdOvILW7Zeqies8tsTE166YflNFE9wVlj8kqxtNB/CAJ4NA2bxBlEk+wQGG+sc5Ch0riUlD1ZiEelwRqTqhASoMg3dMphdZ0IznKKdREkeC2pTKaXHDWwt1ZNk0CdZVC4PtCQlJCpJtbUDvl3jgkESqjCJTlJrX2zlQ+7pIjgpurojdNQFRzICL74z8OvSYM15ELCpoBL8VvbDChXgUT1iOjfZxgVnfRc9u5M2Fh/onGY7FViQNVsDa7I8JAsFDELXJnL7OMKAnb8ba7UJNDGCiv6HicixFiiE7WcKzRobmS7l3BmAWZS1OJP6vutqnnDS4fq9GrDTjn5+RwnEZduLlrXxGQyBeUPfXOhTwZTfqQ07CTI8WXjkERePR7b65nu10DBYn0ZtgcNFiywv4Ffqwx0TgQ4MZgm8H7IRJrMgmun/FUoFcuiZzyJpGlB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gUCrV4+wmubgEyxdGFmjGlPQad2Z9esdWozoshrU02yV0+ZgOgZEUhSQHzLz?=
 =?us-ascii?Q?gB5l8z2kfu66CqRMoXNB2qakaKXaj4WtqN2/NllR84088PPOBcmG1yRxniEx?=
 =?us-ascii?Q?SrYU8CjkU34aYsfIfWIGhaoDxE0I6QNym/5QAlz/moA6hckqeD+4cND28ZYl?=
 =?us-ascii?Q?qhjnrrxWqWRqyIl6iAIWKwVdhJu3z7vNMuRlDoph06FfLtPtXVmgJdxbo/S9?=
 =?us-ascii?Q?BnhAog0lZO3sHqPOXVqx4STwfknznvwdqCH4zMrvDcBO5CwgyzkjLTnJUcMT?=
 =?us-ascii?Q?37ei+R8nkCe1DzJQUipoJ3bXAsArJQ6uQsob8Mqj2Vvjg8uHEpmItcPFrPbO?=
 =?us-ascii?Q?7zIH6pHEUSIcKa4PEKPGklfX33/8WCzbFGCmqvvYzvOH9RYq1z1JZdrerSPX?=
 =?us-ascii?Q?Elrt9rRCoTKBqiaaFMOLriwjn++i2hL15rSjrBoSF8rvBeklCzMqy7G0zSV6?=
 =?us-ascii?Q?aqVr3Zsv5c2p+57i60IvevHupfVh2gNNB3agp3goI/uIV9sHC34Scw5vAJQ1?=
 =?us-ascii?Q?AwKmldE7Kjet6Ud0I2EXBougvsYzAnB/W7LDjWYGYEgHaxsujEiNprucTldB?=
 =?us-ascii?Q?e+JXVu+KZPFAWI2TRpLyO3e9dpwT5rLjcK/x7k5GlgzE/h0Lkp2Ce2njVtiE?=
 =?us-ascii?Q?gbWBeyGPf8pcn94rRehsFf1fjc4o3HdKtihdqpDUJIDReyBj497g6TT3YKCG?=
 =?us-ascii?Q?v1gB6bbSu+lnJvYwJy5j0Qk4mR9MMyJ4BrawFIJJu+MJ5+a5XNP4p5aYvR4G?=
 =?us-ascii?Q?EisClPb3oUnJJqM5puaiBjy2bZGOwymv47YssFSvYRJs7y3TCRTYGQBn+WGN?=
 =?us-ascii?Q?Fcre+vCvLNhpB6ksLOefncfS2M1VdJzC2gyaBfrwnQ1VPuGVaub4+g+ye6oD?=
 =?us-ascii?Q?MEDPx0wXWXESGw9tuOf6B7QA/7YrHJIZUmFPiXmwm6USHFF1H8djrGiuxfp6?=
 =?us-ascii?Q?CdbVT8f2EHNv8XblsYIE0xz3MRPLqgG+HcXIi6260nnWdH3Aft2Z9M+zC4AM?=
 =?us-ascii?Q?ywuB/jqrxbtgYz44OLKkZKkKL1UToQWpwQKge+6Wl3l9vy4DHC60Qw8eosn3?=
 =?us-ascii?Q?g/m0KvB/+a/Uz8CeYfiv3BpoOzByVR6iKNh/67EBes+Up9G85NhaxRgxGjt3?=
 =?us-ascii?Q?46bIKZ3d35PjdOzs6Chp4ubKIUrPPIPvdWms2Yyqvd4Kt8y/cDKavGYts4fF?=
 =?us-ascii?Q?TbnfSD2VhCUYJ0ekXxwKZJXBtqH2I1L2rOSHzOwgIJBmrNhVivRZvZUP1rHi?=
 =?us-ascii?Q?TNqVNHup4eAXxffplI9Ci4OEPE6FbKmFdKVlH2BIEgu5fqReBGRb0scNbYhb?=
 =?us-ascii?Q?hza5BwwN7s/ffJUyIZXwELuvfXeI8e5+24131w5u8UQzkP5ZvZU6mFrI7XSz?=
 =?us-ascii?Q?GR7YNTyXRLHuEdIvp7Gbu+iPoPMxXAbjQDfsqBjdfm1MJoQmYMieKshkbwjc?=
 =?us-ascii?Q?49wKNXLiaM6gCxufj0eCC+ouCkU1qA14zgrOxbbT8wnmYtH496KO/d1n4iMo?=
 =?us-ascii?Q?jmwem2feo0LHHjDAEgPNKAr7fdiSNkIzCKlaGDGzRBX+bXVFBfW8LXtQx2xC?=
 =?us-ascii?Q?YYjCVyPqcnI8pC0KMAtIYrOQ6Ja7miVlIkkjY7zgCPwaIXjhfOr9LsI4hXks?=
 =?us-ascii?Q?Ah53mhPn+2mHd6YKwpYydhZhFfeQIbWi2xPyKZtU61xSzkLb38+3lSGEWfWG?=
 =?us-ascii?Q?nfyGvvcevQC9wNgbcgBHAIlrb36bXSdWMB9DwzfgaH/SkItAcivIWtBZLJuw?=
 =?us-ascii?Q?MHl8u7MpNw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8e6b2e-f3ed-4a61-2ff6-08ded0715d0a
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:17:24.4910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbqdLGdlGZnyHwdSPcDultciUDuLZvI4yvh8IUDnWlaWr+M8C/eF1V9pK9kfzyfktebe58kVtxClaWpQ2j0FOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB649383
X-purgate-ID: tlsNG-33051d/1782141447-CD879D84-4F80E762/0/0
X-purgate-type: clean
X-purgate-size: 5601
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: E96726B0A64

From: Ross Lagerwall <ross.lagerwall@citrix.com>

The newly named bzimage_header is moved to a header file because part of
it will be needed for Secure Boot kexec.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in v2:
- Remove unneeded casts
- Move setup_header to appropriate header file bzimage.h
- Renamed setup_header to less generic name bzimage_header
---
 xen/arch/x86/bzimage.c             | 47 +++---------------------------
 xen/arch/x86/include/asm/bzimage.h | 39 +++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index 66f648f311..02433ac46f 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -13,48 +13,9 @@ static __init unsigned long output_length(void *image, unsigned long image_len)
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
-static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
+static __init int bzimage_check(struct bzimage_header *hdr, unsigned long len)
 {
-    if ( len < sizeof(struct setup_header) )
+    if ( len < sizeof(struct bzimage_header) )
         return 0;
 
     if ( memcmp(&hdr->header, HDR_MAGIC, HDR_MAGIC_SZ) != 0 )
@@ -73,7 +34,7 @@ static unsigned long __initdata orig_image_len;
 unsigned long __init bzimage_headroom(void *image_start,
                                       unsigned long image_length)
 {
-    struct setup_header *hdr = (struct setup_header *)image_start;
+    struct bzimage_header *hdr = image_start;
     int err;
     unsigned long headroom;
 
@@ -106,7 +67,7 @@ unsigned long __init bzimage_headroom(void *image_start,
 int __init bzimage_parse(void *image_base, void **image_start,
                          unsigned long *image_len)
 {
-    struct setup_header *hdr = (struct setup_header *)(*image_start);
+    struct bzimage_header *hdr = *image_start;
     int err = bzimage_check(hdr, *image_len);
     unsigned long output_len;
 
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 7ed69d3910..8c54b21d06 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -8,4 +8,43 @@ unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
 int bzimage_parse(void *image_base, void **image_start,
                   unsigned long *image_len);
 
+struct __packed bzimage_header {
+        uint8_t         _pad0[0x1f1];           /* skip uninteresting stuff */
+        uint8_t         setup_sects;
+        uint16_t        root_flags;
+        uint32_t        syssize;
+        uint16_t        ram_size;
+        uint16_t        vid_mode;
+        uint16_t        root_dev;
+        uint16_t        boot_flag;
+        uint16_t        jump;
+        uint32_t        header;
+#define HDR_MAGIC               "HdrS"
+#define HDR_MAGIC_SZ    4
+        uint16_t        version;
+#define VERSION(h,l)    (((h)<<8) | (l))
+        uint32_t        realmode_swtch;
+        uint16_t        start_sys;
+        uint16_t        kernel_version;
+        uint8_t         type_of_loader;
+        uint8_t         loadflags;
+        uint16_t        setup_move_size;
+        uint32_t        code32_start;
+        uint32_t        ramdisk_image;
+        uint32_t        ramdisk_size;
+        uint32_t        bootsect_kludge;
+        uint16_t        heap_end_ptr;
+        uint16_t        _pad1;
+        uint32_t        cmd_line_ptr;
+        uint32_t        initrd_addr_max;
+        uint32_t        kernel_alignment;
+        uint8_t         relocatable_kernel;
+        uint8_t         _pad2[3];
+        uint32_t        cmdline_size;
+        uint32_t        hardware_subarch;
+        uint64_t        hardware_subarch_data;
+        uint32_t        payload_offset;
+        uint32_t        payload_length;
+    };
+
 #endif /* __X86_BZIMAGE_H__ */
-- 
2.52.0


