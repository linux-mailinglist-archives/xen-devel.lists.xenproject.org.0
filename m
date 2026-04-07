Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOSXEVx+1Wmy6wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 23:59:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1863B52C4
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 23:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275361.1561209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAERd-0001Hn-5y; Tue, 07 Apr 2026 21:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275361.1561209; Tue, 07 Apr 2026 21:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAERd-0001GG-2z; Tue, 07 Apr 2026 21:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1275361;
 Tue, 07 Apr 2026 21:58:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAERb-0001Fq-Rh
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 21:58:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAERa-00DF1Y-NN
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 23:58:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d57dcb-bab6-0a2a0a5309dd-0a2a450aa192-22
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 23:58:46 +0200
Received: from [40.93.201.50]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d57e14-ee98-0a2a450a0019-285dc932751b-4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 23:58:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB7157.namprd03.prod.outlook.com (2603:10b6:510:295::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 21:58:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 21:58:42 +0000
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
 b=oOiFAQet+oKmMXnXw+pRxN04AnJzwnTzApIer3Qbwbuo1SwvHRImVuT5bjRz/zR3RAY14j6tzhPSIJqUqxoc6BF2PjT6FTdA4Ud3gaEumApix9XSmpWuih3jXJcrMBxKrKu+T12v4P0uXfMqY9giPVfnj1U3H/r7sIcXXc+HfKvg5s63AMkUhQH5pxhiI6cJgqD+nwk0Y/p/jscbw6893Y3q63aPQl6i/tBQ3PvL6lIp7kZBLPvHwOWz+vBW0HB97iIe2+NayYPe2M7aIR+kBE9QQDfZRjxRw/SsPcnXlNwucwD6nKmMSoRaGuq4oTE5oYLIjqbu++4DyIpgcOkg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SMKV+6V9fPJ9bAtiqyRcGIZ00A5uaU7r1e265hdtEE=;
 b=OH3+eLsWTgjihbE+dRDqZ4rtWaLk67ZWR0cdjVQVlc+eKLxEb0ZMS1pgkIWd/Frj/CnvlbhMxBPfSoEG9slcp2YaJ+N978IDbK9TQLTyCpx6fL8pnXaMaolevZYBlrsemtYaM/SgRQsWOXEFb3gPErqNO18m9SdFrsJ5suuGTKuh3g+gx88hyu0FxH18L2VvMpYnOyH1mx/epK1N9iK+UaAX8vxvz0nS9IqHxr3uMj6tr6bB/wKpVqY5DpvO3qyOJPOoS1Pn2caax0OVScpFtogNIvC3DRW/RuvraSwMhKNvv7HgQscTec/voqj1823Zy37qRpEsAFmtTJ3vtcmQzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SMKV+6V9fPJ9bAtiqyRcGIZ00A5uaU7r1e265hdtEE=;
 b=m6cAMsPVwf+aNKusAIjYEJWKK3QynTerM9HnP23Bn6Vf23gMGm1QC66dv7IlVW1WGflYDEdbrVZcuoJbGMMesI3tZB5jBkJUuOE4kVcz9mf8Jyn35FLxZ1a/zhLkhfYQUzl7zsZfW/+Uh+ZT/vEMpZGEd3MoQBNRCa6Hk4jvssc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <48df7b1b-5d07-4eeb-8028-6a90c12a6e2a@citrix.com>
Date: Tue, 7 Apr 2026 22:58:39 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 04/10] x86/cpu-policy: re-arrange no-VMX logic
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <dfa41e40-b50c-4564-829b-0cf147fe3ee5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <dfa41e40-b50c-4564-829b-0cf147fe3ee5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0567.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbab6dc-18f7-41d9-31f5-08de94f0d51c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	W0tFlrTZ+brI7VF662DfqdQKm2DkrJKCX/OVlKPStQaSmghwtM/2jFKtTvg1hr6l+bUM5d/+g7wY/eqfeHa54Fml8VXTyShntC/AHGwFWWMqTeP1FoxjXSIVZX0cJXerBHbFwXDPYjlJQl6E/grEqKz1r9mBsJS5ZeCmPOINTaErwjyIrFZqmwiCULs8eYCVhqNhQiZVVUbd7mP0ygFI78E6dZzqbm8DK0REx50I17WsxiUUOgKg2/PnbNfEVTC5O6atU3SEBDAJMBKuiwYcQt1lCoegYhvT8DR8mO/ngZpivwnx5Zmva0fDY+B3s85x3qoefdDPwGJGqP3xT60B610hKxN82k4Zc9FGZuZYI65KtfZl/wo8GBHFiSra4FAoxVphcpBL+KOwrtNRnxKiVhoalECxo4XNrA4fnKtuSRvdR/zDmNN5oIzcgjA+kVLrhIRg1btgjqms8KlHjt30kp9QhG+g/AJb2bNkrrTLZzBnMdYKjTeD0kKNuURs+HZVWnaCNYgAa6mxTLrkI9nbxo2Q+oSHXe2QQAweeoZC6Mmdkc7noTlhURbNuAsSsJPqYxIcCbSqjerffK+zbnpGhWY5q719AaZe1UhudphcMpD1Mm4zUZjqR1Zuz2bizifDB2bSPgWr6DcqWRciyUC6fyhr+FIV2NYyzZY74rM9OD0WAWrxhI3Zz6LL8nzQww5fdXN0Z6e1KvCDhs8C/Mcg2qsB5sSBis1jHOSAq7Qwrn0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0VIOU1YaUVUUFdRUEJncnFCaHVtdnlROHExZW9VNzd6YklWbSszRC91RjEw?=
 =?utf-8?B?aXY2V3plbGRXMExZTkhzWlEreUhlTHAxWTRjY2xXNXNiNWd4RFRNVTc1M1k1?=
 =?utf-8?B?MUlMRmdVbEw3UXhOSk0rN1IxWnpSUENxaHI4TVUwZG9mWE9rM3J3Ukp2d1FR?=
 =?utf-8?B?dndSanZlYW9vUVpXWU1ESkVYQmErbkwwWWpBYzdXTDVrenIyTlhocVJHL0xa?=
 =?utf-8?B?QU4zcE05bWJpNUVDaG1mcEpKZm1SdHFidzdwb2RqVXEwcm9PSWMvc0xLRWZJ?=
 =?utf-8?B?WlVubXBleVU1UUpZZFBOZ1Q1ZFFnWG5aMGJOWHZLWGpxMWFVYXZuNHZMc1hv?=
 =?utf-8?B?cC9GaW5LTFVDSU95VWxTNXZyeHV6RHBJVUdPM3hzK1hJRXMzSVJTRzAvSHRT?=
 =?utf-8?B?WjRoWmdPejZOZEo3R0k2aUFXby9FSFRqTFdNSXJxUkRCWlJucFBDTXBUcDA1?=
 =?utf-8?B?VmFISEYwSFV4c253T2pheGxUUjJLTW5vRExiNjNVVzZXcVlQSWdJeEtoZzM0?=
 =?utf-8?B?TlJGQ3ExTUREM3hPUHZqV2lTdG1PSnh4ZTJBYjlyL2loMkFvbGd3bnJjbmFz?=
 =?utf-8?B?QWtndlBDYVlmeXU0RUMrN2krbFpyQzc0cHZqSjFnaHNseU5Bd0dQcFVBNkRn?=
 =?utf-8?B?a2dZdFF5aVpqVXpBZ2xIV3FqRTNoZEI0R0RLbTN0TldwU2RvWjk1MUkrOG5Z?=
 =?utf-8?B?dFdWRTluSVZOQzl5Qm5nZmFVdWdDdVJiQkRlcWFxZHF4dHlpQzVxNXZNRUNw?=
 =?utf-8?B?a2JIVG5BdS85TytDNjVkMVJxNXMxSkV5VmZYZG1GaVJxc1Q3Q01TNklVaDBI?=
 =?utf-8?B?cjlFU0Npa2lhaUgwb0ZKZXRRQ1VpYXJIRUhiM2g0K1grOFIxaStXNWsraW5N?=
 =?utf-8?B?OC80eVVlOXY3UEVneEI1aU8wY0QwdFJicDV0Qm1hUFNZSGxHNnlzVkFVU3ZS?=
 =?utf-8?B?aUtqcTFmRXlIZ2dUMmRuQ1JFZWhsZ25OWXB2K3lvek4vb3ZFZ1hRUE5ON0wz?=
 =?utf-8?B?alR3QzJic251UVkwcTJMTHlNakRSSGUrYlBPMmNza2J2UDFrd2pVVjFTemlr?=
 =?utf-8?B?WXY5WFZuenM3cUI3WU5odTRKSFZXNE81dktvRFJBWWFYNkF1Zml6RmtTNlNr?=
 =?utf-8?B?UkptYjJxc05vRWcrYThoU3BvN2JSRFluNk5SY0RRSUhsZ2paZG5KTlpCWTBJ?=
 =?utf-8?B?N1U1VmFEN2lVdjB0TWtYaHBxQUFHOVVxWkhNTk5UNEJUTEZaQkRvdjE0VFc1?=
 =?utf-8?B?VUVKZ2diMzFmay9CR1dtZGFrVEpSKzJIU3pEZjg3Vm8xdFpUVi9FVDFrNkxX?=
 =?utf-8?B?SVFWVVYyUTlVTHJVZ2dhYURFL0I4dmxHREloMDM1M3RvRTgwMFFBQUUxaldD?=
 =?utf-8?B?WkJSbzI1ODUvbkpac09OcnRzenloYXRmTDR1SDZ2QXVrWnd2R2hxd2VKU00y?=
 =?utf-8?B?NHh6eFA1MkpVaU5iMnZGTE56TmRUdzIxb3NwWDJRV2NhY1RoV3cyZzBNSmpW?=
 =?utf-8?B?dk1xSUhXWUxhaVAvTitZWHBseDR5ekVuVjVJNVFmM0JWYlA4eWkwYkdDc0Qy?=
 =?utf-8?B?ek1SUkx5cjVzUGdEUXNzL0xaK0NxcFBJS1ptb05BTzVXeTA1RGxNUlphVE40?=
 =?utf-8?B?Rks5R0NFWlJGbzZzbWQ2R3lEczJYYWdGR0pkblBKSnpyNDh2VmRZWml6K2hD?=
 =?utf-8?B?M3VsL2cyK2kwVWN5R21KdTlxRmI4Y1VGbUp0a2FHRy9RR0I3cXNRd0lMcWtl?=
 =?utf-8?B?aExFRlE5K1B1VUMrU2RKUHYzYWhYMlp4Y0RiTjEvdHNzM0JpNmR3OGFGbVlQ?=
 =?utf-8?B?ZzB5NFRpSUlld0JWb2hqM0FybWROZHV2eHVFSmhpMkpya0s1dGl3eWlRMkFX?=
 =?utf-8?B?TlEvR2dQUXlHclk4Y1ZJckhjeEFwS3U3bHZ2diswUzVvNm9lUi9taG1Kends?=
 =?utf-8?B?ZzhXWmVWMmpXQnAxSnJLdEdrNjI4T2g0RnpvRFB0TUg4U1RnM3RaWldrc3dG?=
 =?utf-8?B?cDgyRUFSMjIwL0p5eXE4dWRFY3laeUkydThxVkptT3praHdzR1NEWHF3KzR0?=
 =?utf-8?B?SDU1N0xVRi8yQ21OS0hpQjFCbVV1YjlwMityZVJEbW5YU2tXUnRHa1ZLNkZL?=
 =?utf-8?B?VkQ1UXdRdlNrT29RZ1JsTW9keUNUSEY2bmptU0NNSjNFQ0gzT2RWUVAvYzRy?=
 =?utf-8?B?WmxWNk0rck9XR2tTaDhySVQzd0hQTzV3OVVDM05Nbjd0aFBrditwU0l0d2lT?=
 =?utf-8?B?VTZ0KzVtbzJVZ0MzbnhhVnhocldMNDN5S3NSWHA2NzBRclljZUQ4NjVZZ3lY?=
 =?utf-8?B?anA0b1R0S08zeXkwY2JUaldML29WQ3hsUWU0MTUrckVTVjhhL3ZyMG5hTnlt?=
 =?utf-8?Q?JrHdMo8D+j6RGWEg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbab6dc-18f7-41d9-31f5-08de94f0d51c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 21:58:42.2818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/KIDVJrvbb3RjgabI5ttZJob7Wm7SvFng5B2shKTtMdHzNnKrNZ04hr5vD520Q++HPrMwrLq3RD2JzpVMeuwzd1iJnurMC9c5PP+e3eEo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7157
X-purgate-ID: tlsNG-4011c0/1775599126-0DD520B1-C2A03988/0/0
X-purgate-type: clean
X-purgate-size: 3048
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9A1863B52C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/11/2025 2:59 pm, Jan Beulich wrote:
> Move the PKS check into an "else" for the corresponding "if()", such
> that further adjustments (like for USER_MSR) can easily be put there as
> well.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v5: Re-base.
> v4: New.
>
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -812,19 +812,20 @@ static void __init calculate_hvm_max_pol
>          if ( !cpu_has_vmx_xsaves )
>              __clear_bit(X86_FEATURE_XSAVES, fs);
>      }
> +    else
> +    {
> +        /*
> +         * Xen doesn't use PKS, so the guest support for it has opted to not use
> +         * the VMCS load/save controls for efficiency reasons.  This depends on
> +         * the exact vmentry/exit behaviour, so don't expose PKS in other
> +         * situations until someone has cross-checked the behaviour for safety.
> +         */
> +        __clear_bit(X86_FEATURE_PKS, fs);
> +    }
>  
>      if ( !cpu_has_vmx_msrlist )
>          __clear_bit(X86_FEATURE_MSRLIST, fs);
>  
> -    /*
> -     * Xen doesn't use PKS, so the guest support for it has opted to not use
> -     * the VMCS load/save controls for efficiency reasons.  This depends on
> -     * the exact vmentry/exit behaviour, so don't expose PKS in other
> -     * situations until someone has cross-checked the behaviour for safety.
> -     */
> -    if ( !cpu_has_vmx )
> -        __clear_bit(X86_FEATURE_PKS, fs);
> -
>      /* 
>       * Make adjustments to possible (nested) virtualization features exposed
>       * to the guest
>

These clauses aren't logically doing the same thing.  So while the
compiler can merge them, I don't think it's a good idea to do so at a
source level.

The "if ( vmx ) " block we can just see the end of is for features which
need to cross-check extra VMX capabilities.  Each of RDTSCP, INVPCID and
XSAVES are #UD unless explicitly enabled.  MPX is the odd-one out,
checking the load/save capabilities.

I suspect this list is incomplete.  These cross-checks shouldn't fail on
real hardware, where the VMX capabilities should match the native
features, but nested virt is rife with enumeration bugs here.

The second "if ( !vmx )" clause is different.  This is really "I wired
up PKS based on how Intel works, and if AMD ever gains it it will
definitely need context switching changes to work".  This is in lieu of
having dedicated Intel/AMD annotations for features.

The MSRLIST addition from the prior patch is arguably misplaced, except
it's trying to cover both of the aspects.


AMD are making no obvious moves to add PKS, and I expect MSRLIST is even
lower down their priority list.

Overall, we need checks here for every guest-visible feature which:
* has VMCS/VMCB controls which are enumerated separately
* needs new context switching considerations

Maybe the "if ( !vmx )" shouldn't really be written this way.  I'm open
to suggestions, but making it an else block isn't a solution.

~Andrew

