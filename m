Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9D01299C4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 19:12:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijS7u-000526-F5; Mon, 23 Dec 2019 18:08:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q5yK=2N=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ijS7s-000521-Sv
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 18:08:16 +0000
X-Inumbo-ID: 305a4a7e-25af-11ea-9712-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 305a4a7e-25af-11ea-9712-12813bfff9fa;
 Mon, 23 Dec 2019 18:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577124496;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=rdEdMOBXRqS0ErRjI8J2YqKFqLCiBFTuFYauTWZip/Y=;
 b=S9POs3R+rG4eMsb3+u3UhATpcXWt8dt5ffkbVRgYlnFOFHlSHMoRTdMs
 p8num1LJby5DFLNl9BNTxt1TsokC5nMLk0wJXDkbjojBWGCajJ6ubPp0W
 ghaK3L3Ync3MKee916qYupPiPxbRVXtJpVnKsiz7z1B2r5mL07NjB06+W M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6ANHnntbF9M7QbY+6LasVrXFhfAbxasodEpjNMR+qz4x30KXfVGnwSOsw6c2K7IWX5c8HudHQc
 JI/SzVFh0sCAPGo+Tzq5fcqXQpkWkmNM3/irMJ+RKlbPOuZr0FSwsx+NzULLkE0sS80gjBcJWP
 QMpmgKxRWnO/dLZOrRHtXngcAAUxATq/eGrU7iHGGSxzNly7Y1HMnRyQ2d4LY5smvQlYqfNbbU
 PmaBPMHm4Arbq/NbN94HdoT2ABJZAyBiEmRKUUp2iTUHkoWzeTIHXWDI3MQNBfOzKmtIRp9a1c
 edo=
X-SBRS: 2.7
X-MesageID: 10233994
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,348,1571716800"; d="scan'208,223";a="10233994"
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <1e097c0e-1a99-2251-68f7-72f99f64c3bd@citrix.com>
Date: Mon, 23 Dec 2019 18:08:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191223140409.32449-1-aisaila@bitdefender.com>
Content-Type: multipart/mixed; boundary="------------B90D333A283D48A3E14E6490"
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--------------B90D333A283D48A3E14E6490
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 12/23/19 2:04 PM, Alexandru Stefan ISAILA wrote:
> This patch aims to sanitize indexes, potentially guest provided
> values, for altp2m_eptp[] and altp2m_p2m[] arrays.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Alexandru Isaila <aisaila@bitdefender.com>
> ---
> CC: Razvan Cojocaru <rcojocaru@bitdefender.com>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> CC: Petre Pircalabu <ppircalabu@bitdefender.com>
> CC: George Dunlap <george.dunlap@eu.citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> CC: Jun Nakajima <jun.nakajima@intel.com>
> CC: Kevin Tian <kevin.tian@intel.com>
> ---
> Changes since V5:
> 	- Add black lines
> 	- Check altp2m_idx against min(ARRAY_SIZE(d->arch.altp2m_p2m),
> MAX_EPTP).
> ---
>  xen/arch/x86/mm/mem_access.c | 21 ++++++++++++---------
>  xen/arch/x86/mm/p2m.c        | 26 ++++++++++++++++++--------
>  2 files changed, 30 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
> index 320b9fe621..a95a50bcae 100644
> --- a/xen/arch/x86/mm/mem_access.c
> +++ b/xen/arch/x86/mm/mem_access.c
> @@ -366,11 +366,12 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
>  #ifdef CONFIG_HVM
>      if ( altp2m_idx )
>      {
> -        if ( altp2m_idx >= MAX_ALTP2M ||
> -             d->arch.altp2m_eptp[altp2m_idx] == mfn_x(INVALID_MFN) )
> +        if ( altp2m_idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> +             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
> +             mfn_x(INVALID_MFN) )
>              return -EINVAL;

I realize Jan asked for something like this, and I'm sorry I didn't have
time to bring it up then, but this seems really silly.  If we're worried
about this, wouldn't it be better to have a BUILD_BUG_ON(MAX_ALTP2M >
MAX_EPTP)?

Also, this bit where we check the array value and then re-mask the index
later seems really redundant; both here, but especially...


> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index 3119269073..4fc919a9c5 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2577,6 +2577,8 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
>      if ( idx >= MAX_ALTP2M )
>          return rc;
>  
> +    idx = array_index_nospec(idx, MAX_ALTP2M);
> +

...here.  What about the attached series of patches (compile-tested only)?

 -George

--------------B90D333A283D48A3E14E6490
Content-Type: text/x-patch;
	name="0001-x86-p2m-Remove-some-trailing-whitespace.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-x86-p2m-Remove-some-trailing-whitespace.patch"

=46rom 1de1bae235186c5878b35a27eaaba7abb97f4739 Mon Sep 17 00:00:00 2001
From: George Dunlap <george.dunlap@citrix.com>
Date: Mon, 23 Dec 2019 17:54:53 +0000
Subject: [PATCH 1/4] x86/p2m: Remove some trailing whitespace

No functional changes.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 xen/arch/x86/mm/p2m.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index ba126f790a..b9f8948130 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -892,7 +892,7 @@ guest_physmap_add_entry(struct domain *d, gfn_t gfn, =
mfn_t mfn,
                               &a, 0, NULL, NULL);
         if ( p2m_is_shared(ot) )
         {
-            /* Do an unshare to cleanly take care of all corner=20
+            /* Do an unshare to cleanly take care of all corner
              * cases. */
             int rc;
             rc =3D mem_sharing_unshare_page(p2m->domain,
@@ -909,7 +909,7 @@ guest_physmap_add_entry(struct domain *d, gfn_t gfn, =
mfn_t mfn,
                  * However, all current (changeset 3432abcf9380) code
                  * paths avoid this unsavoury situation. For now.
                  *
-                 * Foreign domains are okay to place an event as they=20
+                 * Foreign domains are okay to place an event as they
                  * won't go to sleep. */
                 (void)mem_sharing_notify_enomem(p2m->domain,
                                                 gfn_x(gfn_add(gfn, i)), =
false);
@@ -924,7 +924,7 @@ guest_physmap_add_entry(struct domain *d, gfn_t gfn, =
mfn_t mfn,
             /* Really shouldn't be unmapping grant/foreign maps this way=
 */
             domain_crash(d);
             p2m_unlock(p2m);
-           =20
+
             return -EINVAL;
         }
         else if ( p2m_is_ram(ot) && !p2m_is_paged(ot) )
@@ -1787,7 +1787,7 @@ int p2m_mem_paging_prep(struct domain *d, unsigned =
long gfn_l, uint64_t buffer)
=20
     if ( user_ptr )
         /* Sanity check the buffer and bail out early if trouble */
-        if ( (buffer & (PAGE_SIZE - 1)) ||=20
+        if ( (buffer & (PAGE_SIZE - 1)) ||
              (!access_ok(user_ptr, PAGE_SIZE)) )
             return -EINVAL;
=20
@@ -1832,7 +1832,7 @@ int p2m_mem_paging_prep(struct domain *d, unsigned =
long gfn_l, uint64_t buffer)
                                  "bytes left %d\n", gfn_l, d->domain_id,=
 rc);
             ret =3D -EFAULT;
             put_page(page); /* Don't leak pages */
-            goto out;           =20
+            goto out;
         }
     }
=20
@@ -1904,7 +1904,7 @@ static struct p2m_domain *
 p2m_getlru_nestedp2m(struct domain *d, struct p2m_domain *p2m)
 {
     struct list_head *lru_list =3D &p2m_get_hostp2m(d)->np2m_list;
-   =20
+
     ASSERT(!list_empty(lru_list));
=20
     if ( p2m =3D=3D NULL )
@@ -2050,7 +2050,7 @@ p2m_get_nestedp2m_locked(struct vcpu *v)
=20
     nestedp2m_lock(d);
     p2m =3D nv->nv_p2m;
-    if ( p2m )=20
+    if ( p2m )
     {
         p2m_lock(p2m);
         if ( p2m->np2m_base =3D=3D np2m_base )
@@ -2889,7 +2889,7 @@ void audit_p2m(struct domain *d,
=20
     pod_unlock(p2m);
     p2m_unlock(p2m);
-=20
+
     P2M_PRINTK("p2m audit complete\n");
     if ( orphans_count | mpbad | pmbad )
         P2M_PRINTK("p2m audit found %lu orphans\n", orphans_count);
--=20
2.24.0


--------------B90D333A283D48A3E14E6490
Content-Type: text/x-patch;
	name="0002-x86-altp2m-Restrict-MAX_EPTP-to-hap.c.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0002-x86-altp2m-Restrict-MAX_EPTP-to-hap.c.patch"

=46rom 028ae70bb69992617582dcafbe06da0e176c92cd Mon Sep 17 00:00:00 2001
From: George Dunlap <george.dunlap@citrix.com>
Date: Mon, 23 Dec 2019 17:21:33 +0000
Subject: [PATCH 2/4] x86/altp2m: Restrict MAX_EPTP to hap.c

Right now we have two altp2m structures hanging off arch_domain:
altp2m_eptp, which is hardware-based and points to a page with 512 ept
pointers, and altp2m_p2m, which is currently limited to 10 as a fairly
arbitary way of balancing performance, space, and usability.  altp2m
indexes are used as index values to both, meaning the only safe option
is to check guest-supplied indexes against both.  This is a bit
redundant, however, as MAX_ALTP2M must always be <=3D MAX_EPTP.

Move MAX_EPTP to hap.c, where the array is initialized; and add
BUILD_BUG_ON() asserting that MAX_ALTP2M < MAX_EPTP.  Then, elsewhere,
it will always be safe to check guest-supplied indexes against
MAX_ALTP2M.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 xen/arch/x86/mm/hap/hap.c    | 3 +++
 xen/include/asm-x86/domain.h | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 3d93f3451c..69159c689e 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -488,6 +488,9 @@ int hap_enable(struct domain *d, u32 mode)
             goto out;
         }
=20
+#define MAX_EPTP        (PAGE_SIZE / sizeof(uint64_t))
+        BUILD_BUG_ON(MAX_ALTP2M > MAX_EPTP);
+
         for ( i =3D 0; i < MAX_EPTP; i++ )
             d->arch.altp2m_eptp[i] =3D mfn_x(INVALID_MFN);
=20
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 3780287e7e..c46fb54d7e 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -240,7 +240,6 @@ struct paging_vcpu {
=20
 #define MAX_ALTP2M      10 /* arbitrary */
 #define INVALID_ALTP2M  0xffff
-#define MAX_EPTP        (PAGE_SIZE / sizeof(uint64_t))
 struct p2m_domain;
 struct time_scale {
     int shift;
--=20
2.24.0


--------------B90D333A283D48A3E14E6490
Content-Type: text/x-patch;
	name="0003-nospec-Introduce-nospec_clip-macro.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0003-nospec-Introduce-nospec_clip-macro.patch"

=46rom 22b8e64b951234f9e5a6250e2389564bd4101915 Mon Sep 17 00:00:00 2001
From: George Dunlap <george.dunlap@citrix.com>
Date: Mon, 23 Dec 2019 18:00:55 +0000
Subject: [PATCH 3/4] nospec: Introduce nospec_clip macro

There are lots of places in the code where we might want to:

1. Do a bounds check and return an error

2. Use the array_index_nospec() macro to prevent Spectre-style attacks
during speculation.

Create a simple macro to clip an index and return true if it was
clipped.  This allows us to "fully" sanitize an index passed from
userspace in a single check, thus:

    if ( nospec_clip(index, INDEX_MAX) )
        return -EINVAL;

Afterwards, `index` wil be safe against speculation, having been
clipped via array_index_nospec().

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 xen/include/xen/nospec.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/include/xen/nospec.h b/xen/include/xen/nospec.h
index 76255bc46e..1cc0301848 100644
--- a/xen/include/xen/nospec.h
+++ b/xen/include/xen/nospec.h
@@ -64,6 +64,21 @@ static inline unsigned long array_index_mask_nospec(un=
signed long index,
 #define array_index_nospec(index, size) ((void)(size), (index))
 #endif /* CONFIG_SPECULATIVE_HARDEN_ARRAY */
=20
+/*
+ * nospec_clip - Do a bounds check and make an index speculation safe
+ *
+ * Use to simultaneously check the size and clip it appropriately, thus:=

+ *
+ *     if ( nospec_clip(index, size) )
+ *         return -EINVAL;
+ */
+#define nospec_clip(index, size)                 \
+    ({                                           \
+        bool clipped =3D (index >=3D size);          \
+        index =3D array_index_nospec(index, size); \
+        clipped;                                 \
+    })
+
 /*
  * array_access_nospec - allow nospec access for static size arrays
  */
--=20
2.24.0


--------------B90D333A283D48A3E14E6490
Content-Type: text/x-patch;
	name="0004-x86-mm-Use-nospec_clip-to-check-guest-supplied-value.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename*0="0004-x86-mm-Use-nospec_clip-to-check-guest-supplied-value.pa";
	filename*1="tch"

=46rom 1ee8a8048fe8ea7ba5b3240f12f11986af26f452 Mon Sep 17 00:00:00 2001
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Date: Mon, 23 Dec 2019 14:04:31 +0000
Subject: [PATCH 4/4] x86/mm: Use nospec_clip() to check guest-supplied va=
lues.

This patch aims to sanitize indexes, potentially guest provided
values, for altp2m_eptp[] and altp2m_p2m[] arrays.

Based on a patch by Alexandru Isaila <aisaila@bitdefender.com>.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 xen/arch/x86/mm/mem_access.c |  6 +++---
 xen/arch/x86/mm/p2m.c        | 11 ++++++-----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index 320b9fe621..5b4a4f43ef 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -366,7 +366,7 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, =
uint32_t nr,
 #ifdef CONFIG_HVM
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >=3D MAX_ALTP2M ||
+        if ( nospec_clip(altp2m_idx, MAX_ALTP2M) ||
              d->arch.altp2m_eptp[altp2m_idx] =3D=3D mfn_x(INVALID_MFN) )=

             return -EINVAL;
=20
@@ -425,7 +425,7 @@ long p2m_set_mem_access_multi(struct domain *d,
 #ifdef CONFIG_HVM
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >=3D MAX_ALTP2M ||
+        if ( nospec_clip(altp2m_idx, MAX_ALTP2M) ||
              d->arch.altp2m_eptp[altp2m_idx] =3D=3D mfn_x(INVALID_MFN) )=

             return -EINVAL;
=20
@@ -491,7 +491,7 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, x=
enmem_access_t *access,
     }
     else if ( altp2m_idx ) /* altp2m view 0 is treated as the hostp2m */=

     {
-        if ( altp2m_idx >=3D MAX_ALTP2M ||
+        if ( nospec_clip(altp2m_idx, MAX_ALTP2M) ||
              d->arch.altp2m_eptp[altp2m_idx] =3D=3D mfn_x(INVALID_MFN) )=

             return -EINVAL;
=20
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index b9f8948130..4f93f410c8 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2571,7 +2571,7 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigne=
d int idx)
 {
     int rc =3D -EINVAL;
=20
-    if ( idx >=3D MAX_ALTP2M )
+    if ( nospec_clip(idx, MAX_ALTP2M) )
         return rc;
=20
     altp2m_list_lock(d);
@@ -2612,7 +2612,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsi=
gned int idx)
     struct p2m_domain *p2m;
     int rc =3D -EBUSY;
=20
-    if ( !idx || idx >=3D MAX_ALTP2M )
+    if ( !idx || nospec_clip(idx, MAX_ALTP2M) )
         return rc;
=20
     rc =3D domain_pause_except_self(d);
@@ -2686,7 +2686,8 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigne=
d int idx,
     mfn_t mfn;
     int rc =3D -EINVAL;
=20
-    if ( idx >=3D MAX_ALTP2M || d->arch.altp2m_eptp[idx] =3D=3D mfn_x(IN=
VALID_MFN) )
+    if ( nospec_clip(idx, MAX_ALTP2M) ||
+         d->arch.altp2m_eptp[idx] =3D=3D mfn_x(INVALID_MFN) )
         return rc;
=20
     hp2m =3D p2m_get_hostp2m(d);
@@ -3029,7 +3030,7 @@ int p2m_set_suppress_ve(struct domain *d, gfn_t gfn=
, bool suppress_ve,
=20
     if ( altp2m_idx > 0 )
     {
-        if ( altp2m_idx >=3D MAX_ALTP2M ||
+        if ( nospec_clip(altp2m_idx, MAX_ALTP2M) ||
              d->arch.altp2m_eptp[altp2m_idx] =3D=3D mfn_x(INVALID_MFN) )=

             return -EINVAL;
=20
@@ -3072,7 +3073,7 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn=
, bool *suppress_ve,
=20
     if ( altp2m_idx > 0 )
     {
-        if ( altp2m_idx >=3D MAX_ALTP2M ||
+        if ( nospec_clip(altp2m_idx, MAX_ALTP2M) ||
              d->arch.altp2m_eptp[altp2m_idx] =3D=3D mfn_x(INVALID_MFN) )=

             return -EINVAL;
=20
--=20
2.24.0


--------------B90D333A283D48A3E14E6490
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------B90D333A283D48A3E14E6490--

