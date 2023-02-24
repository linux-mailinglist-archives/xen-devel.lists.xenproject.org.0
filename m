Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CC36A1FF2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501301.772989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbCk-0000Rh-3K; Fri, 24 Feb 2023 16:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501301.772989; Fri, 24 Feb 2023 16:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbCk-0000Ps-0U; Fri, 24 Feb 2023 16:45:54 +0000
Received: by outflank-mailman (input) for mailman id 501301;
 Fri, 24 Feb 2023 16:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVbCj-0000Pm-Cy
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:45:53 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b348ebdc-b462-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 17:45:52 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id e9so14752399ljn.9
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 08:45:52 -0800 (PST)
Received: from [192.168.8.199] (46.204.108.92.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.92]) by smtp.gmail.com with ESMTPSA id
 p12-20020a2eb98c000000b00295a8c68585sm164521ljp.56.2023.02.24.08.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:45:51 -0800 (PST)
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
X-Inumbo-ID: b348ebdc-b462-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ROOQhNVqMUAZjCPKo1j893EG5DhF3n7MP2Vc/cEbqM=;
        b=ObREOdVIkTL7+BZruWwXUhb5iSYubU0L5FZGdOWSb9MZ7bTnGOweGmo5BEnWoKQLMS
         fHMmxw4Q7yIyoscNuRUK0g3QeHNRXpPXPuiQDN3c7mc2qFzyXrS1eSwxn4pM+w8Ny5PF
         Vr5AuAFPvqi2NNVCJ8f9Ig4HGvl+QUy6q1Gy5r1VjuLYTpqYhPHi+bauCuV6MRU3xlg6
         /ZxtzFv/BXMllo2FVqq1PMzScPlSmczHC0i5kiiUJ1rvuGm/OeEdVmiteOMvpATIhdC5
         wQ7RxYkD/WJh8Fzt5wC0ax/e1aDMPW8AqbIKmaQSMo3mNBBzvzHsaYHudDKPl96aOPnJ
         EARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ROOQhNVqMUAZjCPKo1j893EG5DhF3n7MP2Vc/cEbqM=;
        b=LppnWg+E9BXYCAFnQ0JEEv19ixZMY5OyVSe+Aq9irYnG5vy9agJnG+fEdEMesUIQ2Q
         Hnn7h6TP+cH8GdEwEtuYJoY2az1QQ8h+ZO5/ulkLcXjee78desAIuTKrabhTAwlKE7Pi
         oCHHfYXKcPpeTm1fc50d2dk85lexkeulaAuHK0A1VeHu8djg7daVMDqQc+5Dk8p+vqOg
         mb8BlKKR7EmSFVn3FPQpK1qZhDiXC6IT9egvszoiz3IB7+k1149dOmuLWqKKSvZ/jKMG
         umtCOOYzshOeA13a3DQla+MoF6deF42um8ssElsW9W+gPx5wbYNYUThxvh3wpXgoYW0S
         YLOA==
X-Gm-Message-State: AO0yUKVoJbmjouG5dziE+VHzS58//NIDTXGiQIlk0UMPc8dxQuubsA+k
	JkguBRohFYegUe+BqLZg3ik=
X-Google-Smtp-Source: AK7set+KZcYir25Il4lRADq69l+LCW/DoYQjlmKpiReKiVkXg9/RvhI1Gw5P/BP5X60nx7qrB6oCaw==
X-Received: by 2002:a05:651c:4d1:b0:290:4dd3:c177 with SMTP id e17-20020a05651c04d100b002904dd3c177mr7573990lji.32.1677257152256;
        Fri, 24 Feb 2023 08:45:52 -0800 (PST)
Message-ID: <446e180b380251ec2c2e0778b73cf2c06739fe21.camel@gmail.com>
Subject: Re: [PATCH v1 3/3] automation: update RISC-V smoke test
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Date: Fri, 24 Feb 2023 18:45:50 +0200
In-Reply-To: <88839882-29bc-0de1-ae6f-f47dc1ee3aee@citrix.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
	 <38ddf88eabd9cc36c332d6a27c6ee1242d33df19.1677250203.git.oleksii.kurochko@gmail.com>
	 <88839882-29bc-0de1-ae6f-f47dc1ee3aee@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-02-24 at 15:27 +0000, Andrew Cooper wrote:
> On 24/02/2023 3:06 pm, Oleksii Kurochko wrote:
> > The smoke test was updated to verify that MMU has been enabled.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0automation/scripts/qemu-smoke-riscv64.sh | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/automation/scripts/qemu-smoke-riscv64.sh
> > b/automation/scripts/qemu-smoke-riscv64.sh
> > index 02fc66be03..01cd08e407 100755
> > --- a/automation/scripts/qemu-smoke-riscv64.sh
> > +++ b/automation/scripts/qemu-smoke-riscv64.sh
> > @@ -16,5 +16,5 @@ qemu-system-riscv64 \
> > =C2=A0=C2=A0=C2=A0=C2=A0 |& tee smoke.serial
> > =C2=A0
> > =C2=A0set -e
> > -(grep -q "WARN is most likely working" smoke.serial) || exit 1
> > +(grep -q "MMU has been enabled" smoke.serial) || exit 1
> > =C2=A0exit 0
>=20
> There's a more simple way than this.=C2=A0 I'll do a patch.
Definitely your way is more simple. Thanks.
>=20
> ~Andrew
~ Oleksii

