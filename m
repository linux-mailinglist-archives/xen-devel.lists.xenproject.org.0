Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BDF6CBA51
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 11:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515604.798640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph5RT-000432-TU; Tue, 28 Mar 2023 09:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515604.798640; Tue, 28 Mar 2023 09:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph5RT-00040O-Pf; Tue, 28 Mar 2023 09:16:35 +0000
Received: by outflank-mailman (input) for mailman id 515604;
 Tue, 28 Mar 2023 09:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph5RS-00040I-0Q
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 09:16:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33427776-cd49-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 11:16:30 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB8783.eurprd04.prod.outlook.com (2603:10a6:102:20e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 09:16:17 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 09:16:17 +0000
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
X-Inumbo-ID: 33427776-cd49-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6ye7miuPqI84SYiGipZrVw0XR+IycED6HSzlRbNvOwaqVz8TfUL0u1Cjt2tMHTBH7+bASwqpJqR9SkdsUzB1p2zqRywpcZhogyrFQi1L96vhincZCD7ql0jUjEDddB6cDrNyBi2dPUdDXJdb8ndLBCosC/j0RZAizP9fskObBC+3aptV1ZUIMpHkS4ODyJpgqfMhsHVrIe95wg+nWcJkcrS0tNGCVHekdgDJksGg5nDG+GJzVKPySmBNfsC3bG3N1b7+LySYEAiijdauzVFPFIBMoLtPVkb4Eujr+FwwHXotsAAx7gBxAmFF0F+k+brbp0NmJZfVBDv+YXvXSfIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FN32dYvuvGjQIT55MGiIxJ5x/QAEOIWgKB7fShQt1A=;
 b=gERvlGpiR2VRelEvG+paYBtFRkd799o2kWgbFK3Jzk2Fyi28eCV5jUGhawT4FiNQawRkJH9H79j7IrqDcQjW2bLbMZdLxCTuGuo7DkSajdy2J/ne/xVyjpTaQDsL4gPWB7mE2PlkYaB9oGtCiZhY+nrn3CrVuvFKXHJJ4VDqvMaVxygd7TNDuW37VFYGhlRv65S9ZAkO/qz3UY7voOQxwURPcPqFHUNrx7XxEEcI+4Oy0f5tOnDp42RMAJcQWT1FDvIg84ZrYccIij5jqBKUc1vFwKvr+DfTUwn1/ttdzQBkPQiSZFNnothPBAMqV0ZNyQT5KmdoBG95ImeD8TGuog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FN32dYvuvGjQIT55MGiIxJ5x/QAEOIWgKB7fShQt1A=;
 b=QkXAXzStBO+LJVLETZXJZZBiFaCLXCwC2pydBdjaIJu2/9CUcslBfkcpDanRPsQ6Eii/K+1lE0O/ri3RP7N3ZumqdSSo2rnHe5YtiOnWybl/+4BKHZuyQcMbtiIIqvEfndTwK+HX4e2Xr4A7juyoGXfY3765U8h0tmRiT7bXSP0lI+qo7x04wqS0hmV4yOEsrOpJ+FoySZ5dJjeDuKLvqH7rjCFrFpf1V433i3iuvI4eo2xTVyegvLN5jBD1Y1k+TYr1FgxPwBVXYvFDaLDIC+VfpiWvn7WZYI8GY+UMzH0XkIQzxNhfP5loPJp6+8PfZ/V62luaYoaSnmFh+yvE1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96d6a307-14dd-aa0e-4039-d84d67cf7ed6@suse.com>
Date: Tue, 28 Mar 2023 11:16:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/7] xen/x86: Replace GPL v2.0 license boilerplate with
 an SPDX tag in *.c
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230327184520.81828-1-julien@xen.org>
 <20230327184520.81828-3-julien@xen.org>
 <alpine.DEB.2.22.394.2303271752210.4066@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2303271752210.4066@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1aa99a-aa9a-4ebb-3ef1-08db2f6d1620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/sKOQ7ggHry+WTWKgPbC8zjyh3gLFt7kUrT8KFKrqX6RiQKYkvgsYRaf+63vxtBKAHSsJq05pq3L0cApj9+wRH2jNoWvgEQSnDF6hCY+8mc1Qx83TUltFtCDB0T9NeBfs7fBacwdSvFhN/zMiEs0bLRQBxSFBnZCJcM2WrDkwBHjkuMjZ82lARxQerVpoP4lfAYMvzWYz7hdBi2qyRj+iz2Ro5lo5Po/lIu5EvfK8asb2uk33VzLe10jw6wDEUlex2VcpM6hfGy1w+kl0X+ECC9PQxHyWqtPDHNivPgecWFMB7tHT+8tCXcAQaOr5Nnxta7toPBhjWi3Nxq4esNAvCHtSLKPbU/Bp2nXjygxjJ7lxCWZZfslmc43b2Y7/a4yObbOTysIIbP71yNqR08d+G2mMQFd952PaQqWp5FKehgt1ourA8eUjQaChlBjbnfb3YiNnNaRurN2wfl2jwvd0phSVNQCo11c1FscBiDmJbMI4ndM5aMoKzihRFqfJok4SGq0BS2QRpANv7uJXnyEqnAgRkqMoPad29J8pPbID6ZyaSsBwLpb2uABk8oovpQnE8zzYniRWd3c1AXcv0n2EanWfZd+EylvUA3oQRJPXuQKP1iS1IMzwI/HtJvmCuZj7cBuqgF67K74451AIIDKClSMEGn7GlNNCHDm2pulBv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(5660300002)(8936002)(6916009)(66556008)(66476007)(8676002)(66946007)(41300700001)(4326008)(2906002)(36756003)(38100700002)(7416002)(2616005)(83380400001)(6486002)(86362001)(53546011)(31686004)(6506007)(26005)(6512007)(186003)(31696002)(478600001)(316002)(54906003)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c293eU4vZ2l4RjRuZGtyREhDODE1c1ZYWFVqMndWMDBCM0l2OG40aEpZQWt1?=
 =?utf-8?B?OFlHQVpZMlFRa1hnaGlGV3hZUHE0eXNIT3l1dDI1Z2RHbjNYNFJleHJFaG5O?=
 =?utf-8?B?K1VOaFcxSk1qQ0kyaW1CdGM2L2dMbU4vaGpxeldtS1ZrbURwMXI1TEFjZnNt?=
 =?utf-8?B?YzEyOGxnYTN4TUhTWDdHL2hPR2Q3Zkp0dFBSbENKT3M3WlNMazNFaVBUYWJD?=
 =?utf-8?B?ZXlHbmJTaE5ma1NFcFVFQ1ZJeUZaSGZZbit5SmJicGlUNVBhVHVnOXJ1a1Zs?=
 =?utf-8?B?TDNIeE9nclR0L0dqcUl2dEtMRGZ3R0U5SkMwRU5SMHFuUjB1MkZlSWJmUVhk?=
 =?utf-8?B?bGlqaWZ5Z0JlSXREaUVPKzBiWHVEc0Y3QVdFNEtSbWZ3WVF5a3dWY3o3ZEl4?=
 =?utf-8?B?Lzg4OHkwYjVSSEFQWnJwMnpzeEh6YWZ3amtZSWFDc0tIS1QveWtjakhnS0dx?=
 =?utf-8?B?MG1xb2NkWXlnanZncHJxR01lQ3N4QzYrc01oMmtQZXJHM2lFYjhBRjlaN1hP?=
 =?utf-8?B?VkZGRkk4bUY2QnY2KzBGU0s3ZTJBMk0xYTNFcFdQOTVXQmtxMWkrME5kWUgz?=
 =?utf-8?B?bE0yamxPemgvTlJ1OUk2c1RUK3hCaXRzR1dKS0VhdkcwQjNtcGsxZjVIMENJ?=
 =?utf-8?B?WXc1Rlp2eHdLMStNWkJUQTJOM3JrNWlqTWlnVllWWlpPMG9hRU9VejNHc1Vv?=
 =?utf-8?B?bTJJVDhsNU5HSnZJbGsxMUM5VzJlZitBWWliMmEwVExBYXlRN2FIOFJjYUwv?=
 =?utf-8?B?UjNDS3NmK0dPMDNMTnFRektJREdObVIwa2dQQnEvK21mRGNnVWNpS3pHb1dP?=
 =?utf-8?B?VG1FMk82azIxM0VUQk9JQWNaeDJRK1BZT3VtRmNaYU1kWjI0bkp3WWhPeGFz?=
 =?utf-8?B?MXh3MFU1YlhTZERjUXR1VWsyNWM3ME4ybnZHYXZmL1YwalFYRXI5eGl6My9I?=
 =?utf-8?B?SUNrcFlYYVFhS09VZm51Z3FrTytxRFg4UGMwUEhhZGZpbWFEVnlpenVNUGJv?=
 =?utf-8?B?angvNGhxR0RxOG9NYVYxWXQyK3BmVlBaeG10K0dDamp6ZFkyRDVzazk3aFla?=
 =?utf-8?B?U1hZUEpmOWtnZUlaM1RMTUVsMWdsVWdidkdmWmY3V3RiL0c0aEhhaHRCZW84?=
 =?utf-8?B?U0NHbGVEUFRWOUgrUXY3UDlZNnRpUkxCWEcvZFlPZXVhMU5HT05Mek0rd1Jz?=
 =?utf-8?B?VGVXVVBHZFRJZTkzYmtMa1hRanlRYWp2RHlYN2d5VkVQSDFHZUxoUzBhS3I4?=
 =?utf-8?B?bVBUL0xhT3N0QWRjaENzNG14bi96bDVJMzhMV3o1QUFLbFJKbGhBSDEyMk1F?=
 =?utf-8?B?eGR4ZEZCay9UN2c1QTVvOVIxS05rRVNxZE05UngvdmVaN2owRXJEWTZWbnhD?=
 =?utf-8?B?eU1zYUFmRUYvWWNCWHNxc2pwQUVOTGdoTTFKMDhXcC9WOXkrSE8wczJUU3hM?=
 =?utf-8?B?Z2x0ZlFwa0g1ZkJxY2NqQkxXNmRCUUVlb0VFRWFYUW5RYmM4Um0yVXM0dzRC?=
 =?utf-8?B?OEE3MTNqZkdiNWhZOS9aQ0NIOEZDaDBaVVpJY3FTS1hnbWV4bzM2VzFOblZz?=
 =?utf-8?B?TzZ6MVNwVDQ3L2xCbG1zajY0OEZ3UllOcTRsQzg4emdrQ0RranRjNTg3RUpW?=
 =?utf-8?B?UTI1M2p1VnFGMS9OOWp4RDI4WU1ubDBYeDBuTnBNQVB3Q2Q4OThQaHY5NkFI?=
 =?utf-8?B?QUtmQVJsRGNWb1FHWW4xSXUyd1pzeTJuNmZwc1RqNEM3TnNNUTFiSjNEYTMy?=
 =?utf-8?B?eTJUSWtYK0tGNWhRWmdGaU50ZmpNeVZmalFuMFNodlhWQWpvMVFTV0VEMkdY?=
 =?utf-8?B?Q2toSm5Ha3hDL29UazM5VlhqR05UUm5UVFJrcDFHanhzZWwrUG9EMmI5QVQv?=
 =?utf-8?B?alViYzBQM0dQL0JlaG1WaWdZSjJpaFNGd2RyU09ab0NZVWNqUTIrRmVMdjRU?=
 =?utf-8?B?aUE4Zi9DR2tBM3JIZkIrTEdNZkExMVEvU3BOcm8yT2ZPMHkvS1cyUkQ1MHZL?=
 =?utf-8?B?NVlSd2Q3b2NjYXViTlFkcHlITmN2NS91SjY0OURSOXc3OGE3QzZ4YkRQS01I?=
 =?utf-8?B?Q09zc1lRbGlwK2dVYlVpZ3haRkpubFp4Z2kzdzBGekcwWXdvMjBvTFZvNERJ?=
 =?utf-8?Q?rjEUrrgE6He0UnXR09GUUm2fQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1aa99a-aa9a-4ebb-3ef1-08db2f6d1620
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 09:16:17.4248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BAY+D2PoR3xxxgzao7xAv+7UBfYmCJe53usfqEDcwpqi7mtxrBHsxwyBRtu+l7QUmP+WkJuejvZOojtSrwCQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8783

On 28.03.2023 02:53, Stefano Stabellini wrote:
> On Mon, 27 Mar 2023, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> It is easier to understand the license of a file when using SPDX.
>>
>> This is replacing the below pattern with the SPDX tag GPL-2.0-only
>> in xen/arch/x86/*.c:
>>
>>  * This program is free software; you can redistribute it and/or modify it
>>  * under the terms and conditions of the GNU General Public License,
>>  * version 2, as published by the Free Software Foundation.
>>  *
>>  * This program is distributed in the hope it will be useful, but WITHOUT
>>  * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>  * more details.
>>  *
>>  * You should have received a copy of the GNU General Public License along with
>>  * this program; If not, see <http://www.gnu.org/licenses/>.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>>     Changes in v2:
>>         * Switch to GPL-2.0-only
>>         * Rebase
>>
>> 42sh> cat gpl-2.0.txt
>>  * This program is free software; you can redistribute it and/or modify it
>>  * under the terms and conditions of the GNU General Public License,
>>  * version 2, as published by the Free Software Foundation.
>>  *
>>  * This program is distributed in the hope it will be useful, but WITHOUT
>>  * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>  * more details.
>>  *
>>  * You should have received a copy of the GNU General Public License along with
>>  * this program; If not, see <http://www.gnu.org/licenses/>.
>> 42sh> find xen/arch/x86/ -name '*.c' -exec replace_license.py gpl-2.0.txt GPL-2.0-only {} \;
> 
> I confirm that the commands above lead to this exact patch. I ran them
> on my system and checked that the resulting changes are the same.
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

On this basis then also
Acked-by: Jan Beulich <jbeulich@suse.com>
for this and the subsequent patches.

Jan

