Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kTPzOVFwOWqUswcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 19:26:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D056B1775
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 19:26:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=QruZP+es;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344029.1603218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbiPk-0003xa-Ds; Mon, 22 Jun 2026 17:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344029.1603218; Mon, 22 Jun 2026 17:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbiPk-0003uo-An; Mon, 22 Jun 2026 17:26:28 +0000
Received: by outflank-mailman (input) for mailman id 1344029;
 Mon, 22 Jun 2026 17:26:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wbiPj-0003ui-40
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:26:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbiPh-00FUr0-Qs
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 19:26:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a39702b-5cb7-0a2a0a5109dd-0a2a4506b082-22
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 19:26:25 +0200
Received: from [40.107.201.26]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a397040-b690-0a2a45060019-286bc91ae968-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 19:26:25 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB8102.namprd03.prod.outlook.com (2603:10b6:8:24f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 17:26:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 17:26:20 +0000
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
 b=w3oMPRX0YheuJyEZel3YkROSRVW3ZSjweeVcJbuUJ9Ot6ct75eaI7PyHBQUmkUeVChqKZPhu3JUcqHC6m/t9CVzkBN/WQXMGgzUsP0Qvq6e6GqvJhWVuJJimG2QjoBTdW7EAjuB35GTk79u1ekPlK8qsGLB/Deo4UVKaI0gq00N1mue5H2gZ337+g/m4GjRJXcM+ybTj4JI7fa9XRD2q1Jav3RoEFcykB0oEJQ2dVrOu4My8JbCA5JYUbXd6Vb6bAihaFmKLpxhHQrofE/jqgrsjmB2FjJdqQU5IjlLCZOjvuAoCbfS5nsUuOVY5VmMNNN9rfU4bBXTQ/ziIIiU3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/jc4M3A8TJY3hAJ2SMrydDRuixvNASrQ9KkY9xW6ZQ=;
 b=Y2j9C3wp8PCui7l2YVJ7NoCYV0+hvdWCKVDYLmK4Bs7vWVP99ColgBrY3WLqLJpV5SXazwlrz2RR/6gIxf3g3OkmwFG7FMC8SO6uY1bhTJRwQxTj7SyFhO5EruhW8H8N89KpAQooHw4LypsKwn/rXTCSo/cvZtP7ukMBkaw0fuPp8kn5qX5MngnhMOz9Y2YajdtwGArLQ1y/ljs1ItgeXoCY0HkPyY/bmYtKs6fixYMsbng5R0TugKCggd8juvEprfJIEg9XE6pl7Ran2uAWn4T0GttpzzecvO5lI3zuGhJETuk2odK0sAWD4+8jHcm5hiX743iQ+xXcEI9NkJ9NpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/jc4M3A8TJY3hAJ2SMrydDRuixvNASrQ9KkY9xW6ZQ=;
 b=QruZP+eslj5Q1unGBNx6F9Yr1G1EXu+JLiOVPxLj4SAAFL2bggmB9px4UCwHb4eoI4U9meVuFPica7eyE/4j2Zdb1ySYPNoUjLb/pITg7LUM0lnDTl3oBwGfoN+aoqpuabJSKFkEVGx9hRFDysNrgKFdfZYQrDJlnPsS/NbN+j8=
Message-ID: <80b43806-7be5-4310-9568-c2df4887c52a@citrix.com>
Date: Mon, 22 Jun 2026 18:26:16 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.22 0/4] x86/kexec: Improvements for FRED
To: xen-devel <xen-devel@lists.xenproject.org>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260319122549.922724-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b7b783-21a8-4cf0-7738-08ded0835fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VHdpnTPelOWq5phOxV75cG8d3rnQwyppq0QoM2B9305gU1cgE9nH6BgrJvdBQK2bUQZc7bmuJrk4y6NaugD5fYdlMQPab+R5wqhfJyg8l7gai1bzYi3hZ93RfuhKjxmKZ/Ua/DcZ7uQEss9r2tY+vDbj+IuwGZdPkXY5cd8+FuXExVwyp9IXsaq3KUjNc9jShOGdjJJdytP5rK/zjyVHfLIZez9efiNT4G2rWCrIkHuRIrUiujoIMUPJyY8947qxHUTXsAmAqyXDHLZdo9qYMtPl+lmy5Kucgq6hIZ9DQUbR7UzEprGoIFqYMCGWKTY2knpWZia92Bf5RyimGhYoW/7tm/1gRM1DsM015yoDRKoiYjw5HgqVto6RdH7NRCn1ASVeKRk9goGDwNdmanI2kuCDrqEPf9jO00rq3pQi5S8y0JEv0I5abCi8gAIb0P1yiSwStBAlTlI44/yot65WgJG3G68o4JAa83jjxgP17gE3B7DlIxn6zzoAGbL/mzFgyWf2LQjTfm2KUZZDc+Fn7jTMh+eahEh4jQLod/rdHND0BBH5wy0N5113+fD7+MpjiZzdWd4u8JmVTBtSaFkUTO2OSRR5+EEJiyUyEiSG3Z3b4DsNlH+qRWa0wTByvfglsc9dZ+yW1vpnVMXroC+ZWpBjqRLfmO+i1NYcc+GWCWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFNFQXBWWWtaejcxaVBqVDFlK3M4d3hUWHI4dzhpV09oa0d5OUZhUHRXSUIy?=
 =?utf-8?B?bnJiR3o3Y2lteDVvY1orM29jWHpUTm9iRUtXbGZ5Rll0czRDT3hTR1ZvNGwx?=
 =?utf-8?B?OXUrKzdqNDNKV1hMa0JMb1lkTDllMEY0VTdMNEpsYUhCQzUyeEFtbjhmN3ZJ?=
 =?utf-8?B?WGJSRHNMdzh4RWtmSmlwMWdoYjFhNjRIZDhJQzFDaUR0aWM2c1JvOGhDY3lH?=
 =?utf-8?B?dEpPUHk2ZTNhSVFkSDh0aXZ5UDFMZThvTS8reGpZU1RyMERCQXcydVR2ZkRj?=
 =?utf-8?B?RUd6MHJ3ZEk3cllnK1pYVnRvOXEyQnRPdUFZSHhMZVNYM2FOT25ReGo3dnRN?=
 =?utf-8?B?K2dBeHhzR0tKYlNIU0FYTUx5RUZIRVorQ2lYenRidmR0ZHJveVgyNlpRaEZ5?=
 =?utf-8?B?L0U4alVGby9vSmd6WVprak9aRC9aQ0poL29KSmc4d3dwNElpNit4SlhuR3BV?=
 =?utf-8?B?SzRsQUpkTk1vNzgxQ1o2cURHNGU3djVYN0lVOHNNeHI2L1BYVHFiUTk0cXFI?=
 =?utf-8?B?K3FlTm11UldkRFBVNURZTEIxZmtKQlB6K05ic3dQNi9wRVBTdEh3SUY5T2ZX?=
 =?utf-8?B?QmpYN3BUM2NBMHBwelhNcHpEOXRzK2lMS2tEWnFnS2V4QjRXMnpSQmtFSWtx?=
 =?utf-8?B?RjZKbG9QRThiWWhMTFRFRnorM0svckV6SVp4UFJyYWN4TzRyZm5lZis0OG1j?=
 =?utf-8?B?TVc5QnpLcmYzUzQrWUVhSE85MWtUSGlxYmQyM0hhWEtqZzV2ckRLTEhNempm?=
 =?utf-8?B?MmZqSGFXS2xVWFVxN0ErUmd2YlM5YTB5VXMyOUZTdFp2YzZuNTVSUzVZMlMv?=
 =?utf-8?B?TDhacisrTDJYZndZcWFReFlKdTdsaTRkdDVDMS9Nd0RBb3ZySG1wMjFBZzRI?=
 =?utf-8?B?V2Jvd3ZFVklaMzJSbkgzM0QxdHgwVXIvWkRlT3V4ZmFtR1Z3QmZGaWhrT0Zm?=
 =?utf-8?B?T1hYRGc3UG1YQ1l5cEtySkVSaHoyZmx0N2RZcGFDVDdwSjBiL25lZm9iVzF4?=
 =?utf-8?B?cnd1QUFFeEg0QU54RkVBRFVCUnovOXBrajUxZFVFVGtuaklQZGduYmc4S1BH?=
 =?utf-8?B?M1RxRU4rby9RWVRGRHEzd3lNMWFQcGFJV2FKVndGVWJNMk1xaloxSzRNTm5Y?=
 =?utf-8?B?aUNIenNCU3c3aFhNaXBQSW1KQ1NuSE9wL0xMUXRwSG9EdlJVN1kzdWRRTjdw?=
 =?utf-8?B?NnZHUDZqdldvNHZITUh1T0FLM0taVFprYnBBaXFOQWtoMzFmektJT0loS0I3?=
 =?utf-8?B?S1BNVHBtZ2Jqczk5OWdFVG5ncVhISXc2UVpyd0FmajhFNkRURC91N08xelR6?=
 =?utf-8?B?WmxvYnZCQ1I2UXNCS2xhTFFWVGFycEtvejFkYlA5VFRTbTBmM2lkV1g2Y2x0?=
 =?utf-8?B?dExERFNtVERyMjZuUDJLMzI5dXExVFkvMWRuaXV1RHRHbFFMYnZ6NTBaS0Nj?=
 =?utf-8?B?RkxvdnZRelZPc29RUWpNTmhYQzY0NmJ5Z3lickRkUVhqangySVluNVRRaDVs?=
 =?utf-8?B?emQzREZlVXBjWGhHNk1qSEIyRXN2L3YxQXVWWUlqQkE4dUZMeXBIU0JYbGdB?=
 =?utf-8?B?dDlUWXZ6dVZ6TmZ2L2VGRHUzTHJOQjh2OXRVdmtneUJXYUNQc1dPSStpekVz?=
 =?utf-8?B?Y3REekdPSE1HTFZTOXVaV2ZnaUZITkg3NFZVbU5FN0hqOXpJYTFLaktPRXNz?=
 =?utf-8?B?OWU3K0Y0TWdjR1VZTUwybXNYREJpWDlleDNNMXA0RlpaN2IzaUtOaE5qbWh4?=
 =?utf-8?B?ZHFOejBCK2hiVEQ1SXRROFFvaFBiNFJiZG9paTZ2WHBVM0ZzVk1aSXVCM0Vr?=
 =?utf-8?B?SEtKby9yMC9zYmE3UnBvRHFSZk5nRzErcE40U3hCWUlaaFVvN3dBSE9DSldv?=
 =?utf-8?B?WkExN1NsOVdMNmtrMzBJSEFlTVpHT0VscXpJclErM2dIQUZBdHhwSHBLZFZT?=
 =?utf-8?B?blRvK2FKWWRjNnlocXh3Z1RYQWcvMFR2cGZMWlFUbTJMZ2ZOS0ZUSjFEWGM3?=
 =?utf-8?B?Mkx6OEZFSzNpbkpHL0ZMSEpSVjUvektlNyt2ckxPdk90L3l1ZFpzTkZrTU1k?=
 =?utf-8?B?Z0xuUmRLcnYvRk1vVGQxUDNlL21HOHFLN0ovckQvK1FxWkN6OGtLSW9zSnpW?=
 =?utf-8?B?UkZvRXZldTBxVXRrZlV5WW84YlA0OUJxUHlISjFFK3UwNllyb0kva1lpT3FI?=
 =?utf-8?B?OHlXT2haVGcxalZ4SXlZaUZMQXBPTkZVbDA4VVFNWEpLSDNuOGl6SVhoUncz?=
 =?utf-8?B?Q3creDhBYXZGWU94WklkQnpud1BYYlpSaER0bXZBTTM5QjN3WjFRUElTcTRx?=
 =?utf-8?B?YjlydEpKMFg1cjFlWTBBZElzRW5pcHdyL3RYcWwvUFZhY0RIS0dCdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b7b783-21a8-4cf0-7738-08ded0835fab
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 17:26:19.9463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGBFjWyE/9ihec/6LJKSvqv35O6zOAGRSIN88JOBm9wpE0wj5ZPUXiyTsLQ/lBJA8JlB1/TW+YgR7iGa1aRY829xz489aPqdvQ1EcZ28ttw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8102
X-purgate-ID: tlsNG-16d1c6/1782149185-3A7EB853-CBDE15B6/0/0
X-purgate-type: clean
X-purgate-size: 985
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
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48D056B1775

On 19/03/2026 12:25 pm, Andrew Cooper wrote:
> Kexec with FRED happens to already function.
>
> Looking at the logic, several unsafe actions are occuring.  Fix the worst of
> them.
>
> Andrew Cooper (4):
>   x86/kexec: Stop hooking NMIs with trap_nop()
>   x86/kexec: Fix and expands comments for kexec_reloc()
>   x86/kexec: Invalidate the IDT earlier in kexec_reloc()
>   x86/kexec: Disable FRED earlier in kexec_reloc()
>
>  xen/arch/x86/crash.c              | 20 +++++-----
>  xen/arch/x86/x86_64/kexec_reloc.S | 62 ++++++++++++++++++++++---------
>  2 files changed, 55 insertions(+), 27 deletions(-)
>

This is fully reviewed/acked but fell through the cracks an I didn't get
it committed in time.  Sorry.

Please could I request a release ack?

Now that FRED is active by default on AMD hardware in 4.22, a poorly
timed NMI will break transitioning into the crash environment.  i.e.
it's fixing a corner-case bug in a new feature for 4.22.

~Andrew

