Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF37426B74
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 15:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204718.359882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYpaG-00035D-Sj; Fri, 08 Oct 2021 13:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204718.359882; Fri, 08 Oct 2021 13:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYpaG-00032O-Oh; Fri, 08 Oct 2021 13:06:44 +0000
Received: by outflank-mailman (input) for mailman id 204718;
 Fri, 08 Oct 2021 13:06:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aYfl=O4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYpaE-00032I-Ke
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 13:06:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93beff6e-2838-11ec-803a-12813bfff9fa;
 Fri, 08 Oct 2021 13:06:41 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-z8LzDxaiOLOl28PDnbtlPg-1; Fri, 08 Oct 2021 15:06:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 13:06:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 13:06:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0034.eurprd08.prod.outlook.com (2603:10a6:20b:c0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 13:06:37 +0000
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
X-Inumbo-ID: 93beff6e-2838-11ec-803a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633698400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SRBgPmR53QC8PIMULg83d3+h6Qo/+vNFPFVxXxba2Ho=;
	b=WzjJrBLhxrjvUCF4zbLa8xFQnS1VKZyHiQ6TUOoS0/+1jhBNkt6n1ObYSGDhc/fCGZpuI4
	8UAqbiuSSoWCILPHB41WKRQtYiuTDX5EIks9ugm7hwUlShObVi434GKiZ8IUeQREizQze1
	ElJbD9kisdXRhvx5JEGmT6GZRzEB+wY=
X-MC-Unique: z8LzDxaiOLOl28PDnbtlPg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Os2A73Zlqobme7XNMBs+JMGeiu/USRJ04qypcHig71hyJ/pla/quL8V4kC3MnGtVoM3hJEOVd4QD74CsC//c1vSqpFdFpcHAly5qUcGDbtnV6NoruSSJk7xb72BjJM3Y8jA1VCiurhFDXu73E25002l05VsLEaj/NctWPqvjKBPEw584jzdtQPJGGmuKCnaFD9+FVALVTDpE/teHui2a8rhPwRVmJZKSxKrp0b9X5jtOmIz7HlaNqMa2nVeQ4yCobaQE2I2EXMLIUHXOdE7rQ4OIIcFFajxOjec9kQt+X2Al8EPkk86QDJPwkq7uiV9UucuS4wdcv/+RlNKEpo+rdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRBgPmR53QC8PIMULg83d3+h6Qo/+vNFPFVxXxba2Ho=;
 b=hrP4gX5daPmUnQD4SlySXmc596iOh9qyvRhK7jji4u0Zr0kQnhcRmUfZbWNmXQ/66LBZZRk2KjEcC4rHnZH2kjS2r1tU/AIVD2WADBffnZ55lahPhnVpgSlu3YtBP3ri5rPST3roqcyj6OpnSkNx/Ay7AleN3ImwXnnpbhyBjkowVPKYfM/327GBaOU1cM0uBORBGeEs1SEGggw27P6GLoAe8Um2Z4X7u82W89lRoSVB2HreRPKaXd6Kb2xTlZjCtJ8PQubzvgHScOIwTakztbNAiZrjJ8M4TMkVQHlwTy61xGg2oe6JXmYUoS2We8z4c6+VI3itUdfFTrZ5YHe3sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: fix xsm_op for 32-bit guests
Message-ID: <cb3fc8b0-cd60-edc4-7064-0bea87a6c8b6@suse.com>
Date: Fri, 8 Oct 2021 15:06:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0034.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 348b9875-df4b-4233-6f9b-08d98a5c7653
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41916A32763DC0D42CF12092B3B29@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1CTi7WoXYkif7Z2/YkMFPUWzgAzxf894pymmFiRM6KzZwHzS8kH4hy2GWIsa8dtYGcbZtLRkExZ0AJjPh2o4LLYGNxyCThjKy4X0QuzHQp7dJrg7sdHWS09Y/fqHnN9aw63pz66ayYo+hlSUZuWYlfHCRqWnwXUU81cjs84bFVlbL2PFqrAEmaXh7X171nYOy3BVe6cVdet3ACQbUb5LA4Xd+sEtfXLTcQvMgWxj5wzkPXyl5J8ZgAOSTPGImzn0xpDs12BdHekN0cl66CiFR3i5kzcxm/9zSYUMdB58Vh/5zALH/OIjvl1ou6m7gnJnHDvFKzSIT0vfwsi7DITQqMJmNRRqKci7XeJwkgdls+7EZ3ed5/1Aj4F7PXk+ppPRDAoM0sIBPdNDLl3AxC7hW+sTgWwFOQZewjcr+klIPRuZxZBEm/rnv/B11tI1ag1X/Hh0SoXwgOiDkHBUS/k+UMtaKRKIiGFFlAFXZ0MrrHp4pNvoArWEI2p8t6MsBrGpOzBi4NLBXcMy5hPBmFSeiTG7n6tBFeeQFoPkJAgB9WOPKX+pZx++ArZcrz1vcfM2/FesFpgMog6K04fomPA0a51Uqg/mnYbCCII4VH+XHKuVv9QkLX7sqP0dgNod2JjMzX7egr49g0f9rFMEwDtFjo7Kaiy9pMUs7WLzKETgJ9xPerprkO/y9nBmFbgnbPoRq+9iFRHJSFtO6Ee6KjB07UdjP+T0iwTmhn3qZtQnJK5Hq8VWnc+IBjXfmItcEzo0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(8676002)(86362001)(16576012)(54906003)(38100700002)(8936002)(2906002)(6916009)(31696002)(31686004)(36756003)(5660300002)(6486002)(508600001)(66946007)(2616005)(956004)(4326008)(186003)(4744005)(66476007)(66556008)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2gvQi8weEd2Q1VERklsejlJNW9SNFViQXhLb09NVzNIL0txYXF5RlJiZHZY?=
 =?utf-8?B?MXViMHl6VGx5U3EyRHNPSjRLK2doTno4ZU5YYnlZVURLMzMvZWphaW5NVzZJ?=
 =?utf-8?B?Sk80V0NkUnJIcUVlZHpLVVdLc0pRWitPNVN6aE1qUlFHSll2R3RKM2lvNFV0?=
 =?utf-8?B?UEhCTlVnekF0TzRmWktRbE5JOTh6Z2NNNDg5a3V3VVZFRm1OMkNTWjhGQkln?=
 =?utf-8?B?bVBiT1Q3MGNpNnE3cHY2WDdUS3BUeHJYSU1ibDVoYWwrYWxGTVBNcktUZXN5?=
 =?utf-8?B?a3NpV2g5MlBmSjFROTVtalphaVpyWVJ1K25JZGlMV1R5Q3U5SEtaZjR4Z0tv?=
 =?utf-8?B?dmdKcnFqU2FJSjFubTYzVEN2SjJEclUxdE5JR2FBUDFtMFFtWnZLVWtsQWl6?=
 =?utf-8?B?K3JWZ1hheURvNkl2UVBRTHpwWWgwVWVweXYyUVErU3hKUStVSVI5ajFXZVFQ?=
 =?utf-8?B?cXJveXlsTVZYNjJGVTZGdnExL05laTYyL3E2eGxLdTcyRWs5bDJ0VnNlQlli?=
 =?utf-8?B?SGdlanVFQ0Q0QXpqSzNJd1JTZUZJQnBJcDVXWGlqRnc5Z0tlMWxKQ1NobUQ1?=
 =?utf-8?B?dUZJTG41TG95ZzRoTXNsN1ZqNTdCcEVjd2pubEl5RzVCWWxscVE1bDZ4OVpC?=
 =?utf-8?B?TjUzQ0k0Y1NrbjZKTll4cjZ3eU1aOEhjVnZ5YU1jcVlTMXdialNlNmZ5QWhl?=
 =?utf-8?B?cE5lbmxCNWxCR0pFc3hDVFJSVWF4T3BOUloxUlE4cXFuR055L25GK29uTjBO?=
 =?utf-8?B?bTNOY3cwYnptM00zMEV1RjRleXFQL2NnNFYzMFhPdTFoa2pjNEtQNFVzZXJR?=
 =?utf-8?B?MGZGNUtkamhnWkNIU1crdEZYSmNRMklaaE8rZERFTGpoWktMM3ZOVWc5N2Zy?=
 =?utf-8?B?RlZYazFrUkdBSk5qYTE2dUNTNFhXNm1LdS9LV0dTS3FDN2NsUkNzN0pkNjYv?=
 =?utf-8?B?UGVLQnhsblk3alU4WlJweU5ML2FsZ1ZBZEJtRnl4QVFzbEE5ZkIxOGlSZW4r?=
 =?utf-8?B?ek5QRlpWMDdJSjA5VHZkeFhZbkFYOEtQaTFINTRub2Q1bnI2Z0pJeHdTTlBU?=
 =?utf-8?B?cG9ZdUZmdTlqcG9QdjhnbFRtWkdESVEwWHZKdFZCM2dwbGxCeTJTZlZnSkNN?=
 =?utf-8?B?eDM3MmJTQTB6eWxQTjRJQnhsMmQxMFp3a0hJc2tZVFdVa0orSUdBV1A5amxs?=
 =?utf-8?B?VE9lN2thUjdMY2EyUEVJMkpURERXWXg2L3Y3NFFmL2JhTFlPcU53akFDY2Q0?=
 =?utf-8?B?Yi9XZktOZ01RZG1hSWlHYU1kamUwVDEyOVF6NlNzT0E0Nk9aTE54Si9uYVBV?=
 =?utf-8?B?SG1pOWZQbDFiTHR6alcwdlhJS2lzMStQSlA1SUR2WjBVV0twQ3N0WTQxQlhp?=
 =?utf-8?B?TzJYUnpZZk5wR1J0ZVg4c2NzWGdzcmNEaVg0amRYK2tWZHh1NXZ0dUZxSWVk?=
 =?utf-8?B?cU0yQ1pKZEoyZlFjblBPenJ4RERLS243aXNFbndWK3hkb3YvYWRZbTU5WXUv?=
 =?utf-8?B?V2xpVzc5MHhrbHp4d0l6ZEFRZzJnVDdBcnR3MlZBdVdvMGZKOFBtNXNiZ2Uw?=
 =?utf-8?B?bXpkek9wL2tsd0svRXRZTjdYK2YvcEgva3plU3Z4cEo4VXBxZFFVSWpTUlIw?=
 =?utf-8?B?YVpmVkxmL3NoSTlMZWVEUWFtQmp1UFVDOHE5RWFrN0E5ZERuU2x4bFdsTFlZ?=
 =?utf-8?B?RTArcjg2NmtuaEFyWGdnRXJQamVWblNyd2dFOWh0VkdQNmtqWGUvSG1ZZ2VW?=
 =?utf-8?Q?kXfBY1gQIYyU62JeOwDtsc016vEAhBswCqw0XSY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348b9875-df4b-4233-6f9b-08d98a5c7653
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 13:06:37.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umpzNmLPtEooYLHCzhwVZLOa4TDYiMlJghtM/43Q4fsg2oPDFAg9c3/rrv43rwNKdpAP1AglUaw/x4IrDvGowQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

Like for PV, 32-bit guests need to invoke the compat handler, not the
native one.

Fixes: db984809d61b ("hvm: wire up domctl and xsm hypercalls")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -138,7 +138,7 @@ static const struct {
     HYPERCALL(event_channel_op),
     COMPAT_CALL(sched_op),
     COMPAT_CALL(set_timer_op),
-    HYPERCALL(xsm_op),
+    COMPAT_CALL(xsm_op),
     HYPERCALL(hvm_op),
     HYPERCALL(sysctl),
     HYPERCALL(domctl),


