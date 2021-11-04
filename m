Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3291E445755
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 17:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221760.383633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifir-0007fN-6t; Thu, 04 Nov 2021 16:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221760.383633; Thu, 04 Nov 2021 16:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifir-0007bx-32; Thu, 04 Nov 2021 16:36:17 +0000
Received: by outflank-mailman (input) for mailman id 221760;
 Thu, 04 Nov 2021 16:36:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mifiq-0006gR-2y
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 16:36:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53d4b00d-3d8d-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 17:36:15 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-yMkzNde3PziHkGG1FzfJ8w-1; Thu, 04 Nov 2021 17:36:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2960.eurprd04.prod.outlook.com (2603:10a6:802:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 4 Nov
 2021 16:36:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 16:36:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 4 Nov 2021 16:36:11 +0000
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
X-Inumbo-ID: 53d4b00d-3d8d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636043774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TvVcj1cSlOYm/o+qzZnxnqZvNaP0pk3zrhfKGoOruK0=;
	b=g9DrYCYcbnuqYc37f8/Js158yHcFDS9R12zfPrh/f0otvwKqBAQE16g+grSiI4l2O1p9kz
	KrXl5W/CyNsYW8oW11KjhCSF2TMvXGKcy9kOBllRprJ9nI9DdANFfGimSn3uAflPweR7Kq
	noCLkFmTWzAQcIhw2G/b0ZFe7dBatGU=
X-MC-Unique: yMkzNde3PziHkGG1FzfJ8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z61eT23jRKUDQbpFIE9ot+OC/bjaY6cmtJsd75aPMITn1rSPDIY9QmBenE8a2CZBFjEWXO5u8MOEuSPWtP2kcNB4W++MKfZ+UB3VWgJWU87o946aCNIGGbdMRZtayQBF9Ac9BddT71IQ9My1k+Z9TtxuYZjnMsIvfs2OSBG9LqAv1oIY1gzhymZkWCquy9Gnq0M5GegNoo4FTk9vw9oRFplFNXIDy0z+2UenPZgtTtk2JYW2P9vMKYKd/D1jQrT0vJFJ5XCis3DE9WLTuEH7yertGjIveS1GziH3dRVV7NAw2DptBkZQYw5qrIuE70BxiOk6jgN06RtsC1UA2wB/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nKfMgo1diL+LUlDwyB2iNtX9RXnW1f3Dbvi53KgCxI=;
 b=Gtmr45GnfnUkCcDn2IUiIcc7QZAc2TgHxSZ6dwiS/OZu6vV2/09HlfSLibSVLubzRTSASDhz6jHrzkcHaJ4EMXRvLkaozMYvcMiToCUnqvP37kQ9TKZMJKG2WRWQ7ZrU5ALf8W5/u46VLJLzN3UlxTCZ336FHyQ87hIEzWWboT2lXIlSevlHEuvIB74759MrpKQRFeLTLEh+KI9kO7IZn0gKyxDSnmcaUfjSvi/5ka/02pHzJ4QsdorQhzyrUIDAi9lG/jUAG+qID4jJAoDWbbA0d3lofLwqj9T2mSKIf5imUbWOf+iuMJC+yJE2cjFDnleUTwl4IhLJMU3MbkWLKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
Date: Thu, 4 Nov 2021 17:36:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
CC: bertrand.marquis@arm.com, wei.chen@arm.com, iwj@xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211104141206.25153-1-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211104141206.25153-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0030.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a25ad3f4-461a-4367-7746-08d99fb13632
X-MS-TrafficTypeDiagnostic: VI1PR04MB2960:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2960FC7E5627006A28D08988B38D9@VI1PR04MB2960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:245;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DD+0C0I3FE8R7uAIMN+fxGA3fbMjPvPBHO1Vfbfpo0uDhQHkMW4CJSBPRi88xMg1T8NUsRF2azXN3StSSGfFi2t+oXozR31f5AazAi1qz2zPyLJe16Qoea6HQDIi4MRkQGot81VDwmty/PgyTb+f8o4h93DmVxwKmLhPGmPhqsAGToZYkxeL2b9APNJe8p2R0OBrB1ZfuIHSAw0kkk74RqeAoGIHoANHSp8jWyAUDMNlQcGK4AqDlZzLCoJ1FTFXKH0FvOrjWW2FEMUf39mbGN7c26SfMErDFzH2FzYeOLuBY1RU8zqZApqiZityi0ITgp8drkQ7BLJm3gqc+cMGGjSCPdGSbbA3Qouq+NBHT+/+UdAKiWPLDKhgo7QjbaKtzQ2qnSM5FgRpC+2WWI38WKGWEavuD2G0UCnu0bs2wQ+Es636jrkgodzre0+M9SREkrY7NT+bzKjvhJ+PsNQ6PY+CdnMMCwD/EZjezLP53cSsTDfG9lILu8eLy3EZBwMK9rqHNkn/S3Gge4XPpkUVnZOYXfr26ZROk6a3IQ+v9j+gMwC2Yn1ifKMMLxcrIxvJJ6aglGZhO4n7gxlGa1zplT12O3qJG4RnPUIHb5I3SA0cUgZbLhTFSfKyfWky1nedenjzpqMLu7i1ncCh0HucwYahlr8Mc8PE0x0GzhxqRPuYaE302KxipceL8iLaqVBxkcKjZ/UyPP8efD/svnRYXMWyQUO3GubxvV944Anymzz+cXrcwgudMN6NKlp+lTX4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(26005)(53546011)(8936002)(36756003)(16576012)(6916009)(38100700002)(5660300002)(4326008)(2906002)(86362001)(316002)(186003)(8676002)(956004)(66476007)(31696002)(31686004)(66556008)(508600001)(83380400001)(6486002)(2616005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?spe7W9vTPda8BQHbU7aHXisizZt93jupKeqpoQ7Ri23zS5h+y7uKMmxfPxO6?=
 =?us-ascii?Q?GkEhu11q31sctWvdGswuby/f342ysNWee0BNslemjBTjlRNJOmwSbEyQYY1w?=
 =?us-ascii?Q?qU8/CQUWOEkeiBqnBYPdlkLMCz3xtTjOdWjtlOBfdiLUiBdEGbT+8V3SUCxm?=
 =?us-ascii?Q?IQeQhEzn+eLMsuAQsh+Rx9mgJ0v/b8+dUj2aFSlzd444BWVMelqhF37Cg+D5?=
 =?us-ascii?Q?FDBAJgr8Ikxbe7gWvDZT1ksJ/09fsRDQZ/TlxQvljMAV/AoFkV9UyezhVFia?=
 =?us-ascii?Q?DkJ06Dl9nOzwC1AojLmumGr2t4gY0O5vPMuHL+SheTE07XeSVEMKnTEKpUO+?=
 =?us-ascii?Q?udRr449pYjQLKeJMRjsj/bfIO11zxKIhb7V2yijasbc/LkE7MvGwE6VuNPjh?=
 =?us-ascii?Q?bxTLvgK6xsaG4D7qmjZUICZZnxKfSfqPZSJOn6ytvvFYtuLSiyfZpt6CNta4?=
 =?us-ascii?Q?LuYLV1GbOeYBnC1zPUmAaNRZw9hhfcHs264EZfprpWGDxGzROim8+j0k486Z?=
 =?us-ascii?Q?KLdNMEgSPOzHVKhBB6veSdodVOZh/WuzhTmDsAt6vJapY4vxnrBpCHJ59NNt?=
 =?us-ascii?Q?/5jb1SuL09+f79VOXiEKATW26yoXrvi/pbk6boKwOInpeDieOW6kwXd0HnG0?=
 =?us-ascii?Q?1mTUz6ELLTQ8CGJJIHpzT/Qx8Es10XN3StLx2u34pegoTgc0sw7DU1tG4d3C?=
 =?us-ascii?Q?XmqI/N1/H1p+CgYERMiphCLw0LFhgTTcViRlS0QHyw7Vf0FOPcy8MkXhotPQ?=
 =?us-ascii?Q?2uQavT4xjbOUfO2tq6hGNEYHHM3zT/NDv9GmcLQu+o9HFT9Kq3nPmKqIG+ZH?=
 =?us-ascii?Q?i6pwi61VReLU5S67jMYZCDgTcx3WcIiInIYNzWYcyzB+gdypLHfgCgaM/l5L?=
 =?us-ascii?Q?Jf1JePBZKQPXRzIy4Qdz3bG+ngPg5y4A/RvKk4jZ6Cg8XuKZMEwUwwFLdqeg?=
 =?us-ascii?Q?XUQM/a7csQSvv9GbAAFYXB6H2UQWV61iEJ7twwWQ6j5GFWgO+Pf7xKWDiCEB?=
 =?us-ascii?Q?SaNYEQsQdJ1gFddCyBVSuYbFsmkpdPwGevDlSjCMtsJE1LU4Gsblb8BlFdEc?=
 =?us-ascii?Q?k9UT33UOh0PVtoMXOu3oag3VfaC0jvcZ+zvEMEUoeGtw/pn15VdPTx1hF30/?=
 =?us-ascii?Q?bYDoUZIHeHBAIQokif61i2Q5sRVW1jzWRNRQ8lobJ69xZwdy3Dc8B/3CmTOl?=
 =?us-ascii?Q?nDEOHmaJHOlBn+Dw/THRcMFloMo6nelTVBZ5yA0pp7gIU1BLCHnF+C7tIcn1?=
 =?us-ascii?Q?nbL40K/QGGd9sdQ0m3jHjtt0zjdDrTfe998Yhj+sxMGX4n1cjytW2dWwLR0n?=
 =?us-ascii?Q?q6ZASMcytqr2hWyxWvOv6/9M+L17/SIdi35CG+x/ZDmztJ40dpWdCvKXxt3K?=
 =?us-ascii?Q?880lKeYME9h6WRn7azWBojfJuKUl5kg+E5sbooCD+jZgSSi7CHoA8usveb6s?=
 =?us-ascii?Q?5wrX2MJ2XmVRcIwnKljU3Pz2n7XJlmq7d4qeGP/GOf9taAti7K0Iadd49cTo?=
 =?us-ascii?Q?cE+JeRQzZwKMHMCMH4LBVYmuu+ueBMye+WS9HNhVQdnzFaEh6Wp2+YLgo0yL?=
 =?us-ascii?Q?5vO/TtPD1MqotMzKmfFUQysKesyInFl3auytO0NGgP4SgfBr0lIwBfJZ2Lzj?=
 =?us-ascii?Q?qQbhdG9iXu+oSbDXPpzByoA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25ad3f4-461a-4367-7746-08d99fb13632
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 16:36:11.8209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRSkrNOv+Be9LGUbi5q0IGbT24Zti5Goq9x8hy+LBhkqCZ0KJzs8of3C7R7RWTMjo7zsWwz8PqaTyZj4csAwSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2960

On 04.11.2021 15:12, Luca Fancellu wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -449,6 +449,15 @@ static EFI_FILE_HANDLE __init get_parent_handle(EFI_=
LOADED_IMAGE *loaded_image,
>      CHAR16 *pathend, *ptr;
>      EFI_STATUS ret;
> =20
> +    /*
> +     * Grub2 running on top of EDK2 has been observed to supply a NULL
> +     * DeviceHandle. We can't use that to gain access to the filesystem.
> +     * However the system can still boot if it doesn=E2=80=99t require a=
ccess to the
> +     * filesystem.
> +     */
> +    if ( !loaded_image->DeviceHandle )
> +        return NULL;
> +
>      do {
>          EFI_FILE_IO_INTERFACE *fio;
> =20
> @@ -581,6 +590,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_hand=
le, CHAR16 *name,
>      EFI_STATUS ret;
>      const CHAR16 *what =3D NULL;
> =20
> +    if ( !dir_handle )
> +        blexit(L"Error: No access to the filesystem");
>      if ( !name )
>          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
>      ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
> @@ -1333,8 +1344,18 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>              EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image,
>                                                         &file_name);
> =20
> -            handle->Close(handle);
> -            *argv =3D file_name;
> +            if ( !handle )
> +            {
> +                PrintErr(L"Error retrieving image name: no filesystem ac=
cess."
> +                         L" Setting default to xen.efi");
> +                PrintErr(newline);
> +                *argv =3D L"xen.efi";
> +            }
> +            else
> +            {
> +                handle->Close(handle);
> +                *argv =3D file_name;
> +            }
>          }
> =20
>          name.s =3D get_value(&cfg, section.s, "options");
> @@ -1369,7 +1390,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
>      /* Get the number of boot modules specified on the DT or an error (<=
0) */
>      dt_modules_found =3D efi_check_dt_boot(dir_handle);
> =20
> -    dir_handle->Close(dir_handle);
> +    if ( dir_handle )
> +        dir_handle->Close(dir_handle);
> =20
>      if ( dt_modules_found < 0 )
>          /* efi_check_dt_boot throws some error */
>=20

I'm sorry, but I think we need to take a step back here and revisit
the earlier change. If that hadn't moved obtaining dir_handle out by
one level of scope, nothing bad would have happened to the case that
you're now trying to fix, I understand? So perhaps that part wants
undoing, with efi_check_dt_boot() instead getting passed loaded_image.
That way, down the call tree the needed handle can be obtained via
another call to get_parent_handle(), and quite likely in the scenario
you're trying to fix here execution wouldn't even make it there. This
then wouldn't be much different to the image name retrieval calling
get_parent_handle() a 2nd time, rather than trying to re-use
dir_handle.

Net effect being that I think get_parent_handle() would then again
only be called when the returned handle is actually needed, and hence
when failure of HandleProtocol() (for DeviceHandle being NULL just
like for any other reason) is indeed an error that needs reporting.

Jan


