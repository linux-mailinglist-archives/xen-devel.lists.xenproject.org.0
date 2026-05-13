Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHyZGLyRBGoVLgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:59:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48435359B4
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308167.1579705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNB2q-00050Q-Kx; Wed, 13 May 2026 14:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308167.1579705; Wed, 13 May 2026 14:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNB2q-0004xl-Hm; Wed, 13 May 2026 14:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1308167;
 Wed, 13 May 2026 14:58:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNB2o-0004xe-Uv
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:58:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNB2n-005ESy-T3
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:58:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a049194-5cb7-0a2a0a5109dd-0a2a4509d910-22
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:58:41 +0200
Received: from [52.101.48.20]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a04919f-2497-0a2a45090019-34653014a673-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:58:41 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH8PR03MB8273.namprd03.prod.outlook.com (2603:10b6:610:2bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:58:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 14:58:38 +0000
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
 b=blIIqIUgzMDEO4Sf0m4bMZljkGX/6ynCMIuNlNj/rqCMTz6xhhP3wg+BD8LhXiB0Z/ruuCgd0ANwcmByS/ZabwNIabko354E60pgXt08gNhczLnYJ5hDrenip1+PUxvVG1Rg+Pn0/w1igJIZADXI/alm2DmW0uRnQ48v1SIJ5plBz8zpEGDNdPsO5wUeOwSaIIlTd/ifffNCfUmU7sySqvOC5lZ7zjIQ0k2w+tluDcE/CgxgfM+QZLJBw/Efv806HbsO9D/3/O/ZHMhVHNSD5CMlB3SuWKrTQns56rfifCTZE24/RPNRCkCp6DuxJH3KhoZvZH6htTy5TKQVlU/dzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unoB3QIHNs4bTbAoLczl1reCBSGGGUvprvYblE2hkzI=;
 b=qnIcPJ3+7rh+4AINTPLu+ZyWBRuKWAFzaqOZDsGg7G177n/rsUwUcOWG12x9xhkEdoLso3O+yB070hYASoyC/Fl5ZARFJ7Vizt6t5+rk0F8C6nqp/j1YniV7skPtZgW2KUFXi04P3TNO43ZvjE57FK5uyISbXYkvVcHzC74+Gi4mO8Qi+WNTNwf8CnkPruURl6CX5LREzRjZBHe+pUDOIPujuhb5cmEocZBHpc8cyuhF6IMD/ILb/+3vzQPvVDSHfHu5cQfhlD0KxOUuWCKdRLQ/ug92SwzuVmsaiQcQWBUTv5VDu9u1I4CjraeE/4j5ohVJ3X/ml6dmEU4JTmcOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unoB3QIHNs4bTbAoLczl1reCBSGGGUvprvYblE2hkzI=;
 b=wWBPkp1xIOTT/s0muyTahPQxhLd6ShRsqIipOidRI/52lhgVJRghwiLBgSRjV+xu10ys2z7N5ql68kCJoggDpcE0zVQKGZxgSJg7ilVnyumnRZ2sdawLg1XETluXM4fv8MyZKwHKOgb87meI1U31rmnP/XY8zpnEe7dxP2azq28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 May 2026 16:58:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/5] x86/time: move BCD_TO_BIN() uses
Message-ID: <agSRm3T0Y3EfuqFb@macbook.local>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <2c5af8f9-05f6-43c4-afb4-a50cbacd2d49@suse.com>
 <agQ8tRY3Kya6RasY@macbook.local>
 <d37322ac-fdf9-48bb-91e3-3e8d560fa758@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d37322ac-fdf9-48bb-91e3-3e8d560fa758@suse.com>
X-ClientProxiedBy: MR1P264CA0209.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH8PR03MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f33fe1-8364-4261-e13f-08deb1001d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AJ2Eg2zTl3Qu4e2qBBV/FbBgqrDU14/3gDkbq8LcEKpVo7RVoLyDvMqw4tgqo2CuJivr0M6Qd1T7+FJZNQkwID4MB3Z6kii/LsSsKSCR9Q5l1ttrHdkWOl/yVRBCigwnnzSiY52wDO09IcnqlGZbYre3wZc6iGTg98NXp9jwUFd/psPphl16H9T7VLqWyQ8B5LhZ4X8CRuLnLHPaqnGFV7/HncPWhLWEHzNAYFKRQWuibo1orEHM1jvVDk11GvDSB5dzIjB+cGK70y52clmB3MOx21l2RR+scEkyiD481tu4Vx2hV0Vasv5VGkVAA+zK3H+vbl/I9DOLBJmMk474Mf1Tqur51xwz9ut60CP9PFgdxiTAPF0bJLTReOaouNr6cblnsaphmjR34rR8py5mxDMg5VD4P5m4cEazb8ru/W7nwn64Dc68ZQKzIyNKkVeZ+zqqpfgTFLryWaEstZ5mrExf0LSrst0QbX6yaxUlfoq85bvwgFv9B73q0QbhtaBccasgm9Ehoxmfo9qZDyBjIrPULEJCgN/Z7dbQ0UtER0/kfh3JMojCuyx2qhqZflmSGzdN931reeQ0J42JJwXiK/ujENOIo0/WchKkPhhxdyX1zQK7hJWGw3txUmFyawHhsZKzOsVdNbHcW1KfbynRn8pPK3bYdufU/2m1XxDuOx6NDTrnekCB310COoVZ/KXA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWVhUE5LRC9odm9qTm00azg3aDAxZ085d2RVRTV4TXY1cG1PT3JSZzZ2TW8w?=
 =?utf-8?B?akVmYnd1R3QxMXZXOVF2S0ZDdEs0a0pLTnlRQ0Zqb2N1VC9oN2REZGdCMk9K?=
 =?utf-8?B?Njg5RExDNzV0MTZsZ1RlVmJYYWRqN05NMUlrdkFHOHNsRzZMMkFhTmp5bG5r?=
 =?utf-8?B?SkIvRUlkK2FZMjZwWlRoM1dDUjRmQTdGMHV0WFExSmt0S1VxMEVHNE05UTk5?=
 =?utf-8?B?YktHSU1rOWVISzVCeSsvNzUwQ0hJakxxK1RTYkw0VEdIK2tMcVhTaFBhQU8x?=
 =?utf-8?B?QmJoYlhick9FR0tzWlhvK21kdkNQQU52cnMrUkV5bjN4T0VzYVJ3WkpRSVQ5?=
 =?utf-8?B?eXpsVTJMUUtmT1QzcGx5SkFxSWdRb0NCb0pkTmxGVEZCQTZkbzdXQVFhaGxP?=
 =?utf-8?B?cFVlWHBRb1R3RVR1SVM4SWdla3hhMXhMSUtNcmZNelVXRkRHeU5SMUo4N0tr?=
 =?utf-8?B?bGh6cmdjYUFyaElKRWExM1BrSkhhWnRYaWV6NkZQOHVOcURzZzhsMWFoaTJP?=
 =?utf-8?B?aUljQUdPQmFLQ296SUJDSFQ5LzU1VjZkcDNYbzJld2piWTNnWHVoTjJiR004?=
 =?utf-8?B?c3QwdDVWSldpWGxKaFZnMEU2eWx5TE55VTcvTzFZcTZMekZya1NtdU80R0tx?=
 =?utf-8?B?TkJNWEhIL1pGOCt2L1AyTXRwRG50TElJeDBoQ2JyZGVsRytQN29ZZUVkNWlW?=
 =?utf-8?B?dFAySXlnTkc1bTdYZ1UvVjlxVWhUa0EzNWJXLy9jUjkwVVRsS1JNeVpUUWpu?=
 =?utf-8?B?ZnlVb1pxMVVGL1lBaDAwU1RkbDRtOHBiQjd6YnA3cmJQNmNnZDVkd3Y3Ni9n?=
 =?utf-8?B?bkRXc0dNRGcxOE01VVRSeHdtWUZYMGxDenNENHE5L2VBaTluQWluQlZjZGVm?=
 =?utf-8?B?TEl0N0tKS2U0VXRCbXNXVHJXTDBQWTNIK0lwbTR5UElIQmNKSmtoZnJaZE1x?=
 =?utf-8?B?Ykdqd2tPK0YzdjVOZlFEcE83NTJzZFhLdlY5c2FncXR5QnB6bHJUVnNCcEM0?=
 =?utf-8?B?bWJJbkFqWTNLZ2ZQelg4Z3R5U01IbFh0Sk1PWXI1czFuNFBnQXRxRjR0anJL?=
 =?utf-8?B?OHNyL1Q5Q0ZlSVV3RUZzQ0dPTW10Zm5lQjlhY0x5RUExWklncGZ4MnlEMVUy?=
 =?utf-8?B?UFZBajAza3M2ZVczemhMZHZGVWVJNDlQSmx3Ny9rMkZrNXFGeVFLVDhBOUpL?=
 =?utf-8?B?anI0NjAwaVBzRlRNMWUrNTdrZ0NPMW5QcXRCU2wzNEVSZXNOak5PWlhId0VZ?=
 =?utf-8?B?cjJRbkc4WkpvODRaaUZHbnQ5V0NQVFVuZ1RoMFB5WEN6bVdhNVc1RG9uc29J?=
 =?utf-8?B?VTA4dkZRc29KTitPakMzYVpQekxWN0VGNkJFWWZMWEhlUHREZGxOb2pURmFR?=
 =?utf-8?B?YlRjTmVvLzVNRzV3QWJ5ZDJNcElhc0tHNXVHWWdCTUlEMWNQcTJ6cktVUzB1?=
 =?utf-8?B?SlZzRzk1NUdpTXNkejN2ZlAvWmJHcVgrTjdFSENyR2VKNFIwT2lSdG1XZnRX?=
 =?utf-8?B?aDljSTFJb1R1dFRuNEIvakF6Z2NMd0Y2clkxaE8xT0gyRTN0eDcxN0VRdDJv?=
 =?utf-8?B?dTlhUTh0RzU4USszZXg0cnovWWQyOEV4TVZ5dXE4dGhOVEY2VW4xdHFlR0FO?=
 =?utf-8?B?aGViVlBSK2UxZFVKdWlrS0ZsQXpWVW1LWmlFYlFQMW9OMkVJU2dLL3ZKaFZo?=
 =?utf-8?B?enAxWGtZNDBwVitJTTZ6VEtPOGtMdG5Hb2wxVkFVcnN6Z3NtS09BSjdRVGtY?=
 =?utf-8?B?S0YwQ3gyN2pLZmlZSUFMakNJcm9OS2lWWmlaTmdmSVNmV0RHOWIybkVZQmR6?=
 =?utf-8?B?cnFUaVpjcTJpUmVOa2UxQjhFaG5QYklhTHcrOW53empGNDNBM3dOa1Brcy9v?=
 =?utf-8?B?djhpV003TmZFRkxRU3NRY2F2eGZKMWQyRUtVKzNReVZES1dTS0d2VEIzRWs1?=
 =?utf-8?B?U2RzeWxEZG05Y0FOSzhwbVRsQUhXbHRZcjBsa2p2TnlJWWFpVy9MWG1wRFg2?=
 =?utf-8?B?VE5TNmgrLzlTV1ZRaDFhZ2FrMmQvSU9FRFY4QnNMamNabXVEMDRyWDZ2M2Z2?=
 =?utf-8?B?WGM4SHhvQkJ2aldOZ1dkZWRYRklKSEc0WG5idUVaR0xXZE51ZG8rNWxac0pt?=
 =?utf-8?B?MCtuQTYyMW82VDJ2eWZCREdCS3JZZGpNYm5UUlY4ZVVTT2JPU1BBSW5rM0k4?=
 =?utf-8?B?T1d4dHlOWjFwcnFJQmtZK3Fxb2w5VVhOOG5KamRGTmNZRmp0NTJidVJnVEpo?=
 =?utf-8?B?QWpTbXVUWXJVQzhNT3Nad0twdGhaVXhIOWFPbTR3ZmJxVU0wV01KaVdyTVZB?=
 =?utf-8?B?aW1RSG9jN1NRMkNuamlYTVFLQ3FCUk1peERkK0dqUjBFdHFMaThHdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f33fe1-8364-4261-e13f-08deb1001d51
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 14:58:38.5756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UM2iOaeczb6/aThIa0ctjnzBZNJqrdLUMq8iNQfhq0sjC3Frbj6dOhKZNNDkGYTXcqqp6WbObOlYF3GgJpCw4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8273
X-purgate-ID: tlsNG-bad1c0/1778684321-41165A53-C188BBF5/0/0
X-purgate-type: clean
X-purgate-size: 1937
X-Rspamd-Queue-Id: C48435359B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 12:39:46PM +0200, Jan Beulich wrote:
> On 13.05.2026 10:56, Roger Pau Monné wrote:
> > On Tue, May 12, 2026 at 04:59:03PM +0200, Jan Beulich wrote:
> >> ... outside of __get_cmos_time()'s locked region. There's no need to hold
> >> the lock for these computations.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > I had the same thought about moving the conversion out of the locked
> > region when reviewing the previous patch.
> > 
> > As noted in the previous patch, we should move the conversion of the
> > century field with the rest?
> 
> As said there, no, I don't think so.
> 
> >> ---
> >> How come RTC_ALWAYS_BCD is compile-time constant 1? And then even with an
> >> inverted comment? Looks like we've inherited this from Linux, and even in
> >> Linus'es current tree it's still this same way. Yet all half-way recent
> >> chipsets I'm aware of properly implement the DM bit in reg B. Might this
> >> be another 32-bit leftover?
> > 
> > *shrugs* I don't know.  Seems like Linux is still doing it, so it's
> > likely safer for us to continue doing it also?  We had no reports of
> > it being problematic, albeit one could argue it would be best to
> > prevent such reports by doing the right thing.
> 
> That's my point. If we did this as specified, we'd unbreak systems with the
> DM bit set correctly, but we'd break (hypothetical) systems with it bogusly
> set. Like with a few other fixes, perhaps we should correct it, but provide
> a command line option to restore old behavior?

Possibly, but I would do after 4.22 has branched, just in case.

One thing I've noticed, is that Xen don't attempts to set
RTC_DM_BINARY in REG_B, shouldn't it try to set the bit when probing
for the CMOS?  Since it assumes BCD mode it should at least try to set
it?

Thanks, Roger.

