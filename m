Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2DBC8A8DB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 16:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173024.1498122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOHCI-0001E4-BK; Wed, 26 Nov 2025 15:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173024.1498122; Wed, 26 Nov 2025 15:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOHCI-0001BZ-8E; Wed, 26 Nov 2025 15:12:46 +0000
Received: by outflank-mailman (input) for mailman id 1173024;
 Wed, 26 Nov 2025 15:12:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSqE=6C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOHCG-0001AF-2p
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 15:12:44 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a889e47-cada-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 16:12:42 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB5983.namprd03.prod.outlook.com (2603:10b6:5:38a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 15:12:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 15:12:39 +0000
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
X-Inumbo-ID: 5a889e47-cada-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGa1+ZEoXF+Mg7OpswRbrLHdwAYK0p/vwx3DbsPxYDWevi96oif/KTkdwLaslb1NAEpWbXxWxtjb5MxBbNtD8kW0drrDUWOtxCbJHCr1xNx3Nmqnhd9k1ZOcXTwuDB7Q/wNzTP9saLhFamXGlDgsvXG21b0N+1XWqDA+rRoSa8djLjPDHWBJoQvtb/G43+ts1LN4LDAOk+WPqKBkA2ZmNp8lmfa10f2aDNIFcCltqlvU75ZxnmTEwJRw9BsbzGSvd7HUNx9wmqIQLJ/2/aTU+CQxhmHj4V1M0KMYS/QXjO++3oOQFcZqbZAGAOcybWteF0npKc9OJOQgwwLjPRZp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6X+zrkOru28E9z6Djnzq4bZXKaUj/XCtqM/4pCzRJEI=;
 b=XLn0KdIEHj7XpqSo6sfOyGJe7cOXp8zUJE6TibpcfrQOMBoCWzJuVH9BuMMo2k3vcWEmmx9Tm+Z3QVSSOJhd2KDCZVYTbEbbcQUlJDdnyfKtx8VCn5+Psd3Y3FwZ3zjPix+4DQzo6TbygMaZzu5Mks0Xg1sbDvpUxHLmqHf7kkF4VzK5bzv4bZc4DcUy+xxyBM2ZleMT0LbzfPY3LrbL+t8b3EclHBL5EHm0ZwAg+1zsm0WWqMyelSHIIot8u1rDW/s4JDMk14Wti7u06lMrVmC5yzts+eaH1ioeZdb92phZH5+wI8xmMdeaJXwtQwbca+b2kY3S0tsAx6A/tEiJ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6X+zrkOru28E9z6Djnzq4bZXKaUj/XCtqM/4pCzRJEI=;
 b=sd7B+au8kFNBBraty5HYWyBfFgsigXx0RatFQP/Poye2YNWOT8xPc3PcN+7knzr4p/3ptkXglnY2Xv+VmdMnSGS+b8XOJ68pj+HCw7zMaB1Fcrw1j5nVunSwO3Ihy2LbZg35MgjEwgiToH2loT/W98go2ry3S+6is7f68wSpFBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fc9adc57-bb95-484a-9461-0751dc91cb1b@citrix.com>
Date: Wed, 26 Nov 2025 15:12:36 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/amd: Use setup_force_cpu_cap() for BTC_NO
To: Jan Beulich <jbeulich@suse.com>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-2-andrew.cooper3@citrix.com>
 <ab8dc060-7707-4ff3-a413-730555aefeee@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ab8dc060-7707-4ff3-a413-730555aefeee@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0467.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f75012-78bb-46ff-1f23-08de2cfe3d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVVMQmNqN0ZTYW5FamdMQnN4K2QwbEw2OHBBWUpHdUZpM1pMb3QrRHd2TVRH?=
 =?utf-8?B?MWwrS2FaUk1TelRmNlZnQXpRWHhWZnVoQzFiWW1XcVB1TnVtbGtzQmZDc0Nl?=
 =?utf-8?B?Zno5Umhnc0VlZjdQQkRlazlQZ1lMU3pnZGloUEsrVVNXdXJrblVVS3R6ZWh6?=
 =?utf-8?B?WGFWTGxDYWxHN0UrS2JkL3ZUVFl0dlQvODNOVVczUWxDS3d1Z0F0NkRXdlFz?=
 =?utf-8?B?Nk5Fck0rbHZEOEttWENyaTgwQUhxTDBaRkdkVU11S0h3ZVBNVWZabWlpTEpJ?=
 =?utf-8?B?ZXFRRnI1WCtobkw3Y1ZLNHlkcWlNY3gvbWxoMTZHWTdnVGU4VVM1bDkxQmo1?=
 =?utf-8?B?eEtrWlpVTVJYb0hFU1RybXpVUVFKeXY0WTd4MWJEZlZFbCtuNUU0aE40Z1ZO?=
 =?utf-8?B?R1VXT1BtVTQzNVh5amtzamxGNU5UcWlHVE9Od3ZueHRibUNLQ25hdVhKditk?=
 =?utf-8?B?MktIbHlGU3gyeUtnREdmR1paTjdVK1ZrMWhMZ2JYbVQ5WUZHMExIK0gwc2NV?=
 =?utf-8?B?UGZHNm9td09oOVdSMm1HVm5uNmVPOTVGeVlnNldvSENKRmJiSElDWGczeUts?=
 =?utf-8?B?UkM3UTFuVWZmZXFnRVRxWE9VeVMraW5oTlhYUmo4cGUyK04ydGxBRTVFcTFo?=
 =?utf-8?B?eTRDMDVhWC9yS3Z5eU9yVlFqcDlTbXk0elN1Tk9WSkg5d0JCSjZEUk1FcGxN?=
 =?utf-8?B?Z2xweUVvb2xaQSs5K3Z2UVA5d3loRWRFN1lMODA0S0NlblZicUYrY2g2d3pi?=
 =?utf-8?B?K05tdG1UYnFMdlRjemFtcnRvMWdjVnRNUHhIRXVYTVJHWEswdCtyOHpJVlNM?=
 =?utf-8?B?a3NsNVlvdDJVM1NCNExISGpSbUMvclBtVVdscG9EMVhNVjcyT28rTnRMQ0xx?=
 =?utf-8?B?cHpHVFdyc0h0Q1hmN3hCQUNxc0F3QjdNbXhHT3NvUklHcmNONm9POWZMUVRz?=
 =?utf-8?B?aGdZSThXcXAzaE5DVEVjQ3lUVXFTK3RYQnJ0WWJmMGl4WCtNd2lsTWJKeEdw?=
 =?utf-8?B?OUtCK1NpR2xTYVdFTWFMZTR0eUlsRjM4dTcyb1N4MndzYUlpelJocFJFdllk?=
 =?utf-8?B?UmJzSzZDTUlteHlkS3JPMEdBcTBReGIwNzl0Y09tN1BLZC9nblhEMk11Nmxu?=
 =?utf-8?B?WGFSUWZSWXpvMUNway9NUmgvWUgxSVlJWVdmUytHcDhaNEtLbW43TllsR05Y?=
 =?utf-8?B?b0ZTNE9VdDdtek9TRGJNcE9LaUFTWkhNdXFyd1plV0tTSmdUWjJ1R3RYcTRJ?=
 =?utf-8?B?a2NKcTdTZTVNS0FwWmhMc29FQzhXaFhwUnE3QTJzQWNhY2FxZVkzTTJ3RmhB?=
 =?utf-8?B?K0NQQ2QreEFndFhLU1IzaG9Ta2dlQ05DbEJXYUxIWVpkWGJjSGlzNFBvcTdl?=
 =?utf-8?B?bm9kN2JBRkR2eUljNXdPT2xTakVVS0lpYjdaUHJOQXZlbitOMEpKRmNzVlc4?=
 =?utf-8?B?M2JiSWYzaVNmU3Q1L1c3WldyeGNjM3NqSmVacE43YUxpR3lEem43VlZ4Nngv?=
 =?utf-8?B?eTdOMjVONzQxN0U2VEZDc2NPWjFHdlcyM1g0NHlQTHNERU55Wi9US2oveDJI?=
 =?utf-8?B?YzlnbGtHdXlqbThSRlZjNitLdGZXdkNnczJqbTNKS1VrVjA1UGpCcVNkT3VC?=
 =?utf-8?B?VHhvbTdTazZjYUxmRXU5V2dTMVFicHhmdEhtbGZ3SjB6M2g2b0hGanRocU5P?=
 =?utf-8?B?VEJmNGFmR1ZJZlJ4RzVFZHN5ZXBOSjJvQnpITjBsQjV2RUJmM3IyS3dvTnVC?=
 =?utf-8?B?Q2ZCbDlxcThOcm1tRndrSktleEwxRVR1UGh2QnprZ1lGY2FrRURwVmRZVWhq?=
 =?utf-8?B?SVpNbmFkUTVBUUMxcEhjR0kxUkprQ3BNZ3Z5bUU2ZWdPLzNBMlhYMjY2aVpS?=
 =?utf-8?B?akNUMGpER2JyV05NdGtjOGt3MHdrSXg3Q252M1RVV2xqVnViZVJwY2pKZmtB?=
 =?utf-8?Q?Bxy7klkDmHC95wSQWY+Pp7zm7irI+oMt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MndMMDNPZDVZRjBwOGkwUGJMVU11dlorMjFlVWZqeU55NDN2Q3poMGZmQUdW?=
 =?utf-8?B?cGtjMVVrcUNkcW5LS1pKa0xFdFVKK2xQdWpucHlqYitjVUpzRkxqRXF0NWhO?=
 =?utf-8?B?NzVSTXhWV2Y4RjN2Z29VN05GUE1yU3JZWGIrN1FwL2RGK2w4T1dEUG56OE1q?=
 =?utf-8?B?dWlsVloyUHBVM1NFQVpHcmtMeTNVRk9tcXg4ZEVQYWFvOTlpdEltZWdRdFBG?=
 =?utf-8?B?WVZOaVg3V1YyRDJKZmpOZWNVTHhyT0lLV25IRnNBVjlQVEFHY1c5UWhhV044?=
 =?utf-8?B?VHdKSVl2ZkNOdlZwUTFiQWErc0pNRXZ0SnVtNnpxRXh6VXlyeWFKVlE3MEJm?=
 =?utf-8?B?cTR3YzhidU5zNDQveWU3TFVIaE4xWVBMdUdmRW54MVVrUWVwNHcrcisvRXFr?=
 =?utf-8?B?SDdPUmxncWJDTktYUVh4SHllcXJzYVFBb0U2V0RISldKOGxJejdNTHE1Qk11?=
 =?utf-8?B?eEJadUNtWnNyUTNuY1UyOFJlSWZadnlJd2RJV2JIS1dPeHpUd21ReUtjVG81?=
 =?utf-8?B?dXBEdG5TbU5kRWd0UHd0ejcxU01pam9Jb1pxZDBlKy8xdFJhSTJOcnh1c1ZT?=
 =?utf-8?B?SmpibVdoTWhPR1MwdWpCcjI1YkxoREVwSmdtRWpLSEhDbDFJcWpMc21hNDJj?=
 =?utf-8?B?Tzk3bzJXbEo0aHM2SExBbkE1eE1neXl4by9BV0x1Mk1vMGRYQUg4clNxUk5o?=
 =?utf-8?B?U1RXUDFtRnVRZHQ2NGdGbFNuaUZza0kwNFo4dkR3UU9UZEJUNjRHMXFJRWky?=
 =?utf-8?B?b2VJemVHNmM5cUFzNmRKWDZicDlSSjlpRURscnlKQjlJQXplZi9MUHNPWDQv?=
 =?utf-8?B?SFAxS3lKSzhPVEQvQ2g4c1h0TGVTNWNlc1c0OHE5Unc2clRGMlZVbUgxZ1RR?=
 =?utf-8?B?KzZVY2NLUTQwdUlMUitmZmQ0ckdCOFRtdFY5MS9zaFEzNEdJQWZLNk8zY2Ft?=
 =?utf-8?B?TXJLNTJOOC9NbkQwRzV0dkRPT2NsdktPSXI0R0lwOGkzR1dEd1doZURwRDl0?=
 =?utf-8?B?YWltTWFvWFZQUVB6TVRKRUtoN1RXUW9RQjJJVkZFL0ZUS0RXV2xZQ0lPT2hz?=
 =?utf-8?B?blF0cGwxVDZCc3N1dzQyWUtLVks5bUMzQWlmNkZCcS9zSGJFUnZFeFpXUmha?=
 =?utf-8?B?Tlk3RlRDVDBVcExGRzNuejRNZVVvV29nRFBZMm03RnJBYXhtTFJUUVd4OEhZ?=
 =?utf-8?B?SVQrMXZ1SGVyRGl2dEt6dEc5Vkk3N0tvcldTbUZHYTZEVmNFTUlWYlppUHY0?=
 =?utf-8?B?ZTdLZWFocXRsOFdjZWUycUFyUE54UThwSlpxbEVMTS90TVdjaFhmTS9GcS9x?=
 =?utf-8?B?bmVRYnNrVEFWTmloZ1NFYmR4NTlPYXNjbGtEcmpxT2QxVG5yT0RDN2FKS3VV?=
 =?utf-8?B?MFBEWmFsYW1ZZG13ZEtuR3hlQWVoNzhKN0pXUEpyTFY2UUR6Lyt6alVycmJy?=
 =?utf-8?B?Wm9qd0R2WEIvb09pUklVTmtpQUtrVlBBLzJLM2RGdTFSdVhBM0c1bU4rNkZm?=
 =?utf-8?B?QjBpd3NaN2hILzM2TXVXUHBrK2Z3ckpHYldYQmRFNDlRVUE0aXlza2tqaVRZ?=
 =?utf-8?B?ZW1yQWdUTkJZY2ZVMnloWFh2clBiaFJrZUU4VE1UWlNqTWJYOVJxWHlwa0pW?=
 =?utf-8?B?cExPd2FsUlg2MnZLajIwMk9PMGE0d1BQV3Y4Yk96aUhQdG51TDlraSsvdTdL?=
 =?utf-8?B?aDFkeXNOUDRkcDhaNHBjSHFkaFhqREtuYVJrYVpqa0pPZHpHVkZ3TXRTSENr?=
 =?utf-8?B?Yk14MWJJN1NHWkc1MVdiUWZZWlJZMlRsVkVjSW1JKzA4cFYzYWZGUEI1OGpC?=
 =?utf-8?B?UHdWM2Q4aHptelBVZ3NaWkRRQkVYUCtTQmY3RUlQaWIwMzViZWFHRml4bGZD?=
 =?utf-8?B?VTRRamFScTRqTTVtcDQzRE1QZWFrQTNTYSt1RC9aU3pxMGhHamJLYlYvVGpK?=
 =?utf-8?B?RXNiZm9HUDRmWFVHSnFnbDAyWUZnQlBmQ1JzNHFNT004NUw1ZGVtWDhac1M0?=
 =?utf-8?B?eS9wVVA1MXZ5L2pZQ3pqRmpTUDJHcllKUStSeEpFc2tDWmFDS3hTMWE5NTdF?=
 =?utf-8?B?WGhqaFNRRy95QWJpTjYzRjU0NzNCbG55N2xNQkxOTXA5bFZyYkFIVVhBL1Ju?=
 =?utf-8?B?WjhVeE5lcGY2MlZrb1hnSlp3WGpwMURoS28vQTRJUEthelJjekV6THJPWHFB?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f75012-78bb-46ff-1f23-08de2cfe3d68
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 15:12:39.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2pc6q2FuWWkzI5gjAttfMzKfPMdHo1mbQcQUno3DJtyH1ruwNwfD/FaLYrEEo/tuVZr/+meiWAK0PHdYtspJWmoD06O4u9AXQBOoYrgYuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5983

On 26/11/2025 2:19 pm, Jan Beulich wrote:
> On 26.11.2025 14:22, Andrew Cooper wrote:
>> When re-scanning features,
> What exactly do you mean with this, outside of XenServer (i.e. upstream)? The
> only thing I can think of is recheck_cpu_features(), which calls identify_cpu()
> and hence init_amd(). Thus ...
>
>> forced caps are taken into account but unforced
>> such as this are not.  This causes BTC_NO to go missing, and for the system to
>> appear to have lost features.
> ... I don't really follow where features might be lost.

Well - it's a feature that we started upstreaming and I still hope to
finish in some copious free time.

Already upstream, we rescan the Raw CPU policy after microcode load. 
That has had fixes such as dis-engaging CPUID Masking/Overriding so the
Raw policy comes out accurate.

The next step (not upstream yet) is to regenerate the Host and Guest
policies.  I recently fixed a bug in XenServer's testing and noticed
that the underlying logic had bit-rotted quite a bit, hence this series.

The purpose is to be able to activate new features added by a late
microcode load, such as new speculative defences, or simply provide new
FOO_NO bits.

~Andrew

