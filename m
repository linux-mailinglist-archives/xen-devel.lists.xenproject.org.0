Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APMgKHy/HWqKdQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 19:21:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1058662333F
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 19:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324038.1589709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU6Jf-0000eh-7u; Mon, 01 Jun 2026 17:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324038.1589709; Mon, 01 Jun 2026 17:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU6Jf-0000bs-4m; Mon, 01 Jun 2026 17:20:43 +0000
Received: by outflank-mailman (input) for mailman id 1324038;
 Mon, 01 Jun 2026 17:20:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wU6Jd-0000bm-GR
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:20:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU6Jc-000pOP-9Z
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 19:20:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1dbf48-bab6-0a2a0a5309dd-0a2a4505c8e8-38
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:20:40 +0200
Received: from [52.101.48.13]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1dbf66-aaa8-0a2a45050019-3465300daeba-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:20:40 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5297.namprd03.prod.outlook.com (2603:10b6:a03:218::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 17:20:36 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 17:20:35 +0000
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
 b=pYcn1N4X1ZuMc2VBHS7rdRJzlU222PR80lMeFnjniB23PS80yKgS3JQyqfIPE1sp7CfJ6TJgqlz+RkNIvEgGpHlnLg4BLLTE46StZeGPBlwLpATNd9puX6DEEVce7lnUHDf2O7aA0bXkZTbfqrRbkwJ0ZMSn2tIpZudV2zT1qOOFdFiYrHbmgWp6EYj4ranrb4U0yU0N5UU59tNXypWIsOGIS5Ea0NId2myMpd6E1wsCQACBj6jVD4g1wd4wZb9J+XcKrmTrYq40+5PTezftXdSHB4lJiGVzP4us2nNN4LEACMYF4XRsxmicJWhQdvLD3AG2Kg/Kx5WQK6H4CWAsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTBWbVR0k+vkE5zxKc6uDTHetfV/b5aNWJjwR8qWucM=;
 b=S+mDzpUxHuLXk7031TFls+ZzMt/iof8sbqoMHL/WDX+npbkbOA0pvE4DktiR3EcatVk5QMmtx02weaIIZkdu2W8iysqGcLogwmoTJY+bBN+K0MATpteLW3imi4P+DIcIzzhKbG9Ic7vO/qiSTO69PqiBZy+NCxra6htzAwalOYgZhU5N0BKeDbLHVyzgzhU7ZmwSOXT+e+kA6raM6fwVUZleo+mZVCTisICCbXIqt5IHFoLYESNwaqxf6/an/SdxVLqgv5Govz3h5uwiHwErNHnUNlwM5fG5nOdlNJoBjDRQJeccUyX9IcDu2WivFut/PqLUuLg3q5EZC9YLAO3l3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTBWbVR0k+vkE5zxKc6uDTHetfV/b5aNWJjwR8qWucM=;
 b=pwI43nksNa4RmCXV9SVBqZBCpLenINmr6UjfumGSF95iKvtErV+O/pwdexPqGRxQOoAn0ZtRSrjS7sJJwD736hASzozV9qxB1fBCpiSPPrcTI/pJ2JA17bVoFD/DHNtUlhbe+xcuCx+P+swucIQPnZZ+e6rj26kODjJ7z+mHmI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 1 Jun 2026 19:20:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.22 5/5] xen/numa: fix setup of non-aligned memory
 affinity ranges
Message-ID: <ah2_Wyzw486gLflv@macbook.local>
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-6-roger.pau@citrix.com>
 <e08a1e30-cac2-40a6-9dbc-31aa4074ae88@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e08a1e30-cac2-40a6-9dbc-31aa4074ae88@citrix.com>
X-ClientProxiedBy: PR1P264CA0057.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 450e1cbd-7d7c-4936-6d82-08dec0021588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	VwGY05su6M+mOMUEQSMT2TnU2US8pKE8vE9S2GggaLb58yfyoQ4xWsdrHIlr2DSst3aVQmWb4aUQkE+R7g8d3brkdAhXJAoqMKDELC333alZ89GbZbiKlmEbU5C/IBqkzDZHW4rDG7Tc45OTWdpk66p7dCrQEum4jf/DTq3Yzihcrx9ETdkcp6MT51rEpE2CB9G/9VyrfR3tRZszYtikHdvd0qQV4BgcjiZXSqNz7f/f3yWbexr6TBfo6fSxQXmtRL70V89iHBBUZc/rWrcWyYBRaEsxiuPYIwgfVCKO9aMs3Mt3MVC2mfDHuRk78882bm9RmCZ7hW/597vuL1e3hPGM3lJ4PXjWQEC8mVyV9Sw5m7wDAPgYk4T1NTmvzGZSwJPX3JhQY+o/vKABWws8YJvBRpg+Ys+uSXqiig0QN3hT4mfxzdJc6s+D8HnWpS/XuquP9ILKkbtb9eWlQA74LkU8UY8URIdsxfqOKkvtEc3C1/TJ+TKsizuPBN3BVgex3zjcr1Xsuz3EWziWa4EQ2Lbkaz5W6+yyogyLAqydLjsIfVzu+XvDQzRRWSuoJJluUvd68jk/EDnW+4dY2WlebAeQeo68WSXheXEYJYivmxkOni4R4WEFNgJZlIPUbTyCmFjrzL1miXnaRNWyLxDwJXuQQ3XTMmmzEy9lpWhRRVAieOue1MOLMG3csVYUq8ln
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXVzWUhhYW5wVDFiMWhNRlcyb0poK1pwc01mT2VrVlIxVkM2L1dyUDVWbjds?=
 =?utf-8?B?RGp6Y3FuMjZ4NGFnSlBBVTFZdW9tVjR2aVo2YThlUTdadmtweE9ZRDVRZW9r?=
 =?utf-8?B?NUpQekM1eVRiWnhCYzZ4YnlHaWMzMys3YnhuTWxLV3lzcllTQjBza3BrS2sr?=
 =?utf-8?B?eVI0OFlIT2MvQ0FTNU1LV1FhODk0Vk1xZkFnb01WbHNUcHF0Vk9uTVAra3d5?=
 =?utf-8?B?bkw1Q0pnTEZaU3BxUzhnRE5zdmllU3FwOTNaVGNJRkNVQmR3STJ6TE84cXJ6?=
 =?utf-8?B?MzA0WnVYVUhQVFNJRE41T1dmemY3d01tTGlzYk1lQk8xQzV3ZW0vbU5GMkJ4?=
 =?utf-8?B?a3NiZzNFVU44VExSVHJVMTFxYTZleXBZbHdEMUdJQVNXNEppSFh1d3hXZ0FT?=
 =?utf-8?B?Rkp2S0VvamN3VEFPNVVGU3JoK3VyT0FhSjFKclFTOFNCSFRZQjNidi80T1Y2?=
 =?utf-8?B?OE5IbHoySjgvSEtnenREQjd4VC9qaFl6L0lVQWliRElvY1I2ZU1QdkdJVElx?=
 =?utf-8?B?L2tlcHdtTGVtclRKTjQ2SUQ1NGsrWWNzK2IzY0hOOFU4Zm1zRjl1U3RqMUpH?=
 =?utf-8?B?QXpvSTFTVnYxTmhRYmlWVjRsTmFFNURibnMrVGc2dWdXQVNWdFdBb3M3R2t4?=
 =?utf-8?B?a3JqaVl2QnZJZG52MGFGMUJYTW96S2N1Qjh1WmxaSXdRSHErUVhtSzFCOXJE?=
 =?utf-8?B?VmhhK2RkWUJ3SEhMcDNDU240R2liUFk4VTFtWTlpY1RSYmM0RDlHR2RBTnR2?=
 =?utf-8?B?bWsxci9Wam9rRFdMMEttQzQveDloRFB5dnpsb2lMZGd6aDUvcC9NVWNxUE15?=
 =?utf-8?B?UzRNMUhqVEo4TmovWDAyR3BMSjI2RXZnb0ZvUU9pS091aGJtWGNJVDR1YTZI?=
 =?utf-8?B?K2oyWW8xamVNVVFWV1dmeDFGSUl1UTFGeW9XZTVTZjFWZjZrekhkUEhjbFlt?=
 =?utf-8?B?UmhOdVdJTTF5UVRzNE1NMCtGQTEwWWhuUURZaHFEdStpVERiM2p4aHRESVYr?=
 =?utf-8?B?Sm9YQmVrZ1FMZzQ4aUpZeHRpTlVKalFhN1pnbmZ1MENhK1JNb0VUbGZTVFlu?=
 =?utf-8?B?R3Q2VGd4UnNqNzhUR1pORWl6RnI0b3JlbzU3TEVlNDZFRVVObE5XcnliVmpL?=
 =?utf-8?B?OElzT054aGp2V3pDODFUdW50WWlwN2QyVkpRMHFRZ0dja1BFZC9Wb3pBRTNF?=
 =?utf-8?B?TGtDM3JxVmxmYUN1YnR2WUtXUzVZWVF5MWxMWFhGaWRnTE9nTGd4cGZMS3kr?=
 =?utf-8?B?dzdHQ1l5L1FwenVMdEZMcTRQWFdiS1NTbllsNVBicHo1SVRkTEM5RHBWVDdZ?=
 =?utf-8?B?dEdvWlVSNG1KRmhvTVFWSWRWQ1pMOFlvQ3BxdHQvSmZGTVE1YnhJWDE2K25O?=
 =?utf-8?B?TXN0dW03OUM2RmU2ODF4OXQ4ZDBaSnJYQnhuWFplQXBVV0VPTnI5VHpnZENT?=
 =?utf-8?B?dXkwZnhXUUl5andwZUd3cHloMERsK2dPRFQ0WTZ4UWJEaHlNSDk2MytNaUdx?=
 =?utf-8?B?a2dsK0NYZlNobGhzYStFS3hsek1QR1JZbTVDVi9DWlpsZXBrVTJ4SGJqa0Z5?=
 =?utf-8?B?ZzloMXhDMlVCMHYwVWJ1aVFreFRJWURhdldxZDNlK2VIdjlYOFVyQ2xOblR3?=
 =?utf-8?B?YzZWdTdYZDZIYUpjZXlwUlloT2NycFNWcnY1NGlPVTZpSVdIazBRVnh0N1ZT?=
 =?utf-8?B?aXNsR2tSV2ZkVmdQTXN5a1ZZWTY0N1IyRHJYK0ZzdXlicnA4K2x0ZitwS2dO?=
 =?utf-8?B?RkRMTDJyUW5RYTJPL2d6UDA3UnhLQXRwQXNDQmpjTnNBRzRRclE3SkpHRUxi?=
 =?utf-8?B?R0MvYnowQkZkOHJZNmpHWGUvMldNTzBsZFllRkthRFIzTElTUldMNWc0UUhq?=
 =?utf-8?B?RXh3RkZ6M2MrQVlNa09FVTNHN1k2N0prMk5LNGdoR0RNR1BhZnhsZ1EwWDJz?=
 =?utf-8?B?dWk3dWt5SWUya0ZuZTdBYWllcHUrS2YyQlhEak1uT3RTQVlONnllT2p0QjQ2?=
 =?utf-8?B?NTgxVHBaZVhZbUc2UnFoSXA3eU1yOXdWaDRhSjFDUXNSS1NyelFGeHRqcDB3?=
 =?utf-8?B?WFI1RFJ5YnpZVWdhTWh1amZsZlBhazZCdy9Mdlpha2QwK1BUQXQ2VVE3Y096?=
 =?utf-8?B?M0V5WTdJSVhPT3F4ZnlMZGw0SUMyb3l0TmhaREZBdEpETmFNL1MzaGlEMFBp?=
 =?utf-8?B?Wm9BQXVscjdrV3M3dUV1eXRtanhZWlZtUmxmK1lZeGgvTVQySkY2cmh5SUdO?=
 =?utf-8?B?VUs0bjZOQm9qM3ZOQVNDNDJDbHVxMDVJOUVKcVVYZnB6U2ZBMFpVa0Job2Vr?=
 =?utf-8?B?alYvUHFpOEZJNEFVY1IwdFQwa00zV3JaZVpSdGtrSk1vaEw0Q0t4UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 450e1cbd-7d7c-4936-6d82-08dec0021588
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:20:34.9073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiU06wuCz0pq5RqWWU4f6nm828w4BNGQ65CiGMNf4APLnnchoXHiD4SXwYZ1j+EPUwV6lymQpwABm4VUgxoHZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5297
X-purgate-ID: tlsNG-c201ff/1780334440-D9971443-D6E887B4/0/0
X-purgate-type: clean
X-purgate-size: 1513
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1058662333F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 06:08:49PM +0100, Andrew Cooper wrote:
> On 01/06/2026 4:43 pm, Roger Pau Monne wrote:
> > diff --git a/xen/common/numa.c b/xen/common/numa.c
> > index 8544a1598218..8b2f29597f30 100644
> > --- a/xen/common/numa.c
> > +++ b/xen/common/numa.c
> > @@ -396,7 +396,13 @@ static int __init populate_memnodemap(const struct node *nodes,
> >  
> >      for ( i = 0; i < numnodes; i++ )
> >      {
> > -        unsigned long spdx = paddr_to_pdx(nodes[i].start);
> > +        /*
> > +         * Round down start address: if start is not aligned to the memnodemap
> > +         * chunk size the tail remainder might not be added.  Overlaps created
> > +         * by rounding will fall into the same NUMA region.
> > +         */
> > +        unsigned long spdx = ROUNDDOWN(paddr_to_pdx(nodes[i].start),
> > +                                       1UL << shift);
> >          unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
> >  
> >          if ( spdx > epdx )
> 
> I like that this comes with a unit test, but this hunk needs to be
> standalone at the start of the series, because it needs backporting.

I was supposed to add a post-commit note about this, but finding the
offending commit took me a lot more time than I was expecting and
forgot to add the note.

Yes, this needs to be backported.  I was wondering whether it would be
fine to just backport the fix, leaving the test changes alone.  But I
can also split this to a pre-commit.

Thanks, Roger.

