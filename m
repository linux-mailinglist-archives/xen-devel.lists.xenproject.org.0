Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8276C3B4459
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:23:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147222.271234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlnU-0005bm-7s; Fri, 25 Jun 2021 13:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147222.271234; Fri, 25 Jun 2021 13:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlnU-0005Zt-4V; Fri, 25 Jun 2021 13:23:04 +0000
Received: by outflank-mailman (input) for mailman id 147222;
 Fri, 25 Jun 2021 13:23:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwlnR-0005ZZ-VH
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:23:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ecbdc7a-0b1f-4419-9918-bb8ef96ef5ec;
 Fri, 25 Jun 2021 13:23:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-frDSjFXnPK6jZigERtBcXQ-1; Fri, 25 Jun 2021 15:22:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:22:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:22:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Fri, 25 Jun 2021 13:22:57 +0000
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
X-Inumbo-ID: 6ecbdc7a-0b1f-4419-9918-bb8ef96ef5ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TOsEQIQ7DC4In8gkn+d6JI6dXDcB4jJx1x6CvkOlsRs=;
	b=a294FYBBvevlEBSopuYlVQqhszzmfSbTE7t9hBDK8N6rywXNcNLP8S+fxayAh6ziWEsi9c
	0q9crPVxYmCbTbzzdXVnmploYmvtqKfBtXPC5P5ai0qeRq1LcDamKzneMGb9cgJ27scKiC
	La1gXC4T5s/hJOT9htu+eT/qqBsBCCA=
X-MC-Unique: frDSjFXnPK6jZigERtBcXQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcTx8zSM+36hmkBn9SkOeA1y9eGzh77AwAiCevfWZFWyqsKahC6oa3Su8EMpfslsbP4aHVclDh2NG+WxE467GiCMry6fEQsrDs1dEVeFq1ZqJdPyoyTkFg7q31K7lD3Jd2BU620dkjrazEOgv8LjwwKa45vD/s7AjY6c7DGPgzzZzade8NFpK8Mh6Sav/Wdr1WMIF4i1tqZk/lof3G9qwZnfaeMmixGal+gjFsXssFg4VCRGq0n7nzxYke5cskDI9LZC4p3/hKl8BVfyvc2ubzyJZifS/FnNQgPQv/wHANfLm9HWBKEeEjZkItMtWsx9aMFk26cjErh/gbCFUvZZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOsEQIQ7DC4In8gkn+d6JI6dXDcB4jJx1x6CvkOlsRs=;
 b=eqGAmsarqy5g4BLw8UmE2yP/9ADmi6ZcoQKEjyn3SjIHA7s23IAkQQTZvX2Ptr5r5vUifTbqxmQbT5jl8R8Q8vcF1Nj0NHXgOUXz3IRBIj6VHT9Ari5xGPE1fOPQCMAy5WFHowPpy0cd9qoQBNUMJvIe14rjtJnaXAiGbjD1XKtoc1I7rdm6VYTiBBA+hAdT4W5Mp1xXgZs7+C6+UgI/MLMqDSpO+ozM9y4ccJiPrB024dimBcEUYOQ3r3nDrARKo8IpdyhhDbsKUihsVipPiV7kdTUFqW4iIEzmWm7ne4lFokBlDzxZo//gG8s/sjrpOeZ1h7c3//bG1I4EH/wXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 11/12] x86/mm: pull a sanity check earlier in
 xenmem_add_to_physmap_one()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <e0819038-98b0-2c4c-9176-70d68be39130@suse.com>
Date: Fri, 25 Jun 2021 15:22:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ece2f6b-d618-4c8c-3a0f-08d937dc5908
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3390092CCE375EFA495033AFB3069@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7xyUAR0A/RyvqjdVpfXbO55nZVhV2Nl9kmzv1YUNQjp5k9I9GjwNbRna0aX0hjuUbF6kNvyTx5/5OcMiACRiAkxknMWqjfDsM2qUUqM4bvLJu54Ii7yCNRZKUFYvqUkBi4fSE40SyeyJBp589+FClvzd3e3ALwqXRBRfVG0VaLO6Wid7QsYWFa/XNFedJ7YxZZimJjtzcFbB8NEc5TWC84e8+/AO2hJdlhLExJvldtgrfsOP5JTMHwzytCrkhhoSeyvUEwCFVh216m8QsGURcjGl/ton9NAysRNgYi2VixjaIieLB69mxQbQaSYPv97qRcBz3KaxW17xl5cm9ATCnXKj+k34/jug6g8SKE9OowhuPi3EagnAf6DlETnoc/GZ05yEr5Z/qoaaE6aH5yCp3nzxrJz7qJFD5Gs19/pYuEf3YGO11v3GMyB4PyC5lyuVmTEHVFsUWGb6RYwOuxw92NsQnttrADOiPCVaMZQfFjRU159ntFPQubbeo/4QxHr6hQDcbCQLegi0GbYZeQM7BRi+y12QsPBRAiUGgml/dLm5C8eiJHc0jTKoVRSBHxZt65vQBrY9ZFMDd7cp4Uz22XSfLnHBbKKpDvEsCtYvQASbJVFMAUEckPtr1TCFGg57+k/nedA71Mu9Bi0ActoXu6ot5/MERjrYN461m/EPtKtiMNqu1Fe7mMlZrsZzq5T7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(346002)(366004)(396003)(16526019)(36756003)(83380400001)(26005)(4326008)(186003)(31686004)(8936002)(478600001)(54906003)(86362001)(2906002)(66946007)(38100700002)(16576012)(956004)(6486002)(8676002)(5660300002)(6916009)(66556008)(66476007)(31696002)(316002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHRsMEV0Z2kydjZTZTBQTC9RZmNwcUFSQ2lkUHFTS1JLWnk5aTArVytLbUx3?=
 =?utf-8?B?TUNzcUgyRWl0N0QwZ0lZSkZSODZCTyt4UERQMXhKbFVoNExKOEJjVXFDaWdP?=
 =?utf-8?B?emdIaHZDbVdXZ2RQVGROdGF4MVFCWnVNNGQ4aWNUNk5qU2tJTnRINnVwQjZt?=
 =?utf-8?B?RnVjQXJtMmEzVE9NYkFuaXNydTh5Mzl0QUlGN0JrZzNHZWQzMUx2d3FTeVBI?=
 =?utf-8?B?b2x6bXJ6dE1qd1NDYkhoT3Q5RVgrL1VZSEg4czF0bUNiUzhzSlJMaStpZlcz?=
 =?utf-8?B?MS92dHZ1eXovUmFZRllINU1uOEtqUlhWQ05mVkcvRGNDRlU3azZWVWhJb3F2?=
 =?utf-8?B?aGJsdkMxcVpJb1BTanZVUzhWL2ZjWnFqa3h0ZSs2MFgzdmcxM0QyS1NwMUw3?=
 =?utf-8?B?cWdSR0VzMHZiRTdRUi9NWk1mc09EQlBpWUM1b2IrVE4xMWhLZ3pYcTFWQkth?=
 =?utf-8?B?bnM2NkhTdWN6M3BuNGY5Yi9tRzdub1ROZ25iNldFdXdzM2J3ZEZUL0E2dEtR?=
 =?utf-8?B?Z2Jjang4UWpZemY4ekZzTHhETS9XUGZiSy9teXI1d2gvcFhmMStPT3BKMUU0?=
 =?utf-8?B?OU5NUzdTSWlXb0JoUEd3NGx2d0FLMGlyWHNhb0d1TFFRZ0l6TTEvQU9Eb1VN?=
 =?utf-8?B?NC9WcDFtdysrWjVMMmltV1VJVW9WWC96dlZFSmNLSjE2YVdyUUwyWTVBRjFT?=
 =?utf-8?B?YXc5V3dQMXlqc3lZckNiOXVxaFBKWk0zbkx6UDZqUFI2c1JPU1llQXZPMjRF?=
 =?utf-8?B?TlBUM3BDbGJKVlh1am81elJEUCtOTjdSTmVXMkczT25jL3NoTXdzSDlIRmJN?=
 =?utf-8?B?YW5mSnNaQndZTURKd240QXA4T0wzSExKNis1czZGZEcva0RtcjgvUldzRUg2?=
 =?utf-8?B?RlhLRFdhSENheG93N1hXbnJ1ZGpmL3B1bmxOaUZ6elBFRFFjaVdDajlFUzdt?=
 =?utf-8?B?eUp5cHBUTkpUbGE4STRJYUpqWjdjZ29vakxtZ2UrM0JVbkxocnZDVGFUL2M4?=
 =?utf-8?B?SVpTaVBqRXArNnVNVUc1RkpsY2VwTWZOeFptOXoxZ2JWczZqOXdRUGp1T0Fi?=
 =?utf-8?B?TVU1QXZKUXh1N0JUVlRpa0thYTN1d1htcWlIOG5qUTFqK2ErVitGQjl0N3Va?=
 =?utf-8?B?blVHaHFWYVZydSs2ZERlUWRTLzB4WFFlTW1IdGhSMFJHVDZzaWFXME1Uck5W?=
 =?utf-8?B?UzgyNzFYYkpuK1hNUGV3cUdTaWRPQ0xDMzFxZTlsckpzbEozRDVKa3Z3d2Vx?=
 =?utf-8?B?S1FJVmpYOU5YS1pKbDcrT0xESVJCWHVEU3pWYnQ3NU1wQ2FPM0N6Q3FxYnNR?=
 =?utf-8?B?WVlCdEZ0cExLRGwyTW92cEJTakRpcTFXY0hWbjJVYlRLZU9OczFDbWVNNDdH?=
 =?utf-8?B?VWlDVzByeGxKY0oySzNTaHJkOE9mMm1obUNKRjRUWHlvWU9PZ0VQOWZRTWw2?=
 =?utf-8?B?dUorbWRHaHVLUmxzM2RZZnRzMkRGc1UzdTRZMTN5WmVGNVpCdHhTMkhHUklO?=
 =?utf-8?B?dTRzRFZQM2Rjb1Vyb1BVcjk0RTg1V1FOM05iRHpXSElHeU1wbXNWTHVJNFpq?=
 =?utf-8?B?aVhuMkpPWTRkQzBTbVB6OHFJZ05obElBYXZEZjNvWjIrVCtBQzZiTU54QzhV?=
 =?utf-8?B?M1NudVBBL0hlWkd2WXRZcDF5OTNBV25BRVRQbTduZGxnMmh0am9Tby9vSjgv?=
 =?utf-8?B?OGE5WnBpd3QxK1pkaVBFbjRsZXZkZklkbVpscmhWVERWa2ZDc2I4YjU5T3hF?=
 =?utf-8?Q?DVIeR4q/txwB1BvyTd5UKFLhTOPuoqxOdnGtUuR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ece2f6b-d618-4c8c-3a0f-08d937dc5908
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:22:57.6699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eY9aUD2DFKrcuTfzJRjzpStfP4VfHFj23vi2RhVLzuNtIbgNq+8YsikGeVXm1W3ofXfD7kVIgt//Xy3sw4X31A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

We should try to limit the failure reasons after we've started making
changes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2763,6 +2763,15 @@ int xenmem_add_to_physmap_one(
         goto put_both;
     }
 
+    /* XENMAPSPACE_gmfn: Check if the MFN is associated with another GFN. */
+    old_gpfn = get_gpfn_from_mfn(mfn_x(mfn));
+    ASSERT(!SHARED_M2P(old_gpfn));
+    if ( space == XENMAPSPACE_gmfn && old_gpfn != gfn )
+    {
+        rc = -EXDEV;
+        goto put_both;
+    }
+
     /* Remove previously mapped page if it was present. */
     prev_mfn = get_gfn(d, gfn_x(gpfn), &p2mt);
     if ( mfn_valid(prev_mfn) )
@@ -2781,13 +2790,6 @@ int xenmem_add_to_physmap_one(
         goto put_both;
 
     /* Unmap from old location, if any. */
-    old_gpfn = get_gpfn_from_mfn(mfn_x(mfn));
-    ASSERT(!SHARED_M2P(old_gpfn));
-    if ( space == XENMAPSPACE_gmfn && old_gpfn != gfn )
-    {
-        rc = -EXDEV;
-        goto put_both;
-    }
     if ( old_gpfn != INVALID_M2P_ENTRY )
         rc = guest_physmap_remove_page(d, _gfn(old_gpfn), mfn, PAGE_ORDER_4K);
 


