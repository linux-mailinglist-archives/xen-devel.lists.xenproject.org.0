Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C933B8484
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 15:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148191.273832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyahd-00037y-4w; Wed, 30 Jun 2021 13:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148191.273832; Wed, 30 Jun 2021 13:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyahd-00035I-1N; Wed, 30 Jun 2021 13:56:33 +0000
Received: by outflank-mailman (input) for mailman id 148191;
 Wed, 30 Jun 2021 13:56:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lyaha-00035C-T9
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 13:56:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2638aaa1-5d94-4f69-994e-58be09ede02b;
 Wed, 30 Jun 2021 13:56:29 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-npfOnX-6M9S27Ct96yTMpQ-2;
 Wed, 30 Jun 2021 15:56:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Wed, 30 Jun
 2021 13:56:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 13:56:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.20 via Frontend Transport; Wed, 30 Jun 2021 13:56:22 +0000
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
X-Inumbo-ID: 2638aaa1-5d94-4f69-994e-58be09ede02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625061388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yjRVhFyA1kvj1/ITXdYyeVhmLbnmD3z33wuncL4z6rM=;
	b=SThNfZ+YAwZ2vVobzuJZZVXfe+Qve7oEA1vi2GPDWrTLLOktG6H1/xXmsOJJZ/YhgrIIFd
	uEvZOpqH2oAnG3mAr9NCOZSc5bFGx3RBmH82kdzv8lUpZlY2av3cKX8eK2i9zauAolOyWP
	woh3OurYi3NmBKPRm1j4c3HpXUOay+A=
X-MC-Unique: npfOnX-6M9S27Ct96yTMpQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4qUxHP155G5eR4YEF6ilHpwGXGGMH3YaC/6aGJ9kbnHdH7uKVaEUe/JtX4h5JMqLlzy8URnpAOlinIGpZxR+kBWMeAOLekBoL5/sXQkOwFvMYucx/+xbY+0isB+oLa/XC2DjayjGPLUfRBHa6eld+vfV1Vrei2cuck6Di+sQfj829I5/gQsz9UmzhfeCEKftg7mw+gJ2e1iKXxIZceRtSMteYVB2ipkx6AtyrKMCU//4Brt2YKVY7ve+1yDMy9V6TGOnEQnhO/vgkTFwwl3Xqc1ECyY8ajRKjP8Pxb0t2FH5HhWH835nVoRaRObdQ9fLkUFLk8hYr74hVG9VncGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjRVhFyA1kvj1/ITXdYyeVhmLbnmD3z33wuncL4z6rM=;
 b=cz+vHcOVA821/69IEH4mNufp6SHLYRXpXHEHFC8hGp1fixdg31KrV4GNbyCx4tHBQGeQZ9sTatf2kYSSeKnEU10AzZxlbs+Nb65Ua+sIHBSNW5W9cY1m/7yP1UOSPNJrZpVL6GzXzLRNSP07wIJ8B/ql9Q7bGWwemibkh9AZxDrD3lIjxvwlggfoP6CKiwb0iP8vnkI/PWYSQNQq8K8H6QCeikoNG/SxsXeQdHeL6ysYcs1XWVn0y5lctQHTLsMJZ3pEAt2vsH/zGa+nxIBVmBEoT6Vv7zlAUKetQVk04s9GFID+JNaSTmWjTTOPsAm660p4eVDJPzTrJpmRP4O0WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxenguest: restrict PV guest size
Message-ID: <68f5c66d-a908-b2cb-c292-73b1a0efa472@suse.com>
Date: Wed, 30 Jun 2021 15:56:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0047.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c25eaa45-c976-4d48-dfc4-08d93bced884
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7040C6784109910B3805031EB3019@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o3387R0Rk+cj7ot5KhF2selYlBxjCVcqf02C7FneOy6EYMnEx1BEpJh7AmZdRZ9D4wy2CLQfsxgKghTJL7Bkm6RHR19LpST54ivUp/gn+3+ZUpOnsrIzauzz08iev32IE7OgMT9md35vnGIst9xyspTbMPUnlI9pDKUyWU8lykSwB74J3cujjoB+QqtnDYJOAc+UObY9vdttMUgPCgG42Z46UqLqFPegA7LQ7Vx28aRSpO/xumo9WBl3wgjGKUQ/39Q43RFIP0b0WHO8f5qqHC9ziVqwdQ+gOnq2BM875IWr4K8rpkzWP/iqU+lQK0AMMZjlu/ymJXeDSUhfy45l+46FFiKmiVF9agHtpnAmKgN0bgmnmGmuH4fRs2K8FNmK46ofK+gZMlX7YaoecJJ0kT9dBSAMWB562lGywHe+BTWdbyYmwIcuJN2dpHoh665VCq45GbY7bUHhIVzvpE0C+Zdd4GbivhGGlWqiMKsdgFUAOX6oC5jmO4/7FQ9tj58gtOnyjyqgkGhLrByUMELTcxDvjDfn8ocv+wquFo4naTWRbSB2J00NZ2OYJvexPiC+7ccUPvIZWMtEUNvqMlJqsViv0JV8r2DFyb276CXdMUI09bOrLZDWsSLD5toSBc+2SvvtyxwvfvNhvqpTG6pNNJVaPhIIJfJKndwSnos0wj3E+KgXNkk05gza4JwDJEiH2BhEVqVpo6RO9kqM23LmhCbtI+eLRchQ/mU7NXS40Qg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(39850400004)(136003)(396003)(8936002)(316002)(66556008)(66476007)(66946007)(956004)(36756003)(5660300002)(31686004)(6916009)(2616005)(38100700002)(54906003)(6486002)(4326008)(26005)(31696002)(478600001)(186003)(2906002)(8676002)(83380400001)(86362001)(16526019)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3o1Y0FlbmIwTkZQN0pJVmt4RWZ6MktGSkxXZWQxWTFZK2R0VGpUckcxVzIz?=
 =?utf-8?B?SXBteW5Gbzl6RWlrbCtnTXRRTGk5NE4xbGRoRjFmS01qM3JQUWdDSUlvdFpY?=
 =?utf-8?B?VFdOK1BuOTYyemtra3dQZUJ0RUcrYmlhdmJwcEtzU01YL3dUbUdKaUwxR0ds?=
 =?utf-8?B?QlNQWFBQc0NDTXd5bHZSb2NEM3A1VDFVei9PS3Z0V05yRjMyR1FmNC9pVmpM?=
 =?utf-8?B?UFFCK01MT2lYSXJxOHozWWNaUEZCK1g0cG95YXJuUzlIeWZubW9ZeVdUU2p1?=
 =?utf-8?B?b0ltMnVKaUJKZXpSS3BMSmlLYU5mM1NyczcraUJLb1dLT0thRWFHZXlhTVdw?=
 =?utf-8?B?djFrWUsxRGZYZDd4czlPUXZPc2NPUGw3OWdrSU45dVo5bkhOUUZjMlFndXVi?=
 =?utf-8?B?RVNMWmtVRUpuNnNvcGpUTnV1NElOdXNodTFmZGNRUWZqdk5xMVhoMW5TajdR?=
 =?utf-8?B?bTdsZWpVMUdLSW1jTkJzTHF4L1R1S1FJcDdZNm52S2NxQkU2VnVUZFlJMVdo?=
 =?utf-8?B?eGcrOHdHQkU4VDE2azZKZWNyRXp2MW41MDZmSVJRT1MyM2Viek9FQjd6Uks2?=
 =?utf-8?B?NkxJRk1EVXZMQXZNM284dmFhbU1lOElQb3MzUjUrbTM5NDRTa2xCbGszWFdI?=
 =?utf-8?B?YXBRRDJlVm0xcFk2VDlSL2MrV1pQc0ZQN0ppOUp0ekRCMGRnQTA1MmdCYzNK?=
 =?utf-8?B?ZnB5NXNrTXUrV2wvekYvazVtd25mTWpBQURxUnN0WEE2TDBOWG5NTityU0xT?=
 =?utf-8?B?VC95bG9qSVFkT20wUXgrN3d1R2lEQ3dFeXJOaGhxc2hNVWE0c2FDazY4SHBL?=
 =?utf-8?B?YmR2Z3JlcDhjNHZQQklnSTNHYm1sWkZGUTNhTmZ5WDFjQnRFaXk4Z2JpTzlR?=
 =?utf-8?B?TllFQVovVXpKaFYzYWtQNUlyS2VkbEFPL2I4MHZQbk8yTmJTeEszak0yak5P?=
 =?utf-8?B?SWR2alRpVGNvQUZEajgxdlFPd2tBU1ZQRVF0VzdQalo3RSs2TCtMeFlHdmdK?=
 =?utf-8?B?REplSjNjVXpmYitGOURYdVpoTTBlY1h3YmFKVk9WN0lROWxySUpnVlJYSUVy?=
 =?utf-8?B?VGZYUmEzMEgySVdJZmlvczROVnBHcHdPdWw5OHc5QVkwNGt0cFhsMlNBNXdC?=
 =?utf-8?B?MUhVKy92TzRpaFZDd2srS0lJOWQ4R2o5aVBYbTNiSXRBQUlXWjJmTHVlQXNj?=
 =?utf-8?B?TWlhd3MrQ0pFRWNaNktrcEtOb3NNd3BHSkd5OWZSQXphVHZsU0h1ZFNXTGNV?=
 =?utf-8?B?aTNtMUxCUy9OUkdON1JMaGtqaTNzWU1xQi90d25xWU5GUXBBZ0o3eUVqWkF4?=
 =?utf-8?B?dXhsZTZlNnB1R1VlcXYrd1ZiNjZUVzFEb0FSMFdUQXJ6clR3THBBR3BGOGha?=
 =?utf-8?B?Szl1QzcydjgyWFBScVVJcHlSN1FsYU5ZYjhpdk1VQzA2bTBOVU9NZmtJQ245?=
 =?utf-8?B?S3cyaTNabWRxeWpseHAwZktibnFjUzljTkRQdmdib0tqNStTZEdOcUp2bDVB?=
 =?utf-8?B?T29aNzZVMHhtMkVaR0tDZFNJVXpUNWZuUWxKcWFFSTZUT2piemNmSXlscXRw?=
 =?utf-8?B?NUUwcTl4elQ4NlhNM2sya0phZ04rZWtoSE1iRTdQV1ZkY2dNQVBGdWRrbTF1?=
 =?utf-8?B?TFRMa2d0amJWU3dZZUc5UGZKemhkeGJWdldQYklLQyt3SlgvaVh4Z0JCR2wy?=
 =?utf-8?B?cVlZeTVENXNwOVJJMVl1cUdIRkVyd3lSRkEzekY3SkVnaHRFZUN5bXl4S1lt?=
 =?utf-8?Q?BmJwHiChYZVDZFmI6EurNw217zXGSvZV+kgeVqA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25eaa45-c976-4d48-dfc4-08d93bced884
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 13:56:23.4112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+N4NUXc8qrgu4VpYKh2i/joOrYXQj4lLEhA9mG2c13NlMt2rJ0bXngyPdd6wp9rXxQ8eg4IYyWwRdPiGqd3gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

The P2M, the use of PFNs, and hence the maximum valid PFN are purely
software constructs in PV. In principle a guest is free to use arbitrary
PFNs. However, at least page table normalization requires that PFN space
be, like MFN space, limited to the architectural 40 bits (52 address
bits). And of course a 32-bit tool stack places further constraints.

Bounding the values also makes sure that various subsequent calculations
won't truncate values and then continue with inconsistencies (see e.g.
fl_entries vs ctx->x86.pv.p2m_frames in map_p2m_tree()).

While there correct an adjacent error message with wrong way round
wording in restore code and another slightly malformed and misleading
(off by one) one in core dumping code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In case the save/restore change don't make it obvious enough: It escapes
me why struct xc_sr_rec_x86_pv_p2m_frames has p2m_pfns[] with uint64_t
element type but {start,end}_pfn both as uint32_t. Imo all three can
sensibly only ever be of the same type.

--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/libs.h
@@ -13,6 +13,10 @@
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof(*a))
 #endif
 
+#ifndef sizeof_field
+#define sizeof_field(type, field) sizeof(((type *)0)->field)
+#endif
+
 #ifndef MAX
 #define MAX(x, y) ((x) > (y) ? (x) : (y))
 #endif
--- a/tools/libs/guest/xg_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -59,6 +59,43 @@ xc_core_arch_memory_map_get(xc_interface
     if ( xc_domain_nr_gpfns(xch, info->domid, &p2m_size) < 0 )
         return -1;
 
+    if ( !p2m_size )
+    {
+        ERROR("Cannot map a guest without P2M");
+        errno = ENODATA;
+        return -1;
+    }
+
+    if ( !info->hvm )
+    {
+        unsigned int guest_width;
+
+        if ( xc_domain_get_guest_width(xch, info->domid, &guest_width) != 0 )
+        {
+            PERROR("Cannot get address size for PV guest");
+            return -1;
+        }
+
+        if ( p2m_size == (guest_width > 4 ? ~0UL : ~0U) )
+        {
+            ERROR("Cannot map a PV guest with invalid P2M");
+            errno = ENODATA;
+            return -1;
+        }
+    }
+
+#ifndef __i386__
+    if ( (p2m_size - 1) >> 40 )
+#else
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( (p2m_size - 1) >> 28 )
+#endif
+    {
+        ERROR("Cannot map a guest with P2M size %#lx", p2m_size);
+        errno = EOPNOTSUPP;
+        return -1;
+    }
+
     map = malloc(sizeof(*map));
     if ( map == NULL )
     {
@@ -333,10 +370,30 @@ xc_core_arch_map_p2m_rw(xc_interface *xc
 
     if ( dinfo->p2m_size < info->nr_pages  )
     {
-        ERROR("p2m_size < nr_pages -1 (%lx < %lx", dinfo->p2m_size, info->nr_pages - 1);
+        ERROR("p2m_size < nr_pages (%lx < %lx)", dinfo->p2m_size, info->nr_pages);
         goto out;
     }
 
+    if ( !info->hvm && dinfo->p2m_size == (dinfo->guest_width > 4 ? ~0UL : ~0U) )
+    {
+        ERROR("Cannot r/%c-map a PV guest with invalid P2M", rw ? 'w' : 'o');
+        errno = ENODATA;
+        return -1;
+    }
+
+#ifndef __i386__
+    if ( (dinfo->p2m_size - 1) >> 40 )
+#else
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( (dinfo->p2m_size - 1) >> 28 )
+#endif
+    {
+        ERROR("Cannot r/%c-map a guest with P2M size %#lx",
+              rw ? 'w' : 'o', dinfo->p2m_size);
+        errno = EOPNOTSUPP;
+        return -1;
+    }
+
     p2m_cr3 = GET_FIELD(live_shinfo, arch.p2m_cr3, dinfo->guest_width);
 
     p2m_frame_list = p2m_cr3 ? xc_core_arch_map_p2m_list_rw(xch, dinfo, dom, live_shinfo, p2m_cr3)
--- a/tools/libs/guest/xg_sr_restore_x86_pv.c
+++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
@@ -709,10 +709,23 @@ static int handle_x86_pv_p2m_frames(stru
         return -1;
     }
 
+#ifdef __i386__
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( data->end_pfn >> 28 )
+#elif 0 /* sizeof(data->end_pfn) > 4 */
+    if ( data->end_pfn >> (ctx->x86.pv.width > 4 ? 40 : 32) )
+#else
+    if ( 0 )
+#endif
+    {
+        ERROR("End pfn in stream (%#x) too large", data->end_pfn);
+        return -1;
+    }
+
     if ( data->start_pfn > data->end_pfn )
     {
-        ERROR("End pfn in stream (%#x) exceeds Start (%#x)",
-              data->end_pfn, data->start_pfn);
+        ERROR("Start pfn in stream (%#x) exceeds End (%#x)",
+              data->start_pfn, data->end_pfn);
         return -1;
     }
 
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
@@ -464,11 +464,40 @@ static int map_p2m_list(struct xc_sr_con
  */
 static int map_p2m(struct xc_sr_context *ctx)
 {
+    xc_interface *xch = ctx->xch;
     uint64_t p2m_cr3;
+    uint64_t max_pfn = GET_FIELD(ctx->x86.pv.shinfo, arch.max_pfn,
+                                 ctx->x86.pv.width);
+
+    if ( !max_pfn )
+    {
+        ERROR("Cannot save a guest without P2M");
+        errno = ENODATA;
+        return -1;
+    }
+
+    if ( max_pfn-- == (ctx->x86.pv.width > 4 ? ~0UL : ~0U) )
+    {
+        ERROR("Cannot save a guest with invalid P2M");
+        errno = ENODATA;
+        return -1;
+    }
+
+#ifndef __i386__
+    if ( max_pfn >> (sizeof_field(struct xc_sr_rec_x86_pv_p2m_frames,
+                                  end_pfn) > 4 ? 40 : 32) )
+#else
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( max_pfn >> 28 )
+#endif
+    {
+        ERROR("Cannot save a guest with maximum PFN %#"PRIx64, max_pfn);
+        errno = EOPNOTSUPP;
+        return -1;
+    }
 
     ctx->x86.pv.p2m_generation = ~0ULL;
-    ctx->x86.pv.max_pfn = GET_FIELD(ctx->x86.pv.shinfo, arch.max_pfn,
-                                    ctx->x86.pv.width) - 1;
+    ctx->x86.pv.max_pfn = max_pfn;
     p2m_cr3 = GET_FIELD(ctx->x86.pv.shinfo, arch.p2m_cr3, ctx->x86.pv.width);
 
     return p2m_cr3 ? map_p2m_list(ctx, p2m_cr3) : map_p2m_tree(ctx);


