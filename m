Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B311A9242AA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 17:44:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752566.1160779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOffA-0002Iv-Gh; Tue, 02 Jul 2024 15:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752566.1160779; Tue, 02 Jul 2024 15:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOffA-0002HR-DM; Tue, 02 Jul 2024 15:43:24 +0000
Received: by outflank-mailman (input) for mailman id 752566;
 Tue, 02 Jul 2024 15:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOff9-0002HL-BL
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 15:43:23 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf77f1f4-3889-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 17:43:21 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52e7ad786dfso3716479e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 08:43:21 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab101e7sm1802027e87.90.2024.07.02.08.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 08:43:20 -0700 (PDT)
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
X-Inumbo-ID: cf77f1f4-3889-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719935001; x=1720539801; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fInPk7e/oSflLeFe2AjLjwKnGFC8W3dJmONx+yRuP8g=;
        b=WlkrXIeDDMVl+y9XUcZXS/zP7uSe78nybgjBYR7MV7n0zfRARCcPPWFDgo/2WwsmKW
         njB+raBXzRi5K9MNd4XIqYIqDmVkvrFbu+CLRlXAVkznDU3ZBhiUkDjvxEJZRBL3Ruk7
         6AO5STh/K83bTk7Vp/zfOaPiSFdXw/CtkSdCXJB0gxxy1KN2DeZMR+PqldJcWb1EWVYW
         gMLYMmd53Ze3kjNJFdmrzYnk8uuSwYMvQNglLJE3FD+SCZ4eYIREwUjaDY1V3G+Cj5dM
         7n7LzbkM3M1ZbgU6MJktVXmyadYX8TD6V6rX/NtpaKb3jA9Sk5UihhphncrpKLyVvIU6
         5TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719935001; x=1720539801;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fInPk7e/oSflLeFe2AjLjwKnGFC8W3dJmONx+yRuP8g=;
        b=XZ73a5Q+89QSu+kZCBc6Ts8pHkmAjELw6YpxxD1xKDFUTzH/sY6nQ8Kpckx6EUd/is
         lJF7vWnJTOV13m4IWPCwPULI5Ys45E01rgV2DQ98Hd6Em6JciLKRWN+esEwbHwgMNz1v
         MJ4uQjhrlDLHOYUWvuUM4ISFa2ApojHWy7jTO8LvVNXGO5VvwVdIaezhrE6wWF+2Ot+C
         fzCM9QQL4z11JEZNua5E6TYci9SybHMQyggH56yzb+Nh4bZ9L1Ner/Siwa3k8xFhfUR8
         FaOZUdTTOEFq60hFhVp79av7GMqKKvPEtynuMMfr5R2N0Z6hF4UIs/lx/4bIaB25bVN7
         tSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNd/dOmMsgCFGuO4cXPiG3Mqk/tUnBLfr+K8YaF9sLOOCbnoT0ZR6iY2bzKItWedbVWgXCL25EeMPRgLBirDGOLk4R7T6pnp7LCGpK03I=
X-Gm-Message-State: AOJu0Yznvpw8bQQWEmjw4TiYJ/DjyJ4bI1TUWPBgqW7BBBMz0hsDjLiu
	cSgIwQsUIUMlTV8OeD1ndVwshASUvBPLz5NFJkyArR1oH+UL1wtv
X-Google-Smtp-Source: AGHT+IH0cl/7g1ZJ42GFMWUzvpk1FF2rFOoxHh/LSm7w28JTRw3CKnBfY49Wa54lD6nX1lex9OsiMw==
X-Received: by 2002:a05:6512:e95:b0:52e:8919:2fe9 with SMTP id 2adb3069b0e04-52e891930cemr2143651e87.11.1719935000638;
        Tue, 02 Jul 2024 08:43:20 -0700 (PDT)
Message-ID: <8acd342ca784e14f9a7d22f5c2dd25ab24dce5bb.camel@gmail.com>
Subject: Re: [PATCH for-4.19] xen: Fix XEN_EXTRAVERSION after 4.19-rc1
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 02 Jul 2024 17:43:19 +0200
In-Reply-To: <0f719364-4125-46bb-bcea-35ad3b4a0f32@citrix.com>
References: <20240702134310.1307657-1-andrew.cooper3@citrix.com>
	 <643ada7e-b265-4283-9c52-f6cf6239fe26@suse.com>
	 <0f719364-4125-46bb-bcea-35ad3b4a0f32@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-02 at 15:15 +0100, Andrew Cooper wrote:
> On 02/07/2024 3:14 pm, Jan Beulich wrote:
> > On 02.07.2024 15:43, Andrew Cooper wrote:
> > > EXTRAVERSION needs a . separator for numbers.
> > Not exactly. It needs the 0 dropped, if we follow what we've done
> > in the
> > past. Then ...
> >=20
> > > =C2=A0Currently, the banner reports:
> > >=20
> > > =C2=A0 __=C2=A0 __=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 _=C2=A0 _=C2=A0=C2=A0=C2=A0 _=C2=A0 ___=C2=A0=C2=A0 ___
> > > =C2=A0 \ \/ /___ _ __=C2=A0=C2=A0 | || |=C2=A0 / |/ _ \ / _ \=C2=A0=
=C2=A0=C2=A0 _ __ ___
> > > =C2=A0=C2=A0 \=C2=A0 // _ \ '_ \=C2=A0 | || |_ | | (_) | | | |__| '__=
/ __|
> > > =C2=A0=C2=A0 /=C2=A0 \=C2=A0 __/ | | | |__=C2=A0=C2=A0 _|| |\__, | |_=
| |__| | | (__
> > > =C2=A0 /_/\_\___|_| |_|=C2=A0=C2=A0=C2=A0 |_|(_)_|=C2=A0 /_/ \___/=C2=
=A0=C2=A0 |_|=C2=A0 \___|
> > >=20
> > > and xl reports:
> > >=20
> > > =C2=A0 # xl info xen_version
> > > =C2=A0 4.190-rc
> > >=20
> > > Fixes: 4a73eb4c205d ("Update Xen version to 4.19-rc")
> > > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> I'm happy either way, but it definitely needs changing from what is
> here
> now.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


