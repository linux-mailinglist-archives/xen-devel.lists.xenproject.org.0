Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAayIEE91mlZBwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 13:34:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72EE3BB521
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 13:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275780.1561500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARAf-0008Vm-Bi; Wed, 08 Apr 2026 11:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275780.1561500; Wed, 08 Apr 2026 11:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARAf-0008Ta-8v; Wed, 08 Apr 2026 11:34:09 +0000
Received: by outflank-mailman (input) for mailman id 1275780;
 Wed, 08 Apr 2026 11:34:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wARAd-0008TU-Mt
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 11:34:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARAc-008Ss2-Su
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 13:34:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d63d2d-bab6-0a2a0a5309dd-0a2a4503cd2c-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 13:34:06 +0200
Received: from [40.93.194.35]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d63d2d-02b3-0a2a45030019-285dc223db98-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 13:34:06 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5634.namprd03.prod.outlook.com (2603:10b6:208:285::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Wed, 8 Apr
 2026 11:34:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 11:34:03 +0000
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
 b=JUVQDh+x+x7lq0K1LUyvkI9BN/CFMeVjzmIyvmpX9D+DtB82pAo3be2nhAL5Zf0KuHJmAebiNnC5ukNbJ9citnXd44mnUFeSN8FNcj2A+BtkOuSZiWSFbulZoOArvjb0tJIzLYD36Mu74N1Zj2aPXLtYC6ZwchElRmDeXkW1l119jOnnf9pOZ51nukIOcfP0qJFsp3LQwY2LOa36fZ4KgwRuL3DMlQ1nE9AvxVQ0tEYkalwyD+Zlg0Is1o7JvGK7qXQNmAv5MBMCFmqvRxsonRUX5EyzaHq7Df7K23AKMyLMzmQy8fFzRj+CTph9kNgG1QDH0W677kCcLT8t0xu8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDRpph66zub1viTKCSzkRUJG06bJCnyd+BNdnuHGBwM=;
 b=xrkk+XyPEzgyzpxI01wNw0FKuaWPNu3XwFS1GXwOSx1SyhvMkCq6OHjOBA7NbsciNPkVTw1LQXuNC6ljyXa38o8zyR4/k60pQ5OKEoYeloceXjV4AvcOu6l7mhd9t318anSlIbnnrlul1PCaW0SV6+3UMdAyELPwXDNkbyy75ZA+7bvsDnvdF41c81AUhw9tbIL/aQa3UFoTgtBf2E10Q0Ps4gJoOq3lC8aMBEc7W/+aKao35fAsSCC/LGqkE+PXoD3QiGMH2Iyr+gf+G3r0Ge+8OqGY9EIbC1NNDvR3sv0Yqsk2g+n7PoN4pwuQ0BPGFhNrHg2KuhA4n1qFpbFSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDRpph66zub1viTKCSzkRUJG06bJCnyd+BNdnuHGBwM=;
 b=hzlUfxCViE+iy3ReOSuSGWKWvqu4G4GdUuwGQrTH9A0UlCjqKdwwNDALdO385zXGwzB/yaU6rweB3to7S7DZAzbGlvYP4MPyAqnYGs/ZEVO2Yy7I+ppRSrdXQvYHFtlVFNwfwyuB84CT0o8BjOxJdqHQD1Z7UXxftYqeIDejNkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9b9dd025-fd4d-4fa1-abb4-ad10c86f839e@citrix.com>
Date: Wed, 8 Apr 2026 12:34:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v10] x86emul: support LKGS
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a902e1bb-d51e-4889-a4af-505fd19e63d0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <a902e1bb-d51e-4889-a4af-505fd19e63d0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: bb563a51-ebb2-4557-3b18-08de9562bc58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BVHnnS4x8H1sJufaAQ9vqhO8jzEIJlWbFtuyIedCYnwngmQ8hErkH8VfbaGjeHSrqKOWUJ+pSEeg+uhYIHMrqLwx7/patk/glCr3NI/K88aFSrRxd7+Ls0ZYldrMYb5M3sTfdtcYNV3GyOk/27P+JsYuwac19hmgHMJsZKDrPhijkDNctpUr/F4nCtxPE0JRHETrO+1uBCo0Z8sEqVwGrVUzvf2YwxVC3T3K2qQeQv1ExvEokJVTX6TNB0ARQ3bTBhn6x6SGuslGVLGPZGGSVReiBGj0/k30DlLP/vsPsd3YRsfAOHNw+rWQb2p4M1CI8A/oHB9PTWgy7TANP6HWs+DouaZJo+TBQBkC+E6F4SaNr4U1j0jwnMk5dtRjT8QUVz84cH9fAJisuA9BDns25uYTY72jva0tHnmZOMXHNtejuIvOROMAw46mhgrM5BWto7vJlGOzb0jwRYLvsIBeCqFbgTyOuGfp2/pvBd1DBbfuH1M5sMvW6NrxUDaGkj1UbEqCSMnk8v0PwL1vmajMCkUYNuMfqvwYX6sYweDyQNWvn0zzAYPkNtxLcsmB0YOgVe0ZVztUAlUX1bPUkFirlCi992ktxnECgBkGL1uLKg66hqMeGoZuJW0IXAxCg5WyZ4iSKwVEyj8qAfsQz58FdIhC3/UKUZhDopj4cZdllIzQKVRBx56+cWoyhv234joJ6Gw/I6OFbl+YjBqbWRParh+NSGQgBjQTBIhV3x+e98U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnpGMlN2L05nMHdFVWNMdWgxVXBXN2Q4ZWxFR251QjhxRm42YmxuMUxNcmdy?=
 =?utf-8?B?R0FOSkk5bG1XWEllWUlWN3l3RlN6ZnZEUXdYK2FjSUU3R2RxZWJvYnE4bU45?=
 =?utf-8?B?Zk40cmY0ZWtYckViU20vbHFMRjFUcy9YaW5UUVp4SWwyQlFPMFFKZWNwOWJO?=
 =?utf-8?B?WTlxbzJKMmV3K0ZqSllwUEM5a2h0TDhnWHlYQjFJMUZlcFM4d1FKV3RzRmlH?=
 =?utf-8?B?cll0YUlOanhWVU5xeFVXZUQzVHdUWllpNUI1ZldsbjJNbGhiaFVHK1R1SUpP?=
 =?utf-8?B?SXRSbHd6Y1dtOWlVZXp3M3MzQWZpQTk4T1BrZURPclZWTldaWkE1TUhmZlpz?=
 =?utf-8?B?Rm5JYVkwazF0T2F0T3JtSVRGeDZhMFRMQ2tuOWZVbkdCSVIzd3djbE1XclNv?=
 =?utf-8?B?c21XSnQ0Z3M0dFd5RUNNUHNwamdEbE52RkMwdG5obmROZTh4MFNpeUlCQU9O?=
 =?utf-8?B?TmwvdjQ4YkdTRkVYelRFaUtEVDJTYTNrTWtVT2p0ZVNGdXdLOElWdG5EajlS?=
 =?utf-8?B?RWo0WWZUTVhIem14WGJEekxDZTc1VUFlOFN1R1pFdjBkZjQ5ai9nenNZaGYx?=
 =?utf-8?B?M2VSYnVNUlU3NVZRQXNybE5sWENjNHhhcG5XdjdTNU4rWEY2ZXp4T2FvVVhT?=
 =?utf-8?B?dzRjV05iZXg0RlhQZjk0d2lRNFN2OWxobi9yWFpoTFhkOGVlZlg0L2xFVFNv?=
 =?utf-8?B?dkQ5aWxia1krMkU1a2h2dGRKU1VTa0VaWjRxVnpXZklWZVFiWXd3aXNLV1RO?=
 =?utf-8?B?a1FjeENqSmNQd1ZwU3VOTU1MdUlCSVJYY3J4M0xJTjFsUGkyc3pBdXdCa3Yx?=
 =?utf-8?B?WURGbjVpL3dpdFFLVnRmbnIreDZDTysxL2J3RnJhWXZKd04xd01zSGJhNCs2?=
 =?utf-8?B?ZUFsTndqYk8xL1V4ekxOclZFbGtNamJTVmdicTlJQXVSTWRqNUZpQUVzekkz?=
 =?utf-8?B?MG8rZmdNMnhTV3g4RGpNb3ZiczV3S3RGS2V1c0U1Z3U1aE50bE5ORjh2SWt5?=
 =?utf-8?B?ODJyMFMzd1l6YzRqblVlOUZqemVLZEt3N1MwUHZ0cUgvMkFrR3lsd1Bjdk9j?=
 =?utf-8?B?V3RsL1lwanVLbSt2LzlRaFEyUWJTYjhCc2Q3MFNYN0NDdzF1aVJuYkd6TzlM?=
 =?utf-8?B?UXdZTkx3ckNWQnlLUkdDY3ZQRlpnaVhBQnIraFEwSHp2bkJCbXRpWUVUWVdv?=
 =?utf-8?B?RkhNL0xnM3QvUFBHRHM2Q3FlZ21vekVMV3I0U0s4ZmJaTnljbVcvZGJTbitU?=
 =?utf-8?B?VFhmdWYvWnBldkZiMG9JdFhOSlV4ZWUrTHJsaWZOdmZQazJzUE5GZTBTcjFG?=
 =?utf-8?B?QTBraHk3dWtER3VyS21NNW0vTDFrV2Q1RE94ZHFpSUIzOVprTmV6R1N5V09S?=
 =?utf-8?B?OWdJcDhNU3hkOGU0ZHU1QjVxU0RhMDRPNXJiakdRZDcvbEovak5zL2dZc1VY?=
 =?utf-8?B?WGl3bmNRNGxXMFVTMGlheFFXV1FoYXh1bTk3ZFUvVjhZeE5DVjRXeUZsZnEv?=
 =?utf-8?B?WEpsUCtvMi9ram5NNkZXakdFV2R6dHFVN2J6Y3dmRUw4dmI2dmdkMWdXbGJr?=
 =?utf-8?B?NmhQR2RnTW9zb3piOFlMOER2T1dibGR6eGZncGF4RVgxQysxb0F4UFljb1Rr?=
 =?utf-8?B?Y3JRdUJIMHhpdTFFV2xwNUJ4Q05rS3lVNTJTY1AzcllCUzJQanJxZEtmbHhQ?=
 =?utf-8?B?R0pBSEM2NThpT0tPQXI3WGNWeHJwWU50MmwyYTExK0VrWktxcmxkcEw3aUtQ?=
 =?utf-8?B?OGNvajkzYnhkRWJpWmpOeGFVaU1JYkIyMDVUK3I5bWxlYXVzekJwOGYzOUFs?=
 =?utf-8?B?K1pLbVRXeWhGd2xRUmdTd0IvWU0zeXJ4M2JhM2pKMkZCaURIbkZyVzQvNUxC?=
 =?utf-8?B?ZWNKd1dycXIvcnpFVHFQcDBibEpSWU1LL1Nxd3g5S3M1OGt5OFJVWmFzSEFi?=
 =?utf-8?B?VnQybDFKTURtU2hJL2R5TVFoY2VUWmF6K1hNWFdOWUdLb2x5WlFsbUVSdk0v?=
 =?utf-8?B?Qi9mU1M5bFZkOG1DYWpWcjBXOGpzbGJudlJjc2didmlpQkhuQTlUaUFwcU5C?=
 =?utf-8?B?TytibUZZYWxHckRSOFllVkd0eTN5NWo0VE5ReTdFM2U0VEk5akRPSG1MejZi?=
 =?utf-8?B?RjFkZnU1MHRROVU0L1krS1pJVmpVK3JVUmlWU1A2RGpZeHVpSXBqVVZGemZw?=
 =?utf-8?B?dFp4KzVCM2ZDc2Yrd1Zra29qYjR1UzlFWmpvTzZTa0FmMHRrekRnenFJVUg0?=
 =?utf-8?B?V1JGVkdoUEpORWRxRGQ2OTdGQWNUMmRYbmoyQytQZ08vaGIxOUhwVytjSzVV?=
 =?utf-8?B?WHBPbmxYdlB6bExVazhWQXBjNy96RFpJWTBRYVpHYUVOMHBPSXNQczY4OVFn?=
 =?utf-8?Q?QFae6mGYKeX0j/dI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb563a51-ebb2-4557-3b18-08de9562bc58
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:34:03.3195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AO7vDKYxzoHLEde2OnU++8jggkrMDeEWFOYR6XxuXY+1pdIM3b8UUoUiSBkkvodzvYydfAR3wryhwnDs0Vt4aHCwp7dMhK9pZ8ERwt1v7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5634
X-purgate-ID: tlsNG-33051d/1775648046-CAB23C9A-B5E99887/0/0
X-purgate-type: clean
X-purgate-size: 6620
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B72EE3BB521
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 11:22 am, Jan Beulich wrote:
> Provide support for this insn, which is a prereq to FRED. CPUID-wise,
> while its and FRED's enumerators were already introduced, their dependency
> still needs adding.
>
> While adding a testcase, also add a SWAPGS one. In order to not affect
> the behavior of pre-existing tests, install write_{segment,msr} hooks
> only transiently.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> For PV save_segments() would need adjustment,

Not really.  CPL3 must never have a way of modifying GS_KERN, hence ...

> but the insn being restricted to ring 0 means PV guests can't use it anyway

... the CPL0 restriction.

Arguably I should have had this in one of the FRED patches:

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1151997758c6..3364e774ada7 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1952,7 +1952,7 @@ static void load_segments(struct vcpu *n)
  * changes to bases can also be made with the WR{FS,GS}BASE instructions, when
  * enabled.
  *
- * Guests however cannot use SWAPGS, so there is no mechanism to modify the
+ * Guests cannot use SWAPGS or LKGS, so there is no mechanism to modify the
  * inactive GS base behind Xen's back.  Therefore, Xen's copy of the inactive
  * GS base is still accurate, and doesn't need reading back from hardware.
  *


but I don't think it's appropriate to merge into this patch.

> (unless we wanted to emulate it as another privileged insn).

We already have "LKGS" in hypercall form.  It's spelt
SEGBASE_GS_USER_SEL and has existed for 20 years or so.

I don't see any reason to extend emul_priv_op().

>
> I've also dropped the test harness read_segment() change. It generally
> would be correct to have, but isn't needed anymore with neither SWAPGS
> nor LKGS handling using the hook.

Dropping read_segment() makes your patch depend on Teddy's, now that
test_x86_emulator is blocking in CI.

This matters for backports.  I expect I'll be backporting guest support
in not-too-long.

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -2899,8 +2899,37 @@ x86_emulate(
>                  break;
>              }
>              break;
> -        default:
> -            generate_exception_if(true, X86_EXC_UD);
> +
> +        case 6: /* lkgs */
> +            generate_exception_if((modrm_reg & 1) || vex.pfx != vex_f2,
> +                                  X86_EXC_UD);
> +            generate_exception_if(!mode_64bit() || !mode_ring0(), X86_EXC_UD);
> +            vcpu_must_have(lkgs);
> +            fail_if(!ops->read_msr || !ops->write_segment || !ops->write_msr);
> +            if ( (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
> +                                     ctxt)) != X86EMUL_OKAY ||
> +                 (rc = ops->read_msr(MSR_GS_BASE, &sreg.base,
> +                                         ctxt)) != X86EMUL_OKAY )
> +                goto done;
> +            dst.orig_val = sreg.base; /* Preserve full GS Base. */

"Preserve current GS Base."

> +            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
> +                                         ctxt, ops)) != X86EMUL_OKAY )
> +                goto done;
> +            /* Write (32-bit) base into SHADOW_GS. */

"Write new base into SHADOW_GS.  Zero extended from GDT/LDT."

> +            if ( (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
> +                                      ctxt, false)) != X86EMUL_OKAY ||
> +                 (sreg.base = dst.orig_val, /* Reinstate full GS Base. */

"Reinstate original GS base."

> +                  (rc = ops->write_segment(x86_seg_gs, &sreg,
> +                                           ctxt)) != X86EMUL_OKAY) )
> +            {
> +                /*
> +                 * In real hardware, access to the registers cannot fail.  It
> +                 * is an error in Xen if the writes fail.
> +                 */
> +                ASSERT_UNREACHABLE();
> +                x86_emul_reset_event(ctxt);
> +                generate_exception(X86_EXC_DF, 0);
> +            }
>              break;
>          }
>          break;

This patch needs one more hunk:

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 5273fe0ae435..9d8195e2ae56 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -765,14 +765,25 @@ static void __init calculate_hvm_max_policy(void)
      */
     __set_bit(X86_FEATURE_NO_LMSL, fs);
 
-    /*
-     * On AMD, PV guests are entirely unable to use SYSENTER as Xen runs in
-     * long mode (and init_amd() has cleared it out of host
capabilities), but
-     * HVM guests are able if running in protected mode.
-     */
-    if ( (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
-         raw_cpu_policy.basic.sep )
-        __set_bit(X86_FEATURE_SEP, fs);
+    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    {
+        /*
+         * On AMD, PV guests are unable to use SYSENTER as Xen runs in long
+         * mode (and init_amd() has cleared it out of host
capabilities), but
+         * HVM guests are able if running in protected mode.
+         */
+        if ( raw_cpu_policy.basic.sep )
+            __set_bit(X86_FEATURE_SEP, fs);
+
+        /*
+         * NullSelectorClearsBase is really a "hardware doesn't have
this bug
+         * any more" bit.  All FRED-capable hardware has NSCB
properties, so
+         * disallow a configuration which suggest/causes behaviour the
OS isn't
+         * expecting.
+         */
+        if ( !test_bit(X86_FEATURE_NSCB, fs) )
+            __clear_bit(X86_FEATURE_LKGS, fs);
+    }
 
     /*
      * VIRT_SSBD is exposed in the default policy as a result of


because otherwise a CPU Policy could hide NCSB and LKGS would be have
correctly when executed normally but malfunction in the emulator.

This hunk is in lieu of having vendor-dependent deep-deps calculations,
although it would need duplicating in userspace too.

Because this is only a link between an AMD-only feature and a common
feature, I think I can express it by only having a per-vendor
deep_features bitmap and keeping a shared deep_deps matrix.

Perhaps I should prototype that instead, but it would become another
dependency for this patch.

~Andrew

