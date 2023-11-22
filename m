Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584297F4369
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:16:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638658.995469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kH5-0001Tx-1D; Wed, 22 Nov 2023 10:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638658.995469; Wed, 22 Nov 2023 10:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kH4-0001RB-US; Wed, 22 Nov 2023 10:16:02 +0000
Received: by outflank-mailman (input) for mailman id 638658;
 Wed, 22 Nov 2023 10:16:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5kH3-0001Qm-FX
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:16:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 219240b1-8920-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 11:15:59 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8684.eurprd04.prod.outlook.com (2603:10a6:20b:43f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 10:15:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:15:56 +0000
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
X-Inumbo-ID: 219240b1-8920-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNpHR2pWcsg+oDfGtds8UxaXRr1JXUhYUXEwnGZLmKRZLBFvwHrUpiUVkeBZVyCXvnyx6lC2zloh9RtTjjc/Eq3hQQsmnLdv5Vyyg6KuruQ66e7zCqcncIWR0pzrrN6ZhqOVVBOPqivHZHnCfrGgib9YCylzI6lZXJ1xSJiV660Rg6tWwqHm1lc8cS3suCwvofPcOnUbqrAsmjad9MSFzNmpnk/E4DSt7tLNU02UPsNajG2FW/Hm3xHzrD4FGhN8A9o/WSRY2idybyxMVYTuKY8pWYQgTahfb6ffA8coMwpBCBaWk9o3d19flc7IlRzJX/q30Jjg5W6UUhzpS+KfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij8OSWwPUG94LjOI4L94nIiV/APZhctvqMzTAW6wQI0=;
 b=KPdZ7o1YRU7mrwYPazKCT6YqgYbYRVTfZ570sGJyD2mTzOx+YYJjY06qHAgKNT+fOiKb6RftrM67E0JTM6wwr/8BJcZ6gke503obBr52u0HAK14qpNeZlaqwtTc/t/7rys5/IZr92wNW+1oYk0VykONNz3Dzv2xN8telK5+fJI4UmjwqpDYLemIgwP6qMkaa/7DiPyO2EJ6MLe31s0x/zH4TLi7WcMO0L6eW841O3/iyngqtN5z0Njbwk9zVb0u7jalcRzAElVwzGGfPKdhdtJxnkDCvfgnbU25jiJ/oEvxFwMIW0LwxwmfpHKZbyVOyQXFdtRR/lXal4exqSY501Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij8OSWwPUG94LjOI4L94nIiV/APZhctvqMzTAW6wQI0=;
 b=w3mjE3iaqirIgzgtVkaDBKJ2pKITm5YD5c/0dMtpTxQ/NLeiYyLE+0s0Zz587GHudQOUyhkVXw/KWMlhoCxdisafGNt9VCsXRuo/EzsQLKYlDidMFZp3okTcPPT+QeDWhINsJ85XCcdvaji0ykvxzoMw33FcUxn77qLiGilmuHcNRTspLKfOA33g6A3GABoH0jT42H+PX4yZwraaBP+A7fK8s86n097rO13q6fi+K+bqXK/6vU/CAj1iSMjljMYWw+yBWwHQ3MvwxTrDyHvD849G5ShdorKLG2sRYodqasPPOawJ6nPOcV7DSR2EJQPjxO7SAn4OAwsXHLaprcZ5BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <130e0ed9-fa40-4622-9637-98d326cb740f@suse.com>
Date: Wed, 22 Nov 2023 11:15:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/python: add .gitignore file
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20231122083153.24101-1-jgross@suse.com>
 <20231122083153.24101-3-jgross@suse.com>
 <5471227c-40d9-4b85-b4f6-d0a41c471166@suse.com>
 <2016455e-6bbf-400a-82c9-05128487c5d4@suse.com>
 <a00b32eb-002a-4a5e-bc2e-6e9482a17520@suse.com>
 <84234983-f811-4e5a-b01a-0a68f2e73447@suse.com>
 <1ff6aaca-af90-4982-a8a1-a9d8c8e2934f@suse.com>
 <5d293743-59ef-4a98-b018-cc7e92d76b29@suse.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <5d293743-59ef-4a98-b018-cc7e92d76b29@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: 2402faf3-ec3f-4285-a9a6-08dbeb440457
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rIq/frVrKW59/UA2I2nHByzHAQpQ+4aC0g2UiEs1Oa5Tr1YBY/p9kQVo+wkebRZchaNkyBvSak6q0JChDitd/BMvBGum0Zj11Ccpsyd40AcCLuNL1ttPzdUjSicsEoHwb8wEmJTgIkb5lHnYsj7HGdE7Kg9Pzp/5Oh2CMY+VJhXTCZraUaqqQGXSYpQ5T0faLmjFDLGPZdpnkiiAi3jY4dzE3HTeKWExZto7rHhjceY4/Za8YRyq20CGkoQcP42DQBtSyZ+3zL3VkFdNZDEMnZUON+9APK6aUUZkwgHUbadWWqAd2kNvPDqWKkKNdWPoD+5BfkbEuidTYmY/rtF+rxbU9l16WYbI7LkM98yoPHfljBGiXUKZUOVEva9HCBqYfbNY2He3EYC3pnLQYVqItituDobLm8GtaOCtVw/9aqr7hQSkkOGgmn8xgarBThM8deAjaT7AlNYSwOeTyokE+Zk62xLF6Rc83AYnVBHoFBqWm3YUbL43Im1y24M5wjJw3iD7I0vAOzX35BbuinUQaTAWLLNgL+hCrInoHrHkghzCqmM6U/Gd72V/fOcqMO7Qz/K7F6ubJHbQXfQm+FOvg6EIaa8JvUzgni13/m6gV/QTwv3t3ClAvhcL3QtQC+6n0Su9cIRzdCMCkj+lB/peEqThU9GjuCNhFWzq8TsvApvPsYN5K9J1BcBhDukLgKS8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(376002)(366004)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(4326008)(31686004)(8936002)(6862004)(8676002)(31696002)(478600001)(6486002)(6512007)(86362001)(6636002)(316002)(66476007)(37006003)(54906003)(66946007)(66556008)(36756003)(2906002)(41300700001)(38100700002)(26005)(2616005)(53546011)(6506007)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3RvZjVheWQ0d2prTW9HYXYxT2hsVk5qMEJaQ2ljLzlsZ1p2UjdtaVcwVUR3?=
 =?utf-8?B?cjFqcitWRzlOMWRmSkxuQ05VVFdoSUs4RFFKR0FxVkJ1bXY0OURFc0toMGQr?=
 =?utf-8?B?U09VY3lvREpUQk9FVzNxVDFzemlzUXp1Q05Ud1ZTWlRnM1BwYzFvMHIxNmRu?=
 =?utf-8?B?WDZqZWQ2anZXQjFmZ3J0OEp0OWZSYmhaVzU5eG10cXAwWnJXbTVubCtYQ1Z5?=
 =?utf-8?B?OHlHMzUwNHlnbVU2azA2Y1djTHBWVENHYzk5WUUyMzhvcmhTOXRwcnhyK0c4?=
 =?utf-8?B?QjRTS2RnTE0rM3pEbXdNa2lWeU1Fdzd0dHdFRUxoc2ZSTjM4a0Y4dE5JME9K?=
 =?utf-8?B?ckxCT1lETm1zcitTZTZQRkpNMDFpb3MwZi9ua0kzY1gvMTZVYnNXTnZEa3hV?=
 =?utf-8?B?S2pGWXF3czdJaGwzY2dNcUVHeDJPYUFrZjBabklodUhRYjNqTzVrdktYV251?=
 =?utf-8?B?VXNXS1BmUm9IaWNQWFFXSWxvK1IwditkeHl4RmJ3eVlhUDAwNU4rSjBOVEFy?=
 =?utf-8?B?Zmdkc2lNaEo3dFBibS9xMjBidVRHb1Rxc3BCN0QwSE5KV2dRd0ZoU0xZcEtO?=
 =?utf-8?B?c2Z4TWRwWC9pdDY2SEpwMi9OUXdxWWJ1MHdCWldPU09KWXV0TmhTNXlTdXQ1?=
 =?utf-8?B?MjF1M3I1eHdoSXNlZmhtOVJsb2x3Y25RZFl3RnNubW45SmJMMWk2RnVsT1Zw?=
 =?utf-8?B?ZnVvZUkxcDZLUkJaSWkxUld5d0FnQ3pJd1Q3a1g0eDBtWGIwc01Fb1d0TzV6?=
 =?utf-8?B?VFRTenJYVmZjRXRNQm9UMVpWYVZpSU1CNnFnbUtMYnVvcnMyQVowSDAzVHM3?=
 =?utf-8?B?a29Wc3Z3TnY1NFVXcVZSOTRwSVBJZWxjZzVCYUtYeS8wZXMzazVhSU83VFYw?=
 =?utf-8?B?cThqZ2NoT3B2OCtDUmx2MHBEKy9CTWVZd1Z1cTdOWTJqUFA2cHhGNXNBVWMx?=
 =?utf-8?B?VFA0cTdQOER1dnJIL2tWMlBXa3d1anV2L2U5cGgzbndOU1BKR2RCSVJRTzFq?=
 =?utf-8?B?Nm1ZWTIxTXlwWGNycDhVTEJRWDhZUFFrQnNtMDY3T1dUekNEUlBPOHhNakNV?=
 =?utf-8?B?djhRb0c2K2c4Z2VmZXBaMml1bmdQR1o1OUFTeWpqbzhQQ2d3UjV5OTYrQ3ZL?=
 =?utf-8?B?MXhNNStqU2dlZlhseEhmNFNCSDRqdWJNWHZBYmc5T3FHSldLdjcvdDY0M1Za?=
 =?utf-8?B?dU53NUFkUmhKZUlEdXFUMGxxY3htZ08xbGltOHdBWlBDMVZuVXlSeVgzNkFV?=
 =?utf-8?B?WUJzbzF0OWV4TUJzSmNMZDI4T09Na1dkU2tYTFczaVJaWnJGekxQSGg5cUh2?=
 =?utf-8?B?ZzRBR2Z1Qk91VUFTNXBZR0Q1TjFwUkYvWUdnUjhIdkl4MTR2TTlIeitiRWlG?=
 =?utf-8?B?Sk1SRDc0VzRrS0dhL2F5M3IxYTFqb3F0Rm9WWG1Rc1lrcWlXNzhjbkZodTBq?=
 =?utf-8?B?ZXNya3JtL3FLa2Jld01nTFVPdGM1bGVCa0F4VjRzWW1hQnNsdHdPSms3VHNX?=
 =?utf-8?B?SWVmMWQ5L1JrdWkxbUZrL1FpWXBDMU5qWXNhQ1Q1QVJuQ0ZyZnluaDRJSEVk?=
 =?utf-8?B?TktPTFBONW50WGhmdTJkN0tKMjladTMwU0o1YkJJN2NjUjJ5TWJNci9PRThj?=
 =?utf-8?B?Tm04ZHZhNHdwbXc4VFJiOTNCMSt6WGVxTkFCR1RDeTRWNTRDVFpYaEY2NHcv?=
 =?utf-8?B?OU1CK3BEdDY3ZUk3aVNEeW9jYk56V3dpR1dCWlFWT2hlWjQxeTdCMTNyYVpu?=
 =?utf-8?B?QytOTXdNazlhQ0ZqTDJIM0ZGNUsrdVMzaDVmUFkvckUzZTlhZStqeVpjaGRO?=
 =?utf-8?B?NnZzWmZLVExZUUFnSzJLeHBncG83R3FWOExTdm1MRXVmV3NOVmVjdEdlbkto?=
 =?utf-8?B?Z1I1MnlsVHFaWFpzSlIrYlZRVSt3Ti81RytYKy9VQVhMT2dWREJ0MGRESkU4?=
 =?utf-8?B?QmRWSW9STFRmRC8zOU5oT3BxK0x2Nk1ram85K0JqYjFyUzBaR2I0QUNZbC9n?=
 =?utf-8?B?OWpxQU1DVDJ3andKTDNwa1VVSCtzcXl5OFVEOHRnT0U4ZWpUYW9ua1BMd0Nt?=
 =?utf-8?B?QmFMQ3JWMVJxQ3NMckgxc2llOXluSVdLUUw5L0RabjlEZXNIWUFIS3dEK1lP?=
 =?utf-8?Q?Hyp6Od4S0S+E2aia8+hqCPY+O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2402faf3-ec3f-4285-a9a6-08dbeb440457
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:15:56.7129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTD8ZkRxr6hhHJhgjxwGtzywhtX+kIM5SlbyoZpEpfWqftd4j9cK/P3wMUwDfI4tWkmjd8PqD6+KNZHb7sYRGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8684

On 22.11.2023 11:07, Juergen Gross wrote:
> On 22.11.23 10:59, Jan Beulich wrote:
>> On 22.11.2023 10:53, Juergen Gross wrote:
>>> On 22.11.23 10:21, Jan Beulich wrote:
>>>> On 22.11.2023 09:57, Juergen Gross wrote:
>>>>> On 22.11.23 09:39, Jan Beulich wrote:
>>>>>> On 22.11.2023 09:31, Juergen Gross wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/tools/python/.gitignore
>>>>>>> @@ -0,0 +1,4 @@
>>>>>>> +build/*
>>>>>>
>>>>>> Are this and just build/ actually equivalent? Looking at our top-level
>>>>>> .gitignore, I see e.g. extras/ and install/*, which I would expect want
>>>>>> both treating the same? The form with a wildcard, to me at least,
>>>>>> doesn't obviously include the directory itself ...
>>>>>
>>>>> The .gitignore specification [1] suggests that we should use build/ (same for
>>>>> the new entry), as otherwise entries in subdirectories would not match.
>>>>
>>>> The description there of what a trailing slash means isn't really clear.
>>>
>>> "If there is a separator at the end of the pattern then the pattern will only
>>> match directories, otherwise the pattern can match both files and directories."
>>>
>>> "The pattern foo/ will match a directory foo and paths underneath it, but will
>>> not match a regular file or a symbolic link foo"
>>
>> But this is all about entries named "foo". Nothing is said about whether
>> foo/ also includes foo/bar.c.
> 
> "... and paths underneath it" is rather clear IMHO.

Considering other text - no. To me is means other directories named foo/,
e.g. bar/foo/.

Jan

