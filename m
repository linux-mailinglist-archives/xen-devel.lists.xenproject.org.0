Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ypEB4PfHmrKXAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:49:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767AF62EAA3
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:49:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=SgyJ4sLH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325064.1590592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPUq-0007Aj-9t; Tue, 02 Jun 2026 13:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325064.1590592; Tue, 02 Jun 2026 13:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPUq-00078F-76; Tue, 02 Jun 2026 13:49:32 +0000
Received: by outflank-mailman (input) for mailman id 1325064;
 Tue, 02 Jun 2026 13:49:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUPUo-000789-KW
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:49:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUPUn-003YBk-I1
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:49:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1edf61-2eae-0a2a0a5409dd-0a2a4503a25a-32
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:49:29 +0200
Received: from [40.93.201.63]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1edf67-672d-0a2a45030019-285dc93fbdcf-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:49:29 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5081.namprd03.prod.outlook.com (2603:10b6:5:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:49:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:49:25 +0000
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
 b=HTSo7ox4RxC48gGAsx1QRMu065MiH205O4aHGsgD4ZhX6LJGmmOYL2OM6E60UDwq0VQa1JtMTGl88QHpYj1mDNtJD+Z6rCXOdQRSQchFIhDJL9YYSBguqLuGvmiMT2zeswA6S4hY2z6ACUmuJf1OcmCFiSuSX/d7ajlh3+SFI+0h30QGuAdYLtUCskd9IJp5a7BfLJXJ4tTaVBTon9nRJfnTghzCGdw7QC/MLbM37wBkYpGWH7xrQDCfu6K+AuBtDV2MaGqWOHnhfzqi0RRD+BQ5exSYobJloS8mSjj/gYISwOIHfYtXvjnV0483Rp8ejM3pJvU3uKcDqkZeKYsA4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMqQSOVU6BU9gyHXGoVJAnkiI7ouC1/vF646HEMZjNM=;
 b=IKqyuiy6U+STzUy/u812+en4LF0KZfytav8VRedxrwVdRQ3PXg6OkEBtoZrww2j3G9yhO5DcfKM9/mfrG/Iwe2qg4MiQYdiQ9ueVDLWaV69A4aPXeH/rXOZnTdV2yiaKeYmVuf+HU/PapoxeQjsf2E5SMpVZKAXo4kBOvOppkdL05+rvGY7xVCF9Xslqv4lqQyeKnMx8ZEeVKVKGGI6v8ldXvb3Yd0EmAG+SE/paRKc0b9IZ/rfjR8fIZg7vRTBxPdX8osSKXKCJKtRjq1yTsxxhXsiP4nG9aVphFY4+326L1KGLwgQFaarzIyHRun3fty5mw8DuU5IQm+CbYI7zIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMqQSOVU6BU9gyHXGoVJAnkiI7ouC1/vF646HEMZjNM=;
 b=SgyJ4sLHp9LFePGmu5ZSuoezOVic4ae9Fd0KtmNdVCsIGjMYBZ2xfrD/pQYbY8yBolWx5vsAootfVyK74qyF4nf/VZhGYwZHI6gq96eJe9/eZcmUbVOqLFmUeWfGwZ0zUEikEDnywtnpnfqEkXWAkDVPaIwuPigc1FmsJejWVsc=
Message-ID: <af1c28e1-6dfb-4d82-8eee-1be761ddf51d@citrix.com>
Date: Tue, 2 Jun 2026 14:49:21 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/PV: rename a local variable in
 pv_emulate_gate_op()
To: Jan Beulich <jbeulich@suse.com>
References: <b61214a2-6198-48eb-95ef-9104d57f3691@suse.com>
 <7032298b-e870-4337-8c49-b5816f03fe7f@citrix.com>
 <5f0f2996-af75-4d0c-9250-c14d99c21d1f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5f0f2996-af75-4d0c-9250-c14d99c21d1f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0061.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c24474e-26a9-4dcb-1232-08dec0adc202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	HfzXcjv9NZkgQj3hKk6xJ2yXV/9j7WC3u0c93SK3tghGAKD3tYo0FQgsuixirxoTFnbKuSKn/aKuELbBSzCexgmJAiwWnscPUji3+zujOAP3+phsTyrf4DWIN11WsQlAnlzRvGfFrwUh5OYIavlCoqcHOj/KYq9badyNza8EGMbp0v8Yz7U4Gu8aLpRFQLuxlgPDjYd5g+diZvO0dNwP3lS+Havn05uiAV7jeXqJTzEgpBHTfx0WS0cj+umMtod+yNrGS+l/x5J6X6xOgpIUWG2H46ZsnLIZmSZGPFrCsCkEHMY6a5obu5/rApVDtDhAHs3AY9k1U7YNIA0BoC9R/FweS9eSZpbFiyfb8BvRLngpybkP9eJOgCsir7TTjJlXKUXGbjisawErlVjA8cxlvJU6VU1RXiRnffSKQXvkwjKBhYYbBlpqHZPbpKjZ6O/GQv0DGhj3SSWjeBUQUS2DzPfv3CoavNKhsfn8u2CFNz27g95C/nHQEWoAoXGV+JA5Fu3JrIHmiXgfa+JfOUf4ivrCwQ3lFSwP7ykFqnwqS/9ESm2msDg3hh92QaFM5hG0wPh3Jd20dphicLeSM1CvNzZUQb2TDEqu/VYPjOQINxmps0m0597oToSCvS1AiuWFtWybrFbCE1hs0GnFF+A6rMCdiMhrk0R0Xpmbgss6pL+vm79SN1UQAaxHYKw9XECa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDI2eVBnRDdiNE9leS8zZ0NWallFRkJ2TTU3WjhCcGx0TUx6SWhpcW1XbUo3?=
 =?utf-8?B?T24xTG9nWTl3Vzd2bEJZRTlYMXk2T01WU3c4THljQUZmdzNlTU4wNldhUUxE?=
 =?utf-8?B?enlTMitzSFp1WjRPdHA1MUV3eU9LQlVVcWpxY3VnNmtXTXdUSVJpMTJnSHhC?=
 =?utf-8?B?cHlwRGZWWW9KSGFkU2d6Z1g1N2wyYWp6aHlVRWZYMzE0dnJBYytKd1k2WWsx?=
 =?utf-8?B?ZkJoQUUyeWhrVjhXL0luZ2VxNkE0bjlpeTJ2S2MyRGNxTU5CT3IrMFdmVlp6?=
 =?utf-8?B?RVgvRW85KzJtOGRKc0x0TFNGTzJsS1JxdUdpcHBadnYzUDhMZ0Y5Z29Id0dj?=
 =?utf-8?B?ODBGQTV0WDlnNTI1akxBOWVIL0lnbWw0d3IyTXRnV0tYTTduSUFRMUFHTUt2?=
 =?utf-8?B?RHdFaGRLUjk5UTlHMnZPTkc3S2ZoMmtueGxCUjRjUit6YTF3SmYyTjNzTVBr?=
 =?utf-8?B?OGVVU0M3dlBDM2RVbUhhMGl5UVowRGhqb3BVWnpnS2dQbXBPaCtlVERyc01h?=
 =?utf-8?B?ekx4VFhsTk80elZ1bHVsNEJrdTdUQTlFcHZoMVZLbmxTaTkrZkRnQTVPYktD?=
 =?utf-8?B?dzhxWUlaRUZQRW16eUhoMTQzanpLV3ZFcCt0T0x2Vmt3cHF2dzAvVGdSM3pw?=
 =?utf-8?B?MHN4Vjc0U3VxbG1kbFdFSldVdWZLRks2ckYxWG9udWlpc2gvYnZROFBFeVdQ?=
 =?utf-8?B?SDZuQ2NkQlFjQkxEVElDMWhxRkJkekRYWktEVm9ML0ZiUnVpeURWSFZQUGs5?=
 =?utf-8?B?NGpSaVVkS25WdU9Wc0NQOFpraWlmanlsNUJyNTVFSjBQeDFnSWVPNG04dXNS?=
 =?utf-8?B?d1I2TVo1YkdSYitvY3hrZE9ncG4zMjVuaWgyTjU0T1BsVVg1QlkzRnByK0RU?=
 =?utf-8?B?TVRLV3l1OWlDZmF5TjJZQ3dKaDNBdDZZT2NtOHNKUnpZTlE1TDdiTUwvNUNT?=
 =?utf-8?B?aWI5MzNzUkc0aGdJMWFSaUhhNVdmOG9HRlJkTThxRDBOd3JWcmpLQWJyQkhG?=
 =?utf-8?B?N0Uxek0vbjFtWGRNbE9FOVc1TXA2UWxNSUxVZGJXRzBWNGtLMU1rb0NleDEy?=
 =?utf-8?B?NnhBcWtvTjU3REk0VWtXbkdTNWNtQWJDVVdtbFlpYVhiS3R6Ly9ISTkvSmZo?=
 =?utf-8?B?alVFZkpxVW1vVGpncWZSMDVqbk0zYzZwQ0REeDRMRXpjRzY4UEpILzJrT0pH?=
 =?utf-8?B?ZlJ0YlJQU1ZUMmxnbjN4eUg2eEUxTTZMU0dVSVhmS0p4V3pKMGRtbFc4OS85?=
 =?utf-8?B?UkxmUXN5eVkwMHE1KzJRSllsSmYxNU1rRTkrenVqeWJ2dngyVGRsVnZIYlJy?=
 =?utf-8?B?b2VjRWJ6TGxBT1VIc2RpODlYaTFWR1FsN2sxbUtTQ244MU5Rb0hIOWpYUlNX?=
 =?utf-8?B?aGdKL3RwVlIyWHpjWUZpZGFZVHNMZjdrUlZMdjZSRmc0ZitKeUNwTTlaWGVm?=
 =?utf-8?B?R1NsNlh6ampHeFpsUHB4WGpNSEpYUlc4d2RDWUQxa3BTUDlyMjRHSUVTSExG?=
 =?utf-8?B?ZytIY3JPR3BzaHE4ckdIMFdyVE00TEpqeEVDWGFaOG5LRUlhRTJjMGVRam51?=
 =?utf-8?B?ajBZb04wbjJoL01OVjJoVUU3YlR0VHArdE8yWTIvVS9Mb0hOMHQ3K2JGeEE4?=
 =?utf-8?B?b1g1UDk5cUIxY1U3Wmg5WmxjaDhFemV0WForUk5NV29uOEw1ekhmZWhkRXVP?=
 =?utf-8?B?RFVhY1dkTXNnbTNHcERLcWJQRkRlS21KZDQvZkJRcW5qcDFSai9YUlE0M0Jv?=
 =?utf-8?B?TEs5RTYzbi9mRW5JTjIzMllVWVVpWW5hYytGMWllSkc3d1VzYlpaR2pnV25Z?=
 =?utf-8?B?M2w2WEZtNk5xTHJaNEQrdm5FTGpaeWhXejJrV3dJdVJnVVU1OFB5eXpZOHhr?=
 =?utf-8?B?aHZBa2ZYTFFFNVJwMzk0WmhScE9ib2wyV3luRmlrRjh2bXlSZVNVQ1ZLTVZC?=
 =?utf-8?B?SlF6K0REVmZGQUhnUERqUzJJMkEzQXdoSkdEVG5XQjVFUUJ5MWVOczFoOE1D?=
 =?utf-8?B?bU42S0xaVGRGdGw1bTJiTE9PYXFtRldDQTlkN2R3dTQxSC90MUJITmRsaWNy?=
 =?utf-8?B?K0xxekxOOFE1TFA1MUp4djl2elJrM0FvSTFGeWtVRFQ3cE5GOWhUc2xnQ0w0?=
 =?utf-8?B?Q1kwYUxmbTVGbGFaSDRjUVFSWFlybHRrWWRONUpHMUZ0c3lUcmQyWUZ1cVVv?=
 =?utf-8?B?eXZadXlOZ0ovMjhsZkpVKzdXVkRJWXcrT3dvTjJKT1Z5RWFSa3hsSDRxZXJV?=
 =?utf-8?B?cDYwaUdDZkZqSElIbmJYK0FoSFpkWU5nR1JlS1hxbW9ZZzhqaGYzdSsrUlpr?=
 =?utf-8?B?S1JoS1JyQkxiZWtMVVNrRHZHQmZtTGNxWjRFN0ZINTlBZFBYVERXZ1VPeVJi?=
 =?utf-8?Q?qb0EPI5ckstGBXeM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c24474e-26a9-4dcb-1232-08dec0adc202
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:49:25.1197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DrqIODn05IuYR9uXXCt003u3ObW0mTGyeKI0ss5bEsWH0V7vJ4jfdKRAaueUkEGrfkinyw2xjkYEJm5Z3oobHM/mq0hBuwUSgJBj5CNcGOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5081
X-purgate-ID: tlsNG-33051d/1780408169-36F42938-AA817959/0/0
X-purgate-type: clean
X-purgate-size: 1311
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
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,bugseng.com,gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 767AF62EAA3

On 02/06/2026 2:39 pm, Jan Beulich wrote:
> On 02.06.2026 15:29, Andrew Cooper wrote:
>> On 02/06/2026 2:20 pm, Jan Beulich wrote:
>>> ... shadowing a function scope one, thus violating Misra C:2012 rule 5.3
>>> ("An identifier declared in an inner scope shall not hide an identifier
>>> declared in an outer scope"). No difference in generated code.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Technically, as the outer scope "rc" isn't used again later, we could
>>> simply drop the inner decl. That seemed more error prone to me, though.
>> But it's consistent with how we use this pattern and naming for
>> injecting pagefaults elsewhere.
>>
>> left (as in remaining) is a complicated name to use, because it's
>> ambiguous with left (vs right), but this is not a context where the
>> meaning is clear (e.g. the sort functions).
>>
>> I think deleting the inner rc is the better way to go here.
> Well, okay, can do, but: Couldn't you have said so on v1 already, so I
> wouldn't have needed to make a v3 right after sending v2? Iirc you
> pointed out the conflict with Teddy's fix, so you must have looked at
> v1 ...

I'm sorry - I thought I had already fed this back (hence was surprised
at v2 looking like this), but I couldn't find any email.

~Andrew

