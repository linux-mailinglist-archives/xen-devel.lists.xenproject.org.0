Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E320048A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 11:04:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmCw7-0000wg-7w; Fri, 19 Jun 2020 09:03:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jg7u=AA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jmCw5-0000wb-Oc
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 09:03:45 +0000
X-Inumbo-ID: c75643a4-b20b-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c75643a4-b20b-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 09:03:45 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r15so8389396wmh.5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=eqGVTaL7I09fSt8xiiKydMdPTw03g9WyqCugj1c7ZRA=;
 b=WHZegl49L3AkFCgz3WyYZZbEvupHczYEKrdM1x6tWtAezTNUXZBegkTQukvdkW707A
 6dxg9RLez7dkRHPxfd7qtiHLBdxozDGoNK24+x7iXX2VKl1f1RnGpAivJ9JeRJsaniwE
 OZA/7X9gVSsadd5s8rkvYY1MKSNo9N7Lc+sn8D5EMJi6CSECyZ4aLUAY6IrndZDHLQSK
 vsjLCnypQXQ0JN6ABfEk7UPJQXXGQDwq/B+QIJRjEw9jf7+/JZTGS7zPbPRh1xMX4A8J
 3n+p45V3dd/TzpmoWS7qrq/wIYjQ96oWWpgXUTSxv9rVlc8jdTHvADOLSSN5UuJtPlY5
 jHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=eqGVTaL7I09fSt8xiiKydMdPTw03g9WyqCugj1c7ZRA=;
 b=BXTTdDUOpBcR35Lj+Vcitgw6yUgL5HCUHtwN4ZmbAcb/K8IRacU/4z6xZ2YfqTLdnZ
 uZqtiK3+oI/kFRhT7A3OUZX7SaXje5Fi+1H1mVg7/gwfpx7ois30hCFQn2jyW5peHNOj
 Zbd+nCgMb+Yl8BVsEdtuUbGYmwH6Sa+JhbY6y8Crub/a1+YLWuV3mxRsxcMIc3ZhtzU6
 GZpnjssNeBHJeiY3roNmdzDz/LIfxVWFcDvSXzYbY370Ph07GtgNuZ2/C79DuNbR4Nvc
 /JbRhSLU+IgUcCXoja5Ul1XVQaQJH+rDPjleethCZSX2riOCdSsKv7qgJnfS83XhWQlU
 imNQ==
X-Gm-Message-State: AOAM533yqNuf+jvs06EX4x23DkAMA7yDz07kKwDT0RoaF+AWbPgCRCTh
 GB09pBybEd0Ox7SXoFjhnmY=
X-Google-Smtp-Source: ABdhPJzuTfHjOBExJd3YwtBUHiqSp3UHmcldRUcFGypgt2huvdymHXtQIIzqnWZVOgUAKmQBDbZxSw==
X-Received: by 2002:a1c:7f87:: with SMTP id a129mr2857945wmd.10.1592557424353; 
 Fri, 19 Jun 2020 02:03:44 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.188])
 by smtp.gmail.com with ESMTPSA id h188sm6418392wmh.2.2020.06.19.02.03.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 02:03:43 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Boris Ostrovsky'" <boris.ostrovsky@oracle.com>,
 "'Souptick Joarder'" <jrdr.linux@gmail.com>, <jgross@suse.com>,
 <sstabellini@kernel.org>
References: <1592363698-4266-1-git-send-email-jrdr.linux@gmail.com>
 <d9e8ad0f-f2aa-eea4-5bc7-a802c626ace6@oracle.com>
In-Reply-To: <d9e8ad0f-f2aa-eea4-5bc7-a802c626ace6@oracle.com>
Subject: RE: [RFC PATCH] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
Date: Fri, 19 Jun 2020 10:03:42 +0100
Message-ID: <00a901d64618$888e12a0$99aa37e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLNWdkmTQEG0NOkr/mSq3vuIFPj4QGVx8AxpuTONkA=
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 'John Hubbard' <jhubbard@nvidia.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Sent: 17 June 2020 18:57
> To: Souptick Joarder <jrdr.linux@gmail.com>; jgross@suse.com; =
sstabellini@kernel.org
> Cc: xen-devel@lists.xenproject.org; linux-kernel@vger.kernel.org; John =
Hubbard <jhubbard@nvidia.com>;
> paul@xen.org
> Subject: Re: [RFC PATCH] xen/privcmd: Convert get_user_pages*() to =
pin_user_pages*()
>=20
> On 6/16/20 11:14 PM, Souptick Joarder wrote:
> > In 2019, we introduced pin_user_pages*() and now we are converting
> > get_user_pages*() to the new API as appropriate. [1] & [2] could
> > be referred for more information.
> >
> > [1] Documentation/core-api/pin_user_pages.rst
> >
> > [2] "Explicit pinning of user-space pages":
> >         https://lwn.net/Articles/807108/
> >
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > ---
> > Hi,
> >
> > I have compile tested this patch but unable to run-time test,
> > so any testing help is much appriciated.
> >
> > Also have a question, why the existing code is not marking the
> > pages dirty (since it did FOLL_WRITE) ?
>=20
>=20
> Indeed, seems to me it should. Paul?
>=20

Yes, it looks like that was an oversight. The hypercall may well result =
in data being copied back into the buffers so the whole pages array =
should be considered dirty.

  Paul

>=20
> >
> >  drivers/xen/privcmd.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> > index a250d11..543739e 100644
> > --- a/drivers/xen/privcmd.c
> > +++ b/drivers/xen/privcmd.c
> > @@ -594,7 +594,7 @@ static int lock_pages(
> >  		if (requested > nr_pages)
> >  			return -ENOSPC;
> >
> > -		pinned =3D get_user_pages_fast(
> > +		pinned =3D pin_user_pages_fast(
> >  			(unsigned long) kbufs[i].uptr,
> >  			requested, FOLL_WRITE, pages);
> >  		if (pinned < 0)
> > @@ -614,10 +614,7 @@ static void unlock_pages(struct page *pages[], =
unsigned int nr_pages)
> >  	if (!pages)
> >  		return;
> >
> > -	for (i =3D 0; i < nr_pages; i++) {
> > -		if (pages[i])
> > -			put_page(pages[i]);
> > -	}
> > +	unpin_user_pages(pages, nr_pages);
>=20
>=20
> Why are you no longer checking for valid pages?
>=20
>=20
> -boris
>=20
>=20
>=20



