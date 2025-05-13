Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E786EAB571C
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982921.1369286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqcD-0003N8-BE; Tue, 13 May 2025 14:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982921.1369286; Tue, 13 May 2025 14:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqcD-0003Kx-7p; Tue, 13 May 2025 14:28:17 +0000
Received: by outflank-mailman (input) for mailman id 982921;
 Tue, 13 May 2025 14:28:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wJrs=X5=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uEqcB-0003KU-Iu
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:28:15 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80b26f1e-3006-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 16:28:14 +0200 (CEST)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-b1fd59851baso3733209a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 07:28:14 -0700 (PDT)
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
X-Inumbo-ID: 80b26f1e-3006-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747146493; x=1747751293; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHN+rERbkNjNisqj0SbLVcFdYGqHAB7CnN/WtcaKnRU=;
        b=F/HnAA3UDWCR384Ci5QTOQ5OmalYLCQRjL8QU1fPAmc40RxqSDZeCEDRmbuI0aBmlc
         sxzTD1C6xxGxuBqG9dI9PtbFI+gErbvxWsZpKhre8C+UUVtogIM4lT2kuRj8qOoXczNv
         n1iSYSHLdiHp2EQrpgtp1F6bI//QzZrRfa4xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146493; x=1747751293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHN+rERbkNjNisqj0SbLVcFdYGqHAB7CnN/WtcaKnRU=;
        b=XXZfmKlhpoaE+CsApqzTVUjxEwdgeOCzaVmxaccd5n1oFPuH0FSiHk0VAEFTAJvJLM
         KCsm6CDypi3Mo0ntD+r++HjrnN2rF6sj5qrIA92cZBoebbKjVqcVwO14dT7C4Aqc+CZd
         HgvnzAWjZJp4eR7TMqHKtO9uGqzsBLqZWR8kiWe6RkPL0dR4t04ampKQwuL+XraSGA44
         NzMOF78MGCu+VLTBVv82T9FDa6m0xrWxO6CzUFjolkb5xirSE8vDNdvoZmPdiGadPGil
         6jfoG0O13o08zL1EB2OhrM5W+L+iwIZa4yxJpeqNCov95OHEtzD4GoyiFsPHYBEoACGy
         RUng==
X-Forwarded-Encrypted: i=1; AJvYcCW/GJb+D6+yITeDyW2Zj9Ro42gXaD+9m9EucPJM0jClHciGoFyvilxM1nh8z2rwD+CwezcKd+e2rsI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzn/dKEGPDzeX49ukFR85NlUwTglpRmSleH98Gt/IqtUEi2aInL
	Stdm6MeKcFkrysW7SNtiV6rQAU3nIRrTyypwYRPV6Sgyy281q1U7rw5qAL/+/ARYSb7YyIKbI6a
	KOQ3Fg4vA0lA4mMgKOlDUrWHKlk4/OLtpzHXShQ==
X-Gm-Gg: ASbGncsLEqaZYlPvTtfpjQO++Mr2ryuNJ4aZdBgwx6SLNufpXh+Y00LqwMGvfsuLu1V
	6cb5OTmSxzIjy0kLVCb4jphS3l42Q0oEiogl1jUxXVQOObSTb4Ar0+M+Jvf10pw1W5Qb794kdLi
	h3CcRgK+43mF6Es7uQW5sCvu1/khpC7NXv3SduQ2QLDg==
X-Google-Smtp-Source: AGHT+IGyDWaqSWWeqquZR3D/gciySSJwzgvBR1qJNrT3L7QL0wdITnGw51N9cxxJeu7JzflIIKnfWGuz856TGxSsryI=
X-Received: by 2002:a17:903:230d:b0:22f:c530:10a with SMTP id
 d9443c01a7336-22fc8b417d0mr214663775ad.20.1747146492709; Tue, 13 May 2025
 07:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250506162510.1676425-1-kevin.lampis@cloud.com>
 <db6316fb-89bd-4891-a4ff-2a13feda112f@suse.com> <CAHaoHxY4W2bbi3i+R_-tk7PG+4s2OdU9OSf1+o1wDXTvMBJozA@mail.gmail.com>
 <504f0be0-91fd-4847-8fcd-505771674814@suse.com> <CAHaoHxYojvmAe_jtwjHzCMKGKa_0fkGc-cbypRpKCRFQt0sbHw@mail.gmail.com>
 <55e73266-7727-4a1c-93e8-dd69712d64d2@suse.com>
In-Reply-To: <55e73266-7727-4a1c-93e8-dd69712d64d2@suse.com>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Tue, 13 May 2025 15:28:00 +0100
X-Gm-Features: AX0GCFs2eP3siBmvRxx5ydJBqMn_ZFmovVMQb3dQqbW7aim10IbqV_kchc3iVZ4
Message-ID: <CAHaoHxbvT5dbhVMnrPoWq3ma-maeLJh56N--B7svMXU+gY2Yrw@mail.gmail.com>
Subject: Re: [PATCH 3/4] Add lockdown mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 12:09=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
> I would like this to at least be considered.
> I don't like that custom command line parsing very much.

I understand. Parsing code can be risky.

In this case I think the code is small and simple though.

My concern with asking the user to always put the `lockdown` argument first=
 is
that it opens things up to user error.  I am not aware of any other project
that does this.

