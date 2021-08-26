Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AC83F8524
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172869.315444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCO5-0008VL-Kj; Thu, 26 Aug 2021 10:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172869.315444; Thu, 26 Aug 2021 10:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCO5-0008TU-Gv; Thu, 26 Aug 2021 10:13:33 +0000
Received: by outflank-mailman (input) for mailman id 172869;
 Thu, 26 Aug 2021 10:13:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCO4-0008TI-Gs
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:13:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4343d6a8-0656-11ec-a9e0-12813bfff9fa;
 Thu, 26 Aug 2021 10:13:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-uj9ucFxjMpWHCpbwXHvYGg-1; Thu, 26 Aug 2021 12:13:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 10:13:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:13:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.6 via Frontend Transport; Thu, 26 Aug 2021 10:13:27 +0000
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
X-Inumbo-ID: 4343d6a8-0656-11ec-a9e0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629972810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lAWSSrdLdlRQ4Gf4NxyfcmsCa3CpWqBd//Rt+kfFFEk=;
	b=XJV28C50ZYw1JEd/j6+SSCjbF9SUJihbfRPujIbCcb69x6edcuqypR7kLxkbUwaW/8AJCK
	ELdNmW6CeSLtwfqiYqJ0p/KRXfveGcuH2dwXwmn9/DhuisaHt34lJb+Tfh0xMfsRx44HDf
	n0mcQS/XbiE07VmAsBTK+8sfQPF5tAY=
X-MC-Unique: uj9ucFxjMpWHCpbwXHvYGg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXN4dToXO7XptyGe9JeaB7Py4zT4YNQagYEYoi6042KMuQL/ZguruKlurfbT5m/tZH/0AGA7hGZ4tLJ/qCBXL93Euqsh4y+T0qNQee04VA0YjGXiXxNSVB4gOE+8ykCGaWXQsAQTFY64AU788TieEuxF64hHchHeI4t7gr/IeqGgbuBP65GSfMWtF530BlScmZKMwv9qlQC54rvVvy5OqUi2RqLgBogvvkkEZC80KeNg8p0HJmaRJhzxgcJWZ7nxgasuWWZ2AVt061hJpbtH+lNlyjKQRPM8APPP3cUuhoNM5nvD7qQlUflvMnkWqa3axidhyvPuWMokSxAJxHJjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAWSSrdLdlRQ4Gf4NxyfcmsCa3CpWqBd//Rt+kfFFEk=;
 b=WPNxqlidKXal9M6UKvq3CdF7BqEet0QJIxYh5GeCd5E6eyOd/Rvndu5mnU1kzf89zb7rLKyIfqSmUVK48VTLiWIbr0AB0utN1/KN0N47rQXSGq+xY87SVG+iH9DCxnXZifzRNnqO2FBSnfLStsY4KO32N3HgoYaXXvt4Z3Vlz3d13zHfXFTVqaEhluQijMSOmhg6eYoCT5XjoxLlXLj+Z7WNkyXvmet36fsQfZQUtLPdSamQ0IFYHXNxvBbB5/a9ra0Jj09RkG53RJ7WCh71F+Gudvu1p4FwTvOHWVg1OBVcxi3O/S3Y99WNGPMgNJyC5VTApX3sDEyLwTXANg/30g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 5/9] gnttab: defer allocation of status frame tracking array
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Message-ID: <eb237b32-21c7-9b83-7fea-c64293154bbe@suse.com>
Date: Thu, 26 Aug 2021 12:13:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0b79e4a-ac9e-4710-8f4b-08d9687a25d5
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31205BE84B442E58CBA9D287B3C79@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w1yarKgWnhoCA7tjwh+RWSLZ086OdLSFR8gumyoYi88PUdzZfFMdtIUzEnuJ06sTCcpxYBTt6puDLg5K7onyHg4smlL+oAL8JMgUgg/6/llca6Ab7W0PYg+BmlvISKUb/OAEEEOXSPxqYfcoMBWL4xqBCELnIZ0W5vWM13Ln8xIvN5/gYftC58Xt5lAxBwhMXydmNvDQKLdVP0vI7rw+4rAg6Gha2DqW0ZaKvv/ribM6EDYvMzFc1GSYnQy01JE1Wr1GC/uIpeMey0/1eqdQmPYjiAyvbZm3w4NSTbZrzBJ4RvzfOOpJRgURfUJa+WKHmpWq1+sD+dUCLqgXazgvzm+QfDsgU09PIaN8eCnATyMgTSyaCMNg6ea5Ov5dxM1001Qu9/3w8BwIoakEpk4n2QYNG0UDnOUGU1dZPdbePXer2yx3iaAPZR6BJnRCdt6kL2Vywg05MzCoRljFuoWJYJliLMtIFsFJojSGceg8CrwZTF1NU2PfSSBmOesrj3vWXuBfSGkoaxzqZkAewc81x/mARWCgAEIiPbdgK48pWb5V2auGVnwhseeEOOiSSb+H2odAIfN/Ew//XDRlHvCHyjbhhdj4ro5s6H6TlsNgfBHd7h3KQktiZjh2I2bYSg7Os0FlK7HTBQu1yEDKoMBY5ZmzdIE1Ha6m9L2kTeemeTR247QiD4vBkrPT+jYP0V5PWaArG1WDd0i9kDZg6X+dl6zvcUBKZWwLD/lBT62M8WY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(136003)(366004)(396003)(346002)(956004)(66476007)(38100700002)(8936002)(8676002)(6916009)(6486002)(31686004)(5660300002)(66556008)(186003)(36756003)(66946007)(2616005)(16576012)(26005)(316002)(2906002)(54906003)(83380400001)(31696002)(4326008)(478600001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGlUR25GTzUrMHJwR1FIa25yVFZwb3lLdXdzUVZvVHQwNHFUTk9aSHQvajNk?=
 =?utf-8?B?KzBsVDFFYUNpMnN1R0IyZENoVTQybFdNTy8vMjNTVnowRDN3enY1enF4Sndn?=
 =?utf-8?B?R0R0cFhMODJXV0hscFVFRGJGYkNRdnFiekxObWF5TXh3dkg3enNFK1dSbXpn?=
 =?utf-8?B?clRyVFVKNUthaFJyblBubnJCbEhRY25URGlLQzJXbUV0QnNSVE04OHJ5QXlF?=
 =?utf-8?B?dDhKa0pvVXhPRFNUUnV3NjloTXA4TWNGc0JXdzdiSUVIeTdmYUFUeDFjWStQ?=
 =?utf-8?B?OW1kTzJZbUJBK05zTS95aGk0bC9zbjc1Q0dEOGFmanJ6VUhDYkE2bzFtSmwx?=
 =?utf-8?B?NUJ1cFJJM0k4dmJEVm1wbzdGcEJBTkZPZkFoNk1UemJObXFITVVpZnRPUzUw?=
 =?utf-8?B?MkI0cDNOY25JMk9jMENzS0NiYlVpVnRIdm5aMFlEQk9WRmd3RUxKOGhsdU5w?=
 =?utf-8?B?YkJEV2lna2EySHFMejE2ZHZ1R1ZWS09tcEtCUjRpdlB0cXhoWllpWGlTbkVZ?=
 =?utf-8?B?aGJLemU4Tkl5MGg3REJoMkVpMWYyb2NJMXp4T1F5cmdMVytSMFRhTDJXZUEv?=
 =?utf-8?B?dmVpT2dYWVgrWE56c1pCYURiWXg0RWUrMjFoZHUyQ1ZoUWpSV0Y2Vkx5cmZu?=
 =?utf-8?B?M2dUOFNsTHpFN2RLSFdzZFNjUDVBY2MvZnUvLzZ0cnBKYmlIcEppbkFUYVdr?=
 =?utf-8?B?M0VDQzJBY1BDbWtMaWx5S0Y0QnFDYlNPTGVqV1Y0MGpOQzNZZk5tUTA5ek1j?=
 =?utf-8?B?cXRCclUxWVZrcW00YWVSZlAyNVg4bmdHOWYrNngzVXg0RXAwbUloT3hRS0VI?=
 =?utf-8?B?elFpLzJBRjJveVY3dUpjcGltZnVLeW1XazJVdUlxWVM4SXl1a0xWSGNOL21T?=
 =?utf-8?B?bWJGTmdrbW1nL1dhSzZMTXYrRUN1VkJMZXpTK3RoSzVGa0lINkVCYk4wbFFO?=
 =?utf-8?B?bTFlNEZ5RFBJeDBDM2lDdDZud0h5VG1weHgreEZPM0FiTGZOZ1YrNC9MZXA4?=
 =?utf-8?B?Ukt4YjVCMHhoL3I2STE4alpOak01VzZKUzFzbW40bGpOenBzNWdxS1lqZjk5?=
 =?utf-8?B?SW5lZUw1K29sM0xnanl4UVJsM1dzbytHSXBOZHM1RlpUU1M0QkZvRUUvODUr?=
 =?utf-8?B?dVVoclNNejIxalB2OTJQVndmalQ2K2lvUjhoYTlDeVcvNnppa3g4UENSeEVV?=
 =?utf-8?B?OWZ4V25ydk4vUXFRTWkyeFVYNk03UWxNNGVnVEVqZFFmekZWSm4rZk16Wm1I?=
 =?utf-8?B?aklkZEdHNGJlVThjR2FjU2JqT241WUpPOEdPN1pSSUQ1ekUwTjViR3NuK3ZE?=
 =?utf-8?B?UTFQbjZUajJWYzU0blBONmpPOEhyN0xrM3JVWHNVM1J4SDlEOHlobE5xaWht?=
 =?utf-8?B?ZTlLS3JwdWhVblFjTU9QTklSRExhYlZOQUNWR0Y4OWNRU2kzUG9BUDlKWHpm?=
 =?utf-8?B?QU9mTHJtZFhMcExzS2w3TkJBOEtlYUtBYytPZlV3N0I4SEJKOEpqQVdHcGZ4?=
 =?utf-8?B?L3hXQWYvS3VZZEw0YUx4WXhvWFQ1NDVJaGZ1eDNuRmxueThhOEJYY2xvQ2pi?=
 =?utf-8?B?L2lQRTZhVlppckdRd2U0MVFZVC9rU2xXL3ZkSENOc0paZmpVKzFZMUhCZ3dI?=
 =?utf-8?B?Mm9zTlBiSkk1cFhmODNTR3E5ZjNqNm51S0Z2NjlpazhMUStOMmZrTUV5SGtl?=
 =?utf-8?B?Qm1Fa216WllvUW9zQzZBcGgwc2o5YU83QWovZjRLMWk5eVhRZ2dGQ0dTZ2ZU?=
 =?utf-8?Q?W2tIDGhTt3VvNXn1wvdGo0xuMYZZ6iTcVj7eiYR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b79e4a-ac9e-4710-8f4b-08d9687a25d5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:13:28.0866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtj6UnYHIpDqrnLKX+OWxcAzHP5UEXyh6Xq40KzU63UwwGDgTbUbw6IDRgD8BVi++NpNbbqH5AvdnrRPW/Spnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

This array can be large when many grant frames are permitted; avoid
allocating it when it's not going to be used anyway, by doing this only
in gnttab_populate_status_frames(). While the delaying of the respective
memory allocation adds possible reasons for failure of the respective
enclosing operations, there are other memory allocations there already,
so callers can't expect these operations to always succeed anyway.

As to the re-ordering at the end of gnttab_unpopulate_status_frames(),
this is merely to represent intended order of actions (shrink array
bound, then free higher array entries).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v1: Fold into series.
[standalone history]
v4: Add a comment. Add a few blank lines. Extend description.
v3: Drop smp_wmb(). Re-base.
v2: Defer allocation to when a domain actually switches to the v2 grant
    API.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1774,6 +1774,17 @@ gnttab_populate_status_frames(struct dom
     /* Make sure, prior version checks are architectural visible */
     block_speculation();
 
+    if ( gt->status == ZERO_BLOCK_PTR )
+    {
+        gt->status = xzalloc_array(grant_status_t *,
+                                   grant_to_status_frames(gt->max_grant_frames));
+        if ( !gt->status )
+        {
+            gt->status = ZERO_BLOCK_PTR;
+            return -ENOMEM;
+        }
+    }
+
     for ( i = nr_status_frames(gt); i < req_status_frames; i++ )
     {
         if ( (gt->status[i] = alloc_xenheap_page()) == NULL )
@@ -1794,18 +1805,25 @@ status_alloc_failed:
         free_xenheap_page(gt->status[i]);
         gt->status[i] = NULL;
     }
+
+    if ( !nr_status_frames(gt) )
+    {
+        xfree(gt->status);
+        gt->status = ZERO_BLOCK_PTR;
+    }
+
     return -ENOMEM;
 }
 
 static int
 gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
 {
-    unsigned int i;
+    unsigned int i, n = nr_status_frames(gt);
 
     /* Make sure, prior version checks are architectural visible */
     block_speculation();
 
-    for ( i = 0; i < nr_status_frames(gt); i++ )
+    for ( i = 0; i < n; i++ )
     {
         struct page_info *pg = virt_to_page(gt->status[i]);
         gfn_t gfn = gnttab_get_frame_gfn(gt, true, i);
@@ -1860,12 +1878,11 @@ gnttab_unpopulate_status_frames(struct d
         page_set_owner(pg, NULL);
     }
 
-    for ( i = 0; i < nr_status_frames(gt); i++ )
-    {
-        free_xenheap_page(gt->status[i]);
-        gt->status[i] = NULL;
-    }
     gt->nr_status_frames = 0;
+    for ( i = 0; i < n; i++ )
+        free_xenheap_page(gt->status[i]);
+    xfree(gt->status);
+    gt->status = ZERO_BLOCK_PTR;
 
     return 0;
 }
@@ -1988,11 +2005,11 @@ int grant_table_init(struct domain *d, i
     if ( gt->shared_raw == NULL )
         goto out;
 
-    /* Status pages for grant table - for version 2 */
-    gt->status = xzalloc_array(grant_status_t *,
-                               grant_to_status_frames(gt->max_grant_frames));
-    if ( gt->status == NULL )
-        goto out;
+    /*
+     * Status page tracking array for v2 gets allocated on demand. But don't
+     * leave a NULL pointer there.
+     */
+    gt->status = ZERO_BLOCK_PTR;
 
     grant_write_lock(gt);
 
@@ -4103,11 +4120,13 @@ int gnttab_acquire_resource(
         if ( gt->gt_version != 2 )
             break;
 
+        /* This may change gt->status, so has to happen before setting vaddrs. */ 
+        rc = gnttab_get_status_frame_mfn(d, final_frame, &tmp);
+
         /* Check that void ** is a suitable representation for gt->status. */
         BUILD_BUG_ON(!__builtin_types_compatible_p(
                          typeof(gt->status), grant_status_t **));
         vaddrs = (void **)gt->status;
-        rc = gnttab_get_status_frame_mfn(d, final_frame, &tmp);
         break;
     }
 


