Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B87C50DB80
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312594.529920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuKo-0007at-EJ; Mon, 25 Apr 2022 08:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312594.529920; Mon, 25 Apr 2022 08:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuKo-0007YW-B8; Mon, 25 Apr 2022 08:44:42 +0000
Received: by outflank-mailman (input) for mailman id 312594;
 Mon, 25 Apr 2022 08:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuKm-0006Gx-Pj
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:44:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c49a42-c473-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:44:40 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-amMb_LFZOMu6XEUgtkPj9g-1; Mon, 25 Apr 2022 10:44:38 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR04MB2977.eurprd04.prod.outlook.com (2603:10a6:206:a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:44:37 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:44:37 +0000
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
X-Inumbo-ID: f1c49a42-c473-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650876279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKOf5D5gFHYc8NiI8kFeZJqK9EWiOdTIy+CLucDl34s=;
	b=V9WX0lV0t2sza+nXm5ROHZ5dF/dsKoPBlSMFulcSTFGgWlqjo8m9uqKIHyv0bJgtNFSAKd
	ZZt1yrx/fJVm1GosY0GD7ayTovFpimClo0NodGWSRzuC1fCRKjjDpFI/ptIMD7oRSN3JvZ
	WjQENp91kO78ObeQp0HZroxjnbBw1Gk=
X-MC-Unique: amMb_LFZOMu6XEUgtkPj9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFKomPZ0ehnH2Tv7nR1rxT+Thg+o1r1+ZOU22OVWCYKdsYc+V3bVmmC7nI7WXSOSwLCNW9fy3wUSyYDt5oXW3MB/IXkpoe6s+XIrlNEgNoSHWtWSRNOOyWchT3VPrGIiD19j7K5kjpCxpK87xf1yV684dmEr8HmC5EWpqV9ZKG9gbMf0rUrvkJG+M1m58cmeEE+1fzRS1PFLU6MpIRx5A7zhkPTAQfhDoGS0RyTO1qRKzSpC8pgO6QnaXiZIDb0Uakx5WY+ZmrI9SMdapC940hSVyZ4V4Jo8zb5egnp0ynrXKSjVRiJg01aF/AvhLBQ1BmZ8LqCG2zLRgWPaO3T8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKOf5D5gFHYc8NiI8kFeZJqK9EWiOdTIy+CLucDl34s=;
 b=S7aFEpYdwpOcgky23RyKTWbkFXfV+8rfPhhvKiiwi/55q5PgdrPkY0V7mii3l7J+bHimPqFme3we4ukKnPpS8LFMsPQKmTWbnfB3m7UyKQOcRJgqjONfK0o9Xj1eNB5p6gNnMFVVvUgpEdl0BvCc/39mv23S6kay7IReWJEGx+0fXZiTXBM7PszCAcd35EWBbdpyMetrR9Rt9YA8LL006CO+8FhXTBJXf95n9cdwnNyGc+H2eHF3WmHG4zqoX5KbKLyScV7AQYHXRN7BHwncFKkK/4Dwfy6NJEOW7nHWD2ZVcg5gNSfDmGOHiaA8AT/8PFC8dxb8ZxTdDAA1QIjRpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eec16b83-7f8f-e94d-b1f6-9113ff93fd14@suse.com>
Date: Mon, 25 Apr 2022 10:44:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 20/21] VT-d: fold iommu_flush_iotlb{,_pages}()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::37) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70d23c8a-15b3-4f4d-dfad-08da2697d46d
X-MS-TrafficTypeDiagnostic: AM5PR04MB2977:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB2977557DDED8158909CFFD91B3F89@AM5PR04MB2977.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zClWtB2CE9VAH9kzgPKpN/kq1Dx1PNtOm0os0MInwnVppE4seVQOFtVb5OFr/MG8lQK5wBQ2xHsRRe6lG4ong4gYWkVRE5hPHXlZLzydgGniVLjbzKSC6ZfJCkRQlAG7RNB6HyR7a6YN7vq6hJ0MvleWZkW00r9Yo1voVU+9uzap24JrNTRs7vg7S4XNb2pF6fJT45vs5IKT2YCSiF7Xuv5RQOikicMaOSEtzxj6Fl/oKsw6ps97UArEkt9bmWLbU7TndWY8sQAvAbbNkCnVAbLScZTIOlpdo6ITl/oKpJBWotKvjBmcOvBvIiXfSkq4BAj8vNaoiTbwXcjxlLOZGuP0ZhR1RQiLqFtaBYtvngIeB/aaZ3/eTQDojxG4PlTudw2eiLu4Xylo+a4XDl+wNIo1uHzbjReMfbF7NXbpMSmFe+C7wY69ZlYMTOSqOlXTbBIW4GwJl7S2von9anyHxWiPW+MTWxK6QteCyjP7clekbrVgdPcViMT5PNi6Emy3oK9U+nIXAqCin7gEbLbIHF/YJZRrofIEgZ5g0DLR/XI3vdajh2QvtsuNa9nMLSJ9ckWaA5ItXsNVREJqeRABr5NUC5Wffe1F27qXaCEjHrchYmXbvJJWBYZ8SHW+kke6aNjxXZYGjG7TJCPQyf+6y3K3o3wuix6MxpZ5fZ3k1CH61cMuJNql4x7QvBzvxOm4ORVIYrnNcHHvaHvEqwzoHty3HKjkiMKMa3ASnc/9YZo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(6916009)(508600001)(38100700002)(26005)(6512007)(6486002)(31696002)(5660300002)(83380400001)(36756003)(86362001)(8936002)(31686004)(2616005)(2906002)(66476007)(66556008)(54906003)(8676002)(4326008)(6506007)(186003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3BOYlRNWVBwbkhoQjZPUmgxSjR5bUg5V1c2MzdqeXRoNWQ1VjB6dVhEdUNJ?=
 =?utf-8?B?UkJucVh6MXlvdFNJUnVuWE8zMkl6eFVZQ2RwWTlHMmF6YVpzUnh6V3N5RFhz?=
 =?utf-8?B?bVZOVVJ2eFBaV2ZNQ3VRRWRPMm5iOXNNazY3ek5Ddzk1K2c4LzQ3RnppNW1V?=
 =?utf-8?B?RXdiWHBDSkkyQllraFFhekpSMmxBSG4yekd5LzF0Z1JTUURyU2ZLSUtGS2Nr?=
 =?utf-8?B?ZTk1TmR6U1FBMHB0T1pDaGdUM0o0d0FCZGUzNW9vbVg4ZWYvdjZMVy9jaVdY?=
 =?utf-8?B?U2JoRXJQZmVUWjdJT3VHK0hqS015VXVtVWN5U2RjVzU2QjNsNVpQLzI1SXZ4?=
 =?utf-8?B?clk3eHV2RENRc0F4MnRDdTdEaU9RNjRKdEUzQTdRUDJycHlOQ3RxVmFWZjd6?=
 =?utf-8?B?ZWVlWGJGVXV0di9Ca0ZsL0Q1Mm1ZYVFSRnVRbjI1VWVmSlRaT1ZTTk5ONnZB?=
 =?utf-8?B?WkNwT1ZwZUV0UzNDbVNVeDVDUE05aHJDK2NKdHpUM3RkRHVTTHZMN252RHlw?=
 =?utf-8?B?Vk5ReS95eGN3WXRIMUpvaFVRL0lZZngxYy9MUnFQOFB0MEN4YnJMTklSQUhu?=
 =?utf-8?B?MUNoNVp0ZHhSOFFwM08vQjNjODhLVWt3a3R3YWpvcVhpWUxBM2lBZWRlRUc3?=
 =?utf-8?B?U0Eza3lzWFBBQUJZbEhSNU8xUzRVbVN0enYzRllYWjBVZHFjSTdOS3RVY0tD?=
 =?utf-8?B?OGxXT3R0S2JOOERBYnV1T1J0MFBZVERCWTRoRGRBS3U3YVIzbDIzVXZZcWFJ?=
 =?utf-8?B?NHJDQ3ZSdWh0TG9nTTZFSWhPM0JaODRma3JEZWZGQURvd1p6aVZzYVFudXBs?=
 =?utf-8?B?cEluSmprTUp3eS9BNGU5NDFnSDJGSm9lR1RuUEw2dy9hcTVIVjVxZEVJdnFR?=
 =?utf-8?B?QlhmUVlmdTdJTHo1MENEcW9sWFJCRHdUcHdOL0NnM1pYK3RCWEk5ZFJGVXVZ?=
 =?utf-8?B?c2MzZkZWVmkyUGpvSDB2SkRocXY1NnZiaTV6ekh3UUc4cG9zZEpVV0YreTky?=
 =?utf-8?B?L0YvNzJIbDhKb2JTZXN6NENKSWNoUUtDQWpXaFRRQUNGS2FXb2pZbU5ZdG1B?=
 =?utf-8?B?RGsweEFWK0JaRTk5UmtFY0xiQ2hoVnhINGNlRThkbEFmai9SS3JiT1lvYUk1?=
 =?utf-8?B?RzNwcTZCN2FBWENhNE5WTXJxdzFzM3BEWEdEZUo3eFVsZFpmcHVKU01yQ0hW?=
 =?utf-8?B?L0sveXpybml1YS9MZENZTkJqK3ZKL2tEOXF2VEFjeXpVRG1SOVVPZURWMUpF?=
 =?utf-8?B?OGtmb3hqODB2U1lJQ3Y4Z0JlRktKTE9Gd0pVd0MwQ3ZsYVR2bTE4ejhRMmxZ?=
 =?utf-8?B?NFJORElDMUQ4WnB5Q0s3SThWc2NLMEtRbEVSZFZ5RXlNZ21TaGNVUk1qZmhy?=
 =?utf-8?B?VG5HV3ZpdTlBbmprNEg5eHpVbzVUb3ErUkVQYUF1OFJuVzRWdG1UWDNPS29N?=
 =?utf-8?B?bTNVNTdMQUdmcUowcTV3L0w5L0pFS0wwcW92UkFrcExiemhXdUtNZzlQWVY3?=
 =?utf-8?B?bmwrYWxtY0xGYXVrdkhuUm12dTNabFZidUhWeTVOYmtKNHRkVFgwRG1ERjFn?=
 =?utf-8?B?YzlDMWNJQXRYa29TNnlKM3RIS25zS0RXTGRGVlRHT09hT1d0Yit2SzF0cnFQ?=
 =?utf-8?B?RmE0eU1zRFp1Q2FOeTV4ejB4dWhYUXphcFpCZmp1U24rTENtdWhqZTZVTGcz?=
 =?utf-8?B?bnQxL3FPWGxmeUc4TUxCWjNVcHo5ejlNL3pJaTBDSTN4eFJWS2pPY0dXQXVk?=
 =?utf-8?B?MnlacHlhS1VscFJBb1gvMGhTRXl4K28wQUNmOFprcmY1Vk1CNTBoSHhoTzVG?=
 =?utf-8?B?RlorUTdrVEU3RkNTYWpvZndMa0w5bWhRM2c5cjQ5dHVPRzJPUms1NTIwakJm?=
 =?utf-8?B?dzVMNnB3eXBhYkhJUWJwTU1EcExJb3hPSHNmZ2N5ZmtOb2Jqb3RQUVlNQUhz?=
 =?utf-8?B?bldiVlc0a3o2UVdJUkduK1NheWVZK0EvTmRsdU1SSDN4clcveUhvdUEwRmFR?=
 =?utf-8?B?d1lISWNWVlhaMUJydnZIYStPUnNwM2FzOVlEb3dwd2V3WS90SUNCcDEwSmZR?=
 =?utf-8?B?cXpFQnpCWDRlYm8rRW9hZHpVd01jeUdPZ2Y3cmtzVXBhN01aUVVIeC94QUI5?=
 =?utf-8?B?cm1TaDJXZXF1bWlLcTRtOCt1QWl3MXp2dEhZVGdHY0pSd0lBUG43bUptTXpn?=
 =?utf-8?B?b1pGcTVIdjMwV3VxZURjUDlnYzVjUDRGeU1ZWGlnRmIxRG9Eb0U0SW56TEY5?=
 =?utf-8?B?YlBmVDFTVTUrTzVyVDh1L3hJekpJdDFxMWRORVBiNHlXdVNHYTAyY0hQRWhk?=
 =?utf-8?B?VXdDRzBrWGZVVENlQUhtS1UyWnh1Vzg4NEVXVjJxRzRXazBVWXQ0dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d23c8a-15b3-4f4d-dfad-08da2697d46d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:44:37.3171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7fAhFoevg0hQXWekoohtYGS79unbsX5B0enOzQDCkaNq6Bo8GhownF1cPEFJG0IIjzLwpci9yftLEm6kAb7cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2977

With iommu_flush_iotlb_all() gone, iommu_flush_iotlb_pages() is merely a
wrapper around the not otherwise called iommu_flush_iotlb(). Fold both
functions.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -728,9 +728,9 @@ static int __must_check iommu_flush_all(
     return rc;
 }
 
-static int __must_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
-                                          bool_t dma_old_pte_present,
-                                          unsigned long page_count)
+static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
+                                                   unsigned long page_count,
+                                                   unsigned int flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct acpi_drhd_unit *drhd;
@@ -739,6 +739,17 @@ static int __must_check iommu_flush_iotl
     int iommu_domid;
     int ret = 0;
 
+    if ( flush_flags & IOMMU_FLUSHF_all )
+    {
+        dfn = INVALID_DFN;
+        page_count = 0;
+    }
+    else
+    {
+        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
+        ASSERT(flush_flags);
+    }
+
     /*
      * No need pcideves_lock here because we have flush
      * when assign/deassign device
@@ -765,7 +776,7 @@ static int __must_check iommu_flush_iotl
             rc = iommu_flush_iotlb_psi(iommu, iommu_domid,
                                        dfn_to_daddr(dfn),
                                        get_order_from_pages(page_count),
-                                       !dma_old_pte_present,
+                                       !(flush_flags & IOMMU_FLUSHF_modified),
                                        flush_dev_iotlb);
 
         if ( rc > 0 )
@@ -777,25 +788,6 @@ static int __must_check iommu_flush_iotl
     return ret;
 }
 
-static int __must_check cf_check iommu_flush_iotlb_pages(
-    struct domain *d, dfn_t dfn, unsigned long page_count,
-    unsigned int flush_flags)
-{
-    if ( flush_flags & IOMMU_FLUSHF_all )
-    {
-        dfn = INVALID_DFN;
-        page_count = 0;
-    }
-    else
-    {
-        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
-        ASSERT(flush_flags);
-    }
-
-    return iommu_flush_iotlb(d, dfn, flush_flags & IOMMU_FLUSHF_modified,
-                             page_count);
-}
-
 static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level)
 {
     if ( level > 1 )
@@ -3254,7 +3246,7 @@ static const struct iommu_ops __initcons
     .suspend = vtd_suspend,
     .resume = vtd_resume,
     .crash_shutdown = vtd_crash_shutdown,
-    .iotlb_flush = iommu_flush_iotlb_pages,
+    .iotlb_flush = iommu_flush_iotlb,
     .get_reserved_device_memory = intel_iommu_get_reserved_device_memory,
     .dump_page_tables = vtd_dump_page_tables,
 };


