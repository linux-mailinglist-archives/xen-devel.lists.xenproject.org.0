Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2E7C71E7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 17:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615891.957415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqy2q-0006cE-Jx; Thu, 12 Oct 2023 15:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615891.957415; Thu, 12 Oct 2023 15:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqy2q-0006Zn-HK; Thu, 12 Oct 2023 15:56:16 +0000
Received: by outflank-mailman (input) for mailman id 615891;
 Thu, 12 Oct 2023 15:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JG3O=F2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qqy2p-0006Zg-78
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 15:56:15 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de5f0ad0-6917-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 17:56:13 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507973f3b65so318000e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 08:56:13 -0700 (PDT)
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
X-Inumbo-ID: de5f0ad0-6917-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697126172; x=1697730972; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gm3NcfOf4NiJvL6gxng7QagtfQexuBA+kuLkJj2lEdY=;
        b=CRV2G76vrd/trYMPV0W7bekV7ejT7Rta8LV6uORN3IY+IW9CA7P30bc6bvx+OuvoHK
         Up7k5vl5cPnLimRtpkkYMVJ2o7ZpUxsjSTJnZlcCU7B3i850imnxw4s2hwkOzdEL0opK
         LtlI6Rb9GiXV1Nru61VrWMpJAfbiZJtjVgn4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697126172; x=1697730972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gm3NcfOf4NiJvL6gxng7QagtfQexuBA+kuLkJj2lEdY=;
        b=OSZRFOeAHOlh93PnGxRvF/JTL/lbyNbyCZ8y+g1ckHGGkPdS74gsKMo/sHBADvVhwi
         sSmv8dpfVQGFIMeEByLca6McA61SibgjSZRyb+sJVu52nNfrZfQmpQ8/zzlCoOxkeRi1
         lNRDop10Vg/oG7RZ9+G15Q01VXi0JLAv498Gk8/4XgXWkJWTgWe5+Npi9V/LBLgjFTao
         nnifBGQX1u3xtIxljlsY/eiXJ9iuYmbwRBKTNJ7FP4UX5MRXZJ7FNNYDse4SpbnHNwVk
         PrylihCiku4Lk2+1u4mvI2vs+Ph0HhwLN5C06IVTDanq7VwqgB6zphq3om9yPBchJfQX
         EZqA==
X-Gm-Message-State: AOJu0YyKSSsfmRcB4XhDYKX0WYeKlOimewNgX7r4AOhiOl83q+Cl7cmZ
	LHbPVBPxOk8TYfpwQCXUMn2Tg/4M185wzj2C3zmMJA==
X-Google-Smtp-Source: AGHT+IFia2H17ZzguktfthVbBAKew73rNhneTsIh1sqkfJWMfpVfL9PIwU0a93cbpjPS44ygxuuf/XdQKFND8xX24js=
X-Received: by 2002:a19:ca4a:0:b0:507:97a3:ae3c with SMTP id
 h10-20020a19ca4a000000b0050797a3ae3cmr161674lfj.11.1697126172525; Thu, 12 Oct
 2023 08:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com> <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 12 Oct 2023 16:56:01 +0100
Message-ID: <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
Subject: Re: Xen 4.18 release: Reminder about code freeze
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	"jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, 
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"

> > Stop tinkering in the hope that it hides the problem.  You're only
> > making it harder to fix properly.
>
> Making it harder to fix properly would be a valid reason not to commit
> the (maybe partial) fix. But looking at the fix again:
>
> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index a6cd199fdc..9cd6678015 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -989,6 +989,7 @@ static struct domain *introduce_domain(const void *ctx,
>                 talloc_steal(domain->conn, domain);
>
>                 if (!restore) {
> +                       domain_conn_reset(domain);
>                         /* Notify the domain that xenstore is available */
>                         interface->connection = XENSTORE_CONNECTED;
>                         xenevtchn_notify(xce_handle, domain->port);
> @@ -1031,8 +1032,6 @@ int do_introduce(const void *ctx, struct connection *conn,
>         if (!domain)
>                 return errno;
>
> -       domain_conn_reset(domain);
> -
>         send_ack(conn, XS_INTRODUCE);
>
> It is a 1-line movement. Textually small. Easy to understand and to
> revert. It doesn't seem to be making things harder to fix? We could
> revert it any time if a better fix is offered.
>
> Maybe we could have a XXX note in the commit message or in-code
> comment?

It moves a line from one function (do_domain_introduce()) into a
completely different function (introduce_domain()), nested inside two
if() statements; with no analysis on how the change will impact
things.

Are there any paths through do_domain_introduce() that now *won't* get
a domain_conn_reset() call?  Is that OK?

Is introduce_domain() called in other places?  Will those places now
get extra domain_conn_reset() calls they weren't expecting?  Is that
OK?

I mean, it certainly seems strange to set the state to CONNECTED, send
off an event channel, and then after that delete all watches /
transactions / buffered data and so on; but we need at least a basic
understanding of what's going on to know that this change isn't going
to break comething.

Not knowing much about the xenstore protocol: In the
(!domain->introduced) case, will there be anything to actually delete?
 It seems like it would only be necessary / useful on the
(domain->introduced) case.

 -George

