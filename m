Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B644DBF5F25
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 13:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147016.1479338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBAAt-0006le-2p; Tue, 21 Oct 2025 11:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147016.1479338; Tue, 21 Oct 2025 11:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBAAt-0006jM-07; Tue, 21 Oct 2025 11:05:07 +0000
Received: by outflank-mailman (input) for mailman id 1147016;
 Tue, 21 Oct 2025 11:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TpUL=46=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vBAAr-0006jG-KD
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 11:05:05 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c43ef6e1-ae6d-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 13:04:51 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM7PR03MB6498.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 11:04:49 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 11:04:49 +0000
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
X-Inumbo-ID: c43ef6e1-ae6d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4wklHSnIQzIPaLCXQCxiG+h3RHRqxaEV41Y/HvUBPvv9PIhcFHwB2bOI/QnbYj9ns1TaNnf4/9a+IZ0HEUe9eAJKwETbFUkkFv8XwQIx9ZQ8lqitzLUWrntijJ9VUe0fzNnOKualj5RMCy4/tC5aaDpLpmsMB4N61tuPsMtpd0DQDi2Wrs2MrTnLcFQUZoLENXh6Q5+cMr78zLV0gvFYLzjj7qVSBsPJDZmpM5sewM44gr92WlVhjSKHsztmnC3HlRhWW+PTbukzcqgqVdU2hexOkmi4MI+bND6NTvT/Nvc7TyRxaoLCQMkczPu2RmAsOsKRhQ9f82XR2Wb3dayTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=di1JrnHa1J1gUIJrD2tLBxoKxPMKkUDFJNDjj5T7zFI=;
 b=BbgoXmQnywQ2krJ+UCpls90Az6qBiTaYbpFPLH0U2RRGWZnOCi22x4+Eubu3oyyjFDPQqgEY6YXQPah4nVNjuYPHKtbcnqsMuNcAkt2MhLjDxlHim2+NmtqZh8Jf7BBm1uAOzo/g3sUj3UszXMPB/f/ta4urtbNaftt+Onc9v+Dyh9M3nPRTJkSCzhGDjjOLbuxcEQljhkMXR/zF/m6ZS8peg1gMm+XRvl/x66RWZAE9Em6I+l3rvH/VNWVh5QEje8VvFO+KgqZHbbV+lVzGxVtwHJxn32ePuYqSuZGHDx6xmQOsRn+mZ6Lhqktl1S6keScavzCTiiU2231a9TcBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=di1JrnHa1J1gUIJrD2tLBxoKxPMKkUDFJNDjj5T7zFI=;
 b=jA5TOLJ4/TWbaEMb1Qo3yTU+VgwZdsE+CbDqH4fuVE8UnDVPH4mmnRIwxewOSyRs6N5m91pZX+08rpxxOWWmQQrbXipyaNAjrPUL1Mo5DI18vZ5jlI/rqXVh5eDsCTCreUVzVuIvV9MO4xlW5TAY/xggQKfCgtd5fX5/HUkSogkWXJO92pJRphtv343Ik9tklnAWUphm5u39w/52R0D2CPBA0Z+rF61jkYN/N5mNjtNhjlQCnexW1vEnQaXnoJM3Nhlgy6xEJS0Oofle/QqxBzlPY5c9eu1MsxJjAgGdzMJ6xOLxH7pBQ9ukou1esu5IGqEMVVhKXDTLiJZ4eX+K0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <3bd3034c-c2c0-428d-8fa1-14a219ba40c3@epam.com>
Date: Tue, 21 Oct 2025 14:04:47 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86: make Viridian support optional
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <aOzt8gfxkdQXZ6O1@Mac.lan> <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
 <aO5gdh6C_uQoFHPH@Mac.lan> <afe544d3-575c-44e8-9068-8c79f69d6175@epam.com>
 <aO9UgQ3J27hVgGIa@Mac.lan> <06d540f0-38e6-46fd-b94d-58ac2797657f@epam.com>
 <aPHyd8m57y_UkSl-@Mac.lan>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <aPHyd8m57y_UkSl-@Mac.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0446.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM7PR03MB6498:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f7848d5-9c02-4460-0d98-08de1091a703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXpvYzRac3RSakk0Y0JSZVlBYUp0Mk1hdmxDTVBwZk5xMlFOYWM1WjQ4VzRH?=
 =?utf-8?B?K09rOFI3MXc4cEdVNExpUllMR2hzM1pvd3hPUmNNWHdnL3JzVjYyRTNiZnM1?=
 =?utf-8?B?aW95QzhkTk01a0l5WUlrNUlQcUtuYW9IVDBmalZtc2E4dEZQMWNObFdzSEYy?=
 =?utf-8?B?Sk5WZEFkd3pPVkRVd1Z6RElOc0pBQTlKR2xLY25rTHM0K0pkTFl6L211U3dv?=
 =?utf-8?B?Z3hXUWhTSlRMbjQ0VExZY0xkZm1XR3o5WThiL1ExUU1uaHNLVDQ2VEtTS3hh?=
 =?utf-8?B?MDJYWE1zSEZpRzNoYk1GdjNJLytCQytRSVBqd1N2YWpJb0pnaGVQOFJmNDlm?=
 =?utf-8?B?ZWFwY3ViWTNmNEhIZnBuVFVYUUdWbkdDZjVrVUxlaEM4YU4xUXZTcHJteHhG?=
 =?utf-8?B?S0FHY1V1Z1JLN0FoSnd4Y0R5cUVBZXY4amNtNlp4aVdKZzhrZFpOa3ZQNDhj?=
 =?utf-8?B?anlHa0wyUXBkNjE4bWtIWTRnZFc2UkpSREpheVRiUVRITFBSUDVMMVYvZmEw?=
 =?utf-8?B?SGZmbC9aSk1VaWU4SklSODE1V2RpU1V2NmVuMkRvQVJ6M3A2TUkxcWpuczhP?=
 =?utf-8?B?U2N6QzBkMmV1N0RrdG9BTFlROVU3MkZJckNiZmFTelh1bkxzMmNPZy9oQ0tr?=
 =?utf-8?B?VTNWOTl5S1hjOXRTQXlvclBlZ2hkN3J5Wk1qYmtsQmF2SHFybUIrTVQweThk?=
 =?utf-8?B?YVZDR1Bnd1BDUXhNcFRwT2NHL1FIVk9lZ3loZlRPUkJkUjU3Y25nV2JBZTV6?=
 =?utf-8?B?SW10TGRrTVJFcWJCazBWbGdwN1Myc2Nrc0tMMW1IdXowUHdUcTNCYVBYd3Fr?=
 =?utf-8?B?VEpyRHhURkZicHpqdzNnZDdLYUxBOUp3azB0Z1ByL1hZZXFxcllWUExjY3FL?=
 =?utf-8?B?WTdMS0QxMHQvUzJCRHFGMk1Gck8zMTdZajJINEVycjdjcjNwNmVaRnBXOWU5?=
 =?utf-8?B?UVY4dnVYdnFYU0tSU2pNbTFDL0VUdXhHYStzQW5UUm94b3ZFTG5WWlorWTIz?=
 =?utf-8?B?Qkl0Y1ZYQnZpcjNTV1dYRlRjY0huL0N2OUJaRTBhVjRrL2FmWXdRTzV1YnMw?=
 =?utf-8?B?Q04zWHE2Y2NpcGRDUk94NWtHUEJGWnMzSUtLN2lBNHowR2lFcDJ5TVVSNTJ0?=
 =?utf-8?B?N0txQmhlVWZ1Yk1lS1pKWHhTWnlFNlpkZ2o1NEF4d3RERHppQWxZTCtIUzRX?=
 =?utf-8?B?UFRuQUdZak4yQnBLQUFSWGFId1F4MUwzZVFWMTJSdkpTR2JFS2FXV3ZVd1dt?=
 =?utf-8?B?NVlxbVY1TlF2d0UxZ0R0SncwMEZ4VmhQS0Z0dVJvMERzYytuMkExbk1ZVHk1?=
 =?utf-8?B?Zit6emRITUQ1eW1FbTlFd1pyUGNjZUoxWlZ0dFZnWHIvQzYzUzFlYWFEcFFQ?=
 =?utf-8?B?WVJWZjlDV0d5RG1yUU9uNGk3bTNkYVphdkk3czBnRWZWWnJTUHkvZEVGZUQz?=
 =?utf-8?B?SzNuZXhUdzFwekFkc3B5T296TUZNVWdvalo3RTNjY21xTURaQUpDSGJOWUhX?=
 =?utf-8?B?NnlEU1VjeU5hOThRWm1xR24zS3Y4SnQ0UHVPajRvTi8zTXFqaThocEx1M2lM?=
 =?utf-8?B?UlRCd2xxVzkyRXZ0V3h5MWRKQlNhMFJUbUwyVUZGS0x2amZoVXRlVnh6N2hn?=
 =?utf-8?B?S04raVJtZUVKTEVZVHFsWnFUSTlaQTlzL2FmL0dOLyszZlVoZ2MrbmJ0dlhR?=
 =?utf-8?B?RnM2emZDbk5lYUc1L2FCZTBvL2VJWGYvZmV3NGpEcDNlQThsaTIvSWw1WmZq?=
 =?utf-8?B?eURxSldKaEkxMVF4RjJPTnNOVFcwZ3NJNlJtbElwdXowL0d6eXRPMlhueUpK?=
 =?utf-8?B?QXVxMUwvQlRUa3N6T3F3Vnp6VlFTV21tYnVRTUYzc0ZuOXVVVi9OUXlzdyt5?=
 =?utf-8?B?U2JvUnN3QVhwUU92ZjlSaXJRNndMVmtlRTJjR004a2htUWpka1FWZWtMZEI2?=
 =?utf-8?B?S1NtM3pOam5xREpSQVpMMGtKVUtOeGF2YVY5czlOODk2M1M0dnRDSTVHYUVG?=
 =?utf-8?B?dVdiVUx1NG53PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGsvSmloZ0NMTWdpdVgrcEQvMWM5dThQOSsrQ3RET1ZqY2dnN3F3TjFUTmJ4?=
 =?utf-8?B?clkzZzNsMkhPVnBPVXRhTWk5NklZR25CYTFESGp3MCtISC9oQmQybTR2L0Uw?=
 =?utf-8?B?UHh6TVlOZXJRYjVvWmlTbTNEdXVEaVFlNlROdmJjT2gzMDZEb1A3NkVsTk9E?=
 =?utf-8?B?NDVtM29PNEFnKy9kaFcwWkQ5c1dFc21LcFZjemNBLzQ1bE5xdjJyb1ZaYXRW?=
 =?utf-8?B?c3I1VS9UbVNOYkFteUI4Q01kWkhzRi9XcXRPSXhLWmsvNHJmRHlrYXgyNmRW?=
 =?utf-8?B?Z2w0a3owTTJFRy80S2loVVlzOGJxQ2pJOVVqYnlLWXBOU3NkeTJpbG1yYjhw?=
 =?utf-8?B?TkxzZlljU2JlT0dDWEIvbnREM0syN0d1aHcwV3E5OXUyeHFHRlhEQnhrWlZZ?=
 =?utf-8?B?bDc2ditpUkNPMFpVa0pQS0RkVTY1RUdoTWN0UXhFdFFSRjFKTXdjVUhpR3ll?=
 =?utf-8?B?RmpRTVl0QlkvN3BPdEd2VUI1aU91cXJkWnlYS2FLZEJuOCtYMWFhSXcxcVp6?=
 =?utf-8?B?aFZacldGbGcrMTRlSlB2VnpUaWZtMXJLWnAyVGVpb2tlbG5HdlZMSi9ZYjVL?=
 =?utf-8?B?MTVYVHNRb1FhQ1NETndpY1FVWnFBRFIrbU44N21FK21MdUJadHNyWlRmdmtv?=
 =?utf-8?B?bSs1SGtlS0JtSnkwZWc0UzV0c2dHb2lrVURWcXB5NE82MzJsakMxWWNuV29U?=
 =?utf-8?B?Y1JWNlJjZ092emV2aC9NcHFlbkpTZlEwREVPUkVaWjNpdEY3dHpvUDREeERI?=
 =?utf-8?B?S3cyRVpxZjlYUEg2MEJQWGNGcHRzVTdMZjhycFcxYlZVZVE4amthMUhqNWlS?=
 =?utf-8?B?djBnNEs1dzBtZEVmbUxEb2Y5Y0cxMGhQY004Zk40cDFYeHZBMGp0Z1RDcG9x?=
 =?utf-8?B?UnZrRVpnWDd2enV6YmxtVTUvVEowQW8yQm5YQzZCZFZpU25qTUkybUs5TWZZ?=
 =?utf-8?B?NmM3bDRCSEpVYnp4elc1dUNCbG1rRi96Z244YXFwcVpJT2pqVzJUNUUwamNE?=
 =?utf-8?B?am4wTmV4U3BTVnV4dXZjbDR5ZWJSUTQxYjVrVS82RjJrcDYxcGFzZFVoTGpl?=
 =?utf-8?B?cUpoOEViRzZkYW5uSzhVVU5SSVhhYmJFTVRwVFk0bWVwSDRuUUx3Zkp6djl0?=
 =?utf-8?B?WkZTeENQaDEzZlJjUjB1dXJkMGVXUTBkbWJFN3ZUa0lJdDZBKytTSGZ5RE91?=
 =?utf-8?B?NXRCU2Z0SFU3QmwvdityV2N2d253UndlanZ3T3hKdzl1MkpQSGFPVVpGZ3hR?=
 =?utf-8?B?alVjbEJMbWtFOEdJaFpqV3FiOTVCbnE0Mm9STEMrN1c5SlZxRHloVTlCMFg3?=
 =?utf-8?B?dHRMMm0xdnJ5OWFlZW80VThnb2pWa05mYW8zZUZkQlZtZy9FMm8zS1orMHZw?=
 =?utf-8?B?U21ObTZlZW56S21wQ2ZGQ1hKam9xRC9LeUdjMVNyamoybkk2QlBYZ1dkcGIx?=
 =?utf-8?B?MCtud0dDV281SGQzc3RzZDdXUFJOYklwendDTWdLTFJSUFBQdnhGemUxOUJY?=
 =?utf-8?B?WmhQT0ZyeFM1RktwUFFmb2NzUUlqeVM0MW0zT2J0RGJ0OUlGVmdmclVhYmJ2?=
 =?utf-8?B?aFNJNmMwNC9UTnhFQ28wK014RE5LMlRaOUdlVTdvdEtsL251TUdYanJEZFFj?=
 =?utf-8?B?YUFpMnpjbmxBZ1RVMERjb0xvd0pWWGNtbW5BRHJmNDNjTXh0cDQ5R0JjRkd5?=
 =?utf-8?B?RVV0VWJ0dHMrZ3IwUEpjTFk3WEd1QVZDMFBWbG1TcmRrck9MUzZaVFVEcktM?=
 =?utf-8?B?eHdESWZlTU5OdzFCM3ZuNHFiTmtVU2J1UWQrZ0tIWCtVQkFHa3hscDdZZUQz?=
 =?utf-8?B?SGJ2eXMwMU1vNTZkVjE2VXhYekJWbjFqeVRoNjRKeUpvQVVnd1VERFpPb1JI?=
 =?utf-8?B?dlJoUXRNR1RBTnFGRENldGt0NHUwZE8wUFBreGYxd1FHeS9NajBkcFduU3g2?=
 =?utf-8?B?MUt3NVBwcTQvcktuU0dOdTZqbWMrZnl2bzQyQlNjVEpZL2RtL29qRW9mZjR5?=
 =?utf-8?B?MFUrUHREY0NOODBldHZnY1hsTEJuK1lpSDhFaHZjNmZJcXNkTVdicFFIZjFs?=
 =?utf-8?B?S2hmd291YVI4QzRiem96Yzd3eWtXZCtjdElMVTkrYktiVXlHeVJJLzVGMTN3?=
 =?utf-8?B?cEt4ZGNzaFhxdk01c09IZEYzQ0lPaEVuTlZ3eTdsZ1dUUlhKeUhjaG1CRS92?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7848d5-9c02-4460-0d98-08de1091a703
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 11:04:49.3677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /f//efMTrxsQe7vAFIx6BNMJ0+2iaAN4pct4BU/ACXryQ7zgW08FLY6YDwobOAhb1/kpvILpflUOv1VoM5G7Q9wwSKAHD5jDmMDfjIKO++E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6498



On 17.10.25 10:38, Roger Pau Monné wrote:
> On Fri, Oct 17, 2025 at 12:40:33AM +0300, Grygorii Strashko wrote:
>>
>>
>> On 15.10.25 11:00, Roger Pau Monné wrote:
>>> On Tue, Oct 14, 2025 at 06:48:23PM +0300, Grygorii Strashko wrote:
>>>>
>>>>
>>>> On 14.10.25 17:38, Roger Pau Monné wrote:
>>>>> On Tue, Oct 14, 2025 at 04:24:53PM +0300, Grygorii Strashko wrote:
>>>>>> On 13.10.25 15:17, Roger Pau Monné wrote:
>>>>>>> On Tue, Sep 30, 2025 at 12:52:16PM +0000, Grygorii Strashko wrote:
>>>>>>>> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>>>>>>> +
>>>>>>>> +	  If unsure, say Y.
>>>>>>>> +
>>>>>>>>      config MEM_PAGING
>>>>>>>>      	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
>>>>>>>>      	depends on VM_EVENT
>>>>>>>> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
>>>>>>>> index 6ec2c8f2db56..736eb3f966e9 100644
>>>>>>>> --- a/xen/arch/x86/hvm/Makefile
>>>>>>>> +++ b/xen/arch/x86/hvm/Makefile
>>>>>>>> @@ -1,6 +1,6 @@
>>>>>>>>      obj-$(CONFIG_AMD_SVM) += svm/
>>>>>>>>      obj-$(CONFIG_INTEL_VMX) += vmx/
>>>>>>>> -obj-y += viridian/
>>>>>>>> +obj-$(CONFIG_VIRIDIAN) += viridian/
>>>>>>>>      obj-y += asid.o
>>>>>>>>      obj-y += dm.o
>>>>>>>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>>>>>>>> index 23bd7f078a1d..95a80369b9b8 100644
>>>>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>>>>> @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
>>>>>>>>          if ( hvm_tsc_scaling_supported )
>>>>>>>>              d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>>>>>>>> -    rc = viridian_domain_init(d);
>>>>>>>> -    if ( rc )
>>>>>>>> -        goto fail2;
>>>>>>>> +    if ( is_viridian_domain(d) )
>>>>>>>> +    {
>>>>>>>> +        rc = viridian_domain_init(d);
>>>>>>>> +        if ( rc )
>>>>>>>> +            goto fail2;
>>>>>>>> +    }
>>>>>>>
>>>>>>> Are you sure this works as expected?
>>>>>>>
>>>>>>> The viridian_feature_mask() check is implemented using an HVM param,
>>>>>>> and hence can only be possibly set after the domain object is created.
>>>>>>> AFAICT is_viridian_domain(d) will unconditionally return false when
>>>>>>> called from domain_create() context, because the HVM params cannot
>>>>>>> possibly be set ahead of the domain being created.
>>>>>>
>>>>>> You are right. Thanks for the this catch.
>>>>>>
>>>>>> Taking above into account above, it seems Jan's proposal to convert below
>>>>>> viridian APIs into wrappers for VIRIDIAN=n case is right way to move forward:
>>>>>>
>>>>>> int viridian_vcpu_init(struct vcpu *v);
>>>>>> int viridian_domain_init(struct domain *d);
>>>>>> void viridian_vcpu_deinit(struct vcpu *v);
>>>>>> void viridian_domain_deinit(struct domain *d);
>>>>>>
>>>>>> Right?
>>>>>
>>>>> Possibly. If you don't want to introduce a XEN_DOMCTL_createdomain
>>>>> flag you need to exclusively use the Kconfig option to decide whether
>>>>> the Viridian related structs must be allocated.  IOW: you could also
>>>>> solve it by using IS_ENABLED(CONFIG_VIRIDIAN) instead of
>>>>> is_viridian_domain() for most of the calls here.
>>>>>
>>>>> The wrapper option might be better IMO, rather than adding
>>>>> IS_ENABLED(CONFIG_VIRIDIAN) around.
>>>>
>>>> I'll do wrappers - less if(s) in common HVM code.
>>>>
>>>>>
>>>>>> [1] https://patchwork.kernel.org/comment/26595213/
>>>>>>
>>>>>>>
>>>>>>> If you want to do anything like this you will possibly need to
>>>>>>> introduce a new flag to XEN_DOMCTL_createdomain to signal whether the
>>>>>>> domain has Viridian extensions are enabled or not, so that it's know
>>>>>>> in the context where domain_create() gets called.
>>>>>>
>>>>>> In my opinion, it might be good not to go so far within this submission.
>>>>>> - It's not intended  to change existing behavior of neither Xen nor toolstack
>>>>>>      for VIRIDIAN=y (default)
>>
>> [1]
>>
>>>>>> - just optout Viridian support when not needed.
>>>>>
>>>>> OK, that's fine.
>>>>>
>>>>> On further request though: if Viridian is build-time disabled in
>>>>> Kconfig, setting or fetching HVM_PARAM_VIRIDIAN should return -ENODEV
>>>>> or similar error.  I don't think this is done as part of this patch.
>>>
>>> Another bit I've noticed, you will need to adjust write_hvm_params()
>>> so it can tolerate xc_hvm_param_get() returning an error when
>>> HVM_PARAM_VIRIDIAN is not implemented by the hypervisor.
>>>
>>> Implementing the Viridian features using an HVM parameter was a bad
>>> approach probably.
>>
>> I've just realized how toolstack need to be modified and all consequences...
>> Have to try to push back a little bit:
>>
>> VIRIDIAN=n: Now HVM_PARAM_VIRIDIAN will be R/W with functionality NOP.
>>
>> I'd prefer avoid modifying toolstack if possible.
>>
>> How about sanitizing HVM_PARAM_VIRIDIAN to be RAZ/WI for VIRIDIAN=n?
> 
> I've been thinking more into it, and we must still allow writes/reads
> to it, otherwise migration would fail when restoring a stream that
> contains a Viridian record, even if Viridian is not enabled for the
> domain.  Right now the HVM param is unconditionally part of the
> migration stream, even when Viridian is not enabled.
> 
> I think Xen could return an error when VIRIDIAN = n and a non-zero
> value is passed to HVM_PARAM_VIRIDIAN?

Right...
> 
> That shouldn't require any changes to the toolstack, as when Viridian
> is not enabled the toolstack will just set HVM_PARAM_VIRIDIAN = 0.  It
> would however still fail if toolstack attempts HVM_PARAM_VIRIDIAN != 0
> and Viridian has been build time disabled.

I was thinking about the same, in general:
Get HVM_PARAM_VIRIDIAN (VIRIDIAN = n):
  - no fail, expected to return 0

    [toolstack] write_hvm_params()
     ...
     for ( i = 0; i < ARRAY_SIZE(params); i++ )
     {
         ...
         rc = xc_hvm_param_get(xch, ctx->domid, index, &value);
         if ( rc )
         {
             PERROR("Failed to get HVMPARAM at index %u", index);
             return rc;
         }

         if ( value != 0 )
         {
             entries[hdr.count].index = index;
             entries[hdr.count].value = value;
             hdr.count++;
	}

         [gs] will skip HVM_PARAM_VIRIDIAN entry as it's 0 for VIRIDIAN = n

Set HVM_PARAM_VIRIDIAN (VIRIDIAN = n):
  - fail if value != 0 with -ENODEV

    [toolstack]  hvm_set_viridian_features() will fail and reject domain if
    Viridian is configured for domain, but VIRIDIAN = n

    [toolstack] xg_sr_restore_x86_hvm.c : handle_hvm_params() will fail on attempt to load
    domain with Viridian enabled (value != 0) under Xen with VIRIDIAN = n.
    The value == 0 will pass

Will send new version.


-- 
Best regards,
-grygorii


