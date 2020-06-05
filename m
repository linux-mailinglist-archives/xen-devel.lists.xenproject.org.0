Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4171EF6E6
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 13:58:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhAzO-0001Sx-86; Fri, 05 Jun 2020 11:58:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ATx=7S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jhAzN-0001Sr-GU
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 11:58:21 +0000
X-Inumbo-ID: d9a70752-a723-11ea-ba62-bc764e2007e4
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9a70752-a723-11ea-ba62-bc764e2007e4;
 Fri, 05 Jun 2020 11:58:21 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id x14so9483626wrp.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=X70M0hlzZe8eXowF5APwX6NaELX9i1ZwBfvg/wb42UU=;
 b=YMwsAhHQJQpd101MeIH3DDI41TfllaBIGK3NVl4qz+Q72cYOcPwUbqopTD4c60OBTh
 uU13SOW96YHmLdaWMKmuBN1G71cy/JMrQnB82PKISkYWVu2F9Po88jAn3PgBjDWRbzuJ
 +fNh9RxKVu108bhPGmzep1hMeILgfsKv2o2pVqgTgHh94byKu4J75WA+m9ZjDV755JRY
 7RiCLjT9h8TTidqv3L/dn4uIk0354vLsIkMKhzqIV/hTGJlcCHFLiPBAKcpaI/vNP9RX
 HxdULG0v/a3afsqLH5Yadad4ng3ANvWRVdrTreTx+zTFGDK4i0Bv5rh4BTUhr252onp+
 j9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=X70M0hlzZe8eXowF5APwX6NaELX9i1ZwBfvg/wb42UU=;
 b=DPj0Dg3R7+g66kSSYB6a44QjZ1PTjv7kwHbw6SBKzvpaKkf0M2+xsRJEd4k7le3fxB
 lkw4z1bK8NtXj8Dn0KzGebh9//nj+FuW3T1paq21sE4aV4WTg/qvA9YfYNShB+1JpYBB
 8zTe0L34iqp7A7rpjeiaOCgWTbMvVdZ+GA5XNxF8DXALanpAAqviF4deEa5UPWKIt7X+
 FLo7OCQjBbGp3mHVz/lkLy0QGhL8qk0jD8QxoGrI8IFMNR59M76OEewrwdymBPeCkXD3
 lg2E18olU3XfoAWXb5jTyrvDqhODDBQYpJF78Wmu8GKd81Dq4LjKkLiBkso1glI1OwAz
 XSjw==
X-Gm-Message-State: AOAM532fshoRId9bzWETSqxyl82aPZHU2mOkJcukDkoknLWVAQTLpi1r
 i43QKl1qqYTfUBDLPBIAKck=
X-Google-Smtp-Source: ABdhPJzzk81kTzUgl4+UgSD5CtnQysKx6Y8qRJBuYHCOhNC6BxIoFviWwifSRgLUkqDlsYgetLgT3w==
X-Received: by 2002:a5d:4f81:: with SMTP id d1mr9760699wru.95.1591358300265;
 Fri, 05 Jun 2020 04:58:20 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id d17sm13305715wrg.75.2020.06.05.04.58.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 04:58:19 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?UTF-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Wei Liu'" <wl@xen.org>,
 "'Xen Development List'" <xen-devel@lists.xenproject.org>
References: <20200605113725.30982-1-wl@xen.org>
 <034b6887-640e-a051-3821-00ef7615e010@suse.com>
In-Reply-To: <034b6887-640e-a051-3821-00ef7615e010@suse.com>
Subject: RE: [PATCH for-4.14] libs/hypfs: use correct zlib name in pc file
Date: Fri, 5 Jun 2020 12:58:18 +0100
Message-ID: <000901d63b30$9ae387c0$d0aa9740$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJZ2oA9oTpBQ9HF2jO5jtyhfN6PPAK/A/bLp6yz+LA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Olaf Hering' <olaf@aepfle.de>, 'Ian Jackson' <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 05 June 2020 12:43
> To: Wei Liu <wl@xen.org>; Xen Development List =
<xen-devel@lists.xenproject.org>
> Cc: Olaf Hering <olaf@aepfle.de>; paul@xen.org; Ian Jackson =
<ian.jackson@eu.citrix.com>
> Subject: Re: [PATCH for-4.14] libs/hypfs: use correct zlib name in pc =
file
>=20
> On 05.06.20 13:37, Wei Liu wrote:
> > Its name is "zlib" not "z".
> >
> > Reported-by: Olaf Hering <olaf@aepfle.de>
> > Fixes: 86234eafb952 ("libs: add libxenhypfs")
> > Signed-off-by: Wei Liu <wl@xen.org>
>=20
> Reviewed-by: Juergen Gross <jgross@suse.com>
>

Release-acked-by: Paul Durrant <paul@xen.org>


