Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GQ/nGG2BQmoI8wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:30:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B176DC0E0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:30:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="hcR8/cjW";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347606.1605440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCzi-00031e-CZ; Mon, 29 Jun 2026 14:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347606.1605440; Mon, 29 Jun 2026 14:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCzi-0002z4-9a; Mon, 29 Jun 2026 14:29:54 +0000
Received: by outflank-mailman (input) for mailman id 1347606;
 Mon, 29 Jun 2026 14:29:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1weCzh-0002yu-6W
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:29:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weCzg-00DBJZ-I1
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:29:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a428152-2eae-0a2a0a5409dd-0a2a4503c4f6-38
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:29:52 +0200
Received: from [52.101.52.35]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a42815e-ec1a-0a2a45030019-34653423c7ee-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:29:51 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7268.namprd03.prod.outlook.com (2603:10b6:510:24f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Mon, 29 Jun
 2026 14:29:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 14:29:46 +0000
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
 b=aYKrFSHCob7lrcHPVgLsSJWzMKfGs2rh2odpkj6DZBE6x7jRDlOUGNd6DEworbXWAStGysMnU7+2ugL9SjQwwyXRZWYit6Xui82IeI1ETaydqkE/ifpGMkfew4WSB1OvPkjpkN8jyTZACTU5f6Dn4DlVFIhGteSpCelCDTBWOgk6uN0VN5wKnK1LS2HjBFWnoEWTtl81NaV6Ouh72fT2NwNyh+juEIi4GzLGma2AD1D7ClltN0fK4qzkD/d7+oNmGCfen4MRnHonmNCDpXH0F7GwskRCvgTKCZ90sb4krgrCpgnFR9462M9Ag01A9vo4LK5mYag3maP/DNLyYx5lKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skenQqgi0rsZhdYg0G7Y+Y41g07E7ApiSpos2CdHeH4=;
 b=yG/vPT6s1RPX5lWkYIAtIlAinuyBtw/Z3MlSHeBIFTyLvGefKTD3m+LlpDPWOqAWOxSz8QTQJlAs025RmRvRuEEhRYLfbji/2XIrDHOFM8eoLGlmh7IP8FH4v/xYQ3l36BjwSiWQkCXbYyITdB6LiFjtZ6xYCMBGudyf+FXAe4W3ksJyYgBm98SRQl1oYTflRdW/m9Qq016miBIfBC8rS2UO+My8P5xCV2HHCe96FUAqaGGMMesf0CefQWWEMVSjgpn33wh59111Er8gu7vMrQP34x1jky9G4YUF3ySOwRqwhEt86FlLTi/J8RLu1pbJ8loSx2TeM+evmqkMjEtgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skenQqgi0rsZhdYg0G7Y+Y41g07E7ApiSpos2CdHeH4=;
 b=hcR8/cjWCF4dYFePP2QEVG219GQzBCi9evYan0+i0hgOypAJhLc6dSxlrQhFS7fGtdENzWG7gPlwIulSVIGMVonOw31rk7y0EhaENFqLT/4Q4QC+A9LilujMyL0Yww3Kq7lpYyYTufBpcAiBxa3UqTzkG3m/+RzkJ1ayGU502LY=
Date: Mon, 29 Jun 2026 16:29:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22 v2 3/4] xen/irq: handle IRQ being disabled while
 executing its handler
Message-ID: <akKBWHftre8AF3f7@macbook.local>
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-4-roger.pau@citrix.com>
 <d965a04d-c66b-4c7c-8ce7-c1da029a6b7e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d965a04d-c66b-4c7c-8ce7-c1da029a6b7e@suse.com>
X-ClientProxiedBy: BN9PR03CA0470.namprd03.prod.outlook.com
 (2603:10b6:408:139::25) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2c9dcc-4725-4802-31dc-08ded5eade67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	riNk1t+R6HRAnMcRYR207Pv7+1JVfHI0K7OUqXp5DgjCHeCkO5CdmFFngBXghf1TWDp97TKrkAjlalCbz4dYOk+h7LwLHUpUR/aXB50+wrqJJcY8qpRt7EcfMjagH0CVJyubtdQqp29cUVqCxftq2Z5U5GM5GpLWcdQjnpZ2AzRb9IkI48uXPmH146qrHznFAWohRVSkZXnLKfHtDhLRPbl95Y2rOPcGghCTc4hGPqUqXX7DeN0BmHgu6LMKK62cdFBpG8HZvjjsfwq00ZRFX07Y+1UKWX2tjpomrdqOT3qtHwoX0YYJOvX+zT8yf/f/ixPqmU/QkMNHy6v1lCIK1QROr5LEmoWfgCj0y6MgOEXlZnhccrCz5IfypqNMeQPtXiJwIqlkCUuwOY0AfuQpOIhQVlwFujotKjaLSB94eKG6vfu4TdkOdHghPtpWOayCez8hwnAgX11Yn0bLxJKVSY/rSs6xrpibSxUJ2hn4eIJ47rjEy4QbL6XjrUHdbMOsw/dmNL0ZXZgm2tGrfu79qeY/S+aSw5+ky8S6mUByhSMQiUfE6bdSuKj+IC7/QUVCF44JuZmUNsCwDw9q0C47cXCtXijqHB29oMSmHa7G3Bqxt9iAKSgAxvAz6N95TVCH0cIVCdROSh4WAEchDfgTZz/m6z9VknOL//M0mGaCleg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmhiMTJLd0IwZlB2S2ZDY2RRZWhxZFJ4R2lCSFNuTE5ObHlVSkVoblVzcXAr?=
 =?utf-8?B?K2ZMVWpxSlBFNzQvbW44cFJRbG95VWJvc0wxOGVibS9HOVA2WmRkUXhRTkcv?=
 =?utf-8?B?QUhTb3hyZkZKdFBPVy9IRFY2R29TcFhEdTR6NHJnQ25zVVd2Sit5WnlRcU9v?=
 =?utf-8?B?cjRtOFpta0U2eXd0RzkzaGhQT3UxRzIwc3FpWm9palZUbnB1VUdQRysvaFpw?=
 =?utf-8?B?NEIwcHkweStJcUhZZUZXM0x1N2pNdHUxSU9pUG5FZmZyTlJmTjUrS05qUUtE?=
 =?utf-8?B?c2Nsa1NVMllXQ1dvZGRCZ1dPRHJBc3h4L21CQ1RySUMwTGxoekZUUWtoN1l6?=
 =?utf-8?B?SisxR3c5b0NNdnNpajMxNUViSzN3Vnl2b3poY0NwdisvdEpINmxaM1Urc09L?=
 =?utf-8?B?TnRYM08vUjE1YlYvT0NWbmZnUWU1TEMrcUEzekl4TjJZRzQyaUFXSnM3UU03?=
 =?utf-8?B?YWs4UVZHOUIxeXp4UEpsbFZvdHNScytFNzhFUUpXbG5zemF3Qmc3STBEL0NJ?=
 =?utf-8?B?aVhad0hPZ1FOWnVSY3cyOHBNbW1aakFscTBYcE5Ed2ZSSWxMaXlYQmZvREdZ?=
 =?utf-8?B?SVBEZVBOYkcvSTQrc0hBME5NNUFnQWpYTjUrS3lUV0RyMnh6UUlQeER1bEd5?=
 =?utf-8?B?OHBVRStkRlhIM2F6amxRcUVTS2dwRndTZFdPUUJhdndyWGxEbjBFQnhXbnh6?=
 =?utf-8?B?NjQ0T3dOVmdUQ0NqRGdOQTBaRXpMYklRaytQYjFEVFZqWVhCVi91cjgrNFJy?=
 =?utf-8?B?Q2VVc1NUZmxMRmZ1eHVwTnNRdW5iMUltKzFuZmlnY2QwQ3pQTVRxUEF3MGNG?=
 =?utf-8?B?OHd0aVA1ak1RY1ZpWGt4S0wwcklQNHNmdGpROUlzZE5wTE9QUyszOHNzL2dQ?=
 =?utf-8?B?UytaNkZnM0lNam1ZUS93ekxRcWdXeE5ra0dLNHVMdklsNTBzamFmM09NVVoy?=
 =?utf-8?B?Z3RmTURaK2dGeDZqc2hOYU1vQVNLbDhwY0xvaXR0ekJXSjRzQWphR2pxSHlT?=
 =?utf-8?B?L1BIY2hZbmdWTUtJbHBkYytlTDBBcGNMY3hiNG9MNGRObjZTRTFEVzdvTnZW?=
 =?utf-8?B?ZFUzU0NKMHZaRVhqMGhBdzBEVVFFQXpQeFRWVmtKWHY1bm43Rlo5bSt2S1gv?=
 =?utf-8?B?NHM3MUFKSUVJRWxqdGk5VXNrTnlyamtpaVFlL3FlN0FjQnM3VzBzTjg4ckVP?=
 =?utf-8?B?WVdvSmhDNUM4OUpsZWxjVlhBbCt3RjhGR3BrUkovZDBZa1N6cEdGWjV1THVU?=
 =?utf-8?B?bHROVFN6V3NIc0dyZnhTd3BLM3gwalhJeXRKR045VkwzRzNYR3hRczVFcUZ6?=
 =?utf-8?B?TWJjOFBzTW5SSnkrU1BGVDJnV3NqRDNINVJseEJIdTBzeExhWi8zOEp4RGpJ?=
 =?utf-8?B?eHFnYWJSTXdPQ2xEdjBpdzYwVVRsdWhnN1B5akEyUFlYK0J1b2RncXF4SWM2?=
 =?utf-8?B?bWUxQm4xdFJzYk9JNklEZm5kNWNjWTJoRk9RU2t0RGVzUTlKVXJ3MmxjSVJZ?=
 =?utf-8?B?SFk5bjYvQjd1NGJyTlJLNGN0YVhZNm1rbVE2K0drYi9qT09ZT1gvMS84Vmp2?=
 =?utf-8?B?MzJZN1UrazRKc3RoRDN6aktaV3FrTnZXWEFFcnhZRkFVRHJ4WDd2QUVkeXky?=
 =?utf-8?B?ZVZNZkJhOWdjVjYzRmxaakJESkVPc25MU3grc2dCUHljVzc0TTUxVVZTVWQ0?=
 =?utf-8?B?VHFTVWpnZDVCc01zM3lNWk8ydGc3d2UwSERwMXpSWU5BWTN1TklaalFoQ1FI?=
 =?utf-8?B?dTFzbTJkNTBQU3ZHc1hTWi9CUGhtUkYyVFhML2VPeGZJaStjOGRiaDdvWThM?=
 =?utf-8?B?WjF3MkdYaVhFQ3ozU01JZGt0RWJtbjdUaXpyYU4vRlZwSFFWaTNEbGFqamt4?=
 =?utf-8?B?THZhU2JFY1dIQy92eXFnb3gwTVlRUS9haGtORjJ0R2xKK0wybjBUQ2R6U2F3?=
 =?utf-8?B?Q1AxTDdHUzc1ZTVodk14K0ZQa1d4aUlRUFFpTHdqR2NYVzhmaENoYk5qdy9i?=
 =?utf-8?B?Wk8yUDJjQzZwSk5CUzRTRC9UM0JEUzNwQWFTK0Q0T3JLbmFjMkFHaGllVnZZ?=
 =?utf-8?B?RWd0ZGV6OVZqNzIzOFpQRVhNYUFCTnhkSVFRNXFMRTVJQVd3Q3dIdUo1c0xK?=
 =?utf-8?B?WC95aGdZV3lseFN4NmhvbFVGaEUvY3ZRa2FFaXEyY045ZlRuNFdVOUo2U3VS?=
 =?utf-8?B?OHQ3ejlvSDJXdVpuai9tN3NBSFNxUmRZQWVKQ2tqUUxQdTNuSGk5bjFCZUtZ?=
 =?utf-8?B?aGhvK0F4ZXhVWVE3NzhBSjFsTFduRTd5Z3pGUE1wbGVaSnRWRloxbnVxTWJX?=
 =?utf-8?B?Ynp5NXJZNko0c1JEQzZJemJKYlV6N01KQk9tS05OY1pHY1h1am8zQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2c9dcc-4725-4802-31dc-08ded5eade67
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:29:46.5586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKE5j3eRwV6e3a9SpHzWFKdrVg6+FgkgugG99cevHkBWHANsQIfN/wcm35MHg4gZiC6gvaWgLTCL69onuo5D7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7268
X-purgate-ID: tlsNG-33051d/1782743391-BD7BF5D1-367FE0F7/0/0
X-purgate-type: clean
X-purgate-size: 1094
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,macbook.local:mid];
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
X-Rspamd-Queue-Id: B3B176DC0E0

On Mon, Jun 29, 2026 at 12:31:56PM +0200, Jan Beulich wrote:
> On 29.06.2026 11:45, Roger Pau Monne wrote:
> > It's possible for IRQ_DISABLED to be set while running the handler
> > execution loop in do_IRQ().  Such disabling can be done by the handler
> > itself, or from a remote CPU.
> 
> I don't think the handler itself can legitimately call any of the functions
> setting IRQ_DISABLED.

Hm, yes, we still have no interrupt handlers that set IRQ_DISABLED,
but we will gain one in the next patch, where ns16550_interrupt() will
call disable_irq() that does set IRQ_DISABLED.

> > Check for IRQ_DISABLED not being set in the loop condition, as to not
> > execute the handler if the IRQ has been disabled.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Preferably with the description adjusted (or it being pointed out what I may
> be overlooking):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm happy to clarify the commit message to note that while we have no
instances ATM, but that future changes might introduce some.

Thanks, Roger.

