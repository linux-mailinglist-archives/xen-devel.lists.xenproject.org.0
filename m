Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YwBdBeqEQmru8wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:44:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4D6DC33E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:44:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="Teb+AH/f";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347655.1605495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDEA-0000gu-TA; Mon, 29 Jun 2026 14:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347655.1605495; Mon, 29 Jun 2026 14:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDEA-0000fS-QJ; Mon, 29 Jun 2026 14:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1347655;
 Mon, 29 Jun 2026 14:44:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1weDE9-0000e0-AO
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:44:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weDE8-00FW0q-5A
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:44:48 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4284ba-2eae-0a2a0a5409dd-0a2a4506ae96-44
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:44:48 +0200
Received: from [40.93.201.50]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4284de-08de-0a2a45060019-285dc932a1f8-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:44:47 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:44:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0159.016; Mon, 29 Jun 2026
 14:44:44 +0000
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
 b=grtN3vUq4ukCyUL+k9m9AwX39fBOkYn9eq70ivEXtt5/FfGqgZGA5PwASuK74BJU47TotDn8WA6v1CaelWTu+FYcxy9nO61kALrdCXetN+jAUGCgsF58IcilUUs6ALgFYKXOTAkvR6vvzsSBEcbAhuAkacrs8Q1BUmF0JlTo1f7oBBLoluX8dZIfODu13BdkiF5PkFvli5sySLQpqrvgkV0WxgDtYCX2JGg466fmb7wM8/b8INbrrDkYP3mcnLox095yecCioGG5sOgTlazbkwoUNNaUMatHGdCedAZS8ErsPPdl8w3y18p1XOxOT1qSicKEPLHNtdNHd0bSYvHRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8R5xP0j4+hFzra3RF3ToWwNED5/sWa8JA8dI5GmNDI=;
 b=x4c65E6/oJZjU9b5B+9Mb9rzj705qXO3e+/vzds8YPNyDKTfycysblFwMsCuqPoXq/gVzGLXesmMdJrTbCdje4/+rNzbll5+G9J9OWpLU7IQxZGf2odeaiepOCaXFgbzzNIMPpK90KOMrWG+TIHfA1aDhefi2DtEHzJpj9pdNx0gb1E6+NsnxrVKE/FvZ6l4NxGt9JDZkYylsGh6AhrSBy27BDGmuJVyGFQKZRonTprIuwCTnqr7fvwk4SeOMSYg5Bk5PW5AAaGg05+h+7xdaBpEo/ahgQb1jimzg/iCqPo5Uef8u44ind/LP22OLWi0LtL36l/FVJsV/ZdupXAYtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8R5xP0j4+hFzra3RF3ToWwNED5/sWa8JA8dI5GmNDI=;
 b=Teb+AH/frJ2blKbnd2P8ana+wFaVciZXcbvT3n2EmmUVBxA3RqnrbFGrVk/T+6TzVi3gMJKIHz+Jk5U/bkRa+Od4Ohb9o78oXlPwEetUEBdG8l23mSU9oEgAHt3QKWHBEHKdHQC+f9nv9pXR9//7OMaGGENgHIGjTFvxccUKm0E=
Message-ID: <b133d65d-8ff4-44df-83c5-1aa22430fe4e@citrix.com>
Date: Mon, 29 Jun 2026 15:44:40 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] console+serial: don't open-code IRQ-safe locking
 primitives
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <30e8d5e1-9b06-4327-8cf5-6eee2d234896@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <30e8d5e1-9b06-4327-8cf5-6eee2d234896@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0028.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c3b4c9-23b4-4885-9052-08ded5ecf5ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ulPlvxScku+kOQQYOFG7BdmYx9zTz3EEmJ119tS3Z3C7zSz0DYVkc705u6vSzm7KjNKlL5iWoH8gVbrMQEXMiVxhpFM+9aUNkXHKHuBAPW/qx/3t0iaBX1y60s55U8C/1tmCeGmPxKJf0ciI6pmyvxYLP/tMnxypwAeFco/dmiPjPtg/m+e2W67/HAsJ8muFqBUsI+Of1gN70GtsRA+9nFUxytXO1YCC29ze2j8mmFz6/SsnVKe47pXcpmnfW9UBo9wklqxme9fkJy5iWgCOLieLTy5GugB2XGIbOuyY4O6DddbQoI/yfPEEHe6CiYAz2gLSCvcK6+V+tQvnZt2RdAmvK3/8Od1MSWPHyaDLM1G+HVBSdfmUCk8SvIN418qY5I9m1rtlLcvhzuk7nUu2E5CPK3eT9LveKvfOVCQWnbwNrDdT4MHiLd7i3aUPzmVXAKXjkJdqvW/FRXxfTdNqBOEfxvcFPnYzIKzrL2MnKK9xK6086gyCpM6QXIfEssfUdEBpq7uuxMxcs7r8ecGyDm939iiRZCw2E71UtGQcPwzZaNl2o7Vofz2SXFCV9Rt3NJEm1yWdWRi44hyrMkdhVuDAtIZuZ5AZcAZ2xHGpUBX10ETfFvkHELAPa6qKTQZzjvu93hA4DLW+OnH/mcQcscUv6ySz71cnmq8pkGs5qeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXFqT2xtRk1ERkxuTFFkWkNsSjVHb21FTGl6b094SnVoZHBqZ0hQMlBzTGln?=
 =?utf-8?B?OFcvbjdDWVkwS2dTZ2xvdmlReVh4Q2dJSzVaOVNvSlg4bUFwUGs3UmdhaXQz?=
 =?utf-8?B?d1lhdjdKeitMNCtRa2wrSUxtMGFUZTNBLzdJTEVSRWNIbE1ENmFsenZlcjNh?=
 =?utf-8?B?Y3l2TTRKb1N6aE56aGlEVTMyTkVZNkVSeXhZalN5T3ZvVzFlWDJ1SitWUnNQ?=
 =?utf-8?B?cHBXL1hIZTJYUVZTZVUvSkt6bnM4QkVRcDR6VHljOUpDaXRNOGh4MFlab2gv?=
 =?utf-8?B?NnVmZTFQbUs0Q2V5YnlWZFpFVU8zbGZMMk9nN3p6V2llRXpTeG1CMnF3M1NF?=
 =?utf-8?B?SlpKVUV6ZU54MFBUbGtWbkpRQzR2T05rOGlOS1RNUHFuWi9pQWF4WWppbm0w?=
 =?utf-8?B?QWUzMFRIbFduRlJrMzFmNE1tRXJVaHVsMWUwUzRVa1Y3ZEFiSjJXd3R2ejdG?=
 =?utf-8?B?bzZoNUxDbUFnMGE2aE9kTVVEWk1VV0JrNXJvVEdTeUhWcG5kcGlkbnA2ei9J?=
 =?utf-8?B?ZVFaK0tLUjkwM3ZzaVdocmRtVytrY0duM2xhNzkwUTFOc21JUGlOdFpQb0hi?=
 =?utf-8?B?bGZaVXNJQXRiMFVpVXRnT1FDSDZURVlDOUg5N21jK0QzbHVmSnlHanBlU1FK?=
 =?utf-8?B?azdGVEQ2ODVQUUhUSDE3VkgvN0J3N3Y2ZnpHcVptcDZWclpBMGdJaUNMMFQr?=
 =?utf-8?B?NWRWVnJWd3A1SXIwcFl1aGhSTGh6TTZSZDF6cXVKVWgzZnYyOHFISW55M0Iv?=
 =?utf-8?B?Z09TNDdFYUdTb3ZIVnNlMytIOFFhRkNDYUU3MDVIeXJnRWNIaEhPelNNY1dE?=
 =?utf-8?B?WEkwOUo0V0lTZ3JaRldGcDU1SmNtK1JGS0xkU21oZDhBUUZTcXVUbTdEN09Z?=
 =?utf-8?B?ZWJaZlVyRk9RTmhkUFpla1VnRThNWUFkMWQwWEo2QzNkQ0UyOEgxR0RBV3BM?=
 =?utf-8?B?dkNYViszeXh2bTlOUEVhTUlWMDFvTHNHeGMxRGpFdUFqZTJyZ0d5WU92bmND?=
 =?utf-8?B?NFdIZTREVHpoekxWZkhqaW55MUdNeENnaVg3V1BBakJPU2VtZjNEc1dlWE9W?=
 =?utf-8?B?dGVidnUxV2xLdnVZVU9UeFE1RW1OOGpEa2k3dWxVZ0J0ZVJUTk1UaVhUS01u?=
 =?utf-8?B?R2Y0YnZSUUJvamx5d2JETDZVQjFXRkp5MjNENEM5TnJnOGhlZUtRSzdvZmZw?=
 =?utf-8?B?UUl6TWdwTU5kdjVEa1llQU4rRDAxMng2dWtmc0gxbFJTTjFqQ3RkNjh3d1Nu?=
 =?utf-8?B?QlhpUmt4bnpCSE9KbDBIVFR1MWRqRWVWVFRrTWFyb3RnbDE5UGdzSW0wSWdV?=
 =?utf-8?B?MCtEWG9hMW0yYVVSZGZIMFN0YlNxQTU5cHpkcGJMNWdnSTYzeWZKSEVwTlAw?=
 =?utf-8?B?aFY0NHc2dEd0aSszektidnMvaTlHSXRxejZ4U3FqVjdKRmRLSlZIVmx1OHRz?=
 =?utf-8?B?cGtoaTd6WUh6c3pqbHZveUZtc1VHeHNINDNYNzlYZ2h2VS9QNm0yakd1UkZ1?=
 =?utf-8?B?Rjc5QXcyWi9jS2dBazlaeWcrUG5XWWIxYnRqYk1WeUNIVkRzMVJJc3R0YkRn?=
 =?utf-8?B?bUR4cExFa201czRCanV6VEJJVjJyZ083YmdROVV1ZExuTzMyQndEajJkSnho?=
 =?utf-8?B?WnhxcFRNMnh6cWFQSmtKQVBQWHROL3crVUlJUmN1eHdTck1Fd3VzUlY1TDBU?=
 =?utf-8?B?bk04dHlBcW8vb1loNm1DdEUxY1BUTVlNazM3ZE15UUFpc014TStVaFVCc3B2?=
 =?utf-8?B?eTVSaEExdVhKMytEN1RON05OZnRrZ2tpVlh0MnFmeXBzdzIwRFFLRHIwbW42?=
 =?utf-8?B?M1ZUWmtaMUN0QTlheEpJUUxQSUs5Y29LUzVESWI5T3IrcUNza1dlcUMwUWFv?=
 =?utf-8?B?RXBWSWRxa0tDNm9ybU9vMzQ2aFV1UFdWT08vQWM4ZW9kZEt4aUJvK3dzeVBx?=
 =?utf-8?B?SkUyS2RUc2FzN2tIYzA2eGhTQkpRNTR3Y2sxQkdBOHYwZzN3VFM4ZThFVU9Y?=
 =?utf-8?B?R0V0bHA2NUs2RWswL3BKV09JMllGbVBrbGNkdE5BeXluRmdDcitSZkZPd1Y5?=
 =?utf-8?B?MGpXT1gxaEdNM2d1bys4UVowVHNQN3JoazNCd2RoZk95NXR1a3lJeFhUYjJj?=
 =?utf-8?B?Y3E3dTNmeitsWkRzUjd0MXl0eW42b3VqbDBaMWlDbE1NRm1FdGp6RzdvMGxC?=
 =?utf-8?B?NkJkYnpXZVNKZlQwVERDa2Q3bFNpYkRVSFFqVjQ1WDE4N3FMbENBaEordTdE?=
 =?utf-8?B?cTJKYld5SjNRMEJJYmFSOGxMa2ZKQ0d2TGx4R29vUGRSZUpqTHQrWVh0ZFNJ?=
 =?utf-8?B?SXZkWmtFaWI2Mk5ZOHF5enRXczVJRlNnandieFpORThJWVU1eHM3QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c3b4c9-23b4-4885-9052-08ded5ecf5ca
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:44:44.6603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4Ug5CtbUTktzoXZ5owhgdgcgTi0L3pM8KzeK7oJ6Q+DwZL4FLKhJxsTfOLlC9CnWewsTS9snNAYx4Ukot3oxj4UEq/uDGND08XoMpRqsYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6512
X-purgate-ID: tlsNG-16d1c6/1782744288-41F3C68D-AF563D8A/0/0
X-purgate-type: clean
X-purgate-size: 151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BF4D6DC33E

On 29/06/2026 3:04 pm, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

