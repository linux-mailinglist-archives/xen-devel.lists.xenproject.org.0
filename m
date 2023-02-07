Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D037C68DC3C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:55:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491294.760351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPNc-0005tI-Pn; Tue, 07 Feb 2023 14:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491294.760351; Tue, 07 Feb 2023 14:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPNc-0005rb-Ji; Tue, 07 Feb 2023 14:55:32 +0000
Received: by outflank-mailman (input) for mailman id 491294;
 Tue, 07 Feb 2023 14:55:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPPNb-0005rV-1L
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:55:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7608232c-a6f7-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 15:55:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7455.eurprd04.prod.outlook.com (2603:10a6:800:1a1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 14:55:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 14:55:27 +0000
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
X-Inumbo-ID: 7608232c-a6f7-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5PyTZJ5u6sWzQm7LQzz4RLt3JWzEh9n1sj8ftYVNeyjt/Wahuyth6ifVqzIMUGzHlEcdb8lWhnCA0N41m1GiNO7RgCjuIQE3GdoAAR1Hp6TV7pIaVs7NxkVSgp8i+jsvSNRuf+MACbIq4OnMf+EE7c/8MycyPav3D6u8HQQ5hy7wsi+g3QSJICi/bFHneZ9czH4/E4kRgiSrsBvZjUW+ImTkxBMHy7XTyS+cYMNj//WuXHn4k8/JI9miQzKmPdBYITCmgpQwMH9BOZJvOZ0g9a0HoAywL64VPJEI3JEtijMHrKCQ4svu6XYZRaaVe2TuzihDXoI8QJebrZEAJ2bCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLwNBKHAemjJEccoETxEMrCE1WQwSTUOFcIQGZqFZVw=;
 b=L0o+56rt8sLR4DzmELXaw8DvVNanzwa5K3CIpdO/6Zn9RBvo76XLGp94/+cU/i4tSJtcTkoOmppAKVVcBF3VBpvLHyoZjT9f3K22KMXhCeVCJsV/s6O4LlTgC7eWICz1ED1dsSGntX6utWnUe6AtOu4mxYYEIWqg9FvERo1zLgAz0lKsqG2/2BQ301lkhaUadnaBnwp2PxVIrVaE1PRhTWi/EC1XIJDsp+i4QLwIratPVUagGbNKsH76srKVZwIIcH7hyMQMGf3H0IafyFTTtE1NC+ntPU3QHxOHZh+bilWxr1tK2cIhTlmlfBo1LdiR3La4TDqleDjMR0cyEtoiuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLwNBKHAemjJEccoETxEMrCE1WQwSTUOFcIQGZqFZVw=;
 b=BGATALQCWAdNWoTAHKBGDwEYfjOa6ohw5PTh8zxuTphNDmfygC8Zd8Cpyrocg109ZuyTUzwOSCXkE1ezCgxZ6UIhBQ7sPPJTHI7Rt9lA6D7RdH8pl0CNfCUHfLDbwuMUHxFCK2epWgaRuV05br0rX2GTNZBVcJM98z0tdzctfpQRXh8Joe6qJLFp4nkws1rLSWDwCdGi9sUBaEKGv+sfQg6a5lKdXtK0/Bc0+0kVPWR4zGhXFWLlyhF1r8Wc5BAiWTemezr5/aV7eOcDkkPSEAoGVM0Cjq1evHtTrkHJ8l4o/cJ7VBNDBu8iEmxir89deZzgowoPXcHN+I0OOYjLFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7aff9222-213a-121a-6c62-d838d9406d36@suse.com>
Date: Tue, 7 Feb 2023 15:55:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 04/14] xen/riscv: add <asm/csr.h> header
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
 <94a46f35bc9387c699d9d24b1c792b54ec290255.1675779308.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <94a46f35bc9387c699d9d24b1c792b54ec290255.1675779308.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 980b3bb4-bda4-4d99-f8d6-08db091b5988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CLUo312bwxQx3bVjyLiYkjmagZivKrj6KPrNnjSpuPDKK+OlH/AlQtIUjrMjLhslz49XhuG1NTli8lziguyoWOOfEfmkYmYVWS4rP2X0aOZ7SiRX8rJl0J+zllh+ppnYnslJJ4CF4zwJkDimnr4dFfjlXLe4G7/5msXejqcfJ/1IBXrJNJhGgH5kTjORiwzvDHRAOBqK81YaDrwMBsEvsDh18+NysBNZzlXBQTtT57comDmoOtPcbyT/EjY3xScJBhGYk4iw8cnGZkePLTPglnVGEllM0dQeC3eSvmRHLRMGAGmuHLVMMKESfoI24NNhdvdA/75WCem7Ri94AC9NrJjjFAjCxt1WxvVp3Pmgbt+ptCWLbQXHw8H3aiLfzGitPDgmq+Ji4hU70g44xqrNIocwYtSmti++DE6zn/+/tguL9rjWXGOtkEsAyJmJ9yngZSSSbwWiA3TkzWX1wNHOPof/g4TDbm7FIKRp70bcZspEfMZQext1nl8n4GuiZzQ/S/XVQwRqW5TsYr763jTbzjXDyqziJ2zJeYigZSFJj6rBRXxe9Zob95+8DB1ahD+pFgLK9Dt0jzOXpHPDVK0IZTVDTxr8IOm8oyNzPkkTHbbPP3aCrJzX1nqhF5LH/hLkEIKpo9NIuYTqTjuofbSbtvTaGxQlZZRvVRgMV8urasNa4SBS7+gc0/BNAAp95M24AkIs+lrWzls0fLxWjMtikJzDiEC9NFHffFi8n/JxQgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(396003)(346002)(39850400004)(451199018)(2616005)(6486002)(478600001)(31696002)(86362001)(38100700002)(186003)(53546011)(26005)(6512007)(6506007)(36756003)(4326008)(316002)(54906003)(8936002)(66946007)(66556008)(6916009)(66476007)(5660300002)(8676002)(41300700001)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmc4d0k1cFdGejI0RHhKaks2bEQvN0x3RmNGUG4xNUtJMXZ0SUtpcnFHTEQw?=
 =?utf-8?B?RXk3ZWdKNzBlYnFma1h0aXVUQWY3NlNnbVM5ZjA5L1pqN3NXeWtOS0VqaG1H?=
 =?utf-8?B?WEpHTWFZYVd4Vm5tU0VKZ1QxTklvQ01reDc3RXFDZGwzL2dneVFnMkIwV1hh?=
 =?utf-8?B?S21Cbmd3aDV6K0x2RWc2U0E0WElGd3I5ZXhib2FxQ0ZmTmJ0bVZDc2ZSNTNB?=
 =?utf-8?B?UWNkT3Z6djFNdGUzWkNmSlZuSmx1SEVWQWVHcTZJeXVZdytYaXIyTTFPd0J4?=
 =?utf-8?B?cDZWMkF3M1RRUDRZSFpwZ3V6dWQrNUMwSFB3R21EL2FkY3YvTzYwaWhYZFNR?=
 =?utf-8?B?RjZ2MTN5c0M1T2kzSTE1cnJITm1kUlFvWkxCd3duL2lSUHBlZitJalFjWTRk?=
 =?utf-8?B?WWlJZVllV1BKY2k1dzlOVHBXWUQvbkFhOGlWWmpXTzJmQTd0S3VpN1B4VURu?=
 =?utf-8?B?MzZTWEVWVTBMY1BlTmszN0g0K0Vpck1kWkNjTG9laHlrUng1MlZQYmRqNm9Y?=
 =?utf-8?B?NHQ1YUFoajJ3bnQ1QlBXdjhHNFpUQ0gxbnVRR2hTTkpwN0xqUk9zRmJaKzZy?=
 =?utf-8?B?d09rdGRDbHNXUDZ1emNsTVpPV05zZitpSTZyc3hzNzFQSTRFV0RraVltMnNp?=
 =?utf-8?B?WCtES1k4VVJEMTFiYkdoRXBTRG85dXU4L2J3V0I1SHZGZXRodjF5WmZjaUpF?=
 =?utf-8?B?SkZRSHVielBjMnloK2xQeXlETzhDMnNGSzZWb1l2Z1lkQW8xVXoxS3NudWlS?=
 =?utf-8?B?NmhxOCt3MHZRVEhGKzhkMXhEc0dUQUZtd1A5TXcrTituL3Z0azdHcUsyVXhw?=
 =?utf-8?B?eEhPUVl2NGNhSjZzSlJ6a1JZbEkwSHZWVEhyaEg0UTZQL1J3TE1La1IyOEpa?=
 =?utf-8?B?RFp0VXViNVBWY2hBbk0xa0tScDVYYmcxSDMvSEtudVFvRUpJQ0JLQk82ditI?=
 =?utf-8?B?LzduUllFM2ZWeU5aWldQOVIrOXdQOGpsSG0yOGFOaFJrNkZvUzRkWUpNQ1ht?=
 =?utf-8?B?REZCbVpoZUtMc05VdC93ZFNCbkpsNWJ3NzNlM1VHaldNQjNIMFA5MVNIMEhW?=
 =?utf-8?B?KzVNNTFYOGw3bk54ZHc4MXB1d0lrUFdWaGFPYlkrYUs2T0Y5QnRyNUJ3ejhK?=
 =?utf-8?B?aHcza2xXMXpjd3AzRHJTL3dXWDI0cWxWc1RqT0trSnNlejlwNXExM2dwaUdU?=
 =?utf-8?B?dUhvRDNlTDkrZWNCaFB2R1FQd0F2RWFvMXNuYTBSditCajBJUUZmUTNXekJi?=
 =?utf-8?B?U0RVZ3hFVUJPcFF2c0wxQVl2OFM3K1lXWFZhVk1nYUNkZUZsVTZaek50TzVl?=
 =?utf-8?B?TmpPNDNWSm9VSXFRc0dLeFZ4dFFMSGN3UHJKblVEV0FHZGtaZGFUcDhqVkFB?=
 =?utf-8?B?U0ZRMmEzM01QcEd4eGkyRCtoZ0l5VEtoYWR2dmhKZkpzREs4eUV4aEhMRDVx?=
 =?utf-8?B?UllpbFRHZHpHWGxCbENiUVZ4bDhLR3B5Z0EwMWN3T3FIbVYxUTQrTURYcW4x?=
 =?utf-8?B?UEFDVjRKelZlcXJjQzhubExSM0NybzZNbnVLaXc1allqQjBxKzlSRzVkaDIz?=
 =?utf-8?B?cEtiSEsvdHB1c2lJVGpTa2J4SjNKbERlcVZENURuOVl1K2hObDVLMnVpM3VH?=
 =?utf-8?B?a1lCMEFQR2JVZ0ZKQVFjQk9FMnRocWp5LzdydEFjb1h6SU9jSGFiWUx2R3pM?=
 =?utf-8?B?eXc1RWFKVFFHV2JtRndXcGh6cHBod0ZadThVUXBNN2o2VkRINnNoUElXWnJE?=
 =?utf-8?B?UHVMSE9hMEw0aktrZVR5RldNVlVDMS9MbmwxMU9hS0NMcmJyUno5SFRsOVBV?=
 =?utf-8?B?TlcwVTIwQjZvV1hJZE9NWGs5T2lCWnRpdnNORy95RFJrc01BTW55bGFFL3Zq?=
 =?utf-8?B?MFU0eVZ0LzdKUC8rL3lFRHZibmcydG51eitRdVRWR2NpVFFXNk84eC9aY2Jo?=
 =?utf-8?B?bmNhNTF4SHJQZHhubEErYmd5WjZqYnV3TWVVV2RFbmlzNzBzcWlWaHBET3dK?=
 =?utf-8?B?c1ZCYml5Uk9GY29abVZHNzlkT0tqUmVMMXd6Q0Q1aUdaZXc2ejcwS2R1ZkMr?=
 =?utf-8?B?MkNKU2VLSlBaQlFIbVU2eEZrd3A4NzlpbFFZMTRVVkltb2NVcmpkTm8yQzBG?=
 =?utf-8?Q?yV5JRpYOf79usz1xMK/7TEDtR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980b3bb4-bda4-4d99-f8d6-08db091b5988
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 14:55:27.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aljBmd8lCkKR++vZAhrO5LkTPrUMiVLbjJDoDwocviAI/CDgtDqwJ8XnWT1eKtMFIXv9Pw5h2xCzjbrAOeCutQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7455

On 07.02.2023 15:46, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -0,0 +1,84 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (C) 2015 Regents of the University of California
> + */
> +
> +#ifndef _ASM_RISCV_CSR_H
> +#define _ASM_RISCV_CSR_H
> +
> +#include <asm/asm.h>
> +#include <xen/const.h>
> +#include <asm/riscv_encoding.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +#define csr_read(csr)                                           \
> +({                                                              \
> +    register unsigned long __v;                                 \
> +    __asm__ __volatile__ (  "csrr %0, " __ASM_STR(csr)          \

Nit: There's now one too many space (here and elsewhere below) between
the opening parenthesis and the opening double quote.

> +#define csr_clear(csr, val)                                     \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrc " __ASM_STR(csr) ", %0"       \
> +                            : /*no outputs */                   \

Nit: Missing blank inside comment.

I think these adjustments could be done while committing, assuming no
other changes are necessary and an ack appears.

Jan

