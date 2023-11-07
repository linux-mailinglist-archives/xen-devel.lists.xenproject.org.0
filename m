Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C37E435B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628889.980805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Nw1-0005Hv-6U; Tue, 07 Nov 2023 15:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628889.980805; Tue, 07 Nov 2023 15:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Nw1-0005Fj-3W; Tue, 07 Nov 2023 15:24:09 +0000
Received: by outflank-mailman (input) for mailman id 628889;
 Tue, 07 Nov 2023 15:24:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0Nvz-0005Fd-Se
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:24:07 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b103310c-7d81-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 16:24:06 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so7635957e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 07:24:06 -0800 (PST)
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
X-Inumbo-ID: b103310c-7d81-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699370646; x=1699975446; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEwnZ5SJPA1aKFYGE3GxerxcpbxRzRaflFuPeENRZwY=;
        b=S756CaJsUYSv4oILcNqOYSJuLqhiPAjLpCuCnQOAf3aQocPTNJki8IUdzXOU/CQw7g
         qX4ajYHHKTG2fgkCmiJ50oMVSuwrbDhaUJfma+hbjhdToY0MtEFtN+DQlEbZhryS8NTs
         ysqhXZxa5O9iEM71V27eT5GQQsFlbC1NBNYuAv+c4HzVeOEYyUeABXSPIOPpwHClsrC+
         TWWLQrOZCXOMhCAKoQ8jVmN1nwThtKlEkajRFdknzQA/eTIqmIxMybd4chkoyETO3+fo
         RKTpr6Jbw4P4GC81HC8kvmToTRQclu9V4EpUqLcM0uu4MlLEG1aLopGS6n445XBdl7b7
         mkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370646; x=1699975446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEwnZ5SJPA1aKFYGE3GxerxcpbxRzRaflFuPeENRZwY=;
        b=nlFQnt/K/1dk7tOXYuqSWm0857e/RvYG9m+4byKDNRaUyqqvGLRp+AqpMX9OmNN/Kd
         jkUb+7qBv2vjLVMOASilN/DAUnNSP3aKurG9Jow9ghZDgpuG8LgI+0qpDfOlIUrHjWoy
         pBKsv8Z+sO8oDBoOFKG1B2Sp/u2z9ZcV67Bv+Q9E0z7E5j6QNXnoUf2zGbWWEFv/QwO2
         ARU6pV4MNiomvpzbff9s4hQgxOlL8NARHVgu3dgfcalfVM1ElvPAss8OG9/87T6JsXZH
         OTZJpvC8opkYvfM0CmVWu6IA+LVKkoHg5DMFwdQRfFvMCw0Wdbyrgfwjpc1+YL6guXnv
         YQVQ==
X-Gm-Message-State: AOJu0Yy6N5IcdEDNSBij7lKfasxiVq33S7muqHwtsqlkAuJKh1haw5Mx
	dLOGQfLqutjcfFNyOwOMm2KkK4NL1nZabvudVdBdxguz
X-Google-Smtp-Source: AGHT+IHJ7zJTDTB8DvIX4Q9mISyCzQ4yD7HgYF7wp0IvNwcY22NWMSUX3CjZQR8lOMEFHEyEK2b86o58itOO96gVV4M=
X-Received: by 2002:a05:6512:ad5:b0:501:bd43:3b9c with SMTP id
 n21-20020a0565120ad500b00501bd433b9cmr30753705lfu.23.1699370646117; Tue, 07
 Nov 2023 07:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-15-jgross@suse.com>
 <CAKf6xpv7kLgRx=-zeX+249aEkKTXVJMaNiMTHbxK4-8kj1g+xA@mail.gmail.com> <d6b2c593-2836-4d48-ac24-61d423355ac5@suse.com>
In-Reply-To: <d6b2c593-2836-4d48-ac24-61d423355ac5@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 10:23:53 -0500
Message-ID: <CAKf6xpvj0KGMzZmpion39p-ujg4_u=KAer5V9+Q8Fd1c--zY=g@mail.gmail.com>
Subject: Re: [PATCH 14/29] tools/xenlogd: add 9pfs read request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 9:49=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> On 07.11.23 15:31, Jason Andryuk wrote:
> > On Wed, Nov 1, 2023 at 5:35=E2=80=AFAM Juergen Gross <jgross@suse.com> =
wrote:
> >>
> >> Add the read request of the 9pfs protocol.
> >>
> >> For now support only reading plain files (no directories).
> >>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> ---
> >>   tools/xenlogd/io.c | 60 ++++++++++++++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 60 insertions(+)
> >>
> >> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> >> index 6b4692ca67..b3f9f96bcc 100644
> >> --- a/tools/xenlogd/io.c
> >> +++ b/tools/xenlogd/io.c
> >
> >> @@ -1011,6 +1012,61 @@ static void p9_create(device *device, struct p9=
_header *hdr)
> >>       fill_buffer(device, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit)=
;
> >>   }
> >>
> >> +static void p9_read(device *device, struct p9_header *hdr)
> >> +{
> >> +    uint32_t fid;
> >> +    uint64_t off;
> >> +    unsigned int len;
> >> +    uint32_t count;
> >> +    void *buf;
> >> +    struct p9_fid *fidp;
> >> +    int ret;
> >> +
> >> +    ret =3D fill_data(device, "ULU", &fid, &off, &count);
> >> +    if ( ret !=3D 3 )
> >> +    {
> >> +        p9_error(device, hdr->tag, EINVAL);
> >> +        return;
> >> +    }
> >> +
> >> +    fidp =3D find_fid(device, fid);
> >> +    if ( !fidp || !fidp->opened )
> >> +    {
> >> +        p9_error(device, hdr->tag, EBADF);
> >> +        return;
> >> +    }
> >> +
> >
> > I think you want to mode check here for readability.
>
> Same reasoning as for the write case: read() will do it for me.
>
> >
> >> +    if ( fidp->isdir )
> >> +    {
> >> +        p9_error(device, hdr->tag, EOPNOTSUPP);
> >> +        return;
> >
> > Hmmm, 9P2000.u supports read on a dir.
> > https://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor30
> > """
> > For directories, read returns an integral number of direc- tory
> > entries exactly as in stat (see stat(5)), one for each member of the
> > directory. The read request message must have offset equal to zero or
> > the value of offset in the previous read on the directory, plus the
> > number of bytes returned in the previous read. In other words, seeking
> > other than to the beginning is illegal in a directory (see seek(2)).
> > """
>
> This is part of "only operations needed for Xenstore-stubdom are implemen=
ted."
> For supporting Linux guests or other stubdoms directory reading must be a=
dded,
> of course.
>
> >
> >> +    }
> >> +    else
> >
> > Since the above is a return, maybe remove the else and un-indent?
> > Though maybe you don't want to do that if you want to implement read
> > on a dir.
>
> Correct.
>
> >
> >> +    {
> >> +        len =3D count;
> >> +        buf =3D device->buffer + sizeof(*hdr) + sizeof(uint32_t);
> >> +
> >> +        while ( len !=3D 0 )
> >> +        {
> >> +            ret =3D pread(fidp->fd, buf, len, off);
> >> +            if ( ret <=3D 0 )
> >> +                break;
> >> +            len -=3D ret;
> >> +            buf +=3D ret;
> >> +            off +=3D ret;
> >> +        }
> >> +        if ( ret && len =3D=3D count )
> >
> > This seems wrong to me - should this be ( ret < 0 && len =3D=3D count )=
 to
> > indicate an error on the first pread?  Any partial reads would still
> > return their data?
>
> If len =3D=3D count there was no partial read, as this would have reduced=
 len.

Right.  I found it confusing since ret > 0 is not an error.  As you
wrote, len !=3D count in that case though.

Preferably with ret < 0:
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Regards,
Jason

