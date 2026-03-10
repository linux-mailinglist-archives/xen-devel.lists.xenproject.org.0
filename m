Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBqLCGQXsGknfgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 14:06:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5857124F89A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 14:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250104.1547544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzwmL-0003Ao-A7; Tue, 10 Mar 2026 13:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250104.1547544; Tue, 10 Mar 2026 13:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzwmL-000388-6q; Tue, 10 Mar 2026 13:05:41 +0000
Received: by outflank-mailman (input) for mailman id 1250104;
 Tue, 10 Mar 2026 13:05:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDiJ=BK=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1vzwmJ-000381-Nn
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 13:05:40 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4daaa6a-1c81-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 14:05:37 +0100 (CET)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-b9382e59c0eso1079331266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 06:05:37 -0700 (PDT)
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
X-Inumbo-ID: d4daaa6a-1c81-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1773147937; cv=none;
        d=google.com; s=arc-20240605;
        b=McI1cfhYTRN/FLgAKf/qPb0TkMJVTgzJG+agBjLZXGyP5Qdq/CIpTvFfKlQvVJfj7q
         PYb1v/rLyau3xYIMBmCgwG1+fyFy04ZUYR08JJ8aQ1QlIFbrHSYia9oOtgqzFKDE4gW9
         MnJ9TYEKDvnBQhXK1bu85UBeN/syQh6Gqfe73ai/gzbSPtVElh597aSD31B9LZgK4taw
         dvcmy4/ax2kqA/nLc5EUym2xbNwsPQ2Kc5PutjwZE4l1/ACDcdwyEI3/Y1fZb8GnVQBS
         a+zRfJxNYkCg9DOc+p+04J1EsyrH6oIcg0R5BatdQ4zlD6ZRZ+ukxYEaoEnCqRexE8s8
         hisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ga8jCZ7CqbuFk4UhyLtYz4TN6QQ9AKKQ+o8iEh3ZVkU=;
        fh=kR8e0jgh9J8Sozt4pR++eFa4KCzOPti8Z95iha/9tDE=;
        b=Ybbz7lCZYHiiqbnojj92tPi39tQmaBzcx8BoNprEbSDKRSrRbjoXrnTCRp4cwICtqJ
         qLnY/dG6FkvKNM5cpfV8EEL0UG/LUz5s1hvgsbqOS2ilh+ZnkF9bUfxpLe3oYOiNk/qx
         X+cwA08Pz4d+DlMOhik7qpc+zgJP/1vKlH7AQCQNb1G5PUN758cCujo2LuA6Ta+Tserv
         VEYxeP3ehwgPgWjuXf8n1BGFtMkWadSWfllO+eu0otNeGP+Im180qm0SZpWvo0v6I0oZ
         CI5/mejqYCo5kiETKYE0wDxFA5GNNSKCg6FIMWf+KcTyDtUlANLDVmrjdlxrZE9ZNYpH
         OBjA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773147937; x=1773752737; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ga8jCZ7CqbuFk4UhyLtYz4TN6QQ9AKKQ+o8iEh3ZVkU=;
        b=MV7iu4Bwlg0uZTDOS16uSnxGZ3hVUCRi4lkUj2vj6EcYnZy31i9ExiQIoYxMUQHsLj
         YlUgGtLQ6d/zOYNNWTHtkviOhCKSawdgPK7wi5RQnYfYaWnamZ2C7pQnLeBuvvBecGGJ
         h/IsHKoxGUwHFHuaacWBF08NvH4vaL9MTdQoHcDJo7cF8uQEN3P3q5kMywQ/AZ7ekw6N
         ltCTd7PUirXgIHKLzX/EjrhI0kO7k4RS1uQDJ09++CqlJuiZI3oQVy37kdZr+eBeOSnc
         icomaHfRdbV2xvNfIiFjg9mb9vMk9DMBK3nBul3xZYcccwuc5ebMnXh8N3LDVzD+DUEp
         3/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147937; x=1773752737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ga8jCZ7CqbuFk4UhyLtYz4TN6QQ9AKKQ+o8iEh3ZVkU=;
        b=t2kMYzXENDZDy2ksLSO5ly9xWlEtZ7RqgApBUSwJOkYJXBzyuv0wjKbzufoA4woKAl
         6ULqdjWRH2LX0xmbahBrJ2iqc4/3qteDA94Z/A7nYRjXLakf8XHLCsmGBi03n+b7auEf
         oVSNncMCtN1nBLfrNX14YlH61moZTspXbrxOn/QFCiBMoK6j66C/dgjuYEwHEOEjmXzf
         WYwYOWwJUi3eyujJoeJBW/MxCVVZ8T34kyRvsl75J9f/F8VO6BpE7FYsDkMSli6aUNVV
         vSD/URDoPKfHCf4885pxR68is/kPMTXB1T1sRZ/U2wsQjYFBGKyG634lxvJ77snniGu9
         ya9A==
X-Forwarded-Encrypted: i=1; AJvYcCV2kBqqpZ/5UKbBEUj+0L/UF5Gtz9c/NBI4BgwM28sp5g1AcMs7dcdbJ7ei9KHs44llPSDMJGrnNvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLA4OBgUZocNzEnlwghcUmFw9qNskWc/tWBgwR9PxnoDrexpm9
	euIm3PBFo8dlj2C9ydGqRL9h6BkiS1Bfs6MUJbGUlpwlDD+P1n3D95Oj+IQbXXyDzbGuCmhf9Uz
	IZcdLN/7tQRmEHjS6TT9UGcDmhxpab1s=
X-Gm-Gg: ATEYQzyb7lVtgiiOz7g/cVyiZejcQDuyCUj3SP/zEp/xZXXEyeAlE9RMwTSf01JmrgE
	RBH7nz7TDlYCydz4WCJXqP+YBeNOqRI9kqVXWLw+4BSDr94mhtdXgV7R0LV6HdkJRdR9Y8pXQ5g
	7QYE7buX5/MvZNUa/OMXYfrYICJrUZJu9mnvD9lCLSLcwQqx7KTFewjAsLFGuR4H9FRnULpGXLN
	pWAq+wVvdz8TFliMV03hwtNdTPXBiq6Igs6GMfYDsKccKU7NaypomsHI3VVQsRX7Il2KcCxnARE
	PAnone0XwWgcvo5sLulK050WC4BBnQvlaQRdmDHsdkIx+0FAYzJeQAirVOnAvy3JwMK9Y5JMSXO
	86z0knqbKDGRJ5kMYMXDovzbKaE1Fc47XcW5111vEjYloQEUM
X-Received: by 2002:a17:907:d91:b0:b96:dac1:60b with SMTP id
 a640c23a62f3a-b96dac10e1fmr594792266b.49.1773147936272; Tue, 10 Mar 2026
 06:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
 <20260305191810.31033-2-soumyajyotisarkar23@gmail.com> <aa3AKoCFFhwD4-LX@mail-itl>
 <609060f4-d94b-4b65-a10b-5126f10307db@suse.com>
In-Reply-To: <609060f4-d94b-4b65-a10b-5126f10307db@suse.com>
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Date: Tue, 10 Mar 2026 18:35:24 +0530
X-Gm-Features: AaiRm52DwxILmcUMzvBlmOS6wDYYa4zXQH9UHyXqq5qdsqK9MySdegCo4yT6kFc
Message-ID: <CAGkZZ+sGLY==UxBJ=BGLjfKQTTMMZ7zRzaZ1MAjWT7Ak_gytyQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] x86/efi: Add BGRT image preservation during boot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000e035cd064cab2cd5"
X-Rspamd-Queue-Id: 5857124F89A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[invisiblethingslab.com,lists.xenproject.org,gmail.com,apertussolutions.com,citrix.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.533];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

--000000000000e035cd064cab2cd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 1:01=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:

> On 08.03.2026 19:30, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Mar 06, 2026 at 12:48:08AM +0530, Soumyajyotii Ssarkar wrote:
> >> --- a/xen/common/efi/boot.c
> >> +++ b/xen/common/efi/boot.c
> >> @@ -7,6 +7,7 @@
> >>  #include <xen/ctype.h>
> >>  #include <xen/dmi.h>
> >>  #include <xen/domain_page.h>
> >> +#include <xen/errno.h>
> >>  #include <xen/init.h>
> >>  #include <xen/keyhandler.h>
> >>  #include <xen/lib.h>
> >> @@ -173,6 +174,14 @@ static struct file __initdata ramdisk;
> >>  static struct file __initdata xsm;
> >>  static const CHAR16 __initconst newline[] =3D L"\r\n";
> >>
> >> +static __initdata struct {
> >> +    bool preserved;
> >> +    uint64_t old_addr;
> >> +    uint64_t new_addr;
> >> +    uint32_t size;
> >> +    const char *failure_reason;
> >> +} bgrt_debug_info;
> >> +
> >>  static void __init PrintStr(const CHAR16 *s)
> >>  {
> >>      StdOut->OutputString(StdOut, (CHAR16 *)s );
> >> @@ -747,6 +756,171 @@ static void __init
> efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
> >>      efi_bs->FreePool(memory_map);
> >>  }
> >>
> >> +struct bmp_header {
> >> +    uint16_t signature;
> >> +    uint32_t file_size;
> >> +    uint16_t reserved_1;
> >> +    uint16_t reserved_2;
> >> +    uint32_t data_offset;
> >> +} __attribute__((packed));
> >> +
> >> +/*
> >> + * ACPI Structures - defined locally,
> >> + * since we cannot include acpi headers
> >> + * in EFI Context.
> >> + */
> >> +
> >> +struct acpi_rsdp {
> >> +    char signature[8];
> >> +    uint8_t checksum;
> >> +    char oem_id[6];
> >> +    uint8_t revision;
> >> +    uint32_t rsdt_physical_address;
> >> +    uint32_t length;
> >> +    uint64_t xsdt_physical_address;
> >> +    uint8_t extended_checksum;
> >> +    uint8_t reserved[3];
> >> +} __attribute__((packed));
> >> +
> >> +struct acpi_table_header {
> >> +    char signature[4];
> >> +    uint32_t length;
> >> +    uint8_t revision;
> >> +    uint8_t checksum;
> >> +    char oem_id[6];
> >> +    char oem_table_id[8];
> >> +    uint32_t oem_revision;
> >> +    uint32_t asl_compiler_id;
> >> +    uint32_t asl_compiler_revision;
> >> +} __attribute__((packed));
> >> +
> >> +struct acpi_xsdt {
> >> +    struct acpi_table_header header;
> >> +    uint64_t table_offset_entry[1]; /* Variable array length */
> >
> > uint64_t table_offset_entry[];
> >
> > BTW, do we have some canonical place with list of files imported (and
> > kept in sync) with other projects? xen/include/acpi/actbl.h doesn't
> > exactly follow Xen coding style, but it's unclear to me if it needs to
> > stay this way.
>
> I don't really understand why the headers we've got can't be used. Even
> some of the library-like code under xen/acpi/ may be usable here.
>
> While we don't exactly keep xen/include/acpi/ in sync with Linux, when
> things are added we preferably add them in the way Linux has them.
>
>
I was trying to avoid including the headers from the xen/include/acpi/
since it was specified in the comment. to not include them.
Specific comment specified below this paragraph.
Also since acpi was using datatypes like "u32" while boot.c had types of
"uint32", so it felt a bit non-standardized.
I checked the rest of the boot.c which followed the same manner. So I went
with this choice.

/* * Keep this arch-specific modified include in the common file, as moving
 * it to the arch specific include file would obscure that special care is
 * taken to include it with __ASSEMBLER__ defined.
*/
#define __ASSEMBLER__ /* avoid pulling in ACPI stuff (conflicts with EFI)
*/
#include <asm/fixmap.h>
#undef __ASSEMBLER__
#endif

The ACPI headers in /xen/include/acpi uses defines such
as ACPI_NAME_SIZE, ACPI_OEM_ID_SIZE
and ACPI_OEM_TABLE_ID_SIZE these require adding additional
<acpi/acconfig.h> header.
Also since their is no acpi headers included in the boot.c file, so i
thought to I avoid it.

Thus to get it fully working with ACPI headers from the xen/include/acpi I
would require these three headers.
#include <acpi/acconfig.h>
#include <acpi/actbl.h>
#include <acpi/actbl3.h>

I thought this would lead to cross contamination, and confusing to further
modifications in future so weighing my options I thought best to redefine
them,
for code clarity.
Can you suggest me best option to move forward, should I redefine them as
is or include the headers?

>> +} __attribute__((packed));
> >> +
> >> +struct acpi_bgrt {
> >> +    struct acpi_table_header header;
> >> +    uint16_t version;
> >> +    uint8_t status;
> >> +    uint8_t image_type;
> >> +    uint64_t image_address;
> >> +    uint32_t image_offset_x;
> >> +    uint32_t image_offset_y;
> >> +} __attribute__((packed));
> >> +
> >> +static struct acpi_bgrt* __init find_bgrt_table(EFI_SYSTEM_TABLE
> *SystemTable)
>
> Nit (style): The first * is misplaced.
>
> >> +{
> >> +    EFI_GUID acpi2_guid =3D ACPI_20_TABLE_GUID;
> >> +    struct acpi_rsdp *rsdp =3D NULL;
> >> +    struct acpi_xsdt *xsdt;
> >> +    struct acpi_bgrt *bgrt;
>
> Here and ...
>
> >> +    uint32_t entry_count, actual_size;
> >> +    unsigned int i;
> >> +
> >> +    for ( i =3D 0; i < SystemTable->NumberOfTableEntries; i++ )
> >> +    {
> >> +        if ( match_guid(&acpi2_guid,
> &SystemTable->ConfigurationTable[i].VendorGuid) )
> >> +        {
> >> +            rsdp =3D SystemTable->ConfigurationTable[i].VendorTable;
> >> +            break;
> >> +        }
> >> +    }
> >> +
> >> +    if ( !rsdp || !rsdp->xsdt_physical_address )
> >> +        return NULL;
> >> +
> >> +    xsdt =3D (struct acpi_xsdt *)rsdp->xsdt_physical_address;
> >> +    if ( !xsdt )
> >> +        return NULL;
> >> +
> >> +    actual_size =3D (xsdt->header.length - sizeof(struct
> acpi_table_header));
> >> +    entry_count =3D (actual_size / sizeof(uint64_t));
> >> +
> >> +    for ( i =3D 0; i < entry_count; i++ )
> >> +    {
> >> +        struct acpi_table_header *header =3D (struct acpi_table_heade=
r
> *)xsdt->table_offset_entry[i];
>
> ... here and elsewhere - please use pointer-to-const wherever possible.
>
> >> +        if (   header->signature[0] =3D=3D 'B'
> >> +            && header->signature[1] =3D=3D 'G'
> >> +            && header->signature[2] =3D=3D 'R'
> >> +            && header->signature[3] =3D=3D 'T' )
> >
> > strncmp?
>
> Or even memcmp() in this case. Plus there is ACPI_SIG_BGRT.


Yeah, my apologies. Since I was going with the whole not including acpi
headers idea,
I thought this would be better stylistic choice.

New patch version with strncmp upcoming.

The headers are in xen/include/acpi, so was trying to work around without
including them.
Perhaps including the headers would be the move forward?

What is your opinion Marek?


>
>> +        {
> >> +            bgrt =3D (struct acpi_bgrt *)header;
> >
> > You can just return it here, avoiding the extra variable.
> >
> >> +            return bgrt;
> >> +        }
> >> +    }
> >> +    return NULL;
> >> +}
> >> +
> >> +#define MAX_IMAGE_SIZE  (16 * 1024 * 1024)    /* Sanity check: reject
> if bigger */
> >> +
> >> +static void __init efi_preserve_bgrt_img(EFI_SYSTEM_TABLE *SystemTabl=
e)
> >> +{
> >> +    struct acpi_bgrt *bgrt;
> >> +    struct bmp_header *bmp;
> >> +    void *old_image, *new_image;
> >> +    uint32_t image_size;
> >> +    EFI_STATUS status;
> >> +    uint8_t checksum;
> >> +    unsigned int i;
> >> +
> >> +    bgrt_debug_info.preserved =3D false;
> >> +    bgrt_debug_info.failure_reason =3D NULL;
> >> +
> >> +    bgrt =3D find_bgrt_table(SystemTable);
> >> +    if ( !bgrt )
> >> +    {
> >> +        bgrt_debug_info.failure_reason =3D "BGRT table not found in
> XSDT";
> >> +        return;
> >> +    }
> >> +
> >> +    if ( !bgrt->image_address )
> >> +    {
> >> +        bgrt_debug_info.failure_reason =3D "BGRT image_address is NUL=
L";
> >> +        return;
> >> +    }
> >> +
> >> +    old_image =3D (void *)bgrt->image_address;
> >> +    bmp =3D (struct bmp_header *)old_image;
> >> +
> >> +    if ( bmp->signature !=3D 0x4D42 )
> >> +    {
> >> +        bgrt_debug_info.failure_reason =3D "Invalid BMP signature";
> >> +        return;
> >> +    }
> >> +
> >> +    image_size =3D bmp->file_size;
> >> +    if ( !image_size || image_size > MAX_IMAGE_SIZE )
> >> +    {
> >> +        bgrt_debug_info.failure_reason =3D "Invalid image size";
> >> +        return;
> >> +    }
> >> +
> >> +    status =3D efi_bs->AllocatePool(EfiACPIReclaimMemory, image_size,
> &new_image);
> >> +    if ( status !=3D EFI_SUCCESS || !new_image )
> >> +    {
> >> +        bgrt_debug_info.failure_reason =3D "Memory allocation failed"=
;
> >> +        return;
> >> +    }
> >> +
> >> +    memcpy(new_image, old_image, image_size);
> >> +
> >> +    bgrt->image_address =3D (uint64_t)new_image;
> >> +    bgrt->status |=3D 0x01;
> >
> > Why forcing the "displayed" bit here?
>
> And if this is needed, why by way of a literal number rather than a
> suitable
> #define?
>
> >> +    bgrt->header.checksum =3D 0;
> >> +    checksum =3D 0;
> >> +    for ( i =3D 0; i < bgrt->header.length; i++ )
> >> +        checksum +=3D ((uint8_t *)bgrt)[i];
> >> +    bgrt->header.checksum =3D (uint8_t)(0 - checksum);
> >> +
> >> +    bgrt_debug_info.preserved =3D true;
> >> +    bgrt_debug_info.old_addr =3D (uint64_t)old_image;
> >> +    bgrt_debug_info.new_addr =3D (uint64_t)new_image;
> >> +    bgrt_debug_info.size =3D image_size;
> >> +}
> >> +
> >
> > This is quite a bit of code, maybe move to a separate file? But I'd lik=
e
> > to hear what others think.
>
>
I believe it won't be necessary to add a separate file for this since it's
just a 2 functions.
I believe this since most of the ESRT patches, which I based my patches on
didn't use a separate file.
But now since with the whole, header issue and redefining the structs I
think a separate file would also be a viable option too.

Perhaps any 2 options:
Moving with a separate file for cleaner code.
Moving with existing file for non-standardized code.
I would love your opinions on this.

Further, I think I should revise the further patches to RFC for clarity.
Before coming to a conclusion.
And sending as patch to be pulled.

Whether to put in a separate file is only the 2nd question imo. The first i=
s
> whether this much code is needed in the first place.
>


> Jan
>

--000000000000e035cd064cab2cd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, Mar 9, 2026 at 1=
:01=E2=80=AFPM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt; wrote:</div><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On 08.03.2026 19:30, Ma=
rek Marczykowski-G=C3=B3recki wrote:<br>
&gt; On Fri, Mar 06, 2026 at 12:48:08AM +0530, Soumyajyotii Ssarkar wrote:<=
br>
&gt;&gt; --- a/xen/common/efi/boot.c<br>
&gt;&gt; +++ b/xen/common/efi/boot.c<br>
&gt;&gt; @@ -7,6 +7,7 @@<br>
&gt;&gt;=C2=A0 #include &lt;xen/ctype.h&gt;<br>
&gt;&gt;=C2=A0 #include &lt;xen/dmi.h&gt;<br>
&gt;&gt;=C2=A0 #include &lt;xen/domain_page.h&gt;<br>
&gt;&gt; +#include &lt;xen/errno.h&gt;<br>
&gt;&gt;=C2=A0 #include &lt;xen/init.h&gt;<br>
&gt;&gt;=C2=A0 #include &lt;xen/keyhandler.h&gt;<br>
&gt;&gt;=C2=A0 #include &lt;xen/lib.h&gt;<br>
&gt;&gt; @@ -173,6 +174,14 @@ static struct file __initdata ramdisk;<br>
&gt;&gt;=C2=A0 static struct file __initdata xsm;<br>
&gt;&gt;=C2=A0 static const CHAR16 __initconst newline[] =3D L&quot;\r\n&qu=
ot;;<br>
&gt;&gt;<br>
&gt;&gt; +static __initdata struct {<br>
&gt;&gt; +=C2=A0 =C2=A0 bool preserved;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t old_addr;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t new_addr;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t size;<br>
&gt;&gt; +=C2=A0 =C2=A0 const char *failure_reason;<br>
&gt;&gt; +} bgrt_debug_info;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 static void __init PrintStr(const CHAR16 *s)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 StdOut-&gt;OutputString(StdOut, (CHAR16 *)s );=
<br>
&gt;&gt; @@ -747,6 +756,171 @@ static void __init efi_relocate_esrt(EFI_SYS=
TEM_TABLE *SystemTable)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 efi_bs-&gt;FreePool(memory_map);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +struct bmp_header {<br>
&gt;&gt; +=C2=A0 =C2=A0 uint16_t signature;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t file_size;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint16_t reserved_1;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint16_t reserved_2;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t data_offset;<br>
&gt;&gt; +} __attribute__((packed));<br>
&gt;&gt; +<br>
&gt;&gt; +/*<br>
&gt;&gt; + * ACPI Structures - defined locally,<br>
&gt;&gt; + * since we cannot include acpi headers<br>
&gt;&gt; + * in EFI Context.<br>
&gt;&gt; + */<br>
&gt;&gt; +<br>
&gt;&gt; +struct acpi_rsdp {<br>
&gt;&gt; +=C2=A0 =C2=A0 char signature[8];<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t checksum;<br>
&gt;&gt; +=C2=A0 =C2=A0 char oem_id[6];<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t revision;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t rsdt_physical_address;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t length;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t xsdt_physical_address;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t extended_checksum;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t reserved[3];<br>
&gt;&gt; +} __attribute__((packed));<br>
&gt;&gt; +<br>
&gt;&gt; +struct acpi_table_header {<br>
&gt;&gt; +=C2=A0 =C2=A0 char signature[4];<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t length;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t revision;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t checksum;<br>
&gt;&gt; +=C2=A0 =C2=A0 char oem_id[6];<br>
&gt;&gt; +=C2=A0 =C2=A0 char oem_table_id[8];<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t oem_revision;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t asl_compiler_id;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t asl_compiler_revision;<br>
&gt;&gt; +} __attribute__((packed));<br>
&gt;&gt; +<br>
&gt;&gt; +struct acpi_xsdt {<br>
&gt;&gt; +=C2=A0 =C2=A0 struct acpi_table_header header;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t table_offset_entry[1]; /* Variable array l=
ength */<br>
&gt; <br>
&gt; uint64_t table_offset_entry[];<br>
&gt; <br>
&gt; BTW, do we have some canonical place with list of files imported (and<=
br>
&gt; kept in sync) with other projects? xen/include/acpi/actbl.h doesn&#39;=
t<br>
&gt; exactly follow Xen coding style, but it&#39;s unclear to me if it need=
s to<br>
&gt; stay this way.<br>
<br>
I don&#39;t really understand why the headers we&#39;ve got can&#39;t be us=
ed. Even<br>
some of the library-like code under xen/acpi/ may be usable here.<br>
<br>
While we don&#39;t exactly keep xen/include/acpi/ in sync with Linux, when<=
br>
things are added we preferably add them in the way Linux has them.<br>
<br></blockquote><div>=C2=A0</div><div>I was trying to avoid including the =
headers from the xen/include/acpi/ since it was specified in the comment. t=
o not include them.</div><div>Specific comment specified below this paragra=
ph.</div><div>Also since acpi was using datatypes like &quot;u32&quot; whil=
e boot.c had types of &quot;uint32&quot;, so it felt a bit non-standardized=
.</div><div>I checked the rest of the boot.c which followed the same manner=
. So I went with this choice.</div><div><br></div><div>/* * Keep this arch-=
specific modified include in the common file, as moving=C2=A0</div><div>=C2=
=A0* it to the arch specific include file would obscure that special care i=
s=C2=A0</div><div>=C2=A0* taken to include it with __ASSEMBLER__ defined.=
=C2=A0</div><div>*/=C2=A0</div><div>#define __ASSEMBLER__ /* avoid pulling =
in ACPI stuff (conflicts with EFI) */=C2=A0</div><div>#include &lt;asm/fixm=
ap.h&gt;=C2=A0</div><div>#undef __ASSEMBLER__=C2=A0</div><div>#endif=C2=A0<=
/div><div><br></div><div>The ACPI headers in /xen/include/acpi uses defines=
 such as=C2=A0ACPI_NAME_SIZE,=C2=A0ACPI_OEM_ID_SIZE=C2=A0</div><div>and=C2=
=A0ACPI_OEM_TABLE_ID_SIZE these require adding additional &lt;acpi/acconfig=
.h&gt; header.</div><div>Also since their is no acpi headers included in th=
e boot.c file, so i thought to I avoid it.</div><div><br></div><div>Thus to=
 get it fully working with ACPI headers from the xen/include/acpi I would r=
equire these three headers.</div><div>#include &lt;acpi/acconfig.h&gt;<br>#=
include &lt;acpi/actbl.h&gt;<br>#include &lt;acpi/actbl3.h&gt;</div><div><b=
r></div><div>I thought this would lead to cross contamination, and confusin=
g to further modifications in future so weighing my options I thought best =
to redefine them,</div><div>for code clarity.</div><div>Can you suggest me =
best option to move forward, should I redefine them as is or include the he=
aders?=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">&gt;&gt; +} __attribute__((packed));<br>
&gt;&gt; +<br>
&gt;&gt; +struct acpi_bgrt {<br>
&gt;&gt; +=C2=A0 =C2=A0 struct acpi_table_header header;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint16_t version;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t status;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t image_type;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t image_address;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t image_offset_x;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t image_offset_y;<br>
&gt;&gt; +} __attribute__((packed));<br>
&gt;&gt; +<br>
&gt;&gt; +static struct acpi_bgrt* __init find_bgrt_table(EFI_SYSTEM_TABLE =
*SystemTable)<br>
<br>
Nit (style): The first * is misplaced.<br>
<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 EFI_GUID acpi2_guid =3D ACPI_20_TABLE_GUID;<br>
&gt;&gt; +=C2=A0 =C2=A0 struct acpi_rsdp *rsdp =3D NULL;<br>
&gt;&gt; +=C2=A0 =C2=A0 struct acpi_xsdt *xsdt;<br>
&gt;&gt; +=C2=A0 =C2=A0 struct acpi_bgrt *bgrt;<br>
<br>
Here and ...<br>
<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t entry_count, actual_size;<br>
&gt;&gt; +=C2=A0 =C2=A0 unsigned int i;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 for ( i =3D 0; i &lt; SystemTable-&gt;NumberOfTable=
Entries; i++ )<br>
&gt;&gt; +=C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( match_guid(&amp;acpi2_guid, &amp=
;SystemTable-&gt;ConfigurationTable[i].VendorGuid) )<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rsdp =3D SystemTable-&g=
t;ConfigurationTable[i].VendorTable;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if ( !rsdp || !rsdp-&gt;xsdt_physical_address )<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 xsdt =3D (struct acpi_xsdt *)rsdp-&gt;xsdt_physical=
_address;<br>
&gt;&gt; +=C2=A0 =C2=A0 if ( !xsdt )<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 actual_size =3D (xsdt-&gt;header.length - sizeof(st=
ruct acpi_table_header));<br>
&gt;&gt; +=C2=A0 =C2=A0 entry_count =3D (actual_size / sizeof(uint64_t));<b=
r>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 for ( i =3D 0; i &lt; entry_count; i++ )<br>
&gt;&gt; +=C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct acpi_table_header *header =3D =
(struct acpi_table_header *)xsdt-&gt;table_offset_entry[i];<br>
<br>
... here and elsewhere - please use pointer-to-const wherever possible.<br>
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=C2=A0 =C2=A0header-&gt;signature=
[0] =3D=3D &#39;B&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; header-&gt;s=
ignature[1] =3D=3D &#39;G&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; header-&gt;s=
ignature[2] =3D=3D &#39;R&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; header-&gt;s=
ignature[3] =3D=3D &#39;T&#39; )<br>
&gt; <br>
&gt; strncmp?<br>
<br>
Or even memcmp() in this case. Plus there is ACPI_SIG_BGRT.</blockquote><di=
v><br></div><div>Yeah, my apologies. Since I was going with the whole not i=
ncluding acpi headers idea,=C2=A0</div><div>I thought this would be better =
stylistic choice.=C2=A0</div><div><br></div><div>New patch version with str=
ncmp upcoming.</div><div>=C2=A0</div><div>The headers are in xen/include/ac=
pi, so was trying to work around without including them.</div><div>Perhaps =
including the headers would be the move forward?</div><div><br></div><div>W=
hat is your opinion Marek?</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bgrt =3D (struct acpi_b=
grt *)header;<br>
&gt; <br>
&gt; You can just return it here, avoiding the extra variable.<br>
&gt; <br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return bgrt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 return NULL;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +#define MAX_IMAGE_SIZE=C2=A0 (16 * 1024 * 1024)=C2=A0 =C2=A0 /* S=
anity check: reject if bigger */<br>
&gt;&gt; +<br>
&gt;&gt; +static void __init efi_preserve_bgrt_img(EFI_SYSTEM_TABLE *System=
Table)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 struct acpi_bgrt *bgrt;<br>
&gt;&gt; +=C2=A0 =C2=A0 struct bmp_header *bmp;<br>
&gt;&gt; +=C2=A0 =C2=A0 void *old_image, *new_image;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t image_size;<br>
&gt;&gt; +=C2=A0 =C2=A0 EFI_STATUS status;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t checksum;<br>
&gt;&gt; +=C2=A0 =C2=A0 unsigned int i;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 bgrt_debug_info.preserved =3D false;<br>
&gt;&gt; +=C2=A0 =C2=A0 bgrt_debug_info.failure_reason =3D NULL;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 bgrt =3D find_bgrt_table(SystemTable);<br>
&gt;&gt; +=C2=A0 =C2=A0 if ( !bgrt )<br>
&gt;&gt; +=C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bgrt_debug_info.failure_reason =3D &q=
uot;BGRT table not found in XSDT&quot;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if ( !bgrt-&gt;image_address )<br>
&gt;&gt; +=C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bgrt_debug_info.failure_reason =3D &q=
uot;BGRT image_address is NULL&quot;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 old_image =3D (void *)bgrt-&gt;image_address;<br>
&gt;&gt; +=C2=A0 =C2=A0 bmp =3D (struct bmp_header *)old_image;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if ( bmp-&gt;signature !=3D 0x4D42 )<br>
&gt;&gt; +=C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bgrt_debug_info.failure_reason =3D &q=
uot;Invalid BMP signature&quot;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 image_size =3D bmp-&gt;file_size;<br>
&gt;&gt; +=C2=A0 =C2=A0 if ( !image_size || image_size &gt; MAX_IMAGE_SIZE =
)<br>
&gt;&gt; +=C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bgrt_debug_info.failure_reason =3D &q=
uot;Invalid image size&quot;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 status =3D efi_bs-&gt;AllocatePool(EfiACPIReclaimMe=
mory, image_size, &amp;new_image);<br>
&gt;&gt; +=C2=A0 =C2=A0 if ( status !=3D EFI_SUCCESS || !new_image )<br>
&gt;&gt; +=C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bgrt_debug_info.failure_reason =3D &q=
uot;Memory allocation failed&quot;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 memcpy(new_image, old_image, image_size);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 bgrt-&gt;image_address =3D (uint64_t)new_image;<br>
&gt;&gt; +=C2=A0 =C2=A0 bgrt-&gt;status |=3D 0x01;<br>
&gt; <br>
&gt; Why forcing the &quot;displayed&quot; bit here?<br>
<br>
And if this is needed, why by way of a literal number rather than a suitabl=
e<br>
#define?<br>
<br>
&gt;&gt; +=C2=A0 =C2=A0 bgrt-&gt;header.checksum =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 checksum =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 for ( i =3D 0; i &lt; bgrt-&gt;header.length; i++ )=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 checksum +=3D ((uint8_t *)bgrt)[i];<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 bgrt-&gt;header.checksum =3D (uint8_t)(0 - checksum=
);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 bgrt_debug_info.preserved =3D true;<br>
&gt;&gt; +=C2=A0 =C2=A0 bgrt_debug_info.old_addr =3D (uint64_t)old_image;<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 bgrt_debug_info.new_addr =3D (uint64_t)new_image;<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 bgrt_debug_info.size =3D image_size;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt; <br>
&gt; This is quite a bit of code, maybe move to a separate file? But I&#39;=
d like<br>
&gt; to hear what others think.<br><br></blockquote><div><br class=3D"gmail=
-Apple-interchange-newline">I believe it won&#39;t be necessary to add a se=
parate file for this since it&#39;s just a 2 functions.</div><div>I believe=
 this since most of the ESRT patches, which I based my patches on didn&#39;=
t use a separate file.</div><div>But now since with the whole, header issue=
 and redefining the structs I think a separate file would also be a viable =
option too.</div><div><br></div><div>Perhaps any 2 options:</div><div>Movin=
g with a separate file for cleaner code.</div><div>Moving with existing fil=
e for non-standardized code.</div><div>I would love your opinions on this.<=
/div><div><br></div><div>Further, I think I should revise the further patch=
es to RFC for clarity. Before coming to a conclusion.</div><div>And sending=
 as patch to be pulled.</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
Whether to put in a separate file is only the 2nd question imo. The first i=
s<br>
whether this much code is needed in the first place.<br>
<div></div></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Jan<br>
</blockquote></div></div>
</div>

--000000000000e035cd064cab2cd5--

