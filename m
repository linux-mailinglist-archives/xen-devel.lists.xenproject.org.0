Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E720685D12F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 08:21:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683845.1063474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgux-0005MP-72; Wed, 21 Feb 2024 07:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683845.1063474; Wed, 21 Feb 2024 07:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgux-0005Kt-46; Wed, 21 Feb 2024 07:21:23 +0000
Received: by outflank-mailman (input) for mailman id 683845;
 Wed, 21 Feb 2024 07:21:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rcguv-0005KU-Sy
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 07:21:21 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cefe04df-d089-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 08:21:19 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so87009281fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 23:21:19 -0800 (PST)
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
X-Inumbo-ID: cefe04df-d089-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708500079; x=1709104879; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNI40zGYNZp2oHOueSeNqiaK3+ljK33pV5I9xmzz7XY=;
        b=D9teRyOQJbZPvf70TNTAx2hvrHywfwHPkS6mk1qRJKb4hMys+uzsF7z9E3wV9p6OgK
         1kqYLU/OZrOU61Scplw3yf88a8ZQX5LGleI9V29pQHcltFnkc7KThwWpY0UPAYy+IjCi
         SFYI7peyQ6OSrdbF5+hRLFqo2wlXKSE14+HTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500079; x=1709104879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNI40zGYNZp2oHOueSeNqiaK3+ljK33pV5I9xmzz7XY=;
        b=CGcyfbHCnt0HJZgY6LsdbyQtkXszsgS+AEKf5vEfmsh54ERF2NCLLgWhocjmyNytph
         nBet87ZGztbJefYu9usEIDNQgAbW1oeIkUp03iGjJ0mvgbbCm7tEUJRpXAzLXdpDqdkp
         nQXCHwKx099D6k81Ph+SOHUP2CpGiTciCxv/u3opBAC9/Lpsm+39RMZgg8FiOmnGt+XO
         m7JS5I6ESHDt0d6MpDgbTB7R75eGhSOKb5+SkBK34+dKhihaPPJneK0PAr2f1EMmtO7e
         dHOXltgquXQMhrqZ6SiX7lTGzbPd/q/qqnIu3NMmaIHor8jDNS+ofToCYySfa13Kf5U1
         Ltzg==
X-Forwarded-Encrypted: i=1; AJvYcCWZrWMd9QIIBinmLM1WygnzOpMj9DA1VLSDsC5ZAL3+m6hlbxg2Pl+mlYawBb7HPmfaUXBgIbnT1291Cuf1cUb4oiZiD6A6HcEDUf/MiHA=
X-Gm-Message-State: AOJu0YzGfKC06JJTYPYC/h9fR2IbJBA3+ilxqopWFCd8AwarpQw+ZDuc
	KgXw09z2vBhyxhn+8yn3TraenJX0CLEyHPBfchQzbvdXeOSh0GaBjTLPsOy6EklJZ6nT4Ylujte
	i7YQ8j8tEPPHMQRvvB/BjCS/LBTma+Md+wEs0Zw==
X-Google-Smtp-Source: AGHT+IHCNbYIYiR9zMt9JbV6+ZAeTnQxtMRbzmNKD8EWYTSR+RhNij9svb020PfvWJD+Z6gamzvlxnlGL+JYtqvBGhY=
X-Received: by 2002:a2e:880d:0:b0:2d2:4017:d79f with SMTP id
 x13-20020a2e880d000000b002d24017d79fmr4540584ljh.37.1708500079293; Tue, 20
 Feb 2024 23:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-4-george.dunlap@cloud.com> <046575d2-bc39-4b0e-a656-c501ee1ae4e6@suse.com>
In-Reply-To: <046575d2-bc39-4b0e-a656-c501ee1ae4e6@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 15:21:08 +0800
Message-ID: <CA+zSX=aNL30KP_sCC38DJ0bS=8f2e-i17SuUfkXKzP4b6wx0tA@mail.gmail.com>
Subject: Re: [PATCH 3/6] xen/hvm: Move other hvm_function_table booleans into
 the caps bitfield
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 12:08=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 06.02.2024 02:20, George Dunlap wrote:
> > --- a/xen/arch/x86/include/asm/hvm/hvm.h
> > +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> > @@ -86,20 +86,19 @@ struct hvm_vcpu_nonreg_state {
> >  struct hvm_function_table {
> >      const char *name;
> >
> > -    /* Support Hardware-Assisted Paging? */
> > -    bool hap_supported;
> > -
> > -    /* Necessary hardware support for alternate p2m's? */
> > -    bool altp2m_supported;
> > -    bool singlestep_supported;
> > -
> > -    /* Hardware virtual interrupt delivery enable? */
> > -    bool virtual_intr_delivery_enabled;
> > -
> >      struct {
> >          /* Indicate HAP capabilities. */
> > -        bool hap_superpage_1gb:1,
> > -            hap_superpage_2mb:1;
> > +        bool hap:1,
> > +             hap_superpage_1gb:1,
> > +             hap_superpage_2mb:1,
> > +
> > +            /* Altp2m capabilities */
> > +            altp2m:1,
> > +            singlestep:1,
> > +
> > +            /* Hardware virtual interrupt delivery enable? */
> > +            virtual_intr_delivery;
> > +
> >      } caps;
>
> Nit (spotted only while looking at patch 6): You're adding a stray blank
> line at the end of the structure. Further I expect virtual_intr_delivery
> would also want to be just a single bit?

Oh yes, good catch.  (I kind of feel like ":1" should be the default
for bools, but hey...)

I'll fix up this and the 0/1 =3D> false/true thing.

 -George

