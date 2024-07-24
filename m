Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE4D93ADEE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 10:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763992.1174260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWXMD-00029E-3H; Wed, 24 Jul 2024 08:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763992.1174260; Wed, 24 Jul 2024 08:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWXMC-000266-VO; Wed, 24 Jul 2024 08:28:20 +0000
Received: by outflank-mailman (input) for mailman id 763992;
 Wed, 24 Jul 2024 08:28:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23fT=OY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWXMB-000260-Fx
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 08:28:19 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad6bfa07-4996-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 10:28:17 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4266edee10cso43456025e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 01:28:17 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f93aba72sm18005895e9.37.2024.07.24.01.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 01:28:16 -0700 (PDT)
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
X-Inumbo-ID: ad6bfa07-4996-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721809697; x=1722414497; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pKoqUri68laBZ8jnjxxBrIZrLh5Z5m2ePL2hu34WOEw=;
        b=Tjszsb3gLikVhUF+dAdHa+1WLv0jFe+Eg7wi8dXNWHKllUjDTiBKGq9G796Tr12yCX
         g1B44tcel8IhxvOzJ8kwvnb8zvRWY685BHl9O+VGjy11RD8qfusCNFDiH1ItDQaIxxlm
         TReHFdKx0KY1VrUy/m/ZDMiPFZD2Alb1sEgLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721809697; x=1722414497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKoqUri68laBZ8jnjxxBrIZrLh5Z5m2ePL2hu34WOEw=;
        b=KBf2NxDDqMg3k3/ZjKUcCXlNAU+AkiN2l7hZE59GB45IPd3o47x5CZA1xAKdeyAeqp
         aL0roMckYgg2eBMR58l7RNt3j24oz/O4RO41650CBbKpo63wZ+UMAGkBtyZa2RIfxqIj
         4Aq1nBaVXvduzIflXWhjh+lF4UCWM9JKymIZUxS3XP92DIkQAjA9RZ7sQQVrSccsv7cp
         QPKX8qG+2pagErXhGEWMu9eeH+7Ov2J12Lqlf0wFSqIj6qzrAxYvCCCXg4+RoV5SIyW5
         wTgnFe5TQsX1Lvuefb9/q82Y06ShTz59nDf/A4nyjMhGxGdTkKpm+6gohsJ2vQis4481
         acrw==
X-Forwarded-Encrypted: i=1; AJvYcCU0giXvfYBi4342EhVufQ/1m0/A+W3bndOgF1BeUvVx/vPM2DiUkPbCbaYi0Y/hd/JDDEgXRn1Ay5jSkpnYCmQgR8SSMHCvLsS4OFjCoLc=
X-Gm-Message-State: AOJu0YxufTT3/mP4oTSFEmyVIPAYF56KI3wl55PJa5ji30cX+tfs21av
	k4uxI9NSmoENCTY5D3t+59PVLedE7N+ezpj8cAIsopLHNylECvSZOc0tCYrueys=
X-Google-Smtp-Source: AGHT+IEQiTjnPE/OA0TRCY0TE+B0rHDjebD4cAUoXK3ZmWsEN6s6TtwiI8PDW+tNkcLo09qgCtjd+A==
X-Received: by 2002:a05:600c:1c21:b0:426:6b47:290b with SMTP id 5b1f17b1804b1-427f95ad5b3mr9549595e9.28.1721809696545;
        Wed, 24 Jul 2024 01:28:16 -0700 (PDT)
Date: Wed, 24 Jul 2024 10:28:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] x86/altcall: fix clang code-gen when using
 altcall in loop constructs
Message-ID: <ZqC7Hn8R6Mkyqtpl@macbook>
References: <20240723093117.99487-1-roger.pau@citrix.com>
 <D2X13ED477J8.25JRFH9VEW33O@cloud.com>
 <Zp_VuwxqH3Mii8_W@macbook>
 <D2X237Y7T92R.1VVSBS9MCJOFW@cloud.com>
 <7a5da6ce-0ef0-4666-a5c4-44383469f67e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a5da6ce-0ef0-4666-a5c4-44383469f67e@suse.com>

On Wed, Jul 24, 2024 at 08:39:05AM +0200, Jan Beulich wrote:
> On 23.07.2024 18:24, Alejandro Vallejo wrote:
> > On Tue Jul 23, 2024 at 5:09 PM BST, Roger Pau Monné wrote:
> >> On Tue, Jul 23, 2024 at 04:37:12PM +0100, Alejandro Vallejo wrote:
> >>> On Tue Jul 23, 2024 at 10:31 AM BST, Roger Pau Monne wrote:
> >>>> --- a/xen/arch/x86/include/asm/alternative.h
> >>>> +++ b/xen/arch/x86/include/asm/alternative.h
> >>>> @@ -185,10 +185,10 @@ extern void alternative_branches(void);
> >>>>   */
> >>>>  #define ALT_CALL_ARG(arg, n)                                            \
> >>>>      register union {                                                    \
> >>>> -        typeof(arg) e;                                                  \
> >>>> +        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> >>>>          unsigned long r;                                                \
> >>>>      } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
> >>>> -        .e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })   \
> >>>> +        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> >>>>      }
> >>>>  #else
> >>>>  #define ALT_CALL_ARG(arg, n) \
> >>>
> >>> Don't we want BUILD_BUG_ON(sizeof(long) % sizeof(arg) == 0) instead?
> >>
> >> I think you meant BUILD_BUG_ON(sizeof(long) % sizeof(arg) != 0)?
> > 
> > Bah, yes. I wrote it as a COMPILE_ASSERT().
> > 
> >>
> >>> Otherwise
> >>> odd sizes will cause the wrong union size to prevail, and while I can't see
> >>> today how those might come to happen there's Murphy's law.
> >>
> >> The overall union size would still be fine, because it has the
> >> unsigned long element, it's just that the array won't cover all the
> >> space assigned to the long member?
> > 
> > I explained myself poorly. If the current BUILD_BUG_ON() stays as-is that's
> > right, but...
> > 
> >>
> >> IOW if sizeof(arg) == 7, then we would define an array with only 1
> >> element, which won't make the size of the union change, but won't
> >> cover the same space that's used by the long member.
> > 
> > ... I thought the point of the patch was to cover the full union with the
> > array, and not just a subset. My proposed alternative merely tries to ensure
> > the argument is always a submultiple in size of a long so the array is always a
> > perfect match.

I would be fine with the adjusted BUILD_BUG_ON(), but if we change the
instance for clang we should also update the BUILD_BUG_ON() used on
the gcc counterpart so they both match.  That might be undesirable
however since gcc doesn't exhibit any of those bugs, and hence
shouldn't have such constraints.

> Question is whether there's an issue with odd sized values in Clang. I
> wouldn't want to exclude such (admittedly somewhat exotic) uses "just
> in case". My understanding here is that the issue the patch addresses
> is not merely the treatment of the union by Clang, but the combination
> thereof with it violating the psABI when it comes to passing bool
> around.

So there are at least two issues, one is the lack of truncation of
register value done by the callee, which is a psABI violation.  The
other is clang not resetting the high bits of the register when the
altcall is inside a loop construct.  In the godbolt example provided
the high bits of %rdi are not cleared between loops.  This last issue
would also be 'fixed' if clang implemented the psABI properly and
truncated the register at the callee.

I've given a try in godbolt, and odd structure sizes seem to be
affected:

https://godbolt.org/z/778YsoWsn

We have no usages of such structures in Xen so far.

The only way I've found to cope with this is to use something like:

#define ALT_CALL_ARG(arg, n)                                            \
    union {                                                             \
        typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)];  \
        unsigned long r;                                                \
    } a ## n ## __  = {                                                 \
        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
    };                                                                  \
    register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =      \
        a ## n ## __.r

An oversized array that ensures all the space of the long is covered
by the array, but then we need an extra variable, as we would
otherwise require modifying ALT_CALL{0..6}_OUT to use aX_.r instead of
aX_.

Thanks, Roger.

