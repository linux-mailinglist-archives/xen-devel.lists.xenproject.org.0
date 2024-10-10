Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1AC998064
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 10:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815822.1230033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syom2-0000V5-Eu; Thu, 10 Oct 2024 08:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815822.1230033; Thu, 10 Oct 2024 08:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syom2-0000Sm-As; Thu, 10 Oct 2024 08:43:54 +0000
Received: by outflank-mailman (input) for mailman id 815822;
 Thu, 10 Oct 2024 08:43:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1fZv=RG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1syom0-0000Se-Kz
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 08:43:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2415::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4fa820b-86e3-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 10:43:50 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB9196.namprd12.prod.outlook.com (2603:10b6:610:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 08:43:47 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 08:43:46 +0000
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
X-Inumbo-ID: c4fa820b-86e3-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCXyiAiJOTJkSw00irUA7xr1Q2E1hYTaPUKhRCUrUT26kGhnhrdog6Gtki/mfLujsGn6RTMrDk9+wK5XwQA8DNQ9y3B5l49WXFvGdgLqJzlB5TvoG+9Ri1Ot3vLGs2lEu9+/F9bDCJ3Xp6bWjusBUbJI9KZj5nPpGAxMioCMQW9fUfNcRKAd5FCFemW+ffwhPMV9U/tqTd6jwRtF60TKcK0fCehaQu2kZu9ptBRYfwFBXuhT9gVznOs+qslYoiqXZX0eIAxvCWQKzEuL3Gn3EfhNwaoFFgGziKyIo9sbMZ/4EUZV1t0LA0eIiXzdR4R/lFyAGR6QPE0JzqPVekWR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3TyFzA4vek/Sq2Sr8mqC4fgkdm4N7jg0JpPZ0YM1/0=;
 b=Dseh6fQAJBs6+bFfvQYeKePd1vKVYl1kkymCIVDh15alm9hJpA4yrT2FmD8S37pKSJLxCe9GbWrU1mQ6TRabUc3d7vgSWeHRtk6p/ukGGkPx3TrBshVFRX2zigNAWN5cFAFy8l4RwcCb1swOSpc+bfBMTRcrxZ6BKQXuTlh+tpIX3z9sW3Y/t+YEgJ/qVKhLg0ooQNEfEG6N/rChA7HyZc/G5n1SRo/0/V3l3n6xkk2X7ckjAu3P6aXwQnacujk9Nc+22VbUC10po+3P1rB6kX/MdNtDgBFZb9y82G8voDtrQSfIG7pKqNjvP9gmM7ddn+4aFroWIWooglSVAhNIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3TyFzA4vek/Sq2Sr8mqC4fgkdm4N7jg0JpPZ0YM1/0=;
 b=LAGdLAfCueMfl9Linqx2tez1oyfXP4e4QKLLj4rxApGAfl5JdVPM5EY8NruRXekU+geVudUeVXg3Od9ePWZ+8tN+fI8+UETCNAs3uC0xsGWwz7YT+53FxvQN9JQMOFitLOsMo4VsS4eW0csvtMjMNm5kiIKzLpheuGoXgbskwNY=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2] xen: Remove dependency between pciback and privcmd
Thread-Topic: [PATCH v2] xen: Remove dependency between pciback and privcmd
Thread-Index: AQHbGupfp7VkZjmg5kywfP9O2WdcyLJ/qfUAgACG1AA=
Date: Thu, 10 Oct 2024 08:43:46 +0000
Message-ID:
 <BL1PR12MB58490A1ED940EFFF12A4FB38E7782@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
 <e7b98fbf-ee28-4083-a4c5-7dc122252e07@suse.com>
In-Reply-To: <e7b98fbf-ee28-4083-a4c5-7dc122252e07@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8026.020)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB9196:EE_
x-ms-office365-filtering-correlation-id: ab26be76-af25-4ac9-dee4-08dce907a7d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QkdQNkdoaHVNdkFXWGFwRG5aUVlRbGZGTFlpeXJiNnFGc3RiSDFxTW0zbFYz?=
 =?utf-8?B?UVI2T0tPamQxd2dJaUNpNjk1WTduckd4WnFsN3RJcVJ1ams4VkQ5WnUzSWxZ?=
 =?utf-8?B?WkFzTDdEOEN3ZDkza2E1a1VzNjd2eTRyUC9IemdvU0VlVThCWkdaRXBFL1Y5?=
 =?utf-8?B?MEdKZkZJWFVRZFA2SFNHdjJRT1duR0IrdHNyNy9tTDNnVFhpSHNCV1dLWUMr?=
 =?utf-8?B?NGFhL2orQndZRUkvS1Arb1RBNWVaZnlYbUJ4V0NOdE9lM0N1YlZMN25DYlc4?=
 =?utf-8?B?WVhRRW5GWjM4TnlHZ0xoZ0IyMXErZUExT3k0MFJQNFFZOHV4U3FWeDZNWERj?=
 =?utf-8?B?K245aVJEbG9vWDJXZ0tqZGlVa1RpMjlqZGhVQ2xYV0tvMUtBVEhGamh4QjVC?=
 =?utf-8?B?TjhxWVFucWpWUjRrTzFEaWVDUGk1ZkV1Q1N3VWNKM2xaVXREWHJlZHhJMWc4?=
 =?utf-8?B?ZlMwL0xHWXJGTXRJUzdMRkNzNW5xNU9xNG80SWpnRHZGdXU2VFBOT21kTVRq?=
 =?utf-8?B?Wk4rM0RxQ2Qydklzb2FiQWV5THUxQmQ3UFk4R0hnZElQOGk1M1Y5M25BMEFy?=
 =?utf-8?B?dXdNS2dHalZKbmZGQjg5YnZEd2YzSzZXOWJYU0VxTGFPSThoWDNrbE8xK1c4?=
 =?utf-8?B?UkFpV2xRVmZtRjVSSTdVWDF4czhtYUg5MmVvS2x3MXdyN3llRFd0Y3AzME9P?=
 =?utf-8?B?ZjJHZVo0Rm9JZUZOZU8zSWViclZEb1hFd3hOL3c1cjBZWE56UnpqTGlhaFp1?=
 =?utf-8?B?d3I0RGhwR1VmVHJCWHVRS0g3Z0NuZ3VsTEJ2U3NvR0pzY3ZmbUc4Y2lJRldU?=
 =?utf-8?B?MmM2L0htdmFqQ1hjQ2tIc0FMZUVpQVBNSW9rK3NTQnhDMzZJdDJkY1lqRExJ?=
 =?utf-8?B?NS9pUUxUdndJbDBDTFQyVGYvQW9aYjNvdm11eXB4Zm1YREl5cUVmcWkxRkxC?=
 =?utf-8?B?alkzY25YQXU4azBUNnU4SGRTY2tOUUJJRDZrU0xzRzJmQjFJVjJ5YVlUVEJn?=
 =?utf-8?B?TUJrc3VOYWU5d3VwNXJnakpDb2lRN3NnYTV4dTFOVWEwclFSVEQ5cTVlNXRk?=
 =?utf-8?B?MGJZQzFjU1VFUHd4Z1pOOWpOZVdtTEY5cy8vNFZORnpnQ2kwdE0yM3JLYkhZ?=
 =?utf-8?B?MEJqZi9TTCtDUklaSGRwZWhLRFdkSG1lMVV2Q3BmdTQ4N3JtN05lNnRuSGhW?=
 =?utf-8?B?MUY1S0IvL0cwUEdtR3drRWszM2doTENFd3BGRE1LbDk2TXF0YmNDbnp1UzJz?=
 =?utf-8?B?TjBCVmRURk84VkJwSE1raWdOclNCdDJRTXBiZDk4TkFlUTkyRlEwMjdkdFdh?=
 =?utf-8?B?U1VTNGhZdk02emZYVFFvdHAvKzM0Kzl3VFdveUFBMWhJZ2pSTHRTbWhnWW95?=
 =?utf-8?B?aUFYTlVMaFVGZ0szM2g5Mmo5azJQdFNXL3hEMTg0NmxhdCswNVoyaUtTeWVR?=
 =?utf-8?B?SmZaZ1dOQkNIVmtiOGZkVE1lcEtCaUxURjVYemswak9LU09BK2dDZFR5K1di?=
 =?utf-8?B?dWpjcW02ZEVzczc3N2pYSUV2R3E3WklOeXFlWUFJUndhY2w1L3VRZnN6cWFs?=
 =?utf-8?B?QmwvZ0xhN0lPOGEvanJuVnFyaUM5RndsNTVBcUUvUUdRd2lKTTVwUGMvaHBp?=
 =?utf-8?B?eFBhUzcwK3E0eHkrc3Iwc0UxKzFyeWRMYUV2ZDlmQXBndDcwKzFMUjM2WG1q?=
 =?utf-8?B?YnVCejZoVjZ3RjVVUmdDVTByVGR0TkZsWXhqSDJ6Q2xBSjdvU1FQTkY5YytF?=
 =?utf-8?B?ZzRIdXRjOTFvRU9CWVI1UnNVdGR2V0x1VEN0eEFYUWxEZnA1Y1doREtnYVNC?=
 =?utf-8?B?OEo5aUxWZ3RvNnZ6N1E0UT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1VrbnBMZmxwZ0VuL2VPMzdjaWRKY2pkUGhacWpDdWwwUXk5ZUhiVWtYN2ZZ?=
 =?utf-8?B?U3hBcVgwYzNZWlBIRytkT21JNFlzRFZ0eTBqVSsvZC9Qb3pHdjM4K3duTGVU?=
 =?utf-8?B?QUliUm9nRGFsaTFlckFGdEZqNmlSVnlqdzYwZ0NBOEVxdzNPcXhKZk5HKzZh?=
 =?utf-8?B?QWZsOElqck1ib2dCSjIyTFh1Vm1yYlE0WDBJK0JINVRjUWR1b0h6T1BYenZC?=
 =?utf-8?B?SzFEb2FUL2xlem1iaDR0L0xqeDVQOVJBZmNGaS94dkVBaU9lRnZXa1FnUjBz?=
 =?utf-8?B?TWZMYy9DTEY1NTk0a1JhQjBYQmQ1SUJ2dTlrS2dPRDdwVGJJcnZuSm9PVzNh?=
 =?utf-8?B?ZWdkNS9ad3A2NGovS0toWlcyOXY0M3ZpM2tuRkhLbE1lMzRmWmJDWEZEa2Q3?=
 =?utf-8?B?cFJOaDltNU1mR0twQlE1a2VYZ2Jua1dLeUdTV1ArN3ZvUWZDVnpjSWlYU0tp?=
 =?utf-8?B?U0VDRXd4WmdiVHdoRlZwNmdlaUo4VFRCUTdvUlBtKzVtNDVsNUt2amYzZ3Iy?=
 =?utf-8?B?YVFZSUNtQjVjNlVMUHVWbU16c3lrb3grSmdmYXBWUGV2NDFTR0RkMzdwT1JE?=
 =?utf-8?B?ZDRKcmJ0MDRnWERNbjZST0hkODg5Y1ZPUCs5ZUJDTWEwZjZpK21RL09PVTk5?=
 =?utf-8?B?RE5BNWswTmVnSXk5ZHhFaDlNbHNSRGxIc1puU1MrR2p2TDg3bFlRYlMrK2hw?=
 =?utf-8?B?NDhMK2JBTXRBWjZYN3BKcit6Y1I5MjN1V3dMV3JQTlNWeEpDSi9RRnBVVlJk?=
 =?utf-8?B?bXNOOTlTa1hVTzZPd2RDN1h0ZzFQOFJJTU9WSkhYMWFkdmZjMlNMei9KTjdZ?=
 =?utf-8?B?ZjYyd3BHTXk3YzdiZDlnUFdld3ZHM3lhUmpSZEpKaHoyeHliYytqM29JSXZl?=
 =?utf-8?B?bGNSdERmN2c3aHQxMXU5ZUJpNlAvSDFTUVdMWUI0dlZMRGZUOTZYemJ5TDYx?=
 =?utf-8?B?b1Q0WWZIMkZmSTFJMGVxek9EVi91YzR5TS9BTnhsSmV3Q0JTSExLNzgyS0xR?=
 =?utf-8?B?dklwYndmTGxwRkJmZEtteFlybUVJaXdra0hTRmRmRGNBSHpLallYVGhVWEd2?=
 =?utf-8?B?a3dMdk9QMHpoeTIyODRVOVI2dytCNnQxMWlON1JZNVFqaFhqUk9xcm1XS2xN?=
 =?utf-8?B?TDdTdHBERElyanZpN3RraG9Rc0h6TzQ5S3pxdk5nOHIzckt5QVB4bmNraXhx?=
 =?utf-8?B?ZnUwQTRSMzBDZXhTdFoxLzc4ZlNFR3Fpd2ZEejRqbDZjdFAwVE9WcmFhMFNQ?=
 =?utf-8?B?aGhGRCtUcUtQNTVTcE9YeWtWd2s3c25pWXdNb3dNUFdqeTBOZ0Z4ZFFIazBw?=
 =?utf-8?B?eEJEZnA4QmErUHlsdDFUSUk0NGtnYjk1UDJwcU9zVUZvUHFBQnBDT0dVUVpr?=
 =?utf-8?B?dnkzcUx1MG1FZWMyYWQ2UmhIV1RYb0Y3SExQbXRSakluVUZMQVRpNXo5bnly?=
 =?utf-8?B?aGZFK1dMZ3FySVdHbW9LMmoveStwUWxYUGlPSjFOSlc4TGhFbG5hcEQ3L0Ns?=
 =?utf-8?B?RVR2QnpTWUw3YVRYaitDajBlOFdQcGpnc1dnU29GZ3JIQnIxMHFkY1VqTlJy?=
 =?utf-8?B?VFVTcHRVb2FBMkx5SE1XRlZNZUdvMWdqaXBIZzczdCtSa2dyVEJFdHR3Z1ZL?=
 =?utf-8?B?RDBXYjJ4cnFtclhXVzBxNGdzVnN2ZnBWMGRxcjh3a3BtbUluMmdwM3VzSWlW?=
 =?utf-8?B?dVlXL0s2YjBxQmRaQ1lReXVFLzJ1TnIwZlZyQjhXMEhsa2NnTUZQRFdqRG9n?=
 =?utf-8?B?MTJ1TWwybzRYZXR0VTBDRVErR3Qwakxncysra0sxTTFKR1lsYUlEZ3Zaanhl?=
 =?utf-8?B?M3BOeCtQWHBpbkU1eFFtMWt4WEpCRmZkRVVwLzkrWHc2UURKZkpKd0ZjOFFF?=
 =?utf-8?B?QktaZDZQSFJudlNjNmxaU0o5eDBmeG04MVQwV01kV3lOOGl6dTZvOWk3R2tS?=
 =?utf-8?B?elZpeVNXWXNIa1BSQlFYZXF2Z3FDcEYwUG5LNDFpbFN1VTNkRWRpZ1htRi9O?=
 =?utf-8?B?cnRlTU5zNW8zUXhjVTZ0YUxYNWJOYkhVZFEvYXpTMFV0S2s2RVdNSnpnZlpo?=
 =?utf-8?B?RzlINk5kVm5iaUhXaVdYb0x5Mml5TXgvMXlXdjl1Umw5K1RXVmE2WHJqbVcv?=
 =?utf-8?Q?QtDQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1830976FB9DA0479E10E6B8199BF10C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab26be76-af25-4ac9-dee4-08dce907a7d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2024 08:43:46.9059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x8Xnp+gpVN2rw7/tb+ZK+VsRK+jKplBUn6R1LM6PDxQxw3D07Z/ordu0TqO+bUnyZoJbUXyBvMXE4QOWAbH+Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9196

T24gMjAyNC8xMC8xMCAxNjozOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4gT24gMTAuMTAuMjQg
MDk6NTgsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gQ29tbWl0IDJmYWU2YmI3YmUzMiAoInhlbi9w
cml2Y21kOiBBZGQgbmV3IHN5c2NhbGwgdG8gZ2V0IGdzaSBmcm9tIGRldiIpDQo+PiBhZGRzIGEg
d2VhayByZXZlcnNlIGRlcGVuZGVuY3kgdG8gdGhlIGNvbmZpZyBYRU5fUFJJVkNNRCBkZWZpbml0
aW9uLCB0aGF0DQo+PiBkZXBlbmRlbmN5IGNhdXNlcyB4ZW4tcHJpdmNtZCBjYW4ndCBiZSBsb2Fk
ZWQgb24gZG9tVSwgYmVjYXVzZQ0KPj4gZGVwZW5kZW50IHhlbi1wY2liYWNrIGlzIGFsd2F5cyBu
b3QgYmUgbG9hZGVkIHN1Y2Nlc3NmdWxseSBvbiBkb21VLg0KPj4NCj4+IFRvIHNvbHZlIGFib3Zl
IHByb2JsZW0sIHJlbW92ZSB0aGF0IGRlcGVuZGVuY3ksIGFuZCBkbyBub3QgY2FsbA0KPj4gcGNp
c3R1Yl9nZXRfZ3NpX2Zyb21fc2JkZigpIGRpcmVjdGx5LCBpbnN0ZWFkIGFkZCBhIGhvb2sgaW4N
Cj4+IGRyaXZlcnMveGVuL2FwY2kuYywgeGVuLXBjaWJhY2sgcmVnaXN0ZXIgdGhlIHJlYWwgY2Fs
bCBmdW5jdGlvbiwgdGhlbiBpbg0KPj4gcHJpdmNtZF9pb2N0bF9wY2lkZXZfZ2V0X2dzaSBjYWxs
IHRoYXQgaG9vay4NCj4+DQo+PiBGaXhlczogMmZhZTZiYjdiZTMyICgieGVuL3ByaXZjbWQ6IEFk
ZCBuZXcgc3lzY2FsbCB0byBnZXQgZ3NpIGZyb20gZGV2IikNCj4+IFJlcG9ydGVkLWJ5OiBNYXJl
ayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+
IC0tLQ0KPj4gdjEtPnYyIGNoYW5nZXM6DQo+PiBBZGRlZCBob29rIHhlbl9hY3BpX2dldF9nc2lf
ZnJvbV9zYmRmLg0KPj4gQ2hhbmdlZCBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmIHRvIHN0YXRp
YyBhbmQgcGNpYmFjayByZWdpc3RlciBpdCBhcyB0aGUgcmVhbCBob29rIGZ1bmN0aW9uLg0KPj4g
LS0tDQo+PiDCoCBkcml2ZXJzL3hlbi9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAxIC0NCj4+IMKgIGRyaXZlcnMveGVuL2FjcGkuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMTcgKysrKysrKysrKysrKysrKysNCj4+IMKgIGRyaXZlcnMveGVuL3By
aXZjbWQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2ICsrLS0tLQ0KPj4gwqAgZHJp
dmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYyB8wqAgNCArKy0tDQo+PiDCoCBpbmNsdWRl
L3hlbi9hY3BpLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEyICsrKystLS0t
LS0tLQ0KPj4gwqAgNSBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlv
bnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vS2NvbmZpZyBiL2RyaXZlcnMv
eGVuL0tjb25maWcNCj4+IGluZGV4IDcyZGRlZTRjMTU0NC4uZjdkNmY0Nzk3MWZkIDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy94ZW4vS2NvbmZpZw0KPj4gKysrIGIvZHJpdmVycy94ZW4vS2NvbmZp
Zw0KPj4gQEAgLTI2MSw3ICsyNjEsNiBAQCBjb25maWcgWEVOX1NDU0lfQkFDS0VORA0KPj4gwqAg
Y29uZmlnIFhFTl9QUklWQ01EDQo+PiDCoMKgwqDCoMKgIHRyaXN0YXRlICJYZW4gaHlwZXJjYWxs
IHBhc3N0aHJvdWdoIGRyaXZlciINCj4+IMKgwqDCoMKgwqAgZGVwZW5kcyBvbiBYRU4NCj4+IC3C
oMKgwqAgaW1wbHkgWEVOX1BDSURFVl9CQUNLRU5EDQo+PiDCoMKgwqDCoMKgIGRlZmF1bHQgbQ0K
Pj4gwqDCoMKgwqDCoCBoZWxwDQo+PiDCoMKgwqDCoMKgwqDCoCBUaGUgaHlwZXJjYWxsIHBhc3N0
aHJvdWdoIGRyaXZlciBhbGxvd3MgcHJpdmlsZWdlZCB1c2VyIHByb2dyYW1zIHRvDQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4vYWNwaS5jIGIvZHJpdmVycy94ZW4vYWNwaS5jDQo+PiBpbmRl
eCA5ZTIwOTY1MjRmYmMuLjBiZmYyZjNhODdkMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMveGVu
L2FjcGkuYw0KPj4gKysrIGIvZHJpdmVycy94ZW4vYWNwaS5jDQo+PiBAQCAtMTI1LDMgKzEyNSwy
MCBAQCBpbnQgeGVuX2FjcGlfZ2V0X2dzaV9pbmZvKHN0cnVjdCBwY2lfZGV2ICpkZXYsDQo+PiDC
oMKgwqDCoMKgIHJldHVybiAwOw0KPj4gwqAgfQ0KPj4gwqAgRVhQT1JUX1NZTUJPTF9HUEwoeGVu
X2FjcGlfZ2V0X2dzaV9pbmZvKTsNCj4+ICsNCj4+ICtnZXRfZ3NpX2Zyb21fc2JkZl90IGdldF9n
c2lfZnJvbV9zYmRmID0gTlVMTDsNCj4+ICsNCj4+ICt2b2lkIHhlbl9hY3BpX3JlZ2lzdGVyX2dl
dF9nc2lfZnVuYyhnZXRfZ3NpX2Zyb21fc2JkZl90IGZ1bmMpDQo+PiArew0KPj4gK8KgwqDCoCBn
ZXRfZ3NpX2Zyb21fc2JkZiA9IGZ1bmM7DQo+PiArfQ0KPj4gK0VYUE9SVF9TWU1CT0xfR1BMKHhl
bl9hY3BpX3JlZ2lzdGVyX2dldF9nc2lfZnVuYyk7DQo+PiArDQo+PiAraW50IHhlbl9hY3BpX2dl
dF9nc2lfZnJvbV9zYmRmKHUzMiBzYmRmKQ0KPj4gK3sNCj4+ICvCoMKgwqAgaWYgKGdldF9nc2lf
ZnJvbV9zYmRmKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBnZXRfZ3NpX2Zyb21fc2JkZihz
YmRmKTsNCj4+ICsNCj4+ICvCoMKgwqAgcmV0dXJuIC1FSU5WQUw7DQo+PiArfQ0KPj4gK0VYUE9S
VF9TWU1CT0xfR1BMKHhlbl9hY3BpX2dldF9nc2lfZnJvbV9zYmRmKTsNCj4+IFwgTm8gbmV3bGlu
ZSBhdCBlbmQgb2YgZmlsZQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3ByaXZjbWQuYyBi
L2RyaXZlcnMveGVuL3ByaXZjbWQuYw0KPj4gaW5kZXggMzI3M2NiOGMyYTY2Li40Zjc1YmM4NzY0
NTQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3hlbi9wcml2Y21kLmMNCj4+ICsrKyBiL2RyaXZl
cnMveGVuL3ByaXZjbWQuYw0KPj4gQEAgLTg1MCwxNSArODUwLDEzIEBAIHN0YXRpYyBsb25nIHBy
aXZjbWRfaW9jdGxfbW1hcF9yZXNvdXJjZShzdHJ1Y3QgZmlsZSAqZmlsZSwNCj4+IMKgIHN0YXRp
YyBsb25nIHByaXZjbWRfaW9jdGxfcGNpZGV2X2dldF9nc2koc3RydWN0IGZpbGUgKmZpbGUsIHZv
aWQgX191c2VyICp1ZGF0YSkNCj4+IMKgIHsNCj4+IMKgICNpZiBkZWZpbmVkKENPTkZJR19YRU5f
QUNQSSkNCj4+IC3CoMKgwqAgaW50IHJjID0gLUVJTlZBTDsNCj4+ICvCoMKgwqAgaW50IHJjOw0K
Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgcHJpdmNtZF9wY2lkZXZfZ2V0X2dzaSBrZGF0YTsNCj4+IMKg
IMKgwqDCoMKgwqAgaWYgKGNvcHlfZnJvbV91c2VyKCZrZGF0YSwgdWRhdGEsIHNpemVvZihrZGF0
YSkpKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUZBVUxUOw0KPj4gwqAgLcKgwqDC
oCBpZiAoSVNfUkVBQ0hBQkxFKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQpKQ0KPj4gLcKgwqDC
oMKgwqDCoMKgIHJjID0gcGNpc3R1Yl9nZXRfZ3NpX2Zyb21fc2JkZihrZGF0YS5zYmRmKTsNCj4+
IC0NCj4+ICvCoMKgwqAgcmMgPSB4ZW5fYWNwaV9nZXRfZ3NpX2Zyb21fc2JkZihrZGF0YS5zYmRm
KTsNCj4+IMKgwqDCoMKgwqAgaWYgKHJjIDwgMCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gcmM7DQo+PiDCoCBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0
dWIuYyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMNCj4+IGluZGV4IDJmM2Rh
NWFjNjJjZC4uOTAwZTYxOTllZWM3IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy94ZW4veGVuLXBj
aWJhY2svcGNpX3N0dWIuYw0KPj4gKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0
dWIuYw0KPj4gQEAgLTIyNyw3ICsyMjcsNyBAQCBzdGF0aWMgc3RydWN0IHBjaV9kZXYgKnBjaXN0
dWJfZGV2aWNlX2dldF9wY2lfZGV2KHN0cnVjdCB4ZW5fcGNpYmtfZGV2aWNlICpwZGV2LA0KPj4g
wqAgfQ0KPj4gwqAgwqAgI2lmZGVmIENPTkZJR19YRU5fQUNQSQ0KPj4gLWludCBwY2lzdHViX2dl
dF9nc2lfZnJvbV9zYmRmKHVuc2lnbmVkIGludCBzYmRmKQ0KPj4gK3N0YXRpYyBpbnQgcGNpc3R1
Yl9nZXRfZ3NpX2Zyb21fc2JkZih1bnNpZ25lZCBpbnQgc2JkZikNCj4+IMKgIHsNCj4+IMKgwqDC
oMKgwqAgc3RydWN0IHBjaXN0dWJfZGV2aWNlICpwc2RldjsNCj4+IMKgwqDCoMKgwqAgaW50IGRv
bWFpbiA9IChzYmRmID4+IDE2KSAmIDB4ZmZmZjsNCj4+IEBAIC0yNDIsNyArMjQyLDYgQEAgaW50
IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYodW5zaWduZWQgaW50IHNiZGYpDQo+PiDCoCDCoMKg
wqDCoMKgIHJldHVybiBwc2Rldi0+Z3NpOw0KPj4gwqAgfQ0KPj4gLUVYUE9SVF9TWU1CT0xfR1BM
KHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYpOw0KPj4gwqAgI2VuZGlmDQo+PiDCoCDCoCBzdHJ1
Y3QgcGNpX2RldiAqcGNpc3R1Yl9nZXRfcGNpX2Rldl9ieV9zbG90KHN0cnVjdCB4ZW5fcGNpYmtf
ZGV2aWNlICpwZGV2LA0KPj4gQEAgLTQ4NCw2ICs0ODMsNyBAQCBzdGF0aWMgaW50IHBjaXN0dWJf
aW5pdF9kZXZpY2Uoc3RydWN0IHBjaXN0dWJfZGV2aWNlICpwc2RldikNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoZXJyKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBjb25m
aWdfcmVsZWFzZTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwc2Rldi0+Z3NpID0gZ3NpOw0KPj4g
K8KgwqDCoMKgwqDCoMKgIHhlbl9hY3BpX3JlZ2lzdGVyX2dldF9nc2lfZnVuYyhwY2lzdHViX2dl
dF9nc2lfZnJvbV9zYmRmKTsNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUgcmlnaHQg
cGxhY2UgZm9yIHJlZ2lzdGVyaW5nIHRoZSBmdW5jdGlvbi4NCj4gDQo+IEl0IHNob3VsZCBiZSBk
b25lIGF0IHRoZSBlbmQgb2YgeGVuX3BjaWJrX2luaXQoKSAoZ3VhcmRlZCB3aXRoIENPTkZJR19Y
RU5fQUNQSSkuDQo+IA0KPiBBZGRpdGlvbmFsbHkgeW91IHNob3VsZCByZXNldCB0aGUgZnVuY3Rp
b24gcG9pbnRlciBOVUxMIGluIHhlbl9wY2lia19jbGVhbnVwKCkuDQpTaG91bGQgSSBuZWVkIHRv
IGFkZCBhIG5ldyB1bnJlZ2lzdGVyIGZ1bmN0aW9uIHRvIHJlc2V0LCBvciBqdXN0IHBhc3MgTlVM
TCB0byB4ZW5fYWNwaV9yZWdpc3Rlcl9nZXRfZ3NpX2Z1bmMgPw0KDQo+IA0KPiANCj4gSnVlcmdl
bg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

