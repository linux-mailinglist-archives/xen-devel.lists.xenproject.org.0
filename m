Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMpRKTB31mlQFggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 17:41:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F1B3BE5BC
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 17:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276299.1561819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAV1i-0003yi-Fe; Wed, 08 Apr 2026 15:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276299.1561819; Wed, 08 Apr 2026 15:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAV1i-0003wG-Cq; Wed, 08 Apr 2026 15:41:10 +0000
Received: by outflank-mailman (input) for mailman id 1276299;
 Wed, 08 Apr 2026 15:41:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAV1g-0003w8-7y
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 15:41:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAV1d-006FNh-GL
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 17:41:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d676fb-5cb7-0a2a0a5109dd-0a2a4508d96a-36
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 17:41:06 +0200
Received: from [40.107.208.37]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d67711-fab6-0a2a45080019-286bd0254d0b-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 17:41:06 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH8PR03MB7173.namprd03.prod.outlook.com (2603:10b6:510:258::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Wed, 8 Apr
 2026 15:41:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 15:41:03 +0000
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
 b=DohrcPqqATpazM++c4pI1eO/W9X53qRry2FXpOVkibc6tc9XwHVeZxAER5GnOqa+ciIcDDKyOFXF2oz9IYfdJ4yIf9et2MEjHajQFeOWu6rrj5zjFoNkX7Ud1AHFIDaYA2C770/5QK8obNorVRa+SOWofmve7qXsM1bNFAjXOkqY6q+sKmh8zoRCTcdh6pvcDuoOqGQ4gRz1lvRg5RowKLrDyFxKCvSUk/BMFbEDXH8e8hGametjO+y609qZ6IRFJ1bLjMBnbWpUe6t2+g/nESRgSCWfgvxkjn29bodAgJ7lzLZTJafHecs1LA7j8nUkHR+u69RZ/6GAZRpo6P5X+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tr/Y0Gz3chxWgm4AMzCiZ9/xFQowDOJyVT6SkDajFLo=;
 b=BoLTdmcpWp1hFfCOzNZUDQN1XS7jU2cbGYf+p7BZjr/3vWIyL4wjCrvwFjpha71tH/AJf1mU97j13/camsZ1aP88xICT8bfoXO8S4Ov4EmqH4tSXhQiS1EVIIOyS67+t8KKuQ4/L2lvpBAD+Q24nE5PI/s0DfZJU3WN1eq6iTtDfidOepbX6+QELcKFiHJ6jpX78+heFrCjPFN+0ygs9Z6rTiG2KEwqtgS2KrNddqUEiBnNJohpwyJDM+svOseqs4CfVyznH44byCJi6VvmYpZsn62Z0e35svQWRD78Z2mdJEiFHXf7IdY0tp+itig2FVOmm5yhU3KCrgsfz8inORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr/Y0Gz3chxWgm4AMzCiZ9/xFQowDOJyVT6SkDajFLo=;
 b=Nu3mv6NHVonWtwdLJmwvi2RkFroOLcsO64F17TuX7LF0uyPPWPhDmNVYCkdwUL9FC188AouoebTtltkHwFNwc3CbRQf0I9Gmew24jn2/9NuCMgMFoT5XjH/WyNjahYKwBIt1/7eWENbgeLjgMB2j2DEZkQ8pnnXz7hCnuvLDr5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bb6caa97-b3b5-465e-8690-c3aef061d885@citrix.com>
Date: Wed, 8 Apr 2026 16:40:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Harry Ramsey <harry.ramsey@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
References: <20260408135531.1744388-1-luca.fancellu@arm.com>
 <20260408135531.1744388-3-luca.fancellu@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260408135531.1744388-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0266.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH8PR03MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: ca13cb5c-6fc6-455f-ff78-08de95853d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cku6v61QO9RojNi2aDKQtDa1CqOF+AQt+D//XyHGjKtAuwIBNQJCfn9PIYQQOIfBD0Ez+vsyfqCrzrPxY2xcHB9+A9anrB25b+gELhcp+cnC21H+DED+cEEhCa0YqDdicNvgqeVPs8vtONF1ptyRi6xKcmrGoPjlUiLHSlpHg9i+j+jr25JTM/Eb1Sy3rir6fa49bMlfhX0ND0NuFwpFw58G4+Oe40UikguDqrDi8iBzr1BifoWnOnJhCKZSB1TFHyUbKcF5gqZvTiHZlzsrUyht4RW4xP+wAgGWxdQOK/09py1ehNf/kRFiMKiJlQ0LMcO+VcwNU8t2spOzdrWx8VBX0zyDfVR3I24h+VFhHcaiqC6PVZ0MIJrzBNYEMn//AJ16uzV7/UKVICtnM+Qcsw9up4sg978UB6o3i2riVUvuWKTBfh6HtZN6FJBiTeBekYWalX6tXtqI/hxielyiPCGnQ+XWEU3KbgT4arxYMoWyAMeIdZusOcbv5G+ZU7XbUfhd7e9PerzFU03EoQnF+GMRfY3OVP1bmiSE9xJSe+Eel27O+fG4lAzEB48GMMZOeH1kZxJU99IpAIGC88UMffFBB333yT7YmKiy34VKIgu6HvqfRpFJoGK5ETP/QTI2KxpVDfPgHJ3+21541KQIwW38M75MAcOGDRqhUp2xDcTk5/bME80dP37biA0g5ziDPHaI/X8m95YdWPTdWJOg2Pf56rRUUjfK0wwRixkfNvg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3RRWmdrTDBxL0ZuRVNSMXhNVUx0UnRObGd2MGxPMVpjUnAwZ3g3WGQ2dnMw?=
 =?utf-8?B?Vjl1aXlycVBpTmJJbU9kNmNFYytIRDdoc3h0SExoamh2VGgxait3Ym14NGFO?=
 =?utf-8?B?NXZqa0VGbGFvNUZURm1JVVJGZ21yL0VqR2hGdnZaTVZJbDR2c1B5VG9VQWJP?=
 =?utf-8?B?MVJJTUlWc0NUNmhpUytsRVAvdGNWdHdFYU9odTgvZDlYQ1hLUG5SQ3RkOERL?=
 =?utf-8?B?TDBPNjZXVG5nbFdPc1BKVXVkbmU1YkZJbXNUWXhmMTRDbnB2aFFzZG4yYVJh?=
 =?utf-8?B?U2pHQ2VTV0pFZ0FZSndWU0dBTE9URzhEeUd0c0g0d2lXWXdpQmVWZ3VJdWl4?=
 =?utf-8?B?U3pWUHVNa2tYM2pWLzdRT25nbmhNdHVhc09Wd1VRWWJpWXRiMjhWZUFORGls?=
 =?utf-8?B?YU5OQUJ6Ukk0VHhPbXZKcURPZVpaN0ZDSnl0c2I2MkVBUjRXbTFMSm1YeHVa?=
 =?utf-8?B?S28zZ3hUOGpXZ3ZJdmtDU016RWdTbm1temRNdW45c2hDS0haWkphSzRvdzF5?=
 =?utf-8?B?WGNvR25HQ3k2S0w2aWFscGYvcE0wdDg0MzR0M1dDOGxGM0F5VGFLUXVIOHZ1?=
 =?utf-8?B?R0MvN0RVMVQvWWliZXZSQVk5bjZCZGVIdXdPbjM3UDRZdS8vUjJENHNxc0w2?=
 =?utf-8?B?LzVTcmwramJvdDBwTklHUGhzd3JqYzFNSWt2aTBPVThoZ3YvU0lETndwMmdJ?=
 =?utf-8?B?bE5pVVA3VGIydTV1b2hHY1g2WVc5TFFoSkxKZ0xhKzc4ZVpzVUJkMUVnMENt?=
 =?utf-8?B?bklFN3JJT1AvbGVaT3l3M09YazE5ZmxHU3hucjUzSEpsWEUrbHVpU3psMnRE?=
 =?utf-8?B?dnc2VDB4TlZsN29LVUVYdlhBQ0NHd2RuNE5OckZCZ3BNRVMyUTFmVjlHSzIr?=
 =?utf-8?B?b200NzZPTGN6MmRQYlQwQmEvV0pEQW1XRnQ3TStHZ3RaeXZEd29GelFrSTZm?=
 =?utf-8?B?eVJSd1JGc0hYbmxhL1EvYnAyZjczbWhFVS9yemFrZk12TmNUeTQybHRpd3lU?=
 =?utf-8?B?elFpZ0ZSaGM1eUY0K1lCSDB3S3Q3RzNGVmczdXgxR01vZGZOMitzVE1yaEwz?=
 =?utf-8?B?NnJQTmlzcnRiS2VMZ0tnc20xbmxHZFYvV2pYR1A2OGJVNkp6YkpSQ2F3UzVE?=
 =?utf-8?B?SHM4OGFyQXhtN0JGVG5SMXROTk0rVWdFY1djY1dqMjEvYTZIQTVRN1V6TVhB?=
 =?utf-8?B?dVBjNFNzbTlZWVVQOWZwRFZBdzVhWnlyWjl6M3ZvRjUwK1ZtaEExbm1hdGow?=
 =?utf-8?B?Ymc3dkp0MTVielJiMUEwbWV0eUR6disvL1l4dmMvKzFPL2VHUWQ5aDBBc244?=
 =?utf-8?B?QnIwcjFHc3ZHRFpRREdNRytPYlhXV1RzVlp0aGticFd3bjJOcWUrMGFUWjBv?=
 =?utf-8?B?b09vbVNXYjQ1WWJPbDd2K2dINmZxdXBPMjI3WXhONEdVRFpxdnVCOGUyNzFr?=
 =?utf-8?B?dTkyTUpSdTNkZG50R2pYeWxXeTRMd3VrKzVqalJhdDVKZUhVenZKbnNZZFFS?=
 =?utf-8?B?eXFJUkZOY1dVc0F5RTBnd3pWUmhCQzhGcS9UdGFoSWhEbEpZZnFJYVdpY2lG?=
 =?utf-8?B?TzA4MGNieTdkVkl5ZlB3dmMyTjc4SWZxR2JDQzVvY1JBTEkwaG9nN0pJQ0FI?=
 =?utf-8?B?RGN0WWpGcWQyV3Z3TVBGNks5QVNYWVc2bVRYYWJZOENpOTRUYzFnNWJILzJF?=
 =?utf-8?B?RGExRTZ3WlNjbWMzNmJGdzExTDhvVkxtRWZFUmNmSzloank0d2JiV0luWWdt?=
 =?utf-8?B?MC9ZWE9HOERpWjBpSnpaOEJyT1JLUnlzMWdWNS9HdWJyTENaaHg1YUlac1Vu?=
 =?utf-8?B?a0FTK25yZXdnUHFxanl4em05RHJ2TkNtWS9PSFZsZ3Bocjk1Q0xlNnNlZmxV?=
 =?utf-8?B?MlpNT2ZleXQyR2NjYnNVMTRHbkhaN2hZbk1pTnVBWjkrNXZoWUMydmdQSis5?=
 =?utf-8?B?Wm55SWhqZUdVYjd5WmVtakRQRFlQRDk4Ri9DV3NKVFB4MEtrb3JwQlJRRFI1?=
 =?utf-8?B?UVhDK3B0US9xcnRLeXlOOXJlYmtLdzVxQzFPU3JHSUdQRm4zWXMxbFdRSmRl?=
 =?utf-8?B?cjNkSUtnSWdYbEs1MU12RWdFMXAxSTZSOHBXVXBVMmpVWUdWcVdkbjhZTG03?=
 =?utf-8?B?Qk5WTFJlZ05KYXBzRGlkOVlmY3JYZldrS0g5OXYwTTdYZzNBN0NkMGRKbTZD?=
 =?utf-8?B?MnR5cXZ1V2FSOVdSc0NPY1M2QlN1NlJsbDBSeDZCSitXMmw2d2NCOEdhS3Bu?=
 =?utf-8?B?bWlhRGF5bjZwWWRsd2FzdkJKU2htK2ErVkRLbGNWMTAvbVE1Y1N2TFVqTTNq?=
 =?utf-8?B?bGJRZnFRZXdmMFB0NDhaSEFBL2w4eTNrckRFR1VSY2VpZFBXNkN3blhxVUZn?=
 =?utf-8?Q?xEkHHvpxYR0ANrAQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca13cb5c-6fc6-455f-ff78-08de95853d85
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 15:41:02.9473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeBmZG8dV/P/yFx6mxx3jw0yG7K4e4lEat5U1KQzdnAPYRFJ974V36kwKqY0rSIhFwJEDARcu74W/x/pqoumTEoIkQ58fNo/vZ0hGcTlg5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7173
X-purgate-ID: tlsNG-c1860d/1775662866-F7F42497-6570CFC4/0/0
X-purgate-type: clean
X-purgate-size: 1259
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:harry.ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 14F1B3BE5BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 2:55 pm, Luca Fancellu wrote:
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index cd563cf70684..23df2f24cb09 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -355,6 +355,8 @@ struct xen_arch_domainconfig {
>      uint32_t clock_frequency;
>      /* IN */
>      uint8_t arm_sci_type;
> +    /* IN */
> +    uint8_t v8r_el1_msa;
>  };
>  #endif /* __XEN__ || __XEN_TOOLS__ */
>  

This isn't ok as the singular change to the public headers.  (Also, I
haven't had time to fix the other API abuses that have crept into ARM's
arch domain config)

You're introducing a new hypercall input parameter (which is fine), but
has no defines (ones private to xen/arch/arm/include/asm/domain.h are
not permitted for use in the public API), and for which there is no
input validation.  Userspace can currently pass any arbitrary byte here
which will be copied into d->arch.v8r_el1_msa, not that there's any
consumer of this field I can see in the series.

Frankly, I think this series is chopped up too much.  You really must
not be introducing new hypercall parameters like this without the whole
series which lets you `xl create` such a VM.

~Andrew

