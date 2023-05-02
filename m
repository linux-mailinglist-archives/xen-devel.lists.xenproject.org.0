Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71696F4442
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 14:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528574.821908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpSX-0004bT-FA; Tue, 02 May 2023 12:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528574.821908; Tue, 02 May 2023 12:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpSX-0004Zj-Cc; Tue, 02 May 2023 12:50:21 +0000
Received: by outflank-mailman (input) for mailman id 528574;
 Tue, 02 May 2023 12:50:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vLcn=AX=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1ptpSW-0004Zd-9l
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 12:50:20 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4cd1940-e8e7-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 14:50:19 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f3331f928cso21879345e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 May 2023 05:50:19 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k7-20020adff5c7000000b00306299be5a2sm7086099wrp.72.2023.05.02.05.50.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 May 2023 05:50:18 -0700 (PDT)
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
X-Inumbo-ID: e4cd1940-e8e7-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683031819; x=1685623819;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4U/e2ueVkIftF9kI3geNYcSUvjsAJfgMH+focDaLwM=;
        b=UPOW42jY0e1qYe7ptHYUn3nvE7C5mg6br2zNrp98TtVWAIjZhy4iQMly9PBtff3hdX
         sCR4fEysID5v63m1d4qKaGWYFbR6Ni+0AcMXJYgRVDm6H+gzGZSwZ5naDV59fYyhI7Id
         6xplGXvepfZjOlmKvq1xdCSe1EeEYWefmpfUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683031819; x=1685623819;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4U/e2ueVkIftF9kI3geNYcSUvjsAJfgMH+focDaLwM=;
        b=HO2epBH+COFH+PFJg/kMMdpOLP/Ri/AXN2gnxm+0COpvSF3DOoelZxCmjHa6VVor1c
         Z2Vx9K9nQqxx8BsK7AJtXQoGBjeRnE70yQMLVBm5feoRRtUVRH72UWcPEkf2NpI3TF/H
         InrZrF4ncJg6WKMYFnBYFF8CrtsLGIv/ijkyyqHVpcBWHa+2w8YchLkxSh9GHofepIKG
         Fe/tpS9NU4ZH81/AxZaux/WYLZmf8betuzoH4qHwgCk9Nn0M9bxeAmdYhsYqmZWKdNYj
         dvfF+bYan9frYYVV1aPZb5yO1m6ACs4L6UOUbxp0ZU+tPHrW0RADbA/8yDNzR0PZ3OI0
         oKDA==
X-Gm-Message-State: AC+VfDy6Ux+sXPqooeX37IpcLmMF0ttq/GFnF8FxBsnWIkl4iOhg8vmH
	9r3BSXT+zYD3rHiTHpxWliPW3A==
X-Google-Smtp-Source: ACHHUZ5yU5MA+8UsxHIog3VNPIQHEYE6JqjPOldI32Apd5dXnAARkntx6nmRfVrN6gYiWxldQdM3MQ==
X-Received: by 2002:a1c:7c19:0:b0:3f1:8c5f:dfc5 with SMTP id x25-20020a1c7c19000000b003f18c5fdfc5mr12794192wmc.39.1683031818759;
        Tue, 02 May 2023 05:50:18 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v3 1/3] tools: Modify single-domid callers of
 xc_domain_getinfolist()
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230502111338.16757-2-alejandro.vallejo@cloud.com>
Date: Tue, 2 May 2023 13:50:17 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A40FFA8F-421C-48E1-B163-9B411D0F59B3@cloud.com>
References: <20230502111338.16757-1-alejandro.vallejo@cloud.com>
 <20230502111338.16757-2-alejandro.vallejo@cloud.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 2 May 2023, at 12:13, Alejandro Vallejo =
<alejandro.vallejo@cloud.com> wrote:
>=20
> xc_domain_getinfolist() internally relies on a sysctl that performs
> a linear search for the domids. Many callers of =
xc_domain_getinfolist()
> who require information about a precise domid are much better off =
calling
> xc_domain_getinfo_single() instead, that will use the getdomaininfo =
domctl
> instead and ensure the returned domid matches the requested one. The =
domtctl
> will find the domid faster too, because that uses hashed lists.
>=20
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Christian Lindig <christian.lindig@cloud.com>

I mostly care about the OCaml bindings - looks good to me.

=E2=80=94 C=

