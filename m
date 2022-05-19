Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8967252CBD1
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 08:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332684.556420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrZNu-0007FH-KC; Thu, 19 May 2022 06:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332684.556420; Thu, 19 May 2022 06:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrZNu-0007Ca-GV; Thu, 19 May 2022 06:11:42 +0000
Received: by outflank-mailman (input) for mailman id 332684;
 Thu, 19 May 2022 06:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrZNt-0007CU-IR
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 06:11:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8be2db0a-d73a-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 08:11:39 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-EtcjoTyPMx2aMJ2XParChw-1; Thu, 19 May 2022 08:11:38 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4337.eurprd04.prod.outlook.com (2603:10a6:208:62::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 06:11:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 06:11:35 +0000
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
X-Inumbo-ID: 8be2db0a-d73a-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652940699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cd4Ah2Scrigf4LFW8YJUKbewQGKuVS2B66rI6GYXFGE=;
	b=jEQrxNHcWuB8O+5AuGoKL57Vi4LmvZNWq8ymeMYYupJOK9FBLgIFXEIrkpjLobiNbRxjB8
	iCLs2ax+IT7U0YnUKefcauTUS6eD7TLbcltisX0F3t5t9nL4SaWEuz88trAS6PjzAyb9jx
	9SZS4fFj6AHIqIH+LRGFuDp8GVIC5H4=
X-MC-Unique: EtcjoTyPMx2aMJ2XParChw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRClkG9ZGoDsvIlJ92oIznEFJytMI51GbDQWreZqoVYP7B9+SixAA0Fi+r3JV5/34xH7meqfPoyj3/jSkPyjBwmaWmD0MofXuq409vfgjbi3P1kvQHhUq+GNULhemoex8xvMPJztsnSrKQev+PzbFpN/RXihxGZZGhP8Bt1b0xsKNLv7L1rYBsBN84QI1pEjWjc+/qcqc0tYEwjbbxePUXxnmEWuAeRvwaHN3pMeVjVN2aiDyI8vCqMzgdK/KrBCNvnhxnj12+MN3f5TkWYZz9pDT2feIaGXNo3ukSuJz1J2EvStwHlgpypjh7d5mROmSGIXs1sn+QpizJpx308lXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9g4H5kUoLSt+qDobNssArVwpovkB4TocAvlBiAehkU=;
 b=Cz9nvzmmCToFqTFJZqLdB3ghkJSh5tQOg8ODGSgVlNro1CU2nRBZ2qsv6T7E8wsJDYZBZe0BBOonFEzEhATl+FGhk8YStDxcLt5cn4QJhiKbbT+XtCBADzwoHKupyv1uZY+rsUnfiE6Yd+NcuZQG2SCELnjq9vsDVR5ceq+E5CqBFGlIsO8i99HnJ0VWngXbBTWPhM93rc20LwXPCMW4a32Ak5Kaar0peojPxbhP3sjPX+5ZV2qW53I541RHZ+tAutVt0FoDEC4MTi2O5cDg38/ERAvwhbGXC2xcmxoakNQTTInHY/gzVrKI5i1djh4prBwlrM41TpBlDozKo5at/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5af0fe8b-12fe-f7dc-0fa4-20c5e395c268@suse.com>
Date: Thu, 19 May 2022 08:11:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/9] xen: reuse x86 EFI stub functions for Arm
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-3-wei.chen@arm.com>
 <9b04ca55-f617-dc14-cbf0-a3e427ad5869@suse.com>
 <PAXPR08MB7420C70C703B1C006A3403EE9ED09@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420C70C703B1C006A3403EE9ED09@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51e4e16a-c9ce-4405-c99c-08da395e6db8
X-MS-TrafficTypeDiagnostic: AM0PR04MB4337:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB433759DED7C19D537C99DF3EB3D09@AM0PR04MB4337.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IwPZrvJPz4PowQWDHeS0T1+FsXv77t6f3/ac0d0skFkr9vxXyqeweiaqxWbMFsJZqQO0mkSi2mkQyKzrvtLLsYcWJm2NsmQKD/MC5tYK7xYVXpjfulvTC7pu8YFXz+dHYT6OqOEYwY3eJ6ahhVw+b+4zklc2bnNIJW8mz6CptYcBUiC/7KCuJD2bRtV/TC+tQsA+NY6e7sESKLHjjjLVdiVWBKAvAP1d0+kstVj3QnMC45287PkjheVhEhjgd4tR1xwfuYjtD15eafoGkqOtSld5qYwNZsR59Ki7lQJF119koOueRO5MnP6iTQJOn5uY7fsi6QG6HbcMehlsD72Cu2Fw0+tzsHj6B6gv1WZqCD4F66oKpkLgxfcaEPWoD2IdU/2Mbs73RomZBtP1N9wtKZ55G6P9uGroBmWj8jHNkria07b8guA4vTB/4k0xZm74FTxZtNp1sMEM38PvLggFaGpvxR+nlamq9FU4g6XShS5Ouw+rxtIdj9GT8u58/2mBPEefnbpPwdFhLSBKXeUBOB/a3WICEvn8n1CBsUPTiwUxvNe6yXLMXCmg9schSZhx+/JBMJsLPRDITWdVscJGqsZHZX9O/asDRy/FI0tlsQxUzhbXENc1m6z0BYBqd6fwwtSZjLDXgQS23bPf80H/sNn2H83ux66ny9QDmM7O9PvsR8Iyw8ZjWCmzU0+EAWOBE5mFo6GUIQMSGlqlY2ewgU8wBW2RId7kjCm9H2FlEB+VZJgnUh5Jg/16ydQccfwR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(8676002)(6916009)(54906003)(66946007)(86362001)(66556008)(8936002)(31696002)(316002)(2616005)(4326008)(53546011)(6512007)(6506007)(6486002)(38100700002)(508600001)(31686004)(2906002)(83380400001)(36756003)(186003)(7416002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xP2vKrkypfRqrUjJusWO5aVgl1Vtej3T1diBG4iQLj4QTrKSuziuKqaqnoMq?=
 =?us-ascii?Q?zXn8Fq4SEmmCkynE0xgPLVwccxhdcri6tG5r/ID1rVRhfCuW1w1ku59T45/x?=
 =?us-ascii?Q?SXAZUjSwPjzkvvJudMmxm/xBHLdL9yi76NDrZJzvW9+sz5B3XPNDsYGmqE45?=
 =?us-ascii?Q?Le8XIql4X07RY9QsbIRIzxE5A8kv5bb4mj7EwLM/IaBvb9ecNAw0mMWlHnzi?=
 =?us-ascii?Q?CW8z3QO2ixmV9af7lAmVOCP1PO07FVBh1DPIVbsmQ7JsdR9LP0j+HueeGXgT?=
 =?us-ascii?Q?afO+fKGrze49pT8ll/etgy8QglFYWe7dKXRcj4rEnaLFVBsD+kBukX6N/Hpm?=
 =?us-ascii?Q?B7vvTq/H+RnnNcDcRY4xz3PSqn6QHn7Znk2irSz83X+haQtgrzD4hWuvuqJS?=
 =?us-ascii?Q?V/RVmH+kfmYCLdkSp//oYFVR3xDHVBq0DwtzWb3kKcvyNC14IBWIAraVu2j7?=
 =?us-ascii?Q?iuVD0f2DrZ0F+YUApOmsqC5zWYvkT9Ysj0+auxV8wi8nPuZ0unOuud6lRYLZ?=
 =?us-ascii?Q?eehtnCmbAiQUsTdxhVKBjFOR8oaL6hji8j1KIavY1unYQEuC7RBjmhKXpcKv?=
 =?us-ascii?Q?f+JL27QHBAhkxyrZXS+9MzJvZdZxmdC+yAv3Ur2yQh+zvugLTUjukCvNs292?=
 =?us-ascii?Q?cFzWk0xiEG/fRlDguCyGgUcXKlOehgIn4KkTHcdYza9CQ/4TkKjUpzC/bJpY?=
 =?us-ascii?Q?dG2GPtyvI5BLBxOcwqCc4RdwHXiu3s+WSJMCxzn/6wfI7PO2aaSjVzSzwqWX?=
 =?us-ascii?Q?qzJcdKCNiTiT3ju1A4dhu74mzZebUgOelEIB8Tv/DcV48IDUdY0MoOz1U7WJ?=
 =?us-ascii?Q?001PzlzlhTsmrOWMjbsynvW3kmB+sDC0wehxlWxl3j1sXO0tf5nNVVrd/xBf?=
 =?us-ascii?Q?eRJmqap+sApxyUzfD6sTHxkMmj3Dp6ia2dEmrqnRotsLwnhVzHe010+O6xDk?=
 =?us-ascii?Q?MCQIoXm7FoPF2LtQ1Om99L0Y7D+6ucbBRNDxhZE3d627v7CATcCjnMTsrNoI?=
 =?us-ascii?Q?HGXJu42YmnoFWFLPFRlZol/HtGD7JlMhQvXsQT93DkAqlJ0yIBG2V/IJAsL/?=
 =?us-ascii?Q?oqfm7ndatwusMQ69uXkKoe2tvRQDzS8nhwSMzFz2eJM0mteSLULR/byMTjaG?=
 =?us-ascii?Q?FOPRLbXATEXm++DMBdzMLgOEJr6XxYMJEbvwIkN4TR2Y6Jp3BFAGFaZZb35Z?=
 =?us-ascii?Q?c5Sf//YhXM+HMGX4Ok9QAbLG8hUiXviki8GD8QtTiv14K2IwnSwK28/M4ib5?=
 =?us-ascii?Q?a0hURcoesqUePTslPV1NonZR5cYFgVLZRly5Mc1EwGD70/Msjt1PTFSDZcBs?=
 =?us-ascii?Q?rpM14/rSgzsk2Ge2PN+Qul9piln0C0ZTDjqBh5sYYOGh0aNFp9Y7Y1OvGcPN?=
 =?us-ascii?Q?2ScPxui2Au9fdjiXjzCes2aeDWctWiVHxTBaeRAz2wxgsm7UPIEfsHA9J9PP?=
 =?us-ascii?Q?x1DGuFedeZxvKyJg5TMpfWNlrRvnPHMoSfau96wzfg2SbYM7/epdbtk3zaA3?=
 =?us-ascii?Q?/hvNxQ80UBsQWA+0QDZ+UllimEdMmZseLFFaLOdwSPTNX3JYHKkiD0dJ6HE8?=
 =?us-ascii?Q?bNW8XLFEOojlVxVzCQDU79s62GMeJChuksgcf9aLpNUWkFFo26wtswFwMWep?=
 =?us-ascii?Q?EeWLva9DgHpu7W7o0x640jFawog0KLRMQv4QQCB2v/1ArcEvZLTch1h1vEME?=
 =?us-ascii?Q?mcFpx070DcWGuG7gp66dxzG4pbRWkGyy2tw17b7tgdBgSKFylZyVbrWzt4P1?=
 =?us-ascii?Q?XoGKoZOGY9W0C3JyoC+7Jq9MQQYqEnQxvlrbpg9uMbMkYqNw4rWKStd7Vbq4?=
X-MS-Exchange-AntiSpam-MessageData-1: QZ+RC9Ve+PnN+Q==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e4e16a-c9ce-4405-c99c-08da395e6db8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 06:11:35.8757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+Lb2pMJOnj9/AoPIdIbJ3VzBGLNZQTwT3Jm5m4yHO0cvqd6OLczDwFAk2msFdZKcKmWSOhpY+PSRwZfWJzJcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4337

On 19.05.2022 04:36, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B45=E6=9C=8818=E6=97=A5 21:05
>>
>> On 11.05.2022 03:46, Wei Chen wrote:
>>> x86 is using compiler feature testing to decide EFI build
>>> enable or not. When EFI build is disabled, x86 will use an
>>> efi/stub.c file to replace efi/runtime.c for build objects.
>>> Following this idea, we introduce a stub file for Arm, but
>>> use CONFIG_ARM_EFI to decide EFI build enable or not.
>>>
>>> And the most functions in x86 EFI stub.c can be reused for
>>> other architectures, like Arm. So we move them to common
>>> and keep the x86 specific function in x86/efi/stub.c.
>>>
>>> To avoid the symbol link conflict error when linking common
>>> stub files to x86/efi. We add a regular file check in efi
>>> stub files' link script. Depends on this check we can bypass
>>> the link behaviors for existed stub files in x86/efi.
>>>
>>> As there is no Arm specific EFI stub function for Arm in
>>> current stage, Arm still can use the existed symbol link
>>> method for EFI stub files.
>>
>> Wouldn't it be better to mandate that every arch has its stub.c,
>> and in the Arm one all you'd do (for now) is #include the common
>> one? (But see also below.)
>>
>=20
> Personally, I don't like to include a C file into another C file.
> But I am OK as long as the Arm maintainers agree.
> @Stefano Stabellini @Bertrand Marquis @Julien Grall

Well - an alternative is to follow the boot.c model: Have a per-arch
stub.h which the common stub.c includes.

>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -1,6 +1,5 @@
>>>  obj-$(CONFIG_ARM_32) +=3D arm32/
>>>  obj-$(CONFIG_ARM_64) +=3D arm64/
>>> -obj-$(CONFIG_ARM_64) +=3D efi/
>>>  obj-$(CONFIG_ACPI) +=3D acpi/
>>>  obj-$(CONFIG_HAS_PCI) +=3D pci/
>>>  ifneq ($(CONFIG_NO_PLAT),y)
>>> @@ -20,6 +19,7 @@ obj-y +=3D domain.o
>>>  obj-y +=3D domain_build.init.o
>>>  obj-y +=3D domctl.o
>>>  obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
>>> +obj-y +=3D efi/
>>>  obj-y +=3D gic.o
>>>  obj-y +=3D gic-v2.o
>>>  obj-$(CONFIG_GICV3) +=3D gic-v3.o
>>> diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
>>> index 4313c39066..dffe72e589 100644
>>> --- a/xen/arch/arm/efi/Makefile
>>> +++ b/xen/arch/arm/efi/Makefile
>>> @@ -1,4 +1,12 @@
>>>  include $(srctree)/common/efi/efi-common.mk
>>>
>>> +ifeq ($(CONFIG_ARM_EFI),y)
>>>  obj-y +=3D $(EFIOBJ-y)
>>>  obj-$(CONFIG_ACPI) +=3D  efi-dom0.init.o
>>> +else
>>> +# Add stub.o to EFIOBJ-y to re-use the clean-files in
>>> +# efi-common.mk. Otherwise the link of stub.c in arm/efi
>>> +# will not be cleaned in "make clean".
>>> +EFIOBJ-y +=3D stub.o
>>> +obj-y +=3D stub.o
>>> +endif
>>
>> I realize Stefano indicated he's happy with the Arm side, but I still
>> wonder: What use is the stub on Arm32? Even further - once you have a
>> config option (rather than x86'es build-time check plus x86'es dual-
>> purposing of all object files), why do you need a stub in the first
>> place? You ought to be able to deal with things via inline functions
>> and macros, I would think.
>>
>=20
> We will use efi_enabled() on some common codes of Arm. In the last
> version, I had used static inline function, but that will need an
> CONFIG_EFI in xen/efi.h to gate the definitions of EFI functions,
> otherwise we just can implement the efi_enabled in non-static-inline
> way. Or use another name to wrapper efi_enabled. (patch#20, 21)
> But as x86 has its own way to decide EFI build or not, the CONFIG_EFI
> has been rejected. In this case, we use CONFIG_ARM_EFI for Arm itself.
>=20
> For CONFIG_ARM_EFI, it's impossible to be used in xen/efi.h to gate
> definitions. So if I want to use macros or static-inline functions,
> I need to use #ifdef CONFIG_ARM_EFI in everywhere to gate xen/efi.h.
> Or use another header file to warpper xen/efi.h.

Actually I wouldn't mind CONFIG_EFI - eventually we may want to make
this a use-visible option even on x86. Sooner or later (I hope) we're
going to bump the tool chain base line requirements, at which point
the build time check on x86 can at least partly go away. Plus there
we support EFI in two different ways, and CONFIG_EFI would hence have
a meaning even when the build time check fails. The one thing that I
wouldn't view as reasonable is a prompt-less EFI option, which x86
would (not entirely correctly) select unconditionally.

Jan


