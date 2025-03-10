Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1DEA59854
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 15:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906586.1314017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1treW4-0006Am-7V; Mon, 10 Mar 2025 14:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906586.1314017; Mon, 10 Mar 2025 14:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1treW4-00068P-4s; Mon, 10 Mar 2025 14:54:04 +0000
Received: by outflank-mailman (input) for mailman id 906586;
 Mon, 10 Mar 2025 14:54:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6N5=V5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1treW2-00068J-Kp
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 14:54:02 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8070529a-fdbf-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 15:54:01 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-223a7065ff8so3916295ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 07:54:01 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-224109ddffesm79144255ad.40.2025.03.10.07.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 07:53:59 -0700 (PDT)
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
X-Inumbo-ID: 8070529a-fdbf-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741618440; x=1742223240; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GSiMMHGI8EanCCUYMIv7epoBbhuUZMy/wy/tMSVGDtA=;
        b=MPqnaYbakZSI7FL9RiBbQ4s2jMsQBBHxdfpG9tlhuDchUup4hUq7oHvbY3YUoGW0cY
         IvpbU/KeBRuSKCWiSnadCdk17kQJyAEXvrXEIaGzyUXRPjAX/e6toGBhinFXwfHApBv4
         03qNQkByJYb5j0M3qNLZN0UhogS5sXe5BR88o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618440; x=1742223240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSiMMHGI8EanCCUYMIv7epoBbhuUZMy/wy/tMSVGDtA=;
        b=HQS/eN2nK1NkAbxcwmfMbcFmC5/Cn+YjmgWTel/yZBkyd11vp4lI5R0v7ulmsyi6vB
         eCptoowVSZ2vDQDifD6I8ndiN0Gf8kSqQZ+Nul5XO5IfoyMWrBtDGKdEKmgayrN9h9wg
         +ok1d8g3Z0wRs3cpwqhgBo7wKWbf4zmaSRW+PYuNW/zSwvZMaieJ9X44gIWvUsj8L4nF
         i8Mfd6GPQuUXKB3Av8lIdwTgItNQaIw6rGjSfFC7U4VrsGvU6DUetSumaCfLhoc8RLYu
         kzgvFvT69u12nImqbPoula4L7wL/40iBshBakigFhv/Elo4VwcKKZAz5ytbwltmOwzVn
         DdfA==
X-Gm-Message-State: AOJu0Yw9NilV4fGn/2tuAYe2E/CkncoW9fAggRv9uPFKwUv78LlWS/BU
	2O/Mga7K1R9axmLesBOFDbEEoW/X+yBPcoA7kccZcfBQPsbc+DdUQ5CMxIDu3C0=
X-Gm-Gg: ASbGnct3R97v98ZqR7qIh7MFr6UAPnLfX/plv45hVQrKqhxYZ5e9Ew34Pv+213HwVax
	IkpTWolsY7Q1PhGPRSxXYA4tV8uq5ZnVvrOUIw7Mr0xERoAlHgqmn8nmcxmtJhMOLmdVt8A3uE/
	q8pH4mbs8bd50uzER2znlUguoF7nbelCnzH4DSm+HtDrt+ybd3dFniMwejh4K7sjIK02I8txdzL
	l6tGSMaljICK92wlc10ypkFUSUaAYfxw3IAV1zLUOFztGbqn/u/jWarteG7g/+NkqI6Fkr3zt5q
	npLUxezXWGkCOFuNVTTvHWBfhbjJiFyBExiruoNi40mhr082TwS38GcckWDLXoaJdg==
X-Google-Smtp-Source: AGHT+IHdPnbS6pan7R9AhhqjzrysvYWcJy+YeyNcHtrzTKZjIOxDo70x79/nkmAIqBVUzCiYqDHmng==
X-Received: by 2002:a17:903:2f8a:b0:224:1579:5e91 with SMTP id d9443c01a7336-22428ad58camr166641595ad.47.1741618440104;
        Mon, 10 Mar 2025 07:54:00 -0700 (PDT)
Date: Mon, 10 Mar 2025 15:53:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/P2M: synchronize fast and slow paths of
 p2m_get_page_from_gfn()
Message-ID: <Z879Aq-UNj-Jz5S1@macbook.local>
References: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
 <88d24595-50be-4f99-97d6-9126340b791e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88d24595-50be-4f99-97d6-9126340b791e@suse.com>

On Wed, Feb 26, 2025 at 12:52:27PM +0100, Jan Beulich wrote:
> Handling of both grants and foreign pages was different between the two
> paths.
> 
> While permitting access to grants would be desirable, doing so would
> require more involved handling; undo that for the time being. In
> particular the page reference obtained would prevent the owning domain
> from changing e.g. the page's type (after the grantee has released the
> last reference of the grant). Instead perhaps another reference on the
> grant would need obtaining. Which in turn would require determining
> which grant that was.
> 
> Foreign pages in any event need permitting on both paths.
> 
> Introduce a helper function to be used on both paths, such that
> respective checking differs in just the extra "to be unshared" condition
> on the fast path.
> 
> While there adjust the sanity check for foreign pages: Don't leak the
> reference on release builds when on a debug build the assertion would
> have triggered. (Thanks to Roger for the suggestion.)
> 
> Fixes: 80ea7af17269 ("x86/mm: Introduce get_page_from_gfn()")
> Fixes: 50fe6e737059 ("pvh dom0: add and remove foreign pages")
> Fixes: cbbca7be4aaa ("x86/p2m: make p2m_get_page_from_gfn() handle grant case correctly")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Just a couple of nits below (with a reply to your RFC).

> ---
> RFC: While the helper could take const struct domain * as first
>      parameter, for a P2M function it seemed more natural to have it
>      take const struct p2m_domain *.
> 
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -328,12 +328,45 @@ void p2m_put_gfn(struct p2m_domain *p2m,
>      gfn_unlock(p2m, gfn_x(gfn), 0);
>  }
>  
> +static struct page_info *get_page_from_mfn_and_type(
> +    const struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t)

Re your RFC: since it's a static function, just used for
p2m_get_page_from_gfn(), I would consider passing a domain instead of
a p2m_domain, as the solely usage of p2m is to obtain the domain.

> +{
> +    struct page_info *page;
> +
> +    if ( !mfn_valid(mfn) )
> +        return NULL;
> +
> +    page = mfn_to_page(mfn);
> +
> +    if ( p2m_is_ram(t) )

Should this be a likely() to speed up the common successful path?

Thanks, Roger.

