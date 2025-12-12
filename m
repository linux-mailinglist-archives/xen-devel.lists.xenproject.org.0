Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45454CB9DDE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 22:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185834.1507794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUAUK-0000sj-NO; Fri, 12 Dec 2025 21:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185834.1507794; Fri, 12 Dec 2025 21:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUAUK-0000pv-Jn; Fri, 12 Dec 2025 21:15:44 +0000
Received: by outflank-mailman (input) for mailman id 1185834;
 Fri, 12 Dec 2025 21:15:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRu3=6S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vUAUJ-0000pp-He
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 21:15:43 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5e78f0e-d79f-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 22:15:42 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7528.namprd03.prod.outlook.com (2603:10b6:a03:556::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 21:15:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 21:15:37 +0000
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
X-Inumbo-ID: b5e78f0e-d79f-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K25BhInNeNgBelBb28XZr2693MOT3aICgPrIjYoSORPflIoqw7qr7R4ChqA/0lOFsdgP5EZPifi+15X0yDHzzVnuTPj+OFB37FqyfA1e9ugfFFRLbub4OrO0s6JKUZhD4pvsSQPXlsKtB9BK1FEHMwOvztvoH+gtaKP0ui8/sam9K24emALCESUT1fxQchSSdYX6LioIh3lxGBoRCVhtzwVgvwOBr8QtiVLVzUfa9xoYL6IzCI4Atj/K7PA9m8I81H+/JHhGhGdhCP4DPj4AQxDdjBGGjwL5lQ4OM3mKosq+LSBrRx06qWqA7G/zDsrBKTO2kisrpg6nhcJLrOvs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFH4s3tUUxz4h9SeXgeyUMc4m57oNKgi5cUchcLDEbw=;
 b=FNxqSgjgAD5NP2RRYjX5FdmC5Vfkg+D2JKHpz3mq5HjhGO/j22WoBnZCvu3ljz0+qmGDQfcxcyOoKX9RTmsP0/uaZ4oilc2APaEBqqbcxDI2hhXjx4aulRdUVzh1eUXclaI5mu5Ke9fEhluOdFMV7AHdtfI3/NR3y92Ktsco4bkOmpBrN4Y8kEZ9JsI+ryYQyDlBMlY28nojqf102WWpQRygVrq8zzV5WRFhcqmuXCfxFcaU6sudvSfJN3paoPsJqFiB/vfpVQUEI8IDKHIBY1Bw3VsV1v/81xLV1p/dBKO+pTlMBb9XnOlvearfrIsgWWwuRNicdSxOhqhdgt99hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFH4s3tUUxz4h9SeXgeyUMc4m57oNKgi5cUchcLDEbw=;
 b=FJxxvW7WiHtPE867/ut9ViC9kR0QN2prODEp+1JsjgrJn9vDA8WeGHgZJTd64eS2oNAlN02UL2rATW8IAV1BbkgmZT4gprJerwDsr3hl+/xZtKFJxMMbFtPktM9N0nZjc8oAHK3vB3vZfdeLpIU26cxB3T8igENKC9ECdQ75QU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f79a31b6-9153-47c1-b1c9-21f5aa5c5a8f@citrix.com>
Date: Fri, 12 Dec 2025 21:15:34 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 02/12] Switch Linux builds to use Alpine 3.22 container
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
 <b1d58190ac7e2b65f80542685191944b83338960.1764866136.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b1d58190ac7e2b65f80542685191944b83338960.1764866136.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0518.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c870a1-2bea-4951-4285-08de39c398a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHI5MGFGUGwxZTA1QlJZb245WVNpSXZDTjY5RzFuUHRNajVFT01yVlBpYlhw?=
 =?utf-8?B?UmZmbmxodE1PTjU0dzVBOHd4bkZqVU4yRzJYeDFtZ24yUmE4MEJQR2hnelUx?=
 =?utf-8?B?S0g4UHNVN3o0UzIxMDNzbnR3Um9JYUZicUpsRlpiRlJ1NU94WEdxTVp5Qmo0?=
 =?utf-8?B?Sm8wS1dVOE9ZMFhGcGFIbnJ0VHBKS050SVQ5K1hBKzdCK29LZUVENTkvNFd0?=
 =?utf-8?B?Mm5hd1hOVHdVcHlTUG5ocHZqVWFjQ3h1VmVNTDE2bCtuKzJHYzZLSSsvR0Q5?=
 =?utf-8?B?RTJPV29abmVEMDFjcjBQYng3VnIvOFY1QVltZEc2VU0vZ0J4WWVJdjIwekFD?=
 =?utf-8?B?UE9MM3VCNHdxc043TER5a0dKMzhOQXQrWERBYmxJVGVLMk5EcEorN1Irdm42?=
 =?utf-8?B?QnloYnc3d2xyR2VjMnE1d0RQeW5yM1NLOUYvd05LMWhEK091MHlrRFVxdVZr?=
 =?utf-8?B?ZGJzSlFoblFNS01ocnFPS3kwNVZkZW9KUmI0L1VFcWhIWENzK0pnOXZEamZx?=
 =?utf-8?B?Sm1GMW5WT0RtLzQ2U1BoSVVDTVhYS0Y3NXAyNVZvTS9lMnFUYURXUytSN2Rj?=
 =?utf-8?B?MDR1L3U2NjF5dWsyelFtQlZqdnI1Wk1McHlDem9md0VjTEJWV3kwWXpNcUZI?=
 =?utf-8?B?RXdpU0dXTnluWmtkdGRGOTNQUG5NaDJsWmZsNDYzSjRMOHR6bTRjVEVlNTVJ?=
 =?utf-8?B?S1ZNb2g0VkhFWTA1emc2aC9FNXQyOWtCaWxVekJmbi9ibWhuU2N3RlVxb3Fy?=
 =?utf-8?B?dzlpbUc2UWVML29JV2IvalVCRUxDYlJoNVIzU3E3YzBsNHlmL3V6YVhZanpO?=
 =?utf-8?B?eWJUeEl2ekgxRGo5bFN3ODJTY3d2MjJJWDhzVHkzNFhMUnkwREI4UGFtcGI3?=
 =?utf-8?B?WG1pT3B2UTFZczRxR2JCcXVMRDdtUWhONDg0aE51N2JqNDFsK3J4OENENkwx?=
 =?utf-8?B?MEV2UDdsbWdqaGZzaWtDbXdsMkc1Y2FaUG5hck9xcTk0MElpLzBaY0tFM3VG?=
 =?utf-8?B?WXY1VC84QVFBdysyNjRpMTkvL0FISmZ3d0s5YU5GcnpKMUEybWREMW5pZ0Ew?=
 =?utf-8?B?bmc2TUVhMUFpNTNYaEJpYUNQQ2lENzdTUjRqN3FjcjJJQ0JYbzdKZk9Xb3BW?=
 =?utf-8?B?TC9iV2ljKy9YV1Z4NkZseXVyRHExaVJYakRHK0cweGJGcjlwdHpGbUcxTnlB?=
 =?utf-8?B?ektQZWU4VWdmVzdJVVhhY0NRZVRwSGVaTzN2a0VNVTEvMklhTzZhdU4rMzNU?=
 =?utf-8?B?QmtZdU1sRVJpVmVJQUxQa2l3OUpQL2pQeDB2YXRMRmxkditqNDJVdUNCdENm?=
 =?utf-8?B?dGNqMUxnTVFnZFZmSGpud05ORkVzbDhQTlY5ait1NW9xbllDeElEenErN085?=
 =?utf-8?B?d3pTUkhTbmUwdkczb3cxQW1vUUk0SndyTGJKV0luM3Robi8razExVEdnLzdI?=
 =?utf-8?B?V3YvV0Y5ajJwakpEcFl5VWltWjMxYXhaV0JJOFptWmg4WEJBRm4vd0lMNDky?=
 =?utf-8?B?L2dhY3Y3OHMzZUlBSHJ4VW9Hd3RsN3RUdXpNWWE1aVhYZ1VxcFRORUtNczNp?=
 =?utf-8?B?ZmxyNU52MVg1Rm1KNmVEdUtPUW5IcDZJVG8wdEEwU0VwZGptd2M1QUNNaVg0?=
 =?utf-8?B?SzBadUFpNUdhR3JOQmxmdVhoZGhTM1FNR0publlLYXp1Sk9INy9OYkIzUkFS?=
 =?utf-8?B?czdHRmNhWlFCc2k5VXNkUDdVdFZCejZBRlFBbUxPbEF5dHZJMUIvTXNyY3Iw?=
 =?utf-8?B?WTkxK3RiZEx3cVJ3SitPQ2UxU0g4ZkpzRWxROXlLQ2Jza2NvVnBIN3I3cko4?=
 =?utf-8?B?cXZOZU1qVDJ2SE9iUjc5MEFXVzdpWFZKQ25GSEFEai9BMlptMm1yU0N4THRn?=
 =?utf-8?B?WmRhRGJBOE4xQTBOSFZQTkVpNEIrT0Rla2VMU0gwVVdnY0NFQnU4K3kyRkI1?=
 =?utf-8?Q?flM48WpQa6egUNVcTMkv+GHBKV+4aPLa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkMwbUpGNk41akZzdHhscjRRaXZxUEh1eEc4SWl3L1NVenV4bmRJeUp0KzYy?=
 =?utf-8?B?U2s1K2JLMGR0aERGUG9iMGZRYm1HMG9jWE53Zlhocmt4eVdnOCtXOStBZXhP?=
 =?utf-8?B?NTdaMDRwQlJMQU80YjdxdHRsNXVFUm53ZXN3TTdiTnQ2RXEwOWtBeDdRWloy?=
 =?utf-8?B?Um16T1hvM1AyVWFSdlY4cGhXMWRnaldHbzNZRmkvYTgwOFVvdjVtdHBOQ2xE?=
 =?utf-8?B?RFJmSzZ0SnpBY0lqYnpsN0k2WWgxbFE5VU5lZXVhY25JNTVsbHFuVXFVUjlx?=
 =?utf-8?B?Y1BLNFA4clBFTmUzUXRjS09YOGhUUzVIdUR6ak01UmdmZ20wTXNsNnpRY2RZ?=
 =?utf-8?B?TGhRa3RWY1VGOXlOdFJVVlh2WUdJR3J2N3YrS1BDNGxUeFh3U2s3WVdwV0Fv?=
 =?utf-8?B?WHEzd2xucENRUXN0RjduSVVPd0g5Zkc5UGxWM29SUHN5WHBVZkE1cjBvc0wx?=
 =?utf-8?B?a0pvbG1Wb3BIL2w2YUp3WUFUc1FrZ3d6K1F1Z3lWS0l1MHVhWm9mZE1iekRi?=
 =?utf-8?B?MStKaW9FR2gzY1EyV2RoYWVQRENDajVQOWdrMmVQWEswK0M2cFhReHJpclJi?=
 =?utf-8?B?ZExPVHFmMmcvZVkrT0dzTHpRbzBvNCsxaHlnZWJxM3I1M3NmcG5MeEFjVkJm?=
 =?utf-8?B?VVRHTVNma25GUW5xK244aXdUMGtRaXhYKzkxbXQyTVdVVHlZZi8wNlZPenNw?=
 =?utf-8?B?Q2Q2VGprUHh1SlFBRitBWlZiT3RHU08zRnVWSkljbjRITzU5SDNXZG44c2FK?=
 =?utf-8?B?NWFMNTRTVDNmSGZyOGFDckFIcytXUGgyTWNaVnEvVHFmeWdYWFpqdkRDZkhX?=
 =?utf-8?B?cFB6L0hjNmk5MlpWNnJ5WG1EcTJXL09XVC9aVS9qOGJ1Ym1kWVh5V3hFczVB?=
 =?utf-8?B?dEd2bkxFdUNhMEV1R1VLRW1OTmJRaFA2YUVIV2hIb1lMRTQyeEdDeDJWOVVo?=
 =?utf-8?B?YjJyQWM1S3EydmtOQ1JzYXZ6RnpoY0krSTZnZDB3WkhkUkorQWNsYWlwbG11?=
 =?utf-8?B?MU9abHVLZVcyYjZRMFltd1JjOUVwZlhheC9pQlZjM3YvbXpWL1YyaE43Q21R?=
 =?utf-8?B?RFgwL1NidlZEWVVzSms5MUh5czV6VmREZWw1M2xPdVZNQXMrM2w3aWV3ZlR2?=
 =?utf-8?B?VE9IUnlkSzd5Vmp1bDltMGxPNHFZaVZ1VENIR0ZBUE5xeHN5UDZ0QWFiL1RJ?=
 =?utf-8?B?R2N2eVdEbmZNd0RVaERWUVplYUhTWmQ1QUhzTDhIanQ3WXZzRmV3VkttZGxH?=
 =?utf-8?B?cWFwUDBidTlkcStPNm1WKzRSZGQzMUpxd05iYkV2V1VFRTZQVXpIMldHUWpV?=
 =?utf-8?B?SlFkWWNHV3FVcXN3V3V3ZnQ2U01OSkI5RlNnTnd1Z1d1NnBkNng3VDl5QkNn?=
 =?utf-8?B?NWdTSzE2dUYwU21EVEgyY1FGQ0RsV2tROC9sdnRrcVo0cTA0c3V2UCt0Nisz?=
 =?utf-8?B?MDB3eHpSVUhpSlRweWlnOFBpdjRMdHNIS01rTGU4czZralA3SDQyVFBVTWFF?=
 =?utf-8?B?UjhaMjVJQ0pPNE5oRk5ROS8yU0FmaHFSZXFMOXV2WWRSK29ZdjRpZVJoVXUr?=
 =?utf-8?B?NjdxTnJvSmZGRCtFcmFoWkFORmJoYzN2ZUFiS2RoNkNNVnl2TzRsMmNwZmJN?=
 =?utf-8?B?aklLNGlWQ3F1OFRqN1ZLK1F6MmdzSzd4UVhmQVc4Z3RmbXVPSUtmajR4RGJy?=
 =?utf-8?B?aUFnS2FKaDZFTDdaSGRVcktYazRIdHR4aEx1SFNVdWlBc0dxaTYxYjZLbDNw?=
 =?utf-8?B?NzVpWWppbFJUSkVUanlhNUhBWDZQd2hiQ01LTXhRMFJReHNuY3BDSGZZTkVF?=
 =?utf-8?B?c3cwTjJReXoxQ1E4R1ZWMW8vN0J2SDd0VGVocmxjUi96b05QZVM5dk5Xa1NO?=
 =?utf-8?B?NHZ1bVFlS1VzN2ZwZVBQK0NJdk9JajZqd0hGOEgxbWVxc3NIcnMrVUFWOW1m?=
 =?utf-8?B?MXczRmNGamNvRExqVFR6Q1FHNFQrRzI5SnFlU0hpNGFEM214NExzR0xxaGtE?=
 =?utf-8?B?bGJmUU9IcmhaK3dZK1VUSzBFTHZURXFTTkJpM1pOZktmMTFhTU9KeU8xL0Vx?=
 =?utf-8?B?QkFORzNWenhpSmszWnBudUorWlNuSFRyb0cyWUpWSzRLL2JZcVpFV0Nrc2FZ?=
 =?utf-8?B?Qk1XRENzYlI4dXl0VkxZeXlud05la0xuTGlFWHNoRVRxR2ZYbVBjOXduQ1Zl?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c870a1-2bea-4951-4285-08de39c398a8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 21:15:37.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeYwJBfjnist6eJBI2P3HIwn816KJsMT9g4KYVudG4dUZerjcEdWn/C5zQPnnyA+6RwmKKYr3WGYQ2/cVNMGaDrz3jBVMry54Jf+Fqillbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7528

On 04/12/2025 4:37 pm, Marek Marczykowski-Górecki wrote:
> Slowly phase out 3.18 one.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  .gitlab-ci.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 17d25ce..36622c7 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -21,14 +21,14 @@ stages:
>    tags:
>      - arm64
>    variables:
> -    CONTAINER: alpine:3.18-arm64-build
> +    CONTAINER: alpine:3.22-arm64-build
>  
>  .x86_64-artifacts:
>    extends: .artifacts
>    tags:
>      - x86_64
>    variables:
> -    CONTAINER: alpine:3.18-x86_64-build
> +    CONTAINER: alpine:3.22-x86_64-build
>  
>  #
>  # ARM64 artifacts

Just to double check.  This should be safe because it gets us a newer
build environment for Linux, but the resulting kernel and modules are
not tied the alpine runtime.

i.e. I can commit this to test-artefacts and it won't break Xen's CI ?

~Andrew

