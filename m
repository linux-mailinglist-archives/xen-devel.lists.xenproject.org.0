Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 98wvMO8oNGoFQQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 19:20:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F216A1E3B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 19:20:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=jp37mxPX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341508.1601911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waGPi-000258-Gy; Thu, 18 Jun 2026 17:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341508.1601911; Thu, 18 Jun 2026 17:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waGPi-00022x-DY; Thu, 18 Jun 2026 17:20:26 +0000
Received: by outflank-mailman (input) for mailman id 1341508;
 Thu, 18 Jun 2026 17:20:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waGPg-00021m-E4
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 17:20:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waGPf-00DEy9-RA
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 19:20:23 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3428b6-5cb7-0a2a0a5109dd-0a2a450bde3a-40
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 19:20:23 +0200
Received: from [52.101.48.49]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3428d5-5e53-0a2a450b0019-346530318762-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 19:20:23 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7746.namprd03.prod.outlook.com (2603:10b6:610:241::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 17:20:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 17:20:19 +0000
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
 b=DRW1hsz2U8Oc9rmdX5gl2EpUBv/oXZ2phPxTOi8yM8Cv0G1/x9Vf1dYmwX5O6cWXwnhXyDWiypGuwJX5kucd7w7UpKOcxmz2RAS9D1xF6vFbuta9Cyv3RA+80XBtq6wkjorXpCxPQ7xRRqh7v1fYN4tnGIHQC1bdNkBioLwDytxB5NTjyzPXAf9dSBf2r36NUlT81HfAv7VlYPNOwZpOYHrvjU+yWSKkDXc7H9bdxJpXCSd1aUFR7WfJp3dVhN2rDPYy/NHXMHdsmFzfiaF+qNc/CRMMas/YKO9g0N9tLtQtVjFYh3Az+Zongg1mLDCFq9XUsBcyyIpYgXqF72RXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKnkAPElqqbeiBw2iBcEtd5uEieEeaTX/LOwlMzs2Lo=;
 b=qiXhMVjiLtFZdpgCd7uQa5RUPnG0bD4AVNTMqIZs/E9xvkarpkDGnEBKZ/AbnvMlUUvi4hKMLA8X3gfcNbIHLT+JSScHfYjajWZzUJqBr4jSr7nMHhkfv2Vj2Ah7oc2L7pJ3bpZOojkxCIvgdO0VIiZfAWHluHBQ7S7ezwtM/qJH2VBF3uKjoI5sKwE9IyzsTPXs7j+wgb9dlbFAJXfEyqWXl1c6wWaLRFPhQAeDjXpFJv8rZi4+a6UfZuYOTkX5UjVm18BBg8rjoRHYmc2TBiIMZj8ECpfuhZpahfzKldOHVcDMhz9SxtQi28+CYmsItamJRbhdfl7vEgZ8EDOO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKnkAPElqqbeiBw2iBcEtd5uEieEeaTX/LOwlMzs2Lo=;
 b=jp37mxPXP7xR6x0bDuaIWZUC0ZWy+PBtTTH0KVMyFFESENBmBOT6g3RKlgTB1Jkbnu4Qf0+419CX+ZR3UzzVNfLls145Dcs+aW+bSO+/ame58c5CWaR4nqPEvMILftj3vJd6usG9R+HEq3yintskGptSeuiN59aRlqYFNZP1LEQ=
Message-ID: <2220e6e7-4f2e-46fa-9c13-5864797f02e7@citrix.com>
Date: Thu, 18 Jun 2026 18:20:15 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 02/15] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794551.8631fc262581453bbf619ec5b2062170.19edb3b36a1000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794551.8631fc262581453bbf619ec5b2062170.19edb3b36a1000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 1318876f-7d2d-4960-b1e7-08decd5ddf21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	63bkHxuOhrn6iVvF0V1lzUpwSDI8UuPtWaqFn7DBlGLmUtdtfsDi9WeBVXPoOlLMPBSxzjFFLJ1onPRQF11H5mZ3Cn7XfjS/D/mXuUcT0ELJyFhDifgOGOD2K7za6bfUt0J4hgLmUQg2Fij5RCefM5cDXMVeZUo0JHlT4OFcnFiFilFlT0UaDNi98kdoGh+9neQOUjgZjLtGHLdMOdPdra6Gf5XuwJPlOr0PnqZrZDsxqXzJCiUUe1gYIML+Ev+Ku4cUUMHm5ZJ72myKOb9NeoaogpzepjOki+q72VKHEGYfDsWpy98Kx1MmyVwiicE/gjXM28QsSdhpRGezW+HYrr1znH6p+JLb4YbRRrOvKviNUGY28a5WJ2VCqFo6huatsa+uHdU9LpsSPfFtpCRUmJa0ecbXbRpfxtXgstjqWqgXhC7U3LnazQKzhUoxQzubfIydrictSYeJwXxYsOEt00tJVJb277jH8nPbzHbL/4OlSc7OlfWq1MPOQbakiC8qDtQbk418B0WTHO2rcRamyEMjjBuWZ54Jwo7o1NnAFEqUNc4z4KvB9U68ehIuy53LmWrslMeIH4PKYObYYBYaLEOVG1Wbsj0UGZPBI21ErKJzWGCLUTDfMxxWfSsEnf7DsKJ/tJ+DS0O7qpJ+FAU/ZzZ3ok95k3S5KCLg9UBjJRrDuM+twISzQ68nlUpBTxBS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTdBNjV5RDNmYWxLVGoyOVh5Uzc0RkJWaHVzM2pleUJVemQzR3VzdG9QUXNW?=
 =?utf-8?B?MjZYZktITmFKT1JPeTJyMkYzcEhKNkJVQlhUV2FQU1QxMUJFRm54cC8rSDJr?=
 =?utf-8?B?a0JwRTZ3TmE3RzFpMGNuSVB6bEppeEJFOG00Ujl2cWpZcWcrbEdTaDZBeTZa?=
 =?utf-8?B?WWtoRkhGU0xFOVVSUlh5MThUZWF5cllud1oxMndQQW44NWNpUlo4Vm5leExU?=
 =?utf-8?B?MEFZeDJmUXlYU0VaQmtZKzV2UnNsNHdtNVpiNE9hNDR4bDhacHlOcWNidVI3?=
 =?utf-8?B?N2pkT0JCek9SQWlqdmkzTVU5RitvOGtRL2k5YmlidE4zV3pyL1Rtb0pPSzh3?=
 =?utf-8?B?NGZTZTVPRmhacmpxRm5UazI5eHdEaEZvU2k1NDIwTlhvSklOYklMMDY0WVFm?=
 =?utf-8?B?MlNUZnhkRzJtd0lPenliTDJ5UUk0R3l1SWhPSXRWZ3Y3Z1lBTkE3TWNsazFZ?=
 =?utf-8?B?NVNheEpqaGNobzFFQnZhZTlVa3c0SW1VWjRwVUlKKy9VNTBndCs3R3JCZ3Fi?=
 =?utf-8?B?M0c4U3kzeDFZdTFUK1hVaXdQSk5rakhXRkZadmJtY0FxcFBKT0RDM1ZIYk9I?=
 =?utf-8?B?eWpuSFRxQkxxVlFybHNqSmVtTWVMYlU0Y3JhTTM5ZXRucExneXFiS2d3SUMy?=
 =?utf-8?B?RWtHUzcyaFFzS2hCNmtaVmFCY0txUXViVTlYa0pDMFJKdE5CWW9VMjhrd2Ev?=
 =?utf-8?B?Y2hUK1ZBQ29SL2ZTalg1Rjg5WnhySmt4dmlMZElmRmcwUm5ocmg1MmhVeFNY?=
 =?utf-8?B?SW1BdStKOHloSGYrcURYdEJOL0RheXp4WWJkLzM4ZStwZElzQXJzQ2lvUzZm?=
 =?utf-8?B?RnlsZUtvU0Rta1B2bjFVbUJoZktacklSZmhYdXh6ZnJaVnd0Si9OQ0Iyb2R2?=
 =?utf-8?B?b0dNS0U4b1dodmdKN05yMlZuNytOTjhvL2xlLzJxYzkyL0UxTGRDTWptNXkw?=
 =?utf-8?B?US9sYU9ReVNyZlpwSld2OXg2UDhQblI3ZDlIMTVPTDNNK3d0V1BSNjRtUGg4?=
 =?utf-8?B?NEs4RVpHQXlFMGI4U0JOWmx1cGhBbmd6Y3o1S3J1RjhZUEtJTTE0UEpUb09U?=
 =?utf-8?B?Z3A4NEJiVHNBMm1rZ2tDVmpPTGFFeG5PMkRaRzRoM2psc2ZhYm13QmpLNDhE?=
 =?utf-8?B?TlBnUVEzRDRtNVg4REppbkZkVmxpYjFZY0FKeURNRDFXVUdtcVdVa0FTT0Y0?=
 =?utf-8?B?UUl6UjZyWVVKckpPSk40YWE3U2ZKZytvb2dvU3lYNXo3UjlFeDJSYWlLd2Q4?=
 =?utf-8?B?cVNhaXdwTG9UanliWHkzbEhHa1AxdXJwQzVEb0w0cXhKemNSbEZ2UnlCbDhF?=
 =?utf-8?B?KzlsT1JpUk9RVSt3VXNKWlUreXBUV29GRDluMTRLUXJZd0VXei9ETGhac2sw?=
 =?utf-8?B?SjZlNzArM0hhbTJRcVRPY2tBT2wrcUczT0cveDZTUndZSkczWjlIck0vdmg3?=
 =?utf-8?B?SXIyQ05RSjByY1NyQzBKVXZ0bkk4Ri9HWUJYZnY4aXJTZDN2NGFjRUthKytv?=
 =?utf-8?B?cERra09ENS9PdC9YZEVPNUdaWnlnZW01cTJCaFU2WXU2Tld3SDRXOS9vVTds?=
 =?utf-8?B?YjRTUHdveGxoZno1RWpBa3l5bVhaQXZyWEsyZjgwSUVQbVNKRXJOMHNOM0hw?=
 =?utf-8?B?L2JhSUlHWTFoM1dVYUNxMXVFbExwNjFjWEd4TVBNOVVjUEQvY3YxbURESWpG?=
 =?utf-8?B?QTdIeXRQYjNCOHZSRUgvL3g3OFRaLzI0T1lRUnZHRGhVYUkrOGpNNHFibDN3?=
 =?utf-8?B?Q2lsNzJyM2ZzbGNTNEpSQlp3UDBIcUY3RzNPSVdONDZmelRibERlTnNVK08x?=
 =?utf-8?B?ZFRpOGxtRFdSaWVYVFJ5cm1OV0htRGxmTG8xY0x5Q0ExVExOM3RtRnJiQnNE?=
 =?utf-8?B?ZGQ1UXZETDlPSXdSek1HQkdYMmloZTRMQXFMSFdKV3lVK2p4V3JCUDlONUpR?=
 =?utf-8?B?bTVqOWVidG9CR3JYUHhMRStFbEJZK3kvWm5zYWo4aTlBUGllSWFoMXNPc0Nq?=
 =?utf-8?B?Mm95a250WTJpNVE4VW9NMkVvWGZ6S2IxSi9QM2hCS054MFVreGZwOFhxYWpM?=
 =?utf-8?B?VTNIV3A1a3M2L1BNdndFL0o1bzZoSWdqWTNBMXRpRFpMR3d5U1ZTb25LdFUy?=
 =?utf-8?B?em9PNFFoR3dhamU0VnRhb1lPRStFZEYzbE1iL2xKdlZYVzM3dk9tWnVVSDhW?=
 =?utf-8?B?cjZmalpWR1VXUmdzNC9rQnNaeXNHQm0wclkvNDNHVjJrT1hqZGVXa1BKRTAv?=
 =?utf-8?B?d3VWamlGanVXQWQ5WXR1bWtYc0VWMzU0b0hTTC9UdDFUbEkyd1E1MWM3SDMv?=
 =?utf-8?B?WDlTQzJvOGFGU1lTalFwOGREVTBmdEFScmF3TnlMYnorUDlOMTFsKzJvTTZ6?=
 =?utf-8?Q?CEP/oKru3IX49LRs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1318876f-7d2d-4960-b1e7-08decd5ddf21
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 17:20:19.3162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vj1twDAXyOjhUuFINYCVW1BpY34G5QjYuL4HjIET9bChfJqkxzrqWwk1ALYuMZia0uqqKZ5e7YX1ZnfACbKjKo/LOGbHitaZFTa1GanCRbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7746
X-purgate-ID: tlsNG-42698a/1781803223-4D9FE00E-F29613E3/0/0
X-purgate-type: clean
X-purgate-size: 1707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17F216A1E3B

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
> index 2a756831a6..71e5a51a58 100644
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -310,7 +310,7 @@ static int __init acpi_parse_dev_scope(
>  {
>      struct acpi_ioapic_unit *acpi_ioapic_unit;
>      const struct acpi_dmar_device_scope *acpi_scope;
> -    u16 bus, sub_bus, sec_bus;
> +    u16 sub_bus, sec_bus;

Please swap to uint16_t as you're editing the line anyway.

>      const struct acpi_dmar_pci_path *path;
>      struct acpi_drhd_unit *drhd = type == DMAR_TYPE ?
>          container_of(scope, struct acpi_drhd_unit, scope) : NULL;
> @@ -332,29 +332,27 @@ static int __init acpi_parse_dev_scope(
>  
>      while ( start < end )
>      {
> +        pci_sbdf_t dev_sbdf;

Blank line here.

> @@ -386,16 +381,15 @@ static int __init acpi_parse_dev_scope(
>  
>          case ACPI_DMAR_SCOPE_TYPE_ENDPOINT:
>              if ( iommu_verbose )
> -                printk(VTDPREFIX " endpoint: %pp\n",
> -                       &PCI_SBDF(seg, bus, path->dev, path->fn));
> +                printk(VTDPREFIX " endpoint: %pp\n", &dev_sbdf);
>  
> -            if ( drhd && pci_device_detect(seg, bus, path->dev, path->fn) )
> +            if ( drhd && pci_device_detect(seg, dev_sbdf.bus, dev_sbdf.dev, dev_sbdf.fn) )

I was going to suggest converting pci_device_detect(), but I see that's
the next patch.

Given that's the way you've got the series, it's probably not worth
flipping it.

So, with the two style fixes above, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

