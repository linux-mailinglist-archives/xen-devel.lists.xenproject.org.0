Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Q/8OCP/TGrdtAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 15:29:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B5A71BE78
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 15:29:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=aoUkCQCs;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356228.1610866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh5qu-0004dJ-3L; Tue, 07 Jul 2026 13:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356228.1610866; Tue, 07 Jul 2026 13:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh5qu-0004ap-0Y; Tue, 07 Jul 2026 13:28:44 +0000
Received: by outflank-mailman (input) for mailman id 1356228;
 Tue, 07 Jul 2026 13:28:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wh5qs-0004aQ-7S
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 13:28:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh5qr-006QUN-8q
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:28:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4cff09-5cb7-0a2a0a5109dd-0a2a450486b2-0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 15:28:41 +0200
Received: from [40.107.209.33]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4cff07-a01d-0a2a45040019-286bd121f638-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 15:28:41 +0200
Received: from CH8PR03MB8276.namprd03.prod.outlook.com (2603:10b6:610:2c1::14)
 by PH0PR03MB989332.namprd03.prod.outlook.com (2603:10b6:510:120::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 13:28:37 +0000
Received: from CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e]) by CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e%3]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 13:28:37 +0000
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
 b=ue8rYCbCnZUeUw8x9gopeIMco21v1jG5ypUN5/o3v/AgvxRu36BaxBHAqlynaNdibiLwekJj7b3ouXEmumIf3q/fkhx9YxyxS1PeXyiCumBrnGc4QGLFWK7e0iX9sGA4fofCrXU+DFfMvDYPG5adDBB5p9LCVY6Tweo1O0I9Et2uN2IBox9ZPaf3KDBEF8XtlQZ5X5EEFlgq1+UPdOnj4dWlb5czgJA8pPv56WDlRPDqZZW6y6JBapq423h37tu9mMBt88ISxqumBGZGQqzwSCQaUK/P9kx6rz6Qa7uuatgY2Mfw0RzEH43aRjWEtSGlUU4KTfk3BG6BD56uicobqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKhqQh1iBQCM+PR/TjEA42YAii45Pn6E3zHgXupnkDc=;
 b=rie7GtF83hBdrBnTLo5Kpbyj98xvmtCacgGfMKnXS/a1sttBVgnb1JO3yWjURf1LeCppNBM8mjNVsxxfUQi+dUknB43w9Vs+E0neDw0m78l81WYUPcOfjpzxKGyM9u7VlL+INL4VOlcfSraM/+qeq4o6C6VvvmVJNdChk75mb0rhHSn1ouPD83f/URNLzgk40R8rJdaNBZTPqP7LoHiAQlgbtiyAdbqtnAW8TmHE/vo/GGnkoi0Piphh92j2qxfalcY0P/6JRVOGZ91/WYKo7FZcAMdg/aiHSaon1Gk3TMLRLQP6pdsbyVPjgcWY1IYf17kaljIdpoOxh2tevQ/dwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKhqQh1iBQCM+PR/TjEA42YAii45Pn6E3zHgXupnkDc=;
 b=aoUkCQCsbwd74On7PYyZrNaA5E72IAKASFrmlAZ5TISyalBkj1XVilr/61sQ0ASteoKyWYkXuBGtOY12XOvnl1z9zPu812wttChEp+KK0K3vehw81A+iEDXsWPHx4a+ypoG28GT6soKiLB5ONsM9pUtrauUrm4SGKyPsY+ViQiE=
Message-ID: <31f835dc-a5c9-44f0-911e-44205361c808@citrix.com>
Date: Tue, 7 Jul 2026 14:28:31 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Improper handling of fast-resumed domains by O/Cxenstored
To: Andrii Sultanov <andriy.sultanov@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1783429662.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1783429662.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0490.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::15) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8276:EE_|PH0PR03MB989332:EE_
X-MS-Office365-Filtering-Correlation-Id: 986d2446-3a52-4ab9-e15f-08dedc2ba5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YYMPZPtUoKaiP2XTxa3dD2zvnhuQq7GZbiGP1OM+EtOn0nqf1qhhiZSzadS6p0B3BN/2CfsONzg6uOD60MerpGBdBv8kjL3ikCpJXXdV8btPCYbZYcTYHPWkNDRCNxNUvQEJBFTKh8OmeQLQLR0is3OrC2XggIZ7Q+GBtEbSuM1aC+D0elcOryosHXBHDfe/h4nBn0/UTpU95+cEQH3JQCFdC6MiRV2JWkXItJUwVMeyqTNb9FaOpyobVFG6bfrrvEPp92odEqhTEAcKmJp8/KF2n21P9712DxWsoCYd+2d22CFr+u721IzQyl48XOUrryN48HCxlBKdEA/pJZojeyPa14s1NOGZRRfE++j4EcU4t4nwrzI73Ee8xNHH9Y1LjnD6bRi5IrR73Pt2JRga5iziBPOQVDd3dO47Q+KDx9iL6hWM8WYxxs28sNX6aO6p7U9JDP+gYWZ+2oK+Wg/xxG6Qrzz0VgxsubfHL2ERPz7sYLsrG3DM5ATfWyLNULs2GSN+2TPq82lERpYKgUkvl8Pp41GBwNyFKEN2bwjOGnmT3u9VtXC5OAoLZWFTzYWfY9dVForn6U7tSM96Jb3qGS++5/PB1cwOsnC8WcENfs5HTPXK8sjpEaqPwldv2zDj4OjRhQ0s9Y2FnGUsUugC6thvuovrPnwips1nEKsh4Lk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8276.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1pVazRnaEpIR2o4SmpyLzgrRm91V2kvK3JPamc0MitWQm1vRVF0QlY0dUwv?=
 =?utf-8?B?VCtYMXZhSWJXUWhkblNGdmp6YzFHN2p6WHg2cGdWbGNnRHZiTWMzWjBqNXNB?=
 =?utf-8?B?N2lyS3ZXRmlwV0wyMHVQT2x2bThYUVAzRlY5NzBDNGdJLzBtT2ZGdm1yaksr?=
 =?utf-8?B?OTZxdE04YUM5UlYzVWJFL0c2dUFxOXBDdzUzZ04vamJxTnhiZTlSV0twZ0tu?=
 =?utf-8?B?ZXREL2ZibTgwK2t3QUpHU05WRlFjMGNWNTRQQVA1M25ENWZqbmJ1aVloRUdG?=
 =?utf-8?B?WHhBSE12OFExSlJpTkthektJSzhTbEx0azNsWkJ3VGRDdjZjTjlIbmVsdnJ0?=
 =?utf-8?B?Tng0UkJYQUhFNnY1NE0wcG4vWGs0VDlWS3V1dFEwMWdMbGhlWlZXck84SEZT?=
 =?utf-8?B?elV6SFN2MUN5R2FFc0w2TXU3VzdXTkZXd2RjSVhOaFFsOWlFdlg3L2w0U2lw?=
 =?utf-8?B?UmJhT1ZpdC9XcHhzcG40UmtIblZUdFRwbnQwYnBtcHZ5ZlRsQW83eXh1ZjBN?=
 =?utf-8?B?MkRYY0F3RElYRHMxcWd3Q0ZuYmQ3UXpLWi9JNGtDVnRxc21jNEs4cEFjdUxY?=
 =?utf-8?B?MEdsVWJJWDNYU3FFVzE4VGNoT09yQy9uL2x1VGF3MkZaRXMrOEZXaFdYU0Zy?=
 =?utf-8?B?WHlLb1R6TXJQMGlMWXM2VE5BRlVyRUx5c3luTHlKN3lMSFJKSGsyN0xUNFVp?=
 =?utf-8?B?TklQelJ1ci9ZWDhpUDU3YXRzbjh1T0JrK2FWdko5ZXltdjUzREZHRTZWR2Yr?=
 =?utf-8?B?VUFwNHlYWUtMTVpMQUtuWlRlTSs4MjFHUkNSL3BRZUJOZkg1UmdwbFpuandX?=
 =?utf-8?B?QXprbFRndTBUVVhJZmNNcHpsaXVBRjFWTytVOHZUSFhFT1JhdDVSRWs2dEIv?=
 =?utf-8?B?aE9UWWJ2ckhGd1lacG11YjhUbjNQTG1jSXlZQkJoYVVKNU1acnNsazUrV3JH?=
 =?utf-8?B?eWc3WjFQNGpvQ2ZLTGNScnVXdlBsakFvZWhETDFEdVZ3SFllTzFzVG5OLzJ2?=
 =?utf-8?B?K08xL1NFaHdUNkFsZjBzeUtzbGJQZTRRR0hhdkRNOWV0SXBWUENMZzBjakl1?=
 =?utf-8?B?c21GYlNaUzdIZUkvUzhONmVaMEZMQWRzV3VKK3JHTUgyenJBeVNMZjFJMFVj?=
 =?utf-8?B?eHBIcmM5NVgxcEw4TCsrVFRNeFdqUVlBamlodElkelRQajhzTEZrb0g2OURz?=
 =?utf-8?B?WWFCbndHUmF4a1E5YXFXY3FZYjJQRXRhSzZOS25oQnpoTkpPT0c2ejQyUUNm?=
 =?utf-8?B?Q0x2Ym4wM2ZWYmtycUkwTHI5SzlFZmVzQnQ0aVFFS1pOMVpSR2ZDV3E1YzJU?=
 =?utf-8?B?WjlTTk1ZdG82WkF1U3ljWDlGSmg2NCt3UjVCWEU1QThHVDlIOTJFcDRoeUJ3?=
 =?utf-8?B?dnVOb293c1d6QW4zZjVMN2lWMEdXV1RNSTVFcGt4NFV4bWJPbTlGOVBlWENo?=
 =?utf-8?B?SlFEUGJsQzJnNW1WTWxOSkEwaVpyMzY3UXIrTVBtTFJQaERvRUlwYjJIZW5l?=
 =?utf-8?B?RUV6ZXdkcHllWFU3S0xpaERtbDVYUGM2UDU5QVJzQldQbFp0OGNTbTFHZVBL?=
 =?utf-8?B?VmJseXNCc2RyMU9GODBlcG1HSlBWeHZlbEwwU3FOdDhrWTB6c1k2V295d2w5?=
 =?utf-8?B?dHNTRC84K3RpcHdLQWF4V2xFMitKSjNoLzA0WU0yOGI5SHM3Vy96eE1HYlY2?=
 =?utf-8?B?YXkvVGVXVWtSRGNIMFlYNEVGSG0vWVV4OGhRT3NuUXZwT254WVo3TFMxQnQr?=
 =?utf-8?B?dHlYSlcxUDFXU09RaHV0RHNWeGJ0NjJuWjRBRVhTQXNTdG1TRlkwejI5SEdQ?=
 =?utf-8?B?VVZPcGRGd1YzM3cwUURiY0R5dUFySVprVUE2akZEaFdqb0JtKzlZSCt2U0d6?=
 =?utf-8?B?MmhPSHkrOHJvTlBBMjN3cTVGYlluN3F3Mnl4SDJTTU9DRFFiL3AvVEdRT3dp?=
 =?utf-8?B?Z3N0SWZlU0N6L1kyTTFjZk04K2dSRVhLSk8yeWhCQlVhZ1lkZ0xJb2l1eXBo?=
 =?utf-8?B?ZGFlaWUrd0lBU1BvUW42REEwTURnRnJWTmg5QzNxMnpwQTVVV0J2TWtXWTB2?=
 =?utf-8?B?WGdGVUZEVmdWU05oRFlVZVNpQkRWazI2WFhkRCtEYnVVWmpCdWNGWDdmek9w?=
 =?utf-8?B?L28wSEhPanhaZkE1NjFzWnpBKzVTTllnaW1PUEJEVVE3MFNkNWx3YXF0SENY?=
 =?utf-8?B?OFQwWXZrUCs3dmEySDZqMFN4bU91VXB2MllZT1Y0RVVXV25EYzJ2Z3ZEcCtz?=
 =?utf-8?B?ZmVKOS9nMVh5cWxza29rTVVaYWhKaFRTL1pNaTc1Z3dyamNHV0JiQnZWYmQ3?=
 =?utf-8?B?Q25uQ2g1TVpGWHhHbXZZMkFQWm1zdUt6NnlBWTgyQy9nSEE1OTZvZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986d2446-3a52-4ab9-e15f-08dedc2ba5ef
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 13:28:36.9733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXLUkIIuD38WM6jHBFPpno0wpyEOTJemh2rWN+ET/VxPIR3bAAJNh576yr0AQ3GRruK1OGsS5a00CsIpNHLL52bTEkOAT9RB4SwYwEatMDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989332
X-purgate-ID: tlsNG-ebf023/1783430921-AD13E1CC-E1578343/0/0
X-purgate-type: clean
X-purgate-size: 3489
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:andriy.sultanov@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6B5A71BE78

On 07/07/2026 2:07 pm, Andrii Sultanov wrote:
> Both Oxenstored and Cxenstored don't properly handle a shutdown domain
> (even if shutdown_code == SHUTDOWN_suspend) coming back because of
> xc_domain_resume(fast=1).
>
> Cxenstored correctly sends @introduceDomain watch events on the
> initial INTRODUCE call:
>
>      IN 0x1f78610 20260619 15:45:37 INTRODUCE (1 1044476 2 )
>      CREATE connection 0x1f75870
>      OUT 0x1f76f00 20260619 15:45:37 WATCH_EVENT (@introduceDomain domlist )
>      OUT 0x1f76ce0 20260619 15:45:37 WATCH_EVENT (@introduceDomain 
> squeezed )
>      OUT 0x1f77c40 20260619 15:45:37 WATCH_EVENT (@introduceDomain  )
>      OUT 0x1f78610 20260619 15:45:37 WATCH_EVENT (@introduceDomain  )
>      OUT 0x1f78610 20260619 15:45:37 INTRODUCE (OK )
>
> And it sends @releaseDomain when it notices dominfo.shutdown (without
> checking for shutdown_code):
>
>      OUT 0x1f76f00 20260619 15:46:56 WATCH_EVENT (@releaseDomain domlist )
>      OUT 0x1f76ce0 20260619 15:46:56 WATCH_EVENT (@releaseDomain squeezed )
>      OUT 0x1f77c40 20260619 15:46:56 WATCH_EVENT (@releaseDomain )
>      OUT 0x1f78610 20260619 15:46:56 WATCH_EVENT (@releaseDomain )
>
> But after fast resume, even though INTRODUCE returns successfully,
> @introduceDomain watch events are not re-sent:
>
>      IN 0x1f78610 20260619 15:47:06 INTRODUCE (1 1044476 2 )
>      <----- no watch events
>      OUT 0x1f78610 20260619 15:47:06 INTRODUCE (OK )
>
> Oxenstored likewise avoids sending @introduceDomain for "re-connecting"
> domains (which is what it thinks a domain coming back like this looks like).
>
> RESUME does not re-send @introduceDomain either, it just marks the domain as
> live internally in Cxenstored and is a no-op for Oxenstored.
>
> This missing notification leads to all kinds of issues since the toolstacks
> don't notice the resumed domain is back (at least on the XAPI side).
>
> Is this a real issue or is the toolstack holding xenstored wrong here?
>
> If it is, I see two possible options for handling this:
>
> 1) Don't consider SHUTDOWN_suspend domains as dead, only drop them when they
>     are definitively gone. This avoids the @releaseDomain notification
>     and hence doesn't require another @introduceDomain
>
> 2) Do actually send out @introduceDomain for thought-to-be-shutdown domains
>     on INTRODUCE
>
> Thoughts?

At this point it's very evident that fast resume was never done
adequately.  Which means we need to go back to first principles.

AIUI, the point of fast resume is for memory snapshotting, where we
drive the "save" half of migrate to produce the snapshot but then resume
the original VM with it's original domid, and it can skip the PV
reconnect procedures.

From that point of view, it seems wrong for @introduceDomain to fire. 
Yet, a @releaseDomain did fire when the guest suspended, so the backends
will have unmapped the rings/etc.

This seems to defeat the entire purpose of fast resume.  Even if the
guest knows it doesn't have to change domid, the fact that all the
backends close means they need reconnecting, and the domid aspect is moot.

Unless I've missed something, fast resume is wholly unfit for purpose,
besides just broken.

The only way it can reasonably work is by not issuing @releaseDomain,
but that's between the guest itself (which does use SUSPEND) and
xenstored when handling the VIRQ.

~Andrew

