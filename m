Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99B1916141
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747451.1154865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1aL-0002Ui-6A; Tue, 25 Jun 2024 08:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747451.1154865; Tue, 25 Jun 2024 08:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1aL-0002S5-3T; Tue, 25 Jun 2024 08:31:29 +0000
Received: by outflank-mailman (input) for mailman id 747451;
 Tue, 25 Jun 2024 08:31:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM1aJ-0002Rz-SY
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:31:27 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 505c75f3-32cd-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 10:31:27 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57cf8880f95so5967009a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 01:31:27 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a710595adedsm345564866b.214.2024.06.25.01.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 01:31:26 -0700 (PDT)
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
X-Inumbo-ID: 505c75f3-32cd-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719304286; x=1719909086; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QodbRYMo8xFHcZA86cpi1TjCGnzTTG37nvSuuGeV5lg=;
        b=ZvPIHToGWm0RhDrHlqXUEWUmpL/tY9foIiIsWEt3oLFuMVl6cBSiq8iyHmjwZ1yGzl
         t3jIZl3ynp30dbZy33SHaHylrFOo1rZXMM2VE/su1zsk9b+kwfDVMLJYBG7h70xz635v
         fjIMjMiWkjnLkIxLgFN/g5RdGmy6K+D8eO838AfhJwlAnOlJmhs3t1Mlxf9hXk5x5IUQ
         PKFhr0825n0fnYgtp7U8GmIjnsGm/Q7vlHgdYYvT4Tz4WVj9qxuZAf3Kw9cIqwgNWNnz
         wf7BRWE547cEhQOpp/vA4lMfplpgGzxHPijkiCO3r6CDg+2fagDuIcZb0fM04RSAv3Vt
         UEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719304286; x=1719909086;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QodbRYMo8xFHcZA86cpi1TjCGnzTTG37nvSuuGeV5lg=;
        b=suZ3fK5PQ5E3Z5H4wUuyvr+hhJsVl8S2WuKJYiWWJrrGYfYb9Uhs02ieqFuUBNhgq/
         rewW41zU4Pn0YdiU59QeOru65AZU5jSnG6aK6IyUzChpi32RygctmkeB5h/xbHgGDwWb
         /LvjoHmVJpgwAL+C+hJHOdHIDu5x5Tu0/Z+sBlk1miHx3pmQknuKP17N+XOP7h0Jx6Vp
         c1ujmStoickkAVLfIFBMNehJfWoIsEUDLcAPbQpBcv9DSeHCb5uL26jRIC6dt1M1i+qK
         D0ak13OXbXaCJbD0OtmkssDDvYeZdlRgRz2JT+BxfBi26I/0mt+X23fKqlBWuhnr2m9Y
         1B1Q==
X-Gm-Message-State: AOJu0Yxu/nZop3HVnIC8JI+RM9IsvAWOS3+ZTFekxefEybay6NzTJMrp
	IqjM7jlKmW72JgNWyjycn/DLS138qtq90d0rEaMbsuPeo3DJt5I0
X-Google-Smtp-Source: AGHT+IFL9ntSB5sEcwZEDiLIhYt32n6soh/KCkpWzy58VElWLVEaEnYojK2OagUdKzPMAFkcsbL07w==
X-Received: by 2002:a17:906:99d4:b0:a72:6631:fe94 with SMTP id a640c23a62f3a-a7266320144mr208821466b.59.1719304286204;
        Tue, 25 Jun 2024 01:31:26 -0700 (PDT)
Message-ID: <25eb3ecdd1aa33af7b304ad4dd13f8561ab89761.camel@gmail.com>
Subject: Re: [XEN PATCH] MAINTAINERS: Update my email address again
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,  Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
  Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Date: Tue, 25 Jun 2024 10:31:25 +0200
In-Reply-To: <5238d3a6-c47f-4951-b839-a92c5ee4e571@xen.org>
References: <20240624094030.41692-1-anthony.perard@vates.tech>
	 <alpine.DEB.2.22.394.2406240927390.3870429@ubuntu-linux-20-04-desktop>
	 <5238d3a6-c47f-4951-b839-a92c5ee4e571@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-06-24 at 22:40 +0100, Julien Grall wrote:
> Hi,
Hi Julien,

>=20
> On 24/06/2024 17:27, Stefano Stabellini wrote:
> > On Mon, 24 Jun 2024, Anthony PERARD wrote:
> > > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> >=20
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> I guess this technically need an ack from the release manager. So CC=20
> Oleksii.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

