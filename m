Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F708C4E8F
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721297.1124625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oGK-0001p4-G3; Tue, 14 May 2024 09:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721297.1124625; Tue, 14 May 2024 09:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oGK-0001mC-CS; Tue, 14 May 2024 09:15:56 +0000
Received: by outflank-mailman (input) for mailman id 721297;
 Tue, 14 May 2024 09:15:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y506=MR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s6oGI-0001gM-77
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:15:54 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90728699-11d2-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 11:15:53 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59c448b44aso1382174266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:15:53 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a29d5f14bsm644823966b.213.2024.05.14.02.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 02:15:52 -0700 (PDT)
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
X-Inumbo-ID: 90728699-11d2-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715678153; x=1716282953; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mxpvRQDrBmFqVClwAgNRnJyfpXAKPPWee9HFi9CKjGw=;
        b=J2wekfbNo3v2EEBfJVjF7XAwM0DopxUtQsU6nzeeSlMnuf32c9+q3joSRIiZKtDn+h
         oIq2jYXZPaSsvxEClm4BQYXgdv2EWFGoT++em1SuLGpnqWTYFOQHvGsQ+2eFRAhj+nGp
         ngJHKH16ZYGwvuh7r9QlC3OIUUZPVXGTqT9nIdVdtRztN0tpzqJdfjpTkIKOqfbowKF7
         sdZgUh0mGnUl3KJCd168qwKUJkxEnBe9e9QbfQUfa57je5dWEceE8EaaGuFepTFOzvZW
         KalvrPDG3J8XAXO6Wvezo2S4D3w86r/fS2SYE5AFFtXLEAatsV7N4l9e0DS6Ckzw/UOY
         8J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715678153; x=1716282953;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mxpvRQDrBmFqVClwAgNRnJyfpXAKPPWee9HFi9CKjGw=;
        b=WQM03TIa37sXv3e1sC3oBSK/NTYIEjx3ac1dcilT/FR/+RhXk6Ydw+l9aTkMqvy41C
         ctYtopT+7Pc6SM8/QbXth9tXSMbRZy3WO2yqAmVcL2b/emv6G4/xUbQZHISy/omcVIF6
         2IOUT7a/mrys8NU76+EGZfTnfmuArTatUM2gkpQ8q0gXOe1VrMFD+m16fzVCUCCCKk/d
         myafxYejl8iYUEdx1OkQqxGR7VLxBCvhXfvynmECoSC91aBKdbdGvnoDy4JbboaRF/FW
         8KvZD2okcHkHoCorYZfihUtbUYj7PCONZfmV5ca7Ic8BUBznqJ3LrbKwzhuRtaUxlMKf
         HjKg==
X-Forwarded-Encrypted: i=1; AJvYcCX3X+asvvqr48ET7dipsuzSU8DimiXmfO9lPSmhvCTDPUNUNIYauSrKdXoRugB6IdVFH5//pEV4IXzq78/odtYKWDZPF/si/RIVKLHNC8Y=
X-Gm-Message-State: AOJu0YybMsMcgQodFkylpueusMfjdtwTFHhH6hRf4nQWAXUKxPxexIsG
	f6Bblu+4UXIchmwu1MvOhMaicXt1/qEpIps4npuKCxxKSQUB5o1g
X-Google-Smtp-Source: AGHT+IGuKWiZqJGBtJ+ZMzlnQMR+Kpoj9kpY0gvRdkkDsHn/CJL/axFBEBN3mcgSImLLyBv4mTr3VQ==
X-Received: by 2002:a17:906:ef01:b0:a5a:3da6:7712 with SMTP id a640c23a62f3a-a5a3da67767mr786054166b.71.1715678152788;
        Tue, 14 May 2024 02:15:52 -0700 (PDT)
Message-ID: <98d911ff46dfd5e9c3a6fb7007e7200def05ac75.camel@gmail.com>
Subject: Re: [PATCH for-4.19 v2] tools/xen-cpuid: switch to use cpu-policy
 defined names
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Andrew Cooper
	 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	xen-devel@lists.xenproject.org
Date: Tue, 14 May 2024 11:15:51 +0200
In-Reply-To: <Zjy9zmA1kjgZt9s8@macbook>
References: <20240502114922.94288-1-roger.pau@citrix.com>
	 <2ddc6307-c9a6-4ee8-9689-c9c2c5a37142@suse.com> <Zjy9zmA1kjgZt9s8@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-09 at 14:13 +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, May 02, 2024 at 03:16:54PM +0200, Jan Beulich wrote:
> > On 02.05.2024 13:49, Roger Pau Monne wrote:
> > > Like it was done recently for libxl, switch to using the auto-
> > > generated feature
> > > names by the processing of cpufeatureset.h, this allows removing
> > > the open-coded
> > > feature names, and unifies the feature naming with libxl and the
> > > hypervisor.
> > >=20
> > > Introduce a newly auto-generated array that contains the feature
> > > names indexed
> > > at featureset bit position, otherwise using the existing
> > > INIT_FEATURE_NAMES
> > > would require iterating over the array elements until a match
> > > with the expected
> > > bit position is found.
> > >=20
> > > Note that leaf names need to be kept, as the current auto-
> > > generated data
> > > doesn't contain the leaf names.
> > >=20
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >=20
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> Oleksii, now that Jan has provided a Reviewed-by, can you provide a
> release-ack for this to go in?
Based that it is reviewed, I will be happy to have this in 4.19:
 Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

