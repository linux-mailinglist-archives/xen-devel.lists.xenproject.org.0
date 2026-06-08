Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nn18IbWdJmp6ZwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:47:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06066554F1
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:47:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=fX9d4d1x;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331559.1594127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXVa-00043U-Kz; Mon, 08 Jun 2026 10:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331559.1594127; Mon, 08 Jun 2026 10:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXVa-00040y-Gk; Mon, 08 Jun 2026 10:47:06 +0000
Received: by outflank-mailman (input) for mailman id 1331559;
 Mon, 08 Jun 2026 10:47:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWXVY-00040f-UQ
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:47:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWXVY-003cmh-3P
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 12:47:04 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a269da2-5cb7-0a2a0a5109dd-0a2a450a9828-18
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:47:03 +0200
Received: from [40.107.201.59]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a269da5-56b3-0a2a450a0019-286bc93b69f1-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:47:03 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5875.namprd03.prod.outlook.com (2603:10b6:303:90::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 10:46:58 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 10:46:58 +0000
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
 b=B4D5q8Qb6eshsmkfeLK4zCBaTzMway4GMxWZycTyjI4zH5ctGKN8zMkFGvlFzG2l0ozy+3/7iuamYH/dTA4S33QVDkitaSrh4lSnSMekYB9NQ/Z01iYlneM3oX2cu9OBoVuQQUoNcrvWS9hIyXjMYW3vknSH/8PSnHBqVdXnbz3bfE6CtocYmQWlzE1vuZC9bEtpvk1iPcP/W/fDqk5ftnEKnomuo9qHYiWTTVBch1a1wKqvMQSzGjZdedOxxU6rExMmJTK6p/RVY4CkwFmOz6yVDYy1fCBAEIch2BoTUQ81B9Y+lFMmAx8eRVxN9nacE7ZPSBFcQKWEvS3nB6OMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPtM5S/75X63cQbTUUUI8cGLXi5Cl4Dz+M5yCPendeU=;
 b=wmvTSM9fvvWra8ywxP5ep8RD/EwhCRQogqPlDAXLK4uOhfqMT+Gf4KDfV0r3mT4dxl3S2tI5xUtIcsEaFZ7QOZgx/+8Kd7jknBBMjENhMFnzcyokWiHk8vmxlVUkACZgT0pARGIKsTOEG/aKn8difyBY3csMXSIxqHGq1mlsHAtk5iYkWJAGJEgdDbQcQZSgVF70EmzGYPXtQrGbTBWshStBSev63ZBPcG+fTGDOdHR4X8WmxgGFpW16KdO0VNowGGE2vvIMKoSJm1PffcqT9k9yXBaSS1rYAHllZItp0YJm2hxMB52n8dseE1KPKLrM9oxsBNH6BydkGVIrWCJSdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPtM5S/75X63cQbTUUUI8cGLXi5Cl4Dz+M5yCPendeU=;
 b=fX9d4d1xC36Rk/rPRTq30j8Dp075bcwJ0gzTNhz+9EYHowqHOUkmgrUPYy/BKS074kiGX80kM9tVpBwu86282JkezaVCUuO9UjG24BvVbjs8bt100doyXZGNW0+sxe/XatX7f8QPBbRbOVUkZxhJsz3RKVvZiJbtzsD84ciIMiE=
Date: Mon, 8 Jun 2026 12:46:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/2] tools/libs/guest: Use the system liblz4 in the
 bzimage loader
Message-ID: <aiadn_Gaf9IfkrUu@macbook.local>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
 <20260603085331.2704108-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603085331.2704108-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA4P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: a69f919a-61ca-4d60-3b40-08dec54b43ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|6133799003|3023799007|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HRhMk/JihfrbFC0Qyh8VC3WY8ZV7p2EzbkylwokEalkOGwN9zIbHHqQIetWFsInk+kL/FJfg7PTJGDZWV1d2f3yd7iDQ+8YpuRpaVoiMt7xmC80LJe0QWazOa9StC1UuAahguRPg4wN//PUE4gtQaw8YYVXZWLfb0+B2wDLkj06GxjYb7Gh4gkNpboGN2jpFU5vg1F7E8cYpQVcf8FPLcoYSwCMIZ4WytCtRbHuPtvXrvVakXB4hjxFVkl2YQwiAJWbPq/V7HfEKSV6hkA4INjLZl3mB5cnh9hDPTdQLh4NGy22669OEMyUPikL8/4tRzUnyUwkJfWtnbiKacTMPovCsy8empoGgTKjgtWiNcCnlNUtjWvcfWXTKu+RT37nytRIlUVqzSGacpuFfjWLIAWJzbO0klb3GKjfmLsO0pTxvYBEknQ/KV3dX0u8uyu5oKVd83rRFzzEowmj0QwRlAytgCyoKCdArnS5yF2iltsBZfvFCEAdt+B85062T28ECOqC/yKuOhQ9aJ1i3OsLyEeyPW0YM8o6OELhIlMIyW+CjiR/ktbDww5L3uXoNhOXeIGKm/mfxopaYf6hhnpqJBgq3nn6I7x3ysDVpoIxmCNrdkUiUpPZ5rcH0fb9O9K4LkSilnHmrj+sbuUUcIS9tnx4mZjvZiQyaoUW1GQh0HZ0bpD9xCAD1Ccxt12tW6IQu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUxYS2dWbEtaeU5oYXBSNE1XWStSU2kwei9qM0VURlcxZk8wVmFZUEo1RWJ3?=
 =?utf-8?B?MzZHSHVQM21tV1VCYkt6b2lwT0xEYzlUVXlYT3FYLzRkYnJPc29hYnh4cCtR?=
 =?utf-8?B?Tkx5K3owVnBtSUN0eEZQUFh2WFZJTmF6NjVhRmZqUVBGY0N3eU96TFNzdjVR?=
 =?utf-8?B?RmFjc2VuNEEvcjRqeS9Id2M4bVg4QVM1UkptYUlQbGZVRXo4TWlVWUtPYm1X?=
 =?utf-8?B?b3FPcnJsNGFtdUNCVGdEK3ZnM0ZZZDNyWEtHSlN5T2tXUWJJaTZzZ3QwbVlC?=
 =?utf-8?B?YnpaWjF3QWRnbE9CQmtZNTVUcGdhbDB2c0NqYXZSdFFhNytZQjBIRzNvSFB4?=
 =?utf-8?B?NkJtazV4bXoxRkx4MTJRdnZ5ZzJ3ZEs3YndSY25tQkNYd1Y3Wm5ZVG01Zity?=
 =?utf-8?B?MXV4c2wxKzlZQzE4aFdjUUJITG15Q3dMR0RTajFFVlA0UHA3TVdDV0tTWThz?=
 =?utf-8?B?Nklpa3YxZUFYdzA5UHk2ZWRTUldBWVdYQ2U2dkd0dlBXdmpGSlNEOCtYcWhh?=
 =?utf-8?B?bTljRWM1SGZKazZaLysxTHFwWDN3WHFDSWd4NGdUOG1vVm5XZDdpS3kwK2hG?=
 =?utf-8?B?VWUxcThzNVdydHVULys1NDBIa1RUWVBNTFhRTU9CcGY2dkc5RUQ0VDZUeW42?=
 =?utf-8?B?VVpUVDNJOFpJZUFldWJFYTE4MWR1dzNNZEh3VzM2a29OU0JTRWpFR0I3anNl?=
 =?utf-8?B?WS9vWGZURE0wTjN0Y0UyblA3dzhKRnh5M0NlTlV1aXBaZTgvdFdlU05wQ3RJ?=
 =?utf-8?B?YzNkaGp1MWI4MUtwai9xQWYvQzBmaU5MOVRYRWFUZE5KYmoxWFkzMEhwR21Q?=
 =?utf-8?B?U3haUFlrc2FJWldhdmtFUnRITGRidCt2OEptVzFHUHhkclIxbVJlMlY4eHNX?=
 =?utf-8?B?WFRPUElLcTNVOTBQYjI0QkZGUEx2TmVRZUJWZW9QeWNlNlRvamI5VG1mSm9C?=
 =?utf-8?B?THZqbTl5c1BTK3hnYlFMTUVTY011RWlxRkwzd0J5K2dqVWg4d3Vzb2dDSmw4?=
 =?utf-8?B?VWlBUnY4Ui9yRlJkOHB1T0ZCakxURU5RNzJ5b0VIODhmUzRpTU1raU03azdP?=
 =?utf-8?B?VVpGQ3piL2hqWm5zbDFVU3pQM2dvUmNHTXRxWUFnanJwWmJSUmtHMi84b3By?=
 =?utf-8?B?OCsxNU9STnJpVUxBcTRXdnpmV1NYWVlpMG1zSU9LSlo0SmxubDdycWRlVExC?=
 =?utf-8?B?TVhuL2VlYXVFZjBxN2J4Skl5eXpqTzl2c2RxbDU1bFFZWDgzSlUyYUtwaVBC?=
 =?utf-8?B?a0VGREpucFFXRlFGNkgzSHBjRVZQM0U4SmdsVXZTd0kzaStCeGg5dFlPcjht?=
 =?utf-8?B?STlBcWNIamgwSFdhSko1QXY3bkhxdGVjSjlVZ2ZPcUtsSy9MTHEyQTFaM0Nx?=
 =?utf-8?B?YXR1YTBlWjBVSzZhM2p0K1hVSElQN1FleXdZeFhTQkc3TkdlQ3V3eXVPZ0pS?=
 =?utf-8?B?Q00zTC85cXYyczBYd0pjbVZlMlYxSWtlR2s0SHh4eUREK0NxNVd5OEYvNkto?=
 =?utf-8?B?bEs3SURiRGxzSDE4V3lSOUpNUmhocTdoakRPdmhNSXRwOUpYczRncGpkb0FK?=
 =?utf-8?B?dG02OWF4eE9nRFJKRFBFZ0IzNk1NK0pjSDc4czJ4ZFlkYXg1aHFYWlJobVJT?=
 =?utf-8?B?L1YzenlQNnpUd2VSU2dkOHhoS2FhRkIxbWxjMUdyM1lqZmVpaU9SWXltQ2NS?=
 =?utf-8?B?Z1ZXckcyZmVwL0JpcUp2VzRwRFVIVjZtOGl1S3F2a1RHR2xPemdWVG11emww?=
 =?utf-8?B?azhKUURnVHJ0dzF6c2pSTEFYdVMvR1RPRkhaRHBDN1B6WEFERm5zdDZxd2lj?=
 =?utf-8?B?MmlobWI3MGlDSFgxV1ArdVArYXRzWUpRMGdGRElIZDhKcjh5M3NhKzU0WmJa?=
 =?utf-8?B?dm1sek8vS2lpdGVTWHJOaG44VzRablVaMUxXSDJxUkVsWTAxK1RoVTZlNG41?=
 =?utf-8?B?TmV2UnZXSjY5b1VGVGIzOW03aUZZQ0xqWmlKTkZtdHhmcllPeTBuKzlZaWcw?=
 =?utf-8?B?M3Z2bHFFaXVZQXV1T0ZRaFJ0LzRZYUttWDdBb0dxUGdVQ0wrSW1nalR5V2Ni?=
 =?utf-8?B?VktLZVVacEt1VGNjMERWTk5UVWlJbjdWN3FRb0Y4YW96L2lyR3NJODJRSlIr?=
 =?utf-8?B?c3FwUVlOcjFzQ0UveFVqaysreDJ5bEJ1Vm1mWFIrNzYydVlDQVA1NGk1NEwv?=
 =?utf-8?B?Z1YvNHcweUx4VW9OSS8xYmZSZTNBZ3dKNndnOTJZbUtWMThJWnllQUkxQm52?=
 =?utf-8?B?dE9UUkNxbXJTOXIvMUEvNmhFdmpJRm9ma0ZHYWRZUzRNY3NvS0ZLcUk2MytF?=
 =?utf-8?B?RUIrL2tINEZXZER6cnVSb1VjVkJWR2JqQXo0SzZncERpc1Bkd2ZGQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69f919a-61ca-4d60-3b40-08dec54b43ca
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:46:58.5462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVaYhVZ2X+p+xrck35O+Gcnazhak2BcWHuir/PySfLGEUdRGvz3x4PSE3o4xVCCzuG3eD+qtymdfCv7zw65LPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5875
X-purgate-ID: tlsNG-4011c0/1780915623-7DD828B7-7C2C2226/10/73395122804
X-purgate-type: spam
X-purgate-size: 3941
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
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,suse.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,citrix.com:dkim,citrix.com:from_mime,citrix.com:email,vates.tech:email,macbook.local:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A06066554F1

On Wed, Jun 03, 2026 at 09:53:31AM +0100, Andrew Cooper wrote:
> Right now lz4, unlike every other compression scheme, unconditionally uses
> Xen's unsafe decompressor.  Make it consistent with all other compression
> schemes by using liblz4.
> 
> The unsafe decompression is still required for the MiniOS build, so rename
> xg_dom_decompress_lz4.c to xg_dom_decompress_unsafe_lz4.c and drop the
> non-MiniOS content.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Juergen Gross <jgross@suse.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  tools/libs/guest/Makefile.common              |   2 +-
>  tools/libs/guest/xg_dom_bzimageloader.c       | 128 +++++++++++++++-
>  tools/libs/guest/xg_dom_decompress.h          |   6 -
>  tools/libs/guest/xg_dom_decompress_lz4.c      | 143 ------------------
>  tools/libs/guest/xg_dom_decompress_unsafe.h   |   2 +
>  .../libs/guest/xg_dom_decompress_unsafe_lz4.c |  39 +++++
>  6 files changed, 169 insertions(+), 151 deletions(-)
>  delete mode 100644 tools/libs/guest/xg_dom_decompress.h
>  delete mode 100644 tools/libs/guest/xg_dom_decompress_lz4.c
>  create mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
> 
> diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
> index b928a4a246a9..86b1f160e536 100644
> --- a/tools/libs/guest/Makefile.common
> +++ b/tools/libs/guest/Makefile.common
> @@ -46,7 +46,6 @@ OBJS-y                 += xg_dom_core.o
>  OBJS-y                 += xg_dom_boot.o
>  OBJS-y                 += xg_dom_elfloader.o
>  OBJS-$(CONFIG_X86)     += xg_dom_bzimageloader.o
> -OBJS-$(CONFIG_X86)     += xg_dom_decompress_lz4.o
>  OBJS-$(CONFIG_X86)     += xg_dom_hvmloader.o
>  OBJS-$(CONFIG_ARM)     += xg_dom_armzimageloader.o
>  OBJS-y                 += xg_dom_binloader.o
> @@ -59,6 +58,7 @@ OBJS-$(CONFIG_ARM)     += xg_dom_arm.o
>  ifeq ($(CONFIG_LIBXC_MINIOS),y)
>  OBJS-y                 += xg_dom_decompress_unsafe.o
>  OBJS-y                 += xg_dom_decompress_unsafe_bzip2.o
> +OBJS-y                 += xg_dom_decompress_unsafe_lz4.o
>  OBJS-y                 += xg_dom_decompress_unsafe_lzma.o
>  OBJS-y                 += xg_dom_decompress_unsafe_lzo1x.o
>  OBJS-y                 += xg_dom_decompress_unsafe_xz.o
> diff --git a/tools/libs/guest/xg_dom_bzimageloader.c b/tools/libs/guest/xg_dom_bzimageloader.c
> index 1fb4e5a1f728..32b3c682a447 100644
> --- a/tools/libs/guest/xg_dom_bzimageloader.c
> +++ b/tools/libs/guest/xg_dom_bzimageloader.c
> @@ -32,7 +32,6 @@
>  #include <inttypes.h>
>  
>  #include "xg_private.h"
> -#include "xg_dom_decompress.h"
>  
>  #include <xen-tools/common-macros.h>
>  
> @@ -623,6 +622,133 @@ static int xc_try_zstd_decode(
>  
>  #endif
>  
> +#if defined(HAVE_LZ4)
> +
> +#include <lz4.h>
> +
> +#define ARCHIVE_MAGICNUMBER 0x184C2102
> +
> +static int xc_try_lz4_decode(struct xc_dom_image *dom, void **blob, size_t *size)
> +{
> +    size_t outsize, insize;
> +    unsigned char *outbuf = NULL, *inp = *blob, *outp;
> +    uint32_t chunksize;
> +
> +    /* Magic, descriptor byte, and trailing size field. */
> +    if ( *size <= 8 )
> +    {
> +        DOMPRINTF("LZ4: insufficient input data");
> +        goto err;
> +    }
> +
> +    insize = *size - 4;
> +    outsize = get_unaligned_le32(*blob + insize);
> +
> +    if ( xc_dom_kernel_check_size(dom, outsize) )
> +    {
> +        DOMPRINTF("LZ4: output too large");
> +        goto err;
> +    }
> +
> +    outbuf = malloc(outsize);

I would use calloc() or memset() the buffer, just in case part of it
is (wrongly) left uninitialized, as this is copied into guest memory.

I see this is code moment, so possibly better to adjust afterwards if
anything.

Thanks, Roger.

