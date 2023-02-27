Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3606A40C7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502422.774205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbpD-0003Rn-M7; Mon, 27 Feb 2023 11:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502422.774205; Mon, 27 Feb 2023 11:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbpD-0003Ou-J9; Mon, 27 Feb 2023 11:37:47 +0000
Received: by outflank-mailman (input) for mailman id 502422;
 Mon, 27 Feb 2023 11:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWbpB-0003Om-FZ
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:37:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 252a35c4-b693-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 12:37:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8848.eurprd04.prod.outlook.com (2603:10a6:102:20f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 11:37:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 11:37:13 +0000
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
X-Inumbo-ID: 252a35c4-b693-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vln2oZ3RBmSAfr3DTsZ8Er6I8zzgSi82ZsZraJkb3oS+0pTSG0z+sSSrKtiW98cs1SnZmk8f8uoYq8RQLvfzofeHISesj6+Qeo6YHeC9MI+YrGVIxxQZQhm7WQk0vNgCseiZF+E3W02yJfVfCXKhw2AjzjTVP0N+koIeib7dBdJRZqCbCCorO/Xl0Asa5NWC1iPorMf3iTtmpnPs9q9s3F5HIj35dsIryli6IyIS/4g/MKL8XPuR4sPSUmaQu+odGBT9FcfMDOGsVyAIS/DVeNfKoNGdvlqhWEKs5Y17NnJJ9Kb6/pe8pWyyZemUfvb9Lr+Q+3cgxN8ohdwvVd8jOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQZ5OxcuxGGRwsg8x801OSGwa9GnNVXFz8qA+yDdbpM=;
 b=QsKJMP/SqvbAaYHLYv2geDmSM8Md6SjtPNKsf3U61JWKuXAp4yjPmi4qbiuurnzqY0EnUZqw5QDcggWFc0kqO1/cs9ce4q4CNnzC+nkQHUXGMf0xYTK+7IvDfRWWoSLJBPuNWjS2WacvGe24P1GHtnOY2GayPqEnYICvq8PVciiSvR1k6sm9E30ZRO6Jhy+2uxPhyF0GvmHXcmIEl4sQca6EOh3DXbVrY5BWNXQ2Mhpcqq0gYf9w4sRHg9F4qWJ/UWiu9Hnf5ISjHBO2WUNB48hmNLwLLV3Ahm66I9oqtfiC1vYGmsW2tx+8fhOmlLFXyQrLcA0gq2iJJLQOkCRFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQZ5OxcuxGGRwsg8x801OSGwa9GnNVXFz8qA+yDdbpM=;
 b=gWd7SqlMMx8W8SqP59RCINGEFud0zB92hUt6PaEewJkVF/uq9qJHom026L0BLpI0qgfAvbLC7pQRoIrXeytuP8bOivZMtFqIWNfY+NjwrR+4sKKtaebZWGEUuSO2UWwqbZ7CdMomoQ2KYrJ6UZ/c1mXV+n8R6xLy1lpn+ed4kMQQKQXsA2J+8m+w+wJ+ZbjCh6fPjKHTktxcZgSshHkFL1XteocvWGiN6SnDct6rRHsimRVNZaccDflyRyqWOPhv89qhrDh8YTyAB93NOFpPyTmSnLqmFV94lzk2quxb4e1JKS0T+WVG3KTty8ucGmreI6d8g/wOeL5y7l/c81aNjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7b66c62-d67d-bd46-648c-b48a2e9ec76f@suse.com>
Date: Mon, 27 Feb 2023 12:37:13 +0100
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
 <738ca749-2abb-6ab4-db8f-81ff41f4de16@suse.com>
 <f5d3743acbac46c4fb3ddfe879e417bff77139be.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f5d3743acbac46c4fb3ddfe879e417bff77139be.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c77616f-e029-4bb5-9798-08db18b6f833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZWrMxtrkD7KQHhW3zA9j2FoABZQSe5fFXO6QW9aL/gbvCxOlCe9Zx+8nwh8tzsUfOYJ6kStKUme9OXOzCgrSwVycoXY1OR3tmSaEi4HuZspnY6cBIekfLDQfhYa2A9yx03LDD8ye7vNEMituoK9lubFV5yDG0Nh+2jjts6wUqdihzDwkT6I1QCa2o84xwLGidZnAbmTxAtkoW8ZJbRY1lTwkElKFhj+6pQ0f5QZBSWv1ammihJy/WhbQGjFe7C/yZwLeVQZpUxcNpvzYQpv3f0kJGf/xmyY9hg1u56vaqmMAYJkg4f2sfLFEL39xc6mXS8yKyIEXLEdhfo0MyoV4qen3Gx7t5cHV95FCoDb4MJqRKG2i7ei/EhMbS1LsBjTR6BLVL54YKG7Bf2PR4ZJ9AZYWdOhH0FJCIgJ/b9Yd00OWE3kRLG18Dvrmm6NCv1ZerTviMghI3hwMJyUapMulH6JKFDj4H/WHsQOrb4/lUnBsJAxKQJDhH6b7Nt6AMPVmZWdQ3CqEP34BCbSXlyn7FqNAJNuA5G2Lp9/TCrtsmzVgZC5jYm3IMzoHTabf9UdKNY0rCRWi4AMuvmobDsCrtQOgI4ZK1hGaOYyGHcphpnwGWISeTj70g6M8JuiFAntM1IvB3NEKjZW12sJwq23JGnodQB9rPKyzKQ5W+9VoJbSYxAraEapLjYTb03eCb76rBeUZoYtpsURTnSzU7QqfbUK6XNubIKT6a8x7vi+hTEY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199018)(316002)(31686004)(2906002)(36756003)(5660300002)(8936002)(31696002)(86362001)(53546011)(6506007)(6512007)(66946007)(26005)(66476007)(186003)(8676002)(6916009)(4326008)(54906003)(66556008)(38100700002)(41300700001)(2616005)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnFtTnhld3RockhoZmFJcWNONlBMaWVZdFJsSzZvZGd2SnpBeHJreTFuNmhI?=
 =?utf-8?B?OURsVDNJakl0czh4ek5iNWNRSnNHYjZJQlowLzY1K0ZIWFYxdU41MDRsMVN2?=
 =?utf-8?B?S1hUREQ4YU84anpva3FGVnM2SWpFbk5XL3lheHIydzk0RjZwaFJrL2hmWXVS?=
 =?utf-8?B?eXdsSUlTeXRsNnpiRXM5a2RJMDgvWGlJaXVCTWp6M0tqa09ZSnZ5bTJYZXo0?=
 =?utf-8?B?Yy83Sm5FYUo5S3VkcTFaZ05TRUt0QjNSdXpPdEx6cjNlVk81QW40RktsY29a?=
 =?utf-8?B?RUN5bmlmQ0hZa3VsVzlnSng0UHh5Z3ZNVEl3bkxsVzYyWUM2cjJ5WUlwZmtl?=
 =?utf-8?B?bjFJYStGWDE0ZEJHbVo5TjZuVExLMzJEMGlFOHZZdXUrd0IzNGs4U3Z0eXdj?=
 =?utf-8?B?N3NNQXhZTDVvSWplTU96WHFadkZuTEZoWG51OGxXVzBvbndmb1dDVjJyQ2dO?=
 =?utf-8?B?ckJyV0tPZkhHbUZCQXJOc0VhV2M5NzVCNmdHSVdDWEY5eWNaeWFjNmIxa2pw?=
 =?utf-8?B?Vmk2YnlBZi9jMXRlRXo2ckZxZXd0R2NyMFZSeWE2MEkrdTM1YldkemsvUEE5?=
 =?utf-8?B?SHRHV1AzbHpGSEtraWVkWmx4UlBmWVlOTTNYWm1VRHBIZ1N3SXpIcmNoOWM3?=
 =?utf-8?B?QWtnWXlETW1HSzBHK21PTXI1S3BNZ1VnRkp5SnJSbVdsWmt4OTJEb2xYaWpq?=
 =?utf-8?B?TFJGL3gwOVdtWE1XN1cyTVdXKy81cWNNSnRseCt1djZnM2tsak5NSmxubFlP?=
 =?utf-8?B?WGZwV1Q5UXlEdU92NzBtMk5OSGYyUzB1dW55Qmlpb20wVjNUNEYyU3JsZVVy?=
 =?utf-8?B?cU00aEdxYm9RaFJQdmhsK0hLTUowNmJDRGhrWFRJRmFkaldDK2NnUFVhai9R?=
 =?utf-8?B?VzJQZVFmdXppdGU4NjZ0bkhXSEZ2dFhZcVFQMWdydy85Q1lsTXRidGd6VkVX?=
 =?utf-8?B?ZkhMNnJjN3ZibHprOTFjWllhTlVpY1lzejh5L0dEQ1JYNjlHNWlnOEF5OVhh?=
 =?utf-8?B?cHBHc1JDQlc2bk13UjcrMFRGRXlYaVVyR1p4RnNGM0w5RFVjWmp0NG1Xeld4?=
 =?utf-8?B?cmJTZ2EwQ3FZWEJ1bUFreVR3SUh5c1djbE1uRlByaFdsMGpoS21RRUk3YWVh?=
 =?utf-8?B?YnJIRnBsRUFINTNhaGVDN1ZGZGM4SzZUNFQ3VmwrY1pHbTlUa2dBREliTGlN?=
 =?utf-8?B?dklTZ3ZTSm03a29SbUJjNzJaMXpSWis2cjFzNmMybEJlSFY4eC9TYmI5RGNY?=
 =?utf-8?B?MWtwdktzaDlQNEdVOUJCZjNhcDdpUkZxVzBVOVBhaFdVRmVpYXg0a0xSV3ow?=
 =?utf-8?B?QmZVU2lhVFJmbnZUSFRLc2tXc0VqdkhYR3o5OWRqMzhuYWYrNkgrYlFSanRB?=
 =?utf-8?B?STRGdEQ1WUNyZkxJT1ZJMFBKeUFKU3pFa1d1QXZ5QXRId3ZuUVF0Q2JGVE9L?=
 =?utf-8?B?bFBxM0UxV0xiWWZ0VXZDZ2cxYjY5enB6WjZqTG9WZG14NlpQZGVxc0MreGpr?=
 =?utf-8?B?VWlqdnBsd2gxWDNYUTgyTU1iUkVNQ1h6NmFpTnJuK05vSEFySUp0TDlaNjUw?=
 =?utf-8?B?QUlyam1YbXJxNlNIVEFPWXVCTE8xbGtPUVArUmI1UU9FeCtvR1NVQXh4RUhq?=
 =?utf-8?B?c0tGeVF3eDhlN0lBb29vTTUrZVhpQUI2blc5elB0enhITUMxak4rVXVBUnha?=
 =?utf-8?B?SzMwWHdlallTNXZBb3F0Nk5BR2JkUm5Fa3F1TnVoRUhXM0syb1FuSXFCSzBm?=
 =?utf-8?B?d0RFQTY4VVBudjF0VGZORjBWVEtodXVFNGIzaitLbkl3TlhpNDNRMXVtOHl6?=
 =?utf-8?B?dFd4eWRreDY4cHpnclhCWThTZHlSUGxpZGp5ekRmNlVwVnRYSjRqZ0pXTXZY?=
 =?utf-8?B?SUx5TUluanpvV3RjOUc3RUNMYnIzMzI5NTVkL21kbEVwV0t4YTlLbXdJNCty?=
 =?utf-8?B?MWl3UFpQdFpCNHVNREZrR0taVG1ZdFk1WVp2a0pBRUg4WXc1N09oREl2dERv?=
 =?utf-8?B?S1VtclRwMkxUN3VzbWJmd0pQSFJYaDdOeWFBY1BSY3BNaVhmRlVOZVowZEJF?=
 =?utf-8?B?RDBWNThSZWxRRzRVZys2VGIwZHFHVy9Fc3ZTYldZMUdhaDNBUit1VnIycEFT?=
 =?utf-8?Q?ZTMI0McTvaTu2XBfOVc3ppILf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c77616f-e029-4bb5-9798-08db18b6f833
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 11:37:13.1708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bg7laC00IdZ/XXngpECK+vOc1vMi8KkSPORUQMS2tYaK9qKEczlIiuvrkqpwDtOtKOVZC3NFvnO8H6YvTQyXrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8848

On 27.02.2023 12:19, Oleksii wrote:
> On Mon, 2023-02-27 at 10:17 +0100, Jan Beulich wrote:
>> On 24.02.2023 17:36, Oleksii wrote:
>>> On Fri, 2023-02-24 at 16:04 +0100, Jan Beulich wrote:
>>>> On 24.02.2023 15:48, Oleksii Kurochko wrote:
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> ---
>>>>>  xen/arch/riscv/setup.c | 12 ++++++++++++
>>>>>  1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
>>>>> index b3f8b10f71..154bf3a0bc 100644
>>>>> --- a/xen/arch/riscv/setup.c
>>>>> +++ b/xen/arch/riscv/setup.c
>>>>> @@ -26,6 +26,18 @@ static void test_macros_from_bug_h(void)
>>>>>  
>>>>>  void __init noreturn start_xen(void)
>>>>>  {
>>>>> +    /*
>>>>> +     * The following things are passed by bootloader:
>>>>> +     *   a0 -> hart_id
>>>>> +     *   a1 -> dtb_base
>>>>> +    */
>>>>> +    register unsigned long hart_id  asm("a0");
>>>>> +    register unsigned long dtb_base asm("a1");
>>>>> +
>>>>> +    asm volatile( "mv %0, a0" : "=r" (hart_id) );
>>>>> +
>>>>> +    asm volatile( "mv %0, a1" : "=r" (dtb_base) );
>>>>
>>>> Are you sure this (a) works and (b) is what you want? You're
>>>> inserting
>>> Oh, yeah... it should be:
>>>   unsigned long hart_id;
>>>   unsigned long dtb_base;
>>
>> As per below - no, I don't think so. I continue to think these want
>> to be function parameters.
>>
>>> I did experiments with 'register' and 'asm()' and after rebase of
>>> my
>>> internal branches git backed these changes...
>>>
>>> Sorry for that I have to double check patches next time.
>>>
>>> It looks like it works only because the variables aren't used
>>> anywhere.
>>>> "mov a0, a0" and "mov a1, a1". I suppose as long as the two local
>>>> variables aren't used further down in the function, the compiler
>>>> will
>>>> be able to recognize both registers as dead, and hence use them
>>>> for
>>>> argument passing to later functions that you call. But I would
>>>> expect
>>>> that to break once you actually consume either of the variables.
>>>>
>>>> Fundamentally I think this is the kind of thing you want do to in
>>>> assembly. However, in the specific case here, can't you simply
>>>> have
>>>>
>>>> void __init noreturn start_xen(unsigned long hard_id,
>>>>                                unsigned long dtb_base)
>>>> {
>>>>     ...
>>>>
>>>> and all is going to be fine, without any asm()?
>>> One of the things that I would like to do is to not use an
>>> assembler as
>>> much as possible. And as we have C environment ready after a few
>>> assembly instructions in head.S I thought it would be OK to do it
>>> in C
>>> code somewhere at the start so someone/sonething doesn't alter
>>> register
>>> a0 and a1.
>>
>> Avoiding assembly code where possible if of course appreciated,
>> because
>> generally C code is easier to maintain. But of course this can only
>> be
>> done if things can be expressed correctly. And you need to keep in
>> mind
>> that asm() statements also are assembly code, just lower volume.
>>
> Let's get hard_id and dtb_base in head.S and pass them as arguments of
> start_xen() function as you mentioned before.

Still looks like a misunderstanding to me. Aiui a0 and a1 are the
registers to hold first and second function arguments each. If
firmware places the two values in these two registers, then
start_xen(), with the adjusted declaration, will fit the purpose
without any assembly code.

Jan

