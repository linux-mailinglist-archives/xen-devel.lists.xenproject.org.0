Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEc2BL3iDWpF4gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:35:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D45921B5
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314175.1584164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjsg-0007Wy-Fe; Wed, 20 May 2026 16:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314175.1584164; Wed, 20 May 2026 16:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjsg-0007Vq-B9; Wed, 20 May 2026 16:34:50 +0000
Received: by outflank-mailman (input) for mailman id 1314175;
 Wed, 20 May 2026 16:34:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPjse-0007Vk-3f
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:34:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPjsd-0079rN-5M
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 18:34:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0de29b-e002-0a2a0a5209dd-0a2a4501da0e-12
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:34:46 +0200
Received: from [52.101.193.56]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0de2a2-c1f2-0a2a45010019-3465c1381991-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:34:43 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB7656.namprd03.prod.outlook.com (2603:10b6:8:1f3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 16:34:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 16:34:41 +0000
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
 b=Zk0z1Rnp9JxuostBLbCxAS3xY8x1QgL1oitQfB1qrMnwEw58NWJTb8mDckfhgHO6v4MImFTNR3PhRwjrSN0F32v/uwQcTUHMki2qIfXS20FSiqbv12TrIszIENVIO/aA9Z0MOqDB6K0Z+NXkeqRd7C6XWJGFyVC7X8K2AK/9qGISqbwo3w0pVTw+0LWxK3weqr5Z2M1e83oyJvgAFOvIhM87NXWnIn/9JZJsx3EczHDzAQvmbEzaavQdaYXx81i7LljrijXCC0g6xj/rchMbaqUjXPQan1TQEidchAjTG7d8fk3oSyZ93aNm/UMHjvnm0O/7ElVnM9hNeZExh7+gEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJ2wQpAUwCmGegJ3HAkRDiyUEv0uf/GhBvx6/g4X6ng=;
 b=JVAOsA0g5OzPcvE7QDUwSB7uF8ozJr93tL69LMT8hq8GAZDIo2IwGDgh9bl43YxKxbq0xzGwgWIOBF3gAo4VTt/id6E04WNuteCF6xMNv+QQRNcDcD8oWhk7ZRg4mHwhDE+tpI5v8eWmfvzY6Pfm2pOkViYVrHlZrAS8PNroqg7ILiHf4VHfRkGUiDGITqdA7vKYkXSMMndfbya6rhPJjVZee2HFghEI8JzOeowpFYjOLz4BTU3K7pbhrtfuoEWge+rHQW9t6yf1FgVX9W7SKaiDHkSetfw7iq28DXnPsokQ/q/uYYzwn6RB61Ur4haBHbqxvPZSJNzBgqZpOMKkZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJ2wQpAUwCmGegJ3HAkRDiyUEv0uf/GhBvx6/g4X6ng=;
 b=lbrCu9MbpAh1bGYoRGedsDAVkhwlXPiuGbQrqby+tQWY5jtNmg8aQeUch2K7Pvgw0cqyOi4axNxd9UVon2/C+Nn365in4ThgXKt0HnxYlzgcwRY0jPLMos/1ATf4UM6w5CstVHhMLFkRyEwDGZI/tccGapmnTW6RlXdxEZTz+/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>
Date: Wed, 20 May 2026 17:34:38 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0512.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6511d8-d25e-4039-7fd4-08deb68db120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ePZLAsnVdMFgYylG70hT81MI6/iZXSialMHRH/Q3TVnQ99M25Y9TUKuLmt4JvuoQ8rvl+15hLGwUds0LhR5zdnxLZYU6zFQdz69fmRE+yiaaxFK+sojeo9SR9KBYwQlVsTzz4iPh02I1IBJqSpvl7pmcAK2ZhyFkshpI+JIHLvAy2Am1+T90Pj9FYTWoyPL9+W5UMoidrBYUKZu+Hc+f/hr0ambjG34ew43ErMjOR9rwoFOyMxtD9xw5wSsdo0/xw+rN36ETojphg567/GLVpfzS8m2ePTsj+x0H/k7Phf3Jd2XbxeS8VKQmoUJGBfvtZEqqCAxJu6wuB23udRnY9xRoVrb9DX7fzfqLZv15LqKjjWwQcrM/1/oyY33u1FC2AOlELQUNkaZjYuBa5BN0oZXqgeU0KLXtKoVhKVGByq4L4TJe+9vIIT06+lKk3/Ijq3+zS3w4RxmpJDiCjEk7dt+y8Md4whSjF24peP0XXxBFlX69l5O6oWbkj9w0KgRZwadAbZmLq7JJwBLg4u5P5PK8+ySYoXGyDVvWHutFcKgO7Rght+WDfsmWOcChlORW3M68O5avXIH7GVr+0e6tZv021FpFJOxbXihrDeFf33v8HEcA+h6z1Ru30e3RuxZ8xrGxCzWZ9duVtP43BroKNRo/zsqNnpfQaBpKYxhzFusOMph6lBIwUaja5L5JsUDa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXdEUjlpbjN6SDVhTmxYNGh1ZkFiSFhkYzZ4dEs0SmN1L0M0NSt4ZVhmLzI0?=
 =?utf-8?B?NXVqbnhSTmNIVGZTOUlielBFQ3h4ZC9sNkhKaTMvcmltZnBNcjJpNUpCa1F5?=
 =?utf-8?B?WTJKZy9MK29SU1dlek02V2tKdVRPZ1pzcHp4bzFOMW5WNEVSSnUrRC9GV050?=
 =?utf-8?B?WGNtMXhtb2JBWHBWQVlmamtCbDczVklBekt0ajRoc04zdWM1ZU14cEY1NVBS?=
 =?utf-8?B?MFBhTXZXS3F2ZzVnajJocGNBaXJwTnhSM0VMTUhMTXpaNXBwUTFKK045c1dx?=
 =?utf-8?B?NHd5S1hPWmQ1WUdpRXdaSnh2NjRTUHd1QXJBYmg5ckR3WGZ3N1pUT2YySUpB?=
 =?utf-8?B?ZE5wci9wWU1yb1Q2cWJLa0tET0FFUXJSRzJkbE9ic3llVlAxMWZ2MXp4RUty?=
 =?utf-8?B?VWVVa2F3ZUR5azBsaHVpUnlkenlQZ3FCQit4ZXZ3WXlROGZPeEdxSk1kdmJU?=
 =?utf-8?B?TDRQNDI0Q0JnL0pRU3RwZmxLY29uU01BWGRKRXVzdHhBZHNGd05tbVdkSjhx?=
 =?utf-8?B?MitWbFRJZmxBSWlwN0k0bzY1bkN2MitXOFd4WExaUFJCeDhHY2trSVE2TVRH?=
 =?utf-8?B?VkxHUmQ3QlhhTmZwRWNBVmFabitqOXF2M0NhbkMxcXNhTUV2c3JralNaNGFV?=
 =?utf-8?B?WlhVTE1ZRjNQbUs1UjA5L3dXS0hMNE43VStsOU8xUy8ydlYzUVc2c01ORHF5?=
 =?utf-8?B?WnFLanltT2JnRVg2OHd6alVVSXBqaktIUXk0eFRJL3RuVjE1dysrWkEzdTVW?=
 =?utf-8?B?NjF5NUdJYmd5YmpaMEkwSGF4QXZiaUJ1QTRWaTYzcnJlVGc0QXdjNU9qaHZ4?=
 =?utf-8?B?OFZUV1ZxTGFlZzhyNjVmbTVTS3Z4U0ZzbVloaE14SGtkQUNtZ1V5bHRZdzRi?=
 =?utf-8?B?NHp5Y3hHV1lDV2Rpbk5rYzNGTDNhQy9KSEZqYVBpNXBWTWhhVUl3UlowRVVn?=
 =?utf-8?B?R1ZUWTJyeWg5VWlXN2xIQTlyb25rOU9LMlJFTkVjZEl3SlRtNG9Qc2tGWGxy?=
 =?utf-8?B?VWpGZk1KMGRMNGZRc09XaVF4NnFUekRld09kdlovK0VRMEpET2FrNmp1bHBB?=
 =?utf-8?B?REhkSzVIKzJjdnJkQWV2dzNZTDUvNGJjTUd6WEc5NXlGaTMwUyt2b0c3MkE5?=
 =?utf-8?B?M0RvS2RCcDBzeVk0MklsdWNuMnY3cENpR3AxZ1k3VGVzSUhhQXYyNGROZ2Er?=
 =?utf-8?B?dHEyanlmOTV5SFFIaVJ2aUdUaW1QeDdzMVYxaU05ZGRRN3dpK2Z3bjl0UGZk?=
 =?utf-8?B?MXFFVFZ5dXY2YWFiOVdkUHZYQWM3WnRsUHFvbWJOOUphSGUyNlM4N05QUnEz?=
 =?utf-8?B?NGVNbndTNDJ4aGJFM1RMRGhNZGNpYTRZVDBGWVR2bHRDTGFUaUZZTTNjK0o0?=
 =?utf-8?B?eG5hU3VnaWozalNySG5vM1p3eHdPMmtHS2l2Z2VFRWhwVEEyR0twZVc4T1F5?=
 =?utf-8?B?b0h1bVA4bCtkWm1iVkNnSjA5NjRTVUh1LzgwSlE3RFRTaFpwaVQ4MUpjd1lh?=
 =?utf-8?B?RldEdHRJb3hacWw1WXV4d1E5YW51clpyUzNDdDg0NjVZNTBrTURiaE9mWm1l?=
 =?utf-8?B?OVZyVTFHT3JlM01RcEFKSW1tK3N1K3d0NytrWTRpSFNvRThWUzlpVzQvK1lO?=
 =?utf-8?B?L2NJWXBGMDR5OUVnR0Q2R2JvYU1XWUkzK0lzeXZnNmxtdHNYLy85VnNzQmN4?=
 =?utf-8?B?TGx4Y1cwV0M5clM0YXAxMGJaaDVTQk1kaGQ5QkMwZUlocjV2MlRSQXUyVEF3?=
 =?utf-8?B?Z3c2emRnNHJEbVVEczM3TytsQzJORU9GVmh6YS9LamcvWU5UUE5OMmZTUEhC?=
 =?utf-8?B?N2s3eS9RL3V6d2tBY1pSazN4cXgrNGVoWjhNSEVnVFp0ZG4vSkdybHVYeVBz?=
 =?utf-8?B?SDF6dTV2ZFJORnQ0azluWG1aMENqdDE0VkZjVDJFUTJ5Y1JiWEQveitpbVR5?=
 =?utf-8?B?UStzcXVtU3FiZVJPL3ZBUGdDYnp2U1B5MkFYVlJibld1d25DTk95bjEwRjRu?=
 =?utf-8?B?dlNoNENaZkJJV2Ztam5ZcUFOQ0g0Q1ovK3UzMkFuRWVtK3p2UTcrdFJLTno0?=
 =?utf-8?B?eVJZazkzb1VidDJrY1pjR29VWjNiR2xwdHlJdm4rMDU4bE1wR0QzbVRweVRr?=
 =?utf-8?B?RkVHczQxU1ljdkZhMXFibXVJa2JlY2J5WnR6QWY0RmxtdzJNSmsvdFdUa1Fj?=
 =?utf-8?B?Q2owSEU3Yy9jMkN5K2FYbkZTOXBXKytFNHd4a3A5SGZCbUl6UnVwZUVkSkVi?=
 =?utf-8?B?QVhWNDk1VWJnSzJuVHpCVFJVMjF4ZG5vMldRdkV2UlFRMjd3cGUzYitFbDFZ?=
 =?utf-8?B?S0hxdERYZFZnMi9RTnFzTCt3dkRoNjlnbnVwVTRDUktTa3N2cmVwck8yS1VS?=
 =?utf-8?Q?ULvpu3peuMJgYKPc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6511d8-d25e-4039-7fd4-08deb68db120
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:34:41.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exochmJkw3ia1tlvx9IcKrTI2gT9zr5P/7CC0kJAhXq5FJpBdkKPQGe95lpeM+tXIzHJs/CBPfG26He0NaR9ya80BIbsAs95wbBqyQ50dVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7656
X-purgate-ID: tlsNG-d62444/1779294884-AC656FF4-52746255/0/0
X-purgate-type: clean
X-purgate-size: 1420
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 759D45921B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/05/2026 4:51 pm, Teddy Astie wrote:
> __{put,get}_guest returns -EFAULT on access faults which causes
> the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
> incorrect.
>
> Fix the computation by relying on copy_{from,to}_guest_pv which
> reports the number of remaining bytes instead of a negative errno,
> such that we can compute the offset properly.
>
> Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/arch/x86/pv/emul-gate-op.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
> index c2c699fbff..cacc171115 100644
> --- a/xen/arch/x86/pv/emul-gate-op.c
> +++ b/xen/arch/x86/pv/emul-gate-op.c
> @@ -289,9 +289,10 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
>          int rc;
>  #define push(item) do \
>          { \
> +            unsigned int __value = item; \
>              --stkp; \
>              esp -= 4; \
> -            rc = __put_guest(item, stkp); \
> +            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \

Oh, this probably violates MISRA, but you don't need to use a separate
variable because sizeof() has no side effects.

Given that the expression is now &item, I think it needs to be &(item).

Can also be fixed on commit.

~Andrew

