Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0EEB31117
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 10:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089679.1447184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMka-0006Si-T8; Fri, 22 Aug 2025 08:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089679.1447184; Fri, 22 Aug 2025 08:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMka-0006Qg-Q3; Fri, 22 Aug 2025 08:03:52 +0000
Received: by outflank-mailman (input) for mailman id 1089679;
 Fri, 22 Aug 2025 08:03:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3vR7=3C=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1upMkW-0006Qa-9U
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 08:03:52 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87d9f350-7f2e-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 10:03:47 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB9PR03MB7565.eurprd03.prod.outlook.com
 (2603:10a6:10:2c1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Fri, 22 Aug
 2025 08:03:44 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 08:03:43 +0000
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
X-Inumbo-ID: 87d9f350-7f2e-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdbddw1yvqvbRec0kJdg+RPt6RPu55ytABd5RjEU1W52d3olHc7nadf+0e/YpzLO6SnGKh/AykWv66+eCwXxbtCCMIKK7WcXpT3HSGrOop4OmfYdH0kul6yZMGJX5mR8pL95kDrnSzpqGyR/FmMmrHB1zUVnNMcRK1aZB+bfGYNsMjiU6f38tgWZ0SKh6Q4EHVQ3T/TZ01INM9VIyOCdPKncGUjGb682ZrU3/uoQX/KxbCbm1ZzGAM9TkUVUN1ictnsblRKRVf4tScpfuIm67Rr6XFkuJ/+U8SUOFjhDSAToolGCs7h0hWJOA+NfX+M/J4dJG5/iZ7EeZE4WjX548Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNowHo/RDLQ8SBwcreAsJpQx+L5ucmWWOrnyLUe/zak=;
 b=LQnLGDWN/6idOH5r2tZVE+27c31qyIJiMXTf7YCIZfzRMidrgRy0wtmkaknlYv+OEWutLfbfpXoGBL3y7Elc4Fu+mb6V1ORgjNYzSXfYIsP+fYhhakzqBLFJSXK+NpIFOOOaQJXlxCrcU1lyI1/AmAuUzZiYx5xDoV+Wz2j8oMFDbLb9LYR/Nzs4hrodmXP9760DIfO68hI/OeWVY0uFjNYuwZghHpuYL+6y7AWcQfeF8IoTUm81Hsceps1Vr8copGpeDsxuFxpKr3I8MjGt9vnaHz3FuWV3eBvtkc8bt8jLd07f+5IFgmb9+VoTnxDPTWV4qP+OLQOJ7JZJi9Ge7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNowHo/RDLQ8SBwcreAsJpQx+L5ucmWWOrnyLUe/zak=;
 b=fAAQUqBzJx3fdPE7WbXI9LFs9EF4KqRqGar3yBQiWJp+A8XjhfHjaSl84vTq6BBIk2cA+m5WelIH8+1pdBnEriC7f/jfYva8siWEGlBerTZtGDPvbXllUNBOsekj9QBXn/DIx6yEfUZoacQFcVb+rReUXvKzqembVthLHb3ju2DIYlRG+iodWojnGyi45Ad7yoGvEXo81cgN154UG+olrBHQrIP7FFWjbn2BpZ0rAQQK0WC69h6ti1tJ0bRzroOxRAxpEx0o5yU4ip3b3TwEt0OgJqeiXRy66H8YI/63oa+wX6Z9RNSjcyEzfWjYKo2gK8uXvPy8dEKeDrtrs0sp3Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Luca Fancellu <luca.fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/3] xen/pci: add discovered PCI device at boot
Thread-Topic: [PATCH v2 3/3] xen/pci: add discovered PCI device at boot
Thread-Index: AQHcEc3mKXITpUZcl0ea3L2+fX5U/bRs0pmAgAGAWAA=
Date: Fri, 22 Aug 2025 08:03:43 +0000
Message-ID: <df2d1f6a-23bc-4451-a91f-a484b448c467@epam.com>
References: <cover.1755683961.git.mykyta_poturai@epam.com>
 <bb2589996131b0e7e645c0af281b9862e2e0f4cb.1755683961.git.mykyta_poturai@epam.com>
 <26bad9fb-3c4b-4423-a443-3406d07d56e0@suse.com>
In-Reply-To: <26bad9fb-3c4b-4423-a443-3406d07d56e0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB9PR03MB7565:EE_
x-ms-office365-filtering-correlation-id: 5c82a4e2-bd8b-437b-1760-08dde15269d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d3BSaTdHYzdwcWg5dXIybkVTcERZRHg5cnJXcWxVU0p5Q0VrbDdSQlFjekY0?=
 =?utf-8?B?T3luL214YWJtRWtNSU5RRTZpREUyQ3Q2bEpsNE53am1DdzhoM1g3YkdxcHE0?=
 =?utf-8?B?QzhHNjc2UGpPUC9NRXpUQmNrNUg1a0V3QnlJWVRQeHR6a3hBRkpBRzNrcFFl?=
 =?utf-8?B?Q1NEemV1S2c3N1FvUHJEL2o3cmxVL0V2Yk9zcm15YnRPOWFkRTNNcHNzRkVv?=
 =?utf-8?B?Vm1HZjlBKzhvVURpRXZsZEUrWVdJNTFxbitqTEUyV1V2cE4yWGhidFpvYnhm?=
 =?utf-8?B?bFlmZU9GaW1ZRmhKSmtha3pNU1laV2psUHJkd3c0UGVwTjgzQngrMmcrMDdt?=
 =?utf-8?B?UWppb1VjMHdQdWpxVjhIbHkzQWU5aGhkSVN4MXkrYzJ5T1Y1UThUMnM3SVJv?=
 =?utf-8?B?cWoxbXVvNFpoNUhSYUVhYXpmVnZRM2pPeUlEYkVOVFFVSm41cUZtMHFDSlFR?=
 =?utf-8?B?TDJKWmlBeExQSUxnVVBxUnVUYTAxWjU2dXl5Vmh1WWdLeEd1K0NVeWZ5T1hG?=
 =?utf-8?B?eWx0RmdTM3lFL1lHVkVNbjF1RzVlcUhDT3hkS3pXYzh3OWwwM0ZSdWlpMG5s?=
 =?utf-8?B?MDRhMHppY1dIOGlBcWppbmdsSFRlVFJJV1pONTNpQjhrWkNJV2lkRFBaK1ZB?=
 =?utf-8?B?YWsrcXg2clpwaFI4aGVUV2xZUVdLVEEvaFFwaHFQOXNnTVpqZjhHclJMNVdU?=
 =?utf-8?B?T3FkZTg4bUtNazdodDViZHVzMXJqTm5FNWZDOVR3ME4veGtiZlFrT2tCQlVo?=
 =?utf-8?B?TmYwY0lMNWR2V0VERVQ0VThNRmhkVG1aMXJuczA0cmhVYWIwa3NibUZGK3JZ?=
 =?utf-8?B?TmtsTEswaHZrZEh2K3NUMFVHakVXWC9DaDB2SmRIYU8wT1BpUytEUWFBU2lL?=
 =?utf-8?B?a1VXcmpjQmZoc01yaGxhWUNsdktOb1h3eVZCWWRjOSt3d3puS1NPUlB5KzdQ?=
 =?utf-8?B?S1J5OEJiY1FyUERlN2o1YWc4K2tobEpzOThqK3pncVJLUzhQb2ZEUWF1ZDNI?=
 =?utf-8?B?Ym9WMmlzMHFuaCtRTnlJNnlZL1FOQmJDWEFNYURGMzdqbFVQY1RyYm4zZEZ3?=
 =?utf-8?B?dUtYTlpCU3JZeStXbkhxWmlCQ0pEbGJaQ3lrSGZtd211TEdTdTJqOXpyZTZl?=
 =?utf-8?B?ek1kTW1lRmlmSDJnV3RIYzhGNmZqbXNNS0hadXlPNmxWemtWMEZtMFFyMmI5?=
 =?utf-8?B?Y3JGa1NGL0xqOHdydkFQQ0t2SkttU2xnYkx5Mmg4K1M5ci9peG52UlNRditU?=
 =?utf-8?B?MkVQb01Vemp0akZEejF3bG52Qm9GVkMxKzF2elIvM25LOUxXenUyd3dsQTNt?=
 =?utf-8?B?WEZRRk1wckxINjl3dlpxczF2VTgzZHl5bGNoWVVaRW9ENlZCUWtpR2hkc1dN?=
 =?utf-8?B?RWt6b1RtekYvUzFzU0duVDBrOXRBU1hYanBZajJTd2lFNENoWEhNRWJWNzRz?=
 =?utf-8?B?bUs3ZWhZS2lrbjRNQTk5YTRJeERaRko0RWlOZXNETUVFaWdjbVYyNW90OU1q?=
 =?utf-8?B?L2VIUG9weXFPWitRWDZQVG1QWFFYM2grMHo2VmNJL3AwTk1pc0JRRmVSTlgz?=
 =?utf-8?B?YTVyQzNFNkFFTzJWdHFtNi9lQ0pIblZvOWh4a2JsN2J4cHUwcWxTQUFjN3JV?=
 =?utf-8?B?ei9EbmpidkVFVnk1ODVvTjkwVE9sMm1tQ2xzV1NSNHpNMDRMV0wxS1RKYU1n?=
 =?utf-8?B?MWtZVXNLbnYxdDFKdEpTOVpEZ2M1RU44RmF1cHJuZG9YbHRVVlorbHlGTUdJ?=
 =?utf-8?B?VXVLUDI2WHU3TGg3Ym5seVV6SmJXMDlGZGFaY2lNRFlBdmNEcTk0aGRPY1Z5?=
 =?utf-8?B?amNDZW9XQUR0UTl6TEluR2Y2L3EwRGxydEx2a3pLcmg0MUR3b0NQazE3YXhy?=
 =?utf-8?B?L0UzaHdubGlzSlQwelVGdUdiS05ZWDdZNGU5YjZtRlZ4cmtvVnFjemRvdzll?=
 =?utf-8?B?NU80eTY4RzdOU3AranNEUnpYNEt5YVQyclQxTmtHdkg0VktTd2RaRUpFQnJY?=
 =?utf-8?Q?pEa7J9cFxZAyQAKnAERdJ6fcA7SWQ8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUtUU2Jybk1jN0RXSExBZEhtVU1GTWdzWC93OHJPK0FmRVg4NTI1NDFGS2Zv?=
 =?utf-8?B?ZmgySDM0SlIxT1pPRktqenRNWnNuZ3lkTmFGZnlVS2pxazlxT1h6TEFaZEwr?=
 =?utf-8?B?UUNxNkhVRm1BWWdOWDRkcUFINDk1ZmxseS9aSnc4MmJqRmtyQ25lT01vUFVO?=
 =?utf-8?B?UTlPekxOOHpGMUVZd2NycC9rRFFRMkxieEdEVElSdEYyUHVJdW41V01sMnU5?=
 =?utf-8?B?dUwrWitoM0hoMW8zOUtwcHlkYUZrT1BUVWxlVCtYU1kvMWVmOTVWRDNLbXAr?=
 =?utf-8?B?Ty82TUhGcDVuNllPckVBbDdES05DVHVVZDFtTjRNME5JV0Y2L1FVcDNpdkxR?=
 =?utf-8?B?SU95WGd2cTJTM2dFVnpnQ2RnOTdoR0pZSEhwbFdBSHdaMTRRTTZ6bEY0cFRO?=
 =?utf-8?B?ZjdiSC84bFFBa01aT1BIL1Nmc3FaRGlzQ3o0K2VzanRKZXhod2RJYzZjMkFi?=
 =?utf-8?B?MTVURXFBRmF0RmJNTXFFY2VVZE1NZ1h4WW5iUXRuNWpVUlVHbmh1Qk1leGhI?=
 =?utf-8?B?c2xQeGNuaWRJTVB0SllDQzJjaTdWVFlqMGhJa3BPeDRjdFprUHhxSTdJb3Yr?=
 =?utf-8?B?N1RrRGlMZW9wKzdKVFcvOVVBZ0sza0paV2U4UDFZUlB4a2c5ZVpTbDZLdmhp?=
 =?utf-8?B?ZlY0ZVBmTTZtTDRWbDIwTTlpL05ucmtPbkJ1bGVzaHpTaUptSTdISE9GbmNX?=
 =?utf-8?B?UFI4WjRYd1hwQjFxeVdvalVwdWh5WDEzaUxRKy9Hd25DZW9kNWhBeEN2SGtw?=
 =?utf-8?B?Q3RaZnBoSDRVSzVxeGt1QXZpR2tCZEJiZnFBTk9SRnZEZVpJOEhOMnZWUDR3?=
 =?utf-8?B?Uko5Q3ppRjZsbmE3YjIvcktzOU5rY1hiY085d2Z6cTRBbEFDQm5WYTNpYW1Q?=
 =?utf-8?B?cU03Sm5aSzh6M0N1SDBJOGhZanZOby9lUHhRTjJYck5QNHMzb3FUd2FKWkdk?=
 =?utf-8?B?T3hKU2FaZzl1T0JxMCtHaFhrVG9wTXkrZ3pXUmozMk12RittTTUzWjF6dTF2?=
 =?utf-8?B?b292Rkd2Rm16ell6Und2bWdGeWdob1RBdkFxQmhGQVU5KzF0MDV0OGNFWjRB?=
 =?utf-8?B?Q21xT00xSStqYjc5TGk5VjZDbzZycXo3MXlYTUdwSzcyUEc3dFBMOEowcndF?=
 =?utf-8?B?NXRXcC8wTHJKMFdXQnY5YkEzanNWNmkyR0NCS2pqMncwclNZc0hBWkNySWZl?=
 =?utf-8?B?SkZTdzlTTlN3ZFdBK3h5aXhIcTdnckJaaUd2NFpVN0ZtMkRvNTdDa1lPMzUy?=
 =?utf-8?B?TEdOVTNTTTlaWDVFQjBYT25Ec3NpaWhqYitXbjZnaUhuNWNwYTdvbXlMOWh2?=
 =?utf-8?B?M3FIWXVhUHl6cWttcTF4clZCZk1DSk1HQ2t0VklHcWFJaUFObmFEdlpSZldZ?=
 =?utf-8?B?NWFTcG5UN2VsSHBFVEk0SlN2Z2xvM3poMFZ3WEU0ZDh2WTduWTVmN3FTbHZv?=
 =?utf-8?B?ejB2Qnh1YmQxRFR1ekJyOFp1WFhlSUhBN0dNaHpNT0pGdENvMkIwem5oeStn?=
 =?utf-8?B?L3RBcHBXSVJ1MEx6SHM0d1plVzcrQ0JMZWh1S0o4cGJhVlc0Q3FXQkloQ0lG?=
 =?utf-8?B?SVRpczY2TTNXZ0VhbjE4OWhnUFRYdXVIbUIyaGpQZjBJMGhybGdwSVVLTnBj?=
 =?utf-8?B?cUlrS2J2TTk4S3B2QnRqOTJmSWJlb1hhQVlSc1hVQUdib2FqamR4NzlFQTdT?=
 =?utf-8?B?a2toQmNON2IzbFlnQ3JJNngvajcwTHFqWDRDM1Q5WS91S0lxYzlnMjl0RXVC?=
 =?utf-8?B?WHNJNkhPUzVsMXVyR1NIazRGSXBVQVZqSVZseFZGdkNqeWNCZHUxZ2tGMTlJ?=
 =?utf-8?B?S3ZvMFIwQjd0bUxLNElKdHJ5UjNCK0hKR3NtMU10cGovbGhCQ3lNTzFod1I2?=
 =?utf-8?B?d2FoaDRMOTJpdHMvSm1XaVBqREhmM0NkOExzR3BaNHhIcWlRRkI4TzluNUpq?=
 =?utf-8?B?V0ZkMldmWWdxN3ZzODNaOUVBSDlMWHZxTm40V0Zjd2ZGYXJBWloxc0M1dTFt?=
 =?utf-8?B?MjcxUEpmVGFEdFVwZ1VjenNhUHdZanlvakhFMU85OU5McThvazZ3cnFmS2N3?=
 =?utf-8?B?Nlc0TlY3eFhpbW9nUUpHN2JRSkhxYnQ1MnNQMGM1WHNXRlprTVh5S0xqVEhN?=
 =?utf-8?B?am9DdGV3L1N0UGM5d3YzVnNOcENEL3h3REptZEZ1NEpzYmhZQ2hGSGUwWVZL?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E041FD04093CA4D9C7C50A05D6336DF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c82a4e2-bd8b-437b-1760-08dde15269d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 08:03:43.4601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E1+bTxEisQklCNwW/r/lCTmt8O8y5gEgqHoNJH35IQEu0RAR9RKT1YvJSI46GyujskrQTTr4HMoqaGSgx9ZV+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7565

T24gMjEuMDguMjUgMTI6MDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOC4yMDI1IDE0
OjI4LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IEZyb206IEx1Y2EgRmFuY2VsbHUgPGx1Y2Eu
ZmFuY2VsbHVAYXJtLmNvbT4NCj4+DQo+PiBJbiBkb20wbGVzcyBtb2RlLCB0aGVyZSBpcyBubyBk
b20wIHRoYXQgY2FuIGNhbGwgUENJIHBoeXNkZXYgb3BzIHRvDQo+PiByZWdpc3RlciBQQ0kgZGV2
aWNlcyB0byBpb21tdSwgc28gaXQgbmVlZHMgdG8gYmUgZG9uZSBieSBYZW4uDQo+PiBwY2lfYWRk
X2RldmljZSByZXF1aXJlcyBzb21lIGRlZmF1bHQgZG9tYWluLCB3ZSBkb24ndCBoYXZlIGh3ZG9t
LCBhbmQNCj4+IHRoZSBndWVzdHMgYXJlIG5vdCB5ZXQgY3JlYXRlZCBkdXJpbmcgdGhlIFBDSSBp
bml0IHBoYXNlLCBzbyB1c2UgZG9tX2lvDQo+PiBhcyBhIHRlbXBvcmFyeSBzZW50aW5lbCBiZWZv
cmUgZGV2aWNlcyBhcmUgYXNzaWduZWQgdG8gdGhlaXIgdGFyZ2V0DQo+PiBkb21haW5zLg0KPj4N
Cj4+IFJlbmFtZSBzZXR1cF9od2RvbV9wY2lfZGV2aWNlcyB0byBzZXR1cF9wY2lfZGV2aWNlcyBh
bmQgYWRkIGRvbTBsZXNzDQo+PiBoYW5kbGluZyB0byBpdC4NCj4+DQo+PiBJbiBwY2lfYWRkX2Rl
dmljZSB0aGVyZSBpcyBhIGNhbGwgdG8geHNtIHRoYXQgZG9lc24ndCBjb25zaWRlciB0aGUNCj4+
IHJlcXVlc3RlciBvZiB0aGUgZnVuY3Rpb24gdG8gYmUgWGVuIGl0c2VsZiwgc28gYWRkIGEgY2hl
Y2sgdG8gc2tpcA0KPj4gdGhlIGNhbGwgaWYgdGhlIG93bmVyIGRvbWFpbiBpcyBkb21faW8sIHNp
bmNlIGl0IG1lYW5zIHRoZSBjYWxsIGlzDQo+PiBjb21pbmcgZGlyZWN0bHkgZnJvbSBYZW4uDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29t
Pg0KPj4gU2lnbmVkLW9mZi1ieTogTXlreXRhIFBvdHVyYWkgPG15a3l0YV9wb3R1cmFpQGVwYW0u
Y29tPg0KPj4gLS0tDQo+PiAoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBlZmY1MWU1MDAyMWI3
NWY1YTUwNTMzZjdkZTY4MWIyY2UwNDRmNWJkIGZyb20NCj4+ICAgdGhlIGRvd25zdHJlYW0gYnJh
bmNoIHBvYy9wY2ktcGFzc3Rocm91Z2ggZnJvbQ0KPj4gICBodHRwczovL2dpdGxhYi5jb20veGVu
LXByb2plY3QvcGVvcGxlL2JtYXJxdWlzL3hlbi1hcm0tcG9jLmdpdA0KPj4NCj4+IHYxLT52MjoN
Cj4+ICogaW50ZWdyYXRlIGFkZF9kaXNjb3ZlcmVkX3BjaV9kZXZpY2VzIGludG8gZXhpc3Rpbmcg
cm91dGluZXMNCj4+ICogYmV0dGVyIGV4cGxhaW4gdGhlIG5lZWQgZm9yIGRvbV9pbw0KPiANCj4g
V2hhdCBJIGNvbnRpbnVlIHRvIG1pc3MgaXMgYW4gZXhwbGFuYXRpb24gb2Ygd2h5IGRldmljZXMg
Y2FuJ3QgZ28gdG8gdGhlaXINCj4gdWx0aW1hdGUgImRlc3RpbmF0aW9uIiBkb21haW4gcmlnaHQg
YXdheSAob25jZSB0aG9zZSBoYXZlIGJlZW4gY3JlYXRlZCksDQo+IGkuZS4gd2h5IHRoZSBkb21f
aW8gaW50ZXJtZWRpYXJ5IGlzIG5lY2Vzc2FyeSBpbiB0aGUgZmlyc3QgcGxhY2UuDQo+IA0KPiBK
YW4NCg0KSSd2ZSBkb25lIHNvbWUgdGVzdGluZyBhbmQgaW5kZWVkIGV2ZXJ5dGhpbmcgc2VlbXMg
dG8gd29yayBpZiB3ZSBjYWxsIA0KcGNpX2FkZF9kZXZpY2UgZGlyZWN0bHkgZHVyaW5nIGRvbWFp
biBjb25zdHJ1Y3Rpb24gaW5zdGVhZCBvZiANCnJlYXNzaWduaW5nIHRoZW0uIERvIHlvdSB0aGlu
ayB0aGlzIHdvdWxkIGJlIGEgYmV0dGVyIGFwcHJvYWNoPyBJZiBzbyANCnRoZW4gSSBndWVzcyB0
aGlzIHNlcmllcyBuZWVkcyB0byBiZSBkcm9wcGVkLCBhbmQgSSB3aWxsIHByZXBhcmUgYSBuZXcg
DQpvbmUgd2l0aCBkaXJlY3QgZGV2aWNlIGFzc2lnbm1lbnQgdG8gRG9tVXMuDQoNCi0tIA0KTXlr
eXRh

