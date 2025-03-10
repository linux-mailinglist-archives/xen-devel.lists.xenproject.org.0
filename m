Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150F3A5998F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 16:16:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906635.1314041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trery-00033C-5h; Mon, 10 Mar 2025 15:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906635.1314041; Mon, 10 Mar 2025 15:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trery-00030o-36; Mon, 10 Mar 2025 15:16:42 +0000
Received: by outflank-mailman (input) for mailman id 906635;
 Mon, 10 Mar 2025 15:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6N5=V5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1trerw-00030i-Cb
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 15:16:40 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa23f9de-fdc2-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 16:16:39 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaec111762bso854487166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 08:16:39 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac299a025c7sm245620866b.51.2025.03.10.08.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 08:16:38 -0700 (PDT)
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
X-Inumbo-ID: aa23f9de-fdc2-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741619799; x=1742224599; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dww1+06DIPLPQDq7Ov7sai2y9qymQatYglEhwpqcP/g=;
        b=tM8ejOQHVU9KGfWsnzO4YbPz9kyD+4WndCAjD06hvqa3NrQ7TSfDW3aqhlSn0eIL4I
         p1EVscMpmPIsVYf58gklZPylABLiEra37LZ0upBWfT6lG+w3/lf+TTxaRl/tlzx236KC
         9KQWU4FLF/wVrkqZD55nZHjd0qoFraQ7wrR4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619799; x=1742224599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dww1+06DIPLPQDq7Ov7sai2y9qymQatYglEhwpqcP/g=;
        b=impyiN3iIC9uVdbT/bSmEcOFfFxQmGBhaYQfRuNKPoOGQIDvs3MC0qJBVrYXlMIXlm
         AgPa2st9BCz7ToUZXkXeI17Ugpq9RHunrWj3LnS8ddWEX7P1te2UFQF9vOxMQWxKPu4x
         VyCEwsY5Y4RH9y+k6okcj31EJOAaTtIGhuWAyUd+Y1zn9A33Inhfmuzk1nl0dcSkkXiz
         zLH7vCPjQH0Jq6I0RkKT1nXBxgiKSy7QU1+nfuNfyVkcE3US2ux7tC122zzFipsSR77X
         W3yFfAvs1tSJUep6qnZxs11mh5Ln2FDqdZqOjyF6VoGIhiS3nfWFJYyg8SgrKJct3+3v
         sKTQ==
X-Gm-Message-State: AOJu0Yy0qu99GAw6f+m+OEfigjODK71ISY3tCkH8mOgNrgp7cAZqfqGl
	iQrq4Xr5GFeoCcTdEh9tBmdBoTO549RMNlhJWCcnVqzmdzwTxvVoIF6Cms5++Wxc2uueMN7bc5O
	Z
X-Gm-Gg: ASbGncuacgrkANVV7ow5nNe8TIEReWftGDyiFEEABaF6koJeyWMJqjjKf9b+7GIN1O4
	7Al2/4FmI0411AmHx02U0w+gHDcnkY1+LPZOJhfOO6SCKKp57A9oVtNZrpGgN+uzAixmBtPEPvO
	dTuqHELUlttqNmJBwrmPhyrp3HhrNObBcmoFBaSgH4C8P+NdG5XUAZrIwr+QvEsb9zVxdz9mp9+
	J2WEDOXSbhFbrmLiEoPxbBXAtvZ+ZasQK8m8hAykZtp8D9rDbX1vd4O3tU7OPsPWW7zABupuF4i
	lZH9ZI6ggtNue5TrM74ao15kdfsaLnIBsBxSWbsenvU7us6RTY9bD2w=
X-Google-Smtp-Source: AGHT+IGFlu4kOn0/HSwdC5dt8aexx9bq1FB9SX20uUjwTSLdBYAJmj/gIP/KeMK8o3tSvFzu5DN9ig==
X-Received: by 2002:a17:907:97d5:b0:abf:6166:d0e0 with SMTP id a640c23a62f3a-ac252fb9c80mr1782390266b.35.1741619798727;
        Mon, 10 Mar 2025 08:16:38 -0700 (PDT)
Date: Mon, 10 Mar 2025 16:16:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/P2M: correct old entry checking in
 p2m_remove_entry()
Message-ID: <Z88CVK0wjer8sXJm@macbook.local>
References: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
 <b9f829c3-dc7d-4023-b58a-49527742a5f0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b9f829c3-dc7d-4023-b58a-49527742a5f0@suse.com>

On Wed, Feb 26, 2025 at 12:52:45PM +0100, Jan Beulich wrote:
> Using p2m_is_valid() isn't quite right here. It expanding to RAM+MMIO,
> the subsequent p2m_mmio_direct check effectively reduces its use to
> RAM+MMIO_DM. Yet MMIO_DM entries, which are never marked present in the
> page tables, won't pass the mfn_valid() check. It is, however, quite
> plausible (and supported by the rest of the function) to permit
> "removing" hole entries, i.e. in particular to convert MMIO_DM to
> INVALID. Which leaves the original check to be against RAM (plus MFN
> validity), while HOLE then instead wants INVALID_MFN to be passed in.
> 
> Further more grant and foreign entries (together with RAM becoming
> ANY_RAM) as well as BROKEN want the MFN checking, too.
> 
> All other types (i.e. MMIO_DIRECT and POD) want rejecting here rather
> than skipping, for needing handling / accounting elsewhere.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Paging/sharing types likely need further customization here. Paths
> leading here differ in their handling (e.g. guest_remove_page() special-
> casing paging types vs XENMEM_remove_from_physmap not doing so), so it's
> not even clear what the intentions are for those types.
> 
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -531,9 +531,9 @@ p2m_remove_entry(struct p2m_domain *p2m,
>          mfn_t mfn_return = p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0,
>                                            &cur_order, NULL);
>  
> -        if ( p2m_is_valid(t) &&
> -             (!mfn_valid(mfn) || t == p2m_mmio_direct ||
> -              !mfn_eq(mfn_add(mfn, i), mfn_return)) )
> +        if ( p2m_is_any_ram(t) || p2m_is_broken(t)
> +             ? !mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)

In the commit message you mention that MMIO_DIRECT wants rejecting
here, yet I think some MMIO_DIRECT mfns can be valid IIRC, and hence
would satisfy the check here?

Thanks, Roger.

