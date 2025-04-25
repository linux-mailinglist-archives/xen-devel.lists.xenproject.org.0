Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89432A9C2B5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 11:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967527.1357309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Eyp-0002CP-OR; Fri, 25 Apr 2025 09:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967527.1357309; Fri, 25 Apr 2025 09:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Eyp-0002AS-Lp; Fri, 25 Apr 2025 09:04:19 +0000
Received: by outflank-mailman (input) for mailman id 967527;
 Fri, 25 Apr 2025 09:04:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYju=XL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u8Eyn-00028H-L4
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 09:04:17 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43fd6b5f-21b4-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 11:04:16 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e5dce099f4so2573058a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 02:04:16 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ace6e4fb5ecsm103892866b.71.2025.04.25.02.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:04:15 -0700 (PDT)
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
X-Inumbo-ID: 43fd6b5f-21b4-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745571856; x=1746176656; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gXw5c/60i0Mi9KAHkjWTEIxPqnyGs1rQ8Sz7Lxi8/rQ=;
        b=ueY40tXsqO6fi+XgbuKM3dl71xQpNvHjai+JkKhdgvetLr9Ii9pHuu+DTxJl6hQtat
         xVQ3tRqbAn8KbmUZZZUOO7rgxnUcib9MwIb5ZPaVT3bCuHHKjxKIRAcU7tUse+yeZkJF
         1LkfXgakfKLrIoygtfy4ac6bVagPLvpPZyqYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571856; x=1746176656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXw5c/60i0Mi9KAHkjWTEIxPqnyGs1rQ8Sz7Lxi8/rQ=;
        b=Y04uEWZuxP5MLD9O0205BEa1hIeyGu/cwmlHpWVchYR5I8kaen/iQalg5YGcvjccZq
         Jx00ATsx4+VfXiioWkbRYz4VeK9LLrVEajEEoZVG379JAa2Sb6fMuCkmJy3iX1uXkrCj
         0kTd8vhXMPMmF95o9q17eOWTdRH9AOfKjuKUXank62Vbp+uDnRSyBbTEDJGNIY8MdZx8
         6u0fkOnJOTomXGAhhai6qCvKsY3LDDlZkXExlaY439PqZt7ONsbj4CZ5kXfrKFZr0e6O
         GJUn8vfnUzEk5B1s7ZDtH1D0wiaLOlkAO0HBHpl+8ixibQTsfKtoyk85b2MOoDZ69iGK
         4Hjg==
X-Gm-Message-State: AOJu0Yw4q6mY9PIGrx+7eLFb/FmveBvwmd3uD2c6L1n6Wt7hdTRzLLFt
	n2WPpI07Uytp4e9BpqvbzbyacMBEhUynLzGEnvJalJtbBRQYnL/8FRyC0Un4FHQ=
X-Gm-Gg: ASbGncuA1naXZI4A/bR6yNMxGHSRlvqIcYGzOQ3NGLubmfMOaqpwe/5i/OzYNgH77Nc
	tuU0Lr8/f9FpNgIFXlPIStjXBdPKB8uQ4mq9ENsQDnrB3SVn9QzN3PUs3VbOm8pwQjUtU8cwTn5
	E78PyM0p2VN47xQZt3owqNTa76QMs5IoVnRm7pEF9VRdrpK4ksgwmHFUYvk5KhQLnxYlQmq7Ge4
	zUyZtNkQh1cdz9VGmD8/HGT1TRTcqUKxwrOekqaXKD/tnysSA405Djrgj40LJd+eK6ZSqaaRFmo
	z8Xe+iDhGZomol99l5+MfVTOHMgnG3J9cVx7To03nBeOyg==
X-Google-Smtp-Source: AGHT+IEdMO5vSSwD596/jS/Ac+HGkzczarJqsHfBND2LhHPbEtH8FkUESPaScY5ZgEAG69N9mbScaw==
X-Received: by 2002:a17:907:9721:b0:ace:3a1b:d3d with SMTP id a640c23a62f3a-ace71047f9dmr128238466b.2.1745571856236;
        Fri, 25 Apr 2025 02:04:16 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:04:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: fix buffer over-read in bitmap_to_xenctl_bitmap()
Message-ID: <aAtQDwHmaSJVh-3k@macbook.lan>
References: <20250424103841.94828-1-roger.pau@citrix.com>
 <041d4bd5-962c-4600-b436-0ec214a6c6ca@citrix.com>
 <aAo250IiFOC1Hggg@macbook.lan>
 <f425b237-dd89-4800-96c7-08072a3f67e3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f425b237-dd89-4800-96c7-08072a3f67e3@suse.com>

On Fri, Apr 25, 2025 at 10:54:36AM +0200, Jan Beulich wrote:
> On 24.04.2025 15:04, Roger Pau Monné wrote:
> > On Thu, Apr 24, 2025 at 12:41:43PM +0100, Andrew Cooper wrote:
> >> On 24/04/2025 11:38 am, Roger Pau Monne wrote:
> >>> There's an off-by-one when calculating the last byte in the input array to
> >>> bitmap_to_xenctl_bitmap(), which leads to bitmaps with sizes multiple of 8
> >>> to over-read and incorrectly use a byte past the end of the array.
> >>
> >> /sigh
> >>
> >>> While there also ensure that bitmap_to_xenctl_bitmap() is not called with a
> >>> bitmap of 0 length.
> >>>
> >>> Fixes: 288c4641c80d ('xen: simplify bitmap_to_xenctl_bitmap for little endian')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> You ought to note that this is only not getting an XSA because
> >> 288c4641c80d isn't in a released Xen yet.
> > 
> > Yeah, I did explicitly check this wasn't backported to any stable
> > branches.
> > 
> >>> ---
> >>>  xen/common/bitmap.c | 8 +++++++-
> >>>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
> >>> index bf1a7fd91e36..415d6bc074f6 100644
> >>> --- a/xen/common/bitmap.c
> >>> +++ b/xen/common/bitmap.c
> >>> @@ -369,6 +369,12 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
> >>>      const uint8_t *bytemap;
> >>>      uint8_t last, *buf = NULL;
> >>>  
> >>> +    if ( !nbits )
> >>> +    {
> >>> +	ASSERT_UNREACHABLE();
> >>> +	return -EILSEQ;
> >>> +    }
> >>
> >> I don't see any hypercalls performing a bits==0 check, so I expect this
> >> is reachable.
> > 
> > bitmap_to_xenctl_bitmap() has just two callers, one passes nr_cpu_ids,
> > the other MAX_NUMNODES.  I think there are no callers that pass 0,
> > much less from hypercall provided values.
> 
> Still I don't think there should be an assertion here, not even an error.
> As much as memcpy(x, y, 0) is okay, it ought to be okay to invoke this
> function for entirely void bitmaps.

OK, are we fine then with just returning early if bits == 0?  No
assert and no error.

Thanks, Roger.

