Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90009C51D2C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 12:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159831.1488121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8cu-00069J-ND; Wed, 12 Nov 2025 11:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159831.1488121; Wed, 12 Nov 2025 11:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8cu-00067F-Ji; Wed, 12 Nov 2025 11:03:00 +0000
Received: by outflank-mailman (input) for mailman id 1159831;
 Wed, 12 Nov 2025 11:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0mN=5U=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJ8ct-000673-MR
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 11:02:59 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2581fc48-bfb7-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 12:02:58 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 CO1PR03MB5874.namprd03.prod.outlook.com (2603:10b6:303:9c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Wed, 12 Nov 2025 11:02:55 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 11:02:55 +0000
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
X-Inumbo-ID: 2581fc48-bfb7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ewm49zHvDlVZ1cODLVrARZCWucEacfDMH5XhVhHtGOBE4s1bomJup1zbEK340tvj/KjVWJtHlz4z1NDWxxU9gzXZ7PXBGQCuVDe9R6AkL3hs/HvLTwpB9sQswNZ5mWlHk6yyohZcq3Sn9fBnjJn6Pekf5V3jzZMfAniBJOmiTmH5S28crfbfB5i2V4v+rJqVmZW/tkj5CRA+39Aqjq1HgA4VGGdXaRxM1n42qgAZo3dNQoXQUQ28NuzJ/lrILbaekqB4R3IJ2sdqnoyHZ3/OLJZM+K+uDP0PZJ3DjYXCVTYHCPslaw0kSosb86gHh6H/S1krkopqRZIUfr/QoSNJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZiXP8Zepi5lNeaO9BfEkf0pA6E1xpycNBx/AuwO7pI=;
 b=EQqwoBsdEAIfpZSfmGaoamHtZmfUUskBKoDsUHWt2P2iWRG7k+V+miKSj9ekuYqP5eD3ED/EL0ycQA9BCYxeTdIPgQxBA+TdKccbHGjAnIZ8n2dgo8Z4Fy6d06pg77/0DywqhPUVCBCoKBJORY8C/fDCYjcsK8nhRDkZiA0Hp9ay1cmBKxDdXNB+b6JPavnkDrSmPp+Z+yAAuP8tiEK1cDiEC0hZRVd0iigO1VYwQmYngRAq/nED3ZbM43V1oEvkhwKrvO8Td1aKlDVegdOu930iM5La77Ly4u3TwyBfaB90Q0OXB3LLenP5l3O2rwNacwgNKtai1ul8/RKZRgWw6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZiXP8Zepi5lNeaO9BfEkf0pA6E1xpycNBx/AuwO7pI=;
 b=TYTh5FtGd4iI+dBLGYFipPoWQCZVs8ZPEs4NS1vslpYooY7ABy1w9Xi3d5FbiVJsPQ7RPKUJxvhIjDOkEvWTk3cngUMSw+yt6xBfIZJycpzkfW0AqN+07hwbJQ6VOSoXL4TN+pPK+INhNhUyBsJgY2kTnJwubXSpkAwSz2Z/fOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <746a6690-0fff-4b03-8f56-efa0ca84310d@citrix.com>
Date: Wed, 12 Nov 2025 11:02:50 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22] x86/hvm: Introduce force_x2apic flag
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
 <c1d2fece-02fe-4c3a-b08b-ac8525277787@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c1d2fece-02fe-4c3a-b08b-ac8525277787@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0416.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::20) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|CO1PR03MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f5b617-0caa-439d-6b91-08de21db07f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFdyTTJ1SW1WUUtiYWwzU1N2ZkU4c2VPV0dhUFBJbWZBTlhsQnpaaS95R1JN?=
 =?utf-8?B?SUF2TDJQYXliU21uaFFudVd0MW5uU0RKSSs3Vlo1dVZFaG1xcFZlQXlOeFlB?=
 =?utf-8?B?eHlkY2lyOHFQa2U1ZS9Hc3VKLzliRzdUeGptOVBFdWxsWVBLMWh5MitmMGdj?=
 =?utf-8?B?OVhIQU81SHpNZkM5ZlNXK0VDenJ5amRBOU5ZMjFLeFp5aXREVldUZTloNm1y?=
 =?utf-8?B?RWdoSDRybE9KZ3REL0kycEVQWlFrcU42MW5oblM1WkQzMHNuRFp0ZWNqQzdh?=
 =?utf-8?B?aEoxUkZsSm1UU1Y0Z3FZMFFFNDRnc0RFbStOWTFLUTl2NXhKbGYyQnI3anpM?=
 =?utf-8?B?NDREeFc2WnlUekhTZGVRQ1RCU2EwemVKSko3K0d1ZXg0WS9Ta3Y3TkdZeWYz?=
 =?utf-8?B?aHFZU2F1bEhlTmp6YTF1eUxaV01GalJHMEh4cHdSdWFKUXlKSXF6NUlDODVY?=
 =?utf-8?B?eitra2RyaldHbGxyQklFNUoycWtoN1U3NTdGYm5oVDJwUS9kbXk1SW12N09p?=
 =?utf-8?B?SUpCdkZlWGR2S3NGTHpTV09GdXlMTkFjZm14NGtkdjdxZWxDV0FzUkRUVzlW?=
 =?utf-8?B?WHE0MEdpQkZtMnZUbFpCSUhVcGs2azNVZXpLVkNMcUxkSkt2N0tJdDhtdHFh?=
 =?utf-8?B?Zis0bktVcENRRU0raUhnTURHVWdvRjRnSGkxYXFXTVBWVTVlcEFPS3BwZjg0?=
 =?utf-8?B?VHA2SDBES0prZmJjQ2dmZlErUkNER1RyVndHaGJFVDhNUUpjYlZWa1Q2Q1h3?=
 =?utf-8?B?WUlVUnpYZlFoSUJkNHZZbkJQK0hLTmYrYXoxb2pyc2xSd0tQQ2RrQTZNZlhi?=
 =?utf-8?B?OHZVU1EycG5pOFlpSStHYys4M05ac2N4Z3hORTJIKzNiVHMxdkN0ZDZMNEpa?=
 =?utf-8?B?ZFVsUG9vK0FKZThVNHBVYkpkTlc1aXZxRllMQVN1QkZPSkhvSlZGaTdyRXZS?=
 =?utf-8?B?VzNvUFpZdHgwanZXS05Wb3hic2FkY05BdDNhUWF5SS92TjRTcTBlOFdFd0pC?=
 =?utf-8?B?RkRtNU81TTcyeGRwUEVBa3NCOXVKT2hLR012TFF5T0UzenZsbEVMOTJLRlBL?=
 =?utf-8?B?bUFvZXBkcmw4cFVOYmFFczVzRytOT215MU1ReC92R3BwNVNyRDlvMFN4Q3Fz?=
 =?utf-8?B?TG03Y2dCaFVDWU16OWNOV3JlL1haN3JYdWRQbHJKNUV2MnFKWHcyVkpnWGtv?=
 =?utf-8?B?NXp6TDlhQ0ZwbTRUMC9vTXo4NHFVRWJEaGw4cEJIV3NDWVhmRTdRL0gzM3Zu?=
 =?utf-8?B?V1VHcCtaaUo0eWNuQ1ZRbmVZSUQvZk1KUmJvYUxpUFRVby82MU5xQk9YY3VP?=
 =?utf-8?B?Q3RUUU1NUmg2RUNLd3dCWS8yakhJZUVKRUFGbHcxeFJnakp3Mkh6a3Jpc0Rs?=
 =?utf-8?B?MWRya1pDdTA4MC9HbzhYZituWUFsNzI4WHpzM0hPbXhDZHlycXc5Y2U2THoy?=
 =?utf-8?B?MnRiR3ZoZVJMZWNrVXFuNU9wNlRKVzRZdGI4Y0VXYTRuanhUYnhkYUg3L2Jl?=
 =?utf-8?B?aWxHRzdBYndhMzA2WTNTeW5peHFoYlZtaFJCWW9iUVc5aTR2ck5sazF6R20z?=
 =?utf-8?B?eGxPSThPUUxYR1hMNFh5c2plVTh1VUJaM2pTRzROblZldlErMjc1RzBOU2FS?=
 =?utf-8?B?REtkenJXTUhpNVdrV3JjTVA4c3k4ZGplR1dDRkRhakNtaWN1ZXVvcGFZTWll?=
 =?utf-8?B?WS9aVElURnk2Sm9kZ1FaTDBxY3pHUTlUWC91OUZKU3pFZnJKNGJ4dEdVam5s?=
 =?utf-8?B?Z1BDVzVSdVZ5YmFySWtpZzlZMk9UblNieGR4OHB6Uk1KSTV1TzY2aU1iT2NV?=
 =?utf-8?B?Mm0wQVAxWmk0TWNLTFRSbUZJY2ppckNENzM1MHQ1eE9GSEIvNVlxTkxlNkJL?=
 =?utf-8?B?OFlYRENUeXRBYzJ2WGJzWUhLMXEzSlRvY1p4MzQrTlVhK1hRcXlIUWNkNURC?=
 =?utf-8?Q?PteX2pZAo/6oP9gHspNuz+1kbjWcD49Q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2daU2VZSFFNaklpSVBOdXFUNXM0TjlYSWdYUkUxMXJNT1ZmYkd5N1Fub2Vx?=
 =?utf-8?B?bzlGaUdoZmpOOXRtUmNFbDE4RFFMSnZPeEZveWMxRmJUeDdDUllZeDZZcVUx?=
 =?utf-8?B?S1pFRXRYKzFLVm00c3oyZjdkay83YkVDaDVHYnR2WmxMQnpPSVJVQ1FsQk85?=
 =?utf-8?B?R2tpb1V6SFEwaGpRWG1aS3c4b2t6UlI3VnB0TG5mZ2Z1VmhzcWFNVFNURVY1?=
 =?utf-8?B?dG5UU004eDBLZHQ0ckYxVjJIcFBpUzUxOU1QMzNHSWp4b3BaNkFOcFRCODhr?=
 =?utf-8?B?bEZqUVNOVklZSWhMZ3lnNEV0Tk42d293dUFKUnAvRVN4U3ljczZaTFdQcXlh?=
 =?utf-8?B?WE1OWFVheC9maVdxQnR1T1hPZUJ4bi96VnBCamI2REZtaWZHR1dOYUJQNEhD?=
 =?utf-8?B?ZzErSG8yM2huZVFhVDB6QlBFN1BvS3UrdktwQnk1YjZ2NGx5OHZRekVaVEZ1?=
 =?utf-8?B?UGIzMlFkcTlXMzRHT3kySXZnMEVBOWhIdTdGbnJyQ3pFa2s2Y0o1Z2JReFh5?=
 =?utf-8?B?RTdvT0hUeW5hOVFrOGhwNS9QWmd5dXlpQWZZY1ZLNEVwYnVhQWMwK3lCUFJE?=
 =?utf-8?B?UzhDS1lHd1ZNUklMY09hOTJYT2hIT29FS1doZklyUFVlM0p5RVkvMlAxNFRC?=
 =?utf-8?B?TUJUTU01Ly9HOEhhMktpRHN5cys5WlRaejhOQ0E5NlMrSGZvS0ZneklxVDhh?=
 =?utf-8?B?MkFYa3NjOFNXaFhKVEJDS0hvRTV6MWpOOXpjVTRLdXNsRUxFVTRoQjdRbDlu?=
 =?utf-8?B?TnBJTklSTjdiZnhWTlVUb3M5Q1ZOY3V5SkFOMSs5QmFoMVo1UFk1LzVySGdh?=
 =?utf-8?B?ZE5sQ1lPTTdETkF0WnFJY0ZoMGk2cDM2Q24rdVorVjhjbUpwTGpVemNzaU92?=
 =?utf-8?B?RXRacHpVdE9wOW9YTGhkSEQ2ayttKzVnUE4zMmdGZHlyeEs4MXpBdVFOWG81?=
 =?utf-8?B?aVh2NUZaV3JqaUt2VFN5eVViMW5PUzl3YzZ4UDQrSWFDcWhHOUVTUmZkSklG?=
 =?utf-8?B?amVVejM1aXVuSzQrUFoxN3cvWHFXc3M1anNKOHZuNTRiUElRU09wM0RQaEdJ?=
 =?utf-8?B?WHc5UDRieUxlckZJUG50T3lqd1d4NEhPSVFjekNEOVg5WnR1dEZvTDJpMTcz?=
 =?utf-8?B?ZGVnWldjbmU0TmtrWWdWaHM3Wlc1Z1lMaldZWWV1R01zN3ljRWpWQlBqd2lY?=
 =?utf-8?B?RkdwQmNacW1GU0ZyOGN6MCs5cU91WUlQdkpsZDZqT01IcXYyVitZRUgyUDhi?=
 =?utf-8?B?Wmx4dDBwTUcyWW5pdCsrVkdmTWtEejFpd1QzRmJzeVN5VUx3Q0hBRjZrSWEy?=
 =?utf-8?B?Q1MzZTlzc2NDcm5jdmUweFF1d3FUbFJNQmJDS3c4M21qTUhCVm9NdndqQlR5?=
 =?utf-8?B?S2g3cE9MUjg1VXJYMXNGRU9IZ0J3R1dCaWp6a2RBVUVMdHE0RmtmVE1RZ2Iz?=
 =?utf-8?B?K2J2SVNsMEFPMGN6bmltWEZVMGlSVmJZTDZGK0FIaWx6MmVRTzVNRDJMVlUv?=
 =?utf-8?B?Qnh2amszcmFZWWV6THFYeWVVampHVVN1bTdDeUl1Y094NFMvNzVvN2tpVkF4?=
 =?utf-8?B?ajZsdTFlbDRkd2tSZXZFQTBYU1ZabGU0L25FelY1MUw0V2FaS0JNbXlWci9D?=
 =?utf-8?B?cncxMmFSK2dlS0RiU3huSU9WRS80SmIvZ01xK3RxOUNsY2wzR05BZGJERUxB?=
 =?utf-8?B?ZFozSjFFU1AyRE9QaGlyYUk1RGZFelFHOVNGMkNyZ0czem94MGxsY2VCTjE5?=
 =?utf-8?B?cGNMalpVNjJoaXpyTEpOcllLNDBrdGNYaWtRbFRuNGRFeU9FYmgvbWhSdG4z?=
 =?utf-8?B?cW5aV01mWDFqc3dXNndUck9ha0J3K0VqVjVJam1LZU5LYXlJUkZTdUxkbWcr?=
 =?utf-8?B?SEVWUFAySnExUnlJMmF4ZmIwb21oL0hxUmU3Q1VKTjFMajA4UEwycFlMbWZl?=
 =?utf-8?B?SVVvNCtzb1h2WjRmVGFzWjlyRWxXbjVlTng1emRyQlJrV0FKRTdiT2ZEQW9v?=
 =?utf-8?B?WFl1OVBkY1dvQXlGOFBkMG4rYnN3VTNZSnBRdVRiVmhnOGtaRXNpYnZScGEy?=
 =?utf-8?B?dDhpOGVCMnpBWjgwblhqWjZzVWNMU0VINzhVSGZIS1FDTHl3Uno0QVNRWnlq?=
 =?utf-8?B?QnhxUWhpSS95bVdUN1FFbWx6MUl6ZkRwVEMrYXBHMWFxMG5HWS9ubzk1cWhF?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f5b617-0caa-439d-6b91-08de21db07f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 11:02:55.1118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gG5lZ0VSU+Vyy2JypKL7dW9MLNpx5u98mU9DxZCjkxxFkZ6wBbTgKUKcMr++VXWfsWLQdLAPQyvrrLGaN7ZoWjxIxlseiH6qBk8C4d2lPDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5874

On 12/11/2025 10:35 am, Teddy Astie wrote:
> Le 29/10/2025 à 19:26, Teddy Astie a écrit :
>> Introduce a new flag to force the x2APIC enabled and preventing a
>> guest from switching back LAPIC to xAPIC mode.
>>
>> The semantics of this mode are based IA32_XAPIC_DISABLE_STATUS
>> architectural MSR of Intel specification.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> This feature can be useful for various reasons, starting with SEV as
>> it is complicated (especially with SEV-ES) to handle MMIO, and legacy
>> xAPIC is one thing that needs MMIO intercepts (and Linux uses it during
>> boot unless x2APIC is initially enabled, even if it switches to
>> x2apic afterward). It could also be interesting to reduce the attack
>> surface of the hypervisor (by only exposing x2apic to the guest).
>>
>> As it can allow to have MMIO-less guest (using PVH), perhaps it can
>> be enough for avoiding the problematic cases of virtualized INVLPGB
>> (when we have it).
>>
>> In my testing, Linux, FreeBSD and PV-shim works fine with it; OVMF
>> freezes for some reason, NetBSD doesn't support it (no x2apic support
>> as Xen guest). HVM BIOS gets stuck at SeaBIOS as it expects booting
>> with xAPIC.
>>
>> On Intel platforms, it would be better to expose the
>> IA32_XAPIC_DISABLE_STATUS architectural MSR to advertise this to
>> guest, but it's non-trivial as it needs to be properly exposed
>> through IA32_ARCH_CAPABILITIES which is currently passed-through.
>>
>>   docs/man/xl.cfg.5.pod.in              |  7 +++++++
>>   tools/libs/light/libxl_types.idl      |  1 +
>>   tools/libs/light/libxl_x86.c          |  4 ++++
>>   tools/xl/xl_parse.c                   |  1 +
>>   xen/arch/x86/domain.c                 |  2 +-
>>   xen/arch/x86/hvm/hvm.c                |  2 ++
>>   xen/arch/x86/hvm/vlapic.c             | 23 ++++++++++++++++++++++-
>>   xen/arch/x86/include/asm/domain.h     |  2 ++
>>   xen/arch/x86/include/asm/hvm/domain.h |  3 +++
>>   xen/include/public/arch-x86/xen.h     | 12 +++++++++++-
>>   10 files changed, 54 insertions(+), 3 deletions(-)
>>
> I guess for now, it would be preferable overall to :
> - just add a way to enable it by default, not lock in it in x2apic mode
> - the ability to lock it down (i.e disable xAPIC at compile time) could 
> be introduced separately
>
> I'm not completely decided on the naming of the option, maybe something 
> like :
> x2apic_mode = <default> | <pre_enable> (or just enable ?)
>
> `default` will keep the current behavior, or force x2apic if xAPIC is 
> disabled at compile time; `pre_enable` will enable it by default, but OS 
> may be able to go back to xAPIC mode if supported.

You don't need any new hypercalls.  Just set the state correctly in a
LAPIC record in libxg's vcpu_hvm().

~Andrew

