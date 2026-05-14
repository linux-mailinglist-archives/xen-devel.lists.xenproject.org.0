Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHANBmAQBmoFegIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 20:11:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED9545BD8
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 20:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309173.1580289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNaWw-0005N6-9b; Thu, 14 May 2026 18:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309173.1580289; Thu, 14 May 2026 18:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNaWw-0005KL-6C; Thu, 14 May 2026 18:11:30 +0000
Received: by outflank-mailman (input) for mailman id 1309173;
 Thu, 14 May 2026 18:11:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wNaWu-0005KF-DJ
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 18:11:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNaWt-00Aw7h-MI
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 20:11:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a06102c-2eae-0a2a0a5409dd-0a2a4509d8c2-30
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 20:11:27 +0200
Received: from [52.101.61.46]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a06104d-2497-0a2a45090019-34653d2e3c1a-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 20:11:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7346.namprd03.prod.outlook.com (2603:10b6:806:382::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 18:11:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 18:11:15 +0000
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
 b=mvYu55EFvhvsUU2Pkb4/eo6BcVYMRilChQ33Pi+VjminS+wjiip4LBiVR/DJDx3lPTdzuYwtn6qsrwmL+OwKm4oBkeU1295ESLvhHQ9EA8A1ONAF5izzEr22SPm9y8t/pkVLE+xR85dwmMPYBIJ58OJL7+PeQJmSRh9U92F3aFZAg/7cFDG2QCHs/wyy4WSLO5L8VuEwDNHXWdNz87h2wNSEV4lCWUkWMxiUMQu+etkOOhd3uqy8a2Q+OH1P6rxypyltdJI6O4PKCYw3u9Eh1jo2hIHBh2pVXslHYOYq5Dol+igyeP22EDzCFbkvM+MZMJ70pYT1E7hZQhqqmF07Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ea9tIECBFH5f4r66FjFuNv8xb8HkCQaZdJeVGzOk1mw=;
 b=hGG4Wb7p7Oif1qfdnKTqc0lmFHqH/55WuDUn5yB7ArsJvmlQQQ97XExDk0KWIo6w8NwieVXy826k1kC4eHVybx81k0Yu4kgndIQ2NT7Ip5U219+GdPRtkmybklGsnKWb520WEFCU96B4Eg+0vdg25yTpg5mqucWxK4hHR9Euc3RAq+N0iRJfBk+skghTu9yXD/3GxtaixDUfvJJiXhW6Jdqakusi0qWQ+H8Npvvvb/WIsFU0wKLs/2Zpa4rPEvbJnOg88We0OE7cy0x0cw2wTz2mw9Yk9b5D5NXMBKfYXM+KAisshUmzyiLFPJ885Naga407Rgr6FrtXbu5K0B7OQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ea9tIECBFH5f4r66FjFuNv8xb8HkCQaZdJeVGzOk1mw=;
 b=wOnFOHaCIDtRh2cQ1G8t9n9EdYtdlsBnWzcoq5lPEdo6n3KfziExYX0SYY9tisoN7CwXAdLMQHI/DrhXQ7Cnd2JYSpOd0kuqXFBENyrG/m8jFomadDCGU2Sn/dIbQTsg4Ek2krsob5gteUUuXOPJ/Ui7YkAS6Rv1Gpo26Mm11OM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1f8c7aef-1432-4026-b97a-acf9a3d06330@citrix.com>
Date: Thu, 14 May 2026 19:11:11 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] crypto/rijndael: adjust for Misra C:2012 rule 8.3
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <13ca5f9f-d985-41bf-9c30-afd657dade89@suse.com>
 <3ca0351a-8be9-4b3b-989f-0ba004fada2f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3ca0351a-8be9-4b3b-989f-0ba004fada2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0188.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8473fd-b220-4f35-f9de-08deb1e4301d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	fuRLWNmRncmOX80SNsu8teLhisbDl8EHbSP3GbtDtK1DFpfWzxyWz3cE52xLOVcdlWsVnwe+ZVvbaq1hDh7zDFP0Ajm7/S/+lDHLyAYJSmzHTQW+8Kw87nghGJ1+ctzJ3fbYNyugLh0/dJEz9HoNno9l2fkB0JzR/W4nLy5oCWjrsV247bOBXDM/sK4lr5zABknFyi//qHQ1ozKykZMNs2hAEo7+5EFSc+ZmRS+XX99ToXZplpwR2L3l+e7i9CcPzSWwKrie/9GqyumR12w7l6L6p76BDNa2M+ng061C8GNSOUw+/7xBGx6b/Ypcm4wWPhepBrPM+fc8il3kMSVWDtCb+FTIXcDB80q6HnGfIHam2mqh63OAwDHY2/i+tuZoVMFvmZGsi/fOInkBF21Rp5NH+YIIBUqLmEdzie1ztzMPiYL7UQk7sl+zEgWsDKQn7VcnXFh2pP558yflk9p6Z+fZAnmzTTz9yquDat68cTHROY5Za1LMIcScejBQddj2Na0/19UBrGoW+qz+42snZrg6bJYBxhedPr+YMOeRLNpJpn16SOSKq9u52anNvZQvn2dg//kuMX5G9vYNZZAxzHbYA0GxDG1LkGMeBwAIc61vy2g9g5a0QW2HEl6XOGmvOHhMz9zphvN+30kCpNaztiJh4CHrPr2dXcD7aQnu7RjdoSoX1pbFppEsdlL2NM6l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enQwK0pnS21DcUxoMzVqTzlFUURkbzd2aXZQTFdITklkZFc1SUhtSjRURVlX?=
 =?utf-8?B?c0MvcGtiSlZqd0hyOXlwT1prZ3FKUW0vUG0va0RwQmpVU25nQjVzWlJ4aGpB?=
 =?utf-8?B?VlA5T2trTUtFcjEyTVpnbGVIZS9pYUFKaUl1eWl5OERZYmxMdGNNdHNyV0xE?=
 =?utf-8?B?OTBjVmVtbmliRkQvRXRZaFN2Q1FlV0gyUHZMMmxYa1FrZS9PYWlmWjcxRWhn?=
 =?utf-8?B?OVBkZFgyRjk4VXNuTUxSdjBTY1ZRRTc5aG5NL21oQVNBNmFlRmllVURFNlRV?=
 =?utf-8?B?N2cwU1VaeGlDbVNscjhhMXFtTnRSYVRSWXRtV002T0xqaURvU0RGbkNLNDl1?=
 =?utf-8?B?WjVraGVIa3EzOUFTY0t1S0MwaU1nbzNzelBTL2dQMlVpbHMrc2h6bjJxNVdx?=
 =?utf-8?B?K2VML2NnM0NTa3lTT0ZYZUxqZEl6aHl2OUpyNmJSaitwcUVsVm5FZlhwckVR?=
 =?utf-8?B?MDJvbGxpeStPd1VKbTEwaTV1c0RnYjZPblhiYlhSc2tXQ1pKUHhQSmpNVkhj?=
 =?utf-8?B?YmlWMEVaUmFHOThjdHdQTTI3YXpzYmx0aGxSNmczQVNjaGk4SDUrSjl4QzlQ?=
 =?utf-8?B?UGN3MEU3THA3M0k4UnpWR1VXcFNlK1MwN3R4ZWpNRDJ4ektmSGsyU2FWdldR?=
 =?utf-8?B?ci84azFRaGJ1dXd3eC9ncE9XbktoTElUSFF2L1EwcVlCdU5UY2VYZXc1WDRM?=
 =?utf-8?B?NW00eXoyME01Q3QwSmd0ZHlDQzdGTitVMFVQTmhhUE1rSTd0MzJpMEppTnZT?=
 =?utf-8?B?a2ErWUE1M1JPdFZaMks5RU9rRGxZUlNPZ0svT0gwSGY4NjZPS3RZRjdUUTcz?=
 =?utf-8?B?VGtIVmhKNTN3NUJQZlFqRlU1c1Bva2VjL0RBV0dpVU1aZk9LUVZVcUhYaXY4?=
 =?utf-8?B?cTF2TkJLVnVVdjdjM1ZQTEY4RUhHRFoxRExuLzhSZE5vdkV2MWpRbWYwdUhO?=
 =?utf-8?B?MWx2aTdBZk95c05CTWE2ZW9nT3hUb1g0YnJGQlR3eFMrbCtRWTNjV2NoOHZR?=
 =?utf-8?B?dkxmbHRzOFpiK3crU1ZjVVlxY1hvaXE4Z1VoUE5NVlFsRWNwY0FPMTk1bENP?=
 =?utf-8?B?cW5zcFJkV002TW1ReHR1aEgvRityK1k3b2lLTHo2N28xdVdNekxmTmxKYjZO?=
 =?utf-8?B?L1BtL2lWbUl1a09EcXc4bEM5VVg1UDhBUlphVFJrWENEVGtZZzN2U3Nac1Vw?=
 =?utf-8?B?SXpML3VkL21FbE5tYno3TnBOVWg1OE95VHUxLzZMc2NtT3h1SGNSLytOZm9M?=
 =?utf-8?B?My8yd24zVGxhRnNSSDgvYVhTUHNpWGorYmNIcndrZWtBc3I3Tm16V0ljY2py?=
 =?utf-8?B?ZDZ1V1YrWFN2KzY2RVZrWi95UHVVR0hWZDgyTXR1dlZ3NkFjZXQ3TU9Ybi90?=
 =?utf-8?B?M0FDQ3FCVjFqY1V4RmFtU3pOSHBxR2J4cGhzRm5HcW8wL1RGNkRHRHRTY0lN?=
 =?utf-8?B?Z0l2V1dsdGVwRmpiK1p0eTJxdHJkVU5NVTV5ZU1GSlduT1Z0VFpseFFWdDhN?=
 =?utf-8?B?T1grTmRTcnIyeUYwSU52dGlvaCs0ZkNaNURuK2l5Z2FZRFB6d0dJaUFMa3pw?=
 =?utf-8?B?dVpUdGNHR3h4UGJIaDE1ZkhxenppbVd3QWlJK1R3UGMxV1lEMjBNMS9ESXV0?=
 =?utf-8?B?N2pyRkQwSndTbkhhM3pxQU16UlZ6eXRlV0dMWHU5R2pPaWMrcUpwWHlDU0ov?=
 =?utf-8?B?ZVpYZndSam03YUtBeVA5RE12bnM2WkZvWWJtMGRtcm1yaHJFU0pNZE13V3dv?=
 =?utf-8?B?c2RYdnllQmJoY1g5eFhDaFJ5NCtLVTEvdzQ3UGt0QVNCbEpENml2Y2piNnB5?=
 =?utf-8?B?SXQ3czFxSm1VbmJmbXJBbWlZaXlOUnlQWWdpWXk0ZEN3YUNodDU2a1dpWnJh?=
 =?utf-8?B?eFBVdmJQSVNTUnlONnZxdHU2QWdZNXNkTzFXZHBOQThyTzh4dVgvME1OQnFh?=
 =?utf-8?B?L3dya1Z2K1ZWUyt3R21ENG5jSHJxeEdlMDFKUGZhU04wVStLNmdkUlVNbHRV?=
 =?utf-8?B?RW5KUjU0L0pHMWZOSzBzeWhVUUxzaGNqeHhDZngreXhoL0JLb3Nsc3A2Ri9I?=
 =?utf-8?B?SG1LR2w4M3dLSmtheUUySlFHU1FBLzRvbkZvZ0VDbDE3U0dTK0ovOUZ6Zzdh?=
 =?utf-8?B?c2ZkZy9BZzBwTThGa2MzMjJ5TFRTWHdiYTNZaU9RSngybUlIaHN6eTR4MVBm?=
 =?utf-8?B?NkZRdkxETERoWHVKNlJQdzNySWZOVGlDWitCMzFpUFkwYWJneGFWVCtDaHVm?=
 =?utf-8?B?dEZBbWNxaENyVGJ0M3lqZEdrbTZ6SHZSbVJzVUFqUU1QaHFUNUh2ZTdsZ2Vx?=
 =?utf-8?B?NThRSy9OZ2VSMURWYVZ5MXQvczdBR0ZEd2xyZVFLL2MvM1o3aGNKaTJJVWgr?=
 =?utf-8?Q?tPC1wownHLUKuwts=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8473fd-b220-4f35-f9de-08deb1e4301d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 18:11:15.1892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwzQfrSktOYwS/1iIWcikbBung+1ozdsqfqxjUdZd/MUehJi7aVoppp6UZ2GWfvFbLE7SNkhHQmLPIWhIEvfg41HHs9YYYL/5wkGB+IXRCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7346
X-purgate-ID: tlsNG-bad1c0/1778782287-88970A53-333DEADE/0/0
X-purgate-type: clean
X-purgate-size: 1720
X-Rspamd-Queue-Id: 62ED9545BD8
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:mid,citrix.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13/05/2026 3:01 pm, Jan Beulich wrote:
> ... ("All declarations of an object or function shall use the same names
> and type qualifiers"). Bring declarations in line with the corresponding
> definitions, accepting the use of the being-phased-out u<N> types. While
> we don't define NEED_RIJNDAEL_DECRYPT, cover rijndaelKeySetupDec() as
> well for completeness.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/include/crypto/rijndael.h
> +++ b/xen/include/crypto/rijndael.h
> @@ -50,9 +50,8 @@ int	rijndael_set_key_enc_only(rijndael_c
>  void	rijndael_decrypt(rijndael_ctx *ctx, const unsigned char *src, unsigned char *dst);
>  void	rijndael_encrypt(rijndael_ctx *ctx, const unsigned char *src, unsigned char *dst);
>  
> -int	rijndaelKeySetupEnc(unsigned int rk[], const unsigned char cipherKey[], int keyBits);
> -int	rijndaelKeySetupDec(unsigned int rk[], const unsigned char cipkerKey[], int keyBits);
> -void	rijndaelEncrypt(const unsigned int rk[], int Nr, const unsigned char pt[16],
> -			unsigned char ct[16]);
> +int	rijndaelKeySetupEnc(u32 rk[], const u8 cipherKey[], int keyBits);
> +int	rijndaelKeySetupDec(u32 rk[], const u8 cipkerKey[], int keyBits);
> +void	rijndaelEncrypt(const u32 rk[], int Nr, const u8 pt[16], u8 ct[16]);
>  
>  #endif /* __RIJNDAEL_H */
>

Hmm.

The rijndael_encrypt() in context is a trivial wrapper of
rijndaelEncrypt() using rijndael_ctx.  The only user is VMAC which
defines aes_encryption() in terms of rijndaelEncrypt(), making
rijndael_encrypt() dead code.  The decrypt side is even deader code.

It might be worth taking this patch in the short term, but I think we
could get away with a lot of deletion.

~Andrew

