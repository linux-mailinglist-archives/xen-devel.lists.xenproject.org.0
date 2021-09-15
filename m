Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC3340C295
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 11:14:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187397.336245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQzM-0001W7-Uz; Wed, 15 Sep 2021 09:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187397.336245; Wed, 15 Sep 2021 09:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQzM-0001Tv-Rh; Wed, 15 Sep 2021 09:13:56 +0000
Received: by outflank-mailman (input) for mailman id 187397;
 Wed, 15 Sep 2021 09:13:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQQzL-0001Tf-AZ
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 09:13:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7117321c-b748-403b-98c6-112c689792df;
 Wed, 15 Sep 2021 09:13:54 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-bNj072P4M025VJlUB7dzEw-1; Wed, 15 Sep 2021 11:13:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 09:13:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 09:13:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Wed, 15 Sep 2021 09:13:50 +0000
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
X-Inumbo-ID: 7117321c-b748-403b-98c6-112c689792df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631697233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPv3uK8bqSIgwLCsg7oLnpJv0fedDK5iubeaeJBmDWs=;
	b=apgQ/xiIRJ0zyjt+w3QK2sdsw5TXBCosQ/8YFdcvXDK85xuvpsEBCgAyj5pkU+3B4tEWb9
	B+/ncF/fpl+t4gPBTAcH9yRYO3SFhlaD+JuUoZ3goeIl85SCfdjazXBiLmW8oGGPc0yPoX
	Qvr17P+ZHAQiKvG1lgpWcKnGfhYC2kQ=
X-MC-Unique: bNj072P4M025VJlUB7dzEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCG3KgvFWoKRGLk0vzMIsx6uAGdCo0wHOGocck3QvFHmCkhNtZ7zCYwaXl2K6J8Jw06UrtvJF0tYoAEmv7vsvy5JgUERf/2+h7hKRbXX7b05fXqSnMV+vopRi6YTADfBbKZ7haX1YMPywPLNOgXOPeJKcrr5qgHmc1ZhCqjZATXQwh2J7GNuaX8+V39w+qVNRynAA0XWePZXpZLB10lX4z79wcwlLjKQmlYoOS/founwdUk39HG4rYqbPLIfaoXV/bPtKRcZrrhas53iFtx3ZWYlKQ6yI1ZdMYdUUxMLWpmZ8FyQbP4o5AyejB0m9uc7dIIAkMJ+h3CyRXHcUlUPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TPv3uK8bqSIgwLCsg7oLnpJv0fedDK5iubeaeJBmDWs=;
 b=O3qt+/t6uVIQEydyIxxfTrz6Cc3rbvFgfDVJTbiFGxL1eKfkgsqy5bX+smjlsq4fUunGKtSoFG5M24yqZOoRPtYknB8ZJ4C6VyHza2tUcq1hVQcrrEsmT21G3ukj2VafqDIpSMVF/G3yOCPBgLDt8MNW+OnSF4QeMTgGLQZmGct8f57kyC/RW5hRdMUgx84TGnE2KNaqOjp+iIOsGGM3h3Clen0MMuHRjGL77+qFInmuScXEfKpiXqPvePA0G8DupMzqK38GASZSDUelItBwOihUZ22lZ1j70xUHrbfQ1gPSpupI7fCG3Gsvycv2DX1k8AZlE6uZ+MZoKEY+PRfdhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 4/4] AMD/IOMMU: consider hidden devices when flushing device
 I/O TLBs
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
Message-ID: <f40604e9-f41e-4d51-011f-d507ec711904@suse.com>
Date: Wed, 15 Sep 2021 11:13:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32bb6961-04e3-4b0e-7339-08d9782921a9
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB737556DCF6F0A5357240A718B3DB9@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DhtTAYESLKi3B+4UjjZ38SYd9YqjPIDhybF4lJHfWEq3bZmkcvioP22GQYzIZYkBgrolpfYOqtohmh8JYEv7ogwsQXdM0NdBBeijGDRBJnT6xq/pbbqzQIeDkELZf8u08XY0wTt2I1P76AXambUHr4EFuIno3haQrcQcou8hPrk0d/uox38zSt+/29TWCLw9Y4XlCXTgLT/X1w2KCeL/PyfmnySMc0y+O3GOS4+U7luLxudHZi3slhJ1oNDRxaOFhjmxhIGr6tyUAAhzeD9dtUk78gVFgfHVn3tFm/sKkUPLk/pcYtdJI6Bv/P3LvrisJGVgtlLqLcJ5GNoR1GhJ7cK1hsurKNirqkUBdv0w+h9O3bvm0Xs5CF/Ws+dgFSaTBlok/6C0efspCR5IGGET7qAJjvprWM60lVHDHhyIyT9kuUM8codxs6UZh2xBMa9BDE0o+FKsbXbhbmGoGwpgZT/NNLS4M0fu1Ri91Hg9gfXKDUhWXFaAV+/fMDbMMxgT2aYzt5UA/8n0eaeIf4xt36jt812Y9RmMdcERGi/R8mTyFeAs3bACXbYpqNVAegrDOmjVq0HBwEGtDbY4a19pUPe9Eb61pSCPnTYwsnCI/mIQDfOf7ofheFp2nVc6F+7XaGdM92L+uOrspEp/fZn2Lk82GZlNvZfuHJBsCufR5elWr05fLLCtMCLOhoN4DXMNSn0mn20ZnRE276u9uFLNtwgyWrFte3J7r0sHZAdoEJY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(366004)(136003)(376002)(346002)(38100700002)(2616005)(26005)(54906003)(83380400001)(5660300002)(4326008)(8936002)(316002)(6916009)(31686004)(16576012)(8676002)(66946007)(6486002)(86362001)(31696002)(66476007)(66556008)(2906002)(956004)(186003)(36756003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUtBRXJzeWhFZUptZGQrQktScHZ1VjYvMlYrdTZyY2FISDBCZHZwRzlqaHNW?=
 =?utf-8?B?VUhkaTFWNzZBR2Rkc0RzMU93UHE5Y3N1eWJMdDlrZ2NBN1JQRis5T2xpUXhr?=
 =?utf-8?B?Y29iL3kwRmFlY01Ia1VmZ0NZYi9DMXcwSFRocnFTZldmTUF2Ukw5U3I1K3dL?=
 =?utf-8?B?ZG9mMW9BN2NCd1Y0WWlRbjM3MzllaDFLaUdLMktuUTVZZEZWaHludHBDSGFI?=
 =?utf-8?B?eGJ1eW9WMThDRXB5WGFudmZLT1JQNGVrQ3RWKy82Z0Q4RWlhTWRMRVFCbmpQ?=
 =?utf-8?B?Zitpb0xpaTJVd2g4bTRxbXpkSjI2amlCcTlmaWxsK0l0M3ZhU2J1Q053RFFm?=
 =?utf-8?B?ckNwbFJPRC9aRTZDbDNYK0RiVzYxdUlacmVpcFV3YzNvcFphaGxzVzBVckFr?=
 =?utf-8?B?NmtlM1hWTWNHSkx5SFFqaVBCZlRDQW9hZDVCRm1LOCtMOFRaYWk0aFJwY1Bh?=
 =?utf-8?B?TGZjc0swNGJDeklWZDhyc3NMcm93WGc5YjhtT2tVQzBlWUlPZy93RDNxSTRC?=
 =?utf-8?B?M291eUp2aDVybGVGMTh0TXZyb2RMKzMxQVY3bllnamJFUWRmVzZwbHNqaCta?=
 =?utf-8?B?SnNKdE5vMEZtVmJBSS9RTXpwcXJ1V1pibm45VkwzeW9jWUN4UVRzTEVySmtB?=
 =?utf-8?B?K2Yzeld2b2JmTmhjR01OQm5CaHd0WXpjcnBnT29DUTVzQ0Y1NVBLZjZUQUJp?=
 =?utf-8?B?M0FkR1VnMWFmOWk1ZzMzQjZOMzBYbHhVeXpPTDRiRXA4WDJIMk5DU2tHNm5C?=
 =?utf-8?B?cUltVUJzbXFtL00xWHhTMTRnTEc4WC9PaVloTzgwK3Q0NTVlakRUa1U0aHJ6?=
 =?utf-8?B?TW11YzEwZTNTRlZ6T3FoZnM3eWcrazh6blB3REdkNVNkUEJveDZ5L3lsT0ZW?=
 =?utf-8?B?NGdJNzlqMkRtU05VeWtxUmV3aVgzKzBqck9jRnVJS2JzU2k4K0ZMRGg1S01X?=
 =?utf-8?B?NGFQMkYzRDdqVjVObXRidDhNSGhlKzFUeDZwR0dHZWNUQ3BMUGk4bE1JekZh?=
 =?utf-8?B?OG9TdW53Rzd0OTFpaUgzZTU4MU1FblhRdzY2M01EUndoUG1ROHVoN2w0UXYr?=
 =?utf-8?B?aWx2OVdBUXc3NnRHVkwyRVZoZzRFZXFiOUsrSWJndFF5ckU5elFGQ3hGT0Zo?=
 =?utf-8?B?OEVSdVhuOWw4TWZKU0V4Y0tzUDdDZy8wcEs4eWE1dTRjSWlVUWdwMjFZcXJw?=
 =?utf-8?B?RjV4RjVoWFRDZ0N1ZGpQQnpzTXg2YkZTMC9nN1FKZVZmZU9BWHhDMXkxYjQr?=
 =?utf-8?B?citkTDg3VS83YktMNHJmRVhHNHNSempNbThmcDdwU0ZHTG04NVoxT21OUWU2?=
 =?utf-8?B?Z1lvTnJ1dDF4K01hdDNuUzB5N1UzcjFyTDZuZFJ5ZjB1dXQ2bXZIYXU4YTdF?=
 =?utf-8?B?LytGdFozWTVlMWNVLzRMT3Q5ZGRTUXFBQkVtckRIUHV4L0FQeXJwdWtReHpW?=
 =?utf-8?B?cVdwbjhVTTAyZERoWkM3Z0RYeWl5TmRpTHlWVDFRTGJzME93a3FoYVVRU0pz?=
 =?utf-8?B?S2xIS3hlOHArMjdreG14Z0pjdm84NHY3TDFnclNHOXBOWGE0VnNKNDlpVnR2?=
 =?utf-8?B?SzNhb2hiWHkwdzFadzNXM2E2VXYvZ2tLV2IwQjhWcks1NmxXZ2N2L21kQjVV?=
 =?utf-8?B?V2VFbXZmZjJVRnhFN0RTcWt4YmEwOVExSDYrMEZGZkpmU2tFUk52b3hrZDFZ?=
 =?utf-8?B?SStRdGMwMkJGQ1JWRDkvNmNMN3ZxYXdUSCtsM0Z2U2pSb3dqNjU3VFdicCtK?=
 =?utf-8?Q?3hEkXufHvtyjlmXApzIrjBSVRM5UYW28VySMySb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bb6961-04e3-4b0e-7339-08d9782921a9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 09:13:50.3950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1SoOOnzcswpQT+qOlCAapvNcGZ6v6sDofaCXqgnEZaa745w7ejKn69l0zmZPF6axcy1bqMS7/9e/4zgVJdaPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

Hidden devices are associated with DomXEN but usable by the
hardware domain. Hence they need flushing as well when all devices are
to have flushes invoked.

While there drop a redundant ATS-enabled check and constify the first
parameter of the involved function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -308,14 +308,11 @@ void amd_iommu_flush_iotlb(u8 devfn, con
     flush_command_buffer(iommu, iommu_dev_iotlb_timeout);
 }
 
-static void amd_iommu_flush_all_iotlbs(struct domain *d, daddr_t daddr,
+static void amd_iommu_flush_all_iotlbs(const struct domain *d, daddr_t daddr,
                                        unsigned int order)
 {
     struct pci_dev *pdev;
 
-    if ( !ats_enabled )
-        return;
-
     for_each_pdev( d, pdev )
     {
         u8 devfn = pdev->devfn;
@@ -343,7 +340,16 @@ static void _amd_iommu_flush_pages(struc
     }
 
     if ( ats_enabled )
+    {
         amd_iommu_flush_all_iotlbs(d, daddr, order);
+
+        /*
+         * Hidden devices are associated with DomXEN but usable by the
+         * hardware domain. Hence they need dealing with here as well.
+         */
+        if ( is_hardware_domain(d) )
+            amd_iommu_flush_all_iotlbs(dom_xen, daddr, order);
+    }
 }
 
 void amd_iommu_flush_all_pages(struct domain *d)


