Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGo3Irbq+Gmr3AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 20:51:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC68A4C2C30
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 20:51:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300138.1574694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJyN3-0005EF-8i; Mon, 04 May 2026 18:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300138.1574694; Mon, 04 May 2026 18:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJyN3-0005Cf-5c; Mon, 04 May 2026 18:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1300138;
 Mon, 04 May 2026 18:50:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wJyN1-0005CZ-Tc
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 18:50:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJyN1-006xFx-2A
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 20:50:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f8ea62-2eae-0a2a0a5409dd-0a2a4508841a-14
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 20:50:18 +0200
Received: from [40.107.200.1]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f8ea69-63b5-0a2a45080019-286bc801c69d-4
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 20:50:18 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5648.namprd03.prod.outlook.com (2603:10b6:a03:288::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 18:50:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 18:50:14 +0000
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
 b=NF/+zWGuhdgTrreeA22LxP2eRmiwTeKShxIWZVUpJe/byKB6mNoENU8vMp4BAGNYHRkEIKYE5ryRyKRJqMMMM5Y8VpD4GQQBFdVQttR01olkGBfS1i9cn+ILl1i2uhoyffjxk+c+IzGlUyLgvJUji2cTsXtmffCUHpW+zzxXB0A+iK8NLR+dgRqQmJmrZAjPcudi2QGAkc/7WxpqggxdgVmdH0EDJrbeyBfy7T9s+QiB1TeUw8jxh+3SV3JiIj+wdk5f/Shq2qQC9K0S8PFTO8UeHsGx5sTWkKhNyFA1VUjQK8oVHB0ktqjmjw56ZPH1UaswqF8mmw4sqsF0d/nYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK2J98RAAZ1rAXqXA9NJ92KQw9R8ghhK/EqTrN5XSiA=;
 b=xjI1mhdUFbS9HJvDR518fI+C1QTVf0d0s0yBajqWQy/+lFkQCvJQX1g86alB2PQ1837CQDagT27wK3vva6wiOFOcPwResVlNm/jnKLzrJDgyBS92PYwVGTJaKK12+MlW4wCdWnhqznwoF739kyHIZ8jeFYh00JmhALytzwYdPZ24kjXnQJOgM55UDP2AaAA465RHbMOcp2YHTWolDsG4038cCtCsLfrHKKA72BzNlSTz3KEk2+d5EaaZQOFXNvusYI9z75OYRIT5kovIM9iJz/oD6RTEn3oD8e6P1nw1E3p+6KUCbZMC4zqsVut2l/o0yBl0jbo7nBSLaM4cMl9Hjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK2J98RAAZ1rAXqXA9NJ92KQw9R8ghhK/EqTrN5XSiA=;
 b=rXfI3nDWs9FFJzsz9EbfpQhUYS3iKf6AxVtVodRbWCppQuXGykHQx2/pWSbc4ZIGqTeW03X0j5l8Liu6Nzv0tP/HUNud4+kkaoEsZQJ5Up2l16lTYiK3xSZ3A6XXmCCX5sbALoT4KrVpFKYBBPxFaZ9HBD5grqcu1AP/lS1VbhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 4 May 2026 20:50:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation/gitlab: introduce macOS build jobs
Message-ID: <afjqYhnrTt5PAqvg@macbook.local>
References: <20260423190459.93299-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423190459.93299-1-roger.pau@citrix.com>
X-ClientProxiedBy: MR2P264CA0168.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::31) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0bec7d-62e5-4687-7815-08deaa0dfa38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	D2K1DYlZBPLQAoZeHm7dfesdxM2JRIrzS6TDDu7Ko70BJ+BhP8EjCOOkAfFjLz9/r5JLbyYfdfmZd7T2VPpzuWTn/vvZm5FfDykGajUTXuMKtgbLe3yNZeAKi3J1EV+KZkhT8AVCUlURoBdVSraO/WIfbJ3pQT336UQAGOtBBtb/JZE14hmKoQiRP1B17E+89DsRdtee2B6q9pNEiShuasKgQ3VFTgVUbeI6+46nXmA4VmzXwhAxIX+UnhjaHyKweqe0fNb+Nmbmo9q3/ub6wxPOCAgL8P7r/hQo/N+8Vpro08S2lPIjJCotpkji3VbymFZioEImO5I1/D/y/+sEAI9A/0a2RVaAt5CDSHpqn4vzsuAcmP3ACIM9/gKQ/faYQ4zMml8ZceVqCbhlUuRuV3Q1JwH8C6vHOi4h8qZt2MA1BVDVjsRZWNQBSBdoNJQULU82fCmHSRgJC8ur0YxLzTH/eEjorfKlsDyJBFeSLby/Ge3JItD5UeNKJTBhTzeuKuRrC5zAX0vMXEZny8Gfq9s59/RWfWbMbh0tkLYNw0dsgevCBS5HgMHX34lCRK3/AP/tpyDkI94Yq/krFvikqbuHsWYw2+XCM98T2aF17HwxyZPQ2ERuJ3GKbA24n/m9geZi58XVqAye2NtjhyCC3rGWQ08AUeDy3GEGBc+NTU+rtJJZ4a6iQwTl4RkCDLqPjlciSfUx5EtRhXlaQ0uibA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnJDVFFFV3BjRlJUeHlyZENmMWdQVHB3Q1BPSitXSnQvTE83VnpFQ2tFM0ZX?=
 =?utf-8?B?MVNnMjlXa3ZKbzZvcFBjNDVxYXBNSjgzZkRleDUzOGhvTzYvbDgva080Qkhy?=
 =?utf-8?B?Q3Q4TEJYRWpqN3ZtSjdrNjRXK2szMFF6citXUXFsT3gzS2JsVlNpYWNFOTVn?=
 =?utf-8?B?aEd1UDdrVk5Yb1g0NGttbVNNNHJrUDRmT1ZHYmdwYXpVWkdmZ3ZFdFlNcnRh?=
 =?utf-8?B?WGl2VVBNT0ZPQlNEWUQwNFdPSUNUWWZyVWZPVnZ4cEF5VXFXcEZXZ0poZzR4?=
 =?utf-8?B?RmN6VnRNaDkvSG5FQ2t5L1hlM2xQZm9MbHBTT0hYMk8xUUx2bUdTUHovV0lz?=
 =?utf-8?B?QkFBY1d4dmYzQUlZeW42REo2R1JXYnJDZnpvaHh0eml1Q21ITDJ4YURacXI0?=
 =?utf-8?B?bHljQTlsM2s5NUhWcDNFVGFLYWh4RUg2anVFUVlZOE9vQ3BTQ1VMSkdqN3d5?=
 =?utf-8?B?ZlUvcnVOYk1ieWd4NEFoT3hVUU9LOG1jWngwUCszUjB1WDVSNXYwSXRySnkw?=
 =?utf-8?B?bEhDWU9uRWZZakxwd0hualV3NkR0b0dwUnlqSWk5MWM5bnBiRGFxVCthNmVO?=
 =?utf-8?B?VEFNVk9UcDFLTThYc05nVktmL3RabEowcnF3eERET0NOOTdmUG9RMzFKTTFl?=
 =?utf-8?B?TlF5S3dYQUNleTBaTkRGbnRDQ1c1QUU1a0JuSjhxUlFtSlQ0emFLODcwVGV1?=
 =?utf-8?B?UHlSMjg3eHc2Rjd6NWprQkhZRldwUERyVmFvVUhlQ09xMDNYN1ZkVis4cVAw?=
 =?utf-8?B?eGJHbElqYUJZM0J1UDVlYXJsdkNTekZwZ0dXQ1VhL3lNYU1LUmUwbkRDVm5p?=
 =?utf-8?B?aWhsL2ZTRmJVOXBhZFNqbURoRnV3dUNlaGhlYWdkWEEyMnNLSjdBSXJaak40?=
 =?utf-8?B?WXpYN213VFdZR0xmQXZSQU1DUEU3MXZoMm5seW5raDB4TGN2ckM3bXBWWFVY?=
 =?utf-8?B?b0VIdWJ4UnVXUjFlZENBcnhENlRLK2ZKWlg1MVRUMWZ1bU1aUnpXVmhmSFBj?=
 =?utf-8?B?S21ZM3FRRGtDL0Y5cWhLVDlUNHRiaXNDS3N0ekpqblBJamovTWsrS0FTRU1I?=
 =?utf-8?B?dVd0T3l1YjY5Ykt6N0VYdEh5WUF3ZmZDVTZtc2dGYzVma1o0UStOTngvLzZt?=
 =?utf-8?B?KzdjMXlvNlRVOHRqN084T1JUU3pHVVlrYjhUQ1o4dmFHY0EzNkxybkNQTTdT?=
 =?utf-8?B?WHN1R005QVpoVWVzSEp6SEwvL2ttOVdRWWt2WnBROE1YUi9XcDQ1dzAwZE9v?=
 =?utf-8?B?OGRmTlNBRW9lZnhZSUZibHNqTDRKMjhFaVdJZi9xZVcyRDlYdk1KZ3c5U3M3?=
 =?utf-8?B?TW5odGQ2UmhuVW53NnoxQTNNeHl6Zmx2ckpCQ0pHWlZzUTc1U0NXdDhURjdM?=
 =?utf-8?B?c2tiaUs5SXExK0I0ZkZ5b1Jvd0o4ekF3R0w4emZJUEJtdk5Ick5ZMktQbkh3?=
 =?utf-8?B?YzBoUnVDQmNuNDBwQW8vNnF2YW95VVpCNGdKQ01qS1I5b0xYbUVSOXhGT21O?=
 =?utf-8?B?YXl0MWhhQVRhNTExcjZ6SEhrOGZ5cVFCL1lJVmdOR2I1YmI1Mi91NFVVS2pw?=
 =?utf-8?B?VEpDZGpKYy9pQ2VSLzUrcXRaM3JhY2tGYnVxdFp4NmZBajVndmYxVWxCeFBV?=
 =?utf-8?B?Z09jaVhOWmpDMW9Xb2c5Rnp5NGhMRjVVOWpjWFZ0b2tBeW10U1F4cFhrTVJT?=
 =?utf-8?B?alZOR2Z5L1UxUThEeSt4NjJzTnBQUDV5TGF2SnUzdWJkV0xnYzJrK1ViNXho?=
 =?utf-8?B?UERJNWlGSzdHdjhqT1V4ZXY0aG52Rm44d01oTUFkZk5UaWhuTDg5ZHRKTkcy?=
 =?utf-8?B?bUVnMHozZjNmelhrTDFDcjRJemVxM3Y5bjhacHpOVHNUZUppbUFkUGY1aEtD?=
 =?utf-8?B?T0Fqa2t5UmpvWDljVkZGUlFSUC9paGhLK2NiU0U1RDgvZWJHaS9kZitzL29X?=
 =?utf-8?B?aUJkWFIyQm9VbXRtcTFZU1p0VU5iaTZOd3FxeEFranhmMWQ0UE9Ib0dOT2FC?=
 =?utf-8?B?aFMzRVFWenNwOWNMMVVOZUR0R0VUUTVqeVNVMy95bVpzTGJxUFA0VG9UaVdq?=
 =?utf-8?B?YjdDRlZESUZHMVp4dkUrRzBjWU15ZzZzRkUyeEpRU2xGMXVjSmNQZ01tUENx?=
 =?utf-8?B?UWJoMzYwZThiZ0d3ZDUycUZIekdkUTZoSDEyVElTOUtaaVVSVGR4dmZZTXc5?=
 =?utf-8?B?VXJlK244Mkx3ZFI1c0dKcWxqb2NKazZLeVNqMUk1aktwcXBQbURCUHd3b0M1?=
 =?utf-8?B?N0Y2WGc0ZzJJZk4vYU1JQlRYYlFsRmhMc0djbWN4NFJydm05dE5jK3RFRXdt?=
 =?utf-8?B?OFMydDhWTDBlSjlNYk5QbU5hVTJrd2dRZjhpVWYvaGp4clNBeWpQZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0bec7d-62e5-4687-7815-08deaa0dfa38
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 18:50:14.5583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyQaQLkWusXqnWASCIXSWaFWFydC3sfaTInUWEdQNRZm5ZVjou3GlRPZ+j4Wfd6QMVtOvU+kwF3JofSV7bEzIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5648
X-purgate-ID: tlsNG-c1860d/1777920618-C2B74DB1-4B3B6670/0/0
X-purgate-type: clean
X-purgate-size: 710
X-Rspamd-Queue-Id: CC68A4C2C30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Thu, Apr 23, 2026 at 09:04:59PM +0200, Roger Pau Monne wrote:
> With the imminent decommission of CirrusCI we will lose the limited macOS
> build testing done there.  Introduce two Gitlab macOS build jobs that
> reproduce the ones present on CirrusCI.
> 
> According to the "Community programs" Gitlab documentation [0] we get
> 50,000 compute minutes per month.  The arm64 job takes ~1m 15s, and the
> x86_64 one ~2m.  I think it's likely enough given the amount of minutes we
> have available.  We might need to reconsider if we add more tasks that
> consume compute minutes.
> 
> [0] https://docs.gitlab.com/subscriptions/community_programs/#gitlab-for-open-source

Ping?

Thanks, Roger.

