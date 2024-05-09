Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE7E8C10BB
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 16:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719260.1121900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s54Jh-0007nS-Q5; Thu, 09 May 2024 14:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719260.1121900; Thu, 09 May 2024 14:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s54Jh-0007ku-Mi; Thu, 09 May 2024 14:00:13 +0000
Received: by outflank-mailman (input) for mailman id 719260;
 Thu, 09 May 2024 14:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XcCC=MM=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1s54Jg-0007ka-6a
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 14:00:12 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 739a1ff7-0e0c-11ef-909c-e314d9c70b13;
 Thu, 09 May 2024 16:00:11 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2df848f9325so10328371fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 07:00:11 -0700 (PDT)
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
X-Inumbo-ID: 739a1ff7-0e0c-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715263211; x=1715868011; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bd3FuNnGsiYvjztUaoUz5XSWfmfGI0oEndzpmDo13hE=;
        b=IwFs7r2e2bj/2YbzNzp2NUYcnrBp7KjYYHHzOzZi8QTk6K3O1mU7X0aSo8gCwJ2a9O
         vJRXInNuJ9xSxB2jFzBuksPRfxLobu/tgiM3vDsRJze6OMuX31jNmvPvie0yfaVS4Hw9
         uJ3N/CQI+5oo6pHQ6e9Gf3fwOA3fz9G44E1I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715263211; x=1715868011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bd3FuNnGsiYvjztUaoUz5XSWfmfGI0oEndzpmDo13hE=;
        b=T5V6Tkyij5nuUsNKSetwpJEStoXiwaaq/DAcuBwZmz5TArFmoQQ+1TvLWPNsCNBTz9
         RAht8FPAuSWQzavxtoeH9cFAjpeN5B7IVEJydYXS0dFOU8D8gEId59yTt+vcxGuq8B/N
         EGSmFTj0EtibaJTAKPlYt4PqmognopaR6+ifvw3arwENcJsl/zujmV1C/E9o50Hn7BuP
         Zwi016E/nQGalusHOPY38eGIz4VEa5f1GVQ9fF01OKx1d+1lyvVAAvTmgH2vC9MSLQar
         ZS8MbpPfpHKquy3uRoAoSIRf1vVQxBBwYIbyWMoNptgTsFCbdKVX5SXqzNchzTMKYr4L
         v6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7XQ0GiC5GSvWaM0F/gX4dcNGrEMYRZuvORaPmCwX3JX+V06RgAb4Ozk0N8Nr7hcCqA8KpmrXVrw8ODk/+85ZmIEn15fJva743+ab07Rg=
X-Gm-Message-State: AOJu0YxssCxqPyazo9Ag1JoF7mzHrq2SD7Wud3OTvfVd2271iA7K+IWp
	wvzXagtZndIEel4r4vXsnVJd1671qernsJ6MMyRLDt6C+TkveXLmInwzSe7ed9sT0KCVjqe0XHv
	G0EmTUVo7i2s4tcxGeQqrVYC0eus40hi9XRC2GJ+jPZbYkaTO
X-Google-Smtp-Source: AGHT+IFWqgqLCLWK2w7REBEM7Opbk4mCjoW+OJ2iFy3xZ/0i3PtOOGiLMHrhtQroC2KfzqjgBkRW2cic9+n220IiL8U=
X-Received: by 2002:a2e:97d7:0:b0:2e1:afa6:9291 with SMTP id
 38308e7fff4ca-2e446d7a622mr46734161fa.8.1715263210998; Thu, 09 May 2024
 07:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
 <20240430124709.865183-5-fouad.hilly@cloud.com> <fc0c86f5-837a-45e8-807e-6861063be85f@suse.com>
In-Reply-To: <fc0c86f5-837a-45e8-807e-6861063be85f@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Thu, 9 May 2024 14:59:58 +0100
Message-ID: <CAJKAvHYcnmzEXptMOUTBny09jczbWnxk9QJEMhScYEi-z+Nhsw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] x86: Use getopt to handle command line args
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 9:21=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 30.04.2024 14:47, Fouad Hilly wrote:
> > Use getopt_long() to handle command line arguments.
> > Introduce ext_err for common exit with errors.
> >
> > Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
>
> Nit: Neither subject nor description make clear ...
>
> >  tools/misc/xen-ucode.c | 45 +++++++++++++++++++++++++++++++-----------
> >  1 file changed, 33 insertions(+), 12 deletions(-)
>
> ... what tool is actually being touched.

Noted and will be fixed in V4
>
> Jan

