Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6360A7E419B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 15:11:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628826.980686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0MnG-00077J-FF; Tue, 07 Nov 2023 14:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628826.980686; Tue, 07 Nov 2023 14:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0MnG-00075e-Bo; Tue, 07 Nov 2023 14:11:02 +0000
Received: by outflank-mailman (input) for mailman id 628826;
 Tue, 07 Nov 2023 14:11:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0MnE-00075Y-Rg
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 14:11:00 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79730d78-7d77-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 15:10:58 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-543456dbd7bso13206709a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 06:10:58 -0800 (PST)
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
X-Inumbo-ID: 79730d78-7d77-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699366258; x=1699971058; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bKnIIB72ox/iOHMI/H45sERBMIycmqokFpkkrFFrjs=;
        b=UV1jT2oErzpFja3sutJMCAcB2+uGovXZ4TWSuYL0TsBAIYJnp5dK22O2GmLbsV1tjl
         iTquTlJX+hxa+pr8F9Vv6Ido853jMj/4LPfJEop54pPKdLJF6B7L6CQh7x49oyzZhdRv
         YJgoS2Tnx/EnZcA5XMSGlm8nROJ6e/PEmk0R0kLS72gt+Q2GRGxU6i6ADpZUj30Y4PyF
         QNwPG0tjVgMzXXH2uyEgGZ76pKslYk/NpQqRVv6uo/hYC6Zx7cD82FAfQwCXlm+Ij3GS
         HgdhN7ZIRUIplQlympkGVHo5t1JYLdEWset57J3Ptd3NRueR+MCNqBYSxuIBQy7uFC5C
         vaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699366258; x=1699971058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bKnIIB72ox/iOHMI/H45sERBMIycmqokFpkkrFFrjs=;
        b=MOlH6xwBX+T0KKd1zv/jMS54T+XzVM8hkk2xLOKuXf/F66u37/afKYt7tV+4XpNDa/
         zfL0IluZxPhgwXdzhNfdgTQbH9nZtRuu6xO2TI5XbPTN+t4CVm4NFs2fkl/Z2ayqCB0p
         ZQrAL38zOz+PMHJqI2FHcqo4eRND/NWxcisuwl03kk/NWwKEgPpD+aglqyE/94eYNznb
         EAfht1IrQDH1LEB9IdkDcLKjGVFL5NDyvgY3ZqBj/PHKMvGltvW1VZ8CXl8qjBy0UBtO
         wd5I+SbVCVBt0+hnO70p6giy6KYwDHHaUMUtOirZeYe0I2s4jGBb6VmCTN/eizRAOg2N
         H26g==
X-Gm-Message-State: AOJu0Yw6ffrdiUlF5kJZpXUTs8ZujtnbNROn0uXsKEMQaj2uxTgzhkQc
	ecfa0+DcprSvZdiGyPbKChex/4zEWvfeyOtcVsQ=
X-Google-Smtp-Source: AGHT+IH5lqA8Z1f78tZcXY25H0LKd8HCch2aOWNtfFToiOapl/TV2LDYqzhInUSQzuaE9ZUFhh9G2jbqZqCWp0Ob7DQ=
X-Received: by 2002:a17:906:f84d:b0:9b2:b37d:17ff with SMTP id
 ks13-20020a170906f84d00b009b2b37d17ffmr2520308ejb.19.1699366258228; Tue, 07
 Nov 2023 06:10:58 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-14-jgross@suse.com>
In-Reply-To: <20231101093325.30302-14-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 09:10:46 -0500
Message-ID: <CAKf6xpvkEAv4RkPB_536=w2ysjuTbja7vsEg_xRTpotNDOGriw@mail.gmail.com>
Subject: Re: [PATCH 13/29] tools/xenlogd: add 9pfs write request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:54=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the write request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xenlogd/io.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> index 6e92667fab..6b4692ca67 100644
> --- a/tools/xenlogd/io.c
> +++ b/tools/xenlogd/io.c

> @@ -1010,6 +1011,51 @@ static void p9_create(device *device, struct p9_he=
ader *hdr)
>      fill_buffer(device, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
>  }
>
> +static void p9_write(device *device, struct p9_header *hdr)
> +{
> +    uint32_t fid;
> +    uint64_t off;
> +    unsigned int len;
> +    uint32_t written;
> +    void *buf;
> +    struct p9_fid *fidp;
> +    int ret;
> +
> +    ret =3D fill_data(device, "ULD", &fid, &off, &len, device->buffer);
> +    if ( ret !=3D 3 )
> +    {
> +        p9_error(device, hdr->tag, EINVAL);
> +        return;
> +    }
> +
> +    fidp =3D find_fid(device, fid);
> +    if ( !fidp || !fidp->opened || fidp->isdir )

I think you want an additional check that the fidp is writable.

Regards,
Jason

