Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F07412F46
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191448.341485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa55-0008GP-Tp; Tue, 21 Sep 2021 07:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191448.341485; Tue, 21 Sep 2021 07:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa55-0008Ea-PX; Tue, 21 Sep 2021 07:20:43 +0000
Received: by outflank-mailman (input) for mailman id 191448;
 Tue, 21 Sep 2021 07:20:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSa54-0008Cx-9A
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:20:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0407dc2-183f-450a-b795-8acad6bbd819;
 Tue, 21 Sep 2021 07:20:36 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-YjvEN7OzPWibYAIKPIA3Ig-1; Tue, 21 Sep 2021 09:20:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 07:20:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:20:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.7 via Frontend Transport; Tue, 21 Sep 2021 07:20:32 +0000
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
X-Inumbo-ID: f0407dc2-183f-450a-b795-8acad6bbd819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632208835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbSaBreuvDjQILv0E6xjB0s8ZsBQ3dj8qUpxvESe3zI=;
	b=jPvUgl3iBo76LX2XzOrKWskJdjShK5UQYY4OcrOnztuhXqloEpItzsGulgPMJ9F/MQqWcT
	I6CIZogN73IY1ZYwIUVL9fxfE2WFvRu4pqMVVw2vxawXklT4MnmBQbNityreOcEd0MWMLb
	ZS1LayiELZk1CoxFFTrPbSOgTFho/jM=
X-MC-Unique: YjvEN7OzPWibYAIKPIA3Ig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2LUX0fRf98D5C0FwNwL9PbS7MLydFyLc2nBVrxWhqNeWhyMcotO4TF5BCnrHIn1tQMdOf7ThpICfDeoKJu0/WFA7j0ux2dmw/MvSlDpg/cZbGoYnB2bdXym+xYbUURDnc84ycAvJv+S3B3PWcvTPkOEyWem/+jdOVegbm35JnOo6FAlJ2z/PSFMbchyamF7rFq+fUpSBCBXa+bqBffP1JXFR7+bl2wCPsBNsSL8DbK0z0Pov6UViUT4aOq+pOyXgXJd34gg/A+69qqJP8ftO8S6P41xChozLhegmSvONpKJt23FtrxNXYO79obOdSiwTispji0a8fQrfAT9U96w0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CbSaBreuvDjQILv0E6xjB0s8ZsBQ3dj8qUpxvESe3zI=;
 b=IkEnAcKI3UGrNqS9FrEQ3+KQroOdo4HZHmxOSqhPlqPIFEKd/hK0kRv+mMPPA1rky+dq9nD7MzLD23xOjsLQ4a7OpuBMN1Joo8OHA5woI1wX2asxkGsVbomgY8RYdT//RU/hWNheCkU1GsOmBbUs76PKEfuIxc3e5DbAZEDbDfdoT8KK/D5WHSin1453/ZvhAR1J+xVLRfT1rl9j5YzH/uznRObi8+Gx0rapo4AnAIucujWvH5ic1qbbjod+q1mdZrt4wHjxT74k0lXu+lH7A6fVW1eKrdDUycFZVx34DLt88GDG6bDFIm8gbKNvFMO5PPCtcPe1HK7hvSS8j0MDFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v3 8/9] x86/HVM: skip offline vCPU-s when dumping VMCBs/VMCSes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Message-ID: <5cc8f7e0-399e-f6a5-bc84-823a6160a3f1@suse.com>
Date: Tue, 21 Sep 2021 09:20:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ecc65e8-c135-4a84-0244-08d97cd04ca8
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6671D86909E909C3CD2104FDB3A19@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PspKtaJDObcgXZuFO5ezZYYAMCqnCQ2LFc39jrxaWC9NbppUQE3K97BNrjXFFkCH3xEvrLuwfKpX81wNVBHAE+EDmUrk5oEp2IPRUfYjjJQBQCSLyIb3YtaX4DhEtGxsaMYRCaMJsFUN4sSm3a95FiSSpsUX7eVlIwWuJve8N+lOrMBCCUtbvJRc34kBdISL9vvq5dz7GqyS60MULdD4QRLSJWiF6T7rSAV3OB2Ii+8L38nJjE7tlK3qa3JmgBU+eMRaadh9DkNiL4Hrdn31mP8haTOyW+U7C4UU/sTGEI6BCL0Gq/9DEKbEs+NLPTfZf9P2iFuc9G+BVQKZ3dQ/PhFHVqbuwZxks9XSyca06bsHIiTSMDkFMq2JZkzMs6NnpIsDJWd6UZkIPqi8DlM5e5TXthuKfjikguRYAhOLWUjxhoYybnXzEAZSVkO+5Q3ppQcJ/Rg+J12znDfnH/6Yiiuwbb6R2qp270TqSbOUUnemp61SU7eAvwfjWMpiPaLiqE9cu+d0bUHMe0gYZpradihz6Sd9mZVBI2YPaTw/uIY6xEFmcegqQhR8qiE6Vj5gO1mgqKRA8SeSLMJDL4I0LJKxRdYp0WNDImfysap5ODgAHQ/URUty8P0i5B4e7nBgOEa1/kRxCSKakfcIA+N2JmAeNHblRNjQSrOi7qjDmf//Q1PhY7XmNuqIL1A+t1KE7SvSBkro196sfYcAAnjfddjSQ9xJFfnr36W0Z5iabB0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(5660300002)(36756003)(54906003)(4326008)(8936002)(956004)(31686004)(8676002)(2906002)(6486002)(2616005)(26005)(316002)(38100700002)(186003)(31696002)(508600001)(66476007)(66556008)(86362001)(6916009)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGVYaENLcnJEbUVnRUszN3Bvb0htNnNheXQ5eGMxZnI2TWIvWUNTMDJvNDcw?=
 =?utf-8?B?RHJXSDRhblRUUVRQc1JSdktKM1lWaE5hMmt2aHRTcDEyYmNsYkgrMm5ld29U?=
 =?utf-8?B?ZjMxTGRVN2dQWmxBb01vZkFVUHZ2SzRnVlFOdzlNeHhVNHZLYVJGT1pXcXRy?=
 =?utf-8?B?RWZQSmF4SkFlbHZqYUFISUhtOXYwR2xnYUZWS3hBeCtvQW1WN29RcFR4Q2pZ?=
 =?utf-8?B?b1NwckZITEM1c2Yrd1JPY3pPRC9IZ01VWVJidEVOd0JMV3BFdlM1azdhcGxu?=
 =?utf-8?B?enI3Y09YYmc3S1NSSlNJR2VOa0ZKT0lpNmZIN3RRSWVoUTBMT1BrUGg1QUlW?=
 =?utf-8?B?OWRXOXh1aDhmaktVQXFJYUZkOGR4UDdPd3BMNCswT1VSdnpFT09vNm5BazVa?=
 =?utf-8?B?aW14R3RKZW81UGhZMXV0WlcySzlmbDRTZVRHMEpabnJnNlBzWHZtOXMvMm9E?=
 =?utf-8?B?Y2FuOE8vZ2d6bSt2UnFlMkI5R1l4c2xmZk9pc2RKS3pTT082bTgrbkF3bzZu?=
 =?utf-8?B?bEVTUmt6Lzc0YS9udTdhb2lxSUZ1a2FoU28yOXo3SlVWaXFCMDZwRlc4NWww?=
 =?utf-8?B?VGpGT3ZucjUwS3cwMU0rZWJwcHd4MjdBNGtPYkZ0ZW1GYUs4N2IzQXFhdXox?=
 =?utf-8?B?QzhCMXJvLy8zVk1VTkpiR2RXRVFObWNpS29KZUpTbWZKZ0pjcmFKRWpNREVl?=
 =?utf-8?B?UlBvOHpMeHc3eVNIc1Jzc2xOZGFuUWtodXgwTStjNDU3d2xiaUpjZE1IN3NJ?=
 =?utf-8?B?VU95aG9wdEdJTWZvQi9PVjZMR3NyU2hzR1dzZXpVYWppdEhHV0dXblI2S3k0?=
 =?utf-8?B?a0lJZU40TkhWalFlMHpuMVY1dU9JWTBha2h5VS9uMlR1aG9BMXE3VHozN094?=
 =?utf-8?B?aDBPQnhwbkJDdVVKeU84TDdIT3hlZGc5Mzd6SVU4WVhBd1VZKzNuSmdka1Vl?=
 =?utf-8?B?TndNK2dPY3YyYngxdlFNUUlFUG1PMXpwR2phQ1g5a29uYmdocXFTTUlkWUF0?=
 =?utf-8?B?Y2VrRlh3VEp5OURFa0oxNy9CSnV6dkFZVk45R2pVVmx3ZG5RSUI0aURXWW55?=
 =?utf-8?B?Qnp0d044TWpLZE1uZkVJM2xPTCs1Tm05S01QRkNZM09jTHFrVEp6MGhSWG9h?=
 =?utf-8?B?WnY3QTl2SUYycG5rOGRsUVQ5UHBWc2Q0OHdYejNyYU9vYVZucDRyd2tJbFFN?=
 =?utf-8?B?WDZsQmN0eFFORUpsY0dzbE5EV0xXR2pZZzBxbXhhb1JCTlNKTXI0Vys1RWdk?=
 =?utf-8?B?SlhyMVdDVTRIbnh3ZXFnRnlET1E5MkFod2ZiWmZVN3NQV3JpMk5BZ3RSR2l0?=
 =?utf-8?B?UTExUEFFTHhpdnF2aXhEWmh2MGR2aUVtTi9HWlpucG1kTU92OGljckdvcGlI?=
 =?utf-8?B?TEl4QzRtOEY1OUt0LzRtSmNPZ015ZlY5eGRGYkVYUUZZbmdsQU5jYjkzS29P?=
 =?utf-8?B?a0JXT2Z2dXFpU2phZFBwa083Slg0Q0ljMUQ5MlJuLzU3ZUprQ1VwWUs2N0JE?=
 =?utf-8?B?dGdqQ092TjEvc1crK3JVR1dtWHVad3p0aUNoRW5xMWRpWkhwYTZJUTc4Nllt?=
 =?utf-8?B?aFhWbWFDamNreERFTGNnK2J4cWNscStTOHJzL0ZFWktFUy9OTjg4cXhoc1Fy?=
 =?utf-8?B?TGE1WmRRdjI0RnhSZGJCRHB4QTcyWDJyNkR4Yzk1V0xaOHFMY2hvTFBtTEkx?=
 =?utf-8?B?emhPTlhMSm8zalMxaUgveFVOam9zaWhPYi90QU1iSHFVQjFRR2MveVcyQ2or?=
 =?utf-8?Q?72J/BNvL96YNSman+gYhI/51TxbhvsapIZhkLFB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecc65e8-c135-4a84-0244-08d97cd04ca8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:20:33.2615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgPfGZOkr2v98P9Xz74vU+6aCkg3Sz0TnOE1pZwNrNFjEX2/aWGdX4f0P8Whuu+Sxypi3guUlsgznY+azludWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

There's not really any register state associated with offline vCPU-s, so
avoid spamming the log with largely useless information while still
leaving an indication of the fact.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -242,6 +242,11 @@ static void vmcb_dump(unsigned char ch)
         printk("\n>>> Domain %d <<<\n", d->domain_id);
         for_each_vcpu ( d, v )
         {
+            if ( test_bit(_VPF_down, &v->pause_flags) )
+            {
+                printk("\tVCPU %u: offline\n", v->vcpu_id);
+                continue;
+            }
             printk("\tVCPU %d\n", v->vcpu_id);
             svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
         }
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2133,6 +2133,11 @@ static void vmcs_dump(unsigned char ch)
         printk("\n>>> Domain %d <<<\n", d->domain_id);
         for_each_vcpu ( d, v )
         {
+            if ( test_bit(_VPF_down, &v->pause_flags) )
+            {
+                printk("\tVCPU %u: offline\n", v->vcpu_id);
+                continue;
+            }
             printk("\tVCPU %d\n", v->vcpu_id);
             vmcs_dump_vcpu(v);
         }


