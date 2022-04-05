Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D844F38EE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 16:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299172.509674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbkIv-00066u-UQ; Tue, 05 Apr 2022 14:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299172.509674; Tue, 05 Apr 2022 14:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbkIv-000652-RL; Tue, 05 Apr 2022 14:37:09 +0000
Received: by outflank-mailman (input) for mailman id 299172;
 Tue, 05 Apr 2022 14:37:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbkIu-00064u-60
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 14:37:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de29a5e7-b4ed-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 16:37:07 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-OLyY-__DMm-gUM6jHa0NvA-1; Tue, 05 Apr 2022 16:37:04 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5184.eurprd04.prod.outlook.com (2603:10a6:803:5d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 14:36:55 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 14:36:54 +0000
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
X-Inumbo-ID: de29a5e7-b4ed-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649169426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RejAs+ltWnotOnxYk2L0jXevPiCOOTFWoxIUJBpfot8=;
	b=YSHR34gYS3azQR6KaG/gdD0KNRcikZltSmQY+1GtO0Dw59vieaoNDSWWKjYmsPS5yF0FBk
	BFjDRfdHrYHpr7e77Gwm1sV7IXNyRplSyqynIWn/fiebLphFtLbdQ7NzpTVU8mg8LBHC8t
	4ewf+m+1+FIzV4kAntdy8lFs2wyeJZ4=
X-MC-Unique: OLyY-__DMm-gUM6jHa0NvA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/2K8xYU3YXs80EmHR6SohJ25DOcqCcmiVYplT/KTCw9TfIVNp6k9ifIF/0uDWIEcsPKSv5K7VLAzERUlN/sZLbqgPcuurgAnczmZWa2luKC8nBkI9LE8S56RstPC74EcJgL8z6YT23z4i/xY2iuyofO9BNaSaq8gKg9I0wv9J7yiQLlh3pnzk6/C7XlF1AxulM0PT6P0NJgIdXXU7KdIqXHpqvRKMeN7j0sp9cJNYAIlePhw9C/7cEHC59r/aG8UMQVrcTYqDPU1a8nczZxacd/kuDtur0/CRVWd69v5S62tUdzeJty4UQCgr6U7d3gxhuHs5dUdDWCFBaxuNhghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYMc+9vF5aGxOqyjc+t2RiOpGTJIvPRufxcCj9qCDVQ=;
 b=eLCtM9pDMtMqEr9WuNRY29HxLh968BK+uEAIyQT+pJOnfyWjJ/6QJGceGXzmJdABhlO371ZIBvCMh8oTiXrQVU18p/rfgO5EZIl1Hf+KbWfSNmqOcji0YK8Z2dYK89fJFytjf6QjwgoojJhRlItJBDbp/X4UeG3F1YeNZ2cLqcZfH1qdLHjLmDw5MEDgoPfUMseJHgtseL4OpL3/osNPkE36/L01dNS8kqOTL2ZoQVubaE3bVKrfoC34cEr8OMZ/6lJ9h2JTQAoBmtGcIbfQfxyd1HsanuolkLKZ1K3QBPTY49n7Q2Xgg/24RBlDyjhOYv7kmkERo3rHokppt+SPJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39640fec-de8d-0c5a-c9aa-daf83fb785b0@suse.com>
Date: Tue, 5 Apr 2022 16:36:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 3/8] x86/EFI: retrieve EDID
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
 <YkwZnBIOQ/jwzq9Y@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkwZnBIOQ/jwzq9Y@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0093.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::34) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e01333f-2936-4c14-53d1-08da1711bb00
X-MS-TrafficTypeDiagnostic: VI1PR04MB5184:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5184C5950397C42DD9D86AD7B3E49@VI1PR04MB5184.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RzSo2VGEHpFic0GBjXuZe7BfzUW2mQM3z33pJt8p4ej+T5nz5pQv0OBuD3nxKvoKV7pp18mXz6Igr8N9MUKEows2UTy87XF2XhcYOdZoHw9hH6bshH9VZ9o9EyWo+nXiUK9nhV6f6m1tODVNgwo5CSpLjJMEiIuWVzOitq0dTkfGrBjZa5N92/PJfd3z/E7saAVM1o0GPDvKlvUqfYtds48rQggaU2Jw4nQ18ltVg4wXX2gnB6WeF6DXGzPuttift3fcOBVKGNgnqnALNyoYf/a7AQmotV8t8wJrig/c0kT40lc+expmTXH53ihJtx8I4SZNDaHfc4HgscPMtPKA0cS5O10jw5WsliexFdjH6JXfGXO2GoyUdI8UJbH4MeRQvwR4z3UrHUDoaIx3djJRukdLKDwZw5Zn2SwVn6GEOl+8QpB+E8QuNTKW3tuISzDOZuK8vdJ004WhVD2V7mckM7sc3ZSyqK7a/ZAGjbn//jaZSdYLElVFa5Bv8TAu09ERR7CzBGhCQt4dvAyAiRYn6tYZzteJy+Pie64b2D+Siak0/ZnNarpkxcdGqoe0hPRmy7TurDrwQ2gtVRRsC8WWZdwEa9vHBhLGCMnNNnn5m+HYzNMcCsL0PhbbZurypHcrlE9Jd69qiL5gpYZtZ4+ipJscpFA5v2QAOcYdEyj5D2YMuYxZjkoL8yV2j4asSuDO7UMNsA7KsswbaETz73b4ewOb5eKigKn+Wo4JKUBNdyU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(83380400001)(36756003)(26005)(2906002)(31686004)(2616005)(4326008)(8676002)(66556008)(5660300002)(316002)(6916009)(66476007)(8936002)(54906003)(6486002)(508600001)(6512007)(53546011)(66946007)(31696002)(86362001)(6506007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pkfNcw3Y0Urm/iLiMnFHAGpbmLSxtTfMoVfX82/3uYDQBecf6YID2QyyR/wy?=
 =?us-ascii?Q?jMKUx4Yd8T365tIEtl4ee49WIItVWnjEOkudUzYq6+TUgbGNEgKGT38FwQgC?=
 =?us-ascii?Q?Fa+DiOhSkzCz8MkGwJapCw+R2jk1sZMSNDSDryj1Nhs2gN9VlgGtFBpBidJe?=
 =?us-ascii?Q?Om9ZHNoFD+Wd8h2crS47SPIu5Tragl+z5fCMbc2ibE29HmDkPe6XrmbajK/H?=
 =?us-ascii?Q?QYOQUJ5PkiywT2LPfMOFT3CKUOS4p1bkISzGbfZWhbutKRyg389gMdI/Kk98?=
 =?us-ascii?Q?JChbPa1qGtR5qTKqZTR/+tHpNV/DdJs1I/33PmYwLXmrGLtGIQKdVKmdSNzU?=
 =?us-ascii?Q?IAz+HyH9jsJCxOYMlAqCmc5BqDOAaqdhm8gVXYGN7pj2y4kHGU+WLiFw8vUX?=
 =?us-ascii?Q?2lL3V+NfD0U709+GJbg7/US8+P3i+TuK0asFMYkHWFWyp9S+Uo636PsrU9K5?=
 =?us-ascii?Q?9YsYiG8VS6mzS7Is1sLhDE39WOURmUZ0FGUILv345mG/C5p9UGkFIuhv0lio?=
 =?us-ascii?Q?EhrBrlr+fCRAdPnlAk3F0EPinquJ6+vXHfDIOOv2D5BsOsYDCYbKxQ3opXtK?=
 =?us-ascii?Q?QklEIDYzItiIb/ii9qHbaTiRxWbI8+OeNCBdhXFnN/r8H1da3Ca4BQiL34hE?=
 =?us-ascii?Q?LlREtq7G3MXLEe2JgfN0RH1lQYBjE4UZjmTDa67XRA++LaCarMD3y6CouR85?=
 =?us-ascii?Q?UN7vcAqBBr02hNtu6isiLSGBsyh7tAkuiIdCxy+L+2a4Bsv7Y2x/W3s+ejhY?=
 =?us-ascii?Q?QHhz/R1FUWADKbfDysOqj3l4zx/GJUg2iZk9jYUif98Hvd8QBLgIKKTANClt?=
 =?us-ascii?Q?ckFU89jBO14VdALUe1IztHFkH4cy/UrDQXRlUzPSl3ghe9ErrEqhlJGY6azA?=
 =?us-ascii?Q?HJlzwfeHhI6NAzAbvlUnhjFQHoIEwICMYWolqp/8YtIaT3jCuLOkCSrwvXAa?=
 =?us-ascii?Q?N/157390EW95+Pv0zzu83FyVJijup/xWVWEXm02mT1MAL1Be95SIS7qVnjh+?=
 =?us-ascii?Q?ku1btV7Kekz6t1zl0W/uSxljfuag3rE/xV00kJXCYmLbDkszLPX3JuSENO8H?=
 =?us-ascii?Q?Z1Efxugkrs74//tMoBDBTYmmlnTcrGLTuAAZSuogujOchPCcmMGjQO3BPQ84?=
 =?us-ascii?Q?z2ttoqVBAPJZuH0/lf5K3onQ2ZxVG+7iABZv/osQq3XSch8YG+S1ao4vthO3?=
 =?us-ascii?Q?DyCgA82zgV0z0vTYt5dJz8+VwEi2cU2vY7qhcPPIxJuKXLIGLNYVxID8Pu3t?=
 =?us-ascii?Q?2JqH8cY78OZe7ADhsbWJ1hB1KsEsQJhYaiVz9uQTTZf0Pfc3A45hdCFgXiMm?=
 =?us-ascii?Q?Sn6N6loJIBgT55NUrhlQr/TwELrz60AXmi/1pvjIjDLo2xK44GToVxdBuZTi?=
 =?us-ascii?Q?P0KucxALg5icumvxMq6xa386l7NWeshgHbpAp1Rsjy4w85iu/l09Yx7K6evM?=
 =?us-ascii?Q?FWzXJBK+s2ynUkHaeyQ3qTKKqEMtzVKaXEtGVbAUIYaAXnjpH/D3i3QYc0qj?=
 =?us-ascii?Q?oYkktqDfmNNsK0OAFZWs+l+MSH04e7ESaCzP2sexva1XYu0KmkDx9Cx47xK6?=
 =?us-ascii?Q?jI3RL1lJVtxLBFd4dmpxE9egXB2eGtwRWUbdr+mTLKsKfF48hkaxZhQgR18n?=
 =?us-ascii?Q?p1tQWAdOz+sE31Sij2YmjibYozmSMdKrn5vp2dCqBZj2xjB5ZlKrdsURvLWs?=
 =?us-ascii?Q?y/z1gezBAQjBrIrwUOF18aKQPzy4kpqm9zVp2KtzLOt5BdLYkyN8Xcl1UqxK?=
 =?us-ascii?Q?6YN3k+z5Bw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e01333f-2936-4c14-53d1-08da1711bb00
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 14:36:54.7464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfOxvfv0wyG6XWtCsUoP15LBNbEKjoSnn4cxuOsOLFudRDrnxbdLcL6yJHB9G2dsIHl+/KyvzRpXTuiegN13RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5184

On 05.04.2022 12:27, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 31, 2022 at 11:45:36AM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -568,6 +568,49 @@ static void __init efi_arch_video_init(E
>>  #endif
>>  }
>> =20
>> +#ifdef CONFIG_VIDEO
>> +static bool __init copy_edid(const void *buf, unsigned int size)
>> +{
>> +    /*
>> +     * Be conservative - for both undersized and oversized blobs it is =
unclear
>> +     * what to actually do with them. The more that unlike the VESA BIO=
S
>> +     * interface we also have no associated "capabilities" value (which=
 might
>> +     * carry a hint as to possible interpretation).
>> +     */
>> +    if ( size !=3D ARRAY_SIZE(boot_edid_info) )
>> +        return false;
>> +
>> +    memcpy(boot_edid_info, buf, size);
>> +    boot_edid_caps =3D 0;
>> +
>> +    return true;
>> +}
>> +#endif
>> +
>> +static void __init efi_arch_edid(EFI_HANDLE gop_handle)
>> +{
>> +#ifdef CONFIG_VIDEO
>> +    static EFI_GUID __initdata active_guid =3D EFI_EDID_ACTIVE_PROTOCOL=
_GUID;
>> +    static EFI_GUID __initdata discovered_guid =3D EFI_EDID_DISCOVERED_=
PROTOCOL_GUID;
>=20
> Is there a need to make those static?
>=20
> I think this function is either called from efi_start or
> efi_multiboot, but there aren't multiple calls to it? (also both
> parameters are IN only, so not to be changed by the EFI method?
>=20
> I have the feeling setting them to static is done because they can't
> be set to const?

Even if they could be const, they ought to also be static. They don't
strictly need to be, but without "static" code will be generated to
populate the on-stack variables; quite possibly the compiler would
even allocate an unnamed static variable and memcpy() from there onto
the stack.

>> +    EFI_EDID_ACTIVE_PROTOCOL *active_edid;
>> +    EFI_EDID_DISCOVERED_PROTOCOL *discovered_edid;
>> +    EFI_STATUS status;
>> +
>> +    status =3D efi_bs->OpenProtocol(gop_handle, &active_guid,
>> +                                  (void **)&active_edid, efi_ih, NULL,
>> +                                  EFI_OPEN_PROTOCOL_GET_PROTOCOL);
>> +    if ( status =3D=3D EFI_SUCCESS &&
>> +         copy_edid(active_edid->Edid, active_edid->SizeOfEdid) )
>> +        return;
>=20
> Isn't it enough to just call EFI_EDID_ACTIVE_PROTOCOL_GUID?
>=20
> From my reading of the UEFI spec this will either return
> EFI_EDID_OVERRIDE_PROTOCOL_GUID or EFI_EDID_DISCOVERED_PROTOCOL_GUID.
> If EFI_EDID_OVERRIDE_PROTOCOL is set it must be used, and hence
> falling back to EFI_EDID_DISCOVERED_PROTOCOL_GUID if
> EFI_EDID_ACTIVE_PROTOCOL_GUID cannot be parsed would likely mean
> ignoring EFI_EDID_OVERRIDE_PROTOCOL?

That's the theory. As per one of the post-commit-message remarks I had
looked at what GrUB does, and I decided to follow its behavior in this
regard, assuming they do what they do to work around quirks. As said
in the remark, I didn't want to go as far as also cloning their use of
the undocumented (afaik) "agp-internal-edid" variable.

>> --- a/xen/include/efi/efiprot.h
>> +++ b/xen/include/efi/efiprot.h
>> @@ -724,5 +724,52 @@ struct _EFI_GRAPHICS_OUTPUT_PROTOCOL {
>>    EFI_GRAPHICS_OUTPUT_PROTOCOL_BLT         Blt;
>>    EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE        *Mode;
>>  };
>> +
>> +/*
>> + * EFI EDID Discovered Protocol
>> + * UEFI Specification Version 2.5 Section 11.9
>> + */
>> +#define EFI_EDID_DISCOVERED_PROTOCOL_GUID \
>> +    { 0x1C0C34F6, 0xD380, 0x41FA, { 0xA0, 0x49, 0x8a, 0xD0, 0x6C, 0x1A,=
 0x66, 0xAA} }
>> +
>> +typedef struct _EFI_EDID_DISCOVERED_PROTOCOL {
>> +    UINT32   SizeOfEdid;
>> +    UINT8   *Edid;
>> +} EFI_EDID_DISCOVERED_PROTOCOL;
>> +
>> +/*
>> + * EFI EDID Active Protocol
>> + * UEFI Specification Version 2.5 Section 11.9
>> + */
>> +#define EFI_EDID_ACTIVE_PROTOCOL_GUID \
>> +    { 0xBD8C1056, 0x9F36, 0x44EC, { 0x92, 0xA8, 0xA6, 0x33, 0x7F, 0x81,=
 0x79, 0x86} }
>> +
>> +typedef struct _EFI_EDID_ACTIVE_PROTOCOL {
>> +    UINT32   SizeOfEdid;
>> +    UINT8   *Edid;
>> +} EFI_EDID_ACTIVE_PROTOCOL;
>> +
>> +/*
>> + * EFI EDID Override Protocol
>> + * UEFI Specification Version 2.5 Section 11.9
>> + */
>> +#define EFI_EDID_OVERRIDE_PROTOCOL_GUID \
>> +    { 0x48ECB431, 0xFB72, 0x45C0, { 0xA9, 0x22, 0xF4, 0x58, 0xFE, 0x04,=
 0x0B, 0xD5} }
>> +
>> +INTERFACE_DECL(_EFI_EDID_OVERRIDE_PROTOCOL);
>> +
>> +typedef
>> +EFI_STATUS
>> +(EFIAPI *EFI_EDID_OVERRIDE_PROTOCOL_GET_EDID) (
>> +  IN      struct _EFI_EDID_OVERRIDE_PROTOCOL   *This,
>> +  IN      EFI_HANDLE                           *ChildHandle,
>> +  OUT     UINT32                               *Attributes,
>> +  IN OUT  UINTN                                *EdidSize,
>> +  IN OUT  UINT8                               **Edid);
>> +
>> +typedef struct _EFI_EDID_OVERRIDE_PROTOCOL {
>> +    EFI_EDID_OVERRIDE_PROTOCOL_GET_EDID  GetEdid;
>> +} EFI_EDID_OVERRIDE_PROTOCOL;
>> +
>>  #endif
>=20
> FWIW, EFI_EDID_OVERRIDE_PROTOCOL_GUID is not used by the patch, so I
> guess it's introduced for completeness (or because it's used by
> further patches).

Indeed (the former; there's no use in later patches).

Jan


