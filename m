Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F5349DDA2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 10:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261348.452409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0ta-0003UP-Dp; Thu, 27 Jan 2022 09:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261348.452409; Thu, 27 Jan 2022 09:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0ta-0003Rd-9i; Thu, 27 Jan 2022 09:16:46 +0000
Received: by outflank-mailman (input) for mailman id 261348;
 Thu, 27 Jan 2022 09:16:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD0tY-0003RX-JO
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 09:16:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d73703d1-7f51-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 10:16:42 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-lCACdx73MJyv1i7cZ5gN2Q-1; Thu, 27 Jan 2022 10:16:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2912.eurprd04.prod.outlook.com (2603:10a6:800:b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 09:16:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:16:39 +0000
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
X-Inumbo-ID: d73703d1-7f51-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643275002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YxU0OcgU/lGGLwYGOCF7NNqFHithPfLCBja9kZHNPM=;
	b=LZ6fQ9vf3A7c/0EPK8HUQdbxCzhgQ4y1vzYJT7xTG3+5jukG1STnQljJ0UVjFTZcigaqeX
	3/Ek/JK16/7gtXaygsx/BNCfmzPWe08kf0J8l85c8KV4sTXFOz/PeWCch0v7eZKL7xQQUS
	iqabWGU+pyO8MDdQPHNa38S2eLPpKuo=
X-MC-Unique: lCACdx73MJyv1i7cZ5gN2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSddCkKhbMns9zWmqaSrcPUFrin5r57xTA+Uk9VJRHuhqaGhhRuybpKdz1rXAaW0jgzYRutq8drUOFhykjsFCbZG5y7ae4rcc/tWC/s5Su/QaTtXC6jYaqEJ8djuMkgQpR/sDN3jMNc98Gg0p2WyHd2lRnKL+tNAjMROVzBiRiVKmjEHH3rSrkwRQCX+1swZkAdX6PNN/RxxzRuvjBTn74PEO+WDw8HJ2NgmI3wu3XSBKJ1d4oLw5a7VWPdjPi+LlamBSF6VFV4tLEuIa32Ili2HbAYKHKubBkAwH1MylFVS7aUUvfTNyLvdSf+CZhs3WBoKkGr4r3umLTJna98c4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgMJcaqGP+p1yHBFYVmlw1ktTEcpgcZXxS6jIjG8JEU=;
 b=PonTF3eUBq6YHGCiX2Q6Q0VTcJCuOlHtXvMhWWMmiMlS2QYhiaGAryksidjluYLdYqdkByZc7Ak3EiYRJSjZO5/4FxgGvHP7Qbednf8MAZtu3S8RmQRFJ7OlZmSjyogbX7+MTup5Lj5xBTfySOhvd6oV6H0BoMYnE+1s9tHLO2TBHI5d93PxDmbi2j3l2TGMq8640K4W3RQtmDltXONlYRgaj4m/PN2LI7U/6kxhN56BXpfKcp+7cyHjuzQVmGN7EB7M+gJRgBifTg96yX0CSmuV4CXgEuKmwT5jeA+4+RS13XV7mJNykPTtWYbZJ+C05olF1oqa36PUHZEV9R/DDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b274899d-55f5-1851-82e6-69898d53e726@suse.com>
Date: Thu, 27 Jan 2022 10:16:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <d80da027-93ac-4819-ef7a-f3fd8592e443@suse.com>
 <PAXPR08MB7420AC9A05A6118642F544BD9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <PAXPR08MB7420252BFA15D032BDDF2F4A9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <e135adab-8b21-8dc0-2518-e505a59feb9f@suse.com>
 <PAXPR08MB7420EF1360C2E1D63D278A1B9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420EF1360C2E1D63D278A1B9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0097.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66bf6be1-bc80-46b3-2c16-08d9e175ba04
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2912:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB29129240F87FD8A4FCC9BE02B3219@VI1PR0402MB2912.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ENHQhhhWP6T+DlqtbYXEAtwokPd/MYpz78kXnNuyLY7Wxd3ewHTOTNfnica5Sg3SbR8lImKZ/IPedphX/5hAIXvO3gf/aUl6ETI9KAjqbC+aQwNebKQ960UzYwITXmRMPlOeIs0cjH/MusruthAtnrR9JTu6Oxc/nKCkCFqSDpRHDwMlLpyzSVnudn31lMtIQUnaCz7hv7xg4VVFcPu9TCwOrX6AMMARxcHm1jcCDKmVu3+qhvVMxa6rFykQLnFP0ABOQPIra803lyLej5xkPHXse/bqSLbq3C9NE0ncFMKFf0GXfpnZsaB/JLHshP9xjs2y0iKt2WyqtMqn0xAyMlJX/ZOl7qwCmPmDGgHhKrj8l6hoCP2Gd/Ex3Qew2MKyBuYbCcHH96A9CxbfRR/POuGNmo9neGpqxxeVlgx5uCI04xEYcOF8hSjcFRDqj2Ka17PqcKbBFVqKQnflIIR7HNNGRhM4Puv+MrmeEQ2EigOdYnmLyAYdn6weEfrk6WaYZFpE3PjLb3nl3sgnH6v8G1XNPo+2dHh0CRLCG4JK+AASbpzJxNFVYuwEiFuduFrdyYbNsEnst5H161tBdn3l0gs4O8CpdrP/lc4h+W/v06QKZ8mH9PX3BBNCUhsvrsEVqJ+LxYq9aa80Z28xS/cbS+FAyz/kMF7k9MZXvUwe8pFtKvTMjWtZABG0GzdD1Zm2H0Q4nHclrWfkmNohnzCTJDuKVB1Y2yPqEJXfzX3XpUHMw0o8GU99AzZVhSoNAhm4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(5660300002)(8936002)(8676002)(31686004)(86362001)(508600001)(36756003)(6486002)(54906003)(316002)(6916009)(83380400001)(38100700002)(53546011)(6512007)(6506007)(2906002)(26005)(31696002)(66946007)(2616005)(186003)(4326008)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ifSc9WJVsJMn+UHr1ifeLr9rHeO96Cjt5IBolU8y0lwjs1sTAU079jwBnSmb?=
 =?us-ascii?Q?1tlXRp+WClgGmPk+aZ11UjSlC1T5rlAnTRS7d2LDRAMKadpP0lsg7Z/aiwC0?=
 =?us-ascii?Q?4zAgG5PccMIzK5pt72/hDANqkC0q5Ibs05pxli1S4jtwKv+0PXA7BXrlJyC4?=
 =?us-ascii?Q?Nv+EJIZw1V2c+dDNMGEAhTzQo9cRZRmnKcUdUkGSHjSrz/ODOXN+P7t8PrIB?=
 =?us-ascii?Q?aPrLGeZbNm01qg7q68OiL3YixI9Fkcq/tEbSmXLdwooFYmzDwqz2e6Okvfxx?=
 =?us-ascii?Q?DTJGjZBFDHmRq1H98gPbKObm0r7mQsFuDf/7KUueZjFZk2ha1j7f/6mUcdkZ?=
 =?us-ascii?Q?2ATYn4E4rl+c/36rbxvu9ETZljUt56tlxocjzka0qMvuncqA5cClxwcL7d5r?=
 =?us-ascii?Q?F9cMrusddZOLNPNmMrOS1XD34XawnB3wuYH5tpCiXR33Q1QXz95+haufwFxN?=
 =?us-ascii?Q?3zjicjyx4deqhCzt1GLvHW9TWSV74MsXstZb52pVGZdJvu9l6QD2J1nmvvm+?=
 =?us-ascii?Q?+u18PtP1NiYZ8ptS2QL1RT0XjIJOUXvCJpyVfIuOARVn+dEnhNI1/hMfm+ec?=
 =?us-ascii?Q?lxv5G7XeOYG9vRTdc0Uo5ajB4+YtBQEeY1ZA9p8+26E/zLgTyX5wvQCUhmvL?=
 =?us-ascii?Q?Eb/IrlcWMcT9wex0jYRzCOommywonSj7GMaYnattvaI+huF30YG/kX1RP7ba?=
 =?us-ascii?Q?f+tY2AALLwzPWz43rgheHS9YVEAgtaHQHPofQCQGfjdeOOlyc2EmGKrycFkq?=
 =?us-ascii?Q?mAemOveS18rSic6rfoou+VONcp+EZlW3A32Bbx3KDpm/Vvlice1wMGrJwNuF?=
 =?us-ascii?Q?DunzFwp0WngN8l44lW3OccCA4MPdoX6wlVdbtg6+odRwaQwoHHKpY1L7F7UK?=
 =?us-ascii?Q?jtxVk/FtpDhtYBVyvaleLhCi+BTN3TzHYBaF4kegt/8aq1rIufYM3hfL2Zln?=
 =?us-ascii?Q?DrzOpqs9hv0SsYciCPG+HistvOwdQYZP5WRsNZcGa8I91V0ZlRd/M/yydh3p?=
 =?us-ascii?Q?0YKWVfJO17xYE2ewnrDbbOcPOjRtEPRtfB5KeCk+jw/QibBa3GZld60Ys3/d?=
 =?us-ascii?Q?wkRkyRqGSbjZyeYsu+8yV+v8doc762bbjkZTx0V9expgpdNa9nM0pS95PGK3?=
 =?us-ascii?Q?2Rakaa1DnLcTGFhnzSZyV6RTtNZWUyucc4AgGwOSIeXOzpc8lhbXlqsW8WUa?=
 =?us-ascii?Q?uA9siIVR0hlnAGP9svVjp5jUmcyoZvG+HhBM5chimdywQyWeLwBW7pf+joV0?=
 =?us-ascii?Q?lVa3ouJvJYOS/17wbawIgwusCMLelL/9pvPQjupIG/cc86gB91iJ62x5xtas?=
 =?us-ascii?Q?7wmXYz4B8QDryN+xXgYW3K+geQzLS80hc8bPPZJ7fFHsVy090Wfc0NhjZdQX?=
 =?us-ascii?Q?Dj/Hsk2Dn1+Lr5Jn5lnv6w1bl8ccyu5Ss5YKzvbzFasGc4th5KUaMVg3EN9L?=
 =?us-ascii?Q?iZvpDa4APSLfZzE/N6U7zNcdKfarN4KZ2M6aJT2m6N9Qu2ZVuLCdaCsl7lfB?=
 =?us-ascii?Q?sfaxeYgcFCfWrMY8uNEj04S0csiRVrCTc6pu7U77iRpzVmPadOc7fMtHtVA4?=
 =?us-ascii?Q?cFAAmZ6MijY2RWvJPSBZbj06x4jy3vlyPuQl6rHy3VygAHaXAaJWuPoV8yKy?=
 =?us-ascii?Q?Cr3b4kD2DCAX+bCmM8CZC7Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bf6be1-bc80-46b3-2c16-08d9e175ba04
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:16:39.9144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRmLYO9KGzgItvgvYgRr1fxWPPkmCAf+YvvB+znpdZBhD60uGit4pm2cMk6xq2ksq8YFHmwPJgJG62ALyPHEJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2912

On 27.01.2022 10:09, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B41=E6=9C=8827=E6=97=A5 17:00
>>
>> On 27.01.2022 09:51, Wei Chen wrote:
>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Wei
>>>> Chen
>>>> Sent: 2022=E5=B9=B41=E6=9C=8827=E6=97=A5 16:45
>>>>
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: 2022=E5=B9=B41=E6=9C=8825=E6=97=A5 18:35
>>>>>
>>>>> On 23.09.2021 14:02, Wei Chen wrote:
>>>>>> --- a/xen/common/Kconfig
>>>>>> +++ b/xen/common/Kconfig
>>>>>> @@ -11,6 +11,16 @@ config COMPAT
>>>>>>  config CORE_PARKING
>>>>>>  	bool
>>>>>>
>>>>>> +config EFI
>>>>>> +	bool
>>>>>> +	---help---
>>>>>> +      This option provides support for runtime services provided
>>>>>> +      by UEFI firmware (such as non-volatile variables, realtime
>>>>>> +      clock, and platform reset). A UEFI stub is also provided to
>>>>>> +      allow the kernel to be booted as an EFI application. This
>>>>>> +      is only useful for kernels that may run on systems that have
>>>>>> +      UEFI firmware.
>>>>>
>>>>> The way enabling of (full) EFI support works on x86, I consider it
>>>>> wrong / misleading to put the option in common code. At the very leas=
t
>>>>> the help text would need to call out the extra dependencies. Plus the
>>>>> help text of course then needs to be generic (i.e. applicable to both
>>>>> Arm and x86). That's notwithstanding the fact that without a prompt
>>>>> the help text won't ever be seen while configuring Xen.
>>>>>
>>>>> Also (nit): Indentation. And please don't use ---help--- anymore in
>>>>> new code.
>>>>>
>>>>
>>>> I have used CONFIG_ARM_EFI to replace this common EFI config in my
>>>> latest version. This Kconfig option has been removed.
>>>> And thanks, I will not use --help-- anymore.
>>>>
>>>>>> --- a/xen/include/xen/efi.h
>>>>>> +++ b/xen/include/xen/efi.h
>>>>>> @@ -25,6 +25,8 @@ extern struct efi efi;
>>>>>>
>>>>>>  #ifndef __ASSEMBLY__
>>>>>>
>>>>>> +#ifdef CONFIG_EFI
>>>>>> +
>>>>>>  union xenpf_efi_info;
>>>>>>  union compat_pf_efi_info;
>>>>>>
>>>>>> @@ -45,6 +47,8 @@ int efi_runtime_call(struct xenpf_efi_runtime_call
>>>> *);
>>>>>>  int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *);
>>>>>>  int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *);
>>>>>>
>>>>>> +#endif /* CONFIG_EFI*/
>>>>>
>>>>> I can see that in the later patch, when introducing inline stubs,
>>>>> you would need conditionals here, but I don't think you need them
>>>>> right here (or you may want to introduce the stubs right away).
>>>>>
>>>>> Also (nit): Missing blank in the comment.
>>>
>>> I am sorry, I had missed this comment. In my latest changes,
>>> I have introduced a stub file for non-EFI architectures.
>>> The reason why we don't use a macro to stub the helpers
>>> in efi.h is that, some architectures have implemented stub
>>> helpers in their stub.c. If we define stub helpers in
>>> efi.h, this will cause function redefinition error. We need
>>> to fix this error for all architectures. And some helpers
>>> is not easy to implement as a inline function in efi.h.
>>> So we use stub file instead of stubing in efi.h
>>
>> But you realize we already have such a stub file on x86?
>>
>=20
> Yes, we found the redefinition errors that are caused by x86 stub file
> and new macros in stub.h. We had tries to add:
> ifeq ($(XEN_BUILD_EFI),y)
> CFLAGS-y +=3D -DXEN_BUILD_EFI
> XEN_CFLAGS +=3D -DXEN_BUILD_EFI
> endif
> x86/Makefile to gate these new macros, but it seems that we may need
> to change EFI build logic for x86. It will cause more risks for me.
> So I want to introduce a similar stub.c in arch/arm.

While that's perhaps fine, ideally common bits would be common. Iirc
already back at the time I was wondering why stub.c had to be x86-
only.

Jan


