Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B417B1487
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 09:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609313.948334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllG6-0007XR-2u; Thu, 28 Sep 2023 07:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609313.948334; Thu, 28 Sep 2023 07:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllG6-0007Ux-0D; Thu, 28 Sep 2023 07:16:26 +0000
Received: by outflank-mailman (input) for mailman id 609313;
 Thu, 28 Sep 2023 07:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qllG4-0006Ef-U4
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 07:16:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee869f12-5dce-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 09:16:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7811.eurprd04.prod.outlook.com (2603:10a6:20b:236::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 28 Sep
 2023 07:16:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 07:16:22 +0000
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
X-Inumbo-ID: ee869f12-5dce-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik1Z6SGZniPoadUy6Y0iWT4IO0fJ1XKLeQiEnbqV3rjvfjheCFhjBC+k91SFFBBzIDV7hzsC4KN25flVa0X/augInjT77x6AW3eLxsCjrUQ3MMG2W6ZSIpZca7xfXkDXgVPxKW2mupA+YcWSb8/fVXPI1jUBED6GowTxsEV4CYZCersute0eQLp1eyvtVP82BFG+gaGVZ5z/k0OTzFcyztHD/LAIUk5ypVKJbcFiuZx6+JzK9r8ezVCjpnOKk3GKIFpOIhQMnwM6Rclv88QFCmSr7RHTa+mVJFJK/HW62v/5ZlwhAjHQDRhxm+5OaIifKBYMIVs2CtSBOFW1e3J2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFNzhnlZYLwd/kWq59whthOZS8He4sxkxz1sCnsgnuY=;
 b=FGPrfC9tV4zDrLJL6INjalDVWRRx2OQ+eG1Xqv+/4UZnd3UAwwhgt2/rfTo49x0mrsPAQUUJwZUpNUiufexaoTg+AtxBClEOMvzWGiijrXonFK1MYWOaaNAXHqz2HWxzVQzhlKvwlbSvs0VcRuE76zFk0MJdYbVh0O4crm2iHIHVx5PpiK37bu7utJx3YYpQxueIZ0ahFW9NYAeBOc3uqXqIsDAhthKSZ0rahfNhPUtcHjz+2PQcwhMB+buWCLI1D/SXPXhNepvwKHOBBtE6kWuQW0YX4DKIoWJobZk1dqIBv9yKTqTnYIsxmAlhOBYGJyf1vKQBt1SZF91kOG/uHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFNzhnlZYLwd/kWq59whthOZS8He4sxkxz1sCnsgnuY=;
 b=lbo+5WCqr4bx1tvr4RZC0s8w+6nKwwDCnlGX3duH8aAW9Z8/bQEvqsBwjLVj2k3XVJ1XN+2dfej9+12HjA1ZGHpMFwYfdkYxvZQnb555BmkLAAHPeo7SCikoMoiTwSP5Ko3/FQJXI5y7fPlnp1xIKXz3BqTnu7kNS/Y9F+s2M7Llz56zh6mTB+5aq88i0JW12eVFVL4pONqQA077QKEqYlTlAhWHk0kQTY0KRrV9eahdSKLj5R4a13r0xiX9kHiD7HW6IknBR8DwVXGHYZxOS/L4UxHHlLRZwrYXHW3Z91z3oTrIs82SIMVgdeXPWxBbt5oi5Iyjo8x/SWgR1xasUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6047c192-0f37-e4ff-5980-fd137b3f1869@suse.com>
Date: Thu, 28 Sep 2023 09:16:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: [PATCH v4 5/9] x86/mem-sharing: copy GADDR based shared guest areas
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
In-Reply-To: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f8ad04-a696-43e7-6917-08dbbff2d1db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7p0C3hssJFP850737gbIlelIBFP0p0NUm31GL6kYHINl+i6jDv+25PwdehQAwyKYBMFzO3rX3wHg/bAIUU3bqvinbGuef6PDYb5UUVSdoH/hi+OYYKmAdHDKwEo6mV/FrSw461L/MBYtvVyWyOqowWyQML4tHCgarBocTKEBE7oZhovYb6vRgmRkKSuWD4pamq/iArh1J5NUx2/hEfNhuiFoyMjpWVCcFjh34m+19lRWrmPoppdNkM6sLpmLXjyPS8fOVuzrPhWlI9il+FsDJlVe6Ng8TjQqabhQAghkznYbd6wKlTsAcoB8PW6zgHQ2wB3NdCFVcWZ1p6SHa6+L2jC7HoEO2bCh/wui+1Sz7DQixcDXuLIyEMlr/N8AlZw9oxh1eURi2xXrF+YkfF0q34NWO86tsGQJZY8smRXb4HWJJmZj5qFfIBjKNuNjP1AvB6pjBW/G2b8QtIXbcAV8Y1mUi8jyBqcbFhwCetezFgYElbVJzkeI+8C+CLV6BqC+//IE99C5O3d+QUJLM4IKrm0z80sfD/20wvq/4SeAyucFwyLZ8CEZ6yyuFMDOyhPLSkpl/Eb4wije0/77StQ4WtRCJMkxujw+P5NB35cqBzOT7d3MVKD7xWYSOWcj+5E4JmFYlHpZYy3jy1byg3Hqnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(6512007)(6486002)(6506007)(478600001)(83380400001)(2616005)(2906002)(316002)(6916009)(66556008)(54906003)(66476007)(66946007)(8936002)(41300700001)(8676002)(5660300002)(4326008)(36756003)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEROS2pFRUEwZlV1MzFXZkh0NnNoQjNnd3dHckUrWmtKN0JPMTRVOG9iZUZ0?=
 =?utf-8?B?MDBGWW9vS3IzeHZoNWVCYWt3NCswenliQWxzVmRiQmZHbDRIU2JPMTJaMjc3?=
 =?utf-8?B?bHZwc1Zib3RPWnFCaDZGMm5ISGs5a1NXQW9aL0diSnhLUFAxQmtMdTB1TEVX?=
 =?utf-8?B?K205Z09mbTNSdlpsVFU1dHlNNFVNSXVRZmlPMG03N1gxOFBpN1Z4TGd6TGc1?=
 =?utf-8?B?QW9HM3RIUFRLTkkxTlp3M0E2WE1zT1MzMVBGeDRQQ1dTbWdOZkVXdU4zVFh3?=
 =?utf-8?B?aE9xRStSVFhIYzhJbUlDWTVZVm4rYmJFWVU3NkRoMzJpN2w0d2NGVDYyYStj?=
 =?utf-8?B?Q3p5aGpJVGNOaWI5cG1kQjg0dVhmQ1N0V3QyREtRR09LajNqamtlYk9zQ3Er?=
 =?utf-8?B?eVloa3VBY3N2MXc2aDNMMU5JVVNNQzFodGZhbVRNdzNqWjhiL2w5SUlseE1O?=
 =?utf-8?B?c2F5MzlxbC8wSjVnSGZWaWx2L2NpV2tTWnRHWXpIVm0vYzF0ajVqQnJLbDF5?=
 =?utf-8?B?M2V3N0daYUZBT0VCM0RuQ21vU29VOCtzZURzVkZQOUUrQmZ3WCtEMm9hVHlX?=
 =?utf-8?B?SnB0clZWdENCcVJxcWI0UzFJdjFEUXE1MW1hYlFYRkFRRFF3VEdBdDBWZUk1?=
 =?utf-8?B?anE2V3BqdmlpNUVqT2RSd3UxZmtnbEVidENYV3lHOFlSak9hUDUrcXVtUjQy?=
 =?utf-8?B?dDRNUDZyaEh3b005MzhLUnl2Tms0Z2l2MVp4TmcwWjNFQy9FbkVlNlFDSjU0?=
 =?utf-8?B?N2lLVWdqMmNiVjVrTzZJQndqWHRIRUFjYXJ4eGVkbml2QzhjSzdZeTJsUndv?=
 =?utf-8?B?dzh4N3hMb3ZXbHR5MXJxTm9ySU0yUThJRlNUZ1NwVjN3elB1RDFUTnJRNUZH?=
 =?utf-8?B?MGxWYU8ycUxVNEtUcDRzaVNhRmRQU2dZNlg4emtVRE9BL0FvTHZMLzlIR2tP?=
 =?utf-8?B?R2YzVmZWT1NLRk5lOFBrQWI5TElXVGpuekhLK0tWOEhCWklIa3VzNUprSzRR?=
 =?utf-8?B?aUxQcWIrTEdPZVRqcnNSRExnTDllWmxrcmZGNEhpWE5oWEZGNXp3TGJkMGgw?=
 =?utf-8?B?NktXallCUU8yWDJMQlh1YnlFdDhvTXl6VU40K3RJZXE0dkpDNDVPL0JONnBN?=
 =?utf-8?B?TTRNMnd3QS9BanlxNHo5U3Fobmc1ZDY4UlgramE1SDBUYy9lWUxPcm50TFo3?=
 =?utf-8?B?Yy9Xd291WFJRaWtFKzhlRFkrV2RlYlMwa0xCbUN3Um1CM1R4enBQTjhNSTZ5?=
 =?utf-8?B?d2ZTTTA2eTJUSHVPbjJXSGlPYWRBQW9kRDBOZE9FTkh3ZEJvYlRyejJrMk5i?=
 =?utf-8?B?WEpiSmowcTNHRlYwNUdiQ2lMK0c2ODR0dVpsdEVPNGhrQ2Y1MEFuNkZ5Wi9i?=
 =?utf-8?B?N1daVWc2WlY3cGZPaHQ2RlJIRDNEOEVORFlETkZiKzR3MXpNWG1la05jRmdR?=
 =?utf-8?B?V2NQcmdEN05IRU0xTWF3VjRxRWlmK3g5TkxWQWlkdjZyd0M0QXIxcUExam9H?=
 =?utf-8?B?aHhkemNVSjFhblNBcXNYbU1oUldWRUZmM1Vydm11UUdGY25weWhlazlBQ1NP?=
 =?utf-8?B?WlM2VjFSRkZYeUp1T3pCbWpzV2VUMVo4SGx1YzlnbjJranB5VHdkcVEzNFc0?=
 =?utf-8?B?L2p2ZFZWRjFDQzdsZy9hTXhhZHZLSmFzSFhqdUpSVjBGMmdlazRWY3hIMHU0?=
 =?utf-8?B?NFpnWjRpekkwYjN5UmNGdkJCVU5YK0RRYnp2VVFFSGlJUnhzRldiMFptV2px?=
 =?utf-8?B?UEdHYVZ5WENFcTcwYU9FVDI4T0Exd29PL1FOVWxpUGk2elRqSkdzeGg3dEsr?=
 =?utf-8?B?aGEySW44T0VqaHFDNTRwS1RsRG9LcW1NRFRTTTdJTUlRNzJtK2NxM0MrS2Fy?=
 =?utf-8?B?NlVNM1kwanJVcDdHc1JrQUdVTTlCU0Z4cno4TmlZRUFCZ3hNQ3RNVTFUN21X?=
 =?utf-8?B?N3NSdS9waVRxK1huZ3g4SWtLVXFiR09aZWN5aHZYVXhEdEE2VmNrWm00VHBW?=
 =?utf-8?B?cEtQSEl6OE9MTGNJT0lCL2JRZkRIeVJzblZnRVFCSDEzK3R6MC9MM0wvbmt5?=
 =?utf-8?B?Q1FmOVE4dHhuc1htTkttTlU5WW8rKzJESlpxVUFNWUt2WnBjQWZPVk1uSllt?=
 =?utf-8?Q?VPQlD9R5SDaxwB+10zekcW+ok?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f8ad04-a696-43e7-6917-08dbbff2d1db
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 07:16:22.7935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjGjRS0/cBXs0oO7XXpCO/PCxNz5XcYsTOtkwV5FEpgoXJvIwwMarxJjSLNmsLs5zX3L8yhKgLxC1DdXPS5kdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7811

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, add the necessary fork handling (with the
backing function yet to be filled in).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Extend comment.

--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
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
+         * Map the area into the guest. For simplicity specify the entire range
+         * up to the end of the page: All the function uses it for is to check
+         * that the range doesn't cross page boundaries. Having the area mapped
+         * in the original domain implies that it fits there and therefore will
+         * also fit in the clone.
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
@@ -1733,6 +1795,16 @@ static int copy_vcpu_settings(struct dom
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
@@ -1974,7 +2046,10 @@ int mem_sharing_fork_reset(struct domain
 
  state:
     if ( reset_state )
+    {
         rc = copy_settings(d, pd);
+        /* TBD: What to do here with -ERESTART? */
+    }
 
     domain_unpause(d);
 
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1601,6 +1601,13 @@ void unmap_vcpu_info(struct vcpu *v)
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


