Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IibKbZ6wWkQTQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 18:39:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175BF2FA1EF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 18:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259552.1552858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4jE4-0003KN-7j; Mon, 23 Mar 2026 17:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259552.1552858; Mon, 23 Mar 2026 17:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4jE4-0003Iv-4u; Mon, 23 Mar 2026 17:38:04 +0000
Received: by outflank-mailman (input) for mailman id 1259552;
 Mon, 23 Mar 2026 17:38:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w4jE2-0003Ip-Ua
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 17:38:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4jE0-0047fX-NV
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 18:38:00 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c17a6b-bab6-0a2a0a5309dd-0a2a450193e0-16
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 18:38:00 +0100
Received: from [40.93.201.66]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c17a76-6400-0a2a45010019-285dc94297b0-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 18:38:00 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5939.namprd03.prod.outlook.com (2603:10b6:303:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 17:37:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 17:37:46 +0000
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
 b=RGqEOgnucG0ivGgdB1NUMznOL02wmPpsRj0QPNa1oQDUjZ2xg7b+ICT2s9Afegu0jvpazUDeG2dS/hY9lSs5UKF2Qj8a/Ogsm5S+IvTvTNxis51EVbSfZ3LCHyEIhrMSn6a7eTDY2UvaIXc2uRma1eWD+n1tpKWfF+wMlhLp0h7UahqF1vOKaS4Bd+nTXkUACy6o7hEj3sH+HfsRu96ieeHs1d+9MZzQAQSLacsdckCS9NgkPs3otenKYUJ74iqzvPZf+9oOdETkCeGwzsYHv/tRVfcCaM1zMuW2ZI2AtSoRY0E3VUg6OgiZakCg7GRXAT4fWs0IhCm2Vfp1Hzyf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aO9mnmLeJLlyU3pZceix8qvqd7F6MO868OjeJHrrzns=;
 b=EBaCIQ7VwqcpDdmHCtWRwUAxitLsiWHhubikGxUbKGqRGM4ub7UfNBJYtVG6+j7R4v5q4l46yPzoEGROtNBS8f0SjCImCOBXexVcw7m0ukM7ZkLzkdd5e3jFm6WXpkeuaI0xLi26nMgHc4AOy472A5L+Ahht3/vl7aL8RoVisViJNQoYDvEBv9U+cxI5nACwOIohj/PDsonxKL6X1xv3uXdLPLe29+7rtyZwbCwI/VIuOw3JMhBTMf1uwBMBrxQZZ6as+N465xWl/4WZ8XVTV3z+r/mTVL2Y0iEPCLFt+cDNeAGOyo4oMDyQwcucHH4Fp0l4g7cZKWEkm9K39B6DEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO9mnmLeJLlyU3pZceix8qvqd7F6MO868OjeJHrrzns=;
 b=l8FhYrBfiA8i0BRkEmy9609uHE0keA/zvs8jHpaCY+kN8Vv1Xtb3x/SzdDRFajnJfmIm3SB+D9pQc5ZmjZ/jOuIFa/gzFgkNmB5Dur8OCCcDT4IoETDRsXyYRkiLcPYLdBb7wSXiu2cc9Yn5G0qhFfAlsxyKLdxGW4ZRZMjhO4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a16e4126-5eec-4c9e-82e6-afdc0fc410db@citrix.com>
Date: Mon, 23 Mar 2026 17:37:51 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/public: Delete duplicate VCGF constants
To: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <20260323152856.966730-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260323152856.966730-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e79c52-ad6e-4078-ed12-08de8902e56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8LyL+MnrmdCrFi5XF8YpDj55FKfg1FuzKr9yGxX1aM/69iwbhSNOV7+ClUPiszWjBatB8nceTO3LtBlMXiSZGVnkGwTSg8FX7z1VoAeWWMRGCuhn+lDexNmfuknvHCx60pEE3cvfFic4sxQVdlUv+ioe/IWn69MI+N9NM7qoCTqMF2WOKZP/teZfrNpcXRX75TyN0yyng1s0nz3LBgthxdzDFMLgTMNrka6Kh0lTIq577E2KXYMEYgYDiruma+bxV8adG+ReEcH4nfLzO5bUXyT3YnEN28n2fqmjuSU+UMLion1K07Va2cQZEK9Vmy1a1sCUGFQJGelj0tuPf3teWqjjaCUMAVGd/NLMTAHwWutofZdudKu6gn4BVqI0iYSUFUZnKjc+zU0V9vGYeos5AGXLLrLz/tpiy3rkscOdyTiPQ1XzKFGBkz1aurVAWekSl4RzXMKDyp22FmKGSxsx7nvw1XqeOo+3buQxOLCE6ScVtsYbZBr70eiswPIERm2HCsjyqsS+i0+rnY5kGSjrEoXi8BPc+tzBbOHDqaQEf6ZARp5PRgX3xZka6TWcpq7wjNzAY1w1X/+vvw/2muplyAbCVNVEuq/SrNUNrINRW5bD6O/WLGqfzrrtEqeq46NYkYVSVFKz7sgcEBg8H0tQuABhACVNVE1PUtbifgUhsIHVpSiCrc76g8NcW5JZdBUfvI02E5Lw5FzZ9k5TZksud7pGelJQOQtaSrY2qECUP4o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk9pSVJud000M3RyM2RUemJlSnFEOFlGS1kyckJGckxuWmRTcGFvOHJDa285?=
 =?utf-8?B?UHFCRjk2aU5QaW15STRnK04xMVl2Ym1OQnZqYk5kNTNpS0E3STVCSzlkMXd5?=
 =?utf-8?B?dEFZbkt2elJyTGVqT010aVNmSVRNa3dzTmtWbkNGbHBYTkhYZGFUU254bGdj?=
 =?utf-8?B?bC9JbC9tWU9BMWFFUHZRajJRZnlaeTJzSk1yU3BCTDF4bWFtbFZaK0ZvZUlI?=
 =?utf-8?B?ZC8zUTVaK1ZEalk5Q3p1LzArRXNQd2FEc21sOFU1Y2t1aERlYkEydHN1bUd1?=
 =?utf-8?B?djlROHB5NFpCQlJ4L0czdk5TRndrNlpuMTBwU0cvY09HQU16bTN3bENmaWpm?=
 =?utf-8?B?Q0lVTlRvZXhmLzB1MFFOYnZ0UHN0MWJHQUt1RmdSZnFVZHJQdDM2Ny84Q2Vi?=
 =?utf-8?B?dTFpMmtpbVUrdEx6bVM4S2FrTkVCWVVKMVZtdzJoUE80b2hZYy9oWTUxVHhr?=
 =?utf-8?B?MVE0YUsvVG9lUm4zajZQN3I3RWhOZzlPSDJJeDN0QXlOS0RuWk11QTlIM0tE?=
 =?utf-8?B?S2dVMVNmVlZtc1E3dURzMVRyV0w5Q3ZSRW1lY3ZrZmtvL3dEeTNETnlVL0NH?=
 =?utf-8?B?UGV0a0t1elltWERVVVN4WUtTNThhMGFvUVBseW1LVEExaVZXTG5CcHZPaENj?=
 =?utf-8?B?eGRwRW40SnBjN1ZmZ090WG83cDY4TmlLQ0R1NnVuZzZZMTVBekZCa1UyWWVG?=
 =?utf-8?B?Rm85WEhpS0dRdElPSzdVYzFhbllxOTJXN3BrZVNrc2tpV1J3bWs2d1FiNFdr?=
 =?utf-8?B?ZlhmTkNPNjZsTy8zSXBCWnRuNHdTRXoxUkxBWDA5eWdJOElObjdoTVplOC9X?=
 =?utf-8?B?azBJZlM4bnlRR2FqNHM3ZDJEb1c1RW9xYkJZUm8zaTNBOFpUeEhHdlp6N0Vi?=
 =?utf-8?B?WkZjY3p1UjJTQVVjV29GSWwxVW9QakI1RlFGSHpPdDBTTU9nTnR4dEN6MFJ4?=
 =?utf-8?B?bGRNWEp5Rk0zVjNzeDVveWJ1ZTRmb1ZoZWFkRGhoUm9jTVo5a1FranpJdHBN?=
 =?utf-8?B?MUFOMEZGaFFqaG5HNHZFN0xJUlFMM2gvaThHbVZNczNOblloNDFJVzEyVEZQ?=
 =?utf-8?B?Rks0L2t0SHVEVngzZDRqTVlxRTVMRVBFQkdZUlhtWkNZODdFWklvU29RbXU3?=
 =?utf-8?B?QmlDbkQySk1pYkFxZVZ0anljUEYxTFdmV09pUUJ0anpISURyUndtZkFRK3dK?=
 =?utf-8?B?L1NCSGhqZmdYNVVEYXpYZ0M3bXJKSUZGdjFXMnk1dFU1M2VyZTh6cDl5L283?=
 =?utf-8?B?NjViL3QwbGdwMmwvblpabG53Vk5CTnNtR3RLMi9HeHl2OFN5Q2tNck9LaTRV?=
 =?utf-8?B?V3p1WjdGYjE2L2ZMaHRoWU5zdFU5VXBleUI2dmZvSVFtWWxJSGNCSzl2UU9t?=
 =?utf-8?B?SVpSR2o3KzlQbTY5eTZWRkRhV3pscXJOUUtoREFlUDgwanNqeWVwZkptdEFB?=
 =?utf-8?B?MWRocG9IcU44cjFvSDA4SEUrZk1VdzQ0SnN4Q2pQc1JkVmJVOWpCM1VMVmM0?=
 =?utf-8?B?c3UzcVYyeVZvZUQxL1hLTXV2dlR5N0pRZEJ2blJvVWZtc1BCcVZDRjMybGgw?=
 =?utf-8?B?ZTY4SCtqcnBTbUoyekRyUnY4SjlKOXQydlhxSFFpSHZ6TjhVTVFpZ1FvT2hC?=
 =?utf-8?B?eEgwS1pwdlQvNmtLNVR4LzBWdjFIZlNJSTZyTlJta09LUy83YU1XVkY3WlZQ?=
 =?utf-8?B?cnBEMTRmNzl4SzF4bFczdlVEcTJsZlZ3SDR1TGdHaklKenVlVXJMVkVnV3ZF?=
 =?utf-8?B?RXBlZnJCUXJZRHdrWk42bDB5Q2JlMzZwN1hhc3VLQTF3dWRMSnJNL2tIcmp0?=
 =?utf-8?B?U3BBdTBkejNTSk5adnRzNmhrWEtwNXV1MWdoNVhacUdHS3dGN2J0ckZYWkdl?=
 =?utf-8?B?VThuQkxrZDY2elZJUnNaNC9OMkIwSDN5Y3VZaVl2RmE1WnpRcnkrQ0VXeFlB?=
 =?utf-8?B?aUl6RDRtQ3FCREFMS0xzaHVHQjJFZkR2Q3ljSkh5N2lnbVp6K29tZEkwNWZC?=
 =?utf-8?B?bkdXbExiZFp3Y3gzRlk2ckRKTU94ZFhOTmEraHpod09GaEdsN0EyWjFqNWZl?=
 =?utf-8?B?ci8zTmdQVS8rTkwvZ1ZPKy85SjhzL2ZibDZUVlNYTHZFMVJOMGxYc1RtR0hw?=
 =?utf-8?B?REN4MUlnTkorL00vanIwWWd5L0ZTMEdEaDZsK2RkZEk4dU94WmVvN3hpY25u?=
 =?utf-8?B?dER3c0hsVTI3MG4zb1QvUjFJcm0rcnQ3STd6T1dMbkZjRXZydENBN2VKSWta?=
 =?utf-8?B?NFJxNFRDN01CbVNEVnFDbWozTEgxWWV0Q1BhWktDaDg4bTAwKzR4TFN3eUxT?=
 =?utf-8?B?VEc3bVJXN0MxZnRFN1I5SjNSaW95UmlINmtXL05POE1pU2I3RFBEOEYxM2pB?=
 =?utf-8?Q?F1AcYD5WviuF6DLA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e79c52-ad6e-4078-ed12-08de8902e56e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 17:37:46.6231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvw6kh9QyG9lig/n+YK4FSVvvydWPafsFsf+UliyGCiBM1IUV0N6y2mXLSOwvtYhWQIszt7/SE6ux+BXXbyZLR5YemUg1uVXdx+PAx/zOyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5939
X-purgate-ID: tlsNG-d62444/1774287480-200C9DF3-52AC51D4/0/0
X-purgate-type: clean
X-purgate-size: 2921
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 175BF2FA1EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23/03/2026 3:28 pm, Andrew Cooper wrote:
> Having two spellings of the constants makes following the code unnecessarily
> difficult.  Reduce it to one spelling.
>
> This is an API change in the public headers, but one for the better.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/domain.c                    | 2 +-
>  xen/include/public/arch-x86/xen-x86_64.h | 1 -
>  xen/include/public/arch-x86/xen.h        | 2 --
>  3 files changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 4664264b2f5d..9ba2774762cc 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1246,7 +1246,7 @@ int arch_set_info_guest(
>           is_pv_64bit_domain(d) )
>          v->arch.flags &= ~TF_kernel_mode;
>  
> -    if ( flags & VGCF_I387_VALID )
> +    if ( flags & VGCF_i387_valid )
>          vcpu_setup_fpu(v, &c.nat->fpu_ctxt);
>      else
>          vcpu_reset_fpu(v);
> diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
> index 75f121be0e14..9f33d80d3135 100644
> --- a/xen/include/public/arch-x86/xen-x86_64.h
> +++ b/xen/include/public/arch-x86/xen-x86_64.h
> @@ -103,7 +103,6 @@
>  /* Guest exited in SYSCALL context? Return to guest with SYSRET? */
>  #define _VGCF_in_syscall 8
>  #define VGCF_in_syscall  (1<<_VGCF_in_syscall)
> -#define VGCF_IN_SYSCALL  VGCF_in_syscall
>  
>  #ifndef __ASSEMBLER__
>  
> diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
> index a7bf046ee006..4693e47d204c 100644
> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -160,8 +160,6 @@ typedef uint64_t tsc_timestamp_t; /* RDTSC timestamp */
>  struct vcpu_guest_context {
>      /* FPU registers come first so they can be aligned for FXSAVE/FXRSTOR. */
>      struct { char x[512]; } fpu_ctxt;       /* User-level FPU registers     */
> -#define VGCF_I387_VALID                (1<<0)
> -#define VGCF_IN_KERNEL                 (1<<2)
>  #define _VGCF_i387_valid               0
>  #define VGCF_i387_valid                (1<<_VGCF_i387_valid)
>  #define _VGCF_in_kernel                2

Juergen, as a heads up, Linux has one use this:

linux.git$ git grep -e VGCF_IN_SYSCALL -e VGCF_I387_VALID -e VGCF_IN_KERNEL
arch/x86/include/asm/xen/interface.h:216:#define VGCF_I387_VALID                (1<<0)
arch/x86/include/asm/xen/interface.h:217:#define VGCF_IN_KERNEL                 (1<<2)
arch/x86/include/asm/xen/interface_64.h:78:#define VGCF_IN_SYSCALL  VGCF_in_syscall
arch/x86/xen/smp_pv.c:247:      ctxt->flags = VGCF_IN_KERNEL;


That will be easy enough to fix up when re-sync-ing the header.

~Andrew

