Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b11hByJLPWqm0wgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 17:37:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139856C71CD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 17:37:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=O4t7H08I;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345736.1604489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcm7W-0000bF-FX; Thu, 25 Jun 2026 15:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345736.1604489; Thu, 25 Jun 2026 15:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcm7W-0000Z3-CO; Thu, 25 Jun 2026 15:36:02 +0000
Received: by outflank-mailman (input) for mailman id 1345736;
 Thu, 25 Jun 2026 15:36:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wcm7U-0000Yw-CW
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 15:36:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcm7T-004JVZ-2D
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 17:35:59 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3d4ad0-5cb7-0a2a0a5109dd-0a2a4503abe4-40
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 17:35:58 +0200
Received: from [52.101.52.70]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3d4add-ec1a-0a2a45030019-34653446199b-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 17:35:58 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN8PR03MB5092.namprd03.prod.outlook.com (2603:10b6:408:da::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 15:35:55 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 15:35:55 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/GMcbHLhnhu3I9Ow718P3sqEIztjUFte5yeyZiDdCRTWVK2IBoRJvU35y5oJOmlS2zAMZF5grORI+58TKY/vyRSJbCm2O5DeFTQR4tqNWFHXUf77YeCxDyVnH1my77B1mlOG1MgTLKu6uq78YeF6yWg+COPaZFhYH0YNQ0ywX8ud3HQBVNg1ayUSemSoNTkt5Z40V7WMmTonU6Ze4E2T4nF8PvVLr5O+29AIi9t6eNirnOetElBw4l5SqHfEKtRNOV+ORHBlB33tqTemYUzVkjJR+F78HS7A1UQBjUVwLO1SkBoMCGvEGEkFBuofqGcVcd5j1t6HjNLt75LPlmsVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XN8BmwkWLykHIa8VHYutYH9f2IJU6FyEs2YBbdxLIV8=;
 b=VOtWFJ+z2XX/ueqlgkSUCZNanQjfzVbaAm0CH5GX1YCpviYdL07rkYc/Bg+iTk2Vpe3uAHhvbmTBr9AhRIJa3ICP87/ZRNF7o1HIusnd0evx0ZvtEZk7JjvVugBsXnM4BRIrotFa/0jEn9TrFc0i+Lk2UuAXlPCKL8jH62Cu1lrgOtLZ7GoWpafoe97SmG1+FzWN8ROllz+9M7q9Sb7O6qPf75gO2I3A3iS4wz+9ZwpDhDAMGrWMaYXjcxnGMKq8+HN6LMWTGqNpR6JJkJMiOWhmNtdhq0BjdIlHTEJ5u/mS4rmfgnNGkWOOGov8grx4RgYvpcawnIIEFY+sgsTS3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XN8BmwkWLykHIa8VHYutYH9f2IJU6FyEs2YBbdxLIV8=;
 b=O4t7H08IjiAaxsQ3a9BLBxuAEuvhg99KqBt3Q88ODBGLbHujchzAZFqDXTrcYmQ4BdcuC3CXu0IBisWLal+WA9ovQ7S74qUHXTK48or4WTcfkk0Gy4qYj8Ln9L3HJjMBwn/QcHst8YGL7xyRxq0ynwlpKZcxaO/whKiCm9pwXGs=
Date: Thu, 25 Jun 2026 17:35:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22] char/ns16550: bound execution time of
 ns16550_interrupt()
Message-ID: <aj1K2OerxdkPtqUn@macbook.local>
References: <20260623103145.76383-1-roger.pau@citrix.com>
 <06c8caab-4722-4b02-991f-bdc4a4ac0ea6@suse.com>
 <ajqVNtt02XMUGk-X@macbook.local>
 <cdf9f154-896d-4faa-8c76-ca15cf5e706e@suse.com>
 <ajqsQr-bhf4SGf8Q@macbook.local>
 <d7920786-7424-4634-80f0-994ea2857d1c@suse.com>
 <ajz-GVoEG4toMs3P@macbook.local>
 <2b574332-61f6-4a78-9dea-4b0973c8a3f1@suse.com>
 <aj0oEQ6_g94Rg83D@macbook.local>
 <9db0885e-0257-40ec-bbf9-b242cd953e3a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9db0885e-0257-40ec-bbf9-b242cd953e3a@suse.com>
X-ClientProxiedBy: MA3P292CA0063.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN8PR03MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d8a2c0-61a1-4161-a4fa-08ded2cf7242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	bzYhQtnq6nGQc70EBStLGa95FeXMIzDSVLArelo8okvQPYxgM0dIctUFucfE1VLxqB9KNY95LYXJ8+1x1s06dRuqKJbG5KQUSvG7hrXQqKeZOSKdwhgLlzfl4aVMq65K5M0MIwML5l3im0umqkS/LsojElt0ndSC+UdPhbSy5wrYsEBsvyPCey2okHuoiMCtocyCL0Yg40TPc097KAo/2g+bskeLMi7OhCIWN7e1WIc0G0/QJoCXq801RxjCNnKFKxBScEbg1AHe9lO6Meg7tUqtGgT3lUNXSLk4u7QR93DFjc1Y3PPTanBuRmhoXVsiXTLul9kxTr17JIehw7kMAKIArcXCWGem4014PuW+ki+9RJE5eaqeviND2wAFYdZZfzSfKuDX5p/QchseiD7qpmn0btCsQHQiKppyQPecKdRcN7mxXW5geUdR/CP/d2R2yEjwB898Y1vfpT5UhTY1KDGwzPsOEgDJ+qacjhy0qSpzoNZ4JBxfCATFObMIWwej5sC40BvAe+mQAHva/6eei+rQPH2UZ0IxNVq6J6qGVL31yj6dHFJHMnglEI/bIcL04Q/LvxxTwuaeHiDcEh1TuZ2N8mgV5YGCTcktOSoBnu5BoZ7Jq+Yp9zlqCSU/EB5srWiP3Y/d8OCCwtzHUVyZpJnuEqfXwICUFhT3XMKom50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c240NGpvVFI4NXg1eE1zYlNvOUxsS3lNTGkxYm9jNmVoUVpyY1FYTy8wdmRG?=
 =?utf-8?B?cmgxN3hRUUdXM25SZ1RUd2NGMnI4a0NINWlGNVFMM1FtL3NpOEt0TTQ3Rit3?=
 =?utf-8?B?YnFBZ3ZHNlpJL01laUNXMDJLZDlQemxsSGJQV2llOHlncWhRUWg5TzVqOVNZ?=
 =?utf-8?B?YmpRbVFwaUpvODBVcVkwTE1qNTZUNTcwU0EzTTJta0prVUFRMlZLU2prUEhq?=
 =?utf-8?B?N00yMVRyL21wM2tQUDR5MlI5RW1hd2JaQklZcXFMeHpTRzJiVHNLRVNodVND?=
 =?utf-8?B?Q2MwSGMxdWRhWXdMd2JNQ1hIZ2VrYm5UMnJUclZsaWdkWDlHMWdmTCs2THN5?=
 =?utf-8?B?clJRb3h4OHl5SUdTRzJZL1N0WFMzd1ZWelRNcGxlcnJET3BhOWE5QkxlUmZY?=
 =?utf-8?B?UmZ1VlAyQU1qVkZxOGwvVDVJL1JxVzh3MHhYZUlzRTJmVnhWaW1CMGJVVDB6?=
 =?utf-8?B?TllkNmVmdGxTcXpURURmRjBsK3YyYitNejdUK1pmeUEzRHQ5V0o1Unk4ejRy?=
 =?utf-8?B?RU5jMDNKV3pkbUI2UXVBZ0dITFhCWEwzQkViYndhYWZTS3JnQWxrOTNGMHZr?=
 =?utf-8?B?ek44Y1l6RzBWMmdQM0xNTXNvY1dzM1p1WHp1WHlvdFRKWWo4R3B4MGlXSllC?=
 =?utf-8?B?bVVTR0c3RW8vQ3BCckJuVm1mbUZNemUzVXYzWlY0UENhQytSRCtLTm5CaC9x?=
 =?utf-8?B?ekpIVVFwdG5FWFdvcmduaE82cTh1cFJ2dkZlYm1xWGtKRUtMUTZvakpxQ211?=
 =?utf-8?B?bFI1aFVlVXZaenNsYnR1bnJscnVuT2NHR0Z2bE9DaTJJQ0FRK24vM2t2Vm4r?=
 =?utf-8?B?MEJUbllMWFhzWXQyTEZQYUIvdldsZk1qS3Z5Z1NUZHJrTjh4NTNQR1hsVEZ4?=
 =?utf-8?B?cUVpajZSaURIWjR1eFBCMDBnMlh3cVdmalJuWmVoQW5UT1VQK0MzQnJZUmlw?=
 =?utf-8?B?SnI2Z1NYV1F4cElhR0VlUEIzQTNHRTFsU2ZHQzVGaWUrNWRIZzhTMFU0QzEx?=
 =?utf-8?B?L1gwR21xUS9RMzZsTUZqUUZhN1BaZ1ZpZTRsVHBVRDhhN3VCenhaMmZsUlA3?=
 =?utf-8?B?RFBuTzZNK3NLMm5jSFp5T1AwY2FYOEkxTDJDQmRxYWJPdDRGNzl3WHRUZ0U5?=
 =?utf-8?B?NjhrencrbGJWbU1uckFvTWdidTFyYVhReW5HTmxBcFczczhwRjJQNy9CMXV1?=
 =?utf-8?B?dW1tcUJoYmlDelg0Znk2QWxhWG5YZk5ndTFlNzY2Qi80bVc3U1daZ25XWFpk?=
 =?utf-8?B?MFh3eWhTWFRyTTVaZmFHbzMrb1dINndZL1ZtQlAvNzNCOTVPV1hzZzN0UHpF?=
 =?utf-8?B?Nk9zKzRmQytKaDRmd2VMeDNNenpQalI2Vi9pWnRTWU5VTnpYUnRVTGQyL2Qv?=
 =?utf-8?B?aHBIQzU5cnBoMUd0OFdzNkttaDgwaXBUMTAvTi9KR1lodTBDWWZEdmh0cE9I?=
 =?utf-8?B?YnJwMDJ0QVg2VkZPdk5sMUh0dldObjNKazVkMWk3U250Y2Nnc3FDY1VPbk90?=
 =?utf-8?B?WXJPQUtVQXBReFljc0o2bXg0N2ZtZ0lFdGxyenUwVnNBSE5PelpiU2FFWm01?=
 =?utf-8?B?MlhaY25KZ0VhaDM2V0xxbit3dDZRckwvNTR6bXpld1lRcnRPeHFXMVpaSWpk?=
 =?utf-8?B?UERCQjFIYWJvTnhqYzBpNGorU1NmbTQycWJrcDZ3N3F6ZGlablpoQllGQmVK?=
 =?utf-8?B?SG5KTVJCL1lDbk5xR3djK3poMW12M1RDbWY1cHc5aGhkZ09aOG9qWmx5Qnh3?=
 =?utf-8?B?N0w0MkFKMDNkZ2hXQ25qU0hHZDR5WlNDUUNQOGhJTmtWakg4dTdwSXl5LzZ5?=
 =?utf-8?B?bG8zdEE5cmtSMUU3dzVLQWluSS9LOEZNdXBDWFhFcXF5TE5SNjFMNWJpRmFP?=
 =?utf-8?B?dXlEeTRzZ0ZHNlZOekFYTEs0V2NuaUM2RmR0WU9MajlycTJDZTIvYkdBWmZ3?=
 =?utf-8?B?UDFoSnpDSytiSnVFaUFHcU04V0hEdEdXNDFJSjVndExGMFVFaHV2WVhYV3NK?=
 =?utf-8?B?TDdyei9iV0UyNzdUVkdxUHZ4UXVvRSs4ckVqS04vTDUrZGdtbHBiMGkwZ2F5?=
 =?utf-8?B?VWViYVhERk41Vk9ycnpFc3BuN01Kcm9JUE95QVA0SnI3SlpUQTNtWXFTWXdB?=
 =?utf-8?B?OEpQaTBqSXpsTEpMN0h3am83Q0hrbHphZU11dFZhSXFvT3cyZWVsVlFqUWF2?=
 =?utf-8?B?YnJXVzZTYVlScWd3ZGFsVVNsUmRCS2JhNDVmTGZJNVU5dlNrckhIVlVBRlJU?=
 =?utf-8?B?NGZ4RVc2SVBwZzErai9HZE9EWEdUcW9TbVlkckc5K0VZbDAyYnFYaHU5bW9n?=
 =?utf-8?B?T1BSQkhuRkFVaVNoRVliV2xuZy9tNkFvNi8xUnRrcGxBV0FvbmREQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d8a2c0-61a1-4161-a4fa-08ded2cf7242
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:35:55.2547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhC4fWG1FzIcbrGv6rbPFC1y7UuwNcw+LLqKV/eMNbhYviq1ajzqnwGPYpbygu7sZakGKUrZzoApTyOMrmSoJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5092
X-purgate-ID: tlsNG-33051d/1782401758-05F325D1-D240240F/0/0
X-purgate-type: clean
X-purgate-size: 5888
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 139856C71CD

On Thu, Jun 25, 2026 at 04:32:09PM +0200, Jan Beulich wrote:
> On 25.06.2026 15:07, Roger Pau Monné wrote:
> > On Thu, Jun 25, 2026 at 01:31:26PM +0200, Jan Beulich wrote:
> >> On 25.06.2026 12:08, Roger Pau Monné wrote:
> >>> On Wed, Jun 24, 2026 at 10:01:36AM +0200, Jan Beulich wrote:
> >>>> On 23.06.2026 17:54, Roger Pau Monné wrote:
> >>>>> On Tue, Jun 23, 2026 at 04:27:12PM +0200, Jan Beulich wrote:
> >>>>>> On 23.06.2026 16:16, Roger Pau Monné wrote:
> >>>>>>> On Tue, Jun 23, 2026 at 03:44:06PM +0200, Jan Beulich wrote:
> >>>>>>>> On 23.06.2026 12:31, Roger Pau Monne wrote:
> >>>>>>>>> +    if ( uart->force_polling )
> >>>>>>>>> +        return;
> >>>>>>>>
> >>>>>>>> As the IRQ was disabled, is this even possible? I.e. should this be some
> >>>>>>>> kind of assertion or alike?
> >>>>>>>
> >>>>>>> Hm, I wasn't setting IRQ_DISABLED before, and hence needed this guard.
> >>>>>>> But now with IRQ_DISABLED being set in ->status do_IRQ() should filter
> >>>>>>> any stray interrupts.  I will attempt to add an ASSERT_UNREACHABLE()
> >>>>>>> here.
> >>>>>>
> >>>>>> Simply ASSERT(!uart->force_polling) should do here? It is not wrong to
> >>>>>> run the code below in release builds in such an event. If we kept getting
> >>>>>> interrupts (perhaps at a high frequency) we'd be in trouble anyway.
> >>>>>
> >>>>> No, I'm afraid I can't do it like that, I can't put an ASSERT there,
> >>>>> because we can still get into ns16550_interrupt() after the interrupt
> >>>>> has been disabled.  In do_IRQ() we have the following loop:
> >>>>>
> >>>>>     while ( desc->status & IRQ_PENDING )
> >>>>>     {
> >>>>>         desc->status &= ~IRQ_PENDING;
> >>>>>         spin_unlock_irq(&desc->lock);
> >>>>>
> >>>>>         tsc_in = tb_init_done ? get_cycles() : 0;
> >>>>>         action->handler(irq, action->dev_id);
> >>>>>         TRACE_TIME(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
> >>>>>
> >>>>>         spin_lock_irq(&desc->lock);
> >>>>>     }
> >>>>>
> >>>>> So if the device is generating further interrupts in the window with
> >>>>> IRQs enabled (while we execute the handler), we will keep looping
> >>>>> around this, without taking into account the setting of IRQ_DISABLED.
> >>>>
> >>>> Ah yes.
> >>>>
> >>>>> This is something that we might want to fix, so that the loop is bound
> >>>>> by IRQ_PENDING being set, and IRQ_DISABLED not, ie:
> >>>>>
> >>>>>     while ( (desc->status & (IRQ_PENDING | IRQ_DISABLED)) == IRQ_PENDING )
> >>>>
> >>>> Or perhaps ahead of the loop
> >>>>
> >>>>     desc->status &= ~IRQ_REPLAY;
> >>>>
> >>>>     if ( desc->status & IRQ_DISABLED )
> >>>>         goto out;
> >>>>
> >>>>     desc->status |= IRQ_PENDING;
> >>>>
> >>>>     /*
> >>>>      * Since we set PENDING, if another processor is handling a different
> >>>>      * instance of this same irq, the other processor will take care of it.
> >>>>      */
> >>>>     if ( desc->status & IRQ_INPROGRESS )
> >>>>         goto out;
> >>>>
> >>>>     desc->status |= IRQ_INPROGRESS;
> >>>>
> >>>> thus also having the comment no longer describe only part of the conditional.
> >>>
> >>> I think this is racy.  An interrupt hitting in the window with
> >>> interrupts enabled ahead of the handler having set IRQ_DISABLED will
> >>> still set IRQ_PENDING, and thus the loop would get executed a further
> >>> time, and the handler called after IRQ_DISABLED having been set.
> >>
> >> Hmm, I don't quite agree with how you put it, but I think I see what you mean.
> >> There's one question here, though: If PENDING is set first, and DISABLED only
> >> later, shouldn't that IRQ instance still be handled? If so, ...
> >>
> >>> I think we need an extra condition in the loop, I see no way this can
> >>> be solved only by dealing with the concurrent setting of IRQ_PENDING.
> >>
> >> ... such an extra condition would be wrong. If not, yes, I agree.
> > 
> > But PENDING is always set, regardless of whether the IRQ is disabled,
> > the normal flow in do_IRQ() is:
> > 
> >     desc->status |= IRQ_PENDING;
> > 
> >     /*
> >      * Since we set PENDING, if another processor is handling a different
> >      * instance of this same irq, the other processor will take care of it.
> >      */
> >     if ( desc->status & (IRQ_DISABLED | IRQ_INPROGRESS) )
> >         goto out;
> 
> Well, see the adjusted flow I did suggest earlier (still in context above).

But that flow above could still set PENDING ahead of the handler
having set DISABLED, and hence won't avoid at least an extra handler
call despite the IRQ having been disabled?  IOW: I think it's
partially racy w.r.t setting DISABLED in the handler.

> > I think it's valid to have both PENDING and DISABLED set with the
> > current logic.  In fact, the code in ack_edge_ioapic_irq() relies on
> > having both PENDING and DISABLED set to mask the source, as the
> > ->disable hook for edge triggered IO-APIC pins is a no-op.
> 
> Yet this can be of use for a corner case only anyway, as we set PENDING only
> after having called ->ack(). That is, after setting PENDING _another_ IRQ
> has to fire. Which is possible, but likely can be dealt with differently.

Well, if the ->disable handler wasn't a no-op for edge triggered
interrupts it wouldn't require this weird logic.  However then IRQ
migration will likely involve a mask/unmask for edge triggered
interrupts, which we want to avoid in general.  I would need to think
about it.

> > We could likely change all this to be more straight forward, but as
> > with the serial interrupt handling I would rather not do that change
> > during a code freeze.
> 
> I definitely agree here. So perhaps indeed best to go with what you did
> proposed.

Thanks, let me see if I can sort out a minimally invasive solution.

Regards, Roger.

