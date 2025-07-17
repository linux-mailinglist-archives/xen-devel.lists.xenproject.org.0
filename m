Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1898B08FB9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 16:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046975.1417344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucPoB-0005Kw-Rh; Thu, 17 Jul 2025 14:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046975.1417344; Thu, 17 Jul 2025 14:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucPoB-0005Id-OI; Thu, 17 Jul 2025 14:42:03 +0000
Received: by outflank-mailman (input) for mailman id 1046975;
 Thu, 17 Jul 2025 14:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HfYL=Z6=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ucPoA-0005IX-0A
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 14:42:02 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 327f75c9-631c-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 16:42:00 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB8318.eurprd03.prod.outlook.com (2603:10a6:10:3a6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 14:41:57 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 14:41:57 +0000
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
X-Inumbo-ID: 327f75c9-631c-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQpY/C6RbeTs0a5yOSQvK3aOtxFvWI/Psoq8tFXVxswymYXqhNwmy76cUpEm7hAkXd4pq8lFLbmW2fZiNOsuczg4V9V1yzsbQ/Xpdl78DRSZte5B3WHiXc2LYbYrESnepLLo4L3m8K393hYjWOqk/3CWyciHt+v/OUX+EO2xTF9eBkZHeBNk3XbrhLUMM7iZ8ENDvBCdQ4xqKzcVXxR1viZnrwr6WmVAOJ32b6iStPgO+glDKjxOwicOOYqWt3NAxHG0JDygkaKUKx3Hqzo+qHvdawSMGEzWEo7m/taotjf6Bgx0+Cw1FtyrUuocgEn1FcPjhTLcMFJRgnCURuSUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yInzI4ltrMHFqBdlIoLI1ngK72b4P7XSmnd9yTAHNvk=;
 b=aJ40FKVlzT4wsJGIhPD+imhEMPUSF/s8i04n5CC/EQgM7RL/rhWPE2AZgGpqhSPS7FJ5/mHIiUg9kWSChZPJAVlQpM7dhDrsOU0QvAUjY+ouXeloZoalgrHOx7rE75paXBkiIvyQaD62WIFRAaZvBtMmNWbk+33J0e/Nl7mU3ZXT1JZOhYkl52To5sK3ROeMgIsTDIQSrdaVzk49/QZbdtVoTAXtauYc1oovcp9vwC5F5n6dVI8o7cNjPgh5j1jAujbP0f9AwKPGIixlfl/5048+NWDQhwFN4TZV7ssBgoCav9wskk+nzOReGeVU5cvxQ5w398+udJMkJEaf10PyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yInzI4ltrMHFqBdlIoLI1ngK72b4P7XSmnd9yTAHNvk=;
 b=TRYpy1n4/jEI2Ipgq7HQLG+J5v4SV8/oy0dB/0k8OSjexA1SO1929iTLETQA325EISYqMtNECJxAeODY15OVpA2DYz8kqiDVzOPudiKOhp5GJSUMp9SJVgvGZ9LcvgtIi9yECcTZAt6LP5lJdelTE2DVVt04oWLAyZQXli/DySRJnQTEgox8y/b5nYkqFACPKdfgrM2C00+Hj6Cfnsi6KwubOUOpWvj/g0nt5MvIdwhBHxmWEWKmZJDrebWJPWmawrwEj3QpAhQ8y8y4cSLJXpKNSMPg20NcgUNfajzSPTNcx74M0cGMqKXDz7gtScpBwfiHUD+zAPZSTM9eVXh7PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <72a6cd66-e811-4776-ad93-979b65e69a10@epam.com>
Date: Thu, 17 Jul 2025 17:41:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250717130147.2842159-1-grygorii_strashko@epam.com>
 <d8778c57-c934-46d5-a600-dcdb2ca5ec26@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <d8778c57-c934-46d5-a600-dcdb2ca5ec26@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 7983d302-f77d-4275-a999-08ddc54014a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czBMc3QvUDdLNm9iRktocEpzUVZRNlcwMFFDcTBoZmhWR0NxUFVreDJhUUdD?=
 =?utf-8?B?VEt5SG1WWGZqMEo4NC9jd09UUlNpeEFIQ3FWajk2ZDhhTFhyL3FtZ0pUMEVQ?=
 =?utf-8?B?NStDejlxSklMQm1aWXJHaXd5MnhLRDJsTFVGN09NRi9GVmNVdkIrcmdsQUpE?=
 =?utf-8?B?WXhmOWI3THdxTVhhMWJWYnk4dmhCeHVaT3lCRVNibjJ1d1NsdnV5Sk0vS2tQ?=
 =?utf-8?B?ZEhuY2Z4VkxOc0JWaVpPMElzcmJPb0xXZFFxMDRQVjZDb3VCUFE1QzBWRW1D?=
 =?utf-8?B?MERkV0l0VG02RnN2U0ZPMjI5VFU5ei9MZitxZ0xTY2dlQ0hDTENweWwvaC93?=
 =?utf-8?B?TkZhUUFHc3Y2cmVaazNDWERNVFdUY3BKZFRTZzB6YytaZXlEcVFlZE5vTnMz?=
 =?utf-8?B?dEt1U2xoZGh3bnNtT1V5cE92b1hEbGdra3QzMTNycFpKNnNjalV0NVZ5eXll?=
 =?utf-8?B?S3I2WTRQMHlWTHVka2hpODFWVDlsRlVUVmZnTlRVeTVpM0xqU1M0UWVQVnI1?=
 =?utf-8?B?M25DTW9Bb29qTzl5VjBkTkh0R3VqYlpOU0Qrd1VITndHUU4yWW1vcU90bHd6?=
 =?utf-8?B?Zk4rbVp2MXhGVzZLQVVOZUowL3QrMUJSYitYNnF3VThwLzZNZkdiUklDZmdC?=
 =?utf-8?B?eWozdFlNOGcrVklGSDZCbVY0ZlArQmhBMVVRMW84K3ZGWDl6S2VTNzR3Q3pk?=
 =?utf-8?B?MlhpODFrRHVFcXV0NGRDK0dOQ2dXSnI4aFRZQ3pBSUZtcnp1bk9ZRHBnWlcz?=
 =?utf-8?B?Z0J4d1dCbzFWNzdDYmVGUlFVYXRpTTIvbWJQV0U3L2RISkYrVTkvRS90ZXdB?=
 =?utf-8?B?L1p6a2dCRjFCU2xpUHkrZ0Y0MkpUQ3A0clJRaWNZd1B5ZjhvbWlmYVJoN09n?=
 =?utf-8?B?N3FOQTBrWmdza1JrajA0dGNaWGZvcHRoNjBJUzlFOE0ybDlPWHJKT3dsNXZF?=
 =?utf-8?B?TVp5bTFsRkxkMjR5TkNRczJjU0g3djk5ZUJyZGFnajZMRlZxZ2svVzcwTUI3?=
 =?utf-8?B?bHE2MW1INjJCYlY3ZktmNy9SdG54UGJhQjg1WFJiVmVWTTJDbkFZRE1saVgz?=
 =?utf-8?B?K0Z0dUlkMU9DNmhuL0pOblc5NTVkbTZnVjcxSCtCQTkvTXVvT1BaTU5uSzlN?=
 =?utf-8?B?bzlJN0x4bjlJTFF6UlhQN1FvN1BOMGd1RGpZRHIrcEkxSytEaVEzT3htb01Z?=
 =?utf-8?B?SFZXSGlBb1J5UUIrMEFvZlZuSHdwOUpHSmJUS2haTUwwZDgxUS81UFo3VDlO?=
 =?utf-8?B?N0ErdU5nMG1LQkpFcllsWXNpNHZrSFVwR2tNZWR5SU5pWjk3WjIwZ25oT05a?=
 =?utf-8?B?dDl4VU1OamJyaWZ3dlRFYXFUSVI1bFRQTVBOaU5ISXdGYUdxVVdnVEdpOVp0?=
 =?utf-8?B?cFdkK3NOeUFjaTVCbldrMVZwQmFnNzFuUnRBWkFkNjlTV2dMbkFYS3dSWWZM?=
 =?utf-8?B?VThmaVVZWFRLK0s2NmVBMFhDWGZneHlzeEpjMGUzeERCMldlajdSbE5RWHhC?=
 =?utf-8?B?MEhFRlQ4anhQZFpqMncvbDNEalVlQlVUUnlDT1BveFNrMW1PMEJnRlpCMkhw?=
 =?utf-8?B?bThkWkhJVHJ5OC9iWTd5M0dNK01tdTdwSVVoOFVmS3ZPcXdOOFczUEhwb2tv?=
 =?utf-8?B?cEVDVlA0Z09oalVwMjZBdmxmdVQ4K1Fla1VuOTBsTTBFclN0UGVkalhBelR3?=
 =?utf-8?B?S3pRS0VkWGc2ZzZBcjIyVGxQanhMWTBrKzV1SGVTS0NOYktHaVU2bmFrR252?=
 =?utf-8?B?ZnZiVHBvcGEvZEhBSlBpY2hOUnVIbWxBRm9hRDBSMXZxdFQreW5aZE8zQkhT?=
 =?utf-8?B?a2pDMy9HeTl4QUptN2ZBRnU4OG1SbDhqNXVTNDM1MlBSN0lFbmpQWkFjUWRx?=
 =?utf-8?B?YjBOell6R2VhWDUvTGV0NEM5UFZtWmJ0VkZ6ZXRVNUxoVGdYQUVqR0cvWGd4?=
 =?utf-8?Q?K+x995qbbDM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2pHbVZJQ244YzJqVE01b0Y4NElHOGJITkZCQmt6VFFwZysyMldSamx2OG44?=
 =?utf-8?B?b0hrUXI5Z3JENlVuQURkWWUyL3ZPTEp2SlZIcW5idzJoM0pJdThrcG10MS9n?=
 =?utf-8?B?TnZJTzBWajBTQ2pzQjk3Z0FCb2xtaU1kUHNZdXhoREFVdWRVMXhtK0M1Tmxa?=
 =?utf-8?B?MFRLK1BUa2pHQ2ZmRWdtYjhLNkhQOVc1M0RGbGRmcStiSEhFSEo3SERJaitB?=
 =?utf-8?B?WXFMUkZlclMwYnJRbnZYcEdxS0xYRnVQQkRsd1dSZHBodE5heWRqYllXM1lZ?=
 =?utf-8?B?RmZKUk5CN1FQTkorVHh5SjBySldrcnI3Q3FTV3RhdHNEaHhOUGh1eHZKYkZy?=
 =?utf-8?B?NS9YQ1U1a1VFUXd4ZU5pS2VLVStLb2l6ZHJQWUkrRVVLUnpwNmFZOTFXbzUz?=
 =?utf-8?B?NC9kbDBNU0lOeVRNdXI3VHFkM2RJejR1RVhTZjhmaEZBTndMTjhsQlUwcTA4?=
 =?utf-8?B?NlQ3M3hVQ0c5NGlReFVJcDNsS2E1L0QxR2FsSWdVTkJETG95NlczU09uWWFJ?=
 =?utf-8?B?dDRZSGpWNlFGa0NlM1ExQWplUHVjTXovUGxRVU5DY2FjQWlOb3h3V1BnZEtD?=
 =?utf-8?B?aEVmZndyY0t0SGxWVjNlN2JXaVVVQXFFcUhDckY5akdYMHBYSlFPQ2hpVXJi?=
 =?utf-8?B?RGM2TlJTR3lLS0poS1doZGtXLzdqaEZNQ2dhd3FXV2h0QjA1dEh0YSt0eGtC?=
 =?utf-8?B?MEQ2NlhBZGIzNlIzZ1ZlNndVWUwrdmpxNHhKMlRmQU9GRGp4VmtkaUZya3Vp?=
 =?utf-8?B?YzZ1WkdDNW9vSm14blRaeWg4RTJVQkVTMWg0aUxZWkRQKzJmcWVBdmlqYXVo?=
 =?utf-8?B?Qm01eVF4SEJId0JXVzhUbEpEODB0eWxCcnhYWGFjZ0VwTGF5UUJoSWhaRHYy?=
 =?utf-8?B?VWM3c3V4WFBzR0hlSVIzK2IzdUU3aDBubzQzTjIwWHlCZUludTZyd3VRdDBQ?=
 =?utf-8?B?RlhXWEdmMXphYmtxNW1RcjVaOHV0Z1d4b1BRcVVGcmlPY1BnaThQSXErZEhO?=
 =?utf-8?B?WXhpRmlGUWNPOGNtcjBhUFVqYklBd3ZHYU5xaW91ZGpHL0lIYTRCemp2amhJ?=
 =?utf-8?B?YzRITnljMWNTWno2OWxxRkswbnJqSUpMTWFMUmRiRUZIa2dLc1hKVGVtUE1X?=
 =?utf-8?B?c3ZtYm1tVXQ1RGh0bHF3Zk9XcFZIeHk1Y2xkRVBqdXlQOUlmQ3Q2cmhkcUZp?=
 =?utf-8?B?ekVjY3JMWHNWOEZ3NHRBNkZRZTVKcjY5UXRkdSt4djkrY3dZdFA2a1ZKd2s5?=
 =?utf-8?B?S1JKQXZZYzIwSHcyaU9HRzl4SW5RUnhCd0ZwaTBYQVlWWXhMMUpuZ2JFaXpl?=
 =?utf-8?B?L0RqcjBlZHJQQUkrZVk0N2FTREVvWENnZnpCOGx3eXpmZVFSWjNlN3NXSnJl?=
 =?utf-8?B?VnF5c1lHaTlqalU4ajNMT25HcE9Ma0FHT0d0L0J1YTdLNFQzV1poRTNVWG5i?=
 =?utf-8?B?MVVQNmMzYkErMXlpRjNPVHJybVd1akEvR0NSc1BTNnNGYlNwdnRhWkJFMW5m?=
 =?utf-8?B?M3hmY2ZpYVZmWDBZY2F3Sy8ramlrM0Q1bTRaRmw4bW1JMCtUVUg4NHJlQmR5?=
 =?utf-8?B?cnptTGovNXNIQnB2cE1VZmtxQlY5NGpXYUQzSzRiZ0FNSVFkMWJxelpmc2V5?=
 =?utf-8?B?TmsvZFgxYmtCTFlWZjJiZFUxTnpZdVo2VmlLNSthbDk4NVA4ZmxPenlQblFw?=
 =?utf-8?B?MEJhM1V3M3RNOXY4bWpUOEtFZG5hOTJybUZGVGkrT1gyVHFyRDZVbGtrSVVa?=
 =?utf-8?B?cDhVWXREOUNsVWt2YkNsL0ZRN3lTV1JvL2tINnpURDd5VlZXNzMydDVsWkdW?=
 =?utf-8?B?elB2UHZ2d2VoTlN3aHF3MnlReG5qZkNFQTZuM0M5Y2NrNUtQWklmQnRiaFFM?=
 =?utf-8?B?d2kxeEtscDVZekdnZTl3UEZUMXRVY1NLNGJYeGppUDRSSUhqczJxSHk1S1JB?=
 =?utf-8?B?VFp1cDRGM2lyYktsWXJxOGZmeWRBYWZjYVY4MlJmcjdqVFVmUW1aVmoyQW02?=
 =?utf-8?B?OURrSGgwSHdkUGJKeTJjQ21vWHhoYU93bnR3VmUrV0Q1d24rRDkvVGZydndq?=
 =?utf-8?B?YU1ab0VYNm9iTkZjS3RHajE3MjBJMkwyb3Z3MDV4UExLYjd3WjNZRm9rYW41?=
 =?utf-8?B?eWF1TDdlZm8yNzFBMmdtUkNXY1ZzQmRNbk55SXVCN3I3Q2tHNGx0Z2RtL0pt?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7983d302-f77d-4275-a999-08ddc54014a6
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 14:41:57.3112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwYTIvsvayftXn6pUu3gqoahavVo3HCiWZd5R3DkNFYQ1B+4dqtz3uOvpztfnMCPJwLTVRQ7lLszei2GmCEKzcyLw4I+bCWzxxOM7eMIggg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8318



On 17.07.25 16:10, Jan Beulich wrote:
> On 17.07.2025 15:01, Grygorii Strashko wrote:
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -975,6 +975,9 @@ void send_guest_pirq(struct domain *d, const struct pirq *pirq)
>>       int port;
>>       struct evtchn *chn;
>>   
>> +    if (!IS_ENABLED(CONFIG_HAS_PIRQ))
>> +        return;
>> +
>>       /*
>>        * PV guests: It should not be possible to race with __evtchn_close(). The
>>        *     caller of this function must synchronise with pirq_guest_unbind().
> 
> Isn't this function unreachable on Arm, and hence a Misra rule 2.1 violation,
> requiring #ifdef around the entire function to address?

Yes. It's unused on Arm, only x86 is an user.
I can put it under ifdef.

> 
>> @@ -1710,10 +1713,15 @@ void evtchn_destroy_final(struct domain *d)
>>   void evtchn_move_pirqs(struct vcpu *v)
>>   {
>>       struct domain *d = v->domain;
>> -    const cpumask_t *mask = cpumask_of(v->processor);
>> +    const cpumask_t *mask;
> 
> This change shouldn't be necessary; compilers ought to be able to DCE the
> code.

Unfortunately not, with "-O1" more code is generated as cpumask_of() is complicated inside.

> 
>>       unsigned int port;
>>       struct evtchn *chn;
>>   
>> +    if (!IS_ENABLED(CONFIG_HAS_PIRQ))
> 
> Nit (style): Missing blanks (see other nearby if()-s).
> 
> I wonder though whether we wouldn't better have x86'es arch_move_irqs()
> invoke this function, and then #ifdef it out here altogether as well.

Do you mean as in the below diff?

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 3c73073b71b3..6d2bdfc9df1a 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -224,7 +224,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
  
  bool cpu_has_pending_apic_eoi(void);
  
-static inline void arch_move_irqs(struct vcpu *v) { }
+void arch_move_irqs(struct vcpu *v);
  
  struct msi_info;
  int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 556134f85aa0..b8d8f202119d 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1851,6 +1851,10 @@ void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
          cleanup_domain_irq_pirq(d, irq, pirq);
  }
  
+void arch_move_irqs(struct vcpu *v) {
+    evtchn_move_pirqs(v);
+}
+
  static bool pirq_guest_force_unbind(struct domain *d, struct pirq *pirq)
  {
      struct irq_desc *desc;
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 13fdf57e57b9..ad6032fb2865 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -642,7 +642,6 @@ int sched_init_vcpu(struct vcpu *v)
  static void vcpu_move_irqs(struct vcpu *v)
  {
      arch_move_irqs(v);
-    evtchn_move_pirqs(v);
  }


-- 
Best regards,
-grygorii

