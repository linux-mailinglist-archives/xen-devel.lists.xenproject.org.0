Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLkGGYswvGnxuQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 18:21:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EB92CFD7D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 18:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257460.1551857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3H3E-00048m-Lw; Thu, 19 Mar 2026 17:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257460.1551857; Thu, 19 Mar 2026 17:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3H3E-00045r-IS; Thu, 19 Mar 2026 17:20:52 +0000
Received: by outflank-mailman (input) for mailman id 1257460;
 Thu, 19 Mar 2026 17:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAdu=BT=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w3H3C-00045l-U0
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 17:20:51 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f790dfca-23b7-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 18:20:47 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5002.namprd03.prod.outlook.com (2603:10b6:5:1e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 17:20:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 17:20:42 +0000
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
X-Inumbo-ID: f790dfca-23b7-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3g1BdYHhRd6PzYGSpspKwWaRybXBtuKJU1CZ9gcKdMmKYkio7yxFgHluBfjjnWs5Wx6fE0WcRSC5AQunr6YZfhO7eZIqhYlDXPIfM7ou7xeNp/kosLRber5ikTEoXvgrQzcAlu8Hg5gzRQkkVZxnRzWjDqegni1Iy/nH5AJ4OE/fpEo/42UfeLdF6YSF4MwKaoeYpKnmgNysHplneJ8+feIvBMvoU5VKlVTlQ/Gqmlku+LkZnucGl3cQnuhlve4SwkjP0+/TuDzvnWZ5QKHkBad7jZ9+Fe5Uep+tJiv3J4CmclWwMNIbkXWaCJ60MAbo4+uEjLMram7ESENQP+2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scM1kSyVmGbeR6Y1THi4aqXjhqrIk9N6xlBSqox0cGs=;
 b=ZtOK8vVBc3UzKe1wFtWORjkBgsQsNHrhoxb3KdR8avGhO+ng0BzsZxuSVcE7OwCBmDBsYrLpEFV3E92Lw64qJWBtkIniARS26W6S9gv9LrqKHt2nh18+AexKde5mdemJhvG7J8wcXa7HwMLN1loCHWu8cKAZAP64dzy+Zd5cwtNS2VDlcLvUso62AWLcO1TRnMQHv+Cl+4jAmbHaT2LeHApNyV7l+dZ8MwfVCGU4BbsaIg2OpoXLo17WKxx+gW4onLTeLuyHQGH+nVr84BZVnrZoN9Zhb8wUqJRxKK8PkJE/GOuEhnf3gXh3rpgzL82nzcA0F0Oeq/Znbd8cPnRL0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scM1kSyVmGbeR6Y1THi4aqXjhqrIk9N6xlBSqox0cGs=;
 b=ihmGXZMowc1gUzdz+u1GL0yzbgTk0IPqKXk4ssodKHQlhWmQ2SKUaz31lpjQig5E43MfVZ2ZjaV1UzjNSlEI/0GRDm3xMzW0LxSJ9x8QRMY1VGw6Aaz+CqUQQzzWfdDOVscprK1hTJL307oEWyL6auhn3+POc/dEmMUochbcujI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7e1381c5-4429-4580-bfc3-e91d31813a0b@citrix.com>
Date: Thu, 19 Mar 2026 17:20:39 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v1 3/8] x86/svm: Remove lazy FPU support
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-4-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260319132924.1469809-4-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0547.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5002:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7e6a1d-847d-4bf8-5a85-08de85dbd94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QkWCpAzYs6aAs1MSdQQQcDvmqegl3OrOB10LvpvNOC0tFYcfoe2SV3aRwWNIVpUPhNSf/e9aUgig7H56O6eCrB5aNvjLQB0kIi7Pm1gYEfTqHpwwqpIRqgwFBsKjSFShteR3OZmHaRjUFMrLM8IVavdj/1zUJ2I65EBlbry5tV+B3Gjk8bW0aRMFiMnkhWMZL2i+d1JnycPUeiVJSXUwCqNT8w8GZ1nzyNvZg1S6P9Kr5KDDDxtYHWWUsye6c/H6J8y9TQ4YmelKNHHaZlNhzKF+4nQUadAqBo6L8jSBeYK9ho45i+uMkW0yA4b+VpdxkQcKufuMlRLuTHEHABmd+afEGVahnTjdmHSYhpkTk0zF4UqRFB+sbdrUjNxL1ii9j+aMBvx8qHCWj3Cve2U/EUfCpZl3zo0RJsRasD+/8S1NGWj7GC5gF0vYMebEErvc/LD5VxQRA+kDe2qBoMe75mJ4Qm6rLHP9SwxzvXO5Im/iK58FdQnAU5U7tflz8R8+K3k8aySipQNLq4T/zptuY8Yx6tQD6wJCW/OCepzPA+Lh7OFtETacmpYBBkHy086iYPsE3hW3r8lPBemFszK9/WDcQKPje5Xri961KewVk7m4y+5aqhZrsO88WyKgPMibniQN3m00lNusoyYApf26p6C68YcIFB+ajN75B+64k/95suWRvQiVszc8VwnflohYHQZnBrgfC6HHPWTpkQxUttG1dmMFGf9jP3SwFy/Z5Ew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkY3d1RMTTJaekV2VFlTWEN0RGRlZE9QNXlHV3NRUUhuL0kyVVQvSjI3VWJq?=
 =?utf-8?B?cGxwVXQzSXB4WFI3VGcrdlk3WjZkMFZrcTRMYUZNZmtqWWVtbFpkdjRtWE1T?=
 =?utf-8?B?NTZXWjhtVW1aNHBoK1RWZVBURDNnUzNCL25PSGtlcDZZaUxmOUVoQ2dBdXFM?=
 =?utf-8?B?NFpWUU9NQUE1L3R1bkY2dFJ4U09HM1BUUDlQdzlaWUFwaHVuTFhUWGgyVDlH?=
 =?utf-8?B?empKMVpNbytWcmYycU5TaEJ1QWs0Q2pqWXFkZVE2N3pCK2s2UWQyb0ErQnRo?=
 =?utf-8?B?Z2hKRzBwbVVpT3prU3pMclNjNGttTWVpM0pFNnRtMllNNTdiWndLMy9rRm1S?=
 =?utf-8?B?RTdJMFgzSTlmV3BKVFNuRkZyOFJkN3poaklCd09pNEN3QTNpeFZTMUNRK0Fo?=
 =?utf-8?B?cDZ2c2d2OHRnd2lBeWh4WFg3dkFxMHRybG9Kam1zYXVZRmo1T3EvNGV2Y2RC?=
 =?utf-8?B?SkhWQW8yR2hHUkRHazJWcmxHcFVBK0pGVzYvaWYrVjVaaEVKQmhUYklBZUtX?=
 =?utf-8?B?ZUFkbEJYbDVGR2IyVlVOZnpWYysvakU0U2w4Umpic3VhQ29GcFdrblNVcnF3?=
 =?utf-8?B?cWFQVkZjRW9RWjREVUdNYXZaWkRacmF2SUtJOUNzNlFBbjN2Uk13MWtjb3dO?=
 =?utf-8?B?bzZCNS9IQjZrZURDMC9zdUtyUWpwVFhZZVc2b2RLRDJDQWo2QjZ3VWJoOExH?=
 =?utf-8?B?RldkdDZTVW5rMk82UE1tWVAzMW05b3hvWXRjZ0xvemhRd2VaL1ZVZjNsZlY3?=
 =?utf-8?B?SUpGTlJiNW50eDdDRjl2M0d5SzQzaHZ1QzhtWW95QVZUZHVpWWxsTzZqam1V?=
 =?utf-8?B?YmVBZFhObXNpWFpJbExoNk01eVBGZlRJbm1FdUkxL0dmcFdBSytNWnhVNkJo?=
 =?utf-8?B?VFBkam0ySU5Cc25XQkVBM0JsRVo1N0VIMjZsWld5SDRFZU8rbHNzSGVOWFoy?=
 =?utf-8?B?WlA1TUozSFduWTl5VkM2cGwxcVRsQXViTUNMc1MyVmRBL2dvOG5VN1V4SmxZ?=
 =?utf-8?B?WDlyNW16R1lyS1lzTHpjRDJHYTN1Ri9zYWoxTU5MNmdKYXcxSTRBam9oQnl5?=
 =?utf-8?B?a20wQkpYb0lIZTdHdDFaWjNjSmhJTis1dm0xaTRKTmg1a3UyRmZkbnR4ditW?=
 =?utf-8?B?MHZZNVJvRVdoMEZ6Z0RiR2g3b0lDV0QzT2h6TWkxVFNwSUdwOXdCMTFJRUhF?=
 =?utf-8?B?MStpSVNmdm41TVBmdHdRMUJOSGdFMXdBdk9KcXpsL1BlK2N3WHcwQWhIYVpQ?=
 =?utf-8?B?UUlVUXFpdzB2RVRyVE9ZNUxxOVBFc3dHU3NEbm5tMzVwOGczS0tCRCtFSTFB?=
 =?utf-8?B?VlhYM2NtQmFuVDh6R0IzS1ZWWEpLYjh2SXNtVWl1RkZGQVVDblBJR3A4MXg4?=
 =?utf-8?B?dzJrcUJ2S0lBTU9lTDRqaEx2czYzS1pFcTF3TjVoUEI4YzFieUpMMU96SSt2?=
 =?utf-8?B?SUpFZGJ6QUthQ2xzRFB0ZjRoSy9BcW5hQzVObVFEUzJZSVJxZ3pTM2xGckJn?=
 =?utf-8?B?aWpFaURRNTBoQkJnY1o1WFFWSDlwbzNYOTJmNkZLU1Y1YmhNeXVtcFFmVWhJ?=
 =?utf-8?B?TTJDUm1OSElzL3JFb091M1VkMEJYZzZhQWVNTlpNamFYd2VwS1ZuYWF4bnJz?=
 =?utf-8?B?a2ZzSHRrK1lGYmNQTEJDcS9sTVF5Wk51WGtYaGc0V1ZZSk52VGhWNU5weUdx?=
 =?utf-8?B?eTNsZVRmUU5lTWV0QnBaYTVPR2xSTTFDaFR6SFByL2RpS1MrdmJidmNBdFIz?=
 =?utf-8?B?NWZ1RjJkSUxiWnFtaUpBR2JGZUtGTm1pay8rK1pQUVpHWWdvNVVDZUU0cFE4?=
 =?utf-8?B?WW41My9Ld2JCQUNVTFVtSVNBcVBEa0phUGI1YTlyeDlEYS85cTRIdjJ2NGVP?=
 =?utf-8?B?YUFUYjdRdlkwTFBnQ1A3SXJWWjU1WWF6SS9DL1o4NzhEZjR0OUh4RjZzV1U0?=
 =?utf-8?B?dzR5cHd6K3E1cEllYy94RG8rQUFBVzhLRVpBSFpWbUVIR2xuYk9VQ3VVSkUz?=
 =?utf-8?B?NkRsNGI0OHpoVXpzbm5LK1FMYnBJb0p2UXFnclc1ckx3NTVKR3kwNXFobGxJ?=
 =?utf-8?B?bUpJVTJ5QzFyUmNnRnBFYU0wMkM2VnNvYm0zbEVpbTZwejY5eG1seDM2RTBq?=
 =?utf-8?B?Nkozc1NQZnU1TkhHYk1rQTFCTEhOMG1WOSt5Z2hPWmVrQk5lWktIMXlVNUZN?=
 =?utf-8?B?SUo0TWl5NDlVSmo0NnpwRy93NFpwUHhHY1gyWE83czVMS2JmYW50RDg2bTFp?=
 =?utf-8?B?SzdXRTVUQVR2MzFNVlcwZWhUQWtuZVhFNDQ2ZlBuWUZEc3gwcnlFMFp0Q2N3?=
 =?utf-8?B?YVdvbGhZYXIrMjVubmtJTGlSSmRYWW9EV3EycTd0bzBuVVlhc2grQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7e6a1d-847d-4bf8-5a85-08de85dbd94e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:20:42.4992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbY1iG2a7EnWyCHf9ZFt7EMMU+TpUhn3FWu0dhRpKrWnLP93g1FiNHoLkXjmSZIuXDBNvnXMSUmT3DPRVuTKDvYwc7RCNkJawg68UyLrC2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5002
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C7EB92CFD7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
> Remove lazy FPU support from the SVM code since fully_eager_fpu is now
> always true.
>
> No functional change intended.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Unagling nestedsvm_fpu_vmentry() is tricky to follow but I've managed to
convince myself that it's correct.

> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index e583ef8548c7..5ed7123d9a69 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -138,9 +138,7 @@ static int construct_vmcb(struct vcpu *v)
>  
>      paging_update_paging_modes(v);
>  
> -    vmcb->_exception_intercepts =
> -        HVM_TRAP_MASK |
> -        (v->arch.fully_eager_fpu ? 0 : (1U << X86_EXC_NM));
> +    vmcb->_exception_intercepts = HVM_TRAP_MASK;

Just an observation.  This handles HAP vs Shadow differently to the
Intel side.  I expect we might want to bring them back in line in due
course.

~Andrew

