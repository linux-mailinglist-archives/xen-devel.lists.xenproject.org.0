Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE60B1C790
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 16:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071840.1435197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujf0q-0007Xv-2A; Wed, 06 Aug 2025 14:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071840.1435197; Wed, 06 Aug 2025 14:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujf0p-0007Vb-VG; Wed, 06 Aug 2025 14:21:03 +0000
Received: by outflank-mailman (input) for mailman id 1071840;
 Wed, 06 Aug 2025 14:21:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Mu=2S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujf0p-0007VQ-0r
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 14:21:03 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91fbc4b2-72d0-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 16:20:58 +0200 (CEST)
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com (2603:10a6:102:322::9)
 by GV1PR03MB8766.eurprd03.prod.outlook.com (2603:10a6:150:89::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 14:20:52 +0000
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd]) by PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 14:20:52 +0000
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
X-Inumbo-ID: 91fbc4b2-72d0-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rl4i+FGJ7rF+7IgC7hg2abXjFb8Kkt6y5k1mY09sbx1VN0TXqbbrKum+9oG11xKdoWpM5KGuXjKkuwqZsu+VX3OtUnJV+j1w737QUTHwH/6Gv3n7Fr2R0rOnAkWUVt2LuOZVvETr+fBTa6j/8MX8DZsu0B6G5mQvVnbGGKTVSyQBYyyyzvtsNBEMle2QhtsnAA+hqB5r5gU5C4N6GxCO8ziVNW9SZqEq8bXpCndeEGGHW3XtWpU3DrvjwyctyZXT+0XVzIJg6H2iiiwIEeWkoqlRHIuJMJm74UrC6nlWz+COJ8dmqpMjmvj2rsw76G3oIihDkv4wbh5Up8SB2Ju+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfoqKA+VOCIBuVCxwpOtphp3Rhg5lKMVj+glYH3KBIA=;
 b=nf1O0vglXftB98v4trbFtk2wvdq96q2d6EINebSgB1L5cNHN4USnqsN/GjeZy+zksugHMHwXzgDuy3EMnYF34+2jjdSFJi8aFnHSTP5eBlZDXbYmbT6lCSC79E/NLyEiqgd/ZcY8u57bnKAL4sOjUq37yb3Rj48Xio/p3XqSLlUcZgyDh+LHiSff/gStWr5pmuXVEuBByUt7HprB+73GV1XaW+lUFJMA/ewA3R1GeJXOzKmmk71ZNFrOESNNiWHerOrQ2zMOpIfPGGDmoEFfbOWuZy+JyctVF2M+boM863hXmYgF6mOpvyZ/7d2do133rHoTwroj6+m++uQdVxDb+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfoqKA+VOCIBuVCxwpOtphp3Rhg5lKMVj+glYH3KBIA=;
 b=K8uvjJa/nSboZwJrWxHWpyJpK8Y5H8r9r5Ywwfze9Dpuv2vuawR9gE8L8DAhxxnj3dsVkVS1KbDKB9ucqPjSZgzBT+Q9j0Me4RkanrVnRiiEC3r827DX4fxwNSu0UwaUQgA4s8e8pP7qzXtdvQFiORqfv1nXb96k0hqV6oPvWZMe43FvilrwCYXOZ2GiLLW1JPS7RInvky9qjkpCIR/EYzQB+seG+4vBLBmOyzF6WrSrbBno9y3I7fvjtr1/d+BVR80aW3ME2/cnm5giPfz0nXI09jSK4CgFfpC1A4d4BrvdQmt94KRkFIo6BrNjNE4vpONEam/oZCQ3RWbIu1NzZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <957eeedf-9737-48cd-b29a-0def3b7c888a@epam.com>
Date: Wed, 6 Aug 2025 17:20:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
To: Elliott Mitchell <ehem+xen@m5p.com>, Paul Leiber <paul@onlineschubla.de>
Cc: xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
 <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::18) To PAVPR03MB8921.eurprd03.prod.outlook.com
 (2603:10a6:102:322::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8921:EE_|GV1PR03MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c25476-fb89-464b-fd6c-08ddd4f4731a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnZwTWlqZDFQaDJ4S2lTSncwdG1RRnVSVCtxclR0T2syclMzaGhJLytQWEZM?=
 =?utf-8?B?M0FlK1lTSGRvRmpQdmp5VE5paWZhMVVMTjh0UWhhYUlwTWMwelFsTTdIUVh0?=
 =?utf-8?B?SDR4YU9VM3ZtSDV6WmdBYzFDUVNYVVVOcUJkaXlVVDNFZlJ5NGtVbzlObCty?=
 =?utf-8?B?bU1sb29jRzI1azlOUzNoUnZEVzc1R29hQVJlSzNtRGRpVFloNk5TOHljaWpQ?=
 =?utf-8?B?ZlN0K3pLcjJtUy9QYlBsRHBsTUdQYXp5OXJqWU1JZVExT2RDTmQvRGNkaEhz?=
 =?utf-8?B?WTJpYWJJQ2t5ZlNRejB3MnVTWVQvMldXYmlOa2pCU1RTN0dUVCtYL2R0ZDJB?=
 =?utf-8?B?ZS9lM3dQMmNHMU00M1orY3VRZW5obFlRcU9JQUlvNUZ0VTRtaStHUmNiUmNi?=
 =?utf-8?B?ejIzd0NDdFdXby9vQ0FGdC83ZE5oK1gxc0pVZTRiUU9mOUJWKzBYYlFvT0R6?=
 =?utf-8?B?dVlXZU1yQ2VkcU5iMmFrSUNJRHVsL0ZKa3FTT3oyM3VUbUFlNVVZc0VDWnNY?=
 =?utf-8?B?Y0luWVhwRzdmYTlNYmpxY2NzSFJOaVQwVnYrNnVMZVIvZEFEaE12ZHVOcllH?=
 =?utf-8?B?R0hYUkJZUmJ6SHBXbUFXYW9udVM1U3FWSHZzYlBIdm5leDgyMDJQS1JMcjU5?=
 =?utf-8?B?aHkvcGpwL2lzV2NRR2ZYSHVFckNhNDJKT1VPWkFwMTB6L2t5VHN6WVBjRUFp?=
 =?utf-8?B?U251eUNBZzVNVXdaa1plKzFOMkhYWXNieTVzMG13eVIvR29ydlZJOStya1VC?=
 =?utf-8?B?amhrTSt6TDNQaUkxV3dyQ2tBb1J6K1oya3o3RVg0MUhDS3E0WFQ1WVVkNlNr?=
 =?utf-8?B?cTYrc3lXckJzb3hGcG9rU1lFclp1cGhvM2hzNlpxSG41YTVISnZXZXVVSnk4?=
 =?utf-8?B?VkhVcVZQbnkzSzI1cEZwa200c3FhbVd6Zld1VjMzakNLM2NabGRDZm9TeFIy?=
 =?utf-8?B?RU1laG8wWEVIay95c3JLbWViZld3cGJ3ZWpES2FzOWNUekx1OWRCU0xwdXRB?=
 =?utf-8?B?NTM1eWJTTjROS0V1M21vUmRCU3pTNWhuNXNCMGRrUTNRKzE2b3JNK2NDd3Y1?=
 =?utf-8?B?U2FhcnpETkVRaklYc1Vud1VxQ1cwbG1xN3ZMY0RJdHljMlNSQ1pRNE05b1NT?=
 =?utf-8?B?YXBrM04wTjNCRDloYTVuN2ptMktQOGM3Zk9ONnJHWFRUeWtmVTllWWxtZTdI?=
 =?utf-8?B?OWVWYVdFbFRWQUtVdGxGbU9HNFB2bStnTnhtM1diam9EQ1hNM1l2WU1TSFJW?=
 =?utf-8?B?WHBqMGYrSzVUbFNRYUoxcDU3d0RPTVREQ2ZlY3JML2d3QWdkRHFzVGZwdWVX?=
 =?utf-8?B?ZmZMYkN4RDVCM2M0RDU5Ykl5RHR3UWFEcERpRFJnQWdZY28zR2JUTU95Y084?=
 =?utf-8?B?d1hHTldTODU3TC9jRnZMOUVJYWUzSHZQRXRsL3dVaEtKTmcvVVY3S2orZldD?=
 =?utf-8?B?amttOE9HYXhEZFZBVVFOTnNtRDliM25CYmpvc3FneTI2YWgwYnA1TlJRRnM3?=
 =?utf-8?B?dzFsTFk3N2VtZjlSY1V5RDFXUFh2N2JXZmYrYnhpd1hqejdzTkR1dGpRTENK?=
 =?utf-8?B?OHV4QmJYS3ZaVnJyT2R1ODd2WndZQmExRWVTY25XekdOK05tQ2pxS2hncDRB?=
 =?utf-8?B?bUxZYUdJQVU2VDA4STFhYmtEWmlwLzFhQzhSSHpTcXIyMGl5V3RoNklFVEdW?=
 =?utf-8?B?SWVvVElDb1drY1dHQ1hwN1ZPSTVnVGcydTJzR1p6U3hXOExxOW0yZndnNmpv?=
 =?utf-8?B?dDFWbUQzRi9VV3AzTC9aOHdGOFUrQ2I1Q0c0Tksxeis5YTBFYThYZXpieU5V?=
 =?utf-8?B?VXYvNlJQcHBROXpjeE9xRk1ucXFmNVNwUThRVGtHeDJJNWp4N1ZnMG5WbUpE?=
 =?utf-8?Q?8jb3MadYWYZVm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8921.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0tBeDhmbGFFNzNvRFVuam9JTzVZcUtPK2kwWWF3WWpNS2I4SElZRVdmWjNY?=
 =?utf-8?B?MU45aDBua0J5MkQ3TkUvVU9aMTNWRFZERlZBY2NzekFML25ockhDaS9oa2Rp?=
 =?utf-8?B?RFBtNGZTamgrZ0VDZlhOUmdOTktGZnEyNWh2d0xobW5ISnptSzJWR2pTUUJF?=
 =?utf-8?B?eHNVaGZCK1lYUUVid2crckFBazhIR05xZ1NwT2s1RTBPSXVELzNaWWhUeDV6?=
 =?utf-8?B?S0JuU3RJUVphMnFjNFpTM1JVNW9ZNFJUMi9TMDN3YlBNQU83d1pOMGViMEFZ?=
 =?utf-8?B?bkkwNUV0QXNVcWc0NTgvbG5YeWFPNnVjeDJzZG5BN1hmWDlVVk55SldCVVV6?=
 =?utf-8?B?ZVl3cGNWRTNLSkF5MkR4aTA0d3hlOGVZTHZFdSswdkpyTmVTclF3NnAwd0Nu?=
 =?utf-8?B?UncvT2QxRUxhVHNIdnQvMTVVZUcrcGRJZFhnNU5zbGlZR25NbVZOeXNJNE02?=
 =?utf-8?B?QnppVGtVS2p5VWVNR3pObjZFYVB6VnBzU2VVUDFOOVBmR3VXbXpJUStZOFl6?=
 =?utf-8?B?bExtb2tmQ0p4TXdMdlBjOVNpdG1uYUpLOUhicTVBTEVNMURpdjRWV1I2UDNv?=
 =?utf-8?B?NUpiT1dCODFlTUhMdHNDV0V5Vm1nSnhyRGV3Y3Q5ZE5UNnNnSHFHNlRVSlJ4?=
 =?utf-8?B?dVcrKzdPR2I4ZjBFTW15cFBkSVF5dVFZNFE2T2JKY3BuWngxR0k5Qk5VSWI0?=
 =?utf-8?B?am5IR1RTUExscHQ0UzZMdEc3amVna0dZVHQ5ZE5OczdZR0VNUHR4QmZxSllv?=
 =?utf-8?B?VlU0aVhwUWQ5bWZ6VFluY1NHcUdTa2dnaWthYUUwVVdzRnVDaTZlbHd2ZXRP?=
 =?utf-8?B?U2VKODl3a0FvbXRjUmN0L0IxQWkrOGl1dEZoaExsZjh4ME0yU3FGUXppQkhP?=
 =?utf-8?B?YlZrMU84WUtUZk1pSjFzNEZIWTdPMURZNTMrUmh3UFgwOVpqVU0wUkhKMmxj?=
 =?utf-8?B?VTQxZjBPQTdZajBnOWlwQnAxMmtnSnF5N3hZN3BaNTdNRXJZSDUyRHQ1czB5?=
 =?utf-8?B?bkxmSTV4ZmM3R1NWbEhtRVJkaml6dlZOdGFvdHpHY1ZKOHh5YXdSN1IxcWF2?=
 =?utf-8?B?SFJwMGNqTk9vc09zV2duOTE4L2lEa2hsMytwaXowMUtqVTVUdXlrT3RsSXRh?=
 =?utf-8?B?dnhXYjFJK0JsQUgxV0FxNFhFc0thaHFlakdNTFYvSmsvMVRQZjRwVWE2R053?=
 =?utf-8?B?Y29GK0NhNTRmUjNzbEJaTitOUmtSN3VmNkIrRVhZM2pCKzdvNCs1bHdYdU5l?=
 =?utf-8?B?dC9oZGxTUTIycTBQSVB5QW5ycUpEYjJWdmlSMWw4akpRQTVSdmNNM1Z2RzMy?=
 =?utf-8?B?b3dndUJuREgvQzE0dGhzeHdBeklML1Y4emUvaGJETkpucVRYM0RnY1hIdG1y?=
 =?utf-8?B?amQyNGxOM0ZhbzVZaXp0WENNVkdhVUVuNkRhUVdkWXFHelVlYk9ad2hHK1pJ?=
 =?utf-8?B?OUJ0YmRaWnI3WDZDQjdSRGlaZlJtcmc1SThOaEZkbFgxM1Qzc0l3RUx6bC9Z?=
 =?utf-8?B?SElOTlp6Q2l2OUhNRTREcHhrd0lCR1VRdnF4bFNYUmFXNkFyZzQrMkFjTThZ?=
 =?utf-8?B?bktzZnFCbTR0bmc3UC9DeDFXbEgwbFBVS1BpVmVPNHdKb2hWaFgydEFtVTZz?=
 =?utf-8?B?WHFBUVhCR2hHREtJTDhGM2hzZnhqZG9id0tzb2poNjAwWHdQdktKSkh0c1hB?=
 =?utf-8?B?N3dQRklXdFg2MzRGR0cxV1hwWnUycWtSb2MweFRnSk5BK0tMNFJtRGVIWEt4?=
 =?utf-8?B?ZmI0U0pXNzg4VU9tcTdrR3l5S1FiQlEybU4yQmxMSlJORE1PNkcrTDF3WWRw?=
 =?utf-8?B?OElYY1pHczRTbVFmenIxZ1c5ZFJvYnJjdnpYOE12cUFjdlpkSUlxODZIUFps?=
 =?utf-8?B?UkVLTjdjUWRQZkNCaDJoRzdWT01iQkhwZXFlcXJnT2p1b2JRNEo4dHRScTlr?=
 =?utf-8?B?bnBheUVuSFVDL1dteXJuQXNHaUZaN3hpWkRPWjNyVjUvS0VPUE9VRnd3ajl1?=
 =?utf-8?B?N3Nwc0tjZ29pQTZKWW1sN1JZVW1GTFpXczRweEU5eDR0MXk2djhzU3dKVkhI?=
 =?utf-8?B?NUt2R1BLRlhDN3VtekEvR0J6ZnZpQmRYUS9qai9DMEY1aCs4dTcxeGFKaHZN?=
 =?utf-8?B?UzBHSFpyanpHdjVraVhiV1dWc29ETnkra3M4UmdKeXVXKzlMd2NtK2tzZWxt?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c25476-fb89-464b-fd6c-08ddd4f4731a
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8921.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 14:20:52.6355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSey04DQM4DNPfdMzQ5r8mmAbtICOJHVdsDn1HvyMwRHiITlmfMH2rhK8GCjgqeooUA9DPZc0kDfj9DhhqtaVHR5MU5AZh0vGMeecLVM3a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8766



On 06.08.25 07:30, Elliott Mitchell wrote:
> Sigh, resending as I lost some of the intended Cc targets when originally
> creating the message.  Sorry about the duplication for people who have
> already seen, but I thought this might be worthy of wider discussion.
> 
> 
> 
> I would like to draw the attention of a few people on xen-devel to the
> thread which occured on xen-users recently and quoted below:
> 
> https://lists.xenproject.org/archives/html/xen-users/2025-07/msg00001.html
> 
> On Tue, Jul 01, 2025 at 10:01:13PM +0200, Paul Leiber wrote:
>>
>> Unfortunately, I don't have a direct answer to the question (as is so often
>> the case, due to my limited knowledge and experience). However, I am
>> successfully running Xen on a RPi 4 (mostly, except for some VLAN related
>> networking issues).
>>
>> I used instructions in [1] to install vanilla Debian on the RPi, including
>> UEFI boot and grub. I then compiled Xen with expert options and ACPI
>> enabled.
>>
>> I don't know if there are better solutions. For example, I suffer from the
>> fact that I2C doesn't work when using UEFI boot on a RPi. Nowadays, Debian
>> provides their own vanilla Debian images for RPi and with working I2C, but
>> these images are using a different boot method that I didn't know how to use
>> with Xen.  So far, the procedure described above seems to be the easiest
>> solution for me.
> 
> 
>> [1] https://forums.raspberrypi.com/viewtopic.php?t=282839
>>
>> Am 30.06.2025 um 12:35 schrieb Sumit Semwal:
>>>
>>> I've just begun to experiment with the Raspberry Pi 5, trying to run a
>>> simple xen + Dom0 setup, using uBoot, and the bookworm based Rpi
>>> distro.
>>>
>>> I've tried combinations of the following setup:
>>>
>>> 1. prebuilt Rpi5 kernel + dtbs, and have also tried to build them from
>>> source [1]
>>> 2. Xen from upstream [2] and xen-troops [3]
>>> 3. upstream uBoot from [4]
>>>
>>> but with the same result: [short log below; I can provide a fuller log
>>> if needed]
>>>
>>> (XEN) DT: ** translation for device /axi/msi-controller@1000130000 **
>>> (XEN) DT: bus is default (na=2, ns=2) on /axi
>>> (XEN) DT: translating address:<3> 000000ff<3> fffff000<3>
>>> (XEN) DT: parent bus is default (na=2, ns=1) on /
>>> (XEN) DT: walking ranges...
>>> (XEN) DT: default map, cp=0, s=1000000000, da=fffffff000
>>> (XEN) DT: default map, cp=1000000000, s=100000000, da=fffffff000
>>> (XEN) DT: default map, cp=1400000000, s=400000000, da=fffffff000
>>> (XEN) DT: default map, cp=1800000000, s=400000000, da=fffffff000
>>> (XEN) DT: default map, cp=1c00000000, s=400000000, da=fffffff000
>>> (XEN) DT: not found !
>>> (XEN) Unable to retrieve address 1 for /axi/msi-controller@1000130000
>>> (XEN) Device tree generation failed (-22).
>>> (XEN) debugtrace_dump() global buffer starting
>>> 1 cpupool_create(pool=0,sched=6)
>>> 2 Created cpupool 0 with scheduler SMP Credit Scheduler rev2 (credit2)
>>> 3 cpupool_add_domain(dom=0,pool=0) n_dom 1 rc 0
>>> (XEN) wrap: 0
>>> (XEN) debugtrace_dump() global buffer finished
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Could not set up DOM0 guest OS (rc = -22)
>>> (XEN) ****************************************
>>>
>>>
>>> I'm certain I'm missing something, but before I delve deeper, I just
>>> wanted to ask if this is a known issue, and if so, are there any
>>> workarounds or solutions available for this?
>>>
>>> Any help about this is highly appreciated!
>>>
>>> Thanks and Best regards,
>>> Sumit.
>>>
>>> [1]:  https://github.com/raspberrypi/linux rpi-6.12.y branch
>>> [2]: git://xenbits.xen.org/xen.git - main branch
>>> [3] xen-troops https://github.com/xen-troops/xen - rpi5_dev branch
>>> [4]: https://github.com/u-boot/u-boot.git master branch
> 
> Ultimately Debian is choosing to leave most defaults alone.  So far the
> Xen developers have left CONFIG_ACPI defaulting to off on ARM*.  The
> Debian project doesn't have paid people to support Raspberry PI hardware,
> despite being rather common.  As a result there aren't any official
> Raspberry PI images, but people associated with Tianocore have gotten
> generic images to boot on Raspberry PI hardware.
> 
> I'm unsure of the likelihood of getting the Debian maintainers to
> override the default.  Yet due being by far the simplest way to install
> Debian and Xen on a very common ARM64 platform, perhaps the Xen
> developers should consider changing?

Information about our experiments with RPI5 can be found in [1]
and demonstration project [2].

Seen no issues (except no IOMMU as platform is closed and no docs/support).

[1] https://github.com/xen-troops/meta-xt-rpi5/wiki
[2] https://github.com/xen-troops/meta-xt-prod-devel-rpi5

-- 
Best regards,
-grygorii


