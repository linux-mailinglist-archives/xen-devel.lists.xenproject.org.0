Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0BB4F5A76
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 12:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299808.511020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc2cM-0000Hy-LY; Wed, 06 Apr 2022 10:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299808.511020; Wed, 06 Apr 2022 10:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc2cM-0000FZ-I7; Wed, 06 Apr 2022 10:10:26 +0000
Received: by outflank-mailman (input) for mailman id 299808;
 Wed, 06 Apr 2022 10:10:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc2cK-0000FT-Jv
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 10:10:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c52f0e07-b591-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 12:10:22 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-mn5iOfhnP5GK3O57yKIPnQ-1; Wed, 06 Apr 2022 12:10:21 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5683.eurprd04.prod.outlook.com (2603:10a6:208:12b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 10:10:19 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 10:10:19 +0000
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
X-Inumbo-ID: c52f0e07-b591-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649239822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hG+rmv5Lh2TvFpSkOTjwuyENnTLiNL7BXoYJBj+oMs=;
	b=GZR9V6gqiw1vVXBEfYAm10siXXJqE014tnadn4lXTNKSUnAi04jxbh0VV405jIMROoyTuJ
	eJ5ZFC9zvfaHAxp0P449vbq2O0YkhwQ+mmW85mU2583UdJoJ43nVMuax5Mk9LDPATIGyNy
	KlKdOdUTo5zM8QafaCc2OJwygoA2bDw=
X-MC-Unique: mn5iOfhnP5GK3O57yKIPnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNhQsBFFBu9V84bZiEiw4UMh+pcvphD2lWDQcbYaHNGgXtM0Abh+yPHZx92V/uFmxR/V0Tpfoyz7DKp6578myPED0aLLeylfWYdqP8elgwZ1iOJm2mrirJJ/CrzUWd3/+xgNEAfs4uj7y5u5HIgOKWkYq4lHz9gyUjUw5HvgutT57zNwJXc2PyYF+KdsSkQyEgB2PNyNLzziVdTKcRHI0WhfYuj+Cvf4fBzxtZp2j8PIugtINBhoj0NXC22bxlnSms2roCwmi1r6F+hPInnW042VB1YvYRNsBBqI7Bqfhr6dUt38ZZA3cOvN7+n/Mgboc2WdKzIfbX59eOQkoEXlDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oJDKutwYXkEg3HQXrS9wP3QPbnRLnpvikP8gGPI3Ck=;
 b=S+nieOYTZ6ic4BceWmtM6bsfXm2ZNEJSFsxGWczL3BwDLu/zP//SAD4CUJ63L1W+iyGab90W3+avsI3CuCgPQqgYRd2pQTWus5rUXzaJSwSYIQAuVSzoRZSIesm6j9TmI8NK6s3voQXY/6mL78eTVXw02feL/QtPCoWcs2XJHB2lYtWlPEP23GmPuC9pzlECt/gwOO5gwDGxrwJnzCHyhhT/pj7x9WQDHhI6wOLQ0TmISMelhDMFfX+t2ktgI5Jplw0zSmKPi+8qOWw1/SacMBhr3XzNXkYMrD2uPuRuTM64ryfsYTfwRhdC5hPB0uWJdWU39eWBClbEXNQFDnKcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72ed7420-5f01-6cf4-b1fd-dd2186162a20@suse.com>
Date: Wed, 6 Apr 2022 12:10:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] Grab the EFI System Resource Table and check it
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <YkeHXFvgB3MwXnuR@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkeHXFvgB3MwXnuR@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0196.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6d3c27b-2734-4b08-edd5-08da17b5a75d
X-MS-TrafficTypeDiagnostic: AM0PR04MB5683:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB56834A15CDFFA82FDCF86FD6B3E79@AM0PR04MB5683.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	084o+sbbFtx8vhTTXRq0k8Imz8gqfwSdCMW/FqXkhF3KE2/9a8/xqXxNaV5gn0sMZEqqo24pYC1HeZtNUG/+vJpzHkWn5F3SNPqIdblFAYsHKAFU1VckxmM2JrnyLCusUDscWyT0wsAL9bGORuWIvgwjojWhYntSrARfRVBd3j8uVM/uJgBeVfapM5vr9Jk9q4m8HH718VYLbb8UkvkrfzFXzbvTmILPf9DJzLkVqOEluzfclpSToUhM/PfslbXoc4JyXQ7+/UZ8iri0sC0RnRFTuo35pamjtMBddpnwgFiIXGr3VL8HRBb0y/FP+/A8NZuBdKB/8+OSeii7lKN9OMRLwUFDQsUSPiYasGtM6b1Y3Xk9Ddf7JfjzY8JehS+Kd773Nad207zMoti/m5cHDVC02T95770kjE6vWhxUVF/dcnadNXTHHe/GHrEDA0OUZpkEWoTmlVG1KKlNP4mBuQ4JitdPIUJZY4iGGtoJ3GpeqbDX27/aIFAPNU55Hwd3Wex8FqvHXyZCRNrM6bCD96eu+g7gl5mQ1Ki/+PYqEqxoDLtsItdBIe9cnzUt9q5TLw/CxSPsHcjL0mErJA534PiEFrkCH1gf1jWEyDpAJkpW8zHtRLeg4J/vi92lmY1z06JOrm1Y8umW51idOXh5C/ZD4bnnXp3i/PN+L5BNRkoFJ34L1Q89aPHCWCOgtvu/tRejsLbPllyMoTdRBRCGG2yM1c1I5ySipa8V44z4bAfE1vHP7vGrXbQd3Rkqtln+OTznH+A0yysIWQupJQX4IInGTQQo8zcdjRVQrSt34SkklDBgGAjr11HDTw74b6cM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(38100700002)(86362001)(8936002)(26005)(5660300002)(2906002)(186003)(31696002)(966005)(6486002)(508600001)(4326008)(6506007)(66946007)(66556008)(66476007)(8676002)(6916009)(316002)(31686004)(36756003)(54906003)(6512007)(53546011)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jx2jNHIJZf2GhUCC+2glDUekqc+z6Mvlwn2GlMWljA2ocfe7HXtC43Mv7Sxs?=
 =?us-ascii?Q?dnbgYC9poU0hhFuhL5TO0jjbwZIt1uZea9WBR3KENSjqp4axqT3ocZeXlrwg?=
 =?us-ascii?Q?poQ+bp5F8hH6kT+LBjJ+HW7L28fLYSwrnWjWYE3IS4WpPj6G1PI8/psFENI1?=
 =?us-ascii?Q?kiYcnVn8bUqsUHmZjhN6rAkjkmSj/aEk4VMUIKEDF94Gtqq7/byBVhRgDm9h?=
 =?us-ascii?Q?yNsEVWV6IyCWd9RD5ZoV4T3Id/nXnsoFrlXg/czDE+cjySp7i4U+0u8u2lGQ?=
 =?us-ascii?Q?ApeVc4P64hDAtYxsTwHCh1rOVZ7oBBAqwg1QyrkjYchsukJhas0C/CS8Rmnl?=
 =?us-ascii?Q?9giP2putQ+xPz7s6cA69zxiNcBmupDZi3nLlCbADraGRowAhT0AspLhaA2uW?=
 =?us-ascii?Q?bH6ei0HyWkbeRtX5iCNHVw9QDPCavHmwk/6j1TEIYpjbTFOBnnbQJ+aepIUx?=
 =?us-ascii?Q?H/lR5dO4uFHQd+UO2uaOOL7vK7vxKMkYJw9Soq2BKTuADffdPUhtIflPw6Xm?=
 =?us-ascii?Q?tNZeltEbk+a//v2ebbXI2ALAtmcpb14qS/SwiWEgh9pAymP4DLWANI4Rktyk?=
 =?us-ascii?Q?4JqUB4Js9ijNT7VXQE0Z+SK8Ht91r7m2KlBvSaqjZ0h819ENzK8607Ee9z1p?=
 =?us-ascii?Q?7OvqZGZ2jE2tuvQt33W2JWW5QxxEHt82UozxddTd/iKFNYD82u3qGErE0XTO?=
 =?us-ascii?Q?oF5p+Lv7r6ms3UaY5fCDEVbtQA/yK9Id3Tex3FsllUNKngUpDFP/EfrlpZnl?=
 =?us-ascii?Q?OjuWgLeiyUjcDQJFihEtB5zy92oBxSHkfMZotHHZ7yfLstSNjbvNjsxQrUjr?=
 =?us-ascii?Q?AqvWXIsaqwgyjZTrPWdCO/dwSinkyPHlK6H/LgBOEBqtUvOiBAYBDSD5ft+D?=
 =?us-ascii?Q?kOJIPvaaXlSOvd88z8CzBPIr+ul1ydol7GOtJkz3lUGe1iZ7nuKLyxNDT9/O?=
 =?us-ascii?Q?1S/5u2GPq9SvuR+7Ycw8I86AdW0k9u+sZzTG69+IQgM2CBWnAXy07jbkHMUs?=
 =?us-ascii?Q?N2M3odMcCBsNRdTluLpLrIi1PVZ53f9J6LgjyPi1LyJXqPHmM12tntQWEcP/?=
 =?us-ascii?Q?0Ch7JCSqE/XtpZHLbOpwnFtWQRj6QMrFC4EOIznFwRjmxGfCwlnDkhffEHoB?=
 =?us-ascii?Q?R/aNSh81hVutdr1lUHzFuyLPhWI3XvscqqU1QEiLza5k5g3uql3JPnhnXePS?=
 =?us-ascii?Q?67HFjON3RDxOHny3V62Lz0QGsKbkZhhxCVMm7TK2Q8S8oAOw8Wm71lzp07ms?=
 =?us-ascii?Q?97nL2IIHCnG+7h7GE18vs50YWCI1H8Bv2FIrPIx1MNIQWDJSyqttkBMncgrG?=
 =?us-ascii?Q?kWH5Qy3MylcFQ3TrG6jcojk8x8UICNYu9pAvh92C1BSEUrtq+hvFWnqpjbDc?=
 =?us-ascii?Q?WfJ7JYb9s4NKZE6monis51/ALKgfISFnoDjAxN9fWRgj8AMWuVDQpb8GzbJu?=
 =?us-ascii?Q?TJFbZExJvOCH7/QudKR8TnFjYn943DYFtpVhRxiX4hCf0KUMzYnybq5TPLJ0?=
 =?us-ascii?Q?Df1AztKy9IxLM1UBlXxMASouMao4EI4XeMCeC52fMjaz6hhF45CXWUEuzUod?=
 =?us-ascii?Q?vq/gn9tAh4JuNS8my2Q0wNiepWKlwddZFERUGxsUhteQFgs0fpvH4H1L2d0K?=
 =?us-ascii?Q?zxORJ9KWUeJgUWuTUhjQqV2Gaoo6ercl9bRLG38MZb1lUbhYc7pfyEUbnIYP?=
 =?us-ascii?Q?YlymOpPlQPU19jnkqBVBszfdd9C8Pb1wAkko7p9XhluWmreg4luqGXAVAoE1?=
 =?us-ascii?Q?xvYMAlnMcA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d3c27b-2734-4b08-edd5-08da17b5a75d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 10:10:19.2378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vUv5BBnUy+Ua0noTpB+7r9yYPvei0NRMpguNALvwOH9u4ibSSWXK9P/OL3aYk7NOzGCddfJPAzj6XyKGLWqJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5683

On 02.04.2022 01:14, Demi Marie Obenour wrote:
> The EFI System Resource Table (ESRT) is necessary for fwupd to identify
> firmware updates to install.  According to the UEFI specification =C2=A72=
3.4,
> the table shall be stored in memory of type EfiBootServicesData.
> Therefore, Xen must avoid reusing that memory for other purposes, so
> that Linux can access the ESRT.  Additionally, Xen must mark the memory
> as reserved, so that Linux knows accessing it is safe.
>=20
> See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
> for details.
>=20
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

First a note on patch submission: Patches are sent To: the list, with
Cc: to involved maintainers (and perhaps other interested parties).

> ---
>  xen/arch/arm/efi/efi-boot.h |  9 +++--
>  xen/arch/x86/efi/efi-boot.h |  5 ++-
>  xen/common/efi/boot.c       | 77 +++++++++++++++++++++++++++++++++++--
>  xen/common/efi/efi.h        |  2 +-
>  xen/common/efi/runtime.c    |  5 ++-
>  xen/include/efi/efiapi.h    |  3 ++
>  6 files changed, 89 insertions(+), 12 deletions(-)

This being v2 (oddly enough with another v2 sent on Mar 30), you will
want to add a brief revision log clarifying to reviewers what has
changed. Together with the duplicate v2 it's not really clear whether
this was a plain resend, or whether anything actually changed (it
looks like you did address the Arm build issue).

> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -176,7 +176,8 @@ static bool __init meminfo_add_bank(struct meminfo *m=
em,
> =20
>  static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DESC=
RIPTOR *map,
>                                                  UINTN mmap_size,
> -                                                UINTN desc_size)
> +                                                UINTN desc_size,
> +                                                const EFI_MEMORY_DESCRIP=
TOR *const esrt_desc)

Please omit the 2nd const (here and elsewhere) - no other parameters are
modified like this.

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -154,7 +154,8 @@ static void __init efi_arch_process_memory_map(EFI_SY=
STEM_TABLE *SystemTable,
>                                                 void *map,
>                                                 UINTN map_size,
>                                                 UINTN desc_size,
> -                                               UINT32 desc_ver)
> +                                               UINT32 desc_ver,
> +                                               const EFI_MEMORY_DESCRIPT=
OR *const esrt_desc)
>  {
>      struct e820entry *e;
>      unsigned int i;
> @@ -171,7 +172,7 @@ static void __init efi_arch_process_memory_map(EFI_SY=
STEM_TABLE *SystemTable,
>          {
>          case EfiBootServicesCode:
>          case EfiBootServicesData:
> -            if ( map_bs )
> +            if ( map_bs || desc =3D=3D esrt_desc )
>              {
>          default:
>                  type =3D E820_RESERVED;

How certain is it that this descriptor doesn't cover (much) more than
just ESRT? This could be quite wasteful in terms of memory which
wouldn't be reclaimed just because of the (perhaps small) ESRT.

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -93,6 +93,23 @@ typedef struct _EFI_LOAD_OPTION {
>      CHAR16 Description[];
>  } EFI_LOAD_OPTION;
> =20
> +struct esrt_entry {
> +    EFI_GUID fw_class;
> +    UINT32 fw_type;
> +    UINT32 fw_version;
> +    UINT32 fw_lowest_supported_version;
> +    UINT32 fw_capsule_flags;
> +    UINT32 fw_last_attempt_version;
> +    UINT32 fw_last_attempt_status;
> +};
> +
> +struct esrt {
> +    UINT32 esrt_count;
> +    UINT32 esrt_max;
> +    UINT64 esrt_version;
> +    struct esrt_entry esrt_entries[];
> +};

Please follow the naming and naming convention used by immediately
preceding structure definitions as well as the specification: All
names matching the spec and using typedef. That's how such structures
would eventually be added to the EFI headers we're inheriting from
the gnu-efi package. At such a point we would want to be able to
delete the declarations here without needing to touch any other code.

> #define LOAD_OPTION_ACTIVE              0x00000001

Also please don't insert in the middle of two related definitions.

> @@ -567,6 +584,38 @@ static int __init efi_check_dt_boot(const EFI_LOADED=
_IMAGE *loaded_image)
>  }
>  #endif
> =20
> +static UINTN __initdata esrt;

Don't you need to initialize this to EFI_INVALID_TABLE_ADDR in order
for ...

> +static bool __init is_esrt_valid(
> +    const EFI_MEMORY_DESCRIPTOR *const desc)
> +{
> +    size_t available_len, esrt_len, len;
> +    const UINTN physical_start =3D desc->PhysicalStart;
> +    const struct esrt *esrt_ptr;
> +
> +    len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
> +    if ( esrt =3D=3D EFI_INVALID_TABLE_ADDR )
> +        return false;

... this check to actually be useful?

> +    if ( physical_start > esrt || esrt - physical_start >=3D len )
> +        return false;
> +    /*
> +     * The specification requires EfiBootServicesData, but accept
> +     * EfiRuntimeServicesData for compatibility
> +     */
> +    if ( (desc->Type !=3D EfiRuntimeServicesData) &&
> +         (desc->Type !=3D EfiBootServicesData) )
> +        return false;
> +    available_len =3D len - (esrt - physical_start);
> +    if ( available_len < sizeof(*esrt_ptr) )
> +        return false;
> +    esrt_ptr =3D (const struct esrt *)esrt;
> +    if ( esrt_ptr->esrt_version !=3D 1 || esrt_ptr->esrt_count <=3D 0 )

Nit: I think unsigned values would better not be compared for "<=3D 0";
this wants to be "=3D=3D 0" (or simply use the ! operator as we tend to
do elsewhere).

> +        return false;
> +    esrt_len =3D esrt_ptr->esrt_count * sizeof(esrt_ptr->esrt_entries[0]=
);

While presently we support EFI only for 64-bit architectures, this
can overflow for 32-bit ones. Better to guard against this right
away. This could be achieved implicitly by ...

> +    return esrt_len > available_len - sizeof(*esrt_ptr);

    return esrt_ptr->esrt_count <=3D
           (available_len - sizeof(*esrt_ptr)) /
           sizeof(esrt_ptr->esrt_entries[0]);

(also correcting > to <=3D at the same time).

> @@ -846,6 +895,10 @@ static void __init efi_tables(void)
>  {
>      unsigned int i;
> =20
> +    BUILD_BUG_ON(sizeof(struct esrt_entry) !=3D 40);
> +    BUILD_BUG_ON(__alignof(struct esrt_entry) !=3D 4);
> +    BUILD_BUG_ON(sizeof(struct esrt) !=3D 16);

What are these about? I don't think we have similar checks for
other interface definitions, and I don't see why we would need
such.

> @@ -854,6 +907,7 @@ static void __init efi_tables(void)
>          static EFI_GUID __initdata mps_guid =3D MPS_TABLE_GUID;
>          static EFI_GUID __initdata smbios_guid =3D SMBIOS_TABLE_GUID;
>          static EFI_GUID __initdata smbios3_guid =3D SMBIOS3_TABLE_GUID;
> +        static EFI_GUID __initdata esrt_guid =3D ESRT_GUID;
> =20
>          if ( match_guid(&acpi2_guid, &efi_ct[i].VendorGuid) )
>  	       efi.acpi20 =3D (long)efi_ct[i].VendorTable;
> @@ -865,6 +919,8 @@ static void __init efi_tables(void)
>  	       efi.smbios =3D (long)efi_ct[i].VendorTable;
>          if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
>  	       efi.smbios3 =3D (long)efi_ct[i].VendorTable;
> +        if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
> +	       esrt =3D (long)efi_ct[i].VendorTable;

I think all the casts to "long" are bogus here. At the very least
this ought to be "unsigned long", but I think in your case it
actually wants to be UINTN (the destination variable's type). Also,
while I guess you simply derived the two new lines by copy-and-
paste, please avoid introducing yet another instance of the pre-
exisiting indentation issues (hard tab and too deep when tabs
expand to the usual 8 blank positions).

> @@ -1053,19 +1109,19 @@ static void __init efi_exit_boot(EFI_HANDLE Image=
Handle, EFI_SYSTEM_TABLE *Syste
>      EFI_STATUS status;
>      UINTN info_size =3D 0, map_key;
>      bool retry;
> -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
>      unsigned int i;
> -#endif
> =20
>      efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
>                           &efi_mdesc_size, &mdesc_ver);
> -    info_size +=3D 8 * efi_mdesc_size;
> +    info_size +=3D 8 * (efi_mdesc_size + 1);
>      efi_memmap =3D efi_arch_allocate_mmap_buffer(info_size);
>      if ( !efi_memmap )
>          blexit(L"Unable to allocate memory for EFI memory map");
> =20
>      for ( retry =3D false; ; retry =3D true )
>      {
> +        esrt_desc =3D (EFI_MEMORY_DESCRIPTOR*)EFI_INVALID_TABLE_ADDR;

Nit: Missing blank before * and perhaps wants to cast to pointer-to-
const.

> @@ -1074,8 +1130,21 @@ static void __init efi_exit_boot(EFI_HANDLE ImageH=
andle, EFI_SYSTEM_TABLE *Syste
>          if ( EFI_ERROR(status) )
>              PrintErrMesg(L"Cannot obtain memory map", status);
> =20
> +        for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
> +        {
> +            if ( is_esrt_valid(efi_memmap + i) )
> +            {
> +                esrt_desc =3D efi_memmap + i;
> +                break;
> +            }
> +        }
> +
> +        /*
> +         * We cannot pass esrt because we need to explicitly compare the
> +         * descriptor pointers for equality.
> +         */
>          efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memmap_=
size,
> -                                    efi_mdesc_size, mdesc_ver);
> +                                    efi_mdesc_size, mdesc_ver, esrt_desc=
);

Since esrt_desc is a global variable, why do you pass it as an argument
here?

> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -52,6 +52,7 @@ static unsigned int efi_rs_on_cpu =3D NR_CPUS;
>  UINTN __read_mostly efi_memmap_size;
>  UINTN __read_mostly efi_mdesc_size;
>  void *__read_mostly efi_memmap;
> +void *__read_mostly esrt_desc;

Why "void *" and not pointer-to-const?

> @@ -269,14 +270,14 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info=
 *info)
>      case XEN_FW_EFI_MEM_INFO:
>          for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
>          {
> -            EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
> +            const EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
>              u64 len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
> =20
>              if ( info->mem.addr >=3D desc->PhysicalStart &&
>                   info->mem.addr < desc->PhysicalStart + len )
>              {
>                  info->mem.type =3D desc->Type;
> -                info->mem.attr =3D desc->Attribute;
> +                info->mem.attr =3D desc =3D=3D esrt_desc ? EFI_MEMORY_RU=
NTIME : desc->Attribute;

Why this override?

Jan


