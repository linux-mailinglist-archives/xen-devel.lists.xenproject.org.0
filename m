Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLfuJ/KAwmlneQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:17:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12991308088
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260504.1553807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50hd-0006Cf-Oa; Tue, 24 Mar 2026 12:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260504.1553807; Tue, 24 Mar 2026 12:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50hd-0006B8-L1; Tue, 24 Mar 2026 12:17:45 +0000
Received: by outflank-mailman (input) for mailman id 1260504;
 Tue, 24 Mar 2026 12:17:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>)
 id 1w50hc-0006Ak-1I; Tue, 24 Mar 2026 12:17:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w50hZ-008qFY-O6; Tue, 24 Mar 2026 13:17:43 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c280e0-2eae-0a2a0a5409dd-0a2a4504e370-18
 for <multiple-recipients>; Tue, 24 Mar 2026 13:17:43 +0100
Received: from [40.107.200.22]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c280e5-c823-0a2a45040019-286bc8164016-3
 for <multiple-recipients>; Tue, 24 Mar 2026 13:17:42 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7876.namprd03.prod.outlook.com (2603:10b6:a03:5b7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:17:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:17:28 +0000
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
 b=SEFF6EiVhC1DVQyCkq3R+UcyMlepVpjRI0H4bBXUdBsQBnJaXaAFylhwpTQeWIQnvjsPlRVHNH5QoSXPnmV4E/gKovrGC7PacXi4IPIyDER63MU5QUS0WCJ+14J+w+5n3ayfQ8VjZm86VRr+9TtbSo2z1jd6lBcWU4N5FKHSdZ8arufnIRfdWAV/9vHnWTKPmlntyT7Y5kgxyIJYoIE3NC08kKJ+yEEbknrpN9i/YPQpv8v7GF5oUZnmdll9ggGFwIrjzVLhGKQ+yfoMJqWsIiSEObp3HSPHPOUdVj6nWOwZbZKq6AigaFUyQLTiUNEpcB0ExwPX+fdOT7vWItVB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7fFmcOHa9xrVsy3zFKKwj0AreCu1/WA3CgGLbcb7C4=;
 b=nzGfVhC1ikQmRvnIZRlOFNijZeMc05n0S7iBb4x+LY5ehsOGJXPMHCgzEhAcN4fMuETBuYbCHqw+BHbNQrEtDqBxQhXuAVhhFgy7p3hYRuobClvUlvEN0FkwQfOvcatFUAIeNf4wAZsd+fmOjxpIcmvy/7eEZJDV2ZQ+Kg69ZucWbA1DWcT1Y4R9MFbc9+HlLuMjUaUn/KUWxgtxAk4vaUoq+rOnJltaq9XZ+JX/HJcZEZlRIfgfa+aHxOcX6NPa42Zh5bUkkXnfRIo65cr56g3PWmq3J8Lq+ZqGOsY+FDAQA/qeW3mkiThdmAjpa9huqa1lmtUypQSOmb0S+/8UOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7fFmcOHa9xrVsy3zFKKwj0AreCu1/WA3CgGLbcb7C4=;
 b=iDhZNazq18VSRZSA6ymeXuMzhl0c6qeK8ed8WImCmNTvR6uiU9Q5A8yBVGEyPV7XpphNa6ZiXsTCdimJbVbzWzKafquzfcUgDGobdfnNkOtbAdOm+nxiijr5cDuIfuuQrWk9xBYEwhRV1LQ5DwYvuwUc4wxvoRu3T36QKShxt10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e07ab218-c15c-4844-9594-dd456860f83d@citrix.com>
Date: Tue, 24 Mar 2026 12:17:34 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-announce@lists.xen.org,
 xen-devel@lists.xen.org, xen-users@lists.xen.org,
 "Xen.org security team" <security-team-members@xen.org>
Subject: Re: [oss-security] Xen Security Advisory 482 v2 - Linux privcmd
 driver can circumvent kernel lockdown
To: Greg KH <greg@kroah.com>, oss-security@lists.openwall.com
References: <E1w50W0-00Bwo0-1i@xenbits.xenproject.org>
 <2026032453-departed-thrash-f153@gregkh>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <2026032453-departed-thrash-f153@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: add4df25-f564-4f2e-8303-08de899f50cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2yodM/wHZPp5oJZ9kIXMYuK5wMbRopQkSntfz7ImwLBSskgT61h+3nbPzkhDjN0fxJtlDT1lYrjtTurAfI0HGKJpKYlXoLEXTXiSME6hYdl/hOlpUA+1xjErINzly5nxlTyHV2d+RkTbx24txe7emgpOiILkPbNOeRqO22M9WScV855/9MhE4CCDqjdaHZ9MaMgub7GwGGvjjDU99cfVUAY2Cu51VB1zt9O8zADLxAuuc2eZWQS1QRViwDnY0wKDH77mv0F9qxmK3rHtj6lNzDwIhtkS9NI83KESxdiyyXja7+h0K7fYwqo9wNw05Akur/IWn7eEVF6Aq8Kr/qv47lat1Cjeg2eyxncmPvryTbr77vr+k4BSvw4tOKFchfkCIctPMrEgsNkSojmOX05TGqZVrluF/s8HSRMxMqBRabLAeDJhlDA709cZ2bsgWjM+E5j2XUyMlkb0Zb4i66C5wxedvEF4Mh7LUnKQXvdEDJyutPucNHuZ+p7zNt0J6xqtgGFkuuOMSfAIX+MTONMAseZ1BobrBhQ1k4ozr+j+qyc5AO9yXjavE0fX9d07lPVAN7ox+Qb6sEtKlyOhBYndOoU5FStuhGJQQy9z1NgPej8Tuhm7bPZZfE4mSUPv8r1FRMlxx4eeQkDrWgo9COIjl8eYvBl+EGO+rYGnEFD2XGdDFKvpeoei5ceEDkQvmR4O3CSeSGnvboLB+pSEMdM3vNwW+krbG2uocZnGiZqKtmw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDl5Rkl5Mkw1a0V1bENZWDNjcUtuMDJZZVptemtWSWVIUlB2VTF1OEdkaHNx?=
 =?utf-8?B?UHRyQVR5TXpGdTBrQkZmMjBOVW42eml4NGJQekJNUFhkcTBuUjRtblUxbmNT?=
 =?utf-8?B?N2NoRXBlaTdnN2RHR20zT2dIZzFTRm80TlJUUTdjUU45ZzR2L0Z3RWN6Wlky?=
 =?utf-8?B?MlpjTVYwREFzeTJaYWVCbVJSZm1GVzdlNXM0S3MxWmhzWkJ5YXo2OE92MGVQ?=
 =?utf-8?B?VHl2SUxVeWxFd2VvMUM2eDMvTkR0Y3BpMlB0VVgreEU5K2xrRDdCd0FBTlZm?=
 =?utf-8?B?ZUMvTVYwcGFMSmUzamZIaW5VK1BPeDhpN0xPZmpwRVRGRmtGeDNnSStMbXJN?=
 =?utf-8?B?TlZqWThqRzUyMEFHM3A4eDRmMVVQMDJpbGFvd2NwN05BeDJOVmxneGJ3QVBK?=
 =?utf-8?B?dUZoWTJwdWNDRGdKM003Uy9TeGxPejZZRWNMeGkwNy9jc3BVL1N0eHpOWnJV?=
 =?utf-8?B?WDlOaW5CYlArb0R0SXNUOVFPV3FJbWpkY0MyTGZtWXdJcG9qMXYzOHdESFZz?=
 =?utf-8?B?WUQvNWRxalBrd1owL085UkVaS2taTjQvRC81SGRleFIrZytOVDdqNlRpalJx?=
 =?utf-8?B?UURvdjIvdCtId2MvdHMxakVPWE10ZUhKVjVYeXpCbE05VEhmdmE2MWdkR1Rq?=
 =?utf-8?B?RExrZExuYXpqTjBqcDkrNTRtZ21WQms2L3N3cTB0UVJYcUhBWGs5Qlhod2NZ?=
 =?utf-8?B?T2RDY2xVdGY1OWpDSDI5S21rSTdwaHdFVWVMUGlodVVUeWNUcVdtcTVFRUQ0?=
 =?utf-8?B?ZS9vdmZlTVNWOVEvbmZBU1RDYjhCdFF4b1pOVFUvNFdTcDd4R1NPdE1kendL?=
 =?utf-8?B?OEFIYjBKdDZteHZQS3FHNGZHY09YWTJaNVc4MmF5UWZWMUJjMkU5cDJ6cXBl?=
 =?utf-8?B?eUp3VFlyb3h1WTBxOVZrS2ZoZUltaUFWa0JtNmoyY2VkMVVUTkJKYXk2cGlO?=
 =?utf-8?B?TXBDUjJiblFiUXhGcFpvVXVHN09WU2NmaHo0azJvbmJIVjF2cW9aeGFaS3c5?=
 =?utf-8?B?UXRwVXR3bXJ6MFE2aHZqRHdaeG16eXYvNVEvZzgvSDBKcFIzb3gza0tOMWJQ?=
 =?utf-8?B?REUzZC9CRHpyNkpFZ0Q0YURudjltMGhLMWsrTlR5bWVTZXBYQ3hCam5MQlFl?=
 =?utf-8?B?cldIcTVYa2JWQXdPRnZvVS9SYkZuMnBCeHYyWExDb2ZvSkw5b0kwR29EK3NB?=
 =?utf-8?B?U2RJYmFDN21NVXh5eGlxRURGaUNyajdjWDlTSzBiQ25kRFM5dGhOcWJUOHEx?=
 =?utf-8?B?UnFBK0NscmZOYzBod05yR21EY2prS01OWVdVNENnQjNvcHJuRmR6WkhuazFv?=
 =?utf-8?B?OGxUSUZHRFErUkY3WmVHVHB5R2VTcDZ6WWdySUcvcG9YcTdQa0lNYnhqNEpZ?=
 =?utf-8?B?bnAxNVQ4QmxnRUtMNVVmZCsyZEpVZUExN0lFQk5NRERCLzgySjMxUGJzUHpW?=
 =?utf-8?B?Rk5mN1JDY3RYdTBkM1lsWnYwZWE0bnZsa1MreXZsT3k0bWpNWmdxRHp3T0hR?=
 =?utf-8?B?WXlNNnBMRTh5Y3NvVHgvZzFsaVFaa0N3SEJiMUpjWEZDSGwwU0tGeWxCeWtH?=
 =?utf-8?B?aDdkeSt4T2tRUjNzT0ZqWW1WbXpzVW0rU0pPb00xc1hJVkRHT0NrbUhseHBw?=
 =?utf-8?B?WjRPWndrZm00VjhQdVZXaGxjSU9TeC9EY1NoWkFETXpqUVJJd0Q4V2NrckEy?=
 =?utf-8?B?V1ZkUUhNd2xtbkowc2NUMlVEMHRQNjk1dVZjMm9IUzB3WmExOFB2ajE5MXdT?=
 =?utf-8?B?SURtL0ErMGloS2xpTnprdUtpK28wVk9PYjdDZkt1YndUVnVDUDQ1L25OUDV5?=
 =?utf-8?B?dnFCUG8wd1hKcmpaVG9VaXRWcWMyeDhpb0p4aTVaZlJIOVNpRnJReURPWG9X?=
 =?utf-8?B?VmRwSlR1S1dWZjVHS0xmMnNOZ1R2emV1aFF6a2RBRFNVeGQzUXo5bUlURVlZ?=
 =?utf-8?B?T3NYSngwcmpmeER0MWs3Y0ozSzdrNEN1WE9rWk4xWEpCckd6YmNpazZONkFS?=
 =?utf-8?B?RzQvTnBNLzJXY1BPVGtwTzFVUTdESXljejlJdk5vRk1UZC9ITzRnYVFyODE4?=
 =?utf-8?B?SURES1VhaWdmMGorb3hmR1BML1ZIWlVuWFZlc1k0aXJlR0JnN3ZyanhEYm1j?=
 =?utf-8?B?THRFbTYwOTE2NENtOEd2Zjdld0pDVDl5a1ZMU0Vpa3d3UXlPejQxcnhyUlNH?=
 =?utf-8?B?eUV2MjU0U05qSlZJaUpBUGQydGZaUFY4dFZlTjd4K0pUUHNXTjRGUWVIRXVh?=
 =?utf-8?B?N2JsdkZBamtyZFdQL1k5RTNYTy9TVjEzYitSbFM3eFYxYm5EVldrcDhNUXFF?=
 =?utf-8?B?ZjdrbVUybUlLS01EbzlWbERFTkhsUDhjMmp3OWk3UENvdnJvQUF4blJlLzdu?=
 =?utf-8?Q?WC1h69qyau7QsbHU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add4df25-f564-4f2e-8303-08de899f50cc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:17:28.2983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXubtVYsvU7CI6DzzV8RSsHRFeyHAyQvt8AGGVXifLgQchY3GPU6cpxipK3Jy1fP8g8/Eird+lo9tU4941MacBg0zqBk9ha6HuQ7utm71zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7876
X-purgate-ID: tlsNG-ebf023/1774354663-124769D1-F2F3666C/0/0
X-purgate-type: clean
X-purgate-size: 822
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:security-team-members@xen.org,m:greg@kroah.com,m:oss-security@lists.openwall.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 12991308088
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 12:16 pm, Greg KH wrote:
> On Tue, Mar 24, 2026 at 12:05:44PM +0000, Xen.org security team wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA256
>>
>>                     Xen Security Advisory XSA-482
>>                               version 2
>>
>>           Linux privcmd driver can circumvent kernel lockdown
>>
>> UPDATES IN VERSION 2
>> ====================
>>
>> Public release.
>>
>> ISSUE DESCRIPTION
>> =================
>>
>> The Linux kernel's privcmd driver can be abused to circumvent kernel
>> lockdown (secure boot), e.g. by modifying page tables to enable user
>> mode to modify kernel memory.
>>
>> The CNA covering Linux has refused to assign a CVE at this juncture.
> This is now assigned to CVE-2026-31788

Thankyou.  I'll send out an update.

~Andrew

