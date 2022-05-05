Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A781F51B784
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 07:39:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321424.542422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmUCd-0005rm-JR; Thu, 05 May 2022 05:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321424.542422; Thu, 05 May 2022 05:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmUCd-0005od-Fj; Thu, 05 May 2022 05:39:03 +0000
Received: by outflank-mailman (input) for mailman id 321424;
 Thu, 05 May 2022 05:39:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sy7t=VN=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nmUCc-0005oX-9f
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 05:39:02 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8c61143-cc35-11ec-a406-831a346695d4;
 Thu, 05 May 2022 07:38:59 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D3F75C0086;
 Thu,  5 May 2022 01:38:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 05 May 2022 01:38:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 May 2022 01:38:56 -0400 (EDT)
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
X-Inumbo-ID: a8c61143-cc35-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1651729137; x=1651815537; bh=9ykJBArLSi+XT
	l0RENKtkpARnv7uv852R79wjUcrN+k=; b=E8Wfv1tvn1otQ4SEXe+8rILStEskT
	wXuM7un7WIIUD1LAoTK48c1FuQk6fNTL5WNw5t3gj+SBHSCdg+NsUffeQAkemd2m
	jr9YTjq3XyzgCcFtfwoKQmfKJRiAj8i6sBT0Q4Cqh3Tf8g7shFo/9fq5fymRdtPX
	QdAaXEqCldtfjmo8DiOWlld4EAT0SdWlwrSOE/tbiBqOcXXbOh92NxJ6cHP0Rt8s
	3iHjsN0YcTF/j1AdoLTe+a6BUJntGC4OUutBzmAkI6R6auI8ZoyyC+PKyWvA2oea
	ydIE8X+M2XCOrlfCI8fe5ZeLd0JrfjWfza4SNh4vYofQNkvy6PtKN6/iQ==
X-ME-Sender: <xms:8WJzYqBvGZ05DV0Pgvj4euNSdnrGP8nQzY-Kst1B2THXPHVv3h706w>
    <xme:8WJzYkhjlK3e03KyK_BdtdXTCEWQPi-JtIn_PPVQfnKOrSnWr4pbPeehMTlRT6pTx
    5uZpsMMxHgXlhw>
X-ME-Received: <xmr:8WJzYtlNIScb4xamj7R4uNIB7v_ytotO8ZdWkmQ8Ym3TYo65OKebx_eI1N4X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpedukeetkeekkeekvdetgedtkeetffdthfdt
    tdfgieffhfekhefhjefhveeggfeiheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhi
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:8WJzYoyHDsxF1Ot48leXVrICQsyyPwMxFKobfKakTdzc4-uV6s8CKg>
    <xmx:8WJzYvRCS4liWdSQN5VUc_gWf5kCvFwFzat_GyIIOvW4yCzHnt2h_g>
    <xmx:8WJzYjZWCeXaHp_FOp9b-6E3K15iYFhpuHTFjFAxcVZ6Q0zfXhPu6A>
    <xmx:8WJzYiO39golvQKzk-52OZ8bJXmLcb5OlT6ykvdnQ9I-9tN9Ohfw_Q>
Date: Thu, 5 May 2022 01:38:52 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] Preserve the EFI System Resource Table for dom0
Message-ID: <YnNi7iW2s5jsJIiA@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7tuAjtNtlO9wuDyC"
Content-Disposition: inline


--7tuAjtNtlO9wuDyC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 May 2022 01:38:52 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] Preserve the EFI System Resource Table for dom0

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
 xen/common/efi/boot.c    | 68 ++++++++++++++++++++++++++++++++++++++--
 xen/common/efi/efi.h     | 17 ++++++++++
 xen/common/efi/runtime.c |  2 +-
 xen/include/efi/efiapi.h |  3 ++
 4 files changed, 86 insertions(+), 4 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a25e1d29f1..4b22dc1bb7 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -567,6 +567,37 @@ static int __init efi_check_dt_boot(const EFI_LOADED_I=
MAGE *loaded_image)
 }
 #endif
=20
+static UINTN __initdata esrt =3D EFI_INVALID_TABLE_ADDR;
+
+static bool __init is_esrt_valid(const EFI_MEMORY_DESCRIPTOR *desc)
+{
+    size_t available_len, len;
+    const UINTN physical_start =3D desc->PhysicalStart;
+    const ESRT *esrt_ptr;
+
+    len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
+    if ( esrt =3D=3D EFI_INVALID_TABLE_ADDR )
+        return false;
+    if ( physical_start > esrt || esrt - physical_start >=3D len )
+        return false;
+    /*
+     * The specification requires EfiBootServicesData, but accept
+     * EfiRuntimeServicesData, which is a more logical choice.
+     */
+    if ( (desc->Type !=3D EfiRuntimeServicesData) &&
+         (desc->Type !=3D EfiBootServicesData) )
+        return false;
+    available_len =3D len - (esrt - physical_start);
+    if ( available_len < sizeof(*esrt_ptr) )
+        return false;
+    esrt_ptr =3D (const ESRT *)esrt;
+    if ( esrt_ptr->Version !=3D 1 || !esrt_ptr->Count )
+        return false;
+    return esrt_ptr->Count <=3D
+           (available_len - sizeof(*esrt_ptr)) /
+           sizeof(esrt_ptr->Entries[0]);
+}
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -845,6 +876,8 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTP=
UT_PROTOCOL *gop,
     return gop_mode;
 }
=20
+static EFI_GUID __initdata esrt_guid =3D ESRT_GUID;
+
 static void __init efi_tables(void)
 {
     unsigned int i;
@@ -868,6 +901,8 @@ static void __init efi_tables(void)
             efi.smbios =3D (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
             efi.smbios3 =3D (unsigned long)efi_ct[i].VendorTable;
+        if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
+            esrt =3D (UINTN)efi_ct[i].VendorTable;
     }
=20
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
@@ -1056,13 +1091,11 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHa=
ndle, EFI_SYSTEM_TABLE *Syste
     EFI_STATUS status;
     UINTN info_size =3D 0, map_key;
     bool retry;
-#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
     unsigned int i;
-#endif
=20
     efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
                          &efi_mdesc_size, &mdesc_ver);
-    info_size +=3D 8 * efi_mdesc_size;
+    info_size +=3D 8 * (efi_mdesc_size + 1);
     efi_memmap =3D efi_arch_allocate_mmap_buffer(info_size);
     if ( !efi_memmap )
         blexit(L"Unable to allocate memory for EFI memory map");
@@ -1077,6 +1110,35 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHan=
dle, EFI_SYSTEM_TABLE *Syste
         if ( EFI_ERROR(status) )
             PrintErrMesg(L"Cannot obtain memory map", status);
=20
+        for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
+        {
+            if ( !is_esrt_valid(efi_memmap + i) )
+                continue;
+            if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type !=3D
+                 EfiRuntimeServicesData )
+            {
+                /* ESRT needs to be moved to memory of type EfiRuntimeServ=
icesData
+                 * so that the memory it is in will not be used for other =
purposes */
+                size_t esrt_size =3D offsetof(ESRT, Entries) +
+                    ((ESRT *)esrt)->Count * sizeof(ESRT_ENTRY);
+                void *new_esrt =3D NULL;
+                status =3D efi_bs->AllocatePool(EfiRuntimeServicesData, es=
rt_size, &new_esrt);
+                if ( status !=3D EFI_SUCCESS )
+                {
+                    PrintErrMesg(L"Cannot allocate memory for ESRT", statu=
s);
+                    break;
+                }
+                memcpy(new_esrt, (void *)esrt, esrt_size);
+                status =3D efi_bs->InstallConfigurationTable(&esrt_guid, n=
ew_esrt);
+                if ( status !=3D EFI_SUCCESS )
+                {
+                    PrintErrMesg(L"Cannot install new ESRT", status);
+                    efi_bs->FreePool(new_esrt);
+                }
+            }
+            break;
+        }
+
         efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memmap_si=
ze,
                                     efi_mdesc_size, mdesc_ver);
=20
diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index c9aa65d506..bf94dfcdf6 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -10,6 +10,23 @@
 #include <xen/spinlock.h>
 #include <asm/page.h>
=20
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
+
 struct efi_pci_rom {
     const struct efi_pci_rom *next;
     u16 vendor, devid, segment;
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 13b0975866..64e9f04671 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -269,7 +269,7 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *in=
fo)
     case XEN_FW_EFI_MEM_INFO:
         for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
         {
-            EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
+            const EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
             u64 len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
=20
             if ( info->mem.addr >=3D desc->PhysicalStart &&
diff --git a/xen/include/efi/efiapi.h b/xen/include/efi/efiapi.h
index a616d1238a..42ef3e1c8c 100644
--- a/xen/include/efi/efiapi.h
+++ b/xen/include/efi/efiapi.h
@@ -882,6 +882,9 @@ typedef struct _EFI_BOOT_SERVICES {
 #define SAL_SYSTEM_TABLE_GUID    \
     { 0xeb9d2d32, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1=
, 0x4d} }
=20
+#define ESRT_GUID    \
+    { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x2=
1, 0x80} }
+
=20
 typedef struct _EFI_CONFIGURATION_TABLE {
     EFI_GUID                VendorGuid;
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--7tuAjtNtlO9wuDyC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJzYu4ACgkQsoi1X/+c
IsGJ/w//bZq+40cFGG8L25uhNhJtVjUx0nryhGQF9TlV59w73UrTaZN7zNIhn6gi
dkXz7hV52zeM2zS4by6dwto6H+8R8jte67tC2kejMUsd1vLwrumPh/ovTBxkgc9E
FjnAktl+oy6J8D1A5Lwm+HpVeWnxvKbba5LT3w3zT/p/OTshe/vvI7fuRwbmco/R
n++K5Mfz5XPO3lX0DhnhGuC63S0rdzEjTYhkvZE+kOOfLI48hSaZ9dhgfNEoJXWy
WMIN4J4Y+TMAOZS2HHWeHFsPDyK8gxyEUJQ8/3peO4rPbf/ju2cFQm2yLXXk01/D
DWBIx1d3/yRZllFqeDrcau05pA1Jumv/lbllgikfj97lTCQRuE9uXJ7K29OZMv+C
TM07aiR+lD4f6r9De0OPFq+O0X9B1lpTUO5sr44Yedmk/Ve9IPpUMWpPk1aWFFsH
Hsbt9Pdl7/8nRolisxLKjvRs1mkXQPY5KwvvMuMY8olXKc8lKcliFGVSiwBjlyb2
MPsJoQ57Y5kodqNfyV8lSytF8AhNzfQ1oJt90mXq/Si8UpD+W9SqQ8FDvP6HcnmI
rr7fDlU4RqG3R3PMsGSu/5DAtM6+kE2xVknBIyXhLQdU/PJ2A0A1Myt2jDybGoFm
VG7AdbGKL0hjji6mDhz3os5NPOWFUN7DvJ1JuRzX5mv6pHFMLuU=
=9i6E
-----END PGP SIGNATURE-----

--7tuAjtNtlO9wuDyC--

