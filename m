Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEDC814741
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 12:48:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655070.1022723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6fF-0001gY-Gy; Fri, 15 Dec 2023 11:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655070.1022723; Fri, 15 Dec 2023 11:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6fF-0001eD-Dz; Fri, 15 Dec 2023 11:47:33 +0000
Received: by outflank-mailman (input) for mailman id 655070;
 Fri, 15 Dec 2023 11:47:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUFd=H2=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rE6fD-0001e7-F5
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 11:47:31 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba1cedf1-9b3f-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 12:47:30 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c39e936b4so5961645e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 03:47:30 -0800 (PST)
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
X-Inumbo-ID: ba1cedf1-9b3f-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702640850; x=1703245650; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TenIao7bMiUVyvEGfhfEceUI6WytzaJa5c4gA8UOiHc=;
        b=U9v6HafNTPexqAr1Nq6GcEfKdx/jceve8FvRyg2ecdbx0HvMZNiYcWusyc66Cc0k1D
         OscGZsSgTuUdPxoLCRCATOdCCkEJi+DSs0BA1OpogNFg3bPy8YkbSahaSagHz/wKuTV3
         nRxbP+ffXPN96O1nhnjBkkjWeU29OyyI/J1bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702640850; x=1703245650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TenIao7bMiUVyvEGfhfEceUI6WytzaJa5c4gA8UOiHc=;
        b=aRJJrJIyoBEURuDhBhJNNkt6Nycfh+n6tKJ6iKtSmKCSM2TAKr3F3BcUrK27MByrad
         S4azqZwsDEYMl+qFgO4+qzrRG4yDSCzE7GMzCkZs6luK60HBjzcXpOHLlV5exrCLHBU8
         BzuxfbyVq7ibHE+RKqsHXLhnbUawRjMZAq83bNfj/B0gmM/EyGDE11o1de1Id0jl8Je+
         tznshNiGvMQ+ixx16bh7UCiB0gEyaCfU3RXa+6S7ooONv03gyoDbT0NrB5wLRn7eh8Oc
         iF6eNzvnpv05g+olr6WU//+E68oisFii9QD8Rts7eqQXMwRvUO5ZnSIW1yFhb7hNPQ+z
         BBEg==
X-Gm-Message-State: AOJu0Yz+UVjIFbvSPMEyhHJCAH4zZc0FWlHtnsoF1Ji5P1gBu9XBIh93
	/iG58k8tdMUEnGOkVm3yY7lLJm5dej68CE/R/5AF
X-Google-Smtp-Source: AGHT+IEAM9d/uNJA8u1Vg5tTYO+RBd4K1EX5rSNkRyigqjkaPrD4fX7j0CFMYTRTQWoP7AJbxafzWyJ1vJUx37s8P7g=
X-Received: by 2002:a05:600c:2814:b0:40b:5f03:b43f with SMTP id
 m20-20020a05600c281400b0040b5f03b43fmr3058809wmb.353.1702640849828; Fri, 15
 Dec 2023 03:47:29 -0800 (PST)
MIME-Version: 1.0
References: <20231214085424.16890-1-roger.pau@citrix.com>
In-Reply-To: <20231214085424.16890-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Fri, 15 Dec 2023 11:47:18 +0000
Message-ID: <CAG7k0EqHi2gTFY8rhuceVURTWv1TvHLuQgkvjtjoz=A7GWdiAQ@mail.gmail.com>
Subject: Re: [PATCH v2] livepatch-build-tools: allow livepatching version.c
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 8:54=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> Currently version.o is explicitly ignored as the file would change as a r=
esult
> of the orignal and the patched build having possibly different dates, tim=
es or
> changeset strings (by the patched build appending -dirty).
>
> Fix such difference by exporting the date and time from the build script,=
 so
> that both builds share the same build time.  The changeset string gets se=
t in
> .scmversion, and is cleaned on script exit if it wasn't present initially=
. This
> allows checking for changes in version.c, since the rest of fields need t=
o be
> manually changed in order to produce different output.
>
> Setting XEN_BUILD_{DATE,TIME} as an environment variable and .scmversion =
has
> been supported since before livepatch support was added to Xen, so it's s=
afe to
> export those variables unconditionally.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Also ensure consistent changeset version.
> ---
>  livepatch-build | 14 ++++++++++++++
>  livepatch-gcc   |  2 --
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/livepatch-build b/livepatch-build
> index e2ccce4f7fd7..332d26f5c6b6 100755
> --- a/livepatch-build
> +++ b/livepatch-build
> @@ -392,6 +392,10 @@ echo "Output directory: $outputarg"
>  echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D"
>  echo
>
> +cleanup_version() {
> +    rm -rf "${SRCDIR}/xen/.scmversion"
> +}
> +
>  if [ "${SKIP}" !=3D "build" ]; then
>      # Make sure output directory doesn't exist, and create it.
>      [ -e "$outputarg" ] && die "Output directory exists"
> @@ -417,6 +421,16 @@ if [ "${SKIP}" !=3D "build" ]; then
>
>      export CROSS_COMPILE=3D"${TOOLSDIR}/livepatch-gcc "
>
> +    # Force same date and time to prevent unwanted changes in version.c
> +    export XEN_BUILD_DATE=3D`LC_ALL=3DC date`
> +    export XEN_BUILD_TIME=3D`LC_ALL=3DC date +%T`
> +
> +    # Ensure uniform changeset between builds
> +    if [ ! -e "${SRCDIR}/xen/.scmversion" ]; then
> +        trap cleanup_version EXIT
> +        echo "unavailable" > "${SRCDIR}/xen/.scmversion"

Shouldn't this be "${SRCDIR}/.scmversion" since Xen runs
"$(srctree)/tools/scmversion $(XEN_ROOT)"?

Otherwise I still get spurious version.o changes...

With the 3 uses of that changed (can change during commit),

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

