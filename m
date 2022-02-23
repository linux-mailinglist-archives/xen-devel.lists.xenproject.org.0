Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2C4C17ED
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 16:58:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277462.473974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu28-0000iA-FY; Wed, 23 Feb 2022 15:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277462.473974; Wed, 23 Feb 2022 15:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu28-0000fk-BV; Wed, 23 Feb 2022 15:58:28 +0000
Received: by outflank-mailman (input) for mailman id 277462;
 Wed, 23 Feb 2022 15:58:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu26-000083-UU
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 15:58:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f4c82fc-94c1-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 16:58:26 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-Zm6pYrUGPle-SJIaBPcs8A-1; Wed, 23 Feb 2022 16:58:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2479.eurprd04.prod.outlook.com (2603:10a6:800:53::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 15:58:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 15:58:21 +0000
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
X-Inumbo-ID: 6f4c82fc-94c1-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645631905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UcksslQkFnjukx7/qYD/769exeJYXe3uEWi/y4UhXP8=;
	b=I2WVD+bKt7OphxsKNTrcGgt55gQGf6RyzwBg1ZQYLgTmWG73jqj9/aZFl0PyrfKfK/D3gZ
	s1vMlskfNEV+F7q2x4SJCeO0AVaakiD77DgCXHdCjlaNnZvSUDoMjr4vpXQ38ZScDkZ+wO
	P3O0P6DMr6LMWpSPxsN/8GUeeCl/wiA=
X-MC-Unique: Zm6pYrUGPle-SJIaBPcs8A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTkmp3eUsu+niUJ8vaY04/O94scbFhQpwOAkTC0uN1TE62IECYiLvpxkwJyXdYogd99jnmBbzCuZBrc0Pzh0XI6o0/iYgFRp1Bt28swjIysef2Ex9C+/crNZ6MRiTEtSveXDe0qnH8QSLiQeszoH3jQ5GuC/JbUtR+tjmRGTBjTWrkxqBsADzC/5iy0EGGK+Ued//VvVERJeDi6oprcuavTWrPa133HU6MZ0GCjdGC6eWNr7k/Ep0qFz9Exm7RPlQVxwCx/HZCT2XjH0RhsY1pTqxUXY14fdk43P+vHz0fVSSvHKoSCJPcOHghGc5QNgcoK0l83ro6ci+tVVydOmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcksslQkFnjukx7/qYD/769exeJYXe3uEWi/y4UhXP8=;
 b=JIUGLUacf0gy7AXabk3vQv2+mrJ1S3UyApcqdAZaiSfzRYopSPsinic9iVzrNT49hpSDNNOoWNg5WFPchRY7Oa1Mqlt+EKdxfHak1kTWmp+jaOcCDdp3axrAzG9UTLS6ySumb9KybjyFpww44Hnzjdsqa8ktM1wAkSgAI39BJimaYUob1V8PsrvZTmtACcVtJSg+gB6PODoD7YnY9jEM46IEN4Z+fs4C4T6VCv7A3LsWmvQRfldiNOT8GNwGll7V6NDDdRgIfDWhy0eZZoLAYC0op+Pgluovg4De45sRWLCm1JVIEuOMFXt0t1loWo0UEFfgA0MWOvt2tjIM+HpmKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8ad290d-65ba-8437-276b-5d5f1d4d225b@suse.com>
Date: Wed, 23 Feb 2022 16:58:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 02/14] x86/P2M: introduce p2m_{add,remove}_page()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0087.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2401632-ba8f-4e18-c1d4-08d9f6e550f3
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2479:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2479D2A799AFDE50662D12A0B33C9@VI1PR0401MB2479.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yjw9wy2M5E9JsbLrU4e+tchVyP22l5Ka1irAt6Qzpo3cFATgJqMy2gaJpQDXvEQ01Kb42wqkpElDtuzHX9fOx28YUd+eJ2w6/JUJh3vQhC4HTkR0MBUncCucAiulK3GY6Fa2u9yunSB75aQyKNAcub2bwEw2V7s7KcGzfQ/N2Tk+2LHWzYZG60UtEAnnHmzp05jmjcwzcVZ9QvT5cPbIUDkeu+/aQ/9vLPEPAPZSTYsm2r4FNAwFBR1CJM6dmwYgazL1Isg79D/bUmiUUdtO+T3rn4oWX+x3aUbtgI1l/N+jMFvWAwymKLx4C8WNNT8w3tdc8qO6mSt2M43zX3OkoukUnCbAIUmYgupNOpayIb4mIMLo/CVDh9hsSrxEBx1w99vJu7+Sj6iERnc+l20mQjk2GRBhH3MtQnBMzgaaxqAZXLbzxjPmxNN2gXpmKYz00cTVa6dsgAn10h6WdTwot7UCZ4Kd++0ulcTR7qRG15B0YbXJMUGDu0H5atCYAihW8eEkDCBbNRShwYyDyALGTN0L5J7O37qY+Vve4pUiN4CLd2rUEDfUI+b6WySY7DLwRmwZDWCComYehgIC+z+BnYKBXx/qd9GwJrmpdsQYiTJ/3NSgfXbj5GNzEqiY4tKTcnKXSL/Fk1uTY8p1ZuXJBhP0yCy5bQwYQ2DbsbWnOaHVkeCOoB1Q89xtwto5rxwVS7tYgaByo1GF1xgDx23TRkwMejxutTET3X7Z0hdoyiD5I/s2hnYjGgKi6hnsfMuA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(8676002)(4326008)(26005)(66946007)(186003)(6512007)(2616005)(2906002)(6486002)(508600001)(6506007)(31686004)(316002)(8936002)(6916009)(31696002)(86362001)(38100700002)(5660300002)(83380400001)(54906003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmtpSHNvTW96RDZuZSsvdVdRcTZweE0vbjdoOWtETWRhSlFCQ3RiQTVwTlk4?=
 =?utf-8?B?L2FvSkUrQ25OcHdNTU1QR1BPRCt6K0o2TVhNc2VvOVRpNUpETnJGM2V0elp6?=
 =?utf-8?B?d05ZcXpvcU1OVWt0M0g0d1htck5iQ2c1L1owQkFPUzZnYkpJZEdwdjVzL3lQ?=
 =?utf-8?B?ejVrdWhZQ3YzZ3FQc2dOSUZhNEdzQXJMbEg5UC82Vkl3UUQxQkcxUGZNQVBp?=
 =?utf-8?B?a3VYU0hzaThCZE5CYy9ZQWFIMFJxRm9ZZnkvMk5FTnhPNS8zS2VjTHhVU3Js?=
 =?utf-8?B?REpEelIyVm14S2lZQ3hpdm1nd0pydTVObUVRODFyWkwveC9Ud3krNVB5VEpq?=
 =?utf-8?B?Q21tNi9oUmhrY1IvcWc3dC9MUERwOEVIU25TSFNjNVZXVi9FaFZ2VUtCeHQy?=
 =?utf-8?B?eCt5bHVtNWNsYWV2MnhRTXZHc21QWkN0WkRHUDlnQld1MGdweUlkRituWUdI?=
 =?utf-8?B?cmNCNXZCWGI2MENjUnd3dW0vUVhXRDk1ZlRRcUF0WXJjL1F4bytpc2poc2NN?=
 =?utf-8?B?K1BQSCtpVmRmT0U4ejQwMjFJRTRFS3B5bHQxNXhwMEZ2NGx0SDBCV1laNnhk?=
 =?utf-8?B?SVdkL3dmZTZOU1JLNkxoVkEzZ1FFeFZHb3NTZXRiNzU3dksyTS9aT0txNVlQ?=
 =?utf-8?B?QnpwcUFaRjk2RTl0eDNSQjA4cnVmYW9ROEFFWkdJbEsyMkpocC9nSnRSUndO?=
 =?utf-8?B?U2drUUJKQjdLak9KNzZnYkF0YXNWY0VBenRneENYR2xkV3A1MWE1ODBCeFQy?=
 =?utf-8?B?SWdHNkluTkFpZVgrdXpqay9ZbENYSnFkTG96bmIzVGVDNzlTYzR2MjV5UkJL?=
 =?utf-8?B?MExUek16eWtWOEQvZDQzQjl4WlRCQm9jZmJaYVBhZ2UwaTQ2dzQ1OEFkUnlw?=
 =?utf-8?B?OGpJZEtVUXNHMitjUmtwZEtjWUxDU1hFS05penpqOEV0QUhNdTV5QVBJUEtW?=
 =?utf-8?B?WkYzSFpUclR5K0NEYVExTzkzRkhNOGtWcDJvbWlSU1d6OFhaQnh5T2liVUY5?=
 =?utf-8?B?OHQrSWp0dVhPNlViWFlNV1A3OHZGb0hBbWQyWUhFNHJxY3ltcGZYOTQzTzVx?=
 =?utf-8?B?eWg5ZDRjR1lkNmlrdVNQeVJ4MDllODVrSThsaDN6bmRLQXpLR2xrVWk3OWtP?=
 =?utf-8?B?OGwrWlpyNkMxUi92cFRReU1HWVVmUmgzNjZyOTRlVGdhc0krUUhpdVhoeVdV?=
 =?utf-8?B?L08xWFBvZ0o2RXhYdThpQkEzaWlkTkJQcjN6WlJITGh6NmxzNDR2eTdaWmxS?=
 =?utf-8?B?YXVGK1dubGl4Qyt5cklET1JHc2N5UWNMU1VMMXJqVFBpRjlOUVBDcnRTZGVC?=
 =?utf-8?B?SCtQTmRBdncvaldKMjJZd2ZqR0hsMWlzMzZmQjM5anZzRGhSeVdUVGtPOE13?=
 =?utf-8?B?N2puUm9YeXR6OGdWZWVueUprbXVjT1dhTTFRMGYyZkxhcHRPbEdycEwvLzlx?=
 =?utf-8?B?L1dqbzdDcDF5Zk9zaUNOOWxHZjFFb1hvS3VrcVlMSXNvSEJhWm12aXpnaUFN?=
 =?utf-8?B?eWdQbmM5czkzcUM1WmZKUnViYnFUbnpQc0hDQ04wS1IyL2ZQQ3JEL1R6MnlI?=
 =?utf-8?B?RXRDb3phNEFPRmZ0VjVPdkl5aHNVTlBNWlk4R2w5dkNyWEYrbCtWd1ZpYTJm?=
 =?utf-8?B?N2ZtODI2OXF6Skh1Q1hLMUdtdExQOTFHS1hGWDRybjh0aVFtSlFIQldYZk5y?=
 =?utf-8?B?UDJZbDB4NE5xRnJJSE82SVRhMHI4TU5ST3h0T2VUcmRGMjlGTi9BZS9QaU9G?=
 =?utf-8?B?V3Q5K2JLejF4ZnFuMlV0YTY4YzR1SG0rK090c1dKMW1Hb3oweTd1dTF1L2cy?=
 =?utf-8?B?YmtCU0psTE50K210UGdSeDZZRGdvU3d3bDBjWXVOTXRycGVFZDVyTDBtcWpa?=
 =?utf-8?B?a3B0MXZoOTZ6YWNmaXFwSEhMZStxakZrdWVFU3FsNitUWFZKSnZsOGVldEh3?=
 =?utf-8?B?bWhGRE1vSXhQOXhmUDB5a0pKZEt0ZnFvVEdwNmhZU0pubDJBeXlUQmdvSDgy?=
 =?utf-8?B?cTdqcXRFZGw1c0xpcDZBQlI4cVpWY2pGK1BsNmF2MFhleTJIQ0xpeWM3dFU5?=
 =?utf-8?B?aUx3c0JXYmlMeDRkWVNRNzVJallTNFd3UDV2MzRBOTQzQXVuNGwrejk2MnNj?=
 =?utf-8?B?SEFQaC9McFZDRnNnU0xvMm1scHgvRlFUanhmVU1rR2xCZWJ4VWdTVjZOR1NO?=
 =?utf-8?Q?hh6Xv8EJIVBcZViPnZLLKRo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2401632-ba8f-4e18-c1d4-08d9f6e550f3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 15:58:21.8231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+NkDB1vovupwkMp3XZTRieGTc5miDaMCztCt6vo0rypIgUOPBUNwGMEss4IyPV9dYprXudVp03a89lqTB5ttA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2479

Rename guest_physmap_add_entry() to p2m_add_page(); make
guest_physmap_remove_page() a trivial wrapper around p2m_remove_page().
This way callers can use suitable pairs of functions (previously
violated by hvm/grant_table.c).

In HVM-specific code further avoid going through the guest_physmap_*()
layer, and instead use the two new/renamed functions directly.

Ultimately the goal is to have guest_physmap_...() functions cover all
types of guests, but p2m_...() dealing only with translated ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
v2: Re-base. Adjust description.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -173,8 +173,7 @@ static int __init pvh_populate_memory_ra
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
@@ -850,15 +850,17 @@ p2m_remove_entry(struct p2m_domain *p2m,
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
@@ -867,6 +869,17 @@ guest_physmap_remove_page(struct domain
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
@@ -905,14 +918,14 @@ guest_physmap_add_page(struct domain *d,
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
@@ -2724,7 +2737,7 @@ static int p2m_add_foreign(struct domain
     {
         if ( is_special_page(mfn_to_page(prev_mfn)) )
             /* Special pages are simply unhooked from this phys slot */
-            rc = guest_physmap_remove_page(tdom, _gfn(gpfn), prev_mfn, 0);
+            rc = p2m_remove_page(tdom, _gfn(gpfn), prev_mfn, 0);
         else
             /* Normal domain memory is freed, to avoid leaking memory. */
             rc = guest_remove_page(tdom, gpfn);
@@ -2732,7 +2745,7 @@ static int p2m_add_foreign(struct domain
             goto put_both;
     }
     /*
-     * Create the new mapping. Can't use guest_physmap_add_page() because it
+     * Create the new mapping. Can't use p2m_add_page() because it
      * will update the m2p table which will result in  mfn -> gpfn of dom0
      * and not fgfn of domU.
      */
@@ -2846,7 +2859,7 @@ int xenmem_add_to_physmap_one(
     {
         if ( is_special_page(mfn_to_page(prev_mfn)) )
             /* Special pages are simply unhooked from this phys slot. */
-            rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
+            rc = p2m_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
         else if ( !mfn_eq(mfn, prev_mfn) )
             /* Normal domain memory is freed, to avoid leaking memory. */
             rc = guest_remove_page(d, gfn_x(gpfn));
@@ -2854,11 +2867,11 @@ int xenmem_add_to_physmap_one(
 
     /* Unmap from old location, if any. */
     if ( !rc && old_gpfn != INVALID_M2P_ENTRY && !gfn_eq(_gfn(old_gpfn), gpfn) )
-        rc = guest_physmap_remove_page(d, _gfn(old_gpfn), mfn, PAGE_ORDER_4K);
+        rc = p2m_remove_page(d, _gfn(old_gpfn), mfn, PAGE_ORDER_4K);
 
     /* Map at new location. */
     if ( !rc )
-        rc = guest_physmap_add_page(d, gpfn, mfn, PAGE_ORDER_4K);
+        rc = p2m_add_page(d, gpfn, mfn, PAGE_ORDER_4K, p2m_ram_rw);
 
  put_all:
     put_gfn(d, gfn_x(gpfn));
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -577,10 +577,11 @@ int p2m_alloc_table(struct p2m_domain *p
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
 int __must_check guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,


