Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF38BACC458
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 12:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004196.1383857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOus-0001Sp-QK; Tue, 03 Jun 2025 10:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004196.1383857; Tue, 03 Jun 2025 10:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOus-0001RN-NE; Tue, 03 Jun 2025 10:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1004196;
 Tue, 03 Jun 2025 10:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V7Ic=YS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uMOur-0001Pz-Hh
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 10:30:45 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce160493-4065-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 12:30:44 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso54777115e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 03:30:44 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-450d8000f3esm158682575e9.23.2025.06.03.03.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 03:30:43 -0700 (PDT)
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
X-Inumbo-ID: ce160493-4065-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748946644; x=1749551444; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Qcc1ZQtdUX84i6GJLDoeihRG+X6QiJugMzgDRCUCpA=;
        b=Xhhuo0+E9xO7vpZOSNF/vGnJNHA4r0FSqh4O9vifjmCDDaw2Xb+pgMsffdH2UxXM0m
         lfX5LgMx1lKfKT0uz+7tVYvdkCAxZfYIQSvp5etdcPeseUww+vXnV2o41NzDgUbfHN4E
         dwsoDLE52z5IL2k0fr3dJD8S7m+z2tTxBJVN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946644; x=1749551444;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qcc1ZQtdUX84i6GJLDoeihRG+X6QiJugMzgDRCUCpA=;
        b=kEAR8Ee2camLmbEFzNe5GEuq0dvO+AqIuFQFdmlbxuKsxI+OMfrnFuwnqYvQXvrfjn
         Tfsjv+WruMQiS5wmynTrXh/inymFk3sX5oyobmP4uSVZSIL5n0yp1NZDjPqVlXL8MsqF
         CmrT35PEOFNEv4vpZ6VCegLGbx/N9otMlCa3CYWEK79IPxXpCy66+QXouwDu49DchBzc
         UftldKQr4n1UkR9HXrVXV65npKEZcdI6XshsyrqBG4Ik9s6l4y4BQ8fm2a+zcX0+nb91
         8i87jGFUymOYkDlrtVba0w0YxBwHSAPxi0uN6MRbnNp/P+jyJTz6gphmDaIsBUeqvGb4
         ZRcQ==
X-Gm-Message-State: AOJu0YwFVUNv/GVVpfSROg8vjSt46BWgbUHbFqy2IUkQLJXurqOhj3Xo
	jrgsJLP2XMsi9SiGUQFc1wu+igm3WQnYxjuP51jYku6Bw023dQuwNbC16UMQgUa+16E=
X-Gm-Gg: ASbGnctLou5jnV37sKzlcZzAvH5Q4lcc5TNQ0i3R6NJlXPj5FdrP+SHJeszypq1BxDB
	Y7FL0S+ysYwgdR1WKwHwogYx23k5x9zn/sWoNKkaaasMRJ59LP3eyqybrKZGdst8WVQTlDBQvn7
	yg2Cw+AKUBeY8EMVyblrE/+DeDsIxlGfrLq1Xuy1yVAbnVPOHQjAv1g4w7Ys2wENr9/FnocYf1P
	ITYoKRGbRfK/3kkdTMd8m2bTGrERKdd+0CDVv5MOdd+W0u+1j57kG7Y/vuBv03S+3BoRKj4yrAp
	600wOMazo1aivN35+KOijPpxwq01nI2LElwrnk/zsgzDE97D/M9eFN9CoLqDrbUtHWuJ08JRiOl
	4i3BsoSoTzH29pkL8dDFo+/Du
X-Google-Smtp-Source: AGHT+IHPToY1EEAsDqnXwPsSiO1r/W26mAt0+pUwtxoUtKs7JfjMV89Hngtgs3qrdlyjjRrWq+2hCA==
X-Received: by 2002:a05:600c:8b0f:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-4511ecbbdc4mr94366225e9.1.1748946643561;
        Tue, 03 Jun 2025 03:30:43 -0700 (PDT)
Date: Tue, 3 Jun 2025 12:30:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tests/vpci: Use $(CC) instead of $(HOSTCC)
Message-ID: <aD7O0nsfuKbKwlnD@macbook.local>
References: <20250602150929.10679-1-michal.orzel@amd.com>
 <aD6aVzDZ4zDyEBHV@macbook.local>
 <6438a00b-a0fe-419d-b57e-5e1af48d43ce@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6438a00b-a0fe-419d-b57e-5e1af48d43ce@amd.com>

On Tue, Jun 03, 2025 at 08:52:38AM +0200, Orzel, Michal wrote:
> 
> 
> On 03/06/2025 08:46, Roger Pau Monné wrote:
> > On Mon, Jun 02, 2025 at 05:09:29PM +0200, Michal Orzel wrote:
> >> These tests are supposed to run on target. HOSTCC can be different than
> >> CC (when cross-compiling). At the moment, tests installation would put
> >> a binary of a wrong format in the destdir.
> >>
> >> Fixes: e90580f25bd7 ("vpci: introduce basic handlers to trap accesses to the PCI config space")

Hm, it's unclear to me whether this is the correct fixes tag.
Previous to:

96a587a05736 tools/tests: Add install target for vPCI

The test was not installed on the host, and hence didn't need to use
CC instead of HOSTCC (or at least that's my understating).

> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >>  tools/tests/vpci/Makefile | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
> >> index 9450f7593a41..1101a669e118 100644
> >> --- a/tools/tests/vpci/Makefile
> >> +++ b/tools/tests/vpci/Makefile
> >> @@ -11,7 +11,7 @@ run: $(TARGET)
> >>  	./$(TARGET)
> >>  
> >>  $(TARGET): vpci.c vpci.h list.h main.c emul.h
> >> -	$(HOSTCC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
> >> +	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
> > 
> > This was already posted in:
> > 
> > https://lore.kernel.org/xen-devel/20230313121226.86557-1-roger.pau@citrix.com/
> > 
> > And got no feedback.
> > 
> > I'm happy for your change to go in, but you might also consider
> > picking up the run target adjustment part of that previous patch.
> You're the maintainer of this file. You should tell me what I need to do
> unless you want to wait for Anthony feedback.

I would also add the chunk to adjust the run target if you use CC
instead of HOSTCC.

Thanks, Roger.

