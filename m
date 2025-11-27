Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15DBC90204
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 21:36:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174379.1499325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOiiw-0005h6-6s; Thu, 27 Nov 2025 20:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174379.1499325; Thu, 27 Nov 2025 20:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOiiw-0005ff-2p; Thu, 27 Nov 2025 20:36:18 +0000
Received: by outflank-mailman (input) for mailman id 1174379;
 Thu, 27 Nov 2025 20:36:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOiiu-0005fY-Cn
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 20:36:16 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b48b6e32-cbd0-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 21:36:10 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB7668.namprd03.prod.outlook.com (2603:10b6:208:509::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 20:36:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 20:36:06 +0000
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
X-Inumbo-ID: b48b6e32-cbd0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU+6780WhS/vBp5LZlpUBwc2Zc4U0voN0fAGfqvvbGi6WRHTvjCN3m/p/MN/XwqlaucTdLj8mZT8nusbk8E8OWimgdpfchsuq5oHi25Cz78e4rU+HCblXORHxGQtVmvyEf51ex7KZJrnKWrvE+OJmcoZUz1DJQoWTmdkXX0ZERL0Imt1SsLZ2cHncaZAOAyF7aaQ3y4TjS/wJgt/xRWFrKKkdy8wrDk8YuQqlueNiqXNWQexvxHlrZGAWsZ5A9X0EVCHt/UCYEhTfn0xm5GmBl4CM7dlFEEhmEUVvuY/1xpnOHZ1gvdwEPZtM6aQGDkwHpjvq+k1ykQf+E5HoB2QSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQkK/c1GnY9Ph2bbVCZOPpV8lnEcJOqUcN0oX7BTvaI=;
 b=NtTIygNaKVqevA6eRvHo867zmn/2tl1ceZmO3PUfYWeOndiXFIorGDQlz6IhtYXY95K0egNHeQbQmQ+M9D0LI6pEq+UtwdM8fAp3vEhb1TNiD1TZwQvKnjTtc/oKLweiV0mEVtXmXYJxh221JfeZLwPSmgZ7afsmglOVHcmA5d7t45OnXvl/yoO6lYOhVLItz+9C2fAaIVt+DMCKjmnhGBsVUevbqU7xqAYTvnX+WMu4GxpcJU9Y/ASjeIJxZ4SzKPlKI5fCv9Uo6dwkuMbtBiYvnccTPrWFRFgRuH3NWYz90cwXe+c9S6IpC9RbtwEDGyaZ0n++v7xWhcasLoT2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQkK/c1GnY9Ph2bbVCZOPpV8lnEcJOqUcN0oX7BTvaI=;
 b=NMr8e/5Gon8K2Cem90ljKL38dSFxbhkAhDUTMsxuOT62c+d+hgjB2sVuu9cAU/mJewoA/htmo9IAKdyEA5AaCC842qpvhTAmZ4hickN+bqQ5N4fUaaxCjANGVdu06f2TfJQwYTjWbeGGRDF5D+wI2fz7W04URbu5U7/DmZxyCCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9316c348-b4d9-4131-b1da-a9b5083d91cb@citrix.com>
Date: Thu, 27 Nov 2025 20:36:02 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 03/11] x86: Add x86_vendor_is() by itself before using
 it
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-4-alejandro.garciavallejo@amd.com>
 <d71b6b55-6745-4ba4-9a4f-d5e7b08f0aec@suse.com>
 <DEJI6U37EMDI.1F7QHW1I7WV76@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DEJI6U37EMDI.1F7QHW1I7WV76@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0468.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: ad292050-2c19-475a-8f42-08de2df496ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVVEaGF2N1U2RlJVbjA1dXJXd0xaVC9kWkpNZWd5TU5RVTdCekFSYm9PWklS?=
 =?utf-8?B?T2thbXZqN3BMazhldVhFUCt1MmVlL0pibkwxbU5NOGE1ZllWc1NubldTMUtu?=
 =?utf-8?B?M1IzdUtaQmJHME9SWHVrZWFLM1QvbThvU0QwRWFXd25KK3k5cS9PNU5XSVZt?=
 =?utf-8?B?R25KMG5RR2tNaG84S3Q5RTFQLzhGc2s2R3ZmUUVrVmZ2QUxZL1JFMWxMVUdY?=
 =?utf-8?B?Sk56b040U29IbEU2ZmdEVDAxUnl3WkI1TzcyMStPTUVoRzJMYlgzY1JrTDZJ?=
 =?utf-8?B?elRaemNHclN2SmxTVzdZQjg3bDlweFFWVjBqNU1tb3Q2UndWRmZxSGRsYkU2?=
 =?utf-8?B?WGdTblVYYm9tT3ltcnhoR3hCaWxmbFIwcUI0d3dRRUdIMnVUODdhQlJXZ0dq?=
 =?utf-8?B?aFhENUtXajBOVG94RlY2dGNINTZzZFBXeFJ6RndNcGY3RkUxbU5nQUkrQVA3?=
 =?utf-8?B?Y0ZORjVrY3JZMWJGQUxaSEZ3S2RKbE1iK21OdU5RU1VWN0tXQzU3eHFjT3Nx?=
 =?utf-8?B?TnIrYXNXTnVRQThzTG5lb213Ni9DYThIZ0lhcHFZVUdEb1p1V0tOVU81WEo2?=
 =?utf-8?B?ZEJTTmFzMW9rdWxwRkpFaWdkY3o1ME9CVGN0MjlVTnc1UFlJZjBOUnhXSGdh?=
 =?utf-8?B?QUhoTThGNC9EMEhsWitlenpmWjhCam1zL2ZHNWw0RlFQQ3R3bHRCZ0NxSEZG?=
 =?utf-8?B?ZmdPV1cyQ1AyT2lxcFZLZmVlZmV6VXB1OEV3WkRHWnNvZGF3OTNJL1FURm9r?=
 =?utf-8?B?cVkzTnQ3RDY2NHRjVzdrekRoQ3B3Nm5lb2RZYmNmb25EVHN3M1NQdmdldVgy?=
 =?utf-8?B?ZDhJdXFXMWIvUGpUVUZ0eTFyRnpxbXg5RTVIMVQ5ZVZJY2RMOWV2V0k3djhY?=
 =?utf-8?B?YmNVWHJrZFFxajJJL0tDVDRheXRtR2QwR0JFL3VjdFhsanpuZjdmckxaWVV4?=
 =?utf-8?B?MmZPdDQzWDUzSEx5dEVmNWJ2ZjNSckF3R0VxQkozekpUcEpSZjg1QndscHFX?=
 =?utf-8?B?blZMN3oxK213aTFPS25hMGRMbiswTXp1S1pLMGEyK0dDYUFpWVl3a0lRTERj?=
 =?utf-8?B?SmhKbnpXbjdOQmh3bS9RN3FKdUtiV096RmtpUzF0TkhveGtQbEZjS2llZ1cz?=
 =?utf-8?B?T3VLSFphODJyNXlMa05OR1NRb2JkemVxbTFHZk96eDMwVWdkMDRlWmVCT1ph?=
 =?utf-8?B?N29lMDBLZG9Da2hlUUFqQ3o5d0ptVjVmS3d2bEh2b1J1V1JJRHM1bllrL2VW?=
 =?utf-8?B?M1dBNVN1Tjh5NlZHWEdvM2RNMVQ2bG9SMERoNi9yWVVWbjBua3c5REJjbE5p?=
 =?utf-8?B?TUM2YlM2ZFNNeEhici84eEFaV3BFNHFPTnBWeVh2MG9YeVVSS1NIZ2p0R2Vi?=
 =?utf-8?B?TitWNnhHS1BScXM2N3llc2M2ZHRNb1NYTWs0RmsyZEI0L1FGeGtuTHEreExk?=
 =?utf-8?B?OTdjcGtCTm1VVE9KSmtPa1lCZlpYdlFVZlhlNngwbDZwbEhNak9Xa29XQkc2?=
 =?utf-8?B?bWU3TXluUlltWmhDdFN1LzRyTjRhRTJxb0F2bjZWbjhhS2tVbzZqcDc0T0Q3?=
 =?utf-8?B?N3FLazc3bmZpTVB0TGJZVm9oa2xyc3ArblBWOXZ4UFZOamZ5cVZySjZ4eEdt?=
 =?utf-8?B?L3NoOHFYN2t6RENRbnBFTXp4cGxYeHdjWXk4OERXdnBBOEd5NzlOWVZXdFJI?=
 =?utf-8?B?UmVzTEJNY2FpZDEyTTJmZC9KMGFyazZvaUl6enJ5OXdvbXcwSm5pb090d2lq?=
 =?utf-8?B?NUNNMkVITGg5d2hVRG5vWnBXdktFbGYwb2F5TVZFYkRvUzBBeExkb3U1WHhG?=
 =?utf-8?B?NUNKRDlUR1FHQ0UxcmlreTBTclJLSHAyckZjeXhwTmlramdFTmd6Q2lGNFRF?=
 =?utf-8?B?WC9Nc21qZGxja0QxRFVqRU5ld210MWRXbjgzL0tJY2VHNjk5ZGROVUZWc2gy?=
 =?utf-8?Q?8gPXDwqu30XiUel7Vns711SdyeAvUVqs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnNrNnN1d1R3Y0xjOFNrdW9LZ3JjaGllM09CdWtuVmkybnBNOGRhYW5vS0g4?=
 =?utf-8?B?YWdnNGtveDNkR1E1aGQ5WDRTSGRzODlRdGhzWnp4VE5GVGRWS3hWMDNETEZ5?=
 =?utf-8?B?QzFKNnlQRUVuekZxK2JuN1dxZjh0aFlXdzJzbUZyVFdHUWd5cWp5NERSRDQw?=
 =?utf-8?B?UGVKL3FhckZxclVrTVJtUTdsS3Zyb0o3UjBZYndXN1lIUzlweGNlS2lyZXdj?=
 =?utf-8?B?UHFWeUpKMzROQXNNcmcvVHdJZ1p4OWpoYXBnUnRkdS9lejV4ZmMwNWpzWXd1?=
 =?utf-8?B?VWNmTG9HcnlpbzBmTkVNYnRwU0tXdWttUzJKWTVXRmhua3JEbUVoMWd1SVFY?=
 =?utf-8?B?WGVXOEVxM3oySWsrOGlZZXdjMzBLYTJmWUx0d1hEcnVBWG9TK2NVZHB5aGJK?=
 =?utf-8?B?YnVxVUdOOE4wQjR6VzRVWERIK052VlJaTGg4WkNUN2xPWE1ZVklha1pFbjBF?=
 =?utf-8?B?RWVYaVlJRURVU1dwemU2bk1ER1QxVklCcDdqOHRQUitFRzVaR2FDNnU0TktC?=
 =?utf-8?B?aEJyeDREbCs2elFUTXJScnF1eUNFMllVTSszMUc1ekRqeEM1ckxlMFkyeGNr?=
 =?utf-8?B?aWF1S25GaGtPWkx0YlpIZ2FQSUROWVUwbExQQk9pcGxNaXBRRkM5Slk0UWM3?=
 =?utf-8?B?czVUMkJ3WnVFeGJ0dDhTVHlUU3VGRE9sYkZFZUd5enNiRVhGVEhOOEx6clVq?=
 =?utf-8?B?Q2NIbHNJajYzaGoyelBhUUdMSENjR29MaDZPSjhFSklBMGJlMHhZNlFnU0ZD?=
 =?utf-8?B?R3g0SE9nL3hmbERHSWhOZzAwWXhnR2tLK3hzYnYwRzVSc0dFSkM0VGtCWFg5?=
 =?utf-8?B?N3FmOW4zbFlOUVlZUitPdE1yZ295UWczekNrZ2dxMS9zZkpGaEVjaHQwb3pT?=
 =?utf-8?B?R05hYXVUQUU1Q2JWWm44V1ZMWHJJUHVUVTBDY3E4aXY5aEJJUFhrbnUxTG5n?=
 =?utf-8?B?bVFFK3dnUDJxQmhCZmViSUI2MWFNSFltMGNrZUFZZjNpaE9xVnVocWhVL2JW?=
 =?utf-8?B?WUwrMVhpM1V3bVA3WGNlTjd5U2ZycmFvQnFLeGgrZ3RDL3QrODBueG1EL3BR?=
 =?utf-8?B?TmFVTmE3cFdhamdzOWpGZVA5aHA4VXJYZ1BnUXp1OGw3WUFPZmNNVFNnTjB3?=
 =?utf-8?B?TW5ZaUU1dEtVbFdpR1E0aDNnTHY1cGdhc3FmandmME93S3dXZGo0eEZZTE5Y?=
 =?utf-8?B?QzJWY3padmQwKzhudklLQ0NEVGZLYm53VkZ5aEdjcmV5U0hRRE0yVTVPaUp1?=
 =?utf-8?B?WkRXY1FiZVpzQUxYdEVaY3FGWWY5YnY5MHZ2elZCQUYzU2xKaFlEQjZpd0lF?=
 =?utf-8?B?M2NrQmd3c1BvR24vcnZJejdqeldsb0ZxYW51clExRmRLeG1OZHZvaWYxWmtM?=
 =?utf-8?B?UUJ6cUtoOWVQZTkrL1llSnpNaTNtWTRncmJ3cG9oaiszUUhRcGFrdjVnSnFC?=
 =?utf-8?B?Y3FVQVZQSXlKQU5JTCsyVDgzdDB6TGczZDhmU042ck10clU4aFZuRVNjUy80?=
 =?utf-8?B?S0xnbWlCZDlDTjFQa1dMVmQ1Q1VZTnI1NGo2VUQzS1BoZDFTWUI2UEJrRTR1?=
 =?utf-8?B?RFRSdEtNR0JvSEJ5VlEzbXFFSjZsRkNybWYrdXBvVlNOamFMSzFFR29WN1pk?=
 =?utf-8?B?Z3VGLzBpalRWeUFINUtmNmJXZ29UU3A3S3FFc2luWkg0VURWS0puYnp2M0tT?=
 =?utf-8?B?TFRvNGk4djdSYTJBVnNGalFRU2FreFluVWtMNU9ZckZlMmNHdzV5VEZPUXZ5?=
 =?utf-8?B?ZzZXVDFZT0xZbWdPbGl2ZUNIVzA3ZkQ0bHNXRW1JdEU2M3hxM2J0WitDODJD?=
 =?utf-8?B?Q3RlcTIwMTZ1amRSdjN1ZGF1SjZoUTM2K05FcGRXNWVxc2JrQ3pwM09rUkhx?=
 =?utf-8?B?VHEyNCsrNkozME5yRHpjamVmZ3cwaVJqQ1cwT3VjNWpJckExNis5ODZERzRm?=
 =?utf-8?B?aVN3RXdjZlEydXo4K2ZjenFPWTlHeUZPOGl3RFNldFJvNFNvQTVUM1RFTjd3?=
 =?utf-8?B?TXk1aURaS1ZSOUhGNG5uVGF1dVVkaDRQMWg1RHBKcUJRcllYT0dRamowY1Vm?=
 =?utf-8?B?aUlpdkNUNE5xNEhkbzF6c2lpZ1I5Y1YyNTdGZmtyZ091cmJrZHJzTTEyK0I4?=
 =?utf-8?B?QVB3ejFFeDhPVm0vcDhkd1VmMkVUekRKTlRET0NtaktVS3Zlclp0MFY1Q2Fm?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad292050-2c19-475a-8f42-08de2df496ec
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 20:36:06.2125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsReOCdaceiQOgdOsZT4ajo99FH9bd52lfngrzP5aotAwQ2w25RAY/DOGs20I/zQQxX4v3Eiy7C7b//4MOUXCRfCJFokVrICDvRyBR2PnB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7668

On 27/11/2025 1:15 pm, Alejandro Vallejo wrote:
>> Which raises the next question: Should we even allow a hypervisor to be built
>> with X86_ENABLED_VENDORS == 0?
> That's the most extreme case of "should we boot on a CPU known CPU vendor that 
> has been compiled out?", the current code in the RFC uses the unknown vendor
> as fallback. We could also panic. We could be trying to exercise the
> "no assumptions about the vendor" paths.
>
> It's a policy decision for you (x86 mantainers) to take. I personally think the
> default path is silly in this day and age and we could get rid of it entirely.
> Without it X86_ENABLED_VENDORS=0 would be indeed illegal. On that topic...

We allow compiling out both PV and HVM, so Randconfig can search for
broken corners of the abstraction.  The same principle applies here.

For running such a hypervisor, I can't see anything that would
fundamentally interfere with PV guests; PV guests are all architectural x86.

I don't like there being an explicit Kconfig option for UNKNOWN. 
UNKNOWN should simply be "didn't match anything we compiled in".

~Andrew

