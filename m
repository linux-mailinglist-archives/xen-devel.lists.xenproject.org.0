Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F5A91A2EB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 11:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749896.1158136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMlhc-0006CC-Vo; Thu, 27 Jun 2024 09:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749896.1158136; Thu, 27 Jun 2024 09:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMlhc-0006AN-Sf; Thu, 27 Jun 2024 09:46:04 +0000
Received: by outflank-mailman (input) for mailman id 749896;
 Thu, 27 Jun 2024 09:46:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1631=N5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMlhb-0006AF-HO
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 09:46:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10d85abe-346a-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 11:46:02 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a724440f597so647968266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 02:46:02 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d7c9ad6sm41937166b.209.2024.06.27.02.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 02:46:01 -0700 (PDT)
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
X-Inumbo-ID: 10d85abe-346a-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719481562; x=1720086362; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pd77c1XlyGo6fu2iizOQHJIdagIjARiDe6sWBTjKfXE=;
        b=bM9hddwRjD6byYXnB02PXZMGhU8kbzelLOb5NPFrUyTjg/nMZcUhYLsaufxOs+6oQv
         XH3+Qmbvr6LlGh+72gRWYFUjhJLqZNJbL/bMCBfr7RpYEmwpKI9gXC4rw8tPer3ms0K0
         qx9TCNjXIe1LG7GEqCaxOnw5YqqkgSaCFL3TkN+9THC1jTQF7NvtqmJEYs0CmhxFup73
         w5m3UVvmQthwukbqyWnhZtTk/lu0mgwjMAnYEWx4Psu1mszeGLeK6D/jrUa6f1gVqYZm
         G5FqXR9Pe4yZpWaacGGL8mW2qlz3Y8w6WAlQevvYFHJC806apSqqYVZqiC5m9tN32+Rd
         6iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719481562; x=1720086362;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pd77c1XlyGo6fu2iizOQHJIdagIjARiDe6sWBTjKfXE=;
        b=ZMOgcEJNs2bM+4f8MWM2HUeIBuziR39EnQ/eQoKQ4EVg8qrH5f/Gb+cJpm8QDp4CWT
         skDEQEz0EgjrE1KLpJfKUconWbE1FlRglOsdY3iqsN/YxRxiyVX3Z6kDhMM6a6wVWiYb
         ShnoiTDpmp09H75/HtKVEr/EdhWdBd8oL7Z9gZCc+B9ZPXpCJkgjLE+wXKFOH/45N7aV
         3Xo4iPhrIiOHUi4pqp+ZI+M6B3n3zIEtSlyLhbMrr+lpjgtEGg06+BCaCNvOFp/aof6T
         x4P6H+1RucqVUSBAn3dBd6ebabd5f5Zv17F96gvVtWnGIJY5n/rTK0Ig6Ji7k2Q3yj6K
         ZKNg==
X-Gm-Message-State: AOJu0YzKayN64yBHUvAAX61s2wH0dhxEDYjSdPHHav9LrwyWo5C5MSz1
	uCp+GyrrJOu0LPu519/2PDPiKXz56WPSE6cm86qPFtyoN3y5j8Ee
X-Google-Smtp-Source: AGHT+IGCJWGkVsdzSkRpBOShWYOhJLdUnsYI9F1b8ZCAXD2VNiZw3klilwNOusXUN2U5JcJralVB5w==
X-Received: by 2002:a17:906:ba82:b0:a72:7a70:f2e3 with SMTP id a640c23a62f3a-a727a70f443mr566277766b.39.1719481562065;
        Thu, 27 Jun 2024 02:46:02 -0700 (PDT)
Message-ID: <8d30a48da7dbad45324c2d8854fbb7fd6b850e2a.camel@gmail.com>
Subject: Re: [XEN PATCH for 4.19] automation/eclair: add deviations agreed
 in MISRA meetings
From: oleksii.kurochko@gmail.com
To: Stefano Stabellini <sstabellini@kernel.org>, Federico Serafini
	 <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>
Date: Thu, 27 Jun 2024 11:46:00 +0200
In-Reply-To: <alpine.DEB.2.22.394.2406261735540.3635@ubuntu-linux-20-04-desktop>
References: 
	<4a65e064768ad5ddce96d749f24f0bdae2c3b9da.1719328656.git.federico.serafini@bugseng.com>
	 <alpine.DEB.2.22.394.2406251850281.3635@ubuntu-linux-20-04-desktop>
	 <c6aeb6007ead36afaf48ceef1070e5ec5a2ef88f.camel@gmail.com>
	 <d35cf13a-5cfd-425f-9c01-3a4122da3a69@bugseng.com>
	 <alpine.DEB.2.22.394.2406261735540.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-06-26 at 17:37 -0700, Stefano Stabellini wrote:
> On Wed, 26 Jun 2024, Federico Serafini wrote:
> > On 26/06/24 09:37, Oleksii wrote:
> > > On Tue, 2024-06-25 at 18:59 -0700, Stefano Stabellini wrote:
> > > > > +-doc_begin=3D"The conversion from a function pointer to
> > > > > unsigned
> > > > > long or (void *) does not lose any information, provided that
> > > > > the
> > > > > target type has enough bits to store it."
> > > > > +-config=3DMC3R1.R11.1,casts+=3D{safe,
> > > > > +=C2=A0 "from(type(canonical(__function_pointer_types)))
> > > > > +=C2=A0=C2=A0 &&to(type(canonical(builtin(unsigned
> > > > > long)||pointer(builtin(void)))))
> > > > > +=C2=A0=C2=A0 &&relation(definitely_preserves_value)"
> > > > > +}
> > > > > +-doc_end
> > > >=20
> > > > This one and the ones below are the important ones! I think we
> > > > should
> > > > have them in the tree as soon as possible ideally 4.19. I ask
> > > > for
> > > > a release-ack.
> > > Just want to be sure that I understand deviations properly with
> > > this
> > > example.
> > >=20
> > > If the deviation above is merged, then it would be safe from a
> > > MISRA
> > > point of view to cast a function pointer to 'unsigned long' or
> > > 'void
> > > *', and thereby MISRA won't complain about code with such
> > > conversions?
> >=20
> > Exactly, taking into account section 4.7 of GCC manual.
>=20
> Yes. From a Xen release perspective, it will only affect the static
> analysis jobs, making them report fewer violations. The reason why
> those specifically are important is that they are significant changes
> over the plain rule and they were already documented in rules.rst.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


