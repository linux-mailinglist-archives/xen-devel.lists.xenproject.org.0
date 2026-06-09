Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b5e1Ifo0KGqXAAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:44:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B4F661EC3
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:44:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=cxNiQvGy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333570.1596677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWydD-0008G2-2e; Tue, 09 Jun 2026 15:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333570.1596677; Tue, 09 Jun 2026 15:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWydC-0008D7-Up; Tue, 09 Jun 2026 15:44:46 +0000
Received: by outflank-mailman (input) for mailman id 1333570;
 Tue, 09 Jun 2026 15:44:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wWydA-0008Ae-VE
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:44:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWydA-004xC6-Bv
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:44:44 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a2834df-e002-0a2a0a5209dd-0a2a450bb8ae-18
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:44:44 +0200
Received: from [40.93.195.5]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a2834ea-212f-0a2a450b0019-285dc3050a70-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:44:44 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH7PR03MB7785.namprd03.prod.outlook.com (2603:10b6:610:24f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:44:41 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0113.011; Tue, 9 Jun 2026
 15:44:40 +0000
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
 b=koAZlM+AodrRo+Z5ExfEvGUFVVGWvWOEr57W7+cVtAb5WhXv+Wio4rZFGrpj3DQj2Nba4mrujARaDBJJL5lQ+3uFn614nzdhUWEhxbFvtczDub/UrwFIz4+8jpi3bctBCPXngi9I6vW+F13WAAnca4pt0yL/ayix0NqsJOSuYXNGAWDbOXMkNTgUiPz3G4O0Q+fzwVgyaGos1cJ2fepr6pJFD2kQDGjGknq0q44jIUvpKT5LY9B3NyKNr5HtmarJP1V2b+ZHW++zTOJ/8RbjSi7VkBHMsWag5vW6ir4NSGBnFhbuZpapPKBtWHDGBR9Sj+EHTD21hB5+u9isoL5Lxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIH9KvupJ8ijOA24fC5XIyF7FAhRnmR/5dpkrBIvgl0=;
 b=HtKceA6KCAsEamPo0GnDjgE5wtdB3DntEBGAXf2cG9u59zQNYRuQvjvMWqx2FjEhPpkAsAdgLZ+2FaqBoPTX/OQs3JjXU5JS+Qsy1nGVbmzEubgqk3qur3KXM3uxOzRnm4JX3QG/5WKhS4RJ/qEOzBrrQ6rtgV7ziJl7hyelC7LToZ6FH+ITAP1yt1oymj/UWyUHSMlB2BYRr7kuJY23lYC4dOCaXr3OsvlIAME3lMOQ8fC+9+VjF37G/OhCh/tZQSWpiVT66JeusndLPTfcJexvTF1RxB03otDNp7M0W85cw+NkyNkTZTMD25RuRRURj/UJk4rDxc9NPi/t9RzMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIH9KvupJ8ijOA24fC5XIyF7FAhRnmR/5dpkrBIvgl0=;
 b=cxNiQvGyPkWV3Wz+No60fp5eMt7FhO2FvovxHjL71WJPbGDPIXMm3wH8jIDptiPHRBcZo9ks69gRbnGG+Aw+mJAQgIf+dht/LYNpkhutVzTFdSdqRE5lql3lvPWdc2vxEvWg/HsvMmcDmffbCDj44uyXxDXb+9HD35hT7qPmWxY=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <klampis@citrix.com>
Subject: [PATCH 2/7] x86/kexec: rename setup_header to bzimage_header
Date: Tue,  9 Jun 2026 16:45:13 +0100
Message-ID: <20260609154518.779757-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260609154518.779757-1-kevin.lampis@citrix.com>
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::21) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH7PR03MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 321b8c0d-bb79-48df-4ade-08dec63e041c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	bfrnUdKKJKIiVeLj7O4iU1VE6TOcmJQv9iLg64QspBaqwmqspEV+dcG2pegmu47FOnIFypuZzHH86vLJhwWJminEdWfdGOcVf36IuXynghlSCd1EYTjIUDk9FAPUVkTIp7Ez4Ym85K5HeyvlrGxeWBtYqAoxhj6oeVwbpruU3bpT5CKCV5e8bOJuz4+/b74qU2Rpj426sAdDBpM2uXHHRGu8XhUAZLhg8kGhvJ3A/WvEBVz/0tk+KWLD1D4eDbl/ZdeNGTpQ1QuPgpevmmYPoael8ScmZQjYh83rmbEGywHOUqnoVs/WaB5Yga8FBvOtizcJ8AzS1Df7Aet63tW2Djd5MPjm/HFwEvwvVdvHwcB5mL7VrnEjcsBiDCbyLYN6lb08P6v5oOB75H4NyjtTxXnxmed58VdWB6I9RTyMqM0SJfbH+YJ3tv3e+ElUXQ8xnw3x8vuEwP8/eEloDE1lIF2YFEHDv+TdZufICVkd/zAogr6qOhTOYaURwmU8iYuE1IkZn7BWLoIQI6gnvNPfviKz/FtaWf142NBzIxS+OxsNN34UnxmsYMKHUFL8a21rn/tWeTQRVu2N0Va18ZXOin0krkCIr3iOVHrtT67i0I4BC5ihytrKMR8oyuZ6+cQ3D/4l3dFVz34lTsauNARyPa1Q6TJVPa9HOncawwOhMgiK2D6RqRPjrNMBUQN0B6Eo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n9MHSLxaE8sI06XlPGtWJw8hdk+R3UUwt3V2SPw9Tz710b8OjY+XDAmIQUNd?=
 =?us-ascii?Q?SoKuZIiAy1S5gpbMkZN75GXaTK7DUE0H4LLa/TMhwalz0JVNhBbBgu/TVHg0?=
 =?us-ascii?Q?vbW4xxF28lH8M+RKYILkNPdGV66Y6sWJJWteZ6/qo0pFi7VUylHW9993nn+H?=
 =?us-ascii?Q?MHCMBWAcdSRnYN9aEci2N/kx8zD/ditI7SRVIlwRo8sO2bgLDHcSBhrrbJd4?=
 =?us-ascii?Q?yYxBojjy2XwZbZpR1d4jMuZ6dpAyu6yvDG3lcwJo5NnOlJySJXI4crb0c1zO?=
 =?us-ascii?Q?o3Dc5KFgddecGS8akPpwI3th8R69eR384zkYVe+SXJDJH6MYZ58/Oka2iUnA?=
 =?us-ascii?Q?suVCDCQH2MzU6Crgal8D1x511/xmop21urPuflgVrPKCqcPfDDQlxUcdLUFM?=
 =?us-ascii?Q?ND6DJ844yKB3/rxZ1v/nxmQFyVX6aNRsxiDyKXAyf3sU/3XiiM0gHjrBhkba?=
 =?us-ascii?Q?Sjg0gbYr/23GU4g+FK0IQbIXQiQ88lT/YWjVAxcBUSZtWR5vu+vZQORA6oip?=
 =?us-ascii?Q?W+WXhHj0Za2ZgbqIhBdFn7V7spvZrrKay/Er3EllPJfN7qN/bHSLMmzgiprn?=
 =?us-ascii?Q?kPRfJVrNBz6xYNHws1ZATT88Tn3R/Vnu/4FEg9YQNB6rYswdcroLf8FdFEtL?=
 =?us-ascii?Q?rrz5yKVQgCIwkKBuVdQOyYrSBNlYPhRU9tJUaE048IA0qmZEJF23Vl8HDgJe?=
 =?us-ascii?Q?c0mvN2C9zAs/UUhY3QrCELmmjTl2Td0fYMCbF4MDbkXEuNQhgwXJQ/ahPkAN?=
 =?us-ascii?Q?0xybOgCluP07hRIt8RU8qZbThQflhQudaWPy02TIpCeboRwvZIyeXsozWxgd?=
 =?us-ascii?Q?US09FL84vuNBSHvFFnP0YNOe4+Rp2MjgkVNY03tfa+2cWAtkjTrjvA8Kkx2o?=
 =?us-ascii?Q?+OnqFH7+pA6C/qNg0jjrNGMCMJ2CMiqvmpxhZ9172PheoLjL1hJUQGIWln0n?=
 =?us-ascii?Q?AHHKCU+Uvbsu4A0TcoiqVL7wZn/NHUFmcH5aXy6i43SrOLjs85/PWT/o8Liy?=
 =?us-ascii?Q?5AYu8wzqRL1jTo3J/1ldVlGemAVbYs8eWmlRisQqremU911OS1DWHwcXnyaK?=
 =?us-ascii?Q?R1NSTHEWubfWYnWZ1IwQd2BVF729Hqvqr2QExmdKGLzWBqVq5NQMUFRW+67k?=
 =?us-ascii?Q?vMeyR/3gVYGrM+K5whU/NiC6HnlPJ8PFRLf68e3zL7EAhAQqyLlDvVC6DLMg?=
 =?us-ascii?Q?omc5lX4DzeIHCfds9g+A2EafJU3PqprhiNrUZzCr3RgtYNHZnIt5RX2Fx8+Z?=
 =?us-ascii?Q?4l87HO7nIUwqiVHZ23yaut2OYc1PGgsjAm0F9CmQilTnoyS6hJ1Cn6BPcFeW?=
 =?us-ascii?Q?QEOaw7uB/VZHsVJY1jcUFbwzoUKigqlT2H5e4X32P4aW6tEDf0k4wP328JpB?=
 =?us-ascii?Q?REvfsyQo4jmWfYxSzOKONLRea/vrlFzXoPOjARYc3uYO2Uu3iNSjMwC9MLfA?=
 =?us-ascii?Q?1ZFHnIvQZgqC143NEnHxURRbwgQYlQirDVH+UJQwmPIpUuOeEFcqHdJa54uN?=
 =?us-ascii?Q?eQYEbU1CwiqsSYu3f9qDGdmbkHJMdSqAFRPG2gwtCLdwCSb2wMNnUjmGOBLJ?=
 =?us-ascii?Q?pzIFxzwRwS/R8AT+jznGCz9ixjbBpLINFohGXrB9xzzzzZQisSt4vLlX6gXg?=
 =?us-ascii?Q?ERylJYKeK+Oj0/DEP5ypQ3GI78+8nd+wGV8GDxDEecBCors9xSLN0b6vfx6K?=
 =?us-ascii?Q?QwgQDSd4Ui+jetcB6N2koEvDDX88uu078bYV/ol9yFvOuIovsJLONlCRgeKL?=
 =?us-ascii?Q?Oj9AvibIJw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321b8c0d-bb79-48df-4ade-08dec63e041c
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:44:40.6820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLA/SBxQBSv/7raPc2WsAplblU+BJ3yQgtE1GFSBwaUEEH9kxS2ArQebPO7o971vwsAd3h41iGt7+mmTSHAzzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7785
X-purgate-ID: tlsNG-42698a/1781019884-1A573F3B-BE93899A/0/0
X-purgate-type: clean
X-purgate-size: 5430
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:klampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: E6B4F661EC3

From: Ross Lagerwall <ross.lagerwall@citrix.com>

The newly named bzimage_header is moved to a header file because part of
it will be needed for Secure Boot kexec.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <klampis@citrix.com>

---
 xen/arch/x86/bzimage.c             | 47 +++---------------------------
 xen/arch/x86/include/asm/bzimage.h | 39 +++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index 66f648f311..0bbd8b2758 100644
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
+    struct bzimage_header *hdr = (struct bzimage_header *)image_start;
     int err;
     unsigned long headroom;
 
@@ -106,7 +67,7 @@ unsigned long __init bzimage_headroom(void *image_start,
 int __init bzimage_parse(void *image_base, void **image_start,
                          unsigned long *image_len)
 {
-    struct setup_header *hdr = (struct setup_header *)(*image_start);
+    struct bzimage_header *hdr = (struct bzimage_header *)(*image_start);
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


