Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD4B2C716
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 16:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086662.1444858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoNOV-0008GY-4Z; Tue, 19 Aug 2025 14:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086662.1444858; Tue, 19 Aug 2025 14:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoNOU-0008DU-W7; Tue, 19 Aug 2025 14:32:58 +0000
Received: by outflank-mailman (input) for mailman id 1086662;
 Tue, 19 Aug 2025 14:32:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1y2Z=27=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uoNOT-0008DO-8M
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 14:32:57 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 655eb5cd-7d09-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 16:32:56 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB9366.eurprd03.prod.outlook.com (2603:10a6:20b:57e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 14:32:53 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 14:32:53 +0000
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
X-Inumbo-ID: 655eb5cd-7d09-11f0-a32a-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwutyx1d5zZVTBqaJvyOSpAmjS6J88EP48XNSy/uQ0BB+cF4u9EXkRaBjl5POJ67Em9QpE8nsxRiYeYLpvHrPcQekeYPIDj8rDOHQ4InELmxn9TzOymJyWJDuzpAIXolTgYprpCGeROagylV/8Gh/LeSKLAKLa5wju8Lgh+NYoJlyIBUydwi/oMQDMPBcxdszWV1uD7lkglsA4LBu8ESZPRElbfHqXGtTxXA6DIgjCFcyvosVt9xlvy6n4BVfd3lPfyNXDWQeEteRk1fGzMBaSKTKf19P09T6P1kZIYupzmSAPNQTMk8wiGCXv5krB7aupCFxQ0WjOuhRO1xAW0OYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9valugcgQlnsK2Qp7SaIZUvpnlYPMRUBOINW/eHfTk=;
 b=dwyDdPqe6owQhasrFH3/1FyJx3j+x2C9ywh8+aZEbzKvZEda+yMomsblESu8JyGEmbrLcSvvOLfxvARqhvsMfPMyEII9LwBzwruo87/eE+3+NqPfbM1A8I7g4rtMNi+YXpRFngxMNqeUABot5TrS/VAbYKpaKVG1gOKtknoclbnAe4BsBTg9sOisqvAZqrpM8RKs7foz0ndBcnbphVJI/WIhVr65Rmr+03/J4k9WC2wmTzq+HqCO/u50gWVDrW/uixCD5RuYMqp59tYmQnNAZQdtjJN/jPM9z7dA1dqlzg5+jPp/g5d44SoDtu8u26X6DGE5bbP5MW6Kn62lrsfMcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9valugcgQlnsK2Qp7SaIZUvpnlYPMRUBOINW/eHfTk=;
 b=JKZbkTiUCF8Q+GKBPMhhaDmb8WnoKRfCio2Wi4sKqyMH7VkWGMKxgm64wwbELT14p1LVQRE2R9pQHGslUF82qIMZLHQYR6p/W09Io9iXjRffDRWgzI67x0S02CHO7u6021bxcfDqkhMev75mBAy1nkMCp5Fu2+S6YIBJXm1dWuFhsAuH8VN85bn+tKXSU+BoSgaPxUC0mbcNSFLCL4zMarNKmMTdHAgs/cIR0uM9HwJfZnlSQq37cUGZAsn2In+J26iuEHS0Gess2OyCVCCV2w7E0fU5DnlBKwAk7ygDgT93NdUJxOGCqs/2bH2uDNoo++kl5s8zRuU6gtPa6gfcsw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add deviation for PrintErrMesg() function
Thread-Topic: [PATCH] misra: add deviation for PrintErrMesg() function
Thread-Index: AQHcEQr89D/JS5GCrUaBbORYWk1wAbRp920AgAASxgA=
Date: Tue, 19 Aug 2025 14:32:52 +0000
Message-ID: <7bd11401-bd8d-417b-90d5-e52a501211ed@epam.com>
References:
 <5944d87aae330246b7dab6eebd04d5d71a7d7e8f.1755608417.git.dmytro_prokopchuk1@epam.com>
 <37c61f78-b723-4611-b9d5-f915f72f36e8@suse.com>
In-Reply-To: <37c61f78-b723-4611-b9d5-f915f72f36e8@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB9366:EE_
x-ms-office365-filtering-correlation-id: 07152927-c342-4288-0bf5-08dddf2d47ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bU1tQjRzNk9BcXhyWkJZYTN2KzhNTzhFbnFIUklrNE95RTQ4Z21KWHI0WmNI?=
 =?utf-8?B?NDVxODk3Z0w0ZjNsSEFIMVo1bGdOVFpWa0MvZW43eDVHRkFoOGh3VFR0RW9T?=
 =?utf-8?B?SjlCb3pZazBxMzVZalpyWXkyM2lyMElEN0xrNjM3Q3ZOMExUaEs0djZiUUpK?=
 =?utf-8?B?K2NaaERucTZ6ZzBUMXVCYjFiaTdyUGFNZzF4QWYzUjNIclNPQU9uWEJiaC95?=
 =?utf-8?B?blZZMUZoWFh4TXpMdURhTUo1T0JGNWVud2xkNGlKdnZyS1VtY2E0ekNXR1Vs?=
 =?utf-8?B?UWN2UFdCZ2FJUC9aeG1Qbko2bTkzMGtaaER0akI3dStNMzFmY0t4ZlVzYUMy?=
 =?utf-8?B?QnBIQjBnZHZsVFRyZExsY0dBMWp4UzNkY1hiWmRzaGVzR3Z5M0d1cng1Ymhq?=
 =?utf-8?B?WmY1c0JiNG9Mck5vdUMwNlpSM005VHgwVndLbW1lN21qaFRCUEd6M2tDdGRy?=
 =?utf-8?B?YVlsandzOWtHOS9jSW0ybjFSdXdBYXlRa1Uxc1pXaWc4bzNwNGVTZktSSExE?=
 =?utf-8?B?YTdUM0ZQMGluS3JqVnRsN1ZnT0syYUJFenhDZVJtMFYxZ1BZTnc4KzhjZ2pT?=
 =?utf-8?B?TGlGc2E2NzJkNWJKWHdQVnM3a2VaUVhOaVF3anNCNW1YVm9ER2N4aFR0bVg3?=
 =?utf-8?B?ME9sNGJuZEdNZVF6VlVuVHVvMXdMdHA0V1FRUFpqKzFVVXBGUGJUY0dZbEla?=
 =?utf-8?B?UW9oaUpPYUdVbnNRNlpFcGFBSXFHWlNjYkltd2dENjlkSExrd1p5VW5SSURk?=
 =?utf-8?B?aWdzVWhxWngyQnhZQ2xITUFCTGdTcGdDQzdPSWFXdXV6dlIrWjQrZ25zVFNU?=
 =?utf-8?B?elNQK3NVKzRzMTVaYzYrSXpmSnJxTXdkaTI3ZzBrNjFrM3VyME5nUUtiemxi?=
 =?utf-8?B?N1dleStFelI4SVp2QzEyalZzdjRJK1NvY25NdnUvOEJpandaSXRXeStpTVla?=
 =?utf-8?B?QjFrS0dhQkx3Sjdvd0EzVlpXeXZ5QVl6dXRmVmhVWTZHN0ttNng2V3NZWGpa?=
 =?utf-8?B?V1JaT1JpOXBnVEZvMWI1VmNmZUZEVUxxcmdibVJXeHNyLzJKbjk1VXY5N1Z0?=
 =?utf-8?B?SkdNeEtaaU1EMm8zbTJqZ2E3bUF1VzJlVFM1T0sydVBCcG03WWRIVkxZQUpv?=
 =?utf-8?B?SFZyTEQ5djNQRTVzZDUwLzRlSG5OVm4weVhDOExxUFp2ZlBkNHY2UmU3c3Uz?=
 =?utf-8?B?UFJ2Y1F2Nm16MFlZQWJiZUZKVDA3RmV4czc5emVGcS9ia0xTSS9VNk4zWEMw?=
 =?utf-8?B?UldRd3dYVmdXMmZ5OHZZRVdTOVFVam9DL2lEaVBjQlhmb0ZVSkxldDFlb2x0?=
 =?utf-8?B?RHZaY00yY3dDSzhPVHYwaTdoUzdvVS96WTd1VlJKcExsMm5BK3BNKzd5QTgw?=
 =?utf-8?B?YnpFZGYxTFdwSXlVd0VINFV6ZHpUcFZZMWxNdjNuMk52UkxmenhjcHZncU5F?=
 =?utf-8?B?WDc2WWpmaTd4cVdhTkRXYUgweDVzb1NtY0hEcHFNSGVzSWN4Sk5aS2dLTU9I?=
 =?utf-8?B?WkJBekZId3JQSTRjSnVTUXAwcExxT3FDdzVPTVo5bHRJWG43MEhvQUR1L1BC?=
 =?utf-8?B?WFJ3dFJicTl4ZTIzSTNxa1ZGVjA4YWdoWExKUmhlZTFaMkJuaGJYNlBBNzJE?=
 =?utf-8?B?ZndxalI0Q2ZieVFwNk9WQXBmRWtnKzFYV3NYRnR1d0Z4emJISEVwTTZxVlFq?=
 =?utf-8?B?RUxDbFhpYXZZUURwNlJlMUlHbGdqQmRBazJEYmYvMUg1Q0d0SVIvcTMyZFV4?=
 =?utf-8?B?KzJqZldkT3RsYlZIMEt5VlNXcnBiTXFabU1abnh1WDl4ajlJT29qaXNzMlIr?=
 =?utf-8?B?bjJkbmppSnJmNFlZamhUVWpPbXZzUGVaK25Yb3F1eDc5c01qeHE2Slhyd2R5?=
 =?utf-8?B?VVhJOFZ2SExORUNGMlhpQUFhZEpUbTVNTUd2T2tPVmowaHEwZ0hXUlNSckM0?=
 =?utf-8?B?eTJUVStEVmNWKzdZbnhNenN2V1RLWXIxazJRaE5kVE1Lek1iKzNpWHpHT002?=
 =?utf-8?B?WE54NlZLeDVnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zi9lTTN3MU5ES3psaUdPUnFYa2FOZlM1Q3JLNWVpQXZSRThIM2FXZFlnWTNx?=
 =?utf-8?B?MGQ1VExXTk9KbmxEWlhWS1c2QVhIWGFVUmg2SW9HNUxtQ0xJVTFkak56aUVk?=
 =?utf-8?B?MmdWa0p2RFJiQzNrMEFvMTNNSEJOd0ZhbFlEYWZINEFUanVlY0M3SU9HKzlp?=
 =?utf-8?B?WmdZRENjNDNkOXdnNUZVSVdUMUdhUS83N1BqV2FURVowUE5ESnNRWnRlL3FH?=
 =?utf-8?B?NzA2YWcwd0p1cUh5UnUwMzkwM3FEc3hXNnorOE1tYXdFZC9OSWtXS0xvaEQ4?=
 =?utf-8?B?dWpCQ1dFU3JOV1B1eG9BRDdJZHRKam1UWkFweUNIWE01TDQxcHZzQVBrZmhh?=
 =?utf-8?B?ZjNZaWJUeUpUKzRMMG1NYVJQU1U1ZzRGNnZ5RWxtS1ZRU1kxN01SN05jN0xV?=
 =?utf-8?B?QUJiUWVTS3I0R0NnRERpZ2pVZ2tvZndFcHZzY0lwb0hXRm0yWFFTRUlWOFhE?=
 =?utf-8?B?SUsraVpsYkFuUk90WFUzQ0wrR1ZUbDJtd01OZi84UG4vckFVWjdJZWt2Qmta?=
 =?utf-8?B?eTlmdlVyc3RzazNvQnJqb0lEV2o0MjlRZFYzelpuVVVCNjhNUTZ4ZllBM1Qz?=
 =?utf-8?B?amI3SDZqQTN4QitWRFJWTS9rM1JZWnpPK1o5ZldzWG9tTGtycm5qaFd0UWxu?=
 =?utf-8?B?Y3plYXBCRmhaRGNibWZ0RWRtbHpjL2dsQVZzaFhKWlVDRHM1UU9xTXJXdzNK?=
 =?utf-8?B?Y2ZwSlhwQXFERUx2aWI1WnhhM0hzaVFBdHRWM0h6Z3JaZVgrRnA3eFBnZGpV?=
 =?utf-8?B?bktBMVBmTUVmak9mTG1KTHJxck9CQ09PY1lFQUVhTFo2YW9xZU5oOVQxKzRF?=
 =?utf-8?B?c0V6eW5WT0pCSC96bTFKemhERmhHNjAvWDV6TXVsa1VvVGp6MDFVNHF3TTVk?=
 =?utf-8?B?eVZuMXJGdjlydmZjSnlKUyswbjdaWXJCRVZvRGE2alVHYnArZ0hKQVZkSjM1?=
 =?utf-8?B?UEFCTGYyWmltVmsxcE5hUjhlcEdyNUJsS3hnS0RnMi9JMWFVelZ6TWNlU0dl?=
 =?utf-8?B?M01HcHNMei8rcnJPVlZOUUR3L2xCeTBxalZYNVJ5cjdPYWpQUmNXYkZMN3JG?=
 =?utf-8?B?NE5tb0diZGdsNWxza2RtNklvcU9KQ01wN0hVR24zRUNxcXlqZGY4ZWVoRFhz?=
 =?utf-8?B?c3VWSVZaTDFOLzdWRHFIVFlvb1lxRnQwWDBjYm1xb2JNWEFFY1JOYjJHMU94?=
 =?utf-8?B?Q0tIcGYyWU00K2VMWXZwQVcrdGRxRU5HTHZIYkVxZHZhbHRadHRteXpXckJt?=
 =?utf-8?B?czFzb2xXNFZmMTNvNWJkem5sWWExMnlJcHcxT292Tk14L3YzdlBqUFVsaXhR?=
 =?utf-8?B?Y21mUlNuQ2VUWSt4Q2oydXhXS3YxeTRoMTcvN0o2N1ZGdm1xSXBTU0t4OFJn?=
 =?utf-8?B?MGgxM1FlVjJKcjV6R1VzYWVqd3EreEoveWlqaW15TUFCMkVJdmxPTXRDR0l4?=
 =?utf-8?B?dzVyTk0vTWg3VWx3cjJ0SS9aWWdwVUhBd2luSU9qcGdlSURQKzltTzVmUnhq?=
 =?utf-8?B?R0R1WkY5QjdHem1HWGdYMVhielRoc25ZcHI2WlNtNHFKQlBOOG1SMFBNOE9l?=
 =?utf-8?B?WkhyeUdiK2RMbVBnemVCdmc5YVZTMGNXVGo4RFNvQXpaZG52VldYY202ZlBP?=
 =?utf-8?B?aSswQVBpLzJ2MFFSc1VxbjI1ZTN2aUlkbTZmU2tYS1NXY3RUdGxSS0RXckpa?=
 =?utf-8?B?dUYzSzNpWm1DdVpPZE1rRldRYmN2K1FQRndralVtcGd0b0hFK01KUlIrcTE0?=
 =?utf-8?B?MTRRa2hMMFlXbkFiaU9WWWM1UHJJQUJqU2lycGw1UWdLSTJtWnhmNFVBTzY3?=
 =?utf-8?B?VjB3b1RMV2xSQ3g0YldVK2QxeGJCSEFnSkRyV05tRklKVHhEc1ZTK2J6WTVa?=
 =?utf-8?B?Y2NLdEsxZWJ4QTN4M1YrcXh5aTQ4ZnQ4a3kzRTVWeXljQUorcWt5KzRyamJD?=
 =?utf-8?B?eU4rSXlyZW9OY0xjbldNKzFZelBxaHlhazlVTEJjbjJzdU5zNHNmYjRra1NY?=
 =?utf-8?B?SmpUR2t0RXEvUzNWREYzZHpCRjJGNW1PYVRLWmJ6UjhCWVZMeXdvYUVRcDhu?=
 =?utf-8?B?b3FtMXhHVzJKam9oR210c3hCaFMrVjlxZUN3ZTljTzRXRy96TjVrL043cSsx?=
 =?utf-8?B?dmhUTlVRaUVpcklZVkM0K0xtYWdnWm1PWUVUMzhiRXhVdGVzMXF0ZCtZTVAw?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B7C33C96BEC7A44BE89DB2D7DB09BAF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07152927-c342-4288-0bf5-08dddf2d47ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 14:32:52.9467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eElj+Jrumz7OALwAuRE7NfO1ZGFMEcdpZ8q5tk5129cL9LLeRX3aaT2dn7srN9XdLHS3nPasDuCovrNp9kjVzAU3gwB7U+b2zGPs3SPM6gU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9366

DQoNCk9uIDgvMTkvMjUgMTY6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4wOC4yMDI1
IDE1OjEyLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBNSVNSQSBDIFJ1bGUgMi4xIHN0
YXRlczogIkEgcHJvamVjdCBzaGFsbCBub3QgY29udGFpbiB1bnJlYWNoYWJsZSBjb2RlLiINCj4+
DQo+PiBUaGUgZnVuY3Rpb24gJ1ByaW50RXJyTWVzZygpJyBpcyBpbXBsZW1lbnRlZCB0byBuZXZl
ciByZXR1cm4gY29udHJvbCB0bw0KPj4gaXRzIGNhbGxlci4gQXQgdGhlIGVuZCBvZiBpdHMgZXhl
Y3V0aW9uLCBpdCBjYWxscyAnYmxleGl0KCknLCB3aGljaCwgaW4NCj4+IHR1cm4sIGludm9rZXMg
J19fYnVpbHRpbl91bnJlYWNoYWJsZSgpJy4gVGhpcyBtYWtlcyB0aGUgJ3JldHVybiBmYWxzZTsn
DQo+PiBzdGF0ZW1lbnQgaW4gJ3JlYWRfZmlsZSgpJyBmdW5jdGlvbiB1bnJlYWNoYWJsZS4NCj4g
DQo+IEknbSBkaXNhcHBvaW50ZWQuIEluIGVhcmxpZXIgcmV2aWV3IGNvbW1lbnRzIEkgcG9pbnRl
ZCBvdXQgdGhhdCB0aGVyZSBhcmUNCj4gdHdvLiBZZXQgeW91IHNheSAidGhlIiwgd2l0aG91dCBm
dXJ0aGVyIGRpc2FtYmlndWF0aW9uLg0KPiANCj4+IC0tLSBhL2F1dG9tYXRpb24vZWNsYWlyX2Fu
YWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPj4gKysrIGIvYXV0b21hdGlvbi9lY2xhaXJf
YW5hbHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsDQo+PiBAQCAtNDEsNiArNDEsMTAgQEAgbm90
IGV4ZWN1dGFibGUsIGFuZCB0aGVyZWZvcmUgaXQgaXMgc2FmZSBmb3IgdGhlbSB0byBiZSB1bnJl
YWNoYWJsZS4iDQo+PiAgIC1jYWxsX3Byb3BlcnRpZXMrPXsibmFtZShfX2J1aWx0aW5fdW5yZWFj
aGFibGUpJiZzdG10KGJlZ2luKGFueV9leHAobWFjcm8obmFtZShBU1NFUlRfVU5SRUFDSEFCTEUp
KSkpKSIsIHsibm9yZXR1cm4oZmFsc2UpIn19DQo+PiAgIC1kb2NfZW5kDQo+PiAgIA0KPj4gKy1k
b2NfYmVnaW49IlVucmVhY2hhYmlsaXR5IGNhdXNlZCBieSB0aGUgY2FsbCB0byB0aGUgJ1ByaW50
RXJyTWVzZygpJyBmdW5jdGlvbiBpcyBkZWxpYmVyYXRlLCBhcyBpdCB0ZXJtaW5hdGVzIGV4ZWN1
dGlvbiwgZW5zdXJpbmcgbm8gY29udHJvbCBmbG93IGNvbnRpbnVlcyBwYXN0IHRoaXMgcG9pbnQu
Ig0KPj4gKy1jb25maWc9TUMzQTIuUjIuMSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFueV9hcmVh
KF4uKlByaW50RXJyTWVzZy4qJCAmJiBhbnlfbG9jKGZpbGUoXnhlbi9jb21tb24vZWZpL2Jvb3Rc
XC5jJCkpKSJ9DQo+PiArLWRvY19lbmQNCj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgZGVz
Y3JpcHRpb24gaGVyZSwgbm9yIC4uLg0KPiANCj4+IC0tLSBhL2RvY3MvbWlzcmEvZGV2aWF0aW9u
cy5yc3QNCj4+ICsrKyBiL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+IEBAIC05Nyw2ICs5
NywxMyBAQCBEZXZpYXRpb25zIHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0KPj4gICAg
ICAgICAgWGVuIGV4cGVjdHMgZGV2ZWxvcGVycyB0byBlbnN1cmUgY29kZSByZW1haW5zIHNhZmUg
YW5kIHJlbGlhYmxlIGluIGJ1aWxkcywNCj4+ICAgICAgICAgIGV2ZW4gd2hlbiBkZWJ1Zy1vbmx5
IGFzc2VydGlvbnMgbGlrZSBgQVNTRVJUX1VOUkVBQ0hBQkxFKCkgYXJlIHJlbW92ZWQuDQo+PiAg
IA0KPj4gKyAgICogLSBSMi4xDQo+PiArICAgICAtIEZ1bmN0aW9uIGBQcmludEVyck1lc2coKWAg
dGVybWluYXRlcyBleGVjdXRpb24gKGF0IHRoZSBlbmQgaXQgY2FsbHMNCj4+ICsgICAgICAgYGJs
ZXhpdCgpYCwgd2hpY2gsIGluIHR1cm4sIGludm9rZXMgYF9fYnVpbHRpbl91bnJlYWNoYWJsZSgp
YCksIGVuc3VyaW5nDQo+PiArICAgICAgIG5vIGNvZGUgYmV5b25kIHRoaXMgcG9pbnQgaXMgZXZl
ciByZWFjaGVkLiBUaGlzIGd1YXJhbnRlZXMgdGhhdCBleGVjdXRpb24NCj4+ICsgICAgICAgd29u
J3QgaW5jb3JyZWN0bHkgcHJvY2VlZCBvciBpbnRyb2R1Y2UgdW53YW50ZWQgYmVoYXZpb3IuDQo+
PiArICAgICAtIFRhZ2dlZCBhcyBgZGVsaWJlcmF0ZWAgZm9yIEVDTEFJUi4NCj4gDQo+IC4uIHRo
ZSB0ZXh0IGhlcmUuIFByaW50RXJyTWVzZygpIGlzIG5vcmV0dXJuLiBXaHkgd291bGQgYW55dGhp
bmcgbmVlZCBzYXlpbmcgYWJvdXQNCj4gaXQ/IElzbid0IHRoZSBwcm9ibGVtIGhlcmUgc29sZWx5
IHdpdGggdGhlIHRhaWwgb2YgcmVhZF9maWxlKCksIHdoaWxlIG90aGVyIHVzZXMNCj4gb2YgUHJp
bnRFcnJNZXNnKCkgYXJlIG9rYXk/DQo+IA0KPiBKYW4NCg0KSSdtIGEgbGl0dGxlIGJpdCBjb25m
dXNlZC4NCg0KQXMgSSB1bmRlcnN0b29kIHlvdSBwcm9wb3NlZCB0byBpbnNlcnQgdGhlIFNBRiBj
b21tZW50IGJlZm9yZSB0aGUgDQoncmV0dXJuJyBzdGF0ZW1lbnQgKHdpdGggcHJvcGVyIGp1c3Rp
ZmljYXRpb24pLg0KDQpBbmQgY3VycmVudCBFY2xhaXIgY29uZmlndXJhdGlvbiAmIGRlc2NyaXB0
aW9ucyBhcmUgbm90IGdvb2QgYXQgYWxsLg0KDQpBbSBJIHJpZ2h0Pw0KDQpEbXl0cm8uDQo=

