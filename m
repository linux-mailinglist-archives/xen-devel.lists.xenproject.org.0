Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC15935038
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 17:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760571.1170441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUTSs-00089f-Bw; Thu, 18 Jul 2024 15:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760571.1170441; Thu, 18 Jul 2024 15:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUTSs-00087N-9H; Thu, 18 Jul 2024 15:54:42 +0000
Received: by outflank-mailman (input) for mailman id 760571;
 Thu, 18 Jul 2024 15:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiOu=OS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sUTSq-00087H-KC
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 15:54:40 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0911c6bd-451e-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 17:54:38 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77c9c5d68bso101831366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 08:54:37 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5d202fsm573512366b.78.2024.07.18.08.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 08:54:36 -0700 (PDT)
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
X-Inumbo-ID: 0911c6bd-451e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721318077; x=1721922877; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8OA8F10vQa3fyXs3McxOW3N8Y8jeCyKd+zOJvKFYuo=;
        b=jTUK9bn6eExV3QcqktL9Ag+swfBUMOylKWT4edzzyU0j2DNlfFrIba7sLb2K/8msQD
         8KuVKVZWanQqwrmxRbQEr3ThTj6j2hduEbCqgRQeT78lXI5LJyiOhMKGqgHL2e228Es9
         WPNbmnjCDEm8pXNwK8Vbhxkg2YbNwFtBf5ORA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721318077; x=1721922877;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p8OA8F10vQa3fyXs3McxOW3N8Y8jeCyKd+zOJvKFYuo=;
        b=m3NZSC8BP2thBLA+TDaWYo3AvqqwNrczqFQmYtBJlOsJDyXBSLlxw2nORnrSbN9j76
         dI/tPtijjz/WKkmwB+Nr5kN+Uc/4MwGmlAZvSieSFOpUNUY92vN0mhRWZKi86ATQ30Z1
         ttBSBXmAD4wXoHNVf2r1Pw1PLDvejn7NoNpWgUB8w3j/Y0uK7+2O3FViISekRsBXr1/7
         Cht3opwoQxCTpfANnCVIrDzMeZI/rP0qMV9HOAs/x2sQVpQbJSqcBZC/l+yl+YseFj3T
         fNaeyF/CUFFwnhwgAq74r71hRul0pGfu3a8YWXUUZuoN/2P/f8dXIGMjZIOQl2SXpclQ
         jtAg==
X-Forwarded-Encrypted: i=1; AJvYcCVsNL7U5s+lBCXbAZbhedeYGFugk6dTwtTt5akdZ5qPSJ68/hMUSGUPncPbNdqpbR+cU38YrUl+rjogi3jNcWBxl8Lt0Z9FK96S9yJdpIE=
X-Gm-Message-State: AOJu0Yyt1tExJUdqwngzdS4bj/2GYWbLVIqUO52+HJg/WxE1a0/jogri
	vjMixFYerCAFf05eqpRHmzjuxTlyJ/prjIkO1QIjez4H/AEXpw8/x9XSbLBxaCY=
X-Google-Smtp-Source: AGHT+IGJIOvj/j0dgG73N0mEFFKt9JLDxI7wUdIpwZfw8QXTz/rxIQTkQsgjyA4OBntqi5Yo2jDo6A==
X-Received: by 2002:a17:906:f2c6:b0:a6f:501d:c224 with SMTP id a640c23a62f3a-a7a013377c0mr409201066b.57.1721318077007;
        Thu, 18 Jul 2024 08:54:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jul 2024 16:54:33 +0100
Message-Id: <D2SSBYKRS5I9.29TZSLF225OZ2@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.20 2/4] x86/fpu: Create a typedef for the x87/SSE
 area inside "struct xsave_struct"
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
 <2e2763f4980c98cca0e2c3be057b2299295bb616.1720538832.git.alejandro.vallejo@cloud.com> <ac986849-7041-4b1c-89a8-bdf1c4ad29cc@suse.com>
In-Reply-To: <ac986849-7041-4b1c-89a8-bdf1c4ad29cc@suse.com>

On Thu Jul 18, 2024 at 12:23 PM BST, Jan Beulich wrote:
> On 09.07.2024 17:52, Alejandro Vallejo wrote:
> > Making the union non-anonymous causes a lot of headaches,
>
> Maybe better "would cause", as that's not what you're doing here?

Yes, sounds better.

>
> > because a lot of code
> > relies on it being so, but it's possible to make a typedef of the anony=
mous
> > union so all callsites currently relying on typeof() can stop doing so =
directly.
> >=20
> > This commit creates a `fpusse_t` typedef to the anonymous union at the =
head of
> > the XSAVE area and uses it instead of typeof().
> >=20
> > No functional change.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks

Alejandro

