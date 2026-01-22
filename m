Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO8HIOcccmnrbwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:49:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD6F66D6F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210919.1522501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viu7B-0001UB-Lm; Thu, 22 Jan 2026 12:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210919.1522501; Thu, 22 Jan 2026 12:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viu7B-0001RW-Ht; Thu, 22 Jan 2026 12:48:45 +0000
Received: by outflank-mailman (input) for mailman id 1210919;
 Thu, 22 Jan 2026 12:48:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viu79-0001RQ-7d
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 12:48:43 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adcf277e-f790-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 13:48:42 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6431.namprd03.prod.outlook.com (2603:10b6:510:a9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 12:48:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 12:48:38 +0000
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
X-Inumbo-ID: adcf277e-f790-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVkqCy5ROR0awHRARzHEuk+KVEAEgT7TGtgAgEcrj07TN3vXHPAOJvepp19xxaUO5UIx6aXgs6WwcS+peaInGZEEKdsTpuyUf21aaJN6TcL6+aujz6xq6GTbU8Ip1ZVkB1Gk7MlOubhV6MLgg9bh9c14wlPmhxq+Ph4hf12WpdjNxFXCd5/tlYPuLV9m//jufc1z9oddN3kYYAZe6hvja/pwEnNXGhNL7zDh8/3tthjmenSvQJLfdX9Mibg99dDz1bnqkqpxYsU1nQWFgGOC57/luShbK99FviHBq3Q6CMxePS7ZH1fQU9Zx/7aptTokHf4yDExCZHIXk/eVAMBaww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8CnykyKv1MBEKdGCYPN8J5Hpx0U3SeHZN6YJIEBc90=;
 b=IXLp1pSKqdF0DAQhNBmiuOQpabCuTGvvwTtmcd4ai+nAq+/ii/NaQYQWYmw/+NqJAnEmgSiQYjsdiA6Cssd9827LSIjP7jIkHRjYReddZcK9sgxoyHH8EliiC9HvNAFmyCOfcnSpFrEc4du6Rm+yMxfOymX1Ae7C/7O0WvomMKW4ubsergwNxr0MuYkQ0Uv7+1PqDN1ACEgpnLPWBF9/SFYVbOh5tBgFG/lPApVZrIDpf0fg92ksluTjhTlovUzQOLmZJaaIcq3I/nB8oMw7kvUG0+4Mz3rO/25vxqRtQUDTxQlDBXCuQ2LwCepZvHLgeB2jNhW4Tg+0AJXTD0o/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8CnykyKv1MBEKdGCYPN8J5Hpx0U3SeHZN6YJIEBc90=;
 b=dfap9WINqFysQbmvoGhNMLAqKKe4hmGLAkzNemRQYqY5V5ut8/sg0gBoTGXMM0zFU2rN7Gzzi8BrUfA6uLS2hDlGpWOPc/eGKvp4f8i/LEk58RE8Fd5IZOk92bC1rbjE2MTFKaBNEqszvcOd2+SHh5BMXxwDPsx1+COEa3ZZY40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 13:48:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
Message-ID: <aXIcovhwLfkV8Dmx@Mac.lan>
References: <20260115111804.40199-1-roger.pau@citrix.com>
 <20260115111804.40199-3-roger.pau@citrix.com>
 <7387457f-104a-436d-96ae-b70c77745200@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7387457f-104a-436d-96ae-b70c77745200@suse.com>
X-ClientProxiedBy: PA7P264CA0438.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37d::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0bd31f-b60e-4fae-03c2-08de59b4903d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUsxS3dSVkJVc01OeTZ3Yi9KOUJJVE45clJWS2tiSEZVSXcycHNZVkozcFhj?=
 =?utf-8?B?K3dKbFdWTStiUGRPVkVJcDJBMEt0R2tXNG1NOW9VNTQ0N29RUUF1YW5tYzg2?=
 =?utf-8?B?bmRYRkRNeUFVbEt0ZWMyb2gxN2pWd0JLQnJqUGc4ZFZtTmVCZUNmekhQTmdO?=
 =?utf-8?B?QTZLZkxsR0hUWDBEN1lpa1J3N0t3QUovNHh5YUlJSkRQV0lvcXl4ZFREY01s?=
 =?utf-8?B?V0xya1hnVjQ2RlZHbXh6dnlFM3RNVlMxbFoveFg3dzZKT3VQYi9UbktnZG1u?=
 =?utf-8?B?eUpkbEQxTnFFUTNhalVaWmthR3B6UnRVc0NrcUJJTzE3M09ncHg5Wld0SEsz?=
 =?utf-8?B?clhZdkVPTkdGQnNvQ0F2aThkRDBQMUdWVDFQSGxXYjkzYk5sSi9vcC9nMzBQ?=
 =?utf-8?B?dm4yK28za045c1RiY1Jrb0hibE1QMnRtSUhiczhXRUp2SEV6MkxvTWd5eVhX?=
 =?utf-8?B?eTczM3NXbklNVkVFdVd0R3krbTF3WW1ndHl2R1RjTlplMTVFbjJEME54VVpw?=
 =?utf-8?B?N0R1b1Z6WUhLWWk1eXRZYXIyU3ZBMUloU1JmWlZja20yT1lGcGt5MEZVc2Fj?=
 =?utf-8?B?ZnpyRXl4cml0ZTNpZTUyVFBKN0t0aTBmcTlRZ3pDVTZpemhhQTdOdk1jdHlu?=
 =?utf-8?B?WkVWTklQQnpxdjJDQ0h2N2ExcUJQczJNSHo4M2RQYjdhcnpyaUFZcVJXcGE4?=
 =?utf-8?B?WnQvNTQrV0ZwQzlBVEJUeUpHZm96SHRXeTNIbDI1YldFMTBjS01sTzhJeDg5?=
 =?utf-8?B?eGdjU1hVTFZDWTdqb3lhVWdpeGl6aDBValZNUWsrYmR1ZVh4Ykc5eXl1UGcv?=
 =?utf-8?B?RzNSaWZDRGVSb0hER2Y5T3pIdHNaczZIVmYvQzg1MitFaCt0OC9mZUhWR0x5?=
 =?utf-8?B?RWRNWmU0dXZ5bVoyNVc0QkRoQ1lPeUhBREU5OGpyTElRK2JDMGlvdEFrM3pF?=
 =?utf-8?B?dFlwdVAzZjNlSTQxamcwWkdTR05CQXgySm5lTEUrUnpsdXlieVhwamZqU3o5?=
 =?utf-8?B?YVNFeERzVmN0Z0NBbzNlR2NDeXVwRHgvL2lXdkZFTE9qNys2OHZXMWZscXE0?=
 =?utf-8?B?UHc1WHdoeUM3ellUV0ZTTUE3M0lJWUJ0T3N2VkhOWWVGMEc5R1lZSWJhTm95?=
 =?utf-8?B?NXMvTlJyNFczQS9GNGxoeW16N242YU1RdUM0ZklHR2N5UHRXSnJ1OVRiYkM4?=
 =?utf-8?B?aGtndENZRnV1VElmR3k5aTJuc3FRK1BZOVR6WElmQWtnNVI3VjY0ZUtQU3FJ?=
 =?utf-8?B?VDBhYXN1aVVwNUNMbVlJTGordXlHRlUxcmhaMDh5VGxYRXVHSVQwc0picmQ2?=
 =?utf-8?B?U2FUWUU5QWMrMUhTODE5N0MvWHJMZERITDBrdmdNbDZhVWVjMUNpUnNSUDY4?=
 =?utf-8?B?akZwbUY1RlVaT0lPemhMWitia1NNZWxMUFp5ZjdDZTVheVNrazdURHY5WDlV?=
 =?utf-8?B?L2Z2M2JabjNlc2hhNzRkVTQwYllFU2xSOEVEdjZLWHBDWDZCSmVaQlVRSVZ1?=
 =?utf-8?B?dlpEUjFJb0NKZElzKzlkN1JEWjhxWGFKb3dDYVVHMFgzMWxHUXIrRjJHYkZE?=
 =?utf-8?B?bFBDUUg1TXIrczR3UGpiRnBYUHBQNmtHeElGdnlkSDJ6SWhCN09zRnR5SWw2?=
 =?utf-8?B?QmhleXBGck5hNWNNMVBhUEFaMUVYL0VseWVUSHArUlN6aDdWb0tmM2tiTno5?=
 =?utf-8?B?WEdVRU9nNnd1OGpHY3JrNWhjM0RsSE5jMWZKaXRjeTRwOVMzQWsvc3FUQmVo?=
 =?utf-8?B?cnlpTFNvblkxeTZZSzFRdDRnN0srNzlLQ1l4OWo2VnV4RDMza2ZHQzY1ZGsz?=
 =?utf-8?B?V2dXOTF2aW5HTG90NnI3R255dFVxV25LeDQzUHZyMHRFR29ySmN6am9KS3I5?=
 =?utf-8?B?TnlKODZJZFJVWTBHbkdmT0tTYk5LS29hUFRIV1pRZlhBMjRKaGNRbkYxTTZE?=
 =?utf-8?B?bk9paWpzRTcxWkpUSGVRMktWN1ErZHBBME84TzZSaHA0cWdZYzVwVHBPK3Ny?=
 =?utf-8?B?NnFrU3E2d1ZaUGd5MCtuNHdGdWF1NFJTeGJPM0lMT0ZsYWtxLzZadENUT2kv?=
 =?utf-8?B?ZE9UMUlDdXVZZy9GRlBxcFJ2dFkzMEdYL0tUZHRzeXR0REZEMzZTeWMxb1hG?=
 =?utf-8?Q?q4Vs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGVDS1VkajhIYmRhVjlDNnd4bE5JenAyVGdiZ1ZvVlgxbWp6ZkdrUkhSTmJx?=
 =?utf-8?B?aGdlVE9hUGRQY0FKQjVrWUFqR1hRdjBhd1JYd1pnRzFUcGwyNnZGS3dFYkU5?=
 =?utf-8?B?SEcyWm1LZmFUalk4T2ZyblNub08wekxFWWVHOHV3dFlNOVdTZVc1Nm9iMEgy?=
 =?utf-8?B?WXdTRGFvZTVkb0ozczJrcUdXYmFVcVJ0b0RKTlBTelRoZFQ3dFFobGwzRDZq?=
 =?utf-8?B?WHY1eVVReFplV1ZqOTA4ZCtSOXRNenBnckdwRkZxR2xJbVJWbDhjbDM2ckRk?=
 =?utf-8?B?aXB1d3RsdnBrVm83N3Q3Q1U2b3dqb0FWQTlubk9nMGRmcHJOUE9Ud2I5Qjdn?=
 =?utf-8?B?bVdmWEQzL3orUkcvMkdidU5BcGtMZk5DdDJoWHQ5OHc0YnRMUzRRcTkxMk5D?=
 =?utf-8?B?Q0VzTWxOSEZUdkQ4VXE5UE1JUzhZNlRFUDh5c3djaTVwTUFTSzQzSm15N09T?=
 =?utf-8?B?UDN2T2xoems2cGY2OHhkZ1ZkUUZqTGxITmlUSDN5UnB5TUp1UGdiQzZOdWZv?=
 =?utf-8?B?NWhzdmRMU1BkRFA5b2VKMnZyTlRZWXh3b1hvRnVyeXdnWFFQZlJIN2t1eDE2?=
 =?utf-8?B?M2VlUjBVQXdiVWNTcXFMQit6dDlTZmo2RXZuZHZHQ2ExYXQ5cjN4ZnN0bktk?=
 =?utf-8?B?UVhVN2svbE9qTGJtcFlaUjNLMmdyZ2hoWkgwUFVrR0RuZzJFdWRacnhLSHgy?=
 =?utf-8?B?bTZOd2hWMHR6S2FCMGdmZFlneTk5VHhPY09QQlpLS0QrZVdWUmppei82bHYv?=
 =?utf-8?B?OXdYRW1oeU1LdXlVa3RyZzdXWGZPRmtib2FjdExzYmNBbmo5RXpPUXh0Zmd3?=
 =?utf-8?B?c0NtTnRBOG9mSC9YVXorN1NFbUtwZ3VDaGVESnhYR1Z6M3BvQUZPQWJmYlVW?=
 =?utf-8?B?MFpETDdpKzVCM3BRQ01qckJ2Ti9aeWxWYVZTNFF5dWlTb092cC9IMGRlTE9x?=
 =?utf-8?B?b3l2OC9HNVBHQm92RjlBK0lxenlScFR5cjMxRDlFbjBCQUFWcm1GSnFHWHhP?=
 =?utf-8?B?c20rUXFzYUtGYlpXM3JPbkM3ZlRxTW1OQ1lnUWJYVFg2NVlwMjlET2VQbmFG?=
 =?utf-8?B?T0VVa1Y3cDk0b3AvMU96RlhNUXM2MnUwVWt2ZUlpbFV4ejRIZEZacnQ4RXF3?=
 =?utf-8?B?MXNya08yYkRaRnNoY3JqTzUrMzMyemdyR1pCS3ZtbURIbU9LUmROZXFWVlkw?=
 =?utf-8?B?ZjgwVXJhb1REbDZqSWY5Z21TckpML3kwRVRDRThFNDlod1h6ZTZDSzlKWXdN?=
 =?utf-8?B?WmJwbVhtWVFoMFFEdFdEZnZVbk1sOXRQWXVUblN0VDRxbjF0MVplbjg1NWww?=
 =?utf-8?B?QkFOVUU0dWVtRGI5c3h4MVZiaEF0TE1CMWl5eWxuWVZITUw2VjB3ajVNcE5m?=
 =?utf-8?B?cFNCV29hRTNUZ204ZjdSWTUwRFRGdmZRd2JWMWphQ1F6NDRxZEh5SFRSRmhD?=
 =?utf-8?B?S3VxeGtOaFJnY25jSEtKZk94NkVyZ2xOS1VvMHdZc3pxN2FJV3hUbTVZUXVP?=
 =?utf-8?B?bi95aHJSRlNaa0pVVEZDQ2swUTZwelg0MDlXUDc5WHh6ZGNsWUd2TVlzTEhs?=
 =?utf-8?B?VUM5VCt1SW9KMVdZNTNsbXF5eXFCWDRzNWJEYTZHVzM4OVNET2psOUhMV3gw?=
 =?utf-8?B?RlcrL0FHUGU2RGUzbVdvL0VJQ2F5UHU0cFRYN3FwT1NEUGZvTFd4NWo1T2tV?=
 =?utf-8?B?aEZ6NTFzUjJ3MjhBeXdsZTJDbnR2Z09KVzE3bGdQa1QxQUlJK0FzdmhTL0Iv?=
 =?utf-8?B?VHpuL3NtUmxLdUZKcVNXNUJNODQ4NmlpSkZEMS90OFlua0pQMVVkYmlGSDhw?=
 =?utf-8?B?WXdGUCtPT0ZWY1RFcjJLY3kzTHhCNzVaZjhZNWdOL1dRR3A4NkowaHhrejVG?=
 =?utf-8?B?YzFEbzJ2TFJNeGdkejVDb255YW5uRVdnUlNOSmt3Vk1oNzBuenFVYzE2cFdP?=
 =?utf-8?B?NEJUYkJ0bGx2UUhzcVNBMStxUWoxVlo0YmcydHRBOVB3QnR3VzdRaWhaQUsz?=
 =?utf-8?B?OW1pWHE4N1UzQUt5ZUw4cDkrdTJMamNnYjR3VHR0Y05JdlE0d3ptVThJK0dK?=
 =?utf-8?B?TzA5bnI2YVNrVWxiSnROQWRFUEs4cHE5WFdRWHNyQWd3YUowNXdLekk3eDNj?=
 =?utf-8?B?RnU5Uks3bk10TmR6b1B2NGZjUEs5KzBVQ0NYdjhVd2lTS0Fpc1VSWnBzSXlJ?=
 =?utf-8?B?bHlGTUNicG1LbGM1SmFHY1RKMHBhRGtjTTVTRDNjalVNZmtnSnBHdjlnRFRD?=
 =?utf-8?B?MENISFlSR25YbTlnMmhDZkx5UVVzeStJczRhc0hzSEJ0bS9FVEFYOENORG00?=
 =?utf-8?B?elFPODMxMDQ5RXRjSTNMYnlDQjhyNUJBUDVIR096MmRyY2VhR2xWUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0bd31f-b60e-4fae-03c2-08de59b4903d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:48:38.4519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X38PfrfOi3CN6eWwXh9c2InoBTH/kybfbmifdEDlhMrkKadVwxqvGOpXSVWwhn4yr04vm82fvo4b9hcSFayeqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6431
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BCD6F66D6F
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 02:00:49PM +0100, Jan Beulich wrote:
> On 15.01.2026 12:18, Roger Pau Monne wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -722,6 +722,15 @@ static void _domain_destroy(struct domain *d)
> >  
> >      XVFREE(d->console);
> >  
> > +    if ( d->pending_scrub )
> > +    {
> > +        BUG_ON(d->creation_finished);
> > +        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
> > +        d->pending_scrub = NULL;
> > +        d->pending_scrub_order = 0;
> > +        d->pending_scrub_index = 0;
> > +    }
> 
> Because of the other zeroing wanted (it's not strictly needed, is it?),
> it may be a little awkward to use FREE_DOMHEAP_PAGES() here. Yet I would
> still have recommended to avoid its open-coding, if only we had such a
> wrapper already.

I don't mind introducing a FREE_DOMHEAP_PAGES() wrapper in this same
patch, if you are OK with it.

> Would this better be done earlier, in domain_kill(), to avoid needlessly
> holding back memory that isn't going to be used by this domain anymore?
> Would require the spinlock be acquired to guard against a racing
> stash_allocation(), I suppose. In fact freeing right in
> domain_unpause_by_systemcontroller() might be yet better (albeit without
> eliminating the need to do it here or in domain_kill()).

Even with a lock taken moving to domain_kill() would be racy.  A rogue
toolstack could keep trying to issue populate_physmap hypercalls which
would fail in the assign_pages() call, but it could still leave
pending pages in d->pending_scrub, as the assign_pages() call happens
strictly after the scrubbing is done.

> > @@ -1678,6 +1687,14 @@ int domain_unpause_by_systemcontroller(struct domain *d)
> >       */
> >      if ( new == 0 && !d->creation_finished )
> >      {
> > +        if ( d->pending_scrub )
> > +        {
> > +            printk(XENLOG_ERR
> > +                   "%pd: cannot be started with pending dirty pages, destroying\n",
> 
> s/dirty/unscrubbed/ to avoid ambiguity with "dirty" as in "needing writeback"?
> 
> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -159,6 +159,74 @@ static void increase_reservation(struct memop_args *a)
> >      a->nr_done = i;
> >  }
> >  
> > +/*
> > + * Temporary storage for a domain assigned page that's not been fully scrubbed.
> > + * Stored pages must be domheap ones.
> > + *
> > + * The stashed page can be freed at any time by Xen, the caller must pass the
> > + * order and NUMA node requirement to the fetch function to ensure the
> > + * currently stashed page matches it's requirements.
> > + */
> > +static void stash_allocation(struct domain *d, struct page_info *page,
> > +                             unsigned int order, unsigned int scrub_index)
> > +{
> > +    BUG_ON(d->creation_finished);
> 
> Is this valid here and ...
> 
> > +    rspin_lock(&d->page_alloc_lock);
> > +
> > +    /*
> > +     * Drop any stashed allocation to accommodated the current one.  This
> > +     * interface is designed to be used for single-threaded domain creation.
> > +     */
> > +    if ( d->pending_scrub )
> > +        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
> > +
> > +    d->pending_scrub_index = scrub_index;
> > +    d->pending_scrub_order = order;
> > +    d->pending_scrub = page;
> > +
> > +    rspin_unlock(&d->page_alloc_lock);
> > +}
> > +
> > +static struct page_info *get_stashed_allocation(struct domain *d,
> > +                                                unsigned int order,
> > +                                                nodeid_t node,
> > +                                                unsigned int *scrub_index)
> > +{
> > +    struct page_info *page = NULL;
> > +
> > +    BUG_ON(d->creation_finished && d->pending_scrub);
> 
> ... here? A badly behaved toolstack could do a populate in parallel with
> the initial unpause, couldn't it?

Oh, I think I've forgot to refresh before sending the patch . I have
those as ASSERTs in my local copy anyway.  But yes, you are right,
populate_physmap() is not done while holding the domctl lock, so it
can race with an unpause.  I will remove the ASSERTs.

> > +    rspin_lock(&d->page_alloc_lock);
> > +
> > +    /*
> > +     * If there's a pending page to scrub check it satisfies the current
> > +     * request.  If it doesn't keep it stashed and return NULL.
> > +     */
> > +    if ( !d->pending_scrub || d->pending_scrub_order != order ||
> > +         (node != NUMA_NO_NODE && node != page_to_nid(d->pending_scrub)) )
> 
> Ah, and MEMF_exact_node is handled in the caller.
> 
> > +        goto done;
> > +    else
> > +    {
> > +        page = d->pending_scrub;
> > +        *scrub_index = d->pending_scrub_index;
> > +    }
> > +
> > +    /*
> > +     * The caller now owns the page, clear stashed information.  Prevent
> > +     * concurrent usages of get_stashed_allocation() from returning the same
> > +     * page to different contexts.
> > +     */
> > +    d->pending_scrub_index = 0;
> > +    d->pending_scrub_order = 0;
> > +    d->pending_scrub = NULL;
> > +
> > + done:
> > +    rspin_unlock(&d->page_alloc_lock);
> > +
> > +    return page;
> > +}
> 
> Hmm, you free the earlier allocation only in stash_allocation(), i.e. that
> memory isn't available to fulfill the present request. (I do understand
> that the freeing there can't be dropped, to deal with possible races
> caused by the toolstack.)

Since we expect populate_physmap(9 to be executed sequentially by the
toolstack I would argue it's fine to hold onto that memory.  Otherwise
I could possibly free in get_stashed_allocation() when the request
doesn't match what's stashed.  I opted for freeing later in
stash_allocation() to maybe give time for the other parallel caller to
finish the scrubbing.

> The use of "goto" here also looks a little odd, as it would be easy to get
> away without. Or else I'd like to ask that the "else" be dropped.

Hm, OK, let me use an unlock + return and also drop the else then.  I
think that's clearer.

> > @@ -286,6 +365,30 @@ static void populate_physmap(struct memop_args *a)
> >                      goto out;
> >                  }
> >  
> > +                if ( !d->creation_finished )
> > +                {
> > +                    unsigned int dirty_cnt = 0, j;
> 
> Declaring (another) j here is going to upset Eclair, I fear, as ...
> 
> > +                    /* Check if there's anything to scrub. */
> > +                    for ( j = scrub_start; j < (1U << a->extent_order); j++ )
> > +                    {
> > +                        if ( !test_and_clear_bit(_PGC_need_scrub,
> > +                                                 &page[j].count_info) )
> > +                            continue;
> > +
> > +                        scrub_one_page(&page[j], true);
> > +
> > +                        if ( (j + 1) != (1U << a->extent_order) &&
> > +                             !(++dirty_cnt & 0xff) &&
> > +                             hypercall_preempt_check() )
> > +                        {
> > +                            a->preempted = 1;
> > +                            stash_allocation(d, page, a->extent_order, ++j);
> 
> Better j + 1, as j's value isn't supposed to be used any further?
> 
> > +                            goto out;
> > +                        }
> > +                    }
> > +                }
> > +
> >                  if ( unlikely(a->memflags & MEMF_no_tlbflush) )
> >                  {
> >                      for ( j = 0; j < (1U << a->extent_order); j++ )
> 
> ... for this to work there must already be one available from an outer scope.

Indeed, I've removed that outrageous j variable.

Thanks, Roger.

