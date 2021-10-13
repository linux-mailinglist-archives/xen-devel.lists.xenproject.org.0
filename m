Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0115142C4E8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208669.364885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magKM-0005wz-Bo; Wed, 13 Oct 2021 15:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208669.364885; Wed, 13 Oct 2021 15:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magKM-0005ub-7n; Wed, 13 Oct 2021 15:37:58 +0000
Received: by outflank-mailman (input) for mailman id 208669;
 Wed, 13 Oct 2021 15:37:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1magKK-0005uN-D9
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:37:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 610c2b07-3b8b-419e-a6a8-f5cac45dfb6c;
 Wed, 13 Oct 2021 15:37:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-g2Kj25PoMdCTSB8bfLJOxQ-1; Wed, 13 Oct 2021 17:37:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6381.eurprd04.prod.outlook.com (2603:10a6:803:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 15:37:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 15:37:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0093.eurprd04.prod.outlook.com (2603:10a6:20b:31e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Wed, 13 Oct 2021 15:37:51 +0000
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
X-Inumbo-ID: 610c2b07-3b8b-419e-a6a8-f5cac45dfb6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634139474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jy7HwRHaNovftUjQsJ1pQLTkbsHkl1IkKdFl9OaItS4=;
	b=HBGgT+C/+KIp2hjN1negr2d8kzNcCn1yMOOBXFWVqpEpVMNYcB6ZXJIKPEe/8shnt5EfSk
	PfZCMwZB912HDAVFNP/WVU2Zf69mPyJDqRSIvBrIXDd/4Q7liIHAcMjcOKOCDt23syaBeV
	YM8nUCJLF5AN8GpykRS408UFB2DcJCc=
X-MC-Unique: g2Kj25PoMdCTSB8bfLJOxQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cC4UdQ3/QTEhlmKT+TbGN/O2aw53lOhVuou2XEF2TY4Ez8/VTZF0qkU1bwG2SDUBdKn1FrQ72oX+rzZZ9/ZjQJk+TiU5LTLPZTVdaINRNLVOjxD/EZ8zkSEBVq8x16jYb2s/tHW1FEWCppHJKzvaDiJAStAHKoUAynQcWjNnd40j5GGGE/yXZ/6wRMEoo1/a69CfWHEFtN+YlQmIntIo45IypsBm0CrYdGcAZyZnspF1s/e8AsheLg7X41fCI8GvlQlDdVenUh5T0PZ5+YNTmTQHhm5/yXFN5rZBqnI1MxlZEgeUPVDQf7bxd1aD78mux+3xzrd7xINGPTYtQ29DVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jy7HwRHaNovftUjQsJ1pQLTkbsHkl1IkKdFl9OaItS4=;
 b=HOw/hlGPPLjsPzFpwXS878Gvwu9pmOu+zbuh3QKfM4OBrBb2YlcN+KS+e/l88I4QVbZ9i5LI35jGkHBi4I165cJ/lqrh2CSr5AZNrfaK8ABm3CE3ZK2A1IZeA0w7111yaJmIuji7oQ5DU+VGCTWuIjLReQZTU1DapQA/hSK94ANqyqMGV/7tAS9FW0Ofp2Fww5tVwsywXJ1IizwMX/xlkhr+CqMqwGCcopbwxZe6RX8WU/6lmYSsMVK2tbqZbIG10OGPeHwBP3UNYzATPThuxVrcu5n6nc+HMu3kvz6fRAeuO+s1idkOzhVxNeMgWaU5c//seOyjTiWIbevlJF9QYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/2] x86/shadow: adjust some shadow_set_l<N>e() callers
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <24329000-06d7-2047-b0a1-51b149d19189@suse.com>
Message-ID: <298846aa-f93f-4564-dbf4-4f893df8f328@suse.com>
Date: Wed, 13 Oct 2021 17:37:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24329000-06d7-2047-b0a1-51b149d19189@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0093.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 613915a8-42d4-4ddd-b58e-08d98e5f6acb
X-MS-TrafficTypeDiagnostic: VE1PR04MB6381:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6381689C141276F35DAA3AF4B3B79@VE1PR04MB6381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7T7Hh5zlBBYz/uyRwWQ+a5QcQIpeIjicHMIhv3CHC9lKLTYx6GamO/7dkstnK3r8up364tUkFAA15K1pt4nN9TAOcGz5nHfxL3G/Lidm+JjCw/fEC6zQjv2OU0v7KTShBV1bqPrM4PXB5g+Ip8mDRA4O08oJ+G5NE7rBBE0GfQmo0gVcdQFkSIKTkoR9GPeFxu1GoLKcvRXewn+Fw+VfSxtydnwfvnEA8vnc+4K0BKfw++ozPm1T2wWIvxu7YJIAVexecPYtTFfmwkMfcPa/YKLpW1K2J1+sVHTA06EGn1oYkF//eGtSkkqHt4pyLk5nwy0drdd3I8mRRkYc+JehhS6YJpJs/3b+Ye34OGXiO2HJgIgzbFjNubgqA5NgIXPjWHhBi8bi3tXIjpvd+HHt0D7icWb0iktqp3pOjKJVBupyJyhIB53JyDOsYzs2eSRTVJI3DWojJ48w7Ei9aFcCpM85thQTV4jcZcKCJj26SFBPizQjFt7C2py85CWdsCPLe7SjiyurxEktvoyPosPZo2VMZoZC5K149ZH1ysMMxyYnmv5A8DE7NO1Poo8GswmetM4ErhT3Gpr0bsIZYTP65M8aUQOLO9lPRb5QDAmQrI/t0l/CXP8x4kOFEtK0vUxE74dc70U9NpSfM7P/lQmW+j6+3y+MOKg5YJiq3+/+MU13HofPMRBrH+cBrbZfLfZJw73tu+RxVH7Aat7zFZIdVAwokEPjDk2Cugw0E7V3zKAj0LX4T1+Iijamq++26J9AClR+idlLYIRij+7GKfoMRXhBC2ksdspVLJRt5flD9PU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(38100700002)(6916009)(8676002)(36756003)(16576012)(2616005)(6486002)(54906003)(2906002)(26005)(316002)(31686004)(66556008)(508600001)(8936002)(66946007)(4326008)(66476007)(86362001)(5660300002)(83380400001)(186003)(31696002)(43740500002)(45980500001)(473944003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V29KRUlEck02N01LcWJPZkZTaWVZSkpvT1ZCM0Vjbzd0TkJXaU02WEdRMWh4?=
 =?utf-8?B?RHVybElWUDNBM09TcHlHZ09GS0FyNDh2QStuaXNkUUZpM2NMNjgrVGEyaDVH?=
 =?utf-8?B?NDNkcGV5bTZqY2Urc2YzMXJsblZGaDVEekNQZ013ZDlGKytLTXdOWlpEUGtO?=
 =?utf-8?B?UDR6dWZIOXpuT1RKbU9xemFHK21xNldNNFp0TVNIMThLUVU5WDZCZkNaNC9x?=
 =?utf-8?B?TDVOZnpESXBUMFFjcDlHQUdsRnJ6NFkyOEk0elNFSk5nNFFEeWRYVnh5Y0Nn?=
 =?utf-8?B?eGVaUlFGSGRHdGNHMmg1QjVjMU51c2tmMGxGTWFiZnJQVzRrWWl4YS9lMEc1?=
 =?utf-8?B?VHNSN2szSERHNW0vYVByamVWSXRPUFJZN0syN3VyZEhMNy9BM0pBaHhscGVs?=
 =?utf-8?B?NFIwOXBxM3VlM3RqeVdhUWVCWE8wN3lQd3EvZUdoelZVOWhMZENWdU5tUEJ3?=
 =?utf-8?B?REhXTDZaakltUTgvNVhxUmVsUStubW9qWGVnazErakNBRUIwbU5XRTN1K045?=
 =?utf-8?B?SThHY3FNSkRyTVN4QytNYVE1Ry9ub2hGQWlDYU5rQnZyeVV0ZEdoSGVNcDN3?=
 =?utf-8?B?QlQxZE0ya1JzdVpIYzdaanhsU1hRTGw1Mkt6TjFybitCSkZEZ1QwZStSWnVu?=
 =?utf-8?B?SHlqV1pxZ2s5WHBlc1hmdzZCemZ6aXNFRFhZN3lXR2tjZFMwNGcweVpBR0pJ?=
 =?utf-8?B?TnZOd20xWFo0bTNxcnEwK2dFQXNQbEl6UVU0SDB3bUhiS1pNaHNTaE8ydmJy?=
 =?utf-8?B?cW5Lc0dzU1lmUFRlM0hhei8wYlpxdmJMc1B4ZENXQ0pRRXp4bklONzl2Zndy?=
 =?utf-8?B?Mm9xSG1iRUZLajgxZlB5T1l5TTUvRlNtWlFDVmIwZ0w1c3hveG1FcHUwMyth?=
 =?utf-8?B?UG9abm94YXV5QzVkWWJ1bHNMMXRiQ1hTbVFTT2VYdTc1M21SSGlhcjdtV0lQ?=
 =?utf-8?B?MW5HY0dHVVltdWRGSEdyb0xBc1NiWmxScjhjK2xVTk5WeUJmNmFycW1Na3lE?=
 =?utf-8?B?TStEVVBhN3p4a1pHRm9lZWQ4LzdjM0dQNnpYNXB2L29wcEN5dC8yZjd5elNz?=
 =?utf-8?B?SCsrMW1QaHluMmltdVZvZDZkUk9GMi94NitCRmxUNTQrSlRZTWxFcWZ0cmRx?=
 =?utf-8?B?dWlLc1oxQ1NPYlJSSnFnQi82NlF6MXpXanAyclp2OE80MEVidkZvWTdxdmFI?=
 =?utf-8?B?K1ozYnB5ajJ5cW4xN09ScklnRzY5ZDF6UUg5ci9OU3M5L2Irc002Vm40VE5p?=
 =?utf-8?B?WXcrNTY4bC9HSTEwQnNDM2xTeTREd2IwcGxnM01senRHdXhjb01jVldVYklY?=
 =?utf-8?B?dXF2cUFzb2tCeXRLamdQRWFkSzJlREUwSzZRUEhuTVJ2TjdUcXo3RlUvU1Jt?=
 =?utf-8?B?YVlpT24vc2RXZHFZSFFJQWlCeXB2QTNtWG4wOHZIMU84RzFLbU5FZzBzRHlI?=
 =?utf-8?B?UGJ0clZaWUtsMXZZMS9XU2drN1BRcW0xRE9iUUJJWk1qWXc2cXFYKzViWWpz?=
 =?utf-8?B?dUVsc0xIeFpSV3RYZzFJZUU1SDE4d3FjZE1HUmFyNWswb1ZhT0UxcHFQSWMr?=
 =?utf-8?B?a25xRjFVVmVEL0ZvbTJQci9MV1RLQmk3ZkxDQ3V1U3FCeUpuNkZST1pyeGFN?=
 =?utf-8?B?YmhDNnlsV3NaaE1QZ1liZWdnWEZrVkdrZDY3c3JGYldFdVAyTXhIVno0czRS?=
 =?utf-8?B?cHhOcERDWjBrUGtWbnJnSlJubTR6VzhYeFJpdDhseG8yeHBjb0trVk9va0x2?=
 =?utf-8?Q?BHqTpn+Mone+eAJh1vuAngLmGBdR0kH9V5kATyF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613915a8-42d4-4ddd-b58e-08d98e5f6acb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 15:37:51.5077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCmOuB6nIblPWp2vhRvj3ScCHVuswm3f/39nmH8SVjxhRec4YEZquhDvNz2u2k++iPKny2FVAg9deu2gaQvhRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6381

Coverity dislikes sh_page_fault() storing the return value into a local
variable but then never using the value (and oddly enough spots this in
the 2- and 3-level cases, but not in the 4-level one). Instead of adding
yet another cast to void as replacement, take the opportunity and drop a
bunch of such casts at the same time - not using function return values
is a common thing to do. (It of course is an independent question
whether ignoring errors like this is a good idea.)

Coverity-ID: 1492856
Coverity-ID: 1492858
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1416,7 +1416,7 @@ void sh_unhook_32b_mappings(struct domai
     shadow_l2e_t *sl2e;
     SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, 0, d, {
         if ( !user_only || (sl2e->l2 & _PAGE_USER) )
-            (void) shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
+            shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
     });
 }
 
@@ -1428,7 +1428,7 @@ void sh_unhook_pae_mappings(struct domai
     shadow_l2e_t *sl2e;
     SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, 0, d, {
         if ( !user_only || (sl2e->l2 & _PAGE_USER) )
-            (void) shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
+            shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
     });
 }
 
@@ -1439,7 +1439,7 @@ void sh_unhook_64b_mappings(struct domai
     shadow_l4e_t *sl4e;
     SHADOW_FOREACH_L4E(sl4mfn, sl4e, 0, 0, d, {
         if ( !user_only || (sl4e->l4 & _PAGE_USER) )
-            (void) shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
+            shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
     });
 }
 
@@ -1969,7 +1969,7 @@ static void sh_prefetch(struct vcpu *v,
 
         /* Propagate the entry.  */
         l1e_propagate_from_guest(v, gl1e, gmfn, &sl1e, ft_prefetch, p2mt);
-        (void) shadow_set_l1e(d, ptr_sl1e + i, sl1e, p2mt, sl1mfn);
+        shadow_set_l1e(d, ptr_sl1e + i, sl1e, p2mt, sl1mfn);
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
         if ( snpl1p != NULL )
@@ -2534,7 +2534,7 @@ static int sh_page_fault(struct vcpu *v,
 
     /* Calculate the shadow entry and write it */
     l1e_propagate_from_guest(v, gw.l1e, gmfn, &sl1e, ft, p2mt);
-    r = shadow_set_l1e(d, ptr_sl1e, sl1e, p2mt, sl1mfn);
+    shadow_set_l1e(d, ptr_sl1e, sl1e, p2mt, sl1mfn);
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
     if ( mfn_valid(gw.l1mfn)
@@ -3014,8 +3014,7 @@ static bool sh_invlpg(struct vcpu *v, un
                 shadow_l1e_t *sl1;
                 sl1 = sh_linear_l1_table(v) + shadow_l1_linear_offset(linear);
                 /* Remove the shadow entry that maps this VA */
-                (void) shadow_set_l1e(d, sl1, shadow_l1e_empty(),
-                                      p2m_invalid, sl1mfn);
+                shadow_set_l1e(d, sl1, shadow_l1e_empty(), p2m_invalid, sl1mfn);
             }
             paging_unlock(d);
             /* Need the invlpg, to pick up the disappeareance of the sl1e */
@@ -3608,7 +3607,8 @@ int sh_rm_write_access_from_l1(struct do
              && (mfn_x(shadow_l1e_get_mfn(*sl1e)) == mfn_x(readonly_mfn)) )
         {
             shadow_l1e_t ro_sl1e = shadow_l1e_remove_flags(*sl1e, _PAGE_RW);
-            (void) shadow_set_l1e(d, sl1e, ro_sl1e, p2m_ram_rw, sl1mfn);
+
+            shadow_set_l1e(d, sl1e, ro_sl1e, p2m_ram_rw, sl1mfn);
 #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
             /* Remember the last shadow that we shot a writeable mapping in */
             if ( curr->domain == d )
@@ -3637,8 +3637,7 @@ int sh_rm_mappings_from_l1(struct domain
         if ( (flags & _PAGE_PRESENT)
              && (mfn_x(shadow_l1e_get_mfn(*sl1e)) == mfn_x(target_mfn)) )
         {
-            (void) shadow_set_l1e(d, sl1e, shadow_l1e_empty(),
-                                  p2m_invalid, sl1mfn);
+            shadow_set_l1e(d, sl1e, shadow_l1e_empty(), p2m_invalid, sl1mfn);
             if ( sh_check_page_has_no_refs(mfn_to_page(target_mfn)) )
                 /* This breaks us cleanly out of the FOREACH macro */
                 done = 1;
@@ -3656,20 +3655,20 @@ void sh_clear_shadow_entry(struct domain
     switch ( mfn_to_page(smfn)->u.sh.type )
     {
     case SH_type_l1_shadow:
-        (void) shadow_set_l1e(d, ep, shadow_l1e_empty(), p2m_invalid, smfn);
+        shadow_set_l1e(d, ep, shadow_l1e_empty(), p2m_invalid, smfn);
         break;
     case SH_type_l2_shadow:
 #if GUEST_PAGING_LEVELS >= 4
     case SH_type_l2h_shadow:
 #endif
-        (void) shadow_set_l2e(d, ep, shadow_l2e_empty(), smfn);
+        shadow_set_l2e(d, ep, shadow_l2e_empty(), smfn);
         break;
 #if GUEST_PAGING_LEVELS >= 4
     case SH_type_l3_shadow:
-        (void) shadow_set_l3e(d, ep, shadow_l3e_empty(), smfn);
+        shadow_set_l3e(d, ep, shadow_l3e_empty(), smfn);
         break;
     case SH_type_l4_shadow:
-        (void) shadow_set_l4e(d, ep, shadow_l4e_empty(), smfn);
+        shadow_set_l4e(d, ep, shadow_l4e_empty(), smfn);
         break;
 #endif
     default: BUG(); /* Called with the wrong kind of shadow. */
@@ -3689,7 +3688,7 @@ int sh_remove_l1_shadow(struct domain *d
         if ( (flags & _PAGE_PRESENT)
              && (mfn_x(shadow_l2e_get_mfn(*sl2e)) == mfn_x(sl1mfn)) )
         {
-            (void) shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
+            shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
             if ( mfn_to_page(sl1mfn)->u.sh.type == 0 )
                 /* This breaks us cleanly out of the FOREACH macro */
                 done = 1;
@@ -3712,7 +3711,7 @@ int sh_remove_l2_shadow(struct domain *d
         if ( (flags & _PAGE_PRESENT)
              && (mfn_x(shadow_l3e_get_mfn(*sl3e)) == mfn_x(sl2mfn)) )
         {
-            (void) shadow_set_l3e(d, sl3e, shadow_l3e_empty(), sl3mfn);
+            shadow_set_l3e(d, sl3e, shadow_l3e_empty(), sl3mfn);
             if ( mfn_to_page(sl2mfn)->u.sh.type == 0 )
                 /* This breaks us cleanly out of the FOREACH macro */
                 done = 1;
@@ -3734,7 +3733,7 @@ int sh_remove_l3_shadow(struct domain *d
         if ( (flags & _PAGE_PRESENT)
              && (mfn_x(shadow_l4e_get_mfn(*sl4e)) == mfn_x(sl3mfn)) )
         {
-            (void) shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
+            shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
             if ( mfn_to_page(sl3mfn)->u.sh.type == 0 )
                 /* This breaks us cleanly out of the FOREACH macro */
                 done = 1;


