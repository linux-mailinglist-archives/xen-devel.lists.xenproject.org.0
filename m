Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA616A5CAC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 17:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503518.775790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2PL-0003DA-I0; Tue, 28 Feb 2023 16:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503518.775790; Tue, 28 Feb 2023 16:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2PL-0003Aq-FA; Tue, 28 Feb 2023 16:00:51 +0000
Received: by outflank-mailman (input) for mailman id 503518;
 Tue, 28 Feb 2023 16:00:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pX2PJ-0003Ak-78
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 16:00:49 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 113e42c4-b781-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 17:00:48 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id s22so13836841lfi.9
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 08:00:48 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 i26-20020a056512007a00b004a0589786ddsm1390308lfo.69.2023.02.28.08.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 08:00:47 -0800 (PST)
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
X-Inumbo-ID: 113e42c4-b781-11ed-9695-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5oLrTsmo5DP2t57tNcUhgSb25T6lEvw2eBBMdK+tYaU=;
        b=XKfoCX+eUGGbN+xbdIfINzzCi99W/fpoFLa5n/nhfmy30+0h/QgBxp6LB8vf55uJpZ
         gpkwsUP4N+w64OOwEjIv79IGRfa++AS4bXtZUXIj03tdsRx9P/CSN7/KZ9eYrPIthMco
         c+EUmQg6hS9wCxMVBnRBp8NfE+9EBlXdX23Tty9T1gTwyEjTmOPKBpvCe/gzYDjxQh1v
         Q6nLWVSvTBaqFJtIxD5QX4QLNDPKejGnEIPiXG6mjchmi3Eoq0wdDResrrAKjNorw4/Z
         iDtI6TF+TXD7mV3lvjbrYjvQ/v3djrG/lYKiEYN9/wwhzikOk3Run7Y2McXVNcBMEAaZ
         ctXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oLrTsmo5DP2t57tNcUhgSb25T6lEvw2eBBMdK+tYaU=;
        b=pVj5CQsCRY4MnWgUTkFs2siEUE9pVPabbpwK5YzMG6ybraEEozmVeS1AhHBaRgKujV
         wmoSt+w9IFIu6yCBTOHSENPkjC2V+INbL59cMNG6n3ZOWSA7SOdiwAN2Gpq/M2v7a5yG
         qHWFNyLXHQVSyJ7gJZnts4nk+y1C9v1f2X7wSake5cDn6W0RCeBj5XE7yNbx1zi5DbxE
         tXwH5SlnP1DpevGvw5kmE4C2deL7E9j5G28FdaVzzjuX83hn0Jh39diKQADeoECBTHF8
         Mt4nvyXJMDL9XkU+26Z13WxAsKjhfAkpZoFbYoUb7JY4EVaEI9kNv0CszcIs0PHNGVk7
         RfWA==
X-Gm-Message-State: AO0yUKXxlZmDURX0JE0dwwlG1+Z9nMlGszl3ePEXg3tZ/jl+iSus3Pxe
	cR9PJh4s+4lMC619aVW1H18=
X-Google-Smtp-Source: AK7set/jj9BW/DhnCWdL5AG6rwlgWIeb1rbSbCXrjgZX/CSpnyxXEtmwLFo1komzXlMosAhy4urTCw==
X-Received: by 2002:ac2:4a79:0:b0:4db:3847:12f0 with SMTP id q25-20020ac24a79000000b004db384712f0mr985586lfp.50.1677600047870;
        Tue, 28 Feb 2023 08:00:47 -0800 (PST)
Message-ID: <6ff1684cdea34004525e4931f00aa5a9c89b28a9.camel@gmail.com>
Subject: Re: [PATCH v3 2/4] xen: change <asm/bug.h> to <xen/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 28 Feb 2023 18:00:44 +0200
In-Reply-To: <58615dc6-0d89-bbcf-acce-73a5cd943cc4@suse.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <19404db4a577e17dffef85a101449a507965be19.1677233393.git.oleksii.kurochko@gmail.com>
	 <468d6130-739e-4b0e-44e7-5aab520a0cac@xen.org>
	 <e22d11d172226cab566a5e0f79d6cf51f402d3ad.camel@gmail.com>
	 <58615dc6-0d89-bbcf-acce-73a5cd943cc4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-02-28 at 14:30 +0100, Jan Beulich wrote:
> On 28.02.2023 14:07, Oleksii wrote:
> > On Sat, 2023-02-25 at 16:47 +0000, Julien Grall wrote:
> > > On 24/02/2023 11:31, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/arm/include/asm/bug.h
> > > > +++ b/xen/arch/arm/include/asm/bug.h
> > > > @@ -1,6 +1,8 @@
> > > > =C2=A0 #ifndef __ARM_BUG_H__
> > > > =C2=A0 #define __ARM_BUG_H__
> > > > =C2=A0=20
> > > > +#include <xen/types.h>
> > >=20
> > > You are not adding new code in bug.h, so can you explain why this
> > > is
> > > now=20
> > > necessary?
> > I am not adding new code but inside 'struct bug_frame' there are
> > uint16_t and uint32_t which are defined in <xen/types.h>.
> >=20
> > And after <asm/bug.h> was changed to <xen/bug.h> it started to
> > complain
> > on these types.
>=20
> Wouldn't xen/bug.h want to include xen/types.h anyway, and then
> clearly
> before including asm/bug.h?
<xen/types.h> can be moved to <xen/bug.h> but generic implementation
doesn't use any specific from <xen/types.h> types.
But probably you are right that it would be better move to
<xen/bug.h>...
>=20
> Jan
~ Oleksii


