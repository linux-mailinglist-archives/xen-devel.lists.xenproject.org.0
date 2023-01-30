Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6D680BB6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 12:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486901.754310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMS8J-0003yf-IP; Mon, 30 Jan 2023 11:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486901.754310; Mon, 30 Jan 2023 11:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMS8J-0003w9-Fk; Mon, 30 Jan 2023 11:15:31 +0000
Received: by outflank-mailman (input) for mailman id 486901;
 Mon, 30 Jan 2023 11:15:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdfF=53=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMS8I-0003w3-9N
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 11:15:30 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67590b2f-a08f-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 12:15:29 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id ud5so30684642ejc.4
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 03:15:29 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 o2-20020a1709064f8200b0088a2aebb146sm617053eju.52.2023.01.30.03.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 03:15:28 -0800 (PST)
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
X-Inumbo-ID: 67590b2f-a08f-11ed-9ec0-891035b88211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/3Hfj4m87BNkMW8vXogmnIwV9g+t8c7XPYJqmmu3bsI=;
        b=l/kL/FWhmF6LpHkn6+dPmMUefkxko7NZz8kU0evFVYF3dBaxuktPtXjb9hCXI9KIFp
         A/QR7AjSmDr2nfMU9DRLZ7Rst18BKGZmxvjaldS9RxMOjRhsAC2z9t7bN4lz0Q7r1Qst
         WhiK/jxPkFEUfLpR8bK3PN74lRShGu7tW3Qlj5+HO1dH6sgGLZaR0rOSlw48yOGWv3w5
         ayiHbiAIiShlKbMg48U14zakHmMm8+Zdoi2ym8sb7o19hoQxMIgoRzZqqpvo6igNRBne
         fTgMOucrCVIvq5PzYNx6q/hh68bVVoIqoXHscSp3ERhYYg1HMhfvyPlIHkfOH/dFF2/+
         vstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3Hfj4m87BNkMW8vXogmnIwV9g+t8c7XPYJqmmu3bsI=;
        b=bveKyVRHc0GNYFfdL31YwHvSuM6Pl6nSQEn5iMExh7RVMvYMOWobtqDJ6I0hiIQwR0
         Rw7p/v6DrNVhVCzrSrOrrMkxONQwjQxQpcmVkw4FDaH7QCr/zHE2TQY1sTjMN4+LIyjC
         GSMpAOtL2fpJRtkEl/eN83AtMNfG9waDLOiBqMHhGdfAk5GZuUdi3my2J3O6mNeQ3TYc
         j5kRO+7p5vhm2U53AKbVpA6Qx12yIKcgL5LZdykIpR5HiHgErvvc9rpkW21RyWu6YTZC
         DKWp6mUsJLslaSAXwIRHGeZVuSEmZX64Z7S6/pXCf1oT8WpD381to8S73wU14jde7y0J
         4bPw==
X-Gm-Message-State: AO0yUKVeeMHG4b1zpMjbDFXcqJ0CSPyWsAHTRIlXMvPkSVdt9PjTUEto
	k+yyIcmaGyPUqV40bNNidEg=
X-Google-Smtp-Source: AK7set+lPe9bSWIsJRPDXQhAdFO2UG3p7I5TZAnTd+AMWGffuw7Lj6SQli5lrE47Jr9+ci2Ote2JVg==
X-Received: by 2002:a17:906:fc16:b0:878:81d9:63ea with SMTP id ov22-20020a170906fc1600b0087881d963eamr15943092ejb.52.1675077328900;
        Mon, 30 Jan 2023 03:15:28 -0800 (PST)
Message-ID: <2a09c8648c6ed388997ab07aa6fcf78db6ba4b16.camel@gmail.com>
Subject: Re: [PATCH v2 14/14] automation: add smoke test to verify macros
 from bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Doug
 Goldstein <cardoe@cardoe.com>
Date: Mon, 30 Jan 2023 13:15:27 +0200
In-Reply-To: <fe470f53-5cf5-138b-40e7-83c111ce225a@amd.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
	 <ed819dc612fcadbd04b4b44b2c0560a77796793a.1674818705.git.oleksii.kurochko@gmail.com>
	 <fe470f53-5cf5-138b-40e7-83c111ce225a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-27 at 15:43 +0100, Michal Orzel wrote:
> Hi Oleksii,
>=20
> On 27/01/2023 14:59, Oleksii Kurochko wrote:
> >=20
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > =C2=A0- Leave only the latest "grep ..."
> > ---
> > =C2=A0automation/scripts/qemu-smoke-riscv64.sh | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/automation/scripts/qemu-smoke-riscv64.sh
> > b/automation/scripts/qemu-smoke-riscv64.sh
> > index e0f06360bc..02fc66be03 100755
> > --- a/automation/scripts/qemu-smoke-riscv64.sh
> > +++ b/automation/scripts/qemu-smoke-riscv64.sh
> > @@ -16,5 +16,5 @@ qemu-system-riscv64 \
> > =C2=A0=C2=A0=C2=A0=C2=A0 |& tee smoke.serial
> >=20
> > =C2=A0set -e
> > -(grep -q "Hello from C env" smoke.serial) || exit 1
> > +(grep -q "WARN is most likely working" smoke.serial) || exit 1
> I think the commit msg is a bit misleading and should be changed.
> FWICS, you are not *adding* any smoke test but instead modifying
> the grep pattern to reflect the usage of WARN.
>=20
It's incorrect so it will be changed in the new version of the patch
series.

Thanks.
> > =C2=A0exit 0
> > --
> > 2.39.0
> >=20
> >=20
>=20
> ~Michal


