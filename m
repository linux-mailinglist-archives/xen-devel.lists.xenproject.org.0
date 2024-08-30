Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26697966114
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 13:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786400.1195995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk0Dq-0001Oy-6n; Fri, 30 Aug 2024 11:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786400.1195995; Fri, 30 Aug 2024 11:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk0Dq-0001Mi-2r; Fri, 30 Aug 2024 11:55:22 +0000
Received: by outflank-mailman (input) for mailman id 786400;
 Fri, 30 Aug 2024 11:55:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2j7=P5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sk0Do-0001Mc-C0
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 11:55:20 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba7f1966-66c6-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 13:55:19 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5353d0b7463so3153159e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 04:55:19 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354079b8f9sm570988e87.46.2024.08.30.04.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 04:55:17 -0700 (PDT)
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
X-Inumbo-ID: ba7f1966-66c6-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725018918; x=1725623718; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9k8UVcLavTKC4nrsL2A1geBGJEEavOnCyF8T9DdtvvI=;
        b=iQZf/Yq/1nj7YlDhxGCsSIobsmDXyRvNijQ+XNBRjv+dTk2UIsKhoGKiMZ+432pqvl
         ED/brpnhel6zRPsGWQ0rHXZwaTgB5cF9hF3cgMGYOEAQSvLGXh22sOMTK/Vc3oV7CQBa
         DNB2rXjUKkY0eXDOUWc8SzYDtw8SMM80289Bl7CbsE4oM43GK8zeh86gjPyTec7v+j/Y
         g36DOOWD6jC7Q3uxpXdeApCQIxU6aH7SLeBRzRCUKpdAylF4l5mveGf2jKVsKo5rH/DO
         zewStSI8L/yK/58lhS2FZa/0qqv3zGtNSvjvsrHpBcmWheOpUxP5qlbUVUAgiyU8sQWw
         SOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725018918; x=1725623718;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9k8UVcLavTKC4nrsL2A1geBGJEEavOnCyF8T9DdtvvI=;
        b=hC//QVLfSfEAwtQLetnpNBfDcoFjwEfdPi0Z7HP39wh1PrJ0B2JMU5+E9iCKKMactR
         AcF9A3Goe0LoLF8ThLOtgl9FH5iuuV4ojfJYju7lIMwM9pWQRIHvUAOdpxFGnefd1JsJ
         3zTkx0WHW96i80p9dXRo5vshgbP6Cw23j8uH1ibdYiITDIIMUZB02BaaQ45uCmDP5mmi
         eitT7n0H6r9Va3Sov8Q24t92s7hygdQSBWbdDPUVKgAevGj0NS1ulfhAhzHaTDtupMzz
         mXpN1BcSxuhpYYjSUW+d6TPN6cblZAbJ1cjzULwhvMm8w7ZmXc4UA2hUoTZGw2bQ9Al8
         ZoZA==
X-Forwarded-Encrypted: i=1; AJvYcCXEtYgI1gXEp6Q1xi3xyzbzq/Jng3Xg2GgJLcj6pFAyILAp7qM4e2NBeqeJw+KXYdg9ADtUNOM15jk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVEurcDpdxkcLEkSssPJp95i/UtkR9sEeUWDOnt9AoMek+RYaq
	GmgDMIQOBSGWo0MEz22INA6/54D3cIU2rPPb+lZE5aE/ODEGJ0pj
X-Google-Smtp-Source: AGHT+IG4chFDXvLPshzjo10qcP2LtEdiEvb8DG9ES8uIlOGdKYtsX4nyWcWxRVkaYVNPg35lk12oMg==
X-Received: by 2002:a05:6512:693:b0:533:407f:5cbd with SMTP id 2adb3069b0e04-53546b191ccmr1572070e87.7.1725018917614;
        Fri, 30 Aug 2024 04:55:17 -0700 (PDT)
Message-ID: <66cb014343699b74b2539b61b25e2285092b4aff.camel@gmail.com>
Subject: Re: [PATCH v5 2/7] xen/riscv: set up fixmap mappings
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 30 Aug 2024 13:55:16 +0200
In-Reply-To: <4b9cfa7e-546a-4dbb-a3de-4267849be13a@suse.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
	 <57e892d5b2c526dd44b68d4976796a25c0feca20.1724256027.git.oleksii.kurochko@gmail.com>
	 <4b9cfa7e-546a-4dbb-a3de-4267849be13a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-27 at 12:29 +0200, Jan Beulich wrote:
> > @@ -81,6 +82,18 @@ static inline void flush_page_to_ram(unsigned
> > long mfn, bool sync_icache)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0 }
> > =C2=A0=20
> > +/* Write a pagetable entry. */
> > +static inline void write_pte(pte_t *p, pte_t pte)
> > +{
> > +=C2=A0=C2=A0=C2=A0 write_atomic(p, pte);
> > +}
> > +
> > +/* Read a pagetable entry. */
> > +static inline pte_t read_pte(pte_t *p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return read_atomic(p);
>=20
> This only works because of the strange type trickery you're playing
> in
> read_atomic(). Look at x86 code - there's a strict expectation that
> the
> type can be converted to/from unsigned long. And page table accessors
> are written with that taken into consideration. Same goes for
> write_pte()
> of course, with the respective comment on the earlier patch in mind.
>=20
> Otoh I see that Arm does something very similar. If you have a strong
> need / desire to follow that, then please at least split the two
> entirely separate aspects that patch 1 presently changes both in one
> go.
I am not 100% sure that type trick could be dropped easily for RISC-V:
1. I still need the separate C function for proper #ifdef-ing:
   #ifndef CONFIG_RISCV_32
       case 8: *(uint32_t *)res =3D readq_cpu(p); break;
   #endif
  =20
2. Because of the point 1 the change should be as following:
   -#define read_atomic(p) ({                                   \
   -    union { typeof(*(p)) val; char c[sizeof(*(p))]; } x_;   \
   -    read_atomic_size(p, x_.c, sizeof(*(p)));                \
   -    x_.val;                                                 \
   +#define read_atomic(p) ({                                 \
   +    unsigned long x_;                                     \
   +    read_atomic_size(p, &x_, sizeof(*(p)));               \
   +    (typeof(*(p)))x_;                                     \
    })
   But after that I think it will be an error: "conversion to non-scalar
   type requested" in the last line as *p points to pte_t.
  =20
   and we can't just in read_pte() change to:
   static inline pte_t read_pte(pte_t *p)
   {
       return read_atomic(&p->pte);
   }
   As in this cases it started it will return unsigned long but function
   expects pte_t. As an option read_pte() can be updated to:
   /* Read a pagetable entry. */
   static inline pte_t read_pte(pte_t *p)
   {
       return (pte_t) { .pte =3D read_atomic(&p->pte) };
   }
  =20
   But I am not sure that it is better then just have a union trick inside
   read_atomic() and then just have read_atomic(p) for read_pte().
  =20
   Am I missing something?
  =20
~ Oleksii

