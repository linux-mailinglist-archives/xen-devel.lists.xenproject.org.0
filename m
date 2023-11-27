Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1147F9DF4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641952.1000984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ZFp-0003Bg-O9; Mon, 27 Nov 2023 10:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641952.1000984; Mon, 27 Nov 2023 10:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ZFp-00038h-Kt; Mon, 27 Nov 2023 10:54:17 +0000
Received: by outflank-mailman (input) for mailman id 641952;
 Mon, 27 Nov 2023 10:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7ZFo-00038U-H5
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:54:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dbdaeed-8d13-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 11:54:14 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9320.eurprd04.prod.outlook.com (2603:10a6:102:2a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Mon, 27 Nov
 2023 10:54:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 10:54:12 +0000
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
X-Inumbo-ID: 4dbdaeed-8d13-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsjpNRhGj/SotU+bohYns4KOSLtSge2vMFyZtt3EexcRXroc7PKuLqFDPCGN7ytsJDwwyWHadKhCx63r33pPx854wjxsshg0HBwUDhioCrk4lHGGinBnbqGS01zdjiS9X421kAZJDHseNxPlNrCgknU2dLTD2WIwVV0iqb8k9Z0WdXI31nxc/iIRTALy5bWiBtIrU6Q/sW4xDCagfBplAwf8K27N32XxnZU1GlSCVbIcYTRgpVVo8eeszA5BaiGt5/856vOTeizJtZl+9bPEia+Tp/dEDXrApz2w61h4zg2dgv1wEJ2fcqzm5iXOQZoxUgAL6/Ir6D1k7O+QucXV/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lonXkSG6ucxcf2J9VlLGMSpSz2zvsXvrVV4yIN8rGQ=;
 b=JER7J9EWLZCc6Unc29eLeiiWWLCzvE5ZK6YUZDoTGzJY3MCNSWu+xHAtrRlyaAzpOxGqKROIpqgpp99vfATGnfaGH/9vNyLJRtWvdB62aYHdhPKwPZeQkaGjPSsNgMVjYhptC3rQW6FJ960A8S2d12bIgtC5vscV2b3io6haKNqJvJJvQvtzhzIFO3/Kz8WhpI6ul8DqMEj2AOZY0uVf/lU87ybyPqIf+lBU5Gj0bK/qFgC+o0yxrZgI0e+VdfXc9iJ1nilNj4oU4ivTz9uGr6UCeYV9BqVJM84nAq+RmXRA/p2l3BEiJUNUvYFC80Fz1F/efxUuRknYgj0DHZNGRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lonXkSG6ucxcf2J9VlLGMSpSz2zvsXvrVV4yIN8rGQ=;
 b=w9lZe7jgVwtEIQORIQSwf55GAjWhQvb9RkcBhEBCOOUUhwOkYPY6ucEgRLNKtwa+rOwVryGcmVY1n1EkjTLr6/dsVoT3Wp6Jp9CZfudIwL0YnAwKma0DNQOxbKgQeLEr4TcTH2TRQMrkkZNs2FnXxRCXyjiT8tJ7aVw8URsNidbTZHt8ZmFvTxm4zHF/fWzC23XXb1I2YDHEjjlFAcbTlTFtIM0v6qvwGCqFb4JP6+mHXEvSOeucexJk/hG7C0G45tq3xF9/WZW8eLU7SszPppsg3WQZl39lty8ugg0I27JPfpRRVoxX3IWhyT6bc0XvQ//Qeuz+87Q1319U0bFbGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d4d3dab-f5a2-4b57-904e-e48642f7937f@suse.com>
Date: Mon, 27 Nov 2023 11:54:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] xen: address violations of MISRA C:2012 Rule
 13.1
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1700844359.git.simone.ballarin@bugseng.com>
 <771a6f804f4e7dda3897359b57d1d14c2878ea16.1700844359.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <771a6f804f4e7dda3897359b57d1d14c2878ea16.1700844359.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: bd097ec0-12f8-4727-9633-08dbef3730ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cc1R7s9qAY9GsTrkJgg4acmfRhbk7fTUpgM3gE9pOJLgMgMB7VGZ16DK6jiMy20vtFTLiXTj2jtWxKRXV8oc5VFffbHoSO/p09+FL/P6UUvEE0i/RdUatg9Z/2b9lU7SeILTYtAVIZqG/N4yFm82dBbN1PjW2xmLvU0mukDMEOTio9JPhLrsujmq88m/1Eq0wi6UfK7oY4+NpQNKSKNa6cSrcD2KJQgVieCTGLP3O8ClG/B78WlhLxm8krxGHTxSXtWlyALS6Tg3zrglmL8s35ZOnsAiPy8EwvBTQsuY6hlOQjy9XV94rv+bYlaQG8FtbkLWlkaf4d9OlzKtuN57qVWYgUc0m9wrVCxU0SQjuHXYAtFnswQ+EmuzK62Q/XmuxUP4oH1ZkiD41y1xy6cFWqFt4pchRhN8gsqSYyZ44zVpnkKBh5C50RwBY9PiTqT+OpQIBDzI61bVlfO9Zkisp3IKJ4nReZVMREsC80j1pikOvJC2TxMO9NXPNRnGGbpj9ZRn9IAvqU53CSzenjnSYOPJClSl9XQvoj8GX+EIuSfrVoGhUOVmUTWzSO1kBdSufxThKp5qSKCmo25q/I/7RPcenzOJc8wTPRQxu/Do9LiFCvJuYK7ZBE7XHX5r4ASQ5xmsSdbdM+dNH1XSWP737Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(83380400001)(38100700002)(31686004)(4326008)(8936002)(8676002)(53546011)(6512007)(6506007)(66946007)(316002)(66556008)(54906003)(6916009)(66476007)(86362001)(31696002)(6486002)(5660300002)(478600001)(41300700001)(36756003)(2906002)(26005)(2616005)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGNZUWhIc0Y5dEhvUkpRajk1eCt1K2lRV2YvNlVwTG9WbUY1WlFIQi9xSmJv?=
 =?utf-8?B?OWFMc21aNlU1L082dnRiVVlodDRNbFRVeU8yZ0UzakhkZmJiSmZ5aFNxbzN6?=
 =?utf-8?B?MTRTdHZyTWtOMi83c2dPciszVGx2WmQ3TmYzQXlNUE9ybU9mTHpnbFdDVlZZ?=
 =?utf-8?B?aEdXWDdPb2R6RnJmSlN4b0JQcStGSlgyaUZoem50c0Jaa1dKcDdJTkpiYi9h?=
 =?utf-8?B?RnkrMktxQVRBcUVxUk1WM0kzYlUrN0VwSjQ3MklYV3Btb3hPcGQ0ZXp4K09F?=
 =?utf-8?B?MmZGNnVIbmlXU1dJR1VkVFpJTTBzRkFNWkg4QTBlVmhIbERZRHFQSFhuVnVK?=
 =?utf-8?B?cVRqNDEyRnNFM1hPQjB5TkxjczVKdE43ZkFoVzl3YktxbWM1RlFONnhUaUhO?=
 =?utf-8?B?R2cydlk0UnNVYVdDTlJXZ0FmMzdBMHdZZGZpRWhNNGMrdnVKWmxJUG1nSGcz?=
 =?utf-8?B?S0k4WUlYclI4QTlINVhKT21KSUZ6MDBpQVJBSjgrblEwZTlFSHFnZGQvWGRs?=
 =?utf-8?B?WVhPNkhlK2s1UE1XYm9VcEpSaDBBa3NVUG5XejdJclYyUDlzN0xCM0piU3Ey?=
 =?utf-8?B?SGxGdFVHY0RacVVoMnJWWkx2ais1aUJpTHlYaDA5dk9leVJWZ3dUQXFtNlpQ?=
 =?utf-8?B?RGhQVGE5NlV0ZC9EWWNBY2ZqSk12NWJNZFJEREVjdmpVYUFMcmhHZEEvUTV0?=
 =?utf-8?B?dlNFMXkwY2pqRFI1T1IvVWkrVVlUWHc4cTRZM2F0d2szNFE1OG9GMmNSWlA0?=
 =?utf-8?B?MkhDeUM0WFN3LzZQU0pCYjROVW8xN2hveEc4VFYzVzZuYml2U1Jmd05GV1M4?=
 =?utf-8?B?WjJGMTJmM1F6RTdiRU5INkMxUU1uR2xKQnUreEVJdEN6UDVtOVVzWno0Zkwx?=
 =?utf-8?B?T2ZmWXkvZnc3UUZNVmFHNTNRd2pLVXBHQXpXMksvN2tIMFV2YVVjZ3UrSlBF?=
 =?utf-8?B?NG9oQmt5V1kzVkhyQlN0ZkRTYytpYjJMVTBEcmI5cG8rZjV3U1ZnckVhekpI?=
 =?utf-8?B?dlJIRHRXdjZWcDhnVThEME1oYmZobXhzUmtTR3pZTlFucVRzNklzSHpuYjBP?=
 =?utf-8?B?MzVRUnNYdktCeU16UGd1NlJXL3FQbE02M2xyZEppR2ZqUlFKYlJnRUNQb0dV?=
 =?utf-8?B?azNWOFA4a0RLRlE0NEUxYkFPTzFWNGZ1WGdIZEZVVGJsYU4xb3loODVhSVZk?=
 =?utf-8?B?dVV5Wnp2N1NNSHYvOFU4UlFtekpFWk1nSVR1YWNRVVJnTGpVWUdXaHlvT3Jk?=
 =?utf-8?B?UkpCRDU3ZDNLTzlOc25ZQzBYL0ZNYTNSNklWMmt5VUpMNS9xc3N4Qm9BQk9y?=
 =?utf-8?B?UGZhcHdaK1hEano4SjkrSXh4U1ZYRVNGa3ArZWZZS0RHYmI5UVp5ZDlneFdP?=
 =?utf-8?B?cVVBVXpsdVNuL2lKWHcxMVVSRHJXMkxqa3h4Uy9jYWQ2SEp6VEMyZ01YNW9k?=
 =?utf-8?B?cUZsQXo4YTRpWER6b0ZRVXJXZzJmT0dWcHZZNk5FbCs0VTJWRmo0SVRsNVFG?=
 =?utf-8?B?djVVS2NXZzlIVnRKbG9yWkh5MFZIYW41TkVJcUpPL0xwOEYraktENXFHZWE0?=
 =?utf-8?B?SFlEejJSUmJIMXlaQi9lM3g0emNxcjBPQXU2NHRJcTZPRllOOWNBYy9pcGlH?=
 =?utf-8?B?cDZRYW5SbVppNlR5bkRhOU5KbmhYS29ERnpoOVdhNkdBNkZSRi9YQXpZNlVa?=
 =?utf-8?B?dmM0UWVMYXdhTXlLWE9ncmVCK0pXem40VUYrdW1uOG1aeUllWXVMcXhlY2Vq?=
 =?utf-8?B?S3I4RGprVjJIaUFuekJjSm40ZUFWTHdHcitLYWhCWjBXVmhBcjdmZitqMzR5?=
 =?utf-8?B?dFM5N3BEL1pPZGk4aVdHUlIyM0lmbzRQaTNxSFJFZUxwT05nS1M5NU5qZkFs?=
 =?utf-8?B?aEo2bm9LNVU0NnFMSmxEVjhPTVRhK2FuelRJSEJUYVdpUVFSL3lUWk9QeklE?=
 =?utf-8?B?R3Q4UTRzRVhocFlsUzRJTCtJZlJjam9DZjFGcnNiRnBDRzF3MWJXd1d3RVhY?=
 =?utf-8?B?OWJpZ3pRa0o3Zkk2aDdvcm5QSmsrL3NPS0cwSURHY0g4UlhSVjNiMHVXUkVv?=
 =?utf-8?B?a0hRNDhJK0xESDVRM2NlakRydXRmYlNSU0dIS1VONmRhSW1vc3ZkZWl3YUMv?=
 =?utf-8?Q?yVKhIbwvxCPGYtDCpanHGL1it?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd097ec0-12f8-4727-9633-08dbef3730ac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:54:12.3119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFDkAAhuCAlTuLN2Bq1vEySaYH1z5H34k8kziVZ/k7jdVUAwdWrUjkBPfZmROz4FEzv7YScyYEzRwNvPhdzRMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9320

On 24.11.2023 18:29, Simone Ballarin wrote:
> Rule 13.1: Initializer lists shall not contain persistent side effects
> 
> The assignment operation in:
> 
> .irq = rc = uart->irq,
> 
> is a persistent side effect in a struct initializer list.
> 
> This patch avoids rc assignment and directly uses uart->irq
> in the following if statement.
> 
> No functional changes.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Who's the author of this patch? (Either the order of the SoB is wrong, or
there's a From: tag missing.)

> ---
> Changes in v2:
> - avoid assignment of rc;
> - drop changes in vcpu_yield(void).
> ---
>  xen/drivers/char/ns16550.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

This warrants a more specific subject prefix. Also there's only a single
violation being dealt with here.

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -445,11 +445,13 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
>              struct msi_info msi = {
>                  .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>                                   uart->ps_bdf[2]),
> -                .irq = rc = uart->irq,
> +                .irq = uart->irq,
>                  .entry_nr = 1
>              };
>  
> -            if ( rc > 0 )
> +            rc = 0;
> +
> +            if ( uart->irq > 0 )
>              {
>                  struct msi_desc *msi_desc = NULL;

The fact that there's no functional change here isn't really obvious.
Imo you want to prove that to a reasonable degree in the description.

Jan

