Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD757FB8ED
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:05:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643029.1002864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vtg-0007nx-Qr; Tue, 28 Nov 2023 11:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643029.1002864; Tue, 28 Nov 2023 11:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vtg-0007mJ-Nw; Tue, 28 Nov 2023 11:04:56 +0000
Received: by outflank-mailman (input) for mailman id 643029;
 Tue, 28 Nov 2023 11:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vtf-0007mD-Tg
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:04:56 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f53d579b-8ddd-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 12:04:54 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8276.eurprd04.prod.outlook.com (2603:10a6:20b:3e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 11:04:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 11:04:50 +0000
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
X-Inumbo-ID: f53d579b-8ddd-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAVvQQjs2qba7OEF3NV96y1F/owSHO51tXLHeiHGKORxCWiCMrcURMa2CHohjWC4qMuDb3iTj3+/gUZ2rK2ExS97X3ZL80BhdlLRQ0/mVOnNy8xaJV21bG8QTiB7PDNEamNm6acsQDRaQOUEMV6+KilL1tl50gbLQ50znp2X1J7ogiObjTVfHiaOwmVhKlrtg5ZsTJb1m20JCovuQh3xQzEA+TByJfXdtogM9wi9QyEH0P14Wc17lyhN3H5E8IAWn3TNgeAVtwuheMTR66yx0C55oSCU9jNaRFboYssVN+SAn3AJyGuXi+g3jXpFeqcJv1jf923acOUnU7yr3koAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0kiu5zcRzqLtk6BKde2UERGn+ThRitjMaC0tzTgvPM=;
 b=ZvwrcXOrLxaecaTgMZNRTfx+hHQe3Mo3bO4C3HhD33LEHu7euu7UC0wbPOAmO9dpXZmNLVSd3qRxwPnC4HDiqt0vEYVvS0BdChp/81CUWtxWZ+PC+/E11xKwezgXMaEW0+pJz41upAqDtEV+fYBp5WchY1rGlWcvQhhdsqrq5ufcN5KQYQKwQfNpdYUyYHIZXR4LptXz3/rak2xHZxZGu7gGrx+svsvRYtJFiHvRZIpKHeHloqiwPgucAcY9m3EjcxKN6np201LDoLSm1+2TA+3RRcwqHgmxs6rFjKq9FzttVZS8xT2kERcw7lWe/IDcyuveCf34kGkQ4uEH5lCGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0kiu5zcRzqLtk6BKde2UERGn+ThRitjMaC0tzTgvPM=;
 b=pbLBVZH7/cgQiui3A3Z0c93oetjWSKt9JbO4jVyZeoqcQWEdTuPxLO3Z3yIMdVraKY8eHjOdAVNdK4WKdv4jr2J/F4mIxiqBJ3mP0JqDCK6kSlj8xdJwed0kxO5WeUIFjkT500Nobn42KSSj3g5icvT7402JFZ67wqIFuhBZ3fs+wwahk2pVe7jnc8F/K12TwsPBzg8qvEpMbUqHLndepP2lzIEU18RjEnTDD+HOv9QA9gqabgsVLVxBbqQ8hwqGvGSo/ktLQDjLPEfcYxYMEguOMmIJDxr6QeAlx5ihtyH/WgxXqJY4Rk4oUd+c/f3+NvTZ+v3TgoO1CQrQYAJ7jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
Date: Tue, 28 Nov 2023 12:04:48 +0100
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/6] x86emul: misc additions
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf6cfa1-07fe-4df6-b1aa-08dbf001d781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7vUt08mGCEt6LxHwWxrvhOwrgF3CPj7KOt7hIpWFULtZkc/u/XQznnjgj1ITiAddlTmTEJH1Mm5hl3CcjmI5jvqzzFxJ3Mcjy6jxzLIufjFQiJ7rkV3Hv5BIbUYkZvjSaPkWZF2oS/UHTddSuAqlDQQI79SBJcIBGfc5kT/iu7C6JocFOvojYpaUGDGdmlyeYmv22hYIJOtKA792YQJO3/S+AW4xGPjMk4KPsY19GcRDxn4601SDJeaOrYBa/jbUQUqulSsO254KIKNkarNiDLE3uiqSFRV6serrdJxCn/+noVhD6ME4kTqaszc8SSdYCWvtF9tiWi2GE/fJ/Qh7vTZSHrX6vruNa4AIySOcB3GJrvRRtgvxOnMxPwzB1RALuCdKzFwwD2BZHJCJJNngsVMMuv9rW3lJit0eOZutnMgBkumbNCIsQkodlTP8pM3MpkLpgIZwb4gwHv0KSHpQ2oiQjoZV7RTnUnt4p7UG6jbZ4NPs63vKC6v7SqjoxyG+JSmJlB9pw6lmPrk9fhxZtQsTaWlNqfgjnaGkf7vgndleFpiH5p/9TRYAwfkQQnKYR6t+3JkD9LDkpZ39noDVgT0glzuS4J7cW4ZuJQ/I7l8DyXKgcIadDKkxh8rS8sWTEOx/x7XWH9GAhmCKOe+gVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(26005)(2616005)(478600001)(6486002)(6506007)(6512007)(38100700002)(86362001)(5660300002)(31696002)(36756003)(41300700001)(2906002)(66946007)(83380400001)(4744005)(66476007)(66556008)(316002)(8676002)(6916009)(54906003)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE0yTlptWUNJa1QzT3ZrL1prTnFLN3F0dlV6ZXZwTWVJNXhtK25SdEM4Rm8w?=
 =?utf-8?B?K1NGQmwvK3ZiQk9wamNlelo4MDBYTzl1RUwzYks0aExnNkJUK1lxK1RpcXdL?=
 =?utf-8?B?b1g3eU56MmMvQ290VFdsT2hzMmhWZVFzYmlpLzBNa3F5M050QlNZb2t3RlVh?=
 =?utf-8?B?b3loZWVaQjZxd1VLRHdZREdyRm84UVVVQ3dZdFN2WWVFanVpOU8zcWxIQWhP?=
 =?utf-8?B?QU1GTDVCREdYSmtaRlllOVM0bnhYUWhURENadC8waUlvWHBnc1JvQldOVlow?=
 =?utf-8?B?TFNuaVFubm85Q0RNeFl1K1pzK04yUldTWUhwYmpDYVp2RUN1Vm9mMDhnZ0xE?=
 =?utf-8?B?c0Q1TmlDZHpiRGRaNWdZZzZPQ0tueW1Sd1doRUtQZWlFeHh4aVlLdC9OZnBx?=
 =?utf-8?B?WnR5QmErRG82dFI4d3AremFYL2p0Y2l5Ykd0eXBLMnhJNzVSZHF1L2R5Ly94?=
 =?utf-8?B?MlJ6TWdCa2M4S3NCWklVOGFySmdJMVhURzVyL2tUZk8wRkNHYkdlS3k0c3JC?=
 =?utf-8?B?T1A4TGo2T0ZSOVlLZnhMVUpHdHQ1ZzNkdElkL1FXSHhFNTBqRGMrZnFjd2ZY?=
 =?utf-8?B?aUl3V09vMHhBbXVsR3BqekF0NmhTZzNyUHlJRVg2akd0TWFvSWFMbWx0d2pS?=
 =?utf-8?B?enVkRVVhMFZvSkl4QUo5Z2kxai9mdWpkbmxRMEJZaDZLWWhNU3BldXdPK2Zh?=
 =?utf-8?B?VXhaY09lNFJ5NjFFc0YzTW1xMkpacGhJd2RhR2RuQW51ME5CemZwRjdDclpL?=
 =?utf-8?B?QmZqUGUvVTQ4MnpKTjkxbHFsZHhLT1pPKzFySUE1ME45REVYY3RvTENBYlI0?=
 =?utf-8?B?RTg3cFpSSUhqQmZkUXdjd3AvbkZFd0ZzTHJGODZLN1J6eXlpb0hqM1JjSWZo?=
 =?utf-8?B?dEpNS0tyN3JNdUZaWW4zOFR4REdQUWprMDlqV1dNM0Y4YVhXNGNEM2J1S2Ns?=
 =?utf-8?B?SkE5T3BBRzR1b1lUd1lyQlNYVE11TXRNSmQ4aXlOcWFyZ1ZPT2ZOY1NZY25X?=
 =?utf-8?B?bDAxdXdIQ253Yi81b0JIRzZFVWhjc054d00yRjBkczdBbkVwUkJjMHRtUVps?=
 =?utf-8?B?QWNjUHE1SUN1MWpVbXRNenRidGgxdWtIU3ZNaFR3d3FXczRvbkE2Tnd5NzZt?=
 =?utf-8?B?RFpuQXpRVnkxaDNDWS95cnM1YXV4cXgva1RtVGs0K1h4bGRCbExubkNOMUtv?=
 =?utf-8?B?MDR5UmJKNUJLQjFESWd0b29yOHJzU051Ny91dnp3YVd0eWlSNCtrdWROQWVC?=
 =?utf-8?B?VWp6RTdZemVUZ1hObEVNZ0JMZ3pDanUrMzBaengzYkQ4Z2gxL3gxM25xYXU5?=
 =?utf-8?B?ZjJ1eVNNR00yTFpYV3RHdWxZYWlVUE5qaVA0bk1HWnBRa0t6eDdXOU95NUhY?=
 =?utf-8?B?LzlEQVo0M0UxYzA5cEVvYkdZQkVya2FGeWpJbWlYdk5COHJkN3pJK091L1pl?=
 =?utf-8?B?bFVIZnBoQVRoUkVIbHJ3b25GYndHV2ZiUkxPbCtOa0wzdkpHbDdSeWRJTzlE?=
 =?utf-8?B?c1IxMjdqSDZLZ2tCUDhhcGRidisxekJuUk1rOUNZT0lTR3I3bUE1NXI3blli?=
 =?utf-8?B?cUs3a3RrZ3ZOVEJENEVWUGlPSW91TWMyOUhwNjhNVm9JdU5yT3ExTXQ3Ulo3?=
 =?utf-8?B?QWRTd1QxVFJNY3V6b0xIVDUwQWpLK1liK3Q4L1lHbHVsQnFna0JGbWpxV1Fk?=
 =?utf-8?B?UGllL1pTLzk2bFl0MEwweGl2RFEycEwvbWZuSFpiTmlFTDd5WlZUczNGWkF0?=
 =?utf-8?B?VVVVWWxwSXFjOHdWemprSjU0QXBocTZkano5SDUyelJOQjY0MHo2UmdRNi9p?=
 =?utf-8?B?akZaaThQUHQ4QzAwZVIvYVNQaFdSdkRrUG9pR2JSVldwNDVFb3pPeHNJWnFp?=
 =?utf-8?B?WmZpTFlIOFMvRHlJLytQK0Q2OEVud1lrNUJ2MXhPSldsZncyOXZsSjdQYnNx?=
 =?utf-8?B?dG5mUitTZUhzdENVUHhuUHVrNUZXQ0V2UHREUUl2cjJzOXc5SXFIZS9NQldR?=
 =?utf-8?B?Vm9kWkhXOW5aUFJTYVU2eTVqNzVHRWJJc28zUklqeTd2Q2xST2Iydy9ocTdJ?=
 =?utf-8?B?Y3MrTWRjQmsya091M09iazVDc2NvU0tCQ1VSa3B1YWNZZ1V0YkRISG82VUhG?=
 =?utf-8?Q?u+f/gTmn7c1DxrXq7GpzDiFwN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf6cfa1-07fe-4df6-b1aa-08dbf001d781
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 11:04:50.5199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTV707yayoH4MNoVOQDPNmhf5hCuef2RgDgY2cdRZfOjs/rnrULKu8j13qFLPs1ARRaiBCjcA0IeL/XF8erWHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8276

This series adds support for a number of more or less recently announced
ISA extensions. The series interacts mildly (and only contextually) with
the AVX512-FP16 one. Note that an intended final patch (to fit in USER_MSR
elsewhere, in particular in VMX code) is yet to be written; specifically
I haven't checked yet whether - like was the case for MSRLIST - there's
again insufficient detail in the specification.

1: x86emul: support LKGS
2: x86emul: support CMPccXADD
3: VMX: tertiary execution control infrastructure
4: x86emul+VMX: support {RD,WR}MSRLIST
5: x86: introduce x86_seg_sys
6: x86emul: support USER_MSR instructions

Jan

