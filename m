Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031BB40F56B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 11:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189214.338769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRAe6-0002l9-Rk; Fri, 17 Sep 2021 09:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189214.338769; Fri, 17 Sep 2021 09:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRAe6-0002iv-OT; Fri, 17 Sep 2021 09:59:02 +0000
Received: by outflank-mailman (input) for mailman id 189214;
 Fri, 17 Sep 2021 09:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mRAe5-0002ip-Tq
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 09:59:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16bf2d24-037a-4f12-985e-605c55691ebb;
 Fri, 17 Sep 2021 09:59:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-1Vt9hYSjNEmrknK-JtHlTg-1; Fri, 17 Sep 2021 11:58:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 17 Sep
 2021 09:58:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 09:58:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR07CA0036.eurprd07.prod.outlook.com (2603:10a6:205:1::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Fri, 17 Sep 2021 09:58:55 +0000
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
X-Inumbo-ID: 16bf2d24-037a-4f12-985e-605c55691ebb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631872740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xdPDbcvCiZUeDEAkhwr7XaH1aVMs9KTNxlzH84DbT0s=;
	b=ErciHtPFLuvaUGr7oUXcha3jUxd10j4vRwwd43gKVguEb3JsYr/DTslXgz7e1+Loq4pxXa
	WPyd4m7o3jy3FqTm5QZLNL/XXiw/g7y3rq6TUICHML1bPMfHdOdQVVD/+nHDZLlSvggTfy
	jK3GJtMyXidaI/JiXWc9JuTUrf7s7F8=
X-MC-Unique: 1Vt9hYSjNEmrknK-JtHlTg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyHf+8Lg0XMBumu9uRY7r/t9M2l+7QCfb8WP2r+frCe4xEYpeZ7NLxjXZLv2/KQaoITZbsN9n/GRHG/q88Eaqxy+anlo/IeHhp7+UimfybT2gB4fvB5Q1ooVFxF/eNCHEtNmfcmJkndHJdeuosW0csekvrm7C+k0IqtR9nuPCPfcUHDkAXuhC1+gfbUSgQYjINcurLmxYu5An5flACJNwnl7d/hj0+8KNviEiXydYpcX5NfJDfNUroFaCUeS8CJ1RXpzkbq06ilLAWoQxCCyQG3cSYicWNjwP1VoW+Pv5A/ntxVkw1eB0D/PfDHrGCqABDZ5VtdH4i4yZALpJQ9rKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xdPDbcvCiZUeDEAkhwr7XaH1aVMs9KTNxlzH84DbT0s=;
 b=Yh6UT5U2b2WVMYb4tio3G1SL6Ndxd7d/maa7Q0VUn/yWzVYTrOXfHA7c0WbHQER0VJfXPhgdaZPr7MpTqqCtr+2kWEV21i2FJzxU/oEN+kiqqPFhUfeVIoLG2Zt2tj5I889aSyDJ2O7OD1cBKWmQ+fNgqEnz5s9SO3J+NS8zUqn0aSB8+y2+EKNZ/Iee9/zRxgCTdv8mw8+9qmTDIZfzHnTN6vx7c29IB2Ml5WoKR2RnEto8VANwID1Hlr/yfFln/nFgoW4ZnoF3w130RwJKx69LLoiQwNZWlD/DBQtxmEc++r8jN51bMRcxihjEgZ062MNVmzPlD/PpGWremr6KwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] page-alloc: further adjust assign_page{,s}()
Message-ID: <90df9041-4f1f-9911-d64e-f8d7b2a99534@suse.com>
Date: Fri, 17 Sep 2021 11:58:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR07CA0036.eurprd07.prod.outlook.com
 (2603:10a6:205:1::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49c1c2cc-92b8-48e2-6e44-08d979c1c340
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6861C17F198AB398C55830ADB3DD9@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ui4dj/cgScpV3hx7CxLV2F2bimV3tY4RiAjUiLT9OgHaf9nZ0iblBgJYOeuoMMicf26XXEzOZeT/2AXMyINuHPwzUz+931Xj2oK6ySHd6aBYmikqzQANsOnmYENITF/2NlCsQJ6bd4CUhrDfTbJqOFpefXocr5LfvNizZPx1E7nQOfaxWJyKrgIbDMZiUGmRsTTpMl79Wkvvj/DV23StMeNChAtHbNG5KxYBkEVKS3HURLc5wZH4NzmH2NCi++bDPp7DNhs+MCVdQ9Jq4t3IEB7ZMQN6D7LerCM20UuIwf5lDeMaD7+bvOaU/5EtrayuuUDfs2Btpk5YZJNvEiyXE/S1y/UaBVIg60o4FM2kveNnKFRo9g9Lun0Zsb1Iss3iQDD2rI4LC5kPIQ4NhgSRJ2hJL41fNp0yMpRuBM5A9PfMwkz1dVFV5d1UE59sil2z++NkD7cqJy/U9HvgxTbNoQjRCleBmbU6WbYE3jG9z8Xi1HqqUWGGeKBtDXdp0YCT6ZCcqWB/R01IDuJdUDBxwoY56RFDzI3ZJvJwpdy1otbKm8VknHpI6gfi3K1pfTyRPbNMVGdLQV/QQi8vmtkouETNpjJznNIQJllcvjqEWVL5trRBE2GM8KIcDuIJwfCLrfIoAp5Np5TF5mVxgpS0NQjjmfWS6ky/p9Wemd3gUo8PD/TwzWa+xSosU/+MDTKUREDOZUagMpWl2ap9wdIL78z0uukPHM/SQUhWjLxc/dw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(66556008)(26005)(31696002)(6916009)(8936002)(66476007)(2906002)(66946007)(8676002)(5660300002)(508600001)(186003)(83380400001)(4326008)(38100700002)(36756003)(6486002)(316002)(16576012)(54906003)(2616005)(31686004)(956004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGdQWWNZQUNBT0JGTXBOZVduZGxFWTBDeXdUSi93aTdsK21SR1RISFNFY3F6?=
 =?utf-8?B?WWtrczR4azU4UnFoQU5ueDJISHl1aWVtOGdTN01JT3pQeFdrai91SCthWlZ0?=
 =?utf-8?B?Z3ZmNE9JVTVvT2lrVUdwc2w4eHA0NGFxekZoSTFsbjVjRzNYOGd6L3RsSUlM?=
 =?utf-8?B?VE5xQVMwclF6MVQ1NzdRTHgrYzdJeC9pUmtMZWR3VVl4SXZCK0dxSWQvVzVr?=
 =?utf-8?B?bk5RaHRmckxGWTVPdnJFbG9pemtUZXRua05lWmFJSUxRaWs5TnNHamJnTW1p?=
 =?utf-8?B?c2xwR1NmN3VVd0x6N09nZTljNm9Kd0FEcVBMK2pBcEhYVnJMcXRsL05sZHl3?=
 =?utf-8?B?bFl3YTRINWw3NHcvM3I3QzEyR1VaVHNXbGkyOXNTSHJOaUkwQzhZNG5kM002?=
 =?utf-8?B?cHJGOEt2VTk1OHRTMUpqTitOWkh0bEtaaXNRRWRqRnRwMzhiK2FBMHN6NWlo?=
 =?utf-8?B?eGhQSGhlL2ErUWt0cDBnc0wrcUpoQjFpNjFscWN5VHJNK2hOQkxDSWdKak8r?=
 =?utf-8?B?WS9XTmFJbWdJNENqWlRvZEgrbWZoSDZ3WU9MMUtoZHVHQkxiNWU0WEIxN2F2?=
 =?utf-8?B?cFhvUU41YjJKT1RyL0ZjV0RSZkY0TVMxNkdQejV5RVZUb21MMlMxZ3VsMHlD?=
 =?utf-8?B?SDZQdzJSTlVpRm1XajZwWExyQW5LWldYNWlQdnZQL0Rwb0RiY3pMODI4ZDdD?=
 =?utf-8?B?SmR6RktTNzFHZnh1eW1Dc3BxRUhMc05jQ1Z1a2R2NWNrTkZGN3dPcjQ4dTdm?=
 =?utf-8?B?ajluZldDWFhxT2M1Yi91VDVVV0lSUG53UDMyZ2pzdXIxMkFobDNJK3M0M3dI?=
 =?utf-8?B?cW5YTHVnemJ3ejNGakVXaGNDaVRwTzUyYTgybGd6ajV5bjNYREFDWFJXb2Mx?=
 =?utf-8?B?MnFlcnovaDhOTXcrUW1FaTcySkl6OUVsd2Q2ZnptMzAxdHJsT3A1WG8wYlR6?=
 =?utf-8?B?VWtVSEkwSlYyNlZHZXlpSFZnTkJKcTkybWMvVDJiNmlYZTN4Q3RrSHpRUWFV?=
 =?utf-8?B?YW1MTTVlend4NmxUT2tLN0c5ekVsbVcrNUJUNEJKQnorR3JTUGswQUNqSkxW?=
 =?utf-8?B?VnozYVJoYytMOXNEa3V5akNvbXZkZ3FTMThGVTQ3L0VtTjJmaXV6SjErSnRs?=
 =?utf-8?B?ZTEvOW9yRDY5WlFVaXlkUzlPTnkyQm5BVUpBck1WWWQydFYzL0ZURjBJRERZ?=
 =?utf-8?B?L29NTml4WnAvWm1wQUc3cjlKUWlLbXhHVkE5Wk4wd0c5MVQ4QkhBOTh6TTRr?=
 =?utf-8?B?MU94aEFOMjV3aG1DSFBXQi9vOUVzMUVCQ0QyeTJWMmJZcWtKVEw5NURtYkxH?=
 =?utf-8?B?ZTJ3ZGNOMGE3M2dzM0xZT2lzTEM1bDFwRkpuczdSYk96VDA4SThJV2RFUWpi?=
 =?utf-8?B?TE1wa2YyQjVzSTdpU2hhK0daSlFtWFdhNXpCVWwyMklMdCs0NGUzK1dCRHU5?=
 =?utf-8?B?azFrMC95TlJaNlpMT0xaOVVIOTZoNnV2THRic0R0V3VNTEVyVUh6aEJjeURi?=
 =?utf-8?B?MEc5d2lsQmRITG94OG0rNjQ0MldhNmRzR0xyT0IzbEtpT21FcVJXZ2l1U2I5?=
 =?utf-8?B?WnZhbSsvc0EzTEtlSzVRMi9jV01FZ3dOSWhCbk1ydHJBd0RFSDZvTldiWkVl?=
 =?utf-8?B?cFdQcVBzRE1jUUl5dnZjWXplMW13OFdnQWhqRDQ4UUdsVUpXN3pGeFU0N2tr?=
 =?utf-8?B?U08vb2VLbGRhMVA4N3BacEJLcU1rVkF1bldxOGgwK2ZIL1FzTU5QdlpOMTU1?=
 =?utf-8?Q?GDIAKDPhDI/uJQ1DeJ2x0mjhLIvfP5X+1ysCsNt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c1c2cc-92b8-48e2-6e44-08d979c1c340
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 09:58:56.2383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AE1ofaFkaOiM/qabVDJmDLV/S3wUTwbXv9pg6q6qn0b1pc0778GeOHX8M5iJ8pa6SizYbU8jO5JN9dAwEGHR1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

The on-commit editing of 5260e8fb93f0 ("xen: re-define assign_pages and
introduce a new function assign_page") didn't go quite far enough: A
local variable and a function argument also would have wanted adjusting.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2269,7 +2269,7 @@ int assign_pages(
     unsigned int memflags)
 {
     int rc = 0;
-    unsigned long i;
+    unsigned int i;
 
     spin_lock(&d->page_alloc_lock);
 
@@ -2339,7 +2339,7 @@ int assign_pages(
 int assign_page(struct page_info *pg, unsigned int order, struct domain *d,
                 unsigned int memflags)
 {
-    return assign_pages(pg, 1UL << order, d, memflags);
+    return assign_pages(pg, 1U << order, d, memflags);
 }
 
 struct page_info *alloc_domheap_pages(


