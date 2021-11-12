Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB4044E447
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 10:57:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225077.388720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTIm-0000pX-FL; Fri, 12 Nov 2021 09:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225077.388720; Fri, 12 Nov 2021 09:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTIm-0000nl-B8; Fri, 12 Nov 2021 09:56:56 +0000
Received: by outflank-mailman (input) for mailman id 225077;
 Fri, 12 Nov 2021 09:56:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTCG-0004Mh-Ab
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 09:50:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed4f2b45-439d-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 10:50:11 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-uvrNgwe0Mlq3UgpRVMk_cg-1; Fri, 12 Nov 2021 10:50:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Fri, 12 Nov
 2021 09:50:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 09:50:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0077.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.25 via Frontend Transport; Fri, 12 Nov 2021 09:50:08 +0000
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
X-Inumbo-ID: ed4f2b45-439d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636710611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ip3q7fhcctGNdbp3S1fmpbIw8kP09wRnv4EP1tjyo5g=;
	b=YamV6Mk2Vl78F31BgELFSRyD7SwU/Yexup9JP6bkXUYe6j4Jppu5xhRfKCMCCn9mHUfnBC
	h9W5DQOH2frcrsmTo5Hxz2391xllNMEvnbe0Dp1t8B8IP9q2AawzQTeK0VUszyogeV8XWU
	DaODAbr2k5z+1sOsjDLTKMKe5djj5v4=
X-MC-Unique: uvrNgwe0Mlq3UgpRVMk_cg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fm8GT9JYcB/n4bFPHQVMAybl+Sra6hd5yVCbikMBFhp2LfOFIuEUZPszwBYVBa9QR33GWatrP906E8Nv01BTThRsvLiFKzSbZRufv1VSnH12nxX2kZ04bjUrFbB/+PdKeXL/Dl+MN85kG1ZY0fDyInrBnaEYliE9VsRpX9FX09wEV8FHzLtoEJvm6JneyR3ROb1X6Vg1dhJ+cH2ETctgiLiU7ZsqFyDt7qNOg6dVehv9mlLop+VQg72XySXteSsU2tGp/CEcq9h0vR+6DN2FC/qpsFP+4NgZY1paz69Koc1cvFP6rCx0loG3ERKbsSTgdJ9rdk/vAMNWAlXkHfAKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ip3q7fhcctGNdbp3S1fmpbIw8kP09wRnv4EP1tjyo5g=;
 b=YDXbze5WHzu1RM1Qlz+bCwk7/+WdOZcLSTrLSLzBjAy/xt2jQ05jXM9/QpDJc0VEcPk1jVIIs9KW42sJgNk1knTor2PaIupxjSuz/eSsNtO6iSeKUn98u/b6PoAmyWU2kGxnvlP7Q7tPkMpEIaqoUcNL/afIIepbpOyYy+ZKl009U3BOnTf4PvFggvol1Bnu+55DlCgTJWYiccrTTkg8AaTDzzo6rN5psjClcCpM4ZVBf1NywpwLziEmdRqaucEB8fy8ZYGOIGbe9ytO590bNZX9FbhNpI4A5B+iMMX2lqhOqjb/9tJRSMf9X3qvoleVoV4TKi9IX7jLowXCqXfLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74734976-b5a0-3372-7c7c-9f866945777c@suse.com>
Date: Fri, 12 Nov 2021 10:50:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 6/6] VT-d: avoid allocating domid_{bit,}map[] when possible
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
In-Reply-To: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0077.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5e3a4f8-7cdf-4411-9470-08d9a5c1d033
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4942813DB6C75077A230BDE6B3959@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KGGbkbZan2Hf1cU4xOn6LGtIxYM4TN4Q0ekjPABg8m2lm6hH2xAaUf2IqQbBdgkktu7xVTBLREdIow7tGsHU0okn4TapTTdmL5kcUnhfzFHCtBFNSMnRlX278i0OELPS6sI6/aoQf6EOx5XL/k+ztsuLJCa2tU1702FcWLLngKYeH9fDDvLiAj6JqQjk6fItiFtFszl/U9zn7h4AHnwilAaluCmoqcNa75a8tkHp3k6La51sr0O6Ab22sUhmHGfRusEqgf2+/MpMHB3EwV3YFZljeYaF1s8DlqQHntWBVVIldbkXEKgIR7IMhuSvKQXKu/YpZuhL3xVPW9bZR/W0ZHGor8OD0iFurtsGotZ3lSqaTfPfah9G13WetBJELGyfuP9qU5KTJXB0WkRae1f1EciBRYC5r4W39kd38j+QZ/s/mLL4QxuOebvzC25hP0HmJPswn5ayCqO7KEIFfZV9Kcg2nnYUf5/FJTOsIsLwOjl9R32RqY/cQe6ADYsXhjUzkt18O358T4oTJTZLM3uUaJySq7E4iMphwfHZIa6wUL0J7jIvfu+7vl/thN4AlqnVMKDVe1K7civGNM9g3OAetLEHpNcsZ6J6dPTSWbERqOouU6etZlaNLCJjRp5e3WN/2GG4q9RXcIIGvBoO50elO+gnKlRU8TRNSFhIVLjXkYq98qo9JsHnorludqYURzrZ3I52eu4rLUrc3sA1iQUgE5rtaBVjsHxKuG5paVFMKPc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(186003)(2906002)(5660300002)(6916009)(38100700002)(36756003)(66476007)(66946007)(16576012)(86362001)(31686004)(26005)(4326008)(66556008)(316002)(31696002)(6486002)(8676002)(2616005)(956004)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0xZK1ZUdHRpa0VnQ0Z4RGg3KzYra3QwdXFTOGRYd3dGWmUvUzFZNXJtVHlT?=
 =?utf-8?B?eFNHM1QwT0xEdERkcDZsbWhXWUd1eHFuVERsbThBQnQwT0E0RjgwOFVFU3JE?=
 =?utf-8?B?L1B1bXNraFY4LzlueUl5T2xsL1FjaVVGR2NadEZ3WWlCY2Y4WmhpUEl4SWkz?=
 =?utf-8?B?RmgyY202VVluWUp2azhMSUcwTGVWQ0IwT21kcFo4OUV6Rk5VcG1OOGF1K3dZ?=
 =?utf-8?B?aFBmQzkvUjAvSUhXa3F4aWtkeWFBbi8vWUhCL0MwbDJzSjZ3d1plb3pjT1FK?=
 =?utf-8?B?dFhjUXhZSzhERnlHcmhjbVNmNVdSaDRLOS82anBnRmZqVkdsZ2Z1VzVXOUJE?=
 =?utf-8?B?RUFMNzJoSkZLM09FUlRYY0J0TmhEeGhZb3NGRWJVc3A3MlR1ZnVwTUZpNHdO?=
 =?utf-8?B?cWt5ZXB5MjkrSjhkbGZqVlhkcEY5V0VLcFZnWU9pQ0tIbUhtcjcreXBYWFdP?=
 =?utf-8?B?NlRXSm55cVF1NVZpT3lFR1BXalBBbmk5cjZrTmF6Sllaa21IMWtQMER1Vkdw?=
 =?utf-8?B?dHFCMlIwZWliaGY4bkErS2txR0x1SU91Q010ejFhNDZZUVl2NENMU21LYkhq?=
 =?utf-8?B?RUpYUmtwV1JrckFDbjR2SGI4MzNWQURYaythVitGZjRQTWZTcHpPbWVseFRz?=
 =?utf-8?B?UmE4bENGWnVxUCtYa1Z1TlMxNDlydWJiNnUrR0lGYWE3ZnlXM1h3UWhmam04?=
 =?utf-8?B?ekY3RzZnNWpaRzVwOVRjZzYzTklCdlRaN3RzZFVLM3FNTHRySEJEclNUUm9y?=
 =?utf-8?B?VzErZjN0Z2dLYUdDVldjcnFNSDU4NWt6c2xXTFV5M3Rma2h2aHoxdXNyRlAx?=
 =?utf-8?B?MGRWSElxQWpLemZuTHExSHhwNnlHbys2VTRVVDRWT082OUFVVDZRQzJRWnpy?=
 =?utf-8?B?cVdwZWVCY1d0RmxmMHB0VXkwZHE5QUg1amlEOVh0djQvQ3diL3FRWVoyTFZ0?=
 =?utf-8?B?N2ZyN0VGZUhrNyswNmhnalF5MUVac2t3OUtpUUV0MktDRFNjQjNrNEJ5Qmd5?=
 =?utf-8?B?aHZKeE1Fb3FFSzFUcmFJUTRmVnNQVFJPSjhnQTd1UmplRTRlcHhvd21nVnRN?=
 =?utf-8?B?aE10SnNvdUdhS0R1ZHExSEJxeXNieUo3amFrczE5WkhtY1hzZU0wWGlWNWlL?=
 =?utf-8?B?SnJtMzZ4bUN5U3FrNHVldk13S08xVkdzSXdWbnN6YVA5MGpWbkxZWmlMcEtL?=
 =?utf-8?B?azBRSVFtK3A3dzAweDNoS3QrOUM1aUxtcWNmS3R2SGhmMDNXZk12emFpZWt4?=
 =?utf-8?B?V2pzZWVnYlZqL1N2cWVZSmp4OEc4TGJxT2ZKU09WVmE3RE9CMkcwVmJtbWxB?=
 =?utf-8?B?VG5PRmdnSFdRY2dIOVdHV2ZrSGs3OGhvSUROSFpxUURNWXRmNTJWUnBjS0JD?=
 =?utf-8?B?OWhUZHdqUjZtaXduZUoxTU9iQ0hhRjM0WEJqT1IyM0thWjhvWElvN1N2MW56?=
 =?utf-8?B?RUI2Z0dtY3oxVXM0L2JDKzBLV25aeE4vMHpFMjQ2dkRsUEtvcnRXeDJoS1Jo?=
 =?utf-8?B?UFRldHpBaElFaHRZOE9jeTRiREV0NkUyWXFBY3NQWmtYc08xdE5mU1RvTG5Y?=
 =?utf-8?B?UVVTMEo1eFhvcDlMd3ZNSWNVcVhSZkN2YVRPUWxOcXMyRU9UMlpsKzB0S1Bo?=
 =?utf-8?B?TjFBOFR1NVlVVExjcmFqWXh3TEVkMnh6RHFhYlFiM0RIYzFpYmFoRXVIY2p4?=
 =?utf-8?B?U3lpeW81cm9nWks3M3pjcnd1M0N4ZGhpR1pUbXk4aUF0ZWhoRW9RWnZaaUJi?=
 =?utf-8?B?Q0tkaSszSUplUVQwY3FUeDdvTkcxM0hlZzlpY0Q1U2lxZnN6WlgzbXV6ZDYx?=
 =?utf-8?B?TklmYVhpRmpOaDdKRE9FN1ZCaWRCNmFJRHNKME1LcW9ZbnVsR1BIVUFmcDZI?=
 =?utf-8?B?ZmN2Sndvb3VqV0tML1pHa3pXTzN5WWhidTh6MnlvRDR5MlNVdWFKblFBci8z?=
 =?utf-8?B?QWRkOU1tMTJSNFYwbDlTNFVuNjlMNkptNVNHcDFyYUdLWk1zT2RHcEVCVWo2?=
 =?utf-8?B?TGVRdDNTcmh3RDRpRGtZSDZxS2h6RzB4ZVRLNis1MGsrR1BKcW5wazVhUUhP?=
 =?utf-8?B?SUxQZFF2VnJvSWdZckJ0SG5yNjdyKytNZmgwWkc5R3hUVEFxbFN0ZzY3aHRm?=
 =?utf-8?B?MVBFL1oyT0pBQk5uVENRVVlBbXI4QWFHSzVTOW5pdHNkMUMreWVsc3NIT3lU?=
 =?utf-8?Q?xmWkXcAhh5Mr+MccynxS1bg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e3a4f8-7cdf-4411-9470-08d9a5c1d033
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 09:50:09.0937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7e3dUCmhFDVS2q+W0+eHEvFACdrdV8Kov0p4FMwjvzMsmNU0g9UDH1mseuowsz9b7uI2/FXAcpksbzf/5Vqmvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

When an IOMMU implements the full 16 bits worth of DID in context
entries, there's no point going through a memory base translation table.
For IOMMUs not using Caching Mode we can simply use the domain IDs
verbatim, while for Caching Mode we need to avoid DID 0.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For the case where the memory tables are needed, xvzalloc_array() would
of course be an option to use here as well, despite this being boot time
allocations. Yet the introduction of xvmalloc() et al continues to be
stuck ...

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -62,11 +62,32 @@ static struct tasklet vtd_fault_tasklet;
 static int setup_hwdom_device(u8 devfn, struct pci_dev *);
 static void setup_hwdom_rmrr(struct domain *d);
 
+static bool domid_mapping(const struct vtd_iommu *iommu)
+{
+    return (const void *)iommu->domid_bitmap != (const void *)iommu->domid_map;
+}
+
+static domid_t convert_domid(const struct vtd_iommu *iommu, domid_t domid)
+{
+    /*
+     * While we need to avoid DID 0 for caching-mode IOMMUs, maintain
+     * the property of the transformation being the same in either
+     * direction. By clipping to 16 bits we ensure that the resulting
+     * DID will fit in the respective context entry field.
+     */
+    BUILD_BUG_ON(sizeof(domid_t) > sizeof(uint16_t));
+
+    return !cap_caching_mode(iommu->cap) ? domid : ~domid;
+}
+
 static int domain_iommu_domid(const struct domain *d,
                               const struct vtd_iommu *iommu)
 {
     unsigned int nr_dom, i;
 
+    if ( !domid_mapping(iommu) )
+        return convert_domid(iommu, d->domain_id);
+
     nr_dom = cap_ndoms(iommu->cap);
     i = find_first_bit(iommu->domid_bitmap, nr_dom);
     while ( i < nr_dom )
@@ -91,26 +112,32 @@ static int context_set_domain_id(struct
                                  const struct domain *d,
                                  struct vtd_iommu *iommu)
 {
-    unsigned int nr_dom, i;
+    unsigned int i;
 
     ASSERT(spin_is_locked(&iommu->lock));
 
-    nr_dom = cap_ndoms(iommu->cap);
-    i = find_first_bit(iommu->domid_bitmap, nr_dom);
-    while ( i < nr_dom && iommu->domid_map[i] != d->domain_id )
-        i = find_next_bit(iommu->domid_bitmap, nr_dom, i + 1);
-
-    if ( i >= nr_dom )
+    if ( domid_mapping(iommu) )
     {
-        i = find_first_zero_bit(iommu->domid_bitmap, nr_dom);
+        unsigned int nr_dom = cap_ndoms(iommu->cap);
+
+        i = find_first_bit(iommu->domid_bitmap, nr_dom);
+        while ( i < nr_dom && iommu->domid_map[i] != d->domain_id )
+            i = find_next_bit(iommu->domid_bitmap, nr_dom, i + 1);
+
         if ( i >= nr_dom )
         {
-            dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: no free domain ids\n");
-            return -EBUSY;
+            i = find_first_zero_bit(iommu->domid_bitmap, nr_dom);
+            if ( i >= nr_dom )
+            {
+                dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: no free domain id\n");
+                return -EBUSY;
+            }
+            iommu->domid_map[i] = d->domain_id;
+            set_bit(i, iommu->domid_bitmap);
         }
-        iommu->domid_map[i] = d->domain_id;
-        set_bit(i, iommu->domid_bitmap);
     }
+    else
+        i = convert_domid(iommu, d->domain_id);
 
     context->hi |= (i & ((1 << DID_FIELD_WIDTH) - 1)) << DID_HIGH_OFFSET;
     return 0;
@@ -140,7 +167,12 @@ static int context_get_domain_id(const s
 
 static void cleanup_domid_map(struct domain *domain, struct vtd_iommu *iommu)
 {
-    int iommu_domid = domain_iommu_domid(domain, iommu);
+    int iommu_domid;
+
+    if ( !domid_mapping(iommu) )
+        return;
+
+    iommu_domid = domain_iommu_domid(domain, iommu);
 
     if ( iommu_domid >= 0 )
     {
@@ -196,7 +228,13 @@ static void check_cleanup_domid_map(stru
 
 domid_t did_to_domain_id(const struct vtd_iommu *iommu, unsigned int did)
 {
-    if ( did >= cap_ndoms(iommu->cap) || !test_bit(did, iommu->domid_bitmap) )
+    if ( did >= min(cap_ndoms(iommu->cap), DOMID_MASK + 1) )
+        return DOMID_INVALID;
+
+    if ( !domid_mapping(iommu) )
+        return convert_domid(iommu, did);
+
+    if ( !test_bit(did, iommu->domid_bitmap) )
         return DOMID_INVALID;
 
     return iommu->domid_map[did];
@@ -1296,24 +1334,32 @@ int __init iommu_alloc(struct acpi_drhd_
     if ( !ecap_coherent(iommu->ecap) )
         vtd_ops.sync_cache = sync_cache;
 
-    /* allocate domain id bitmap */
     nr_dom = cap_ndoms(iommu->cap);
-    iommu->domid_bitmap = xzalloc_array(unsigned long, BITS_TO_LONGS(nr_dom));
-    if ( !iommu->domid_bitmap )
-        return -ENOMEM;
 
-    iommu->domid_map = xzalloc_array(domid_t, nr_dom);
-    if ( !iommu->domid_map )
-        return -ENOMEM;
+    if ( nr_dom <= DOMID_MASK + cap_caching_mode(iommu->cap) )
+    {
+        /* Allocate domain id (bit) maps. */
+        iommu->domid_bitmap = xzalloc_array(unsigned long,
+                                            BITS_TO_LONGS(nr_dom));
+        iommu->domid_map = xzalloc_array(domid_t, nr_dom);
+        if ( !iommu->domid_bitmap || !iommu->domid_map )
+            return -ENOMEM;
 
-    /*
-     * If Caching mode is set, then invalid translations are tagged with
-     * domain id 0. Hence reserve bit/slot 0.
-     */
-    if ( cap_caching_mode(iommu->cap) )
+        /*
+         * If Caching mode is set, then invalid translations are tagged
+         * with domain id 0. Hence reserve bit/slot 0.
+         */
+        if ( cap_caching_mode(iommu->cap) )
+        {
+            iommu->domid_map[0] = DOMID_INVALID;
+            __set_bit(0, iommu->domid_bitmap);
+        }
+    }
+    else
     {
-        iommu->domid_map[0] = DOMID_INVALID;
-        __set_bit(0, iommu->domid_bitmap);
+        /* Don't leave dangling NULL pointers. */
+        iommu->domid_bitmap = ZERO_BLOCK_PTR;
+        iommu->domid_map = ZERO_BLOCK_PTR;
     }
 
     return 0;
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -87,7 +87,7 @@
 #define cap_plmr(c)        (((c) >> 5) & 1)
 #define cap_rwbf(c)        (((c) >> 4) & 1)
 #define cap_afl(c)        (((c) >> 3) & 1)
-#define cap_ndoms(c)        (1 << (4 + 2 * ((c) & 0x7)))
+#define cap_ndoms(c)        (1U << (4 + 2 * ((c) & 0x7)))
 
 /*
  * Extended Capability Register


