Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263787429E2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556936.869864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtrI-0006nJ-KU; Thu, 29 Jun 2023 15:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556936.869864; Thu, 29 Jun 2023 15:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtrI-0006ki-Gl; Thu, 29 Jun 2023 15:47:00 +0000
Received: by outflank-mailman (input) for mailman id 556936;
 Thu, 29 Jun 2023 15:46:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEtrH-0006k3-DY
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:46:59 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e583e89-1694-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 17:46:58 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f8735ac3e3so1295276e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 08:46:58 -0700 (PDT)
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
X-Inumbo-ID: 2e583e89-1694-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688053618; x=1690645618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fzq6VRj5LfepL2ojzDdYju30gGf3FpiEsN7l64Dm3Hk=;
        b=ZSDnPD+UUKxnS9FC0lxId4Td+Pk6Id4jv2ooA0rcO0M/vNcU3frE/1oG4/ACM/CP0Q
         08PnhXydq0taL9sG9QD039vhg1zyB+BtnruIEgla6krc7/q6dGg9D3Rl8qj8PfT6H/Rc
         GU+8euyyim2Q+NkYHoWjduexh+aPnhCqTcU9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688053618; x=1690645618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fzq6VRj5LfepL2ojzDdYju30gGf3FpiEsN7l64Dm3Hk=;
        b=I1cZu8JgIH6DphNxn9BGFIbIXv65HepKpLoOFgIOU+4m829tJcAXycCR4Ec93jkjpE
         Pvp8nPq6Mc8D11eC5rdn4FsJXY15Gf8UvSlU3Nz1Wmm/zKMr7NiPCNhbCO+Mse8dch8l
         yYZavETAdzV4eV5cp6DeIy4zqpmJv+Q8Td1PmHlhBvslXw+LZlxrzWXCGJr6sGSNa8eq
         j2gKhi0RI86Z68rLOlx+kt0+6Yrbffvd5CoHLNkq8d7Nc9b0m5/1qltG74mdNG7eI3Ks
         XDkidzEAQyNGzKSpRdqsfv/9bEWEW3H7jKwUDR13fI5U0cOnDSFuEs+cbcfm6Y2y53a7
         nypw==
X-Gm-Message-State: ABy/qLaZEuzTNQsxgv2OwnU9KhjnfZMo0A8lW3C3OjtJ+3QyGG0dpboD
	ca3eiyvj6zt3gZRQ4jq4xrKj7u6RtrOldnBSDgtuSvvFXw9GKe0p
X-Google-Smtp-Source: APBJJlFeD1ALMd9yd7/2V/XMsKiDeQ2ATZOYFhcjkOTQbAlW1JrR+aZYior/S9iRdt61yXzlzSYK6Nui4ka8MHRm5xg=
X-Received: by 2002:a05:6512:3c81:b0:4fb:99d9:6ba2 with SMTP id
 h1-20020a0565123c8100b004fb99d96ba2mr350057lfv.24.1688053617758; Thu, 29 Jun
 2023 08:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com> <20230629121713.1211-3-alejandro.vallejo@cloud.com>
In-Reply-To: <20230629121713.1211-3-alejandro.vallejo@cloud.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Date: Thu, 29 Jun 2023 16:46:47 +0100
Message-ID: <CAFi36o05WXF-k9HPxdumx2Gh+FWxyH_vWn3Ljw3V8LamEw8TBQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] x86/boot: Clear XD_DISABLE from the early boot path
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000003fa7e005ff469cf2"

--0000000000003fa7e005ff469cf2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 1:17=E2=80=AFPM Alejandro Vallejo <
alejandro.vallejo@cloud.com> wrote:

> Intel CPUs have a bit in MSR_IA32_MISC_ENABLE that may prevent the NX bit
> from being advertised. Clear it unconditionally if we can't find the NX
> feature right away on boot.
>
> The conditions for the MSR being read on early boot are (in this order):
>
> * Long Mode is supported
> * NX isn't advertised
> * The vendor is Intel
>
> The order of checks has been chosen carefully so a virtualized Xen on a
> hypervisor that doesn't emulate that MSR (but supports NX) doesn't triple
> fault trying to access the non-existing MSR.
>
> With that done, we can remove the XD_DISABLE checks in the intel-specific
> init path (as they are already done in early assembly). Keep a printk to
> highlight the fact that NX was forcefully enabled.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v3:
>   * In head.S: s/has_nx/got_nx and s/nx_bit/nx
>   * Style changes in assembly instructions (spaces + width modifiers)
>   * Big comment in head.S replaced
>   * Jump directly to .Lno_nx if NX not found and XD_DISABLE not present
>   * Restored rdmsrl (previously refactored into rdmsr_safe() in v2) and
>     removed XD_DISABLE clearing in C (as it's now done in head.S).
>   * Moved printk in intel.c to highlight the XD_DISABLE override even whe=
n
>     done in head.S
> ---
>  xen/arch/x86/boot/head.S               | 49 ++++++++++++++++++++++----
>  xen/arch/x86/cpu/intel.c               | 16 ++++-----
>  xen/arch/x86/include/asm/msr-index.h   |  2 +-
>  xen/arch/x86/include/asm/x86-vendors.h |  6 ++--
>  4 files changed, 53 insertions(+), 20 deletions(-)
>

@mantainers

--0000000000003fa7e005ff469cf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jun 29, 2023 at 1:17=E2=80=AFPM A=
lejandro Vallejo &lt;<a href=3D"mailto:alejandro.vallejo@cloud.com" target=
=3D"_blank">alejandro.vallejo@cloud.com</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Intel CP=
Us have a bit in MSR_IA32_MISC_ENABLE that may prevent the NX bit<br>
from being advertised. Clear it unconditionally if we can&#39;t find the NX=
<br>
feature right away on boot.<br>
<br>
The conditions for the MSR being read on early boot are (in this order):<br=
>
<br>
* Long Mode is supported<br>
* NX isn&#39;t advertised<br>
* The vendor is Intel<br>
<br>
The order of checks has been chosen carefully so a virtualized Xen on a<br>
hypervisor that doesn&#39;t emulate that MSR (but supports NX) doesn&#39;t =
triple<br>
fault trying to access the non-existing MSR.<br>
<br>
With that done, we can remove the XD_DISABLE checks in the intel-specific<b=
r>
init path (as they are already done in early assembly). Keep a printk to<br=
>
highlight the fact that NX was forcefully enabled.<br>
<br>
Signed-off-by: Alejandro Vallejo &lt;<a href=3D"mailto:alejandro.vallejo@cl=
oud.com" target=3D"_blank">alejandro.vallejo@cloud.com</a>&gt;<br>
---<br>
v3:<br>
=C2=A0 * In head.S: s/has_nx/got_nx and s/nx_bit/nx<br>
=C2=A0 * Style changes in assembly instructions (spaces + width modifiers)<=
br>
=C2=A0 * Big comment in head.S replaced<br>
=C2=A0 * Jump directly to .Lno_nx if NX not found and XD_DISABLE not presen=
t<br>
=C2=A0 * Restored rdmsrl (previously refactored into rdmsr_safe() in v2) an=
d<br>
=C2=A0 =C2=A0 removed XD_DISABLE clearing in C (as it&#39;s now done in hea=
d.S).<br>
=C2=A0 * Moved printk in intel.c to highlight the XD_DISABLE override even =
when<br>
=C2=A0 =C2=A0 done in head.S<br>
---<br>
=C2=A0xen/arch/x86/boot/head.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 49 ++++++++++++++++++++++----<br>
=C2=A0xen/arch/x86/cpu/intel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 16 ++++-----<br>
=C2=A0xen/arch/x86/include/asm/msr-index.h=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0xen/arch/x86/include/asm/x86-vendors.h |=C2=A0 6 ++--<br>
=C2=A04 files changed, 53 insertions(+), 20 deletions(-)<br></blockquote><d=
iv>=C2=A0</div><div>@mantainers</div></div></div>

--0000000000003fa7e005ff469cf2--

