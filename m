Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QABUIDcY3mlBmwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 12:34:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35253F8C5F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 12:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281574.1564434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCb64-0005MZ-Aa; Tue, 14 Apr 2026 10:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281574.1564434; Tue, 14 Apr 2026 10:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCb64-0005KY-7V; Tue, 14 Apr 2026 10:34:20 +0000
Received: by outflank-mailman (input) for mailman id 1281574;
 Tue, 14 Apr 2026 10:34:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wCb62-0005KS-5G
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 10:34:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCb61-0091k8-D0
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 12:34:17 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69de1816-5cb7-0a2a0a5109dd-0a2a4509bf4e-36
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 12:34:17 +0200
Received: from [52.101.201.58]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69de1827-bf79-0a2a45090019-3465c93afc7a-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 12:34:16 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5573.namprd03.prod.outlook.com (2603:10b6:5:2d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 10:34:12 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 10:34:12 +0000
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
 b=ExzE881PzynhrciFQfyBS2bSjDlG6dA1hcz5KCX7MkZ0CZbC/GoWd/R4LJq+sh4GYrpoh24T/rrsBw29zeJAQzbYyGbbsJS5w+BbRcyFtiHADVf+Q0VT/+AsZL2S4S/q5d7lFBl0d52TO4BNSeYEFVk3jPoF2ugpNn2WtRQYURlswsPseyb1Nlj1sRAzllOwOaxcM9pIK174Cdr+JftAlhq+RXPq9dn9Hb+zcV176EXFXn3UkfjO5DlXACJn31x/hCtIItViw/LWThoS07+m2cI/Ajb9Qq96SyJuRzXJI59GgLRSLWL9bwGvU5RhkNZRRpFGw7vaSeAAOMoOas7yXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkmC8IXQxgYOEFFtKm/qpnF1ibUpy9+DhFJIcy5HhzQ=;
 b=IsghH2346Dr51BGHwL9i+e2TVbZB4VPJFp1mCRi9++Y8WYE3zq+Ke1ufN/qey2kpmafDjkU92kTDrhdixqU8AOMXL0kJ8ALpbApq40GoZYALD4BYyNbAAUTeBsBfpMvM5ll752AciNs+Qu5RVTtqU+7AUaDHCK+Ktl5sKVfXe4qMuTCnq34ao+L7vrDRmBt2zoZ+FhEKeDasjU2sR6S1puClhN9pMtOCas2dd35vRhVBw8ckVyO+9U1TimxK4EAu6QkQZtLgw+MAvn3DS1mRXbTUWP7U36M19UdgYtdOfZSOPMMeIAOA0joHfl1m+gJ7dU0v/OthBuyA4tDOkiNFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkmC8IXQxgYOEFFtKm/qpnF1ibUpy9+DhFJIcy5HhzQ=;
 b=dG7DkrYFS7utPX6RhOceBMdgt3B89Pzr4fJhsFSSJ2ateaH7hkq1SrIyfIA7J4VH2MOIjOOBcrMI5k4CItd+Ut/EKM2g0Vtwk8hixpv5JRih2BwV10W3IvCEL50PVQnVSVKS2KOpgB5Gs7braLo9YeCIoCudjSUzrgmx6zs4s2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/2] time: fix time accounting for x86 HVM guests
Date: Tue, 14 Apr 2026 12:33:25 +0200
Message-ID: <20260414103327.7420-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0056.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5573:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fae068-5a82-4feb-7763-08de9a115e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	r/ulJ5ns8Ewhg5DAT4NqfjB6LENXwdDQer7CXertHxq0CCX1ekTTyMU5kaw5jq63v924Pm5Ex2+zLx5pKwwmMjmD87rswf7cE8/NfjJrMvdErgAMLByyc+Fuv0+7TUTBHIBD+Vhc4SS3yfADIK7pOAKC2mHxw3PryBPP/EJIPa9jIYls9i26GC9LulXRXZmPJnyh8kwKhg824ZPln1GnmSQtBUg36yO28PZS4iwaIrSUDOivSPX/dtEXRpvF6YVkdeKIuUsMbehmrOsJHTsgoCzEtv6Uz/JiZzLSfEHEZdnMtU04k+3KJ5ugNHQuG3t5kJC2G1x8vimc50qh4R8q/s7/x8EvqbCfyvAM3GgT1LVHN63xVksjyvanWKGZXefVT6WybNamtVTgJbJaWg1B5JQxEmQS8Vl2RA9NVm23qZxY7gW/zTGhQ/ZIwZaQGTvsT8XhEzTXB2moOFA5BRCUPPQOzi2+VMeD7Vu2/MM5aS+1BM2fxSOtqvhg6N04Fs52Ef27w0gBmC+QMLQ3zoW1BWcgaTUGlD55pzBQlXtslgYIaiDNGk5HrWIRFqlX8nXKcyh8Co63Li45x0QDLcMJ60kUVU/WjpRxRoy+jRdhQJZVQaDErTKADl6F9TvgDBLzF/awd0HU+i8SrZG2jfHYGgSn+5X0bcE7hu4KU5n7PyxU7KYcckkapJo5uwAxCqLHe/JiNdWya5JWEq1Orv8S6GIqklyrp7DLpZ7RjCwwYQU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFRvT2JUYVREYk4zamtPaDNhMS8waXcxTlQ2NHRYSlJ0dDFiWFJCS2c4YXY5?=
 =?utf-8?B?WnNxWHBQaVZqTnJVQnI3RDRzeGtIcDM1SURIV0U1U3ZScUZoSTRaU3Jkazhk?=
 =?utf-8?B?RFBxSDl5WGxTcENDeEZnektucHJYc1EvVzloMm9VV0ZwSEdTZTlCblExc3ha?=
 =?utf-8?B?OHZsNFZXZU16ZU5panBQNzR2NVNoTGpDUGlxOHlTSjdia2dyb3R4TFNzclJZ?=
 =?utf-8?B?dDAybXdQbkhYanlueitFWmw5T1luWFN3TExydWpsTkRCSU12V3prRk1YeUlU?=
 =?utf-8?B?bVR0bFRJZ1htZXBhWkFhcTBNQzRZcy9zQUxLUmJSN3IweDJpdmFlcGFIb2w4?=
 =?utf-8?B?T0tQbEcvZUt3TWFvSGVCWEpNZmFwbVhuT2xOVE5tbkZRS092REVkbGtDRUlU?=
 =?utf-8?B?ZDNQTW92a01SZjhOQmduME9qa1ZUbVdvTktjOUQ1QmpUM2dXN3Z5Vmgvd3Ry?=
 =?utf-8?B?c0lMRytzemNjUll4amw1RCtJeUZINUhBdlZ0ejlvWEZWdlBkcHVKeWYvTU5P?=
 =?utf-8?B?dWt0SjdCRmIwMy9YOHFMcWtBTjdMdE5HSE1jdlcrb2ZDalJ3b1RPbmNjcEIz?=
 =?utf-8?B?d2tnV01oNVExR3Y2QWEwMEM1bkdrbFFOMHpLUEduNlhKMG1hYlA1Tkp1cWdW?=
 =?utf-8?B?VU1BWGhwSE8vNVF3RGhEZGY2Q01aYkNVTXVZSmlFTlFrbmI5L1ArSVg3NTJr?=
 =?utf-8?B?TnhzQ0ZDaUxQM0lDWmZYcHdUV2dJTUVsdHQ1Z0cxWUFFVUZISE9SV1lPUjlD?=
 =?utf-8?B?cU8yZTRQejFYcE4rR0Y2SUswRnJYK3BKdFJjbmRtYy85Y2ZLeXpTRitRT3Zp?=
 =?utf-8?B?TklDS3pmWHBtSGtJOVRFUkdjZnJHbFlaTU1YamxJUDNPdko3UEEvZFExVWFu?=
 =?utf-8?B?UElVcDNvWnpkRS9zbHpvWjMvckREYTFzbitMRFJ5TTVKNUtrdnRqRERwanlB?=
 =?utf-8?B?OUdOKzFNQVVGdW1YbWJkTkhEcVNwd2xhdGFYY01URno2NDIxZ0ZGd1ZWZkdk?=
 =?utf-8?B?blp3akJsZHZwd0N3QTl2VmZucENwVlMrTlJDeG03Q3JwTmJ4Nm9DNi9ZdHNK?=
 =?utf-8?B?WS9QdndDUDAxUDJ0RjUzbnozTFFYYXVqM2FvUlJ4empoSFpwaEFTeHByUzR0?=
 =?utf-8?B?a0dyT2kyNHFsSTRxUWg4YS9FaTJuNEs3TGFrWlpKTkRtMEM0K2NlbW92VzBQ?=
 =?utf-8?B?TVhQNEFJV29rc1kxNU42VkFISElCNmxPWUpuTE9vMkNlcjNzdDN2NnhZWTl1?=
 =?utf-8?B?UndtY20wYlgwWTJsVkJVWlU4c0FpZW4yNjZSM2pBSDRlUkpYNlRXZ3cxeEdJ?=
 =?utf-8?B?TzZxRHorY1p6WUZSNFR4SzhRcWpQS2VCSVpCbXVLRy8yT1dTMThkUUZjL1BU?=
 =?utf-8?B?akg0SS9yVDI4V2szSEt3MDBkN2grcFVzSElRTy9NNzFuUUV1c09WQ2E2T1Uw?=
 =?utf-8?B?NUREWDluemlrUk9GSWpGV1hzTUR1RWFtSUE5L0l0ZUR6NkJKSWlTZi9ETm5s?=
 =?utf-8?B?a0hUaEs4ZG1xelc2NzdxbklKNW5hcnZoSGZPNFNYTWZRR2RHaUppNS9Xbi9l?=
 =?utf-8?B?amFTUkN3bi9hMzM0c3NVT3RSQzM4QUpLdXRLVjN3Q0R1ZlVjY2w0N1RuSHBk?=
 =?utf-8?B?b1NLTUZ2S0R1RHEzaDUyUXRqeFhjbG5pRyt2b1c1SlpQaHRneGJjcUgwSW9I?=
 =?utf-8?B?RmNZcmFQTWVuVXduQnNhUDhVVWRYZktjQTBnVnJMU2tlMldMUGs4eGRTKytq?=
 =?utf-8?B?QVNiRElSamlnTTRWUDYxMWZpK01Nb2p2MUVBUDEyNXR4SE1vUEF2VFlINTFx?=
 =?utf-8?B?dmJSNThDOUJnOW16TmMzRVpMNWJOV2lwNkxLZVB2bjVwUUx5N0VuMkJTSThs?=
 =?utf-8?B?SFdwRDFCZmNGTFB1UzdEaXkwZldBUTBRMENOYUp2NEFKNmt0ZjlDUzYwMW1m?=
 =?utf-8?B?c1A2bVhHUkJJaWdTYUFSaDlrZXN3STBabG9ZVStxSW1yZlNuVmM2VTYwUWth?=
 =?utf-8?B?VVp1Sy9hN3U2WlBsdm5YaW9aZ1Y2MDZCdmlkQTZYbzdISkFBNXZsRlh4NjJL?=
 =?utf-8?B?OHdjRFZsUnJVOVdTYWw1V0g2dnhhTXhPejFkajBYUGgrT3BRRFhsMzg4WUg2?=
 =?utf-8?B?dG5tY1dyREJORzdkT3ljQnBsMGJKVzd2QUNYVFN0aTlaUzYxU0hvMk5aM2VE?=
 =?utf-8?B?MEpEWlBUUmdaaENKOUw1MEhEendzRzkyakVNSWx6aWh3NkpmSUxOSjlHY0RO?=
 =?utf-8?B?ZThyalE2eXpFdnFLRFVsMVNxeE5pSkk1RUpCUHBLQ3BFU2VVdWVvS2diMmdO?=
 =?utf-8?B?MDF6UmRXaCtDait6Ym9DWjJJUDZpUWV3TlZXcklnZVNhb21LNFZZdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fae068-5a82-4feb-7763-08de9a115e58
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 10:34:12.3866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trO6gVLdwo09Ap7a/61SxMm9hFCLq8P6CzTlGzH2WqUTY/HBij/L85CUgY9iikF2kqMUYgR4altXNKJNMmAeyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5573
X-purgate-ID: tlsNG-bad1c0/1776162856-56949152-373032A7/0/0
X-purgate-type: clean
X-purgate-size: 624
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,vates.tech,kernel.org,xen.org,arm.com,amd.com,epam.com,wdc.com,gmail.com];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E35253F8C5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

When not emulating the TSC the guest time value calculated by using the
vCPU time info page in HVM mode would drift between time synchronization
intervals.  First patch fixes the drift, second patch makes the
calculation of cpu_khz round up the value for better accuracy.

Thanks, Roger.

Roger Pau Monne (2):
  x86/time: use native TSC scaling factors when TSC is not scaled
  xen/cpu: round up cpu_khz calculations

 xen/arch/arm/time.c   |  4 ++--
 xen/arch/riscv/time.c |  2 +-
 xen/arch/x86/time.c   | 20 ++++++++++++++------
 3 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.53.0


