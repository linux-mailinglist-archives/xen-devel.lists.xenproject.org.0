Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07426A6B05
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 11:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503974.776421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJxA-0000gZ-EZ; Wed, 01 Mar 2023 10:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503974.776421; Wed, 01 Mar 2023 10:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJxA-0000eM-Bn; Wed, 01 Mar 2023 10:44:56 +0000
Received: by outflank-mailman (input) for mailman id 503974;
 Wed, 01 Mar 2023 10:44:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXJx8-0000eG-N1
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 10:44:54 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe12::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18f39f0a-b81e-11ed-96a2-2f268f93b82a;
 Wed, 01 Mar 2023 11:44:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 10:44:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 10:44:48 +0000
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
X-Inumbo-ID: 18f39f0a-b81e-11ed-96a2-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOZ8gJ8YbvTjTrxaYHuX/2UwszN1nE2IZM6vDTS1IuSVWDYTMW51ZLUkx3rd3+FYPwRxuNYv0ay7JIylbI1441+D944s/+MkmjGA0qTuklORZyfX/siT5aw+H9woonJBr8EKZSg/87B5/csMJn1eZJmQxqZ9OVyDI/fLPpbCbITe8GCR4liR3bhZnHGs449ldCdCVyi9CkMbdQlSVx0CWlBWq7tvF7ssjCRgzKBygnXpfcnLORH96kPRcopCOT779wiyAQwCBTHJtTMzjELvMGi3Nnlh033i6m0ak15SF2Qla71iYmDAU9qaRvoEY/NeWgV2EFWK8BZ0DfRulNTJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+4hBedckU6EJTQQsk2Gb6nIN8h+3/yPPQNo/5cKrZw=;
 b=eLv6jdWT9gGt84aduk3HKG0ok8BwAkXuauyPEeB+OioWYqMvyJG8lk4YsimRKI4G29EzZYWBJ0JAeBJ2QZ0qPehVXW7a2TDNXlz6gEiHx8F0jjALA8ucE4unZJVVP1j/Q1WL5YsBV3EoXl7s0mOKta3SLqXRVEzT4bIM1iuBCLMrsnXK2b3ACjbTeC3Xn/Z+7fpUOk3zz9v1bd/WGd6FZNKdflJjBN8X5hIXdWCMXAxesaeIGLhrTv6q+aM2CBa8dWonymkfprSPvCUjEvz0KlVW/6IWowVT5Cya0IsEmYDOc6qd2lh5NE/p4t55GNa7pknJAb1mlBl+TxKr0LAQgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+4hBedckU6EJTQQsk2Gb6nIN8h+3/yPPQNo/5cKrZw=;
 b=cBfv1cLrIZ5SvVri92uARlIQiJjMk8eNtE32pg/EyCSsxuwSsKx7QZZZqOWAchlnATxzJ4TK1PghOah+bMK9mhWkKjp+jLLzYf0SfaUk57/FzbJ/dj4P57yi8pFjRBeARSL0zT+ksrVUESRU7yIDjowa7dJsloZ8tLXRwj2QD8cmAWImoBA/0px5t9nHy5AV9CgfeQ0o9/0OHtTqHJAksYxB781v0zoQZ/2ABXxZUBRpxgcHVLKYaUdewE5MtAyeB8G8rH/SNkLCnhsFqNLXyloOzBMvTqX0URV8M0VsOp9F4V11HoHfXaM3cjeTbgYfrDK9X0RePKb0BxsUEJt1Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3cd3f567-e777-6a1b-6940-2b73bcc62983@suse.com>
Date: Wed, 1 Mar 2023 11:44:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] xen/riscv: introduce trap_init()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
 <b1b2252d3105eeaf0cee10ae2be253c8526d0e5c.1677237653.git.oleksii.kurochko@gmail.com>
 <dcfa24d7-20c9-b460-32d7-7567b17c0b32@suse.com>
 <b72d513448710072fe84b7f742f4d867bfc4da05.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b72d513448710072fe84b7f742f4d867bfc4da05.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: d0822b95-0f6d-4ee9-d434-08db1a41fa2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fo08sKr+ast52utzf2SQ4puv///ISeLkQbc/uynuNsfc4TqLn7xgxwU3N3vE8lIJcnAhXLSnHuG6Da3/E5VgPzfFMrKA6vru17tWF8GPoDcasWFTGLQiodXh4sdYHBsr5US73hoswULt7Tx+efF1tsA86H33qBsLglbBJ3bxeNSZ3JPkInCH5p8JOBo0r5IUQvCuNT9sDRDALw7en4+oN6zx25hOhkBk/O01j6A3PEFCvso6/JONNlLPPPSyZ45FjTAs1fjb8jx7qf0dxNH79L7d+6r8OP551Hty+achVMSuLCtk/9o99kc/u4wfupOb53/6JPB/FUmTojT3UvuJuB6yFYq8k40XBummLGK/3tQGq6zEip+UpPFTurnJoxrDhpdiPm+8QKkUAl0Q8O83SC+pTTHzOaBWACuXQS72MZLSfGdY2tRN3vtJaIA/v861jJgRt+u+W1JdAut0TNRQsHbIQ/JsYMUbyPyEZjgf3VKgeLy6etZGR9VAc75lcdbbY5f8aECvJbavyInqdqOb/xllxGl17eN9JpATwtx/zoHJAmKmCbFrXuACOaXKerUSRzx9Ld2FxD1euDMGbURUUfd+ju//+FzAkJVP5RbWueTz0kUwvXKVqyjNX+0Z2jsynzQngmIRHIw9druRNdTikfl0jjq2Y5DrW1Ulu+SphWpo9Tm8CbXQ9YsFwlokvrl362b0osNj9q1WMcvQdOCrAB8vaza9v3R2RAvwBSRuqkI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199018)(5660300002)(54906003)(4744005)(8936002)(36756003)(31696002)(86362001)(478600001)(83380400001)(2616005)(6486002)(6666004)(186003)(53546011)(6506007)(26005)(6512007)(66476007)(66556008)(66946007)(38100700002)(41300700001)(4326008)(6916009)(8676002)(316002)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGRkYXNDTGpmSUhSUC9yek8vWWV1V0x5TUp1YlU1ZlVRak14UTJwMHNUMzlM?=
 =?utf-8?B?ZVVaNzNSQ043QnltY0kzcmdYVFJpdDBFVkh1R0NxYVJVSDVzWEd1RzZ6VWxN?=
 =?utf-8?B?N1IyQy9iMlRqeFpnWjB2LzVUWHFGL3RmRnArM2NlWXZaRHZSZ3ZZZUJBQllM?=
 =?utf-8?B?QlN5eGViSGpObldqd1o3Z2p1cmJFRjZWT0FmMzA1V1ZwdHhqYTRxYWNnazlT?=
 =?utf-8?B?bWJLdUZFRW41OGZvb3N2MUdiMlI0dUczQXhRWnovVUxEWUNUcDVTZWRZUTVV?=
 =?utf-8?B?aStBR1lEb3UzQjFpK3VKaHVxTWk1eEJuUTVoUXZnRGhKdDB1Q3ZkK1NIK3gx?=
 =?utf-8?B?N2NBb2laYUdpYytHMDZmSnRlYkxzalpXbWppWmVZZThINnJianoxdmQ4eWNz?=
 =?utf-8?B?Y2hwVU95RUtJVUJ6VGs0RXA0RmptdEsveWhWNGVnbVQwdWVxSHl1ZHNQaXl5?=
 =?utf-8?B?cHlVWmdjdVdXWklQNTJuUWNXa3lvdUpTNVljS1pwMzZJbTJ2VjlzRkl3a2Fq?=
 =?utf-8?B?dlZSZURoNGhIUTJGMWJWM0NDaFd5RU5adENkWGZoQXJSc1V2RGpkeVMxaUVG?=
 =?utf-8?B?Y09haWlMQ2ttdFJBdS9OY0ZiN2VyTE43NEViOFhQS0Q5dzFsejFkYWU5a3J3?=
 =?utf-8?B?UG0yL0NocmhKbldpMGx4TnR6NVBlYUFCaVIzS3FHN1dDOWJFd0RxUUxNblI5?=
 =?utf-8?B?YXNMcVpvcU01MFUyallZQUx2REUwd2pRYk1UUXJUOElGWVJIUXNrTjFDeWpW?=
 =?utf-8?B?Nmxncmw2dXh5SS82WVppZElRNFNPNTdya3lpNGNQVnJib0VrMGUxSjUvWXVh?=
 =?utf-8?B?NWp2aDQvVy9Ud2lncDZKNnVhY2lTY3ZGWmpIb2h6WUl4dnpKMU05ZGo1ZGd3?=
 =?utf-8?B?Qk5abXp2ekFkaU9UNlNtY1FXRjBVdWZ0TE9ST1J3eHAvYlVReUhIZmVjYkgy?=
 =?utf-8?B?K1ordzIvSHRXZ1R2RGhqTVVyNUNHalJKZTBHQU9lS2ozeGVSOGt0dzNjVm00?=
 =?utf-8?B?NnBiZVkwTGFZSWorV2NvektqVTRXTUJSaDZHNmovaFp6azQ5NExlR2lucmdT?=
 =?utf-8?B?bExhMVY1ckN6L0IrR0lZRStpTGhuK0hzM1pUSlViM3pPZkY5dlFqT1IxNmdO?=
 =?utf-8?B?K2o2MDlvUU9pN3IyZWZQY1cvR1M1a3duOUM4SS81WFRMN0EzNTFRdzk4eGpW?=
 =?utf-8?B?VXoybHQzVHVVNmVVSTlQVVNsdzFOdDF4enMxTUt2ZXJFQWM2L2ZGVzZYdXd4?=
 =?utf-8?B?eHZoY0tzaGtiUzRRYktza2pSUUZoNjZjL1pPVGZTa2xicDVodUx4N1Q0ZVZ6?=
 =?utf-8?B?M0lQMm8wZEpMT01PaHNlNGY3SlNpSWl1TEFLTzlBeDVCclJqNUtyNGttTTg3?=
 =?utf-8?B?VkUzczFoTkJKWVFyaXRmUjNsN202cVh2cm1TMTZaMmJERGxrb09VYmRZNlI0?=
 =?utf-8?B?cGNNL3piZ2JTcHErOEdmOUpGcys4YzVtbWQrV21BUHV3TXpIQURaZ1ErMHFK?=
 =?utf-8?B?a0RlQ0t5aVNYeml1bEdXYlN2VGk3b245bmJka1BDalVFMFFtQmd0cWlha2R3?=
 =?utf-8?B?bGRZanQ1aG5uOXFNZEVxQ2VOQUdRMytnbmVDZW1vcnFRN0VSWUNZWitZT3d6?=
 =?utf-8?B?U1RXS1RjNGh6ZnlZS2FQdWp6Wi95S0Q5dDV3ckJGdUJNK3NtVi9BSmFBdkdM?=
 =?utf-8?B?YUhUbWQyQ0lIbnRMSmVrems5c0VZSVgzdEhQM3B2QVhWclhnVTVGanVURmV4?=
 =?utf-8?B?R0hGRHlCQ2NDWm15Zk9hd0JZdzFNRnhscG1BZU1ZRzdjY3RlV04yR1NKY3VY?=
 =?utf-8?B?bUNhelBwUTlyN09Mek9nT0xIejVRNTVmQXJ3RXYveE9yYlJhSHN4VTh1K2l3?=
 =?utf-8?B?SWNKbmlUY2lkaTBKU2JqTzl2dUhZQ3NhYTZOREJOcktnSHJzdGxzeHNhYWFN?=
 =?utf-8?B?ZlZPd0dnVjlhcmh0emRXZUYwWEVmUFJlejdMdENOcm1HMC9OSVhZbk5WVTRS?=
 =?utf-8?B?MHRBSVpNaE5BdVB3WFYzdnRCTDUzM0EzYWErdGgxaVdBRjNpVHNkajJ4RDdq?=
 =?utf-8?B?TmJibTIrbGVkYkdTSTlpeVpQY05vem1vaUFHQmhaZHF5Z3BoVnd6MEVpU0lE?=
 =?utf-8?Q?O8sf01XsGzQ11l3vnxbh0NJ12?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0822b95-0f6d-4ee9-d434-08db1a41fa2e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 10:44:47.8438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTtN8jRygW1G3shFVE77c+NlX20mdjc7JNPPPpdAA3g85SKJThn2VxXJulcpiz26F0QGshYuqul2cpyrSCkdUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8700

On 01.03.2023 11:34, Oleksii wrote:
> On Mon, 2023-02-27 at 13:50 +0100, Jan Beulich wrote:
>> On 24.02.2023 12:35, Oleksii Kurochko wrote:
>>> @@ -11,6 +13,8 @@ void __init noreturn start_xen(void)
>>>  {
>>>      early_printk("Hello from C env\n");
>>>  
>>> +    trap_init();
>>> +
>>>      for ( ;; )
>>>          asm volatile ("wfi");
>>
>> Along the lines of what Andrew has said there - it's hard to see
>> how this can come (both code flow and patch ordering wise) ahead
>> of clearing .bss.
> So should I add the patch with initializatin of bss as a part of this
> patch series?

That or make clear in the cover letter that there is a dependency.

Jan


