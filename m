Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610708D3A1A
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:59:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732146.1138003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKl5-0002LM-U0; Wed, 29 May 2024 14:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732146.1138003; Wed, 29 May 2024 14:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKl5-0002Jq-Qn; Wed, 29 May 2024 14:58:31 +0000
Received: by outflank-mailman (input) for mailman id 732146;
 Wed, 29 May 2024 14:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCKl4-0002Jk-MD
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:58:30 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e83abd71-1dcb-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 16:58:28 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a62ef52e837so239979966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:58:28 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a65ab5c9009sm34339766b.116.2024.05.29.07.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:58:27 -0700 (PDT)
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
X-Inumbo-ID: e83abd71-1dcb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716994708; x=1717599508; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BNViD2QjGbbdDZhkRCgcqFaqgTYj5buD4YzpkiaWovc=;
        b=f92myGlXfNyZ9ZAazv4Un8OvqoLONPNjsJkYXDt5St2+3hQwT01cUZT9R0YBpuuQ0R
         5Rm8U0th6o6eU6HrBu55mArtwvvHVNzhtEZRGHcUgu4vDiq5NMPPsDv8zfYaSuyayCtv
         ZYXH0F0JpWX2NgguSIKVaf7tGYeZLgAZmw+23ePBsDtCB/WOy/8r5iXD7UNWhKavFZBS
         A90vzuEiBVwbZo8CpGnzd/L/OivdOJgE0kN7ELYj1IcMAIhh6U2Gls5ZJoUnjpzqRnAI
         OOCpIjkWRPxPHfrWi+CaJ/KjXcC6q4NGeBvLhkBqP8cSgeWvzBuRfmj4Xl3ZDVn6CaC7
         jTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994708; x=1717599508;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BNViD2QjGbbdDZhkRCgcqFaqgTYj5buD4YzpkiaWovc=;
        b=cRjfppmElCyUmzP+MS3Po3yDZrSXSVEEMuFy9kyOTHK84ISsoneX7MOOmcRIhA8Nub
         iy28X8VkmAWpx+ohc+av2ssD/QGzNeooRzLjaRCIB+/H3pgZV7Sb2uwC+2NyLpFKPRYl
         rermErJLim1MYPk7o5GozoiPo5b7mt5yCtICnBvyt9OZ0JZPfjM7Orhl50SabqlYVSd1
         0/F1w2McI22d8xlHuIeYbaCGhHKc00Mdp8/YPMMoPCJTFJ8VXpqSKVcHctABxXPZk+MP
         p3+n23gp9OZ0BVGIvcoIi0oFvZtvf02FzX/8imkOKtpMoWciKoR/cWV+i0QwjZyejCr1
         4tkA==
X-Forwarded-Encrypted: i=1; AJvYcCXlDrVTG5NLgf4F1V+TLGV/3TICXE+NtPPiFa9vGkN/HN3LG6Ki83VPDz+DlawC/Y5rdGkwqmVFSV0O6mHTtf1NTCcagZ2hH8hJeQdpPKE=
X-Gm-Message-State: AOJu0YwGlL4W2ZmQgNXIf2dtbzuC2EpmCy36MEmw/VUHzCvBwrHgthpY
	5HovLWTAuenaGgRK+EBTWHOInuX9xExPdC4M33RwpC2k6Ui3G03Y
X-Google-Smtp-Source: AGHT+IG+BJpUK57O/ezY+NRQ1ijJsptJOVug6YwQgG0HEd07BzlFFao2QiSbkMUYJiYCj3dd68/3QA==
X-Received: by 2002:a17:906:2890:b0:a5a:a2b6:ba8f with SMTP id a640c23a62f3a-a6262f87932mr1158371866b.0.1716994707639;
        Wed, 29 May 2024 07:58:27 -0700 (PDT)
Message-ID: <2bc05407cc62c829d63da757e071db51a003eb79.camel@gmail.com>
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,  Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Wed, 29 May 2024 16:58:26 +0200
In-Reply-To: <ded13a36-b790-4989-a952-9a4130293b50@suse.com>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
	 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
	 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
	 <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
	 <a39c3c03-ef54-4329-833d-03b60f162234@xen.org>
	 <56b97916d1c36040a0be547759d5d10d311c9ed3.camel@gmail.com>
	 <5438a9b1-d13a-415b-95e4-af520c228e01@suse.com>
	 <c72784d5-20d2-4583-9e8a-f8b1cbf31aa6@xen.org>
	 <ded13a36-b790-4989-a952-9a4130293b50@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

static always_inline bool test_bit(int nr, const volatile void *addr)On
Wed, 2024-05-29 at 12:06 +0200, Jan Beulich wrote:
> On 29.05.2024 11:59, Julien Grall wrote:
> > Hi,
> >=20
> > On 29/05/2024 09:36, Jan Beulich wrote:
> > > On 29.05.2024 09:50, Oleksii K. wrote:
> > > > On Tue, 2024-05-28 at 09:53 +0100, Julien Grall wrote:
> > > > > > > > +/**
> > > > > > > > + * generic_test_bit - Determine whether a bit is set
> > > > > > > > + * @nr: bit number to test
> > > > > > > > + * @addr: Address to start counting from
> > > > > > > > + *
> > > > > > > > + * This operation is non-atomic and can be reordered.
> > > > > > > > + * If two examples of this operation race, one can
> > > > > > > > appear to
> > > > > > > > succeed
> > > > > > > > + * but actually fail.=C2=A0 You must protect multiple
> > > > > > > > accesses with
> > > > > > > > a
> > > > > > > > lock.
> > > > > > > > + */
> > > > > > >=20
> > > > > > > You got carried away updating comments - there's no
> > > > > > > raciness for
> > > > > > > simple test_bit(). As is also expressed by its name not
> > > > > > > having
> > > > > > > those
> > > > > > > double underscores that the others have.
> > > > > > Then it is true for every function in this header. Based on
> > > > > > the
> > > > > > naming
> > > > > > the conclusion can be done if it is atomic/npn-atomic and
> > > > > > can/can't
> > > > > > be
> > > > > > reordered.
> > > > >=20
> > > > > So let me start with that my only request is to keep the
> > > > > existing
> > > > > comments as you move it. It looks like there were none of
> > > > > test_bit()
> > > > > before.
> > > > Just to clarify that I understand correctly.
> > > >=20
> > > > Do we need any comment above functions generic_*()? Based on
> > > > that they
> > > > are implemented in generic way they will be always "non-atomic
> > > > and can
> > > > be reordered.".
> > >=20
> > > I indicated before that I think reproducing the same comments
> > > __test_and_*
> > > already have also for generic_* isn't overly useful. If someone
> > > insisted
> > > on them being there as well, I could live with that, though.
> >=20
> > Would you be ok if the comment is only on top of the __test_and_*=20
> > version? (So no comments on top of the generic_*)
>=20
> That's my preferred variant, actually. The alternative I would also
> be
> okay-ish with is to have the comments also ahead of generic_*.
>=20
> > > > Do you find the following comment useful?
> > > >=20
> > > > " * If two examples of this operation race, one can appear to
> > > > succeed
> > > > =C2=A0 * but actually fail.=C2=A0 You must protect multiple accesse=
s with
> > > > a lock."
> > > >=20
> > > > It seems to me that it can dropped as basically "non-atomic and
> > > > can be
> > > > reordered." means that.
> > >=20
> > > I agree, or else - as indicated before - the wording would need
> > > to further
> > > change. Yet iirc you've added that in response to a comment from
> > > Julien,
> > > so you'll primarily want his input as to the presence of
> > > something along
> > > these lines.
> >=20
> > I didn't realise this was an existing comment. I think the
> > suggestion is=20
> > a little bit odd because you could use the atomic version of the
> > helper.
> >=20
> > Looking at Linux, the second sentence was dropped. But not the
> > first=20
> > one. I would suggest to do the same. IOW keep:
> >=20
> > "
> > If two examples of this operation race, one can appear to succeed
> > but=20
> > actually fail.
> > "
>=20
> As indicated, I'm okay with that being retained, but only in a form
> that
> actually makes sense. I've explained before (to Oleksii) what I
> consider
> wrong in this way of wording things.

Would it be suitable to rephrase it in the following way:
     * This operation is non-atomic and can be reordered.
   - * If two examples of this operation race, one can appear to
   succeed
   - * but actually fail.  You must protect multiple accesses with a
   lock.
   + * If two instances of this operation race, one may succeed in
   updating
   + * the bit in memory, but actually fail. It should be protected
   from
   + * potentially racy behavior.
     */
    static always_inline bool
    __test_and_set_bit(int nr, volatile void *addr)
   @@ -228,8 +191,9 @@ __test_and_set_bit(int nr, volatile void *addr)
     * @addr: Address to count from
     *
     * This operation is non-atomic and can be reordered.
   - * If two examples of this operation race, one can appear to
   succeed
   - * but actually fail.  You must protect multiple accesses with a
   lock.
   + * If two instances of this operation race, one may succeed in
   clearing
   + * the bit in memory, but actually fail. It should be protected
   from
   + * potentially racy behavior.
     */
    static always_inline bool
    __test_and_clear_bit(int nr, volatile void *addr)
   @@ -251,8 +215,9 @@ __test_and_clear_bit(int nr, volatile void
   *addr)
     * @addr: Address to count from
     *
     * This operation is non-atomic and can be reordered.
   - * If two examples of this operation race, one can appear to
   succeed
   - * but actually fail.  You must protect multiple accesses with a
   lock.
   + * If two instances of this operation race, one may succeed in
   changing
   + * the bit in memory, but actually fail. It should be protected
   from
   + * potentially racy behavior.
     */
    static always_inline bool
    __test_and_change_bit(int nr, volatile void *addr)
   @@ -274,8 +239,9 @@ __test_and_change_bit(int nr, volatile void
   *addr)
     * @addr: Address to start counting from
     *
     * This operation is non-atomic and can be reordered.
   - * If two examples of this operation race, one can appear to
   succeed
   - * but actually fail.  You must protect multiple accesses with a
   lock.
   + * If two instances of this operation race, one may succeed in
   testing
   + * the bit in memory, but actually fail. It should be protected
   from
   + * potentially racy behavior.
     */
    static always_inline bool test_bit(int nr, const volatile void
   *addr)

~ Oleksii
>=20
> Jan


