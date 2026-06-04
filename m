Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ODX4HuR8IWo8HQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:25:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0866404E4
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:25:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="ALiX7/9n";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327836.1592572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV84z-0005rB-3i; Thu, 04 Jun 2026 13:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327836.1592572; Thu, 04 Jun 2026 13:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV84z-0005pd-0d; Thu, 04 Jun 2026 13:25:49 +0000
Received: by outflank-mailman (input) for mailman id 1327836;
 Thu, 04 Jun 2026 13:25:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wV84x-0005a9-Jv
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:25:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV84x-004cwE-0B
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:25:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a217cd4-5cb7-0a2a0a5109dd-0a2a4506a250-16
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:25:46 +0200
Received: from [52.101.48.20]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a217cd7-7371-0a2a45060019-346530147b28-4
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:25:46 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB4972.namprd03.prod.outlook.com (2603:10b6:5:1e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Thu, 4 Jun 2026
 13:25:44 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 13:25:44 +0000
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
 b=tpC417O+ykgtCZo2iFwWmikIHRa34NdQDH6fDvacp8brJ1k/tebJG9V+RfPh/z1JG5tnMPMBf39uF5witpma7qKX+b/Xviy5MtFvyVSmjr8k+9xtZjmqxZEZX5gqb4/Za7QKhFEbT/YBmhYOv/NsosbtcvDNAmKui9Rej/ab51jQXyxkNXT4mFUNJD9Ocj0zqn/GdCnHC7VkFFnVXkQgvh0IA+ukeXsDrfq/ka3XHIDOEyQgIvBZp1MNWDbbaR4ISpNVdQ6dkRcny82t/lhdupG582lDaP9THzP8SAZd8oWa0y20tSpoOIu4/XpHAzfnm+43yzSYBAnSGYi0O2T+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSlZ/VR4yAILyuWXrXM17N42F/2bZkIvcHpebi1yLzY=;
 b=SJL/0iS4uxIEwCDcnjHiiEhhcQtC0Z810nm6uQY0z1B/EoPySAQYug3W7ypJUdpx+aGadimvFYcun98s3Ryrh3qUucrKvYZ27dXreelMov6B0IPggrZzYnfRopT11lmJt9ZPm+7lXWVPXrq/DiBrXMEvMmkDR0NMo9lTGjZHPnnnb+W2mUgMdF0YzA7hHzOpzaJZhawbZVz7KCKvaTB9GXSvPQxFGswwOICAflka2ig3B7vwQ+UbDdCRSzlnLvG7IqLx+4m/fCjF00LxStvKokwm9WP8pxM6+VP3uuNSSPhWDrbiZZ9AO5fa1GJDTmVHvWmcWAkdyjf0pzBy9O3h6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSlZ/VR4yAILyuWXrXM17N42F/2bZkIvcHpebi1yLzY=;
 b=ALiX7/9nBOFNn/c4DunHtTu26BVKO/ht9ZtCO7YKM5XAU+8sFRktGsDx9UWzTe1wbF7+q18QUrkt4QLfs7dTIIZ856vDgM1v53w0elgjUD1foCvISCj7yiHSj4mf6mgQb1VdEKMZJdgc+Ls+5SKxinrGYvYJiMwc3cOvaUoDPtM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH for-4.22 v2 1/2] x86/mcfg: sort header includes
Date: Thu,  4 Jun 2026 15:25:22 +0200
Message-ID: <20260604132523.95125-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604132523.95125-1-roger.pau@citrix.com>
References: <20260604132523.95125-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: f15ae204-d5d1-4b33-3f5a-08dec23cc7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JXkiDeopSXlb4IZzPpYRhSyZargxRxOMT2g+7ViKwlZrlAHJaqrfvw/Ot2VrkE6XIpGtg2yrBdFEbKUwIaTLnga0zVsPKWGZ6cB3KSxEetfefrZHWAjnM4ggOx7sFLaKUxFNwcq2/IUUnrWVtjU7K4d9RyLgsYE4bKn+rCKmdPvVtxLGLaSerOz1Ink4axnquiD3OhjuEj5TZYOaMGOZX9O1/gi3IpFadvHL6Kh123ZiDizJ9tXCjWQCr1eitdqXyo7iuP3g6K/vaF/HmG7vvJESOi9YRpSg7x9FJ7W2uy0J0OsMTSFU2ENjdX1JmPjlG3ddW6MkTMhdKpqoReAN2FyBcrftQOjs+3huLdhv+zVB09As5WCzr/Ody92mlijUgFBZVo5HT0j84tG/fgeRHIYNQmxhmd//8R8RnXsjmthBLJ5DIJTx0oFhvOHatWzrZ3iMkC35zRVlfbbIG7djnQU699tBkmwZKyzDf2P1YWQYlcnsJBfgSLWvd2mqXZPVPwmg1heYdBmQcsUoKPJM5Z3hFgGYD27Hazz/kzz+K4TC0n/GXifIUgVTwV5j1h8qFSg4Jvt9Orv6IM6c87GrHhQauzrUpsKifpfTlCOxgfCTdDTbb2sRItttAzmhnzGBsGrGmw5uqdQHvYzHwCqIETIpUApburZ2vk8kUstuZrWSBvnMNGvAhhwVv5+nbx6R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akhHbU5Kc25ZRTNweDhYbDVMNFZBYUhoeDdHYlNnQy8wRXpEbTUrcm9FVnpQ?=
 =?utf-8?B?dDI5c3Z5dEN3dzI2K2JuTGdob05xZ2Zlc1JHTVNodVhXbGlIcnJBL0tuT2FM?=
 =?utf-8?B?d3JrR2w3c3kxV0g3bDk0TW83RmZyOXBFTHBhTS9QTjFZZW0wcG51QzRxVmZi?=
 =?utf-8?B?bHRCUmFRbkdSZGFONjhQdEFKdE0wZFJOZ2VCREcwUzhuU0tPK0FhNDR3TXBF?=
 =?utf-8?B?YWxjUnFhTnd6d1hRVHdKd1Q4ajVaaFdNblg3eStlOVgrYmdkOEQ1TlN6b3Qv?=
 =?utf-8?B?VUNpOFBYazdCL3BIOGxGYlJFZ2tTKzBUZFgrUU5QT1B6QU9oVXNQcmxFSUZp?=
 =?utf-8?B?R2J3b2xKMXBjODBKdnNFN244VDh4dVBkNmFXZEZnYm9tMWpha0V5ekUzY3hB?=
 =?utf-8?B?ODZDcjBVdkk5NkNXRkpmUFNEckVLaGhvYjF0b1dzbWQ3VVp0NFRZT0hVS2Fo?=
 =?utf-8?B?U0E1Z0lVQUJ6L0VFYmVrRGUxcTN6NVJ5eWJBdDVEYWoyV295MWNZNUtObFI2?=
 =?utf-8?B?UXpuVXVkcmZCdnRUd0FvQ2FVMmJJRitUdko4Qm9aQU9oRlF5ejVsT1JZK1hQ?=
 =?utf-8?B?a2Voc29Bc2FuUjNrVlZLbmNOTXJ2amNHS2FjVWJwVG85MForcXk5VzQrRnlX?=
 =?utf-8?B?cGtVUlYzMUVpWDMvZGc2NllXTnp4YzhobEliTTNtN1pMTjFFVE1SZk02NUhW?=
 =?utf-8?B?TEJMUklDcHQ5YWx0SjAvSU1hSEdJSWZ4TmNhYnp6enROUnAvWGV2ejY1WVBi?=
 =?utf-8?B?S2pMOUlMb3NnRFpud2xuSlJwdTNLV1FIVHZwN1dlcnh5clJRZkRvNjJuMzIx?=
 =?utf-8?B?QXp5eTRXV0RCdk4yYVdlRUJyTnFialhHZWxnRzk5ODM1clFBSFhIWU9VK2dw?=
 =?utf-8?B?TTh1VDYycVp5YVJ6Z3RJbEkycHJKVjdFQ0cvVGQ3RWNsOENtRlRjcGwwNTRF?=
 =?utf-8?B?R0xtM201QTNUcnIvazVHZ0JXOWdFTGxFbGxKMSt0dS9mRTVKWHk4NStkODQr?=
 =?utf-8?B?OXdXV3F1SUNHNEM5bzJQOUIyNklaWXNtZG0zZVVrSnBBYWQ5Ymt2YVdCTDd5?=
 =?utf-8?B?T2J2cDMveGhsYjZCYjZBcUtxbmExT2lHcHFlVVFGV0ZkdlNvWFBtd0pNRWZy?=
 =?utf-8?B?WE5zY3A1dXc3Rkd0OVFHbm5hbGJ2ZUlmZGlhTmR0eFRscmd6MUNRckRqWUti?=
 =?utf-8?B?TnBHeGVFb3dGSXpoV0c5c0MwM011R05nc1BBY21kMnZxT2U0d2hyYVVHa3NZ?=
 =?utf-8?B?YU9telRiSXNuZ0h5TG94T0ltWEhmRHVkVWJNczZUbC91QVk1a2tEalV0SWpX?=
 =?utf-8?B?QjhSNHBRaW53TU9RdVd0K3dKNGlTTloyMU10M2huaFV2ZFJmR1ovem5QVVNz?=
 =?utf-8?B?L1Z0OGlnNCtXUEljMGdjREpweXJhQlVpQW9pK3J4VEZPS2dSY1pxbUQ4VkVG?=
 =?utf-8?B?Y1o5UDZ1ZEdsUjd2aTFxQVlJTEZtZHlBb0UybHR5UXVUUE1GVmN0dnhiN3BP?=
 =?utf-8?B?SlpJbVpYSWFpd0dGTXdVTTdzbk9PNzRzd1RUQkpyRkRkbjFkNnhvY1V4TUR3?=
 =?utf-8?B?aWE2RzJFVURUNHArWU9OSm1OMkQxR2FqWExVNUNjbTlQOG5BdGprSFRBRnZa?=
 =?utf-8?B?Q2JheW5JT2Uza3BxSEpkQjhoTnZvcnRpWWNPWEY2YVF1aFBKUDVPalVMVVRL?=
 =?utf-8?B?dDRLZDFGaWE0ZXJ1eXlWU1ZrMzl5a3BZUmlYYzhvTlNLVXFpcmczR1VwUzRY?=
 =?utf-8?B?VmlmdFIyYnZhZFFOZ2liTFdvZGpleUFmUW1jYXdDeGVIY0dsVVFwbEE2K1FV?=
 =?utf-8?B?S1JhZ2NscDNRV3BxVVVNemVSSjZiTnZwUnQvTmMxQnZodGx3TFZoZ3poUFJ0?=
 =?utf-8?B?N2hOMlVQUkhYVHZDQ3Rka1FCV1lzekRNUzQwT2pLTnd0djdkRFV3YkYrZFov?=
 =?utf-8?B?cEFqSVkxaHUvMEgyL0s1cjdDRE10Z0Q3ZXE0SVFUZFdpUng1VWxSdVNpUncz?=
 =?utf-8?B?T2hKNFRnZUlqVlBGeTVPMXl5WlQrVzA5am9RVHUrZ3VvQTFHRGhaeGZLSHl5?=
 =?utf-8?B?MHduQUFKcFVsTGorU1RPT0NsT1hnZGRsNmZwNWVxa3pYTlN0TkhUSVdTQ2t5?=
 =?utf-8?B?aTlrNmZhdkF2eEVaM3ZWSnZ3SmllMzRGTWZtcVF5Y0kvbGFXeHlKOGRYbVpa?=
 =?utf-8?B?UjFQRmM4UDB2R2h5UVFkYnBoVHJoMkdCWXpESFdYWVYrSnlSYmI1UTdrbjZy?=
 =?utf-8?B?N2F5STRVNlZod2J3SW53UVdGcW5XVUh4dnZGYjhWL3gzUFdRVjBudFNvTGpI?=
 =?utf-8?B?TExuNzRwcGIxRkZwUmZqRzV6dmtyN05XQ1dBbnNvT3FpWW4ydW0wUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15ae204-d5d1-4b33-3f5a-08dec23cc7f8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 13:25:44.4372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbvdCQmQwt29UmtMowUROR5oDMf4+d+gln9IxpOOC3CF5hIgRn2Y34hilweXGk4cD9IUf7D2h87aGJzdJsfSuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4972
X-purgate-ID: tlsNG-16d1c6/1780579546-86D72D75-C3397AE4/0/0
X-purgate-type: clean
X-purgate-size: 1015
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,intel.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,suse.com,vates.tech];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF0866404E4

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/x86/x86_64/mmconfig-shared.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
index ab082b5f5b37..d0cbc151705d 100644
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -12,17 +12,19 @@
  * Author: Allen Kay <allen.m.kay@intel.com> -  adapted to xen from Linux
  */
 
+#include <xen/acpi.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/param.h>
-#include <xen/acpi.h>
-#include <xen/xmalloc.h>
 #include <xen/pci.h>
-#include <xen/pci_regs.h>
 #include <xen/pci_ids.h>
+#include <xen/pci_regs.h>
+#include <xen/xmalloc.h>
+
 #include <asm/e820.h>
 #include <asm/msr.h>
 #include <asm/msr-index.h>
+
 #include <public/physdev.h>
 
 #include "mmconfig.h"
-- 
2.53.0


