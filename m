Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC69Dc6oHWp+cwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C08621F59
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323937.1589602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oA-0005z4-H9; Mon, 01 Jun 2026 15:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323937.1589602; Mon, 01 Jun 2026 15:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oA-0005wH-E8; Mon, 01 Jun 2026 15:44:06 +0000
Received: by outflank-mailman (input) for mailman id 1323937;
 Mon, 01 Jun 2026 15:44:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wU4o9-0005w8-Bu
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 15:44:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU4o8-00BHZZ-Oj
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:44:04 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8b4-e002-0a2a0a5209dd-0a2a45039e8a-24
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:04 +0200
Received: from [52.101.48.33]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8c2-672d-0a2a45030019-34653021f83b-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:04 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN8PR03MB5027.namprd03.prod.outlook.com (2603:10b6:408:db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 15:43:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 15:43:59 +0000
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
 b=ukFAlDaL32jswUS2sMFEzFpRixRGNfVt3+9PCJzs4In0q8a0XZlGYuGvNpH83wl4WhWb5Qp0UxRXIOvSf4Gi/oVelb7cw5GcyRHSk5C+Zqsi4LQdH42gqrNczDQ7MlVzzlSdCPKg8WmLM05z8dpLdonupLoA30bDEUiXy9G9u+myujXPtscU/Yy+ehxBW57hRwW9b/vGI0FhKckt5ObfJJabVCFfVZXxP2Bmt4r1QLcpiwWbHhFpYwvU9eAZ9KSqp78vMvNCjGR1X2LmBJZ7TwVb9vhQITruec8SdLoQPoTVeLv4a2+QYowarrN2f7Nqv26W5guUAzrBsKeBUFV6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMajRlLCbAEScIMxpT4zuPvcmwWeZONJ/YsZIuTJbIg=;
 b=GYglgufJ/6jWnroPWi9czdcxo3vjXc1OqLBst64oQ48gZNEI8/zwQy1uX4VzvlSDpz/RyjB5dAeYSirFiwU7E2n26Uhx0oqVXHbZ0GRcRnZmiNf3i+GFi8YA4at+22hZ8K/gWbWIOnE/Dp5Pk0iFPCOFdZLDCW+MaJF42a17w2jnnFgHRcP/zQcFLjo9Zd8nX/1jlRxQpswX3bVCYimWgHuRKJ1twlvtX4EwQN0vNfC8MBmMDb3KBagcUOFkWb+mc12sKLLcPEHOQxgXa/HR7isWVmwKCDnJNlqpI9vAgGK0dAmvMaqsZLqLaI96UIbd9erdRQ70ku8moAXVO5/w7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMajRlLCbAEScIMxpT4zuPvcmwWeZONJ/YsZIuTJbIg=;
 b=Dgb0tZ1cRPA2TWnngI2+N8BsEkFBdAmq55O9MS0SBFNTzi63St1DoDdd1sOQNoBiGjNgQR+kN6vEuEuiYaIkZ58/pGe8s29MwdjJ3369MurT6db039A6bO5cWLWNYXgqcvzkqM+hePIY0Ig/Yh12tM0atYJ0R2Xc8037DYtLPtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22 0/5] numa: add unit testing plus fix regression
Date: Mon,  1 Jun 2026 17:43:27 +0200
Message-ID: <20260601154332.30797-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:408:fc::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN8PR03MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: f1123f9f-4a4f-46bf-7d60-08debff498ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	84elEoaJFDVvioO+BckeH2Oq3re+V7f8zeVGh/dfKb4lzMlAKiEaZaUgCHy69V1/Ua2GgfRlEOqXzwAqslvBN0AU6m6RNpZCrJwB/EJA2Gst9Fo/9lq/3NNBYcYQfIzNbo6dkIuESjcShLPpzt+w6SfuV6Sa/ar3S3dsYg9LRI1iXBBePBVcfjfpw29mcf41o/IGSrdvKctUHNXcYevMSOQAh1g3u3RnLQDpEuiIH/9oh3RGr7hNHDgQEMP8QChblhyGFxxENtI3HWR+DBwgtBKvarbngMy7PcrhouXfQYTSdBQey+mwHJO48Kov5lYq10pIfwdAGsSvoTMNJclpSCwwNE4QiexR3a8gqcLIxwt5jiyWOcpJw+ZKg9PxTupKkuMqtAKVMzVWpAxmozZ/I49j3ku6tXdllv9eC0YaCKSC0pN5uEDwCw0vtwpuPuYawrWDNA6UbypMBRG4DoIVKPr5YdcbrA4jOoH8jAf/qqJHStw7IM1QAGulVQlSIe/7LhchPQ19TyHg5u23Y9kR7MgztMfca01dqWvD6x8k1tRrFj4qsjoUVX7tB7ELkjkx+Mw3wUFUVCBhUaNuYbjzzdsfcYYEWeSY3boSUeVW2oP+XTBLRxqPusF4LP18/HPC7jGPpDU1h4C95odQ7VMzFkkH1BpFNvTg4NaHsUCeZ9XrVgTCzXUSJHQz2actPm3N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UCsvWElvUmplWW9qL3Y3anlyWUNzak4yTEo5ZEtqcnZXem43NUhqWS82Y01x?=
 =?utf-8?B?WnQyZVJPWlFjYzh1MHh0b25CZUJONjMyYjVnU3Uxak9nNGpTcjkwOWpURVBY?=
 =?utf-8?B?bmoxM0VmNGlJeXN6YVp4Z2lLaUFYME9zUHpyOENCa25BdUZ1VWhWSGlkeElE?=
 =?utf-8?B?Um9oYnZnd3VVVndWZFFUWGZsY2k1T0NzNjVSbzh2VEw1bDBxSmlVaDVKNzFS?=
 =?utf-8?B?ZDczTTFmV0h4YzlrK1N1eE1OUHlNak9QTHRGL1g0NGZ2Sm4zVUJxNnQ1cXNt?=
 =?utf-8?B?UGM4UXkyVVFDTnp5aURWV3RqbEN2aldGYzJYc0p6TCtUOXRlMWt3NTcvb3Y1?=
 =?utf-8?B?ZjEwUUpaMHhsaDRrNGFmVStUQlZBQUo1T2IrVWovM09oRVVpRXEzM0hMRUp4?=
 =?utf-8?B?a0pjcm84ME44eUUwTTlSemFzOFJpL1JWNlk0M2I2M2VWZFUwSjlocmFEY3I3?=
 =?utf-8?B?T29GazhHb1NZQk1RQllraS9PeDEraWJESm80U3QzL0ZhTzUvZitvcnExeDk4?=
 =?utf-8?B?K2NMaEErSzdIVHN5ZnBoWnlYMVlyM1NITVVMWjc3L3hlcEtyYWhpZVoyOUZ2?=
 =?utf-8?B?a2FneVA3QzhHbEk3TWc0Q2FIL0lXV2RLQTliT1N6ZHV3eExobVhWMG9vMThl?=
 =?utf-8?B?eEVOenlZT3g5QU1yektzeE9zdHd5blMxWlNjVWpuZTNYUG01TWwvMUtSQVkx?=
 =?utf-8?B?T0o4cjlZaXN5cUZOYzNKckxoNUtUWXBwMEN2eVp4aUl5UVFyaHNqajBZbnVK?=
 =?utf-8?B?c2wya3hCZHFvNGlCVE81cXRMVkxPa3REZ0Q4aWpvd3plM3NFUG1UbTdKUTU3?=
 =?utf-8?B?aVlGVWRMcmluVkVxK3creWhYK2xnaHJlSWViY0FwZTQyWmM2VlRkZTYxN1JJ?=
 =?utf-8?B?QktXb0JZSitUeUlkRFZ3dVpEZ3piMWhHN0lvQUpCQ2ZMMnFjRHBzdTZkNmY1?=
 =?utf-8?B?Zjh4MTVkM29RN1Z5QWpZbXAxYlluOTFHTld5VWRFODFzN1BFZTZOZjdwWmN6?=
 =?utf-8?B?OVRrUU41NWJMaS8wZ004VXdSeVpRd3RacWo0M0hadkZYSE9ZWWcvSGpNNFBm?=
 =?utf-8?B?RUdxNm1TVmV3YWRjU1lWM2ZzaE82eXBKNmRvaFFjSmo1WVpkV1RwcEF2VjRZ?=
 =?utf-8?B?bmNBM09vcmJkbmRzbnNVSDB4R0pGYVgzbnNnbjdOVTFGOHR4bERVSFdVRTNm?=
 =?utf-8?B?M0Y5TWVab295UWErdWRobDNrZDF6QUlNZkxJZTRiQ0Y5MjBMcUNyNjhMMERL?=
 =?utf-8?B?VThsbTFzTnBVUXg1Z0VVdjc3VXg2aUpnV1JWOE9aT3V1c21kcnA4RmdkWExN?=
 =?utf-8?B?UkN1TFRzVk5UQzdvbGJtK0VvUWF4dm9OeEVZV0pES0wvdUdrZTNEeFRaMURD?=
 =?utf-8?B?cUpDUTJRTmN3MjJyRHdVVUV2VlIxWWpYSWhNN2p6NWY0N2tnTUlqZzdqRmRG?=
 =?utf-8?B?WjBDNnp3TEx1MXRtdDF6cFBFNytpYTBUOWxGMi9hczNOQmh1dzRrcW5hb2RM?=
 =?utf-8?B?VXdIam9Vb0FoTXdmU2cyUzV0c3JoczU2MjNNVHU1OVFrUkRrVEZDVGFrZS9E?=
 =?utf-8?B?a1k4d1UwWTBncng5TGZVZW5CN1BjbXA5RGdaTm1xNVJUQXFQM3B5eDRaV200?=
 =?utf-8?B?WkdZbjJEdy9TdzlKeUp2cEtIT3Q1Y0dQMkk1WURONDFMT1hvTWxiSDFVd0tw?=
 =?utf-8?B?WjlYcUhpNWZkb2prcFRlUW1vWFA3ZlNZL0ViYUJYeHV6ZHc2UGRRdEhmb1RW?=
 =?utf-8?B?OHV4U2lEajVOa0JjZDJqcGJwRjc4ZENhVktmRkRXQnFXZXNhVVBzT0ZSSU1p?=
 =?utf-8?B?TDhnOWlBQmIxcDNpM2FaaU81MDVVdktCSTVIUnZBWU9RekhyWlJYYmt0dlVy?=
 =?utf-8?B?WUxqL2szZ0d0Qkczc2xlTnpjYVM1dkdqZWU5andqb0V5YTU4UkJrRElZb0dK?=
 =?utf-8?B?WnkxOWNzMHFKVFVXT09VcVZpM3FONzZrT2xsNlg5NTVPbytOUEFBZXFjS05q?=
 =?utf-8?B?T3lQVFlON0JuV3hQRmVJM3FwNWtKdXdITDRBcFIyU0FnWmFMbEZ3K0o4bFFT?=
 =?utf-8?B?ZUNvTnhEQkRtYTZya3hLZC9vT3RYbmpuSVc1YXJxaVlMSDh4SUxrVW9mbG9t?=
 =?utf-8?B?cE9LSy8zM2F6OW90bWhCeEVUY2o3RmJKT3JaK3J4cFJWWWRGb1dsOUs2eHc0?=
 =?utf-8?B?VWtxcExiaXpraHVVNGk3NktCaSsvaXJmSnAxbGo3VGlySzBNcUQ3TXoreUlO?=
 =?utf-8?B?Uk5VT0dwai9EN1RkaXgvMEhJQ3hwNmEvS2J1WjNPTG9mSTQ3YTlWYzkvcEw5?=
 =?utf-8?B?YWRoVkMrK3pvem5sYzdYT3ZlRkNVWHZOcUlFTzRFbHpNUEkyUlJGdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1123f9f-4a4f-46bf-7d60-08debff498ff
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 15:43:59.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1weV1n3bS1ruk40dXg6/vRQnPHMAtPnM09FR0WPZNN9D3LmRyiYaedWH00Bh7bo3G2ZaKhlx9u49E9Ti2PgWFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5027
X-purgate-ID: tlsNG-33051d/1780328644-3AB64938-D4ECFDF7/0/0
X-purgate-type: clean
X-purgate-size: 2418
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:julien@xen.org,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,suse.com,recoil.org,xen.org,amd.com,kernel.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 99C08621F59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

The first 4 patches add some basic unit testing for the NUMA setup
logic.  The last patch expands the test cases and fixes an issue the new
test-cases would otherwise trigger.

Thanks, Roger.

Roger Pau Monne (5):
  tools/bitops: adjust bitmap_or() interface to match hypervisor
  tools/macros: adjust ROUNDUP() interface to match hypervisor
  xen/numa: prepare NUMA setup code for unit testing
  tests/numa: add unit tests for NUMA setup logic
  xen/numa: fix setup of non-aligned memory affinity ranges

 tools/console/daemon/io.c                 |   2 +-
 tools/include/xen-tools/bitops.h          |   7 +-
 tools/include/xen-tools/common-macros.h   |   5 +-
 tools/libs/call/buffer.c                  |   3 +-
 tools/libs/foreignmemory/linux.c          |   2 +-
 tools/libs/gnttab/freebsd.c               |   2 +-
 tools/libs/gnttab/linux.c                 |   2 +-
 tools/libs/guest/xg_core.c                |   2 +-
 tools/libs/guest/xg_dom_arm.c             |   6 +-
 tools/libs/guest/xg_dom_x86.c             |   2 +-
 tools/libs/guest/xg_private.h             |   4 +-
 tools/libs/guest/xg_sr_common.c           |   6 +-
 tools/libs/guest/xg_sr_save.c             |   3 +-
 tools/libs/guest/xg_sr_stream_format.h    |   2 +-
 tools/libs/light/libxl_arm_acpi.c         |  24 +-
 tools/libs/light/libxl_create.c           |   2 +-
 tools/libs/light/libxl_sr_stream_format.h |   2 +-
 tools/libs/light/libxl_stream_read.c      |   2 +-
 tools/libs/light/libxl_stream_write.c     |   4 +-
 tools/misc/xen-mfndump.c                  |   2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c       |   2 +-
 tools/tests/Makefile                      |   1 +
 tools/tests/numa/.gitignore               |   2 +
 tools/tests/numa/Makefile                 |  47 ++++
 tools/tests/numa/harness.h                | 184 +++++++++++++++
 tools/tests/numa/test-numa.c              | 267 ++++++++++++++++++++++
 tools/xenstored/core.c                    |   4 +-
 tools/xenstored/domain.c                  |   9 +-
 tools/xenstored/watch.c                   |   2 +-
 xen/common/numa.c                         |  22 +-
 30 files changed, 569 insertions(+), 55 deletions(-)
 create mode 100644 tools/tests/numa/.gitignore
 create mode 100644 tools/tests/numa/Makefile
 create mode 100644 tools/tests/numa/harness.h
 create mode 100644 tools/tests/numa/test-numa.c

-- 
2.53.0


