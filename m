Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFC686116A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 13:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684844.1065015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUaT-0005Ep-83; Fri, 23 Feb 2024 12:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684844.1065015; Fri, 23 Feb 2024 12:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUaT-0005DH-4u; Fri, 23 Feb 2024 12:23:33 +0000
Received: by outflank-mailman (input) for mailman id 684844;
 Fri, 23 Feb 2024 12:23:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/z8=KA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rdUaR-0005DB-I1
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 12:23:31 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ab767b5-d246-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 13:23:30 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-512bb2ed1f7so324011e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 04:23:30 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d11-20020ac2544b000000b00511ac5e89f7sm2408289lfn.300.2024.02.23.04.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 04:23:29 -0800 (PST)
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
X-Inumbo-ID: 5ab767b5-d246-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708691010; x=1709295810; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y2xfGF03HxvHDka7iopRcCUIz+v7jFXuNdrwq7NKmek=;
        b=VsF+9raG9jb4h2qccDKikOtN2BjHw4xsnL/ZoMR57prQchWhuw1rCjaWtroAFHs2ah
         XU3Q0aDoWZ9N3EOxMLcaO+MCsu5BlA4XpBlmGPjLGB/GpKjConXY0kxy48ycgBihbOqK
         4cMxjr6yL91ugnXz6nVpsoufWdkVgMbBYiJLHynw4Ka4xSFmw33s0el/fx7XJrhbTCIP
         nzp7zbU2hqhJLfPY1hPSAmfzPC8I5Mh9hD/9Taw6wzsvIiFeM0Zk7IK0vGonemTyPjPN
         TeseUD9zobuaJLvBRJcgTJlllotBH5UPVRjKb+nAhUIiThl95oHjzh87JZks+pjSU5i4
         i9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708691010; x=1709295810;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2xfGF03HxvHDka7iopRcCUIz+v7jFXuNdrwq7NKmek=;
        b=EpZsPzVl0gWKwg2dkiX0tj44G/C0hJ5sYkgpJA6mAtu5iraa6lOI5a/ml7D/TTVGz6
         hEH5Fv+nDdHpsC1UYDxQyw5GD9n0NZ4Y5yhrPQM5+spziz53jRDPlbv8xfAT/mBjYiN7
         fPEsjWQl0J4MefwCTi+mB4nBi5W/BmL6X9BzPhLb0/QvmLlYBjB4klOdTtjUK9hxWu/j
         oWYIVL19jTcI+Ttf6PkQCyXoYsLzd5XUheNm3Md+lsdveRwhDzs2MwvSKzgsBbEMchzU
         qWc9Zjg4ext+0Ma2XTYqvuiOZ9+gLV8Gd1j00gIY/I6F6HzTTe7CKoAnHHVR/LtM6oEU
         Rnsg==
X-Forwarded-Encrypted: i=1; AJvYcCVBC9IJg+JuJm6mYWwIIDTygWVNCoy+npaAPpUfU6u4nQGaw7Roy2fsvUk6M6rMM+Z9gAKz+x0D0kuzjqZuJoaRiPPLZNyaLah7GClCxlk=
X-Gm-Message-State: AOJu0YzBtYwnnSmVbQGG0oDn/pIBED/gNMLbhd+zh6bD2XZ4AZFouK/d
	TUWT5J3y0anXMtOw4iPUsrRRDAkt8YRwIzfx25S3PMPSoGPzbfue
X-Google-Smtp-Source: AGHT+IEJElHU+nDwe3nm6XMstI9N3hjNwEKsDwOKEoMupGiR8lWmTof+odxyFL13CfL8Nyn7KrG+hw==
X-Received: by 2002:ac2:5934:0:b0:512:d81f:c22e with SMTP id v20-20020ac25934000000b00512d81fc22emr1206630lfi.59.1708691009929;
        Fri, 23 Feb 2024 04:23:29 -0800 (PST)
Message-ID: <5d2d35fe014094c991363e42c3e2ad9ca2af3938.camel@gmail.com>
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 23 Feb 2024 13:23:28 +0100
In-Reply-To: <3b38fe82-ee0f-4666-93e1-bd78fe69c534@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
	 <9e50ef30-8dc6-4380-aa65-724e5a376c10@suse.com>
	 <28844fdfcf5eea515497fb7b5fd8ea6fb1c5ebaa.camel@gmail.com>
	 <554a43e8-7d8d-45c4-936d-36f02c207531@suse.com>
	 <1c53b52ee39161a8f59209d28af69fe997479dbc.camel@gmail.com>
	 <3b38fe82-ee0f-4666-93e1-bd78fe69c534@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

>=20
> > > > As 1- and 2-byte cases are emulated I decided that is not to
> > > > provide
> > > > sfx argument for emulation macros as it will not have to much
> > > > affect on
> > > > emulated types and just consume more performance on acquire and
> > > > release
> > > > version of sc/ld instructions.
> > >=20
> > > Question is whether the common case (4- and 8-byte accesses)
> > > shouldn't
> > > be valued higher, with 1- and 2-byte emulation being there just
> > > to
> > > allow things to not break altogether.
> > If I understand you correctly, it would make sense to add the 'sfx'
> > argument for the 1/2-byte access case, ensuring that all options
> > are
> > available for 1/2-byte access case as well.
>=20
> That's one of the possibilities. As said, I'm not overly worried
> about
> the emulated cases. For the initial implementation I'd recommend
> going
> with what is easiest there, yielding the best possible result for the
> 4- and 8-byte cases. If later it turns out repeated acquire/release
> accesses are a problem in the emulation loop, things can be changed
> to explicit barriers, without touching the 4- and 8-byte cases.
I am confused then a little bit if emulated case is not an issue.

For 4- and 8-byte cases for xchg .aqrl is used, for relaxed and aqcuire
version of xchg barries are used.

The similar is done for cmpxchg.

If something will be needed to change in emulation loop it won't
require to change 4- and 8-byte cases.

~ Oleksii

