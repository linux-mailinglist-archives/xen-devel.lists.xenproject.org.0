Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34E49179D6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 09:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748420.1156130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNDX-0006F5-0W; Wed, 26 Jun 2024 07:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748420.1156130; Wed, 26 Jun 2024 07:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNDW-0006Bv-Sr; Wed, 26 Jun 2024 07:37:22 +0000
Received: by outflank-mailman (input) for mailman id 748420;
 Wed, 26 Jun 2024 07:37:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evFT=N4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMNDU-0006Bp-VB
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 07:37:20 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb6401e7-338e-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 09:37:20 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso7504049a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 00:37:20 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72575f409asm261618166b.120.2024.06.26.00.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 00:37:19 -0700 (PDT)
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
X-Inumbo-ID: eb6401e7-338e-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719387439; x=1719992239; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Au0IRdlDizwro1MrAZCGVztMGq5avE5KBRJ2mE0MKyY=;
        b=SEcRa6Zu5J3h8PnmbeWjtOkOPYrRmRqb5jGvedQN/OiZhwv5HpXgsSe7LTePYUsj4k
         aDp3VgGPusqijkeZqRZM1+eGKn2jJKpJi4ItEmZaRLA/WWQTFEx8AoRCyXhli8zNYdvI
         Eo2mMRgTvrNKJOcHJrTlbEyRymIa2IcTsGqJ2hAHMgSyJEuoPvDGCfnDspphQfvmcOUI
         UH/hYaknV+F0sVPZmwnNG+qHmcgSUP5cZqAWkaW7UhgcyWaRDpp14K7d+5PD2EIyxYzZ
         Edsh9epi6GPjzGuBl+Kfi6nzR2zM0DdtQm29ikqajFIE5S7YhYnJhx28Xlzp6X0T7AhA
         ieVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719387439; x=1719992239;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Au0IRdlDizwro1MrAZCGVztMGq5avE5KBRJ2mE0MKyY=;
        b=GgI/9KF7J24Y6Q4opIz/It/BsHMeHutSynHQYarp02putNP365nMdvixAjGk3r1Yvy
         cqEhpOzYtzpVKjY4Lw9MGQUaxv8VDYgI0ia9dr/va0G6HP09pZO2c7GbQ06PT991fmCO
         dnFvzIakRoQo08SAOOcJvcxk9pFR6fUhuqdesTC+gGPv6QP7qGI2hg3kaQlyXvB39noy
         InXa3Rl6xEizmvfSCFKIW+GbOflibVb/g36bMO+7BCyxLI1uhrizs6BiPDFdY9L2fR77
         SDjrzMO6/lypZTHvrtduV4EAv/VjNRtMcIoQx02R1qFU87f7RXHfFmZPiLKiEq6SPE+W
         whdg==
X-Gm-Message-State: AOJu0YzwAuLNTS31HqHVk7yz3dRFiozbooYk5WxYHznPWXqYDzd9i480
	gQd+MVm2lXQdnOcQ901DRmFQl9l4I0+H8bMojp3lUnvXxj9cknPhoVmad7VL
X-Google-Smtp-Source: AGHT+IFGHEbo7KQYEYlrntH3MsusRkr1VJK15qTC8jVP6OIO9DbcqJsMDX8faMFIcrg5HEO47pdLJQ==
X-Received: by 2002:a17:906:2711:b0:a6f:b3af:2add with SMTP id a640c23a62f3a-a7245badbf4mr595210066b.45.1719387439420;
        Wed, 26 Jun 2024 00:37:19 -0700 (PDT)
Message-ID: <c6aeb6007ead36afaf48ceef1070e5ec5a2ef88f.camel@gmail.com>
Subject: Re: [XEN PATCH for 4.19] automation/eclair: add deviations agreed
 in MISRA meetings
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Federico Serafini
	 <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>
Date: Wed, 26 Jun 2024 09:37:18 +0200
In-Reply-To: <alpine.DEB.2.22.394.2406251850281.3635@ubuntu-linux-20-04-desktop>
References: 
	<4a65e064768ad5ddce96d749f24f0bdae2c3b9da.1719328656.git.federico.serafini@bugseng.com>
	 <alpine.DEB.2.22.394.2406251850281.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 18:59 -0700, Stefano Stabellini wrote:
> > +-doc_begin=3D"The conversion from a function pointer to unsigned
> > long or (void *) does not lose any information, provided that the
> > target type has enough bits to store it."
> > +-config=3DMC3R1.R11.1,casts+=3D{safe,
> > +=C2=A0 "from(type(canonical(__function_pointer_types)))
> > +=C2=A0=C2=A0 &&to(type(canonical(builtin(unsigned
> > long)||pointer(builtin(void)))))
> > +=C2=A0=C2=A0 &&relation(definitely_preserves_value)"
> > +}
> > +-doc_end
>=20
> This one and the ones below are the important ones! I think we should
> have them in the tree as soon as possible ideally 4.19. I ask for
> a release-ack.
Just want to be sure that I understand deviations properly with this
example.

If the deviation above is merged, then it would be safe from a MISRA
point of view to cast a function pointer to 'unsigned long' or 'void
*', and thereby MISRA won't complain about code with such conversions?

~ Oleksii


