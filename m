Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HvF4MXVEMWrpfgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 14:41:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F768F722
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 14:41:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="ZD/oMjcG";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339194.1600336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZT6G-0006x0-4l; Tue, 16 Jun 2026 12:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339194.1600336; Tue, 16 Jun 2026 12:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZT6G-0006ul-22; Tue, 16 Jun 2026 12:41:04 +0000
Received: by outflank-mailman (input) for mailman id 1339194;
 Tue, 16 Jun 2026 12:41:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZT6E-0006uf-Rr
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:41:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZT6E-005m40-8R
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:41:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a31444e-5cb7-0a2a0a5109dd-0a2a45069c04-26
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 14:41:02 +0200
Received: from [52.101.85.1]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a31445a-7371-0a2a45060019-3465550196b9-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 14:41:00 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5925.namprd03.prod.outlook.com (2603:10b6:510:30::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 12:40:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 12:40:56 +0000
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
 b=hl7las6yCJERXZ57jYoh8nadsN0CcF7QlpmTyFNsmX0Xspc/JHl4GAxIz8niwAH5+1Gd+f00yl/+HvklE/yzqkfltyf7foysoDhzufQTZNveSIdcDhBHGWyC775QRsEY2jaDAvP0aWRX/HDgvPlNiCoBdb3qyLwOcnNTZJnx8U2VMJivRv+9MJEt+It93CP5NLSUByYTEkJnoormlfM/QANY03TdB16NIxJl5QrZAiupdC8NAWVDF4ltdEHK/PDy8fr6kgF1S34J6/LCACdfDKx0nolSadozmBm1MS9o4e+4L/ikZxznqanZEC6TxiH79Er/xi7JJN0cj/DJpDTMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3Qsc2lC33fts3IKJ2hyA1+dHXwHeaC3t+WdQnYSmS0=;
 b=qEFh2CjIvxj2RaUuM+YXi0POtAuk4ZtPCmhTjeFD+kqRw2tzd3JMkt/WlIAhBN0adv8O0y7bPZxP43sliFFfhidebgnQKKwCtgXEPvSBDN3hlxsdWsyOt5TLOBT7aigoBh4THYfm5mxdaFuqG8Px2n8gzIFC/WKC4hfGbmNJoJ2YPW5T2YT00cU6JdrJWjSa56bGGFyTDf8G8Uu1A8AsM9Ki+sHr3V+uAgG/BSyqCrEeUlafBO0IG/twZqd7t+46HiuBjUu1Ky3omq6GzvMn0CeRswOMpOp+rOVSwoVIFboa1JVGZqPk4LWUVQWGYivuT6Sv2Eq70J9V1OfoHYyNkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3Qsc2lC33fts3IKJ2hyA1+dHXwHeaC3t+WdQnYSmS0=;
 b=ZD/oMjcG3Ul5FWyrpbTmhAw39TN/LlIpS3aexkZfaj/0pe9G4DCTOX1RtqkmONyJzmX6FI+R9OiCjtbBzKaM2CdvrlapF4T66qLKNb7bSI2uubvBVVfTTGrNclzPVk0Eio5IN6H+XNop6krBoc2yYOZ++ITgbZ4QAVmN5SEAAqE=
Message-ID: <a7d9c983-c264-4a90-ba17-b2a49bd85c18@citrix.com>
Date: Tue, 16 Jun 2026 13:40:52 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA memory
 mitigation
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Frediano Ziglio <freddy77@gmail.com>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-5-frediano.ziglio@citrix.com>
 <ajExivEwb88pcOxT@mail-itl> <f80e5c37-96db-4af5-9b9f-28f4ff457a72@citrix.com>
 <8b27a14e-865a-462e-a6dd-1f8323de5f43@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8b27a14e-865a-462e-a6dd-1f8323de5f43@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0403.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: f5fc9ec0-0c9d-49d1-6f51-08decba48285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GMcJF3Q73bTnpK0pFrGSadnM8T4wM1JRZQEZClTtbfGRaId0NqXlSXrJZMxBv62mrdO/KSDgtE9PgBpoxB92JJEjaAcoC9szVHG0IAWgTfkT5wpNRcfa4RTYVl5FbpRMVdM7JCzDe1wKxlc69jiMKj8FtEm5cMgXKBwWSqIJjeQpWWsBVHl6eZq5Xxo5+X6apt4xd0xpOIO9UUqf1T28I7vLbufi5Ia08OEMpAjERR4Xd7wOy2ZsFy+6gOu85hBIljDjEpOMaMMY9Ok4gRWkNdYnf+igZdpi136y9scWOL6WX4X+HpZeUB+LdO2x5d890NV7CAufdBkz4Y+cUNdT8W+e7Wr/7Tdyl05pdMgV8P85rrIkYU6nl2tdfbIfSJnIKeOHfNYxypeL4fkYrnamVZ9vD4avq00NeytFllhatHAPl097wWh5sVMlEt2VNEPc84Far6RlGkaF9bPGEJfVRMC7nAll4KHVzZsIU+lZj5nXiMCbjEsl2CYj/Aa1y2Hrjx+NjBcJHPERawbFsbqOAOg/pPltMcK+DjrJZEFS71yKu3XAh/nVqAfu3ArMSl5nYcZl6BnPRsfcczm9cF3FlIzAcrry5sxfb0+5Qn2Vi7TXrMhCbZUc7UhXSB47nHMXx5k/JubdtuU/oQ79Qkg/QdjYCU5xTFoYxni1xQz6J6UllGGckAJSSuCzWmVKubLW4W7rf5RuFwkWwcg9Zvs/5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2F6MURFTGtTbVl4cThpVmZUcFpHdThoL3lIeVBRMjRSaVVKcnNoN0xlT3ox?=
 =?utf-8?B?Y2l1aGpXWURSY1RtT3JQZ3h0UmEyS2JHdzhkL2FHeXVwUDl5UDNPYnd1Nzg0?=
 =?utf-8?B?L0xCZHpPOHNCYzNnWHNmQ0JBWDNCcERLVm1KOWJTc3VLTGxrZlJrdzZNSU45?=
 =?utf-8?B?ckVzQzI5MFdBb1R3aTN3NTFqYW9UeVcrRUZ0UXNzRWx6SzdrT0c1Mzd6c2M3?=
 =?utf-8?B?bWVKeGVDMDM0eEVYRDZSNVRmSy9wRHhFcFVmeXRETDhGanRTZ2JUcFJFcndY?=
 =?utf-8?B?Tkw5Y3JsQzdSelR2WGFFMllDQVJHQXhLL3JGaE9rekR0dFhGQ0RJUHgyaE1o?=
 =?utf-8?B?N3NnQnRuRGtJbkxDaEpZNXNCN3NzSDdmdjJnaitnVW9saFJnYm9vSWRMQmRu?=
 =?utf-8?B?ZXh3QkpuL0RySEQ0a0xYRWphTVIvVGRncElWUGRmMERGQktrRFhFSjQ4Q3hz?=
 =?utf-8?B?U0toQ0RzYVpYQU1meCtaaDNLQzMvNG0zL1lBOGRPSkVUQ3Zuckd0UFJCVnRs?=
 =?utf-8?B?TWttMkZlbU1FRUk5SUF1MVMrNWt5WmU0OGpOVVdiVGJKSTVaeCtyc255UUhE?=
 =?utf-8?B?bjJZbDNsbWdRT0FVdk5seVhoK1hyZHRFZnQzbDVYRXh6eFUzams3Ung1VVQr?=
 =?utf-8?B?M2J2NHFuUU5qS1pnQnJxeS9HbEM5cHQ4OW1lemZoVGdSdzFZQ0l0VWNoZVda?=
 =?utf-8?B?WGVQRmdBZFErMERmdmZVSGM0VlBISXpUUWdRKzZEZTl6TjhKbkJEbWt1QTBj?=
 =?utf-8?B?VzVmdFRReERsckdnM1pMbDVCajdCVDFYNy9CbmRPaUNzY0h2VE52VkFsSjZY?=
 =?utf-8?B?dWN3TlZhL3BoTGN2a1FDc0xrMXNLREZxWklVb0RoRlN2QXBQQWtPZEpVbzNT?=
 =?utf-8?B?VUE4cHVxb21xRkhZbzIvUVdNYi91SlZDWCtZOW83MUpCR0daWCtBTUZEMlN2?=
 =?utf-8?B?Z01VcnpMZk5uM09BckZ2YWZKemcyUUFrbWdGVWN4K0FSbTF2RkQxSE9Cc2Za?=
 =?utf-8?B?M3laTTRReUVNU05IS0FZK0pDcHdCRlJkSU9iUjkyb3Y2dTdvTzRPam8yek9p?=
 =?utf-8?B?M2FKbWY5WTkrNmFxZTE4RkJaNWVZYWRVVlRuT2E1Q1ZtRVlpQXhQK0dQeDBo?=
 =?utf-8?B?UlMwTkY0dWNaYmpwNVNqd3FrSDNMK0gwejJFaG9weVFkYTc5WldoWFdDcWlN?=
 =?utf-8?B?cHhuWGE5bFBmb1hzbUFVSGJkTFZUNS9OeHN5QTU2M05LYVlVVDJJYm8zaXN4?=
 =?utf-8?B?Sm9mNXZodGFjTWgwL0xwVis4Tk1uVEV1ZXVNWTZBVmhzU25RTkxLMjJNTi84?=
 =?utf-8?B?ZWx6RnZES3lkSzJRWXBpL2RnVVFWYWtxOUNlWTFwY1V3R0N2VElDREdGNzc1?=
 =?utf-8?B?aVdnMUwreFZhdE50dmx0TG8rSnlBZllzNWh0cXJiaGtzZW52aE41K0hQRkZZ?=
 =?utf-8?B?dFA5VFcwV1ZiOTc3aHp3RUo3OXpreHl1TE5nMGkvcnhYQklRMng1NzdQblpP?=
 =?utf-8?B?b0xlbUpkWmRzdWpvQXZ5VmpvN1lyeTdITHBTalh5Rm1yRUJmZXBNemMzRThp?=
 =?utf-8?B?b3JvQjFhdTV5cENCN0JHclBWMXJ6WmJnQk5OZ05nOTVUNXhhdjlTcmlTU01y?=
 =?utf-8?B?UGFIdTYvVVcrMGYyOUlobjBReXJTK0ZJRmxzZzg1K2RCYlJ4ajRCcnRpUHgx?=
 =?utf-8?B?MGhQbVZDeGQ3c3RoWTI2eDFITlpkMHozeVJERGs0bStxQ0F6N3lTcGJNTWsv?=
 =?utf-8?B?c2U4NWFZZVRLT1FCdXBYMnNNWnR2WE1lTUE2dC92RDRJV3JvSUQ2VWd3R21n?=
 =?utf-8?B?Y3BYRTVPeWlIeHFaWXYvaEdDL29jRE1HdTZyM2NiT2pyQTZjVWR2cmJQUTlG?=
 =?utf-8?B?R1RtUkRObURZTVQwekNIeXVkUUkwZjRHTVVla1RRL3pHSXdFU2orWE8yS20r?=
 =?utf-8?B?MUdPZHdjcFZITGJ2akVzYjNzZG1pSmg5Y1k3VmhlN08zd0ZRUE5qQ014Z2Js?=
 =?utf-8?B?VmRNcWZZbHRGTHhoYWhuRXF4ZHNDL2VjdFUwaHA4OFkvT3pEMEs2TnAxY0N0?=
 =?utf-8?B?RzZ1aXp4elcvMitHYjkyZUc2cVorQVlyWGpLUS93ZDRPTHdkSDM0Q29kK0l3?=
 =?utf-8?B?TEY2dGVsOTA3azhKNGpMd1N4aU9TY2ZIQ1B6ektKcFBrRlluMTE0UkZZYlpn?=
 =?utf-8?B?Y25yKzJrcm50L09DMUp0TWJsR0w1ZFJpTk9Ja2tKdzlka2JrR0F4TEIxdHdH?=
 =?utf-8?B?THEraUhZK1NYZzh2T3VYTHY0aWJRRUwwWXp4NTFOZ1pRT2hJWEN6RXkwOUNB?=
 =?utf-8?B?MmsxaWEwWk9rWVNjUmVJaUhhQ3lUQUI4RklhMU1pR2xKQ3FhSGpxZ2lSa2Zw?=
 =?utf-8?Q?/mOa8+BvL5ccKWCw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fc9ec0-0c9d-49d1-6f51-08decba48285
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 12:40:55.9931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdNpzmLYGt/59N7xBKJ7Pd/Zo/RI9a3eW9xZ+fzuXGznMkWcAfG2yA5Tx/gas91vwxcNNVv4nKEqZ7nrXQ6sk5Yqrg0Ce4ahyuw8liYpRkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5925
X-purgate-ID: tlsNG-16d1c6/1781613660-7FF7BD75-FD6158A6/0/0
X-purgate-type: clean
X-purgate-size: 1968
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[suse.com,invisiblethingslab.com,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 199F768F722

On 16/06/2026 1:30 pm, Jan Beulich wrote:
> On 16.06.2026 13:29, Andrew Cooper wrote:
>> On 16/06/2026 12:20 pm, Marek Marczykowski-Górecki wrote:
>>> On Tue, Jun 16, 2026 at 11:13:36AM +0100, Frediano Ziglio wrote:
>>>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>>
>>>> Currently .init section is both writeable and executable, split data and code
>>>> to have 2 sections satisfying W^X rule.
>>>>
>>>> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
>>>> in the pagetables.
>>>>
>>>> NX_COMPAT is a requirement from shim-review,
>>>> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
>>>>
>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>>> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>
>>> Is that the last piece necessary to satisfy the NX_COMPAT requirement? If
>>> so, I suppose a subsequent patch should actually set the
>>> IMAGE_DLLCHARACTERISTICS_NX_COMPAT bit (IIUC ld --nxcompat option), right?
>> We need to satisfy everything in
>> https://github.com/xenserver/xen.pg/blob/XS-9/patches/correct-sections-permissions.patch
>>
>> .reloc needs to be non-discardable and writeable.
> Writable? Why?

Because we take fatal pagefaults against it when it's really read-only.

But as for why, I'll have to defer that to Frediano/Ross who did the
work originally.

>
>>   This will require a very recent binutils and a patch (series?) from Jan.
> Seeing that no patch had been submitted so far, I recently added this to my
> todo list, yes. But really I was hoping that someone else would make the
> small change that I expect is going to be needed.

If you can explain what change is needed then maybe someone else can do it.

But right now, all I know is it's a new binutils and "something".

~Andrew

