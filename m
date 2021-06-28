Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE793B5D71
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 13:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147818.272860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxptb-0006K6-Ve; Mon, 28 Jun 2021 11:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147818.272860; Mon, 28 Jun 2021 11:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxptb-0006I9-QT; Mon, 28 Jun 2021 11:57:47 +0000
Received: by outflank-mailman (input) for mailman id 147818;
 Mon, 28 Jun 2021 11:57:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxptZ-0006Hx-N5
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 11:57:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8ac53c3-03f0-46f4-8880-020c66095cbe;
 Mon, 28 Jun 2021 11:57:44 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-RCcSi6Y-Nwe7nxlf8Npi1A-1;
 Mon, 28 Jun 2021 13:57:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 11:57:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 11:57:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.20 via Frontend Transport; Mon, 28 Jun 2021 11:57:40 +0000
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
X-Inumbo-ID: f8ac53c3-03f0-46f4-8880-020c66095cbe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624881463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtO2paUlv26XhxGKVu8ApzECI4X2+KAJunwAtx7j8Ww=;
	b=W2ps62uwOaB4Az4l+Icw8kVmSuup9gOZsT6RZqC1OJUGeso8+T2cF+ymLZzT8HrV9LsSa9
	I5gqJTDhmilXzc/GipU+JSm/uFyaRSLjvQEWnEY7FMnHfC9GUSke9MybaP0kRcNt02vw81
	anTUUylTfStFH8tYWDXEgUuYr457YGU=
X-MC-Unique: RCcSi6Y-Nwe7nxlf8Npi1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QC+QQRyeQU5PAhO3tzbezxiVihyT5k7DnZ2yQ5QE3M16HUiMPMc8cxNr8fLnIpc0rSF5kOXuxUllNAdYsN+L/ywCBAUN/KcpoUhtw8x8YKS/a4HbguxIKmW/DWXRt3ov1ldI5AjILXlm8wIVbsmUy3+QZsdQH8ssrw6FsgFIy7cV5pk3EOBpfkonzxdxd0NxubyQdNfb3LIiC4vZK1TLSnuVfJZbfULVZ6AYNRlEMr+avZQw96n6ugg+i8e+mxaN7Seg0VSToct91CfDGb7zJ79VP8cxAqU6Yhxef4HC/WkgGsTMx8tU2HVkcgqDqpUKhI7lciWELRmmPT4qIqQc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtO2paUlv26XhxGKVu8ApzECI4X2+KAJunwAtx7j8Ww=;
 b=ip/vmGX9NqkF/j4F1VEs0rmkoJfAqwXu0sLWQOjinvZ2l7sVde8ClczKYRV4qz1QOS/yDZ4O1AV/wJuS3SsCVM8ElYzag1areMXkhbL6xgTR66YT7+iB3mlNxgm79Ql6kgCQfPh/a2fCBP6tb3awVApJISn/+2Qii9nyGhIGEyA2Xcr6x9HXJQL1tGi4JgKZIt1+i5irJ4uqeTHDr+QgI+HkMRRx7OjFmOnAUaQ/Chy2QEZAUhp2P9tu/rBHaNDQtqK7GQvIMXHy1Wu6+UHURSB5ycYEZ1PyufPGDqij3wxPSe7Ra3DA7iHOi+VzGBBoF7PNb2J0rKmY/+CeoJrDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/2] x86/vMCE: adjustments to unmmap_broken_page()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b16904ec-0302-4094-7d89-f484cbf0f8a5@suse.com>
Message-ID: <48a34cd8-e9aa-d251-7838-4edd071050dc@suse.com>
Date: Mon, 28 Jun 2021 13:57:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b16904ec-0302-4094-7d89-f484cbf0f8a5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM9P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b921dae-461f-48ce-7708-08d93a2beeb4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4192840187CA901AA24AE337B3039@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JFfr1IFMP819mmsJ+YHjaPg3xnhQY8hAX0rJ+Jy2kHcvfmGihfEWX9JTiE8MNz0ueB6ZwQBllvBw5JKngyvOeT299cmnF1NVxwOC5d0JKMS7rc8uOEwXdSZs9IOIkv7OGh3bcPIJjFz/8MdFVCVhlDjb9Rh5eiBGeHCeyAtWHxwvD/B1La4GkwMqC76bralUpfDiUmY9USti7lfeIEA0QLIy47Vx/vM41tLDnGCtrvQw4ouL13V87hY0vXdtVFFmKt/1oVWpFSqHG9MCBoc+ue3bYG+rKocDbzR/8yCDOjuDJj9LDxa6dzzTTIc8dfQ0HhSaH++HO2IH5TMfY2rTLVx3VzV/nv1HXjkGC/CnmA8Lvd4i5ecp9RuBJOIGgrsD9Ll8kUGeFWlChSMOZd368KE0K9MXDG23LFMd3s7gT4jCLJVLo1GmT823rrHb/Bv6dO3o/vqnlQPP29uiUSbqkbBstfzbBUuXsHzSR5OWPxx5pb3HFb2aaHeHSqVIowzAIXHn44gdWDLQmU9W2HR7FQ/GX92JGu4lQ+XffoEyyCVDVAy5fygVS5AglylvNeSOJTO7yACL0dPN1Rn2XLANycXp8A7iG2rSYT/cIVpsuB6npGZypqwWvK0GO0HYMUKGAlPrj62dc5n4Ec+zBsZd6RCLnGeoXKsZo+jreYNBJsgrxmd3FoElbKIOZzrbVgCj6qqWe0PIkfFo0Gp65aHetyFMfBDZ8N16DDRlzKq1EHZEXtHVDwYUxFmeZCzn173Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(396003)(136003)(39860400002)(31686004)(5660300002)(2616005)(2906002)(956004)(478600001)(66556008)(8936002)(36756003)(66476007)(31696002)(6916009)(8676002)(86362001)(66946007)(6486002)(316002)(54906003)(16576012)(4326008)(83380400001)(26005)(186003)(38100700002)(16526019)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2J5bHlqL05WRjZFRHp2bVZEemhDblB0dmtxQVNwdGdJeTQyNWNxbTBvZ2Z1?=
 =?utf-8?B?a3dsT0xMU0VqSXBaVjlOZ1RKK0tTS3NjSlVBbVFLNHdNYUdKKzg3Z2M3K3dM?=
 =?utf-8?B?S0lRUGhNWWtyVG9RcGlSeHZsQUYyWS9rb3QyZ2Y2NDhYbHVnNExkdXVNQkxQ?=
 =?utf-8?B?enV5bXhvMS96REFWK2pia0NNaTluNkZadHRvNWlWdWVYWVNRNG9sajdzTERO?=
 =?utf-8?B?MHpHRTZnNlYvc1o5dnp0VzZCeEZDQjkxVi91WlUzSG0yR1Q5L1BLak5YUHpK?=
 =?utf-8?B?OUJna3FhMktUYmV0bkc4eWJsV0p3RnY2aGtGR3cybXZHTzFnMEhYWis2b0tE?=
 =?utf-8?B?YXhVQjJ0UEc2dmYxby9NNk84RUFYdkY1Q0pLYVFzbEJwb3hnLzl2QWpnaHdh?=
 =?utf-8?B?dG9EenVFOWJ4eFNWMUhYeGpCeXhIVWF2RENQcytXa0FpSVV1ajhzc2IxNGNF?=
 =?utf-8?B?SXJ1aUdQMlZnTjREZnNndFpmYWd4TnZjaG1ralpYQ2dTd0xldTBvbHF4Wkd3?=
 =?utf-8?B?ZVlCS0tUWVJucFloOTdyekNqRWlLRmUyMHhmN2pZNWdHSVM5T093OC9VTDJO?=
 =?utf-8?B?dlJtVDFlRUlMcFIvTzhaU3ExK0hyV25xQlJHeldTTHhBV0N2ZGNWOC8vY00z?=
 =?utf-8?B?YkxGMWNDTk5CR2xIcWxuRHRMaCsyYU5VS01uRTVMakxoZ3RlNVlkZm9SdTkv?=
 =?utf-8?B?Y29LdG16TkZLR2VyVVJaSkxnT2JraE92WEx4K0t1aUJnaWdua3hlY2NWVUcz?=
 =?utf-8?B?cnpjMStSSlJPZWQyTHJOVW4rbXB6dVArMkMwVHBWN2xZbWQ1eklGOENuOExq?=
 =?utf-8?B?bDh0NUVBTDZTL3JHQk1raTNEaGxONGhMbzZMWXNhNDd5UC9KSDM2amVjZXdx?=
 =?utf-8?B?bmpobENzL3FRZ3VzRVBnK09GT3RvM3R6VXlxT1FWVUhGd0xleVhnNE5tcHZk?=
 =?utf-8?B?dzNuNnhhWTFEdmt4RUE3UWowUmRRYWtmaHY2eGVIK0lqNjdGejdZRVVuZm5i?=
 =?utf-8?B?NDhWSmdwRkg2YkhvQ1VST3BIc0kvYkJoTGoxWW5xV2lEVHFGa2pCYlY3Z21X?=
 =?utf-8?B?bUNVWFhFaTJoL29DTlpSNnl4b1E0c0JqTDIyYlFreTZrREgvaDZyL2xuR0lR?=
 =?utf-8?B?OFQyanFsUHR0QlQ2VThGWWxGa2t0d2toZVFCanhjcS9nZGl2anFlNEFTZkFW?=
 =?utf-8?B?a05vdnpWUkwyTVF3bjBtZ3VJa25QNTUzMmwvWTE2WUZuT282MUJLL2JwaFVi?=
 =?utf-8?B?cGZYbDBIMXFFRHArTk5oMWo3ZHdsaUNHMVhTc1lXZkVOMnh5Rkt6U2lDR0No?=
 =?utf-8?B?WlVRMzlwNXV4eU5YaGNhWWlFT0lXODZVeG9mUkc1MU8xN21ZT2Rud0IraW9X?=
 =?utf-8?B?Y0EwWDdIa2x4c1pqS3dkb3AxckhDVUptTkZSdGIrWTZPbDIvQjdVbWpndDln?=
 =?utf-8?B?S3FUR3VNVzBuZTJGL2lKQVp4cnZNR1RBbHZEcXVPYlRLTjZpMjU1ZDJrbHdH?=
 =?utf-8?B?Zm1BeHFKbzdEV1dHT2Y1cHVzZkxkWGl0ajJmQnpSQlFwajVZeSs1ZjVEUjRh?=
 =?utf-8?B?aDlCOXJXNWdqbHBORnlpT3l6VWZRMGJVaWxyOWQ1bnJGYnY5RnJwVXpRdURq?=
 =?utf-8?B?elcxRVJOLzIzWlBLRFNNYXZLY21tUmlwYkxRZ0ViZlhDU3JhSmZYM0VzbnJC?=
 =?utf-8?B?by9uYWhWSEQvaks3WFRUK1VaeUh1MjNBRENBbjBDYkh3SXBFOVQ0RmpDV2tY?=
 =?utf-8?Q?Cm9nz7rJE4P/MNmq5tQhxWMc87GN9sBZUcZhAR4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b921dae-461f-48ce-7708-08d93a2beeb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:57:41.3454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFs/ijRVA3/IeekULe4ZoKIH1bAiPQVBAahXSpFnxOxMiDIIYB54pmwiDDS3K0ungBBKHJRFaGhYDCb3gh+DLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

There's no need for more than an assertion as to the passed in MFN's
validity, as the caller's prior call to offline_page() would not have
succeeded on an invalid one.

There's no use in checking both is_hvm_domain() and paging_mode_hap(),
as the latter implies the former.

Extend the P2M manipulation that's there also to PVH Dom0, merely having
it using the prior PV Dom0 related behavioral assumption when the page
type cannot be changed (yet).

There's no point in P2M_UNMAP_TYPES including p2m_mmio_direct. The
respective comment is bogus afaict, there are no RAM pages getting
mapped with that type for the purpose of becoming UC. The sole RAM page
getting mapped with this attribute is the (now global) APIC access MFN.
(This page, if it went bad, shouldn't have any effect on the system
anyway, as it never really gets accessed; it's only its address which
matters.)

Make the last function parameter type-safe.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mcaction.c
+++ b/xen/arch/x86/cpu/mcheck/mcaction.c
@@ -91,7 +91,7 @@ mc_memerr_dhandler(struct mca_binfo *bin
                 ASSERT(d);
                 gfn = get_gpfn_from_mfn((bank->mc_addr) >> PAGE_SHIFT);
 
-                if ( unmmap_broken_page(d, mfn, gfn) )
+                if ( unmmap_broken_page(d, mfn, _gfn(gfn)) )
                 {
                     printk("Unmap broken memory %"PRI_mfn" for DOM%d failed\n",
                            mfn_x(mfn), d->domain_id);
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -502,11 +502,9 @@ int fill_vmsr_data(struct mcinfo_bank *m
     return ret;
 }
 
-/* It's said some ram is setup as mmio_direct for UC cache attribute */
-#define P2M_UNMAP_TYPES (p2m_to_mask(p2m_ram_rw) \
-                                | p2m_to_mask(p2m_ram_logdirty) \
-                                | p2m_to_mask(p2m_ram_ro)       \
-                                | p2m_to_mask(p2m_mmio_direct))
+#define P2M_UNMAP_TYPES (p2m_to_mask(p2m_ram_rw) | \
+                         p2m_to_mask(p2m_ram_logdirty) | \
+                         p2m_to_mask(p2m_ram_ro))
 
 /*
  * Currently all CPUs are redenzevous at the MCE softirq handler, no
@@ -515,30 +513,25 @@ int fill_vmsr_data(struct mcinfo_bank *m
  * XXX following situation missed:
  * PoD, Foreign mapped, Granted, Shared
  */
-int unmmap_broken_page(struct domain *d, mfn_t mfn, unsigned long gfn)
+int unmmap_broken_page(struct domain *d, mfn_t mfn, gfn_t gfn)
 {
-    mfn_t r_mfn;
     p2m_type_t pt;
     int rc;
 
-    /* Always trust dom0's MCE handler will prevent future access */
-    if ( is_hardware_domain(d) )
-        return 0;
-
-    if ( !mfn_valid(mfn) )
-        return -EINVAL;
-
-    if ( !is_hvm_domain(d) || !paging_mode_hap(d) )
-        return -EOPNOTSUPP;
-
-    rc = -1;
-    r_mfn = get_gfn_query(d, gfn, &pt);
-    if ( p2m_to_mask(pt) & P2M_UNMAP_TYPES)
-    {
-        ASSERT(mfn_eq(r_mfn, mfn));
-        rc = p2m_change_type_one(d, gfn, pt, p2m_ram_broken);
-    }
-    put_gfn(d, gfn);
+    if ( !paging_mode_hap(d) )
+        /* Always trust Dom0's MCE handler will prevent further access. */
+        return is_hardware_domain(d) ? 0 : -EOPNOTSUPP;
+
+    ASSERT(mfn_valid(mfn));
+
+    if ( !mfn_eq(get_gfn_query(d, gfn_x(gfn), &pt), mfn) )
+        rc = -EAGAIN;
+    else if ( p2m_to_mask(pt) & P2M_UNMAP_TYPES )
+        rc = p2m_change_type_one(d, gfn_x(gfn), pt, p2m_ram_broken);
+    else
+        /* Always trust Dom0's MCE handler will prevent further access. */
+        rc = is_hardware_domain(d) ? 0 : -EOPNOTSUPP;
+    put_gfn(d, gfn_x(gfn));
 
     return rc;
 }
--- a/xen/arch/x86/cpu/mcheck/vmce.h
+++ b/xen/arch/x86/cpu/mcheck/vmce.h
@@ -9,7 +9,7 @@ int vmce_init(struct cpuinfo_x86 *c);
     (hardware_domain && \
      evtchn_virq_enabled(domain_vcpu(hardware_domain, 0), VIRQ_MCA))
 
-int unmmap_broken_page(struct domain *d, mfn_t mfn, unsigned long gfn);
+int unmmap_broken_page(struct domain *d, mfn_t mfn, gfn_t gfn);
 
 int vmce_intel_rdmsr(const struct vcpu *, uint32_t msr, uint64_t *val);
 int vmce_intel_wrmsr(struct vcpu *, uint32_t msr, uint64_t val);


