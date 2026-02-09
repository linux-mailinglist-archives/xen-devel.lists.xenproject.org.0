Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEISMBcBimluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:45:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17295112146
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:45:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225632.1532179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTRB-0004nf-Kw; Mon, 09 Feb 2026 15:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225632.1532179; Mon, 09 Feb 2026 15:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTRB-0004lV-HT; Mon, 09 Feb 2026 15:44:33 +0000
Received: by outflank-mailman (input) for mailman id 1225632;
 Mon, 09 Feb 2026 15:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpTRA-0004lP-LY
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:44:32 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35a1d7c6-05ce-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 16:44:25 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5235.namprd03.prod.outlook.com (2603:10b6:a03:21b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 15:44:21 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 15:44:21 +0000
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
X-Inumbo-ID: 35a1d7c6-05ce-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXgA+PlsfihrCzbM5UjO+GY6DMu5qrITLopKbILD5PDg62EmZin58MzAPV5wm5eIw8CRWOTwDDDHLXEU29GObZiKkjsQfIW+FXNwyk3v0mrUJpZjBk39NW4zwh+xM97ZdvjLWulXETJXwQl6s74R1nQBYR59Jc/Z2CFYNYeLv1clKrANyGNblEd+1Tz+Z9ESQfUhLTE03+QJFa0ZQTdEOXDV322kxE98dnUgDvv7fegZXkKEv1zQN6VVYoul4C/hZ3cDzKKnBB3ZXSznLKmQMNugJO6QGYre7S4WDzLFd4S2YSIYMEgoGP9I9IrCHvwKHBBPqbbQ6CsWDK7Lw40c6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O59oFjuvaC9HBFP5ZpnnvoDpQgALaY4CbzGBT9sQFNU=;
 b=EPZXuOFsVFc1ofCiC5+4YbWvySVkj8bHu5emgdklr/io94Pq2dEvMJTknKEnh59q9H3kJnCPmnHsPrNAwL+LbyaVGV4IrDP64fzgW/svwqopYYP6g8WHAHC/g/JdswV+Vea2GtXSrtbtXrQTy9c7git7VQxdPkMlwQW/LzznY0preNfLkWUmvETeMpOGxqME1BxsqS298rN+jlpc2CZhEG4cpgaQtaZH19klaWOIgVJDncaC9kkoWIm0fG2fa8M0rUrhb0qJzQJanYBjF5EWICWwrawpDvJ84iAo6FKFV9xM2hLZpVis80bfo+G/fob79XKGsZjjdncw4GuKTwysyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O59oFjuvaC9HBFP5ZpnnvoDpQgALaY4CbzGBT9sQFNU=;
 b=HYqmPYE7Xnt/Y71fGeM5v+umAiYao3ihvqFCtMSqWSJK98x9OHX9XwimDvsjGWTKezfYXECt/HXcwCcUkLHPy9C+w3DmLw11Le1JnEt2CzPhFLO9KWtOWkjEE20pxz8Ji5k/4C/d2Cybc3oDGlLLO14y4E1VW2VJSOtSS5EBlNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 16:44:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86: Add Kconfig option for log-dirty tracking
Message-ID: <aYoA0jgj99Ani0mF@Mac.lan>
References: <20260209103118.5885-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260209103118.5885-1-alejandro.garciavallejo@amd.com>
X-ClientProxiedBy: MA2P292CA0019.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::17)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d92cea6-3190-407f-e1f5-08de67f217bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVZmdzlOVkdnNzBuZWcrcG9VVmZ0dWhnMTVaNWZuWE53TFBtWDV4aEZOMk5Z?=
 =?utf-8?B?dDd0ODVrdWdVZjV4VWdkZFAxcWhtVmtDdmlsM1pzcVVQTU1ldjQxWFJmUEFJ?=
 =?utf-8?B?YzhIS2pOdHppeDRyQkwxMzdWTHNqaGV2aW8xR2FMQ3U2SWxwTXdiZTRqeEVy?=
 =?utf-8?B?RTZFNDRVMnFTc0daQkx2dzZDejA0Vk8wcUFLaWg4SFBkcHZLbDY2WWN4dmQ5?=
 =?utf-8?B?aURVWFppWUZCdnA1MEtiZTJYQzZXUDdlTllIVmlTOUQ3TGF4azRjWkM0VXEy?=
 =?utf-8?B?ak50dFB4RGlsS0NSNmpsYThNMWovME0wdzBCMi9vWERBTGVWQS9nUU1mMHBG?=
 =?utf-8?B?ZnI1cTJseHJKcDhBQmkyLzlIUzcxU1JOVG00dmpGTVE3R2JNM0VlbU51Rkxl?=
 =?utf-8?B?RnJhQzBDb1dqR20zb1oySDN1QnVHZ2VpUnBkTnA0ajUyQk1NZXhWUFpLQmtU?=
 =?utf-8?B?WWZBWXVDbjNoZlFiT3hRbTcvWkVEdStuUFNJdm9QWGVGaDRIOG96SXNoemtK?=
 =?utf-8?B?UHEwZlNrZTEyZ1RHUEJNdmFicEtxNmlqcXdyZ1pWOXFmblFBdlZ2djR2SU1Y?=
 =?utf-8?B?bG55T3RTd1lGUVk3TjVFYmxPZ3FHaStRKzlxeGxUZ1BnWlRnS3FPdmZDdUNV?=
 =?utf-8?B?d3pMcDJDMkpDRlpLeVNVWmVDNGQvb3AwcDlOYXozL3U4YkUrcnNGT1Z5U0RU?=
 =?utf-8?B?MTk5MUdOdjlhN0JWeXJ3Z1FBblFpN0JCVG4xQ1paZExRMysxcm16K05KQTQx?=
 =?utf-8?B?c3d4Ym56MEpONkZyOTB0T3ZTeEVrTlVaRlgxVWFRNlpRZ0lXV1hoQUxqNU01?=
 =?utf-8?B?TUhxTE9QQWtraEQzcjcyRGdFeUxPcW9KdnNYVW55bmJMSDhFZWIzclNvdTF6?=
 =?utf-8?B?YVQyakpMWjNQOUhobFVLbUdBbk5FZHgydld3MUI4bnhXNWU0Tm9aTStxL2sy?=
 =?utf-8?B?ZHFyd3h5b3cyS2tkWEw2Q09PTDlLRXBhcUFvRGpaVzU4Yy9BdEdSY2IwbFk0?=
 =?utf-8?B?TnhJb0Q4OFpteC9mUlEvcG1PZDd4anlmOS9vS0NyMlhhVitxcjFqSXpWRndV?=
 =?utf-8?B?WlFRUTdONW9Oc2FFUS84bzc2dzBoeGhBWGNOMWRZcEt3Y0dieTlDblhFaExK?=
 =?utf-8?B?UVdxWW9td3pQWE9QbFFTOUNlVzBDcjNhVDN5RWNXdmhPL2lpSFMxL2lvZDBx?=
 =?utf-8?B?TTlGSVZRelkyTmlQN1ExSjJ4K2F1V0hwcDVGSUhySkNydHhPRURQMCswTW5M?=
 =?utf-8?B?TTlSS25VdmlVeW9pNUJmVUZmbU1POHdwRk1TN0pnbVFKYSt4ZEJKUVhMQ2x4?=
 =?utf-8?B?dVlzRE1xSTlLVjJPaThmTmI1NjQ1WGtTS0twVWVndTBJU3NaQ0tmMGNodjRQ?=
 =?utf-8?B?TGhGQWNvaGhJMjd4NFZEZnBEMlg2OEl4ajlVaXlIUHFnNGdYWjdDUEJOQk4x?=
 =?utf-8?B?QkxPOEV3SDhHaU1KNVQ4N2JkUWtrdFUrRDBUQVVnLzBUR01wSVduL291a0pa?=
 =?utf-8?B?ZEJaOU5BaW03SHlTRFBsb0ZNKzBILzQzeFpiOUQ2RFJrcVhQbjBITG5iS0tE?=
 =?utf-8?B?dmpjR1RCSmtwMlljK2dFdnk2TUxNTCtKclliTWtSK2JaYVJ1K1VLR25iTVNv?=
 =?utf-8?B?V1l5cWllcFJ6S29KcnRjOXdhNjgxYzFmeDVJVzVEM1R5c0VlbkhZMmYvQ0tE?=
 =?utf-8?B?QnM1QTc1d21OaDduR2R4bk81dDRsT2QzNzBQYUxWVmZYK1NZUWU1MDdqTTVJ?=
 =?utf-8?B?TXBBSzJTRVhIbTMvSGFmZG50RjExNURkWkpPdTJqNkFPWjNzaTZtdHdTazFu?=
 =?utf-8?B?NUI4N1pVeE5QVVpzOVpzYkp4VVZ1LzI2RTkrZExDKzBRV2RsYmpBY21uMkJK?=
 =?utf-8?B?M3ZFS0lsMVRSazBqMHRzQlhkckE0ZU1qNUlKakI1cEh6bERpbitzcE9nWGZ6?=
 =?utf-8?B?dlBBbXlzNEs5SC9PQWNRcXRTbUdCVWRJN3kvU0MvaEZxekhDUGtMRUVWYW91?=
 =?utf-8?B?U3REWXpENkRCejkyczRpNU45Lzd3NGFjVzNoZC9RREt2ZzBYeXZSVkMvUGto?=
 =?utf-8?B?SnRnbFZiWUZLcDlpbTRjUVN2d2c1SE1YTzV6TitpaUx5dEhuMGQvVngwdWN1?=
 =?utf-8?Q?AfX4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkJQQkU0TElpc3FmZkZEUEd3M1YzUStwYW1zNCtIN3Ywc1pMNnQ0WGpBREpC?=
 =?utf-8?B?TytkVWp2d0swVFZyUlBLanY4WE1CVTV6NUZFTndEQThBaHJGanMxWVJVeUR5?=
 =?utf-8?B?SVlKVStUT3JQakxNdmtvTWJ5ZEQyTm90eWVmNUhqM001M3B5WVZhdDNjdTRi?=
 =?utf-8?B?a2FhRk5XVmlNaHNuRitkUzlBNDJPajNMKzg4bjdlNFQxZWlBOHRzOThoN2ov?=
 =?utf-8?B?TUpGdnlxYTlpR1o2ei9WdUZoSWlWOCtVRTVkUjZoalQ1Yk1zUUpadjkrN1Mw?=
 =?utf-8?B?VUtEemZEcmIyaHF3akVNOFY5c0VRVGZRM2YzYW9rOVZPN29JaUhYbDNDYlE5?=
 =?utf-8?B?YUE0djM4VCs2QzFKUC9mdWtqSDNnK1dRM3BpbUg4UHJTR3RnSFZlcjY3V1Q5?=
 =?utf-8?B?alU3Y0pIOEw4KzRmZmJNOHZUN3B1eVgrVnE2QlZPRmZvWUdnVk5EL3Z3eVYy?=
 =?utf-8?B?cTg4S2xPbE02Nk81amdGSkdhMmZuVHAxbXZiZldZYklxaUoyMXpnRGI2d2Y2?=
 =?utf-8?B?eVlIREl4SFE2K3FEajk1NFBiWGxZeWRlTVg0R3Y5a2w3NEV2Z0FkN3ZrdCtN?=
 =?utf-8?B?VENOUi9uVzB2MFFvbmY3cFFaTFgxSlJKakRjdTdFQzFvMXJxN0ZTU2NvZzBa?=
 =?utf-8?B?eFRmK2x0WFJEQ3VVeldWeEo1M3daa05YTmdqeS93WEtOa3h6anJLeEZYeThE?=
 =?utf-8?B?ZTcrTkxHTUprV01pRS9VamltdWpnQUMveVdISUs3RzBuQ1FTRk5HNVB2cjBS?=
 =?utf-8?B?ckJpRnJxZzNLdkltZldZQkJtN3MrbTZyelNucEJVYVcvdzVWWDVHTStHQU82?=
 =?utf-8?B?UTlhdUphSVJQUyt0d1N4dnovblZtb3FJOEt0czVOTDhVQ3RsK3EzUlBuNVY0?=
 =?utf-8?B?cGd4UkViSXBWaC9YOEN4YVBVRXVSSE43WGI5Ykx3KzlUSHd5T1hVaE91aXpG?=
 =?utf-8?B?WUtGZFFMdEE3ZzJzTkNWbmdBVzFPdDdEMGNibXVFZzJibEQwTW5kNGJqYkNo?=
 =?utf-8?B?aWU1SWJFRWpBU1o1Wm5xaGh1Q3daMW1abmZod0d3NUwrVzk1K2M1dktLRHNL?=
 =?utf-8?B?RzVrc1BUaDdicXhGQ2diMUJ1cmlmWTZMdEpGZ2RqYzZRUkxlVjY1YmdJaUNN?=
 =?utf-8?B?RTNwYXo5eWFjZlRLWmc2WTQxSmV6eUU0MEM2L0JjZ1l5NVVBVWYyVjlLQzRy?=
 =?utf-8?B?SkRmaTBNK0swem9DOForQ25kWVdtWFh6V0hjNTFLWXB6bTREUi9oTlpwOXZk?=
 =?utf-8?B?ZEgwN3FCNngyWC9XbWNzRFRvRitZUUVRRDZ6Z3c5a2cybXNxa1ZYYUdvSUUr?=
 =?utf-8?B?YS9LL2orNGFhUU5oSXozbjJUbFN2TEVBc2VTQkxDMFZyREZFY2hMakllUzlo?=
 =?utf-8?B?by92SmVaQWFqQlNRVFdCVDl6YVQrWHUyMHdVa2xVb3hySDNaRllVTkVWTytw?=
 =?utf-8?B?eGhSWFJYeUM5ZW5VRkpGaGZvZTV1amxHSVlWdkFwek8xQTlJeGF1cVc1eTlj?=
 =?utf-8?B?RFpTUW8yTTBneHFJTUVtSkhsM2pNdUtPejhOVjVsWjgzTjlTaWsreUtZWHB6?=
 =?utf-8?B?emRCQWZCNWdoR1lBblI2SzBqaVlHWng5bC9RT3ZQWE16MFFwR0JiYzNRU1F6?=
 =?utf-8?B?ZGpIV3Z6YzlIWjNFbDZ0SUNXOEMrUkVuMkUzSVBlN0FRWFpBU29JR0hMMVkz?=
 =?utf-8?B?bWJzR1YyNTdURHFUeVdCZWV0WWorekpPMngzb2NXekYrNzlobDhCbHNWSVpy?=
 =?utf-8?B?bmw5d1Nocjg0TDFGb0dqWStna0ZUUTRWcXNEU2p6Z3Z5SU5xMHBSQm1tS1Zq?=
 =?utf-8?B?NHBQbFhjbkxwblg4Qk41Y0IwVnp6VnoybFFhRFQxc2RSR0s1bDgrbEJBcW5S?=
 =?utf-8?B?V1A5WlRHdm11Q2VPT0JML0NXQzZCRC9aUUQySDN0TTRTWDR1enlGT0dXTnlw?=
 =?utf-8?B?MW5YUU5sZjd4QlZMTTNTcU5vdHRmZDBNeHk2QTlUTXhpZzZhUTN3R2oyakJR?=
 =?utf-8?B?bk4vMWFtbExtUWZ1QnQwemJVUlkvTGQxRFk3cEZ2Zm53R2tGWFVQUU5mMnRL?=
 =?utf-8?B?OW5SOU94aW9vWnN5NDE5SDFHMXdpUUs1UWg3eHQ5NzZTcnJ4QmlYVC83R01m?=
 =?utf-8?B?bWs5Y2tQb3ZWS1ZxSmJNQTlpYXRxNFA2QWpqSkpiRGQ5Z3oxcjFjQks3bGVC?=
 =?utf-8?B?T0hKcWRUb2wxWGRlRkJXbWZxU2hIay8yeVM1RmlOQUtpaDFqZE9qcTY3VG5r?=
 =?utf-8?B?b3V3NmlMNEtkRU8wcnYwNEc4MFZDdE9xclVGbGh3djFjME5wclZHajh0NzBW?=
 =?utf-8?B?LzBmcm9lbWN5Yk41Zmhqdmp1ZzJ2Vks0MGpIMHlBd080Vmh1OGtaQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d92cea6-3190-407f-e1f5-08de67f217bd
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:44:21.3628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFIqT65/kv/z4ghKKDYzzZ4JX5QWEU1iZOhdkMBlizStuJ1B/uzRht2cKSNxGnvELDzZw3tU5dBzFSR8AMG+Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5235
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,Mac.lan:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 17295112146
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 11:31:15AM +0100, Alejandro Vallejo wrote:
> Creates a CONFIG_LOG_DIRTY Kconfig option with the following effects
> when disabled:
> 
>   * paging_domctl{,_cont} return -EOPNOTSUPP (XEN_DOMCTL_shadow_op).
>   * VRAM tracking via DMOP returns EOPNOTSUPP.
> 
> And compiles out all log-dirty tracking infra.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> RFC for the Kconfig help message.
> ---
>  xen/arch/x86/Kconfig              |  9 +++++++++
>  xen/arch/x86/domctl.c             |  8 ++++----
>  xen/arch/x86/hvm/dm.c             |  3 +++
>  xen/arch/x86/include/asm/domain.h |  2 ++
>  xen/arch/x86/include/asm/p2m.h    |  2 ++
>  xen/arch/x86/include/asm/paging.h |  8 +++-----
>  xen/arch/x86/mm/hap/hap.c         | 22 +++++++++++++---------
>  xen/arch/x86/mm/p2m.c             |  2 ++
>  xen/arch/x86/mm/paging.c          |  2 ++
>  xen/include/hypercall-defs.c      |  4 ++--
>  10 files changed, 42 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 61f58aa829..fbf044aa4d 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -146,6 +146,7 @@ config XEN_IBT
>  config SHADOW_PAGING
>  	bool "Shadow Paging"
>  	default !PV_SHIM_EXCLUSIVE
> +	select LOG_DIRTY

I think I'm missing something, why this dependency of shadow on log
dirty?  Isn't HAP equally dependent on it?

Oh, I see, You adjust HAP code to deal with the !CONFIG_LOG_DIRTY
scenario, but not the SHADOW counterpart, that still has a hard
dependency on LOG_DIRTY being enabled.

>  	depends on PV || HVM
>  	help
>  
> @@ -166,6 +167,14 @@ config SHADOW_PAGING
>  config PAGING
>  	def_bool HVM || SHADOW_PAGING
>  
> +config LOG_DIRTY
> +	bool "Log-dirty page tracking" if EXPERT
> +	depends on PAGING
> +	default !PV_SHIM_EXCLUSIVE
> +	help
> +	  Enable log-dirty infrastructure so Xen can track domain memory writes and
> +	  the dirty state of VRAM for device models and live migrations.
> +
>  config BIGMEM
>  	bool "big memory support"
>  	default n
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index d9521808dc..61d43a21d0 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -220,15 +220,15 @@ long arch_do_domctl(
>      {
>  
>      case XEN_DOMCTL_shadow_op:
> -#ifdef CONFIG_PAGING
> +        ret = -EOPNOTSUPP;
> +        if ( !IS_ENABLED(CONFIG_LOG_DIRTY) )
> +            break;
> +
>          ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
>          if ( ret == -ERESTART )
>              return hypercall_create_continuation(
>                         __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
>          copyback = true;
> -#else
> -        ret = -EOPNOTSUPP;
> -#endif
>          break;
>  
>      case XEN_DOMCTL_ioport_permission:
> diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
> index 3b53471af0..94216aecc2 100644
> --- a/xen/arch/x86/hvm/dm.c
> +++ b/xen/arch/x86/hvm/dm.c
> @@ -48,6 +48,9 @@ static int track_dirty_vram(struct domain *d, xen_pfn_t first_pfn,
>                              unsigned int nr_frames,
>                              const struct xen_dm_op_buf *buf)
>  {
> +    if ( !IS_ENABLED(CONFIG_LOG_DIRTY) )
> +        return -EOPNOTSUPP;
> +
>      if ( nr_frames > (GB(1) >> PAGE_SHIFT) )
>          return -EINVAL;
>  
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 94b0cf7f1d..f09c13909f 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -226,7 +226,9 @@ struct paging_domain {
>      unsigned int            p2m_pages;    /* number of pages allocated to p2m */
>  
>      /* log dirty support */
> +#ifdef CONFIG_LOG_DIRTY
>      struct log_dirty_domain log_dirty;
> +#endif /* CONFIG_LOG_DIRTY */

Can also ifdef out the declaration of the log_dirty_domain struct, and
just provide a forward pointer declaration for it?  Would that satisfy
the paging_log_dirty_init() prototype?  Hm, I guess that won't work
with the usage in hap_domain_init().

>      /* preemption handling */
>      struct {
> diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
> index 9016e88411..3c2dcacfa5 100644
> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -253,9 +253,11 @@ struct p2m_domain {
>                                      bool *sve);
>      int                (*recalc)(struct p2m_domain *p2m,
>                                   unsigned long gfn);
> +#ifdef CONFIG_LOG_DIRTY
>      void               (*enable_hardware_log_dirty)(struct p2m_domain *p2m);
>      void               (*disable_hardware_log_dirty)(struct p2m_domain *p2m);
>      void               (*flush_hardware_cached_dirty)(struct p2m_domain *p2m);
> +#endif /* CONFIG_LOG_DIRTY */

Will this build when VMX is enabled?  I think it's missing an
adjustment to ept_p2m_init() to not initialize those fields if
!CONFIG_LOG_DIRTY.

>      void               (*change_entry_type_global)(struct p2m_domain *p2m,
>                                                     p2m_type_t ot,
>                                                     p2m_type_t nt);
> diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
> index 291ab386e8..980cdfa455 100644
> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -55,12 +55,9 @@
>  #define PG_translate   0
>  #define PG_external    0
>  #endif
> -#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>  /* Enable log dirty mode */
> -#define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
> -#else
> -#define PG_log_dirty   0
> -#endif
> +#define PG_log_dirty   IS_ENABLED(CONFIG_LOG_DIRTY) * \
> +                       (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)

You want an extra set of parentheses around this define I think, just
in case.

Quite a lot of the code is also protected using #if PG_log_dirty.  I
think if you introduce a CONFIG_LOG_DIRTY it would best to also guard
the logdirty code using that new define, so it's consistent (iow:
replace `#if PG_log_dirty` and similar usages).

>  
>  /* All paging modes. */
>  #define PG_MASK (PG_refcounts | PG_log_dirty | PG_translate | PG_external)
> @@ -174,6 +171,7 @@ static inline void paging_log_dirty_init(struct domain *d,
>                                           const struct log_dirty_ops *ops) {}
>  static inline void paging_mark_dirty(struct domain *d, mfn_t gmfn) {}
>  static inline void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn) {}
> +static inline void paging_mark_pfn_clean(struct domain *d, pfn_t pfn) {}
>  static inline bool paging_mfn_is_dirty(struct domain *d, mfn_t gmfn) { return false; }
>  
>  #endif /* PG_log_dirty */
> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> index a337752bf4..21672db011 100644
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -50,7 +50,7 @@ struct hap_dirty_vram {
>   * calling p2m_log_dirty_range(), which interrogates each vram
>   * page's p2m type looking for pages that have been made writable.
>   */
> -
> +#ifdef CONFIG_LOG_DIRTY

Nit: I would leave the newline as-is.

>  int hap_track_dirty_vram(struct domain *d,
>                           unsigned long begin_pfn,
>                           unsigned int nr_frames,
> @@ -161,6 +161,7 @@ out:
>  
>      return rc;
>  }
> +#endif /* CONFIG_LOG_DIRTY */
>  
>  /************************************************/
>  /*            HAP LOG DIRTY SUPPORT             */
> @@ -440,14 +441,17 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap);
>  
>  void hap_domain_init(struct domain *d)
>  {
> -    static const struct log_dirty_ops hap_ops = {
> -        .enable  = hap_enable_log_dirty,
> -        .disable = hap_disable_log_dirty,
> -        .clean   = hap_clean_dirty_bitmap,
> -    };
> -
> -    /* Use HAP logdirty mechanism. */
> -    paging_log_dirty_init(d, &hap_ops);
> +    if ( IS_ENABLED(CONFIG_LOG_DIRTY) )
> +    {
> +        static const struct log_dirty_ops hap_ops = {
> +            .enable  = hap_enable_log_dirty,
> +            .disable = hap_disable_log_dirty,
> +            .clean   = hap_clean_dirty_bitmap,
> +        };
> +
> +        /* Use HAP logdirty mechanism. */
> +        paging_log_dirty_init(d, &hap_ops);
> +    }
>  
>      d->arch.paging.update_paging_modes = hap_update_paging_modes;
>      d->arch.paging.flush_tlb           = flush_tlb;
> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index e915da26a8..373382c28c 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -236,6 +236,7 @@ struct ioreq_server *p2m_get_ioreq_server(struct domain *d,
>      return s;
>  }
>  
> +#ifdef CONFIG_LOG_DIRTY
>  void p2m_enable_hardware_log_dirty(struct domain *d)
>  {
>      struct p2m_domain *p2m = p2m_get_hostp2m(d);
> @@ -263,6 +264,7 @@ void p2m_flush_hardware_cached_dirty(struct domain *d)
>          p2m_unlock(p2m);
>      }
>  }
> +#endif /* CONFIG_LOG_DIRTY */
>  
>  /*
>   * Force a synchronous P2M TLB flush if a deferred flush is pending.
> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
> index 2396f81ad5..13ee137db9 100644
> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -623,10 +623,12 @@ int paging_domain_init(struct domain *d)
>      INIT_PAGE_LIST_HEAD(&d->arch.paging.freelist);
>      mm_lock_init(&d->arch.paging.lock);
>  
> +#ifdef CONFIG_LOG_DIRTY
>      /* This must be initialized separately from the rest of the
>       * log-dirty init code as that can be called more than once and we
>       * don't want to leak any active log-dirty bitmaps */
>      d->arch.paging.log_dirty.top = INVALID_MFN;
> +#endif /* CONFIG_LOG_DIRTY */

Could you possibly init this field from paging_log_dirty_init()?  As
to avoid having more ifdef churn in paging_domain_init().

Thanks, Roger.

