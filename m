Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E6A52C0FD
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 19:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332412.556107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrNXX-0004aw-89; Wed, 18 May 2022 17:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332412.556107; Wed, 18 May 2022 17:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrNXX-0004Yc-4b; Wed, 18 May 2022 17:32:51 +0000
Received: by outflank-mailman (input) for mailman id 332412;
 Wed, 18 May 2022 17:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Thik=V2=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nrNXV-0004YW-4c
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 17:32:49 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86dc5a81-d6d0-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 19:32:46 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2482A32008FD;
 Wed, 18 May 2022 13:32:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 18 May 2022 13:32:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 May 2022 13:32:42 -0400 (EDT)
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
X-Inumbo-ID: 86dc5a81-d6d0-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1652895162; x=1652981562; bh=l3nshceWNm
	Nh4sbzOcO5cSmfwPWblYE/KIfax+ALspQ=; b=QFMkLX1r/cgDfiTupBMI9D2l31
	PjmfEwzC9UAj9TQUVEOL+TOhfwN8ZhZ3/V285O7oAL1Ep2Gl1IMg5mNYugM5neqM
	g2JPcHp1ognEGx+sJvT7GXOx2hLycscrutbVX9P0wD+EXZ4owvuGzAmFFzLMzJbc
	B749DQMC0J+8hF8tmA4hf3yU0ioGTwcujI17Y8nP4Jtz+TjpAhL16fcyj2l90/5u
	tOfoefErVJVLKq5FPuboMhAUmosxWfHK5CPxMCttoW7HZIxOu5J2rBghI22H6+wU
	J9wsWUxfoWg0Q2+U+keIl+o/RjSHMBwaf9fJ4XTLsOixEnk16KI9Q8AV+Ixg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652895162; x=
	1652981562; bh=l3nshceWNmNh4sbzOcO5cSmfwPWblYE/KIfax+ALspQ=; b=w
	P6lquywixaX+sjALnu9g8Q++0Slfj8N2ePxrRJYitdMrxBfTgrLgbTtUal7mYtfz
	MHyjvCB73phWO5UZDJJujGCJL/+FOLtKlweM8LV6ekM/N/tr8mc+zG9LPnFqwLqq
	t6ms+4bX0OYL4RFScNSJRQElJNndpBm9WMO1AejHxszvAKQj0FFAHyHzUgdYj49w
	oVut+Sv3Dl9RtIzRjFRdmSHnqZSlYJeDzX2us9tkdqfrNkwfve7vEutSIS2dE/HA
	vZ2Tcw2Ha0EgDcNaolEuciyd7b3O2pVKSGUHjYa29sXJvQ+R2OdQxDGHWVe+Z81I
	YnXx/LbLXSEwpdS8mkFKw==
X-ME-Sender: <xms:ui2FYuYNUDKYn455b_Gi3Ck78gZM34Q4sfoJCh0PNdiro5wDfvgP_Q>
    <xme:ui2FYharkOQeYLb9SjQ9cNk2ZhtFs6n2KI59HMaRiy4hiREbbiq6CDm0rnzLEHdXQ
    tXcSsjT_YlUTA0>
X-ME-Received: <xmr:ui2FYo_09g7LJFXlt-E4BtFfairVRmMcUmbBCaaWAZZCePZ5ziAiB6DDK6iN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheelgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepudekteekkeekkedvteegtdektefftdfh
    tddtgfeifffhkeehhfejhfevgefgieehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
    ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ui2FYgoHlvnCjbYssm6E9MDHlD9uRCvCJa7i5yHZyDuCvOAY33lZgg>
    <xmx:ui2FYpq_r3QLqQC2yfdrBjOuTglD2Vq2N_aktN8_SNKOKsBuSpTG7g>
    <xmx:ui2FYuSM10NcqfQ6GyNzuwZvJbHIGPGHsAEwTImDYgDY3dk23BMWnQ>
    <xmx:ui2FYrHq2iQkc4S8QANWIjr1qESi3Ac4aQuHId1okHRaina9QRoIEQ>
Feedback-ID: iac594737:Fastmail
Date: Wed, 18 May 2022 13:32:33 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6] Preserve the EFI System Resource Table for dom0
Message-ID: <YoUtuDhVimlP7r8F@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H8okDFa7sllZcjg0"
Content-Disposition: inline


--H8okDFa7sllZcjg0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 May 2022 13:32:33 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6] Preserve the EFI System Resource Table for dom0

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
Changes since v5:

- Use type and field names from EFI specification.
- Remove tags from EFI types that do not have them.
- Use PrintErr() instead of PrintStr() for error conditions.

Changes since v4:

- Do not call blexit() (via PrintErrMsg()) if the new ESRT cannot be
  allocated or installed.
- Use the correct comment style.
- Remove leftover change from earlier version.
- Add a blank line between declarations and statements.
- Re-fetch the memory map after allocating the ESRT copy.

Changes since v3:

- Do not modify the memory map.
- Allocate a copy of the ESRT in EfiRuntimeServicesData() memory.

 xen/common/efi/boot.c | 108 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 106 insertions(+), 2 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a25e1d29f1..6a829b8278 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -39,6 +39,26 @@
   { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b,=
 0x23} }
 #define APPLE_PROPERTIES_PROTOCOL_GUID \
   { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a=
, 0xe0} }
+#define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
+  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21,=
 0x80} }
+#define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION 1
+
+typedef struct {
+    EFI_GUID FwClass;
+    UINT32 FwType;
+    UINT32 FwVersion;
+    UINT32 LowestSupportedFwVersion;
+    UINT32 CapsuleFlags;
+    UINT32 LastAttemptVersion;
+    UINT32 LastAttemptStatus;
+} EFI_SYSTEM_RESOURCE_ENTRY;
+
+typedef struct {
+    UINT32 FwResourceCount;
+    UINT32 FwResourceCountMax;
+    UINT64 FwResourceVersion;
+    EFI_SYSTEM_RESOURCE_ENTRY Entries[];
+} EFI_SYSTEM_RESOURCE_TABLE;
=20
 typedef EFI_STATUS
 (/* _not_ EFIAPI */ *EFI_SHIM_LOCK_VERIFY) (
@@ -567,6 +587,39 @@ static int __init efi_check_dt_boot(const EFI_LOADED_I=
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
+    const EFI_SYSTEM_RESOURCE_TABLE *esrt_ptr;
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
+    if ( available_len <=3D offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) )
+        return 0;
+    available_len -=3D offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries);
+    esrt_ptr =3D (const EFI_SYSTEM_RESOURCE_TABLE *)esrt;
+    if ( esrt_ptr->FwResourceVersion !=3D EFI_SYSTEM_RESOURCE_TABLE_FIRMWA=
RE_RESOURCE_VERSION ||
+         !esrt_ptr->FwResourceCount )
+        return 0;
+    if ( esrt_ptr->FwResourceCount > available_len / sizeof(esrt_ptr->Entr=
ies[0]) )
+        return 0;
+    return esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
+}
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -845,6 +898,8 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTP=
UT_PROTOCOL *gop,
     return gop_mode;
 }
=20
+static EFI_GUID __initdata esrt_guid =3D EFI_SYSTEM_RESOURCE_TABLE_GUID;
+
 static void __init efi_tables(void)
 {
     unsigned int i;
@@ -868,6 +923,8 @@ static void __init efi_tables(void)
             efi.smbios =3D (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
             efi.smbios3 =3D (unsigned long)efi_ct[i].VendorTable;
+        if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
+            esrt =3D (UINTN)efi_ct[i].VendorTable;
     }
=20
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
@@ -1056,9 +1113,7 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHand=
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
@@ -1067,6 +1122,46 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHan=
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
+                PrintErr(L"Cannot install new ESRT\r\n");
+                efi_bs->FreePool(new_esrt);
+            }
+        }
+        else
+            PrintErr(L"Cannot allocate memory for ESRT\r\n");
+        break;
+    }
+
     for ( retry =3D false; ; retry =3D true )
     {
         efi_memmap_size =3D info_size;
@@ -1753,3 +1848,12 @@ void __init efi_init_memory(void)
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

--H8okDFa7sllZcjg0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKFLbgACgkQsoi1X/+c
IsFciw/9FCy+ACtapGkS/J1+T5kTYfxNG1ivKYNboF2j0kU5mp5u3G0DA3D0H9eK
gHyl2o7vsWBLob6oebr3uAtL7aG7c/mFu7k79r7k+xVm5miWIVvF4e2FM+f5kKwJ
vQMKTylb2rY91g5M0+w6icCWWsmdh5bhCMRrWBoH2lfZuGL4Uu3DvdJ4uQotDPU/
rmE3noTLKhRS8ZtH81r3wQ87faQ6l/LknvMe6yMah4mwK/e+110L55cOuGdNOW6m
9Q9JuBKK3Fcl4ZNxBrMl6hn47ZgIuqN7h419I51wzjPRJYdNghvWGhKMe5MpvgMN
LmNafPRGsXdhqeLez/b57vAUDIbEmPJQOlwGXOjTcySDpyjHtpxvd1kYBjITPHsR
otjJcEmMYtYHmGvnImCv5dyil8gkf28bcrjH4rWVmpt4kYtHScAwUNi9tmXie8IA
a6qti3pZERFlb6FQ2cZTo8tOcuYfocNxCuvnwGBY+vOsUSMVF01j02tzVCTyx7sQ
J4XDlXT9hCa1EQST9iOPFKoDTfkB7nm7wADHl4+n+0wXK/j0mfWN/zYiz2QznkiK
eALBjytD5itGPz5qZvZctGEa4BzgX9T9tUScPg5zefiYd0IXtgCOUYd7NF0HBqxv
pydE1TBsx5I/fy8mZEdyXrs04ZggJoMvXFlHbdfOUShP4h3htMY=
=qWNX
-----END PGP SIGNATURE-----

--H8okDFa7sllZcjg0--

