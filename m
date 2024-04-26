Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AECE8B321B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 10:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712514.1113235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Gid-0007sn-1P; Fri, 26 Apr 2024 08:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712514.1113235; Fri, 26 Apr 2024 08:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Gic-0007qg-Uj; Fri, 26 Apr 2024 08:14:06 +0000
Received: by outflank-mailman (input) for mailman id 712514;
 Fri, 26 Apr 2024 08:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mvt6=L7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s0Gib-0007qa-7s
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:14:05 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f224db2e-03a4-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 10:14:04 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-516d2600569so2262502e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 01:14:04 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g28-20020a0565123b9c00b00518be964835sm3064092lfv.53.2024.04.26.01.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 01:14:03 -0700 (PDT)
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
X-Inumbo-ID: f224db2e-03a4-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714119244; x=1714724044; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xvcLmv58SuTMxxeH61cyDu/Pqz4IEAUHw7A4w1DHnyk=;
        b=cxq0a8c86QsQdKEzMyL6mkRJ4gBMEZN+2ukwxyk061PB0tiaC+spy1c9401DnMkBfL
         3uSMBIClDeq+mRQGTgUIe/S6AtuYvgftVi/Y5B7BohncwlS2JhugXj5fZfQviPpYnHWE
         ulvSCWTrrL7oFotUOSw4ZHek0mNiYqZvJe6fhcf1U6sgGMiHH1cHaXmiJZqQQZchVdeG
         FI9GwjxfLCJXZrak21ubXZRnfvCadH5XHQ4fgReYQHHyUlXcIq5oFF5EzARjMi44sVtk
         aLsQ1RDDhnAbiJrFQwgfJOXA54aE3/A+tOrOQVhznS427L3y4ccDI+bICDPmM7FEIpnI
         z6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714119244; x=1714724044;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xvcLmv58SuTMxxeH61cyDu/Pqz4IEAUHw7A4w1DHnyk=;
        b=YBNVgkYdNYtySb22ICS3HoYiZD2T3x1NE81OHrJ0/mSGSdGcUdMq9vGiie99mgB5b9
         5MWigKFGoKNtpdA6t5erKINPc/DnMI5D5ho93kNAX2lUauWffHRnjgfet+V4wIDscC3q
         9V0bcQOfZ52GRBkpRwmvsvCHqFbrye/loD5INhDw2LEGbymxfRGUNo3wln6q1uvLrmxC
         zAYMR35cQUCuZfyNVUQ4qiOwKY2FElamKzapbpQRJu6E+Clto5gJtAE8/tLFOGR8Getf
         BCU5PZa1fuv3r2ifc2ik+oYnw26beKOddpZHw3CieZvC5uCbl+DNKTsPJF5l/q9cru3Y
         XNtw==
X-Forwarded-Encrypted: i=1; AJvYcCWClKPH7MMmXlfXPEBivmb202TKv8sCFa+aQxPH01DQPX5GaP6YtsB5ht7xPf4TxYziuIOi2hEiOdum+ddEsqtgJFdZlLQicyCVagPjNLQ=
X-Gm-Message-State: AOJu0YyzC9DsaGQ434MGA5wlj5Xgc3J3wGR1mOd/7LPMuVVFzKTu/AUW
	mrKwQIZgpc5I/RwKqFfMknYZYp2Dd1F4MXs7xL9aXvSp8w00Yq1O
X-Google-Smtp-Source: AGHT+IExfdDNjlRHuAHO/qqDBTeHvR6sbR8oAeeRF/jm+h0QhQhhxSkh3ZejN4lWOkVvKacS8u6+vA==
X-Received: by 2002:ac2:528c:0:b0:519:730:b399 with SMTP id q12-20020ac2528c000000b005190730b399mr1092310lfm.9.1714119243709;
        Fri, 26 Apr 2024 01:14:03 -0700 (PDT)
Message-ID: <367bcd4d7f501ce72a8c101dfd846e94682d4045.camel@gmail.com>
Subject: Re: [PATCH v8 02/17] xen: introduce generic non-atomic test_*bit()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,  Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Date: Fri, 26 Apr 2024 10:14:02 +0200
In-Reply-To: <3827c11c-6d47-411d-a356-871def4e5b30@suse.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
	 <1a0977e3cf5a2de9f760ca5ec89a0d096894a9e3.1713347222.git.oleksii.kurochko@gmail.com>
	 <3827c11c-6d47-411d-a356-871def4e5b30@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-25 at 17:35 +0200, Jan Beulich wrote:
> > =C2=A0 /* --------------------- Please tidy above here ----------------=
-
> > ---- */
> > =C2=A0=20
> > =C2=A0 #include <asm/bitops.h>
> > =C2=A0=20
> > +#ifndef arch_check_bitop_size
> > +#define arch_check_bitop_size(addr)
>=20
> Can this really do nothing? Passing the address of an object smaller
> than
> bitop_uint_t will read past the object in the generic__*_bit()
> functions.
Agree, in generic case it would be better to add:
#define arch_check_bitop_size(addr) (sizeof(*(addr)) <
sizeof(bitop_uint_t))

Originally, it was defined as empty becuase majority of supported
architectures by Xen don't do this check and I decided to use this
definition as generic.

Thanks.

~ Oleksii

