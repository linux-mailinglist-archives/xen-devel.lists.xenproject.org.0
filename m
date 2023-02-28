Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5656A5627
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 10:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503193.775391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWweI-0007OR-V0; Tue, 28 Feb 2023 09:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503193.775391; Tue, 28 Feb 2023 09:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWweI-0007MP-RI; Tue, 28 Feb 2023 09:51:54 +0000
Received: by outflank-mailman (input) for mailman id 503193;
 Tue, 28 Feb 2023 09:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWweH-0007M5-LG
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 09:51:53 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85f01fff-b74d-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 10:51:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7846.eurprd04.prod.outlook.com (2603:10a6:20b:2a0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 09:51:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 09:51:49 +0000
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
X-Inumbo-ID: 85f01fff-b74d-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtlhpHPrV79o3YLAdv2k8BVo5reblpiAg6ep61gfjvHgfToahqHD7eWgwWp1nmcSFudaV89t3zkt2Y7cE4u3jBqauBHb3SCdIDHNv2+0Lo3J1ErNzEe8q+TNMWAjKUxJZsS8RNYwEWTvcyGnAZQx2EKaqAy3QV8JTHcVR5ZnFWGWHwGVLRSLSxzxl4bReIVxFTHvGJSoQVDEabRxsAvHlosojQSD+78MX2dc+JC/Ix9QgFxD/FKjEW6SUjLv42p2PeSwAlNmGuRwD2OJOMUI4Mwzw6tdePmLnEqKcgC1PyMGU5KKqDj0nnCcWMvSCLeMPhhG1pHIBNHbuMkh5C0m8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pdlyHaH4pBbO9XFUj7diphk7rtBCqFO2Dob1yEyk74=;
 b=Ul0wC7jWKvzkXwqQFZn6Nboc5muU96GNJ/Ncj5LwqfSzsu+PhoNn8qzS8GJKzii1xzNKTD3IQzXdSURPW8dKTjjoQdukaHLcj0jG/HyHbq2KQsSzICVpgwtplniCC0vH+6DDnCmmnlV9kedKWwtKZ7oKm7v0UN4MMb78p4yy2fJovzcZkJDnC9H8p8oIiXhjaKyLGSLEKhxBFfNoLjRJwMxYeE+t0b/yExivsXymB+0OtRelAYVdIdoSczn3EPQqnZaJBR+8ChJY4higZb01cYMJx1zp7Whbhlmz6a9PKivSVPhSaZfTdLARItmT3kralP7w4m8r06qrmrd2K8MnOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pdlyHaH4pBbO9XFUj7diphk7rtBCqFO2Dob1yEyk74=;
 b=LCv7IqpAWp1lmBMhx2wOVDRPsLjOXek5Mxtp/adedIlHD4Ast4lCUZ8bwJKciExeic6djWwqO1FLxbPUrQvjt42tKR7ApfHe2jVcixw0lscB8enG82gqpIIBSuUczLIBeCf1uiyBPy6LSWezuhIUyAEXvBgZTYQiqptooO+7mv9PhkT9VY72gOgdmSf8SQW8wXVAxNUxs6pWmCrWQ+mxCcDTxng55rv2WssmFjh8QXoNNqJAmPY0a1oOJFrY4pguM5xxVgVgo19HphyBuGFp+Ctu9IPIsCTKMBxcn3NQNPZsU8rfHz43w8ndJ8VgQ90XPIC/8aehTdFV4lKIhpW0KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52cdcad9-cd21-1132-ca9f-ba8092d649a8@suse.com>
Date: Tue, 28 Feb 2023 10:51:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] VT-d: constrain IGD check
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7f81c6-c96e-4ce4-cad8-08db19716911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ttg4PrNIGf+6c7vSlIBs91uvL9qhidGG6kYlO3rxb+3NPeBuH6/hqi2zd6V6zO2pm7IbsffnVvENE6Zl1S1mm7HzvK72VbiVl674Ryz6DvQyIgyqnmsOUe2zg+HtyuviCjqywHG9/Td532tjMSOmLHUA44tzwOXg08FaA/jRYZf9wZP1VFS+EtjDkvP/U1QL/Grb8DQVQjdKZDQBzxd4+2WzlkzhEJA9Tf4fRqXM57veOJoIeC4OwfJ8V95yDrVCK6SJ0Sku5qwMmBzK3oNK5LrfMu4ZsAzXi92GUBLq05vKvuqvcyvhAiCBZCiEDHxdVbUo/BGMkKvDiPgRsLBeeJ/RDwmb44+gjpMMA4hmgmy9ISWGbm7MzwY6yY8c7byZtLC1uSj3cJGdL/aTmvZs7tF2+FKQDWTxnCaZ2X/cf/vw9a7LLYdaEhzwhRULs1pjTMdLzscw6HKRQjcjuuh9EHrNeR8fy6vfbcBxWVoEN7NOSOdD6yWlKLWDhEdnlco0ZDbSWHrpkGx1Y+5qVQHrCdu5Ylyqtvno5SmM+WoCEZwNzC3v5OvKKWnp2HQ+BU+hyPViyV9cZO8E+fU/9+fzx93NbDmvPrY13Y4+V0r0Hwfxp9syAPO/IlIo5NQrPSwJYoYa6kMljJaKrHKgd5qOPnInzCgIxlubnF+wu54kmfLWbcgmBGJdXCmnAaeqFjCSA/vQ/FMSvlhpVRobtffVVniZDL6sHq97X+Qo6SreJAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199018)(36756003)(2616005)(26005)(186003)(478600001)(38100700002)(8936002)(41300700001)(6916009)(66556008)(66476007)(86362001)(31696002)(66946007)(8676002)(4326008)(316002)(54906003)(6486002)(2906002)(31686004)(5660300002)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkVKT294VURXczQ5YzliR0Z2d1V2cjJMOFhjR1ROSzdDcTlZZGN2N3JtdTlj?=
 =?utf-8?B?azFyUVdLMGxIUVlIVHJFdXd2MkZ4Mjg1eE85cGNQTnBiTGVBMFVjOEZPNmtG?=
 =?utf-8?B?UmxmaVAwTVJZQmk2RlQ4R09BbitaSHIvY0NwZitiZHVidlVvdmpiclFTREhs?=
 =?utf-8?B?a2wxdUJYQzN5akhCaFpPRlpJekNKMjE5czFyWUFQTlc0a1FQeEtFU25UY0Vx?=
 =?utf-8?B?eEh6UHRQWDZyT3lNU0JDUzcyMi9rVG9OL0Q1Wmx6cmlTRTFUbkpYa1NhVW5E?=
 =?utf-8?B?ZnNwTEtsZE1oVEZRTlc5aHlXSDRyMzUydFZDMEw2NUJnTi9NbEgyQTRVWkNo?=
 =?utf-8?B?K2Z2b2VsRVJCTTZQdi9pd1llWHJTc3kxdm1mTmV1ZUQ5V0VFVXVIODE1R3Jt?=
 =?utf-8?B?QzVDKy9VQ0Qrbm9rZFNCKzBLWUtCM1lYMzZCQytRYThzSWUwelpDVjZYN0R1?=
 =?utf-8?B?ZHBkY1ROYWZSOHFTRGhJckJaWkQ1NXJvcFlzWEl3ZFIzTW1Kb1dtM1BEY21U?=
 =?utf-8?B?WW93a3RSVFdtd3hVenRqandIRjZEMjFmS2dEdy95c2ZMaFJhcG1ieTk0dWxR?=
 =?utf-8?B?Wng4SWpPbDRMQ0czeFp5Uzg0Znd2YlRzKzRha04vYldnZFlQcG9VV0pkUjFO?=
 =?utf-8?B?SE1EUUVJZENPRVFNUkJUazVxeXJvU1FSZ2dkaGtwWUNqSXRnSjNHS1dBTko3?=
 =?utf-8?B?cGpGQTNvY0tpeHZUdy9WdFBtcXg2YzlxY01QeVVVUzhkRmVWb08xYjA2YlIv?=
 =?utf-8?B?dkJPN3k4V2FCSi9XTzJ2MXF4bTZKeG9qMjFWMVRoUHNwNXh0TzJvR1pnL3lp?=
 =?utf-8?B?S2MyUmliOHEvREFvY3d1L1gzbUtoS2ZuYzBHWXM0dS9RMGVvM0JJUjVoSDVR?=
 =?utf-8?B?Y3UrYTk5dU9vaXFPc1FtYzhSeDVwSm1DZnV6eGRMWUdVM3BERFhtSW9pOUtF?=
 =?utf-8?B?YWVjRXdYdjdxL1pua2NKVUlxR2dTTDUwZTlZQi8rbitBZjFwUGtMWDZINDV3?=
 =?utf-8?B?WTJhMUVjSTI5Tm9vYXl4WnNndzl0T2hRUnZqQ2dESnhZVldwRjdNa2srT2V5?=
 =?utf-8?B?b2UzempmQ1IwMFVPRTRqc0ltZ3RFZlRHQ1Npa1Uzbk85bjFreWsvSWcxVDA4?=
 =?utf-8?B?c3BOemoyeGdsU1pXdDZ5RFRic2crWVlibkJTa2tMUld0L2ZIb29lR2M2bDR3?=
 =?utf-8?B?dktUUnNKb2RwVjlwTEJROW5zbU1xNlBtKzJhTTRUK09PV3YrL3ZxNFpjRkhO?=
 =?utf-8?B?OTVnTjBScThBbzVvelNiODhpVGxBRGVNKzhqTFJ1dXh5c1FOVDF3WEhxRm10?=
 =?utf-8?B?ZkNpZ0w0QzVoSEFLdUwvRTZvRk11RDR0RjdzdUJIcjFXMEZ4eTVYQ1lJdGNn?=
 =?utf-8?B?TEJ6elp0UzlmZmQ3NFlsNUNZRXZBSWdBYStmZFBkN1YvdmxPbnlUZkxhemNk?=
 =?utf-8?B?YWFUYXl1SFVoUDV5d0V5WUE4eGRUOWtDajNZRUxUT2xMZDZ6NkQyM2g1OWtm?=
 =?utf-8?B?cTMvUVJEVXcwaW1IVWpoeHZFZWdKRCthTHJYMzZoTFlqN0lWUnNUdEpqME8z?=
 =?utf-8?B?TWVLU1J0TGZ0M1NwVGlIYXhpMm16WmpiYStTNGlnbXEvN3pxdHlsSmlmRDJW?=
 =?utf-8?B?MERqNnRNazlZYlVHTEc0UmFoVDJUaXJIUGRJTjV0Q1JJQXY2NldwRHlick8y?=
 =?utf-8?B?OU5xc3hnUjJ2YmRqR000VlVwTFdLTnMwNzlaTjNyM1pPMytwNGVhemhhNXNT?=
 =?utf-8?B?dkkvL1V2SmpWdkEzYmJBUjFPVUlOU0huZy9ENHB5eGNsUTZaa0JXRUJiRThh?=
 =?utf-8?B?KzFYSDlwOWZvRGg2VWFpbnVsWkJKeFIzRDgwS2ZMbTg3MmRpMGROUkc3VWs3?=
 =?utf-8?B?dUtSMDc2U1ArQXhrUlcyR0RwOU5JRDg2ZG14bks5cnNEQ2ZWMTlNQ0d1Vm1m?=
 =?utf-8?B?dkd4RHgwNkNLN0l4RVVvUGNUVks5QlAzM0p2OCszeGhTdU4yaXRYRlRIaXht?=
 =?utf-8?B?djd6L1N4aldqN3FWSDVZV0drdDBhN0V3SzV1cXVQN2l4QWVPTHk2OFF4TEt3?=
 =?utf-8?B?RzlpSlYrQUc4aXJhd1l3QnhQWkZWR0VXU0lOWWcweW1OL3ZtbjJ5MUZoakgx?=
 =?utf-8?Q?EQ+ysLtgJI7bIX8yABrVY9Erx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7f81c6-c96e-4ce4-cad8-08db19716911
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 09:51:48.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJEJeWxJsXbSoMbiaoB4nJiUFm4FRR3juc1OgX/BKtl0VKN+Wq+Wt0BL2UyUR2u6yrGqEELg9qG62OH7AVSXGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7846

Marking a DRHD as controlling an IGD isn't very sensible without
checking that at the very least it's a graphics device that lives at
0000:00:02.0. Re-use the reading of the class-code to control both the
clearing of "gfx_only" and the setting of "igd_drhd_address".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This way we also read the class code when we don't really need it, but
I think that's tolerable, and the simpler logic is preferable. The more
that with Marek's proposed patch, adjusted as suggested, we'd read
vendor and device IDs unconditionally for all devices (enumerated for a
DRHD) anyway.

--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -391,15 +391,12 @@ static int __init acpi_parse_dev_scope(
 
             if ( drhd )
             {
-                if ( (seg == 0) && (bus == 0) && (path->dev == 2) &&
-                     (path->fn == 0) )
-                    igd_drhd_address = drhd->address;
-
-                if ( gfx_only &&
-                     pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
+                if ( pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
                                     PCI_CLASS_DEVICE + 1) != 0x03
                                     /* PCI_BASE_CLASS_DISPLAY */ )
                     gfx_only = false;
+                else if ( !seg && !bus && path->dev == 2 && !path->fn )
+                    igd_drhd_address = drhd->address;
             }
 
             break;

