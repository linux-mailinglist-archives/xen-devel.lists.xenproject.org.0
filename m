Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDdzCp9ccmn5iwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:21:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B17C6B202
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211649.1523149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyMz-0002wk-EW; Thu, 22 Jan 2026 17:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211649.1523149; Thu, 22 Jan 2026 17:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyMz-0002up-Bo; Thu, 22 Jan 2026 17:21:21 +0000
Received: by outflank-mailman (input) for mailman id 1211649;
 Thu, 22 Jan 2026 17:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxn8=73=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viyMx-0002uj-Qv
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:21:19 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3153709-f7b6-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 18:21:18 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7645.namprd03.prod.outlook.com (2603:10b6:208:4f3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 17:21:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Thu, 22 Jan 2026
 17:21:15 +0000
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
X-Inumbo-ID: c3153709-f7b6-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAdlxUH5Mn2lknbYjSyuNB8Mfa2j3eTtYvoO5HiZIqTlFeL3wNeuEn8IAOZzE0dHt54JZLaUHHpao8tyh8yew1q94t54X57zOYmzK3ks4HhZn78O2eUegNfm8eq72qyIKNcyMMKR7gmA+CyWb46yxtBhMKVpzLWIRoxAkDspHQJwRsiiTGbWvrGhU/vDJxS6CQ7o+8NbuACi/+bX28I43YgKAxJ8LthFz09pzhBPlqoIN50aUOWsKeXlGglbZ9QYem/7FL+9288SUVTXLUm3opvmiOKpYW/jpQC+28qkF8qpqVuBnKc264MahS6FPBDyHlhUI1c0X2tf9dCMCU0vhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rR1jB7FooJ7PNtsTybWfKk6BCZ5AbQ/5F44YqzQJME=;
 b=pcoQVAQ2Nuh+t1nPSqjGA3f0Wb2DxWaZdoaChfaIQpCy8/+NytrqxVTrQulzaZzG3y7XW8FQxWjIPuc8E4ZbF65Ptu5a6Fn7hCZVWJgKePu5jytK67yWW5/rKBfMas11dCD0j6qbQ76x0v7/RF9j+CN9D3sZLBg3SlhG9L+SpSJ2nAz8qXPhlw6/XXvhN109kaGZOJ9Z8eu1CaUeYjADHMAhfMuflUNp7LE7JgaIdBgbuCXfeTTHsjFnHWi347Zwdby/0hM/7ewggKkK4hB0v4oRy2wW8jSIaAslKHVGwcev4H86Ilc0lhHohlvZGMQSQXoMa8kkcDcjCxD/St13Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rR1jB7FooJ7PNtsTybWfKk6BCZ5AbQ/5F44YqzQJME=;
 b=zdhPH64TqMjnYH6EVXUmZW1u+Cqt6FJSPyZ7SQOcBgTNXXy8qWQ9J3RsenT4700AjwiG5FYR0n5c+RRauC7kIk+nqvG84YKSGtQUUicIhF1y0/GWE99DfOehNmhvBcuCc1a0/gg+KrZQ96E6FxImOkc5XliuRLYgfx/V7Ow1CZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e46ceae9-0680-4fb9-adb9-84530745fa4d@citrix.com>
Date: Thu, 22 Jan 2026 17:21:12 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: MTRR init sequence in Xen
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <145af46c-eab5-4d0f-ba35-4ae646c0e4cd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <145af46c-eab5-4d0f-ba35-4ae646c0e4cd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: ebede1df-5ba0-40e5-afb3-08de59daa615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGVpNm9CREVZV21zeGFndWJ0QlNaNjl0S0dtRW02UVQ5S1h2bis2OWplWThW?=
 =?utf-8?B?RHZvQWdybEkwUG1WMlRzRzN1NUtORXNSSHhwNWhtbFp5clI1RmJPM1M0eVlo?=
 =?utf-8?B?MS9xRFpkamZSSUlFL1ZHalM4Y3JldjBtM0llRXEzLzNNcWRjRlpBaStyNCtJ?=
 =?utf-8?B?VFZVSjBzcUhUcXgxeUM1eStDbkp5ZzdVLytrM0hGRnEwdnR0eTZROVl0SjdG?=
 =?utf-8?B?bkR0TEt4WlNaMXFyaXQ0ZXpYU0U4dkFrRGh4aWVtdDl0ZVNFdmgwVjhNU1BN?=
 =?utf-8?B?RDZldFpHYy9YTkROMmloTE1sbVd3TGN5NjI2cEw5K0Vzb3U4eTZ2dE5nL3pE?=
 =?utf-8?B?SURkdlMxdVZmWmtIdDVDcnpVRGtZVC9IcXdQUTROcVNWZzduQmJ6dnkwVlB4?=
 =?utf-8?B?anJCenc4YzBmS1JXa21zai9LZ0M3ekpsQUlKVXpqR1lUem0vTW5hdDQ3dksv?=
 =?utf-8?B?UWV5YkhRUlBGM3gzK1gzdk1tUE5VeTRvSnNtWWJ1ajN0aEsyQ2xKSzVTRW1G?=
 =?utf-8?B?dklQT24yaU9iVGRpSGd3RFdwRkFZZk4vTC9iK0xtbnp4NVVyS25ZOWViekJk?=
 =?utf-8?B?RkNPMzJLZEIwM3pUeHJuYWhoNGJrRDJTSDNEUTFCcERDSS9KTlN5MVdwV2Jm?=
 =?utf-8?B?S21HdW5aTWJ5QXFITkNQcGlUSGFHRi9UQnB1VzBkZmNwSTZPcUtKQkg3ZDRi?=
 =?utf-8?B?eFk1OE5laDVKM3ZtSGFWWEhmb0pySms3ODhwLzdldTd5VDNsS25RNTNIV0hU?=
 =?utf-8?B?NC9MNW9FVTRoMWVhb0F3dDlXMXhBUjhXWmlTTDdBa0RudStNWlBRaWNweUwr?=
 =?utf-8?B?V2IxNFNJK0t2bnI3YktNVm1WSWs5VzZNK0ZFWjMrVDVteUx1RytybTdyNkVu?=
 =?utf-8?B?QmFuZjNsdzlkMHA1cG1ISUJiUytjYWhEU3IvTUFjdkczYis3dklzWGpDcEND?=
 =?utf-8?B?ajZyOFFSZnduVnhxVHdIeFRLdTZoZmdxSjRaMmJtenhiUW4wNVZYTXhTKzNw?=
 =?utf-8?B?NnVGNjVudDhlMXFNbTAzbnhmK1hobkZkZ0NyRVYwOEZSMHZFVVJLbk5GMXZx?=
 =?utf-8?B?MmRMd05hT25GaUVoY1BOSE9PSmc1Z2lyTnZxdDhray9hdHFSdFk5VlRDUlhr?=
 =?utf-8?B?R3E5OG10N1d0TzIzR29RQ3padWRRN3pKekh2NURadlVpcWIvS3lRM3U2bUQx?=
 =?utf-8?B?Um4yOThiaVFJeGhvVkxWUnlTWDdtNjdYV01VSHlSeUd0VGJsNTliUFNCVkRk?=
 =?utf-8?B?cVoyMTRvY3g2R2pkWEpkREloWWxPTUdkTmdUZmJ0NXAwckh6QnVTeTZHMUw0?=
 =?utf-8?B?NEhDSXlreW1nV1JncUVCSHZucWtJK0ZTNTFJNVViYkV2SEQ0RG0waTNBeEFF?=
 =?utf-8?B?ZFp5dExzSjRKaENpdUhVWHUxL2lXajUyYWVpL09wTHFNenQvSlNpNVRLL042?=
 =?utf-8?B?Yy9wUWwydGEvNm8yUjNkYklRU0tUMFBsMTk5dktPL2VhaXV4L2VManNab2Er?=
 =?utf-8?B?QXhPbTFjYXNyZkZHWS9iV0RxU1ZHZC9VSG5lSTBxTWJjUDRlQnlpOGIrNUds?=
 =?utf-8?B?UkU4YWd3N1Y3R2VCcFlLYUxwcDZrRTFBcGJ0K3FTUS82T3VVRUtSRFRTbFpS?=
 =?utf-8?B?bGNKVWpLZzFac25rU1V2ZVpUdW52cXdDekFEZDRqSmMzNVRkRWdrRWhxeW5u?=
 =?utf-8?B?NCtjRXhNaTRDWjhnUm5uU1dNajlsUUVNVm9xZlhDL1FSQStjaHhmemFwVW1w?=
 =?utf-8?B?NUpKT053KytwUU1zVjFTMkpmaUoyUERjZXJWWG1pOVBqdEFrQzg4SGFYOE9o?=
 =?utf-8?B?N0RPSnZOZTIxbzRZa1dpMmJMT3lVWTRET05oN3dYZkt2M0x1K2dCSkRHY2FH?=
 =?utf-8?B?Vko3a0l4R1A5YzNlU2xVZFdLMXB1Ylk5UFlkZ283eENSL29YQXZxMDRNelIw?=
 =?utf-8?B?MlkraGJHQVQxRzUvNnJzaC9wdnlSclNnemhsclh2TVNXY2NqZHAva1ZhbXpn?=
 =?utf-8?B?ZG8wcWxaQ1FrRGFrclZZb3RZYmhXYjVnTUtzN1laeFpGVGR6UWErZ3JRUnhR?=
 =?utf-8?B?Y3VsWEM2eEFOYml4RXhvNDZGcUtJL1BhSlZ0MnhTTDZXbHRoTzJUY1VwUnJZ?=
 =?utf-8?Q?/sY8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnpIRGt0TnQ4ZEZWVUk0NWpFT3o1NGsvbWhGQ2lPV2E4YllPYUl4bVZSNURG?=
 =?utf-8?B?UlBDd3A3aVVpQ3dRcE01eS95WTcvbTc3SUFjOVc0cDE3OEx0S0I5NFB5T2xQ?=
 =?utf-8?B?TytvcHdzcHZoZGs1WnhSMmNKR01mWUc3bVlxRXV5YjV0Uy94QUtDN3RDUTU4?=
 =?utf-8?B?UkNQbCtuNmYreEtnVmw5VzEyWCtURXRGU0ZDQm02M0dleUZmUk56dktxV2VP?=
 =?utf-8?B?REpnRThOQldFd3dZdmVFcnk2RUFHUkhDTUxpL1kxQ1ZTR3JpemF5M0FhcHZH?=
 =?utf-8?B?WXBJTmtFQzdwcDNVSUhjVnFRQ0hpTVpQdllKSWFrOE05MUQ5ejR6TEIxeUdL?=
 =?utf-8?B?eDZIa3NxQTNKRUh2YUZZb3N6Zy9JZWZRaGZxVHpFdTQ0U2ZUTFQxRllkSUQx?=
 =?utf-8?B?aWd5dGJYMkV6bkRKdkJjZjduSDFkZFgyT0NWTE9OclZnY3pKd3NzNDFLdVFo?=
 =?utf-8?B?dmVLcXZGNXNRK3NFVlhSd0tSTXllVFF4aVR0bnl3T1RpdWRYVFNoc1lmT0RX?=
 =?utf-8?B?YWpNRXNodkU3L2ExOXpnZTE3R0EzbWNMTlNMd3lBUER3b2VYU2xYVGlTRXIv?=
 =?utf-8?B?ZEw2VHFBT2tnT21vaVdIMUtoTFA1NGdiRzI5b1h3MmFIazZ4U21oWDBOVW1R?=
 =?utf-8?B?R3h0L0JkS3BPNkRMNHhGR3RJOXJWd0pIMVJ6cnFwTk5KL0lybU10WVZFc01F?=
 =?utf-8?B?d25raVJ2V25rRVR6dU45ZDBZK25XUnZScGZwTU5xcnZJRTFUVDV2V2hiUGpI?=
 =?utf-8?B?UjhNQThBRTRqOTlyV2FUNGx0ZmlybHNqbTU3d3JDbHVuK2VLK1NJczVmOENB?=
 =?utf-8?B?QWoyM1B5cXFuclB4OTg5V1hPQUsxbzRUMGdWaEZJbVNrdkd2cVFadWF3U0dP?=
 =?utf-8?B?dllRSEoxUk8zTnZMbXcrVXJ5MDZxVm5OODMzVXhOMUgxMnBJOEx0L0IrSEVM?=
 =?utf-8?B?cnl3TEx0c2M2ZUFRUWhNOXhEbXFKWVVqd1BkczVtd0k1ZWN1VVhGM01Jd2J5?=
 =?utf-8?B?Q1RUZEh0TE5mZVNIRkdhQjVwL1FPd2xRM0NoNm5kOHhCMHVyZzdaYzZIWGtK?=
 =?utf-8?B?UE84cjJ3QzV5bWN0V01mTFJ0YVlVV0YvdEZlZWVRN1JQZU5QVEJHK2xjWDdo?=
 =?utf-8?B?eE9HZVpRdHlGazNJVGRNZmFNMlFlMDVqQ2svTE5EM3puekg1THkvNmNsNGdU?=
 =?utf-8?B?Y3J3Y055QlhaclMrQVE5K3VGY1RGWWlKM3BxVnBwZktROCt6VkNaRWg0T0Nx?=
 =?utf-8?B?SHJ2Q0E0MGRjN21GdXYvQi8yU2Z6ZlNqL2V6Wlo0OTZJQ1hockhIMTJLOWNi?=
 =?utf-8?B?bDdMWkY4cTZyZlo3am9ySUhIT0lQbWtMRHVFMmIxZlRrVVFjUWp3cG5qanl0?=
 =?utf-8?B?VHlHZ3E5SWZGYndjZUpBcHk0NVg3SmowNXNBUmMzVmVmc2wzb1NyczlyTXBt?=
 =?utf-8?B?VjBEWTJ6UDdtU2ZDaHdTYmpZUlpEZHMvbElBbTNLMDZwdmxXTHhoejlEaGNj?=
 =?utf-8?B?SnZmckZIdWxMeDJjYlZpOE9BWVkvZGtlT2t1NVpFNE1IMHJPSVErTFFwSnBo?=
 =?utf-8?B?aE9ZUG5ZQ21GNnJmUUd4ZjY1dEcweURhbWtyL0ZSYU1ROTdnbXRuUnJ5UGZI?=
 =?utf-8?B?RU03Q2pYeGJMb0ZheE54dWthdnVaNW9EeHJXM1BNLzN5NlNjSHIwOGhtQ2cx?=
 =?utf-8?B?bXR1SnVjOC9ncVMvUXpySi9jeGN6OHBJZDQ2RjNEN0FoVTE5K3VtYmlvTGVp?=
 =?utf-8?B?b2o0ZmJHS2Jvbmx5eXVibGR3TklscGZGRWpNK0FGNVlMMTR6aVBIVXo4NXFy?=
 =?utf-8?B?c0k2QW1ORjhYZVZKQXJQTzl4cUtCRTlTWWhUd1g5cmxCcDJnQ2h1NjZDNnZy?=
 =?utf-8?B?SDUwN1JWcXlEOEs3OERPSWV1b2oyVlczWWNYZjdxUXpSRlBhLzVUaE8wYWJJ?=
 =?utf-8?B?U2xGallnR002SXducjFZRmJVQ0pYbmpWM1QwWkJVSnM3b0s3cDNNWUJIV0pS?=
 =?utf-8?B?T2pJdUtvdVFyenlFbnBjZUtLN3pCYisyb3lnMXJYR0E4Vm0vYXdvM204R3JP?=
 =?utf-8?B?TzJxQTlIdnpZMUQrd3cxODlGSDZKMXVObCtjS0RHdXpXQWx4NGorK2k4TkdF?=
 =?utf-8?B?OFIrSHZTVGJKM0JKZnpIUllRd3JTQ1ZJaTAzaVRPdjRmVGpjKzNLemdvZnhV?=
 =?utf-8?B?dHRYa05sa3l6Vkd3WmxXK1doN2t1WWtNS2VOU2dBNDNHM3d1UG1UbEFYdTVz?=
 =?utf-8?B?YVp1ZHpGT0hQamZOTEdEUUhVQXFqZjhzRU1xT002Qi9hSUZqeHQ5aXovNndZ?=
 =?utf-8?B?aXhTNXp1bXVlVXJVdk5ZLzNFYm0xUEV6QlZRMlEyM1JKSENkUDFHTUpaR0pP?=
 =?utf-8?Q?NyO3LfksC4ODbOrg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebede1df-5ba0-40e5-afb3-08de59daa615
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:21:15.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKOCKDBGpZIOB+BNdsq22Yi9u61ZTXBrHdh/O/CXHtB8Uu7E8aFurOw+mfT1WFfiSj+2vRFeVca5Vy3v/GJeDQXY9hIwfs1yXTZTbW+UtMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7645
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.883];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8B17C6B202
X-Rspamd-Action: no action

On 22/01/2026 3:56 pm, Jürgen Groß wrote:
> Just as a heads up: a hardware partner of SUSE has seen hard lockups
> of the Linux kernel during boot on a new machine. This machine has
> 8 NUMA nodes and 960 CPUs. The hang occurs in roughly 1.5% of the boot
> attempts in MTRR initialization of the APs.
>
> I have sent a small patch series to LKML which seems to fix the problem:
> https://lore.kernel.org/lkml/20260121141106.755458-1-jgross@suse.com/
>
> As Xen MTRR handling is taken from the Linux kernel, I guess the same
> problem could happen in Xen, too.
>
> As the hang always occurred while waiting for the lock, which is
> serializing the single CPUs doing MTRR initialization, my solution was
> to eliminate the lock, allowing all APs to init MTRRs in parallel.
>
> Maybe we want to do the same in Xen.

I suspect Xen might be insulated by the fact that we don't have parallel
AP start (yet), so we don't have the whole system competing on the
spinlock at once.

Nevertheless, there's a lot of improvement available.  We still have a
lot of pre-64bit logic that we haven't purged yet.

~Andrew

