Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAlwHjTgiWnGCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:25:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE6A10FA3D
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:25:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225357.1531841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRG0-0001oZ-PZ; Mon, 09 Feb 2026 13:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225357.1531841; Mon, 09 Feb 2026 13:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRG0-0001lg-ML; Mon, 09 Feb 2026 13:24:52 +0000
Received: by outflank-mailman (input) for mailman id 1225357;
 Mon, 09 Feb 2026 13:24:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpRG0-0001la-0Q
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 13:24:52 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b32702d9-05ba-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 14:24:46 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB5988.namprd03.prod.outlook.com (2603:10b6:610:e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Mon, 9 Feb
 2026 13:24:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 13:24:41 +0000
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
X-Inumbo-ID: b32702d9-05ba-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rb2nQYB+dKXb6bAPwFonecCVAAnowaYNyi0bLqlBQukdl5DkfTyifTodokbfq7uvliyicZnjMo4w62gZZJo1U4/T0AbwsOjINPBcsamwXf7piUwhxIAoE92wLf2Qq6prShkCnW3QrLSTob7XWKqWvwcQSNOlsHQ6Foj7dlgiH4PVwrm3sw20r9b1z7wlstz71oUCmoOntqW/x3ZR2qYQv8kENPfq+GsaBe+HNakoGMyTQBmAh/V4oXOXq/kOmPjniPQWX5xz8CQmMVDGW8rHHbojg/97EltBX+ubFHSakOS4/L306GXp9IOu2jAYsm+Gj5DPQMBRT9CarHvJHtvKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoVbc0gaZd5O2MY9McQsMrm1n6Z6VVG6a57IlbJK9RQ=;
 b=bWj8AGSiQGw1qp5m4ulbI0dbMDLVtMm2jI4XJrPhhfNm1hyRT+KLpwKKHru5s1ctAlIVo7OhISauWvq70CP/o/jIFdRyMkg1oV3SKs932buMGO0FCKHdBCkOImtjMriBczAz0YDyHFCLFdQjGQxr9rC9W+62iKqHlx92nP4yJUMoQ9/s4NP9MfEmKvktBN3CWtQ/tGdmxPpky89dPFrMRpXS0X55oujL2C7ZbBtD4Hq3LTUu1UEHb4Fy6tHwxHE0mmFbfmmMQpprizVYOgJlFqvi/P6obGBcjylQuCD77uhAHfQQJ5ALz6mJrea4K1D5Je1I5G/Y4L163r3uN+fmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoVbc0gaZd5O2MY9McQsMrm1n6Z6VVG6a57IlbJK9RQ=;
 b=TrutoUoTXwrDpa8R0PAnqhGAV5FHJLqb6ix2APmZM6VfTtEGOlEA1ooF0y209FzdBcXFtL0Ptl1L27zXYf83IeA+oY30rfpXwvZqPw1vFkG9l9zu/ZvRpVexRrTblkOlOrrIG9wlHfLzMajrSSO282oBjuyIB/vQawcItgm6cjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 14:24:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: Add x2APIC topology
Message-ID: <aYngFiaRQ-J4i0fN@Mac.lan>
References: <20260209113721.2604894-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260209113721.2604894-1-julian.vetter@vates.tech>
X-ClientProxiedBy: MA2P292CA0023.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::18)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b5ab64-7a64-4597-6a26-08de67de951e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmE3TEFNVStmZzJLVEZqY0d6bU1wYlRzTXBuSnFEUkYyOUNFUWFDUk9xbUhD?=
 =?utf-8?B?UkV4YjBEUTlweXlwcHgycmxPL3h1SmlXVjdiTmtVSDMwS2RGVDRGdUhCR2k5?=
 =?utf-8?B?VUZNZ3lDZkVSM1FVRmtLSisvUjBkOUxVR2dhM2hoS0JxTEJnODBtc0dlYXlu?=
 =?utf-8?B?eUZaYlRrOGI5MmZYd3pYUk5GZzJQUkN6S1FXTTZ6YTVTMHRxN2lmMHdZSDVn?=
 =?utf-8?B?ZC9ybnp3bVBqdjkybVVzSXRsc0RSZngxZ3ZvWXRnRmdwdmphY0ZnZlFiRS8r?=
 =?utf-8?B?T3grRlN4b0IweDkvcFc2a0NjeUdHU1J1cHhUQnEvS2c5aU9Cd1lkYXgrRnBU?=
 =?utf-8?B?R0VMT1U3SWtibE9zQ3FmUTR2YVp4WGVCUnIrUERmYlhQUFhOVXNGWFV5V3JD?=
 =?utf-8?B?U0VWTFBtYmhvQmt5VWZjdWNsVVR0WlV5cWlWbVcwa3hNYWZmejdpcjc1SERl?=
 =?utf-8?B?UldHcXFBZWR2amM3elhWdS8vdS94VHY4b0xBeE00d2p3bWlaV1pBemt1NHV6?=
 =?utf-8?B?RzVydHQ5WFYraFQyc0k0RWJOL29yd2hEN2RTTFhwMWF3a3hHM2FNbkV3QTg3?=
 =?utf-8?B?Qk5tckdRdDdhU2l3c1NtSWRkMVlhN1dsaUxGbGxTNjhvYTVTQVBCNEdweVhp?=
 =?utf-8?B?c1U5UEdkb1F5WXJJK00vVHFCM08xUHdBOXh4Vk11TnY1N3Z1bmEzMEI0ZE5R?=
 =?utf-8?B?TUZBb2lBeU42Qkx6R3RaSUtNdUh5aFNoZHdYMUI0bzU5d2xiK3ByMzdJSFVP?=
 =?utf-8?B?M29IRVNzRVRoWityems5Wk9jSmRVbWdwN1ppL2xsUXJ1Qk5uMGJ1Y2VHVWNm?=
 =?utf-8?B?VDUwTmkzTkY3d1BLRzZOTVlMdlFIWnRIam5vd3lIcHRtL1doblhlRG9pd2Jw?=
 =?utf-8?B?WTd0NnNMM0t3R3ZjTkJIQ3kzZG40SDFKRUFyWVRMemFhWjVtTWFDdk9HM3p0?=
 =?utf-8?B?ekpISXJTcmRJZ244QUI0TWF4ZHpjcDRFbng3eEwxWkp3VDJ5V0ZUemp2TFNJ?=
 =?utf-8?B?aGFwbnFyRzNiV1ZWVHZNQnFEMVIxem1yam1TT0t5V0xHODB2MzNlVzRjUjNo?=
 =?utf-8?B?RE1mbUFMNlZNVFBWWkJTSFFXdkpzRGdWczBxbGtQMTZoTHMzQ0w2OVVYYmkw?=
 =?utf-8?B?aml5VXhUb1c2M2cwTUlTdmd4TEV4Z2FUZzZzODBWVGRtanVJYW15TElITFY4?=
 =?utf-8?B?dGlpQUV1ckdiY09nLzM1M3g5ZnRNK2krUTJranRwTlpqV0hxSlYvajVxWlE5?=
 =?utf-8?B?QTcrN0V3anBFWmlxR0t2TmExZGhreGZDbm9EZjFucUVnNU5rZFc3cHB1bnZV?=
 =?utf-8?B?RjN3dmh5aVpxcktOWG1iaUFxZGRKcnNRSURuSTgyeE5ibmt4bHVMME5kNmxF?=
 =?utf-8?B?MGFpWktFbG5uQk0yOXh0ZEVhbXJOVmhBT3lnNU9HeFlVcXZGWkRHSkNhcmhV?=
 =?utf-8?B?Z3lveGhqMXdhZHcrMWpUYm9naGlCSG9wbXJxMEhOSEg1a2RoUHZqS0JpVXBK?=
 =?utf-8?B?UTlqK21jMnEvaXJnbnZJRC94UmJ2ZmgxQXVwL012QVI2UzdyZlk2dExKWU12?=
 =?utf-8?B?SUg4MDR6cmM4SVdTdGx4eHJVRWdvd1NCYU9BcUR2RU1BbXlZTkx3dUpnZ2NT?=
 =?utf-8?B?OEFRektkR2xmbm9ZbUV0Z1BDbTlmN0FOSTR1eWRjbDJ3MDBQdC9BOW94Q2ZM?=
 =?utf-8?B?TnpLdmJydmROWE1HT2lHTVRFNm5SSkhHS0RnaG1NNmxZN3pzQlozVDVyV1VZ?=
 =?utf-8?B?eHVKUzRFM1VYWHU0cXluWmN2SlN1VDBTd1VLQzkyWnlmZHRYTDVsZHBDazYr?=
 =?utf-8?B?R2J3NlBoM0kvN3JwQ1BaNmI4NVdZK29TdDBNR0xVVGxabVd2bmNweDF0VEZ4?=
 =?utf-8?B?MzNaYkxPaUJVczdVSGtCWXJja0JRY3lIYjdGdmZrNWY4dkpYSTNuRXBVZG9u?=
 =?utf-8?B?cHVybHNjemxqR05Vd3JqbWJtQit2QXhrTFozeWhCYWV0R2UrekV6YUZSVWRm?=
 =?utf-8?B?ZmJtTjBEd1FRTEhVNUhPVkR1SFlKZFJqK244MkpzUFB1N1hIYU44NC84WVZv?=
 =?utf-8?B?YWczeEhBMHh0R3Yxd3JKRzBzWVdGdFN2TU4rbkNKWU5aaXNZRVlGNmVNekRx?=
 =?utf-8?Q?Sv/c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWpxLzZaWDBzc1VSZDAyNEwwZ2twNkRzWWtRTzU3WmpyVlJ1R0dnSVBxdFpp?=
 =?utf-8?B?SitMVDFVKzF5R0FUblZEdENHZ0d0bmtVQVBrOGhwUnJCSUNHeG5FT2hSSkJn?=
 =?utf-8?B?NzgyWWpzK25nYks2NlQzUXhzSit0UTNKOFJuUlNjNGs1bWp1UVIwNDNyT29R?=
 =?utf-8?B?cFhLZHFuZE00SnZ4ZVZVNVdiZkM5OW4yR1h3TXpVNjdkOWhMREVVNFdaOSt0?=
 =?utf-8?B?d20ramFFSExuUU9wRlYwTnBjWkxXVmtacXZneldwZHhpeXU2cU5vZStDZ1hO?=
 =?utf-8?B?ZXphWWRycWZXdDYrQ1J1M1QzbDB5WG53MDE4WHJjQkFXVUNOV3NIelhsbis0?=
 =?utf-8?B?bXB2bW5tUmVpc3ZJYnNlSHZlZmIrM3dsZC9EdSsyV1FKcHREN0xUdG1leEl4?=
 =?utf-8?B?TUVEUXdmdnBMZXFYT1FyVk8vbHd6SFlTWm9xTk8yUlJ3RThFTWFzUjFXbkIz?=
 =?utf-8?B?Ni9CVVRIMm1zVHpyQXRuOE91Uk9HNFdwdWU5NjI0cVNGcnZDS1lvSHZKem5B?=
 =?utf-8?B?S2JDdnhJMEc5WFVJRGhrNTRRbGx0cjd0dEg5a3pENkoxWXIwbnkvVTcxVWVX?=
 =?utf-8?B?cjFoc0lORWh1ZGNHczdSakZ3WEgyUW9lR3dKRGw1S21TdTZiNjhwZThST0Qz?=
 =?utf-8?B?YzVzOVBKbThnREI5Smh6Y3FBNm5qZnNPajBPWFdPQklKUkQxaklDUkV6blJq?=
 =?utf-8?B?enpXd2NZbFBwSDVGR0hNaHVJenFzczU5aENCZlQrQXhmSzVpcnVJdmR6L09T?=
 =?utf-8?B?ZmVwK1JGa0YzZTE5Rm84bXA5UDc2c25EVzZtMVpKazIza0pJajdpTm1nUjhj?=
 =?utf-8?B?TlpCQzZBMjNIOXI2VUZIRXB4WnlqUUREcGtZKzdKRlhFcXlZTEkrcHM2azhB?=
 =?utf-8?B?cER6NlZMWUpiejhya1JDVGZSU1BodXkrQnhmeTdEVjl3Tjk3aWxETkJRa0Fa?=
 =?utf-8?B?b3VMcWdPdlo2M2hkRE5ZMjYvTk1UUVlDcmcrUkJLd01XaFRIYkZVb05iemdD?=
 =?utf-8?B?N3ZtdnZmZXg1KzFKVzlwVEdLa3VhLzFKWEJPQ011UmhveW1SMmRzR01mZXhn?=
 =?utf-8?B?NVhPQnp2ZTFBamliZURxZEozY01FZFdlK0pEU1RiK1ZFdzY3Tk9qeVE5SERz?=
 =?utf-8?B?RVBRR3JxekErcW90d2dTZGRBb2Y2WjY2RzlGK080LzN1dWFyZWpRTGYxMW1i?=
 =?utf-8?B?ZVVPUTBvWEhKWU42WmNsc253ZlFuK2hiQVpFRVFBUkRnbk1QVWNFT0ZvOWZj?=
 =?utf-8?B?eUZ2V1h3WlVxbGg0RThnTU5jdTNFaHJiTUJNZmw3SmtYY09xeThiZ3BMQzgr?=
 =?utf-8?B?cnhrd0hIVmRVeXlTdlJRT2w4Z3lkK2lNOGF2ZDc1QlJxTWoxY2F1K1RTYUFv?=
 =?utf-8?B?dnRadjRpWnYzWTdSbVpDa2RtK281V2xBd1lpVXNEdXFOeTdpcTdwbzRTejc2?=
 =?utf-8?B?V2VaQ3ZtRUJxZ3l2WGIxY3Zqb2RrMUkwSVZ5bU9EV3JiT3VHODFCZzdGazQw?=
 =?utf-8?B?dllFd2h2c2FsWEhSYmdqSWRSU2ZZU3NHOFZ3bFVPUmpxMkd0TjBuRVNBV0xI?=
 =?utf-8?B?MXQzMkM2V3B2RDBaT3FLdU1YQTBkZ1BLMDJsR0QrcVphaHBxcGpzRU5aY2xi?=
 =?utf-8?B?Qnl1N3VSOFhqRForb25JRmlvSnJXQ3pBekxJL2pIcmR2TlFTazluRVB3N0JC?=
 =?utf-8?B?OW1CVlNDZk90djY5elUxVy91RkJvY0pCMzRsTEdTb2RCT00weklIQ0tXV3F6?=
 =?utf-8?B?cTBGWUxDVkprS1dpSmtSMHI0Y3g4UzZmSklxQ0p0eFpISWhpK1NRU25iTklk?=
 =?utf-8?B?SzVGeG9RMWdFQXJxRE5ONkFEdXI4cWpGKzZTMHJ3eUFld2QxUXZySlpFTWc2?=
 =?utf-8?B?R0hpNk5vM2RaeFhXTzc2NlpxNHAvbXlCQ1VvL1VwRXh6WXp3cmlodmVvWTda?=
 =?utf-8?B?NHdwcTFZeHVpWGVaanJXNmlSTVFIYTRKL0ZqOTE1Slhka1dJazFldDBhQ0NM?=
 =?utf-8?B?V1FMRHlyR1huZkhaczZwb0cvWWRCcUhUQUhIN3c1SHdUZzJQZExRR1ljK1gr?=
 =?utf-8?B?MGVPT2MwdGVoM3Y2dk5FRExQS0wvOExUWXQ0RTJCdnp2Ym9lVFlieFBZUkNM?=
 =?utf-8?B?alV2dVJENzZ2Z0c3aWFKbm9lWnY2STZDdkMvUmVzeEQ0OHlSeWpjd3dSRnVN?=
 =?utf-8?B?UkN5Qm8ybWJEcXFkbWFCVCtrcXJQY25JYXlSTmMzbStTeUZGM1FhRG0vdkh2?=
 =?utf-8?B?bTdqUTNBRTM5ZmE4aExVWGZleHVua2VSYUUyKzI0U3NZZ0xCa2JHVDJQcnVV?=
 =?utf-8?B?alJRNDdKeFk5OFpHclpZSUVZTzUvWitKUVRramhzZnpST1JNVWsxdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b5ab64-7a64-4597-6a26-08de67de951e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 13:24:41.7031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Knpyig6/wO5z3sm814iYmLKH0fKCfvxjmwEunJP3YSAv4ULTQIZAgk9Oi84Q+Af0Z1EP104/7+2xV1rV2rLIRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5988
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DBE6A10FA3D
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 11:37:27AM +0000, Julian Vetter wrote:
> HVM guests with more than 128 vCPUs require APIC IDs above 255 (since
> APIC ID = vcpu_id * 2), which exceeds the 8-bit xAPIC limit. Currently,
> CPUID leaf 0xB returns EBX=0, making firmware (OVMF/EDK2) fall back to
> CPUID leaf 1 for APIC ID discovery, which is limited to 8 bits and
> cannot distinguish vCPUs with APIC IDs greater than 256.
> To address this, implement proper CPUID leaf 0xB x2APIC topology
> enumeration. Present all vCPUs as cores in a single package with correct
> shift values based on the maximum APIC ID, and non-zero EBX so that
> firmware uses the 32-bit x2APIC ID from EDX. Moreover, set CPUID leaf 1
> EBX[23:16] (max addressable logical processor IDs) to the appropriate
> power-of-2 value, but capped at 255.

Additionally to what Andrew has mentioned, you also need to report any
vCPU with ACPI ID >= 255 to use the x2APIC MADT ACPI structure, as the
local APIC MADT structure can only hold 8bit ACPI IDs.

Thanks, Roger.

