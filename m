Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47A4A9AE4E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 15:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966288.1356548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7wG1-0005G7-7h; Thu, 24 Apr 2025 13:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966288.1356548; Thu, 24 Apr 2025 13:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7wG1-0005E0-59; Thu, 24 Apr 2025 13:04:49 +0000
Received: by outflank-mailman (input) for mailman id 966288;
 Thu, 24 Apr 2025 13:04:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnO2=XK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7wFz-0005Du-J2
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 13:04:47 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afbee908-210c-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 15:04:42 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e5e22e6ed2so1539987a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 06:04:42 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ace5989b18esm108713166b.60.2025.04.24.06.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 06:04:40 -0700 (PDT)
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
X-Inumbo-ID: afbee908-210c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745499881; x=1746104681; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QssEnrGD2EwZ6qzBcru0FLwNyMDPdFsjKaD8SQlH8NQ=;
        b=iuL0aBPEzDNWo8gKGdj3bq6e8ma8lId1Xe3nWxeWGwMPZwjxiz+lvXnwLgApAFRkIu
         Tzovxvl42SRP0rPoZoQTVAHxYyh9Ae/xyoYt2P81Yl64TwSUjBU7OMBvvBpjljNgDTcs
         ijgPb2JRXu6nAmNCtgYGspTXuiUQNPfSTv3ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499881; x=1746104681;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QssEnrGD2EwZ6qzBcru0FLwNyMDPdFsjKaD8SQlH8NQ=;
        b=PGa9+pXanzIXV22CbAN3JDC3ttQ8vhaNFupZdz3gDJg6qxhvHmqrZnX6Zcp7pbS/ae
         kh82poQJZrmnJVErs6S8OE6SOrKbElokUU9RalxfYcgT4qsEu8Uv+QOwWKVLWHMq8nvg
         FjvMTydZe7z1bkVTxEqQ79yav0IMvRqL+d+SDknc0osTP3a8MBS42L1Tzqo+Qn1N2lLK
         vgmxNRzt5Rg9BNkqs4tQNU9ME50DOFgyaouc5BwtBtDVCdHeokm9AMAMjjMbCFDrIN1H
         s6VTX7G0ZoF/GKKdfixp47GWUDT2o+3+Wb69GLE3fvZqgDYI8FhPqDcK6mlt0kGIaBgk
         BqBg==
X-Gm-Message-State: AOJu0Yy/WGBaO2y+km9oMP3kv7NNLWSjcLSJ2GxdvSgKSjm+DmrUl1W7
	fPd1LtF4rr8zI3p9ravi086XJQhrDOGZgUmqHaCF2id2Hqz+CmPQD+AjOV6deGs=
X-Gm-Gg: ASbGncveWSmR7gZ6RWr11PYTg1QTZUTDZHclzPDhqX6GWL7KFecGDrpwe683Z3QMxt3
	kniUM0pi+twG25gqglOd1ZMWXCTd+ilmA1UdrOLi6iIwBxrLnGMH4KFxo4qgYmfNwrcksIYOjkL
	B4PCeu56ALHfVbuwnE8Zf6upWytuHZAby1dOeibvEMEN+H5d6dqZA8qH/enuIch8X/SjfNVn/xG
	IXF73d+Odmp//TVPdP2a4/UsqkfDUpj2OwfBXNv4sbXHPFsHz4kxG4Yl5yDACfZzVxRCn/QhNI0
	WPE5UMva0NuZAOQ0jtgLvNTmbApl6Ogvcg5F7fKNx8WSM8pIwL/7x1lI
X-Google-Smtp-Source: AGHT+IHrWrO6QNZRBttyti0vbEu/3H2+JZPnONDvO3+v9YKgS2gzqdSNORLKsbn2lL1NrIGA6A1wLQ==
X-Received: by 2002:a17:907:9726:b0:ac7:391a:e2d3 with SMTP id a640c23a62f3a-ace57608f0emr253738466b.58.1745499881333;
        Thu, 24 Apr 2025 06:04:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 15:04:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: fix buffer over-read in bitmap_to_xenctl_bitmap()
Message-ID: <aAo250IiFOC1Hggg@macbook.lan>
References: <20250424103841.94828-1-roger.pau@citrix.com>
 <041d4bd5-962c-4600-b436-0ec214a6c6ca@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <041d4bd5-962c-4600-b436-0ec214a6c6ca@citrix.com>

On Thu, Apr 24, 2025 at 12:41:43PM +0100, Andrew Cooper wrote:
> On 24/04/2025 11:38 am, Roger Pau Monne wrote:
> > There's an off-by-one when calculating the last byte in the input array to
> > bitmap_to_xenctl_bitmap(), which leads to bitmaps with sizes multiple of 8
> > to over-read and incorrectly use a byte past the end of the array.
> 
> /sigh
> 
> > While there also ensure that bitmap_to_xenctl_bitmap() is not called with a
> > bitmap of 0 length.
> >
> > Fixes: 288c4641c80d ('xen: simplify bitmap_to_xenctl_bitmap for little endian')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> You ought to note that this is only not getting an XSA because
> 288c4641c80d isn't in a released Xen yet.

Yeah, I did explicitly check this wasn't backported to any stable
branches.

> > ---
> >  xen/common/bitmap.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
> > index bf1a7fd91e36..415d6bc074f6 100644
> > --- a/xen/common/bitmap.c
> > +++ b/xen/common/bitmap.c
> > @@ -369,6 +369,12 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
> >      const uint8_t *bytemap;
> >      uint8_t last, *buf = NULL;
> >  
> > +    if ( !nbits )
> > +    {
> > +	ASSERT_UNREACHABLE();
> > +	return -EILSEQ;
> > +    }
> 
> I don't see any hypercalls performing a bits==0 check, so I expect this
> is reachable.

bitmap_to_xenctl_bitmap() has just two callers, one passes nr_cpu_ids,
the other MAX_NUMNODES.  I think there are no callers that pass 0,
much less from hypercall provided values.

> > +
> >      if ( !IS_ENABLED(LITTLE_ENDIAN) )
> >      {
> >          buf = xmalloc_array(uint8_t, xen_bytes);
> > @@ -396,7 +402,7 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
> >       * their loops to 8 bits. Ensure we clear those left over bits so as to
> >       * prevent surprises.
> >       */
> > -    last = bytemap[nbits / 8];
> > +    last = bytemap[(nbits - 1) / 8];
> >      if ( nbits % 8 )
> >          last &= (1U << (nbits % 8)) - 1;
> >  
> 
> This (preexisting) logic is mad.  The overwhelming majority of cases are
> going to be a multiple of 8, and as you notice, the 0 case can't be
> fixed like this.

It's indeed a weird logic.  The usage of last should be restricted to
nbits % 8 != 0, and the rest of the cases handled directly by the
copy_to_guest() call above this logic.

> It should all be inside a copy_bytes conditional as is done in
> xenctl_bitmap_to_bitmap().

I could do it like that, but seeing the values passed by the only two
callers it seemed less churn to add early check and assert.

Thanks, Roger.

