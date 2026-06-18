Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y4v8B77RM2o6GwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 13:08:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982369FA05
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 13:08:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=mCSdX+DS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1340951.1601588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waAb5-000595-D2; Thu, 18 Jun 2026 11:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340951.1601588; Thu, 18 Jun 2026 11:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waAb5-00056J-9z; Thu, 18 Jun 2026 11:07:47 +0000
Received: by outflank-mailman (input) for mailman id 1340951;
 Thu, 18 Jun 2026 11:07:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waAb3-00056D-AK
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 11:07:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waAb2-001aJP-N4
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 13:07:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a33d17a-5cb7-0a2a0a5109dd-0a2a4503e4ba-22
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 13:07:44 +0200
Received: from [52.101.201.53]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a33d17e-672d-0a2a45030019-3465c935d27e-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 13:07:44 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB4939.namprd03.prod.outlook.com (2603:10b6:5:1e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 11:07:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 11:07:40 +0000
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
 b=dRxU1CpOIBF4Rbpa0DPx4QuaeS/vZeRvLB3XdYVRlzsMV1GNh9EJsPJ+/JSdCc5n0iZOMWA+6V7+v7NELRhRR9j/IbuEui1disD4eyNpfsY2OV9UnHWICozFYWsvC1q30riQcFNeqQrS4WMzGSx53o1ESA6P4NwLTR4zbdzFWfNWMSZouK69sCh/NOKrgCBWLIWoot4ZV/K+tmHhiQSpPGY8xlbiCLlkF0U26TxoikS5/6nuXNFnpUlK1LnavP3pS/GQ42qgT4G+gqJDbEPcTIZQnTxYxrOkcOwxdhmJ9UnMdawgL2dZ+iOsYHcxccYwaw9QjYHxyTu3DRJAx6Jsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkHDYyG3+RCgBnflcpsFuZgibZJQsWct174RfB6FYx0=;
 b=ApmLb5UUOrZZ22OV6ERj5mHr3pYeSQmLgWBc6eXgYByI9CWezRFg4YWSq4x6RbYGI+7TlvNE/cuZUQRA+hoKJGGVIpTxsy2GEhnxkN+/Pi7PICuBOCGFqB+YNLno+FBzvUWswneUriAAQpN+Pfow4tChei0dJhkc2iL1OMMY8b0bHtgU8MnohZzv9jMEd3xFcdVJzEiIIpM8q9g79I0WYQGZA8duD2rCypp2XDH/7WgYUKI1X3SZOVYDveXs21YWbHVj4l+dn9QaYcI6QgwNhdn4a/mWQbq2OgrT0i+Da+rhgmYwwuX5uFyiM61zEIt4A4jQouioadipsruDzMRJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkHDYyG3+RCgBnflcpsFuZgibZJQsWct174RfB6FYx0=;
 b=mCSdX+DSXCMpKF/4/mRJS39uluSeB2TYR7ughsfHq7NF0PMUyqvdCzUQo+2t6lIwqLgrxXm86YQe5xZWwPttX/5mCFwpWPNw287KeuVvDSyhwoqtQmB9RyV66T0CptYUQezf2+w9eBBJsPaIuUeIW2wtxj+Jv4fr6z5d0CJ1JFQ=
Message-ID: <06988796-7503-4121-9314-c1b3de707d72@citrix.com>
Date: Thu, 18 Jun 2026 12:07:37 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Subject: Re: [PATCH 5/7] x86/kexec: Implement new EFI load types
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Kevin Lampis <kevin.lampis@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-6-kevin.lampis@citrix.com>
 <1224fa79-d1df-4382-9829-aa2eabe60d5a@citrix.com>
 <BY1PR03MB7996FE744B091E767809F62BF3E62@BY1PR03MB7996.namprd03.prod.outlook.com>
 <06e98f96-2f59-4731-b5a5-8e88adda878a@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <06e98f96-2f59-4731-b5a5-8e88adda878a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0288.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: 7242608e-7839-4173-f82b-08decd29d02d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|4143699003|6133799003|5023799004|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	hRYDGdLsDiKhXlCcv/sZIB04WRjbu5/lZ8TE3/yxR+F8c96rEM0UC9Sb6DJhBx6HGidtPSPvoIZ3jPRD1Tl/vR/0PblQulQTiTUPbgxvm/G3D8bMJi6yH/cbLkYEK/q79juza/1TehIK8TgNCK1kaJHNjI85hkOOPdAUhdjSlo0+7iREMaDRneZNJb28hxy/jwn7Zusax1991/Wn0Itvrb1pytn9zcAAEIPxoFvQAlZM2vosBTIJS1bkBCOb3T5P0E/OvYh67K+rWfSmsSPPCsp4bH/rRL+XEwk86e6MhdM8mIvhnM45rNfbcW4wo0CpL91O9ESazwl9jClF1R00ots9SaJ5Mf0BA73OfMe9NRtNQ1gzgd+s4xsGTjw3c/9298FHiivlqrUjECd0qQvXvY/PNzRCxC7yYZ/S71grSB9xHqyYv+3OB0v359pXHu7FTeBxr71+bJQfoYpopRAn9kxBEyLyDvrjxaij3PQXjju0dtLjGh9BACHMMoWENDZqlvzB0DoLAtCbZJGaLxZLeDWLutIkuP4jiG5BQbg7S5rr0Qmbxh4EueUzJzT4fUwF1r/Lgou/wBZNsRO272pw25WpmFLNSWaqloBjWF3fcnfbeXD5bWcj+GhuDA2xhRg2R9mv/7VSGPpHI+bikzxfR2vsxzGNMiOgFuyARsF25Ck+9OqSFM45DfIsav75IqcE2TmWTh1Xl2hnAuhgchrH1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(6133799003)(5023799004)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1VKZngzRXlYNXdoZU9sWU9Id3JycHRxTnQwTkp2YWxidXpvUStjM0RuRmY5?=
 =?utf-8?B?OTNCN1VsOWZxTldCTHNrcUw0THcvOWlxNFJid2gwTDVuWnNSS1dUVkpwWlcv?=
 =?utf-8?B?MW1ZdWJvNWxlUDVjSzlyRS9KcFl4Q3hZTXk4cDYyZTloRGwxcDhPWDJkZUlN?=
 =?utf-8?B?eWswNUxlUDBrZnJ4YlBVMzY2cjA5ZlRkTkZiSHA5aVVPMUNvZkc2NUZEdGZC?=
 =?utf-8?B?Vkx4bWxBek1xM1JRRkhzeGhoZUdpK2g0VGNobGkzekptU094QlF1c3JZQWdF?=
 =?utf-8?B?c3hnbSt1MEliSHdLL3JCK0VIZ1liOGp0cmtyTEM5OE56SElORGtja1hZZmZP?=
 =?utf-8?B?MUlIR1BCaHZOV08zSm1sRHlGQ1k2SEhtdVZvUlZ1TFVpWllJdk1HeXZqOXIw?=
 =?utf-8?B?UkxJWHRpVk9pU0lBbE11UzdQYlhLZzhaWEk4MWp0VHU0ckRGWlRmR2RyeGZZ?=
 =?utf-8?B?UDVFd2ZpWVhKYkx0cE5MRVNlZ1NqVW5LSngwamkxQjJYeU44ekNIdUU3VXI3?=
 =?utf-8?B?U1VRWGlreEpCWHlYQ3pkNVlsTWNpcEt3RmVvc3hmVVVVL1pKWGJXUWxMNjFU?=
 =?utf-8?B?aGs2L05YbVF4WEhzeWxwb1k0OHNRNVNLcTZ6RCtOQVVyTE9wRG1xMjlTRGhn?=
 =?utf-8?B?QlEvMm0vbUpSa21neWZ1Z0pLMXpDWGh0Y3crMGR5QkR2SWFvd2dDR0RTMW1q?=
 =?utf-8?B?ZmVyeE9rZytNOURITklPYzVJcE1BcGQ0TUZQRDZKQTdvZ1oycVNxWFlOcFFB?=
 =?utf-8?B?TXJyVmdRdkdwN2Z6eUh0bkp5THkwT04ySDQzM2FuMG9LVGRtZVlINDRXTFQ5?=
 =?utf-8?B?RHgxRC93bEdycTlvdTZhK3JkcU1MbWk5eWYwK0hQeFlQRGtKaHB0VXBPaXFr?=
 =?utf-8?B?bUE4NWRXanZJZHdlWGtTUkV3TEp2OEQwUnFJT3BOV0hBMHc3UmVsV3VYUWto?=
 =?utf-8?B?aUU0YzErOHNhT3ExaHArdGdzaGNHVjIvRlZCSkd6d2ZudVlyMFRDSXFkc3dz?=
 =?utf-8?B?bDRzS1lCaGxtNGJ4bGVVVUEzMWhvOXhvR3JEMzJkWEJZL0ZIL3RoSVpud2s1?=
 =?utf-8?B?Uko2NFdKbzVTUmEyUHNuTFU1aEx3QkEwNlFGOXltcFR0dU5HSUNqNTRkUXg2?=
 =?utf-8?B?UWdzZ0lpT0hubC9DckVyUUdmdVFLSjNqRStXRXE2S3VxS1VyUVh1UXRvQStv?=
 =?utf-8?B?SWR4Sit5SHFLWDhUTVhzbkdpc2FjRWxRT2RKSEZhUDdqRkd0VW01c0lDR1hO?=
 =?utf-8?B?WmhOLy9qdm9JemlwMkpISEtYcjhQdG8remxsTVRUays4L2NycmZXZk5QZ09q?=
 =?utf-8?B?d1hjdUpaRlhSQk5HTnFNTlZxMkFyY2hqWWZrcWI2cUc3OXJqQ1psTjNHWnFh?=
 =?utf-8?B?OHVTc3p2WHJOdENiSC9VQW1jYVFlRy9ENEpDYUtWcGg3UitSUWZlMStzWHNy?=
 =?utf-8?B?MnU2akNIQ1FEU2JOYzBGbVJDTm5TUjBQNXFrUWovZVQ3TDdjelRDc1Q2Ykky?=
 =?utf-8?B?SUkvdG5raDh2OGdXU3ozNFFCQnJaOTNCemcrdEpLcmtxQ2V1QUdyRDcwN1VG?=
 =?utf-8?B?TUxxWXpYNjlEMWpSQ3JHaU16Qk1Bemw0TTZJNnptbW8vZE0zVTgzeng2UU5H?=
 =?utf-8?B?YzVZeWNabDFkNWtzWkVMNFdJdXhvRHlzVlBXN3dMdnh2elJqNHgyS0R0QVU5?=
 =?utf-8?B?V3UyUWVmU0hhVk9xRWVnamlmcGp0MnpnWmhtREQvOStQRlg2Z2pFUXp6SkdS?=
 =?utf-8?B?TVNrc2g2alJuaG14dVloUE1qVnY1dFBWYmlMT0daYW90empaWCs5cVBsMVBP?=
 =?utf-8?B?QjhRMFd5MG9YeG1OdTVBbHNmOXNEWjBJWlJLazlsYjVCbFdIL2huTTFGeHg5?=
 =?utf-8?B?UlNsZ0dKZG4zYUJuUTlyd0ZNdHZOdWpsRHBDZnVrVkk1VnpQTlJCL0djL29j?=
 =?utf-8?B?YWoyT09tVERzcWR3SWZHOThvYkV0WEEzWk1IdVFTSndlRS83TTYrQU9JMmFB?=
 =?utf-8?B?blA1dTExSlNES0k0d2hQMWtRTWczaVExSjJIeFZjTTkzRkhPT045Y2ZBNXQ2?=
 =?utf-8?B?UEtZYXVldTA2cXkydkJBK1NmTzZEU2ZBSG42bjZIQ0ZyWDBScUhRNzdqUkxa?=
 =?utf-8?B?OVkvT1dwYXZzM1VPem53N1M1eUlnRTdDZjJzM05yM2UzTkNwdjJsTzg3R1hY?=
 =?utf-8?B?YkVZS2lUYTVXVTcrbEMzT2NxdFcvK2xNLzRQZFUyWTFKTTNxQVpsMkZxNGhh?=
 =?utf-8?B?aUZUZjBvVk5oNjdVVXVGWTdBSHlCdE42UWJ0UUczNlZWTjlSVitCd3NQZWlG?=
 =?utf-8?B?L3dCbDErc1JJdVBCQjlJUlhhMlVjR1FhRUM3U1A5S3RLVTFDa0R2aWx2YUEv?=
 =?utf-8?Q?KNSdQnab711emiP8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7242608e-7839-4173-f82b-08decd29d02d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 11:07:40.4286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EYPSgMrK2UpnK25wEr2eQiYM4YzGJ4vqFsPRrXuwedXBvhY4mgxtI2xWO0Ai20G7/cPjJkdex+NdHD07IxZE0C0ZLuJBbGda8eX63l92oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4939
X-purgate-ID: tlsNG-33051d/1781780864-41F90938-3D0C2E79/0/0
X-purgate-type: clean
X-purgate-size: 3725
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:gerald.elder-vass@cloud.com,m:ross.lagerwall@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4982369FA05

On 16/06/2026 11:06 am, Ross Lagerwall wrote:
> On 6/15/26 8:34 PM, Kevin Lampis wrote:
>>> Ok, so here is startup_64, hidden as a magic constant.
>>> ... you're applying the alignment to the pointer and picking
>>> startup_64 out of thin air.
>>
>> I'm going to be cheeky and play the Linux-does-it-too card.
>> https://github.com/torvalds/linux/blob/master/arch/x86/kernel/kexec-
>> bzimage64.c#L660
>>
>>> Either it was loaded correctly (and the alignment is correct), or it was
>>> loaded incorrectly and this is unsafe to do, is it not?
>>
>> This is what the kernel kexec segment looks like in memory
>>
>>                                            .- dest_maddr + alignment
>>     .-dest_maddr                           |
>>     v                                      v
>>     +--------------------------------------+--------------------...
>>     | padding            | real-mode setup | kernel
>>     +--------------------------------------+--------------------...
>> 0x000000                               0x200000


By "real mode setup", for the purposes here that's the PE+/bzImage64
polygot header?

Where does the (hypercall) segment start point?  Surely at the start of
the PE+/bzImage64 header?

>> In the old non-EFI kexec the 16-bit real-mode setup portion is
>> chopped off by the userspace tools and the segment buffer that Xen
>> receives is just the "kernel" part. But we need to pass both the
>> real-mode setup + kernel to kexec_load to pass Secure Boot
>> verification. And add padding so it straddles a 2M boundary like this.
>>
>> What the 0x200000 "alignment" variable is doing is skipping over the
>> real-mode setup and padding.
>>
>> It won't necessarily be 0x200000 though which is why we need to read
>> the value from Linux's setup_header->kernel_alignment.


What is necessary is that the segment dest_maddr is chosen such that the
start of the embedded kernel has correct alignment in the eventual
identity map.  This property is either true or it's not, and there
shouldn't be a round() calculation required to generate the entrypoint.


>>
>> If you're hinting that perhaps userspace should take care of all this
>> and just tell Xen where startup_64 is then perhaps. That would be a
>> bigger change we need to get input from Ross on though.
>>
> 
> It was done in Xen because there was a concern that letting userspace
> pass in an arbitrary start address would potentially allow a Secure Boot
> bypass even if it restricted within the bounds of the kernel image.
> 
> The patch should probably make it clear that this load type _only_ works
> for Linux bzImages using the x86 64-bit boot protocol documented at
> linux/Documentation/arch/x86/boot.rst. I think it needs sanity checks as
> well to ensure that it has actually been given an x86 bzImage and that
> the boot protocol version number is as expected.
> 
> Since it is x86 specific, maybe it wants to move out of common code?

Yes, that's where we're going, but the constraints need understanding first.

The old load types had nothing really architecture specific in it.  It
was a bunch of bytes, and an arbitrary point to jump to.

With this new "EFI" load type, we've got structural information.  We
don't need userspace to pass in a starting point because we can locate
it ourselves.

We do want to restrict it to a valid PE+(x86_64)/bzImage64 polygot, and
this will require arch specific functions to decide whether we like the
image, and to figure out the entrypoint.

~Andrew

