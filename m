Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9400BD9EA6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 16:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142851.1476765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8fl9-0000Gj-6Z; Tue, 14 Oct 2025 14:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142851.1476765; Tue, 14 Oct 2025 14:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8fl9-0000F0-3n; Tue, 14 Oct 2025 14:12:15 +0000
Received: by outflank-mailman (input) for mailman id 1142851;
 Tue, 14 Oct 2025 14:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BBX0=4X=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v8fl7-0000Eu-6J
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 14:12:13 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4898c57-a907-11f0-980a-7dc792cee155;
 Tue, 14 Oct 2025 16:12:07 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI1PR03MB10064.eurprd03.prod.outlook.com (2603:10a6:800:1cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 14:12:04 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:12:04 +0000
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
X-Inumbo-ID: c4898c57-a907-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkbO89gnUgUV8HYeZmrDe+jaQldmvoTRNZsMedfH1ZNKkL/MHqSHDZKk3bvQbyAAuDSxvszU1qCMByrRTgMMIVNFgmKwPaBLwq4oYTKIzaVmMl1mcTbYav1B/3HkGhi5F+blDQ71U0Ogre8w+6XOqdchhK7kov7yohuXpreg432nTJBhxbD09N9VszerfwKQgPrtyFO8EcdZo3SouxlHRswDTgPe/agYL5diwvzm10BNZ+ZI/g8zfeUyijLCD8S/GESyvcczLmBCSt05Glak79l8WOWPlpuZTKL3xSNKfBmknfLWyqkCPGiOanPi+h0iMeN4SY+CLTyTmAanBYiBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAT6IUttfd7V6Wbp2R8ttI0tk79mm5RZ9yChfc42N5Q=;
 b=pFFMdqjMWLnPENKrSVjPK87xqRRyUO1SKy4kqkiqq1W8VaS2Xg9v123JfyVmBo4J9Ed3yqQ+aaRDt53wjDTYHgbI1We4OOiLTEKMNVHjgg0jh3m1iY+BkM2uV29jps00RseJKohJRH/+HbKpMF1m2rbqftEv114mVHW+SQAZSkFo3NpqyBlJDZSBdBP6if7Fi2VcZ/WiDuoRNZysKzlNoHVJ/6kiBgEf3DaaoD9YdVJf2/YY9UNU98TL7djv8EAeXm6j7IZMHwY07d3WRs3dkZtLupKHHaCKb+Z7YMe6HYvwLZfoXcI3kg6ksOWsP539b5TY2XvZISbK7fyW7iI6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAT6IUttfd7V6Wbp2R8ttI0tk79mm5RZ9yChfc42N5Q=;
 b=eL6lE9JO2XA0CSost7co2zGPMd/MWNtzzD7JHU0tS+RWrrFAkP+NlJfiOeG8NkXIXbkN9RyKbUtqWWm3VpYcTI4DwsKyMan4pn9Q3jmiAMIJIo9x3LFbMaqCM8erQ6aDbCiMFQJ/XfzVUG7rLCmmEXpSf5gPVfOHUEiesBEUSQI7mnOjQQsutjrlj1rAS3AURihZBW+Zqx5cqaqUqTUmvB9uFaiMmjCToJZFO0uC7f8XcMzqBdyC/MDw6qQv34qc9SihYlFIjDjFNcW52d20+01/ngLZ1ktShvJbwP2yHGqCCcUxBBKV6d23u7Q+XtKDZxHstlOpPvHROEZE8Be68g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <2c9297b8-d4a7-4391-8e39-82a2c0245e0c@epam.com>
Date: Tue, 14 Oct 2025 17:12:03 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 3/3] x86/vLAPIC: properly support the CMCI LVT
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <61a05ec1-aca7-4c3f-be6f-1bb053b2cd00@suse.com>
 <4477b803-4941-4032-be83-85cc126ceacb@epam.com>
 <8161d5b7-cc0e-41c3-8664-620988bc399e@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <8161d5b7-cc0e-41c3-8664-620988bc399e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::20) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI1PR03MB10064:EE_
X-MS-Office365-Filtering-Correlation-Id: ce01aaba-30bc-4efd-5963-08de0b2ba70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|3122999009;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXQvZWpwWkZWYVhiUWJWeWZackF5WE5sOG93cG56MnV4UzgzSzAyaGpGVkQr?=
 =?utf-8?B?YWE1czArSDMrNEx1T0s0bS9TdDZuNzRydlZXU1BzNm1QaHpvTEVQNmZzUml6?=
 =?utf-8?B?NmFLTVJPTmlIVHk4UGd0TFIyTjZoVldwWXZWckRzOVVCbmxYbXJOY25DeTdP?=
 =?utf-8?B?d0tWU1dEYzE2bGdUMjdET2h0RTNMelc5MHY5T3dKYm9vV3dxUFczMEt3aldq?=
 =?utf-8?B?SVJKVklXbHRUM2F1TDRGQWtWZTdmWFJMYU1lL0t2eS9sODN0RVhLOUp6Zmlv?=
 =?utf-8?B?UmJlbDNOWFQwUk93RUtsQS9qS0xlcURLWW95WEtyUUlpcCtoNmRyT2ZzWWg1?=
 =?utf-8?B?RU54MUhHakNJNlZkb3VFa3RXUHF5aTlseHpDcHduTGRFZkJpRjRPb1lpcEVZ?=
 =?utf-8?B?clhySXFXbWpQdTlTZ3Z5VEdIYmRRdGo4SmphNXI4QVpzcXZFVkpldDAzRSt1?=
 =?utf-8?B?OGgzOE5OeDRscU9PbnJyQ1M2SDlmcGdCYkRCbEcyTlZ3UHVrUUpHNmMrdFJG?=
 =?utf-8?B?RVBVaGRRa3c0MG5EZ2JPREsyeWZUZHFQdVhuVkdRZkJtZUpUTW9wR0p2d3ZC?=
 =?utf-8?B?SnAwSGJSblZPekl3ejV2bXMxazNQZGUweTFFT2dXL2trMEpaQWlwdkdnNzBh?=
 =?utf-8?B?SnhDeXNXV2Q0OVc3K1FjSGdXaFd6M1pZL3hObkN4Z1ZEbm1DWGhiSVFkR2o4?=
 =?utf-8?B?NW1ncEd1RmRRWFJGNUs0dHRsV1ZoZmhPYktqUUxnc0NZbEhPSytXWVRmYXBM?=
 =?utf-8?B?L2RUSHZBWVNrTHlTOG16WEdNUWxMcjB2T3luNlBPV1BmOU9vc2tuZm41UHZ0?=
 =?utf-8?B?SkxmWFVhTzlEYTd3czBNUzlrVmI0UnRPa2taSkw3aGRmVHRmT3laaW9TSm1s?=
 =?utf-8?B?dVZjaTR5QlZKNWJQcFJaNHVyTEJCVW9QUFdTNGc3UUxkTU9vY2NRTkh2QmZz?=
 =?utf-8?B?Q01SVnN5MjBoVzV0dnF1dmpGa2hGb28xdEZ4K0JXaWcvdWdtSWZ0bERQa1dP?=
 =?utf-8?B?TFJUVk0wZm1BTnZJcFNvQUZZUHpDMnc0MVJFR0ZtWXZoTTBOa3lvb2dJTlo2?=
 =?utf-8?B?VU5iSGY5SWpWVld0N216NzJ2ekRkL2Z2NU5DTjJVbjNEVndrQ3NoenJ3MzBk?=
 =?utf-8?B?S21KOFhGdTk1T1AxeXBESjg0U0JMRlFkR3plOS9vQXNtTHVCTUltL2N6R25P?=
 =?utf-8?B?TGRST0xvU21OK0t5bzFWSmdVNThVUVpUc2ozTGhkRlllTjFEUUNlRGtlNndq?=
 =?utf-8?B?Z21jL1lTdGw4MVlvZ2MzYXpuUkphY0ZRL25wcDJGUUU3NmpuaWdTdTFhZlNC?=
 =?utf-8?B?R0FqRW5BaWU0em5FUzJKRU13aURhL21Xd3BNVjhzNmZMOUdsTUx1elh1MC9y?=
 =?utf-8?B?eFY0N1NFQkZueDA5N3p3eTNUQlRIRXlrZG5SU1ZOdTJmU3o3ZWpwTDNsSStq?=
 =?utf-8?B?b3JDZlhxMitHdjh0T0JsMzlsdWN4VGxjdU9QMjNiaVRxOXNKZkkzcDJPTXR5?=
 =?utf-8?B?VUxrVVBMZnlJQTh4K1FjK1ZXRHh4Y1JsWjliMjA0bUFDZUZ1SW83dnMwTnhK?=
 =?utf-8?B?RjljZzUrZWMwaEhxMEtIUmJ5cDYyQlZFNVV2NVlBdFNBbHlVS2x5TlJDZnpV?=
 =?utf-8?B?Q0E1aEtwcFRueEc0L0M2VDYvbnlpUXZldzh0OThPaThpM0pWdHNoWjZDSENP?=
 =?utf-8?B?SmhhVnhkS25wSElrby9MeFRocDI0ZmVNTmpZeWE3WFA1T0orOU1FNWRuWFZD?=
 =?utf-8?B?eFNML2pFY0xtZzlSU2tpZUppREFXRkMrSCtyYmFuRTJxaEduUnJWRE1SV2Iy?=
 =?utf-8?B?R1hIVHJQeG5qL1VNLzNPYVBsQXRRb1hUcTBVaytvZE1PeFpxNzJIR3IwZVVh?=
 =?utf-8?B?OXhYY1FVR0dVcnRHR1d2TVJOdEttcVAyaXJEK0FVV2syODVIbVZrelA5ZmFr?=
 =?utf-8?Q?jWjlbOkyU2hqAEcQFuFtmxpxns/+OamS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3122999009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejErWEpyUk50dk5NcDJYQUdvYnVjVWZrcjliNlFrbzBvdkowV1d2UFJuV3pn?=
 =?utf-8?B?MEJHRm5MOElCY29TUytHemprUDdxMTkwbEN2LzRYdm93Z3orVXNHVE8zS005?=
 =?utf-8?B?M1ZJUnFrMUNEWjFrNHVUSjVoRytSc3VmV3pVMEdHWnhvczJ3UUVQYnc1SDVt?=
 =?utf-8?B?STVXNlY3c3F6cU0vY0ovZGo2am9XSEtYU21rQjcxckNYSG1MQ21OWE1vNkZi?=
 =?utf-8?B?azNhV3ZuOGgydGh6OXJMbGtieGtRd3pRcEdqN1RRSHhWaFBZTkxnSjE0c1BI?=
 =?utf-8?B?b0NtNUJZbGZyWW12clBqaUV5WUxiMDVmekRvRndqdnRqQXNVbHdCK0hPM2xy?=
 =?utf-8?B?VUhHTHZtU2wvcC9od3VVUzRTSXRDcWJBOVJxUFVZOVlxQkFXRDZmcWZHUFV3?=
 =?utf-8?B?aHpMSmNXTzNPeUZ2UWhRNnB3cndDelQ0d3pJZjhMVDBpaFNyYllVSHhqbVF6?=
 =?utf-8?B?L3oyVWYxa0ZTUlBMd2k4T1FYWGN2bEIyZHdKTEJFTGVkTEdHRkQ0cGhtMDFP?=
 =?utf-8?B?Z1JZN2I5K2ZQR2V4SWI1WS9qaDZDSnY3Vjk1R0tIY1Rnc3g4azJKYUlWUzBB?=
 =?utf-8?B?Rlg0YXRiVG9LaUtKNWhSRVhVYldMa0ViM252NFowY3hWS2lmdHNQbzdGVFFh?=
 =?utf-8?B?S0FrMk1qK1NJeDhqd3hTRkpKUHNrenZlUHU5bkQ4L1RxcU4xUUwxejk5NmY4?=
 =?utf-8?B?U2NFVnR0a2k2NFVrSnB5Qk43TWVUU0d1NjI4MkFJWkNBclNWMExQa3BGejF4?=
 =?utf-8?B?Ym1sU2dTNUd2SHExV2lPZk8yWmdPcEtDbnNvRFpEZDh1NDJMQ2s0V3JmYVhq?=
 =?utf-8?B?Q2t5R0dvSFhNWDBDT0hLZmdjSDRMSExCN0NleGJ2VThqWHgxNm1jaG5mb2dp?=
 =?utf-8?B?RTg0d1hTUFBTcmNTNi9IOXNJRFNWMHptRGp5VmtHOVFCVG5ITHdReFRrUDhO?=
 =?utf-8?B?dGNSWWZEVWtnSkw2NFVOaG51UWFyd25zQ1hhWFVadTJ0VEdaQ0xhTlFtc1pt?=
 =?utf-8?B?M2tFSGM3MUtnd3ZjV3Z3WDU4Tm9yKzR1VWZBV2FRVmI2RnF3MHRBbm9FSFNx?=
 =?utf-8?B?ODJVWE01bGVtK25MRE5aeXNiQ0R3b05pbnRycXlUY2srT1lZL1RUR3krdFJm?=
 =?utf-8?B?Y2RNeHFVQlViOXdNREFVV1VmcWFxZmM2RjhDeE5ndkEzNUl1WUVJa2Y4cGJo?=
 =?utf-8?B?c2NaeVoya1o1M2wxbFJ3MWtubUx6aUFERmp5dDBCOEx5ZEpiYmJzZDR3TDYx?=
 =?utf-8?B?Q2JiNks1TEJMSWd4WEt5UkcwNXlPcW1IMXVETzFhTkt5N3IrQnZZUWRFb21R?=
 =?utf-8?B?QkpqR3F1ZGptSHRySmhUbnloRCt6OXdsUFpCcGZaQ205V216WXFxYzVYejFW?=
 =?utf-8?B?bDhvNmtzam9QNHJYZlp1eWJPNEp5bis5dVdYeWhTV1BVeWh5UFNQK0xoSXFw?=
 =?utf-8?B?R0dYZ3E4VzVzV3NpNnU1ejFCRTBIb1ZmM2RaN0FGbXM1ZjVWNzBNeml3ZFpN?=
 =?utf-8?B?ZHhEeW1QMVNnVERHdWZIZVVWeVM0MVNXY2pZMWNGL0VzMmY2WVJPOU9jVG8z?=
 =?utf-8?B?TVhGOFdhK1VRUHVCQ3Rwb0Y1MU43b0ZVVzZRU2hGZzF3OVBvcHdlV1hYNDFX?=
 =?utf-8?B?eGw1UzFjVW42WGQyUUgwMEt2bGdoNUJDaUJ6YjM4QkdwRk02RzBVb2JWY2g4?=
 =?utf-8?B?R0szVHdSK0wwOE5ZOVlIRkNVQXJRcnJISjdnZFVQZTFmeWpDelNBbU05VWNC?=
 =?utf-8?B?NFJnWDNReVhJdUxneGRRYTM0aFQwd3E1Q0JHTFdxNFN1TVh1SzRhYVcvZ1gw?=
 =?utf-8?B?NkY3R0JQK0o0dDgwQzUvNjNWNjNaN0ZMVDJYOEdsdCtsR1k4U2c4cHhwWDJk?=
 =?utf-8?B?amJCNEdpTlBMUnZWNVcwVUliWlk5a081ZlNOY2NBY2RMckVHM205aGNLZUw2?=
 =?utf-8?B?WkVRR2xjZGxkYnVEOXg3VytkWXEyMTFYaURYcEszRkt6eHdKb0E2L1crYVYr?=
 =?utf-8?B?c2lhMVRsbTFiamUwZjQwanhnT2YyUjR6L1h4ZDdUdkhKb1ZBa1VoeDk2WXFC?=
 =?utf-8?B?QnRYdWh0dzU4OHMrd2dDNXZ6NUR5aUdMbFc3bnB0eEJ0bzdEaUxRbVpwNTRT?=
 =?utf-8?B?OE8xOGpGMEo0ZllpbUlzQXNaV1F6S2F3Q2hsanh1RjgvV2ZZS2lBRmNmdzdW?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce01aaba-30bc-4efd-5963-08de0b2ba70d
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:12:04.8522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDSYOwvSLIX36lmZU5U8LI9Olcdh50YaaLjTTlUz8Ma6dCzqWnXwwlJEAI/XwHbQxTTNzTbAIRU91WwAxc6ozsckLU84Opl71E32FNZ8b8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10064



On 09.10.25 18:37, Jan Beulich wrote:
> On 09.10.2025 17:08, Grygorii Strashko wrote:
>> On 08.10.25 15:09, Jan Beulich wrote:
>>> --- a/xen/arch/x86/hvm/vlapic.c
>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>> @@ -31,10 +31,13 @@
>>>    #include <public/hvm/ioreq.h>
>>>    #include <public/hvm/params.h>
>>>    
>>> -#define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
>>> +#include <../cpu/mcheck/x86_mca.h> /* MCG_CMCI_P */
>>
>> This include... You probably do not like it also
>> It is dependency outside HVM code.
>>
>> I've been thinking about something like vlapic->caps which can be filed before vlapic_init()
>> or passed as parameter, but seems x86 toolstack is considered to be able overwrite anything,
>> including v->arch.vmce.
>>
>> Seems, no better options here.
> 
> Same here, hence why I used it despite not liking it.
> 
>>> @@ -697,8 +701,17 @@ int guest_rdmsr_x2apic(const struct vcpu
>>>            return X86EMUL_EXCEPTION;
>>>    
>>>        offset = reg << 4;
>>> -    if ( offset == APIC_ICR )
>>> +    switch ( offset )
>>> +    {
>>> +    case APIC_ICR:
>>>            high = (uint64_t)vlapic_read_aligned(vlapic, APIC_ICR2) << 32;
>>> +        break;
>>> +
>>> +    case APIC_CMCI:
>>> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
>>
>> Could it be done using wrapper, like vmce_has_cmci()?
>> As this is Intel specific it's candidate to be opt-out eventually.
> 
> Possible. I wanted to limit the churn, hence why I preferred not to introduce
> a wrapper. Such an abstraction I wouldn't like to be a function taking a vCPU;
> really this should be a domain property imo.

My intention was to limit spreading direct access to "vmce" data over vlapic code:

static bool vlapic_has_cmci(const struct vcpu *v)
{
	return v->arch.vmce.mcg_cap & MCG_CMCI_P;
}

Just expressing opinion.

-- 
Best regards,
-grygorii


