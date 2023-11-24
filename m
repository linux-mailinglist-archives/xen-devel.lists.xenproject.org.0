Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EED67F746A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:57:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640671.999224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Vjo-00056o-WB; Fri, 24 Nov 2023 12:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640671.999224; Fri, 24 Nov 2023 12:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Vjo-00054k-T1; Fri, 24 Nov 2023 12:56:52 +0000
Received: by outflank-mailman (input) for mailman id 640671;
 Fri, 24 Nov 2023 12:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WabF=HF=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1r6Vjn-00054e-M8
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 12:56:51 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee668cc5-8ac8-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 13:56:49 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c503dbe50dso22819211fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 04:56:49 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b00405959469afsm5051474wms.3.2023.11.24.04.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 04:56:48 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 11B775F7AA;
 Fri, 24 Nov 2023 12:56:48 +0000 (GMT)
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
X-Inumbo-ID: ee668cc5-8ac8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700830609; x=1701435409; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYh9ttpZExkVPVkQ28/dpWEwBabZM3xCVfwqKkfGpoE=;
        b=l9MzqNug9v+DO7QGYZ0DjJ/HUmpNeotbH3vl+vtva3Gkkc667enZczhRLENKXPw1li
         U1nxBnWfOALNo25yOj98mBvom6pbUORTD63oKi6iICTsMmKihlmNoL1jlONAq1Cj3G13
         yieojaBNRU9O/MAFgx5VIbLkGwK2QR21KExmU/fJrteRTLbSGuBjlf6uloWIXrvhKcZy
         8e1oWB9keNVOM+guD9HdYWJ9mILyzofZsKnYeODcmAa6lJSgKeBl9rbLTO2S19y5Fpud
         5AaI3Ri0rrUstr5wJctSBXaGDySdzWTQOc1g1lNPmOkV+FC0rJLGm6bF92En4scba3qU
         HGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700830609; x=1701435409;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rYh9ttpZExkVPVkQ28/dpWEwBabZM3xCVfwqKkfGpoE=;
        b=fJunPX5+8GtKuJdd4AkiO7Tf0qkMsCwf5NTDmMW5JsgbfNsBQQmWJMOq7zPwVNFZdB
         cxQj9vr+V1qQAAWXgh1drBJAE2wMDyKp+x/X684D/lJ62hBuCfLgXEGiomqKLbZ4NbWy
         HuS+7YxSv24/zOnI+LaT4vKNKhaq+O+xaFdk7Gapbzfx+ufRwmLD3VrBZDduD2staXzu
         oS/ZHmgiM20zGX9k1NdD+7mav1f2PWjnSt20NB7UMIAzymLLWqoEW7Rm8H2humi6guK3
         U2WS16zYPA0VcPVettxAAl4J+x0ZRyGdzlrRNhrZ/T8cvke4aEzE2QI+xB2WXH+mGKxq
         4npw==
X-Gm-Message-State: AOJu0Yyn7vxRwIzA9CBBnVr0zipC7cEceSYO1lWjGRSKsVV69Z0KiAoT
	L1oRnqG88+/MEXUWgLBZGCPYsA==
X-Google-Smtp-Source: AGHT+IEW4oaIEl4UKl/xCLKHHE+a9oAX7cxDG0m2YWIUUGXEoUOvuMm1aEI6exCQqWi9qOF1bBvvNg==
X-Received: by 2002:a05:6512:3a85:b0:50b:a6c7:e8b0 with SMTP id q5-20020a0565123a8500b0050ba6c7e8b0mr212264lfu.26.1700830608786;
        Fri, 24 Nov 2023 04:56:48 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: David Woodhouse <dwmw2@infradead.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  "paul@xen.org" <paul@xen.org>,
  "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  Julien Grall
 <julien@xen.org>,  Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
  Anthony Perard <anthony.perard@citrix.com>,  "open list:X86 Xen CPUs"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
In-Reply-To: <87cyw1z61i.fsf@epam.com> (Volodymyr Babchuk's message of "Thu,
	23 Nov 2023 00:07:05 +0000")
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
	<20231121221023.419901-5-volodymyr_babchuk@epam.com>
	<b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>
	<alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop>
	<ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
	<alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop>
	<a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
	<alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
	<87r0khz6zj.fsf@epam.com> <87cyw1z61i.fsf@epam.com>
User-Agent: mu4e 1.11.25; emacs 29.1
Date: Fri, 24 Nov 2023 12:56:48 +0000
Message-ID: <87wmu7b97z.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> writes:

> Hi,
>
> Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:
>
>> Hi Stefano,
>>
>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>
>>> On Wed, 22 Nov 2023, David Woodhouse wrote:
>>>> On Wed, 2023-11-22 at 15:09 -0800, Stefano Stabellini wrote:
>>>> > On Wed, 22 Nov 2023, David Woodhouse wrote:
>>>> > > On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrote:
>>>> > > > On Wed, 22 Nov 2023, Paul Durrant wrote:
>>>> > > > > On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>>>> > > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
<snip>
>>>> The -xen-domid argument on the QEMU command line today is the *guest*
>>>> domain ID, not the domain ID in which QEMU itself is running.
>>>>=20
>>>> Or were you thinking of something different?
>>>
>>> Ops, you are right and I understand your comment better now. The backend
>>> domid is not on the command line but it should be discoverable (on
>>> xenstore if I remember right).
>>
>> Yes, it is just "~/domid". I'll add a function that reads it.
>
> Just a quick question to QEMU folks: is it better to add a global
> variable where we will store own Domain ID or it will be okay to read
> domid from Xenstore every time we need it?
>
> If global variable variant is better, what is proffered place to define
> this variable? system/globals.c ?

Hmm maybe, I see Xen already has some but the comment:

  "Global variables that (mostly) should not exist"

I think it to dissuade the file growing more than it should.

I think generally the best pattern to use if a global can't be avoided
is to have a "static global" in the main .c file for the module and then
provide a helper access function for other files to read it. That also
makes re-factoring easier if things like locking need to be added down
the line.

We still do have a few true global variables which need "extern"
declarations in the headers but if we can avoid adding more that would
be good.

Of course ideally this sort of data would be wrapped up in QOM
structures but I can see the argument for the host domain ID.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

