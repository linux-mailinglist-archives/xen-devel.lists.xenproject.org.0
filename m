Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326E435E6C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 11:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214277.372792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdUqT-0001tA-9t; Thu, 21 Oct 2021 09:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214277.372792; Thu, 21 Oct 2021 09:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdUqT-0001rJ-5O; Thu, 21 Oct 2021 09:58:45 +0000
Received: by outflank-mailman (input) for mailman id 214277;
 Thu, 21 Oct 2021 09:58:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FF+c=PJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdUqS-0001on-48
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 09:58:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7902b112-3255-11ec-8373-12813bfff9fa;
 Thu, 21 Oct 2021 09:58:43 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-3A4_rDsMN8u2Mt2puvoJBA-2; Thu, 21 Oct 2021 11:58:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 09:58:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 09:58:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0009.eurprd08.prod.outlook.com (2603:10a6:20b:b2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Thu, 21 Oct 2021 09:58:39 +0000
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
X-Inumbo-ID: 7902b112-3255-11ec-8373-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634810322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XttmN+xWknonju2h1s9l5A0Df7pJEnl/TZUURByJQLA=;
	b=ICeAUAOS4Xu+MNWRlypOGobmnnU2diSrg4UL99ckHmigZustM4noDF960x7cN5X9JSuSZu
	vryTyJrdOTvsH5G1PNLwBEfyFnYI0/aaktU/IFPLAUypnhHwC9L3gVDlJ0v7Pp5IO2gbm3
	TsFLv8teS8CIBZ4U0Rf8GBcjqzwxm6E=
X-MC-Unique: 3A4_rDsMN8u2Mt2puvoJBA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5sDVc/gRHT0W+VbZSgFYnJgnt3F90Jo8ksNFR+qzk8wb9TXAkNEHnhigyiX63Yb2d2pJUkkmk3Cu6U7UkCpppExY2UJy4aDkDDM7aK6ePkXTZyfiJSjbxxPBm4yM0s/aYegNANwa7PUNld30tafedR7Y7OywGhGmFgJgb7fODIAPsWcBm49/x5xnNZ/xVSkg0iFDZzyK+D82Gx2sSyHlMxxBQYJdzN6jVimS4tkIvRJzOLOCfpA+rS8BvPiFg2uJB1fIPFwzOrmPAztb2GxgMphds0VFxZc/l4SIfCgEK8/IONVKJQCnK5qL6AVtVfenJtZr0IKl2OiPukBRXi8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XttmN+xWknonju2h1s9l5A0Df7pJEnl/TZUURByJQLA=;
 b=MtlICZTW0X7RUmlsDDoPxdqYuDMHpIgvBeEaQiJQxN+3OgEd/8lz6k9wAJl3e5cQjQPFQ73S6bmD523t4yw4iFJB87W0vJiRBKaAOn8WykAijmdEBvTJHS9TnmFevOPzSICYfaYCc0ycHMkthWVVkc25nRaRLR+5TGPWYx/Jn4KyQPBf0h231IQDO92VAhGUqzYfsCClXUR3XL+kJGsXuJRMQGT2fIqejjpTQ0jZcE15/zqCBg67mATdUWcIhUMXv9COKve9+2nDFnjVnqOY3d9/Y/XidGqu8q420cQa5c3AsRbgYPeDOygv3jGs/m2i9GWc13SE66SfV7/cwU5xLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 2/3] x86/APIC: avoid iommu_supports_x2apic() on error path
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
Message-ID: <35f9099f-1111-1a66-83eb-bc5a3887f9aa@suse.com>
Date: Thu, 21 Oct 2021 11:58:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26e31da8-ea6d-4ee5-16d0-08d994795ba2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3774B884E9208F925C399677B3BF9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DreuMRLq0uKsKJbK3ZpSQk/O6eWn9Y/ockkK1m9BKoS2btJBR7XV6jrQITdQJ0NM1EoeVAzPwFlF7Jlrqvvld6aO6mWLm1ta0Cc8K0R/9/xsYzwSzwCt+TQR7+qOXZAx8YX3depEnhb+/C3bV5kGmXWbJOGztWYvLWUY0Zh+rWZl/DvyLWwxampyiNlhbNdqq2QdHvdrJjo6f8gQ4O3Xt5Qs4m2futV5+oOyQdTUS0Wy8pBwBvNuGMjweXj3QMsuk3TjOfYnjifSshruoz5iA7RoNpppSRhLIRoQb3ZhCGuZIMKxviRAVlxfiliuYK2+ZrCQN016Gx/zBkAdNkt4BDwWWu5lGGh/bbgBCeTJG5/jHHz00zfxX8hp5CHZYJyOPmdDyR6DcFTX6N27hqSYWSN93AHVfPc/9mCfXGHtP7D1fAzW5gCnce89wwcyf8LnuJccJ49BH4r5a/bfOrXjdnF3JGkW8v+H4Eeb58SLk9Ju0PVxEWnQbThE+9B+KJjdRBUNxdduErxD2Ov/EDNFD+mdzZC1CiN8C/8L9buyC+Z+cfODPG9VWKLMfGCTZUt0PYLjoRQpaiOdKuknATrEPoI6CaRaF5VIGuF5PFW9yupQDH7X4Ijs7BHir1/9d/2QoJFMlTzbe4HQWzl9YLdSVRFGLJdXIY2V0BSLPQxfKCP70AkkKCsXTnxUVgGNFJNp1XJkCmOzXIKmJfHj0eRHms5ZTWqG1vmBst6hgnWNEn7AlGp2dcw4tEUK2SZuK7eB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(316002)(36756003)(16576012)(83380400001)(86362001)(6916009)(8676002)(8936002)(31696002)(31686004)(186003)(66946007)(66476007)(66556008)(26005)(38100700002)(54906003)(4326008)(6486002)(956004)(2616005)(508600001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmtjYzAzcnRQZmRkc1RCdkRWOTVxbEhOQXZ3SWlXaWRKbkdvbEtKbThtSmFj?=
 =?utf-8?B?VXhtOXJaUzYwYUZXOHJHMGU5c1pBaUhMelkySGNuN3cyNk1wREIrU0JRN21R?=
 =?utf-8?B?dzh2enZ5ZDk1V05RYy9weUVmZmtZdkh4NjBwdjM1QmdLMzgxTzYwdTQvR2lu?=
 =?utf-8?B?UCtnMFBtQVJXOWhuODVOU1RQMFY0anpqQnZCSmNnZUpJeFdIT0xGb0dGMllB?=
 =?utf-8?B?dExpWHNsY21veTN0Rm9UcnJVS0prUFZidTgwZk15WWU2dlpxMDYycUJpTVJB?=
 =?utf-8?B?SXRQYWxoZEphU0xxZUVjRkhjcUFTV3ErcDk1eE16WmRkQmsrNXh1S0lvbXJX?=
 =?utf-8?B?MjE4bHJJalM5clB6TkY1MEJJWFI3b3RVb3VIeUZlajY4WVBBVmpOR05JbnVB?=
 =?utf-8?B?Z2VpcHVseTJtdEx1YzlSanVyRnVjeHJMSGplWVBkNXNIWnBNQjBNMXlKMkpM?=
 =?utf-8?B?UExZRDB4ak9zODkvVlMrTndrb3QzNXhDUlZVZlR4U21TelJEaXFRakIydVN1?=
 =?utf-8?B?T1pMQTRzaGFtYUs4clU4RVFnT3NiUlpyc0ltcGxtUHhiNThTbDNpZlRZMlpv?=
 =?utf-8?B?QStyeXZrRUNlclVpQXJEcFI0NFM5N0ZZcjlRRlZRd3g2R1FUQjNEZjNDYVRr?=
 =?utf-8?B?R3djWDdlRERNQXZ4S0phWk1Gc3FFVEFxVVUzQnRkTEF1MjMreFAxdTUrNytS?=
 =?utf-8?B?OG1BT2xUb0NIMmVYMGd0VzJsUGUzQ0prLy9yckljNittNEQwUC9hc1BNS0hh?=
 =?utf-8?B?aXV2ODJwUFNmbmpDNlFQakFSbGdNdWlqV09kcU1pb2pnN0VkVHBYTHowRW1p?=
 =?utf-8?B?WFpDRGhkWTFlV0FrdUluTFhSTTU3dzFWSzJVeEFjWG81NDJIbGFGdlB1N3hP?=
 =?utf-8?B?U1hKUzBIOUptaERoR0U3Qk1zbFZvZi9pR043eDZiMUhlSEpKbVp2UnJ4dGRm?=
 =?utf-8?B?dHdpcnl3RENPcWFuOGhDcHR4cGZWS2xPMFRiMG5aRGR3TEJIVzRGakIyWnV5?=
 =?utf-8?B?OFBVMmRYdFNiSEljMCtGc3BpVEtWbElSaHZ2Uk9PRjFwRVNqb3BNaTBlRTFB?=
 =?utf-8?B?cW5yaHY4b1lTMEhYVElxeVRVMzZETTQ2KzZLUFBVK25Sa0pMdVdnc2JhdEdv?=
 =?utf-8?B?UkpvVWhIRGlsNWt2Ry8rQVhJcGpKdkZKbFZiY3E3eWJFSUl5MERzVDQwNXVR?=
 =?utf-8?B?QXo2NXFaa3dWZis5TG56bEszTEhWYitRUExyQlZmY1UvUHJ5VVFYQnVxbndU?=
 =?utf-8?B?cllkckFpUTFjcWZteFdUM0Q1NWo2UzNvdXo3djA5MFIrSmRqb1lFQW9pOHZI?=
 =?utf-8?B?ZEhackx1VmFZdXZqN2laMlduVDZySE9vZTRLZDlBZkpuYXVIeXFwRGd4WHlm?=
 =?utf-8?B?Qk9iVXljNk1uazVxMTlzbUpqQk13OGRNS2RkZFFPTW1kU0h4TzhIOW5pTkJJ?=
 =?utf-8?B?SG1ESkwrUmRqM2VrRXlsL0FtMzErWFBvUE1JcmlQYld2Zi80SzNoMk5oTjZy?=
 =?utf-8?B?T0J4c09ZaFBmdWFOek9LWHFoNkp1OVdGUWs5ZFpXL1BDMGtXbWNNWjQxQnlZ?=
 =?utf-8?B?WWlMWThxcFhkbk92T0toWFdhRVlsTng0SEwxVXFIamk5bUl5Y3hOT1Z2bkNO?=
 =?utf-8?B?NmM1UVVvc1RvRlhJNDRGU0V5anZkTzBERXhmV1R4OHk2VUpuSUs5aHVtNDVK?=
 =?utf-8?B?cy9kM3lYaXk3dU5Ca0hHTWN6NEhiRzdRMUc4VTAwa1dLSnkySm1ibVpiQWVV?=
 =?utf-8?B?d1UrNFhHYnEzYmRNSVRoaWFBazNJUHF1MTh4SklDOWwyWS9NbVQxTHUxVkRM?=
 =?utf-8?B?aVdtekRHbHg0dENUOUVNbFNxeldxakxOSnNiVzZnNUtleG1tSzFlRVEyaEJE?=
 =?utf-8?B?UEM4djcvcThGdEVVczEydnR1NkFwWFl6UkUzcXVFTzhwZDl0dVJoRkUzeWNl?=
 =?utf-8?Q?o4njLMN6qgA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e31da8-ea6d-4ee5-16d0-08d994795ba2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 09:58:40.0148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

The value it returns may change from true to false in case
iommu_enable_x2apic() fails and, as a side effect, clears iommu_intremap
(as can happen at least on AMD). Latch the return value from the first
invocation to replace the second one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -865,6 +865,7 @@ void x2apic_ap_setup(void)
 void __init x2apic_bsp_setup(void)
 {
     struct IO_APIC_route_entry **ioapic_entries = NULL;
+    bool iommu_x2apic;
     const char *orig_name;
 
     if ( !cpu_has_x2apic )
@@ -880,7 +881,8 @@ void __init x2apic_bsp_setup(void)
         printk("x2APIC: Already enabled by BIOS: Ignoring cmdline disable.\n");
     }
 
-    if ( iommu_supports_x2apic() )
+    iommu_x2apic = iommu_supports_x2apic();
+    if ( iommu_x2apic )
     {
         if ( (ioapic_entries = alloc_ioapic_entries()) == NULL )
         {
@@ -933,8 +935,11 @@ void __init x2apic_bsp_setup(void)
         printk("Switched to APIC driver %s\n", genapic.name);
 
 restore_out:
-    /* iommu_x2apic_enabled cannot be used here in the error case. */
-    if ( iommu_supports_x2apic() )
+    /*
+     * iommu_x2apic_enabled and iommu_supports_x2apic() cannot be used here
+     * in the error case.
+     */
+    if ( iommu_x2apic )
     {
         /*
          * NB: do not use raw mode when restoring entries if the iommu has


