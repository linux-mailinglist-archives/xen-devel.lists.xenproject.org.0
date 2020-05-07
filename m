Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291861C9C7C
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 22:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWnDn-00072O-K0; Thu, 07 May 2020 20:34:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3Wl=6V=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jWnDm-00072J-HI
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 20:34:18 +0000
X-Inumbo-ID: 1fae9406-90a2-11ea-9f78-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fae9406-90a2-11ea-9f78-12813bfff9fa;
 Thu, 07 May 2020 20:34:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6FEFF208CA;
 Thu,  7 May 2020 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588883657;
 bh=K4kKz0E9D4cZDWNdpdaH4tEnjnTvj/V3B4vBoBgTNQ8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=K3ak1FkozC4HXibn3pcZBnK/rWHPTT7SfG65AewkbjlOhD3KQwqV4OferNh4Omfpb
 onv928ukxsrErWR4FmLRtYZ5fBfV9VDOgKTSu4uz3jawJs3c2g3OgYuSbveROKDpFz
 4hxpJw7jcWHOJ5Rm9Iy1dUa8w4BRVgCX3MPaC4h0=
Date: Thu, 7 May 2020 13:34:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14 1/3] xen/arm: atomic: Allow read_atomic() to be
 used in more cases
In-Reply-To: <0db53f23-197c-0dcc-b89f-274597ebc32d@xen.org>
Message-ID: <alpine.DEB.2.21.2005071333480.14706@sstabellini-ThinkPad-T480s>
References: <20200502160700.19573-1-julien@xen.org>
 <20200502160700.19573-2-julien@xen.org>
 <alpine.DEB.2.21.2005071325210.14706@sstabellini-ThinkPad-T480s>
 <0db53f23-197c-0dcc-b89f-274597ebc32d@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 7 May 2020, Julien Grall wrote:
> Hi,
> 
> On 07/05/2020 21:29, Stefano Stabellini wrote:
> > >   #define read_atomic(p) ({
> > > \
> > > -    typeof(*p) __x;                                                     \
> > > -    switch ( sizeof(*p) ) {                                             \
> > > -    case 1: __x = (typeof(*p))read_u8_atomic((uint8_t *)p); break;      \
> > > -    case 2: __x = (typeof(*p))read_u16_atomic((uint16_t *)p); break;    \
> > > -    case 4: __x = (typeof(*p))read_u32_atomic((uint32_t *)p); break;    \
> > > -    case 8: __x = (typeof(*p))read_u64_atomic((uint64_t *)p); break;    \
> > > -    default: __x = 0; __bad_atomic_size(); break;                       \
> > > -    }                                                                   \
> > > -    __x;                                                                \
> > > +    union { typeof(*p) val; char c[0]; } x_;                            \
> > > +    read_atomic_size(p, x_.c, sizeof(*p));                              \
> > 
> > Wouldn't it be better to pass x_ as follows:
> > 
> >      read_atomic_size(p, &x_, sizeof(*p));
> 
> I am not sure to understand this. Are you suggesting to pass a pointer to the
> union?

Yes. Would it cause a problem that I couldn't spot?

