Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23743BC158
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150437.278151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R6x-0002XY-2K; Mon, 05 Jul 2021 16:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150437.278151; Mon, 05 Jul 2021 16:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R6w-0002VK-V8; Mon, 05 Jul 2021 16:06:18 +0000
Received: by outflank-mailman (input) for mailman id 150437;
 Mon, 05 Jul 2021 16:06:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0R6v-0002V5-0q
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:06:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebec007c-ddaa-11eb-844d-12813bfff9fa;
 Mon, 05 Jul 2021 16:06:15 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-HDXk1L9MPlq3KL9IcMYtuw-1;
 Mon, 05 Jul 2021 18:06:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 16:06:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:06:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:205::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 16:06:11 +0000
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
X-Inumbo-ID: ebec007c-ddaa-11eb-844d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5z3JNEifEYR9INV5pKVKLIur8yTgqbc2o4wLLPOUNiU=;
	b=PMISL8RLJxl9mSx7zyz3uC2T/sqNEm8Xm0bMg4eObyayEfIQULU109w7QJgUYHPwY35cYW
	jC990r3Wd02rb9TvAvHijehur1tk3+bgwqG7Q/l0nOhwfg7sZTuPSIOsf3SEm42fIz596b
	ucjS2x1MP3W/rVa0pQlfb1q8yzwtTuA=
X-MC-Unique: HDXk1L9MPlq3KL9IcMYtuw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLlPvQ+HIRYUxTXjhlXUl0ukKG+fB8sMimtoJkQqaEyHCLu3iD1ECHxy6fSSeK8S7zTGNccMj1XEXuSi5qADsTZBov+D4Re8cbBbi9Fe1FSfG295BKrfjQl9c3B/ZsFlM3tdb38EzfXwwGBmdeD677r3uD3xNSva0QFOXw7zh3aCV7OcpuIPYf9lHlfoTWHTxMcFxPZm5jg+MHnenBZlcRQtkJmMMroSjoFC9DRmprAakmqedUQmYIKXfziA5NX5vTcc9gK2/2QzMwKlbJsEHN4G2nRbpfwRq8wUl2I9lDpNQcOfS1YaJPA/hvqwzOHjrbFwDcVMCUhOKnwr8TAqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5z3JNEifEYR9INV5pKVKLIur8yTgqbc2o4wLLPOUNiU=;
 b=HV3VNfIniq9NfFQQtIGHck0NXUjoDYerOb76RLAyX47NsQYGt904MEGGjBpaO9jDURQSVea2r10pWYte+G2GFkxRjgViu45qMhLV5Na8jZE2UZWlXDsjD4B0i1Mj9zzPs1MPYwj6rg2rXKW8LaaYyYZeHjPITtjdXAC4971yDnhmJdQKsKtdFqWltzNyNYY9c6B1m80Kp412D/vRFy1rZzHxcBxzJs9Gt/IfevhNYTCcfhkNyaVihbqfp1saV9kLUJ1TTtue86JlbNTFlyIugIbWk4oi+1llfAHHSP+QqWcj1zCpnuOIxNTiDuKDg1LpkC7G9CIYj13siwia9o5fwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 02/16] x86/P2M: introduce p2m_{add,remove}_page()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <eaf6f63d-1122-f52d-1147-cda40a9c3387@suse.com>
Date: Mon, 5 Jul 2021 18:06:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:205::37)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5208b57b-dd18-49c5-0177-08d93fcecefc
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68617EEF3B04191B3467038EB31C9@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TTZeWjlKy5xhkYWe/Qki0cNsCx0sYsDZju2l7f78TkKSTL5nzqWORgE1yMyAXjn454IS1XzIUy9/7dnde0P1Z5wuQTHYqFvjy29ViwrokkRyGHjYZIHQFUABDCR1wdmXoG1ya6+D/rZrBR8eBNkajvREYE+YCBEq3kXU7ZgeFE21RsPWkddKt0yWVkXPO4uI9ZNwFhZmPg052hffn0twDw2B46fs4LoCFYKHwb36h7sH94+wi2R7kiOSFGOWyzoB1xPcZiGl5QIzkaOXASAwK0Tnl04mz/PNUnzhbg51fgpNNcItnzD+LBDnP0SEva4PXePKySIrSigT3otoaIK8ybIOQTw/QmYCTt8zp/Qu1lxtFThplVh3Cysqp+XiTdJSWBSXnpYIQTyu9EyQCbUtW/WBE2HTQGXgRBHQTguLZJX7SAghdW6ccuQZVRSl/YJXS6V3f95jYcwvRNyxnU7YMaEvim19JLgSVzI2WN4gR5WsBo0w1viQeFoXrjVpDkquw4a56/UIJWX0BX6bK7V1+frzziQV67dS3FyVS2FBvqHaLhjD8GPWndjxMIsShv2giGe8shKQWT6nEjrbw4KrqRMz66RLG6EOCJ55cIo0R/yTf3E+bPWhz4RFQAqPzmIr5iNRcbu8Kq7dIr5KRH9G15fn662NlQ2EEyiLspK3ABhCTXYeDeE9fIONi6r6VzallOy2S7jbH7y3tzD31qoybQ3v3w/8nBtayffNPaGamBg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(136003)(346002)(396003)(66556008)(66476007)(86362001)(66946007)(5660300002)(16526019)(31696002)(31686004)(38100700002)(26005)(36756003)(186003)(2616005)(83380400001)(54906003)(478600001)(6486002)(316002)(16576012)(956004)(4326008)(6916009)(2906002)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWg1cXQ2VWUvZlp5QTFiS2hINEphTjhJT1RWcXRuMFVXTWRVdHd0RGZnSUNF?=
 =?utf-8?B?UGx4ZmhrcTVFZ2E3ZnNDZkoyYnFzdU1zZG9NR3pZTENVYlQyeHU3a3ZZZlhQ?=
 =?utf-8?B?bUdOT2lWWnh6YjhzYURJMEo5b0kxZHM0anRIOHBiTXpMWTNuWm05a0Raek94?=
 =?utf-8?B?MTBwTzFtN3ZFRUg4OXdvWmh2YVRreWdwK1B0YlVNRUFJMURWU0RSQzN1c0pP?=
 =?utf-8?B?eVhGVi94RXZveXRFN3Y4MkxpRktDb1U2UTlGUVM0ci9FWHZkMlpTOFFTK0pw?=
 =?utf-8?B?eXhPN1NQQk1MZ3FOdlVUVERrNGZzUEowdlBlUFhGTDR3N1JRb3pVS1BZbXpo?=
 =?utf-8?B?UnJNQm92bExmYzFjSFV1c3BBZzkwWWliaHdkb09lSnBlK0tpVXJmTjJVMnFU?=
 =?utf-8?B?VS81dXpyOGNLZGJMRFZoelBDSTk4RENtaTdUaUEwQjlic2kwY0d6VDVsK1h3?=
 =?utf-8?B?Q0Jhd3NCYkoxUVpCS0ZXd2V3TThBVDIvQXlpcDNuQTRReFVvNkhmbDllOURh?=
 =?utf-8?B?aVEzTVNsak9vWjU2eXJUWHZaMFlIZFFjV09tbyt5NVRSanljUDU1ZmtXVzIv?=
 =?utf-8?B?K2lXbVkvOUFJUTJ4SEhockl0OVlweTVMUkF4a3FRay9PQ25sV25yalZYK3ZS?=
 =?utf-8?B?VXd6ZDNJREN1OTZoa24vK0pJZkNtdTkvTHBBVjErWUkzbGVMbWtQTmxKc0VT?=
 =?utf-8?B?bWo0dVQ3YzVrWUVDbXd3T3lZMFRaU0dvOGpoS0g1MWRoZ0w4TlFjak5hV3A3?=
 =?utf-8?B?ell5M0p3M3YweUhvY3dxcmUvYlNXZ0VPUmFhbUpQK3phcW5ieVJNMjBiVTRm?=
 =?utf-8?B?aTBYUGpZSVpualBWdEZDOTlNT2c2U3YxbkxzRXh0OGh3K0d1bXRJSXpDcEZF?=
 =?utf-8?B?ejFZYVI1Q2QvYklRbFpqVXZuZmpDQVVpc0ZMUjZlRHEzN0NYTlZEQjhINm16?=
 =?utf-8?B?NGVWemh6MXNHKzFjaEsrK2kzNXNoM2hENHpOdnJTODNTQWpNYnBlT3RLd2pW?=
 =?utf-8?B?ZlB2NGY4MjFmS1VSYVJKTzdiZXgyUWFEN0Z4dWtTMDNOdjVaVTJEai92aW1h?=
 =?utf-8?B?WGNCZ1JyUGlnbzBiRVllU0ZQVXJpTDhPK1M4aXFJbnlFUUppTEU1SVVURjc5?=
 =?utf-8?B?VkFOS3JlL3QvRkdWSnIxNnhSa3JpZnM3ZlJwQ0NiekhITFlkdFpFNDEzdk5m?=
 =?utf-8?B?UTJ0WVJKK1VkUkhiOWswSXlHUVRoSm1FT0h3YUtrdGs2b2ZGcGtwMWdXNUd4?=
 =?utf-8?B?Y3QyRzJKS0wzYllqWWJFenE4NXdLdHd3UmRxdjYyakowb0FVYk91b3oxcFlI?=
 =?utf-8?B?ZWlLcGZrVGdxSU53a3VCdHNGSnhaY3Q4QU1lSFJLbjFlK2s4N1IyTTJkc25i?=
 =?utf-8?B?VVVxYXpOOFpHZExHZWdiWnEwZVVJb1ZSQ3YvYVJUbVpNdGRJL2hkV1g2T2NF?=
 =?utf-8?B?V0NNT0dVS1QvTzlPUUtoeDFyQ1lQZ3NFSkJqRUlHZjdqT3FJTW9idzZqQnFY?=
 =?utf-8?B?UHJhUytNVUEzSVh2QXMrdmFqaTFOMFFqbkxqRDN3RzFodmtmOXJIR045QVZi?=
 =?utf-8?B?VDN5bjh0d0hsS3krUDRHbzBWTUtDV1ZuNE1UUVA4SDU2eVNrSjJLcjFJdkJF?=
 =?utf-8?B?VDc3c3FuOVhSaTZWVkVyb2RONUxHYlhyWEkrbHRIampZVWFvZ1FUUHdIaFhR?=
 =?utf-8?B?MEFkUFUwdHlVdlpRVW9PV2VycXhjYVROd212UnppVW9KRytuME80K0VzSDFR?=
 =?utf-8?Q?u34YyA0fBRaK40dmaiUQjqjYnG1xleGL+HMeWyc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5208b57b-dd18-49c5-0177-08d93fcecefc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:06:11.9140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xS7A+dLAzxxa9VfzbjjqIIkiho6eNd1eDa0vB7FQbK1iJ8vNspN1c/plNi6EWWkECzIGIw52Xizo9G+yGW16Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

p2m_add_page() is simply a rename from guest_physmap_add_entry().
p2m_remove_page() then is its counterpart, despite rendering
guest_physmap_remove_page(). This way callers can use suitable pairs of
functions (previously violated by hvm/grant_table.c).

In HVM-specific code further avoid going through the guest_physmap_*()
layer, and instead use the two new/renamed functions directly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -174,8 +174,7 @@ static int __init pvh_populate_memory_ra
             continue;
         }
 
-        rc = guest_physmap_add_page(d, _gfn(start), page_to_mfn(page),
-                                    order);
+        rc = p2m_add_page(d, _gfn(start), page_to_mfn(page), order, p2m_ram_rw);
         if ( rc != 0 )
         {
             printk("Failed to populate memory: [%#lx,%#lx): %d\n",
--- a/xen/arch/x86/hvm/grant_table.c
+++ b/xen/arch/x86/hvm/grant_table.c
@@ -39,9 +39,8 @@ int create_grant_p2m_mapping(uint64_t ad
         p2mt = p2m_grant_map_ro;
     else
         p2mt = p2m_grant_map_rw;
-    rc = guest_physmap_add_entry(current->domain,
-                                 _gfn(addr >> PAGE_SHIFT),
-                                 frame, PAGE_ORDER_4K, p2mt);
+    rc = p2m_add_page(current->domain, _gfn(addr >> PAGE_SHIFT),
+                      frame, PAGE_ORDER_4K, p2mt);
     if ( rc )
         return GNTST_general_error;
     else
@@ -68,7 +67,7 @@ int replace_grant_p2m_mapping(uint64_t a
                  type, mfn_x(old_mfn), mfn_x(frame));
         return GNTST_general_error;
     }
-    if ( guest_physmap_remove_page(d, _gfn(gfn), frame, PAGE_ORDER_4K) )
+    if ( p2m_remove_page(d, _gfn(gfn), frame, PAGE_ORDER_4K) )
     {
         put_gfn(d, gfn);
         return GNTST_general_error;
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -188,8 +188,7 @@ static void hvm_remove_ioreq_gfn(struct
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return;
 
-    if ( guest_physmap_remove_page(d, iorp->gfn,
-                                   page_to_mfn(iorp->page), 0) )
+    if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
         domain_crash(d);
     clear_page(iorp->va);
 }
@@ -205,8 +204,7 @@ static int hvm_add_ioreq_gfn(struct iore
 
     clear_page(iorp->va);
 
-    rc = guest_physmap_add_page(d, iorp->gfn,
-                                page_to_mfn(iorp->page), 0);
+    rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
     if ( rc == 0 )
         paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
 
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -829,15 +829,17 @@ p2m_remove_entry(struct p2m_domain *p2m,
 }
 
 int
-guest_physmap_remove_page(struct domain *d, gfn_t gfn,
-                          mfn_t mfn, unsigned int page_order)
+p2m_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                unsigned int page_order)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
 
-    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
     if ( !paging_mode_translate(d) )
-        return 0;
+    {
+        ASSERT_UNREACHABLE();
+        return -EPERM;
+    }
 
     gfn_lock(p2m, gfn, page_order);
     rc = p2m_remove_entry(p2m, gfn, mfn, page_order);
@@ -846,6 +848,17 @@ guest_physmap_remove_page(struct domain
     return rc;
 }
 
+int
+guest_physmap_remove_page(struct domain *d, gfn_t gfn,
+                          mfn_t mfn, unsigned int page_order)
+{
+    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
+    if ( !paging_mode_translate(d) )
+        return 0;
+
+    return p2m_remove_page(d, gfn, mfn, page_order);
+}
+
 #endif /* CONFIG_HVM */
 
 int
@@ -884,14 +897,14 @@ guest_physmap_add_page(struct domain *d,
         return 0;
     }
 
-    return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
+    return p2m_add_page(d, gfn, mfn, page_order, p2m_ram_rw);
 }
 
 #ifdef CONFIG_HVM
 
 int
-guest_physmap_add_entry(struct domain *d, gfn_t gfn, mfn_t mfn,
-                        unsigned int page_order, p2m_type_t t)
+p2m_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+             unsigned int page_order, p2m_type_t t)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     unsigned long i;
@@ -2665,7 +2678,7 @@ static int p2m_add_foreign(struct domain
     {
         if ( is_special_page(mfn_to_page(prev_mfn)) )
             /* Special pages are simply unhooked from this phys slot */
-            rc = guest_physmap_remove_page(tdom, _gfn(gpfn), prev_mfn, 0);
+            rc = p2m_remove_page(tdom, _gfn(gpfn), prev_mfn, 0);
         else
             /* Normal domain memory is freed, to avoid leaking memory. */
             rc = guest_remove_page(tdom, gpfn);
@@ -2673,7 +2686,7 @@ static int p2m_add_foreign(struct domain
             goto put_both;
     }
     /*
-     * Create the new mapping. Can't use guest_physmap_add_page() because it
+     * Create the new mapping. Can't use p2m_add_page() because it
      * will update the m2p table which will result in  mfn -> gpfn of dom0
      * and not fgfn of domU.
      */
@@ -2771,7 +2784,7 @@ int xenmem_add_to_physmap_one(
     {
         if ( is_special_page(mfn_to_page(prev_mfn)) )
             /* Special pages are simply unhooked from this phys slot. */
-            rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
+            rc = p2m_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
         else if ( !mfn_eq(mfn, prev_mfn) )
             /* Normal domain memory is freed, to avoid leaking memory. */
             rc = guest_remove_page(d, gfn_x(gpfn));
@@ -2784,11 +2797,11 @@ int xenmem_add_to_physmap_one(
 
     /* Unmap from old location, if any. */
     if ( old_gpfn != INVALID_M2P_ENTRY )
-        rc = guest_physmap_remove_page(d, _gfn(old_gpfn), mfn, PAGE_ORDER_4K);
+        rc = p2m_remove_page(d, _gfn(old_gpfn), mfn, PAGE_ORDER_4K);
 
     /* Map at new location. */
     if ( !rc )
-        rc = guest_physmap_add_page(d, gpfn, mfn, PAGE_ORDER_4K);
+        rc = p2m_add_page(d, gpfn, mfn, PAGE_ORDER_4K, p2m_ram_rw);
 
  put_both:
     /*
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -571,10 +571,11 @@ int p2m_alloc_table(struct p2m_domain *p
 void p2m_teardown(struct p2m_domain *p2m);
 void p2m_final_teardown(struct domain *d);
 
-/* Add a page to a domain's p2m table */
-int guest_physmap_add_entry(struct domain *d, gfn_t gfn,
-                            mfn_t mfn, unsigned int page_order,
-                            p2m_type_t t);
+/* Add/remove a page to/from a domain's p2m table. */
+int p2m_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                 unsigned int page_order, p2m_type_t t);
+int p2m_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                    unsigned int page_order);
 
 /* Untyped version for RAM only, for compatibility and PV. */
 int guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,


