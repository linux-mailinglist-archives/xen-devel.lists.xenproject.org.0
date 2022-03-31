Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDA14ED733
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296841.505420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrMc-0004kA-T8; Thu, 31 Mar 2022 09:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296841.505420; Thu, 31 Mar 2022 09:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrMc-0004hG-PY; Thu, 31 Mar 2022 09:45:10 +0000
Received: by outflank-mailman (input) for mailman id 296841;
 Thu, 31 Mar 2022 09:45:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZrMb-00045p-C0
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:45:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ffe2257-b0d7-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 11:45:08 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-cc--GB0mPdO8edoJe2G7cQ-1; Thu, 31 Mar 2022 11:45:05 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4872.eurprd04.prod.outlook.com (2603:10a6:20b:e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 09:45:04 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:45:04 +0000
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
X-Inumbo-ID: 3ffe2257-b0d7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648719907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETCbNIJzLPkDjltdqaHsnx3bgSxxGyhUZegn+m7VW7s=;
	b=DEV74t5ThA16n7UEV02wmHM2xTfvePy+n8i2QcmlxYU2ZR96urpIz1ZVdYBC/+FIxJiRxo
	8MFcFLpBSZOQQvCFNNW4svsc2i3Y9XT5uWKkxfs7Sl7XkoyOQYBcTnQOjoRyYieatGsJQQ
	k9KLWh2/CWQwER3atDkYC6Qyd3WzluA=
X-MC-Unique: cc--GB0mPdO8edoJe2G7cQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPSNShYPeNTBM70sgV242KuliwJZXFzDgjmCeTFOjdMkqCkJ+bVNqdlKP4NI4kc4IocJqFIyxo5CxRlrHS4AMy60KNm6MVXNdtYESf4Z/szAn1Rgw2Ip+ZoOIRoAF5H8WNrS+7XxQ9MR0f6WR8fqG0F1LellpsGm/q1zFDJaWdr9Mn9ZNin+efyvxmFBOGEpBjQZOyOEe70gNWpHfOYi4WEWRv8A3zYZQDkfQncozun/0fuxJen0pEj9kjAaYxaFzcpdns+VJk0yxQsLBjxKEEFyuf4IyqUqIdF13noSowbZnUKdF/I1Kqd2z05FlFjjXvW/HUz5S9EColab0FgGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETCbNIJzLPkDjltdqaHsnx3bgSxxGyhUZegn+m7VW7s=;
 b=VQ2rId46MUo9qVGStwlcbx+W3VFT8i4oFkP3+dRbZkSVkd8xrenD4XLtYwcTHiSrpSUgMRRYdJFqEt4BOJzsDygPIWb+AgHnyt57Vt/nFW57XGeI6Oxk6jVdPYHHhwuZ24ppQOQFN8PcAjGlPvUQbLMFOUPcUzkOMqjKfdxaRaXLTOlv86n0HE9F+BtDzK3mf77EbBHOqoi4PEuFPcaiXEkf7/Y1nPFjiTxjGyAUk6y2mhn/JvygE5BpshqOYQ4/DeVQm67rD1O0GB94HIb/S9c5oLDCvgvTTzyxkYYqIukSffbQ+Kg/Ntyue6bah0QQ/WSzgHBLavszimdRa/sRcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6fc25224-7985-73a6-8877-bc209f64bf8c@suse.com>
Date: Thu, 31 Mar 2022 11:45:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 2/8] x86/boot: obtain video info from boot loader
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
In-Reply-To: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0035.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18c6fe6d-3178-46bf-5432-08da12fb21b7
X-MS-TrafficTypeDiagnostic: AM6PR04MB4872:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4872A66F459DE6EF68EC7AFBB3E19@AM6PR04MB4872.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TP9uEOny0fAKHiNy/8F7hDU+H4IiZnus0ENZsFB9lPMap+HC/3RTiNM4xhLuyaiHxMJXBqNchChhn/SpGDFTBJzHie9n5umJXjK1qFR1wftJ5bg/Bj4CwaC0kjSv1bx6qQ+4RcMUT/Eogrz5V3StVVn0LHhgBtv94rR+XWd6rcEWR+X85K7I/HG5fRgBfK0yey4gq6xLTSwaSOXF7tPfpqigdDH5Py/9Tco/06OqUblR8ytjOknvaKnLBNXP3JmQGGTs2hZNn/Rf+jSTEHskW1tWGBSouwuvd1EPTzlGJtT7hlF/iIbqkZELvcIdRnDd46VsSa2HWWz7FHeXO3vJN+iml8RlIaD3NhyQijjmBqyinA1y2aTy08zpet7tTwL3Z8nf2472tG7urFsbw/TgeLLFkuBEJO8H0wVNmOTgHAl6VbzViFakdCAcpMKjcU+NQQdH6PABQoS9j5/50cumxEfo3HYI2HFFCy6AbsZ8r7bfeGeGeoLnxnWxEtY1joWi+YmhGW0bl7hNu7Cspf1g1CVR8cnNpT84mHC2+SM5uQBiqBcNmaJXREvYVB7dVKOnOgkfZ3tBv+vxA9Jn6Yqr80bXGKduHuZwTlIVWbBz3/ied1y66k3jiab3Rv8b5585HwNEih7cj+XOelePq/Tf4oSqVRf8DaQCsri2GQaFUWzFAOPTgLyJAXP3gYuxa/+dzBWsaCACZGwLyEaJh8GsfTeMN44NeQ9XzQ08kzzox9KYB5vIagk/YXcT5/RWw9nJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(86362001)(8936002)(6506007)(31696002)(54906003)(8676002)(66946007)(4326008)(66556008)(6916009)(316002)(508600001)(6486002)(66476007)(38100700002)(5660300002)(26005)(186003)(36756003)(31686004)(2616005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW1MUGRSMlZVTnlkYTNGNVd1Mkdza0MyNnMxREhwTStlUGNreWRBYVk3NTVU?=
 =?utf-8?B?ZlpROFNNU2RLOXFadUlEQU5sNDJWTzdjY2ZueStoOC9jSDFIbnNtMzdNRm9v?=
 =?utf-8?B?V2NGM0E3ZkpFbTRMdXJGR0tkUWp4SEx3MXUvYlJaVlRMaXFGMG03amkxdWh4?=
 =?utf-8?B?eWQyRXUreDZROGhTV1k4dmN4aHRwVmVrNlpoMjN3eGxaaE5vWk1XYzJ0dmxP?=
 =?utf-8?B?d3haUmxDNlNQdUFJTzhzTlhoL3ptOXhqU2VQVm1NREVLYmdMY2d0WUhrNVNQ?=
 =?utf-8?B?WFVERjJ0RUs3ZFdJSTR5ckJSZnpxUHRqekgrV3pKTFFHSHRkMnJQQWNSYWJj?=
 =?utf-8?B?ZGRLWEo3Y1VZdUJXM0hPNFJPaEFBZGdTOEJzcFdaeW5lbHl3TDA4NmNaSVdX?=
 =?utf-8?B?TW5OSHlzU2dlcXJkM3kweVlqTDhldmpKd3UzVFkweXF6czBKdmhQcE1tdjRC?=
 =?utf-8?B?YXJFOVU1UU9iemF0b0dOZUVJNlZaNS9uamRqWUNEOVFhU1ZwZHJjSlkwd05N?=
 =?utf-8?B?V3ZhTmZTVmNiWnVQTllGMC9QWlZaVDdqYUZkbk00VXBvOUh4UnI3eHlUSWZu?=
 =?utf-8?B?RnhKRXhaMTNtaitlc1hWbGk4TGh5UjE4L0RtVk1icGh5RE4rditxblFtdWU3?=
 =?utf-8?B?K0JnRW9aS05sNzVwVlJudWl3Y0RabysvaHpPZWZnV09xblJXZEx3NUpMaG1w?=
 =?utf-8?B?bXZBTlpNd3cxK0dFU2tjaEREays2dXMwZ3B1V0QzWXFLYmF6Smo3S2NFcFY0?=
 =?utf-8?B?WEQ4djB1L0ZPN1NRUjEzbFo0NlZ2Y1RFcTZmSDhmNHBndU5iZGVSTkVKTkE5?=
 =?utf-8?B?NUVzekcreW4xMmpFQ1FPRHM2V2cvV1ZqckVyZEFObTJrdzNqdFRNMzNOYVVo?=
 =?utf-8?B?UW1ZcTNSSlhWVnUvLzAzb3NRQk5FWkhaVkNsVXVhc3g1ZVRhNXZNWnlJTVhr?=
 =?utf-8?B?TTM1WkxJdGh5Z0pqenNCOW1IZ3hQUFJGSTc1YldpQy8yTm4rYVEvamNKSnR2?=
 =?utf-8?B?ckdXQlVUaXdoZlhwczd2ajJHY3d2cXlHaDZCeDJsYTBkTGpoQ2RtNloyMVdH?=
 =?utf-8?B?MFBNdFkzRThjdlkxWGkvcThmWnhXNXVvbUdIZlBLOTg4bDMxb3l4UitkSjEw?=
 =?utf-8?B?Z2JWYXhlbUxtNTd4VWJ0UG00V044VHlEcWlQMVo1UXMwcmFWZTRUaWRXcnR0?=
 =?utf-8?B?dk9NS3dpY0k5eUFlTWJUQUJwbml3bEgyb2o4MFFKc1oreGxGbnlVb2NibDJD?=
 =?utf-8?B?VGxxTHhYWTlmaFVJdUY4bkxtYnh4RGlyWlpuN0VvUWVVc2RpSWVUT29XRWZP?=
 =?utf-8?B?UTJtMFRod0R1aktNTmRkRWFmYTBaQmpBU2lRT1lyajJrTnFNajVoaEFjeVU2?=
 =?utf-8?B?SXIyY0s1RXQ3eUhueW55L3VzTERuSDVXck5vRlJwOGI1dk1JVVNLZnFyN1lv?=
 =?utf-8?B?Z01oTWFFYUdobU53YXBXTXZLTHZZa2JXY1ZnNTNwTmFscElyVHVhemNva2NY?=
 =?utf-8?B?UlZNZHU0MHFQTG9BekdsNkd4Q0xBbFF3Q01zTmRMM2x6TEhvRXZkV2xZYUt6?=
 =?utf-8?B?Tkh1bTh0a0lta2hPTnc5YnV5KzBnQ2pzU0xhM2Z6ZXkzMWpkRTdwakZaNHJn?=
 =?utf-8?B?NUw1eTRSelc4bm0yQ1FqRklyYTFxa3JIOGxBa1BQWWhYa2pWclZFM3FaUmpX?=
 =?utf-8?B?T295YUREelc2UDA4bVJ1S1E3ZlBFbDBENE9COXRYRmdPZXJZNm5SR2dRaFds?=
 =?utf-8?B?aURHZUFDRWZwU01hcnE0aFFoNlg4SEdNRktmK2xQdnZvWklORmdUam1nZmN4?=
 =?utf-8?B?TzhoZHFuNWhHT0loVVBGRVdnMWJyYUN0c0FGMFVHQ3cxaDFTSm5PN1dyQzVi?=
 =?utf-8?B?WGp5RENVaGc1cjNGRnlYZ1czMHFHTjFlMUJ0RmgxSVBLRzhOTVAwVDNoOGNp?=
 =?utf-8?B?K0VFcE9sdkJ3UmY4ZFB0NHp0ZFVBZDVEMmtKb2F2OTRjNHUxc25NSUlLWVky?=
 =?utf-8?B?dUJSMlZSR0JHV3ZlaGpvM1N1cEJQUE0rL3YyRVdjMjN0WEcrRE4zRTkrUEJl?=
 =?utf-8?B?T2ZtUXpFc2ZabEhFV0FaSnFub1NiZHNvMVNUQXdiN2QrbjJtSllMY2VMWWc1?=
 =?utf-8?B?aUk4eFFjaUNMdUgwcm9PWC9OMHRibGVtdm53VnhtTUlnM2hYeXVMTW9XYldM?=
 =?utf-8?B?SC9MMmFGMGpsL1hVNFQvbkJsMmgvWDd3OGVFY3J1Nm9kMVhKZ0ZtUHkvYUhz?=
 =?utf-8?B?S2NFK2tFNmczNzNmaW1GWmFYdkdGWURuNnZ1U0FwQXpndVlLR3RsajIwZmdP?=
 =?utf-8?B?eERFMS8vK1FFSkVrTzA5aUVvVXQzTkthSlZNR3IzdE9OdXJsOHlPQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c6fe6d-3178-46bf-5432-08da12fb21b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:45:04.0757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPM9OuvAHC+/LoM1pmWItF+hZbocw1jr35vHw2/dJL1/vLjouZbz0i9jzltGskog/P5I+wvDtNwCcM93XqVPZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4872

With MB2 the boot loader may provide this information, allowing us to
obtain it without needing to enter real mode (assuming we don't need to
set a new mode from "vga=", but can instead inherit the one the
bootloader may have established).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Re-base.
v3: Re-base.
v2: New.

--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -53,6 +53,7 @@ typedef unsigned int u32;
 typedef unsigned long long u64;
 typedef unsigned int size_t;
 typedef u8 uint8_t;
+typedef u16 uint16_t;
 typedef u32 uint32_t;
 typedef u64 uint64_t;
 
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -562,12 +562,18 @@ trampoline_setup:
         mov     %esi, sym_esi(xen_phys_start)
         mov     %esi, sym_esi(trampoline_xen_phys_start)
 
-        mov     sym_esi(trampoline_phys), %ecx
-
         /* Get bottom-most low-memory stack address. */
+        mov     sym_esi(trampoline_phys), %ecx
         add     $TRAMPOLINE_SPACE,%ecx
 
+#ifdef CONFIG_VIDEO
+        lea     sym_esi(boot_vid_info), %edx
+#else
+        xor     %edx, %edx
+#endif
+
         /* Save Multiboot / PVH info struct (after relocation) for later use. */
+        push    %edx                /* Boot video info to be filled from MB2. */
         push    %ecx                /* Bottom-most low-memory stack address. */
         push    %ebx                /* Multiboot / PVH information address. */
         push    %eax                /* Magic number. */
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -14,9 +14,10 @@
 
 /*
  * This entry point is entered from xen/arch/x86/boot/head.S with:
- *   - 0x4(%esp) = MAGIC,
- *   - 0x8(%esp) = INFORMATION_ADDRESS,
- *   - 0xc(%esp) = TOPMOST_LOW_MEMORY_STACK_ADDRESS.
+ *   - 0x04(%esp) = MAGIC,
+ *   - 0x08(%esp) = INFORMATION_ADDRESS,
+ *   - 0x0c(%esp) = TOPMOST_LOW_MEMORY_STACK_ADDRESS.
+ *   - 0x10(%esp) = BOOT_VIDEO_INFO_ADDRESS.
  */
 asm (
     "    .text                         \n"
@@ -32,6 +33,39 @@ asm (
 #include "../../../include/xen/kconfig.h"
 #include <public/arch-x86/hvm/start_info.h>
 
+#ifdef CONFIG_VIDEO
+# include "video.h"
+
+/* VESA control information */
+struct __packed vesa_ctrl_info {
+    uint8_t signature[4];
+    uint16_t version;
+    uint32_t oem_name;
+    uint32_t capabilities;
+    uint32_t mode_list;
+    uint16_t mem_size;
+    /* We don't use any further fields. */
+};
+
+/* VESA 2.0 mode information */
+struct vesa_mode_info {
+    uint16_t attrib;
+    uint8_t window[14]; /* We don't use the individual fields. */
+    uint16_t bytes_per_line;
+    uint16_t width;
+    uint16_t height;
+    uint8_t cell_width;
+    uint8_t cell_height;
+    uint8_t nr_planes;
+    uint8_t depth;
+    uint8_t memory[5]; /* We don't use the individual fields. */
+    struct boot_video_colors colors;
+    uint8_t direct_color;
+    uint32_t base;
+    /* We don't use any further fields. */
+};
+#endif /* CONFIG_VIDEO */
+
 #define get_mb2_data(tag, type, member)   (((multiboot2_tag_##type##_t *)(tag))->member)
 #define get_mb2_string(tag, type, member) ((u32)get_mb2_data(tag, type, member))
 
@@ -146,7 +180,7 @@ static multiboot_info_t *mbi_reloc(u32 m
     return mbi_out;
 }
 
-static multiboot_info_t *mbi2_reloc(u32 mbi_in)
+static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
 {
     const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
     const multiboot2_memory_map_t *mmap_src;
@@ -154,6 +188,9 @@ static multiboot_info_t *mbi2_reloc(u32
     module_t *mbi_out_mods = NULL;
     memory_map_t *mmap_dst;
     multiboot_info_t *mbi_out;
+#ifdef CONFIG_VIDEO
+    struct boot_video_info *video = NULL;
+#endif
     u32 ptr;
     unsigned int i, mod_idx = 0;
 
@@ -254,17 +291,64 @@ static multiboot_info_t *mbi2_reloc(u32
             ++mod_idx;
             break;
 
+#ifdef CONFIG_VIDEO
+        case MULTIBOOT2_TAG_TYPE_VBE:
+            if ( video_out )
+            {
+                const struct vesa_ctrl_info *ci;
+                const struct vesa_mode_info *mi;
+
+                video = _p(video_out);
+                ci = (void *)get_mb2_data(tag, vbe, vbe_control_info);
+                mi = (void *)get_mb2_data(tag, vbe, vbe_mode_info);
+
+                if ( ci->version >= 0x0200 && (mi->attrib & 0x9b) == 0x9b )
+                {
+                    video->capabilities = ci->capabilities;
+                    video->lfb_linelength = mi->bytes_per_line;
+                    video->lfb_width = mi->width;
+                    video->lfb_height = mi->height;
+                    video->lfb_depth = mi->depth;
+                    video->lfb_base = mi->base;
+                    video->lfb_size = ci->mem_size;
+                    video->colors = mi->colors;
+                    video->vesa_attrib = mi->attrib;
+                }
+
+                video->vesapm.seg = get_mb2_data(tag, vbe, vbe_interface_seg);
+                video->vesapm.off = get_mb2_data(tag, vbe, vbe_interface_off);
+            }
+            break;
+
+        case MULTIBOOT2_TAG_TYPE_FRAMEBUFFER:
+            if ( (get_mb2_data(tag, framebuffer, framebuffer_type) !=
+                  MULTIBOOT2_FRAMEBUFFER_TYPE_RGB) )
+            {
+                video_out = 0;
+                video = NULL;
+            }
+            break;
+#endif /* CONFIG_VIDEO */
+
         case MULTIBOOT2_TAG_TYPE_END:
-            return mbi_out;
+            goto end; /* Cannot "break;" here. */
 
         default:
             break;
         }
 
+ end:
+
+#ifdef CONFIG_VIDEO
+    if ( video )
+        video->orig_video_isVGA = 0x23;
+#endif
+
     return mbi_out;
 }
 
-void * __stdcall reloc(u32 magic, u32 in, u32 trampoline)
+void *__stdcall reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
+                      uint32_t video_info)
 {
     alloc = trampoline;
 
@@ -274,7 +358,7 @@ void * __stdcall reloc(u32 magic, u32 in
         return mbi_reloc(in);
 
     case MULTIBOOT2_BOOTLOADER_MAGIC:
-        return mbi2_reloc(in);
+        return mbi2_reloc(in, video_info);
 
     case XEN_HVM_START_MAGIC_VALUE:
         if ( IS_ENABLED(CONFIG_PVH_GUEST) )
--- a/xen/arch/x86/boot/video.h
+++ b/xen/arch/x86/boot/video.h
@@ -28,4 +28,45 @@
 /* The "recalculate timings" flag */
 #define VIDEO_RECALC        0x8000
 
+#ifndef __ASSEMBLY__
+struct boot_video_info {
+    uint8_t  orig_x;             /* 0x00 */
+    uint8_t  orig_y;             /* 0x01 */
+    uint8_t  orig_video_mode;    /* 0x02 */
+    uint8_t  orig_video_cols;    /* 0x03 */
+    uint8_t  orig_video_lines;   /* 0x04 */
+    uint8_t  orig_video_isVGA;   /* 0x05 */
+    uint16_t orig_video_points;  /* 0x06 */
+
+    /* VESA graphic mode -- linear frame buffer */
+    uint32_t capabilities;       /* 0x08 */
+    uint16_t lfb_linelength;     /* 0x0c */
+    uint16_t lfb_width;          /* 0x0e */
+    uint16_t lfb_height;         /* 0x10 */
+    uint16_t lfb_depth;          /* 0x12 */
+    uint32_t lfb_base;           /* 0x14 */
+    uint32_t lfb_size;           /* 0x18 */
+    union {
+        struct {
+            uint8_t  red_size;   /* 0x1c */
+            uint8_t  red_pos;    /* 0x1d */
+            uint8_t  green_size; /* 0x1e */
+            uint8_t  green_pos;  /* 0x1f */
+            uint8_t  blue_size;  /* 0x20 */
+            uint8_t  blue_pos;   /* 0x21 */
+            uint8_t  rsvd_size;  /* 0x22 */
+            uint8_t  rsvd_pos;   /* 0x23 */
+        };
+        struct boot_video_colors {
+            uint8_t  rgbr[8];
+        } colors;
+    };
+    struct {
+        uint16_t seg;            /* 0x24 */
+        uint16_t off;            /* 0x26 */
+    } vesapm;
+    uint16_t vesa_attrib;        /* 0x28 */
+};
+#endif /* __ASSEMBLY__ */
+
 #endif /* __BOOT_VIDEO_H__ */
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -532,35 +532,7 @@ static void __init setup_max_pdx(unsigne
 static struct e820map __initdata boot_e820;
 
 #ifdef CONFIG_VIDEO
-struct boot_video_info {
-    u8  orig_x;             /* 0x00 */
-    u8  orig_y;             /* 0x01 */
-    u8  orig_video_mode;    /* 0x02 */
-    u8  orig_video_cols;    /* 0x03 */
-    u8  orig_video_lines;   /* 0x04 */
-    u8  orig_video_isVGA;   /* 0x05 */
-    u16 orig_video_points;  /* 0x06 */
-
-    /* VESA graphic mode -- linear frame buffer */
-    u32 capabilities;       /* 0x08 */
-    u16 lfb_linelength;     /* 0x0c */
-    u16 lfb_width;          /* 0x0e */
-    u16 lfb_height;         /* 0x10 */
-    u16 lfb_depth;          /* 0x12 */
-    u32 lfb_base;           /* 0x14 */
-    u32 lfb_size;           /* 0x18 */
-    u8  red_size;           /* 0x1c */
-    u8  red_pos;            /* 0x1d */
-    u8  green_size;         /* 0x1e */
-    u8  green_pos;          /* 0x1f */
-    u8  blue_size;          /* 0x20 */
-    u8  blue_pos;           /* 0x21 */
-    u8  rsvd_size;          /* 0x22 */
-    u8  rsvd_pos;           /* 0x23 */
-    u16 vesapm_seg;         /* 0x24 */
-    u16 vesapm_off;         /* 0x26 */
-    u16 vesa_attrib;        /* 0x28 */
-};
+# include "boot/video.h"
 extern struct boot_video_info boot_vid_info;
 #endif
 
--- a/xen/include/xen/multiboot2.h
+++ b/xen/include/xen/multiboot2.h
@@ -158,6 +158,59 @@ typedef struct {
     multiboot2_memory_map_t entries[];
 } multiboot2_tag_mmap_t;
 
+typedef struct
+{
+    uint32_t type;
+    uint32_t size;
+    uint16_t vbe_mode;
+    uint16_t vbe_interface_seg;
+    uint16_t vbe_interface_off;
+    uint16_t vbe_interface_len;
+    uint8_t vbe_control_info[512];
+    uint8_t vbe_mode_info[256];
+} multiboot2_tag_vbe_t;
+
+typedef struct
+{
+    uint8_t red;
+    uint8_t green;
+    uint8_t blue;
+} multiboot2_color_t;
+
+typedef struct
+{
+    uint32_t type;
+    uint32_t size;
+    uint64_t framebuffer_addr;
+    uint32_t framebuffer_pitch;
+    uint32_t framebuffer_width;
+    uint32_t framebuffer_height;
+    uint8_t framebuffer_bpp;
+#define MULTIBOOT2_FRAMEBUFFER_TYPE_INDEXED  0
+#define MULTIBOOT2_FRAMEBUFFER_TYPE_RGB      1
+#define MULTIBOOT2_FRAMEBUFFER_TYPE_EGA_TEXT 2
+    uint8_t framebuffer_type;
+    uint16_t reserved;
+
+    union
+    {
+        struct
+        {
+            uint16_t framebuffer_palette_num_colors;
+            multiboot2_color_t framebuffer_palette[];
+        };
+        struct
+        {
+            uint8_t framebuffer_red_field_position;
+            uint8_t framebuffer_red_mask_size;
+            uint8_t framebuffer_green_field_position;
+            uint8_t framebuffer_green_mask_size;
+            uint8_t framebuffer_blue_field_position;
+            uint8_t framebuffer_blue_mask_size;
+        };
+    };
+} multiboot2_tag_framebuffer_t;
+
 typedef struct {
     u32 type;
     u32 size;


