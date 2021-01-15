Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6A92F7E61
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68185.122026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QEo-0002kx-6b; Fri, 15 Jan 2021 14:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68185.122026; Fri, 15 Jan 2021 14:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QEo-0002kY-3G; Fri, 15 Jan 2021 14:38:06 +0000
Received: by outflank-mailman (input) for mailman id 68185;
 Fri, 15 Jan 2021 14:38:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XE9r=GS=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1l0QEn-0002kT-8v
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:38:05 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdc6493e-a672-40f0-a588-00ad5ecf0b1e;
 Fri, 15 Jan 2021 14:38:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id y187so7813771wmd.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jan 2021 06:38:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u6sm16843197wrm.90.2021.01.15.06.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:38:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A71C11FF7E;
 Fri, 15 Jan 2021 14:38:01 +0000 (GMT)
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
X-Inumbo-ID: fdc6493e-a672-40f0-a588-00ad5ecf0b1e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=rv4UpeuWMZySLld4xBwWZAfxkiKYIxp/TXS9CsH889g=;
        b=DrHue3UeQoXzXXqV/PwnU+EKATQ5WTRIsGSUJURppYSnzbQlevjbZ7U9BgOovSqiQd
         DGA6rY2FSFo1zPNT8v4/jMa/L00AqwxsPhqFy4Y2yA4cM8K7K6xM4/Ulomnoa7AJu4Qj
         Dv/1TpeoGlOhj9FzqDEOu/GT0U1YRkzPTIegQhORKaQGxyrW2ybiw9+mZ/P7XuweJfeY
         IpsaBaxOYNYeHA/KUnxMosK8EY7kFD5S5XxybZmEDmKAIZEritv5HLmEZ444tUZ2Fpcg
         fqigr5sx+mKWXNYp4YrrNVDH4cRZP0oSiETu/9+ypUojukKEcVtG8ivNYZuz7kclwn5w
         O3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=rv4UpeuWMZySLld4xBwWZAfxkiKYIxp/TXS9CsH889g=;
        b=N6qWlRVwCp9aw+FYjtRv+PBHPialgb7aL3PFQt6lMN89Rv2TCpfvRCEFhOx76oDbDb
         rqJiwsj2Vjp/vnXAWh8A1hpZtrdANF7Vn6sNjgxOY5dniOP/Ht2mZS0OkDtLrVGplpSF
         NU4bMVKcLegmVcY38vdNoc88Z24/jmQc4FIplMuMC+21kqRlxkIiO0v8tcYk7aLgAbjE
         2JtaEXtGUexEmUI7OyxA4fq4UrrfyqjFxtrsMpqgvYWa5it3qLcU9otDDUlwlrJnc+PC
         J37O1kMST47w2BYsBp9jHUtGRkNOmWmkYDiJiokYC1iK0jk290IZ2uWSI00NK4fob6So
         6kAg==
X-Gm-Message-State: AOAM533rS3jFEqKZcO8kzXbxKcXK0vompCkT1M1pBtD4aZi+r735zWOL
	7JON+wN9F5xDkaZtsr7pTDjRpQ==
X-Google-Smtp-Source: ABdhPJzBqqknLY4TxDg1NryArZ+FHZHCvnWertsuRIk50QizJtEdZVnM6g+fKxJDI9gV31gR8iinpQ==
X-Received: by 2002:a05:600c:22d9:: with SMTP id 25mr8842770wmg.158.1610721483366;
        Fri, 15 Jan 2021 06:38:03 -0800 (PST)
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-12-git-send-email-olekstysh@gmail.com>
 <AM0PR08MB3747ECA6E3CB200C0D606F809EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <5f050e2c-d5c3-668a-8163-7829a6794a12@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr <olekstysh@gmail.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Julien Grall <Julien.Grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH V4 11/24] xen/mm: Make x86's
 XENMEM_resource_ioreq_server handling common
Date: Fri, 15 Jan 2021 14:35:40 +0000
In-reply-to: <5f050e2c-d5c3-668a-8163-7829a6794a12@gmail.com>
Message-ID: <874kjil0za.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr <olekstysh@gmail.com> writes:

> On 14.01.21 05:58, Wei Chen wrote:
>> Hi Oleksandr,
>
> Hi Wei
<snip>
>>> @@ -1090,6 +1091,40 @@ static int acquire_grant_table(struct domain *d,
>>> unsigned int id,
>>>       return 0;
>>>   }
>>>
>>> +static int acquire_ioreq_server(struct domain *d,
>>> +                                unsigned int id,
>>> +                                unsigned long frame,
>>> +                                unsigned int nr_frames,
>>> +                                xen_pfn_t mfn_list[])
>>> +{
>>> +#ifdef CONFIG_IOREQ_SERVER
>>> +    ioservid_t ioservid =3D id;
>>> +    unsigned int i;
>>> +    int rc;
>>> +
>>> +    if ( !is_hvm_domain(d) )
>>> +        return -EINVAL;
>>> +
>>> +    if ( id !=3D (unsigned int)ioservid )
>>> +        return -EINVAL;
>>> +
>>> +    for ( i =3D 0; i < nr_frames; i++ )
>>> +    {
>>> +        mfn_t mfn;
>>> +
>>> +        rc =3D hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
>>> +        if ( rc )
>>> +            return rc;
>>> +
>>> +        mfn_list[i] =3D mfn_x(mfn);
>>> +    }
>>> +
>>> +    return 0;
>>> +#else
>>> +    return -EOPNOTSUPP;
>>> +#endif
>>> +}
>>> +
<snip>
>>>
>> This change could not be applied to the latest staging branch.
>
> Yes, thank you noticing that.  The code around was changed a bit (patch=20
> series is based on 10-days old staging), I will update for the next
> version.

I think the commit that introduced config ARCH_ACQUIRE_RESOURCE could
probably be reverted as it achieves pretty much the same thing as the
above code by moving the logic into the common code path.

The only real practical difference is a inline stub vs a general purpose
function with an IOREQ specific #ifdeferry.
<snip>

--=20
Alex Benn=C3=A9e

