Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40457E491F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 20:23:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628982.980980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0RfR-0004jf-Da; Tue, 07 Nov 2023 19:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628982.980980; Tue, 07 Nov 2023 19:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0RfR-0004i0-AS; Tue, 07 Nov 2023 19:23:17 +0000
Received: by outflank-mailman (input) for mailman id 628982;
 Tue, 07 Nov 2023 19:23:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0RfP-0004hu-Vp
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 19:23:15 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19294ebc-7da3-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 20:23:15 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo10079545a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 11:23:15 -0800 (PST)
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
X-Inumbo-ID: 19294ebc-7da3-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699384994; x=1699989794; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncJFXHIt1m7g/r97LOH29GkiUPpODjZPNj9S7uSvwXs=;
        b=h4EciSVzSxEfrvStvlMTjDe8377qNXJRpnHGk/XqjFhgxmAXAHnzieICN0Dxbi45yv
         5IQ7bEiKG88cDNOKRIMazIGIaL2zdslorWnRL658dz+jK/uMz2d1BEF09YAQzK1p4ABv
         RKHOZ6bk0bYvTUYIA4ohUAeD+EHngaEqJN42dJERSJpUZ3q1quhB2FV/9tfGfQHfvz9n
         LyjSL3WhHlZaUXNcsNmQh/BB7hLAZjcMeRUyIu3uJ+7Fz4jg5y8sQb/HADZibmYawal9
         7hwnfuB+cikwjzCDUV93lMDmbc/ebwT3M+00OikzcYS575YCJdvTW0gz84r4fdOS7hfL
         W2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699384994; x=1699989794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncJFXHIt1m7g/r97LOH29GkiUPpODjZPNj9S7uSvwXs=;
        b=XO+P+s1JsH1tdZX2nT8/EdT7fqwIx5FeJSp+1Q90BHeQr2CSwGe1Rq8SgG+wj9qx+U
         W9JxY6YLNe2aurN860mZuVIXLZ1bcmwPX7wgJSeBpv71WgrGQDrhJfUqn4djo2p4UsKt
         WhF5LnlsbGl5ToEtkNkBFtvWBArRol5tH7mU5p4L6fRDIiC1WKaiC0CKsssw1gzn3j0X
         rJ1/FsDgdVugBC5Flocu+DqM/Mu4vlreKCkyBUmquJ/DTxzuDN2dnvxsE+0Q10Mb/0ch
         8GILJ1ioUCNK/IkMGEh5nCDnsQEZrWaZrLM6QiuAgrSv8+VZmAVZfeAi7MNHIIq7VVQV
         fFRQ==
X-Gm-Message-State: AOJu0Yz67b7WsyS9S+O15pDHbOURcOVHAsDKP2qwMo5SIa2pocHlMQrm
	OAQy7YI6tnf9kAODCu8isXwo8Ij29DdzCUzd8Rk=
X-Google-Smtp-Source: AGHT+IEMofb8CwBo60grrdyHsx9FWSKzVFpZpmVv1YCHdgAeLupZNeQikt/HDQdO5Y+LAC557kg29r9LEqkxnblW4HU=
X-Received: by 2002:a50:f68d:0:b0:543:cc90:d95 with SMTP id
 d13-20020a50f68d000000b00543cc900d95mr12696246edn.40.1699384994525; Tue, 07
 Nov 2023 11:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-23-jgross@suse.com>
In-Reply-To: <20231101093325.30302-23-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 14:23:02 -0500
Message-ID: <CAKf6xpuo0wsAucy7p_zpJBqB+Ksh4cEM=siHJYyUj=g8ws0ikg@mail.gmail.com>
Subject: Re: [PATCH 22/29] tools/xenstored:
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 7:15=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> When [un]mapping the ring page of a Xenstore client, different actions
> are required for "normal" guests and dom0. Today this distinction is
> made at call site.
>
> Move this distinction into [un]map_interface() instead, avoiding code
> duplication and preparing special handling for [un]mapping the stub
> domain's ring page.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

