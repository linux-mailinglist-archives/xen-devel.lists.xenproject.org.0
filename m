Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83446677B41
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 13:41:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482825.748549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJw8L-0005Rc-KR; Mon, 23 Jan 2023 12:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482825.748549; Mon, 23 Jan 2023 12:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJw8L-0005P1-He; Mon, 23 Jan 2023 12:41:09 +0000
Received: by outflank-mailman (input) for mailman id 482825;
 Mon, 23 Jan 2023 12:41:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJw8K-0005Ov-LB
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 12:41:08 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2076.outbound.protection.outlook.com [40.107.247.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 331e04dd-9b1b-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 13:41:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8928.eurprd04.prod.outlook.com (2603:10a6:102:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:41:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 12:41:02 +0000
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
X-Inumbo-ID: 331e04dd-9b1b-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgpWq0sW8MlH2JmE6pFw5VVY8Yk+NMwsrX4khg4F8JVy73DCMYFfbHrfFg0EsU7HV6zrOVgghqWpMx+OrFr7tWeHE+s3MEIxmZaUBvSmtJ1lTpNxV5nEQeR8UHxWmwT7tp7W12TMJ1n8COozxpStAks+/5Il2aWcpQSJJ2GIL3XHMPU17m0HNbDumb7IFalhGxXI8/k076QSc5LciReT/jTN4YSU4Y9Wk588B7IdCPaHd/GGy3Wzm9l+kUrE4Zx551UgnDMg3YRLQ2RHaMueSN3z5CGKa56wJLdt69uCLVFItcmzblah+3sS3a/lyVlRfFFh2rHZborjmloybWpB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHmEEX19wYmeouYaOvjhxtXA/9ROfVN2luM/OduK9RU=;
 b=Dy24Vst+6B0h0zAtc0bJB4H9WWftoQdiW+W56JtRodBKsPKN4CpsXhKyn8nZsB3oDNLG8IXzdOx0vx8On/njrFPp5KahA2j9XCWOYX0Nhg0V6ILi5MVeRMCMw/Acy9p/qAf2y77WTwUR0q1aRiYbfkJWv0n2ZEDF1JVlXheq+A759KkG5qFeK9d3SIe1yQ31Vw2bBMuFVpwC9I0qpDHZfZrDO8IHVbPyJodQduc3B6hojTQs3FSjETVdQec0ItKqG9VlAiDjM8YxVRPicrg3t7MZabUWWEXmNeYvns10thF1uCRVSuHgsV41nk6elT8bkNxfBqA0RnwAzXKxt+TWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHmEEX19wYmeouYaOvjhxtXA/9ROfVN2luM/OduK9RU=;
 b=gUNZROMesxiO49GAoIkDU4kGzIaPuuXxXruhGZkm2MGyZT3Vo14wSnKPhyIdPluWbHAAtZs2t/KsF+AMXBr+G/Q2GJryceWtffR5BEUjYzD7+u3ReVnc0emktDPvnsRx68YCZVc2ssc0ctHcCw7m+wZnDo+Sl20QMN/JAeRYsk788YBUKkvkp0lOTfqCO3wdutQt0yZNBs/b7gMgiQ4fo6/XF2Q0qKSujI0V+iXQVScXKgl4S5F9RfOEFYlCQMAfBGqfGKt8tzhzBTWpfOb9IyvalfZOtKSmovfw1uHzye9Xsh+XhQFRdDdAHIe5G0vRqrKyYJ/JgHbDUIWOgL7o/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7179c87-fcd8-9a7e-ce8f-4e33035d73c4@suse.com>
Date: Mon, 23 Jan 2023 13:41:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 07/14] xen/riscv: introduce exception handlers
 implementation
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
 <ac6f02e8-c493-7914-f3c4-32b4ebe1bc26@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ac6f02e8-c493-7914-f3c4-32b4ebe1bc26@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da8c941-841b-46ba-8719-08dafd3f161d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z2P7O824L3nbaOwETH/AEc9tlnE1Y0t4v2dav8g3ia522G6EmroN1O0/YsKbp4WzGYm+k0ccSQMy4Jfb4DTcqUolsvNjAxSPoCKpJcv+7QIo9C827GtnF31zwNoM+gX44sYyz34vspiz241wMB8gz4aU7Hb9DaXQpqwYeI60Q1vcJQff7lO9pIclvtLKPews1yz0CVxauw70DyWxrtdjrugjVF0VfdlA2GFCtssOLFiO81+rdqx9Q/J+pkIJ3n3oVhwdA+o2mS4ZRnvvyxHO2aHP71A803gdjuMdB3sPd1m6IhG52Hd9minF2nPTaip26Iqhrv/oA/89hqJ1UFb7c0TyzlTuhAaM7zqZ5nGuHY8X/jbtKPoOFDllbZoxPjda3L+N32O9Pnm6Sl9E8mHV6Sbs28WdJ5n/zfgm3slddO5OQZwaFg8CGB1XVpl2XwXT6Woe6GypICYmcjEA4yfpL/27P+Kz8JY+YZJU5XMjnKaAkzxOXKwJyYiGNksSszQd77KPxwe0XkatLzop8xZTWtM6hcbVTQC7hg/esAm/u3SCrWEsyJrqF2hlGIWfQNxrNx2XeGK1tjyyDrpIkU5onDUpvJTTa3b+CAl7JpEMqdFJg/3wC09BBiCxjBmyPiRlIoiyrqbCLVg5By0TGTccl5kH8//Q1Ey3vmcqlqMIGNd7sJTxpR+5QW+pvD6YAc2e5TWFaVbR0B7uVw84HsEkKeWeokZNlQo/iesxgFsn4hk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199015)(36756003)(38100700002)(2906002)(8936002)(4326008)(4744005)(41300700001)(5660300002)(83380400001)(31696002)(478600001)(6486002)(66476007)(31686004)(86362001)(26005)(8676002)(6916009)(6506007)(6512007)(53546011)(186003)(66946007)(54906003)(316002)(2616005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aERoVW9KRXZpQnZmODlydjhtNVRHRDhZc0VuaU9hdVRrWHNZalhDMGRHSnQ5?=
 =?utf-8?B?cXhWLzlHMFpVSkZRd0N5OGxHTlhVZnM0UkRJWmhOem9FYjBUOUxTdmwrNGFq?=
 =?utf-8?B?aWpKVGZ2Z2g4WjBzYUcxRmpsUzBraytBdTh2a1JvU1B6Vkc3dUpEYklwVGE1?=
 =?utf-8?B?dWhOaDlub2dVcEtGLzAxUm90RWNFaDlVVlEwZjh4cXNGZmFqMnJraHAxblQ5?=
 =?utf-8?B?SFVta2d2TmJxZWNPdlhoTjdFZGV6djh6bGEvYkUyeUdGVzlnZGcxendzTnRz?=
 =?utf-8?B?YlVWSjVYUjZHdjllS1h4c0RXek5SdmNPRTdqN2lWaElldmVNazJuclBpSTE1?=
 =?utf-8?B?bEFqeTQ1dGsrWTRMdmorREV5NHZqdjlWd1ZkUXEvTFo0UHY0SnJ5em00N0Rz?=
 =?utf-8?B?Q3pNZENLb2xNOXdqazYvQm5qMTBFUjdGZmNRNDJWTjBDZjArdVQ0TG43bFdy?=
 =?utf-8?B?QnNnQnFtUEhWTUJMTTFoWXVCcXJSYU4yNDA4aUw5M3NVbEtmZHh0K3NZNUg1?=
 =?utf-8?B?TTdrRXRTRUdKUTcxTGMvbTQwenp3Y0YyeDZwSnlkSHVLcDEzL21mQXIvOGsz?=
 =?utf-8?B?YmRWNkZGNDgrQzRXeXNUR0pkZWFhNktWTVppdkxUdm1QUVo0cXhRbGpwYTNY?=
 =?utf-8?B?QTYrelhlZXlWV0ZseW9nV2RvM2dueEhqSHlUNkJsNjQyN09BRU5XVC93OVZV?=
 =?utf-8?B?VGthajNVT3IrQXZrYXd0Z3dEakE1bzFWZTNYOUpZeWVCSkJ5aFdydmNUK1Jx?=
 =?utf-8?B?VFNoOHFQYmtlcVMrNndFQmFvMGRxNk1pTTU4Z29YQmFCWFNjMXdvSnpiMTNQ?=
 =?utf-8?B?L1hZK0Z2SUZoQWhvdkdUUmpNb1JzQjh0bnJGYjE1YUNRRTVxWXgxL1FjYWtS?=
 =?utf-8?B?by8zRHBueEJLZC9pSW8zVkdjK0x3cmJPa21IWmlyWjlma2tVaHdPeXVLS1ZM?=
 =?utf-8?B?YXJicnE4dXo4VThCOHNOZmdiL2tHOVVvcXNzR2dwaExTd0tDeHlHd0JQWlh2?=
 =?utf-8?B?NWNYTkZhWDh4b29GMy9YQlNaV0gxelBsaFVrOEcyR2tSVk5GRXU0NTd4TGdm?=
 =?utf-8?B?dmtadGJWM3FXbTZPSHhLQ1dWSVh5dVNvMGtvMVQ1Ykt5SE96T0hYV2plRFo2?=
 =?utf-8?B?UTdGRnYyNXZPRHJSQmpsMTUxclh4VFdDeEo2MHg4emhkMmF4NUFLdkJGNGJB?=
 =?utf-8?B?Ylpza3I3NkM1WnA2TlJKL0VNb2lCNlUycW56bXJ2cWVxYU9GUEdXcjdNeTdU?=
 =?utf-8?B?K3F6Q1dOV1VJY09KYUMwcDg0ZXRuV2lrTGJLOEgwQTFWdzlrUFVXdytUYTBs?=
 =?utf-8?B?VkRVcUo5Q2lIanRVdnpSaEsxaHFjNTRrNk1SYlZJT0QrQ0pjOUJSb1BKeGpO?=
 =?utf-8?B?YkxDa05STitQaE1JemVOZlErV2pMTkVjNjFZS080WFJmN2JMaTZRQVRpZUpP?=
 =?utf-8?B?TFJMaFU4cFBQaGlmSC9EZ1NwWm1Eb29VM1hSUXFaaUNyaHB5TURDN20zYlYy?=
 =?utf-8?B?ZjUycDRGWCtDdXNCNzV3L2FhMm1YamVpSFpaNWw1TlpNenhDeWNWdlhTR00x?=
 =?utf-8?B?ZThaMmt3SE1pbTdYOHhZelFiOVowcHNiRmh3MGtMZmxvUW9DRGlYVHFMM2FF?=
 =?utf-8?B?SFY2a2t0QWN6Z2FzaTl4dEIvaDdTV0MrSW92c2xmY2hwMjZBU01oVzA0dEsy?=
 =?utf-8?B?eWlId2c2UDZIZDFnVlo3bUg0Kzl5dEp6T0lJbjF4Y0E0d01ISzdveE9kSjRM?=
 =?utf-8?B?NHpRamlFQmtHU2FWZ3pKczkvclpuaTJvRGtGakthQ3JhM0VRa1Y3aUhVQ3RJ?=
 =?utf-8?B?a3g2N0wxRHVvajZjdktmYzhvUjBVcHZheXR2cmQwOVFqTXVUNXAwMmQ5UFhz?=
 =?utf-8?B?cFJGTFNkeUhKZElXNkQ2NGdOUmlBc1p3TlB1cUkvQzFTR1R2dHQ1U3k3cG4z?=
 =?utf-8?B?bUludnlzL0RQUjN1eG9XajdKRWh1NnpPTExiZklUbEdoKzVkK3RKUUZHMHUy?=
 =?utf-8?B?WDFnY1htQ3lTV0lxSk9rVlgyQmwrK0RCaE5BMlFSbjUyYnZ5YnU2N2c3SnR3?=
 =?utf-8?B?ZTY3MzQ5N2tsazlMSlkvYUZxNHNaZFE3dWgvNUc1b1NEUlQwaFFhRjFTSmZN?=
 =?utf-8?Q?JlPPbEH+j6nCVCd5nhO2h+3c6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da8c941-841b-46ba-8719-08dafd3f161d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 12:41:02.4022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dtgb0eVTNq1+Tan5SkJxFny3WlsaYaIrOpZEQ1lP/1nKGC0XGksTxGSWVOVNeZ34DHVvU+jbuWRPJEzan71pFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8928

On 23.01.2023 12:50, Andrew Cooper wrote:
> On 20/01/2023 2:59 pm, Oleksii Kurochko wrote:
>> +        csrr    t0, CSR_SEPC
>> +        REG_S   t0, RISCV_CPU_USER_REGS_OFFSET(sepc)(sp)
>> +        csrr    t0, CSR_SSTATUS
>> +        REG_S   t0, RISCV_CPU_USER_REGS_OFFSET(sstatus)(sp)
> 
> So something I've noticed about CSRs through this series.
> 
> The C CSR macros are set up to use real CSR names, but the CSR_*
> constants used in C and ASM are raw numbers.
> 
> If we're using raw numbers, then the C CSR accessors should be static
> inlines instead, but the advantage of using names is the toolchain can
> issue an error when we reference a CSR not supported by the current
> extensions.

That's a default-off diagnostic iirc, so we'd gain something here only
when explicitly turning that on as well.

Jan

