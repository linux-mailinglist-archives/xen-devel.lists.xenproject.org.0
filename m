Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nLwlBJDBOmrnFwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 19:25:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679D46B9078
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 19:25:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=RNQEUG+z;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344471.1603523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc4rv-0006AN-HC; Tue, 23 Jun 2026 17:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344471.1603523; Tue, 23 Jun 2026 17:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc4rv-000690-EO; Tue, 23 Jun 2026 17:25:03 +0000
Received: by outflank-mailman (input) for mailman id 1344471;
 Tue, 23 Jun 2026 17:25:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wc4ru-00068t-02
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 17:25:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc4rs-008I0u-NN
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 19:25:00 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3ac12c-bab6-0a2a0a5309dd-0a2a4502c402-46
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 19:25:00 +0200
Received: from [52.101.48.48]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3ac16a-fdf1-0a2a45020019-3465303047f9-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 19:25:00 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DSWPR03MB989167.namprd03.prod.outlook.com (2603:10b6:8:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 17:24:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 17:24:56 +0000
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
 b=HLaOlp+cLWbMtHxsp4kBMroRZ+q4G+4LhtuAJY9+wy+Nv33/IMMiz0XMF2PRdd8lkD1ErdauLfGoMg2bweT56zusJeJYF9PGZYbr18GLvyRd+XgDAMoZ4G4Qd9Fxbm85EMiNyCyByOkhB1aQ9NKrqmoDOkl8i9JFmmRyDjPZUNrjUtGdptzzWD5S8MpRT+WIZHV6ThPg6DYiX+9lOBMff6s3uIXBeUBwEmitGhjt1cl1coqoZCeGqijrxNPyPxJzzPh1ScqV+vHTd7UKQCcClK+YDMX5S5+89QClzrn1zo2yHdP4SFe1cZ+uHwVOP99afb5g/R1FyS7oZHm4WreZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S8tny/a/4V2hX8uuurQ/OqmYENuTOV+78SM7/LhEYw=;
 b=oRPUIYX+IxAo8+Ua0eGh1nn18CH4j80PCfm48amZ7OdLaG6Cm3a0ywmWAHdIIYA4VcD0pJiXTohNllXbpiz+soR/NVrMxuMjecmCt1MBYu1d9Y/qF2FjKn4tvSHk7qWn/TbEvQM9GwD0BOR+2FQZXJi75r9RfMemrA2wBg0uKCuJtfHExdCTp0bucNMy+X55N7isS7zvOLHZFq3Ns+PtHvSIGCodJQCeKbazLuM0Aj4uDvd5N7trA0lzLr1vhkuyfzgNjyzhVqBfslWJ8KGcwB/K5jv6DKqivzURWn0QxI5NnY3tI0O32jeMZXUjF0PASpCvLviat+zqJ4cU5lys5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7S8tny/a/4V2hX8uuurQ/OqmYENuTOV+78SM7/LhEYw=;
 b=RNQEUG+zLZ39G9/UDrR0GiT1XQylsjcm5BiWEEP4JJxiqFimgaEkHUNzX7+Ryl5zbBEL1/2VFvPlJlw1EtPwO9O+4mr679caFQOb1IPtxRxHpVBu5TnLuR71ZrKe1asK4ZU5INTbsq9N31r8isjGuHN9SpiqlwfHCM7iHjvUMwY=
Message-ID: <4156c05a-3089-4d9e-a4ed-b99636ce0053@citrix.com>
Date: Tue, 23 Jun 2026 18:24:52 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/4] x86/kexec: Disable FRED earlier in kexec_reloc()
To: Jan Beulich <jbeulich@suse.com>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
 <20260319122549.922724-5-andrew.cooper3@citrix.com>
 <bcade1d0-4ab0-454c-9f2e-d7b407bbb230@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bcade1d0-4ab0-454c-9f2e-d7b407bbb230@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DSWPR03MB989167:EE_
X-MS-Office365-Filtering-Correlation-Id: d36ca3a1-f8c7-4408-e583-08ded14c580b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	G1j/bEYzgZTJvb2k0TNiNoHOb5xjRyjDcc78ofK5fCd3tp1aMoNuWVgIxBH69CjIktX02lM/ONTpITUtByUPwuSawq39X21k+zR+hbvqqyuuUJnhu5q9Hii/hGn//tyR7+cDrovMOsKtgHk6e3M6CXojfRvVE8OelHhcwASjwFSJuE+MUc8DFz5Hc4cKDPQDHJlZEVffGMlB0U0YDOBCCE7/beWSbScE8m0fQ1j1hJm+DRpLvHpmkuCkjxmkW72tKTld0Y+Qy9Y0ouKOxIlgG64WqKPNIKqWp4rG0OmwKF9METCkO7Q/AMOB/648AW43F+csyhp/S/gXLgwd3tUTkGg6GXHZys1fr/VN+dMwCqVDydhl1XKJriMmxu/5dSbyVr5eiC5MoofNmKz+abcdIs98/NrAqh9JcN5czvydBoBn5CX8yuIeyeaT3sbtyetdUMxjaGc9lUUbYitsANFxgPxjsU0uNKJUyzMFW/y989d/1ddCWb4x3RaXsrfn5LzJNyHsOlD85OUEDvUpzrE2wGGDUqbwxpPpW81XQ212Qw1Uhu182BbyPUadN0yly0l/Oa7K3dISrQ7BiZy1T0YeBDszMLVXJiQm+956mCtub/ZPmm/wO/LR87a37CzDnCroAUZmc31Ll0ScpXEHX1+U8q/hnLAOt3gYTlyoPdq3vk8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEpyTjFxNjBFM0xFMzhjSC92ejJ1emV5OXdGbjB2b1UvcXRGYjlkdVloajYz?=
 =?utf-8?B?aU9IT240WmYyZXF4QTdWQmFpT2drWTltTmU3TTB2QjJIbVBIM1FOMzZweUkv?=
 =?utf-8?B?dm9WWnR3YmRpVFhhSlZWV2tycS9QLysxK1pRcGhDNHo1elVEL3hEZnBRZ0RR?=
 =?utf-8?B?VG12cUMzWm9lVmt3N2NUSjFDLzNRMThzWWlsUW83ZUc3dTVaYnV4Y2FrZTk4?=
 =?utf-8?B?L1BPcXZMR0JRd0pYYWRDcUpXT1p0d2s4SzdnTCtGazdlVVllUjJZcS9scUc5?=
 =?utf-8?B?dDJWbWNWSTdwY0hDTUxwMWRIQW5QUXhvSVpiYXhnaEwyYTgwdnFjY1ZaRE45?=
 =?utf-8?B?TTQ0YjJyTWFqbDBnbkpZNXBFdndsKzVYQzlEdHA3MzkxeXZQWFU3RklPQTZ4?=
 =?utf-8?B?UTFQZ3NUeElNVHdTM080N281RHJrclFPcjFiTmF3dFgvQ0R5enIwd1ZOWHRI?=
 =?utf-8?B?OHBsTFFMU2tMQnpqWGJBTDdJaFNnbXFGVDkvZGsxZjlHdFoxU0p2QkR6VHRG?=
 =?utf-8?B?bjcwVkp6QkpLUExQZjBtNWFrcFlvYkRvS2xJN1dIeU9QUXl2RG90UEtBUE10?=
 =?utf-8?B?OWtNVW9HNEp0a0M0ZkFUdzN1a1JNR0pZVkIvYkwxUDZRd2dkaE5mQ0taNG14?=
 =?utf-8?B?NXROdkJsaUg3NTl2Y2dpb0g0blpBZ1E5aFJEVlpiUWFhNXAvaHRYb20zc0I5?=
 =?utf-8?B?ZXFuK3lqbm5HWmVVSGQrbkxRUEljTFhoY1lrRXpLQmFqQXdobUpUMXJ2dHNQ?=
 =?utf-8?B?aFhmcGN5U3Q3SmhOZXRsU2FySFovR1FtYWF6dUQ4ZkNpaVlYWHJaczNhdGQw?=
 =?utf-8?B?QWJodSsxN25tUUd6eW1jYTR2QmdYMXI2T3lrb3JGak4rTXg0NEI3MEl0UUlT?=
 =?utf-8?B?eVpUNnQxQWM4dUpPM3ZoNjdIMysrdElGbkF1Qll5RmVyTFN6Tnpxd1VHWWtj?=
 =?utf-8?B?Tk41K0h1bzRGaGgzN2tVZzc4Z2MzSmJ2T05hTVZlYTYrOUJiUTQySjI1dGsy?=
 =?utf-8?B?bFpiYWYxWCswd1Q4bEhtNUFJSnJONC81b2hpbUhmbjJ0akdiVUlPVW42dXcw?=
 =?utf-8?B?eTJjNnVja1FjUW95OWhHMWE5MTUwY0VQcHhORlhPckxFbTB1V2lEZ3FsaXZI?=
 =?utf-8?B?SitnTzZOUWxwMXVjWWNDT1E5eGd4VVh0dDZaaU5xMTNRTytnczByQTQ1R3pn?=
 =?utf-8?B?VzJmcy83b2lpMGpYWk4rSlBqSm04NlB1TzAxbFp2SU5XeVFHZFpIMjRGRVBJ?=
 =?utf-8?B?aFVQZ0twNE5BRXZaV0tNSnRuVHA2WHFiaTh5czB4L0t2Vit4OTM3MExwTnFT?=
 =?utf-8?B?dDJxR0RnT3BwNnRaUEs1OGhlQzZ2TGNFL2FveEQ2eEF1cmhNUkRBbmxSb3Nr?=
 =?utf-8?B?MkdsUzNjNmdrTm5rTm1sVDdnMEQyam01bitvQ0YwVFh5bkVJeHJacG5wSy9W?=
 =?utf-8?B?Y2dROGUrYXBTZkp1YjFqMHpIdmVqU3JYdzZSTnhnT1E1cVN3d2lZSTJDYU4w?=
 =?utf-8?B?L3BybFY0SHh0TGpXSWE4Zy9ndVFHbXRpNjdkQ2kvTXV6Y3Q3ak54TmhHM3d5?=
 =?utf-8?B?NEpNWFVTekgvZWhJWEkrN1diMkU4bE5NRjByMkJCU0J0enh6WWF6ZWNXeTlN?=
 =?utf-8?B?UFRuallwN3oxd2JycGcxYkFnMTZaZW5qRHkvRWozQnRuR3Y5UmRTVEdFc0lR?=
 =?utf-8?B?eHlWbnI2UVQ5UUorSW51ZEZHMFRvSzBsRXRWcUZSdEluSndNVG92Z1p6dHVs?=
 =?utf-8?B?NzVESUpRVCtFUzlkb3BKd1M5OVdrR2xCWC94RXNtVmdOV3RwQ1RDTUc5MTFq?=
 =?utf-8?B?cnY5cW5XVXE0dlB6cnVkeEpJcE1iMWQwT0VWQXRIcnRHL2RDcStzWEpNTDlH?=
 =?utf-8?B?MS9MQjdrRE1RNnZLelNhcE5vb0VKODRuSWErRHRwWUovSi90c0ZTdHJJVlUv?=
 =?utf-8?B?bFlXdE9SZC93eWJOSmNSZUtYRjZLOUFrWnBQSytzRFRWNEVWNGJZWGxFcnVJ?=
 =?utf-8?B?a2o1TVZ3Rk5ERW5ydmdkRFBBN0lTQnhuVFdyMjhpeFdHbGo0ZWJucVR4czFq?=
 =?utf-8?B?SnZqcXZkaVpEdDJBVXhiTFFIc0NJdUl3bk1zQStYTEJRMEJDaUl2MHFIQy9i?=
 =?utf-8?B?eko2WWtBWWJ6bWlWYk9aRThzSXJKbTVCZERiZ3RUU3dubG1OWjNJTmdlR2lt?=
 =?utf-8?B?bnVuUFR5b2JGd3o3MUQxRWZYVzd1SkdDZUFpWVllS2RrUTYvL1Z2Kzgvb2d0?=
 =?utf-8?B?N1V3Q0tFSFhRRHhkamliM0tDbzVZSGppd3IrdjRtaC9XOVpEUEtpUVluQ2Vu?=
 =?utf-8?B?dTQ2Rnc5OUlkWnRxT0dBelg1bXBKSVBaRDFFOGN5WEFnYzFFcHNJWkdCWXIx?=
 =?utf-8?Q?knwhVS0SKvKK4BGM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d36ca3a1-f8c7-4408-e583-08ded14c580b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:24:55.9913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WD64AgDlt8liZGqt4PNCaN0KLs6mTw7X8hxqARjPmOYsR7ImtqSs8mPL09AZlPgD9f7NgcLGkPiLufXXoP9AXT93tkrX3T9sQfjaCtqLM4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR03MB989167
X-purgate-ID: tlsNG-720697/1782235500-46E7F3F3-FD375269/0/0
X-purgate-type: clean
X-purgate-size: 1960
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 679D46B9078

On 24/03/2026 1:19 pm, Jan Beulich wrote:
> On 19.03.2026 13:25, Andrew Cooper wrote:
>> With FRED just as with IDT, it's unsafe to run the exception handlers after
>> switching stack.
>>
>> To remove this unsafe window, %cr4 needs clearing earlier.  In turn, we may
>> need to switch to PCID 0 earlier too in order to be able to clear CR4.PCIDE.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> The pagetable switch cannot easily be moved to be earlier, as that leaves a
>> period of time where FRED is enabled but all stack pointers point to
>> non-existent mappings.
> But the clearing of PCID could be moved earlier, I guess.

Yes but then it's even further away from it's directly-related logic.

>
>> --- a/xen/arch/x86/x86_64/kexec_reloc.S
>> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
>> @@ -54,6 +54,21 @@ FUNC(kexec_reloc, PAGE_SIZE)
>>          lidt    (%rsp)
>>          add     $10, %rsp
>>  
>> +        /* Move to PCID 0 if necessary, as a prerequisite to clearing CR4.PCIDE */
>> +        mov     %cr3, %rax
>> +        test    $0xfff, %eax
>> +        jz      1f
> This conditional looks not overly relevant on this path, and we'd get
> more consistent overall behavior ...
>
>> +        and     $~0xfff, %rax
>> +        mov     %rax, %cr3
> ... if the implied TLB flush would happen in all cases. (Of course the
> clearing of ...
>
>> +1:
>> +
>> +        /*
>> +         * Set CR4 to PAE only.  This may disable FRED, which must happen
>> +         * before switching off Xen's stack.
>> +         */
>> +        mov     $X86_CR4_PAE, %eax
>> +        mov     %rax, %cr4
> ... PCIDE will flush again anyway.)

Also PGE getting cleared.  There's also a full flush just out of context
lower when we switch off Xen's pagetables onto the identity pagetables.  

We don't need a 3rd unconditional flush.

~Andrew

