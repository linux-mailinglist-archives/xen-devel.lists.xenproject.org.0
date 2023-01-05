Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC20965F0C8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472036.732132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSko-0005Om-ED; Thu, 05 Jan 2023 16:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472036.732132; Thu, 05 Jan 2023 16:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSko-0005MI-BI; Thu, 05 Jan 2023 16:06:06 +0000
Received: by outflank-mailman (input) for mailman id 472036;
 Thu, 05 Jan 2023 16:06:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDSkm-0005LZ-Ad
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:06:04 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2068.outbound.protection.outlook.com [40.107.241.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9cb5a9d-8d12-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 17:06:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8046.eurprd04.prod.outlook.com (2603:10a6:102:ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:06:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:06:00 +0000
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
X-Inumbo-ID: d9cb5a9d-8d12-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK0twxZG6alBtmSSizwcYEyh563fpdxnpgziu3kcb+CZZ8IDa3K+w4U1anaG+W5B10VvmEUVzSq2++WzJjigo0XK4vSOicrqj0v7/FMvfiD/mtB4i+4DroFTkkLtV6kwzHTpAg1q61qYzpZinpL1gKcmbwwq6Hfcn5fasTL+8vpHh3MfmK8DkW5E9LdCmFpbgcmPIJa0m5wFw5cWxwgfkR/fG+0Y+p+jAyzm3fngBE/6TGSnp24Z07B2mgE0DvT47/AbpyVEmyQYoJFFdR7fy3/V5EyLlbboWGEUM2LwcndOzE4oVF0zW4lmyV72gemtGWqdkNl/uYstkh85iSql1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp/xRy5VT94YqOsqdM3hhLWnXJKhH74obPOAkyaCA0Q=;
 b=clxZolyFyrRJJ2KxqPgWzTGcPFh0Ka8PidOk5WXeoMN+a3lbNJxVedKEhiMtnQTLzaVNXZbt+L/sXRhqvk5rAD00BJvW4k7n+aeUbwZ8nuqjHJcgbfcazVtxF0Gy2AcYkZF7btAfAsAiyu2+xM6kFVtHvPVjz6V3MZSDfOIcItJE+15VvOCeDYJzJqu8GF5BYLnb+RAcQ3EHydRgnlw4GaAtzgJEEmtZ4VkSWJ+tqL05jcRr4TDgrx8RfuNmBQROOe4CW5pd77vgdVerYIVJCAcQpfjWtF8H6MN3V3UmMOPJZ3zDx2Qg+khE6ioIXnA6jKJy8DuG4OGx5SOEETi0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp/xRy5VT94YqOsqdM3hhLWnXJKhH74obPOAkyaCA0Q=;
 b=wY3IacouTb28PDk+gWcXEamSJDS2A134FGrYIL0baydIR6X0TvXOQWNCUKq4VtvoPY7DyuwI2t5+r1u/qmEAasK5h8iT2n1epbzlR/A3Y+9FjykMmxCbpc9X7tbVEXMc4qJnof0BAzJfpWjngIkpmPNFamKGPP+EGFe6lzReulrfoGsIgylPajpULKo9SV5pTcZkCg5WOUmMq4KCyl17pNCey9xjj4iOa04hYI4lutWYL7nite7OBEjqP1XF7nUy3Q1xqvTEwErOCqRIP7md4JhplgA58MnyoHRFufh+SEjrI1P7mYzILrckaew0fm2lAGEp7JJ0knKkXTQbYIu+nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <acf0f5f6-f4da-cd88-1515-2546153322b4@suse.com>
Date: Thu, 5 Jan 2023 17:05:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 08/11] x86/shadow: reduce effort of hash calculation
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
In-Reply-To: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ff1aa6-ab3e-4d85-38af-08daef36bd2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KhmN35WnVVCHX3NTS8nYQ8roJdSOC+NdLb/oE7FghutaIbMflusxce+Qa2o9/ePhdtP7fSb6npkm70rH99J+SroCKqom1lPPQjYAfCDw6n+J3CWh9OqPXXVEWbXQXqufrAZgBxf+wsbDWwLKQ+LHED6bps0cPQUO2Eb/+ng16H16KmMfu4R0hchihMPwb5y40M13/q2CunrtLxoKEmRL1B5BSqBlcRJ/Mtk+bPpjAZ+hdk+FhbFx51UeE0aF1SzpEcTHCHFgh6xL1AfOFl9u1FMhGqy1b1tDC8B+9zAKk99PfFXhuaDTmJ6ZBkbe12qZTxy06z4XFEH3kc81Lkd2pFFLxo7tPnPLjiJRyaPvww0f6hXlfKtJ40Xe83tN1fdsT3AmCRemmZYB2JUx5s/uHhPEYe2OyewMpFa6JJb94QEdWnbbgusXidQUpWAjmOGT7agQ2lEHdSIlhPtuG0oN+4ckDMXZwCKUkH8swTLm00SMQcfp+ruSjmfDQuJhv7LJ3PSzF/6IilnfmXe0yqk6iXPMWwc9giR1VRZ1EltKQjqokrj5yLkvGzjHAXwgOC93A1m5iFvDSQXvU3dSPxG447K7lg7HCPw0tSztI203dMbIkWjAfAVMAkf/lE8RQDukxX0Vco2gdODinfQ9UnSUJ4RSA1gO7zk4Gslb3D5EX2KeR/0qDaKfx6bUzjWqyn7EcYLaCbkkM1/9UWsjO62XKFsw/rrtRLnlhadZEOPpJSo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199015)(38100700002)(6506007)(316002)(31696002)(4326008)(86362001)(66476007)(66946007)(5660300002)(8676002)(2906002)(66556008)(41300700001)(8936002)(6512007)(26005)(186003)(2616005)(6916009)(54906003)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azU2cWxwMXJkbmtUWFIveVhubTVja1NtKytQMFdFeVQ1REtEdDFUbFRnaEtv?=
 =?utf-8?B?dTdYMlJzUGxLdlc3NlZ0UEdweEtQNklqcG16QUVrYVkxYWdBR3VreE8yYURE?=
 =?utf-8?B?U0pPYVE3bExqTXpsY2wzTzhqL2NDWTJzK09iTlF4TmxCZzdCazg2Tm1DaW9u?=
 =?utf-8?B?aEIyOG93eWhNd3lnWThTeW0ydGR0Yk1sY1R5MTgxdm44bXlwWTJ3eVo2c1FC?=
 =?utf-8?B?L3ROK2NYUjJicU9wTmYyUWt0MDFieGJhemd3OEkvaFRiUHF1VXp6c1FBcUpp?=
 =?utf-8?B?ejRIUGdlNEY0MUZxK3R6a3VwS05KTkUxQWh4UWpEOVB2TXFKZExXbE43UWhU?=
 =?utf-8?B?VVloU3U5SllBQUdXZStCZFhjK0NhUWpBMXF2ZDd3bkhQUnlydlJVRnR1dHZF?=
 =?utf-8?B?RlJPOUR0MDBkbXp3cHFGVzVlZGViQ1h2YXMyRkVhcW1rbXM5bExPN2c3TURw?=
 =?utf-8?B?SUdKNDNyYUl4YjRoRFFENUxXeEswUVk3NjRNNHhKQlZSMStQWEZLNW1CYXo2?=
 =?utf-8?B?VWdBaTBCWWJReHYxU0VIRnFYUFI3Wmc4WjJ1aHA4QkF0NXdtYjhMUXI3SG1t?=
 =?utf-8?B?M05RQ3E5NmVMd2xkTjNlNDBPQmM0aWo1US9nZnZyNWtpZW0veEw4bTNLSzJF?=
 =?utf-8?B?cHdyRFNBaldRaWpKSDRTUUJFeTNoZWV3S0N0aVBzajRRT3VwZHBCNnhjL1V4?=
 =?utf-8?B?Q24rdmJtNjQrRndDV3FyREU2S2thS1hLYjU5MUVYTDZYUlc4dlpNVXFsNHly?=
 =?utf-8?B?S0czbitYV3BHcUNNODQwYjQ5SzQrV0N4cXhreHFKK2lQV3A4VW9JY1FmazZq?=
 =?utf-8?B?MExFdm9uaGc5bE9qQ3ExS1NCNFNNRmdIenFWWmo0eXNtaDRCNk1NYXZjNXY1?=
 =?utf-8?B?c21PbnU4RC9sUHYxSzVrVHJsWVZ5Qll0Wnc1b0lMNjlUSDliUVloYUx0ZzZq?=
 =?utf-8?B?aXdlZjJtaDdFazVKK0UxVkI0eUs0NXFkSWhZVjlTV1ZhNFh6LzZBR05KZHZs?=
 =?utf-8?B?TmxOd2VTTHl2Y2pIU1B0WVA5MzRoVmtVWll3dndFTmxDb0dCRlFHTTN2VnR5?=
 =?utf-8?B?RjJyVFJiVVF1NksvSVNuRTA5R3p3Qk5iRVdtMkg5VThFdlJOQTVucC83cGJR?=
 =?utf-8?B?YWlRU3RxNkEydGlUYTZVRU1OcXo2MHFiZDkxcTdqVHR3UFdnZjc0Zk9FMERS?=
 =?utf-8?B?NmJsR25jeng3NlhBbldJbjcrRVVXSFNjbWtGZk1la3ZhVTliczRBNmdvaXdX?=
 =?utf-8?B?bzd0SEZGc2NBM1F2KzZyMW4zRWQ0bE9hUnl3VHViekxjQTZhOXhhclkyUDdO?=
 =?utf-8?B?eDNEUHRoVFpQNmxJbDNQb0hLbnlHcXNTR1hKSG1vWEZGMXIzTldJNndBWHJr?=
 =?utf-8?B?eUl2bUY1Y0pnei9DV0RodXBRZXlvTE5EY0VSQmdFOU83dVB5Z2xWSE9nK2RY?=
 =?utf-8?B?T1VWak94akpRZGt2d2NVTXRYdTZodXkyVmVWcXVaWDhqTXMzcC9nTUJVQ24w?=
 =?utf-8?B?Wnhab3V1VFUxWTNuT1N6OUloMERVWmJyKzErZEJxZllMVlZyNGVhWlFHOER4?=
 =?utf-8?B?S1RtUUhvQVpUV0NhelhBM2FlYVZPWUplbVJNc2hGdU9tOWdhMVNFL1JvYWF4?=
 =?utf-8?B?R1lxa3BJaTdWRm55Tm9mUElTbTJ2d1ZpTGR5YnBwZCtRMTRuK1F3UEYwRWFL?=
 =?utf-8?B?YTY2bFJYWGhSc281d2RRVHExZU5CTkVDcFdxTVBFWEZ0MkVESUFnYXFyZU5X?=
 =?utf-8?B?R1NkUzc5Wkp1Sng2bWRuZ1VCeVZsa0pLMjJta1pOR20vc2dGN21XL1g1NFdk?=
 =?utf-8?B?cXBnYWxRSXB5cnN1VGkvOEFDTFdLVTZtVDQrenhwOTFidTFPMTRBbUNYeXll?=
 =?utf-8?B?bjRZRkl3Qmh4aHNGaUVnZjRrcXhCWXVaQnRxR1c5elZWc1hkeEsvSFNBSUpE?=
 =?utf-8?B?RFhzSXUxdWZVQzBvbFI0SDRUQ3V2eVVxbnFwekE2U3NQZ1lzQUU2djhLWmJF?=
 =?utf-8?B?QjFqYjdtZ3AwNUQ4OWJtQlJITDZOUFFWbW12THptWWpUZ1BJWGczNE9mUFMr?=
 =?utf-8?B?NXJyRlF6WHNveFdIK1lUblFPQk5CU1IwUzMyNG15RDFlU1dCcm01eTJ4clRM?=
 =?utf-8?Q?lzHrdtOdMLwiWmMoK4pJtWXEE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ff1aa6-ab3e-4d85-38af-08daef36bd2f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 16:06:00.8857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LaQDgsNlFjFJCocMBEUkxOUjT0qwE/voMbSmTu3fAN7wtJpxx0dgCsa2Y6wWK7xICqEttpvbeczQIWvQT6NEbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8046

The "n" input is a GFN value and hence bounded by the physical address
bits in use on a system. The hash quality won't improve by also
including the upper always-zero bits in the calculation. To keep things
as compile-time-constant as they were before, use PADDR_BITS (not
paddr_bits) for loop bounding. This reduces loop iterations from 8 to 5.

While there also drop the unnecessary cast to u32.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was tempted to also change the types of "p" (pointer to const) and "i"
(unsigned) right here (and perhaps even the "byte" in the comment ahead
of the function), but then thought this might be going too far ...

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1400,7 +1400,11 @@ static inline key_t sh_hash(unsigned lon
     unsigned char *p = (unsigned char *)&n;
     key_t k = t;
     int i;
-    for ( i = 0; i < sizeof(n) ; i++ ) k = (u32)p[i] + (k<<6) + (k<<16) - k;
+
+    BUILD_BUG_ON(PADDR_BITS > BITS_PER_LONG + PAGE_SHIFT);
+    for ( i = 0; i < (PADDR_BITS - PAGE_SHIFT + 7) / 8; i++ )
+        k = p[i] + (k << 6) + (k << 16) - k;
+
     return k % SHADOW_HASH_BUCKETS;
 }
 


