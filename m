Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786153BBEC7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150377.278048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QML-0000gf-0R; Mon, 05 Jul 2021 15:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150377.278048; Mon, 05 Jul 2021 15:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QMK-0000eF-TK; Mon, 05 Jul 2021 15:18:08 +0000
Received: by outflank-mailman (input) for mailman id 150377;
 Mon, 05 Jul 2021 15:18:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QMJ-0000e5-Jz
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:18:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32618978-dda4-11eb-844b-12813bfff9fa;
 Mon, 05 Jul 2021 15:18:06 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-nna5v4Q3OsK8LUYMWGk8dg-1; Mon, 05 Jul 2021 17:18:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 15:18:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:18:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0106.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 15:18:02 +0000
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
X-Inumbo-ID: 32618978-dda4-11eb-844b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625498285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RJUMTKaJ5bhtriSU6g8YBQb46nhrBNsM85val+nqS+M=;
	b=XnHbSI6EPTqFQfyxmlkCiAHlEXFxlYCIt3pXZJPDw/WTZiLqpCi4+t3jfNfaReea9fS/M4
	agEsSzcc4hBYybpafABbyCRv3Dajor/3nzRwNQkHR7j1zidSw0frD3vg9s8P74sb1ceakJ
	nc30WN7Hy9rU9Ye/Z6vHhKAxvyhcvCI=
X-MC-Unique: nna5v4Q3OsK8LUYMWGk8dg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpLQWAqat7FGtaChv5q+l+wqzhBJgdZPsL18T5JgWQkP7uX9DtlopiC5pv/o3DV6crqTQvQEYl8H/jrY2MG0FBw72kLj0et3ZQWQeErXQpyPhNb5cwcoyDOl0sco4WsgMPnQVDb8d7445E0983ne54eUlBqHzrlW4jxjmeTkKWYuE8un+iEP0pkcZI0g4xUZk8YC4X740ntpMdvUQZF3aZgk/KMnu2g4Bsk3fsD7MA4A9px73CFR9ira2SrHqxZBvHPONdBBLhvEnI8iqyegH4d6pLYy0Us1CBzbvQmacLDxTMFvsXQNjF/ImCBrtP7deECJ75wsTHZUjyO/V9Y1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJUMTKaJ5bhtriSU6g8YBQb46nhrBNsM85val+nqS+M=;
 b=DOjnGpsDWil1jnC6Up4Mb2p63Pk0TBT/hWNvK5HK2saMSLrrp6/Fw6JhW/D3qax2ffF5vXCYAFAFrEy2U2YPDn3B0BBHbxqfrd+2TJBh0B1t6USl/QDsAXou5yoSRc/mMTrCYOJzLOiDtAk1FBYN/5QsfJSPJvG7gW+qjBqan8CjjBp/DyirysK06LcnVHwtcqgCDfReUvYr13nbe4HYiwM88wREQ/gKnAfZe4d+HnjvecGS0Do/tQjto0tuR6Hu0TsHyH3aTnenT54MDel/HCme2slFw+20cyPasWlt6m+oyR2ITrAjbNGUFYMEdjMzsqh+snJcS129Z6e6oZtpvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 12/13] x86/mm: update log-dirty bitmap when manipulating
 P2M
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <2fa96dd3-986f-e41a-266e-9cdf8941b4dd@suse.com>
Date: Mon, 5 Jul 2021 17:18:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 378bae56-8d98-4973-987e-08d93fc81504
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5472F94222EE43563403011EB31C9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T/XUsibU4ttsa3QJc2JsURW34wWsOSBmTpMSCrjA98ivWrABlDe2kDc4aRtwU6EVPVX4bAO2RwhL5S9qnAe0IP+G6YOloH1p2hq3J9BuZQ+ueVO0DKs0OOO8ld7X6I2FI6RiKRoWjRsQS1NQ+9j0nj0mXOjYyow9kobyv4ZNYw5nzcIaplHgbodkP9lDa2GA87mPr60Q/wEjgw0lV6vtQUDmSsEP05/X/PaimBpeJ8GDsVLgBlSpCVMbEmVlBS1OuGRJUZ0dHCt6xuLaVMmPTEuGmEl1irBzmfC7lwL2AtkNH5krU9I9/RnzY3TQkw8b/BllpDJnRd7I2Gwu+mPHDKOSqlwVbk49B5ipZ1NrhG4ZXTugW9ng0ZyHVDcGHcRAaKIeTbndWs4pVuMKtZ7Z0A9+T9MYaQUz2wPyRnG6b8p/Ir5BI/1xdEkktzjDD6HdAFJX7Ouu6WIBazmWJc/D0SSQdkuWS7W32oGJ0X4Klr0zDqr4AYNW6nmMPf7HFoRtmh0wntL9Y0939ckXWS4dVvXGNI600ImVX2fpbLq5dSIUo4EblATvcK++TEqlPomQ/Np3R2Y41HALs0zkFzIxQ+ZTyFnSYJqBq0mPzlWLULQ94Y0YWnJWPQS1dq9QUq9R3NRarSdMUvn2u/PqLjR968Wwhv81dGe/tTCtibE5vxBX255jPfgqFDV4iDQHRM5OkoNO+g3TGLhRSTi3fU5UlWJ6Bwkp1nuv/3rIu5jDX+JdLG2YjpBCLoqGEjQaGK+Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(366004)(396003)(39850400004)(54906003)(478600001)(6486002)(316002)(16576012)(2616005)(15650500001)(83380400001)(6916009)(8936002)(2906002)(8676002)(956004)(4326008)(5660300002)(66946007)(86362001)(66556008)(66476007)(36756003)(38100700002)(26005)(186003)(31696002)(31686004)(16526019)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2U3QmRIdFo4Z2lEcm1EOER2V2hzY0p0NjA1Q3NrdmNadkZwZzdLdWhwMVkw?=
 =?utf-8?B?aGIxUk8zOVBrUzBnclZqWFRQSy9LUzdTZDhHQk1aVUVnQ2R6RTVXUzFSWXVE?=
 =?utf-8?B?SDNpT2Q4SzFPdzRxbk1LMTBFZW5HMzFmbnpKZFVMN1dDb3l4dG5wcnQ4OHF1?=
 =?utf-8?B?Z0JkVy9uVXBkYThlV25Cend3SzVaUUwzeFJBSDhZVTJaMGZwU1VId0wycjlz?=
 =?utf-8?B?M2ExOExneUlvNVNMZDUwNmhQLzQ5Y1BQQURUUGJocjgxTTNBMzdhUnVJL0Y4?=
 =?utf-8?B?aTcxdzRydmc3aXBTbDFiamkzOWpoVHlEUUlucld2bThCSjRlcU15THIyTjZB?=
 =?utf-8?B?MkNWYmp4ajZ3L2syc3l1ZGs4OGx4RWRGdkRod2NudWtjU0ZKb0ZsYi9DMyta?=
 =?utf-8?B?WlNXYnJMWVhZSnQwSXdrUDNXNGI2VE42REhrcmZsS21EcUhNTWdkVWFCbFo0?=
 =?utf-8?B?WUZBMEREY0RRem9uc1lEeS9JalhxdUNYMmF2QllDRGRhd2pVMGR0aEpWY0hw?=
 =?utf-8?B?R1E2Y0JXVFB0dHBqTkkyakVlTitDR0xUbzd6SUJvdFVyM1Q0bUoxTXNUNzF3?=
 =?utf-8?B?bWdOc2xZZms2OUsrMlZodTFEdmFyL21mak9oaWRVVCs4RkZlK0ppSzdtYUZp?=
 =?utf-8?B?blRNcTBCbVVSZVlMdmR0SDY2TTZKL042RWdPUGJkbnc3L29MMW9aTFR2RVNC?=
 =?utf-8?B?MkM2Nk9FRm85ODNkOVcrY21LdHA2MW9JUmN4blFJQjFVd2l3VVIydGJBYk1q?=
 =?utf-8?B?dGIzMUkwc1lpdUFWVHpLTVNFTkc0RzNhM3FaYnl2VnBZNllYcG9BYVBNaHdi?=
 =?utf-8?B?dE51b2VhSGl5RUNOT1JWNFRBNitKc1Vrc1orQURGcXdoUVpSUVZvNzh0M0VV?=
 =?utf-8?B?Y2xKVy85eW5XSlB4ZU9rSHpmdDRJZkRTTEFMZ0cwR3p6R1RlMkVaVzNoMUlq?=
 =?utf-8?B?eWwvd3cyU3lmbkhTVEVWYWtrSzBGT3lpbzVKWTN2NHZWSXpjWk9xTE9iL2Ro?=
 =?utf-8?B?Y044SS91S0RtZlNjblVEbmRnbGhPcmFDeU5PQlZqbno4U3ZBQlVxYUtzNnZo?=
 =?utf-8?B?amc0OFREWmdBb1JWNjdMc2l0SHpHUVpwbDVFc0tBdWZXS0xWVEh6T1RUem1p?=
 =?utf-8?B?c2RHa3d6NHJEUTFRa3U4czdYYTE0Ry9HdDJ1c0xFY3hMWG1HanNzb2FVQmlB?=
 =?utf-8?B?N3l3SG5BRHJpK21FNUE4TG5GUm5xOVZKckh4d3E5TXU2TzN0YzRCdW1lWk0z?=
 =?utf-8?B?Q2NBQmJPd1F2ZVpwUGNCZ3p5cHZ2R1NsU0UraDIzVDBEUUlwVEdnUW5NRTk5?=
 =?utf-8?B?OHBlL213Qjd2eVdUK1A3TjRUcWphQWpJNTVDRk5kUzh4QzJmcDczSHdkejV5?=
 =?utf-8?B?MlNidlFhVTR2SWc2SlVjcXFUUlFwUmNlUTUvUWFTaU15cHFKLzZ0dzVCazJo?=
 =?utf-8?B?eUk5YnRYQjB4WG52aFRTeXMxbFlldzNqTzBPeGhCUWYxWURPSG94UXZwSi8z?=
 =?utf-8?B?c2ZlOTRoaDQ0YXF6OXkxMU81bDdMRTc2QUNnMU5xaWxkRW54VkNQLy9wOUhl?=
 =?utf-8?B?d0I2RmQ0WXlNMDBHUTlWVERQUVlQSlh6MGdsOFJnZlRiZlhIbFFmcVFSTGp3?=
 =?utf-8?B?RWIxNkxQUWhSbTk2UWZ0WGxydm82WDVjV2M0WlN3bWE3NlppNVZaV2E2SnNV?=
 =?utf-8?B?Q0VEbnI4UkJIRkQ4SjE4R0dGZUwrVTh2bjdZd3ArLzdwK2c1YUwrSGFEZWpT?=
 =?utf-8?Q?u+XFcsYJECR7s049p0IKbeLl1GNvDyM4Dwje7ZO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 378bae56-8d98-4973-987e-08d93fc81504
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:18:02.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RoKEJOcN32NEkkSVHxCWhcjEjci7UBHSWl40GBxdcYq17XvG2jetdrxhlGPN1XW1qn8EVmX+UJG/qCfg/EFNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

Just like for PV guests MMU_MACHPHYS_UPDATE implies marking of the
respective page as dirty, additions to a HVM guest's P2M should do so.

For HVM the opposite is also true: Pages being removed from the P2M are
no longer dirty at their prior GFN; there's no point in telling the tool
stack to try and copy that page, when this will fail anyway (until
perhaps a new page gets placed there). Introduce paging_mark_pfn_clean()
(intentionally without a paging_mark_clean() counterpart) to handle
this. Note that while there is an earlier call to set_gpfn_from_mfn() in
guest_physmap_add_entry(), but there's little reason to mark the page
clean there when later in the function it'll be marked dirty. This is
even more so given that at this point it's only the M2P that gets
updated, with the P2M still left unchanged.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
guest_physmap_add_entry()'s error handling looks bogus in this regard
anyway: If an error occurs before an MFN actually gets assciated with
the new GFN, the M2P entry ought to be restored imo. But of course a
guest is still hosed if the operation succeeds partially.

Note that I've not even checked mem-paging and mem-sharing code for
whether they may need similar adjustment. At least the latters is, aiui,
incompatible with log-dirty mode anyway.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -818,7 +818,10 @@ p2m_remove_page(struct p2m_domain *p2m,
         {
             p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
             if ( !p2m_is_grant(t) && !p2m_is_shared(t) && !p2m_is_foreign(t) )
+            {
                 set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
+                paging_mark_pfn_clean(p2m->domain, _pfn(gfn_x(gfn) + i));
+            }
         }
     }
 
@@ -1027,8 +1030,11 @@ guest_physmap_add_entry(struct domain *d
         if ( !p2m_is_grant(t) )
         {
             for ( i = 0; i < (1UL << page_order); i++ )
+            {
                 set_gpfn_from_mfn(mfn_x(mfn_add(mfn, i)),
                                   gfn_x(gfn_add(gfn, i)));
+                paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn) + i));
+            }
         }
     }
 
@@ -1314,6 +1320,7 @@ static int set_typed_p2m_entry(struct do
         {
             ASSERT(mfn_valid(mfn_add(omfn, i)));
             set_gpfn_from_mfn(mfn_x(omfn) + i, INVALID_M2P_ENTRY);
+            paging_mark_pfn_clean(d, _pfn(gfn_x(gfn) + i));
         }
 
         ioreq_request_mapcache_invalidate(d);
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -645,7 +645,10 @@ p2m_pod_decrease_reservation(struct doma
             }
             p2m_tlb_flush_sync(p2m);
             for ( j = 0; j < n; ++j )
+            {
                 set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
+                paging_mark_pfn_clean(d, _pfn(gfn_x(gfn) + i + j));
+            }
             p2m_pod_cache_add(p2m, page, cur_order);
 
             ioreq_request_mapcache_invalidate(d);
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -259,7 +259,7 @@ static int paging_log_dirty_disable(stru
 }
 
 /* Mark a page as dirty, with taking guest pfn as parameter */
-void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
+static void mark_pfn_dirty(struct domain *d, pfn_t pfn, bool dirty)
 {
     bool changed;
     mfn_t mfn, *l4, *l3, *l2;
@@ -290,14 +290,15 @@ void paging_mark_pfn_dirty(struct domain
 
     if ( unlikely(!mfn_valid(d->arch.paging.log_dirty.top)) ) 
     {
-         d->arch.paging.log_dirty.top = paging_new_log_dirty_node(d);
+         if ( dirty )
+             d->arch.paging.log_dirty.top = paging_new_log_dirty_node(d);
          if ( unlikely(!mfn_valid(d->arch.paging.log_dirty.top)) )
              goto out;
     }
 
     l4 = paging_map_log_dirty_bitmap(d);
     mfn = l4[i4];
-    if ( !mfn_valid(mfn) )
+    if ( !mfn_valid(mfn) && dirty )
         l4[i4] = mfn = paging_new_log_dirty_node(d);
     unmap_domain_page(l4);
     if ( !mfn_valid(mfn) )
@@ -305,7 +306,7 @@ void paging_mark_pfn_dirty(struct domain
 
     l3 = map_domain_page(mfn);
     mfn = l3[i3];
-    if ( !mfn_valid(mfn) )
+    if ( !mfn_valid(mfn) && dirty )
         l3[i3] = mfn = paging_new_log_dirty_node(d);
     unmap_domain_page(l3);
     if ( !mfn_valid(mfn) )
@@ -313,21 +314,22 @@ void paging_mark_pfn_dirty(struct domain
 
     l2 = map_domain_page(mfn);
     mfn = l2[i2];
-    if ( !mfn_valid(mfn) )
+    if ( !mfn_valid(mfn) && dirty )
         l2[i2] = mfn = paging_new_log_dirty_leaf(d);
     unmap_domain_page(l2);
     if ( !mfn_valid(mfn) )
         goto out;
 
     l1 = map_domain_page(mfn);
-    changed = !__test_and_set_bit(i1, l1);
+    changed = dirty ? !__test_and_set_bit(i1, l1)
+                    : __test_and_clear_bit(i1, l1);
     unmap_domain_page(l1);
     if ( changed )
     {
         PAGING_DEBUG(LOGDIRTY,
-                     "d%d: marked mfn %" PRI_mfn " (pfn %" PRI_pfn ")\n",
-                     d->domain_id, mfn_x(mfn), pfn_x(pfn));
-        d->arch.paging.log_dirty.dirty_count++;
+                     "%pd: marked mfn %" PRI_mfn " (pfn %" PRI_pfn ") %s\n",
+                     d, mfn_x(mfn), pfn_x(pfn), dirty ? "dirty" : "clean");
+        d->arch.paging.log_dirty.dirty_count += dirty ? 1 : -1;
     }
 
 out:
@@ -336,6 +338,16 @@ out:
     return;
 }
 
+void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
+{
+    mark_pfn_dirty(d, pfn, true);
+}
+
+void paging_mark_pfn_clean(struct domain *d, pfn_t pfn)
+{
+    mark_pfn_dirty(d, pfn, false);
+}
+
 /* Mark a page as dirty */
 void paging_mark_dirty(struct domain *d, mfn_t gmfn)
 {
@@ -348,7 +360,7 @@ void paging_mark_dirty(struct domain *d,
     /* We /really/ mean PFN here, even for non-translated guests. */
     pfn = _pfn(get_gpfn_from_mfn(mfn_x(gmfn)));
 
-    paging_mark_pfn_dirty(d, pfn);
+    mark_pfn_dirty(d, pfn, true);
 }
 
 
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -170,8 +170,9 @@ void paging_log_dirty_init(struct domain
 
 /* mark a page as dirty */
 void paging_mark_dirty(struct domain *d, mfn_t gmfn);
-/* mark a page as dirty with taking guest pfn as parameter */
+/* mark a page as dirty/clean with taking guest pfn as parameter */
 void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn);
+void paging_mark_pfn_clean(struct domain *d, pfn_t pfn);
 
 /* is this guest page dirty? 
  * This is called from inside paging code, with the paging lock held. */


