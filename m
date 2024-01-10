Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 581C682A2CE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 21:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665760.1036073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfX2-00060n-9G; Wed, 10 Jan 2024 20:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665760.1036073; Wed, 10 Jan 2024 20:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfX2-0005yW-67; Wed, 10 Jan 2024 20:50:36 +0000
Received: by outflank-mailman (input) for mailman id 665760;
 Wed, 10 Jan 2024 20:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWwH=IU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNfX0-0005x4-SJ
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 20:50:34 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e57bb9b7-aff9-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 21:50:32 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5534dcfdd61so8175817a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 12:50:32 -0800 (PST)
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
X-Inumbo-ID: e57bb9b7-aff9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704919832; x=1705524632; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9Iop9KId4sYt91ccMR9rJ5o714JaJGj6zVnQFCbGo0=;
        b=NHuBOX/DWFZ1KNLuJkFDAqXT2XxkDGsD6kZyZqPNSiKy8H0MbH5GBjCeOxNcEGiMVg
         7kI2WWY3GD82UomoK+ZgT8WHXmWVEPQpwuwC2x6xgKfaYBkkiq9GChAiHNrMjXiz00ZZ
         IIt7Z8gz5+xVlYjPBLZU4xbenjQ+xDRxTLQGxSOG9xn0sIY3P32NlSKo26xutRtVAqBk
         tutuvMUe+zP+fOHnLyEgR/Vc8OpwzX7COlSpKgDvYe2tOTqwEugz6joJJaR7ijFekqdW
         7XujCEXbLW5YJLIPP1Lq3q9G/6bvQWjswEuRPJPkpm6mOvbG3PRgshJs/MZMoGdK6k1o
         CtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704919832; x=1705524632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9Iop9KId4sYt91ccMR9rJ5o714JaJGj6zVnQFCbGo0=;
        b=kR0gO3rUob4yPiOaJ11H7sWT6SCJb5pSZnQZYbAtAuwLzTeLTObpyi7JoR9o4jngtA
         264O+Fy8idSwKAz803RANFFvV3Voekerk8lgmOoCZxJ4UxB4/JiM4N/nS7LPmxV4O5wq
         eJ2teoBg6z8VdbVDPr9DatJhpOu/YwxtYQUfQfwbATV6mFJPku6Mm/+WR9Q8pHUl8Dix
         2XqPRorlFdTRKpIpiwm2aAY//9Wg9isR+jZLFbT+9OGAQ9OmF59FXsBoqbeFVIlOzLoc
         vaYa4GX4xA4eglENZ0tPJ9RgLLE0fk1IEt0u6DvY7KFxhX1ADz1dxJ/kGSZzpBl9B0TL
         0eEw==
X-Gm-Message-State: AOJu0YyhjiLQssksJWMSLiBIQxpqq6FH9HuGMwSWKFJjgF/LlitUQw9D
	T+y6cRPUvh2d8rhdUoqm4GVRnOxPLqJL9DZ328ZFIHVM
X-Google-Smtp-Source: AGHT+IHsZuEeGpGICjGga98Brh+FnErwdvlnSOW9hpnC2rtkayccDtTKPRfVm3uWEMuut80v5w2RzpNLir9av1bnfW4=
X-Received: by 2002:a50:ee10:0:b0:554:c9af:a66e with SMTP id
 g16-20020a50ee10000000b00554c9afa66emr785280eds.9.1704919832318; Wed, 10 Jan
 2024 12:50:32 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-29-jgross@suse.com>
In-Reply-To: <20240104090055.27323-29-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 Jan 2024 15:50:20 -0500
Message-ID: <CAKf6xpuXNjbdntg0n3Zd6crvNVYNKEv56OAaeJmFwjK20_e+Eg@mail.gmail.com>
Subject: Re: [PATCH v3 28/33] tools/xenstored: split domain_init()
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:59=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Today domain_init() is called either just before calling dom0_init()
> in case no live update is being performed, or it is called after
> reading the global state from read_state_global(), as the event
> channel fd is needed.
>
> Split up domain_init() into a preparation part which can be called
> unconditionally, and in a part setting up the event channel handle.
>
> Note that there is no chance that chk_domain_generation() can be
> called now before xc_handle has been setup, so there is no need for
> the related special case anymore.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

