Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDebJKfTDmr2CQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 11:43:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1CA5A28A3
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 11:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314963.1584873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPzvL-0002k5-Vp; Thu, 21 May 2026 09:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314963.1584873; Thu, 21 May 2026 09:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPzvL-0002hB-St; Thu, 21 May 2026 09:42:39 +0000
Received: by outflank-mailman (input) for mailman id 1314963;
 Thu, 21 May 2026 09:42:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wPzvK-0002h5-Gw
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 09:42:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPzvJ-002QPu-TD
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 11:42:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0ed38b-2eae-0a2a0a5409dd-0a2a4506d562-6
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 11:42:37 +0200
Received: from [52.101.62.65]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0ed38c-7371-0a2a45060019-34653e4175bb-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 11:42:37 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA1PR03MB6322.namprd03.prod.outlook.com (2603:10b6:806:1b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 09:42:33 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 09:42:33 +0000
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
 b=K/MSKnz/1IeVUmrqGBrzfa5p0QgD0zcz/EVvl/PRf93jYl8CBRKt++Y1TUi8lY2HVbIkl0R0s/9xHo7/8NYTiA3PPcmaw4IF+GYD5dA4DMUKUVGbzkRLtJTnAfgwY5DbpgHZmc191LlhmNe1EJ/4cFwY8i5haSE7aEp9OrqTl2BYmTeH47pnmlLnTg2fTYzD9dxhbVVRMqMHaOUKbyZrcjXiDklLl0DOHKphHQJg0Lm9GCozNl31bRNGbc1ODUEWpDz8l7Duv3i64jSxakZ08eMlcpZpGqAja4VD3hKk//4+J6OmYUzQFliXlSn1mbj/3+Fss1ClfYVRrnQIGXGk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vpn+kqmEH1yUZEUMkrsclFPYiKTScFH2Nq9PqcskGhU=;
 b=gJtZsAa+/7JO89mecVqf2uE/YbDiPiBM/93zS7Ni/0klg68p6aa26lP4VoYTkVR0z50hELA0nu4AJdZHkb6JKnqT5UXc92ay060aAeLT6uTf5atwejn5lSFXRECxn72lnFDOTaTXZhiEG6KqqcY20cdhD9tLAOdoQU1Yryl7ONRtGps2KemgMj8qozBP6h9LU3ZjfJ/xqS1ks3fWOiSmrpGyMVxI2aSZeRgju6pjLoBIKMPTn3GCRC4l8eAnwAjnc/oPBsuNesZeC6XkxPlu39y7qkHLhJBTzrvanjxePeg+N/3PFjAkTEAVhs7kddi1P+Ir6dRUjgdM4RctyCQwug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vpn+kqmEH1yUZEUMkrsclFPYiKTScFH2Nq9PqcskGhU=;
 b=D6VJ31cwNaGCwwBfqswD9tMcWb8tH/zPwMhsC/c6ygwBeRykgisPYNDRmOCIGOWoddgl2WUF7gMxPygGaHI35P17TGqvakx3QZ9zyU/8bflnUSrFK0i7VexeltZiL522eT8o7UhNQjFqZRz8F+eIlj6vo0DGDGKff9V0qrmOqts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e2d6b86a-9d2d-479b-8223-7f1991e6c337@citrix.com>
Date: Thu, 21 May 2026 10:42:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 2/7] x86/hvm: Introduce hvm_emulate_one_ctxt
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-3-ross.lagerwall@citrix.com>
 <2005e70d-06c1-4a9c-a532-7f1a65761fd8@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <2005e70d-06c1-4a9c-a532-7f1a65761fd8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::17) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA1PR03MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 535b2e55-1167-4679-b4a2-08deb71d48af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|4143699003|6133799003|3023799007|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	e4fTtM6brVEHuPx/wE2JWgG7pvkkKF1q0RN0n4bfv+eTAaUs/VpwCuslF5c31u1LPlIG3Y+uMhTzbdYdI+OhyrwLQq3Bc8vfKCF/rUSvu/3AbPu0Hm0WKnQhxyCB7nYcLuYDKSqtdJ7E6dnZoo24x3KGBdlgWJB8OmHxBv9m9tS2DP/hvqA5KOEfhBdwTMDhKH+PGCdhiy2NlRpCq1G4MCnY2idlSrpBtKsCI2+JrKGxvyfRo+jXUjwc8VNGv4yPzQWFZP3zdaKSklUplzdgtfuNLciVPAUs9OILtTl4AVfUhK4KnPlRh0erVHK3fg+EFjTUxgzvIK2EVegck4zO+wGEVIaJ4YkA47J/TngNxzQSSBtNfZGejviETo0RSMh8V6v0gwsbZQbp/HXqlHCbhpDum/8fy6wevhRycZxM6YpGO4Kt2UEOeAHs6wNbTrkV+vDD4eQTLK7RwJwJrsX6Ghxm97bQmTTr2Z8myy+vnRbvgEdj14UbDxVLG707SVCtdImzazN16yE1CXlhzmB3bYAwiO4cDd18+qzV3H8qHlTe2U0Nas1r18cqz3fIVBukMm9jSEEE5X5NjFt19VsLd5qlmEM71zgUEMcfn9Rca+O64NwKU1D7+z5jpMsO/tbyEx6OkTiNyahOb4eU0lOJTyi8pW3s5KDp8FoxXt0ESpDVgD2R6CN412aPDWTrUpCw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(6133799003)(3023799007)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YS9RdzB1VmE5K3UrZ2ZpTEpMR2pXV3NYY3hZZmt4MkI3c2RQR0VKL1FBNU0y?=
 =?utf-8?B?cUNqdmtzcEhNRW53S0JIU1VhSmFMcUZ1a2NpQkNEMG9IMVZkR29SanAzOWtt?=
 =?utf-8?B?RGxtN3FST09LZWw1dU5vOWNNazJiZkduekEwNHc2aStVVE56b3BIV0J2NjMx?=
 =?utf-8?B?bCtjdGQ5Tk9JalVUVFFkd082OXF2cGxoWGZDOEVBK3Y3RWFVa3BSTlM1dE4r?=
 =?utf-8?B?dXdBV2V1UE1teGlJOTFUNjRLYk1LcGUybW5UcnA2Ymt3USt3ZTJ4cFVvTlNo?=
 =?utf-8?B?NzF1cnNpUCtZRHpaMHdtMVo3eWw2aHdUSUJMU21FY3ZWWjJiRWlxV1ZFYUpo?=
 =?utf-8?B?V1FNdjRMaWg3bjlrWXRkUTFIdUxFbDdoSEFXNVZMT2pGY1pha213SzdiSU9P?=
 =?utf-8?B?VGs4RkZScEVEbmJieW4raGkzTTdGbWQ1UXZ3U1RNZWVWUkpyMFdXeUZPMUNp?=
 =?utf-8?B?ZlV0VDB0eEtjekFCSmxZU2Vhd1F2S2hvR09QVXdlQ2t2VXlWVVFpWnJlb0Jv?=
 =?utf-8?B?WnZYdk9md0JkVVFzcWxvbVZqYlF4QStvek92bXFVc0hCZW5WMnF2S29DN1J1?=
 =?utf-8?B?S0E1bEw5N1AvMkZnWWllWllqNnJhNnZWcnlvTXBqU2VEQjNWbmdpRm5WTW5G?=
 =?utf-8?B?ME5KdzRRSjc0b3JvcndxQnZNMXBlSDJmQUFVYkozTlN2ajhkbWN1TXdjSXFC?=
 =?utf-8?B?ZVUvWHNvbldnRlZYMmx4RDA5NzQrWGV3S2NXZ25mMlBxTldHek9qWmlEczh2?=
 =?utf-8?B?Z3RFeXk5VGQzUXlEOGVRYmFtNkRkVjZsbjFCMFUweWNZTXNEMFQwQ1ZXUWhT?=
 =?utf-8?B?aC9uWDFHLzVyQ0xIdGJCenZVNjYzYmc0SzV6dzg2bGpnM3BUMk00OWJMZFNL?=
 =?utf-8?B?ZC9LU20xd2hQMXdmK1JicDU3SEFXdXoxa0JSSGZ5Z1lFVEd0R0ZpOG5Ub2Zi?=
 =?utf-8?B?MUl0M2M0a1RFQ3RWQUpsY2d5bksyWDVCM05kRUdURWhFcnVkSlNNejV6bHVI?=
 =?utf-8?B?SzJ4dW9zV2RCSFFCaElhZDNhVGYyaGZCeVkvZ09PZlRTZWRpcklTZ2RaSVZC?=
 =?utf-8?B?UTFiYmtlKysvL0NOci9mODVjdzh3NHBTN0hvTHJjM0NXRHlHVStET21aYnhX?=
 =?utf-8?B?VlNQU3dXcnk2Y0xVcFFJMzlmUVBHN1ZCaHVWTG9BdURnb3NQT2UvTHI4RUZK?=
 =?utf-8?B?eTRTNHplMmQzS0k0ZXEyeVBxbmIyMTh0K202RlNiVDdlZ2wwTzA3bXpnOGFY?=
 =?utf-8?B?Smk0YWt2c3pJV293MjhTZVRIUlhrTUZMUmYwUlRqN3o3dEt3QWIxL1VXamVq?=
 =?utf-8?B?Zk1zU1dwamtoYnlKTTlRTjBDUXNSQVREajNzaVhzZjZMK2lVcnpxcGJUbG5Z?=
 =?utf-8?B?cmluVUxvOGxPZUUxTzR3aEs0eW9YMW1HZkhLQXpkR20wQ3lmdHIvK1FvWHNH?=
 =?utf-8?B?eHNRMW1LaFBkS25ZcTg5eU53UW5qdFZQWnFLblU2UHNlbGUyYWN0d0p0OEJk?=
 =?utf-8?B?MzhGTW9VblJMZmZ6MXhNTFA0ZWlESnNPRnN4ZWwzYUFuVkxBT1dzODhnNTlL?=
 =?utf-8?B?bGdPTWJFTVo4S3RNbkJrVXBjdE5qUVJSUXh4M0ZuNUVzWWNSeTlxb2dCOXlX?=
 =?utf-8?B?SmdCRVYrVnY4WGxnbXV2UUV1RXh1cmZ2V2p4TnhqUjMvSkZ6bnRNckNJZ2N1?=
 =?utf-8?B?TE80bWNNK2NaSXB2MVFnaTVrWUk5VE5YdkE1bUJJeUp6OW0vQnRHNUwwRUJM?=
 =?utf-8?B?V2xjTFJhbzhmeWlRMlRZOGRxeHJJUWJQZG5idFU0VG9yZmloMGdpUUZ3TjNU?=
 =?utf-8?B?TUVRbTU4NFZZVm02b2lHNU9zR1c5VDNzTFNXaFBmbnZQWVg5dk5VMU9GVXVK?=
 =?utf-8?B?YkMyVWJnQ05ydW90YS9XSVNwMmNKODNOM1lna2k2enJlNVlPUEpsWFk2ek9p?=
 =?utf-8?B?amo1cXFqRjRGTG0rU2g4Vit0dXJkdjFuWDMweW43SUhna2ttN0ZwanlVL29y?=
 =?utf-8?B?MEF0cE43TG5RVkgxNFI3MlNhVFZ1Zy9MbUlnclRJK0NjZ0FnTzI4RktxeThx?=
 =?utf-8?B?U3JSdzNzSmp3eWJaem03N25FekxDeW56eUJBbENWRUdrZUNzcXczS1dIS1pO?=
 =?utf-8?B?UmtjbGJ6Ymt5MkxUWVRucm9ZU3FpRmhxa29HdVU2R3dVUm9qVlMxRlhiR1ZD?=
 =?utf-8?B?L0p6ZGhTSFc5YkRyWS9wZG1pRkQwUGhzSVU3RE40b1Z0U0FZeTkrOWE4V09C?=
 =?utf-8?B?OVdGZ2Z6ZDAxdWUzajB3OWVJTGVSUW4rY25CYU5sdGp1TWc3b0NJSWR0ZE8y?=
 =?utf-8?B?bVFDUXo0ZWlIR1hsS3dOS3UvT3JWT3VqM2toUjF2YkxWZDZzTDJJbWtJc3Zp?=
 =?utf-8?Q?kNWVp9UoC248OGwM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 535b2e55-1167-4679-b4a2-08deb71d48af
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 09:42:33.6339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXoIZ4VTZUmYHjd7MUNQ7xLzSdsXnp0oysCLndm04wBZTsNWTmfEHZVb4YVYXim/MWnGcNi/sLbuCJZvQMUskJe15/HeJbwB+gPcrrRKAGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6322
X-purgate-ID: tlsNG-16d1c6/1779356557-86369D75-1E69051A/0/0
X-purgate-type: clean
X-purgate-size: 2162
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EB1CA5A28A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 10:54 AM, Jan Beulich wrote:
> On 18.05.2026 15:13, Ross Lagerwall wrote:
>> This is like hvm_emulate_one_insn() but takes an existing
>> hvm_emulate_ctxt as a parameter. This will be needed to merge the
>> instruction emulator and VMEXIT fast paths.
> 
> I'm yet to understand why this is necessary, but I'm afraid I don't consider
> the name very descriptive. Even hvm_emulate_one_insn2() or
> hvm_emulate_one_insn_ex() would come closer: You don't "emulate a context".

Of those, I'd prefer hvm_emulate_one_insn_ex(), though it still doesn't
give much away as to how it differs from the proliferation of similarly
named functions (i.e. _hvm_emulate_one(), hvm_emulate_one(),
hvm_emulate_one_insn()).

> 
>> --- a/xen/arch/x86/hvm/io.c
>> +++ b/xen/arch/x86/hvm/io.c
>> @@ -53,27 +53,32 @@ void send_timeoffset_req(unsigned long timeoff)
>>   bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
>>   {
>>       struct hvm_emulate_ctxt ctxt;
>> -    int rc;
>>   
>>       hvm_emulate_init_once(&ctxt, validate, descr, guest_cpu_user_regs());
>> +    return hvm_emulate_one_ctxt(&ctxt);
>> +}
>>   
>> -    switch ( rc = hvm_emulate_one(&ctxt, VIO_no_completion) )
>> +bool hvm_emulate_one_ctxt(struct hvm_emulate_ctxt *ctxt)
>> +{
>> +    int rc = hvm_emulate_one(ctxt, VIO_no_completion);
>> +
>> +    switch ( rc )
>>       {
>>       case X86EMUL_UNHANDLEABLE:
>> -        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt.descr, &ctxt, rc);
>> +        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt->descr, ctxt, rc);
>>           return false;
>>   
>>       case X86EMUL_UNRECOGNIZED:
>> -        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt.descr, &ctxt, rc);
>> +        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt->descr, ctxt, rc);
>>           hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>>           break;
> 
> These two lines were already touched by patch 1. Afaict leaving the change out
> there will be fine, and hence will be overall less churn (plus following the
> lines' histories will be one step shorter).
> 

OK.

Thanks,
Ross

