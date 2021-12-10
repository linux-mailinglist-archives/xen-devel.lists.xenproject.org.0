Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D34246FE09
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:40:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243669.421570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcOS-0001Hu-PP; Fri, 10 Dec 2021 09:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243669.421570; Fri, 10 Dec 2021 09:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcOS-0001Ez-LA; Fri, 10 Dec 2021 09:40:44 +0000
Received: by outflank-mailman (input) for mailman id 243669;
 Fri, 10 Dec 2021 09:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvcOR-0001En-BN
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:40:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dbb2004-599d-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 10:40:42 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-PlJ-ZA4CPXOzpmKLfSxNUQ-1; Fri, 10 Dec 2021 10:40:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6670.eurprd04.prod.outlook.com (2603:10a6:803:120::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 09:40:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 09:40:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:20b:310::17) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 09:40:39 +0000
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
X-Inumbo-ID: 3dbb2004-599d-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639129242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ea6giwOa1Pf9wAAzmwlZGs6GybWSd+Ba6eO/po1jxw=;
	b=SgaH0Y0PmO/r7jp2WU9vPIbdILHgv7Tl3d9Q6MG9x/Q7GAEJZODklLZN0MKlMw7v6RdWMy
	v2VTUnzMoBxj554j9XOKMNMygXjYq3dY5hkOKdB8el1YRVu3P8o4y59YiW3VXQDcNeEfK2
	sbGlhLDXhMaSQ0nuMqOuFEpSUNFIuFE=
X-MC-Unique: PlJ-ZA4CPXOzpmKLfSxNUQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfDvS4fYyVHJkG/cFhUOlN/AYsyXcZcoMpCEmszGEOHjtWXe/ukgoU0aFcRLrcheRC69nuEHuL3mL20GxZDF63PyYld9yIYRANWZ1hceuyIo+nko7IPfigwTskO2+nVVsWb7QvQo1RglEKywjiC4Dgv8Hng7jib4SGo10RQRK1iMEmg0HC6cb9vpjezvl4BW3M5ctceoqMjczbhS6p9N/Fk0/rc5dF3+sL/fEsnYkXyjAGsQBiEYxqJAGcWA5S3ZoBRznwPIfWVk08YjgYt34pVgFn+kCxM/dmnERBLZFfjP8xyULjIuDyA5MtB92pOSQlSfAGluFt83ok9GnbEnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ea6giwOa1Pf9wAAzmwlZGs6GybWSd+Ba6eO/po1jxw=;
 b=Bu2GzTWjo4y9TvZg5/rvkVT9NY7M9phaNVfRu/TdQP5jA0kCOiKGvK4I2CyEqySSZ97NYIqQ1CAls5g6R00YxF+N/z5yYdyx/SRq0T7sPFSu2xPRveZ9A4Fqt4AENfphVofZBAAfC6XLvkqWx+2MtiYbuUEC3ucB9UdmbA5VdW2UyeUXxXIMGGhz3BhgxD8rk1jLnNfhCFxXNTiX6JC2CSxLtaO4Pb+YKrHvqofXEPNCcjaXSFRDITMM1xUsSpt6v0mWNeqDOUWOUOOx8DkCnmHLy9nI04bQrUgeapTIjksX63U82+GrfzynJ/XaLuweCaJ+6MaABVt17fw1ckp4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b68ff3a-3c82-f800-4d20-17eded13163a@suse.com>
Date: Fri, 10 Dec 2021 10:40:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 2/2] memory: XENMEM_add_to_physmap (almost) wrapping checks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
In-Reply-To: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89b85327-3fd4-4e29-42d7-08d9bbc1205d
X-MS-TrafficTypeDiagnostic: VE1PR04MB6670:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6670E75CDF0310A3B50CF5ADB3719@VE1PR04MB6670.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1E+N7cW7yLgAvHI2Ekh3YUXY0BzgZo8wt1ivCYQL8JRrHFcBrypjO/0Ac+jgZ6O0KZV+bCJ6S37TcqsBKEDgUX8xZawXUkbqpiQskIvg2c6BD9w6AMFMVTOKs3j2IjMY179eo85OtMBdur32nq3hkB7lFf+htv0s8PA0TwoxXHIYZbASKtMDHVZYkFFkWYhZe6Z8XmdtzMu2G9O0i2StKUbJiJYqXTAGma46oKeHAWovexUTtw2TZe93KzMfl8FF5SdOfF3r4xu+zH7CeN1FeXqcCXF+W1yEkZG2DqOcmLIHP5nMiYaIxEcJx0OjHDqPTs8nbc2QpZBqHS1yJ4WthxLQyx1d/m80gfVfawHa6HL+wUpnu+zHwowfyu9dDOb5qy6x9Iy6iEYty8YzPG/rtaTLCE4wasCwJyv7UOfQ63mAwDS6PROgmcTffYX7vKr819wKaBzzucXf/2+VNE4RuAQ17OIRcGfGqfXy7J00CT79GCvYYNU04PHMMbDZcb9TWPGYivacQaqni+cY+07O/XazF5klR+8RvdIdADewmO1cO6l0IuGUS2cYR9lHqMko8dbvuP0ext4BiOC9yrnuzB39J/+Ts6tMdFNYIyfUHkOmDhEjx7Gt/pCBriGu+BIm+492HEiRUtK2au4IOZsRIJMN2SbXNX9M7MQNFzuXp+uDum3+ePj7+0ADvz/L4hdan+CREWftpSXb17ErLH0w92mfleTS7zn7qTw4BE9yvtsRdSNfD0kvKVETx3Q4vCgv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(31686004)(83380400001)(38100700002)(54906003)(956004)(6486002)(31696002)(6916009)(8936002)(66556008)(2906002)(66476007)(66946007)(86362001)(316002)(4326008)(508600001)(36756003)(5660300002)(8676002)(26005)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW9DUGt1ZGhyL0psd3d6TDlzTjNlRGpyV2xqb20zbWw0NHBYQzBCWUxxR1JB?=
 =?utf-8?B?Sjg4S0xXUndxdm5wWVNaL05Jam1SaTFONGlGRkNwWWQwYzZaV0U1ejlWd2sy?=
 =?utf-8?B?cXpNQ3lBVjEwbXRpWmk1T29VN0FUdzlZZHR0bVl3a01Ka3dBL2dzM01ueW8w?=
 =?utf-8?B?b0hBeGhSTGUzcStxRUhqOElVTE4wV3RxWTRCSVQ1bXJRNFA0NVB5WWtONk0x?=
 =?utf-8?B?VjFEcVFjUHhlaHFQSW9YdlRlbWVTNXhHWUxkbWpzUzd6Y2liaGNOQWVVRmVt?=
 =?utf-8?B?S0pteEczRVhqa2wxZmZ5WUNIU3ptM2VHUzgza3l3M043VG5UZE5HNEd6WGxZ?=
 =?utf-8?B?UlIxenV0MS9USEs1WTE4bXVFc3hIanBBRWZWNmRSbWdLWlFreUpESFdDdXU3?=
 =?utf-8?B?YWFNUzNhZVVZUlcxN3Nhd3pKYU9Rbkxsd3Jsbm1yb0wvcis0Vmx6WjJvTWVE?=
 =?utf-8?B?K3FHNk5NcEttSHpzRTkrVVdUQzZHOGg2eFRHTGhLUC8vVVh4ejhoQlEvV0Vq?=
 =?utf-8?B?UDd2YkcvMS9remM3K0NHQnFhUDdtNEhMRldwTWNBSTVSRGFZczNxZ0hER29I?=
 =?utf-8?B?OUx6Wmk0Y0RjSUgvN0NXOVZmcEFUUlJLUHNuY1VMMkkxUUFPUHVRYVRpbWJZ?=
 =?utf-8?B?R0VReUhobEVvc1hmdXBxN0crTnphbDBCTndJd0VCWGhTTjJKK1VuWWN1ZWx0?=
 =?utf-8?B?bHUvbGhIeW5IZldMamlDMmx2YkdXOGR4ZXJrSllTQXBUVjRhUWRadzNUTUhF?=
 =?utf-8?B?bmtYUXBva090RWNUdnFVM21YU3JweHFtcXBoUVpZd2pBK3JBY3NIemFGL2lv?=
 =?utf-8?B?NmNvUzZwbFZQZmx4M241eVFmYkJoV1JxZnBTdXdTQThLVVU2M1Y0M3FWNmhs?=
 =?utf-8?B?eDhtcFNYWm9aYkFoRXVPUndwY3ZVaXlKM2tZZVdqUzQrWGkyWDFCOWRFY1ZI?=
 =?utf-8?B?NGkwZkhPM0lCaEtmR0FJMi9HSlkrbm03UUVGbGExWTdpMzE4ek9LejA3T2gy?=
 =?utf-8?B?RXBxcHpSS09iN0M1cndHcVdIVWg4d0VvNVRreVF3VzBvQk1VYWxkMUFOejdh?=
 =?utf-8?B?cTRLN0svTEtoVlZFbjRIbW1FNlo0RHczcFY4cDdJK1J4ZW54c0FtbHFZSUhm?=
 =?utf-8?B?b0pHZFppdHJXNzRUbnJtUitZM1I2QjBqaC9GeW5lZ2pqMXBoNWcrRHhsS0xB?=
 =?utf-8?B?dG9ZWVRFMVdReHZhVitXaDNJTHZURXRDaXpEc2s1TytLbTFRSFZiUkIyU1FI?=
 =?utf-8?B?ZURWdUJEWCtxMWdETHJIZ1dEOURRTTF4Z09zaTYwcWVBbFVkSUN6KzBxcGhW?=
 =?utf-8?B?bFQ5TFdtMWJ1a25DMHQ0NkwzVEgxSVRWcDltdkdJc1hnL3FacklERk0rdVUy?=
 =?utf-8?B?N21UTFpHTU5DdTNSOElSZFdtT0RmOUJYazl0SUVHR0VGOGExUU9PK0hwRkoz?=
 =?utf-8?B?YkNScEdlZFlyd3B4SUFuQ0o4Wm15bWpBRDhFR0lNVDBDUmZVZHV2bDJoTUdK?=
 =?utf-8?B?TDRmSDZoTjk3d2FYYTc5V2VMS0RGQ3FnS0NZdm40K0NLQy9lbHpsa0lOVTZW?=
 =?utf-8?B?WG52dDMxM2NmZXV1TFd2eWVWUG1vekZsTjNtYmM3dlRKODUwQmM0WHFFUXBL?=
 =?utf-8?B?WnB5eXlwdVlFMXFxa25HM0hRcFNRcHdFdkhnYkNzTUw2aWM5a0ZqWnBtQXZ6?=
 =?utf-8?B?eWZkZ1E5b29IRitYWm05U2gxMDJCeDdiS2hwcGEwYUJRWW9Zc21LL1RraGI2?=
 =?utf-8?B?WWpBK0RnSDdaYnVQVkpXN3c5VU1kLyt2TmszYTNybm84T0N6dlJ5cXlrUW01?=
 =?utf-8?B?Y3NWWEd2SC9VYVd4WE9IZUlFa2xYd1k0R0dKYkdGMUtFckFKN1o2V1NKSjB3?=
 =?utf-8?B?NXFZL3MxN01TcjNOVXJkQXFtVHdZSlNNZ0xwc3FDQ21jNWlOVGJBSmc2N0pB?=
 =?utf-8?B?S1NJWncyK3JvczlxdzlSYnBHTndsZlhEdEUxRHVhTHJWaXRLZ01uV3JTVHF5?=
 =?utf-8?B?dW5nd1dKWVBtb05jRk01NGRzam1zeEJ0YmFxL0FNOUQxNFV2YlBmWktadk45?=
 =?utf-8?B?Tno1cDJBNzh5a2ZrYjNFY0E4ZTFGQmZVcDFHLzJEa3JteUFhZEs3azZ1UzVX?=
 =?utf-8?B?M0dBc1dJYng0YjBpaXgwK1M1dW82d3FXZU9EL2cyczl2ckl1VHpwT1pSN1k3?=
 =?utf-8?Q?5so9el1oKx2arbyJnj7rcAM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b85327-3fd4-4e29-42d7-08d9bbc1205d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 09:40:39.6600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2Tn/V4T8uEhYbl9GThh3loAnRBPP6zN2uacdche2V6jd1bBp9QxDGEtlmhQ3tCdDhzOhVbaS5AfUTJh55rvOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6670

Determining that behavior is correct (i.e. results in failure) for a
passed in GFN equaling INVALID_GFN is non-trivial. Make this quite a bit
more obvious by checking input in generic code - both for singular
requests to not match the value and for range ones to not pass / wrap
through it.

For Arm similarly make more obvious that no wrapping of MFNs passed
for XENMAPSPACE_dev_mmio and thus to map_dev_mmio_region() can occur:
Drop the "nr" parameter of the function to avoid future callers
appearing which might not themselves check for wrapping. Otherwise
the respective ASSERT() in rangeset_contains_range() could trigger.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Add comment to BUILD_BUG_ON(). Avoid transiently #define-ing _gfn()
    (by way of new prereq patch).

--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1479,7 +1479,7 @@ int xenmem_add_to_physmap_one(
         break;
     }
     case XENMAPSPACE_dev_mmio:
-        rc = map_dev_mmio_region(d, gfn, 1, _mfn(idx));
+        rc = map_dev_mmio_region(d, gfn, _mfn(idx));
         return rc;
 
     default:
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1357,19 +1357,18 @@ int unmap_mmio_regions(struct domain *d,
 
 int map_dev_mmio_region(struct domain *d,
                         gfn_t gfn,
-                        unsigned long nr,
                         mfn_t mfn)
 {
     int res;
 
-    if ( !(nr && iomem_access_permitted(d, mfn_x(mfn), mfn_x(mfn) + nr - 1)) )
+    if ( !iomem_access_permitted(d, mfn_x(mfn), mfn_x(mfn)) )
         return 0;
 
-    res = p2m_insert_mapping(d, gfn, nr, mfn, p2m_mmio_direct_c);
+    res = p2m_insert_mapping(d, gfn, 1, mfn, p2m_mmio_direct_c);
     if ( res < 0 )
     {
-        printk(XENLOG_G_ERR "Unable to map MFNs [%#"PRI_mfn" - %#"PRI_mfn" in Dom%d\n",
-               mfn_x(mfn), mfn_x(mfn) + nr - 1, d->domain_id);
+        printk(XENLOG_G_ERR "Unable to map MFN %#"PRI_mfn" in %pd\n",
+               mfn_x(mfn), d);
         return res;
     }
 
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4150,7 +4150,10 @@ int gnttab_map_frame(struct domain *d, u
     bool status = false;
 
     if ( gfn_eq(gfn, INVALID_GFN) )
+    {
+        ASSERT_UNREACHABLE();
         return -EINVAL;
+    }
 
     grant_write_lock(gt);
 
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -832,6 +832,9 @@ int xenmem_add_to_physmap(struct domain
         return -EACCES;
     }
 
+    if ( gfn_eq(_gfn(xatp->gpfn), INVALID_GFN) )
+        return -EINVAL;
+
     if ( xatp->space == XENMAPSPACE_gmfn_foreign )
         extra.foreign_domid = DOMID_INVALID;
 
@@ -842,6 +845,18 @@ int xenmem_add_to_physmap(struct domain
     if ( xatp->size < start )
         return -EILSEQ;
 
+    if ( xatp->gpfn + xatp->size < xatp->gpfn ||
+         xatp->idx + xatp->size < xatp->idx )
+    {
+        /*
+         * Make sure INVALID_GFN is the highest representable value, i.e.
+         * guaranteeing that it won't fall in the middle of the
+         * [xatp->gpfn, xatp->gpfn + xatp->size) range checked above.
+         */
+        BUILD_BUG_ON(INVALID_GFN_RAW + 1);
+        return -EOVERFLOW;
+    }
+
     xatp->idx += start;
     xatp->gpfn += start;
     xatp->size -= start;
@@ -962,6 +977,9 @@ static int xenmem_add_to_physmap_batch(s
                                                extent, 1)) )
             return -EFAULT;
 
+        if ( gfn_eq(_gfn(gpfn), INVALID_GFN) )
+            return -EINVAL;
+
         rc = xenmem_add_to_physmap_one(d, xatpb->space, extra,
                                        idx, _gfn(gpfn));
 
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -297,7 +297,6 @@ int unmap_regions_p2mt(struct domain *d,
 
 int map_dev_mmio_region(struct domain *d,
                         gfn_t gfn,
-                        unsigned long nr,
                         mfn_t mfn);
 
 int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,


