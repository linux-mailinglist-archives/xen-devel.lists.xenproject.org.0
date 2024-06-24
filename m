Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DCB914454
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 10:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746253.1153253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeq4-0005LM-Nn; Mon, 24 Jun 2024 08:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746253.1153253; Mon, 24 Jun 2024 08:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeq4-0005Js-Jn; Mon, 24 Jun 2024 08:14:12 +0000
Received: by outflank-mailman (input) for mailman id 746253;
 Mon, 24 Jun 2024 08:14:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLeq2-0005H5-N0
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 08:14:10 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb4f7687-3201-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 10:14:09 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52cd6784aa4so2866927e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 01:14:09 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cdf448876sm567043e87.237.2024.06.24.01.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 01:14:08 -0700 (PDT)
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
X-Inumbo-ID: bb4f7687-3201-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719216849; x=1719821649; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KRvuxy5PS3VQnoUzMRuCWmN4qlLW1NkpWhVLeA8R8+g=;
        b=UKiXcoABnZIdqKomR1TxJk9+NSvRYVSWoeVpbrg1a8z7cSp4Ipcez7Y+PdR5/WqkCb
         XKv6Uo8RPVBU/KVvbD3uPoR1PP2h89S5DiF4u36E2kYDKsFOwk4vkGI23bkyXXVjEcH1
         tw6SN68NWZbJeOdhAO+3vtVVIzg7EyQFZDQ/JmIFFPD93eEJX/E0MOGBPJh7iyq3reRB
         0GPjcB7v90Xjg7xhXqLzdAbpE8RtiLG3YG7rysC+irw4q2bfJx3TsWqr4YmhX73V+EyW
         S34OSP0kcDyN/UgP+Owg6ShawTbt+4AkzoojIuDX3z9VOob06V9atztvfufWKkkEq/27
         uIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216849; x=1719821649;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KRvuxy5PS3VQnoUzMRuCWmN4qlLW1NkpWhVLeA8R8+g=;
        b=VLI2F72CJMMWGBuzBSDKcWkMdd1I+unABiEQDnFOcF7+fDqh6zP07Ch2TFIgfpOrJl
         d1XzfCR1wlwAcydUx1megiMdfmCEr3mbpCS3Mz5Z+4Q7v0YPxIJmb1rtqqvWCABhnP++
         caUKh8ukFMC/q5ydqtbLDF+ZBqqutZVlE/qlks28oJAqU8OtjklknaN6w8LWm45RD1JG
         Q6TLyE0195nV0JZPoRXVSPWaSo0F1amGYnZkeyUHt+jTxaYwLUDLluoXHvshQL9RDW/b
         7RC2q9yP5jL1mrlvOzl3sojgruavOZvz4ViUq8M+Hj/ncdlwQIscnA/C4h2Gjc+hD7q6
         zyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWptk3QWKyRCrwppjZpGMtNoT28xB6bTj4I7JL0DVfQTbkUj3PsRqo00N4syF/kHKVLFJLIzXhrA+uXxXZYFmQzy/7XHzrqlV1RfNIVdD8=
X-Gm-Message-State: AOJu0YyLp+UqIKMlay7zJi1H+g4K4RXFhSf2KYBWH7HHjUM3l8XFl4RX
	3tyfhlDhf0sc2uhVf5cFK+xJOtzeAl4fmg64xBJzQ/X6Q5SpN/6n
X-Google-Smtp-Source: AGHT+IHhD4eMDwFLrabWsdxKjRtpE7AH1ZLRCbp3lw+KVOYjBFktFBtEm8K85/YKEYqwypM7iEAzug==
X-Received: by 2002:a05:6512:4888:b0:52c:a465:c61f with SMTP id 2adb3069b0e04-52ce18647cemr1931218e87.56.1719216848469;
        Mon, 24 Jun 2024 01:14:08 -0700 (PDT)
Message-ID: <83247825a45be9effa3dde303ed03942ec2a839c.camel@gmail.com>
Subject: Re: [PATCH for-4.19 v2] tools/xl: Open xldevd.log with O_CLOEXEC
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, Anthony PERARD
	 <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
	 <marmarek@invisiblethingslab.com>
Date: Mon, 24 Jun 2024 10:14:07 +0200
In-Reply-To: <20240621161656.63576-1-andrew.cooper3@citrix.com>
References: <20240621161656.63576-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-06-21 at 17:16 +0100, Andrew Cooper wrote:
> `xl devd` has been observed leaking /var/log/xldevd.log into
> children.
>=20
> Note this is specifically safe; dup2() leaves O_CLOEXEC disabled on
> newfd, so
> after setting up stdout/stderr, it's only the logfile fd which will
> close on
> exec().
>=20
> Link: https://github.com/QubesOS/qubes-issues/issues/8292
> Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Also entirely speculative based on the QubesOS ticket.
>=20
> v2:
> =C2=A0* Extend the commit message to explain why stdout/stderr aren't
> closed by
> =C2=A0=C2=A0 this change
>=20
> For 4.19.=C2=A0 This bugfix was posted earlier, but fell between the
> cracks.
> ---
> =C2=A0tools/xl/xl_utils.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
> index 17489d182954..060186db3a59 100644
> --- a/tools/xl/xl_utils.c
> +++ b/tools/xl/xl_utils.c
> @@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char
> *pidfile)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit(-1);
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY|O_CRE=
AT|O_APPEND,
> 0644));
> +=C2=A0=C2=A0=C2=A0 CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY | O_C=
REAT |
> O_APPEND | O_CLOEXEC, 0644));
> =C2=A0=C2=A0=C2=A0=C2=A0 free(fullname);
> =C2=A0=C2=A0=C2=A0=C2=A0 assert(logfile >=3D 3);
> =C2=A0


