Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4D3AF0AC4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 07:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030183.1403800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWq6d-0001aS-5T; Wed, 02 Jul 2025 05:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030183.1403800; Wed, 02 Jul 2025 05:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWq6c-0001XV-Up; Wed, 02 Jul 2025 05:34:02 +0000
Received: by outflank-mailman (input) for mailman id 1030183;
 Wed, 02 Jul 2025 05:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9zeQ=ZP=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uWq6c-0001XP-6B
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 05:34:02 +0000
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26f645c2-5706-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 07:33:59 +0200 (CEST)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-72c13802133so1321477a34.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 22:33:59 -0700 (PDT)
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
X-Inumbo-ID: 26f645c2-5706-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1751434438; x=1752039238; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtF0UKKnwJ79Cw8zLxlERrBf2qEYPcTtQsE3ZGqgP/M=;
        b=ecmR1WmUEtLdaoGk5GUHxENSq2EGMHTZzrmEbNZWV6aTAsIOMaDc7keTRivIS2IRgg
         UiMQ3/5KsgGRiNVaOXHAw2MPf7TBgTETl4jm7j58q2YwQYl2mO0wSyDzGpRlCaOrlHS7
         UeSek/JIuu8zve4Q5Pfnfn0taYPtl1MSmi4FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751434438; x=1752039238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtF0UKKnwJ79Cw8zLxlERrBf2qEYPcTtQsE3ZGqgP/M=;
        b=Rf0FkBqpVBJrGbuzDGnIyT0C4Ud6HeF6RXwPLaVnIQYNo31yYVzFjDlZAIN1jc4MIv
         2RsElzaOg8WpghA5Od+H+ZsNCpSu4HH+D3KEwhtzkFMgUAZ0FUHVqhVfAx8CcPqsZ99b
         vY2Y1QcDeqZ/K4jCqltZOcFixke0+yaUq56zrQAAiQqpYNLOsfCDmF2tI4tZUSf/hcw+
         Y0A2xdAhcqOq82vy77lLJ/yYPgEPUVycsj3umMT0AwKbECCT/nLxo1tNk54Dwr2vS5gP
         VuQIPYguuZY8jL9/vSXuCEtoRFhS/LLolkt1nGY+eN2i3Dfza86niWRIhxb/FqcBKK2J
         4kDA==
X-Gm-Message-State: AOJu0YzNljd0+jn3/kFpPxON2YY61zsFzpO22uxeia7FI8mVnpfUswqu
	IZVG9vMX9yr1gb4JuisH5HJmWD1gurwwDFHbZd8f8igm2Ex++PqmL78C6N1TWyUknvw4mCLUXI6
	jLuWrqArjHjikMrBwiWgMf5FWJyXDI9qSKX4dsuIJDg==
X-Gm-Gg: ASbGncvZ1eTcwUh0TCol9vOOmOqsk6Rb3qGWWY3mdK5PVJR8ta2RUu6ogvfw2ezRCOB
	lQ/DmO6JK1+DZT9LVWvprppPwHHJLvDE70c0sOknGjabSVeoXmOM+xuSqmlyzbAJXPqbuPi9cGU
	PkIWsCcVQTMME5gfBuQ8MSq2fksoKPVSw7OW/Ic5M8UIaHCk0wOKZqpg==
X-Google-Smtp-Source: AGHT+IEpZJ0M3OWQXpzst/l7+6MkDj/O1KwFfYC5Vrh6RVWiKqYGpz4JScf/jzyRd6Yvv0mrtozDVqL0y601HvvoFK4=
X-Received: by 2002:a05:6808:8844:20b0:40b:9307:d71a with SMTP id
 5614622812f47-40b9307dae4mr499431b6e.14.1751434437600; Tue, 01 Jul 2025
 22:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751412735.git.w1benny@gmail.com> <fbff115ab5f3e565b07dc339d50e697ba37f7410.1751412735.git.w1benny@gmail.com>
In-Reply-To: <fbff115ab5f3e565b07dc339d50e697ba37f7410.1751412735.git.w1benny@gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 2 Jul 2025 06:33:46 +0100
X-Gm-Features: Ac12FXwMh_28lHIWFsuNa_sn7-3VPcH_iQbOOOoYdOBRod1zF6tmpbAmzKLGiI4
Message-ID: <CACHz=ZjznpeoTGTV8XCx+TFLD4Zqezvsiu_KMqGWrxK7_vCKwQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] hvmloader: fix code style violations
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 12:45=E2=80=AFAM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> Preparatory commit. No functional change.
>

Can you describe which specific code styles this commit is supposed to fix?

> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> ---
>  tools/firmware/hvmloader/smbios.c | 56 +++++++++++++++----------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader=
/smbios.c
> index 97a054e9e3..fc3cdc9a25 100644
> --- a/tools/firmware/hvmloader/smbios.c
> +++ b/tools/firmware/hvmloader/smbios.c
> @@ -378,18 +378,18 @@ static void *
>  smbios_type_0_init(void *start, const char *xen_version,
>                     uint32_t xen_major_version, uint32_t xen_minor_versio=
n)
>  {
> -    struct smbios_type_0 *p =3D (struct smbios_type_0 *)start;
> +    struct smbios_type_0 *p =3D start;
>      static const char *smbios_release_date =3D __SMBIOS_DATE__;
>      const char *s;
>      void *pts;
>      uint32_t length;
>
>      pts =3D get_smbios_pt_struct(0, &length);
> -    if ( (pts !=3D NULL)&&(length > 0) )
> +    if ( pts !=3D NULL && length > 0 )
>      {
>          memcpy(start, pts, length);
>          p->header.handle =3D SMBIOS_HANDLE_TYPE0;
> -        return (start + length);
> +        return start + length;
>      }
>
>      memset(p, 0, sizeof(*p));
> @@ -438,17 +438,17 @@ smbios_type_1_init(void *start, const char *xen_ver=
sion,
>                     uint8_t uuid[16])
>  {
>      char uuid_str[37];
> -    struct smbios_type_1 *p =3D (struct smbios_type_1 *)start;
> +    struct smbios_type_1 *p =3D start;
>      const char *s;
>      void *pts;
>      uint32_t length;
>
>      pts =3D get_smbios_pt_struct(1, &length);
> -    if ( (pts !=3D NULL)&&(length > 0) )
> +    if ( pts !=3D NULL && length > 0 )
>      {
>          memcpy(start, pts, length);
>          p->header.handle =3D SMBIOS_HANDLE_TYPE1;
> -        return (start + length);
> +        return start + length;
>      }
>
>      memset(p, 0, sizeof(*p));
> @@ -496,7 +496,7 @@ smbios_type_1_init(void *start, const char *xen_versi=
on,
>  static void *
>  smbios_type_2_init(void *start)
>  {
> -    struct smbios_type_2 *p =3D (struct smbios_type_2 *)start;
> +    struct smbios_type_2 *p =3D start;
>      const char *s;
>      uint8_t *ptr;
>      void *pts;
> @@ -504,7 +504,7 @@ smbios_type_2_init(void *start)
>      unsigned int counter =3D 0;
>
>      pts =3D get_smbios_pt_struct(2, &length);
> -    if ( (pts !=3D NULL)&&(length > 0) )
> +    if ( pts !=3D NULL && length > 0 )
>      {
>          memcpy(start, pts, length);
>          p->header.handle =3D SMBIOS_HANDLE_TYPE2;
> @@ -517,7 +517,7 @@ smbios_type_2_init(void *start)
>                  *((uint16_t*)ptr) =3D SMBIOS_HANDLE_TYPE3;
>          }
>
> -        return (start + length);
> +        return start + length;
>      }
>
>      memset(p, 0, sizeof(*p));
> @@ -591,18 +591,18 @@ smbios_type_2_init(void *start)
>  static void *
>  smbios_type_3_init(void *start)
>  {
> -    struct smbios_type_3 *p =3D (struct smbios_type_3 *)start;
> +    struct smbios_type_3 *p =3D start;
>      const char *s;
>      void *pts;
>      uint32_t length;
>      uint32_t counter =3D 0;
>
>      pts =3D get_smbios_pt_struct(3, &length);
> -    if ( (pts !=3D NULL)&&(length > 0) )
> +    if ( pts !=3D NULL && length > 0 )
>      {
>          memcpy(start, pts, length);
>          p->header.handle =3D SMBIOS_HANDLE_TYPE3;
> -        return (start + length);
> +        return start + length;
>      }
>
>      memset(p, 0, sizeof(*p));
> @@ -653,7 +653,7 @@ smbios_type_4_init(
>      void *start, unsigned int cpu_number, char *cpu_manufacturer)
>  {
>      char buf[80];
> -    struct smbios_type_4 *p =3D (struct smbios_type_4 *)start;
> +    struct smbios_type_4 *p =3D start;
>      uint32_t eax, ebx, ecx, edx;
>
>      memset(p, 0, sizeof(*p));
> @@ -704,7 +704,7 @@ smbios_type_4_init(
>  static void *
>  smbios_type_11_init(void *start)
>  {
> -    struct smbios_type_11 *p =3D (struct smbios_type_11 *)start;
> +    struct smbios_type_11 *p =3D start;
>      char path[20];
>      const char *s;
>      int i;
> @@ -712,11 +712,11 @@ smbios_type_11_init(void *start)
>      uint32_t length;
>
>      pts =3D get_smbios_pt_struct(11, &length);
> -    if ( (pts !=3D NULL)&&(length > 0) )
> +    if ( pts !=3D NULL && length > 0 )
>      {
>          memcpy(start, pts, length);
>          p->header.handle =3D SMBIOS_HANDLE_TYPE11;
> -        return (start + length);
> +        return start + length;
>      }
>
>      p->header.type =3D 11;
> @@ -754,7 +754,7 @@ smbios_type_11_init(void *start)
>  static void *
>  smbios_type_16_init(void *start, uint32_t memsize, int nr_mem_devs)
>  {
> -    struct smbios_type_16 *p =3D (struct smbios_type_16*)start;
> +    struct smbios_type_16 *p =3D start;
>
>      memset(p, 0, sizeof(*p));
>
> @@ -779,7 +779,7 @@ static void *
>  smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
>  {
>      char buf[16];
> -    struct smbios_type_17 *p =3D (struct smbios_type_17 *)start;
> +    struct smbios_type_17 *p =3D start;
>
>      memset(p, 0, sizeof(*p));
>
> @@ -814,7 +814,7 @@ smbios_type_17_init(void *start, uint32_t memory_size=
_mb, int instance)
>  static void *
>  smbios_type_19_init(void *start, uint32_t memory_size_mb, int instance)
>  {
> -    struct smbios_type_19 *p =3D (struct smbios_type_19 *)start;
> +    struct smbios_type_19 *p =3D start;
>
>      memset(p, 0, sizeof(*p));
>
> @@ -836,7 +836,7 @@ smbios_type_19_init(void *start, uint32_t memory_size=
_mb, int instance)
>  static void *
>  smbios_type_20_init(void *start, uint32_t memory_size_mb, int instance)
>  {
> -    struct smbios_type_20 *p =3D (struct smbios_type_20 *)start;
> +    struct smbios_type_20 *p =3D start;
>
>      memset(p, 0, sizeof(*p));
>
> @@ -862,18 +862,18 @@ smbios_type_20_init(void *start, uint32_t memory_si=
ze_mb, int instance)
>  static void *
>  smbios_type_22_init(void *start)
>  {
> -    struct smbios_type_22 *p =3D (struct smbios_type_22 *)start;
> +    struct smbios_type_22 *p =3D start;
>      static const char *smbios_release_date =3D __SMBIOS_DATE__;
>      const char *s;
>      void *pts;
>      uint32_t length;
>
>      pts =3D get_smbios_pt_struct(22, &length);
> -    if ( (pts !=3D NULL)&&(length > 0) )
> +    if ( pts !=3D NULL && length > 0 )
>      {
>          memcpy(start, pts, length);
>          p->header.handle =3D SMBIOS_HANDLE_TYPE22;
> -        return (start + length);
> +        return start + length;
>      }
>
>      s =3D xenstore_read(HVM_XS_SMBIOS_DEFAULT_BATTERY, "0");
> @@ -927,7 +927,7 @@ smbios_type_22_init(void *start)
>  static void *
>  smbios_type_32_init(void *start)
>  {
> -    struct smbios_type_32 *p =3D (struct smbios_type_32 *)start;
> +    struct smbios_type_32 *p =3D start;
>
>      memset(p, 0, sizeof(*p));
>
> @@ -946,16 +946,16 @@ smbios_type_32_init(void *start)
>  static void *
>  smbios_type_39_init(void *start)
>  {
> -    struct smbios_type_39 *p =3D (struct smbios_type_39 *)start;
> +    struct smbios_type_39 *p =3D start;
>      void *pts;
>      uint32_t length;
>
>      pts =3D get_smbios_pt_struct(39, &length);
> -    if ( (pts !=3D NULL)&&(length > 0) )
> +    if ( pts !=3D NULL && length > 0 )
>      {
>          memcpy(start, pts, length);
>          p->header.handle =3D SMBIOS_HANDLE_TYPE39;
> -        return (start + length);
> +        return start + length;
>      }
>
>      /* Only present when passed in */
> @@ -998,7 +998,7 @@ smbios_type_vendor_oem_init(void *start)
>  static void *
>  smbios_type_127_init(void *start)
>  {
> -    struct smbios_type_127 *p =3D (struct smbios_type_127 *)start;
> +    struct smbios_type_127 *p =3D start;
>
>      memset(p, 0, sizeof(*p));
>

Frediano

