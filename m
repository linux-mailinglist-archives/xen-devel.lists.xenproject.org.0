Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FADREux8IWo/HQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:26:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50796404EF
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:26:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=zSY6jQLw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327839.1592581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV853-00068M-BH; Thu, 04 Jun 2026 13:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327839.1592581; Thu, 04 Jun 2026 13:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV853-00065l-7l; Thu, 04 Jun 2026 13:25:53 +0000
Received: by outflank-mailman (input) for mailman id 1327839;
 Thu, 04 Jun 2026 13:25:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wV851-00064l-Vj
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:25:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV851-00A3Zl-Bj
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:25:51 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a217cd6-e002-0a2a0a5209dd-0a2a450bba08-24
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:25:51 +0200
Received: from [40.107.201.21]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a217cde-212f-0a2a450b0019-286bc915a553-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:25:51 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB4972.namprd03.prod.outlook.com (2603:10b6:5:1e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Thu, 4 Jun 2026
 13:25:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 13:25:48 +0000
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
 b=VCE/yoP+rh9H1nPYbHAQD9ux20m/LkXIOB3eFIuRf4GTEYJzXMJvYYaqXOGR1wEgtfDLO+hSCTc/AJ+DB8ICwKc3iFgbej4nhMAhA5kjb1VWdecS8WpEVm0SqclZq6p79KSHmckQnpROlHLGI5FdcNvBC/5XA9fMRATeMAxjya8LNiLohjBkF3dl2FRmUzvNWNIsiuO7eSGEiM2fYAFYJvxyK/DwCYQzKudtTRIzl7DuC2TPOh0yri/EohUKq+EKIFoPocH23isvZv7+GhvcvslihKmlcukrhppEZbMszMpGlW82OI17mPBfGBBdYHv2JFqEeWD15JUdo6SByuGevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAhp5e9/Pg2Ay82YyiRcMlxQ42HcEVFGd+mBCeZpWEo=;
 b=WvLRyWMNWC4QX/I6RRS3WC3HWVB0RuL78v8MMYqX9PnN/wfBpRCFxpCoJnEDs6xVBHf7XRuJx64AEnCFzneH05D71rb4eFD7jKzAfvpqojYP2DEEX5vP4mqbHuGiRYVmeQ3N13PEOLA+J/yh5Ruq5CzO9Y3gZ3ZjCXymOsI+4x3siMGNEKy3h+rb2bhy6n4pRGxvpeEbc86J+OC51+NBABNSeZMyTplVu9XzY3gfovCegJ5d90e4T8D716myljeproyvj+zJVnjNMxzoNkxp3OIPsovk1pVOwMjmwy7Io7N2EMjajiAbOgw3y2+HodtdedRY/ZZluZIfqwhpn8O6fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAhp5e9/Pg2Ay82YyiRcMlxQ42HcEVFGd+mBCeZpWEo=;
 b=zSY6jQLwQz+SoedADyPU+XDcUj+OKolTl01bciMn1DnpUka2DgBf3yaWenNdZH3gQD6YCCWaup7pnWki3g65i7oeSetbmcFG7NE5h8pTzj2N5bqzMVUD7KByHO6lKO/RRY1evbpCN2AhRRvikYbuSHdizdB5HbUqdq/U2poIJdE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH for-4.22 v2 2/2] x86/mcfg: relax memory map checks on newer firmware
Date: Thu,  4 Jun 2026 15:25:23 +0200
Message-ID: <20260604132523.95125-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604132523.95125-1-roger.pau@citrix.com>
References: <20260604132523.95125-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0025.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: cd74b709-2e99-41d6-5a5b-08dec23cca39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|6133799003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NAqGTpC80Y54uZb4k+Z9q/HV7Ann3PP402QrV2JsBT26uacSeebO68ftmO7+Wf8HmC8kboHrOtGM//WomJme7Zbvq6P+Paoqmo3oQ2wdgvj803IJ4sF5Z366aKfarVch9Vy+H3gy//2svDbiuS3DydPwxQ1R006/mGpbJoRP+yCHLAw6i8Rs/kmuUa4AlqyKnBwSPp6ZnaSpg3mOSNPPA0JeIMJsWv6nFs4+ISo2i2sXmca9pniYBBmADgt/vx8WvhCnFWQkuDGteXIZWycBxDRriyqVEZqtcMWbJ0Ro0PCuQI2B4FFlTMkNWBL6I4vX/UFnyxTMx6LZiTXyRdJmeEwNkXDWLFDcMlXZs837AWZWohvkjb2rU5+xfPFffMY/eExDU4Eovfg6T8alw9BWMQ+9nCjXAkhQD8GW8mKfZwp6n9/QnHb0mOrq5Mp7jno4fnkb+c3bVRaIhAYDuZzY7gcwTBPcZiRMJtCu3Z+oPJQ5TFtPKJ3rkdyXWhr9jY9We5x0Ta5uYJ3OI1SA92eJ9pbwwGiyxupbLoZPxgUNhDQF5mwCBraPYhnGy63805Lrmr0dolUHjklFVFrlOEtomqHs9WJ3d89r5kJ34VKbICINpBZdvHqlVoOVBTm3bfzblxXY9XJTfe0t6OPA4+r1Qr0mIXV4oaJbd8mJ6GvsyQ+/J1gMu6JuownITbK/ZIWs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(6133799003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFBCcUI3M2RueUJncGU0MWlnQ3lwb0c2TmpsWm9rM3M2OGFzbEE2emVSczRx?=
 =?utf-8?B?NW9VZzFqcmkrbmM2MDErTCtCeXc5ZjhwZEdvVWhmdGZVSjNTREMwRjB6Z1Fo?=
 =?utf-8?B?bjMzSGg3YnNRMlc5Q2dzUnJDTHJrdVZMS3cvdGw4Rkl4cEJ5TTlJcWRwcjJP?=
 =?utf-8?B?dGZZWmNGOWd6OUJpNDJ1RFVUL1VWQm5PdERnbVVYOFAySVRZckxHYTJHbGtB?=
 =?utf-8?B?T3Z4b2p5Mld4T2s5c3pWNWtPK1R2MVl6enMxS09saGtwT2ZyUlJ2RmxTb1gx?=
 =?utf-8?B?K0ZLd2w2Y2g4NkQyS1F1UVl2SFR4UEllUXpBUVlleHJTSGdmMGJadUx3NnFi?=
 =?utf-8?B?bGoyR0E4bCttcFlxZnk2SEI1bzMzNjNVN2JDemNyWDFlMUd3MFlkNGtCMDJj?=
 =?utf-8?B?UXVFaGNRNVROQkp4bGEvankvOU04SmNDK3R6YzF3TFFuam5oRlllZVgvV3Zi?=
 =?utf-8?B?SjJSamVvRHA4Tzk4Yk8vN3d1bzJyaDFXOERhdzZIZTl2TEtZWStROUx2Z1o2?=
 =?utf-8?B?UElIN05LYUx0dkF4VXNZSkEwaDh0VWEvZkhVQmNWU1Jlb3pyOXUwQW5QRGdI?=
 =?utf-8?B?UjJvbjlBSm0ranl5alFMYVQ5cVZIdSsvcnVzaEwxL2tXcDZpTmpreCtUckNK?=
 =?utf-8?B?MFNmcTA0S3E5WXFjRXYwalJENGtxK29UU0N6TnJwdjhOOElhR1FTQXZuRDF0?=
 =?utf-8?B?T2kzZzdzTTlDNEJVU0VZNU1KV1JlQ3F5TzNSbE92VGNwa1JJSnBqMnlkK1BZ?=
 =?utf-8?B?aHpYdVQwZVRqZjhiM25zT1ZEQlhCTlpnUDNmYWtmMTUzZ0pPbXlvamp3N1B5?=
 =?utf-8?B?K2RUVXAwK2hUYWZMNStkaVFWdUpSMjcyK3JjVnZSREJIZHYxbTd3bHJjYlBx?=
 =?utf-8?B?OFl0UUxmRUxRNlJTSy94K2xCRGptaUhNSXozTmFpWDl3aks0Y0lhd2ZFV2NV?=
 =?utf-8?B?RTdCMk1ZTWlJcUNDMjlGTHV0SlhHM3VNSHRhWW51VW5hSVdrMmtqRFZBSzBu?=
 =?utf-8?B?UWJjS2s2eWlxVjVqVEgzcDhwUFpZTE5wK2g4b2tId1k3SURydW5JQnZJWVlG?=
 =?utf-8?B?SHg1VkM3cDU0OUJ3WEhnajBYeXk1SlhUa1RsQ29aY21URHlmYS96RkQwdVli?=
 =?utf-8?B?WnpGTUlpbHRDWEJyOHp1OU9JcER3clBKcG1IbXZQcDZaU3ErQWxucisyMnJB?=
 =?utf-8?B?elhmTTNOSW9pckROUVVJMUJPOTMwU2ZRT1I1RkRjR0xsUFV5c3JJek0zUWlZ?=
 =?utf-8?B?V1RzMWtBZW9mdWhVa0k1aUh3aEVRZHNid2lVQTgyUFcrVG9GYVdrMDhMZDR4?=
 =?utf-8?B?bmpRTFRsb0pyd0JGQmZ6N09VTGtBaFVIbjFkNWhQZ2lXTXlwMkZ1K01meTg1?=
 =?utf-8?B?MW5sUWxtWXBrdGd2d3l0UjJWWW4vWXBYT04wVDNpdkhoVEtoZUp6Q3NBMzZx?=
 =?utf-8?B?bjZ0aDdCZjhNbmhwTktnMTBtNHF6SGxheTR4djh3akN2c2h0eVEyY2FVTFpD?=
 =?utf-8?B?VDdFMm5vWUNiS2ZrMkppbS9QalN5VWlQQld2U3A5Rm1vcDcrTVZLaVZoWkJu?=
 =?utf-8?B?MzBBMjk3QW1ZUE9zc1B1Um9yRVkvazJ6anVQOVBTNzBoQ0ZVMEwvMWNoZXNi?=
 =?utf-8?B?RGZNZ3NCYjZ1cXZIZWVHa3hXWUlnZWkyM2ErTzEyUWRWVFV6T3NYR2xzNjdF?=
 =?utf-8?B?RnBqeVpIT1hNSUNhZk1TYTZiY0dSQmRmaGJwT1RKb0VPNkIzVzF2VkY4RVNx?=
 =?utf-8?B?VGlnMldYRDRhNmZiQVJsTHg3bVhaOE1NSDhFRTRjVDBJU2tUN09KdWlzOGpJ?=
 =?utf-8?B?dWQwdEt0UWVHV2F5Tm90RVBqUjc2dWs4aVIydHRkbFNZbmIvRERLcjBIZUZZ?=
 =?utf-8?B?TDE1aEwxWGphSURyVHloUUVicEt2MzNreTA2STFrdDZVS2FxeFhGMkdMcy9a?=
 =?utf-8?B?RUdQVHdNcmIvRUYwV1hQV01GZ1UveXFuc1RQajRtLzFFUGpoQXlYcldhV3JC?=
 =?utf-8?B?YnBzLzMxRWdlMlNMMllWNzR0OXhHdGd2YnBMR1k5VU5EaDJvQ1B6WHVVa0dj?=
 =?utf-8?B?Y3Z3V3cxZmtqcjJoUW1ibDZNM3pRTlh0bWREemVHZ2UweEc5VnhITWthUTEy?=
 =?utf-8?B?WFhFVXI3TW5XWEhpc3o2M3hMcHBoa3NPa2ROaG42c0FKN2Q5REZPY001MUYr?=
 =?utf-8?B?QkZTVGtoNzBOUXUzN0NSYytZOGJvdElaWTFDZDNKKzBqZGluT2tDUDFsVjZE?=
 =?utf-8?B?NitWemtkUFFUV1ZtR0lGaWlWVDMvUTBWMEFrd3JRVFVoUzI3dEVEK1VjUlh1?=
 =?utf-8?B?citsd1RIUlZyWjVod21CK2VoQ05sUW9ralg5bytNd2dGQU9VUmxqQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd74b709-2e99-41d6-5a5b-08dec23cca39
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 13:25:48.1571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04AgIwYlwyfBEEgo4TA4Zf5+NC2bPTqBiVIDFPJ0n7CJaDyN628J4uIG4ubHncFZ+8GddUgPd+5MsUmQTv/Ojw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4972
X-purgate-ID: tlsNG-42698a/1780579551-1B175F3B-90F398FF/0/0
X-purgate-type: clean
X-purgate-size: 3318
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,suse.com,vates.tech];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A50796404EF

Per PCI Firmware 3.3 specification, section 4.1.2, ECAM space must be
reserved by declaring a motherboard resource, but there's no requirement to
mention it in E820.  The specification additionally states that: the
resources can optionally be returned in Int15 E820h or EFIGetMemoryMap as
reserved memory.

This fixes an issue with detection of extended capabilities when running
Xen on a Lenovo system that doesn't list the MCFG area as an
EfiMemoryMappedIO region (or as any other type) in the EFI memory map.

The more strict logic was introduced in Linux in 2006 as 946f2ee5c731
("[PATCH] i386/x86-64: Check that MCFG points to an e820 reserved area").
This was picked up by Xen when MCFG support was added in 3b35911d709e
("Enable pci mmcfg and ATS for x86_64").  Apply an approach similar to
what Linux has done in 199f968f1484 ("x86/pci: Skip early E820 check for
ECAM region") and relax the strict reserved region checking so it's only
done for firmware manufactured prior to 2016.  For firmware from 2016 and
newer allow MCFG region to reside in holes on the memory map.  Note Xen is
still more strict than Linux however, as it will refuse to use MCFG regions
that overlap with memory map regions different than reserved.

When dom0 boots it can prevent access to misconfigured MCFG regions by
using the PHYSDEVOP_pci_mmcfg_reserved hypercall.  This brings Xen's early
usage of MCFG (prior to ACPI AML parsing) more in line with the
implementation in Linux.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Shift/adjust commit message.
 - Reword in-code comment.
---
 xen/arch/x86/x86_64/mmconfig-shared.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
index d0cbc151705d..b33e2f56e6e3 100644
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -13,6 +13,7 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/dmi.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/param.h>
@@ -369,12 +370,15 @@ static bool __init pci_mmcfg_reject_broken(void)
     typeof(pci_mmcfg_config[0]) *cfg;
     int i;
     bool valid = true;
+    int year;
 
     if ((pci_mmcfg_config_num == 0) ||
         (pci_mmcfg_config == NULL) ||
         (pci_mmcfg_config[0].address == 0))
         return 0;
 
+    dmi_get_date(DMI_BIOS_DATE, &year, NULL, NULL);
+
     for (i = 0; i < pci_mmcfg_config_num; i++) {
         u64 addr, size;
 
@@ -390,7 +394,13 @@ static bool __init pci_mmcfg_reject_broken(void)
                (unsigned int)cfg->start_bus_number,
                (unsigned int)cfg->end_bus_number);
 
-        if ( !is_mmconf_reserved(addr, size, i, cfg) ||
+        /*
+         * For firmwares prior to 2016, confirm that MMCFG is marked as
+         * reserved.  For 2016 and later, also allow MMCFG being in a hole.
+         */
+        if ( ((year < 2016 || !is_memory_hole(maddr_to_mfn(addr),
+                                              maddr_to_mfn(addr + size - 1))) &&
+              !is_mmconf_reserved(addr, size, i, cfg)) ||
              pci_mmcfg_arch_enable(i) < 0 )
         {
             pci_mmcfg_arch_disable(i);
-- 
2.53.0


