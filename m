Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFMGFbT7eGlfuQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 18:53:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DC498AC1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 18:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215133.1525394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vknG5-0008Lk-3Q; Tue, 27 Jan 2026 17:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215133.1525394; Tue, 27 Jan 2026 17:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vknG5-0008JL-0j; Tue, 27 Jan 2026 17:53:45 +0000
Received: by outflank-mailman (input) for mailman id 1215133;
 Tue, 27 Jan 2026 17:53:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vknG3-0008JE-WA
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 17:53:43 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1daa6f61-fba9-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 18:53:41 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5696.namprd03.prod.outlook.com (2603:10b6:a03:2d6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 17:53:32 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 17:53:31 +0000
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
X-Inumbo-ID: 1daa6f61-fba9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAgeT2gPbo5CWx88uyA5LorjdNpsvwfsvbKgAuhULWkMtRHYO8/0rOoin9kBI1iTecleQTWzO6d5gz9AgH0HQpRW+3rr09ZwOfPBWp0Nkfg6LH7XIt1TzZzWE8pn1DCb0F8d9PUXffLX32CbsK+m4Sjfp3Dlp1pceM5q2gB7Idwzh5JMUkbMKztrPjuBh9UR1I5huTAwDabqteJy8qYMdyh+PT5KkrF2xfaMmeB8K3cEU0Vl77UgimTZ2jS5hds9lb8N+M1tAOQX6DGosuDK4cseSHHvgAoeD9K1dxrTp74JG2CDcI6CkVUrswMG5QXRkEIcGVBIWrex5TNs4mVn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYMHXhUJojfWOSbbn361uS305nfUnjv+zdcUOQdX3Uw=;
 b=br+fPNBe+3aSGcPXnAYUGh56f0+xK7/4BITEF6wezrDuMLMF09QJrUt+tOui/J+uxk0u+LXYjde9frgdbndPP3ODZUmnIAf4ig/F7/WDH8GSa8miNuMZeUO28Jac3ed4opFW93PF3XmY9d1fyiYpk4zGItnbdt6rRu+OKqudBwFcD+2D3PgGqHEG0e7J6dENvSljpSfWHoneIrCzPUd9BM4dBVj3E37PYnqd4j5dRmCbyyb86zoerw96g5fmsB1CPjX55McbDM2BgQLGxqzm/9xGx9/Nrl9YQxxvb1zAqV8ztdZVeMY87tbY8xbVT6BasOQYvA/yS/qVD85l8hqDPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYMHXhUJojfWOSbbn361uS305nfUnjv+zdcUOQdX3Uw=;
 b=SRrbC61pFYwnDYeT/lPsS9UG6YjQR94x/hNFJIEplxSASYoafYmeFBHAyfyBliH5JS66GyFRNZ1qTNgu9REnxEdEE1jMqwsvTaQ/Vp6ZmQBvGJp4D56ibDwpk3Yqsk/508q6dkkeP0ImZ5nnBhTRDM0r11KpFCoj/yrgbivPoWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1fd00308-f072-44f1-936b-8668f4e9ad05@citrix.com>
Date: Tue, 27 Jan 2026 17:53:26 +0000
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
 <3ded84f3-505e-40f1-b7d5-f136663af7cd@citrix.com>
 <52fe1a23-70bf-4282-a41a-7b153fd1f7c9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <52fe1a23-70bf-4282-a41a-7b153fd1f7c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f16856b-55f6-4237-6496-08de5dccfc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGZZRHZrOVkzekdWeGZ6TVQzK1gvb0dJOVY3ZE5yUFJPT2lEUFdKejZ2aWdn?=
 =?utf-8?B?eU1mazNEWHJoQzJxVXJWeXZORzJaWXdwZ25QUi9MZXpvODNTemlORG83djhs?=
 =?utf-8?B?c2RCMXJVK25taDcveGFmcVRnWDFkK1hROXM5bVBWSzdRZTN1Nzk2Zis2QnE0?=
 =?utf-8?B?S3dGaWVwSjFnTUpxWUgzMDlHeVU1OFpiOGlSVll2WVp0MjhTK0FGN0o3alhp?=
 =?utf-8?B?bks3ZDB3bmticXp4Z01TTlFKUXQ1OGZJK0VOdGlLYzh4T29VUjZod2FZeisw?=
 =?utf-8?B?M1E3ZkptamdHaDltNDRxNUhoQk9NUVowVlZ3cmJmMThrVEtxSHVGTUxCYTBB?=
 =?utf-8?B?SWZpUElLY1ZUY1owZTlWcm1rU1V6L3ExeVZVUlNwUXZzOGJFYll5TmkySThj?=
 =?utf-8?B?S1VlWXJhMmF6ZTZMWUdmcGlFdVhyMEsyQzZkc1lycnhycGpFbWdtdjRHMjRq?=
 =?utf-8?B?TU84UDJrOFlKRG5Wb3FuN1I4NzFJaUlod0c4aWJSclRHMndtUVBZVjFVS01y?=
 =?utf-8?B?ZTRkcmIrUWc0VEptcms2OU5oeHRCTW9xRDJ3K0N4aUl3bEhNZEJjaGxpcHdS?=
 =?utf-8?B?M1BXOTBaSWhXN096YVZjbkU1MytHNSt5NGQ3RG8rVDllMTVPTWhnM3NaRG1p?=
 =?utf-8?B?dGtEWEFtd0NSdUJyVDVwWVFGM0VkT1FadGs5VDlRQ3dkdXRUTlVFSGZtcjI0?=
 =?utf-8?B?YkVhZ0syUDIrRDA0aFdkTk5xRDlQVnBvN1pqeVFIOG9JSEtuUUFYb3ZQek1t?=
 =?utf-8?B?bUIwRHJlTDBDbmMxYXhWOHlJU2lnMEZVem0vOTVYSVhlWXdlSmN0SW9Uc2pB?=
 =?utf-8?B?SnFRQk80dUJJbWJlNmg1SnZjNmdPdlZwWnpPRFJVVUdNZXdHbEFINGd2aU04?=
 =?utf-8?B?eDZCMXhLMG5DY0hiY0xzNWVKV0RRdkxYMldxSklISzF6b3YrMTk4Qis5VHJv?=
 =?utf-8?B?Wk5YYkZKbzlIYWNONkk5UEczb1hRNmJ4dm1yWUpva0VYRm92TlRVYWVucWZu?=
 =?utf-8?B?SE5hYmJrQTdRS0JrYUlDV1Vrc3Ntai92VnA5QTg3TStrcXo4SFhibktvYVNj?=
 =?utf-8?B?NzZTc0dJK0lzNzlzZHJ2UUo3c3NJcVFsT1ZlWjVVanVCd2pweGFsRDdUbmU0?=
 =?utf-8?B?TjNKZ0poUXI0MmNjblpTcVVqMHAyaDdLVWpZcWhvNG5TNzlsTG9ac0pjb2hB?=
 =?utf-8?B?eGRFb3M2S0p2MXFKT0tISlBBZnI5bU5tL1ZmTENTSXBEZW82MlBoVElLREhX?=
 =?utf-8?B?S01Dc3ljMlZwVjdnamwrb3RWVEoxMDZLSVRBU0ZXVFgyN3dOdVhwZTdaTTg1?=
 =?utf-8?B?c2xqWHc4NnFnTldLQ29zcWJHVzhVTkw3UE52NVF2VFB3VXVlbEhEM3NFMEpw?=
 =?utf-8?B?NWcyYjB0Z0RsWllHYW5YWGIzekFkK0RHNXI2Y0xWbXpEVVIvTnhEVHhSTmp4?=
 =?utf-8?B?NXgvSjgraGd4cHlVUlJYbUkyR2k4L3UrUEd2ZDNWMjZ3MitDNjNXR1lSMFky?=
 =?utf-8?B?ZVljRmpieEFPQUpxdVloMnh1ajY4c2h0L3dTOUtjS0VoSjF0UjM2NFFPYUJk?=
 =?utf-8?B?WnBDWUc0Y3VlbGNhNHp4QkdHaTdJbC90V1FnM2MrT3loUldoMGZHd0ZGWFhm?=
 =?utf-8?B?QWd1aldlT2NRellCUCtpOUdFNm9BSFRlaHh5TzA4ejJiRWRvOVl2TXc1dDJL?=
 =?utf-8?B?L1lnNVEycGxMd0tsVVRsY2d5QWlyUVh3L21sY1gwYW5SaFY3Rkl3MUdUek9p?=
 =?utf-8?B?VkJGeDI4S1FsdHZucGlHeTFRNktSWmdRb25mNXluMWJOZlh2ME1tM2hONjV1?=
 =?utf-8?B?RTZ5SjkzM2crcmVFbVpmK3JiNkh4MnRDYjF5cU0zbndKTWR1a1JJZ0dzbFl2?=
 =?utf-8?B?OThCMm9rL1BVaGVtMmRUVmpOSkFOZW9YbmJtWEFFZGl1TkdacjVtOHBmNDBJ?=
 =?utf-8?B?UldQNEg2YzM5UjAxNndIVi9sWFBRUnM1QmVpT0RYUTdQUTl6MlYvZndGWU1r?=
 =?utf-8?B?TzJFSGFMY1QxajhkUDFyZVpmV1NxOXBXUXdyeXVaVllxVlZ5TWw2amVOZ2pz?=
 =?utf-8?B?Tm5xNVZtQXRpQWljZGFtSmpNcmc4WnZnZlRCTzR4cnhMR2sxRllxN0JCMlRD?=
 =?utf-8?Q?0SVM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlUzUUNQdElxbDVQUkxGT09RWEZqT0VSZXpCM1hibDhoVDRkSmU4M3BZVllX?=
 =?utf-8?B?T3RRVGlEb0VVVCs2aDVyNXVmbUxwajdoeUx2UEJVMzVMMGQ4dzYxU0x4ZnB4?=
 =?utf-8?B?MG9uRGpHcXhTOGNjcWVvME5JUVZCcDNaaHg0K0VUdkNuMlNCNWp4WWZldTlH?=
 =?utf-8?B?M2l2a1l5bmZPWnhMZDFndnF6Z2J5VEoweWZqWUR1S2NVVzBYY0V3dU5ucHlm?=
 =?utf-8?B?NDc3aHprR2pWYWNnckFTUjZMTTR3RDFDbjMvR2hDeUU5dGc0M2pMMXNhR2JL?=
 =?utf-8?B?TnJEZ0E3Z1FMTVAzNUxvL3p3VUJ1dWoxNS93ZmpOelVaSGVMZ0xvanp4cGVx?=
 =?utf-8?B?cmt3SWd6bXhEWC9QeU9Dc3dEQXhaQkxkN2dFUzBiTnpUUlFJM0tWUGZOa3Vk?=
 =?utf-8?B?aWVzMEZMU2piQ0NtNWRlVnFFZHp2dy94aHVxNUhCNGhZOEJoQXFKZFREVGtT?=
 =?utf-8?B?UEQ2TzcwdkI3UHNVMWFZV1pNbUl1YllqUHZvVTJKRmJaTWJuaDlwOExvZEZq?=
 =?utf-8?B?VmFBVzFEeEdNc3ptVlhDa2NMMW1nS1AzcXRiUHBVazdLS0UrbEFoV1BQbGt0?=
 =?utf-8?B?THRyN21BajRvanNHY0RiS2lWbGk5aHpWNHZqZVhwOVhEZHR3YVVzNW42UUk3?=
 =?utf-8?B?RlNKbnRZeDdIRXUvZUo5SXBKZVd2NWRvZFpnNFhleUIzSEtHTGllK1dSamZH?=
 =?utf-8?B?WDNUdmxwWVEwa0pCNUNpcUZldGhqbkZwbHh2ZUpDWVdtMml0bkZqcUo1SU4z?=
 =?utf-8?B?cTE1eVNtOUVWc3FoT2lpc2dvcFd2REdYSGgySUNxdXNJOTE5cUZnOEpvSHJO?=
 =?utf-8?B?a0NNYlI5MDhRYkNWL1ZxTDR1Qkt4dy84YU4wWHBmTUh2a2tBQVJLZXNiRE9i?=
 =?utf-8?B?d1BRS2NxNHZWRlg3YkRjYlJhc1prYXcvTXJGV1ZubFdTQWZnZlJ4YXJzbFJm?=
 =?utf-8?B?a0RXR0pNak5XRk5QUXVzQ2srZXBkUUVaYnpNaHpQQ3c5UmE4UG9wem1ISDhG?=
 =?utf-8?B?R1paNzR3dThuMWZXbjh6c1N5QU5zS2FuaHFhQS81T2RURlpzWURSQ2xPRkFt?=
 =?utf-8?B?aVFvenE2RDNla2p2akQyeU5qS093UlFucmtGUVVQb00xdmI4b2lUb2k5U0Fk?=
 =?utf-8?B?UG1zaTQ5OE5jRzVVUklLbm9GUFREcVdnV0ZGY2dDM1VFSXcvL1ovL0lCWmp6?=
 =?utf-8?B?VDI0TThZOGlRdkhBcDk1bmtNczhMRGg4ZGZHRXhYbk9FNzV4U1ZPR1BtZkRj?=
 =?utf-8?B?bi96QWl0MGU3a0VEQUxjM1ltNHhiWDRYRjJCejU2ZmJXMkRaazQ1Vmx0aU1Y?=
 =?utf-8?B?L1ZNTlplNlJuWXVIbTkrVlVFUDRYbTJXSXBGSWxlZ1ozMW1mNmlITzExc050?=
 =?utf-8?B?dDlLUk4rYndHQk1UZXpyY0NzUmhIcSthUnpsczJpRTFzNDZnUktwemRUQmVs?=
 =?utf-8?B?Ui9MMlJ2MFZWSWg4OU5rRUNsekUvVHQybTlncFZTeUhScGFpdDd1YWRvYVlI?=
 =?utf-8?B?aVB6dDF6VzdEMnNJT1Nka1ZKTDRHMkVnRkZkMVRvN3I3M2lEN2tNTlR4V2ZV?=
 =?utf-8?B?UTdrSzlLY3J0bmhWVjVHcENvakZmL2RzM2V1M2E5TG56cm9wR09tMk81OVk5?=
 =?utf-8?B?MlRQTGdSSDJ3OWV5VXdpTXorSS9FTjhFQ21ZV2ZzMkhGbzRVVVhDenV4Zksx?=
 =?utf-8?B?bjFlT1AwbVpMTUpZWUdSYUg3dGdkbWtDYzE2b3poUDgzR1YyekR3YlRFbGMx?=
 =?utf-8?B?d3BLMjhVN21wbDhvTDNpVDZ6QlJ2RnZVa3hLSUUxa2lUZzJwdStXNjkyVWw5?=
 =?utf-8?B?Vk5EN2ZXT0FZS2FFU2NqdXg5VDd6dHVQeFZaS2VHK09NNEdKMTIwZVU4Y3Ro?=
 =?utf-8?B?MkpaekNrbjNPY0ZMMzNXS1BzeU8ydVBXWk80c1ZtSStKSnZwNVIxbjIwRHdY?=
 =?utf-8?B?dUVLN2J5TDk4NGZiYU40Mm9Fd2dWcFF1UGd1YjFDUi9BQi9yeVhJODhLTlVK?=
 =?utf-8?B?U3NpWGRpTENqMjFKRXJrcXVhOVlSOHRWL090M1VudWQrbmxkaER5ZFd2cFN2?=
 =?utf-8?B?MjJpU1k0UDlIY01YYkVvc24xelU2aVBEN3pSTWdrNGJUVEFBU3hmeU1oeHVx?=
 =?utf-8?B?VWhBMDNXSHJaRjJUOXJTOHhYWlEvZkdGTGJSQXYzQUJzQjRuUGw3VDAyeC80?=
 =?utf-8?B?Tm9aMldheVp3UzVWelhXc041VSs3QWMzbDhsT1YwaEVkT0s3SGU4dGNrQ0dp?=
 =?utf-8?B?ZzJmam9xSHk2M1pqRWROOENTRzFJcGF3NVFmSUNkVUo5NXhseGgrRENQSkRO?=
 =?utf-8?B?NW9zcVRUWThrcjZtckUxYW9OTEhsZm5nSmtEV2x2Znkxd1NPS0xHdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f16856b-55f6-4237-6496-08de5dccfc0f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:53:31.7593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDStpKbU/TeJB7m8irhWBP4R9y//oMUfhkFaHS/VtCoDoDbVNhR45KahRr63VTjnjCzOTV+f30Dfa5dD8J3O5Hui4fS8I6G2ltkwc6HB+os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5696
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
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
X-Rspamd-Queue-Id: B6DC498AC1
X-Rspamd-Action: no action

On 27/01/2026 11:35 am, Jan Beulich wrote:
> On 27.01.2026 12:08, Andrew Cooper wrote:
>> On 27/01/2026 10:37 am, Jan Beulich wrote:
>>> On 26.01.2026 18:53, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/cpu/common.c
>>>> +++ b/xen/arch/x86/cpu/common.c
>>>> @@ -319,8 +319,6 @@ void __init early_cpu_init(bool verbose)
>>>>  	uint64_t val;
>>>>  	u32 eax, ebx, ecx, edx;
>>>>  
>>>> -	c->x86_cache_alignment = 32;
>>>> -
>>>>  	/* Get vendor name */
>>>>  	cpuid(0x00000000, &c->cpuid_level, &ebx, &ecx, &edx);
>>>>  	*(u32 *)&c->x86_vendor_id[0] = ebx;
>>>> @@ -352,6 +350,7 @@ void __init early_cpu_init(bool verbose)
>>>>  	if (edx & cpufeat_mask(X86_FEATURE_CLFLUSH)) {
>>>>  		unsigned int size = ((ebx >> 8) & 0xff) * 8;
>>>>  
>>>> +		c->x86_clflush_size = size;
>>>>  		c->x86_cache_alignment = size;
>>> With this change, can't the writing of the field in generic_identify()
>>> go away? CPU_DATA_INIT() in particular doesn't invalidate it.
>> No, it can't.  The value needs setting up on every AP, right now at least.
> Are you sure? APs inherit part of the BSP's data (initialize_cpu_data()),
> and reset_cpuinfo() doesn't clear ->x86_clflush_size afaics.

Every time I look at that, it gets more insane.

For every CPU, initialize_cpu_data() clobbers boot_cpu_data, *then*
copies the result into cpu_data[] array.

This cannot possibly be correct.  Why on earth did I ack it?

>>> Tangentially, "cpuid=no-clflush" didn't have any effect on any of this so
>>> far, and also isn't going to have with the changes you make.
>> The line immediately out of context above will applies the clear cap
>> mask, so will cause cpuid=no-clflush to take effect.
> This concerns me. With your change, "cpuid=no-clflush" will lead to an
> unconditional panic() then.

So will no-cmpxchg8b.  The only reason no-lm won't is because that's
evaluated before parsing the cmdline.

> Whereas previously, with cleared_caps[] being
> applied by identify_cpu() only after generic_identify() has already
> evaluated the CLFLUSH bit, there was no effect at all.

That wasn't no effect.  The effect (upon request of an impossible thing)
would be that part of Xen would have ignored the request and functioned,
but another part of Xen would have propagated that to guests, which will
probably have equally rude things to say.

> I don't think this panic()ing is desirable, but as an absolute minimum this
> (drastic) change in behavior would want calling out in the description.
>
> Further, if the panic() was to stay, there's no point having cpu_has_clflush
> evaluate to anything other than constant true anymore.

I'm not overly interested in users complaining about a panic() if they
ask for an impossible thing.  Better that than the prior behaviour we had.

Talking of other impossible things, cpuid=no-$foo does nothing for
FPU/DE/PSE/PGE or MMX which are the features hard wired to 1 already,
and with 0 users in the tree.

Again, Xen will assume the safe thing, but pass the impossible request
on to guests.


> Again tangentially (and partly the reason why I overlooked that aspect
> originally): While early_cpu_init() respects cleared_caps[] for leaf 1, it
> doesn't for any of leaf 7's subleaves, nor for ARCH_CAPS.

No idea.  I stopped doing archaeology on all the wrong-looking things I
found, because there are just too many of them.

~Andrew

