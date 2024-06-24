Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D681F914DC5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 14:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746592.1153706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjDL-0006hI-VS; Mon, 24 Jun 2024 12:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746592.1153706; Mon, 24 Jun 2024 12:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjDL-0006es-SD; Mon, 24 Jun 2024 12:54:31 +0000
Received: by outflank-mailman (input) for mailman id 746592;
 Mon, 24 Jun 2024 12:54:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLjDK-0006Iy-Rh
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 12:54:30 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4f78973-3228-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 14:54:29 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57d106e69a2so3834846a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 05:54:29 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30562bd5sm4635002a12.92.2024.06.24.05.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 05:54:28 -0700 (PDT)
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
X-Inumbo-ID: e4f78973-3228-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719233669; x=1719838469; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6KX+pU8kylpaQJrLtGtQ/eht7vzalxwqeLKxO1kolxM=;
        b=ArAmsdqZtNKiaHG6jPhM6Af3dB9RwwNBHbhtdFneOVvSZ5USTNhqFP4x/DDdy8gBwV
         /UKwcntArpa/A4DcHCHKlXE0ngvyRcVLDqccj4gi/lv9JhokfXrF+m3xKM1iELdO+hXT
         gPVZy7xIUND7wGOnaJCnEgxdGmCnUD1MCgABjdZY5sB6bSv9IpXWDh6DgBxOTEXV1ybR
         mDdWfP5bBPPcDC8eSfwKPIwanihZnUCPxabXppg90cyiWJY7ah0agx4B/lUZ/q4oyWQD
         I/hB9w+E8MmjYcZazgabt8xM7RL1lOcQabQRXSCuWmcb5PmPyLCqw+qxCg007Tqol28a
         DHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719233669; x=1719838469;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6KX+pU8kylpaQJrLtGtQ/eht7vzalxwqeLKxO1kolxM=;
        b=mXESU9mOmDKUmvR887dXX5mHJT/LzQY/9WdScz/XxpNRI2xxQITKiccgAcuFGenK5E
         NA/Dnxg2GrEzB/xz385FKHcIdS3+fLvINT07v/QddTnNO0seRKJuofuyDFVjE07ZJ+Ef
         zGe+Oe9COb7jo7EuWvNSN4d+cQ2J6wrms12Q0MW3iYHz288b/gOtdtPS6Wna/dSjGfze
         /04oT5BC+FXF5t1LudszJ4W4UNUzh1bXgn4dgMG/bGsP1MB3LgzD8P0HH1n9+RLr51Ac
         DOyhJ0xx/Hd9UT9fI58CW3jrRwpxBy6xPuvP+B8ww4Ln109rNWcU8qbeZuCyVyDOhECW
         t3AA==
X-Forwarded-Encrypted: i=1; AJvYcCXPUCKLjf0xQtsm6haZnzKjN6vetTx6NIuaN8z0ibiu0bF6V71dE0e1Ag2yuXUR0DOrxI9Xp6F5ClDlAMvqTQ18MaSgWia0VX7IdteWOW0=
X-Gm-Message-State: AOJu0Yz5xjRxq59VSoOYcYgrolYzKFfrJLujwPQIkw8HRSOWkIOOLLqh
	qigjhUj7Agh+a+Q3XLCLWuxkYu1aQtFplRXHI9o6R8lpxw7rMP3AqBsvEgLO
X-Google-Smtp-Source: AGHT+IHC+xc+elLTGD9n88zrbwdp5Ki05q2/Zk/tOInRsZTHNZlY1P7wDGccozoc9yaduINzIJSgRw==
X-Received: by 2002:a05:6402:34c6:b0:57d:45af:112c with SMTP id 4fb4d7f45d1cf-57d45af127amr4996691a12.4.1719233668650;
        Mon, 24 Jun 2024 05:54:28 -0700 (PDT)
Message-ID: <1a3c3c12182393f202c709a06de99b85673c7ed5.camel@gmail.com>
Subject: Re: [PATCH for-4.19] tools/xenalyze: Remove argp_program_bug_address
From: Oleksii <oleksii.kurochko@gmail.com>
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>, Andrew Cooper
	 <andrew.cooper3@citrix.com>
Date: Mon, 24 Jun 2024 14:54:27 +0200
In-Reply-To: <20240624104930.1951521-1-george.dunlap@cloud.com>
References: <20240624104930.1951521-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-06-24 at 11:49 +0100, George Dunlap wrote:
> xenalyze sets argp_program_bug_address to my old Citrix address.=C2=A0
> This
> was done before xenalyze was in the xen.git tree; and it's the only
> program in the tree which does so.
>=20
> Now that xenalyze is part of the normal Xen distribution, it should
> be
> obvious where to report bugs.
>=20
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
> Freeze exception justification: This is only a change in
> documentation.
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>=20
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> =C2=A0tools/xentrace/xenalyze.c | 3 ---
> =C2=A01 file changed, 3 deletions(-)
>=20
> diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
> index d95e52695f..adc96dd7e4 100644
> --- a/tools/xentrace/xenalyze.c
> +++ b/tools/xentrace/xenalyze.c
> @@ -10920,9 +10920,6 @@ const struct argp parser_def =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0 .doc =3D "",
> =C2=A0};
> =C2=A0
> -const char *argp_program_bug_address =3D "George Dunlap
> <george.dunlap@eu.citrix.com>";
> -
> -
> =C2=A0int main(int argc, char *argv[]) {
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Start with warn at stderr. */
> =C2=A0=C2=A0=C2=A0=C2=A0 warn =3D stderr;


