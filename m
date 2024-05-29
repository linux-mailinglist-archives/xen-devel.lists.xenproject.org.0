Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2998D3C6D
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 18:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732242.1138152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCMAl-0004yy-Eg; Wed, 29 May 2024 16:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732242.1138152; Wed, 29 May 2024 16:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCMAl-0004wX-C0; Wed, 29 May 2024 16:29:07 +0000
Received: by outflank-mailman (input) for mailman id 732242;
 Wed, 29 May 2024 16:29:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCMAk-0004wR-DY
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 16:29:06 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9048a480-1dd8-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 18:29:04 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-529614b8c29so3716482e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 09:29:04 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52970e1ee18sm1309041e87.232.2024.05.29.09.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 09:29:03 -0700 (PDT)
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
X-Inumbo-ID: 9048a480-1dd8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717000144; x=1717604944; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FJaU8tLMW6SaZCgrZmBW0/o64XVc5CcWTPBqhIdX+/s=;
        b=Id/2d4WIBVa1fBZ+yR5E7HkCuozUbRwTYfB179wtyEusuHth6SssShNiBGoVhhv2kz
         vvMQNZr435vkUufL+vL4XvrBv9JzPXPxLCcEhgJDk7m1hfd1Dp/uRBpLIx7L6+IZ1Bdh
         3ZbZ/P0AgpCGIzjGlF759KWQ7CQVoqBlKhtcAgDslukjC9RrrUYhXr5izLVK31bHA/Yb
         +yoGQrXhP3vPBNNl6RQAiGbEf6pwKmHfaB6GJJJVI6C51jCveO/9pCMirbtDcFywVQtv
         FaZgNeM3vvb3Xngq1uv2p9ThuSHpJdXGql3FU7dLoEeIxZdC0gFta2fiIF+zU28B5Mi9
         6OBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717000144; x=1717604944;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJaU8tLMW6SaZCgrZmBW0/o64XVc5CcWTPBqhIdX+/s=;
        b=klvLA9Iv9MSOhRMYIidbi+d4wTbOorczH4Yp8nstCkM4B4jQEbJesaKJn/0DhzfVXq
         z2gdOp+fNJsPUNcemcVHOmWdi139qpMr6eX5eMyjzcrjLjJrcMHfKcRg11ELNIR2c4nX
         bHRbCWhqOxZKtpgE510Oy0TBZ7HrxHaGKiKvn8BI6DkwgHd8yvB2jFFbkg6jI3HHtgaq
         xJUCk22ERWjagyfg0YmHulcaNqUYuFnNnTgmmN0UwJJgahJXNcL2IJ2k3nvtuPNAAHZb
         d/cU1rT7TN9c5jqZ+v2juqYro2wXKf/LaipINzrZNOZL2Z2cQ14LdVbuVP928OJAxlvX
         H2rA==
X-Forwarded-Encrypted: i=1; AJvYcCV7M+WS30W1F4vFVTrBrAZ61C8ItoB+BnboUrxeXJqcXraOhSNp0EmjtTk4dpffFM8YL3xBGGBjj6FkZ3lSUcS/Sqfrv0juAMpJJfx6xRc=
X-Gm-Message-State: AOJu0YzfND3vCm5iPHZyjd+SGlx7mUtjNXEUcooOhWKjrmS4AKnSoRFJ
	0x/GNPVYKN3jpXcnuchIpwQwyjfZ+MISYlh3fyFixCWh8+b4E9nW
X-Google-Smtp-Source: AGHT+IGpsJ6MbZ1ydNDz4Wn74sLgTSA4Ovs9CeTRsL+E0PWrN58GFqmMRJTG3xV7Ro05SPh2IoPLQA==
X-Received: by 2002:a19:f716:0:b0:51f:36ed:ee43 with SMTP id 2adb3069b0e04-52965f10d17mr9895087e87.31.1717000143463;
        Wed, 29 May 2024 09:29:03 -0700 (PDT)
Message-ID: <1b301099b71c61c8e537ec6eb8fe064c3c2348f3.camel@gmail.com>
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,  Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Wed, 29 May 2024 18:29:02 +0200
In-Reply-To: <23790bd6-e06a-4adc-90a9-517f947be00a@suse.com>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
	 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
	 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
	 <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
	 <a39c3c03-ef54-4329-833d-03b60f162234@xen.org>
	 <56b97916d1c36040a0be547759d5d10d311c9ed3.camel@gmail.com>
	 <5438a9b1-d13a-415b-95e4-af520c228e01@suse.com>
	 <c72784d5-20d2-4583-9e8a-f8b1cbf31aa6@xen.org>
	 <ded13a36-b790-4989-a952-9a4130293b50@suse.com>
	 <2bc05407cc62c829d63da757e071db51a003eb79.camel@gmail.com>
	 <23790bd6-e06a-4adc-90a9-517f947be00a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-29 at 17:22 +0200, Jan Beulich wrote:
> On 29.05.2024 16:58, Oleksii K. wrote:
> > static always_inline bool test_bit(int nr, const volatile void
> > *addr)On
> > Wed, 2024-05-29 at 12:06 +0200, Jan Beulich wrote:
> > > On 29.05.2024 11:59, Julien Grall wrote:
> > > > I didn't realise this was an existing comment. I think the
> > > > suggestion is=20
> > > > a little bit odd because you could use the atomic version of
> > > > the
> > > > helper.
> > > >=20
> > > > Looking at Linux, the second sentence was dropped. But not the
> > > > first=20
> > > > one. I would suggest to do the same. IOW keep:
> > > >=20
> > > > "
> > > > If two examples of this operation race, one can appear to
> > > > succeed
> > > > but=20
> > > > actually fail.
> > > > "
> > >=20
> > > As indicated, I'm okay with that being retained, but only in a
> > > form
> > > that
> > > actually makes sense. I've explained before (to Oleksii) what I
> > > consider
> > > wrong in this way of wording things.
> >=20
> > Would it be suitable to rephrase it in the following way:
> > =C2=A0=C2=A0=C2=A0=C2=A0 * This operation is non-atomic and can be reor=
dered.
> > =C2=A0=C2=A0 - * If two examples of this operation race, one can appear=
 to
> > =C2=A0=C2=A0 succeed
> > =C2=A0=C2=A0 - * but actually fail.=C2=A0 You must protect multiple acc=
esses with
> > a
> > =C2=A0=C2=A0 lock.
> > =C2=A0=C2=A0 + * If two instances of this operation race, one may succe=
ed in
> > =C2=A0=C2=A0 updating
> > =C2=A0=C2=A0 + * the bit in memory, but actually fail. It should be pro=
tected
> > =C2=A0=C2=A0 from
> > =C2=A0=C2=A0 + * potentially racy behavior.
> > =C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0 static always_inline bool
> > =C2=A0=C2=A0=C2=A0 __test_and_set_bit(int nr, volatile void *addr)
>=20
> You've lost the "appear to" ahead of "succeed". Yet even with the
> adjustment
> I still don't see what the "appear to succeed" really is supposed to
> mean
> here. The issue (imo) isn't with success or failure, but with the
> write of
> one CPU potentially being immediately overwritten by another CPU, not
> observing the bit change that the first CPU did. IOW both will
> succeed (or
> appear to succeed), but one update may end up being lost. Maybe "...,
> both
> may update memory with their view of the new value, not taking into
> account
> the update the respectively other one did"? Or "..., both will appear
> to
> succeed, but one of the updates may be lost"?
For me, the first one is clearer.

Julien, would that be okay for you?

~ Oleksii


