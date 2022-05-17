Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22C352A8E6
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 19:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331315.554804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0fn-00035X-5C; Tue, 17 May 2022 17:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331315.554804; Tue, 17 May 2022 17:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0fn-00032c-0v; Tue, 17 May 2022 17:07:51 +0000
Received: by outflank-mailman (input) for mailman id 331315;
 Tue, 17 May 2022 17:07:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TUNC=VZ=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nr0fl-00032W-IO
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 17:07:49 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df76c42a-d603-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 19:07:47 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 261545C006E;
 Tue, 17 May 2022 13:07:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 17 May 2022 13:07:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 May 2022 13:07:45 -0400 (EDT)
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
X-Inumbo-ID: df76c42a-d603-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1652807266; x=1652893666; bh=4tDoSEQhdS
	9niDMV646Qebgz6622yWtjkDpobgZ8Kz8=; b=neUUe1VFphEnnyeh0pDnAnw7f6
	Qb2NJ8nUtnxQnNqvz0rVaknvTqFK/JNG16lqCx/ox0y/R+msCbtZ/+vBfZOXLaNA
	oe8DK8FvqG0qvf1BPRLipZj5/pn30Dng5qyyia80CkGEJYxaRetvj4FAn5VCDrxY
	Ah6aONZHj3woEuzEivyNtpGx9yBMkfBlBJtKdRRJZ8KGndEkvv7DYGUu3VrbFkSJ
	oqj4ZXtXTUPqp6bcLu8GFl/NFH40sw0ppXINrR1fuwctLCyx56RkcrDKat0WAVEJ
	VkBtAlrPh9Ay48/1KzRbuHclXG3ohtQMOaO8wvluu+nqh34ukTbJ3tLwVTBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652807266; x=
	1652893666; bh=4tDoSEQhdS9niDMV646Qebgz6622yWtjkDpobgZ8Kz8=; b=x
	RaJOcSCE6xWOZeoMjQ2/q26awUqOMYz0YY00zzgYDglx/wtvbT0Zo8rYAEPCufL9
	gB95SoMeLAVokiU5K1CYRvknxakDdiI8e9MiJbGUQ2yS6mJBHAJJXAHlPohY/nTM
	JSZS3Zpv3i3n2lbulY+ncdfL11OZGq2PyZXGpMcJjvkv2TCG6xXslv7teE6t2w7X
	51+G2O03tlDVqsdmzMiNvkkPAVkq9JK3no+ohnJzwONUwUcrjcve4LA0s/KpwnuS
	KVCXl0PnpsDX8YHlPNuc39GdZE4lic1yuHnzX9tWT1CTb91s6Pc7b6R42EpeRUOW
	27FZ/8XkhaDd9GXCmqJvQ==
X-ME-Sender: <xms:YdaDYtvS7aOuRxODzmJZXB9Ih4oTqq1YGedGq1kNhO70QtzKlcgqLA>
    <xme:YdaDYmeljQsXD4W6TuG7Pvcoq0XB08FWZG8PJs35_6d4zOw1aC9fqATK8Gj6vwX9n
    aHaUFMzRAFXk14>
X-ME-Received: <xmr:YdaDYgxPPvJQIg__DcyPobo0shrlbBV32j_ZivMV4VHvqmL7FksuT4Qslfpo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepudekteekkeekkedvteegtdektefftdfh
    tddtgfeifffhkeehhfejhfevgefgieehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
    ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:YdaDYkPcf6vBxHnBgi8RzABV_n-CUMqMjodWAyzlXTAjeU-6Nu9Kcg>
    <xmx:YdaDYt--XEn3Bq2Jeh6uf4qYWyZYh1e8wcv63hpbaNCvvceXVhX93A>
    <xmx:YdaDYkU7dGhe7o93GBQAQ0XN0JyVv0jnQ18E5ukeDEe9hTF6rZRQsQ>
    <xmx:YtaDYiJ-pMcovtt9LLGw_bHajHCQR-5UJNCBMEpRVswYzTKwmZdAmA>
Feedback-ID: iac594737:Fastmail
Date: Tue, 17 May 2022 13:07:42 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] Preserve the EFI System Resource Table for dom0
Message-ID: <YoPWX7lQH4ZmxV9u@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HLK4XKn2pm9LO02N"
Content-Disposition: inline


--HLK4XKn2pm9LO02N
Content-Type: text/plain; charset=utf-8; protected-headers=v1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 May 2022 13:07:42 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] Preserve the EFI System Resource Table for dom0

The EFI System Resource Table (ESRT) is necessary for fwupd to identify
firmware updates to install.  According to the UEFI specification =C2=A723.=
4,
the ESRT shall be stored in memory of type EfiBootServicesData.  However,
memory of type EfiBootServicesData is considered general-purpose memory
by Xen, so the ESRT needs to be moved somewhere where Xen will not
overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
in memory of type EfiRuntimeServicesData.

Earlier versions of this patch reserved the memory in which the ESRT was
located.  This created awkward alignment problems, and required either
splitting the E820 table or wasting memory.  It also would have required
a new platform op for dom0 to use to indicate if the ESRT is reserved.
By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
does not need to be modified, and dom0 can just check the type of the
memory region containing the ESRT.  The copy is only done if the ESRT is
not already in EfiRuntimeServicesData memory, avoiding memory leaks on
repeated kexec.

See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
for details.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/common/efi/boot.c | 106 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 2 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a25e1d29f1..3d56422dfa 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -39,6 +39,25 @@
   { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b,=
 0x23} }
 #define APPLE_PROPERTIES_PROTOCOL_GUID \
   { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a=
, 0xe0} }
+#define ESRT_GUID    \
+  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21,=
 0x80} }
+
+typedef struct _ESRT_ENTRY {
+    EFI_GUID FwClass;
+    UINT32 FwType;
+    UINT32 FwVersion;
+    UINT32 FwLowestSupportedVersion;
+    UINT32 FwCapsuleFlags;
+    UINT32 FwLastAttemptVersion;
+    UINT32 FwLastAttemptStatus;
+} ESRT_ENTRY;
+
+typedef struct _ESRT {
+    UINT32 Count;
+    UINT32 Max;
+    UINT64 Version;
+    ESRT_ENTRY Entries[];
+} ESRT;
=20
 typedef EFI_STATUS
 (/* _not_ EFIAPI */ *EFI_SHIM_LOCK_VERIFY) (
@@ -567,6 +586,38 @@ static int __init efi_check_dt_boot(const EFI_LOADED_I=
MAGE *loaded_image)
 }
 #endif
=20
+static UINTN __initdata esrt =3D EFI_INVALID_TABLE_ADDR;
+
+static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
+{
+    size_t available_len, len;
+    const UINTN physical_start =3D desc->PhysicalStart;
+    const ESRT *esrt_ptr;
+
+    len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
+    if ( esrt =3D=3D EFI_INVALID_TABLE_ADDR )
+        return 0;
+    if ( physical_start > esrt || esrt - physical_start >=3D len )
+        return 0;
+    /*
+     * The specification requires EfiBootServicesData, but accept
+     * EfiRuntimeServicesData, which is a more logical choice.
+     */
+    if ( (desc->Type !=3D EfiRuntimeServicesData) &&
+         (desc->Type !=3D EfiBootServicesData) )
+        return 0;
+    available_len =3D len - (esrt - physical_start);
+    if ( available_len <=3D offsetof(ESRT, Entries) )
+        return 0;
+    available_len -=3D offsetof(ESRT, Entries);
+    esrt_ptr =3D (const ESRT *)esrt;
+    if ( esrt_ptr->Version !=3D 1 || !esrt_ptr->Count )
+        return 0;
+    if ( esrt_ptr->Count > available_len / sizeof(esrt_ptr->Entries[0]) )
+        return 0;
+    return esrt_ptr->Count * sizeof(esrt_ptr->Entries[0]);
+}
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -845,6 +896,8 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTP=
UT_PROTOCOL *gop,
     return gop_mode;
 }
=20
+static EFI_GUID __initdata esrt_guid =3D ESRT_GUID;
+
 static void __init efi_tables(void)
 {
     unsigned int i;
@@ -868,6 +921,8 @@ static void __init efi_tables(void)
             efi.smbios =3D (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
             efi.smbios3 =3D (unsigned long)efi_ct[i].VendorTable;
+        if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
+            esrt =3D (UINTN)efi_ct[i].VendorTable;
     }
=20
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
@@ -1056,9 +1111,7 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHand=
le, EFI_SYSTEM_TABLE *Syste
     EFI_STATUS status;
     UINTN info_size =3D 0, map_key;
     bool retry;
-#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
     unsigned int i;
-#endif
=20
     efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
                          &efi_mdesc_size, &mdesc_ver);
@@ -1067,6 +1120,46 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHan=
dle, EFI_SYSTEM_TABLE *Syste
     if ( !efi_memmap )
         blexit(L"Unable to allocate memory for EFI memory map");
=20
+    efi_memmap_size =3D info_size;
+    status =3D SystemTable->BootServices->GetMemoryMap(&efi_memmap_size,
+                                                     efi_memmap, &map_key,
+                                                     &efi_mdesc_size,
+                                                     &mdesc_ver);
+    if ( EFI_ERROR(status) )
+        PrintErrMesg(L"Cannot obtain memory map", status);
+
+    /* Try to obtain the ESRT.  Errors are not fatal. */
+    for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
+    {
+        /*
+         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
+         * so that the memory it is in will not be used for other purposes.
+         */
+        void *new_esrt =3D NULL;
+        size_t esrt_size =3D get_esrt_size(efi_memmap + i);
+
+        if ( !esrt_size )
+            continue;
+        if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type =3D=3D
+             EfiRuntimeServicesData )
+            break; /* ESRT already safe from reuse */
+        status =3D efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size,
+                                      &new_esrt);
+        if ( status =3D=3D EFI_SUCCESS && new_esrt )
+        {
+            memcpy(new_esrt, (void *)esrt, esrt_size);
+            status =3D efi_bs->InstallConfigurationTable(&esrt_guid, new_e=
srt);
+            if ( status !=3D EFI_SUCCESS )
+            {
+                PrintStr(L"Cannot install new ESRT\r\n");
+                efi_bs->FreePool(new_esrt);
+            }
+        }
+        else
+            PrintStr(L"Cannot allocate memory for ESRT\r\n");
+        break;
+    }
+
     for ( retry =3D false; ; retry =3D true )
     {
         efi_memmap_size =3D info_size;
@@ -1753,3 +1846,12 @@ void __init efi_init_memory(void)
     unmap_domain_page(efi_l4t);
 }
 #endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--HLK4XKn2pm9LO02N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKD1l8ACgkQsoi1X/+c
IsFMAg/+J4XX6XmX6cfctCFRxzcyXyncJv7yxiD+hqPL0R8JnfzEuHBWRPJmC5Vg
gGf+9GouSyYnFgo9y7TIZEYpXOq5XInflpxv8VHEEvYbJbOuvrirddl9tVRkaZsK
o79BvJj/rqM1ZwzAVhA6tcSF37jmhwYONcUsXFDcinudp1dM2pHuU0267ro9gtum
P6EEMyFdFmbgMwad05rgx7Tc8gerwyIf5kgipT4P4lrZXhV9gZ/D2SGwD3uSjhtC
tWFSrBIF3ayUWoXiRIx2M7JJRspcVDOfqykW2dZ4ngUapnKPyJNC9wVovWax9U/E
qFcAiz09Zt8HoJ5cP4qSfBoO7/OSUXdrz9PSCacnjd9kThX/d5lvBXKWMTBgQ4IP
/wkyK5CLLhgl3exfoBLiC1OCuK0PuHJwFxHNbb6gar2xslbe5S8tNKvzer1jEQiv
r37wpw79s7gDBSnI8k4vlPqDf8788WOH5X45xXOPQjs/D/FgcoLTstzpQwNBI8K+
9umbFY2myaLhNw0ZtUALnAmB+pNlExs894byv4JWe2mii7FPiXAZC/CDInnyH4pi
0jiL1LYUq/4Av39+D7w1h30kmULbybMUjP6D3lUdRJTpsYOxriry5agE7iSlgjLl
jGsiY0SqL7U6Fdn0y4WO3YXJXyiXkUMloLCtfDH9TE4e2KbV3d0=
=345A
-----END PGP SIGNATURE-----

--HLK4XKn2pm9LO02N--

