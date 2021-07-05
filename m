Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43893BC17A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150507.278272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RED-0001vv-0G; Mon, 05 Jul 2021 16:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150507.278272; Mon, 05 Jul 2021 16:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0REC-0001t1-Sb; Mon, 05 Jul 2021 16:13:48 +0000
Received: by outflank-mailman (input) for mailman id 150507;
 Mon, 05 Jul 2021 16:13:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0REB-0001sl-7D
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:13:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8ab7dee-ddab-11eb-844d-12813bfff9fa;
 Mon, 05 Jul 2021 16:13:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-xUorxK5lMtOQQp4frzxBXQ-1; Mon, 05 Jul 2021 18:13:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Mon, 5 Jul
 2021 16:13:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:13:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0051.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 16:13:41 +0000
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
X-Inumbo-ID: f8ab7dee-ddab-11eb-844d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=biaX5SsQmY+gPFRyLqxO2anEddaixa5bVWAuEYf8xbE=;
	b=PCfPT0d1pJrfbBm+EDnfoN+cFUDQcO6BUUgvzub3+ct0Ae/EzXSaLxvnXifnJXepci1dmd
	mvJFXKV4OSf1wmhlEXlJQ/ZEBTwJDaNwKsDI9X9dXRn5XTbwfu30xqtcdhaAi9W8XHqsxf
	qGzYtIBU0RJJpD1YfE/Y4xppfuG8/Ks=
X-MC-Unique: xUorxK5lMtOQQp4frzxBXQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHjrJMkWOlKW0atV6/tIGhbejcpcYsg6WcL/qLaoY6R0p04IFDvWittu43xBdPy7BKoTKFa54uvbvYVse+OIwgen2s2HC8+DLKfX0+wPFu9S8TpecSd+8WTYrSivg9YiUW7FijxmfwfgdPo3US51s4eEPcKAzSaG4eYjRuGBKF87M67PSsH3MUkX5SXkEyOpeXajgyY+2lW/S/oH9p5sXExEqMnZgIchjv5eFOcuqldtx648IL5Mbo+aespZFi7a25n6hcvILsJLb7sIOe7X4fJi6EZy2A+qM86N9jkt75XMtOJVpBT44aeAd8t+vr7XT6oU+KzIwaL+GlF/8StKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biaX5SsQmY+gPFRyLqxO2anEddaixa5bVWAuEYf8xbE=;
 b=BhmIRUkmTymks4xRaWgAgc4HRlbV+ve6Yb0scmxyuxHYvg0+5SXLupVe5Cd7oUful46m4P79PLOFyDdmwgYwUPGDsm2zG5MUK509COTwudGs7XNiPuA1nb9mDZk1qTQv/LmKyDQxHY+le54P39rFphJz4VeVulD5LtYxCFvMQXDxnT8DGjyptT5VuJUT0S13qXFIqGTXGvkBP4uM+JAmgT2ypJiR6d2k8dN6wi6Sh7H+ZzA675vtlyZyB3pKVcPF0SBuES8zU5bYe2tVdnfxr9Mzmzo9XsGAmnVKeXrLAJ9elIHxrK5c4jlLXiy1Mk0MjRXn8JuBl4M+mDUS1/KCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 13/16] shr_pages field is MEM_SHARING-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <ec21ca25-73bc-ddb7-8674-b7a59adb441c@suse.com>
Date: Mon, 5 Jul 2021 18:13:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0051.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d9a75ad-11ed-4b60-6e92-08d93fcfdb6e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2829D9BDCDB5EB6EC2915DFAB31C9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3SoEema9qzsveH6aBAU6SPiY2JSKP0rgPrfvuG/4TlS0KK0+swEjihV7bFz4IUXtVw9tI3xcMx4M8tajD3hAgUDQTQ88Bv2kHznkrwnbHgLQCgTgyBT9Lljiq36U1a8wGKxcnr9g4s8MeizW9Unobic6PlOi37vWQ1iGocaQpDaDTm1LR8DONS/mJ0eiOqsmCjFRCeIspPb8EvzP3423ZMBQt7VUxl3/nG347EqabrGHJSFORLJVbQFMA5A6ugM9PHTPEiY59r9Myiot/DGlIkkkDCTNbO86j7BLt3kA7niUQQpuVFNvXAYy8IEvrE6Nw+ueMyPRD16Nwk15N3bn7ow77QErQDvPmf3rTr5OTOYSqs1+UVY+/F0xCkWS3Op6d13W+xTXCR2X5POuSBMsIUgDZ8JkktIXwVerE0EyqISu9w6uGs4cEEyUyYsydECoXO7wAC/ORZGKqM5yDmL+2l7r7yYlmCvKF8BopuTMFPCxtzMept92BtQNlMp/WCH+UO6ROT0ckP526mP1Gw/VwWlnrBmgbrB65yG9hCAAux0M/i1KyctA+2WmSxw27LhmHTxh54k9nJo5Xwv1bcrA5r0mOFZwJmlzs6edJnGg/7Mf2siYRTKpIzSb0acZEBxkBkWhT/pPcxn1xG9I20Um+EbUsgRYq8pha1e5m8uGEKCEFwWOU23lsCogfR3xI5zM32pFBjnfhOPqknqB8kWQXiB1mD+ykj0eKOzIhUPz/yw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(136003)(376002)(346002)(396003)(6486002)(26005)(16576012)(478600001)(2616005)(956004)(86362001)(2906002)(6916009)(316002)(83380400001)(8676002)(16526019)(66556008)(36756003)(8936002)(38100700002)(54906003)(31696002)(4326008)(66476007)(186003)(66946007)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVdUR0RHWDk1K082RlVNSklLczg0YVRzS2lOVXJSbVFMVlZwY0lzdWhzSXNZ?=
 =?utf-8?B?TkFCVDJPRS96SXFzcVorS01BRTZ0Wks2bUFHZDJOZnRySEU1bEpuckJTcTJX?=
 =?utf-8?B?TDdGZHpKM2poNU13d0xBNk41V1RybmtkVXdISWViaTloekd4YlJBWUJvdVJk?=
 =?utf-8?B?c3VIN1drVDNMSVNXZVJGQ0ZXOVMwcmVsMUVvUFBOVkJMY1Z5YzBHNlNJVHFj?=
 =?utf-8?B?VHhEa09KT04vQUVEU0hqMkdYWnVQOWM5Nm83UkdGTGQ5OFNrS0RkK3BOcFc0?=
 =?utf-8?B?MFpYUXlyc015YWpvcmUyRmFsOXY2eVZyMDBBa2xaUEpxdW5QQlFIMHJCSWt5?=
 =?utf-8?B?VzhKdFZvYVcxemhMTkRXSkJtZysxR20zQWRCTnVZaXVvMGQwaW5CRjBEcnJR?=
 =?utf-8?B?dXZUenN0cGVWaitKZ1B4bFREVGRlM0dzYXV6ZnNVZWNNeDJ3bitRWlVLREtJ?=
 =?utf-8?B?dXZISTQ2Qm5zV3FaZ3JZS3JDRHdiM0w4eml2YlRXc2duL0d5L1pTWHNkUWVa?=
 =?utf-8?B?Wk92cEQvTENxUEpNdFFkL3FCN3dDY3l4VVRjS2liOFVwWjVFbENnMDgzYVR3?=
 =?utf-8?B?NE9wNldubitwRmJoa2k0QWYvSmJZaU1Kb0xzc2VRWUxBVVRjRXBrdmd4cmFV?=
 =?utf-8?B?Qm85NFRtWWJpZmI0dWx5WjRHTWwrNjVDazZLSTFocGcxT2NlRGluSGY2SXIy?=
 =?utf-8?B?L2d5VUtDYzQzeUEyV0Y2R0dxU3NkWVRWUFFlMkRqSDFyaVF2cXI1K3hxQjlW?=
 =?utf-8?B?Nm5reFFXN01odHJwSkpQVy9BMk1YWExIdTB5UU1jUXorVzB2OVpmTWIzbnA5?=
 =?utf-8?B?Nzk0elJ0Q0FsQkZ6S0RBcjcvSDlxSFhGY25VWmIyb2FDUmlnYjJncEU2dnR6?=
 =?utf-8?B?aTFzdS84QVdnWWtWT0dQZkRISjM5bTc0QlBsdkpJTTlsMm1BdHAzNVRsaFVk?=
 =?utf-8?B?NDZzM3YwZjUwTWVRQnJ1b2hoZ0dvTFNPeTRSRm5CZnIrRFMwZEZmY1ZuMTZX?=
 =?utf-8?B?WldlaVhTV3N5eDI4Uk5UMFB1Umh3Z29uNERaalhWVmRpeE5sRVhUUVE3UkNq?=
 =?utf-8?B?eU5DbHBkZ0tmY2EzSHNTNURFM2JVZnRha1lKQzRYdGMrZHErb1lIZGVaVHN1?=
 =?utf-8?B?UmlweXZrTTh1YUFCa01yZVozcEVsZmRlV0JQUlpmRjQrTk1DM21YbldoUG9U?=
 =?utf-8?B?TUpOUGJFbUVTTFVFZDNzc0pyQmhIWkJjcHh3T0JINXBYL3l4UkNjTzB4aGtS?=
 =?utf-8?B?bzhWY2plOUpybmttTVhCY0l6RCtmNnZiNk9TRStsRmtHZkIreDdoVWg2VW5r?=
 =?utf-8?B?MlRCc1ZPUGdpb1pQaXd1MTJlS2V5NnFiWDFJUkFuVkhxbFIwak5rNDVTTi83?=
 =?utf-8?B?TTdrV1lZZUhUb2NISmRnWE1TVGlhTzVqLzliOTBvNEJscEtOL0c3NXpDRmJ6?=
 =?utf-8?B?azVrZjRadDNpb1VIYXAxMmxySlplMW9nbXhQRUY1N1FCek5QWDVMRHBVZnR6?=
 =?utf-8?B?cFo5c1NWTDYvVlQ4R0lTbzE2MUI4OHl4Zk1rWjJBRHRoWFJRVjRsbWxnRGVn?=
 =?utf-8?B?dHArOUpzRVduVTJtZy9tWERLQ2lML0pTK0ExU0UvY1MwWXlUR2pwQjEralJr?=
 =?utf-8?B?bGVFaFhHbDZ5V3VNVmtKZS9oWWZDcW1PV3ZnZ1ArWlJWRzR6bDBDZEZHMENV?=
 =?utf-8?B?bTh3bGovMkN5S2l2a0I5VzFaMThMU3UwTXluRFZWM1FXbnpEM2pOanluSC94?=
 =?utf-8?Q?niAgvylicZ/ygntfKPgX8ZpWPhjzd7w+fOF2Oyt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9a75ad-11ed-4b60-6e92-08d93fcfdb6e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:13:42.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VHQv4+gLQmlrhwxC2FJBLrxMNW7prRSD7DCFzKrNFGfbxqMLReTNxsisnUQYd0Lm95diYXgvrf3hdbr7U+T2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

Conditionalize it and its uses accordingly. The main goal though is to
demonstrate that x86's p2m_teardown() is now empty when !HVM, which in
particular means the last remaining use of p2m_lock() in this cases goes
away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was on the edge of introducing a helper for atomic_read(&d->shr_pages)
but decided against because of dump_domains() not being able to use it
sensibly (I really want to omit the output field altogether there when
!MEM_SHARING).

--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -159,7 +159,6 @@ void p2m_teardown(struct p2m_domain *p2m
 {
 #ifdef CONFIG_HVM
     struct page_info *pg;
-#endif
     struct domain *d;
 
     if ( !p2m )
@@ -169,16 +168,17 @@ void p2m_teardown(struct p2m_domain *p2m
 
     p2m_lock(p2m);
 
+#ifdef CONFIG_MEM_SHARING
     ASSERT(atomic_read(&d->shr_pages) == 0);
+#endif
 
-#ifdef CONFIG_HVM
     p2m->phys_table = pagetable_null();
 
     while ( (pg = page_list_remove_head(&p2m->pages)) )
         d->arch.paging.free_page(d, pg);
-#endif
 
     p2m_unlock(p2m);
+#endif
 }
 
 void p2m_final_teardown(struct domain *d)
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -109,7 +109,11 @@ void getdomaininfo(struct domain *d, str
     info->tot_pages         = domain_tot_pages(d);
     info->max_pages         = d->max_pages;
     info->outstanding_pages = d->outstanding_pages;
+#ifdef CONFIG_MEM_SHARING
     info->shr_pages         = atomic_read(&d->shr_pages);
+#else
+    info->shr_pages         = 0;
+#endif
     info->paged_pages       = atomic_read(&d->paged_pages);
     info->shared_info_frame =
         gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -274,9 +274,16 @@ static void dump_domains(unsigned char k
         printk("    refcnt=%d dying=%d pause_count=%d\n",
                atomic_read(&d->refcnt), d->is_dying,
                atomic_read(&d->pause_count));
-        printk("    nr_pages=%d xenheap_pages=%d shared_pages=%u paged_pages=%u "
-               "dirty_cpus={%*pbl} max_pages=%u\n",
-               domain_tot_pages(d), d->xenheap_pages, atomic_read(&d->shr_pages),
+        printk("    nr_pages=%u xenheap_pages=%u"
+#ifdef CONFIG_MEM_SHARING
+               " shared_pages=%u"
+#endif
+               " paged_pages=%u"
+               " dirty_cpus={%*pbl} max_pages=%u\n",
+               domain_tot_pages(d), d->xenheap_pages,
+#ifdef CONFIG_MEM_SHARING
+               atomic_read(&d->shr_pages),
+#endif
                atomic_read(&d->paged_pages), CPUMASK_PR(d->dirty_cpumask),
                d->max_pages);
         printk("    handle=%02x%02x%02x%02x-%02x%02x-%02x%02x-"
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -385,7 +385,11 @@ struct domain
     unsigned int     outstanding_pages; /* pages claimed but not possessed */
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
+
+#ifdef CONFIG_MEM_SHARING
     atomic_t         shr_pages;         /* shared pages */
+#endif
+
     atomic_t         paged_pages;       /* paged-out pages */
 
     /* Scheduling. */


