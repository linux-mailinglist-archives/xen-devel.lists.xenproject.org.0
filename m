Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B504802EC6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646665.1009154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5NK-0007H6-QJ; Mon, 04 Dec 2023 09:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646665.1009154; Mon, 04 Dec 2023 09:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5NK-0007FI-NY; Mon, 04 Dec 2023 09:36:26 +0000
Received: by outflank-mailman (input) for mailman id 646665;
 Mon, 04 Dec 2023 09:36:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlsO=HP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rA5NJ-0007E0-Fj
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:36:25 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 973438b6-9288-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 10:36:24 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c9ef682264so21311751fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 01:36:24 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a2eb888000000b002ca0a5dc73csm126553ljp.9.2023.12.04.01.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:36:23 -0800 (PST)
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
X-Inumbo-ID: 973438b6-9288-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701682584; x=1702287384; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ad7pck1T9sE2nfwaXcbJmSqne45ZquNKOpGjXndxcOQ=;
        b=ZIscmDR6mjKjzkhGcVFGkl3frJmEA2tAToKtFSbquDrIbIu2wFeG2BSSaq7W/SiFcb
         t8KZWDrO/FGpRFcV0NleL2gyNao0HW/q+jo42Vf3ryN47lj1ZqNZNCSLusVFEeJZU9Ew
         PAawVRG/ShEp4rtveOVR8tmzuXaGmHQ7Oae/PdnH3PsFCybgqpVu4oYlshQuzNFMvHNe
         YHeLdt4V5UMdVtLyL2HToRBOA7x8OmL7z4U9ILkuBq0G0BequAfh2VMJ9tSnjczPEAa+
         2ly6YN0lIvkDh0h5c21YhC4gb1dYv5mE4sNacllVx6SHSPgrUL5URpBM0rYUhmW6ioyQ
         kbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682584; x=1702287384;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ad7pck1T9sE2nfwaXcbJmSqne45ZquNKOpGjXndxcOQ=;
        b=w/xJahqnkvXsH+DD79ITqYZMm76vvdjJDBLgA7/SQOZyOvGkxf1eqmT1UQrrAej4Wr
         cqk8vvcM28kBcDcDKnsWpzCl7o9c1P/lml4NAcsTSAYqzQodFwYCopZWsbrGDKj5c/SG
         5snucY10+ez4EuJ0ccZQquk6GVtQIwm9PEn35T8WmMK0qGeW9H8ZMwr4o/KEQAtYBMzZ
         lhMftfIaVRQZUsP04gWd0lD05lKKf5G2TOTAxhs/Zsx1vf1PKXMjT3IClMCdeIMWAY4G
         eOFbBUeM/MIxW/YAl71bBXAqTCKWGEgPVlO3lE52Mq6QXdMAyCbOXC4e3Y+SDxPloVuL
         lN2A==
X-Gm-Message-State: AOJu0YxGFhDtsuHnDwiBVFiHs9KwQdif0wbYm1VZzYKU6O8dtJJsWIxc
	Dm+1pVU8lVdIkNdbH/It0Z0=
X-Google-Smtp-Source: AGHT+IHcb0H7xWlkiggJCqwhGlxgcfpERsmILcoEjbPpsv2ns23RpgB3XeG5lS4AjpGHDn/dr5jXcw==
X-Received: by 2002:a2e:9803:0:b0:2ca:c96:f4b with SMTP id a3-20020a2e9803000000b002ca0c960f4bmr179851ljj.51.1701682583828;
        Mon, 04 Dec 2023 01:36:23 -0800 (PST)
Message-ID: <e995e0394b4f638c421603ae01590543316f8456.camel@gmail.com>
Subject: Re: [PATCH v5 6/7] xen/asm-generic: ifdef inclusion of
 <asm/mem_access.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Tamas K
 Lengyel <tamas@tklengyel.com>,  Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Date: Mon, 04 Dec 2023 11:36:22 +0200
In-Reply-To: <14d0c19e-2a40-4669-aaf5-ad1bfc8b77fc@suse.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
	 <d42a34866edc70a12736b5c6976aa1b44b4ebd8a.1701453087.git.oleksii.kurochko@gmail.com>
	 <14d0c19e-2a40-4669-aaf5-ad1bfc8b77fc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-04 at 09:46 +0100, Jan Beulich wrote:
> On 01.12.2023 21:48, Oleksii Kurochko wrote:
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -87,7 +87,7 @@ config MEM_ACCESS_ALWAYS_ON
> > =C2=A0config MEM_ACCESS
> > =C2=A0	def_bool MEM_ACCESS_ALWAYS_ON
> > =C2=A0	prompt "Memory Access and VM events" if
> > !MEM_ACCESS_ALWAYS_ON
> > -	depends on HVM
> > +	depends on HVM && (ARM || X86)
>=20
> While - unlike for GRANT_TABLE - I view going this route as an
> option, I
> still think it wants doing without explicitly naming architectures
> here.
> There wants to be a HAS_MEM_ACCESS, selected by Arm's Kconfig and by
> MEM_ACCESS_ALWAYS_ON (which in turn x86 selects). This could then
> also
> replace the HVM dependency here - x86 ought to select
> MEM_ACCESS_ALWAYS_ON
> only when HVM is enabled.
Thanks.

It will be definetely better to introduce HAS_MEM_ACCESS.


~ Oleksii

