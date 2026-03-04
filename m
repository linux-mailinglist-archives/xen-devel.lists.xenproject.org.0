Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKnaLdpjqGlauQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:54:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCCF204AD3
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:54:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245808.1545188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxpUZ-0007ih-TS; Wed, 04 Mar 2026 16:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245808.1545188; Wed, 04 Mar 2026 16:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxpUZ-0007h5-QI; Wed, 04 Mar 2026 16:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1245808;
 Wed, 04 Mar 2026 16:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY7Q=BE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxpUY-0007fV-Ba
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 16:54:34 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d08a7dca-17ea-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 17:54:32 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA3PR03MB8476.namprd03.prod.outlook.com (2603:10b6:208:546::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 16:54:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 16:54:29 +0000
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
X-Inumbo-ID: d08a7dca-17ea-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yi1nqTE2m9zIv2CAm++COvJmPlUuCsmb38rM7nyAhjF4pB5pJZyHZTwHq17iNYEyNb26X6ZCrgJ6eXRD6bOT3YZdtEPxMEVJnpii+qehbP6EXokeYxzeNyq5IziVh7OtLoD45uoTiX7CQE4A069907dnEER6sn2vPkJoHe/kWd6RtuN5vWOvOHpgPurqLSJODDxRMraKmZkkhkUkMZmDc4ADPtIk84bWgRzoo4mRxr80z3Kg6iaZOYGJqAxsua9nzeMRxoPr7MkjKINZ7vbsZXgjIUqLDveim6vbSZ8UU1pYth1hUE9lD8KGx2kB+5KCSpfN+TW3UmYCiAxRtriaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC7NLkYgKm3Arkz4reuBJQX25+4AxfjyXOCHSyXKcG8=;
 b=EcN5WfLSWybXB7sWPqWJisrTbeIAO//SRLqTaM/q+3EWGJ2SrdAH9GbweU4B5W7wkiWCbLyHT75crXpZOiXhYMPGyLStewUGfcLv+9MtLK6ZoqzOLEf70RlMdq7Ra+rrgnFMEAaug9bKfFA1DOOlqSvvR4tfcLNpRm3xz0F3FaadpXhsrgBwP+xWrnVgiJgzDYAKGC5JnqRSjRA0mKFDCUUwIeRb9YVj1IkOJMmVr2W6Wc4cBAPUgrO29/cV3qLRJh6qcComXQVnAGY68jHHodl/BkE7vzvwDLuhlRhhPwVZo1NdZkh2gYkW2xd9rvfouaz308FHJhQYA+TbFK37pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uC7NLkYgKm3Arkz4reuBJQX25+4AxfjyXOCHSyXKcG8=;
 b=FtzaX+bU8ibBaJpo4WRPm8/LrzcIAcIYZ9+3nDk+w+Iz9wX+2lfP2aTR0Cyp7FwsxR52imyiEsCyTssxJdJSFK1awsYdVdJ8OutQd8R4RbFKH2aYKBqh+m2Fk7PkEvKW0mibq0Hx5LEPDOxNTfSa+pVdkfknt3KE5S82dp+d1oo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Mar 2026 17:54:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3] vpci/msix: check for BARs enabled in
 vpci_make_msix_hole
Message-ID: <aahjwTA0LLm7JISA@macbook.local>
References: <20260226025740.71673-1-stewart.hildebrand@amd.com>
 <aahOeefbhHq7IZZx@macbook.local>
 <1e62a5ad-f865-4477-a899-0182dec38901@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e62a5ad-f865-4477-a899-0182dec38901@amd.com>
X-ClientProxiedBy: MR1P264CA0182.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA3PR03MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 634e3eea-79f0-45f3-d8ff-08de7a0eb36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	qgxvPtIPHKhv+7Qc2ZAVDcYW53NW+IjGZnTxTpt2Nw6CqxHcdJmLDr0Bv6yabOqU5uKNlqztlAgeYu9Z11mFwzIhClFxdGALpQOfOhTqd+B0METnAQK+1peIPUroa3g4p0YaY9+U4HOqQUS0lt39Rjw5k4yikNSxBEFYrAbMIBIYxVk0tWqYzgTVhuwgyeIS7Cud8Bo97sTiuOZN/xWgRhNDt+aMNIcq5Lx4ZtdcDmo9GkoJeh6l1dT1kojwLj+0o3v9gPDD+mt36Wb9ugZR9IR82MxnP5WrCfBhXROM9DbVEf+MYoc5KXANvg9BvexX/SHFM8np/vPssWU4HgYQfCO5yhjUK3yoz+1DA0U4b2yKS4MRivRIbBhPi1rggeNq/rY6CoHCJY/2XMOv3XCbOpeGIVU9DPzv7reQGBefPfVrW6O7P2qE7NTfYYBWkxJBCAm/yrE8SiCutg3JLz5aeBI9Gr36ltqEO9pq/2lbldvTk2pufVTwL2nyysjUEJKWG3KjdioTNRuOCu84VmnkGraLTmU6Z/M2Lh3v7hLyrrM81ZGxMUF8VRJSU0Q7z90xKPROGrvce0Kc1TMExQwGCdRzDA14UsNC6uxYhid5FNiGtQfhOhhXRcIsX3oRbZI8gjJ0UInXcz+Slh5gcMXLG31BM7wNh6jz07+JlSRcts0preY3uy7WIpY28ENsFx8G1vQ5cB8aEDkw29z1UB6B+EajFNtHX57s87CRrN4UwME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckFDZ0QwNUdMSFRrS2QzWmc0U3JYSGpvd2crcTcvVnpGS1ZsWTNCN2ZheW9G?=
 =?utf-8?B?WFd6NTRveXBaVnlmY0NsNHVzenlFQTlUVXZjMzJBdzhER2xYVTdTWWJXaTF3?=
 =?utf-8?B?WnJqQlBVRm5nK2xFKzFUclFQZXppYm02cWxTWmdvVTA5ZjMzSkVpeTBqL25w?=
 =?utf-8?B?WjZibjFRRVNUUFBKS3JscjVwQ0QwSlR1V282Sy8wNy9vVFMxQURzckFkYU55?=
 =?utf-8?B?SU43MFVjaDZSalJIenlUYk5zMXFaWmI0ZzRGNDR1VlU4R2k2SUNlVzZoWDZo?=
 =?utf-8?B?ajA1dVAzYTJWVXZaelMwNnRkRGptL2RXODZGaU5hTnpvWW1qL29RUnYzNXJW?=
 =?utf-8?B?R1lpY3lzalU0ZFBleTEvUzR2T2pDV2VYQ2RMbVlSV05iSndGYW1FMXQ0OUln?=
 =?utf-8?B?MWxSRjBUSDZNcDVZRnV0ZjVFSXhWV0JqSzlLUWNaVDkvSVFQbnVFSlN6WUQr?=
 =?utf-8?B?WG12V1JVNzNuc1dicHRkeEsvS3Y3djlFVDRoOCttNnhkMkZhVUlRV1dlQ3FQ?=
 =?utf-8?B?bHZUMG1oNE9iOE9YMEJUYisxQVRzUDdzeUdSL21vVzNZUkltQWdNK3ZpaHdu?=
 =?utf-8?B?bjJ5VU9lYy9pQkhHVUdjUE9ITGcxOGtPc01nakVXZEVOTUpXTkEwYVlmeFph?=
 =?utf-8?B?ODdjNm9UVUhCaVJQcDJNMmlwcjNVK2xhenVjcFZpUXc5d1dqNC9Lbjlja0wx?=
 =?utf-8?B?MWwzS0VVeXhucnBwdHI1Y3RnQ3VXUitvbms4NlFqZFdxTUpxNVZKZTV0czho?=
 =?utf-8?B?KzkzVTJydGo5S1k0S1NTd01vTGlXc01ZNWhMcDFRdmxPaFR6SnpGd2NWL0xn?=
 =?utf-8?B?NW9HQkk2aUZ5QUFvMTBvK3RiNm11YlFaMllxRTZKRi9VcWZDdGJhQWZmWThs?=
 =?utf-8?B?TEhCYmhTUTZteUtMZ0ZXb20xTklIazREYjJ1djg5SkRFblBwUTkwNFdLUVVU?=
 =?utf-8?B?ODFSQ1J0b3pwRU5GeEkzclRmekxqT1AxUTR0d2VGTWNqb1dlS3llTE93SzJG?=
 =?utf-8?B?VnRnWlBYRE80cXFqS2JLYzZiaXpIUnVHekV0R291bTgyaVphdlZ0MlVldkN1?=
 =?utf-8?B?RFhnYXlOc0pSYXlTVG1wNFJMa1h5NXNQQkxlaGVQVGM2aDdaUWxqcXRPdFBT?=
 =?utf-8?B?T1E5aHA5OHF5Tkp3QTg1QTdHTVM0bk5sT25rT2VqMjlvYklyWmo4RVNzN2Fu?=
 =?utf-8?B?bXEyeTdmUy9pb0V3SnlvQjdJWHl0bmgyUGIrMTFQRHlsMWlXTm1POFZDaGhv?=
 =?utf-8?B?S3NFb0QvbmtRYkJMVmJrNEJzeEtWSjB2cXdzZXZxY25ORXhUdEIrcTdzSDRL?=
 =?utf-8?B?akxONWs1V2t1UkYvUVBmUisxcVQ2WDRFTXN5aVBJR0pPNEt5OERMd0R0VVps?=
 =?utf-8?B?V3JrTmJURTkvWTNxVXhZaVNWL0FXVU5sSlA0MzlOcW5CRnZ1b0JoT1EzN1o1?=
 =?utf-8?B?NStOc0t4NmlLVXBZUjRIalFHbUEzVC85MzJJRThoYjdJMjJEblZoMmxoWlVl?=
 =?utf-8?B?THlvaVdEb3h1WUw5MUt2dWJFdW9vT2lKVkc0bXRCNWZsNFhjY0dhZkFpTVRp?=
 =?utf-8?B?K25XZk4rVlB5Wk5tRDdLaDBpUHJqbk1wNXVvS3ExR3FvMzNZbDBWSXlZYm1q?=
 =?utf-8?B?VHF2TnNnVzhqem11RXptZVdSTHU5OEI3VDlCR253MHc2NUQxMkc2QmRIbXIv?=
 =?utf-8?B?eFREbTBYSkRkbGJ4ZS9YQTZCOEZUejluR3hyNm5TdnloYWZYb05mOGhGOFZW?=
 =?utf-8?B?MzRJeW1WdURDU005dE51Y1VnZThrZDhUZzMrOVN1QW5OOXc5MGcySWMwQVkx?=
 =?utf-8?B?NDJQMTNaUndqenVFVlZ2VGFuUVdjdU90R2lrbnM0dmdNVG9rZjd4SXlJNnVF?=
 =?utf-8?B?U2xDdGlLNHdva1drMmVYZk4xT0NZSER1dHR3bGVjZEx1NHNxbEovdmZNaTFL?=
 =?utf-8?B?RzQvZ2JkSFk4NUJCazhMR0NOOW1sV2oyVVd4dDkwQXFsMXJ6K2lhd1lyY1BD?=
 =?utf-8?B?WE1vZGE1ZWp4ZkNidnd0aEhpNXhaamZaVUdybWczek9tVUV1dStoazl2ZlQv?=
 =?utf-8?B?eXdaSkIyeUEvVGI4SC9vSjF6bzhtY0E2MlVGTnMvcWVTWlpLMFg0eVJsK3Ex?=
 =?utf-8?B?OTREK2YwbHhoMzM4VWtEeit4OUVvU2ZIekQ5Rkl1NHBOUnU5VWNQK0pnL013?=
 =?utf-8?B?b3lTUzN5bDZFTnN5Nndka25oUFhzWUh5R0hDT05vYVFMc20wVklPMGFmdVNU?=
 =?utf-8?B?UERVZWdpSnNVNThtMUJwZjRhRkoySXI3SzY1WWw4NVlCRkhIOVpMSnR3SWwz?=
 =?utf-8?B?SHg0WU9LeHhCM3p0OHBuRVhlYjN2TExFV205WVBxcFVlSDRsaWVZdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634e3eea-79f0-45f3-d8ff-08de7a0eb36f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:54:29.3799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fN3mi5IG6Qp/ALGVF3RTaPgnReV0tJ+y6MX5hGmGzhTXAk/Zup3g0tQfyw1xDu9/sNPrL/tHZExxOImX3oKKGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8476
X-Rspamd-Queue-Id: 1FCCF204AD3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,macbook.local:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 10:39:56AM -0500, Stewart Hildebrand wrote:
> On 3/4/26 10:23, Roger Pau Monné wrote:
> > On Wed, Feb 25, 2026 at 09:57:38PM -0500, Stewart Hildebrand wrote:
> >> A hotplugged PCI device may be added uninitialized. In particular,
> >> memory decoding might be disabled and the BARs might be zeroed. In this
> >> case, the BARs will not be mapped in p2m. However, vpci_make_msix_hole()
> >> unconditionally attempts to punch holes in p2m, leading to init_msix()
> >> failing:
> >>
> >> (XEN) d0v0 0000:01:00.0: existing mapping (mfn: 1c1880 type: 0) at 0 clobbers MSIX MMIO area
> >> (XEN) d0 0000:01:00.0: init legacy cap 17 fail rc=-17, mask it
> >>
> >> vpci_make_msix_hole() should only attempt to punch holes if the BARs
> >> containing the MSI-X/PBA tables are mapped in p2m. Introduce a helper
> >> for checking if a BAR is enabled, and add a check for the situation
> >> inside vpci_make_msix_hole().
> >>
> >> As a result of the newly introduced checks in vpci_make_msix_hole(),
> >> move the call to vpci_make_msix_hole() within modify_decoding() to after
> >> setting ->enabled.
> >>
> >> Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
> >> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Thanks.
> 
> Thanks!
> 
> I would like to point out that this now needs a rebase:
> The helper vmsix_table_bar_valid() should be moved to the new private.h.
> I'd be happy to send v4, assuming I can retain your R-b.

Sure, please keep the RB.

Thanks, Roger.

