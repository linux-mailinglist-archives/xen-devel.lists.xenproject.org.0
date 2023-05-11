Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0616FF165
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533357.829943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5Eu-0005iZ-SH; Thu, 11 May 2023 12:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533357.829943; Thu, 11 May 2023 12:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5Eu-0005g0-PY; Thu, 11 May 2023 12:17:44 +0000
Received: by outflank-mailman (input) for mailman id 533357;
 Thu, 11 May 2023 12:17:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px55F-0000KI-UC
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:07:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f73ea1a-eff4-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 14:07:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 12:07:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 12:07:42 +0000
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
X-Inumbo-ID: 6f73ea1a-eff4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR2fCOrjH1EjhHyTGA87LAASim8ULatA4LHxlljV0dX7ipIPWvC0YsdEMKBNg5Gs09bk8qTdkl4jEHESRStGVNV/ZeYu8sDYv9rA+inKmq3TKuZp9ix8B13kf5GZldES8JwQLbTYzv+TWo25ujvss4Eeufaoxc64CaQbBn9QSDikw989VACNOgAVGHcmowEhmohpjf7okHGAWd1n9a90oiuo0W1Ru5iGEVs7JzbGoe6jr3LMmFYXBq9d9RulKnEI5xR/zRaxLmOWviNLVWKR2WvWW3nFwFdAjS4tjMejnnGebG/4keI6r0tBaNjz8lF4WqKqNtOmOPw2NE6agv6h0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPOmgpiaeBQetnN9zjEskScvUsHZmKmMjuVbnrq/H8U=;
 b=QNebT1VILMiZ1upECjHAstVW82bZNRgwiq/2YYYVu2apIz+AFXUc8yktsJVr9hHicne3Ruw90IEngXuQWnCzW+NFrXBVMo5qrRllmi+XSI2sded2C+HhjN3S7RkpKdUSt79/SA/EmBmISSnYUN7GXEb10SmYca01VlPMNRBNYvgQ0gNuyS30csDKtfhmuWHdeJ/XdvZn09p3BwX4r/liNlmKRwSr0MwqFv8vT8W67Sjt4QZP575ay0fooqre/sJCnadDHLoDn2vZ7+0HQVDK74G0SUu0nLCloSELv5dBEDhHVe2a/2IexvXZol3Ij+eVs7nnZosNgC4nBSSMwib2GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPOmgpiaeBQetnN9zjEskScvUsHZmKmMjuVbnrq/H8U=;
 b=UdIaNCxwbR1y0MsusatviTv3mR1QPrCBJwkT5nbL2wV9bm2Ss6KeRB8iHN6UgkDDurbnlVRWWiIjcO7rQNs50ZCtMsH8MQbivQXxLyvFeyyiM1ztO+P8Z2ViaUgy1R+YxemLQp2bcvB9SKKuNkSpjWAkr3grJe4SzrbuHWC2Z70onIoDzqJ1B1RKDu64O2gqX9aSwHgTTO+Ghq83VfqCbjHXoUqI/UD6z/5iRQnarTBH+Z+pS9hcgwm9xqnnMdw+ADDdhkHZjZ1/0t1uICdndJZlXnxeN1deHUPBa8aypVd/vN5WS/rWnMo7a59pF/ucUUVIQqI8kt/8MLtZFmhR/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8be0096-42af-6d7d-ff7b-b6128d996ccc@suse.com>
Date: Thu, 11 May 2023 14:07:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH 6/7] x86: don't allow Dom0 (direct) access to port F0
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
In-Reply-To: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: f0637195-1229-4813-a85f-08db521852ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XaGnyRGTb3nJ82fu7+Dakev2PXrSotYjm45SpBmvv9ZA8AAdE7C/UQIVfhwr3nL3wBXVFd1qn9KGC1o9S4mkhokkxK8DTH43x23kaqhHEz80Khxx0h32oTSJTbQIl5KHeWj3vArIji3gYMWAXUa9Ls3+nQkYmaihH1eRFn03Lx7IzPXiUExXjpHmoNZjn68CZ8rOqnZYtD84tjpWwsLHe261XuetNGuc663qLeSvLvgR4jHHYMbd4yU/TX5LCWNGiCq19Ff7GwMisJZQH8n63v426zCsxlWdEJ1lRPTyCFzHOnsIvTFrffrHMhroQ5fgCiLN/L/mHs3j/e7vhibGniuErlsH+9f/xEb9o7cehh5lnhPAFW1MtJ1/31srLdVAPIrbVCTRbAf0XDK7j6Gn9Rv64RqJqGg5/SxyVjtXeJd3rH83XqMt0IXfyOx0cWAFyg86+vauefqf+ycmebf2jI4QqndvZS0bnKNXW9ZqKQT2y2UH1czwyh5BHwFyTx0EKkkuImcY0rJzSphDv+W4Ep93P1nA4VsRJgnLD2HGfQZYlWVMflh4kMKuzLlJYT19AmMPJwTsKHuYeu1qeGdC+Q61ObYUzI5HQxU53Na81+igXSD+J3f71MLpkdbCkgCQ4+Yhf8RTzjLwuA/7eKVzZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199021)(31686004)(6486002)(86362001)(41300700001)(2906002)(31696002)(36756003)(38100700002)(8936002)(8676002)(5660300002)(83380400001)(478600001)(4744005)(66946007)(4326008)(6916009)(26005)(316002)(2616005)(66476007)(6506007)(54906003)(6512007)(186003)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGFEM0dmV3RMZytuWVRXMWh2d21NVlVCUFNacVkyY1BhTEp3RTcvSTJCVEgr?=
 =?utf-8?B?RjFFaVlaY2E1ZGtKZWZyOWMvS2RnZURWRElHakV5Uk9lVjc1bk5XVklpaFNC?=
 =?utf-8?B?YmRUSW5XV2VveHMwKzBoZG1NMGRVcFRMZlY1UVJYelB0TmdHN1ZoK0NTUmRF?=
 =?utf-8?B?RGRaekFQMlFyTHpJV08rTTY1cTlwcWFtbGgvcDErNzJBeVVKb3U3bGtZV1R4?=
 =?utf-8?B?Nm9CS1ZqNWxpb2lRWWkyRThBZThQWXFBNDVzWTQ2d1hJaXRRTXFIKzdVcHNS?=
 =?utf-8?B?eFdyZ3VoUC94bU1kaitxL2w2bEVqQy9helhGVnlTcEFaQUJUa3R3cXlZTDhR?=
 =?utf-8?B?d2lxaUkwOUxhSGZQZm1zczVhcWdOMWpDTjBlME5GcksxZ3BwZkdWWlNEMHZj?=
 =?utf-8?B?OFgzR1dFZi9sRk0waGZnc2NEWmlZSCtFVzZUVVlycnVzUE12UGlCTVliSzQx?=
 =?utf-8?B?dGhuWGwrdXlVeVEzRGpjb0VDS0VQbTZ1d1c2MnVnMXFCend4cGR6SW84bE54?=
 =?utf-8?B?eEU3YzlhdnZaNlFwN05xREVQaEJYSnZ1T0Nuc2NSdnhZVHNYdmRuTnZwRnpF?=
 =?utf-8?B?RDEvY0s1TUFSZkVudVVuMDdhT09VcjB0Tm9oSlY5RTZTMlZBTmxCQ3JzdVRK?=
 =?utf-8?B?ZW41T011S0d2c2c0VDQzWlRiSVFGUURZcXlWeWVVbkVLTHVsS213S2lvM1VG?=
 =?utf-8?B?WS9WbmNHNGNmdThCcGdBZTBJVkE2ZEVqUVFvcGs3SVk3QTB4Wit6S2hUenlR?=
 =?utf-8?B?eTRWN0pZSGE5ZHJBbE41N3RtMWF0NEtnbDRWVzZaVnhqOHpBVFhVZFdRa2lN?=
 =?utf-8?B?TGp3dWRZZ2l6OHArN3daSFhYbmdsKzRHcXA2RXhPaEZwUkJXRmozSG9rNU1x?=
 =?utf-8?B?SFRaZzZRY2d2V2lKNTFuenBaNXNmV2M5L0JWOHR4N2gxSS9zTWpVTWlCR1JN?=
 =?utf-8?B?eWpPZjF6ZEtucEZndCtQVC9ka3dlcHZoTnRxbllRR0tPeWRyWE1WSDhBN0FY?=
 =?utf-8?B?N095UXJmSjZsNjhoR2xqdGM4aUZXSjdrV0VwS1UzR0dTa3d1WlRDN2krQzda?=
 =?utf-8?B?U1NEMjZvNTZxRWVCQkNNZVNvdTdNdkFGYVFSWHhlUVo3OFdHQXVaZGRXVmh6?=
 =?utf-8?B?QjVQeWlOd3VZVUd0WDRTQjVOczVIaXV2TVlJMXRYZkZLYlJ4bkJDdkxnbm5H?=
 =?utf-8?B?RE5SZXRsY3R5TW1oNHQ2d3hWcDE0b1M3LzYxQzczc0JyRlU2MHVFN044QkNi?=
 =?utf-8?B?ZmF4SWhBQzVKdkFrbWdwQ2VyMHNNSmw2SHZ2bXBZVmZuanFjdmkwTndteXZS?=
 =?utf-8?B?Qnk1ajBRcGVwVGFNY1ZUeVRRcEFqQjl6bENMd3dqNVJKaW15QzgvZDgvaEk1?=
 =?utf-8?B?Mjk2amkvc3paU3J4NmtnVzZTazJoazZWNllXTEswY1MrVUJ6Z2hLdCtRRlNZ?=
 =?utf-8?B?SWt3RXhmVEpPbVBkL0U5dnZCbWFBMFp3eFBvTU1wS3gzbGtoaDlzZWpvS0hh?=
 =?utf-8?B?dFFoRFZPdFcvU05ITkdxN0hNdm1ZRTNtdG1yc21NREJQellCTFo3eFJnMmRt?=
 =?utf-8?B?WXltUWxvbUYxK2JqQTR0QzlReDhKN3c2cG5tN3d4czhpMm5wNU1OUnJ6SHM1?=
 =?utf-8?B?QWdFZ0F5ZkpOdDIySzAzRUxYcWo5cjFCa0ppakJpNWNDd21WVXMrSmpUcW9V?=
 =?utf-8?B?bVh6THdqZjEyQ3FMa1lTTXhIOEZhbW1ybUUzenlyK20vNXBGdkRGanZSNmE2?=
 =?utf-8?B?OU1ieWxXajNNTy9kdkxmdTU5VERJdFQ4R05NTlkzb3pSeGUxNFF2OWRlOFZh?=
 =?utf-8?B?Wko1ODBYelFwTTdmUFJvVG9kaHNsc0hqb0xwNmJEclJQVWlmdmV2ZnFiMGpQ?=
 =?utf-8?B?OVNmbjY1TC9RN1JJeW44eHZoV3lGdDV6cjBTN3RqYWRadmVPQ3JQNHZsNWVI?=
 =?utf-8?B?bnc0cVYyaVRxTkt3b2JraGljZldVdGVKUjA3bWVKeFFMellEeWxCbldOdEFx?=
 =?utf-8?B?ZmZIRUs3enpVOHo4Z0g1Yi9Yb25ML3lHaXpSdDlGcG1SR2FWbXJEeFV2S2h0?=
 =?utf-8?B?UDNkeldxZU5Ia1ZUdnZuRmxOSVR3MU9Nam9FT1lnUk9zOUFHSzc4S2VVUlVa?=
 =?utf-8?Q?yB9W9917qaP8nHCsCvwE8DBN5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0637195-1229-4813-a85f-08db521852ba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:07:42.5224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELVHirba2NNhQzrQLiVTo2rxZzI9dVCgxyTCYbGPx1ZXzqKUmqVNUReGfFIc42TS8F7cycpcbfJSVqgg+0gPhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500

This controls the driving of IGNNE# (if such emulation is enabled in
hardware), and hence would need proper handling in the hypervisor to be
safe to use by Dom0 (and fully emulating for PVH/HVM DomU-s).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Really this disabling of access would want to be conditional upon
     the functionality actually being enabled. For AMD this looks to be
     uniformly HWCR[8], but for Intel this is chipset-specific.

Port F1 (and perhaps also further ones up to FF) ought to be applicable
to external coprocessors only, and hence are left alone here.

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -515,6 +515,9 @@ int __init dom0_setup_permissions(struct
     /* INIT# and alternative A20M# control. */
     rc |= ioports_deny_access(d, 0x92, 0x92);
 
+    /* IGNNE# control. */
+    rc |= ioports_deny_access(d, 0xF0, 0xF0);
+
     /* ACPI PM Timer. */
     if ( pmtmr_ioport )
         rc |= ioports_deny_access(d, pmtmr_ioport, pmtmr_ioport + 3);


