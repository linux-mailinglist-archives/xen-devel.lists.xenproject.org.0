Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FEFBE4950
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 18:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144654.1477996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Qq5-0004Qk-MJ; Thu, 16 Oct 2025 16:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144654.1477996; Thu, 16 Oct 2025 16:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Qq5-0004Nm-I5; Thu, 16 Oct 2025 16:28:29 +0000
Received: by outflank-mailman (input) for mailman id 1144654;
 Thu, 16 Oct 2025 16:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIav=4Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9Qq4-0004Ng-3T
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 16:28:28 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 240ef09c-aaad-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 18:28:27 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SJ2PR03MB7111.namprd03.prod.outlook.com (2603:10b6:a03:4f4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 16:28:23 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 16:28:23 +0000
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
X-Inumbo-ID: 240ef09c-aaad-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGD4RwTvnmx79V4n7NPqWIAJanU3GlPVM974/uv8VtlN+lJdRCneK480hylQXp9OCiMuXK2wWQOtGDNfKDSonVJBKTCA0kgo65DD94M/rWhk0QNsj7t1zBo4Ekj5LuM3BHIqjx778kEQXqVrx8cfqwZ3aGERMGwk+nhYQae4nPtTaXIZNeYhyaZOzOSxLMVDh6YKq6hnksD1rcC1Klhzk/Ovz0FjprKmAz2ixQXOtJ+AJczYRXOVqgMRaKZXE/kzUnKsq0ZAVZLgherz4zxiJiwsOmMAervE24HlL0KC57aB30aK0g0pPeOmjnucC0Pt1I4QAc2d4Qasn+P3dMlqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsLXnlLQe+LoMK1UvfDN9/jGVbZdwCSiwx2Q+loKspA=;
 b=Tax68c7lYCFTXgpU9+ILf1KX8j50Zp1QgUc4oQJ/Seu2VhQ7eaYHbWsxXbWzDkMUh+6lkODlJG9p53NICx+nAmpNlF+39phnU/lQb21/tOC0JE9LDQcqnJnN9PNfV+Q2n8mzGyV0Yvy3LA3i56MZKvNei+fRPOF8wx/07EZ4gor1uCrc988K4aBoxZFjRrb8kUwPbPfiYthJmRefMPWjUA7N5thJjz4eGQEkxBD9h4DI7kIKrC9TromQl9sIo/OiI5D3OMgBRC/ONIBDnI3jc/SeO5ET6DrTEgHyQ9ig0NfvPpVYM3QCyGrCpIqNYpz6lZ8TFe7FILNCtHgCOB090Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsLXnlLQe+LoMK1UvfDN9/jGVbZdwCSiwx2Q+loKspA=;
 b=WHqy+WnwW4rk5l0jMmKgTDlkO/5ra2NgKvMokEtIQT1yG7i0CLfkWJhzrdJgDX9T2AYBnVfCaR3rxES/26lEIrksgFdegaUvxWUz8G5wjgDbIAdik3fh4SZosw+S8+stXdS5yFCS6EwT2CIIqO6m44iYqrSlrRD+T+Vp+OrsJm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Oct 2025 18:28:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 02/10] x86/HPET: disable unused channels
Message-ID: <aPEdI78ySE2eFPnA@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <8913e64b-d172-43f9-9c4d-447ba4984c9a@suse.com>
 <aPDaIssJOFh00-W7@Mac.lan>
 <bc7467ca-ba06-417c-8583-8de3782a1d83@suse.com>
 <aPEQmMKYRwPaKxX6@Mac.lan>
 <39b3cdbe-636c-4b9d-9134-d42f8a369c4a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39b3cdbe-636c-4b9d-9134-d42f8a369c4a@suse.com>
X-ClientProxiedBy: MA3P292CA0010.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::12) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SJ2PR03MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: 6284ef4c-0ffb-4abb-8841-08de0cd10659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXdiOXJDN29xWTBjWTRXanZKWmxodUwrbzdCeTE0SUErQ20vUjNyaDE4MXQx?=
 =?utf-8?B?UVZlTi9VeTlCYW8xY0lxWTA0a1NpOW9HeEpsMUIycWxUYlFuOGJTSGppVENi?=
 =?utf-8?B?QWo3TkpoWGFlQm9LSU1LOTVjdzBwVGdVTXlCTjVjdG9LOVZvczRjL1NBdWpi?=
 =?utf-8?B?Z0syaWtzdVVXTGc3d0h2MEowczV2NUhNdlNBcEhXZGc2MkdreVFyc2dIVDRv?=
 =?utf-8?B?UFFYVVM0aEw2a2g4NE90WE01bXMxMWs3RlVpVVFkZWo0ekFjNnVUQkQxK0VN?=
 =?utf-8?B?dm9lcTViYW9hY0k3cXVXN0NCcDAzVEQ3NTNoSG5POVdhVDNkSkJuK0xKRUYy?=
 =?utf-8?B?b21ZVVJEY2VGekxvM0Q0V2NNZXFkRlpYZXI4RGtUcEFGbzFBUm4zNkJXSEFz?=
 =?utf-8?B?S0Nac09tclpLTWh5ZmVUMmMzUmNXV3NIekxDNW1HSGoyR0NVcTdRS0lJd1F6?=
 =?utf-8?B?cGtGZVZFUStxWVA0NnlFMDZLUEY3ZXpyQ2g3bGVZMUZ2OExURWFUYS9sM3pF?=
 =?utf-8?B?b2lqbEdGN1o0bzFkRzdPZFNVd2RTVVl0c1FxcGx4UXRRRVNzS3BKMzhLUVg5?=
 =?utf-8?B?SVlNSHo5bmtacUdYNTUybFBCZFhaTGR5azNhQVcrWUJpSnhhUjNYTFlocE5S?=
 =?utf-8?B?b3hoYVowOFhuR0R6aTRGQ3ZZeXlINCttRnAwdlJ6YWNwQ3JDQXBjRGpGYTIr?=
 =?utf-8?B?NnhkM3orTW5NUTZ3a0F2SlV4aXhxN3o2TExLL0xRcXZpSXFLdzNSS01hSTJj?=
 =?utf-8?B?U2ZjSGVHOFNuVzZKd0Vza0x0NFUvODl4MWk2OW9UcHI2cUN0MW9aM2ozMU9w?=
 =?utf-8?B?MVNENi9uTjJWbVZxbVdWbFc4YkVwcEVmR3pVWmFzbE12d3Jlcms1WmNBcU9M?=
 =?utf-8?B?Ulcxa0Rjd1lLUXAyU1I0MHN2TU1BLzVVNjk3dDJqcW8xei95aEFsalVzdEhz?=
 =?utf-8?B?WE9VMTRFNzd2WVFtNXltNk94YXo5amxYUVNGS0hpdWltMUVvVGF3ejAvOHBW?=
 =?utf-8?B?a0V0Yjhydi8yeE9nVjNJaURFTDRpWXcvSXhuUFR6aytSYkdqMDdsRmJpOHEz?=
 =?utf-8?B?RHRNWVFubHpFVXBGRWRDTmVWMlgwbmJnZTljNzUwVHlnSUpDb29lRThFZVZ5?=
 =?utf-8?B?VTJIb1FEUDY3YWNHcm83ci9DYllTd2hoV09PRzMvckIrYWJVM2VLSUJmcEdo?=
 =?utf-8?B?YlF4QnZxTVhxOXZldnZZV20vK1QrNlY0MXU4QzlNaDc0U3JTK0RUYnplVFVi?=
 =?utf-8?B?THByRHAwZFZtSjFZajRwNDQ2WS9wZlVTa0pIWEFzSUd1bEFLYU4zbUFCcFU1?=
 =?utf-8?B?Qmh2cTJIVDc4ZVdYdUp6UXN1U2hyR3RVbHJuS1J6ZmZ4cFpEdHdNNlQzR05Y?=
 =?utf-8?B?VmRMT3dXWWdFRmdiSXlBcGVGV0srMWlHWXF2cjVRakdEbkZOU3doT1AwQURJ?=
 =?utf-8?B?ZmRPTkVranc5SjVjbHlsaTlnakFSQmFqaE9rR21Pb3ZLeUlsYkVBY0crNUtT?=
 =?utf-8?B?RmdWbkNYZDRmSlFxU1lFZ01xa2kyQzBTaFdvbHJxYjRsVHlmbW5zaGtTTlVY?=
 =?utf-8?B?VlRIZWp2ZE12bndxNlUxUG5GYlE3QldBRGF0c0VmSElhd0JPMHJXeDN6MXBw?=
 =?utf-8?B?RDc4dFVZVG1yR1BXWlI5NVZ3djhaaURCbHJyTEpJcjB3eE4zTXNaKzM5anV3?=
 =?utf-8?B?bzBMeWZDZ0Z4ZzJNUWdFbzIySTBpdmtDdm85TVh1SDEyaTZzL2VESGhmTTRO?=
 =?utf-8?B?aWh6REhzL3AyOTM1N0IyakNFcW9ZSGpiM1BwK25CS3FQdVQ3Q2ZuSHlFOU5K?=
 =?utf-8?B?ajdMbG5MWUdSMThQQU8xRStKTkVkSENmeW5kODE5Y2NmdTBqVWQxQklpYVdT?=
 =?utf-8?B?cXlodFNuRUowejJuWXJMS05QMEVMSkdhZWdUOHJNcm5wellRTFB1dVVzeEpK?=
 =?utf-8?Q?wlGrnT6ljWtUzndT/iN3n1NcAsFTZ+84?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVlqa1JVQ3orYlRKOTRDeG9Sc2ZJdkVZNTFLdFhuUWVvOThQK1NMOXhSeGhJ?=
 =?utf-8?B?T3JaWktwaVgyNndPTlJDaGZkcnJQZ3ZrMjdYb0pRYnN6UkhYdTBEclFyTm5C?=
 =?utf-8?B?VXR0bWI2Q1I5dDBzVllGRkpsY0hmcWRZMG5JRlJjdHQ3Zm9JdlF0WlF1d2c0?=
 =?utf-8?B?N1ZZUFBmZVJYOEJ0QmhMRmlGZUF6Vkp3UjFGUzZlTXg5aktaNWVYY3ovYTMx?=
 =?utf-8?B?aXBCOTJmaUJkQ2NOU1BaanlLRkFRSE8vYngvblBsOEJDWDBhTjVDK21lWGI4?=
 =?utf-8?B?SzludnlzY0R1alpBakdqQ1dLTHdaYkMxL01vWEdvRkFKdi9pbDlZUzJmbnJE?=
 =?utf-8?B?M242OVd6TEVWZDZGYkVvYmUxWGNuVlY4aXRmNHJ5RVV1aStrZjU2dDBqckxR?=
 =?utf-8?B?VHM4bUdBRFNuRjY5UHF3cjNpSERVN3RFYWwvTkJ4aEpxZ3RtTExtRjc3L21l?=
 =?utf-8?B?MzVlaEEzcWlQK240WU4rMEh6TGRmVVpkby9KK3NGYUpNWXZFY0hydTJjcG81?=
 =?utf-8?B?Nk9KTjRhVytiRGxOU3NwQXNLSGRHR0s4Vk5wUGxrV1o1L0UwOGxSMmZSTWwr?=
 =?utf-8?B?aHc1eXRzNXZqdDRicGpuY1RwMWZxOUpGaUpBejFqc0lGZTArVUM2RjFzdFJl?=
 =?utf-8?B?RlpkbWt6amltbkkvNmN3dUtzYmE3OGVzZ0RiTDcvamVyTm9sYUhQbzE1VDQv?=
 =?utf-8?B?YzIxUCtBRWhOL1FzcDA0THB0dGhWZ2EvbjJBZmVPTnJYOGwwZXFaeUYxV3Ns?=
 =?utf-8?B?VjdPM3pmYWZ0R1N2QjlQYU52bTNaTmltOG9COFpyOU95L1huYngzK0xhY2hH?=
 =?utf-8?B?cTk2RFFpMTgvWGkvK1grV3hwdjdYM3djcitCbmpVdVZJRjhuZCtsWHp2YzZp?=
 =?utf-8?B?NXhvRjc2UjQ2MjFlOHR5TEQyOWpMcEJTVHhMQmZwOXl2M1BCRU5MOWVCNG9p?=
 =?utf-8?B?T20wUHEwSXdjYXQxcEwrRGZSZERkakhBbklUaXdjcTJpWmlaNzN5L2FibU1B?=
 =?utf-8?B?b3YraUhLK1YvekZlZHlKSHdLSjh2UENBdDE3RFB3M3h3cmhQeGVGeFlsWHdY?=
 =?utf-8?B?Y1d1Uk9OczhoNWUwcC9Ja0JycHJMeSsyd2o5VWJVMU8xTWg3NVR4S2d0WmN4?=
 =?utf-8?B?K1lNbjRiSEtuZEF1c0NiUzNwS3NjRkFnREVZOGh3anZNYlVZTTBBQWdOd2V3?=
 =?utf-8?B?SlZObFNBZm5kOTdzRGdWbnBwdFlTdGZFaS9teUZmdnRrOStndG5UNW5BczE2?=
 =?utf-8?B?S1Nzbk9LNjhGUlA0bnRxR3RRejVVNEtVKy9QWVBGcXZZckM4ZGtyVWJYdlZV?=
 =?utf-8?B?eEhVakd4YU9XNmhSMDlLc3lBL3RGdUh3OGZUWUxYQm02RU9WZC82OHNOblky?=
 =?utf-8?B?NVF1ZTN2SkNpVXUzbzRyS1I5SHd3R3lxcWJMTXFZMFlCVnZucUovVUNwYkp5?=
 =?utf-8?B?c1pOZTFIcjdXeFRZYWJoTzJVNWczQUNxdXUybzgvbnNBNHd0TnlMYjZvM3U3?=
 =?utf-8?B?NnU1aTk0Y29mb0sxTW0wZklVUkJlVnFQVGpndU93THNDbkxodXY4Q0h3TWRL?=
 =?utf-8?B?TWVmNnVZR1FPQWhqK01ZVVdYTTZOR2F5b0dQSWVsRThPeUNORzBpNkExbjlz?=
 =?utf-8?B?VlRQb2ZEeDZHOUQxUEVVTVU4TlIzcEEvT3A5RFY1a09IR2tyWTBZVXlZdnFk?=
 =?utf-8?B?QWdUTmNxSjZBL0w1ck9wSmM1QTZRR0hWZE12UXRPTG5MSzFIK2dxMmNmR1V1?=
 =?utf-8?B?cjY5ZTRZdkF2SWc1M1lTSTZSSjZvR2QzaHViQUhtbHVWTVRGbVVyL1RxUUhO?=
 =?utf-8?B?bERUb29BNEhZQUZ4Ti9FU3RZcVlOUmlhKzByUWpDN0RMWDd3bXEvaHdPUnpq?=
 =?utf-8?B?bmZhcVhhd3dZc0Jzd1pDR29nTGxXZ3JNeGVuSmdiZ3BGdlJDUmo0aG9XaW56?=
 =?utf-8?B?dzEwajJLMHROUDJkMi95UmZoamp5dWNWaHpwSlhBdHRnVXQ2VnNKdTNpZS9p?=
 =?utf-8?B?SHFKTFRzZnRHQzNMWnpyOE9RWkVzOUdhMGNVUXBnMDZGVVFHR3MySllubkZm?=
 =?utf-8?B?SnliaEFINnhDQTl4NTZrMlNqWlRVRHNoaHJhWDVkYTRLbkJOeWtlWUdGYnYx?=
 =?utf-8?Q?JDsTB544StV84LtPoNTwvDZ3+?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6284ef4c-0ffb-4abb-8841-08de0cd10659
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:28:23.0305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crwiYP2RjaXdWZ8yY84UHgZVYOfW9KwXI5bQomr/8MrJE+pQq7CGakJSdLv2mdbPJc3aFaC5o48qNZaa4wZr7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7111

On Thu, Oct 16, 2025 at 05:55:30PM +0200, Jan Beulich wrote:
> On 16.10.2025 17:34, Roger Pau Monné wrote:
> > On Thu, Oct 16, 2025 at 01:57:41PM +0200, Jan Beulich wrote:
> >> On 16.10.2025 13:42, Roger Pau Monné wrote:
> >>> On Thu, Oct 16, 2025 at 09:31:42AM +0200, Jan Beulich wrote:
> >>>> Keeping channels enabled when they're unused is only causing problems:
> >>>> Extra interrupts harm performance, and extra nested interrupts could even
> >>>> have caused worse problems.
> >>>>
> >>>> Note that no explicit "enable" is necessary - that's implicitly done by
> >>>> set_channel_irq_affinity() once the channel goes into use again.
> >>>>
> >>>> Along with disabling the counter, also "clear" the channel's "next event",
> >>>> for it to be properly written by whatever the next user is going to want
> >>>> (possibly avoiding too early an IRQ).
> >>>>
> >>>> Further, along the same lines, don't enable channels early when starting
> >>>> up an IRQ. This similarly should happen no earlier than from
> >>>> set_channel_irq_affinity() (here: once a channel goes into use the very
> >>>> first time). This eliminates a single instance of
> >>>>
> >>>> (XEN) [VT-D]INTR-REMAP: Request device [0000:00:1f.0] fault index 0
> >>>> (XEN) [VT-D]INTR-REMAP: reason 25 - Blocked a compatibility format interrupt request
> >>>>
> >>>> during boot. (Why exactly there's only one instance, when we use multiple
> >>>> counters and hence multiple IRQs, I can't tell. My understanding would be
> >>>> that this was due to __hpet_setup_msi_irq() being called only after
> >>>> request_irq() [and hence the .startup handler], yet that should have
> >>>> affected all channels.)
> >>>>
> >>>> Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> A window still remains for IRQs to be caused by stale comparator values:
> >>>> hpet_attach_channel() is called ahead of reprogram_hpet_evt_channel().
> >>>> Should we also write the comparator to "far into the future"?
> >>>
> >>> It might be helpful to reprogram the comparator as far ahead as
> >>> possible in hpet_attach_channel() ahead of enabling it, or
> >>> alternatively in hpet_detach_channel().
> >>
> >> The downside is yet another (slow) MMIO access. Hence why I didn't make
> >> such a change right away. Plus I wasn't quite sure about the locking there:
> >> Imo if we did so, it would be better if the lock wasn't dropped
> >> intermediately.
> >>
> >>>> @@ -542,6 +540,8 @@ static void hpet_detach_channel(unsigned
> >>>>          spin_unlock_irq(&ch->lock);
> >>>>      else if ( (next = cpumask_first(ch->cpumask)) >= nr_cpu_ids )
> >>>>      {
> >>>> +        hpet_disable_channel(ch);
> >>>> +        ch->next_event = STIME_MAX;
> >>>>          ch->cpu = -1;
> >>>>          clear_bit(HPET_EVT_USED_BIT, &ch->flags);
> >>>>          spin_unlock_irq(&ch->lock);
> >>>
> >>> I'm a bit confused with what the HPET code does here (don't know
> >>> enough about it, and there are no comments).  Why is the timer rotated
> >>> to a CPU in ch->cpumask once disabled, instead of just being plain
> >>> disabled?
> >>
> >> Because it will still be needed by the other CPUs that the channel is
> >> shared with.
> > 
> > Yeah, missed that part, the channel is migrated to a different CPU.  I
> > wonder however: since an active channel can be migrated around between
> > CPUs, isn't there a risk of the timer firing just in the middle of
> > migration (when interrupt generation is disabled), and hence Xen
> > possibly missing a deadline?
> > 
> > In hpet_broadcast_exit() we need to check whether the timer has
> > expired after the migration, and manually trigger a broadcast if
> > needed.  This also risks doing to broadcasts also back-to-back, but
> > it's the only option I see to avoid missing a deadline.
> > 
> > Maybe there's something I'm missing, this is all fairly complex.
> 
> set_channel_irq_affinity() invokes handle_hpet_broadcast() to cover that
> case.

Oh, indeed, sorry for the fuzz then.

Thanks, Roger.

