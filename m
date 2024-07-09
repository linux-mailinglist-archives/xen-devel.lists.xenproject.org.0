Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5949C92B63E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 13:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756184.1164714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR8ki-0008WU-21; Tue, 09 Jul 2024 11:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756184.1164714; Tue, 09 Jul 2024 11:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR8kh-0008Tk-Vf; Tue, 09 Jul 2024 11:11:19 +0000
Received: by outflank-mailman (input) for mailman id 756184;
 Tue, 09 Jul 2024 11:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XjVV=OJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sR8kg-0008Te-Ps
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 11:11:18 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5f29012-3de3-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 13:11:16 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab63so7385989a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 04:11:16 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc88csm68439966b.6.2024.07.09.04.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 04:11:15 -0700 (PDT)
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
X-Inumbo-ID: f5f29012-3de3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720523476; x=1721128276; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCPIa+nBkBA7H1LS1nEZrlSp0eiPLWH5zTkE9DbdCzU=;
        b=J0oTjDudIsboXK1HKEIzd4/8jhcU0YXnCqaFqBJqMRcI5k23Vl2p1GsEZ8ZZZ2kC18
         Hk8IVja6ZHHYyHVJ9oqpVn7Db7yoEIfGSnVZ8ra+/lm0P3a2x0PdRNnUIGP5EA2uo+Y1
         9cCrjc6qqvc92orywzDrFuPwWkPTqR0BYhEz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720523476; x=1721128276;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TCPIa+nBkBA7H1LS1nEZrlSp0eiPLWH5zTkE9DbdCzU=;
        b=D9pKiKNlOf1rXwJMc+If++MBtR2DAmVKndEITyJN29UYGy1UJghrk0DFYpdtWMTqxM
         q8KO1f2jaL/1Vf4u4XdH3T+grROzRZLTR9R5tuk2SPyXkzKw4F2NzO5sh9NtVrzTK6OA
         pTPJBOZjt5KgfkeVs9plSiVZmTsaUo6hBhLxdnQlvWyUvZ6jskVWLdWkhlE91ghubuOe
         M1s4z+X2EA5hd6YrPnVdpHQmkjm3tv1akRwfYAybDUuKdrdVby30OQiV3luJpbQ2WjKc
         WdwOX71yJF5yoLjDnaWpA0IBc4Ut+ww3o9FxqfUkjYi1qm0E8N7D4+OxJHNJwXdaRG1C
         wNSA==
X-Forwarded-Encrypted: i=1; AJvYcCVRKfwoBC6OZVBAd/ReK3lzBMJZHzxViqfwJ9hGazyAJR+aU+f4p5pyXJW52XMW+WAxtSScG/LXHBwzeoPVjtegIezpVNNrJzOSJJIJjkI=
X-Gm-Message-State: AOJu0YyeGu/hyMCCNGCF4fZO94qxymnbt4Zyki46xkBZQ7VaG5ooXl5/
	QQEejAjI2Odt4LQ+I1hLbDAmrTlGurwSWJ6lWR+EZyrjguV4stEfv42olIt5i0NCNg86vOnAB9c
	Z
X-Google-Smtp-Source: AGHT+IGqkMaZgEbWxqRzDejdWJMJSn44WLjEwgyR3Q91caQhCvTckAr7wpyho4o+V3gxi4I+gcsKOg==
X-Received: by 2002:a17:907:6d10:b0:a72:5c3d:4d08 with SMTP id a640c23a62f3a-a780b8856a4mr178181066b.61.1720523475870;
        Tue, 09 Jul 2024 04:11:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jul 2024 12:11:14 +0100
Message-Id: <D2KYO4GHH7VR.1XBQKN2LWF54P@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH] x86/cpuid: Expose max_vcpus field in HVM
 hypervisor leaf
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Matthew Barnes"
 <matthew.barnes@cloud.com>
X-Mailer: aerc 0.17.0
References: <c0a9f52107e22957daaa5b1b0e05e4160db5f064.1720452354.git.matthew.barnes@cloud.com> <103d60b6-001b-43f0-bbff-a0806cebda73@suse.com>
In-Reply-To: <103d60b6-001b-43f0-bbff-a0806cebda73@suse.com>

I'll pitch in, seeing as I created the GitLab ticket.

On Tue Jul 9, 2024 at 7:40 AM BST, Jan Beulich wrote:
> On 08.07.2024 17:42, Matthew Barnes wrote:
> > Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
> > startup.
> >=20
> > There are efforts to support a maximum of 128 vCPUs, which would involv=
e
> > bumping the OVMF constant from 64 to 128.
> >=20
> > However, it would be more future-proof for OVMF to access the maximum
> > number of vCPUs for a domain and set itself up appropriately at
> > run-time.
> >=20
> > For OVMF to access the maximum vCPU count, Xen will have to expose this
> > property via cpuid.
>
> Why "have to"? The information is available from xenstore, isn't it?

That would create an avoidable dependency between OVMF and xenstore, preclu=
ding
xenstoreless UEFI-enabled domUs.

>
> > This patch exposes the max_vcpus field via cpuid on the HVM hypervisor
> > leaf in edx.
>
> If exposing via CPUID, why only for HVM?
>
> > --- a/xen/include/public/arch-x86/cpuid.h
> > +++ b/xen/include/public/arch-x86/cpuid.h
> > @@ -87,6 +87,7 @@
> >   * Sub-leaf 0: EAX: Features
> >   * Sub-leaf 0: EBX: vcpu id (iff EAX has XEN_HVM_CPUID_VCPU_ID_PRESENT=
 flag)
> >   * Sub-leaf 0: ECX: domain id (iff EAX has XEN_HVM_CPUID_DOMID_PRESENT=
 flag)
> > + * Sub-leaf 0: EDX: max vcpus (iff EAX has XEN_HVM_CPUID_MAX_VCPUS_PRE=
SENT flag)
> >   */
>
> Unlike EBX and ECX, the proposed value for EDX cannot be zero. I'm theref=
ore
> not entirely convinced that we need a qualifying flag. Things would be
> different if the field was "highest possible vCPU ID", which certainly wo=
uld
> be the better approach if the field wasn't occupying the entire register.
> Even with it being 32 bits, I'd still suggest switching its meaning this =
way.
>
> Jan

Using max_vcpu_id instead of max_vcpus is also fine, but the flag is import=
ant
as otherwise it's impossible to retroactively change the meaning of EDX (i.=
e: to
stop advertising this datum, or repurpose EDX altogether)

We could also reserve only the lower 16bits of EDX rather than the whole th=
ing;
but we have plenty of subleafs for growth, so I'm not sure it's worth it.

Cheers,
Alejandro

