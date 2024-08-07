Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2591694A6FB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 13:31:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773437.1183874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sberd-0006RW-5U; Wed, 07 Aug 2024 11:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773437.1183874; Wed, 07 Aug 2024 11:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sberd-0006Py-2T; Wed, 07 Aug 2024 11:29:57 +0000
Received: by outflank-mailman (input) for mailman id 773437;
 Wed, 07 Aug 2024 11:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcC0=PG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sberb-0006Ps-KF
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 11:29:55 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d28d816-54b0-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 13:29:54 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-530e2235688so38194e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 04:29:52 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de47c4b8sm213164e87.267.2024.08.07.04.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 04:29:51 -0700 (PDT)
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
X-Inumbo-ID: 5d28d816-54b0-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723030192; x=1723634992; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d2JsYo1r/Er9ZgaBQ9Ckx1SyKJv5bFJIGt+kr1/h0TA=;
        b=E0ybEt5NJ4MFjbeKo2rdS1e3kD797ToM8fNisJcXghq+TEcI0QItXNSG5EPnJY2h4L
         ZqR/VFThU1n555k2sgUWQsBxrmkcDS2pD5+Ynhl5Cxpm8RMPjlTRTJezQcLeBIsaGdxu
         ebbVpgwBcaeF/tJwcUeZRDq8vRrE429TooPQ0JS3ZRonuuXbpQoI+m0B7hI/Mcs3e+fX
         7+pA9uxdzCi7Zu65ayw6hOiqftI9URgjLoAL8KVR+4jWa1v1uRxOLujEHCLirvBF7oIC
         feANW+VJLk4oYr8Gfgg5jrJALe7THNeZSdfriOU0CZM2r0NtEnj07fW1I15t/ymAWXsC
         Bbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723030192; x=1723634992;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2JsYo1r/Er9ZgaBQ9Ckx1SyKJv5bFJIGt+kr1/h0TA=;
        b=tnO23BWl1URzR+yeskg4ERsxPXbmKu/x5tMEmS6wd5lweikZIGVU6LKeSTYmD3CRAG
         YBDrLJaEjeCbV1Su8FckPGrVC+PIVYpeZ+X/xF0Rp42euI5qOArxtrmquMkUJ4oK4ppm
         OXXjZa9pBMh5/zAWNqlMPZFjiXwf7h+oiK7vVxSbdqkg8fYocQpIYSxU7g70ZXBm3yfS
         AFfb0+QV+0gnU8ac1e9RYf+8SuCE3vyekWA/sKCzVZAlTSst6aQb6GllaNuacXAx8dxt
         1G3ZO5HTfyTwUfsnpGarYa7MB6YVBZ/rzwnyVxAxAbfRyXntnvFDbe8J8cMlNrWyXp+9
         fpmA==
X-Forwarded-Encrypted: i=1; AJvYcCV6pr8Jz8V/tQssl5EA9OFgCM9Pm3bBVfywbPySuTM58jtG1RpOj1ZCqNUahiuQK7A1wy4QIiT5v7kpyuOylkY9OrNypAxy8pcgYFU7bxM=
X-Gm-Message-State: AOJu0Yxn3vLu+yZgi9Onx779kQJH1uv6LhGxqujHb+DuaYG09Avirdcj
	YpT9Kx26zQg7BF2630/20zoNPFEoUhjp6nvsBww0oaAYbrq9o4s4
X-Google-Smtp-Source: AGHT+IGPjl/4HvLman57VbVnHqBPHglxkwdBCj9BJiWbDxM4B6Rcc5ydbw7b31TJgFqNOxh5ERwbog==
X-Received: by 2002:ac2:4c48:0:b0:52f:2adf:d445 with SMTP id 2adb3069b0e04-530bb39b88cmr13703358e87.41.1723030191485;
        Wed, 07 Aug 2024 04:29:51 -0700 (PDT)
Message-ID: <62165b298cd214d6aab5b5edcc68c2edc97b88d9.camel@gmail.com>
Subject: Re: [PATCH v3 7/9] xen/riscv: introduce and init SBI RFENCE
 extension
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 07 Aug 2024 13:29:50 +0200
In-Reply-To: <97554cbe-7009-4bc9-8205-7a9e0f29aad0@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <fb2d24731f870378d79077be39b1bc19cc655327.1721834549.git.oleksii.kurochko@gmail.com>
	 <49d3a181-0830-4f55-83a4-c6c9fd54eb17@suse.com>
	 <b7433d25bb3ca7a0f4e54f561b450b5724fb46dc.camel@gmail.com>
	 <97554cbe-7009-4bc9-8205-7a9e0f29aad0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-30 at 11:17 +0200, Jan Beulich wrote:
> > > > +
> > > > +static void sbi_cpumask_to_hartmask(const struct cpumask
> > > > *cmask,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct cpumask *hmask)
> > >=20
> > > I doubt it is valud to re-use struct cpumask for hart maps.
> > Why not? Would it be better to use unsigned long *hmask?
>=20
> It's not only better, but imo a requirement. Unless there's a
> guarantee
> by the spec that hart IDs for any subset of harts are sequential and
> starting from 0, you just can't assume they fall in the [0,NR_CPUS)
> or
> really [0,nr_cpu_ids) range. Yet without that you simply can't
> (ab)use
> struct cpumask (and btw it wants to be cpumask_t everywhere).
>=20
> You may want to take a look at struct physid_mask that we have on x86
> for the equivalent purpose.
Could you please explain me why factor 4 is used in defintion of
MAX_APICS and why 256 ( is it a maximum number of APIC IDs can be
supported in the system? ):
  #define MAX_APICS     MAX(256, 4 * NR_CPUS)

~ Oleksii

