Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1F965FDF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 13:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786377.1195974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjzNo-0000Ux-4k; Fri, 30 Aug 2024 11:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786377.1195974; Fri, 30 Aug 2024 11:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjzNo-0000SO-21; Fri, 30 Aug 2024 11:01:36 +0000
Received: by outflank-mailman (input) for mailman id 786377;
 Fri, 30 Aug 2024 11:01:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2j7=P5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sjzNm-0000SI-LM
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 11:01:34 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 368f4988-66bf-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 13:01:33 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-533461323cdso2065485e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 04:01:31 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354079baecsm558005e87.22.2024.08.30.04.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 04:01:29 -0700 (PDT)
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
X-Inumbo-ID: 368f4988-66bf-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725015691; x=1725620491; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pBP9+S7Q1AknDRCFY+I9YRkS7F+HlIlzAXv9VwJ1NXM=;
        b=UjAiQqDhGB5eFOMhIYGRf9qoVuLHSWCtLHCLozq3XLbjy5FivhH5ZUOukXFRRzNd+u
         SnL/GeeV6qs6KmJLqRMHMV8S9GxlO7BOeTdA2u0I7iLdiWVcGlyMRGNdAz8xuhVwktGz
         HiQkSy3SQpD0srWh7eH8aixp6lawSgO3T/lnkjZn6CMREsjyxz6awyP5iUQ3GoYyr4cE
         eDtKtO4NFPouKA/URnjf7zrddvXlj0vRxaXwDq7zAsQXcdHg9gFMzaQ9eDJ4QiXxbGYm
         BUYcUR42P4927uqQlEHdnM5TOnnT25oQFJjc8Yp0nmnXBZBsiJ6V2dNNimiiclMuUIOM
         IjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725015691; x=1725620491;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBP9+S7Q1AknDRCFY+I9YRkS7F+HlIlzAXv9VwJ1NXM=;
        b=qBsifqC/aXV3V89poOl5Bmi/mj9UR1xsUsRyzS5MLR7bb+E2Bpat00Ogdq+zsaMbXa
         e4VJo298FS0JtbaILx9RDUUdvgwV706z9GH4jC0JhjoykBYFcWzcL8Uvuk1XUJV+eQCY
         qzcyBqNql6l/dBD19IxMbc1mdrUsfzrqB89zJLJVieH00XRGWKnOyVoreuBzcwKYzXmU
         B0JyNq3XkT+fcip/zxPJVjRVORfbUhYd7yswtKsXBtNxcptf92SnhW+0aeiBfI6WW23Y
         FYDAzKbMVFAqucQ90IPNUD927DCK9tDgloJyXBikkgGBR1nU44cF05Te/SRdVqyJDVRx
         rdwA==
X-Forwarded-Encrypted: i=1; AJvYcCVuz5bgoyvIqGIjdCjtjQDkg9njSha9ekzyE351OBbJ7zSROdCB65FRqTzDCJ4OTpIt8/DrpJHIUx4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1JcmApkPIuKdriZN7JGGOGK6pk9TJfUw19jku7NXDel8h1CTa
	bHBNTXKT6EtxEzDTukMD8f/c98oRu3bO+u1rrAZU59UxHXfsaPMo
X-Google-Smtp-Source: AGHT+IF5whGjH4AJTJi4FghPoy4AwaC29yXOY9E7QIcqmnJDtkQ5vfobnTUNREGu/qU+8QTrSnNsoA==
X-Received: by 2002:a05:6512:3d0f:b0:533:46de:30a0 with SMTP id 2adb3069b0e04-53546b9c0cemr1218980e87.54.1725015689834;
        Fri, 30 Aug 2024 04:01:29 -0700 (PDT)
Message-ID: <f995bf0772edf69ba20c873c8056ab248a1cdd6f.camel@gmail.com>
Subject: Re: [PATCH v5 2/7] xen/riscv: set up fixmap mappings
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 30 Aug 2024 13:01:28 +0200
In-Reply-To: <3705f296-3b79-4bad-9bbc-0b86aaa41314@suse.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
	 <57e892d5b2c526dd44b68d4976796a25c0feca20.1724256027.git.oleksii.kurochko@gmail.com>
	 <4b9cfa7e-546a-4dbb-a3de-4267849be13a@suse.com>
	 <9210aa20ebe892b9866309a7531398d446d0eef5.camel@gmail.com>
	 <3705f296-3b79-4bad-9bbc-0b86aaa41314@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-08-28 at 12:44 +0200, Jan Beulich wrote:
> On 28.08.2024 11:53, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-08-27 at 12:29 +0200, Jan Beulich wrote:
> > > >=20
> > > > +
> > > > +/*
> > > > + * Direct access to xen_fixmap[] should only happen when {set,
> > > > + * clear}_fixmap() is unusable (e.g. where we would end up to
> > > > + * recursively call the helpers).
> > > > + */
> > > > +extern pte_t xen_fixmap[];
> > >=20
> > > I'm afraid I keep being irritated by the comment: What recursive
> > > use
> > > of
> > > helpers is being talked about here? I can't see anything
> > > recursive in
> > > this
> > > patch. If this starts happening with a subsequent patch, then you
> > > have
> > > two options: Move the declaration + comment there, or clarify in
> > > the
> > > description (in enough detail) what this is about.
We can't move declaration of xen_fixmap[] to the patch where
set_fixmap() will be introduced ( which uses PMAP for domain map page
infrastructure ) as xen_fixmap[] is used in the current patch.

And we can't properly provide the proper description with the function
which will be introduced one day in the future ( what can be not good
too ). I came up with the following description in the comment above
xen_fixmap[] declaration:
   /*
    * Direct access to xen_fixmap[] should only happen when {set,
    * clear}_fixmap() is unusable (e.g. where we would end up to
    * recursively call the helpers).
    *=20
    * One such case is pmap_map() where set_fixmap() can not be used.
    * It happens because PMAP is used when the domain map page
   infrastructure
    * is not yet initialized, so map_pages_to_xen() called by
   set_fixmap() needs
    * to map pages on demand, which then calls pmap() again, resulting
   in a loop.
    * Modification of the PTEs directly instead in arch_pmap_map().
    * The same is true for pmap_unmap().
    */

Could it be an option just to drop the comment for now at all as at the
moment there is no such restriction with the usage of
{set,clear}_fixmap() and xen_fixmap[]?

> > This comment is added because of:
> > ```
> > void *__init pmap_map(mfn_t mfn)
> > =C2=A0 ...
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We cannot use set_fixmap()=
 here. We use PMAP when the
> > domain map
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * page infrastructure is not=
 yet initialized, so
> > =C2=A0=C2=A0 map_pages_to_xen() called
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * by set_fixmap() needs to m=
ap pages on demand, which then
> > calls
> > =C2=A0=C2=A0 pmap()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * again, resulting in a loop=
. Modify the PTEs directly
> > instead.
> > =C2=A0=C2=A0 The same
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is true for pmap_unmap().
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_pmap_map(slot, mfn);
> > =C2=A0=C2=A0 ...
> > ```
> > And it happens because set_fixmap() could be defined using generic
> > PT
> > helpers
>=20
> As you say - could be. If I'm not mistaken no set_fixmap()
> implementation
> exists even by the end of the series. Fundamentally I'd expect
> set_fixmap()
> to (possibly) use xen_fixmap[] directly. That in turn ...
>=20
> > so what will lead to recursive behaviour when when there is no
> > direct map:
>=20
> ... would mean no recursion afaict. Hence why clarification is needed
> as
> to what's going on here _and_ what's planned.
Yes, it is true. No recursion will happen in this case but if to look
at the implementation of set_fixmap() for other Arm or x86 ( but I am
not sure that x86 uses PMAP inside map_pages_to_xen() ) they are using
map_pages_to_xen().

~ Oleksii

>=20
> > =C2=A0=C2=A0 static pte_t *map_table(mfn_t mfn)
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * During early boot, map_dom=
ain_page() may be unusable. Use
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * PMAP to map temporarily a =
page-table.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( system_state =3D=3D SYS_STATE=
_early_boot )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return pma=
p_map(mfn);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> > =C2=A0=C2=A0 }
>=20


