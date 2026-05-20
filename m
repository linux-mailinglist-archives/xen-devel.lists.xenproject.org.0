Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKIpLMrlDWpz4gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:48:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D5859277A
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314192.1584182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPk55-0001ip-Sx; Wed, 20 May 2026 16:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314192.1584182; Wed, 20 May 2026 16:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPk55-0001hO-P1; Wed, 20 May 2026 16:47:39 +0000
Received: by outflank-mailman (input) for mailman id 1314192;
 Wed, 20 May 2026 16:47:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPk54-0001f9-96
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:47:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPk53-00HNPv-Ba
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 18:47:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0de58c-2eae-0a2a0a5409dd-0a2a4502b516-46
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:47:37 +0200
Received: from [40.93.195.54]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0de5a7-af86-0a2a45020019-285dc3363a62-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:47:36 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5140.namprd03.prod.outlook.com (2603:10b6:408:7d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 16:47:32 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 16:47:32 +0000
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
 b=CkEyi++n/AIFO7IZZEc6TDBszikcGoumCheKCKWOlD+Ng7qjDwzplSfcNQKFbF2CkjT0r0EGRPyAgl25VAl25ehrmMfGjjlNeE6A4g2DutS1jMpWbDIB8yYiTN8xNLtWAlykmNFkpGGxfwhzD5vfnRJWk0WQprHj4whpEKdILwWGimP6SquIry4iqa2yTeIYysy/NkITgm+fmiGOa5pxtahwVuumOUD8MHRjqaodGRTz0+GiS6Dag3Qmlj7iSGodNuuc6+91ui9034+ggVp78QxFNGMBzD5YQ0gfM2tWWAez4IeoLkVIKGryEmhdUdA/qHylg9G5vqnI/xVtqLZ09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMa9x7NfrTIUVNyMKtnxAFkNC6/MdmDNZLFaao9cMzc=;
 b=iarGuU2jfDoQ5vshahQDMCW07K22c6SJiGhokn50lb8CdlOhzXFzcLpKkPJShZRZKQCSBNRyY/VGfnXpT2exMiFiMFA7goOdE2nZBwZHqlSQlyA6uzvvy05aAuQx666vVRPD2ySPVMkvciOFqeJmKfoQX8penkF7d/tFj9hGa9LbHjCM6QcjggpuCnUhD3vLspNQ5xFQ9aMR0KcXviq3ah8seGr045H/0aXVKHRxkg2QGmUP/rjhbMSpFyXR68XKv4gdbCgLBqAJlS7YnsBr0rEoxvKY6ZP3fYvi5AaY7mxyv9v4K+IiXIpndWq8fjAwcJKpGwliSJy0kAGF7puQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMa9x7NfrTIUVNyMKtnxAFkNC6/MdmDNZLFaao9cMzc=;
 b=S955qACz/HQKgHyuWGDOGgXKn04gc1qeA/OrRxamjJRHM5SWZX1PSyNmtPT2gHNGhZv+5R8eYMtTRYWTwmcOkjVVhZ57DASP3N2G9+vfAFhzjuVC/1brK2C/2TV/TbQqbqNxELso7Js37/UKkfuLqmicbPtj1CQTuZERxApb8Pw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e239c97c-b759-415f-92d1-313d856820fe@citrix.com>
Date: Wed, 20 May 2026 17:47:28 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC v1 6/7] x86/svm: Use the emulator path for VMEXIT_HLT
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-7-ross.lagerwall@citrix.com>
 <1779210132.8631fc262581453bbf619ec5b2062170.19e41301cfd000f373@vates.tech>
 <d636c3f9-6faf-4fb0-8b72-617f70dc1ef9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d636c3f9-6faf-4fb0-8b72-617f70dc1ef9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0261.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: a4137573-d4e9-4e2e-55a8-08deb68f7cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|5023799004|3023799007|4143699003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TZiiRP0zvt7RhZn51jqNgubKgdqHofAYcCXVMuHxnocSESw3nCfvAY39ARBvYoY8eKIqalUs6/tYRFXyrLB02WzHzrYKXdYu5/6KrdF7y7/GzRdU/ifiZj8STtrSPweUwAP8Go8RGYl6JNPJ7mACvlhjHWmdGn8M29e0ja7cu1deTy9vagy/y8zUbnVX3tYWrlO+iLaLPHLGNfEZUp4lvS0HzPl5s8UtM7lfihgR36ELzVJGBkXjdQJZyXSKHYthMRM96zT3uTC5Tf8Dmr9P4J6T29r5+W7+G/HUXiOo5W/I2r2g+QU2rLeMUncZ3PJf6X2ljo5Ochecf0WSNBc9l2tUlkQzfDRbQlDHzolSHo731DcunqJ+6r+aREsLZlcnQuYKZg54sYEpyWEyCxzi7EKrDRYEzncMLahbM0aBALEuCx4Plp6REAGpaFuhHGBrLA63bJqvjVfDErem62LGrzQLnu3r6beqj6rorV4RFWi99KQtTlHcyIvqLU14mXECSC5gIa41xLp58WSSxiVd9vOIutUSkmaoEc4dDNGFvGdSShYWjgd97iZqubKgzLVuZbPGXgCE23M2M6n5Duv+bwcRFmcS42n3tk9kvplvwU1kxjniUVoKp73qOr7SC7mCiSlLsBRRjuBjSeySFfa5VSssAyEq2KklU4vNTlLjIVwdwtOYD4lftkWWK8ewCJqb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(5023799004)(3023799007)(4143699003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXJleDRJN01lVnkza3pZK2pkK3NYajRqUWJrdVYyV2pMRGdvZk1VSTBxYW8x?=
 =?utf-8?B?YmYxc0QzYVpqZ0FHK21CYXR3RGJoZTUvN1JiamNxSkVlYUlzNkNuSUo4bDFx?=
 =?utf-8?B?bmExWlg0T0ovY0p3VHJBZTJ3RzYrdXd1U0FxTWMzOHFsVTVyRndzdm5RQlgy?=
 =?utf-8?B?YU9IODVuOW9TYkcydVJRMnUraHB3eE5GS0NVQUlLWVNBQXBQVzV1S3VCQXR3?=
 =?utf-8?B?WDJMK2pYc3FDUW4zNXJWSmNTVUgwdFFvMjRYMUwrcXpBc0lNNmZoY0lkeEZy?=
 =?utf-8?B?RTB0OWh0WlFaSXV4eUhqdTVLVFJXRU5QcjQycFoxQUxlakxrVk9lV2F5STJm?=
 =?utf-8?B?T1hZS1NMRXlRNzBWQVBSNVpldXhFeGNIUWlCaVptZVUzSGczL3R0UURpQnpY?=
 =?utf-8?B?T0pRMUFiK0YwcnBkNjVxUGtSL0ZVQTBrRC9USFoyeVczVm51QWtSeEdlNjE1?=
 =?utf-8?B?b3FIKytrTlBiaDNaNmY2Lzl3Qzk2MUZ6SGkybkJ3UFhPcXcyaHcwN1Bwb09m?=
 =?utf-8?B?NUd4SDhtTkp2R2tkNVJBNXN6S0JWNGVjam16TXNjR0w4UEVRNFJUNisxKzJD?=
 =?utf-8?B?Q0JRUGJJV2ZIcmREc2RSdmxNZDVSNm5CUytnSGZtUHVDaktuYmFHVDR0M1dq?=
 =?utf-8?B?WTFaMmhDc1lvektyZk94Z2hPWjJhRW9sd2pnMklhQTZKTHBNSEJycXJ3blJZ?=
 =?utf-8?B?REwxYnAxcnE5U0dDYU5WOXJxTmZZdFFzSFk4Nmc2Z0pENjdDMmxPZm1MT1RF?=
 =?utf-8?B?cHNhR1dDeHd3NHM3KythZXQvTURIWVFXaDFhem1Bd001andsS2RyQWVJZGho?=
 =?utf-8?B?aHpqWTE2MXJhVjRGcTNBRjMrbjhXNWxaSW1GWlBNeVYvODM5eTViejVBQ29m?=
 =?utf-8?B?TzlXZ01uYk95ZHc2MXRwUXE3aG5FT3V5Wmxmcm54dC9FNFZkWFg2UStrWVpn?=
 =?utf-8?B?OGp1QlNwRmdZZGxjQlE3YWx2ZWFONCszM2t4TCt6ZUxHWElBNlU3Sm5TUjdm?=
 =?utf-8?B?cWcxUHpVNUtMaDhDck5od3RHcUdQMERIOWhBYWc3ZDgvRGFSM0xpdDhyalJ4?=
 =?utf-8?B?bHFjVGVFMXJMYVFUYml6b0l6bmZwODRsc3k1WGhBVDVnU1VPeVIyK3VSV2VJ?=
 =?utf-8?B?aDZxQ00wTlA3amxVMU5GZExkMkFLTnQwMkdRdFRKZjRRc3JaTkVmaVd5aENv?=
 =?utf-8?B?dHpRdmVuYVMzVmZsdjJlWWp6TXpEYkMwcVBSdVNBZ2FNNjJqUE96bVpYbmwz?=
 =?utf-8?B?SWs0S0U2M2R6UHJhUEIvanBRbDdzN3RVT1F0OGJXekJrVTJMdDhnWkR4YnVT?=
 =?utf-8?B?UEpEb2pBNG5jWHR0QnpoKzNiaGhpVWl3UFQvTHFPRkV5NFkrV3Y1WWZsYldB?=
 =?utf-8?B?MFFNenNSNENmSS8yeCtuR0FCV2dmODM1UDZEYkI1T1lJNldhNTNrdS9jQkxv?=
 =?utf-8?B?MHkzN2VRSVIrTndtUTVxWlZiVkZEZkdwMGZiZ1ZlTjBqd2psbCtWeElYRU1U?=
 =?utf-8?B?d0hCQ0pjdnNNejZzandHdUdnd3ZMTlZNd3RaOG41ZFg3Y1V0L245SlJUUDQx?=
 =?utf-8?B?ZU50NC9YUWZ3WnZFRERWRG0yRW5hSFQ4cm01dnhUeU1ZcE9PR3lsREpENWhW?=
 =?utf-8?B?MnVNV3pNamJLTWJLclFFRFJBRUlkMTB0VTByRjBPM1ZDZ1U3U3JDUTQwUlJ1?=
 =?utf-8?B?STJ0K0pZWkNSVGhGdkJCTTdjRGNiUUdYMW8veVA3anE3SjZBYThybE1GZXk4?=
 =?utf-8?B?YUg2c2tFUmcvc1ZRWU5FbDJtTTYwZkxUcTZSOTBZVWFuVU9Ja1MyTzl3Skl0?=
 =?utf-8?B?dFdLR2s5RlN4NFZTcU1xZzVVZVdOMEF1TEIrdEQydkxrSkQ2aVRCQndTaWpn?=
 =?utf-8?B?MGo2WTltWmZPN3NWYTVBZS85ckJIQ3pNb0E3ZStSSEVZMU5lSDVCVEduUkds?=
 =?utf-8?B?WitOMkIwU0svS2hJQWpSYnZHYUs1Z0ZvYnVrd2t1aDRVZlhsVTl6TzQ5L3dT?=
 =?utf-8?B?U0tVRTl3d01tMDg4dWRWNkxxa2lOTEJSVmM1OEVPSGtoN213UTBsTGFWMTJx?=
 =?utf-8?B?cHg0bHV2YWRBRkg0cHBGLzlCRGh3ZENQSUFOL0VObURnckNpZWFBRE1iTlJ3?=
 =?utf-8?B?aUJwa2w2KzBqTm5ob29POGpLekx0amJCUHdpRjlVd0hqWkU0cHRUZE9uS1pY?=
 =?utf-8?B?cWd0djl0Q3V4QVg0anhzQklUZVpCQkhMMkNEY1piNWp1VUg2a214MzlBRG1h?=
 =?utf-8?B?TTBDc05Ia1FueENKOVpvV2s5dnVnZnF6blYxRjYycUVXZzZIdTZvMUxrRTk2?=
 =?utf-8?B?OW10b2dQVVRkNjlQZjM5OWVlZWJwLzRJWnNJSmxTdnExOWQ4RkhZYlFmSnk0?=
 =?utf-8?Q?z2XAelGnaPkIblXI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4137573-d4e9-4e2e-55a8-08deb68f7cb7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:47:32.4010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNXxD5Eh5YUDqH1FxC3YYA1wdr3ZC6r3Yy/yh0xzAVJyhWKK3YhYjzVUSnhBxzHspatViL5daIw/bhX/snChCGM+4+Tom4zKgsn8fA2Z3Hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5140
X-purgate-ID: tlsNG-720697/1779295657-AA175161-76859602/0/0
X-purgate-type: clean
X-purgate-size: 2091
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 08D5859277A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/05/2026 7:28 am, Jan Beulich wrote:
> On 19.05.2026 19:02, Teddy Astie wrote:
>> Le 18/05/2026 à 15:14, Ross Lagerwall a écrit :
>>> @@ -2496,6 +2491,7 @@ void asmlinkage svm_vmexit_handler(void)
>>>       vintr_t intr;
>>>       bool vcpu_guestmode = false;
>>>       struct vlapic *vlapic = vcpu_vlapic(v);
>>> +    struct hvm_emulate_ctxt ctxt;
>>>   
>>>       regs->rax = vmcb->rax;
>>>       regs->rip = vmcb->rip;
>>> @@ -2840,7 +2836,9 @@ void asmlinkage svm_vmexit_handler(void)
>>>       }
>>>   
>>>       case VMEXIT_HLT:
>>> -        svm_vmexit_do_hlt(vmcb, regs);
>>> +        hvm_emulate_init_once(&ctxt, NULL, NULL, regs);
>>> +        ctxt.insn = INSTR_HLT;
>>> +        svm_emulate_one(&ctxt);
>>>           break;
>>
>> In this case, most of the logic is hidden behind svm_emulate_one(); 
>> however, SEV-ES changes some aspects of the VMEXIT_HLT behavior (this is 
>> the same for e.g VMEXIT_PAUSE).
>>
>> With SEV-ES, we can't access the CPU registers anymore but hlt can still 
>> be intercepted (it's a "Automatic Exit (AE)"), in this case, the CPU 
>> increases RIP itself (this is documented in SEV-ES section of the APM), 
>> and we just have to emulate the HLT behavior. How would that specific 
>> behavior fit in this new design ?
>>
>> We can skip increasing rip in this specific case, but it's now common code.
> I guess we may need to somehow reflect fault vs trap semantics in the
> context, for RIP updating to only occur in the former case.

Indeed.  There are APIC acceleration exits which have trap semantics
after the write into the APIC page has completed.

For these, we need to drive the LAPIC machinery, not move RIP, but still
deal with things like singlestep.

I'm not even sure what the correct behaviour for blocked-by-sti/movss
would be here but I suspect they can be set and would want dropping
too.  The point of these VMEXIT is to let the hypervisor take an action
that's still logically part of executing the instruction, and that
completes prior to the shadows dropping.

~Andrew

