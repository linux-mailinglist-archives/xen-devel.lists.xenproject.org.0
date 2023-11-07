Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0DE7E49E7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 21:34:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629014.981040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Sm9-00069W-M3; Tue, 07 Nov 2023 20:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629014.981040; Tue, 07 Nov 2023 20:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Sm9-00067m-J5; Tue, 07 Nov 2023 20:34:17 +0000
Received: by outflank-mailman (input) for mailman id 629014;
 Tue, 07 Nov 2023 20:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0Sm8-00067g-JC
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 20:34:16 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04a589c6-7dad-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 21:34:15 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-540c54944c4so162050a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 12:34:15 -0800 (PST)
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
X-Inumbo-ID: 04a589c6-7dad-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699389255; x=1699994055; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KwFlgLVqP9N497HBw5CtuasDxPZbblx/niRQhjHS9w=;
        b=YQJdOW390/2zRXGux0lU01uZKhSWHYYpO3Ncr57XOhbOSP2zmbR5i7tUoVwBgbuw5c
         UnBOqD8JGhvlMuextFju3jnVYCwl1l/UpjH/SGwIWnX3/mRq6GSjqrAzP5n/gpCyRgDh
         F1FRvigNpmDo93u97JvxCN/8YYIQx/U6s5sH8PFzkJWoqmYOyntSASVQCJ95OzW+QXG7
         WsPv5Zv7pe+P2KIonKH6IeBKwyvoIv6LXUkj2xzv9t3bvBwiqRnoDgKqriUsqTiRtNI8
         KYt7WZpNSdoIjiSIyANX2EohDAqvlyyfqDE6JVGP2eXXgX/KNTFfpBZBpDY/AuicJsiw
         BkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699389255; x=1699994055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KwFlgLVqP9N497HBw5CtuasDxPZbblx/niRQhjHS9w=;
        b=sQEjw0/Y0Iyx8Dl2jYVE7SRrih+q9jwZfJzZjimdKntOAb5x+zp0hSQazw0Ezp+g8p
         f3w5qUOtqYlV1FtgHu7+Jj8E3Iz0m00bHDUPpPd6ZC4/OuopuAdnH9rxWBzdNe2hdCwE
         v2sUmQ4OCV5y7cXbMEnr0E3Jt1wHfYiZe2jWko/o92854wCA4MBW18ORFgM1zMqVA/+A
         TiMqjuk4iab+H5ZTMiCGyG+x4yvwQWHyBpT3amMOGfteLGjMaBFKjVBrQgCRE2/QysPU
         riFdeVguElW2s8ANlfHo6r6L+1M/gXpp8PC44/wpG+HswU3CIhVNhmUJWGJD5wXC9E/r
         I9vg==
X-Gm-Message-State: AOJu0YxHe0wmN8pEz6941kkv+FfFgLwyPwWJs0q9tiU+aAfoRwRI4OO2
	YNuJzJXnmNe8fPriQzFbEu1gT351pPpvpw4oSXA=
X-Google-Smtp-Source: AGHT+IEPqljIvzud/o+AtDkfddm2S05S03lvk3usxJcS5mc1/vKvMHRwMNcwfiuwDa9qkRXYe/ieh1gHZSBHe4L6A5I=
X-Received: by 2002:aa7:c9cf:0:b0:544:96a6:fe7b with SMTP id
 i15-20020aa7c9cf000000b0054496a6fe7bmr3263904edt.7.1699389255066; Tue, 07 Nov
 2023 12:34:15 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-27-jgross@suse.com>
In-Reply-To: <20231101093325.30302-27-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 15:34:03 -0500
Message-ID: <CAKf6xpsOgBJjNEN8xAVFqZS-LB+TxvH3pa-ssLf9+KfgmCqq3A@mail.gmail.com>
Subject: Re: [PATCH 26/29] tools/xenstored: add helpers for filename handling
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 7:29=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add some helpers for handling filenames which might need different
> implementations between stubdom and daemon environments:
>
> - expansion of relative filenames (those are not really defined today,
>   just expand them to be relative to /var/lib/xen/xenstore)
> - expansion of xenstore_daemon_rundir() (used e.g. for saving the state
>   file in case of live update - needs to be unchanged in the daemon
>   case, but should result in /var/lib/xen/xenstore for stubdom)
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

