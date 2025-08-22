Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05EAB31989
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 15:30:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090150.1447522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upRpz-00051D-Q8; Fri, 22 Aug 2025 13:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090150.1447522; Fri, 22 Aug 2025 13:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upRpz-0004yw-Mw; Fri, 22 Aug 2025 13:29:47 +0000
Received: by outflank-mailman (input) for mailman id 1090150;
 Fri, 22 Aug 2025 13:29:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kk10=3C=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1upRpy-0004ya-5y
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 13:29:46 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10b85894-7f5c-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 15:29:44 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GV2PR03MB9425.eurprd03.prod.outlook.com (2603:10a6:150:e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.18; Fri, 22 Aug
 2025 13:29:40 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 13:29:39 +0000
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
X-Inumbo-ID: 10b85894-7f5c-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRAbOMRlFPZ/0TpqG4fBKiCeJFHm+gKs6Cbs8Fp8O6y3zNJWht8AZx2t4H4wZU3pwePTK7ph9vEX+eWsEHMczzHMhmah8j2JaxvPf1EpnqR5Q5Rw0yB16mFBY9/UBzsDQhPQGh0xfZw6mSLL2orWo62Wf3WNh+hzGEfieUdMPb5bdTp8/0LG2NNW+F/PxBWESeB9KVt3WMPBypwCxMVkaMn960jiqgj0BoOC5HxP02M0u6tRXUj8j4V/aEmczoXDP8xSjlpU6Ycc8Su1VS+S2ADg4WW9OFzRnqS94ldTfih6nUatl9r0cvtBxanWdC+caZYgfHVlCqj6AHbWBfnupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfvnJewfW0iD06SEd1Fx9eRySUqTLCrVpsrNlqTHbJ4=;
 b=MfI+W7IMUEy32H2zLvR2Sqzjx8G/RBnnJD+WLRgbKXUc5ig/SxreA9g51FEOQiMDwOFaDCDwKAWjsLXD8dIaxzOEuY/uBbzvTOgLNOcfAXNv5SdOkSCxzAQcQmLR1HG9ORQlfraBFDV3K/VnXB7c4B82euFeJm8bla79x/Xbh55pd2pvV7YWNEKA8aRXCq3x2v2TvJZKsOGeEtd666VdCUXgM4S+La7JtnK5eOG0ixx2AvWtTr140wisVLzv3iYImamUpNJjjEsNwcEcGlwGa5m8c1URycM0uyOkw3F1HWwspXOuvJW8+t72f4usoaJ6PAc1MTjfUMcBZKUm9JRKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfvnJewfW0iD06SEd1Fx9eRySUqTLCrVpsrNlqTHbJ4=;
 b=hTo4wpphwkQucBtkpqv5UL0KM3cn1wfbsgVfv8c/1tA5iWXSBiRHh0vk/uWZuKx1UCLGd9Saot3bt12ug32pB1D9UUFRFQfsfLvs1Fs+Un0aO2xDpcc+cA8roRzDtB4iHdocdW/j28+1Zqw+ZRoeYJRXl9nEoR2Rn1MCaBX0qg/jacQFyoOMAjZUEoGBWUIRYgRtvZydfAEAOfSmA89RSP0XFG1xJpvvtZ6mPWIrZXSpfJfpRNuuIcF/i+IxhsFK5Sm9QwIuW+MLb1oyHZw7OON/h+i1UgknYgAYh4+iy7/lFQM9rb/1xYGN1r/R5V/0fQrFUj/psWBmVjDuMWmsdg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: fix Rule 11.3 violation in
 'vcpu_mark_events_pending'
Thread-Topic: [PATCH] misra: fix Rule 11.3 violation in
 'vcpu_mark_events_pending'
Thread-Index: AQHcEahzo6Ns4M/vpkyFl3Gc8+EN0rRs2qIAgAHTq4A=
Date: Fri, 22 Aug 2025 13:29:39 +0000
Message-ID: <633be715-c9e3-4021-9ca3-a39e2a2f1186@epam.com>
References:
 <7210337994620b60ed123ec6fc73e469c287adf6.1755676142.git.dmytro_prokopchuk1@epam.com>
 <79663681-466b-43d9-9845-3f16f8a33cb5@suse.com>
In-Reply-To: <79663681-466b-43d9-9845-3f16f8a33cb5@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GV2PR03MB9425:EE_
x-ms-office365-filtering-correlation-id: b3e68850-c6fd-4ccb-4d6b-08dde17ff231
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aVdhc2tUbFI3ZGxQMG5iZU1YanN4anlhN0l1UDFVQnlhVTdjTVN5QUN3T3ZI?=
 =?utf-8?B?MTBOUDlORm8zTndsU3BGTmt3SytQZUN1ZmtKY3o1SUhSNE1QWmY2ZGMyczc5?=
 =?utf-8?B?bmxaR2g2bit2eWpNM1pFTW1yWUxXTEJtUFQ2bFh5emozczZJUW10SjZ4cS9I?=
 =?utf-8?B?MGJCemtkMGY5YjUvdlFWV2xKaVZZYVBjV0E5Q0dVc2dTQWVLK2dIaDd5bmJB?=
 =?utf-8?B?SVRRdVg1MmJJYWxOVWwzSFJXbWxTVkltcks3Y3pVNDdnZHVUdFVLV1MzMTJu?=
 =?utf-8?B?V1VBNlhZRFVvUWNtNXdsR0Rnd1lpUENYNmJEb2swV0djSFp4dyt0UzdhQndO?=
 =?utf-8?B?c05tTWYxbXdOaFFIZ2kvMFR0RHpSbHJmSGFPVVFidGNEYk45TG9waWlPUld1?=
 =?utf-8?B?RHRzSWFwV3VDZFR6Y0tUcm8xaFN1R1dTVnB3Ujg5T0VIbmw5VVZtN1BzbGt0?=
 =?utf-8?B?V3BFeCs3R0JkbXNEVFgwQXNNbkhSL0wxWmRnbEZmdlF6cGJ2d3hGWE4zLzNx?=
 =?utf-8?B?anRTcXpqNFVnRnBPMGhyZW1YZnExMVU0eVBRbnJnWll5K1VtVXBlVmkwaHdr?=
 =?utf-8?B?Ums2eDhqU1ZvRklkYWpvd1ZZUlhWNWNVTGN0L3pzVzh0QXpwbDZqcnVFUU1r?=
 =?utf-8?B?ME1KMnpDSTV1akswRFYyMXB2cnlmc3ZrTTFUSWZXM2lHaWM3UHAyd1Y2U3do?=
 =?utf-8?B?dmU3OVR1aU85aWJIYWl0VFNSaDVhdjNSUU55R29OemQ5Si8yT3A2MnlsN1pI?=
 =?utf-8?B?SkU2N3NLaTZUd1NVWCt4YW5KdnZDL2pZbVhuNTFBWWNNNkpsUVJvUmsvR05r?=
 =?utf-8?B?SkFRcW5waG0yMTZ0K3owc3FadFRta0Q5bkpOTDRvMklSajhseDBzSG9tcW9o?=
 =?utf-8?B?ZWRkb1pUTTZ2OTV2MkFtUzJ1UVdRNTZWRFl0THJPRXJKb01kM0ZWeTlUL2Rj?=
 =?utf-8?B?WEdQeXRMVjY3SExETG5FQkkvN1U0cXVkY1YrSW1yMkE1OEExa0dwVmkxc1Q0?=
 =?utf-8?B?ZmVBUk1GcUZiOTI0U2JWMjk4V08xRGFncml6dzRsSWpzQjhGMFd5bkRpaUh5?=
 =?utf-8?B?Rzh4QVh0RzFaYnN5cG4vbFBFN2orRW9Ha0dJYnc5MjdXTjg2akdCL05ZS2Y3?=
 =?utf-8?B?T2xaZmNDRmNDOHJyMm9remhWK2Y1OGNDL2w3WmEwWEFhS1EvUFd1Z0ozRnRl?=
 =?utf-8?B?ZjJYYmZJS2JpRTlXME5ZUURnSTdkZXRWa1Jia1Y3ZWxqWGwxSm1MMmt2NGxH?=
 =?utf-8?B?S2NhNUxudit3ckVsL3l4TmhVSnhGeTFLM2Y5ZDBXNHlCWDVCK2JYTjh4QTBB?=
 =?utf-8?B?dGs5VGtPSXlpU2NHMWxwemlaU0hmWDZaSXltRm1VLzZZaGNYM0VSYyszbmhP?=
 =?utf-8?B?bWJWVnA1S1BnRDg5Q0ZmallkR2c1ekVhNkd5dG81WUhVSGI1bHJrV2dEVFdX?=
 =?utf-8?B?WGRDelc2Mzg2Y1JjK0VZYmxobkxyRFo0a2Q5UWtRUS9iUEs5aXlIRVpHWjVV?=
 =?utf-8?B?VlJEblNqbkl3dUhwMXZySFlXTm9YV0FPTkhGYlkxcUsyaithV3A2KzZNb1JM?=
 =?utf-8?B?N3pQMzdrQ3Z3cFdnU0h3bmdjVGVFKzJZV1lSQnl6RlFSMXNSRFpzSnoxeXNm?=
 =?utf-8?B?c2Z5ODk1YU00MEtBbEJsU2NYN0prZnExOGdRVEF0eDArUUJueUIydjRHajd1?=
 =?utf-8?B?R1FzS0lzRFRiNit5c3VrY21LRHQxdzJWcE9jSEN3YmVPeXNTTml5d1hDVXU2?=
 =?utf-8?B?T21GQVRvaThtNm5MamlyY2FMYm1LSzF5cWx0WTRFSmJxMVQzSXE5VXdWOEZr?=
 =?utf-8?B?K3dvSExoZEF6Wm5rSkFiTkI2aW45MjYrbVlLMzZRLzJXQ1RRcmFiV245dHlo?=
 =?utf-8?B?NzFraC9BYUhxZ1N1Z3djRHBydFN1QitzempzN09UdjNUNEdkbHprcFhjMUxR?=
 =?utf-8?B?TkJKbEx2bnZ6Y0U1djZnUlp5ajc3VGU3REhFKy9EWm1MZ2JnNFlQcmV3R25C?=
 =?utf-8?Q?yyCqJoalFRi/bC0mae1gAuXWGnuBUU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1ErRldiTndDcnd4SFR5Wm0xVmVLNnY1WW1BcGpCOHIvVkNIL292aGFnejNm?=
 =?utf-8?B?bXplaVg3dk5XYlZjL3dvaGVSSTlmQUNGd3hYRGh2cFhaZFdsUlh2TTlubWdL?=
 =?utf-8?B?MVlqYWN0ZVZIUzI3TjRlakUzSUVIazhuWk5lcmVEQ2FGeFhPSVBKNmpNU2J1?=
 =?utf-8?B?UFd3WHNGcW1LUE01YVdwZmplVU1RK0lmWnR5ODI3eWx0cnlpZEhqak9rVG1K?=
 =?utf-8?B?eFV2N1l2L1dybFAvOHNsTWM0ZU5ESzk5WXp5WXJVTHVLa0VKaEtMWHpuYlRH?=
 =?utf-8?B?MnZuaGpYT29PUTgyQjIzOW9jMkJ2Z0Y4b3U4VWhVZG94cGFQbURBMmJXdlVy?=
 =?utf-8?B?cWpNNzRTOXBGSFJ1Wkl2L21QMHVkWDQwYkw1Rmx6cks0TTVkdXpFdVRSTDBh?=
 =?utf-8?B?eUZLOElhQVJUcEhaclVFRys0Ri9iL3lnRXdwcjBTMWVybG9jK0dSQWJReUpl?=
 =?utf-8?B?TVVXY2tBcWFnRXZ6U29QTVNVbDlMWW43bWprWDdSalBtZHQ2NHlUSVpIMVZU?=
 =?utf-8?B?dSt1MGZjVWJxK1NlZnVjdytydDdLbmx1ajloY05pbFFJVncrc1pVMjQxK3Fs?=
 =?utf-8?B?a3FJNHp0dDh0TE9JRVdGZCtLQVp5Ykpvem5ndTRRd3RSZlpxNEJMREtKdFZa?=
 =?utf-8?B?Tmg5YXdsR3JwOE5wZHhGZjJEdkU3RU1iRC83NThCeHpxR2M2emN3N1JzVEkr?=
 =?utf-8?B?QmhSTDE4Q1dwMklocXJwQmxldGFGYURuN3pKVm5FQ1p5NTVqUEFZdmRxQVVl?=
 =?utf-8?B?bHJaVFBjQmh2VDlwRUZLM1BkaUF1THMzQnpmOHhrY3VmeVhTcFR4NmFycXpk?=
 =?utf-8?B?b3FPcldmWUNhVnQyZVAwVkNrc0NVckw5SGZRRXB2UjBJUTBpWStqMml6a1g3?=
 =?utf-8?B?bWNtanYxS0hpSkUrM2p4K0Q5QzRWYlQwdzRHa3lvWGxCeDNFNjMycnl3V0ZS?=
 =?utf-8?B?ZjBmQTUyRHVUL0gybWM4VGtUS2luWEhJZlJxZW85ekJCb0U4dng1R0krVW1L?=
 =?utf-8?B?WTdKUXdyenhEUXJEWnBDTVF4U0pvdzF4N1hXVzQwMkl5S3FheGVES0dGOENH?=
 =?utf-8?B?cnRscllsdzBKbEphSkNEN2xLUU5qZ0FRS0JyVlBsUTgvcit1bWFrYWVwY20x?=
 =?utf-8?B?N0szUmZIL1BQSjZnYVZJOFJucGtQdk0xdWdEQnRZOEJCaDVKdHBqMUN3NHpU?=
 =?utf-8?B?SzdiM0JiYjdZKzVYSVlJTlJzSXBOaVpYdGw2V1QrU3hhMTl3VGM2aUVWa1l1?=
 =?utf-8?B?RHd4ajFwbDVvSWhKYkJxZVErWGM5SnVDL05ZWThRMGZSb1dDN3Z0azJLOTNH?=
 =?utf-8?B?cUZxVkFjUzVlVzVNWTBON3pXZWNPR3JxQWRCTExwOWMvdzdCcTMzdXY3a2pu?=
 =?utf-8?B?WHZsS0piT1FuWUxjV0R2QXlYNGVuVnhYdFBSeHJzRTV0M0x1cG5hRVc4ejB6?=
 =?utf-8?B?THJTMkhva3ZPRmVrSGxOS2RROEZ6UXNBRFA1UmcxOEpkRmx4bWhhd21qYTFQ?=
 =?utf-8?B?M3Y5cU5UenlqVHZXaDcxdWFpR2xMcm0yVjN2NU5YQ1NpMnlWSUF4RWVjSXpr?=
 =?utf-8?B?N0J2ais2RmVxNThlditwODdDUDJFOGwwa0hzeE5mVytYVmtHc0FFaXFrTUVy?=
 =?utf-8?B?M3h0eUNKSVMxK1Y5azg5amZVR1R2cXl2a3Vyd2ZXMWJReVJSa01XWFVoVDFC?=
 =?utf-8?B?RHp1Z0RiWUV4SFkydEM2Z21OREFybWxSZ3V0cEJtMzR5QUJzUjYwWVd4V212?=
 =?utf-8?B?elRNM29jbEF3WnQ4cW9iK3pYRWpERWVnNFQwZWVtZDUydXM0ZHZ6bno0NzJZ?=
 =?utf-8?B?TjdXTmZJelZyckkvWWVCcXNiSllmLzJyRHRYdVdibHVNNnFTbnZHTWtzUUlu?=
 =?utf-8?B?d0QzZUpkTVBHdzdVQ2x3c2ZWVzNKblBzTUJ6WVFLQVp0eklqbW1QQUwyR0Nx?=
 =?utf-8?B?QjA4cmRKVTFZSi90SmlkNnhuYkNSWWoreEdaVlY3dEhlQUsvTTJNSGlIR3Yy?=
 =?utf-8?B?RUNtSTlJdHh6bnJKc1NWM1IzdTNweVpNSzhuMDAxbTZPWWNGdVEvdndRR1Zp?=
 =?utf-8?B?NmsxbFN2YTRXZW9HcFo2aVE4bTFhWUFTaXNaSysrSlFST0dvRXlUVVVvZDlN?=
 =?utf-8?B?VWxiVTdWV0NZK21Rb1A1KzJvRHNqUTI3bG9sbnhrV3c4djV6SUZXamJDNzNt?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1B0E381D437B14189D819661EF27D99@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e68850-c6fd-4ccb-4d6b-08dde17ff231
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 13:29:39.6386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XsXDyuTW+6l6SfTgv5NKBEGmvUBPYVY0EtLz+kv16T57Lvu9jvQnvxW23dYcXy9FgfXEhjDltnLI/8/wgBZ5za4L23ocE2ar8e2UP7G/g5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9425

DQoNCk9uIDgvMjEvMjUgMTI6MzUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOC4yMDI1
IDEwOjAwLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBNSVNSQSBDOjIwMTIgUnVsZSAx
MS4zIHN0YXRlczogIkEgY2FzdCBzaGFsbCBub3QgYmUgcGVyZm9ybWVkIGJldHdlZW4NCj4+IGEg
cG9pbnRlciB0byBvYmplY3QgdHlwZSBhbmQgYSBwb2ludGVyIHRvIGEgZGlmZmVyZW50IG9iamVj
dCB0eXBlLiINCj4+DQo+PiBUaGUgZnVuY3Rpb24gJ3ZjcHVfbWFya19ldmVudHNfcGVuZGluZycg
Y29udGFpbnMgYSBub24tY29tcGxpYW50IGNhc3QNCj4+IHRvICh1bnNpZ25lZCBsb25nKikuIFJl
bW92ZSB0aGUgZXhwbGljaXQgY2FzdCBhbmQgcGFzcyB0aGUgY29tcGF0aWJsZQ0KPj4gcG9pbnRl
ciB0eXBlIHRvIHRoZSAnZ3Vlc3RfdGVzdF9hbmRfc2V0X2JpdCcgbWFjcm8uDQo+DQo+IE5vLXdo
ZXJlIHVwIHRvIGhlcmUgKGluY2wgdGhlIHN1YmplY3QpIGl0IGlzIHNhaWQgdGhhdCB0aGlzIGlz
IGFuIEFybS0NCj4gb25seSBpc3N1ZS4gSGVuY2Ugd2h5IEkgZW5kZWQgdXAgbG9va2luZyBpbiB0
aGUgZmlyc3QgcGxhY2UuDQo+DQo+PiBGaXhlczogYzYyNmFhMWE1YSAoYXJtOiBpbXBsZW1lbnQg
ZXZlbnQgaW5qZWN0aW9uLCAyMDEyLTA2LTAxKQ0KPj4gU2lnbmVkLW9mZi1ieTogRG15dHJvIFBy
b2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gVGVzdCBD
SSBwaXBlbGluZToNCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZGlt
YXBya3A0ay94ZW4vLS9waXBlbGluZXMvMTk5MzA1NDIwMw0KPj4gLS0tDQo+PiAgIHhlbi9hcmNo
L2FybS9kb21haW4uYyB8IDIgKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4u
YyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4gaW5kZXggMzEwYzU3ODkwOS4uNjM3MWU2OGNj
NyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbi5jDQo+PiBAQCAtMTE2Niw3ICsxMTY2LDcgQEAgdm9pZCBhcmNoX2R1bXBf
dmNwdV9pbmZvKHN0cnVjdCB2Y3B1ICp2KQ0KPj4gICB2b2lkIHZjcHVfbWFya19ldmVudHNfcGVu
ZGluZyhzdHJ1Y3QgdmNwdSAqdikNCj4+ICAgew0KPj4gICAgICAgYm9vbCBhbHJlYWR5X3BlbmRp
bmcgPSBndWVzdF90ZXN0X2FuZF9zZXRfYml0KHYtPmRvbWFpbiwNCj4+IC0gICAgICAgIDAsICh1
bnNpZ25lZCBsb25nICopJnZjcHVfaW5mbyh2LCBldnRjaG5fdXBjYWxsX3BlbmRpbmcpKTsNCj4+
ICsgICAgICAgIDAsICZ2Y3B1X2luZm8odiwgZXZ0Y2huX3VwY2FsbF9wZW5kaW5nKSk7DQo+DQo+
IEl0J2xsIGJlIEFybSBtYWludGFpbmVycyB0byBqdWRnZSwgYnV0IG15IHRha2UgaXMgdGhhdCB0
aGUgcHJldmlvdXNseQ0KPiBxdWVzdGlvbmFibGUgY29uc3RydWN0IGJldHRlciB3b3VsZG4ndCBi
ZSBtYWRlIHlldCBtb3JlIHF1ZXN0aW9uYWJsZS4NCj4gV2hhdCdzIG1pc3NpbmcsIGF0IGxlYXN0
IGZvciBBcm0zMiBhaXVpLCBpcyBhIChidWlsZC10aW1lKSBjaGVjayB0aGF0DQo+IHRoZSBmaWVs
ZCBhY3R1YWxseSBsaXZlcyBhdCBhIDMyLWJpdCBib3VuZGFyeSBhbmQgdGhhdCByZWFkLW1vZGlm
eS0NCj4gd3JpdGUgb3BlcmF0aW9ucyBjYXJyaWVkIG91dCBvbiBpdCBhdCAzMi1iaXQgd2lkdGgg
KHRoaXMgaXMgdHJ1ZSBldmVuDQo+IGZvciBBcm02NCkgd29uJ3QgaGF2ZSBhbiBpbXBhY3Qgb24g
d2hhdCBmb2xsb3dzICh0aGlzIG1heSBiZSBwb3NzaWJsZQ0KPiB0byBjb3ZlciBieSBqdXN0IGEg
Y29tbWVudCwgYXMgeW91IGNhbid0IHJlYWxseSBjaGVjayBmb3IgdGhlIGFic2VuY2UNCj4gb2Yg
c3RydWN0IGZpZWxkcykuDQo+DQo+IEphbg0KDQpUaGUgYnVpbGQtdGltZSBhc3NlcnQgY291bGQg
YmUgcGxhY2VkIHRoZXJlOg0KDQpCVUlMRF9CVUdfT04ob2Zmc2V0b2Yoc3RydWN0IHZjcHVfaW5m
bywgZXZ0Y2huX3VwY2FsbF9wZW5kaW5nKSAlIDQgIT0gMCk7DQoNCmJ1dCBtZW1iZXIgJ2V2dGNo
bl91cGNhbGxfcGVuZGluZycgaXMgdGhlIGZpcnN0IGluIHRoZSBzdHJ1Y3QNCid2Y3B1X2luZm8n
LCBhbmQgb2Zmc2V0b2YoKSB3aWxsIGFsd2F5cyByZXR1cm4gemVyby4NCkN1cnJlbnRseSB0aGlz
IGFzc2VydCBpcyB1c2VsZXNzLiBQcm9iYWJseSBpdCBjYW4gcHJvdGVjdCB1cyBpbiB0aGUNCmZ1
dHVyZSB3aGVuIHNvbWVib2R5IHdpbGwgZGVjaWRlIHRvIG1vdmUgJ2V2dGNobl91cGNhbGxfcGVu
ZGluZycgb3IgYWRkDQpuZXcgbWVtYmVyIGluIGZyb250IG9mIGl0Lg0KDQpEbXl0cm8uDQo=

