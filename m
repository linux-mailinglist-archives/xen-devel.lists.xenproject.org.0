Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF212A5BB8F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:02:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907427.1314665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvUy-0000Iq-RB; Tue, 11 Mar 2025 09:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907427.1314665; Tue, 11 Mar 2025 09:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvUy-0000H1-OV; Tue, 11 Mar 2025 09:02:04 +0000
Received: by outflank-mailman (input) for mailman id 907427;
 Tue, 11 Mar 2025 09:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1trvUx-0000Gv-Gh
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:02:03 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e3955ef-fe57-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 10:02:01 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-224341bbc1dso64293365ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 02:02:01 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-224109ddfa6sm92756665ad.33.2025.03.11.02.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 02:01:59 -0700 (PDT)
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
X-Inumbo-ID: 7e3955ef-fe57-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741683720; x=1742288520; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h9jJQv2zBM1hKIYuWNFSCANOkqGuZ15p1wEsb2QvYHY=;
        b=LxzlqcGE4Zf5V/GKsVnTgJPrq6QubKmED0oHSP+LKECBHlYlEaBjzWsfA+4LbRCGCa
         aqxQOYrIbRHotGesMCFcfjWffbq7pDXiQnkSWyQ2OFgaKqYYmjoXtMyj6kfcqbHlowpN
         EXyTgp3mE8QWvhLlWULAE+xa1kqf56ItbtlrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741683720; x=1742288520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9jJQv2zBM1hKIYuWNFSCANOkqGuZ15p1wEsb2QvYHY=;
        b=NItZkO38m3n02d9C6hos5X/p9qCZL1iLRxyz6TOG05NQ3NA9b64bohJbS/cW9FZ9tf
         CMB4Im/DAEqvRaFxp8O0XkiU+UDymCrAKlYS3MKJdspdQDrhDvvZoVXfRU5slljx3H5R
         TcTACHUW8w/jwhrdOWtcPA6zWwrwAzKGTaGp3wu7B1sP6i0peXtz6nR0nFCERI8Os6Hx
         LKgqFm8HmLj1+Gu8q3HWGtQCZ0k/bxJKQ1frofmvGvguN+cxFfQRiI7Eno/6y6ua9bHS
         KAgu95djdGkWmQ4nrGqAXwljpa6Pfk2l7uW/0LcnvKG31l4Ak4gP1Lh3/yXGypqPAYCj
         ku7g==
X-Forwarded-Encrypted: i=1; AJvYcCV/YjHrSmfyB2F+Wv7Vv28IWHG/GfSVg3RCOfsXRRyEoajCrrB7oX5oOJX1XIBvCyfJvcX+E9GTYJs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbB8uU5+tLauo7w9hLle0vr8efM+FTloq1H39Oj+xqty0Tf+oy
	8qI8+xMMCJFnYJvc3zD0VnCnQbjd5tU1TN+3yTmu5NNF83tO0oTvUX/cHOcvXRWPWNXkGzoyjnR
	V
X-Gm-Gg: ASbGncsCBDMVrut1b69k/UA5m/Ugi3+8U6vXRsYc4vuZvWFObFPxJIfsWy3iOsGmm5+
	RsL6i7Qhcoarn+aIVmTHM81gtpRVPa4X7HTIZYN3UOnsGv6qMyJkKEw588BsBaB1Fnp4Atd9XhR
	WaOFoAYUABQ2YKkDUuWDZns8kNN4rIwhnCBA9GmTF+8hJXiL+zJcFAyNZEk8EtXsBF+MmpDbJiZ
	Uv0IUIrL4+gK3PkgUthLaLQgusDhFuhVDnOIPAcZ6d/CRhW0UryaOxcbOF85DBocTm9rHuXwStf
	KaP6ewMPcxs6hcV8TPuv+CDwwkSOxJ6wgLmhUotChw3WtjFuoQ==
X-Google-Smtp-Source: AGHT+IFxbieKDqKiqDqsZyO48yC9YBiFmJQYlZtMvqePLNAX2S3b+lI9YQMhc//HD9eOe71/WB8NVw==
X-Received: by 2002:a17:902:d592:b0:224:376:7a07 with SMTP id d9443c01a7336-22592e2ca6emr36225105ad.13.1741683719822;
        Tue, 11 Mar 2025 02:01:59 -0700 (PDT)
Date: Tue, 11 Mar 2025 10:01:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/P2M: synchronize fast and slow paths of
 p2m_get_page_from_gfn()
Message-ID: <Z8_8ApvqOTCXkyq_@macbook.local>
References: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
 <88d24595-50be-4f99-97d6-9126340b791e@suse.com>
 <Z879Aq-UNj-Jz5S1@macbook.local>
 <b0aae379-9128-4d31-9a3f-92a500a30d75@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0aae379-9128-4d31-9a3f-92a500a30d75@suse.com>

On Tue, Mar 11, 2025 at 09:44:18AM +0100, Jan Beulich wrote:
> On 10.03.2025 15:53, Roger Pau Monné wrote:
> > On Wed, Feb 26, 2025 at 12:52:27PM +0100, Jan Beulich wrote:
> >> Handling of both grants and foreign pages was different between the two
> >> paths.
> >>
> >> While permitting access to grants would be desirable, doing so would
> >> require more involved handling; undo that for the time being. In
> >> particular the page reference obtained would prevent the owning domain
> >> from changing e.g. the page's type (after the grantee has released the
> >> last reference of the grant). Instead perhaps another reference on the
> >> grant would need obtaining. Which in turn would require determining
> >> which grant that was.
> >>
> >> Foreign pages in any event need permitting on both paths.
> >>
> >> Introduce a helper function to be used on both paths, such that
> >> respective checking differs in just the extra "to be unshared" condition
> >> on the fast path.
> >>
> >> While there adjust the sanity check for foreign pages: Don't leak the
> >> reference on release builds when on a debug build the assertion would
> >> have triggered. (Thanks to Roger for the suggestion.)
> >>
> >> Fixes: 80ea7af17269 ("x86/mm: Introduce get_page_from_gfn()")
> >> Fixes: 50fe6e737059 ("pvh dom0: add and remove foreign pages")
> >> Fixes: cbbca7be4aaa ("x86/p2m: make p2m_get_page_from_gfn() handle grant case correctly")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Just a couple of nits below (with a reply to your RFC).
> > 
> >> ---
> >> RFC: While the helper could take const struct domain * as first
> >>      parameter, for a P2M function it seemed more natural to have it
> >>      take const struct p2m_domain *.
> >>
> >> --- a/xen/arch/x86/mm/p2m.c
> >> +++ b/xen/arch/x86/mm/p2m.c
> >> @@ -328,12 +328,45 @@ void p2m_put_gfn(struct p2m_domain *p2m,
> >>      gfn_unlock(p2m, gfn_x(gfn), 0);
> >>  }
> >>  
> >> +static struct page_info *get_page_from_mfn_and_type(
> >> +    const struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t)
> > 
> > Re your RFC: since it's a static function, just used for
> > p2m_get_page_from_gfn(), I would consider passing a domain instead of
> > a p2m_domain, as the solely usage of p2m is to obtain the domain.
> 
> Okay, will do.
> 
> >> +{
> >> +    struct page_info *page;
> >> +
> >> +    if ( !mfn_valid(mfn) )
> >> +        return NULL;
> >> +
> >> +    page = mfn_to_page(mfn);
> >> +
> >> +    if ( p2m_is_ram(t) )
> > 
> > Should this be a likely() to speed up the common successful path?
> 
> Well. Andrew's general advice looks to be to avoid likely() / unlikely()
> in almost all situations. Therefore unless he positively indicates that
> in a case like this using likely() is acceptable, I'd rather stay away
> from adding that.

Oh, OK.  My suggestion was based on the use of unlikely below.  I
assume the later unlikely() in the patch is just inheritance from the
previous code.

> docs/process/coding-best-practices.pandoc could certainly do with some
> rough guidelines on when adding these two is acceptable (or even
> desirable). Right now to me it is largely unclear when their use is
> deemed okay; it certainly doesn't match anymore what I was told some
> 20 years ago when I started working on Linux.

I would be happy to have some guidance there, as I think I've been a
bit erratic with suggestions about how to use them.

Thanks, Roger.

