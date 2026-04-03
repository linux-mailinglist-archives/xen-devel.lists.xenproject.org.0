Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIHIEXeSz2lqxQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 12:12:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F22393304
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 12:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272784.1560146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8bUc-0008P1-Cx; Fri, 03 Apr 2026 10:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272784.1560146; Fri, 03 Apr 2026 10:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8bUc-0008NJ-A2; Fri, 03 Apr 2026 10:11:10 +0000
Received: by outflank-mailman (input) for mailman id 1272784;
 Fri, 03 Apr 2026 10:11:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w8bUa-0008ND-Au
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 10:11:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8bUZ-000oXX-Mk
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 12:11:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69cf91bc-2eae-0a2a0a5409dd-0a2a4506ba5e-44
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 12:11:07 +0200
Received: from [40.93.195.52]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69cf923a-0df0-0a2a45060019-285dc334818c-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 12:11:07 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV9PR03MB8365.namprd03.prod.outlook.com (2603:10b6:408:368::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 10:11:04 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9769.014; Fri, 3 Apr 2026
 10:11:04 +0000
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
 b=QzXJdjS6Q46QCYEgJbRIl1sYBfTOfCpPCD8UbYtwRxUFSarY7bthALAXdSNzIoSCadFqoLZcxjxJNkLL95jrA2vepfyqpiJCLys2WQ6dAvdkqmnnmo2Tthogb3HtY/+7zUvC1bp0qJLcaYKlhiwnCnmJK6YYa3kt58BHLrThRItm6Pcgs1Fb6b6CekYNliMAOlUwtI/zVLy9hs97A0VJUwftocgFXQlsIOQBnG4fakguz0uPQ5TZaoXbW/HmTRPVVEFbfCg+lL1H5zMTeRCBFBEyNSWDEPlnukQRKrzZbCmEn6uRDGfQtE813aSilYJ3ua64gAnxKb1Icluoaf8xew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIjkorNB9CPnV6O+GF6fe4Ge+rZOSD9pos/2Nuym3Z4=;
 b=gkmSFwUsKoyloJZ4r3IMv58hVfg7n3GRR+VLWZlv3J0Nd3R//7xeQmow6NZJSAycAh2vTqmcw8yt1+WvvY5frKBELF6Ccg+hl/aq2zHEfeVysLphh/udmnZu5i1mKH+tCGhH2pvpf7RJ00EHArCRJwcCw6TXG4moT/hS2CzjJpmloeJ1JTuLd8CU3SEJygeFhN2XebimIY8BvNFMUaIlSbvnaoM3EkiF4yWDojpzZExusXtuX5n7f5Et0XRYv3gGZA7g+Xu3DnCh/CjuEXltIvgBMNHUnVW5cgmHyw+Y4WM/PfeEs1HIqNMtpnibG1NRaqecK0BRJj+a4/NGyJ/JHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIjkorNB9CPnV6O+GF6fe4Ge+rZOSD9pos/2Nuym3Z4=;
 b=GrAb3/4+T7AXm0/Ps91cspQo3UjX9tQ5sOHCjw8UoMstLrtN6NfIF+DrEtIrhQXvGMlTfJa6qz5zRx7E95/o42EqNlAxO8Dw/MbJsERFyyNTlvcNIpH0dAMYwD1AyG0jFePZRWpadEsfRsuC+NuIaUmVjsJgNPe0b9HX1FiZP7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 3 Apr 2026 12:11:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen/x86: Check supported features even for PVH dom0
Message-ID: <ac-SNHWwML98cLYA@wifi-campus-l-10-3-197-236.u-ga.fr>
References: <20260402155512.80170-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402155512.80170-1-frediano.ziglio@cloud.com>
X-ClientProxiedBy: MR1P264CA0141.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV9PR03MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: d3906a63-819d-47d7-3340-08de91695070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tHaWS+vq99PxLebakcXJ1qV7g8ea0vUH89yAnK63J06qmE6ncwdOAB23ttkjL03DF7KQC0Myc5+0HrVEX6IOmMNaxd7W1lAq0bXPQcvk44/xEzggssgxcq1WvkU5E8FdtA1+tpVd1iOGnQpJZZUQ7+ublJlDWH9bvbeJu63hNpZx9cN3ZKV0ApGNkv/1n+hI9EWASk/3GtNLdhZNPHQP+31n2FRyvuhnCVGgxN8AdsLmhAu6JGGKiMrkrIPRQ06WBrXb3VrG10F1AQA6k88MPj9UVdfyXGfBIv/UIhTf170UZVBsjxGbFu/TIVpPt7yl+KvLs4XTUZmTQ1Acc2IN7IpEJAU68ITY6OoJQgkTsSdO5uoa87mb1SUTlcHRfLPFQP9g66IU/FMpYRkALimik2XE4V/U6hhCGBXfnFV8QtEU9rrv7iOHbnID1EnrrVwPZVIjod+dqdW0L0QYiBiODOZ2x8pscBj/phzxKZ7i6UXNhPfzkbRk1KcLdxMOmkSB1oyXgyAHDH2U1pDcwWF8fl3ZnGAtrLwDJuNwgKc0RwJ8m5MCE8PDZ8zWja1DGyiHGOW2gFuc0WRvizz3s8x1oRiXhu3kgXAbtVlH0NkLK8Luws5jZuKgBtyERSfnCeJzENLQ2UV/es4HgsZyaPYNmctTl/f8h0sHDL142CGwrJRd8nDxdAoquZNfJ2uQYjQvcKBfxDkhtXntI+bXK2qxlC++3J5Rea7cMKb9Qxhg/q4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWRncFMrWDN3QVlTdUN0dXNBMEFvbXROaTkwQ3ExSDlrbm1OWFJIMDVvR3dG?=
 =?utf-8?B?S0g4U2V1SkZBUGZCMzltN0NiZHZFemRhcXVLaXRzR215SExwQzc0MW5kNW1r?=
 =?utf-8?B?ZWJBY2VSRFgzZnZ5SGlCRjE5MTZzK2JhVUtFZ1EyM3MwN1o2MVNQTUxpazB0?=
 =?utf-8?B?TGx0amZNekNzWjNwSGtzNkUxeE15bzg3N0R2SmJSaUlBQzh5TTJwTTlnUkVO?=
 =?utf-8?B?RTJDUmxrYWdrTG9uaTA2WUpiaVRSM0F0WDdCUlJJUjhYM0tUNFUwZlI0SHhi?=
 =?utf-8?B?Uk1DVnU0ZmxjaExMbzRrYWVWVkVzNitLQlRrNkxOS3RYNWR3dzA0RjJxZWRm?=
 =?utf-8?B?UTVKWU9qZzJRblZ5aExBVHZUeUkwL1g0R1kxUEpNR29FTkNFRHRBbmpvTDk3?=
 =?utf-8?B?KzVPUGI2UnZOWDU1V2VpaGZBdGlmV0tkUlhjZTRQUzRYSkRlZ3lYUmdSVGto?=
 =?utf-8?B?dTZPeTZOZUpidlorRlMycmhPSy9XcVFEVkMyTDBXZXcwQmV5RENqRURibytj?=
 =?utf-8?B?TDF1ZDkzc3EzMW5vYkQvcFhoUkE0YkRkR3lCc1pqZk5jMFJZaXd3ZnRhU1k4?=
 =?utf-8?B?c3JSRHVLN2c4TVFHZnFscmVlYWgrdHNQQ21aMzI2bmszSHIrNElyR2NoMHpI?=
 =?utf-8?B?dW9ESHpxak5QMnBrNkVRTngwRnd2UkNGcTI3b3RQY0d2YzhUNlVTZ3IxYjVD?=
 =?utf-8?B?VUxudjMrdlVSRDRxL1NGVzRkL2pWcDZpK3QyWWkrS3VOcWlqZ1FpMHpveDZi?=
 =?utf-8?B?NkRWZE5Nejd4RS9ITWNnYzRyVXQ1UWY2dHc5QVVXMjJuT3ZBTEk3UEpiTTBZ?=
 =?utf-8?B?eDdvSm9JV003VEd6bjJ3eW9ONFV3VzlxRHQrNjlMWEN6cEd1T2E0TUlreFBm?=
 =?utf-8?B?Qy9BQ3BHQitraENGUHRwSFkrMUNNcHMrc0Y1WU1VbEhDZWtHSWYxYXF2YndB?=
 =?utf-8?B?bmJjUkNqb2VkSWRHdHlwcEZNWUVya25DcDUwamRNQ3BYbFI2S2pIMUVjQTlB?=
 =?utf-8?B?WVgxZW96bXNYVGQ3aHhra0NudEFsQVBxRmszb0hJQ3diMVNaRlN2dVlRK0tk?=
 =?utf-8?B?MjBzbHpRQ3BqRXNQMEhoaFBsMllrKzBMMlVSd2Mzdkc2ZzdtcGN4U1M4NUM1?=
 =?utf-8?B?MFRGS3ptNE9qWGxiRU5BRlFQSnZDSTQzTzMxV2hwUk5peTdqMnl5VVB0eG41?=
 =?utf-8?B?LzBMUUJUVndQQ0tBREU2NElVMmx1cXR4Q1ZzdkFqNnJXdUkwMkV0bHA5emxS?=
 =?utf-8?B?ZXNuNGJVcHk2U1BBbmxwQVhlditPaWwxOXJ5YWhialN6OVpNOC9mL3gxaUM5?=
 =?utf-8?B?TjVUcktldkNzWGxjekVJNVRKQk1ZK2ZuU1Z5MElFR3pheFVmTmdHV1N1ajRS?=
 =?utf-8?B?YXo4amdUUXAxRmIzcDJuWjJvVk9xWnM1VXZJVy9JS3ZGWXpkeDVWNHVyb2Z3?=
 =?utf-8?B?QVRUNTZWOUE1N2oya21OZjVlNzRnZjN0VTJuaElhbzhVZUlTa2pEMWhBaTRY?=
 =?utf-8?B?K0lTc0hvd2dxa1haaWlRNkJISFhEd0N5Q3FkVHd3YmhVSW1YNTZNUHYxbjJy?=
 =?utf-8?B?bzIxSCtvN3o5SFpEcHBEd1BQQTBYTENNUFM0dzVVNUtOcjBFRmVGUUt1dVVl?=
 =?utf-8?B?MmR5SEpjYUE0UG1pQ3d3dmNodUJXSGNjbGVzOWdjNlV0QStUbE5OK1ZJc0pl?=
 =?utf-8?B?aDZlUHZBY0tNRVlrZy9TTElZL2tUL2lJQ0M5bVZpcXBJKzI1dkNjd3IyR3dx?=
 =?utf-8?B?ek9OWVIxNzc2cjQ1Z09PMThOTVlKcmI2TnpZek1lUUcwalNLSGV3NVZZclJ0?=
 =?utf-8?B?bkY3S3ZKd0tFU1pOUElVbE9oYU5NdVBuU29memt3ekFwUzJoZkhISzlGakNq?=
 =?utf-8?B?MUZIZlBzaGwrZUJrNjhtTXJOVGVXait0U3llR1ppdkJOdDNxRGx4YytWUW13?=
 =?utf-8?B?U0ZrMkxabjA1SUJYUWFIWkVETzZVZDhsdzFGUmtBLzROZ0pJSUZKSW93cEJK?=
 =?utf-8?B?RDZCa2ZKaXFGWENwMmJqT0sremZxc1N4di9jM1lXVWFXVmtBcTRwbStPTVpM?=
 =?utf-8?B?bTEvM3pucHV5RTd4WXBROXQxYzNLaFBLa2wwTkVKZnFSemV0d0dGU25FL2RH?=
 =?utf-8?B?anVGaGZSci8wM0hwbnRSVjVwamQ0dHRIb2c4OFNHeDlPcUMxR2hZd2FIRVA2?=
 =?utf-8?B?WU44N1Y5K2xrTmdhNWNqRG54MkFuWFNhOEI3SzVYRTl5YVM5dGcySm83Nmdm?=
 =?utf-8?B?NmlmY0kzVFFaTmY2alZ0S0NzajNLZCtCeEZiVm9FQUw3OW5iNEw2dHZMY24x?=
 =?utf-8?B?Z3F1SEdFcXhBQnpuT2tBeEhlbkQ3emY5dzdKZkZnbm1QUmF4cmwrUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3906a63-819d-47d7-3340-08de91695070
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 10:11:04.2552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zb0H0mze0yusd+pQ61wrr2zYH+h8DWzfZ8kov5i8lkK01IrMLb+2GAk9HNXtbrPFnkQhDtZ7T3MfI2VHRQEP0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8365
X-purgate-ID: tlsNG-16d1c6/1775211067-5FF3D3D8-95598DC1/0/0
X-purgate-type: clean
X-purgate-size: 2494
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,wifi-campus-l-10-3-197-236.u-ga.fr:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 98F22393304
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 04:55:10PM +0100, Frediano Ziglio wrote:
> The supported features ELF notes was tested only if the dom0 was
> PV. Factor out a function to check ELF notes and reuse it even
> for PVH.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> --
> Changes since v1:
> - fix typo in title;
> - fix minor formatting issue;
> - use is_hardware_domain instead of checking is_pv_shim;
> - reduce indentation returning earlier;
> - return error instead of jumping to cleanup code.
> ---
>  xen/arch/x86/dom0_build.c             | 14 ++++++++++++++
>  xen/arch/x86/hvm/dom0_build.c         |  3 +++
>  xen/arch/x86/include/asm/dom0_build.h |  2 ++
>  xen/arch/x86/pv/dom0_build.c          | 10 ++--------
>  4 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 864dd9e53e..a33ce77321 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -320,6 +320,20 @@ unsigned long __init dom0_paging_pages(const struct domain *d,
>      return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
>  }
>  
> +int __init dom0_check_parms(
> +    struct domain *d, const struct elf_dom_parms *parms)

d should be const also.

> +{
> +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type == XEN_ENT_NONE )
> +        return 0;
> +
> +    if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_supported) )
> +    {
> +        printk("Kernel does not support Dom0 operation\n");
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
>  
>  /*
>   * If allocation isn't specified, reserve 1/16th of available memory for
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index d69a83b089..f95a00acfd 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -699,6 +699,9 @@ static int __init pvh_load_kernel(
>      if ( !check_and_adjust_load_address(d, &elf, &parms) )
>          return -ENOSPC;
>  
> +    if ( (rc = dom0_check_parms(d, &parms)) != 0 )
> +        return rc;

I would do the check ahead of check_and_adjust_load_address(), as then
we could avoid the load address adjustment if we detect earlier than
the dom0 feature is not present.  But that's just my taste.

I can adjust the const-ification of d on commit if there are no
further objections:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

