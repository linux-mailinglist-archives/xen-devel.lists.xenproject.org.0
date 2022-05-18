Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA7A52B66F
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 11:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331801.555393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGAd-0004WT-8C; Wed, 18 May 2022 09:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331801.555393; Wed, 18 May 2022 09:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGAd-0004Tb-4P; Wed, 18 May 2022 09:40:43 +0000
Received: by outflank-mailman (input) for mailman id 331801;
 Wed, 18 May 2022 09:40:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrGAa-0004TV-Rh
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 09:40:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 939953df-d68e-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 11:40:39 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-BFha0umgO7u1dMpyPEGIlg-1; Wed, 18 May 2022 11:40:38 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3122.eurprd04.prod.outlook.com (2603:10a6:206:e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 09:40:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 09:40:36 +0000
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
X-Inumbo-ID: 939953df-d68e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652866839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kR4aguezniYjyWzhm8D0nCH6aT54bM3D5HpG3FdurXY=;
	b=j0pl1HmPt0DpUVHmtj6rG4E20nwslkQdmE4SY/gmmirH7C4Gl7jWl+veK1radZCp1B2I4j
	Yvkb4ZqoLozwVekddcGA07y7Wcegy1KMk2JFLBqtpwYFzOBB9ZV8mPawLqhr9kMExrZxJH
	rJ4I2ZdHJtH+o3szHD7kfKRzrd5tnAw=
X-MC-Unique: BFha0umgO7u1dMpyPEGIlg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgvUvGTkCw8+kiCpiOR1J4SVauYWlXF7uGjls26VTAtVOl7DO9PiL4XWQmxoCekkxmStI4LezMIMUWSSApYiAKUUrwiRtS9CgIatkAA69gO6hji80+wxtl65GcbcueYO0iIqxXfVTePoydLSocLNhDJ0zuVqbaSYBK1IFm6C2GIY0Ay+/+nDkkvTWRFLru3zH8gHnOkoSFGz/9gT3+wx3QsKupBocvsFgbM+mGbHFXO4niRkSOzvn7N6iYzPM7wZ8oVv96iXz9d0f/WsUQcY1quH2SsSMH2QcroM6SwAXb4iwa+OODzXv26XpnCRpoJG8JCSJ51dR8An0h14h4jIDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR4aguezniYjyWzhm8D0nCH6aT54bM3D5HpG3FdurXY=;
 b=oSHgl8BINd/a1gay5J6w2WwGmRVtJMXZI0OZQM/xCozSGooxQGQ0IskIYs0uGUJfUfjYpFsYP8UmMpFFvtbqdV9McK111NJhBvensdxXFbbmMV+YQ0hnXGmlrXDqYiYWrblezl3uVlbLMvP52lohY6yiD/ayOf0WboGHE7n59jI7SAPDqyu/SDRe897K5qFYC7cdJaGUQpoGiMFAs3t82vWcYXtwGKRigQNrCDM2/nW+99lWA60YuZBKpVUodAHDVapU185FtYxBzFK1dONlahoEZjxWBXDYdH2EfLZRNkqcxpRtAOh4p2mo5tQO99YW4qKzI9UUZD4dTXmGF4DIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2ffb170-b63c-34d1-3d5c-5f473c5c95cb@suse.com>
Date: Wed, 18 May 2022 11:40:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YoPWX7lQH4ZmxV9u@itl-email>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoPWX7lQH4ZmxV9u@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0137.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5c70342-474a-4d08-bb15-08da38b27640
X-MS-TrafficTypeDiagnostic: AM5PR04MB3122:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB312240941B82B070D1C177B6B3D19@AM5PR04MB3122.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UNeQIN6ceotfuvOGWdHGuCM+BAHbd0j+43EA0F8VTz+JnCoDZ/PPwUShsNfpmGPbit1ezYkgrZ9HebQJ1NKej2HPXcKf5jZyjRBkfQNr1XDLjHyaLeeE3bC394cgxEbtEvprdJqyRVwY4iD/CjJ2xsjryaH8tSInsD3ZFceJP6uRJOpKZBE9d/XwJZPnqVUWNk4oaFFmYKVODhYtOYyT/MMa+s+37tmIlEEBGZGf4t0Z2endkWcEb7VM/4FBJV07pqpitJH1BJ23/TXrGCSBFB7sXe7551RdrbbO5Fx3dmvPWh+eWNHNDcuBikfuqv/WwIXc6yXZyyLiOaB+BDEixF5NJ9yoyt1aKuMDabssgRPfkVwB6AkoOKFDE80OdEOyAslpD69qBON310x/abPvufLZvO5XcWfeOx9u52kV0tfi4S5hqVMMUOpixStepSc7sqyUmycwbEeGCzzokc4KOBs4ae5HBcXt+J8Df/RXietSJbKDuFkWw8ZTOeWAS56zEopvWLAe/xJELkvIPAmKvod8eCbNIDT/v8Wa2PgoReEs9hu2xJRMAB9/ESVWGmeER3Evip98kbOZKvZ7sm8cu4GDieDDzyIIDaf2n5bu8qZsoYO3w55MIuf76ym0wh67hBMdc22cKUChClsXYOhEsxy/vWQb5/jQY/J0fPAtmrf8pc/si7lCSpb+72nEhuyAprR9Gdv5UI1B1XfUo3/qVk/ePo/aIp3PmvrpXnTAshM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(53546011)(6512007)(6506007)(186003)(5660300002)(8936002)(66556008)(86362001)(8676002)(4326008)(66476007)(66946007)(2906002)(26005)(36756003)(38100700002)(31696002)(31686004)(316002)(6916009)(508600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmZvQTF3dXd0NkFHMzBZV2JHQ01LcEplSnRVaDZqSUpvNFQ1cE5GVVgxVFcw?=
 =?utf-8?B?YW85UXlFVDl5NW9sOWVhYlpjZGxMWlRMZkZFR1JmK2orUnVjV01lNnJTbzd1?=
 =?utf-8?B?YzJva2JkMERGYlVqRUJrd3lTNDlxWVpYTkpreC9RZmZrZWNPNVVrSUFYMkIr?=
 =?utf-8?B?WE0yUmVxZkw1cTNJaU14K1FRb2U1MWVaeHBwWUtDOTNMa1ZubXc2OWRUUmVW?=
 =?utf-8?B?SS80QmFSdFFvTVFOcnJkenBDd2RGWDFUN3VyMWZmaVZBQnR3N2hWVytRWlQy?=
 =?utf-8?B?TlRONzhGRUQ5TlkyU2duNXVvcHJRK0VoRUVyaGxnMnVPK0RwcGdnZWNZNm5X?=
 =?utf-8?B?WnNBZ3hJWm5hNlRtMFJQSTRiVTJLaVBRWWRXOEppemVTQTdPYm9vMlhTUUlS?=
 =?utf-8?B?RnB6Z1ZuMFRwS24vbjBaQUhNUE9ycjROc2oyRkYyR2hKT0lRWVk2MTVCRmZN?=
 =?utf-8?B?WjFOOEFDaEJzSFV4VHRRODJneHpYY2V5YXB6VUhDUndBNXczQks2ajB2dXpm?=
 =?utf-8?B?Y0JiNU5GcjQ2ZlY5V3IxUW5uNTMzTTg2RktZUGdkcFdZZFZES1UrYUlUcFlt?=
 =?utf-8?B?Tm9RZEsvZHFtYjU3d1RiQWlHSW9hbXphMVQyN3E4NkNHczFXejgxMGxybExN?=
 =?utf-8?B?ajgxUitUeG4wR1JGcmtVNzR1Mkk5WFd2aHFtV0Y3WXowTHRscmQ3SWRlaVpz?=
 =?utf-8?B?blpwZWNqblE5WElvQzlIa1JJYUh0V0VuMUtXOVMrYXJBdzJURmpxSTBqWlpy?=
 =?utf-8?B?Z1JJUG01RndLZDR2T1BiUSthSzJGQkt3ZlhTV2pVSkg2QkZZNC9ydWErdXZW?=
 =?utf-8?B?TmxGZ1pqNHlnK2JscjFIdnZtYlNwWXY0REs2UUZXZHk1YWhtYzFIYzhkdTVS?=
 =?utf-8?B?QTJmbEUzZ1Fnb1IvS2p3MVpSNEJ2YUJyMmhTMkwyekpWc21MU1BVYitCTnpj?=
 =?utf-8?B?VGROYWw4OTN5dWRIdmtMOXl0eCtCQ05GR1RncGNLWjMyNFdVY21jTGFNZklH?=
 =?utf-8?B?cWlZeGlQWHdaNXdQYTloYUNVWExYM0dkWjI0Z3Y0Zlg3a3RYelB5YjFDZDBL?=
 =?utf-8?B?SFFjd2V4NHZ2SFpwMGt2S1dTVk04cUlXMFYwQUNHb3JzQ0NObUhpU0pVekZT?=
 =?utf-8?B?bDRQZldNaDhXQmM1S2Z3dFdQNEx1UEoyYi9qR29FNy95VjVBUnNxazE2N3FS?=
 =?utf-8?B?eklqT1RyTUlGMHFOUXRwNXNxNDBjYU5kUFJ6NVpuMXVNUC9sLzJDaDdrYVd1?=
 =?utf-8?B?MksrbGh1bHR2TWM2SHNYaEJydmxHdkRGT2R5ZkxNcEhXMlluSEg5bzFrdkFV?=
 =?utf-8?B?cHduRE1TM3owcDY3M0xzMlM2a29pODFxNDVOSHVTQlV4eGdJSnM3Ky9sRTJs?=
 =?utf-8?B?L09DWU5BdDZ4NHBoamd6cEZSR05rUlhUUFBNN00rVWhxWlkyYVhVVnRyMW01?=
 =?utf-8?B?UlZQRGR1cVVxbUFtb29qRHV6M1NUT1J4Rm4raXIyWTJqVjEyVkhLOU5pekVL?=
 =?utf-8?B?YmRLOUdLVDhYWGJRM1VMK2dCN2cxdWVYUDgxYStiS3I0S3d5MVZaZHFoUkJi?=
 =?utf-8?B?NEVTVy9RQVZiYlJmV2x3aHZyOEZsU1c3Q0p4UEFGa2NjV2J0VlJjNXFMdXJm?=
 =?utf-8?B?Uk5nQ21INUl6bTE0STVQS1ZxQWhFQ0xUcUZhSm8xUmVQakpsSkRGejdDSUVy?=
 =?utf-8?B?OEdUbjZzd0oyWndDeTBqYy9QNTlKZThrZWZNM3F5Vkg1VEZpekg3WStJSUkr?=
 =?utf-8?B?dld2ZW42TUM1ZWVnOThRZzVId2NaS0h2Y1dVWDYrNmNISTVIbmkyb0dHVWlE?=
 =?utf-8?B?QlFvV1kxZzJoaXIwNXlFNGo0QzdSOHNmMXk3dThoMlg4ZytnS2tQbDE1UjQ5?=
 =?utf-8?B?SDNmc2lUU2o4ZGo3M094Vms2N1A5a0JUQ3ZiMTF6TFd4L25qUzhaMzdCdnB0?=
 =?utf-8?B?UFRHdWJobkxIZGZyZXk0cUpRc25yOEZyaUsxRHFGNUNmYzhSUEpSMDh2NGhU?=
 =?utf-8?B?VmRBRS9wWVlqakRUSE5hWmFOS3c2SWdtbGZEdjF4d0h4aGJBT3dOMXFVWXg2?=
 =?utf-8?B?M2pwZXdZSFlHUHlXRFRCaXZTa0h1Z0s4dHdjYjlpT1NCRlVuMXpSdDBxRjBr?=
 =?utf-8?B?RzFQK1RZd0tRYmZ3Qm03Qmo1c3lWUWpwcS9WbllWUHBwNk8wbDVraDBMYXdm?=
 =?utf-8?B?VDhRSWt2UUlxRHVaaDRxSElyUjkxbk84bmVRa0JmRkQwc05hRWNiRlU3Mit4?=
 =?utf-8?B?Z3gyQWorc1JwTjk2ZHZXdXhNVkVoQzU5TTcrQVl5S3hOa1UwZWN3THEwSUJ6?=
 =?utf-8?B?a2FaSERSY1JKdldoVXZDWFhIMWJzQjdpcm1XNzBDeVRJN1pGdkpOZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c70342-474a-4d08-bb15-08da38b27640
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 09:40:36.7196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRF1p2ml1D/PqBS6ZrGXYzyGec6oTdn3/jEh+c4ULjky/kQPmCQ98as+SF/aS87vpkQpYPhYZVhx16WWlteJ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3122

On 17.05.2022 19:07, Demi Marie Obenour wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -39,6 +39,25 @@
>    { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
>  #define APPLE_PROPERTIES_PROTOCOL_GUID \
>    { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
> +#define ESRT_GUID    \
> +  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }

I'm sorry, but it looks like my earlier comments still weren't clear
enough: The spec calls this EFI_SYSTEM_RESOURCE_TABLE_GUID, ...

> +typedef struct _ESRT_ENTRY {

... has no tag here, ...

> +    EFI_GUID FwClass;
> +    UINT32 FwType;
> +    UINT32 FwVersion;
> +    UINT32 FwLowestSupportedVersion;
> +    UINT32 FwCapsuleFlags;
> +    UINT32 FwLastAttemptVersion;
> +    UINT32 FwLastAttemptStatus;
> +} ESRT_ENTRY;

... calls this EFI_SYSTEM_RESOURCE_ENTRY, ...

> +typedef struct _ESRT {

... again has no tag here, and ...

> +    UINT32 Count;
> +    UINT32 Max;
> +    UINT64 Version;
> +    ESRT_ENTRY Entries[];
> +} ESRT;

... calls this EFI_SYSTEM_RESOURCE_TABLE. Also some of the field
names still aren't matching the spec.

> @@ -1067,6 +1120,46 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      if ( !efi_memmap )
>          blexit(L"Unable to allocate memory for EFI memory map");
>  
> +    efi_memmap_size = info_size;
> +    status = SystemTable->BootServices->GetMemoryMap(&efi_memmap_size,
> +                                                     efi_memmap, &map_key,
> +                                                     &efi_mdesc_size,
> +                                                     &mdesc_ver);
> +    if ( EFI_ERROR(status) )
> +        PrintErrMesg(L"Cannot obtain memory map", status);
> +
> +    /* Try to obtain the ESRT.  Errors are not fatal. */
> +    for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
> +    {
> +        /*
> +         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
> +         * so that the memory it is in will not be used for other purposes.
> +         */
> +        void *new_esrt = NULL;
> +        size_t esrt_size = get_esrt_size(efi_memmap + i);
> +
> +        if ( !esrt_size )
> +            continue;
> +        if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type ==
> +             EfiRuntimeServicesData )
> +            break; /* ESRT already safe from reuse */
> +        status = efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size,
> +                                      &new_esrt);
> +        if ( status == EFI_SUCCESS && new_esrt )
> +        {
> +            memcpy(new_esrt, (void *)esrt, esrt_size);
> +            status = efi_bs->InstallConfigurationTable(&esrt_guid, new_esrt);
> +            if ( status != EFI_SUCCESS )
> +            {
> +                PrintStr(L"Cannot install new ESRT\r\n");

Perhaps better PrintErr() here and ...

> +                efi_bs->FreePool(new_esrt);
> +            }
> +        }
> +        else
> +            PrintStr(L"Cannot allocate memory for ESRT\r\n");

... here?

Jan


