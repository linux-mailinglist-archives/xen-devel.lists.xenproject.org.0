Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5026778D412
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 10:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592771.925595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbGTp-00029A-IC; Wed, 30 Aug 2023 08:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592771.925595; Wed, 30 Aug 2023 08:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbGTp-00026W-FR; Wed, 30 Aug 2023 08:23:13 +0000
Received: by outflank-mailman (input) for mailman id 592771;
 Wed, 30 Aug 2023 08:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbGTn-00026Q-NL
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 08:23:11 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70990df4-470e-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 10:23:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8713.eurprd04.prod.outlook.com (2603:10a6:20b:43c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 08:23:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 08:23:06 +0000
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
X-Inumbo-ID: 70990df4-470e-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kifkhQUR+HyuDD+Dh/4ATsA6bePrElvER4I9JOSy+IBUezHMk7pR07555/RTRaNjg0YBmLvkbGB8OmTa5Si00Ve14gva48qvfFud/oWdjXvo97fe94X70YBHUBEqoW5yzVGpxAV/eOuO5hl89DhM79nMGTxUq7ajrAzmxbqMkezMhNYmKkWmi8gfLMVKks/l7dLBCxkdeZml86J3BnMmyEMTtKTRzWHnx/a5outms5g5lkQVB3z+zu6ONX5SzxlUnDj5V7AseGO9ZebjJwOGtaOaA3ih1UUa8BUPzDycpEVYvIcXd9E64t5ekfNJqs6b7T947BjZtzopRwE/KBtOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu1ythTLCQExVgWrQ8AkLEYCE9Yo09/amBfAJ5QeTFU=;
 b=Mvu69V2Ea4r1hn/sNuSgHNDID+V6HU5Gp6mG41Vj9q2aAFEd0iFilvSoGn9ugD6+eqxOEhofTTrQJeKr5ZVPK8YYYPNGK7Z8jAZwgx6B3Dn1fyXJdQ/vWX9G1TxjqPxuuZrILkM0z+AGfvHJu8W3fhsVsWvkVwUJlSpb/AYKqRI7I9ZD7dpFqsyJxtHzj+QvuaoKKnov9mAeks68P43ZpSQBXHxE3BHGlqV5rmEghaqxAGcIIwI5J+YMM8gvPWzpnUYb5tafuJ00mB/V4AjwhAHnohoxFpkyzPAzn2YQ1vusyZ1ZAAcLVhx28FWcsiYIe4gFeK++r3JaYMIUDGAXdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bu1ythTLCQExVgWrQ8AkLEYCE9Yo09/amBfAJ5QeTFU=;
 b=gKIye07PTwkxGaRtdIAl1PZp4BeN1nbMwkk/bZ0WH/ETvsH6uYsPyPmgL0x96yhUPB1ujK6t58amsbEsZnAf4NblVMmgZouwlIHpj/lt6BDJmIpYohudlsFLM+A7kvuZUvqErKYYeHdy4u1xV4gMKguAbrR3cv1/m4Eaz/XQatWo8lJQCNHPn1qrxo6iIJd6B5BnnmexQGzSoENKx+he4Ngjfo079Q9+//MalahR3Xx3VVcfdKcQeeMqIkeWwBor8XSQTXNgFgWtYzcFnLtbw1wlSErXoVX+OP3B8NAXFVOORDl2LRjmX9nVEIo1OKic/667LbmLl1PEqR49o+/mig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dabf4c7d-f947-1db8-4c72-d9813da1c01d@suse.com>
Date: Wed, 30 Aug 2023 10:23:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] MAINTAINERS: consolidate vm-event/monitor entry
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a5098d-f088-41cb-f233-08dba932560d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	113PhHkQV+SoMmodDeXpzGqyE30Eaw9PZHXAVT2EbdW1HwI66L093kKeEqfTopLsNX69ipO5MFJHt3cv4yx+BFTa2FHSPUWLL+TqsUkIn+Hku4PT0zOpM7j2uBw5k9vCgSg4nheSgw+DGam5hs0yoY2C3hEblWi1ELdcP7ObKk1SYfBpseGEtqxPN7fYTiNpeZ7hZuDvUyTlvhwh01ak3JD78AUJHYKSLLpdSXS6hYW1zmxMY4WU/wghouCgPAdURZ/0AC9TzC5l7MAhTk1B/ftUdDYh6Z4XJO6pAZ3BQTR0MR+9EhQhiE5d/jmb3a5NeJ8lUrQJgdpGP06o6Z8MeW7tEfJOVKmEoj7HV+ucPlPF4tx+DEonAnxWQr/U8cRxW1CXQE7E0nfswvKhEl0A/sejainXKwzvF7UfyQbeM88FgCa5kKc9VuPBswA6fBkTFxCumAcofRyaTmSqmH6MCFoh1R13YfFJ2WMqCshlQRhRZM+F+Xd9HF3aBEaJnnPPmp75T1TpYwz1maIimvDjuA4kWR+3byoqDmU++HvHDlPl+aQN5s5RurrfvobLRGmqedXVQLZNgky/O0gYuDzYGDHbS0ZTQrnBQTzLCH2oefMFU50QcYqyzEN82JcB1B4Vb+BWPv9mZj3RdgiVprf8VA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(186009)(451199024)(1800799009)(6486002)(6506007)(6666004)(6512007)(83380400001)(26005)(2616005)(316002)(6916009)(54906003)(66556008)(66476007)(41300700001)(4326008)(5660300002)(8936002)(2906002)(66946007)(478600001)(8676002)(36756003)(86362001)(38100700002)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTAvayt0dzhYSEt6MWdTRWhzUHNpSi9GbWZFT0FnREFCcklab1dEMnhjVVBy?=
 =?utf-8?B?bTNzSmJmOU42WVl5WGJES3JiOGVacFFKNWFpdGlZd1VUR1k4cUVtNldLanBT?=
 =?utf-8?B?TUdLckRJNC9ERXd1ZXE2WXpXcCtLc1R3b3hSRE56bWErVm1GakZZaitXSUpS?=
 =?utf-8?B?NnFaSzlFUjc1ZDN6ZWRkNVJQTjF5QUl5M3VmN0R0MzJqWlZLN2JrK3hIUGRW?=
 =?utf-8?B?VVA5YSswcWJhUyswdFB0VFErSlBLRTlQMzhhZGlJdG5YVkdwUXVOK0UrdGVw?=
 =?utf-8?B?cWtvLzBLZnBjemVPNER0MkJlKzRrVi90TzhBa1lVY0ljY3AyVDIxMXVDZkZx?=
 =?utf-8?B?MHJmTDNrOVVPMmVNRFdWdDZ1OTFKZGpsYm8yOUFTcVk0ejlYSVJwS3VvZVc5?=
 =?utf-8?B?NUhieTQzOGoxT0JXTjlHWnBkbzl0QW8vUFRwSjFrem13MjFVTlNHaDdmK2Na?=
 =?utf-8?B?WHNOd1F3eXVKSDdGOTdyM0RmMXF2QmU3ak1VZDJxQ3lSSzR2VGR4dGZMZWJI?=
 =?utf-8?B?aUVkN2wwYitRdTZsZ2lPc2FhcmJYaHRtNkkzZ0psU3BRRmNWQmVLQVZONDhO?=
 =?utf-8?B?QURaK1JBckdEdDJYbnBxN1ZZWDJPdzhnVElQT3VJS25JbHBDdTE4Z2piMXlH?=
 =?utf-8?B?Z3Y0bnhuaStHakV1Z1VHTTV5dmhxMlpxUGNUVHR5Nm9DQ1BtUzl6VVVLTUVl?=
 =?utf-8?B?akI3RWZDNnhkeWtzemlmZEpPdlM1cWUwVmw1T2d1Q0JPK1R4YTZ3R09IcnlL?=
 =?utf-8?B?ZFo1SSsreXpGSGgweVU4L2tDd0Y2a3BnNU5KeVEzUHpMdVBiNFpReFJQZ01u?=
 =?utf-8?B?WHA2NGZuUlhBSXBBVklHaUE5bnBDaWJHaDdybzJhRWJaVkVkUEh3bW5qazRV?=
 =?utf-8?B?TG5HT2orZjRKVFJNb1ljKzRlNXR4SEJiaWRVODRtNjE2amcwZm1JSWx2R0Zp?=
 =?utf-8?B?QWpyT1AvVEM2NnlIbHlLT1R6UCtUVFhsN1RqT25pQVFWNWNKeVhaYmJWMWk2?=
 =?utf-8?B?dVRnVUx3RlcyenI2TnZFZmY2UGx5cG9meGJVZGxUQ1dwaFJjQWpHY25ycXRm?=
 =?utf-8?B?YldFNGEwS2xRRGJwMUI0QytBZFZEYzBaaUJUdlRFaDU2RkxNMnZtcmZQNTkv?=
 =?utf-8?B?cVhNdzFJYVpUZ2dmRHdkUzRKMnc5SU9Fb2FMbldmRlVSdGF2a1hSMkQ3TjZ1?=
 =?utf-8?B?NFduQWFTWG5aeXBMQjZCeG5HeEJ0RUFpYmJYWjRnN0duZHFvL2N6OUFQME4y?=
 =?utf-8?B?NkJqb2prWmlGS3VSUHNlMHdycFBGZTBFNUZDN0JRSjlKMW00emRxZ2hPbW93?=
 =?utf-8?B?TklONDZKYzZTbTd0NXdTWGNkbTVIcXVRN0hmdjFHbS94bS8vQk0rbTdRaTF2?=
 =?utf-8?B?Nk1uY2RkaEVVb05MOFNielFTTEdiQnhTbHBMM2NPZWtuc2dMV1ZkL0dNV2hH?=
 =?utf-8?B?VkNzR2wyUGJjRSszOExmUS9iK3BFMVNveDhoNnk2UkpKS3RkV0hyOW1jNnFY?=
 =?utf-8?B?cjBWcE02RTRveXl2TlppcEpJWS9TcUlNQmdhelN6Qm5hQzM1QWpaOGtTVW9v?=
 =?utf-8?B?Wm80TUVXckhiRHNyUjF5Ymh2V21yaHBmZi9adm5zV3ZsYnd0T1VrWTYyR1dZ?=
 =?utf-8?B?MndhVlhBSXY0OWlyeDRub1U2VG1BbGJ4VnViMHZMQUFwMVgwdEtPYXlNbUhE?=
 =?utf-8?B?ZW5RSjRHS25HbVJjL29LT3VIVlVPRm1QYXJyMHNpdWtHeUNLS3VibEFHbFZa?=
 =?utf-8?B?OFFab2lPN3VKK01vK2htbjVFRFlwcklWT2JJYWVJSCtSNTRsVWVZcmxqZURZ?=
 =?utf-8?B?bWd0WHVRMlh1U0RJeERWbTJxM3lqbXlteG54alF3K0hhd21aMm9KZzVBdWk1?=
 =?utf-8?B?SDVDd3hadzJDZFJWNDhKVTVFbnlnR1MzVG4vamNkYUZKMGhQVVh5OTkrVzVY?=
 =?utf-8?B?KzNXMWlVSVo0UEV3RHVxenpZMWtnNmVzcmdJVFNTNTNuaVg1WU9mbUpSOXdq?=
 =?utf-8?B?eVRxanE5TW9vRFVqU2hwNjlDVkhxcWowNHM1Q2VnczNrZFU4WmtSSmp3UDJh?=
 =?utf-8?B?UFJ0MTdUdTJwcUZCWEd4V2tJcVVRMTZLcDRIeGNXN01kenFFOVdaRTdndGoz?=
 =?utf-8?Q?G3Kx1Yn60tsNrciPlB96mQAW1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a5098d-f088-41cb-f233-08dba932560d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 08:23:06.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPXxtDpje6oHXENMaDpPgyKF75BCT2i6EboIYOpvArf0smlXQ/kb7qAJC8JsdyJPUpsiHRAHthqDLRrGGLtfIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8713

If the F: description is to be trusted, the two xen/arch/x86/hvm/
lines were fully redundant with the earlier wildcard ones. Arch header
files, otoh, were no longer covered by anything as of the move from
include/asm-*/ to arch/*/include/asm/. Finally also generalize (by
folding) the x86- and Arm-specific mem_access.c entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Triggered by me looking at the entry in the context of Oleksii's RISC-V
preparatory patch.

We could go further, to simply
F:	xen/*/mem_access.[ch]
F:	xen/*/monitor.[ch]
F:	xen/*/vm_event.[ch]
Thoughts anyone?

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -558,14 +558,9 @@ R:	Alexandru Isaila <aisaila@bitdefender
 R:	Petre Pircalabu <ppircalabu@bitdefender.com>
 S:	Supported
 F:	tools/misc/xen-access.c
-F:	xen/arch/*/monitor.c
-F:	xen/arch/*/vm_event.c
-F:	xen/arch/arm/mem_access.c
-F:	xen/arch/x86/include/asm/hvm/monitor.h
-F:	xen/arch/x86/include/asm/hvm/vm_event.h
-F:	xen/arch/x86/mm/mem_access.c
-F:	xen/arch/x86/hvm/monitor.c
-F:	xen/arch/x86/hvm/vm_event.c
+F:	xen/arch/*/mem_access.[ch]
+F:	xen/arch/*/monitor.[ch]
+F:	xen/arch/*/vm_event.[ch]
 F:	xen/common/mem_access.c
 F:	xen/common/monitor.c
 F:	xen/common/vm_event.c

