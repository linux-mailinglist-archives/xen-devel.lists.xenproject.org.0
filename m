Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ha8GyrwImrpfQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:50:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AAC6497A2
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:50:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=AEKAiB3v;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329732.1593730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWnT-0000wP-1J; Fri, 05 Jun 2026 15:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329732.1593730; Fri, 05 Jun 2026 15:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWnS-0000ts-Uj; Fri, 05 Jun 2026 15:49:22 +0000
Received: by outflank-mailman (input) for mailman id 1329732;
 Fri, 05 Jun 2026 15:49:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wVWnR-0000tm-46
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 15:49:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVWnQ-00DfSV-6X
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 17:49:20 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a22effb-2eae-0a2a0a5409dd-0a2a450bd0a4-8
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:49:20 +0200
Received: from [40.93.201.52]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a22effe-212f-0a2a450b0019-285dc934a5b6-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:49:19 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB8095.namprd03.prod.outlook.com (2603:10b6:8:250::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 15:49:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:49:14 +0000
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
 b=hucU2PSDry7UeHtgUQyLDGUfxmw+NqyX0IH7GUgNsUkQ8KwqqzRYTz+V6JdCyFcr7RljoKhtgbyzYWRWwXURVw6QrD18tb6LZwGPL+112nMeHiTSE8olHcG1uFdHMjlB1FAyNevigbMu+TiB7+8nnoYxeSUiiRSW0CL+pt/cTOS0RKzEKvye8OFIJHyckEeVn8PUDAKOtXcOmqCBQTreZaQ4l5rcWjMXvB3fy7OGM3VfEzIdUqoeC2FeMpS/rtiJFpPaUXviw5qvd6AaHOlKa1jZQ6zizQyEdsOYEQKLOHhUPiIk47jjYngeoGw8Wst4bRC+tORscrQMA3DHchV49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ReSoGxPjMJduMYPwbpV/XFS5jYYCI7aDIhsfPTO1hE=;
 b=BxeVHVnPjG5J53kKSqagVdh83rYZBHsLVXmBM5bslE7PMhHc3TdRwmwQ1/KlAUpfjZ9vn+SodXcvE8Nwx0KgSFEZuQZNZXjQiXvNYB/zVkoSyn2VuKN7SeTN5LTIz2ZZFfxDjRpOcxA4VBC5jRzzasTLZSA1e6wi9Bdm6CdIC/UiT8vxv3MIWW6xhg5UD0FzGL1+Ak6WGXjo0pyWrk0OwUmWWcxKjvRuAS+zKevd2GU1Z5yXmMQTuRt41OdKo2EAD++0n1ooR5AjooLeb8gZf7HNKmFRBwAMkbMZCUKFIfgQ4OoCWqlCEt/Pa5izmFGGUV8s+l7vuGrmDdnl6pNudw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ReSoGxPjMJduMYPwbpV/XFS5jYYCI7aDIhsfPTO1hE=;
 b=AEKAiB3vQRYiwn0qGH3JLwc1Esk2vYaMpsiOjQoE1x4xv2S+0nQpc4qseSHI7go5TywGla/NcZa9FYzbXfYQqBDhZaFW3TWYIQ6cVzP7quYXho8r0yDgJAQl6E277Mre5VCgSad1rrQFKZiVFggrD8LbZv8L4q05LeIIu9ZfY0w=
Date: Fri, 5 Jun 2026 17:49:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH for-4.22 v2 4/5] tests/numa: add unit tests for NUMA
 setup logic
Message-ID: <aiLv97hjEbG5PQAu@macbook.local>
References: <20260603191836.77955-1-roger.pau@citrix.com>
 <20260603191836.77955-5-roger.pau@citrix.com>
 <ff3d8693-3357-4d64-8306-fb1378bc41a8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff3d8693-3357-4d64-8306-fb1378bc41a8@citrix.com>
X-ClientProxiedBy: BN9PR03CA0363.namprd03.prod.outlook.com
 (2603:10b6:408:f7::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de38f96-2b1e-4057-c613-08dec319fe32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kS76ed9suS+CcBnlErnzSL+KPDjf9Pjjuc4INUx2GTaQUZadSKR1aFyJ6SUysnTEb1XH5Y6XI7Sow13bsIfdy0ROuWKJ6nfhVPXTKkfdu3Jp3fGBc2ZhGI4a0oL2D0GSaQ6QZXusQFw7dOIhEAPfp4HZNIRn23dsUwWWskhboQvlUPHm5Gno4Z37NM96lCdrIaxgGNtRnKUmahaFIUPgkQQsLENNxKmsdAYvioD/EqT/OJa735Jamei8zIjupU3p9VsVBOD7A7vIk6Buv+JwxC0OoFhs1qKX0aaKRS4h9mu5B/n2yASZr27mjVufnIjRgMHXJkovkAjuC6buIQTBA0guqpinztyrQ/ROKDyvu6kEtjJor4PKAkHfbpinFFsMNFUpZE5ZPdmGsIXLYwJoJMR+QxWTKI7GV+6V39XQdcuorVuRFM+OlBsszHh3OViDC6i4TWQZgR+8ssBkVNkmUsgVwoqVwvdol/QjZoN3Zy3QIwZ/DerbPlKnclJ3+7mMr52wdG9UZGkBGFUmtO6WwXNWthSNkzj4jRQI63Gv8rC2JEud8z07bSeT++CBE0gEkuCjBtoUQx0O2R91ELHo6bRpCVAgh94kdaDRuin34xUr+T2Imv6STusr/16VTaCyamNO/KQ80DU2vAOLHZ+lUIFxkIDXcWARpyWijzpgsQL0FtonoO8/ESQ2BHPiZ4zvQ2gk0igeuhpmbvs0rYW4Yw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm84R0VUenVjYk1KTTRyTHIrTTgrMFJiZUZMdXBCSVcyWkdudlJkZjBuS1dn?=
 =?utf-8?B?OXZkdkNZWnNhM29pZ1NzSW5WQXJ0K0p5QUdEbzZ2QmVyQUMrSTdsNWt4aUIv?=
 =?utf-8?B?cTJNNHk4N1pUZ3FJcXpBdnE5UUMzczdhMDlDWGp5QVZhKzNYVVZVdjFySGpO?=
 =?utf-8?B?eUZ6SXE4YlRaNVU1UHY0YWREVThtZU1Yb25tZW1EYllZY01DM1RpNkw3dU5Q?=
 =?utf-8?B?KzFHbEpTb1BkY1VQNTZBeGdDVFhuRXpST3pxVjFpTWtUaURvSDAvc09LRFVC?=
 =?utf-8?B?SDludzMyakhCSHFPNXVmWGJ1cjdPSmxieTByb0FVNnpuL1NQWWdtdGNYbW15?=
 =?utf-8?B?dXJRQmVENzk4bC9hRW5MeEMxUCtwTU9FRXNrK3pQR01SeTdadklXRHgvbmZM?=
 =?utf-8?B?YkFkK0g3cWhNK2NBcWRmcy9pL2Vhbm5TbTJWcm5ENE92L1E1M0JHOTlOTFRn?=
 =?utf-8?B?OGhmdk9BNkdQN3YyQkdRUGVJb1FmSlZmVVRkbVBDOEt2SkIvbkxpMnU5Y25Y?=
 =?utf-8?B?aTJEY3ZReStVV0ZtNDdOd09mUkxRN2N4a1hDdDcwYzc4ODhFemk3T0lLTWZJ?=
 =?utf-8?B?SDI1c2F6emVCb3dGQU9DdEt0d1BBaVdRdDFBSEZRbEZzRG9ncUNOWGpHMkZy?=
 =?utf-8?B?azNNblh1bzlSdUk3L0puaktCMmdDN2ZCOGFtbk5TRE96RHV1Slp2OUFxS2Vr?=
 =?utf-8?B?TUw3b09hOXVKSTMzWVNrY3lwNVFDcG5FLysvYWhvdHBmTWcra2pCN0tzWVNk?=
 =?utf-8?B?RzBUcFhBSkJtUzBVZ2xOWWRWcWozanFJRFFGbG8xUGpDSXdDRjljYkhaNTVS?=
 =?utf-8?B?TTBrVTN3L1hQUFNONEhvdzBwSEpWa2FvbFVvVC9KOHR2a1hzMkJVQStFUTZl?=
 =?utf-8?B?c240dFdJdkVDSFFmYTFseW9kaEtnbk9HWm01d01mSkxISzUxdk5GUmhyNjl1?=
 =?utf-8?B?dVF0SkhHZDQ4NE1pck56ZnNlaUIrY2VPbTdWWEZULzVnL0VhbVc1cjNvRi8x?=
 =?utf-8?B?NTFrdWNEYTMwUFRsSkoyeDZyZm9IbW1kbGVHQ1NSejJSS1BRdVMra2dkNVJ0?=
 =?utf-8?B?OHBnemhOaGJQZ2RqYldyTVVoS0R4ZFFWU0JpM05aSjRzYW1qdlRIc3dBVzd2?=
 =?utf-8?B?Lyt5NDBobVo5cEtzOUlCa2lVaDhVTjhHOGtlVENXNGlDeUV0VXhzOHRtUXJV?=
 =?utf-8?B?bEJZWmN2WTFFRkhMcmhtZzRQUWErQWcvRGlmM01ja3Z1Z3pteHVralUxRGtB?=
 =?utf-8?B?d2U1MEQ4RGkySVdzUzU5dTZNeHZTL3ZYc0pGN2hvT2pqUUJtK0JOREpuYXN2?=
 =?utf-8?B?aStXMmtiaEFLcEVXLzdIY0J4NEZuNFpERkdGSG95eTU0amtoRHl1dVNTSkJM?=
 =?utf-8?B?WTA2bW8xK0NqR2pnWHJXcWtYQTB0YXV3TnFrMTdvTmlEMUc3TGVEaFhVRGZY?=
 =?utf-8?B?anNDa2VRL25ZTDNhWG1BV2hnbDFwUy96SWZFSngxYXlrOUNNL25lTEwxZm0y?=
 =?utf-8?B?L0dUWHN5eWR6MUlPOUJneGdWTTBERHpBeEx0d0UyT2pxa0lseVFudzZ3YXNw?=
 =?utf-8?B?MldXNDE2THVWaTJwUE1YQUxqdGM1Y0NXVGRubFJkckd0S2pFR3A2di9yNCsy?=
 =?utf-8?B?dnFNUWovSHVVTFkwZXN0VG1VSnZTSlZOM1puVXphbWZDVHh4SUErZmo2QXpU?=
 =?utf-8?B?eHRrMEJlVUpac08wZHhrWVV2R3ZGYk5pa1Y1aVNBV2FlazFUL1dWVFk5OHo1?=
 =?utf-8?B?QXZTN21ZSGxlMnc4bnlWR2tGU1FaRnNidGs1VlgwbFJhSnozUmQrUWJnMGll?=
 =?utf-8?B?dDIzcG5zREN6djNTT3F5Znh2WkpGNEM4Z3JEZm9HVzlRR0U4VUdub1ltUlVD?=
 =?utf-8?B?MmtMcWVIeGt3UnFoUkhLYzNVWDZkSHkwUUxoMStHdG5LbUltbGFldHdvSDVi?=
 =?utf-8?B?SGd0TkVuMDlXMi9GeUlTbE1YbnVWaUdFK0VicFl2K3JNRkZNNDg3Q1NaMEVP?=
 =?utf-8?B?MVo1MzJmQXE4b1dXWGNGUytnK2N5N2hLRGhBVlJ0T05xd1IxUWFtNWQ3U29L?=
 =?utf-8?B?d2RoRXJ2aXl0QlNXTWhCeVgybytmV2VOS0tmS2Ztc0dYcmZ3V29DZjgwZXRy?=
 =?utf-8?B?SmhVdENYRHBYc1hSVmU0VjRlR1h6bDVheHVyRjVETGIvazE0TGp6QVh6WnNx?=
 =?utf-8?B?bCtLUE05ZVkxK01Cb1dmNUVuNDVvRUpYdld6ODZQNjA4TCt3dUJuTVlXZEMx?=
 =?utf-8?B?d3VobjB1Z2JPNHFnTnFkQ0RTWkRyZlBnMnlSWmk5VUQ5UnBIZWFQMC9JTkx4?=
 =?utf-8?B?YTBWVjlEbnFFRXpacDJtNE5DbDhYa2tZc24rWXBBR2lGdW5nWVIwUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de38f96-2b1e-4057-c613-08dec319fe32
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:49:14.1261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJb427S7C/kvVcThHeF5pcs1RNuivHjTbFKDVhpKogBrV7YtoZv9Cm3CaFubuVzcp5I3qRH4J4v6YO6GIBCQnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8095
X-purgate-ID: tlsNG-42698a/1780674560-18762F3B-690CBB14/0/0
X-purgate-type: clean
X-purgate-size: 5841
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:dkim,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0AAC6497A2

On Fri, Jun 05, 2026 at 04:41:58PM +0100, Andrew Cooper wrote:
> On 03/06/2026 8:18 pm, Roger Pau Monne wrote:
> > diff --git a/tools/tests/numa/harness.h b/tools/tests/numa/harness.h
> > new file mode 100644
> > index 000000000000..9eec77f31402
> > --- /dev/null
> > +++ b/tools/tests/numa/harness.h
> > @@ -0,0 +1,184 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Unit tests for NUMA setup.
> > + *
> > + * Copyright (C) 2026 Cloud Software Group
> > + */
> > +
> > +#ifndef _TEST_HARNESS_
> > +#define _TEST_HARNESS_
> 
> This is overly generic, and liable to break if anyone copies it.  Maybe
> NUMA_HARNESS, or WRAP_XEN_NUMA because ...
> 
> Looking below, how about naming it wrapped-xen-numa.h, so ...
> 
> > <snip>
> >
> > +
> > +static inline bool arch_numa_unavailable(void)
> > +{
> > +    return false;
> > +}
> > +
> > +#include "numa.h"
> 
> I presume this is the real xen/numa.h ?
> 
> > +
> > +#endif
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/tools/tests/numa/test-numa.c b/tools/tests/numa/test-numa.c
> > new file mode 100644
> > index 000000000000..bced68d4d7f1
> > --- /dev/null
> > +++ b/tools/tests/numa/test-numa.c
> > @@ -0,0 +1,222 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Unit tests for NUMA setup.
> > + *
> > + * Copyright (C) 2026 Cloud Software Group
> > + */
> > +
> > +#include "harness.h"
> > +
> > +static paddr_t mem_hotplug;
> > +unsigned int __read_mostly nr_cpu_ids = NR_CPUS;
> > +
> > +#include "../../xen/common/numa.c"
> 
> ... this has 
> 
> #include "wrapped-xen-numa.h"
> #include "../../xen/common/numa.c"
> 
> which I think is clearer to follow.
> 
> > <snip>
> >
> > +int main(int argc, char **argv)
> > +{
> > +    static const struct {
> > +        struct mem_affinity affinity[MAX_RANGES];
> > +        struct mem_range ram[MAX_RANGES];
> > +    } tests[] = {
> > +        /* AMD Turin system. */
> 
> I'd suggest /* From an arbitrary AMD Turin system */
> 
> Just "AMD Turin system" feels a little as if all systems are like this,
> which is absolutely not the case.
> 
> > +        {
> > +            .affinity = {
> > +                { .nid = 0, .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
> > +                { .nid = 0, .start = 0x000000c0000ULL, .end = 0x000afffffffULL },
> > +                { .nid = 0, .start = 0x00100000000ULL, .end = 0x0c04fffffffULL },
> > +                { .nid = 1, .start = 0x0c050000000ULL, .end = 0x0fc4fffffffULL },
> > +                { .nid = 1, .start = 0x10000000000ULL, .end = 0x183ffffffffULL },
> > +            },
> > +            .ram = {
> > +                { .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
> > +                { .start = 0x00000100000ULL, .end = 0x0007590ffffULL },
> > +                { .start = 0x000759d1000ULL, .end = 0x00075a0ffffULL },
> > +                { .start = 0x00076000000ULL, .end = 0x00094c73fffULL },
> > +                { .start = 0x0009b5ff000ULL, .end = 0x0009fff9fffULL },
> > +                { .start = 0x0009ffff000ULL, .end = 0x0009fffffffULL },
> > +                { .start = 0x00100010000ULL, .end = 0x0fc4fffffffULL },
> > +                { .start = 0x10000000000ULL, .end = 0x183f7ffffffULL },
> > +                { .start = 0x183f8800000ULL, .end = 0x183faabffffULL },
> > +            },
> > +        },
> > +    };
> > +    int ret_code = EXIT_SUCCESS;
> > +
> > +    /* Dummy firmware interface provider name, use TST for TEST. */
> > +    numa_fw_nid_name = "TST";
> > +
> > +    for ( unsigned int i = 0 ; i < ARRAY_SIZE(tests); i++ )
> > +    {
> > +        paddr_t min = ~(paddr_t)0, max = 0;
> > +        unsigned int j;
> > +
> > +        numa_reset_state();
> > +
> > +        ram = tests[i].ram;
> > +
> > +        for ( j = 0;
> > +              j < ARRAY_SIZE(tests[i].affinity) && tests[i].affinity[j].end;
> > +              j++ )
> > +        {
> > +            const struct mem_affinity *affinity = &tests[i].affinity[j];
> > +            paddr_t length = affinity->end - affinity->start + 1;
> > +
> > +            if ( !numa_update_node_memblks(affinity->nid, affinity->nid,
> > +                                           affinity->start, length, false) )
> > +            {
> > +                printf("Fail to add NID %u [%" PRIpaddr ", %" PRIpaddr "]\n",
> > +                        affinity->nid, affinity->start, affinity->end);
> > +                ret_code = EXIT_FAILURE;
> > +                continue;
> > +            }
> > +
> > +            min = min(min, affinity->start);
> > +            max = max(max, affinity->end);
> > +        }
> > +
> > +        if ( !numa_process_nodes(min, max + 1) )
> > +        {
> > +                printf("Unable to process nodes\n");
> > +                print_ranges(tests[i].affinity);
> > +                ret_code = EXIT_FAILURE;
> > +                continue;
> 
> This is mis-indented.  Best double check the whole file.
> 
> > +        }
> > +
> > +        for ( j = 0;
> > +              j < ARRAY_SIZE(tests[i].ram) && tests[i].ram[j].end;
> > +              j++ )
> > +            if ( !test_paddr(tests[i].ram[j].start) ||
> > +                 !test_paddr(tests[i].ram[j].end) )
> > +                ret_code = EXIT_FAILURE;
> > +    }
> > +
> > +    return ret_code;
> 
> This is fine for now, but we're going to have to consolidate the
> patterns eventually.
> 
> Do you have a Gitlab CI run with this passing?

Yes, this for example:

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14693648817

Thanks, Roger.

