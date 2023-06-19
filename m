Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185CF734CF4
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 10:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550836.860012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB9pb-0004ze-4c; Mon, 19 Jun 2023 08:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550836.860012; Mon, 19 Jun 2023 08:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB9pb-0004xO-1y; Mon, 19 Jun 2023 08:01:47 +0000
Received: by outflank-mailman (input) for mailman id 550836;
 Mon, 19 Jun 2023 08:01:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qB9pZ-0004xI-K0
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 08:01:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87103a0e-0e77-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 10:01:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9425.eurprd04.prod.outlook.com (2603:10a6:10:36b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 08:01:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 08:01:38 +0000
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
X-Inumbo-ID: 87103a0e-0e77-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4grtX007nCFEciGawSWslryoNdyoeNwwf8ISqmbaonU7MrsanI4psUFSW+p64jQ8yQGc+W8wXzX6L0/N3NpsUJzVzSEXyO4Qbdl/lmV26FWlq40dhCiEdSLfi8lTXOi+drxDZ8HwFCwLtiR1CK0i1mzuuf6OKPZnlIux10o917NH0B5jW47jf3sHuO0fYtNMXe8ovCwrLYtaufNQykLp8tb2cMnyVSqAfDLMEyeDYffKu1DrfNmBmmChaBTRQ7ZqWFkugATRb/ZwUXAod11HfdUvt1pW0SVqyDAavrfwGJc66aM2OSaN+pm458hZ0OVzI5C4DzwzK/OG2Q7hOrSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnosluTA5cRZYQhlL4XcCeJvic8miCTBSyAP5luvsFM=;
 b=FPERfVCRkVUSUFVWfFiWxbjfCIX5ckCaionQCZPAncMNOty4Nf7YpUAZAw2RovHtFtMuz8uX1/q3U1e9SFvUJlyNh7ilPoiFLpGEVYR3iZwUb1VsMW/bCtQF8NmMaUSFumab70t2uGdabZ/BdbX/N47uKaFXYQAepgnjs2lE9+T/Pd0a3nluNIQO3vrsBrbNXbHF9vbuOo0TnhMoK95pgNRp1tryonsl3iaf6XCPeADz6ugfopzxm7PA4tuZALNjytk55f9bHKXZyohAP4jlgOwpcBF2DDqQIzc8iBAkMLzOjIzjL9X+j+sqXJLaxthT0WiHnzqsrtkoz2X8irB6xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnosluTA5cRZYQhlL4XcCeJvic8miCTBSyAP5luvsFM=;
 b=YxG0tFq8p/+tESRvk/vVsz4oJm/aQlVHQcGuZsh02KZhZ/EzgpoAGTWbM/VlI8ZGhJTS650tVmQ7tKynr6ErY8uK+fpv/13ufDTH68ZSjI+vTNiKyLlNwy5bUR7R8zytUhXT91zWYO2VrgO3HilIrJ/4D2zcxYNAh6YZMb8n/BC4KYFEw/Kaf0R+eyc5hgZDaAK+vwqLQTlrhmI1O7ao+XXGM33o6b+8yNmLDZ1+l0Y+4Myf+0WuOfOicSvGHeLETxBk8kAiFQ4ywWG+MZCGeXocuFHTdWECUqFcQh4WAXqtgkZNX6+Nhi1wk4KK8n9bqP+9kqC0MPHn5j8akiezGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a60dcb0-d883-4f42-7a0b-a004bec68b40@suse.com>
Date: Mon, 19 Jun 2023 10:01:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
 <c14fed22-2bca-a39d-81bb-5901447e632f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c14fed22-2bca-a39d-81bb-5901447e632f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7b6483-157c-476c-f95f-08db709b68fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JMeZoQcmEtGNBOCiZdj9nhpVKMQnlz3W7zUxMJyIZA3JUt5YBHMroXbFBHhp0GuGJTznLcbdQrx9zHISD50/ge9zpDQZOS8gBF4PLU9NFlVu7m0TbilpllQAnrq204GAx7Q2g/k8ajlCdurkejtVktMYcEvcZqe82MWTQxg7/mgxBJ6pvLj/kXhKm8CXvt6TAoA4iySkPzoxlOjqSt+JxnJJdbhiHOtX3ffc8C8JnBy8r5YNtfpzbhdAVuf/adr4mlps6q6TQ5+WUr93vTX2RP3jmlt+z+TMkqO/ZMHzCXd9AyZzlK6X32IipVY3l1aEqORvdRqUjvBq4q4X8mgfh7CLfIZRJE47vR/u7XO8zwOkP6SaTng7S4Ukf9rcZkF6P/OhgX9V90Dt9dYlWVJD15HtmCd4m6gOZV8nc7giE0RZr2KcUgttueOj8940APnATtF4mR25V5TDFKFY/gz19Qs5fBXs9fmnZD4bErng2/lJ1XOq40iQNpu3aEhC1gri+9Eon0mKmP5PaiDwiJqYYKP54RZuXkBK0IGyseoh8e579MgoWW1HQFlEPI5tfl86OIJlx1K9znqBLHBIqY1LyMJthNXr5z0yHbYdypW75FAWGYltuzBbGOFyxm5vxa85AYJaC/PHZVBys4PftmzUMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199021)(478600001)(83380400001)(31696002)(86362001)(6666004)(6486002)(316002)(38100700002)(66946007)(4326008)(66476007)(66556008)(6916009)(26005)(6506007)(6512007)(53546011)(186003)(54906003)(31686004)(2616005)(41300700001)(5660300002)(8676002)(8936002)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bS84N21pY3UyK0hTZC92TG4xeDY3QXlEK3hFTWk5eEhPMGduc3BHNGJSQmE0?=
 =?utf-8?B?d3haZzJydFNiZWdxNDQxSGhHQ0FEanlCOFpGSFV4WVVybFVOME81aHN0NFJa?=
 =?utf-8?B?Z0szNVNFbXBKRGQ1WGdRYUg0NGswS0QxdGQ3RTBLb2ROOWRTU2hTQlRuaWo3?=
 =?utf-8?B?SWZ2TGlkdWVuZWtUNXowelQzQllZYkw5NU8zZlFJdkRHa3NLcm1BbENnWERi?=
 =?utf-8?B?cmhmWDlKbUc3Q2xTVTY2bkRzL0JPWDJnbS9uazVTMTBHdkZyanlDaW1ySGVv?=
 =?utf-8?B?UHltWkpEZzU4blpZRm5IdTlyVmk2THo3U2VGdDRBM1dDNTJFaHpncGNUUklq?=
 =?utf-8?B?MEY1b2NadnI5VEZvMnJHT2xWdkpmWVVhNHlWM3FkSlBXMXFhclIwMjRnNHRT?=
 =?utf-8?B?bzBuWDFrMGVqeGZZM1pVSnpRRVIrOVJvZ0gyYlk0NXoyY0g4QkJHNUphL2FL?=
 =?utf-8?B?NE4xOVRibHlzSXdONjYzVnpVNlRSenJyYStWWkkweXVMT25ZSlJnSHRzVVEw?=
 =?utf-8?B?T1pGeTluVmVTR2IzRGJHTXBZdWFrMHZkQjF3QU9tSnhvVFdQSFgweXVxbjJK?=
 =?utf-8?B?M0dLbjlaTWhIWkpaK3VZNGhoekFZUWt4TFlRLzRwb0dYOFZFSnprUzAwTE5I?=
 =?utf-8?B?cUE2UnJTOHNJajFsV0ljbnRkSnBpd2pmcTlBZTZ4d3BlUlRTTW11MldtcGw1?=
 =?utf-8?B?U0JudWlqcGJkbDZhTkozeHEzWEYzb2tZV2diamlXSHpiMlFMREt4dU9yK3VE?=
 =?utf-8?B?Qk9UUm9tNmlZSmZpYStHT1owZlhmRXJPTURnTy81VUNnSC9CYi91MnY2emkv?=
 =?utf-8?B?emdZenNLbERnMUZFcGFLL0wxelFVRll2MkV5d0V5NUZQdTdLTGs2Zi92QmRP?=
 =?utf-8?B?Q3JMSWljM1BFd1VWSHBCaGhwUnJ1YXdPNEZYMmJTUWFTQnFSTDl1aW1XNk9i?=
 =?utf-8?B?RnNmY2ZJMENtSDJ1UWd6WG9CSFhETEdkTkpKNEpPcUNSS1BieG1NNGlmcHYy?=
 =?utf-8?B?dHdPM1hkd2IyK201cnowVUxDMU5vcVBGQVROZzdzeEkvVGRtS0pxVHJLbFdO?=
 =?utf-8?B?ZklrMTZ2bndnQ2VhYlNmRG5Lbnl5RndXdWV2ZUZscjNQTWplZXR4TWNxSThp?=
 =?utf-8?B?TzM3elhXY0hQN3ovOGVNWnl1dE9oVlRlSjE0Q1VBRW5kTG9HVDBkQnNmUDdi?=
 =?utf-8?B?YitOZUtXZ21vSFpPM0kxZldjQUkxZHZxaHRxUGtKYWZhU3ZMVU1RT2dKWjFy?=
 =?utf-8?B?YWhpZ3FmMC9qNVI2OEpxdXB4M1dibDJNRDBkV3BzZEZlcUxzMVFVR1FiRGt6?=
 =?utf-8?B?aVlyNlcvQlVXVkpxVUsrcVg2OFhDd2pLVmJJT2VjbHpvZ0NrZ2tsSmdrVWhk?=
 =?utf-8?B?UzQ4OGpZckRzNllBWlhPTkt4WWc1UEFQVkFBa1hWR29ibXhRd0JITVNEZnJN?=
 =?utf-8?B?R0VxYllIZUxIaGJPQXVqZUMzZVVYdGx3cHVtWjdrUTZNMEVzOGQxcnZ0MGRU?=
 =?utf-8?B?NnBjMG5WajVXOE5zYUhFcTZvMjF1ZHRrKzArVTlPQnZEcDAyQXc0QUFLSjlO?=
 =?utf-8?B?N3FKb0diTm05eU9VV0Ruck1xQXNUWE5qZkdkeEgxVmNDRXMvVmh1dWoyMms1?=
 =?utf-8?B?WCtVY1NZVm4xb05MU25kakZkekZvK0c2OUsydDhFNys1SXkweTZ1a3RxUTBk?=
 =?utf-8?B?RFRGcmtJOE41RVFMVXBMT2RJS1g4ZjBHcWVzQXdSMUtGSVVaWVl6RXp5RGE5?=
 =?utf-8?B?cmEzUXVFeXpIRHk2V0VadENwejlRZFNQaTQ0WEpvV1NKUE5rbGcrVStIZzA3?=
 =?utf-8?B?TVBTTkl4S3U4N3ROUk5mMGU4Zy84WUtZcXl2U0xIL3dJaVprcENiTk5PZzhw?=
 =?utf-8?B?d3BOcEttenhnRHNMK1FrSEVlV3htdWsvTUZmSXVFWGc2SnN2THUzUjV1VnBI?=
 =?utf-8?B?U21zVGdLWmtrY2ZGaHlPaEFNOXVXWUZadnRiTWYyR0Z5cVIyNWVzZm9jVk1y?=
 =?utf-8?B?OG40eHBSc080L21xOXVaZnUxekM2c1MzSTJ5bFBvODlOV1JUaWRjY1JnWmJ5?=
 =?utf-8?B?c015aGJOUE50WFlsRVlydld1Rm53VmgxcjhRVzdITGV4Ui9sa3I4SGcrVXNh?=
 =?utf-8?Q?wjW6dmk9cfBAAo5/LIXti0wdO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7b6483-157c-476c-f95f-08db709b68fb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 08:01:38.8226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnESPCL4m8SkLj4SYi7SMUQjnzQ26Vpmr2nnEJ6fnWbCtdb2pCi9ATM9mOrG3GN455FInECvFDuBW8gSCLQblA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9425

On 16.06.2023 22:39, Julien Grall wrote:
> On 16/06/2023 21:24, Andrew Cooper wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/ppc64/head.S
>>> @@ -0,0 +1,27 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +.section .text.header, "ax", %progbits
>>> +
>>> +ENTRY(start)
>>> +    /*
>>> +     * Depending on how we were booted, the CPU could be running in either
>>> +     * Little Endian or Big Endian mode. The following trampoline from Linux
>>> +     * cleverly uses an instruction that encodes to a NOP if the CPU's
>>> +     * endianness matches the assumption of the assembler (LE, in our case)
>>> +     * or a branch to code that performs the endian switch in the other case.
>>> +     */
>>> +    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
>>> +    b . + 44          /* Skip trampoline if endian is good  */
>>> +    .long 0xa600607d  /* mfmsr r11                          */
>>> +    .long 0x01006b69  /* xori r11,r11,1                     */
>>> +    .long 0x00004039  /* li r10,0                           */
>>> +    .long 0x6401417d  /* mtmsrd r10,1                       */
>>> +    .long 0x05009f42  /* bcl 20,31,$+4                      */
>>> +    .long 0xa602487d  /* mflr r10                           */
>>> +    .long 0x14004a39  /* addi r10,r10,20                    */
>>> +    .long 0xa6035a7d  /* mtsrr0 r10                         */
>>> +    .long 0xa6037b7d  /* mtsrr1 r11                         */
>>> +    .long 0x2400004c  /* rfid                               */
>>> +
>>> +    /* Now that the endianness is confirmed, continue */
>>> +1:  b 1b
>>
>> .size start, . - start
>> .type start, %function
> 
> Shouldn't we introduce ENDPROC()/END() to avoid open-coding these two 
> lines everywhere?

A proposal for this is pending, see "x86: annotate entry points with
type and size". That proposal extends to asking whether to use this
scheme uniformly, not just for x86.

Jan

