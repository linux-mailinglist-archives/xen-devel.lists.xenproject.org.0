Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN0UOiSnHmq3IwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:49:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D8462BE0B
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324679.1590168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULkG-0007jx-Md; Tue, 02 Jun 2026 09:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324679.1590168; Tue, 02 Jun 2026 09:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULkG-0007hE-JS; Tue, 02 Jun 2026 09:49:12 +0000
Received: by outflank-mailman (input) for mailman id 1324679;
 Tue, 02 Jun 2026 09:49:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wULkE-0007h8-Mz
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:49:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wULkE-00GRkB-1W
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:49:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1ea701-5cb7-0a2a0a5109dd-0a2a4502affc-38
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:49:09 +0200
Received: from [40.93.194.32]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1ea714-af86-0a2a45020019-285dc2200e91-4
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:49:09 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA3PR03MB7764.namprd03.prod.outlook.com (2603:10b6:208:50c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 09:49:06 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 09:49:05 +0000
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
 b=uyRkmNyeRLaTrvppdX+edSV/m74Ckkj207E7Fe0ckDS11ORkFSWtMIxcCv0st/+9mXfvilznagl5N3/ZOfVKs9LSnOoHY+r27Z+EMvlEkVve5/lUwvPhhVAOugecdxOj89sWAJ7g86Z4/elyvOQ1CLAMUxH4NQZT25MW6Bb3ANTSGEPuayx0cX3vhB9ose7hoteCnvkaj5czQnrMm4ZrYhC28Fbz7T0rVgjRBth0SrR5g3kiiTl5DP7bdrDTNhZjQl35Ryg2vEFW41/rarP2OUoaPDEItUy5SfnTaInziA0D88AMozslGKwTHMMbOq5gpTKvfwGY2XaGQjCMgit1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPxSoZqGyGQQTAKUzy4uyC5cj6Bm7gEwiqRl8Oof5JY=;
 b=RJProFqCEedUlI/M2r9QA/g60IcRvtE0ZkQXictRcREsmhUg3rm6sgVcJYUETFd8fS8UutG+7BBHgpgtJUSj7ar+5txBOPlHqYXV82oFwrP61UVc11IVHpzARKsBUOIAn2Ki24xKZHjtxxC0ABBwVPgSqpuHJNORGsaNfIfam5/kKQTvxuRbTpBiNmKd5rLR4JNhQm4+1qtQG9LdE86awXx2TioXz8w2E2TRKtysoYlHUdDaYUHiLeIsG35rJ1l5hQqAvmBLoAx5OdOlfExvilua6LPoHOVR9LfaX1HhVHJwlBqOMPcfQNa0opgwbIDedBKhQrln2PGlHQ3qeG9xWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPxSoZqGyGQQTAKUzy4uyC5cj6Bm7gEwiqRl8Oof5JY=;
 b=YqPoE336F/EZmPld2b1xybtYqyLEpBd8JCvrbrjwF+lRkH+5kbGcfQKpy3koeF9VX7CLRsDRwAvJ4TmHsOIqyVtY2IOght7EdrUdhYuc+bJj5iyQ5yIY11pLQALDmocoAPgKkvWASSZs7r8MtyBEowybzadzxcBdN/1z4D8SUPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 Jun 2026 11:49:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org
Subject: Re: [PATCH v6 4/4] xen/console: switch conring runtime allocation to
 xvmalloc
Message-ID: <ah6nDtFZTo-xhor_@macbook.local>
References: <20260509005714.892018-1-dmukhin@ford.com>
 <20260509005714.892018-5-dmukhin@ford.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260509005714.892018-5-dmukhin@ford.com>
X-ClientProxiedBy: MR1P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::30) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA3PR03MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb0e42e-4b9d-4b37-65d8-08dec08c2f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799006|4143699003|3023799007|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tlV5h3Jr98zj/BBIjaxj7eaj/IPQn76ucgfBPHemybt6qzj+N6010k6X2TzfD3WD9lOope4dFYbYX6rcr4akSCHzWxHEDzZewo1i7IWFkRg4IxaSIvxLURiGoFrq8H488Fb5uhFk5yQ7OS06xxVLa3iMJ2lllx/I6V5PFU5UAw5spkzZcHqMLmWuYaaAlO/r2RWIT4JQ4yZfqTTDMtJXq/p3bCPbHLWBc10Wo0Uov3Idml6MW52caBO/QMCBG5g1+2QdjEeEMMXieH1InjD/Z+KhO30KNAh0f64GwGYBZVHTZFkLNl9rhZXpZLaAVp6dRs71KAr2P/Dt4f7yjbiSLx5dCXJaRVjkykgycHtG0/F3T1G4psjsR0OACY2f0o6z3nUnI22sRMj/YRu9OzFtBTaVi5qGWwCrvSKFpRguBhHzzE/rgW/Hx/1ud6BL8BMcB/zLEqI4jCS/2x0k9O3+VQAIHLzJuwfjyHtFzZK6xYpMkLjbTr0iMoCN60zDFFjFXR4LFpWkJ+nfkvS/CGJn5AQKSm/o3P1Rw5ZUOUkgvP7OqwWqjk6qeKzhjLOFcBO2JkZfRQrkxeLlDm2btFKpZHU+/b5jEJkPWV/bzB5JkSblZ1hHF9LJRRydhSYBl1L3VF2B+l5cismQwvfgdfq/ykmei6QYW/uxSqcQ3+kVmcTZyggi22dxVyWzlFeBXOAW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799006)(4143699003)(3023799007)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azhDa1RQQk5MU002WlNHSGRUN2RHYWZ6Z3hnYThUQkhsTnNWTHROc2tZUEQv?=
 =?utf-8?B?WC90Tjg3dE1wdnJNcEM5cnJWT2tMaDJsUm1oa1EyL2pLTEhoV3V4SG4xdG1E?=
 =?utf-8?B?SXV2d1ZYRWQwcndkbXl5OXZYWi9Lckx2c08wS0ZWd3RmajkwdVFlWTRVU1k4?=
 =?utf-8?B?cDZVRUc1NjIzd1pjaXhmM1YvejI2QnpIT3BkK0N3RXp4Wm5MNG1Rd3B6YmpN?=
 =?utf-8?B?YkNhUGlmY0RPSmd0c0c3elZQdjFZUUc0eFpYUFZ4MG9LVGhMTjdyVEhZRkN6?=
 =?utf-8?B?SDJ2dEdBSk1rTUIwTVhMb04vbUxKeldMUDRnaXpQamlTd1V1SnlGd2F3TWdn?=
 =?utf-8?B?b3JoSWRTNE5GSXB1c2tnUnNDOURUT2VjSWhIbDVXYjVMekRCUXBPaXUwbW1F?=
 =?utf-8?B?b1JnOUxNL1N1UWE0aEtRZER3K1Zkb3ZNQXR2TjEzM25UYTdCcmxrYjVPTktU?=
 =?utf-8?B?SFlXREJqaVJTUzlpRHBHcXJxT05LaEtlM205OEJTY0hhVThHd0JLckVVK2M4?=
 =?utf-8?B?UWJpTndxNU0weE1UcFRqOHRrYWZOclJPVVVBZTh4a3JuckNPcnJjM3c0b2M2?=
 =?utf-8?B?a3l4Vi93VFZWOG1GaTZqaWZOcjVDT0NIeGlWY3NGMi9VYkxYYXFLSFdJNjlN?=
 =?utf-8?B?ZERtNWZIVWd0MWRvdzJrRkphNnB6MW9veVZmTkJIVjBqczVHS3paS1Q0Tnp2?=
 =?utf-8?B?Sjk2UjdYRW1pZW5MZWkyUXdFemRXK2dLMHFYdUpXSWdYUE5Xc2hiMjlVVVY3?=
 =?utf-8?B?RExVbjFoNzNuYWsvNU1iMTgzcVliOENvRmc1aHRNN2Q1bjhJM0hpQjBnRkVY?=
 =?utf-8?B?YXpLQVRPTFhRTVZDb3I2NFFYTWF0Q280ZkMxVmgzWjlSampVTTB3QXN4UG1y?=
 =?utf-8?B?cDMzRTZhakhoT2ZqbFoxc3Q0aUxUYzVWYTR0bUZ2OWExeVFsalBoTVRNd1Ix?=
 =?utf-8?B?b054Nkg2c1dmNEpMcnRHQmlURlA2Z1MzZGo5WERNeFdPOFdObXY5cmpTRjNj?=
 =?utf-8?B?ZTFvZUVFNDB1VW5QTjNBU1NCNno2VG5lSDcweVA5Q25xZ3dIZUQwKzVxZjNF?=
 =?utf-8?B?dnBNUTNuaWEvLzlGVU1RNEJDZ0VCQ2RQNTJOUE5OZCt1UUlWRCs3ektsbVJq?=
 =?utf-8?B?SE5iQ1U5d3pzSUh1c00rQ3lkc0VyVHBLWGNIYkZQRE9Zd294ektrZ2JrT1NY?=
 =?utf-8?B?YWpZbzUrdnJpeEExdXZpTEpyL1FhY3ZnQVlScHM2cGNCU0c2aFNsOFBvb2JW?=
 =?utf-8?B?VkpBeXBWZ1FHV281Q1J4SVpxREFHNXdvYlpaN211Q1RTRXNySG5JZzE1UVhu?=
 =?utf-8?B?ZDJ1cEsrbFZ0MEV6QXpaQ291Rys5WVVmMHlpVlVYazc1RVNFaGNNdGMxekFQ?=
 =?utf-8?B?dkJUeHhyMHBWc2F5K2xKVWNvSTZsSnZ3azQzeVEvaWlPQmZoNjRjV2Vvei9Z?=
 =?utf-8?B?LzlPK1R5dEVLSlBEWFZLQnBqWUU0NXNScTh0am1RNGxjQ0h6cEpFU0Q4TDh6?=
 =?utf-8?B?bjFlQVJwYWRTZzdvUWNhOWdSbHJFR3RoRmQ0bTZHSWRUcEpDcStYWGgzMlJq?=
 =?utf-8?B?K0RZYVdrMGk2RnY5UU55ekk0aWhrUnYzUUQ4OWtGY2c4bGZCRzN0UkhOaWlu?=
 =?utf-8?B?Y0E5c0lBWGdQYm9CbkFoNTJwcFVzUVA1ZW9xZ1djTmg5NWNaMWR4OVBuNEZ2?=
 =?utf-8?B?WDNWVFVISlllL2NrUXhuMWJmcEsyaXE1d0ZkYnRIeWFGdzByRzI1RTlGdnlC?=
 =?utf-8?B?SDhNc2s2M0pKdkpFbzQ0NXdHVnU1MEhDRUt0SThEK3EwNHRDMHd4VDg2OGJZ?=
 =?utf-8?B?MkxmT210NHJlTzF2Rk9MRitDeUZTZVEzejdza3lLT1FnenR1VG8xR2plNGta?=
 =?utf-8?B?WjQ4ZXpBV0FKTWY1R2ZHeC8xTmFzSklLUi9xbWNJeXVvS2R4K1h5RThjblRE?=
 =?utf-8?B?eUtLbnlCeXBJcnlid0tOdFMzN2hCM21KRFZkVzFQcU0yQU1mTEF1bytZVXZk?=
 =?utf-8?B?WVFNUElYNFhkR0dwZ0ZFdnBiSGgwbytjVTBpUWY5eEwzSWxKSjBSZjNCTzN4?=
 =?utf-8?B?WnJOU1I5UU1aWXN5UzNaQ3NWSk9aTVJkUzE4M2pkWU83VHBQTTN4U3Izd2tR?=
 =?utf-8?B?QmRsSm5UWmVuamU3QS9CR25HNHJKeHJ0eE5sdFZZZzFxT2JUYXhWOEJobG5w?=
 =?utf-8?B?cHJ4bWxzeXl3SFdHSDRreERzTFN1em9oYlJmTHBwT1JTN1hSYVRQS0V2ajNS?=
 =?utf-8?B?eVVNZ3Y5M3BRQ09lSzhsTWZ3cVRqYXhlRUF1ZTMwbytyM3VHc1N5SDBLb1ls?=
 =?utf-8?B?c1BBSUduZnNMNzV3a0F4UlNjZ2NGVGQ5V2FDbi9nTVpOMEh0SnBxZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb0e42e-4b9d-4b37-65d8-08dec08c2f62
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 09:49:05.8253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ds9vqtuHZVuqCd9nc0WADqmM2omBXyGbJYxC092Bfa7+OBolskpnildrGMtwsffSqURxpaBroh3CPzd8nLqL9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7764
X-purgate-ID: tlsNG-720697/1780393749-81573161-D5526BB9/0/0
X-purgate-type: clean
X-purgate-size: 4137
X-Rspamd-Queue-Id: 51D8462BE0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 05:57:14PM -0700, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> The console ring only needs to be virtually contiguous; it does not need
> a naturally aligned or physically contiguous allocation. Replace the
> runtime xenheap allocation in console_init_ring() with an xvmalloc-backed
> buffer.
> 
> Also clamp the user-configured ring size to the supported range and emit
> warnings when the requested size is adjusted.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v5:
> - switched to xvmalloc_array()
> - fixed conring size checks
> - corrected diagnostic messages
> ---
>  xen/drivers/char/console.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 5cac87d052b9..29b9359468e7 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -33,6 +33,7 @@
>  #include <asm/setup.h>
>  #include <xen/sections.h>
>  #include <xen/consoled.h>
> +#include <xen/xvmalloc.h>
>  
>  #ifdef CONFIG_X86
>  #include <asm/guest.h>
> @@ -343,6 +344,7 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
>  static unsigned int __initdata opt_conring_size;
>  size_param("conring_size", opt_conring_size);
>  
> +#define CONRING_SIZE_MIN    (1U << 14)
>  #define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
>  #define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
>  static char __initdata _conring[_CONRING_SIZE];
> @@ -464,20 +466,33 @@ void __init console_init_ring(void)
>  {
>      char *ring;
>      XENCONS_RING_IDX i, size;
> -    unsigned int order, memflags;
> +    unsigned int order;
>      unsigned long flags;
>  
>      if ( !opt_conring_size )
>          return;
>  
>      order = get_order_from_bytes(max(opt_conring_size, conring_size));
> -    memflags = MEMF_bits(crashinfo_maxaddr_bits);
> -    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
> +    size = PAGE_SIZE << order;
> +    if ( size != opt_conring_size )
>      {
> -        BUG_ON(order == 0);
> -        order--;
> +        opt_conring_size = size;
> +        printk(XENLOG_WARNING "Normalizing console ring size.\n");

I think you want to also specify to what it has been normalized, ie:

"Normalizing command line console ring size %u to %u.\n", opt_conring_size, size

However, note how console_init_postirq() sets opt_conring_size if not
specified, and AFAICT that calculated value might not be a power of 2,
and it might be lower than the build time setting.  If you want to
print warning messages about the user-provided value (if any), you
need to split the checking from console_init_ring(), and do it
exclusively for the command line user-provided value, not for the
value generated by Xen in console_init_postirq().

Also, a user attempting to set a console buffer size below the
built-time value will get this "Normalizing size" message, when it
should otherwise get a message about the command line value being
smaller than the built time setting.

>      }
> -    opt_conring_size = PAGE_SIZE << order;
> +    if ( opt_conring_size < CONRING_SIZE_MIN )
> +    {
> +        opt_conring_size = 0;
> +        printk(XENLOG_WARNING "Ignoring too-small console ring size override.\n");
> +        return;
> +    }

I don't think this is possible, as the built time Kconfig value is
forced to be >= 14, and hence the order calculated above can never be
smaller than 14.

> +    else if ( opt_conring_size > GB(2) )
> +    {
> +        opt_conring_size = GB(2);
> +        printk(XENLOG_WARNING "Limiting user-configured console ring size to 2 GiB.\n");
> +    }
> +
> +    ring = xvmalloc_array(char, opt_conring_size);
> +    BUG_ON(ring == NULL);

Since you are already touching this, might I suggest to use a panic
rather than a BUG?

if ( !ring )
    panic("Unable to allocate console ring buffer of size %u\n",...);

Thanks, Roger.

