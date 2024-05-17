Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244338C8788
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724176.1129346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y2a-0001HP-Ue; Fri, 17 May 2024 13:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724176.1129346; Fri, 17 May 2024 13:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y2a-0001Ep-Qi; Fri, 17 May 2024 13:54:32 +0000
Received: by outflank-mailman (input) for mailman id 724176;
 Fri, 17 May 2024 13:54:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q70L=MU=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1s7y2Y-0001EP-SX
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:54:30 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faae33da-1454-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 15:54:28 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so4857876a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:54:28 -0700 (PDT)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574ec5fb906sm4685160a12.30.2024.05.17.06.54.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2024 06:54:27 -0700 (PDT)
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
X-Inumbo-ID: faae33da-1454-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715954068; x=1716558868; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcCSs9okMCivkQhbeDBuMiXnfaxUqNGd4oaWoP83P/s=;
        b=LEBU8OH//kLsEzUZxCUo7Mo84S+1FobqxNn0QZj/U7G4w4kVvrVDST4xm/4rONcbI7
         TrydM5T0Z9GXeOtBMowaapWHgNbcGXLmQpc5BH5y9x5nXrpr9Q6gZQYiI4Kv2FwwSf4i
         uBCEbJlEL97oCZACVN4G2QNOS0iuZyLvKOF2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954068; x=1716558868;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcCSs9okMCivkQhbeDBuMiXnfaxUqNGd4oaWoP83P/s=;
        b=kLG4ahYJBr0AmVJEqbhwuJrM05xV4vvaOJY+Ix+695my9SdZhO2WIBbc2oRtFFyLCs
         YSPaZIZ2jLs3XYurUPndNvYvwm5xKNVL7qYMVVnAkihTxULz/JX9RebEVKY6h+QdS458
         /Z9hH/H2N+Zc+0b8KF0lG23fLYbZ1sp6S/PmqBsamTuqCOUaoGQPSlDSHmtxIgYN4+XO
         aMVyLAM9qm7/sGHGtbKM2RDkhAzgNHeTxMV4VM+BQOOHt9eX/wQBL4ckgFrsDvHDIvpy
         gN2GEn2mPtMB/7lsJrlyRnil4rWvux9Sd1NO0jiarAU66gkSBXDc4aFHNrzGv99eEiKt
         0/Eg==
X-Gm-Message-State: AOJu0YwPdAZfvPzP1a25vSU/bvEAa9tJW2cQbB6467ijlQZbDJX4N+pH
	yZXYrJpU2noWMMRrgZ5nAW3ZFPyIs0D1ryDopThzvnR4kq21Bo4njtj/GIcr7t4=
X-Google-Smtp-Source: AGHT+IHZY3wVRm39WlAI58oALla5n2J4PtGPIFbCfbjpZIZe28HeAoJV81ZYbhIe/gHxpomDPdNbPA==
X-Received: by 2002:a05:6402:40cd:b0:574:c473:294b with SMTP id 4fb4d7f45d1cf-574c47329camr12429489a12.4.1715954068378;
        Fri, 17 May 2024 06:54:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH for-4.19 v3 2/3] xen: enable altp2m at create domain
 domctl
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20240517133352.94347-3-roger.pau@citrix.com>
Date: Fri, 17 May 2024 14:54:16 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB1A21D1-3557-4A9D-898C-FF8238ADCB11@cloud.com>
References: <20240517133352.94347-1-roger.pau@citrix.com>
 <20240517133352.94347-3-roger.pau@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On 17 May 2024, at 14:33, Roger Pau Monne <roger.pau@citrix.com> =
wrote:
>=20
> Enabling it using an HVM param is fragile, and complicates the logic =
when
> deciding whether options that interact with altp2m can also be =
enabled.
>=20
> Leave the HVM param value for consumption by the guest, but prevent it =
from
> being set.  Enabling is now done using and additional altp2m specific =
field in
> xen_domctl_createdomain.
>=20
> Note that albeit only currently implemented in x86, altp2m could be =
implemented
> in other architectures, hence why the field is added to =
xen_domctl_createdomain
> instead of xen_arch_domainconfig.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v2:
> - Introduce a new altp2m field in xen_domctl_createdomain.
>=20
> Changes since v1:
> - New in this version.
> ---
> tools/libs/light/libxl_create.c     | 23 ++++++++++++++++++++++-
> tools/libs/light/libxl_x86.c        | 26 ++++++++++++--------------
> tools/ocaml/libs/xc/xenctrl_stubs.c |  2 +-
> xen/arch/arm/domain.c               |  6 ++++++
> xen/arch/x86/domain.c               | 22 ++++++++++++++++++++++
> xen/arch/x86/hvm/hvm.c              | 23 ++++++++++++++++++++++-
> xen/include/public/domctl.h         | 20 +++++++++++++++++++-
> xen/include/public/hvm/params.h     |  9 ++-------
> 8 files changed, 106 insertions(+), 25 deletions(-)

>=20
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c =
b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index 2b6d3c09dfa0..c6da9bb09137 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -257,7 +257,7 @@ CAMLprim value stub_xc_domain_create(value =
xch_val, value wanted_domid, value co
> #if defined(__i386__) || defined(__x86_64__)
>=20
> /* Quick & dirty check for ABI changes. */
> - BUILD_BUG_ON(sizeof(cfg) !=3D 64);
> + BUILD_BUG_ON(sizeof(cfg) !=3D 68);
>=20

Acked-by: Christian Lindig <christian.lindig@cloud.com>



