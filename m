Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93708939100
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 16:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762095.1172199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuOE-0005d7-Ss; Mon, 22 Jul 2024 14:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762095.1172199; Mon, 22 Jul 2024 14:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuOE-0005bc-Oq; Mon, 22 Jul 2024 14:51:50 +0000
Received: by outflank-mailman (input) for mailman id 762095;
 Mon, 22 Jul 2024 14:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urmM=OW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sVuOD-0005bS-0p
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 14:51:49 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebdd3a9b-4839-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 16:51:48 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52efbb55d24so2827562e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 07:51:48 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52efa2820d2sm965959e87.257.2024.07.22.07.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 07:51:46 -0700 (PDT)
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
X-Inumbo-ID: ebdd3a9b-4839-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721659907; x=1722264707; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=66Z4ANDo8hy/oRTaWYIScX14jYV39ia2y0ZjHKAum2Q=;
        b=ELx/5FXsTISt9oOng0SwpBdK84zTXltFdY/ny+B4+xTWzS2QWI3nF/HEc3o+0301WS
         jgsSE57wP43Hn71twkD8a6CNpV4pPUeU5E+HyRxsmORPaWl5j73Qynr3wFtODjegU2ra
         kha0SzZ9UUrBSEAyN2MRRLKeQnksxIgwEETlDc7CWGHRGAXD8BuoSf18/DCCGOcJhZPg
         hxbw6aUNkPV2Vl3r/RW6oI76cGVjzw1Ylk7voo0YhnXkTfySNSn+1iu54Bw4HEchnd5/
         dxoO6zQLVBrdEq285+aLGp99IIzadA6IxbddgYwWd5tbTlzDVQ/nLe6hGDkGFKV2YOIf
         IMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721659907; x=1722264707;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66Z4ANDo8hy/oRTaWYIScX14jYV39ia2y0ZjHKAum2Q=;
        b=aA/svTzBOBfyB7U+UP2Q9QSghF51GOLitI1q2WbqqEm+GvcQVD6dRRbmBeMWE8zJIp
         THz/WZDLuWEm8ljC/lccN9aQbdkitEuoks/192OIHp8DgQ1eWTgVNnfSfLVu1lhqmRCm
         RiDN1ank9VZKSBk9VIHLemcbcR3kf0wEZatFmgo5feR6XsPPrq/qZHT64x7e5romrF4V
         swx64JE0D7v8+IVoYfDRntjtFShV52ZK/C5iPekr78TSqG0XAPz+S6IOl6pzcdCR/dTq
         k2qe50yKcFdWagF+pmATDTFU44FBX5DEXVLMx79hSDp766duk+KbZWWrtEacGpUVICvs
         u2PA==
X-Forwarded-Encrypted: i=1; AJvYcCVUto9pYcpOoRxDLaXNn40cAHB6Bq1bI2njC8ChSUvsXboYjfLvdwgBrrG5HCGqf2s+QUL6gcLe0YNJ6TthDcZnaSZoKhglgCna0b5fQtM=
X-Gm-Message-State: AOJu0YwpiEuHp0QR5EqcXKYNHCenfPcd7Qdyyb3PgZYDSKQXkO2o9ReV
	HS1flMZIYrvIMe+qeVlqFrXGsJb+JDWpvf1z16f5V2wJ7dBzKDzE
X-Google-Smtp-Source: AGHT+IGUekzzNtufdWQizWUNhm/sbPmM0+IbmQEDkwK9BjKp8g/lCh/EuaPyNdqOX/q6vFJzxQAAfg==
X-Received: by 2002:a05:6512:3d1a:b0:52c:c9e4:3291 with SMTP id 2adb3069b0e04-52efb82570cmr4977215e87.60.1721659907052;
        Mon, 22 Jul 2024 07:51:47 -0700 (PDT)
Message-ID: <a0e77fa86e25a3947348e5778b4a23236b28c8f3.camel@gmail.com>
Subject: Re: [PATCH v2 6/8] xen/riscv: introduce generic Xen page table
 handling
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Mon, 22 Jul 2024 16:51:46 +0200
In-Reply-To: <5187f606-0a1c-4812-8f8c-13301f0aba8c@xen.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <f2d7f538edb7db8990bf26b791df9da3d390bf05.1720799926.git.oleksii.kurochko@gmail.com>
	 <5187f606-0a1c-4812-8f8c-13301f0aba8c@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi Julien,

On Sun, 2024-07-21 at 10:02 +0100, Julien Grall wrote:
> Hi,
>=20
> On 12/07/2024 17:22, Oleksii Kurochko wrote:
> > At least, between Arm and RISC-V most of the code related to Xen
> > page
> > table handling are common.
> >=20
> > This GENERIC_PT code is based on Arm's arm/mmu/pt.c except some
> > minor
> > changes such as introduction of the following functions:
> > =C2=A0=C2=A0 * get_root_page()
> > =C2=A0=C2=A0 * xen_pt_check_contig()
> > =C2=A0=C2=A0 * set_pte_table_bit()
> > =C2=A0=C2=A0 * sanity_arch_specific_pte_checks()
> > =C2=A0=C2=A0 * get_contig_bit()
> > =C2=A0=C2=A0 * set_pte_permissions()
> > =C2=A0=C2=A0 * flush_xen_tlb_range_va()
> > It was done because not every functions has the generic pte_flags
> > and
> > it could be a different positions of the PTE bits in a PTE.
> While I am always in favor of trying to avoid code duplication, I am
> not=20
> sure the page-tables are one that should be.
Probably it wasn't the best one abstraction provided. But I think that
there are still some function which could be generic:
- xen_{un}map_table()
- map_pages_to_xen
- probably some page table walking?

But I am okay, if not to abstract that, I just wanted to here an
opinion if it is a sense to work in this direction or not.

I will then move everything to RISC-V specific folder and clean up some
places related to Arm.

~ Oleksii

>=20
> For instance, you don't have the concept of contiguous page in RISC-V
> (I=20
> see you introduce dummy flags, but IMHO this is a bit of a hack). All
> the code was also written in a way to avoid temporary conflict
> mappings.=20
> This is to avoid using Break-Before-Make. But on newer hardware this=20
> could be relaxed.
>=20
> I am interested to know what the others thinks.
>=20
> Cheers,
>=20


