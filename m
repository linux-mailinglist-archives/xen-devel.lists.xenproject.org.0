Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIzZAxDW1GnuxwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:01:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB153AC746
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274731.1560743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3Fd-0007Uk-Jj; Tue, 07 Apr 2026 10:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274731.1560743; Tue, 07 Apr 2026 10:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3Fd-0007SG-Gn; Tue, 07 Apr 2026 10:01:41 +0000
Received: by outflank-mailman (input) for mailman id 1274731;
 Tue, 07 Apr 2026 10:01:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wA3Fc-0007S8-4P
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:01:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3Fb-0019SL-EM
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:01:39 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d4d5f5-e002-0a2a0a5209dd-0a2a4506a2a4-46
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:01:39 +0200
Received: from [40.93.196.24]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d4d601-0df0-0a2a45060019-285dc4186489-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:01:39 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6438.namprd03.prod.outlook.com (2603:10b6:a03:396::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Tue, 7 Apr
 2026 10:01:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 10:01:33 +0000
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
 b=CPQJigelncbopTynQr0diM52lv8UfpnNEBM3RovntKSBi5isY9zosHhA5X1kOuylQoTZdVwd8wAjge5qIXNslQChOFgJtXC5esC/Q9D03pGpexIVIFPsV3dcNgHOtwLBBxDalcarsGgazqet184XD/QIyG6CBLvlNI88BE4FyShkMU4VQ7ZOXcTWXBneDDkxEo+rSSbNnnEAdS44GgEk/n2MtTYFkvDv9wzasADGignRsWMGp1rInnDU0wnRSRaw+5dyQo41Dm20PJ3S4mf+RQAHmbuWR8coXBhZuq1YjUMPr48Hb3X/Mv2x077tYuW6NJgD2rf/uo/Ae4/0If55AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QJ7FxsW/Npm05lZODgUo5FJUy+cB+G8ycOZ+diugj8=;
 b=fol+QJOzW7ZWKZZStmIj1uLAe9pcwQ/UR+lRrL26a1zGZAxTuS3DZQWL+ysPepSOD7bYnRVLno05BhvUay6Am8vtAAPqJVn9BZFn0bbEc3B0yGnfRQ+kpkSnyhqwdqTVCL1EP0uikmjbbQVBpTyS8NCYwg52ZLgPa661DbWBP/BwiYii6W2C62dvyDPCgyngsYkXirgqYEnmlQSugOHu69dIXbVwRkDDQIdDwIeOeCOwTRqMYGCCgJqNWAg+kZxwMcHN63cvGatGvosGja4w8QDlFW7Q4gaidRV0/MdsyFB3TGV7PIX6NbCLMA2GtbT7agKH36lhjVarx3rpX70E9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QJ7FxsW/Npm05lZODgUo5FJUy+cB+G8ycOZ+diugj8=;
 b=VzmPEuK2cDBwNdyaAZ59AgQKanlPKIvwlQxiSevreOinGCsYDijYcQqFE9H5eDNR0DVK3u65d8UJ59Av62DRRpsUHYUs9Hv4+YmxnOOwCBOO8wQhri0GLURv4zCNu6t0j5H9utVt8FvkaiwU/OThmVxJpVw9jGvUltaUR+Bv8WQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <48c83963-5222-4a37-94aa-eb565529fa62@citrix.com>
Date: Tue, 7 Apr 2026 11:01:29 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
Subject: Re: [PATCH 3/5] ns16550: harden name/value pair parsing
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
 <66135036-b516-4665-b875-996456a34640@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <66135036-b516-4665-b875-996456a34640@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0012.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::27) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e96076-0d84-478c-0dd2-08de948ca5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	t4WXjmwz1ewCzqIZt3/EGB4e89lir+utiOMMdyy3VeQUdHfcsnYu8Z0SPu7xjW1lpozd6aNh/7ip/lunUhY7kfDTypecQrAEVbw9rKSnOdD4cslasfoYD7gy0gyInINFN4GkGNLSbn3DbMwbfREceh+NaTKMAQQjiD7GYJmBuP9eu2o74YN+Jm2YKkcBBDhW3h0GzuMGK6tYp6ykH8+0UbUxHWv0mNBezMAv3Eox8VVGtmZ5BQgV8rZP4fgDIBSqwpiTxkOYQ20lhsCDzJw8xbYB2eZy0mPnza6kWxnTofW+UwGdMD+1KzClIwfMm6VrczU4kjebzuqNdgRTuBk9EaVnDCPBZVHyr7y6KL+18WI1HcKFg5rIjaosIrXouDAHea/Beuqb0Eu8HXn78QYY6wdVg8i8C5ofAJCjNuJJZgdJdZ1PkUi6y3T/DkxnqVfNuNKprHvu+BnLpWSJbOsZUfim5tg3GoPVogm1MRKxnr/DE2U0pbOWlfFh723kIOepwl7xc/QoClsa5OjBQrcI387IQ9tWXIrKmLhrDNVlDF27qa0RLOis7gb7G357qgoaWT2kOe/EKp/VX0CDp/bSFJPJGun6VLgtt1CeBGWhqfDkjCYuGXVTQehdKw/HRkwaPCs3QxVmwlLT2BdLMg7N3kA3rWsox9YwYZrCWNo2vJeW4vnXfxVwh7Te5ohwUY5K+IkJZ9Nqj78O1FAdw/Ea/osSSc3ic+YckR3hTEVFRqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnBQTExqM0ZwVEhwWEtWcEk2U3htYTVVeFhoN1lJUHY5VDJGWlhQVFE5SlVP?=
 =?utf-8?B?MEoyMEtORXZtc1FOdGl3djU5dUlmU2h5V3VGSDgrNnU4YUlleW1mSHg4MlpP?=
 =?utf-8?B?bFUwT3A4dkl3YXRpUFR0aU56cDJTY3JlU1dGcDA0QXJOdytwVGdGenZKMlFO?=
 =?utf-8?B?enZmcEZnQTN1c01sbDljaTFtcVBFUVlOeGVRL0JNS3hwdmVWWVhNMmRnR2di?=
 =?utf-8?B?T3JpVVhtTU1SdmFzWWZXa3o1bXFiWE83MHRzOEh4V2JNTmVZZlV2U25CbVZI?=
 =?utf-8?B?R2p5bjA0eVVOMWxDV01nOCs3ejE3QThSczcvUG9HMXM4UVFpaHZEUGx4Zmk3?=
 =?utf-8?B?Y0RWZ0dQZHcwdlZFaWVsZlpvRkJpck9zd2RiYXNZVjlYZTRsTWJRVHRzamx0?=
 =?utf-8?B?WHFGRTlNSWRHQzRQSUNWdHZhSmdFTDZRRjFQTXovOGRjdmNKUWJPZWZVZW9x?=
 =?utf-8?B?WjYxYkZXZGtqRXJLN0gvZnoyTnl6UkRzV1ZyandWcU5PdWg0MlhsdlgxNExX?=
 =?utf-8?B?S2p5UGdjY0o3UFMvRStCcmlNRTRKZnBGaVR2eEFCZ0o4UkM1TXo3cXhLWnhS?=
 =?utf-8?B?d0tFNWphSlJxZmRFVmJvbEN2NUg5NkRQcGZialhGNktTTFJGaUFiT1c2Wnl4?=
 =?utf-8?B?eEF1WVhTc0FVbnloZm9JVk9zNGMzY0RwM3dpalBlMHRjNSt0aVl6aEVjejRZ?=
 =?utf-8?B?ZnV6OHdwZzNMSUpKTEpob2QxRHRoRHVLTkZKWWdmN2NDS1BmZkxGOEw3bzZV?=
 =?utf-8?B?b2w3TzB5MW1hSElaV1VZTG5VSEo4U1piNlBZRG9YbDlrR0FSMkc1OUh4V3NB?=
 =?utf-8?B?ajRaTDlDcUFGbFkzbW5qN3ZETCtScWdKektYWTV3ZmdHbWtBMGZMazhkNXNR?=
 =?utf-8?B?YTVtZVUvNTV6aWp5WkRzQkxnOEFvZHR2Q09GQWVHek9wKzkzSzJXV1h6SStT?=
 =?utf-8?B?YzNwRGtMOUtoN0F3d2hxUkZiZXhnYzgzUlVaaWtkelk2bE1GMDJ2bUZObGdu?=
 =?utf-8?B?a1Y3d0F6RDllQWpldmN6a1hCMXVudmtyRHhPaFJpaEI0SlA3TzRFVFN5Um1N?=
 =?utf-8?B?M1dncU1xaUx1S2IySDVMRDZLVUFOK0ZGZm5waTNYQ25aTS9EWFYrZDJraUJt?=
 =?utf-8?B?bzdHRmdLeDRYWCs2SjhiODBXQ2xUdDVWRGxYMGlNem1NdWM4a0Nkc2xNMS95?=
 =?utf-8?B?Rm9LYkJMWlRtMkp2UmRJQm02TWc1ZTFrSlplV05HR2RVWGFMRXlwY2lXcWJR?=
 =?utf-8?B?dnl6bGZDWU1ucDJ1NlRteDg3TUtEalRCbVIrV1pmVmx2VkNibUJ5THlXdzNH?=
 =?utf-8?B?Q1ZwOG84eVh3dmVsVmlBNUJZWkdaaThXeWd4RG9NbGhEbzlsWXM4S1ZYbWpP?=
 =?utf-8?B?UklzeHpEakQ0ekk2cHFtTHNPMnVBbVZXWngwMWxhRWV2UEJwQm56b0hycnhN?=
 =?utf-8?B?VVRFVDdXRjFiQWRSb1NlZDV5dXNvSW1OTDRFaFUzWUE2TUsvZjhBWFMxYS9J?=
 =?utf-8?B?a3k2NXk2YVpDTzJseTR3Y2J3STZsZXEwMVRyVkZOZis0UzBrTjNCZkVuOGpo?=
 =?utf-8?B?ZVNpdmpSbUNoUllhVFZUVG9Gd0tpeHRCRTdONEJNVHJ5ZXNJU09pUXl5ZHlo?=
 =?utf-8?B?OTYwTlBYbUxuTEpmenNPQ1hkMG9TS2Iwamh2ZEg5QUtURXFENyt0djNBeUNF?=
 =?utf-8?B?R2g4aEZPZk9Da28weXVrbDNvN3UxVEFFNTN6RmFNVUtlWFVkb0FoZGdNQVlq?=
 =?utf-8?B?MmFpeERqR3VGRUNiRldsZ3BuU09GNXN5MnJ1QjFaV0lpTS9xd1RqeXVTZFh0?=
 =?utf-8?B?cjBubGh6eDRBU3J5Z00wSS9nbzgrSEZUMWgyMUJjVnlEcDkvVEozNXJuNmxs?=
 =?utf-8?B?azBRTTRBRjlmZWxobUVhRWJHbGovaXBCQ0dsaTFXL0E3cWlDMzJSL0ZHeUFF?=
 =?utf-8?B?WGxwUzRlWThZMU1RTlFYQVhEVmtkU2lURHZHQzhrMHd0ajdad3Q2SHVTb0Zu?=
 =?utf-8?B?c1NFdEdMeEZJZm9ZKy9wWHBsTDJMZ21qZy8zeWhpUTEvdjVvRlpWS2d4OUht?=
 =?utf-8?B?NUJLNmRkWExkcXlJVzJIMk9CZVBvKzREWEIrMWY0ZzdpS0JCYm45cFNuVWU4?=
 =?utf-8?B?K2pYaDFwWDRLY1VTeGVTNTU0UkRmdklVT3N2N09qMnVKdXNsTkJqcmtvTXh0?=
 =?utf-8?B?VDJvdm5lZGlIVE9IRWRKZkJjaDRxSERrRmZKc3VpSHdGVnRkTFRnTlhLRFRL?=
 =?utf-8?B?R0RFdStEVWdVMFZ6d3VKZFQ4UC9mQ3MyVTU4a2sxNExkeHBJY0JDNGhwMVRJ?=
 =?utf-8?B?SFdQNDB0VC9BWEVGSDBHckNiTnI3N25uRGhFUmZiWUU1YnB0VGZweHlYYUl5?=
 =?utf-8?Q?VRTNVQnI2RDbybR4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e96076-0d84-478c-0dd2-08de948ca5d9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:01:33.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdAH6Hd40no7U4j202fepzFTGrMt1XXFHTiiRp36Sm5xjMbJ/O2JP70VC78C8LQGPV7RsKJpkj3k7AK/m0n4KEc3kKooU5zlI5YyLtmbt0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6438
X-purgate-ID: tlsNG-16d1c6/1775556099-5C7213D8-D1D3E7DE/0/0
X-purgate-type: clean
X-purgate-size: 722
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6AB153AC746
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 4:38 pm, Jan Beulich wrote:
> strsep(), unless passed a 1st argument which itself points at a NULL
> pointer, won't return NULL. Instead if the separator(s) looked for isn't
> found, that pointed-to field would be updated to hold NULL. Hence the
> important check in get_token() is for token to be non-NULL after the call
> (which get_token()'s callers rely upon), while the checking of param_name
> is left there just in case.
>
> Fixes: 97fd49a7e074 ("ns16550: add support for UART parameters to be specifed with name-value pairs")
> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

