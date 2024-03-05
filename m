Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD29872607
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 18:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688883.1073611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhYxy-0000GT-OI; Tue, 05 Mar 2024 17:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688883.1073611; Tue, 05 Mar 2024 17:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhYxy-0000DN-Kf; Tue, 05 Mar 2024 17:52:38 +0000
Received: by outflank-mailman (input) for mailman id 688883;
 Tue, 05 Mar 2024 17:52:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4c3Q=KL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rhYxw-0000DH-IC
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 17:52:36 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2579fa64-db19-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 18:52:34 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so1033179866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 09:52:34 -0800 (PST)
Received: from [172.20.10.2] (public-gprs173058.centertel.pl. [46.134.15.67])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm6216422ejc.198.2024.03.05.09.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 09:52:33 -0800 (PST)
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
X-Inumbo-ID: 2579fa64-db19-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709661154; x=1710265954; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S6PY3p64Rq0HRsxx//H9v5T+vZVF7lFwR4YKvXX+DGM=;
        b=XmTOKlZiFpGN3NoTc5w7qXqCvA7vMHzGe2m5TmSk6Eu8q92s9I4SNOy9tBu6ur+Jcc
         qi5C75hEOSznTqkw8jSEmIPjcbZcHizCMJOoYSUyInQVT4PApgjUEyLvhVVjdany1d0V
         RI8y9vtAI63qeay998DQYee8YAhUgxAnBRT83UtH1Z1JjxFQskRMLFLGAxh4HOk4+3Hs
         BYVJvBw1AS/k50zoyfophoa2aLz+iCejqK+LpdbPjJAXaPfflcljWQ5gGPLQVsj3TaS9
         nfINJkDZi2jugL7JvekZMtDR8ll8dQBpBfN0ZWGfrZ3tjZ3uqvSkoQNtC/n+z2QH6wlF
         TQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709661154; x=1710265954;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6PY3p64Rq0HRsxx//H9v5T+vZVF7lFwR4YKvXX+DGM=;
        b=PD+TK21tJ+85olJ9oS+XKtguMS5FvzbbchRLK1cyk5x9oXykktHh/1v3V/51oxIN3Y
         HNkGheIgeqoXfzlJNVyBeHPWFFRwuNkndZN0vrIVILoUQYxSH4H0yUc3QKAMNDGgjr+W
         uYb5eeKQhHk/KrfdFvCCY9ub/8UQ9SyrlLt8jg2RJZ/BbsSqXoNQrV9y+dsltLjmBc2P
         /lw2/ww4e7VOHA//7N91uNMuD+tJdkQBtA7QDjZ/FSsBdzD0kCdCwcdN6bRXNu/D2br0
         hKIVQBnMb5H099KGquo5KjNoLArlgbzZ3uZyD6AeHMvaLbtEHFVRQ4jvvmmYpb2qFkmA
         Ut4g==
X-Forwarded-Encrypted: i=1; AJvYcCWdBc6mFngoQUpkbAjlv4aJAbhLbgr8AIGbLzDpFcsLLH5mQWxricX8dXDEuJXT8CmPAa7U21eo+AlKcz0TzULUrUuVuOs1CLayYDNBBQE=
X-Gm-Message-State: AOJu0Yyw0Qmq68uHiGkNTr86aKTU6CKBFQAp12fwjogN0JGGbrmo69oG
	o2K4WNC7v3fUpmSsUR4Gnxpbz6SXnlmapW3CRaFwTL83Q61Ox36H
X-Google-Smtp-Source: AGHT+IGnuY6622U2WMafCLcqzlJwdExDYBbuY31qiKUeymY9UXru1DQgyJKrOF5+4STEMkFPrfjZQw==
X-Received: by 2002:a17:906:6b91:b0:a45:b2d0:87e6 with SMTP id l17-20020a1709066b9100b00a45b2d087e6mr324509ejr.44.1709661153732;
        Tue, 05 Mar 2024 09:52:33 -0800 (PST)
Message-ID: <be1ebfe03d3a162fa7bc92f1d8359ca8c06075c9.camel@gmail.com>
Subject: Re: Xen 4.19 release status tracking list [ March ]
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org
Date: Tue, 05 Mar 2024 18:52:32 +0100
In-Reply-To: <af5f2886-3456-40e3-8477-980f6e342a37@suse.com>
References: <91cc3f76029357f34bd5ca21966c42f0acb73720.camel@gmail.com>
	 <af5f2886-3456-40e3-8477-980f6e342a37@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-03-04 at 09:10 +0100, Jan Beulich wrote:
> On 01.03.2024 18:21, Oleksii wrote:
> > =C2=A0 * limit passing around of cpu_user_regs [
> > https://lore.kernel.org/xen-devel/ebc330a9-eafa-4858-b5cf-5694c4da911d@=
suse.com/
> > ]:
> > =C2=A0=C2=A0=C2=A0 new patch series version was sent.
>=20
> This was committed already a while ago.
>=20
> > =C2=A0 * [PATCH v2 0/5] xen/livepatch: fixes for the pre-apply / post-
> > revert
> > hooks [
> > https://lore.kernel.org/xen-devel/20240227112528.4540-1-roger.pau@citri=
x.com/T/#m620c827bd097522d9d87b7f6511bc1599f6a8c84
> > ]
>=20
> This went in last week, I think?
Yes, you are right. I overlooked that. Accidentally, searched for the
patch series subject, but not patches itself.

Thanks

~ Oleksii
>=20
> > Please reply with items you would like to see in 4.19 so that
> > people
> > know what is happening and prioritize accordingly.
> > You're welcome to provide a description and use cases of the
> > feature
> > you're working on.
>=20
> "x86/spec-ctrl: IBPB improvements"
>=20
> Jan
>=20


