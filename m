Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B358BDA114
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 16:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142863.1476775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8gB0-00037k-8K; Tue, 14 Oct 2025 14:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142863.1476775; Tue, 14 Oct 2025 14:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8gB0-00035y-4W; Tue, 14 Oct 2025 14:38:58 +0000
Received: by outflank-mailman (input) for mailman id 1142863;
 Tue, 14 Oct 2025 14:38:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ME2R=4X=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v8gAy-00035q-Sa
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 14:38:57 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81a82e8f-a90b-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 16:38:54 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SA3PR03MB7418.namprd03.prod.outlook.com (2603:10b6:806:396::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 14:38:50 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 14:38:50 +0000
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
X-Inumbo-ID: 81a82e8f-a90b-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neRA9XpyApMYLn9gCoBRnLqrS+yliGNihznfBmYrEevF2ogWMSBBtYcSNtXsfjtkswnhTyJ6vJKGUCmkGtWK4pvDYKYiACdsUQ/+Rvn/IYmH+hitkwtaAZ2D8olO0cHCHN6r7ngN8JCwKXTayMQf6NSfKEe095PPp5/K1xHJ7voHUtOOOpU93pN1GJfxVd//iIQDVfpODhLoB+AXtchM/FJ8CEkDK6QBkBqZw3RvT/YAt/JLQhJtHWS0+bSBcZ4lJBTtMBgYRb7bNWEEoQHjG1vtXA+RYTaFHFlpxYmvdMPh/bPl47sejgoHS8j88F3p4R9SnUL2Wkjo8lV1pOMn+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swWCo/RIGwSFSNoPmIIHz/090AnswRvfsSs4t7bK/z4=;
 b=FzjJTf3vf+Z3NSfFzjDXhezi7SdlgoUiXWtQqBuFJ7bvULLriopukWWC3P8yDmXPGwqq+ncI/b4ziIgJqeYHxzp56wrizTY5mW0yedltH7L2/FEwobAkUAZXXv0b9WxLgqDMFpb/flW/j7tuVE+SQ7FQ4y2tYO4Vb3PIZSvlp53PUjpmqWJd3Mmz33R8MMTRb1npKHAAnq0MiS/zBmDnRMx+Vu72sqrhkD0vLvZpCHY3KTQnCQnW78bQp0jBTrlg/t8MtWnBJjv19DtLOSgRZyzfvWXVIhKhzJczNSG2qsBpT/QSkeFwxTgLN5uU/PiXCEW/d0/BPY8iPOXMI2JLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swWCo/RIGwSFSNoPmIIHz/090AnswRvfsSs4t7bK/z4=;
 b=vAT6PWH4xD77TuUCrl9WiVCvDXNeaGE4ij6iHjYhiw1s5hppw3o85k6wDmqxX1D9VAsUWAH0iW1ixP7EAkKC8jEvLAgSDi9tGzjCe+E4WYiqnRQy6KsV/HfBfQG0D80/dUXraPOI5tNv34dkwyOCjS3X8zj6IxuuH7GQlK0IWWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Oct 2025 16:38:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH v5] x86: make Viridian support optional
Message-ID: <aO5gdh6C_uQoFHPH@Mac.lan>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <aOzt8gfxkdQXZ6O1@Mac.lan>
 <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
X-ClientProxiedBy: BN9PR03CA0499.namprd03.prod.outlook.com
 (2603:10b6:408:130::24) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SA3PR03MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: f06a4a36-1220-4388-3808-08de0b2f63b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEUzbXZDYk02d09VcmlPTCtNWEk5VVA4c0NzZjV6dThJRkxsTER4S1lhL2dB?=
 =?utf-8?B?Tm41cWpDa0gwNHMyc3hZTS9VcWl6ZFlVT3VUYTFhUXZGZXhlNGRpMk1jeks1?=
 =?utf-8?B?RVhiUGJKQjZZU243dHNTZlRiSXowb0lNRjNtZTJjSzNtOC8ybHNUeXBPUlRL?=
 =?utf-8?B?WTQrUmQydVovdys5Qy9EUHJldWRSc3BzL1pKZFIyT002KzN1WW0zcmdvUW1V?=
 =?utf-8?B?ZXc2ZWpDUFpWY0pqRU1ZSlNJRXp0d0tmYVRVTklPbEFlYjlIaS9XY1ZmNXBT?=
 =?utf-8?B?c21HMVdqL0FhZ0xlNTFsSGt3VUhnM3hWRDhRN3hhcXdsY0JVRzBaKy90VTBy?=
 =?utf-8?B?VFpBTHRxcFc1UlBuWlJBMDZvUzZaZXo4WTZBYkNaRTRYYkNVaitZL0w4OFhi?=
 =?utf-8?B?Qm83YVBENnFNQzFudm5mRW81MC9iMUh1ZjhXUE5MNGRFbXdjeUZpQnljeVA5?=
 =?utf-8?B?K1hQUFhRNU9tNmFjZ0dTZUptTnFySnFVNm80UGNUaGlpczV0dDlSdlhrWjdD?=
 =?utf-8?B?VDh6SU9KVWhERTZqSS96Z2lUUEs1bCtoZm1naXBqaGhtRkdwU0xleCtya2tx?=
 =?utf-8?B?bm1kK0xOek50RGtrem8zRUhybnJTZURsRWhFSGxIV3IxUjl4RlVLVzMwV1E2?=
 =?utf-8?B?MjBJVWhLNWE4eFpqVHp3eVdhQXA5VzVqdFh5aVlrd0ZrdGdMVEIycjNNQ1ps?=
 =?utf-8?B?RGZsbnBaUUMzOFFzanlHTzBVRHJFNmJ4d1lrY1g1bFR3SCt2akNmeFRaaWhp?=
 =?utf-8?B?b2RXZGMxMUN4cmVjejFFZWpucmNjVEJnYk5HRWJTY2kwV3QxSlgrSWRBN21y?=
 =?utf-8?B?cE9PRGdIV3kvY0ludVYzbzU0ZDUyTnE2ZWJ3YXpZWXlrbXFnb2lxcVZmMFFi?=
 =?utf-8?B?VENBY1JkTjFKRFJmQ3pMcG40THB4ckM4WHlVY1BnalpMaVNRRmZKNFBIUGF3?=
 =?utf-8?B?STgxWGJ6RFlTS2FpVU5nVHRPUHBUQ0VrQlNFWlllUEdXc3A1M3loZjQ0SWRS?=
 =?utf-8?B?RnhPTHdvclluY0dhNDdTbytpUDhoRmtHMkZtMnphaHhLMDYyUlZwNmhuaXRj?=
 =?utf-8?B?Q3R2c1hPem9IbzZKQUpVZFV2eVRmUzllL3B6ei9GZGdTc0FDSldSYkMxUzBW?=
 =?utf-8?B?NzBLUCt5Y0tWWE1hd2F0OGZUTWlpTE5vZk02eXNPM21xOTd3VDRTM0hLL0lS?=
 =?utf-8?B?dUpoRGw2Mzg1a2t0eGEzZ0o4VUZtcFNKSHI5TktiVUpQUjdMV0E1N0hSNG52?=
 =?utf-8?B?QUpiZjgwUThtcVRDemgyWUdiL1QzUWhYQzU0VitHWGdCKzR6WjNTWmx0MHp5?=
 =?utf-8?B?bDV2YlRTcFlYUy9JMkoyb2NLMVVPUHRkK3dFbzRCWnpiMmFXNUo4V3NLcnRK?=
 =?utf-8?B?ZGxTaUJHNWM1bkx4TlpjcTZlcDY3REhTTnFYY2JtTEtoSXZJNXVWRFhwU2R3?=
 =?utf-8?B?cG0yNDJlN0dncm45MG1meUMzamVCUWNyZ3RGa1loZXFKVnVFOUlYTEErTU9I?=
 =?utf-8?B?ZTMrbHpsRUJxZjdrajljYkEvejhMQTFhZzNQZDk0WnQ1WFBrSFNWdlRGZXVr?=
 =?utf-8?B?bEdFejcvN0d4NUswaS9HbHA5c1pHNzRZUkt5M0ZXMisxdlh2clR2dVdNTFE5?=
 =?utf-8?B?Y1MwZUJ2Z3FvZG5jMFNpbWZFSkZzaDYzMkU0bDJvR2JBVHZRSk9LM3B5SFR0?=
 =?utf-8?B?RG14Nzc2SExwazlrT3ppaW8yTFVUK0g5L1hvYW96aUFWNnRqcWRoRWFzS1RQ?=
 =?utf-8?B?MTFOMHFpUUxEN1BxYWw0VDRnMVJGU0dLUWlOOWx1bDc3akVlS0NwVHQrL2tv?=
 =?utf-8?B?YURtUitKVGdNdjAxR0Z5ekZueEVua0Nhak5DM29ZSFlndjUxaFd3WnlQV3Bz?=
 =?utf-8?B?bkxRSXZYNHlRNGRQVlJUZ1B4UWczc3R3VDNRV0xkSmY3QXFDNk8rUVN2Ymly?=
 =?utf-8?Q?497Lf8SEU9h+ltpykR+inJfifF2gkDRZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OURyeUVMYzVCdUdLWGpLZUdBSTJwWkl6ZGV4SVA4empMeS9XSXVseXZKMldx?=
 =?utf-8?B?SkI0ckZxYmExdXJvam50TlV6VXJPTHIxNFg5blBjK3dEUytlSmt4dVA1elRk?=
 =?utf-8?B?MGh1Y1hGQVFFN3g1UEVLUldHRjREd2drdnNYb1V6cUZ6ZEFKYVdyR1RqaHpv?=
 =?utf-8?B?VU00SnJHWUYwbGYzNk5IUlJrU2xNbnljN0RiWDZHRWpKcnBGaFc5TFN4L0NP?=
 =?utf-8?B?RmV6SmRhQTJzam1jQU4rRy9jZUU5WXczNE1laUptQjc5MXJXcW0wUm96MDJw?=
 =?utf-8?B?dGlma2pnaSt2cVdWNmx0MUsyUVJ1bHZ2ZVpRL3o1T0QyKzZNYmhQL0V0a2Ra?=
 =?utf-8?B?czZJVEtobzV0SzZueDV4S1RFOUZwampPM0E2UE5aZFN5aG42Rzl0R3ZIWEpa?=
 =?utf-8?B?QUJZa0QvMWI5NGJTS0RDTitIMitRZnZHdHB0Mit6aUMwZm40eDJ1UWNrdkQw?=
 =?utf-8?B?b05BL2NiaHBFblVEc3YzVnZKaTNWT1hoaDJnZk10TkhhSDVTNTl6OXhrdzFX?=
 =?utf-8?B?MVRtaU5udzBYSklhZFFrcDJqd0RMcHhqS2RkRTlqQnVlS0VUb0R3TzZ5bldX?=
 =?utf-8?B?WHhzT3Y1VDViREVBNUJDUEVkMWltQlYybW01a2QzaTRXT3Q4UmVtejV5eURp?=
 =?utf-8?B?a0F5UStwMlBRT2t0VjdZR0NHdFlsT1FGR1VzcDRoNy95UzBvbVlqTG1xRjZh?=
 =?utf-8?B?WU1DVkVFR1N5STVHcG8wSGNXWHE5VkJBM2FlRnBQSHJYb205cU1ROG5xLy91?=
 =?utf-8?B?TUdsalNrd0w4YVNhVWhDcCt2WmlCYXY2SXRrL2loYzh5cXlaMjdmOWpNSVNn?=
 =?utf-8?B?SWhWNG92TXFTSlVKN2lpeHc0VXZjQzJxUlFrZE44aUhNcDNqZ0ZFZUxvOS9Z?=
 =?utf-8?B?RlZQQlNscE05R0VMR295WUZnM21IY0YvaVFoa21tQkdUT3FLT01sVEYvM0lN?=
 =?utf-8?B?V3ZWbHg3aDgxZDduKzBEU2t6OE4rTFRVZzlPVy9nTkN4bC85Sk50cXNmSDly?=
 =?utf-8?B?RVFWVlkxMEFJYVlrV3RFV2J2NnBJSW90eXpmTVFzemhpK21IRXJjTGVEeFM1?=
 =?utf-8?B?VWhqMEQxWVNuMnJhVlhOdmYwZDI4b0JhSEhDenBHK3BnRnJWVEpyZWl6blJj?=
 =?utf-8?B?TnVMSkJUWEU5YWlacFM2SmNBVE1oR1pXV285cFFpcTE5YkZMZUl1V2owbmtO?=
 =?utf-8?B?TVA4ay9FWGRKTXh5Um1lYTRHWEswUXZRa1ZtejYyNVJxWFZSTU9lSjR1aVRI?=
 =?utf-8?B?VkZTTHFSc1pjaisxNUpDcGRKc3hRY2VldDRpQ1ViOFJIS043MVZSemEvcFFC?=
 =?utf-8?B?RXN5bVZKdjFkNFcyUngySkV1SzQwT0FTZU83Wmg1Zk96eTJrT3djaGkzTFFV?=
 =?utf-8?B?N2JpOWNQaFRkVUhINDVReUxtanNMeWNHTkNPLzk4ai9vVG1OV1VDelRUYklq?=
 =?utf-8?B?c2hPYkhWbnM0RExxeDZYSVpCTC82THRMMjlGajZHQjJ3RVdOM2tQczQwSTVl?=
 =?utf-8?B?ZGtqN0JJTG0wampOZlB0MVhBdUR0Uzlaa2x2NzUyNnZua2VDL1BveTBEM0Ex?=
 =?utf-8?B?ZTU2aFJjY3l1enhlRXd1OWhKYi9hc1B3YnB2OXFtLytHL0E0SWE3Q3I2R3BZ?=
 =?utf-8?B?NlNEK1V2L3gxZWYrdFRpdVV0c09ibmdOekp4NVBRUTdtWUxPeDJqUThMSjhW?=
 =?utf-8?B?eGlFSmNSSzI4cjRJVGJ6UU8yWXFVcTZGZUk4QUZGbTBLdkxsL1FmRGhaVXBP?=
 =?utf-8?B?ZndXM0dHS2hMd01LeFhOY3pNS1hScEtOczJaTXM1S29VZ0RXVjFZK3Y4Wmky?=
 =?utf-8?B?ZVVkamlxdG1haDJ1UGRuZ3EveDJrTmlwcEJCMkwzSlpvYWVIaklmN05pS0pF?=
 =?utf-8?B?M09SNFpPYVpkNkVocThuRjRiN0dkQ1NxUFRiYVNBUW5oZEZzMUlUUENJUGRT?=
 =?utf-8?B?bTRJYTlwNlRia1c1NXc4bWpTNm42N05JQklXbmVXek1VNnZ6aWIrYTloMlpU?=
 =?utf-8?B?NE5EbHd4MXozREhaM014V29oVnIzc29mcktpQkJ4cUNSS2pxVXJZdXRmK1dU?=
 =?utf-8?B?bFJSM2ZOZVd4OHNmZ0JpOHpUM1VjTFNXYmZVTnhINXdVNm14QVE1Vk5uZnZh?=
 =?utf-8?Q?3X3/63+f8Z+OCXtaZPbRxHOOo?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06a4a36-1220-4388-3808-08de0b2f63b5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:38:50.1570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEN9Zp3kVjHjFuSKu8J/LNTpTXGxD+AXZK5w0qmPP8IvWf6N6eVzANMoPsfrSiHnJraEALnPBP7Xk1aq8EUW9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7418

On Tue, Oct 14, 2025 at 04:24:53PM +0300, Grygorii Strashko wrote:
> On 13.10.25 15:17, Roger Pau Monné wrote:
> > On Tue, Sep 30, 2025 at 12:52:16PM +0000, Grygorii Strashko wrote:
> > > From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> > > +
> > > +	  If unsure, say Y.
> > > +
> > >   config MEM_PAGING
> > >   	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
> > >   	depends on VM_EVENT
> > > diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> > > index 6ec2c8f2db56..736eb3f966e9 100644
> > > --- a/xen/arch/x86/hvm/Makefile
> > > +++ b/xen/arch/x86/hvm/Makefile
> > > @@ -1,6 +1,6 @@
> > >   obj-$(CONFIG_AMD_SVM) += svm/
> > >   obj-$(CONFIG_INTEL_VMX) += vmx/
> > > -obj-y += viridian/
> > > +obj-$(CONFIG_VIRIDIAN) += viridian/
> > >   obj-y += asid.o
> > >   obj-y += dm.o
> > > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > > index 23bd7f078a1d..95a80369b9b8 100644
> > > --- a/xen/arch/x86/hvm/hvm.c
> > > +++ b/xen/arch/x86/hvm/hvm.c
> > > @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
> > >       if ( hvm_tsc_scaling_supported )
> > >           d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
> > > -    rc = viridian_domain_init(d);
> > > -    if ( rc )
> > > -        goto fail2;
> > > +    if ( is_viridian_domain(d) )
> > > +    {
> > > +        rc = viridian_domain_init(d);
> > > +        if ( rc )
> > > +            goto fail2;
> > > +    }
> > 
> > Are you sure this works as expected?
> > 
> > The viridian_feature_mask() check is implemented using an HVM param,
> > and hence can only be possibly set after the domain object is created.
> > AFAICT is_viridian_domain(d) will unconditionally return false when
> > called from domain_create() context, because the HVM params cannot
> > possibly be set ahead of the domain being created.
> 
> You are right. Thanks for the this catch.
> 
> Taking above into account above, it seems Jan's proposal to convert below
> viridian APIs into wrappers for VIRIDIAN=n case is right way to move forward:
> 
> int viridian_vcpu_init(struct vcpu *v);
> int viridian_domain_init(struct domain *d);
> void viridian_vcpu_deinit(struct vcpu *v);
> void viridian_domain_deinit(struct domain *d);
> 
> Right?

Possibly. If you don't want to introduce a XEN_DOMCTL_createdomain
flag you need to exclusively use the Kconfig option to decide whether
the Viridian related structs must be allocated.  IOW: you could also
solve it by using IS_ENABLED(CONFIG_VIRIDIAN) instead of
is_viridian_domain() for most of the calls here.

The wrapper option might be better IMO, rather than adding
IS_ENABLED(CONFIG_VIRIDIAN) around.

> [1] https://patchwork.kernel.org/comment/26595213/
> 
> > 
> > If you want to do anything like this you will possibly need to
> > introduce a new flag to XEN_DOMCTL_createdomain to signal whether the
> > domain has Viridian extensions are enabled or not, so that it's know
> > in the context where domain_create() gets called.
> 
> In my opinion, it might be good not to go so far within this submission.
> - It's not intended  to change existing behavior of neither Xen nor toolstack
>   for VIRIDIAN=y (default)
> - just optout Viridian support when not needed.

OK, that's fine.

On further request though: if Viridian is build-time disabled in
Kconfig, setting or fetching HVM_PARAM_VIRIDIAN should return -ENODEV
or similar error.  I don't think this is done as part of this patch.

> > 
> > Given that HyperV is available on arm64 also it should be a global
> > flag, as opposed to a per-arch one in xen_arch_domainconfig IMO.
> > >       rc = alternative_call(hvm_funcs.domain_initialise, d);
> > >       if ( rc != 0 )
> > > @@ -739,7 +742,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
> > >       if ( hvm_funcs.nhvm_domain_relinquish_resources )
> > >           alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
> > > -    viridian_domain_deinit(d);
> > > +    if ( is_viridian_domain(d) )
> > > +        viridian_domain_deinit(d);
> > >       ioreq_server_destroy_all(d);
> > > @@ -1643,9 +1647,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
> > >            && (rc = nestedhvm_vcpu_initialise(v)) < 0 ) /* teardown: nestedhvm_vcpu_destroy */
> > >           goto fail5;
> > > -    rc = viridian_vcpu_init(v);
> > > -    if ( rc )
> > > -        goto fail6;
> > > +    if ( is_viridian_domain(d) )
> > > +    {
> > > +        rc = viridian_vcpu_init(v);
> > > +        if ( rc )
> > > +            goto fail6;
> > > +    }
> > >       rc = ioreq_server_add_vcpu_all(d, v);
> > >       if ( rc != 0 )
> > > @@ -1675,13 +1682,15 @@ int hvm_vcpu_initialise(struct vcpu *v)
> > >    fail2:
> > >       hvm_vcpu_cacheattr_destroy(v);
> > >    fail1:
> > > -    viridian_vcpu_deinit(v);
> > > +    if ( is_viridian_domain(d) )
> > > +        viridian_vcpu_deinit(v);
> > >       return rc;
> > >   }
> > >   void hvm_vcpu_destroy(struct vcpu *v)
> > >   {
> > > -    viridian_vcpu_deinit(v);
> > > +    if ( is_viridian_domain(v->domain) )
> > > +        viridian_vcpu_deinit(v);
> > >       ioreq_server_remove_vcpu_all(v->domain, v);
> > > diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> > > index c0be24bd2210..1212cc418728 100644
> > > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > > @@ -1116,14 +1116,14 @@ static int cf_check viridian_save_domain_ctxt(
> > >   {
> > >       const struct domain *d = v->domain;
> > >       const struct viridian_domain *vd = d->arch.hvm.viridian;
> > > -    struct hvm_viridian_domain_context ctxt = {
> > > -        .hypercall_gpa = vd->hypercall_gpa.raw,
> > > -        .guest_os_id = vd->guest_os_id.raw,
> > > -    };
> > > +    struct hvm_viridian_domain_context ctxt = {};
> > >       if ( !is_viridian_domain(d) )
> > >           return 0;
> > > +    ctxt.hypercall_gpa = vd->hypercall_gpa.raw;
> > > +    ctxt.guest_os_id = vd->guest_os_id.raw,
> > > +
> > >       viridian_time_save_domain_ctxt(d, &ctxt);
> > >       viridian_synic_save_domain_ctxt(d, &ctxt);
> > > @@ -1136,6 +1136,9 @@ static int cf_check viridian_load_domain_ctxt(
> > >       struct viridian_domain *vd = d->arch.hvm.viridian;
> > >       struct hvm_viridian_domain_context ctxt;
> > > +    if ( !is_viridian_domain(d) )
> > > +        return -EILSEQ;
> > > +
> > >       if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) != 0 )
> > >           return -EINVAL;
> > > @@ -1172,6 +1175,9 @@ static int cf_check viridian_load_vcpu_ctxt(
> > >       struct vcpu *v;
> > >       struct hvm_viridian_vcpu_context ctxt;
> > > +    if ( !is_viridian_domain(d) )
> > > +        return -EILSEQ;
> > 
> > Nit: we usually use EILSEQ for unreachable conditions, but here it's a
> > toolstack controlled input.  Maybe we could instead use ENODEV here?
> > 
> > As it's not really an illegal restore stream, but the selected guest
> > configuration doesn't match what's then loaded.
> 
> I'm a "working bee" here and can change it once again her to -ENODEV here.
> But It will be really cool if it will be agreed on Maintainers level somehow.
> 
> EILSEQ was used as per [2]

Didn't know it was explicitly requested, then leave it like that and
ignore this comment.

Thanks, Roger.

