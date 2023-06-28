Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D65D74123B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 15:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556468.869030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEV8A-00089l-RO; Wed, 28 Jun 2023 13:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556468.869030; Wed, 28 Jun 2023 13:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEV8A-000875-OB; Wed, 28 Jun 2023 13:22:46 +0000
Received: by outflank-mailman (input) for mailman id 556468;
 Wed, 28 Jun 2023 13:22:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NvKJ=CQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qEV89-00086z-Lu
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 13:22:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da900902-15b6-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 15:22:40 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BY5PR12MB4997.namprd12.prod.outlook.com (2603:10b6:a03:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 13:22:33 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 13:22:33 +0000
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
X-Inumbo-ID: da900902-15b6-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gf/YZ1GaQlLUQdakMa8GLf/tDYKEJPokdhENXoe8ladeEsog4Zax98sxh5lL6yjCR4YAPBCd/ooE8qi9R4eWRor7bQ2mokG0q2nUMSEu2hs1JgShRurtVVMUN17j3Kk1b9ehKwwK6WtcQskTY6Q1QrWZXxXfrmAg9XsSePWUFKMlFfouh7DqiGVTxZaysB37YHb8ZiXRKPIrgaII0fPNZjuRietIYMX+T/HNwxNI/XpUIkL9kD3SXs4Bbt5XdBtbfoTF+GQQx2iCs/dRZu6Lb6Hp/4sg2h1pQB2QeJaeowPpap3Cn5CZP3o000qZR7LS12R7rAeAIrz24hbmafy7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IRiwh3T3XE+/vQ6pxKqFOD4DW4v0rEJY0C7FTMjfLc=;
 b=KRwDfXN5y8/aaSdlgcUiGOThf+EadkHl7RI0klDrTCX/V5XMSJC5mCPWRsKX/liqu98XNB9q1f/SMf/24p5dE0G/tRvExzsIgQyxZvF2qjaHBls9c7DO6BpO5B1C/0LyKFan5B7TavRsTE0MogM5zeIcu1rEZm1/cXFDSVeaqhEbXUylzhf2FRjR/cs7gIgy8/Wh3ZjSg6D9LoQ8GbgzpwW5ampMEwaPUh9b4nocyeJNAIRPAKoJlEwwb2xQuCguHbU6oiFTe3TYgubv0G27gFVd8HqhpVKl+Fu3SM65QosFkImFx8xmwRZtKVzVXi/f8P53/QRBhy/m4WRgtE5HBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IRiwh3T3XE+/vQ6pxKqFOD4DW4v0rEJY0C7FTMjfLc=;
 b=Bh42+KWxLwPGGIsyGparqy5FTI57vBSI5jqRRy6HTd3qGtiJSN+kMSr7iLxAhn96m9Fz2FNjUYRsvcfMB7DsCKbVgtOMVMuXIHhwZHAGin3PjymVxp/A8fD5cmg9eqejbRHxXVqTtbmjOa5UnqevXk/WrhtPExlrK3ADNcLfqyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <37e2856b-038e-6a3a-a6ff-c518dfeda552@amd.com>
Date: Wed, 28 Jun 2023 14:22:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 24/52] xen/mpu: build up start-of-day Xen MPU memory
 region map
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-25-Penny.Zheng@arm.com>
 <778688ab-8fd4-2b06-e644-b5a013bb56f7@amd.com>
 <39a5a729-0099-67e4-bf4a-c65ae99a4619@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <39a5a729-0099-67e4-bf4a-c65ae99a4619@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0253.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::6) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BY5PR12MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: ec713899-c81a-48ae-b5b5-08db77dabb32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Dwy84rGQQIFbbyTqHAtsrXZiQG5F11zu4bRh/1Dq3SnythS4XLXbvizhGbmw1gnqHw8ie4cUi8H5V7YvR7hN9FhL6N7IoHmeGh0+orMsMNaHYeaRQnuJ00wEsS4XS1oqJbPABEiwoi5LU2RbDMfa5+b+m0x2NJg4WsW23FW4psmQ7RyP6d1gMIQR/X4f4N/St+a07Si87vhbu6FaC31nBH09AZZRmb9rzNqKjeQmcwX+5saMM+J5Ui/deYl6K+JLQP+cvW0zb0D2Vhfprys4VNSx9Ips69L+9z8i0IlUMMZXjMAC7KBMR/An65DF8dbf9OrWvf6Qgb6oBrBwbilc4xnfqOHsH33XwGwCye5/9wh2884+la6X/8ZOhxMl27CFff9URjsfyIr/Kj0sQJ+VGw81qcSU7QUZ3umFNOtuKG6NQv3Nm3fNZ1yZgLXRrLaYynIhEs8WIm4/3wHhNUXBwr/YUWp1JLmak34yP9mwQ4fcaEWqC5apu7q89nC5ryEmL0dzvPlRZgQX10T9V13TRLiID1pAZu8OdGnQnTcGUVlzrEpJG9BhcbRzZ7VRL1Wc5bAgC6hBAPyu/0QiZD/IpZikeQA/zZVGwtKYeXigH3uCGGfBibfA/YrHosSUtmC5+U7GqWgwdi89N0Ri8Nwpdydw96rm7Oj0myapcRyKCabVFJwRa2wF9vFsPeaLP0A
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(31686004)(186003)(2906002)(5660300002)(66476007)(26005)(6666004)(36756003)(316002)(54906003)(31696002)(6486002)(966005)(8676002)(110136005)(4326008)(478600001)(2616005)(38100700002)(66946007)(41300700001)(8936002)(66556008)(83380400001)(6512007)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTNPR0VTVnFDUjhXVlRlb2pGZVlpOXJtMGFqUDlaRmNsZFJvQkM4QVFnTmpy?=
 =?utf-8?B?bHNNTHAvajBEakxPR0pVR1VoZFRHMHY3bHNYWHJkU2QxSjdJV1NBOGpVemNi?=
 =?utf-8?B?RHJjOHhxUWJJeXpqT2kwcGRPamJHWTBDaGtia1NFeGw3S0cvY1ZHTDU5cWky?=
 =?utf-8?B?ZkZhWmNjd0xOaUpiSXovZHZLR28xaGlDd3FPeWRiRlVPR3Y0WEUrdkp4WWVh?=
 =?utf-8?B?dVZwZTkvOUorYTY0MDRyTEhRQkllTmRBTE9hTWNiSGVXeFRDbXNpdHNLUGlR?=
 =?utf-8?B?TjFxWWh4UERGaVVOWVUyekRpeGJKcHpJaXgvejFudWc5OUtmTktkd1dsbitM?=
 =?utf-8?B?UlAxQm5nOWRrRFF3eHY5NS8zSWRvWm44SVlkbkFFbmFwNENuMm5LOXF0cUx0?=
 =?utf-8?B?VFZqSXRrVWpMU1U0UG5oemZQdmFhQkMvUVZmaHYweFVldUxkcEZnVUZ6RXZo?=
 =?utf-8?B?eUlIQTJwQWYzZUJNU1BlNHpNZ2tJQWtMblRPZ2YzVlA1U1lyQjQxc3dzcjlQ?=
 =?utf-8?B?NFJ2UjhMRCt1OUVLUi9Bd1lIWUN0enNUK3ZXb0dELzBZWUUyWTVUOHFSSldj?=
 =?utf-8?B?eHlBMitPUWYrY0xzWTAwYzJpQ291NHdnUk1iNndoSWR6SHBrcTRoKy92akJl?=
 =?utf-8?B?dk02TEc4TEhGQWlFMEhoRTdJTW5MWEZ2MTZiQ2Z1Qk00ZWMvNGJicUNZWXJH?=
 =?utf-8?B?RjZhczU1cTVvTUFLVERpR05uK0ZHMVdrejRYN3paRmF6eVdESVoxT1YrZjE5?=
 =?utf-8?B?L093bDFHaHB0bldUR1NKbjFjMXBwdjBRR3dJODlBdjNnUW9rVFNqeEFON3ND?=
 =?utf-8?B?TlBobUp1SFFuK3dnckFIaHdlOW5ESkF5VUdVRHAwTVpYVUdlTC9oRjdhb2pO?=
 =?utf-8?B?clQ1YUExMjFBaUZOWXV3aUpQTS9GVDJiaUd5RTVFTEhHUnVaUmRCTjdLblpu?=
 =?utf-8?B?WEQ1bjZwUFdzVUN3ZWpsa0tDZUhHeDZlNDNwTnFTenZ3WG85MUhmMkxESnRn?=
 =?utf-8?B?Q21Ha3dlTnJ1L0ltYk54YTRBa01YMXZkdkVVeDFRcTRpWURIL2FPYm9tUjg0?=
 =?utf-8?B?Y081em5QVXNwSDZxOW1HYzBtTDJpMUtnSWVXdTdPQWNJUkt1VUZlK2ZRYzhP?=
 =?utf-8?B?ckZmTVBqZHRVRUpzYzFCNGhLaEpyTnNKZDhPZmc2N3JpRlh1RjE5TXNwTXhj?=
 =?utf-8?B?eWVxVjZQd0ZJaW1vNFdYMVZCbWRnOEFsTGhPdFRnOHhLMFVYVGpEbVJLYWtq?=
 =?utf-8?B?aHZ0Vlh2NlIzanpuMy8rVGwybUN6RlVSSExCOE51cFZOVlRmYkVRdWdUYWFO?=
 =?utf-8?B?b1JuY2tqVTBMd3RiSUd3TGFVMWNXK0FydVVLQU1CbDB6eEUrd1BMRnVobVdw?=
 =?utf-8?B?TWQvWmJ5Rk9DYXZmKzQ2cGVMWlZ0Mm53dFVBZzRidnZTSk0zV1R5dnJ2YW5U?=
 =?utf-8?B?U25Tcml0SHdFWXlNakFBZ25Xb2VnMWo5SUNiZDJSMHJyWlExaUdLS0IrSi9O?=
 =?utf-8?B?WUZMdEJ0Z0c4ZnVzUGdxNFJUcUczQk4zZjFVRVhPbHJRMzVBeVpBRG9USWN3?=
 =?utf-8?B?cHc1MkxMWGU5UCszcWpwREFHL3FZMFBVemUxcytwUXdRN0V1Qnl5SzB2cGxK?=
 =?utf-8?B?SU1Tc0xHNUhmMkhvNmdsRmNlbnhvZ0dIdlo5dXJRNVo3VjN0ZFk5VDJvdUVX?=
 =?utf-8?B?QWFBYXpTS3RVYTVSQVVLaEk3aFlsa2lKb2hveXA0Z2MzRytvRWp1RlpJckVo?=
 =?utf-8?B?UHdRczc5cUlTL0JaS1djTmVYNEQvK085R0hJSHFGdVFQOFlpMHNidHgrUVlx?=
 =?utf-8?B?SkFCNUpIUXBJV245R3Nac1ZIdC91RHBhV2cwc0xVM0JlMHNiY3FaRmRYZzFv?=
 =?utf-8?B?SGN1ckJuUm0rbWhYeUhmSmF3UUdzMmRrSDdiaFpWS0FSdERKSkdyVzg3eW5P?=
 =?utf-8?B?TDRtNUVvcDRCYzhMWmJmZFh6bDBJeE9EOVNMdHYwUFB1Q0ZhYUU3WHZTVXBG?=
 =?utf-8?B?RWFiRFZvd3JnZmFQRitmS21aZFdYUGtkaFpIQXZnSjFVVnNJelpFTldUTWtk?=
 =?utf-8?B?Tkg5V0hmR3ZRZlpLaWw1cUdxYlNpQWxZd3BSMklHSDB5aFRpSGpWZE9leDFS?=
 =?utf-8?Q?maqPGvImpSPeX+lh5zU6s5c8z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec713899-c81a-48ae-b5b5-08db77dabb32
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 13:22:33.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dg0dDmjbTGUukH+MacDir6Ww+0GPfZjWs9S3VPzS5Rmret08IUP4zgFFUL+vm5wIJTb6yXZn/NzrzabzuaM0aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4997


On 28/06/2023 12:17, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 28/06/2023 11:55, Ayan Kumar Halder wrote:
>> On 26/06/2023 04:34, Penny Zheng wrote:
>>> CAUTION: This message has originated from an External Source. Please 
>>> use proper judgment and caution when opening attachments, clicking 
>>> links, or responding to this email.
>>>
>>>
>>> The start-of-day Xen MPU memory region layout shall be like
>>> as follows:
>>>
>>> xen_mpumap[0] : Xen text
>>> xen_mpumap[1] : Xen read-only data
>>> xen_mpumap[2] : Xen read-only after init data
>>> xen_mpumap[3] : Xen read-write data
>>> xen_mpumap[4] : Xen BSS
>>> xen_mpumap[5] : Xen init text
>>> xen_mpumap[6] : Xen init data
>>>
>>> The layout shall be compliant with what we describe in xen.lds.S,
>>> or the codes need adjustment.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>> v3:
>>> - cache maintanence for safety when modifying MPU memory mapping table
>>> - Hardcode index for all data/text sections
>>> - To make sure that alternative instructions are included, use 
>>> "_einitext"
>>> as the start of the "Init data" section.
>>> ---
>> < snip>
>>> +/*
>>> + * Static start-of-day Xen EL2 MPU memory region layout:
>>> + *
>>> + *     xen_mpumap[0] : Xen text
>>> + *     xen_mpumap[1] : Xen read-only data
>>> + *     xen_mpumap[2] : Xen read-only after init data
>>> + *     xen_mpumap[3] : Xen read-write data
>>> + *     xen_mpumap[4] : Xen BSS
>>> + *     xen_mpumap[5] : Xen init text
>>> + *     xen_mpumap[6] : Xen init data
>>> + *
>>> + * Clobbers x0 - x6
>>> + *
>>> + * It shall be compliant with what describes in xen.lds.S, or the 
>>> below
>>> + * codes need adjustment.
>>> + */
>>> +ENTRY(prepare_early_mappings)
>>> +    /* x0: region sel */
>>> +    mov   x0, xzr
>>> +    /* Xen text section. */
>>> +    load_paddr x1, _stext
>>> +    load_paddr x2, _etext
>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>> attr_prbar=REGION_TEXT_PRBAR
>>> +
>>> +    add   x0, x0, #1
>>> +    /* Xen read-only data section. */
>>> +    load_paddr x1, _srodata
>>> +    load_paddr x2, _erodata
>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>> attr_prbar=REGION_RO_PRBAR
>>> +
>>> +    add   x0, x0, #1
>>> +    /* Xen read-only after init data section. */
>>> +    load_paddr x1, __ro_after_init_start
>>> +    load_paddr x2, __ro_after_init_end
>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>> +
>>> +    add   x0, x0, #1
>>> +    /* Xen read-write data section. */
>>> +    load_paddr x1, __ro_after_init_end
>>> +    load_paddr x2, __init_begin
>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>> +
>>> +    add   x0, x0, #1
>>> +    /* Xen BSS section. */
>>> +    load_paddr x1, __bss_start
>>> +    load_paddr x2, __bss_end
>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>> +
>>> +    add   x0, x0, #1
>>> +    /* Xen init text section. */
>>> +    load_paddr x1, _sinittext
>>> +    load_paddr x2, _einittext
>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>> attr_prbar=REGION_TEXT_PRBAR
>>> +
>>> +    add   x0, x0, #1
>>> +    /* Xen init data section. */
>>> +    /*
>>> +     * Even though we are not using alternative instructions in MPU 
>>> yet,
>>> +     * we want to use "_einitext" for the start of the "Init data" 
>>> section
>>> +     * to make sure they are included.
>>> +     */
>>> +    load_paddr x1, _einittext
>>> +    roundup_section x1
>>> +    load_paddr x2, __init_end
>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>> +
>>> +    /* Ensure any MPU memory mapping table updates made above have 
>>> occurred. */
>>> +    dsb   nshst
>>> +    ret
>>> +ENDPROC(prepare_early_mappings)
>>
>> Any reason why this is in assembly ?
>
> I am not Penny. But from my understanding, in your approach, you will 
> require to disable to switch the disable the MPU for using the new 
> sections. While I agree...
>
>>
>> We have implemented it in C 
>> https://github.com/Xilinx/xen/blob/d1258f1cefe406a3f91237b8106746c089864651/xen/arch/arm_mpu/mm_mpu.c#L941 
>> , so that it can be common between R82 and R52.
>
> ... this means you can share the code. It also means:
>   * You can't protect Xen properly from the start

Yes, I see what you mean. Refer 
https://github.com/Xilinx/xen/blob/d1258f1cefe406a3f91237b8106746c089864651/xen/arch/arm_mpu/arm32/mpu_v8r.S#L82C7-L82C15 
,

I am mapping CONFIG_XEN_START_ADDRESS + 2 MB. But, probably you mean 
individual sections should be properly mapped from the beginning.

>   * You need to flush the cache (not great for performance)
>   * You need to be more cautious as the MPU will be disabled for a 
> short period of time.

Yes, MPU is disabled when set_boot_mpumap() is invoked. But is this 
really a security issue ?

I mean only a single core is running and it is executing Xen. The MPU is 
turned off for few cycles.

>
> In fact looking at your switch code in setup_protection_regions(), I 
> am not convinced you can disable the MPU in C and then call 
> set_boot_mpumap(). I think the enable/disable would need to be moved 
> in the assembly function. There are potentially more issues.

disable_mpu(), enable_mpu() are written in assembly. See 
https://github.com/Xilinx/xen/blob/d1258f1cefe406a3f91237b8106746c089864651/xen/arch/arm_mpu/arm32/mpu_v8r.S#L128

- Ayan

>
> So overall, I am not convinced of the C/common approach.
>
> Cheers,
>

