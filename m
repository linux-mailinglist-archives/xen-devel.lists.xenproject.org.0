Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJrpIycJ+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:25:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086AC4D893A
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301387.1575673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYVs-0003tl-Lo; Wed, 06 May 2026 09:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301387.1575673; Wed, 06 May 2026 09:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYVs-0003s7-II; Wed, 06 May 2026 09:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1301387;
 Wed, 06 May 2026 09:25:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKYVr-0003qc-CU
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:25:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYVq-0093oj-PC
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:25:50 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb091b-5cb7-0a2a0a5109dd-0a2a450198f6-28
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:25:50 +0200
Received: from [40.107.209.32]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb07f0-c1f2-0a2a45010019-286bd120af98-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:20:49 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB6973.namprd03.prod.outlook.com (2603:10b6:8:40::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 09:20:45 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:20:45 +0000
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
 b=EvqPwXoDLrhkk+X74SOSuu/s64FsSwTypKH58C3d43I65+f6nAGNzoS6brCv9qNMZ+wa0Z4oh6ufHhC6vrJ1wpJAAtwWFIHE+H6ksZ8VidTUFrdpUpIXYaD8giGM5ZdczdxxqoVZ/TattXW/CaBXVpp/bi9dEabaiKbbkMB2HH3yQmrgQ7BmESpFBEW6XJVXFvpsrb+0xNnORaGLM0JzoEeoZtjQN2/rCmGZ5qrzqdNua3U1vfRpWxfv3IZEVjqcu0V9iG8JMt3SKdBL8wc4/ITRXh4k9adDMhrh3xB2madzv4iVo1QePaFfw84KLZJcjuqyRFPsXMM2oAoOExFXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPHHiUiuLqgfish+YgdymKrKWY6+zChykta0zLxzCAs=;
 b=B47ioxsamy78zfe4kB/dOpo/+HXEYA9WwwZHWVKKP7bsjg64WtOl9aIC/yvYhzF12Yuusnj0shLVl6fSNLpeprm31hiI5iQQNEbnUys0jMkw9ujPRW5gGePLBrwoRBsiH44JfuT/qinteLdO3KaRYm7nvqfuyPmZp+fi1KslAaZ6LzRnAyOx2LFgdeqviK/40lEafCW1TSBc3KgUoFNAeU9a7fBEpgE8L958sug4FMz+nmtp6iya06NsvYnc3rwYFEkHHXW+CGhLz7O6KXXc8zNpWt/vnFDgSB5bfKxCMv7ovMqfCgVesqtpNi1znlaaBceF7PGa1aT4oy1eJNlk+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPHHiUiuLqgfish+YgdymKrKWY6+zChykta0zLxzCAs=;
 b=Fv5tDRbDnmdjDrhqhkyU6O9K2zA6zJBNu0dz6Qfcs0kKagN3zRpYvgmLW6AGRMJMYpPJZp8GUrSfQmNQtOJfF3bYciq1TePJiypbZLhzX0aA4b5+O3edFgMtuDVnSIwSCuubgtZhEjw3zKz0KVWDXI3cP5rFc+h2IqDjtQ+adBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 6 May 2026 11:20:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
Message-ID: <afsH6bwxikesmNOk@macbook.local>
References: <20260506073719.40075-1-roger.pau@citrix.com>
 <20260506073719.40075-3-roger.pau@citrix.com>
 <0035d666-2ad3-44d8-a2a8-e612dfd10503@suse.com>
 <afr_RYYMyJEGkNgP@macbook.local>
 <4dc2025e-0eb3-41e4-8bb3-a28b0dc560c7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4dc2025e-0eb3-41e4-8bb3-a28b0dc560c7@suse.com>
X-ClientProxiedBy: MR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: f65d2f68-36af-4d65-37b2-08deab50c071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qmG+REW7Xdw16DFBgf20b3eQCr/JoFCHSYCnANY660H4rPkWJjo/rNat/MCdHFh5b3hxHIIsM6xtsJIq6vUJbxfP5ttOjm7A51stSVsF9fPg/jY/tx+3b8Cp57S/+RL8cYryxdWugZjJ3BCxAB2BcruADflK/MS0WP3BJjZAe24kJZ1e0GdesXnFJAWUWNchieuWA4cmCBxYxUhzQjw69R6LJVGBKsjNWZC+/ISa0nw5hAqo1mDfbQVSs0OqNPPbMSyxIJL91OjfuB81UDnkjHQUO0HVsJlzGPDOD1Qwaj/Et/9cuy7nDqNE8h/aHMC5cAF2zay2CBrf916eZ1M6hOwgEjXq0TsYmUUqUJwSZ1vat7iy+1WcQP8yl2l6hYaDQT9YnhHJBOpPi/c+WCTPxlbWd2Ox0Qm3MZOGR+FN8/wV0/moWZvhuRdyFiYWWmVYDB75RQXyKpDDlTk638UKX5l/YOc5E4bbazzjS9+mSfSz1HoLxo/hBtvDakVYHzGmAGnLy9PPxlBcrUniN920DdQIJvDTqSPLUWdxWckLjUJ7m6T9/LOCSVZyfVe5Ja5SA9zTSxLF3ie3Ffq0pO/oJSemhOJ2nbLOdIBbJykBJURhMrRMFMw1aztFSGjQlFZPGq6fDde/nWjg/3LPaqDqLe2fA5yJcGzoj6XwFNzfULp8uWa/9R+ycOt8VfovkXKJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjRBNnRzR1NsUTdGRFlMUy9UNlBjWU1OaldWell4bFVISFpvRTd6SkdUOWpQ?=
 =?utf-8?B?UkIzWDNhVXMwc21kOGtRaWs1Znp6WjNJS3YxY3lETWlUYzljaFhFVnBnNlVK?=
 =?utf-8?B?QTU0b2N2eE45ck1yTEwwZDZRWkljK0J4dlVuczg5QUxGL3BVcHBoNFpsbW5R?=
 =?utf-8?B?dUZLaEFXUVBvblJQcU9qWDZMWVI5aWtwRzhGVGxtWHhMb0w4d2tmWjhDTWJD?=
 =?utf-8?B?VWorS0RsZW90MS8rcGpsSVNzY2R3dmtleUdMT1NOMUh6YS9VQVFTODBWV2Qv?=
 =?utf-8?B?SEZZOXI0aXNvU1JBdkM5aW05WFcrQnJCaGZBbjA5UWQ4SWVwVkViaWNvKzVO?=
 =?utf-8?B?VVFhdFNBQW5DR0doTTFXKzRoS0tBbE1STGVoUkJyOG8reVRQTmdablkrQ2hP?=
 =?utf-8?B?aHYzdTJ3UkxTNXhzdVZBM3NsTURGZG5nSUxtejdnb1NvbGhSQU5DWGVnRVhF?=
 =?utf-8?B?cDJyL1gxK2lKYU1wRm5QVHE0dHB5elhHbUlUZmJqNFV1UHhNclhIVURBeTBY?=
 =?utf-8?B?NFBvTWQySFJDMFlmbHNaZWFYd1lBUk1QakMrYTFtQjhQSVBlMitVWVJzNDlq?=
 =?utf-8?B?M1BHVnQzZDgrSzRBSnRKVDhZdGVKcmhDWTJ5NlpxQ1VzOUUrdWt4UVRIdCtG?=
 =?utf-8?B?UFJjbHpKT3g4NWFqYXRJU2tNWGVKWmJyMUlrbU9teDFyN251S0lmZE1xeVNy?=
 =?utf-8?B?SU9ESTRzeWdlZE40NUlIKzZUb3E1NGllc1ZxTlBRZ2ZOOWMvSUo5b1VxQ1Bp?=
 =?utf-8?B?UFRDbG1zTEZ2K3U1dUNnR01YcGU3NVlVcmNtNVZoMm1VR0pwcFBVL2RIZ3NY?=
 =?utf-8?B?MXBwNUN1N1EzSW1WVDVWcnRPc0FVZHg4eDgyNjd3bGozSVYzTEZleHd1STk2?=
 =?utf-8?B?aGlkMmxnc2twZFBzSjNpZnJpUkhWUXRvRGh1cjh2WUhFTGZzNlVJbzZZUW9U?=
 =?utf-8?B?TGlBZzY4NjB5TGlVb0V2azVNRndxWGwyQWFQMW9LZGorTTJCT2JuS204K0Zk?=
 =?utf-8?B?anBMbFFtM1VpZHl6N0swZ21xNTZDOEczZTBxZ3I5UDBWc0V0bTBRR1ZEUGVK?=
 =?utf-8?B?R1pXRUVLVllKNkhFTm1WRVJTZTNaMnFsWkpwZ1BOWUE5V3Z2TTdNeHEvTVd4?=
 =?utf-8?B?MlpZazNra0pjMDR5ZkR2UlpFdy9seFMzTmg5YTZOTjBJUWszVjZjbStzVXow?=
 =?utf-8?B?cEwxVmZDTEpUNGQ5ZW45aWFwWENleDlodTZFbkJObVNaaEVjZTNINHNkVHBQ?=
 =?utf-8?B?SE11OFQxTlYyaGNsd0ljMk9ybXFyQjJWOWhESzlseHpHNjJHQ3htSWNzQWRy?=
 =?utf-8?B?RGRsVGxLdGE2YXhPdTRTR2hvVElpMFREcUJZMHBnRTdZRjlMaWxMalVwaUg2?=
 =?utf-8?B?V1liZUJuK2JtcUZLL3dJVTdMVVlmeVNMT3YxOXpSWnU0SDlpUTBUMktMUHRy?=
 =?utf-8?B?SFJtQzFHMDhteThuRmNETXdVai9MTFpLQXZ1K0JUMGxuanFtUytqSmFSemJu?=
 =?utf-8?B?ZE5OTXRBVVB2Z0R0Y0pZNEtmTTBLY01DUm1kVlNHZHlFNnhaRy84S1BFTnlD?=
 =?utf-8?B?VlNnbFVyZU9oRGEvbkV6Z0gveDZqck5HNXJJNVQxSXBYNVVsTm5aRjNHaVR5?=
 =?utf-8?B?V25EQ25waGtTbDJsQWpKQSsxZm5OTWZvWUVZQjFuaElQbWdqeU01ci81eHVm?=
 =?utf-8?B?ODkrbERGNmg2YWRxR0JBZW1Xb0xVdVZoblJXTGZYckxmZWxMRGJQZ3FWZjFR?=
 =?utf-8?B?OUV6aEs5V0h5d3BRVE9PbjNKZ2ovZXBZa0U2OXZ5OGp2MmQ3STlHaVlSWXpY?=
 =?utf-8?B?c1JsV1JuOG9KQVBOcTNFQUVzcUZ2NG8xT3BTd0V5QWlVUEt5eFVjUExKV0lO?=
 =?utf-8?B?QTVVTnhtb08xR3hYa3JoTkpvWkQ1SGNybXN2RjhPNDFoYkJwUE9CT2JtWW1n?=
 =?utf-8?B?V09HRWJRM0VncFBqLzBnUTZGaTNKQnBadzYzTFRLMzNxcUhXZ1hWTmJLSnBD?=
 =?utf-8?B?ajdNV3hZYUNSeHdYcjFJVVhRTEpsTy9pRmZiNzBidVE4ZXFOWmxEc2IxUnhQ?=
 =?utf-8?B?UWhvQVg0V1h6Rjg3ZFN3cmJiV01nVWNWYWZHQnJlUFUrcEN6ZmFmWDB3RTF4?=
 =?utf-8?B?QUhCTDRubFU0MHRRSEVVZVRJc2kzRlpoM0h6eUVsOERPQ2wvdnl2M3o2Nk5r?=
 =?utf-8?B?VHJBRDN6cVdObThMOThRaDFpQ1VaWUpkR3lWMHViRTJ0MXRWU2tmbWpOdFBG?=
 =?utf-8?B?b0RHZUtUMVVyMmJjdGVHbXJNVGZEZlA2ejFnMDBJT3htdktTY0xnRGJNS1NJ?=
 =?utf-8?B?alZodzVEVHd5aFVlenVuZVg4cWlFdkRiL1ROVFFsZGNyYzQ1Vm56Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65d2f68-36af-4d65-37b2-08deab50c071
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:20:45.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7thLg97/ZzfMN9G0ngc6BwkYXqWKYEMIVsoZ/w2jiUjuuGIevNddo9y33JUJobzwt8Vliluu3BpKK60jNiA2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6973
X-purgate-ID: tlsNG-d62444/1778059250-AF754FF4-78E74CFE/13/0
X-purgate-type: clean
X-purgate-size: 1970
X-Rspamd-Queue-Id: 086AC4D893A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, May 06, 2026 at 11:17:25AM +0200, Jan Beulich wrote:
> On 06.05.2026 10:43, Roger Pau Monné wrote:
> > On Wed, May 06, 2026 at 10:28:52AM +0200, Jan Beulich wrote:
> >> On 06.05.2026 09:37, Roger Pau Monne wrote:
> >>> @@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
> >>>      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
> >>>          return -ERANGE;
> >>>  
> >>> +    /* Read current control register and forcefully disable the IOMMU. */
> >>> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> >>> +    disable_iommu(iommu, true);
> >>
> >> Don't you also need to pre-fill iommu->features?
> > 
> > Indeed, that's done just ahead of this chunk, in the
> > get_iommu_features() call.
> > 
> >> And with that field's use in
> >> disable_iommu(), won't we be at risk of leaving stuff enabled which we are
> >> entirely unaware of?
> > 
> > Possibly, yes, that's always a risk.
> > 
> >> Even if we fully cleared the control register (which
> >> would eliminate the need to fetch features), down the road a 2nd control
> >> register could appear.
> > 
> > We do clear the control register, it's indirectly done by us setting
> > iommu->ctrl.raw = 0 after the disable_iommu() call.
> > 
> > I did wonder about just doing a write of 0 to the control register,
> > but I think it's best if we try to gracefully disable the features (as
> > done in disable_iommu()), and then reset the cached control state to
> > 0.  Future writes to the control register will clear any bits not
> > directly set by Xen.
> 
> Maybe better to explicitly write out that 0 right away, even if you want
> to keep using disable_iommu()?

Yeah, I also considered that.  So after disable_iommu() set the cached
control state to 0 and also zero the control register right there.
Can do in the next version, unless there are further objections.

Thanks, Roger.

