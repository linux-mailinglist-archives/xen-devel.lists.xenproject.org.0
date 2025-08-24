Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89357B32CD7
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 03:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091711.1448125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upzNe-0007TC-Cl; Sun, 24 Aug 2025 01:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091711.1448125; Sun, 24 Aug 2025 01:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upzNe-0007QC-7N; Sun, 24 Aug 2025 01:18:46 +0000
Received: by outflank-mailman (input) for mailman id 1091711;
 Sun, 24 Aug 2025 01:18:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pini=3E=bounce.vates.tech=bounce-md_30504962.68aa685b.v1-71f59c0c0b55456abfcd840399f443e5@srs-se1.protection.inumbo.net>)
 id 1upzNd-0007Q6-9d
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 01:18:45 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38c9b23d-8088-11f0-a32b-13f23c93f187;
 Sun, 24 Aug 2025 03:18:23 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4c8bf33GT8zBsTmHK
 for <xen-devel@lists.xenproject.org>; Sun, 24 Aug 2025 01:18:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 71f59c0c0b55456abfcd840399f443e5; Sun, 24 Aug 2025 01:18:19 +0000
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
X-Inumbo-ID: 38c9b23d-8088-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755998299; x=1756268299;
	bh=2xQK+CBaTpLDCc7cqmkNerb4/0mzd3gotenYnAi0YJg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=TFBATdDw3Wu+phJnN530JzherDfUUXn0hpLkN9MloPMZWpMuA+Y1DU5SRvjkI5NzA
	 +jfHKvmKBK7h3mvoVMLzAdvxQed2dCpfsiuhnBeI6gKEl4ZXUXjlqnXUHWhb0fD1hW
	 y6/qFASuCqCodDKDdsxThv8IOLPHmXeAOlB5AEzN/NmTH4GCliZOk6lEU3kC2Z6Nnt
	 vFGOPuqZdqV2Xvtx5q+uut3isqENO5W8ipZL6f0NXrFtP0sEVZgghdCTvwFIdxQcLS
	 YT1LJYrC2NUSuNjISjXueX8b+LKsTnVSQIOlAJv56jVz955Z7AWUP9HVwb4lrt/UQP
	 OYaGeqH6pa0gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755998299; x=1756258799; i=teddy.astie@vates.tech;
	bh=2xQK+CBaTpLDCc7cqmkNerb4/0mzd3gotenYnAi0YJg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JeEoRVbQjioYG+YyLPQrzyGX898AFtVZmyFJ2kLqRDo7gPzM6+hmQHC+gUo1WZMvS
	 9q6EPpwqkfhXpdnNZfnfHpeCwVH56Jm9OGjbyIUdffxG3X6sH2A8Xe9YU8YcQXysEI
	 uVNuDLHL3iTONYf6PU1Raw4qmGOEMyiyK84plsBvn6J58yWHpzy6PaROv0mBkYd1fX
	 y2gmnYk8Vsw2NVy0UivaXHoBKGr8H9B0/Bwwg75BUdPmUh3wDbiZOK0tU8vnRL2zBG
	 6MvxyMLGP9mSGPHDizNDwEzjiro3j1ifbBtHMaqO6ukmCFxasT01fuaOTN90NfqCPR
	 nbV353CzyW2lw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5=202/4]=20hvmloader:=20fix=20SMBIOS=20table=20length=20checks?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755998298209
Message-Id: <84ee441e-4255-4f2f-b9b4-8b1aa5a9b43f@vates.tech>
To: "=?utf-8?Q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
References: <cover.1755987697.git.w1benny@gmail.com> <58f42aaaf460c33d9d0935d670aab9f54eb184b8.1755987697.git.w1benny@gmail.com>
In-Reply-To: <58f42aaaf460c33d9d0935d670aab9f54eb184b8.1755987697.git.w1benny@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.71f59c0c0b55456abfcd840399f443e5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250824:md
Date: Sun, 24 Aug 2025 01:18:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 24/08/2025 =C3=A0 00:29, Petr Bene=C5=A1 a =C3=A9crit=C2=A0:
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
> 
> SMBIOS specification dictates that tables should have a minimal length.
> This commit introduces further validation for user-input SMBIOS tables.
> 
> As per SMBIOS Reference Specification:
> * Type 0: For version 2.3 and later implementations, the length is at lea=
st 14h
> * Type 1: 1Bh for 2.4 and later
> * Type 2: at least 08h
> * Type 3: 0Dh for version 2.1 and later
> * Type 11: 5h (+ strings)
> * Type 22: 1Ah (+ strings)
> * Type 39: a minimum of 10h
> 
> Notably, this also fixes previously incorrect check for chassis handle in
> smbios_type_2_init. Chassis handle is a WORD, therefore, the condition no=
w
> correctly checks for >=3D 13 instead of > 13.
> 
> hvmloader currently implements version 2.4
> 
> Furthermore, this commit introduces smbios_pt_copy helper function to sub=
stitute
> previously repeating pattern of locating the struct in physical memory (v=
ia
> get_smbios_pt_struct), checking the length and copying it into SMBIOS reg=
ion.
> 
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
>   tools/firmware/hvmloader/smbios.c       | 178 ++++++++++++++----------
>   tools/firmware/hvmloader/smbios_types.h |  32 ++---
>   2 files changed, 123 insertions(+), 87 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader=
/smbios.c
> index 6bcdcc233a..de3ba78e87 100644
> --- a/tools/firmware/hvmloader/smbios.c
> +++ b/tools/firmware/hvmloader/smbios.c
> @@ -47,6 +47,8 @@ static void
>   smbios_pt_init(void);
>   static void*
>   get_smbios_pt_struct(uint8_t type, uint32_t *length_out);
> +static void *
> +smbios_pt_copy(void *start, uint8_t type, uint16_t handle, size_t table_=
size);
>   static void
>   get_cpu_manufacturer(char *buf, int len);
>   static int
> @@ -154,6 +156,24 @@ get_smbios_pt_struct(uint8_t type, uint32_t *length_=
out)
>       return NULL;
>   }
>   
> +static void *
> +smbios_pt_copy(void *start, uint8_t type, uint16_t handle, size_t min_si=
ze)
> +{
> +    struct smbios_structure_header *header =3D start;
> +    void *pts;
> +    uint32_t length;
> +
> +    pts =3D get_smbios_pt_struct(type, &length);
> +    if ( pts !=3D NULL && length >=3D min_size )
> +    {
> +        memcpy(start, pts, length);
> +        header->handle =3D handle;
> +        return start + length;
> +    }
> +
> +    return start;
> +}
> +
>   static void
>   get_cpu_manufacturer(char *buf, int len)
>   {
> @@ -381,16 +401,17 @@ smbios_type_0_init(void *start, const char *xen_ver=
sion,
>       struct smbios_type_0 *p =3D start;
>       static const char *smbios_release_date =3D __SMBIOS_DATE__;
>       const char *s;
> -    void *pts;
> -    uint32_t length;
> +    void *next;
>   
> -    pts =3D get_smbios_pt_struct(0, &length);
> -    if ( pts !=3D NULL && length > 0 )
> -    {
> -        memcpy(start, pts, length);
> -        p->header.handle =3D SMBIOS_HANDLE_TYPE0;
> -        return start + length;
> -    }
> +    /*
> +     * Specification says Type 0 table has length of at least 18h for v2=
.4-3.0.
> +     */
> +
> +    BUILD_BUG_ON(sizeof(*p) !=3D 24);
> +
> +    next =3D smbios_pt_copy(start, 0, SMBIOS_HANDLE_TYPE0, sizeof(*p));
> +    if ( next !=3D start )
> +        return next;
>   
>       memset(p, 0, sizeof(*p));
>   
> @@ -440,16 +461,14 @@ smbios_type_1_init(void *start, const char *xen_ver=
sion,
>       char uuid_str[37];
>       struct smbios_type_1 *p =3D start;
>       const char *s;
> -    void *pts;
> -    uint32_t length;
> +    void *next;
>   
> -    pts =3D get_smbios_pt_struct(1, &length);
> -    if ( pts !=3D NULL && length > 0 )
> -    {
> -        memcpy(start, pts, length);
> -        p->header.handle =3D SMBIOS_HANDLE_TYPE1;
> -        return start + length;
> -    }
> +    /* Specification says Type 1 table has length of 1Bh for v2.4 and la=
ter. */
> +    BUILD_BUG_ON(sizeof(*p) !=3D 27);
> +
> +    next =3D smbios_pt_copy(start, 1, SMBIOS_HANDLE_TYPE1, sizeof(*p));
> +    if ( next !=3D start )
> +        return next;
>   
>       memset(p, 0, sizeof(*p));
>   
> @@ -498,26 +517,29 @@ smbios_type_2_init(void *start)
>   {
>       struct smbios_type_2 *p =3D start;
>       const char *s;
> -    uint8_t *ptr;
> -    void *pts;
> -    uint32_t length;
> +    void *next;
>       unsigned int counter =3D 0;
>   
> -    pts =3D get_smbios_pt_struct(2, &length);
> -    if ( pts !=3D NULL && length > 0 )
> -    {
> -        memcpy(start, pts, length);
> -        p->header.handle =3D SMBIOS_HANDLE_TYPE2;
> +    /*
> +     * Specification says Type 2 table has length of at least 08h,
> +     * which corresponds with the end of the "Serial Number" field.
> +     */
> +
> +    BUILD_BUG_ON(endof_field(struct smbios_type_2, serial_number_str) !=
=3D 8);
>   
> +    next =3D smbios_pt_copy(start, 2, SMBIOS_HANDLE_TYPE2,
> +                          endof_field(struct smbios_type_2, serial_numbe=
r_str));
> +    if ( next !=3D start )
> +    {
>           /* Set current chassis handle if present */
> -        if ( p->header.length > 13 )
> +        if ( p->header.length >=3D endof_field(struct smbios_type_2,
> +                                             chassis_handle) )
>           {
> -            ptr =3D ((uint8_t*)start) + 11;
> -            if ( *((uint16_t*)ptr) !=3D 0 )
> -                *((uint16_t*)ptr) =3D SMBIOS_HANDLE_TYPE3;
> +            if ( p->chassis_handle !=3D 0 )
> +                p->chassis_handle =3D SMBIOS_HANDLE_TYPE3;
>           }
>   
> -        return start + length;
> +        return next;
>       }
>   
>       memset(p, 0, sizeof(*p));
> @@ -593,18 +615,21 @@ smbios_type_3_init(void *start)
>   {
>       struct smbios_type_3 *p =3D start;
>       const char *s;
> -    void *pts;
> -    uint32_t length;
> +    void *next;
>       uint32_t counter =3D 0;
>   
> -    pts =3D get_smbios_pt_struct(3, &length);
> -    if ( pts !=3D NULL && length > 0 )
> -    {
> -        memcpy(start, pts, length);
> -        p->header.handle =3D SMBIOS_HANDLE_TYPE3;
> -        return start + length;
> -    }
> -
> +    /*
> +     * Specification says Type 3 table has length of at least 0Dh (for v=
2.1+),
> +     * which corresponds with the end of the "Security Status" field.
> +     */
> +
> +    BUILD_BUG_ON(endof_field(struct smbios_type_3, security_status) !=3D=
 13);
> +
> +    next =3D smbios_pt_copy(start, 3, SMBIOS_HANDLE_TYPE3,
> +                          offsetof(struct smbios_type_3, security_status=
));
> +    if ( next !=3D start )
> +        return next;
> +
>       memset(p, 0, sizeof(*p));
>   
>       p->header.type =3D 3;
> @@ -656,6 +681,9 @@ smbios_type_4_init(
>       struct smbios_type_4 *p =3D start;
>       uint32_t eax, ebx, ecx, edx;
>   
> +    /* Specification says Type 4 table has length of 23h for v2.3+. */
> +    BUILD_BUG_ON(sizeof(*p) !=3D 35);
> +
>       memset(p, 0, sizeof(*p));
>   
>       p->header.type =3D 4;
> @@ -707,17 +735,15 @@ smbios_type_11_init(void *start)
>       struct smbios_type_11 *p =3D start;
>       char path[20];
>       const char *s;
> +    void *next;
>       int i;
> -    void *pts;
> -    uint32_t length;
>   
> -    pts =3D get_smbios_pt_struct(11, &length);
> -    if ( pts !=3D NULL && length > 0 )
> -    {
> -        memcpy(start, pts, length);
> -        p->header.handle =3D SMBIOS_HANDLE_TYPE11;
> -        return start + length;
> -    }
> +    /* Specification says Type 11 table has length of 05h. */
> +    BUILD_BUG_ON(sizeof(*p) !=3D 5);
> +
> +    next =3D smbios_pt_copy(start, 11, SMBIOS_HANDLE_TYPE11, sizeof(*p))=
;
> +    if ( next !=3D start )
> +        return next;
>   
>       p->header.type =3D 11;
>       p->header.length =3D sizeof(*p);
> @@ -756,6 +782,9 @@ smbios_type_16_init(void *start, uint32_t memsize, in=
t nr_mem_devs)
>   {
>       struct smbios_type_16 *p =3D start;
>   
> +    /* Specification says Type 16 table has length of 0Fh for v2.1-2.7. =
*/
> +    BUILD_BUG_ON(sizeof(*p) !=3D 15);
> +
>       memset(p, 0, sizeof(*p));
>   
>       p->header.type =3D 16;
> @@ -781,6 +810,9 @@ smbios_type_17_init(void *start, uint32_t memory_size=
_mb, int instance)
>       char buf[16];
>       struct smbios_type_17 *p =3D start;
>   
> +    /* Specification says Type 17 table has length of 1Bh for v2.3-2.6. =
*/
> +    BUILD_BUG_ON(sizeof(*p) !=3D 27);
> +
>       memset(p, 0, sizeof(*p));
>   
>       p->header.type =3D 17;
> @@ -816,6 +848,9 @@ smbios_type_19_init(void *start, uint32_t memory_size=
_mb, int instance)
>   {
>       struct smbios_type_19 *p =3D start;
>   
> +    /* Specification says Type 19 table has length of 0Fh for v2.1-2.7. =
*/
> +    BUILD_BUG_ON(sizeof(*p) !=3D 15);
> +
>       memset(p, 0, sizeof(*p));
>   
>       p->header.type =3D 19;
> @@ -838,6 +873,9 @@ smbios_type_20_init(void *start, uint32_t memory_size=
_mb, int instance)
>   {
>       struct smbios_type_20 *p =3D start;
>   
> +    /* Specification says Type 20 table has length of 13h for v2.1-2.7. =
*/
> +    BUILD_BUG_ON(sizeof(*p) !=3D 19);

Note that OVMF does replace the SMBIOS version to 2.8 which may 
eventually invalidate what you expect (assuming the length only holds 
for the versions you give in your comments).

I don't know enough SMBIOS and OVMF to know if it can be a problem (OVMF 
may do some conversions in these cases).

> +
>       memset(p, 0, sizeof(*p));
>   
>       p->header.type =3D 20;
> @@ -865,16 +903,14 @@ smbios_type_22_init(void *start)
>       struct smbios_type_22 *p =3D start;
>       static const char *smbios_release_date =3D __SMBIOS_DATE__;
>       const char *s;
> -    void *pts;
> -    uint32_t length;
> +    void *next;
>   
> -    pts =3D get_smbios_pt_struct(22, &length);
> -    if ( pts !=3D NULL && length > 0 )
> -    {
> -        memcpy(start, pts, length);
> -        p->header.handle =3D SMBIOS_HANDLE_TYPE22;
> -        return start + length;
> -    }
> +    /* Specification says Type 22 table has length of 1Ah. */
> +    BUILD_BUG_ON(sizeof(*p) !=3D 26);
> +
> +    next =3D smbios_pt_copy(start, 22, SMBIOS_HANDLE_TYPE22, sizeof(*p))=
;
> +    if ( next !=3D start )
> +        return next;
>   
>       s =3D xenstore_read(HVM_XS_SMBIOS_DEFAULT_BATTERY, "0");
>       if ( strncmp(s, "1", 1) !=3D 0 )
> @@ -929,6 +965,9 @@ smbios_type_32_init(void *start)
>   {
>       struct smbios_type_32 *p =3D start;
>   
> +    /* Specification says Type 32 table has length of at least 0Bh. */
> +    BUILD_BUG_ON(sizeof(*p) !=3D 11);
> +
>       memset(p, 0, sizeof(*p));
>   
>       p->header.type =3D 32;
> @@ -946,20 +985,17 @@ smbios_type_32_init(void *start)
>   static void *
>   smbios_type_39_init(void *start)
>   {
> -    struct smbios_type_39 *p =3D start;
> -    void *pts;
> -    uint32_t length;
> +    /*
> +     * Specification says Type 39 table has length of at least 10h,
> +     * which corresponds with the end of the "Characteristics" field.
> +     *
> +     * Only present when passed in.
> +     */
>   
> -    pts =3D get_smbios_pt_struct(39, &length);
> -    if ( pts !=3D NULL && length > 0 )
> -    {
> -        memcpy(start, pts, length);
> -        p->header.handle =3D SMBIOS_HANDLE_TYPE39;
> -        return start + length;
> -    }
> +    BUILD_BUG_ON(endof_field(struct smbios_type_39, characteristics) !=
=3D 16);
>   
> -    /* Only present when passed in */
> -    return start;
> +    return smbios_pt_copy(start, 39, SMBIOS_HANDLE_TYPE39,
> +                          endof_field(struct smbios_type_39, characteris=
tics));
>   }
>   
>   static void *
> diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvm=
loader/smbios_types.h
> index 7c648ece71..a04d194975 100644
> --- a/tools/firmware/hvmloader/smbios_types.h
> +++ b/tools/firmware/hvmloader/smbios_types.h
> @@ -90,13 +90,13 @@ struct smbios_type_2 {
>       uint8_t product_name_str;
>       uint8_t version_str;
>       uint8_t serial_number_str;
> -    uint8_t asset_tag_str;
> -    uint8_t feature_flags;
> -    uint8_t location_in_chassis_str;
> -    uint16_t chassis_handle;
> -    uint8_t board_type;
> -    uint8_t contained_handle_count;
> -    uint16_t contained_handles[];
> +    uint8_t asset_tag_str;                  /* Optional */
> +    uint8_t feature_flags;                  /* Optional */
> +    uint8_t location_in_chassis_str;        /* Optional */
> +    uint16_t chassis_handle;                /* Optional */
> +    uint8_t board_type;                     /* Optional */
> +    uint8_t contained_handle_count;         /* Optional */
> +    uint16_t contained_handles[];           /* Optional */
>   } __attribute__ ((packed));
>   
>   /* System Enclosure - Contained Elements */
> @@ -118,12 +118,12 @@ struct smbios_type_3 {
>       uint8_t power_supply_state;
>       uint8_t thermal_state;
>       uint8_t security_status;
> -    uint32_t oem_specific;
> -    uint8_t height;
> -    uint8_t number_of_power_cords;
> -    uint8_t contained_element_count;
> -    uint8_t contained_element_length;
> -    struct smbios_contained_element contained_elements[];
> +    uint32_t oem_specific;                  /* Optional */
> +    uint8_t height;                         /* Optional */
> +    uint8_t number_of_power_cords;          /* Optional */
> +    uint8_t contained_element_count;        /* Optional */
> +    uint8_t contained_element_length;       /* Optional */
> +    struct smbios_contained_element contained_elements[]; /* Optional */
>   } __attribute__ ((packed));
>   
>   /* SMBIOS type 4 - Processor Information */
> @@ -252,9 +252,9 @@ struct smbios_type_39 {
>       uint8_t revision_level_str;
>       uint16_t max_capacity;
>       uint16_t characteristics;
> -    uint16_t input_voltage_probe_handle;
> -    uint16_t cooling_device_handle;
> -    uint16_t input_current_probe_handle;
> +    uint16_t input_voltage_probe_handle;    /* Optional */
> +    uint16_t cooling_device_handle;         /* Optional */
> +    uint16_t input_current_probe_handle;    /* Optional */
>   } __attribute__ ((packed));
>   
>   /* SMBIOS type 127 -- End-of-table */



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



