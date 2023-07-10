Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C43C74D210
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 11:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561153.877523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qInVA-0000uJ-EH; Mon, 10 Jul 2023 09:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561153.877523; Mon, 10 Jul 2023 09:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qInVA-0000rW-Bc; Mon, 10 Jul 2023 09:48:16 +0000
Received: by outflank-mailman (input) for mailman id 561153;
 Mon, 10 Jul 2023 09:48:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qInV9-0000rQ-2z
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 09:48:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e28612e0-1f06-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 11:48:13 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 10 Jul
 2023 09:48:10 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 09:48:10 +0000
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
X-Inumbo-ID: e28612e0-1f06-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECjbLPSn/96FMEL1Q1U06RHz22LMKG8phVWjPNplJrMgEuSjUYlpTc5yKsZLQ9MHmDss6+3mDJAqad4F5mha/acDVfqsoacm4OfpIb4UQHwxoG7DywE9KfJIZG49i1fwuUviqUgREfsFP9JpvQQ96PjKmj7eY30KniLF99IT5yt3/vJZpPysy7SE4sbS/hkVSZAz09jtzu8cUh+Vsmi4XzYRiUud7UnFHxOHEXyadbJak36oQ1TNB/gqcrxeU9K6y/oa51d7zPTqHCEeGR9IEmY5yVSaBSNd/xqIhxqc/bJzAlIMArmH7UsJKYC/96BB2KdeAP/j2D16LzDVX36+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NiTw2ecYw7wSXcIiRXU2ocxqscz82Bs1Osjze34n8w=;
 b=AWvBLxFhE4KXBaHSXU88r8Q/6nWmECGG9zsDpZHj7iAGWoe5S0vl9hhymSYMp8gIYSCmF8yqtg/v1D189hJqSH/+aU9sINnJR2W5lQFDcQ+jp6PZNjShuJESMvdgkXA8mS0dM/wGJkzZ6N2zlWdej08YWKwk3RwfUqK6GTffDT/WKnVy4AGNpnqtyJSleX93eS6kQE+/tAE+v774mvk6wbCxBfeLaABKw8L/6RGLH30DS2IFfeahq3IqhmZ+lzoE+coObqdjCWSMsOJ/wi0owHwF9dOI+QlTKNy5DmJHMozj7W2F/k9XZoWNiUi1k1WgVEOrDLt2LiDvvyGH/yY/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NiTw2ecYw7wSXcIiRXU2ocxqscz82Bs1Osjze34n8w=;
 b=4ktaA1WlnTm8sFr22Mj+OJx2Z/aNKdGiNx40r3kBGN65kQJZlKJcfEdxLqjsVQ7733yfrbGRmmjUTXK8KngyXQB96zdTC80yPyJjUkYdtNmJaJUtzoaYJc+iF1fGspnISu0uWVqojJmJmj0sDa0mrdNsbEpZLkgEylfJYWyWcPClbURTuhPNm03313VegL9NvN4xTmJ6isMbUz0Mm2ZMLAeLNlGRr6LakPYkaFGLc5xPcO1rJBdNKwIhwenUnXAJx0ZlRwm98CqRgkDhEECJuYgYPviVdxlbd+SaO0wB+6SDho11dI+iHA9tjITKY8nvuynkSGHh/szsWs9jsg2Ghw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e3034416-0c34-322b-732a-02008be514b3@suse.com>
Date: Mon, 10 Jul 2023 11:48:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xenoprof: default to off
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::20) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d19d7c-4e30-4f53-bee7-08db812ac577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HFGwfka+49Gdc/O80XWhm7Sxw1UFXX7n9jByQOqPtZpRSENHrSBsC617+yTxlJee0QC+2IhrjiGzGOW08dyE9D/GH0F5UYzES9+2S97fsd4+xuLbQZG/BbL46FI1H8+Zo7LKnbN2FA3ts4Pffp+9gCe5YaFHRqgpKsmR63Zt+TSIkkbxtlkRq1T9p9XTmKSHb8iBClR3pzzLpRlXS0KVIsJsVqkU6rfsOQ9Qw5/qphg6H58Iy5PV1ih+v3+tUKKTq6042hyTtREG6j0Q5UuLAlrDUohS/Bx18LWFZlBc9HWQ9KhlS3VbcZPXaMw58mGjvb3pI77Ry3/cZOET/f2SsBSRx9dE7IhnfFIXY9txOuVGA8kpJxMdSwc07qlmBe/ZJsUmaHJvsV0+D5M2gPeDlOjybtC3DmHeKcNSasFpOojwd5+X+kHum9h1t4DhJON5GH+NRDz5bmwTEptMVlYsKT5qoRhWs3IFWYq00rBRChks8hC/Sg51xiQFGdUt1gT9UN4cEY+ZEmhHMjEa35nsiDI7NpSuVvAwFhpGTL3n/vIxXfLY7jtGuz2JzUSm+3D/EfJB+uCubnYHXi99f4H6rYwJ+vRlfHzbG+4AYApdtGIHsvjKr6EqNei/ZUXAIIdjI/Fv6x57uLygpnZazA7new==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199021)(26005)(6506007)(66476007)(316002)(66556008)(66946007)(4326008)(38100700002)(6916009)(2616005)(6512007)(186003)(478600001)(2906002)(54906003)(31686004)(8936002)(36756003)(5660300002)(31696002)(8676002)(41300700001)(86362001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFphdkJmWXFKMDRtaUFEb2d0aFBJOHhRUSt6K0xiSy9iajBKbisrZDVMY05r?=
 =?utf-8?B?eHcxRGJJWTk4alNOeURXRHBOVWFMZm8xNkdtRFRYdE05WElYby81dmpnMkFp?=
 =?utf-8?B?MXJ2dXIrWUxxQ0hjeUdwVkNFU01LMldvd2ZScmFXNzdtREpZZVhYUjdOSzZD?=
 =?utf-8?B?V2M3Yk1KNzIzSUJ6SHRLSHRoMWpwem96OE53YWhaZHBSN0xkOVFEMzVUMmRZ?=
 =?utf-8?B?RW1VV0NreEJKVjFQZ3Q2amFJcFZnUDJTak1rOFQ3Z1BTYkh0YzYveHFuNXRF?=
 =?utf-8?B?TVd6ZDMyUTZneE5Sbld1dUdmWnZ0U21IRTU1dTBERmo2OGMySGRpTkhjWVhr?=
 =?utf-8?B?dndOOFh1QUZ4Q2hOR3kyVUh4Y0FOQndzbmd1TzExTzlLSDNCbnlBblMwdzhY?=
 =?utf-8?B?dUkxSFpSb3R4Tjc0REEzb0x5M3lyS25FVjVYbW50MGxueFdSSkRBd3R3TFVl?=
 =?utf-8?B?bUZJdTd6MDl5VG16ZTZoZXVtamp1dVJ3djBUZ0N6T1N0Wm8rYTBpdmJueVdW?=
 =?utf-8?B?VmV3R1NpRzZjaDFxQkJMZUthQk5FdXZQL0IwUzk5MHRuVGFXVUZENDJLWGNr?=
 =?utf-8?B?MlUyR2w1VlF6alA0bVZqVmtMRDFqN0kzaHdhT3RkOHNDQUVzR2M3RnBCaisr?=
 =?utf-8?B?WDJGUkE2cUIxckRHaXBjUG54MWdySGxETzJ3R1BVMzFoRVlUaCtrSWZsQ0s5?=
 =?utf-8?B?VzBFcU1LWlQxS3J0UTJSend0NG9GTmRNakp0a01qR2MzYVJJYmlyUUFnTTR6?=
 =?utf-8?B?MFJSenhtOWptbkRMQVdtZDZrVFFYcFMxeVcyc2VpQnYvMnY3dlg0SmFFNGJS?=
 =?utf-8?B?clY5Q2t5aXlxODhqKzB2VnNoOTk4ZWRBUUlYMmJDVTN4eXc5L0l6Nngva09J?=
 =?utf-8?B?QXd6ZHpLb2N4RU12RjRwZEw0MEhuajhud1BGdEdkdDZNcGFvWTBaYTYrTXkz?=
 =?utf-8?B?VVBwZTlPZVpyQlNzUWFYVk5ZOENZWXRvbGVXWGVVYTVsbHFSSjRIYXYyemJ4?=
 =?utf-8?B?UE1xTWhralhDU2s0RWRPdmxXUEtiM2xHRElpdDNvZWtVMC9EMks1VUM0cG1B?=
 =?utf-8?B?QU9CbEc2OXRpUE45ZkRqQXBreU1nZHYxajN6RE9iOXVPS3M3eEY1aXA5OERF?=
 =?utf-8?B?L0J5NmhHVTN1L1A3MytEWk1pbGpReHdUdkQxa3U2a3paWnlaZGxFUmxONlhG?=
 =?utf-8?B?d1hRUDlYcU4yYXEyQTZUY2lYcEJQNkR0QnIvbkVxMHZxRkpEZ0lDTEJZSGMv?=
 =?utf-8?B?Q3pPK3l4aHEvSldXZlYwYmtmaVpvbEdWNjd5L3hEUTQybkphRVpIWm1RSTh4?=
 =?utf-8?B?MWt2eWRiTWJqVmR3aGZveWZlOVFyTTN3L3ZWVU0zZjNPQ1huYVcrSVR1VjN4?=
 =?utf-8?B?SmIwY0hERFd2VTl5NHR3R1h1bmIzZ0ZnOEZIZitDL2V6Qmo0VGkrK2ZSUVJV?=
 =?utf-8?B?WDlBUDU1VEFQN0NIMzM0SFNlYkd6TFpiMUwvWXBVaFQ0UjRNc3NGOS9KUldK?=
 =?utf-8?B?N1VMc2lVc3NuY1JmY1NEWkhVTTNIR3pkZkMyTHprS2F4Y09uUlpzcHhlcTZJ?=
 =?utf-8?B?YTc3cC91SUxGWGRWRWo5N2lxTWwwU3l6UXhwcCtHY3hVUlVsUUljVlVIelM1?=
 =?utf-8?B?MDB3emZkRjVWU0lEZjI0Q1p0T2d3TnlDWXdrem1HbUZtd2NrdG1LTnRhQWQ4?=
 =?utf-8?B?c0xOOXdqbDFPeEdxNFNDWXd0T3NoM2JMNDFINHBHN0NjRndsRXZ5SHdac1BS?=
 =?utf-8?B?TGsrZDc2cTJYR1dNc29MVnVuUDZOcm1vbjNScUNHZTVhOGRhemxsZGxGNTV4?=
 =?utf-8?B?cjB1emEvZzFYNUFFWUF4MDJ3N0tYWnFkK09lWGg5Vzd1NW9EOVM1MkNyZmJ0?=
 =?utf-8?B?bTNPdHI2a05GMlErYTFET3hzMWx3RjF1S3ZJQ3I1TGpZNFJGWktkVUlSdDVj?=
 =?utf-8?B?cjAxYUNWQzVuWEJXTzZVMHd5blVCN0FxYmFobzRxdDhFWXlhamFRcitMaHRw?=
 =?utf-8?B?VmpOSEpaN1pXY1ZnbXlsWTZsQ1hvbkN0eFM1aHcwaFJKdUhIY044TFY4cU9L?=
 =?utf-8?B?Mkh0V2dGQXFEcFprb0NrOHA2MFVaaXRMaGRhV2FUdmtlWTI0WlNJUElXcnBS?=
 =?utf-8?Q?2X4u5WLy/AjhhVMEQ7NCPuonp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d19d7c-4e30-4f53-bee7-08db812ac577
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 09:48:10.5517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUst1aGmu8kEqBX9VHcqBxd4cbB3DAEnDKD3WKqv5bPrdikmJ+lzHNJfb8/ayaByEsA4YXoUbSy3Rtxv4UtG4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

This being x86-only right now, and its x86 bits being heavily outdated,
let's no longer enable this by default.

While there also adjust the "help" keyword spelling.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The adjustment to pvshim_defconfig of course isn't strictly necessary,
but I think the file would better have overrides for things that need a
non-default setting. (Visible in context, BIGMEM would then probably
also want dropping.) Yet if this causes concerns, I can certainly drop
again this part of the change.

--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -13,7 +13,6 @@ CONFIG_EXPERT=y
 # CONFIG_HYPFS is not set
 # CONFIG_BIGMEM is not set
 # CONFIG_KEXEC is not set
-# CONFIG_XENOPROF is not set
 # CONFIG_XSM is not set
 # CONFIG_UNSUPPORTED is not set
 # CONFIG_SCHED_CREDIT is not set
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -229,10 +229,9 @@ config EFI_SET_VIRTUAL_ADDRESS_MAP
       If unsure, say N.
 
 config XENOPROF
-	def_bool y
-	prompt "Xen Oprofile Support" if EXPERT
+	bool "Xen Oprofile Support" if EXPERT
 	depends on X86
-	---help---
+	help
 	  Xen OProfile (Xenoprof) is a system-wide profiler for Xen virtual
 	  machine environments, capable of profiling the Xen virtual machine
 	  monitor, multiple Linux guest operating systems, and applications

