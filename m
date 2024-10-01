Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A798B85A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 11:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807884.1219590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZCj-0000Un-2U; Tue, 01 Oct 2024 09:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807884.1219590; Tue, 01 Oct 2024 09:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZCi-0000Re-W5; Tue, 01 Oct 2024 09:30:00 +0000
Received: by outflank-mailman (input) for mailman id 807884;
 Tue, 01 Oct 2024 09:29:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Um4/=Q5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svZCh-0000RY-Ft
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 09:29:59 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9599d6a-7fd7-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 11:29:57 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53992157528so2467772e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 02:29:57 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a043be2dsm1505299e87.236.2024.10.01.02.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 02:29:56 -0700 (PDT)
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
X-Inumbo-ID: b9599d6a-7fd7-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727774997; x=1728379797; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0/0V3xg4BG1KgG+Byd/FPTkPwQH3pdxZB7W62BGif+I=;
        b=cADZ9TWCX/oaJHeoI2z4RLmQY5NGq0mtZ/pzCUSqWz50T9mUAfGPpeL87hEcnu4nDw
         w6qxf5bsIhGuaqvpdj68VE+6KrcOcu1xuUqwh03tobqw+NiXsKooUsq+YaeuYp3/Aiwr
         eNy/UrLYeGAcwvkqoMV1Gz1cHgj4kWJaiUe+jWnXH3aUmQsP8um17eBLoyZ9tqusem/k
         fsRN6nj4wWsx40boiCM4D3OhZSPFVTnAI3tPlfTqlrD00B8dk9l1xG+yKEn6mZiO9hG7
         EVl9Q6vbhU55Oaw3od5Jk1w0l49/PQJqPKMbOwy5Br61gFYOBriIP1C2JpMsy19eWuZ+
         VUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727774997; x=1728379797;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/0V3xg4BG1KgG+Byd/FPTkPwQH3pdxZB7W62BGif+I=;
        b=NNUff4jXy4LXFejmFCRd4r4C7gxoMpQniwCE9RM8MJhZpmJvzKEwuVmCykQa3HL7m9
         gqy1x/cqaONASVOzsUq0SCxk5cjTxKVwmRZMWwtw8scO237qUUctFZ7DuLAQPwtfDko3
         eEJRuAsAMojaScS9fn3oZantOgVRHZ3EK5WKkwDYZtuJnVjvSTd5R4bw6ZvxuGyiR7Yt
         MnClODNp/qSiojWRWP1FiB67M4Xp/ExteyQ6egHdmdtP6FlHDa+nXHvJXoItFI/28EBo
         r/xHSHkbM52YDr9q8TvATt56QzlwK2b9q+MDdxiPWlmXzNAZVofObHd33xWcBS77O0BN
         P6ew==
X-Forwarded-Encrypted: i=1; AJvYcCX5atfd7o820nuuUWK76Z+EjNwdVUpawenlz/CvJLcDCTlPe8pXDmrGPnlYTgh8OEEU6qP+DCC0SaY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYrOnmteMygNETVbfDWfMKI86sysMDQL8PEiMVeenmqf+4GDvt
	NK+az54XMV4Soom9plXMlqvpQBmV52uImD0sXi2gC1gHQYYO+/6F
X-Google-Smtp-Source: AGHT+IFgaGsGaW0jGdIazX+Bwp+Kyx73Ol6KAfYn7oJ0YwVVqWuqIfZY0j6ENfPbkwEKcG+P2FFAbQ==
X-Received: by 2002:a05:6512:23a8:b0:535:6a4d:ed74 with SMTP id 2adb3069b0e04-5389fc6e871mr7399563e87.51.1727774996719;
        Tue, 01 Oct 2024 02:29:56 -0700 (PDT)
Message-ID: <24bc989b205d791dca3cf99935ed6eaf347b0298.camel@gmail.com>
Subject: Re: [PATCH v8 6/7] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 01 Oct 2024 11:29:55 +0200
In-Reply-To: <1fabd6e5-4c90-4415-8748-bab53145c1a3@suse.com>
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
	 <ead52f68ce47d55a78e2062aa4ef4d8675258091.1727449154.git.oleksii.kurochko@gmail.com>
	 <1fabd6e5-4c90-4415-8748-bab53145c1a3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-30 at 17:30 +0200, Jan Beulich wrote:
> > + */
> > +static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned
> > int offset)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t *entry;
> > +=C2=A0=C2=A0=C2=A0 mfn_t mfn;
> > +
> > +=C2=A0=C2=A0=C2=A0 entry =3D *table + offset;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*entry) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !alloc_tbl )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn XEN_TABLE_MAP_NONE;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( create_table(entry) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn XEN_TABLE_MAP_NOMEM;
>=20
> At the risk of being overly picky: You still lose -ENOMEM here. I'd
> suggest
> to make create_table() return boolean (success / fail) to eliminate
> that
> concern. Any hypothetical plan for someone to add another error code
> there
> will then hit the return type aspect, pointing out that call sites
> need
> looking at for such a change to be correct.
I agree with these changes. Let's go with this approach.

Thanks.

~ Oleksii

