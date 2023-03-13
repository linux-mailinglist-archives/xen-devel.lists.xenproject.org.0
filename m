Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4826B716D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 09:46:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509149.784424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdp5-0008Qy-TD; Mon, 13 Mar 2023 08:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509149.784424; Mon, 13 Mar 2023 08:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdp5-0008PD-PZ; Mon, 13 Mar 2023 08:46:27 +0000
Received: by outflank-mailman (input) for mailman id 509149;
 Mon, 13 Mar 2023 08:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kFW/=7F=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1pbdp4-0008Ow-EE
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 08:46:26 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89953047-c17b-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 09:46:25 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id ay8so2049550wmb.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 01:46:25 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x26-20020a1c7c1a000000b003eae73ee4a1sm8318979wmc.17.2023.03.13.01.46.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:46:24 -0700 (PDT)
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
X-Inumbo-ID: 89953047-c17b-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1678697185;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9z9tl3r2jJQo4kahQXjkrPQCp+v36lDX++AtUXHutEQ=;
        b=E+sE4HuDkhkQ0ofPq9drXb6grrtHVkShRly0bSa9zvJ+hqixB8OUSHwYkOUA7objer
         3zO9Z4s48b6e8gpRXY3Rke6+0/GZZpv19KtjGl3EoVqhzQsl407raz2/q9zZ/eUN9VUA
         bQLt77SsDngXO7fkSuwx7leJjdEQVeQsnUE3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678697185;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z9tl3r2jJQo4kahQXjkrPQCp+v36lDX++AtUXHutEQ=;
        b=kHdD886Ed2nDS2/oluFfpRZPoKqU2ofvCVagLy1GzmeaGcbyBAAhQ+pmQjurTwbnoT
         BAws6cMtf/IlKK4WHY+s6Hf3VXT2McAKyjp7vhGa6c/jsPyMhRBSuTrH43LaEMjs/cLL
         CbFUH35iGAVqYnEvSexsGZEIQzgZPkdP6XRXwKqppDYlUI2dsC1B14TNyHpKZt0+Pn9I
         pWszzt1MfpQLQsjseledYOkUPKrvC0oXy+AmlOrwL4rU8HY+49i4fupBQ3+LGVnxGZcl
         IccThQEbrYF7zGNnjrwzPniybHftmmWcvG0JOxSc6vIvCkITlXIbgK0P2Q5wQevHvauL
         S4ew==
X-Gm-Message-State: AO0yUKVkmYPUJcivjvGOWeIFi/exZr8zM/sksD1GK4QH4RIw+9fbZd7f
	Lh4RcNGiccHcQa84w6Molavi+Q==
X-Google-Smtp-Source: AK7set8QpNslGENwPQrsywQlQ28ljJfWOMqtSWiCQz0h8Wi0s5i7i/bL3pvCiK75M6jqKtF8i7PkBg==
X-Received: by 2002:a05:600c:4453:b0:3eb:1432:a78c with SMTP id v19-20020a05600c445300b003eb1432a78cmr10133868wmn.37.1678697184779;
        Mon, 13 Mar 2023 01:46:24 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 3/3] x86/sysctl: Retrofit
 XEN_SYSCTL_cpu_featureset_{pv,hvm}_max
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230310203712.1431387-4-andrew.cooper3@citrix.com>
Date: Mon, 13 Mar 2023 08:46:23 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <28A7BE40-D9C5-4B1D-924F-F7BA15889C5B@cloud.com>
References: <20230310203712.1431387-1-andrew.cooper3@citrix.com>
 <20230310203712.1431387-4-andrew.cooper3@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 10 Mar 2023, at 20:37, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> Featuresets are supposed to be disappearing when the CPU policy =
infrastructure
> is complete, but that has taken longer than expected, and isn't going =
to be
> complete imminently either.
>=20
> In the meantime, Xen does have proper default/max featuresets, and =
xen-cpuid
> can even get them via the XEN_SYSCTL_cpu_policy_* interface, but only =
knows
> now to render them nicely via the featureset interface.
>=20
> Differences between default and max are a frequent source of errors,
> frequently too in secret leading up to an embargo, so extend the =
featureset
> sysctl to allow xen-cpuid to render them all nicely.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
>=20
> I actually this SYSCTL extention in the XenServer patchqueue for =
reasons that
> started with the TSX fiasco; I have no idea why its taken until now to =
think
> it would be a good idea to wire into xen-cpuid too...
> ---
> tools/misc/xen-cpuid.c          | 10 ++++++----
> tools/ocaml/libs/xc/xenctrl.ml  |  8 +++++++-
> tools/ocaml/libs/xc/xenctrl.mli |  8 +++++++-
> xen/arch/x86/sysctl.c           |  4 +++-
> xen/include/public/sysctl.h     |  2 ++
> 5 files changed, 25 insertions(+), 7 deletions(-)
>=20


Acked-by: Christian Lindig <christian.lindig@cloud.com>

> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index 227df7352e2b..37a7eaa8edfc 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -247,10 +247,12 @@ static const struct {
> #define COL_ALIGN "18"
>=20
> static const char *const fs_names[] =3D {
> -    [XEN_SYSCTL_cpu_featureset_host] =3D "Host",
> -    [XEN_SYSCTL_cpu_featureset_raw]  =3D "Raw",
> -    [XEN_SYSCTL_cpu_featureset_pv]   =3D "PV",
> -    [XEN_SYSCTL_cpu_featureset_hvm]  =3D "HVM",
> +    [XEN_SYSCTL_cpu_featureset_raw]     =3D "Raw",
> +    [XEN_SYSCTL_cpu_featureset_host]    =3D "Host",
> +    [XEN_SYSCTL_cpu_featureset_pv]      =3D "PV Default",
> +    [XEN_SYSCTL_cpu_featureset_hvm]     =3D "HVM Default",
> +    [XEN_SYSCTL_cpu_featureset_pv_max]  =3D "PV Max",
> +    [XEN_SYSCTL_cpu_featureset_hvm_max] =3D "HVM Max",
> };
>=20
> static void dump_leaf(uint32_t leaf, const char *const *strs)
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml =
b/tools/ocaml/libs/xc/xenctrl.ml
> index a59dee093897..e4096bf92c1d 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -370,7 +370,13 @@ external version_changeset: handle -> string =3D =
"stub_xc_version_changeset"
> external version_capabilities: handle -> string =3D
>   "stub_xc_version_capabilities"
>=20
> -type featureset_index =3D Featureset_raw | Featureset_host | =
Featureset_pv | Featureset_hvm
> +type featureset_index =3D
> +  | Featureset_raw
> +  | Featureset_host
> +  | Featureset_pv
> +  | Featureset_hvm
> +  | Featureset_pv_max
> +  | Featureset_hvm_max
> external get_cpu_featureset : handle -> featureset_index -> int64 =
array =3D "stub_xc_get_cpu_featureset"
>=20
> external watchdog : handle -> int -> int32 -> int
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli =
b/tools/ocaml/libs/xc/xenctrl.mli
> index 3154e90f4f98..ef2254537430 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -297,7 +297,13 @@ external version_changeset : handle -> string =3D =
"stub_xc_version_changeset"
> external version_capabilities : handle -> string
>   =3D "stub_xc_version_capabilities"
>=20
> -type featureset_index =3D Featureset_raw | Featureset_host | =
Featureset_pv | Featureset_hvm
> +type featureset_index =3D
> +  | Featureset_raw
> +  | Featureset_host
> +  | Featureset_pv
> +  | Featureset_hvm
> +  | Featureset_pv_max
> +  | Featureset_hvm_max
> external get_cpu_featureset : handle -> featureset_index -> int64 =
array =3D "stub_xc_get_cpu_featureset"
>=20
> external pages_to_kib : int64 -> int64 =3D "stub_pages_to_kib"
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index f42a3b843ba7..6600eb43471b 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -323,14 +323,16 @@ long arch_do_sysctl(
>=20
>     case XEN_SYSCTL_get_cpu_featureset:
>     {
> -        static const struct cpuid_policy *const policy_table[4] =3D {
> +        static const struct cpuid_policy *const policy_table[6] =3D {
>             [XEN_SYSCTL_cpu_featureset_raw]  =3D &raw_cpuid_policy,
>             [XEN_SYSCTL_cpu_featureset_host] =3D &host_cpuid_policy,
> #ifdef CONFIG_PV
>             [XEN_SYSCTL_cpu_featureset_pv]   =3D &pv_def_cpuid_policy,
> +            [XEN_SYSCTL_cpu_featureset_pv_max] =3D =
&pv_max_cpuid_policy,
> #endif
> #ifdef CONFIG_HVM
>             [XEN_SYSCTL_cpu_featureset_hvm]  =3D =
&hvm_def_cpuid_policy,
> +            [XEN_SYSCTL_cpu_featureset_hvm_max] =3D =
&hvm_max_cpuid_policy,
> #endif
>         };
>         const struct cpuid_policy *p =3D NULL;
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 001a4de27375..e8dded9fb94a 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -796,6 +796,8 @@ struct xen_sysctl_cpu_featureset {
> #define XEN_SYSCTL_cpu_featureset_host     1
> #define XEN_SYSCTL_cpu_featureset_pv       2
> #define XEN_SYSCTL_cpu_featureset_hvm      3
> +#define XEN_SYSCTL_cpu_featureset_pv_max   4
> +#define XEN_SYSCTL_cpu_featureset_hvm_max  5
>     uint32_t index;       /* IN: Which featureset to query? */
>     uint32_t nr_features; /* IN/OUT: Number of entries in/written to
>                            * 'features', or the maximum number of =
features if
> --=20
> 2.30.2
>=20


