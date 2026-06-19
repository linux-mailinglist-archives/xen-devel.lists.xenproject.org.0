Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X2V9MpwKNWpNmQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:23:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B01C6A4EFE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:23:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=jAkXImpZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341960.1602254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVRh-0004IN-DW; Fri, 19 Jun 2026 09:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341960.1602254; Fri, 19 Jun 2026 09:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVRh-0004Fb-Av; Fri, 19 Jun 2026 09:23:29 +0000
Received: by outflank-mailman (input) for mailman id 1341960;
 Fri, 19 Jun 2026 09:23:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waVRf-0004FV-FH
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:23:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waVRe-006d9n-LD
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:23:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350a86-e002-0a2a0a5209dd-0a2a4502cca2-22
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:23:26 +0200
Received: from [52.101.53.24]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350a8c-fdf1-0a2a45020019-34653518abb1-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:23:26 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5351.namprd03.prod.outlook.com (2603:10b6:610:a3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 09:23:22 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:23:22 +0000
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
 b=J1giMZc1lvWuLwanyDIXINHwNVuWg+SgUEUTA/AesXTo/jReSminhUdB4gzIWdpMCY18jL/WE1y4GmlTtDbmGwQbFeYw2VIYWWXGb9k8Kkg3tBuqljG1SWmOhhYs4Xudmyp7Zdo2QiQlRt6zHALQ8y4/jJOmBKe0+UD/gKw4+4tesxcMRWLm5PL5wIsV2zT16/4gAQlUlqO4sJwMY5ET/Iik4YocidWpakVoHkcyIT/CheB6MHH9dZzyAPtfIk0nlHnb9yIg+30RLKtxL6epUUl/8s+3u4w36kR7HuwmHoJTztlGyRoHPYililPBzjkch6LPWFMnssuROTwUTmo1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRVQwGQffPVXzVGbRY6Iz9BjQvUKZwiE7tL6rgGJB44=;
 b=ntbqZ+JwwpIjbasREc/9tddmmVtT5l/yhpa1HOAMSU0m2BD2R7dOkF1bsBBd2cm9QpC26Fgw1kCE6DjS6TtwbkN5HFkqec+3yH45OQARKIh4xQDLi25dI8AQ6KQFWmaQ6N0nkqaiMKWNbFjFyTlPkY7waQexqNWRkFs96JKWW++LrFHVe2FB9LK4B5+lLcGBPVtXIaPUr+l0etRbhX4/Wxz2ylEuNhKXf+v39SMJ46c4zVMVffrPCcxdO1idhSMSzUqLtGbxGd6QLtLKCmGhQhMi8ChmVUrlgV4k50ut6EHRFHSFqFEPDvGIHUQ7rLyFoWrBmKegDNkYeOn4LNxtEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRVQwGQffPVXzVGbRY6Iz9BjQvUKZwiE7tL6rgGJB44=;
 b=jAkXImpZO57dxR89/pBsJeuLldDGMQjmhBu9KBc94weLwqkZc7hWczQK4pTCLHsdczvr2E0yNJN+2JcP03j2YLSPAUQRX/QupnxYA1gYO5jl3iKjTlmtTuGmJS9aJfr9qvx2E0Xu5/9KodRXZMwIw7LZXtVY6H7MtoNrDj9q+Go=
Message-ID: <4a0ffc46-873b-4c69-a8ee-6a504c1a73d4@citrix.com>
Date: Fri, 19 Jun 2026 10:23:18 +0100
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
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0168.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a27048b-e662-4c83-985e-08decde4684f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	S87PHMgyVJUItJRcz/7DPBnRx+nTMb9FCrxQoZrKk+gnS/FIhBkR0lzNq7tXbBll+aAFAVpIFUI5JvN7djrubUIaDw7FyS21pIESN+hBaAtpVlV5Bq1c1AL2xHSEmjEwcLeOtr6S0HDhL0fE8S60+AtZ0+CPkKQsAd2nedS3Wq5sV9ONLbpWrYQ9m6zFy29my6VvxQVvW28u4AfKvS2zHXAbyePeu66zkIiiwU6OMZnTylDRcGN97lkHowtpyg0/5KAdE6KaWmzWhYiyc4cl059Dzy+ApMQHzD5GkZxtOtniIXPdvCxwYOYydOscPNdL6mxw3Gf9Sz9xyera9OftKVdGkzodFznHqAN1dNwTV3jLKkVR5Ow3mhFbmwxjhATgwRctsdSdGm1100adVIIbgFHkNvXAM5rpHWZbGDFVmEf/6TeKLneU1QizN0YuCcAKig9B5eEdmwd2Q3+I2O6CjI+5aYVw7Amb83EqiM3xOS2SR1aYRdr0UCJJQZBPQsrw4km952xvRmfQ7xX/s0TVqaCqbX9vqY8M7lUugR6wNphTqK3DCdIK/2AHJ59Hx14KcVJ7jnIHgDIAbWHeC0b89ipitzgp18+bx8uRbinQadOqSkkYLX3kP46PZaBaniZoUJi8zZSqmN1A8UDo9L5A3FGu+405ZyJ+KXB70oxwWhk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0NFRUZwUnVqbHdrQnZoRlNBVTdVbTRIRUVHVEovVVBVWkdDWmlDTXdMcUJX?=
 =?utf-8?B?a09kM1hXUmhMb3BpZThCRFhpRFdJMU12QVFpaURYcEVZdEJhbHhqcE9IcUpE?=
 =?utf-8?B?OTloYUhZMmlzTi9WOWgvVTNoS2ttb3NVNUEzNFIwcSt6WkxJQmQxbXZPbHdl?=
 =?utf-8?B?OVdBUXFsK1FGek4wVm9kL0FqbTcwdUNaL3B3SXQ0SlllUEhSZXlNYU1Va3Bk?=
 =?utf-8?B?YmMxTlJxTGNiNHR3NHVUS3lJUnRrOFJWMm5vZ01Bak1LN3MzRS9XOFZyZXNs?=
 =?utf-8?B?VnJ5NUVRSmZvWUk2MFZQY0E3QkpiNUtyS0VCNnBpdkd2YXFNdktyYjBUbGNP?=
 =?utf-8?B?NUtCNUFOeTgyM1BGUFpmZGUwVWk3OTZLejhYbDVJV0hUTWlyWHN2cWhReWhE?=
 =?utf-8?B?ZG9HS1ZnUkNSeTVEZGVTVCtibDMveG4rSC9ROE4zYzA3aGVUR3o1VGhGRlI0?=
 =?utf-8?B?cm5TZ0VrTFduUkZxN2ZqU1VTTThlYmxMbG4rUXd3b1Via3VvZTlpUkdvTjM3?=
 =?utf-8?B?TUpkN0JUbFZXbTF5VERyT0hZNTk3aCtpNlc5WTdOZHlMbzVmMDFMb0NQTUp0?=
 =?utf-8?B?VmJpQkFEbno4YVA1OUVUK2N3QmFCV0ZjSFZ5Y2UzTnJQNGZTYnVGUWtCV0x3?=
 =?utf-8?B?UFoxamxqeEEzZU1nekUrVFl2RENWbnNRa1NNMlp1ZThaVk9nb3ZPa2ovelMw?=
 =?utf-8?B?eDNGV1dPQ24wWmdvNDNjeTlHRUN2ZThzUGQ5OWVHaTNBSnRPYk5aNWxMYjZh?=
 =?utf-8?B?RFdSZ2FkYkZvM0tLZEEyampNcFA1REZxUVZ6N0pyVUZZMHVhK3FIS2pDcGJF?=
 =?utf-8?B?Nzh0MkU5OFBJTlc3Y0s4T242NmVGMW96cGFVcVNmSE5HOERXYzVYajZpekJy?=
 =?utf-8?B?Q3JTNjBiVlVxdUVPQTAzbWhxYWNEMlB6VmxWcG9XZVROL3JRdVlvUkxOZFA2?=
 =?utf-8?B?OVo5L3lIcCs2RVkvSkNYWkhBa0ltd3h3dDFhUDIrMjlYN1RMbkNQN05XODJZ?=
 =?utf-8?B?aHZ6UUtPN2pSdzlhNTY1Tm51ZmxLUTg2aEhLaXJoc2JrNTg4Q0NSTk56SzAz?=
 =?utf-8?B?RTFCYXRQVTVscjBJVlZhTW11OHpXZy9sSVVqOGRvUTZlczVMMmJxdURRQXBX?=
 =?utf-8?B?TlpJdEJFMWpNMFBiUE4vbjQrNm1DSmtnOUhRVU16MjhDTUxMbjNJM0xVd2Nh?=
 =?utf-8?B?MWVCcjBNaEVBR3I5UXYzMUkvQitsZjVBMzRwbjJSRElZd3pxWENJK3dsVEZa?=
 =?utf-8?B?elNySHJUREY5SzF0K3RFZHJPeXBuS3VYNUgzNlhCWnEyVFFycC9TSTZtYXBk?=
 =?utf-8?B?ZnE2M2drVEV2NWdFSnZ2S3VIWlZ3RjFVVURSWURhbi9NL0M3YmJZa0srdnV1?=
 =?utf-8?B?L3NJTVU2bFphMzVPMWk2MnRjVjd1NVk5bTBWc3pOSXdUOTUvYWpySExSNU5a?=
 =?utf-8?B?c2xWWGNvZjFwT0h1Mm5pblV1Z0J4clEwNUJ6bVIvOFpqV3FGUGZIbDBUaldQ?=
 =?utf-8?B?azlZYWNxa2tXa2xRT01vSFBCZTk3bWhjZWVkdFRjaVRrT1V3c2FMMWRJK0Rv?=
 =?utf-8?B?S1ErMyszaVplcStUTng1dWNSQXZTS0N5NUM3NTAyYXV6OHp3aVpBR1pMVmpw?=
 =?utf-8?B?R1NaamhJWHhHUm1udCsyRml2MFF6Ynk0MDk2SlFGYm5KRGVPR09vSXZvUEFm?=
 =?utf-8?B?VmZrTUxvL3Y1TUlVVmtpclhhbDJLa280d0FacjNob3hva2xkT3B6L0paT3By?=
 =?utf-8?B?YUUzOTUxTFlwbFVkM3drYjBkUzExSURyK0hEell0MjBTcVdReVJxSkRYeng5?=
 =?utf-8?B?bzUyVDArdTg0L25FZ1A1Q2dLYkpjVElOb2RGaGFWeGxxTWdZL0xIV3locnpM?=
 =?utf-8?B?WjlsWlZLbUgzMW90WllmdFlSemg0blByeitkamVtOGt5cTFxV0dDRjRzN0ZB?=
 =?utf-8?B?RUhsOGVoYlBIaW9ZbGQ4ZldpWmU5blF6ZFdwczBqUjNpZjMwK3ovbTE3QzR1?=
 =?utf-8?B?U0gyYVA1cTBQRFpCSkpiVFlSZElNNUNuZVd4QUlhZUJnSTFZTkI1YXc5MHVK?=
 =?utf-8?B?cUlJQWxIRmRZQkhUTU1walN4TDNtVzRMS1NQcmVVeDFkU0pVc0dkUWJHaGVv?=
 =?utf-8?B?QU9IaTFDZDhpM1JsdVRIZzdmeml6YTZqNVJBODF0U25sMUtiL2hLellhZXRZ?=
 =?utf-8?B?NXk2Q2laSzVQMGx4MlY3cHUyY0tQVWpVSHNtaUdFdUYyZHUzSDUvWlorYXA4?=
 =?utf-8?B?N1d2UUZNMWZubmlpZXNsUng1Mmp0cnhSZXk0bE9ZL3dnU2xvN0ZwWnNPaTc2?=
 =?utf-8?B?Ry9ORGNEbTM3NWN5RVZnUTMzSlAwRjIzcGEwSDdOK2I1N1ZWdUMxK0tzUnNG?=
 =?utf-8?Q?0KNOBa4/nRjrn49g=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a27048b-e662-4c83-985e-08decde4684f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:23:22.0180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0GuH23L5Zvl8kQlcay59gqjV5P/1ytzpHHR9OsjVQI5P/EA2NZyAp6Zyi+vtbD+st21w8V2dRG1SpYhy1hCPDumweg6yhk87FkhXOXkRgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5351
X-purgate-ID: tlsNG-720697/1781861006-4C8103F3-A39F6D1C/0/0
X-purgate-type: clean
X-purgate-size: 3191
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
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
X-Rspamd-Queue-Id: 1B01C6A4EFE

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
> index 2a756831a6..71e5a51a58 100644
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -413,9 +406,7 @@ static int __init acpi_parse_dev_scope(
>                  if ( !acpi_ioapic_unit )
>                      goto out;
>                  acpi_ioapic_unit->apic_id = acpi_scope->enumeration_id;
> -                acpi_ioapic_unit->ioapic.bdf.bus = bus;
> -                acpi_ioapic_unit->ioapic.bdf.dev = path->dev;
> -                acpi_ioapic_unit->ioapic.bdf.func = path->fn;
> +                acpi_ioapic_unit->ioapic.info = dev_sbdf.bdf;
>                  list_add(&acpi_ioapic_unit->list, &drhd->ioapic_list); 

Looking at this more closely (because of an issue in a later patch),
swapping bdf for info looks wonky.

It turns out to be correct, but would be better with:

diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index ac828e5fe8eb..dc05774629d0 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -407,7 +407,7 @@ static int __init acpi_parse_dev_scope(
                 if ( !acpi_ioapic_unit )
                     goto out;
                 acpi_ioapic_unit->apic_id = acpi_scope->enumeration_id;
-                acpi_ioapic_unit->ioapic.info = dev_sbdf.bdf;
+                acpi_ioapic_unit->bdf = dev_sbdf.bdf;
                 list_add(&acpi_ioapic_unit->list, &drhd->ioapic_list);
 
                 gfx_only = false;
diff --git a/xen/drivers/passthrough/vtd/dmar.h b/xen/drivers/passthrough/vtd/dmar.h
index 47e6918b45cc..5ab95c68bcf5 100644
--- a/xen/drivers/passthrough/vtd/dmar.h
+++ b/xen/drivers/passthrough/vtd/dmar.h
@@ -29,13 +29,13 @@ struct acpi_ioapic_unit {
     struct list_head list;
     int apic_id;
     union {
-        u16 info;
+        uint16_t bdf;
         struct {
             u16 func: 3,
                 dev:  5,
                 bus:  8;
-        }bdf;
-    }ioapic;
+        };
+    };
 };
 
 struct acpi_hpet_unit {
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index dd2788efd735..3aa8babdfd55 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -98,7 +98,7 @@ static u16 apicid_to_bdf(int apic_id)
 
     list_for_each_entry ( acpi_ioapic_unit, &drhd->ioapic_list, list )
         if ( acpi_ioapic_unit->apic_id == apic_id )
-            return acpi_ioapic_unit->ioapic.info;
+            return acpi_ioapic_unit->bdf;
 
     dprintk(XENLOG_ERR VTDPREFIX, "Didn't find the bdf for the apic_id!\n");
     return 0;


Personally I'd be tempted to just fold this in as well as it is relevant
to the acpi_parse_dev_scope(), and because this is brining IOAPIC in
line with HPET, but it could be a followup patch if you'd prefer not to
mix the two.

~Andrew

