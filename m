Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6468286F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 10:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487457.755073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmjK-0003rs-EZ; Tue, 31 Jan 2023 09:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487457.755073; Tue, 31 Jan 2023 09:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmjK-0003qB-Bd; Tue, 31 Jan 2023 09:15:06 +0000
Received: by outflank-mailman (input) for mailman id 487457;
 Tue, 31 Jan 2023 09:15:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMmjI-0003q3-Kj
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 09:15:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be737369-a147-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 10:15:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6794.eurprd04.prod.outlook.com (2603:10a6:10:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:15:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:14:59 +0000
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
X-Inumbo-ID: be737369-a147-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7qn9sqX/sgDmCy1qEQi9d18FK+VyGe19guSiWSIpZFx4Q72KjrB1me3WGk8F0n28Qdxp2Fwus3KmcDssPZLtoC0TYuGfrcuBjHAeTKWkz+8Edtqk6ouzgqroPin0GT+Z9kNZ77KPuGkrANX/Vbp0USZYeR8m8CaKMqsANJQrijKI5rHnIwjt7g9RmlLx9KpG8Lwg9VfRHssuZ3qqM10q/Oef6g7W76W0fUTGM2DvUsdpcnL3eTy/p+8o6oQqP3lTW1q42jdmnEAgtSPqUSksbwdo8FacBOqmz+27WmiA86s8Q49kOw3SvGzrr3h3mPOXtkPiS2VNZB1BWYal7sb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZrE9fuEb7NSiW+HiQighC5FKwhlCKCmQ8RFTDyAOXI=;
 b=VC0X46u4X7KBz4LROdkNMpoNJv9Mdc7/K+HWqv0RtrCPu7+eDqrheS0IwEGZcslIArT9o57NIMs6SfW3RtHuxTWLxxI9exrPUmuO3joZcNQ0Uv9OSX8bjipM8G9Jq6PwOTO63MOUEDEB7EAR9mFyVm9qclvM66yuGWvGDhKyqNYWLLl/1aZFcWcBaEHTDU+hb7YkGOV42fuoFCacTwDU06FRJSRAlxZQJFJJJdwAhmFgF2DUybSqQgvg+qAkNSx76ISPSEGrT6DkN7cc1wsRU82upHvdIK7Wp+UpVOahPLjnw8kpCxE6dNJHQkgSrUi0017baeHMAmkKOOWgF1cy7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZrE9fuEb7NSiW+HiQighC5FKwhlCKCmQ8RFTDyAOXI=;
 b=ofh9DS3Ph2JOP4VmxwAexw6m+w/NCczcLfiUW4ajjnTnMpAAvZe3PO6ioNOf+QHhVv9GZw/zQ2aOe3MgsQJ8TkmNDK9rcIfbQr0UcVhvbSr/zmHIASo6Ww64pmZ+GdAhoPOrmB1uZu9o4lXp/P75SRpGbCdt7Z6HIt+iYnXRUE/XvEufBDDWAKtijZEizlxrobz2ODLqseZxeKZe9pijDHLVmJZLSOVNWn2WwhydwgFP4U/z+nvKWnerxvCKxD71JwXD18hG+hPvzNyYXky3kpWlLqFgaojMBQSDlVIwa1nQIlF2rLlANS3mbIRTTGR7t0/kuQdvtAgat4a6vW8xrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1d63dd9a-77df-4fca-e35b-886ba19fb35d@suse.com>
Date: Tue, 31 Jan 2023 10:14:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/14] xen/riscv: add _zicsr to CFLAGS
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <971c400abf7f88a6be322db72481c075d3ceb233.1674818705.git.oleksii.kurochko@gmail.com>
 <CAKmqyKNSywyF8=KUTiKN12JL_Bst5if74h6mgek1aMYS1QpjeQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKmqyKNSywyF8=KUTiKN12JL_Bst5if74h6mgek1aMYS1QpjeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e871bbb-1e94-4e97-c10b-08db036ba0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SpDQ/5rCh/dVzNvt6vrZ8q0/DE5/RhT4odlLR6tYq0muRZp2F8CMdVBYL2apEUVPC+TZe1B+et+gfP3DD9Je74XnTIK5RGgPudzMiNbmii9OU7ham+jAhveO51/H7xLeURVJ43KNTv6rikNPbH3vRKJyQTcVqFT195wO/Pe3RMxSZ5mmk86r5nGXoaiY3TWp8klnVnHRal9Da7Mz9n54ats57Fa0X3YY6X9Cpios5krDVDAhgKl9O6zpz9snpX0K+DdRMlMrb+t/aOTQ2QAOcJNn60I4MOuH7di8LIWTK27blPLrTXd9z765TwvKHXoQ6CiUI8i9E5ZAD5akFaIiRup6SUukx+nKmgJXQCew4cU8B+JmdeuY9CViIkDFdRD/hJIZCQkPc4kDywaRXJ9p19oihmGArFMaHBrhgk1sCGGD9Ua5gCXKY9PDTlvKA+TcMyzQ+8TyaQVdd7Pect+RxM5kzI/KdlCO+gRWvY54+HTlrrtAY9l/8k9MIcEaU8z4a4/DLkG8MYNz+VZjFFICLM0mpER6lYPRkHeUzKgpdCtkaTxWvkz/npVqUmqzvdKFDMA0JnWg4noevRjQq7bCMyf+X4aGuQcLEpJnaedIaTaf2mvBl2EmYfd1BYBb6m3sPoUfiPz0n0zi41+N7QPzA1SpHStHE7wcrmG0g1n2Eem4ajUYNAFWpxmqiOoPstvvjo2iVXINjP+oI0npPjxBjZ7zqkSMcG1nHOVOgufMsso=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(376002)(396003)(346002)(366004)(451199018)(41300700001)(4326008)(86362001)(2616005)(31696002)(38100700002)(316002)(6506007)(36756003)(8676002)(66556008)(6916009)(66476007)(66946007)(54906003)(53546011)(26005)(186003)(6512007)(6486002)(478600001)(4744005)(31686004)(2906002)(8936002)(7416002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkVRQlc0VmdkTGp0MS84NFdkM2dBRDJmVnl5MkNkUHpuVDdpQkFiYjN3UFR5?=
 =?utf-8?B?MHVhdGMrckxKd0cyNzRLc29mTUdqTTNHNUtodGEvMVZYTTh2cFdNQTI4QVU0?=
 =?utf-8?B?V1Q5Z3l4cnJkL2RxSERuM29GMnZYdEpjY0FYRldGNG1QVmZXWjcwaXB3SThv?=
 =?utf-8?B?NVhqZVQwYTJhOU9HbDl0WG90Z01xcEljSWx3TFdjWUc5N3hKeGx6cUE5WnZN?=
 =?utf-8?B?WExVZHdubVJwN0gxR3JsYTJhYmE2bkI1QWNTVFlOWjR5ekNQSG5vQVZoU3pi?=
 =?utf-8?B?dmhSMXM0N2VNLzJGekFFNVdQR0hlbW56bkVISzJaNDY4ZmVWRktkR3JVS0p3?=
 =?utf-8?B?OXIyY1M2ekxOdzZtU3BRZWE3dzlTNVBMSE5XUk9tc2t2NVRMM0Ura05jUUVi?=
 =?utf-8?B?NHlpdlhEQ0FheHFRWFRqalZxOU0wZGYxMXMwN1NlbmxvWHZPdGdHcS9NSWx4?=
 =?utf-8?B?S0xicldZZkVDTVFQU1lqb1RreCt3eXA5UTg4eEE2K01QN1RSd01uZUx5NDFS?=
 =?utf-8?B?cDJBc0x1Qzd6ZWc1djNyZE00S3VZVXpJbWdjTVpKeDdjS1BRV3lianJUcmxQ?=
 =?utf-8?B?OXNEQUVmd0hQTjR6UDQyc3NwdWh0MDNVaXQ0ckE4dGtNUFFFOUtrYnNkK2xt?=
 =?utf-8?B?am9LM0hXL2xkUW1QcDh1QkYyTG81UEVPbzdBclRqVGh0U28xV0FyTU5kQXY4?=
 =?utf-8?B?bUxFZ3pJdEk3NjZhcEVobUFIdTZZdFZMN1E0b24yS3ZhaUFDeDExYUJyaEJR?=
 =?utf-8?B?L284OU5wUkkySEhKTXAwanFtTlIyYmRhU2pXbHdqYlZzR1VSUVhiM2I5VEds?=
 =?utf-8?B?V3pSdlFSMCsybnh5ZUdRQVdyU1ZkK1hhbUxDT2s0QndUcVVuSlZrdFEyNU5N?=
 =?utf-8?B?endtdmRialVHZlNxRFRKd0RsNXpUV0Q3b2dNTjB6bzRyZTNBdDBsL0ZpRUUv?=
 =?utf-8?B?TFpaVHliaGhwdDFPVysxeHRmQ1l1cVU3S2xLTVAyTE5zV2M4Qm82VVNMWmFR?=
 =?utf-8?B?bENYVW00cnd1QzNzVTF1bkpvTlkzSkNyOGR0dFg5NFVzUmVzaUZMUXREdnM4?=
 =?utf-8?B?T0ZpNFpuU3pSQnFDSE8vN0U1RFpPVDlHMVVZMjFRZjRIQ1BSNEU5b05wOWNF?=
 =?utf-8?B?MnJKNEtBbzFyVkI4U0RrVFhRbWVhNk5lU0E2NlZzTkVGUk9FY1BrVWx1bFIy?=
 =?utf-8?B?T2RnVk5QbGF0WGk3cEVUL2lZRTlZOE8vSU1KSzlNek5zclVLMFBEbnFsQkd3?=
 =?utf-8?B?dGppMEpOWGI5REd4dXd2SW04bWR3R09lOGVxeFNnOXVqR3RDdXdsbkpLTEZz?=
 =?utf-8?B?MjZselpzMCtnaHI0MTNYOEVHeE9EalZNb1g1K21QeFRNaUUzaWtFY3Y3K0ht?=
 =?utf-8?B?N0xzRncrYzJTQTBzZ0t5T00yWmM3Z3RweUE3cW1VTXdKeVNWdy9LTWRUSTNt?=
 =?utf-8?B?YW43WXRKY3NxVUlBZm80V1UwOFdYdzRPL0dwelJxbytvOEh1U1JpYzhITURr?=
 =?utf-8?B?SlRqSHlycWowU2pDdUFpTXF6YUh4U2wvNWZTdFFJVU9BbmxNaGJ3dEFDeDJM?=
 =?utf-8?B?K3FMcmFET0pMUnd5bFNhcG4wU3NSdmkvdXFqaUdRQWJnVzRMcmpVQ2QvNjFI?=
 =?utf-8?B?NUo0TFE3bWhiTi9DM0h0azIyZ2Y5dURjMmlHMmdNaDRVaU5ub3lmOHBmTEoy?=
 =?utf-8?B?anltN2o4OUVuZjNGeFUyaUJpTnkyYmROZ2I3U3pOMnEzYkowMDI4R0gxV3hD?=
 =?utf-8?B?OXVhK1RFMldYazNoMzYrNkRabHdYeHRyeStxaUNuVytONEF2byszN1htR2dF?=
 =?utf-8?B?ZzhCak9RM0RNbEhScHprRVFDZUY4N1lBMHZsQ0RYY0pkbGdPMHlrMzNhMGI4?=
 =?utf-8?B?cUdhS1BjNDhERmQ0SDdxb1ZJYm5uWWdmVnBNSTEweTF3ZUFLbXozcldEZnZR?=
 =?utf-8?B?eU01aHVPZGRFRXJXVnFOVmRldkh2dVo3U1N4SEs2alU5eGltZG5oQjNIRk0r?=
 =?utf-8?B?cFhjYWpvNTVrcW1jOExCTDE3aitTaVdub0NtcWQ3Rm5IcTdNSHdvNVVhMGpB?=
 =?utf-8?B?dzNIUHRISVBRMnVjVEpNMnN5SVpmeGtrZFpaK2FIRExja3E3WG5XMUVDV2s2?=
 =?utf-8?Q?pdVlv8cceJ0WVZAG6uaZWBqM0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e871bbb-1e94-4e97-c10b-08db036ba0b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:14:59.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jinSyhXhai4busi/6z1g5x3y6Z3jgCVNoaB3ktv9PdY/oAZt7o5u0mzEPRQlB16ZepSORnQAwj6syZRLuDODsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6794

On 31.01.2023 01:21, Alistair Francis wrote:
> On Sat, Jan 28, 2023 at 12:00 AM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
>>
>> Work with some registers requires csr command which is part of
>> Zicsr.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

There is an open aspect Andrew has pointed out on an earlier version.
I think it would be quite helpful if that could be settled one way or
another before this patch gets committed (which formally may now be
possible, depending on whether that open aspect is considered an
"open" objection, as per ./MAINTAINERS).

Jan

