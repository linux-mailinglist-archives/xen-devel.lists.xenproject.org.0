Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F252CA0C4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 12:04:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41834.75313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk3RO-0006HT-GN; Tue, 01 Dec 2020 11:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41834.75313; Tue, 01 Dec 2020 11:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk3RO-0006H3-C0; Tue, 01 Dec 2020 11:03:26 +0000
Received: by outflank-mailman (input) for mailman id 41834;
 Tue, 01 Dec 2020 11:03:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=na+5=FF=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kk3RN-0006Gy-5y
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 11:03:25 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bae84da9-3c01-488a-b810-367f11aac04c;
 Tue, 01 Dec 2020 11:03:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 23so1974181wrc.8
 for <xen-devel@lists.xenproject.org>; Tue, 01 Dec 2020 03:03:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v7sm2381281wma.26.2020.12.01.03.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 03:03:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEF111FF7E;
 Tue,  1 Dec 2020 11:03:20 +0000 (GMT)
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
X-Inumbo-ID: bae84da9-3c01-488a-b810-367f11aac04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=ipBJUGbtRku9teUZUW1nNmFVDBPn0WzbshJ5Gm4rGOE=;
        b=avPWF8RnfQKUr8zOoYRH0VRn/ccw7yYf4BBEJWjhXMZbUxIMkKs/6ouOh18zpWt6JJ
         jjc8jJycFJet4QMK/cVtWxvbNK43lrKS3FWnmUPGmoXzVj93XSVw9yr2eexn3vVH4j46
         8oTKRyxGAnFjFkiIDXwykv37ZjC3Vh7KfoAuYBzp1aR0HF4HTv8/JbYh/NJ5Q2ofuygQ
         8TlV0o6GNTcr3AYcHMs/3n2SMh9y2+Yb4T8iHG8QtFbUuXlb43DwkI9eVTxifB8Aipwh
         IdaM17w6IQ7WJjCkha6J26G/0Su65Inm+d5RSsD+ZSg27KkKLsjacFTW2JQoq3vt389J
         E/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=ipBJUGbtRku9teUZUW1nNmFVDBPn0WzbshJ5Gm4rGOE=;
        b=ms1GofobsQZ0mK2xjOBInwkq6XrzSnecVI0c1xWWjOkD00CaeIjpP59h2J3cL5tsFu
         DcXAsfqBwcH4pJ6MuOm/vzXllxMyZbRsXoqPZ3ei69Z2gCyzhfQGlYTW24iAl6JPzVca
         0zwU7nrpxeNdtA3JUlb0lFxO4phPNbKKcLrQyA8dqPazjPkbVIaof+eXyfIRT1IyUZNO
         47ubgtUlhKe4AYv5RlDQ2TuRega75PCuyjXoAbYMh0Kv4Dhi7m+6mdsusdYhlMsUP7PJ
         U5frjEdRtx1oXcec+yKMp7rsJnPA/L3v0MHA+b7mjogQz27pUK49EUiHyDL4UneQi2iQ
         IwGQ==
X-Gm-Message-State: AOAM5313WRaZv5YO0XYez8+qOFY/nZ7tCkmF+vTPeDCbkLow2pK3Fn39
	y5nX+3Nc18WkIKW45qk7ZdyC8A==
X-Google-Smtp-Source: ABdhPJzDOhKQm/zgRzj3yo7Syp+0/5eSKBVrrTB2oEhZyuwUbPW2Zwj4z3f2sZrHl5Ju3NYCuLAbww==
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr3215799wrl.24.1606820603110;
        Tue, 01 Dec 2020 03:03:23 -0800 (PST)
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-2-git-send-email-olekstysh@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
 <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei
 Liu <wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH V3 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
In-reply-to: <1606732298-22107-2-git-send-email-olekstysh@gmail.com>
Date: Tue, 01 Dec 2020 11:03:20 +0000
Message-ID: <87eek9u6tj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> As a lot of x86 code can be re-used on Arm later on, this
> patch makes some preparation to x86/hvm/ioreq.c before moving
> to the common code. This way we will get a verbatim copy
<snip>
>
> It worth mentioning that a code which checks the return value of
> p2m_set_ioreq_server() in hvm_map_mem_type_to_ioreq_server() was
> folded into arch_ioreq_server_map_mem_type() for the clear split.
> So the p2m_change_entry_type_global() is called with ioreq_server
> lock held.
<snip>
>=20=20
> +/* Called with ioreq_server lock held */
> +int arch_ioreq_server_map_mem_type(struct domain *d,
> +                                   struct hvm_ioreq_server *s,
> +                                   uint32_t flags)
> +{
> +    int rc =3D p2m_set_ioreq_server(d, flags, s);
> +
> +    if ( rc =3D=3D 0 && flags =3D=3D 0 )
> +    {
> +        const struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
> +
> +        if ( read_atomic(&p2m->ioreq.entry_count) )
> +            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw=
);
> +    }
> +
> +    return rc;
> +}
> +
>  /*
>   * Map or unmap an ioreq server to specific memory type. For now, only
>   * HVMMEM_ioreq_server is supported, and in the future new types can be
> @@ -1112,19 +1155,11 @@ int hvm_map_mem_type_to_ioreq_server(struct domai=
n *d, ioservid_t id,
>      if ( s->emulator !=3D current->domain )
>          goto out;
>=20=20
> -    rc =3D p2m_set_ioreq_server(d, flags, s);
> +    rc =3D arch_ioreq_server_map_mem_type(d, s, flags);
>=20=20
>   out:
>      spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>=20=20
> -    if ( rc =3D=3D 0 && flags =3D=3D 0 )
> -    {
> -        struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
> -
> -        if ( read_atomic(&p2m->ioreq.entry_count) )
> -            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw=
);
> -    }
> -

It should be noted that p2m holds it's own lock but I'm unfamiliar with
Xen's locking architecture. Is there anything that prevents another vCPU
accessing a page that is also being used my ioreq on the first vCPU?

Assuming that deadlock isn't a possibility to my relatively untrained
eye this looks good to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

