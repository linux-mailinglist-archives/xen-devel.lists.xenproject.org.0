Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vbPRAI1oKGoADgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 21:25:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E86D663A33
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 21:25:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=UWNQsPbi;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333802.1596968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX23r-0003sj-PS; Tue, 09 Jun 2026 19:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333802.1596968; Tue, 09 Jun 2026 19:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX23r-0003q9-MP; Tue, 09 Jun 2026 19:24:31 +0000
Received: by outflank-mailman (input) for mailman id 1333802;
 Tue, 09 Jun 2026 19:24:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wX23q-0003q3-6v
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:24:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX23p-00EXMr-59
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 21:24:29 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a28684e-5cb7-0a2a0a5109dd-0a2a4502cb36-32
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:24:29 +0200
Received: from [52.101.201.57]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a28686b-af86-0a2a45020019-3465c939a460-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:24:28 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5737.namprd03.prod.outlook.com (2603:10b6:806:113::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Tue, 9 Jun 2026
 19:24:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 19:24:24 +0000
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
 b=KvkhnJb5qrwGbqan9KXDYAYMZlonhRuo/ooMQ5LvlpvBXQtrHLfWG1ShY7b+paFrLJSYmgPbC45ad2V0zylhBVL8MpPGgQ4qGGROcVvZymZt/9Eogr0TL1/ZJr1s1z6rR8F3jQ7+F+0v4SqCoR9PaAfQxSMqp3FnNB7Xt6BbUERBwkokR9r2nbdTCIYJU3vvmjww12RnbA4n9nn39971WH2gbNro9CcqPfPNiIZ2iU/caInIhAqJkmwlyzY8er985Cdfn9blqG6JzgPzh2DMDR55TCXswX3v0DZgq4gmJJbpQOzLdPh8+YTKvjkDVQqzt3AThgrmTsrZXuBYPb0TjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyoiHT2cTEOIOlZnH3NalY2fNPD+WHiukc04aBIndmA=;
 b=b82LSV8AiqZ3WlQuqjvgTIMWz3at2hfzKxjCh1cnoLKMxRVrC7QQSRyV/p2QR8x0lp+V+NIP33gh5M46BZKan2g41uIVCYXaU9B0kTRELW80PUUSbb5uq/mCUCgFa8YfBVmaFD8NkKKUpl7HG5mPI4RlP5L+65YPDlDH/e6edEKLAo69Qp0AXm1GkrJllmKfdDSAemHF7avUbO52Wo3pHPLM6Wo49voby9y56DHYsy07p/3yuLwCrVM0YIB7o8ridXVKkq23//qcjPPO/185iSrvbxe6ANkQPRkoVlYYxmEGxOeX2id/eyKykv2jIFEKwPuCcxYtV3/vnpTKxoxi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyoiHT2cTEOIOlZnH3NalY2fNPD+WHiukc04aBIndmA=;
 b=UWNQsPbipn+wJilWw73aXNQ4mWdUsW2NUVXJMy05DbCk+IKrQO/TH9CvoZLGqvIovuiVfxPKdEGiULGs9EWdQbaieBgTmhIHec6b1XFf2zm7SccFuD07BncsQuZbhM+Io+UIgN2w3ErBmQ6+V0iCpbQBWH8usYiDvpDimcISBTI=
Message-ID: <51c97f26-2b18-4ae3-93c2-33793c7b8803@citrix.com>
Date: Tue, 9 Jun 2026 20:24:21 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH 3/7] x86/kexec: add new struct kimage_segment
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-4-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260609154518.779757-4-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0222.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3a5a47-d42d-4b92-6d1d-08dec65cb748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PGl+RPbkieGLTNSZpDC79+ijZtOZ2nb7j5l21cX0FyjQTgrrGVHMtXibASDI3v6TmxZdHiYGt2No3x2h9IExF8RojgDtVL8iOrl15ySBe6hCPB9/ZuaWV2U3uYTHT4pNWk8LIJhKX9dGzXrHv4piJV0o2olK0EGLiecX7iH5GvC5RxTSqbuEKkE2TEaMtSyzLS305UcrpqYJ0WcWbJthf+/HNqqV12wl27RSjCxSusTrfLEjVsRVisxdWKH+eq0EMVRqHZqB5GcIKDngjUQp1CT97beDCHDBdLKhWRMCaR7FX8G4jaXqf5n7Sawyd0+zDrAEar0ujiIiS8yb+y9yUxvah/MF1Xodtkww4MmQCYhAJJmOK3H/UDJHIE9Q+qv1F6WpVWIVhbzNKK43Y3Tv/BJWr7x3zzNsZy71/czFfrQGEtWjoaM+wESpAj0cfTc9ZbcbzP/PFieNkqatk8nvSsrxy9od5GPNuFAwSh+uqKHZ//1T+dwo4H1BUjG0EcNejx98tl0CV9ez+P4n3mSMKNrUlpxWeWbmOXBUsT5mSCuSwA1CCU5rqD1awsryinrcuvG/dp0Hh/bjM97UCLTCLtgKl+m5HBGcXhAvwj3OCApCW+cOGA93/gwlpF1mQLExX3TwxNsruzhqmGWQxrGCdKAffW4kwZGb9/nwJbfv/o/DCETYhNAKDDYnzJvmt93e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVdOckliQzB5NFprVlBNblZPbXgwQUFPd0hzUnl1Nlp2V2pISytoaG1HbjVO?=
 =?utf-8?B?VXB3eDU5VGRQUVhFNkcrTW1pSDQ5bEhWVUtYOE0wMVFSQWt3VlUzL1Mvc2JX?=
 =?utf-8?B?MzVJT3BOTDRtczVUelR0R1VQQzhvTEdSSWZJcTBrVllnZzRZTXhycERiRFlp?=
 =?utf-8?B?Z0h5MTdlWmRHUW5URVdLdE1ndllyUjBaS1R2VzdUakpHdGg5a3VFQUVzam9p?=
 =?utf-8?B?UmVjaXhmV0ZHWnM0QU1qUldFc2RZRXBKZngwdGRFRGt2NzlIRHU4eXRYdXVS?=
 =?utf-8?B?b1ZQdTVaR2JRUlNQdWpKUmxTUVRNQ3hDL2daV294YkN0R0xYNEd5M0FrUCtC?=
 =?utf-8?B?RUNobHRDVlJBOXQ0L1dHcUVES3pXSGk4ZnZWTFFOMXBORzVWci9MTU5Saklp?=
 =?utf-8?B?QjREb0hWWnhFbFgyTHNvRzlzZU05RDlFMXJmRDRhNGJXS3prdkFkSUl3VWdh?=
 =?utf-8?B?bm91VjFBMTJBdmNmUWhRa3VDUjJIWHhDeEhSYTgvblhkN2k2VTBoRUdRY2tI?=
 =?utf-8?B?c2VVdm52SDdmWm4yR01vMUVzYWc3UXFJOXU0K1RrbW1MeENqN2M4STBSLzgv?=
 =?utf-8?B?L2k1bzJjMXBDT2djaHgzek5yMUFmSnFKeUhWSkt6TllzUU1wWm5zVDJzRTN0?=
 =?utf-8?B?eDA2Q05WN1Fta2dnYzhjNm9jMkx3Y1Q1YmtEdnNxZ0pITFpZblFiQ2tpMCt5?=
 =?utf-8?B?L0JJakZHMW1pVmYvV1NHd3NsS1NCUE85c2x4L2xBNU56T3pJd1ZPNzhGNXRK?=
 =?utf-8?B?TmVqWUQ5TVluYktobmtpWjJYOU5qUHIyQ2l2dTIvc0tqWHZpVlY0UWJ1L0Js?=
 =?utf-8?B?Njh4T3Q1bXlHRnpjMXFCaFlBYlpObk9BMytFOWE2aDlOOXVaUEIyeXBiVnF4?=
 =?utf-8?B?cCs3clVxUmVtZWxxd2dGMkZxNmNpZGZXWFZsWnpGYXc0WWNhVEx1NzMyeXA3?=
 =?utf-8?B?TC83dktmbDlyVFRiTHhwbEFxdTFHb0ZwdnNIWnZ6N2E1TElZNjNSclJGMEM0?=
 =?utf-8?B?enc3TUZLMzNzeHZiVjVJekNxZ29peXFJZlpsZEFwV2tsM3dtbnNDWTdzUVVI?=
 =?utf-8?B?TXBFNXAzNmVkQjgrYkloT0RIeGRWaWdIMFVkK0xvV0YxL2ZmaFVWVnFEMzFF?=
 =?utf-8?B?RzFyREJsbjN6VHMvNGNrcTh1OE1lQ0UrZGhYQTM2UG5QR1ZTMXVjUmRpZk9m?=
 =?utf-8?B?ekI4WXJEU0pkTFFMcmVyUDQra2RITmZaV3hndEpGSDJVcFpGT3BoTUhpUVg0?=
 =?utf-8?B?dlp2c1FsNkpoa1N5TStORjVqcjBmWDltMWxkVjd4d0F0VjFPTG4vVGFXQlFU?=
 =?utf-8?B?YnhreWZQWTBmQTAySTdTMUFlYSsyMnlpSmpFeUZpQkpPYlZsc1lCVVNYNG1M?=
 =?utf-8?B?WkpOWUtsT1ZEWTAweVdrWHFXV0I3N2NvN01KVGk3L0ZoQ0JGbzhwd0VWd3Zx?=
 =?utf-8?B?WGp6bVlpU3F0dWtkS2lyQ3BmUHNlUlp5SEJYQUd3b3EwV2pOZ2c1aVZobGtG?=
 =?utf-8?B?cURxOHRVZENxellyKzdrNzRxT1dpUjJtdDFOUlBhaGNuOE14b25VODVvMHJQ?=
 =?utf-8?B?OCtLNEJmcW9DWFpTZ0ovMWtaUDNOSlFZNWtiZDhYbEJ0RjRiVWMwMGU4T1Nn?=
 =?utf-8?B?NTJZTExRdlRmTnJRSS9rRkViS1dwSjJtMUo4Z0JiNFI0V1FDeGVJUXZCK3JI?=
 =?utf-8?B?cUYzcml3Y1ZuQ2E4RzlXeStWb21tK1E5QkpuTDIveWVxTkVDM3lPYnJJUjBW?=
 =?utf-8?B?MEZCTmJacHZzT1QyVnRxWExmMVNlWEpGRUU4RkVVSXcrRVdhL3huOVRhbFg4?=
 =?utf-8?B?UllNZXg1ZmxwRmt6TlQrQXlSejhwSys1MnNOdFkzbjRwTktrT1ZtN1FrSjFN?=
 =?utf-8?B?b0M4em5uT2psZFREeStxbktUOEt0NVp4dSsrQStFcHRlZlhseDFWOENocU85?=
 =?utf-8?B?S2tXZ0ZiaXhjeGxXMkhrNW9YSXlQcTkzQ2k1OHcwVWdJYmpFTHpGd0Faa0s4?=
 =?utf-8?B?UlVpTnFDL3lvVGViMGkvOUdqaVh3Z2d2cGpBSmF1K25yeWpWTE5zbmNKREJK?=
 =?utf-8?B?WVkxSTExaHlMelRDZFl0RTZKSEJLTXNtZzArQjRyQ0l3QjZ3S3BFM0VnOVhQ?=
 =?utf-8?B?RXV0MERub0U3N21Oc3orcW9kbFd2TFVLQXlTMFI3SnNEUlJoY096eDlGTnNP?=
 =?utf-8?B?bS9IM0I1YVEyb2dET0IvN2crWmxrNGRzUzAweGJpUUkybnpzcTBZY1hFell6?=
 =?utf-8?B?L3BtSFgydlB6azEvZjlnV25lSUxWRUVvTmVLLzhFYmI1ZVkxZVkvMGcySW1V?=
 =?utf-8?B?T2h3TDQ2Zzd6bEZ2MFJRRnp5Q01KbzVGMHZtZnVLS0s4c3hVTWlXZnZ1VHRL?=
 =?utf-8?Q?La7g/xBAQ21nf+Ao=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3a5a47-d42d-4b92-6d1d-08dec65cb748
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 19:24:24.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6AJYy6+id6VQJsbOE5Gk0GpTmUhAlhbt8NQFQ+5FjCavqNbBabpm1aCwTtg8G4BA3Q75S+XtBPt1sxorPadWQKaNtbHrSpOu/tR6F4BoEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5737
X-purgate-ID: tlsNG-720697/1781033069-A937C161-D7A63FE9/0/0
X-purgate-type: clean
X-purgate-size: 1796
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E86D663A33

On 09/06/2026 4:45 pm, Kevin Lampis wrote:
> diff --git a/xen/common/kexec.c b/xen/common/kexec.c
> index c920bc6d8a..00346fe616 100644
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -1119,14 +1120,18 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
>      if ( load.nr_segments >= KEXEC_SEGMENT_MAX )
>          return -EINVAL;
>  
> -    segments = xmalloc_array(xen_kexec_segment_t, load.nr_segments);
> +    segments = xmalloc_array(struct kimage_segment, load.nr_segments);
>      if ( segments == NULL )
>          return -ENOMEM;
>  
> -    if ( copy_from_guest(segments, load.segments.h, load.nr_segments) )
> +    for ( i = 0; i < load.nr_segments; i++ )
>      {
> -        ret = -EFAULT;
> -        goto error;
> +        if ( copy_from_guest_offset((xen_kexec_segment_t *)&segments[i],
> +                                    load.segments.h, i, 1) )

This cast is unsafe.

It relies on struct kimage_segment having xen_kexec_segment_t at the
start of it, which is not mentioned or enforced anywhere.

In the next patch when you add dest_offset, this leaves parts of
segments[] uninitialised.

Read into a local xen_kexec_segment_t variable and fill in segments[i]
manually as you're wanting to change it's type.

> diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
> index ad52551ba2..258349d774 100644
> --- a/xen/include/xen/kimage.h
> +++ b/xen/include/xen/kimage.h
> @@ -18,12 +18,22 @@
>  
>  typedef paddr_t kimage_entry_t;
>  
> +struct kimage_segment {
> +    union {
> +        XEN_GUEST_HANDLE(const_void) h;
> +        uint64_t _pad;

After separating the types, get rid of this union and _pad.  It's ABI
abuse which needs to not infect anything it doesn't strictly need to.

~Andrew

