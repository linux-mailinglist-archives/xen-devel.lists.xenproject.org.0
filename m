Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEEhMTosxWnb7gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:53:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F6D33586C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263998.1555755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kCs-0000LE-Nf; Thu, 26 Mar 2026 12:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263998.1555755; Thu, 26 Mar 2026 12:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kCs-0000JK-KE; Thu, 26 Mar 2026 12:53:02 +0000
Received: by outflank-mailman (input) for mailman id 1263998;
 Thu, 26 Mar 2026 12:53:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w5kCq-0000Hl-Kt
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:53:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5kCp-009ePk-Uq
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:53:00 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c52c2b-2eae-0a2a0a5409dd-0a2a450b82dc-0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:52:59 +0100
Received: from [40.93.201.37]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c52c2a-ef63-0a2a450b0019-285dc9250738-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:52:59 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7858.namprd03.prod.outlook.com (2603:10b6:610:24a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 12:52:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 12:52:55 +0000
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
 b=EgG70xPInaS8cHWe9Qn2gkDKn9dWTiDowd925x2kUqiR61rTqQnrXlNNz13mbSSzS3mJ9LkP5bQ9Th6JFQwMRu3yvfCr1X2m6xPJp4cmM2VWHn5I8d9o6Jin6npN2+v/sBKI7eZsSljFPevG0M/bALAgTKQ92YNTclFnAAbJAZVayp/0ELySn5zTtBSDx2X+Wch6AAK+lG3bZT7xKJxPF9pIP05N699+fbMXnbvPPWefngZW/v3WWDissPl691LQavAxdymRKS+yw8VDmTrs6TUfvcBhqyTCcPBqdkxOlmaRM9/tcxg6kkBtYyiQXwyIsBdUu++/cA6R+8KRCixxSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ui4DDCaRwVdHZQGY8AVngJOpBcIYzJwB4M+DvQ+RgNo=;
 b=jhdKH2n5vUGoMXUYIYTtL93VGgw/wIqid0Ida+xkHwXC/6Dj8iZJ/4Z6k3k45flS1wwgmYfV1apo9E3DIaxMxhYVuh2ZTriPt1Qsou0+8Tq9FQq7bCNO2tm2f9SX4T8zbGABJDjAS6PMeL4hPkOqzzTKCzv9TJEoLyOOG5yg6UCC0uLQL+uvDt4bCrJVFcRxTY2lOt2WQh1o6imcdw3u7pIjB+uubJzwy00EK2hKS2zmRQ0djiPAP2IBZjCjhKjAIRB0L6mPsoRChSgXUtbZ4yr0MyO3qTU2sO2y7OK7rpPETaIBPLIjGDpzImll6TE+AyWkobH5l7PZeYmRQCmD/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ui4DDCaRwVdHZQGY8AVngJOpBcIYzJwB4M+DvQ+RgNo=;
 b=ePb+fhK9lh7Nq4QwMpNe1hFX3OOYB442AJ/2YO+/4KFRuPokHqJZqJ/AuARFwyHFE6gpTrSIuSXXjUDihumXBtilqbG8K5QIBf/k1D897rxYMoNK4v/uNImYfTRWV9CgBBzSHp19w3aPDrDyon9t+sQdHH3pCEiDwVZmG8+QU+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4fd21b4f-fe78-4f41-b36a-0c63e2c451e3@citrix.com>
Date: Thu, 26 Mar 2026 12:52:51 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] xen/uart: enable parsing ACPI SPCR on x86
To: Jan Beulich <jbeulich@suse.com>
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-5-roger.pau@citrix.com>
 <c930ee22-4cab-4bb4-b8fd-fa5e77f7505b@citrix.com>
 <67cffaf7-ef9c-4813-a829-ad5c962bc535@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <67cffaf7-ef9c-4813-a829-ad5c962bc535@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fb828b-ff87-4f92-8a80-08de8b36993a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zbonSkQsErD0fICLjxNXPZW51+q2M7saWzwvUn+bSMjMWa7V535HTfEdkc0l2gGqqAGjhPhD/YNiRtNbvwqRYgsBMSdMHlm9Qwjzti7OUj8vhTLuX0UDFuINuFePrLFlGIlhd2aWN1KW9uQHQEA0hrSkw9vNxcmFxI8VDpmquiPUg1ti6JsImeXv32MKsctNw5sG86YQ6uFSt6mKwW+CCxqxEbPC+6k8PdQ1dja0z68VBCEe2A3VNuMgttyNW//bYItbzEfv9fSLgVJkwkYjV/nTqMjEzXspjGP/Xem/3FALMSNFCG5dXSAkadW8gPxXWLDoNGQ0gqC4LbNcZZT16A5CwlfY+GePRgbv/U5hgzf6B6IWZdakSFEm8x/NW2YOGLm5iq4nu7EB4DVS+4vC28EulJRbpNrjKsam2n4vvuOtr+ix/wHvSGot1nhQeXF7pIvZBz+4kM19tAw+iWEtk8jKImEVCatIwXtGG4IdHenZnCluf4oeIuhiATVMGmBDZppT/kufBDiBe1el4hlJFlq5i8wU9wlbcw1kiJxHtgKiMPrk/cwMO0R3xOaxgu1ipX1+/FSzHJ7GqvnVVJvcMo7LtULmCrt8QzjrprfoMIdLRGFcp4U6oyaJ+AJylbP62L9DdOtB/QtW3Za/exZnrMYZVuHB2goJC8HRPZUDdjDgde8Px5DFEGGUIi78Oz64lKHQR9XNnBN3Vzp3N6i53LGNaTBe4EIw3DukDT8h1ds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmt4eFhNZXp6d3hTamtyQ2RNZ1NpTGtKeUdkbXJmdnlZNitxeXlDbDNYWjNx?=
 =?utf-8?B?SGRKRWpzc29qSXlUNThHZVNCWi9ZRTJUU3krY1BKTnJuUy9oeFVYTHVsTTNJ?=
 =?utf-8?B?K3c4THRzK1pQMDFSWDVoWHlaK0pNN3E3UTNSditIZjg4dC9rS0E1dVFBUjhH?=
 =?utf-8?B?eG9vYkY3VDBkbW93MkdvM0JCR09TVERiRzBXNHlwNSt3alJDQ1lPWmdDOEZW?=
 =?utf-8?B?YktSR2VnNFlhcWhYNUpxMHNrWml3bWQxN2F1U0tvcm9sNGRkU3VFVmJoalBZ?=
 =?utf-8?B?MVNLbGRpU3picnh6RkhIczlYM2VFelZJYURMN25SbTBJSTdHSW1GS3ZwTGdj?=
 =?utf-8?B?N29RNVZBdS8vZG9udTJUZmQzOExLLzliQ3FFMUVKcUlNRU15Rmp3clZvQ2pR?=
 =?utf-8?B?THNrc3F4R0lqZEVBdWtTM3dYOGQ2aW1ramt5c1VDVE9sUDh1V3RtazhzMDBl?=
 =?utf-8?B?RnBvSDlmNlIxYnVjSFZuV056YWVOWUlsZFo5TlRKb2VodmhLY0pKbW5OK0p0?=
 =?utf-8?B?TUh1OWt4VlpMc1FIRGJHNW8reHJsLzdkWFVVRHZYVTQ1VUYxU1h6eG5KVmV5?=
 =?utf-8?B?Z2I2QnpkeVlJeGh0SFFkbXBiRGg0cVNueXZEQVhCeDBoT2thamJoUXkxL3cz?=
 =?utf-8?B?bjdVdXVsbHIwL3NWb1NVcndYTFJBUndEb0N5Y3VraWxVMVloZlNCLzZUSFRt?=
 =?utf-8?B?cXRRbzdGRnVIY0QwYWNyRXRTMkxtWkpGZUhvazkwV2ZGWE11ckdGV0JEbGlQ?=
 =?utf-8?B?ZXlvNjRRUnRjajZOaENlcFB5QWhmZFRwamtQc1Z6aVgxbXdSYzVxazh5UlZR?=
 =?utf-8?B?ZjFNL25zUkZSL0JEWlRpejk3aHRLeVJacmo5dVpreEpmcTJkOVpNdmJUT3di?=
 =?utf-8?B?Rm5KK0padnhNWjBZbkw3VlRMTVFnRkFIV1g3bm0wSTY3bGhiSzFNR1hYVERZ?=
 =?utf-8?B?RmhNOEtYWU4xdTNPNkhvQ09ZU0c3NEo1UXVZWWVpdm12NXh6ZXFqK0xFRFFY?=
 =?utf-8?B?UWl1bzI4ekNyMVVNajZlb3ByVmtmUVZJOUpxT2pBaWdXNnQvSXBRbk5aUTZU?=
 =?utf-8?B?dkY0cmIrSktJWEtHS1htSndBeW5hdjVRTXBxSUFVeTlBb2ROUXFJMkwvTkZQ?=
 =?utf-8?B?LzYyTlNMUFBlUUErcVlxZldXVUFmZ0VMSng4MHQ0YWsrYW9iMnU2Z3l4dVo1?=
 =?utf-8?B?alh3VE1VeHNZeFdJaWRoZHFhYlYrRVZoWWRZWktnNXd6M0ZvQUt5OVdXQVUr?=
 =?utf-8?B?Y3lkUDFQcnVaMDVQbTd4RXF5cFJNOHo3NVhaOE82SkJPMXg1b1pnQmdpc1ZW?=
 =?utf-8?B?blFaaGtXVTdCL0FOQ2lDNkJlb2RSVnNGMFpVVHNCNlB5b3BLb2Q5bS9TUnB6?=
 =?utf-8?B?VVNZRlRLd1d1UjFiZ2x1dWVEUnpEQk1YQS9nVTZuaE9EMy9EUTNRNy9QVDFX?=
 =?utf-8?B?Wmtvbk5iMUtxWXkwSHRTc3BwS1IvamZ1RjljYjUwUnU5TVlIODY4TTE3dEw3?=
 =?utf-8?B?QmdPOXBzNlB1dTVGVnRHSmJpUHhyS0hmQVBnOFliYWZVUkU0eFA3b3FIWG03?=
 =?utf-8?B?eFJNY2ZLZFh4aE9naDkxUkZYdlVGYWpFVVcralBHbkVxUDZ5cmp3Z3BqMHhK?=
 =?utf-8?B?c3ZQWFZmSU1OMUZ3MGkxOWtZd3ZsV3BEdFVzd2pjbnBHVEI5TE9xY0UwK0Nz?=
 =?utf-8?B?aDl1Uno5VitBTFMwYkMwV00yWVA4NGo3Sy96T2YwWW1sejdLcmZPWmlGT0VL?=
 =?utf-8?B?WUI4ZW5RNWJCR1BwM0NIM1ZKc3g1UXVSNnBreEE2M2F0MGlJSnN3TDRNTlBS?=
 =?utf-8?B?RUd4blF2Nm9wRzlzQXZBd1RKQk1Na0w0Umo1QmZTdjRwcCtFcXlBS1BURlN6?=
 =?utf-8?B?blFucmxmYmpaeENIMUREWlBHemhVRUV4c0xmbEt3QUJWcnNIaUtUcE5iTm1J?=
 =?utf-8?B?M0phcVJyWEd5WkY3MDlFSkZRSGt6ZVp1Rkk3cGVpRURrTWxic3QyZFJYNWtp?=
 =?utf-8?B?TVRKNit5K2tRcDhmd1hxdGZFQmprWDBiNXRlVWVxNjd5ZXB3eW56SVhhbEwy?=
 =?utf-8?B?cW1QY2cwUUh6VGlkT2xYd2hQeFFsazIvTzk0Zm8vNWlGVStZeUpJOU93dTV6?=
 =?utf-8?B?eThsMVU2VVhRZ1QvNy9Pek5pekZnaW1SeTNjeVkxWTY2Z2o0ZW42ZzEraDZv?=
 =?utf-8?B?RUVEMko5L3l2b0RhcWhJOUgvaStteXNWSWhnVnQ5S0Y4enNXbG9wWkVMNld2?=
 =?utf-8?B?Nk5NT3VJeS9SUXl2TXltK3VPSll6MFFVU1lPaWZBWTZsaEdJYUMrMkc5d2Nv?=
 =?utf-8?B?ZFVpY3p3S3Bvci9HdStmbUpJVXM0QkVwdi9KSmpjZ2pZbU4wdDU0a24yQ2dB?=
 =?utf-8?Q?3XCA0D7nYZ1Zh7oc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fb828b-ff87-4f92-8a80-08de8b36993a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 12:52:55.0659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWNqcFoupWap8ZAz+dcrWhHE97e4tIznGjcbzpIDNUwZP+OLu6FVE6LyNta0EieBGj5yvc/qNyV+moM/hj40hznKTtn3cRKlmA4PZf5GShs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7858
X-purgate-ID: tlsNG-42698a/1774529579-988BD112-31EDF3B0/0/0
X-purgate-type: clean
X-purgate-size: 2256
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 32F6D33586C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/2026 12:48 pm, Jan Beulich wrote:
> On 26.03.2026 13:11, Andrew Cooper wrote:
>> On 25/03/2026 2:58 pm, Roger Pau Monne wrote:
>>> Introduce extra logic to allow parsing ACPI tables extra early, and use it
>>> to parse the ACPI SPCR table and obtain the serial configuration.
>>>
>>> This is gated to the "acpi" device type being set in "com1" on the Xen
>>> command line.  Note that there can only be one serial device described in
>>> the SPCR, so limit it's usage to com1 exclusively for the time being.
>>>
>>> I can't test the interrupt information parsing on my system, as the
>>> interrupt is set to GSI with a value of 0xff, which is outside of the range
>>> of GSIs available on the system.  I've also assumed that the interrupt
>>> being 0xff is used to signal not interrupt setup (just like the Interrupt
>>> Pin register on PCI headers).
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> WIP/RFC, not sure whether there's interest in attempting to pursue this
>>> further on x86.  So far the device I have is also exposed on the PCI bus
>>> aside from SPCR, so using com1=device=amt also works to detect it.
>>>
>>> Posting it kind of early to know whether I should try to polish it for
>>> submission or we are happy with not having this on x86.
>> I think we should be using SPCR/DBG2 when available.  Getting serial
>> configuration right is always tricky, and we might as well use the help
>> that Microsoft have forced the OEM/firmware world to provide.
>>
>> But, I think it should be automatic when the user asked for any kind of
>> serial.  e.g. console=com1 with no com1 configuration.  The point of
>> these tables is to provide an enumeration mechanism where none
>> previously existed.
> Hmm. In the PC world COM<n> have well-known configurations unless anything
> else is provided. With multiple serial ports in a system, which one SPCR
> describes also would be (largely) unknown.

Xen's COM1/2 already do do far more than the PC world.  But ok then, we
invent a new "serial".

My point is, there should be a way to say "please use serial as
described by the system", and it shouldn't even require knowing that the
description is in APCI.

~Andrew

