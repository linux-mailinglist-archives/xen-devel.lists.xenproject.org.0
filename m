Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B46CA852B
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 17:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179286.1502867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYP2-0006cM-Vq; Fri, 05 Dec 2025 16:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179286.1502867; Fri, 05 Dec 2025 16:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYP2-0006aC-Sc; Fri, 05 Dec 2025 16:11:28 +0000
Received: by outflank-mailman (input) for mailman id 1179286;
 Fri, 05 Dec 2025 16:11:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRYOH-0003Yi-Ku
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 16:10:41 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f16018f9-d1f4-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 17:10:41 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6951.namprd03.prod.outlook.com (2603:10b6:a03:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 16:10:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 16:10:29 +0000
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
X-Inumbo-ID: f16018f9-d1f4-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4nod6UUkZTJER/Aw4q17+539IZXijHf9s48oincNM0gOeS0dBPZzlH7YSHYdr8vw05ztxa+p0eiZrrQUW+7RAf7P9/4NzEryvu+ju65W6lMbivUddsQaF+x6gHZQ9mMtszJQF8hTYJNO8z05D59NT043jEu/QC4WPOupJ2Jzrlj+kxX2j2F4DiS+BkOAkBsd6UZxlPbJctaqaRTFXzEJa2rS0zQ0fH4FuiPi/9XvX+iAQwUlqOrj/5657TRY9WBjXqK6OUJQY3oKU65MNLOmmgwqrMb7tBUkmx5yKM5M7wyNaK+Y3I8DFpHGsP7X9CqSg/RWJlxYHgOxfrq5KCPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0wbZsFKjcJkry2PhJeuKoLloFPfk1DqvBuHkAecmGc=;
 b=U/85Yq2TlwUvdmfqRZ/xj5pQi5JXFQQsaA8o3PNwI5s+hsljcUIRY/d2/PLl1W/WvqZAaW7a9EvXMDrBeiIjnvcGdW+n663yklRT7O4FTVEsB66PkQPTX7bl2TIWvylQ6hN2aejOEU7Q9bd/O3sVsV4X9Il0PoUJtm67I1mwJq+fQGpfhSTUu5TWTmBtEoizouV2BLTX6p/DxcIGqpkUxzuwS3KrloKKX2qlYAwQ5+93rZokREVmJl+uM6ZyJ9b3pIxubumDmjzQnBkiTlZWv3WCoIXld2q06Ic3hUFty9xnkJcZnbuGnl29K2iAoEsbMrQr9NtMgGxIlglF2+2+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0wbZsFKjcJkry2PhJeuKoLloFPfk1DqvBuHkAecmGc=;
 b=xSVu2Pbp8aBocGH4v8RBiNTUqyMxAasTrDeTH7xPd+gyHYxb672rN7LBYRPqgFJUmQ90HI09XvF+Z1sBYJgS0u2t5gEQyNYI/2iw7DLJk+xDHx8KawZcsc6PHnWPUUnMb9cmgfvXLAEfz+nFbJdiLqXLGH8holEDKSeVYLNaFsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3ac29da6-4833-42ec-a70e-7a23a7ff54b2@citrix.com>
Date: Fri, 5 Dec 2025 16:10:26 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Mykola Kvach <mykola_kvach@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2] systemd: fall back to default system-sleep dir without
 systemd-devel
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
References: <aa1ed166473c7eeb442ebf3961c4e7513fd0ff82.1764950250.git.mykola_kvach@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aa1ed166473c7eeb442ebf3961c4e7513fd0ff82.1764950250.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: 765bdb68-c002-462c-42c9-08de3418cf2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWJnWEJwL1RXc2FsRjdSUTE2bkppakxkdExKamFrb2YrbU9LMjF3VGJ6b3VG?=
 =?utf-8?B?WU1ZL1VFelRDV1JIRExSN0c3eFJlRHppK3FzTHdUY3I3bE14bGQxZ1d3ZUJV?=
 =?utf-8?B?VHpJbUtQYWpJdUx2WmJHalhqbkp3R0luN2I5UG5tZG9CRmgzYXVTOHp2aUd1?=
 =?utf-8?B?SExXTVd0bWVKeUluMFNkZE85b2lkdjEvQ0VQdVJnOUxSU0liTmUxWWQzZjRZ?=
 =?utf-8?B?YTAyVk1hbW1pVVhCaEx1Z0t1MWJwejhWKzVqZzdxOXdiM0x6RGswZkx4dVJN?=
 =?utf-8?B?WVdwYVlOdlZ3d1RDMTROZzcyc01YaVRNSGx1TVV4SkN5SWxFSG1uNWMxUGRa?=
 =?utf-8?B?cFRCRVE0a1FRYndkMnIzYk90Mk90a2N6R1QvYVFzaWQyc29jdzJWRDJZZ2Rh?=
 =?utf-8?B?STVYVks3VlRFY3crd2YxUTFkMmwrbGJZQ3ZnZ0xRVEJCWkxJajVvdTEwYnF0?=
 =?utf-8?B?ZlRUOE93cm5pOThidVA0djVOcFdwOEtXSG5ZK1EvMkF2anFQenYzOHBMUEZm?=
 =?utf-8?B?eUdXdFd6UUxiVlZEdTNxb214L2plNFRtaitWU21obm5wYkFCUXZ5aDh2M0pG?=
 =?utf-8?B?MmtWQ3FnUlkzODg4R3dmZ3pySlBHRHowbVBqN3M0ZXBub01XbTAvbUFxRDNZ?=
 =?utf-8?B?MkFFaGRybTdLdllod3V2TkU4WUUxelJpcE1xMlRDSUJSYlJ5USs3MkorWmtN?=
 =?utf-8?B?UWNYVmEweFNKSCtGcW9TN3FlaTJWQWJvL3N0SVdZYUJUMzZjMUloWnJtaUpM?=
 =?utf-8?B?dEZwb3NQS29rNmU3aVUvck50eVozZGNRL0ZvWm0xaVVoVGVpR1czLzZNS0d4?=
 =?utf-8?B?cWNwaGFPaWJ6SGtwNjFxL2dyN3RDOWxFTUVTd211YnUzcTJNRmx1cDl2cmNJ?=
 =?utf-8?B?ZmRuK2s3cmNrTDc4L0hDOC9WM3A5cU9jYnYvTEhjY29oTEhHRkJXK2J4WURF?=
 =?utf-8?B?UEd0VEJmc2R3SnBWTzIraDFsVDEyVWpCWlVKZ2ZpZTJTYkpjTUJXdGFqTXF5?=
 =?utf-8?B?UjFTUDFIZjhpTFBTN1Z1aWJtYmU3TkFjS3BnWXhEL3JxYzVWOEY1SjdNVWYz?=
 =?utf-8?B?Q2RBV210aXlsd3JOQkc5YkJqT2FDZ2VVWmJHcVBoOGhGVmt5L21JRkUvaDhw?=
 =?utf-8?B?bjV1djJBQzdNMzY1RE90Q1ZyeE1zQjFjT0Q0M2MxRDZXN3VOVURYV0pKSkFI?=
 =?utf-8?B?blJtViszblJMYzNjdlRZRS94dkkrZFNqSmkzaExHYm5BMW1GQmQyLzZKS010?=
 =?utf-8?B?K3BMRE5NaEw1VE85b2dQNWVLQ2ROUUM2MTJab0wwd3Qwa2NuNFNheWNZdkNO?=
 =?utf-8?B?YTZLaTVxQ1F4bXZMdVcyT2pzSnlld241QjJQL0R0NW4xNHRGaEovYm42Zklq?=
 =?utf-8?B?T3lXcjlHMUxmM0JpSkx5dkNSeFBTMDY1V3Nsb0ZRRU9aSWJDeHB3RlhzeURm?=
 =?utf-8?B?TlZMNXp4aVBaaVY5Q3JCUXBscmVPbXNDdXpCZTlnakx0UnhDbGZwRmE1akx0?=
 =?utf-8?B?T3Z0UnVBQWUwbW4zQ0RUbEgyMFJZUWh5MDc4enlTWVg5QVNuZHZXUkwvNjA1?=
 =?utf-8?B?ejNTak9jVlJUejYvaXRYNlZOb2RDOHNiR0hJK2dHd1VPSEk2VnNrTnZJbG9t?=
 =?utf-8?B?cGZoNFRJcm5TbCttYlhOOWR3b3gyeU4ydnFqOUI0Q2xWTEw1NEhUZWVSTDNm?=
 =?utf-8?B?cWNLYnoxc2J1dGpIY1lIbGw1czlHRW43dk1ETzdHOGE4RVh0WW5OVjc1Ykcx?=
 =?utf-8?B?TVVYV2x6OFgxOUY3ZThHTDUyL1NqRGkwQ2U1NDF0ZlBFa1pQcXk2K2crdU5D?=
 =?utf-8?B?YlByTXVDb0JtdEo4eTFpRFcyeTA2OXg5aEhUTXNMZENYTEpGRE1Ra1IwUUN0?=
 =?utf-8?B?SmRGZis3amhnS3lvYWFOcHBFVEE0TFNsRU01K1FsSVowSWdtcVl2ZndlbC9y?=
 =?utf-8?Q?0x412ehuXoXiDhp+K/MOeOSpreZD5UKP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dThPNUlLT3JtU3d1RGhuSmwvMVlKcGNSVDl3QnhiTkhIM2RRS1M2ekFkeGl3?=
 =?utf-8?B?YTBZSFJMcE40TVlkM0tPUmxVeXA2NXFPN0o2T1ZlTVFZQTh1YUNQZ3orWDJu?=
 =?utf-8?B?blZhaC9wSmJaZmd0ajBuTVRnbGNRU0VTN0lxb1hidlYwMjRmTXRsUmxsTmxi?=
 =?utf-8?B?TnhISDE3elAyWXJibThGTDV1Y25nUEMvblk5S2JCNFB6RTdQWEJNamZPYzkz?=
 =?utf-8?B?eTVadHBHdXZkQ1dLdUJKTStCSDNCTDcyTGhNY2JZRnkrbFU3bzlmZnNDdzh0?=
 =?utf-8?B?ZTVscm1hU3dleDFHMjIxTkVFaHcrMGJGdmJ3VnMxUGROMnB6STlrSXdtQUJo?=
 =?utf-8?B?ZEhJdHYyZzlpMVdMRGhwRnFsS244TDkyNzB0azAyTlRndUFRcDFmNnBESE1t?=
 =?utf-8?B?cTd4dGlFQWp2YldNeXNDVnl2Y2w1NVVmbi9naXhYMEpDdkVuSEVLaE5hWFVF?=
 =?utf-8?B?aXFGdXNFcTA5L2M1RFJyVEZTR0ZPbWhnYnVYS0xYVUUzOXJ2U0FVQkdURmR0?=
 =?utf-8?B?TFoyOEVaM3pUVmlXM2JIbkhhRWI2L0txbVdZL2ZDL1Job3Z5UE91OGZyUGZ6?=
 =?utf-8?B?UEtFTjl1bWt2dmVWQTJSaFYxV3Z0TXk2NzFwZjVyTmRuSVBkNVNSSmdDV0tt?=
 =?utf-8?B?cVNncjBNWmFLT2pYZE02eEY0blRDdHM1eGI1QjdYQTgyS1htZEE4N1pTZUtz?=
 =?utf-8?B?TzBTR1pFaUxjUE9HVUhZNWU2Z1FkQlN3UVpiRjYybFdSeU4wcmtIVUJ2Mi9K?=
 =?utf-8?B?OXJwRGFUMVhDWlpnM2Z1eW80ZGUxc0l1U0dHS1plRGNzWS9aRjRIY2ErNmJ3?=
 =?utf-8?B?TlJnV2lzbnF2cjZmdmM2YUFONXRFWDlkbkFIa1c5QjJxY3l0TkdQM2RUejJs?=
 =?utf-8?B?TVBYNk5EendPay84bDlZMkZkdEtQcUhXMVR6RmZ5NXg2cFBjU1orYXJkN1Zx?=
 =?utf-8?B?K3dqWngxMXZrY1NteHFGTU40WDBneE9FN0UrblAva0YrdVVUOFpiMGhnOTM5?=
 =?utf-8?B?WWdmbTFKZWRZYmNaSjR1VkllOFVwSndxUXFFVVJMVS8weFhDZFRZTmlPR3RY?=
 =?utf-8?B?N2kzSmgrYmpwMC9YZVhnbCttTEZwRXNLMC9oSi9KVFByeFFLZCtQTnJPT3h1?=
 =?utf-8?B?QXp6SkNjR2Ztd1o1WXh3TFp0SDhKYXZwNUtFVUV6UEtCZnp2eS96N1ZPeTdy?=
 =?utf-8?B?THhCWmZNd2NzRC9pa1VMajlFai8yLy9oM3Brc2gyUzBxUVRWTjBjb1NsVG1B?=
 =?utf-8?B?dG5TM0JRUWxPdVVvWmpTN045dElISlVDRURzaGJxb1loTEdEQ2JQOVhLcDRN?=
 =?utf-8?B?MHJ3M25pZE03TE9xankyd3RwUHo3cXRXQzB3WnRIc2VoeVpNcmJNYitQWTRz?=
 =?utf-8?B?T253YTFEc1FlODBDT0pTekVjVG90UjRzbzFXaUxycnlZT001eVRyWERMOFY3?=
 =?utf-8?B?OGpBVjZGMDJ3U2czV1FuNnhBM05lZktzbkJESzNicHV1Q25IYzlxWWpFNUpM?=
 =?utf-8?B?cGNvY3JYYjE5RFIrT09SSW5EcnF1dEVNVy96dzRVd3hDYU1CSDVCS0R6aTZl?=
 =?utf-8?B?bFNZdUhkcFFwTGF1dkg4aHM2S1l6cXJzMnJqbC96c3F2czhHNzFEZWg2ZXVH?=
 =?utf-8?B?aTZuaEwyeUNuZ0F3VWRYbjhoSUErZXNvM3V6RlY5am4yMjdFUWlaMjhHRVhQ?=
 =?utf-8?B?emxwVmQ1bUdXUFNtbDFiU2xFQkJIeC9OU014bmNmckRWWnBkYUZiS2YraFNG?=
 =?utf-8?B?Y1BmZU5QNDV3TzkyVlhLM1ZlalhXUGVIMFBiRzJLQ2ptUXczNHk2SmU3V2Vr?=
 =?utf-8?B?RFJxRTlVZFRzNkkzOG9GRHd4YlRCdDJuZXpCNnhEeUl1dUZDQXAyZGlHdTVw?=
 =?utf-8?B?bXg0UVY4WFcrV3pRdUtjd0xWR2VXS0Z3dTZ5L09pbGJRMERnNVUrbUw4K09K?=
 =?utf-8?B?bzk3SEg5bHkxd0ZzdVdJOHBIRURYRUdzb2JMaHE2WXIwMytKQVBxTkJld0E4?=
 =?utf-8?B?N2xHbFV1QVlqZ09FSVBZVjNLVW1MSUMySjMzVGd1S0owVDFNeUQ3YjJaMW9t?=
 =?utf-8?B?Rmt3NnNMWU1uL01BNkc5WjlleHIyMTRpeGI1elg1VDhJZi91OWhabG9LNlQw?=
 =?utf-8?B?SEhKaDU3a011LzFOcWJ3Y2tsOWxtczJxNnFIT3JjU1VaYkdRNGVjaVhIL2J2?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765bdb68-c002-462c-42c9-08de3418cf2d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:10:29.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwVDnsbsdscBjI3s8s6DbtAIcmjCOwhj3HDTC4piADyZmg7DlSHCC4qeNvXhLcSGuOp+Aepv4GnmY7Zw6mGHPpI7N2CLp2g9f5MOZy8s1Pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6951

On 05/12/2025 4:07 pm, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Keep the pkg-config lookup for SYSTEMD_SLEEP_DIR, but fall back to
> "$(prefix)/lib/systemd/system-sleep/" if the variable remains unset.
> This avoids reintroducing a build-time dependency on systemd-devel while
> still honoring the path provided by pkg-config when present.
>
> Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on suspend/resume")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Build in which the regression was detected:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099
> ---
>  m4/systemd.m4 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/m4/systemd.m4 b/m4/systemd.m4
> index c47a25ef93..5fb5a7089e 100644
> --- a/m4/systemd.m4
> +++ b/m4/systemd.m4
> @@ -81,7 +81,7 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
>  	], [])
>  
>  	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
> -	    AC_MSG_ERROR([SYSTEMD_SLEEP_DIR is unset])
> +	    SYSTEMD_SLEEP_DIR="\$(prefix)/lib/systemd/system-sleep/"
>  	], [])
>  ])
>  

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

