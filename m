Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95A0976603
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797181.1207032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogQM-0005pQ-NC; Thu, 12 Sep 2024 09:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797181.1207032; Thu, 12 Sep 2024 09:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogQM-0005mH-KC; Thu, 12 Sep 2024 09:47:38 +0000
Received: by outflank-mailman (input) for mailman id 797181;
 Thu, 12 Sep 2024 09:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oCU=QK=epam.com=prvs=598511cdff=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sogQL-0005mB-5G
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:47:37 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09f0cb44-70ec-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 11:47:36 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C9JWT7020340;
 Thu, 12 Sep 2024 09:47:25 GMT
Received: from eur02-db5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2111.outbound.protection.outlook.com [104.47.11.111])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 41k7x0q731-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 09:47:25 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB7045.eurprd03.prod.outlook.com (2603:10a6:20b:292::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 09:47:22 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 09:47:22 +0000
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
X-Inumbo-ID: 09f0cb44-70ec-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcRTBMo8QFuHNpWpTuiUoA1wOeouSaKrtu2BwqIxIf6H2tKsYCvwuMlbkWxDUTTlq48XRDn/LiCjxwXIU3cNyPH5/HgfdBTzBneoMqe/M5EigPnceekZKCCZ/KF+i7A7yZaxVvqWnYqtkBaw2OYtbMWntOHgEWfcs2H8qx5zZYueCMc/FUjMBb07P0mJwg05dyayXZZ+fekBuqbcvFXVq/v+wst48DA/bpdPUeasY+RoPqcduTctTMsD1hj8pHaOWX88nylEXR0RDWkWI69rujKg5/GLIIph6kbUttrWy+OxLaRAALnNxQ8YFLwYlh2M7EjaWljSX6b2vpIGzaLrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AICW6nljlkrwOhfp7Ts5A5e+chDskvv5BWkSyiF6IB8=;
 b=SmiPraFqimHpsTAV+Z5m4zt5h5mwRxLdTEmGYJcIspV1y/VZ9xyfvPWKd3BrSb29lluEkcKSPYyrmfP/GC8AZckGueSnC3VI+to4PgWyMynshQYokUexd7fIC6zVDCOdRfXJNbHkMC/wgTGkO2DUjS2KM7dgTz8UEzO3RdRetsuoIXumoUAGE+lVp5wCWzw0E4u+vaIlExq2NBbwAVxMwna6WievqcuzWAGgk39IrjcCEXjbPw5K9e4q2yCS1vUx5uw4M8fjyBkiOSb/iN12lh8oXVSkbIESC7iUOIlWJy46OeVFmMbJNvEKWnSb8fVwsnQVTbG8Ev1xYRdluG+s2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AICW6nljlkrwOhfp7Ts5A5e+chDskvv5BWkSyiF6IB8=;
 b=hkJmjahR8ygie3IrfF7R0VJWn2otZ5YlmLbUmvAviGATthNfJeypM31O681JHMW9qln4oPv2ax1pgLy9ghIhTYq8dN2rsKoJwAEwGa2eW3OkCm/R6Hku7BnhIK/6tKjQpDPsZA+J3Hl5fym1NoG2ep6tJ8FJz9rpRt3S4Q7RpfXCRjweTjW9O0fBEwSNWaeTXn8fuz0nKQ23ufn0UIL9mIu/s321WjWqLbYu32zuCxjQlYa/2nV1z1X52hIUMBpcnUXVERifU6GwOcjy88N5WhBHT1g5YvJQElic+wKsokhaPTmIfJebvl1znt8X8rRN2MuV3VY+RhUTfnaqyoD80A==
Message-ID: <2af75a0c-c9b6-4eba-8850-b2a47e138673@epam.com>
Date: Thu, 12 Sep 2024 12:47:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/mwait-idle: add dependency on general Intel
 CPU support
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <20240905160058.493057-1-Sergiy_Kibrik@epam.com>
 <6526365b-fcfe-410a-934a-4e18083ac993@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <6526365b-fcfe-410a-934a-4e18083ac993@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS8PR03MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2403b5-8623-4445-4279-08dcd30fe662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cU5PSnpCVzJrYnozbkxGQ1gyc09HeGtlS2U2bUlkb3FCVkhsZEdGU05ZUTVM?=
 =?utf-8?B?cERaQ3B2UGoweVNRK3VveDBKZVhkU1RXdDk1cldPbXdDYWNqTjB0YStiRWMx?=
 =?utf-8?B?K1pIa2FXUnNLTVpFQjNZcytjd251SkZQZmFIcDhqVnpIRlJ4SVdNZlltRitY?=
 =?utf-8?B?UXAwRkQ3b3A0cjMyUm9KY0ZBb1cwc3M2L28wZTcwOHhQN29vbTBYdUV3bUpN?=
 =?utf-8?B?OFpqRVhWU0VpUnY0YVBiVzloSEtNb1lkekR5NWVGUWxQTmNWazVFSm9CR0Rl?=
 =?utf-8?B?MzJNMEN6TzEwek9nN2d6OGtZMUFpTityNncwNWRhaDE5ZnRocVEvL2ZrTGN2?=
 =?utf-8?B?bUpTZGJBWkZWMUJESVBoZjh3bWRiU1QvSGJ0Ymw2SVBkd2NMcmJRZVpISjF6?=
 =?utf-8?B?bGRaOHlialdjQ0hYeUFLT0xQTUxTdDd6OXhMaFR4SC9UNFMwRk9HYkJLa0Fi?=
 =?utf-8?B?VGlnNHhEWURLODRQam5xSGVnS3ZVeXRSZjBKUGZVQ1F6ZWdMMEUvdGtOSjNt?=
 =?utf-8?B?VjFFNTZmdk9KT3NQTjUzeVBIVFpVcjlZYUdIMm8vTHdrQkJXbjNHRXZDb25s?=
 =?utf-8?B?T1FLK0NhTlhhQU0vWEhLcHBzRzV6ZmtES3hsOVY4Qkl5UVZJblNVOThoSG1S?=
 =?utf-8?B?WnIrdGx4K0wzNzJLUzNyYW1PWGd3ek1GL3paMURhR2huU0tCbXJzZG5RcHB0?=
 =?utf-8?B?dm1xclBOakxjR0lOZ0ZzWnRDaXVUSnJ2R2hONlVyaXQxQjlFWXh3YUxFYkdt?=
 =?utf-8?B?VFZWeEpVeFQvUmoyQ2JrZWlONnBqdzFzb25ZNlVNa3JaQUtzQ0g4UnVwekls?=
 =?utf-8?B?Nk4xRXEycFBtY2h5TFllVTBuSDlWclZoNE9oczhYWEplbmNwUUwvTXFmYW9S?=
 =?utf-8?B?TlRLZ2VKRk9rY3A1TU8zQVNzcTRkQkRaMWt5dFV0SnlZb2xETUI1WGw0Q0dm?=
 =?utf-8?B?b1ovdzNVVjMvS3dlenBubUx1b1JxQjJjTjN6WXIyd21iOS9tbkV5dkNLS2FM?=
 =?utf-8?B?MzVkODhEVzFiMWpHSmJmRE0zbzNScmhaMlNSanZURnlRV01MWmlkM2V2Qlhv?=
 =?utf-8?B?MFg4WFA1eUdsY0txWkJocktmQ0NUUWgvNFNpZHk0QklnaitIdk9tQUFPUThO?=
 =?utf-8?B?VGV3Ykk0QnI0V0dhV05mVW1XamtlTnFDbVcySUROWW1aRGRocGhhVklESDBT?=
 =?utf-8?B?MkY4TWo3RUpHQ2diWU9YYUVybjBSTzdFZTNqK3BjNjU2K1d4eWdPVWNRdytw?=
 =?utf-8?B?T2xIWkp4VG1VVDIrNlREVVVpQTk0eHBsQy9sTzlQTG9JTU95NGdoam42KzZ3?=
 =?utf-8?B?eHdnRmpmSEJsdWc1U0ZIbG4rWDNFbWVKejdUbE5TRkUrQnArWStNem5Ta3R0?=
 =?utf-8?B?dlpndUxhbnA3NzgvSXZNVjdoZVFHTjg4dEFKWEl1ZDhyTjN4UFlmazdIOStL?=
 =?utf-8?B?YnFhNnZBcjYyYlNhNGlmSmNKcEVHNVBmbWdHTzZkY0pPdjQ4ZVhHRk9tSzVL?=
 =?utf-8?B?SExaeXZnQWswMDFzWmVkYnR6amlMZXhtMUlhd2tmdnVob0FtdGRVTE1ydjRG?=
 =?utf-8?B?bGE5VUF1dHgwdFpEMnBQd0QxVkJ1dVhDcno3UHV6WURaT1JlTWF6SUlaK0F5?=
 =?utf-8?B?LytFV1pkR0JPeDhqOHE3USttdHhUM3hEclQxN2licUZvTlRjTkFwbG1UMnpJ?=
 =?utf-8?B?REErU3A4UHVwUk04MEFRUngzalRPekdwMEJOMXpaNjgwanhUMFF1OUlEejFP?=
 =?utf-8?B?bHdQYTAxOVFpd2pGNU1URmJYWmx2eWFpeGlFRXhYSTZYYTREbGJMdHdTNnNw?=
 =?utf-8?B?REFjUTZNSDZnZjBlemNEZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elRRemt2aWNNeExrdEpxVElPc0RaK2RZVngrNnNxNkJrNTZUc01CSTV0SlZC?=
 =?utf-8?B?MXZIUGcydEIvOE1ONUJIRzh1TWI2NFBsUUJqS2xzQ1JhWDFlRGdDRUQxRTR0?=
 =?utf-8?B?b0tMUUpXT2tiZWxRbk1rSmswY1VJMmR2elE3Zmc4UCtWUG9mZUFvY1Z0c3Bv?=
 =?utf-8?B?ZDJIaUdUV04zaGlQT1plc1lPTkNhTjdJemsxZlF0WkNTTnA4TVg1QWlwZGJM?=
 =?utf-8?B?c0pnUmpFYUFLTDJzcFZMRS9ScURJOHVldjdiNVc0MEFFK3hFaFQ1Ny9OQyt2?=
 =?utf-8?B?c0ZNV3hKSlcyQUs2amcrZUxYZ1M3ekF6WWZoTkpndklpVTdZZ09ZUzB3Ymhn?=
 =?utf-8?B?aUpFWVpIWTB1OGZnRFF3a2Rjek16T2xSa1hHY2RTWHRoQnFnN3VKMm1YUnM4?=
 =?utf-8?B?ZlBWemZBRCsxYkVlVG9tK2NOaDlNMUFTUC9nNUs2c0VSNitHVUZ5K3R6RUZX?=
 =?utf-8?B?d1pKN3pkOTgrZ1JNbVVUZDBGV0dNVGdqOXdQOFZjWFB6YWc0SGxjU3pnRW9B?=
 =?utf-8?B?YkxmSkF6c2dvNU83L0ZrV1Fub2NIT0p0QThQMHZLbGZPYmlFbmpiUS83OUVU?=
 =?utf-8?B?aGk5R0VSTHhLbmx1blNDOENteDZELzdJa1VOZFhUYmFnc2lwTmZaU1VDaDRI?=
 =?utf-8?B?czFuOVlxS0NpeDlYcDRoek1odGlUOC9CY0NBeEdYQ3lCaHhEbmUrQ00yL0V4?=
 =?utf-8?B?cGdMbGE2SU9YSG5lei9qejBUQTYrYUJRdlRscnk0d2xJWU5WZm16c09Sdmlh?=
 =?utf-8?B?VXFOS2cxdDl5MDE3ZUFRbzZHeDlNRm1sUDJwTmxKSml6RFNYRHI0clN1Sm9O?=
 =?utf-8?B?YzR5QVRRNDViN3pWTHNoVENySDBMSElsQmhNdGRUUGhaU0tKRXQva0VzbWVs?=
 =?utf-8?B?WUhZZngzbU5kc0NteHpGRHcxa1VqVnE3NEN2WUxKUDdaUDAwSXY1azcxZUlN?=
 =?utf-8?B?Qk1HN0MzWkRTZmRkSWZkVHZMcmdFR1BNU2Vod3JyVDhJaEJWaXVRcjVOTHNa?=
 =?utf-8?B?TlJaUzBXZWY5UzB1QkpVUWtaM0hVQ2VOc1RRU2s3TnFsWW9COTZzV0lSVHZk?=
 =?utf-8?B?MzZ4cC94eUFCVFZPdlM4bTFzM2xDM0RwWlNtRk5xVm9PbUIyWGgxRWtSZnN5?=
 =?utf-8?B?MC9Jcm5DR3JRaURXN3RxZDd6SDBIdVQzL1BKQk9ZRDFEM3RpVUYvQkhCNldT?=
 =?utf-8?B?QWZYM1pVVWFwMUNyNkhIc1hnSjA5dWQ1bHpuRThtY2tEc0JWOGEvK0ZhS2RT?=
 =?utf-8?B?bFZqQ3o5RlFoUFRPeHNaM2xBKzV1SGUwS1cyc21TRDlURm5USVRPcGZFb21i?=
 =?utf-8?B?eURiSFVnK3ViQmcvVkNQaHlUNmVkenVBaUpkdGFmN1IxV0NzUWc4c0hIb1l2?=
 =?utf-8?B?Q2VqY3FueFI4LythL0NxKzZkVHIvL1lISDMzUTJvbmxsTncvM2VzQVJRRkVD?=
 =?utf-8?B?ZnMveW5YWDVkU0lMOHRrVzlDWkZSb01LeUZ6WXd3S2NoRmUvcnp6emg2dzFK?=
 =?utf-8?B?a2o3ZGxBTU9TNEc2QlRjM0xSRXNNV2NjZmdaSEVQRlduT0NldjJuV09SRzdB?=
 =?utf-8?B?V0IyOVNuWjFIejBDbTlHZ2tOUG9TNzBmd0xoMDRCTlBYZWV0anBGVEVWSXB1?=
 =?utf-8?B?RDlMOWRkUnhlY0pzM3phZTkvU3JKNFFhK1RydGtBOGI2bDdwR2krYkdTKzNB?=
 =?utf-8?B?QzlpUWl0MVF2RXlBYlNaUFpEN2k2d1NFZklyK0gzVlIyZEl0VEQyQno4ZmJH?=
 =?utf-8?B?bmYrejQ4MzM2bmYrV0ZWVVJDeFJFLzRla3BLbnBEUHZSeDkwMG9ROWRVREU3?=
 =?utf-8?B?cUYzRC8rWC9pTG9NY2gyTnVJQnRReUd3MWRqWURlQkxqUzlwTkFZU1hNU0gz?=
 =?utf-8?B?MGdXNWIyYjVaR0hXUmZyd0o0QXhVZmQrQW5kMEwrUGRjdm5qcjljY3ZJVjFX?=
 =?utf-8?B?VlNwWDhRWHRGTmQxVklOM3ZOYkwrWXNUMWRBaFRNdDQxd1JCWVk4ZjM1S3RI?=
 =?utf-8?B?ZDYxQStYbU01a1V0czR2a3hYUm91NXBCTG1QOG12bzd1VzdpUG5JWFFMN2NX?=
 =?utf-8?B?VDErcnVVdlZJVjVKNW5adUZsSkVyYU9UTEZRNlRZcFJkQzR2Z3p2STBMSzgw?=
 =?utf-8?Q?L6/dgkRuf740ClUMglbJgKg40?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2403b5-8623-4445-4279-08dcd30fe662
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 09:47:22.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YGEtQxjq3QCxBRbXUcHg2RcriIBHIUKhSZVA9jDUnr/77Re61gCyi1+NE4qAW2h3dsb3kw3UQQfFm/ZimkSog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7045
X-Proofpoint-ORIG-GUID: -60WvB-kCnMbNuW3rGS4XbfwFOHOOuyU
X-Proofpoint-GUID: -60WvB-kCnMbNuW3rGS4XbfwFOHOOuyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409120069

09.09.24 17:28, Jan Beulich:
>> --- a/xen/arch/x86/include/asm/cpuidle.h
>> +++ b/xen/arch/x86/include/asm/cpuidle.h
>> @@ -15,7 +15,14 @@ extern void (*lapic_timer_on)(void);
>>   
>>   extern uint64_t (*cpuidle_get_tick)(void);
>>   
>> +#ifdef CONFIG_INTEL
>>   int mwait_idle_init(struct notifier_block *nfb);
>> +#else
>> +static inline int mwait_idle_init(struct notifier_block *nfb)
>> +{
>> +    return -ENOSYS;
>> +}
> As mentioned elsewhere before - please don't abuse ENOSYS. Seeing how the
> function is used I even wonder why it has return type "int".


I guess it probably should be -ENODEV, i.e. what mwait_idle_probe() 
returns for unknown CPU id.

   -Sergiy

