Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F08C483F4B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 10:41:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253095.434123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gJu-0001UO-5F; Tue, 04 Jan 2022 09:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253095.434123; Tue, 04 Jan 2022 09:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gJu-0001SS-1Y; Tue, 04 Jan 2022 09:41:30 +0000
Received: by outflank-mailman (input) for mailman id 253095;
 Tue, 04 Jan 2022 09:41:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4gJr-0001SI-Ot
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 09:41:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c49bdb8-6d42-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 10:41:26 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-t8tH_XaUN4mWVjzq58toQQ-1; Tue, 04 Jan 2022 10:41:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Tue, 4 Jan
 2022 09:41:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:41:24 +0000
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
X-Inumbo-ID: 7c49bdb8-6d42-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641289286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H5dgdFi5lZ4igKvqS/wOHJKgdrw1TKxZCXD4+d9UN1E=;
	b=QfN7ZhfCICs+EMEzc0xPdlNr76PSKADuoxJTqcH9LuoYTg5L2LG9vLRRuadWr+wqN6J0cw
	omVU03y6L++lqJA9QenKOdZ8sKNqUoijljIAyxYHPs2jKwPC1T1hKzIW92+1K3PuS3AVuL
	c5nFK/CBPjBq4AFKmNg0cz8B2IDDB5c=
X-MC-Unique: t8tH_XaUN4mWVjzq58toQQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjpfgNZAFwClw8owTnLgK7jgRgMP/esKCbXMei3E0MVBP5zVSMPvtK8ws/7i/HtwoNJOgikkn9gZ5dGhMPtsbJWlTZFxzkgnEFSpz4HhQvof1tWv1VrzjFbscEvsjILWYwN05EDhwIWKxvFyQhepeL0ditApYmiQJGqSIhMUz8K9vR4OkM4XWx+dv51FcGj5KL9el5gq7QZg7h904sXP6kkU0VDeJZ6Fp2vq8+8YIuQO3+xqP1Un7YxRrc3D51UfDJWmND8tVbCBhmSChM9qX9ErnLzekxsvXzGhIv6bcopK+JoEjcfzobReirC7C10WQmUtgSHdDwFMdNmJC2cDiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5dgdFi5lZ4igKvqS/wOHJKgdrw1TKxZCXD4+d9UN1E=;
 b=Jg7ap+jwMH5uEFrnN18oBPGfnUrvZC3dMdednX4zDo4nvzXkMHX1BMaxC7Fy9eztmIR0T7WY9sajmduBuL6+KVmUy8tDCtle21u594JoMTZLV1bkG+DlrRpm8bK/GBoAwPKQYnlskrVOheP0rErl9A08dFq6ruOH5ejUQUZ13ZUBwC/zddzYcV4anh6rED/bo+ADycgOG5WmJSIRlOOYcLDygCX42OK44OnphLXpSopyUGR4IBNzplJeGiCDMjpuHUGLLIwYesUSVYkXqUG6J64xPx9TxM7DtNGFCf9o0ffs3RONMQVaVPUJkYlTeiF3trr3/eUnKYSrbpGEa6JopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
Date: Tue, 4 Jan 2022 10:41:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 1/2] IOMMU/x86: disallow device assignment to PoD guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
In-Reply-To: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 142dd462-b5af-4479-ec31-08d9cf665f10
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB339093172DCF9A50D62CA25BB34A9@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0QoZVl2disA7kuMUEAPf9u1fyzUzPrwF4cB8NaiD84pwXQAAMeuTI34uP3roK82RGj2dcUcx6lAKRZBCPbOOfiyeuNpvbNMC5Hk32+2aFYPMWHuT0G06tUuFfkG8r94EQeB7JnZ1iPihghbmvL9RHiJxEOLN+9N5Dbdpu8awSFli5ealj+EmDiWi8iLU6BWduEdyPch5bXNuDn0bOllWvbdsEmorRExNVbQEKG6cI9ozo8Ailb5V8dhFyaOViVXIaCzDlmhh8aED0zsFih6aVgkaEB1RmY4w9/AQdSWmtUmQATmaXyyoj8Fh4BFTRNgHrcIqoeGYpMS1nok6vd8KrCjHPMLawB1bXfhdHt2V5jSOz26qJw8dLTL81xjTbZb87Dt2WZLkqS31bTmATOQA63DaBaC1ZyOffucq7/XaIlI6rkW+x4nQLX8dDMPnNWs0gp5AUVf3EVqx9UMxT6KektywsBrkvUIWNDAoUBy4vPKiclg7kmiil+OiTtjflsPGtW/vLRABwt/w3FfcVNZ3wv+7Ur+mvfTWJ+vBFLwCHG/RAw+FUGk6dx6vjZZ9c+Q+4jKdaAGdd7uB/yqjuzyHZj6mTASlXfhUsS9I7HynVY02L7g28q6H7QtWn1w9RJEcy6OBsGvID8f1ZN9xDEOY1ebbuxPJkfAYCD97qWKSF5NSJQLJzY8N3+OHmNbqxa4CdfuHz5BfV47JR4ODXTsMvW9GvyXN9F6t79SXtnuYgP1WrEoootVBLbiotXZ5h+pD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(36756003)(6666004)(31696002)(86362001)(66556008)(54906003)(38100700002)(8676002)(31686004)(26005)(6486002)(6916009)(66946007)(6512007)(4326008)(2906002)(316002)(508600001)(66476007)(6506007)(5660300002)(8936002)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGphMlJnT201bXZXak4vQmZuMGRnbWdXamFQL1MyZ0tNNjFObmZ5M0NrVG9I?=
 =?utf-8?B?blY2cXlrMGRpM2pGOHVSSnhkWTBJVnhSdEt6Q3dsMDNQUk1lTHJVQWJsYUhk?=
 =?utf-8?B?VmJPNTNLbml0OHUxSzcrbUgxQkRQL093aXJpWCs2VjZrMmlBa0NTRGJORXMr?=
 =?utf-8?B?TjBTQWk5N2VsMHdsNlhKdUw2K2IycjFDbi82ZHNNTmdob1cyaEx5ZUFuNm91?=
 =?utf-8?B?QXVkK0pVWEJEU3h3enJVeU93cXl3MmMxSHhsNUx3RHlRL0JHVjVYOXJkNlRi?=
 =?utf-8?B?SW5vaFhmSDFqSVh1OEh1M0FqdE0xcktKM29FWm9SWWhCNDM0Z2R6VkxiMndv?=
 =?utf-8?B?RW5TQUlwYllhZmJ2VHpSMmJPVGlmcVNlaE1OYnkyQTEvaC9IS282aCtqUVRq?=
 =?utf-8?B?Kzk2M09QZG1EQjBKUGdQZmRVWFlrL2doMll2TSswME1oY3lLZHN2SGEySlBC?=
 =?utf-8?B?Q0c0RGp6YlNwMHMvVi9zT0lQOUtnRDY1SXhJNTJRaHJoUXpwOEFwWEQ2bTFC?=
 =?utf-8?B?a0JqVHduOFdnQkZ2V2h2emowZDJxVzJmVW1VVTFCOGdzYiszNE8xb1lCWVFB?=
 =?utf-8?B?UU90UnYzOThEL3B3NS83bHhHMlNiUEplT2RwdExBZDhqKy9RaTNqamhkWTNE?=
 =?utf-8?B?NmZ6c21TMWhrRDVXRDNNNW9GVDdkQWh5K0l2aGNyRTFzWWorTjNvTUJCelFs?=
 =?utf-8?B?Q2d6Qmpya1ZReFJZYldUR1NyZjAybFM1cHZnNDRYeTFyVkN2MmI5OWxzUlNS?=
 =?utf-8?B?b0ZQSVh1dXRmYy9aa0lzemtaMTNUSllzb0lnWmNhNEt2N1MrdzJId1hlNzJQ?=
 =?utf-8?B?Ny9wWml5RU5FaXlKUEkwd2tFRkRBWnNIMlpROEExRjgwdkZ6VSs3MUwwaHhG?=
 =?utf-8?B?TTlWSTQ3RnVzdEUvYUVvY2RwdHVhSW1JSUE4UUdpbjRuQzJwSlBoeVdRSVZI?=
 =?utf-8?B?WjU0ZmRUbDY1MktiMThibE9QK3pua0hnRE8rS3NTd2pYeFltZGpQalRmcE9o?=
 =?utf-8?B?UnBDdGR3ZitJSDlYTW1XWm9nbkZtaENJK2srKzdiZko0ZFVnZUZJd3QyeVh4?=
 =?utf-8?B?NkJOaTR5TjY4ekg0OXlrdnpTV0YxcVpxdTdyb3ZaZC9mM3NtRDlLcmJiZURW?=
 =?utf-8?B?OVVXYWRPUzMvVHNsZkN5V1kvcHh4cm11eHN3U3ovTndacUY5NzR2emVmaTlC?=
 =?utf-8?B?bVVOenNERWw0RWpjK01kMWVEeHF0VTBXMDVGQmkwbXI0dEZSbWV5V3cwRnoy?=
 =?utf-8?B?RXh5TVRERUtNUC82ZTJtb3RVbTNtb2hnQ3FueHppNVVKbFliUVVQR0xoRW1B?=
 =?utf-8?B?R1FwekVIalIzSExxZzF2SER6T0JoME5pVGptS1hLeDRsTEtpRjBZL2d2YnFP?=
 =?utf-8?B?ZCtJZlNMNUY2YVZCZ1lMd3UvWGIrK2kzb0hkZkhPc3dERUJuVyt2MjQ3dEtp?=
 =?utf-8?B?U1hoVkhEckFWVDJuRE0yTGMzN0M3TGRFaEhrT3U4TWo3bWRiTG1KSVlvVktY?=
 =?utf-8?B?a1lXcVRmU2EyK2NHeDd0KytkQnE1eWZWblhKaVpjTVdiZmxmcUc1aWh4WmN6?=
 =?utf-8?B?T0R4SEQ5bE9jMHRET2lzN3ZQTks3RGJKM2FYa1V1YUJ1QjV4OHBKczl2eWFQ?=
 =?utf-8?B?SUxrNGhXd05sTHp6OTFESXhkem9SaVR6eUY4ZDdyZ3ZHN1lmWkVvT0dXUVZ2?=
 =?utf-8?B?azdKRmxwUktMdGVhT0M3YzFZNk1UeDA2SU1tWWN5TXFJOUNmZFhiUUo4UFpp?=
 =?utf-8?B?K0pLOGkzRTZxM2ZvRUFGMC8vbzRVTHJMUEFVN2hYMjRYdnlqNThucEdyck5y?=
 =?utf-8?B?S3J1eVZWVWRuclNNSXlqbnV3R0xuWlFrdTBOek9JbEljNGFHcWhKSjRtSkdE?=
 =?utf-8?B?Nnl2VkgyNFNXbWVodmdmVFFYc2ZqVzRqWTFmaFRGaTFGVkZTY0h3cllQWm96?=
 =?utf-8?B?UTlBc09oWjRJbmJYOGhFMmUwU3dPQkpWVTZjeWR1WVVPVFhtY0k1ZXd6bisr?=
 =?utf-8?B?TUpOdzJ5b0EwUnVNbzZraUFILzRIRFdqNENUTnNyVXNvbzVhcWZMbmYwY3FC?=
 =?utf-8?B?TUhiWmNyZmxlYkROeW40Qm5Wampway9pZDlRR05qNlF1SmNPSW1UL2czT20x?=
 =?utf-8?B?ZnpvMGxsa2M5Z3JXKzN3WXB3Wkh0VERXZHVkODVmU2pTTWtUcDhSeTdzakcx?=
 =?utf-8?Q?hkZ00uZyLWVcwBIKxr+yyhc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142dd462-b5af-4479-ec31-08d9cf665f10
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:41:23.9533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4oTw1pe8E2YvKoD54CbEpx2XEAQJvtbuKyfobAtMhAdHzJBW/lnb91bm3v6AKthGvX3OSzeFN1Os5qxLyL+JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

While it is okay for IOMMU page tables to get set up for guests starting
in PoD mode, actual device assignment may only occur once all PoD
entries have been removed from the P2M. So far this was enforced only
for boot-time assignment, and only in the tool stack.

Also use the new function to replace p2m_pod_entry_count(): Its unlocked
access to p2m->pod.entry_count wasn't really okay (irrespective of the
result being stale by the time the caller gets to see it).

To allow the tool stack to see a consistent snapshot of PoD state, move
the tail of XENMEM_{get,set}_pod_target handling into a function, adding
proper locking there.

In libxl take the liberty to use the new local variable r also for a
pre-existing call into libxc.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If p2m->pod.entry_count == p2m->pod.count it is in principle possible to
permit device assignment by actively resolving all remaining PoD entries.

Initially I thought this was introduced by f89f555827a6 ("remove late
(on-demand) construction of IOMMU page tables"), but without
arch_iommu_use_permitted() checking for PoD I think the issue has been
there before that.
---
v3: In p2m_pod_set_mem_target() move check down.
v2: New.

--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1619,8 +1619,13 @@ void libxl__device_pci_add(libxl__egc *e
     pas->callback = device_pci_add_stubdom_done;
 
     if (libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
-        rc = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
-        if (rc) {
+        int r;
+        uint64_t cache, ents;
+
+        rc = ERROR_FAIL;
+
+        r = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
+        if (r) {
             LOGD(ERROR, domid,
                  "PCI device %04x:%02x:%02x.%u %s?",
                  pci->domain, pci->bus, pci->dev, pci->func,
@@ -1628,6 +1633,22 @@ void libxl__device_pci_add(libxl__egc *e
                  : "already assigned to a different guest");
             goto out;
         }
+
+        r = xc_domain_get_pod_target(ctx->xch, domid, NULL, &cache, &ents);
+        if (r) {
+            LOGED(ERROR, domid, "Cannot determine PoD status");
+            goto out;
+        }
+        /*
+         * In principle it is sufficient for the domain to have ballooned down
+         * enough such that ents <= cache.  But any remaining entries would
+         * need resolving first.  Until such time when this gets effected,
+         * refuse assignment as long as any entries are left.
+         */
+        if (ents /* > cache */) {
+            LOGD(ERROR, domid, "Cannot assign device with PoD still active");
+            goto out;
+        }
     }
 
     rc = libxl__device_pci_setdefault(gc, domid, pci, !starting);
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/event.h>
+#include <xen/iocap.h>
 #include <xen/ioreq.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
@@ -359,7 +360,10 @@ p2m_pod_set_mem_target(struct domain *d,
 
     ASSERT( pod_target >= p2m->pod.count );
 
-    ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
+    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
+        ret = -ENOTEMPTY;
+    else
+        ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
 
 out:
     pod_unlock(p2m);
@@ -367,6 +371,23 @@ out:
     return ret;
 }
 
+void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    ASSERT(is_hvm_domain(d));
+
+    pod_lock(p2m);
+    lock_page_alloc(p2m);
+
+    target->tot_pages       = domain_tot_pages(d);
+    target->pod_cache_pages = p2m->pod.count;
+    target->pod_entries     = p2m->pod.entry_count;
+
+    unlock_page_alloc(p2m);
+    pod_unlock(p2m);
+}
+
 int p2m_pod_empty_cache(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
@@ -1384,6 +1405,9 @@ guest_physmap_mark_populate_on_demand(st
     if ( !paging_mode_translate(d) )
         return -EINVAL;
 
+    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
+        return -ENOTEMPTY;
+
     do {
         rc = mark_populate_on_demand(d, gfn, chunk_order);
 
@@ -1405,3 +1429,20 @@ void p2m_pod_init(struct p2m_domain *p2m
     for ( i = 0; i < ARRAY_SIZE(p2m->pod.mrp.list); ++i )
         p2m->pod.mrp.list[i] = gfn_x(INVALID_GFN);
 }
+
+bool p2m_pod_active(const struct domain *d)
+{
+    struct p2m_domain *p2m;
+    bool res;
+
+    if ( !is_hvm_domain(d) )
+        return false;
+
+    p2m = p2m_get_hostp2m(d);
+
+    pod_lock(p2m);
+    res = p2m->pod.entry_count | p2m->pod.count;
+    pod_unlock(p2m);
+
+    return res;
+}
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4778,7 +4778,6 @@ long arch_memory_op(unsigned long cmd, X
     {
         xen_pod_target_t target;
         struct domain *d;
-        struct p2m_domain *p2m;
 
         if ( copy_from_guest(&target, arg, 1) )
             return -EFAULT;
@@ -4787,7 +4786,9 @@ long arch_memory_op(unsigned long cmd, X
         if ( d == NULL )
             return -ESRCH;
 
-        if ( cmd == XENMEM_set_pod_target )
+        if ( !is_hvm_domain(d) )
+            rc = -EINVAL;
+        else if ( cmd == XENMEM_set_pod_target )
             rc = xsm_set_pod_target(XSM_PRIV, d);
         else
             rc = xsm_get_pod_target(XSM_PRIV, d);
@@ -4813,10 +4814,7 @@ long arch_memory_op(unsigned long cmd, X
         }
         else if ( rc >= 0 )
         {
-            p2m = p2m_get_hostp2m(d);
-            target.tot_pages       = domain_tot_pages(d);
-            target.pod_cache_pages = p2m->pod.count;
-            target.pod_entries     = p2m->pod.entry_count;
+            p2m_pod_get_mem_target(d, &target);
 
             if ( __copy_to_guest(arg, &target, 1) )
             {
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -639,7 +639,7 @@ int vm_event_domctl(struct domain *d, st
 
             rc = -EXDEV;
             /* Disallow paging in a PoD guest */
-            if ( p2m_pod_entry_count(p2m_get_hostp2m(d)) )
+            if ( p2m_pod_active(d) )
                 break;
 
             /* domain_pause() not required here, see XSA-99 */
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -454,11 +454,12 @@ bool arch_iommu_use_permitted(const stru
 {
     /*
      * Prevent device assign if mem paging, mem sharing or log-dirty
-     * have been enabled for this domain.
+     * have been enabled for this domain, or if PoD is still in active use.
      */
     return d == dom_io ||
            (likely(!mem_sharing_enabled(d)) &&
             likely(!mem_paging_enabled(d)) &&
+            likely(!p2m_pod_active(d)) &&
             likely(!p2m_get_hostp2m(d)->global_logdirty));
 }
 
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -661,6 +661,12 @@ int p2m_pod_empty_cache(struct domain *d
  * domain matches target */
 int p2m_pod_set_mem_target(struct domain *d, unsigned long target);
 
+/* Obtain a consistent snapshot of PoD related domain state. */
+void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target);
+
+/* Check whether PoD is (still) active in a domain. */
+bool p2m_pod_active(const struct domain *d);
+
 /* Scan pod cache when offline/broken page triggered */
 int
 p2m_pod_offline_or_broken_hit(struct page_info *p);
@@ -669,11 +675,6 @@ p2m_pod_offline_or_broken_hit(struct pag
 void
 p2m_pod_offline_or_broken_replace(struct page_info *p);
 
-static inline long p2m_pod_entry_count(const struct p2m_domain *p2m)
-{
-    return p2m->pod.entry_count;
-}
-
 void p2m_pod_init(struct p2m_domain *p2m);
 
 #else
@@ -689,6 +690,11 @@ static inline int p2m_pod_empty_cache(st
     return 0;
 }
 
+static inline bool p2m_pod_active(const struct domain *d)
+{
+    return false;
+}
+
 static inline int p2m_pod_offline_or_broken_hit(struct page_info *p)
 {
     return 0;
@@ -699,11 +705,6 @@ static inline void p2m_pod_offline_or_br
     ASSERT_UNREACHABLE();
 }
 
-static inline long p2m_pod_entry_count(const struct p2m_domain *p2m)
-{
-    return 0;
-}
-
 static inline void p2m_pod_init(struct p2m_domain *p2m) {}
 
 #endif


