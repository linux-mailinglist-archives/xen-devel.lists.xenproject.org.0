Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C249E514
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 15:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261508.452887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD65H-0005Nf-0x; Thu, 27 Jan 2022 14:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261508.452887; Thu, 27 Jan 2022 14:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD65G-0005LJ-Ts; Thu, 27 Jan 2022 14:49:10 +0000
Received: by outflank-mailman (input) for mailman id 261508;
 Thu, 27 Jan 2022 14:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD65F-0005K3-LD
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 14:49:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 482ca612-7f80-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 15:49:08 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-2arEmq7zMCWOxUNe2YOImQ-1; Thu, 27 Jan 2022 15:49:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4887.eurprd04.prod.outlook.com (2603:10a6:20b:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 14:49:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 14:49:05 +0000
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
X-Inumbo-ID: 482ca612-7f80-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643294948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fOd3RfnzHL4D+dtvfMnfEOwQW5XKehauO+k69wnLAEw=;
	b=M6EPiyXuqL3d81Ravjv1+E2WXIpNebaYSXl/Lb7gThsL5qEaMWJkParyE1ybzpaVTkVLyI
	nR6waOqAFaJ7H9lXhGQlpNlPQ4uZZmBJkTnbm4P12w6Cd0J/Ok2CWkwrkIeijr445vaTWQ
	DeotFTFB/czkA4jVYEa5bv8qOzGsB6Y=
X-MC-Unique: 2arEmq7zMCWOxUNe2YOImQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ6PJYJgJkkACtdWpL/oCqimLZ/bYDJAGUwoyUG4mytY342cxzy7DMZGbJZyIfyxI4pdesJXZ8Y2mlucbJjOE/VFn8aQTy9QIaMHDVqk0caUuUC7M6wbwhX/Vp1t1jnMs6q3zHJOU/36fgi4dv0irH1Qe4FhQLZA9bb23CRc8soDGRfp1JA6ayEVNCTmTcMNoUfzxIqzO1z5ZxMY3/ACa7aPDF28YnUvOIVoIS9qN0hKNCxAnqzA5OTzM97CvhH1Tlal8im9KywniGWZTaavDyppTXaILR/jxBNZHwBuRs/ejnEPdVJnDRCYASS/tPmZWGG7YBVU74NPkpE1nlRB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOd3RfnzHL4D+dtvfMnfEOwQW5XKehauO+k69wnLAEw=;
 b=kA8RgK2JTtCtBJvER5pC7crfGfyEwyRKja1zx2l82TvgK/L8Gpnc8eCGD//DxoBbHPeUHJnJYU5Qo+sbIWR7Qfc9LhjVqP7rbXKYpIplQhJbA0McqDyVfsqxg07BCDdewZP/Hk9xM1gQAI/YUO5glnG7dFe39tslGyyk+6fdjaO8yPoEBJeJsp/yn0odgGtj/cNIe7oaLvRf43c2JpRaaCYLvJeoVnT3xkXsZ8gv4NpbgIkMAkdQdrxtenM8ZQAKTBCRYbq3DJntmJZQ6az0i3OjPXTCbXohiHtb7tI1Stb2Ri9Vd0x9A0QEOUKNuygz7z9JWqVZ14mVgA9SN6+12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a39cb48-7d38-6d7e-0557-fd93d377a31b@suse.com>
Date: Thu, 27 Jan 2022 15:49:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 3/4] VT-d: replace flush_all_cache()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
In-Reply-To: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0025.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9a8ddff-2c5c-4221-b4dc-08d9e1a42ab3
X-MS-TrafficTypeDiagnostic: AM6PR04MB4887:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB488774507021154F1E5DCF90B3219@AM6PR04MB4887.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jWaf/7f4fo1ZwZ1+QAYkdaQbjMwwrhCCnU1y9mn1Vm9jvCW2kdp24RYW6y94ib2mYNfBGWdP4fw9jTw06Vz80M5fHoX0nolNakG6Sh2OM6StizWw1W+ynsPBxN3+/HFpgnH+ILabUciUErONuHisfTAC4rqNuEvpAwjtbYB3F8L6owEL63mpUiu+KXLUUEyP2TUBzg4EPpXwKqM3/kvvhOIz4lEJGIIFHfFE4NS4eXNpix2MnCObhD2fccmIoteBzP2I72dHzMe6ByosWIcEG7csfK6iWLcbyQfIqcHIK6OSnnb1tMgTAi1JM76wjGyhoeoATcG8YdrpiL+/DlawXGEdDow+LP91q2tq2QD1qFExaFdhK5Z1SH4Y/gVtSeEftfzKTBr6lZxABbqobqgI9R5+Uvsj0/wX5BTBDqCMHx1OaI81xySrYTZpzXh6wyqJIkUH6IbcnMPONZPToTn252T46k3LT0bClZeUxtWaM0WHQR0To7CrwcbJEu4YmbeJ3Bp5BJ1MvsSqhY42O7HwbZIFKQSip+8IbHmvwKqvb2VG6k7LmG1sxK+WobR7NESHS9RQFAVIroeOGqOIxNtKvynGcFPujVDvV+YSmVe1WONFu41NE8Darh3sAwKzK4FnuRCDwNnyp1AzxHH50OLVglV6MjmXS1YRbP5bOCcg8kgi202sC+9iSoA+QDg2gbdiaG1b/rHnB2sBC+6Ba+brc2Au+PCSgWLVWLmBvIjNxOJj+bjUt6ejJeOrUk7qcjzE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6512007)(6506007)(186003)(26005)(31686004)(31696002)(6486002)(2616005)(54906003)(6916009)(316002)(86362001)(508600001)(2906002)(4326008)(8676002)(8936002)(5660300002)(66556008)(66476007)(38100700002)(66946007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGFUMDN4RmFtcWhWRTRBWExCaUlkdHVsZmd5aDk3V1BUbTR1Yk8wandXcld4?=
 =?utf-8?B?L1BSbFB4TCtwMy8rK1p6TDdDYnRpeWZ2Q1R5WW92TmlQcnFSSy9od2hubGgx?=
 =?utf-8?B?bkZGVVd0bGpmLyt6a0daOGZUOUduMUFtb21XK3IwdEg2cWc2V3gyRU9XWncz?=
 =?utf-8?B?cWhMOWJKcDI0NlJ4TUFNb3U0enZFRUUvL05oUUZWb0FCMm92cTVTMWxIUUc2?=
 =?utf-8?B?NEZKQ2diMVdyTlVLUU1EbmwyWUZYb1FUN3IzZGdaUmlNVHpZNnFPSDlTeWhj?=
 =?utf-8?B?bXV5NmZxRnhTT2xnOUdTakhvZWFrNmxMS20rdFBxUzFDeDNoWTlhUW1tTWF3?=
 =?utf-8?B?YVBQdUQwdmw3M0VxTkVJRFJCbFV4TzEycTB3U0ZrVTlRWlpZT0lnQ1JZc2Zs?=
 =?utf-8?B?RDFDd1pKNEREL2NIVndsVjFRdEtpTjUvVS9VWmNwRnZKV2pCWkg4NlZJWjlv?=
 =?utf-8?B?b3dUQTlPZ2czbTBSR3BwSWUwM0dwTGdGelNuREJXb0VaY3EvZmd1S29PTGUr?=
 =?utf-8?B?dUdUVW10QmpnTHk5T3RkbkNVdnhMeXp3cUpEbldHVHZGemdtYXR1ZjVjSitR?=
 =?utf-8?B?QTJnNFhPNXJFdjc1NWg3aEp2eGpLcEVvL0VaeGJhbUNETVV0c0JQaTYyaDdq?=
 =?utf-8?B?R1FiVlh5SFRucmdLdFFOL3N2aFpkMHBKSnhFVStuZ0xIZm1EQkdPZmo2RUpS?=
 =?utf-8?B?eW1kSTNjQUdSZHMrYkpyUW9LTTRrVVlqNzk4RFAxUnoyL3hTNm5CTHpHZC9V?=
 =?utf-8?B?NGVmTlR3Vm0wbkE4bFFhejE3VkhoYjJ0eFN0M0V0L0xVK2R6VlRlRkdVVUo3?=
 =?utf-8?B?M2pucS9XdzMwU2RDNWl6VVlkaE1IdTJTZFVaeEhjWXd5bXB0cjdGOW8xeFRl?=
 =?utf-8?B?NGRaMUpodEhXVzBNWXdRbVhvcXArcmNlZkx1NEtwMmZMQTVqVk8yZ0pxMmRY?=
 =?utf-8?B?YzhrV3plWk5SckV0VnRic1VJWXpYd0hqL2FzN0J5bVlQWU9mT21yWitjK3V4?=
 =?utf-8?B?UG03bnFGdlZXaUovQ0pBZ0NEUUpRRkl2TGJjMUk3S3A0aFlGWlhBZXVqMGJD?=
 =?utf-8?B?NTQ2QmxYNU9weXR2TkZQMTRGWjNsTWMwS0FVeFIrUC9FQ3YyMWdMci9oNDl0?=
 =?utf-8?B?TVg3NFRFczEvOHhVWG9hallucEtJaTZROE4xNzUzVVd1QW12R0R5ZUJtdWVh?=
 =?utf-8?B?RUNqZmN3ajZERGtKQ0w0cUtlUUFkS2FPak0ramRwNXhnVnZFTDVJMEdIZm9R?=
 =?utf-8?B?WTBMWHcyUDZCcjBOYmpZY2p1OHRaSHpTSWhXMkh4RlVFbXV4THI3V1hnQW5y?=
 =?utf-8?B?M0d4a1Vseis0cGpmbE5RSmtHM05MZzh6MnZnYnJNVmJFQ2ZVNHBKK0pmNXhZ?=
 =?utf-8?B?dFN4em83S3FsRWluVEh5Tk95Ny9LTWl0dXI3Zm1CUVp1eFQzUXZxYTZJY1hh?=
 =?utf-8?B?WmtZT05zZmZuSjNhZFgyU3QyKzU2elZReTdjRGs4cnR3ZE9zZmNxUklmQS9H?=
 =?utf-8?B?WUlIcjZ2ODZENnZHd3FkWnhwcEVxN3NZNEFXVkxJZ1BkNUhDOVFBSjhtRDVX?=
 =?utf-8?B?UjFRbkZMc3RmdVVseUxWbS91andaemxaYmZ4T2NmeDNURWlDay94RjV1eGd4?=
 =?utf-8?B?Y2pxWlB0eUZpODQ4dXlnS3VEeW0wYnRvMUNOQWpGejBoVWR3RTZQQ3RDdlcr?=
 =?utf-8?B?Z1E5cVpXVmw4dCtUSDB1aXVuWndGVlkyc2FpRHJna1RMaFlWRG5SMHZzd2Ey?=
 =?utf-8?B?OGppNnJqNFZVbVB4aGh4aTN0TWQ1b2I5UWY4MnBVWElMWCtzVW8rNjRZNTNW?=
 =?utf-8?B?Yk9oOUZHd0xsazYrOFk0MWJLOTFlQUQ1aTJTU21Eekh2ckRha1JuNkRvNG5M?=
 =?utf-8?B?RjlvbVZXN0JvY203NUlybWhhYWcyd3lRY3ZPOE1KUTVFMGZpdUw2QUd0aHQr?=
 =?utf-8?B?K2RicTMrZkt3TTFkZ0lCWXhEN1J5U2RQcXlmc1RWVi8yUHQrZ210emxXUUhH?=
 =?utf-8?B?VENqSW9UMTZlWjNLd3BsbG9JUTdxZ29HNjZKUzBHcXdiQWhtMklCOHR1cndl?=
 =?utf-8?B?WFlOSlFVVWlEM1l5WnZFc2VBZlJOWG9Ha1pBbWtIWGNiemlpK2RIdkhWU08z?=
 =?utf-8?B?M3BQdU5OK0p1ZmF5R25vMm9hWjk0S0tjQTlYUUtweEtpWGdRc1VOSzRmYzlv?=
 =?utf-8?Q?YCF30gS6GVa7P1gsdTcbCWM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a8ddff-2c5c-4221-b4dc-08d9e1a42ab3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:49:05.8348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJ49VW/FBLu+GdS0nXSlr0OZW+WqQLMQGM56ly6z5Dx2znq8875HDUwQe7O4sgj9h1r8pFJh9rhhO3QqPvSe4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4887

Let's use infrastructure we have available instead of an open-coded
wbinvd() invocation.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -78,8 +78,6 @@ int __must_check qinval_device_iotlb_syn
                                           struct pci_dev *pdev,
                                           u16 did, u16 size, u64 addr);
 
-void flush_all_cache(void);
-
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
 void free_pgtable_maddr(u64 maddr);
 void *map_vtd_domain_page(u64 maddr);
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -623,7 +623,8 @@ static int __must_check iommu_flush_all(
     bool_t flush_dev_iotlb;
     int rc = 0;
 
-    flush_all_cache();
+    flush_local(FLUSH_CACHE);
+
     for_each_drhd_unit ( drhd )
     {
         int context_rc, iotlb_rc;
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ b/xen/drivers/passthrough/vtd/x86/vtd.c
@@ -46,8 +46,3 @@ void unmap_vtd_domain_page(const void *v
 {
     unmap_domain_page(va);
 }
-
-void flush_all_cache()
-{
-    wbinvd();
-}


