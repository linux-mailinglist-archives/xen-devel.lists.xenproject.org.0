Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2B7A423E6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 15:50:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895208.1303802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmZmO-0007Eg-Eu; Mon, 24 Feb 2025 14:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895208.1303802; Mon, 24 Feb 2025 14:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmZmO-0007Cw-Bs; Mon, 24 Feb 2025 14:49:56 +0000
Received: by outflank-mailman (input) for mailman id 895208;
 Mon, 24 Feb 2025 14:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cK+3=VP=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tmZmM-0007Cq-CZ
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 14:49:54 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ac8a5c7-f2be-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 15:49:53 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5ded46f323fso6184848a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 06:49:52 -0800 (PST)
Received: from localhost ([46.149.103.15]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb843451b1sm1746097166b.42.2025.02.24.06.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 06:49:51 -0800 (PST)
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
X-Inumbo-ID: 9ac8a5c7-f2be-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740408592; x=1741013392; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqXdEH7Z6vSUEGCto4NKogzU5qLGAMSKDcspj2n5MM4=;
        b=hMyj2nf8RIDjtj4NZHt6EU6nO1dwKuCMvQeZHOU+K+LAsXVK+fxF3VvHewDLq8KsoG
         +eOP914GRT1KBnzrQ4Ku+Mu8kWcsEhMpzelEC9m6nK2ricC4sW34vLR2VHJ4N1VtDdGz
         Z3WRO/7RkMTTwLdsmiul0rTpgDajnAJg4fCP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740408592; x=1741013392;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QqXdEH7Z6vSUEGCto4NKogzU5qLGAMSKDcspj2n5MM4=;
        b=mKc6hm3mP7fC0gCJBgL8e82Kld+MLSDbZG8A+6RXbO2ZbpmjQqmKmM5x7P0bF/3V5N
         7kjSYduN6ItpHFP9zq7QaPPX8pEA4K1scj46MN+a5UI92pmLoWpt0/lcfl2fit6ki2zF
         g11M4nXlCLMHi6VWFSwhGipIUadqczzjDdvkP8HmHI8V/HfgEBYw1GnJkeDCOL/2yLD1
         PYsW4zrmM7UZbI05nxGPpjoHephoBad6bwj7/jibrOuWhTYwMYVbOCdUbZ3ZzilqyJB+
         WqIhcEzj3jAtsXjgttk84JNbPKLdUTNIOYAGyp2b1HcREOKZdfWZaYaNOEUwVzG9rlPD
         PWNw==
X-Forwarded-Encrypted: i=1; AJvYcCUd7NF8DTwbfMrt68xup/VRhefTeAnUugFsZmM3OnSnFw9eWybOAbC4XDiI3wcIZv4T9R97lUj17Yo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQfB36t02CRZ+WcvFHTHfFRWHKiPHNK+815Yx+PNJ6JHV18sIo
	OJ94krT77TxVRFSGhlqyOCq5ZLA9LiYzFzXCrAXtxRRSEKtmJvlhBDlVFLyAqF8=
X-Gm-Gg: ASbGnctMMlikCuFAzjEr4abW1JwtCL+2KUmOX+lN95oWcf3iXHv7T2UBsa2LjAmh0pY
	TOko2qx4rRjlScaEMgg6AbdryCS6Mq8whxbJu4H/Zaj46Kh01pyavKZbUqG4QZATgre0Ax3paMX
	Y6fFcQLeCf7dfNj357W+DA25wVF5XKcyfjARufePuQhuRETQwaz57hP/dVQO07zTXt+2UCys01c
	/66+MNwR6bhlpNYWmWczOdXmOFl5cTInANKMRYp/hy2wg14qqQ/CjA4hth7sPjfa+CTMSIHYmdm
	PPx59LMz5EgqaNGkUFYPnBwpasXbOr4x
X-Google-Smtp-Source: AGHT+IFRxn2Ap9GlrXgrv8BFYY6/3+692usxwMNve8DEwXw2Z6pEsu/TPtwG/lFfxqutwA42e6bfBg==
X-Received: by 2002:a17:907:9801:b0:abb:b294:6a2d with SMTP id a640c23a62f3a-abc09c270camr1348002466b.53.1740408592119;
        Mon, 24 Feb 2025 06:49:52 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Feb 2025 14:49:48 +0000
Message-Id: <D80RCS1Y7AKH.373ULA2LO3MND@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20250224132724.9074-1-alejandro.vallejo@cloud.com>

Open question to whoever reviews this...

On Mon Feb 24, 2025 at 1:27 PM GMT, Alejandro Vallejo wrote:
>      spin_lock(&heap_lock);
> -    /* adjust domain outstanding pages; may not go negative */
> -    dom_before =3D d->outstanding_pages;
> -    dom_after =3D dom_before - pages;
> -    BUG_ON(dom_before < 0);
> -    dom_claimed =3D dom_after < 0 ? 0 : dom_after;
> -    d->outstanding_pages =3D dom_claimed;
> -    /* flag accounting bug if system outstanding_claims would go negativ=
e */
> -    sys_before =3D outstanding_claims;
> -    sys_after =3D sys_before - (dom_before - dom_claimed);
> -    BUG_ON(sys_after < 0);
> -    outstanding_claims =3D sys_after;
> +    BUG_ON(outstanding_claims < d->outstanding_pages);
> +    if ( pages > 0 && d->outstanding_pages < pages )
> +    {
> +        /* `pages` exceeds the domain's outstanding count. Zero it out. =
*/
> +        outstanding_claims -=3D d->outstanding_pages;
> +        d->outstanding_pages =3D 0;

While this matches the previous behaviour, do we _really_ want it? It's wei=
rd,
quirky, and it hard to extend to NUMA-aware claims (which is something in
midway through).

Wouldn't it make sense to fail the allocation (earlier) if the claim has ru=
n
out? Do we even expect this to ever happen this late in the allocation call
chain?

> +    } else {
> +        outstanding_claims -=3D pages;
> +        d->outstanding_pages -=3D pages;
> +    }
>      spin_unlock(&heap_lock);
> =20
>  out:

Cheers,
Alejandro

