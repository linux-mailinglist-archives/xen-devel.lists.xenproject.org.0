Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D671C677E78
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:55:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482963.748795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyEG-0006Eb-Pe; Mon, 23 Jan 2023 14:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482963.748795; Mon, 23 Jan 2023 14:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyEG-0006CW-Ms; Mon, 23 Jan 2023 14:55:24 +0000
Received: by outflank-mailman (input) for mailman id 482963;
 Mon, 23 Jan 2023 14:55:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJyEF-0005Sn-GU
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:55:23 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2044.outbound.protection.outlook.com [40.107.104.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5853384-9b2d-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:55:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8422.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:55:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:55:19 +0000
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
X-Inumbo-ID: f5853384-9b2d-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzHcLqMRkQoh1rloIw5lkw+1b3GwJaGQIPTIRT/XdgjGkHIGrvL+MiflvntiSSdSi1r2LVB7vHxRGmpCHzdhb294dm+jTgrkp05uOlOwD9OOWB5QLhRiCpX/6CGyyKlDENGVpHzbOdPR/ZCcYyi2XRfAQa2fwPdMiTBbPj0i0+yj4gfnwajQg18O+YjifnP9STrSR/aCubNjP0U23hx0/cqTah4fyiPsc56D1TcxJLC1gG71apwfdquutn3Pl2Xz11E7+A4/poAz8xsIb/w+a92b6kCYkKeh6p7BQeBzjQi2lJiIljrdu5CyZG7sO259JrAj6EsTQ2bOQ758Ln/akw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBd5rNRYBMnhzTJl9KZ9diTDyGeUkSl/k2wQJ+HyU7U=;
 b=JYLTn6/+r0RcRmXyskZbbCi+kEtdkN814whmGZUo6b6uMCBmgwevG9IynJhBXf7XPWzZRZvO8k7vuZfqJ49342oMHqLhf7TMXHTultorxfhJwHuRwZpzQmEZLlMc9xQY2L/l90in+bOEDGX3By74oB+yyw6Z1DjuMymS57BSKQi4rUUCvIFcuFBg3maqgm7lVCxfG222sWvaANiFz6mBOEpNxw6oNQREEq7KQejRoVuMMKucSR5bxVYjPxl32JZtzSZ1ANho2fZlhXMQDd4gBBGZ0S3mkRwcSz4b8snDBCMrnDRCGdQUTDxNL8q1BKG8MEgxwWr6++SpSWl6IvPO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBd5rNRYBMnhzTJl9KZ9diTDyGeUkSl/k2wQJ+HyU7U=;
 b=jqQ6wd3VAEQhcCF8TG7Q7xxoLFkk9OMsoeDsKZYSXUB8R2j+TLL6OoP5fB855FmpRIidbDmeDUK/1pVCrHthPWLBYboRehk8sV1zx7rg9ipmubwr+erEiNaeLcCYzBLKKTECS50+kwmww0KvZLlvH2GulSC+3IEgszmYNt3Fk62rdeRInBUqHeMx3bmJDLuELcqnkM7KtIAIIax+yL8fElwUYXq4b+wbc9ISHITi9164EuSWXDPgOiThPDyr40fOrBPi/hPU+C5qIJM3rfy6Pw54aWi+MdcfK4lb8JSDpBqmDCWSjf7uYThDqYPJJr+1+jMbtGBi5Mhq3I9rNWTMFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dad36e4c-4529-6836-c50e-7c5febb8eea4@suse.com>
Date: Mon, 23 Jan 2023 15:55:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 4/8] x86/mem-sharing: copy GADDR based shared guest areas
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
In-Reply-To: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2ebd09-5ba0-4ff8-393f-08dafd51d87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	elneRqC9nPRAGLqIAnJ8y8dJWE78p4dW+sY5KOdnUO3C+D9MHr0ZM58Ve/d1uvjNXyBrKplbFCTDfhvG6NwGmk3BVfGRGQ8LfEVz71SUgT1ydUQvbOlAz6Mi+Isw7PDsmKAfYD1yd5kcQzUFjZYe7Gp+I+lbVYgZri1sAYtkjcpJO5+N0WXzJrN/q8Bz1UVO7WpEHUfV/Bk9wpI63e7YebtTp4To1j4WzyzS4F5cxHiY3qnivdbcJJs9WLoMK4NxzkfI5STtb6Zbqyzi9rPGF0FTN8/TafWOiF6aF1mhOgMuPHlKTwSIdje24QnmovVGDSQFZJWhuInuNhBLdYMyElOrugnZDNfes4eGQRZGEEajoXxU6v95NGEQoetWenD9DebwtLY1082JFRnZTjg53penF/MocJ1+V6zaHVGcz0qArGutfjPN1s0GFLc9BljzXoF0GXvnecY1hO0vH/p2n11p5Ho4r3SzPMOqiEuXsHzSXhc2Atq1hb6PVr7X+bVU7CLrrXUsTndYfon6sn3JSSzVGU8m/5CqFgXYQcQm2MH/hTTP4DVrCzATD4+i7H3IqRcyl1jst2zNIpNTwULOo8K7Wt04Zpm/7nnsp+4jS5yB77sd2xi0c2pNn2c4Qvg9tBXXe+x590iSWkUFAwDRQnnQ6Th5Nia2JNqqVeREhSbrkxOeKeSlhrQ/TWGfugbsv/5wPGm3/pRxCDuimXLqs0L4nlc2R/BTLI9Uz3y1m9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(39850400004)(366004)(346002)(451199015)(31686004)(2616005)(38100700002)(31696002)(41300700001)(2906002)(8936002)(5660300002)(4326008)(8676002)(6916009)(6506007)(316002)(54906003)(36756003)(83380400001)(66556008)(66476007)(66946007)(86362001)(478600001)(6486002)(26005)(186003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0RHa3F4R0FCODJ5azAxRTFHQ2trTHpCTEd5M1dDQlZUYmQzam5XOU5ZanNU?=
 =?utf-8?B?SWcrajg2c0R5SHVwa3VncndOQWtyYUFYektONG5EL05sQmY5b1FXYXJRMUg4?=
 =?utf-8?B?SllsYkRPV1Q4Q2RkWVhBYVIrTjZvT2N6T0VPS2l6T05FbGxLOFExSjJqSnhV?=
 =?utf-8?B?ckN4OXBVdUduUDJkQ2RMOWpGQ0U1bm01M1ZqeTJpSm04THZGMW5UMENrMjlj?=
 =?utf-8?B?ZDBZSzZJWG4yWUdBM3I2bGhDOG5xZytWc2ZtaTVDd2tURjMwRUltRFEwWEh0?=
 =?utf-8?B?OE1jdHdsU1AzK1R6bXhDWS9RU1NsYnVnMUdpMVoreTY2ci9zTjF0TjlNU0hs?=
 =?utf-8?B?ZmtReXkvQ1l5UWJtWnZRbkwzdUIwLzdQS3Y3a3l6MGdiMTRpQWVlUEsvdXB4?=
 =?utf-8?B?VkVRd2RVb2MzcGRhY01FV2F0dVNFanc3MHRWY284R0NYWk9tdXNNUlZWM0kw?=
 =?utf-8?B?Ry83NlVNQkJwTmxjdGJaTU15MFlYdUdBUkpsQWszOFFTVVFoaHJhTEV5OWhG?=
 =?utf-8?B?c04zdk0xVTZ3dVFhYnFyYlJtRmlpWGhCL1FpeUNFMXQ0RTY0WDdtc2RSYTk5?=
 =?utf-8?B?S0QzSTR4cjlpVHByTVN5SHRBN0QzQ3dqNDg4cHpwR0JjSWdidE9XNmZQaStE?=
 =?utf-8?B?SnRtR3MrbnFMQ1lmMzlZZ3FTQ2NNdHhRRWx5VVR1K0FCdXlEc0V2eXl3UUtj?=
 =?utf-8?B?ZjlQMTlpUDFMN25ZQ1oxcWFxSnBlNEdNaEtzeWQ0S2lCY1RNWXA1YlBqc1BJ?=
 =?utf-8?B?Z3dvOUNESXIrMndXNlNpaGR5dm1WZFg5VXBkRWNGNTg2VFFYYmFlamxqenRR?=
 =?utf-8?B?SExsTjZtQ0xxWFVaTDloWnl1UjYxZndpV3VRRzN3azdRUU1qN0ZyZHB6R25W?=
 =?utf-8?B?bm1LL3BsMzk3dStDdGwyN3p6OXFTTEJqTmhZelBpVkNKUkNPdFRrOGx4UWRs?=
 =?utf-8?B?ZlZVeDNPT3RzRnNQRExNWk9FanhxcEhQSUtsbERvS0YwTElsY2RMOFA0KzZr?=
 =?utf-8?B?K1VhM3R6ZXYxZEwvVi9vSFgxdjBITnlPb0x3cGlRRmtPWHNic0U3bndnNEhJ?=
 =?utf-8?B?MVVYVGZaS1p6NitRSHVmZUt5aElBaDc2bTlXRm5KdVBKbEZjQkFHTnRCRzQz?=
 =?utf-8?B?YjQyNnFRMGhaUndOUXBpZHJWTzVDN3lUemY3eVJlM1RDVVl5ei92bS9odytQ?=
 =?utf-8?B?WWU0SUZTWFNJVU9lVU1ZWmZoaHpRYkN0T0prNzl1cys0S0FHd0N2cFFRcXhM?=
 =?utf-8?B?WUhxTTRYWU95eldrZ2tYRExER21BY1g5RkFOZ0xLTHpqT0o2dmt1UjlvZ1BN?=
 =?utf-8?B?dWVCd3FXMFczZ1hnTTQ0N2ZnWHBEb3lMUDJScE9CdUhTY1JDOGtlaXBGZ1RK?=
 =?utf-8?B?eW1QY1NsNWw2QmU1Y0Q3bVFnVHA3QnlBOUNha2IwQUZmaUMvNS9xWWQzbUhr?=
 =?utf-8?B?WStpTWdxbmRsejVvQ3dNRzBjcDJuditQLzdjNmJicUVRSXBaMXl2U2xwK0dl?=
 =?utf-8?B?a0V0RGNrU0pCanRGczFGWlVxMDhTNFVReFpjVGVONk1ZajM3SWZvSXBtWXNr?=
 =?utf-8?B?Zkl1UTZLWnBlTDFFYWhvVUJHUGxBVG1jRHdkaHdWZHIvZzRROWNWYlV1VGxZ?=
 =?utf-8?B?MjRXQ0FEdGkvZGh1M1dTMnF1TXZuYzd2L3B6YVJMWGNhK3B5U01oby9GRjAz?=
 =?utf-8?B?aVlYcWpOWnhMOXJtSnlkVmFMTStBZGh5RVd4OC80QlJsaEZTSi9Dakt0eGdp?=
 =?utf-8?B?cER2U25xcm02Z0lzbk1XS1NoSnZmTzdycG1oYmZRb3ltRTRJQUdrc3BKejNI?=
 =?utf-8?B?ZTlrdzdyUGhhWFRhb1FwQmZ5VzRrSEFkaUx4NjRzcnpYaUNUOUlJemw5UEZ3?=
 =?utf-8?B?OWpWS1dpZkdkbjhpQnFIRVA1MTdiMlZQWFBLWWxPZkhncHRNS1hrcVRHZEtZ?=
 =?utf-8?B?Sld1K2hCT2xxaC9ja3E2WEl4NGp0OWJHQkQvUWNPMitWYndXdlQrS05HSnlG?=
 =?utf-8?B?bzNrZm55Y2ZoMHBvQzZ2aFRiMXVVMmVYY1QzRWI0blRHWFpTRzllNkhuc2kr?=
 =?utf-8?B?STh5TVFuNW10aFVwekFFdjBydG9nemVSSGRSQUJMdm04ZEdPNzZGUHhWWm5O?=
 =?utf-8?Q?ey5cHqTR99atvet/RuZCXciUZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2ebd09-5ba0-4ff8-393f-08dafd51d87e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:55:19.5175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcYAo8zWFAtzPK/kfagqhfAV5xwaJ2vrFjqwf6G6/qTJQIZA0S2bAjEq+GTsCqEXLCb9OeCwRugM8O9kAG3ncA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8422

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, add the necessary fork handling (with the
backing function yet to be filled in).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc
     hvm_set_nonreg_state(cd_vcpu, &nrs);
 }
 
+static int copy_guest_area(struct guest_area *cd_area,
+                           const struct guest_area *d_area,
+                           struct vcpu *cd_vcpu,
+                           const struct domain *d)
+{
+    mfn_t d_mfn, cd_mfn;
+
+    if ( !d_area->pg )
+        return 0;
+
+    d_mfn = page_to_mfn(d_area->pg);
+
+    /* Allocate & map a page for the area if it hasn't been already. */
+    if ( !cd_area->pg )
+    {
+        gfn_t gfn = mfn_to_gfn(d, d_mfn);
+        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
+        p2m_type_t p2mt;
+        p2m_access_t p2ma;
+        unsigned int offset;
+        int ret;
+
+        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
+        if ( mfn_eq(cd_mfn, INVALID_MFN) )
+        {
+            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
+
+            if ( !pg )
+                return -ENOMEM;
+
+            cd_mfn = page_to_mfn(pg);
+            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
+
+            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
+                                 p2m->default_access, -1);
+            if ( ret )
+                return ret;
+        }
+        else if ( p2mt != p2m_ram_rw )
+            return -EBUSY;
+
+        /*
+         * Simply specify the entire range up to the end of the page. All the
+         * function uses it for is a check for not crossing page boundaries.
+         */
+        offset = PAGE_OFFSET(d_area->map);
+        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
+                             PAGE_SIZE - offset, cd_area, NULL);
+        if ( ret )
+            return ret;
+    }
+    else
+        cd_mfn = page_to_mfn(cd_area->pg);
+
+    copy_domain_page(cd_mfn, d_mfn);
+
+    return 0;
+}
+
 static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
 {
     struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
@@ -1745,6 +1804,16 @@ static int copy_vcpu_settings(struct dom
             copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
         }
 
+        /* Same for the (physically registered) runstate and time info areas. */
+        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
+                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
+        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
+                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
+
         ret = copy_vpmu(d_vcpu, cd_vcpu);
         if ( ret )
             return ret;
@@ -1987,7 +2056,10 @@ int mem_sharing_fork_reset(struct domain
 
  state:
     if ( reset_state )
+    {
         rc = copy_settings(d, pd);
+        /* TBD: What to do here with -ERESTART? */
+    }
 
     domain_unpause(d);
 
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1572,6 +1572,13 @@ void unmap_vcpu_info(struct vcpu *v)
     put_page_and_type(mfn_to_page(mfn));
 }
 
+int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
+                   struct guest_area *area,
+                   void (*populate)(void *dst, struct vcpu *v))
+{
+    return -EOPNOTSUPP;
+}
+
 /*
  * This is only intended to be used for domain cleanup (or more generally only
  * with at least the respective vCPU, if it's not the current one, reliably


