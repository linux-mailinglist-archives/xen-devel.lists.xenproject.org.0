Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22144601C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 08:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222168.384241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mitdw-0001LM-Kq; Fri, 05 Nov 2021 07:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222168.384241; Fri, 05 Nov 2021 07:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mitdw-0001JU-Fs; Fri, 05 Nov 2021 07:28:08 +0000
Received: by outflank-mailman (input) for mailman id 222168;
 Fri, 05 Nov 2021 07:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mitdv-0001JO-47
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 07:28:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea78c1f1-3e09-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 08:28:05 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-Bd2OgPCmPQSV_1fUMUlcoQ-1; Fri, 05 Nov 2021 08:28:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Fri, 5 Nov
 2021 07:28:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 07:28:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0038.eurprd06.prod.outlook.com (2603:10a6:203:68::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Fri, 5 Nov 2021 07:28:00 +0000
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
X-Inumbo-ID: ea78c1f1-3e09-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636097285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSsgtyfSeNKidGRLgL3AQHv8dEAIVMgEVatnJDLAPpc=;
	b=k60Sq0EyB0S0syhNQ7u6h79COatPzIkuMMPIpyKj434KooG+MgXpmQ1bTBJHwvy6H/YzFz
	Jm/qzR25ArEyaDarLhhcgjAXTyhWLNbFOMuP1701JxD5zYIykS2D7R2k1SNymu96sC00ur
	/vOBkeUVakz8ryTNaf32NTcBMKE7yzY=
X-MC-Unique: Bd2OgPCmPQSV_1fUMUlcoQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7RcagulQA9MCwBp8Cbupq6dkdQKJK7Ou9MTbtkWhT0rZgU8MsNaOIgscuRBNR0FIrpW9BDTVdO0fub4mbg6fFH25R8DFUh15dBuagSJln00QasWJqvtk9OnCr2YGDJKiMGMMrVv+Upkd7GrEYtuLW7DM9TnV7XLk/NARGtHcrLve2D/P5oFcdmdzkNkDXr2rPv0WPRd0cewgtoel4UbETmTPB97cn+NFT26/BUETaDMBVBSOyMLKF2kH/Fv67fJZFG/dsKE2dasBlwyJhp3ZrokkXch/yh7rpemFywfvQixS9eZ98z1QMco3WXjRVj4ucnRQUipkHSuld4olnHi+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pwnsHS9R6j7xnBOQLsyaMFjzojV1Mrn4R3jAozxkSM=;
 b=SnCTNa0DwF/z2At/nuOECvRwCW07cQm/zkyaKByrGtz+9p7MGBl0hFWAhsPYsKXxY0u9w0JniPjXzkuGZxCnKrz04dg5p+cuj9wyjLOSuWsIEsVJA2M6vYvsFotmrJ/rAcVnAyZS+EdjoZA3Wiqp1hI0QcZXccDu+47Bx/a9zcCp44iTpAa22OpJGTm+16CbAv6YKwl3Ri2LLg0VWBUYp2gCyooOGTL+O78HZD/04fBUqGhfwi0gPkJ/dkSBKpP4770iV5/8z+ir09kMkhvoom6jWxnEIPsgJj09ifvFnOZ+hKh68RXlauzLOFQJSrIZyjTQhGF2IGGr6kYwc25Geg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bcf4fc98-30a6-4b85-a095-ae495bad2b79@suse.com>
Date: Fri, 5 Nov 2021 08:27:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com, iwj@xenproject.org, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0038.eurprd06.prod.outlook.com
 (2603:10a6:203:68::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acd4c509-f00c-4c47-a484-08d9a02dcc25
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3119CC5BC8199849C38F3D0BB38E9@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VfDPpQebb9CtD4G/IqwUlz6ukM+eP3pMBh7FUlyFRtmYmrmQkQd+za2WoYXZE3EPc19AXs1iSaOzb9p2pZYxTwo1nvlJ5I1e9PlQGwFbT+rSrG2l8LoCyfAdp1cV60S5tlvpkKKIvnpJX3DSNsGpT5/NXB1hle9mv5knWu5GDvD999mPXv5uJuyjNwHonsFvsTUmngXLvCY436QBlpG/LHgHl3W5UXwLj7s7cLrnYSb/Kj0DSowZ/TM9Qp/X1iAITWndHXp3YYfy9qpKjRS3BDdhNI4YHzS57oUcmJ0FU+PIkeshY0nFZFCuxGJ6mpEvLt4ZwlxFvNq0t4/NSevtdIEXoEG6oHkBWcSmLO0AALh1VNM2anzofCwDFG1jlCZzJa2Mjhbxy2xpfZlxlM4Yk4VGEkqQ7Wb2n71gVtKIGFWsiOxflsNpPKyTQ42vgW9bqryHOXUzJOpiAqGWvZd3Ruoovgdb3+H3DvDzG4fGzhho4NIvSHV2m11CHMSR3HBK21Thzh1aihqr47c5uaccrrhnDG+rL6D8U0vGh62PH2Oi0swXfxO+JvndHIrICJUaXiWbOi5kDGgFmOag3zHT/pkLcux33DDMR2HtSzAnlg5SDh1D+Tay4xY/8/aVHKBDfdtTEIXrX4uNwlY6etkUAJWD7UTcEnQ2xXcv7TbdHflsxh+OxMm/v+r+p0DC8NbZ81whteiee40gVFKFiWht2UY9GAoboshSZ9S8xXMSVFU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(4326008)(2616005)(86362001)(6486002)(956004)(186003)(31696002)(53546011)(2906002)(5660300002)(83380400001)(36756003)(54906003)(6916009)(8676002)(38100700002)(16576012)(26005)(316002)(66476007)(508600001)(66556008)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i/QApInp4WTlFNCmEFxnb4mFARrfzleBLwMjdAUEqbLOiTWcHBiIEC+/IcCZ?=
 =?us-ascii?Q?wteRBQQUV6pKSjqwZcSM7xAdB/kuDQQxqBSwB9msxhh+n5c/8O+TR2pC9IVB?=
 =?us-ascii?Q?WBMjtl8qsiGMnBAUyzFs9vjZfLmW2HoXn2YMcD7qJY82Rg1fUoRkMszNGydw?=
 =?us-ascii?Q?zlJsDfUeptsWHhbBcDoeDtEqaw5Hb7rzCBqECkpPeFOn400PUc49jKy/zhhw?=
 =?us-ascii?Q?EpFwnOsBqJe4EmvA3/52MitX4oH3b4xgiIT9XQwiVII7aYsFIeXB43DSz0Pk?=
 =?us-ascii?Q?bQS4zlz6MvDmw29JHFVRM0DGAl2ZoiRkftiMNsCs2ximpEmlCCilxtDrqVKj?=
 =?us-ascii?Q?0gmbYq0tXcruO4ajWdfI6yUNG8OQ6ZlUE76ZJk7FjWWmjMI4BNONPPY6QmLG?=
 =?us-ascii?Q?eEKUBTqYxlkX8+wa7spLaOQ9TKTSj7WEvkovYEEohsd/UJEmC3GvbI0c4vZu?=
 =?us-ascii?Q?/x/deTlnLbYFFQ34hUuE84tQWLiG5ZOCwFgi3PKzcdmKBc5VD4CttyTymLeG?=
 =?us-ascii?Q?ENWbs82lwlQ/ve9fhmTZjXHjrbmQF6rGzCZG69ZkdGMyi+15Znn/vcHaqEvH?=
 =?us-ascii?Q?3SX0T/MeRFqq8mlxnsYiKcyZJ0BinIvDW2lWOuvMBTDLYPHj2XdkRIRPoq1w?=
 =?us-ascii?Q?qEJ4xXIRC2r3L19XH2pxvJZQep1d/50QERupC0CZ/gAb2tZiihcOnddvycKI?=
 =?us-ascii?Q?XrgQlHm78DmR/0z6LlplENyJiTrKNny46lcd5tLvKV/mOuQXbBDH3tTnW9+5?=
 =?us-ascii?Q?dvNvjOoixvtdn+WrF7smzNBAgW1840p/jQKnBAq+pU0KUX1DdU3Q1I55bCev?=
 =?us-ascii?Q?p6vHmXuWLvOfXiIiRNcbfg1AKTjWEsdWflJt6QmPyycl02RAOJmmT+Ht+lA4?=
 =?us-ascii?Q?a6StOLK6H6oFUhfAXxpaKsp44XNZDKOcUdGniC/LmEwSMQp3wbFUaHWKDk02?=
 =?us-ascii?Q?RhGMvxQ29fckNNVigX8fxReIIS0wbWT0uUv2lDarAisvfP/mQmx/fZJGlcsC?=
 =?us-ascii?Q?w1vrYUNlG287T65WKUQQn1F+XICoNF5X9LWRkZAWZXIvpX6uAjINJV6fikFv?=
 =?us-ascii?Q?A2obGq13/7QjZo6jH7MVOpGmNR7FreRB4CWxeRisOYcIGyTwn9EBVMKL739Z?=
 =?us-ascii?Q?rkjPTedSWnjkHQ1Ld4ZNPsdb+dB2f/vxOa3vTTSg64r9c4Q2nqzGe8tosDr0?=
 =?us-ascii?Q?ggkO7q9YEuNmz9qalnrEzxdiZ7E56aVkMKVsM3sXuB4Ad+c03uo5vB7E+/7y?=
 =?us-ascii?Q?upUh396jFeG5gZMc8OMK860yXqUbKJDnWizLUcvvexqTzPGMVtctxPMhhW8T?=
 =?us-ascii?Q?DokKo6eulswJ30qyIrdEhbFycF3CZoX6FUwM7uD1cwJdSowAGzwrw7z8nyyZ?=
 =?us-ascii?Q?s0Uep8NATWHFkStrteX1ss/WDNzIXZfWWGQUeYWhjkiffzkhQXBBdzw5/3Ry?=
 =?us-ascii?Q?oLwz1ZX7aPDSDNgQhBqu6lZ93IL9BND3gVt9s/KorVHMHZR1UX6wg9vZgr1R?=
 =?us-ascii?Q?hg0SaBx8RMD4aAVbkwRMgaGvbxY61SkdnSgHCLY7+mhjvpmYDHsw8Oih36dT?=
 =?us-ascii?Q?g9loaKlmJLKK0PsgTUz+QYi3BYL1RsEKFqvFtOLQ+YNrvdF0qLyr5SY//x2j?=
 =?us-ascii?Q?+KjFzSbYxzK9e7Xlp0speXg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd4c509-f00c-4c47-a484-08d9a02dcc25
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 07:28:01.0116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqsWpisAKb3HbDbcHgocf+Ykv19g/Eep4hIl8uEx0c0Lovwt1Iqb5aRRGoQaJpbCoKU7uQLXJLbOXOUPsoeRUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

On 04.11.2021 21:56, Stefano Stabellini wrote:
> On Thu, 4 Nov 2021, Jan Beulich wrote:
>> On 04.11.2021 15:12, Luca Fancellu wrote:
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -449,6 +449,15 @@ static EFI_FILE_HANDLE __init get_parent_handle(EF=
I_LOADED_IMAGE *loaded_image,
>>>      CHAR16 *pathend, *ptr;
>>>      EFI_STATUS ret;
>>> =20
>>> +    /*
>>> +     * Grub2 running on top of EDK2 has been observed to supply a NULL
>>> +     * DeviceHandle. We can't use that to gain access to the filesyste=
m.
>>> +     * However the system can still boot if it doesn=E2=80=99t require=
 access to the
>>> +     * filesystem.
>>> +     */
>>> +    if ( !loaded_image->DeviceHandle )
>>> +        return NULL;
>>> +
>>>      do {
>>>          EFI_FILE_IO_INTERFACE *fio;
>>> =20
>>> @@ -581,6 +590,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_ha=
ndle, CHAR16 *name,
>>>      EFI_STATUS ret;
>>>      const CHAR16 *what =3D NULL;
>>> =20
>>> +    if ( !dir_handle )
>>> +        blexit(L"Error: No access to the filesystem");
>>>      if ( !name )
>>>          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
>>>      ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
>>> @@ -1333,8 +1344,18 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>>              EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image,
>>>                                                         &file_name);
>>> =20
>>> -            handle->Close(handle);
>>> -            *argv =3D file_name;
>>> +            if ( !handle )
>>> +            {
>>> +                PrintErr(L"Error retrieving image name: no filesystem =
access."
>>> +                         L" Setting default to xen.efi");
>>> +                PrintErr(newline);
>>> +                *argv =3D L"xen.efi";
>>> +            }
>>> +            else
>>> +            {
>>> +                handle->Close(handle);
>>> +                *argv =3D file_name;
>>> +            }
>>>          }
>>> =20
>>>          name.s =3D get_value(&cfg, section.s, "options");
>>> @@ -1369,7 +1390,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>>>      /* Get the number of boot modules specified on the DT or an error =
(<0) */
>>>      dt_modules_found =3D efi_check_dt_boot(dir_handle);
>>> =20
>>> -    dir_handle->Close(dir_handle);
>>> +    if ( dir_handle )
>>> +        dir_handle->Close(dir_handle);
>>> =20
>>>      if ( dt_modules_found < 0 )
>>>          /* efi_check_dt_boot throws some error */
>>>
>>
>> I'm sorry, but I think we need to take a step back here and revisit
>> the earlier change. If that hadn't moved obtaining dir_handle out by
>> one level of scope, nothing bad would have happened to the case that
>> you're now trying to fix, I understand? So perhaps that part wants
>> undoing, with efi_check_dt_boot() instead getting passed loaded_image.
>> That way, down the call tree the needed handle can be obtained via
>> another call to get_parent_handle(), and quite likely in the scenario
>> you're trying to fix here execution wouldn't even make it there. This
>> then wouldn't be much different to the image name retrieval calling
>> get_parent_handle() a 2nd time, rather than trying to re-use
>> dir_handle.
>>
>> Net effect being that I think get_parent_handle() would then again
>> only be called when the returned handle is actually needed, and hence
>> when failure of HandleProtocol() (for DeviceHandle being NULL just
>> like for any other reason) is indeed an error that needs reporting.
>=20
> In my opinion the current version is good enough. Regardless, I looked
> at your suggestion into details. As it took me some time to understand
> it, I thought I would share the code changes that I think correspond to
> what you wrote. Does everything check out?

Well, first of all I understand that's an incremental change on top of
Luca's, not a replacement. And then there are a couple of things to be
done slightly differently (imo), to match the present model:

> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -8,6 +8,8 @@
>  #include <asm/setup.h>
>  #include <asm/smp.h>
> =20
> +extern EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded=
_image,
> +                                                CHAR16 **leaf);

This should remain static, but will need forward-declaring (for the
time being, I have a post-4.16 patch eliminating a fair part of
those forward decls).

> @@ -851,10 +853,14 @@ static int __init handle_dom0less_domain_node(EFI_F=
ILE_HANDLE dir_handle,
>   * dom0 and domU guests to be loaded.
>   * Returns the number of multiboot modules found or a negative number fo=
r error.
>   */
> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>  {
>      int chosen, node, addr_len, size_len;
>      unsigned int i =3D 0, modules_found =3D 0;
> +    EFI_FILE_HANDLE dir_handle;
> +    CHAR16 *file_name;
> +
> +    dir_handle =3D get_parent_handle(loaded_image, &file_name);
> =20
>      /* Check for the chosen node in the current DTB */
>      chosen =3D setup_chosen_node(fdt, &addr_len, &size_len);
> @@ -895,6 +901,8 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE d=
ir_handle)
>          efi_bs->FreePool(modules[i].name);
>      }
> =20
> +    dir_handle->Close(dir_handle);
> +
>      return modules_found;
>  }

Imo obtaining of the handle wants pushing further down the call tree.
Placing it here will, afaict, still trip the problem Luca is trying
to resolve. Plus of course the handle wants closing also on error
paths (if any in the function this really wants to be put into).

> @@ -1236,9 +1236,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
> =20
>      efi_arch_relocate_image(0);
> =20
> -    /* Get the file system interface. */
> -    dir_handle =3D get_parent_handle(loaded_image, &file_name);
> -
>      if ( use_cfg_file )
>      {
>          UINTN depth, cols, rows, size;
> @@ -1251,6 +1248,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
> =20
>          gop =3D efi_get_gop();
> =20
> +        /* Get the file system interface. */
> +        dir_handle =3D get_parent_handle(loaded_image, &file_name);

Along with this the declaration of dir_handle also wants to move back
into the more narrow scope.

Jan


