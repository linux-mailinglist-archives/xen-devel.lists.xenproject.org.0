Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNNvK3Gv62mRQQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 19:59:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172234622CB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 19:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293879.1571295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGKn2-0008Ps-6T; Fri, 24 Apr 2026 17:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293879.1571295; Fri, 24 Apr 2026 17:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGKn2-0008Mt-3E; Fri, 24 Apr 2026 17:58:08 +0000
Received: by outflank-mailman (input) for mailman id 1293879;
 Fri, 24 Apr 2026 17:58:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGKn0-0008Mn-4L
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 17:58:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGKmy-001K0f-7q
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 19:58:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ebaf1a-2eae-0a2a0a5409dd-0a2a4508a574-14
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 19:58:04 +0200
Received: from [52.101.43.71]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ebaf2a-63b5-0a2a45080019-34652b4737f8-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 19:58:03 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV9PR03MB8365.namprd03.prod.outlook.com (2603:10b6:408:368::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 17:57:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 17:57:58 +0000
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
 b=hjWntA7rXfkbIK0NyrVM5s2KM1yaYOcuizPSrr0g6ZBAhPBbDCCzQfghcKVPMyqWKe0+wqrrEjDL/nYBRyYYYhIEa6492jaxjY6Mpgt2QrncIV8ezhjQvuNSKFx3jnH5Ty/qAISJY7o5HWZY92vFAk8PSCEngHhPzo/VDAsYiWG4f5JQLw9Lc5IIFeyvmt9dceuGqVwrDHDM9VRoMIDCmO/sewhLCTI9wBF6CNYYSGVje7RucQUd/Fxx50glZ4RlKl5AXaH4uBx6ewTeYZg/vSphDoxxzl0J98QRDuCh68LgeAjYVBym4A6w67iQjs+ZRGDlee7JDR7wPf0p43Kzqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFayKm8Vk04dKCwrgehM7YqZU9NlVGet3/nd6EQL1ls=;
 b=mPwD9qdReaUKlwIJw0duwu7Rrfvhw4zHG8Rn2vFdxxhY046/q9K6FTv+j/yFsF/XRSKSA5j5qN1Ke9NBcc7n8Aktyp1j66RFbaxX5/B4ZqQHiWvO0UwIpuAAja2dnEx1zNM+XJBfb+ZFCDDaUcqSciwTQ5GAZEt4KFwbGY2asFB2+krGxZGzPSSqfIIWRfC7LFKTNNgHlyEUwRUPXzwFYdG20VfKf7BYjwLUodaj3BDMwJt0sHJ9haxwaMULR8JhAYd+I+8xCR3L7eblPivwEYeye6/L+ADmcsJtV7vtnHMtKWy9JixoMoRnyEPOWuDAUhcXfnXdQSeH8A+xdzfbKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFayKm8Vk04dKCwrgehM7YqZU9NlVGet3/nd6EQL1ls=;
 b=DL3YZn9LYez9VAldJ7iwuiGdko5Hy/YoQ9Inp5w/8p6m0i1eTYvjF6xqEUvgcAo1EQfvf/PMDDe2yqw9etGFVri6VYHsxI4X2nk4mkRlnVnD1IsIRwYXWT+jqW2vCHFymCTVCxv9WIgmcVVp++OU5vjLpjoXdLNd+O72pqD2BvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 19:57:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/9] x86/mwait-idle: drop const from struct cpuidle_state
 arrays
Message-ID: <aeuvI_ojCxA9BR36@macbook.local>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <5516d0a1-8fac-48ff-bbe1-85726b730e94@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5516d0a1-8fac-48ff-bbe1-85726b730e94@suse.com>
X-ClientProxiedBy: MR1P264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV9PR03MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 2424725a-4f69-4024-e91e-08dea22b051f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zaQi66kR3g46C0+7jjf27wI+hRdhAraU3eliQzpB4iKHpVvIJXFqickUpZ6gHMMH2r4AIR623fdGF0ntRzbg8iqgTz59xmMX7+8wWlwxrGeV/gJZr55B8XT8eqhV/LAfkV9cBdpr3EjZp8Mel8OxE51JpEsFqymmNihQ5tth8PVIFOwkQzIqPnZDrLeI/Rik7uUmBIVt78nvCURb7wfm1awvF3ogAsh9MJW79j9SDSPv/8BtWAK7VuqzDZO31qYPuhBIMZ/iDPpq1i6krLQexM3aFrdmTwlggEaBEekGZI/DqOYtPXwPqhP790l5yEFy4Z4xQlvCh0mkWAn7QYyR/6pEVrTGlt6KTZlhWEVmKZELQsuZo9J148yE4svoRlP3C0oczJTU451dK/u+FgBK/kaBmB4CBUrQtjYR/Kxny/MhH4zayz6ULqDYEn9EHhD1W/qUlnr9jzyz4xCS+J13IOaxGUQnhg0YBDPhYST2jhsPuWHp9RKEzPphNFFI+xdt4QDX+cniZamUw+JvY1PM6EEfJP1llYuDBkLcztvJDNf8rDxPgAxrkuF9zkW0mytb+9mm9tXoTpsyEPnDripcjoxU3LlsicTITtPgWZ4gCe0CqccAq3HGzDg09+JCnF82MHJhaj5WPWT4i7Qfq8+Ih0+Ut/u9yqsEpwDLL6qiiNqvaoCMiwS3nG1IKeB4q6V5IMwNlx9a8r6A2GvZYJu6axUTQT9Mp9KldGuXzUxEkto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlRXd3Z0SXY0U3ExeU4xTmFhbnVGd2pscjc2emRGdTBURnpMZXZzNG94cnd4?=
 =?utf-8?B?UEhuNUVQSCt2UEhvYnpBZmFic2Q4cTF4ay9WcnRRd2ZJdWNhQVhrS0xHbUx2?=
 =?utf-8?B?UW1xOXJMQzZxTGNBdFNuK09VSEJnT3V3d2lYRHRFcU50SlJoVzNZUFlvRXVQ?=
 =?utf-8?B?d3B3bEhsV1JWQkwzWStDaUVqOXE5b2Q0Q1pYakc2TW5relkvUWx1enNiSDRj?=
 =?utf-8?B?a052M3hEMTQvd2xyeUlRUnplSDV0N01pRlFGa2lOMW4zc3hMM3JQRnlReTJW?=
 =?utf-8?B?ZnRVR2U5ZUk3UXVRS0NHYTRXRHMzY2NLOE1YMnJZdHhUVm1MMjVKYWpkbzl4?=
 =?utf-8?B?M3NHNjB1b0xNNEkvYkk2aGpIV0RIN3l4Y20wa1ZJWWg5MGJFWXBhNW1SNGp6?=
 =?utf-8?B?b1lYNkM1NXF2SkF1cGJOT3RkamxINVorRTZFNEZOWmd2SE9mV0RVcEJ3NThx?=
 =?utf-8?B?ZWo1WjdBNWljSXFrR29JU2QycGRheEY1b0pEVmxZRXNZSVlzYngvcGo4MmMw?=
 =?utf-8?B?YzJBQmZLOG5IeVJOSmVhT2FRNjR1cnRVdGtMMnhxeXU2V29va294UUt0OXNp?=
 =?utf-8?B?QzJUVXlpNlFwVGFXM1pKRUJzL051ZmNPTktpTis5aG1WQXJRek9wd1l3SEpz?=
 =?utf-8?B?YU5vejFGMWtrUXlLY0dpZThvS25xWEFNQkpjRjhGdWxUWXBscTA3RytiNWUz?=
 =?utf-8?B?Vk9zUk12T3N4dVdyVm1xSnZSVWp0QTZpNXRxZlYxRlJjUk9DVzhLaFk3L1JB?=
 =?utf-8?B?Y0IwZkFsdFU2UHlHMEgxQ1hVajdCNjNLMWhyZStueE9rWmZ6MmJSa3R0TnVU?=
 =?utf-8?B?S0JVWVNXeDh3aDRnNFc3T1pYRUNnNGZiTS9xUUxJZy9rVzNORUt5bElrYVJQ?=
 =?utf-8?B?dWhWUldIZzUzcFgyTkNoUzFBNXJ0UFZDcFNpN3kxalN4QWplRmZmUVl0S0gx?=
 =?utf-8?B?YXFTcTdPZ09PZm01cFZyblROVDdCemRkSDc1bUk3RzNoeVI3V2I3RDZwN3Jr?=
 =?utf-8?B?czlTNUVMUmRndnhQREN4aDZrekZiMEJDQnR6cnEvZ2h6M2UrUjJLU1NHUTYr?=
 =?utf-8?B?dUhuTHFsTGVIRXJ6RW1scmsxbncyTFdLN29WeHJtNXhwUyt2d0R3S2pNS2VV?=
 =?utf-8?B?Y01xVVRQbXN6TnZhKzdOcnJ3TU9kRWw4VWNLZmg4Z0JIclVHb045dzZwL0wy?=
 =?utf-8?B?S1NiTlpsY3NHdjYzT2lpcWdEYlM4Z3FlQ21wSzBRTzU4UEt0dXY5V04ra1lv?=
 =?utf-8?B?MEl5K0p0K2ZXYlJwUUxtWkFwKythMHU3bFhsTXBwOWx2M283by9JdlhnOHNt?=
 =?utf-8?B?N3kxL3Y1eWRhUUI1SGFacWYrNTBaKzlpWDFKeGlCVjRyWGJlSVlKSTFHa1M0?=
 =?utf-8?B?Z3JOeEhpaDBmS3dEQnNDbkcwUnRwTEFNSGtjeXBqT3lOdWRSTmQ5UkxWZ3A0?=
 =?utf-8?B?Z09CV2FaUVZLNC81UndHY1k1Tzl6eUFsSXZmNTNVTDRvdlhWeWNBaCt3S3JS?=
 =?utf-8?B?S3NGS1FtY0YzMlM4WllrUUZlaVowZUFuMHhxMDMrc0pNc205V1VlamdIZ1dJ?=
 =?utf-8?B?WnBVSGFkNldmY2E0RkJpT0F0bS90SSt6Z1NLZmJSUy96anArck9LWDdTd25C?=
 =?utf-8?B?SlRuUkNNYUgxT2dYaHNlTFZaakxFeWxzVTNsTHVwUnZFRWN5N21DZi82cFBO?=
 =?utf-8?B?YW9ZYTRmZWlKUXIzKzcyU2FFcmUwcjZjL0wyYzY0akNVNmsyQlV2OFRXWE13?=
 =?utf-8?B?RnVyYXN2OXhYSzNTN2Q5Z2lFUUVFVGZWMWFET0tKR3o5MXlENVlrUkZWaGNS?=
 =?utf-8?B?U2d1Y1lFRitXZ2w1UFFWSGQyWnZ4dVo5T3hld3htVnp2amNGaDR6K3BiWExH?=
 =?utf-8?B?MWVUOVFZdEx1RWYxdzc3VFZFc3prN2t6RHNzS2w5YUVMS1laekF6Wlk3a01k?=
 =?utf-8?B?SjZmTHJYR1VqVXNBaXdSeVdyQnB4SzR3MEVFYTB2eGdBbTQ0cnE3YlhiN0tZ?=
 =?utf-8?B?dEQ4dFp1QmltWjFTU3l2RjN2KzBtQU5YMHhpdG1zTTdndzE1elh6WVRPbjdF?=
 =?utf-8?B?dHRFVnBBc1pkbU9zSzZVUG02Nzh1R2w2MTM5ajdocEg2amU1QTVKQ3JmVVRE?=
 =?utf-8?B?RjJIS2o0ZDVSRmxYRXQybzhNWnErK2VLZnhJdCsvR0hpeGpyeXZTUk81M0NC?=
 =?utf-8?B?TEhuM0t2ZitQVWp5Z3AvaVFIbk41S04xM2N2cDdQR014V0FWWmszNWx2ZzNk?=
 =?utf-8?B?VEY3VkV2VHN0TndzNU14QzJ4QUUrSTJwWm9VTUZsZUJZVDJjNkUydTFHQlRj?=
 =?utf-8?B?S0hYSm42SEgwc0l6cjdUSnZQVWRtZkxGclJvZFRjbkJNWUVEVU43QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2424725a-4f69-4024-e91e-08dea22b051f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 17:57:58.7773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9/39yH/hsTCQQdtoGv2ElszQ5/x51HVlLNvwEgHIKC512l1C+/1IiMhOFIdzIQG5asK3e+t3GC+bw//1SHS1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8365
X-purgate-ID: tlsNG-c1860d/1777053484-C1D6BDB1-2498B14F/0/0
X-purgate-type: clean
X-purgate-size: 483
X-Rspamd-Queue-Id: 172234622CB
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Thu, Mar 12, 2026 at 05:57:18PM +0100, Jan Beulich wrote:
> A subsequent change will want to be able to alter them based on a new
> command line option. (Note that some were __ro_after_init already.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I wonder if we could also move all the cstate tables to .init section,
as after boot we would only use one of those.  Anyway, for the change
here:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

