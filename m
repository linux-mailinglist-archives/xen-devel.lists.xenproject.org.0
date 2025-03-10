Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07775A599D3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 16:22:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906649.1314052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trex1-0004Zm-O0; Mon, 10 Mar 2025 15:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906649.1314052; Mon, 10 Mar 2025 15:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trex1-0004Wg-LG; Mon, 10 Mar 2025 15:21:55 +0000
Received: by outflank-mailman (input) for mailman id 906649;
 Mon, 10 Mar 2025 15:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6N5=V5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1trex0-0004Wa-3X
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 15:21:54 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 649a32d2-fdc3-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 16:21:52 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5e1a38c1aso3824175a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 08:21:52 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac256654fa6sm628702366b.93.2025.03.10.08.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 08:21:51 -0700 (PDT)
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
X-Inumbo-ID: 649a32d2-fdc3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741620111; x=1742224911; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YvsmoTGvbmgyYg/4fdn6nDOzpMN5T7rLhMpf0PuRFwI=;
        b=GGVjbGByU8FJHuCpa3vPvDw5KeEmlRdwCNxuv4wzg9WX3R1jpOK/A+ofqh9zowW8gu
         yYxqou0ZQkHOm2u39stUVULq6LyGFwVy29adWGbzVeQiIQthybwq1ZLpVE6TZ2j5YgOq
         vyu2xqfZ4YYny0wSELhitIBrhBUsRgBqPeE9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741620111; x=1742224911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YvsmoTGvbmgyYg/4fdn6nDOzpMN5T7rLhMpf0PuRFwI=;
        b=Qv6FFRJCGNJDctUCbLWv9Sg/hVhAO0eBE6q+u1r25npKG5YQ77GjmK3sY7LPahN5Xt
         3Bz5U/Le7yLeRxkjdvQjML5ASQUNIxMJChZ8y1t7aDfjc+fLIsSRhyhKnUo7KSC608nd
         klrEtGy5eMMGPL3+rc8htOfAi+R1foH6/KhWvIzR0KCpU6v/YxjAX6eWP03rI1KJjiM8
         2r3c5/7fc2l0ifKzV8OliqEjlE1cpHRSqKOvOFP63bytx1fAAnzoKlHddS+PFUVNKBJ0
         9yYGLfyNuJPlLGYOtDg9g/ODIbZ+hA+Gu9xk07MlkQeMkyPmfV9pXdFRYFUIODUeu4Mk
         wgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGfndLTz3T6wpY/mgeaywgp2417x+MZjzDg3EjZ7fFWUmqDvSMtfmKk+WyYlkrcFcrL6xkypiXTfA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRIVccxzo1CBBgVh1hxikVmc9T+guoK//pyrtF1E5zcQbiu5Lr
	xllycqA9nYigiyq+1SU8FSd+zUWEf1qHl74cgqhlBnfmRXID1JyQDYLaNDW3HGE=
X-Gm-Gg: ASbGncsO0+SKa8nC6TMYSgZ2AkxOuaJTViYvdMryRHYU9NmZlt/YEDcToMush4osrel
	8EEA9mxOvIA6V714iRFCMF3DAEHj+mDRNW+P6Z9ydkLQ2NqWVfuhx/Au4sP0UirNowYASp7f/d+
	v+oMlg4DKIIm2/yo/8jQl+i4wrnPdmMukvSSeYbSQ9P7OHt+1f5wp+ogbkmR3PlRn6ii9lVMIZm
	pM3DETa3twVGsJF0WmDMqnS+be6HpGc1wKzHg1TMKNOGuUhff8O85s3JVajCgdT0L3ZUWT6TDtD
	nEU4n39sPtUMN409h0qgn0hJsjmo1Vk50R+1DYIlkkhekoSZNPOfObo=
X-Google-Smtp-Source: AGHT+IExB6AMSdjkUXsJNcIniZFtN1zzOFbMM2/fpPrEg0yrlnGzdWA2pBoYOw7rJ/U1Z2jE82MXLg==
X-Received: by 2002:a05:6402:42d4:b0:5e0:8c55:50d with SMTP id 4fb4d7f45d1cf-5e5e22cbc79mr41698744a12.14.1741620111552;
        Mon, 10 Mar 2025 08:21:51 -0700 (PDT)
Date: Mon, 10 Mar 2025 16:21:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/P2M: correct old entry checking in
 p2m_remove_entry()
Message-ID: <Z88DjsyhQxh4d0Yr@macbook.local>
References: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
 <b9f829c3-dc7d-4023-b58a-49527742a5f0@suse.com>
 <Z88CVK0wjer8sXJm@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z88CVK0wjer8sXJm@macbook.local>

On Mon, Mar 10, 2025 at 04:16:36PM +0100, Roger Pau Monné wrote:
> On Wed, Feb 26, 2025 at 12:52:45PM +0100, Jan Beulich wrote:
> > Using p2m_is_valid() isn't quite right here. It expanding to RAM+MMIO,
> > the subsequent p2m_mmio_direct check effectively reduces its use to
> > RAM+MMIO_DM. Yet MMIO_DM entries, which are never marked present in the
> > page tables, won't pass the mfn_valid() check. It is, however, quite
> > plausible (and supported by the rest of the function) to permit
> > "removing" hole entries, i.e. in particular to convert MMIO_DM to
> > INVALID. Which leaves the original check to be against RAM (plus MFN
> > validity), while HOLE then instead wants INVALID_MFN to be passed in.
> > 
> > Further more grant and foreign entries (together with RAM becoming
> > ANY_RAM) as well as BROKEN want the MFN checking, too.
> > 
> > All other types (i.e. MMIO_DIRECT and POD) want rejecting here rather
> > than skipping, for needing handling / accounting elsewhere.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Paging/sharing types likely need further customization here. Paths
> > leading here differ in their handling (e.g. guest_remove_page() special-
> > casing paging types vs XENMEM_remove_from_physmap not doing so), so it's
> > not even clear what the intentions are for those types.
> > 
> > --- a/xen/arch/x86/mm/p2m.c
> > +++ b/xen/arch/x86/mm/p2m.c
> > @@ -531,9 +531,9 @@ p2m_remove_entry(struct p2m_domain *p2m,
> >          mfn_t mfn_return = p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0,
> >                                            &cur_order, NULL);
> >  
> > -        if ( p2m_is_valid(t) &&
> > -             (!mfn_valid(mfn) || t == p2m_mmio_direct ||
> > -              !mfn_eq(mfn_add(mfn, i), mfn_return)) )
> > +        if ( p2m_is_any_ram(t) || p2m_is_broken(t)
> > +             ? !mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)
> 
> In the commit message you mention that MMIO_DIRECT wants rejecting
> here, yet I think some MMIO_DIRECT mfns can be valid IIRC, and hence
> would satisfy the check here?

Never mind, p2m_is_any_ram() doesn't allow MMIO_DIRECT, and hence
won't get into the mfn_valid() check in the first place.  I was
getting confused with the previous p2m_is_valid().

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

