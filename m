Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LsIGpAZi2ljPgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 12:42:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A475011A5A1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 12:42:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226305.1532839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpm7k-0006aj-Je; Tue, 10 Feb 2026 11:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226305.1532839; Tue, 10 Feb 2026 11:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpm7k-0006Yy-GC; Tue, 10 Feb 2026 11:41:44 +0000
Received: by outflank-mailman (input) for mailman id 1226305;
 Tue, 10 Feb 2026 11:41:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpm7j-0006Yr-DB
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 11:41:43 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77a46ac3-0675-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 12:41:42 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH8PR03MB8227.namprd03.prod.outlook.com (2603:10b6:610:2be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 11:41:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 11:41:39 +0000
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
X-Inumbo-ID: 77a46ac3-0675-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCfY/ZlAJu0F+iDTWf/iF4lFdqCu6kECdSeNL/0/cZr4oYY7DOVMHc70xjjutCFUyQDgdlZgEK8BiiuG4kng7zNHjTdHsQEVZPBX39OWG1L8xAXuz7qpyPj2+fF5qau2w8AKuTDsToAWZAUcoR6Z8o9pT5euusOWc0MTjJSN0rlERady/djQyo2acdsP+DTLHUXaqs4vQqqWRvqNBqSjjMbLJiYkU4nQ+MjrZ1THKcxdGqVocS1xv/TjxTmSJ04GpK0Npmjoc0D+z7VB2RAlRLaFOa2T3i+MdJfmqVjuRnoYqwVKwUKlttWJ5B/NtrhvflAS3GSoATDiVrNu4Y4Xxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyyNimg/FtAfI4mzmHk4UbzX5jVzi6UKZgL2Iphirqs=;
 b=N1Bo7RnNb95jUIee35mY/9do8ld/5dDGAtGs3bLuYIxubuhoHzmqBKH0ku1g/nxXk1mSC7Y6WovflwR4w+sRarE3baMxl7OZdk+6VE4bJSPHxvl4PuX2neFAQ/5rWEyztnta1bpxwoGV+lK5kzSX6igVCV2OiK6RFgD07UZXYUu98kAnyP2X9Mte1jPXJZOwg5MGBPfezrB1Z8HbP8xoh2vQ4+vAEEb90ZxHdQUJqPMFyk7+Gnv3vU33AAlGHZVaDQ8Lc27Fe+eG0KpDwJXTM17oY9aqDpsUYZlJIu+U6eMwnBsukWQrEb7shtKjeBQaUPFvPk8ZdPE3XD+MTDAxvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyyNimg/FtAfI4mzmHk4UbzX5jVzi6UKZgL2Iphirqs=;
 b=OQghjBagF4t/ULUnrJAr/2Xmn2N57zC5kcPNK3o6qO8k/9/Jo1/AiGSW74g/RQoTDTpmwY1vCqmP+rSfXAo4IMIkYKhKYZcI95f+zStE/QPcnw+CXBkLda7NNDjATdenYUHinA5MmqQB6ztZSCZj6yIiksclX7KLpFKKTDn6ieE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Feb 2026 12:41:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5] xen: Add Darwin.mk
Message-ID: <aYsZb529xJvYSSRo@Mac.lan>
References: <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
 <d1baa448-962c-4c2a-9a79-cf334b860450@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d1baa448-962c-4c2a-9a79-cf334b860450@suse.com>
X-ClientProxiedBy: MA2P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH8PR03MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4fe45a-7a2a-45cc-dd0d-08de68995a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUZLeDlNUWMyMHhmRkVuL1FYN3VTT3JGV2hvQXkwWU9wZU91U01SQ2F4SVRn?=
 =?utf-8?B?cFZWcnZheHZCMFVJS21YbjRwa0o1cU9QdDZ3elUxZzFJc2VvYzRBaUNjdnZX?=
 =?utf-8?B?RlFwSDhPNzUrVTNxSDJkY3VuemRGNEcxRWhEMXEzWW1hcmRvbURUbmIvbmtj?=
 =?utf-8?B?U2NadjFuT0lIS3Jzb2N4bTNRdE1xTUY2T2lkMnZvVGVZVTB5TWJneE1HSnAv?=
 =?utf-8?B?YlJMbWwvODZvaTVtL0p3c0VoODZ2WEduQW9aR3pSWTl1eXk3RkZ1cXc4aGpw?=
 =?utf-8?B?Z3V5VllXb3kyWHdHQ2tNZFVyM211TU1lb2pPSUNiWmdob0x2ejBvbmhtcGxU?=
 =?utf-8?B?dzB4S0xvTFBiZkhmRk5va3FNczFhRmJRbCtpMkJaVEgrWTNWQlZnTG5MWHV1?=
 =?utf-8?B?QXBzY3ZWaDQ1ZnNsUUdDd3hDZUtHUm5EUEZFdDZwbXR4RDhyL0RSRGV2cVVM?=
 =?utf-8?B?NS80ZjJwR3l0SERLSlV5citBRGF3YmpUeHhqSE9YMzZSWmR6WktxS2ZEQ1gr?=
 =?utf-8?B?ckordFFtejdMRXpwWFV1NElaT3owNWx6SVZvc256ZWxtUHl5ZjE0NmpnZTVa?=
 =?utf-8?B?cHBSNFRzUnJKZmR1MjdEZzRhMjBCRnhPcFVzTUIvZTZKOGdHQkFMWCtDY0Rl?=
 =?utf-8?B?NmJ1dkN2UTQxdlNIbDFVODVrdjl5UFFGUW5ndlNYaUxCaVJxUjh0V0FDaml0?=
 =?utf-8?B?YXFBS2dtOUxxeEJhNDBiSnk0emhISzVkMHR3bHV3aTJlRXN3WWRNTC9SYTlV?=
 =?utf-8?B?QjcxemhGaHBlOG90QlpZNm4yVEZFejM4N1EwY1Y0ZThqMGNMNTl6VUdnN0tV?=
 =?utf-8?B?UmJTa1c0aGZhOFFvTEhIc2h5YklIL0p2aFpTZkNvQWZtQTdyQXhNNmxQSTh6?=
 =?utf-8?B?Y01LUWJyb1dVYU1rVTZ2dWVRck05alpTZzdpdGYvbGt2QkxLaFVJT3B1dmx4?=
 =?utf-8?B?OUEzaDNWM3BWdGJwOWQ2NGxPMWhQMm1CVmg4SWIxWHhpR0hIOGs1UzQyaUxZ?=
 =?utf-8?B?TWNhWkhxdGY4UkJOU2RpMWZ2d2crbHhmOXgra2pzTlI5bGdZbU9sd281cmVF?=
 =?utf-8?B?WGZRcytVdnRrbFpJcGRHTFo2cTV2MEdRNnV5RGNGb3RGVS9UQmNXT3BFK2s2?=
 =?utf-8?B?SWRmb2FmRDdncWNqYnlqUEhrZDBBOUllWFo4SmNaVWxNUFJVYnd1ZS82Z2N1?=
 =?utf-8?B?QXZGei9aZHMxMVozU2VIaktqNGZvRzhIYTQrWVhaWGpsZjJMV1h4VnV4VllW?=
 =?utf-8?B?ZUZaNmlxK3VoeW5abG5abDh4RkJGS0dYNk03dm9ZVlZMc0lFMExpSjN1V2Mx?=
 =?utf-8?B?Rk9RZ0RkbndwSU9SYm1oYzR1WE4vRXJHTEpBWm9sZkE1VnF3UnN0YVM1UkE0?=
 =?utf-8?B?WGs4Z0RhWU5CZVN4QXZYN2toTVc3eHdYRzlmbUhzTWdRbU1VMFRVRVY0Y0Z0?=
 =?utf-8?B?TENvZ2RFSEMvWDQvSkF4QU81eXF5QUdaaFZzMmNRWCt4WUhRV3hmNGxueUpQ?=
 =?utf-8?B?akZOemJrYk5ZaU1uZW05LzJsRDhGNi9pVnNBdk9OVVY2Ri9jOFZkYUZmL3da?=
 =?utf-8?B?a2srMDRvVytXWXpGOHFvekFGeW96VG4vLzlqS1FUenYrNE0wK1hHT1o5by9r?=
 =?utf-8?B?RW5UQ3grQisxWHBZMWVjcDhES1M3NnVsbXFkUGZONGZldzB5TWV3UXluVU5H?=
 =?utf-8?B?R3huYjdnRko5MnJjSER0Smo4dHhyQ3daNnpDcGczRVl2VEk0VnZqbXlmNC9M?=
 =?utf-8?B?cVdiSHlQY1NmUHZENi9iTHRnS2gxdzBwaTlJbEo0NDVQQnUzTmVSSzM3WERl?=
 =?utf-8?B?Y01nSjROSEc3OEszSG1hQm1Kam9BNlJEbEFJNGFuNlRxZ2NPa1F4Vng4ODZo?=
 =?utf-8?B?bTFHTFdFUVBUczA0Q0h6Z2NpOWdZSXlDSTE5UFFZVmd0K3pCSVo1VVRtSUlr?=
 =?utf-8?B?eXJ4dHBhWHhHQ3FzZG1keFdhN0tQQUFEcGtWclc2MjN0d2pWRTdxbE5DS2Nn?=
 =?utf-8?B?cTZnYVBYazBaMzdjZUdmeWNPWUx0dHgxMzc1dFZiSWtQWUFZQ29DUGExbERM?=
 =?utf-8?B?MmVrTjFpZkhxZzdUMlppT1dvZjU2cCtTQmtnWUtvL0VidmpoNDVOZm9CTjB0?=
 =?utf-8?Q?qaH4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE96RlE2T0drTlZaNkkyNWtxNUxsY3FscGZDZENOWnlJU21pTCtyZDk4WjQ1?=
 =?utf-8?B?WHBaejd2NDJjNkUyUkl6L1FEMnB1UjlsMHNHb081ZEdaQ3Byc3dCdkU4S2Y3?=
 =?utf-8?B?UGdxVXk2Y3dQRi9qZHBKSUloa05LaTk3ekdNRDR0UzJZMHVOcmhOWkhxalFh?=
 =?utf-8?B?N0hqMTN0azN3REpMZk56VlB3czFSTVNqZU9pVnNYQjFkdkplL2VHYk04aUtr?=
 =?utf-8?B?MVI2dzFNaDVDUlhSU0RVcFdXaEJoaVcyTjJPcGo5aldmenZXTW5USnVGV1lJ?=
 =?utf-8?B?Q3Z2NU5rT1JVczZuWFpUUjhJMEYwc1lXR2x4UVFCYWgzeU14R3NqajZ2Ulc4?=
 =?utf-8?B?azQ1c05jZ3N3TnFySEREdHRrdTRKUFlxZ3hwa1UxMmpHM2RyTjZSMTh1dStG?=
 =?utf-8?B?SlVjallRbXRrRW5wY1kxeG1QZzFiM2cxRGZNdW10d0RzOFh1d0Z4U2ZZdW0x?=
 =?utf-8?B?cjE3NkFZaUJDS055VjluNmpuZXNnZS8xRU16ZnlRLzZTeGpLRWpVWFVDb2Vn?=
 =?utf-8?B?WGJydHh5TlpTUm5jT0ZqWDdEZUVMMmxyNkdMY2FHaUZ5cjZML0hxQ2F0MGNR?=
 =?utf-8?B?MU9xZUVKL3lkNW8rbkQyZklRc1Jrc3BYN0VrNUFYTFBGWlBHT2JHeUtRTGsy?=
 =?utf-8?B?Z2Q5SExxTE0wZHQxQnpuVVlqTXRjS1p0c1Via2d6WnZta1JRNWNsU1Uwek16?=
 =?utf-8?B?YlZCK1JCRnBjVGd1bUxXSUZENHluLzMxcmpFRFRUVGtSeUNYU1lFVlhUazA5?=
 =?utf-8?B?MVhNbWtFT25jbm5hWHN5WWp2RXRwUUJUT2V3ZVBpUHh2WHV1RUdGd2k4aS9H?=
 =?utf-8?B?bzk2NEhiMGNMcyszd0dDd2s4bko1N0E0dzNBUTBhOHl4UTQ0VUZJMUkxMTA2?=
 =?utf-8?B?M1R3N3BrVFYwVnZRL0lMK0tnT1pJamhxR0ZCOWVnZ3BTcG5DUmJXSkxGTGRQ?=
 =?utf-8?B?YVZ2NUNOK0M1blo2aEhIOWpjUnozeEVMM25mNStVV1h1V0dxSTVGbWQrRjZw?=
 =?utf-8?B?ajZ3Qy9vb1UzZncrRmxBUnVIMmlTdDFMMDVJM005S1pWSFpNK0xHTnpLYnF2?=
 =?utf-8?B?enkxVUVZSCtDb2VHVUJZTTVEbjVIcVFBWUNUS25TVVk4OVArS09zZ3c3S0pO?=
 =?utf-8?B?V25sOTMrTmdFZHNvRW1Kc3ZudVdMMEhRbWNKV25Ya0hPaTZhM1hVekZRWFAz?=
 =?utf-8?B?dTNaWkYwcDB5MDA4Mm5GWEl3UjZlYnR0N3hiZzhoL3lsM1p3R0lhWXNHUjFq?=
 =?utf-8?B?emNYR2g3L245UGM3VTJLSEtDdlVEZ3U2SnFvS21RRUlYQjlScHlVSm1jVSt6?=
 =?utf-8?B?TDZLRFR3L29CT3NiNDV6Q1E0dXlXZ0ZJRWNyeTlLZmtjRkdscnZaU29hd2RH?=
 =?utf-8?B?V2V1M0tVd1BlN042dnV2SkhPcDVTRG5sNXNQbGtpUUNVUzlITnBpVk84U0tO?=
 =?utf-8?B?ZUY2NzNveldGbUJmRjFjS0V6d1VGZ0Z2a0RubGRYVy9SSVZMNWFCZ1hWQzVi?=
 =?utf-8?B?cUhsUEVsWnlaRUQ3UDE4dG9lSng1VkdkQXlYZXgxVGIzY05jMElKM0p5RXhx?=
 =?utf-8?B?c3J1UkpQTzYwMEk5TEsvVkp0S2dCSjlUcS9yZGJWcS9hZGc5TTFMay90eC9Z?=
 =?utf-8?B?Q2xnN2d0T0dIYzBEVVF3am9UenFrKzlyQ2lqQ0tZVS9PN2N4aUJFUEo5RUV6?=
 =?utf-8?B?WXhuZFdjeDdpTXRFa0QwempYdXIwUkpwenpmVWhpNUZwbmRNc0dCU3hWSS94?=
 =?utf-8?B?MVFVREZ4dmExTzIrZXhhRy9yYzFXcDlBbit0Sm5HdExZWkdqRG04WFQyVGVs?=
 =?utf-8?B?QkRYSHVwVUNQc1UzdXFUeDkrR1N1TWl1Nlc1QTRGbFVjK3NYdjFtR1FjOWh4?=
 =?utf-8?B?eHJySjVESkhRNFdCMWxCVkF6c1AycEFKYzAySENmZEVwVnpRT29XTmp6SG9p?=
 =?utf-8?B?NW5OQWVrWW5TWDdyTEZnNTZLUXUzMmdlZ3NyVTBqYlFPMXFtVTFxZ2NtNmV2?=
 =?utf-8?B?OWJxWWNpeTBjWFk3Sk44dE1oaERWUklGV050eWloM2gzQVNqSlhPazNlMThi?=
 =?utf-8?B?NXdWZk11dS9RQ1RmbEhqVzNiK3VRbSt3a0Zrd1BBbFRha0hPTDNtbkdBSzhp?=
 =?utf-8?B?UWVnMHVUVnd4QjVxNnNoVXg4c0Z3WXZybGFHdTd5WFJjSU5VVWFFQXA4ejdm?=
 =?utf-8?B?aGlOUWxNSnNKK0ZvWVJoSnI2Z1RjTW9waVp6cm5lalRPYk10U1FqdTRDc2RK?=
 =?utf-8?B?VU1scnUyaXgzenY3dEE4U3dyOGNKQlFGeTJKRlc1OUtjWHFSd01idXczYlBQ?=
 =?utf-8?B?VFNnL2VaYk1YWU1md3VPMG5oNkNGQ3BXY09nRVhoRTVtbUEyRjQwUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4fe45a-7a2a-45cc-dd0d-08de68995a89
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 11:41:39.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UiWjJQpoamNV/zGV7xIiYGeLTAHGCLrictyEMCyHoBIF1rlCwa8DZYY/XHAj4Y4Wg88pSWYDuh41dMiZQjhS6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8227
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,Mac.lan:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: A475011A5A1
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 11:46:44AM +0100, Jan Beulich wrote:
> On 09.02.2026 11:46, Bertrand Marquis wrote:
> > --- /dev/null
> > +++ b/config/Darwin.mk
> > @@ -0,0 +1,6 @@
> > +# Use GNU tool definitions as the tools we are using are either GNU co=
mpatible
> > +# or we only use features which are supported on Mac OS.
> > +include $(XEN_ROOT)/config/StdGNU.mk
> > +
> > +# Cross compile on Mac OS, only hypervisor build has been tested, no t=
ools
> > +XEN_COMPILE_ARCH =3D unknow
>=20
> While editing in the ABI aspect, it occurred to me to check what Apple ha=
s
> to say regarding their ABI. For both aarch64 and x86-64 they say they use
> the standard ABI with some modifications. We may want to evaluate whether
> those modifications are actually compatible with what we need.
>=20
> Talking of x86-64: Has building on an x86 Mac been tested as well?
> Especially if that doesn't work, it may want mentioning.

I no longer have access to an x86 Mac, those are about to disappear.

FWIW, I build x86 on Mac using the Docker containers, just as the CI
does.  OSX Docker allows running x86 containers on arm64 using the
"Rosetta 2" binary translation layer.

I've attempted doing a cross-build from an arm64 Mac using the x86-elf
toolchain, but got the following error:

% make XEN_TARGET_ARCH=3Dx86_64 CROSS_COMPILE=3Dx86_64-elf- HOSTCC=3Dgcc -C=
 xen V=3D1
[...]
/Library/Developer/CommandLineTools/usr/bin/make -f ./Rules.mk obj=3Dcommon=
 need-builtin=3D1
  x86_64-elf-gcc -MMD -MP -MF common/.bitmap.o.d -m64 -DBUILD_ID -fno-stric=
t-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-varia=
ble -Wno-unused-local-typedefs   -O1 -fno-omit-frame-pointer -nostdinc -fno=
-builtin -fno-common -fzero-init-padding-bits=3Dall -Werror -Wredundant-dec=
ls -Wwrite-strings -Wno-pointer-arith -Wdeclaration-after-statement -Wunini=
tialized -Wvla -Wflex-array-member-not-at-end -Winit-self -pipe -D__XEN__ -=
include ./include/xen/config.h -Wa,--strip-local-absolute -ffunction-sectio=
ns -fdata-sections -g -malign-data=3Dabi -mindirect-branch=3Dthunk-extern -=
mindirect-branch-register -fno-jump-tables -mfunction-return=3Dthunk-extern=
 -Wa,-mx86-used-note=3Dno  -fno-stack-protector -I./include -I./arch/x86/in=
clude -I./arch/x86/include/generated -DXEN_IMG_OFFSET=3D0x200000 -msoft-flo=
at -fno-pie -fno-exceptions -fno-asynchronous-unwind-tables -Wnested-extern=
s -DHAVE_AS_QUOTED_SYM -DHAVE_AS_MOVDIR -DHAVE_AS_ENQCMD -DHAVE_AS_NOPS_DIR=
ECTIVE -mno-red-zone -fpic -mno-mmx -mno-sse -mskip-rax-setup -fcf-protecti=
on=3Dbranch -mmanual-endbr -fno-jump-tables -mmemcpy-strategy=3Dunrolled_lo=
op:16:noalign,libcall:-1:noalign -mmemset-strategy=3Dunrolled_loop:16:noali=
gn,libcall:-1:noalign -Wa,-I./include -Wa,-I./include '-D__OBJECT_LABEL__=
=3Dcommon/bitmap.o' -mpreferred-stack-boundary=3D3   -c common/bitmap.c -o =
common/.bitmap.o.tmp -MQ common/bitmap.o
./arch/x86/include/asm/bitops.h: Assembler messages:
./arch/x86/include/asm/bitops.h:511: Error: found '
', expected: ')'
./arch/x86/include/asm/bitops.h:511: Error: found '
', expected: ')'
./arch/x86/include/asm/bitops.h:511: Error: found '
', expected: ')'
./arch/x86/include/asm/bitops.h:511: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:20: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:20: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:21: Error: alternative feature outside of f=
eatureset range
./arch/x86/include/asm/nospec.h:20: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:20: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:21: Error: alternative feature outside of f=
eatureset range
./arch/x86/include/asm/nospec.h:28: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:28: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:29: Error: alternative feature outside of f=
eatureset range
./arch/x86/include/asm/nospec.h:28: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:28: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:29: Error: alternative feature outside of f=
eatureset range
./arch/x86/include/asm/nospec.h:28: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:28: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:29: Error: alternative feature outside of f=
eatureset range
./arch/x86/include/asm/nospec.h:20: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:20: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:21: Error: alternative feature outside of f=
eatureset range
./arch/x86/include/asm/nospec.h:20: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:20: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:21: Error: alternative feature outside of f=
eatureset range
./arch/x86/include/asm/nospec.h:28: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:28: Error: found '
', expected: ')'
./arch/x86/include/asm/nospec.h:29: Error: alternative feature outside of f=
eatureset range

I haven't investigated further.  Seems like some issue with
alternative and the uses of CPUID defines.  We probably want to
mention in the commit message that only arm64 builds have been tested
so far.

Thanks, Roger.

