Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A345ABEBAE
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 08:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991475.1375324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHccj-0000SE-Hd; Wed, 21 May 2025 06:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991475.1375324; Wed, 21 May 2025 06:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHccj-0000P9-Eb; Wed, 21 May 2025 06:08:17 +0000
Received: by outflank-mailman (input) for mailman id 991475;
 Wed, 21 May 2025 06:08:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RySz=YF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uHcci-0000Ok-0s
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 06:08:16 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2416::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa726e9f-3609-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 08:08:13 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB9039.namprd12.prod.outlook.com (2603:10b6:8:de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.33; Wed, 21 May
 2025 06:08:09 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 06:08:08 +0000
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
X-Inumbo-ID: fa726e9f-3609-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+ZN2O59wp83OaQLsIEVd9Rv1uaibBykjHuj5G8p2wdTEMZPFtshnAiTGdiTcNMQK32JxE6cfC6xUjJ9MHPdL9kTRiVlmg0BvsCCiqwaYf6xHB/f/cRCPvTpCLqW5aaNChm0y0f4XxdgDpomgYCpXMeGl0fzh02JmQUHXevZt+HoKyOM00omhIv3YIjWjHIzoPYDHKQZO4EQyW2z9EbE/l6p2WmrAdwZozUE9a2otQ4JOhkETzVqtfhAOBn0wtcK6OJYCAL3LsQZ8ikyYyW466Z7mte/XrHmsTyyLsd4yTsPK4SuNTXEq1BaUDtn9vdhbcEy5+BEjoFjLScZpMzSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WuRcDIk3zF5y1XhTwOra9wRMAmikeC5dlcFz4anZRU=;
 b=Vwun8jLhS7a441X0NEOb9E1PkD0TrigjUVlUgOoUjWVhU9PZB/R3TDuj6zoh0LnGhGW+LIvc8RQi0QSjeRhlIgFIE78ZzMFUr+dc6zEOvarKeHBav2zyBwOlctsXbX751FBFZv/eFc277M7y5rdZhkPo6EN3s7htV8S2mtRVC7y31V0ufkrZczgCJdFesDr+xjtFuuBIwslMDYON8PkZcXD9IetCv1Dg3BtZ4WV0jjLqbv6UDF9CZZn7LrLPA9E9DR/KfKzs9RbTNug22xp8R8RP/z3DTYyKJKwmyxRgayjGWEyoNIDRH0G1NWgmokrLYLDQXz055VV/9v9vpb156Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WuRcDIk3zF5y1XhTwOra9wRMAmikeC5dlcFz4anZRU=;
 b=VC9/cAdAxoNtgqjlQELNsqGjgQk7W0L6EUNVaONHBETZ4tp2MI+pljq/DGTHQj+ms6je1nRAE/YdxZrJFBPxrw+SEIYoXV7j2wO3WjNgvBFVbtrPHdH0niJP8+g9H1cYunCr0NYlIxB4mRuf6eVXVhXxpD4JRZc57S5VIez67F4=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
Thread-Topic: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
Thread-Index:
 AQHbwMGevTfR886wakahq6ntIeNmMrPYfnSAgAGVuQD//4B5gIAAiU8A///fQoCAAAM5gIADLxQA
Date: Wed, 21 May 2025 06:08:08 +0000
Message-ID:
 <BL1PR12MB5849FAED8343F6F2D2C68BA5E79EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-4-Jiqian.Chen@amd.com>
 <b569f90b-673d-44c0-b350-8a6f5f3c8d78@suse.com>
 <BL1PR12MB5849E0E13D669CE6B2755399E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <bcdc0848-0c12-4ee0-b923-c7d5243bf097@suse.com>
 <BL1PR12MB58494740C0B258C63C3EBC08E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <20d48f86-d7fe-47c8-89ab-61d816e1d6e9@suse.com> <aCswbbh-0GTdr1tr@Mac.lan>
In-Reply-To: <aCswbbh-0GTdr1tr@Mac.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB9039:EE_
x-ms-office365-filtering-correlation-id: aece10c6-cf8a-4b0e-4e2c-08dd982ddbcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dnQrMXhUR0pHc2tXalBuMlRtMGwxNXphbnpBYTFsM3VIZG9OSkhvZHh0QVl5?=
 =?utf-8?B?cVEwc2tTYU0zR1hncUl2Y3NBSXo1NmVqam9qeHhqakpjamZMNGViQUg5b0FO?=
 =?utf-8?B?VmRmZlJTVUUrVTA5LzNadHIya3BNZlBJQjFkdldXZlk5ZWxKNjErZmV6eld2?=
 =?utf-8?B?SjFUbXoxSmdYMTI1NHdnSTZESUlpanhZRnJhaDlGclhYYzAzR0RxdHhJVXYw?=
 =?utf-8?B?RDBmeDFiR2R2Rjc4N29pbHBnWGJPaHI1TnRlc1Z6UHQ5QnAzaURFemcxWkZN?=
 =?utf-8?B?U1pPYXFUZVJFU1dXT1N0MnpIWVdzZ2MxZ2hIdzRtcG53REQ4WjdOaW1zMTFT?=
 =?utf-8?B?bStJL1Q4V2dURjZ3WkdHeS9VS1RsOFgrajF3MFdYaU5qQ0RBcE9hTGxuRUFQ?=
 =?utf-8?B?cVdFUURoN0hiOFZSN3lnNFEvVGorVU9aOWc5azdyeUJQby9uV1BITGU3c1N3?=
 =?utf-8?B?TDNGSzdJS3d4YkZ0N1p6Z1RScXlRV0NUMDBmQ25VRjRUbVZPWGYzdUxCK3Jy?=
 =?utf-8?B?QWd2QmtUazVRaFpCWHlmTk5iMFg2Y3Qxbk1aQi9uNTNjVmtrM0NtLzhUbHZ4?=
 =?utf-8?B?RlR1U295N09kV0t1TUdCYmlPbDM5TGZSUzhzUWZqcG5ZVlJNZ09TQTJlUWlK?=
 =?utf-8?B?ZllBc3UyemUydVArMndzOHhsd3Jqa0ExTjVCMGErME05R2ZKUllzcE1rUGFU?=
 =?utf-8?B?dnJrTTBYOWFLeklWZ3NrNFpZUkpHbXZrOXBjUUN5dEhpVEE2SWtIWFE2UlA2?=
 =?utf-8?B?akdPc2RYWk5MY1I4Y0hEVUtBRlJObFhEeGVrRWhXdzJ0ejkvY1dST2VPaUdE?=
 =?utf-8?B?aWlQbkpqTGZDbWNrY3ViL2tyTUh3UGdidTBYYytoNXdadEhYLzBIK3VqUjhq?=
 =?utf-8?B?a0hmYXhkMU5SVm5NVUNVWFZSZWR2dlRtNUw4NFU2aS9TdVFXU2I2Ykg4cVQ1?=
 =?utf-8?B?T0plK2tMRDJmeWFSRHBRNlNYS09FdnFTUFdqcHJNRmdvR2JvRjl2VmdxNi9a?=
 =?utf-8?B?dGh6N21pc2lZYWxxQUhuMXVXOG9rSXh6QzUyMzZTUW5ScTNDaXY0Z2k1Z0ZT?=
 =?utf-8?B?ZmRSRW16Y3hrL0E1OHYrY25haUdoL0k3OGlXSGFSZTJLVXZaaUlCaytuRElF?=
 =?utf-8?B?TDJkYWNISHFDL0tLVjBwZWpTZWpWcWJYbGwrK2JqbGFKVXhCTDQyczVGZy9M?=
 =?utf-8?B?d3o1WTFiK00rK1pyaGY4WjBnRGcyL1AzTDhuSXRuRFZEdExNQ01tOG5aV2M3?=
 =?utf-8?B?YU0xOGdiRk9XaUl4b0FHRGpsT0VKTlQvbjBwaEFOMVJNMDFFMVRydktBUXQy?=
 =?utf-8?B?cVJBb2xCdzBaZGxBZy9HRHFadkEvZlBuSmhsQ2xjM2ZiZGljcnpSbWx1M2Zz?=
 =?utf-8?B?SFdMbWR5OWdnMDlJbDV0bityY2Fha2RPcmpCUTJWUVBMeHMvQW1ad0VjL1gv?=
 =?utf-8?B?QTlaeHJ5SUJXZXRNM3B2RC85eEtSSE1abjZWbGU1RkF3K1NudE83V3JPQldv?=
 =?utf-8?B?TjJiVW5qTmw2bUxucmV0L3VkWWdBK1gxVkZVdTZicHg2Qk85bC9WSGJBdTZW?=
 =?utf-8?B?SlB2TGxnckxYM0xnSzZCRDF4SkVUcHh1NjBUTE1rV1pEWVljTkhIWEJhVDRt?=
 =?utf-8?B?TFZQQ3V0SVI5QjBlaTFMM0JrMjRFWmwwbWZSYWZWM1c2dXMyMXJzcmExZThM?=
 =?utf-8?B?WVNVNFpHYTRYRXlmUjhLNHRsUkFCOGpiYlowU29peHBFd3d6ejJtL1YrOUZ3?=
 =?utf-8?B?K0dXUDRYZmcwcnVaL3Z4VWllM0lZK1QxM2hhaDl2anUvNzJwUFRQeDV4czVF?=
 =?utf-8?B?WVVwYi83cmpvNUtsSlFPeEU0WUMxb0hJdDROZkljc3cyZEFlOGlDRXpsanp6?=
 =?utf-8?B?Y2tBaWNCQWZMZmlFa2ZFZ1hQSzh4b2swRStqZHhCYThzcG5qdDVQZlh6YjhO?=
 =?utf-8?B?aGpHV2Faa3BSdmNzNm1XNkcyRyszZVZvTSswTGNDSStUSkNEL3hVUFhpYXph?=
 =?utf-8?B?QlhUSWFoNEFBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXNqLzB6VVNFRHdOSW1sTFhKdnZEWURKYVphTm4rZGtCRGpCaDVXZm0yUEVV?=
 =?utf-8?B?bk1zT1dqN0VmcGdPQnBVaGxIREpLQ1oyR1QrZUN0TjBnaDFUQnhFcjYyWXo0?=
 =?utf-8?B?MU1BWXBDRG9KZFVNbk5UdW9tUGhUUk80TWk5d1cwRGlwQlU2bkZQWU1saGNk?=
 =?utf-8?B?MDQxT1YzaHpLNnF3M2RyYWxuQ1ZId3ZQNzVXUkZ3V25qcThsME51d1BnTEVK?=
 =?utf-8?B?cVhRbHAwUW96c2hkYkw4Um5EL2RRODBEZTNsOXM5UjlIWk80Y1NhRVlrb1Jl?=
 =?utf-8?B?cC9NME9sNzZxK1NERUovZ2lNbEpwem9wVndTR0hiU0xLUzczdy90T2hGM1pI?=
 =?utf-8?B?eGF1S05EVDFCelljSXZUb3hHQTJIOFBWVDIyRVJmS0VIejVMSEZFK09JRGdX?=
 =?utf-8?B?VWIyZUZWbDlFdDRCWEJwcUdXMVZXNUNSbWdZR3Z0YjVwcWVxbU5PaElJYmJ6?=
 =?utf-8?B?bTFJQTd0RFV5akhlSXVkbVdSN25RS3dNZEYxV0VONXZ0UmNIQ1FaTkgzdVpp?=
 =?utf-8?B?R2tIajNmK05JOEw5SGZ6ZVRhZTJrOGdaditMMUtJdy9pQ2JYRDFRWkJxaFBP?=
 =?utf-8?B?ZE9NR3dMbDh4RjZSVDVsUXgxdUJNYkZyWXlxWm5zNHNRa2ZlVktIYzNGd3Ax?=
 =?utf-8?B?UVVCZllQVGUrZUFjZnVPa1ltYTVWdDNpc2NYOTh4dlg5L1IxMGpmOWluS0FO?=
 =?utf-8?B?TUFBcmdpUEhCbWQ5Yytjang3NXJneXkvY2tKd2c1VnFDS3h5bFR6MUJNNGts?=
 =?utf-8?B?R0s1VFU5RHdWN1FicEdTOEJpdUVXQXhRRVc1VEpkcHBFQzhXVmRJU3NhQldn?=
 =?utf-8?B?Sy9jaDZpZElEL3c4cHJSY0QvcW9ZV2FBdXhyM0NDY2ZrYXVsbThHcjBFNGtx?=
 =?utf-8?B?RStFNEhoL1hoZjB5aVFMS2Y3Ykx4aExMTUYyTVIvK201V0dLTjBqZnJVZm03?=
 =?utf-8?B?eDdDQ0hKemZmWVJZQ0xpMEhtcWthQkFQUGc3ZGVITnBXM21RaVkzVFJOTXkw?=
 =?utf-8?B?cGh3RGI5WVBjU0xUeUlxS0FiYklkeTd1aU01ZWJ3WnhTSExtN29EVEM4dEVC?=
 =?utf-8?B?RU1BL2tuZHNJeWx1RkQ1d1h4b0V4Qmc4ZUlHdTdEcVRXT2VrVGMxZ29HY2Jo?=
 =?utf-8?B?MURuMWdnY044Nm1XMXQvYXVqd2t0TVh2M0VsZ3hrK04ySFpjZmJnaGpNYktj?=
 =?utf-8?B?V1ViZ0JlM3NXd3ZIaTB2WjRibHRQQ3ZiaFZOeEhNaDR5dGRtR3N3WTNOZy9k?=
 =?utf-8?B?UjNNdEJvN0d1R1MyczJRK243ZUk5dWZDVStDUjMxTjcrWWJySW5kalZHejBM?=
 =?utf-8?B?UVI1ZnQvSUQ0RE9xV2h4YmliazZiZnRBc1lBcGU0MC9OZEJJUnFhWkVBYWpt?=
 =?utf-8?B?eERqZzB4UFNZbEltMzlKQnoxbGdBT01nNGxsc2w0blZ6VFlqaU5paldVTzdD?=
 =?utf-8?B?VW4ySTl6UVFDTUl1bHA3MUlUcDNydGtGRHo5YjdxRWN1U2IrbUVQakxzc2ZR?=
 =?utf-8?B?TGt4RXIwd2JiaktmWlZGdWdvUWtYTjJzekMyVm01TlFuWXllUjdDS2Z1MEN5?=
 =?utf-8?B?MzlsNEhvakNkbGdvN1FxeTBQNmt4OGhiSmlxUnBuYUdrU0FENnFVbWVUd2J5?=
 =?utf-8?B?blp2WDk2eGZ5R0hNRXBCcTlNenJCRTNVcG1qcFpBN3RNUGdGTUova1VRWloz?=
 =?utf-8?B?MTQ4V1Mva2dHUy80Z0o4aFhXSlVRVWttYzFxM2R0SGpFQ1ZNeFFGdVB3RVZ5?=
 =?utf-8?B?c1FCOC9VRnY4S0o2NlVtelFFR0krVlp3TmxWRHhZcGJnMVdwamNSdkxCRlNp?=
 =?utf-8?B?WFpLMUc4clZGeFNpaENROHJ0WXBlSFEvb0FrMGJiVmFNLzk3VXJ4OGhoMGlG?=
 =?utf-8?B?ejY1ak83eFFQTXhNZzMvRUppb0RKRjY2VHZsRnJFYWpzeUVyNE1tazFYN05J?=
 =?utf-8?B?NllNd3hvOUlrVEJQZDRxeUk0MWZmbkYwOTA3NXdheUVzbHNFNGxVUzY3UDEz?=
 =?utf-8?B?ZlBrWGZ3TGQzQU1LbDNTVk1ybVBLK1drdGRYQTNZYmV1Mk9RRC9VSVlQcFVF?=
 =?utf-8?B?alNjczZrUjkzN0xoR0VHeGhieEhXRXR4UGo1SDY4RnRhUklVVmZBY0pEVGNr?=
 =?utf-8?Q?PoUE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1BBBFD615EEBD4CBD9F106D03739310@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aece10c6-cf8a-4b0e-4e2c-08dd982ddbcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 06:08:08.4669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16s2/vkQnGgyISC/m6NGgYs3BCMnbBeSZ09DuhuTA3SXspYcErRSJlLCfA911NVVc+ZevA1b4jP58Ikxq4OiNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9039

T24gMjAyNS81LzE5IDIxOjIxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24sIE1h
eSAxOSwgMjAyNSBhdCAwMzoxMDoxN1BNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9u
IDE5LjA1LjIwMjUgMDk6MTMsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+PiBPbiAyMDI1LzUvMTkg
MTQ6NTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxOS4wNS4yMDI1IDA4OjQzLCBDaGVu
LCBKaXFpYW4gd3JvdGU6DQo+Pj4+PiBPbiAyMDI1LzUvMTggMjI6MjAsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+Pj4+IE9uIDA5LjA1LjIwMjUgMTE6MDUsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+
Pj4+PiBAQCAtODI3LDYgKzgyNywzNCBAQCBzdGF0aWMgaW50IHZwY2lfaW5pdF9jYXBhYmlsaXR5
X2xpc3Qoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX1NUQVRVU19SU1ZEWl9NQVNLKTsNCj4+
Pj4+Pj4gIH0NCj4+Pj4+Pj4gIA0KPj4+Pj4+PiArc3RhdGljIGludCB2cGNpX2luaXRfZXh0X2Nh
cGFiaWxpdHlfbGlzdChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4g
KyAgICB1bnNpZ25lZCBpbnQgcG9zID0gUENJX0NGR19TUEFDRV9TSVpFLCB0dGwgPSA0ODA7DQo+
Pj4+Pj4NCj4+Pj4+PiBUaGUgdHRsIHZhbHVlIGV4aXN0cyAoaW4gdGhlIGZ1bmN0aW9uIHlvdSB0
b29rIGl0IGZyb20pIHRvIG1ha2Ugc3VyZQ0KPj4+Pj4+IHRoZSBsb29wIGJlbG93IGV2ZW50dWFs
bHkgZW5kcy4gVGhhdCBpcywgdG8gYmUgYWJsZSB0byBraW5kIG9mDQo+Pj4+Pj4gZ3JhY2VmdWxs
eSBkZWFsIHdpdGggbG9vcHMgaW4gdGhlIGxpbmtlZCBsaXN0LiBTdWNoIGxvb3BzLCBob3dldmVy
LA0KPj4+Pj4+IHdvdWxkIC4uLg0KPj4+Pj4+DQo+Pj4+Pj4+ICsgICAgaWYgKCAhaXNfaGFyZHdh
cmVfZG9tYWluKHBkZXYtPmRvbWFpbikgKQ0KPj4+Pj4+PiArICAgICAgICAvKiBFeHRlbmRlZCBj
YXBhYmlsaXRpZXMgcmVhZCBhcyB6ZXJvLCB3cml0ZSBpZ25vcmUgZm9yIGd1ZXN0ICovDQo+Pj4+
Pj4+ICsgICAgICAgIHJldHVybiB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX3Jl
YWRfdmFsLCBOVUxMLA0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cG9zLCA0LCAodm9pZCAqKTApOw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsgICAgd2hpbGUgKCBwb3Mg
Pj0gUENJX0NGR19TUEFDRV9TSVpFICYmIHR0bC0tICkNCj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+
ICsgICAgICAgIHVpbnQzMl90IGhlYWRlciA9IHBjaV9jb25mX3JlYWQzMihwZGV2LT5zYmRmLCBw
b3MpOw0KPj4+Pj4+PiArICAgICAgICBpbnQgcmM7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICAg
ICAgaWYgKCAhaGVhZGVyICkNCj4+Pj4+Pj4gKyAgICAgICAgICAgIHJldHVybiAwOw0KPj4+Pj4+
PiArDQo+Pj4+Pj4+ICsgICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwg
dnBjaV9yZWFkX3ZhbCwgdnBjaV9od193cml0ZTMyLA0KPj4+Pj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBvcywgNCwgKHZvaWQgKikodWludHB0cl90KWhlYWRlcik7DQo+Pj4+
Pj4NCj4+Pj4+PiAuLi4gbWVhbiB3ZSBtYXkgaW52b2tlIHRoaXMgdHdpY2UgZm9yIHRoZSBzYW1l
IGNhcGFiaWxpdHkuIFN1Y2gNCj4+Pj4+PiBhIHNlY29uZGFyeSBpbnZvY2F0aW9uIHdvdWxkIGZh
aWwgd2l0aCAtRUVYSVNULCBjYXVzaW5nIGRldmljZSBpbml0DQo+Pj4+Pj4gdG8gZmFpbCBhbHRv
Z2V0aGVyLiBXaGljaCBpcyBraW5kIG9mIGFnYWluc3Qgb3VyIGFpbSBvZiBleHBvc2luZw0KPj4+
Pj4+IChpbiBhIGNvbnRyb2xsZWQgbWFubmVyKSBhcyBtdWNoIG9mIHRoZSBQQ0kgaGFyZHdhcmUg
YXMgcG9zc2libGUuDQo+Pj4+PiBNYXkgSSBrbm93IHdoYXQgc2l0dWF0aW9uIHRoYXQgY2FuIG1h
a2UgdGhpcyB0d2ljZSBmb3Igb25lIGNhcGFiaWxpdHkgd2hlbiBpbml0aWFsaXphdGlvbj8NCj4+
Pj4+IERvZXMgaGFyZHdhcmUgY2FwYWJpbGl0eSBsaXN0IGhhdmUgYSBjeWNsZT8NCj4+Pj4NCj4+
Pj4gQW55IG9mIHRoaXMgaXMgdG8gd29yayBhcm91bmQgZmxhd2VkIGhhcmR3YXJlLCBJIHN1cHBv
c2UuDQo+Pj4+DQo+Pj4+Pj4gSW1vIHdlIG91Z2h0IHRvIGJlIHVzaW5nIGEgYml0bWFwIHRvIGRl
dGVjdCB0aGUgc2l0dWF0aW9uIGVhcmxpZXINCj4+Pj4+PiBhbmQgaGVuY2UgdG8gYmUgYWJsZSB0
byBhdm9pZCByZWR1bmRhbnQgcmVnaXN0ZXIgYWRkaXRpb24uIFRob3VnaHRzPw0KPj4+Pj4gQ2Fu
IHdlIGp1c3QgbGV0IGl0IGdvIGZvcndhcmQgYW5kIGNvbnRpbnVlIHRvIGFkZCByZWdpc3RlciBm
b3IgbmV4dCBjYXBhYmlsaXR5IHdoZW4gcmMgPT0gLUVYSVNULCBpbnN0ZWFkIG9mIHJldHVybmlu
ZyBlcnJvciA/DQo+Pj4+DQo+Pj4+IFBvc3NpYmxlLCBidXQgZmVlbHMgd3JvbmcuDQo+Pj4gSG93
IGFib3V0IHdoZW4gRVhJU1QsIHNldHRpbmcgdGhlIG5leHQgYml0cyBvZiBwcmV2aW91cyBleHRl
bmRlZCBjYXBhYmlsaXR5IHRvIGJlIHplcm8gYW5kIHJldHVybiAwPyBUaGVuIHdlIGJyZWFrIHRo
ZSBjeWNsZS4NCj4+DQo+PiBIbW0uIEFnYWluIGFuIG9wdGlvbiwgeWV0IGFnYWluIEknbSBub3Qg
Y2VydGFpbi4gQnV0IHRoYXQncyBwZXJoYXBzIGp1c3QNCj4+IG1lLCBhbmQgUm9nZXIgbWF5IGJl
IGZpbmUgd2l0aCBpdC4gSU9XIHdlIG1pZ2h0IGFzIHdlbGwgc3RhcnQgb3V0IHRoaXMgd2F5LA0K
Pj4gYW5kIGFkanVzdCBpZiAoZXZlcikgYW4gaXNzdWUgd2l0aCBhIHJlYWwgZGV2aWNlIGlzIGZv
dW5kLg0KPiANCj4gUmV0dXJuaW5nIC1FRVhJU1QgbWlnaHQgYmUgZmluZSwgYnV0IGF0IHRoYXQg
cG9pbnQgdGhlcmUncyBubyBmdXJ0aGVyDQo+IGNhcGFiaWxpdHkgdG8gcHJvY2Vzcy4gIFRoZXJl
J3MgYSBsb29wIGluIHRoZSBsaW5rZWQgY2FwYWJpbGl0eSBsaXN0LA0KPiBhbmQgd2Ugc2hvdWxk
IGp1c3QgZXhpdC4gIFRoZXJlIG5lZWRzIHRvIGJlIGEgd2FybmluZyBpbiB0aGlzIGNhc2UsDQo+
IGFuZCBzaW5jZSB0aGlzIGlzIGZvciB0aGUgaGFyZHdhcmUgZG9tYWluIG9ubHkgaXQgc2hvdWxk
bid0IGJlIGZhdGFsLg0KPiANCklmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIEkgbmVlZCB0byBh
ZGQgYmVsb3cgaW4gbmV4dCB2ZXJzaW9uPw0KDQogICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lz
dGVyKHBkZXYtPnZwY2ksIHZwY2lfcmVhZF92YWwsIHZwY2lfaHdfd3JpdGUzMiwNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcG9zLCA0LCAodm9pZCAqKSh1aW50cHRyX3QpaGVhZGVy
KTsNCisNCisgICAgICAgIGlmICggcmMgPT0gLUVFWElTVCApDQorICAgICAgICB7DQorICAgICAg
ICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQorICAgICAgICAgICAgICAgICAgICIlcGQgJXBw
OiB0aGVyZSBpcyBhIGxvb3AgaW4gdGhlIGxpbmtlZCBjYXBhYmlsaXR5IGxpc3RcbiIsDQorICAg
ICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNiZGYpOw0KKyAgICAgICAgICAg
IHJldHVybiAwOw0KKyAgICAgICAgfQ0KKw0KICAgICAgICAgaWYgKCByYyApDQogICAgICAgICAg
ICAgcmV0dXJuIHJjOw0KDQo+IElmIGl0IHdhcyBmb3IgZG9tVXMgd2Ugd291bGQgcG9zc2libHkg
bmVlZCB0byBkaXNjdXNzIHdoZXRoZXINCj4gYXNzaWduaW5nIHRoZSBkZXZpY2Ugc2hvdWxkIGZh
aWwgaWYgYSBjYXBhYmlsaXR5IGxpbmtlZCBsaXN0IGxvb3AgaXMNCj4gZm91bmQuDQo+IA0KPiBU
aGFua3MsIFJvZ2VyLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

