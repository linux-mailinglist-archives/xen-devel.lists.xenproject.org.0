Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNTVNRtg82lT1wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 15:58:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421294A3C52
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 15:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298209.1573708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIRu5-0004Bj-2j; Thu, 30 Apr 2026 13:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298209.1573708; Thu, 30 Apr 2026 13:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIRu4-00049C-VR; Thu, 30 Apr 2026 13:58:08 +0000
Received: by outflank-mailman (input) for mailman id 1298209;
 Thu, 30 Apr 2026 13:58:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wIRu3-000493-K0
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 13:58:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIRu2-00GpC8-Jv
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 15:58:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f35fe4-bab6-0a2a0a5309dd-0a2a4501bdf6-26
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 15:58:06 +0200
Received: from [52.101.52.57]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f35fec-c1f2-0a2a45010019-34653439a9d3-4
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 15:58:06 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7416.namprd03.prod.outlook.com (2603:10b6:510:2f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 13:58:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 13:58:00 +0000
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
 b=QAdgNH8HaXI/z1rJSsAuTDiHlnihr4E5al37z/YwErlNjF+4Uyztce1olNzZyydt4jZbwnBy8PoZH2bm5zOe+1TKT6rCmC4Utv35PLccujsEvKv92iofEChSVVFZqHgehNgWanvIkgIw19mMnONHsj4E2PBbR2G4Eg/yXukFenolHC3zSaLdoajj909j8ajBU5VO5Gu850FgsFlOFsuiV7c/sQA2yfbmcQU8Az4BvAhPFeLRGZVS2vbIV2huRHPZduiCEtNdhcvz1ukEA5w9m/z6ZfBW9Dqq7++7loX1SHSUzTYKJj336AJ3trOFygnHz07dcXo9HI6t44yH+h0VJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fMMds82kYgI2oLZ7g/bev2WMrq2ftex5u+gWA8C4Po=;
 b=PJQvUW2MBl5zVEH3pqln/du4tygnZGhSvjXRBW+SDoKY7MKnaN20qYwKKE0bbTLpryHOse/ykBY5WdSYS1w3xU4zq4NdmRGg0sLeHmosaoUKU83kUsM1G1g5RvV/dwU/ntfOd13u4n+oUfb9GRbCkMQ6oZg7Q8a1yPlr58UgmALLxFfNgYwBUb0CtVvcG7ykaKHRHZ/uZ60eB4YLkUshGcQa+SCRO8HBcrGxu2vv3hyOtAb2sUKtMoeZw4rUTEVpwhSUFZ68GSIrSr9ppcNmV+b8WUALAIN78AJHHNbMp7+RTsDHjKmauD9sLJ4emjUrSQrAeeitA8fuhXZSIzKFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fMMds82kYgI2oLZ7g/bev2WMrq2ftex5u+gWA8C4Po=;
 b=uD61njrrWCroxy2Qgq+oC5AICI3dlN7dmUm+dOXKk2nlNzxGG52HuVh8L0A7LQgj4/J9+H2Y9bYuuFwQoZf5buSPfqDWv2o/vYUULFXORBu8Gk074fEyfFzo3f+w05F0LkTGNrV+5jdnO7EJiBmuMiWqEfbENiGVXg6XnZBdFxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <70d214c2-d420-414b-aa45-41f17bdcc0e1@citrix.com>
Date: Thu, 30 Apr 2026 14:57:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] CI: use --platform on `docker build` and `push`
To: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <1777466900.8631fc262581453bbf619ec5b2062170.19dd9487f12000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1777466900.8631fc262581453bbf619ec5b2062170.19dd9487f12000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::17) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: aabc67b6-e832-40ba-15ca-08dea6c07d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tkJesO9T4F2Uf0v8gO01NP1m36zYQb+K4RdjnMDD88N8A1FYHCjEoSzS9TvIwEH91gvNMdx3S6t/PqNPOenh0AL8JBeygeZTyUCsNFaavR51LqFmwwbNpQI+q9HJt5seJrl0wtHRNqERQnuIcBP1pKDPOV6gClbhzE6FNj1etvpiPfjtVt996GPXQ7i1QJ8wV1FZNCEjJALtzBmzdLwn8X6FF9PlotbZDI3ppXnvBSPgLZEGA0HCQIR1k4EDY+w8fJKhihGWrDgVxc1/rPGpQbElcIFpiQyNL6WVhVpprADB04lsEg24s1RcrJAIhdebmOz4EuFJNasl/zjOjvofXNn+qIId4bxqCq9M7y4OD1D0Nsu+Hkz2q56TQFHi7cqR8obCdozCrQ5I11k38CNWbTs+L0b4n1LlLTH0Zkb1dmeH+OobJsfJNref0W9g/MPkmN/rJhIbqHaYTp6W1Ql4VgHjh+ymGFZyo9zXH6Uu7InlBIKHHr0IxS9tvOMFi8EOnmoOBRWdXa7YsGJT8DqkRIhDRYO27sFc1w2A/eKVXt0mvrjQMgOTgGXg4hefRcK+TlFemW5z8e3xnZpl3bYzyWCTC4zKxhDywF091IRVZ6v11m00ZGPTQ1o7goHkIhUWCqw4Sfa3Uf3fHbjwRI/XN7LQF/9HWqsZXt3kPCSois2jNl2S51s6NopQQ/UnrkBD0jAF8aKsrX3iKLzpxi6Kqk7nSiprXcqu+7IFtWtpjFM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2dabHFHcjhJcFZoSVBRL2MyQkIydEt1bFZheU5rRkRsams4ejNnSGR4MnM4?=
 =?utf-8?B?ZmpXZFphRkc4dlJqemRFRGxWcXl0b29nYnMxMll4M3U5azRBWmhKWlFiaTJ4?=
 =?utf-8?B?dTYyM2NQVW10Y0N4Y3UxRTc2MkdWQUhyekFZb013M1hzRGlkRjJmQkpYT0hr?=
 =?utf-8?B?WDQ2cUIySnJVTTJURElGSjFqNTRsNzFZT3lBeDFWVUd3V2VBaHdaUkhqU3ZR?=
 =?utf-8?B?V0ZpbGVubmlHcTZ5UDNXcE1PQUpTeXRqcktrbnFQUTJoemVvTEt2MUp5amZ4?=
 =?utf-8?B?UmZsYy90cVFKR2ZsdWJCTkNBYURrNzRwSmZpSWM4OHdMRmtlUlIyZnZwc1N3?=
 =?utf-8?B?MnF6MmFoS2hyRkwxWklXanJHU3Vlb3EwVU5ZbGRqWEpsTHI3c2VsY2ZpUEI5?=
 =?utf-8?B?cmF1Q2ZRQ0lHOXJHaUdkdzFxVGk1WVNEdmVqN3FkSWg1bmFRanQwczVjcjAy?=
 =?utf-8?B?b0VUUWtyc3lDaktEbjZMQTJiYWhXWklMVC9ZOTQ3TEV1VEF0THlBTHhnai9o?=
 =?utf-8?B?b2NhSDI2OU5OREhPRkMrYWdaa2dsaUJFOWlKaU1TUzVXVGNpYkh0MUdvQ1Vj?=
 =?utf-8?B?WUM5U3VncjUybXkzRHdnSUs5YVYreW1zT21MOGdlYWFIT0k3N2RtVlF4ODNN?=
 =?utf-8?B?WUEvd1REYUhXWnJaSUpuaHpnU0VLc3RmSkIwalVLeVZ2SklDR1RJN2Z2bjhF?=
 =?utf-8?B?R1FVVzRpUmJBZEdlRFpNNlVodzFKOEdRejhMTjY3MUxLVVAvZXhtWndGbmwx?=
 =?utf-8?B?MVZPTWk2dDh3Yzl4MUMwSzRUSDVhME81d093VW41NmNMeDZGV0FCMEg2S0Fi?=
 =?utf-8?B?VVNYWTdLYk9BSVlvUmNwUGNuYmRXejdlR1FUbHVrdWtyMUhxdURJNnc3T25l?=
 =?utf-8?B?cnUxbmNBYjEvWE1ZUFYxR2wzQkJlcjUrZW42RmJURWc0RExXWW8yL05ydG9R?=
 =?utf-8?B?QVRGOE51RGNPQ0crSHZLWTZHREdreVM1UTZNNUIranVTZmY4eFhMVVBsUnZJ?=
 =?utf-8?B?dnY1dmdPeVorUUJyVHVjYVJ1Rkl3cnhKenA2NHdUYzJYUWNZUy8yUmdlQ2o1?=
 =?utf-8?B?bjd4dEhnNzdDaE9rZEQ3T3AraDJYR1NwT3krVmtwWFQ4aFZIclhrOThhWmxp?=
 =?utf-8?B?aWlnSWZNVUJWbFpxVzVTb2J6b0FtNzVLU09FaW5RWFN1RzZpSzhicnJ0cXlV?=
 =?utf-8?B?QjBLOE53Rk90SE9xbXFLT1hhbC9vQkMwWDVrazdmMlR0Y2V1c1NKRDVYL3V2?=
 =?utf-8?B?U0R0OXNhb2h2RThUNFZYYy9zckFZK25EcGhpMHBibmY5b1BZRTJCSmtOQzVM?=
 =?utf-8?B?U1ZsbTdxM2Joa2pFcWd6eHJSd3JXZURDMi9nUjVRQVBPZTZIaENDNC90SWZT?=
 =?utf-8?B?cldJaFVTSXd4bDAwb1lCdTlhZmhnV1JqUHM0SHM1STFmYjVtQ0RDUGZ1bHpo?=
 =?utf-8?B?Zmc0cDdhMHY2S1gzeng1QUlaOU1aRjJTOWRiejBPOS9aV2lRQm5pb0lTcElS?=
 =?utf-8?B?a0NWbk5sOUpValRDOGtBRTdBV2NZa0NGR2NQOXlUNm1KVUd3eEJ4eGtrM28y?=
 =?utf-8?B?Z3V6ZGorb2dFdTZKWndsUzFBWVk1OVdja1J0MEZRa0E0dFlzYjl0M0RtcEVw?=
 =?utf-8?B?Q1NHNWFLcTI4MlhoRU5HMG8wZmp2QVdheDBZNVhtYVlidUdaK2Q4UExlSFU5?=
 =?utf-8?B?bnpENEJHUVByL2hOQW5NQmsxV2NDOWdkelZ6ZTEyWVB2QzgyVjNUak0xNk96?=
 =?utf-8?B?T0FmcTZwVlBpcXRuQ0dDWmdWU2k0LzdmcUZMeDhWRjJ1TEJDNHUvNFlJVVYy?=
 =?utf-8?B?Yi9jaUc0YW91ZWNhR25HZE5pYmtrMEZSd2lpR2d5aWt6QkQvTVR2dWErd01B?=
 =?utf-8?B?eHlPam9tenhTT2RMMldoTnIwdEhDdHBtRTBKVGZzTWpmWks3RjdVdW9WcnJw?=
 =?utf-8?B?akVvUDRlaG4wbWRyT1dhQXp1VHh2R0E1WTJQNW1aZFZESnpoOHM3U3YvUmxP?=
 =?utf-8?B?M2YrejdRUlBJZlBUWGFaUm9UN0N3Z1BONTV4VDlUbEpSOEhJWVZVQUVldmNw?=
 =?utf-8?B?TjlIOGlMaWFTd1Y2QjhrOXNtRk1XWjJ1Nko3ZFlVVlkrQmNPRDVKUk1UcU5X?=
 =?utf-8?B?R1dPRWhMK2xEaWU1dTdNRzh3OHIzZ0JadmZLbnBhQ3lYTHpicmkvV3E0YUtz?=
 =?utf-8?B?TjdqamZERFI3OVlRdzhHbnpVdkYxb1Vta01vVVU4R0V5dXJHc1h4c0FnS2RV?=
 =?utf-8?B?ZWVnYVhQTjNHNHFaKzBEYW5uUXptTWkxUVB6QUd6QnVHU1dZbEJwWVdtYlJ5?=
 =?utf-8?B?bDVONWtjV1p5U1NoM0RXVkJMYnFXU3NXZ1B2aERiV29nS3pndEd2NlRzSm12?=
 =?utf-8?Q?XolnsMLoNyG5EJk4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabc67b6-e832-40ba-15ca-08dea6c07d01
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 13:57:59.9475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvxHfnvnnurEGgIZ6wXQoCAOSBpW5LeYdvKlgP2P6De0D/B0erocysH08RqxBQpn7exLeBEk37XTyVV7nI3o7nEX41F3X6v/8H8Xq+0Rh54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7416
X-purgate-ID: tlsNG-d62444/1777557486-BF478FF4-82CFC670/0/0
X-purgate-type: clean
X-purgate-size: 1761
X-Rspamd-Queue-Id: 421294A3C52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid,docker.com:url];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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

On 29/04/2026 1:48 pm, Anthony PERARD wrote:
> Without --platform, it seems recent versions of docker ignores the
> platform of the image when pushing, and it's pushed as the platform of
> the runner.
>
> If we happen to build an arm64 image on x86, with recent version of
> docker, the image will be push as if it was an x86 image, then
> `docker run --platform=linux/arm64 ...` fails. Even if it would
> work without --platform, gitlab-runner will not be able to use the
> image.
>
> To go back to the previous behavior, we will extract --platform from
> the dockerfiles, and use it on the command line.
>
> --platform= is needed on both docker-build and docker-push. The first
> one so that the image is tagged with the right platform, and the
> second one so that we can push a "generic" image without been tagged
> to a particular platform. --platform on docker-push allow to easly use
> the container on any arch, without having to use --platform on
> docker-pull or docker-run.
>
> `docker push --platform` seem to have been added to 1.46, according to
> the [doc], and doesn't exist on Podman. So we need to check that we
> are using `docker` and that the API version is new enough.
>
> [doc] https://docs.docker.com/reference/cli/docker/image/push/
>
> Also, introduce the $img variable, to make the lines a bit shorter.
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

For the code changes, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
>  automation/build/Makefile | 24 +++++++++++++++++++++---

There's another docker push in automation/tests-artifacts/Makefile

However, this fix should allow me to finish the work to purge
test-artefacts/* so the problem sorts itself.

~Andrew

