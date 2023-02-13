Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F906948C4
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494598.764711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaBs-0000RW-9s; Mon, 13 Feb 2023 14:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494598.764711; Mon, 13 Feb 2023 14:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaBs-0000Pb-6u; Mon, 13 Feb 2023 14:52:24 +0000
Received: by outflank-mailman (input) for mailman id 494598;
 Mon, 13 Feb 2023 14:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRaBr-0000PV-4s
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:52:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0532d2af-abae-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 15:52:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8378.eurprd04.prod.outlook.com (2603:10a6:10:25f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 14:51:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 14:51:52 +0000
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
X-Inumbo-ID: 0532d2af-abae-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6yxHOstGHZui11p+BdH729lVFzxyI6NS09pGAmv1l8h8A4/h29OzNI18dy8jyf9MTNeh5Pw5QVb4g/qvryF0BYTB6KtpwaeEgZOANrUarP9xjCnztip5ICqK1yMsWNguTD0lbLUR4fzYOxo9/bwXgUcoJm+E1+dhOdH5pldu97+i7W/WxfmNkSj1Bk7oYLWtxnp0HZBUjdNOUlVudoERh8Yp9S/yMSuDgNwiPjXUkDAaabNi21wGlwRFCaxnueWTvK5CP9gnk6RPXgsEuXH5LcAa/8kK69SVxioII1Y+A6IMdHAwtObeD/iIH72ZRMBSaFzJ1zMkfteTcnUTlXKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShS9+tjms6qa9jf847ybPoBZS94S1cWmOo2Zxm6z5J4=;
 b=i8WdS4fmedNMIxtkTtXW9vSxdn6PwCplxx7Nrsutxla0QaGTBuwJcbalXHh3YBmqFrTQUD7Q1Hb/oSGhYS7XZBFjbn5eLY2sjXdL1/Q7PyILYVsdAJc4NetCiQfHuhcpzjBhDohAWvUCxpZpa2A8qXfdtjLOzGdy6WHnb4peM8s4AKw0RJr3/yr7H2JFvL6zn9tDDI4+L0UnyHNdo/J/LGj7wRQvYxGxyzWwc2lMB3MCC3g6ElSUwcU2z4H02Qc3gcy5adW31UL2ynYQ02YPy1Cht9s4kDVCcEwEmlEatqCJsfWbuSalJZ4j9xvwmJYEfTGvxurSrhGfxHNTLXmbog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShS9+tjms6qa9jf847ybPoBZS94S1cWmOo2Zxm6z5J4=;
 b=P8fwGnjTQle9+qnYq9uH0i1OkRyXrcUVlFfj544HgZBXA7d384qKhJICT5P30InGTL5gqOViu8E3Qvx864SGljqsiJv8jAoFTGYVz62/r4Jg5cIfTMZV66fA9ZP5KA/NVAL7XBnKetocgBAY1VO6wVO662//ccJvrSrurIiPLY7mbGhfPekqUA6/t2JwE+slW2QVFoF3kLELoC29ZhtDaL7wi7MzaknbWnZNVVRHgC5GAD1UMBu6Hkck4JUr2jVek2JVtcu/mhyHm4fVI4hv7rGMpg/c+XxGR1au31+FgFETMxJKX9ts0//dmjMcLJTUqlc5jAqY/UKJIWpXxqdjuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b1250f72-d268-7bdc-2381-adb75f958ceb@suse.com>
Date: Mon, 13 Feb 2023 15:51:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/platform: make XENPF_get_dom0_console actually usable
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc6c387-3bac-459e-115a-08db0dd1d7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QmleFYYnlJXoLbZTJtUHNda/sccf2L42LElPuvKc6KCbSi06No64NvPGeNprjSNZlPRcSGNcPqslbhJtROsbYJrMUQuNiDsFtnqwbRBKIaqrqirSwmaLl795p5DgOtX+EY5gVRPnSx8eR45VZ9lvkE+FsyQeH4hXSwBdvWcTWcaOnlG96d7fwsOAZpj384H2ph0OxEMLFkV+gSgX+SGgnD/eIdAbhNmcYVKS0m7P8BNsVREEIW3Ywdo3cEuKiFTAGEtPwe7Rz581CkDcC413RcuYdptXqjoqCcZh526DHqsusWomPLLAmc1R9yZ2cXm62ZsXShUIGn9x0TDmuF3VGkVu8vEACgdQXeUEbs76V/Rn8mNPUHdwpzURVFxbZKueQtAa+AyXlyc9D5lErmxuao5lk5x9PITqqoLE0uTHrHzBakDE0CEy1zNBnEL/WzXe/MZf01JV5tRVfwkvsRM1gpcvnQs3O1tXX5k80DwpCKhuUhA8TfGsdAobypApf+VBiu30SfipwLpIFXcg1tCpzixZ5S+TeFIbWRWTgROc/v7yfOY2g13U32MaWNIALOi/gtdYlr9k+nJ50FpM1Cy7hq4/XabMOUh++iCEHXxsb8szDowHKGv9jO8Ii8KHb7thll2JRRLeflqibjSbv7sa3gJU7TAN+QhUS3mTivgXOX4awovQVtoNYp4JDrBgplzW+fu7xQPhkZJ7+ao5NzP1Lq+R9Yt6DIFJmf0R/hcD4vw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199018)(31686004)(86362001)(36756003)(31696002)(2906002)(5660300002)(8936002)(41300700001)(38100700002)(83380400001)(6486002)(478600001)(8676002)(6916009)(6512007)(26005)(186003)(4326008)(316002)(54906003)(66476007)(66556008)(2616005)(6506007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yld2dVlOZW1XdmhRS0ZiVXoyM1orSzRMVTduTjVvV3N6WHIvM1JmY1lKZjBN?=
 =?utf-8?B?c0RITGxDWWJ2TUFXUVhnVjdDYzRQYXRhamZHSHU5L2dwdGJvZUVyYkYzTzdw?=
 =?utf-8?B?M2lVek4wcFR5MkhHMG1uWGtpS2V6Rmw3VnNTbHhxTXI0QUtLNXRzeUFoMEhI?=
 =?utf-8?B?Qnc0TEZwN2xHZld1ajA3SkNGb01zOUtoY2RRRUhDd21RSEJEb2hKcHVteEZF?=
 =?utf-8?B?TXlBQ3Z6TlJXVXNOSTNnbWRyaVVqTkg1dVZXUG1lT21zNFdpdkNxYlB6TEtw?=
 =?utf-8?B?MmN0VXZpSUkzZ1hWWG0rUGFSRFZYenRYWjArMjgvSmRBbytPREtVdTBzVjFw?=
 =?utf-8?B?eFRZdWMzNlhneTdkeXFrSXhTci9CSy91U2VjY25xaUhOTlBxaDVCVDZYYXUz?=
 =?utf-8?B?SWkzanUvbFNBZHhHc2dtaE9rNXQ4QU4rL09WZ3JYcFdMcVBwc05wczZJY0wz?=
 =?utf-8?B?QWsxZmpJSGFHRWZMZEFxNjVNSDM1Vi95OGV5VGtRRm51ODdkNzErV0FKajJj?=
 =?utf-8?B?b2xoTXI5aHoySngxVFZTSkpSZHRpSmF3N2xrTGZta0RUeWI1ei91WEErdUs0?=
 =?utf-8?B?Y010ZFNEUEJCcFQ1dU1VRDFxN2d6eUNPeDZGWCsvTGNkMmlJakc0NkZzSlBW?=
 =?utf-8?B?QkxCdU1Fenl2cW1RSkpSYWpTWFFXK0lXanZRbE56SUVQVDBzRC92T01ZS0JB?=
 =?utf-8?B?RVZ1THRrbjhNWjY0Tmg4djZ2OXJRL2hiY2xXa0V1Q0VSaEh1V0tCUGdzTExY?=
 =?utf-8?B?eWk0eFl0Kzh5STFuUUhPUXhEaFJPSmdOelZ3c0xkZ25URWJmVVg4N3NjNkFC?=
 =?utf-8?B?MTcveXhWSjVCcWliTDhRY05YYm1NMmpqWkNzdlkwWm9aM2NZb1NhTWFRbHQ2?=
 =?utf-8?B?QVlUSmNGSnFZUEZ2ZDZTaVVldkNGNmcvMEgyQTZvWS8yZno3V3B0MEVwMjNC?=
 =?utf-8?B?S0VTSVZQM1dsakcxY09BYmhDVlNxSUErNlFnNUJKNDJWR3o1WExubmJRMVZD?=
 =?utf-8?B?RHBXVEdQMUpkTFYzbG82aW5lcWJtenVWWTcvaFNIK3hsZjlnSjJTSThaY0N6?=
 =?utf-8?B?ekp0aDBZeDVoWUhCSkh5cDRtTHkyUW1YRGZIcS9MQStaNjBXZ1hrdkt0Zlk4?=
 =?utf-8?B?UzZYbnptajFRZFY2dDFqUDNTSXFHV1N1OVVzbERuZTZCaGdyNnhPMXl0dEJ3?=
 =?utf-8?B?VDllZVZGSzhpTklLWmY5MGl0d1JGQnI5TlRUcTFKV2U4WGhoNGtoMStIVFR4?=
 =?utf-8?B?U1NYWnhRQ3p2alZMMHZtaHBGNjF6eU9wZzlsSkhRdmFHNC9yQjVkRHkrWXZD?=
 =?utf-8?B?VEZWWFFOakxqNk51SU5nN0I3VXZ3NWtRWmo2c3A3eWlCOHJubU4ySThNMmE2?=
 =?utf-8?B?ejNkTGVqQUhTOFhMS2FRdlNWNUE2L3NzZU94RlEyamViSzZOSkVzbU4rdW1o?=
 =?utf-8?B?UjVkMU5FVFhkWEdQTE1wamU3cFpJaVJiT1NIdXdpejc4Y045citTTlA2M3hW?=
 =?utf-8?B?akNyTUY4dGdtOW44VUJKNCtua0d5dXZ0emZ6M0t6T2MyK2ZtS0oycHZRN2s4?=
 =?utf-8?B?V0lNN0J0MC9zM1hVTVFaZThDMU1xem43WUVyQ29lMEkrajU4bE5Yb0NrZis2?=
 =?utf-8?B?b05JeS9rVng0TWxFWjR4c2Z3LzNSamQzN2tyY1YzMDlpZmd2NkVUbU9uMXFy?=
 =?utf-8?B?ZkhZVlBVeGJRUEI2aFNDYnBNTndUYkFQdVRkc0JPaitjMnovZ1R2YXIzRFJu?=
 =?utf-8?B?b3A1K0lQNXQvS0dhOXp5QTc1RFhVU0ZPbG9TeEdZSEFxeUVoNDd5aHd1Y0VI?=
 =?utf-8?B?YTBSRzRVc2ZTRkE0bjJyQzNwQjFLRXVCb0RGM1YrNDVySHBFNndEQnp2QWhB?=
 =?utf-8?B?dDM4RjRQaTNqZzNIQzJtY2ZsWldwSTJRdElBdFJMWlU3YkNhd1o4SGV1bmRF?=
 =?utf-8?B?ZnplZ0xIOWVQSnNDUUN5SFV5aWZzZVpUck5Wcnp6eDZVUG1YRmprcXV0M0Zu?=
 =?utf-8?B?eHBIMVUwbFc2V1F4WWdDNy82UktvZ3BxZ1dlS053MTVhSFBvQU9wK1A1ejlG?=
 =?utf-8?B?VWVubFpWUXVORDltdmNsYjhMNWhrSTRiYThZTUNIcE5jdGpmVVEvNGdMeENF?=
 =?utf-8?Q?bYNWBLQoaJBAeL52HRKkoOc4H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc6c387-3bac-459e-115a-08db0dd1d7e1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:51:52.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqwuro3Sv10lyp7Tz4JnGaJRgee6/FPgvv7RFxwkvEPLesL+8WhQpepwco7ZaVfPeGTlqHC0VC2w6mUM6Xo3YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8378

struct dom0_vga_console_info has been extended in the past, and it may
be extended again. The use in PV Dom0's start info already covers for
that by supplying the size of the provided data. For the recently
introduced platform-op size needs providing similarly. Go the easiest
available route and simply supply size via the hypercall return value.

While there also add a build-time check that possibly future growth of
the struct won't affect xen_platform_op_t's size.

Fixes: 4dd160583c79 ("x86/platform: introduce hypercall to get initial video console settings")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Noticed while trying to actually use the new hypercall in Linux.

--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -841,6 +841,8 @@ ret_t do_platform_op(
 
 #ifdef CONFIG_VIDEO
     case XENPF_get_dom0_console:
+        BUILD_BUG_ON(sizeof(op->u.dom0_console) > sizeof(op->u.pad));
+        ret = sizeof(op->u.dom0_console);
         if ( !fill_console_start_info(&op->u.dom0_console) )
         {
             ret = -ENODEV;

