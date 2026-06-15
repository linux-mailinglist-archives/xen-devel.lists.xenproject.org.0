Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qKLdA1LTL2pcHgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 12:26:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68664685562
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 12:26:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=R+eDQcy+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338110.1599127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ4VX-0007bH-Bv; Mon, 15 Jun 2026 10:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338110.1599127; Mon, 15 Jun 2026 10:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ4VX-0007Zi-92; Mon, 15 Jun 2026 10:25:31 +0000
Received: by outflank-mailman (input) for mailman id 1338110;
 Mon, 15 Jun 2026 10:25:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZ4VV-0007Zb-Pn
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 10:25:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ4VU-00Bs0D-G7
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 12:25:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fd311-e002-0a2a0a5209dd-0a2a4507a5cc-16
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 12:25:28 +0200
Received: from [52.101.48.7]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fd316-229c-0a2a45070019-34653007c253-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 12:25:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA5PR03MB989607.namprd03.prod.outlook.com (2603:10b6:208:609::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 10:25:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 10:25:24 +0000
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
 b=eiCosNwIeJXPwF6IdCcqe6PZmza604LtwdAy5M+tnlQgL+Mm40N0cWBqOSG7mpKcJAugAUwNDFkMG3xHO5gTXcI89I92iGXS6dbMwlBGqVEJJgZ+dTWIhwU5dIGJtoTjEwR6plPJ1u6C6H6/4/yTY1Z6gHs4Ne10mK1326s4hzsNGmB66649r3NIryiyyxh3k/vEtknluHpl2Q/8GBH3Eh18pK5/3vLFD/WAZvwMUDbc+7oXWdnAxI9Ps7fSuPO5u2PbgwJ4rSKIEyE4+mkTBynLnmM0fzXd8tKPQf1hZf1gMAsvOeVjYd9nQ+s4xBHtvDp4ZPRzk9tVsvK2kkF1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8m6N+yHFe/AmzMgYZGCH3PegG7gNMLyvgLKoM8nVJo=;
 b=Mgik0iwQECVUsP4HUYvBkqKF3fnbiDxg7HE7U8KPT0qdze8wi8/FwX4pP+ypkBylS0om8NUfaUl4Bq/OESuJ0X+jV1CrfVXuMpeJWSZcMs3VjfzDmCnRyWOTneivmIPhPNHJUtpdLEmBfrz34KRaqAV35f453lCl7IXbQvrqzaiY9ADqzI63ETsNsBQFn/BWfR0dbD1NikGGqHbtBRtrzRZeIf5Vr4nTNP8jazk+t/sGIFF+A0FDl7Q88Sc6x/rzAtErbolOZnbZsgfUM7o2pcKPbX+Va9U0p7uhmDkqJ/uHBo3FQHkqlSvB2rVDllpQMwqR8pC7seZ7EdMPjDZzAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8m6N+yHFe/AmzMgYZGCH3PegG7gNMLyvgLKoM8nVJo=;
 b=R+eDQcy+znQf5MhFuwPae94ZyXJCUseObh9MjC9P86Pgrtl6cDCw10N0INyCC9SGNC20AtDVSgLtrrTct7b4BXkZZSJm2/f6BShTwDiPIBjmT28SdY+tpjSeppPMIaAGulodNgF0BwI7yc5WVEu81bpsSpjDf0Am8hy38Uvk7JQ=
Message-ID: <494de33a-5033-4c5b-a026-fa8a4ed26cd0@citrix.com>
Date: Mon, 15 Jun 2026 11:25:21 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Kevin Lampis <klampis@citrix.com>
Subject: Re: [PATCH 4/7] x86/kexec: Support non-page-aligned kexec segments
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-5-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260609154518.779757-5-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0096.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:348::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA5PR03MB989607:EE_
X-MS-Office365-Filtering-Correlation-Id: ee40fe15-af56-4dcc-5cc0-08decac869a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	gUYpKjIbMcfPkCsx5w6ziA/3C7UC7ntYS5TdzEv/tu4c2nnzrpYTD+WLifIb/raTHbs6FPQf/Ull7X+LhBz9QmHyehuuT1YGWmY+gEyNWYKK9SCFg/1qh/NrxZfP1t4BchYNKOC4cRY3bTiqsjBnQUBahyHy+U9UzMhwZi85P1GF6NRE9LNod4vO2Jc/R9fzXgHniWcfS7Ymk1PXGbADmoQevo4H/hi/flwcGNOrqrvb0mCZx8coztud/mWLDaJDHs02qupJKzN9LlmrUOv2jE4aUhEYkFpytTqRqg0hv4AAi6p4Mo9w7QAYvsCGO/D3Lzr9NjbEOisjjNcB3m1jMNBWwdU2RcmFqBzudW3XW7LlTP164HO0r+K1N6CsWvioS3YnQvKEL09563L3On+YgPBNEx4U7DZXB0/x3HmPJxdRVGjfkM8k/52JHO/jFZPHMfM8q7kIqxXNhkZM9e49i6TpMj/+e3lMoJ+Fx6++Xo4xE/BEKzrFMWSRx1vxeGcS+yYt7LDS9waTfSp6onmZ1RiSfmZOBJy5psbdJEUgxsMUFqoGp7NwvEnJrNGYvxoyAIVrV4MBsTtxX0mKNSs96NoyQcXhH/bShF8qvUjwImORbs4ktvF3A/3+QfeLsVojepnzzB9zQga0jJdIOUgdlwJQF8fKU3/Ckh2UPwR5RPatrREovCiqz7CYpy215zw7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW9IUDBUOXAvWUc1Qzh5TDFsVFQvdXJMN1U1ajE3dVpjUlhSUTJYWWZVRjFo?=
 =?utf-8?B?ejdzdWZIRDBSSnVaUTI2Mm5YaEZYb29oUmV3dkMxMzJuSjUwRytldEEveVJF?=
 =?utf-8?B?TmViVlNnK2IxaWc5dFlrUCtPdGdrNDlpSFYzV3dNaDN4YXZIRkFwR1orcE1R?=
 =?utf-8?B?RzBvOW5qZ0Zvc3haVTlZQ29DU1RycWcyTnl0aWRMMGc0MWxkcm52dmhhQVpO?=
 =?utf-8?B?M281bEVQaHZMeVQxRkpFWTVDc0huM1p1UXdnd2Z3L0Z6c3R2aEdHb1ByWm44?=
 =?utf-8?B?L1NkV1JXcld6N2x4eENKNUowYzd3cDEwMnhFTHRwWllGcWJ6emZBcFhYMnkr?=
 =?utf-8?B?TVBlYTlDVjBZdkR1WGhiMlZiMWhRVUU1bld1eWRhejQxMEJhUmtIY3FzRWN4?=
 =?utf-8?B?K2tPUTZjenJBUEdveTR6bHN2bG14bjV0VTM0UHFDRXNKcnVRbjB4UlNkS3Uy?=
 =?utf-8?B?OW9pYWpqL3RrSmwxZkZyOUhUY24vSkFrL282MUZ2a0RNdHR3KzdodEVjTDdX?=
 =?utf-8?B?ajdPNDBoRnk0d0x2S2ZmWlRQcnF3dWJyeUlXYTV4Z0ZDaG1IRnVJQ0tjNXZp?=
 =?utf-8?B?Q2V1enVScldNd0ZXSTBJWmxHbzJSSnJMM2d5Vi9SNFVTU2xQb2lCT2IyVWFP?=
 =?utf-8?B?RFUwNXQ5azdTMVJBSStLRk5ERXJ4d2FIUjN5VFJKaW9YVkVEdis5Ti9odENi?=
 =?utf-8?B?OHpMS25EcXVreVBvSkY1bDZNb3B4U3ZzZzYyRlZORkFuVEMzTEhzYjc0bERa?=
 =?utf-8?B?WTllZURQdXMyUS9ySHNic05sc3k4UEhuQi9kR0F3cGhDVzF6STR6R1dka1Vr?=
 =?utf-8?B?Y1gxVGdTckdwa2hLQ1ZhZ3QrUE9mZmZ6WGNzWFFTTlUxVlFaWG1INEd4QU9D?=
 =?utf-8?B?YTFPL3JnVEVZTG51d3dWL2pueFdTL3FBWFZGaXhWQ0xwNHc4RWFsTDZ3NlJN?=
 =?utf-8?B?bnZzM2VLdDlMYlE0NXAyVFpnYTJ0TmhEelYzMTg2bFRHTTI4VUlnV0ZINkdm?=
 =?utf-8?B?cjhVelhxNjQ2S3BaWUlYS2VWS1RGaHloQVBNQ1pjaG5TM2RJUXBxS1JVWFRI?=
 =?utf-8?B?ckFoTjNjdW5GY0VIOStBWlFTOWRIam54WlhQb2Q1TEZ1NW4ydW5Ec3FhL00w?=
 =?utf-8?B?QWhic1hkOC85WC9YZnlrbmczNmVSVm9qTG5neldNYXBra1dvL0tnQVVxWitE?=
 =?utf-8?B?cUdqV2l1WGg5UmlmemFvcFEwNGNyOHF5TkVuMFk1TC9mbUtrTDdhSllLdEFQ?=
 =?utf-8?B?eVozYXoyR1RPU0RxL2pIU1NmMGs1MklYY1crL3RNVGp1Z3pmdCthNllMQjJQ?=
 =?utf-8?B?NVNUQ3o3aXl4Q1gwRm85ekZOTkdwckl6ZGNjNFlrUlFTVWxtcGpmOEVrV0RD?=
 =?utf-8?B?dmFreFd5Y3gwcm1DbW54OGtEVVJtMis5Uit3TjNqZ0FudHpjRENlbEY0SnYz?=
 =?utf-8?B?UENmQTR2WFh4Sm5ZUTVBV3lXOEFueTd3T0wvcWNlU1k0UXJhSHhxSklKWk5j?=
 =?utf-8?B?SWlTZzZneDV1UVJvTGM1c3gzSW5QNWJWcXlUa2wwRHhRdlJhcVVjTlROQUVE?=
 =?utf-8?B?a2xySXlBUDJZeUo0c05GRklLSU15NjlPYVBqNTFHOWFCTUVYOFpGVDc5aTEw?=
 =?utf-8?B?RUN5SWhObUZIVGxOWlBmYlhyUGlyeHV6MTM0NXBqRkRUMmZGUDEza1g2WjN5?=
 =?utf-8?B?TVBodk12Zm8vWEUxUmNZMk9jRlJHV01iWjYzc3NXay8vcGE4a3A5RnJmenRm?=
 =?utf-8?B?dmhmTEl2M2dpTVpVYVE4c28wcnRuOGJ4MjBuMXJWTW5lcDZKaHlsWEZwVW05?=
 =?utf-8?B?UjF4L043VmFsMkJTZ1Y3dXZ0Sm9ZbUpLMDd6bWJQdjhvUEVxOU9uY1FKVlJ6?=
 =?utf-8?B?V0QzRndiRVo0bjdHVGVwcUN2TDVXa2tDSU1PL1ZjWGltUnhBWENHNS9JNFJE?=
 =?utf-8?B?SFVmWDZwQ0xoVzN4QlhtSlJ6cDh5TC84bFoySENhMlJSWWdWOFBIYmVWUEdE?=
 =?utf-8?B?cWx2KzVtWDQ3Ry92LzZxRGF5azBKZ3ZEc0dtUks4NUFnd05BSmFYUVpwcmpa?=
 =?utf-8?B?bHlXMWhCVXp1YVJCdUdEUURrZ2g3L29xSjRuSWVSQUtGaXJwdnJuTDVJdW5T?=
 =?utf-8?B?VVpNUE5henVwc0J4aXc0bGZRanMzWUo5aFl2SSt1WEF0L3hockFrVFhKT2Ft?=
 =?utf-8?B?N0FXRWZQVjc4R2hoalJGanlqTFpSd25DQU9JT2JEVWxoZk9QeUpVVGhmTjRR?=
 =?utf-8?B?eXRBckJRM1djK291Zmg1TDFxOXdXR2pDNy9hVFVlZHVoWVZXUWFaNnJISEps?=
 =?utf-8?B?NU5qUnFKaVkrVGp4dUpuV1hibTZEcnRMbzR0c3htdnBDMG02bDlPTERhQlhX?=
 =?utf-8?Q?MxPrLPmWkvemFFYs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee40fe15-af56-4dcc-5cc0-08decac869a9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 10:25:24.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPgp0NaVF/PY8b0ZLEiqabygIKPS6P42G61+fc/0H1/+UGTwtyUH7bFC8gMPap3v4SrtdcIf1ptlj9FmhvDOpUA1Um5AVSB4MgixnwRjgnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR03MB989607
X-purgate-ID: tlsNG-ef75cf/1781519128-0A772C48-70035DB7/0/0
X-purgate-type: clean
X-purgate-size: 783
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:klampis@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68664685562

On 09/06/2026 4:45 pm, Kevin Lampis wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> With Secure Boot, userspace passes in the entire kernel loaded for verification
> purposes. However, the kernel's startup32 function needs to be aligned (e.g. to
> 16 MiB) and this results in the start of the segment not being page-aligned
> (depending on where the startup32 function lands in the kernel binary).

It's startup_32 not startup32.  Yet we hand over in 64bit mode, so why
is startup_32 relevant rather than startup_64?

I can't find any hard alignment restriction (beyond 4k).  There is a
check involving BP_kernel_alignment, which is set to 2M, which makes
sense; it's the alignment we set Xen to too.

So, what's the real bug/problem here?

~Andrew

