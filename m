Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BtWFOXO6OmrMFAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 18:55:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D02AA6B8E78
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 18:55:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=dcgg9ABE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344449.1603505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc4Or-00019u-2J; Tue, 23 Jun 2026 16:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344449.1603505; Tue, 23 Jun 2026 16:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc4Oq-00017o-Vx; Tue, 23 Jun 2026 16:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1344449;
 Tue, 23 Jun 2026 16:54:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wc4Op-00017T-2J
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 16:54:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc4On-00F1q4-SJ
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 18:54:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a3aba2e-2eae-0a2a0a5409dd-0a2a450addfe-34
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 18:54:57 +0200
Received: from [52.101.62.69]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a3aba60-93a5-0a2a450a0019-34653e451d5a-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 18:54:57 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BLAPR03MB5618.namprd03.prod.outlook.com (2603:10b6:208:294::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 16:54:54 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 16:54:53 +0000
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
 b=ahUbhTmbSG9vwQzAMJVnWqStWE4shj8scQ1JV7mcxQBh5Vg31D+RuNPEDFy5TSKxtjuKfnZXuFDRb7ji/SB/bnenQdJKQi5ZYa1rZfn1JIBS2fRNlG5mNyQdGCv3EpGPv23IEh/ZJNmx28aDfIF3tLwnLydaOdkAZe7EF81cCCUl/0P9P1f1sZ/fQGPGeWQ/ivPyEASrWjpMBieacz2TRNZMZGuz9zZ4rX21UeFLZZv9q6EJS0WKp4mGNmVTIiiz49V4V10H4tQuiEh0oG6tEc6hM7nQ7U8IXkGh7jNbRdkSxdjJZtYXiDJpihCN0Ni5lv1WaKao/noZ3LMTEBleDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCFmhgDBSFNseXxGWUNG8RRJy3ShcGJmDU4FF9ODGnU=;
 b=Lv5xVZofpJ0JhHR4t6xffaDNsXojmI54l7PvrHkosItb2V9VNQM5vuKW09hGEcMWJZOrOCAlCnc2yIkmEKmwewhzQa8+pPkiTo9LJLrsC8MnPNrTMsSydaLprmpMt1SIc8bkfSAgsuQcnbnVGkiGmL0vxol0diwpCO3ubPehTIfGwNU7GF9QKBAQkGA6yR6ln7FZ2tk4ergObxz1B8eE0xlhI7GdSzI30qrQl8lywt8xK6AnbSjPplNcb9NW1OcsRBtCniWtv9lLhbPmIMHgYyOxP7J95iiris3RUVtZFF5uwRveLaMWo79HlKPetY7sc+q7MVojCUyhUInloW3q4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCFmhgDBSFNseXxGWUNG8RRJy3ShcGJmDU4FF9ODGnU=;
 b=dcgg9ABEsg+p/Bquq63Ci5/qOU1LnX9Ma33MadtgxWNpf+aL0AQIpxJEbuB+u9k7PZmpyphaHFq5GmtWc+JluvEIkS9fT1j695heemNJp53GwOKrE3EldtO2I6Mf2WJONI8Y4qeN8TRZApJt+MK+vOip1m+ljqRt+4Owv5/1V5M=
Message-ID: <a031ba94-7bc8-4b4b-84b7-bb294dda44e9@citrix.com>
Date: Tue, 23 Jun 2026 17:54:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86/kexec: add digest checks
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Kevin Lampis <kevin.lampis@citrix.com>
Cc: roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
 <20260622151833.3397692-2-kevin.lampis@citrix.com>
 <b7bfcd3f-acad-4637-a391-32cc9bd71a38@suse.com>
 <5176cb78-4445-4c94-a76c-fd08c1417211@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <5176cb78-4445-4c94-a76c-fd08c1417211@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::10) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BLAPR03MB5618:EE_
X-MS-Office365-Filtering-Correlation-Id: 869f9de5-9102-4cb2-a441-08ded14825c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	4lthfEfw/em/zs/AZKYbCiJMbKOSI5pm2esMSQ5R7dUkKUxd3ZvAqg5chimBtykaujRElKk0XwzPZjKkwjPOnmTj677Y0qrysO3DweqfALEcOYWgMTktlzusVl5M7MIjj/YfQAoXdHqaqi6Jpj9vVjGWCGOsQdB/WYjaNkPEsty1LpUf1qbTFYmban1Jibv1YN5VzYu+aAbgQ4FjNik8U5LOozg7ma0/Fy/3g7Nj8x1+tze5k1xJ74yBMWGnzt0x6CZQf970G+4/EVmM2ZgsjVHV+G5VQWG+iNyI2bvBoBbPRdpn+otIHN8YcJBmX0bhmbQe6pU4qvTvrtlBywJ6VB5XGMsCRkLCB9Q3Yj4AiA4ArauVqIDu0B7+LZxuFh1fLNQeV1lINH6wySLtcZDgGDmUa0Q3WNFqEghv5uRJFkWN+4q0rrEEHqTiTVoYrf3N8bw7kuqoAh3MuqjEYQnr3ftYtiyJdj4zDSJkjsEY/uzeZyy/w4i2qdTV0RyAiSSOzZLZLXw9vciRiCI+I2iEmqNYFb3DljRJk+XAjFEed8U0+ieajdKHwYy2LY0j2aMTQ/jbsgrFM4QrWwtP5yXas1duA5oIeje/2jUj5eP5z6+Bew8vkbThaLT7O8QR0q38gfyFYP/Nv0B+5oVsXmLcOqEAXxfQZxuvX/KqtOGAKq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkxpaTYwc1JPb2FqTDcrdHZVYUNtZmFPbmE4d3R3OGliSmdqYVRjNzlBTGNn?=
 =?utf-8?B?M25XQWlhWWZObEFnZ1VDOVl4SjF2dGVZNWFjandvSGJ2bGMvSGFzSHNqUEs2?=
 =?utf-8?B?bEtySTFrMEtxa1RFS3BKaXlxN09TUDVjNzF3cDBxek1UZ2xHTmRYS0lCbnVu?=
 =?utf-8?B?T2haWHJOUWkzeTB5cXh5ZzRraW1wWG5sWkdoUElaTmZaSlRnd0U2cXc5c2R4?=
 =?utf-8?B?ZjBjUVE1amtsNGUvUStmKzdNS3hsL0pxVGhHTXk0OHRIMm80ZW53cjZIblZY?=
 =?utf-8?B?alJkRHNGblZQamwwVHpnTWloQTVWc1hZUzZhOC9yZE5zUUplS0p5RGtING1w?=
 =?utf-8?B?UmRrT09PeENsR3JnZk93RDJlaFRKS1o0RWZjNTJ6bEpwSGpLUEtRdll2Vmhr?=
 =?utf-8?B?eWRscDFna2dBTlFBZWVWZkltSlNFT3NVSmJvWW9SeTBiS3RGZnJBYkxiRVg1?=
 =?utf-8?B?NHpTb0JTcHF0eHFRclh2LzgrSit3akZtL3R6TnZCTUlIdHlKa1d1RUxOUmor?=
 =?utf-8?B?Sk4wTTFCNHRwemFOUmlIQlNjeEp1MXE1Y01TeGZVMkRmTlpjN1dJUlU5b0RI?=
 =?utf-8?B?MGRCSXlYYmlCTDNVZXBrMVFrRVlHQTBpcTVxQnZLVVNSRkJNeS8zZEZ3VVFB?=
 =?utf-8?B?QjN1VUovbHVlSzRob1ZGVFhMVTRoZUdOMVhUV0VUanhzZ05xNi8yTlZoY2Rs?=
 =?utf-8?B?bGFuMUVIdkdyNnZBN0kzaGVsbE9uSGkwcVMvR0VPNGIvZDROSUxmU0NySlFY?=
 =?utf-8?B?NktnZjUvNXovVmErREJtNGFVWVZDczJFSWdoSWVXdzduMSthN05oS0lhTWNW?=
 =?utf-8?B?ZkdoQkFhUUVEOVEzdkJMaXhYMlJYcHlLR0ZGa3lNNmhzN1hkb3pBTmdOOW1r?=
 =?utf-8?B?SHhXQjBkaUdXNThzR0gvWHdRT1F5cU1BbE1mNkRLSzBPR2dLcUtiSXJjMEhB?=
 =?utf-8?B?RHQrZnFhRUNUK2t6TmF0L05HWk5rZ25xY1JXQkNiK0cvWFA2dkVZZTBydlJE?=
 =?utf-8?B?eFl1cXREM0JWaW9lMXZWYk5iYUdibndiQlFaRUtlanR6azZDSFRLeU1QQ1Zj?=
 =?utf-8?B?cUZKMVRYVmYrOWw0SU9EU2IzUVlEb0F4ck9hUEhkK3RqbW05WHBoMzkzTDJF?=
 =?utf-8?B?ZGpsbExKZFBOczN0eDZVZGt6YTd5OVg3MDFwNjdFQXBRZHdZcGFwMWNCRmZj?=
 =?utf-8?B?aVRJUGZwRUpqOWdxR1FIa05LT1VZcVhCWWJTZy9oS3VLTDVzQXIraGNOL0Uy?=
 =?utf-8?B?bVE2OVNFTjBma0NhckpVOUg5b25NYXVsSjV1WkJyVVZGaG5MUjl4VjVoUXhx?=
 =?utf-8?B?YTk2MTR5OWNtL2M4OEg2ckJPb0d3aFo0bkRtci9wT2pzQUpVcEZBcW5HMDBN?=
 =?utf-8?B?Q0xvSXVMN0ppSlU4MWROc3BpaG5RMy8vWnl0MjBXOWE1VWJZdjZJSTJpbmtW?=
 =?utf-8?B?VVpSTFlmZFVPNlcvQ2szUUxDcHladlRmbFpaOHhLcXU5cWtwRjUvbENaa1ht?=
 =?utf-8?B?anhYU20wU0dxa3JleVJTM21CQnhnS2x0WnNHOEpqMnJ5Zkg1S3kxWHBYUENT?=
 =?utf-8?B?bmJWN0RvWFZnTnhydFRKd25YZWtqV2dNVXQ2cEQybzJGcitWUnBYTWhaZFhs?=
 =?utf-8?B?b3ZtQjVyVi9kQytWU1oyTlNPRXlrNVlRTWlhRmZBYmswOFlHSU16Uy9KRlBl?=
 =?utf-8?B?bEJqUlprVUpteUNjZ2d3eWNXL0M2enNtRDhrdlFqbWVqNjVBQVRUYytKWTFN?=
 =?utf-8?B?Y0hBYy9yS2l5RndHUlhsbVdKWjRUM0dxRnRPdC9aUk82djN4bXIzOXBFd2Fl?=
 =?utf-8?B?Vm80ZnNKM2w1Ulc5cS9YRVFzNXhhc0JwMXRuOEV1aGdvSnd1RjB4MVNKa0VB?=
 =?utf-8?B?YTZ6dEcwNUYwSzVBZ1VoUXY5N1ViTmpMRUdZeDJCOXhRNDhQS0t2dTBZMDZO?=
 =?utf-8?B?NVdxVjMxdTVPNzhWUjlqeStGVmgvMmlpMmw0NDM3RGJhOVZZQi96THM3ZkVv?=
 =?utf-8?B?c3BsNGpSeDU4Y0x5ZVN4WXBWeGJzbjRUWUppN2M3eEN1aHJZVnFTTE1RME1B?=
 =?utf-8?B?eEFoOG55SEYvQkh2RHFpM1AxRTlDdlQydkhKKzViUndlYzVKMjRkOHBQOHVq?=
 =?utf-8?B?OEFGTm1FQnNML01jR01KcXFLbGwvbXA4SkQ2TWFaM2gyQWhlak5qU1JQNFR0?=
 =?utf-8?B?REI0S0xocEJ3UnQvN3pNaXlFVkNqTHRFam5ZQm03Vk9sWmhsTVRRdFczQnd2?=
 =?utf-8?B?ZngzcU5HQktCRlBZbHRLSHo1MytWRzhPNDFkR25OZlNHaVplQjRoNXk4cmp3?=
 =?utf-8?B?MzhnTGpwNlgzZmExdmhYTkZ0UEsxeUdKTmtFekRyZDZvQnVBVjFxMi9sa2l3?=
 =?utf-8?Q?RuLr5qYLhZiNdpDY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869f9de5-9102-4cb2-a441-08ded14825c7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 16:54:53.6603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJt2rgcVvkvip22dSnIjgw+64x6gVOOcaSAJXQ46eCbOh9WGliosL1QLCqQgR/IqOdl7TIFI1qxVoYBKF/m6t9BD1kQTZCwkL4QkSstLNwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5618
X-purgate-ID: tlsNG-4011c0/1782233697-B13FFDB8-D8A86565/0/0
X-purgate-type: clean
X-purgate-size: 1831
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:kevin.lampis@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D02AA6B8E78

On 6/23/26 5:08 PM, Andrew Cooper wrote:
> On 23/06/2026 3:44 pm, Jan Beulich wrote:
>> On 22.06.2026 17:18, Kevin Lampis wrote:
>>> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>>>
>>> To support UEFI Secure Boot we must check that the kexec data has not
>>> changed between signature verification and actual execution.
>>> However, this is also a good check to perform generally.
>>>
>>> During kexec load, calculate a digest over all the kexec segments. This
>>> digest is stored and verified again later prior to entering the image.
>>>
>>> For now, only kexec crash images are supported.
>>>
>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
>> I guess I'm not quite following here. For secure boot purposes, shouldn't
>> the new kernel already come with a digest (or really with a signature),
>> which we could check in both kexec_load() and kexec_crash()? If we check
>> against a digest we calculated ourselves, we'd apply more trust than we
>> should.
> 
> There are two problems.
> 
> One is plain TOCTOU.  We load the crash kernel at boot, and we jump to
> it in the case that something has fatally-but-not-catastrophically gone
> wrong.  Really, the digest here is an integrity check.
> 
> One is that Xen cannot perform the signature check on the passed
> kernel.  At least, not without gaining a full X.509 stack and
> authenticode algorithm, or a PGP implementation or equivalent.
> ExitBootServices() nukes SHIM_LOCK/LOADER protocols so they cannot be
> used later in runtime.
> 

FWIW at one point Shim did have the option to keep the SHIM_LOCK
protocol after ExitBootServices(). We tried to use it but it was buggy
and didn't work and was then removed when the new LOADER protocol came
in.

Ross


