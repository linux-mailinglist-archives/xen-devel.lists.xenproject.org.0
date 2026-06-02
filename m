Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AChHqmVHmrPlAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 10:34:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D305162A9FE
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 10:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324558.1590083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUKZt-0002Jy-NG; Tue, 02 Jun 2026 08:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324558.1590083; Tue, 02 Jun 2026 08:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUKZt-0002Hn-Ki; Tue, 02 Jun 2026 08:34:25 +0000
Received: by outflank-mailman (input) for mailman id 1324558;
 Tue, 02 Jun 2026 08:34:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUKZs-0002HR-0r
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 08:34:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUKZr-00DY7s-Do
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:34:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1e958e-2eae-0a2a0a5409dd-0a2a45068984-6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:34:23 +0200
Received: from [52.101.62.18]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1e958d-7371-0a2a45060019-34653e124098-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:34:22 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA1PR03MB8311.namprd03.prod.outlook.com (2603:10b6:208:5d6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 08:34:20 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:34:19 +0000
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
 b=HtnF/Sy+pOuIHD8gaMZNa1Of5n8FHfyTa10ieN0jj9R5qV8s5My6qRow6rJ0FSWbRIA2kmVV+ZHC958A5yUG8cBrDk19VApCCUxXz81BJqBpIKf13dAb4hz0vaBQ/CzRqcDuyNRlFAXraFvTJ7MaKbQmll7iNmeOE/sRaMLmf0/vdt+SlWobqmqLo5J7u8SE+Hz7XUG3nToQR6rvhAAquSGtwdujFEyAaaFNfwarHSUc5VtBdUv/fgNyZSHuEtadUO9xtVhhj79BU8KLd4hGJYs/3H4sxyR6m28U8XaYpWqzfj1D1wKVrJtzc7ZDbXFvJySGvTXKpj3ifo/4q1SajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xR4NFCqj9/cjCwmx/NYPucrH4KJoOC0tFvXN7zGcj40=;
 b=BCLWuizSMu4+abFjB/YiGt4ElhdImqPH/v1avjXryTc8XUNIox0iCEkSv5VA9sBfZ+cllB5pcSPjdtQoXAMjr/8OS5c0a0SFmhJrJodnDsGp4l2ctrL6BlJgr4wqShQ+zU4kNd4QQURigO0Hv7wlUJ/Ozmaa0iS1Hq9pxKgxy6N/qWll5Vd7W/FXcn5O50cPPyqNbTTzbxNTuBobknsgoVMpRl1QbLM2ZwIOlWTXDMCTZYtGYXzyFmEAjkMWfxjFRKFmh75+ISW/uAVDJ7Gz23ohcb4znfhpqt0TvdcqCjlj6f2+sAYGYWiY0J/T1pRRxQ/eqI+Prj0hHXgHFgOUHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xR4NFCqj9/cjCwmx/NYPucrH4KJoOC0tFvXN7zGcj40=;
 b=KpcDe7OfzAUVRoY7d7GU+Blwn8DkIQrc3me+JNgpl0rqRCQWWwxxiPpm6kW6cFBTW5t/g1Pam8LC9sDUkOcbOQ7EAoYDY1qY0cVGocqyYyloZF2W1jWSIsCsA1p34KjcQkO++w4MuVsySLuUqgqj9e+siAEhAiu3kDLLGSBE6hI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 Jun 2026 10:34:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v6 1/4] xen/console: make console buffer size configurable
Message-ID: <ah6ViEOEJ8nD80VM@macbook.local>
References: <20260509005714.892018-1-dmukhin@ford.com>
 <20260509005714.892018-2-dmukhin@ford.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260509005714.892018-2-dmukhin@ford.com>
X-ClientProxiedBy: BN0PR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:408:142::32) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA1PR03MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 238fdcac-bcb1-44cc-bf34-08dec081bd34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099006|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	zyD9OO/9lzHhdhfenSMZpPAYx7SdITzeMW7W61kJcGKcXfChWGbKe8vIhOCqzXTdyzjcxWvTWUS60I9qXpc+P9ITvyO2g8Uvyfg1mid4+BZ7mTLBZu08puiS3o6/6/sV03gWZTP3CHz/3kB68wsB9D0AcFj3ZrPK4Riiei65dqkvgfI+HnOuL7/Lop8m+p3NxOkSwS9//QJhEJAF2GrxXWmsUskwUf/dXBWbM4h4L3h4Be0y4XutyEKj3kKuHvdknYcGUYhug27NxWSTg1IRQqBGNYScNZAjDAOm+bhj91cNBCSjrGkGyErqpk1s9Ajr9lkJcPzbNV+oIqzbnt/GpGAPbhw+yIRfTSUch6pw7nLIT9uILCid0m7B7frOH9Rv5JnkYFqVUlBFrpQ+uJv9u69hVZ1TfOonVOVo0wNIUe6SHvdK8OnMv+XadSlTl49YseiEUR3JaH9XR6h+SlffI2kK25RI9o7ihTzTCNcyJHwDL64/yM5/yKOgXEOgLHK4NJod+jgLIaYTK0QFQwKnFBnt/0/md8m/fAJIIsCaGbhOxixX2kcZhnMCnDts1D2obvS3MjeLVunE2HJl7kuxaqYhjbT4z+lPhJf5wD6F8mdMa0ClndbSpGEfodL7lM+3lUXjZ452qUPC8bRFdB5d5FQm815UPWnjCMe+jtae6ozXPrxHZWG+QuTWv3vJ6/C5yCp6ohEjEXXHCgvx0tsJng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UCtHbUtjamdSUGl3QjkxNm4wbld6aVdVSkNVNGRUNW8xcW5nMkxkcFdIem9D?=
 =?utf-8?B?WXprMHMvQm50NWJtVktpdVhFb2QzNEZic3BHWUV2N2hkVnhkWUJjWXhmcjNl?=
 =?utf-8?B?RmpzS3Z1ZHR3a0pFQVEzb0Jla28rRkxzOWdYS2ZTZllKNXJnN2JFenZQc2sw?=
 =?utf-8?B?Z0JhdVZRdzIzcHNmb0M5YTI4cHdzRytKVytZNHZPTi81RmJoMzNPcWZFVXNj?=
 =?utf-8?B?cm40Z0czSXd4T2UvOVVGdW9ybVpUYVV2enAxM05URUtBMFRnNkg3K0ZOVFhk?=
 =?utf-8?B?RUdTVllkK3VGOXc1bXMvR2RJTHZNU0pKQ3RvSnBGMnZsSmZ3SVhJM2JPK2Ew?=
 =?utf-8?B?MWE2NDFudDM1dEZwTXkySjJiWkY2Q1JJRW5sQ3k4OHNaWWlmMFIyY1RYMS9K?=
 =?utf-8?B?bTd3ODNyRGx3VTM2VmJmeFJVU2VacTJRbjBqamJrR2lmZDRqakVMNWtyeDAy?=
 =?utf-8?B?OHN4YnltNDkxOVB3UDIycklKa2NjQWpXNFlhT0tDY3FnTWdqa3UxQnN2ZEZY?=
 =?utf-8?B?eldhZW5ScWZqSTdITHF0eVJqa25HRWR4UmNWS0dNL09UaTIwYlljYzhyL2ZM?=
 =?utf-8?B?T3NScVRMb2ZwYm1YRGYyVFJnZ0Vza0tESVRESGo3S1Z4TFR0TDJFeW5pVGdQ?=
 =?utf-8?B?b0x4Y3lheUhUNTVrNTREU3ZPY3o3TXNPUkp2aHNzN3hIWk1xMEE3ZjlpNkw5?=
 =?utf-8?B?WXlVTWwvYnVUcTRQb1NEZjdlN1ZQc2xqMElVMmhIUnRmZzE1c0tSOTNaSkVG?=
 =?utf-8?B?ekxWNmpoUjdwQmRjemVialNGcHR1a3phWEl4bVE1WXYyU1FxMUQvR3NKMk9I?=
 =?utf-8?B?bHBkS3llZlFVK3JJcDI2R2wyUEJ3NWNkaTNZZWVzQVdXTGhtVHBLUjJsQno3?=
 =?utf-8?B?MHc2NGd0bE5TRXQ3ZE9sZk96dEFPdkxHTWtPdHFVYjBQLzZ4OUE2VXdYNTZ0?=
 =?utf-8?B?UkdUQWJqck9qTDJzY081MkVxU2FnY0RGMTQvOVhrYkkvUmtnQTUvUTkwWURH?=
 =?utf-8?B?SlRUK2NGOUtPOGdjaHNneVZsWnZqTzE1eWdFMzluUUd4VHl5Q0Fnc3dFL2p3?=
 =?utf-8?B?L2xzWGdvRjRDQ3JGZXVFdlZ1cm9ka2pKNW9jMWhINkNDei9KUVAvdVBQejRT?=
 =?utf-8?B?S0FQWTcycUZNbzJ4NFNZblhHNnZ3OURBeldIZkk5UDR4UFdETDdBendsS1Y3?=
 =?utf-8?B?S3p5MU9DWEkrbXhmbkVEL2xaUFBmYWNFWFQ3NVdRVWJsNWRLaWFtUlprRXpk?=
 =?utf-8?B?RDhKZndjNUdHWDY0ZEhvWTFFYTdZb2hId1ArY3dITk9qWU5EM0RCRFVUQmxH?=
 =?utf-8?B?SUZEWElLcmRVR2RCakJqRE9DUWJFeUdKSjN5dkxGeHNRVHhINmpNSFZ6L2xz?=
 =?utf-8?B?YncyRGZSb0VEZzFJVDl4T3FkZGlGTHNFRFNIVG1LWnZ4WnRzT3R0OUtxRm1t?=
 =?utf-8?B?OFIxNGdIMEZmOWlKUHlhQTk0eVB5bitmZmV3NXRQMStpYWQ1ZmgrUDZOekxP?=
 =?utf-8?B?d1NBa2h3OVFCTk85c3JJTWFGdFVibURma2pMb3F2azVMUlY1UE5oM3h0aFNO?=
 =?utf-8?B?emVORGlQYzg3czRWeHBhbVdJNlVWWXljR1F6aHlKcGVQUVQ1NDNiamdkbFZG?=
 =?utf-8?B?cXRYNHNiamo1NGRabjI0MngzMVYzQTQrbFU1UjQzTjZReFBiY0ROTjczSVA2?=
 =?utf-8?B?UlRnWjJTdU5uaDN5M1RUbHBWZndHbWl1YmRiUzF6c1B4Z2o5NHRXSDhwUUFY?=
 =?utf-8?B?cHhHdDNEb2RPR0VRakxQYnVuMVdBT2lhVVZTdUpiUndVNUcwN2drY2orWGVi?=
 =?utf-8?B?QUNKZm04Mkd1cVc5ekxsS3FFZXo4WTk0R0w5OHJkL0RubE5laGg2UTQ3S3lN?=
 =?utf-8?B?ZWRDTFFqQ21OaEJVU0tyZ0J3VzZQendZRkEvcEZDZnorRXQzYVdpeVAxWisx?=
 =?utf-8?B?VFZyYStVVzlnUFU2SWdhR0dQeDE2U2IxcEtHNWVHa3BBWUp5OUpzem9tVUtC?=
 =?utf-8?B?czVDUzlVb05JSmJwU1NYcU5EUjNZQ0w2M2FOUU1ZaXM2a1FoVXVZck9aOTlM?=
 =?utf-8?B?Ujk3RUlnMDlXT1MvYWFDVHlJdjFwM0haZEtnQnljU1h1WUFqdE5SczhPOWM4?=
 =?utf-8?B?eHB6RmpzZkZqK3dZMWozYzNhUWJTTCtjckVRR3AwMnlOdzJhei9GVEJZY3Rv?=
 =?utf-8?B?OHFxSUpVaEs0WENPMUFtYUFZTzFzWHI3WlZoNDNNRXpDSzkwQ216Y2xCNVVa?=
 =?utf-8?B?VS9WM1g4bEJlaDl0bmFDdS9MMHg0am5iNExCdmR2ODFKbUVObWZXTGlsY2hP?=
 =?utf-8?B?bWp1bnBudC9obU9QTDlUaGxoR0xiQmd6Yjk5UFFlNzJ1NnFaa0FZUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 238fdcac-bcb1-44cc-bf34-08dec081bd34
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:34:19.2674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMM2BRpRI8/9wpM24fV7PA00u6deoTWNqNKK4Dix71weEFmUAwxgXtFdOp3SDlQnOcExU0i9xXPEkDVbvjidzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8311
X-purgate-ID: tlsNG-16d1c6/1780389263-85361D75-25ED2E33/0/0
X-purgate-type: clean
X-purgate-size: 2855
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gitlab.com:url,ford.com:email,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D305162A9FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 08, 2026 at 05:57:11PM -0700, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add new CONRING_SHIFT Kconfig parameter to specify the boot console buffer size
> as a power of 2.
> 
> The supported range is [14..27] -> [16KiB..128MiB].
> 
> Set default to 15 (32 KiB).
> 
> Resolves: https://gitlab.com/xen-project/xen/-/issues/185
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Changes since v5:
> - shortened the Kconfig option description
> - kept Jason's R-b since the change is minimal - just dropping
>   few lines from the Kconfig description
> ---
>  docs/misc/xen-command-line.pandoc |  5 +++--
>  xen/drivers/char/Kconfig          | 15 +++++++++++++++
>  xen/drivers/char/console.c        |  6 +++---
>  3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 6c77129732bf..29393631d885 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -425,10 +425,11 @@ The following are examples of correct specifications:
>  ### conring_size
>  > `= <size>`
>  
> -> Default: `conring_size=16k`
> -
>  Specify the size of the console ring buffer.

Hm, since you are adjusting the text of the option anyway, the above
is not fully accurate.  The size of the console ring buffer will be
the maximum between the built-time value and the command line option.

>  
> +The default console ring buffer size is selected at build time via
> +CONFIG_CONRING_SHIFT setting.
> +
>  ### console
>  > `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
>  
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index 8e49a52c735b..11f48415c12a 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -95,6 +95,21 @@ config SERIAL_TX_BUFSIZE
>  
>  	  Default value is 32768 (32KiB).
>  
> +config CONRING_SHIFT

The option just above specifies the size in bytes, and then the code
rounds down to the nearest power of 2, but I don't think we can't do
the same here, due to how SERIAL_TX_BUFSIZE is used to size an array.

> +	int "Console ring buffer size (power of 2)"
> +	range 14 27
> +	default 15
> +	help
> +	  Select the boot console ring buffer size as a power of 2.
> +	  Run-time console ring buffer size is the same as the boot console ring
> +	  buffer size, unless overridden via 'conring_size=' boot parameter.

I don't think the above text is accurate, if `conring_size=` is not
specified on the command line the runtime console buffer size will be
the maximum between the build time value and `num_present_cpus() << (9
+ xenlog_lower_thresh)`.  See console_init_postirq().

Thanks, Roger.

