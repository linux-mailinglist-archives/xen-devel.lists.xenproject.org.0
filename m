Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNdAMbaceGlurQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 12:08:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A039360D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 12:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214258.1524634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgvr-0005WD-7N; Tue, 27 Jan 2026 11:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214258.1524634; Tue, 27 Jan 2026 11:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgvr-0005TT-4i; Tue, 27 Jan 2026 11:08:27 +0000
Received: by outflank-mailman (input) for mailman id 1214258;
 Tue, 27 Jan 2026 11:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkgvq-0005TI-IU
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 11:08:26 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f09cbb1-fb70-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 12:08:24 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB8176.namprd03.prod.outlook.com (2603:10b6:8:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 11:08:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 11:08:21 +0000
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
X-Inumbo-ID: 7f09cbb1-fb70-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnzBIH2w8SyNqEVFhAx3Bzq9FD3kjA5O+10g1y7X1Vg0f2qB5J5lgkX0KaHGxdrW5dtKq7rME7D5SgPHAygL+QNz2AK/LI/dt33sUFBYUWiXvjU7z64NVs3iWNbmspX7JvWaQ3L5t9kUwlVmj1+XKMfRv4AMHiRSL27S1j00YvdtxvTI2vE/VNiCBLj3VxfW/fe2NJh1Pmc7t8Baot3MLub/tDR6xY+Pl9ku0CYP3e5KHdvTBv319VkCyppadXkXDLgaE6UzqJkpu19VjzQQjDIRDKbTLkiT6XxbJZ1f2mePOxihcgR62gRYROe2TSbFXDU3jPQDnkzeWJRmlmiDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zojH4Bsz+1Ec+v1l9BvN7ZFAPPUaYAhgqTdW0Rkk0Gs=;
 b=K3XVjGvnq9D3Tkm41zMWJUwKxyEMPxsk/m7k+obVMAd04rnih9SG3pHcbrnuQbzvXG4zF8Ag1SeInfqOAsRgLnhgV7NjAaoy9HSS6Mf2RFF4rh0Hql5ECTby1rATBMleD1+0WokQwVLVjh2zLyK7yTlHqZ8renrkl4cloSvmoOKxiRPJKu8Aysh9im5GVCqR1cdpPXmmtZ9Wz5npVj2F6J4rLCUGeWP0a/gg6h6sgajGXPS3PHodwbaZznFWzsbLJmzKxidKmtmWWzvRjlTCb2uk3U5Hrh09JOOeQga9XzR7cb5RbqLBfi2F+nQntC/b0Zzzv3oD5phtAMDUT94SXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zojH4Bsz+1Ec+v1l9BvN7ZFAPPUaYAhgqTdW0Rkk0Gs=;
 b=0BJvWyntJIc5SwZy3kZzhmvGZA6lugRJPxP2FVN3GAargR5ut5cCbbeTfA3GmSjsAfMrYAM+xCEJRPB6g6QnerNQeKgmuGlSxt5KXHyH89TYmYscpPG8qQ2cx3aYaIsCWrgeq2+kBA3jzk5xcC1lsMM9kNs+Oexl4PFsCn59eRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3ded84f3-505e-40f1-b7d5-f136663af7cd@citrix.com>
Date: Tue, 27 Jan 2026 11:08:17 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 01/16] x86/cpu: Fix boot time cache flushing
To: Jan Beulich <jbeulich@suse.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-2-andrew.cooper3@citrix.com>
 <15978c88-5ea9-4159-951b-27c9fc004756@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <15978c88-5ea9-4159-951b-27c9fc004756@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0210.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b67c43a-31df-4885-5368-08de5d94618b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXBBRmIvUWh4OUgzZllNMkdXMWh0WC9TRzNLRjR6NVRjT2gyem1rM0FXL0JV?=
 =?utf-8?B?SUpKVEJjMHRQNEpHcHBseWJrOUZNYlBhVDBnNUhzYzM3cFFEeFpjU1ZHbzVX?=
 =?utf-8?B?L3VsQVdpck9vNDV3OFVEcHJNMzBzanpqYk1SYWRyaWpBem5MbmNjT0VKY2hI?=
 =?utf-8?B?aUc3c21iazFXbzVjcHhBblJQL3cyMjQrTWNOcHdvWkpKREtFWEtwelFkT25F?=
 =?utf-8?B?Vm5XZHJDVlZ2L3JKMVQwZTduandkUmxtbkxOWGMwRVFESi9IcHZVa0pRT0VD?=
 =?utf-8?B?SzVQUkJzaFFRaEMyTlZWdDVRdUJ5QXhkNllMc0MwSklwMktWVDNDc1Uzckxa?=
 =?utf-8?B?RGFLUjBGQVgyWEZHQ3dLdlZ4Q0pZY3EwaUcyS1p3UW1lTHBwSXcrcTNHYnU0?=
 =?utf-8?B?bExROFE1NzZiNjM3UFEydUswU1pBQUhud3hxMktBU0d5UXBtcEVmM1g4SkM4?=
 =?utf-8?B?cEE2Q3dCb2E1R01pYlZORG40WTRmbGc3SThOcWVDT0Y0ODhQMWwwSzBGU1Uw?=
 =?utf-8?B?Q0x4TE1KSWZBRXIrSG5NU2s2TTJyVHF3UFlRRHkzTXc5d0RUckpleklvamY0?=
 =?utf-8?B?VllGdnJnY21XYjFrWm9lSHByclJtYkVUamJGL0sveFk0Um1IZ2VKOFFzY0do?=
 =?utf-8?B?b0FXTkVwa2NEYnp0dDU3c01RaThPMm9hUnpkc0Z6NnJFaEkrK2VmWU1uOFR5?=
 =?utf-8?B?UDZLN2xQdzFxMmtVUkNJRHdIb1hEY05NVU1PM2xvSm9nc1dOZWFjNWNiU1g2?=
 =?utf-8?B?Ry9CK21OWHRSRFdiUmNFdW8wTDFkSUZvQXgrQU9HbU9HbzgyRUJFQkJxamhv?=
 =?utf-8?B?Y1NwMnhiM0Q3czFOVUdLb1J6bjZBL1ZoS2QwY2phZVJycjh5czk0Mlh4dUJO?=
 =?utf-8?B?RlNNa3hjMU5obUZjOEw1NUc0cGZ4d0ZGMTl5a0pjeWFjeDAwRkVLMXphK28v?=
 =?utf-8?B?UkJydlMwNktsYm9RUEI0dnMweVV2dHNidkZOcmhTdzNBc3MveU5rbkYrdmgv?=
 =?utf-8?B?c1QyY0tuUXlFQ3orYTRRcjB2akJqTTVlaW9vV05zNnZ1dlZGVzNIdkdHcWx1?=
 =?utf-8?B?R3ZoOGRJZGhidDg1MEl0R0pDK1Uza3RTdTNTQlQxVlM2SVJ6M0dWdWZ3a1lB?=
 =?utf-8?B?K1NuTk5WSGo5OHo0dHBoTUprcDF2aFBEUDd3TjlwSklRdzhGdSs0WFM0RUlQ?=
 =?utf-8?B?VUFzc3M2eFUyaW01Y0Zycll3dEdpRThkMGhHT0hqNVc0ckZLaGkvM01kS1Fh?=
 =?utf-8?B?TldHTjdFMFh6cTkvVENLSzBLWktLUldkcjlwakRkbllQbStobDdXYjlvdWFp?=
 =?utf-8?B?SkhEd0p4TC9FM2hWOGt5VnVSVHJlS0txQkppWG0rOUJqOS9NNDgwTnpRQm9D?=
 =?utf-8?B?YnZxZG5FZm8weVFMdzRreStyMzVxdjhWVjVlMWVpTFpEc2hhcUVkS3loZWp0?=
 =?utf-8?B?QUhNUzNJUWVYeElRcDdvYnJEL1UrY29hZzFIeUVrd3MrdkNRQUpYNml4NUdi?=
 =?utf-8?B?YTJCNlEvMDhFRTdtbm50WHBqUENrNTZocWs2TmVmK1hEVWRiZkpjNEJGMVgy?=
 =?utf-8?B?Q2dHMEVHWUI2ZGpxVU14ZmZ4QlEzaThzckpTcWR4VTBkSEtlTFBsZmhZY2x1?=
 =?utf-8?B?WmNtNys3cnBzNGg1STl6bUNoYzRlQmhYdTVaL0pZbDBMazdJTUxwb0Ewdmhk?=
 =?utf-8?B?TVgxYndjMnZ4TE1ETGIzWUNPVTIybGVVRmF4cm1VY0NlL3hRaU0rM2JSbVQy?=
 =?utf-8?B?Sk1MNDFoUjRMZTVKdmp2VXBaMjNtMzJhNGJNamNUTS8wbTBPN3h4eXVBV1A4?=
 =?utf-8?B?Mkg5TDRhM0UzUkxrbnVCRUxRRHIvT0liN25WckZqMlJGK3Y0K3R5SXBjRWNC?=
 =?utf-8?B?SXZFOTg3Vm1iQ0cyN1FpTXcrL1Bja2toZFVHaXR2Z3AyWmlVdlVxTmk4SjUz?=
 =?utf-8?B?N2k3QVYxcjdLTnBkL1NjbWZMamZxa0JtZW5VWm5TdmppUDZoa1ZoVk9OTlBE?=
 =?utf-8?B?YnlIRHZ4TzBRanc5M01KWXhIaHBhVHpVN1ZDQWpmMjBtQXMvU3UvWEJiVUd0?=
 =?utf-8?B?WmgrWkRyaEFhZHcxejQveHpKemRaa2RDU292b0lpc1RGSTVtMnNCeG8xbTNK?=
 =?utf-8?Q?tl7g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDZrQkhHNXI0Nmt4RkxuYnRJZmdhTEQ3dGoxM0lWTUlLMjJBQ1g4c281TFpo?=
 =?utf-8?B?am5DTEZDYy8vWEFQbGk2TVl1dzFSa2J5T3NKTzdDZ1Y0YnViV0tjamY4MHN3?=
 =?utf-8?B?dkZhVDlyTHMrYTJWZUtZR2tXTEM4bC9yOWtYWU1JeVhkQkVjUkFTWXZmdnQy?=
 =?utf-8?B?TTFjNWczQVRpcWw3akNnK0VWUVkwMVRLUVdxZm95dnNPalNCUU9YNW1keWNU?=
 =?utf-8?B?MnB1V0RDK2NlZ3ovZnRkQUNXN0RKNDAvWEJzbnFZcWdNU0t0ajJJWEkvS3B1?=
 =?utf-8?B?VXFUS1VoNXB2UmNwTmZSSUdLVlhWVkRLajVWWityZU9mSzRuVEl2b0ExU2lR?=
 =?utf-8?B?dmp2SEw2Mm5QUzVyRjdqM1h4ZUVWS1JQNUdLbyttcnd0RDlCemFwemhjNEEy?=
 =?utf-8?B?OFE1ZjNIMFNlTkZOZ29Cc01TN0RpcjRoNHpMMmdhMVJXanBUM1BzZGphS1JU?=
 =?utf-8?B?M1FpcUZkR2V0aW5uMENTNmFYSzBPSXV3WlJsRTRrUzFWWVFLdzFIRG9YWlpP?=
 =?utf-8?B?SEJvbHNyRVJZV2ZIWmRYeitaTlpFaWE1aFFNTVR1QTJVcmZFeVJmeUpxUUhB?=
 =?utf-8?B?UXBkY1JXcFFKK1VzS2VBL0hDVEZLUUQ0YjZ3bjFIdGhPZnZiS2FrWFNCQnp2?=
 =?utf-8?B?VmllSXk0NytnaXVNTHhvWGtpUjFHVTlsbnZlNFUzLzA5Nkk4aEdyZ0pCYVA0?=
 =?utf-8?B?ZkZLV1RJSW15K2xaYVQrU0E4ZXVGZzRyQllYakthaGdzZnFwYzllaG1OUU10?=
 =?utf-8?B?ZlRLcUgycllpSno5bXU3MFF5MSt2dkk3K3pDUXZNVEdNYnpnb3RUNWI0NWpt?=
 =?utf-8?B?ZjBUc3ZjOXB1bk84c21acktGc3dFdVQxeENqZWxRWkNpSjBFbjRGdzJwZWhX?=
 =?utf-8?B?NjQ2ZHQ3dVdGdXIzMmFES3M2TDE1elpGYWlPTlh0TnlCWTl1cGR1M21ybEJS?=
 =?utf-8?B?NkNsNEdrL0d6dGVnV0hjM3NRVFZtUkE1Uk9DYlZqekltek5ESW9seWw4cjVa?=
 =?utf-8?B?OWh3WmczSmdMMTcxSU9IR3ZnR3ZtNUhpT29nY3EvN3laVzFYWHA4R1FMQ0dJ?=
 =?utf-8?B?THlJQ0luR29qdHowUGlFUjBBUXp6WDZCNFNnMFJLWnh5SmZOQjJ6ZFZoN090?=
 =?utf-8?B?dHF1SitaM1EyQks4c0tDZ0g4MG9VRkJZUnEvTXRxcHpwUUY0aXZSNUpVSkFS?=
 =?utf-8?B?TGNCVkU1OHJBK2lWOHhJN2EveEs0T0d1WHZ4dEJoSVdCUzVXTUlrZjlpRmw4?=
 =?utf-8?B?ci9FMzR1MzJGVE53T1QwOEVPcGVJeEp2cW5NVjNFcjdCa2c4NGh1MmxYaFU2?=
 =?utf-8?B?ZUJzbGNVcGFoMHAxMjhtcDNhamNFbk1NMVh2OHNwQWhNZmVJaHNiZVpjSjZL?=
 =?utf-8?B?TElrQ1NCbzBBRWZnbnVUeHdUcmxFZzk5V1ZWbjFYdGdaM1BJM0VLUVBlSFpT?=
 =?utf-8?B?Wko5Q0NyMDh5dzRRR29iektyL2kxNUJ0NlR4ak5QUHZrNnpnRzJxelNvMUlT?=
 =?utf-8?B?S2p4WXkyVmR5ZjRoRytRaUUzeURxZkZTYy9vWXRRckJBNndyQ2NsVkw4UDll?=
 =?utf-8?B?K0Q1SVd6emN0U1JVNHFSSmxVZTVIZ25rbDBOd0M2T3VPeW03cDBRc2s5SHhF?=
 =?utf-8?B?VTF5NVkxczFFOHFLbUVlYTQxdDdMSHc4VjRYTkkycVN4dHVjRFNYWjVhRGFj?=
 =?utf-8?B?VzduSEd5UG9TK0Q5c2FuS1lsTjRhYXdrcmVaRENwM0U2b1VrMGpsSEpKTCt3?=
 =?utf-8?B?ZWgxYzBHNi9UQnluVGJvRDJaNHA5OEpTeDZyT3BhWmJua1J2SnNMekFFUnJM?=
 =?utf-8?B?ak9PdjRtU2ZZaFNma0dSRG9hSlFJRmFCcVArWWI0KzFpU3ZBUkFYajF1N1Fj?=
 =?utf-8?B?THZrdEY0RGM0TDFRNlRoUkFWdFR0Z214YVhyN2N2VHUwdkxndnN6RTh5UElz?=
 =?utf-8?B?T0pCMXI3d0J3bGFkaFg2alJIMG9ZamR4b0FMU1lSTkVzNzBXWGhtZk85ak9C?=
 =?utf-8?B?NGZMYXRSNE9pb2szRFZwS05wSCtLSlp2NEc1WGZQQmxqaHVOQVhJWE1XZG1T?=
 =?utf-8?B?QXgwT0ZPQU5CdFJ0MW1IU0syRURMcUlVQ25pWENFS2wzTHJqbVE3dTdEa1Nn?=
 =?utf-8?B?MFNtZnRJVnFacW5uYzRpZVJBNC9raVQxbGM2OTlybWJyeWFhRUtDVmNiWTl1?=
 =?utf-8?B?c3Jhck9NU0lscmhFSVdXemVqTC9FVkkxVUQ3YzN2QTJIQlhnVkxNZG81dlVl?=
 =?utf-8?B?NWdJelhpbzVXQU55c1ZTdlVGQ1BvSGlnYysrM2I5VXlXbFVFSUtocUpmZkIv?=
 =?utf-8?B?WTNocXV4QjhIbGJjTnFHVURtaWtJR25LWS80OEtrY0swSmxLUGFnZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b67c43a-31df-4885-5368-08de5d94618b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 11:08:21.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6jf5fHJuXK1/YlF06NJ7c8QkqwzUmF9Z3U49jaR8JrQmw9d30SRz4rSIsA0vrFGqGjfaPYq3G/U5Tmvw/8/CCBW32iCq0gSceJUrIQbZoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8176
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 33A039360D
X-Rspamd-Action: no action

On 27/01/2026 10:37 am, Jan Beulich wrote:
> On 26.01.2026 18:53, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -319,8 +319,6 @@ void __init early_cpu_init(bool verbose)
>>  	uint64_t val;
>>  	u32 eax, ebx, ecx, edx;
>>  
>> -	c->x86_cache_alignment = 32;
>> -
>>  	/* Get vendor name */
>>  	cpuid(0x00000000, &c->cpuid_level, &ebx, &ecx, &edx);
>>  	*(u32 *)&c->x86_vendor_id[0] = ebx;
>> @@ -352,6 +350,7 @@ void __init early_cpu_init(bool verbose)
>>  	if (edx & cpufeat_mask(X86_FEATURE_CLFLUSH)) {
>>  		unsigned int size = ((ebx >> 8) & 0xff) * 8;
>>  
>> +		c->x86_clflush_size = size;
>>  		c->x86_cache_alignment = size;
> With this change, can't the writing of the field in generic_identify()
> go away? CPU_DATA_INIT() in particular doesn't invalidate it.

No, it can't.  The value needs setting up on every AP, right now at least.

>  Perferably
> with that dropped (unless of course there is a reason not to):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Hopefully this is a good enough reason.  I know we agreed to make it a
single global, but that's future work.

>
> Tangentially, "cpuid=no-clflush" didn't have any effect on any of this so
> far, and also isn't going to have with the changes you make.

The line immediately out of context above will applies the clear cap
mask, so will cause cpuid=no-clflush to take effect.

~Andrew

