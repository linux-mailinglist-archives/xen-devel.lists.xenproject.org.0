Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LVxErwD+2kbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:02:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CC4D8454
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301359.1575646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKY9L-0008AH-Cj; Wed, 06 May 2026 09:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301359.1575646; Wed, 06 May 2026 09:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKY9L-000884-9A; Wed, 06 May 2026 09:02:35 +0000
Received: by outflank-mailman (input) for mailman id 1301359;
 Wed, 06 May 2026 09:02:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKY9J-00087y-AW
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:02:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKY9H-006YHF-5G
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:02:32 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb03a7-2eae-0a2a0a5409dd-0a2a45059998-6
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:02:32 +0200
Received: from [52.101.57.30]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb03a6-aaa8-0a2a45050019-3465391e0c9d-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:02:32 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB7038.namprd03.prod.outlook.com (2603:10b6:510:299::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:02:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:02:27 +0000
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
 b=RBfxRN+LfOxO6SsrfPNPuoRd4VPq3cOeGpviA5A63c5r6VvZQGoYa2gHGORz5yx94JtipJSKY/9NcDMQyOIPLfx/7IPRGA3QBurgd4wmByqk/3/fqBUes3xny1x+obyNeWbvdFIOlc8d8j7OFzwII8LX34sRLFc4o/ZvwT8jo/UqgJpO+gYs3rnFPNlhPlPPwzFNg0u8+yt8D6zyd9AWL74M2jpMoulgC3plBQMkiIpzlpRSdvZj1SFPdKXQ7Lox7p06dOI2bF70dGm8chtZmDtFYyWpQkkTVcdKdG8MrgkrGR5yejjIi2oGN1aq0eqcs0XhYTHDVw+T3ZhlmwZjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grkalTiSaIt39jHqytKiDktOh5evECmB0U5YwQxFur0=;
 b=QO2C8f604kQjJk4nrhzHIBut+hd79K+BWu/ohzB3tpBDvXvpNuun8J5jePyeX1pdVTvMZtBPVrCjiC3jh23Q/irnZN/rY3mqtXlZSNkWLcmgq41iS6m/2XvbE/zWLOYtOAeKokQeu+27C8j2iU8pgFNc1INDMSaldpSW07MFzdyewS4zVwBrNNoE556NpjdhoFeFvzmryfev/toFOuT7r4O4vWcflwu5tsQ1Q4qCu9T5L0kTElLMZIjlRa0tqTTLjJLHle7eWW2G2WHN07IO3TtAOKKFBkBt9OyhmG+eT67Cw0rEc7tBRoLRoEI3vQLvj6hZ1Nol1N1HSaJ/qA59qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grkalTiSaIt39jHqytKiDktOh5evECmB0U5YwQxFur0=;
 b=Kmi1sUWk+VuLdfwx7TvQtzoZ5LabN6GrE3/UWffZ2yIklZm167LMstcEYg+8S2+5rplDP9x9KqptBdUfboghhC3MGWbTednpTgzoU9iSpbki51kAaMJQs1SPe4YX0v8oX9mRde0LStaNXCPYONorVAzgd7TD3cUlcIsr3WX14fE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b1fb3f1b-9f83-4007-9854-6cc6d698876b@citrix.com>
Date: Wed, 6 May 2026 10:02:24 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
To: Jan Beulich <jbeulich@suse.com>
References: <20260506073719.40075-1-roger.pau@citrix.com>
 <20260506073719.40075-3-roger.pau@citrix.com>
 <41ec5134-b117-47ee-8e59-682ac1e4a69f@citrix.com>
 <1d771706-35b1-4d6c-bcd8-a3bccfa825f3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1d771706-35b1-4d6c-bcd8-a3bccfa825f3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0220.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: e25bf31f-b0a1-40bb-ece8-08deab4e327a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+cEudw1kia4qFqIE1g5I92/3xx2v4c7g/QNEXdilw/FiJ8zOBH9eWooqBB4adignoUAtyRrXRYh3jkjwpAQ/kks3yWfH5leXxM5ZRILmFJV5Rfz02UslzNeNNrAJKEIJX+N4+EROXBsOBmrQMLyXYzD+QA/GGpiTkNH0qOlBbc/G+DQyd0n4JtlurTVEEC1+sWP6X+re4x4d8gw7lLgiy/w0EKio9UNnVEx4JteImMW7UAjEpjKAYC4E22DfEWDGxY3ZcT37og7wzOl1pCNpJuPLRmubwXeoFSqiC1nI3AxaXk6Jh7knZ/c1XjRyRPVpQw12kr/cIGvI750tD6rQEVYu5LO0MyBFz6NLWhMGIinNLI73BrgJ4O3twHiGDkY789GGxicWwYBcJefV+3zqT/LkSNL1p1s6rw4NYQYuOwSdbkuGqtQ+meBmuo6ySRca99hZZbWM+pUVjICVQy35wy9xLLzlz7EXpd0/wwMFT9L0K6yACs8NtxDn+avSfPva0weLSCPJgxvrK/eTj8FoVy+BHlUwxlcurEy5uwSrc27ukaS9lOG9JbZ9Is0RpW3qBy/6uiIsx200yD1RprdvEbgom/gb7GUWh1D8iStsfYWJKFRdBA2N3v/lYlxWU4T6eTCOuKqSmBTLHGgV60w207EsjB3RaRL/AW3oPNWQKkOCmjgrW4mwC6+gQMuBdvKT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aktrTVZwa1NEa25FczNKQlh6NDlTY0tWalhnNWdPL0NMQW14aDNVTVpaUzR4?=
 =?utf-8?B?TjNNTmJEWU9wZm1IcVo5VzhpeEpDRnNaeFBRdzVRbGJGT2xLb0hibHcxeHhr?=
 =?utf-8?B?Ui8xMTYrOExzaWNMdmtWOENwNlNidDFkdXpJc0pMT08wR1RRVnEySEwxT1d5?=
 =?utf-8?B?Rm4xZ0hYSkNPbVBjdnJRbGcwNGtuWHA1dkpoZ1RkdmF6SENrbG5SVm1abkQ3?=
 =?utf-8?B?Ry90aDdOS2lsWGh0YmRXU0E5SGVDSWpiak1IV29SbmM4am9ZZGs0cS9HTUhB?=
 =?utf-8?B?RFhKK0F0VFZ5aUIxSE9nRmUrNFFPZ2p4N29Eb2dWakZkd0crSW4rVHA3a2lF?=
 =?utf-8?B?dWh0SzRFWmZuU24xM2lYN0MvTkJsWmx2T3pmZlFDOTZmWTZDQjRoODRiNTNN?=
 =?utf-8?B?Uk9uQ3czTTVtbURDNGcwd3lCejhqWVN0TlpXQ3BsU21jR3dobVcrVVdoak9B?=
 =?utf-8?B?UWp5WmVrR1VWQUtUOE11c2Jic3ErdXA5WkVyWnFkc3gxQlhpcEZqdU1ybUxH?=
 =?utf-8?B?K3hQbUtTTkZsMmhUdzZvNXlKczdPNm4xTXJSV0x2OUxrb3hCTWJrNTk1R3pn?=
 =?utf-8?B?OXdkSURLaXlnV3JHa1JCaEtRRldnamU5VzVnY2hDVmNNcXNUMWhCS0RMTGJM?=
 =?utf-8?B?Yy8wME9KS0FMQU5xOW5jRWtjbGxTZGlhbHBFS2JOOUE3SmpUYkJkTHU2U2RR?=
 =?utf-8?B?Q0ZsQWR2cm9DZUhTUFdSQ0xQemZ0N2pmUUtOYmpZcnJ0VXBGYk9sWmNjVVhI?=
 =?utf-8?B?TjgwTk40UmRoazBYR0RURXJtckRGeTcwNFFjakFOa25PSDVELzRjM1hUeEhR?=
 =?utf-8?B?QmMzZ2NVOHVaMGFJVEhINVp0eDJWM3JjcWtGYkwzRm5KVVFMM1dzMXdOMVlH?=
 =?utf-8?B?YUN6cnhpRmRmYSs1ZDBpaWJsUERCT0tqVnNyNFpKanl6OG90WGw4NzJDSWd4?=
 =?utf-8?B?UHdxSFJUS29nUVBKdnJBSm9KQnloaUJuQy9MVWkzQWFhd054clQzNzVNdkVr?=
 =?utf-8?B?TTVOeTBlN2ViVHJUUkt6Um1uOW9lV1BEcVhIWHRzTExobUNSdkRWM29UVU4v?=
 =?utf-8?B?a3k3MVJJbzdNT01QZTFmWEJ0d0tsVlpaQWpidE9lYlQ3TXBHWWJJMFNYNUFU?=
 =?utf-8?B?ck12c0w5b2Rvd3drWitWMFIzeUtWMXgreDA0NUFQTHFsMEt5cG9OR1ZyTDE1?=
 =?utf-8?B?RVBCZlZOUTZHRCtjZFFHSEtHLzRBbno3cWIwZjFuSWNPcWdSUUhsMmFCSVRE?=
 =?utf-8?B?aVZrOE9XWndnM3FuYVg5cVBZRnpXNG5CUUg4a2VGTUdLdkp1WkNyWXBFY2dU?=
 =?utf-8?B?ZnZFS29QUkZ5NS92a3BqK1ZmSjQ4N0VKTEROeUltYWVoK3FGMGVVbmxhdEpx?=
 =?utf-8?B?d1d4QTR4cURxN3lXcnF1NWZRc3Z0ZWt5dnZIZG5SL0plV2J3VU1KOXFPdzZT?=
 =?utf-8?B?cm5tRUkzejlkNCtuN0VpejByeG1WcnpreWpVM3pJVlJsSWpkbU1VeGdLTFNj?=
 =?utf-8?B?MU1lSElwSXh2T3ZZVzhZVlFSRVc1SlNrVDltMVZQWGRMbC8ra0FLL04yQnFR?=
 =?utf-8?B?UjhrVDNSWit1MHJnL1ZUWEtBNWlFWGtac1Z1dWdkUmsvT1FSY3gwcGdlMVUx?=
 =?utf-8?B?VHpweEdlUWFaVjdMdThJNGF4akZwLzREK3RhK0d6SDFUY3U4RUc3ZnY2K0JG?=
 =?utf-8?B?bVdZZUJjd0NnSFNJeCtWYW9CaEpya2tjZHFZS1h4NCt6dU5lVVNwN3FDRG1I?=
 =?utf-8?B?bm9MN0w0L2JvSS92V3hma21HVlhKczRmWHhjbjBWN3BwZklKbnY2dW4vZ3dW?=
 =?utf-8?B?cThjOEQ3SmpURzVXTnNyWXZmRkxZL3IvZWJzbm1LcjRTcy9RbXFDcytzRCt3?=
 =?utf-8?B?VGhWOXF2YnBmTzAvcFJmMkpDaHFzWWEzeGpFR2ZHSHhudVE1T21JUHdoNG5a?=
 =?utf-8?B?a1FVT2g3ZHNJTTBxakoyaWhjaDNmRVZaUzNzaDFZMFVXWXh2VzJvZlhSV2pC?=
 =?utf-8?B?MlFoTjlXY25RY3JxdTZLSEM2blY4ZjFqVEVncjRnVDJmc3hBVHFQcDU5N3hz?=
 =?utf-8?B?YThoOVN4N2pnVUFUOXRYdHk5QTNiTWtjMUpSelE3cjdvNlg2dExWTUREYUQ3?=
 =?utf-8?B?S3gxSnJyQmM5L3VudGZLUHFmNStuQ3ZrdDcvdkpTN1NVODl6N1NQSkRxdkxM?=
 =?utf-8?B?dTVhck1ZUWhxd0lyQ1YxZUFaV3M3RG9jbmIrL2VpSXlHeVZ3VnNZMHRVeXZT?=
 =?utf-8?B?NFVLSE9rZ2wxQWhhdWVCbVI2dmFmTkRWbU8ya2R6TmhBNDlYYzlTSitlUVNH?=
 =?utf-8?B?VXlNUC9neWtQRTZrQ1hUYTN5clMvY3FpZ1VxaENmelR3czd3cTFGQkVKZGJ2?=
 =?utf-8?Q?aXo4bk4FmMnvcdO0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25bf31f-b0a1-40bb-ece8-08deab4e327a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:02:27.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1c3JgYq/Jyb4/UgzMsWUSSs8H64f3wqGEgt9Z8wDG1J8xZNHkkqCop4OFoZ+HiqaKIAXadU1rs+lXf4aHv7CFMQ6Dc+pyV51Otsdc9tbuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7038
X-purgate-ID: tlsNG-c201ff/1778058152-DB16D443-C191630B/0/0
X-purgate-type: clean
X-purgate-size: 2117
X-Rspamd-Queue-Id: 7A8CC4D8454
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 06/05/2026 9:32 am, Jan Beulich wrote:
> On 06.05.2026 10:20, Andrew Cooper wrote:
>> On 06/05/2026 8:37 am, Roger Pau Monne wrote:
>>> @@ -1367,11 +1355,14 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>>>  {
>>>      int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
>>>  
>>> -    if ( !rc )
>>> -        rc = map_iommu_mmio_region(iommu);
>>>      if ( rc )
>>>          return rc;
>>>  
>>> +    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
>>> +                               IOMMU_MMIO_REGION_LENGTH);
>>> +    if ( !iommu->mmio_base )
>>> +        return -ENOMEM;
>>> +
>>>      get_iommu_features(iommu);
>>>  
>>>      /*
>>> @@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>>>      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
>>>          return -ERANGE;
>>>  
>>> +    /* Read current control register and forcefully disable the IOMMU. */
>>> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
>>> +    disable_iommu(iommu, true);
>>> +    iommu->ctrl.raw = 0;
>>> +
>>>      return 0;
>>>  } 
>> These two things are unrelated at want splitting into separate patches
>> at a minimum.  The removal of memset() critically needs backporting.
>>
>> As for disabling the IOMMU, I'm not certain it's wise.
>>
>> Linux can already "bring up" an already-live IOMMU and Xen needs to gain
>> this ability in due course.  This is mainly for supporting PreBoot DMA
>> Protection, but also for things like the kexec environment.
> While I agree we would better support this, as per my reply to Roger: How
> is that going to work if the IOMMU has features enabled we may not even
> be aware of? We'd still need to blindly clear everything we can't drive
> ourselves.

Zeroing 16k of unknown MMIO is completely unreasonable.  It is not RAM,
and 0 is not a safe thing to write into an unknown register.

But to the AMD IOMMU specifically, the spec makes it clear that there
are registers configured by firmware that we are expected to leave alone.

~Andrew

