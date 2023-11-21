Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CDB7F32E1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637935.994044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5T7q-0005oA-CD; Tue, 21 Nov 2023 15:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637935.994044; Tue, 21 Nov 2023 15:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5T7q-0005m3-91; Tue, 21 Nov 2023 15:57:22 +0000
Received: by outflank-mailman (input) for mailman id 637935;
 Tue, 21 Nov 2023 15:57:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5T7o-0005lx-WC
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:57:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5f03c98-8886-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 16:57:18 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7396.eurprd04.prod.outlook.com (2603:10a6:20b:1da::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 15:56:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 15:56:49 +0000
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
X-Inumbo-ID: a5f03c98-8886-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i078C2MGPvcZBjKQPscFeQhSnVMjOfm/YgTDS/soFfpvEgOVNARoD70nlGoBCgYp5abVKHmSnC6HGprcsHjk0ogCXFHWjzYFT07ONyYZFuGftSBOCXm7NrxIdSd9IssOUsm2vNX1sj1uYdkkNo7T02fnu6w9jbhI7pPwMMeZJ89dV0MQnd0p1KSd8d8XGV+nWS7zkbNYKO7V0pAHYeJP1G6Bn7U2sN+h00ml/gJ+EMaNt5YzmIyp5S2BALC4qiez8HDpEd1wiDQVMveOR8kuJxdD1BYgdKqaW5O0Kjae6enwBOZN4PJ4JqedciZj0rfPV1V+cucZNAFajOOFqgfsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBCj/EXm57kn1zsgTctsCCYf1FJwiCaUDCsegUb90x8=;
 b=h+Q74LQFUQT5lsZMZ0Aci2SiRbYBn+CGYATW7YhvQCl9Z1Wcdu/BiP6+OLx/iYc20MBHzCsZ2TTezw1oGlQrxHK3ua25CX9dqUwXn8gdwcIG4iGSZUCIvoLPgIBPe4B2M7SCiUBQsK9f1wEQQbamQswYy3lUv+7hdkwF3uqE4JZVaB2plTlQr33eAvPNUbS16XGKpeJmcigm2FWQlNqUAcB1pB/1wzlQXXViawYy0SJRsKHNQ0fDHfYX1stbtIVXxjetfP7L09L3xjmwxJh/Jypzy7btD/uBAGbVYAcDEqAhGgm6BrhR1GmnpFFqsmhPa3ieDQ0Lh0U7iEMR1+1pPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBCj/EXm57kn1zsgTctsCCYf1FJwiCaUDCsegUb90x8=;
 b=st2JqOD2MZKAtUBKLqJS6tq1RIvNoJjWVsth/BJQGez0UZsHxwX2mqTyEKZzogGy8caUOr0RbBwVWHR8pS/ZnhcFCLG3H9ExrdSmVFLhtfmjHOvj8XaJAreju7gWdljZDJxXUzBFsOzVlq04IY8sfUHWVoiiTfaHmO+AoyabpqGMh1bhheAmwsAzyY5kBWGZSU3EpM0eSEanVaTQWrg28bjpCDUNoVsz1dzGSABD4tuX47VwEwVouJ6mFPN6SKTcd25EZq4vyUibm3jmpf48Y4gReS5TPEoQw03lI8GtsZqM7rt+B3Dq/KeYH2hnaxY5ABf66tHn8vm4OGIHo5BeEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcad55a5-2582-41df-a2bf-6e83ddfbc0a3@suse.com>
Date: Tue, 21 Nov 2023 16:56:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] xen/asm-generic: introduce generic header
 percpu.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <51ce486a825a1654998db01c4e07c127e4b1b38b.1700221559.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <51ce486a825a1654998db01c4e07c127e4b1b38b.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7a985c-b42e-44cc-4de4-08dbeaaa7871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N7VXin8G+Br15S9USq6LghluW4hByHWCAX8nZ69Ix/S9BRzcm5Yw+KtXubhsShOnnqN1gXe3224/e3/hyOOFawfn8DV8zv6dVlZzVkVJ5zbBNbto2ASe3lvUZ6IG0N2UpI+MtNInFoZ9nyhMHylKzTALSk3vWYOl+qOBSUr6gSHiRmU3Xr+na/bD4FIZJ+VH7/nZhg5kZJPrSqhHz91fhsWr9vGTGRXrt764O+IVzbKeLdJgj0drBxcpejHcXA4z6yzK43up6d+KefRS5mH2z1ZN6EPAPQg4wgW0XsBPi4sxnZHSxhImxtsjC9TN3wOLqe96uVrx4xtPFhTIbrqOwvkLObvWA8vIa5ejGEVGRhIKFwWbjGYNAwxREsYkEq3dcG8aLPsV4uZEF+12Bfs210mknYy8vqlbSauoAtfqeN7wHy1nOkQaZXgPeKCri0LNTqSj0e3VbviOvf+M9YIl3fAMswnej4R/lLwMe8fW8qGS/e/Q3BJg7LKdXPke9JvDrWmF5zJdnS7Pe7Bt2UQUBU71xhDXKoKqUsl8UyIQMT1jE7b3eULPWcQti9Ia6KZ3XzmlSdhWZLPYi7HMaRFmbOw45L6Ecd9+dQTRPE3etZfLv8rky2V6qBgDSBihr6FH/sPnuLU1kegH8v8sym0Ly01d0hcIKX80Hos49j4qsp8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6512007)(31686004)(6506007)(6666004)(6486002)(478600001)(316002)(6916009)(8676002)(8936002)(66946007)(38100700002)(2616005)(66476007)(66556008)(54906003)(53546011)(4326008)(2906002)(5660300002)(7416002)(31696002)(26005)(41300700001)(86362001)(36756003)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Lzk1WGFCOVR5SitrRW1MOW4zN3pLQjNhaU04aU5Ja0ZWaHZjVm5xeDBHNkw0?=
 =?utf-8?B?OFR2UU41MndXcmdscWI2Z1BaT3RtNE5FZG00WkRSSkYyL0ttaEFYS3VwMHk1?=
 =?utf-8?B?ZUpvTWtkbkwyQnEyRVVyRjJmc0lHM0FlcURsd3FXVC9kUzVtRFNwRlA3MDBB?=
 =?utf-8?B?UDA4RmE5YTdadnJrY3Bubkk5ZmpYOGtUcVUwdm1hOFpvS3V2akdPQ0QveUJI?=
 =?utf-8?B?WDVodVMvNjVUNEFPVm5jQVo3d0lLeGY3NG9WTTB2WlZEVjN5dGpEOUpQV3dn?=
 =?utf-8?B?a0RMVExSaWlpcjVQdlkrZnN6czYxd0ttcGJ2R3RGckNUajVvb2xUM0lNbStl?=
 =?utf-8?B?Qm42RHpmbWV0UXlkZE9BOWFOMW1MWjFMeTIzVkZCMWlTWGhoYjdqRVoxc0Q5?=
 =?utf-8?B?clloNU9ObmdmcHdPcGYwNVc5WHhGK1pWbDVFQWtPYVFTT21TdTRGdGdqOGxW?=
 =?utf-8?B?SEV4Z0RpazVoTVVlYXBOVFRNSlV2OGJ4V2ZRemtERUpWUDhMK1BnVHg1V1Jv?=
 =?utf-8?B?M2ZVMHRUeUtrZGdTeUdzUTIvVmJEMTVrRnZyOVpYS1BuR2ptTC9PdjVXWG9X?=
 =?utf-8?B?UnJCNFhtODhkaTE3ZTFlaEZWUTMxdFQ0QTFzbXFSUFVQS1IxOS9Za3pNcHlY?=
 =?utf-8?B?MVZMMko2SzFraUJldUZhMmszL0VTa0dXUWVZbW1FNnJ2bkpQQ2RVelNVTVNn?=
 =?utf-8?B?YVVjL3UrSldTL09FdzBQbkdjakg0MzVoc1k5MkNOZ2l1TU8xWldVTElHS0M2?=
 =?utf-8?B?RmdMN0UvOTJsR25nMXA5c0tEand4UEo1WFpHNFQzY0RRSFczMkpFS1U0bHMx?=
 =?utf-8?B?Q0NjU01ZdkVpUXMrS0ZlN0hKK1Q1ZStqL0NTY2lwTVhDeGlidUkyVG05aU5H?=
 =?utf-8?B?ZlpyUkJDSFd3bTdnNytqcURhY0ZSb29XOHpVNk1Ka2g2ZXIrS29pdlZobDdQ?=
 =?utf-8?B?azl6ajRxWm1NbXFkempwQmJMcmlveCszNW50MFh6TWJXeUJLOEZKMHU3TkxZ?=
 =?utf-8?B?M2ZTMW9Cb0VXblZySHF0U28rM0xibTlOZXRGcC9JTDAyT3hjQVVOMWJ3UkNP?=
 =?utf-8?B?MUlvOEVWT3FuNmdjMkE0cUw3S212MkxhbTRrUHJ0OFJ6QTNEOXFuMTNseksr?=
 =?utf-8?B?Q2NCZlhHMzR4cVF0T3UxSFFubWM2ZHhCMDNTZ2J4b1I1RmV5dHlrd3ErNmtH?=
 =?utf-8?B?WVlmN1EyMm5iMnRiMDEzTWx0UEVjaXpmeWlxNFNDMHd5OHRCUFY1ODVHVnpu?=
 =?utf-8?B?YUw3elhPakJYUkxSWEpUc3N6dlpwdDVNTlIyeWYwUXc0bk5PTjRSZVVZWVlD?=
 =?utf-8?B?enBTTHBtQWdKUURzSmZCMHRPc0FHaHI2TkorYnFZMVFjMnd6TW5LVXdxWGlH?=
 =?utf-8?B?ZWtRVWgwRlRrZ0xNS0tNK0w2YjBsNDFFM3lYYWUxM1ltUEdlWnJsVlRBZVBK?=
 =?utf-8?B?bWY5UXQwVlZnb0RRQ21MZllJY1YxUEx3VG1XQkF4R1AzS3VGaW5peXVmZk83?=
 =?utf-8?B?NUpvRW9Vd2ZKOGJSRjZyQk1uRDBWck5lWGpaWk13dzkvS0dSMDR1L3pJZ0FD?=
 =?utf-8?B?STU2c2UxWHRGM0xzaUNtTzRDZ1dqYWhlMkwzU1dFSzVUZEhybHk0ZkNNcVFs?=
 =?utf-8?B?K29GUFNoODNveExQS0hjRm1sVENYZittY1oraktUWU92TVh4bkdoRVAvN1U5?=
 =?utf-8?B?Z1NZN2VvTmtmcmN0bVFnYjVmV0E4U05IREMreUlNQkNidWxaVmcrOURaNUdP?=
 =?utf-8?B?REt3RE8zcUlZMUw2KzFzSGY5anhzNjUzQkRMYVg0MUNvMm4veHplK1FKS2dp?=
 =?utf-8?B?SlNkR28yTStJSEY4OGNuNFJMNml3Z28renZJNmt5TXB6Q3ArQjJWSXhucDJw?=
 =?utf-8?B?UVJ1UlhEeFEvWlBYVnRxckFmR21UZTJNN3pyMVJDMTlNNVczTFIxTjlXSnFZ?=
 =?utf-8?B?TEUwMURNMHJaYWJLczd3Y0dpL09wQVBya0YxS2VkbzZjNW1jczJmV2RPRit6?=
 =?utf-8?B?TE1CSE9xZjFpYVBIWW9VTnZRUXo5SkNXQWhsUEdKTHg2OGU1YTNyS2pWRWs0?=
 =?utf-8?B?TFFmSGhaYThuTHh0VlJuYXJmNkhXSG81bUNqZjM3YmRjYmJYZXNiWjNBOTd2?=
 =?utf-8?Q?zpc91aTCZIgjYD2r0tf4tgDfR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7a985c-b42e-44cc-4de4-08dbeaaa7871
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 15:56:49.0523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hc+lVkXmZ/tQWTeg1Tmds9qz0wOks/xLnf0VuIqLm6Ztzn8046lwvZRAGQz29N5txVHFEqtL92Lc6HdfKzE98A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7396

On 17.11.2023 13:24, Oleksii Kurochko wrote:
> --- a/xen/arch/ppc/include/asm/current.h
> +++ b/xen/arch/ppc/include/asm/current.h
> @@ -4,6 +4,8 @@
>  
>  #include <xen/percpu.h>
>  
> +#include <asm/processor.h>
> +
>  #ifndef __ASSEMBLY__
>  
>  struct vcpu;
> @@ -38,6 +40,10 @@ static inline struct cpu_info *get_cpu_info(void)
>  
>  #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
>  
> +#define smp_processor_id()      0 /* TODO: Fix this */
> +
> +#define get_per_cpu_offset()    smp_processor_id()

This 2nd item can't be quite right either, so likely also wants a FIXME comment.
Shawn will have the ultimate say here anyway.

> --- a/xen/include/xen/percpu.h
> +++ b/xen/include/xen/percpu.h
> @@ -1,8 +1,6 @@
>  #ifndef __XEN_PERCPU_H__
>  #define __XEN_PERCPU_H__
>  
> -#include <asm/percpu.h>
> -
>  #define DECLARE_PER_CPU(type, name) \
>      extern __typeof__(type) per_cpu__ ## name
>  
> @@ -29,6 +27,8 @@
>  
>  #define get_per_cpu_var(var)  (per_cpu__##var)
>  
> +#include <asm/percpu.h>
> +
>  /* Linux compatibility. */
>  #define get_cpu_var(var) this_cpu(var)
>  #define put_cpu_var(var)

While you explain the reason for this movement, it still feels a little
fragile to me.

Jan

