Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A444084E0
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 08:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185445.334104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPffZ-0001rN-6S; Mon, 13 Sep 2021 06:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185445.334104; Mon, 13 Sep 2021 06:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPffZ-0001pY-2f; Mon, 13 Sep 2021 06:42:21 +0000
Received: by outflank-mailman (input) for mailman id 185445;
 Mon, 13 Sep 2021 06:42:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPffX-0001ny-Qp
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 06:42:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd354e6e-145d-11ec-b39f-12813bfff9fa;
 Mon, 13 Sep 2021 06:42:18 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-IrOzGsbqOBylWK6V0Rmh3Q-1; Mon, 13 Sep 2021 08:42:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 06:42:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 06:42:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0105.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 06:42:15 +0000
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
X-Inumbo-ID: bd354e6e-145d-11ec-b39f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631515337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jcfr1R3ZTk9xcTyx2ZmFzXxoyWuNXyzsEsD8IfnCYTQ=;
	b=VnIB3r42XQd/nrA+WDjH2ILzlQAFc9h0EabwfzYd4RZW1+lqZgZHmqR/SSEpAAqY2FJVUL
	TLrpQQql2BKP7FuU4rWzQbv0sR1m9MU98LRQ87BKq1mXZpZdNIS3Vk597gUEBNF+gD/OZU
	4Ftf4fEeTzR/Y/RUF3lJQcAOiM74OoE=
X-MC-Unique: IrOzGsbqOBylWK6V0Rmh3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ey9Q/M4xw1SsoZFU7rqGpIu74hkiHzYncwtIGV6lcJO413zg1IqqHe34Gq2bCBJl7YjxLBTIocgIa4xZlJ85HI+uMoBiyxkELKhz6eqvsSHUVKme0kSTJO4qrE0O1R26GaT33+x50QPzdQCvDSCiIPJk7kxeRjs/qkMGb6ix+Cz2j9usS4eUqeBfk0lvF2fKQNfwZSyOLE9rOfSNYSHhOJPHroRZZeGfKVA8ESyAZH7pGt0DBcUzbmDRVo7HYrCE7ZIIoGmH6MiK6kxsS1QU45vs17DPDxtdCvj0Wa33DVKSToVWlBxh0vVEKwBm3F679tBw3iRpcYAsqQyCWr1dNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Jcfr1R3ZTk9xcTyx2ZmFzXxoyWuNXyzsEsD8IfnCYTQ=;
 b=Cr8XYmplnDsGWeXAFCLE01qsRyzY4bppSSTmvBqgKo66tw3FpILNPtLYNTlJinL4DMdrlP7RCdHI7o9hCANFn+pqH0+Z/vjDeD8WxMPUtE5EvxbaUoORHz43pTtAeFMVvgw57GXi/Sf8eTdmbUHlm7Z45SIXvd3UpsEF7pUtK3uiolKJLCexl56bSjuCvGPqrdIcVo4Ykxys75MufBrOsYQxY+vTEVQNzW625qf63yrC0V4vp5yeC59Br2nuc7J8+MRhCm7pIjy99TnD/sQ1UuRt2hQF6RdfiM85F1Incvz9VfGJ4cJp6lc4susWiIRHDsufprXYl6wB56XHC5TEvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/2] memory: XENMEM_add_to_physmap (almost) wrapping checks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
Message-ID: <f78f8a30-39b7-cec2-2af0-27ebab28cedd@suse.com>
Date: Mon, 13 Sep 2021 08:42:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0105.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a225497-28c2-4a34-0534-08d976819ffe
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63826240144E30F50C905B19B3D99@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JAy0p4iTe3qylm7NbvDj3KLDkqfMeAim9mH9Ww4GGc56ngkyGGyLFhlVc5OMniLxhS62Im6//UGnFLblHmfERAuBXSDbt49zgPY+EpMrZJ12UFts/xx48rxkREFR60EsluVeEzByqiov7YjmKMqTmvyXvEylOqms65UK6ruxqVebcv9EBV+NopnFqYx+DnB7abGZMm+Do45qpPuiiwsuM1PKyIzYQmnZRHKr51mdLaAYG4191w4ts5KkPVtbMzX90bq01GFqa6smdeTTl7tdfnMLQlVrWNhLm16enoLFGn0gkpTw58/TJcHjoojLLuCsgeHpsdQXXnKflB+0Wy2+vv+ZFhf21gKblLWBpWJP+Y+JGPC9z/2PqmuRuKb/XzHrvthCL1VgBo7ZoTw6yhq/JuuDBjSO4rLjbgplcbRNVYBmfaUU4ZNtmsuUzFs5KENqjTNuGzNj1ZwwCZG3ksIQkeLAk6SogMa1NcHesGBpnlmA25+Zbq4KH1i4UMBNiWJ/m+JjispyilDghgLIpnomkqnrLW2LYiezy0dOHJjTmBpOrvWPKsxKVKD2mK4a2XZXNG1MhSrNEJ5Sgk3RqD8CndIudotKLjZ5EB1FTr5k/WNVF93QUFwIdpWevKJp9fS+s5Qomk8fygTim17Yy4Li/Y/2RXPmA8xknzMzzawBU3RSnnWR2FZrYqN9XMdV5eY+htKsFMYXlhu52eFO46HBLvhsJJJNKfixVbhZit9DcpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(366004)(136003)(39860400002)(83380400001)(86362001)(26005)(8676002)(2616005)(956004)(316002)(2906002)(16576012)(5660300002)(6486002)(186003)(4326008)(66476007)(478600001)(6916009)(54906003)(66946007)(31696002)(36756003)(8936002)(38100700002)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2VTajZvSkpvWngxWmlwTTM4azY3dUVUZVNCVm9xcGxtcDh2eDBVR291OWh3?=
 =?utf-8?B?QzAyVERESkIyTDJNd1MyWW9CeTN0M1ZjR3RxV0srdk9DcGs0M3BOQlFRWjBk?=
 =?utf-8?B?UVVXYTF3QmVESW5ma2ZSbi9XVDNCQ0drVmJBT3JRRGRrWVFNdnhiR2FJdy8v?=
 =?utf-8?B?bW9icEh3THRYVGhSMWtZR2c2SU1pdzdYYXZ3aTkvRmtkbmcrK1hoekQ3Njdx?=
 =?utf-8?B?OXZtZGNkaHlyUWZ5RWYvT2dKbktWWUUvVWxVTTNwcDV2eWllWGFjcU5YcXFT?=
 =?utf-8?B?Rzc4YkFGYWtMeHcxWW85MHNhY0o5ZkNqT1E2RHczbUxUMFdZeC9ISnh0QnRN?=
 =?utf-8?B?WUN2NGc0cjAwTmp5YU80dmJnNVRLZjg3TUlETEQ1Nlg3MnJERGVOS2hrYTF3?=
 =?utf-8?B?THM2N1JDNUJBZ0ZPUjF2aGcrY1RYVWVZdTVZVWtPeHdTU1RJVWd1RXFCTDNa?=
 =?utf-8?B?U084cE5MdmxTb2szcy9CSlVOMkVJODZXaHBId1ArWm5aK20zeXZhR3VXYWZv?=
 =?utf-8?B?RjcwVEViYWU1TnBXbTM4NHJVc3c2MjhYQVAwdlNiT3hqVGxXUjBmSFkwV0Mv?=
 =?utf-8?B?MUJ1WGNabllESGpscW9mUU4wV2ZCWktuQTE5ZzZJdGtIanZ6a0szQUhzOGUy?=
 =?utf-8?B?cW5Yc2x2TU5OMXFmVE8zb29oYzQ0dHgxU2xTbEdHUDNRbFFCL09Ga3hwVU5L?=
 =?utf-8?B?eVU0WThIOUZWeThZMDBzSHpSK200Nzg0dE9BTERaR2QwTDJKQW1hUDQ2b0pr?=
 =?utf-8?B?VFFPQ0VTVVltczdBbjdvQlFRelg4T00yVmFJL3g1bGlDeitUYWg5OXJvTEhM?=
 =?utf-8?B?ZFVFNHhCamp3SEpPS1YrOVhuK3UzVFRacVEyR1grVnZCWHU5SzNkQk5EV0F4?=
 =?utf-8?B?aldGWm5XTEtScTArUUI2cjlYdmRaS2V4Y3hTNmJ0SG1TN2ZYdURMUm1ZSXk3?=
 =?utf-8?B?ekhuU3NvNCtkdzlpcXpuaitnZVFkcWpsejVabUdtQ1pHa1UzUERpRHQrZE5m?=
 =?utf-8?B?ZjdqQUZWT3YxL2FhQk1qNHQyZHliUzBveThCWWczS3BzRWpQeURjRjg4eUdy?=
 =?utf-8?B?dTNMZjJ2VmR3dmR4bWVYYjRoNlZIL2dOa0FvV2hEcE40N3VSQy9IM1JaZ2Yw?=
 =?utf-8?B?NkM2d251UzRyS0FzLzNUYXZVZkE3Sm13OTlDUngvOVpwUFVuYUpYUjJFdEYz?=
 =?utf-8?B?TkVibmxqMUY4UzlQK1drQ3N5c3NtY2FXbTR0WVFUNmlJV2tkbnlCSEVJdE5O?=
 =?utf-8?B?MnlkMWdJdy9hcnBuQ3NLbmV6cFR2eGMzRmsxYlhoNFFDYVk1RlFVNnVvL0hp?=
 =?utf-8?B?VFBTRzNCOTN0aE5QMmd0THRxdWk2dFdqZWsrOFRreHQxN01pM0FDelJNNWIx?=
 =?utf-8?B?ZGtEdTR6TE9QSml1Sk1NaFVmNnpWTmtrTng2Nk9iVitJbHRlUlUvWWhCcm9W?=
 =?utf-8?B?SnVpUlp4ZlRCMU5UcEd5bDREei84eERLOUliWkxNMWF0ZWZhS1d4azZ2cERY?=
 =?utf-8?B?MEdtOGhrMGdiaDJZcitPTGhydlQrMTIwS0xIWFJUTmRwcEhFeG5PeHNzYXNN?=
 =?utf-8?B?NVJXdnBtbXg5MnBITmYzVHh6RnVoM0FhSDM4bWFHWkU1ejhRYTlGdmFrU0x5?=
 =?utf-8?B?RHZZNEtwdEhxclN4bi8xNGg0Z2lkaElZTWM5a0x0clpLMEpzYjB3U0pvRzIx?=
 =?utf-8?B?Yk4rTytPVFc2MnJaenkrcEtJdlYvbFFRYnpxNG82M0tpU3RYa0d2USt2WVN3?=
 =?utf-8?Q?TL4S5RyeEGHAAP4tONF1wRzzZVNKhDsNAtoRsie?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a225497-28c2-4a34-0534-08d976819ffe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 06:42:15.7429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3RYP+X/IZDY7ViNOig3luQVghlEVX8C45yvn/rjr55bDFBH9l4yyiVuFVrs3QL7/3z7qOPshP3Lnvfsf3ccmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382

Determining that behavior is correct (i.e. results in failure) for a
passed in GFN equaling INVALID_GFN is non-trivial. Make this quite a
bit more obvious by checking input in generic code - both for singular
requests to not match the value and for range ones to not pass / wrap
through it.

For Arm similarly make more obvious that no wrapping of MFNs passed
for XENMAPSPACE_dev_mmio and thus to map_dev_mmio_region() can occur:
Drop the "nr" parameter of the function to avoid future callers
appearing which might not themselves check for wrapping. Otherwise
the respective ASSERT() in rangeset_contains_range() could trigger.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I find it odd that map_dev_mmio_region() returns success upon
iomem_access_permitted() indicating failure - is this really intended?
As per commit 102984bb1987 introducing it this also was added for ACPI
only - any reason XENMAPSPACE_dev_mmio isn't restricted to CONFIG_ACPI
builds?

I'd be happy to take suggestions towards avoiding the need to #define
_gfn() around the BUILD_BUG_ON() being added. I couldn't think of
anything prettier.

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
@@ -1360,19 +1360,18 @@ int unmap_mmio_regions(struct domain *d,
 
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
@@ -4132,7 +4132,10 @@ int gnttab_map_frame(struct domain *d, u
     bool status = false;
 
     if ( gfn_eq(gfn, INVALID_GFN) )
+    {
+        ASSERT_UNREACHABLE();
         return -EINVAL;
+    }
 
     grant_write_lock(gt);
 
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -831,6 +831,9 @@ int xenmem_add_to_physmap(struct domain
         return -EACCES;
     }
 
+    if ( gfn_eq(_gfn(xatp->gpfn), INVALID_GFN) )
+        return -EINVAL;
+
     if ( xatp->space == XENMAPSPACE_gmfn_foreign )
         extra.foreign_domid = DOMID_INVALID;
 
@@ -841,6 +844,15 @@ int xenmem_add_to_physmap(struct domain
     if ( xatp->size < start )
         return -EILSEQ;
 
+    if ( xatp->gpfn + xatp->size < xatp->gpfn ||
+         xatp->idx + xatp->size < xatp->idx )
+    {
+#define _gfn(x) (x)
+        BUILD_BUG_ON(INVALID_GFN + 1);
+#undef _gfn
+        return -EOVERFLOW;
+    }
+
     xatp->idx += start;
     xatp->gpfn += start;
     xatp->size -= start;
@@ -961,6 +973,9 @@ static int xenmem_add_to_physmap_batch(s
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
 
 int guest_physmap_add_entry(struct domain *d,


