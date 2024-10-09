Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328579965B1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:41:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814085.1227188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTBf-0007lm-B5; Wed, 09 Oct 2024 09:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814085.1227188; Wed, 09 Oct 2024 09:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTBf-0007jG-8L; Wed, 09 Oct 2024 09:40:55 +0000
Received: by outflank-mailman (input) for mailman id 814085;
 Wed, 09 Oct 2024 09:40:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLvJ=RF=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1syTBe-0007f9-0n
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:40:54 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92ea7017-8622-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 11:40:53 +0200 (CEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5e8010de1caso792107eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 02:40:53 -0700 (PDT)
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
X-Inumbo-ID: 92ea7017-8622-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728466852; x=1729071652; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLLD7dJeuJ8pd00MMoDiXKTkd3DtIoaMfIr7BhT29AQ=;
        b=U/wkIk8QM3HDHNn33pmqyMU/pOpQkFCmioxdc5eY1xDP/V555v8xL/N78J5oRFXWng
         BJVuP9POBkURLidkV/emcMGBWJCgOp5slGDXpWM9D/shtZeUJOgPVBwN9wxuRPTeE9+b
         c0OqiU2pTYR7Q4ijwTHyLfUO0bmjeTRWyBmbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728466852; x=1729071652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLLD7dJeuJ8pd00MMoDiXKTkd3DtIoaMfIr7BhT29AQ=;
        b=daL90uZ1vWjF0+wcvvFQEt1I6grFPcnSfRyPibrfxT6iuGpX+FSLrmimp6AZlyp2HB
         6LQPdut2YaRnodsAM/95JpcxhfQH5zX+0sDVsbiaWUwycvkRPYWaCXhr/07x3hBaYMYp
         /vw2AknDq80jDtdgDDrhXqA8s18efrKpCeClGcH1bV7gBZXCo9G6Fevk8SqN5hKasWpw
         d1Y2R9yV5+cR3KjduIXOiKi91hYW4RC2ZcVojVzNc7K4lXGis5Q0cOEbnciECzZiU/m/
         3aUW/OZWc4+sZwwJ8NTeSpJ+looxxmQK7QEkGfH+ulnBshrsYc7ZeyJ9qOT77kstRIab
         2Y/g==
X-Gm-Message-State: AOJu0Yxo/UW5js1BL8BafsTCh3cUmDYf6Jlb6tQZ6Svut5VGsovRygbf
	aRdSV+GO1AjgVi726u4v1lhGK2a55qcHx1wU72BLrdZBrTgM7cVM1xDxr0xl7nRfnN1wFit+Aho
	RiFkSHnRoueVrOydAMwR2XAvHAtLM9eGrN+m6HQ==
X-Google-Smtp-Source: AGHT+IFWPkaUi9h6zUBavnSbjNvXfTeeQf/dGUI3WYFPNq79Qb4Bmk45eIzacdbSIMdALRFR/yqlXNTyIfjwXLZMGMk=
X-Received: by 2002:a05:6870:55c9:b0:277:e6bc:330c with SMTP id
 586e51a60fabf-288344d4302mr1066545fac.29.1728466851808; Wed, 09 Oct 2024
 02:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
In-Reply-To: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 9 Oct 2024 10:40:40 +0100
Message-ID: <CACHz=ZiQS5R3KCbJj7WBnv7WW8YM3AewkUVP4z8+D2rpgPfiiA@mail.gmail.com>
Subject: Re: [PATCH 0/7] types: replace remaining uses of __u{16,32,64}
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 10:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> 1: byteorder: replace __u16
> 2: byteorder: replace __u32
> 3: Flask: replace uses of __u32
> 4: x86: modernize swab64()
> 5: types: replace remaining uses of __u32
> 6: byteorder: replace __u64
> 7: types: replace remaining use of __u64
>
> Jan
>

For the series

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

