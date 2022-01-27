Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C215949DD26
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 10:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261338.452376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0do-0000gS-C5; Thu, 27 Jan 2022 09:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261338.452376; Thu, 27 Jan 2022 09:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0do-0000dj-8H; Thu, 27 Jan 2022 09:00:28 +0000
Received: by outflank-mailman (input) for mailman id 261338;
 Thu, 27 Jan 2022 09:00:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD0dm-0000dZ-OJ
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 09:00:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 911384db-7f4f-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 10:00:25 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-xLWrtmrtP4ClcuHClL55IA-1; Thu, 27 Jan 2022 10:00:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7927.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 09:00:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:00:22 +0000
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
X-Inumbo-ID: 911384db-7f4f-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643274025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hs+IudkRE3ZhGjPesnaM8Q1PklM/3LqGyy1dtIpPTlE=;
	b=i+TfcrwiwXKNLl41uyLOnI5VEhkXcmVCLtsIADMtumK2M6Q+0+ZJJuKrJFnHn9EMyZoQxV
	Lt8FoDhm1FHH3Hs/9LPz4+k42jnS52ol3jwHqOeQ3kfZDE9aYutG8iBzqpWQonvHgmX251
	8SeKkYjMhgehksOnnQTPHOLnzFOaKAE=
X-MC-Unique: xLWrtmrtP4ClcuHClL55IA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WH8/OFKsj9nFCU/LcEELPzF6fiInaUp7JvG9kPqlTJUdSRe5mvf2gjKrSFt1J3a4xQUpOjQ8ieL15PzclAZSv1a77CbQObiwH49z0ADysD4ovrZe/eW4uGhhabwoMYw2FSyrn/4GQuOtMNIHlD//ViVx2WSoucj/EcnK5aSzviARzhpHG2t6GFO+rgmImGRZXjUpswadrCag9s+y7MxqaRWNuz7UtZL7djm6abYbKgW7/f00+hP8/Fz6W4wp31t9AZV1Onk8ZNGUR/BC9uQfiYSImagmMF+p6beB9oLaYGzEthIiRqy+YFeU/LYi2iMDVny8SPorDc+wRU9GTgRWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bc47LZ5+tio6nYxO3krvRwGGgmj6HFki2jn66dewA3I=;
 b=RzVKEhr98wOPrRKDJjnptFj5dJeLuGl9vPiIaSkKS+hqgsBQ8zqHDZZ3oTjkT2tHO+r6FNf+0tDGYpchcvcngnOEkP5tPJENdRYrzjaGTUXsvdNhT9YwwEH6u8AijgrABAA7ZDdGOO7E7/ZEvbO3+7g2cfzo1ycBlPdG6Gh1QqrndRhJVkjnEASEHhZmc9U8J2aWfVhHEL+rS/80ToBzuejysOEH0bAOARDkh4MXu5eWSEEDxOS1TRJhvhv5B2L5QUItz5wjf56tNE14O9wwFZCLIzto5P6bw8Mt0Jd3Qdf03VNW5WQ+E7aXEuMuVMIvb1yy9QpUkZMo56i7gnrpkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e135adab-8b21-8dc0-2518-e505a59feb9f@suse.com>
Date: Thu, 27 Jan 2022 10:00:20 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420252BFA15D032BDDF2F4A9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0316.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12c4e174-7d75-4547-b684-08d9e1737357
X-MS-TrafficTypeDiagnostic: AS8PR04MB7927:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB79271D16937212EEDA11DE28B3219@AS8PR04MB7927.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U3rdtsIGAJiePmYSReMzV1gcvSSh2Bsj3PKwjhHOxBWD1XyYc44TRJwF7Bx1CM4aX1UmIVS/vmEyASW7HVQcjfLv9UKDNxWG64LZWU4tyyj6n+kg5cUAKPXJwwx9qxnJDWJ1B+22RoO2M86UKSLpUq5oafHjnrzFp5/x5rPym1erdDlSTjzriSbwYk0m5BlO4YXNMLZNwgEPFNKVjGg4YqoH5ZONhE1GP8o6V1sxhQ1DnWMju3Qv617Md63JDDo+nHS3S1diFPjAmmL7qW8HxFDVCto3GSg04wzL3jYlD8/tEPqgLi6FB7VJVoJc5YaIap/s7l3x+bPJVOj+F61y1Re5/jxM18D2k2+igQtwEOBQRjAmxxqv3gYjUpw8Ks/geXnkOnP6jq8u0RYKdcQImtUoU7sgi4xxfP13SuNi4bJ+9gOn5IQju6zuRIoEWiCM1xsZeeYTlEpVyIHnIJxH9EM7CXivVSAYnywhZKQkwLSn+fXXZuO6DuUxYf+Eeh+7ovZBGsnPobNVgsAbiAQrdTVTOv/JZ1cj/Sb8irPdrcUKQ3eti1XSvCyfhkp1dkWZkbAkYhgNAQrSEAkUHB4rmZrGbnL4Ma62LE8xYapWskYSk7HP0m68yk1+njD+S/H10mdRMIbANkzX764oex0+HIZS9tymtQWsxJioEWhITX658Z0X8TO0yrB0Vc5uMdED1fpXYCWunse1RnR0Bd1dma/ghPQUnhZNoSzKvrb/hsBAkIeS09qWyPMHRH6OWTrD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(5660300002)(83380400001)(53546011)(2906002)(6506007)(26005)(2616005)(6486002)(31686004)(36756003)(54906003)(186003)(86362001)(6916009)(508600001)(6512007)(316002)(31696002)(38100700002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A3wJnCBPM875Fz5Rx0qeZ41LLk8k8VTWxBlt5uR1dcdkcxsb3GXBM0P6aLzf?=
 =?us-ascii?Q?AcAwikmAPpLOfUbnEwBt37YqEE27SaRd0rmBwKGqZWHHWsYnjxLVzZjgBFgi?=
 =?us-ascii?Q?JR7oOESyFf4q45HYADr7D/xLZmPMAz9swtG4RgASkO5LjVgCJbP/tmYKUtbS?=
 =?us-ascii?Q?H41oZVrT9m3jx3f9XXks9Bhx0yqujs+mQ+YmljBxCzeqjyyfrQ29MxEVLr52?=
 =?us-ascii?Q?VOqWqYT3/VyDD4VUc0AhiuZVk6L6KIIcIRZohBP8YNKardiqFqgbhw14FKBe?=
 =?us-ascii?Q?Q1h3oWU5BegSuHXF2iwb+fiJYRa6LVhN8C3OTFRaHiSQnYfvuMBjN/AVRcg3?=
 =?us-ascii?Q?JOdTohYXRGRfClr0u+5ScRZq4hyrx9SQ8VD7iiY3JFncQxVLsbLZ16hlV0st?=
 =?us-ascii?Q?FFZwkK8YF/Gn2zqz3u+UTsgbLXlFjcHZ2b3WPKZqtwwTTnVOSreUuxOQ4qwZ?=
 =?us-ascii?Q?rIfcOeUXGRZcxqnLo24kKiGomkhR0VwhTWaYkWf/31pzIhl0NUwsRt0H19lu?=
 =?us-ascii?Q?g+3adwvJ5e4a+hiV6HVJKV5UYDVmls7uMD95jwhx9d9Y4bSo6qcFvXrIjP8X?=
 =?us-ascii?Q?T0q1iKuOoYKFHpUupvPcaT2l1oxanb2aun3l1yhcjNb2s0e/FmBxz+VfUoZW?=
 =?us-ascii?Q?lN3/D6UjWPk1BLaz9BRGgOba5aSpQR1mUSGcZZaxZBpcBofNoXq+skA6xxAz?=
 =?us-ascii?Q?ScY0KY0LVkO+jfDr2gHH8tWCzvFryUeLbnTGKzlOyvJjQtX11gCK+J+VvHkG?=
 =?us-ascii?Q?692a6egnd0Nbj4+tGWQHY8A9sWcppNqrJkyutCSK0wNnGJDays6W7Sb4XIPs?=
 =?us-ascii?Q?c2zTew0T7Nw17WGKOIT2YCxIOQED6VgPJ4dWNNWNMlm3AW5Axrtx6mnXLET+?=
 =?us-ascii?Q?I0tdxPz/6I1ifi+X8vLrZUETk90QdAb1QIVRRgMgdlTGi4srWR2dbXhyNA7E?=
 =?us-ascii?Q?mko/4xY5Ztg5odhTdN9yp8yrE5n0+2SzY0Ma6qFjtd09b4SzSVj7AVPWJgt7?=
 =?us-ascii?Q?jwlvDF2MkSTeCn59bP2JA6Tir+6HtaE0yTle1W5kigJ+DWzXSUsI7D/Og5Dw?=
 =?us-ascii?Q?u2Eyjm5uhbtSofG6DyRRUAa+UzRxcydSe3189w/umZ0Bu7SfOX/3LQuuqDOw?=
 =?us-ascii?Q?n/kzx0vRWSOAozOSNuN5kPqTYSY1EX9zHEhZq1own4Yd73kaUkedU2ttTchX?=
 =?us-ascii?Q?5EkxI/aL2AX8nURsDhZKMbz2b0gJAJHwYL9R5jrFy8z7Y6kmMlWmGcaDlpPV?=
 =?us-ascii?Q?DsS/KtJ67ep6Tk7C1CnePWUXu7sbDmCRg20Q2z1vuEue3rbQ4iI5eVKU0DZe?=
 =?us-ascii?Q?GFLgCWthkdjqWGoiYAIcWZmti2cwLMfzVBG19Ms4T2LCxpcqDlI/l5eempbY?=
 =?us-ascii?Q?ZVk6DX/8lxDnHZhW5MmQXe0rYyDCGqvCVcyp4n0bsphKROUILfWtxyqmNdaL?=
 =?us-ascii?Q?DSt67cd3J5NTuBnaDS+0vld3fpwYOC7Q684fM1ZI/XB/1pljoeTbLg6Cr2P+?=
 =?us-ascii?Q?k70cpUGDihhEDPGH16qaEQdEvJ4No3GQPhCO01Zh0kt3ekaW8r/J63FNinDP?=
 =?us-ascii?Q?nh6pKw6rVibaNhTmbCqSliRBpOtXNu20YlDpQPjPBpaWuKgJwV0nUtJkd1PP?=
 =?us-ascii?Q?jUIpJuVUwVFQQEG2K9jm5LY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c4e174-7d75-4547-b684-08d9e1737357
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:00:22.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwdM2aXInySBnuxsXkkPWBpC+QVhIIGMcaq0COnKDyuwVUhqaIljGMZSpeiJmD6d6zeytAD4VLjB8zNKvAeoLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7927

On 27.01.2022 09:51, Wei Chen wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of We=
i
>> Chen
>> Sent: 2022=E5=B9=B41=E6=9C=8827=E6=97=A5 16:45
>>
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 2022=E5=B9=B41=E6=9C=8825=E6=97=A5 18:35
>>>
>>> On 23.09.2021 14:02, Wei Chen wrote:
>>>> --- a/xen/common/Kconfig
>>>> +++ b/xen/common/Kconfig
>>>> @@ -11,6 +11,16 @@ config COMPAT
>>>>  config CORE_PARKING
>>>>  	bool
>>>>
>>>> +config EFI
>>>> +	bool
>>>> +	---help---
>>>> +      This option provides support for runtime services provided
>>>> +      by UEFI firmware (such as non-volatile variables, realtime
>>>> +      clock, and platform reset). A UEFI stub is also provided to
>>>> +      allow the kernel to be booted as an EFI application. This
>>>> +      is only useful for kernels that may run on systems that have
>>>> +      UEFI firmware.
>>>
>>> The way enabling of (full) EFI support works on x86, I consider it
>>> wrong / misleading to put the option in common code. At the very least
>>> the help text would need to call out the extra dependencies. Plus the
>>> help text of course then needs to be generic (i.e. applicable to both
>>> Arm and x86). That's notwithstanding the fact that without a prompt
>>> the help text won't ever be seen while configuring Xen.
>>>
>>> Also (nit): Indentation. And please don't use ---help--- anymore in
>>> new code.
>>>
>>
>> I have used CONFIG_ARM_EFI to replace this common EFI config in my
>> latest version. This Kconfig option has been removed.
>> And thanks, I will not use --help-- anymore.
>>
>>>> --- a/xen/include/xen/efi.h
>>>> +++ b/xen/include/xen/efi.h
>>>> @@ -25,6 +25,8 @@ extern struct efi efi;
>>>>
>>>>  #ifndef __ASSEMBLY__
>>>>
>>>> +#ifdef CONFIG_EFI
>>>> +
>>>>  union xenpf_efi_info;
>>>>  union compat_pf_efi_info;
>>>>
>>>> @@ -45,6 +47,8 @@ int efi_runtime_call(struct xenpf_efi_runtime_call
>> *);
>>>>  int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *);
>>>>  int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *);
>>>>
>>>> +#endif /* CONFIG_EFI*/
>>>
>>> I can see that in the later patch, when introducing inline stubs,
>>> you would need conditionals here, but I don't think you need them
>>> right here (or you may want to introduce the stubs right away).
>>>
>>> Also (nit): Missing blank in the comment.
>=20
> I am sorry, I had missed this comment. In my latest changes,
> I have introduced a stub file for non-EFI architectures.
> The reason why we don't use a macro to stub the helpers
> in efi.h is that, some architectures have implemented stub
> helpers in their stub.c. If we define stub helpers in
> efi.h, this will cause function redefinition error. We need
> to fix this error for all architectures. And some helpers
> is not easy to implement as a inline function in efi.h.
> So we use stub file instead of stubing in efi.h

But you realize we already have such a stub file on x86?

Jan


