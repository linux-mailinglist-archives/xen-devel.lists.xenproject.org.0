Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EC48C4E65
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721284.1124585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6o9V-0005wU-W0; Tue, 14 May 2024 09:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721284.1124585; Tue, 14 May 2024 09:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6o9V-0005u6-TE; Tue, 14 May 2024 09:08:53 +0000
Received: by outflank-mailman (input) for mailman id 721284;
 Tue, 14 May 2024 09:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y506=MR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s6o9U-0005u0-Bz
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:08:52 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9420cc0a-11d1-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 11:08:50 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59b178b75bso1043188866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:08:50 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574eb2459f0sm114109a12.93.2024.05.14.02.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 02:08:49 -0700 (PDT)
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
X-Inumbo-ID: 9420cc0a-11d1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715677730; x=1716282530; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/jmm0MhYebwHSh3avmuIVn24ItpVT9wlYrJnqbFthcM=;
        b=Pah5NSz2G4e/0HeWQEMG+ZpD9xw3MlRpu1ZSDva18QYOSvfQ8zrn3SsbDXjLQ4wSNq
         F4oINGLfAjgJAlRhnYL0tSgHhHdom/ON3zRkiQzQRR6E54oWJ2joranuG7RdiZDBTfJK
         4QgUbsAiOVyM7PjRsTsQRz7zoc7OG2bQ13oh4RW6wsUxbc4rv5CUCwp/JCnRgtbp7LlK
         7bapSs8JrvuGVkIkwSr6MRiuCE/Atm3zqXRIZMeEuEM42AnlhU6SlpFaTwgdut7sKIXA
         InH9gkRSpygQfXdng0V4ImYqOIwCy+ebbTuVJ6ZiAMnWKI4aPUN5iwCG9Eg2XjNilDmI
         j0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715677730; x=1716282530;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/jmm0MhYebwHSh3avmuIVn24ItpVT9wlYrJnqbFthcM=;
        b=MZEPHARWSiJhlMFHd61FhCUKawIO7Y4tW6BEW3QyzDhlXjCsJ8s+vSxUX+eS2bQjfN
         gwRCWc0TAkmq1fYwRit1Qk6AvE0T/IDOUosBBdUFCIv8dM0p6g/naPBrqKMjtCTYUXW7
         XEDmAP20KCzjS+T4bOcz2fZMojPdLzgP89Pe4+9vcSox4qIxiHohK5RpQA6iM6eh8K3E
         QIB92ik7/8mnb83Hu+Tn38rtycq9o+8WM/lhvNeb3g8ZsIGNNthD4UM2DHdjbGBXUzuf
         DqPst0UeZYDVpYRBZORLYB5eCsHYt6baChdD1CBqyvFMvnczG5E0HqDZLlX04cb8XHJU
         VSFg==
X-Forwarded-Encrypted: i=1; AJvYcCVIkFg0rZOr+jsrMXsDMClEdeVjDGDVPBP5UVT1SvZzOQH463M+bbnYY+TWhpdT2o5+2HcboLMlaFrWf63cMYxQfh9wcKbZM89fEmJmU5g=
X-Gm-Message-State: AOJu0YzJsS8qENXAS2nnmK0xdNAkpUD8BecWjR+eaM7XA5bwlyLi8P/6
	mPxa83owRN4/FfDn+XUPesn99cZkJh1rh3XhsRlqoGF1V3dT/RCn40bsRdBr
X-Google-Smtp-Source: AGHT+IFZ1xitOmkJOKnQqy+eGTL4E3GWC7HVhpsw5f7Q8NqNSUwybdAKLOTvtyjPFcmAAefXtJMpew==
X-Received: by 2002:aa7:d1d3:0:b0:574:eb26:74a with SMTP id 4fb4d7f45d1cf-574eb260839mr258819a12.21.1715677729799;
        Tue, 14 May 2024 02:08:49 -0700 (PDT)
Message-ID: <c3cea2b9118392c7b4ddddd750dd97ac96e8ec7c.camel@gmail.com>
Subject: Re: [PATCH for-4.19] libxl: fix population of the online vCPU
 bitmap for PVH
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross
 <jgross@suse.com>,  Arthur Borsboom <arthurborsboom@gmail.com>, Leigh Brown
 <leigh@solinno.co.uk>
Date: Tue, 14 May 2024 11:08:48 +0200
In-Reply-To: <df58677c-d9a3-43a7-b5b4-85565ad73b12@citrix.com>
References: <20240510124913.49945-1-roger.pau@citrix.com>
	 <df58677c-d9a3-43a7-b5b4-85565ad73b12@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Fri, 2024-05-10 at 16:20 +0100, Andrew Cooper wrote:
> On 10/05/2024 1:49 pm, Roger Pau Monne wrote:
> > libxl passes some information to libacpi to create the ACPI table
> > for a PVH
> > guest, and among that information it's a bitmap of which vCPUs are
> > online
> > which can be less than the maximum number of vCPUs assigned to the
> > domain.
> >=20
> > While the population of the bitmap is done correctly for HVM based
> > on the
> > number of online vCPUs, for PVH the population of the bitmap is
> > done based on
> > the number of maximum vCPUs allowed.=C2=A0 This leads to all local APIC
> > entries in
> > the MADT being set as enabled, which contradicts the data in
> > xenstore if vCPUs
> > is different than maximum vCPUs.
> >=20
> > Fix by copying the internal libxl bitmap that's populated based on
> > the vCPUs
> > parameter.
> >=20
> > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > Link: https://gitlab.com/libvirt/libvirt/-/issues/399
> > Reported-by: Leigh Brown <leigh@solinno.co.uk>
> > Fixes: 14c0d328da2b ('libxl/acpi: Build ACPI tables for HVMlite
> > guests')
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > ---
> > Note that the setup of hvm_info_table could be shared between PVH
> > and HVM, as
> > the fields are very limited, see hvm_build_set_params() for the HVM
> > side.
> > However this late in the release it's safer to just adjust the PVH
> > path.
> >=20
> > Also note the checksum is not provided when hvm_info_table is built
> > for PVH.
> > This is fine so far because such checksum is only consumed by
> > hvmloader and not
> > libacpi itself.
> >=20
> > It's a bugfix, so should be considered for 4.19.
>=20
> Bugfixes are still completely fair game at this point.
Considering that this is bugfixes I will be happy to have that in 4.19
release:
 Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


