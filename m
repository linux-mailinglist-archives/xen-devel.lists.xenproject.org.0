Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2AC794051
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 17:25:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596675.930655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qduOt-0005tY-B8; Wed, 06 Sep 2023 15:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596675.930655; Wed, 06 Sep 2023 15:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qduOt-0005rG-84; Wed, 06 Sep 2023 15:25:03 +0000
Received: by outflank-mailman (input) for mailman id 596675;
 Wed, 06 Sep 2023 15:25:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UMkA=EW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qduOs-0005r8-3T
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 15:25:02 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bb1d0e1-4cc9-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 17:25:01 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bcd7a207f7so58197321fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 08:25:01 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a2e3a12000000b002b9e501a6acsm3470953lja.3.2023.09.06.08.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 08:24:59 -0700 (PDT)
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
X-Inumbo-ID: 8bb1d0e1-4cc9-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694013900; x=1694618700; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RvaN4WB3VsgURhvKELCNkBKDcfj/od8t1vh2UoJnoqI=;
        b=jx+9+PY9hK3+2yYJ9MwIsrtH4oiT9tUKtziXQ7t9nTLyt/RiqxiY/9R+RPxEKmEo6f
         aHOFhPPIkFroE9mKu5dFv3pKUvKiHz7dWfvuYLyA8SZJaKbPXuL9pU9g9Izx+1U7JzBh
         XhhzZLgd8yJBcveRypYOkcIxdBl6lQrDvWv7NJxJ2Y2hXJUXtpEZO/OONwuV/GYHmgwA
         n8jGdmH4dPMZ4C4oqFFJcOMf1gBRY4t24lexgMWJmj7is7WbgOOvs20J4ksvUW5n8Ha2
         eH9wZ8hg1t4f2p9OwV9wX21yga7LHq190dc7cFgBftYQI5wR5kqPk52CW0f1eZn1zJIA
         bSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694013900; x=1694618700;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RvaN4WB3VsgURhvKELCNkBKDcfj/od8t1vh2UoJnoqI=;
        b=cajc3dyPWdmaXqAFRvl/f8rMUe45L9el/Xponfh6u2Lba6Wh7g3r9e+xUzJfT3pIH0
         4xQIdaXNL0Zi+91No0gAXpJvw9SkjhtqiFCdFMAd5jXhzinCRPE8QBxXPZiW1qU945w6
         4AzD+soOo/hZVvNncUPVxJpJrOQw9sfdFkZUp5VndCBotGwK3PPR2mZ9FIcuY3hHhZG6
         dZ7Sp0tM3CnNSR3J4f2+VpvFhcHLd0Qn8qTuIvnI0QmFi1M5W0zqEtu+b38MfYX7Towb
         ynDcAONou1lyZIC1c6oGvwZ5OpXIPVf0H6GiPQ73fbBnfv+07LL7QDuhvJVV/y2FPJme
         neXA==
X-Gm-Message-State: AOJu0YxInWmap1TJRAKVv7De97ovvzpVNzrUZekPShUyv/6K17bfuIbm
	mqQVCFdUH7GdhR+s58soERY=
X-Google-Smtp-Source: AGHT+IEU5yOE1OiSsrfJXpKU0FM2PieDA0I2N+E8vnaY5iOr51Gh5ciVJKYFfAWGOal0k47qsNgD+g==
X-Received: by 2002:a2e:909a:0:b0:2b6:d89e:74e2 with SMTP id l26-20020a2e909a000000b002b6d89e74e2mr2630846ljg.7.1694013900299;
        Wed, 06 Sep 2023 08:25:00 -0700 (PDT)
Message-ID: <286df5d32b082675c71af3f8bd1b70d747969738.camel@gmail.com>
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
From: Oleksii <oleksii.kurochko@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
  Shawn Anastasio <sanastasio@raptorengineering.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, Jan Beulich
 <jbeulich@suse.com>
Date: Wed, 06 Sep 2023 18:24:58 +0300
In-Reply-To: <32993819-b4b8-4ee3-bbb9-823ee7a46722@perard>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
	 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
	 <731b436d-748c-092d-0bec-dcea5bdaed29@suse.com>
	 <66fcd43cbcb176f13b5fe2aad53f659feefb9667.camel@gmail.com>
	 <627a5863-0ced-956d-f76a-0547cd46c2bd@suse.com>
	 <32993819-b4b8-4ee3-bbb9-823ee7a46722@perard>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-09-06 at 16:06 +0100, Anthony PERARD wrote:
> On Wed, Sep 06, 2023 at 02:40:29PM +0200, Jan Beulich wrote:
> > On 06.09.2023 14:28, Oleksii wrote:
> > > On Wed, 2023-09-06 at 14:16 +0200, Jan Beulich wrote:
> > > > You've removed quite a bit of functionality, comparing with the
> > > > Linux
> > > > original. May I ask why that is? What they have all makes sense
> > > > to
> > > > me,
> > > > and looks to be useful down the road.
> > > I decided to take only minimum needed now but if you think it
> > > would be
> > > better to use the latest Linux's Makefile.asm-generic then I will
> > > update it in the next patch version.
> >=20
> > Unless there are things getting in the way, I indeed think it would
> > be
> > better to take the whole thing largely verbatim (a few edits are
> > unavoidable afaict).
>=20
> Yes, I think it would be useful as well to take most of the file from
> Linux. At least, this would include the "$(unwanted)" variable, which
> is
> used to remove old wrapper when an header is removed from "generic-
> y".
> But instead of the "-include $(kbuild-file)", could you include
> "$(src)/Makefile" instead like we do in "Rules.mk"? We don't have
> $(kbuild-file) macro anyway, and I don't see the point in using files
> name "Kbuild" when "Makefile" works and is enough.
>=20
Thank you for your feedback.

I'll take into account your suggestions in the next patch version.

~ Oleksii


