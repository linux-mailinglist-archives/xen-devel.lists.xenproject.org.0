Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D2B3B9FB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 13:34:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101180.1454353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urxMO-0000PP-Ai; Fri, 29 Aug 2025 11:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101180.1454353; Fri, 29 Aug 2025 11:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urxMO-0000MF-6B; Fri, 29 Aug 2025 11:33:36 +0000
Received: by outflank-mailman (input) for mailman id 1101180;
 Fri, 29 Aug 2025 11:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oE33=3J=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1urxMM-0000M9-AS
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 11:33:34 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe6bd54c-84cb-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 13:33:33 +0200 (CEST)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DB9PR03MB7322.eurprd03.prod.outlook.com (2603:10a6:10:220::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Fri, 29 Aug
 2025 11:33:31 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%5]) with mapi id 15.20.9052.014; Fri, 29 Aug 2025
 11:33:31 +0000
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
X-Inumbo-ID: fe6bd54c-84cb-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUSMpMABNOFNYRECkpDCfWU6WuNbuDZvrl2HOXuGEjYP7wnKtlN2RyAAoe/XXsqKgYa89J8C5PSrUp9gIBd7QeaFPBo8z8ID5YuOH6KEtVDGPdrqLTtrcV3qexoRNKg7MD3RZFA/eoSWPbHsYpsMZFWxC9r/NmWx508ZTlRMJ9nZmNTNzj/iKxJA5fBzVQ8b5BmE+0uwRpam4n1Jg8Ygt75IMvit6/YELQWLK0Ra2FzZLS3Nqzqpoxw3c0EIjsV2XHyM50BlGyRbD/LpWd+OMIQe5R3BK1uUuNOS2kQWOOhwrFEX0bV9YciK3IsGqd4n2kE3XALVSQeaoUA56M2SkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cu5gAfnYkpQbwWuB5nlZDeH0TzXsI0/gEp1DAt75ReI=;
 b=cNa/sJ0GThWfWuRXC6zDyOodsu4TKeiUJI6t+vcLomj1ndSRtQQWuUiqzEOj3fXs/wILXGt8kPDbJg7rfG40/yEwYqY5FQt7R9WeIZF8ShCL1AfqCskzJs8Immug0uTrk6vULc7qC9lmTj/wH29ctA0rBD8s7MoWbYnmJLkwAv1BQvoSOV6RQlWRr6m6l+OCsoNMVsjXnnpQ/unHZoU3/K+OSTZ8c7bREviS6GJ/bsZYXL0U6u6rgesoYlJb3vHPxhcQc55ZBwMJkL2UbSkMBT8lztYXZToV17rDIfDXt0O3LoOtz922K9eR5GO6Quz+VK4A5xOk/3ZEISA0lrF2bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cu5gAfnYkpQbwWuB5nlZDeH0TzXsI0/gEp1DAt75ReI=;
 b=PkeJcBuqUrQy9KhpHK6pUXXCLiCIgfwzAmMfwNsXCDUiadfZv6a/fY/zOIffwel+l3K6BPu58yHzOKeeB9RxvtbmKNnb5IFwVdR0nlW0dJN3rFdCUwGVlVLDXN7vUYlDnRPW+5A2girB2zUuOs4p8Hl0f5JIfN4YbzFmKgQEHgw/fMBL6Trc2S4QmIQiJicmQ+joc4bBrwZjUbfuJsXez6SrBmC3C+diAshhLmbfnfymyNgE0qX0syGNlBIX9ZtQBVti+XZm3dGoKEC2hIrHkF7CqTJjt/VNaOxPjReRsiM8rGQqba8KfpZ79rBNQ/EZhx09WEJyCISZWnUD6k7nsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <1d34d0ae-f3f3-4b25-ae67-6c4f6be2e2bb@epam.com>
Date: Fri, 29 Aug 2025 14:33:28 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] xen/flask: limit sidtable size
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250822095123.998313-1-Sergiy_Kibrik@epam.com>
 <1797679c-582f-4b75-a036-ad3bb00bad4d@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <1797679c-582f-4b75-a036-ad3bb00bad4d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DB9PR03MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 0804c0d3-2612-483a-ef98-08dde6efe12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVpJNkY5QjBlOHQ0eUNjNnNOelgwMElHaFhNU0ZFWVd0d1MzTGEzdDZQZjhI?=
 =?utf-8?B?YUt4V1cxWE9CQUtjNkVNM1hBTVBlaFRua1dkSUpOT1lPbStJSlI3RFpwdnZM?=
 =?utf-8?B?NGpkT21JZDBJOVRpcU5zdkFyRkdlVlQxYXJLWjMxZUdiZWh1SnBxMHVJQVl0?=
 =?utf-8?B?bmJZZktzTUdGa1oranc0V2FGdFpKZ0NZWUVGZDBTVVJtS09JVDk5UDc3TXdv?=
 =?utf-8?B?NGpPL1dHMG1wQ0NRNk5IWG9rUlE0azJrZzlBaGFmL25seVM2WlZOSTNiSC9X?=
 =?utf-8?B?OGlOK0IvU0xScXZwU2lod1A4YzBHU2RScUpIb1NiaFkwR1NXb0VOa1RpSG1a?=
 =?utf-8?B?ZDRFTjBNckJmYjNTNlRnSGlaUXZyUFRrLzN1UDhENDhmN1UrVWlCWmRkWFRp?=
 =?utf-8?B?R1dIQjFIVkhCL01wVng5K2Iwcmp5eDFLODNDTUhCYktYeHNITmhjNExjWnJG?=
 =?utf-8?B?czVsR3JJTlFsL1NFem1BNHhxL1NSdUFpTlV3VEdqME1Xalp6dXNTcjJ0N3FV?=
 =?utf-8?B?YnE3dkU4dWJXcjBLcWpPbW9wbzdRR2tXSlcyR0dZMGJUWFp6ejNJUVBhQUhK?=
 =?utf-8?B?Q1JscE9IeWl4V1lXSGl2RG04cjRzOXJKTkpPQWErbzJlWXpqYkZqdE5BMmNC?=
 =?utf-8?B?TFVxMTBtSEk1eHlHZEZrU1Jqa25QTzBoeFdSWXIyTytBVmJVODRKRmFtaHpo?=
 =?utf-8?B?aHJkZ2FEZmZ2RU9Wa1NKYm9leE82ZnUwdXpOdDIySlN1RXZTMnRYWjRYNjZE?=
 =?utf-8?B?VmNIbmIvVEFSdENPRkVRVUQ5QURBZnJSZnVHcGtiSDNNSEFlby9Nc0N1b0tE?=
 =?utf-8?B?MzMrZklWRjhycnA5SVpKcTg2L0tlRFg5NFBzZTVobStzc2RmUHpOUjJya3p5?=
 =?utf-8?B?K0VOMlg2RDg5bS80bE5zS01WRFBXNC9YdGovN3Yzc3V1V2xLcTJuMm5OY3BX?=
 =?utf-8?B?RmR3UXN0TGUzVFNjcUFxSkt5UzErN1FCRmlxVmx6L1FtLzNJSDZUbkFnZEFN?=
 =?utf-8?B?a3JlVyt4TG1Hb3NJV3YzVjRjSnhMODVJMGdlWnhpQVordWsrb2Z1eTBjOVNz?=
 =?utf-8?B?U2FQcXNNbnYwbE5mcTlZaWVEOTVyY0VpZ1NKT2xzTHBnRHRCYmMyS3RmMWlS?=
 =?utf-8?B?Wm40aWpjd1lqYkUrUHJBNExhd1UzNXRsT05sQTczaE0xM2k0U3BBS2JROHZm?=
 =?utf-8?B?cnZJdWg0SzMyWC9QeXBPUVl6czFST1A3dXJvRUtQR0RlcysvSHgvWGNGbnJt?=
 =?utf-8?B?dnFDZmtydmxCeVdOR21NZFNlSWU4MlNRWGREbXhOUnVhUDlEc3JrTmJkVGxa?=
 =?utf-8?B?c091SEhTNWw1WFhyMEExMkR0cUZHQUhNQ1lJaVVqUENEb1djc1FHWUU1VlFW?=
 =?utf-8?B?cUpDd0QyY0N4NnFZRE5FN0J3bDJyaFRLTEI2S0Z4eXVtZm53N2EyQUJHVERU?=
 =?utf-8?B?T2lGSm1uejFMV2Y1YmRkd3FEU0NHc0xCRU44eSttS21ORnB3V0xmbnF1WmNk?=
 =?utf-8?B?cEN5dkgvUTdkYUR3N0xNYVJMMlVQTUtYQXVna3RlSFBvay9vT3hxdXB3OUFE?=
 =?utf-8?B?SStRWVQwYVM3bFFQRjdwN0NzcHZiNnJTMmdkcFFqdStUVUpKZXBkNXJ3S2FY?=
 =?utf-8?B?QlRoWjZCc2lybGdKMUQ5SkFmT1JMeE5FUld6eU5kTUFNRHdQK0QyaTVlNS9x?=
 =?utf-8?B?M2JEZHVkN0NFK2tmdGRBTDBQaldiRHlHQUxQUUZHaGNBUWhuemVTSGtMUXNW?=
 =?utf-8?B?dWM4Q3BkRUQwQVhhSC9yMGlJK05hVk1Tb0FwdW9mYzQrMUtPQ3ZSbllxYmt3?=
 =?utf-8?B?VEN3SisxRTh0cHhVd21aVE9xeUw4Wk41dlJjSzVnU1VWZXRJTVB3OHpCZTQ2?=
 =?utf-8?B?dnNDNnpSak83T1I1ZzduaVozUGZTdCtmbGNuUTNieHNuQndhNVpsblBQRDdH?=
 =?utf-8?Q?t0nNru3CRnI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE1QMkx1aFZyakpQcXE4TzNKaWJ2NFJrcmV0RzV0TGkwWjJlUzdKOTd0TWJI?=
 =?utf-8?B?a2xzNUtrcGs5enFDTFVYT0dUb3FRbFhyaDZpZWlKajJNVUxteUpKTkM1ZGcx?=
 =?utf-8?B?V1UyeVhXTDhSbnAyNWJmazVEM1R1WXN6Q3c0ZWUwVDBERVFKTnFLTDRpUmpr?=
 =?utf-8?B?Y2dIYk9qZjAwNGtpekpMV3VXelFaRE1Ha0UrK210bFdZQ1NaSkd5QVhEbDN6?=
 =?utf-8?B?UXZnUTFBaXVhN2xweFZaY1kvSXFlaVNXRS9HdURHbDlrR2pTUWtSK2xsMkxw?=
 =?utf-8?B?bkN3MUVzSUd2TEw5a2lUbnk0SFl1MVlOd003VitpZ21SNitqc1dzQ3lOVmFt?=
 =?utf-8?B?OU1xcDJlT2xkQ2tJRW50RFhZTE1xeFVjUk9VN2hiY2xRU1l1L0ZwREFLcnpS?=
 =?utf-8?B?T3g2UDNSSXZ0NlZzbHF5d1dwSGxFTlpmVEhJZGd1aVVhdFY0ZTVSb0F5UC9O?=
 =?utf-8?B?ZzdlVXJXY2tjNmdmLy9FT2lpVVg2TjlSblJSWTlpeldTV25yT1E0K29vbklG?=
 =?utf-8?B?bFdJSFltU3FXSVdBbmNVbDJwTG1Nd016OHFKanVaaVFsMDBIbGJ0blIxQnYy?=
 =?utf-8?B?ajZ5WjVmY081c3ZPTFUyU2t6Q1p6V2tjL0M3bDlobWZzUktldTRtT3VvQVRO?=
 =?utf-8?B?YlBhd3NOWWdPS21kVUI4cEdqWUNISVBHdGR2OEIxZHdGK3FrN2VodmhuZUNu?=
 =?utf-8?B?Vzlkall6MTlobVlqU3YzaHEzOWZVcUxOMkl5T282TENJbVpUYTJXK3NBSDlN?=
 =?utf-8?B?RldvRlRPejI2WjNRWVlnYldTWE1qNXdoM1BBNkhLN1MyUEkvUHRKUXQ0dEFU?=
 =?utf-8?B?alg2bHlBZlB6MVhTaU5JY24zVnpVZ2ZZTTJVTldRdkh6bzBoaU00UkZUMlpO?=
 =?utf-8?B?dnBwTjUwYUtIekduOGJBZ0tFTG1KUXhHSy84UCtkQmZxRXlpRzJLeE83eTMw?=
 =?utf-8?B?d21mMFhZcVhrQ2NxS0RYMG1qUUJ2ck11RGZwTlBVV2YwZlZzdkNZSUxtNURW?=
 =?utf-8?B?SzBWMDFlZHlqdlQzSGMzTjJiVHhOdDJpYlNwdGtldEFQejlWWmM1b1JKcW5n?=
 =?utf-8?B?ZTMrd2VZZ0JOMmhUVWRUWFJQOERGZk5TYXh2Q2RZN3BzZ0lDVjlvbnhjemxr?=
 =?utf-8?B?SXJUVURESkZyRERkaGZQZkc5b1JEbzFTaGRubitOUjRtMnMzRjlIazZqMm5t?=
 =?utf-8?B?OHNkMnhrZForWkZ2UTJoazdtTy93VmU4amxzUmp6WGpNZlFvc1JVeVZkZ2J6?=
 =?utf-8?B?QzIzc2pRRUhXc1h6QUpEaDE0cnZlT0t5VUlaWkl0anlBVWx0N1lNRE9pWG9s?=
 =?utf-8?B?UFg3U0Y2NU5hZDNDU0ZXODd1QWJPUWozR2tLbVVhb3V4RVVkdUhQUG9mdHR4?=
 =?utf-8?B?SEV4cWdBQ2NPcnBZZncrQkNOU2RQaWVMMDd2a2tlQVFtMlFFRVNPYkczMGZP?=
 =?utf-8?B?MTBHTmxVaFYxTzJZUDZFUk1jRGYvYllRUHpSMmF1K001aGN4VFNWQUlsOFFH?=
 =?utf-8?B?NkxXUzhmbWNJOGxCczA0RTIrVy9uU1VQaEE0TW85K0tBR3hScnYrYW5RQW9p?=
 =?utf-8?B?SHNkMVlyczhlRnpJcXZmM2dyKy9yM09MNFJWK21LNXZXT0JSWndiazhuWTM4?=
 =?utf-8?B?VitqSFZoZXNwTU9tTDZnSW9hb25oWjgydG54YUJ6RlB5THJpenk0NTZ2QmVP?=
 =?utf-8?B?amNYb1d3aTJKOGlWbXltSlRaTzltcllrdGpGTFFvL2k3bVlLbWNjREliWlYx?=
 =?utf-8?B?TmJwa3hwaDJlWFNMY3QzcE9zZlRwSE1QcTBkT3JwZTVINlBORUVGanlQaEto?=
 =?utf-8?B?dzlYcWNaQjMvekNrbHNsV2VCZ1JuT0tDRGVETTRSZG9qcXBoOHZZcU5xOW5O?=
 =?utf-8?B?K2RNcm5CVXgvd0VSTCtoVHpjQXZhNWtWS2dWWlVxMkxUeDRFaklRd3FRSjcz?=
 =?utf-8?B?ZkV6ejBwWERxaXd4c1A3MjdoNTZpUklxNC9FOVZPS0pwTFlCN2dMd3ZxcjdP?=
 =?utf-8?B?OGJkYURkRm93eCs4eXlrUzhhYzNkNkViZ1hrS3REZ1hpdm5hck5tUFMxRzJV?=
 =?utf-8?B?clRDTGlGbCtMYksvWWpxYWtqNE80VDNycVYrQzRqQUVMWnBKalBZdkxrbit6?=
 =?utf-8?B?TWJUYmZGYm1JQzR2RUFIM01oVmFPVk9DeHF2bEQzdWJYT0p5N01CUHVLWjE5?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0804c0d3-2612-483a-ef98-08dde6efe12a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 11:33:30.9232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+QcY1FqYE6klLnZXG7eQCnuyYYdoNCQ9agRipiR8g1MxBzFPZDyLhI9NkMFXQ4MNrixSMRK/m6Kb3FhtMbEfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7322

25.08.25 15:00, Jan Beulich:
> On 22.08.2025 11:51, Sergiy Kibrik wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
> 
> I wonder whether we wouldn't better move XSM's controls to a dedicated Kconfig
> file there.

you mean something like Kconfig.xsm in the same common/ directory? Or 
move this Kconfig out into xsm/ directory with the rest of flask code?

> 
>> @@ -418,6 +418,25 @@ config XSM_FLASK_AVC_STATS
>>   
>>   	  If unsure, say Y.
>>   
>> +config XSM_FLASK_SIDTABLE_LIMIT
>> +	def_bool n
> 
> This makes little sense; just "bool" would have the same effect. Yet then
> you can combine that with ...
> 
>> +	prompt "Limit the size of SID table" if EXPERT
> 
> ... this line.
> 
>> +	depends on XSM_FLASK
>> +	---help---
> 
> No triple dashes around "help" anymore, please.
> 
>> +	  Limit the number of security identifiers allocated and operated by Xen.
>> +	  This will limit the number of security contexts and heap memory
>> +	  allocated for SID table entries.
>> +
>> +	  If unsure, say N.
>> +
>> +config XSM_FLASK_MAX_SID
>> +	int "Max SID table size" if XSM_FLASK_SIDTABLE_LIMIT
>> +	default 512
> 
> Hmm, wouldn't the default better be what we had so far? As per the justification
> you aim at a special case (embedded) with this limit.
> 

yes, we can have a default value of UINT_MAX specified here if we'll use 
base-2 exponent as a value. And get rid of second option.


   -Sergiy

