Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nWDcN6QdKWq7QwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 10:17:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371506670E0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 10:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=ToWgxJ32;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334037.1597139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXE7l-00008U-3x; Wed, 10 Jun 2026 08:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334037.1597139; Wed, 10 Jun 2026 08:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXE7l-00006O-0c; Wed, 10 Jun 2026 08:17:21 +0000
Received: by outflank-mailman (input) for mailman id 1334037;
 Wed, 10 Jun 2026 08:17:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXE7j-00006I-JP
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 08:17:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXE7i-00GVhH-OF
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 10:17:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a291d85-e002-0a2a0a5209dd-0a2a450be806-34
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 10:17:18 +0200
Received: from [40.93.194.50]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a291d8d-212f-0a2a450b0019-285dc232c12b-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 10:17:18 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5486.namprd03.prod.outlook.com (2603:10b6:a03:28d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 08:17:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 08:17:14 +0000
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
 b=dcpGzxqrglWlrVpDCg6hS0HvMbKCKm8FcSZjvbklbXROR8mMy87p4RGMM2Zn170G30Hv/xhepCQlNPuTTmiWBaasX4rxKZ1EkR/jWAyvGHflgzrgDtFahG9QYW+Zref2Vq7OILa0A3rBMLB9+ZVhCd8Q3ox8iDpwS0NcAT6Sf8TCA4ITkk4SvMiYvIvTzqgAQkBCzVRJbJZfx1Grhr05qh5KY64XpZHBVo8ILVHqB8ZApNf7OcgfXP1di8YqXo2lvuOiQW6gXM9CLcBcNhx1eoakmHh3NjDB+0I1Ugx2UUVUXbtOF0wpyw2AUx5KwGVHHpf2L+WfsFeRzU9Dhlxp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgxPeQiHzy5MFC53Ih6zlOVW63bX/+mDZKrUhHs5CNY=;
 b=f70P1yC8sXBbmedbFdcepj5Q1QVV0OUwqGLxpURX3AxP95kWhIDzWCWIao4J2qjZWyeGa63fB9i9nuGcXmWvqdi1y/ffuQ+NsnRBuM0zaISmBYtAEms+etAlFtXSW3wyATXzdBr9JI5NuTlhXVSNPnjCWJfdG68BAl4BMSYsfGgZs0/yqMD3f4EId8dWRgR1I+isAQ4RM5mdJe/nPufTddR0BY8f17V+xkfQhskqwtFFlwxOvmvEG1oRQvFls6fzqaUvllMmjnXtsho7XKeNp4otgrMCmywpddMs0YXWyBPoYYcpBCjFC1mp4IxSZp2/9mmsD3anXgMpO3BiFDIqow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgxPeQiHzy5MFC53Ih6zlOVW63bX/+mDZKrUhHs5CNY=;
 b=ToWgxJ32E03WSrjJV2H+ylr5Kx1X65DIk3Hl1oJ0YaLOkOZMV13eq07YgpsdsYt/N6n6uzV8tJs/7ieLG6vLWtCODKDZfsxfSk/2t9PJTRTLqWC8/eoy1LP1lIqlY99TIlUfqQFFWwZr7CMZeSU177Ab5tMoGhdaYtjOGBHZoLA=
Date: Wed, 10 Jun 2026 10:17:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 1/2] domctl: Handle XEN_DOMCTL_getpageframeinfo3
 without the domctl lock
Message-ID: <aikdh1quWI8TF47O@macbook.local>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <20260609151528.2426788-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609151528.2426788-2-ross.lagerwall@citrix.com>
X-ClientProxiedBy: BN9PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:408:fc::34) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5486:EE_
X-MS-Office365-Filtering-Correlation-Id: aa888245-50ba-49dc-d8bb-08dec6c8ad98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ODedK+WGDL9fAo2g//IPbNAL4Zdk1t4WupCLOvzOeYQE3MdvZeE1BximeT3gZVF0G/ohSOC/tXxjq/9iYfJ7Ly47RwvQzVkaxOG2ZNYsNobTg3fe89XhUrKI+6lnWRtRpeZZlYN4gJSgnJ/gH1raAfG8QgycSlhx0n2LdaxdNjJa+cuKyRinQTe0mtP79Fkc/Bwykn1f+MYEXY9seiKf15+QI2zUJHYjnrz8P5h6ivy9zpsq68fMNQISYy7MRcEjGOIvec4Hmpvj+dy8yuJcJI7f+Exj4NXQKQeXozrXbVklG6vqr56YrOKrz8WADSUN3uW8benBFGB38820oxBB4FinruMA1rN+GR6IEB5BUMiWmng/VCa1p4VS+cCMBWU7qtzvaC2V6i8EgtC+lEmQo/YynNZgKCNEWa/tR1ItCH3YvqPEyvBauchKJaNNYXgJk/6UVj/orslgYuAxF6H6cZez4R0EFAvMEPXRZ91w7IsKHAnHNfY9Or3MgF5EBfsgIHbGo7luBU5DxHoWdar0hmQgwa9zhT7wXKrL+xwONQOsLKasH2bt5cS8aBpP73qr9pRuZHjq8fT+9xcV/f6GSIJvz2t6tzIdr1wCVaALEWiYX2veqohUEugX0gmr8kide456c3trtudRJAlXMOvNxyor107dWOf+gYvEeALb0ULE9savF9/CtH6o0x1B1rYR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHJ0UVpEU1dtRHhXRU9wUUZWRFkyUTZOTWExcm1TZUU1bGloY0xuV09oblFL?=
 =?utf-8?B?T1F6TzFSSm5nOEVrSGVMYTZjcHlEL1V0c0dWU2kwMGZGNFlsUk1OcGJtRXM0?=
 =?utf-8?B?M3hPWUR6OU40cmYrSmw4VndOMlNrTmYxaGNLMk56aUlFbFcvZTRnQVFnaWxL?=
 =?utf-8?B?ZHRtb1ZKQVhEZGYrNW5vQUxHTndjSjVpdVJvYVlTdy9mTytKaUZVOWhCSDlK?=
 =?utf-8?B?NitkNTFzZS9wSXY2WVNOWThzZlF6djAwZ0Z3Yk54aHpVcHlubWpqTHdlODEx?=
 =?utf-8?B?LzJWQXpSSEplcUpzbVdUcVdjd3I2Q0ZaS3loYVZKTTd0dUlZYU5scG12V0Fw?=
 =?utf-8?B?R3gwZGV3U3M4b0tsaHA3TkNvL3Y0TTZVSkRMZVZFMGFweVI0Rm5mRTZCZytn?=
 =?utf-8?B?aXJwbnlJK09yVnA5ZXBOMk1xbXdDMC9SRlZLL3hpOHIwa09jdDZYRGtzQ203?=
 =?utf-8?B?ekh2ajdLMDNVWTV5ZklMbWZjL25BUUtPdyt5bDA0ZnVYdzZwTlMrOTl6K21V?=
 =?utf-8?B?TTdGUUNvVmk5QXJBNkhOZEl0UFVZbGNFQkNHMWxRa0dzV2JQNU15RzVXZmdF?=
 =?utf-8?B?WXJ6R2FvYUVSWVN0S1pJR0gybHlUYWVjZFlsRU1yeU9BTTB5MmRQVzZpbjlk?=
 =?utf-8?B?anNRMU9GM21NM0QrdTQzYTV6NzY5REZsRjRydFByMnZiYzFjbXFUNThLNmkv?=
 =?utf-8?B?NzFaOEt4aE44a21XYjdEL2Y3d2RjalN5MmNHbzEwdW5UVjFJcVZzQldqeFBJ?=
 =?utf-8?B?VTdFUzZQNHRqN1lZMTQzN2VtT3FSZzJzcDBZZzVsOVhjNkRLN3NoSEgwYjZT?=
 =?utf-8?B?U3VJRVUzUWlLdnpOcHBXMzNteWFLTnVuTFplNVBzbXExU0t1M1c2U004ZHVG?=
 =?utf-8?B?SFZCQXBTY3FZLzFIQyt1dzlFWDFGaTZSRGtXVXVZVm5ieFpLeDlIUUhWRWN2?=
 =?utf-8?B?ZnlYemdQcHc4bExLSkJKa2lXcTJ5MHhhOHBEMnpQKzRRejhETElVVnlBS1RW?=
 =?utf-8?B?YnplWGxDSWZ1c2VMYmNrbjFIUlh2RG5ycW5HQlJYZUZKLzZWYUR4L2NLbUxm?=
 =?utf-8?B?djFpRyt3STdxM05jSytheWhJT2wxdDB0eEIxLy9oVmU4WDdrUnUwM2d5Sk5M?=
 =?utf-8?B?S3BBZTBNc3JvMGtMV1NtYTV4Nm9oNG9ZRExrRjNzQUFUQ3NXWjdnWUVPWUFN?=
 =?utf-8?B?VlErV1R2eGVnbHAxNVhucXdxR2dMT285NlB5S1VNNEVLZUdNVDN4WFd5blJI?=
 =?utf-8?B?dythUExMcjBsUDhsV0xIUERrR0oyVjFuL3RObzlFS081anNBSVYvQjRuNzdr?=
 =?utf-8?B?NXJ5SDl2WmtqZ3crb3dTcWhxUHZ2VEpHcFlYYlF0dnhxUnpENFQ5YWRpRjJV?=
 =?utf-8?B?MUlRSGdqMHFLSThIVWIyditSOVliVGVCRlR1U1QyQUZyUEpBQVV5MnhneWgx?=
 =?utf-8?B?anMxSXZMZzUyd2JOM1RXczN3ay9hSEVldVF6YU4rcUpIT0NtYk5vbzNFYmpp?=
 =?utf-8?B?UlhYMHJZeEdCWVBHMXpRa29TL2VMa0xCbHRweFFIZEtxbHRzLzhkTHd1M1hH?=
 =?utf-8?B?cVNTTjQyd1ZkZzJndExRQTk2Z2NPdzAzUEo0TGE3djhKZkV5dnJtczVTZFFY?=
 =?utf-8?B?VE1DUk50RjJXckdRTURKdTNPMm5EdHVEN3NCc3UycE0yYUNFS1p1M2M4UVlu?=
 =?utf-8?B?ajZYbUdrekVpTmt0SE55bHlrS0pNckRleUVLRmpEbFVwb3c4dHM4UmhmY2Iv?=
 =?utf-8?B?SFJDWTJpdXR1K2FHOE9nZlJiaHRtcTIyRFRrNUVtN1RGaHp5SjNrVUZGdG9R?=
 =?utf-8?B?a1p5RFo4UzZIUGxCUVVnWVpRQWU3TXM0aU93bnNxd3FWWFdmWGlRMFZRdTVW?=
 =?utf-8?B?Y09ldnhyK0t1MnIwNjJHTDFhdTA0aGhuOS9uMHFocXM4dCsxVWFuY0hIN1Ra?=
 =?utf-8?B?a0FpSnBzMnBTRVVTTkJQSXZFZ0N3bmNLdkZ5dmJBSFlCdG5DdnA0TjZSV1Ix?=
 =?utf-8?B?V294NnQ1OWZEanU4U1JCb2FMeERtYWVTbUFaOENHZnliRjhoWUtjTm1ydzNx?=
 =?utf-8?B?OTA4VWw1RVdiSG9HU0E0SVpWMlNGU3IzTkZUeHo4Rm1jeE1PWVNQZnZtOExH?=
 =?utf-8?B?OGZrRjRJeWJTenQ2QnUxeFpNUjZIQUFUZkxGM0NOMWFhaW5NN0ZxZ21MN3FX?=
 =?utf-8?B?WDAyRlB6RVIrZ0ZrZDRPU2NzSmVCMVFuSWc5Q0l5T2xnaWVpdHhtNm9XdU9E?=
 =?utf-8?B?WGNEckZQbGVHS1ErazEvZjVYMFNNVy82anZmdGsvTDlWNUMyTHdFVlJSZFpS?=
 =?utf-8?B?MXhPRmh6cC9CVS9GcXhDUm5uam1rSENyWWMvWUdGZ21PZDAyYk5rQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa888245-50ba-49dc-d8bb-08dec6c8ad98
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 08:17:14.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XufISh02tEbwuk2YBdO0v2AIiGpr0n+W1g+vH13mvA7ffFpRmVbwQ7np8JRxr9atyH/HX0PAvhGfU7DWJrDRmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5486
X-purgate-ID: tlsNG-42698a/1781079438-13B78F3B-D7B94DF2/0/0
X-purgate-type: clean
X-purgate-size: 341
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 371506670E0

On Tue, Jun 09, 2026 at 04:15:27PM +0100, Ross Lagerwall wrote:
> It does not have side effects and is protected from concurrent changes
> by the P2M read lock therefore skip taking the domctl lock.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

