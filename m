Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO6kJWDAiWk/BgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 12:09:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C268410E83E
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 12:09:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225253.1531722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpP7s-0003rj-Pl; Mon, 09 Feb 2026 11:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225253.1531722; Mon, 09 Feb 2026 11:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpP7s-0003ou-Lz; Mon, 09 Feb 2026 11:08:20 +0000
Received: by outflank-mailman (input) for mailman id 1225253;
 Mon, 09 Feb 2026 11:08:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpP7r-0003oo-1e
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 11:08:19 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a261800e-05a7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 12:08:17 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7090.namprd03.prod.outlook.com (2603:10b6:510:2bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Mon, 9 Feb
 2026 11:08:13 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 11:08:13 +0000
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
X-Inumbo-ID: a261800e-05a7-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMTeuxnQC1YeIxOldDicTO9vRjogeSIljvlOACgrec/gyLylK6pOXXedsU4TQt4MfD3l+WBVuwQzbnTEmD/jzg15bsLIjm/dQR7fy0wb2wOwW3B7Xo6+YMZHVbwh+hnRVUvlXSIJ4IkAMRYOyYV2S6bcHr7jg0rfSactrXCC3IRnLQAeAhw++HtfdfxQneI5kbYymgFzQWQ3V1Of9/L5evL+0rTe8NJ3XCBeZMqNDVhvQ5Q3U7WBOcHQmr+CLg5+U3cedKyvIBxwn9CLr6tj3mo31KNiQ5xBF5wfB5i19+Q/v7AuaV6XPXHyeWFxWD9ygQtYxwOJvk2Q3NeTagcGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLyt3rstWdbzGbUzjnhs3wNAHQ6Vf4gniKPk67c6Mz0=;
 b=VgxyY/PF5Mb9Iz+kJd9BABJApH0oE53xncbibs3URAzQk5Xl1yJHbYYZ1or4oNYodS8D31dot4d1QGppHdHDxtSs8aZ98KzPYGwJPm15Ivq4MO1M2CereLETkObxwgriWImeHiukB8k/x+ImKStzDt0VVq3PVm/jh/5zHUfenclBZBV8oADlntt8ztxW1+8sN+dRs5U99992xcnzhH5Ja9oZ1w8mvN7mUYPKvUSR++n70PpPw5s7N3p5WFJQbPjdgOiEIUC4k/PcXAwvZRzpSslWFc4Fz7WhdAWbjil51PecZvfpiQufot6u02Xub+AyM+HTF2aSxCnA+4PnWujRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLyt3rstWdbzGbUzjnhs3wNAHQ6Vf4gniKPk67c6Mz0=;
 b=aU5tOPN4F/nUzxK4UM5Kb2VkyyD3FNUXBK8HNRgVTOFZ1nsKSyNLz8YyYe9UT1D7OfS5tDzkXO/4kDvVAI83wBls39F0ufJm/ex0uOJhNJqRwfFn41eIFdNQGhpGt3iJQsmmQ5s58BXM3oGwflcG2bayxkZzeHGzgO5ZCeOVTww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 12:08:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
	andrew.cooper3@citrix.com, jason.andryuk@amd.com,
	alejandro.garciavallejo@amd.com
Subject: Re: [PATCH v2] x86/hvm: Add Kconfig option to disable nested
 virtualization
Message-ID: <aYnAGQa56yvDoN0M@Mac.lan>
References: <20260206210554.126443-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206210554.126443-1-stefano.stabellini@amd.com>
X-ClientProxiedBy: MR1P264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b51107-3276-482a-418d-08de67cb8470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2JoVFNFTDFwa1RZaWw2K1NRUHE4WjNkZGdiL0owL1lVQVpiUlVkYUlyTU9O?=
 =?utf-8?B?dGNFRlgwYzJyZng5bUFEYjRkZm00M0JtSktXVzJ3ZVlRS3czQWczOXhoZ04r?=
 =?utf-8?B?MSt5K3RNWExWTE9XeUFSVC9nQStXYXgxQ09mMlM1aFB2MlNyZFlFNmxyS2pS?=
 =?utf-8?B?YVF0em83bU9BbUp3aGVIdkRGMHBWdGlVSm5FeUFhL2p4cjh4MDdyRzZhWkFi?=
 =?utf-8?B?bDZSYmZTNEFwb0RBa1JRZ2pxK0F5RDBuTmFOZE5LSEZQbTFldm54MjRLcGUv?=
 =?utf-8?B?dDBWVk1JVlpaU0pPYk9nK092blZPNTFsV1BPOTg1cHpscCt3S2FrcHpMbWtR?=
 =?utf-8?B?WUY4UGZLMGwvQWR3bDlCdy9JaytxdXNuM1Y0VEYvaHNQazR5SE1pMGtWcGZy?=
 =?utf-8?B?Y01FRkZzUTY4UGhjMlQ4ZVBFbm93Q3p0TjZ4VWJZVElyR2VCTlR3R2NGWWJl?=
 =?utf-8?B?RWd1UWJKZkhpNjRaZHBzd2dlTWYrWEdTTlFXVWRxSGFXeVZaTUJqQmtSS2VU?=
 =?utf-8?B?WkNpS1NveWE3ZEgxZzF2a1pjMlBOSG9GS2JLNTl4R2FleGh3WDhpdVFSQ25P?=
 =?utf-8?B?Y0JKRmRIQkNQWDlXMWZwM2N3U216OFhmdHF2UVQzdFY0S08rRSs3NDlsZjNW?=
 =?utf-8?B?S25TY3JtQ2s5cGRUVEJYaUJtT1RXaGlwS3ZmVFZNRHBhQXR1NlUxQjlJbzVa?=
 =?utf-8?B?d1FBRFVHOTQ0UU8vUDFVQzVaZmRtTUJYQUVKR2FVdE5Xa09OaUFmSWVUSDZz?=
 =?utf-8?B?NWhRVHVlV052enRGVHpMZ0FrL21ZeUk2MUY0NGJFRjlEeHMwWmg3M0tSSDdw?=
 =?utf-8?B?cUVMSkdoK1dHYkVjTHo3bGRKY1ZrbDdXcW8ranBFekF6OU1UeGFQMzVyY0tP?=
 =?utf-8?B?QjVxdVJ3dHJHMW9kelJiMUhjejU2bmh6Q2hIcTZVWHJYMkR6Y2JPUWxFM3BD?=
 =?utf-8?B?eWtRSDFkMzRIZzhFS1lVMEtWUnowUCtVZytQcjl4TDA3V1k1UUhNOEY0S1Fk?=
 =?utf-8?B?NFJ5Vk9WWVZONnBuVXlPR1VXUDhVbFNvSWNKaStNeThrck5oT1RlQXpSRE5D?=
 =?utf-8?B?aDZCT1FmaitQUFhnUTNRVk5kTmNmZi8xbTA4U21RNVlqb3V1UHBmZFp5MWZX?=
 =?utf-8?B?K01mMldyK0dqN05UMDlPNUdoUVZidVovV05uV2VEM3hXdk9WNWhOK0h0Q3BH?=
 =?utf-8?B?cWxIRHRQVkswS2pvS0IwNk5mU0k2TzVpOXBXY2IxSGJndENXR1BhaDFUL1Nn?=
 =?utf-8?B?NXgxa1ZmVVV0aTdZS2FwTU9EUFIrSDRRMC9lcGZBUkNyKzE5c2F6cjdNR2hi?=
 =?utf-8?B?d3VyQ0pnNy9MbFdPTWFtbFJ4SXA2Rit3NmNoTU1LV09DK3M4VHNJdE43NzJh?=
 =?utf-8?B?Ti80ODl5d1Q0L1FHQnNxVzU3NGErZjcvdTlTM3RpVkxGaG9VallQMmRDQ2dr?=
 =?utf-8?B?dVhLUnNNUTRQMitTdEt6MktHc1RzeDJ6WFBWZHIrZU1ndjExd0lLdTRpbi9B?=
 =?utf-8?B?YlU1OUdoNi8zaVdVSXU2c01EREhTWFBmOWRueFlsSHgwSHVlNC9RWWc3cGZD?=
 =?utf-8?B?NXBGNFVYTWVIZ1gwMTFSMWdza1hZanNSTi9vSnE0NnBMYWd2QmFMdmgrVWt1?=
 =?utf-8?B?bUc2ckJua0FET2RkSzRDQXRUN1htcjZYNjNzM3dpYjNJTUk3aUorTmpzL3JS?=
 =?utf-8?B?QkdlVEttQlBKSURMdnJycGN0dmpsNWk0UW5naFVMZE1wUlZmVVFyYlZLL1ZI?=
 =?utf-8?B?QWprNHFiRmNYQjd3NERkSWhYMFRLRWFJd0NPODd4SzQ1R2dGeWVWeW9SVWlG?=
 =?utf-8?B?NWNrS3hJZ3BxMlNhRXBOanRDUmhFb0Y1RzN0dVk1Q05zMFJMcHBhQ3E3SCtO?=
 =?utf-8?B?VVd6Q1BHV1lsbVlNSlRFUi8zeTREeXk5VTZiTzU2VWNENk9xcDNqaFgySzAx?=
 =?utf-8?B?YW14VktYaUw4MDZlaWpML3FrWlorNk1wcFNaT3dTcDdLWWZWajAvYTV4Tm9l?=
 =?utf-8?B?cDJQMGhHZzRnaitqek1yZy8zcHhQY3NKc2JoWkNIWVhKOG1uc2diaGxDdnVT?=
 =?utf-8?B?SEZJMGh4d1NlRFM0YmV6TE9Pb2RwZ1J2L3o3Tlplb2VXL05sKys1ckphd091?=
 =?utf-8?Q?nwiQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVdvK1I0NGhDczl2MjczbGxVVVRkREJMYUxqL2VSZFNKdHNDSmZaVmVRdWM4?=
 =?utf-8?B?YlNKZTE0aHl5MU9wWWZZRXVjOEI5Sko0VDB1YkRZWlVCbjNtMFN3OTE4dnZk?=
 =?utf-8?B?Qm9pcjhtOFA1Rml2NjZ5WkpTTzNPQWpGUC9Kc0ZZZ2M5MDlFc0EyN3o0RVlM?=
 =?utf-8?B?cDE0czcvRkYrQU9kdHRtOVZaRjlmTWQvWldsUEw0azFiMzZOVlhvQkFBTFo2?=
 =?utf-8?B?Q2twRTBxb0dpb0g2eFhxL0FOQ3JQOVJOcXBKZlBFYmtIRFR2ZnJzNUlBTUJ4?=
 =?utf-8?B?VmY0RE44aWRIQlYwZXBjQ3dTQWI3N0dGekFOaVo5SFAvRUt3c2wraHhYTDlt?=
 =?utf-8?B?QklzTnBOSnQ4by9YZW5qSnFoMk1NYTlTUEl0ZFVXY3hKWmFDbjYwcDdjUUky?=
 =?utf-8?B?QXd6NGRzOG1rUS9kajVQelZTZ0FiblJNdWE4c3ZCczZSQlQwSlc4NVBDSjZQ?=
 =?utf-8?B?dEowTGVWeVh0bk5aU0NtblNrSW5vUUJsUDh1N0tHVE5Vb3RVVXlIOHkyWmxL?=
 =?utf-8?B?bGtxdDN0KzlpVTdIR3VUbFd4bjhIbHkxRHArWUJqTldwTVUvQ0pLZzBSbjlD?=
 =?utf-8?B?S1I5amRaWitTN3pUZHlkMjVYSS9wSEJwRHpPTVgwd1FBellLY0FBUWx4VzFK?=
 =?utf-8?B?NXdFWXpLNGl5aXhiZCtqZ29wcUxsbE1xK1RPVDVTRlF0SGdhZkNmZUJSYndk?=
 =?utf-8?B?MURHd3pxMzJYK0NvaGpCRVV4NldDbHM3YlA1dm5CT0tYd29sNkxZS1ZuUG1G?=
 =?utf-8?B?aFBhYWJCZ0tDQlQ1TEFNdW1KSmVWTnNpQkYwb1BIeXhuU1h0MTZZbklCaTZX?=
 =?utf-8?B?amV5QjFUZmFMR0JFa3V6Mi9QdG1BcVJCSXVteXBRdHhkWk8zWm53WjhIUngw?=
 =?utf-8?B?SHFnSEtvZUhPL1BhVWE2ZEVkWGlsU3QyL2dkdUlQLzM2SXdTb05yRGg1WFVy?=
 =?utf-8?B?TmdnVGhSSkNyM0tzOGY5d2YzYmt5VGxSdGJZLzJmamN6elRQWktHcjI1eFRL?=
 =?utf-8?B?ajlsTW5nNllQS3cyclJlTjgrZTRKcDRZbnVzbTkwUldEenFNOUp3VDVTa1ZF?=
 =?utf-8?B?NDVVakRLT3VwTk9CZDV2d3lBTHF0SXZUc2VId0ZETHNGcWxPSG44WHVqaUFH?=
 =?utf-8?B?N2NIMGFYbWhaUWN2MHdnY3VRMkk1VHROblgrOFhzU0FFMFZNWnR2d1d1NUpV?=
 =?utf-8?B?d3dxbmpDSTM1UG5xMXoxdTdYaisyUWN3Vi9XaW8vbHNQRGoyT2Vocng3R25T?=
 =?utf-8?B?Z1hNTkVUc0cvVDMrTU01dnBSaUtNSXE1Qmd4d0tBaCtaZE5EUlU1S2xuREU3?=
 =?utf-8?B?Q013MHJ2UzdvOGRQM0xOZ1JWSVdoTWJnaU5hRTVVZmtDcE1zbUpZWDZJYnhs?=
 =?utf-8?B?WnByaFgxQnM5b2dDTk1yZ2xaTlpZZTYxSjU3S1BybGg1ak0xenJzOE1zNmo4?=
 =?utf-8?B?ZzF5Rjg5YVNHbHlLdEgxak9OZ285K0EwSDZibDg5RVRNRG1MR3BKbE5RcVlY?=
 =?utf-8?B?dTFZNkNEKzI2cUxaa2xUNWhsT1JnS1RFNWpyVlU3SVYzekZmRU90ZFllYS9V?=
 =?utf-8?B?b3VJYko4YzdQRmYrRzZjOG8zSW50OGJibm9JVmp3M3BIRFJHRzZtN1lZUlFI?=
 =?utf-8?B?KytZb0t4blh3ak8rWWNIbkdsOUJrUTlDYjZlK0t4N29LbkNlTHZWbnlQZkJS?=
 =?utf-8?B?YkliOHFMdHhpWVdyL3U0RFVZV2JKbnhZOVFGOHZNb0YwMDFzRHoyZDdSTEh5?=
 =?utf-8?B?VGx2UHBIdStaSjhrMHJNWUUzZ3JIRkU4elJBYmpycitJZWNOZnpNdHFRTlBh?=
 =?utf-8?B?ZzAvMGVTNjdocEVrbjFrYzJ6aUgrVkxwN1dGcFJ5S2x4TDlWaktDMFc2Z09h?=
 =?utf-8?B?ZjY0WnpnWW1FOXlzenIwZW9DeUtHOGxpT0tTY1ZNRDJha1NuNTNheHNUWm94?=
 =?utf-8?B?a091SlNGeTJaUVJLajVNdlMxdkFnbEc5VHV5WG40N2VBUExSdHVMUW9vNUVx?=
 =?utf-8?B?Qmh2TWw5Wmhmb1Z6dUM0VzUzeUdoVkVxV3ptSkcrMDdyZ3RyTUNMM1V0ejhD?=
 =?utf-8?B?aDJkZG5qODdFajZuNnRLTEJZZDVYMVh0c3VLSFFMbXdqTzQrRHJoRVpPbVdI?=
 =?utf-8?B?K1g4amsrb2tOYzdUN3BGWTh2VzZtTXB2V3lMK0xMVk9hblM2V0M3UzhJdW0x?=
 =?utf-8?B?V29wWUtXeUpSWXBFT0xvQkdiZFduV1QwRTFlWUpBVmd0bDFybGsrUkRKTFJW?=
 =?utf-8?B?LytmeUZqeG5aVmx4VUszVTUxbGFlZTZiR3g4SCtoKzZISUxpWmlwQ0VtakhJ?=
 =?utf-8?B?ZzRDdFJha2Nxb29MblA0VFdWMFdHTms0OGlqM3RwdmIvNUppejNWUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b51107-3276-482a-418d-08de67cb8470
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 11:08:13.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yPeX60Egh0wpGjM3Ing73MPa9HvbgAQfITAFv6CEgAP8C3aTRXvdBl78+mFeMNiOfT62wUh+ldMAxYXxtAAMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C268410E83E
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 01:05:54PM -0800, Stefano Stabellini wrote:
> Introduce CONFIG_NESTED_VIRT (default y, requires EXPERT to disable)
> to allow nested virtualization support to be disabled at build time.
> This is useful for embedded or safety-focused deployments where
> nested virtualization is not needed, reducing code size and attack
> surface.
> 
> When CONFIG_NESTED_VIRT=n, the following source files are excluded:
> - arch/x86/hvm/nestedhvm.c
> - arch/x86/hvm/svm/nestedsvm.c
> - arch/x86/hvm/vmx/vvmx.c
> - arch/x86/mm/nested.c
> - arch/x86/mm/hap/nested_hap.c
> - arch/x86/mm/hap/nested_ept.c
> 
> Add inline stubs where needed in headers.
> 
> No functional change when CONFIG_NESTED_VIRT=y.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - add ASSERT_UNREACHABLE
> - change default to N and remove EXPERT
> - don't compile nested_hap if not VMX
> - add XEN_SYSCTL_PHYSCAP_nestedhvm
> - add IS_ENABLED check in hvm_nested_virt_supported 
> ---
>  xen/arch/x86/hvm/Kconfig                 | 10 ++++
>  xen/arch/x86/hvm/Makefile                |  2 +-
>  xen/arch/x86/hvm/svm/Makefile            |  2 +-
>  xen/arch/x86/hvm/svm/nestedhvm.h         | 60 +++++++++++++++++++++--
>  xen/arch/x86/hvm/svm/svm.c               |  6 +++
>  xen/arch/x86/hvm/vmx/Makefile            |  2 +-
>  xen/arch/x86/hvm/vmx/vmx.c               | 10 +++-
>  xen/arch/x86/include/asm/hvm/hvm.h       |  2 +-
>  xen/arch/x86/include/asm/hvm/nestedhvm.h | 52 ++++++++++++++++----
>  xen/arch/x86/include/asm/hvm/vmx/vvmx.h  | 62 ++++++++++++++++++++++++
>  xen/arch/x86/mm/Makefile                 |  2 +-
>  xen/arch/x86/mm/hap/Makefile             |  4 +-
>  xen/arch/x86/mm/p2m.h                    |  6 +++
>  xen/arch/x86/sysctl.c                    |  2 +
>  xen/include/public/sysctl.h              |  4 +-
>  15 files changed, 202 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index f32bf5cbb7..133f19a063 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -92,4 +92,14 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on INTEL_VMX
>  
> +config NESTED_VIRT
> +	bool "Nested virtualization support"
> +	depends on AMD_SVM || INTEL_VMX
> +	default n
> +	help
> +	  Enable nested virtualization, allowing guests to run their own
> +	  hypervisors. This requires hardware support.
> +
> +	  If unsure, say N.
> +
>  endif
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index f34fb03934..b8a0a68624 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -18,7 +18,7 @@ obj-y += irq.o
>  obj-y += mmio.o
>  obj-$(CONFIG_VM_EVENT) += monitor.o
>  obj-y += mtrr.o
> -obj-y += nestedhvm.o
> +obj-$(CONFIG_NESTED_VIRT) += nestedhvm.o
>  obj-y += pmtimer.o
>  obj-y += quirks.o
>  obj-y += rtc.o
> diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefile
> index 8a072cafd5..92418e3444 100644
> --- a/xen/arch/x86/hvm/svm/Makefile
> +++ b/xen/arch/x86/hvm/svm/Makefile
> @@ -2,6 +2,6 @@ obj-y += asid.o
>  obj-y += emulate.o
>  obj-bin-y += entry.o
>  obj-y += intr.o
> -obj-y += nestedsvm.o
> +obj-$(CONFIG_NESTED_VIRT) += nestedsvm.o
>  obj-y += svm.o
>  obj-y += vmcb.o
> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
> index 9bfed5ffd7..ed1aa847e5 100644
> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -26,6 +26,13 @@
>  #define nsvm_efer_svm_enabled(v) \
>      (!!((v)->arch.hvm.guest_efer & EFER_SVME))

I wonder whether you also want to force this one to return false if
NETSED_VIRT is disabled.  That would likely lead to more DCE by the
compiler:

#define nsvm_efer_svm_enabled(v) \
    (IS_ENABLED(CONFIG_NESTED_VIRT) &&
     !!((v)->arch.hvm.guest_efer & EFER_SVME))

>  
> +#define NSVM_INTR_NOTHANDLED     3
> +#define NSVM_INTR_NOTINTERCEPTED 2
> +#define NSVM_INTR_FORCEVMEXIT    1
> +#define NSVM_INTR_MASKED         0
> +
> +#ifdef CONFIG_NESTED_VIRT
> +
>  int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
>  void nestedsvm_vmexit_defer(struct vcpu *v,
>      uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
> @@ -57,13 +64,56 @@ int cf_check nsvm_hap_walk_L1_p2m(
>      struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
>      uint8_t *p2m_acc, struct npfec npfec);
>  
> -#define NSVM_INTR_NOTHANDLED     3
> -#define NSVM_INTR_NOTINTERCEPTED 2
> -#define NSVM_INTR_FORCEVMEXIT    1
> -#define NSVM_INTR_MASKED         0
> -
>  int nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack);
>  
> +#else /* !CONFIG_NESTED_VIRT */
> +
> +static inline int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -EOPNOTSUPP;

I think this is guest-reachable code even when nested virt is build
time disabled:

VMEXIT_VMRUN -> svm_vmexit_do_vmrun() -> nestedsvm_vmcb_map().

I think you rely on nsvm_efer_svm_enabled() always returning false, as
all calls to nestedsvm_vmcb_map() are gated on nsvm_efer_svm_enabled()
returning true.

> +}
> +static inline void nestedsvm_vmexit_defer(struct vcpu *v,
> +    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline enum nestedhvm_vmexits nestedsvm_vmexit_n2n1(struct vcpu *v,
> +    struct cpu_user_regs *regs)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NESTEDHVM_VMEXIT_ERROR;
> +}
> +static inline enum nestedhvm_vmexits nestedsvm_check_intercepts(struct vcpu *v,
> +    struct cpu_user_regs *regs, uint64_t exitcode)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NESTEDHVM_VMEXIT_ERROR;

For the above two you possibly want to return
NESTEDHVM_VMEXIT_FATALERROR so that the L1 guest is killed.  This
should be unreachable code when nested virt is build disabled, and
hence it's safer to kill the guest, rather than attempting to report
an error to L1.

> +}
> +static inline void svm_nested_features_on_efer_update(struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline void svm_vmexit_do_clgi(struct cpu_user_regs *regs,
> +                                      struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline void svm_vmexit_do_stgi(struct cpu_user_regs *regs,
> +                                       struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +}

Aren't those last two guest reachable if it tries to execute an STGI
or CLGI instruction?  I see the svm exit handler calling straight into
svm_vmexit_do_{st,cl}gi() as a result of VMEXIT_{ST,CL}GI vmexit.


> +static inline bool nestedsvm_gif_isset(struct vcpu *v) { return true; }

I think this one above is really unreachable when `nestedsvm.c` is not
build, and hence you could even remove the handler here.

> +static inline int nestedsvm_vcpu_interrupt(struct vcpu *v,
> +                                           const struct hvm_intack intack)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NSVM_INTR_NOTINTERCEPTED;
> +}
> +
> +#endif /* CONFIG_NESTED_VIRT */
> +
>  #endif /* __X86_HVM_SVM_NESTEDHVM_PRIV_H__ */
>  
>  /*
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 18ba837738..0234b57afb 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -46,6 +46,10 @@
>  
>  void noreturn svm_asm_do_resume(void);
>  
> +#ifndef CONFIG_NESTED_VIRT
> +void asmlinkage nsvm_vcpu_switch(void) { }
> +#endif

Instead of adding the ifdefs here, you could maybe add them to
svm/entry.S and elide the call to nsvm_vcpu_switch() altogether?

> +
>  u32 svm_feature_flags;
>  
>  /*
> @@ -2465,6 +2469,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
>      .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
>      .get_insn_bytes       = svm_get_insn_bytes,
>  
> +#ifdef CONFIG_NESTED_VIRT
>      .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
>      .nhvm_vcpu_destroy = nsvm_vcpu_destroy,
>      .nhvm_vcpu_reset = nsvm_vcpu_reset,
> @@ -2474,6 +2479,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
>      .nhvm_vmcx_hap_enabled = nsvm_vmcb_hap_enabled,
>      .nhvm_intr_blocked = nsvm_intr_blocked,
>      .nhvm_hap_walk_L1_p2m = nsvm_hap_walk_L1_p2m,
> +#endif
>  
>      .get_reg = svm_get_reg,
>      .set_reg = svm_set_reg,
> diff --git a/xen/arch/x86/hvm/vmx/Makefile b/xen/arch/x86/hvm/vmx/Makefile
> index 04a29ce59d..902564b3e2 100644
> --- a/xen/arch/x86/hvm/vmx/Makefile
> +++ b/xen/arch/x86/hvm/vmx/Makefile
> @@ -3,4 +3,4 @@ obj-y += intr.o
>  obj-y += realmode.o
>  obj-y += vmcs.o
>  obj-y += vmx.o
> -obj-y += vvmx.o
> +obj-$(CONFIG_NESTED_VIRT) += vvmx.o
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 82c55f49ae..252f27322b 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -55,6 +55,10 @@
>  #include <public/hvm/save.h>
>  #include <public/sched.h>
>  
> +#ifndef CONFIG_NESTED_VIRT
> +void asmlinkage nvmx_switch_guest(void) { }
> +#endif

Similar to my remark above, you could likely move the ifdef to the
assembly call site.

>  static bool __initdata opt_force_ept;
>  boolean_param("force-ept", opt_force_ept);
>  
> @@ -2033,7 +2037,7 @@ static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
>                   nvmx->intr.intr_info, nvmx->intr.error_code);
>  }
>  
> -static int cf_check nvmx_vmexit_event(
> +static int cf_check __maybe_unused nvmx_vmexit_event(

Maybe you can move this one to the vvmx.c file?  It seems like an odd
one to have defined in vmx.c.

>      struct vcpu *v, const struct x86_event *event)
>  {
>      nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
> @@ -2933,6 +2937,7 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>      .handle_cd            = vmx_handle_cd,
>      .set_info_guest       = vmx_set_info_guest,
>      .set_rdtsc_exiting    = vmx_set_rdtsc_exiting,
> +#ifdef CONFIG_NESTED_VIRT
>      .nhvm_vcpu_initialise = nvmx_vcpu_initialise,
>      .nhvm_vcpu_destroy    = nvmx_vcpu_destroy,
>      .nhvm_vcpu_reset      = nvmx_vcpu_reset,
> @@ -2942,8 +2947,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>      .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
>      .nhvm_intr_blocked    = nvmx_intr_blocked,
>      .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
> -    .update_vlapic_mode = vmx_vlapic_msr_changed,
>      .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
> +#endif
> +    .update_vlapic_mode = vmx_vlapic_msr_changed,
>  #ifdef CONFIG_VM_EVENT
>      .enable_msr_interception = vmx_enable_msr_interception,
>  #endif
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 7d9774df59..536a38b450 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -711,7 +711,7 @@ static inline bool hvm_altp2m_supported(void)
>  /* Returns true if we have the minimum hardware requirements for nested virt */
>  static inline bool hvm_nested_virt_supported(void)
>  {
> -    return hvm_funcs.caps.nested_virt;
> +    return IS_ENABLED(CONFIG_NESTED_VIRT) && hvm_funcs.caps.nested_virt;
>  }
>  
>  #ifdef CONFIG_ALTP2M
> diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> index ea2c1bc328..e18d59e0eb 100644
> --- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
> +++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> @@ -25,9 +25,21 @@ enum nestedhvm_vmexits {
>  /* Nested HVM on/off per domain */
>  static inline bool nestedhvm_enabled(const struct domain *d)
>  {
> -    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
> +    return IS_ENABLED(CONFIG_NESTED_VIRT) &&
> +           (d->options & XEN_DOMCTL_CDF_nested_virt);
>  }
>  
> +/* Nested paging */
> +#define NESTEDHVM_PAGEFAULT_DONE       0
> +#define NESTEDHVM_PAGEFAULT_INJECT     1
> +#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> +#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> +#define NESTEDHVM_PAGEFAULT_MMIO       4
> +#define NESTEDHVM_PAGEFAULT_RETRY      5
> +#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
> +
> +#ifdef CONFIG_NESTED_VIRT
> +
>  /* Nested VCPU */
>  int nestedhvm_vcpu_initialise(struct vcpu *v);
>  void nestedhvm_vcpu_destroy(struct vcpu *v);
> @@ -38,14 +50,6 @@ bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
>  #define nestedhvm_vcpu_exit_guestmode(v)  \
>      vcpu_nestedhvm(v).nv_guestmode = 0
>  
> -/* Nested paging */
> -#define NESTEDHVM_PAGEFAULT_DONE       0
> -#define NESTEDHVM_PAGEFAULT_INJECT     1
> -#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> -#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> -#define NESTEDHVM_PAGEFAULT_MMIO       4
> -#define NESTEDHVM_PAGEFAULT_RETRY      5
> -#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
>  int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
>                                      struct npfec npfec);
>  
> @@ -59,6 +63,36 @@ unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed);
>  
>  void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m);
>  
> +#else /* !CONFIG_NESTED_VIRT */
> +
> +static inline int nestedhvm_vcpu_initialise(struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -EOPNOTSUPP;
> +}
> +static inline void nestedhvm_vcpu_destroy(struct vcpu *v) { }
> +static inline void nestedhvm_vcpu_reset(struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v) { return false; }
> +static inline int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
> +                                                  struct npfec npfec)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NESTEDHVM_PAGEFAULT_L0_ERROR;
> +}
> +#define nestedhvm_vcpu_enter_guestmode(v) do { ASSERT_UNREACHABLE(); } while (0)
> +#define nestedhvm_vcpu_exit_guestmode(v)  do { ASSERT_UNREACHABLE(); } while (0)
> +#define nestedhvm_paging_mode_hap(v) false
> +#define nestedhvm_vmswitch_in_progress(v) false

Why are those defines instead of static inlines?

> +static inline void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +
> +#endif /* CONFIG_NESTED_VIRT */
> +
>  static inline bool nestedhvm_is_n2(struct vcpu *v)
>  {
>      if ( !nestedhvm_enabled(v->domain) ||
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> index da10d3fa96..ad56cdf01e 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> @@ -73,6 +73,8 @@ union vmx_inst_info {
>      u32 word;
>  };
>  
> +#ifdef CONFIG_NESTED_VIRT
> +
>  int cf_check nvmx_vcpu_initialise(struct vcpu *v);
>  void cf_check nvmx_vcpu_destroy(struct vcpu *v);
>  int cf_check nvmx_vcpu_reset(struct vcpu *v);
> @@ -199,5 +201,65 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
>                          uint64_t *exit_qual, uint32_t *exit_reason);
>  int nvmx_cpu_up_prepare(unsigned int cpu);
>  void nvmx_cpu_dead(unsigned int cpu);
> +
> +#else /* !CONFIG_NESTED_VIRT */
> +
> +static inline void nvmx_update_exec_control(struct vcpu *v, u32 value)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline void nvmx_update_secondary_exec_control(struct vcpu *v,
> +                                                      unsigned long value)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline void nvmx_update_exception_bitmap(struct vcpu *v,
> +                                                unsigned long value)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline u64 nvmx_get_tsc_offset(struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}
> +static inline void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline bool nvmx_intercepts_exception(struct vcpu *v, unsigned int vector,
> +                                             int error_code)
> +{
> +    ASSERT_UNREACHABLE();
> +    return false;
> +}
> +static inline int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
> +                                         unsigned int exit_reason)
> +{
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}
> +static inline void nvmx_idtv_handling(void)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
> +{
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}

I think this function is reachable even when nested virt is not
enabled:

vmx_msr_read_intercept() -> case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC -> nvmx_msr_read_intercept()

I'm also confused about why the function returns 0 instead of an error
when !nestedhvm_enabled().  We should probably make it return -ENODEV
when nested virt is not available or enabled.

> +static inline int nvmx_handle_vmx_insn(struct cpu_user_regs *regs,
> +                                       unsigned int exit_reason)
> +{
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}

Same here, I think this is likely reachable from vmx_vmexit_handler(),
and shouldn't assert?

It should also do something like:

    hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
    return X86EMUL_EXCEPTION;

So it mimics what the function itself does when !nestedhvm_enabled().

> +static inline int nvmx_cpu_up_prepare(unsigned int cpu) { return 0; }
> +static inline void nvmx_cpu_dead(unsigned int cpu) { }
> +
> +#define get_vvmcs(vcpu, encoding) 0

This likely wants to be a static inline and have an
ASSERT_UNREACHABLE()?  From a quick look it seems like call sites do
check that the vpcu is in guest mode before attempting to fetch a
field from the nested VMCS.

Thanks, Roger.

