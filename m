Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348C3D2317A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 09:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204263.1518972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgIed-0008Mm-8x; Thu, 15 Jan 2026 08:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204263.1518972; Thu, 15 Jan 2026 08:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgIed-0008K4-5j; Thu, 15 Jan 2026 08:24:31 +0000
Received: by outflank-mailman (input) for mailman id 1204263;
 Thu, 15 Jan 2026 08:24:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cICa=7U=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vgIeb-0008Jy-HC
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 08:24:29 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9918c11c-f1eb-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 09:24:24 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7405.namprd03.prod.outlook.com (2603:10b6:408:19c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 15 Jan
 2026 08:24:20 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 08:24:20 +0000
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
X-Inumbo-ID: 9918c11c-f1eb-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ksi2qvca1KBMEyxWCTWnEc7VBF9mbIVV+jXSA0ZO6CGoVcaXE11ASOnvDFm478K+3x+ZTOs6mrjWjH3rfR5oSCISJhsHhSUJwFhogsoukraBIdxQMonGQLBZZku9645Z9dfUs19/IK1mM325KQEX0FL3onFiCq5mf8QlK0wtQuowOz6dBz5+m1+tozoKSn4N/4NdgGspPn/T8kbe3qZrLhTDHqEz2UhdFzgyRXznoi+gLZC2NVe4WbJKF9OqzPC9sFN3lOMNbBthFxLMnAvdcyCIwsWArqds0aVuz/WL9Ppno0T6dUf/Q7bvvk/uqZj89ZyH8OUSud56w6xHk4QXZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWbM/gihrIFqE2bja28+nto3VqlAb8waADxRcQuJ7t0=;
 b=dZVAPSlM/94DiAQuCAoeFNdyH0lwFAGO4Shr4s2n3sRAUHhBRGTAmxaI8xH4laC/o3ZsVrR4iJ7yDAxxfyoDFP52oZVgCdtCSF3Z6eREa/lIQDNfmGCPKbRLyuiXi4kbcKNRJf+MhwUVfg6G/KnV148n02AHuSfb2wXC+fGWH/jz1inoVA5bJLQo28jubpM55SFVXAKn+1NFtRJpnRSn1iRRWWoI64j1ho0xLI8ivLMXHZV2k9zbVkopI2Vo3MSMzwo+k2IprMcwp0LdUQ5FcVn0/ugsxr+gyb39bPMQi/6qryAz+jISPui83e3pbGuOC/1D5KA4lZMVkdhnF5IW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWbM/gihrIFqE2bja28+nto3VqlAb8waADxRcQuJ7t0=;
 b=D56A4AUofk5l8KtDa3BfcLoXV3RuRoBf9uzOlY+bwAbumhquQb7n/P7gccYDTny4bCGGmrK6kajgM0BoZ2KCGHwmBjI+m8VL+0VL4YrZPxjSTjZvopVxf6LMh18e8keAyLjO5FMQ6wD841j+zcSl3ST17R06sHHAFZIon4wue14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 15 Jan 2026 09:24:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
Message-ID: <aWikMGJKa3VPQQzi@Mac.lan>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>
 <aWfXJk90Sh7B-qi7@Mac.lan>
 <e9205e59-fb1d-429e-877d-28aa8cb950ca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9205e59-fb1d-429e-877d-28aa8cb950ca@suse.com>
X-ClientProxiedBy: PR3P193CA0023.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::28) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: 057c4207-be0c-4d4f-7f21-08de540f7b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WithektTL0tnakx3SHk0Tm83ZmFacDZOcGZJbHZyaHQ3SnBOenBvcWdMc1Mv?=
 =?utf-8?B?cnZldjZGQXIzdTMvMzhLandJSUpBSEwyT3haTEEvQS9vRVB2c2ZQZ0JrSG44?=
 =?utf-8?B?RjNqSUJFaGNxODZxaFZTR1BleXVBMGNQOFMzYzUvRUM5YUVUd3Q2ZmpKV0Z4?=
 =?utf-8?B?ZGM2U2FNa3FFSk9ROVZMeEV0WDhPTnQvamVUV0lkTU1JMWhaRWZBczkwQWdE?=
 =?utf-8?B?bWlNSkVFWGxEK0U1dDdud2swRGJuYkRsKzllV2xJdk1oWEZNOFdhRFlDYjQy?=
 =?utf-8?B?R21UREY2NDlROWdWblNaZkVPQkF3TFJaTVQ0R2xhNUZvNUJjb3RkOEdycm50?=
 =?utf-8?B?WEZzWGo5cVhHSkJ6VFRTTTM3QmJzdnpaWE80RXFJcWFaN0R2ei95QWVGSlJY?=
 =?utf-8?B?eElua1BGOG5SbkdHbWpUcklSWHNSQkJxeGlCbGFlMThYNndneDlzMjRqczJ5?=
 =?utf-8?B?NnNTbTVzazU5MjBBVjVTWXZvRTZWcGhlK1VFRk1mSFlUc1RwSWVGUEJZdmsy?=
 =?utf-8?B?aTlVZFNMdTVZcDloU2xNVERoSi96emR3SUhuK0dvWWNsK2dBOUdXM1lELzdw?=
 =?utf-8?B?cGQwTzlyK2orSUhCNTVsZ3ZDUXMwb3liQ25DWVZvTVErUWhtbStTZjNwc1J5?=
 =?utf-8?B?ZmE3L3BwbFNjYzkxZFpKWWRJd0VSMWtMVFA0RkdjM3JUNlBNdi95aVRWL2cw?=
 =?utf-8?B?b20xZEJZbnhLQTRPd2FVdlVQSUpxT0wzUENMaksrdkNIaFdVbkRwNlNDN1Rw?=
 =?utf-8?B?SUZGTDkxYkJkQzdjdmw1L0c1ZVp2VjhtVDR2enJGTXdsR0s2WkNHWk01UXNV?=
 =?utf-8?B?S21ockpCSWNCV1F0ZllZTzd0ZFQ0ZUZuMXI2bG5YM3B2NWJwbGlBUGtlMWZK?=
 =?utf-8?B?bGVNSldEcDV1VEh3Y3dONmhHM0lTTXd1aU55c3dsQzEvNXpnYnhBdnVwQVVa?=
 =?utf-8?B?LzJSaGZqaFdUZFpxQmk3bnBsNEp3Y1V6K21pUUx2a1NXTS9jOWFCV0REZUNT?=
 =?utf-8?B?WjBtSlBoWlNZVnVZMmRrNEh5cmZTcWt2bElESGt4MDloaFdSekxLQzRWMk5T?=
 =?utf-8?B?eUJGVVZFSkpZZFVIaVVSOFJCS3FSeTl0cWJvRm5Fa2hpakNBMGNIb0FsL2J0?=
 =?utf-8?B?WEVnZ0QrOFlrSlVZb0dSQVRTbDZJQmllQ1laN21UYk9NYU13RFlmaFAxOHBL?=
 =?utf-8?B?bGVaYUNOelFxcld1OGVhRzkxM3VoSmhMV014VGVZaDRmTDN5NnNRSUpPcTBV?=
 =?utf-8?B?SDFIL2dLa2ZaRjFnekd0WEg2cFY3QkhsMjRZR1RscXBZOEloTUdWYXgzNkdP?=
 =?utf-8?B?R1pZWWU1YnI5NmRMUlYyb3VPMk5UUlpNL3JFM1NmOGRPOERxRjNOR29vTnkw?=
 =?utf-8?B?K0kxZGRkOFZ5cXZxa3VEWFpxbjBmMm9CZUhTTEd6U1dMN3VsK0EvSkZtSmJs?=
 =?utf-8?B?bUF4ZTFDTGJ4QXp6TXJMSHQzTW1YcFF0ajJwenpkQWs0TWgwM2Ftd2pHY0ps?=
 =?utf-8?B?dUVlZXJXYm1sTGZoODB3RjJiY204R0Y0dkMvRkl5czUyVlJ1b0YxdjZEZzZl?=
 =?utf-8?B?aTAzTGFWQUh5OE10ZnlJZER6Q0VSNjNrbVRaa3U3Qnh1cTdvY1JQYjkvWVBz?=
 =?utf-8?B?empJZVJqRXljd2ppeTQ1eC9wcDd1UjhRN2daSGNic3dKNFBwdW16Yi9ZZjVV?=
 =?utf-8?B?VnB2dENmME9lYlRjZ0tMRW1CVFZucmZVaEVFYWE2bDh2eE5uSi85NkU3MTBZ?=
 =?utf-8?B?T1V0OGlmQ21heG5IOXYybDR5WXE2eHFWVU83VDRJOGxxN0c3czd5THBMV0Iw?=
 =?utf-8?B?d0JlaHhTMnNNSm5qMDJ2S1ZzVllqY1ovSlBMUVl2bmlZWTVEV2o4NXM2T3hu?=
 =?utf-8?B?L3hXRU9VZGVNYUNlZHIyTW85cExwUmQzZWEzcE9XT291TG1ISllkbnJsTncz?=
 =?utf-8?B?aUR1eEtCQk1NR0ZQY3NUakNJNzQ2KzBjZ3BTTWlaZEFmdURsVVY2WU9lL2pr?=
 =?utf-8?B?ZEhNME9zQnV5THFGU29CYzBtWWNkSmRSdG1FWUdkKzVLNUZLVUhCaGo4cHFG?=
 =?utf-8?B?T0R5aVBqUVdBTU5MUHZ5SnQ1ZEpnZzhoOW1LckZjelpKaFFlZGJjdWV4REl1?=
 =?utf-8?Q?YYJ8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTdHQXYybzBzUGdHWDdFQys2UFNqT2RjR1ZsdURsQStUZWJuczlqZ2VyNE9i?=
 =?utf-8?B?cW1Xc2lhdDZxTmRJSTJ2aUlubGtrdEdLK2pyUm1Qbk15OXdRQUtMNmZUTEgy?=
 =?utf-8?B?WExqbjY1QUZMaVBlemJsak16d3JuUmZmWm5Pa1h2SXNKeFBFUnloOURxWHpR?=
 =?utf-8?B?WDB4b1lQOG43dzVkY3Z1cXNobzgybXoybmUram5pR1BTQjdRbDJPRVZqbG4x?=
 =?utf-8?B?QTB5TjMzRnJpVkFaaXI4b2VyUTRqb2xueWQwTjFaWE1GS3N1S0dkemw5T3NY?=
 =?utf-8?B?RUpWSXJyZDJ2VjFuaGdwdWZtK1I0Vm14T0VDWDcrZ0dWN0RueUE0SHZmOU93?=
 =?utf-8?B?VGEyVmpOWEM1VlI2VVBxSkZlb2drK0VtSEdBOGJLM0JYdEZZT2owOG5UbEJo?=
 =?utf-8?B?cGZPaWZtVmsxQ3JMSmpnVTJKTDBBZWJOc1huQkk5dlp2WWJYcFArcGw5OUdL?=
 =?utf-8?B?VmJxMmkzQjU5V25QWEtHM0JqbGlPSlA1UjE4Z1RuY2tGSmRjK0JKT3E4cGh1?=
 =?utf-8?B?Vm5kNlY5cDBVVGg5TTBaMzcxSVF0cVNJanhFbTZqbU1QUVNpdEo1MlRyZC9m?=
 =?utf-8?B?OEVnK2U0OFE5d3Q1blRQM0R1SFRjTFNwdk1Hc2pyK0FNZ1RYaHNVcEdGU0Fs?=
 =?utf-8?B?cTFrckZKMkRjcE8wd29RZGx4djh5TkJ2b2Q2aTg2dzRYR2RSY2ZPVCtYNTM3?=
 =?utf-8?B?b2kxaEhkbUo4WkxjNjA2aG1aSHhxSGZOYmx2OVU5Ym8rMFZyMFI3VHNoNXJt?=
 =?utf-8?B?VDNTYVhRQzExQ3VZSmlDYzFqVkt5ZXlWbmphcFpEQWhuM2FOWlB6VWU5TDlZ?=
 =?utf-8?B?aTMxcWJ0U0tqVi9OYjFwV3VmdG96cWVmN3VlRXdSUWd2bmJzQ3MyNTdOazBH?=
 =?utf-8?B?cm9oQVZPRWhTczh3UnJwd2p4aUs0c0RubDVvOGtEbW1GenU3T0NPSVNBQkNO?=
 =?utf-8?B?Ry90Tmx3NkFzekFIUEM0SnZoTStWeW84WkJ1dG1oRVdEeGNMb2VuNm5Qb1FK?=
 =?utf-8?B?MWlGYzhqME5pVHE2YjJFMTFhUFA5RGsyL1dhMDRhRkhDTnZwbzVhRW9RaHFp?=
 =?utf-8?B?QnBtbnp4WGl4VENYaXZtbTBQb2JhN1JwbEtLMG5tRG1KRW0vSytmL0tLZE9J?=
 =?utf-8?B?OUpyVUZXRnNyajMrYlNJeHhtRTFLaU1mNjdYVm00ZFRzRE9MTitOY0pERUF0?=
 =?utf-8?B?NEJ0anZpSGJUdGVjalpWZldXTkpwU1ByUGhXVVJiTDRuR2JpaUUwNDBsQlg2?=
 =?utf-8?B?bU15QzAvNDlJdC9TZ2RESVFZaWNIYXh2NFNBZW9xdkgrK0NCZmNraGYwS3JD?=
 =?utf-8?B?M0ZOS1dYSHYyQlBPME9FOUhwYno5UXpIMmU0QWZDYTI5NWRjOTIzK0IrQVhR?=
 =?utf-8?B?M0FhR1dzZEhPVjBGc3pJMXdJVzVFeURrYnhoMWRqUFVHNUVEUTJEdnMrUDFq?=
 =?utf-8?B?dFliemN5RG5OQkFCSTYvTDJjY1FTYXFrTnZEdmJBMUFpZm1oWEVZYnJ1RHp6?=
 =?utf-8?B?QXVGc010ZkpKMzFSTnZoSXhuakdWVExNdkNQUFJPb0c4Qkhia3NSaUpPY3py?=
 =?utf-8?B?UTQyUnVOaldZSEJybDk5RlNWOWpVRHhLWDBIQ3Nnd1IxUStjenhhZlUrenc0?=
 =?utf-8?B?WFlydE9kYTRBZlJiQ3NabDBnNUxnYnJ4b0Nva3VNVFllVnNFVURRZ09UVCs1?=
 =?utf-8?B?TFlwak9mMXBXTkJIUGIrUlFqemV6ZjVyOG8yd1dWK01LQjZvYjR3RloxdVI1?=
 =?utf-8?B?VkdNQmtldTRxRDB6WS9ycmZCYWI0VlNOUVRtM3lOYkFCNlB3YVNhbGFNNVZJ?=
 =?utf-8?B?UUR1WjVGWlltMGVGZE9kYndYL0FEL24rRHVFMFNWclNEV04zR0duNEtSYVVu?=
 =?utf-8?B?SllKSDJSZ01OSzJiZHpaNXp3YzN5NzlaSXo2OXdwMEZvaElKcGg5cTJjcUNI?=
 =?utf-8?B?ME14MWFqZjN5emVHeW02VHdBYjMvNGdZQTlaRUlvU3JxMzlsbVBlNzFDc0VS?=
 =?utf-8?B?cUhzMDZrbkYwL2xLYUNuV2ZZVlpDSmVGL1h1R05tSGE4YkJGemR5NlptQUdQ?=
 =?utf-8?B?VVRoN3hWZEx3MUNPTnVZNnlkKzhEa3hTaWRMUVFKa2Z1VUNEcHVTZk5VczRS?=
 =?utf-8?B?RnhiaWZ6aXdDdUhKdzBGSkJYWVd4ZjBWSERNVUhYMklROWd3Qml2T09MS3Rj?=
 =?utf-8?B?aC91cEJmQTFHSUVSTVlDT3pXQUwrcElkZ001QlFWS2RZQXB2ZzM3N2RoNjZi?=
 =?utf-8?B?YkhkLzFEVWJDNjhTVjZuTC9ZaG5sWEhwenEva0xHdmpBMk9QYmRHY1JZRURR?=
 =?utf-8?B?aGNNOU1LOUNoUmsyM0d0M3J0TkdHZnVRRmxwb0JnZmhGcWwzeGR0dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057c4207-be0c-4d4f-7f21-08de540f7b44
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:24:20.4051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzzaRO4tipSKHHI9/ve82rXxlU7q7J9xOh8peUspLUw7iNzLuaLzGt2+9ESBv0dvem5ol7s+cYuSS09NsHXmfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7405

On Thu, Jan 15, 2026 at 09:00:07AM +0100, Jan Beulich wrote:
> On 14.01.2026 18:49, Roger Pau Monné wrote:
> > On Tue, Jan 06, 2026 at 02:58:11PM +0100, Jan Beulich wrote:
> >> A similar issue looks to exist in read_xen_timer() and its read_cycle()
> >> helper, if we're scheduled out (and beck in) between reading of the TSC
> >> and calculation of the delta (involving ->tsc_timestamp). Am I
> >> overlooking anything there?
> > 
> > If we are scheduled out in the middle, and the ->tsc_timestamp is
> > updated, ->version would also be bumped, and hence the loop will be
> > restarted.  I don't think there's an issue there.
> 
> Oh, indeed - I was too focused on the read_cycle() alone. That may go
> wrong, but as you say the result then simply won't be used.
> 
> >> stime2tsc() guards against negative deltas by using 0 instead; I'm not
> >> quite sure that's correct either.
> > 
> > Hm, we should likely do the same for stime2tsc() that you do for
> > get_s_time_fixed().  Given the current callers I think we might be
> > safe, but it's a risk.
> 
> Will do then.
> 
> >> amd_check_erratum_1474() (next to its call to tsc_ticks2ns()) has a
> >> comment towards the TSC being "sane", but is that correct? Due to
> >> TSC_ADJUST, rdtsc() may well return a huge value (and the TSC would then
> >> wrap through 0 at some point). Shouldn't we subtract boot_tsc_stamp before
> >> calling tsc_ticks2ns()?
> > 
> > amd_check_erratum_1474() runs after early_time_init(), which would
> > have cleared any TSC_ADJUST offset AFAICT.  There's a note in the
> > initcall to that regard:
> > 
> > /*
> >  * Must be executed after early_time_init() for tsc_ticks2ns() to have been
> >  * calibrated.  That prevents us doing the check in init_amd().
> >  */
> > presmp_initcall(amd_check_erratum_1474);
> 
> Hmm, I should have written "Due to e.g. TSC_ADJUST". Firmware may also
> have played other games with MSR_TSC.

For amd_check_erratum_1474() we don't want to subtract boot_tsc_stamp,
otherwise when kexec'ed we won't be accounting properly for the time
since host startup, as subtracting boot_tsc_stamp would remove any
time consumed by a previously run OS.

> >> A similar issue looks to exist in tsc_get_info(), again when rdtsc()
> >> possibly returns a huge value due to TSC_ADJUST. Once again I wonder
> >> whether we shouldn't subtract boot_tsc_stamp.
> > 
> > I would expect tsc_get_info() to also get called exclusively after
> > early_time_init()?
> 
> Same here then (obviously).

For tsc_get_info() I think you are worried that the TSC might
overflow, and hence the calculation in scale_delta() would then be
skewed.  We must have other instances of this pattern however, what
about get_s_time_fixed(), I think it would also be affected?

Or maybe I'm not understanding the concern.  Given the proposed
scale_delta() logic, it won't be possible to distinguish rdtsc
overflowing from a value in the past.

Thanks, Roger.

