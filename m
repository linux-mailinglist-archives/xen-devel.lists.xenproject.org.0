Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PpqCZWq6GnEOQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:01:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58CE44510B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290273.1569900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVKO-0006oe-GA; Wed, 22 Apr 2026 11:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290273.1569900; Wed, 22 Apr 2026 11:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVKO-0006m4-DE; Wed, 22 Apr 2026 11:01:08 +0000
Received: by outflank-mailman (input) for mailman id 1290273;
 Wed, 22 Apr 2026 11:01:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wFVKN-0006ly-2H
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:01:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFVKM-00AijY-ER
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:01:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e8aa65-2eae-0a2a0a5409dd-0a2a4503809c-32
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:01:06 +0200
Received: from [40.93.198.65]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e8aa70-672d-0a2a45030019-285dc6416a6a-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:01:05 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5101.namprd03.prod.outlook.com (2603:10b6:208:1b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 11:01:02 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 11:01:02 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6zeL37Z5UJCHN7MH/M+H99NphorwF59/kwCypoJAKc+Es1a0ovD15sEdjruVnOsRrUc0Z8Gq4FEZweerFtTekIse6YOnp74u5O9zAJrDlcq4BM0xysjFZN8SLOskyZeNPP/FbNxL3qaui7HJrADzeTO0+0Fby9ABONicQExmhq4nwzYf7GOgN0/Jhd7CT5y/2yyvYvllmbN96NXRg61MC2UbgZknFt9MO7pmZ+Q35rz/cDT9y7zX5YJ8/l8ULHBOhAIbg4esWHP+liLpC2zNSs8+/1mmtekB2wFI9a9PjcR1lrQlNXvPvZ/JLBBV8Dz1cR2kjnoihoML8Wt7mOsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCepYLEywSqiYahjV2c6+lsNMx0TrGfpuUvVztQBYZc=;
 b=e3MH+1UhvYYy3AKPiflkaRN2vuE7hWMI+X+B9qSX+ONjuPViDdG+h1UrTe0/z/pHp/ZiPbC30WHwDgbhvvtAUKeRqTETLUZGv90kpAbp58V5gV8Ln7leTE8JRQHTHxi5/DXvjEDmgsXsSajRf7KonrNUGOPnnKY5Ge8pI5wOTvGgznt6fqxFJMZ7CqDPnj56wAbSfPLWhwNyaXndqT8r2rhqrX4/ZztmpQebL9j4Awe+EwlCMJM1Huu4xwZvHOpbbZAAMCgPGZMWHbJuJtWRIhbpJ9C/2FAl+35RpNCNgcv3h5YIZMcrWgkoxDLIVG9zco125ehIbPi2Nzdv5B//oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCepYLEywSqiYahjV2c6+lsNMx0TrGfpuUvVztQBYZc=;
 b=hpvOXaJvMDufMQKPN7SX+Z5KIwm8b8Q0ZGe19wts9oyLtoC1RncvVNpuHC7kvnH2/Y+srqSMj1Dmk97UP4j4zvFkDyt4f4uSkSdJXf2HCwcxtonSH2bjfWsP7KDtCIZunz5+SOqDpheA9hLkktxZPc4Oc+CwiwRdWNNNNcTFkvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Apr 2026 13:00:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 3/7] vpci: Use pervcpu ranges for BAR mapping
Message-ID: <aeiqayUd4sLNEPGG@macbook.local>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <51223761a1f2b8f1e901062d1e59dad934300f0e.1775742115.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51223761a1f2b8f1e901062d1e59dad934300f0e.1775742115.git.mykyta_poturai@epam.com>
X-ClientProxiedBy: BN9P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::32) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4433f5-823d-4d2f-a3ab-08dea05e7105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hh0IfO69xJijgZ0EFu5+G/5N9WfWP9VtIS74qEV0n/yWhZNUOCRbyRDvwW92KCsC6gLO8a6iTrtiEynIvZEn8hZFtciBCK/kn1DEWqf5El1L1sFXdxYIZjfRTu9ffrof0gZQzjgWh06JQJHOUi4zRjJ+KW+hX1qFGg1/FW7+n7BrYeBgyhxEDAYBqI9L9x8D5ru3Z86oSo/KreWXm5QmBfmArkbbMGc3ofzCQs4RIOOz+n6pZ3NPM0wqc1IvVytNGV2tFl4QYUGLsQN9+vY44r5QQcmpiHt7NgSuWZqDXa3cnwzlz+iKtvFptTk+9/4VmxTl/rRFpqDdnWpPB5Oi/EbVQMFlvMN4Qb5R0WDhF29l8TLZ5gXkz3ZiVBEl2o6bXu7TouvdzgWIB9hvDEKSQTmxkVZDccRNjO8lMR7jPJK9rBVPw0C5kQWZlRjWYq9Rx8+8ctntO2OotxDiJ6jRM3YeqLt8hD6X05UNR7yCz2XUDfsYLcquUT/N8bQGshENN/e5bMIUP/XdP7x8I7jUsXdK20SPUKO3YRGHwCIpf6Deb/guF0RZjzj/cNiLsJVcGp0tM90qY079DTO/5hotbETFScic1ctu7+7xYzStGkVdQmhyd+4pYKw/3zaeGFKY/eKg5NgYikN8TkOLy0C4tg3x9ws55QydfFCr8OwsDp3SunXVSekGF8q6ADciLfq1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGE5eVBjZ2VUSmJzRnUrVkEzL0JlVVBZRHJ6ZkgyQ1ZTdlE4WjBxdlpSNFRk?=
 =?utf-8?B?NmtVRUJUU1JMMDZ0RmFvOEtzb0Q0TXM2OTRnL2llSnRUYjVJR0lPUnBCeGxt?=
 =?utf-8?B?dElGODVCT3JObG1ZRXh0cFdxUGJxUVBJbUEyMjJ4VS9lUHB1d2t6NU8vczc2?=
 =?utf-8?B?U3o3VVJKbVB0cWlpdnRwUFhiS0I2WlFBejBWYkVobERpSTc1YXBUaS9jS2Jt?=
 =?utf-8?B?alQwUDRiMlhyWW9ZbHczRURNV2YreGFCMUVhYVM0alFhdEZxOWdCUVM1MG16?=
 =?utf-8?B?cU1kdGtQZkY1dHJieU9NTC9ZdDhMRWdNRHdMbjVabmJ3M0N2WDc2OEhnT05N?=
 =?utf-8?B?ZVFTRFZndzJhVHBBK1V1ZlBWOXVReVVBUzlwZnNyMkM5ZktsaE9zVkszaVAw?=
 =?utf-8?B?eUtMbWt5T0Z2dEVGc2I5Q2wxSVc1MzdsRXJJVFRYZEpaL0lMa0UvZzR6YnZK?=
 =?utf-8?B?L3dLVDdxKzhYenNraHZxaHU4MEFpekFQMmRxOWxacjVXbWszZ3JjT1FIZ010?=
 =?utf-8?B?MTJpN3FFdDVOWW1Zd2xDVU5sS1NiUjY1WGd6a3htVjd4QzZRcDRqT21OdElD?=
 =?utf-8?B?MlBBVjFIbExpOGYxVmpxQXFnVnI2S1VrZ21uRDhGdDdzNHNSOUhJRUZSSGtY?=
 =?utf-8?B?eE1BS01OM3ZMQy9IMzY2S1lGN0c3NUxrUnNqMjJmejJHLytIL3htMERMUXpZ?=
 =?utf-8?B?TW41YzVjSVRBbTArUWFmUU4rcDg5SVBKTnAzaSszSzFLMWQrQUwrUlZDb3dU?=
 =?utf-8?B?QmFGN1haU3V0YmFzeksyc0tONTF0SkVkZGxDVGF6TDYvRXZqYWsycTMrQzlK?=
 =?utf-8?B?azh3UkNiSVR5bWlPQWtFVzlEYmN4clNXa2NTeG5hemlHV1I2UzljTDZHNGZq?=
 =?utf-8?B?NElBOGg2aldMN2xvQXA0QmZ3VzhpYk5aUlZKT2pyVGJsSVNXcVRUNUdrc1ZI?=
 =?utf-8?B?RHFHbEhURHBqWDRmKzhGTVJCckoyUkhHcHBwaDBJdU5IV3R5bmtFUzU1NmVT?=
 =?utf-8?B?dkZvUGQvblcxdXFRdExWY0NLMG1uanQybU5wSWhhR2J3Y0RvVFlTM0xEUTNL?=
 =?utf-8?B?VkJkbGV6Sk1xRlp4dDBKenE4MThPYmJEY3IwdldUeWMwTjBaOVZLVmFDMG55?=
 =?utf-8?B?US92Vlo3RVE1a3BINGNMNjRta0o1bWg3L3dSVmlqbUJHSFgwckV1Wm1DelVy?=
 =?utf-8?B?ekhOREdYSElqU3ZzeXh0WWg2WnBtazdLc0prdjYwVDB6NTBHdHVqZ1FaUEtP?=
 =?utf-8?B?Ky9YMk1pV3YyV091UWhJU0VSb0R5RWRwM1dyWEpSbVRxNkFWRkZHMU91Qlhi?=
 =?utf-8?B?VjJ2eVVIY2xTem1ORFMrcjZ6a2RVV0pYUkI2Qis3UE1obG0rYW1RTk5JNUtn?=
 =?utf-8?B?TXg0bGlab1JvZ1RPcWdVUG9ZYUxtaWdpVTdTYTlJWUtGU2xsdEMvKzVWTXFn?=
 =?utf-8?B?dkNlOCtPSVQvNEJrM1RYSEFhRmF0OFdoWHpKdHB4QVA2QzhWNDk4WWYrUW9L?=
 =?utf-8?B?ZTk1MWNzYUsyL0p4OW54akkrTmhZK1lwdXQvZ3pjaWl5Y3ZUNjEvN2RWSHVB?=
 =?utf-8?B?OHZjVThla1NVOExSdHRVODEzSEN6d1BqbzZlS0ZoMXExNlRNeFB1aCtVTE5t?=
 =?utf-8?B?czNYamdXSnc3MFNtY0ZCaWpxYmtJZ0ZVMW04Ni9YNERNL3l5N3M3eCtIMW9q?=
 =?utf-8?B?K3VjaEtWRE9NdlpZNlFlWUhXSzZCRnNGK3A1ZVBCK3U0cEtXY2xOcHc5MzZ0?=
 =?utf-8?B?RlRSb1hOcUJ5V0tJRnBFMTR6NWNvaWV4WXVqcjNkUllyaDVZZGp6aGFkQVlm?=
 =?utf-8?B?ZklJOGFPTTIrWkFJaWRFYmg0c0ZGRnhITERXV2txajFPV1ZDT2R3VHNzZUlS?=
 =?utf-8?B?MGx2WXNFRVhrci9zVDlnSzRDTi9PekZvb2U2cG1UTDZCUWtZN2QwMmlDSGR3?=
 =?utf-8?B?dGp5bjVCYWdGMzE4RkZCYlJUWEZMK205ZTQzcTh6MGJkSmR3NWI2eTllZlUr?=
 =?utf-8?B?cXVFckM3WWpVZHl6YnhTSkoxQUZWdG56WEsxOUQvZC9kL1hPTDc5UVFCcW40?=
 =?utf-8?B?Vk1YZ3AydmNjb1JTSXl0ZUdzTEhPTnJRYWxrKzJMTkNmN3BUbWQybytUT3BE?=
 =?utf-8?B?VUZkYkFoTlloVi93ZnJGUDF1Z0w3TTl4VUZXY1o2NU5pU2d0S0tBMGgzVlFL?=
 =?utf-8?B?TTIyb0dTK1RsRCtOamtFZlQ3cnNSYzQwbC9YMVhaemtOQXdQaWY0d3lKaHJn?=
 =?utf-8?B?cldrMGZlWklPYnNwZTd5clJoekV3L0RubzdPQTQzWjJBdmVVS2hvbCtaOWtt?=
 =?utf-8?B?WnRhNTJtbHE0SWpMUmdTSFhoKzYrcE90elEyVDZqWkVRemNDQTgyQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4433f5-823d-4d2f-a3ab-08dea05e7105
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:01:01.9360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: To7wV7gIozPLTVSxMD8tLZTpnq02Zzj1kDpXO1xI6+EqLkvq+rIdRI7k7UHTF/vZMjdYm5DXBuv92LK+iPvC3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5101
X-purgate-ID: tlsNG-33051d/1776855666-28149938-64029194/0/0
X-purgate-type: clean
X-purgate-size: 14210
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[patchew.org:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:dkim]
X-Rspamd-Queue-Id: C58CE44510B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 02:01:33PM +0000, Mykyta Poturai wrote:
> From: Mykyta Poturai <Mykyta_Poturai@epam.com>
> 
> There is no need to store ranges for each PCI device, as they are only
> used during the mapping/unmapping process and can be reused for each
> device. This also allows to avoid the need to allocate and destroy
> rangesets for each device.
> 
> Move the rangesets from struct vpci_bar to struct vpci_vcpu and perform
> (de-)allocation with vcpu (de-)allocation. Introduce RANGESET_DESTROY()
> macro to free a rangeset and set the pointer to NULL.

While this obviously has advantatges when multiple PCI devices are
assigned to a single domain (ie: for the hardware domain), it's
actually consuming more memory in the domU case if a single device is
assigned to the domain, and it has more than one vCPU.

I'm not saying it's bad per-se, but it's not obviously such an
improvement IMO.  With the current approach we know Xen will allocate
an amount of rangesets that's bound to the amount of PCI devices
(nr_rangesets = nr_pci_devs * NR_BARS), but with this approach the
amount of allocated rangesets depends on the number of vCPUs, and
hence it's no longer bound by the hardware anymore.

I assume that this will change further to support SR-IOV devices that
might have even more VF BARs per PF, so I have to look at further
patches.

> Amends: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v2->v3:
> * synced with BAR write with memory decoding enabled series[1]
> * add Amends tag
> * remove unused variable i due to rebasing over 998060dd9101 ("vPCI:
>   move vpci_init_capabilities() to a separate file")
> * enclose entire struct vpci_vcpu inside #ifdef __XEN__
> * s/bar_mem/mem/
> * use ARRAY_SIZE
> * put init/destroy in functions
> * only allocate for domains with vPCI and idle domain
> * replace 'if ( !mem ) continue;' with ASSERT
> 
> v1->v2
> * new patch
> 
> [1]: https://patchew.org/Xen/20260406191203.97662-1-stewart.hildebrand@amd.com/
> ---
>  xen/common/domain.c        |  5 +++
>  xen/drivers/vpci/header.c  | 67 ++++++++++++++------------------------
>  xen/drivers/vpci/vpci.c    | 34 ++++++++++++++++---
>  xen/include/xen/rangeset.h |  7 ++++
>  xen/include/xen/vpci.h     | 10 ++++--
>  5 files changed, 73 insertions(+), 50 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index bb9e210c28..5ef7db8f09 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -455,6 +455,8 @@ static int vcpu_teardown(struct vcpu *v)
>   */
>  static void vcpu_destroy(struct vcpu *v)
>  {
> +    vpci_vcpu_destroy(v);
> +
>      free_vcpu_struct(v);
>  }
>  
> @@ -512,6 +514,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>      if ( arch_vcpu_create(v) != 0 )
>          goto fail_sched;
>  
> +    if ( vpci_vcpu_init(v) )
> +        goto fail_sched;
> +
>      d->vcpu[vcpu_id] = v;
>      if ( vcpu_id != 0 )
>      {
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 5d5ba5c016..5bfb541b6a 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -196,6 +196,7 @@ bool vpci_process_pending(struct vcpu *v)
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct rangeset *mem = v->vpci.mem[i];
>          struct map_data data = {
>              .d = v->domain,
>              .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> @@ -203,10 +204,10 @@ bool vpci_process_pending(struct vcpu *v)
>          };
>          int rc;
>  
> -        if ( rangeset_is_empty(bar->mem) )
> +        if ( rangeset_is_empty(mem) )
>              continue;
>  
> -        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
> +        rc = rangeset_consume_ranges(mem, map_range, &data);
>  
>          if ( rc == -ERESTART )
>          {
> @@ -224,8 +225,8 @@ bool vpci_process_pending(struct vcpu *v)
>  
>              /* Clean all the rangesets */
>              for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> -                if ( !rangeset_is_empty(header->bars[i].mem) )
> -                     rangeset_purge(header->bars[i].mem);
> +                if ( !rangeset_is_empty(v->vpci.mem[i]) )
> +                     rangeset_purge(v->vpci.mem[i]);
>  
>              v->vpci.pdev = NULL;
>  
> @@ -260,13 +261,14 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct rangeset *mem = current->vpci.mem[i];
>          struct map_data data = { .d = d, .map = true, .bar = bar };
>  
> -        if ( rangeset_is_empty(bar->mem) )
> +        if ( rangeset_is_empty(mem) )
>              continue;
>  
> -        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
> -                                              &data)) == -ERESTART )
> +        while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) ==
> +                -ERESTART )
>          {
>              /*
>               * It's safe to drop and reacquire the lock in this context
> @@ -331,13 +333,13 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct rangeset *mem = current->vpci.mem[i];
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>          unsigned long start_guest = PFN_DOWN(bar->guest_addr);
>          unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
>  
> -        if ( !bar->mem )
> -            continue;
> +        ASSERT(mem);
>  
>          if ( !MAPPABLE_BAR(bar) ||
>               (rom_only ? bar->type != VPCI_BAR_ROM
> @@ -354,7 +356,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              continue;
>          }
>  
> -        ASSERT(rangeset_is_empty(bar->mem));
> +        ASSERT(rangeset_is_empty(mem));
>  
>          /*
>           * Make sure that the guest set address has the same page offset
> @@ -369,7 +371,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              return -EINVAL;
>          }
>  
> -        rc = rangeset_add_range(bar->mem, start_guest, end_guest);
> +        rc = rangeset_add_range(mem, start_guest, end_guest);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
> @@ -380,12 +382,12 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          /* Check for overlap with the already setup BAR ranges. */
>          for ( j = 0; j < i; j++ )
>          {
> -            struct vpci_bar *prev_bar = &header->bars[j];
> +            struct rangeset *prev_mem = current->vpci.mem[j];
>  
> -            if ( rangeset_is_empty(prev_bar->mem) )
> +            if ( rangeset_is_empty(prev_mem) )
>                  continue;
>  
> -            rc = rangeset_remove_range(prev_bar->mem, start_guest, end_guest);
> +            rc = rangeset_remove_range(prev_mem, start_guest, end_guest);
>              if ( rc )
>              {
>                  gprintk(XENLOG_WARNING,
> @@ -395,7 +397,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              }
>          }
>  
> -        rc = pci_sanitize_bar_memory(bar->mem);
> +        rc = pci_sanitize_bar_memory(mem);
>          if ( rc )
>          {
>              gprintk(XENLOG_WARNING,
> @@ -412,14 +414,14 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>                                       vmsix_table_size(pdev->vpci, i) - 1);
>  
> -        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
> +        for ( j = 0; j < ARRAY_SIZE(current->vpci.mem); j++ )

You make a non-trivial use of current in vpci_modify_bars(), maybe you
should consider introducing a local variable for it:

struct *vcpu curr = current;

current expands to a call to get_cpu_info(9, which is better to avoid
doing repeatedly, specially in the context above which is used as a
loop upper bound.

>          {
> -            const struct vpci_bar *bar = &header->bars[j];
> +            struct rangeset *mem = current->vpci.mem[j];
>  
> -            if ( rangeset_is_empty(bar->mem) )
> +            if ( rangeset_is_empty(mem) )
>                  continue;
>  
> -            rc = rangeset_remove_range(bar->mem, start, end);
> +            rc = rangeset_remove_range(mem, start, end);
>              if ( rc )
>              {
>                  gprintk(XENLOG_WARNING,
> @@ -469,8 +471,9 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
>                  {
>                      const struct vpci_bar *bar = &header->bars[j];
> +                    struct rangeset *mem = current->vpci.mem[j];
>  
> -                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
> +                    if ( !rangeset_overlaps_range(mem, start, end) ||
>                           /*
>                            * If only the ROM enable bit is toggled check against
>                            * other BARs in the same device for overlaps, but not
> @@ -481,7 +484,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                            bar->type == VPCI_BAR_ROM) )
>                          continue;
>  
> -                    rc = rangeset_remove_range(bar->mem, start, end);
> +                    rc = rangeset_remove_range(mem, start, end);
>                      if ( rc )
>                      {
>                          gprintk(XENLOG_WARNING,
> @@ -734,18 +737,6 @@ static void cf_check rom_write(
>      }
>  }
>  
> -static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
> -                            unsigned int i)
> -{
> -    char str[32];
> -
> -    snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
> -
> -    bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
> -
> -    return !bar->mem ? -ENOMEM : 0;
> -}
> -
>  int vpci_init_header(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
> @@ -856,10 +847,6 @@ int vpci_init_header(struct pci_dev *pdev)
>          else
>              bars[i].type = VPCI_BAR_MEM32;
>  
> -        rc = bar_add_rangeset(pdev, &bars[i], i);
> -        if ( rc )
> -            goto fail;
> -
>          rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
>                                (i == num_bars - 1) ? PCI_BAR_LAST : 0);
>          if ( rc < 0 )
> @@ -913,12 +900,6 @@ int vpci_init_header(struct pci_dev *pdev)
>                                 4, rom);
>          if ( rc )
>              rom->type = VPCI_BAR_EMPTY;
> -        else
> -        {
> -            rc = bar_add_rangeset(pdev, rom, num_bars);
> -            if ( rc )
> -                goto fail;
> -        }
>      }
>      else if ( !is_hwdom )
>      {
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 0ac9ec8b04..d069ca6d9c 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -24,6 +24,35 @@
>  
>  #ifdef __XEN__
>  
> +void vpci_vcpu_destroy(struct vcpu *v)
> +{
> +    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
> +        return;
> +
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
> +        RANGESET_DESTROY(v->vpci.mem[i]);
> +}
> +
> +int vpci_vcpu_init(struct vcpu *v)
> +{
> +    unsigned int i;
> +
> +    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
> +        return 0;
> +
> +    for ( i = 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
> +    {
> +        char str[32];
> +
> +        snprintf(str, sizeof(str), "%pv:BAR%u", v, i);
> +        v->vpci.mem[i] = rangeset_new(v->domain, str, RANGESETF_no_print);
> +        if ( !v->vpci.mem[i] )
> +            return -ENOMEM;
> +    }
> +
> +    return 0;
> +}
> +
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>  static int assign_virtual_sbdf(struct pci_dev *pdev)
>  {
> @@ -89,8 +118,6 @@ struct vpci_register *vpci_get_register(const struct vpci *vpci,
>  
>  void vpci_deassign_device(struct pci_dev *pdev)
>  {
> -    unsigned int i;
> -
>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>  
>      if ( !has_vpci(pdev->domain) || !pdev->vpci )
> @@ -116,9 +143,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
>      }
>      spin_unlock(&pdev->vpci->lock);
>  
> -    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
> -        rangeset_destroy(pdev->vpci->header.bars[i].mem);
> -
>      xfree(pdev->vpci);
>      pdev->vpci = NULL;
>  }
> diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
> index 817505badf..f01e00ec92 100644
> --- a/xen/include/xen/rangeset.h
> +++ b/xen/include/xen/rangeset.h
> @@ -40,6 +40,13 @@ struct rangeset *rangeset_new(
>  void rangeset_destroy(
>      struct rangeset *r);
>  
> +/* Destroy a rangeset, and zero the pointer to it. */
> +#define RANGESET_DESTROY(r)  \
> +    ({                       \
> +        rangeset_destroy(r); \
> +        (r) = NULL;          \

You want to use a construct similar to what XFREE() does:

#define RANGESET_DESTROY(r) do {            \
    struct rangeset *_r_ = (r);             \
    (r) = NULL;                             \
    rangeset_destroy(_r_);                  \
} while ( false )

After the GhostRace vulnerability we NULL the variable before freeing
the data associated with it.

Thanks, Roger.

