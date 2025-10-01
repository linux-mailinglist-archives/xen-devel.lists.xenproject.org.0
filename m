Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46721BB1F68
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 00:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135141.1472480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v45De-0003vW-Fz; Wed, 01 Oct 2025 22:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135141.1472480; Wed, 01 Oct 2025 22:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v45De-0003tH-D7; Wed, 01 Oct 2025 22:22:42 +0000
Received: by outflank-mailman (input) for mailman id 1135141;
 Wed, 01 Oct 2025 22:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rba4=4K=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1v45Dc-0003tB-Ht
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 22:22:40 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224b0d6d-9f15-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 00:22:37 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-33292adb180so465829a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Oct 2025 15:22:37 -0700 (PDT)
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
X-Inumbo-ID: 224b0d6d-9f15-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759357356; x=1759962156; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8GVWMIPd8NLRnK9xwXf90VQaVwaPrNEsbeLW86sPI7A=;
        b=cch1R7b85MHE8TBNVdlQMnKAorfHosk3xrtXO+81pe8vUhgLp3uR1tURNt0gKQx/hd
         yXWz3LimyvdMa9nBY6hOrxVn0ZtvMvQNNzaR/UO9+GpZlBEInfLkPI5vAJrPgGYUWKhJ
         tXKimo9JfGX4+dbMhAY412LGKVROb/1rmizw+YvPHWKTZ5FyAJ6j3Wf5D6fKJn6N0wAt
         nfFv7XZ+5lcOgAVlmfqhWzgXaGHeov5DeGYX8uUuKb7sIiEj0r9eXpcq5bh3b5vQvcA9
         e9C68C37KLpMtOVyV3dosuZpQ9R1KgTxTuKzvCM8rIOeHgWUmxs73ERBgQa/KxPJwV+U
         E9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759357356; x=1759962156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GVWMIPd8NLRnK9xwXf90VQaVwaPrNEsbeLW86sPI7A=;
        b=L7fmJ2Uub3fduKwxpEqF5PJwmx8AnY4b+GeNcfmeYmqDj3b85UIakSRLdyX3YgOXoL
         mf3kmBQmSY7UgJB3G2tAT/vIjw2alUzaarRDyWSQUTE0TxPnYCyrHIUbYGTMT02pVY0j
         4MtwWf9msNDjPEldlpbYslqBTnqvV3j2krLV/WUcXMSVVCym3mBGp7d+7/l8V1eTV9hw
         qp5oZhLzVtSFdpmqqYZJfox5fMXTsopLIuCPErnShNqqB39yAmWdos1tRcPNGui8aIJy
         pWd18pHjoMRAkFFWzVo+aQDHVCx5qQC+eibtO+7Q1UCtN8ogLzO2Q26kocowaL2HtX08
         nhWA==
X-Gm-Message-State: AOJu0YzsmF0VXISnRtbqYMIA11/wIY3O4lHRCKEbzlqFV70mxNb0VV4/
	h0goqh0DhV6pz13Hs5BoAatLvVAA49qVJEx2qCzEoN8RRQyCnAHykEUViMHGTNWgal59DLxEo3s
	S7ZX5eOa1mjrCnW/k1HYhBdbOQz/yxnVUhJU=
X-Gm-Gg: ASbGncv4A664Wfq8puLK4pqOmusku1YffrSj2UraJ5kWhLBeeHKnuA7fJJU2XwLv8lD
	DZu4byF+40Dk19CZoDfEviIsS8HNX7YH3XlN8mb0T23dHMEXQpJvXiLpf3KVkmzQFskCVl2MptP
	o+Qln9P05MLzljIpn8W84r+OqAY5jhgGi2Iyogchd0mdwx1MN8QlUrgU3ECIwjc/HFFEzhaK2P2
	mVUQlRwFYH0VVy2HNpBQzXS8Bpg
X-Google-Smtp-Source: AGHT+IHh5wF/Kt73G+EXoT7ZhRxhQbm6eMJI1XbYdB2Pc23TKgP2TUJxk7kf6kJ/pqPBcDZza13q/YEAaYZ67KcXuNc=
X-Received: by 2002:a17:90b:4d0d:b0:330:84c8:92d0 with SMTP id
 98e67ed59e1d1-339a6f3f682mr5945357a91.24.1759357355731; Wed, 01 Oct 2025
 15:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
In-Reply-To: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
From: saman dehghan <samaan.dehghan@gmail.com>
Date: Wed, 1 Oct 2025 17:22:24 -0500
X-Gm-Features: AS18NWA6yUh-Xw2KgRQwd7LZ7o3_mWYmJ1-asHIZa7mTR74tG_lCyGmgwowpkCI
Message-ID: <CAHFNDNhTEsuDJKU_NxpUEekS9T+Jt21keuiMxkMod8T=f7o_ag@mail.gmail.com>
Subject: Re: [llvm coverage] Update LLVM profile raw format from v4 to v10
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/alternative; boundary="00000000000038b1300640204e51"

--00000000000038b1300640204e51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This change enables compatibility for measuring code coverage
with Clang versions 14 through 20 by supporting their
respective raw profile formats.

1- Add support for LLVM raw profile versions 8, 9, and 10
2- Initialized llvm_profile_header for all versions based on llvm source
code in
   `compiler-rt/include/profile/InstrProfData.inc` for each version.
3- We tested this patch for all clang versions from 14 through 20 on both
ARM and X86 platform

Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
---
 xen/common/coverage/llvm.c | 78 +++++++++++++++++++++++++++-----------
 xen/include/xen/types.h    |  1 +
 2 files changed, 57 insertions(+), 22 deletions(-)

diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
index 517b2aa8c2..f92f10654c 100644
--- a/xen/common/coverage/llvm.c
+++ b/xen/common/coverage/llvm.c
@@ -44,27 +44,55 @@
     ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
 #endif

-#define LLVM_PROFILE_VERSION    4
+#if __clang_major__ >=3D 19
+#define LLVM_PROFILE_VERSION    10
+#define LLVM_PROFILE_NUM_KINDS  3
+#elif __clang_major__ =3D=3D 18
+#define LLVM_PROFILE_VERSION    9
 #define LLVM_PROFILE_NUM_KINDS  2
+#elif __clang_major__ >=3D 14
+#define LLVM_PROFILE_VERSION    8
+#define LLVM_PROFILE_NUM_KINDS  2
+#else
+#error "Unsupported Clang version"
+#endif

 struct llvm_profile_data {
     uint64_t name_ref;
     uint64_t function_hash;
-    void *counter;
-    void *function;
-    void *values;
+    intptr_t *relative_counter;
+#if __clang_major__ >=3D 18
+    intptr_t *relative_bitmap;
+#endif
+    intptr_t *function;
+    intptr_t *values;
     uint32_t nr_counters;
     uint16_t nr_value_sites[LLVM_PROFILE_NUM_KINDS];
+#if __clang_major__ >=3D 18
+    uint32_t numbitmap_bytes;
+#endif
 };

 struct llvm_profile_header {
     uint64_t magic;
     uint64_t version;
-    uint64_t data_size;
-    uint64_t counters_size;
+    uint64_t binary_ids_size;
+    uint64_t num_data;
+    uint64_t padding_bytes_before_counters;
+    uint64_t num_counters;
+    uint64_t padding_bytes_after_counters;
+    uint64_t num_bitmap_bytes;
+    uint64_t padding_bytes_after_bitmap_bytes;
     uint64_t names_size;
+#if __clang_major__ >=3D 18
     uint64_t counters_delta;
+    uint64_t bitmap_delta;
+#endif
     uint64_t names_delta;
+#if __clang_major__ >=3D 19
+    uint64_t num_vtables;
+    uint64_t vnames_size;
+#endif
     uint64_t value_kind_last;
 };

@@ -76,19 +104,20 @@ struct llvm_profile_header {
  */
 int __llvm_profile_runtime;

-extern const struct llvm_profile_data __start___llvm_prf_data[];
-extern const struct llvm_profile_data __stop___llvm_prf_data[];
-extern const char __start___llvm_prf_names[];
-extern const char __stop___llvm_prf_names[];
-extern uint64_t __start___llvm_prf_cnts[];
-extern uint64_t __stop___llvm_prf_cnts[];
+extern char __start___llvm_prf_data[];
+extern char __stop___llvm_prf_data[];
+extern char __start___llvm_prf_names[];
+extern char __stop___llvm_prf_names[];
+extern char __start___llvm_prf_cnts[];
+extern char __stop___llvm_prf_cnts[];
+
+#define START_DATA      ((const char *)__start___llvm_prf_data)
+#define END_DATA        ((const char *)__stop___llvm_prf_data)
+#define START_NAMES     ((const char *)__start___llvm_prf_names)
+#define END_NAMES       ((const char *)__stop___llvm_prf_names)
+#define START_COUNTERS  ((char *)__start___llvm_prf_cnts)
+#define END_COUNTERS    ((char *)__stop___llvm_prf_cnts)

-#define START_DATA      ((const void *)__start___llvm_prf_data)
-#define END_DATA        ((const void *)__stop___llvm_prf_data)
-#define START_NAMES     ((const void *)__start___llvm_prf_names)
-#define END_NAMES       ((const void *)__stop___llvm_prf_names)
-#define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
-#define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)

 static void cf_check reset_counters(void)
 {
@@ -107,10 +136,15 @@ static int cf_check dump(
     struct llvm_profile_header header =3D {
         .magic =3D LLVM_PROFILE_MAGIC,
         .version =3D LLVM_PROFILE_VERSION,
-        .data_size =3D (END_DATA - START_DATA) / sizeof(struct
llvm_profile_data),
-        .counters_size =3D (END_COUNTERS - START_COUNTERS) /
sizeof(uint64_t),
-        .names_size =3D END_NAMES - START_NAMES,
-        .counters_delta =3D (uintptr_t)START_COUNTERS,
+        .binary_ids_size =3D 0,
+        .num_data =3D (((intptr_t)END_DATA + sizeof(struct
llvm_profile_data) - 1)
+                - (intptr_t)START_DATA) / sizeof(struct llvm_profile_data)=
,
+        .padding_bytes_before_counters =3D 0,
+        .num_counters =3D (((intptr_t)END_COUNTERS + sizeof(uint64_t) - 1)
+                - (intptr_t)START_COUNTERS) / sizeof(uint64_t),
+        .padding_bytes_after_counters =3D 0,
+        .names_size =3D (END_NAMES - START_NAMES) * sizeof(char),
+        .counters_delta =3D (uintptr_t)START_COUNTERS -
(uintptr_t)START_DATA,
         .names_delta =3D (uintptr_t)START_NAMES,
         .value_kind_last =3D LLVM_PROFILE_NUM_KINDS - 1,
     };
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 73ddccbbd5..799bfe0b95 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -18,6 +18,7 @@ typedef signed long ssize_t;

 typedef __PTRDIFF_TYPE__ ptrdiff_t;
 typedef __UINTPTR_TYPE__ uintptr_t;
+typedef __INTPTR_TYPE__ intptr_t;

 /*
  * Users of this macro are expected to pass a positive value.
--=20
2.49.0

On Mon, Sep 15, 2025 at 11:56=E2=80=AFAM Saman Dehghan <samaan.dehghan@gmai=
l.com>
wrote:

> This patch updates the LLVM profile raw format in
> `xen/common/coverage/llvm.c` from version 4 to version 10,
> enabling compatibility with LLVM versions 19 and 20.
> While the patch supports only one version:
> 1. It seems better to support one version than no version --
>    the current profile version 4 is not compatible with
>    LLVM version 11 or later
> 2. The patch could be extended to support multiple
>    LLVM profile versions, e.g., from 5 to 10
>
> The llvm-cov toolchain, with its Source-based Code Coverage,
> offers two substantial advantages over gcov:
>   - More accurate coverage reporting when compiler optimizations
>     are enabled, ensuring better analysis of optimized code.
>   - Better tracking of coverage across inlined function boundaries,
>     critical for complex control flows in Xen.
>
> Overall, this change would enhance Xen's code coverage analysis
> capabilities by leveraging the latest LLVM toolchain improvements,
> particularly for safety-critical hypervisor code.
>
> The patch modifies only `xen/common/coverage/llvm.c`,
> maintaining API compatibility while enabling modern toolchain support.
> Testing was performed with LLVM 19 and 20 to confirm functionality.
>
> ---
>  xen/common/coverage/llvm.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
> index 517b2aa8c2..3da82c6cda 100644
> --- a/xen/common/coverage/llvm.c
> +++ b/xen/common/coverage/llvm.c
> @@ -44,27 +44,37 @@
>      ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
>  #endif
>
> -#define LLVM_PROFILE_VERSION    4
> -#define LLVM_PROFILE_NUM_KINDS  2
> +#define LLVM_PROFILE_VERSION    10
> +#define LLVM_PROFILE_NUM_KINDS  3
>
>  struct llvm_profile_data {
>      uint64_t name_ref;
>      uint64_t function_hash;
> -    void *counter;
> +    void *relative_counter;
> +    void *relative_bitmap;
>      void *function;
>      void *values;
>      uint32_t nr_counters;
>      uint16_t nr_value_sites[LLVM_PROFILE_NUM_KINDS];
> +    uint32_t numbitmap_bytes;
>  };
>
>  struct llvm_profile_header {
>      uint64_t magic;
>      uint64_t version;
> -    uint64_t data_size;
> -    uint64_t counters_size;
> +    uint64_t binary_ids_size;
> +    uint64_t num_data;
> +    uint64_t padding_bytes_before_counters;
> +    uint64_t num_counters;
> +    uint64_t padding_bytes_after_counters;
> +    uint64_t num_bitmap_bytes;
> +    uint64_t padding_bytes_after_bitmap_bytes;
>      uint64_t names_size;
>      uint64_t counters_delta;
> +    uint64_t bitmap_delta;
>      uint64_t names_delta;
> +    uint64_t num_vtables;
> +    uint64_t vnames_size;
>      uint64_t value_kind_last;
>  };
>
> @@ -110,7 +120,7 @@ static int cf_check dump(
>          .data_size =3D (END_DATA - START_DATA) / sizeof(struct
> llvm_profile_data),
>          .counters_size =3D (END_COUNTERS - START_COUNTERS) /
> sizeof(uint64_t),
>          .names_size =3D END_NAMES - START_NAMES,
> -        .counters_delta =3D (uintptr_t)START_COUNTERS,
> +        .counters_delta =3D (uintptr_t)(START_COUNTERS - START_DATA),
>          .names_delta =3D (uintptr_t)START_NAMES,
>          .value_kind_last =3D LLVM_PROFILE_NUM_KINDS - 1,
>      };
> --
> 2.49.0
>
>

--00000000000038b1300640204e51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">This change e=
nables compatibility for measuring code coverage</span><br style=3D"font-fa=
mily:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica=
,sans-serif">with Clang versions 14 through 20 by supporting their</span><b=
r style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-fami=
ly:Arial,Helvetica,sans-serif">respective raw profile formats.</span><br st=
yle=3D"font-family:Arial,Helvetica,sans-serif"><br style=3D"font-family:Ari=
al,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-se=
rif">1- Add support for LLVM raw profile versions 8, 9, and 10</span><br st=
yle=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:A=
rial,Helvetica,sans-serif">2- Initialized llvm_profile_header for all versi=
ons based on llvm source code in<span class=3D"gmail-Apple-converted-space"=
>=C2=A0</span></span><br style=3D"font-family:Arial,Helvetica,sans-serif"><=
span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0`compile=
r-rt/include/profile/</span><span style=3D"font-family:Arial,Helvetica,sans=
-serif">InstrProfData.inc` for each version.</span><br style=3D"font-family=
:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,san=
s-serif">3- We tested this patch for all clang versions from 14 through 20 =
on both ARM and X86 platform</span><br style=3D"font-family:Arial,Helvetica=
,sans-serif"><br style=3D"font-family:Arial,Helvetica,sans-serif"><span sty=
le=3D"font-family:Arial,Helvetica,sans-serif">Signed-off-by: Saman Dehghan =
&lt;</span><a href=3D"mailto:samaan.dehghan@gmail.com" target=3D"_blank" st=
yle=3D"font-family:Arial,Helvetica,sans-serif">samaan.dehghan@gmail.com</a>=
<span style=3D"font-family:Arial,Helvetica,sans-serif">&gt;</span><br style=
=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Aria=
l,Helvetica,sans-serif">---</span><br style=3D"font-family:Arial,Helvetica,=
sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0xe=
n/common/coverage/llvm.c | 78 +++++++++++++++++++++++++++---</span><span st=
yle=3D"font-family:Arial,Helvetica,sans-serif">--------</span><br style=3D"=
font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,He=
lvetica,sans-serif">=C2=A0xen/include/xen/types.h=C2=A0 =C2=A0 |=C2=A0 1 +<=
/span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"f=
ont-family:Arial,Helvetica,sans-serif">=C2=A02 files changed, 57 insertions=
(+), 22 deletions(-)</span><br style=3D"font-family:Arial,Helvetica,sans-se=
rif"><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"fo=
nt-family:Arial,Helvetica,sans-serif">diff --git a/xen/common/coverage/llvm=
.c b/xen/common/coverage/llvm.c</span><br style=3D"font-family:Arial,Helvet=
ica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">inde=
x 517b2aa8c2..f92f10654c 100644</span><br style=3D"font-family:Arial,Helvet=
ica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">--- =
a/xen/common/coverage/llvm.c</span><br style=3D"font-family:Arial,Helvetica=
,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+++ b/x=
en/common/coverage/llvm.c</span><br style=3D"font-family:Arial,Helvetica,sa=
ns-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">@@ -44,27 =
+44,55 @@</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span =
style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0 =C2=A0((uint=
64_t)&#39;f&#39; &lt;&lt; 16) | ((uint64_t)&#39;R&#39; &lt;&lt; 8)=C2=A0 | =
((uint64_t)129)</span><br style=3D"font-family:Arial,Helvetica,sans-serif">=
<span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0#endif</span><=
br style=3D"font-family:Arial,Helvetica,sans-serif"><br style=3D"font-famil=
y:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif">-#define LLVM_PROFILE_VERSION=C2=A0 =C2=A0 4</span><br style=3D"f=
ont-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Hel=
vetica,sans-serif">+#if __clang_major__ &gt;=3D 19</span><br style=3D"font-=
family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helveti=
ca,sans-serif">+#define LLVM_PROFILE_VERSION=C2=A0 =C2=A0 10</span><br styl=
e=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Ari=
al,Helvetica,sans-serif">+#define LLVM_PROFILE_NUM_KINDS=C2=A0 3</span><br =
style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family=
:Arial,Helvetica,sans-serif">+#elif __clang_major__ =3D=3D 18</span><br sty=
le=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Ar=
ial,Helvetica,sans-serif">+#define LLVM_PROFILE_VERSION=C2=A0 =C2=A0 9</spa=
n><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-=
family:Arial,Helvetica,sans-serif">=C2=A0#define LLVM_PROFILE_NUM_KINDS=C2=
=A0 2</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span styl=
e=3D"font-family:Arial,Helvetica,sans-serif">+#elif __clang_major__ &gt;=3D=
 14</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=
=3D"font-family:Arial,Helvetica,sans-serif">+#define LLVM_PROFILE_VERSION=
=C2=A0 =C2=A0 8</span><br style=3D"font-family:Arial,Helvetica,sans-serif">=
<span style=3D"font-family:Arial,Helvetica,sans-serif">+#define LLVM_PROFIL=
E_NUM_KINDS=C2=A0 2</span><br style=3D"font-family:Arial,Helvetica,sans-ser=
if"><span style=3D"font-family:Arial,Helvetica,sans-serif">+#else</span><br=
 style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-famil=
y:Arial,Helvetica,sans-serif">+#error &quot;Unsupported Clang version&quot;=
</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"=
font-family:Arial,Helvetica,sans-serif">+#endif</span><br style=3D"font-fam=
ily:Arial,Helvetica,sans-serif"><br style=3D"font-family:Arial,Helvetica,sa=
ns-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0stru=
ct llvm_profile_data {</span><br style=3D"font-family:Arial,Helvetica,sans-=
serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0=
 =C2=A0uint64_t name_ref;</span><br style=3D"font-family:Arial,Helvetica,sa=
ns-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=
=A0 =C2=A0uint64_t function_hash;</span><br style=3D"font-family:Arial,Helv=
etica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">-=
=C2=A0 =C2=A0 void *counter;</span><br style=3D"font-family:Arial,Helvetica=
,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">-=C2=A0=
 =C2=A0 void *function;</span><br style=3D"font-family:Arial,Helvetica,sans=
-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">-=C2=A0 =C2=
=A0 void *values;</span><br style=3D"font-family:Arial,Helvetica,sans-serif=
"><span style=3D"font-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 int=
ptr_t *relative_counter;</span><br style=3D"font-family:Arial,Helvetica,san=
s-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+#if __clan=
g_major__ &gt;=3D 18</span><br style=3D"font-family:Arial,Helvetica,sans-se=
rif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 =
intptr_t *relative_bitmap;</span><br style=3D"font-family:Arial,Helvetica,s=
ans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+#endif</=
span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"fo=
nt-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 intptr_t *function;</s=
pan><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"fon=
t-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 intptr_t *values;</span=
><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-f=
amily:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0 =C2=A0uint32_t nr_counters;=
</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"=
font-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0 =C2=A0uint16_t nr_val=
ue_sites[LLVM_PROFILE_NU</span><span style=3D"font-family:Arial,Helvetica,s=
ans-serif">M_KINDS];</span><br style=3D"font-family:Arial,Helvetica,sans-se=
rif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+#if __clang_ma=
jor__ &gt;=3D 18</span><br style=3D"font-family:Arial,Helvetica,sans-serif"=
><span style=3D"font-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 uint=
32_t numbitmap_bytes;</span><br style=3D"font-family:Arial,Helvetica,sans-s=
erif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+#endif</span>=
<br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-fa=
mily:Arial,Helvetica,sans-serif">=C2=A0};</span><br style=3D"font-family:Ar=
ial,Helvetica,sans-serif"><br style=3D"font-family:Arial,Helvetica,sans-ser=
if"><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0struct llv=
m_profile_header {</span><br style=3D"font-family:Arial,Helvetica,sans-seri=
f"><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0 =C2=
=A0uint64_t magic;</span><br style=3D"font-family:Arial,Helvetica,sans-seri=
f"><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0 =C2=
=A0uint64_t version;</span><br style=3D"font-family:Arial,Helvetica,sans-se=
rif"><span style=3D"font-family:Arial,Helvetica,sans-serif">-=C2=A0 =C2=A0 =
uint64_t data_size;</span><br style=3D"font-family:Arial,Helvetica,sans-ser=
if"><span style=3D"font-family:Arial,Helvetica,sans-serif">-=C2=A0 =C2=A0 u=
int64_t counters_size;</span><br style=3D"font-family:Arial,Helvetica,sans-=
serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=
=A0 uint64_t binary_ids_size;</span><br style=3D"font-family:Arial,Helvetic=
a,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+=C2=
=A0 =C2=A0 uint64_t num_data;</span><br style=3D"font-family:Arial,Helvetic=
a,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+=C2=
=A0 =C2=A0 uint64_t padding_bytes_before_counters;</span><br style=3D"font-=
family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helveti=
ca,sans-serif">+=C2=A0 =C2=A0 uint64_t num_counters;</span><br style=3D"fon=
t-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helve=
tica,sans-serif">+=C2=A0 =C2=A0 uint64_t padding_bytes_after_counters;</spa=
n><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-=
family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 uint64_t num_bitmap_bytes=
;</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D=
"font-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 uint64_t padding_by=
tes_after_bitmap_byt</span><span style=3D"font-family:Arial,Helvetica,sans-=
serif">es;</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span=
 style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0 =C2=A0uint6=
4_t names_size;</span><br style=3D"font-family:Arial,Helvetica,sans-serif">=
<span style=3D"font-family:Arial,Helvetica,sans-serif">+#if __clang_major__=
 &gt;=3D 18</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><spa=
n style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0 =C2=A0uint=
64_t counters_delta;</span><br style=3D"font-family:Arial,Helvetica,sans-se=
rif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 =
uint64_t bitmap_delta;</span><br style=3D"font-family:Arial,Helvetica,sans-=
serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+#endif</span=
><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-f=
amily:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0 =C2=A0uint64_t names_delta;=
</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"=
font-family:Arial,Helvetica,sans-serif">+#if __clang_major__ &gt;=3D 19</sp=
an><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font=
-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 uint64_t num_vtables;</s=
pan><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"fon=
t-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 uint64_t vnames_size;</=
span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"fo=
nt-family:Arial,Helvetica,sans-serif">+#endif</span><br style=3D"font-famil=
y:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif">=C2=A0 =C2=A0 =C2=A0uint64_t value_kind_last;</span><br style=3D"=
font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,He=
lvetica,sans-serif">=C2=A0};</span><br style=3D"font-family:Arial,Helvetica=
,sans-serif"><br style=3D"font-family:Arial,Helvetica,sans-serif"><span sty=
le=3D"font-family:Arial,Helvetica,sans-serif">@@ -76,19 +104,20 @@ struct l=
lvm_profile_header {</span><br style=3D"font-family:Arial,Helvetica,sans-se=
rif"><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0 */</span=
><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-f=
amily:Arial,Helvetica,sans-serif">=C2=A0int __llvm_profile_runtime;</span><=
br style=3D"font-family:Arial,Helvetica,sans-serif"><br style=3D"font-famil=
y:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif">-extern const struct llvm_profile_data __start___llvm_prf_data[];=
</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"=
font-family:Arial,Helvetica,sans-serif">-extern const struct llvm_profile_d=
ata __stop___llvm_prf_data[];</span><br style=3D"font-family:Arial,Helvetic=
a,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">-exter=
n const char __start___llvm_prf_names[];</span><br style=3D"font-family:Ari=
al,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-se=
rif">-extern const char __stop___llvm_prf_names[];</span><br style=3D"font-=
family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helveti=
ca,sans-serif">-extern uint64_t __start___llvm_prf_cnts[];</span><br style=
=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Aria=
l,Helvetica,sans-serif">-extern uint64_t __stop___llvm_prf_cnts[];</span><b=
r style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-fami=
ly:Arial,Helvetica,sans-serif">+extern char __start___llvm_prf_data[];</spa=
n><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-=
family:Arial,Helvetica,sans-serif">+extern char __stop___llvm_prf_data[];</=
span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"fo=
nt-family:Arial,Helvetica,sans-serif">+extern char __start___llvm_prf_names=
[];</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=
=3D"font-family:Arial,Helvetica,sans-serif">+extern char __stop___llvm_prf_=
names[];</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span s=
tyle=3D"font-family:Arial,Helvetica,sans-serif">+extern char __start___llvm=
_prf_cnts[];</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><sp=
an style=3D"font-family:Arial,Helvetica,sans-serif">+extern char __stop___l=
lvm_prf_cnts[];</span><br style=3D"font-family:Arial,Helvetica,sans-serif">=
<span style=3D"font-family:Arial,Helvetica,sans-serif">+</span><br style=3D=
"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,H=
elvetica,sans-serif">+#define START_DATA=C2=A0 =C2=A0 =C2=A0 ((const char *=
)__start___llvm_prf_data)</span><br style=3D"font-family:Arial,Helvetica,sa=
ns-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+#define E=
ND_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((const char *)__stop___llvm_prf_data)</=
span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"fo=
nt-family:Arial,Helvetica,sans-serif">+#define START_NAMES=C2=A0 =C2=A0 =C2=
=A0((const char *)__start___llvm_prf_names)</span><br style=3D"font-family:=
Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans=
-serif">+#define END_NAMES=C2=A0 =C2=A0 =C2=A0 =C2=A0((const char *)__stop_=
__llvm_prf_names)</span><br style=3D"font-family:Arial,Helvetica,sans-serif=
"><span style=3D"font-family:Arial,Helvetica,sans-serif">+#define START_COU=
NTERS=C2=A0 ((char *)__start___llvm_prf_cnts)</span><br style=3D"font-famil=
y:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif">+#define END_COUNTERS=C2=A0 =C2=A0 ((char *)__stop___llvm_prf_cnt=
s)</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><br style=3D"=
font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,He=
lvetica,sans-serif">-#define START_DATA=C2=A0 =C2=A0 =C2=A0 ((const void *)=
__start___llvm_prf_data)</span><br style=3D"font-family:Arial,Helvetica,san=
s-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">-#define EN=
D_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((const void *)__stop___llvm_prf_data)</s=
pan><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"fon=
t-family:Arial,Helvetica,sans-serif">-#define START_NAMES=C2=A0 =C2=A0 =C2=
=A0((const void *)__start___llvm_prf_names)</span><br style=3D"font-family:=
Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans=
-serif">-#define END_NAMES=C2=A0 =C2=A0 =C2=A0 =C2=A0((const void *)__stop_=
__llvm_prf_names)</span><br style=3D"font-family:Arial,Helvetica,sans-serif=
"><span style=3D"font-family:Arial,Helvetica,sans-serif">-#define START_COU=
NTERS=C2=A0 ((void *)__start___llvm_prf_cnts)</span><br style=3D"font-famil=
y:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif">-#define END_COUNTERS=C2=A0 =C2=A0 ((void *)__stop___llvm_prf_cnt=
s)</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><br style=3D"=
font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,He=
lvetica,sans-serif">=C2=A0static void cf_check reset_counters(void)</span><=
br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-fam=
ily:Arial,Helvetica,sans-serif">=C2=A0{</span><br style=3D"font-family:Aria=
l,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-ser=
if">@@ -107,10 +136,15 @@ static int cf_check dump(</span><br style=3D"font=
-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvet=
ica,sans-serif">=C2=A0 =C2=A0 =C2=A0struct llvm_profile_header header =3D {=
</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"=
font-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.=
magic =3D LLVM_PROFILE_MAGIC,</span><br style=3D"font-family:Arial,Helvetic=
a,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0.version =3D LLVM_PROFILE_VERSION,</span><br st=
yle=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:A=
rial,Helvetica,sans-serif">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .data_size =3D (END=
_DATA - START_DATA) / sizeof(struct llvm_profile_data),</span><br style=3D"=
font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,He=
lvetica,sans-serif">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .counters_size =3D (END_CO=
UNTERS - START_COUNTERS) / sizeof(uint64_t),</span><br style=3D"font-family=
:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,san=
s-serif">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .names_size =3D END_NAMES - START_NAM=
ES,</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=
=3D"font-family:Arial,Helvetica,sans-serif">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .c=
ounters_delta =3D (uintptr_t)START_COUNTERS,</span><br style=3D"font-family=
:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,san=
s-serif">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .binary_ids_size =3D 0,</span><br sty=
le=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Ar=
ial,Helvetica,sans-serif">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_data =3D (((int=
ptr_t)END_DATA + sizeof(struct llvm_profile_data) - 1)</span><br style=3D"f=
ont-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Arial,Hel=
vetica,sans-serif">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 - (intptr_t)START_DATA) / sizeof(struct llvm_profile_data),</span><br styl=
e=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:Ari=
al,Helvetica,sans-serif">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .padding_bytes_before=
_counters =3D 0,</span><br style=3D"font-family:Arial,Helvetica,sans-serif"=
><span style=3D"font-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .num_counters =3D (((intptr_t)END_COUNTERS + sizeof(uint64_t) - =
1)</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=
=3D"font-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - (intptr_t)START_COUNTERS) / sizeof(uint64_t),=
</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"=
font-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .paddi=
ng_bytes_after_counters =3D 0,</span><br style=3D"font-family:Arial,Helveti=
ca,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .names_size =3D (END_NAMES - START_NAMES) * sizeof=
(char),</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span st=
yle=3D"font-family:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 .counters_delta =3D (uintptr_t)START_COUNTERS - (uintptr_t)START_DATA,</sp=
an><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font=
-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=
s_delta =3D (uintptr_t)START_NAMES,</span><br style=3D"font-family:Arial,He=
lvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.value_kind_last =3D LLVM_PROFILE_NUM_KIN=
DS - 1,</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span st=
yle=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0 =C2=A0 =C2=A0};</span=
><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-f=
amily:Arial,Helvetica,sans-serif">diff --git a/xen/include/xen/types.h b/xe=
n/include/xen/types.h</span><br style=3D"font-family:Arial,Helvetica,sans-s=
erif"><span style=3D"font-family:Arial,Helvetica,sans-serif">index 73ddccbb=
d5..799bfe0b95 100644</span><br style=3D"font-family:Arial,Helvetica,sans-s=
erif"><span style=3D"font-family:Arial,Helvetica,sans-serif">--- a/xen/incl=
ude/xen/types.h</span><br style=3D"font-family:Arial,Helvetica,sans-serif">=
<span style=3D"font-family:Arial,Helvetica,sans-serif">+++ b/xen/include/xe=
n/types.h</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span =
style=3D"font-family:Arial,Helvetica,sans-serif">@@ -18,6 +18,7 @@ typedef =
signed long ssize_t;</span><br style=3D"font-family:Arial,Helvetica,sans-se=
rif"><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"fo=
nt-family:Arial,Helvetica,sans-serif">=C2=A0typedef __PTRDIFF_TYPE__ ptrdif=
f_t;</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span style=
=3D"font-family:Arial,Helvetica,sans-serif">=C2=A0typedef __UINTPTR_TYPE__ =
uintptr_t;</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><span=
 style=3D"font-family:Arial,Helvetica,sans-serif">+typedef __INTPTR_TYPE__ =
intptr_t;</span><br style=3D"font-family:Arial,Helvetica,sans-serif"><br st=
yle=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-family:A=
rial,Helvetica,sans-serif">=C2=A0/*</span><br style=3D"font-family:Arial,He=
lvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">=
=C2=A0 * Users of this macro are expected to pass a positive value.</span><=
font color=3D"#888888" style=3D"font-family:Arial,Helvetica,sans-serif"><br=
>--<span class=3D"gmail-Apple-converted-space">=C2=A0</span><br>2.49.0<br><=
/font></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 15, 2025 at 11:56=E2=80=AFAM =
Saman Dehghan &lt;<a href=3D"mailto:samaan.dehghan@gmail.com">samaan.dehgha=
n@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">This patch updates the=
 LLVM profile raw format in<br>
`xen/common/coverage/llvm.c` from version 4 to version 10,<br>
enabling compatibility with LLVM versions 19 and 20.<br>
While the patch supports only one version:<br>
1. It seems better to support one version than no version --<br>
=C2=A0 =C2=A0the current profile version 4 is not compatible with<br>
=C2=A0 =C2=A0LLVM version 11 or later<br>
2. The patch could be extended to support multiple<br>
=C2=A0 =C2=A0LLVM profile versions, e.g., from 5 to 10<br>
<br>
The llvm-cov toolchain, with its Source-based Code Coverage,<br>
offers two substantial advantages over gcov:<br>
=C2=A0 - More accurate coverage reporting when compiler optimizations<br>
=C2=A0 =C2=A0 are enabled, ensuring better analysis of optimized code.<br>
=C2=A0 - Better tracking of coverage across inlined function boundaries,<br=
>
=C2=A0 =C2=A0 critical for complex control flows in Xen.<br>
<br>
Overall, this change would enhance Xen&#39;s code coverage analysis<br>
capabilities by leveraging the latest LLVM toolchain improvements,<br>
particularly for safety-critical hypervisor code.<br>
<br>
The patch modifies only `xen/common/coverage/llvm.c`,<br>
maintaining API compatibility while enabling modern toolchain support.<br>
Testing was performed with LLVM 19 and 20 to confirm functionality.<br>
<br>
---<br>
=C2=A0xen/common/coverage/llvm.c | 22 ++++++++++++++++------<br>
=C2=A01 file changed, 16 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c<br>
index 517b2aa8c2..3da82c6cda 100644<br>
--- a/xen/common/coverage/llvm.c<br>
+++ b/xen/common/coverage/llvm.c<br>
@@ -44,27 +44,37 @@<br>
=C2=A0 =C2=A0 =C2=A0((uint64_t)&#39;f&#39; &lt;&lt; 16) | ((uint64_t)&#39;R=
&#39; &lt;&lt; 8)=C2=A0 | ((uint64_t)129)<br>
=C2=A0#endif<br>
<br>
-#define LLVM_PROFILE_VERSION=C2=A0 =C2=A0 4<br>
-#define LLVM_PROFILE_NUM_KINDS=C2=A0 2<br>
+#define LLVM_PROFILE_VERSION=C2=A0 =C2=A0 10<br>
+#define LLVM_PROFILE_NUM_KINDS=C2=A0 3<br>
<br>
=C2=A0struct llvm_profile_data {<br>
=C2=A0 =C2=A0 =C2=A0uint64_t name_ref;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t function_hash;<br>
-=C2=A0 =C2=A0 void *counter;<br>
+=C2=A0 =C2=A0 void *relative_counter;<br>
+=C2=A0 =C2=A0 void *relative_bitmap;<br>
=C2=A0 =C2=A0 =C2=A0void *function;<br>
=C2=A0 =C2=A0 =C2=A0void *values;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t nr_counters;<br>
=C2=A0 =C2=A0 =C2=A0uint16_t nr_value_sites[LLVM_PROFILE_NUM_KINDS];<br>
+=C2=A0 =C2=A0 uint32_t numbitmap_bytes;<br>
=C2=A0};<br>
<br>
=C2=A0struct llvm_profile_header {<br>
=C2=A0 =C2=A0 =C2=A0uint64_t magic;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t version;<br>
-=C2=A0 =C2=A0 uint64_t data_size;<br>
-=C2=A0 =C2=A0 uint64_t counters_size;<br>
+=C2=A0 =C2=A0 uint64_t binary_ids_size;<br>
+=C2=A0 =C2=A0 uint64_t num_data;<br>
+=C2=A0 =C2=A0 uint64_t padding_bytes_before_counters;<br>
+=C2=A0 =C2=A0 uint64_t num_counters;<br>
+=C2=A0 =C2=A0 uint64_t padding_bytes_after_counters;<br>
+=C2=A0 =C2=A0 uint64_t num_bitmap_bytes;=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 uint64_t padding_bytes_after_bitmap_bytes;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t names_size;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t counters_delta;<br>
+=C2=A0 =C2=A0 uint64_t bitmap_delta;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t names_delta;<br>
+=C2=A0 =C2=A0 uint64_t num_vtables;<br>
+=C2=A0 =C2=A0 uint64_t vnames_size;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t value_kind_last;<br>
=C2=A0};<br>
<br>
@@ -110,7 +120,7 @@ static int cf_check dump(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data_size =3D (END_DATA - START_DATA) / =
sizeof(struct llvm_profile_data),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.counters_size =3D (END_COUNTERS - START_=
COUNTERS) / sizeof(uint64_t),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.names_size =3D END_NAMES - START_NAMES,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .counters_delta =3D (uintptr_t)START_COUNTERS,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .counters_delta =3D (uintptr_t)(START_COUNTERS=
 - START_DATA),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.names_delta =3D (uintptr_t)START_NAMES,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.value_kind_last =3D LLVM_PROFILE_NUM_KIN=
DS - 1,<br>
=C2=A0 =C2=A0 =C2=A0};<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--00000000000038b1300640204e51--

