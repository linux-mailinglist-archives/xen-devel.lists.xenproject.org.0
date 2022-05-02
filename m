Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FEF516B23
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 09:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318663.538536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlQBs-0002ZS-RZ; Mon, 02 May 2022 07:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318663.538536; Mon, 02 May 2022 07:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlQBs-0002WH-Nk; Mon, 02 May 2022 07:09:52 +0000
Received: by outflank-mailman (input) for mailman id 318663;
 Mon, 02 May 2022 07:09:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlQBq-0002WA-Q4
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 07:09:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daa3534f-c9e6-11ec-a405-831a346695d4;
 Mon, 02 May 2022 09:09:49 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-IJx1AU5KOUiMJo18yWDyUg-2; Mon, 02 May 2022 09:09:47 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB7990.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 2 May
 2022 07:09:45 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 07:09:45 +0000
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
X-Inumbo-ID: daa3534f-c9e6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651475388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n2fo7Dzsa3Ft/jtdOiWLptZXqbyNFQKnC9Q6PYIyfEo=;
	b=efxhoNE35TaCIkgrsXgCITlDw1LEnE4eFvSZa5IB+u2a9LhSceQbm66hQ8X8sopTPy2f38
	TDWapzH/LZ9m9io6Upyg+GVAaH+XMSToxx4YeQoQ9RB5UGEbcYIhCVCfIvlIhAzuIcb7/O
	IRPGXNFrdvjgTopZzcgbsopFsIiFmxs=
X-MC-Unique: IJx1AU5KOUiMJo18yWDyUg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmZzk6dxn+vlkfrOnUyyUQXW12uQp+7gOtfpGDUphZUfTiRE/prOrO4VG+w7Wj1wG7jMQUpQXatb4zhVYVi/vcC5qaNdxEZcniERdhtyRzERf+HrVOL/IpJqkOsL1XMmEIA1JWVoQkX5JfphPvW4D6ZZkfxG58QdXx68qEv0x7bxWwNLHeAfgDXIYT90Hj6KeWvTQWFEo1SNavaDN9UBkXP5WiQ8Cs5LaEagDg/IQ/sjGSYwGl6W4aW8DXbsIBGhGdZwJcROoL5VvB+ha/l0GsZg1L4yWWXLPG1cPYRFnd4+3sHOboQOur0Vt+L+lfLgAdyCFymuTmqsPpKyzaHVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2fo7Dzsa3Ft/jtdOiWLptZXqbyNFQKnC9Q6PYIyfEo=;
 b=fAveWQ8BdseVVpOJr9BLK2SjSBgFts1C2weBCbYVLOzBg42Hxdg1KMBxz86zlJThK4VHny2Kf24UuPHhaZUr/eXgwzxqXxRx9KrPu9pciYCFGHo9xxGMKF+CwAasAIzAo+kX/us9xesarexb5lTJ2C7fuxg+tD4Y9MbQhfk81H3IwCnVL065L/LVkdcjf/l5tN2zcWD/IXcqSls7cSpzvIcihpFjiqpF5VMBHIEraLi16pKYY14NB29Ql1UBmF9pmgB3wSkK5lYkgms7V6dK5TDjyodri4IuJroVgkzu16VTs1aBpf1YqY2FcqB5lVTAdpSgn9x2Y4+J5Ea7RyjkgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <994cfe5b-21b8-c59d-8160-792975304604@suse.com>
Date: Mon, 2 May 2022 09:09:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0276.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::34) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cd9b6c6-e2c0-4d65-7fe0-08da2c0abcda
X-MS-TrafficTypeDiagnostic: AS8PR04MB7990:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB79908E89B2BBA9AAF3679EE4B3C19@AS8PR04MB7990.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EnktQy76kVH3yVQYacjF+t0AI8Fo5otsq+h1EkYC46JluFT9aV+HoRiOk7ReALQURIN+ciFDahzMCEqpZ/0qlVWxTnSjUHwizwC5T0YKM11+cmkcOF8tpjdcWfqHbJHF8lWLoFDgOppwiGP1uRabJfIS6LJYod1T+HIp9unQMQreMoVMhZeM2RaT22H4TXo3gEhXey1UMLCevAFVM8jqT6ZDf2/cAZnaTKGrgFw5Yfvhb2bRrpnrVzHnUjwelPy72zPUj+xJ2LDE25XL4hvI0s4JWk3HVMaqMw7aKqkU9wKFL7t+frC8exrfBnqFyp4DlU/FtWBdhjQZOxFMtPXBE16D1hQ8B5KYp6dZdpEvVidk4Shuq55aR9qCbMtKFlljqkZkilxDJhSyw/CXerZ1b2uaT8Tfgw5CrZw1vtF02Q8TiptSv+jDuytYIBNixoANAaFCMnEBnOg+P7AaQR46fsfQ0L1LugOArkZT03wylHSHpUrSpK8FsxkY4bpUB2xSgTpzpCbALEugmCLJYo+kNigaiT5CemjugxuQe3A9npaWULgUF0Q0BVpnbCNgoKQeUNwmB4xpeSSa3WqhHgGgks5yDws2pmMPLp/nhlcvGGLFJRW5Zl7iiG8E7Qt7DY+4I2wc4OihnAg0oHwS4+Ed1EsIrNu/MH1YRZtVX+MNiEUpQF8vhTf7UPOkp5Azlvz45kdCxkGn4WRgQqOEj4MT55Q3ZzIpqXOihvEZBToZI2Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(38100700002)(6486002)(508600001)(6916009)(316002)(2616005)(54906003)(31686004)(2906002)(83380400001)(36756003)(8936002)(6506007)(26005)(66476007)(66946007)(6512007)(8676002)(186003)(4326008)(5660300002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUwxSisvR0VSYnhhOEFmR2ttWUlQUFBUTkdXZzhvSXI5MUtISTdRcjhvY1JR?=
 =?utf-8?B?Z0VwWmwzckxnZmdndW4zbFhXTU5wUXkwa3RaTEkzVHM2ZTNzUmVzQitpK3J0?=
 =?utf-8?B?UUNPUnAwVVFzWE80dDA0YXFsZlYxLzNYbHBnQkJVVWw1QjVrWG9SQjFuekg5?=
 =?utf-8?B?emprcWdFN1o2NWg4ejN0dVByV1p2cU9jTVVoLy9EMHo4djJjQzZlSnd4WmZ1?=
 =?utf-8?B?a3l5Mm1taTJleFdwcUdYczcvQk50QWlqZElKOTh4WFZQKzBrdFpzYkl3dFo2?=
 =?utf-8?B?dVpQUWE3bHNaNXhaelQ0Sk1aS2lXSVFROU5QNjM0ekFtd2w4YlNhOThTcWwr?=
 =?utf-8?B?QjVjellOZFlIeVJ1TDkvUUxJV015NWozazlIUUxCVnRlTWkzOFRVQVd0TVVG?=
 =?utf-8?B?eTRYNnhUOU1ZaXRhbEVYSnZqc1ZiVVRMUlc2amRWTEhEWmhLZjBRTjZ6UVVC?=
 =?utf-8?B?WE1nOHFNNUgxTWd3eEtmVjhqMnNHbzhzUlVxeWJEQTFmcEVvZW9tanMrMmtJ?=
 =?utf-8?B?ZFBwTW81UzJKcjV6Mmd1VFZ6RWNSeUdLbHhKRnIzNzBVTTFrazlKb0ZBOERC?=
 =?utf-8?B?OUtxVWxnZU5PdmR4enRsUXBJMEhwMjVUMjRKdWh0b1FWbHdMVklKWVBNdnlK?=
 =?utf-8?B?cnlvc1BGb3VmazBhcGNGbGlWa2JFUTFmd1VKdllIc1FYYzNVaE16VDZhNnEw?=
 =?utf-8?B?YlhnRGs5eUR3VHo1ZDV2Vk9BY2o1R2JKTjRSNWRldW1wZFlPZU9rSUJBdWhx?=
 =?utf-8?B?Sk9yc1hGOVJBendsVXVHRnNLTS9xbk1DL3QvdkhpK1hEOFFnbjREay9EZ2lm?=
 =?utf-8?B?YUNiKzF6VDZMZGJ1bkJ3ektyWWJkVzdsNHVzdW9EWE13Zlh0cUlLMks5S0Q5?=
 =?utf-8?B?U0o4aVVRSStRMnBxUXJ0UklZcUF4a2p0cTFFSW16Uk1BbjZTWWRadG1jUnBu?=
 =?utf-8?B?N3RZWHZ5bzdGcGdpQ0s1TWxLRllEVUlNWEloNXdXUHMrOWc3bVdOSG5LRkpB?=
 =?utf-8?B?WTNhRm1Sanh1ZER0NWxSTU9iQXg2UDJmVDA2aVExYUxaQkpPZ0J1RWVtSkRt?=
 =?utf-8?B?dkUvNkFYL2dHdnZEQnU1YWozaDBlOUlHbjgvVW5xYmhVR2tmdXV1ZGxLdEl1?=
 =?utf-8?B?NmtsRlZOWWo3d05vWU1SMldkWFdBZjBrOXEzdmdvNUdPQTBoUFUzSTQ2U2pB?=
 =?utf-8?B?SkpJVjl4NTZ4bWpMWkswUmtlZVZsdGc0T1BJdlRNYS9STmVtZlhNVk43eUFN?=
 =?utf-8?B?ZlVFamcrcGlsYVQ3YWVBQldhOTgwSHNrTDVUUy9MSk8zdGFDN01xMjV3cTEy?=
 =?utf-8?B?SnlpM0drL3JNYmRUVldzQjQwaVhFWkkzalBZOUtnZk9uWDhrR0lhZUF0UXRu?=
 =?utf-8?B?djhrQXZ1ZzRnZzFpSktadTc2OS9zeTA1QlFIWFpYakZvQWpKZ1NSUEFOODBs?=
 =?utf-8?B?Q2FHOWx0QlVtendZNFJjUjUxVUNBbFlpUHpoemZhaCsxN1JBQTdwb3IwNmor?=
 =?utf-8?B?LzkrT1llVHQxWnl4M01FUG1weUgzK1UvSlFHM2tSY3dVKzF5VzBtYTR5RU5h?=
 =?utf-8?B?S0U0OTY2Y3FmYzBSR1ZacnUyYWRTM3dLUDIwbnF5YnlheXlGblQzUmtXbUlM?=
 =?utf-8?B?WW1kOTFJOHY4RUVHZW1qdE10Q1hpZHIzM0RYalB5NEJNcEtMUTNkNjREQXZ5?=
 =?utf-8?B?K28wVkhMS21rVTdxNjFGT2ZsZlhkdXF1eXJlZzBqY09qbUlwN2s2NkhlRXdT?=
 =?utf-8?B?bmIwN0YzMGFOWE51T2FOcnpPNU9wR25aM3dVTzZrNEloY1VsVERCQlcrc1h4?=
 =?utf-8?B?VU9FblNUOTMrYUJQWjI3Uzk0VWo2NmdqMFVpd2I4WU9SY2VrMVY0Tnd2SGtt?=
 =?utf-8?B?TG1SaEY0RU9odFRjYnVoYkFYNklhRkZsb2E1WVBYcGJ3eXMraFJRTDhJMUFy?=
 =?utf-8?B?blFLK1l2UEpXblp0NUw5R2NSOXc5bkZoMWJjTXU5MTV6OGtGSzVsVTJtRTV5?=
 =?utf-8?B?Rnlic1Z5cTRPSFBkdWM5U3RMMy9EeUxzd1p0czZuelZtemR5Wnh4cUpOYUYz?=
 =?utf-8?B?U2hMbHN0OWNKTjNQSFpkTUNPU2hOQkNOWWYwMnhTdEJJcjNTRVN2ZUNPU2J2?=
 =?utf-8?B?WEZ4V2plZlcybHB0UFdaWTBwLzVBQjFUTEV6bWVkTGpwdlBQWmRNK1lVT1RL?=
 =?utf-8?B?NVY4UzZ4MDg4UUV4L3djRndRRWZWVzdhY3FVdmZIOVg5TXlEbWRYSlhHZXBm?=
 =?utf-8?B?UXRqenpBN3dqWklwOVNkcGlaSjNrTDg3RmYzQjljVnpMZTJPaVArM0k5bXpL?=
 =?utf-8?B?VFpUaDZ2S2g3RjBCNHZzRmJQV2k3bWVuQmJJcHcxcVpqZUpXY0tHUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd9b6c6-e2c0-4d65-7fe0-08da2c0abcda
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 07:09:45.7171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcXfTR+LWzCE1gDUsNOxjIJaMbhtWA4isZBf823QLzoVIIECzVCPeSH8yB+OIywhTYwx2KDoCRKEwnH3KVCQYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7990

Support for this construct was added in 2.22 only. Avoid the need to
introduce logic to probe for linker script capabilities by (ab)using the
probe for a command line option having appeared at about the same time.

Note that this remains x86-specific because Arm is unaffected, by
requiring GNU ld 2.24 or newer.

Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Rebase over "kconfig: detect LD implementation".
v2: Always define HAVE_LD_SORT_BY_INIT_PRIORITY when using LLVM ld.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -73,6 +73,16 @@ ifeq ($(CONFIG_UBSAN),y)
 $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
 endif
 
+ifeq ($(CONFIG_LD_IS_GNU),y)
+# While not much better than going by raw GNU ld version, utilize that the
+# feature we're after has appeared in the same release as the
+# --print-output-format command line option.
+AFLAGS-$(call ld-option,--print-output-format) += -DHAVE_LD_SORT_BY_INIT_PRIORITY
+else
+# Assume all versions of LLD support this.
+AFLAGS += -DHAVE_LD_SORT_BY_INIT_PRIORITY
+endif
+
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 
 efi-check := arch/x86/efi/check
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -36,6 +36,10 @@ ENTRY(start_pa)
 # define SECTION_ALIGN PAGE_SIZE
 #endif
 
+#ifndef HAVE_LD_SORT_BY_INIT_PRIORITY
+# define SORT_BY_INIT_PRIORITY SORT
+#endif
+
 OUTPUT_FORMAT(FORMAT, FORMAT, FORMAT)
 
 OUTPUT_ARCH(i386:x86-64)


