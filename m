Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JTEwKXKWJmrSZAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:16:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4829654F17
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:16:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="uoPnDs/j";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331519.1594078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWX1d-0005Jp-AK; Mon, 08 Jun 2026 10:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331519.1594078; Mon, 08 Jun 2026 10:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWX1d-0005HL-7D; Mon, 08 Jun 2026 10:16:09 +0000
Received: by outflank-mailman (input) for mailman id 1331519;
 Mon, 08 Jun 2026 10:16:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWX1b-0005HB-Nt
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:16:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWX1b-002Px0-10
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 12:16:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a269661-bab6-0a2a0a5309dd-0a2a45068580-14
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:16:06 +0200
Received: from [52.101.62.68]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a269664-7371-0a2a45060019-34653e442dea-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:16:05 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA1PR03MB8062.namprd03.prod.outlook.com (2603:10b6:208:595::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 10:16:02 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 10:16:02 +0000
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
 b=pm34FWFFvnyY0rkhY/2xk9PX78dbuQnj7wAp5B6yf4A4hLWewcCL91QFSqxzbyYUDbUNlM1Wfh2VoGDPTCZW2LIjZP4qzbjZwEz6HWX3rFkHnm+ljrXOHSOpj+tvFr6wHzbeHpcYgQd1pNRgtusKtZ4nEi6qaI2wkm4GZpnG56TYPlTVQkaqVyBKk1B+vaJZ+oWJ0hqCwLUwgAwLEWgP/ATMquCQSrLDEr2dI6TxaoUoFeGrOA586yUIiCqFVPyCKpDId4mi6IQSEWy7IMrn6VlCCkVyy/s0DOjQH+O/ke3WPEgRHFeVxpQMlMSVA+1NJqV+0fSQhbR6u1f7/AtVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVSMMMfe2nen8k+tzs5Nukj7RJ5fSKWkQe2efcBeotQ=;
 b=OvflprWq0gd+2cfhnFiBnmYMxVGzo/2oRZMJ2saVXN+09S7bb1L0YdVtmpmFyM8f0OT3jTCzZkmmkNE/y1Xsi7x4Cqgudmixutu1s6Bqvk/21eea6zyu/DvN7DehshYym6Xai9AMmwQlK+Ca2r4WfT0DiZ2NQSvXDBEccL75cNPTPBVhRsUlY7q5uRrkqrFTiHCwTLTYrVoWGQ6ajcN/kwFSpJ51UnOsQt5ISaacVmyQ2xDFx1bzIdlmVuRjh0OkzLi9hLhs1ZYVb9l9YwX6K0cQKhG8skRGSV4h+YFpRZzQwPwN0bdHMmZ0160DMbXFLBweQ155PvB2gSipm4tAbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVSMMMfe2nen8k+tzs5Nukj7RJ5fSKWkQe2efcBeotQ=;
 b=uoPnDs/jxCw8a9Q8bO0n8mu3rwIHMfOCpH3Az7Q3dpz0tLUQqMM1i7KIkekbZl0Rqo6zkNNvaUQ5LMtGcvHtn0TfRNf7pPnQx7PK/qCxU/B5uDiG5UTVi2WiqmrVHa/IrlO7e0/DRHhx5u+BCHQl8w33CehP0zBx3vXzLZAB+nE=
Date: Mon, 8 Jun 2026 12:15:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/2] tools/configure: Detect the presence of liblz4
Message-ID: <aiaWXkYQlNpXs51s@macbook.local>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
 <20260603085331.2704108-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603085331.2704108-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA3P292CA0029.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA1PR03MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d95ad58-ff4a-4455-3658-08dec546f13b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BxOmIGqwq21mKRt36nWtir9VEIC/1lyACB2R6Fs0LcAf/EGFXt1ETSsWGlFKa55fD3FL/J+45Q/xueWztgi8r2cMwGG03Fbu7DCM9lySKmew2g5VADxIh6oHWx9aIjEk7ln3YKyrSbPAkGBAn/9Ms/ZIeJ65ROYUmqKFHFo/qfyNT6IavZAZ8fNYv4VZpUJxWwSj8VoTRfD6b+tLYeXB1Yzx4TTselL/lATYX01RqE1aCTeKj+yYG2QJYJrMJtFD7oiATQ2aThUH0zzRH9FcdPuy7zDlTyP0+R+r4wBxLFNKL2YQTFyCsPgWkREHellm8lY251GXIRLgd5HC0aKpBAzMgQYogEppMWFRyleoj56LkXnutpScFIfDyQNn/BEYwoKUTF+9Ty2ZoNlDT6EvwHQyPYwOj8Yj1xWHHRcJ0RIoDnit3K6mxoDK07Xntx5Mu5hbqg/4jhtQ/RzlbnrSeo/SuCD6EwHETmx5x+1/X+7obw7yL0h9Cc4yxFlLytBHlqA7gqnCeWwLjtmap/cQsBUV77BhO171r3+alt7P8TdPOlt+AJXy0DOU2fFt85PMAA0CRN4S8+BE9aE7xnYJE4Xi/CtNVNNVqDVfvwHKFoGmqZX4ETbHJfkm9/YiH/W4WdaAyZYfPUKAZd+gnidF1s2U9ZIalYr61uXTi0zcGytqTK8MOcOxHteFqVmlQf3j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVZPQUloVmNWTlZIM2xLNVJrcUx2ZXFzVkVrMis5RzIxQUJHQ0dkT3lSZVIr?=
 =?utf-8?B?ZUw0NjVSdzdmQ2tBVVZhOW0wYTJHL2Q0bHlHZ2FYN25US0VrOHFKdjJacVYy?=
 =?utf-8?B?QUN0TzRRdm8rdlRRNURZd1luN0RxcXBWWEJtMW9zRXhpdk5XUUpJU2c5N2J1?=
 =?utf-8?B?TC8yY0lQdlhPaXNneDMwK1ZxWlR5N0MxME5mbWp4SEZmbVhwaWdOUDRSeGQz?=
 =?utf-8?B?T0s4aklMY2xLVklwR2pVRW1Pa21KeVpyT3R5TmM4bnRMRDBFTUVCalNmcFIv?=
 =?utf-8?B?MnRmQmZqUWVjbHAyWWVIL3YrMHBsamlRTElhamVzRHI0WnZhdXZjdTVISmFE?=
 =?utf-8?B?RnZ6MkJvOVZGUzRUWm5vc0JEQ0Q0VldmeG5uVWV1SzVodmdiTm4yT3hrREhE?=
 =?utf-8?B?VUtBRG5Ld0lPWko3aG9nREtOMnFKelh4Skp6K25nbGNCeU5CNDIwNjI1bkFC?=
 =?utf-8?B?djY4S3o4UHdDTzRPeTBRVUx3V2ZLM01kVERqNEs0MktQeTVWaU5CcmZwL3VB?=
 =?utf-8?B?b3FXeUYwbXZnUFVDVVdhTmNmNFFpRjJING5ZM0lGYU04bDFvazZVdW1FVzFW?=
 =?utf-8?B?K2l5WVlHL1EyaXlWRUxjU0prRkl4WU02dXFPeExPdUJGbFI2UHNPUm45Wmtj?=
 =?utf-8?B?VjZBZVpiUU9uckY1cUFMeVRuSE9GYjAyVFdlODF3UWw2SHF2Y2ZqWXR4dUFP?=
 =?utf-8?B?cjVua20zOFVJMzhYVlkrTy9kN2cxL0RudU1vSGQ4akkxT0MzZmFYUEQ4T2wx?=
 =?utf-8?B?RzhhVktUaWluVHQrRVRaMjdKTmZ6SndPSzhFWHkxbzdzN0ZxVmczUTBpN21v?=
 =?utf-8?B?YUZnaUxiUEpTUWZCa2hEQnU5bkdENXM1N2hycks5R3VNa1lGdEovMUg1YW5a?=
 =?utf-8?B?TGpOMjlLa056WGNkRW1tTUlpR0xiSk41aHFhUGhYVzBTY01MdXFabEp2OVcw?=
 =?utf-8?B?VTEwR3hBVmpLUDN4UWlxQWJlSStVanVncnBFY0V0ck43S0VidHBTRExjYzdh?=
 =?utf-8?B?K2sxOVArMjJ4em5BQ3BYemNWdUZ2OWF4ODRVVmdPNFo1OEc2Y21vL1R4QVZ0?=
 =?utf-8?B?Vk5zM3JYM2NiSXFnSUJMWnNIQkV0cG9BbjBBSkMxL3N4bkphUzZscTF5dHVi?=
 =?utf-8?B?bHhrQy9uQzJOQllBT2t3WjVDZ0QyN1hKdTJQSkU1NWcrTW42WVBEYzQrRGh4?=
 =?utf-8?B?K2hOUmNJV21MeWZWMUtVS2hPcm5TSFY4TGllcFhueU4xcWdaUVpOY1hNT3Zo?=
 =?utf-8?B?VTVKNERvcjFlUWF0N3ZSQlcwbkJRVTJMaUVuK2Fnc1pvOEhhOHNiQ1JoWDBZ?=
 =?utf-8?B?U1NoTWFOMWpYL2l3WGVYV1NzN25tWUdIai9nKzZVcFgyRXdCZS8zMW1HZ2ZW?=
 =?utf-8?B?Q0tiZDBEd25uQ1ZwK1JoWS9haDlqd2g4b29FZzZDZjFid0JwdWZFNnNyUWlv?=
 =?utf-8?B?WlIrUy95SlB3Z3NzMTkxanZQcWZDYjU1VlFyN2lQZmNrdWtaa2tpYzdkY3Vo?=
 =?utf-8?B?M1UweVFta0RTVnhsYW5YOVpTZ3hvS25QTFJuaG1ra3k1QXBhYjNoc2ZHdW9z?=
 =?utf-8?B?VVdqNFVGVFZ2YlBORmszdnkxc1JyaGJmSFc2T2hFVEQ4TlNESkxEQk1wTXg0?=
 =?utf-8?B?TUkwWC9XVldtaGZTc3lxa2Uza0ZXK2VsbnVwdEY2cFFrZDRNZFErYjNFRm03?=
 =?utf-8?B?U3RPWWRGUFo2TDMwRUU5aDN4ZnBDZGZlV0FwdjN1UHRnN3lsbjR0c1cwdTk2?=
 =?utf-8?B?Ukk5eTEwd2pGYU9PSXZ6dnNWRkpPb000OWhUL2svYnZHRVlUVWdXV3ROWkUr?=
 =?utf-8?B?RGw3R2ZyU0NGWkJZOFdlc3VrcEVldnplaG9PckFoYnJWNjdXSXNRM1lQeExK?=
 =?utf-8?B?QVcyeld2N2NkTWJGQVVBOGlKR2t2MVppNUdrZVBqdVk0UG9pREI2SU9tRnNB?=
 =?utf-8?B?WXhqd3M3R2FHZ2NwUmg5SFNxckkxVkhmYVJ2ZS9yQ1BmL2g1bXZwNWNORHNs?=
 =?utf-8?B?Vjd5eDBGY2oxSitSa1NQcmpCa0ZyZEdScVJrV2tzakNzQTVFK1poYnc5RlN0?=
 =?utf-8?B?UEZuaE02SGJaZnVyc3pES1N0Vk5aSS9Dcjg3dVFYY1FZcE9ybU1pZkg5V1hy?=
 =?utf-8?B?VXFXRDEvRzQzdTJZdDJtb3VSTWlUb3NLalMxaDg0WE8xQjJRL0NaNDhMMzJx?=
 =?utf-8?B?eDJxZEZqTVRaa2QvMStwNGRwOWtZdDVnRVdkN3A5d01sWFcrZi9TVldraVY3?=
 =?utf-8?B?UHBPM2ZVdHdZMnZlZzNWb0RtQVdSMmVMaVl0NVZNSmZISWhlKzJtMlpwbi9O?=
 =?utf-8?B?UzBhVC9nMlZsNW5TVDlpSUd5NkdiVjRZNDJDQnNLREF2MUUzNXJJUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d95ad58-ff4a-4455-3658-08dec546f13b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:16:01.9964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUXTdBqTCTwFspiiEkyPN1ovs5Ks5DoqCqrIBs47CqiGcseA2zRRIB5iQH25swriDRayMkT/8Uf7sKr+8ejmqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8062
X-purgate-ID: tlsNG-16d1c6/1780913765-8D785D75-4AC5D4F4/0/0
X-purgate-type: clean
X-purgate-size: 356
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
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,suse.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:from_mime,citrix.com:email,macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: E4829654F17

On Wed, Jun 03, 2026 at 09:53:30AM +0100, Andrew Cooper wrote:
> As with other compression libraries, group liblz4 into ZLIB_{CFLAGS,LIBS}.
> 
> Add the packages to the Debian Trixie build containers for coverage.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

