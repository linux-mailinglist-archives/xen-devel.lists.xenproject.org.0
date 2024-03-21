Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A0C88569A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 10:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696280.1087077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEnw-0004Jk-8k; Thu, 21 Mar 2024 09:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696280.1087077; Thu, 21 Mar 2024 09:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEnw-0004I0-5G; Thu, 21 Mar 2024 09:33:44 +0000
Received: by outflank-mailman (input) for mailman id 696280;
 Thu, 21 Mar 2024 09:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvWl=K3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rnEnu-0004Hu-C0
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 09:33:42 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a65be5e-e766-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 10:33:41 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso86171166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 02:33:41 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a17090634d900b00a46196a7faesm8213029ejb.57.2024.03.21.02.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 02:33:40 -0700 (PDT)
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
X-Inumbo-ID: 1a65be5e-e766-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711013621; x=1711618421; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6XxgONGD1Pq+jv5Fx9OjaGUQAF0zMYY2MbV/Bc5o+n0=;
        b=DNjqp+TQJRpFm7n7WtzpOrPJMNfb4fomWBFl1SCY4yXR4aaQnh/0NkiCKF67KmURZe
         RyC66LU1pbThklQfM8psYXGGrXQdIPq7wIXSjFQchmpPbX2qk0C9Gjh4sSjNm+Gbzaej
         zvtQAb5//XXC3kLiqjGLg+JZzs1htoy1Gp/WGAWtqTWlvKqD1nAWX0wMPDMWUwYE4cud
         TN7VjDo4EG3dBiMncal50mgXYjlTawv5hQE4dEA+sTXDLCAYxiqbz8HnNSeh2WA4m0GR
         ihHpt70UiTgVTkUS1aB/RHL6WZq6Idfqx3vByA5zY6XH3WFA9qbgiUi9J+JGYcsAdf+g
         GDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711013621; x=1711618421;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6XxgONGD1Pq+jv5Fx9OjaGUQAF0zMYY2MbV/Bc5o+n0=;
        b=Mq0omD4ED8j+N33xaC1FZkbGZwIaXuYRDQgc7io2+Bu66MZIuxME+P18n2S44bErjB
         M43bCu8wh2D1kn+njMiBmewWeUylyTpre6ZA7J8N+LMDDrI4WU48Jx694eHE/aplX0Qg
         XymOqpsDq/ib4vuA3wGiJ4lQKLL1kXMZqM7x+M6rV0pSEHxFnYuAIA34SfsUS0ePGHmV
         ZnqQ355hQGLY3eAb+NP9+P8EqnmfPy7JwKSz8uuFJqJ3pW8mVxMRZWMTfIE20ULglt0O
         JpjY8ndRnjNkDuXZCWiBbbtP14FZ1jTDGWAcUa9KErnSN+I+ErpJx+1dRCNMAjrrerku
         IzoA==
X-Forwarded-Encrypted: i=1; AJvYcCUaEmIhQgogMIyuZ2zuO/O8wbDaTTwub6eziCNj1n0Qprkex6tMEc6OI7JONsbGr+r5DQkduIffpqj39Y32Y9nL0TQkHmtkhn3hCXEfB1s=
X-Gm-Message-State: AOJu0YwgqoH2PgDQGbPPJhUvKNhPhrOd8OEHwGDrxp3UaqSjH+PyfUms
	VoPAlN4RkvXufz2wP02CLBMhgAf45jJwjRGR4TCkFyGhnNz1tSfh
X-Google-Smtp-Source: AGHT+IEumABGjVGRwUUsUSS+WEV2jHgR07iYAQu5NaqjhulBOO8ny9uLFV2CCPntjUNKaSjG4Is8/w==
X-Received: by 2002:a17:906:ef0c:b0:a46:c01b:7e2c with SMTP id f12-20020a170906ef0c00b00a46c01b7e2cmr9375508ejs.75.1711013620569;
        Thu, 21 Mar 2024 02:33:40 -0700 (PDT)
Message-ID: <eebf69a640c58e423379cf5f3bb4b7ed425160b5.camel@gmail.com>
Subject: Re: [PATCH v6 06/20] xen/bitops: put __ffs() and ffz() into linux
 compatible header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, Rahul Singh
 <rahul.singh@arm.com>,  xen-devel@lists.xenproject.org
Date: Thu, 21 Mar 2024 10:33:39 +0100
In-Reply-To: <a4d36c0f-d3a3-4d64-a62e-b631a4ece9a8@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <8bc35da4a9fd44d2dcf9677dcc99334eb7142581.1710517542.git.oleksii.kurochko@gmail.com>
	 <a4d36c0f-d3a3-4d64-a62e-b631a4ece9a8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-03-20 at 16:42 +0100, Jan Beulich wrote:
> On 15.03.2024 19:06, Oleksii Kurochko wrote:
> > --- a/xen/lib/find-next-bit.c
> > +++ b/xen/lib/find-next-bit.c
> > @@ -9,6 +9,7 @@
> > =C2=A0 * 2 of the License, or (at your option) any later version.
> > =C2=A0 */
> > =C2=A0#include <xen/bitops.h>
> > +#include <xen/linux-compat.h>
> > =C2=A0
> > =C2=A0#include <asm/byteorder.h>
>=20
> Hmm, no, a library source would better not include this header.
> Surely
> the ffz() can be taken care of locally here?
Considering that ffz() is only used here, then it makes sense to drop
ffz() from xen/linux-compat.h> and defines it here as:
#define ffz(x) ffsl(~(x)) - 1

~ Oleksii

