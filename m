Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8407591CE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 11:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565703.884086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3hP-0001Vf-BQ; Wed, 19 Jul 2023 09:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565703.884086; Wed, 19 Jul 2023 09:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3hP-0001Sr-8i; Wed, 19 Jul 2023 09:42:23 +0000
Received: by outflank-mailman (input) for mailman id 565703;
 Wed, 19 Jul 2023 09:42:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM3hN-0001Sj-A4
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 09:42:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d5a1a4a-2618-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 11:42:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6794.eurprd04.prod.outlook.com (2603:10a6:10:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 09:42:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 09:42:17 +0000
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
X-Inumbo-ID: 8d5a1a4a-2618-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lmqxbn+oExjX0Ee7H35g4/2LlRX0jGRNTbhv+eP9NcBPleajXi9r8JkRJrxIV+VcixNgxHOgS5Ep/ppAx0kQLHqlh7PfQb15jnYw1xzLIzvK4xd3AnaiGg/vuT0aDnGk0oK1CcJwtxN0u6rXi7K1R0/bKMypThpZK/pPZy3XpTDDrSNU3V8V3eHsjeVVqetsbrIjbeS4wWZXHTW8bXteO0z2ABguEq5paefRYq4POahoT0x2sFgg+4y0gZDXsg6+QcUMwBTeVitAOFGWZhNGTWZXdNfow4eb/fvJNQet3q/S3WNlqAKhG1D9uvzVzWeO3zqIlNn9h4CKeXa9b5d6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVIg6Is2hTbioXHkAX30RAEyZDvyYOvOekClTgUjN6E=;
 b=Fr5OIzsEGuAZWyCHpqPhhnEGjU7V49Q1RNEmK7SqAEkLS5gpulC5agDmn+Gykx/7zkYN0rM4vReA1XVYTJpmlcyKgxctWo8JaD7s4Z7hZ7cZAxOvjTFJABvqpUJuv0muRmaTrsZH0L2zizE3aQ1PdAlVGrtYsgtmOVtIRWyGGrKtt2+jPnF981Eqzf0jecjBKMB+KH0ZyY3K+WPC+qD4y7ijNmC9f/ASS9yaOVmiiA5VEjqVhh+mAYf6hZ7M4XNYvmuFnNQl4L7ovcuyJQBLEZ3/pJuiOGqaTJlufDI514lPmvWzeqW86xdFlvTh+oDLynYTc+YGZBZeeTyJeB1JcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVIg6Is2hTbioXHkAX30RAEyZDvyYOvOekClTgUjN6E=;
 b=D6gLStSI11rtIQmJgk3Mrmc1az6S+hPtoAfUHK7XydTBx6vXVyRK9qRBPUBufM6PQqhekCu+Ia3XooQODMc1IOzpcEkJDVRUCCVZMLKbIZ8zp0VDJ9mScRkhaqAlyZWTHtb2kMOSUkKQNk6FS++lzl7ScQwjGxdi5cywYyUvtIrxzkGGIIpO02dnCwbZ9MaFXDoJQFSr7Zfc6daKewqUiAy7KYZp2iiXBM9XVZvlLSDOZjWnPqv6MNVLLAQ28mFlsPzvrgZYTnnKEigIU4Uwq2kKmFSmmi/E0masLoYh9JZ7s900bVEiDn6RT5ZG/ArZFx6VZx9Bg1NWRg3Lrtt67w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
Date: Wed, 19 Jul 2023 11:42:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] x86: allow Kconfig control over psABI level
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f0c40d-5abb-44f4-b342-08db883c7086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9M/clh2pOlYzqe5UL4KkgNz0xpjFHfNoI3fwsYJjOsTNgPjOHEWO2fUnLY/3UmUh5W1de9H3piWb7XRT3x9ovs6P5cuSJrFhQOgi+cFt7ftDMDc2B7TX2+z3fZqDATbzlpUdLIV8jTJ6yu1rrU386r4rlXoSPt+liym4YHjYSnhN+hHeiNi85KrUiZ2oxCMEqVfPNllSuXuUCRetvvVHNLXhD4yXmE8heVL0PgPtHAHh1hw8mcIYQhCqaYfe5K4/9RCV/HCMwE/buE6g0GlztPiYDuTeXqMRCWQiV+seq2fRCqSj9JwuA9VWgRr/gVkclEFsJ/Bwx7fGrsaW2TuEfA4IBgCGMIcMNsh1uVKDL8WXHKG32mCCS5Pd8MtyWNTs8PUW0uI8lE2o9da66uB+6Cvx66IZcznjiOG/JPICkfVIryeifyiSaZF/j04mIjdt10ylMphAalCA/cM3jskqL0hqGN/h18Vp5OWISFT3b1XTg/zVzZPmAns4RRNGvO++hBn5rUrCA27C8URYWlt1SHZPE/g+L/pNm73WzvhhXKwF582HYFdE4a86H+4xa8Ezatj2RS9cUOPmvZ9+AioxTsEQgtHwdlAeOI02PgOnXTpCtnhM6hRomC7uKciobCHt7AXpTC6C6Gx1uj2qHRw3yQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(5660300002)(4326008)(6916009)(66899021)(66476007)(66556008)(66946007)(41300700001)(8676002)(8936002)(316002)(31696002)(86362001)(36756003)(2906002)(4744005)(6666004)(6486002)(478600001)(31686004)(186003)(26005)(6506007)(6512007)(2616005)(54906003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVVOb1dIV0tsTWpaYldpMnVPTXIyNTVPMHBmUVFRNUtTOGo5dFdTTk1HSGUy?=
 =?utf-8?B?Q2JMWnNjYmhCRnNScHFzeE1qUVAzUTRrazE0UHA4bTBtQ3NKWnh5emo5bjlz?=
 =?utf-8?B?UlNqSlh4c3dUdU1UZS84eG5SM0thT2dvSGkrNGZ6MWgvUk1IU3VUOERNZy80?=
 =?utf-8?B?NTdJelc4VzUvUllPYXRDUUs4TWJYZ0p2bno1RXdRSlRVRkVsQlBFbVBKSWpC?=
 =?utf-8?B?OXVIRi95QVc0dzFJbzRqTEtodW5DT1FXZXhvaitTVjdwRzBHaUc0U25MUlFM?=
 =?utf-8?B?R0VFL09lcGIrU0hkMlFvbXZFaEs4TDI2emM0ZXBrZ2RwM2tkVTMybTBXZHpw?=
 =?utf-8?B?bWtlUTFSWVhuZzBVMUxqWGFpTnF3V1Zhazc1NzBqRlRIWld0YmtYd1UwYUQ4?=
 =?utf-8?B?bGU0ZkdsU05tWUVtSmk4c2tNd1N1ajNic3dSNHNoUkdIbnowTWMwckFjOCt5?=
 =?utf-8?B?aXdmakVrVEhYQ1dTR1NwNFN4dXZxVURjS1VxWmFGZ1pnSDIwdmU5eENEZm0w?=
 =?utf-8?B?ZFpWQkNMYVNBRHozeWtwTnZIcWNNc2ZHSU5ZNnNkUGVVbHZ1blNGZkp6aHFY?=
 =?utf-8?B?NlY4b3JNZHVHdkdrUGZzSUNpQm1hNUgwdDJqVVd6UTM2aCtpWE9hejQrRTJu?=
 =?utf-8?B?Vnp2TUdsK0RLNEVxYlpvR3lmdndpa2s5dFBHSnBuaVpLcmtKSlRVR2NyWHR2?=
 =?utf-8?B?Yk9HVHhEbGtYbDQwT3lNTW1JTWdpOXRLOHZHUWNXMklvL2RsKzZPVGpPTWxV?=
 =?utf-8?B?L3B0Vjd5aDJGckFmcndlcURSNCs2NDRUaUE1LzFUNXFPVzRDMkk2WGEwMWpt?=
 =?utf-8?B?blN2UEZ4ZXV0WmVPNVRSdG8wR2tiVnBneDVoZmJHY0hPa045NklqOXpYdmNq?=
 =?utf-8?B?QnRoVEt0ZUVHSk8zNjFuMTl1Rzd2VFlWZHJYOWdsYll3Zzh1d0J5L1VxNVZQ?=
 =?utf-8?B?NFJuZFI3dVJvQ3VWQTVJSS9TdGVEOHBzQzIvbDZvalcwS3lhRTFvQ1F4Nm14?=
 =?utf-8?B?SjBJbG5KNTdJM2pidzQrMzBpbDFGMzBOczVrNUxYNU9pTzk2Rnhja3NSVmZv?=
 =?utf-8?B?bkxGK1V1bXI5RW92UXMxL2ZIZEhBckJHOUlXeHU3c1dqakRIU0pnR0FFd0dp?=
 =?utf-8?B?bTZyQWpPUjVsZGpxMTlTVzlEUXdncElDTVQyS040cUQrUmcrbUttSExXcHJP?=
 =?utf-8?B?M0N5U0JLTHB0RThaUUQ1cVc5MGRCckJNd2ppUnNYN2tyc01HSG54UDlyM2FQ?=
 =?utf-8?B?Vzl0bXpFbDJ0WHZaTkNWL2dCZnZOYVZRRkMvaWhTUTdvSXdRQmVHbUpxV0Ux?=
 =?utf-8?B?Zlh0dS9vUFdOMmEwbS8zbU1lclpHSnIvbU9vWVdIUG9FV2hTYnF3a1c2dU5O?=
 =?utf-8?B?QkRya3NVa25Ga0V3M0s5RHVtcVhHS1FsdUFGZGZ5aTI0dHN5bUpYSUxXZHQy?=
 =?utf-8?B?bEhOUXd2Ukd2azQ5SUlEbnpoR3NzTTBCUHY2U25ETG82R0ltOTdheFVMb1o3?=
 =?utf-8?B?ZG5MMnlvVlMyN1hTSzcyUnB0R1JMa0w3ZnZyaWtRelA4TTAzK3pkNTVRbG5Z?=
 =?utf-8?B?anZoZjVnV0RHVkdyeWxVWXhoV29zYjI0UWFocVIzaDVVdlZkRitkd04vQ2lD?=
 =?utf-8?B?Tko4NEZwYXFaUHlhTlpvdURaUlR2NWVjaXdEWnduNkVNNk1IQStmRGYreEph?=
 =?utf-8?B?SGhKMEJrenBMa3dXYm1LNkRycitxU1BudXhtVXdLNEhCQUtudlhFMkhYSW51?=
 =?utf-8?B?aVM5cmRjeHUrVWRDZ21iS2NSbmY4ZHJUekcxdTI4UFllaTNiWVRLb0l4N2Fh?=
 =?utf-8?B?VjhvNzVlWTY4VkZScjBjT2UrUzRiL3QrR2RjNXE5b08zOHh5N3pNWk1XYTdD?=
 =?utf-8?B?V01ldUp2VDQyRE1hejhhL2NzYW9LSmJnSzRDMnhOOHlYNWg5VUVkbEovZnhJ?=
 =?utf-8?B?Q2V0TG5qMnI3cWlMcFl0S3lvMTVUeWhQSkI1SnBuOVB4MVMwVis1TG94dEt3?=
 =?utf-8?B?YVkxQTFRaWlwZTdDa2wwckErbkh3SHU3dndUdHRva0JvSWhqWHlLaU5WNkJi?=
 =?utf-8?B?TW4rMGdmcmJQcTd0Zkd3Mi9EaFhZc1IxY2J4dnNVenhIdUEvdTM2Q2Nhekwy?=
 =?utf-8?Q?PftPp0R3qQlW3AuQWTJul0gAT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f0c40d-5abb-44f4-b342-08db883c7086
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:42:17.1627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DdveuQVVHZgPHY3RqZ5uejV4iMpMbAvAWZh5Leml5WX6utC9yHYD1D50nBnXrUBvE72sbi+ruqBFP2lJHyeiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6794

As discussed in Prague, with some minor add-ons (patch 2 replacing a much
older patch under the same title).

v2 addresses issues found as well as review feedback; see individual
patches for details. It (patch 2 in particular) raises several new
questions as well, though.

1: build: make cc-option properly deal with unrecognized sub-options
2: allow Kconfig control over psABI level
3: use POPCNT for hweight<N>() when available
4: short-circuit certain cpu_has_* when x86-64-v{2,3} are in effect

Jan

