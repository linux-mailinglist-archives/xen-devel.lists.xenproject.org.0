Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IpBGgq0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB23D481D2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208969.1521098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCDo-0004Sh-5c; Tue, 20 Jan 2026 13:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208969.1521098; Tue, 20 Jan 2026 13:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCDo-0004QX-2L; Tue, 20 Jan 2026 13:56:40 +0000
Received: by outflank-mailman (input) for mailman id 1208969;
 Tue, 20 Jan 2026 13:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h83G=7Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viCDm-0004QR-OD
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:56:38 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4962e16-f607-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 14:56:35 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB7251.namprd03.prod.outlook.com (2603:10b6:8:116::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 13:56:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 13:56:28 +0000
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
X-Inumbo-ID: d4962e16-f607-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqyCb8CL7N4+KzbhP/4CwJI8nkrpUg4zgJ1/YSOYVcOPqrORJmtWDFSELpk+BsKJRaZ8pnjVmkPYYSQiZkM7TmwTKYmZP8Z4DmZO5oycYTbAF7z4mnJKaPBxf1ZsynmLDtkMXRUEk7ynu5pWNxRnL6jnmOepfdzZ9p5yDA3sf5eQbY+GnG7u5tyf8/AncuLFJt2klT1mRxKm4YLZQcjLqKLSMj6xbZ6km3JmTzQ9gbCg3iLi3jMbVIBRRuhuG/qfzRmTDESYlsUvB1H8lb0v/lbPmxTTIiMlGoEkKdxcGxc/11IDou2yv90hKIzG9NAfFxuFMOWUuPIC9jV0HtbGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vapi+1mXZ8RzyX51bHKRSTNZbdAe8NhJOKDNADouAs4=;
 b=RQg6e3qqbGzAKeHhneNw186EEZovXwf1WixqMZfno/GIwPYvGjl/o1sbEYGnwC2iri5ZzFY2rQRNHNWjiTZt+Wu0LsPZAMtTtZxSbTGTNt9Y0kQ8E9L5YQLtRd23wlDMRI9BWoc3GUq7PdlC68PVEEHVAsHSIV7HeRm+4txdWoMGXoMklzVWUhYcusNeA8bbzpnPBmi1qYUpIM+K5Jvvq3EubK9GnIseQjCA3JBV2SMaQceAa76PPYJprL7EaIq6HZxs2dzs72yWrtu3kUMFlmVbY/CqvCTSq/MLVRKiwbq2GDqqiMy4/Y4jD42Lm7F7rROeqG0e9ls/TZDCIaUHeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vapi+1mXZ8RzyX51bHKRSTNZbdAe8NhJOKDNADouAs4=;
 b=gD8bGF+qMM/WW1kTwg47ZEVpMuJpChMU/BFMkwSTDIGIdtjMOKQmASOcZZ7EJqqBXlF8RCWYmJ8xt8azTuVzS7BpJYiHU9GbzTUZtxJsTnY2zQa3g1eL1Xbi+H3Y6f3sx99lTbKFlqB22ystGeQrWs3i3etcYdYctS0TlybFwEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5e57b6b9-6fe4-49a5-bba0-fdf9e48bbb99@citrix.com>
Date: Tue, 20 Jan 2026 13:56:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] x86/intel: Drop more cpuid_mask_* infrastructure
To: Jan Beulich <jbeulich@suse.com>
References: <20260119193901.1354905-1-andrew.cooper3@citrix.com>
 <14a32e1f-c5ca-4d1c-b54b-c565184bd6e7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <14a32e1f-c5ca-4d1c-b54b-c565184bd6e7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0429.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::33) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db900b7-276d-4bd7-5b4f-08de582bb586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTF1MmRxYldIT0N6Qk1WM2JIekJZMUdpbXJPYi81aEpqNmRuWTJCS01GbFIw?=
 =?utf-8?B?blNFUlJsVWpkVEdaa0ozM3kydkg2czBpdnM2Snp6ak14YlgzSDdmVGxZRVFk?=
 =?utf-8?B?RzZUeG5hMlU5K24xOVFYYVlkeTFFZW5XYnFNakZHUVk0Sk1UZTBuVWdvRlA1?=
 =?utf-8?B?VTg4eU41cjJtQ0lUNHpMQjIxd0I1SnlrbHhDTHFzcDRxK0lPOGlpYVZsbmdu?=
 =?utf-8?B?UEhrblphd1pnU0V1bUhZNW11Sk5hZDZxUWRFRE4vcHRFL0dmT2d5OVA5VTFE?=
 =?utf-8?B?VVd0cU1aSFg5V3VoWko0anliOUdBenUweEc0SnRncGpNZERwa01zQ1ZzRzBp?=
 =?utf-8?B?YUJlRnJuN0t1M09VN1FsSDAyUWRMK0dxUFIyaHdPN3RJcVhzaEtreEE1TnF1?=
 =?utf-8?B?RTdMQWdwbC9USkk5WGFSajVWZUpNYUhOYzU0R1B4TTJnM0xmYlBXUUMxWkIv?=
 =?utf-8?B?SFVkeUhTczFzN1VRVGY0S0Z3NW9QSnZRd3UrSVJHSkZVMmdrUEEwNmVYb3dO?=
 =?utf-8?B?YjQxcjBid2dMTEIxdDVFZU1oMjBmQWFwbjJ0SVpGM0lYRS9ycUdzR0tDQVVh?=
 =?utf-8?B?SC9WcFd5eDg0ZmVKZlJZU2NtK0tENE5TSTFHMnJSYThQcU5sYk1ET2xGSkxL?=
 =?utf-8?B?M0NYakpDSmhMMm1pSFcwbTFFb3g5bGEvWVIzUW5vSnZDSllXMlp6WGVyQ1VG?=
 =?utf-8?B?dE9MeTlKZ1llaEt5SWFpMExYTWt0SW9MYW55Znd5WGVVZ0dBQUo0Wmc0SFlV?=
 =?utf-8?B?TVNGM0s1ZjRIMkZWVDFZbHdSUzFKaVVDUENoSGN4ODFqTTFsN0VLTG5MTWRF?=
 =?utf-8?B?TnZYelhEbnRiQnBsUTBHTUQ2MTQrR0R5TkNKcUI1enZSamhyZGV3MDVrTmhR?=
 =?utf-8?B?TjlodlN3OXdsdXV2UWV1RkIraFN4dHlSc0kyZVFTVFZ0ZDhtcGcvTk1yQkwz?=
 =?utf-8?B?SmFyUWIzWkZrUmZKaFdvOTJ1MEwwdllKdFhYUnM1OU1sR3p3TkpZRFdMbmdS?=
 =?utf-8?B?SlpDMWt1blhSd3BOREdxYXZadExid1daaFdWbmdpVWdWNHFNZ1paaVFKZGpT?=
 =?utf-8?B?bzhGMHl0VGJKSlNFaGc2T2g5UTUzbmNKUUkwUlNzWTM5cWpSOHZNVXZ5Wmp2?=
 =?utf-8?B?NTZVbkF5T3krRjdVa2E2MDczUkZLczZlOEc2Qzk2NmkyN1BGeWNHYUd6eDNL?=
 =?utf-8?B?NVBYZ2RiZlZ2Y0l3bVNUUDFtb2w4R2d5WHU4ZTUxcThWbkh0S0dPLzhuK045?=
 =?utf-8?B?MHhIM2szVkhBLzBTaDlmMXdxdUc4UWJLZk1mYUoyN2F1Z21ndWpXZjhCdkN1?=
 =?utf-8?B?V3NOTEZ0WWUwaUtCNzY5RUFvRWg5SVNTM2oxZ2RFNHB5WE5VV0tTa21NSVVu?=
 =?utf-8?B?OFhBaXphd3paVUp3VitBbE56eFJkcVhGTCtMbTcyOUlId1VHQjI0M0xDaWVU?=
 =?utf-8?B?RldmaVFkNGNkblRIa0tKYmhjcGxtL2EwSERoYVJxRjRoWTJRS1ZRNEpMUG9K?=
 =?utf-8?B?dVpzL0ZMOEFKQ1BjTG1XRGJMZXRaVm9CbFgyRitRUU50V3o5VDlVeXpGSEEy?=
 =?utf-8?B?R3JGRW5MbnROUUh6VTVWdUN4UHZUaWNvMEdNRENrVFlqRW9iWGI1N1krcUxR?=
 =?utf-8?B?T1Z3Yy9WS2F4Yi9zVEF2YVlwSUovTXZRemF2Z1c5dGkra0dUUmJmd0JkRjU3?=
 =?utf-8?B?bHEwZ1l3Mm54dzV6cEhscllobzFiY0JJVU0rTUxVUHRjVERoWmRINWppbVZ2?=
 =?utf-8?B?UE5tNndYblZPZkd1TzYyZWxINGJSeThBMm5hbWpPNiszNW1taGJTSW1QdzVE?=
 =?utf-8?B?djhXR2VLMGJldTU2MEhwcHVWdmhlUXUzUDJHeTFCK3M0bWhCZ2Q5REpDUDZo?=
 =?utf-8?B?cVhnREREbkxYWktTbllPdGZxcmVaakVRMlZqZnduUFVXVlhKMDR0N0t0TUZh?=
 =?utf-8?B?dEs0K28vcWQxSThPZXRSSFRZMXV4UTFBQTBZaXhCZnkrQTROTEV2RVM5bXZP?=
 =?utf-8?B?SnVIbXRJd0FSK1djVzBma29td1RFSWlVdnR1TkkrVGcvTy9qcGE3QThWSThq?=
 =?utf-8?Q?aQJ0oy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm82TkpieGd0Y1N0ZkFrUFFTeWFWeVRqR1pSSGNyRkR2MW5xTjBxTHhDdHJv?=
 =?utf-8?B?SklsYUErdVEyRzZONFdiU0trZVI0Si9SZVQwdFluSWJEZTQ3aTZ1aXdmVGhk?=
 =?utf-8?B?WnUydXNHNHRuTzUzQlUydnBZRGVKRlJWZTNVaHN6VU5yd2o5bUF5TWJrL1JE?=
 =?utf-8?B?ck43bTRGSnZaaUZBZGNLR1JsV0NLMG9TZGV3emF4RytuTGRkOWtyM2xkSHB6?=
 =?utf-8?B?ZzZ0dndqcDJjUk54MmFHL3VqUXVWQ0lXRDBSTE9iWXVvTmVzTm5QUVc2bllH?=
 =?utf-8?B?bkh1MjhobDg3b211V1ByZUUzRENsTGV3Q3BTSmNEM2Y4NkZtWjRNc0s1RXJj?=
 =?utf-8?B?NEdOR1ZtZFFWVHhIWGZ0bGtoU0dQZVVGR1RqU3NZa0JMRlZvRXpzRkJhTUxa?=
 =?utf-8?B?MGszTkVpSHRVNzVrOS96ZUFEWktWUUd5bXF2S21aNVZQUEMzaFNhd2JGc1Fu?=
 =?utf-8?B?RTY0SkhkTFRWcnI2QXFiUkc5TUtWYjhWMStGZEJVVG9wbUtLWGV1aFpOa1BX?=
 =?utf-8?B?d3NhR0V4VDhPT2Z1R2JKSVZxczlKZ2pOM0dvdzNWdUtDMkZxdUR2V25HOTdM?=
 =?utf-8?B?Z05CL3hCVHJQMVVQZlgyR1g4Z1RvV1hzZkdXSkYzK0VFenJnbTdFSUpOdTZ6?=
 =?utf-8?B?cVZxM1JVemsxOW1OYzNxeVdtS0ZpYjFOUjZEZ3FMMDhYb25JcjZUNW5BNGM4?=
 =?utf-8?B?d2dUdlZMWHQ2RGpnU2lMMzRxM3diVm9XNUdNV085Z2loUXQyUWJzcndqVW5i?=
 =?utf-8?B?b09kd0VhZ25BQkpNcmNqbStEdThpRzNEVTMzS0JrL2k3NGVBOGlJNEI0NzFt?=
 =?utf-8?B?UkxSMTdHUWkvSlByajBESE4zQjN3RTNuTmxjK05Ib3lqMEtEQUJMZ1N4dExE?=
 =?utf-8?B?aTNYZTl1TXFmS21aMzJkaUp4L0lXeXpwMVNuRTBwaHh4OEkvM3g0SmQzdUNm?=
 =?utf-8?B?aHptNGQvaE0xUXlIQTNJbzB5WlpORjZvdnplRU9ScVVLeHZ6cEsxbXZad2Vi?=
 =?utf-8?B?NDZxVWUyc01BSTFNbFlBbnJqSUhzaUw0Y2M1aHZwSkpzWllPWkdZY004UFRM?=
 =?utf-8?B?QnRrWDBaYnJEQ00xN3AyTE5iOHRpZmlyNFVmWjErMk1xc1hZdkZEaE1XQmo1?=
 =?utf-8?B?TmhuVklzT3Z1Nk1HbnpSdDVyNGp3dFRiYTF4Um9EUFBEOHllVVJBWWV5WVBU?=
 =?utf-8?B?KzF3bGNoSVhVMjZLdFA3UGdKMWpzRGVUN0Z2eS9iY0RxenNKeGdGWllyZC9Q?=
 =?utf-8?B?RUplQmhRaW84bWdGN2ZQcllqZkx6MUhoVERQS1hkOXlpSXhBdG5NWmJXT1Ir?=
 =?utf-8?B?a2JQNXpsUEozdVdMRklidEdaM2hvVjk3dnY1MGZrU0tVYkw2R3dnUEhEeEta?=
 =?utf-8?B?ZjNXSzlRK2RjSXZvS0UvcE91YlpjUmNFOFVrVVNlSE1PWGU5d0psT3BFOFY0?=
 =?utf-8?B?d0kxVGhCRExlaEFuZGhvTUpqS3RCbTM1OExOVGttbjJobWVoRHVoNDhBUXhj?=
 =?utf-8?B?ekhEWVNxMHJsWjlTZW0xeWRyNXFKNXZaZ2hwcGxRbzNNdk9jZW5CNSt6N2s3?=
 =?utf-8?B?ZjU5S0cwenFQQnArblVnQmZGSytNaTU1TGR3Z3BjYy9Vbm1aYzFKWmV1d2dX?=
 =?utf-8?B?MVBBU1preDVhQkc4ay9McXpRN3dabWtmQ1djVitrb0xQWDNRY0tTYUtTcVZZ?=
 =?utf-8?B?RXlTSzVnV29nYUowMHpUSXV4cVF2dFYvSmp0ZkV1K1BZVUwxUVF6Z3JZek12?=
 =?utf-8?B?TGxtczdRQjREdnlPZGdNODY1NVBRZjZwVlFNQjVJdkxGRTZzYWZVU2phQTh0?=
 =?utf-8?B?Z2xoKzRCOFFRV3NOL0JEOHc5R2xSL2FZU3BGVUdvQzJOUDNDeUJDd2daQmJV?=
 =?utf-8?B?aWY0QnhLcDROOTc1VkJ1ODRsNGY2OVJVSU5RL0dScUhrYU5vdWI0M0xsYm16?=
 =?utf-8?B?NlM5clZScHRwcHlxdDFjTkZQQXNDMWpwMWFrTnVRRW1BTHM5M1F1Z1d2RGl4?=
 =?utf-8?B?S1BDM21GSjNWSWV2SGtsWStsdFRLWU9RZmVxNE5HWUkvUHJIaVlubTEvTTdJ?=
 =?utf-8?B?dGlxalVldmg4TFdoSDZjemNJTXBBci9IMlIxRjZ4SDZnVytPdktaejNwMUlL?=
 =?utf-8?B?SmNCTGNHa1NzUXJZOVJmcHpnZjNzcmNqT1NrQUpQVG14a25VNitaL1U3OCta?=
 =?utf-8?B?RE11bUVpaUk1MXYyZncycHdEY3QveGRRd1lhUDVNZVgwYlFsSjVRQ2dnMHpl?=
 =?utf-8?B?eGFFWEZQaTNMVzUxNU82aDUxTVROTDU3c2k0TVV2M1lKbVhudkpoTUpLZFNn?=
 =?utf-8?B?dkE3VU0zREYvWSsrMFpsakN5NHFhOUsvdnNEcTlUYmQ0UnJwaFhzcHY0Qjh3?=
 =?utf-8?Q?xt4oLb8MFjsTfjQo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db900b7-276d-4bd7-5b4f-08de582bb586
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:56:28.7104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ec5AVA4BFirynOoEJE2pwUBQGyazM/wyIrsFpQZRku8u7ZsGAeBcQ1PYvXoMGCJMCLldM1v4h7Kdn/n/i/CCWq3TvPkB869UdY+BBate/ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7251
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,keepachangelog.com:url];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CB23D481D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 7:50 am, Jan Beulich wrote:
> On 19.01.2026 20:39, Andrew Cooper wrote:
>> Despite removing references from the documentation, the Intel parts of CPUID
>> Masking were accidentally left behind and still active.
>>
>> Intel CPUID Masking is even more niche than AMD masking, as the MSRs only
>> exist between Nehalem and SandyBridge,

Turns out it was Core2, not Nehalem.

>>  being fully replaced with CPUID
>> Faulting from IvyBridge onwards.
>>
>> Fixes: 317051c2f032 ("x86/amd: Drop the cpuid_mask_* command line options")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Yet I think you also want to edit the CHANGELOG.md entry the other commit put
> in place, to not have that remain AMD-only?

Good point.  I can fold in this minor adjustment:

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7de34f64d1e6..53d92a259731 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,9 +12,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ### Removed
  - On x86:
-   - The cpuid_mask_* command line options for legacy AMD CPUs.  These were
+   - The cpuid_mask_* command line options for legacy CPUs.  These were
      deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
-     2011 onwards.
+     2011 onwards, nor work at all with Intel CPUs from 2012.
    - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
      prior to the version 1.0 release, and there has been no development since
      before then in Xen.


which covers things suitably.

~Andrew

