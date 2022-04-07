Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9034F75C3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 08:12:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300391.512351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLN5-0001wn-Vt; Thu, 07 Apr 2022 06:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300391.512351; Thu, 07 Apr 2022 06:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLN5-0001uh-Rt; Thu, 07 Apr 2022 06:11:55 +0000
Received: by outflank-mailman (input) for mailman id 300391;
 Thu, 07 Apr 2022 06:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncLN4-0001On-6m
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 06:11:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e871d36-b639-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 08:11:53 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-yAqrafMGM3yC60nFVaQr1A-1; Thu, 07 Apr 2022 08:11:49 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR0402MB3620.eurprd04.prod.outlook.com (2603:10a6:208:1c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 06:11:48 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 06:11:47 +0000
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
X-Inumbo-ID: 9e871d36-b639-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649311913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6G0lhWDzKngo22Cqa5yFBt1cU5VEIbGGSfIbs2WoXA=;
	b=VdcbK9z14RwkQr9+l4dhRlhtKNhJaBC9MzSYRAZH5C/JAsCY83YLYpZUsLTig/Hbp2sFaU
	z75fwLGUhNKjJ7cfXLdhTrkljQE49F/SdKJEx7h3RYXb2Tapl1Zo+sWQMu3F0B9XtcR/Li
	gNgmzlWkjBgCPGCxsmvex+UFm/jR5Lg=
X-MC-Unique: yAqrafMGM3yC60nFVaQr1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq3lw7XZacNFhs1Cz0SGnmrmzWQ1dLsL9kg599Nag5GAylMP/gf7osFv9/3nxTxCdjTbComiXVF5oFx/mz54do3wnjn9XdZqsAMqyrHOVZyZKy0wumB2t06W6d7+Jjax3v0GLoGTsmkewYv5gwx6Yc2RYek+2yl7dahBx1ws5GyObTkri5hhtmwywrw/M8mIyzIjY5YK9PNyaEN7dvfQ3qgvA1OaQUAxVx1GXDvVQLuyTQAFlQq6cXfFpO/+taskf/voIIxv91AcE4LY1KQvC4EGFN12hItffyDmBISj32aBigBpuhe0KQA3LTlUSL1XFtOjsAUl0m5aiBWAiH154A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6G0lhWDzKngo22Cqa5yFBt1cU5VEIbGGSfIbs2WoXA=;
 b=TxIaEUflRhoixXGlv21DitWLc2WgrCcWSPRRQin23/TerJGzTXknrBavIx76RI2olPDaCWebJU+IxA0JBG+0XECamcW+2iDAoU9JtuD0SCQYr7VMDnf6LmZmawi3C99MRxubEgvhv6YzKw5vDrBBOSaHBZtnR7fJRqXC94sLsUnBD438GE75ArC+UHComH1iYt8lVhZJbxHtpwUkIC062vn11Ydc+S77Jo33Ro3Pg7RC2W5KeehK6x4K1d79v5Dh+gtj9Ck2QErBwHvDNYzaM/kBU3lha8td3C1gNQIEooJO7B8k6jOk8VpkBlaSlva+bsyllK4BTmdcaiTg7CW93Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fcc51df9-0896-247b-d4ad-0de4db6c2a9c@suse.com>
Date: Thu, 7 Apr 2022 08:11:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v2 2/2] VT-d: avoid infinite recursion on
 domain_context_mapping_one() error path
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
In-Reply-To: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:203:51::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54631877-aa11-48ee-3c42-08da185d7f51
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3620:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3620137B61EE96CE967414BCB3E69@AM0PR0402MB3620.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z2xD/SLGybNKvML+sa9c/lvtMeKbi1JMbA8CJ3pKz/Wu+per61Iv/8QXWAPCgmRnMsq2WK2MF6SkVXnhyOy1wiXGG2LsMBRVXcrI52gzO8DpOJXSYFzlme+PT/0zgZ8wdZkPAl5q3B/lFUU/t2r8U3bla9ExRPKO0g1uJMm62AWOdULlte6mS2k4mMGHeBJSnEA7l5/WJbX1WE1qXxiU9ZNHeRG5jFqflsiPRD472ucAmfOuLIua9tG5nCcVO+0b+5E57+k0D7X1o7vl1wFyOQ3LTZSocn1BFgzmFMMS74M6J4wUGfTaWBoFwtjekgiap/vkZdpi+mf4kynAGdZf3AtOFwdUkm021sxFSSn/l7sAhatiVQZXxecpFnPoTZKqgkc2rDw5ANUThi8TSA3yj13oApNNUB0gdD3YRJdKVB8zetN7rekwrD320JC3QZ/yaxbh1d8Eh+Ed5BXZa/s2TCT4Tej9tm7ho/pqt+fpsyJ43GcRgYDlzVhODRkKmyef6x3plyL+woxHGcP2u22KCGgYTpwe4M2bdkgtoK4QLAly1HJw/h6yEp1k+gA4QWb5tijbANxu/duKW5dIZRX6CYoQy86HqaGTR4tfnLrhQVNpuxcGsv3y4NNGE/OlWmjCNQ5noz08YwSp6ckrBdesKAXa6PzuLQ26CTrhnxCYwCJIt1zVLQYy7DVeFnjrs1VRBk3usybj9CiSsjM2NhS/A5TzAwKzjdz2HO7p5LtpEJxXreeaZQNqMoC4IJ2PWQE7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(508600001)(8676002)(31686004)(36756003)(6506007)(6486002)(38100700002)(66946007)(66556008)(66476007)(2616005)(8936002)(31696002)(26005)(6512007)(86362001)(54906003)(5660300002)(316002)(186003)(6916009)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGd5M0gzV00yaCtKUVZRSmdwR2VFUU9FZTZBenpYdFRteXRsMVlud2k1RGt2?=
 =?utf-8?B?NGhHRXpmMXRMS0ltSXoyZ2Q3ekwvSFBnZlZJUUJxcTBEenhIdmRCdnZ3aTc5?=
 =?utf-8?B?Y3JmbXlVL3lCVHFtdGs2Z1dSVGNCU04zMWV0TFlKakJHN29qY2s0TTVHR3FS?=
 =?utf-8?B?WXVtRWZadlR5S1c1d2RDeTY5dDh1dHNVRmcrUW9DSWlEN1FldVloREpMZkpF?=
 =?utf-8?B?OUlwOWQ0eFoxdHN2SGg2S0FjSy91NUhKK05TMFZzcUhHdjlDYlk4UjkrYksy?=
 =?utf-8?B?YUdXTElFZVFTaU00aWhsSlJDQnJzZjNiZFEvZlgwdVF0Z1dReDJFRGxYeWNi?=
 =?utf-8?B?ZlpEckxpK2JWTVZ3YVB6YWdWL1J5V0JIMWRwcmJub0p0TW5aN0FQWGxWOW5u?=
 =?utf-8?B?VkN3SlpOWXNJcmpxS3RBaEtoSk41US9lWHdza1VFQVlXeEIzVXdCLzh1alRJ?=
 =?utf-8?B?czFQSHRZd1BIYVJhNi95QllvM1BidHJITUI4RDdyZ1dBSmNqanNTSkdTMmZJ?=
 =?utf-8?B?Y2wzaEJzNEdyOWh0N1RNZU5WQUlWUXIvRFRjc1pCcW42K0ZXenppL2tpbk14?=
 =?utf-8?B?VlkvVnhZQkVYL21TV2FMMTdJK0ozSnc3c1NGUi92R254OWRyQ3hiY3RXbW1u?=
 =?utf-8?B?SWFnTkZxQ2d0TXJnYzVNUExYdVRTcVFyQWZlcndLaEZXa0xyc1BmdU9KREw1?=
 =?utf-8?B?Um44NytiQ3hqR2VuZzdZMFg2ZDdKNEQxVnZsVkdmS0NqcWxOY1g3SzhTbU02?=
 =?utf-8?B?OTQvTUZsVkVQV2lHNlNybmxmQytlcHlvVnNUMFhiM0VER0hGdm1MNkNRVzBa?=
 =?utf-8?B?K3BTSmFaeTJHbEtlNVVNUDlBeWNDbWovK2xkR2swTys4QjhTbFlLd1psRWxn?=
 =?utf-8?B?bnhlZlViTFhlWEFjRFZxYUp0RFVoR0FXTEF2MVR5MjNWMG80WUl2c0QzN2dX?=
 =?utf-8?B?a211UkpNWlRmcDNnR2xXaVQycGRsZGhpZW11ek1HcmtjaTFWNEQxcGRnL3hL?=
 =?utf-8?B?MzQ2TWJLWXl1Rmc2dFVYVGdIT3R3Rms5OEZMTnFKNFdKZit4UjFFQWlLbm80?=
 =?utf-8?B?dHhueSs3SFBNQm5WbWU3WTYxWDdFT2tSTHZ3K0IveFpFZ0FCNEJSV3ZMaEJS?=
 =?utf-8?B?NVNkcndReklRcjZuVWk4dXIrcHZhKzN5TDJXTjFkWW05cGRyaEplaGNkWURn?=
 =?utf-8?B?Z3FFRU5NVVMyVWt6d2FVOWlxcTFURHpobThPeTNBajN5b2ZDU0w4bktKSEhG?=
 =?utf-8?B?b3MvTFVXeHQzdjBXSHNUWFloMFdhM1pPS1JKRXVLNE5SWjUzNmtlTmpZV0pt?=
 =?utf-8?B?eEJDWFpTb3h4T3oxeXZMdXNITmdZdk1sRzVYOFVDZ3NtVjRxaDlMZ0FXbkZ2?=
 =?utf-8?B?WXVLdDQvVEViaUZsdTgzNk81K1FIdlcvZUxnNjVXVngvQzVEUXJBSzY2dWRY?=
 =?utf-8?B?Vlp2NjZGcFNUK0c2VXJvbHE3TzFWbW1kWThzZVNYZFNXSjdYcDhNMDdiVVBU?=
 =?utf-8?B?WG1OTWZzQ2RhVm56OTlxYkdkajhuVndGWUNxOEk1YW9QM0I0L0hsVmdaQWJE?=
 =?utf-8?B?M3NiVFVkOEloTlRuZVZTdkwyeHpuckpKand5eldqbmYrVjdBOFRwMGFkQlBH?=
 =?utf-8?B?eEhXWm5lWEY4NWd2OWR3bVVRc2dGUXJENnhNcVJJSVVYTnhrZkpkcXJrRjhV?=
 =?utf-8?B?N2lzS2w3L1Bvbm5heklHY3I4QW5kRFduR2tEbEo0S0lyUE1tUVBSZUkvYWpM?=
 =?utf-8?B?TVZoU1ZJZHRWK2taVEhpdTluTmFuU1ZFQU0wczhqU09rRmNwT0NtV1A2Mkdt?=
 =?utf-8?B?YjVOTHh2WStsWXBndlVER0kwTzFObU03ekpNYThTaHdyV0UvbGpka3RnbGdN?=
 =?utf-8?B?Q0FKSC9jWEJ1UkkwS3JrWXc3YlFRVkN6OGpNMFQvYUcwcytqTVBnNGUwbFl5?=
 =?utf-8?B?cDVUTFU2Nmh4QlloalpBc0JyeXdvOGk0aXBTRHhzcWYwZHo4ZVNkVDJmTnVF?=
 =?utf-8?B?Y05ja2tGVEJNaUtQbkh6N05kY29mam5sYlpObVN0WjIxYWltcjg3RHkxcytr?=
 =?utf-8?B?T1AzY2Y2U0xlMnBmdUhTK0F0RWx3eVVNdjFJYmkxam53V2ZkMnE4RWFZWStj?=
 =?utf-8?B?NEpqRlpSeXpYSkwzODd0K2dSb3VzalBoTmZBenhmcWU3N0poWTl0QUI5UDBt?=
 =?utf-8?B?aGt5ODNkMGM4eFMwb2toTlE5cVM5bDhBTGpOV3k4eDNvc3E3WGFCc2svQnV3?=
 =?utf-8?B?L1hycjE0d1pheUJjaHRqQzk0UFF0MlVsanpRSE1lS0Z5L2RISVBodHFCd3dU?=
 =?utf-8?B?YzBhakZBeXJHYlp0NFFjc3NEaW1pMEMxKzNTVHlzVWlBK0YwYjk1Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54631877-aa11-48ee-3c42-08da185d7f51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 06:11:47.8869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aIh2LfGPAsNOHAsS4hbnDvr4HLQewkijJrlZAgZGGsdFIggFaFWqmw4GDnoT6LFkDjpi77RzsRFyDfN2nI94A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3620

Despite the comment there infinite recursion was still possible, by
flip-flopping between two domains. This is because prev_dom is derived
from the DID found in the context entry, which was already updated by
the time error recovery is invoked. Simply introduce yet another mode
flag to prevent rolling back an in-progress roll-back of a prior
mapping attempt.

Also drop the existing recursion prevention for having been dead anyway:
Earlier in the function we already bail when prev_dom == domain.

Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Extend scope of the approach taken. Leverage for some cleanup.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1599,7 +1599,7 @@ int domain_context_mapping_one(
     if ( !seg && !rc )
         rc = me_wifi_quirk(domain, bus, devfn, domid, pgd_maddr, mode);
 
-    if ( rc )
+    if ( rc && !(mode & MAP_ERROR_RECOVERY) )
     {
         if ( !prev_dom ||
              /*
@@ -1609,13 +1609,12 @@ int domain_context_mapping_one(
               */
              (prev_dom == dom_io && !pdev) )
             ret = domain_context_unmap_one(domain, iommu, bus, devfn);
-        else if ( prev_dom != domain ) /* Avoid infinite recursion. */
+        else
             ret = domain_context_mapping_one(prev_dom, iommu, bus, devfn, pdev,
                                              DEVICE_DOMID(prev_dom, pdev),
                                              DEVICE_PGTABLE(prev_dom, pdev),
-                                             mode & MAP_WITH_RMRR) < 0;
-        else
-            ret = 1;
+                                             (mode & MAP_WITH_RMRR) |
+                                             MAP_ERROR_RECOVERY) < 0;
 
         if ( !ret && pdev && pdev->devfn == devfn )
             check_cleanup_domid_map(domain, pdev, iommu);
--- a/xen/drivers/passthrough/vtd/vtd.h
+++ b/xen/drivers/passthrough/vtd/vtd.h
@@ -29,7 +29,8 @@
 #define MAP_WITH_RMRR         (1u << 0)
 #define MAP_OWNER_DYING       (1u << 1)
 #define MAP_SINGLE_DEVICE     (1u << 2)
-#define UNMAP_ME_PHANTOM_FUNC (1u << 3)
+#define MAP_ERROR_RECOVERY    (1u << 3)
+#define UNMAP_ME_PHANTOM_FUNC (1u << 4)
 
 /* Allow for both IOAPIC and IOSAPIC. */
 #define IO_xAPIC_route_entry IO_APIC_route_entry


