Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31B46A3E1D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 10:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502278.774010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWZdb-0000GL-8d; Mon, 27 Feb 2023 09:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502278.774010; Mon, 27 Feb 2023 09:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWZdb-0000DD-5j; Mon, 27 Feb 2023 09:17:39 +0000
Received: by outflank-mailman (input) for mailman id 502278;
 Mon, 27 Feb 2023 09:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWZda-0000D7-8z
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 09:17:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92be7024-b67f-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 10:17:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8296.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 09:17:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 09:17:33 +0000
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
X-Inumbo-ID: 92be7024-b67f-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7vIUuAETdJhprn60R/Mo4Mi9t2L5LbqOb7HvCCk7dh/dO4lcjP1U2zLy0gd+RKnUbuFACJC9Y/fNCgy0mLO6hnN/tWc2jyadTDRQJC5u+jnaLc0S8cuZxpqtsWRNxMkzhbHn+1L5K9P9xSA7GeDryyoFTbIAaDFoFgC1DVjUQs4e9cH/EngaG/Ddf3A2HS0ce8Xbvyk8qHqQzKD7xOPnUVC/l1NPEQlAS9n2xjmc35JRtuzcAXnZa64mWkkT+F+DgS+iKhtfpgR9d5Ly7Dgbwrlx3qADMToNT1LF6E98Yd8HD8442Uy54zQ26Yqvz63C9L/KDYiFS9aMvO5mCmayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3qglYFZaUD1bDSZZCZB0gxJ7jhLbH3ufQj9cipEW30=;
 b=OZVYHZZXO/Tm4kYOwGSlcV643MoUiXL1mg6EuyC5eiq6nMPv1C3xhYJwWOGc81yoCHFtSZhYSX8LjPXXzc7IHIfr5k9hkKYYkthMrz+PB+HKMe38rIsLfoCNI20lGKeW08mFH9g0PoauO35u34BNscaDdQ/inRx8xsFNKuKw6CV1vVAFYieG25AIHx9SodW66tBbVj/P0ZbscN/MzLT86y8G8B0cboEwpxo5Vs/76b+bVxBJ3/ACwSGJKD43NwnqaXcH+13OmFzadsnCF0GE+UKJHCYpqDGB4VWaS03oRkfr/h1+xHCxul+/GEtluXFpZD+3G8f7hsVZ3R4jpr7MCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3qglYFZaUD1bDSZZCZB0gxJ7jhLbH3ufQj9cipEW30=;
 b=t/G00kqDD3oDZiWRFuLsWL0y5n033Lfd94EMtYImHMKPyOmHIYeRvn6Ie0EcdgyV4y3p2FMyWDO5e/ycdkQWwZ7ZiLMrxB3L44S8leIl9B7JupgtHRRZ8E/SzPTRgOsrYZ5gFAlczD0bF+KQwEdGnkfq2u7Ub4HDxx3wPGlejzhBNRXUAWAgSJiQGGxaq1/LQ1JpAC+81hNa2ahYRbg0B2rNc+VNkoGsMNrZZUFPk9QhXksjGGH152ScsiSuM2mqxR92n8v28erXBw8cx8CNgEBJWaG5feQAEKL9SSGaIheBB28idZsQObtYzk8ARMWJWf37pi9RVwp2o6yMwKQfMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <738ca749-2abb-6ab4-db8f-81ff41f4de16@suse.com>
Date: Mon, 27 Feb 2023 10:17:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/riscv: read hart_id and dtb_base passed by bootloader
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <94d722dea114defa2a5efe29e6511829f0c54b41.1677249592.git.oleksii.kurochko@gmail.com>
 <cbc043ac-fde9-50d9-a63f-40a6b4a59f34@suse.com>
 <b2e99dbc61295ef8ab41ba8e8afa8f606ed6503d.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b2e99dbc61295ef8ab41ba8e8afa8f606ed6503d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: fc039140-67b4-4a35-906c-08db18a37584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hzjVrVxqLpFmwwr9ti7Xc+7UAl2vT9PV7xuQO8kr6dfYbK35613OjL94MmN/uCQN1fn1rSG3gPzFKgP3tCzC7pHLC3eTPmx2aPOlXh3CPr4gnl3YNhyEz5eSy7wE+LyuKhm/DIGKOgqVTjA/lC4P5lSVe3nrx7jsJFmNzIOp4pYbnKLgkT0m6kmB6Z8wb0fHV2z34AX2aSSIlf0kodkH2tYFRworTvIsC3g9I13jt9t1z5O/6GcFtRTzqmWh1NzHsR6yrBLyMHLzaPbAESYsqktV9hzL3zDyR6psf6MeFqZw098EWwucbh4HI2JZUXyssKg/XgpRj5eNeLywYBKOs0OVocIyhA449bbkBAcyIpWuYAVm5JIwuepW8B5pgOK8TVAexsbG3eXzGVNEKibbqs77CjNZ5Ggyn6dJDAWylusfV/dB1KNi66xtfeATUIywwv0o2YZcxY9i/Mbo0ozlBOV5FF4++hpa4qOn119uO7NWAxhtxH1hUKvcx8TIzUThfO0MWVNnkF7fmynSyBK8kORw64rpUcCb/CPMnC1EV9Y3bCYWINrsIm1/UIYYLF0LpoCoXYtj05TXGeqCGeOqiPm/MmW2udtHFu2iOr/bIiC20r3AiLi4I8xuKQQBLdxgi4K1jICGJp26gyZkjC9NBAfoP1PcfHJfH/63WxY3cRe42ikT74yphlUl27AD7A44aMfy5BHSernOdaN/aNNcbw7ifHcP9ZVywBdHOBE/USs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199018)(53546011)(186003)(26005)(4326008)(66946007)(6916009)(8676002)(66476007)(66556008)(478600001)(54906003)(31696002)(316002)(86362001)(6512007)(6506007)(6486002)(8936002)(5660300002)(41300700001)(38100700002)(36756003)(2906002)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0VySWFiTHl4dlFWTC9KWWFmK0pua295UnVaR0s1d2FGUk9jRzFvUGhMMGVC?=
 =?utf-8?B?dnZVbXp0b1dZdEI4VHA1VmxENnNHSG9iL2k3SnJ5blAzNS9yeU1Cd2R0ZC8v?=
 =?utf-8?B?OWxzcFJQTnRWWjVadEx5dlhyVTZVMWI0VTc4UHMzTEhxQVJEc242S3VMclB6?=
 =?utf-8?B?VVJzY1lxV1AwUjhNQzlJOEEyWEVSR0lIVlUvRDB6c09Ud1hsS3hwYTFIWFhs?=
 =?utf-8?B?RzEzWlpXVmwzNUVoV3Rmb1VpMkswcmVNT2Fnak5lNUF5T29wWHYwSUdwZ2lt?=
 =?utf-8?B?cXNROFgvRXFOWEUxakVtdmMzYUJ6RkNsMGMwQTdiVHZmaEFSdWhpanJZTVg4?=
 =?utf-8?B?QVlaRTN3OWlDTkYyZ3NtbFZDcmd2QTBEMXhDWE90dkEvT0lyeTdLZ1gwWW9y?=
 =?utf-8?B?dVM4QTVERXhzUnAzZzUxd1RZc01MNkY5aG9ZLzlaRWttRy83K1YraFZvMmE5?=
 =?utf-8?B?ODRZZnhLVExkZUJEVUJLQ09lTHFkektwYnF3MmY4Q0t0d2Q0RGdKOGhTQTkx?=
 =?utf-8?B?YVpNdjZFRG1pSThtSnRNZHJwV01wbnR1SmhJbnFHbWJUY2RkRXZFVUVyQjc4?=
 =?utf-8?B?bGdHUWhEU2NkTW9uRHgxVHFQV3ZLR2N5dVhHQ3RCa284NVNkVEU1TTFqcTlP?=
 =?utf-8?B?Qm53dTNuc0FvSFA3bWZWbERQcEd3aUFyZVlwZ3RJQ0ZMOE00MURLSHd4ZnZk?=
 =?utf-8?B?MkxXUUxTeUJad0FWcy80aGtzYkJaeDI5bzNjakdqOHBDeGFxZXVaY0RTNDlz?=
 =?utf-8?B?WnVPdDVOaVVqZlNZVTVPbGFOWDZpbXBXVzh6bThFVG9kZ0lweTJVbm82cXpK?=
 =?utf-8?B?aVk5KzZvdzFQcHlJcS84WS9DeFpRYUdEdWFYSUFWZDlialhPRDg0MTRWcEVE?=
 =?utf-8?B?bUhudXVPWlVpcTZWY1Rhb1VIVFBlaWg1V0NKcDVjMW1tUG1iUnMwVU1oTnpu?=
 =?utf-8?B?U21TaVBSTHJPWTVPeExzYUZjbzMvQVdjUTFQYmJ4V1JxQTF2VEgvdGlrR2kr?=
 =?utf-8?B?WStncnFaRnF1b1FyWWpveW5wamh4NnFjS2dURkJqT3d3TWI1Q0pkdEpBMHht?=
 =?utf-8?B?S0w3NnBrdnh2WDZkd080TmdBcEdYSXprc0YyZmRsRmEzdzhEc2FHTmR4NTly?=
 =?utf-8?B?T0NvbEZQQVBiaUZDYStLOHRlOVAzR2dqN0xQN0pQMTU4cTVJSkFrUzVQRWw0?=
 =?utf-8?B?aUwwQ2JaaFBWYlBmR1ErZzF5Wk1GQUM4clBQQXBSS1l0UEgxcWM2c1VNTnFq?=
 =?utf-8?B?SHUwVE5lRkNQVDZ4VHcvaXZ6c2xzWUFwQ3NNK0RZYjFDRm4vaVpDb2NuK1Bk?=
 =?utf-8?B?ZnNvOExDSUFYL1A4Y3djRG5EbWlXRWtxU2hORnJSVlFodjY1dlhOVlUyeHR4?=
 =?utf-8?B?SzArOHdzYWxtTnNjSGZmTUUrdU4xR2h2cis3SkppbmdzRGh6UlMwVkFBanc1?=
 =?utf-8?B?TVM5VkE0VDV0cmY0RE9hZzBPdDBMYnZKT3EzYVdIQjdkNlpFT2krT3hMS1B2?=
 =?utf-8?B?akVkdmdGb2pjdFEwbXRDOUdRYnR5V1RZWWNob1NsbUlxVmR5cnNpZjVMYXdp?=
 =?utf-8?B?R3Y1YWNtcm5Sc1B5TVpKL3UrN1NNY0xoV3RHdjFHREZtN3lQcDRFS1AraTQx?=
 =?utf-8?B?ZktQQjdKbTdkUy9Ed0hTUmhlTnpWR0d1WGVMVTFXMXZac1pTbkhFeEx1REoz?=
 =?utf-8?B?OGNIcXM3cW1iaEVqN2pRaHNJRm9TVlZEdGpudlR2OUpWVit2ZnBIcW1YZy9a?=
 =?utf-8?B?L1BpRjVTYlF1VHM5RW5FN1IxYnA0T3lCSlh5aFB4U1VkZVkyZDJEVForVUY5?=
 =?utf-8?B?WEJ0RjNRN3Q5Nng1SkRiS3NpZ21FTTRzdHZQMHJha1BzV1pnY1VPVERhb2lz?=
 =?utf-8?B?SncvL1l4WFREYkZIMFVMYVIvbnZDZ3RCa1JpakJ4VkZxcWwrY2R6ekpOR3pW?=
 =?utf-8?B?TlVPTXVQeSt4RTQzZFVvYlRPNTJlUXpUVXlEcndtMG1HU1JnRkVINmd6RnVv?=
 =?utf-8?B?Y0ZHYnprZm0rd0pTb3BSMDdPR1FmZkltYnlSL0JnOFZyTFplMmpjamw2V2xk?=
 =?utf-8?B?SHBFcXQzdFZra0MzOXZnMDRkQm1iN3Z6cElUSWZGZUE2eVNJVUVhekRjd1FN?=
 =?utf-8?Q?xfq++ez4ipG1s4hCj8VjOQDb4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc039140-67b4-4a35-906c-08db18a37584
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 09:17:33.5758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvhhjsvHGswUN05+oUV8SIJVQET2A+NHMNf58ZmmNBbbLzsJBWjT5QckXKmaWGtA63iiAo3lPShibIg/XmbYxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8296

On 24.02.2023 17:36, Oleksii wrote:
> On Fri, 2023-02-24 at 16:04 +0100, Jan Beulich wrote:
>> On 24.02.2023 15:48, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>  xen/arch/riscv/setup.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
>>> index b3f8b10f71..154bf3a0bc 100644
>>> --- a/xen/arch/riscv/setup.c
>>> +++ b/xen/arch/riscv/setup.c
>>> @@ -26,6 +26,18 @@ static void test_macros_from_bug_h(void)
>>>  
>>>  void __init noreturn start_xen(void)
>>>  {
>>> +    /*
>>> +     * The following things are passed by bootloader:
>>> +     *   a0 -> hart_id
>>> +     *   a1 -> dtb_base
>>> +    */
>>> +    register unsigned long hart_id  asm("a0");
>>> +    register unsigned long dtb_base asm("a1");
>>> +
>>> +    asm volatile( "mv %0, a0" : "=r" (hart_id) );
>>> +
>>> +    asm volatile( "mv %0, a1" : "=r" (dtb_base) );
>>
>> Are you sure this (a) works and (b) is what you want? You're
>> inserting
> Oh, yeah... it should be:
>   unsigned long hart_id;
>   unsigned long dtb_base;

As per below - no, I don't think so. I continue to think these want
to be function parameters.

> I did experiments with 'register' and 'asm()' and after rebase of my
> internal branches git backed these changes...
> 
> Sorry for that I have to double check patches next time.
> 
> It looks like it works only because the variables aren't used anywhere.
>> "mov a0, a0" and "mov a1, a1". I suppose as long as the two local
>> variables aren't used further down in the function, the compiler will
>> be able to recognize both registers as dead, and hence use them for
>> argument passing to later functions that you call. But I would expect
>> that to break once you actually consume either of the variables.
>>
>> Fundamentally I think this is the kind of thing you want do to in
>> assembly. However, in the specific case here, can't you simply have
>>
>> void __init noreturn start_xen(unsigned long hard_id,
>>                                unsigned long dtb_base)
>> {
>>     ...
>>
>> and all is going to be fine, without any asm()?
> One of the things that I would like to do is to not use an assembler as
> much as possible. And as we have C environment ready after a few
> assembly instructions in head.S I thought it would be OK to do it in C
> code somewhere at the start so someone/sonething doesn't alter register
> a0 and a1.

Avoiding assembly code where possible if of course appreciated, because
generally C code is easier to maintain. But of course this can only be
done if things can be expressed correctly. And you need to keep in mind
that asm() statements also are assembly code, just lower volume.

Jan

