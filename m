Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI+LEv7h1GnbyQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:52:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922823AD448
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274904.1560879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA42t-00053f-Sm; Tue, 07 Apr 2026 10:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274904.1560879; Tue, 07 Apr 2026 10:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA42t-00052E-Oc; Tue, 07 Apr 2026 10:52:35 +0000
Received: by outflank-mailman (input) for mailman id 1274904;
 Tue, 07 Apr 2026 10:52:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wA42s-000526-O4
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:52:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA42s-001KgA-3o
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:52:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d4e1e0-bab6-0a2a0a5309dd-0a2a4504ca0e-48
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:52:34 +0200
Received: from [52.101.53.38]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d4e13c-bb33-0a2a45040019-346535262dcf-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:49:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5210.namprd03.prod.outlook.com (2603:10b6:5:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 10:49:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 10:49:30 +0000
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
 b=zRYiNjid0QOkqhhbO+oI5qzAStROVUw0aV7ubXE4m7i0Q0HB92S98aggEjDmxXla1xA3lRFQGjWjPT9pnQo2pGgaIny5u2Sjdyb3gIt3McHnOfLj4ey+Xj8/wwQNlr49Qdvn4FpwMhmFhwpvS+eAr4ymlXXkkCtqXjhuqB+Ru/QKnC/gsv62p78MB53Kn8qj20hxzUBWj+uv5u2Ld2I8GrRSJlieKolFgGJT8K+A1Vbud8Mcw7NZjZSTHdk1N4a9a6Fa8z9TmLfr03wudPpQ2RWnY7+ydFdNTkzBnHbs2ttBkeRWaHiNW814+jh5xCDaf9NLDyOHHgX3rNZOOj/7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biOqghbDfwMe3yFuMk5+Lryn4VJSb1aKAF7P5vXXWkw=;
 b=agAfJCfx109AEkCV4LVHYt9GhshwDUFR/3tjCPvYuadbufeSGWafTUiMB0J8GG0DuE6dNvuHsfE6NwETCypppsao5nG39gWwnARxEk5Z6+qUbGmH0ByqY6y2ICuhUU/y4bBWB5vdWbU6uYKIcnfsEq3mRQYP/gUDIhhQG2R5bNqeRnzJtWFf+YRcRLUiKBRKxVAE+NLNf8q76UtPhcWwCJG9Q0AnAxrI2eZaf9OZNNHr+6LEhGw6c3MRHgq4ZG+Fwooi/hjx6sM5Sk+FWBAor0yvAiQykEzQpAUJf19jb/yKXmUwADGVmshMaVVgycsCw56gqOMLmFiimPNXyoUvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biOqghbDfwMe3yFuMk5+Lryn4VJSb1aKAF7P5vXXWkw=;
 b=v2/OhrvXDPPsB0/yNad9BpnxC+DtOaDOwHrFJqzPIEKrbZPrLNmLN/ls33XMDSblEnrBC4MGqPuQzY/yBI9PBa1vd6vz/z5zi8JCefFZ3DiXlhrheKaFSwnMECZnhAxREULFFnkwpIofeF30ZA+ospMwzep66VsEPIj/DqBrnJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3ea7af3e-811e-44ba-8f4f-d46acbd9d71b@citrix.com>
Date: Tue, 7 Apr 2026 11:49:26 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
Subject: Re: [PATCH 2/5] llc-coloring: improve checking while parsing
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
 <97d6ba6c-4ffe-4e1b-814a-d51a0bcf363e@suse.com>
 <884db6ba-19c3-4073-b1e4-631d286ec5d2@citrix.com>
 <44abc205-c7b4-4aff-992f-25ddcadd38ec@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <44abc205-c7b4-4aff-992f-25ddcadd38ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0401.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: e7238f26-1b97-4635-8569-08de9493590e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5lUbxJS6Yqtmgyt6VoDm81jRQga8rvqH4JgPDnSBk+TPyt+DFOUn0fq9TA+7CbW+5f0shVnI0IHE00+5GYa2kgbIPIykkSs4qyeabwad2u2GYLvm+qQByKCVx8E1LN87wGFkH++q3QEEl6XUQYQcEy39hwsSVQ0fIiqMqeNuBWlaG7ZPCwcwPhtPDD7VVf5QtUbYRZGK99f8vn4V7kP0x7RraD78MXN7XEX1+rLHWw2RNcoFUF4irqtCmKHnqJ3t/BqESdfh7oQTOk2HNohZOHC7QXMjbGoyfZpKti7GXZlUJ/5fPBuHfJTXjlzTJLTthYMV1gWX3bOkw+WAHCOUAH7293TKM9BPil4hAPXNPLejgDNSp/b3jyKBg5TqJE6cqLRxLSnYSMREdjVIZUuCeB+UQkIH8H7OxXbz7Z/J+rbjkYc9ytaGmqLBEhrJCMTDoMyd2CuAAz/3pE/an7/oxCyemUpKtNWKG33hgXzHFolt/5xqWEjLUq7vrwy98s+fFIxfMS6Lx2t6WqdvPnNGgd3bp0rFa8ArWuAApKl094RB8jWF3CJC86NhiqreRYcxDk2RiC+lCihNoxuT7ijCVOisMSB+Nb6haZch81fQd2Ue1CI8vkrrT43soLPOfOzd4VJX5lWo5Fdqkwb7pl6mY7U+/ggz1mabu4A13M6Zt5tVsV/dR6fI1zXcD91/XCaatCLvtdv6BIHgRjryfN9Zhq5+HTsAL9mh3PM67ZRo86A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDd4NGkxZ2ZQSW50ZkoxYTRyNHRQakNvaXY2ZzMyTS81amVVV2JZUERWdUI1?=
 =?utf-8?B?UUQwZUp2N1V6MjlsMWZwQVBJY0ZpczdEYlFvU0phbEdWQ25qODUzdVVTQnRt?=
 =?utf-8?B?aXlnaXorbytoWDJIdVhFVVhmUFJhM0J3eEdZWkpJelU3OVljZXZ4cVpibWdL?=
 =?utf-8?B?THlMaWVUZk1wOUJxbk45bHFoL09GME1qVHppYzZrMGlFV2tyN0JNUjBsRC9l?=
 =?utf-8?B?dnJmT2ZRWWZuOUJkaUlUQWhSVTkyY3Z6RkN3U2dFT2lRRjd3Rmg4TXA5VnFu?=
 =?utf-8?B?dzFXU0xkMkVLYlZVOEFaN00vTnVXUWlwUzFaeEpjaGtGVzBLdStUR1h6MHht?=
 =?utf-8?B?Y0hJMkZTVmovQm1WV0hoRTBtOSt0TTVMMGNFZXA3QStVQVdmRmZIWGNUTVIz?=
 =?utf-8?B?cjQ3b0M4b2UvN055Z2srZ0NKbGdzeFFZS0U5QlBwRHZ4QVNxREJ6MnlIaFJH?=
 =?utf-8?B?Vk93OG9NZ2tsUXpMVi9raEpiSzJYdXZwbWNaNnBicjl4bFd2bkpUTFR6UTVP?=
 =?utf-8?B?NUhJTk85cUdHYXhTMDVSRnhnd0VXNlhvS0pxSTM0TVhQaVYzWlVVVGlYVDJN?=
 =?utf-8?B?RGZmMDN3YVgyaWd6YVJvU1hsOGk2OFh4WUFFQlFWL2JSK2Q4MTI3cHBIdTk5?=
 =?utf-8?B?TU5qeVl3M1Z5SGMvdU1mRVV5VWxiOHM2dktrUXVDdGZFSThKWVIrSnVLclIx?=
 =?utf-8?B?Mk94b1c5N0prcUJINWJRNVFvV1ZLV0hHNHhOOG00QXloajNVUmNaZjg3aUo4?=
 =?utf-8?B?MmxQekZGRTQ5bklGZTB0UmVZaDcxVWRMaUs0aXJNVGxYeEhPWW9lS096STRr?=
 =?utf-8?B?Wm9ZZ2txNlZlM0UwclAxY3RIUCtuUWlNQU5PWXREdW5tbi81RnpmME5UaVE0?=
 =?utf-8?B?MERhZ2tDSUU1Wjg4OXYyVFIxQzZRa1JhM2VrcXdVQ3RGdU1RUCsyeDZFYVZX?=
 =?utf-8?B?clcyQnZ2R1RacXNydHByWWVONTcwZDRCaEpvMGNKQjFPd3AyZUZGRVo4SjFO?=
 =?utf-8?B?UzlkSDdVRW1sYUFHUzg0UXE2dW1xQVpZMTN5WXVQSjlNNlVSSmxVOHUvMjV2?=
 =?utf-8?B?OWJETi9waDF6RnBrMHlFb09jeEhuZ1ZxNW1zK0NXbzh1UmF0Z2ZCOEdRYzkv?=
 =?utf-8?B?UFdoU0NIZzRCQW1pSmxFZ0JaSm42ai8zYXEwNGN5bGNCYVp2NHN5S1JCU2Nj?=
 =?utf-8?B?eHUreEhtWW9UZ2NzUlFKWTlWR1YzdWxLV1pjZU8yRzJic0ROVjdSU1doOGhO?=
 =?utf-8?B?NXlFcTFoYjV3K0RXT04xTUc4a1NzUjRpSmJsRkRzRzgxbDNCUExtbzFtU2tq?=
 =?utf-8?B?Y3Y0dGt1MXlZYzNJbmVMZE9wMERXTmZIaWl6aHh2Rlp2ZDAwNEtBRjNpNzN4?=
 =?utf-8?B?U0xlSG9lb0FlSHhuQ2drTVFVak9PWmUzUml0NVBqMVVlZHZGYjZmZC84bzJ1?=
 =?utf-8?B?RGNIeWhhSk95OVJLWUwzdFZRc0U5QmFJNnNhTStDNXVFSUF3d1kycnNjVXMr?=
 =?utf-8?B?VmVuNFJoTlNuMFE4YXczZkcrZGpWTUpPOUZ0UmtXRHVJR0lyaEtvZG1lckww?=
 =?utf-8?B?VG5hUWRsazFFM0tBQUxueERDZlgyVEE4aERJZjFGTTRkSEZBR09vRERZbmN3?=
 =?utf-8?B?SXJtRDkzcDFLbXBXMXBCekxsZGZsT3BvSEdwaXM4bjZzMGNmZ3FZdm1yZ1dQ?=
 =?utf-8?B?SGhhY3NlUWhZOUxyTjJ0c2JQRDZSajBtS1F1UzN4ZkNRZ01QbCs5dytDYndB?=
 =?utf-8?B?UXA2dFA5czh2SHZTMWdJa1JXaWRXN2NMMHUzS1RwczFkaWFlcjZHd2RIa01x?=
 =?utf-8?B?YStobUdpV1ZFR2ZJTFBqQm5JakZOdGVES0JYeGdsZlRVd3RIZGlhY2dnVng1?=
 =?utf-8?B?ODRLQ0paZFVYVkFPbWtMd1ZjOGJXcXEzTkk4bitQa08xdjdobW1rU3ZmSzF5?=
 =?utf-8?B?dDd5VTdxUW9RemRoUytldWVpRUJTV3dsWEthbVdQZWh2ZlJidUw4YytjK3U5?=
 =?utf-8?B?MVpaOXdxNnhRU2x2THZnMkhJN0R6UTFURVBVNzNsYTJjWE9kS2R5V00rTjNR?=
 =?utf-8?B?dEt1M3BsQTVsblRZc0o4WXM5S0J5clZMZ0xDK1BxcGl0RkFWSUcrSVVkdGxQ?=
 =?utf-8?B?c1hqN0ZENE1uYjlESXErQjV4ditIVkxMMTJjVUk0Q3lva1BjN2NCcTg4c24y?=
 =?utf-8?B?ZUY1WllVY1MwQU0yZzA3SzZ5ZmIyNkxmaWVSMC9Qekg4NGJ5cEw3TzBrb2ZN?=
 =?utf-8?B?TmdRMEMvYUlKWXZXaDdIQzAxc0hXeWtNUDl6eDl5MStXelRxTzdHc1U0b0Zy?=
 =?utf-8?B?ckpoT25vSVlpWWdKVGVjVEZpL1pwcURpUDNHRFlsODNxU0ZmMXBjUU9CMVNn?=
 =?utf-8?Q?seHoUJn59PUVXUTo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7238f26-1b97-4635-8569-08de9493590e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:49:30.9132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZPox64RM/IXdNyrvYgHDKQm+kbn0csb49T3i++emHbRM5/IQEXfxEpPINE4+x+tIfTE4ExXltmlIxeN1+pYO6T5+xytp2rNwohhCfEMa14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5210
X-purgate-ID: tlsNG-ebf023/1775558973-B212551B-0EA94B3C/37/8702371926-1425033
X-purgate-type: bulk
X-purgate-size: 2342
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,cert.pl:email,suse.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 922823AD448
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07/04/2026 11:37 am, Jan Beulich wrote:
> On 07.04.2026 12:30, Andrew Cooper wrote:
>> On 24/03/2026 4:37 pm, Jan Beulich wrote:
>>> We can easily avoid the risk of wrapping UINT_MAX <-> 0 by applying a
>>> check against the compile-time-constant maximum number of colors.
>>>
>>> Additionally the overflow checks suffered from an off-by-1, as the parsed
>>> ranges are inclusive (e.g. end == start being possible, requiring 1 array
>>> slot, while availability of 0 slots was checked in that case).
>>>
>>> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
>>> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/common/llc-coloring.c
>>> +++ b/xen/common/llc-coloring.c
>>> @@ -76,8 +76,9 @@ static int __init parse_color_config(con
>>>          else                /* Single value */
>>>              end = start;
>>>  
>>> -        if ( start > end || (end - start) > (UINT_MAX - *num_colors) ||
>>> -             (*num_colors + (end - start)) >= max_num_colors )
>>> +        if ( end >= NR_LLC_COLORS || start > end ||
>>> +             (end - start) >= (UINT_MAX - *num_colors) ||
>>> +             (*num_colors + (end - start + 1)) >= max_num_colors )
>>>              return -EINVAL;
>>>  
>>>          /* Colors are range checked in check_colors() */
>>>
>> I think this is correct, so Acked-by: Andrew Cooper
>> <andrew.cooper3@citrix.com>
> Thanks.
>
>> However, the parsing logic is also ridiculous.  Most of the complexity
>> comes because of parsing a bitmap but storing it longhand in an array of
>> unsigned ints.
>>
>> Instead, the global variables default_colors, dom0_colors and xen_colors
>> should be bitmaps sized by NR_LLC_COLORS, and d->llc_colours should be a
>> bitmap sized by xen_num_colors (which itself is bound by NR_LLC_COLORS).
>>
>> With the default of 32 colours, this would involve no memory allocation
>> at all, even on 32bit builds of Xen.
> It's pretty space inefficient, yes, but the parsing wouldn't become simpler
> when using bitmaps, would it?

Yes it would.

The current logic has opencoded bitmap helpers, and removing *num_colors
simplifies all the boundary conditions (you simply don't need a cursor
when collecting into a real bitmap.)

~Andrew

