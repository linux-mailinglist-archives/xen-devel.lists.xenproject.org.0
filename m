Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B37EA119
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 17:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631784.985475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Zbx-0004Hd-8C; Mon, 13 Nov 2023 16:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631784.985475; Mon, 13 Nov 2023 16:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Zbx-0004F7-4s; Mon, 13 Nov 2023 16:16:29 +0000
Received: by outflank-mailman (input) for mailman id 631784;
 Mon, 13 Nov 2023 16:16:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7nXK=G2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r2Zbv-0004CZ-2H
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 16:16:27 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcb1225b-823f-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 17:16:23 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso27022555e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 08:16:23 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q25-20020a7bce99000000b004068e09a70bsm8420348wmj.31.2023.11.13.08.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 08:16:22 -0800 (PST)
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
X-Inumbo-ID: fcb1225b-823f-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699892182; x=1700496982; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wM6wQO+oBJ22EzYdEEsUmhhq2/nWAoIa4RjzXuaOkfs=;
        b=QTiuBrENs9EeP/Vfc/CpcWUmL9zbwJ1xj3Tu4C5BUjBTFY2xVgdlNxwG04rJJs/qcH
         V+63GQFktliho8q2cVKf1o/8Q7EUl1/QhWNVurr7dlbHUJoAOrcxEk6vrEybqOW3lyws
         Wpf8RwJu8pT8STe4qTUXMzQf+hlw62TnEKtWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699892182; x=1700496982;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wM6wQO+oBJ22EzYdEEsUmhhq2/nWAoIa4RjzXuaOkfs=;
        b=k3d3dpyFsYGTnEE3BCYkg5TNS2PWZFbE9TXZMC/gYz4nKh3wXV7vTP+DDP5+GGXeX0
         xz4tWsXrXrISi5+JjsWo8CVpIzX/fdGt0P8rS3p/fIkPHcRKHuqSMUcDMjyu76LpDPwl
         elnYCERQzvsK0KB7ZDRRF8fuYvwmtU08tw7RlJETQtOHNyLzkXHoDIF4LO1ltYdggraJ
         GV2goCaHcQLbaFXYMregnBXvvvG1ov0X7+WbzUWp42/I6DTK6V2R480WW0HivwVxgBwi
         QN1zzHFkTQHIDAHl8OSbyKrUk6cr9UyGo9LWmaOeLbaYLGaC3FI39TVwqhUuGjdkczZJ
         xoTg==
X-Gm-Message-State: AOJu0YzlRQsUMRgrHH0GSS9kxHaoXLk4Y8AhbZKs9yvWpA6cobS02HwY
	uZaGgj+RWTLA2Y5/kebU6Gn0Rw==
X-Google-Smtp-Source: AGHT+IFSpS0gR5KrhZDT/NgAv6ZLDR+n/l8ZIzpk4Sukl470lymwyr0KnjjyVDwsEwNi0F0WXYrkng==
X-Received: by 2002:a05:600c:997:b0:406:45c1:4dd with SMTP id w23-20020a05600c099700b0040645c104ddmr10031313wmp.14.1699892182465;
        Mon, 13 Nov 2023 08:16:22 -0800 (PST)
Message-ID: <65524bd6.7b0a0220.5b797.bbc4@mx.google.com>
X-Google-Original-Message-ID: <ZVJHHxj2px2NT+SQ@EMEAENGAAD19049.>
Date: Mon, 13 Nov 2023 15:56:15 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <Michal.Orzel@amd.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Clang-format configuration discussion - pt 1
References: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
 <930d7aa7-7573-97d2-e146-ebe68214c0aa@suse.com>
 <7235E3F4-8387-49D7-A3B6-0EA93CAE408B@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7235E3F4-8387-49D7-A3B6-0EA93CAE408B@arm.com>

On Mon, Nov 13, 2023 at 03:20:53PM +0000, Luca Fancellu wrote:
> 
> 
> > On 13 Nov 2023, at 11:31, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 08.11.2023 10:53, Luca Fancellu wrote:
> > --------------------------------------------------------------------------------------------------------------------------------------------------------------
> >> 
> >> Standard: C++03
> >> 
> >> ---
> >> From the documentation: Parse and format C++ constructs compatible with this standard.
> > 
> > Since I continue to be puzzled - iirc you said this is because of lack
> > of availability of "C99" as a value here. What's entirely unclear to
> > me is: How does this matter to a tool checking coding style (which is
> > largely about formatting, not any lexical or syntactical aspects)?
> > 
> >> This value is used also in Linux.
> > 
> > Considering how different the two styles are, I don't think this is
> > overly relevant.
On C it _shouldn't_ matter because it's meant to affect C++ constructs
only. That said, clang-format doesn't understand (or care) whether the code
is C or C++, because C's syntax is strictly contained in that of C++ as far
as formatting cares.

While I agree it feels wrong to apply a C++ policy to a C project, it's
largely irrelevant. Setting a value here gives more deterministic output
because it fixes several options' default settings. One would hope none of
those settings affect C, but the world is complex and it's better to be
safe than sorry. Particularly when it's an inocuous one-liner.

There aren't strict C values. And Latest or Auto are simply shorthands for
one of the C++ options.

  https://clang.llvm.org/docs/ClangFormatStyleOptions.html#standard

> 
> Ok, maybe I understand your point, you are looking for a reason to declare this configurable instead
> of not specifying it at all?
> 
> If it’s that, from what I understand clang-format will use the default value if we don’t specify anything
> for this one, so it will take ‘Latest’. I think we should put a value for this one to fix it and don’t have
> surprises if that behaviour changes and seeing that also in Linux that value is fixed increased my
> confidence.
> 
> However, if you feel that we should not specify it, I’ve done a test and not specifying it is not changing
> the current output. I can’t say that for a different clang-format version though or if changes happen in the
> future.
> 
IMO, C++03 is as good as any other. As long as it's a fixed one.

Cheers,
Alejandro

