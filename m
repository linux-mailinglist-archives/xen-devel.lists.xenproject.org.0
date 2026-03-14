Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA+mKkPltGkvuAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 14 Mar 2026 05:34:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3F428B952
	for <lists+xen-devel@lfdr.de>; Sat, 14 Mar 2026 05:34:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254651.1550332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1GgS-00086V-8V; Sat, 14 Mar 2026 04:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254651.1550332; Sat, 14 Mar 2026 04:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1GgS-00083U-10; Sat, 14 Mar 2026 04:33:04 +0000
Received: by outflank-mailman (input) for mailman id 1254651;
 Sat, 14 Mar 2026 04:33:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=897t=BO=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1w1GgQ-00083O-Cg
 for xen-devel@lists.xenproject.org; Sat, 14 Mar 2026 04:33:02 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1691fae-1f5e-11f1-9ccf-f158ae23cfc8;
 Sat, 14 Mar 2026 05:32:59 +0100 (CET)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-b8f9568e074so410995166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 21:32:59 -0700 (PDT)
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
X-Inumbo-ID: e1691fae-1f5e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1773462779; cv=none;
        d=google.com; s=arc-20240605;
        b=cEs5K96UOcnTlTZCCck+G0k6m23tWcDpeDIUU4s5Mmr73RpSDIkXIIGx3UmIHIKkUc
         TW1UZqBiu6hRFmdh/X/xG77uzRYnv4LlqKk78KUUn0toHs4BF4hzjfVKJAx1mr76obBf
         u2Pj1DjlteyE47/3NZwsKqGw4XsTh/zHsb8EfTPN5YNgYU+osfcP6mgxIyjCXg8XiuR2
         Npy1/O9ctNGyAKAx0tbunraEhoAP2Olk/3PYVQ476SQOcyx/fKxO69O5TuVv3UAV2zD6
         03RgUfDkrS2sQiwzdj4ij3j4PWekLVX+HRPZqcGWd3lttg88Bgbuip8bPZROX3X9mDIt
         4FRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g+uUj6Qhw0hrc1O9RaPvQ6mWIY2a49BwjJrjk6y0Uas=;
        fh=1NQfMiWH/3en9AsQV7JkzTQpCunktBXjRX5/hTKo/rs=;
        b=L7JFAQfPSHSsg/4IemnwA3mZv/8x6lCqQtxgTT70MstwJ+jjHlyWKOOheAWKcxXnkh
         WHNvutLnE9M9twRFOl1BxTA7juOF7SwkcOLJTv2kYprIUN1Jz55VqPAsyj5pQ/hgkDSS
         d8jqNGP/a3F2vJ2NLhsS3plGPFINglid+szCKXV3Buo2K/+VRoVeKluuNC2nTZFjgGZc
         FUxBsrHY160khdigq7IFQchcLIYxaiPGq4SC7LE5JYD85bS7k+5Yy8LVncLooC46TCFm
         I5ylBbi6LStshwiVdHfOnkShvst7eTn+iDCw8moKMjtlQaauAOtPV6VElYE6zJiuCURN
         ggwA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773462779; x=1774067579; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g+uUj6Qhw0hrc1O9RaPvQ6mWIY2a49BwjJrjk6y0Uas=;
        b=YcZbus9VdR6hUrXRTDKchXzczEmQBF/U2JkqT1TEt4Gf2BeKKiB3Wc0Qe0jIuXOGC6
         TjlxT02oNFT22lDsyb0wCbSeez7wPyAliFE1mNa/dWDtF4xTYJcf2KeSSEE9QlvelY6Y
         rwP3S1L7PHAcH9f1j2jWCu92zoa1+aC1/YNaZWYdHyFpJfiwXNgTVocinhHa85OJsjsq
         59ksCj8csIPXC6xNF3A1QXC6iM5wEXLVnssmJUt0NP0aO5awbUil79tbhF1ToLzkA+N7
         BKANoNl0P20wF1vO9Pm0/n7uZIyiq27OTSB5SAKo6dwP9XPWsm9Sq891i9JmRjbskb7q
         qNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773462779; x=1774067579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+uUj6Qhw0hrc1O9RaPvQ6mWIY2a49BwjJrjk6y0Uas=;
        b=X9ZVcb/slQks5ElcORww9ojUCLeWY27omkok44RKEy7kjLfmU8R2VNOrNjcHZbJyzi
         fposjjU78zG3EU1NcTLUKtM2ryYZhFrI8QshwTID1PIeT9ks8w+34skq29LG+hGnHunu
         WoP4QcnjsZo4AlhfYSPK8SNJTkf+trwDQPCAO3Kd43hNtbJzHLgd0i9naVsIoy9yFLX4
         u4l+LwC010dYSOp1w1HtB6tbIcubY/3fExT6i+hhbXVaALbdcwaXHbRWfwxxW0ulGSiI
         5d8gbgA/jwlmncIK27M88gK0j35telEbjkqgic+GlwIjyx45SSWwmFagvt9Bm3BH0qbQ
         rcAw==
X-Forwarded-Encrypted: i=1; AJvYcCVpLEXbjbWupVN5oJ/kv7RzMQNSZyvvkH+p3R3fM7gfF03FwNL5IS7zWzNyt005NF3uQdOF3H95eKc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFd4LuIlM37Zds8oO7rLFRy5+ivHBftg9rNeEpsw/mjVQ6eAup
	mWWQmz6M2kpdgEKANLEzzWhbfu8iGm//v5DBBJCeX0NdkMWkancX3fr+Fu0Qs0zT9xMtxpPoZjh
	VtCGjJqx/vodX/p90Bf7F5ACi0x/lzfM=
X-Gm-Gg: ATEYQzzm80Sz8uW6rDM5ppA1MVmK4UxdXAEJrK0Bo9Fgh61S5bjfw1vg91zYYEr4w68
	d+8kFHxdZJQHLtJvdoOnJ/z4MlE5YXQ0lSyB0klHoqi9YywaXcAL4c1VnBfXcSHR/w2rYLBdXpJ
	0/oaDg24dulqwW5TwRDHNLVtOHatmbFiN97cYgVOvIJSPmh1NfA++ulBxbYxn/CNsFaYrzMdCxt
	XHsfcbSMkA17uDLgAhA5yo6qHVY/09jHBqSeGQSIzdt125vtIwYSAzUPUhRNeRLfCTk6vklr4Jd
	YW0hE+EFYBnVH85tx3JWoRq7wOKSLBqTE5DMg1zUa9LuVVb+7l0fyYTFZR0a7XJtib+Jt30hKGI
	sT6n97r/rOrVbIPoqbmPj5p/NGXNd5LqobgUtT5Ab6GosMbFKxu8nVEy7UftolxuDq8e0ANvaSr
	lDaf8xrzo=
X-Received: by 2002:a17:907:3f03:b0:b97:1db4:e5bf with SMTP id
 a640c23a62f3a-b976539185bmr326521066b.34.1773462778806; Fri, 13 Mar 2026
 21:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
 <20260305191810.31033-2-soumyajyotisarkar23@gmail.com> <aa3AKoCFFhwD4-LX@mail-itl>
 <609060f4-d94b-4b65-a10b-5126f10307db@suse.com> <CAGkZZ+sGLY==UxBJ=BGLjfKQTTMMZ7zRzaZ1MAjWT7Ak_gytyQ@mail.gmail.com>
 <7adc329e-6690-46ad-b706-74548dc7ccbc@suse.com>
In-Reply-To: <7adc329e-6690-46ad-b706-74548dc7ccbc@suse.com>
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Date: Sat, 14 Mar 2026 10:02:46 +0530
X-Gm-Features: AaiRm50kAvC7ynemla-Qx2lmVREWVv4P3fNecEfJrcb1kpa_sJiLQPURvn_LieE
Message-ID: <CAGkZZ+v9rDGXo-HJgD_Nkf9=xxTwr_EweTdYJVe4hOH73+CYxw@mail.gmail.com>
Subject: Re: [PATCH 1/3] x86/efi: Add BGRT image preservation during boot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000f40714064cf47ab3"
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[invisiblethingslab.com,lists.xenproject.org,gmail.com,apertussolutions.com,citrix.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA3F428B952
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--000000000000f40714064cf47ab3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Mar, 2026, 7:44=E2=80=AFpm Jan Beulich, <jbeulich@suse.com> wrot=
e:

> On 10.03.2026 14:05, Soumyajyotii Ssarkar wrote:
> > On Mon, Mar 9, 2026 at 1:01=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >
> >> On 08.03.2026 19:30, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Fri, Mar 06, 2026 at 12:48:08AM +0530, Soumyajyotii Ssarkar wrote:
> >>>> --- a/xen/common/efi/boot.c
> >>>> +++ b/xen/common/efi/boot.c
> >>>> @@ -7,6 +7,7 @@
> >>>>  #include <xen/ctype.h>
> >>>>  #include <xen/dmi.h>
> >>>>  #include <xen/domain_page.h>
> >>>> +#include <xen/errno.h>
> >>>>  #include <xen/init.h>
> >>>>  #include <xen/keyhandler.h>
> >>>>  #include <xen/lib.h>
> >>>> @@ -173,6 +174,14 @@ static struct file __initdata ramdisk;
> >>>>  static struct file __initdata xsm;
> >>>>  static const CHAR16 __initconst newline[] =3D L"\r\n";
> >>>>
> >>>> +static __initdata struct {
> >>>> +    bool preserved;
> >>>> +    uint64_t old_addr;
> >>>> +    uint64_t new_addr;
> >>>> +    uint32_t size;
> >>>> +    const char *failure_reason;
> >>>> +} bgrt_debug_info;
> >>>> +
> >>>>  static void __init PrintStr(const CHAR16 *s)
> >>>>  {
> >>>>      StdOut->OutputString(StdOut, (CHAR16 *)s );
> >>>> @@ -747,6 +756,171 @@ static void __init
> >> efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
> >>>>      efi_bs->FreePool(memory_map);
> >>>>  }
> >>>>
> >>>> +struct bmp_header {
> >>>> +    uint16_t signature;
> >>>> +    uint32_t file_size;
> >>>> +    uint16_t reserved_1;
> >>>> +    uint16_t reserved_2;
> >>>> +    uint32_t data_offset;
> >>>> +} __attribute__((packed));
> >>>> +
> >>>> +/*
> >>>> + * ACPI Structures - defined locally,
> >>>> + * since we cannot include acpi headers
> >>>> + * in EFI Context.
> >>>> + */
> >>>> +
> >>>> +struct acpi_rsdp {
> >>>> +    char signature[8];
> >>>> +    uint8_t checksum;
> >>>> +    char oem_id[6];
> >>>> +    uint8_t revision;
> >>>> +    uint32_t rsdt_physical_address;
> >>>> +    uint32_t length;
> >>>> +    uint64_t xsdt_physical_address;
> >>>> +    uint8_t extended_checksum;
> >>>> +    uint8_t reserved[3];
> >>>> +} __attribute__((packed));
> >>>> +
> >>>> +struct acpi_table_header {
> >>>> +    char signature[4];
> >>>> +    uint32_t length;
> >>>> +    uint8_t revision;
> >>>> +    uint8_t checksum;
> >>>> +    char oem_id[6];
> >>>> +    char oem_table_id[8];
> >>>> +    uint32_t oem_revision;
> >>>> +    uint32_t asl_compiler_id;
> >>>> +    uint32_t asl_compiler_revision;
> >>>> +} __attribute__((packed));
> >>>> +
> >>>> +struct acpi_xsdt {
> >>>> +    struct acpi_table_header header;
> >>>> +    uint64_t table_offset_entry[1]; /* Variable array length */
> >>>
> >>> uint64_t table_offset_entry[];
> >>>
> >>> BTW, do we have some canonical place with list of files imported (and
> >>> kept in sync) with other projects? xen/include/acpi/actbl.h doesn't
> >>> exactly follow Xen coding style, but it's unclear to me if it needs t=
o
> >>> stay this way.
> >>
> >> I don't really understand why the headers we've got can't be used. Eve=
n
> >> some of the library-like code under xen/acpi/ may be usable here.
> >>
> >> While we don't exactly keep xen/include/acpi/ in sync with Linux, when
> >> things are added we preferably add them in the way Linux has them.
> >>
> >>
> > I was trying to avoid including the headers from the xen/include/acpi/
> > since it was specified in the comment. to not include them.
> > Specific comment specified below this paragraph.
> > Also since acpi was using datatypes like "u32" while boot.c had types o=
f
> > "uint32", so it felt a bit non-standardized.
> > I checked the rest of the boot.c which followed the same manner. So I
> went
> > with this choice.
> >
> > /* * Keep this arch-specific modified include in the common file, as
> moving
> >  * it to the arch specific include file would obscure that special care
> is
> >  * taken to include it with __ASSEMBLER__ defined.
> > */
> > #define __ASSEMBLER__ /* avoid pulling in ACPI stuff (conflicts with EF=
I)
> > */
> > #include <asm/fixmap.h>
> > #undef __ASSEMBLER__
> > #endif
> >
> > The ACPI headers in /xen/include/acpi uses defines such
> > as ACPI_NAME_SIZE, ACPI_OEM_ID_SIZE
> > and ACPI_OEM_TABLE_ID_SIZE these require adding additional
> > <acpi/acconfig.h> header.
> > Also since their is no acpi headers included in the boot.c file, so i
> > thought to I avoid it.
> >
> > Thus to get it fully working with ACPI headers from the xen/include/acp=
i
> I
> > would require these three headers.
> > #include <acpi/acconfig.h>
> > #include <acpi/actbl.h>
> > #include <acpi/actbl3.h>
> >
> > I thought this would lead to cross contamination, and confusing to
> further
> > modifications in future so weighing my options I thought best to redefi=
ne
> > them,
> > for code clarity.
> > Can you suggest me best option to move forward, should I redefine them =
as
> > is or include the headers?
>
>
>
> First - see about re-using ACPI functions we already have. Then put new
> ACPI
> code you need to add in a file different from the EFI one.
>
> Jan
>

Hey Jan,
Referring to the latest BGRT RFC patch series (RFC v3): as you had
suggested, I have reused the ACPI headers and made the changes you advised.
I hope this version looks satisfactory.

If that approach seems acceptable, I would proceed with introducing a new
file and moving the related changes there as part of the next patch series.

In that case, it might also make sense to involve the ESRT maintainers?
Since I could lay the foundation for the new file and they could extend it
by migrating the ESRT related code their? This might help keep boot.c
cleaner?
I would be interested to know others think on this.

Thank you,
Soumyajyotii Ssarkar

>

--000000000000f40714064cf47ab3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, 10 Mar, 2026, 7:44=E2=80=AFpm Jan Beulich, &lt;<a href=
=3D"mailto:jbeulich@suse.com" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On 10.03.2026 14:05, Soumyajyotii Ssarkar wrote:<br>
&gt; On Mon, Mar 9, 2026 at 1:01=E2=80=AFPM Jan Beulich &lt;<a href=3D"mail=
to:jbeulich@suse.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_b=
lank">jbeulich@suse.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On 08.03.2026 19:30, Marek Marczykowski-G=C3=B3recki wrote:<br>
&gt;&gt;&gt; On Fri, Mar 06, 2026 at 12:48:08AM +0530, Soumyajyotii Ssarkar=
 wrote:<br>
&gt;&gt;&gt;&gt; --- a/xen/common/efi/boot.c<br>
&gt;&gt;&gt;&gt; +++ b/xen/common/efi/boot.c<br>
&gt;&gt;&gt;&gt; @@ -7,6 +7,7 @@<br>
&gt;&gt;&gt;&gt;=C2=A0 #include &lt;xen/ctype.h&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 #include &lt;xen/dmi.h&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 #include &lt;xen/domain_page.h&gt;<br>
&gt;&gt;&gt;&gt; +#include &lt;xen/errno.h&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 #include &lt;xen/init.h&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 #include &lt;xen/keyhandler.h&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 #include &lt;xen/lib.h&gt;<br>
&gt;&gt;&gt;&gt; @@ -173,6 +174,14 @@ static struct file __initdata ramdisk=
;<br>
&gt;&gt;&gt;&gt;=C2=A0 static struct file __initdata xsm;<br>
&gt;&gt;&gt;&gt;=C2=A0 static const CHAR16 __initconst newline[] =3D L&quot=
;\r\n&quot;;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +static __initdata struct {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 bool preserved;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint64_t old_addr;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint64_t new_addr;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint32_t size;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 const char *failure_reason;<br>
&gt;&gt;&gt;&gt; +} bgrt_debug_info;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 static void __init PrintStr(const CHAR16 *s)<br>
&gt;&gt;&gt;&gt;=C2=A0 {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 StdOut-&gt;OutputString(StdOut, (CHAR1=
6 *)s );<br>
&gt;&gt;&gt;&gt; @@ -747,6 +756,171 @@ static void __init<br>
&gt;&gt; efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 efi_bs-&gt;FreePool(memory_map);<br>
&gt;&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +struct bmp_header {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint16_t signature;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint32_t file_size;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint16_t reserved_1;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint16_t reserved_2;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint32_t data_offset;<br>
&gt;&gt;&gt;&gt; +} __attribute__((packed));<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +/*<br>
&gt;&gt;&gt;&gt; + * ACPI Structures - defined locally,<br>
&gt;&gt;&gt;&gt; + * since we cannot include acpi headers<br>
&gt;&gt;&gt;&gt; + * in EFI Context.<br>
&gt;&gt;&gt;&gt; + */<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +struct acpi_rsdp {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 char signature[8];<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint8_t checksum;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 char oem_id[6];<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint8_t revision;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint32_t rsdt_physical_address;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint32_t length;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint64_t xsdt_physical_address;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint8_t extended_checksum;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint8_t reserved[3];<br>
&gt;&gt;&gt;&gt; +} __attribute__((packed));<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +struct acpi_table_header {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 char signature[4];<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint32_t length;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint8_t revision;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint8_t checksum;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 char oem_id[6];<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 char oem_table_id[8];<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint32_t oem_revision;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint32_t asl_compiler_id;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint32_t asl_compiler_revision;<br>
&gt;&gt;&gt;&gt; +} __attribute__((packed));<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +struct acpi_xsdt {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 struct acpi_table_header header;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint64_t table_offset_entry[1]; /* Variable=
 array length */<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; uint64_t table_offset_entry[];<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; BTW, do we have some canonical place with list of files import=
ed (and<br>
&gt;&gt;&gt; kept in sync) with other projects? xen/include/acpi/actbl.h do=
esn&#39;t<br>
&gt;&gt;&gt; exactly follow Xen coding style, but it&#39;s unclear to me if=
 it needs to<br>
&gt;&gt;&gt; stay this way.<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t really understand why the headers we&#39;ve got can&#3=
9;t be used. Even<br>
&gt;&gt; some of the library-like code under xen/acpi/ may be usable here.<=
br>
&gt;&gt;<br>
&gt;&gt; While we don&#39;t exactly keep xen/include/acpi/ in sync with Lin=
ux, when<br>
&gt;&gt; things are added we preferably add them in the way Linux has them.=
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; I was trying to avoid including the headers from the xen/include/acpi/=
<br>
&gt; since it was specified in the comment. to not include them.<br>
&gt; Specific comment specified below this paragraph.<br>
&gt; Also since acpi was using datatypes like &quot;u32&quot; while boot.c =
had types of<br>
&gt; &quot;uint32&quot;, so it felt a bit non-standardized.<br>
&gt; I checked the rest of the boot.c which followed the same manner. So I =
went<br>
&gt; with this choice.<br>
&gt; <br>
&gt; /* * Keep this arch-specific modified include in the common file, as m=
oving<br>
&gt;=C2=A0 * it to the arch specific include file would obscure that specia=
l care is<br>
&gt;=C2=A0 * taken to include it with __ASSEMBLER__ defined.<br>
&gt; */<br>
&gt; #define __ASSEMBLER__ /* avoid pulling in ACPI stuff (conflicts with E=
FI)<br>
&gt; */<br>
&gt; #include &lt;asm/fixmap.h&gt;<br>
&gt; #undef __ASSEMBLER__<br>
&gt; #endif<br>
&gt; <br>
&gt; The ACPI headers in /xen/include/acpi uses defines such<br>
&gt; as ACPI_NAME_SIZE, ACPI_OEM_ID_SIZE<br>
&gt; and ACPI_OEM_TABLE_ID_SIZE these require adding additional<br>
&gt; &lt;acpi/acconfig.h&gt; header.<br>
&gt; Also since their is no acpi headers included in the boot.c file, so i<=
br>
&gt; thought to I avoid it.<br>
&gt; <br>
&gt; Thus to get it fully working with ACPI headers from the xen/include/ac=
pi I<br>
&gt; would require these three headers.<br>
&gt; #include &lt;acpi/acconfig.h&gt;<br>
&gt; #include &lt;acpi/actbl.h&gt;<br>
&gt; #include &lt;acpi/actbl3.h&gt;<br>
&gt; <br>
&gt; I thought this would lead to cross contamination, and confusing to fur=
ther<br>
&gt; modifications in future so weighing my options I thought best to redef=
ine<br>
&gt; them,<br>
&gt; for code clarity.<br>
&gt; Can you suggest me best option to move forward, should I redefine them=
 as<br>
&gt; is or include the headers?<br><br><br><br>
First - see about re-using ACPI functions we already have. Then put new ACP=
I<br>
code you need to add in a file different from the EFI one.<br>
<br>
Jan<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote><=
/div></div><div dir=3D"auto">Hey Jan,</div><div dir=3D"auto">Referring to t=
he latest BGRT RFC patch series (RFC v3): as you had suggested, I have reus=
ed the ACPI headers and made the changes you advised. I hope this version l=
ooks satisfactory.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If th=
at approach seems acceptable, I would proceed with introducing a new file a=
nd moving the related changes there as part of the next patch series.=C2=A0=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">In that case, it might =
also make sense to involve the ESRT maintainers? Since I could lay the foun=
dation for the new file and they could extend it by migrating the ESRT rela=
ted code their? This might help keep boot.c cleaner?</div><div dir=3D"auto"=
>I would be interested to know others think on this.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Thank you,</div><div dir=3D"auto">Soumyajyotii=
 Ssarkar</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
</blockquote></div></div></div>

--000000000000f40714064cf47ab3--

