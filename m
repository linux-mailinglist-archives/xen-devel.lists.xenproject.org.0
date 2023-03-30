Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5226D0335
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516658.801146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqVQ-0004gs-A2; Thu, 30 Mar 2023 11:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516658.801146; Thu, 30 Mar 2023 11:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqVQ-0004e5-7C; Thu, 30 Mar 2023 11:31:48 +0000
Received: by outflank-mailman (input) for mailman id 516658;
 Thu, 30 Mar 2023 11:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqVO-0002FN-O5
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:31:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73e58b8f-ceee-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:31:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8980.eurprd04.prod.outlook.com (2603:10a6:20b:42f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 11:31:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:31:42 +0000
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
X-Inumbo-ID: 73e58b8f-ceee-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2o04hZTFoDpTSL4zM6urm9xv17de54SzbPTwFFd6FinuLMsdRTQ+u8xiW8ghFJBQy8Y+CVhJF/rlwPvpiu9Fs9julzu9hHwMDIeLhFCEeay+QSHRgTpylrmMPofJrJ9xkYzrEJI1751IVNEHGq8zNPdpfx25A/pKMHOq+0JzBXe8/YYJ+PA6IMjmIoIaFej79dMsocsTarFzRJOpL8GS4uDO11RbSf5jMWYoFjJ1a5a4xnuuXEMQ08RpnuODUVG+oW6IcPVsrmmlmNZdUloI0MTJFE7keNuvwFmUn2dFG+DburkjaLeV00nUNViMchTmMg1Sbj9AchxbmL1T3RtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpugR2creDQpmbTfh0GSUcRY9SEocvRjzcrAYXp5z+A=;
 b=MJ4dAyMSyDS7NOsmr0GfPUNHjyPG5Hw54A4ODtrLSBbllyfkiqQKs4340kAXNkbWhaV88dt/CfMX4ePqaPbugt0jwjF6qbE7ZN3PSm1OWCS7TehtBuHg7pXADLI+VF2MDSdbkFMpKBCDoCkPESvT6t610fUvgm3uRxVAeilOs9T+uxCjCY/chqAXxdWDF8UDuQFNB17W67XqHk7/xSAavhGqw0BvYUM4lQX5PgzeT3r9ZYf1fhIN42spWZJ1rlUraMgcTWvMsedAaXAnFqn6e6neCAzFgXai6jpz98FwXYgO9zyIl6yJHPkQzbaOZrLymwRQijbIYBbn8cumtAlcFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpugR2creDQpmbTfh0GSUcRY9SEocvRjzcrAYXp5z+A=;
 b=PBtMUD2Y/3r/ezkaYWXao3GhiZzn3fxdKH+oy4a2xazwjdyl69S7eGRrsuVabM/TFZtm4GRg9YWW84DzuDnSKtyOyejQMpHJEThy3bzp8rt8Qxk5Umg8RJGwVlZhQLkyhe1LUEXi9qfQB+yonFIXKK872L+RCCHBh+5rI47tqe9FQlCr3tZeoZL4oHKXTo3N8ALIrm3fwFqmNh5SC4bB9yDgmCFZCaSBjManCExjoYwbt6TCwdInLJ6oGaD9N1AN8K9auO9iQMFE+VQtRd9qUixbTWiKpgr/Qkl8szIUq5GgnsOqdi0PEVWCCMOV9G7uWaUN0ycRUGoKWmjPZ0iz2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <354658dc-35f5-1322-a1a7-da44d0d2b0f8@suse.com>
Date: Thu, 30 Mar 2023 13:31:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 12/13] x86/shadow: "monitor table" is a HVM-only concept
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
In-Reply-To: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: ea24e251-c833-4649-2837-08db3112561e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MJe2KzOXMMhONTIYdGoBnV7EJQ3rJwZAEdm4+mgebBCbNkbB18cIQ6AAtYFgwHrPFU+wun5PGNo9rm/SN8/RUkiZZxyXMNA/k8LWveVcDtvpMYh1YzFHAiZoGa71yyEDDpqkUruiMVPUcohem8rICJzr8Ix6hBYcMQ0mgCaVKUrSqD2BszO0kvvSdyq1ihhlXt4os5l5CSKn0w2mGOygn49+5vYPhsZC0491OuArIfxAynyAF4HowEzh9RbT5mrUmJXiuNx/0tFFdVc4b0DjLqekeYTZrNrkpsPd2CAHj2OfX5fBCu5eZ8wR5T35353FX/GiuWeW+TnjwqiGyYljYRbai7xupcjwDQ4ETxTWo0Gt/36orycgRDlwEhq7QFIxg1dxDVbeuCj1UyynUFtP29WgVbqpXwLoDrEPTEMmo2DA1dohjIjBg6H9axb3untG/P/CuPlCGDOKUiR0j6+KEAhL3lVzFq/NMS4HcxBPnQI6TxFIJbQO/BtxNVLK2nKF91sFqyxGHJZcXekdU1fMSmvkbV+e6BAX6O/YBWQ+MaUQ4aW2cDW1wzC04V5utfgyLICHRSZmiWSJwzOiZuOTNSISPq70H1qdHHFI9mJhoAAgina/SgesCGmLexS+00DcU5x8oiWd5SJYh+Eq3Z/SYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(5660300002)(31686004)(8936002)(2906002)(8676002)(4326008)(66946007)(6512007)(66556008)(66476007)(54906003)(316002)(6916009)(36756003)(6486002)(2616005)(478600001)(26005)(6506007)(186003)(41300700001)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG9DVmVSTUhZdWQ3TkNWMFc4TGpRaFJ1Znpab0VqZTA1eXM4MDhHT0RRZGtq?=
 =?utf-8?B?cVlmYW9oa1VEVm10c3ZxblJOelBIc0ZCaUNQZnlXWWl2RHJlcEQ1azlpYSs0?=
 =?utf-8?B?YXVXVjRXeldOeXUxUitDWktBbW5rSXVmU1dJY3I1TlFlZlU5eE9VMXFWOFZa?=
 =?utf-8?B?dEcyRlhkZHFlM0JBZkhiVUNVUnJ1OUNSOXc1SjVFQVdoSzAxdnZiOTlrTXVp?=
 =?utf-8?B?c0tkcWZTSm1NbWJxdXhyYnRnWTNwRWhjVFlPT0RQeEp1S2RJYjR1QkdPUVAz?=
 =?utf-8?B?SDFyNkhjbnhkWGJ5QmdjbzdRTXJqanp1QklNVHJ6clZDR1FsWGNKR3VtR2NG?=
 =?utf-8?B?MmdhMWh1Nlh3aFlmYnFEaHZFM0kyNGxFOXpCamxNUS90UzVHMnpqNk5LZEVU?=
 =?utf-8?B?Z0x6d3BRRUt1bG9xOUhzWFpoZW5sV2R6V2haUys2QThMZUppM2ZLZkU4Rm41?=
 =?utf-8?B?NTMwYjFIZ0VOaEtoSjkxMkhja29JSmZRakxzQWp3RGQ0aTg3aUsyVXVuTGJS?=
 =?utf-8?B?N2J4Um16MHZSdVpsVUtCbTg2RmlrbW8vVU4reGJjUy83bWxkTkVPcTBXazRT?=
 =?utf-8?B?TzdaN1h5aEFDdTd4YVQxcWtZUFdpUEU4K2pqcmI1NThLS0l3eG1lY1h5cmlp?=
 =?utf-8?B?V25DVE5HbFFuTEFianNQUGZGY1NVY3FhczgzNzlIemx0cWZHeExyVERmRlFJ?=
 =?utf-8?B?U3A1aUMyVjdIeTVVYXF0c3gxRlA1b1FLbXBoSlYrVEJvcjZQSTFQd3czY21X?=
 =?utf-8?B?ZGRnSk9NMlk1Y05BK1BMSFhsZVQ3MVg1dFFBMllLZmZ1QlRrSk9xYTFvckhD?=
 =?utf-8?B?RmU2MXNpQjBYQ2tRMjVnYXJsb3R6MUhoS0lVbUx4U2UzZzk5WGQ2OGx2ZW8x?=
 =?utf-8?B?VTBaM0w2bmdmdlJNK0ZWZnBaanFRMnBmMGttZ2JBM09ISlZQR3JVdmRFcHhN?=
 =?utf-8?B?aytLeU5vMGgvK1RsazAvR2x4TlJjUGJRYUM1WFEya0JvbnhVd1BTYkpGQytz?=
 =?utf-8?B?MVAydHZBUHJyZWN6bHhVd3BQSXVTVElqaW4xYUlkZyt2NCtVa2tYUERNSEJu?=
 =?utf-8?B?L3prMDhnbTVTSUtMdkZkRDg4UXRwd2hvNUNLSHhBdURYa0c0UC9ZRnRibVYv?=
 =?utf-8?B?ZjdHd3FwNEFwMHROV0NkTWF0a1NwakYwbmY3YzF0bmE5QVhMMlo5ekFXbElX?=
 =?utf-8?B?ajIreDAzOFVWaG9jbWFmbVg2Z0VyMjczQUswQVYyV2V5dXg5M05oZk51WGl1?=
 =?utf-8?B?c3VaVEN4UThmcU9tNTBEaUZCc0FaQUpkQXlKZWJvRHZud0RubS9oNGZZeW1m?=
 =?utf-8?B?ci9hL0tqd0VWNjgzUTV5MmNSK1VwZ3NMQjI2aUduejdsVnJOTkZPZzgzM1Zj?=
 =?utf-8?B?WnRwVHFuMjZPUS8zSGFDZ3ZMbTVlbTQxb3I5M3c2Y2ZIa1UrMWVGQ0hrMFRL?=
 =?utf-8?B?WnUvd3MwQjBGQmVHck12OExHODZQaUk3VTdqYzd2MUtRMVJ2VDdjVHZvdk0z?=
 =?utf-8?B?Z3hXbzJLK0lMVE1XU3RtaUErcGQ5QUdPaWxCQk5nRFZPTFJCMlhQTVRaWEFS?=
 =?utf-8?B?cTRZWjV5dlFzT2lFdC9HUmNjN09KRTE3MnVZMDNINDhrMEJaMk8raVB4UjJH?=
 =?utf-8?B?YTdHdFZMY2ZRNEZHcnlzZDRsMk1NUmxFUEorN3dtMHVxalk2czIrcUd6WmZa?=
 =?utf-8?B?U292NEJYMW9zSzFnbUlVNzFjMUgwUmlSYmsyRGhJNHVBUkZ5UGQ5bnBpZWxj?=
 =?utf-8?B?cGZobFNDVXRSZmJLMGF6bkNTcDZLalFFZ1BNNVRqQjJxeG1LaFpiRDEyWmpq?=
 =?utf-8?B?T1I0bllnY3NKMWRSZEpPQ2hTTE1lcFBtSFYvM3BmMUZ6NjhqcnFObGNMeTd1?=
 =?utf-8?B?MFJYZXB4b1NWYjN3VUdGNG5pdVBPSHl3bnBIY0ZjT1JCYlZSK1pZOERKL2dX?=
 =?utf-8?B?OU1XVW5aeTJYWFBFQWJ4ZnUwL0JKRCtYWFpFT0FieXQvUm5PWC9jVGVIWkpp?=
 =?utf-8?B?cU9MV09kQkxaNkQrbWJwMEJYbDJDSkF6alYzV2t6Qm1pbDZxMFQwSWI5MFJZ?=
 =?utf-8?B?QUJBNU52aFl6R0lZakNHM2FTWmZtdHFEU3ErUi9TVTZJNmhYaUhiTm5UeUNj?=
 =?utf-8?Q?ac1lx/7k3doffNZhuRoCMOPmm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea24e251-c833-4649-2837-08db3112561e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:31:42.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2grHUIOVSnqm2zAGrySE86Gky9ltNwd7kbkQiocudmBPEq+GE9v3Ss0YYmqVOkxft9pW/JkB/rQ4OjeAVaL9Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8980

It looks like in the combination of aff8bf94ce65 ('x86/shadow: only
4-level guest code needs building when !HVM') and 0b841314dace
('x86/shadow: sh_{make,destroy}_monitor_table() are "even more" HVM-
only') I didn't go quite far enough: SH_type_monitor_table is also
effectively unused when !HVM.

The assertion early in sh_destroy_shadow() can have the type dropped
altogether: it shouldn't make it here in the first place. Pages of
this type are freed directly from sh_destroy_monitor_table() only.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1190,7 +1190,6 @@ void sh_destroy_shadow(struct domain *d,
     ASSERT(t == SH_type_fl1_32_shadow  ||
            t == SH_type_fl1_pae_shadow ||
            t == SH_type_fl1_64_shadow  ||
-           t == SH_type_monitor_table  ||
            (is_pv_32bit_domain(d) && t == SH_type_l4_64_shadow) ||
            (page_get_owner(mfn_to_page(backpointer(sp))) == d));
 
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -205,8 +205,7 @@ extern void shadow_audit_tables(struct v
 #define SH_type_l4_64_shadow   6U /* shadowing a 64-bit L4 page */
 #define SH_type_max_shadow     6U
 #define SH_type_p2m_table      7U /* in use as the p2m table */
-#define SH_type_monitor_table  8U /* in use as a monitor table */
-#define SH_type_unused         9U
+#define SH_type_unused         8U
 #endif
 
 #ifndef CONFIG_PV32 /* Unused (but uglier to #ifdef above): */


