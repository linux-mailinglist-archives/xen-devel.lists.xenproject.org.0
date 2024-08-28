Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3850962403
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 11:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784614.1194013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFMh-0006FP-C0; Wed, 28 Aug 2024 09:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784614.1194013; Wed, 28 Aug 2024 09:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFMh-0006Cm-9C; Wed, 28 Aug 2024 09:53:23 +0000
Received: by outflank-mailman (input) for mailman id 784614;
 Wed, 28 Aug 2024 09:53:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3BgB=P3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sjFMf-0006Cg-Vf
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 09:53:21 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bb8435a-6523-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 11:53:20 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53351642021so7723605e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 02:53:20 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea8940asm2161714e87.286.2024.08.28.02.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 02:53:19 -0700 (PDT)
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
X-Inumbo-ID: 5bb8435a-6523-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724838800; x=1725443600; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g8zadqbn2M/ZYFdNdSGK9gbT7OCJiGxh1VIvqrFwzgs=;
        b=QXvKYTKVCMA//T0BhHv/KnBnVCZjSgA14fhg/F0tZE9ihYauNNZdPNTwP3dztg/DIg
         3rWOWNIHfh5tj0234eMfyRruQ/JMfyapnZNTr7jAcMw4UKKsz8A0Xf0S20Kl4KRxnlab
         DOttzgQ1DGcVL3IWKQIBZzI2l4o79Utv6WH2vyPOnQ/xsl8pARI7g6pBo4My19/dZmJI
         IyMcUiXEyJDkNUFYbsjyBQnqWMJwqGSPi2n/7kWeGtT2g8t69bezXIB+GVVl8TwY6Blq
         ScKbSR1rLm93nRy3GJkrHuujxIq4mUcBx1eq1WO6u8ch18NnPxDTcL1K7WmUcLJTuZgP
         5/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724838800; x=1725443600;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g8zadqbn2M/ZYFdNdSGK9gbT7OCJiGxh1VIvqrFwzgs=;
        b=MRqppZoo8CjhzXRtisFzRxD0ajKAppbKaubNA6izLH7v26KFL7WdhxVh655kXYVIyq
         oR2b2Kd+dJB2O8ii9Eu+Rv0p3CP5paHZn60uwxpNSwnPk7/kYYbqNT3YgwvbPsZ7R6vU
         rttz8M4ptUmfjMbUVUAtg3bAlQMrXGun50Ix8B+uq/I2haghLmB7kn6sB31UOoBldYd3
         aZ65EWNOtFKdX+pxskyLAO9kMb/j7bEWZjnH7/9iyrLqi1mjI5zjD2WfqdB3v86mQxtx
         Je7+chL9p2byKIVlf/G23Hx5oD2E3FoICDr+ErwO0W+MNVYx/wr1bEbeuTZkzCLt+v49
         VcHA==
X-Forwarded-Encrypted: i=1; AJvYcCUhYa/VMVTiDhYNaWmffepZNrqfaBZrAkpDPj5/pA8uDHS80dmOG5W8eE+Ua6inx/W1ylE+jwoMTwU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySGcGkJLekL9D4x3/YpU/gLNaIkG5JWgKkba3W/y6Td4OzMoo7
	qcqftAdMODQHGF9h38XonvULvNY/A6/Qrct8W/Fp04ZSjfngid1VgFrSUw==
X-Google-Smtp-Source: AGHT+IE4In3Sn17/jfokXh+fQUCfusIvL9xIdo2hJ56GtDukezaa9mEpipVGZknh/A6kso91UL7bBg==
X-Received: by 2002:a05:6512:1589:b0:532:ef22:eb4e with SMTP id 2adb3069b0e04-534387c4a10mr10078182e87.54.1724838799782;
        Wed, 28 Aug 2024 02:53:19 -0700 (PDT)
Message-ID: <9210aa20ebe892b9866309a7531398d446d0eef5.camel@gmail.com>
Subject: Re: [PATCH v5 2/7] xen/riscv: set up fixmap mappings
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 28 Aug 2024 11:53:18 +0200
In-Reply-To: <4b9cfa7e-546a-4dbb-a3de-4267849be13a@suse.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
	 <57e892d5b2c526dd44b68d4976796a25c0feca20.1724256027.git.oleksii.kurochko@gmail.com>
	 <4b9cfa7e-546a-4dbb-a3de-4267849be13a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-27 at 12:29 +0200, Jan Beulich wrote:
> >=20
> > +
> > +/*
> > + * Direct access to xen_fixmap[] should only happen when {set,
> > + * clear}_fixmap() is unusable (e.g. where we would end up to
> > + * recursively call the helpers).
> > + */
> > +extern pte_t xen_fixmap[];
>=20
> I'm afraid I keep being irritated by the comment: What recursive use
> of
> helpers is being talked about here? I can't see anything recursive in
> this
> patch. If this starts happening with a subsequent patch, then you
> have
> two options: Move the declaration + comment there, or clarify in the
> description (in enough detail) what this is about.
This comment is added because of:
```
void *__init pmap_map(mfn_t mfn)
  ...
       /*
        * We cannot use set_fixmap() here. We use PMAP when the domain map
        * page infrastructure is not yet initialized, so
   map_pages_to_xen() called
        * by set_fixmap() needs to map pages on demand, which then calls
   pmap()
        * again, resulting in a loop. Modify the PTEs directly instead.
   The same
        * is true for pmap_unmap().
        */
       arch_pmap_map(slot, mfn);
   ...
```
And it happens because set_fixmap() could be defined using generic PT
helpers so what will lead to recursive behaviour when when there is no
direct map:
   static pte_t *map_table(mfn_t mfn)
   {
       /*
        * During early boot, map_domain_page() may be unusable. Use the
        * PMAP to map temporarily a page-table.
        */
       if ( system_state =3D=3D SYS_STATE_early_boot )
           return pmap_map(mfn);
       ...
   }

>=20
> > @@ -81,6 +82,18 @@ static inline void flush_page_to_ram(unsigned
> > long mfn, bool sync_icache)
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0}
> > =C2=A0
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
I will check x86 code. Probably my answer on the patch with
read/write_atomic() suggest that too. Based on the answers to that
patch I think we can go with x86 approach.

Thanks.

~ Oleksii

>=20
> Otoh I see that Arm does something very similar. If you have a strong
> need / desire to follow that, then please at least split the two
> entirely separate aspects that patch 1 presently changes both in one
> go.
>=20
> Jan


