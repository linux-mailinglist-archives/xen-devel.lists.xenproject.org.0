Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF513FDF5F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 18:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176546.321247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLSlD-00012n-Bg; Wed, 01 Sep 2021 16:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176546.321247; Wed, 01 Sep 2021 16:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLSlD-00010e-7b; Wed, 01 Sep 2021 16:06:47 +0000
Received: by outflank-mailman (input) for mailman id 176546;
 Wed, 01 Sep 2021 16:06:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLSlC-00010Y-4n
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 16:06:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99e5fc56-0b3e-11ec-ae00-12813bfff9fa;
 Wed, 01 Sep 2021 16:06:44 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-sbgjM-IgPLW50Sk0nrDtbw-1; Wed, 01 Sep 2021 18:06:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Wed, 1 Sep
 2021 16:06:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 16:06:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR05CA0079.eurprd05.prod.outlook.com (2603:10a6:208:136::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Wed, 1 Sep 2021 16:06:39 +0000
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
X-Inumbo-ID: 99e5fc56-0b3e-11ec-ae00-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630512403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tt+7kx5BdjY1U94SmVlxWaRlQbb57pNXoUVSt8g/sWM=;
	b=NX9025zHV5SrMf2eaV8FstQb0O2zfrMmlcJbljXRo1RVbYTQkpI8t5wfrQJkel4Sp/JSea
	wz2pzQ9vhNC8SjUuZ8fKAC8NL70edTopac/X6ck/dLva6VsuIVhVhHDiMpyhNzTobL5YdZ
	7Lc0FSgELa1yAYULrz+DV+n8qPOm1fg=
X-MC-Unique: sbgjM-IgPLW50Sk0nrDtbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSNlk/SaIxvLDw3VzVNotapcqgLkSLmQup7XbyEuz45fLQe3O1kccLOccSDxcjYhXHh/+t6ZeXayoVJZ7m1Nje8nBTC1Mry4qvIOmJNNAskafJQ6BMphCZ1H+5Amrc4zSdAjtSO7wGs14v6bgjRQUWo0HiHsZSLtHPmmvQOtaczMkoGuWXkWtL8OakZqUn1swTpwAmCsdPFX1HFPCIdhwJKyq5LqM/SGVTrb2y7U8J3S48WUjo78PkwQ/OjGYf1vDr0hQ4/WsG0BD3l+FvfyCapBjzXmzWDESGv/dZhQBLY7pNxSs1xx+m4JAnFbQ9odSqA2xnqeqVNwSl1UZKf/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt+7kx5BdjY1U94SmVlxWaRlQbb57pNXoUVSt8g/sWM=;
 b=mGU749/3xxMTAqGM5Pzu5WxGOfQ2gqs/IkRoRU6RHWtcYDpw9slq4ex6Sz/ef145SAZxPZSjfV1ZozUyYI04EEgvXmWbbmdsx2MDWpFjRPcLfAVbVoiHel4O+wRFtixUWx0l6TqmadkLcXDOV8iyF9zSDAD6O6Fx7orFcjQeQtktbSL3TcEDPiFYB7xGf3nF6FVbZWSam6xE4Y6luUwA4RI/NU3ZsUdu/m497nSDMVT/UBfH1O9z8yhRZgU6uPkMN927MDy+ybwlPdXbSoAIyhK5oSUoLQJ61yhNVgp1L/BGult73hrbP0usjvAJj1efveSC9A07craV7B4R6j7zqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] common: guest_physmap_add_page()'s return value needs
 checking
Message-ID: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
Date: Wed, 1 Sep 2021 18:06:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0079.eurprd05.prod.outlook.com
 (2603:10a6:208:136::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ce9d0ae-d029-4ac7-589d-08d96d627b84
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61749CD031FBA4EC131502D0B3CD9@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vpjI26fkDv6QD2Kl1Klj+xnjoRqyHuKDNzgP1lJuQyBTZlL5FrVKhBgLCdz7ry+dqczTQx74iict04exc61SA3SunMzd3hmxFPvhmy//XZkrMwzZ+7NflA3gHSP8H5qr/fs5s9adxyVS72wPwOqIGxQHrb9skSB+ApDi7RBAkaPcQISTNRVGfJqWizHeqDY0gHkrsfbNMIqD7cZFo3FJ88vF/8oOHTLb+xh/U9K5H7KgfeRVenWIJre+7YYCQPFwknsDIo9kyluOarAcMJC4Bx6RTc+UIT+E8uNseFc795pXuQIJvf+eOY3ecCnfA+w2y9PoOuExo593kxHB6IIlNpeohsJO+ogNtLeFni7w8vZZJHthF0t2HHabZaJC5sDMVwYNHXF9lHnv+ESp5z8y5MKawPU31u1pTXQ4j5LN+0/xm+QPF3/qez3j5mad7efsUvfOtUB0R6bVhHy+5a6oV08wQUHDOrB/GSJ5ucFtX+UX1NU+bffLtOvvxX96HiVRjmm63V7ZqzEFdptjAvWqfFY03HpT/DD58w6lwwznYwKzrnPMl92vir+CCO7jBdtBNYviR1IE1+42SDfk5mQKs3AkhEziK2tqIrz7wSEOlLCnVQMTsi6hy4lAhpIaTOmgQs+W8+peIzXj+e/N8fgrQFHmepqUw1dr6n43hCJJopnJQtVBrD7bkkCt0Py5Ah5nQzGyXcBiymuxqeIV9Z4BYpNeUUw+kQzoIEUmNofDA/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(366004)(39860400002)(346002)(8936002)(5660300002)(2906002)(31696002)(478600001)(6916009)(16576012)(6486002)(2616005)(83380400001)(38100700002)(316002)(54906003)(66556008)(186003)(86362001)(8676002)(26005)(31686004)(66476007)(4326008)(956004)(36756003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFhYTWtwZnFkTEMvdlQxSEM3T3dYWXZ0cTFGczlRSzFNY0ZyUE05TElGeDdN?=
 =?utf-8?B?dXUwWUhVbUI4cEFFemVVaFdtTHBEYi9TTkZGQUNXbzFTOE9IRmhjR2orYm9r?=
 =?utf-8?B?bFVSM1JYL3FCOEU1ek5hdDlKUFdQU0tMalAwdDBhNUZnbVhURkNxNWlnZ1NO?=
 =?utf-8?B?YThuN0dWdC8ydk9JSTIvaysva0dtTjA4aTMwcE9Zbm1zMXl3VCtZY2o2UVpN?=
 =?utf-8?B?T25pUzYxUG5NNFlBWUVGMW9aVW5xNjQ2Y2ZMV3FtRVpYOUgyMXFVbnNFUzdp?=
 =?utf-8?B?TUViREV6SjBXUmJTZUxvK0dUU1B0T2pXak1JZGhueUR1bzhuWjlUMDBJT3BY?=
 =?utf-8?B?cGFQYUhORXFRTllHdjRRSkNMRW1BWUg4RE51d3dycWRhT3B6OXA3TDBtcFhF?=
 =?utf-8?B?N0Njd1h2UGsrR2o3ditkZSsra09TRXZ4ekZOeVk1WWREOEZuM1crS1NFTkQ0?=
 =?utf-8?B?WCs5YkpQV2FmWTBqOTc4RzVJc0F5dnlEMHVCbzRrNFBkVk4zTE1VZzYwc3pt?=
 =?utf-8?B?NzRydGdLbHFqS1JwaExTSGIwMFJ3dEFOSk10S1hlQ3pFK1pZdzdWKzRBYkxn?=
 =?utf-8?B?MWp3VVdlc25weGFiam1hU3I1Yy9lRlV4aXNxRDdDbWNMaGJMRVdFRmNwMVJ1?=
 =?utf-8?B?SFc2TTBTWTcxMXNFQk9JSXVJMFJxVnVRVmtNVlVQRE1oZS9yRExyRkp2cUo1?=
 =?utf-8?B?bm9abS9teWdPc1IvNDRVbzFIVHpYTXl6SDg3Y3JHcGZ0VmZxV0l0UnNKMmdU?=
 =?utf-8?B?MEU3c2JJNnhEaFhVYjJsUUlhckNPUWJGVXR4OFpuY3FZN3dOc2ZiMGJwWFJl?=
 =?utf-8?B?OWpLZGs0KzdkbnkxS1BHUFl4QjVtNXVBekdPaXVvblhlbzZUaER0U2phUG9l?=
 =?utf-8?B?NlBpY0szeS9qQWROUUkzd3lxb3VwNzFtSi9CakxSU25EaWo5WE5nZVc4K0l0?=
 =?utf-8?B?T0F0SWN1WkUxWnhtM3FJVzNBTFY3RjBxSjMzQjBMaHk0TUYySk1uZDU2YVZq?=
 =?utf-8?B?WFJxdWx4a3NIVmxlYWx5R09xVG5qMXJrSnZYd1luK0ZTM3hzTzVGSjJnMitm?=
 =?utf-8?B?bGkvY0VON0U3b3JlK2lKTFlHdU1IbzVmTGFVUk4yemxVOXFSRW9FYzAxR25h?=
 =?utf-8?B?MFZ1b1huSlNFWlY2WmZrWUxvYVJJZFZvWWhBaDZGajNobGUxemtOZlBEZVJV?=
 =?utf-8?B?cU5aVXdKR2JyMUprRkw3bk5iYWhTY2JiMElYaUVaNlUrVFcrUkFpOUF6dDlR?=
 =?utf-8?B?TVVJT3RYbEM2d28zOWs4c0IyTC9lZEZxbVBaV1lieGw1UUFCc2p6S3ZuWkla?=
 =?utf-8?B?MS9EVlhDUFk5eDA2eTExTXk5N1c5dDZoWjUxcnZSYjZoNFVEN0tKbWR3UHBM?=
 =?utf-8?B?SlhBOEtJYkh3YUdLZVJFb0sxWkpUQi8xQ1U4MFBQdGY5dFhjbzR0YWlrOTlZ?=
 =?utf-8?B?L3NHSEo1c21zVFVpNE43MGpLYndxcXFEU0JCS2srN2F4bEkrTXVyV2JmcHNl?=
 =?utf-8?B?M1F6ZXorcnUvYXpUTWwxUlcvWVZ0MUZFRUhsZWhJaDNOeHRYeWlpUlgwU1hC?=
 =?utf-8?B?cEhnNnNGNG05VHFLWnM0WFEzVVY2dTBicVNKWU4zTm1mSWZZOXl5bDJ0MG1t?=
 =?utf-8?B?QVUyVjNXb2VzN0NXVkVGWmRaM3o1b0p6Z0xXMkJtZGtBSk1mVVdzd1YrRTMv?=
 =?utf-8?B?dFB3SjQ0SHQxd3Z2SktlY3JFMW1teC9oQ1dFM3UyM21BckRlTGx2WC8zV1l5?=
 =?utf-8?Q?hcqgHkN0xv2Xq30twLcvvesezGzC1nC8Xd1eMOo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce9d0ae-d029-4ac7-589d-08d96d627b84
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 16:06:39.7258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlqGfXZuf3At/oNe3DAFp+/0CHHXS5N1ZEeQrV17B/bJGboOAtFgJZ+AQLTzlo+uKa9yoLrrIprhP/NkkalD2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

The function may fail; it is not correct to indicate "success" in this
case up the call stack. Mark the function must-check to prove all
cases have been caught (and no new ones will get introduced).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In the grant-transfer case it is not really clear to me whether we can
stick to setting GTF_transfer_completed in the error case. Since a guest
may spin-wait for the flag to become set, simply not setting the flag is
not an option either. I was wondering whether we may want to slightly
alter (extend) the ABI and allow for a GTF_transfer_committed ->
GTF_transfer_completed transition (i.e. clearing GTF_transfer_committed
at the same time as setting GTF_transfer_completed).

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2394,7 +2394,7 @@ gnttab_transfer(
         {
             grant_entry_v1_t *sha = &shared_entry_v1(e->grant_table, gop.ref);
 
-            guest_physmap_add_page(e, _gfn(sha->frame), mfn, 0);
+            rc = guest_physmap_add_page(e, _gfn(sha->frame), mfn, 0);
             if ( !paging_mode_translate(e) )
                 sha->frame = mfn_x(mfn);
         }
@@ -2402,7 +2402,7 @@ gnttab_transfer(
         {
             grant_entry_v2_t *sha = &shared_entry_v2(e->grant_table, gop.ref);
 
-            guest_physmap_add_page(e, _gfn(sha->full_page.frame), mfn, 0);
+            rc = guest_physmap_add_page(e, _gfn(sha->full_page.frame), mfn, 0);
             if ( !paging_mode_translate(e) )
                 sha->full_page.frame = mfn_x(mfn);
         }
@@ -2415,7 +2415,7 @@ gnttab_transfer(
 
         rcu_unlock_domain(e);
 
-        gop.status = GNTST_okay;
+        gop.status = rc ? GNTST_general_error : GNTST_okay;
 
     copyback:
         if ( unlikely(__copy_field_to_guest(uop, &gop, status)) )
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -268,7 +268,8 @@ static void populate_physmap(struct memo
                 mfn = page_to_mfn(page);
             }
 
-            guest_physmap_add_page(d, _gfn(gpfn), mfn, a->extent_order);
+            if ( guest_physmap_add_page(d, _gfn(gpfn), mfn, a->extent_order) )
+                goto out;
 
             if ( !paging_mode_translate(d) &&
                  /* Inform the domain of the new page's machine address. */
@@ -765,8 +766,8 @@ static long memory_exchange(XEN_GUEST_HA
             }
 
             mfn = page_to_mfn(page);
-            guest_physmap_add_page(d, _gfn(gpfn), mfn,
-                                   exch.out.extent_order);
+            rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
+                                        exch.out.extent_order) ?: rc;
 
             if ( !paging_mode_translate(d) &&
                  __copy_mfn_to_guest_offset(exch.out.extent_start,
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -307,10 +307,9 @@ int guest_physmap_add_entry(struct domai
                             p2m_type_t t);
 
 /* Untyped version for RAM only, for compatibility */
-static inline int guest_physmap_add_page(struct domain *d,
-                                         gfn_t gfn,
-                                         mfn_t mfn,
-                                         unsigned int page_order)
+static inline int __must_check
+guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                       unsigned int page_order)
 {
     return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
 }
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -583,8 +583,8 @@ int guest_physmap_add_entry(struct domain *d, gfn_t gfn,
                             p2m_type_t t);
 
 /* Untyped version for RAM only, for compatibility and PV. */
-int guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
-                           unsigned int page_order);
+int __must_check guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                                        unsigned int page_order);
 
 /* Set a p2m range as populate-on-demand */
 int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,


