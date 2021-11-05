Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D38444601F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 08:32:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222174.384252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mithy-0002mf-9r; Fri, 05 Nov 2021 07:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222174.384252; Fri, 05 Nov 2021 07:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mithy-0002kr-5D; Fri, 05 Nov 2021 07:32:18 +0000
Received: by outflank-mailman (input) for mailman id 222174;
 Fri, 05 Nov 2021 07:32:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mithw-0002kl-9Z
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 07:32:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f629649-3e0a-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 08:32:15 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-aBeZWAxmNI-5vKzVF9_pWA-1;
 Fri, 05 Nov 2021 08:32:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Fri, 5 Nov
 2021 07:32:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 07:32:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0038.eurprd02.prod.outlook.com (2603:10a6:20b:3a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 07:32:12 +0000
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
X-Inumbo-ID: 7f629649-3e0a-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636097534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tjt/kvsamUUxJ9U6RiX1M+cP7qZUh0NZGoymS27dUV4=;
	b=IO7DdtbPgCleWn8zxJq49cpWQB94xciunBmj/aRjQPPnikR968P961OS+W4kdU9fwSdoGC
	QM2OVTo+99AnwEAW7Vo/m+YL05Yv8iSyX2W4faSYb6k+p4fgvImsOJSzI41y1TQS6fjvS3
	ksOkTNpFIgsH5VyT0pULrfKbcJmFq3g=
X-MC-Unique: aBeZWAxmNI-5vKzVF9_pWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FD4zDFqMadCdWAIB+mBJ3IfUrYJMv9Yi1i2OhfheMZEEiKW5rVfN3SP59gWS/5jBdCjNrtSnCiZq9hKKKK2hpALlgQayFqDbSeeFmf0Hf8DZfJ3qThyFMsDwGvhtkLBCEqjA/YANm4ySiTH5K+WKhTf8qlT4eMQRbTyBq2mtujy90IzfLWBD1cmC7K87jx8BNOvu29sCPYREkKME5pkVFPeTK7tPUGE04mJLlKRQGJfHEUxjEsJmXN5taj9+BdF789lVCRB4p+pU1DzXwa44X8bQFju9SWs0HieEQzpxMUaRx3PM+CCtPxX9peKsVXiolnVF7ghvgR40GX8Phz5IHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0meqmD4C+AzQd/rnYomwCnSpg9TSN1xLkWIR5Cssjk=;
 b=C8d0vuLgAGXsDBsKK8yee6Y7BDIGdkhznYLlCVkK1BE98fdO8I7exPt4t4Uus3rbBeEQwO67SRrv37aPYy0n3Kt/f+l5ymEvXP/tSkbPCJQ3CZyEkwTWRJHEFxYPoPmQ2SY4ros/xp6Afw2x0vmnoDZpMdmgsuNNj2eIcwjuiqaORp+o+8mlNRtZ4XyoptcE/rImZfEmkU9xFzfzK6TGN7OXwvBW6GYlguSwDif4sYZUIKGjLMScxe352m7Tx3Z4WjeqDgMfEcv6tRfBEe/NV4lsdJoFVDkQaBRTmF0656aFaFSyxs3JjCCM2RlK6H5590JaFKwYzBQi35hPlXynCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <abff150a-b84a-d6b5-c8ea-dc495ba3cfeb@suse.com>
Date: Fri, 5 Nov 2021 08:32:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0202CA0038.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a139e500-dcf9-4f37-44d9-08d9a02e6252
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260785CF6340454B19F81531B38E9@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dYSVfPjhqzQ8wM+inK9anNbW1Mkbar/1ZGVFrGjJqTamLi87vTCwnRYafOEDzts5qVue6Qq+BsYGre6I7g4P4HCO+3SAGuehJPC6NypZt29hm8V7Dys2ow8tAWmhsYDO5oA4eGiyh16Mx9w9MSc84AIRg9bnI12Q0YBmvTe10fMFfa/2fKyElJEUmNlznrK+JQ6U5UfQdQ4z2Vo1UEgMxkZ1y+kuQBckCKxkguNciXFB4Dli/LCh1WXbqvgkKhOPPjz2KJSOXDd/6tjqtr0bzCB4MXrOkVau+agGVTGyh2HxJy6SkOT5TWJxoM5HYNLlzkG9ueQSkmjaeQWLJMwH/zwlcqXAGiHHg34m0FjDUPptqv108GDy99PcMS+7cIlXDl9m6dW5+6xJkH1BMVLESriBGhOAO9eJzZOCjJg9desDdDck/Z3qNM5gN0sJP/MO7wLMqImo5IW/T0Kp0LzywjkWFzck7HsAZrAkaiTQABwiORhamUFIz1hT0rTVvnbTR+LkFJUF8VQOKUnyCtY/IWKNQCOtmo/EideHjFVbhInPYoJMGIPgomgwJy2G+IbXEgFvGAFNDPm1KHFp2A7Dl5phYWrtfBD6j3vQzIxGu1V1gsYU/h5xl4VabQdcJat5sNYkuL4TpowlKgU2bJu+UT33ssKCmEwQfEm8Q1q0181hW3Aa3+W3AysHBezins1fEjw1xv991oYHWjOtP//ILzTCeTTIxxn33p/ttyJXRCM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(66556008)(54906003)(956004)(5660300002)(2616005)(31696002)(86362001)(66476007)(16576012)(4326008)(508600001)(66946007)(36756003)(316002)(186003)(8676002)(2906002)(83380400001)(26005)(8936002)(31686004)(38100700002)(6486002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xWjlae5Gvhnm2GBtDmFcMjO22BKxNtJbTGkXUZmzLw48r5LmA+ZbxI2EtSRB?=
 =?us-ascii?Q?wBJop+Ycaxj8iJIDTLGe4MTG1xNvRZCjW8IgQzA0/ZrJSeOoU7RrnKsnP27n?=
 =?us-ascii?Q?+ziMugnhAWDC0Y67BaSrHDhv9GDHwV0B2YJ0zgBv6aanFT7Lq7FeCmHigcBk?=
 =?us-ascii?Q?u7VuUXEqZ/YZfIQs7yNVxqWiy/H/EQRtWSr2hrRulu3uIKX9dfUqvegd/8sv?=
 =?us-ascii?Q?gCyJIr1A7k12fy0guZC89rHosBguZrrjplw5dJIcTGP8QQjlVzXu+mBpa5+j?=
 =?us-ascii?Q?jp01FUOEpGgrUekkHdiOD55KpR1R9xFp/SlL+HWgqsD7Flu/NUW7ac0rojD6?=
 =?us-ascii?Q?p5SWJHvWJFA6dmufVrK31xLX06HebPcM5sQky7gI/K1CSX+u5ILit1S4H51m?=
 =?us-ascii?Q?MSW6xCGHBcDyDVJfD+FswlupVolz8VrHnYGPF5zl4IxU5RbvQGCbsLsAiVa+?=
 =?us-ascii?Q?F71venYUTqSj4Wg007E50lsHEN1UZ3heZPW8mEjyd6fMzpFhN1YvGapW70L3?=
 =?us-ascii?Q?EMw27Lkg0MwzYwIV7NHsZlrTShbrpqYSGv0V6/YYxkPdbP7QJCIlWkp/JYqj?=
 =?us-ascii?Q?n7yZIWNO+LI2dPAfOKMIlJrdwiKNTFjh0IOq5Chc7pBgtydmvP2kD+A9wdW+?=
 =?us-ascii?Q?1w+ohPJfQCmGkaRrCN057VL1dZ46PF5iAbFEQIEtZahk0cfcVXdC+IUzOQnS?=
 =?us-ascii?Q?tuAkR88/9TsdXrLo/qpjlBAwr/3iPzVfEwGLh5WyOmUPtXzeRvV/2sY369Sl?=
 =?us-ascii?Q?37hsaRCVN2wZ+AfNJt4ZNFqKPZ8WIQQOz+jp1liKa1+cM1lAELh8Fgnka+2i?=
 =?us-ascii?Q?dVcD1YY+J8l5drnSOWH/T+OtPkKnyFNstbuzf46c/Q43IPoaOIPxLM4K32Xq?=
 =?us-ascii?Q?cfo9uccjMyNZ7bfrieGJvnfzbLzwtEUb1hgju+lzD1bLj4geshbORSjwBIBM?=
 =?us-ascii?Q?zqjB/B4e5moDyWOxIxvvWbz3B7a5wV/yz+me1AQTZh/LNWtyqpW+Ipibr51Z?=
 =?us-ascii?Q?8nSbqQ8PwAtxpWN5yqdtWAk3lh81o1TIs5e+ywnImzZnfsMo50AY6PVS8tlb?=
 =?us-ascii?Q?MvTYISIP1FAIUvDtZjccGHSV6bZ2QOwh+I0xcRVd5pnG7ZUJlu8XSHAGZbyj?=
 =?us-ascii?Q?uxSlQ6PgqwGFi4HNfQDJorIwnYdZmWMuh8wywEcSpCz6xlg/Fy9JLoRglxGO?=
 =?us-ascii?Q?uzZISY0kxKqQEv9W4pY1y3MdnYlwJLV+n1gFaZ+kTt4ZPjZVAbWj4hyb8Ftq?=
 =?us-ascii?Q?oRSGvdkWOnnghOSbDHNfZTQbZckKXKN01HLFHYJWSuWpD4eCldZcH7m2DODJ?=
 =?us-ascii?Q?eojKAlxGQ78yM2oCVhf16pHvOZdENr4HTi82AEEd+Go2E986xHGHJyN2UEYK?=
 =?us-ascii?Q?r4dMWYfP3JMSKv0Sx8QaphWe7eo11Q3LEtNRjudNE588crNvPekMuAISmzim?=
 =?us-ascii?Q?3pa1USxT18+cwLv9VGQ78syABvAnfeIXZEx6V26b2+j4H1jTr2G4K0oeJ2r5?=
 =?us-ascii?Q?HrSM2isuigmpqUhIHpYpp7Z0VoH9urkRuqS8M+lK7NioifTmdfAW5bvfOFGF?=
 =?us-ascii?Q?aKawPLu38ogGi9WiXVpZLOOLsVHrE1QiK6poJYs8gKE7KeQNEIoLniPQt6fz?=
 =?us-ascii?Q?dvA9WIUD5MkmFvOsKMlSbtc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a139e500-dcf9-4f37-44d9-08d9a02e6252
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 07:32:12.9493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e84olPsHHSUW0T2Kkl3kti++k5ibNThQMfu7dKMxLApCZa3IENZET00vqG5FkbRJ67wu0cxLhy8gnUrYpnxjxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 04.11.2021 22:43, Luca Fancellu wrote:
>=20
>=20
>> On 4 Nov 2021, at 21:35, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>>
>> On Thu, 4 Nov 2021, Luca Fancellu wrote:
>>>> On 4 Nov 2021, at 20:56, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>>
>>>> On Thu, 4 Nov 2021, Jan Beulich wrote:
>>>>> On 04.11.2021 15:12, Luca Fancellu wrote:
>>>>>> --- a/xen/common/efi/boot.c
>>>>>> +++ b/xen/common/efi/boot.c
>>>>>> @@ -449,6 +449,15 @@ static EFI_FILE_HANDLE __init get_parent_handle=
(EFI_LOADED_IMAGE *loaded_image,
>>>>>>    CHAR16 *pathend, *ptr;
>>>>>>    EFI_STATUS ret;
>>>>>>
>>>>>> +    /*
>>>>>> +     * Grub2 running on top of EDK2 has been observed to supply a N=
ULL
>>>>>> +     * DeviceHandle. We can't use that to gain access to the filesy=
stem.
>>>>>> +     * However the system can still boot if it doesn=E2=80=99t requ=
ire access to the
>>>>>> +     * filesystem.
>>>>>> +     */
>>>>>> +    if ( !loaded_image->DeviceHandle )
>>>>>> +        return NULL;
>>>>>> +
>>>>>>    do {
>>>>>>        EFI_FILE_IO_INTERFACE *fio;
>>>>>>
>>>>>> @@ -581,6 +590,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir=
_handle, CHAR16 *name,
>>>>>>    EFI_STATUS ret;
>>>>>>    const CHAR16 *what =3D NULL;
>>>>>>
>>>>>> +    if ( !dir_handle )
>>>>>> +        blexit(L"Error: No access to the filesystem");
>>>>>>    if ( !name )
>>>>>>        PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
>>>>>>    ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
>>>>>> @@ -1333,8 +1344,18 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_=
TABLE *SystemTable)
>>>>>>            EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image=
,
>>>>>>                                                       &file_name);
>>>>>>
>>>>>> -            handle->Close(handle);
>>>>>> -            *argv =3D file_name;
>>>>>> +            if ( !handle )
>>>>>> +            {
>>>>>> +                PrintErr(L"Error retrieving image name: no filesyst=
em access."
>>>>>> +                         L" Setting default to xen.efi");
>>>>>> +                PrintErr(newline);
>>>>>> +                *argv =3D L"xen.efi";
>>>>>> +            }
>>>>>> +            else
>>>>>> +            {
>>>>>> +                handle->Close(handle);
>>>>>> +                *argv =3D file_name;
>>>>>> +            }
>>>>>>        }
>>>>>>
>>>>>>        name.s =3D get_value(&cfg, section.s, "options");
>>>>>> @@ -1369,7 +1390,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_T=
ABLE *SystemTable)
>>>>>>    /* Get the number of boot modules specified on the DT or an error=
 (<0) */
>>>>>>    dt_modules_found =3D efi_check_dt_boot(dir_handle);
>>>>>>
>>>>>> -    dir_handle->Close(dir_handle);
>>>>>> +    if ( dir_handle )
>>>>>> +        dir_handle->Close(dir_handle);
>>>>>>
>>>>>>    if ( dt_modules_found < 0 )
>>>>>>        /* efi_check_dt_boot throws some error */
>>>>>>
>>>>>
>>>>> I'm sorry, but I think we need to take a step back here and revisit
>>>>> the earlier change. If that hadn't moved obtaining dir_handle out by
>>>>> one level of scope, nothing bad would have happened to the case that
>>>>> you're now trying to fix, I understand? So perhaps that part wants
>>>>> undoing, with efi_check_dt_boot() instead getting passed loaded_image=
.
>>>>> That way, down the call tree the needed handle can be obtained via
>>>>> another call to get_parent_handle(), and quite likely in the scenario
>>>>> you're trying to fix here execution wouldn't even make it there. This
>>>>> then wouldn't be much different to the image name retrieval calling
>>>>> get_parent_handle() a 2nd time, rather than trying to re-use
>>>>> dir_handle.
>>>>>
>>>>> Net effect being that I think get_parent_handle() would then again
>>>>> only be called when the returned handle is actually needed, and hence
>>>>> when failure of HandleProtocol() (for DeviceHandle being NULL just
>>>>> like for any other reason) is indeed an error that needs reporting.
>>>>
>>>> In my opinion the current version is good enough. Regardless, I looked
>>>> at your suggestion into details. As it took me some time to understand
>>>> it, I thought I would share the code changes that I think correspond t=
o
>>>> what you wrote. Does everything check out?
>>>>
>>>> If so, I think it looks fine, maybe a bit better than the current
>>>> version. I'll leave that to you and Luca.
>>>>
>>>>
>>>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>>>> index c3ae9751ab..9dcd8547cd 100644
>>>> --- a/xen/arch/arm/efi/efi-boot.h
>>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>>> @@ -8,6 +8,8 @@
>>>> #include <asm/setup.h>
>>>> #include <asm/smp.h>
>>>>
>>>> +extern EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loa=
ded_image,
>>>> +                                                CHAR16 **leaf);
>>>> typedef struct {
>>>>    char *name;
>>>>    unsigned int name_len;
>>>> @@ -54,7 +56,7 @@ static int handle_module_node(EFI_FILE_HANDLE dir_ha=
ndle,
>>>>                              bool is_domu_module);
>>>> static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>>>>                                       int domain_node);
>>>> -static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
>>>> +static int efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image);
>>>>
>>>> #define DEVICE_TREE_GUID \
>>>> {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa=
, 0xe0}}
>>>> @@ -851,10 +853,14 @@ static int __init handle_dom0less_domain_node(EF=
I_FILE_HANDLE dir_handle,
>>>> * dom0 and domU guests to be loaded.
>>>> * Returns the number of multiboot modules found or a negative number f=
or error.
>>>> */
>>>> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>>>> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>>>> {
>>>>    int chosen, node, addr_len, size_len;
>>>>    unsigned int i =3D 0, modules_found =3D 0;
>>>> +    EFI_FILE_HANDLE dir_handle;
>>>> +    CHAR16 *file_name;
>>>> +
>>>> +    dir_handle =3D get_parent_handle(loaded_image, &file_name);
>>>
>>> We can=E2=80=99t use get_parent_handle here because we will end up with=
 the same problem,
>>> we would need to use the filesystem if and only if we need to use it,=20
>>
>> Understood, but it would work the same way as this version of the patch:
>> if we end up calling read_file with dir_handle =3D=3D NULL, then read_fi=
le
>> would do:
>>
>>  blexit(L"Error: No access to the filesystem");
>>
>> If we don't end up calling read_file, then everything works even if
>> dir_handle =3D=3D NULL. Right?
>=20
> Oh yes sorry my bad Stefano! Having this version of the patch, it will wo=
rk.
>=20
> My understanding was instead that the Jan suggestion is to revert the pla=
ce
> of call of get_parent_handle (like in your code diff), but also to remove=
 the
> changes to get_parent_handle and read_file.

This is indeed a correct understanding of yours. (Hence why an incremental
change on top of yours wasn't the most expressive way to outline Stefano's
thoughts.)

Jan


