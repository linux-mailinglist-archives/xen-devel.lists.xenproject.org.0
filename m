Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D192623F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 15:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753066.1161336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0Or-0007hk-3u; Wed, 03 Jul 2024 13:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753066.1161336; Wed, 03 Jul 2024 13:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0Or-0007fl-1I; Wed, 03 Jul 2024 13:51:57 +0000
Received: by outflank-mailman (input) for mailman id 753066;
 Wed, 03 Jul 2024 13:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAj5=OD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sP0Oq-0007ff-6V
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 13:51:56 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6891a001-3943-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 15:51:55 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso60556541fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 06:51:55 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58bce1922c8sm1907140a12.13.2024.07.03.06.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 06:51:54 -0700 (PDT)
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
X-Inumbo-ID: 6891a001-3943-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720014715; x=1720619515; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zY0LbkTabeUXU+vUQ/HHe6zEIYM+kDyKmdN+gjlg7/s=;
        b=S9cw9Sw7MfAlKmHBq01o14C2kJTT64rvmCrCiapnUhRVD6b4osyhK6LMUmVEGq6cMI
         8PTsD4+QSAtwueU4lrdkll2MqUIP7yHQzXMJEmAD7N3QgtyMt5bgH7GxcW2Pf3+XJ70d
         sttYIf7blVwzOz8UgN2FgFUcBBQF/gTJjVft47gXPsW/d1QR/617/5gdTkxRDWNwYnkS
         HXZE2k7eFDbUAILVVCC8P7zN4yEIPGzmVDgW9J+l/8ky2QxsAjVccNmDasEAYQRoI4XF
         Rsb0fkhZFu7JvR6xT2/rhyjZxKVzljuJ+zSq9Zd02q8y2qvX5+Vd9klJYnyUYW5/59/I
         9yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720014715; x=1720619515;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zY0LbkTabeUXU+vUQ/HHe6zEIYM+kDyKmdN+gjlg7/s=;
        b=QwybgAmP7gDPYiJoBVbjOQy4rkM8o4uVMSsknMjUF0C7shOiVS7jt1Yl3Jg0g1yGm0
         pbM2NosxBCFwYPwLiXRPw29MMXeOIBRTWIrX49lXNmTk24z5SMQateuRS9UncW58a+nJ
         MMXsRcf7QeQnDc91MLHHIdmBpkL+0b8UR93o1+6nEWuTDmzAQKcDF7dvagmflLerXG48
         ned3aUZnd6ZCB25ugJ+VqZzk2Ek0jNvJM//hlJx2dQr9C6hFNziXR7yosAYjk3nV+3F0
         ZXITIrjQ/odYEJIUKjVCuN052Mj6HInHFJ2W+9nzVzUmrxbsX12Tj0EHJsMLQ2eGCAQr
         g8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX4EuaD9vDA3jQJYzOEhrfjBKa75PFODJgnqrKQsyRd46ho2W5GM6nrV1hWx7Sgt6mEQ7huNMO0Io66DojKsfdHu16bPCTQWdcmeNL/Jk8=
X-Gm-Message-State: AOJu0Ywmy+Nh92Tvjwg+MxnXzGnyZUotuUdYmWQspIzk3mo6FdCMM3rx
	cJ62EOH1/hla3xikgk5pMwQCqYR19nOZd3prX9bbnzlAg32xRzL43o1XRV5E
X-Google-Smtp-Source: AGHT+IHDNwc2+kUcVlhem1MQ4CSUDzoaupwqLaMKMXIL5kUBEKVIY/4N3V+MPd/5TCBEUupHm7gh/A==
X-Received: by 2002:a05:651c:b0b:b0:2ec:5c94:3d99 with SMTP id 38308e7fff4ca-2ee5e3810b7mr78832801fa.2.1720014714455;
        Wed, 03 Jul 2024 06:51:54 -0700 (PDT)
Message-ID: <45983cc81600dd0bcc804504f61a582cf709c9a5.camel@gmail.com>
Subject: Re: [PATCH for-4.19 v2] xen/vmap: Document the vmap header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo
	 <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
 <xen-devel@lists.xenproject.org>
Date: Wed, 03 Jul 2024 15:51:53 +0200
In-Reply-To: <7772dc9e-b9e2-4af7-af43-fa5cbe651488@suse.com>
References: 
	<f8bcfe757b45ce59e1a1203c2675a4266cc15f20.1720005327.git.alejandro.vallejo@cloud.com>
	 <7772dc9e-b9e2-4af7-af43-fa5cbe651488@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-03 at 13:58 +0200, Jan Beulich wrote:
> On 03.07.2024 13:19, Alejandro Vallejo wrote:
> > +/*
> > + * Unmaps a range of virtually contiguous memory from one of the
> > vmap regions
> > + *
> > + * The system remembers internally how wide the mapping is and
> > unmaps it all.
>=20
> Seeing this is still taken verbatim ...
>=20
> > + * It also can determine the vmap region type from the `va`.
> > + *
> > + * @param va Virtual base address of the range to unmap
> > + */
> > =C2=A0void vunmap(const void *va);
> > =C2=A0
> > +/*
> > + * Allocate `size` octets of possibly non-contiguous physical
> > memory and map
> > + * them contiguously in the VMAP_DEFAULT vmap region
> > + *
> > + * @param size Pointer to the base of an array of mfns
> > + * @return Pointer to the mapped area on success; NULL otherwise.
> > + */
> > =C2=A0void *vmalloc(size_t size);
> > +
> > +/* Same as vmalloc(), but for the VMAP_XEN vmap region. */
> > =C2=A0void *vmalloc_xen(size_t size);
> > =C2=A0
> > +/* Same as vmalloc(), but set the contents to zero before
> > returning */
> > =C2=A0void *vzalloc(size_t size);
> > +
> > +/*
> > + * Unmap and free memory from vmalloc(), vmalloc_xen() or
> > vzalloc()
> > + *
> > + * The system remembers internally how wide the mapping is and
> > unmaps it all.
> > + *
> > + * @param va Virtual base address of the range to free and unmap
> > + */
> > =C2=A0void vfree(void *va);
>=20
> ... here (just moved to the proper place now), I further wonder: Why
> just
> "mapping" and "unmap". The function is also (one might even say
> primarily)
> about freeing. IOW perhaps "how wide the allocation is and
> unmaps/frees it
> all"?
>=20
> Happy to adjust while committing, at which point:
> Acked-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleskii

