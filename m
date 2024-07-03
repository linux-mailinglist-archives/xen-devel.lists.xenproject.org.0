Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DD09260EE
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 14:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753022.1161282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOzUO-0004o1-09; Wed, 03 Jul 2024 12:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753022.1161282; Wed, 03 Jul 2024 12:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOzUN-0004mp-Th; Wed, 03 Jul 2024 12:53:35 +0000
Received: by outflank-mailman (input) for mailman id 753022;
 Wed, 03 Jul 2024 12:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xq3e=OD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sOzUM-0004mh-AB
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 12:53:34 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 409a4edb-393b-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 14:53:32 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6fe7a0cb58so290969766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 05:53:32 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58612c835c4sm6975883a12.11.2024.07.03.05.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 05:53:31 -0700 (PDT)
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
X-Inumbo-ID: 409a4edb-393b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720011212; x=1720616012; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQgFjrlIgun8v6O0rZZ0sdnzWdJyWSdXWVuoVh27hFA=;
        b=EvpmvtiJJhMs7xrotmQP07k9J3dobU7ylxBRl2tsh3rFMwxvOZAZRGN1p9t6NtN9Li
         tmhKQyJyi1d3u3h7nNCaXVJfU2vEH5y6KO5HkMGtT4W3Cs6JAT/wtTCM+cEvwv64LPX5
         s79W66GzmS26y96PrUV66bDeqc/arXm5Au3A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720011212; x=1720616012;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AQgFjrlIgun8v6O0rZZ0sdnzWdJyWSdXWVuoVh27hFA=;
        b=dEALh7SP0XvRugk4V/yUvbL+e2uMwIcRrFutnWvrHsG49WD0VZUVriuXDO5kI3ZXOW
         ipH97SwYA0ApNjt16dJJnpPaTMcO0nSoOhQPVYEa6epJp7SDwdVh2vZATIY5ecmvVV6B
         4nENYYA9bhNZ/mXaL4KyyGo+bwAH0iToCHfXjNu3sW7Z9a7YCVgA4SCqoxEd2coPNzOr
         CwlAdZe1nhZsw/aRTjCvI/B6ywiXbRdwiUb2KVqJuqtH9byxtW8Y4hzOXziLYetZz21B
         ZWAWGHVWO/BqzpD1x2FcvlxnPLH5MFjDTqdqkuE2saY/0SxThoGBUE8HiGqu1b/tdLAE
         5lDw==
X-Forwarded-Encrypted: i=1; AJvYcCWQmw7GG2rsTcAXrV9dRfCAuToltEPf92UrdlAUls0uckhS9iS/Q7p5pymj5e0FSHvXevsQwMUwqC8vo8CQz/FF3yIBiwy5BM3laRat0ek=
X-Gm-Message-State: AOJu0Yz/i37K1c5YAAyDxi+ObD0xJcjlHuhp+xABVJHyiGdIDDQYteGD
	FocTMMkjL53jlqGlpOMvklnb6jQCLOo1i5sOL4y+7ftpJEHVX/2EpSjtOEIkJqQ=
X-Google-Smtp-Source: AGHT+IGcxxTWiVvKKFtyrEySScVG/aQsebWlakBCPkBsZWcngE2s3k3ZPWonzvkpOBe54D78Il1t4g==
X-Received: by 2002:a05:6402:5cd:b0:57d:55a2:73f1 with SMTP id 4fb4d7f45d1cf-587a0822c41mr9048890a12.34.1720011211730;
        Wed, 03 Jul 2024 05:53:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jul 2024 13:53:29 +0100
Message-Id: <D2FX357XBWXQ.1NEA9S1RT53QY@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall"
 <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.19 v2] xen/vmap: Document the vmap header
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <f8bcfe757b45ce59e1a1203c2675a4266cc15f20.1720005327.git.alejandro.vallejo@cloud.com> <7772dc9e-b9e2-4af7-af43-fa5cbe651488@suse.com>
In-Reply-To: <7772dc9e-b9e2-4af7-af43-fa5cbe651488@suse.com>

On Wed Jul 3, 2024 at 12:58 PM BST, Jan Beulich wrote:
> On 03.07.2024 13:19, Alejandro Vallejo wrote:
> > +/*
> > + * Unmaps a range of virtually contiguous memory from one of the vmap =
regions
> > + *
> > + * The system remembers internally how wide the mapping is and unmaps =
it all.
>
> Seeing this is still taken verbatim ...
>
> > + * It also can determine the vmap region type from the `va`.
> > + *
> > + * @param va Virtual base address of the range to unmap
> > + */
> >  void vunmap(const void *va);
> > =20
> > +/*
> > + * Allocate `size` octets of possibly non-contiguous physical memory a=
nd map
> > + * them contiguously in the VMAP_DEFAULT vmap region
> > + *
> > + * @param size Pointer to the base of an array of mfns
> > + * @return Pointer to the mapped area on success; NULL otherwise.
> > + */
> >  void *vmalloc(size_t size);
> > +
> > +/* Same as vmalloc(), but for the VMAP_XEN vmap region. */
> >  void *vmalloc_xen(size_t size);
> > =20
> > +/* Same as vmalloc(), but set the contents to zero before returning */
> >  void *vzalloc(size_t size);
> > +
> > +/*
> > + * Unmap and free memory from vmalloc(), vmalloc_xen() or vzalloc()
> > + *
> > + * The system remembers internally how wide the mapping is and unmaps =
it all.
> > + *
> > + * @param va Virtual base address of the range to free and unmap
> > + */
> >  void vfree(void *va);
>
> ... here (just moved to the proper place now), I further wonder: Why just
> "mapping" and "unmap". The function is also (one might even say primarily=
)
> about freeing. IOW perhaps "how wide the allocation is and unmaps/frees i=
t
> all"?
>
> Happy to adjust while committing, at which point:
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Jan

Sounds good to me.

Cheers,
Alejandro

