Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F82D19D17
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 16:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201923.1517550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgBk-0006iK-Us; Tue, 13 Jan 2026 15:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201923.1517550; Tue, 13 Jan 2026 15:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgBk-0006gA-Rz; Tue, 13 Jan 2026 15:20:08 +0000
Received: by outflank-mailman (input) for mailman id 1201923;
 Tue, 13 Jan 2026 15:20:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMW5=7S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfgBi-0006Zt-Jo
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 15:20:06 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 554d04bb-f093-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 16:20:04 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5275.namprd03.prod.outlook.com (2603:10b6:5:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 15:20:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:20:00 +0000
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
X-Inumbo-ID: 554d04bb-f093-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwD0SjS28+HbEbFZk0cIs9ZgaTSObrxynUy4kA/tXVxzxCPmxW4sFOlxqgCSj0vm07Yh4cCA2wzMZhJsDonLC8KkPP3Bs8AXvIBNESz6og/lkQWqjIShQTvhKO+DblfQSGLrjpaHTSvLWZeLJ+Pdt4UNPwM+38e+mKDSZ86cLHSEJh20uUGFEEnAIMvO4DiN2emuXAedfT0OPc2uWcg+nFRLxrtefz7j8vtHRYrmfwCXNtGntdfFWNdixYNB+KUyYHoUBVpo2PXmHAiV7oi3w8pBLbutnl1Wi+YRK8wukoEHlkIpeMnoBCoYkETz5gh9qzGOUItjTcYWkkj2B58fxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et3bOKdU5PKLrpHylRAxFOQ4KZufKx7MSU6LrFLEpRY=;
 b=DAvi1zfkVwDWNnGYBZfRuOpCBZwSJaISkTJ+D/tQlJxi1uhLGcV+vPPHDiLgNfHGO6g4QQkFFDu+1/syxuADoxjaoBMct1UKBFAGxJFn5124jAakVtdX8bGMinXEfzFY/5C048K2WvGjOX5KzJUD1zVgxnn2VH25Asgh/MPugTzzNRMFYzjaI80eo/cUoW1kLAojoR1sbxQ3iDV+NIKTtP51CfLR5hiqEYCLIPSHPgHfVivK4a5gg0aV0dFRNWPhmzBy3UDwQmk3Lb2aATkOPK2TNg7FJk2/FiM8v1w2IfjdPMJOGllLd6fmDO+pY60rmUV2eFbaUUZTfWHPj5Wf0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Et3bOKdU5PKLrpHylRAxFOQ4KZufKx7MSU6LrFLEpRY=;
 b=aW5uKVx/Znimt0yJ9h+Dv6y0WOmYbBBVuKSlv4okuAR4y6IbGmMIlriCW38lC4Ad1c/7PHjKp58Us1Tb71slcIEhCz0HCkPrDl272U1Zh+eMThnV4X4g3M1eRCA5Kj+uu8pG/Ymvu44ppMc+cAQjngyXMkGSvFyVKVmMu9pPc9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e0c53bc2-f441-450c-bbd6-b070db25a504@citrix.com>
Date: Tue, 13 Jan 2026 15:19:56 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/4] earlycpio: lib-ify earlycpio.c
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
 <20260113122109.62399-4-alejandro.garciavallejo@amd.com>
 <b28be78e-2d26-4d9d-8288-7130a64deb5d@citrix.com>
 <DFNJUME4L1XB.3AUTF02P2QZ9T@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DFNJUME4L1XB.3AUTF02P2QZ9T@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0109.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::25) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5275:EE_
X-MS-Office365-Filtering-Correlation-Id: 0719d717-30bc-4a5c-7181-08de52b737df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzlnRjROdnBsMDlNclVDRXVuUHo3S1lOVldLdXVQQzhvKzZwMVNua1I4STEv?=
 =?utf-8?B?TkVhUzdQaFMrSzE2Tlh4MERncWlpWWNVaVhJdVBUai9RWFNZdXVCZU5xcVlo?=
 =?utf-8?B?RVBZcFhXYUVRcGpRSlBNK2pxL29KRS9DQmhIcC94VllOc3BoeDY1QkVkbEdH?=
 =?utf-8?B?VUdPeE1XSmRPRDRySVdHb0ZheU1jUVlzNlpvVXlvNnBMcFJTTy90WWxqUm5q?=
 =?utf-8?B?ZFVnZmNqSWdDSFRiQmcwbStVZDRrR1V0VmtUdUx6UmNkOG1KaFRvSzBOVEVy?=
 =?utf-8?B?cnUzQ2hlOUJxZVlOWDdEY2R3ekVINFZRM2NKL0l2OEdlV2ovdGtCTWdoOEti?=
 =?utf-8?B?cmkwYndzaGs2bU40NWxXS0FRSGNiNDE5U2dUSCtUc1o4bUpNa09rOTJLMVFL?=
 =?utf-8?B?NGVPSjlRMnl0bGRQU2Q5eEN0SHVwODlpWjBoSWRJYXdmNG54ejQwbElpQnJF?=
 =?utf-8?B?MFpGSHVmRU43dWdPNU11ODM1djQwYVVSY3l5b3hJZWU3c3lkaFVlMnNjMm9N?=
 =?utf-8?B?eEI5cjNvZ2tweXBqM3VpbEQ0TTJCbjhTU3VwSWV6OGl5amZHNXhyMW94blFh?=
 =?utf-8?B?ZUUyN1RNSkk3NzVOd1hvMlNrS3cvWXg4aW9SUVc0RU9DVFdTNW9LWFIvNWo3?=
 =?utf-8?B?cENqUDREaUZYUlNYMGhTMk5ueGwrY0x5bEE3ZXJGTERxcW9WZEpDRVNKV3Bm?=
 =?utf-8?B?ejhuQXpwS2kvaFd0TFhNQURKZFlQQ0hjSkJmNHREMWMrT0JDR1ZWL0VVZ1lo?=
 =?utf-8?B?N1Q5bDAwOXBwS2czajNrV3JHTjlLZlUxSHFteCtOZTUvei9Rc3M4ejhucHBZ?=
 =?utf-8?B?YTNEYy96Tml3OEtEWDhhSjNJOEhrUXVZN0dJZ2pOS0Fsb3hSUHRYSW5CQmli?=
 =?utf-8?B?T0dRREw2OWlWVXdXS0hMbzlZSU8rK2N0dEZYNzVnanc5aXhDdlUxenJWdVd5?=
 =?utf-8?B?QSs2TVBGUjJuMkRsMjRPN0s0U0VWNmFmbkEvVSsvbXJ0ODFNQjhDbkcvY1Jk?=
 =?utf-8?B?Zk1PZ01ZWDBOTUNuRUNMT0xJdG1uYkV0bEk5TjlVZkZobnFzNnJyVENZTGlV?=
 =?utf-8?B?aHgybUQwaTR6b3h1c2ZsSXVJNFYzVE1Wem1DNEtpUE9DZUMxSWpmZkxVOEUv?=
 =?utf-8?B?SnZ2RzFNS0dPcU5TQ0dCLysxYkZEbzR3MlRLcHZ4MkpZcjRrd0wzcDZlVENI?=
 =?utf-8?B?MVpKaXBZcUIzZHhwSDB2RGxlaUpac2wzNGdObmY0cS9GZG9rNnB4d3RtcW5U?=
 =?utf-8?B?aVZMVWNVNnRJT2dYbHpPalVKb01LZFlra2NIalVUcHhVclo0c3V1bVoraVdx?=
 =?utf-8?B?cnM3Z1EvZmdBbkZpUVNiaDZvUlJxQkQyZ0JiaHl0WjJSM0VySklVWENBWGN0?=
 =?utf-8?B?VnAveGRnVkF3ZUZ5SnVjQlBsUGYwdnIvQUNYa0VQeFU1TVpkRlFYNmdUOFd3?=
 =?utf-8?B?YU13cnRQY3lkQmtQbzdraWNUMG5sN0VuaS82RWcvcmRxT0JSajZzQWRKMFZ5?=
 =?utf-8?B?TUNPcmFHOVJsTkc2bEluWTRHS1A3bFBTMzF0bmJRRndkZEpzZHlPV1MrbXVQ?=
 =?utf-8?B?RHduUEp6MVJPR2J2NFJEdTZPTEFTM2hhTHFvZ2YyTEsxWm5LNjRqM3hGaS9o?=
 =?utf-8?B?Nlk0YXl4MjcvYVpKZ09LRnRpeGpPeTZlNkdDVWtoR3dwSzRHQktOVVVNSGl0?=
 =?utf-8?B?Q1cvdDREWjc4bGpZTnhhaHdOamFUaHprUmxzT1NGTkhnRnRDMk1peThVZUtJ?=
 =?utf-8?B?K3grQTA4U1NLNWk2N3dIVXdzK3hGODA5RFpQWiszRFdCd1lpYklHQ2VCU25M?=
 =?utf-8?B?QXBodzdHUUZJQ2hQZEExWndJRC9udU52YXAyVmdBTFgwVmxpYWNwbmptcER5?=
 =?utf-8?B?THM0SjJkeVVCRkl1ckdqTWJHQytUUlYxT2pTQm5NK0k4cHFtblZyNFhEZlZk?=
 =?utf-8?Q?6qxf3jELIrDGJ74uhvJdtcCpl08zzsY1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGpIZWZnUUgxbm1qZjdVMCswUHoraXZWWExRbkpKOUQ5OFlsRHhwRGhUSHhl?=
 =?utf-8?B?eHViMC9qMWlRNElDTDZLVUZhQjdNemZrVVQ2QUhPODVKRkJaMVhtMHB0K0dv?=
 =?utf-8?B?Tm0zaHdwTzhlbEduLzRUcXQwSld2Q3ZCbjIxQ2VuMGhxVFJmeDNoSE1XK1Ri?=
 =?utf-8?B?b0pJZ1orN20vdUJCS1pLbGc2WDJCQ1ZNYVpCQ2hWNlVaM3pwYmdNMVdkN3dJ?=
 =?utf-8?B?UXhJc0QwN0kwSHAzbWJlUVFya2hvaHRVMWpreHZSQ0hyRXNCcG53S00wMWVU?=
 =?utf-8?B?bWE1R1lVeGVQandpdHowNXk4Ym1MTDBvRldaQksxTWNYVk9WYzVlazhVTmtv?=
 =?utf-8?B?UlJzMDNsdmR5bDA3UTYwUDVoL245dGxsdkJGazNFV0lSWjNLWWl6Wm5mSVB4?=
 =?utf-8?B?V1RjUWs3SThQUHNmb0tiS1ZHQTdxMzlDQlByaVVrdTgwWjBVN1ZuVnJTRURP?=
 =?utf-8?B?cWxyNHd3VWI0VUx3clpBdFk5cmUzWmhNbytTN05QZStWMkgyZyt5TXJuTzB0?=
 =?utf-8?B?ZStNK1dHcFJ3T1pMaDFuQ0RkK3dCai9XajE5QjlKQkYyUldRdFpTemVwWFh2?=
 =?utf-8?B?NFhwczRueEFzS042aTJ3elArUXdjdHU0dDdqVHNCOUJkZG1RRTUrUjhVOGlS?=
 =?utf-8?B?UnhwUk95ckdhM2pENW5ZOEhlVGw3MUFrSjQxalc0M3FFQ3pGcEdVUVkwRkZ5?=
 =?utf-8?B?Z3VhWE5EUFJVWFcxVEZqSy9yLzR0ZlM0bmY5bVhuUkhIUGp0NVpaTHVnZ1FH?=
 =?utf-8?B?R3pPNWtDektENCsyWlV2TnVuWEhMOHY4cVBzTFNsZk9JaElLVU9pejY4c0ww?=
 =?utf-8?B?MzZZSFR2b3lEMy9LdWRkQmpxZUNESU1CaVB0WEhzK0RWcHRUQTRzS2k1L3Zk?=
 =?utf-8?B?a2tjMmlOUHM5TlRhdkd4V1o4MWdJTUZtR0VUcW05MzVjYnQweUpicFV1b3JK?=
 =?utf-8?B?bEs2b1A2eDBGTjVId1EzNVJPUUtYY2ZHcUlLTFJIclZhM2s1TE55UnN5aXY0?=
 =?utf-8?B?bjFEYk5uQ2Z2SnVHamRIQy92WXZmS1hUTHVOQ2ZpM2RMek5SKzk4N3d5cklZ?=
 =?utf-8?B?Yi9OcGpBRFkvYWtjZTY3ZFE1cHhKcjRiNS9Ta1R2ZGpES1hrYVVqM3YzL3Ir?=
 =?utf-8?B?N3VIWWpoSC83TEUwRUhTd3NTZVpPVmNQcGxxOEFrN1YydDZrSjBFUU81Y1ZP?=
 =?utf-8?B?c2p4QVRuRjlzcDFCRVltQ2lGdE1QVDhiNTdueCsrZnQzbVI1d2IvZE95Z1Vp?=
 =?utf-8?B?eEhMUGc3Y3ovU3RvYi9qSFlrNW4wZFhPcWpJUWdWcDZTTk5HRlAwRnlNZXVm?=
 =?utf-8?B?VDBwRDFCeDFuOENWWUpJS1dFQURuYUVDT3cvMUxhREFpTUxXVEpjYjQvaWYw?=
 =?utf-8?B?TEJlZEJsdU1jMTR1OWFXakVFS0N5L3J0bmY2WGRyOGYySVZsZmZsZHNMTmtG?=
 =?utf-8?B?QXA4L2U5QVlZY0VpME9YWDh1S20rSUt3K2pFdlQwcGdDdm1xSjZFZHh1TFJW?=
 =?utf-8?B?bzNBQ1o4OUI0S2hXZXpkWExLcHpHa3MzODhNdExVZXY3N0ljYmRuNFNmeTlq?=
 =?utf-8?B?OXBPdXphU3RScmxaUGdTYThvWkcweiswdXRWWGdwZDNkOHNSYzV4aUZBYnAx?=
 =?utf-8?B?SUtBRmFaZTZYdStOMXpsekU4YnVtM1VUbmgzaUFmYVdPa0MyK2E5VDErdmh3?=
 =?utf-8?B?Y2U0Q0RWNUpIaUsxQTZ2eERwcFNyMGNta1VxZDlBTkJ0WDN5RFNsMFZCWHNh?=
 =?utf-8?B?L3Q1dXEvNTYyZ2Z3YWt1TzBkakdPWFNkOFdZWWJYZDJMNG9pdHVYVmxJYUxO?=
 =?utf-8?B?TzdjOGR2WnFYMHpVeHRQUTc0dVN5TG5XVy9vTGR2SElYdHVlNzdLc2R1NmJy?=
 =?utf-8?B?eHJCbExPTTkraUdSZU0wb0NCeTJKaGtMUjQyQmF1ZlRUanNQM0pRUU93eGlR?=
 =?utf-8?B?NEMyMmhXVFZsblFTTUhybEpLd2pmcW0xMExVTjFrZnVockZMc0grSkRYTlh1?=
 =?utf-8?B?eDg0WlU1ZXRiZHFSZWdyaDNuUVFTdlc2dzFHL1ZuQ2xEanlKQXg5ZmU2UWYx?=
 =?utf-8?B?TkU1QWdxRk1OUXE2MHdkczZ1SXc3aTM0VkVzR0VRVVpza0lYdnNLZUEvcTVz?=
 =?utf-8?B?YW0wU3BCN0N2U1VXZWRwVlhyQXlNckdCVXpCNk1NdzNhS2J1V3U2OEhjZ3pn?=
 =?utf-8?B?MnVzaCt0Nnl5K0F1VmNndG5KMVFLUDRJUnJickZvVUN3eEl0ZFk0TmdtVnBS?=
 =?utf-8?B?WU1zZEYwNnQxeVRYT1J0K05RS281cjc0a1dHMlRmU1BGRGYyMGFMbG1CQlIx?=
 =?utf-8?B?MUtyQjlpOWJvSGJYa1VSMzJwUGVTblZPQmJ2OFBoSFBnTWJKNkRqTCtmYm5H?=
 =?utf-8?Q?lUTRVAG8xjCXVA5E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0719d717-30bc-4a5c-7181-08de52b737df
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:20:00.3677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5obzAMvYOrhPzMq/byW91xRjJYhCNEguuYLpG47fppxLiYbY7Hu7z0b0A6CkE9UTyhEvouptMRsMjgFmhlTZ3wRdPMEdZmHMaLP1NAKQw1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5275

On 13/01/2026 3:00 pm, Alejandro Vallejo wrote:
> On Tue Jan 13, 2026 at 3:24 PM CET, Andrew Cooper wrote:
>> On 13/01/2026 12:21 pm, Alejandro Vallejo wrote:
>>> It's only used for microcode loading on x86. By lib-ifying it we can make
>>> it go away automatically when microcode loading becomes an optional
>>> feature in follow-up patches.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> ---
>>> v3:
>>>   * New patch. Subsumes earlier conditionalisation of earlycpio.c on
>>>     CONFIG_MICROCODE_LOADING.
>>> ---
>>>  docs/misra/exclude-list.json    | 8 ++++----
>>>  xen/common/Makefile             | 2 +-
>>>  xen/lib/Makefile                | 1 +
>>>  xen/{common => lib}/earlycpio.c | 0
>>>  4 files changed, 6 insertions(+), 5 deletions(-)
>>>  rename xen/{common => lib}/earlycpio.c (100%)
>>>
>>> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
>>> index 388397dd3b..2b874dfd3b 100644
>>> --- a/docs/misra/exclude-list.json
>>> +++ b/docs/misra/exclude-list.json
>>> @@ -121,10 +121,6 @@
>>>              "rel_path": "common/bunzip2.c",
>>>              "comment": "Imported from Linux, ignore for now"
>>>          },
>>> -        {
>>> -            "rel_path": "common/earlycpio.c",
>>> -            "comment": "Imported from Linux, ignore for now"
>>> -        },
>>>          {
>>>              "rel_path": "common/gzip/*",
>>>              "comment": "Imported from Linux, ignore for now"
>>> @@ -225,6 +221,10 @@
>>>              "rel_path": "include/xen/decompress.h",
>>>              "comment": "Imported from Linux, ignore for now"
>>>          },
>>> +        {
>>> +            "rel_path": "lib/earlycpio.c",
>>> +            "comment": "Imported from Linux, ignore for now"
>>> +        },
>>>          {
>>>              "rel_path": "lib/find-next-bit.c",
>>>              "comment": "Imported from Linux, ignore for now"
>> Honestly, I think this needs simply dropping.  "ignore for now" isn't
>> going to cut it with any competent evaluators.
> That would depend on justifications and such. But regardless clearing the
> exclusion list is a different matter aside from removing microcode loading.
>
>> By libryfing it, it's no longer part of the AMD target build, but it
>> does want covering by *-allcode.
>>
>> Given that you noticed it for v2, I presume there's something in the
>> file that Eclair doesn't like?
> I didn't run Eclair on it. It's ignored as part of common, and the build
> fails in CI if the file in common is absent. That's how I noticed it.
>
> I'd rather not gate this particular change on earlycpio playing ball with
> Eclair.

I'm explicitly not gating it.  *-allcode is non-blocking, but I want
earlycpio being scanned.

Simply omitting the second hunk should do this, and not explode the AMD
target build.  (Once this patch is reordered to the end of the series.)

>
>>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>>> index 92c97d641e..4fc0c15088 100644
>>> --- a/xen/common/Makefile
>>> +++ b/xen/common/Makefile
>>> @@ -65,7 +65,7 @@ obj-y += wait.o
>>>  obj-bin-y += warning.init.o
>>>  obj-y += xmalloc_tlsf.o
>>>  
>>> -obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
>>> +obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd,$(n).init.o)
>>>  
>>>  obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
>>>  
>>> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
>>> index efca830d92..60cfda4dfc 100644
>>> --- a/xen/lib/Makefile
>>> +++ b/xen/lib/Makefile
>>> @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) += x86/
>>>  lib-y += bsearch.o
>>>  lib-y += ctors.o
>>>  lib-y += ctype.o
>>> +lib-y += earlycpio.o
>>>  lib-y += find-next-bit.o
>>>  lib-y += generic-ffsl.o
>>>  lib-y += generic-flsl.o
>>> diff --git a/xen/common/earlycpio.c b/xen/lib/earlycpio.c
>>> similarity index 100%
>>> rename from xen/common/earlycpio.c
>>> rename to xen/lib/earlycpio.c
>> What's wrong with .init here?  There's only a single string which will
>> end up unmerged so I'm not worried on this side of things, but we now
>> have series doing safety things getting tangled with .init and I want to
>> get it fixed.
> .init.o doesn't work with lib-y; only obj-y, obj-bin-y and extra-y. See below:
>
>   $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
>
>   [snip]
>
>   non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
>
>   [snip]
>
>   $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: $(obj)/%.o FORCE
>   	$(call if_changed,obj_init_o)
>
> That's just what I eyeballed. There might be more hidden elsewhere.
>
> It might want fixing, specially if something like libfdt is to turn into
> a library. But it's just not relevant for this particular change where the
> single contained function is already __init.

*.init.o does two things:

1) For things we can tag, check everything is tagged
2) For things we can't tag with __section(), such as string literals,
move them into .init


Fixing lib init properly should just be a case of sprinkling lib-y
through those places you mention.  If you want me to do the patch then
fine, but I want it fixed rather than keeping on going around in circles.

~Andrew

