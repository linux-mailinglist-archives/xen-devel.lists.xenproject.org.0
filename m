Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB7591703C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 20:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748015.1155563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMAu8-0001Qo-Bz; Tue, 25 Jun 2024 18:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748015.1155563; Tue, 25 Jun 2024 18:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMAu8-0001PK-84; Tue, 25 Jun 2024 18:28:32 +0000
Received: by outflank-mailman (input) for mailman id 748015;
 Tue, 25 Jun 2024 18:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMAu7-0001PC-Dk
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 18:28:31 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c2bbe4-3320-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 20:28:30 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7245453319so496769466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 11:28:30 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf560627sm542619166b.148.2024.06.25.11.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:28:29 -0700 (PDT)
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
X-Inumbo-ID: b8c2bbe4-3320-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719340110; x=1719944910; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pko28/t4Wtd90ChhzTiIIVxZnme5thqAQj31u5fTeR4=;
        b=LjyI6DLj2aFNVRgXcka4b30vIqaauW462oC780G5chfALljeu1Jy5GA9WJtYE6+GmR
         JBAqI+XXvjf7CD+0ycO/sfw17pvP1glXTCINbeEjBTLr9X+YP108+XgzPjTCl6F73y7n
         g95zAkYflfGoZUNSMCt4tMuSNB6TZglfUHINDZR8//PQdSOX7LDCmv335pr3H0yATP/X
         v/cQGQTbydXAfmIp03uu/p6sO9+1RQMHEVnY9qYF/kvQm1wffZDzfHp5EuORDRjpAZli
         AmALnCka5XdYdb54IHvPNm/QwU0XF9dbLZrzcNVRTn22ctmlksI5gj1/ceJ7/srGnZ6h
         BhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719340110; x=1719944910;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pko28/t4Wtd90ChhzTiIIVxZnme5thqAQj31u5fTeR4=;
        b=nzyGlpPEh1nLDul0anHfgFTOXq8ofxrxaTdK2lFkYihPFiBU/N+m42gNqYf3XE7t2g
         ORFkEoUpQjghRKKXnxVY6smNIy26CPq9JemxafbcHf2Gw3h9ZzsK5WRIEFmAFM767eM1
         f6cHjmWmotuUFtb1DwWyORR6pJzT9X2Ub/5wqc4L+66Shy0rrPcDHwYORu8erwV8giyD
         KW9q4P123fhQvYU1CIEQH0xQ2VU2Ufh6NZ34mn6NjFqVFORdp4lE4+xoLCZPXdEGBExh
         EoNaWCxmrNoZKofjTwzKMg4Xsgo2nMgdol7eB7SjAcCrvlxFKXw6Q1JFcguQ+9YAXUXr
         HHhw==
X-Forwarded-Encrypted: i=1; AJvYcCVZfh79GNsWWSzaVV9wSuQCa5BYp4S+oiLfmHmUy6q17oBH3YreiaCglMYklBL562YuDN03XdrE4SdvY6D2Imp/+P6gvGOu19ZSx1ncuNY=
X-Gm-Message-State: AOJu0YyjEMPYlEnp+b8pKNLPzHkN4rIAZPmX3wRkYJCxq8MsItElXK9C
	TpXJEmCEJWPOYzpLy0xe1hY4D3IztT5fdvHhPJXBrOOZAC2Kbkpg
X-Google-Smtp-Source: AGHT+IHPrmPluPxoLl54SEeuWo3Es9CqHRGKVvB+oDSTEg5IR+AKqRkRfDH5GL+EtlZ3p3wh9jeZHQ==
X-Received: by 2002:a17:907:710d:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a727fc55f2dmr66938466b.22.1719340109609;
        Tue, 25 Jun 2024 11:28:29 -0700 (PDT)
Message-ID: <ed99047fe78ee829199b42051f5657ba79ef3545.camel@gmail.com>
Subject: Re: [PATCH for-4.19?] Config.mk: update MiniOS commit
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>,  Juergen Gross <jgross@suse.com>
Date: Tue, 25 Jun 2024 20:28:28 +0200
In-Reply-To: <a98ab069-407b-4dee-9052-40ab72890d47@suse.com>
References: <a98ab069-407b-4dee-9052-40ab72890d47@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 09:57 +0200, Jan Beulich wrote:
> Pull in the gcc14 build fix there.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> Probably nice to reference a gcc14-clean MiniOS tree from what is
> going
> to be 4.19.
>=20
> --- a/Config.mk
> +++ b/Config.mk
> @@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?=3D https://xenbits.xen
> =C2=A0QEMU_UPSTREAM_REVISION ?=3D master
> =C2=A0
> =C2=A0MINIOS_UPSTREAM_URL ?=3D https://xenbits.xen.org/git-http/mini-os.g=
it
> -MINIOS_UPSTREAM_REVISION ?=3D b6a5b4d72b88e5c4faed01f5a44505de022860fc
> +MINIOS_UPSTREAM_REVISION ?=3D 8b038c7411ae7e823eaf6d15d5efbe037a07197a
> =C2=A0
> =C2=A0SEABIOS_UPSTREAM_URL ?=3D https://xenbits.xen.org/git-http/seabios.=
git
> =C2=A0SEABIOS_UPSTREAM_REVISION ?=3D rel-1.16.3


