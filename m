Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0909C7D4FF1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621909.968811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGgM-0007Mw-7V; Tue, 24 Oct 2023 12:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621909.968811; Tue, 24 Oct 2023 12:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGgM-0007K9-4b; Tue, 24 Oct 2023 12:38:50 +0000
Received: by outflank-mailman (input) for mailman id 621909;
 Tue, 24 Oct 2023 12:38:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lhve=GG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qvGgK-0007K3-PG
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:38:48 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46c6e717-726a-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 14:38:47 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507a29c7eefso6603068e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 05:38:47 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a056512341400b00507b0b9145fsm2114206lfr.177.2023.10.24.05.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 05:38:46 -0700 (PDT)
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
X-Inumbo-ID: 46c6e717-726a-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698151127; x=1698755927; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LmMiDW7+6SN7TaMQM2K79q68rbUeHhcerC6jTnyQZcg=;
        b=mLY+z5wwc3EEjuOmjiWLgkzkcjc8KFcGrL2T/twtr4SavINPEjhbDcfo6MMdJOhb+Z
         cykPrcfQMrFNpRkNcriDZaagu9QktCq8nOEMFPHja7FflAFiICWMyOYllOpWpajc5XdD
         QvnqmDfwj31z4kzOag5AW3w34DnUeNTQmCbZO2MIRZhpr2kvEQdV1VMem0UDKcwbBiIc
         GyW+AsEhwBOi7pRrfJwMRKXJsOy+062AP0Nmqq7ObM8D1v0DLzmkk37pgB4SonQSGivX
         NACwQ92e3VyS+2BEoW7+kWmrAvU2ssOI4VBZC4y3ySoxn2JXxsktUu01cmgo48voJJj7
         kHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698151127; x=1698755927;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmMiDW7+6SN7TaMQM2K79q68rbUeHhcerC6jTnyQZcg=;
        b=MtGZs8rybRpFglWr96bvDJwODbwUNTwS8cO2+L8lTEjrjw0aT9UFYtpGFWZM+gRdlz
         +BaXN+5tunqHJ8cPeS2noAWrRbJsHn6IbQsAgBuMWSjjdKW1unnfeamh11UOpuJ9e02a
         gvi+tpfmQsB5S0UMENznJG7voeHlytOHoXvoK57W/62o87E0lrIeg/ZLQajxidr6d0ID
         FatVTwza/ObZc9+IV2RsvOPkBnuzbT3RrlLuohEYR2VzxPuFSAKh/g622m4MPIY/jpga
         7n1xxJ34IF1TO/MrGW6Gab/xY3v4F8urZ78npgEgcjENCeyd1yqPJpZySBtlSrH5bPdb
         JPyA==
X-Gm-Message-State: AOJu0YwCXwlsKlfRTUREntjEjSqaoGoS8cblQeQ6c7U9vfOXgp5wxJVq
	LIPt2HC/P+rDNo+klt7+JlY=
X-Google-Smtp-Source: AGHT+IGkyIa5m/EZXrE0erN3KoYm0FuSM9HHFEs7cYn8u09WEK9ZWNqMCnAQ2jfuxr8jI2mkJn1RqA==
X-Received: by 2002:a05:6512:2150:b0:507:a70e:c619 with SMTP id s16-20020a056512215000b00507a70ec619mr4424634lfr.67.1698151127119;
        Tue, 24 Oct 2023 05:38:47 -0700 (PDT)
Message-ID: <0345610b7daf219f286ecdd308a6556ee36eed7b.camel@gmail.com>
Subject: Re: [PATCH v1 12/29] xen/asm-generic: introduce stub header pci.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 24 Oct 2023 15:38:46 +0300
In-Reply-To: <b2ed1c50-6e55-7d89-aaa4-e0f23d5b4da8@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <597a482c70fef196e245a5d898ea6314a0c479ca.1694702259.git.oleksii.kurochko@gmail.com>
	 <d4dca6d7-ac54-beac-26fc-5eaf80783a73@suse.com>
	 <0da7452e0c62dcdc5a0e1185b9f99cdb3d7393c9.camel@gmail.com>
	 <b2ed1c50-6e55-7d89-aaa4-e0f23d5b4da8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-10-23 at 13:58 +0200, Jan Beulich wrote:
> On 23.10.2023 12:50, Oleksii wrote:
> > On Thu, 2023-10-19 at 11:55 +0200, Jan Beulich wrote:
> > > While more involved, I still wonder whether xen/pci.h could also
> > > avoid
> > > including asm/pci.h when !HAS_PCI. Of course there's more than
> > > just
> > > the
> > > #include which then would need #ifdef-ing out.
> > It looks like we can get with #ifdef-ing. I'll push a separate
> > patch
> > for xen/pci.h.
> >=20
> > It will probably need to remove usage of <asm/pci.h> everywhere or
> > #ifdef-ing it too.
> > Which option will be better?
>=20
> What's "everywhere" here? The only non-arch-dependent use I can spot
> is in xen/pci.h.
It looks you are right.

I wrote everywhere because of "xen/drivers/passthrough/vtd/quirks.c"
but it is arch-dependent. So  , yes, only xen/pci.h should be updated.

~ Oleksii

