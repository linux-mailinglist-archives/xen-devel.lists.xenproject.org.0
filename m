Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B733FEAAC
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 10:34:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177157.322411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLiAy-0000of-Js; Thu, 02 Sep 2021 08:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177157.322411; Thu, 02 Sep 2021 08:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLiAy-0000lN-Er; Thu, 02 Sep 2021 08:34:24 +0000
Received: by outflank-mailman (input) for mailman id 177157;
 Thu, 02 Sep 2021 08:34:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLiAw-0000jF-Gv
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 08:34:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91cebf8c-0bc8-11ec-ae46-12813bfff9fa;
 Thu, 02 Sep 2021 08:34:21 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-mV4NjS7ZPO6kVHAaWD_-qA-1; Thu, 02 Sep 2021 10:34:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 2 Sep
 2021 08:34:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 08:34:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0054.eurprd03.prod.outlook.com (2603:10a6:208::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 08:34:17 +0000
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
X-Inumbo-ID: 91cebf8c-0bc8-11ec-ae46-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630571660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFNiMXoiKa06wTzVJFs8SMvmLCcjsyrCF6I15nLpdgY=;
	b=Q8mz+ZAeCT+gw/PXiBqkk2rX86/MVDlLmBcq/5ennSLm0lNsVVIXwEnj6jYOqPIk/wcYBG
	BqMhYH/HLvG7zPpUMJUtYneipSzkXQE0wHxH1MODQQRZO3iBLT4K6kcAUZRIn2C4eisbwb
	n+8wncth7wpaaOMpxZiW2TuP8Ucqi+0=
X-MC-Unique: mV4NjS7ZPO6kVHAaWD_-qA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRlP2XFEfmByhwI/5Jf+T8woCrmkt8PDBZQUnFGG1RT+wj9ZnW2niRp5wFisVcrdH6rOdX9pGqJNIjCvztOFUEQtiqCyIJ2crF9k9Iu6s0o90FfXVDwJDY2IjewBuS05SMGeHPOTRATkC0cTINUxHkY7LfUM5NuRel1AU8mboDs+FgMn+xLmzJJOTMSrbw3vrYYkznPQfQ6Zy2RGPeQb5fzk7prlGyZA2KKT77uaTojfquY0joDihX8NA189LHmBcEGdufjUqKgymI+IPrhGjrAhfHU3NdbETz0UemsKUVkS0KPTCTHOaW97xbRTy9LJJ3WTWs6P6U1PdQjGUzn24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFNiMXoiKa06wTzVJFs8SMvmLCcjsyrCF6I15nLpdgY=;
 b=Nd3+D0GZyx9wHfGziRufm/aqTed9mhjaXx5K/e1jT0P4o5R6Qi8Zkm3fu17mQ1D75l3mRx7Xu0nAPcUI3TqCF06j/rXkWEO8r9nBSiCcb8s+EqoUrMPuaR0KO2BZRL+QjgtQzE8GmFZseEwmYe4b1FdJC99PWhMCKUA4E0hrnD5frM/k8mWG3U6EDtuvXv6RpdP2M9oxsTbADTru0ndZBj5ZHKhVhH4q7GUpbIU9NQPTQIeFm6kGae63oNDMSE9nO+hW0q4y3LE2Ta+VRwmdKDEbwkJTOUBKqWCOzTmEF3M2TOU3Cg03N2MpwWaVY31OFXNJ3Cs5j7wpk7vXS/L9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 4/6] x86/PV: properly set shadow allocation for Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Message-ID: <1a916bf0-cf23-c2cf-eb18-07f8cea27850@suse.com>
Date: Thu, 2 Sep 2021 10:34:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0054.eurprd03.prod.outlook.com (2603:10a6:208::31)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2200fa26-af8c-4f75-d3c6-08d96dec7440
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4382AA0DDAB0A991F057B95FB3CE9@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MthWaVx89Qa+jwjD9+9vfDYthol0POTKtKJPBdsoOIKmYxGjEJKKrgOIg8z5Y4Owf2zYJj0/fdc9+hgh1SnlMvCu2g3COA2YLPy1PH8U2wJXzplLUqXT4JsnEIEGy/nDc+CCoY3U+saSo1oBYj0X9U1TVnjzRQi3WMEKvWazEedhxl5M7oALKsG0mC3bKXH2ra0u8FomBmzkm608HHcBXbZMNwCC1oD+m8kwu5W+jC0u7N/g+Ns/BvEb2uhRhQPpWlrlglO01x7+Icxa0X9pNYM4oxJfZUuxsGxYa1p0uN1rPrriljUbWZlTe3ABacjVzZrCJSlkkHpSnTclSgmLbNIdjOkPZzmwd43PXVQkeD2j1wRxM1ExVoYWaq/jjjaScgVXhKXBx5m4fA+tjf9V87sJjEHTlX1Tm3uEPFAUIo68ri7RsYoLxSCfwb3+h440S0dEXD2hm+tGYMUJUrFnYpouGItJ7VNgxwDlksfCHsRtm9dDKnrocU+3WuZwBFz/x3U+FYkX3TdW1nlsBRGpti6cIhqXL012+QYTm0QZpEpySAb/XrGpO6sQg+N1UmiADU1o5EeGtuQyupSYYb9rZ6zSqDfGgO8CtPkgZK++hGmIDZZAV5quUe7k0E3eGnkXhxKgd482TNg9GYlibLJEQgLdPD4sGClevToFw0cmv3Q7St3aZ9IRS2kc0/JphHbI//6vrEyJmCIi6+Xb22X23wFJ3+bQEr5W8In2InL72Lo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(396003)(376002)(346002)(31696002)(66476007)(2906002)(186003)(66946007)(38100700002)(26005)(66556008)(5660300002)(478600001)(4326008)(31686004)(36756003)(8676002)(6486002)(316002)(16576012)(6916009)(8936002)(54906003)(956004)(2616005)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3djZk0vczdoZmZZTWxqL04vSFVxTHNyYzFRLy9MTllidThKWFgxQTl0cElP?=
 =?utf-8?B?OENKckRaRk5Jem1BSDQ5cjVDZ2QxYlVLS2hwUkFQSDhGYTY0Rkw5dGtwNkxE?=
 =?utf-8?B?Y3dwWWdpSWZFeUM1UW00ZWJUU3BpQ2JMSGgraUpVUmJRWGdPcm9CeTY5T3c5?=
 =?utf-8?B?WklDRFQ2VXA1a1dsVUJrbVdLZjNqek80M3lVeUVrdWhmTGp2VzZmaFZZOHAy?=
 =?utf-8?B?SjloUnlEWDQ5aWk1cVduU3VOVVpDZVI5K0RJVjJJR2VnTVFrbmtab2dvbXdB?=
 =?utf-8?B?MzVqeVRLNjRHZWlvdCs0WXp4dEowdk5ZcGJtdlIxOURjTUw5VXV5VXVycy9v?=
 =?utf-8?B?R0ZlcVRMcDAwUmY3d3lFbE13QWxQV3M0Y3lDQkNJd2NGdkV1N2ZJS0Q0bXIw?=
 =?utf-8?B?cGp4T2dsL2FBd203b3RQVjlML1dMem5FMWx3anJpNTZkeVhORk81QVFRTHlR?=
 =?utf-8?B?MTNsUUhmODRVSlRtUThHQjhVZDAwSXRnTjllTzZwUGgxZXB6NU8vZ3p1TG1u?=
 =?utf-8?B?WGNwVVR3NHpSNTduR0dIeUVBYnF3UERrTXpGQnJQcVF5dFAyY05wY1lrdmYx?=
 =?utf-8?B?Zi9ES1p2NEFPZTUzanNpQ1RMTDVyQzdWdDRFYnVYcTVyZHkyQ0p0WHZCWHlm?=
 =?utf-8?B?WDBUcVFmMzFUUFNRRUZNQUhkZmFFTFVXOGJKcXpEYmlGaFVyTWZuekdJWjl5?=
 =?utf-8?B?V1dLUVcwamt3aDROQUwvS2RDYlRuOGMxYURzSElWRmpvV1FUNmIycFdCQURO?=
 =?utf-8?B?MXlrNWowMDJ6dCtWK1BOR3pGdUFVNi8xWFErSURmdWF4SE1ydXJEOU5uNVdT?=
 =?utf-8?B?RXR0dll0dGkzc3kvZGlkdkxDRVphU05HSjlVYm8xMFpSUTJPeEFSejlQQWpQ?=
 =?utf-8?B?RU1sMjB5ZUxnM2Jhbk9veG5NUnh3R1BienBNUXFpZ0R3ZXc4N0hOdFhWSVk2?=
 =?utf-8?B?UlBPT2c4R3ZYZjFzVUFtOUg3elkvY2Z1Z2dJamt1MTlIdXR2cDVNN0RHRU5K?=
 =?utf-8?B?ZHJEUkFhVE9pZm9DTnpEYjFjMmJYeUhGUHJFODFrSER4QTBOUVA3SWJTZXFm?=
 =?utf-8?B?TjFESHNNVFJHVXNWRFJibEpaUkNsVjFxbno4bHJwNkFmU09kZkpxZUxXVFNX?=
 =?utf-8?B?eU1DTkRzdk5KNjVPUUVlZUNEaWk2LzNtQmdIZTVLUmZhYjRWaFpjY3V6ZTNy?=
 =?utf-8?B?RTNVZTRCZFdMRWczbERKTG9TbHVKdklvdDBhaXQyZ0luTHhWM2c0WkJ4ZE5I?=
 =?utf-8?B?VzhrOUpjdVVHeGtGcnQxckRneWlrWVBoczJENWF0QkNMRVU4NGRCN1dYd2dK?=
 =?utf-8?B?dTFvVGtQN1hxUGppUDhzem1GSWFRdy9ZM3dPMm9XSlQrUVVKRXhaNkQvd0Fx?=
 =?utf-8?B?KzdUdU1rMkhqa2p1Z0c2KzFHcXdJeEpXUnloUTMyeFY5cW80dG1vK3ZjTGtt?=
 =?utf-8?B?RzNNOXhZcTRneTlINFZmVlZNaU5Cc1B2ei9nbjIzL1R3bzN3SVlmdTJ5bm5H?=
 =?utf-8?B?QlkvcmZtTHZMZC9HWWJSblFCWHlNSzFXMHdCWFQ2Z3ZjK1ZGRUNBOVNDdWlS?=
 =?utf-8?B?OGZybksrY3ZRemloQ1JLWmNNbE01dmdWUWdSMXh5VkQ0UkpBQmIvZ1gzbSsy?=
 =?utf-8?B?UmRFUzdKU1dkQ011UmY3eEJIdUlEZzl6NEsvM3pxODljM2tLQndYL3hwUDda?=
 =?utf-8?B?RjJadFcvNHI3aHJ2Q1Bzenl0NS9ieU54eEdZLzdEUWpCMDhZQmkvemR3Vnow?=
 =?utf-8?Q?Q/Os+aEgRb74BhFKUqdpNBIpNQNL/1KM6gbts70?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2200fa26-af8c-4f75-d3c6-08d96dec7440
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 08:34:18.0900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcEMG2vgLKJ+r/fnn2mjT4ZguMdZtK43BX69hBl8YK0RRCh12jcUMsSGqfjfC4oEERJsSna2vVhba8UV+c0GPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

Leaving shadow setup just to the L1TF tasklet means running Dom0 on a
minimally acceptable shadow memory pool, rather than what normally
would be used (also, for example, for PVH). Populate the pool before
triggering the tasklet, on a best effort basis (again like done for
PVH).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Tim Deegan <tim@xen.org>
---
v2: Latch dom0_paging_pages() result.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1298,7 +1298,7 @@ int shadow_set_allocation(struct domain
 {
     struct page_info *sp;
 
-    ASSERT(paging_locked_by_me(d));
+    ASSERT(paging_locked_by_me(d) || system_state < SYS_STATE_active);
 
     if ( pages > 0 )
     {
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -21,6 +21,7 @@
 #include <asm/page.h>
 #include <asm/pv/mm.h>
 #include <asm/setup.h>
+#include <asm/shadow.h>
 
 /* Allow ring-3 access in long mode as guest cannot use ring 1 ... */
 #define BASE_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)
@@ -933,7 +934,18 @@ int __init dom0_construct_pv(struct doma
 #ifdef CONFIG_SHADOW_PAGING
     if ( opt_dom0_shadow )
     {
+        bool preempted;
+
         printk("Switching dom0 to using shadow paging\n");
+
+        nr_pt_pages = dom0_paging_pages(d, nr_pages);
+
+        do {
+            preempted = false;
+            shadow_set_allocation(d, nr_pt_pages, &preempted);
+            process_pending_softirqs();
+        } while ( preempted );
+
         tasklet_schedule(&d->arch.paging.shadow.pv_l1tf_tasklet);
     }
 #endif


