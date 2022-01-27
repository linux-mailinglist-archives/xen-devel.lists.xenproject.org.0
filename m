Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13FA49E534
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 15:53:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261517.452909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD69J-0007Rw-UI; Thu, 27 Jan 2022 14:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261517.452909; Thu, 27 Jan 2022 14:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD69J-0007Ps-Qm; Thu, 27 Jan 2022 14:53:21 +0000
Received: by outflank-mailman (input) for mailman id 261517;
 Thu, 27 Jan 2022 14:53:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD69H-0007Pl-O2
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 14:53:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd00e2ba-7f80-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 15:53:18 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-g4NHsuWsO-GdL_7x8tglEQ-1; Thu, 27 Jan 2022 15:53:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB7191.eurprd04.prod.outlook.com (2603:10a6:20b:11c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 14:53:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 14:53:15 +0000
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
X-Inumbo-ID: dd00e2ba-7f80-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643295198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QXqEOApuhNTDDOQi+0lYzxh9XjWyCRDTmsHjLzOzlRQ=;
	b=WMSI0U155lKdxaBfWu9F1rVcGoiu3C+e3htPSk65+UecLk2c0pYMsmkSQvkHpvhY3BKzwr
	NcUmDM6ATCaGJUv9Ykl99W5lHFGIwxFoTkhVLdxBhb/GbCtS3IUaJspO3YUyT3ZQ7cAirO
	ZNU1a8BlR1+s/mJmlNRTzO+fVaz78HQ=
X-MC-Unique: g4NHsuWsO-GdL_7x8tglEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlMd7QR8LotlPDEZtBvNkAoSmvfO0Hmt6s9M2XKuZOETYTkkKXKIchc5loDRiOduejHZLnNQWB/HjJdjKtiZbjHRt79rrEHvN9miMvUNAEUcLDikSFRG8GuFl1pkd4MXE/Mh81m+tACMGUBueQrsv2w3+f+40vzlyMkT9/NoIKDolasaB7rfwtuq7k86JCm+gRFhs9HMTVpji11/jm7TEd1tzUrcJB+YGoKzqAZcIDfs+qO17zZFPnsVEK0jgFFTvOvYdJD3/v7+JEM2OcE1r9EzDu6phiOBr7uXldjLGlUHVCrhm5axM3dPHNJut+QamQtJO5JJj5zly+s3t1EWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXqEOApuhNTDDOQi+0lYzxh9XjWyCRDTmsHjLzOzlRQ=;
 b=nJ2Tt5GZYKUxWb1udCTqOYyglaCa1M7/U7dPoML/hNUAPnZHLKqa7nDAX1XL2tPpAKd20QjTsWcBnyylrJaWwyh9K91zY7CITBsleuCaNLhrHvVdHc1uqoJyhOOmTVTZd3zeccAVe8fY0uRWchmdo2ui28V8wqY5nUdDD/rZ166st819s3Ez4C1Gf8diBj0f7OdZdC8T9pGrJgu2D881oD0l6o3wWVJdGCsrHdbsL908RpIdF6qTYOSaPaGqd1VQpwrLUoAv9kATDX6eR6fTnnvVFkKN3iRLPiKVr4y7mJ7n4KB54sWEbX8QqXqCGdSUt6sO1spEU1Q+iGqlJ5uBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c2606525-5d1b-c410-d750-1372334c4c7b@suse.com>
Date: Thu, 27 Jan 2022 15:53:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] memory: XENMEM_add_to_physmap (almost) wrapping checks
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
Content-Language: en-US
In-Reply-To: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0100.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faba302d-b965-41a4-03f4-08d9e1a4bf87
X-MS-TrafficTypeDiagnostic: AM7PR04MB7191:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB7191FB18ADB1089406905D4CB3219@AM7PR04MB7191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PKFxfMyGaZHIDUODd5fDwzV3OSJpuz/zfubEYlSpK556cqyClbWXx7Y4nLNJ/gwFMXsLqck/VUZdrOENyETt6NTgTa7Q2yEqY6DUqsqTRPRcp4+RruoQq2z7eGyr4uwchgpw0fMsyCanfEI2LHd1KSTkBLKKGDT3RPBNXD/itomae71qo7qXLmn/St5yALrHOedKo63mQdbgsH3sswV2gdxePFxODxkeaqmsx2Ah5nBgWDKkth3HCkuRFVUMx70UQftbKc/CeFzpuZYpvMae6a4R1XtYZHuUyz/l4+pcR3RdvBAemEO7VsHF8G6jmS0PNAWudim89MuBOvwlvMNwPOqgP9T33yv30X3pIbaqYMFKw56KRVBA9dcb/JeDKPEhAQ7T4I98SoNnLb2xQDv1mV/vqzEtxOjNeBnA7lE8YJ3A+UrI47qVx1QiOl/idL0JB+DEttpqF9EGfDvLnjVbKbIe1gqrAriShvqzkWMi/8zdeDezAPU5Mmh3hc8dGZvvm0SkFLFwXVDnOwgVNIgFVOtFGI3PhmgXvC/znf2xxli/NFIb9XKMjjt05oUpKYBSWxRI5iLjK65QyUNFz5lFDFl0awUHQGGK6wKYxcYIUEjualSezuVYi2XgZ8X9TRzTrkRo/BYagmfLJBzLjgxrjUHEQLS6clOz03yg9cA31wO/+aUGlCaJdUnvE7EF/u6nXm3vDEfFzBfNnycTClrFgg3GlOXCAm/G0UN4eqnqhGDLmfx/RVT/Pxs3Q21xOQCM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(6486002)(6916009)(316002)(508600001)(2616005)(54906003)(36756003)(31686004)(186003)(26005)(8936002)(5660300002)(66946007)(66556008)(31696002)(4326008)(6506007)(8676002)(6512007)(66476007)(38100700002)(86362001)(2906002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHFla3JteEJZQjVWYU84LzJvS0Y2cjhQUURZMmVUcDVYNUpaQUREQTE2TVhD?=
 =?utf-8?B?V2U1ckV0b3FWSCs2RlJEa25PVDZxejBYclB0MzV4SEROazBBWXhBdDUvNlBZ?=
 =?utf-8?B?cjAvZkxmTzhXSmNkcm9nYU9LSW9yYjIrSnhUMW1PUDhBdmRSdUJCUmROVUxI?=
 =?utf-8?B?dUpCYnRBaEMway9YUkRoTXNHV0NPdXppNnlxTlhtbmJkWTl6eTc3ZXlVanhW?=
 =?utf-8?B?ZEJLMExPeXJJSDRIVWE0ZHk0NnhkYVdWSzZTc2RselN3YWJSQ1JVN05RYlhN?=
 =?utf-8?B?ZG1hTzF1cFJJcnMwUUI0RU9hOE40QzRxb2JKNXBjWnhiWTRGUnF2VzFvNHVy?=
 =?utf-8?B?RXdoQnpFdjRmenlsMm9sS0ZaaEI1ZVhDYTJFSTVrL2FWK21FcFYwb3IxcEpK?=
 =?utf-8?B?Nlc1VGlRVXVHYmtxYVNFUkpwSmtJUGZ0RGRQMHY1L3N5OUdESEZOVUJXajZP?=
 =?utf-8?B?c3N5VXM2alcySm96bzNRY0FlaEpwK3E3OFllZ0Fsa2N3d3pkcGdKeTFRMWxB?=
 =?utf-8?B?Ky9nWUJoVlkzcEZCbmUvcUFMVGR2ZWYzZFVvVGFiYXE5WmtIVVJINTVzVGVJ?=
 =?utf-8?B?Mk5zeUNJRlVZSkdVVjJjQlBrQ3B0dEVpRVBXdWNqbjJwS0cyNWw2OVVpNEc0?=
 =?utf-8?B?RDJwOUVVV01VYVdqM1pBbUdWbkZOSEg3blBIMWN6eU9lUG9BWUl1S3ZhZkhr?=
 =?utf-8?B?YXZEcGtOT0R6UzdiVk95cGZwRklpV281TkdwVkJQS0c3SkMvc1huMTV2Zm5G?=
 =?utf-8?B?cWR1NzBLc0UvM24xYnRCeGt5eVQ5WVNKZVFzbStQVEk4YW9MTy9wNXl3REFr?=
 =?utf-8?B?Sk9Mb0FhNGdpa1QvU0gwZ2JzUDUvN1g4R1dqaHdZaGtvZG9ENzB5TG00WW9Q?=
 =?utf-8?B?bzcxQkNtMlBNWXVGSTFMc29PVnBhZ3NxMlkyVGVkV2Ewdmh5a2ZPcHVFTFZy?=
 =?utf-8?B?R3ZJblZvOTNmQSs4anZVeThWNUM2WkoyNWJ2bFJHYkpGUGltY0lEcWg0aUY3?=
 =?utf-8?B?MEQ3c3FxQm1GclNJblRJM20zYVBhZ1dLNUNKRDRDekdMTHU2bFc5cmhQcUdX?=
 =?utf-8?B?WFlVcGVhdVpZY0hrZ1hpL3VacWJPdHBpYWd6WlgxMUFkWXNwOEdXMk5yNHFD?=
 =?utf-8?B?SEhUY1cxWlljcWhEM3FXVDZ5NVBEbFJJa1EzTGdwY0hqdEY2Z2NmTFRGSTky?=
 =?utf-8?B?bkJJYy94YWtOL3A1eEZueXhHSzlvQ2dHcUFOdG96MDlad3RFTFZ0elJhQ2cr?=
 =?utf-8?B?d1lnY3MvdFRmNmdnSy9kSngwWEpsaUVEbHJLMHBadFFOYlNKME1pYlRlcVVQ?=
 =?utf-8?B?b1NJRGY3aU1nVi9DR050ODcxZnJTM0NRWk9JQ0luL0orRGVSZFpqZ2Z3VTVp?=
 =?utf-8?B?aWE3ZUoyZGV4NUV1N1crVC92ZXRURS9OVTBoZndQY1BXNzN2OEVFVVJsanJQ?=
 =?utf-8?B?UlF0KzhUSWhNTW9Da1M3SGdDcE8zR3VWQk9icy9zSFJXNmZpUnFCbXdqTTZ0?=
 =?utf-8?B?Y2gwZGJSTnBwTlNwM3NoUmdLYnJobjN0eWxJYmg2RDYvbVQvSDByenVwRDha?=
 =?utf-8?B?VDFvWUIyTC9ad2ZNWjByRDVsb1BodXlqalNjNFFWOVRwNno0TmpVQ0I0U0s3?=
 =?utf-8?B?VVYvWjRzTzVNUEFsYWY4c0ZGQVYxeVg2ZVRFd3Y2bzNRZS9jbzl3N0doQWRz?=
 =?utf-8?B?bGcwZmJReVlJRnpMMDVDVCtVd0J1SXVmZHZEMUlpQ1hnV2xTcS8vdFVrNlBH?=
 =?utf-8?B?RzdSS2FXUDBUNi9mazZDMmdFS3BkeTc0cTdaczBBZ2FGMWp4Y1BGU3l0aEdB?=
 =?utf-8?B?VEFkOG8ySmo5ZFI5MnFJVktQT2ZPNWl0ZTdhSFM2cXlaNXF3YlB4M1M0dkMz?=
 =?utf-8?B?dGl6KzlpdGJ2TnNFYWJjbEtBY3FkdEN4SHJSZ1lleTc3bjg0cXpualUzUlEz?=
 =?utf-8?B?RXdyQVY5blBQa2NGSDkwaW9PRy9ZR3BFSWQ4VE9UYWVDdmNGVkJuc0RTWTU1?=
 =?utf-8?B?WFZBSEJubms3akdoeW5wZzBZY1VWZTZnWXhBY0krMFBiclpMVUFodnVJci9C?=
 =?utf-8?B?MUxrS0JKRTExTWU0RDlOME50ajlyRWFPSGxnQlVrZnNJdE5JQkF5TSt4Z2x5?=
 =?utf-8?B?S01xWnNzQkJ0d2NibkdUdzRsT1A3aE9raS9ISUg5ck15d2o2d0NleUoyNlM2?=
 =?utf-8?Q?+LCVTmvijOYTMaWOopSBBrk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faba302d-b965-41a4-03f4-08d9e1a4bf87
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:53:15.5224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXPnw8rmJRQV2xmnYrJAFJoEKGE5ytQWGVGDAlGXH4s1r1BEmZu7tKY+kgJnuTr6u55CYmsN72SPepqncbElKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7191

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
v3: Rename function to map_dev_mmio_page().
v2: Add comment to BUILD_BUG_ON(). Avoid transiently #define-ing _gfn()
    (by way of new prereq patch).

--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1479,7 +1479,7 @@ int xenmem_add_to_physmap_one(
         break;
     }
     case XENMAPSPACE_dev_mmio:
-        rc = map_dev_mmio_region(d, gfn, 1, _mfn(idx));
+        rc = map_dev_mmio_page(d, gfn, _mfn(idx));
         return rc;
 
     default:
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1355,21 +1355,18 @@ int unmap_mmio_regions(struct domain *d,
     return p2m_remove_mapping(d, start_gfn, nr, mfn);
 }
 
-int map_dev_mmio_region(struct domain *d,
-                        gfn_t gfn,
-                        unsigned long nr,
-                        mfn_t mfn)
+int map_dev_mmio_page(struct domain *d, gfn_t gfn, mfn_t mfn)
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
@@ -4157,7 +4157,10 @@ int gnttab_map_frame(struct domain *d, u
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
 
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -295,10 +295,7 @@ int unmap_regions_p2mt(struct domain *d,
                        unsigned long nr,
                        mfn_t mfn);
 
-int map_dev_mmio_region(struct domain *d,
-                        gfn_t gfn,
-                        unsigned long nr,
-                        mfn_t mfn);
+int map_dev_mmio_page(struct domain *d, gfn_t gfn, mfn_t mfn);
 
 int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
                        mfn_t mfn, p2m_type_t t);


