Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3541579381
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370404.602160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh6a-0000pU-3l; Tue, 19 Jul 2022 06:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370404.602160; Tue, 19 Jul 2022 06:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh6a-0000ng-0i; Tue, 19 Jul 2022 06:53:16 +0000
Received: by outflank-mailman (input) for mailman id 370404;
 Tue, 19 Jul 2022 06:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDh6Y-0000nN-CH
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:53:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60044.outbound.protection.outlook.com [40.107.6.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 753dad94-072f-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 08:53:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4864.eurprd04.prod.outlook.com (2603:10a6:803:5d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:53:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:53:12 +0000
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
X-Inumbo-ID: 753dad94-072f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cof2+GI8vdZpaohoO4bHksTgSIk7nXYUWbGkWeUQum4/Uo03rAa72EzUXT49YYxRkc4E5nk4OZNzzmjTFUqTdjbL7VTWogbxUc7zdWPkXAwZge3l5E+KK5YGCJr+0NtWfgbePfr/tYjav5+rqlygcnTiK9REgq3Td6ePrYZ4Tcpjq7Z5SORNVe9/r/j1e0T9qXran8mleAY/mjW3dg4LlUb+X4vSTFJHFTrxkb23gdDROh5GP8IGwi+Ew7F8JyDA4MYWKzeV9UheqsZ3M44jkzW/xEnd1iwy/jjrGbwPudV1Sw9VS6/++mLmoelsHAXh8SYHJ5r20bZlWGw6MZa/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMkmvOzz2gve8PQhJ5TEoDWHfH+EBc0eAdwOWdZ75oc=;
 b=H0QkQ15O6z2hB7d6y5bfj/gQYt2pcScS4iW/Y9ktj0omWg98JNuq7kccpKhzvYndwZYA0aTm9cJFFy0vWfnu6GDGcYpQl1Jiv4D6tqjGY4pqVroJZa3h4ym7hQWuY1RtBLZzVeZrrc4AIH6kHQJpjAMGlGIaOTuGHyQo9FrYV7o4B8c6IBkyloE+kKnOkQASJ5XjUKtS/2VZTcgMEh8y0x+tFHT2nQdeekE3GIt2/fxSkb7UqQmUJdT9PdGLaxbvXkk8sHZkTwpCio8FkKkR241Hztcu+U2d4DDBcdzX8TjPn/GGcZTcxiw5eZoe+FBSO8BnZJMhP8v7MVlTsx5YFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMkmvOzz2gve8PQhJ5TEoDWHfH+EBc0eAdwOWdZ75oc=;
 b=3jPH/gn43Z8h/ZZODxn1/6nWKpuD4N2xETUzh2HVbuw88CB61+hUuMVUO+695BNWHgbMxZysvv5751f3gEwh2KsZhhCB0cxvtdGVIpHVrohoPixdVvDB1kwY2P0frVmls6sXyfZsAbfSZnDAeEbUm02iUT2b7cIJFQGXtM28zuXGxICd43qOXUG/G3712MItp1CE8udezrjGCKgaSD2bsCzoXmT+WAGuJeGiSpMyNU8Ew9XcV9YNWrGAeOrgghLH+AchrAc8vLECQSEVQYZJIGV3Hro08/RDJpBkKxFxR+AjkYxGd8S/lHCVY0noWIe7MDQ9ERlxX51GjEtaoGRX5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a64ea351-ba44-146c-7999-5c66e00c77d0@suse.com>
Date: Tue, 19 Jul 2022 08:53:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v2 4/4] x86/P2M: allow 2M superpage use for shadowed guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <1c14781b-e1a2-e049-c0ea-a12585f74e7e@suse.com>
In-Reply-To: <1c14781b-e1a2-e049-c0ea-a12585f74e7e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0079.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 920429f1-9e3c-44b0-d3b0-08da695358e0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4864:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pllr3zMcNAjKGYKwrdZb9/B188Zpm/8+8Zdne288su+2nOgaevmjihyjkyd5e6xGh7aRG2xX80Pr7LTcDk7UEQydUpSLTbv4vRBDq4FKjEsioMiLg1oKrFVScba17JmwGzE+ALhC2oa2ZtUw+PW98cLGO6HvAlm7vJTVDLofD6cVKGjRSfq+f5y1t0i57SWfXADVF5TNKMoH3IhXnUzsGkhjaPbtsLUfeGGmY1I9E6D92CLy99NENMmP/YNrCKcJ29RXWEvUPgRuOIdgFbg9K4m8c+VWpcJsBrGWpZSG/D6bfiIvEzRgeFA66MAXE3xmISAnDkybJIht02hXQFM0i3qL7zsrrvwibZpoXwfhpHQ2njbepGaQ1dGYRtlXYHoKD481RLab8J4GviCVNksXp9+udVP5BqDfg459QJQwhG9t9OOvh4u2WLFelVU1WeaCW1i07xHh1yRki7Qy/mtQblkoY5EF/K2rQxV92poTvj4RSEDBdP2/1teyeIDx31ljMBh2hZshJPKcUKRGYiNsyfJq808FyxwweBjKea6cXHzpKM1CHVIu6Bj86iNJ1xYD+UVKT/EcOhx+TruhqOvss/BXaGMEV6u5NmG6nK9b0MuqunEvX9atJQFZGuyo1H8KVOppY+mtaeOsIhJAzfGGXKc49E1H+Zs0voZHO6nQc2E6/xZOjpYnajCaOSZrPKqj38Jfe0bsHz3u+ggipq9wuwqXLgnfp2AMMl35kw/hxE19ZYPRSD/w+WKqnm4ik7LStCO0CqINE7kIiAYst/5YLwOFiMyupAmL2czxExfa2CntW49Thj7wckwkjQpZedasL5zDa0M/hPR8gmQ/Pj+e3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(396003)(376002)(346002)(83380400001)(316002)(6486002)(478600001)(36756003)(31686004)(41300700001)(6506007)(2616005)(8676002)(6916009)(6512007)(186003)(5660300002)(8936002)(4326008)(66946007)(66556008)(66476007)(26005)(38100700002)(2906002)(86362001)(31696002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aURLZTlQZUNLUHJMUlFXUERESlZTSjV5ZjFDL3dyWHFYUGxBUkVMTHNBeWlr?=
 =?utf-8?B?REJ3bTl6eG14cnFFVmJKNzl1ZlRweERoSUljN2F0SUVBUGtyU0RFVGZsUFdt?=
 =?utf-8?B?VjZ1S2hHSGVOU2x5Z1MzekQzOEM4bmdNanowSGxSQ0J3ejE2U0VxWU43eHUy?=
 =?utf-8?B?WGsvbXhlZzdoTU5mWm4wZElvSHlHZ3FCVWtMUmVrT0NQckUwcEN0Vnc3MGRk?=
 =?utf-8?B?amNzckN6cjZ5VkZlOVBvQkhJaE95S2ZDWDhtenVpZkFpbHFCRWU1bHhLRzFv?=
 =?utf-8?B?eitCUUxOMUR6SGVGK2lzWmtXTUtFRmx4Qk1oMjZDSm1tMy9rSHBTaE1Oay9s?=
 =?utf-8?B?YW1tamVUNWdsUlRxUlZDZlZ0NEtrRkdhTVFudStyaFFLT1FLY3FrcHpValJ3?=
 =?utf-8?B?RkJLc3gxU0wxVXpkNmE4SklGWlpSTncrK3AwVDJRYUxzcnJtdy84djYvZlVz?=
 =?utf-8?B?QkxXcktsWElzZ3VTQ1NraThka3A1d08vZEVrY2t4TkpuZFFNSW1IQVg0dHo2?=
 =?utf-8?B?d1RORzNwMmUvd09NNkdobmFOR3VwclR3OWtwUEsrNlV0aCtzT2E5U295bEVP?=
 =?utf-8?B?d3RBOEhFZ204SzF3WnM2MjJ3RHF3UGhuczhVL2FKdCtqYU03ZzNnMmFRMndN?=
 =?utf-8?B?SlQ1b0xSNTM0cTljL2s3dEhGSlhxZnNHQTdIb2hBYldHK0RjYVdxWklGN1hn?=
 =?utf-8?B?b3hsUFVjQUU5RDZpWEIzQzRYZVFsVWVoNmJ6SlRoQ1VVRkNUQ1UwU1NxUU53?=
 =?utf-8?B?Nlh6UDRWYjhsSHNLWmVnb3pMditPUmVERzl0WlowQVIvQ2dGNVBwNzdCaE5a?=
 =?utf-8?B?TEk5UE12R3M2akxoWjFlR3JLc0ticUU2M3ljUitwMHYvdUxmbk5EaUgrbTA0?=
 =?utf-8?B?WklMNlhtU1NSRTR4alZjSUd0NmZkZ09weWx5Q1FTQytmbjJNdzVPR0ZpMmYx?=
 =?utf-8?B?WHB3ZVpWcHErc01aR29Zem8venA5Zi9jL2toNzBMSmdBNjIyQTVsNmdNMWFV?=
 =?utf-8?B?MVpidkNMSXR0eDRyOVhnR0VWMzFwcitwRDZNRG95OXlQSm9VOGxtbU5qREg4?=
 =?utf-8?B?MEU0cXhrbUxxZ0ViQ3JvOEFyWEFQRkozdFcvZ2V4SUEzRkRMUE16dFNxTkcy?=
 =?utf-8?B?VHp4d2FuejNZenpBd2w1aEUyVVFmMGJpOEMrTnd0YXVudGJhUEVPQ0tLOE5i?=
 =?utf-8?B?dzRvY0QzZllSYytzak1IUkFqeWxJL0NHQzY3cmFqVTMzK0FjbDI4VS80QXB6?=
 =?utf-8?B?MlBCQ2kvR1JtckhSaVQ4OXZWZDJQV0tLM09weDhRekNwdnRhZmRRbFN3YStT?=
 =?utf-8?B?NjlKZ3VWM2RzU0xHczNhd1Nram9GNS9TY09Yd2RuR2NnTjgram1uWkk4MDc3?=
 =?utf-8?B?R2N1MXl0UFU5Y1g0YWN1VUFQUy9zWmI0SkIvZGw3UFl0ZCtiSENQUVhEcjYw?=
 =?utf-8?B?V0lxVmdRRXNhKzQ0NytydlI1amFhTzROcUxoZWtnQ1gyL0hjakRhRmdUTXhW?=
 =?utf-8?B?U3dNNTVRMksvRG43Wm1hMDlZZEk0VHRxSkFadjFqeEZWS08xTU45ZkFuSDZY?=
 =?utf-8?B?cWw2SFN1SFBQbHcvNVg3dTgybDZJZSs0RXc2UHRoRlpIMXZMQnhhRTNncjVY?=
 =?utf-8?B?QVNXakZmU3ErSDVlc2IxTjJ4bEhlTE9CU094YlBrdE9JdUk0NGlBUnpyK0lm?=
 =?utf-8?B?OVRYZ2ZTZVFwVzBMaGpNdTlTandnbmd4aDYreDZtUENXRXdzYUJkNE5JeFR2?=
 =?utf-8?B?UDBUeXdRbksvWXB4VjF2ZHR1allFcFRRb1V1ZGpRQngxWjVxeTR5alZmaDZy?=
 =?utf-8?B?SFZJNHVnaWI5MVdHL2tidzZBV2NKVTFpYTFXdlVtTHFCUXJUQ2tTV1AybXR0?=
 =?utf-8?B?dlV4ZWVNOG0wWDFJa25VRDJsTHNyeGxnSE94YlZENjlTS0g0TmtpdHNSeFZ5?=
 =?utf-8?B?bkIzV3hENHo4ZzY2bVpsQTNUWWdta0dIRWRjQ0dCM3JiNFRFS0lDZzJtSnJI?=
 =?utf-8?B?UXdqaWF2Sm9oVmNsSHF6ekJtT3hzZ0hobFgybGdQSHZCa3RONFlwK0lrYTRh?=
 =?utf-8?B?cWhXUXBLMXY1UUowRzVCZHd1WStIUHd5QlpWb3hQbHdXQkVVaXJuYS9IR1B6?=
 =?utf-8?Q?Zbu+l9ajSAmLCTbXpvKTF2pR6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920429f1-9e3c-44b0-d3b0-08da695358e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:53:12.1927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Re0LhPHvqIoW+IecU+zrBprR/+MoqMcl2GuPzkKbrBQRRxAGwFstbUEA7pZ1O/9eFZd5aDCbNKECEm9R5GgeVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4864

For guests in shadow mode the P2M table gets used only by software. The
only place where it matters whether superpages in the P2M can be dealt
with is sh_unshadow_for_p2m_change(): The table is never made accessible
to hardware for address translation, and the only checks of _PAGE_PSE in
P2M entries in shadow code are in this function (all others are against
guest page table entries). That function has been capable of handling
them even before commit 0ca1669871f8a ("P2M: check whether hap mode is
enabled before using 2mb pages") disabled 2M use in this case for
dubious reasons ("potential errors when hap is disabled").

While doing this, move "order" into more narrow scope and replace the
local variable "d" by a new "hap" one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Extend description.
---
Strictly speaking "fn_mask" could also be "unsigned int"; I wasn't sure
whether changing that would cause objections.

While at least sh_unshadow_for_p2m_change() presently relies on this
behavior, it is somewhat odd (and inefficient) for p2m_set_entry() to
split even non-present mappings.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -403,28 +403,22 @@ struct page_info *p2m_get_page_from_gfn(
 int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                   unsigned int page_order, p2m_type_t p2mt, p2m_access_t p2ma)
 {
-    struct domain *d = p2m->domain;
+    bool hap = hap_enabled(p2m->domain);
     unsigned long todo = 1ul << page_order;
-    unsigned int order;
     int set_rc, rc = 0;
 
     ASSERT(gfn_locked_by_me(p2m, gfn));
 
     while ( todo )
     {
-        if ( hap_enabled(d) )
-        {
-            unsigned long fn_mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
-
-            fn_mask |= gfn_x(gfn) | todo;
-
-            order = (!(fn_mask & ((1ul << PAGE_ORDER_1G) - 1)) &&
-                     hap_has_1gb) ? PAGE_ORDER_1G :
-                    (!(fn_mask & ((1ul << PAGE_ORDER_2M) - 1)) &&
-                     hap_has_2mb) ? PAGE_ORDER_2M : PAGE_ORDER_4K;
-        }
-        else
-            order = 0;
+        unsigned long fn_mask = (!mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0) |
+                                gfn_x(gfn) | todo;
+        unsigned int order = (!(fn_mask & ((1ul << PAGE_ORDER_1G) - 1)) &&
+                              hap && hap_has_1gb)
+                             ? PAGE_ORDER_1G
+                             : (!(fn_mask & ((1ul << PAGE_ORDER_2M) - 1)) &&
+                                (!hap || hap_has_2mb))
+                               ? PAGE_ORDER_2M : PAGE_ORDER_4K;
 
         set_rc = p2m->set_entry(p2m, gfn, mfn, order, p2mt, p2ma, -1);
         if ( set_rc )


