Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173DC9F2C08
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 09:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857587.1269810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN6Zq-0003vT-GD; Mon, 16 Dec 2024 08:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857587.1269810; Mon, 16 Dec 2024 08:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN6Zq-0003t8-Da; Mon, 16 Dec 2024 08:35:42 +0000
Received: by outflank-mailman (input) for mailman id 857587;
 Mon, 16 Dec 2024 08:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3c03=TJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tN6Zp-0003t2-Gy
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 08:35:41 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id badda2c8-bb88-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 09:35:39 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso22816625e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 00:35:39 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436362c7d64sm77467795e9.36.2024.12.16.00.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:35:38 -0800 (PST)
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
X-Inumbo-ID: badda2c8-bb88-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734338139; x=1734942939; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b+kCnh5k/m/swwkPB23/AzEj4XU0ioEDBXZoejXDJJk=;
        b=EZyBChE20gqYJLHScX0Hln7FL1g9yK7YZpAk6oDyW3H5LLDKvIO2O40Jehu46JVDCy
         mRuuqggubkIWea+z+N32oYDnKooea+NK1gkPzz6+fs/mtZ5bqURvj0jfOLVkYMPuYvrf
         KEuloKKAYWnY1LBOiBWyi37QTi5GbBmI4HtPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338139; x=1734942939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+kCnh5k/m/swwkPB23/AzEj4XU0ioEDBXZoejXDJJk=;
        b=AQJRg2PIY+lDrcLvGer4Hl9ASCW49guk1yhrTwqhiWKX4NBPSbMZqTRclMjYfBHXdw
         7DoIFap6IdPKeVrMzm3R+7se/09PYiB8Vadwij4mHK2Fm4PsYRPT5CM6fOq/Y09gSbkg
         wDfavaDUyxeP7I2MJU8hHrlv5gkocw9RzBvPgOVaZUe0pqYp/dvtyGPkSqInXvKoELb4
         7T2nQ/te58Ye3rGDckw/p5qr+3cvqjFbrClXpA9f48UwYjrjlK8O8XlHF/YX5l23+1N+
         UfCghcQHZWuI0hdb/ktr+Ltjh5COL/Vy5/8elPiCqI9LbYkt1MeTCi7IDQLQ4uXyd3Q7
         0JlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8RwLyd6YmElj4rbZqREmvb0t8lh4/2mmAeYXrMfbEamA2nCQX2+UUWaRaX6BWp1F7qLOcR7jv+3s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6NEqUQLZ2FA7jNs1AZVhttrzeq5A6oFp7pK/gu8ZlhCsjotjm
	o4zUVCvzJI29aXlClNcKF1NEws69V016RcPBvV5c41JELxYBrvetlF+xCrDwPus=
X-Gm-Gg: ASbGncvl5OFqrBHAKdc65FPO3VCFf3yHGW9SUipTktRWTz8ERGagGayD1JPgoqAO62h
	4qr1RklqfenxZHygpBrLjq+nNcIL5MtPm6ZMJn1m4g2idyUZqmUQ6M60qM/6zwBe7BSq8t8QQj4
	OZTBIvdY7X/R9osx07PpHNG3dC68mVUqb9KNam12r9L4LFuX8nJZfckU75dBZvbwAYDfvu/W6/W
	HQJXG+StKd4gur7iv1f4yTkFfZdK9Xez3K5rzhIgegiWzsOJyI9O+aUTyPHPQ==
X-Google-Smtp-Source: AGHT+IF2AkHOESqAxDd6U9/vIdN3J+EE9lZif0AH9SjNfR2HCQXmTb9lLjLhQjkyBzWFxRyme53vFg==
X-Received: by 2002:a05:600c:2306:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-4362309dd0emr123846055e9.2.1734338139319;
        Mon, 16 Dec 2024 00:35:39 -0800 (PST)
Date: Mon, 16 Dec 2024 09:35:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel
Message-ID: <Z1_mWbWnwNOG64ji@macbook.local>
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
 <226bc9b3-6741-4cb6-917b-1164e340a19d@suse.com>
 <ZwZScGr75xEolDnS@mail-itl>
 <00ac0665-e4ff-4a56-8537-e81573710c3c@suse.com>
 <e3917457-08d4-4f0c-9e0c-1519952ceed9@suse.com>
 <dde4b510-5674-44d0-9493-a0717387b8d6@citrix.com>
 <99089b03-e9f0-4fe8-94b2-11e75f9e5243@suse.com>
 <e7ebec95-e6f0-491f-8fb4-afe7ee505b07@suse.com>
 <ZwZ_IoNFwDjTaFi1@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZwZ_IoNFwDjTaFi1@mail-itl>

Adding Oleksii, as this IMO wants to be a blocker for 4.20.

On Wed, Oct 09, 2024 at 03:03:28PM +0200, Marek Marczykowski-Górecki wrote:
> On Wed, Oct 09, 2024 at 01:38:32PM +0200, Jürgen Groß wrote:
> > On 09.10.24 13:15, Jan Beulich wrote:
> > > On 09.10.2024 13:08, Andrew Cooper wrote:
> > > > On 09/10/2024 11:26 am, Juergen Gross wrote:
> > > > > On 09.10.24 12:19, Jan Beulich wrote:
> > > > > > On 09.10.2024 11:52, Marek Marczykowski-Górecki wrote:
> > > > > > > On Wed, Oct 09, 2024 at 09:19:57AM +0200, Jan Beulich wrote:
> > > > > > > > On 08.10.2024 23:32, Marek Marczykowski-Górecki wrote:
> > > > > > > > > --- a/tools/libs/guest/xg_dom_bzimageloader.c
> > > > > > > > > +++ b/tools/libs/guest/xg_dom_bzimageloader.c
> > > > > > > > > @@ -272,8 +272,7 @@ static int _xc_try_lzma_decode(
> > > > > > > > >        return retval;
> > > > > > > > >    }
> > > > > > > > >    -/* 128 Mb is the minimum size (half-way) documented to work for
> > > > > > > > > all inputs. */
> > > > > > > > > -#define LZMA_BLOCK_SIZE (128*1024*1024)
> > > > > > > > > +#define LZMA_BLOCK_SIZE (256*1024*1024)
> > > > > > > > 
> > > > > > > > That's as arbitrary as before, now just not even with a comment at
> > > > > > > > least
> > > > > > > > hinting at it being arbitrary. Quoting from one of the LZMA API
> > > > > > > > headers:
> > > > > > > > 
> > > > > > > >       * Decoder already supports dictionaries up to 4 GiB - 1 B (i.e.
> > > > > > > >       * UINT32_MAX), so increasing the maximum dictionary size of the
> > > > > > > >       * encoder won't cause problems for old decoders.
> > > > > > > > 
> > > > > > > > IOW - what if the Linux folks decided to increase the dictionary size
> > > > > > > > further? I therefore wonder whether we don't need to make this more
> > > > > > > > dynamic, perhaps by peeking into the header to obtain the dictionary
> > > > > > > > size used. The one thing I'm not sure about is whether there can't be
> > > > > > > > multiple such headers throughout the file, and hence (in principle)
> > > > > > > > differing dictionary sizes.
> > > > > > > 
> > > > > > > What is the purpose of this block size limit? From the error
> > > > > > > message, it
> > > > > > > seems to be avoiding excessive memory usage during decompression (which
> > > > > > > could be DoS via OOM). If that's the case, then taking the limit from
> > > > > > > the kernel binary itself will miss this point (especially in case of
> > > > > > > pygrub or similar, but there may be other cases of not-fully-trusted
> > > > > > > kernel binaries).
> > > > > > 
> > > > > > Indeed. The question then simply is: Where do we want to draw the line
> > > > > > between what we permit and what we reject?
> > > > > 
> > > > > IMHO the most natural solution would be to use guest memory for this
> > > > > purpose.
> > > > > OTOH this probably would require a significant rework of libxenguest.
> > > > 
> > > > That was XSA-25.  There are toolstack-provided limits on kernel&initrd
> > > > sizes.
> > > 
> > > Which probably can't be directly applied to dictionary size used during
> > > (de)compression.
> > 
> > My point still stands: using GUEST memory for all the decompression work
> > would avoid all these problems. If the guest memory isn't sufficient, a
> > decompression by e.g. grub wouldn't work either.
> 
> Doing that would probably require mapping guest memory to dom0 for this
> purpose. And probably quite severe changes to the decompressing code
> (liblzma?) to actually use that memory instead of standard heap. I don't
> think it's a feasible short term fix.
> Theoretically this could be made configurable (if nothing else, then via
> an env variable or even build-time setting...), but honestly it feels
> like an overkill.

As a compromise that could likely be done in time for the release,
would it be feasible to fetch the dictionary size from the header and
cap it at certain boundary using max(<header val>, <boundary>)?

Thanks, Roger.

