Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B00B52E4D8
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 08:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333501.557338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrvuU-0007c3-Mj; Fri, 20 May 2022 06:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333501.557338; Fri, 20 May 2022 06:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrvuU-0007Zp-K0; Fri, 20 May 2022 06:14:50 +0000
Received: by outflank-mailman (input) for mailman id 333501;
 Fri, 20 May 2022 06:14:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrvuT-0007Zh-57
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 06:14:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2633492e-d804-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 08:14:47 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2176.outbound.protection.outlook.com [104.47.51.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-kbXw-wdRNLSqJJ1_LYgLlg-1; Fri, 20 May 2022 08:14:46 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4984.eurprd04.prod.outlook.com (2603:10a6:20b:7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 06:14:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 06:14:45 +0000
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
X-Inumbo-ID: 2633492e-d804-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653027287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lm9r80XAjw+zFjEQ3Obx4Nqk6FGu/MOVjmR5iQ3sb/Y=;
	b=C4aJyWBZW8scAJAJ/aKXuEpL3nz51tUMt9swzY9eYGq0xdkBiExRLp7y5k64r7NiyAwvNX
	lTcgGlfYAd1oZX7Bizv2VFLEhKcMMmnZGccsIKPS93NNzxOdSyeUFeuqBMFsWP87vZuHyq
	MM7OG6TPKSmeoYdGCzwOFXq1xwfDU9E=
X-MC-Unique: kbXw-wdRNLSqJJ1_LYgLlg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiq9Q3a5V67B62hOUi+xhhlvgepLZr0XyAT+aFDpH8j/w/DyBtsYxJGwT2y6zi4yb+OUS1oZoqBJ7Yst4D19mrB2GQYO104IWT6pqk1oVIBZbDPQDuD+IzU3cpXZqgPaSwjg1ErjGa5vqdsBh4AC7AjblylWZIB/Sra7AxQe+daV3j6KBWRejJgS1gFTVD9l5aeTS2GBRzteMGHXTeL6IGA4alBJDATJcuEhFxGP9ckltY51bhX8i9iNy5g93VbaQsIz+MAg/agMsA5vQPUR/7Lx3uG4XYhCv5vPD4reikY8W3UNH2tJamdDaD6juIgddJk+QrxSpR1egB3+ryx7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8X2aNgt1CsGcGvfrF170fWe+Xr2h091MkLh4PLn4cc=;
 b=l0v0Jh58MPcRJw6ol0BmwsojmmG8b0rKPS76Qkop5JKdzsGR6Dj1ZSx45Dqld3581wy7cVR5Ek7RqnVrCfCUuL3tV5glHZUzdNIFTpFVr94J+VFSEOslOcjowtkPmTxhrSq/EwTbDZ3n9cxKFyCnb6NN4IIskE9VqQtmSVi8wh65BfllR1mLkWYqrhSGHeTSkLdUV/2yJYnWOzaXtscnR2npl/9l3TWgT2UJr3T7+C+z2Vp/aVVO4MX32GNiuOWJVSud3sf7eCoMZEFNOPvitI32CiPMXKeZEwgEV6ch9KEgGsybDsZcu6blRtEJ2VbJTDUh02UhZYpI/Wu33shFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0638eb7-d27b-9b25-c3ba-08aef6f74a84@suse.com>
Date: Fri, 20 May 2022 08:14:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <YoUtuDhVimlP7r8F@itl-email>
 <2add184c-04a5-3ca0-876d-e354f35df62a@suse.com> <YoZYI9ZJzkd4WqFf@itl-email>
 <05d4fa5b-78d6-96e6-b643-a98d26ec954f@suse.com> <YoZdogi8RZHV2GML@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoZdogi8RZHV2GML@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR04CA0003.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b953695-d1ef-4cd2-3144-08da3a280905
X-MS-TrafficTypeDiagnostic: AM6PR04MB4984:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4984A2F4A3961B8FD25E4238B3D39@AM6PR04MB4984.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j32+LkI79RjQhUE0Ug75FoTAPJf0fEIs2dXW06B1o/uONdOwy8YM4KzPrUWdCZT85pFBNg3wfreapXF1BSe8Drs6tqkazLjeoDlbON4CWoSZoXMUZLq9HBiBhj0nVFXxVU7x5bOvOe33UIwZ9tFUtL/7PZt6O4ec04wt7+kgsC/787pJTChvc3RH5nEZTZz390+CX/uhJuUtBQ+AJpidCY2SRaPawvWvXOJzANXG3rIA1h5D9E2tbUS2Ee5TTE8y9HLcv7xuoGPKBBhazZ2i66+Ao+MUsTCJp5kxZI+4cEBAEED52ejPYrlPFWLLz9dLtl2ry+WOjmgPYzQqZGsvOazK4J/aeVrZbl59aEVBler8BvmUmqvoQMB0QsT7WO+BwBhZrYSzpke5LUyEZgF4XtvyTK8zYqkm7oyjvKQFrezZvPpYbh9FWR7GPJBymlrVKEa9Q8B+L99iOrhrRxxHbdwU2hVtP7ClzVvR5sZLJUEuuUpdQ41ehmjgl/shGA4qwSAEGgTPp/srQe/JV6M236Gba/jz/Nk1ySE5oH+hlwz8Zz1VnRY+qZjmdg8ug19658qDsMOtRigiY9vnhMqH2LvE+to2PrXQ5O5rYu243MUTNe0rnecDQMHSufaOlpVOBDDhJX96rP49pAepBSrxgv/RIh23RBByjywOXkT9Zl8G85Zyj/UUbyY9Tlwi+QHZTCf74BqPgQtZlxX+c8miZh9BiJSroKw0HQ92bWqSf84=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(66476007)(8936002)(5660300002)(6486002)(66556008)(38100700002)(508600001)(31686004)(2906002)(2616005)(186003)(66946007)(86362001)(26005)(53546011)(316002)(6512007)(6506007)(6916009)(4326008)(31696002)(8676002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1hKfBYBeHbc2P7c3dZSHD9SUekqDYIQbKbhg0q5dWxLp1JHf3fLzcHF83RNr?=
 =?us-ascii?Q?N2Sf6HozK216JvE3eRjad2Kwsg18dQLMDK+GUBpwt/7Jn5ZTjZwvmeUiLFEC?=
 =?us-ascii?Q?okWGSYGg78A4ayFe3JfYZWg0vx0XK5cFTWerim6Jx+73TeBitIh7/DDk6mmX?=
 =?us-ascii?Q?6TKo56qm0Tw+BFcWMNpxkqzzcctiMAjUqNSDGzATRqynTHIyHcTjwlkQYOMu?=
 =?us-ascii?Q?YeJIRtOA34drZiHeqxhrobcTofU6xjQKbnJWnZbTn1h1IismP8Z6nhhQuc61?=
 =?us-ascii?Q?jnQjRnSIE+hu0TPPhj+1lS+HgtYWgLbSIvHMNejGwGPXkjQe70Gx2j0960Mn?=
 =?us-ascii?Q?sLTTVOpN2gvuNEmvRx72sCyAdcGRfBq8eLKYw7PBX/STZeDL9d98nbGnmesX?=
 =?us-ascii?Q?rkatMKRS88v2WKZ9GKHYViaZ3TxCKHbgeXfYL/EPE+J1vA4NDWZ5uNwMy4/5?=
 =?us-ascii?Q?LdM5IwEtYtMjxUAyHf4ZGdrSEivJuWGztoLFg2JmBQ4IidJj7JBdkaHt6jKJ?=
 =?us-ascii?Q?7XXSH+tcJouqWjMb1icXg0y/TMhP4ggPXINseSkobWducxVAoiO1Jj/Puuqx?=
 =?us-ascii?Q?+BD5egtgXeLs3fyyr74Q4/7muFYUOUFuFftQKBcLoOOy7LggU6qCY2tgEDK6?=
 =?us-ascii?Q?TBYKBVdAANpX7itPYuboqfL73gblHAS0dGQLnwHH8ulk53951jHYaPYMwDfh?=
 =?us-ascii?Q?BkAvsIGRH2MfC4Y28wee0C5wR4VESmkN7raI1bhSMgb0ghEDV4mDoE5EKYnj?=
 =?us-ascii?Q?E1SM6EpBr/Ns87I9wyNSrN9WeUzXRsJLiPDi/Ch6KMi+1WTm5SCJGzV30KQD?=
 =?us-ascii?Q?rpSNR6o+/oddxS8t6RSt4o2hSegzLp1KYOebe9KX/eZ83GFcD/mak7CSDxyV?=
 =?us-ascii?Q?uVlKAbhky2OjHEIPOwuWNN4mfTpF7t2Y7pov0hipW41yM2aZbJIqarYU1qIj?=
 =?us-ascii?Q?QM+NT2zc/3sukroe//uqkKT0MBHm/yUab0YP2+XohShg4Yfy3ILDFvmAtTgL?=
 =?us-ascii?Q?AGbqQKo9ZbrScgGeU6cxncCeLJ15QFxFHe+4PPAH7nJ3FguCxn+20EXXoCaA?=
 =?us-ascii?Q?3aQjtciHVUBEJSBNE2zTZzOz6+pZWveHWvs9T43WlaFeS/UYq7crkRtqb44U?=
 =?us-ascii?Q?2kmdBAva/vlSvTqt4SV1DesPBVFMYm5fVChtByX1y4eN+Iv21gQMtF1b9319?=
 =?us-ascii?Q?Q5+zx+mzJfuByWZNZb1rk1kyRl2MQEvzd95xT8hq1Rp9EWJ/9fNq1B3dnejx?=
 =?us-ascii?Q?Z49dny+zB/Iut5SA5scdlp8vNZTY9q9kCMe5o1rQniWdbkS/qC5QZX6QPjdO?=
 =?us-ascii?Q?4Ryripn/kBYN5Nfylbb2C0Wcg9Hcet6meIz8wLyW9j26Z+ISXtpu3bqyoZH7?=
 =?us-ascii?Q?xCqjsHAJ8WfyIxEfvzaZ0ibMdaRRvwn4TH8obMHaLIDL3JSRHQ329tbNqCr4?=
 =?us-ascii?Q?1uHmb8+TEXyRtvt9RQlUKSGUSnKZ0dfzDB5aDp7aoQh4sBXUMaG1tHLKQ/mn?=
 =?us-ascii?Q?HFf4+ZFVjGi2bdOmwTiNtg9CkBVWo4Gkf4Bh/52mkq2Z40or5f2QZVX/BUJB?=
 =?us-ascii?Q?ygMb3auFeerMpIthP56rSPIGJuSQ/S5e+kFfiUObdaRH41isEr9NW/OAzNgZ?=
 =?us-ascii?Q?QwadfVayH/ZQ3XRFtwvChdy5jyoV+oXOGBXPztyQHlkV4qtiAv84Mq+hSDES?=
 =?us-ascii?Q?1AI10Zlcf/IPBqG+Bpb767j0FohiAn1UnYUVNsYhf5jeCrC3vjmMoEa11agI?=
 =?us-ascii?Q?uURAXQ7suQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b953695-d1ef-4cd2-3144-08da3a280905
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 06:14:45.2034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49Cvele4kxYUhpl4WaUy+trcSywLWAZh0aZt6uUVQ6YRL715U7s6YKyQOCo1QDyGPcDB7cHxiQMyHrzeTzPBkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4984

On 19.05.2022 17:09, Demi Marie Obenour wrote:
> On Thu, May 19, 2022 at 04:55:10PM +0200, Jan Beulich wrote:
>> On 19.05.2022 16:45, Demi Marie Obenour wrote:
>>> On Thu, May 19, 2022 at 12:32:33PM +0200, Jan Beulich wrote:
>>>> On 18.05.2022 19:32, Demi Marie Obenour wrote:
>>>>> +    /*
>>>>> +     * The specification requires EfiBootServicesData, but accept
>>>>> +     * EfiRuntimeServicesData, which is a more logical choice.
>>>>> +     */
>>>>> +    if ( (desc->Type !=3D EfiRuntimeServicesData) &&
>>>>> +         (desc->Type !=3D EfiBootServicesData) )
>>>>> +        return 0;
>>>>> +    available_len =3D len - (esrt - physical_start);
>>>>> +    if ( available_len <=3D offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entr=
ies) )
>>>>> +        return 0;
>>>>> +    available_len -=3D offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries);
>>>>> +    esrt_ptr =3D (const EFI_SYSTEM_RESOURCE_TABLE *)esrt;
>>>>> +    if ( esrt_ptr->FwResourceVersion !=3D EFI_SYSTEM_RESOURCE_TABLE_=
FIRMWARE_RESOURCE_VERSION ||
>>>>
>>>> Nit (style): Overlong line.
>>>
>>> Where is the best place to split this?
>>> EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION is a rather long
>>> identifier.
>>
>> There's no good place to split; the only possible (imo) place is after
>> the !=3D .
>=20
> Will do in v7, along with parentheses to avoid any visual confusion.
>=20
>>>>> @@ -1067,6 +1122,46 @@ static void __init efi_exit_boot(EFI_HANDLE Im=
ageHandle, EFI_SYSTEM_TABLE *Syste
>>>>>      if ( !efi_memmap )
>>>>>          blexit(L"Unable to allocate memory for EFI memory map");
>>>>> =20
>>>>> +    efi_memmap_size =3D info_size;
>>>>
>>>> I don't think this global needs setting here, yet? The local will
>>>> do just fine here, likely yielding smaller code. But I realize that's
>>>> connected to how you did your change vs what I was expecting you to
>>>> do (see below).
>>>>
>>>>> +    status =3D SystemTable->BootServices->GetMemoryMap(&efi_memmap_s=
ize,
>>>>> +                                                     efi_memmap, &ma=
p_key,
>>>>> +                                                     &efi_mdesc_size=
,
>>>>> +                                                     &mdesc_ver);
>>>>> +    if ( EFI_ERROR(status) )
>>>>> +        PrintErrMesg(L"Cannot obtain memory map", status);
>>>>> +
>>>>> +    /* Try to obtain the ESRT.  Errors are not fatal. */
>>>>> +    for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
>>>>> +    {
>>>>> +        /*
>>>>> +         * ESRT needs to be moved to memory of type EfiRuntimeServic=
esData
>>>>> +         * so that the memory it is in will not be used for other pu=
rposes.
>>>>> +         */
>>>>> +        void *new_esrt =3D NULL;
>>>>> +        size_t esrt_size =3D get_esrt_size(efi_memmap + i);
>>>>> +
>>>>> +        if ( !esrt_size )
>>>>> +            continue;
>>>>> +        if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type =3D=
=3D
>>>>> +             EfiRuntimeServicesData )
>>>>> +            break; /* ESRT already safe from reuse */
>>>>> +        status =3D efi_bs->AllocatePool(EfiRuntimeServicesData, esrt=
_size,
>>>>> +                                      &new_esrt);
>>>>
>>>> I should have re-raised the earlier voiced concern when reviewing v5 (=
or
>>>> maybe already v4), and I'm sorry for not having paid close enough
>>>> attention: This may add up to two more entries in the memory map (if a=
n
>>>> entry is split and its middle part is used; of course with an unusual
>>>> implementation there could be even more of a growth). Yet below your
>>>> addition, before obtaining the final memory map, you don't re- obtain
>>>> (and re-increase) the size needed. As to (re-)increase: In fact, prior
>>>> to the allocation you do there shouldn't be a need to bump the space b=
y
>>>> 8 extra entries. That's a safety measure only for possible allocations
>>>> happening across ExitBootServices().
>>>>
>>>> And yes, in earlier versions you had
>>>>
>>>> -    info_size +=3D 8 * efi_mdesc_size;
>>>> +    info_size +=3D 8 * (efi_mdesc_size + 1);
>>>>
>>>> there, but that's not what would be needed anyway (if trying to avoid
>>>> a 2nd pass of establishing the needed size). Instead in such an event
>>>> you need to bump 8 to 10 (or at least 9, when assuming that normally i=
t
>>>> wouldn't be the middle part of a new range which would be used, but
>>>> rather the leading or trailing one).
>>>>
>>>> While I'd be okay with addressing the two nits above while committing,
>>>> this allocation size aspect first wants settling on. Personally I'd
>>>> prefer the more involved solution, but I'd be okay with merely
>>>> bumping the 8 (plus the addition of a suitable comment, explaining
>>>> the now multiple [two] constituent parts of a seemingly arbitrary
>>>> number). If you want to go this easier route, I guess I could also
>>>> make that adjustment while committing (and adding my R-b).
>>>
>>> I would prefer the more involved solution too, but I am not quite sure
>>> how to implement it.  Should Xen call GetMemoryMap() in a loop, retryin=
g
>>> as long as it returns EFI_BUFFER_TOO_SMALL?  If I do get
>>> EFI_BUFFER_TOO_SMALL, how should I allocate memory for the new buffer?
>>> Should I ask ebmalloc() to provide all remaining memory, and then tell
>>> it how much was actually used?
>>
>> Well, there are certainly multiple options. I was thinking that you'd
>> add a new call to size the memory map, add a few (again 8?) extra
>> entries there as well for the allocation, and leave the present sizing
>> call effectively alone (and sitting after all of your additions).
>=20
> How should I allocate memory for the new memory map?  Getting the size
> is easy; allocating the memory is the tricky part.  That=E2=80=99s where =
the
> idea of calling AllocatePool() and GetMemoryMap() in a loop came from.

Just like it's done now. GetMemoryMap(), AllocatePool(), GetMemoryMap().
I don't think you _need_ any loop for that, but you may well code it
that way if that looks neater to you. All I'm asking for is that you
leave the existing code largely undisturbed, which - as a consequence -
means that I don't think the logic strictly needs to live in
efi_exit_boot() (iirc I did hint at that before). But of course we
want to avoid relocating the blob and then exit for some trivial error
(like the kernel image not being readable), so it can't be done
arbitrarily early.

Jan


