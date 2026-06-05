Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EGiqGp93ImqlXwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:15:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C94645DAA
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:15:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=WAiNuWtv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329017.1593229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOmB-0006pT-GE; Fri, 05 Jun 2026 07:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329017.1593229; Fri, 05 Jun 2026 07:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOmB-0006nE-CR; Fri, 05 Jun 2026 07:15:31 +0000
Received: by outflank-mailman (input) for mailman id 1329017;
 Fri, 05 Jun 2026 07:15:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVOm9-0006n6-Rg
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:15:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVOm9-00CluL-8O
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:15:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a22778d-bab6-0a2a0a5309dd-0a2a4505b7f8-12
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:15:29 +0200
Received: from [52.101.48.47]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a22778f-aaa8-0a2a45050019-3465302fc119-4
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:15:28 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA0PR03MB5497.namprd03.prod.outlook.com (2603:10b6:806:b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 07:15:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 07:15:25 +0000
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
 b=Js9naY11l5p/bjnsG27HQadEwItKZo29VLIqqqbCWLVNG5S3LI2KyXSmi1FPOCoaM0ZFMg30+FaKcuCV+UBI1nRWjWgqFgrAKOETECaixjmVMKYzE35+vQgbSh/8+z+4dGkuUhUh0dGDLdCFoq4gGoQ0P72q/JchYEqQKSToRKGwAdXHiyBbnif9tzpv4oJ4dp18qw3kfEoDU5ivS8esU8Mi0iA8xF6l9+3812PBdEasrJAv8hwVCMY5lWp+E0nSx8QlQuhglAQPf8f7EhebKU1uxNhj/AWDxxywGS1P3ZF700VwzSPJ6LItryoAp9mx9f1U1OD1XURo1ZwR5zWsog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30fozm6A/bKyQinnVzT7x3JnIMxf65qcUB9fnk3kPWc=;
 b=emUkrR+jmg2IF7ps1G+mlRQcemCS1KvxuyAozgEDugaIbmxA9DBkUU1Ax0rbq+2FdaX8NwmFmQKSlUbFoI1gLi3mZRTJOAWEnZzQKokIA4u4MKPe4FlG2D2mwkbe8U44jE9c23wrgK5FE/baWekDpVHcNxzSFBxv+xSKzZnLoPVBEq1YLn60rqDD1pwRMpSN3pnKxQ7hJDV5o4rYHWtjFc4snYt1urRb0KvLoj8nWLm093FvPYIM0pDe2LIUV+//GAmZX00Km3FtcWC3WN+TEUAdZ2TO+2Ii/g66KXs3SJFpygGcKuJiHikNvjxFSkf8JxnCOUP0Tg2W5TeMbrUarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30fozm6A/bKyQinnVzT7x3JnIMxf65qcUB9fnk3kPWc=;
 b=WAiNuWtvhdU3kc6d32AWCupJnaoQp4SgQrx9Jb3HBg+hGD+SzdM3B4OnftwZy1WKblGC4Jn9u72BIwNeD1Y8R8e4gHWjAmGK+JqEOyn2BKYWzvMjU9yhuenXprYSHsG7N7aFoGyxmx8rNLxFuzzFdTJqLMrjUZiDN/cgembzhOA=
Date: Fri, 5 Jun 2026 09:15:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update Ocaml maintainers
Message-ID: <aiJ3iqJLTSxifA52@macbook.local>
References: <20260604151303.2720636-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604151303.2720636-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA3P292CA0050.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA0PR03MB5497:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb6e0e0-5d44-4e7f-4aaa-08dec2d236cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	73vkecBtT+JpdCPrQE9Pwo8TYsgUhOskRfnSQejsjLIh0isl4N+QpSyn8FnUyONhAXsvtbbc3Q0RrpStON8Y9oxiFrhsyo1RklZD3Mac9BUEfYdGB5uGNBgOlzVXe/VMUi/4u2KgY8yRdvRr82BYEI+fN4Sj/gTip96jz6xDeelBjwgO6ZgSpMBmYcXKAxIPr6iLo8VcdS8iNAUb4WuWGjQlMJERQb4JZ/wixjDma4U1T3mgq4ln7h7JQMrAfxjhb25CU/D87SlsgOjvcdcE4ejfel8jtU/4xRCMlTH3iz6AQuKXg0G8qDXujm8CV+o233d6h1DeE2pz8BxsFlMLgivpQyapxuB5d8UUhXkDWwHlKYU3cKgAhmm1HgofOyKzq4ZdhIIWp7yKwmydJY8hEM+qGg6g38tW1QY4VRXOQSHSdSjhU7GETMwxgyua5HD7mnOKFamAJhcabqXp7v3v2sChPqlDC0s4ps+Pr7ahwc8JvRHanFTK9luRbVEUu6j0goJmmTZcKIPKgq7Gk4Az1Slw1B4WdFFANcWftQ20yEXpR6yfKzqGYjGWd2JKivrrFFstxqOZZVLEhW7C+O9XD/CC9qaxY0ZeyRhHw1C37YfX5a2N877StiJkFDJODH1B0tdrgJCghfJfRWUhUlKqnD+vz+bEI8u9MteQtH90G+WwcRgVUpxjTGBSXWg5Grvu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUhJaWswVG5vN3pNdEpwZnVNMW5QbjcwU2xKdUpUdFNxb0FyVjIzUDcyNVFa?=
 =?utf-8?B?ZkR5bnB4TVdGa3cvdS9jaTZtUG1kQkUrbjhmamEyL3BDMGgxbTVGOVRoOWl2?=
 =?utf-8?B?TzBxOVQ3WXRaY1JhU0Q3MnZxbHZKMnVzUjZ1M214Mk1Dckc2N0JLNW45cDht?=
 =?utf-8?B?UXJGMVpzM0R1OTRBbmdNbXgrWnU4MGVYL281Z2ltV0xwcmRDcmU3SklNYUFG?=
 =?utf-8?B?cXhkanNoTno2d1p4TFBIZHp4WDBLOFNFbmVtWDFSbUIvVlhMZ1h6eFFGVDJm?=
 =?utf-8?B?bG0xN2trKzJEeWZzQlVxVEZyMXBrekV0WEFReThxcy9MNW9lL1hVSWg1L25I?=
 =?utf-8?B?a1pqWjMxR3V5TFpzREVYSnVrNnowRHgzUzRBdU01VDhFQlVEK3RDcmVtZGFR?=
 =?utf-8?B?bFJQMlBXUTMrVi9ocTVJNEhlakZKWWNidUtVN3Z0SVJZSS9JMEVZWjVqU2k0?=
 =?utf-8?B?a2ZPTVAvVVRxYm5iNHhydWJVTWgyMGh3LzY5UVJJc3BGUjhvSWtKV0JVWEw5?=
 =?utf-8?B?L0lOdWkrYWdTMCthNjI1ZGEzR2FTQzNSazRFYSt1OFJHUXFxcUhFOUR0MDNj?=
 =?utf-8?B?aXpyeE1aZlhOKy9XeGI4WktRTjh2TGxDektLS3poamRYNlNzMFVDQnFlZ055?=
 =?utf-8?B?dGZpSngvOUg4bUJDMjJhN1JnVDJpY0pUalA2MnV5bXN5ZUFXNk0veHRVMnB4?=
 =?utf-8?B?eFdzVGlOMzhja0J5OGxUeFNyQWpQYTdsQlM2U0RyR2VrNXVjVFRCSUlwSFJ2?=
 =?utf-8?B?eFE0R2o3RUtuemxCbDhNTCs5Sk8rN0xELzNLc1VXTjdPSkRJOTljT1NHamg1?=
 =?utf-8?B?OXhhRTBPRzF6ZUVHUWVmQkpiOHVsNkNsNitzTjFkQ3ZKelR6ekhZZVpXMG9h?=
 =?utf-8?B?a3E2akVZSUFCTFZGL0dSM3V1RlpyT3A5MWN2WVIzVnFlRU5QNmpzUnplbXVr?=
 =?utf-8?B?WDZmcU52bWpsTjkrbEdReHZPYjdJVkJmZXQ1cU50VzBJbldkbGU1VFMyUklQ?=
 =?utf-8?B?NDZMZFhHakVFN0MwUytWeUdYSTllcUl4cEIzOUFQaDBqZ1JWTTNEWkoyYTE3?=
 =?utf-8?B?Zkd3akFXQkJFUC84emVkdDBFUGp6WHRiQ1EvcTdKVWVWL0ZXYW1naUxxNERh?=
 =?utf-8?B?V1cwSlJtUTNSVENNZnJnT1h6WHMvMGtwYW9CSWNldGFod0lVdmJqbTNlemF1?=
 =?utf-8?B?QVlzMHFDL1Z1QWVxUXk0c2dZYkFpTFMwQi9QR1RNdTJPYThaVVJ2NlV4VWg0?=
 =?utf-8?B?WWtvOHF6VmFZMGJFOE5RdU5KNEVUbDJYeXZHV1dXdTZUQVo3bERBd1o5dmFt?=
 =?utf-8?B?Vk1nRXdVUVI3Nml3ai9UY0dOVlRPdXR2NVlMVk9vQXJJWGQ3ejNqSWF1YTQx?=
 =?utf-8?B?enF6Y0JOa3ZhSDlnblM5VkVuMFIwYUF6MFBzUkg2OG4yKzJEMk91ZTNUYjRR?=
 =?utf-8?B?aVBwN2Q2MlpxakUvMjlIZDFkYjFLM0srR2NVQk1CZytCRFQrUzlrdVM1NGpy?=
 =?utf-8?B?OXpXc0NVVnFXSTBhbndEY3BxRktOdE8yN0drTUNiSW1hbGJJaVJWRjRkaDFj?=
 =?utf-8?B?Z1hKSVErdnlpOFpRSkpHYVNmbUNvQ2kyR0syWE1WY0lvSUF2c0RjSmthNTNn?=
 =?utf-8?B?T3loODh0MmUxMVI0TVpjcGNyTktZOWhKVU1NdkhBZjVuMEhabWh5TUZmcFdu?=
 =?utf-8?B?b0czMTF4clJWRXJUYVFBb0lUU1BXSVkxbUFqOXZ1dzZUQ0l1UHhJS3d6KzZH?=
 =?utf-8?B?eURObFJlOFdHdDZVcXgxS1RuaEFIa2tFSCtnSU9ZUnVNYzFjN0hLWnRvSnd1?=
 =?utf-8?B?RUwzTjZ4d2ZWek9BaU00Yk02ckZjSktBVWM4Uk56aklMN21QKzFBeUR0Vjhn?=
 =?utf-8?B?MVFuU3hpbFg3MFV2Tzc3TjVJUm43L090MFVqNnFpVkNkTU9IZG1sVG9tQ3Az?=
 =?utf-8?B?MlZWODhLZDJqKzZ1UFFFNTE1NnM0V0ZGWE1TNDV1YVhEczdaSVBUTDRYWUgz?=
 =?utf-8?B?cm1vMWY1UkhOeEZlSFBTT2tUZ3BHZEtJMldJaTl0MngyeDAzODNBSkx3dmsz?=
 =?utf-8?B?ZzIxc2t6N2NHMGZlcTZXU3RPU0FRRXlMVEJ2SHlHVkZ5MHlkUzZnYkIyZ2tD?=
 =?utf-8?B?cUtUMXppOTFFdWQ0WHBOZ00xTGlRZTJsTjN1enpCdXJBcFZuU3dTU2huY3M0?=
 =?utf-8?B?b2lDMWU5NnkwdkRmL0pTaUlwQ1lnK2F6ckNoekI0eDJROFFvelI4Ry83OHFC?=
 =?utf-8?B?ejRRZkUxRGcxLzlYcDNKZGkzWjdzOWY5c0FtYjlQRlBsM0h3VXEvOW14MmQ1?=
 =?utf-8?B?MWdwbzJYN3RxYUFnbUc3bU9FL3llRUdJaHlzS3hra2E3R1o2RWs0UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb6e0e0-5d44-4e7f-4aaa-08dec2d236cf
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 07:15:25.3909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXOGqAzKPXpDNuxP70oaQEZmvad4lGjdafJrOoDbqa67xlgq1HRZG76Gd8Ki/JyP7AM1pqpUYJN/DGtfXFRgVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5497
X-purgate-ID: tlsNG-c201ff/1780643729-E3788443-CA8B35DE/10/73395122804
X-purgate-type: spam
X-purgate-size: 1568
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:from_mime,citrix.com:email,amd.com:email,vates.tech:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:andriy.sultanov@vates.tech,m:guillaume.thouvenin@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7C94645DAA

On Thu, Jun 04, 2026 at 04:13:03PM +0100, Andrew Cooper wrote:
> Christian has just left Citrix, and Dave almost a decade ago.
> 
> Andrii (a XAPI committer) has worked on oxenstored before and has agreed to
> step up as a maintainer, and Guillaume wishes to get involved and learn too.
> In practice I do a lot of the bindings work, so lets make things official.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Andrii Sultanov <andriy.sultanov@vates.tech>
> CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 77f72e52f46d..b62ea7c47753 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -453,8 +453,9 @@ F:	xen/arch/arm/include/asm/linflex-uart.h
>  F:	xen/drivers/char/linflex-uart.c
>  
>  OCAML TOOLS
> -M:	Christian Lindig <christian.lindig@citrix.com>
> -M:	David Scott <dave@recoil.org>
> +M:	Andrii Sultanov <andriy.sultanov@vates.tech>
> +M:	Andrew Cooper <andrew.cooper3@citrix.com>

I think you want the inverse order here, so it's sorted
alphabetically?

Otherwise:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

