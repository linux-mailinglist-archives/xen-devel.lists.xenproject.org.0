Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F267E4358
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628880.980796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NtS-000448-R0; Tue, 07 Nov 2023 15:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628880.980796; Tue, 07 Nov 2023 15:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NtS-00041P-Nc; Tue, 07 Nov 2023 15:21:30 +0000
Received: by outflank-mailman (input) for mailman id 628880;
 Tue, 07 Nov 2023 15:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0NtQ-00040a-RQ
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:21:28 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51a51fd3-7d81-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 16:21:27 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso9739774a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 07:21:27 -0800 (PST)
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
X-Inumbo-ID: 51a51fd3-7d81-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699370486; x=1699975286; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66YjSom72efHjvoTfSu8bC0QVEwneBsVoOrih9Nkp7g=;
        b=k7IV45eplN/6nbyqzrhKvpqyjzj3+IkGftM6VaExAd74oYIyjXAcfEEgU4Hb+waOvd
         8E/VwbCV6wpNuTqW+Jkw7bsEOv7bWfl9UaG1l0jITGdg0E8DsN53Kto96J08epMBv5Bz
         wkOfA/cH7HhOYU4KH5gNlE28tgGg9ihpoe6T2pWDAYBZlY1YO3LvKzAHPFZLnScdu5ZO
         VGjTTt2QgzTi7MW39ipmk0ypSTO9L/+rOBDPBHNgME/t5NBRUlPsHcPmc73QTBSmljWK
         /OTjLMuAh/+fZk9V3o6ZRrN7tpv68NCa855owQ6lkkG4KQl23MbSGpXbIKp+18yChxSt
         7oXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370486; x=1699975286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66YjSom72efHjvoTfSu8bC0QVEwneBsVoOrih9Nkp7g=;
        b=Grkx+tQLttJVLSL0TK4p50XO3ctzzWT6rLnwohZAuskA1vIENtHZ3eUV+pFHboZKUa
         Ym205DSTdjN3n/yJCtlYy66kXTdWbBTOD9YpVkvTba5QN3/4wzhAaMz4kLdIwmnVODmN
         TIOMgHmIqKORjj/emv90cqmfyTv/cnp2B45lXJ3bolTcHa8mguS2pyBoY3RJc5FL4n2j
         hK/t5ZiiSNM3CNezIii5EyvR09LFVluugKWiShfu/yaqb/3mhxfyG1N9N4KKK/wBgabi
         02OhfQHXG6ICZYqyi+9mztREFI8mIWJqQE/as5fpTZCNavF8suG7GHm5wREsE3S20ITG
         BauQ==
X-Gm-Message-State: AOJu0YzIJE+eweruk+9koobrrB84jfpL+WTjwdNVlzi3CaohulNDdyVF
	nBnsvE4zFnXs5T6xsvy+3wzyoot9aLoGWjMbamOG5dZo
X-Google-Smtp-Source: AGHT+IHtdkKnRqzEU7m3nTplhUH/gnABQzH+KkKBxvXw3PI5Tjqy0NSa9GfWyyUuzPB7WH7xKJ2smE1nK0jiCOANEis=
X-Received: by 2002:a05:6402:26c5:b0:53e:343a:76bf with SMTP id
 x5-20020a05640226c500b0053e343a76bfmr32095207edd.1.1699370486557; Tue, 07 Nov
 2023 07:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-14-jgross@suse.com>
 <CAKf6xpvkEAv4RkPB_536=w2ysjuTbja7vsEg_xRTpotNDOGriw@mail.gmail.com> <ce5dca09-206b-4a5f-af27-a27a109f1718@suse.com>
In-Reply-To: <ce5dca09-206b-4a5f-af27-a27a109f1718@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 10:21:13 -0500
Message-ID: <CAKf6xps5w7ZPfycZic5T9rr=cBQe=ek-7FcMpqsXus1SQw_=-A@mail.gmail.com>
Subject: Re: [PATCH 13/29] tools/xenlogd: add 9pfs write request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 9:43=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> On 07.11.23 15:10, Jason Andryuk wrote:
> > On Wed, Nov 1, 2023 at 5:54=E2=80=AFAM Juergen Gross <jgross@suse.com> =
wrote:
> >>
> >> Add the write request of the 9pfs protocol.
> >>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> ---
> >>   tools/xenlogd/io.c | 50 ++++++++++++++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 50 insertions(+)
> >>
> >> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> >> index 6e92667fab..6b4692ca67 100644
> >> --- a/tools/xenlogd/io.c
> >> +++ b/tools/xenlogd/io.c
> >
> >> @@ -1010,6 +1011,51 @@ static void p9_create(device *device, struct p9=
_header *hdr)
> >>       fill_buffer(device, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit)=
;
> >>   }
> >>
> >> +static void p9_write(device *device, struct p9_header *hdr)
> >> +{
> >> +    uint32_t fid;
> >> +    uint64_t off;
> >> +    unsigned int len;
> >> +    uint32_t written;
> >> +    void *buf;
> >> +    struct p9_fid *fidp;
> >> +    int ret;
> >> +
> >> +    ret =3D fill_data(device, "ULD", &fid, &off, &len, device->buffer=
);
> >> +    if ( ret !=3D 3 )
> >> +    {
> >> +        p9_error(device, hdr->tag, EINVAL);
> >> +        return;
> >> +    }
> >> +
> >> +    fidp =3D find_fid(device, fid);
> >> +    if ( !fidp || !fidp->opened || fidp->isdir )
> >
> > I think you want an additional check that the fidp is writable.
>
> The open was done with the correct mode. If fidp isn't writable, the writ=
e()
> will fail with the correct errno.

Oh, right.

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

