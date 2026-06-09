Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d1nsDXlkKGrbDAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 21:07:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E84A66385B
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 21:07:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=S1xr+GaK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333796.1596959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX1nD-0008Gq-E7; Tue, 09 Jun 2026 19:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333796.1596959; Tue, 09 Jun 2026 19:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX1nD-0008Ee-Ak; Tue, 09 Jun 2026 19:07:19 +0000
Received: by outflank-mailman (input) for mailman id 1333796;
 Tue, 09 Jun 2026 19:07:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wX1nA-0008EY-WA
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:07:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX1n9-000gGp-T5
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 21:07:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a286429-5cb7-0a2a0a5109dd-0a2a450581a6-28
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:07:15 +0200
Received: from [52.101.56.60]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a286462-aaa8-0a2a45050019-3465383c160d-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:07:15 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7811.namprd03.prod.outlook.com (2603:10b6:610:252::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 19:07:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 19:07:12 +0000
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
 b=p/XlWcSVb8R2t+XTS9WNetOVQA5E3upCrHPHXBgnyK2FMeHMvM5YzrisAqbNbCJamU1GnTkyAoIinRA0k5H1lZYWmD/OI/2tWVufzO1gLdnpl2AGlGrYb1i4LaTVAwvOpyIXRfpMM6Vhlo31nebgHSHl9hqlF3dpkamK5uN4O6hsh4S7FfiFxu39h3PvKxarJtzyadliksmbCErlUsdPzfT5E5YcLtE2tMe86mVwSgcayHR2qCTi4a/W4Xa8Hg422CFKrH7SjcBgWOkmkEMFk5dAWRQJYHi4X121ts+8ApSZldJM+6jlqugY2Fu7q8SaSy+PiXWN5C+cTx3I8vxCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wp7e+qyszNZ9hJNHiQ5KJOMalie4vlFL2JQbsbwmja4=;
 b=okh3GaOSyTegvUXN3xKYrmC7TATDM4W9pMutixiVB1aLLsPuqv8dpw1OhMO3Gj3nURTKw69GewE3KW4GfuVkwVZj3Nb0oqLW5vdLh/4Ukv5ZrTkvehQoY2ENWz02CYWZfKkTKIlHHf1vi/MeB/loGcLyB7D1W/BPNVr2G2LF2EEQq4xqHete+qmXKgwdO/yxcb2EqyGGywW5xYQppI7XudFj7L7klIGWRZDXZEoFnbuHm4RuFPKsYE7xK+5hXJJOfRKuxqhpdtOeDTnWbtvk48oJ2eLPlaObz0aocD1KzJxMs0pZUwh3nvM+lpxrKg0zGt77vgUGSX+M1ZivYMxKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp7e+qyszNZ9hJNHiQ5KJOMalie4vlFL2JQbsbwmja4=;
 b=S1xr+GaKr4tpZ1JUfnxdiUNsWENks+XlVnXnVnqHbTFzZ4liYK2Uk/Vu6iHJ9VcUrBZ3B+mI8AHpj/fr5TOZSctFPxX3Tn1Gznb0EpI8rL4+L9deaW3XBEXr/15svv3J/LmajptRmIF3GbMjmTGADJFQ4PWkCHGJKimIILTrsiI=
Message-ID: <fd5b89c9-89ee-41bd-9469-c5cf121debb8@citrix.com>
Date: Tue, 9 Jun 2026 20:07:09 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Kevin Lampis <klampis@citrix.com>
Subject: Re: [PATCH 1/7] x86/kexec: add digest checks
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-2-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260609154518.779757-2-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0460.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::24) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 748286a2-f37b-4687-114c-08dec65a502e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fRl2hVCx57dgHVwioJJWP5CalbNfufzPZReWzCzJBCCIdltfEEwnhv9+NL2O3DTeOXpdx9bihrT+vkG4sI3XHYv1yhboE5TUEHIeWbK4C1rFUGoQp6qroBRsgtY7iIM+VrfbrN7Ty1qilP9rQUElLBLYMUQsWfjzXPKzp8gZ2pesNJz+iqKJy5j+GiJ0hUBZGO5N/BEmdjTLP8ec2pxXjsMoLHDbopyXvvffIV/3AbSiNEUkPScOA40/iLvJ097+4oL1+GuzFEj76rT7d3WwgrtBWRcOzBA4c5m9fGIc4s4jFCkCst3ugrh1RwjWxpBEn/CD1xVJP+6XqeU7KFYvKgCB6t8YGfrTix55Jear72QKMvisQfPxXN1Vc3akE69MrD1hhgCUBDsnyvDbPYFwsUjZJT3D1DR7qoahW6wcLc7MUy9dgMK9VfmDHC+bSs5baTTNNk4E8/XP4GQwTmAD4SnoxayCm1jwlVd9Xk/ATVzluGK40k4I+nK+m4s/TN+dyE/mS7ml6G8k+Fz9/9cQ7G8dKsx8peS/Y3C/DyDP6ThhVSEof81UDySyQwFNYEtvfLQFujPQskILGVajw84urMB3qCj9c6SpdKEeJhvCq2sYB0ZpnSrklknuRNCJBkPRKlnYS5EKYhWEeoYV3E3UTHryUU02U7P4JKf/6sN5o3nF1mHQzWfWEI24KVGU6mdp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUlXWEF2bGdPWjd4OVB6ZTd4Ymkvc0ZZbFUvYzNxNlEzeGVuUlpkd3JvUHBj?=
 =?utf-8?B?VHBlSW1RV0pncUdVVXZLN1RMTDFLZGpvU01EUWFTVjNjNjlZVXEzVEZ0OWpL?=
 =?utf-8?B?UzFFMmZ5OFNJVEZZZXI0aEFKS01RTzcvaGQ3RVZhU29jTkZLSzQzNEZiVTFT?=
 =?utf-8?B?a29uTkU2YjNRdXBYZlhhY3EvV3lHNGQ2eERMV3VNSnNRZHdUN0RGVXU1b0dv?=
 =?utf-8?B?UE53TjVtdS8zZk9MdkZhb3liOG1MU3ZnRy9ZSTdxb1J1UVNkVC9JZ1dxUC93?=
 =?utf-8?B?ckVGdUVlbnE4YjM2Z2d1c2pzdzJRS0QrWXl0NzRrelZHMUhseDd2ckF1Vnhj?=
 =?utf-8?B?bDdQRjlmTWZNbGZDZ0Z4cTNUbzVUandLSi9KY2lyV01yTG9KTUxzNHQ3M1J1?=
 =?utf-8?B?d2hydUdmTVkyeVV4U3RYTlN2K0JVTTYramxWMkYxSG9wQWtabW1UYmpoRGNt?=
 =?utf-8?B?UWZmaFZxM0RZMkxrZ09NMldhK05QTTVUSWxuU2ZNcXc5RHpxNWsrSEkrcGlS?=
 =?utf-8?B?ZWI2Vm8xRFNXMWtWZjNqV2t6c1BldzlyZWNaZnVDR3V5LzF1dm5CQjl6d0dO?=
 =?utf-8?B?TE5BelhHTXQza3dqcVhBQll2RmxwYS8rUm9rSkxYc3RXZ3JyTk5DUi9wb243?=
 =?utf-8?B?WFRpYVAwR1RQQmMzd000Uzkrbmc2ajdaVmJwODJ1Sy81Z2dBQXNNT3orMnNx?=
 =?utf-8?B?NURmazRsZnVnbE1paGYwWHNmdUcwKzkwa3JlbStJeWJqQjY0ZEFWb2RhRHV4?=
 =?utf-8?B?MndKUW1qUlZBWnMwOXlPbkJSRW9RY1Z4ajRWNU1YNysxK1lvdWYzbk5JbmJI?=
 =?utf-8?B?bVlXQkZsaFBUQTJ6KzJ4VmFLTTNsWHkxMldXcUpCc054SzRUb2M0em90OWg0?=
 =?utf-8?B?bExaY1NzYWZPNXRhYnBOMEZTS1FxVHltU2NwZmhkVURBakZxeFRlbXFtOVVW?=
 =?utf-8?B?V0dNbkdiWXhEVGM5THdrK3ZFdWFBSThtTUpuTHVSTmJxWFdRRHlYTFc1WldT?=
 =?utf-8?B?aVBFZmVIVEZPemN6VTJ1OGpyYWxDYUxTSDlBRnRFbDhoWXQxM0J1anZhU3l2?=
 =?utf-8?B?QzlFbU1ZSXBkdTc4N3psR285eFJHSU9mSmRFMGJhcEwvZ1RVV0F2ZWNmLzRn?=
 =?utf-8?B?T3dsdWJhZUtaVnhQa2kyNkw4SFRXbVd3SmVCRW0wUXhYS3JHNjN6SHZRNXBD?=
 =?utf-8?B?dUxDTU4xL0RUaU8xRWZJZyttemJ5WWxDMXNiUno5MDNsNW1qZGZxQmc1RXha?=
 =?utf-8?B?bnpocDNXMVM1ZjB6ZHZyaDVxd3gxRTRuM2tWRFE1Z1dHM29PYkZDNGt2WVBZ?=
 =?utf-8?B?V3hrVE9VN1EyK3JLR21XYzVlVWhJczFseE4ybWI2SzdvTDVLb2lzUGRUZmJK?=
 =?utf-8?B?R1pyZ1Nob0lCL21UT0xCc1Nlc09XOUVwUHJZbWZSME82YjlWK09ud0JxbU5H?=
 =?utf-8?B?L2V4ZG9zNGpqcldwZG5EVGZTVjYvYWpiM2dzSFNOK3V3SXUvcWdBdnNrNHBu?=
 =?utf-8?B?eXlIYnVubnJFVlI2U0lJVkVmT3hNWGxlY01IWDhKVHVwU09LUHhUUDNhRkF3?=
 =?utf-8?B?QmVZcnJ2UlFsbTV2ckFXMHQ1OE9CVG5LeUZFUWFvSXV2aE52enpTcnFRSk5O?=
 =?utf-8?B?UER2YzlaNEx6eUhJNmMySVIzQnlvT1Nha2dleldtb2FxNGYxQ2N1RlhaTkw4?=
 =?utf-8?B?UUNjUEk3c0dBeHJDM3NZdE5mbDZkdU9zVHhRQjNIZm5KTXdnMkZoUTJmM1RE?=
 =?utf-8?B?L09WVlZGNXpOMUdLaHlhakFOVWN5bzB6V3RNRlRGQkZQb2Z1L0VzRFV6WXBO?=
 =?utf-8?B?RFJjOEV0VGFyL2xoalpDL2xubmRnTnlINDJ6THNUWFlyZEFPTDhBVU5NczZo?=
 =?utf-8?B?Sm5HOWFnVWozS0RwVXh2QnhzaVJmb0hscXFCWFlnYTdoWWNDYm51RzJlMHcy?=
 =?utf-8?B?WGtEMjd0THVyUFVmQVpFTnNBVFNIajF2NjQrLzc0YnpJYnlrVHU0MDZIYVc2?=
 =?utf-8?B?dmhBSXJsME8zK1NwUW1DNGNyVGpJVFdjYVprakc0Sy9HbFhZZU1salNEM01Z?=
 =?utf-8?B?c29HUFVuMDQyUUVuSUR3UHZrK3hmREx6eDNHUUE4OXp1am9xVFdsQXJqWGh1?=
 =?utf-8?B?TkJCNGljeEJ0U0VhbzgzL1ZPb2pzZm90WkhTbXVTZGxKTlE1elk4MHorWFp4?=
 =?utf-8?B?bmZNc1dIUmt4b0d6ZFRKekRVeUdyWmxza0QvaGpXUWUyK0Z3dHRxY0JZdGR3?=
 =?utf-8?B?eWFUSWZrSmg1UU1NTm9EUXpyNzg0L0tGT2F0NXQ3M2U0Z2sxdDNGZjRON0M5?=
 =?utf-8?B?MFdCcnJHWW9KVi9oaXErdmpaZ0VkTSt6TUdNYmFJaGgyU0JnSWNTYnRmYmpO?=
 =?utf-8?Q?NV+1j18sWd6uko6o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748286a2-f37b-4687-114c-08dec65a502e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 19:07:12.8573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbH06t32gDHn/Spe6JI+3dQNePcH4POICJ90kQAKeHwodnUUSAlViWgP4ODzTG6UUjQZRxHo/sqthGf8j/cC7FSr0ddHbioz0MTT8IO/7kE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7811
X-purgate-ID: tlsNG-c201ff/1781032035-E1798443-E2745D76/0/0
X-purgate-type: clean
X-purgate-size: 610
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:klampis@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 8E84A66385B

On 09/06/2026 4:45 pm, Kevin Lampis wrote:
> diff --git a/xen/common/kexec.c b/xen/common/kexec.c
> index 65776a95fd..c920bc6d8a 100644
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -1132,6 +1138,10 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
>      if ( ret < 0 )
>          goto error;
>  
> +    ret = kimage_calc_digest(kimage, kimage->digest);
> +    if ( ret )
> +        return ret;
> +
>      ret = kexec_load_slot(kimage);
>      if ( ret < 0 )
>          goto error;

You cannot return in the middle here, or you leak a bunch of allocations.

~Andrew

