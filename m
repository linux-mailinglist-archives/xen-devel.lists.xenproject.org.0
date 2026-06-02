Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1kmWAfjaHmpfWQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:30:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FB562E800
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:30:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=WEbz+kaw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325050.1590575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPBp-0003A7-Eq; Tue, 02 Jun 2026 13:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325050.1590575; Tue, 02 Jun 2026 13:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPBp-00037H-B8; Tue, 02 Jun 2026 13:29:53 +0000
Received: by outflank-mailman (input) for mailman id 1325050;
 Tue, 02 Jun 2026 13:29:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUPBn-000379-T8
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:29:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUPBl-00HFNN-TX
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:29:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1edac8-5cb7-0a2a0a5109dd-0a2a45078a86-18
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:29:49 +0200
Received: from [52.101.46.42]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1edacb-229c-0a2a45070019-34652e2a11e0-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:29:49 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5752.namprd03.prod.outlook.com (2603:10b6:510:36::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:29:45 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:29:45 +0000
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
 b=s50nKGBJDiz2nxJcnS9ELatG+iAFMCXyZ3Y5FIu7PUl5M/FqL2inZ6uo7VgV5qHhy1S1g92B1mlr0NpUMEiZ0EdgacBEaiYhRXVTgruiAJrJ8jdv6V7KoQv9Zs/K6mlhun7WVC+CqTnyBuQC1iMRuVSklVVUcw6eO4yNdeAW6ZTa6GR3SSn6uuK/F9WDr4TeRlAJiT1OjDQkU+KzmcVK6QCxOEw5N7vmSNKAqYI8za8sMPJf8cqS3m34jdPui/wv7hdPll15+puD7EsjDCe5S3jmsg7yW6BNEtroQWwzboHWEEXw4e5xh1/7X+VxtBXwrPOZ5TYgWS/OsHvolNa/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eY8jLhQsnre+KZVJYO63DDUwkTmH3maHpK6Mk7t2qXA=;
 b=tOnidrZTOw5VvCf4HQH/lmrsFHnbFZ3PHSoTcPx2ceJef5PKt8OKQcV5IUYRb6OxVYZXikjtuRi1OT+6CjHvVNI3D0SK5AKO/nyroSX6NaRvrLrt1jraZxQsk9XdBacsiJ7DxN1jOEnGoOf88qZNi7hsjZvXJHfgdcNobWLcGR/ZnQYP5lkDo9dRt5+MAemcr2JMcFqxJMlaW4cRqOR4Cmhr6OgdFqwsn/ff9uQxN1cicQAB9Eq+ONQcXzyWt38zdhoYthBsIOlKlErtkF0IKnRYoAfP0FpU/2LkEn7XWvPr6bc3dvhXpNArCDKFMA4Y/HW3pkger/ohgCvEpvFRDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eY8jLhQsnre+KZVJYO63DDUwkTmH3maHpK6Mk7t2qXA=;
 b=WEbz+kawMMyq1hpr5yWlTMxZXooufvrw8qS+xy4IlYN6+nWkc8QnJpTDekXFqYFWyRXIHlxk5yIFaoyKC8p33N0VkQuTKQwO7p7Bopyf04z9PL11HZjkmQxGGWDLAN2lHOqJtDni1w9n977f41Q/8a0WQr8FXW7XvWDnmp7so+k=
Message-ID: <7032298b-e870-4337-8c49-b5816f03fe7f@citrix.com>
Date: Tue, 2 Jun 2026 14:29:41 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2] x86/PV: rename a local variable in
 pv_emulate_gate_op()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b61214a2-6198-48eb-95ef-9104d57f3691@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b61214a2-6198-48eb-95ef-9104d57f3691@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0155.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd9d0c6-020b-4759-2a64-08dec0ab02a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	nPoWHtQ00bQ35A18fktrFXblRkpGjOrAKebcLMtRLYh5+cq7lFob5Rduh2xbJ5zBrizvLUH/wZZ/SKDjWVv6kcwqv0QTHAnkdLIBJFmGVe2cvUK+giQ1Bpwqyoa/uRfqY9bc9C+EjPHsJi8vw5ux3nSBS4H9VbaPULllFK9CGRT6saIB5qFvZIJkvMaWareJLW3FffxTol/bzJfUsfSCCCssIBXqM2ZhK5Cg3k8NmtfZUC0X8J16uOwSHMEbrTU477TNlHlI2pLXCLSA3KYfrj5SLb80QlIo2spqlwlBrGXyIYlNye4vgBKJBs2TLk8T6UKwLSWJnJBe/vM1pssqsdhsCwKbcf+ZuwSieWv1qgLwdUnDzEo/hOZzSQb6u7UJppSZ5ppNqO/2Q1ci+KMSQi2xhC2Ft9z5xSnwoG+bC4bcp2FoAm/VOM6V2q+ZMEmFzHTnNV+jNXoJqf9PB4vL80ieCf6VAZsmu9ixbnyNhbZ6kLFmXdP3cQw2Nk6ZL46VatpddWLZLdV5fYZE/snWI1l4cFFHxmTI9SX5Rg/Ju0NVy6bL/UwpEfcIoqVm4tZI15lvvLfhKvOfBblq3iDMEMPWY9wQXHzBPgs1eSW4Py6uYAcWsBkXJ5iyjpJlRpJP89UOlsX05DLTplz5HEgYE+o5ljuHlGMhUBsVkEX2q92Rozp8vy4VdPuMwxlM3s9V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anYrenl6NzdvU080U1BXWG8rcVlwNVpaQjZySGdsTE1aYnlGUzJHUHV5TTlj?=
 =?utf-8?B?Q0RHTjE5UTFlMVlxbnN2blc5TWxSNGZ4QjlRRzNLUjY1QkgxbXI2WHY5RVBX?=
 =?utf-8?B?Qm5LaCtuenBWOFFWN3lHVkpxcGNvQ0duQW1yc3dhNlNJRUNneFkrbjlhWE8x?=
 =?utf-8?B?R3lkclduTWNYSFRvakpyVHZReGR4ajMrSVRYR1ZYdi93cDBHTlZCYXZ5VlFj?=
 =?utf-8?B?YTl6OEo3VGx2bWViK2o1ak13Z0U1V3RreGVzTktVSFI4OEdiK0VUazlBUkNq?=
 =?utf-8?B?M1RTUWw5UytOZHUvdm9xUGVuUFJEbTlMQk5zaUdnelYxUlBNSFhrTEt1a1ZI?=
 =?utf-8?B?Uzc1eCtZYWYrOHFhNFBnRDhBTFNYMXNvRW9lbWpzR3ZhR0NCNHFQTm9LV0l1?=
 =?utf-8?B?elJpZXpLRm5RNXphc2NlSWt2K0NHYkhabURJMzhuUmZyeU5qcW5jWG1odGJm?=
 =?utf-8?B?cllVVVdLak5RaXQ1R0FraFBvMVE4eUxuS2VJSUZEcTlCZUtuMFFlTUY3VHl5?=
 =?utf-8?B?cmpZNkN2cDlkZFJqNzdXZlBnU05mWUlwT0ZMWUw5OU5iVVRSQTBZV05kOWRq?=
 =?utf-8?B?WGJ5RDdhdUJtRUJLTy83N09ZdzY4bXhoVUlYVGFJWkQvTlBzRWtZUmIrZk5U?=
 =?utf-8?B?bnpKbEFjMEhkTVNiV2JJaUtOYWZuU0pOU1B3cFF2ZGR2Y2F5R0VxYnk0dHps?=
 =?utf-8?B?ckUybmlsYkl2cTVpY3JubG9pVm5PZHlhSWFNYjZlRHgwRytiY3E3Y0NCeGJt?=
 =?utf-8?B?VWovMURuZHFZR09OdFBJRUhMTXVCN1Nldk9IZnBudy9OY2lUemdSQ3hMY09T?=
 =?utf-8?B?UnVZNTNNWVROa0V5MXpucWFaT1BiOUlkdEpSN2ludmFvOGovbHRYUG55TFBN?=
 =?utf-8?B?Rk95Ym5ZNXl4TlI3MFZ0R1o4SWJsOTVTUzJnK295eEQ3cTNSakNvOXg5Z1Zx?=
 =?utf-8?B?NGNhT3RWQ0ZrcjluNmpNK3lxa1BINkUzVmZkVWFiaTd3aWxWYmxoMVhMOUJV?=
 =?utf-8?B?dlFmN0x0Q2RIUzdLM0JMRWt6aHdNZWNWNWs5aG1jODJGMWdZNjVybHpmbmZx?=
 =?utf-8?B?WE1ZWU8xNDkyRWRlWHZ4dVRKK3dkUWozcTJ4YUZjV2tZN3RVSXhPYi9XMm9M?=
 =?utf-8?B?VllCbUsxalhFQUp0aHR6YWhDNnVNalgyRGZOTXdiU2RqbE5reXBCUXVyNXZl?=
 =?utf-8?B?ejAwT3dqNW8xeEN2Z0E1WE5JVkdpV2E5ZW9iekhQM1E3dGVhZHgzLzdORmlj?=
 =?utf-8?B?ZjhPNWpubmdmMlV2bldSL0pPTGNJTUk2b1JmZjhXWitpd0ZNQTdpbUlOYnJ4?=
 =?utf-8?B?aWszS0FsTWlkZkwwVjBza3grWG5vNzB4UzIyQ0tqL2ZjR3JKRHN6cjFXN3di?=
 =?utf-8?B?aFdidVB2VU1EaXJsVjhpb0pEVDVHajUrRVEvamVCclF4NFhCeHVaV0QvakNl?=
 =?utf-8?B?RmMzMzUxY2hiZ0w2OWRLVWtIYXBRaDdmYi9TekYxSVpmVFVtTXRDSm41UjI3?=
 =?utf-8?B?TE9YRXR4SjRDYkxVaElsRkIzN3o2ZTk3UGdrS3VNUXJsSDdKZjZ5Z2VQZElJ?=
 =?utf-8?B?aUk0ZitVMzNZTlhxcEJIWG5uTUlFanJQU0czTldNWUh1dFFNbnlESUxNT0ZR?=
 =?utf-8?B?TDdFZWg3dnNLdWNVU0FZK3E2TnZHU1F4MHZGYTB0K1pTRkY5SVc1QnlNUVdq?=
 =?utf-8?B?UVVYSUVTOXFxazc0amkwQ0kwL2wxelNna3RDZ2d2empsT2VoZmhQbXpxaENo?=
 =?utf-8?B?cC85cjNZTTFDTFVVUEdIR2NPdnZ2VEhRWituQVV4ZktmMUl5cDBEQnJvR3F0?=
 =?utf-8?B?bW5DMG5aV0J2aUxERjRUam96UjB5RVNhdU81d0thL3BQUzRQcTIzSzNWZytP?=
 =?utf-8?B?c21UMTExYTg5VmQ0Zi9UNXRGRmNEMnIwR09jOE5NQ3lRYkdjY2E1TjJxRlAr?=
 =?utf-8?B?M05lMkF0TjRLUHlLdjcrc3RXblZmbTN0T0FMMllQaWdMR1FsV29QZCt2L285?=
 =?utf-8?B?NmdQQWFwMVpMd05ZSG1qaEJIa00wcjArVFJyY2FrZmZOTUwyUUdyMmZ1VFFJ?=
 =?utf-8?B?ZWt3QjdZcjRZVXRkTjB5cUFLdW5lT3hQdzZPbVVQS01kNEY2YzNXNVdmWFlN?=
 =?utf-8?B?ZU1YMkVtUk1hbG53eTRaSmpIZGRxMHlBb0N0NEZxa1N0N2xsOFR6SVpKUGZQ?=
 =?utf-8?B?K1F3VU9mTjh6cEpOb0tldzQzTkN5TCtvVlZKUE9lQVVtdTFrMU5UTGQycHYv?=
 =?utf-8?B?aitCUER6VFRaeEdtNXhyV2wvSjQxUmEzdHE2dkJsV1JobzZ4bEQybEhiUEZu?=
 =?utf-8?B?RnR1aXliS2pndjA3TFdIQzFyM21vTnExdW5MNkdxWXJRM2Nhc1VCeURSZmJO?=
 =?utf-8?Q?LJU8yiVtzHsSljQM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd9d0c6-020b-4759-2a64-08dec0ab02a1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:29:44.9856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZTOqKa99Omx8EljRsyfELijPdolbK8Z3jzcG/0RIkVvWjaMDjRm+SoIIlmPfnygSep8h0d2Nb3e45g8rwciswTGmUv9jJ9WMzQP4ZsZqJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5752
X-purgate-ID: tlsNG-ef75cf/1780406989-08961C48-7961AAC5/0/0
X-purgate-type: clean
X-purgate-size: 825
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,bugseng.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,citrix.com:mid,citrix.com:from_mime,citrix.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55FB562E800

On 02/06/2026 2:20 pm, Jan Beulich wrote:
> ... shadowing a function scope one, thus violating Misra C:2012 rule 5.3
> ("An identifier declared in an inner scope shall not hide an identifier
> declared in an outer scope"). No difference in generated code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Technically, as the outer scope "rc" isn't used again later, we could
> simply drop the inner decl. That seemed more error prone to me, though.

But it's consistent with how we use this pattern and naming for
injecting pagefaults elsewhere.

left (as in remaining) is a complicated name to use, because it's
ambiguous with left (vs right), but this is not a context where the
meaning is clear (e.g. the sort functions).

I think deleting the inner rc is the better way to go here.

~Andrew

