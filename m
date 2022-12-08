Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F22646A4A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 09:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456862.714702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3C7L-0008TJ-Ch; Thu, 08 Dec 2022 08:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456862.714702; Thu, 08 Dec 2022 08:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3C7L-0008R3-9J; Thu, 08 Dec 2022 08:18:55 +0000
Received: by outflank-mailman (input) for mailman id 456862;
 Thu, 08 Dec 2022 08:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3C7K-0008Qx-H7
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 08:18:54 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f235a6a8-76d0-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 09:18:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9361.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 08:18:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 08:18:48 +0000
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
X-Inumbo-ID: f235a6a8-76d0-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7y/em2azCI/HRfB5eLmnlpRX0BbEPTw5xHdypUG9s7hClQ0sulB5FoYJmdEQlc3BcS0VvbbcTxsaGqulTHu2OBHvFqcbPl+15pwuuOCW1RpK1/qlDzp0/uT+NtEPL2+bifUywvyHOjt0ZMJqk6f0qfn9csgGiAk0RV8pjhJcftWb/lhvwnOs1RaPigGQDiCdVbtn0+Fb2qGVqew4VmAflpo2OeBUF+k+nDx9/HcNcee1HZKGdgo4X1DZcMOSmaG4/Dp1/yC0kByevOi/YCtrZmZEM38Rf0Wh2gsY9x9ga7n6fNGbrbUQC8mAAVsYW22o7VrigAsmLImQoHQkFgPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Twr3rPDWQxKKsaGbgrKmuLfBBGG9ktZ6vuFlieuLMI=;
 b=YReByP+fk0d9soC5mcHS4CcMhtDcsTHsn7pvw5w62WwC7B+Pe4t2EY4tyzTFhGsHqtJrCH7aM6dOlHNYu08exZrWUhqlfuxIYK7bsQa5wEAnsoZzZX+QiCwyqwHWDZ69wV8JH56Jm4bxwZlRIO4VQOq9svXwQQb9+3UZ4XefrXXCYTaOOOCCUjLVakvGonz8VYhjCSjxkQP0JWQkOS8jKwpAAeGXaR+FJ6Z2MG4Zfzt9LVcPEZADUZmvpl9gQHlUulXA0ZzYqilFzeNs8/mBvCetwPjuMMoEXBibAGspLDCNbwJiwDs51SZmtPMq3zaENd3U9t9K46GfJLf+m55MVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Twr3rPDWQxKKsaGbgrKmuLfBBGG9ktZ6vuFlieuLMI=;
 b=4pL5rQELORIwvNsxhCVKChsFF+7W6G2QywnSduzZceHjmb++OSbr30sNDZjX9FnRBMWWaYetcnMZ954SYWP1WRjtbCZ/eMWrkrtt/tz7yqCFHeQvypn/1cn+FCLXtW3FhEANZhU0/0rXaT3+ZhjLYSsAbFGZOqhb68wUlwMSqIxZ017mmdjNxTjjubN9u0uOdiPfSYmnF4UQ8eTfVKjZf8Cypxi+xGd8mq3LYmb3nr6vgSOPYp/Y3PPC3UqZZYuLS6jc/RpG75xWVPtRWjuHfmoHGyJGPUdwbiJA4KnrnhCEiur958r7GNqwbbIJW5/XQBd4EOB6V6t9FEL5v3kOuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41f4e030-0238-a10e-e217-64d9e3a069e2@suse.com>
Date: Thu, 8 Dec 2022 09:18:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [XEN][RFC PATCH v4 10/16] asm/smp.h: move cpu related function to
 asm/cpu.h
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: sstabellini@kernel.org, Luca.Fancellu@arm.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-4-vikram.garhwal@amd.com>
 <7cb6475e-0ab4-a7e2-8049-04c66588229f@xen.org>
 <a441cd07-8659-afbb-000c-43494718a10b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a441cd07-8659-afbb-000c-43494718a10b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9361:EE_
X-MS-Office365-Filtering-Correlation-Id: acd77b25-3c87-4cd4-d13a-08dad8f4d4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SwT/mtdxN4W0PwMEIlO7td7vtFyr1cNZ2Iimcqbki53MjL+ifnhofsaXwl10qM+LuvlGoh4JudMaIGgmp+ug0lY6jFXOY+StIXdwKsZFZ04cyndbW1khmIoBJyf1HWOQSV8MrsL/P09aX1D4Zxlaic0A/AyRiV9L611XVnKA91yYoF4E3aXP8FgqXEVCJtKdfb5AT1YuBzjT84rlsjSyJyM8AH7PSGCdXZ2Ln3EUcY37jaH7DTEBPlaMEq3aVF8+HaQNcqypHMc4wSk86lizjJQlCdR/yF6UcsuKVqoyBc3HI9LL1nfnLuYKoXfKJNrTSlK9x4KGGQxTzIZbzNssOv5k2pjyVO5JwbjbwS4BWrZPLSKWGTo/bw0TVq712fE5VxdIe0y8L/o2s66eSTeeU+9Yp7eLUQhOKWfHV1HhbYoKahNGxdhiTa9s13Y4ZWQv9BJV6nTQmVS0jZ5Zkbo9mY+rXsXfiRDN3zXshO+E8oXok3uDvHE4kp++x8eLX+KCt/KVmF6mwm6+iY1jcOReKmYXKH6ADZqkEpIlTZF8eGYT+8gdOUS+D//03ZPhpuLGSm9tXx2q0uXEvbRUzmGeekCWGedvNuReypQM+O3W06nLv9WUAHvBtaGnNfAw+LE1gg3A758jLr509N6AmbXtLh498ccVk5lD0QC5FaLbgyyExi4gEd4UyQ2z57hjtxiBKi1Nd59gEpdS/F0fOVAKLboz/HYS/HEXogO5U2Jm43A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(8676002)(66476007)(66556008)(4326008)(66946007)(41300700001)(2906002)(5660300002)(31686004)(316002)(478600001)(36756003)(6486002)(53546011)(186003)(26005)(6506007)(54906003)(6512007)(6916009)(2616005)(83380400001)(7416002)(8936002)(86362001)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE5McGUwR0J5TmZ3KzFUQ0trSFlJR05BNEtOR0pSOEtmcXlvWWpQMEhHZUNL?=
 =?utf-8?B?RXB6L2ZYR2NQYUlYMyt2bGh2S1VXb00wbEN3bVo4VUVmMFAvVFNPRFVuYnlE?=
 =?utf-8?B?ejhhYUNiRjNzSEJiSVRWckpUVDRhU2tybWZ3cDZZck5LQ2tjdDV5QkZ1ZVlv?=
 =?utf-8?B?dW9ZOEhERkJ5dWtXZmVlS0w5OGpLQkZiSWR1K3RzUGRYbHJjRGQzR0E0bGlE?=
 =?utf-8?B?eWM3MHBQTXZIWjRldGloYVlMaHpPRGVOeThrUFpqZWw2MTczdTVGNkxjRDRn?=
 =?utf-8?B?R3BDdWdQdzdmSzNsY1hTVDlnS0ZpRExUTDRpNGViUlo0Z3NLVE1xUlhZNkkv?=
 =?utf-8?B?Ylg3b2F2V2lJTHhPNHdBNFVnMXEzQ2RZbWEzY2tEYmxueXhoV3lHOTZtOWZV?=
 =?utf-8?B?UTgzS1EyODNsKzIyZ1lSVUt5M0JOd2N3MGhjOTJJelFDOGRjWE5uVUM1Z3U1?=
 =?utf-8?B?THJGOFJkdGhjSXZkdjZ5MWVDZzg3NVhZVDI5V3hPKzYwSWpVQnk5VmZKVFFk?=
 =?utf-8?B?cnZqKzJoWU5wNkRGVU84RUVxT3ZJNktzb1dPQitNUzF6Mm0wT21hSkFmNWcy?=
 =?utf-8?B?Q0k4R0IrcHpwUzk1bG9XN2d0bjR2V3E5NmFxTkhRMWxWblJ0bDBDK1JPSjA5?=
 =?utf-8?B?OFhaVnNrU0dpN3RwQVZCVSsrUitRRmRMc2hjNTJ1QXZpSGFGdFFZcFlMRk9T?=
 =?utf-8?B?VXU1SFYyUFVlYmV4dHN4UW1sY0s4emNlS09xQVpTRUVxWHJGSVFJaTdNTXZT?=
 =?utf-8?B?cWhkYklTU3NKYTJJVnl3YkVWZEYyL29xSzMxOHhYMEtTeTZJeUJxK3RzOWVD?=
 =?utf-8?B?SFMydThacEJUWXJ2TFhTMzlpR01ZQ1lnS0dhU3RKVXlyN2Yzekp3QXllVjUv?=
 =?utf-8?B?N3ZxYTYzU3NVeXkxZit5UUJiOG02bFplTWY2TURONXJ0ZU5LWkNKV280RWEx?=
 =?utf-8?B?L2UzdEZ6eWxZNmtUSk4zeE1XVWVFeVpsNnN3em52aGNjQ2ppV2szVjBGWnBG?=
 =?utf-8?B?TVgwK1ZmODZTcjh3bmRYcmtBcGE1S0x1NEU2QWV6VHowYmRjV0QzNVEzU201?=
 =?utf-8?B?bXZ3bUF1YVVSM2RFUEVHd0xJOXcwZzVXMWVxUXlGbjJMMjcwSHkrdGRSNkZs?=
 =?utf-8?B?eFFSUjlBa2tITk16US9oRzU4bDZnZ0RGVDMzMHRaVXdyam5NT1V1ZE5KUHpL?=
 =?utf-8?B?ekRuQ1B3QlBYckFJZDBoUzIycGNaYXFtN0pEWU1uSE5Pc1gvUloyQ29IbVVT?=
 =?utf-8?B?VkwwRGhPYmlqQWh2UHRqTVlhOS95dmpwWlR0UzZTaVBsNzVGZzQyTlBYSFNl?=
 =?utf-8?B?RzlYWHRyNXRQVmxyTWg2N2g1MlRxQ1Z5Sm9FYUx0MUVQb3NiUDNRdzV1elNO?=
 =?utf-8?B?cHVHL1NTR1cvWGs0ZVZuRTdMcExwaWVQa01EUlZqaXRhbERkdjY5QjNYWi9r?=
 =?utf-8?B?OFkxV3VXRlFiM0JQKzBkQkdwVmt0aVBDemtBMXBCd0YyMWJxVUNLcHE4RHJx?=
 =?utf-8?B?ZHdsWUVvZjIvWnhzVE9yZWVmcHY3YzFNZzB0YlpjdmlURzRJQXJieW1hQTdL?=
 =?utf-8?B?RHd0NExLcExEN1pwWDdRaVc2NjVmMnpIemNsNDRDSHhueWxNVTBGU0dhd0lZ?=
 =?utf-8?B?cy80QVczQTkyZ0ZjQXhqZThQSmZDbXM4UFp3MlBDWjBKQngzYmFiUG5nd3V0?=
 =?utf-8?B?S1RXUVFIb1NFY2hrVW9RTVFKT3FYK2pRVnplY3V5NXNYZ3QyckwvbTR6YVRm?=
 =?utf-8?B?TXgyaVk1WUp0bGRtWkx4Y0l0YkMxZ1pCeTU4c1Vhb0x3aXNiNGxMcnpwNGQz?=
 =?utf-8?B?T0RXKzM4WUpmY0FkVHgxMVlQRlBkZ2RBVWxXelhDWm9YcEF4bm5oMmI1empC?=
 =?utf-8?B?Q3F2akhwT1BIMlhndVhhQVhvR0h0SWx5dmlydVIxYko5YVdwNTZaWjVhdlV5?=
 =?utf-8?B?MUtwRkVrRGl6cE40amdrWGV5WWxsVEZZamdvajBWNXFYV29JdzlqNkNzV0du?=
 =?utf-8?B?R01OZ0FlVWdoTERwWmtJU1lEZFVHSkwrZ3pZZ1VaNHdIeFF0NmliRmJ1eGNn?=
 =?utf-8?B?Vk1GOEVOMW0vZ2VTalZNVUxyOSsxb3R2V3hxRnB0aXVHTjFuanNhaGVRQThx?=
 =?utf-8?Q?wGT8qAAEyf3s4/BfTbne+XV2p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd77b25-3c87-4cd4-d13a-08dad8f4d4db
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 08:18:48.3016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xn0V/HT7oeDjqXJrq3ygmGVFqg8KrSdbBjOZuhLgUhzONoL0KR5OtPUQsc/WkNzR/iGYMD0J6bhIOMFH4+niRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9361

On 07.12.2022 20:39, Vikram Garhwal wrote:
> Hi Julien
> 
> On 12/7/22 8:28 AM, Julien Grall wrote:
>> Hi Vikram,
>>
>> On 07/12/2022 06:18, Vikram Garhwal wrote:
>>> Dynamic programming ops will modify the dt_host and there might be other
>>> function which are browsing the dt_host at the same time. To avoid 
>>> the race
>>> conditions, adding rwlock for browsing the dt_host. But adding rwlock in
>>> device_tree.h causes following circular dependency:
>>> device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h
>>>
>>> Inside arch/arm/include/asm/smp.h, there is one function which needs
>>> device_tree.h, moved the cpu related function to a new file:
>>> arch/arm/include/asm/cpu.h
>>
>> Given there is only one function, I don't really see the benefits of 
>> splitting smp.h and then adding #ifdef CONFIG_ARM in the common code.
>>
>> Instead, it would be better if we don't include device_tree.h in the 
>> header but in the c files that need to call arch_cpu_init() and 
>> forward declare dt_device_node.
>>
> This was my initial approach also and there were less changes(compare to 
> my v4) but then though someone might have issues with forward 
> declaration of dt_device_node in smp.h.

We use forward declarations of struct/union is many places, precisely to
limit dependencies among headers.

Jan

