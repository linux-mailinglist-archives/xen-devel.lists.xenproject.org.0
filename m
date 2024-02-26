Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514C867901
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:49:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685594.1066560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1recI5-0008CF-HB; Mon, 26 Feb 2024 14:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685594.1066560; Mon, 26 Feb 2024 14:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1recI5-00089f-EN; Mon, 26 Feb 2024 14:49:13 +0000
Received: by outflank-mailman (input) for mailman id 685594;
 Mon, 26 Feb 2024 14:49:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fUdy=KD=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1recI3-00088I-NC
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:49:11 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33199918-d4b6-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 15:49:10 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33d6cc6d2fcso2028046f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:49:10 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a7-20020a056000188700b0033d926bf7b5sm8674905wri.76.2024.02.26.06.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:49:09 -0800 (PST)
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
X-Inumbo-ID: 33199918-d4b6-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708958950; x=1709563750; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dOUPYvVjo/EehxOKym7+j+5M3I7j7CMnd3AkYufTkp8=;
        b=RoukmiVf0NoYw2rT4JVHl9eGRmzGGcTtuD1wra2oMkDr6YZgwvfFxsRJ4g3S+z6iRD
         VHsotCXz8FK2O83Xz916TJJFV24rKhwgpuzXQzVmJXik4xxwvZnKLXiyhxYnCWw35/5J
         l6filgaETaAor4H9wu86VVdu0wl3ku68tLUxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708958950; x=1709563750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOUPYvVjo/EehxOKym7+j+5M3I7j7CMnd3AkYufTkp8=;
        b=otlxloPOINlDY6s1d/TAh6IBFly7VGM6LWL/QiWJ1z5h6nwVP+ZKbACpgUFOr/Nnet
         4BgOJNYTkrifCdqNq/tqJZAfC8evPH28DXi3LERpzF4/OJZ4H5/SjDYSqNWFgB1YBRL7
         6gpFMpv+JZv2doprpI8H89HwCXFuQ+mxOU7KOTV5Db0gvGA7/ac63MilvXHank0B//XF
         XlvyyXkJ9fOLB1Vdjlb3VFqlM5hB+aQCVdMaDHzHJq+ulEv994IsnxalfKo2RSFyTq7P
         gQlYi5oiS3hzdXro4CydjzriCFeBXd0tHiCR/v+qzJuKEpGQiJGXP5aurIif+XllvWw6
         uIQg==
X-Forwarded-Encrypted: i=1; AJvYcCWUmozP8KJ+7RqQiOKHhZG19IhZdxjfoY5vSD71QVTy90w9+k88bLxPMH3rzrsDEtCh9yVLmF5UUEW/Q2oXba6ISZn2UHmg0p0VED4GEqY=
X-Gm-Message-State: AOJu0Yxshn5yvecfT2BrePcYfoP/QW6AbzCnkrGpZjJ+LvrJi0EFpY+2
	WfwA4fdmuIxk4uQ7d3aGjIFbbnHnbUkIQKUhyQE/n4byR7SzlC/paeLBeAStbec=
X-Google-Smtp-Source: AGHT+IF1XKTTgvrT37Xr+PlwAeQdI3WPvGyoP3L4v2lDvEB10hkYntEjsUVVek02bAzJDv0ucRQ4IA==
X-Received: by 2002:a5d:52cb:0:b0:33d:89a8:6b99 with SMTP id r11-20020a5d52cb000000b0033d89a86b99mr4198585wrv.70.1708958949758;
        Mon, 26 Feb 2024 06:49:09 -0800 (PST)
Date: Mon, 26 Feb 2024 14:49:08 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] automation: Rework "build-each-commit-gcc" test
Message-ID: <d2cef00e-019d-44d6-9c12-a628455aea88@perard>
References: <20240220140733.40980-1-anthony.perard@citrix.com>
 <e48c4fce-e7f3-4bce-bf7b-2cfcc0659426@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e48c4fce-e7f3-4bce-bf7b-2cfcc0659426@suse.com>

On Mon, Feb 26, 2024 at 10:23:37AM +0100, Jan Beulich wrote:
> On 20.02.2024 15:07, Anthony PERARD wrote:
> > --- a/automation/scripts/build-test.sh
> > +++ b/automation/scripts/build-test.sh
> > @@ -9,6 +9,37 @@
> >  # Set NON_SYMBOLIC_REF=3D1 if you want to use this script in detached =
HEAD state.
> >  # This is currently used by automated test system.
> > =20
> > +# Colors with ANSI escape sequences
> > +txt_info=3D'=1B[32m'
> > +txt_err=3D'=1B[31m'
> > +txt_clr=3D'=1B[0m'
> > +
> > +# $GITLAB_CI should be "true" or "false".
> > +if [ "$GITLAB_CI" !=3D true ]; then
> > +    GITLAB_CI=3Dfalse
> > +fi
> > +
> > +gitlab_log_section() {
> > +    if $GITLAB_CI; then
> > +        echo -n "=1B[0Ksection_$1:$(date +%s):$2
> > =1B[0K"
>=20
> ... there was either corruption on transmit here, or there's an embedded
> newline that I don't know how to deal with.

No corruption here, there is a \r in this string. There's also \e a few
times. Most tools can deal with these characters just fine, so I didn't
even think there could be an issue.

If that byte is really an issue, I could rewrite the patch to use
printf, and I think it would read as:

        printf "\e[0Ksection_$1:$(date +%s):$2\r\e[0K"

Thanks,

--=20
Anthony PERARD

