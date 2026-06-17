Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2+iSJyuDMmoH1QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33140698FE2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=DMfDEAWD;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1340229.1601305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoKR-0005lj-Eq; Wed, 17 Jun 2026 11:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340229.1601305; Wed, 17 Jun 2026 11:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoKR-0005iL-BW; Wed, 17 Jun 2026 11:21:07 +0000
Received: by outflank-mailman (input) for mailman id 1340229;
 Wed, 17 Jun 2026 11:21:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZoKP-0005hW-Ok
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:21:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoKP-00DInK-52
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:21:05 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a328319-bab6-0a2a0a5309dd-0a2a4509e280-26
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:21:05 +0200
Received: from [52.101.43.37]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a32831e-2497-0a2a45090019-34652b258d6b-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:21:04 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB989283.namprd03.prod.outlook.com (2603:10b6:510:3ba::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 11:21:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 11:21:00 +0000
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
 b=pCgVKN0WMgQEhUk4RHKZzMU2SvuYa+YlxlUTW9yfp3SEGA9zSoGvyL8IsoqdrT6XTjdKhKkY/1Gd6EIRBNgO3yrEO3WwxlT0qqO7Z9lDwc3TymfcvXOjpio4zwOY5vgKeDdnc8kh0KpKwfmWMocosp1hkDpN7pGgJa2CA6H09JVYA5nFnh8UkcXipsjO0gRf2SGQ5J+sLNJTDSctsbLVh56aPfs2Cd6yYae2djXf67KuxnBOB73/KmwIgO96x70tyDdzXxmN6Jr5SOi9lpvlZQtJKBY9zCOF7flgDbn/PjCgMa8eoAVJ6iFl+Yh8ahAdNr3lUpgIpxcsYWwboG7KRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVyKy8kBMuYCrvJMPR8E2iOl43DzdhZX99j2hN9t5u0=;
 b=b97L/agSqQss3Nt371bidn0/QcqTGCUs0nFf0uQBU4L2HG3fUoHWRYoNlfFb1hjjAI43ARFa7nPD9JDGXtHw/xQ4pHjqie57C8JbB691R2SvBFSifbAoe6BMCbWj4lvb9xF/IgnTrZ5ZiiwACQNJ8TopyLJFl18sYyESldFANIGaKwjWfmFGuVpaAs/gMZ3E9nYORxMqkMoGy8/4kS6Tko+ndQpwfkNa7GL3zfRn7/Lw7xhzljOhQwSyEx6N4XS1tdFPJZIGKGrzgrtIMdu9AaRrgi5rwLDem7NOcKkm8+WHdlAWqxyrW2Jva/wG5VMlgBnyGPxXzmyqv52SzvPtvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVyKy8kBMuYCrvJMPR8E2iOl43DzdhZX99j2hN9t5u0=;
 b=DMfDEAWDWX2BuqHcRuS/If3mDyrkIXKL/5p2Pb12bIGJsmqZjFLYfPBCHozfbwAERjgnOiUmYTGdKskkHOipH6rAvSc2pP+38qX0JJdSFed+k+MwKMrlyUwj8si682L333NpV4l3TItpO3vhM7bpSqd31pwAUZPlbSswb5kCB0c=
Message-ID: <26179fd5-15b8-4395-9808-447963180b7d@citrix.com>
Date: Wed, 17 Jun 2026 12:20:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc in
 xen.efi
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
 <ajJ3C40FLsyBZn-U@macbook.local>
 <a307207f-7cf2-40fb-927f-bbaa841b94ba@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a307207f-7cf2-40fb-927f-bbaa841b94ba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0284.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB989283:EE_
X-MS-Office365-Filtering-Correlation-Id: d22bb601-c143-4485-8534-08decc6282b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|3023799007|4143699003|5023799004|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	KKT8vmPZ+deW4gUM3ct1+gJG3MQhkHGt01PEvEBiNFx9CMcgdSlOGW45bBi1dppBMdI4wSGQSJiAX70tctoEIDLiuKAVBbtlNtAOqsCEwfEnLk1tOai/ZHMw4DzOJMguCkmOqmULIcUJRit/QJxb7RjboO/w3YpFD3wLuS/x/95uSYf3B+BAmK7cTXZ5Y/wUCCwWnmVtH9TzonEy8zsiClgRjcNHfJE3Zfq4Rg62nMBPGt9G26EPWXEBIyjW0x5RhsnqSaS2e7TTd0iAy7itHnO7XVywWKwy9QxAQKt7F79BCU8Fsy2RclJemjB7+7UaCPPuXHMQ8RhIsJ/SaLO1nvJu6ZeEtPMpOAizUpakzcnmiKkvAXvekFtAD6e6J2r+YIaJvtnyglGa/j14bPaP7XTzYMWaxhaSPXIZG7JPiI3jEyjAd2QVzL1tLZsWH4I7YLdCHYJ6O5hYpbsLHubNEo5VcB6Gqeed7JG3dp9oNhi9nNQ7edGcqBBUGgLuOJHA52btOaYExbrmIMqp4JBI6Ng9U1Ju2Cz7F2tf3pAdeyDev5kBJAvmvdixSwxVKkgwTgt48h7ESANfBijnsPUqyG7WBjo8w9J2j+2LrdXspUT8hiKGw2eDoP5HoT79pXq3M6fRzboMKK1nJyXP40n/MN+LP7KjBhNbLGmVi/pr1DRIdC8Z8MTvJ1WcE0cqm9p7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(3023799007)(4143699003)(5023799004)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUd4TjVNdWdadW5wSzZ5d2t5Y1YyRDdUYlp1Nm9wQStLTUZGNlBBUGNmM1Zi?=
 =?utf-8?B?TGIxaCtUZ3ZOempidWoySE12eWlBMndvQ1FBcm5ueld3L0NRUk9TLzdwNnVH?=
 =?utf-8?B?SGU5TGxGRXV0dW82WkRaSGpvYm51T3hRVUErZGs0YUJRTHJMVUpQMjJuSk5j?=
 =?utf-8?B?QkNxcGlKSm1DdWtSQXRpajVEVGd4bVN3L0RNTGpmMm13ZVJHV01sWG9ScFYy?=
 =?utf-8?B?TG11ZVh2LzdieEYvdkZBMm9UOEFJNE1UbkRxYk9vd1AvblNnSnlJZEtzd0Mw?=
 =?utf-8?B?VmNVeTFtanV1V0R0cE8rSUdieXZEeDJ3aXU5NVhUUzJJM2Z3VFhIYkpTRmJW?=
 =?utf-8?B?bnRWVjIyb3pVOFFkQkVVTFpqeWcrbk1jNWRtK2RlWGQyTklBWEpiYWhZYU1O?=
 =?utf-8?B?aVlpZEhic2tXVjczM29NQjV4RFRyYWZtQng1MXQ0ZUlSR1FLOE9vZVM1SlBP?=
 =?utf-8?B?WGUvU0xhS2pvYk9nRElZUXFBL2k2cC9RV2hsZ2ZpMlNBZmZ1NDNTV3JUdDNB?=
 =?utf-8?B?UU9Ba0J2Q3l0dkpudlZHL1V5ekJxZ1BwYTZWSUpzckpaSXhLRVYwSldPTXFm?=
 =?utf-8?B?MkszbDhsOENhellJOXJtaytQSzV4eFF5VHVNbTRmMGgrY0svWlJ1YlpLM2tw?=
 =?utf-8?B?RjUzWmhkS1lFM0p3TVRENnNMMk1nRGwyaWJIbWU2MElXcUg4RVFRd1dGMGJ5?=
 =?utf-8?B?ZEpJMEFUWlNCemxQZmpRVS8wNjh0TXJuYnl4VFN2czlnb2FOSCtjRGtIUlls?=
 =?utf-8?B?ZXhJaDllMXY1cVQ0Nll3UW94T3ZoSS90S210bGhESnNNYWVjNTdjajNpMWcz?=
 =?utf-8?B?T0lOZ1hnNmZDSnd5WExTVjNrdlpWbWk3WHNlR0NsNkxicWpFZk91d0duWjkx?=
 =?utf-8?B?WlZEdW4zZ1RHc0kwN1JjZ3ZOWGV6WjkxdDZVVzgyV1VSSWVnVGRwV1ExSVJm?=
 =?utf-8?B?WmdMZUI5YldGRUlJRVlvNWp2ZHRKYlNEYm05d3YzS3FEN3RtVlhZMC9qMXhM?=
 =?utf-8?B?eHFOcER5K2RIQnRzMFFIanowcEhKZjNoOXdxRUF5VG5leVlXTUI4RDF2d2U5?=
 =?utf-8?B?eG5nYkVJRmI4OUhac25OS0o2OVpKdHdKeWVHcXpML1MvcDhLdTZlRE1ybUMx?=
 =?utf-8?B?MURFVFhPNk1idjRQQnM3eDhjcmo0b0tLVkZkcXJoakt4bnpTT0grdWY3aW1p?=
 =?utf-8?B?WFlqZEFHL3ZZSEg5WE1DOFJuaDBLSmx4QkZKR0MwUFBUTjdUU0ZnN0xjZnlI?=
 =?utf-8?B?WUErQ1BaN3F2R1d1cEN6V3lNYnBtVDdrQmhlbkIxYWdzZjFlQkIzaUEzYm1H?=
 =?utf-8?B?dGd2M3M3WkZXcUY1YlYyYWVEakVabVl4bkJBVStqakE2bUt4U0ZDaGZvNlBo?=
 =?utf-8?B?K3lXOXpXTjdtV1FweDJDUkpEQ2FJcnRQYktCbjNqbXZLWitTVHM0aVAxZ016?=
 =?utf-8?B?dXhCUDZSMysyaG9LV0xTckExMFplZXI0c3g2R1hJQlZmR0c0YWZ0L2ZLa0FN?=
 =?utf-8?B?VTdHSXA5WEVXU3YxYkg5VitxQkQvWFpXNFg4Yk1XeGlnbDNla2dDbzB6NXhy?=
 =?utf-8?B?MVNqcno4dTcrMGxUc2luamhicnFOc1FnbHlzVHN0d0tDeUFlUHY0ai9oTjVj?=
 =?utf-8?B?bXJOdGR5aTBNUW81RXlSa3A4OFBKUTBMcmRJZE5Xc1lySWpkSVN1Tld2eldu?=
 =?utf-8?B?bTBDelduWG5PQzJBUlpla2E4ZjROQUdvd2tPOTdMOVY4TlBSYTU4WmNIZTVw?=
 =?utf-8?B?cnBwc2lqT1llVlYyYTdqYnlVdVdxVVBtcklpZzJUOTFiR0VzazQxZDdicHhZ?=
 =?utf-8?B?d1ZSREZiQzY5Y09DYlBReWhsaUxxS3ppMjQ2VzVrZDZNbCs5aUszWTNXN1Nq?=
 =?utf-8?B?V1FyYVJIbjFWbGtEVUw2QmJIN1hJRzVQSnVqQTR6VFdMSllKTXF0UFBkMXF1?=
 =?utf-8?B?RmFVWlZBWUV1UGdmUDVoM0I0aWFncG8vbk52dE51ZzMzSjM4VVZkSktMZCtr?=
 =?utf-8?B?TzQ1VjVlYitGRU1JV05OQ3pMc0ExR24wTDlnaHJhQmRKQlZIcVBrOVJSbkU4?=
 =?utf-8?B?WTlYNTFGcnUyZ2ZRNWJnQ2V3YjBsWitOdndCUkttSWVqVGJYSFFkanNKL21C?=
 =?utf-8?B?TU1UcnVZYVJYZVk5Tk5SQmJXZzhIdm92cjR3MXdBUjRrdlBzSGVROVdqUzlz?=
 =?utf-8?B?cGo3WWdJVjNQM2wrblJPQWRkbVRnYkJSdFRmUmdrN0xJSlR2cUFYbjlMaVpE?=
 =?utf-8?B?dmh3dElFMnR0R3NnSnoxcFg1dkRFeWxDREQ3N09LN255MUhhR3Rsa1lSVEVO?=
 =?utf-8?B?UlFRV1p1dEI2eW1NWmJMYW55OXljRXZuSWhhZVJxT0g1eTRFZURHY2czQlRB?=
 =?utf-8?Q?BlHPhBCjagpNVONQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d22bb601-c143-4485-8534-08decc6282b1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 11:21:00.5771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S82GD8s400omEqmZuKn4evGoxNmYGy07E3LmTmtjhK54pv1CVwxPmiq4kwFy7QKGOx+hqoa9W4rmRZ9sOCMqGsQnp9qK+isMAtvE9B70+jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989283
X-purgate-ID: tlsNG-bad1c0/1781695264-42F76A53-EE2991A9/0/0
X-purgate-type: clean
X-purgate-size: 1552
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,vates.tech,invisiblethingslab.com,apertussolutions.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33140698FE2

On 17/06/2026 11:37 am, Jan Beulich wrote:
> On 17.06.2026 12:29, Roger Pau Monné wrote:
>> On Tue, Jun 16, 2026 at 06:17:54PM +0200, Jan Beulich wrote:
>>> Loaders respecting IMAGE_SCN_MEM_DISCARDABLE would not load such sections,
>>> yet we need to access it ourselves when switching out of "physical mode".
>>> Leverage behavior new to GNU ld 2.46: Any contribution to .reloc which
>>> doesn't have the discardable flag set (which cannot even be expressed in
>>> ELF) will yield the output section also non-discardable.
>>>
>>> Since for intermediate binaries we don't care about section attributes,
>>> link in the new object only on the final linking pass.
>> I'm not sure I follow.  Xen already does generate a custom .reloc
>> section without the IMAGE_SCN_MEM_DISCARDABLE attribute when using
>> the mkreloc utility, and hence the .reloc section should never be
>> marked as discardable?
> mkreloc is used only when we recognize the linker to be incapable of
> producing (correct) base relocations.

I wasn't even aware of that behaviour.

So we've got even more completely undocumented and obscure toolchain
restrictions and behaviours.

What else?  It needs at least enumerating somewhere so people stand a
chance of being able figure out which toolstack they need in order to
get a functioning xen.efi.

I'm going to insist that a doc happens, and that this patch patches it
adding in the Binutils 2.46 requirement.

But I'll write the doc if you can summarise the other checks I'm not
aware of.

~Andrew

