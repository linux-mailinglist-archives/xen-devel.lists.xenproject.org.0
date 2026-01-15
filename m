Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B36D22140
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 03:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204054.1518912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgCfq-0002Kh-V6; Thu, 15 Jan 2026 02:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204054.1518912; Thu, 15 Jan 2026 02:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgCfq-0002I5-SK; Thu, 15 Jan 2026 02:01:22 +0000
Received: by outflank-mailman (input) for mailman id 1204054;
 Thu, 15 Jan 2026 02:01:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZ5x=7U=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vgCfp-0002Hr-Az
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 02:01:21 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14705527-f1b6-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 03:01:19 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7585.namprd03.prod.outlook.com (2603:10b6:408:28c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 02:01:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 02:01:15 +0000
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
X-Inumbo-ID: 14705527-f1b6-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKJFU2ziGrVjaEkA8pRqoHZE4UMiwwprb0RDUqWoQSPqCghkEvKb6829VasSJuvWRXVdpj1Mqclr6ylyF/u4S6zuYo0e0OkiR76udhlHXeIvrGcNzkbGOk8cWbIfh5QUL5qVvAETT/sdM/R5jHcr7o2KA/0j5I8T184UnwLWFMNutmeQWgostnrjqaq0sD8BlpdyFctSbqzoajleGiftbPeF3xvTwIoR/GiZREPP54BTKgmqrVDQe3zxv2GG5qdBomDlyXgZ3lPs3BANedXelzegJTX5KvVzk7ZNaCp8DAJdd2InrDHi9kdlFkt7/WmhswQcsMNx+5AIGl5smbHqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AP3ozEoHItsDE7xlRQ632Iews+ktvhqzJRFlIiG1kfo=;
 b=pG6MlVLRaYa5kqLAYMT6xLdGkRUnDvU95ITR2znz2WsuR2emn/RQnWBgMQ/ZVRYwUZGh9QtEfk3aYqu8U9OEy+gujENnnTZ8HSNMPu2HDjoFBiDiUvhhvkio4Np8ABOJK1D325s9Jiq6A60mOWHd9ZI4V9rGn8khtmOR6UjbPnKt/fU5bL2WiIqO+MxXtd0CzaFjE5EqJHtJysu7onw4Dv/8YZXD6vcnNlImCMx5C795aPHseHuOIc9tggao9fgYlFec+HuQN1MOncX38ybcSJFfULnxmR2LBtKrnetg/x3b7bBWeTVxD8pfXoY7FLjawsLGESdKnix1fqXztjG/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AP3ozEoHItsDE7xlRQ632Iews+ktvhqzJRFlIiG1kfo=;
 b=LDEZqmq4GSBX8D4oyPz6lWir+IFykkxwK1iLSuyXPRkpmMNG0lCh07g3u59DXRgD4DUcQDfD7o1pppeB7nLENztqdtcO1kYnPRPHX/f6Nsnr125+x9TqGTQ99lgezWHjG9Z9USZdQuP2ZcvDiNBSnlJrKLto2bj/bckwyaRNm0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <95e0e0fb-2978-4c87-b723-fb7c30f36883@citrix.com>
Date: Thu, 15 Jan 2026 02:01:12 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alejandro Vallejo <Alejandro.GarciaVallejo@amd.com>
Subject: Re: [XEN PATCH v1 1/1] x86/vlapic: match broadcasts for logical
 destination mode
To: Victor Lira <victorm.lira@amd.com>, xen-devel@lists.xenproject.org
References: <20260114235548.626696-1-victorm.lira@amd.com>
 <20260114235548.626696-2-victorm.lira@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260114235548.626696-2-victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0614.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: daf1c36f-afed-4779-81fe-08de53d9f75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVdycXd4L1o1aXplRVR6RUNFWGdENU0yc3R2aGJ2U2JJY2UzNkhGeUlZU295?=
 =?utf-8?B?d2hqNnV0LzBqN0dBeUZTKzZtbEN5d0NxZFlQM3RRdFA3QTZqaVJqQ3RSa01T?=
 =?utf-8?B?ZWhhQ2JmbUhGblNyM3N3NVhoWElQS2RYaVlDRHJ0ek4yZ2JmMWlIblp0T2Ji?=
 =?utf-8?B?dmZobmhJTnRGTFZTdVlvUVU1NkhNMW0rZ2g0b3o3a2xEaWJLRTh1SjdFWEl4?=
 =?utf-8?B?V0UvQXFnenRoejlHWlZ3Mk5sVXhoUFhxOVp6ejQwRE41RmpheUt0NFRZVE9Q?=
 =?utf-8?B?QXE0aDlLUWRLVzJTOXVRUFdZWlROS0oyaE5XdWpGRmx3RGhXZ2ZUOGF0RDh6?=
 =?utf-8?B?MWRERUtmd1lnaHJuTnRySlltRkxrVTB5NjdRZWo0eHpuUjgyVnMvcCtZMWVJ?=
 =?utf-8?B?b1hIZFJ3VnUreVJ2aTA0aksweE12ZS9WQWxvZU1qQTk1eHBPUlQzbHZHWVpG?=
 =?utf-8?B?cGdrOVh6NkRxVXMvdWNpdjRKZ3Jvbzd3OFdKY3ErVmtOTXYwY2c3TFVNb1d4?=
 =?utf-8?B?cEdFYjY1eEMvR0d4NlVWQ1Z0YkpoQXZRd1pvbytLZldtTWdmb1dGd1g0eGdN?=
 =?utf-8?B?K0l5bmJqTkRRMzk4b29HU0I4VmFtaGJJdjR2MU5YVEZWTzQyWUgxdXY5YjNk?=
 =?utf-8?B?azh3NmFOK0tiMGtaaXg4aVlodkVCdUJBOFliQ0trRmxKT3kwTnh6cTBuRDU4?=
 =?utf-8?B?ZkRKd0hhS0t0V28vcGN0dkI3T2kzODJqOG1LWUhhY3p6SmQwQktJZnlvWkJx?=
 =?utf-8?B?TlIyQmw0RGRHUWdtM3M1Yk14aE0wdXo3a0pGTkt4aFdDdVZoYmRxODBjV1Js?=
 =?utf-8?B?di83eExFeDVCVHovUG9obWhVK05hZlFVQzFJZzFHaDZIN25UZ3hWb3A4TkhW?=
 =?utf-8?B?cjhxWnM3SGk3am43RWRXcFgwY1F2UUpPV2lwM3VmS05CRFU5QnRDOC9qaVhR?=
 =?utf-8?B?YmRFZEVBRlBWZHVrNU5UNktEU3UvNlZ6ZHNVYkpvUnJDUGlOaDk5d0xTTEEx?=
 =?utf-8?B?YlJTV3h2eGJQV2hLOWk4L0xpSkV0TS9iTG9TV3A5cnprb0dSZkNlT2F0V1E4?=
 =?utf-8?B?Y0pwMFRpQXJwM0RxdEJHVStHNmgwVzlnZTZuTWFRT2dyazlMTVZCbFF5Mllr?=
 =?utf-8?B?Q2dVODR1UmhkQUxRVnk0V2dVSjBQdGp0Nk9nRVo3aXdmaWF5ZUovcFNMTi93?=
 =?utf-8?B?Zzg1VldJZk9oaERJTVVUcTRHZHY3ZktDUzVGWHVPZVdPZUtuOEFyTlpxVEtj?=
 =?utf-8?B?NzgrWldwUDVTZ1RDSzNKSUtGUXhxMmREMUJXUnlpdXM1QzgvcDJjUGxneVZI?=
 =?utf-8?B?UVlUU3lMQXFjZWZnV0huZndOQ3BCbm5GczBjc1FURUJBWi9TaFNYRDEwb0FI?=
 =?utf-8?B?N2YxUDJOY2VoR3JpNDhGV3NnUWFMTUpEa253RlpjbDdoNTdxOE9DYjJUaWV0?=
 =?utf-8?B?NEVPVnAwdE42NHcra1VkTFpvWmdzUzZtTVd5L005bCtFZWhlV2xHaTVyak01?=
 =?utf-8?B?MDdWZ1NOREREOGloR09mVmNHcTRjMUVOa0xlM25oMFZ2dnUyZkNQR1FzK2wx?=
 =?utf-8?B?SzNVMnBrQXd1cFE2ZWZ6bXN3emJzbS9VcU5kcEd6UzhxWHpMMHZ2QjIrWk9n?=
 =?utf-8?B?TXVlNnBqeHFreWRYR3V5bTI2R3NzL1BONmhIbzdoMjdhSVhIcmJwY0UvcHpz?=
 =?utf-8?B?R29aWFVHejUzcURQbkR2US8rR1BKV05NbTFXSFV1Ti9OVXlqWW5MRnBidGlH?=
 =?utf-8?B?MVNFeHozY2xUQnpxM3VFb3FXbHl2UStIUytjaW4wMVlCVXhkY0t2dEE1RmtV?=
 =?utf-8?B?MzRiQWlCTytnUVFDWjRkTTNUVTZhNnljOTR3VmRZUHZhajBvaktoZkVGVXJl?=
 =?utf-8?B?UlpzVm1HNit6T2ZnKzhEUGpXV215NWpVb3g5OEJiazZiYzV6NkZkaVhhSHow?=
 =?utf-8?B?VGpSckkranZMOWhwek02MDFGVnJaVmVSVWR3c3VHd0tNTmxNVTV0dUtURERN?=
 =?utf-8?B?V0VuMWZEOGFXcGZDaUM5UGQwY0IyVmlBQkszaFFORkNqazhUNS9sSTFhcER3?=
 =?utf-8?B?MXpQVUJWSDhDSmNUbmRqNTI2bm5VV0hvYlJYcTNIcEwzSkp6YVRyRUdqTjdK?=
 =?utf-8?Q?yJQQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTFvVXVUVktrMTM0QXRHbGNzYjgyOGRUVXdwaUdQQUtGQTNaMVpmc1paK3dn?=
 =?utf-8?B?YkZqclhMQzRITTFQNmtQWDFjZllIb0pPSmVWamE2Y2ZpelZFR1MwM01RWEJj?=
 =?utf-8?B?RnhvZDFtckxxSWJKYVBwSGZsUkt2N2YrMHhZeU9Hb0p3MHNvTFpJWmpLemVl?=
 =?utf-8?B?b2hsb28xZmtrbWhBck1WVWRIbzhVc01ucTlndzFKMXZtTTRqdCtxMW9sa3Va?=
 =?utf-8?B?ZmVnUlk2ck5OOVFQK1llRURxRnErMm8rUVhHTkhjdy9MTUVKZ1gvNHcyaHFq?=
 =?utf-8?B?eDhhK3BRT1IrcDRndDJmL0RCMEg3WlJGZlhPWjRUQVRBRzYzTFZCQWhWK21O?=
 =?utf-8?B?aGR2R3hvT0VCS3UwempBN0NPeUUvTEp2R3FieSt3SzdNZCtqZE5TVnhVRW1M?=
 =?utf-8?B?U3NIZlB0d1NrMndmRElXaSt2QTFCZk1DV3ZCc296bTdtM0R2S21lUVdoUkp2?=
 =?utf-8?B?YkgxbXZxRUhjejRBWVovb29vUTlFd3dlNSt4THhoYVlDS1FlSGp5S1NhVE10?=
 =?utf-8?B?VDNUZ1cvZ3NGUDZ4WGhwLzRWZXYzK0ZQeXR0YXVmTDhLREgyZ2dPbmdIM1lv?=
 =?utf-8?B?M1lYSGpNZjRUNFAzUkMrdEoxb3hyQ2V1dDNWN0lwbDVVR1ozcUZFRUpyNU84?=
 =?utf-8?B?Smd0dzB6Ylg3aWRxaDdrTmJ1L2JUS1N0YjUwVk84MWZtMEF6MmdpKy9FRGFp?=
 =?utf-8?B?YnA2VENTS0FBQ0JaWHlyWGtNS1gzY3NNVS9IV0p3OThnRkRvbzdnZ090VVVQ?=
 =?utf-8?B?MThOUFM2bllGSlNqek9CR1hiSGtVaUgwV1Blby9ya2lWQnNweXZCanRXYUtT?=
 =?utf-8?B?dmRmay8rUWZUdGdFU2RXaExqeDBTRjRqbUNYSTRXZ3luRTRCTUJmaVV1N1hN?=
 =?utf-8?B?R3k3LzgrWFM1UktzNmNHQzVKYWdqM3hxZDBmK05Tb1pPUTZmT1FtNUJhUG1F?=
 =?utf-8?B?TnJYNmQwMDhrZXFLNGNRdHhsQlRQSmRVL2pDWUdRSnRZU0gyYytwQWF1T3lG?=
 =?utf-8?B?WVMzV3doVmJIS3VyU28vc09yNjlQbEMwQTVYaUhuaDNJSFFJMmx0YU9QcEpa?=
 =?utf-8?B?d3dpK2VZSkdJT2kxdE1TNHltajQ2dnFBL21VajFkcWhRTzZGTVVtV0xVVHFu?=
 =?utf-8?B?cGQ5d1hEN1c5d0V3c21kZzV3L1RpSTIwVTk2S08zNklpMkRISlJHWm5MQ095?=
 =?utf-8?B?UFFqUngwYjdLNVM1bnZia29RK2o2am1hZUtlTFIydXVxSHNwU3hZU0pyYmcv?=
 =?utf-8?B?UFlwQnJFSk04TkxnVDdWOGhMZlE1TElJNGdSQ09McHB0M0IyMWd1MEQrNkhF?=
 =?utf-8?B?QmV3RHpjSWRuUW42V1UybEhYRUU4UUpnVmUxazBPNkJiMS9ZeXVZemg0R1Zn?=
 =?utf-8?B?MXVybDB2UzZxYWNtemc3b3I1dTB5Rnd5cjFZRFBUYktPUDJFejFEeGVvZmtY?=
 =?utf-8?B?N2dxUlFyK3pla0diNmxjenBzS0hKdXJiWDJJc0lxZEIrQTVUbVoyVU1wbUpw?=
 =?utf-8?B?MWFzd0QzRzcwa0I1NkhadklrUEtkVUo5RlFselVEK3RIenprNHZqaTk0OWdx?=
 =?utf-8?B?WXpOTTVPVEh3MTYrSTVyRWpqd3RnMDdSU2pmTi8xWWxjYjE3WFR6aElsK2wv?=
 =?utf-8?B?V2VZcE1WYUw3Y1V4QVBROUUzZzBPMkNaUTNzOHBMa3FnbG9UZEFLYjAzeEFu?=
 =?utf-8?B?eVM4SjhJa1BWZEpOWnRHdlhqRG96R3VqYVJ4bUlWNUtsM2d6N0NLWUZkRi9k?=
 =?utf-8?B?WTVzQmhFUGVlU2dleS9OUGVRVURONGR5THc3UitFT3EvS005dTk5NXY5RVVj?=
 =?utf-8?B?MDZ0cXBBLzFINE9WVUE4cDcvejZqUDljd2orS2s2ajRwRGxWK0dQelpmWHZZ?=
 =?utf-8?B?WnFneWZBRWhDWW5FQzB5RWxqang1eWN6YWNFRGwyMFFFNU9pTWNqME02NmlJ?=
 =?utf-8?B?OXFHUGNnQ1dIV0I1ZVROV1gyL0NnRUtTMjRtSFJoQlZWK1EyRVZKcEVZQmZF?=
 =?utf-8?B?LzZ4WUZWQnJiTElodnA3ZlNJREVaOHJWZVpvV0tuK0s1TDcvTXhsS1VBV1dD?=
 =?utf-8?B?TnY0RU56ZHdNTjQwL0V3S0FLTlhTSWN6d2dqRW9NVmxhbTdnU2V2eVVjd0lR?=
 =?utf-8?B?TU92cmRUdDRhSWp4UThnWG1RNW5kMGpycVBHWjhKb1o0UndHUVU4bGdBT2xU?=
 =?utf-8?B?bWhsS09DUUhYSW9FQ3RqaDlKWVI2RFBuTkxmbEZGSWRQaFhrSlZ3di8zSWxP?=
 =?utf-8?B?SnBsV2h6OXpLdnpmWlZ5d2NlOEtCRk5YaEU0RTk3K1RDb0pNZ3hrT09sdTY3?=
 =?utf-8?B?WmpWSFdxSW5QR0czaXd4YWRGYW1NZjdXellzL0w3QnFsb3lxeVBIQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf1c36f-afed-4779-81fe-08de53d9f75e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 02:01:15.7264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7bVYO1C112iiQAQHBuNdziblycoSraKYwyOLF+RiEie8QvFq4QobWkJZcpI7pK9uF20sPabP3ocTvofUUuxmUXxpw24QULOANiF0Q5mOu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7585

On 14/01/2026 11:55 pm, Victor Lira wrote:
> amd64 vol 3
> 16.6.1: "In both the flat model and the cluster model, if the
> destination field = FFh, the interrupt is accepted by all local APICs."
> 16.14: "A DEST value of FFFF_FFFFh in the ICR is used to broadcast
> IPIs to all local APICs."
>
> intel 64 vol 3
> 12.6.2.2: "Broadcast to all local APICs is achieved by setting all
> destination bits to one."
> 12.12.9: "A destination ID value of FFFF_FFFFH is used
> for broadcast of interrupts in both logical destination and physical
> destination modes."

The formatting here really needs some work.

>
> The specs say 0xFFFFFFFF/0xFF should be a broadcast to all APICs in
> logical destination mode but it is matched only for cluster 0xFFFF/0xFF
> (or as flat mode in xAPIC).
>
> Add a check in vlapic_match_dest similar to what is done for physical
> destination mode.
>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
>  xen/arch/x86/hvm/vlapic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 79697487ba..1208cd21f0 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -248,7 +248,8 @@ bool vlapic_match_dest(
>      {
>      case APIC_DEST_NOSHORT:
>          if ( dest_mode )
> -            return vlapic_match_logical_addr(target, dest);
> +            return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
> +                   vlapic_match_logical_addr(target, dest);
>          return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
>                 (dest == VLAPIC_ID(target));

The SDM/APM quotes are clear, but I think this logic has more bugs than
just this.

First, you've got a common expression that the compiler cannot optimise
because of the function calls hidden in VLAPIC_ID().  The appropriate
rearrangement would be:

    case APIC_DEST_NOSHORT:
        return (dest == _VLAPIC_ID(target, 0xffffffffU) ||
                dest_mode ? vlapic_match_logical_addr(target, dest)
                          : dest == VLAPIC_ID(target));


However, the first clause looking for the broadcast ID is surely wrong.

Surely it needs checking against the source LAPIC, not the target. 
Whether 0xff or 0xffffffff is the broadcast address depends on the xAPIC
vs x2APIC mode of the sending LAPIC only, and it's surely buggy to fail
to match targets just because they're in the opposite mode.  So, I think
the correct code is:

    case APIC_DEST_NOSHORT:
        return (dest == _VLAPIC_ID(source, 0xffffffffU) ||
                dest_mode ? vlapic_match_logical_addr(target, dest)
                          : dest == VLAPIC_ID(target));


Thoughts?

Given this bug, I expect the OSes which use fully broadcast interrupts
tend to do using shorthands, not the broadcast destination.

~Andrew

