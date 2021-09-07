Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D106E402833
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180916.327803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZr8-0005WP-Ve; Tue, 07 Sep 2021 12:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180916.327803; Tue, 07 Sep 2021 12:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZr8-0005Tw-SA; Tue, 07 Sep 2021 12:05:38 +0000
Received: by outflank-mailman (input) for mailman id 180916;
 Tue, 07 Sep 2021 12:05:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZr8-0005SV-3f
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:05:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e906bd04-0fd3-11ec-b0eb-12813bfff9fa;
 Tue, 07 Sep 2021 12:05:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-Yget3GjuOLGL9PuuNgD8PA-1; Tue, 07 Sep 2021 14:05:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 7 Sep
 2021 12:05:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:05:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.6 via Frontend Transport; Tue, 7 Sep 2021 12:05:33 +0000
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
X-Inumbo-ID: e906bd04-0fd3-11ec-b0eb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631016336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxJykJMCxYkJPMtlwaWjGcuTROCQKWVJPc/aqT8Eh6U=;
	b=Qqu5Oz1sA54M2K4Aae9GH0tQHO4H7xzdoYjjHAnCzWtw7/R4rMbAreS8CdJV6ETbUDhXaj
	l9w+bJ36CWazF/pfbxaFRz2Dk/noc5Z6iu/i7jHd0PAKnZnoYdddAryOmTzBbiFIFauijf
	Ghy0HL5p5/FiQKQqmvUi1Y81hwb21W8=
X-MC-Unique: Yget3GjuOLGL9PuuNgD8PA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKFu6bKu5CqvQSsZeH90PTEjoTPDza5A2H7ptd3U9Ujy947lmUS7J7zarX/yebFT2r5weYEr8lIatS5LGhPg2zOjQwTIZQE8y8YaIGX1dZHIaM/J9joZTKEO9i3dNn/5nk+uzdaIKHEad0GzZmATYPIcpmBg+W2D4adXutXdMNq/2yh+YkWo/m9o0xiKBY00pVH27Oa4MoMze2m5zk9BPcqIwXpl8W40PSkqHrN4WxJcq7MvnjGB+Vl1BPJ6kf0uJwFAGoaUc5dxXC5vwYVnYteO7BLsG6Rk9Cf1XajP9ETMFT2jKq1qKZk9CLnVHuc+KYF2WQkqUsnjSr2agYETcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DxJykJMCxYkJPMtlwaWjGcuTROCQKWVJPc/aqT8Eh6U=;
 b=CtXfxloLrJf41/XtEmZDN/7JY/k3ELuF3QgwEngr7bj2W61JXzXipKAJSXG+YqhWSeHRnO9yVVaELJUZ2AdRYhve5uT/0U9cr8Tf/tA+fd/N+WrL1JdEHSfoXd4X0S/64YD1J3/sAVKBOIGVTkHhrdWj0jCzTsj4CiYkqIss/c2XxK9pS2fuxCofiQfaxhOvR97+PK7QVUjaNlskqLyhdZ/nLmRRpRSMuhUfpwzmxYO0EUHjjZpp8sLsbKg+Jpx5PZh9LlmIzrOVfnydcmeHHkp7iVhKQfBrWVKsVQSkiJ7dNNgSE1pnSySVFgIHFYjlyEp1mcgYn+VoP9LygBUMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 04/12] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Message-ID: <397bf325-f81e-e104-6142-e8c9c4955475@suse.com>
Date: Tue, 7 Sep 2021 14:05:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2721335c-c207-4d39-3699-08d971f7cbd0
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260769EFB5BFCBDD444DEC66B3D39@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1AXwpce2ZTGO0h99O41c6qeudTOS+SRO5wPXSIxeSQqn5xKaa/HDMhF7EzO7rOdJPRMv2vJE1sNwkZFL8qbuK8uNsuYMLyJdsfF87d0WYUjUjM9miel40AeQk+cbBAerKT0JKnXLIgPdRTsiipsSTcGPJV9lZN7N3Oe14dMHC/XLleob+6brqFCytjBJrW6A9/yycffL6tDeuxCBHAS0XBzDRKSNdePmn/kDCYYMvubYBHb+6AYctCdtlsC/UeIaC2TStMc37mPlDLv0juBwLbPW7OzIrWUNSJxUvzztahnzfzd43TTmAZaWACfgUSULu7MmBia4ca5AkAWk6M1zXvQ5fa8qbyFKpEM34Opcfh6vtboKa+BUHeUC4Irl7HQdCX++AU6rEie4b8aaSsvSGjUxcJq3dWzCmYf1oalVs61CHP6qcglBAghz4pDtdZdOisHlKtrfhUb+kA2TOzgipqZ19ThXMilurWRYOI4pj9lLVqB0CHYMQjtDKpHibxDoNdWc8zMT+LghZIYcqELm6I9OLL6GVH29IEZi1Bj15pMSxpO60L3aWOXB4bJN26W1xhuMBdWzufo6mGvbs7bdhe2SxpMh2Og0pHiVYPiWkxptBa2ZYSzWofFykcKWPuhnktvSf+obPEBLGBG68hKCiyK3Yb51hz2bRTFKIvYsPKX213vg+HAcIkRjP/7ZENrZaP7ydwuEKG7SMwuD+pYImGcDcZsbI+D0BSySFIZ0Ow8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(346002)(136003)(376002)(396003)(186003)(83380400001)(66476007)(6486002)(31686004)(66946007)(66556008)(26005)(110136005)(54906003)(316002)(16576012)(36756003)(478600001)(2906002)(8936002)(4326008)(86362001)(2616005)(38100700002)(31696002)(956004)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWpXVWZkanNhOERzNlNSV2oxdUJ1dEg5cEdmUm1IbTUzSHF0ckJjTkJXdnR6?=
 =?utf-8?B?MHRjY2FoTTRXK3ZxM1IxTnUyeXIwSTNtWjlFWjA2T3ErRmF0cEsrSW1rWnpC?=
 =?utf-8?B?R2c3QnVITitqdlppVkZHV1kzM1hIZjlGV2FZWWVkSlBjcWFPNHFIcEZFRExE?=
 =?utf-8?B?ODBXNlBqMEZDYnM4MFZSSGlndlZiemsxRVozRmFJb2NUeVF0TTAxeVJiNU9z?=
 =?utf-8?B?YWxYTE1BV2dBek9STGRMYzhOVjNHZFo5TXNFOGhzeHU4aVN0U0ZObzJNNGUv?=
 =?utf-8?B?T2pBUGpxaVU1WTArV1RUbkhzdFltdUczcXpPRnkyUlJaeWlnV1V3OHVVUnFT?=
 =?utf-8?B?aEQ5R2VBQmJaRDNTOXd0UnJFZlNIRVJRQWRVVDQrZkpTZFBUWkFodzFWRFFZ?=
 =?utf-8?B?Z2VrN3NjZUkwTjluRTlkUHUrKzQvWGVUalZTeFV4NjhXZ1pQbHp5SW1mSlZ1?=
 =?utf-8?B?S3FwSXdsYzlXMTc2MkdDNmh2cHFqVlNoeTNVeDJRcHNIUkwvRjY3bjM1NTBs?=
 =?utf-8?B?RXFEUmdrd3c5ckxLWUpPRXFLd2Zhc1EyOWoxbWlaQkIwS3lqdU9XR2N0UVNI?=
 =?utf-8?B?RmRvTUQ1aVp0WGI0alRZdGF5MUZCaS9RSnBIWmhKR3hPZXBLdjRMMFQ0MWlN?=
 =?utf-8?B?bnE1ODdqdlVUVzZkakJJSlpQQ0JyWGN1THY2eTVLK2d4dHBReTRrZjd6NWNh?=
 =?utf-8?B?TnVXTW5TRjRDSzVMeWZ4VjNwaHhHWFJjUTV0WWhwa1BkdzVMSTlxSGNMUVdG?=
 =?utf-8?B?bVU3NnI0NG01ME43ZU5JSFJQcHhNQzdjbHQ3THpHZlFuOE5IMmloR0J0WENx?=
 =?utf-8?B?YkVsM2dsbExQRVpaRmhPZnJiYkhxUGR6SFdtazg5QUM1SEY2ZWw5dWJNaWVR?=
 =?utf-8?B?WHY0NFJ6VC9wNFJxdW02SXM1ZmpzMlhkdWhISEtXT2JaSVRGMFB4U0I5WGZM?=
 =?utf-8?B?Ly9LRFhCMUVsSVhDOVMzMDgzM0FOY0xWSVUxQ2ZMdGE2cU1oZnE2NFNuNHBn?=
 =?utf-8?B?bHNNQlJRWWVVKzZuYlQ5YWpOSWVEMGRVV1UzZlcrSGFFL3A1K1FiQWVzU1lW?=
 =?utf-8?B?ekRyRmIyK0Q5MDBTRk1YYU91VnlMb3hmOGRDN1J2M094aHZSTnpUallwQzAz?=
 =?utf-8?B?bGNqLzZCODdyUTg0WGJwV1c3dmM0V0FIWlBSV092Ri9JRzZtcVJvbDNKbm1R?=
 =?utf-8?B?WFhmUXUvR1pBSklyVjIrd1VjOHNKN1RJVFhGVFA5cDZDM1N2WVRldm1ZU2JY?=
 =?utf-8?B?SHlNOEJ5dXpEcW1jM1lCVTlVamR2Sy9HWDNwNFpvM05Nc3FvVnRMc09DVmxp?=
 =?utf-8?B?S3Myd0tKNjhUL2hNSTRGdjd2UlRlYzk3TjlsOCtHVWJNT24zV3JINzlkem9X?=
 =?utf-8?B?QWpURm5CQkNBTVYwWm56SmFPN1B4d2hPdlFTWGcvWEZDWFIxcWVwY2xTNE8w?=
 =?utf-8?B?M3RoQnNJVnljZUI4QlRncWdIVkM1cHpCNjE4TnBFTWNqVGFSc1Y2VWZvUVMw?=
 =?utf-8?B?Z3F6NHZmT1pscklGRFA3WC9QbU1pVVhUb01EcWsxazkrTVpKRkNPVHMzRkhw?=
 =?utf-8?B?ODA1UjhGRlp6UXNwM0IrMUZEeWxQZVVwQndLYXpEdkFMcXNaS1ZkY3JZMXgr?=
 =?utf-8?B?ek9SZkVSUC9WUVdaSHI0WHNsMEF6Q2R6cmY1VlZ1WllqL0NScmhPeUZOUEdJ?=
 =?utf-8?B?ZHBxZE5Zdk1oOXBaYnM3QWlOSjZZTHpaUk01bEEvYmsxTnFNT2xBbHk2VDJO?=
 =?utf-8?Q?FfRMgDCFQ8QOyre1IYTAe5LHqbtM0mrGv1R0ZK6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2721335c-c207-4d39-3699-08d971f7cbd0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:05:34.1086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EeDANFU13xO+PQ/cQU5CxtYQasUAhqSGaUyX2pGNe+3fdUmKBirWBvRaL+rEloewYWIohN+bVIM7JdbyIpM1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

While the hypervisor hasn't been enforcing this, we would still better
avoid issuing requests with GFNs not aligned to the requested order.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wonder how useful it is to include the alignment in the panic()
message. I further wonder how useful it is to wrap "bytes" in
PAGE_ALIGN(), when it is a multiple of a segment's size anyway (or at
least was supposed to be, prior to "swiotlb-xen: maintain slab count
properly").

--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -231,10 +231,10 @@ retry:
 	/*
 	 * Get IO TLB memory from any location.
 	 */
-	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
+	start = memblock_alloc(PAGE_ALIGN(bytes), IO_TLB_SEGSIZE << IO_TLB_SHIFT);
 	if (!start)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
+		panic("%s: Failed to allocate %lu bytes align=%#x\n",
+		      __func__, PAGE_ALIGN(bytes), IO_TLB_SEGSIZE << IO_TLB_SHIFT);
 
 	/*
 	 * And replace that memory with pages under 4GB.


