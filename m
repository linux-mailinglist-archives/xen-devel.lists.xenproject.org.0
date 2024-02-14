Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478FA854A81
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 14:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680765.1058875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFLL-0005CV-OK; Wed, 14 Feb 2024 13:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680765.1058875; Wed, 14 Feb 2024 13:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFLL-0005Az-La; Wed, 14 Feb 2024 13:30:31 +0000
Received: by outflank-mailman (input) for mailman id 680765;
 Wed, 14 Feb 2024 13:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIjL=JX=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1raFLK-00058m-Ka
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 13:30:30 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38a16fe8-cb3d-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 14:30:30 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so305539866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 05:30:30 -0800 (PST)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 ca23-20020a170906a3d700b00a3caccb8f66sm2320867ejb.44.2024.02.14.05.30.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Feb 2024 05:30:29 -0800 (PST)
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
X-Inumbo-ID: 38a16fe8-cb3d-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707917429; x=1708522229; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw6dNung5bnivI0pZ1zZjo9g75/H0AXcN8gPbhDiXss=;
        b=KSo68wxhpFY6jjzwDIyT6ozfSAkuwqh8KzRJnNRX7Je61RD5NJobTWhhuidZUaXLpa
         BiaB8J6H7yYTkyz3ravt4HpJvrghY6NbuQND9W6wEQkEW+NuOrPD+wpjHUnMI1SljsfZ
         y64Vmglew8euNCMgAoE0UMXkiUd1HA6Jx9o2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707917429; x=1708522229;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw6dNung5bnivI0pZ1zZjo9g75/H0AXcN8gPbhDiXss=;
        b=d345bHiE4DMl8x3JphXKfU5ZrcibwAPA/yzX334OJd6y+z0ikzPCYOnJfRA04D56zB
         aDVa2LdgDKDR3yLtb4594N2VUYnZAe/RKiYlJLchiB5/zwJLba38jg4ZLZPKivC9TjHi
         Xnnw+5lJIFucsi8gjW1qs2LEXMeAERfJXFgFaH1pt6W+BxK4+zqfdul19schV3uYwUUz
         RnAydoTp8gJ6CrwY41aWcelbZOQjEjs84f6FMUKTnVEBaMtuK3r9JQFXSnL0Cw9189RH
         lxOl0iNIY6fkSHL+9aMhT1Fw0kL4DtbLXrbd3ESiGEuo797pfJdEHD9uLjwRpHXExBfy
         usmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW7cXsD0CJcTnBEkmpV+ma6HC8ZgjIL/jprZGiiI/JKR1G8rp/jqZpUSlRhkhRWoxZO2QzXUmIxRL7nmIo1uHv9PjViLtqv0qLpizi2GU=
X-Gm-Message-State: AOJu0YyS809yo+3bfC/Flb3pFKbRQGQ6xej8CHlB8Tzj6m31Uo8NnzzP
	vvCGGg7fMznVRgO/0+xo0p0/lcgkuRID2wZJ7lqh/9b8bcjvCJj634hVoEk6O4o=
X-Google-Smtp-Source: AGHT+IGxz8DX0Ag72bUYpwxMmZMfMVxz43iA5Rv2wIQbj18PV9FEV9Y0y5opL0oobHowAIW3877dkA==
X-Received: by 2002:a17:906:fa94:b0:a3c:d7a5:6ab1 with SMTP id lt20-20020a170906fa9400b00a3cd7a56ab1mr2002258ejb.0.1707917429565;
        Wed, 14 Feb 2024 05:30:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsjtZTSMqkhrsgb+rgBtIdXw8ZqLqhmTSLZzqNeyaea4TG2jy2ZoBnWcf0TINsd7Pbc7eK5OKfhFYjLDwCNh/udgooIPVdHROw5myT6uurom4RxDxKgChm446IWt403keBZUwCe6tTCWpLAHMVpDCmP9Qjk0uXCQsZP0DwfCU2pxLJCA5wp/chtLfFRU/yWpFdzB33eqXKJtk=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH] tools/ocaml: Add missing vmtrace_buf_kb field
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <046415d5-d4f4-4870-a588-60637ea3bc3a@citrix.com>
Date: Wed, 14 Feb 2024 13:30:18 +0000
Cc: Jan Beulich <jbeulich@suse.com>,
 =?utf-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <217314CC-5717-4253-9DEC-61D5DA1E52AC@cloud.com>
References: <9b9909c9e93cb540b3488c784935acc2bc9e071e.1707343396.git.w1benny@gmail.com>
 <3A858D7F-C953-4EF0-8919-AE96D6105AB1@cloud.com>
 <01b0d902-1903-4618-ad43-f625e57b61e1@suse.com>
 <046415d5-d4f4-4870-a588-60637ea3bc3a@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)



> On 14 Feb 2024, at 11:45, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> Xapi is the only consumer of this interface.  I've fixed up the build
> against staging, but we're not going to be running KFX under Xapi any
> time soon.
>=20
> Ultimately it's Christian's call.


After a discussion with Andrew, we will not back port for now as we =
expect Xapi to use a new version that has it when it becomes relevant.

=E2=80=94 C=

