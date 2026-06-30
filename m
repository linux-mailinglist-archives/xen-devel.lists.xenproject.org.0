Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kT4HHUHzQ2oWmAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:48:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B046E698E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:48:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=GvMJjMWM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349253.1607128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1webcl-0001wL-Ox; Tue, 30 Jun 2026 16:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349253.1607128; Tue, 30 Jun 2026 16:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1webcl-0001tQ-LI; Tue, 30 Jun 2026 16:47:51 +0000
Received: by outflank-mailman (input) for mailman id 1349253;
 Tue, 30 Jun 2026 16:47:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1webcj-0001s9-Da
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:47:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1webci-007pym-QQ
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 18:47:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43f334-e002-0a2a0a5209dd-0a2a4503b4f2-0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:47:48 +0200
Received: from [40.93.194.20]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43f333-ec1a-0a2a45030019-285dc2142e3b-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:47:48 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DS2PR03MB8369.namprd03.prod.outlook.com (2603:10b6:8:331::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Tue, 30 Jun
 2026 16:47:45 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 16:47:44 +0000
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
 b=sUBsMxyR7wmTFPVtd2BQPf3opSoLRSxup1Cg92Bx+/7R+Di0eAXiEQQC5QZDU7tPCWUsJrTjIM/hf3O8Dkd6FK1l6zNtj30Xn2i9oyMKhtuJr0fhg/u5EjnQp4z37FKLXlnIKjoj2jY9sILh+cNWYHUUaMLJGeMkmvrk/+4uqF1iWZJ/ieWcq+C/DhWHEKfMuSt6iQiy2qnXKjwoKhaMy/l6Od83pcyK7xuT2ouQXWivjOb7TrlhNVo8xgSzCN7l3EY7f0JJEanEsIlLKKI+X4CL4OcnUiBx6G53YvWrCwtJ9GUkavul80cruyovO+vTDt067X7aYWJC5oFGVhgayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/whPeMSbV8GjFwn7LOc1N5sc1AXiv9ebi6EzjmUAr18=;
 b=hahrGT7mz0CFfI7e5TkpueDyWaqNiCa82uRQvFUrBMAj/wueRp00qQYb/n2eHcxtS6pVu7CUeHhvS2S7zsXeESHz93hoyeLqIXayTYNsCVKuQ72XuXVtXzeN35PVi9yKqv0IXaOPQ6BpK/O71ObRymxxMt62J4eLpoHdmpeN4ozDimZkp95vT+zCnglE8OcoKYvWqepnzVO9EdO5GQjrizrsRNITyBB4FlgTlVqai40U9KHB3L2K7h16DVANGQkr6ttNbaJcGKUvikg4xe6WCakHGhz2MAI+qg86/ylsLRfsqNWGUYEZW7ew4Nqt9jTLiDoK84NFqMYqud/71WMsHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/whPeMSbV8GjFwn7LOc1N5sc1AXiv9ebi6EzjmUAr18=;
 b=GvMJjMWM6sAnScyR2WkwtLOO5Mp+5ho4CyAZbka/4kSoFtWtnQGouLbEqVc+gXFtpjIqce00r3YGEODTVbZmXbmOCR4y2uoJ3p2JCmtA+Au6TLZIMIbDwaoxEqUl9yi2toShdrR5QvQx2NhkUKlghj2+WkHyy4bunYn1wiWOzK8=
Message-ID: <a05d32b0-464b-4ecd-8778-0f19101f5a86@citrix.com>
Date: Tue, 30 Jun 2026 17:47:42 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 04/16] libs/guest: Use a single write_exact in
 write_headers
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-5-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260619130501.272832-5-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0107.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::12) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DS2PR03MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: f6976f06-0224-441a-657a-08ded6c74f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	yP/DW/D+ZwtuchJqMTKcd7VyytMlM7qZyAVQfNu6k0ckNSt7EA8kCO20k6pRze4bZRaYXk/jVIuI/Xylw/tUqikpsIwAPhwJrLMJhRCilIXxsbPb4G0MlIMFBIz0jUl3MUELr7qvkjgLCqFzW1QDTrfWsGkPI4Ls5Z22QZgiqViY6vWsoQq0QZzppkyisK3sMqKeLWFbsRma1zVHczLLG2jCFpO7XjKrxyvarvc2sO1Cbn14DJ8hLPgsK1NsHGvE5MCOkR7/kyNXUtW+pWYr9IHwBS6ISEY1pplxyFb2SkVMtGe8qx6AuYPz8QOb7hdbgxRrX2IA4pxr7FD+shvMD7KJWl+VoQfuIMdA3NFXGULWTK+vclESS2RqOoLeXD4M8plQt+Vf2oGUzfRumH2BYsCuV+6d5R3VgNrwoYf2brDx0ZDDqabRebEz2uJZfOTZ7P9vbXE32RJ4yoMbVPrutKJMpF3mw+5A08IhKBRRDPNimkzmMl6D6bmOcYt2pTB6uN2CTlwdOjA6CML+DeGGEd/0cfLWxiJT2XJEbszNmb5EzaaIMCbSrOFGP7o2OzQ+Tk/mxMfLho4WooJzR7Zp0/HbMqq86lgWuX5LC0nP7GaLJLwLGOtKcp8sSNqFhSqehR6EeojxfnSwjG2Wzd/bFDzEAE0PEhCjwSueo2st6uA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWtjV2E0K3FiaFZaNWFFdEhrQWYzUDVXMlFhaWNCWURXWGlVVTUwT240WUtW?=
 =?utf-8?B?WXF2b2JrZjJ3L0lMU0FmU0ZoM3hDS1BTUktVbnVBYlNFTGJ4dHdodlJGalQ0?=
 =?utf-8?B?SnhVSnJWeU5TeUdkcEkremgzZ2JwcG9SNHMwNlZaSDRzN0NtYmNnOXM5bUQr?=
 =?utf-8?B?V012RnBiSTdyMXR4bExWMlp5NzlkbXlDZVNRUWhrc0kxQ2c5N1BOM2hWOUpJ?=
 =?utf-8?B?Wi91K2MvS1ZJUmNUdVNBODFoSFB5dmxzbEhNU2tFamtGSlZEMkNIZE01NTZJ?=
 =?utf-8?B?b2hLc3RvSnhsaWVUdG1RTnRpdCtIWUpYWVQyS0o3RVowcUgrekV1WTk4czRK?=
 =?utf-8?B?VkdTWHN1STdsMGJlSkl6YllISDlkZWEwUWdwVTdqSmovODB2dkp5b3JuOENw?=
 =?utf-8?B?OE9aeGpzT2Rxd3VQdVRiZmJNcndtVnpNbWlZaDBObFhTbXpJTHdTWStQNmxN?=
 =?utf-8?B?T29tVmFqZTZlVXREclZZbTgvVUowbXZSRmtNRHFkdldOVDRQVFUwZHB6ck8z?=
 =?utf-8?B?YkFzcXk2SFpPZkk1S1RvZlloZk9TZHpTeFFXcktjNllha0tDc1dBOUxqdDNC?=
 =?utf-8?B?VDFkc2kxOXJMdUVJRVphTDEzbnJlQ3BrcG5Fak9rL2RuNFZpRU04YnlVUkIy?=
 =?utf-8?B?QWNXOG5hSjNCWE9NQVBvbTA5eG9lUSsvZmo0dzY1Zm1tY2ZadEdDMlpyRXY2?=
 =?utf-8?B?a3JNYk9UQ21GUHJhOUJkYVV6WGJHTnk3bHcxWnp2aWhqNWxmOFh6dWszNkl0?=
 =?utf-8?B?V0I0bnZESlViSjN0VHJJcndES0lUT3ZzNFV0RzY3M0FQYkxQNDJkM0ZJaWdD?=
 =?utf-8?B?b0haSFFDTitXT05NTkZQWVBlanlpRGJXaXh2NTFaRFI5akZ1V3pRSGdzY0U0?=
 =?utf-8?B?WnNWNkJiR1hUckZOQmdvZmVmaWhTanE2eGVJZHNuUGxKQXVVdEdDRFNkMmpI?=
 =?utf-8?B?OGd6R2EvblM1RHgyd0pMRE5GdlFRK3BaTlJsd1YxamNVTnFVc1ZuZ3VBM1R6?=
 =?utf-8?B?SmU4ZlRiVllHZVRkc095V21XL05DOEhOcXpvQkJOT2hvOTQvc2NSSkU2QitD?=
 =?utf-8?B?VE9sZ1AyU3k0OUpzTEJjMnFzeWhqbi9rd1YvSUhoOEZBYkFwUTBaeTY5a1o2?=
 =?utf-8?B?QXNkcnBONXEwYVM4QXhybFFSQW9POFhub2grOXNrVDhtbVpCNGNwcUVrNWRH?=
 =?utf-8?B?Qm1PUERjYWhhb0Z1ZXd6aU5nR2J0WHdqK0piSDdxdHVBcHZ4UWlXV1YzK0M1?=
 =?utf-8?B?OTFyVmF1SzRxWmJDTlE5d1JvaERMZmtzMEVZOGdiYjBNck9GeVRlU0F1REtS?=
 =?utf-8?B?L1N6bStCL2Z5eDBmd2NRaXJBV0hnaXFsa01Na2VsK3R0MUFHUzBLS08xdjlO?=
 =?utf-8?B?YUtJclBiK0g5WTE1OG5yU3p1THo3Y0Y3NzAxd0RvNVhDcmNvUGtsUmRHNnRK?=
 =?utf-8?B?eFlsSUF2eHliRGpjV040aXZEYXYyOXhlWjlTRjdZSmgrdEQ1OXVGUjJISjBS?=
 =?utf-8?B?WXVnNVZtSzZvK25QUS9VQWY2eXJXL3FpYWJSYVlDMWkyRHdnUE5iRmY3aElm?=
 =?utf-8?B?ZVlYN1hQTy9ZeDB4TWV1WW43UytOOVl1VVJ2WXpmMDlleS9GVyt1K2FGQzE4?=
 =?utf-8?B?U3JKR0lBbDZISnVlbjNXK2RydEZ3V3gramJLQ05COG9vTG9Ha0k2M0pyRzhC?=
 =?utf-8?B?TDE5YVk2bklDQVBuRWt6Mjc4TmFEcUJIZjgvaDBNck1UbGJIWnAyY0g5R0R3?=
 =?utf-8?B?QzhKZDJJYjJMQkdqN3VBQVpwbEU1WitFdGM4K21aNjF5a3hhL29JUzZwZ2hv?=
 =?utf-8?B?cUZTVTJjRTdKV3hkYnlLQTlrRkhxVUtvRHNUbDZDTFJhNmNRc0lKaFMwRmZD?=
 =?utf-8?B?M3ZWTjJYVHljQVB3dnR6c3YrVXVOSENkUHpRbmV2OEZIMHZrWmhiVnVoWTdM?=
 =?utf-8?B?WU1hbEpxT1M2RzNXUU03RDNpMGY3UVB6U1BzdG1Fd1owQ1BIY0FGL2VnNVoz?=
 =?utf-8?B?bG1CNG50Z3VWS2MxbkJFcmlZMm1tcUdEZVN1dGVnNUVSd1NWaTZFSjlqenZG?=
 =?utf-8?B?VGZGYmZXWENpZDZZUWtwcGJLMzRCOEh1VzBBWGUxWk1wQ2dWY05uQWdtZ280?=
 =?utf-8?B?S2xzOEJRMm1lSmJHa2pDeHBpRHN4U1hUMGZpMTUyZERoUy9aSkpIZU1XTm9G?=
 =?utf-8?B?YnM4clVBNlFiMEl1Tk9PeTBKcTVzcXAyRkdHWHFYb1hQeVdvQ1Z2cmpNRGNP?=
 =?utf-8?B?VFR3UnJiUTJheWFIQ05SaGFUR1padTBrTGtQSGFCelM3K2tFOW5vOFVheFBj?=
 =?utf-8?B?UGR5NHl6NkI0SlRVcnBRejZsZzh5Y05zMGx6R1QzWVlnYzZObUZlZmcxOU1H?=
 =?utf-8?Q?jTsTPLmJvWMENrNU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6976f06-0224-441a-657a-08ded6c74f1e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 16:47:44.8786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQ42H9C7sQEb7Y9zW2bAj+CpkXJSrN9Xljbxk350kgatUvNqqHLriezZ9uORUH1N22UF6WyJTuLLvCaOoXvJzU7kyoBmdPECUDYbhw9Zuvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8369
X-purgate-ID: tlsNG-33051d/1782838068-BCB855D1-C858B155/0/0
X-purgate-type: clean
X-purgate-size: 1253
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1B046E698E

On 19/06/2026 2:04 pm, Frediano Ziglio wrote:
> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> index eba33f861a..8c31f9f86c 100644
> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -10,17 +10,22 @@ static int write_headers(struct xc_sr_context *ctx, uint16_t guest_type)
>  {
>      xc_interface *xch = ctx->xch;
>      int32_t xen_version = xc_version(xch, XENVER_version, NULL);
> -    struct xc_sr_ihdr ihdr = {
> -        .marker  = IHDR_MARKER,
> -        .id      = htonl(IHDR_ID),
> -        .version = htonl(3),
> -        .options = htons(IHDR_OPT_LITTLE_ENDIAN),
> -    };
> -    struct xc_sr_dhdr dhdr = {
> -        .type       = guest_type,
> -        .page_shift = XC_PAGE_SHIFT,
> -        .xen_major  = (xen_version >> 16) & 0xffff,
> -        .xen_minor  = (xen_version)       & 0xffff,
> +    struct {
> +        struct xc_sr_ihdr ihdr;
> +        struct xc_sr_dhdr dhdr;
> +    } hdrs = {
> +        {

.ihdr = {

> +            .marker  = IHDR_MARKER,
> +            .id      = htonl(IHDR_ID),
> +            .version = htonl(3),
> +            .options = htons(IHDR_OPT_LITTLE_ENDIAN),
> +        },
> +        {

.dhdr = {

~Andrew

