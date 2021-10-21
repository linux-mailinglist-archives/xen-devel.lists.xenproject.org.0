Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970B0435E79
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 11:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214286.372803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdUqu-0002UV-Hr; Thu, 21 Oct 2021 09:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214286.372803; Thu, 21 Oct 2021 09:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdUqu-0002SC-E0; Thu, 21 Oct 2021 09:59:12 +0000
Received: by outflank-mailman (input) for mailman id 214286;
 Thu, 21 Oct 2021 09:59:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FF+c=PJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdUqt-0002Qg-1H
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 09:59:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 890c88ee-3255-11ec-8373-12813bfff9fa;
 Thu, 21 Oct 2021 09:59:10 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-J4x-Q08RPByWWDtzEK-TnQ-1; Thu, 21 Oct 2021 11:59:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 09:59:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 09:59:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0030.eurprd08.prod.outlook.com (2603:10a6:20b:c0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Thu, 21 Oct 2021 09:59:03 +0000
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
X-Inumbo-ID: 890c88ee-3255-11ec-8373-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634810349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S8lycJUP12YSt6T5Wbpdmvdqu/DvfiQPPEOn+K5M3nA=;
	b=IXqIs+exvPtL2HhYrq8563G5iKP1ZXqQUTQdi/pJ9ueQadwubyA6jyeaCuKXeqKMlbG7xp
	p4K4JSgWmz1va+75EK780voI0yRaLSOfycJDTK+uvNeSyEZLExUYrul2eO0VbVgxcNjGkL
	0s1TVCSqD1MLmDpb6rhY3HTUAzVdY14=
X-MC-Unique: J4x-Q08RPByWWDtzEK-TnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkknbpGdIEQPi/2D1frYSL30GnGufGxoJ1iLCZs/EyQlaQjZ+/6pMdlH5tBzPNDdlyj4YED4rrOmbfoO+1B5nQRKA9FTFuW19mQ4CtGxbY2g2cJrUq/hSnIm1wtigNzqZUQn2JSOIXo7qUiMK9V/tEPhTx9yaCHrStNdnAO5ptDzy5WhlXWjHmSgElLk3Jq0JwWnMDbE87fXRG406q5pFw17lkxe2q9Ztr1WVqCPTafrp2ihtotg+Q+OQxXuF1YIsSmhmwpAPBOdcpDQia0GBGJHRX0Aert5/cRirUpIf9i7SIZ2ibpwExCZLgW9BZ5ZbYgxSQHxzQYbxESRi/8ldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8lycJUP12YSt6T5Wbpdmvdqu/DvfiQPPEOn+K5M3nA=;
 b=ecIZgMieWg7NVgTYkd/T5d78nEJtd9L2Srti2Ft8KJ13l0jiSzjHsmETA5ufbyt02HhuiwMRzp4w76qnaW3Zp9yp3QM9rwYwTl5ZZnesPROJkj2Qb+04ddTHDrQqzTZMQR72mCxPSLy9CjOfUSAPw7M7enHXwEs4C4+awKPVJXinsLMqZVFffdFPA26OC4Z2heKVtwUVfllcBGVCsW9lgOtMGzFe6TjeHIvrYOeFk1i4hPAIx4SoqsfwuxpZSMF4QqE0G1eF5SkpKG26+Ch8KE9FWcsH45hlSoudNuPOQPQLKqZx6WRw/7Py4tsfy+EYnxhmDfVEZooq35tpeACzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 3/3] AMD/IOMMU: iommu_enable vs iommu_intremap
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
Message-ID: <ff7b68b2-5bba-2927-e3f0-f3062862c466@suse.com>
Date: Thu, 21 Oct 2021 11:59:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0030.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c195caa6-bb85-40d0-3d39-08d9947969fb
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37745852517AEAA7DC615C2BB3BF9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZPm5fOAi8XkcSh1CGGBD7Ni6F8RstVm148CF8bltNoqexU/0aAJ/1a449cgo6eHo51UvHbLNDXpSwKv/t8WgcEbB0/KnmARaLpRlLvRFbCwAb8laPqjpxTAgdU4csod5qIVbKGCbLRGJoHX4MWRifVmWAfgrZZUnwdbeGF34cATfEYtIk/WDqQQPGSG+72mcU874nVE6UQuJ8E4laD2C+RmF6OZw01PK3KewgMymH/0Y06SMbKARgp5R/JV2kNMJN66X4zxOQ50KVykcUKlmVYmllWKbxgFG8BvRm0qqQ3mUtj9tr861cSwjNA/BTKs+/u/xn+gPCJvgP7/7WR0OhN155NDGcl568v2LhX7QVaYlCxZPcq3QFHv1W9fXKX3kXDMcY0TSx8mJca5C2JeKi9J9VtVBjPL6xGP+14umIK2dH6Cw4yC73SmAgoaSpCHG1B31OBIQ7pR251TlJIW3MXQGvEcYCFEbnxhArQgitbdfopkNq/Vg74SmKngmrXEIpKne/v2V81tozO/lg0RWoCxzC0lN9I7aQLgh6opRoWVI2VnsTJCqjkMOqlv/7NICRmggfpp01buSlPM+jQRlHFVmz/8Y01zVqenf4g+Aj0E0NtD82MZ7F8l7zqQCZZPRany+YOJk5tEYjk4ncqMH8WBwj4S6OnvtyIPhq8a0OQWELrE22gRoq7G6NBt22iXwsXWw019DQeJy6WdvLfJXL8l5+FcgM4hUmFaZKHHv664=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(316002)(36756003)(16576012)(83380400001)(86362001)(6916009)(8676002)(8936002)(31696002)(31686004)(186003)(66946007)(66476007)(66556008)(26005)(38100700002)(54906003)(4326008)(6486002)(956004)(2616005)(508600001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDBKdHJUOFMwZ2dvTEFGWW1mb0FXK0JqQ1ZSOHRMUHhTQjNQZUQ4MlVOdTdu?=
 =?utf-8?B?dHMvTU1qNVNSM0Zwa1ErNU9MT1FBay9PWUp1OVZZZVA1aVRSOWZ0ZldLVjVn?=
 =?utf-8?B?eFQ0N2tFWUlUTCs3bFdKbVVjRkFmNDludzlBQ3lZMHhVdTRIQlJ4cXVEVmxB?=
 =?utf-8?B?TWUvSE4yUVlYSThwR0F2MjByNE9FQ1dDTlFMZTRvb25acG45dEg5ZlVYdFlN?=
 =?utf-8?B?aUptbmV1eHVabksvaUtRNlpEcWtMNUhQTTNKejVFbTQzckhEdWpWbHFBS3Vn?=
 =?utf-8?B?VkFRQnlJY1BDTExqZGRYVFhMd1k2UGhBQUZQcTV6MTNKM0lQRUpVaFd0M3RI?=
 =?utf-8?B?bGM1V09RLzZ6L2JmT082ZkhKVWROdkNCUGZBMytJMnU2NDNuK2JZWXA0d1ZW?=
 =?utf-8?B?WjlEQUNrSTV2TnoxN2p5RGp5bzFRNU1qOHBucHd0SjliNkEzUVU3MU5NOUp4?=
 =?utf-8?B?N1A4d0UxeGxqbkdZWGRrbVMyMUxhK3d5bmJZcEpab212ZmhBUUR2RkxISjEx?=
 =?utf-8?B?ajRhbUIvWWUzNVNYWmVIaEVSLzVYQktpZ09FZkpHMFpZWU1mQW5wYjlFbkc3?=
 =?utf-8?B?b20yb1lIWDZLWExLeVFKVWJiRDhWS1d6MVF3Z1hkcEllWk5lcG1wQi9xamQ1?=
 =?utf-8?B?SGJJRFNIc0tLNDBNNDQ0SWFTRkNvOXRhV2Y3K3lmVHhPN0tBWklhY2o5a2ZB?=
 =?utf-8?B?clZPNGY1VENVeEhrWmlGNUNoUkI0bmlOM0ZUdnpyZldNTkdSRXFlYTdyQ29l?=
 =?utf-8?B?Z293bldDVWpReGlFdHpialVVZjRPUFpNYS9yeDROOFZHdDhXangxRTE2Si9p?=
 =?utf-8?B?OG5MYWQ0SlhWTTVuNloveU41bk9ib0ZUeGtOalRtOEE2Q01ud2wrODRaaXc5?=
 =?utf-8?B?Ly9tZUdWYXdzZGxxbEtVQlVlVWIxVFZhWlZvRitPWGtxN3RRbmlyYnUzUUh0?=
 =?utf-8?B?Smwvbm11eEh5YlcvcTRvV3VBQ1poV09Ta1I5TExNSlhhRHZVUktiVHIrZUNu?=
 =?utf-8?B?MU9VN1hpQ2dNWWFqN0I4NS9uWlQvM1pGQndOenlmSEI2TGZNdnlXbFo5ZjF5?=
 =?utf-8?B?eG1JdG5lTWNWL3VlbUJXTGU3SVJpSWVFTjd0R1pWdUhvbDFXd1oxa2RjOXRK?=
 =?utf-8?B?WnZEWXhPemw4TnBFQkxrZU9Gd3pqc2hOVnNXQ09VQlZDTnBaL2VKNXU5UXR4?=
 =?utf-8?B?R3FmY1dablZOS0Y1NktNUE01cjVCSTVVNEErbEZJNDBWaXlZWS9rVUpTNVkz?=
 =?utf-8?B?KzNKQ1I3dStiZTNuUzhLeWpzUmM4MWxQcUVmYUk5bnlIUEl3bnVqYXRuRmZC?=
 =?utf-8?B?VXptTExtVXpqN0Jvb1ZKTnFqZ1N3d29sNmthTW45aXdFdUVVNDJkU0MzSVFV?=
 =?utf-8?B?V1lYSlROUGhuVVBHVEg2Zi9oNmVxOVpFbG85blZFczNLWmYrMU9sM0oxdFJn?=
 =?utf-8?B?bnpwSFcwKy94V0JPYlRGWTYxajlndzlWeWlqR1BDYVhFVDIrV0JUZmtWeEU5?=
 =?utf-8?B?NEZJZkdCQm4vY005UG5rWXU2R0dzRUhqYmlISlRJQVJvSDJFazkyWmFUaHN0?=
 =?utf-8?B?Ty9zNnd1b0hmZW91bzdlb3JUNmV2Q3NBVnJISjN1TkFVcXhDZFJ0ekNlZnQ0?=
 =?utf-8?B?Y0NnK3pNZ0VZZEpxc25OUUZKd0FDYktlWWZIa2JwZXhsNDV3MzRTSEdTWXdq?=
 =?utf-8?B?VzF1V1VqYmlMK2ptVmhwZmVJdTJnS0R3S0VlQzB6eS9WdDRTZUdqQnk0bXdt?=
 =?utf-8?B?NjhXZWxSNmVyNFY3TngzL2dyL2JZaHRybi9JZUgxYTE2dXBza0pOT0lXYTUr?=
 =?utf-8?B?UkR2ZkZ3blRHR2l5cG1hWGtIZUQrU1FVWHJDaWJOM0NlQVZYc2EzTzhUV2VC?=
 =?utf-8?B?QTZTNVYrTGpuOVBMekNYQ3BXVVJzT2JmRHowRTI3eHpVcXNDcG44ODFWM0s2?=
 =?utf-8?Q?vakPb+9bRz0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c195caa6-bb85-40d0-3d39-08d9947969fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 09:59:04.0651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

The two are really meant to be independent settings; iov_supports_xt()
using || instead of && was simply wrong. The corrected check is,
however, redundant, just like the (correct) one in iov_detect(): These
hook functions are unreachable without acpi_ivrs_init() installing the
iommu_init_ops pointer, which it does only upon success. (Unlike for
VT-d there is no late clearing of iommu_enable due to quirks, and any
possible clearing of iommu_intremap happens only after iov_supports_xt()
has run.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In fact in iov_detect() it could be iommu_enable alone which gets
checked, but this felt overly aggressive to me. Instead I'm getting the
impression that the function may wrongly not get called when "iommu=off"
but interrupt remapping is in use: We'd not get the interrupt handler
installed, and hence interrupt remapping related events would never get
reported. (Same on VT-d, FTAOD.)

For iov_supports_xt() the question is whether, like VT-d's
intel_iommu_supports_eim(), it shouldn't rather check iommu_intremap
alone (in which case it would need to remain a check rather than getting
converted to ASSERT()).
---
v2: New.

--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -731,8 +731,7 @@ bool __init iov_supports_xt(void)
 {
     unsigned int apic;
 
-    if ( !iommu_enable || !iommu_intremap )
-        return false;
+    ASSERT(iommu_enable || iommu_intremap);
 
     if ( amd_iommu_prepare(true) )
         return false;
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -199,8 +199,7 @@ int __init acpi_ivrs_init(void)
 
 static int __init iov_detect(void)
 {
-    if ( !iommu_enable && !iommu_intremap )
-        return 0;
+    ASSERT(iommu_enable || iommu_intremap);
 
     if ( (init_done ? amd_iommu_init_late()
                     : amd_iommu_init(false)) != 0 )


