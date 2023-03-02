Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7F36A85BB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 17:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505219.777855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlMx-0004xS-HE; Thu, 02 Mar 2023 16:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505219.777855; Thu, 02 Mar 2023 16:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlMx-0004ux-EO; Thu, 02 Mar 2023 16:01:23 +0000
Received: by outflank-mailman (input) for mailman id 505219;
 Thu, 02 Mar 2023 16:01:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXlMv-0004ur-Kj
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 16:01:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 782dfa69-b913-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 17:01:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7972.eurprd04.prod.outlook.com (2603:10a6:20b:236::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 16:01:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 16:01:17 +0000
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
X-Inumbo-ID: 782dfa69-b913-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WC29pK2wSF7fWNy3dNIwgB9Zvq1x9OXQszcfexxioy33pBtIcViBc59IV7IN9IXLdXwhLcZavCYhHE4F/LH3UpkcnCr11KKCBQDVV30T+qqSkC3W7ei+0Kq0mpJyW016ruH64wFBKB7DGl1rGnocddwHqGZTIYF3VkMfM5axwZefxartRjVMuS/GBq3RGCxhA4pRPbi3rRbnwxsbvOAm/CfOWDprKKFm/jyggKus3GiC0zvAHC89NIqWVBL7rG1N6qUUs3L6J1GTtRo5KruXz913YsJAGZv2A6eCdg1NflQt47B8QjU9sOu/NTA+0HQYcwQD69HA6hXZgZWrsSdMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+vAtvL1J92EepVf+YxfR4F1Mn1QbHYpNgohoNWXeBo=;
 b=H7fb2XnrhyuaPD3E8qkbDHUztYxHtZBRJT3izAVzt3yH1sxR222wxnlwpsv9DEZvWI/Bh8WFZgNIHk1QoSeJWtyUENtkVUFfYkjgRg7m13iXcvEaqbShyc4oLQBxCbFMaf1hCBSf+YhPYv3HG+wlwaVNXJiLiGjg1O6KXFQ/IJzuFyLFcUqU2u5GNf/sfveD8q/OdF2k7AudA3uNdyzi6pKHsPoUwvK0xj7pVeA7oAjXbali3sdPIworx7u4jS+jUh8FDWHoBC+kCgNpb6/ZEnab8qIT8kuu4/SSeNNiDm8xtnltvV72I5tt9s4bjS2HpVnzKmOBzdLMbE/rKOMM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+vAtvL1J92EepVf+YxfR4F1Mn1QbHYpNgohoNWXeBo=;
 b=LY1X8ruz+uvPcQ84O8uYh+DQFRuYUD3CWwGnf/epsYsL+pQN+EFI09Kj8CBpPeQtWrzBzZWcl0qUK4fjMI/C0QwseFW/T+ICZgatPnbeyXkkcjCHKqx8ElpzUq8SAF0Sk1ICKhQy6CsYYfgkY5ChbdbKn/GjCuXJRbAapbfmx+A+xHd1DxZGodrPl4G87wyLqbQ33qRhwO3/aH1/WNZDHDATMs+vKcyyyIRwn7HR/HsXe1Y67S/thJMKnwLgQm97+re04UAnXikF5tTlIm2L2wemijwCwsYCsiQ5quGBssl/UFaFO99/v+gWZMuLqLTxynxA1zEuDYJmccuaBLQdWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54524d24-e0ff-8177-8d93-f5892e843d67@suse.com>
Date: Thu, 2 Mar 2023 17:01:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/3] xen/riscv: initialize .bss section
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
 <495bd1d7fc2becdd48bd00253c079971e2231e99.1677762812.git.oleksii.kurochko@gmail.com>
 <270118d9-0a7c-82c5-aaa8-437644017af4@suse.com>
 <454a6452b2201b815979e7ca730949f7bb5fe4ef.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <454a6452b2201b815979e7ca730949f7bb5fe4ef.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b33775-782e-416e-2c8a-08db1b375b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QcMoFm4dGhKqUjqr+YLhyh90uz8xeyMXxBAk7s97V+AOeWvvZL/Utkah6ab7h+2XCAsOVMlCEFwhZiUePSN1znZv/+GjnjpFCvLINvBiIoSxK4EyGeeqyWDQxnFRBVDOv0yMR77NyA2hQAzwf1Tn0ZvpysNbcbbZBtXRpIqAhuOaAfrAhPCPVcC8+Wwq5FbPmGktapoAWTa55zkgDr68TkSrtGrwJVMbcQ4Uiv69+sR4yi+q04HXOSSfyCClEUTf3Mx278YgpifsYPKBdGbhHwlfOR3/U2VIroYQln1lTgSB+OAaJU9souYCZ9sS5QQcw6zpjuY1vBiRCC1U3tJoDiBQMBXu/Jl6A83ESzqRUvjg6D1o0S42m5SsITbv6BueFTRJHInMrD1xov9XxXRDue1cZzaEYwXm2MWt81wTxrkHWZyfJ2tBUms4sbowbks5lRH9Vv9T6W+FFwgXXb+klt/Z9XdYT7I4Aoh66Qqr+eqLhz6KH7u8HRKxm+HxiiCYXFmQI0GNlO2Bxji9MM3O52vdrbNq1uLG8XXda3eOZ1KU4t6NFxYbLwIJPjNy++hb91i9K2pE1GEo4cfej2BCawWqaWGMnYZ0rCmJncE2WoDaGEWfYK3cUmkKWlRcPv1gllMRinsefvEFQlj0RatA3vfqATifr8iulDSiun5FYCQThfgzcsCCJ9sUJ2rUs1rvKSMUkWRyRRIJlizz+mE5SszDtGqMvw1z9HBsALmqSEgLRsmIFaMM94WNKRon0edq0SyqdRrq/43iw13pUNQ3gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199018)(31686004)(31696002)(86362001)(2906002)(8676002)(66556008)(8936002)(66476007)(6916009)(5660300002)(41300700001)(4326008)(66946007)(36756003)(38100700002)(6486002)(478600001)(316002)(54906003)(83380400001)(6512007)(186003)(6506007)(26005)(2616005)(53546011)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDF5K1JvSDU0TnRkMVhhalNXc083MkZsazJneGRkT09SNFIwTEtLenhXS3hZ?=
 =?utf-8?B?bVpuMjN3TTI2eWtGeDFpNzJKZnJXOVhYai95MEhJck9hczlQbFR4WlVGa1pF?=
 =?utf-8?B?RGJNUmVwTVl3TFJZZEJkYW1GWmxCeDhZZG1DditCUjAwenlvMjRaOEk2M3Zp?=
 =?utf-8?B?V25aTTZtNjllSlBQYUU2ZC9GaEhYSS9WL0ZXVW5aMXg0Vk1KWUtyUndJTkNq?=
 =?utf-8?B?c3g3VzZtWFNLR0hkTXZiWVJjWkxXNzQxZXJibzJHaWl2OFRlckFQNzBya1No?=
 =?utf-8?B?cUo2Z1JYczNFbzhoVSt2cWdMMXQ0NUU0T0NSL1AxbXhlWm8zc1pKT0ZJckNt?=
 =?utf-8?B?RDBqdTg2SHNWUXllSmN2bjdUZ2ZmRHhUKzBrc1VwRWpJZzRGM3lacDgvSEJa?=
 =?utf-8?B?S3J3UUw1Z2VuQ3ZLWE1XQlhDdER4RE1lOGZvQ3lLMHQrM3Iza1k2bVAwSHBz?=
 =?utf-8?B?V2VldkZsZXkyYXJ3bUg2TmRPUTQ5QUtDZjV1c2pXTDJrcDVUbElTdWU1VVVE?=
 =?utf-8?B?M2VqOWhrdjhaMExwbXlRNGxQc3lwNXJNa3JlbkRwTThiNmxPbWVhaTBNR3NZ?=
 =?utf-8?B?anNBd0RGUWcvYngrdDNKZGJMUmY1Q0JhZXRwNE9MYTdxU0gyUE1ZQjZUUWdL?=
 =?utf-8?B?c0hFNkl2SDZQUWZxNHRSWXVXdThBUVc2NUtjbWNTMEdsZERLUXFqbTc0aFF1?=
 =?utf-8?B?YTdMdkFQWmdibDIwYXF0bDBLN01JSFVLaFhYc2ZkQTF5QWxaUTlpK0k2eXda?=
 =?utf-8?B?ZU5tVXNndTdZYmNUdGhYTjZrMDNDNVZXNS9pZkcvU0lUdklXbWR2ZjR6R3RO?=
 =?utf-8?B?S1pnY29LYllzS0F6UmdydnB4NFVQTU9zYUt1TklPaC9MZkJWZTRxZVNiWmMv?=
 =?utf-8?B?eUhYQ1JZUDU4NlpiR0p5RGRFZWxmc0I1MXdkVWRCYnU5RFIyS2R4elVXbVE1?=
 =?utf-8?B?Vms2dnQ5UmRwL1dIeEFOQnRYSk84c2VUV01QQW5SUVZaa210T2gzZHhiaDFz?=
 =?utf-8?B?eWFKTlVBRXBPYngreko1bXI0VktoVFNNM08vOVZKQkVUbEFGaEYxSE51T1Rv?=
 =?utf-8?B?bTU2VkFnUGJ2QUtjREtVb3ZQWmRKZjlEbVVSWitmcHRTVWJHc2pJdlROVnZa?=
 =?utf-8?B?ODBhZTRXc21DRXg1Zy9kWmVpRHRJeTd6SitqRGNyYnh4SDFqY0NzbE0zaHg3?=
 =?utf-8?B?ZnRwamhkZG5pTkVEZ2NRMHVvem9xVUVvUjVpSGlRc2xvWFFRZngwY3M0eUx2?=
 =?utf-8?B?RlhIdHA1bVd6RTVvUHM0dSt0TjVrS2tZSnR0L1N6ZDZpMy9URXZJTzFBczh5?=
 =?utf-8?B?ZUEwZzBIWlBjNERJUkJUQWNwNmNzOFh2QnJOREkvRWhDQmEvaGNpU3VTYXg2?=
 =?utf-8?B?V0lpZUNjS01DcUtCRitERlJUSFhaWWZFblZVMzZhWDh1NURYSWNucEh1cXFN?=
 =?utf-8?B?UFpMS3A3b2hOaFUwc3MzcER4UUFCVXJvUVI1aC91dTZuV1RmZDI5NTAxMndV?=
 =?utf-8?B?NFBjcmR3NFFqc1hoeFlhWUFLQ3Rlcm1ldVcwVlN0RmV1Sm1lL2Vidm15Njg1?=
 =?utf-8?B?UEhQU2NoeFJUYk15a0Jxblo3WnZwZmh1cFNha2tScGVhdFl0UFppaW5qRktv?=
 =?utf-8?B?a3NCdjJBN0M3NlFjQjlJTWV4WDFteVZNQk5LdUxtclhSTUlrV1Y3ZEpmQ3Ex?=
 =?utf-8?B?cEZFUVlSTTF6eWx6YTRMdkhZazhOSnZjcHRFdHZWbkg0Z2pSYU12VktDR1l3?=
 =?utf-8?B?MjZXMTZkVURicGpZenlPVHE5eC93aS9EM3k5VHFqanVWd2VCc0Jhd0l1SW1V?=
 =?utf-8?B?VlBFVHcyMyt0KzlrZ1BEY0Jqd1hvNW9XS01Kcit3TGlqVERRMEVUMzY2eTYr?=
 =?utf-8?B?dVJ4NlE4Lyt5bHpyMXZOVjNGQVZYMlAyQU9ISHlmTlRHa2gzdFlPOUJ1QUMx?=
 =?utf-8?B?ZldUNVAxSWxEYzQwV2F6aWhyN1pqS1FDN09VNGZPcnEzTlBaWXl0a3VqQ3l4?=
 =?utf-8?B?WnpYcXpmWlU4clp5aGZwcGU1aFVyYzdhaDFvVEdLdmwzTWVGQjUvUEtCZDla?=
 =?utf-8?B?N2RkS09UK3hKS3hhQW5iTERlaDZGQ2Q1T0g5enpWaTFyWmRkcmIvUzZTa3BX?=
 =?utf-8?Q?FAl7yePWmB4oihJiCGAlHZV90?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b33775-782e-416e-2c8a-08db1b375b86
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 16:01:17.7134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fW3s7JqhAEMh55AZelq6ANHVO7udPELn9Roo7HuvYfVAYUX6i5k6E0M2VWMFI0DrjlH5KBdl8nKDQ8tI9pdSYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7972

On 02.03.2023 16:55, Oleksii wrote:
> On Thu, 2023-03-02 at 15:22 +0100, Jan Beulich wrote:
>> On 02.03.2023 14:23, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/riscv64/head.S
>>> +++ b/xen/arch/riscv/riscv64/head.S
>>> @@ -13,6 +13,15 @@ ENTRY(start)
>>>          lla     a6, _dtb_base
>>>          REG_S   a1, (a6)
>>>  
>>> +        la      a3, __bss_start
>>> +        la      a4, __bss_end
>>> +        ble     a4, a3, clear_bss_done
>>
>> While it may be that .bss is indeed empty right now, even short term
>> it won't be, and never will. I'd drop this conditional (and in
>> particular the label), inserting a transient item into .bss for the
>> time being. As soon as your patch introducing page tables has landed,
>> there will be multiple pages worth of .bss.
> If I understand you correctly you suggested declare some variable:
>    int dummy_bss __attribute__((unused));
> 
> Then .bss won't be zero:
>    $ riscv64-linux-gnu-objdump -x xen/xen-syms | grep -i dummy_bss    
>    0000000080205000 g     O .bss   0000000000000004 .hidden dummy_bss
> 
> And when page tables will be ready it will be needed to remove
> dummy_bss.
> 
> Another one option is to update linker script ( looks better then
> previous one ):
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -140,6 +140,7 @@ SECTIONS
>          . = ALIGN(SMP_CACHE_BYTES);
>          __per_cpu_data_end = .;
>          *(.bss .bss.*)
> +        . = . + 1;
>          . = ALIGN(POINTER_ALIGN);
>          __bss_end = .;
>      } :text

Right, I did think of this as an alternative solution as well. Either
is fine with me.

> If one of the options is fine then to be honest I am not sure that I
> understand why it is better than have 3 instructions which will be
> unnecessary when first bss variable will be introduced. And actually
> the same will be with item in bss, it will become unnecessary when
> something from bss will be introduced.
> 
> I am OK with one of the mentioned above options but still would like
> to understand what are advantages.

You could also remove the branch and the label once .bss is no longer
empty. It'll just raise needless questions if that's left in long
term. Plus - I'm not a maintainer, I'm only voicing suggestions ...

Jan

